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

/datum/antagonist/ascendant/on_gain()
	. = ..()


//doing it this way came to me in a dream. find out which items ASCENDANT will be getting today
var/list/psydon_pool = list(
	"Item 1",  //todo: items lol
	"Item 2",
	"Item 3",
	"Item 4",
	"Item 5",
	"Item 6",
	"Item 7"
)

var/psydon_artefact_one = psydon_pool[1]
var/psydon_artefact_two = psydon_pool[2]
var/psydon_capstone_one = psydon_pool[3]

// revealed after cap one
var/psydon_artefact_three = psydon_pool[4]
var/psydon_artefact_four = psydon_pool[5]
var/psydon_capstone_two = psydon_pool[6]

//Roger, the deal is honored - you are blessed with entry to heaven.
var/psydon_ascend = item_pool[7]


	var/psydon_artefact_one
	var/psydon_artefact_two
	var/psydon_capstone_one

//these are revealed after capstone one
	var/psydon_artefact_three
	var/psydon_artefact_four
	var/psydon_capstone_two

//ascension artefact
	var/psydon_ascend

/datum/antagonist/ascendant/on_gain()
	. = ..()

	owner.special_role = ROLE_ASCENDANT
	owner.special_items["Maniac"] = pick(possible_weapons)
	owner.special_items["Surgical Kit"] = /obj/item/storage/belt/rogue/surgery_bag/full
	LAZYINITLIST(owner.learned_recipes)

