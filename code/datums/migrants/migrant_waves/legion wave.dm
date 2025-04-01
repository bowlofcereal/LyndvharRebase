/datum/migrant_wave/legion_main
	name = "THE LEGION ARRIVES"
	max_spawns = 1
	weight = 20000
	roles = list(
		/datum/migrant_role/legion/centurion = 1,
		/datum/migrant_role/legion/decanus = 3,
		/datum/migrant_role/legion/explorer = 6,
		/datum/migrant_role/legion/prime = 14
	)
	greet_text = "This land is ripe for the taking, and Caesar, The Son Of Mars, commands you to bring it under the fist of the Legion!"

/datum/migrant_wave/legion_reinforcements
	name = "Legion Reinforcements"
	weight = 1000
	max_spawns = 5
	roles = list(
		/datum/migrant_role/legion/decanus = 1,
		/datum/migrant_role/legion/explorer = 3,
		/datum/migrant_role/legion/prime = 7
	)
	greet_text = "Another contubernium arrives! Follow the orders of your Decanus, your Centurion, and take these lands!"
