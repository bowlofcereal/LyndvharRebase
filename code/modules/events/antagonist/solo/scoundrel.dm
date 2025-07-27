/datum/round_event_control/antagonist/solo/scoundrel
	name = "Thieves' Guild"
	tags = list(
		TAG_VILLIAN,
		TAG_LOOT
	)
	roundstart = TRUE
	antag_flag = ROLE_SCOUNDREL
	shared_occurence_type = SHARED_MINOR_THREAT

	needed_job = list("Adventurer", "Towner")

	restricted_roles = list(
		"Grand Duke",
		"Grand Duchess",
		"Consort",
		"Dungeoneer",
		"Sergeant",
		"Men-at-arms",
		"Marshal",
		"Merchant",
		"Priest",
		"Acolyte",
		"Martyr",
		"Templar",
		"Councillor",
		"Bandit",
		"Prince",
		"Princess",
		"Hand",
		"Steward",
		"Court Physician",
		"Town Elder",
		"Knight Captain",
		"Archivist",
		"Knight",
		"Court Magician",
		"Inquisitor",
		"Orthodoxist",
		"Warden",
		"Squire",
		"Veteran",
		"Apothecary"
	)

	base_antags = 1
	maximum_antags = 20

	// TODO: remove
	earliest_start = 0 SECONDS
	weight = 1000
	min_players = 0

	typepath = /datum/round_event/antagonist/solo/scoundrel
	antag_datum = /datum/antagonist/scoundrel

/datum/round_event_control/antagonist/solo/scoundrel/canSpawnEvent(players_amt, gamemode, fake_check)
	. = ..()
	if(!.)
		return

	if(length(get_candidates()) < 1)
		return FALSE

	return TRUE

/datum/round_event/antagonist/solo/scoundrel
	var/leader = FALSE
