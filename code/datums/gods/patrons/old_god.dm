/datum/patron/old_god
	name = "The Shepherd"
	domain = "God of Perfect Good"
	desc = "If it is better to give a beggar bread than to torment him, it follows one action is closer to the perfect good than another.\n\
			To know the perfect good, one must have perfect knowledge of the universe which one acts upon.\n\
			To act in the perfect good, one must have perfect power over the universe in which one acts.\n\
			Perfect knowledge and perfect power is only manifest in the being which creates the universe.\n\
			Only this perfect being can be perfect good. That perfect being is the Shepherd."
	worshippers = "The Church of the Lamb"
	associated_faith = /datum/faith/old_god
	t0 = /obj/effect/proc_holder/spell/invoked/diagnose/secular
	t1 = /obj/effect/proc_holder/spell/invoked/lesser_heal

	confess_lines = list(
		"THERE IS ONLY ONE TRUE GOD!",
		"AS THE LAMB SUFFERED SO SHALL I!",
		"THE SHEPHERD SHALL JUDGE YOU!",
	)
