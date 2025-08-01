/datum/job/roguetown/physician
	title = "Practitioner"
	flag = PHYSICIAN
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)
	display_order = JDO_PHYSICIAN
	tutorial = "You were a child born into good wealth--but poor health. \
		Perhaps in another life, you would have turned out to be a powerful mage, wise archivist or a shrewd steward, \
		but leprosy took away your younger years. \
		Out of desperation, you followed the ways of Pestra and managed to be cured. \
		Now you serve the city ensuring the good health of those inhabiting the walls."
	outfit = /datum/outfit/job/roguetown/physician
	whitelist_req = TRUE

	give_bank_account = 30
	min_pq = 3
	max_pq = null
	round_contrib_points = 3

	cmode_music = 'sound/music/combat_physician.ogg'

/datum/outfit/job/roguetown/physician
	name = "Physician"
	jobtype = /datum/job/roguetown/physician

/datum/outfit/job/roguetown/physician/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/physician
	mask = /obj/item/clothing/mask/rogue/physician
	neck = /obj/item/clothing/neck/roguetown/psicross/pestra
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/physician
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/black
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	pants = /obj/item/clothing/under/roguetown/trou/leather/mourning
	shoes = /obj/item/clothing/shoes/roguetown/boots/
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/surgery_bag/full/physician
	beltr = /obj/item/storage/keyring/physician
	r_hand = /obj/item/rogueweapon/woodstaff/wise
	backl = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 2,
		/obj/item/natural/worms/leech/cheele = 1, //little buddy
		/obj/item/reagent_containers/glass/bottle/waterskin = 1,
		/obj/item/storage/belt/rogue/pouch/coins/rich = 1
	)
	ADD_TRAIT(H, TRAIT_EMPATH, "[type]")
	ADD_TRAIT(H, TRAIT_NOSTINK, "[type]")
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/alchemy, 5, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 6, TRUE)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
		H.change_stat("strength", 1)
		H.change_stat("perception", 2)
		H.change_stat("constitution", -2)
		H.change_stat("intelligence", 4)
		H.change_stat("fortune", 1)
		H.change_stat("endurance", -2)
		if(H.age == AGE_OLD)
			H.change_stat("speed", -1)
			H.change_stat("intelligence", 2)
			H.change_stat("perception", 1)
			H.change_stat("constitution", -1)
			H.change_stat("endurance", -1)
