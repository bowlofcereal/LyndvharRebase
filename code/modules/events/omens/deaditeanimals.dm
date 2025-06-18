GLOBAL_LIST_INIT(deadite_animal_migration_points, list())
#define BB_DEADITE_MIGRATION_PATH "deadite_migration_path"
#define BB_DEADITE_MIGRATION_TARGET "deadite_migration_target"
#define BB_DEADITE_TRAVEL_TARGET "deadite_travel_target"

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
	
	var/turf/start_turf = migration_turfs[2]
	var/turf/spawn_turf = migration_turfs[1]
	var/turf/end_turf = migration_turfs[migration_turfs.len]

	var/mob/living/simple_animal/hostile/retaliate/rogue/animal = pick(animals)
	for(var/i = 1 to rand(1, 1))
		var/mob/living/simple_animal/hostile/retaliate/rogue/created = new animal(spawn_turf)
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
			created.ai_controller.set_blackboard_key(BB_DEADITE_MIGRATION_TARGET, start_turf)
			created.ai_controller.set_blackboard_key(BB_DEADITE_TRAVEL_TARGET, start_turf)

			// Add migration behavior
			var/datum/ai_planning_subtree/migration_subtree = SSai_controllers.ai_subtrees[/datum/ai_planning_subtree/deadite_migration]
			created.ai_controller.planning_subtrees.Insert(1, migration_subtree)
		else
			created.GiveTarget(end_turf)

/datum/round_event/deadite_migration/deadite
	animals = list(
		/mob/living/simple_animal/hostile/retaliate/rogue/wolf,
	)

/datum/round_event_control/deadite_animal_migration/canSpawnEvent(players_amt, gamemode, fake_check)
	if(!LAZYLEN(GLOB.deadite_animal_migration_points))
		return FALSE

/datum/ai_behavior/find_next_deadite_migration_step
	action_cooldown = 5 SECONDS

/datum/ai_behavior/find_next_deadite_migration_step/setup(datum/ai_controller/controller, path_key, target_key)
	. = ..()

/datum/ai_behavior/find_next_deadite_migration_step/perform(seconds_per_tick, datum/ai_controller/controller, path_key, target_key)
	if(controller.blackboard[BB_DEADITE_TRAVEL_TARGET])
		//Safety check that will crash the behavior if we SOMEHOW end up here whilst we have a travel behavior going (bad)
		return FALSE

	to_chat(world, span_bigbold("[controller.pawn.name]: find_next_deadite_migration_step/PERFORM CALLED"))
	var/list/path = controller.blackboard[path_key]
	if(!LAZYLEN(path))
		to_chat(world, span_bigbold("[controller.pawn.name]: find_next_deadite_migration_step/setup: Path empty, returning FALSE"))
		return FALSE

	var/atom/current_blackboard_target = controller.blackboard[target_key]
	var/current_index = 0

	for(var/i in 1 to LAZYLEN(path))
		var/datum/weakref/ref = path[i]
		if(ref.resolve() == current_blackboard_target)
			current_index = i
			to_chat(world, span_bigbold("[controller.pawn.name]: find_next_deadite_migration_step/setup: Found target at index [current_index]"))
			break

	var/target_path_index = 0
	if(current_index == 0)
		target_path_index = 1
		to_chat(world, span_bigbold("[controller.pawn.name]: find_next_deadite_migration_step/setup: No current target, setting to 1st point"))
	else
		target_path_index = current_index + 1
		to_chat(world, span_bigbold("[controller.pawn.name]: find_next_deadite_migration_step/setup: Advancing to index [target_path_index]"))

	target_path_index = min(target_path_index, LAZYLEN(path))

	var/datum/weakref/next_ref = path[target_path_index]
	var/turf/next_turf = next_ref.resolve()

	if(QDELETED(next_turf))
		to_chat(world, span_bigbold("[controller.pawn.name]: find_next_deadite_migration_step/setup: Next turf QDELETED, returning FALSE"))
		return FALSE

	controller.set_blackboard_key(target_key, next_turf)
	controller.set_blackboard_key(BB_DEADITE_TRAVEL_TARGET, next_turf)
	to_chat(world, span_bigbold("[controller.pawn.name]: find_next_deadite_migration_step/setup: Blackboard target set to [next_turf]"))
	finish_action(controller, TRUE, path_key, target_key)

/datum/ai_planning_subtree/deadite_migration
	var/travel_behavior = /datum/ai_behavior/travel_towards/stop_on_arrival

/datum/ai_planning_subtree/deadite_migration/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()
	to_chat(world, span_bigbold("[controller.pawn.name]: deadite_migration/SelectBehaviors CALLED"))

	var/turf/migration_target_turf = controller.blackboard[BB_DEADITE_MIGRATION_TARGET]
	var/list/migration_path = controller.blackboard[BB_DEADITE_MIGRATION_PATH]
	var/turf/mob_turf = get_turf(controller.pawn)
	var/current_distance = get_dist(mob_turf, migration_target_turf)
	to_chat(world, span_bigbold("[controller.pawn.name]: Blackboard target: [migration_target_turf]"))
	to_chat(world, span_bigbold("[controller.pawn.name]: Pawn turf: [mob_turf]"))

	var/at_current_target = FALSE
	to_chat(world, span_bigbold("Distance between pawn and turf: [current_distance]"))
	if(migration_target_turf && current_distance == 0)
		at_current_target = TRUE
		to_chat(world, span_bigbold("[controller.pawn.name]: Is at current target"))

	//If we have a target that's valid, we're not yet there, and the travel behavior hasn't finished the last point yet.
	if(migration_target_turf && !QDELETED(migration_target_turf) && !at_current_target && controller.blackboard[BB_DEADITE_TRAVEL_TARGET])
		to_chat(world, span_bigbold("[controller.pawn.name]: Target valid and not at target. QUEUEING travel_to_atom_behavior to [migration_target_turf]"))
		controller.queue_behavior(travel_behavior, BB_DEADITE_TRAVEL_TARGET)
		return SUBTREE_RETURN_FINISH_PLANNING

	else
		to_chat(world, span_bigbold("[controller.pawn.name]: At target or target invalid/deleted. Checking next step."))
		var/current_index = 0
		if(migration_target_turf)
			for(var/i in 1 to LAZYLEN(migration_path))
				var/datum/weakref/ref = migration_path[i]
				if(ref.resolve() == migration_target_turf)
					current_index = i
					to_chat(world, span_bigbold("[controller.pawn.name]: Current target found in path at index [current_index]"))
					break

		if(current_index == LAZYLEN(migration_path) && LAZYLEN(migration_path) > 0)
			to_chat(world, span_bigbold("[controller.pawn.name] has reached the end of its migration path!"))
			controller.clear_blackboard_key(BB_DEADITE_MIGRATION_PATH)
			controller.clear_blackboard_key(BB_DEADITE_MIGRATION_TARGET)
			controller.replace_planning_subtrees(initial(controller.planning_subtrees))
			return SUBTREE_RETURN_FINISH_PLANNING

		else if(LAZYLEN(migration_path))
			to_chat(world, span_bigbold("[controller.pawn.name]: Path exists and not at end. QUEUEING find_next_deadite_migration_step"))
			controller.queue_behavior(/datum/ai_behavior/find_next_deadite_migration_step,
				BB_DEADITE_MIGRATION_PATH,
				BB_DEADITE_MIGRATION_TARGET)
			return SUBTREE_RETURN_FINISH_PLANNING

		to_chat(world, span_bigbold("[controller.pawn.name]: No migration path left or other condition met. Subtree finishing."))
		return
