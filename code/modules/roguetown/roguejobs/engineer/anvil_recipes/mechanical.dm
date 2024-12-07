/datum/anvil_recipe/engineering
	i_type = "Engineering"
	appro_skill = /datum/skill/craft/engineering
	craftdiff = 1

// --------- BRONZE RECIPES -----------

/datum/anvil_recipe/engineering/bronze/locks
	name = "Lock (x3)"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/customlock
	createditem_num = 3
	craftdiff = 1

/datum/anvil_recipe/engineering/bronze/keys
	name = "Keys (x3)"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/customblank
	createditem_num = 3
	craftdiff = 1

/datum/anvil_recipe/engineering/bronze/cog
	name = "Cog"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/roguegear
	craftdiff = 0

/datum/anvil_recipe/engineering/bronze/lamptern
	name = "Bronze Lamptern (x3)"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/flashlight/flare/torch/lantern/bronzelamptern
	createditem_num = 3
	craftdiff = 3

/datum/anvil_recipe/engineering/bronze/waterpurifier
	name = "Self-Purifying Waterskin (+1 Waterskin)"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/reagent_containers/glass/bottle/waterskin/purifier
	additional_items = list(/obj/item/reagent_containers/glass/bottle/waterskin)
	craftdiff = 3

/datum/anvil_recipe/engineering/bronze/minershelm
	name = "Miner's Helmet"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/clothing/head/roguetown/helmet/leather/minershelm
	craftdiff = 2

/datum/anvil_recipe/engineering/bronze/steelminerhelm
	name = "Steel Miner's Helmet (+1 Kettleman Helmet)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/clothing/head/roguetown/helmet/kettle)
	created_item = /obj/item/clothing/head/roguetown/helmet/kettle/miner
	craftdiff = 3

/datum/anvil_recipe/engineering/bronze/serfstone
	name = "Serfstone (+1 Steel)"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/scomstone/bad
	additional_items = list(/obj/item/ingot/steel)
	craftdiff = 3

/datum/anvil_recipe/engineering/bronze/scomstone
	name = "Scomstone (+1 Gold)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/scomstone
	craftdiff = 4

/datum/anvil_recipe/engineering/bronze/magic_horn
	name = "Enchanted Signal Horn"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/magic_horn
	craftdiff = 4

// ------------ PROSTHETICS ----------------

/datum/anvil_recipe/engineering/bronze/prosthetic/bronzeleftarm
	name = "Bronze Left Arm (+1 Bronze, +2 Gear)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/roguegear)
	created_item = /obj/item/bodypart/l_arm/prosthetic/bronzeleft
	craftdiff = 4

/datum/anvil_recipe/engineering/bronze/prosthetic/bronzerightarm
	name = "Bronze Right Arm (+1 Bronze, +2 Gear)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/roguegear)
	created_item = /obj/item/bodypart/r_arm/prosthetic/bronzeright
	craftdiff = 4

/datum/anvil_recipe/engineering/bronze/prosthetic/bronzeleftleg
	name = "Bronze Left Leg (+1 Bronze, +2 Gear)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/roguegear)
	created_item = /obj/item/bodypart/l_leg/prosthetic/bronzeleft
	craftdiff = 4

/datum/anvil_recipe/engineering/bronze/prosthetic/bronzerightleg
	name = "Bronze Right Leg (+1 Bronze, +2 Gear)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/roguegear)
	created_item = /obj/item/bodypart/r_leg/prosthetic/bronzeright
	craftdiff = 4
