//Eora content from Stonekeep

/obj/item/clothing/head/peaceflower
    name = "eoran bud"
    desc = "A flower of gentle petals, associated with Eora or Necra. Usually adorned as a headress or laid at graves as a symbol of love or peace."
    icon = 'icons/roguetown/items/produce.dmi'
    mob_overlay_icon = 'icons/roguetown/clothing/onmob/head_items.dmi'
    icon_state = "peaceflower"
    item_state = "peaceflower"
    dropshrink = 0.9
    slot_flags = ITEM_SLOT_HEAD
    body_parts_covered = NONE
    dynamic_hair_suffix = ""
    force = 0
    throwforce = 0
    w_class = WEIGHT_CLASS_TINY
    throw_speed = 1
    throw_range = 3

/obj/item/clothing/head/peaceflower/equipped(mob/living/carbon/human/user, slot)
    . = ..()
    if(slot == SLOT_HEAD)
        ADD_TRAIT(user, TRAIT_PACIFISM, "peaceflower_[REF(src)]")

/obj/item/clothing/head/peaceflower/dropped(mob/living/carbon/human/user)
    ..()
    REMOVE_TRAIT(user, TRAIT_PACIFISM, "peaceflower_[REF(src)]")

/obj/item/clothing/head/peaceflower/attack_hand(mob/user)
    if(iscarbon(user))
        var/mob/living/carbon/C = user
        if(src == C.head)
            to_chat(user, "<span class='warning'>I feel at peace. <b style='color:pink'>Why would you want anything else?</b></span>")
            return
    return ..()

/obj/effect/proc_holder/spell/invoked/bud
    name = "Eoran Bloom"
    desc = ""
    clothes_req = FALSE
    range = 7
    overlay_state = "love"
    sound = list('sound/magic/magnet.ogg')
    req_items = list(/obj/item/clothing/neck/roguetown/psicross/eora)
    releasedrain = 40
    chargetime = 60
    warnie = "spellwarning"
    no_early_release = TRUE
    charging_slowdown = 1
    chargedloop = /datum/looping_sound/invokegen
    associated_skill = /datum/skill/magic/holy
    recharge_time = 60 SECONDS

/obj/effect/proc_holder/spell/invoked/bud/cast(list/targets, mob/living/user)
    var/target = targets[1]
    if(istype(target, /mob/living/carbon/human)) //Putting flower on head check
        var/mob/living/carbon/human/C = target
        if(!C.get_item_by_slot(SLOT_HEAD))
            var/obj/item/clothing/head/peaceflower/F = new(get_turf(C))
            C.equip_to_slot_if_possible(F, SLOT_HEAD, TRUE, TRUE)
            to_chat(C, "<span class='info'>A flower of Eora blooms on my head. I feel at peace.</span>")
            return TRUE
        else
            to_chat(user, "<span class='warning'>The target's head is covered. The flowers of Eora need an open space to bloom.</span>")
            revert_cast()
            return FALSE
    var/turf/T = get_turf(targets[1])
    if(!isclosedturf(T))
        new /obj/item/clothing/head/peaceflower(T)
        return TRUE
    to_chat(user, "<span class='warning'>The targeted location is blocked. The flowers of Eora refuse to grow.</span>")
    revert_cast()
    return FALSE

/obj/effect/proc_holder/spell/invoked/eoracurse
    name = "Eora's Curse"
    overlay_state = "curse2"
    releasedrain = 50
    chargetime = 30
    range = 7
    warnie = "sydwarning"
    movement_interrupt = FALSE
    chargedloop = null
    req_items = list(/obj/item/clothing/neck/roguetown/psicross/eora)
    sound = 'sound/magic/whiteflame.ogg'
    associated_skill = /datum/skill/magic/holy
    antimagic_allowed = TRUE
    recharge_time = 10 SECONDS
    miracle = FALSE

/obj/effect/proc_holder/spell/invoked/eoracurse/cast(list/targets, mob/living/user)
    if(isliving(targets[1]))
        var/mob/living/carbon/target = targets[1]
        target.apply_status_effect(/datum/status_effect/buff/druqks)
        target.apply_status_effect(/datum/status_effect/buff/drunk)
        target.visible_message("<span class='info'>A purple haze shrouds [target]!</span>", "<span class='notice'>I feel much calmer.</span>")
        target.blur_eyes(10)
        return TRUE
    revert_cast()
    return FALSE

// =====================
// Eora Bond Component
// =====================
/datum/component/eora_bond
    var/mob/living/carbon/partner
    var/mob/living/carbon/caster
    var/duration = 900 SECONDS
    var/max_distance = 7
    var/damage_share = 0.4
    var/heal_share = 0.4
    var/wound_chance = 15
    var/ispartner = FALSE
    can_transfer = TRUE

/datum/component/eora_bond/partner
    ispartner = TRUE

/datum/component/eora_bond/Initialize(mob/living/partner_mob, mob/living/caster_mob, var/holy_skill)
    if(!isliving(parent) || !isliving(partner_mob))
        return COMPONENT_INCOMPATIBLE

    // Prevent duplicate bonds
    var/datum/component/eora_bond/existing = parent.GetComponent(/datum/component/eora_bond)
    if(existing)
        return COMPONENT_INCOMPATIBLE

    partner = partner_mob
    caster = caster_mob
    
    var/bonus_mod = 0
    if(holy_skill >= 4)
        bonus_mod = 0.05
    damage_share = 0.1 + (0.05 * holy_skill) + bonus_mod
    heal_share = 0.1 + (0.05 * holy_skill) + bonus_mod
    wound_chance = 40 - (5 * holy_skill)

    // Correct signal name
    RegisterSignal(parent, COMSIG_MOB_APPLY_DAMGE, PROC_REF(on_damage))
    RegisterSignal(parent, COMSIG_LIVING_MIRACLE_HEAL_APPLY, PROC_REF(on_heal))
    RegisterSignal(parent, COMSIG_PARENT_QDELETING, PROC_REF(on_deletion))

    START_PROCESSING(SSprocessing, src)
    addtimer(CALLBACK(src, .proc/remove_bond), duration)
    
    var/mob/living/L = parent
    L.apply_status_effect(/datum/status_effect/eora_bond)
    return ..()

/datum/component/eora_bond/proc/on_damage(datum/source, damage, damagetype, def_zone)
    if( !isliving(partner) || !ispartner)
        return
    
    var/mob/living/carbon/L = caster
    var/shared_damage = damage * damage_share
    
    if(damagetype == BRUTE)
        //Heal our buddy <3
        var/list/wCount = partner.get_wounds()
        if(wCount.len > 0)
            partner.heal_wounds(shared_damage)
            partner.update_damage_overlays()
        partner.adjustBruteLoss(-shared_damage, 0)

        var/obj/item/bodypart/BP = null
        BP = L.get_bodypart(check_zone(def_zone))
        if(!BP)
            BP = L.get_bodypart(BODY_ZONE_CHEST)
        BP.receive_damage(shared_damage, 0)
        L.update_damage_overlays()
        //Potentially bite ourselves :(
        if(prob(wound_chance))
            L.visible_message(span_danger("[L]'s wounds bleed profusely!"))
            BP.add_wound(/datum/wound/bite/small)

/datum/component/eora_bond/proc/on_heal(datum/source, healing_on_tick, healing_datum)
    if( !isliving(parent) || source != parent || istype(healing_datum, /datum/status_effect/buff/healing/eora))
        return
    
    healing_on_tick = healing_on_tick * heal_share
    var/mob/living/target_to_heal
    if(parent == caster)
        target_to_heal = partner
    else
        target_to_heal = caster

    target_to_heal.apply_status_effect(/datum/status_effect/buff/healing/eora, healing_on_tick)

/datum/component/eora_bond/proc/on_deletion()
    remove_bond()

/datum/component/eora_bond/process()
    //If this turns out to be too costly, make this based on the movement signal instead.
    var/mob/living/M = parent
    if(!istype(M) || !istype(partner) || M.stat == DEAD || partner.stat == DEAD || get_dist(M, partner) > max_distance)
        remove_bond()

/datum/component/eora_bond/proc/remove_bond()
    var/mob/living/L = parent
    if(L)
        L.remove_status_effect(/datum/status_effect/eora_bond)
        UnregisterSignal(L, list(
            COMSIG_MOB_APPLY_DAMGE,
            COMSIG_LIVING_MIRACLE_HEAL_APPLY,
            COMSIG_PARENT_QDELETING
        ))
    
    if(partner)
        partner.remove_status_effect(/datum/status_effect/eora_bond)
        var/datum/component/eora_bond/other = partner.GetComponent(/datum/component/eora_bond)
        if(other)
            other.partner = null
            qdel(other)
    
    partner = null
    STOP_PROCESSING(SSprocessing, src)
    qdel(src)

/datum/status_effect/buff/healing/eora

// =====================
// Heartweave Spell
// =====================
/obj/effect/proc_holder/spell/invoked/heartweave
    name = "Heartweave"
    desc = "Forge a symbiotic bond between two souls."
    overlay_state = "bliss"
    range = 2
    chargetime = 0.5 SECONDS
    invocation = "By Eora's grace, let our fates intertwine!"
    sound = 'sound/magic/magnet.ogg'
    recharge_time = 60 SECONDS
    miracle = TRUE
    devotion_cost = 75
    associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/heartweave/cast(list/targets, mob/living/user)
    var/mob/living/target = targets[1]

    var/datum/component/eora_bond/existing = user.GetComponent(/datum/component/eora_bond)
    if(existing)
        to_chat(user, span_warning("You are already bonded!"))
        revert_cast()
        return FALSE
    
    if(!istype(target, /mob/living/carbon) || target == user)
        revert_cast()
        return FALSE

    if(!do_after(user, 8 SECONDS, target = target))
        to_chat(user, span_warning("The bond requires focused concentration!"))
        revert_cast()
        return FALSE

    var/consent = alert(target, "[user] offers a lifebond. Accept?", "Heartweave", "Yes", "No")
    if(consent != "Yes" || QDELETED(target))
        to_chat(user, span_warning("The bond was rejected."))
        revert_cast()
        return FALSE

    var/holy_skill = user.mind?.get_skill_level(associated_skill)
    // Add component to both participants without mutual recursion
    user.AddComponent(/datum/component/eora_bond, target, user, holy_skill)
    target.AddComponent(/datum/component/eora_bond/partner, target, user, holy_skill)
    
    user.visible_message(
        span_notice("A golden tether forms between [user] and [target]!"),
        span_notice("You feel [target]'s life force linked to yours.")
    )
    return TRUE

// =====================
// Status Effect
// =====================

#define HEARTWEAVE_FILTER "heartweave"

/datum/status_effect/eora_bond
    id = "eora_bond"
    duration = -1
    alert_type = /atom/movable/screen/alert/status_effect/eora_bond
    var/outline_colour = "#FF69B4"

/atom/movable/screen/alert/status_effect/eora_bond
    name = "Eora's Bond"
    desc = "Your life force is linked to another soul."

/datum/status_effect/eora_bond/on_apply()
    var/filter = owner.get_filter(HEARTWEAVE_FILTER)
    if (!filter)
        owner.add_filter(HEARTWEAVE_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 60, "size" = 2))
    return TRUE

/datum/status_effect/eora_bond/on_remove()
    owner.remove_filter(HEARTWEAVE_FILTER)

#define BLESSED_FOOD_FILTER "blessedfood"

/datum/component/blessed_food
    dupe_mode = COMPONENT_DUPE_UNIQUE
    var/mob/living/caster
    var/quality
    var/skill
    var/bitesize_mod

/datum/component/blessed_food/Initialize(mob/living/_caster, var/holy_skill)
    if(!isitem(parent) || !istype(parent, /obj/item/reagent_containers/food/snacks))
        return COMPONENT_INCOMPATIBLE
    
    caster = _caster
    skill = holy_skill
    var/obj/item/reagent_containers/food/snacks/F = parent
    //Better food being blessed heals more
    quality = F.faretype
    bitesize_mod = 1 / F.bitesize
    F.faretype = clamp(skill, 1, 5)
    if(skill < 4)
        F.add_filter(BLESSED_FOOD_FILTER, 1, list("type" = "outline", "color" = "#ff00ff", "size" = 1))
    else
        F.add_filter(BLESSED_FOOD_FILTER, 1, list("type" = "outline", "color" = "#f0b000", "size" = 1))
    RegisterSignal(F, COMSIG_FOOD_EATEN, .proc/on_food_eaten)

/datum/component/blessed_food/proc/on_food_eaten(datum/source, mob/living/eater, mob/living/feeder)
    SIGNAL_HANDLER
    if(eater == caster)
        eater.visible_message(span_notice("The divine energy fizzles harmlessly around [caster]."))
        return
    
    eater.apply_status_effect(/datum/status_effect/buff/healing, (quality + (skill / 5)) * bitesize_mod)
    if(skill > 3)
        eater.apply_status_effect(/datum/status_effect/buff/haste, 10 SECONDS)

/obj/effect/proc_holder/spell/invoked/bless_food
    name = "Bless Food"
    invocation = "Eora, nourish this offering!"
    desc = "Bless a food item. Items that take longer to eat heal slower. Skilled clergy can bless food more often. Finer food heals more."
    sound = 'sound/magic/magnet.ogg'
    req_items = list(/obj/item/clothing/neck/roguetown/psicross/eora)
    devotion_cost = 25
    recharge_time = 90 SECONDS
    overlay_state = "bread"
    associated_skill = /datum/skill/magic/holy
    var/base_recharge_time = 90 SECONDS

/obj/effect/proc_holder/spell/invoked/bless_food/cast(list/targets, mob/living/user)
    var/obj/item/target = targets[1]
    if(!istype(target, /obj/item/reagent_containers/food/snacks))
        to_chat(user, span_warning("You can only bless food!"))
        revert_cast()
        return FALSE
    
    var/holy_skill = user.mind?.get_skill_level(associated_skill)
    target.AddComponent(/datum/component/blessed_food, user, holy_skill)
    to_chat(user, span_notice("You bless [target] with Eora's love!"))
    return TRUE

/obj/effect/proc_holder/spell/invoked/bless_food/start_recharge()
    if(ranged_ability_user)
        var/holy_skill = ranged_ability_user.mind?.get_skill_level(associated_skill)
        // Reduce recharge by 6 seconds per skill level
        var/skill_reduction = (6 SECONDS) * holy_skill
        recharge_time = base_recharge_time - skill_reduction
        // Ensure recharge doesn't go below 0
        if(recharge_time < 0)
            recharge_time = 0
    else
        recharge_time = base_recharge_time

/obj/effect/proc_holder/spell/invoked/pomegranate
    name = "Amaranth Sanctuary"
    invocation = "Eora, provide sanctuary for your beauty!"
    desc = "Grow a cool tree."
    sound = 'sound/magic/magnet.ogg'
    req_items = list(/obj/item/clothing/neck/roguetown/psicross/eora)
    devotion_cost = 1
    recharge_time = 1 SECONDS
    overlay_state = "bread"
    associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/pomegranate/cast(list/targets, mob/living/user)
    . = ..()
    var/turf/T = get_turf(targets[1])
    if(isopenturf(T))
        new /obj/structure/eoran_pomegranate_tree(T)
        return TRUE
    else
        to_chat(user, span_warning("The targeted location is blocked. My call fails to draw a mossback."))
        return FALSE

#define SPROUT 0
#define GROWING 1
#define FRUITING 2

/obj/structure/eoran_pomegranate_tree
    name = "pomegranate tree"
    desc = "A mystical tree blessed by Eora."
    icon = 'icons/roguetown/misc/foliagetall.dmi'
    icon_state = "t1stump"
    anchored = TRUE
    density = TRUE
    max_integrity = 200
    resistance_flags = FIRE_PROOF

    // Growth tracking
    var/growth_stage = SPROUT
    var/growth_progress = 0
    var/growth_threshold = 100
    //var/time_to_mature = 10 MINUTES // Total time from sprout 0% to fully grown 100% through GROWING stage
    //var/time_to_grow_fruit = 5 MINUTES
    var/time_to_mature = 15 SECONDS // Total time from sprout 0% to fully grown 100% through GROWING stage
    var/time_to_grow_fruit = 15 SECONDS
    var/fruit = FALSE
    var/fruit_ready = FALSE

    // Tree care system
    var/happiness = 0
    var/water_happiness = 0
    var/fertilizer_happiness = 0
    var/prune_count = 0
    var/list/tree_offerings = list()
    var/happiness_tier = 1

    /// Range of the aura
    var/aura_range = 7
    /// List of mobs currently affected by our aura
    var/list/mob/living/affected_mobs = list()

/obj/structure/eoran_pomegranate_tree/proc/get_farming_skill(mob/user)
    if(!user?.mind)
        return FALSE
    return user.mind.get_skill_level(/datum/skill/labor/farming)

/obj/structure/eoran_pomegranate_tree/proc/update_happiness_tier()
    if(happiness >= 100)
        happiness_tier = 4
    else if(happiness >= 75)
        happiness_tier = 3
    else if(happiness >= 50)
        happiness_tier = 2
    else
        happiness_tier = 1

/obj/structure/eoran_pomegranate_tree/attackby(obj/item/I, mob/user)
    if(istype(I, /obj/item/rogueweapon/huntingknife/scissors))
        if(prune_count >= 4)
            to_chat(user, span_warning("The tree has been fully pruned already!"))
            return TRUE
        var/skill = get_farming_skill(user)
        var/prune_time = 25 SECONDS - (skill * 3.5 SECONDS)

        to_chat(user, span_notice("You begin pruning the tree..."))

        if(do_after(user, prune_time, target = src))
            prune_count++
            happiness = min(happiness + 5, 100)
            update_happiness_tier()
            
            to_chat(user, span_notice("You prune some branches."))
            update_icon()
            return TRUE

    if(istype(I, /obj/item/reagent_containers))
        var/obj/item/reagent_containers/container = I
        if(water_happiness >= 25)
            to_chat(user, span_warning("The tree can't absorb any more water right now!"))
            return TRUE

        var/has_water = FALSE
        if(container.reagents.has_reagent(/datum/reagent/water, 1))
            has_water = TRUE

        if(!has_water)
            return

        var/remaining_cap = 25 - water_happiness
        var/skill = get_farming_skill(user)
        var/potential_gain = 5 + (skill * 4)  // 5 at skill 0, 25 at skill 5+
        var/actual_gain = min(potential_gain, remaining_cap)
        var/action_time = 5 SECONDS - (skill * 0.5 SECONDS)

        if(do_after(user, action_time, target = src))
            container.reagents.remove_reagent(/datum/reagent/water, 1)

            water_happiness += actual_gain
            happiness = min(happiness + actual_gain, 100)
            update_happiness_tier()

            to_chat(user, span_notice("You water the tree."))
            update_icon()
            return TRUE

    if(istype(I, /obj/item/compost) || istype(I, /obj/item/fertilizer))

        if(fertilizer_happiness >= 25)
            to_chat(user, span_warning("The tree can't absorb any more nutrients right now!"))
            return TRUE

        var/remaining_cap = 25 - fertilizer_happiness
        var/skill = get_farming_skill(user)
        var/potential_gain = 5 + (skill * 4)
        var/actual_gain = min(potential_gain, remaining_cap)
        var/action_time = 5 SECONDS - (skill * 0.5 SECONDS)

        if(do_after(user, action_time, target = src))
            qdel(I)

            fertilizer_happiness += actual_gain
            happiness = min(happiness + actual_gain, 100)
            update_happiness_tier()

            to_chat(user, span_notice("You fertilize the tree."))
            update_icon()
            return TRUE

    if(istype(I, /obj/item/roguegem/ruby) || istype(I, /obj/item/alch/transisdust))

        if(I.type in tree_offerings)
            to_chat(user, span_warning("This object has already been offered to the tree!"))
            return TRUE

        if(length(tree_offerings) >= 3)
            to_chat(user, span_warning("The tree has received enough offerings for now!"))
            return TRUE
  
        qdel(I)
        tree_offerings += I.type
        
        happiness = min(happiness + 10, 100)
        update_happiness_tier()

        to_chat(user, span_notice("The tree accepts your offering gracefully with a flutter of its leaves."))
        update_icon()
        return TRUE
    
    var/was_destroyed = obj_destroyed
    to_chat(user, span_warning("A feeling of dread fills you as you chop into the tree!"))
    . = ..()
    if(.)
        if(!was_destroyed && obj_destroyed)
            if(iscarbon(user))
                var/mob/living/carbon/c = user
                if(c.patron.type == /datum/patron/divine/eora)
                    c.apply_status_effect(/datum/status_effect/debuff/eoran_wilting)
                else
                    to_chat(c, span_warning("A divine curse strikes you for destroying the sacred tree!"))
                    c.adjustFireLoss(100)
                    c.IgniteMob()
                    c.add_stress(/datum/stressevent/psycurse)
            record_featured_stat(FEATURED_STATS_TREE_FELLERS, user)
            GLOB.azure_round_stats[STATS_TREES_CUT]++

/obj/structure/eoran_pomegranate_tree/examine(mob/user)
    . = ..()

    if(happiness_tier == 1)
        . += span_warning("The tree seems neglected. Branches are wilted.")
    else if(happiness_tier == 2)
        . += span_info("The tree appears content and healthy.")
    else if(happiness_tier == 3)
        . += span_good("The tree radiates vibrant energy.")
    else if(happiness_tier == 4)
        . += span_good("The tree bustles with an incandescent light. You feel... perfection.")

    if(water_happiness < 25)
        . += span_info("It could use more water.")
    else
        . += span_info("It is fully slaked.")

    if(fertilizer_happiness < 25)
        . += span_info("The roots could use more nutrients.")
    else
        . += span_info("It is fully sated.")

    if(prune_count < 4)
        . += span_info("The branches look messy. Perhaps a scissor can right this mess.")
    else
        . += span_info("The branches are elaborately pruned.")

    if(length(tree_offerings) < 3)
        . += span_info("The tree yearns for an offering. Whispers enter your mind. A red crystal that shimmers... Something that sculpts one's form... A glittering seed...")

/obj/structure/eoran_pomegranate_tree/proc/reset_care()
    //The benefit of rare offerings are kept through harvests.
    happiness = 0 + (10 * length(tree_offerings))
    water_happiness = 0
    fertilizer_happiness = 0
    prune_count = 0
    update_happiness_tier()
    update_icon()

/obj/structure/eoran_pomegranate_tree/Initialize(mapload)
    . = ..()
    update_icon()
    START_PROCESSING(SSobj, src)

/obj/structure/eoran_pomegranate_tree/process(delta_time)
    var/delta_seconds = delta_time / 10 // Convert delta_time (ticks) to seconds Delta time is the amount of time that has passed since the last time process was called.

    var/target_growth_rate_per_second = 0

    if(growth_progress >= 50)
        var/list/current_mobs = list()
        var/atom/A = src

    // Get all mobs in range
        var/list/mobs_in_range
        mobs_in_range = view(aura_range, A)

        for(var/mob/living/L in mobs_in_range)
            //Unconscious people can't harm others. Nor can they observe trees. Dead people are food.
            if(L.stat == UNCONSCIOUS)
                continue
            current_mobs += L

            // Apply effects if new mob
            if(!affected_mobs[L])
                apply_effects(L)
                affected_mobs[L] = TRUE

        // Remove effects from mobs that left range
        for(var/mob/living/L in affected_mobs - current_mobs)
            remove_effects(L)
            affected_mobs -= L

    if (growth_stage == FRUITING && !fruit)
        // We need to grow from 75% to 100% in time_to_grow_fruit
        var/progress_needed_in_fruiting = growth_threshold * 0.25

        if (time_to_grow_fruit > 0)
            target_growth_rate_per_second = progress_needed_in_fruiting / (time_to_grow_fruit / 10)
        else
            target_growth_rate_per_second = growth_threshold // Grow instantly if time is 0
    else
        if (time_to_mature > 0)
            target_growth_rate_per_second = growth_threshold / (time_to_mature / 10)
        else
            target_growth_rate_per_second = growth_threshold // Grow instantly if time is 0

    growth_progress = min(growth_progress + (target_growth_rate_per_second * delta_seconds), growth_threshold)

    check_growth_stage()

/obj/structure/eoran_pomegranate_tree/proc/apply_effects(mob/living/target)
    target.apply_status_effect(/datum/status_effect/debuff/pomegranate_aura, src)

/obj/structure/eoran_pomegranate_tree/proc/remove_effects(mob/living/target)
    target.remove_status_effect(/datum/status_effect/debuff/pomegranate_aura)

/obj/structure/eoran_pomegranate_tree/proc/check_growth_stage()
    switch(growth_stage)
        if(SPROUT)
            if(growth_progress >= 25)
                advance_stage(GROWING)
        if(GROWING)
            if(growth_progress >= 75)
                advance_stage(FRUITING)
        if(FRUITING)
            if(!fruit && growth_progress >= growth_threshold)
                spawn_fruit()

/obj/structure/eoran_pomegranate_tree/proc/advance_stage(new_stage)
    growth_stage = new_stage
    update_icon()
    visible_message(span_notice("The [name] grows larger!"))
    
    if(new_stage == FRUITING)
        spawn_fruit()

/obj/structure/eoran_pomegranate_tree/proc/spawn_fruit()
    if(fruit)  // Already has fruit
        return
    
    fruit = TRUE
    fruit_ready = FALSE
    update_icon()
    addtimer(CALLBACK(src, .proc/ripen_fruit), rand(10 SECONDS, 15 SECONDS))

/obj/structure/eoran_pomegranate_tree/proc/ripen_fruit()
    fruit_ready = TRUE
    visible_message(span_notice("The fruit on [src] glows with a warm light!"))
    update_icon()

/obj/structure/eoran_pomegranate_tree/update_icon()
    // Base icon states
    switch(growth_stage)
        if(SPROUT)
            icon_state = "t1stump"
        if(GROWING)
            icon_state = "log1"
        if(FRUITING)
            if(fruit_ready)
                icon_state = "tallbush1"
            else if(fruit)
                icon_state = "t10"
            else
                icon_state = "mush1"
    . = ..()

/obj/item/fruit_of_eora
    name = "fruit of eora"
    desc = "A mystical pomegranate glowing with inner light. It feels warm to the touch."
    icon = 'icons/roguetown/items/produce.dmi'
    icon_state = "apple"
    /// Arils will be stored here
    var/list/obj/item/food/eoran_aril/arils = list()

/obj/item/fruit_of_eora/Initialize(mapload)
    . = ..()
    // Aril generation will be implemented later

/datum/status_effect/pomegranate_fatigue
    id = "pom_fatigue"
    duration = 10 SECONDS
    alert_type = /atom/movable/screen/alert/status_effect/pomegranate_fatigue

/datum/status_effect/pomegranate_fatigue/on_apply()
    . = ..()
    owner.add_movespeed_modifier(MOVESPEED_ID_SANITY, update=TRUE, priority=100, override=FALSE, multiplicative_slowdown=0.5)

/datum/status_effect/pomegranate_fatigue/on_remove()
    owner.remove_movespeed_modifier(MOVESPEED_ID_SANITY)
    return ..()

/atom/movable/screen/alert/status_effect/pomegranate_fatigue
    name = "Divine Fatigue"
    desc = "The sacred energy of the pomegranate leaves you weakened."

/obj/structure/eoran_pomegranate_tree/attack_hand(mob/living/user)
    if(!fruit_ready || !fruit)
        return ..()
    
    if(!can_pick_fruit(user))
        return
    
    user.visible_message(
        span_notice("[user] carefully picks the fruit."),
        span_notice("You gently pick the glowing pomegranate.")
    )
    
    var/obj/item/fruit_of_eora/new_fruit = new(user.loc)
    user.put_in_hands(new_fruit)
    
    // Apply picking debuff
    user.apply_status_effect(/datum/status_effect/pomegranate_fatigue)
    
    // Reset tree
    fruit = FALSE
    fruit_ready = FALSE
    growth_progress = 75 // Return to fruiting stage baseline
    reset_care()
    update_icon()

// Check if user can pick fruit
/obj/structure/eoran_pomegranate_tree/proc/can_pick_fruit(mob/living/user)
    if(!fruit_ready)
        to_chat(user, span_warning("The fruit isn't ripe yet!"))
        return FALSE
    
    // Eoran alignment check
    if(!(user.patron.type == /datum/patron/divine/eora))
        to_chat(user, span_warning("The fruit vanishes as you reach for it!"))
        return FALSE
    
    return TRUE

#define POM_FILTER "pom_aura"

/datum/status_effect/debuff/pomegranate_aura
    id = "pomegranate_aura"
    duration = -1
    alert_type = /atom/movable/screen/alert/status_effect/pomegranate_aura
    var/outline_colour ="#42001f"
    var/datum/weakref/source_ref

/datum/status_effect/debuff/pomegranate_aura/on_creation(mob/living/owner, tree)
    source_ref = WEAKREF(tree)
    var/str_change = 0
    var/perc_change = 0

    if(owner.patron.type != /datum/patron/divine/eora)
        str_change = -8
        perc_change = -8
    else
        //Eorans get a slight edge.
        str_change = -6
        perc_change = -6
    
    effectedstats = list(
        "strength" = str_change,
        "perception" = perc_change
    )

    return ..()

/datum/status_effect/debuff/pomegranate_aura/on_apply()
    . = ..()
    var/filter = owner.get_filter(POM_FILTER)
    if (!filter)
        owner.add_filter(POM_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 180, "size" = 1))
    to_chat(owner, span_warning("My combat prowess is sapped by the tree!"))

/datum/status_effect/debuff/pomegranate_aura/on_remove()
    . = ..()
    owner.remove_filter(POM_FILTER)
    to_chat(owner, span_warning("As I leave the influence of the tree, my strength returns."))

/datum/status_effect/debuff/pomegranate_aura/tick()
    // Check if source tree still exists
    var/obj/structure/eoran_pomegranate_tree/tree = source_ref?.resolve()
    if(QDELETED(tree) || !istype(tree))
        owner.remove_status_effect(src)
        return

    // Check distance to tree. This is a sanity check given the aura SHOULD remove already, but you can never be too safe :)
    if(get_dist(owner, tree) > tree.aura_range)
        owner.remove_status_effect(src)
        return

    if(ishuman(owner))
        var/mob/living/carbon/human/H = owner
        // Ugly people might get hurt
        if(HAS_TRAIT(H, TRAIT_UNSEEMLY) && prob(2))
            to_chat(H, span_warning("The tree's beauty burns your eyes!"))
            H.Dizzy(5)
            H.blur_eyes(5)
            H.adjustBruteLoss(10, 0)

        // Beautiful people might get healed
        else if(HAS_TRAIT(H, TRAIT_BEAUTIFUL) && prob(10))
            to_chat(H, span_good("The tree's beauty revitalizes you!"))
            H.apply_status_effect(/datum/status_effect/buff/healing, 1)

    // There is no beauty in death. Feed my tree.
    if(owner.stat == DEAD)
        owner.blood_volume = max(10, owner.blood_volume - 10)

/atom/movable/screen/alert/status_effect/pomegranate_aura
    name = "Eora's Blessing"
    desc = "You feel a sense of peace near this sacred tree."

#undef POM_FILTER

#define WILTING_FILTER "wilting_death"

/datum/status_effect/debuff/eoran_wilting
    id = "wilting"
    duration = 10 SECONDS
    alert_type = /atom/movable/screen/alert/status_effect/pomegranate_aura
    var/outline_colour ="#2c2828"
    var/datum/weakref/source_ref

/datum/status_effect/debuff/eoran_wilting/on_apply()
    if(isliving(owner))
        owner.add_filter(WILTING_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 210, "size" = 2))
        to_chat(owner, span_userdanger("You feel like your limbs are starting to detach horrifically, death is imminent!"))
    return TRUE

/datum/status_effect/debuff/eoran_wilting/on_remove()
    if(isliving(owner))
        var/mob/living/L = owner
        L.remove_filter(WILTING_FILTER)
    
    dismember_owner()

/datum/status_effect/debuff/eoran_wilting/tick()
    if(isliving(owner))
        var/mob/living/L = owner
        L.flash_fullscreen("redflash3", 1)
        
        // Small damage to limbs as warning
        if(iscarbon(L))
            var/mob/living/carbon/C = L
            for(var/obj/item/bodypart/BP in C.bodyparts)
                if(BP.body_zone in list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG))
                    BP.receive_damage(1)

/datum/status_effect/debuff/eoran_wilting/proc/dismember_owner()
    if(!iscarbon(owner))
        return
    
    var/mob/living/carbon/C = owner
    playsound(C, 'sound/misc/eat.ogg', 100, TRUE)
    
    // Dismember limbs in sequence
    var/static/list/dismember_order = list(
        BODY_ZONE_L_ARM,
        BODY_ZONE_R_ARM,
        BODY_ZONE_L_LEG,
        BODY_ZONE_R_LEG,
        BODY_ZONE_HEAD
    )
    
    C.visible_message(span_userdanger("[C]'s limbs wither and fall off in a gruesome display!"))
    
    for(var/zone in dismember_order)
        var/obj/item/bodypart/BP = C.get_bodypart(zone)
        if(BP)
            C.adjustBruteLoss(50)
            BP.dismember()
            sleep(0.5 SECONDS)

#undef WILTING_FILTER