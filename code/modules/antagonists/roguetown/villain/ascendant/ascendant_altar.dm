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


/obj/structure/ascendant_altar/attack_hand(mob/living/user) //da bread n butter

	areyouworthy()

/obj/structure/ascendant_altar/proc/areyouworthy()

	var/list/viewers = view(7, src)
	for(var/mob/living/carbon/human/victim in viewers)
		if(victim.mind?.has_antag_datum(/datum/antagonist/ascendant))
			to_chat(victim, span_userdanger("I have collected [src.capstone_total] capstones and [src.artefact_total] artefacts."))
		else
			to_chat(victim, span_userdanger("I have no idea what this is."))
			return

/obj/structure/ascendant_altar/attack_by(obj/item/I, mob/living/user)
