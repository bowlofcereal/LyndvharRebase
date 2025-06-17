GLOBAL_LIST_INIT(deadite_animal_migration_points, list())

/obj/effect/landmark/events/deadite_animal_migration_point
	name = "Deadite Migration Point"

/obj/effect/landmark/events/deadite_animal_migration_point/Initialize(mapload)
	. = ..()
	GLOB.deadite_animal_migration_points += src
	icon_state = ""

/datum/round_event_control/deadite_animal_migration
	name = "Deadite Animal Migration"
	track = EVENT_TRACK_MODERATE
	typepath = /datum/round_event/deadite_migration/deadite
	weight = 10
	max_occurrences = 2
	min_players = 30
	earliest_start = 20 MINUTES

	tags = list(
		TAG_TRICKERY,
		TAG_UNEXPECTED,
	)

/datum/round_event/deadite_migration
	var/list/animals = list()
	var/static/list/valid_travel_points = \
	list("townouter")

/datum/round_event/deadite_migration/start()
	. = ..()
	var/list/points = list()
	for(var/obj/structure/fluff/migration_point/point in GLOB.migrationpoints)
		if(point.pointid != "townouter")
			continue
		points |= point

	var/turf/end_turf = get_turf(pick(points))
	var/mob/living/simple_animal/hostile/retaliate/rogue/animal = pick(animals)
	for(var/i = 1 to rand(3, 5))
		var/turf/start_turf = get_turf(pick(GLOB.deadite_animal_migration_points))
		var/mob/living/simple_animal/hostile/retaliate/rogue/created = new animal(start_turf)
		if(created.ai_controller)
			created.ai_controller.set_blackboard_key(BB_WANDER_POINT, end_turf)
			var/list/ai_controller_paths = list()
			ai_controller_paths |= /datum/ai_planning_subtree/travel_to_point/and_clear_target/wander
			for(var/datum/ai_planning_subtree/tree as anything in created.ai_controller.planning_subtrees)
				ai_controller_paths |= tree.type
			created.ai_controller.replace_planning_subtrees(ai_controller_paths)
			created.ai_controller.CancelActions()
			created.ai_controller.clear_blackboard_key(BB_BASIC_MOB_CURRENT_TARGET)

			created.ai_controller.set_blackboard_key(BB_WANDER_POINT, end_turf)
		else
			created.GiveTarget(end_turf)

/datum/round_event/deadite_migration/deadite
	animals = list(
		/mob/living/simple_animal/hostile/retaliate/rogue/wolf,
	)

//Snowflake marker for migrations. Dun_world got rid of travel tiles, so we snowflake it up in this bitch.
/obj/structure/fluff/migration_point
	name = "migration point"
	icon = 'icons/mob/landmarks.dmi'
	icon_state = "x"
	invisibility = INVISIBILITY_ABSTRACT
	density = FALSE
	anchored = TRUE
	max_integrity = 0
	var/pointid = "REPLACETHIS"

/datum/round_event_control/deadite_animal_migration/canSpawnEvent(players_amt, gamemode, fake_check)
	if(!LAZYLEN(GLOB.migrationpoints) || !LAZYLEN(GLOB.deadite_animal_migration_points))
		return FALSE

/obj/structure/fluff/migration_point/Initialize(mapload)
	. = ..()
	GLOB.migrationpoints += src
