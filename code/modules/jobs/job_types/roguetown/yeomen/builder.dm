/datum/job/roguetown/builder
	title = "Builder"
	flag = BUILDER
	department_flag = TOWNER
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_ALL_KINDS

	tutorial = "As a Builder, your role is to construct and repair structures, craft essential tools, and assist your team in maintaining the town's infrastructure. Utilize your skills in carpentry, masonry, and engineering to ensure the town thrives. Be prepared to adapt and contribute to various tasks, including crafting, smelting, and even setting traps when necessary."

	outfit = /datum/outfit/job/roguetown/builder
	display_order = JDO_BUILDER
	give_bank_account = 11
	min_pq = 0
	max_pq = null
	round_contrib_points = 3


/datum/outfit/job/roguetown/builder/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/labor/mining, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 2, TRUE) //added to help with early round grind and so they can assist in making tools if needed.
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/smelting, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)

	head = /obj/item/clothing/head/roguetown/articap
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/jacket
	cloak = /obj/item/clothing/cloak/apron/waist/brown
	gloves = /obj/item/clothing/gloves/roguetown/freigloves/blacksmith
	pants = /obj/item/clothing/under/roguetown/trou/padleatherpants
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/builder
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/storage/keyring/sund/sund_smith	// Closest thing.
	mask = /obj/item/clothing/mask/rogue/spectacles/golden
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(
						/obj/item/rogueweapon/hammer/claw = 1,
						/obj/item/lockpickring/mundane = 1,
						/obj/item/clothing/cloak/apron/blacksmith = 1
						)
	H.change_stat("strength", 1)
	H.change_stat("intelligence", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
