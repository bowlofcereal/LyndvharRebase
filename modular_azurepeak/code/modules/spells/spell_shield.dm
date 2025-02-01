/obj/effect/proc_holder/spell/invoked/spell_shield
	name = "Spell Shield"
	desc = "An aura of magic to block the next few attacks. Incompatible with dodge expert and heavy armor."
	cost = 1
	xp_gain = TRUE
	releasedrain = 60
	chargedrain = 1
	chargetime = 2 SECONDS
	charge_max = 5 MINUTES
	warnie = "spellwarning"
	school = "transmutation"
	overlay_state = "spellshield"
	cooldown_min = 3 MINUTES
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane

/obj/effect/proc_holder/spell/invoked/spell_shield/cast(list/targets, mob/user)
	var/atom/A = targets[1]
	
	if(!isliving(A))
		revert_cast()
		return

	var/mob/living/spelltarget = A

	if(HAS_TRAIT(spelltarget, TRAIT_DODGEEXPERT))
		to_chat(user, "The magicks coalesce around [spelltarget] but cannot keep up..")
		revert_cast()
		return
	if(HAS_TRAIT(spelltarget, TRAIT_HEAVYARMOR))
		to_chat(user, "The magicks begin to coalesce around [spelltarget] but dissipate soon after.")
		revert_cast()
		return

	spelltarget.apply_status_effect(/datum/status_effect/buff/spell_shield)
	playsound(get_turf(spelltarget), 'sound/magic/haste.ogg', 80, TRUE, soundping = TRUE)

	if(spelltarget != user)
		user.visible_message("[user] mutters an incantation and a magical aura coalesces around [spelltarget].")
	else
		user.visible_message("[user] mutters an incantation and a magical aura springs to life around them.")

	return TRUE


