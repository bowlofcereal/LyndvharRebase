/mob/living/carbon/human
    var/list/curses = list()
    var/last_curse_time = 0

/mob/living/carbon/human/proc/handle_curses()
    for(var/curse in curses)
        var/datum/curse/C = curse
        C.on_life(src)

/mob/living/carbon/human/proc/add_curse(datum/curse/C)
    if(is_cursed(C))
        return FALSE

    C = new C()
    curses += C
    C.on_gain(src)
    return TRUE

/mob/living/carbon/human/proc/remove_curse(datum/curse/C)
    if(!is_cursed(C))
        return FALSE

    for(var/datum/curse/curse in curses)
        if(curse.name == C.name)
            curse.on_loss(src)
            curses -= curse
            return TRUE
    return FALSE

/mob/living/carbon/human/proc/is_cursed(datum/curse/C)
    if(!C)
        return FALSE

    for(var/datum/curse/curse in curses)
        if(curse.name == C.name)
            return TRUE
    return FALSE

/datum/curse
    var/name = "Debug Curse"
    var/description = "This is a debug curse."
    var/trait

/datum/curse/proc/on_life(mob/living/carbon/human/owner)
    return

/datum/curse/proc/on_death(mob/living/carbon/human/owner)
    return

/datum/curse/proc/on_gain(mob/living/carbon/human/owner)
    ADD_TRAIT(owner, trait, TRAIT_CURSE)
    to_chat(owner, span_userdanger("Something is wrong... I feel cursed."))
    to_chat(owner, span_danger(description))
    owner.playsound_local(get_turf(owner), 'sound/misc/excomm.ogg', 80, FALSE, pressure_affected = FALSE)
    return

/datum/curse/proc/on_loss(mob/living/carbon/human/owner)
    REMOVE_TRAIT(owner, trait, TRAIT_CURSE)
    to_chat(owner, span_userdanger("Something has changed... I feel relieved."))
    owner.playsound_local(get_turf(owner), 'sound/misc/bell.ogg', 80, FALSE, pressure_affected = FALSE)
    qdel(src)
    return

//////////////////////
///   TEN CURSES   ///
//////////////////////

/datum/curse/astrata
	name = "Astrata's Curse"
	description = "I am forsaken by the Sun. Healing miracles have no effect on me."
	trait = TRAIT_ASTRATA_CURSE

/datum/curse/noc
	name = "Noc's Curse"
	description = "I am forsaken by the Moon. Calling up on His gifts is impossible now."
	trait = TRAIT_NOC_CURSE

/datum/curse/dendor
	name = "Dendor's Curse"
	description = "Reason abandons me, insanity is my new home."
	trait = TRAIT_SCHIZO_AMBIENCE

/datum/curse/abyssor
    name = "Abyssor's Curse"
    description = "I hear the ocean whisper in my mind. Fear of drowning has left me... but so has reason."
    trait = TRAIT_ABYSSOR_CURSE

/datum/curse/ravox
    name = "Ravox's Curse"
    description = "Violence disgusts me. I cannot bring myself to wield any kind of weapon."
    trait = TRAIT_RAVOX_CURSE

/datum/curse/necra
	name = "Necra's Curse"
	description = "The Undermaiden gazed upon my soul, if I am not careful I will end up within her grasp."
	trait = TRAIT_CRITICAL_WEAKNESS

/datum/curse/xylix
	name = "Xylix's Curse"
	description = "Fortune is no longer on my side."
	trait = TRAIT_XYLIX_CURSE

/datum/curse/pestra
    name = "Pestra's Curse"
    description = "My body is withering away, simply walking is a straining task and running is a mere dream."
    trait = TRAIT_PESTRA_CURSE

/datum/curse/malum
    name = "Malum's Curse"
    description = "My thoughts race with endless designs I cannot build. The tools tremble in my hands."
    trait = TRAIT_MALUM_CURSE

/datum/curse/eora
    name = "Eora's Curse"
    description = "I am unable to show any kind of affection or love, whether carnal or platonic."
    trait = TRAIT_LIMPDICK

//////////////////////
///    ON LIFE     ///
//////////////////////


//////////////////////
/// ON GAIN / LOSS ///
//////////////////////

/datum/curse/xylix/on_gain(mob/living/carbon/human/owner)
	. = ..()
	owner.STALUC -= 10

/datum/curse/xylix/on_loss(mob/living/carbon/human/owner)
	. = ..()
	owner.STALUC += 10

/datum/curse/pestra/on_gain(mob/living/carbon/human/owner)
	. = ..()
	owner.STAEND -= 10

/datum/curse/pestra/on_loss(mob/living/carbon/human/owner)
	. = ..()
	owner.STAEND += 10
