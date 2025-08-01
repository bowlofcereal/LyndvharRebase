/datum/job/roguetown/veteran
	title = "Veteran"
	flag = VETERAN
	department_flag = MERCENARIES
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE) //same as town guard
	allowed_races = RACES_SHUNNED_UP
	allowed_patrons = ALL_DIVINE_PATRONS 
	tutorial = "You've known combat your entire life. There isn't a way to kill a man you havent practiced in the tapestries of war itself. You wouldn't call yourself a hero--those belong to the men left rotting in the fields where you honed your ancient trade. You don't sleep well at night anymore, you don't like remembering what you've had to do to survive. Trading adventure for stable pay was the only logical solution, and maybe someday you'll get to lay down the blade and rest your weary body..."
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	advclass_cat_rolls = list(CTAG_VETERAN = 20)
	display_order = JDO_VET
	whitelist_req = TRUE
	give_bank_account = 35
	min_pq = 5
	max_pq = null
	round_contrib_points = 2

	cmode_music = 'sound/music/combat_veteran.ogg'

/datum/outfit/job/roguetown/captain
	job_bitflag = BITFLAG_ROYALTY | BITFLAG_GARRISON	//Not a noble per-say but not really garrison either. So both, you are a courtier of sorts afterall + combat

/datum/job/roguetown/veteran/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/half/vet))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "veteran cloak ([index])"


/datum/advclass/veteran/battlemaster
	name = "Veteran Battlemaster"
	tutorial = "You have served under a hundred masters, some good, some bad. You were a general once. A marshal, a captain. To some a hero, others a monster. Something of the sorts. You made strategies, tactics, new innovations of war. A thousand new ways for one man to kill another. It still keeps you up at night."
	outfit = /datum/outfit/job/roguetown/vet/battlemaster

	category_tags = list(CTAG_VETERAN)

// Normal veteran start, from the olden days.

/datum/outfit/job/roguetown/vet/battlemaster/pre_equip(mob/living/carbon/human/H)
	neck = /obj/item/clothing/neck/roguetown/gorget
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	l_hand = /obj/item/rogueweapon/sword/sabre
	beltl = /obj/item/rogueweapon/scabbard/sword
	beltr = /obj/item/storage/keyring/guardcastle
	backr = /obj/item/storage/backpack/rogue/satchel
	cloak = /obj/item/clothing/cloak/half/vet
	belt = /obj/item/storage/belt/rogue/leather/steel/tasset
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.change_stat("perception", 1)
	H.change_stat("intelligence", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 1)
	H.change_stat("strength", 1)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.change_stat("endurance", 1)

	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.cmode_music = 'sound/music/cmode/towner/combat_retired.ogg'

/datum/advclass/veteran/footman
	name = "Retired Footman"
	tutorial = "You served on the fields of battle as no heroic knight steadfast in shining armor, but a mere mortal clad in whatever cheap armor coin could buy. You fought in formation as a member of a unit, and through discipline, have won numerous battles. Maybe one day you even served as the captain of your unit. You specialize in polearms and bows."
	outfit = /datum/outfit/job/roguetown/vet/footman

	category_tags = list(CTAG_VETERAN)

// No hero, just a normal guy who happened to survive war.

/datum/outfit/job/roguetown/vet/footman/pre_equip(mob/living/carbon/human/H)
	neck = /obj/item/clothing/neck/roguetown/gorget
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half // Meant to be better than man-at-arms, but worse than knight. No heavy armor!! This is a cuirass, not half-plate.
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	head = /obj/item/clothing/head/roguetown/helmet/sallet/visored
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	gloves = /obj/item/clothing/gloves/roguetown/chain
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/boots
	l_hand = /obj/item/rogueweapon/sword
	beltl = /obj/item/rogueweapon/scabbard/sword
	beltr = /obj/item/storage/keyring/guardcastle
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/rogueweapon/shield/tower/metal
	r_hand = /obj/item/rogueweapon/spear/billhook
	belt = /obj/item/storage/belt/rogue/leather/black
	cloak = /obj/item/clothing/cloak/half/vet
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/rope/chain = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE) // this is a kinda scary skill to give them, surely it won't go wrong though.
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE) // two handed weapons require a LOT of stamina.
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.change_stat("perception", 1)
	H.change_stat("intelligence", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 2)
	H.change_stat("strength", 1)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

/datum/advclass/veteran/calvaryman
	name = "Tarnished Knight"
	tutorial = "You were once a member of a knightly calvary regiment, a prestigious title. You were ontop of the world, the townspeople rejoiced when you rode through their streets. Now, all you can hear is the screams of your brothers-in-arms as they fell. You specialize in mounted warfare."
	outfit = /datum/outfit/job/roguetown/vet/calvaryman

	category_tags = list(CTAG_VETERAN)

// You get a SAIGA. Saigas are pretty good, you lose out on your legendary weapon skills and you suck more on foot though.

/datum/outfit/job/roguetown/vet/calvaryman/pre_equip(mob/living/carbon/human/H)
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	armor = /obj/item/clothing/suit/roguetown/armor/plate
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	head = /obj/item/clothing/head/roguetown/helmet/heavy/knight
	pants = /obj/item/clothing/under/roguetown/chainlegs
	gloves = /obj/item/clothing/gloves/roguetown/plate
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather/steel
	cloak = /obj/item/clothing/cloak/half/vet
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/storage/keyring/guardcastle = 1
		)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
	H.change_stat("perception", 1)
	H.change_stat("intelligence", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	H.change_stat("speed", -1)
	H.change_stat("strength", 1)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE) // You get a lot of weapon skills, but none are legendary. Jack of all trades, master of none. This is probably worse than just having legendary in one, as people rarely swap weapons mid-combat.
		H.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

	H.adjust_blindness(-3)
	var/weapons = list("Sword + Recurve Bow","Axe + Crossbow","Spear + Shield")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Sword + Recurve Bow")
			r_hand = /obj/item/rogueweapon/sword/long
			beltl = /obj/item/quiver/arrows
			beltr = /obj/item/rogueweapon/scabbard/sword
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve

		if("Axe + Crossbow")
			r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/steel
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			beltl = /obj/item/quiver/bolts

		if ("Spear + Shield")
			r_hand = /obj/item/rogueweapon/spear
			backl = /obj/item/rogueweapon/shield/tower/metal

/datum/advclass/veteran/scout
	name = "Former Scout"
	tutorial = "You and your unit maneuvered ahead of the main force, ever-watchful for traps and ambushes. You never thought of what would happen should you actually walk into one. You specialize in archery and axes."
	outfit = /datum/outfit/job/roguetown/vet/scout

	category_tags = list(CTAG_VETERAN)

// Originally was meant to be a horse archer. I decided that was a bad idea.
// Former Bogmaster maybe? I feel like that'd be cooler than just an archer guy. 

/datum/outfit/job/roguetown/vet/scout/pre_equip(mob/living/carbon/human/H)
	neck = /obj/item/clothing/neck/roguetown/gorget
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/trou/leather
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	beltl = /obj/item/quiver/arrows
	beltr = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	belt = /obj/item/storage/belt/rogue/leather/black
	cloak = /obj/item/clothing/cloak/half/vet
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/storage/keyring/guardcastle = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.change_stat("strength", -1)
	H.change_stat("perception", 3) // you are OLD you have OLD EYES. this is to counter that debuff so you can be OBSERVANT. You sacrifice your strength and armor, so.
	H.change_stat("intelligence", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 1) // You get -2 speed from being old.
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)
		H.change_stat("perception", 2)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_WOODSMAN, TRAIT_GENERIC)
	H.cmode_music = 'sound/music/cmode/antag/combat_deadlyshadows.ogg'
