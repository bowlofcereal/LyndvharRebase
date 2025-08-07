/datum/advclass/mercenary/condottiero
	name = "Condottiero Guildsman"
	tutorial = "Hailing from the Dunargun Province, Condottieri are soldiers of fortune oft found in the employ of powerful merchants. With the civil war currently raging, the city of Lyndvhar has become desperate for mercenaries. You took the contract-- after all, the most lucrative contracts come from desperate times."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	traits_applied = list(TRAIT_OUTLANDER)
	outfit = /datum/outfit/job/roguetown/mercenary/condottiero
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_condottiero.ogg'

/datum/outfit/job/roguetown/mercenary/condottiero/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	cloak = /obj/item/clothing/cloak/half/red
	gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/iron
	head = /obj/item/clothing/head/roguetown/helmet
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/scabbard/sword
	l_hand = /obj/item/rogueweapon/sword/short
	beltr = /obj/item/quiver/bolts
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/trou/leather
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/rogueweapon/huntingknife/idagger/navaja = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/lockpick = 1
		)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
	H.change_stat("endurance", 2)
	H.change_stat("perception", 2)
	H.change_stat("speed", 2)
	H.change_stat("intelligence", 1)

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.grant_language(/datum/language/dunargi)
