/datum/advclass/witch
	name = "Seer"
	tutorial = "You are a seer, seen as wisefolk, guides, divinators, and sometimes prophetic or demons to others. Often ostracized and sequestered for wrongthinks or outright heresy sometimes, your potions are what the commonfolk turn to when all else fails, and for this they tolerate you — at an arm’s length. Take care not to end ‘pon a pyre, for the church often condemns your left handed arts and trickery."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/witch
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)
	traits_applied = list(TRAIT_DEATHSIGHT, TRAIT_WITCH, TRAIT_ARCYNE_T1, TRAIT_RITUALIST)

/datum/outfit/job/roguetown/adventurer/witch/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/witchhat
	mask = /obj/item/clothing/head/roguetown/roguehood/black
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/phys
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/woodstaff/prepared/amethyst
	backpack_contents = list(
						/obj/item/reagent_containers/glass/mortar = 1,
						/obj/item/pestle = 1,
						/obj/item/candle/yellow = 2,
						/obj/item/recipe_book/alchemy = 1,
						/obj/item/recipe_book/survival = 1,
						/obj/item/recipe_book/magic = 1,
						/obj/item/chalk = 1
						)
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/arcynebolt)
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/alchemy, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
		H.change_stat("intelligence", 3)
		H.change_stat("perception", 2)
		H.change_stat("speed", -1)
		H.change_stat("fortune", 1)
		H.mind.adjust_spellpoints(5)
		if(H.age == AGE_OLD)
			H.change_stat("speed", -2)
			H.change_stat("intelligence", 1)
			H.change_stat("fortune", 1)
		
	switch(H.patron?.type)
		if(/datum/patron/inhumen/zizo,
	  		/datum/patron/inhumen/matthios,
	   		/datum/patron/inhumen/graggar,
	   		/datum/patron/inhumen/baotha)
			H.cmode_music = 'sound/music/combat_heretic.ogg'
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/crow)
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
