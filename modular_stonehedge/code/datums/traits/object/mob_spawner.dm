/// TAKEN FROM STONEHEDGE OR DREAMKEEP

/*
GLOBAL_VAR_INIT(total_spawned_mobs, 0)
GLOBAL_VAR_INIT(max_total_spawned_mobs, 400) // New global variable for the total limit

/obj/effect/mob_spawner
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "random_loot"
	var/spawn_timer
	var/max_spawned_mobs = 1
	var/mobs_to_spawn = 0
	var/current_spawned_mobs = 0
	var/spawn_interval = 3600 //6 minutes
	var/temporary = FALSE
	var/spawn_range = 10 //radius in which mobs can be spawned
	var/player_range = 15 //range at which a nearby player will pause the spawner
	var/list/ambush_mobs = list(/mob/living/carbon/human/species/skeleton/npc/ambush = 20)
	var/list/adventurer_landmarks = list() // Store landmarks here
	var/area/valid_area = /area/rogue //Useful for randomly generated maps, will delete spawners created outside this area.
	var/turf/accepted_turf = /turf/open/floor/rogue

/obj/effect/mob_spawner/Initialize()
	. = ..() // Call the parent constructor
	adventurer_landmarks = get_all_adventurer_landmarks() //prevents spawners from being placed near player spawns
	if (!is_in_valid_area(src))
		return INITIALIZE_HINT_QDEL  // Delete the spawner if it's not in the valid area
	else
		start_spawning()

/obj/effect/mob_spawner/proc/start_spawning()
	spawn_timer = addtimer(CALLBACK(src, PROC_REF(spawn_and_continue)), spawn_interval, TIMER_STOPPABLE)

/obj/effect/mob_spawner/proc/spawn_and_continue()
	if (GLOB.total_spawned_mobs < GLOB.max_total_spawned_mobs && current_spawned_mobs < max_spawned_mobs)
		spawn_random_mobs(mobs_to_spawn)
	start_spawning()
	if (temporary)
		QDEL_IN(src, 30)
		return

/obj/effect/mob_spawner/proc/spawn_random_mobs(num_to_spawn)
	var/spawn_chance = 100 // 100% chance to spawn if conditions are met
	if (prob(spawn_chance) && GLOB.total_spawned_mobs < GLOB.max_total_spawned_mobs)
		var/turf/spawn_turf
		var/mob_type
		var/mob/new_mob
		var/i = 0
		while (i < num_to_spawn && GLOB.total_spawned_mobs < GLOB.max_total_spawned_mobs)
			spawn_turf = get_random_valid_turf()
			if (spawn_turf)
				mob_type = pickweight(ambush_mobs)
				new_mob = new mob_type(spawn_turf)
				if (new_mob)
					current_spawned_mobs++
					GLOB.total_spawned_mobs++
					RegisterSignal(new_mob, COMSIG_PARENT_QDELETING, PROC_REF(on_mob_destroy))
			i++

/obj/effect/mob_spawner/proc/get_random_valid_turf()
	var/list/valid_turfs = list()
	for (var/turf/T in range(spawn_range, src))
		if (is_valid_spawn_turf(T))
			valid_turfs += T
	if (valid_turfs.len == 0)
		return null
	return pick(valid_turfs)

/obj/effect/mob_spawner/proc/is_valid_spawn_turf(turf/T)
	if (!(istype(T, accepted_turf)))
		return FALSE
	if (istype(T, /turf/closed))
		return FALSE
	if (!is_in_valid_area(T))
		return FALSE
	for (var/L in adventurer_landmarks)
		if (get_dist(T, L) < 10)
			return FALSE
	if (players_nearby(T, player_range))
		return FALSE
	return TRUE

/obj/effect/mob_spawner/proc/is_in_valid_area(atom/A)
	var/area/area_check = get_area(A)
	return istype(area_check, valid_area)

/obj/effect/mob_spawner/proc/get_all_adventurer_landmarks()
	var/list/landmarks = list()
	for (var/obj/effect/landmark/start/adventurer/L in world)
		landmarks += L
	for (var/obj/effect/landmark/start/adventurerlate/L in world)
		landmarks += L
	return landmarks

/obj/effect/mob_spawner/proc/on_mob_destroy(mob/M)
	UnregisterSignal(M, COMSIG_PARENT_QDELETING)
	current_spawned_mobs = max(0, current_spawned_mobs - 1)
	GLOB.total_spawned_mobs = max(0, GLOB.total_spawned_mobs - 1)

/obj/effect/mob_spawner/proc/players_nearby(turf/T, distance)
	for (var/mob/living/carbon/human/H in range(distance, T))
		if (H.client)
			return TRUE
	return FALSE


/// SPAWNERS FOR SPECIFIC MOB TYPES


/obj/effect/mob_spawner/goblin
	max_spawned_mobs = 8
	mobs_to_spawn = 4
	spawn_interval = 3000 //5 minutes. Do not touch this, it needs to be low enough to spawn in mobs before players get to the dungeon.
	spawn_range = 9
	player_range = 13
	ambush_mobs = list(
		/mob/living/carbon/human/species/goblin/npc = 6,
		/mob/living/carbon/human/species/goblin/npc/cave = 4,
		/mob/living/simple_animal/hostile/retaliate/rogue/goblin = 3,
		/mob/living/simple_animal/hostile/retaliate/rogue/goblin/cave = 3,
		)

/obj/effect/mob_spawner/skeleton
	max_spawned_mobs = 6
	mobs_to_spawn = 3
	spawn_interval = 3600
	spawn_range = 10
	player_range = 15
	ambush_mobs = list(
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/shield = 40,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/xbow = 30,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard = 20,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard_spear = 20,
		/mob/living/carbon/human/species/skeleton/dwarf = 20,
		/mob/living/carbon/human/species/skeleton/dwarf/npc/dungeon = 20,
		/mob/living/carbon/human/species/skeleton/npc/dungeon = 30,
			)

/obj/effect/mob_spawner/minotaur
	max_spawned_mobs = 4
	mobs_to_spawn = 2
	spawn_interval = 3600
	spawn_range = 10
	player_range = 15
	ambush_mobs = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 20,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/female = 20,
	/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/axe/female = 5)

/obj/effect/mob_spawner/mossback
	max_spawned_mobs = 4
	mobs_to_spawn = 2
	spawn_interval = 3000
	spawn_range = 10
	player_range = 15
	accepted_turf = /turf/open/water/cleanshallow
	ambush_mobs = list(/mob/living/simple_animal/hostile/retaliate/rogue/mossback)

/obj/effect/mob_spawner/wilderness
	max_spawned_mobs = 6
	mobs_to_spawn = 3
	spawn_interval = 3000
	spawn_range = 15
	player_range = 20
	accepted_turf = /turf/open/floor/rogue/dirt
	ambush_mobs = list(/mob/living/simple_animal/hostile/retaliate/rogue/saiga = 10,
	/mob/living/simple_animal/hostile/retaliate/rogue/saiga/saigabuck = 15,
	/mob/living/simple_animal/hostile/retaliate/rogue/goat = 10,
	/mob/living/simple_animal/hostile/retaliate/rogue/goatmale = 15,
	/mob/living/simple_animal/hostile/retaliate/rogue/trufflepig = 15)

/obj/effect/mob_spawner/wilderness/hostile
	max_spawned_mobs = 4
	mobs_to_spawn = 2
	spawn_interval = 6000
	ambush_mobs = list(/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 10,
	/mob/living/simple_animal/hostile/retaliate/rogue/spider = 5,
	/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 15)

/obj/effect/mob_spawner/skeleton/lich
	max_spawned_mobs = 10
	mobs_to_spawn = 10
	spawn_interval = 3000
	spawn_range = 7
	player_range = 20
	ambush_mobs = list(
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/shield/lich = 20,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/xbow/lich = 20,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard/lich = 20,
		/mob/living/simple_animal/hostile/rogue/skeleton/guard/crypt_guard_spear/lich = 20,
		/mob/living/carbon/human/species/skeleton/npc/dungeon/lich = 10)

/obj/effect/mob_spawner/temporary/lich/boss
	max_spawned_mobs = 1
	mobs_to_spawn = 1
	spawn_interval = 3000
	spawn_range = 0
	player_range = 1
	temporary = TRUE
	ambush_mobs = list(/mob/living/simple_animal/hostile/retaliate/rogue/boss/lich)
*/
