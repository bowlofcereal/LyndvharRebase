/datum/anvil_recipe/engiweapons
	appro_skill = /datum/skill/craft/engineering
	craftdiff = 3
	i_type = "Mechanical Weapons"
	
/datum/anvil_recipe/engiweapons/bronze/gemlock
	name = "Gemlock (+1 Cog, +1 Dorpel, +1 Blacksteel)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/roguegear, /obj/item/roguegem/diamond, /obj/item/ingot/blacksteel)
	created_item = /obj/item/gun/ballistic/revolver/grenadelauncher/gemlock
	craftdiff = 4
