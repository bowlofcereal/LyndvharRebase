/datum/job/roguetown/hosp_knight
	title = "Knight Hospitaler"
	f_title = "Dame Hospitaler"
	flag = HOSP_KNIGHT
	department_flag = CHURCHMEN
	faction = "Station"
	tutorial = "The knight hospitalers are knights who have sworn an oath to the church. They serve in the hospital wing of the church,\
	 and they are tasked with providing medical aids and healing to those in need. Despite the more passive nature of their duties,\
	they are still formidable warriors and are trained to excel with specific weapon type and combat style, they are also trained to ride steeds."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = ALL_CLERIC_PATRONS
	outfit = /datum/outfit/job/roguetown/hosp_knight
	min_pq = 1
	max_pq = null
	total_positions = 3
	spawn_positions = 3
	display_order = JDO_HOSP_KNIGHT
	give_bank_account = TRUE
	cmode_music = 'sound/music/combat_holy.ogg'
	advclass_cat_rolls = list(CTAG_KNIGHTHOSP = 20)

/datum/job/roguetown/hosp_knight/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/hospitaler))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "hospitaler's tabard ([index])"
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Sir"
		if(should_wear_femme_clothes(H))
			honorary = "Dame"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"

		for(var/X in peopleknowme)
			for(var/datum/mind/MF in get_minds(X))
				if(MF.known_people)
					MF.known_people -= prev_real_name
					H.mind.person_knows_me(MF)

/datum/outfit/job/roguetown/hosp_knight
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/tabard/hospitaler
	gloves = /obj/item/clothing/gloves/roguetown/chain
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	belt = /obj/item/storage/belt/rogue/leather/black
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(/obj/item/roguekey/church = 1, /obj/item/clothing/neck/roguetown/psicross/astrata = 1)

/datum/outfit/job/roguetown/hosp_knight/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.change_stat("strength", 3)
		H.change_stat("perception", 2)
		H.change_stat("constitution", 5)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)




/// SCHOOL OF THE LANCE


/datum/advclass/hosp/lance
	name = "School of the Lance"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with polearms, along with some familiarity in swords, shields and riding."
	outfit = /datum/outfit/job/roguetown/hosp/lance

	category_tags = list(CTAG_KNIGHTHOSP)

/datum/outfit/job/roguetown/hosp/lance/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE) //Polearms are pretty much explicitly a two-handed weapon, so I gave them a polearm option.
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)	// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)	// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)		// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)

	H.adjust_blindness(-3)
	var/weapons = list("Halberd","Bardische","Eaglebeak")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Halberd")
			r_hand = /obj/item/rogueweapon/halberd
			backl = /obj/item/gwstrap
		if("Bardische")
			r_hand =  /obj/item/rogueweapon/halberd/bardiche
			backl = /obj/item/gwstrap
		if("Eaglebeak")
			r_hand = /obj/item/rogueweapon/eaglebeak
			backl = /obj/item/gwstrap

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

/// SCHOOL OF THE SWORD


/datum/advclass/hosp/sword
	name = "School of the Sword"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with swords of all sizes, shields and riding."
	outfit = /datum/outfit/job/roguetown/hosp/sword

	category_tags = list(CTAG_KNIGHTHOSP)

/datum/outfit/job/roguetown/hosp/sword/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)	// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)	// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)		// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)

	H.adjust_blindness(-3)
	var/weapons = list("Zweihander","Bastard Sword","Steel Greatsword")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Zweihander")
			r_hand = /obj/item/rogueweapon/greatsword/zwei
			backl = /obj/item/gwstrap
		if("Bastard Sword")
			r_hand =  /obj/item/rogueweapon/sword/long
			backl = /obj/item/rogueweapon/shield/heater
		if("Steel Greatsword")
			r_hand = /obj/item/rogueweapon/greatsword
			backl = /obj/item/gwstrap
	
	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]



/// SCHOOL OF THE AXE


/datum/advclass/hosp/axe
	name = "School of the Axe"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with axes of all sizes, shields and riding."
	outfit = /datum/outfit/job/roguetown/hosp/axe

	category_tags = list(CTAG_KNIGHTHOSP)

/datum/outfit/job/roguetown/hosp/axe/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)	// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)	// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)		// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)

	H.adjust_blindness(-3)
	var/weapons = list("Battle Axe","Steel Great Axe","Great Double-Headed Axe")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Battle Axe")
			r_hand = /obj/item/rogueweapon/stoneaxe/battle
			backl = /obj/item/gwstrap
		if("Steel Great Axe")
			r_hand = /obj/item/rogueweapon/greataxe/steel
			backl = /obj/item/gwstrap
		if("Great Double-Headed Axe")
			r_hand = /obj/item/rogueweapon/greataxe/steel/doublehead
			backl = /obj/item/gwstrap

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]


/// SCHOOL OF THE MACE


/datum/advclass/hosp/mace
	name = "School of the Mace"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with mace, flail hammers, shields and riding."
	outfit = /datum/outfit/job/roguetown/hosp/mace

	category_tags = list(CTAG_KNIGHTHOSP)

/datum/outfit/job/roguetown/hosp/mace/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)	// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)	// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)		// HOSPITALER MEDICAL SKILL
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_blindness(-3)

	var/weapons = list("Goden Mace","Steel Warhammer","Flail")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Goden Mace")
			r_hand = /obj/item/rogueweapon/mace/goden
			backl = /obj/item/gwstrap
		if("Steel Warhammer")
			r_hand = /obj/item/rogueweapon/mace/warhammer/steel
			backl = /obj/item/gwstrap
		if("Flail")
			r_hand = /obj/item/rogueweapon/flail
			backl = /obj/item/gwstrap

	var/helmets = list(
		"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
		"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
		"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
		"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
		"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
		"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
		"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
		"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/klappvisier,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Brigandine"		= /obj/item/clothing/suit/roguetown/armor/brigandine,
		"Coat of Plates"	= /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates,
		"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/half,
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]



