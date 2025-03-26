
/datum/antagonist/elf
	name = "Elf Breeder"
	increase_votepwr = FALSE

/datum/antagonist/elf/on_gain()
	if(!(locate(/datum/objective/breed) in objectives))
		var/datum/objective/breed/breed_objective = new
		breed_objective.owner = owner
		objectives += breed_objective
		if(!owner.active)
			addtimer(CALLBACK(src, PROC_REF(greet)), 5 SECONDS)
		else
			greet()
		return
//	ADD_TRAIT(owner.current, TRAIT_ANTAG, TRAIT_GENERIC)
	return ..()

/datum/antagonist/elf/on_removal()
	return ..()

/datum/antagonist/elf/greet()
	to_chat(owner.current, span_userdanger("I need to create half-elves!"))
	owner.announce_objectives()
	..()

/datum/antagonist/elf/roundend_report()
	var/traitorwin = TRUE

	var/count = 0
	if(objectives.len)//If the traitor had no objectives, don't need to process this.
		for(var/datum/objective/objective in objectives)
			objective.update_explanation_text()
			if(!objective.check_completion())
				traitorwin = FALSE
			count++

	if(!count)
		count = 1

	if(traitorwin)
		owner.adjust_triumphs(3)
		to_chat(owner.current, span_greentext("I've done it! I've successfully bred with a human!"))
		if(owner.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/triumph.ogg', 100, FALSE, pressure_affected = FALSE)
	else
		to_chat(owner.current, span_redtext("I didn't breed with any humans this week... maybe I can try again next week."))
		owner.current.playsound_local(get_turf(owner.current), 'sound/misc/fail.ogg', 100, FALSE, pressure_affected = FALSE)

