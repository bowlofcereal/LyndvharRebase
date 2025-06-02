/obj/effect/mob_spawner/goblins
	name = "goblin spawner"
	desc = "A spawner for goblins."
	anchored = TRUE
	density = FALSE
	ambush_mobs = list(
		/mob/living/simple_animal/hostile/retaliate/rogue/goblin = 3,
		/mob/living/carbon/human/species/goblin/npc = 3,
	)
//	text_faction = "Goblins" //for spawning string
//	objfaction = list("goblins")
