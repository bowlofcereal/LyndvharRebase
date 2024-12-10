/datum/job/roguetown/musician
	title = "Court Musician"
	tutorial = "Always at the monarch's beck and call, the Court Musician is there to fill the air with divine music. Through dinner party or royal execution, the Court Musician always has the perfect tune to accompany the moment."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/musician
	display_order = JDO_MUSICIAN
	cmode_music = 'sound/music/combat_bard.ogg'
	department_flag = COURTIERS
	faction = "Station"
	min_pq = 3 //Deus vult, but only according to the proper escalation rules
	max_pq = null
	round_contrib_points = 2
	total_positions = 1
	spawn_positions = 1
	give_bank_account = TRUE
	advclass_cat_rolls = list(CTAG_MUSICIAN = 20)
	

/datum/outfit/job/roguetown/musician
	has_loadout = TRUE

/datum/advclass/musician
	name = "Musician"
	outfit = /datum/outfit/job/roguetown/musician/musician
	category_tags = list(CTAG_MUSICIAN)

/datum/job/roguetown/musician/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/outfit/job/roguetown/musician/musician/pre_equip(mob/living/carbon/human/H) //hymnist copy
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/music, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)
	head = /obj/item/clothing/head/roguetown/grenzelhofthat
	pants = /obj/item/clothing/under/roguetown/tights
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backl = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/keyring/servant
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	id = /obj/item/scomstone/bad
	armor = /obj/item/clothing/suit/roguetown/shirt/grenzelhoft
	if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
		armor = /obj/item/clothing/suit/roguetown/armor/silkcoat
	H.change_stat("intelligence", 1)
	H.change_stat("perception", 2)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 2)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mockery)
	H.set_blindness(0)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

/datum/outfit/job/roguetown/musician/musician/choose_loadout(mob/living/carbon/human/H)
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
