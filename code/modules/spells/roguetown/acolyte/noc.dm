// Noc Spells
/obj/effect/proc_holder/spell/invoked/blindness
	name = "Blindness"
	desc = "Direct a mote of living darkness to temporarily blind another."
	overlay_state = "blindness"
	clothes_req = FALSE
	releasedrain = 30
	chargedrain = 5
	chargetime = 5
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/churn.ogg'
	spell_tier = 2 // Combat spell
	invocation = "Obcaeco!"
	invocation_type = "whisper"
	associated_skill = /datum/skill/magic/arcane
	antimagic_allowed = TRUE
	recharge_time = 15 SECONDS
	cost = 1

/obj/effect/proc_holder/spell/invoked/blindness/miracle
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	chargedrain = 0
	chargetime = 0
	invocation = "Noc blinds thee of thy sins!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	associated_skill = /datum/skill/magic/holy
	devotion_cost = 15
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/blindness/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		target.visible_message(span_warning("[user] points at [target]'s eyes!"),span_warning("My eyes are covered in darkness!"))
		var/strength = min(user.mind?.get_skill_level(associated_skill) * 4, 4)
		target.blind_eyes(strength)
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/invisibility
	name = "Invisibility"
	overlay_state = "invisibility"
	desc = "Make another (or yourself) invisible for fifteen seconds."
	releasedrain = 30
	chargedrain = 5
	chargetime = 5
	clothes_req = FALSE
	recharge_time = 30 SECONDS
	range = 3
	warnie = "sydwarning"
	movement_interrupt = FALSE
	spell_tier = 2
	invocation_type = "none"
	sound = 'sound/misc/area.ogg' //This sound doesnt play for some reason. Fix me.
	associated_skill = /datum/skill/magic/arcane
	antimagic_allowed = TRUE
	hide_charge_effect = TRUE
	cost = 2

/obj/effect/proc_holder/spell/invoked/invisibility/miracle
	miracle = TRUE
	devotion_cost = 25
	chargetime = 0
	chargedrain = 0
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/invisibility/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		target.visible_message(span_warning("[target] starts to fade into thin air!"), span_notice("You start to become invisible!"))
		var/dur = 5 * (user.mind?.get_skill_level(associated_skill))
		if(dur >= recharge_time)
			recharge_time = dur + 5 SECONDS
		animate(target, alpha = 0, time = 1 SECONDS, easing = EASE_IN)
		target.mob_timers[MT_INVISIBILITY] = world.time + dur SECONDS
		addtimer(CALLBACK(target, TYPE_PROC_REF(/mob/living, update_sneak_invis), TRUE), dur SECONDS)
		addtimer(CALLBACK(target, TYPE_PROC_REF(/atom/movable, visible_message), span_warning("[target] fades back into view."), span_notice("You become visible again.")), 15 SECONDS)
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/self/noc_spell_bundle
	name = "Spell Bundle"
	miracle = TRUE
	devotion_cost = 200
	chargetime = 0
	chargedrain = 0
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	associated_skill = /datum/skill/magic/holy
	var/list/utility_bundle = list(
		/obj/effect/proc_holder/spell/invoked/diagnose/secular,
		/obj/effect/proc_holder/spell/self/message,
		/obj/effect/proc_holder/spell/invoked/leap,
		/obj/effect/proc_holder/spell/targeted/touch/lesserknock,
		/obj/effect/proc_holder/spell/invoked/mending,
		/obj/effect/proc_holder/spell/invoked/projectile/fetch,
		/obj/effect/proc_holder/spell/invoked/aerosolize,
		/obj/effect/proc_holder/spell/invoked/blink,
		/obj/effect/proc_holder/spell/targeted/touch/darkvision,
	)
	var/list/offensive_bundle = list(
		/obj/effect/proc_holder/spell/invoked/projectile/guided_bolt,
		/obj/effect/proc_holder/spell/invoked/conjure_armor/miracle,
		/obj/effect/proc_holder/spell/invoked/conjure_weapon/miracle
	)
	var/list/buff_bundle = list(
		/obj/effect/proc_holder/spell/invoked/hawks_eyes,
		/obj/effect/proc_holder/spell/invoked/giants_strength,
		/obj/effect/proc_holder/spell/invoked/longstrider,
		/obj/effect/proc_holder/spell/invoked/guidance,
		/obj/effect/proc_holder/spell/invoked/haste,
		/obj/effect/proc_holder/spell/invoked/fortitude,
	)
/obj/effect/proc_holder/spell/self/noc_spell_bundle/cast(list/targets, mob/user)
	. = ..()
	var/choice = alert(user, "What type of spells has Noc blessed you with?", "CHOOSE BUNDLE", "Utility", "Offense", "Buffs")
	switch(choice)
		if("Utility")
			add_spells(user, utility_bundle)
		if("Offense")
			add_spells(user, offensive_bundle)
			ADD_TRAIT(user, TRAIT_MAGEARMOR, TRAIT_MIRACLE)
		if("Buffs")
			add_spells(user, buff_bundle)
			ADD_TRAIT(user, TRAIT_MAGEARMOR, TRAIT_MIRACLE)
		else
			revert_cast()
	user.mind?.RemoveSpell(src.type)


/obj/effect/proc_holder/spell/self/noc_spell_bundle/proc/add_spells(mob/user, list/spells)
	for(var/spell_type in spells)
		if(user?.mind.has_spell(spell_type))
			continue
		else
			var/newspell = new spell_type
			user?.mind.AddSpell(newspell)
