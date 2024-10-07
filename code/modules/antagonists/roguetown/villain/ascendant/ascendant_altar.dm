// OH GOD IT'S SO SHITTY IM SO SORRY PLEASE PLEAS EPLEASEP ELEA

var/list/capstone_pool = list(
	"Item 1",  //todo: items lol
	"Item 2",
	"Item 3",
	"Item 4",
	"Item 5",
	"Item 6",
	"Item 7"
)

//doing it this way came to me in a dream. find out which items ASCENDANT will be getting today
var/list/psydon_pool = list(
	"Item 1" = "minecraft item",  //todo: items lol
	"Item 2",
	"Item 3",
	"Item 4",
	"Item 5",
	"Item 6",
	"Item 7"
)


/datum/crafting_recipe/roguetown/structure/ascendant
	name = "ascendant's altar"
	result = /obj/structure/ascendant_altar
	reqs = list(
		/obj/item/bodypart = 2,
		/obj/item/organ/stomach = 1,
	)
	verbage_simple = "construct"
	verbage = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = null
	always_availible = FALSE
	subtype_reqs = TRUE



/obj/structure/ascendant_altar
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "alch"
	var/ascend_stage = 0 //stages - 0 is base, 1 is 1st capstone, 2 is 2nd capstone, 3 is full ascension
	var/ascendpoints = 0 //artefact points

//im sorry im sorry im sorry im sorry im s
	var/artefact_one
	var/artefact_two
	var/artefact_one_display
	var/artefact_two_display
	var/capstone_one
	var/capstone_one_display


/obj/structure/ascendant_altar/proc/runthejewels() //gets the name var of stuff
	src.artefact_one = psydon_pool[1]
	src.artefact_two = psydon_pool[2]
	src.capstone_one = capstone_pool[1]
	src.artefact_one_display = initial(artefact_one.name)
	src.artefact_two_display = initial(artefact_two.name)
	src.capstone_one = capstone_pool[1]
	src.capstone_one_display = inital(capstone_one.name


/obj/structure/ascendant_altar/examine(mob/user)

	. = ..()

	runthejewels()

	if((user.mind?.has_antag_datum(/datum/antagonist/ascendant)))
		if(src.ascend_stage == (0,1))
		. += "The next artefacts I must find is [src.artefact_one_display]. The next capstone to ascend in power is [src.capstone_one_display]" //i think this works.
			return
		if(src.ascend_stage == 2)
			.+= "The next artefact I must find is [???]. The next capstone to ascend in power is [???]."
			return
		else
			.+= "There is no more to be done. It is time to go to the THROAT OF THE WORLD and ASCEND."
			return
	else
		.+= "It almost looks like it's waiting for something- but I don't know what."
		return




/obj/structure/ascendant_altar/attack_hand(mob/living/user) //da bread n butter - see the next ascensions we need

	if((user.mind?.has_antag_datum(/datum/antagonist/ascendant)))
		to_chat(victim, span_userdanger("I must collect [psydonlist]"))
	else
		to_chat(user, span_userdanger("I have no idea what this is."))




/obj/structure/ascendant_altar/attack_by(obj/item/I, mob/living/user)
//todo: this is garbage, break this into multiple procs, fucking please??
//basically- stuff in artefacts, get traits. stuff in capstone to actually get the next stage
// first, if this is an artifact, and not a capstone...
	if((user.mind?.has_antag_datum(/datum/antagonist/ascendant)))
		if(is_type_in_list(I, psydon_pool[1]))
			src.ascendpoints += 1
			psydon_pool.Remove(psydon_pool[1])
			user.STASTR += 2
			user.STAPER += 2
			user.STAINT += 2
			user.STACON += 2
			user.STAEND += 2
			user.STASPD += 2
			user.STALUC += 2

//check what ascendpoint they are on and add that trait
			switch(src.ascendpoints)
				if(1)
					ADD_TRAIT(user, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
					ADD_TRAIT(user, TRAIT_EMPATH, TRAIT_GENERIC)
					ADD_TRAIT(user, TRAIT_STEELHEARTED, TRAIT_GENERIC)
					to_chat(user, span_userdanger("I bow my head in humility as I begin my journey. MAJOR ARCANA : TEMPERANCE, UPRIGHT."))
				if(2)
					to_chat(user, span_userdanger("The world around me means less and less- I realize how small everything is. MAJOR ARCANA : QUEEN OF CUPS, REVERSED."))
					ADD_TRAIT(user, TRAIT_NOSTINK, TRAIT_GENERIC)
					ADD_TRAIT(user, TRAIT_NOMOOD, TRAIT_GENERIC)
					ADD_TRAIT(user, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
				if(3)
					ADD_TRAIT(user, TRAIT_NOPAIN, TRAIT_GENERIC)
					ADD_TRAIT(user, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
					to_chat(victim, span_userdanger("I have many enemies- AND they HAVE NOTHING. TEN OF SWORDS, UPRIGHT"))
				if(4)
					ADD_TRAIT(user, TRAIT_STABLEHEART, TRAIT_GENERIC)
					ADD_TRAIT(user, TRAIT_STABLELIVER, TRAIT_GENERIC)
					to_chat(victim, span_userdanger("My insides BECOME like MALUM'S STONE. I am NEARING COMPLETION. MAJOR ARCANA : STRENGTH"))

				else
					to_chat(user, span_danger("There are no more artefacts to collect. It is time for my business to be DONE."))
					return



//handles capstones
		if(is_type_in_list(I, capstone_pool[1]))

			src.ascend_stage += 1
			user.STASTR += 2
			user.STAPER += 2
			user.STAINT += 2
			user.STACON += 2
			user.STAEND += 2
			user.STASPD += 2
			user.STALUC += 2


		switch(src.ascend_stage)
			if(1)
				ADD_TRAIT(user, TRAIT_LONGSTRIDER, TRAIT_GENERIC)
				to_chat(user, span_danger("The first capstone. My mind opens. The world around me seems to get smaller. A corpse. We are living on a corpse. And this deadite must be dealt with the same as the rest. My pace stiffens."))
				user.spelllist += /obj/effect/proc_holder/spell/targeted/churn
			if(2)
				to_chat(user, span_danger("The second capstone. Stuck in filth- FILTH AND SHIT! I grab the rotted, fetted thing and begin to peel it back. LAYER BY LAYER- THE COMET SYON. THE ARCHDEVIL. IS HE DEAD, OR SLEEPING? ..."))
				sleep(50)
				to_chat(user, span_userdanger("IS HE WEAK - OR A COWARD??"))
				sleep(20)
				to_chat(user, span_userdanger("GOD IS COMING."))
				sleep(20)
				to_chat(user, span_userdanger("GODISCOMING"))




			if(3)
				user.cmode_music = 'sound/music/ORDER.ogg'
				user.STASTR += 10
				user.STAPER += 10
				user.STAINT += 10
				user.STACON += 10
				user.STAEND += 10
				user.STASPD += 10
				user.STALUC += 6

				heavensaysdanger() //Roger, our deal is honored; you will be rewarded in heaven.
				qdel(src)





			qdel(I)


		else
			to_chat(victim, span_userdanger("This item is useless to me.."))






/obj/structure/ascendant_altar/attack_right(mob/living/user)

	for(var/mob/living/carbon/human/victim)
		if(victim.mind?.has_antag_datum(/datum/antagonist/ascendant))
			to_chat(victim, span_userdanger("I have collected [src.ascend_stage] capstones and [src.ascendpoints] artefacts."))
		else
			to_chat(victim, span_userdanger("I have no idea what this is."))


/obj/structure/ascendant_altar/proc/heavensaysdanger()

	for(var/mob/connected_player in GLOB.player_list)
	if(!connected_player.client)
		continue
	SEND_SOUND(connected_player, sound(null))
	SEND_SOUND(connected_player, 'sound/villain/dreamer_win.ogg')