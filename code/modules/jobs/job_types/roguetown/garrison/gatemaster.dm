/datum/job/roguetown/gatemaster
	title = "Gatekeeper"
	flag = GATEMASTER
	department_flag = GARRISON
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = ALL_DIVINE_PATRONS
	tutorial = "You are the Gatemaster, the one who guards the gates of the march. You are charged with the duty of keeping the gates secure and to decide who may enter and leave. Your duty ends before the gates of the city, to leave the gate unattended is to leave the city unguarded."
	display_order = JDO_GATEMASTER

	outfit = /datum/outfit/job/roguetown/gatemaster
	give_bank_account = 3
	min_pq = 0
	max_pq = null
	round_contrib_points = 2

	advclass_cat_rolls = list(CTAG_GATEMASTER = 20)	
	cmode_music = 'sound/music/combat_guard2.ogg'

/datum/job/roguetown/gatemaster/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/surcoat/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "gatemaster jupon ([index])"

/datum/outfit/job/roguetown/gatemaster
	head = /obj/item/clothing/head/roguetown/roguehood/red
	neck = /obj/item/clothing/neck/roguetown/gorget
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/chainlegs
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/black
	backr = /obj/item/storage/backpack/rogue/satchel/black

/datum/outfit/job/roguetown/gatemaster/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("perception", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GUARDSMAN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

/datum/advclass/gatemaster/gatemaster
	name = "Gatemaster"
	tutorial = "As the gatemaster, you are well trained in the use of weapons and armor of all kinds to defend the gates of the city.\
	 You are also trained in the use of bows and firearms, and knows how to ride a horse. \
	 You are only trained to fight properly in the confines of the city and will be at a disadvantage outside the march."
	outfit = /datum/outfit/job/roguetown/gatemaster/gatemaster_adv

	category_tags = list(CTAG_GATEMASTER)

/datum/outfit/job/roguetown/gatemaster/gatemaster_adv/pre_equip(mob/living/carbon/human/H)
	..()
	var/armors = list(
		"Haubergeon" = /obj/item/clothing/suit/roguetown/armor/chainmail,	
		"Steel Curaiss"	= /obj/item/clothing/suit/roguetown/armor/plate/half,
		"Lamellar Armor"	= /obj/item/clothing/suit/roguetown/armor/plate/scale,
		"Hauberk" = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]
	var/weapons = list("Bastard Sword + Crossbow", "Billhook + Recurve Bow", "Steel Sword + Arquebus Pistol")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Bastard Sword + Crossbow")
			beltl = /obj/item/rogueweapon/sword/long
			beltr = /obj/item/rogueweapon/mace/cudgel
			beltl = /obj/item/quiver/bolts
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)

		if("Billhook + Recurve Bow")
			r_hand = /obj/item/rogueweapon/spear/billhook
			l_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			backl = /obj/item/gwstrap
			beltl = /obj/item/quiver/arrows
			beltr = /obj/item/rogueweapon/mace/cudgel
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)

		if("Steel Sword + Arquebus Pistol")


			beltr = /obj/item/ammopouch/bullets
			belt =  /obj/item/gun/ballistic/arquebus_pistol
			backl = /obj/item/rogueweapon/sword
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/powderflask, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)



