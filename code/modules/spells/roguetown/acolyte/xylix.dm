/obj/effect/proc_holder/spell/invoked/wheel
	name = "The Wheel"
	releasedrain = 10
	chargedrain = 0
	chargetime = 3
	range = 1
	no_early_release = TRUE
	movement_interrupt = TRUE
	chargedloop = /datum/looping_sound/invokeholy
	sound = 'sound/misc/letsgogambling.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 5 MINUTES
	
/obj/effect/proc_holder/spell/invoked/wheel/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		target.apply_status_effect(/datum/status_effect/wheel)		
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/mockery
	name = "Vicious Mockery"
	releasedrain = 50
	associated_skill = /datum/skill/misc/music
	charge_max = 2 MINUTES
	range = 7

/obj/effect/proc_holder/spell/invoked/mockery/cast(list/targets, mob/user = usr)
	playsound(get_turf(user), 'sound/magic/mockery.ogg', 40, FALSE)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		if(!target.can_hear()) // Vicious mockery requires people to be able to hear you.
			revert_cast()
			return FALSE
		target.apply_status_effect(/datum/status_effect/debuff/viciousmockery)	
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/mockery/invocation(mob/user = usr)
	if(ishuman(user))
		switch(pick(1,2,3,4,5,6,7,8,9,10,11,12,13))
			if(1)
				user.say("Your mother was a Rous, and your father smelled of jacksberries!", forced = "spell")
			if(2)
				user.say("What are you going to do for a face when the Archdevil wants his arse back?!", forced = "spell")
			if(3)
				user.say("Wandought thine blades stand, much like thine loving parts!", forced = "spell")
			if(4)
				user.say("That's a face not even Eora could love!", forced = "spell")
			if(5)
				user.say("Your breath smells like raw butter and cheap beer!.", forced = "spell")
			if(6)
				user.say("I bite mine thumb, ser!", forced = "spell")
			if(7)
				user.say("But enough talk- have at thee!", forced = "spell")
			if(8)
				user.say("My grandmother fights better than you!", forced = "spell")
			if(9)
				user.say("Need you borrow mine spectacles? Come get them!", forced = "spell")
			if(10)
				user.say("How much sparring did it take to become this awful?!", forced = "spell")
			if(11)
				user.say("You may need a smith- for you seem ill-equipped for a battle of wits!", forced = "spell")
			if(12)
				user.say("Looks as if thou art PSY-DONE! No? Too soon? Alright.", forced = "spell")
			if(13)
				user.say("Ravox bring justice to your useless mentor, ser!", forced = "spell")

/datum/status_effect/debuff/viciousmockery
	id = "viciousmockery"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/viciousmockery
	duration = 600 // One minute
	effectedstats = list("strength" = -1, "speed" = -1,"endurance" = -1, "intelligence" = -3)

/atom/movable/screen/alert/status_effect/debuff/viciousmockery
	name = "Vicious Mockery"
	desc = "<span class='warning'>THAT ARROGANT BARD! ARGH!</span>\n"
	icon_state = "muscles"

/obj/effect/proc_holder/spell/invoked/curse_of_woe
	name = "Curse of Woe"
	desc = "A powerful curse that makes the target vulnerable to ambushes anywhere they go. The curse is lifted once an ambush successfully triggers."
	releasedrain = 100
	chargedrain = 0
	chargetime = 5
	range = 5
	no_early_release = TRUE
	movement_interrupt = TRUE
	chargedloop = /datum/looping_sound/invokeholy
	sound = 'sound/misc/letsgogambling.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 5 MINUTES

/obj/effect/proc_holder/spell/invoked/curse_of_woe/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			to_chat(user, span_warning("The target is protected from your magic!"))
			return FALSE
		
		// Apply the curse status effect
		target.apply_status_effect(/datum/status_effect/curse_of_woe)
		user.visible_message(span_warning("[user] points at [target], cursing them with Xylix's Woe!"), 
							span_notice("You curse [target] with Xylix's Woe. They will be hunted wherever they go."))
		
		// Visual effects
		var/obj/effect/temp_visual/curse_visuals = new /obj/effect/temp_visual/curse(get_turf(target))
		curse_visuals.color = "#800080" // Purple for Xylix
		
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/curse_of_woe/invocation(mob/user = usr)
	if(ishuman(user))
		user.say("By Xylix's whim, I curse thee to be hunted! The Laughing God's woe be upon you!", forced = "spell")

/datum/status_effect/curse_of_woe
	id = "curse_of_woe"
	status_type = STATUS_EFFECT_UNIQUE
	duration = -1 // Infinite duration until removed
	alert_type = /atom/movable/screen/alert/status_effect/curse_of_woe
	
/datum/status_effect/curse_of_woe/on_apply()
	if(ishuman(owner))
		to_chat(owner, span_danger("You feel a chill down your spine. Something is watching you..."))
		return TRUE
	return FALSE
	
/datum/status_effect/curse_of_woe/on_remove()
	to_chat(owner, span_notice("You feel the weight of Xylix's curse lift from your shoulders."))

/atom/movable/screen/alert/status_effect/curse_of_woe
	name = "Curse of Woe"
	desc = "Xylix has cursed you. You are vulnerable to ambushes anywhere you go."
	icon_state = "curse"

// Hook into the ambush system to remove the curse when an ambush triggers
// This will be called from the ambush code when an ambush successfully triggers
/mob/living/proc/check_curse_of_woe_ambush()
	if(has_status_effect(/datum/status_effect/curse_of_woe))
		remove_status_effect(/datum/status_effect/curse_of_woe)
		visible_message(span_warning("The curse upon [src] seems to fade away!"))
		return TRUE
	return FALSE
