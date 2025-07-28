/datum/job/roguetown/greater_skeleton
	title = "Greater Skeleton"
	flag = SKELETON
	department_flag = SLOP
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	min_pq = null //no pq
	max_pq = null
	announce_latejoin = FALSE

	advclass_cat_rolls = list(CTAG_NSKELETON = 20)

	tutorial = "You are bygone. A wandering has-been. But maybe your luck has not run out, yet.."

	outfit = /datum/outfit/job/roguetown/greater_skeleton/necro
	show_in_credits = FALSE
	give_bank_account = FALSE
	hidden_job = TRUE

/datum/outfit/job/roguetown/greater_skeleton/pre_equip(mob/living/carbon/human/H)
	..()

	H.set_patron(/datum/patron/inhumen/zizo)

	H.possible_rmb_intents = list(/datum/rmb_intent/feint,\
	/datum/rmb_intent/aimed,\
	/datum/rmb_intent/riposte,\
	/datum/rmb_intent/strong,\
	/datum/rmb_intent/weak)
	H.swap_rmb_intent(num=1)

	var/datum/antagonist/new_antag = new /datum/antagonist/skeleton()
	H.mind.add_antag_datum(new_antag)

/datum/job/roguetown/greater_skeleton/after_spawn(mob/living/L, mob/M, latejoin = FALSE)
	..()

	var/mob/living/carbon/human/H = L
	H.advsetup = TRUE
	H.invisibility = INVISIBILITY_MAXIMUM
	H.become_blind("advsetup")


/*
NECRO SKELETONS
*/


/datum/outfit/job/roguetown/greater_skeleton/necro
	wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/aalloy
	pants = /obj/item/clothing/under/roguetown/chainlegs/kilt/aalloy
	head = /obj/item/clothing/head/roguetown/helmet/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots

/datum/advclass/greater_skeleton/necro/shambler
	name = "Decrepit Shambler"
	tutorial = "One of many to come. One of many to go."
	outfit = /datum/outfit/job/roguetown/greater_skeleton/necro/shambler

	category_tags = list(CTAG_NSKELETON)

/datum/outfit/job/roguetown/greater_skeleton/necro/shambler/pre_equip(mob/living/carbon/human/H)
	..()

	H.STASTR = prob(2) ? 20 : rand(12,14)
	H.STAPER = rand(10,12)
	H.STASPD = rand(8,10)
	H.STACON = rand(9,11)
	H.STAEND = rand(12,15)
	H.STAINT = 1

	//light labor skills for skeleton manual labor and some warrior-adventurer skills, equipment is still bad probably
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)

	H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)

	shirt = prob(50) ? /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant : /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l
	var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in list("Spear", "Axe", "Sword", "Warhammer")
	switch(weapon_choice)
		if("Spear")
			r_hand = /obj/item/rogueweapon/spear/aalloy
			H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		if ("Warhammer")
			r_hand = /obj/item/rogueweapon/mace/warhammer/alloy
			H.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		if("Axe")
			r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/aaxe
			H.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
		if("Sword")
			r_hand = /obj/item/rogueweapon/sword
			H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
