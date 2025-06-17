GLOBAL_LIST_INIT(deadite_animal_migration_points, list())
#define BB_DEADITE_MIGRATION_PATH "deadite_migration_path"
#define BB_DEADITE_MIGRATION_TARGET "deadite_migration_target"

/obj/effect/landmark/events/deadite_animal_migration_point
	name = "Deadite Migration Point"
	var/order = 0

/obj/effect/landmark/events/deadite_animal_migration_point/Initialize(mapload)
	. = ..()
	GLOB.deadite_animal_migration_points += src
	icon_state = ""
	if(!order)
		order = 1

/proc/cmp_deadite_migration_point_asc(obj/effect/landmark/events/deadite_animal_migration_point/A, obj/effect/landmark/events/deadite_animal_migration_point/B)
	return A.order - B.order

/proc/get_sorted_migration_points()
	var/list/points = GLOB.deadite_animal_migration_points.Copy()
	sortTim(points, GLOBAL_PROC_REF(cmp_deadite_migration_point_asc))
	return points

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

/datum/round_event/deadite_migration/start()
	. = ..()
	var/list/sorted_points = get_sorted_migration_points()
	// Build full migration path with all points
	var/list/migration_turfs = list()
	for(var/obj/effect/landmark/events/deadite_animal_migration_point/point in sorted_points)
		var/turf/T = get_turf(point)
		if(T)
			migration_turfs += T

	if(!length(migration_turfs))
		return
	
	var/turf/start_turf = migration_turfs[1]
	var/turf/end_turf = migration_turfs[migration_turfs.len]

	var/mob/living/simple_animal/hostile/retaliate/rogue/animal = pick(animals)
	for(var/i = 1 to rand(3, 5))
		var/mob/living/simple_animal/hostile/retaliate/rogue/created = new animal(start_turf)
		if(created.ai_controller)
			var/list/migration_path = list()
			var/list/ai_controller_paths = list()
			for(var/turf/T in migration_turfs)
				migration_path += WEAKREF(T)
			ai_controller_paths |=/datum/ai_planning_subtree/deadite_migration
			for(var/datum/ai_planning_subtree/tree as anything in created.ai_controller.planning_subtrees)
				ai_controller_paths |= tree.type
			created.ai_controller.replace_planning_subtrees(ai_controller_paths)

			// Set migration data
			created.ai_controller.set_blackboard_key(BB_DEADITE_MIGRATION_PATH, migration_path)
			created.ai_controller.set_blackboard_key(BB_DEADITE_MIGRATION_TARGET, end_turf)

			// Prioritize migration behavior
			var/datum/ai_planning_subtree/migration_subtree = SSai_controllers.ai_subtrees[/datum/ai_planning_subtree/deadite_migration]
			created.ai_controller.planning_subtrees.Insert(1, migration_subtree)
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

/datum/ai_behavior/find_next_deadite_migration_step
	behavior_flags = AI_BEHAVIOR_REQUIRE_MOVEMENT
	action_cooldown = 1 SECONDS

/datum/ai_behavior/find_next_deadite_migration_step/setup(datum/ai_controller/controller, path_key, target_key)
	. = ..()
	// Immediately set movement target during setup
	var/list/path = controller.blackboard[path_key]
	if(!length(path))
		return FALSE

	var/datum/weakref/next_ref = path[1]
	var/turf/next_turf = next_ref.resolve()

	if(QDELETED(next_turf))
		return FALSE
	
	// Set movement target REQUIRED for AI_BEHAVIOR_REQUIRE_MOVEMENT
	controller.current_movement_target = next_turf
	return TRUE

/datum/ai_behavior/find_next_deadite_migration_step/perform(seconds_per_tick, datum/ai_controller/controller, path_key, target_key)
	var/list/path = controller.blackboard[path_key]
	if(!length(path))
		return ..() // Fail if no path

	var/datum/weakref/next_ref = path[1]
	path.Cut(1,2) // Remove first element
	var/turf/next_turf = next_ref.resolve()

	if(QDELETED(next_turf))
		return ..() // Fail if invalid turf

	controller.set_blackboard_key(target_key, next_turf)
	return ..() // Succeed

/datum/ai_planning_subtree/deadite_migration

/datum/ai_planning_subtree/deadite_migration/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	// Check if we're at current target
	var/turf/migration_target = controller.blackboard[BB_DEADITE_MIGRATION_TARGET]
	if(!QDELETED(migration_target) && get_dist(controller.pawn, migration_target) > 1)
		// Ensure movement target is set
		if(!controller.current_movement_target)
			controller.current_movement_target = migration_target

		controller.queue_behavior(/datum/ai_behavior/travel_towards, BB_DEADITE_MIGRATION_TARGET)
		return // Focus on moving to current target
	else if(!QDELETED(migration_target))
		controller.clear_blackboard_key(BB_DEADITE_MIGRATION_TARGET)

	// Get next migration target
	var/list/migration_path = controller.blackboard[BB_DEADITE_MIGRATION_PATH]
	if(LAZYLEN(migration_path))
		controller.queue_behavior(/datum/ai_behavior/find_next_deadite_migration_step, BB_DEADITE_MIGRATION_PATH, BB_DEADITE_MIGRATION_TARGET)
		return SUBTREE_RETURN_FINISH_PLANNING
