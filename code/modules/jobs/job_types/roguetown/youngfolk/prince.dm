/datum/job/roguetown/prince
	title = "Heir"
	f_title = "Heiress"
	flag = PRINCE
	department_flag = YOUNGFOLK
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	f_title = "Heiress"
	allowed_races = RACES_NO_CONSTRUCT //Maybe a system to force-pick lineage based on king and queen should be implemented. (No it shouldn't.)
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)
	advclass_cat_rolls = list(CTAG_HEIR = 20)

	tutorial = "You’ve never felt the gnawing of the winter, never known the bite of hunger and certainly have never known a honest day's work. You are as free as any bird in the sky, and you may revel in your debauchery for as long as your parents remain in control of the city: But someday you’ll have to grow up, and that will be the day your carelessness will cost you more than a few mammons."

	display_order = JDO_PRINCE
	give_bank_account = 30
	noble_income = 20
	min_pq = 1
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_noble.ogg'


/datum/job/roguetown/prince/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(ishuman(H))
		var/mob/living/carbon/human/Q = H
		Q.advsetup = 1
		Q.invisibility = INVISIBILITY_MAXIMUM
		Q.become_blind("advsetup")

/datum/advclass/heir/daring
	name = "Daring Twit"
	tutorial = "You're a somebody, someone important. It only makes sense you want to make a name for yourself, to gain your own glory so people see how great you really are beyond your bloodline. Plus, if you're beloved by the people for your exploits you'll be chosen! Probably. Shame you're as useful and talented as a squire, despite your delusions to the contrary."
	outfit = /datum/outfit/job/roguetown/heir/daring
	category_tags = list(CTAG_HEIR)

/datum/outfit/job/roguetown/heir/daring/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/circlet
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	pants = /obj/item/clothing/under/roguetown/tights
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	belt = /obj/item/storage/belt/rogue/leather
	l_hand = /obj/item/rogueweapon/sword/sabre
	beltl = /obj/item/rogueweapon/scabbard/sword
	beltr = /obj/item/storage/keyring/heir
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	backr = /obj/item/storage/backpack/rogue/satchel
	H.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("perception", 1)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 1)
	H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/datum/advclass/heir/aristocrat
	name = "Sheltered Aristocrat"
	tutorial = "Life has been kind to you; you've an entire keep at your disposal, servants to wait on you, and a whole retinue of guards to guard you. You've nothing to prove; just live the good life and you'll be a lord someday, too. A lack of ambition translates into a lacking skillset beyond schooling, though, and your breaks from boredom consist of being a damsel or court gossip."
	outfit = /datum/outfit/job/roguetown/heir/aristocrat
	category_tags = list(CTAG_HEIR)

/datum/outfit/job/roguetown/heir/aristocrat/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC) // Pillow princesses (gender neutral)
	head = /obj/item/clothing/head/roguetown/circlet
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/keyring/heir
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	backr = /obj/item/storage/backpack/rogue/satchel
	if(should_wear_masc_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/royal/prince
		belt = /obj/item/storage/belt/rogue/leather
		shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	if(should_wear_femme_clothes(H))
		belt = /obj/item/storage/belt/rogue/leather/cloth/lady
		head = /obj/item/clothing/head/roguetown/hennin
		armor = /obj/item/clothing/suit/roguetown/armor/silkcoat
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/royal/princess
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
	H.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, pick(0,1), TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, pick(0,1), TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
	H.change_stat("perception", 2)
	H.change_stat("strength", -1)
	H.change_stat("intelligence", 2)
	H.change_stat("fortune", 1)
	H.change_stat("speed", 1)

/datum/advclass/heir/inbred
	name = "Inbred Wastrel"
	tutorial = "Your bloodline ensures the Gods smile upon you by divine right, the blessing of nobility... until you were born, anyway. You are a child forsaken, and even though your body boils as you go about your day, your spine creaks, and your drooling form needs to be waited on tirelessly you are still considered more important then the peasant that keeps the town fed and warm. Remind them of that fact when your lungs are particularly pus free."
	outfit = /datum/outfit/job/roguetown/heir/inbred
	category_tags = list(CTAG_HEIR)

/datum/outfit/job/roguetown/heir/inbred/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NORUN, TRAIT_GENERIC)
	head = /obj/item/clothing/head/roguetown/circlet
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/keyring/heir
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	if(should_wear_masc_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/royal/prince
		belt = /obj/item/storage/belt/rogue/leather/cloth/lady
		shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	if(should_wear_femme_clothes(H))
		belt = /obj/item/storage/belt/rogue/leather/cloth/lady
		head = /obj/item/clothing/head/roguetown/hennin
		armor = /obj/item/clothing/suit/roguetown/armor/silkcoat
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/royal/princess
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
	H.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, pick(0,1), TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, pick(0,0,1), TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, pick(0,1), TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.change_stat("strength", -2)
	H.change_stat("perception", -2)
	H.change_stat("intelligence", -2)
	H.change_stat("constitution", -2)
	H.change_stat("endurance", -2)
	H.change_stat("fortune", 3) //They already can't run, no need to do speed and torture their move speed.
