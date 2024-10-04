/datum/anvil_recipe/engiweapons
	appro_skill = /datum/skill/craft/engineering
	craftdiff = 3
	i_type = "Mechanical Weapons"
	
/datum/anvil_recipe/engiweapons/bronze/gearlocke
	name = "Gearlocke (+1 Bronze, +1 Cog, +1 Blacksteel)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/ingot/blacksteel)
	created_item = /obj/item/gun/ballistic/revolver/grenadelauncher/gearlocke
	craftdiff = 4
