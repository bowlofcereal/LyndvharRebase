/datum/advclass/mercenary/condottiero
	name = "Condottiero Guildsman"
	tutorial = "Hailing from the Dunargun Province, Condottieri are soldiers of fortune oft found in the employ of powerful merchants. With the civil war currently raging, the city of Lyndvhar has become desperate for mercenaries. You took the contract-- after all, the most lucrative contracts come from desperate times."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	traits_applied = list(TRAIT_OUTLANDER)
	outfit = /datum/outfit/job/roguetown/mercenary/condottiero
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_condottiero.ogg'

/datum/outfit/job/roguetown/mercenary/condottiero/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	cloak = /obj/item/clothing/cloak/half/rider/red
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/iron
	head = /obj/item/clothing/head/roguetown/helmet/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/sword/iron/short
	beltr = /obj/item/quiver/arrows
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	pants = /obj/item/clothing/under/roguetown/tights/black
	neck = /obj/item/clothing/neck/roguetown/gorget
	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/rogueweapon/huntingknife/idagger/navaja = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/lockpick = 1
		)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE) //Possibly too high, no idea.
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
		H.change_stat("endurance", 2)
		H.change_stat("perception", 1)
		H.change_stat("speed", 2)
		H.change_stat("intelligence", 1)

	H.grant_language(/datum/language/etruscan)
	H.grant_language(/datum/language/thievescant)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
