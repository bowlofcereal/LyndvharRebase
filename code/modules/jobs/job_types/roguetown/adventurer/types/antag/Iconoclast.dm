/datum/advclass/iconoclast //Support Cleric, Heavy armor, unarmed, miracles.
	name = "Iconoclast"
	tutorial = "You uphold and spread the gospel of the Archdaemon MATTHIOS. Take from the wealthy, take from the worthless, empower yourself. Others of the cult will look up to you, in search of your guidance. Be the Bandit King that you know you can be.."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/bandit/iconoclast
	category_tags = list(CTAG_BANDIT)
	maximum_possible_slots = 1 // We only want one of these. They're the leader.
	cmode_music = 'sound/music/combat_bandit.ogg'

/datum/outfit/job/roguetown/bandit/iconoclast/pre_equip(mob/living/carbon/human/H)
	..()
	if (!(istype(H.patron, /datum/patron/inhumen/matthios)))	//This is the only class that forces Matthios. Needed for miracles + limited slot.
		to_chat(H, span_warning("Matthios embraces me.. I must uphold his creed. I am his light in the darkness."))
		H.set_patron(/datum/patron/inhumen/matthios)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	r_hand = /obj/item/rogueweapon/woodstaff
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/brown
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
					/obj/item/needle/thorn = 1,
					/obj/item/natural/cloth = 1,
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/ritechalk = 1,
					)
	head = /obj/item/clothing/head/roguetown/roguehood
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
	beltr = /obj/item/rogueweapon/katar
	id = /obj/item/mattcoin
	H.change_stat("strength", 3)
	H.change_stat("endurance", 3)
	H.change_stat("constitution", 1)
	H.change_stat("fortune", 2)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T4, passive_gain = CLERIC_REGEN_MAJOR, start_maxed = TRUE)	//Starts off maxed out.
