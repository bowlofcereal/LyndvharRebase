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
	var/ascend_stage = 0 //stages - 0 is base, 1 is 1st capstone, 2 is 2nd capstone, 3 is full ascension
	var/ascendpoints = 0 //artefact points

/obj/structure/fluff/statue/what/examine(mob/user)

	. = ..()
	if((user.mind?.has_antag_datum(/datum/antagonist/ascendant))
			if(src.ascend_stage == (0,1))
			. += "The next artefact I must find is [???]. The next capstone to ascend in power is [???]" //todo oh god
			if(src.ascend_stage == 2)
				+= "The next artefact I must find is [???]. The next capstone to ascend in power is [???]. After I put the capstone in, I will no longer be able to gather artefacts."
			else
				"There is no more to be done. It is time to find my temple."
	else
		.+= "It almost looks like it's waiting for something- but I don't know what."




/obj/structure/ascendant_altar/attack_hand(mob/living/user) //da bread n butter - consume upgrades,

	if


	else
		to_chat(user, span_userdanger("I have no idea what this is."))

/obj/structure/ascendant_altar/attack_by(obj/item/I, mob/living/user)

//todo: this is garbage, break this into multiple procs, fucking please??
//basically- stuff in artefacts, get traits. stuff in capstone to actually get the next stage

//	if(src.ascend_stage == (1,2,3))

// first, if this is an artifact, and not a capstone...
		if(is_type_in_list(I, psydon_pool[1]))
			src.ascendpoints += 1
			psydon_pool.Remove(psydon_pool[1])
			user.STASTR += 4
			user.STAPER += 4
			user.STACON += 4
			user.STAEND += 4
			user.STASPD += 4
			user.STALUC += 2 //relax

//check what ascendpoint they are on and add that trait
			switch(src.ascendpoints)
				if(1)
					ADD_TRAIT(user, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
					ADD_TRAIT(user, TRAIT_EMPATH, TRAIT_GENERIC)
					to_chat(victim, span_userdanger("I bow my head in humility as I begin my journey. MAJOR ARCANA : TEMPERANCE, UPRIGHT."))
				if(2)
					to_chat(victim, span_userdanger("The world around me seems to mean less and less- I realize how small everything is. MAJOR ARCANA : QUEEN OF CUPS, REVERSED."))

			qdel(I)

	if(src.ascend_stage == 3)

// If(istype(item,item_pool[1]))




/obj/structure/ascendant_altar/attack_right(mob/living/user)

	for(var/mob/living/carbon/human/victim)
		if(victim.mind?.has_antag_datum(/datum/antagonist/ascendant))
			to_chat(victim, span_userdanger("I have collected [src.ascend_stage] capstones and [src.ascendpoints] artefacts."))
		else
			to_chat(victim, span_userdanger("I have no idea what this is."))
