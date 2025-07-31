/datum/patron/godless
	name = "Godless" // This isn't called Apostasy because otherwise it shows up as Patron: Apostasy which just looks absurdly dumb.
	domain = "Ontological Reality"
	desc = "No gods or kings, only man! You and others are known as what are Apostates- those who reject all divinity in favor of their own strength."
	worshippers = "Some Grenzers, Madmen, Narcissists, beasts, powerful nobility, and some dwarves"
	associated_faith = /datum/faith/godless
	preference_accessible = FALSE
	undead_hater = FALSE
	confess_lines = list(
		"Gods are WORTHLESS!",
		"I DON'T NEED GODS!",
		"I AM MY OWN GOD!",
		"NO GODS, NO MASTERS!",
	)


/datum/patron/godless/can_pray(mob/living/follower)
	to_chat(follower, span_danger("Zarlz Zarwin and psyvolution cannot hear my prayer!"))
	return FALSE	//heathen
