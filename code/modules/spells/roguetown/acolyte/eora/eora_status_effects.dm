#define ASHEN_FILTER
/atom/movable/screen/alert/status_effect/buff/ashen_aril
	name = "Arillean Apotheosis"
	desc = "Divine power courses through you, enhancing all abilities."
	icon_state = "buff"

/datum/status_effect/buff/ashen_aril
	id = "ashen"
	alert_type = /atom/movable/screen/alert/status_effect/buff/ashen_aril
	duration = 6 MINUTES
	var/current_boost = 5
	var/next_wound_time = 0
	var/static/list/valid_body_zones = list(
		BODY_ZONE_L_ARM,
		BODY_ZONE_R_ARM,
		BODY_ZONE_L_LEG,
		BODY_ZONE_R_LEG
	)

/datum/status_effect/buff/ashen_aril/on_creation(mob/living/new_owner, boost_level = 5, new_duration = 6 MINUTES)
	current_boost = boost_level
	duration = new_duration
	next_wound_time = world.time - 1

	. = ..()

	switch(current_boost)
		if(3 to 5)
			linked_alert.name = "Arillean Apotheosis"
			linked_alert.desc = "Divine power courses through you, enhancing all abilities."
		if(1 to 2)
			linked_alert.name = "Waning Arillean Apotheosis"
			linked_alert.desc = "The divine power within you is fading."
		if(0)
			linked_alert.name = "Arillean Peace"
			linked_alert.desc = "The calm before the storm."
		if(-4 to -1)
			linked_alert.name = "Ashen Scourge"
			linked_alert.desc = "Your body is turning to ash!"
		if(-5)
			linked_alert.name = "Arillean Husk"
			linked_alert.desc = "Much of your body has deteriorated into ash. It is not through Eora's mercy if you are still alive somehow."

/datum/status_effect/buff/ashen_aril/on_apply()
	// Apply stat boosts to all attributes
	effectedstats = list(
		"strength" = current_boost,
		"endurance" = current_boost,
		"constitution" = current_boost,
		"intelligence" = current_boost,
		"perception" = current_boost,
		"fortune" = current_boost,
		"speed" = current_boost
	)
	
	// Apply Beautiful trait for positive boosts
	if(current_boost == 5)
		ADD_TRAIT(owner, TRAIT_BEAUTIFUL, TRAIT_MIRACLE)
		to_chat(owner, span_notice("You feel divinely empowered and radiant!"))
	else if(current_boost == 0)
		REMOVE_TRAIT(owner, TRAIT_BEAUTIFUL, TRAIT_MIRACLE)
		to_chat(owner, span_warning("Your divine beauty fades..."))
	else if (current_boost == -5)
		ADD_TRAIT(owner, TRAIT_UNSEEMLY, TRAIT_MIRACLE)
		to_chat(owner, span_notice("Your flesh is flaky and disgusting."))
	
	// Set visual appearance based on boost level
	switch(current_boost)
		if(3 to 5)
			owner.add_filter(ASHEN_FILTER, 2, list("type" = "outline", "color" = "#e78e08", "alpha" = 225, "size" = 2))
		if(1 to 2)
			owner.add_filter(ASHEN_FILTER, 2, list("type" = "outline", "color" = "#c0c0c0", "alpha" = 180, "size" = 1))
		if(-4 to -1)
			owner.add_filter(ASHEN_FILTER, 2, list("type" = "outline", "color" = "#a9a9a9", "alpha" = 160, "size" = 1))
		if(-5)
			owner.add_filter(ASHEN_FILTER, 2, list("type" = "outline", "color" = "#696969", "alpha" = 140, "size" = 1))
	
	return ..()

/datum/status_effect/buff/ashen_aril/tick()
    // Apply wounds at negative boost levels except -5
    if(current_boost < 0 && current_boost > -5 && world.time > next_wound_time)
        next_wound_time = world.time + rand(30 SECONDS, 60 SECONDS)
        if(prob(25))
            if(iscarbon(owner))
                var/mob/living/carbon/C = owner
                var/list/valid_parts = list()

                for(var/obj/item/bodypart/BP in C.bodyparts)
                    var/BP_name = BP.name
                    if(!BP_name) BP_name = "Unnamed Bodypart" // Fallback

                    var/bool_can_bloody_wound = BP.can_bloody_wound()
                    var/bool_in_zone = (BP.body_zone in valid_body_zones)
                    var/bool_combined_condition = (bool_in_zone && bool_can_bloody_wound)

                    if(bool_combined_condition) //Idk but it works like this.
                        valid_parts += BP

                if(length(valid_parts))
                    var/obj/item/bodypart/BP = pick(valid_parts)
                    BP.add_wound(/datum/wound/slash, FALSE, "Your flesh cracks and bleeds ash!")
                    new /obj/item/ash(owner.loc)

/datum/status_effect/buff/ashen_aril/on_remove()
	. = ..()
	owner.remove_filter("ashen_glow")
	
	// Handle effect progression
	if(current_boost > -4)
		owner.apply_status_effect(/datum/status_effect/buff/ashen_aril, current_boost - 1)
	else
		// Permanent at -5 with wilting effect
		owner.apply_status_effect(/datum/status_effect/buff/ashen_aril, boost_level = -5, new_duration = -1)
		owner.apply_status_effect(/datum/status_effect/debuff/eoran_wilting)

#undef ASHEN_FILTER