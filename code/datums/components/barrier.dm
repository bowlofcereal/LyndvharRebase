#define BARRIER_FILTER "barrier filter"

/// gives the mob a barrier
/datum/component/barrier
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS
	///number of hits we can tank
	var/number_of_hits = 6
	///the limit of the damage we can tank
	var/damage_threshold
	///the artificial health of the barrier
	var/barrier_health
	///the overlay of the shield
	var/obj/effect/dummy/lighting_obj/moblight/mob_light_obj
	///the colour of the outline on the mob
	var/outline_color = "#FFFFFF"
	///the colour the barrier gives off
	var/light_color = "#FFFFFF"

/datum/component/barrier/Initialize(number_of_hits = 7, damage_threshold = 50, barrier_health = 200, outline_color = "#FFFFFF", light_color = "#FFFFFF")
	. = ..()

	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	src.number_of_hits = number_of_hits
	src.outline_color = outline_color
	src.light_color = light_color
	src.damage_threshold = damage_threshold
	src.barrier_health = barrier_health

	apply_filter_effects()

/datum/component/barrier/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_CHECK_BLOCK, PROC_REF(block_attack))

/datum/component/barrier/UnregisterFromParent()

	disable_shield()
	UnregisterSignal(parent, COMSIG_CHECK_BLOCK)
	return ..()

/datum/component/barrier/proc/block_attack(
	mob/living/source,
	atom/hitby,
	damage,
	attack_text,
	attack_type,
	armour_penetration,
	damage_type,
	attack_flag,
)
	SIGNAL_HANDLER

	if(damage <= 0 || damage_type == STAMINA)
		return NONE

	if(damage >= damage_threshold || number_of_hits <= 0)
		return NONE

	playsound(get_turf(parent), 'sound/items/stunstick_swing1.ogg', 20)
	new /obj/effect/temp_visual/impact_effect/ion(get_turf(parent))
	src.number_of_hits = max(0, number_of_hits - 1)
	src.barrier_health -= damage
	if(number_of_hits <= 0 || barrier_health <= 0)
		disable_shield()
	return SUCCESSFUL_BLOCK

/datum/component/barrier/proc/disable_shield()
	var/mob/living/living_parent = parent
	living_parent.remove_filter(BARRIER_FILTER)
	QDEL_NULL(mob_light_obj)
	if(iscarbon(parent)) //very likely not the best way to do this...
		var/mob/living/carbon/buffed = parent
		buffed.remove_status_effect(/datum/status_effect/buff/spell_shield)

/datum/component/barrier/proc/enable_shield()

	number_of_hits = initial(number_of_hits)
	apply_filter_effects()

/datum/component/barrier/proc/apply_filter_effects()

	var/mob/living/living_parent = parent
	living_parent.add_filter(BARRIER_FILTER, 2, list("type" = "outline", "color" = outline_color, "alpha" = 60, "size" = 1))
	mob_light_obj = living_parent.mob_light(light_color, 3, 3, 5 MINUTES)
	return TRUE

#undef BARRIER_FILTER
