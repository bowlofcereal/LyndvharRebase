/datum/antagonist/scoundrel
	name = "Scoundrel"
	roundend_category = "scoundrel"
	antagpanel_category = "Roguetown"
	show_name_in_check_antagonists = TRUE
	can_coexist_with_others = TRUE
	confess_lines = list()

/datum/antagonist/scoundrel_victim
	antagpanel_category = "Scoundrel Victim"
	show_name_in_check_antagonists = FALSE

/datum/antagonist/scoundrel/on_gain()
	. = ..()
	if(!owner?.current)
		return

	owner.special_items["Lockpick Ring"] = /obj/item/lockpickring/mundane
	var/datum/objective/scoundrel_objective/obj = new /datum/objective/scoundrel_objective(owner = owner)
	objectives += obj
	owner.store_memory("Objective: [obj.explanation_text]")
	owner.announce_objectives()
	to_chat(owner.current, span_notice("You can view your objective again in the Notes tab under Memory section."))
