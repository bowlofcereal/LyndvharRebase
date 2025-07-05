////////////////SUMMONING RITUALS///////////////////
/datum/runerituals/summoning
	name = "summoning ritual parent"
	desc = "summoning parent rituals."
	blacklisted = TRUE

/datum/runerituals/summoning/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	return summon_ritual_mob(user, loc, mob_to_summon)

/datum/runerituals/summoning/proc/summon_ritual_mob(mob/living/user, turf/loc, mob/living/mob_to_summon)
	var/mob/living/simple_animal/summoned
	if(isliving(mob_to_summon))
		summoned = mob_to_summon
	else
		summoned = new mob_to_summon(loc)
		ADD_TRAIT(summoned, TRAIT_PACIFISM, TRAIT_GENERIC)	//can't kill while planar bound.
		summoned.status_flags += GODMODE//It's not meant to be killable until released from it's planar binding.
		summoned.candodge = FALSE
		animate(summoned, color = "#ff0000",time = 5)
		summoned.move_resist = MOVE_FORCE_EXTREMELY_STRONG
		summoned.binded = TRUE
		summoned.SetParalyzed(900)
		return summoned

/datum/runerituals/summoning/imp
	name = "summoning lesser infernal"
	desc = "summons an infernal imp"
	blacklisted = FALSE
	tier = 1
	required_atoms = list(/obj/item/ash = 2, /obj/item/magic/obsidian = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/infernal/imp

/datum/runerituals/summoning/hellhound
	name = "summoning hellhound"
	desc = "summons a hellhound"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/obj/item/magic/infernalash = 3, /obj/item/magic/obsidian = 2, /obj/item/magic/melded/t1 = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/infernal/hellhound

/datum/runerituals/summoning/watcher
	name = "summoning infernal watcher"
	desc = "summons an infernal watcher"
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/obj/item/magic/hellhoundfang = 2, /obj/item/magic/obsidian = 2, /obj/item/magic/melded/t2 =1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/infernal/watcher

/datum/runerituals/summoning/archfiend
	name = "summoning fiend"
	desc = "summons an fiend"
	blacklisted = FALSE
	tier = 4
	required_atoms = list(/obj/item/magic/infernalcore = 1, /obj/item/magic/obsidian = 3, /obj/item/magic/melded/t3 =1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/infernal/fiend

/datum/runerituals/summoning/sprite
	name = "summoning sprite"
	desc = "summons an fae sprite"
	blacklisted = FALSE
	tier = 1
	required_atoms = list(/obj/item/reagent_containers/food/snacks/grown/manabloom = 1, /obj/item/reagent_containers/food/snacks/grown/berries/rogue = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/fae/sprite

/datum/runerituals/summoning/glimmer
	name = "summoning glimmerwing"
	desc = "summons an fae spirit"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/obj/item/reagent_containers/food/snacks/grown/manabloom = 2, /obj/item/magic/fairydust = 3, /obj/item/magic/melded/t1 = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/fae/glimmerwing

/datum/runerituals/summoning/dryad
	name = "summoning dryad"
	desc = "summons an drayd"
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/obj/item/reagent_containers/food/snacks/grown/manabloom = 2, /obj/item/magic/iridescentscale = 2, /obj/item/magic/melded/t2 = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/fae/dryad

/datum/runerituals/summoning/sylph
	name = "summoning sylph"
	desc = "summons an archfae"
	blacklisted = FALSE
	tier = 4
	required_atoms = list(/obj/item/reagent_containers/food/snacks/grown/manabloom = 1, /obj/item/magic/heartwoodcore = 1, /obj/item/magic/melded/t3 = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/fae/sylph

/datum/runerituals/summoning/crawler
	name = "summoning elemental crawler"
	desc = "summons a minor elemental"
	blacklisted = FALSE
	tier = 1
	required_atoms = list(/obj/item/natural/stone = 2, /obj/item/magic/manacrystal = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/elemental/crawler

/datum/runerituals/summoning/warden
	name = "summoning elemental warden"
	desc = "summons an elemental"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/obj/item/magic/elementalmote = 3, /obj/item/magic/manacrystal = 2, /obj/item/magic/melded/t1 = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/elemental/warden

/datum/runerituals/summoning/behemoth
	name = "summoning elemental behemoth"
	desc = "summons a large elemental"
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/obj/item/magic/elementalshard = 2, /obj/item/magic/manacrystal = 2, /obj/item/magic/melded/t2 =1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/elemental/behemoth

/datum/runerituals/summoning/collossus
	name = "summoning elemental collous"
	desc = "summons an huge elemental"
	blacklisted = FALSE
	tier = 4
	required_atoms = list(/obj/item/magic/elementalfragment = 1, /obj/item/magic/manacrystal = 1, /obj/item/magic/melded/t3 =1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/elemental/colossus

/datum/runerituals/summoning/abberant
	name = "summoning abberant from the void"
	desc = "summons a long forgotten creature"
	blacklisted = FALSE
	tier = 4
	required_atoms = list(/obj/item/magic/melded/t5 =1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/voiddragon

