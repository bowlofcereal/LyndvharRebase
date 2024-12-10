/datum/job/roguetown/cantor
	title = "Cantor"
	tutorial = "A church-bound musician, the Cantor is in charge of leading the various chants and hymns of a temple. Their musical talent doesn't stop at vocals, however, as a Cantor spreads the word and sound of their god through any means they see fit."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/cantor
	display_order = JDO_CANTOR
	cmode_music = 'sound/music/combat_bard.ogg'
	department_flag = CHURCHMEN
	faction = "Station"
	allowed_patrons = ALL_DIVINE_PATRONS
	min_pq = 3 //Deus vult, but only according to the proper escalation rules
	max_pq = null
	round_contrib_points = 2
	total_positions = 1
	spawn_positions = 1
	give_bank_account = TRUE
	advclass_cat_rolls = list(CTAG_CANTOR = 20)
	

/datum/outfit/job/roguetown/cantor
	has_loadout = TRUE
	allowed_patrons = ALL_PALADIN_PATRONS

/datum/advclass/cantor
	name = "Cantor"
	outfit = /datum/outfit/job/roguetown/cantor/cantor
	category_tags = list(CTAG_CANTOR)

/datum/job/roguetown/cantor/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/outfit/job/roguetown/cantor/cantor/pre_equip(mob/living/carbon/human/H) //hymnist copy
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/music, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
	head = /obj/item/clothing/head/roguetown/bardhat
	shoes = /obj/item/clothing/shoes/roguetown/boots
	pants = /obj/item/clothing/under/roguetown/tights/black
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/white
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltr = /obj/item/storage/keyring/churchie
	switch(H.patron?.type)
		if(/datum/patron/divine/astrata)
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
			cloak = /obj/item/clothing/cloak/templar/astratan
		if(/datum/patron/divine/noc)
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
			cloak = /obj/item/clothing/cloak/tabard/crusader/noc
		if(/datum/patron/divine/dendor)
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
			cloak = /obj/item/clothing/cloak/tabard/crusader/dendor
		if(/datum/patron/divine/necra)
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
			cloak = /obj/item/clothing/cloak/templar/necran
		if(/datum/patron/divine/pestra)
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
			cloak = /obj/item/clothing/cloak/tabard/crusader/pestra
		if(/datum/patron/divine/ravox)
			neck = /obj/item/clothing/neck/roguetown/psicross/ravox
			cloak = /obj/item/clothing/cloak/tabard/crusader/ravox
		if(/datum/patron/divine/malum)
			neck = /obj/item/clothing/neck/roguetown/psicross/malum
			cloak = /obj/item/clothing/cloak/templar/malumite
		if(/datum/patron/divine/eora)
			neck = /obj/item/clothing/neck/roguetown/psicross/eora
			cloak = /obj/item/clothing/cloak/tabard/crusader/eora
		if(/datum/patron/old_god)
			neck = /obj/item/clothing/neck/roguetown/psicross
			cloak = /obj/item/clothing/cloak/tabard/crusader/psydon
	backpack_contents = list(/obj/item/lockpickring/one = 1)
	H.change_stat("strength", 1)
	H.change_stat("intelligence", 2)
	H.change_stat("perception", 1)
	H.change_stat("speed", 2)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	H.set_blindness(0)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

/datum/outfit/job/roguetown/cantor/cantor/choose_loadout(mob/living/carbon/human/H)
	. = ..()

	var/instruments = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman")
	var/instruments_choice = input("Choose your Instrument.", "TAKE UP ARMS") as anything in instruments
	switch(instruments_choice)
		if("Harp")
			H.put_in_hands(new /obj/item/rogue/instrument/harp(H), TRUE)
		if("Lute")
			H.put_in_hands(new /obj/item/rogue/instrument/lute(H), TRUE)
		if("Accordion")
			H.put_in_hands(new /obj/item/rogue/instrument/accord(H), TRUE)
		if("Guitar")
			H.put_in_hands(new /obj/item/rogue/instrument/guitar(H), TRUE)
		if("Hurdy-Gurdy")
			H.put_in_hands(new /obj/item/rogue/instrument/hurdygurdy(H), TRUE)
		if("Viola")
			H.put_in_hands(new /obj/item/rogue/instrument/viola(H), TRUE)
		if("Vocal Talisman")
			H.put_in_hands(new /obj/item/rogue/instrument/vocals(H), TRUE)
