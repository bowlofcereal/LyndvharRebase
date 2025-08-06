/datum/advclass/hedgeknight //heavy knight class - just like black knight adventurer class. starts with heavy armor training and plate, but less weapon skills than brigand, sellsword and knave
	name = "Hedge Cataphract"
	tutorial = "A Cataphract fallen from grace, your tarnished armor sits upon your shoulders as a heavy reminder of the life you've lost. Take back what is rightfully yours."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/bandit/hedgeknight
	category_tags = list(CTAG_BANDIT)
	maximum_possible_slots = 1 //The main protagonist unless therse an iconoclast i guess
	cmode_music = 'sound/music/combat_bandit.ogg'

/datum/outfit/job/roguetown/bandit/hedgeknight/pre_equip(mob/living/carbon/human/H)
	..()
	if (!(istype(H.patron, /datum/patron/inhumen/zizo) || istype(H.patron, /datum/patron/inhumen/matthios) || istype(H.patron, /datum/patron/inhumen/graggar) || istype(H.patron, /datum/patron/inhumen/baotha)))
		to_chat(H, span_warning("My former deity has abandoned me.. Matthios is my new master."))
		H.set_patron(/datum/patron/inhumen/matthios)	//We allow other heretics into the cool-kids club, but if you are a tennite/psydonian it sets you to matthiosan.
	head = /obj/item/clothing/head/roguetown/helmet/heavy/knight/skettle/black
	mask = /obj/item/clothing/mask/rogue/facemask/hound/steel
	gloves = /obj/item/clothing/gloves/roguetown/chain/blk
	pants = /obj/item/clothing/under/roguetown/chainlegs/blk
	cloak = /obj/item/clothing/cloak/tabard/blkknight
	neck = /obj/item/clothing/neck/roguetown/chaincoif/full
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/iron
	armor = /obj/item/clothing/suit/roguetown/armor/plate/blacksteel_half_plate
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/blk
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	l_hand = /obj/item/rogueweapon/sword/long/dec
	backr = /obj/item/rogueweapon/scabbard/sword
	backl = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/mattcoin
	backpack_contents = list(
					/obj/item/rogueweapon/huntingknife/idagger = 1,
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/rogueweapon/scabbard/sheath = 1
					)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
	H.change_stat("strength", 3)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	H.change_stat("intelligence", -3)
	H.change_stat("speed", -2)
	H.change_stat("fortune", 2)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
