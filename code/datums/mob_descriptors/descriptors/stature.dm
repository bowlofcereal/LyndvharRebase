/datum/mob_descriptor/stature
	abstract_type = /datum/mob_descriptor/stature
	slot = MOB_DESCRIPTOR_SLOT_STATURE

/datum/mob_descriptor/stature/man
	name = "Man/Woman"

/datum/mob_descriptor/stature/man/get_description(mob/living/described)
	switch(described.gender)
		if(FEMALE)
			return "woman"
		if(MALE)
			return "man"
		else
			return "person"

/datum/mob_descriptor/stature/gentleman
	name = "Gentleman/Gentlewoman"

/datum/mob_descriptor/stature/gentleman/get_description(mob/living/described)
	switch(described.gender)
		if(FEMALE)
			return "gentlewoman"
		if(MALE)
			return "gentleman"
		else
			return "gentleperson"

/datum/mob_descriptor/stature/thug
	name = "Thug"

/datum/mob_descriptor/stature/knave
	name = "Knave"

/datum/mob_descriptor/stature/wench
	name = "Wench"

/datum/mob_descriptor/stature/snob
	name = "Snob"

/datum/mob_descriptor/stature/slob
	name = "Slob"

/datum/mob_descriptor/stature/brute
	name = "Brute"

/datum/mob_descriptor/stature/highbrow
	name = "Highbrow"

/datum/mob_descriptor/stature/stooge
	name = "Stooge"

/datum/mob_descriptor/stature/fool
	name = "Fool"

/datum/mob_descriptor/stature/bookworm
	name = "Bookworm"

/datum/mob_descriptor/stature/lowlife
	name = "Lowlife"

/datum/mob_descriptor/stature/dignitary
	name = "Dignitary"
