/obj/effect/proc_holder/spell/invoked/psydonlux_tamper
	name = "WEEP FOR THEM"
	overlay_state = "psydonweeps"
	releasedrain = 20
	chargedrain = 0
	chargetime = 0
	range = 2
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/psydonbleeds.ogg'
	invocation = "I BLEED, SO THAT YOU MIGHT ENDURE!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	recharge_time = 1 MINUTES // 60 seconds cooldown
	miracle = TRUE
	devotion_cost = 20

/obj/effect/proc_holder/spell/invoked/psydonlux_tamper/cast(list/targets, mob/living/user)
	if(!ishuman(targets[1]))
		to_chat(user, span_warning("I cannot merge my Lux with Luxless beings."))
		revert_cast()
		return FALSE
	
	var/mob/living/carbon/human/H = targets[1]
	
	if(H == user)
		to_chat(user, span_warning("I refuse to tamper with my own Lux."))
		revert_cast()
		return FALSE

	if(H.stat == DEAD)
		to_chat(user, span_warning("[H]'s Lux is gone. I can't do anything, anymore."))
		user.emote("cry")
		revert_cast()
		return FALSE	
	
	// Transfer wounds.
	if(ishuman(H) && ishuman(user))
		var/mob/living/carbon/human/C_target = H
		var/mob/living/carbon/human/C_caster = user
		var/list/datum/wound/tw_List = C_target.get_wounds()

		if(!tw_List.len)
			revert_cast()
			return FALSE

		//Transfer wounds from each bodypart.
		for(var/datum/wound/targetwound in tw_List)
			if (istype(targetwound, /datum/wound/dismemberment))
				continue				
			if (istype(targetwound, /datum/wound/facial))
				continue					
			if (istype(targetwound, /datum/wound/fracture/head))
				continue				
			if (istype(targetwound, /datum/wound/fracture/neck))
				continue
			if (istype(targetwound, /datum/wound/cbt/permanent))
				continue			
			var/obj/item/bodypart/c_BP = C_caster.get_bodypart(targetwound.bodypart_owner.body_zone)
			c_BP.add_wound(targetwound.type)
			var/obj/item/bodypart/t_BP = C_target.get_bodypart(targetwound.bodypart_owner.body_zone)
			t_BP.remove_wound(targetwound.type)


	// Visual effects
	user.visible_message(span_danger("[user] shoulders [H]'s wounds!"))
	playsound(get_turf(user), 'sound/magic/psydonbleeds.ogg', 50, TRUE)
	
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#487e97") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#487e97") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#487e97") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#487e97") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#487e97") 
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(user), "#487e97") 
	
	// Notify the user and target
	to_chat(user, span_warning("You feel awash with the merging of your Lux for a brief moment."))
	to_chat(H, span_info("You feel a strange stirring sensation pour over your Lux, stealing your wounds."))
	
	return TRUE
