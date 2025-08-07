/datum/advclass/mercenary/routier
	name = "Valorian Routiers"
	tutorial = "The Routiers are a rather ingrained mercenary band in the city- having made their trek here from Valoria a few years earlier. Originally a brotherhood of exiled warriors who seek to profit in peacetime- they have effectively just become another standard in the halls of the Mercenary Guild."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = NON_DWARVEN_RACE_TYPES // it doesnt have dwarf sprites
	outfit = /datum/outfit/job/roguetown/mercenary/routier
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_OUTLANDER)
	cmode_music = 'sound/music/combat_routier.ogg'

/datum/outfit/job/roguetown/mercenary/routier/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Swordsman","Macebearer","Flailman", "Lancer")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes
	H.set_blindness(0)
	to_chat(H, span_warning("You are a one of the Routiers, decently experienced in the use of your chosen arms."))
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 4)
	H.change_stat("perception", 1)
	H.change_stat("speed", -1)
	switch(classchoice)
		if("Swordsman")
			H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			beltl = /obj/item/rogueweapon/scabbard/sword
			l_hand = /obj/item/rogueweapon/sword/falchion
		if("Macebearer")
			H.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
			beltl = /obj/item/rogueweapon/mace/steel/morningstar
		if("Flailman")
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
			beltl = /obj/item/rogueweapon/flail/sflail
		if("Foot Lancer")
			H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			r_hand = /obj/item/rogueweapon/spear/lance
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	neck = /obj/item/clothing/neck/roguetown/fencerguard
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/valorian
	head = /obj/item/clothing/head/roguetown/helmet/valorian
	armor = /obj/item/clothing/suit/roguetown/armor/plate/valorian
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/valorian
	shoes = /obj/item/clothing/shoes/roguetown/boots/valorian
	gloves = /obj/item/clothing/gloves/roguetown/valorian
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/rogueweapon/shield/tower/metal
	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1,
		/obj/item/flashlight/flare/torch = 1,
		)

	H.grant_language(/datum/language/valorian)
	
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
