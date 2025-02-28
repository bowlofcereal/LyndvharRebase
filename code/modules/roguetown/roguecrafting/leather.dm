
/datum/crafting_recipe/roguetown/leather
	tools = list(/obj/item/needle)
	structurecraft = /obj/machinery/tanningrack
	skillcraft = /datum/skill/craft/tanning

/datum/crafting_recipe/roguetown/leather/bedroll
	name = "bedroll [2xCured|Rope|Needle]"
	result = /obj/item/bedroll
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/rope = 1)
	tools = list(/obj/item/needle)
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/corset
	name = "corset [Hide|Fiber]"
	result = /obj/item/clothing/suit/roguetown/armor/corset
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	sellprice = 15
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/pouch
	name = "leather pouch [Cured|Fiber]"
	result = list(/obj/item/storage/belt/rogue/pouch,
				/obj/item/storage/belt/rogue/pouch)
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	sellprice = 6
	craftdiff = 0

/datum/crafting_recipe/roguetown/leather/satchel
	name = "leather satchel [2xCured|Fiber]"
	result = /obj/item/storage/backpack/rogue/satchel
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	sellprice = 15

/datum/crafting_recipe/roguetown/leather/backpack
	name = "leather backpack [2xCured|Fiber]"
	result = /obj/item/storage/backpack/rogue/backpack
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	sellprice = 45

/datum/crafting_recipe/roguetown/leather/waterskin
	name = "waterskin [Cured|2xFiber]"
	result = /obj/item/reagent_containers/glass/bottle/waterskin
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 2)
	sellprice = 45

/datum/crafting_recipe/roguetown/leather/quiver
	name = "quiver [2xCured|2xFiber]"
	result = /obj/item/quiver
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2)
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/javelinbag
	name = "javelin bag [Tallow|Rope]"
	result = /obj/item/quiver/javelin
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow =1,
				/obj/item/rope = 1)
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/gwstrap
	name = "Greatweapon Strap [2xCured|Rope]"
	result = /obj/item/gwstrap
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/rope = 1)
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/twstrap
	name = "bandolier [2xCured|Rope]"
	result = /obj/item/twstrap
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/rope = 1)
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/belt
	name = "leather belt [2xCured|2xFiber]"
	result = /obj/item/storage/belt/rogue/leather
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2)
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/belt/knifebelt
	name = "leather knifebelt [2xCured|2xFiber]"
	result = /obj/item/storage/belt/rogue/leather/knifebelt
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2)
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/gloves
	name = "leather gloves [Cured]"
	result = list(/obj/item/clothing/gloves/roguetown/leather,
	/obj/item/clothing/gloves/roguetown/leather)
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/heavygloves
	name = "heavy leather gloves [Fur]"
	result = /obj/item/clothing/gloves/roguetown/angle
	reqs = list(/obj/item/natural/fur = 1)
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/fingerless_leather_gloves
	name = "fingerless gloves [Cured|Tallow|Fiber]"
	result = /obj/item/clothing/gloves/roguetown/fingerless_leather
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/lgorget
	name = "hardened leather gorget [Cured|Fiber]"
	result = /obj/item/clothing/neck/roguetown/leather
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/leather/heavybracers
	name = "hardened leather bracers [Cured|Fiber]"
	result = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/leather/bracers
	name = "leather bracers [Cured]"
	result = list(/obj/item/clothing/wrists/roguetown/bracers/leather,
			/obj/item/clothing/wrists/roguetown/bracers/leather)
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/pants
	name = "leather pants [Cured]"
	result = list(/obj/item/clothing/under/roguetown/trou/leather)
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/volfhelm
	name = "volf helm [Hide|2xFur|Volfhead]"
	result = list(/obj/item/clothing/head/roguetown/helmet/leather/volfhelm)
	reqs = list(/obj/item/natural/hide = 1, /obj/item/natural/fur = 2, /obj/item/natural/head/volf = 1)
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/volfmantle
	name = "volf mantle [2xHide|Volfhead]"
	result = /obj/item/clothing/cloak/volfmantle
	reqs = list(
		/obj/item/natural/hide = 2,
		/obj/item/natural/head/volf = 1,
	)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/heavy_leather_pants
	name = "hardened leather pants [Cured|Tallow|Fiber]"
	result = list(/obj/item/clothing/under/roguetown/heavy_leather_pants)
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	sellprice = 20
	craftdiff = 3

/datum/crafting_recipe/roguetown/leather/heavy_leather_pants/shorts
	name = "hardened leather shorts [Cured|Tallow|Fiber]"
	result = list(/obj/item/clothing/under/roguetown/heavy_leather_pants/shorts)
	reqs = list(
		/obj/item/natural/hide/cured = 1, //they cover less, you see
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/shoes
	name = "leather shoes [Cured]"
	result = list(/obj/item/clothing/shoes/roguetown/simpleshoes,
				/obj/item/clothing/shoes/roguetown/simpleshoes,
				/obj/item/clothing/shoes/roguetown/simpleshoes)
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/boots
	name = "leather boots [Cured]"
	result = /obj/item/clothing/shoes/roguetown/boots/leather
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 27

/datum/crafting_recipe/roguetown/leather/boots/furlinedboots
	name = "fur-lined boots [Cured|Fur]"
	result = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fur = 1)

/datum/crafting_recipe/roguetown/leather/boots/short
	name = "shortboots [Cured]"
	result = /obj/item/clothing/shoes/roguetown/shortboots
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/leather/boots/dark
	name = "dark boots [Cured]"
	result = /obj/item/clothing/shoes/roguetown/boots
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/leather/boots/noble
	name = "noble boots [3xCured|Fur]"
	result = /obj/item/clothing/shoes/roguetown/nobleboot
	reqs = list(/obj/item/natural/hide/cured = 3,
				/obj/item/natural/fur = 1)

/datum/crafting_recipe/roguetown/leather/helmet
	name = "leather helmet [Cured]"
	result = /obj/item/clothing/head/roguetown/helmet/leather
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 27

/datum/crafting_recipe/roguetown/leather/bandana
	name = "leather bandana [Cured]"
	result = /obj/item/clothing/head/roguetown/helmet/bandana
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 27
	craftdiff = 0

/datum/crafting_recipe/roguetown/leather/tricorn
	name = "leather tricorn [Cured]"
	result = /obj/item/clothing/head/roguetown/helmet/tricorn
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 27

/datum/crafting_recipe/roguetown/leather/hood
	name = "leather hood [Cured]"
	result = /obj/item/clothing/head/roguetown/roguehood
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 26

/datum/crafting_recipe/roguetown/leather/vest
	name = "leather vest [2xCured]"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/leather/armor
	name = "leather armor [2xCured]"
	result = /obj/item/clothing/suit/roguetown/armor/leather
	reqs = list(/obj/item/natural/hide/cured = 2)
	sellprice = 26

/datum/crafting_recipe/roguetown/leather/bikini
	name = "leather bikini armor [2xCured]"
	result = /obj/item/clothing/suit/roguetown/armor/leather/bikini
	reqs = list(/obj/item/natural/hide/cured = 2)
	sellprice = 26

/datum/crafting_recipe/roguetown/leather/hidearmor
	name = "hide armor [2xCured|Fur]"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	sellprice = 26
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/heavy_leather_armor
	name = "hardened leather armor [2xCured|Tallow|Fiber]"
	result = /obj/item/clothing/suit/roguetown/armor/leather/heavy
	reqs = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	sellprice = 26
	craftdiff = 3

/datum/crafting_recipe/roguetown/leather/heavy_leather_armor/coat
	name = "hardened leather coat [3xCured|Tallow|Fiber]"
	result = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
	reqs = list(
		/obj/item/natural/hide/cured = 3,
		/obj/item/reagent_containers/food/snacks/tallow = 1,
		/obj/item/natural/fibers = 1,
		)
	sellprice = 36
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/hidebikini
	name = "hide bikini armor [2xCured|Fur]"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide/bikini
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	sellprice = 26

/datum/crafting_recipe/roguetown/leather/cloak
	name = "leather cloak [2xCured]"
	result = /obj/item/clothing/cloak/raincloak/brown
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/leather/apron/blacksmith
	name = "leather apron [2xCured|Fiber]"
	result = /obj/item/clothing/cloak/apron/blacksmith
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/leather/cloakfur
	name = "fur cloak [2xCured|Fur]"
	result = /obj/item/clothing/cloak/raincloak/furcloak/crafted
	reqs = list(/obj/item/natural/hide/cured = 2,/obj/item/natural/fur = 1)

/obj/item/clothing/cloak/raincloak/furcloak/crafted
	sellprice = 55

/datum/crafting_recipe/roguetown/leather/papakha
	name = "papakha hat [Fur|2xFiber]"
	result = /obj/item/clothing/head/roguetown/papakha/crafted
	reqs = list(/obj/item/natural/fur = 1, /obj/item/natural/fibers = 2)

/obj/item/clothing/head/roguetown/papakha/crafted
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/saddle
	name = "saddle [2xCured]"
	result = /obj/item/natural/saddle
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/leather/whip
	name = "leather whip [2xCured|Stone]"
	result = /obj/item/rogueweapon/whip
	reqs = list(/obj/item/natural/hide/cured = 2,/obj/item/natural/stone = 1)
	sellprice = 39

/datum/crafting_recipe/roguetown/leather/drum
	name = "Drum [Cured|Sm Log]"
	result = /obj/item/rogue/instrument/drum
	reqs = list(/obj/item/natural/hide/cured = 1,/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/leather/vest/sailor
	name = "leather sea jacket [2xCured]"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/leather/darkcloak
	name = "dark cloak [2xFur|4xCured]"
	result = list(/obj/item/clothing/cloak/darkcloak)
	reqs = list(/obj/item/natural/fur = 2,
				/obj/item/natural/hide/cured = 4)
	craftdiff = 5
	sellprice = 80

/datum/crafting_recipe/roguetown/leather/bearcloak
	name = "direbear cloak [2xFur|4xCured]"
	result = list(/obj/item/clothing/cloak/darkcloak/bear)
	reqs = list(/obj/item/natural/fur = 2,
				/obj/item/natural/hide/cured = 4)
	craftdiff = 3
	sellprice = 80

/datum/crafting_recipe/roguetown/leather/lightbearcloak
	name = "light direbear cloak [2xFur|4xCured]"
	result = list(/obj/item/clothing/cloak/darkcloak/bear/light)
	reqs = list(/obj/item/natural/fur = 2,
				/obj/item/natural/hide/cured = 4)
	craftdiff = 3
	sellprice = 80

/datum/crafting_recipe/roguetown/leather/otavanleatherpants
	name = "otavan leather trousers [Fiber|2xCured|Fur|Needle]"
	result = list(/obj/item/clothing/under/roguetown/trou/otavan)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1,
	            /obj/item/natural/fibers = 1,
	            /obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/leathertights
	name = "leather tights [Cured|Needle]"
	result = list(/obj/item/clothing/under/roguetown/trou/leathertights)
	reqs = list(/obj/item/natural/hide/cured = 1)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/artipants
	name = "thin leather pants [Cloth|Cured|Needle]"
	result = list(/obj/item/clothing/under/roguetown/trou/artipants)
	reqs = list(/obj/item/natural/cloth = 1,
	            /obj/item/natural/hide/cured = 1)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 11

/datum/crafting_recipe/roguetown/leather/baggyleatherpants
	name = "baggy leather pants [Cloth|Fiber|Cured|Needle]"
	result = list(/obj/item/clothing/under/roguetown/trou/leather/pontifex)
	reqs = list(/obj/item/natural/cloth = 1,
	            /obj/item/natural/fibers = 1,
	            /obj/item/natural/hide/cured = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 20
		
/datum/crafting_recipe/roguetown/leather/gladsandals
	name = "gladiator sandals [2xCured|Fiber|Needle]"
	result = list(/obj/item/clothing/shoes/roguetown/gladiator)
	reqs = list(/obj/item/natural/hide/cured = 2,
	            /obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/leather/grenzelboots
	name = "grenzelhoftian boots [2xCured|2xFiber|Needle]"
	result = list(/obj/item/clothing/shoes/roguetown/grenzelhoft)
	reqs = list(/obj/item/natural/hide/cured = 2,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 15
	
/datum/crafting_recipe/roguetown/leather/otavanboots
	name = "otavan leather boots [Cured|Tallow|Fur|Fiber|Needle]"
	result = list(/obj/item/clothing/shoes/roguetown/otavan)
	reqs = list(/obj/item/natural/hide/cured = 1,
	            /obj/item/reagent_containers/food/snacks/tallow = 1,
				/obj/item/natural/fur = 1,
	            /obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 25

/datum/crafting_recipe/roguetown/leather/buckleshoes
	name = "buckled shoes [Cured|2xFiber|Needle]"
	result = list(/obj/item/clothing/shoes/roguetown/simpleshoes/buckle)
	reqs = list(/obj/item/natural/hide/cured = 1,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 25

/datum/crafting_recipe/roguetown/leather/volfmantle
	name = "volf mantle [Cured|Volfhead|Needle]"
	result = list(/obj/item/clothing/cloak/volfmantle)
	reqs = list(/obj/item/natural/hide/cured = 1,
	            /obj/item/natural/head/volf = 1)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 15

/datum/crafting_recipe/roguetown/leather/monkleather
	name = "asymetrical leather vest [2xCured|Cloth|Needle]"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/pontifex)
	reqs = list(/obj/item/natural/hide/cured = 2,
	            /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 23

/datum/crafting_recipe/roguetown/leather/greatcoat
	name = "greatcoat [3xCured|Fur|Cloth|Needle]"
	result = list(/obj/item/clothing/suit/roguetown/armor/brigandine/sheriff/coat)
	reqs = list(/obj/item/natural/hide/cured = 3,
				/obj/item/natural/fur = 1,
	            /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 24

/datum/crafting_recipe/roguetown/leather/furlinedjacket
	name = "fur-lined jacket [2xCured|Fur|Cloth|Needle]"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/jacket/artijacket)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1,
	            /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 21

/datum/crafting_recipe/roguetown/leather/winterjacket
	name = "winter jacket [2xCured|2xFur|Cloth|Needle]"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/vest/winterjacket)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 2,
	            /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 24

/datum/crafting_recipe/roguetown/leather/openrobes
	name = "open robe [2xCured|Fiber|Cloth|Needle]"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/heavy/atgervi)
	reqs = list(/obj/item/natural/hide/cured = 2,
	            /obj/item/natural/fibers = 1,
	            /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 20
	
	