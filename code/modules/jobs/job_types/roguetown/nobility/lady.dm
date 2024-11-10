/datum/job/roguetown/lady
	title = "Consort"
	flag = LADY
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	advclass_cat_rolls = list(CTAG_LADY = 20)
	tutorial = "Picked out of your political value rather than likely any form of love, you have become the Grand Duke's most trusted confidant--and likely friend--throughout your marriage. Your loyalty and perhaps even your love will be tested this day...for the daggers that threaten your beloved are as equally pointed at your own throat."

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/servant)

	display_order = JDO_LADY
	give_bank_account = 50
	noble_income = 22
	min_pq = 5
	max_pq = null
	round_contrib_points = 3
	
/datum/job/roguetown/exlady //just used to change the ladys title
	title = "Consort Dowager"
	flag = LADY
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	display_order = JDO_LADY
	give_bank_account = TRUE
	
/datum/job/roguetown/lady/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		
/datum/advclass/lady/consortwar  //duke-lite lil' bit of combat experience for those who enjoy combat, worse than duke.
	name = "Consort of War"
	tutorial = "Years of witnessing war first hand have taught you well with tactics and weaponry. You were chosen as a consort for this exact reason."
	outfit = /datum/outfit/job/roguetown/lady/consortwar
		
	category_tags = list(CTAG_LADY)
	
/datum/outfit/job/roguetown/lady/consortwar/pre_equip(mob/living/carbon/human/H)
	beltl = /obj/item/storage/keyring/royal
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	belt = /obj/item/storage/belt/rogue/leather/steel
	pants = /obj/item/clothing/under/roguetown/tights/black
	id = /obj/item/clothing/ring/silver
	beltr = /obj/item/rogueweapon/sword/sabre
	backr = /obj/item/storage/backpack/rogue/satchel
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
		if(isdwarf(H))
			armor = /obj/item/clothing/suit/roguetown/shirt/dress
		else
			if(prob(66))
				armor = /obj/item/clothing/suit/roguetown/armor/armordress/alt
			else
				armor = /obj/item/clothing/suit/roguetown/armor/armordress
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("intelligence", 3)
		H.change_stat("endurance", 3)
		H.change_stat("speed", 1)
		H.change_stat("perception", 2)
		H.change_stat("fortune", 5)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		
/datum/advclass/lady/consortintrigue  //hand-lite, like the war consort, a little bit worse than the Hand but similar stats, also just a little bit more drip. truely the most important change
	name = "Consort of Intrigue"
	tutorial = "For the longest time, you were someone people felt they could come to for their problems, any loose lip and stray bit of information can be weaponized. You were chosen for this reason."
	outfit = /datum/outfit/job/roguetown/lady/consortintrigue
	
	category_tags = list(CTAG_LADY)
	
/datum/outfit/job/roguetown/lady/consortintrigue/pre_equip(mob/living/carbon/human/H)
	pants = /obj/item/clothing/under/roguetown/tights/black
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/white
	belt = /obj/item/storage/belt/rogue/leather/steel
	beltl = /obj/item/storage/keyring/royal
	beltr = /obj/item/rogueweapon/sword/rapier
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	id = /obj/item/clothing/ring/silver
	if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
		shirt = shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
		H.change_stat("intelligence", 3)
		H.change_stat("endurance", 3)
		H.change_stat("speed", 2)
		H.change_stat("perception", 2)
		H.change_stat("fortune", 3) //Slightly less fortune because they have Dodge Expert
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC) //good at reading people? Doesn't do TOO much really, just for flavor
	
/datum/advclass/lady/consortluxury  //butler-esque, similar to current consort but with more focus on things like crafting and other courtly things. absolute drip
	name = "Consort of Luxury"
	tutorial = "Wealth, beauty, and opulence. You threw the best parties, wore the best fabrics, and have charmed your way through any trouble. You were picked for all of these reasons."
	outfit = /datum/outfit/job/roguetown/lady/consortluxury
	
	category_tags = list(CTAG_LADY)
	
/datum/outfit/job/roguetown/lady/consortluxury/pre_equip(mob/living/carbon/human/H)
	cloak = /obj/item/clothing/cloak/darkcloak/bear
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/rogue/instrument/lute
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/black
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	beltl = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	backpack_contents = list(/obj/item/storage/keyring/royal = 1)
	if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
		head = /obj/item/clothing/head/roguetown/nyle
		neck = /obj/item/listenstone
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/black
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
		id = /obj/item/clothing/ring/gold
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
	else
		head = /obj/item/clothing/head/roguetown/nightman
		neck = /obj/item/clothing/neck/roguetown/ornateamulet
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
		pants = /obj/item/clothing/under/roguetown/tights/black
		id = /obj/item/scomstone
		shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/music, 2, TRUE)
		H.change_stat("intelligence", 4)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 2)
		H.change_stat("perception", 2)
		H.change_stat("fortune", 5)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	
/obj/effect/proc_holder/spell/self/convertrole/servant
	name = "Recruit Servant"
	new_role = "Servant"
	overlay_state = "recruit_servant"
	recruitment_faction = "Servants"
	recruitment_message = "Serve the crown, %RECRUIT!"
	accept_message = "FOR THE CROWN!"
	refuse_message = "I refuse."
	charge_max = 100
