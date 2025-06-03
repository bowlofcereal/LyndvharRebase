/datum/job/roguetown/templar
	title = "Templar Sergeant"
	f_title = "Templar Maiden"
	flag = TEMPLAR
	department_flag = CHURCHMEN
	faction = "Station"
	tutorial = "The templars sergeants are crusaders who have pledged their swords to the church. They are the sword and shield of the church,\
	 and they are tasked with protecting the faithful from the dangers of the world. They are trained to fight with a variety of weapons\
	and are very formidabel in combat."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = ALL_CLERIC_PATRONS
	outfit = /datum/outfit/job/roguetown/templar
	min_pq = 1
	max_pq = null
	total_positions = 3
	spawn_positions = 3
	round_contrib_points = 3
	display_order = JDO_TEMPLAR
	give_bank_account = TRUE
	cmode_music = 'sound/music/combat_holy.ogg'
	advclass_cat_rolls = list(CTAG_TEMPLAR = 20)

/datum/job/roguetown/templar/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/tabard/crusader))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "crusader's tabard ([index])"
		var/prev_real_name = H.real_name
		for(var/X in peopleknowme)
			for(var/datum/mind/MF in get_minds(X))
				if(MF.known_people)
					MF.known_people -= prev_real_name
					H.mind.person_knows_me(MF)

/datum/outfit/job/roguetown/templar
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	cloak = /obj/item/clothing/cloak/tabard/crusader
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather/black
	backr = /obj/item/storage/backpack/rogue/satchel/black

/datum/outfit/job/roguetown/templar/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.change_stat("strength", 3)
		H.change_stat("perception", 2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)



/datum/advclass/templar/default
	name = "Templar Sergeant"
	tutorial = "You're trained to use a variety of weapons at novice levels, and are able to wear medium armors."
	outfit = /datum/outfit/job/roguetown/templar/default

	category_tags = list(CTAG_TEMPLAR)

/datum/outfit/job/roguetown/templar/default/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell

	H.adjust_blindness(-3)
	var/weapons = list("Sword and Shield", "Bastard Sword", "Axe and Shield", "Hammer and Shield", "Spear")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Axe and Shield")
			r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/steel
			backl = /obj/item/rogueweapon/shield/heater
		if("Bastard Sword")
			r_hand = /obj/item/rogueweapon/sword/long
		if("Sword and Shield")
			r_hand = /obj/item/rogueweapon/sword
			backl = /obj/item/rogueweapon/shield/heater
		if("Hammer and Shield")
			r_hand = /obj/item/rogueweapon/mace/warhammer
			backl = /obj/item/rogueweapon/shield/heater
		if("Spear")
			r_hand = /obj/item/rogueweapon/spear
			backl = /obj/item/gwstrap

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
		"Common Brigandine"	= /obj/item/clothing/suit/roguetown/armor/brigandine/light,
		"Hardened Leather Coat"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat,
		"Studded Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/studded
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]
	backpack_contents = list(/obj/item/roguekey/church, /obj/item/clothing/neck/roguetown/psicross/astrata)
