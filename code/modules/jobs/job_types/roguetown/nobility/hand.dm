/datum/job/roguetown/hand
	title = "Hand"
	flag = HAND
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		/datum/species/human/northern,
		/datum/species/elf/wood,
		/datum/species/human/halfelf,
		/datum/species/dwarf/mountain,
		/datum/species/elf/dark,
		/datum/species/aasimar,
		/datum/species/demihuman
	)
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/hand
	advclass_cat_rolls = list(CTAG_HAND = 20)
	display_order = JDO_HAND
	tutorial = "You owe your entire life to the Viscount. Once perhaps a childhood friend, crush, or even lover-- now you are one of the most important people within the city itself, second only to the Viscount. You have played spymaster and confidant to the noble family for so long that you are a veritable vault of intrigue, something you exploit with potent conviction at every opportunity. Let no man ever forget into whose ear you whisper. You've killed more men with those lips than any blademaster could ever claim to."
	whitelist_req = TRUE
	give_bank_account = 44
	noble_income = 22
	min_pq = 7
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/cmode/nobility/combat_spymaster.ogg'

/datum/outfit/job/roguetown/hand
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/steel
	beltr = /obj/item/rogueweapon/scabbard/sword
	beltl = /obj/item/rogueweapon/scabbard/sheath
	job_bitflag = BITFLAG_ROYALTY

/datum/job/roguetown/hand/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
	
		addtimer(CALLBACK(src, PROC_REF(know_agents), H), 50)

/datum/job/roguetown/hand/proc/know_agents(var/mob/living/carbon/human/H)
	if(!GLOB.court_agents.len)
		to_chat(H, span_notice("You begun the week with no agents."))
	else
		to_chat(H, span_notice("We begun the week with these agents:"))
		for(var/name in GLOB.court_agents)
			to_chat(H, span_notice(name))



/datum/advclass/hand/hand
	name = "Hand"
	tutorial = " You have played blademaster and strategist to the Noble-Family for so long that you are a master tactician, something you exploit with potent conviction. Let no man ever forget whose ear you whisper into. You've killed more men with swords than any spymaster could ever claim to."
	outfit = /datum/outfit/job/roguetown/hand/handclassic

	category_tags = list(CTAG_HAND)

//Classical hand start - same as before, nothing changed. 
/datum/outfit/job/roguetown/hand/handclassic/pre_equip(mob/living/carbon/human/H)
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	backr = /obj/item/storage/backpack/rogue/satchel/black
	l_hand = /obj/item/rogueweapon/huntingknife/idagger/dtace
	r_hand = /obj/item/rogueweapon/sword/rapier/dec
	backpack_contents = list(
		/obj/item/storage/keyring/hand = 1
		)
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/hand
	pants = /obj/item/clothing/under/roguetown/tights/black
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("perception", 3)
	H.change_stat("intelligence", 3)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

/datum/advclass/hand/spymaster
	name = "Spymaster"
	tutorial = " You have played spymaster and confidant to the Noble-Family for so long that you are a vault of intrigue, something you exploit with potent conviction. Let no man ever forget whose ear you whisper into. You've killed more men with those lips than any blademaster could ever claim to."
	outfit = /datum/outfit/job/roguetown/hand/spymaster

	category_tags = list(CTAG_HAND)

//Spymaster start. More similar to the rogue adventurer - loses heavy armor and sword skills for more sneaky stuff. 
/datum/outfit/job/roguetown/hand/spymaster/pre_equip(mob/living/carbon/human/H)
	backr = /obj/item/storage/backpack/rogue/satchel/black
	l_hand = /obj/item/rogueweapon/huntingknife/idagger/dtace
	r_hand = /obj/item/rogueweapon/sword/rapier/dec
	backpack_contents = list(
		/obj/item/storage/keyring/hand = 1,
		/obj/item/lockpickring/mundane = 1
		)
	if(H.dna.species.type in NON_DWARVEN_RACE_TYPES)
		shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/shadowrobe
		cloak = /obj/item/clothing/cloak/half/shadowcloak
		gloves = /obj/item/clothing/gloves/roguetown/fingerless/shadowgloves
		mask = /obj/item/clothing/mask/rogue/shepherd/shadowmask
		pants = /obj/item/clothing/under/roguetown/trou/shadowpants
	else
		cloak = /obj/item/clothing/cloak/raincloak/mortus //cool spymaster cloak
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		backr = /obj/item/storage/backpack/rogue/satchel/black
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/hand
		pants = /obj/item/clothing/under/roguetown/tights/black
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 6, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 5, TRUE) // not like they're gonna break into the vault.
	H.change_stat("strength", -1)
	H.change_stat("perception", 2)
	H.change_stat("speed", 3)
	H.change_stat("intelligence", 2)
	H.grant_language(/datum/language/thievescant)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PERFECT_TRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
