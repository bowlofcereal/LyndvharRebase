/datum/job/roguetown/hostage
	title = "Hostage"
	flag = HOSTAGE
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "You're too valuable to outright kill- yet not a free person. You either messed up really bad or got very unlucky. Either way, the city has seen fit to hold you as prisoner for your crimes until ransom is met.. as if that would ever happen. Might as well start praying to whatever patron you find solace in."

	outfit = /datum/outfit/job/roguetown/hostage
	bypass_jobban = TRUE
	display_order = JDO_HOSTAGE
	give_bank_account = 10
	min_pq = -25
	max_pq = null
	can_random = FALSE

/datum/outfit/job/roguetown/hostage/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/facemask/prisoner
	if(H.wear_mask)
		var/obj/I = H.wear_mask
		H.dropItemToGround(H.wear_mask, TRUE)
		qdel(I)
	armor = /obj/item/clothing/suit/roguetown/shirt/rags
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.change_stat("intelligence", 1)
	H.change_stat("fortune", 2)
	if(H.mind)
		var/datum/antagonist/new_antag = new /datum/antagonist/prisoner()
		H.mind.add_antag_datum(new_antag)
	ADD_TRAIT(H, TRAIT_BANDITCAMP, TRAIT_GENERIC)
/proc/wretch_select_bounty(mob/living/carbon/human/H)
	var/bounty_poster = input(H, "Who placed a bounty on you?", "Bounty Poster") as anything in list("The Justiciary of Lyndvhar", "The Bisphoric of Valoria", "The Holy Mother Church of Lyndhardtia")
	if(bounty_poster == "The Justiciary of Lyndvhar")
		GLOB.outlawed_players += H.real_name
	else
		GLOB.excommunicated_players += H.real_name
	
	var/bounty_severity = input(H, "How severe are your crimes?", "Bounty Amount") as anything in list("Misdeed", "Harm towards lyfe")
	var/bounty_total = rand(100, 400) // Just in case
	switch(bounty_severity)
		if("Misdeed")
			bounty_total = rand(100, 200)
		if("Harm towards lyfe")
			bounty_total = rand(200, 300)
	var/my_crime = input(H, "What is your crime?", "Crime") as text|null
	if (!my_crime)
		my_crime = "crimes against the City"
	add_bounty(H.real_name, bounty_total, FALSE, my_crime, bounty_poster)
