
/datum/component/infection_spreader
	var/infection_chance = 20
	//More time than a standard infection to compensate for the fact these things will dwell in the woods.
	var/infection_timer = 5 MINUTES

/datum/component/infection_spreader/Initialize()
	. = ..()
	if(!istype(parent, /mob/living))
		return COMPONENT_INCOMPATIBLE

/datum/component/infection_spreader/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_MOB_AFTERATTACK_SUCCESS, PROC_REF(on_bite))

/datum/component/infection_spreader/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent, COMSIG_MOB_AFTERATTACK_SUCCESS)

/datum/component/infection_spreader/proc/on_bite(mob/living/source, mob/living/target)
	SIGNAL_HANDLER
	if(prob(infection_chance) && ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.zombie_check_can_convert())
			to_chat(H, span_danger("A growing cold seeps into my body. I feel horrible... REALLY horrible..."))
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(wake_zombie), H, FALSE, TRUE), infection_timer, TIMER_STOPPABLE)
