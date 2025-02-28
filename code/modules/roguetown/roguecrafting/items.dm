/datum/crafting_recipe/roguetown
	always_availible = TRUE
	skillcraft = /datum/skill/craft/crafting


/datum/crafting_recipe/roguetown/tneedle
	name = "sewing needle [Thorn|Fiber]"
	result = /obj/item/needle/thorn
	reqs = list(/obj/item/natural/thorn = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/cloth
	name = "cloth [2xFiber|Needle]"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage_simple = "sew"
	verbage = "sews"
	craftdiff = 0

/datum/crafting_recipe/roguetown/cloth5x
	name = "cloth 5x [10xFiber|Needle]"
	result = list(
				/obj/item/natural/cloth,
				/obj/item/natural/cloth,
				/obj/item/natural/cloth,
				/obj/item/natural/cloth,
				/obj/item/natural/cloth,
				)
	reqs = list(/obj/item/natural/fibers = 10)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage_simple = "sew"
	verbage = "sews"
	craftdiff = 0

/datum/crafting_recipe/roguetown/clothbelt
	name = "cloth belt [Cloth]"
	result = /obj/item/storage/belt/rogue/leather/cloth
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0
	verbage_simple = "tie"
	verbage = "ties"

/datum/crafting_recipe/roguetown/unclothbelt
	name = "untie cloth belt [Cloth Belt]"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/storage/belt/rogue/leather/cloth = 1)
	craftdiff = 0
	verbage_simple = "untie"
	verbage = "unties"

/datum/crafting_recipe/roguetown/ropebelt
	name = "rope belt [Rope]"
	result = /obj/item/storage/belt/rogue/leather/rope
	reqs = list(/obj/item/rope = 1)
	craftdiff = 0
	verbage_simple = "tie"
	verbage = "ties"

/datum/crafting_recipe/roguetown/unropebelt
	name = "untie rope belt [Rope Belt]"
	result = /obj/item/rope
	reqs = list(/obj/item/storage/belt/rogue/leather/rope = 1)
	craftdiff = 0
	verbage_simple = "untie"
	verbage = "unties"

/datum/crafting_recipe/roguetown/rope
	name = "rope [3xFiber]"
	result = /obj/item/rope
	reqs = list(/obj/item/natural/fibers = 3)
	verbage_simple = "braid"
	verbage = "braids"

/datum/crafting_recipe/roguetown/net
	name = "net [2xRope|3xStone]"
	result = /obj/item/net
	craftdiff = 2
	reqs = list(/obj/item/rope = 2,
				/obj/item/natural/stone = 3)
	verbage_simple = "braid"
	verbage = "braids"

/datum/crafting_recipe/roguetown/bowstring
	name = "fiber bowstring [2xFiber]"
	result = /obj/item/natural/bowstring
	reqs = list(/obj/item/natural/fibers = 2)
	verbage_simple = "twist"
	verbage = "twists"

/datum/crafting_recipe/roguetown/bowpartial
	name = "unstrung bow [Small Log]"
	result = /obj/item/grown/log/tree/bowpartial
	reqs = list(/obj/item/grown/log/tree/small = 1)
	tools = /obj/item/rogueweapon/huntingknife
	verbage_simple = "carve"
	verbage = "carves"

/datum/crafting_recipe/roguetown/bow
	name = "wooden bow [Bowstring|Unstrung Bow]"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	reqs = list(/obj/item/natural/bowstring = 1, /obj/item/grown/log/tree/bowpartial = 1)
	verbage_simple = "string together"
	verbage = "strings together"
	craftdiff = 2

/datum/crafting_recipe/roguetown/recurvepartial
	name = "unstrung recurve bow [Log|2xBone|Tallow|2xFiber|Knife]"
	result = /obj/item/grown/log/tree/bowpartial/recurve
	reqs = list(
		/obj/item/grown/log/tree = 1,
		/obj/item/natural/bone = 2,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 2,
	)
	tools = /obj/item/rogueweapon/huntingknife
	verbage_simple = "carve"
	verbage = "carves"
	craftdiff = 3

/datum/crafting_recipe/roguetown/recurvebow
	name = "recurve bow [Bowstring|UnstrungRecurve]"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	reqs = list(
		/obj/item/natural/bowstring = 1,
		/obj/item/grown/log/tree/bowpartial/recurve = 1,
		)
	verbage_simple = "string together"
	verbage = "strings together"
	craftdiff = 3

/datum/crafting_recipe/roguetown/longbowpartial
	name = "unstrung long bow [Log|Cloth|Tallow|2xFiber|Knife]"
	result = /obj/item/grown/log/tree/bowpartial/longbow
	reqs = list(
		/obj/item/grown/log/tree = 1,
		/obj/item/natural/cloth = 1,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 2,
	)
	tools = /obj/item/rogueweapon/huntingknife
	verbage_simple = "carve"
	verbage = "carves"
	craftdiff = 3

/datum/crafting_recipe/roguetown/longbow
	name = "long bow[Bowstring|Unstrung Longbow]"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	reqs = list(
		/obj/item/natural/bowstring = 1,
		/obj/item/grown/log/tree/bowpartial/longbow = 1,
		)
	verbage_simple = "string together"
	verbage = "strings together"
	craftdiff = 3

/datum/crafting_recipe/roguetown/wickercloak
	name = "wickercloak [Clod|5xStick|3xFiber]"
	result = /obj/item/clothing/cloak/wickercloak
	reqs = list(/obj/item/natural/dirtclod = 1,
				/obj/item/grown/log/tree/stick = 5,
				/obj/item/natural/fibers = 3)
	craftdiff = 0

/datum/crafting_recipe/roguetown/torch
	name = "torch [Stick|Fiber]"
	result = /obj/item/flashlight/flare/torch
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/soap
	name = "soap (3x) [Tallow]"
	result = list(
				/obj/item/soap,
				/obj/item/soap,
				/obj/item/soap,
				)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1)

/datum/crafting_recipe/roguetown/candle
	name = "candle (x3) [Tallow]"
	result = list(
				/obj/item/candle/yellow,
				/obj/item/candle/yellow,
				/obj/item/candle/yellow,
				)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1)

/datum/crafting_recipe/roguetown/stoneaxe
	name = "stone axe [Sm Log|Stone]"
	result = /obj/item/rogueweapon/stoneaxe
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stone = 1)

/datum/crafting_recipe/roguetown/stonehammer
	name = "stone hammer [Sm Log|Stone]"
	result = /obj/item/rogueweapon/hammer/stone
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stone = 1)

/datum/crafting_recipe/roguetown/stonehoe
	name = "stone hoe [2xSm Log|Fiber|Stone]"
	result = /obj/item/rogueweapon/hoe/stone
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/stone = 1)

/datum/crafting_recipe/roguetown/stonetongs
	name = "stone tongs [2xStick|Stone]"
	result = /obj/item/rogueweapon/tongs/stone
	reqs = list(/obj/item/grown/log/tree/stick = 2,
				/obj/item/natural/stone = 1)

/datum/crafting_recipe/roguetown/stonepick
	name = "stone pick [Sm Log|2xStone]"
	result = /obj/item/rogueweapon/pick/stone
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stone = 2)

/datum/crafting_recipe/roguetown/stoneknife
	name = "stone knife [Stick|Stone]"
	result = /obj/item/rogueweapon/huntingknife/stoneknife
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/stonespear
	name = "stone spear [Staff|Stone]"
	result = /obj/item/rogueweapon/spear/stone
	reqs = list(/obj/item/rogueweapon/woodstaff = 1,
				/obj/item/natural/stone = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/stonesword
	name = "stone sword [Sm Log|Fiber|3xStone]"
	result = /obj/item/rogueweapon/sword/stone
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/stone = 3)
	craftdiff = 1


/datum/crafting_recipe/roguetown/woodclub
	name = "wood club [Sm Log]"
	result = /obj/item/rogueweapon/mace/woodclub/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/billhook
	name = "improvised billhook [Sickle|Rope|Sm Log|Hammer]"
	result = /obj/item/rogueweapon/spear/improvisedbillhook
	reqs = list(/obj/item/rogueweapon/sickle = 1,
				/obj/item/rope = 1,
				/obj/item/grown/log/tree/small = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	craftdiff = 3

/datum/crafting_recipe/roguetown/goedendag
	name = "goedendag [Sm Log|Rope|Hoe|Hammer]"
	result = /obj/item/rogueweapon/mace/goden
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/rope = 1,
				/obj/item/rogueweapon/hoe = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	craftdiff = 3

/datum/crafting_recipe/roguetown/peasantwarflail
	name = "peasant warflail [Sm Log|Rope|Thresher|Hammer]"
	result = /obj/item/rogueweapon/flail/peasantwarflail
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/rope = 1,
				/obj/item/rogueweapon/thresher = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	craftdiff = 3

/obj/item/rogueweapon/mace/woodclub/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/woodstaff
	name = "wood staff [Log]"
	result = list(/obj/item/rogueweapon/woodstaff,
	/obj/item/rogueweapon/woodstaff,
	/obj/item/rogueweapon/woodstaff)
	reqs = list(/obj/item/grown/log/tree = 1)

/datum/crafting_recipe/roguetown/woodsword
	name = "wood sword [Sm Log|Fiber]"
	result = list(/obj/item/rogueweapon/mace/wsword,
					/obj/item/rogueweapon/mace/wsword)
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/woodshield
	name = "wooden shield [Sm Log|Hide]"
	result = /obj/item/rogueweapon/shield/wood/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/hide = 1)
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/spoon
	name = "spoon (x3) [Sm Log]"
	result = list(/obj/item/kitchen/spoon,
				/obj/item/kitchen/spoon,
				/obj/item/kitchen/spoon)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/fork
	name = "fork (x3) [Sm Log]"
	result = list(/obj/item/kitchen/fork,
				/obj/item/kitchen/fork,
				/obj/item/kitchen/fork)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/platter
	name = "platter (x2) [Sm Log]"
	result = list(/obj/item/cooking/platter,
				/obj/item/cooking/platter)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/rollingpin
	name = "rollingpin [Sm Log]"
	result = /obj/item/kitchen/rollingpin
	reqs = list(/obj/item/grown/log/tree/small = 1)

/obj/item/rogueweapon/shield/wood/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/woodbucket
	name = "wooden bucket [Sm Log]"
	result = /obj/item/reagent_containers/glass/bucket/wooden
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/woodcup
	name = "wooden cups (x3) [Sm Log]"
	result = list(/obj/item/reagent_containers/glass/cup/wooden/crafted,
				/obj/item/reagent_containers/glass/cup/wooden/crafted,
				/obj/item/reagent_containers/glass/cup/wooden/crafted)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/obj/item/reagent_containers/glass/cup/wooden/crafted
	sellprice = 3

/datum/crafting_recipe/roguetown/woodtray
	name = "wooden trays (x2) [Sm Log]"
	result = list(/obj/item/storage/bag/tray,
				/obj/item/storage/bag/tray)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/woodbowl
	name = "wooden bowls (x3) [Sm Log]"
	result = list(/obj/item/reagent_containers/glass/bowl,
				/obj/item/reagent_containers/glass/bowl,
				/obj/item/reagent_containers/glass/bowl)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/pot
	name = "stone pot [2xStone]"
	result = /obj/item/reagent_containers/glass/bucket/pot/stone
	reqs = list(/obj/item/natural/stone = 2)

/datum/crafting_recipe/roguetown/stonearrow
	name = "stone arrow [Stick|Stone|Table]"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/stone
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 1)
	req_table = TRUE

/datum/crafting_recipe/roguetown/stonearrow_five
	name = "stone arrow (x5) [5xStick|5xStone|Table]"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/stone,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone
				)
	reqs = list(/obj/item/grown/log/tree/stick = 5,
				/obj/item/natural/stone = 5)
	req_table = TRUE

/datum/crafting_recipe/roguetown/poisonarrow
	name = "poisoned arrow [Iron Arrow|5xPoiBerry|Table]"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/poison
	reqs = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/iron = 1,
				/datum/reagent/berrypoison = 5
				)
	req_table = TRUE

/datum/crafting_recipe/roguetown/poisonarrow_stone
	name = "poisoned stone arrow [Stone Arrow|5xPoiBerry|Table]"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/stone/poison
	reqs = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/stone = 1,
				/datum/reagent/berrypoison = 5
				)
	req_table = TRUE

/*
/datum/crafting_recipe/roguetown/poisonbolt //Coded, but commented out pending balance discussion.
	name = "poisoned bolt"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/poison
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/datum/reagent/berrypoison = 5)

	req_table = TRUE
*/
/datum/crafting_recipe/roguetown/poisonarrow_five //Arrows and bolts can be smithed in batches of five. Makes sense for them to be dipped in batches of five, too
	name = "poisoned arrow (x5) [5xIronArrow|25xPoiBerry|Table]"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/poison
				)
	reqs = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/iron = 5,
				/datum/reagent/berrypoison = 25
				)

	req_table = TRUE

/*
/datum/crafting_recipe/roguetown/poisonbolt_five //Coded, but commented out pending balance discussion.
	name = "poisoned bolts (x5)"
	result = list(/obj/item/ammo_casing/caseless/rogue/bolt/poison = 5)
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 5,
				/datum/reagent/berrypoison = 25)

	req_table = TRUE
*/
/datum/crafting_recipe/roguetown/poisonarrow_five_stone
	name = "poisoned stone arrow (x5) [5xStoneArr|25xPoiBerry|Table]"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison,
				/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison
				)
	reqs = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/stone = 5,
				/datum/reagent/berrypoison = 25
				)

	req_table = TRUE

//pyro arrow crafting, from stonekeep
/datum/crafting_recipe/roguetown/pyrobolt
	name = "pyroclastic bolt [Bolt|Fyritius|Table]"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/pyro
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 1)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/pyrobolt_five
	name = "pyroclastic bolt (x5) [5xBolt|5xFyritius|Table]"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro
				)
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 5,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 5)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/pyroarrow
	name = "pyroclastic arrow [Iron Arrow|Fyritius|Table]"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/pyro
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow/iron = 1,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 1)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/pyroarrow_five
	name = "pyroclastic arrow (x5) [5xIron Arrow|5xFyritius|Table]"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro
				)
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow/iron = 5,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 5)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/mortar
	name = "stone mortar [Stone]"
	result = /obj/item/reagent_containers/glass/mortar
	reqs = list(/obj/item/natural/stone = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/pestle
	name = "stone pestle [Stone]"
	result = /obj/item/pestle
	reqs = list(/obj/item/natural/stone = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/bag
	name = "bag [Fiber|Cloth|Needle]"
	result = /obj/item/storage/roguebag/crafted
	reqs = list(/obj/item/natural/fibers = 1,
				/obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing

/datum/crafting_recipe/roguetown/bagx5
	name = "bag x5 [5xFiber|5xCloth|Needle]"
	result = list(
				/obj/item/storage/roguebag/crafted,
				/obj/item/storage/roguebag/crafted,
				/obj/item/storage/roguebag/crafted,
				/obj/item/storage/roguebag/crafted,
				/obj/item/storage/roguebag/crafted,
				)
	reqs = list(/obj/item/natural/fibers = 5,
				/obj/item/natural/cloth = 5)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	req_table = FALSE

/obj/item/storage/roguebag/crafted
	sellprice = 4


/datum/crafting_recipe/roguetown/bait
	name = "bait [Bag|2xWheat]"
	result = /obj/item/bait
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/grown/wheat = 2)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/sbaita
	name = "sweetbait [Bag|2xApple]"
	result = /obj/item/bait/sweet
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/grown/apple = 2)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/sbait
	name = "sweetbait [Bag|2xBerries]"
	result = /obj/item/bait/sweet
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 2)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/bloodbait
	name = "bloodbait [Bag|2xMeat]"
	result = /obj/item/bait/bloody
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/rogue/meat = 2)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/pipe
	name = "wood pipe [Sm Log]"
	result = /obj/item/clothing/mask/cigarette/pipe/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)


/obj/item/clothing/mask/cigarette/pipe/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/rod
	name = "fishing rod [Sm Log|2xFiber]"
	result = /obj/item/fishingrod/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 2)


/obj/item/fishingrod/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/woodspade
	name = "wood spade [Sm Log|Stick]"
	result = /obj/item/rogueweapon/shovel/small
	reqs = list(/obj/item/grown/log/tree/small = 1,
			/obj/item/grown/log/tree/stick = 1)
/obj/item/rogueweapon/shovel/small/crafted
	sellprice = 5

/datum/crafting_recipe/roguetown/broom
	name = "broom [Fiber|4xStick]"
	result = /obj/item/broom
	reqs = list(/obj/item/natural/fibers = 1,
			/obj/item/grown/log/tree/stick = 4)
	craftdiff = 1

/datum/crafting_recipe/roguetown/book_crafting_kit
	name = "book crafting kit [2xHide|Cloth|Needle]"
	result = /obj/item/book_crafting_kit
	reqs = list(
			/obj/item/natural/hide = 2,
			/obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle = 1)
	req_table = TRUE

/datum/crafting_recipe/roguetown/woodcross
	name = "wooden amulet [2xFiber|2xStick]"
	result = /obj/item/clothing/neck/roguetown/psicross/wood
	reqs = list(/obj/item/natural/fibers = 2,
				/obj/item/grown/log/tree/stick = 2)

/datum/crafting_recipe/roguetown/mantrap
	name = "mantrap [SmLog|2xFiber|Iron|Table]"
	result = list(/obj/item/restraints/legcuffs/beartrap,
				/obj/item/restraints/legcuffs/beartrap)
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 2,
				/obj/item/ingot/iron = 1)
	req_table = TRUE
	skillcraft = /datum/skill/craft/traps
	craftdiff = 1
	verbage_simple = "put together"
	verbage = "puts together"

/datum/crafting_recipe/roguetown/paperscroll
	name = "scroll of parchment [Sm Log|16oz Water|TanningRack]"
	result = list(/obj/item/paper/scroll,
				  /obj/item/paper/scroll,
				  /obj/item/paper/scroll)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/datum/reagent/water = 48)
	structurecraft = /obj/machinery/tanningrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/tribalrags
	name = "tribal rags [Hide|Fiber|Needle]"
	result = /obj/item/clothing/suit/roguetown/shirt/tribalrag
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fibers = 1)
	sellprice = 6
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage_simple = "sew"
	verbage = "sews"
	craftdiff = 0

/datum/crafting_recipe/roguetown/skullmask
	name = "skull mask [3xBone|Fiber]"
	result = /obj/item/clothing/mask/rogue/skullmask
	reqs = list(/obj/item/natural/bone = 3,
				/obj/item/natural/fibers = 1)
	sellprice = 10
	verbage_simple = "craft"
	verbage = "crafted"
	craftdiff = 0


/datum/crafting_recipe/roguetown/antlerhood
	name = "antlerhood [Hide|2xBone|Needle]"
	result = /obj/item/clothing/head/roguetown/antlerhood
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/bone = 2)
	sellprice = 12
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage_simple = "sew"
	verbage = "sews"
	craftdiff = 0

/datum/crafting_recipe/roguetown/bonespear
	name = "bone spear [Staff|2xBone|Fiber]"
	result = /obj/item/rogueweapon/spear/bonespear
	reqs = list(/obj/item/rogueweapon/woodstaff = 1,
				/obj/item/natural/bone = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3


/datum/crafting_recipe/roguetown/boneaxe
	name = "bone axe [Sm Log|2xBone|Fiber]"
	result = /obj/item/rogueweapon/stoneaxe/boneaxe
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/bone = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/prosthetic/woodleftarm
	name = "wood arm (L) [Sm Log]"
	result = list(/obj/item/bodypart/l_arm/prosthetic/woodleft)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/prosthetic/woodrightarm
	name = "wood arm (R) [Sm Log]"
	result = list(/obj/item/bodypart/r_arm/prosthetic/woodright)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/prosthetic/woodleftleft
	name = "wood leg (L) [Sm Log]"
	result = list(/obj/item/bodypart/l_leg/prosthetic)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/prosthetic/woodrightleg
	name = "wood leg (R) [Sm Log]"
	result = list(/obj/item/bodypart/r_leg/prosthetic)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3

/datum/crafting_recipe/roguetown/tarot_deck
	name = "tarot deck [Sm Log|3xScroll|Ash|Feather|Table]"
	result = list(/obj/item/toy/cards/deck/tarot)
	reqs = list(/obj/item/paper/scroll = 3,
				/obj/item/grown/log/tree/small = 1,
				/obj/item/ash = 1)
	skillcraft = /datum/skill/misc/reading
	tools = list(/obj/item/natural/feather)
	req_table = TRUE
	craftdiff = 2

// Woodcutting recipe
/datum/crafting_recipe/roguetown/lumberjacking
	skillcraft = /datum/skill/labor/lumberjacking
	tools = list(/obj/item/rogueweapon/huntingknife = 1)

/datum/crafting_recipe/roguetown/lumberjacking/cart_upgrade
	name = "woodcutters wheelbrace [2xSmLog|Stone]"
	result = /obj/item/cart_upgrade/level_1
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/natural/stone = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/lumberjacking/cart_upgrade2
	name = "reinforced wheelbrace [4xSmLog|Iron|Lvl1]"
	result = /obj/item/cart_upgrade/level_2
	reqs = list(/obj/item/grown/log/tree/small = 4,
				/obj/item/cart_upgrade/level_1 = 1,
				/obj/item/ingot/iron = 1)
	craftdiff = 4


/datum/crafting_recipe/roguetown/heatershield
	name = "heater shield [2xSm Log|Cured Leather]"
	result = /obj/item/rogueweapon/shield/heater/crafted
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/natural/hide/cured = 1)
	skillcraft = /datum/skill/craft/carpentry

/obj/item/rogueweapon/shield/heater/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/collar
	name = "collar [Cured Leather]"
	result = /obj/item/clothing/neck/roguetown/collar
	reqs = list(/obj/item/natural/hide/cured = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/bell_collar
	name = "bell Collar [Cured Leather|Bell]"
	result = /obj/item/clothing/neck/roguetown/collar/bell_collar
	reqs = list(
				/obj/item/natural/hide/cured = 1,
				/obj/item/jingle_bells = 1,
				)
	craftdiff = 0

// BOUQUETS & CROWNS

/datum/crafting_recipe/roguetown/bouquet_rosa
	name = "rosa bouquet [4xRosa|2xFiber|Scroll]"
	result = /obj/item/bouquet/rosa
	reqs = list(/obj/item/alch/rosa = 4,
				/obj/item/natural/fibers = 2,
				/obj/item/paper/scroll = 1)
	craftdiff = 0
	verbage_simple = "arranged"
	verbage = "arranges"

/datum/crafting_recipe/roguetown/bouquet_salvia
	name = "salvia bouquet [4xSalvia|2xFiber|Scroll]"
	result = /obj/item/bouquet/salvia
	reqs = list(/obj/item/alch/salvia = 4,
				/obj/item/natural/fibers = 2,
				/obj/item/paper/scroll = 1)
	craftdiff = 0
	verbage_simple = "arranged"
	verbage = "arranges"

/datum/crafting_recipe/roguetown/bouquet_matricaria
	name = "matricaria bouquet [4xMatric|2xFiber|Scroll]"
	result = /obj/item/bouquet/matricaria
	reqs = list(/obj/item/alch/matricaria = 4,
				/obj/item/natural/fibers = 2,
				/obj/item/paper/scroll = 1)
	craftdiff = 0
	verbage_simple = "arranged"
	verbage = "arranges"

/datum/crafting_recipe/roguetown/bouquet_calendula
	name = "calendula bouquet [4xCalend|2xFiber|Scroll]"
	result = /obj/item/bouquet/calendula
	reqs = list(/obj/item/alch/calendula = 4,
				/obj/item/natural/fibers = 2,
				/obj/item/paper/scroll = 1)
	craftdiff = 0
	verbage_simple = "arranged"
	verbage = "arranges"

/datum/crafting_recipe/roguetown/flowercrown_rosa
	name = "rosa crown [4xRosa|2xFiber]"
	result = /obj/item/flowercrown/rosa
	reqs = list(/obj/item/alch/rosa = 4,
				/obj/item/natural/fibers = 2)
	craftdiff = 0
	verbage_simple = "tied"
	verbage = "ties"

/datum/crafting_recipe/roguetown/flowercrown_salvia
	name = "salvia crown [4xSalvia|2xFiber]"
	result = /obj/item/flowercrown/salvia
	reqs = list(/obj/item/alch/salvia = 4,
				/obj/item/natural/fibers = 2)
	craftdiff = 0
	verbage_simple = "tied"
	verbage = "ties"

/datum/crafting_recipe/roguetown/candle/eora
	name = "eora's candle (x3) [Tallow|Rosa|9ozHolyWater]"
	result = list(
				/obj/item/candle/eora,
				/obj/item/candle/eora,
				/obj/item/candle/eora,
				)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1,
				/obj/item/alch/rosa = 1,
				/datum/reagent/water/blessed = 25)
