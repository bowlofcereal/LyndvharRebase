/*

/datum/virtue/size/giant
	name = "Giant"
	desc = "I've always been larger, stronger and hardier than the average person. I tend to lumber around a lot, and my immense size can break down frail, wooden doors."
	added_traits = list(TRAIT_BIGGUY)
	custom_text = "Increases your sprite size."

/datum/virtue/size/giant/apply_to_human(mob/living/carbon/human/recipient)
	recipient.transform = recipient.transform.Scale(1.25, 1.25)
	recipient.transform = recipient.transform.Translate(0, (0.25 * 16))
	recipient.update_transform()

/datum/virtue/size/dwarf
	name = "Small framed"
	desc = "I've always been smaller, nimbler, and more compact than the average person. My diminutive stature allows me to squeeze through tight spaces and avoid obstacles with ease."
	custom_text = "Shrinks your sprite size."

/datum/virtue/size/dwarf/apply_to_human(mob/living/carbon/human/recipient)
	recipient.change_stat("strength", -2)
	recipient.change_stat("constitution", -1)
	recipient.change_stat("speed", 1)
	recipient.transform = recipient.transform.Scale(1, 0.95)
//recipient.transform = recipient.transform.Translate(0, 0)
	recipient.update_transform()

*/
