/datum/advclass/mercenary/forlorn
	name = "Forvheipal Thrall"
	tutorial = "A thrall-warrior from the strange and enigmatic kingdom in Yoheon, Forvheipal. The thralls are a sellsword contingent of the Zapyrixian Order- mostly made up of Lupians and Vulpkian slaves-from-birth. They will do any work for the highest bidder as per their contract made from birth- and thus you will, too."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	outfit = /datum/outfit/job/roguetown/mercenary/forlorn
	min_pq = 2
	cmode_music = 'sound/music/combat_blackstar.ogg'
	traits_applied = list(TRAIT_OUTLANDER)
	category_tags = list(CTAG_MERCENARY)

/datum/outfit/job/roguetown/mercenary/forlorn/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Forvheipal Light Infantry","Forvheipal Javelineer")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Forvheipal Light Infantry")
			H.set_blindness(0)
			to_chat(H, span_warning("The Forvheipal Light Infantry are the Zapyrixian Order's regular thralls, wielding warhammer and shield."))
			H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 1) 
			shoes = /obj/item/clothing/shoes/roguetown/boots
			neck = /obj/item/clothing/neck/roguetown/gorget/forlorncollar
			head = /obj/item/clothing/head/roguetown/helmet/heavy/volfplate
			pants = /obj/item/clothing/under/roguetown/splintlegs
			gloves = /obj/item/clothing/gloves/roguetown/leather
			belt = /obj/item/storage/belt/rogue/leather/steel/tasset
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
			wrists = /obj/item/clothing/wrists/roguetown/splintarms
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltl = /obj/item/rogueweapon/mace/warhammer/steel
			backr = /obj/item/storage/backpack/rogue/satchel
			backl = /obj/item/rogueweapon/shield/heater
			backpack_contents = list(/obj/item/rogueweapon/huntingknife, /obj/item/roguekey/mercenary, /obj/item/rogueweapon/scabbard/sheath)
		if("Forvheipal Javelineer")
			H.set_blindness(0)
			to_chat(H, span_warning("The Forvheipal Javelineers are the Zapyrixian Order's ranged thrall, wielding javelins and relying on their agility to avoid blows."))
			H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/tracking, 3, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			H.change_stat("perception", 3)
			H.change_stat("speed", 2)
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
			neck = /obj/item/clothing/neck/roguetown/gorget/forlorncollar
			head = /obj/item/clothing/head/roguetown/helmet/heavy/volfplate
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			gloves = /obj/item/clothing/gloves/roguetown/leather
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
			belt = /obj/item/storage/belt/rogue/leather/steel/tasset
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
			l_hand = /obj/item/rogueweapon/sword/iron/messer
			beltr = /obj/item/rogueweapon/scabbard/sword
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			backr = /obj/item/storage/backpack/rogue/satchel
			backl = /obj/item/quiver/javelin/iron
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel, /obj/item/roguekey/mercenary, /obj/item/rogueweapon/scabbard/sheath)
