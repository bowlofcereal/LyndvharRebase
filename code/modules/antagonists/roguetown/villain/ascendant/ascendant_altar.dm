// OH GOD IT'S SO SHITTY IM SO SORRY PLEASE PLEAS EPLEASEP ELEA

/datum/crafting_recipe/roguetown/structure/ascendant
	name = "ascendant's altar"
	result = /obj/structure/ascendant_altar
	reqs = list(
		/obj/item/bodypart = 2,
		/obj/item/organ/stomach = 1,
	)
	verbage_simple = "construct"
	verbage = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = null
	always_availible = FALSE
	subtype_reqs = TRUE



/obj/structure/ascendant_altar
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "alch"
	var/ascend_stage = 0
	var/ascendpoints = 0
	var/capstone_state =

/obj/structure/ascendant_altar/attack_hand(mob/living/user) //da bread n butter - consume upgrades,

	if


	else
		to_chat(user, span_userdanger("I have no idea what this is."))

/obj/structure/ascendant_altar/attack_by(obj/item/I, mob/living/user)

//THIS IS FUCKING COAL
//basically- stuff in artefacts, get traits. stuff in artefact to actually get the next stage

	if(src.ascend_stage = (1,2,3)

		if(is_type_in_list(I, psydon_pool[1]))
			src.ascendpoints += 1
			psydon_pool.Remove(item_pool[1])  // Remove the first item from item_pool

	if(src.ascend_stage

// If(istype(item,item_pool[1]))


/obj/structure/ascendant_altar/proc/areyouworthy()

	for(var/mob/living/carbon/human/victim)
		if(victim.mind?.has_antag_datum(/datum/antagonist/ascendant))
			to_chat(victim, span_userdanger("I have collected [src.capstone_total] capstones and [src.artefact_total] artefacts."))
		else
			to_chat(victim, span_userdanger("I have no idea what this is."))
			return