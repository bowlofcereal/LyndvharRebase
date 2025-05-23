/datum/job/roguetown/chaptermaster
	title = "Chapter Master"
	f_title = "Canoness"
	flag = CHAPTERMASTER
	department_flag = CHURCHMEN
	faction = "Station"
	tutorial = "You are the leader of the Templars, and you are responsible for overseeing the training and operations of the Templars.\
	 As the templars, you serve the will of the church through the guidance of the Priest. Your duty is to protect the church and to answer\
	 the call of the church. You are the sword of the church, and you are to be feared by all who oppose its will."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = ALL_CLERIC_PATRONS
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	spells = list(/obj/effect/proc_holder/spell/self/convertrole/knight_templar, /obj/effect/proc_holder/spell/self/convertrole/templar)
	cmode_music = 'sound/music/combat_holy.ogg'
	outfit = /datum/outfit/job/roguetown/chaptermaster
	advclass_cat_rolls = list(CTAG_CHAPTERMASTER = 20)
	min_pq = 5
	max_pq = null
	total_positions = 1
	spawn_positions = 1
	display_order = JDO_CHAPTERMASTER
	give_bank_account = TRUE
	round_contrib_points = 5


/datum/outfit/job/roguetown/chaptermaster
	cloak = /obj/item/clothing/cloak/templar/psydon
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/roguekey/church = 1, /obj/item/clothing/neck/roguetown/psicross/astrata = 1)
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	id = /obj/item/clothing/ring/silver
	gloves = /obj/item/clothing/gloves/roguetown/chain
	neck = /obj/item/clothing/neck/roguetown/chaincoif

/datum/job/roguetown/chaptermaster/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
//	var/datum/devotion/C = new /datum/devotion(H, H.patron)
//	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/outfit/job/roguetown/chaptermaster/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.change_stat("strength", 5)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", 3)
		H.change_stat("endurance", 4)  
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODTRAINER, TRAIT_GENERIC)

/*  RECRUITMENT  */


/obj/effect/proc_holder/spell/self/convertrole/knight_templar
	name = "Recruit Knight Templar"
	new_role = "Templar Knight"
	overlay_state = "recruit_templar"
	recruitment_faction = "Templars"
	recruitment_message = "Rise as His Knight, %RECRUIT!"
	accept_message = "By the Shepherd's Will!"
	refuse_message = "I refuse."

/obj/effect/proc_holder/spell/self/convertrole/templar
	name = "Recruit Templar Sergeant"
	new_role = "Templar Sergeant"
	overlay_state = "recruit_templar"
	recruitment_faction = "Templars"
	recruitment_message = "Pledge Thy Sword in His Name, %RECRUIT!"
	accept_message = "By the Shepherd's Will!"
	refuse_message = "I refuse."



/datum/advclass/chaptermaster/lance
	name = "School of the Lance"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with polearms, along with some familiarity in swords, shields and riding."
	outfit = /datum/outfit/job/roguetown/chaptermaster/lance

	category_tags = list(CTAG_CHAPTERMASTER)

/datum/outfit/job/roguetown/chaptermaster/lance/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)

	H.adjust_blindness(-3)
	var/weapons = list("Halberd","Bardische","Glaive")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Halberd")
			r_hand = /obj/item/rogueweapon/halberd
			backl = /obj/item/gwstrap
		if("Bardische")
			r_hand =  /obj/item/rogueweapon/halberd/bardiche
			backl = /obj/item/gwstrap
		if("Glaive")
			r_hand = /obj/item/rogueweapon/halberd/glaive
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

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_knight = 1)


/// SCHOOL OF THE SWORD


/datum/advclass/chaptermaster/sword
	name = "School of the Sword"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with swords of all sizes, shields and riding."
	outfit = /datum/outfit/job/roguetown/chaptermaster/sword

	category_tags = list(CTAG_CHAPTERMASTER)

/datum/outfit/job/roguetown/chaptermaster/sword/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)


	H.adjust_blindness(-3)
	var/weapons = list("Zweihander","Romphaia","Steel Greatsword")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Zweihander")
			r_hand = /obj/item/rogueweapon/greatsword/zwei
			backl = /obj/item/gwstrap
		if("Romphaia")
			r_hand =  /obj/item/rogueweapon/sword/long/romphaia
			backl = /obj/item/gwstrap
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

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_knight = 1)



/// SCHOOL OF THE AXE


/datum/advclass/chaptermaster/axe
	name = "School of the Axe"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with axes of all sizes, shields and riding."
	outfit = /datum/outfit/job/roguetown/chaptermaster/axe

	category_tags = list(CTAG_CHAPTERMASTER)

/datum/outfit/job/roguetown/chaptermaster/axe/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)


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

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_knight = 1)


/// SCHOOL OF THE MACE


/datum/advclass/chaptermaster/mace
	name = "School of the Mace"
	tutorial = "You've trained thoroughly and hit far harder than most - adept with mace, flail hammers, shields and riding."
	outfit = /datum/outfit/job/roguetown/chaptermaster/mace

	category_tags = list(CTAG_CHAPTERMASTER)

/datum/outfit/job/roguetown/chaptermaster/mace/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)

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

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_knight = 1)

