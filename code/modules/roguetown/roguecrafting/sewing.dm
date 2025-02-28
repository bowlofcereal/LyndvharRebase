/datum/crafting_recipe/roguetown/sewing
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing

/* craftdif of 0 */

/datum/crafting_recipe/roguetown/sewing/headband
	name = "headband [Cloth]"
	result = list(/obj/item/clothing/head/roguetown/headband)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/peasantcap
	name = "peasant cap [Cloth]"
	result = list(/obj/item/clothing/head/roguetown/armingcap)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/apron_waist
	name = "waist apron [3xCloth]"
	result = list(/obj/item/clothing/cloak/apron/waist)
	reqs = list(/obj/item/natural/cloth = 3) // 3 because it thas a storage, but it really just a apron.
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/apron/blacksmith
	name = "leather apron [2xCloth|Cured]"
	result = list(/obj/item/clothing/cloak/apron/blacksmith)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/hide/cured = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/rags
	name = "rags [2xCloth]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/rags)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/burial_shroud
	name = "winding sheet [2xCloth]"
	result = list(/obj/item/burial_shroud)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/loincloth
	name = "loincloth [Cloth]"
	result = list(/obj/item/clothing/under/roguetown/loincloth)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/brownloincloth
	name = "brown loincloth [Cloth]"
	result = list(/obj/item/clothing/under/roguetown/loincloth/brown)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0


/datum/crafting_recipe/roguetown/sewing/linedanklet
	name = "cloth anklet [2xCloth|2xFiber]"
	result = list(/obj/item/clothing/shoes/roguetown/boots/clothlinedanklets)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 0

/* craftdif of 1 */

/datum/crafting_recipe/roguetown/sewing/clothgloves
	name = "cloth gloves [Cloth|Fiber]"
	result = list(/obj/item/clothing/gloves/roguetown/fingerless)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/brimmed
	name = "brimmed hat [Cloth|2xFiber]"
	result = list(/obj/item/clothing/head/roguetown/brimmed)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/tunic
	name = "tunic [2xCloth]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/tunic/white)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/lowcut_shirt
	name = "low cut tunic [2xCloth|Fiber]"
	reqs = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/fibers = 1,
	)
	result = /obj/item/clothing/suit/roguetown/shirt/undershirt/lowcut

/datum/crafting_recipe/roguetown/sewing/noblecoat
	name = "fancy coat [3xCloth|Silk]"
	result = /obj/item/clothing/suit/roguetown/shirt/tunic/noblecoat
	reqs = list(/obj/item/natural/cloth = 3,
			/obj/item/natural/silk = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/shadowshirt
	name = "silk shirt [2xCloth|3xSilk]"
	result = /obj/item/clothing/suit/roguetown/shirt/shadowshirt
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 3)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/clothshirt
	name = "cloth shirt [2xCloth|Fiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/clothtrou
	name = "cloth trousers [2xCloth|Fiber]"
	result = list(/obj/item/clothing/under/roguetown/trou)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/longcoat
	name = "longcoat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/suit/roguetown/armor/longcoat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/workervest
	name = "striped tunic [2xCloth|2xFiber]"
	result = list(/obj/item/clothing/suit/roguetown/armor/workervest)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/tights
	name = "tights [2xCloth|Fiber]"
	result = list(/obj/item/clothing/under/roguetown/tights/random)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/Reyepatch
	name = "right eye patch [Cloth|Fiber]"
	result = list(/obj/item/clothing/mask/rogue/eyepatch)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/Leyepatch
	name = "left eye patch [Cloth|Fiber]"
	result = list(/obj/item/clothing/mask/rogue/eyepatch/left)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/knitcap
	name = "knit cap [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/knitcap)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/strawhat
	name = "straw hat [3xFiber]"
	result = list(/obj/item/clothing/head/roguetown/strawhat)
	reqs = list(/obj/item/natural/fibers = 3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/sack
	name = "sack hood [3xCloth]"
	result = list(/obj/item/clothing/head/roguetown/menacing)
	reqs = list(/obj/item/natural/cloth = 3,)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/basichood
	name = "hood [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/roguehood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/lgambeson
    name = "light gambeson [2xCloth|Fiber]"
    result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/light)
    reqs = list(/obj/item/natural/cloth = 2,
                /obj/item/natural/fibers = 1)
    craftdiff = 1

/* craftdif of 2+ */

/datum/crafting_recipe/roguetown/sewing/wrappings
	name = "solar wrappings [2xCloth]"
	result = list(/obj/item/clothing/wrists/roguetown/wrappings)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/nocwrappings
	name = "moon wrappings [2xCloth]"
	result = list(/obj/item/clothing/wrists/roguetown/nocwrappings)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/nunveil
	name = "nun veil [Cloth]"
	result = list(/obj/item/clothing/head/roguetown/nun)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/nunhabit
	name = "nun habit [2xCloth]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/nun)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/necramask
	name = "death mask [2xCloth|Fiber|Bone]"
	result = list(/obj/item/clothing/head/roguetown/necramask)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/bone = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/coif
	name = "coif [2xCloth|Fiber]"
	result = list(/obj/item/clothing/neck/roguetown/coif)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/tabard
	name = "tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/tabard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/stabard
	name = "surcoat [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/stabard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/abyssortemplartabard
	name = "abyssorite templar tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/abyssortabard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3


/datum/crafting_recipe/roguetown/sewing/psydon
	name = "psydon tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/templar/psydon)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/astrata
	name = "astrata tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/templar/astrata)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/noc
	name = "noc tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/templar/noc)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/dendor
	name = "dendor tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/templar/dendor)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/necra
	name = "necra tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/templar/necra)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/abyssor
	name = "abyssor tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/templar/abyssor)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/malum
	name = "malum tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/templar/malum)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/eora
	name = "eora tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/templar/eora)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/pestra
	name = "pestra tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/templar/pestra)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/ravox
	name = "ravox tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/templar/ravox)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/xylix
	name = "xylix tabard [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/templar/xylix)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/stabard/guard
	name = "guard surcoat"
	result = list(/obj/item/clothing/cloak/stabard/guard)

/datum/crafting_recipe/roguetown/sewing/stabard/bog
	name = "bog surcoat"
	result = list(/obj/item/clothing/cloak/stabard/bog)

/datum/crafting_recipe/roguetown/sewing/robe
	name = "robes [3xCloth|Fiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/bardress
	name = "bar dress [3xCloth|Fiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/stockdress
	name = "dress [3xCloth|Fiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/Bladress
	name = "black dress [3xCloth|Fiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/black)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/Bludress
	name = "blue dress [3xCloth|Fiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/blue)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/Purdress
	name = "purple dress [3xCloth|Fiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/purple)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/fancyhat
	name = "fancy hat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/fancyhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/gambeson
	name = "gambeson [4xCloth|Fiber]"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 20

/datum/crafting_recipe/roguetown/sewing/armingjacket
	name = "arming jacket [4xCloth|Fiber]"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/paddedcap
	name = "padded Cap [5xFiber]"
	result = /obj/item/clothing/head/roguetown/paddedcap
	reqs = list(/obj/item/natural/fibers = 5)
	tools = list(/obj/item/needle)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/bardhat
	name = "bard hat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/bardhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/bucklehat
	name = "buckle hat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/bucklehat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/archer
	name = "archer cap [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/archercap)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/duelist
	name = "duelist hat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/duelhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/witchhat
	name = "witch hat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/witchhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/hgambeson
    name = "padded gambeson [6xCloth|4xFiber]"
    result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy)
    reqs = list(/obj/item/natural/cloth = 6,
                /obj/item/natural/fibers = 4)
    craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/chaperon
	name = "chaperon hat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/chaperon)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/jupon
	name = "jupon [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/stabard/surcoat)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/armordress
	name = "armored dress [2xCloth|Fiber|Cured]"
	result = list(/obj/item/clothing/suit/roguetown/armor/armordress)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/hide/cured = 1)
	craftdiff = 3
	sellprice = 30

/datum/crafting_recipe/roguetown/sewing/ragmask
	name = "rag mask [Cloth]"
	result = list(/obj/item/clothing/mask/rogue/ragmask)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0
	sellprice = 3

/datum/crafting_recipe/roguetown/sewing/cape
	name = "cape [2xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/cape)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/sexydress
	name = "sheer dress [6xCloth|3xFiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy)
	reqs = list(/obj/item/natural/cloth = 6,
				/obj/item/natural/fibers = 3)
	craftdiff = 5
	sellprice = 20

/datum/crafting_recipe/roguetown/sewing/wizhatblue
	name = "blue wizard hat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/wizhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/wizhatred
	name = "red wizard hat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/wizhat/red)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/wizhatyellow
	name = "yellow wizard hat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/wizhat/yellow)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/wizhatgreen
	name = "green wizard hat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/wizhat/green)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/wizhatblack
	name = "black wizard hat [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/wizhat/black)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/cape/desert
	name = "desert cape [4xCloth|2xFiber]"
	result = list(/obj/item/clothing/cloak/cape/crusader)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/cape/rider
	name = "rider cloak [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/half/rider)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/cape/half
	name = "half cloak [3xCloth|Fiber]"
	result = list(/obj/item/clothing/cloak/half)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/undervestments
	name = "undervestments [3xCloth|Fiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/priest)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/keffiyeh
	name = "keffiyeh [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/roguehood/shalal)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/hijab
	name = "hijab [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/roguehood/shalal/hijab)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/heavyhood
	name = "heavy hood [2xCloth|Fiber]"
	result = list(/obj/item/clothing/head/roguetown/roguehood/shalal/heavyhood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/royalgown
	name = "royal gown [3xCloth|2xFiber|3xSilk]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/royal)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 3)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 45

/datum/crafting_recipe/roguetown/sewing/royaldress
	name = "royal dress [3xCloth|2xFiber|2xSilk]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/royal/princess)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 2)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 30

/datum/crafting_recipe/roguetown/sewing/royalshirt
	name = "royal shirt [3xCloth|2xFiber|2xSilk]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/royal/prince)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 2)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 30

/datum/crafting_recipe/roguetown/sewing/regalrobes
	name = "regal robes [3xCloth|2xFiber|2xSilk]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/vampire)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 2)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 30

/datum/crafting_recipe/roguetown/sewing/grenzelshirt
	name = "grenzelhoftian hip-shirt [2xCloth|2xFiber|1xSilk]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/grenzelhoft)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 20

/datum/crafting_recipe/roguetown/sewing/silktunic
	name = "ornate silk tunic [2xCloth|2xFiber|2xSilk]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/tunic/silktunic)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 2)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 25
	
/datum/crafting_recipe/roguetown/sewing/silkdress
	name = "ornate silk dress [2xCloth|2xFiber|2xSilk]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/steward)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 2)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 30

/datum/crafting_recipe/roguetown/sewing/archivist
	name = "voluminous robes [2xCloth|2xFiber|Silk]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/archivist)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 25

/datum/crafting_recipe/roguetown/sewing/apothshirt
	name = "knitted sweater [2xCloth|2xFiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/apothshirt)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 15

/datum/crafting_recipe/roguetown/sewing/artificer
	name = "shirt and doublet [2xCloth|2xFiber|Cured]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/artificer)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/hide/cured = 1)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 20

/datum/crafting_recipe/roguetown/sewing/winterdress
	name = "winter dress [4xCloth|2xFiber|2xSilk]"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/winterdress)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 2)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 25

/datum/crafting_recipe/roguetown/sewing/skirt
	name = "skirt [Cloth|2xFiber]"
	result = list(/obj/item/clothing/under/roguetown/skirt)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 10

/datum/crafting_recipe/roguetown/sewing/clothshorts
	name = "cloth shorts [Cloth|Fiber]"
	result = list(/obj/item/clothing/under/roguetown/tights/sailor)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 5

/datum/crafting_recipe/roguetown/sewing/grenzelpants
	name = "grenzelhoftian paumpers [2xCloth|Fiber|Cured]"
	result = list(/obj/item/clothing/under/roguetown/grenzelpants)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/hide/cured = 1)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 15

/datum/crafting_recipe/roguetown/sewing/shadowpants
	name = "silk pants [2xCloth|2xSilk]"
	result = list(/obj/item/clothing/under/roguetown/trou/shadowpants)
	reqs = list(/obj/item/natural/cloth = 2,
	            /obj/item/natural/silk = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 18

/datum/crafting_recipe/roguetown/sewing/apothpants
	name = "knitted pants [Cloth|2xFiber]"
	result = list(/obj/item/clothing/under/roguetown/trou/apothecary)
	reqs = list(/obj/item/natural/cloth = 1,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/royalsleeves
	name = "royal sleeves [Cloth|2xFiber|Silk]"
	result = list(/obj/item/clothing/wrists/roguetown/royalsleeves)
	reqs = list(/obj/item/natural/cloth = 1,
	            /obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 19

/datum/crafting_recipe/roguetown/sewing/nemes
	name = "nemes [2xCloth|2xFiber]"
	result = list(/obj/item/clothing/head/roguetown/headdress)
	reqs = list(/obj/item/natural/cloth = 2,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 10

/datum/crafting_recipe/roguetown/sewing/hatfur
	name = "fur hat [Cloth|Fiber|Fur]"
	result = list(/obj/item/clothing/head/roguetown/hatfur)
	reqs = list(/obj/item/natural/cloth = 1,
	            /obj/item/natural/fibers = 1,
				/obj/item/natural/fur = 1)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/shawl
	name = "shawl [Cloth]"
	result = list(/obj/item/clothing/head/roguetown/shawl)
	reqs = list(/obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 2
	sellprice = 5

/datum/crafting_recipe/roguetown/sewing/grenzelhat
	name = "grenzelhoftian hat [Cloth|Fiber|2xSilk]"
	result = list(/obj/item/clothing/head/roguetown/grenzelhofthat)
	reqs = list(/obj/item/natural/cloth = 1,
	            /obj/item/natural/fibers = 1,
				/obj/item/natural/silk = 2)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 15

/datum/crafting_recipe/roguetown/sewing/articap
	name = "flat cap [Cloth|Fiber|Cured]"
	result = list(/obj/item/clothing/head/roguetown/articap)
	reqs = list(/obj/item/natural/cloth = 1,
	            /obj/item/natural/fibers = 1,
				/obj/item/natural/hide/cured = 1)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/lordlycloak
	name = "royal cloak [3xCloth|2xFiber|2xFur|2xSilk]"
	result = list(/obj/item/clothing/cloak/lordcloak)
	reqs = list(/obj/item/natural/cloth = 3,
	            /obj/item/natural/fibers = 2,
				/obj/item/natural/fur = 2,
				/obj/item/natural/silk = 2)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 35

/datum/crafting_recipe/roguetown/sewing/naledisash
	name = "neck sash [2xCloth|2xFiber]"
	result = list(/obj/item/clothing/cloak/hierophant)
	reqs = list(/obj/item/natural/cloth = 2,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 15

/datum/crafting_recipe/roguetown/sewing/ladycloak
	name = "royal half-cloak [2xCloth|2xFiber|2xSilk|Fur]"
	result = list(/obj/item/clothing/cloak/lordcloak/ladycloak)
	reqs = list(/obj/item/natural/cloth = 2,
	            /obj/item/natural/fibers = 2,
			    /obj/item/natural/silk = 2,
				/obj/item/natural/fur = 1)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 30

/datum/crafting_recipe/roguetown/sewing/furovercoat
	name = "fur overcoat [3xCloth|Fiber|Silk|Fur]"
	result = list(/obj/item/clothing/cloak/black_cloak)
	reqs = list(/obj/item/natural/cloth = 3,
	            /obj/item/natural/fibers = 1,
				/obj/item/natural/silk = 1,
				/obj/item/natural/fur = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 22
	
/datum/crafting_recipe/roguetown/sewing/sleevelessovercoat
	name = "sleeveless overcoat [3xCloth|2xFiber]"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/vest/hand)
	reqs = list(/obj/item/natural/cloth = 3,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 16

/datum/crafting_recipe/roguetown/sewing/guildedjacket
	name = "guilded jacket [3xCloth|2xFiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/merchant)
	reqs = list(/obj/item/natural/cloth = 3,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 19

/datum/crafting_recipe/roguetown/sewing/buttonedlongcoat
	name = "buttoned longcoat [3xCloth|2xFiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/physician)
	reqs = list(/obj/item/natural/cloth = 3,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 20

/datum/crafting_recipe/roguetown/sewing/desertgown
	name = "desert gown [3xCloth|2xFiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/hierophant)
	reqs = list(/obj/item/natural/cloth = 3,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 17

/datum/crafting_recipe/roguetown/sewing/halfrobe
	name = "baggy half-robe [3xCloth|2xFiber]"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/hierophant)
	reqs = list(/obj/item/natural/cloth = 3,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 15

/datum/crafting_recipe/roguetown/sewing/monkrobe
	name = "monk robe [2xCloth|2xFiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/pointfex)
	reqs = list(/obj/item/natural/cloth = 2,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 15

/datum/crafting_recipe/roguetown/sewing/otavangambeson
	name = "otavan gambeson [6xCloth|5xFiber]"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/otavan)
	reqs = list(/obj/item/natural/cloth = 6,
	            /obj/item/natural/fibers = 5)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 24

/datum/crafting_recipe/roguetown/sewing/sleevelessrobe
	name = "sleeveless robe [3xCloth|2xFiber]"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/phys)
	reqs = list(/obj/item/natural/cloth = 3,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 4
	sellprice = 13
	
