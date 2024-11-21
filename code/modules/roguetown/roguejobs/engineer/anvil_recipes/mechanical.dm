/datum/anvil_recipe/engineering
	i_type = "Engineering"
	appro_skill = /datum/skill/craft/engineering
	craftdiff = 1

// --------- BRONZE RECIPES -----------

/datum/anvil_recipe/engineering/bronze/locks
	name = "Lock"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/customlock
	craftdiff = 1

/datum/anvil_recipe/engineering/bronze/keys
	name = "Keys 2x"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/customblank
	createditem_num = 2
	craftdiff = 1

/datum/anvil_recipe/engineering/bronze/cog
	name = "Cog"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/roguegear
	craftdiff = 0

/datum/anvil_recipe/engineering/bronze/lamptern
	name = "Bronze Lamptern"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/flashlight/flare/torch/lantern/bronzelamptern
	craftdiff = 3

/datum/anvil_recipe/engineering/bronze/waterpurifier
	name = "Self-Purifying Waterskin"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/reagent_containers/glass/bottle/waterskin/purifier
	additional_items = list(/obj/item/reagent_containers/glass/bottle/waterskin)
	craftdiff = 3

// ------------ PROSTHETICS ----------------

/datum/anvil_recipe/engineering/bronze/prosthetic/bronzeleft
	name = "Bronze Left Arm"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/roguegear)
	created_item = /obj/item/bodypart/l_arm/prosthetic/bronzeleft
	craftdiff = 4

/datum/anvil_recipe/engineering/bronze/prosthetic/bronzeright
	name = "Bronze Right Arm"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/roguegear)
	created_item = /obj/item/bodypart/r_arm/prosthetic/bronzeright
	craftdiff = 4

// ------------ WEAPONS ----------------

/datum/anvil_recipe/engineering/weapons
	i_type = "Engineering (Weapons)"
	craftdiff = 2

/datum/anvil_recipe/engineering/ammo
	i_type = "Engineering (Ammo)"
	craftdiff = 1

/// CROSSBOWS
/datum/anvil_recipe/engineering/weapons/steel/xbow
	req_bar = /obj/item/ingot/steel
	name = "Crossbow (+1 Small Log) (+1 Fiber)"
	additional_items = list(/obj/item/grown/log/tree/small, /obj/item/natural/fibers)
	created_item = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow

/datum/anvil_recipe/engineering/ammo/iron/bolts
	name = "Crossbow Bolts 5x (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/ammo_casing/caseless/rogue/bolt
	createditem_num = 5
