/datum/objective/scoundrel_objective
	name = "Scoundrel Objective"
	var/datum/weakref/target_item
	triumph_count = 5

/datum/objective/scoundrel_objective/New(owner)
	. = ..()
	if(!owner)
		return

	src.owner = owner

	if(assign_player_vs_player())
		return

	assign_generic()

/// Tries assigning "antagonistic" task that pits two players against each other
/datum/objective/scoundrel_objective/proc/assign_player_vs_player()
	var/list/candidates = list()
	for(var/mob/living/carbon/human/M in GLOB.player_list)
		if(!M.mind || !M.client.prefs || M.stat != CONSCIOUS || !(ROLE_SCOUNDREL_VICTIM in M.client.prefs.be_special))
			continue

		if(!(M.mind.assigned_role in (GLOB.noble_positions + GLOB.courtier_positions + GLOB.garrison_positions + GLOB.church_positions + GLOB.inquisition_positions + GLOB.yeoman_positions + GLOB.mercenary_positions + GLOB.youngfolk_positions)))
			continue

		var/assigned_role = M.mind.assigned_role
		candidates += M

	if(!length(candidates))
		return FALSE

	switch(rand(0, 100))
		if(0 to 49)
			return assign_debt_collection(pick(candidates))
		if(50 to 100)
			return assign_safeguard(pick(candidates))

/// Assigns generic debt collection task
/datum/objective/scoundrel_objective/proc/assign_debt_collection(mob/living/carbon/human/victim)
	var/datum/objective/debt/debt = new /datum/objective/debt(null, victim)
	explanation_text = "[victim.real_name] owes a debt to a particularly influental creditor. I have been paid to collect the debt."
	return TRUE

/// Assigns safeguard task - victim has to hold on to a generic item, the antagonist has to fetch it.
/datum/objective/scoundrel_objective/proc/assign_safeguard(mob/living/carbon/human/victim)
	var/obj/item/parcel/new_item = new /obj/item/parcel(get_turf(victim))
	var/obj/item/item = victim.get_item_by_slot(SLOT_BACK_L)
	if(!item)
		item = victim.get_item_by_slot(SLOT_BACK_R)
	if(!item || !SEND_SIGNAL(item, COMSIG_TRY_STORAGE_INSERT, new_item, null, TRUE, TRUE))
		item = victim.get_item_by_slot(SLOT_BACK_R)
		if(!item || !SEND_SIGNAL(item, COMSIG_TRY_STORAGE_INSERT, new_item, null, TRUE, TRUE))
			item = victim.get_item_by_slot(SLOT_BELT)
			if(!item || !SEND_SIGNAL(item, COMSIG_TRY_STORAGE_INSERT, new_item, null, TRUE, TRUE))
				new_item.forceMove(get_turf(victim))

	target_item = WEAKREF(new_item)
	var/datum/objective/safeguard_item/victim_objective = new /datum/objective/safeguard_item(null, victim)
	victim_objective.target_item = WEAKREF(new_item)
	victim_objective.explanation_text = "An acquaintance of mine left a very valuable [new_item.name] for me to safeguard. They will fetch it next week, and for now I must keep it safe."

	explanation_text = "I need to steal the [new_item.name] from [victim.real_name]. By force or deception, I must get it, some people are willing to pay a hefty sum for it."
	return TRUE

/// Assigns a generic steal task from a protected area.
/datum/objective/scoundrel_objective/proc/assign_generic()
	var/static/list/eligible_areas = list(
		/area/rogue/indoors/town/manor,
		/area/rogue/indoors/town/garrison,
		/area/rogue/indoors/town/magician,
		/area/rogue/indoors/town/church/basement,
	)

	var/area_type = pick(eligible_areas)
	var/turf/T = get_safe_area_turf(area_type)
	if(!istype(T))
		return

	// Should spawn an invisible item that will appear when the thief gets close blah blah blah
	// TODO: replace with landmarks, this solution is worse than shit

/datum/objective/scoundrel_objective/check_completion()
	if(!owner?.current)
		return FALSE

	var/obj/item/item = target_item?.resolve()
	if(QDELETED(item))
		return FALSE

	if(item in owner.current.GetAllContents())
		return TRUE

	return FALSE 

/datum/objective/safeguard_item
	name = "Safeguard Item"
	explanation_text = "Safeguard the item."
	var/datum/weakref/target_item
	triumph_count = 5

/datum/objective/safeguard_item/check_completion()
	if(!owner?.current)
		return FALSE

	var/obj/item/item = target_item?.resolve()
	if(QDELETED(item))
		return FALSE

	if(item in owner.current.GetAllContents())
		return TRUE

	return FALSE 

/datum/objective/safeguard_item/Destroy()
	target_item = null
	return ..()

/datum/objective/debt
	name = "Debt collectors"
	explanation_text = "I owe fifty zenarii. And the creditor is very unhappy about it. Someone will come to collect the debt, I must be ready."

/datum/objective/debt/check_completion()
	return TRUE // FUCKING HELL TO CHECK IT???
