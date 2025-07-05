GLOBAL_LIST_INIT(runeritualslist, generate_runeritual_types())
GLOBAL_LIST_INIT(allowedrunerituallist, generate_allowed_runeritual_types())
GLOBAL_LIST_INIT(t1summoningrunerituallist, generate_t1summoning_rituallist())
GLOBAL_LIST_INIT(t2summoningrunerituallist, generate_t2summoning_rituallist())
GLOBAL_LIST_INIT(t3summoningrunerituallist, generate_t3summoning_rituallist())
GLOBAL_LIST_INIT(t4summoningrunerituallist, generate_t4summoning_rituallist())
GLOBAL_LIST_INIT(t2wallrunerituallist, generate_t2wall_rituallist())
GLOBAL_LIST_INIT(t4wallrunerituallist, generate_t4wall_rituallist())
GLOBAL_LIST_INIT(t2enchantmentrunerituallist,generate_t2enchantment_rituallist())
GLOBAL_LIST_INIT(t4enchantmentrunerituallist,generate_t4enchantment_rituallist())

/proc/generate_runeritual_types()	//debug list
	RETURN_TYPE(/list)
	var/list/runerituals = list()
	for(var/datum/runerituals/runeritual as anything in typesof(/datum/runerituals))
		runerituals[initial(runeritual.name)] = runeritual
	return runerituals
/proc/generate_allowed_runeritual_types()	//list of all non-summoning rituals for player use
	RETURN_TYPE(/list)
	var/list/runerituals = list()
	for(var/datum/runerituals/runeritual as anything in subtypesof(/datum/runerituals))
		if(istype(runeritual, /datum/runerituals/summoning || /datum/runerituals/wall))
			continue
		if(runeritual.blacklisted)
			continue
		runerituals[initial(runeritual.name)] = runeritual
	return runerituals

/proc/generate_t1summoning_rituallist()	//list of all rituals for player use
	RETURN_TYPE(/list)
	var/list/runerituals = list()
	for(var/datum/runerituals/runeritual as anything in subtypesof(/datum/runerituals/summoning))
		if(runeritual.tier > 1)
			continue
		if(runeritual.blacklisted)
			continue
		runerituals[initial(runeritual.name)] = runeritual
	return runerituals

/proc/generate_t2summoning_rituallist()	//list of all rituals for player use
	RETURN_TYPE(/list)
	var/list/runerituals = list()
	for(var/datum/runerituals/runeritual as anything in subtypesof(/datum/runerituals/summoning))
		if(runeritual.tier > 2)
			continue
		if(runeritual.blacklisted)
			continue
		runerituals[initial(runeritual.name)] = runeritual
	return runerituals

/proc/generate_t3summoning_rituallist()	//list of all rituals for player use
	RETURN_TYPE(/list)
	var/list/runerituals = list()
	for(var/datum/runerituals/runeritual as anything in subtypesof(/datum/runerituals/summoning))
		if(runeritual.tier > 3)
			continue
		if(runeritual.blacklisted)
			continue
		runerituals[initial(runeritual.name)] = runeritual
	return runerituals

/proc/generate_t4summoning_rituallist()	//list of all rituals for player use
	RETURN_TYPE(/list)
	var/list/runerituals = list()
	for(var/datum/runerituals/runeritual as anything in subtypesof(/datum/runerituals/summoning))
		runerituals[initial(runeritual.name)] = runeritual
	return runerituals

/proc/generate_t2wall_rituallist()	//list of all rituals for player use
	RETURN_TYPE(/list)
	var/list/runerituals = list()
	for(var/datum/runerituals/runeritual as anything in typesof(/datum/runerituals/wall))
		if(runeritual.tier > 2)
			continue
		if(runeritual.blacklisted)
			continue
		runerituals[initial(runeritual.name)] = runeritual
	return runerituals

/proc/generate_t4wall_rituallist()	//list of all rituals for player use
	RETURN_TYPE(/list)
	var/list/runerituals = list()
	for(var/datum/runerituals/runeritual as anything in subtypesof(/datum/runerituals/wall))
		if(runeritual.tier < 3)
			continue
		runerituals[initial(runeritual.name)] = runeritual
	return runerituals

/proc/generate_t2enchantment_rituallist()	//list of all rituals for player use
	RETURN_TYPE(/list)
	var/list/runerituals = list()
	for(var/datum/runerituals/runeritual as anything in subtypesof(/datum/runerituals/enchanting))
		if(runeritual.blacklisted)
			continue
		if(runeritual.tier > 2)
			continue
		runerituals[initial(runeritual.name)] = runeritual
	return runerituals

/proc/generate_t4enchantment_rituallist()	//list of all rituals for player use
	RETURN_TYPE(/list)
	var/list/runerituals = list()
	for(var/datum/runerituals/runeritual as anything in subtypesof(/datum/runerituals/enchanting))
		if(runeritual.blacklisted)
			continue
		runerituals[initial(runeritual.name)] = runeritual
	return runerituals

/datum/runerituals
	var/name
	var/desc
	var/list/required_atoms = list()
	var/list/result_atoms = list()
	var/list/banned_atom_types = list()
	var/mob_to_summon
	var/blacklisted = FALSE
	var/tier = 0				/// Tier var is used for 'tier' of ritual, if the ritual has tiers. EX: Summoning rituals. If it doesn't have tiers, set tier to 0.


/datum/runerituals/proc/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	if(!length(result_atoms))
		return FALSE

	for(var/result in result_atoms)
		new result(loc)
	return TRUE

/datum/runerituals/proc/parse_required_item(atom/item_path, number_of_things)
	// If we need a human, there is a high likelihood we actually need a (dead) body
	if(ispath(item_path, /mob/living/carbon/human))
		return "bod[number_of_things > 1 ? "ies" : "y"]"
	if(ispath(item_path, /mob/living))
		return "carcass[number_of_things > 1 ? "es" : ""] of any kind"
	return "[initial(item_path.name)]\s"

/**
 * Called after on_finished_recipe returns TRUE
 * and a ritual was successfully completed.
 *
 * Goes through and cleans up (deletes)
 * all atoms in the selected_atoms list.
 *
 * Remove atoms from the selected_atoms
 * (either in this proc or in on_finished_recipe)
 * to NOT have certain atoms deleted on cleanup.
 *
 * Arguments
 * * selected_atoms - a list of all atoms we intend on destroying.
 */
/datum/runerituals/proc/cleanup_atoms(list/selected_atoms)
	SHOULD_CALL_PARENT(TRUE)

	for(var/atom/sacrificed as anything in selected_atoms)
		if(isliving(sacrificed))
			continue

		selected_atoms -= sacrificed
		qdel(sacrificed)
