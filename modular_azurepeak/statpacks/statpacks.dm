// Seven statpacks, each giving +2 to a different stat, plus Virtuous which gives no stat bonuses

/datum/statpack/strength
	name = "Mighty"
	desc = "Your physical strength is your greatest asset, allowing you to overpower obstacles and foes alike."
	stat_array = list(STAT_STRENGTH = 2)

/datum/statpack/perception
	name = "Perceptive"
	desc = "Your keen senses allow you to notice details others might miss, giving you an edge in awareness."
	stat_array = list(STAT_PERCEPTION = 2)

/datum/statpack/intelligence
	name = "Intelligent"
	desc = "Your sharp mind and quick thinking help you solve problems and understand complex concepts."
	stat_array = list(STAT_INTELLIGENCE = 2)

/datum/statpack/constitution
	name = "Resilient"
	desc = "Your body is exceptionally resistant to harm, allowing you to withstand injuries that would fell others."
	stat_array = list(STAT_CONSTITUTION = 2)

/datum/statpack/endurance
	name = "Enduring"
	desc = "Your stamina is unmatched, allowing you to push on long after others would have given up."
	stat_array = list(STAT_ENDURANCE = 2)

/datum/statpack/speed
	name = "Swift"
	desc = "Your exceptional agility and quickness give you an edge in mobility, allowing you to move with unmatched speed."
	stat_array = list(STAT_SPEED = 2)

/datum/statpack/fortune
	name = "Fortunate"
	desc = "Luck seems to follow you wherever you go, turning the tides of fate in your favor when you need it most."
	stat_array = list(STAT_FORTUNE = 2) 

/datum/statpack/virtuous
	name = "Virtuous"
	desc = "The breadth of my being is one of many, distinguished talents. \n (Allows access to 'virtues', special traits/quirks that replace the bonus normally given by a statpack.)"
	stat_array = list() // No stat bonuses 
