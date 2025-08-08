/datum/job/roguetown/guardsman
	title = "Watchman"
	flag = GUARDSMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 8
	spawn_positions = 8
	selection_color = JCOLOR_SOLDIER
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	allowed_patrons = ALL_NICE_PATRONS 
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "Responsible for the safety of the port city and the enforcement of the law, you are the vanguard of the city faced with punishing those who defy the Viscount. Life is difficult, but you find great camaraderie in your fellow men and women of the watch. Hopefully the city will endure another week with you protecting it."
	display_order = JDO_TOWNGUARD

	outfit = /datum/outfit/job/roguetown/guardsman
	advclass_cat_rolls = list(CTAG_WATCH = 20)

	give_bank_account = 16
	min_pq = 2
	max_pq = null
	round_contrib_points = 1

	cmode_music = 'sound/music/combat_garrison.ogg'

/datum/job/roguetown/guardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "watchman tabard ([index])"

/datum/outfit/job/roguetown/guardsman
	pants = /obj/item/clothing/under/roguetown/trou/leather
	cloak = /obj/item/clothing/cloak/stabard/guard
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	neck = /obj/item/clothing/neck/roguetown/gorget
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	belt = /obj/item/storage/belt/rogue/leather/steel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/signal_horn = 1)

/*Design philosophy: Men and women from various areas of life, from hunters to street-brawlers and more 'veteran' levy-men. Know less skills overall than Bog, but far more specialized.
Footsman is basically a regular foots-soldier with gear to combat criminals, specializes in maces, polearms, and decent flail/sword training.
Archer is basically a 'bounty-catcher' in function, less specialized at close-quarters, beyond knives, but very capable of downing a fleeing criminal.*/
/datum/advclass/watchman/footsman
	name = "Watch Footsman"
	tutorial = "You are a footsman of the City Watch. Well versed in various close-quarters weapons and aprehending street-savy criminals."
	outfit = /datum/outfit/job/roguetown/guardsman/footsman

	category_tags = list(CTAG_WATCH)

/datum/outfit/job/roguetown/guardsman/footsman/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE) 
	H.change_stat("strength", 2)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)	//You get medium armor training to go with your armor.
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GUARDSMAN, TRAIT_GENERIC)

	head = pickweight(list(/obj/item/clothing/head/roguetown/helmet = 3, /obj/item/clothing/head/roguetown/helmet/kettle = 7))
	armor = pickweight(list(/obj/item/clothing/suit/roguetown/armor/plate/half = 3, /obj/item/clothing/suit/roguetown/armor/plate/half/iron = 7))
	beltr = /obj/item/rogueweapon/mace/cudgel
	backl = /obj/item/rogueweapon/shield/tower
	backr = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/storage/keyring/guardcastle
	belt = /obj/item/storage/belt/rogue/leather/steel
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/rope/chain = 1, /obj/item/rogueweapon/scabbard/sheath = 1)
	H.verbs |= /mob/proc/haltyell

/datum/advclass/watchman/archer
	name = "Watch Archer"
	tutorial = "You are an archer of the City Watch. Once a hunter, now a man-hunter for the Viscount. Rooftops, bows, and daggers are your best friend."
	outfit = /datum/outfit/job/roguetown/guardsman/archer

	category_tags = list(CTAG_WATCH)

/datum/outfit/job/roguetown/guardsman/archer/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 	1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)	//For basic crafting; you'll need it due to relegated support role.
	H.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)	//Likely hunter background; very crappy basic skill.
	H.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE) 
	H.change_stat("perception", 2)
	H.change_stat("intelligence", 1)		//Gets some int for crafting + feinting, makes up for no medium armor training along with the speed.
	H.change_stat("speed", 1)

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)		//You don't get medium armor training, instead you get a bonus to light armor usage.
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GUARDSMAN, TRAIT_GENERIC)

	head = /obj/item/clothing/head/roguetown/roguehood/red		//To-do: Make a guard hood come in kingdom's colors.
	armor = /obj/item/clothing/suit/roguetown/armor/leather	//So they get default-dodge expert usage.
	beltr = /obj/item/quiver/arrows
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	backr = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/storage/keyring/guardcastle
	belt = /obj/item/storage/belt/rogue/leather
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/rope/chain = 1, /obj/item/rogueweapon/scabbard/sheath = 1)
	H.verbs |= /mob/proc/haltyell

/datum/advclass/watchman/pikeman
	name = "Watch Pikeman"
	tutorial = "You are a Pikeman of the City Watch. Given a polearm and some armor, you are expected to defend this city from all threats."
	outfit = /datum/outfit/job/roguetown/guardsman/pikeman

	category_tags = list(CTAG_WATCH)

/datum/outfit/job/roguetown/guardsman/pikeman/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GUARDSMAN, TRAIT_GENERIC)

	head = /obj/item/clothing/head/roguetown/helmet/kettle
	armor = pickweight(list(/obj/item/clothing/suit/roguetown/armor/leather/heavy = 4, /obj/item/clothing/suit/roguetown/armor/chainmail/iron = 3, /obj/item/clothing/suit/roguetown/armor/plate/half/iron = 2))
	backr = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/storage/keyring/guardcastle
	beltr = /obj/item/rogueweapon/scabbard/sword
	l_hand = /obj/item/rogueweapon/sword/iron/short
	belt = /obj/item/storage/belt/rogue/leather/steel
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1, /obj/item/rope/chain = 1, /obj/item/rogueweapon/scabbard/sheath = 1)
	var/weapontype = pickweight(list("Spear" = 5, "Bardiche" = 3, "Lucerne" = 2)) //pooors
	switch(weapontype)
		if("Spear")
			r_hand = /obj/item/rogueweapon/spear
			backl = /obj/item/gwstrap
		if("Bardiche")
			r_hand = /obj/item/rogueweapon/halberd/bardiche
			backl = /obj/item/gwstrap
		if("Lucerne")
			backl = /obj/item/gwstrap
			r_hand = /obj/item/rogueweapon/eaglebeak/lucerne
   H.verbs |= /mob/proc/haltyell


// Added to baliff under assumption townguard.dm will not be enabled.
// /mob/proc/haltyell()
//	set name = "HALT!"
//	set category = "Noises"
//	emote("haltyell")
