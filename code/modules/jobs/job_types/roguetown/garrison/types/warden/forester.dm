/datum/advclass/bogguardsman/forester
	name = "Forester"
	tutorial = "You are a forester, a woodsman who volunteered to become a part of the wardens. You have experience using axes and polearms."
	outfit = /datum/outfit/job/roguetown/bogguardsman/forester
	category_tags = list(CTAG_WARDEN)

/datum/outfit/job/roguetown/bogguardsman/forester/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	gloves = /obj/item/clothing/gloves/roguetown/chain/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	backl = /obj/item/gwstrap
	beltr = /obj/item/rogueweapon/stoneaxe/woodcut/wardenpick
	beltl = /obj/item/rogueweapon/huntingknife
	r_hand = /obj/item/rogueweapon/spear
	backpack_contents = list(
		/obj/item/storage/keyring/guard = 1,
		/obj/item/flashlight/flare/torch/lantern = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/slings, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE) // This should let them fry meat on fires.
	H.change_stat("perception", 1) //7 points weighted, same as MAA. They get temp buffs in the woods instead of in the city.
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("strength", 2)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_WOODSMAN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTDOORSMAN, TRAIT_GENERIC)
	H.set_blindness(0)
