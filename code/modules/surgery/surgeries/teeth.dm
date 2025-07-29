/datum/surgery_step/teeth_replacement
	name = "Teeth replacement"
	time = 1 SECONDS
	accept_hand = TRUE
	accept_any_item = FALSE
	possible_locs = list(
		BODY_ZONE_PRECISE_MOUTH
	)
	lying_required = TRUE
	self_operable = TRUE
	skill_min = SKILL_LEVEL_JOURNEYMAN
	skill_median = SKILL_LEVEL_EXPERT
	surgery_flags = SURGERY_BLOODY
	implements_speed = null
	implements = null

/datum/surgery_step/teeth_replacement/validate_target(mob/user, mob/living/target, target_zone, datum/intent/intent)
	. = ..()
	if(!.)
		return

	var/mob/living/carbon/human/H = target
	if(!istype(H))
		return FALSE

	var/obj/item/bodypart/head/head = H.get_bodypart(check_zone(target_zone))
	if(!istype(head))
		return FALSE

	if(head?.get_teeth_count() >= head.max_teeth_count)
		to_chat(user, span_notice("They aren't missing any teeth!"))
		return FALSE

/datum/surgery_step/teeth_replacement/tool_check(mob/user, obj/item/tool)
	..() // FUCK U - Halford
	if(!istype(tool, /obj/item/natural/tooth))
		return FALSE

	return TRUE

/datum/surgery_step/teeth_replacement/success(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	var/obj/item/bodypart/head/head = target.get_bodypart(check_zone(target_zone))
	if(!istype(head))
		return FALSE

	if(head?.get_teeth_count() >= head.max_teeth_count)
		return FALSE

	display_results(user, target, span_notice("I successfully install \the [tool] in [target]'s mouth!."),
		span_notice("[user] successfully installs \the [tool] in [target]'s mouth!"),
		span_notice("[user] successfully installs \the [tool] in [target]'s mouth!"))
	head.teeth_types[tool.type]++
	user.dropItemToGround(tool, TRUE, TRUE)
	qdel(tool)
	return TRUE
