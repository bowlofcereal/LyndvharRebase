/datum/migrant_role/legion/centurion
	name = "Legion Centurion"
	greet_text = "You are the expedition commander and strongest soldier. Use your officers, the Decanii, to delegate tasks, make sure you lead and give orders. Take no disrespect, you are the dominus. If you prove a fool or weak, expect to be dispatched by a stronger subordinate."
	outfit = /datum/outfit/job/roguetown/legion/centurion
	allowed_sexes = list(MALE)
	allowed_races = NON_DWARVEN_RACE_TYPES
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/legion/centurion/pre_equip(mob/living/carbon/human/H)
	..()

	if (!(istype(H.patron, /datum/patron/mars)))
		to_chat(H, span_warning("You fool! You follow Mars!"))
		H.set_patron(/datum/patron/mars)

	head = /obj/item/clothing/head/roguetown/helmet/legcenturion
	mask = /obj/item/clothing/mask/rogue/legion/legcenturion
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	pants = /obj/item/clothing/under/roguetown/chainlegs/kilt
	cloak = /obj/item/clothing/cloak/legion
	armor = /obj/item/clothing/suit/roguetown/armor/f13/legion/centurion
	neck = /obj/item/clothing/neck/roguetown/gorget/steel
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/rogueweapon/huntingknife
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/plate
	backl = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(/obj/item/reagent_containers/glass/bottle/rogue/bitterdrink, /obj/item/storage/belt/rogue/pouch/coins/rich)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("intelligence", 2)
		H.change_stat("endurance", 3)
		H.change_stat("perception", 1)

	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LONGSTRIDER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HERBAL_AFFINITY, TRAIT_GENERIC)
	
/datum/migrant_role/legion/decanus
	name = "Legion Decanus"
	greet_text = "An experienced officer, often commanding the camp. Give orders, lead patrols."
	outfit = /datum/outfit/job/roguetown/legion/decanus
	allowed_sexes = list(MALE)
	allowed_races = NON_DWARVEN_RACE_TYPES
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/legion/decanus/pre_equip(mob/living/carbon/human/H)
	..()

	if (!(istype(H.patron, /datum/patron/mars)))
		to_chat(H, span_warning("You fool! You follow Mars!"))
		H.set_patron(/datum/patron/mars)

	head = /obj/item/clothing/head/roguetown/helmet/legdecan
	mask = /obj/item/clothing/mask/rogue/legion/legdecan
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	belt = /obj/item/storage/belt/rogue/leather
	shoes = /obj/item/clothing/shoes/roguetown/gladiator
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron/kilt
	armor = /obj/item/clothing/suit/roguetown/armor/f13/legion/heavy
	neck = /obj/item/clothing/neck/roguetown/gorget
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/rogueweapon/huntingknife
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	gloves = /obj/item/clothing/gloves/roguetown/chain/blk
	backl = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(/obj/item/reagent_containers/glass/bottle/rogue/bitterdrink)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("intelligence", 2)
		H.change_stat("endurance", 2)
		H.change_stat("perception", 1)

	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LONGSTRIDER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HERBAL_AFFINITY, TRAIT_GENERIC)

/datum/migrant_role/legion/explorer
	name = "Legion Explorer"
	greet_text = "Scout the area, secure key points, but do not ignore orders or wordlessly die some place. A good explorer helps his unit by taking initiative and helping the commander without needing micro-management."
	outfit = /datum/outfit/job/roguetown/legion/explorer
	allowed_sexes = list(MALE)
	allowed_races = NON_DWARVEN_RACE_TYPES
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/legion/explorer/pre_equip(mob/living/carbon/human/H)
	..()

	if (!(istype(H.patron, /datum/patron/mars)))
		to_chat(H, span_warning("You fool! You follow Mars!"))
		H.set_patron(/datum/patron/mars)

	head = /obj/item/clothing/head/roguetown/helmet/legexplorer
	mask = /obj/item/clothing/mask/rogue/legion/legvet
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/gladiator
	pants = /obj/item/clothing/under/roguetown/tights/black
	armor = /obj/item/clothing/suit/roguetown/armor/f13/legion/explorer
	neck = /obj/item/clothing/neck/roguetown/leather
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/rogueweapon/huntingknife
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(/obj/item/reagent_containers/glass/bottle/rogue/bitterdrink, /obj/item/reagent_containers/glass/bottle/rogue/bitterdrink)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("endurance", 2)
		H.change_stat("perception", 3)
		H.change_stat("speed", 2)

	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTDOORSMAN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LONGSTRIDER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HERBAL_AFFINITY, TRAIT_GENERIC)

/datum/migrant_role/legion/prime
	name = "Prime Legionary"
	greet_text = "A front line soldier who has shown ability to obey and fought in some battles. The Legions muscle, the young men who will build the future with their own blood and sacrifice, for Caesar."
	outfit = /datum/outfit/job/roguetown/legion/prime
	allowed_sexes = list(MALE)
	allowed_races = NON_DWARVEN_RACE_TYPES
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/legion/prime/pre_equip(mob/living/carbon/human/H)
	..()

	if (!(istype(H.patron, /datum/patron/mars)))
		to_chat(H, span_warning("You fool! You follow Mars!"))
		H.set_patron(/datum/patron/mars)

	head = /obj/item/clothing/head/roguetown/helmet/legprime
	mask = /obj/item/clothing/mask/rogue/legion/legvet
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/gladiator
	pants = /obj/item/clothing/under/roguetown/tights/black
	armor = /obj/item/clothing/suit/roguetown/armor/f13/legion/prime
	neck = /obj/item/clothing/neck/roguetown/coif
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/rogueweapon/huntingknife
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/reagent_containers/glass/bottle/rogue/bitterdrink)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 2)

	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTLANDER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HERBAL_AFFINITY, TRAIT_GENERIC)
