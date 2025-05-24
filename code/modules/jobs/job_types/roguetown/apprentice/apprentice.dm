/datum/job/roguetown/apprentice
	title = "Apprentice"
	flag = APPRENTICE
	department_flag = APPRENTICE
	faction = "Station"
	total_positions = 10
	spawn_positions = 10

	allowed_races = RACES_ALL_KINDS
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)
	selection_color = JCOLOR_PEASANT
	tutorial = "As an Apprentice, you are a novice learning a craft. Assist your mentors, hone your skills, and contribute to the community while preparing for greater responsibilities."
	
	display_order = JDO_APPRENTICE
	give_bank_account = TRUE
	min_pq = -10
	max_pq = null
	round_contrib_points = 2

	advclass_cat_rolls = list(CTAG_APPRENTICE = 20)

	announce_latejoin = TRUE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = TRUE


/datum/job/roguetown/apprentice/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")



/// SHOPHAND


/datum/advclass/apprentice/shophand
	name = "Shophand"
	tutorial = "You work the largest store in the March by grace of the Merchant who has shackled you to this drudgery. The work of stocking shelves and taking inventory for your employer is mind-numbing and repetitive--but at least you have a roof over your head and comfortable surroundings. With time, perhaps you will one day be more than a glorified servant."
	outfit = /datum/outfit/job/roguetown/shophand

	category_tags = list(CTAG_APPRENTICE)


/datum/outfit/job/roguetown/shophand/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, "[type]")
	if(should_wear_femme_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/blue
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltl = /obj/item/storage/keyring/sund/sund_shop
		backr = /obj/item/storage/backpack/rogue/satchel
	else if(should_wear_masc_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltl = /obj/item/storage/keyring/sund/sund_shop
		backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		//worse skills than a normal peasant, generally, with random bad combat skill
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("fortune", 1)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/appraise/secular)
		if(prob(33))
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		else if(prob(33))
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		else //the legendary shopARM
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
			H.change_stat("strength", 1)


/// SMITH APPRENTICE

/datum/advclass/apprentice/smith
	name = "Smith Apprentice"
	tutorial = "Long hours and back-breaking work wouldn't even describe a quarter of what you do in a day for your Master. Its exhausting, filthy, and you have precious little free time; but someday you'll get your own smithy, and you'll have TWICE as many apprentices as your master does."
	outfit = /datum/outfit/job/roguetown/apprentice/smith

	category_tags = list(CTAG_APPRENTICE)

/datum/outfit/job/roguetown/apprentice/smith/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/smelting, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		belt = /obj/item/storage/belt/rogue/leather/rope
		beltr = /obj/item/storage/keyring/sund/sund_smith
		cloak = /obj/item/clothing/cloak/apron/brown
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
	else if(should_wear_masc_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights/random
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		shirt = null
		belt = /obj/item/storage/belt/rogue/leather/rope
		beltr = /obj/item/storage/keyring/sund/sund_smith
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather

// TAILOR APPRENTICE

/datum/advclass/apprentice/tailor
	name = "Tailor Apprentice"
	tutorial = "You may choose to either learn from the town's seamster or leatherworker, learning the craft of working with the needles, the loom or the tanning rack to make fine clothes, armors and accessories."
	outfit = /datum/outfit/job/roguetown/apprentice/tailor

	category_tags = list(CTAG_APPRENTICE)

/datum/outfit/job/roguetown/apprentice/tailor/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		belt = /obj/item/storage/belt/rogue/leather/rope
		cloak = /obj/item/clothing/cloak/apron/tailor
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/needle/thorn = 1, /obj/item/natural/cloth = 2,
						/obj/item/natural/bundle/fibers/full = 1,)
	else if(should_wear_masc_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights/random
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		belt = /obj/item/storage/belt/rogue/leather/rope
		armor = /obj/item/clothing/cloak/apron/tailor
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/needle/thorn = 1, /obj/item/natural/cloth = 2,
						/obj/item/natural/bundle/fibers/full = 1,)
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather


/// Apothecary apprentice

/datum/advclass/apprentice/apothecary
	name = "Apothecary Apprentice"
	tutorial = "As an Apothecary Apprentice, you are learning the delicate art of alchemy and herbal medicine. Your days are spent gathering ingredients, preparing potions, and assisting your master in crafting remedies and poisons alike. With dedication, you may one day become a master of the craft, capable of creating elixirs that can heal or harm with equal precision."
	outfit = /datum/outfit/job/roguetown/apprentice/apothecary

	category_tags = list(CTAG_APPRENTICE)

/datum/outfit/job/roguetown/apprentice/apothecary/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		belt = /obj/item/storage/belt/rogue/leather/rope
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/apprentice
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/reagent_containers/glass/bottle = 1, /obj/item/reagent_containers/glass/alchemical = 1)
	else if(should_wear_masc_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights/random
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		belt = /obj/item/storage/belt/rogue/leather/rope
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/apprentice
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/reagent_containers/glass/bottle = 1, /obj/item/reagent_containers/glass/alchemical = 1)
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
