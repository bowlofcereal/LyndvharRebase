/obj/item/rogueore
	name = "ore"
	icon = 'icons/roguetown/items/ore.dmi'
	icon_state = "ore"
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = FIRE_PROOF
	experimental_inhand = FALSE
	grid_width = 32
	grid_height = 32

/obj/item/rogueore/gold
	name = "raw gold"
	desc = "A clump of dirty lustrous nuggets!"
	icon_state = "oregold1"
	smeltresult = /obj/item/ingot/gold
	sellprice = 10

/obj/item/rogueore/gold/Initialize()
	icon_state = "oregold[rand(1,3)]"
	..()


/obj/item/rogueore/silver
	name = "raw silver"
	desc = "A gleaming ore of moonlight hue."
	icon_state = "oresilv1"
	smeltresult = /obj/item/ingot/silver
	sellprice = 8

/obj/item/rogueore/silver/Initialize()
	icon_state = "oresilv[rand(1,3)]"
	..()


/obj/item/rogueore/iron
	name = "raw iron"
	desc = "A dark ore of rugged strength."
	icon_state = "oreiron1"
	smeltresult = /obj/item/ingot/iron
	sellprice = 5

/obj/item/rogueore/iron/Initialize()
	icon_state = "oreiron[rand(1,3)]"
	..()


/obj/item/rogueore/copper
	name = "raw copper"
	desc = "A burnished ore with reddish gleams."
	icon_state = "orecop1"
	smeltresult = /obj/item/ingot/copper
	sellprice = 3

/obj/item/rogueore/copper/Initialize()
	icon_state = "orecop[rand(1,3)]"
	..()

/obj/item/rogueore/tin
	name = "raw tin"
	desc = "A mass of soft, almost malleable white ore."
	icon_state = "oretin1"
	smeltresult = /obj/item/ingot/tin
	sellprice = 4

/obj/item/rogueore/tin/Initialize()
	icon_state = "oretin[rand(1,3)]"
	..()

/obj/item/rogueore/coal
	name = "coal"
	desc = "Dark lumps that become smoldering embers later in life."
	icon_state = "orecoal1"
	firefuel = 30 MINUTES
	smeltresult = /obj/item/rogueore/coal
	sellprice = 1

/obj/item/rogueore/coal/Initialize()
	icon_state = "orecoal[rand(1,3)]"
	..()

/obj/item/rogueore/coal/charcoal
	name = "charcoal"
	icon_state = "oreada"
	desc = "Wood that has been burnt and transformed into charcoal. Can be used to fuel fires or used to smelt iron."
	dropshrink = 0.8
	color = "#929292"
	firefuel = 15 MINUTES
	smeltresult = /obj/item/rogueore/coal/charcoal
	sellprice = 1

/obj/item/rogueore/cinnabar
	name = "cinnabar"
	desc = "Red gems that contain the essence of quicksilver."
	icon_state = "orecinnabar"
	grind_results = list(/datum/reagent/mercury = 15)
	sellprice = 5

/obj/item/ingot
	name = "ingot"
	icon = 'icons/roguetown/items/ore.dmi'
	icon_state = "ingot"
	w_class = WEIGHT_CLASS_NORMAL
	smeltresult = null
	resistance_flags = FIRE_PROOF
	smelted = TRUE
	var/datum/anvil_recipe/currecipe
	var/quality = SMELTERY_LEVEL_NORMAL
	grid_width = 64
	grid_height = 32

/obj/item/ingot/examine()
	. += ..()
	if(currecipe)
		. += "<span class='warning'>It is currently being worked on to become [currecipe.name].</span>"

/obj/item/ingot/Initialize(mapload, smelt_quality)
	. = ..()
	if(!smelt_quality)
		return
	quality = smelt_quality
	switch(quality)
		if(SMELTERY_LEVEL_SPOIL)
			name = "spoilt [name]"
			desc += " It is practically scrap."
			sellprice *= 0.5
		if(SMELTERY_LEVEL_POOR)
			name = "poor-quality [name]"
			desc += " It is of dubious quality." // EA NASSIR, WHEN I GET YOU...
			sellprice *= 0.8
		if(SMELTERY_LEVEL_GOOD)
			name = "good-quality [name]"
			desc += " It is of notable quality."
			sellprice *= 1.1
		if(SMELTERY_LEVEL_GREAT)
			name = "great-quality [name]"
			desc += " It is of remarkable quality. Fit for ambitious endeavours."
			sellprice *= 1.2
		if(SMELTERY_LEVEL_EXCELLENT)
			name = "excellent-quality [name]"
			desc += " It is of exquisite quality. It [pick("yearns","begs","demands")] to be turned into a masterwork."
			sellprice *= 1.3

/obj/item/ingot/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/tongs))
		var/obj/item/rogueweapon/tongs/T = I
		if (loc in user.contents)
			to_chat(user, span_warning("I can't take out \the [src] from inside."))
			return
		if(!T.hingot)
			forceMove(T)
			T.hingot = src
			T.hott = null
			T.update_icon()
			return
	..()

/obj/item/ingot/Destroy()
	if(currecipe)
		QDEL_NULL(currecipe)
	if(istype(loc, /obj/machinery/anvil))
		var/obj/machinery/anvil/A = loc
		A.hingot = null
		A.update_icon()
	..()

/obj/item/ingot/gold
	name = "gold bar"
	desc = "Solid wealth in your hands."
	icon_state = "ingotgold"
	smeltresult = /obj/item/ingot/gold
	sellprice = 100

/obj/item/ingot/iron
	name = "iron bar"
	desc = "Forged strength. Essential for crafting."
	icon_state = "ingotiron"
	smeltresult = /obj/item/ingot/iron
	sellprice = 15

/obj/item/ingot/iron/Initialize(mapload, smelt_quality)
	. = ..()
	var/static/list/slapcraft_recipe_list = list(
		/datum/crafting_recipe/roguetown/structure/plough,
		/datum/crafting_recipe/roguetown/survival/peasantry/thresher,
		/datum/crafting_recipe/roguetown/survival/peasantry/shovel,
		/datum/crafting_recipe/roguetown/survival/peasantry/hoe,
		/datum/crafting_recipe/roguetown/survival/peasantry/pitchfork,
		/datum/crafting_recipe/roguetown/survival/quarterstaff_iron,
		/datum/crafting_recipe/roguetown/survival/mantrap,
		)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
		)

/obj/item/ingot/copper
	name = "copper bar"
	desc = "This bar causes a gentle tingling sensation when touched."
	icon_state = "ingotcop"
	smeltresult = /obj/item/ingot/copper
	sellprice = 10

/obj/item/ingot/tin
	name = "tin bar"
	desc = "An ingot of strangely soft and malleable essence."
	icon_state = "ingottin"
	smeltresult = /obj/item/ingot/tin
	sellprice = 15

/obj/item/ingot/bronze
	name = "bronze bar"
	desc = "A hard and durable alloy favored by engineers and followers of Ravox alike."
	icon_state = "ingotbronze"
	smeltresult = /obj/item/ingot/bronze
	sellprice = 25

/obj/item/ingot/silver
	name = "silver bar"
	desc = "This bar radiates purity. Treasured by the realms."
	icon_state = "ingotsilv"
	smeltresult = /obj/item/ingot/silver
	sellprice = 80

/obj/item/ingot/steel
	name = "steel bar"
	desc = "This ingot is a stalwart defender of the realm."
	icon_state = "ingotsteel"
	smeltresult = /obj/item/ingot/steel
	sellprice = 20

/obj/item/ingot/blacksteel
	name = "blacksteel bar"
	desc = "Sacrificing the holy elements of silver for raw strength, this strange and powerful ingot's origin carries dark rumors.."
	icon_state = "ingotblacksteel"
	smeltresult = /obj/item/ingot/blacksteel
	sellprice = 100

//Blessed Ingots
/obj/item/ingot/steelholy/
	name = "holy steel bar"
	desc = "This ingot of steel has been touched by Malum. It radiates heat, even when outside a forge."
	icon_state = "ingotsteelholy"
	smeltresult = /obj/item/ingot/steel //Smelting it removes the blessing
	sellprice = 20

/obj/item/ingot/silverblessed/
	name = "blessed silver bar"
	desc = "This bar radiates a divine purity. Treasured by the realms and commonly found in Valorian weaponry."
	icon_state = "ingotsilvblessed"
	smeltresult = /obj/item/ingot/silver //Smelting it removes the blessing
	sellprice = 100

/obj/item/ingot/aalloy
	name = "ancient alloy"
	desc = "An old, decrepit slab of metal. Aeon has withered it's strength."
	icon_state = "ingotancient"
	smeltresult = /obj/item/ingot/aalloy
	sellprice = 5


/obj/item/ingot/purifiedaalloy
	name = "purified ancient alloy"
	desc = "An old slab of metal, sparked to life by Malum's craft."
	icon_state = "ingotancient"
	smeltresult = /obj/item/ingot/aaslag
	sellprice = 100


/obj/item/ingot/aaslag
	name = "ancient slag"
	desc = "What was once great, cannot be maintained forever."
	icon_state = "ancientslag"
	smeltresult = /obj/item/ingot/aaslag
	sellprice = 0
