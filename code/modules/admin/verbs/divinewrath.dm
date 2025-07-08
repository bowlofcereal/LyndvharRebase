/client/proc/divine_wrath(mob/M in GLOB.mob_list)
	if(!holder || !check_rights(R_FUN))
		return

	var/mob/living/target = M

	var/list/curse_choices = list(
		"Curse of Astrata" = /datum/curse/astrata,
		"Curse of Noc" = /datum/curse/noc,
		"Curse of Dendor" = /datum/curse/dendor,
		"Curse of Abyssor" = /datum/curse/abyssor,
		"Curse of Ravox" = /datum/curse/ravox,
		"Curse of Necra" = /datum/curse/necra,
		"Curse of Xylix" = /datum/curse/xylix,
		"Curse of Pestra" = /datum/curse/pestra,
		"Curse of Malum" = /datum/curse/malum,
		"Curse of Eora" = /datum/curse/eora,
		"Curse of Zizo" = /datum/curse/zizo,
		"Curse of Graggar" = /datum/curse/graggar,
		"Curse of Matthios" = /datum/curse/matthios,
		"Curse of Baotha" = /datum/curse/baotha,
		)

	if(!isliving(target))
		to_chat(usr, "This can only be used on instances of type /mob/living")
		return

	var/target_name = input("Who shall receive divine punishment?", "Target Name") as text|null
	if (!target_name)
		return

	var/curse_pick = input("Choose a curse to apply or lift.", "Select Curse") as null|anything in curse_choices
	if (!curse_pick)
		return

	var/curse_type = curse_choices[curse_pick]

	for (var/mob/living/carbon/human/H in GLOB.player_list)
		if (H.real_name == target_name)
			if (H == src)
				to_chat(src, span_warning("Cursing yourself is heresy!"))
				return

			var/datum/curse/temp = new curse_type()

			if (H.is_cursed(temp))
				H.remove_curse(temp)
				priority_announce("Gods have lifted [curse_pick] from [H.real_name]!", title = "Mercy of the Gods", sound = 'sound/misc/bell.ogg')
			else
				if (length(H.curses) >= 1)
					to_chat(src, span_warning("[H.real_name] is already afflicted by another curse."))
					return

				H.add_curse(curse_type)
				priority_announce("Gods have marked [H.real_name] with [curse_pick]!", title = "Punishment of the Gods", sound = 'sound/misc/excomm.ogg')
