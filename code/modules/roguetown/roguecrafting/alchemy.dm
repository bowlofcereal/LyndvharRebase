/datum/crafting_recipe/roguetown/alchemy
	req_table = FALSE
	tools = list(/obj/item/reagent_containers/glass/mortar, /obj/item/pestle)
	verbage_simple = "mix"
	skillcraft = /datum/skill/misc/alchemy
	subtype_reqs = TRUE
	structurecraft = /obj/structure/fluff/alch

/datum/crafting_recipe/roguetown/alchemy/bbomb
	name = "Bottle bomb [Bottle|2xAsh|1Coal|1Cloth]"
	result = list(/obj/item/bomb)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1, /obj/item/ash = 2, /obj/item/rogueore/coal = 1, /obj/item/natural/cloth = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/ozium
	name = "Ozium [2xAsh|2PoiBerry|Swampweed]"
	result = list(/obj/item/reagent_containers/powder/ozium)
	reqs = list(/obj/item/ash = 2, /datum/reagent/berrypoison = 2, /obj/item/reagent_containers/food/snacks/grown/rogue/sweetleafdry = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/ozium_3x
	name = "Ozium (x3) [3xAsh|3xBerryPois|2xSwampweed]"
	result = list(/obj/item/reagent_containers/powder/ozium,
					/obj/item/reagent_containers/powder/ozium,
					/obj/item/reagent_containers/powder/ozium)
	reqs = list(/obj/item/ash = 3, /datum/reagent/berrypoison = 3, /obj/item/reagent_containers/food/snacks/grown/rogue/sweetleafdry = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/moon
	name = "Moondust [2xAsh|Westleach|2xPoiBerry]"
	result = list(/obj/item/reagent_containers/powder/moondust)
	reqs = list(/obj/item/ash = 2, /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 1, /datum/reagent/berrypoison = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/moon_3x
	name = "Moondust (x3) [3xAsh|2xWestleach|3xPoiBerry]"
	result = list(/obj/item/reagent_containers/powder/moondust,
					/obj/item/reagent_containers/powder/moondust,
					/obj/item/reagent_containers/powder/moondust
				)
	reqs = list(/obj/item/ash = 3, /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 2, /datum/reagent/berrypoison = 3)
	craftdiff = 3

/datum/crafting_recipe/roguetown/alchemy/salt
	name = "Salt Pile [Ash|3oz Water|Fat]"
	result = list(/obj/item/reagent_containers/powder/salt)
	reqs = list(/obj/item/ash = 1, /datum/reagent/water = 10, /obj/item/reagent_containers/food/snacks/fat = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/alchemy/salt_2
	name = "Salt Pile [Ash|3oz Water|MinceMeat]"
	result = list(/obj/item/reagent_containers/powder/salt)
	reqs = list(/obj/item/ash = 1, /datum/reagent/water = 10, /obj/item/reagent_containers/food/snacks/rogue/meat/mince = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/alchemy/quicksilver
	name = "quicksilver [BloodyFyriritus|15ozHolyWater|Cloth|SilverIngot]"
	result = list(/obj/item/quicksilver = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius/bloodied = 1, /datum/reagent/water/blessed = 45, /obj/item/natural/cloth = 1, /obj/item/ingot/silver = 1)
	craftdiff = 4

/// bottle craft

/datum/crafting_recipe/roguetown/alchemy/glassbottles
	name = "alchemy bottles [Stone|Clod|AlchTable]"
	result = list(/obj/item/reagent_containers/glass/alchemical, /obj/item/reagent_containers/glass/alchemical, /obj/item/reagent_containers/glass/alchemical, /obj/item/reagent_containers/glass/alchemical, /obj/item/reagent_containers/glass/alchemical, /obj/item/reagent_containers/glass/alchemical)
	reqs = list(/obj/item/natural/stone = 1, /obj/item/natural/dirtclod = 1)
	craftdiff = 1
	verbage_simple = "forge"

/datum/crafting_recipe/roguetown/alchemy/glassbottles2
	name = "glass bottles x3 [Stone|Clod|AlchTable]"
	result = list(/obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/bottle)
	reqs = list(/obj/item/natural/stone = 1, /obj/item/natural/dirtclod = 1)
	craftdiff = 1
	verbage_simple = "forge"

/// transmutation

/datum/crafting_recipe/roguetown/alchemy/distill
	name = "distill water [Bottle|16oz Murk|AlchTable]"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/water = 1)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1, /datum/reagent/water/gross = 48)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/w2w
	name = "water to wine [Bottle|16oz Water|AlchTable]"
	result = list(/obj/item/reagent_containers/glass/bottle/rogue/wine = 1)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1, /datum/reagent/water = 48)
	craftdiff = 3 //WHO THE FUCK THOUGHT SETTING THIS AT 2 WAS A GOOD IDEA? MAKE IT MAKE SENSE.
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/g2wes
	name = "grain to westleach [2xWheat|AlchTable]"
	result = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/wheat = 2)
	craftdiff = 3
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/w2swa
	name = "westleach to swampweed [2xWestleach|AlchTable]"
	result = list(/obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 2)
	craftdiff = 3
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/f2gra
	name = "fiber to grain [4xFiber|AlchTable]"
	result = list(/obj/item/reagent_containers/food/snacks/grown/wheat = 1)
	reqs = list(/obj/item/natural/fibers = 4)
	craftdiff = 3
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/b2app
	name = "berry to apple [2xBerries|AlchTable]"
	result = list(/obj/item/reagent_containers/food/snacks/grown/apple = 1)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 2)
	craftdiff = 3
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/s2coa
	name = "stone to coal [4xStone|AlchTable]"
	result = list(/obj/item/rogueore/coal = 1)
	reqs = list(/obj/item/natural/stone = 4)
	craftdiff = 2
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/c2irn
	name = "coal to iron [2xCoal|AlchTable]"
	result = list(/obj/item/rogueore/iron = 1)
	reqs = list(/obj/item/rogueore/coal = 2)
	craftdiff = 3
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/i2gol
	name = "iron to gold [4xIronOre|AlchTable]"
	result = list(/obj/item/rogueore/gold = 1)
	reqs = list(/obj/item/rogueore/iron = 4)
	craftdiff = 4
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/g2top
	name = "gold to toper [2xGoldOre|Stone|AlchTable]"
	result = list(/obj/item/roguegem/yellow = 1)
	reqs = list(/obj/item/rogueore/gold = 2, /obj/item/natural/stone = 1)
	craftdiff = 4
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/t2gem
	name = "toper to gemerald [Toper|2xGoldOre|AlchTable]"
	result = list(/obj/item/roguegem/green = 1)
	reqs = list(/obj/item/roguegem/yellow = 1, /obj/item/rogueore/gold = 2)
	craftdiff = 4
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/g2saf
	name = "gemerald to saffira [Gemerald|2xGoldOre|AlchTable]"
	result = list(/obj/item/roguegem/violet = 1)
	reqs = list(/obj/item/roguegem/green = 1, /obj/item/rogueore/gold = 2)
	craftdiff = 4
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/s2blo
	name = "saffira to blortz [Saffira|2xGoldOre|AlchTable]"
	result = list(/obj/item/roguegem/blue = 1)
	reqs = list(/obj/item/roguegem/violet = 1, /obj/item/rogueore/gold = 2)
	craftdiff = 4
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/r2dia
	name = "blortz to diamond [2xBlortz|2xGoldOre|AlchTable]"
	result = list(/obj/item/roguegem/diamond = 1)
	reqs = list(/obj/item/roguegem/blue = 2, /obj/item/rogueore/gold = 2)
	craftdiff = 5
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/d2ros
	name = "dorpal to riddle of steel [2xDorpal|IronOre|Coal|AlchTable]" /// holy grail requires legendary. (sell price on average is 350. rontz and diamond worth 100 each. you get to legndary you deserve 150-200 profit)
	result = list(/obj/item/riddleofsteel = 1)
	reqs = list(/obj/item/roguegem/diamond = 2, /obj/item/rogueore/iron = 1, /obj/item/rogueore/coal = 1)
	craftdiff = 6
	verbage_simple = "transmute"

/datum/crafting_recipe/roguetown/alchemy/alchmort
	name = "alchemical mortar [3xStone|IronOre|AlchTable]"
	tools = list()
	result = list(/obj/item/mortar = 1)
	reqs = list(/obj/item/natural/stone = 3, /obj/item/rogueore/iron = 1)
	verbage_simple = "fabricate"
	verbage = "fabricates"
