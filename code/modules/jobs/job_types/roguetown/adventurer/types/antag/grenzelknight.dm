/datum/job/roguetown/grenzelknight
	title = "Ritter"		//Grenzelknight
	flag = RITTER
	department_flag = SIEGER
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_races = RACES_ALL_KINDS
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "After a long journey, your warband has setup camp just west of the Peaks. You are a Knight of the Captain's warband."
	display_order = JDO_RITTER
	whitelist_req = TRUE
	outfit = /datum/outfit/job/roguetown/grenzelknight

	min_pq = 5
	max_pq = null
	round_contrib_points = 5

	cmode_music = 'sound/music/combat_grenzelhoft.ogg'

/datum/job/roguetown/grenzelknight/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/surcoat/grenzelinvasion))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "knight tabard ([index])"
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Sir"
		if(H.gender == FEMALE)
			honorary = "Dame"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"

/datum/outfit/job/roguetown/grenzelknight/pre_equip(mob/living/carbon/human/H)
	..()
	has_loadout = TRUE
	head = /obj/item/clothing/head/roguetown/helmet/blacksteel/bucket
	gloves = /obj/item/clothing/gloves/roguetown/blacksteel/plategloves
	pants = /obj/item/clothing/under/roguetown/blacksteel/platelegs
	cloak = /obj/item/clothing/cloak/stabard/surcoat/grenzelinvasion
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	neck = /obj/item/clothing/neck/roguetown/bevor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/blacksteel/platechest
	shoes = /obj/item/clothing/shoes/roguetown/boots/blacksteel/plateboots
	beltr = /obj/item/rogueweapon/sword/long
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/gwstrap
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE) // so they can maintain their weapons without relegating a player to smithbottom role.
		H.change_stat("strength", 4) // we are literally just old rt knights
		H.change_stat("perception", 1)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 3)
		H.change_stat("endurance", 2)
		H.change_stat("speed", -1)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SIEGER, TRAIT_GENERIC)

/datum/outfit/job/roguetown/grenzelknight/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Zweihander","Great Mace", "Estoc", "Eagle's Beak")
	var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Zweihander")
			H.put_in_hands(new /obj/item/rogueweapon/greatsword/zwei(H), TRUE)
		if("Great Mace")
			H.put_in_hands(new /obj/item/rogueweapon/mace/goden/steel(H), TRUE)
		if("Estoc")
			H.put_in_hands(new /obj/item/rogueweapon/estoc(H), TRUE)
		if("Eagle's Beak")
			H.put_in_hands(new /obj/item/rogueweapon/eaglebeak(H), TRUE)

