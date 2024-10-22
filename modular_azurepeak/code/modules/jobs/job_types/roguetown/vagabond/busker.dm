/datum/advclass/vagabond_busker
	name = "Songlost"
	tutorial = "A melody beyond your reach haunts you in your dreams, and you've given up everything in the pursuit of artistry to try and find it."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/vagabond/busker
	category_tags = list(CTAG_VAGABOND)

/datum/outfit/job/roguetown/vagabond/busker/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/suit/roguetown/shirt/rags
	else
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
		if(prob(50))
			pants = /obj/item/clothing/under/roguetown/tights/vagrant/l
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
		if(prob(50))
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l

	if(prob(33))
		cloak = /obj/item/clothing/cloak/half/brown
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	
	if (H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", -1)
		H.change_stat("endurance", -1)
		H.change_stat("strength", -1)
		var/instruments = list("Harp", "Lute", "Accordion", "Guitar", "Flute")
		var/instrument_choice = input("Choose your musical medium.", "The Lost Song") as anything in instruments
		switch(instrument_choice)
			if("Harp")
				backr = /obj/item/rogue/instrument/harp
			if("Lute")
				backr = /obj/item/rogue/instrument/lute
			if("Accordion")
				backr = /obj/item/rogue/instrument/accord
			if("Guitar")
				backr = /obj/item/rogue/instrument/guitar
			if("Flute")
				backr = /obj/item/rogue/instrument/flute
		ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
