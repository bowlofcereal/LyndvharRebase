/datum/job/roguetown/manatarms
	title = "Man-at-Arms"
	f_title = "Woman-at-Arms"
	flag = MANATARMS
	department_flag = GARRISON
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	selection_color = JCOLOR_SOLDIER

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	tutorial = "You are a member of the march's garrison, you were either hired or levied to serve your liege and fight in their name. \
	You answer to the Master-at-Arms, the Knights and the Marshall, therefore are expected to follow their orders."
	display_order = JDO_MANATARMS
	whitelist_req = TRUE

	outfit = /datum/outfit/job/roguetown/manatarms
	advclass_cat_rolls = list(CTAG_MENATARMS = 20)

	give_bank_account = 16
	min_pq = 0
	max_pq = null
	round_contrib_points = 2

	cmode_music = 'sound/music/combat_bog.ogg'

/datum/outfit/job/roguetown/manatarms  

	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather/black
	backr = /obj/item/storage/backpack/rogue/satchel/black

/datum/job/roguetown/manatarms/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")



// SPEARMAN


/datum/advclass/manatarms/spearman
	name = "Spear Infantry"
	tutorial = "You are trained in fighting using polearms, and also short blades should your foe get too close.\
	You are also issued and trained with wearing medium armors. Furthermore, you were also taught novice \
	horseriding skills in order to serve as a light cavalry in time of need."
	outfit = /datum/outfit/job/roguetown/manatarms/spearman

	category_tags = list(CTAG_MENATARMS)

/datum/outfit/job/roguetown/manatarms/spearman/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/slings, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.change_stat("strength", 4) // seems kinda lame but remember guardsman bonus!!
	H.change_stat("endurance", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 2)
	H.change_stat("perception", 1)

		//Makes up for worse shirt protection with kinda better armor protection
	r_hand = /obj/item/rogueweapon/spear
	backl = /obj/item/gwstrap
	beltr = /obj/item/rogueweapon/mace/cudgel
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	H.adjust_blindness(-3)

	var/helmets = list(
		"Sallet Helmet" 	= /obj/item/clothing/head/roguetown/helmet/sallet,
		"Kettle Helmet"		= /obj/item/clothing/head/roguetown/helmet/kettle,
		"Wide Kettle Helmet" = /obj/item/clothing/head/roguetown/helmet/kettle/wide,
		"Skull Cap"		= /obj/item/clothing/head/roguetown/helmet/skullcap,
		"Nasal Helmet"		= /obj/item/clothing/head/roguetown/helmet,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Iron Haubergeon" = /obj/item/clothing/suit/roguetown/armor/chainmail/iron,	
		"Iron Breastplate"	= /obj/item/clothing/suit/roguetown/armor/plate/half/iron,
		"Hardened Leather Coat"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat,
		"Studded Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/studded
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]




	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)
	H.verbs |= /mob/proc/haltyell


// SWORDSMAN

/datum/advclass/manatarms/swordsman
	name = "Sword Infantry"
	tutorial = "You are trained in fighting using swords and shields. \
	You are also issued and trained with wearing medium armors. Furthermore, you were also taught novice \
	horseriding skills in order to serve as a light cavalry in time of need."
	outfit = /datum/outfit/job/roguetown/manatarms/swordsman

	category_tags = list(CTAG_MENATARMS)

/datum/outfit/job/roguetown/manatarms/swordsman/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/slings, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.change_stat("strength", 4) // seems kinda lame but remember guardsman bonus!!
	H.change_stat("endurance", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 2)
	H.change_stat("perception", 1)

	r_hand = /obj/item/rogueweapon/sword
	backl = /obj/item/rogueweapon/shield/heater
	beltr = /obj/item/rogueweapon/mace/cudgel
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	H.adjust_blindness(-3)

	H.verbs |= /mob/proc/haltyell
	var/helmets = list(
		"Sallet Helmet" 	= /obj/item/clothing/head/roguetown/helmet/sallet,
		"Kettle Helmet"		= /obj/item/clothing/head/roguetown/helmet/kettle,
		"Wide Kettle Helmet" = /obj/item/clothing/head/roguetown/helmet/kettle/wide,
		"Skull Cap"		= /obj/item/clothing/head/roguetown/helmet/skullcap,
		"Nasal Helmet"		= /obj/item/clothing/head/roguetown/helmet,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Iron Haubergeon" = /obj/item/clothing/suit/roguetown/armor/chainmail/iron,	
		"Iron Breastplate"	= /obj/item/clothing/suit/roguetown/armor/plate/half/iron,
		"Hardened Leather Coat"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat,
		"Studded Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/studded
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)
	
// AXEMAN

/datum/advclass/manatarms/axeman
	name = "Axe Infantry"
	tutorial = "You are trained in fighting using axes and shields. \
	You are also issued and trained with wearing medium armors. Furthermore, you were also taught novice \
	horseriding skills in order to serve as a light cavalry in time of need."
	outfit = /datum/outfit/job/roguetown/manatarms/axeman

	category_tags = list(CTAG_MENATARMS)

/datum/outfit/job/roguetown/manatarms/axeman/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/slings, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.change_stat("strength", 4) // seems kinda lame but remember guardsman bonus!!
	H.change_stat("endurance", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 2)
	H.change_stat("perception", 1)

	r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/steel
	backl = /obj/item/rogueweapon/shield/heater
	beltr = /obj/item/rogueweapon/mace/cudgel
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	H.adjust_blindness(-3)

	var/helmets = list(
		"Sallet Helmet" 	= /obj/item/clothing/head/roguetown/helmet/sallet,
		"Kettle Helmet"		= /obj/item/clothing/head/roguetown/helmet/kettle,
		"Wide Kettle Helmet" = /obj/item/clothing/head/roguetown/helmet/kettle/wide,
		"Skull Cap"		= /obj/item/clothing/head/roguetown/helmet/skullcap,
		"Nasal Helmet"		= /obj/item/clothing/head/roguetown/helmet,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Iron Haubergeon" = /obj/item/clothing/suit/roguetown/armor/chainmail/iron,	
		"Iron Breastplate"	= /obj/item/clothing/suit/roguetown/armor/plate/half/iron,
		"Hardened Leather Coat"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat,
		"Studded Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/studded
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)
	H.verbs |= /mob/proc/haltyell




/// ARCHER


/datum/advclass/manatarms/archer
	name = "Archer"
	tutorial = "You are trained in fighting using bows and also short blades should your foe get too close. You are also trained with novice \
	horseriding skills in order to serve as a scout cavalry in time of need.\
	However, you are not trained in the use of shields and are only able to wear light armor, but, you are very good at dodging.\
	You are also given basic training on how to use firearms."

	outfit = /datum/outfit/job/roguetown/manatarms/archer

	category_tags = list(CTAG_MENATARMS)

/datum/outfit/job/roguetown/manatarms/archer/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/slings, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 3, TRUE)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

	H.change_stat("strength", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("perception", 4)

	r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	backl = /obj/item/quiver/arrows
	beltr = /obj/item/rogueweapon/sword/short
	pants = /obj/item/clothing/under/roguetown/trou/leather
	cloak = /obj/item/clothing/cloak/stabard/guard
	H.adjust_blindness(-3)

	var/helmets = list(
		"Sallet Helmet" 	= /obj/item/clothing/head/roguetown/helmet/sallet,
		"Kettle Helmet"		= /obj/item/clothing/head/roguetown/helmet/kettle,
		"Wide Kettle Helmet" = /obj/item/clothing/head/roguetown/helmet/kettle/wide,
		"Skull Cap"		= /obj/item/clothing/head/roguetown/helmet/skullcap,
		"Nasal Helmet"		= /obj/item/clothing/head/roguetown/helmet,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/heavy,	
		"Studded Armor"	= /obj/item/clothing/suit/roguetown/armor/leather/studded,
		"Leather Coat"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat,
		"Studded Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/studded
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)
/// ARBALESTIER


/datum/advclass/manatarms/arbalestier
	name = "Arbalestier"
	tutorial = "You are trained in fighting using crossbows and also short blades should your foe get too close. You are also trained with novice \
	horseriding skills in order to serve as a scout cavalry in time of need.\
	However, you are not trained in the use of shields and are only able to wear light armor, but, you are very good at dodging.\
	You are also given basic training on how to use firearms."
	outfit = /datum/outfit/job/roguetown/manatarms/arbalestier

	category_tags = list(CTAG_MENATARMS)

/datum/outfit/job/roguetown/manatarms/arbalestier/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/slings, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 3, TRUE)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

	H.change_stat("strength", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("perception", 4)

	r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	backl = /obj/item/quiver/bolts
	beltr = /obj/item/rogueweapon/sword/short
	pants = /obj/item/clothing/under/roguetown/trou/leather
	cloak = /obj/item/clothing/cloak/stabard/guard
	H.adjust_blindness(-3)

	var/helmets = list(
		"Sallet Helmet" 	= /obj/item/clothing/head/roguetown/helmet/sallet,
		"Kettle Helmet"		= /obj/item/clothing/head/roguetown/helmet/kettle,
		"Wide Kettle Helmet" = /obj/item/clothing/head/roguetown/helmet/kettle/wide,
		"Skull Cap"		= /obj/item/clothing/head/roguetown/helmet/skullcap,
		"Nasal Helmet"		= /obj/item/clothing/head/roguetown/helmet,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/heavy,	
		"Studded Armor"	= /obj/item/clothing/suit/roguetown/armor/leather/studded,
		"Leather Coat"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat,
		"Studded Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/studded
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)

/*
/// ARQUEBUSIER
/datum/advclass/manatarms/arquebusier
	name = "Arquebusier"
	tutorial = "You are trained in fighting using firearms and also short blades should your foe get too close. You are also trained with novice \
	horseriding skills in order to serve as a scout cavalry in time of need.\
	However, you are not trained in the use of shields and are only able to wear light armor, but, you are very good at dodging.\
	You are also given basic training on how to use bows and crossbows."
	outfit = /datum/outfit/job/roguetown/manatarms/arquebusier

	category_tags = list(CTAG_MENATARMS)

/datum/outfit/job/roguetown/manatarms/arquebusier/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/slings, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 3, TRUE)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

	H.change_stat("strength", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("perception", 4)

	r_hand = /obj/item/gun/ballistic/arquebus
	l_hand = /obj/item/powderflask
	beltl = /obj/item/ammopouch/bullets
	beltr = /obj/item/rogueweapon/sword/short
	pants = /obj/item/clothing/under/roguetown/trou/leather
	cloak = /obj/item/clothing/cloak/stabard/guard
	H.adjust_blindness(-3)

	var/helmets = list(
		"Sallet Helmet" 	= /obj/item/clothing/head/roguetown/helmet/sallet,
		"Kettle Helmet"		= /obj/item/clothing/head/roguetown/helmet/kettle,
		"Wide Kettle Helmet" = /obj/item/clothing/head/roguetown/helmet/kettle/wide,
		"Skull Cap"		= /obj/item/clothing/head/roguetown/helmet/skullcap,
		"Nasal Helmet"		= /obj/item/clothing/head/roguetown/helmet,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/heavy,	
		"Studded Armor"	= /obj/item/clothing/suit/roguetown/armor/leather/studded,
		"Leather Coat"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat,
		"Studded Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/studded
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)
*/
