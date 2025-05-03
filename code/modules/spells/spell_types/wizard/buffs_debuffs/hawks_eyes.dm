/obj/effect/proc_holder/spell/invoked/hawks_eyes
	name = "Hawk's Eyes"
	overlay_state = "hawks_eyes"
	desc = "Sharpens the targets' vision. (+5 Perception). Applies to yourself and anyone next to you."
	cost = 1
	xp_gain = TRUE
	releasedrain = 60
	chargedrain = 1
	chargetime = 1 SECONDS
	recharge_time = 2 MINUTES
	warnie = "spellwarning"
	school = "transmutation"
	spell_tier = 2
	invocation = "Oculus Accipiteris"
	invocation_type = "whisper"
	glow_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_MEDIUM
	no_early_release = TRUE
	movement_interrupt = FALSE
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	range = 7

/obj/effect/proc_holder/spell/invoked/hawks_eyes/cast(list/targets, mob/user)
	playsound(get_turf(user), 'sound/magic/haste.ogg', 80, TRUE, soundping = TRUE)

	user.visible_message("[user] mutters an incantation and a pulse of yellow light radiates out from them.")
	for(var/mob/living/L in range(1, usr))
		L.apply_status_effect(/datum/status_effect/buff/hawks_eyes)

	return TRUE

#define HAWKSEYES_FILTER "hawkseyes_glow"
/atom/movable/screen/alert/status_effect/buff/hawks_eyes
	name = "Hawk's Eyes"
	desc = "My vision is sharpened. (+5 Perception)"
	icon_state = "buff"

/datum/status_effect/buff/hawks_eyes
	var/outline_colour ="#ffff00" // Same color as perception potion
	id = "hawkseyes"
	alert_type = /atom/movable/screen/alert/status_effect/buff/hawks_eyes
	effectedstats = list("perception" = 5)
	duration = 2 MINUTES

/datum/status_effect/buff/hawks_eyes/on_apply()
	. = ..()
	var/filter = owner.get_filter(HAWKSEYES_FILTER)
	if (!filter)
		owner.add_filter(HAWKSEYES_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 200, "size" = 1))
	to_chat(owner, span_warning("My vision sharpens, like that of a hawk."))


/datum/status_effect/buff/hawks_eyes/on_remove()
	. = ..()
	to_chat(owner, span_warning("My vision blurs, losing its unnatural keenness."))
	owner.remove_filter(HAWKSEYES_FILTER)

#undef HAWKSEYES_FILTER
