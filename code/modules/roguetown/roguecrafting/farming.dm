/datum/crafting_recipe/roguetown/farming
	req_table = FALSE
	verbage_simple = "mix"
	skillcraft = /datum/skill/labor/farming
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/farming/fertilizer
	name = "fertilizer [Compost|Bone|Manure]"
	result = /obj/item/fertilizer
	reqs = list(/obj/item/compost = 1, /obj/item/natural/bone = 1, /obj/item/natural/poo = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/farming/fertilizer5x
	name = "5x fertilizer [5xCompost|5xBone|5xManure]"
	result = list(/obj/item/fertilizer,
				/obj/item/fertilizer,
				/obj/item/fertilizer,
				/obj/item/fertilizer,
				/obj/item/fertilizer,
				)
	reqs = list(/obj/item/compost = 5, /obj/item/natural/bone = 5, /obj/item/natural/poo = 5)
	craftdiff = 3
