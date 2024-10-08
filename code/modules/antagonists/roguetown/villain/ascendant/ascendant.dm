/datum/antagonist/ascendant
	name = "Ascendant"
	roundend_category = "maniacs"
	antagpanel_category = "Maniac"
	antag_memory = "<b>PSYDON IS DEAD. The Old Pantheon ARE WEAK, and the New Gods ARE FOOLISH. The WORLD IS DYING, AND I AM THE ONLY THING THAT MAY SAVE IT- COMET SYON'S BLADE BLOODY ME UNTIL IT IS DONE.</b>"
	job_rank = ROLE_ASCENDANT
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "villain"
	confess_lines = list(
		"I gave them no time to squeal.",
		"I shant quit ripping them.",
		"They deserve to be put at my blade.",
		"Do what thou wilt shall be the whole of the law.",
	)
	rogue_enabled = FALSE
	/// Traits we apply to the owner
	var/static/list/applied_traits = list(
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_DECEIVING_MEEKNESS,
		TRAIT_NOSTINK,
		TRAIT_EMPATH,
		TRAIT_NOROGSTAM,
		TRAIT_NOPAIN,
		TRAIT_NOPAINSTUN,
		TRAIT_STEELHEARTED,
		TRAIT_NOMOOD,
		TRAIT_HARDDISMEMBER,
		TRAIT_NOSLEEP,
		TRAIT_SHOCKIMMUNE,
		TRAIT_STABLEHEART,
		TRAIT_STABLELIVER,
		TRAIT_ANTIMAGIC,
		TRAIT_SCHIZO_AMBIENCE,
		TRAIT_BLOODLOSS_IMMUNE,
	)

	/// Cached old stats in case we get removed
	var/STASTR
	var/STACON
	var/STAEND

/*
var/psydon_artefact_one = psydon_pool[1]
var/psydon_artefact_two = psydon_pool[2]
var/psydon_capstone_one = psydon_pool[3]

// revealed after cap one
var/psydon_artefact_three = psydon_pool[4]
var/psydon_artefact_four = psydon_pool[5]
var/psydon_capstone_two = psydon_pool[6]

//Roger, the deal is honored - you are blessed with entry to heaven.
var/psydon_ascend = psydon_pool[7]


	var/psydon_artefact_one
	var/psydon_artefact_two
	var/psydon_capstone_one

//these are revealed after capstone one
	var/psydon_artefact_three
	var/psydon_artefact_four
	var/psydon_capstone_two

//ascension artefact
	var/psydon_ascend
*/
	var/static/list/possible_weapons = list(
		/obj/item/rogueweapon/sword/cutlass,
		/obj/item/rogueweapon/sword/decorated,
		/obj/item/rogueweapon/sword/sabre/dec,
	)

/datum/antagonist/ascendant/on_gain()
	. = ..()

	owner.special_role = ROLE_ASCENDANT
	owner.special_items["Ascendant"] = pick(possible_weapons)
	if(owner.current)
		if(ishuman(owner.current))
			var/mob/living/carbon/human/dreamer = owner.current
			dreamer.cmode_music = 'sound/music/requiem.ogg'
			var/sword_skill = dreamer.mind.get_skill_level(/datum/skill/combat/swords)
			if(sword_skill < 6)
				owner.adjust_skillrank(/datum/skill/combat/swords, 6 - sword_skill, TRUE)
			STASTR = dreamer.STASTR
			STACON = dreamer.STACON
			STAEND = dreamer.STAEND
			dreamer.STASTR += 2
			dreamer.STACON += 2
			dreamer.STAEND += 2

