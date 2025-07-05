////////////////ENCHANTING RITUALS///////////////////
/datum/runerituals/enchanting
	name = "Enchanting"
	desc = "Parent enchanting."
	blacklisted = TRUE

/datum/runerituals/enchanting/woodcut
	name = "Woodcutting"
	desc = "Good for cutting wood."
	blacklisted = FALSE
	tier = 1
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1, /obj/item/magic/manacrystal = 1)
	result_atoms = list(/obj/item/enchantmentscroll/woodcut)

/datum/runerituals/enchanting/mining
	name = "Mining"
	desc = "Good for mining rock."
	blacklisted = FALSE
	tier = 1
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1, /obj/item/magic/artifact = 1)
	result_atoms = list(/obj/item/enchantmentscroll/mining)

/datum/runerituals/enchanting/xylix
	name = "Xylix's Grace"
	desc = "How fortunate!"
	blacklisted = FALSE
	tier = 1
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1, /obj/item/magic/leyline = 1)
	result_atoms = list(/obj/item/enchantmentscroll/xylix)

/datum/runerituals/enchanting/light
	name = "Unyielding Light"
	desc = "Provides light!"
	blacklisted = FALSE
	tier = 1
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/elementalmote = 2)
	result_atoms = list(/obj/item/enchantmentscroll/light)

/datum/runerituals/enchanting/holding
	name = "Compact Storing"
	desc = "Makes things hold more!"
	blacklisted = FALSE
	tier = 1
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/infernalash = 2, /obj/item/magic/fairydust = 2)
	result_atoms = list(/obj/item/enchantmentscroll/holding)

/datum/runerituals/enchanting/revealing
	name = "Revealing Light"
	desc = "Doubles brightness!"
	blacklisted = FALSE
	tier = 1
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1, /obj/item/magic/fairydust = 2)
	result_atoms = list(/obj/item/enchantmentscroll/revealing)

/datum/runerituals/enchanting/nightvision
	name = "Dark Vision"
	desc = "Provides dark sight!"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/iridescentscale = 1, /obj/item/magic/manacrystal = 1, /obj/item/magic/melded/t1 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/nightvision)

/datum/runerituals/enchanting/featherstep
	name = "Feather Step"
	desc = "Provides dark sight!"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/iridescentscale = 1, /obj/item/magic/fairydust = 1, /obj/item/magic/melded/t1 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/featherstep)

/datum/runerituals/enchanting/fireresist
	name = "Fire Resistance"
	desc = "Provides resistance from fire!"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/hellhoundfang = 1, /obj/item/magic/infernalash = 1, /obj/item/magic/melded/t1 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/fireresist)

/datum/runerituals/enchanting/climbing
	name = "Spider movements"
	desc = "Better climbing!"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/elementalshard = 1, /obj/item/magic/infernalash = 1, /obj/item/magic/melded/t1 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/climbing)

/datum/runerituals/enchanting/thievery
	name = "Thievery"
	desc = "Better pickpocketting and lockpicks!"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/hellhoundfang = 1, /obj/item/magic/obsidian = 1, /obj/item/magic/melded/t1 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/thievery)

/datum/runerituals/enchanting/trekk
	name = "Longstriding"
	desc = "Provides easy movement through rough terrain."
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/elementalshard = 1, /obj/item/magic/artifact = 1, /obj/item/magic/melded/t1 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/trekk)

/datum/runerituals/enchanting/smithing
	name = "Smithing"
	desc = "Better smithing."
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/elementalshard = 1, /obj/item/magic/elementalmote = 1, /obj/item/magic/melded/t1 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/smithing)

/datum/runerituals/enchanting/lifesteal
	name = "Lyfestealing"
	desc = "Steals health from foes."
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/heartwoodcore = 1, /obj/item/magic/hellhoundfang = 2, /obj/item/magic/melded/t2 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/lifesteal)

/datum/runerituals/enchanting/frostveil
	name = "Frostveil"
	desc = "Chills foes."
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/elementalfragment = 1, /obj/item/magic/elementalshard = 2, /obj/item/magic/melded/t2 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/frostveil)

/datum/runerituals/enchanting/returningweapon
	name = "Returning Weapon"
	desc = "Summons weapons."
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/elementalfragment = 1, /obj/item/magic/fairydust = 2, /obj/item/magic/elementalmote = 2, /obj/item/magic/melded/t2 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/returningweapon)

/datum/runerituals/enchanting/archery
	name = "Archery"
	desc = "Of bowmanship."
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/hellhoundfang = 2, /obj/item/magic/leyline = 2, /obj/item/magic/melded/t2 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/archery)

/datum/runerituals/enchanting/leaping
	name = "Leaping"
	desc = "Further leaping."
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/infernalcore = 2, /obj/item/magic/leyline = 2, /obj/item/magic/melded/t2 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/leaping)

/datum/runerituals/enchanting/briars
	name = "Briar's Curse"
	desc = "Harder hitting weapons at a cost."
	blacklisted = FALSE
	tier = 4
	required_atoms = list(/datum/reagent/mercury = 15,/obj/item/paper/scroll = 1,/obj/item/magic/sylvanessence = 1, /obj/item/magic/heartwoodcore = 2, /obj/item/magic/melded/t3 = 1)
	result_atoms = list(/obj/item/enchantmentscroll/briars)
