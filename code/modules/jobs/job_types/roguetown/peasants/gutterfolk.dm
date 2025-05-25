/datum/job/roguetown/gutterfolk
	title = "Gutterfolk"
	f_title = "Gutterwench"
	flag = GUTTERFOLK
	department_flag = RABBLE
	faction = "Station"
	total_positions = 20
	spawn_positions = 20

	allowed_races = RACES_ALL_KINDS
	allowed_ages = ALL_AGES_LIST
	outfit = /datum/outfit/job/roguetown/gutterfolk
	bypass_lastclass = TRUE
	bypass_jobban = FALSE
	min_pq = -30
	max_pq = null
	advclass_cat_rolls = list(CTAG_GUTTERFOLK = 20)

	tutorial = "The stench of your piss-laden clothes doesn't bug you anymore, the glances of disgust and loathing others give you is just a friendly greeting after all! The only reason you've not been killed already is because Volfs are known to be repelled by the stench of decaying flesh. You're going to be a solemn reminder what happens when something unwanted is born into this world."
	display_order = JDO_GUTTERFOLK
	show_in_credits = FALSE
	can_random = FALSE
	round_contrib_points = 3
	
	cmode_music = 'sound/music/combat_bog.ogg'
	
/*
	/// Chance to become a wise beggar, if we still have space for more wise beggars
	var/wise_chance = 10
	/// Amount of wise beggars spawned as of now
	var/wise_amount = 0
	/// Maximum amount of wise beggars that can be spawned
	var/wise_max = 3
	/// Outfit to use when wise beggar triggers
	var/wise_outfit = /datum/outfit/job/roguetown/vagrant/wise
*/
/datum/job/roguetown/gutterfolk/New()
	. = ..()
	peopleknowme = list()

/datum/job/roguetown/gutterfolk/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")


/// thug

/datum/advclass/thug
	name = "Thug"
	tutorial = "You might not have ever been the smartest person in town. But you may have been the sturdiest. Good enough for soilers to pay you to cart around saigashit. Good enough for miners to offload some of their work to you. Good enough for a carpenter who doesn't want to pay top mams for chopped wood. And good enough for just about anyone who wants a meathead to look scary with."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/gutterfolk/thug
	category_tags = list(CTAG_GUTTERFOLK)

/datum/outfit/job/roguetown/gutterfolk/thug/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/labor/mining, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	head = /obj/item/clothing/head/roguetown/roguehood/random 
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	armor = /obj/item/clothing/suit/roguetown/armor/workervest
	beltr = /obj/item/rogueweapon/mace/cudgel
	beltl = /obj/item/flashlight/flare/torch
	H.change_stat("strength", 3)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 2)
	H.change_stat("speed", -1)

// THIEF

/datum/advclass/thief
	name = "Thief"
	tutorial = "You are a scroundrel and a thief, a master at picking locks and getting into places you shouldn't be to take what is not yours."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/gutterfolk/thief
	category_tags = list(CTAG_GUTTERFOLK)

/datum/outfit/job/roguetown/gutterfolk/thief/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	backl = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/iron
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltl = /obj/item/lockpickring/mundane
	beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
	backpack_contents = list(/obj/item/flashlight/flare/torch = 1)
	H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 6, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/traps, 4, TRUE)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	H.change_stat("strength", -1)
	H.change_stat("intelligence", 1)
	H.change_stat("perception", 1)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 3)

/// BEGGAR

/datum/advclass/beggar
	name = "Beggar"
	tutorial = "You hit bottomrock, having lost all your fortunes with nobody to help you, and all you can do is to beg and live off of the kindness of the people here.\
	You are not weak however and if push come to shove, you can still defend yourself and run away from troubles."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/gutterfolk/beggar
	category_tags = list(CTAG_GUTTERFOLK)

/datum/outfit/job/roguetown/gutterfolk/beggar/pre_equip(mob/living/carbon/human/H)
	..()
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	armor = /obj/item/clothing/suit/roguetown/shirt/rags	
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	pants = /obj/item/clothing/under/roguetown/tights/vagrant
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, rand(2,5), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, rand(2,5), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, rand(2,4), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, rand(2,5), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, rand(3,5), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, rand(2,5), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE) //very good reading he is wise
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, rand(2,5), TRUE) // dog beating staff
	H.STASTR = rand(1, 20)
	H.STAINT = rand(5, 20)
	H.STALUC = rand(1, 20)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)

/*
/datum/job/roguetown/gutterfolk/get_outfit(mob/living/carbon/human/wearer, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, preference_source = null)
	if((wise_amount < wise_max) && prob(wise_chance))
		wise_amount++
		return wise_outfit
	return ..()
*/
