
/obj/item/gun/ballistic/revolver/grenadelauncher/gemlock
	name = "gemlock"
	desc = "A mechanical contraption that strikes a dorpel against blacksteel to fire a small metal sphere at exceptional speeds."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "gemlock0"
	item_state = "gemlock"
	possible_item_intents = list(/datum/intent/shoot/gemlock, /datum/intent/arc/gemlock, INTENT_GENERIC)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/gemlock
	slot_flags = ITEM_SLOT_HIP | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 1
	spread = 0
	can_parry = TRUE
	pin = /obj/item/firing_pin
	force = 10
	var/cocked = FALSE
	cartridge_wording = "musketball"
	load_sound = 'sound/foley/musketload.ogg'
	fire_sound = 'sound/combat/Ranged/musketfire.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	var/damfactor = 1
	experimental_onback = TRUE
	experimental_onhip = TRUE

/obj/item/gun/ballistic/revolver/grenadelauncher/gemlock/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 11,"ny" = 2,"wx" = -8,"wy" = -4,"ex" = 6,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -40,"sturn" = 90,"wturn" = 144,"eturn" = 28,"nflip" = 0,"sflip" = 1,"wflip" = 1,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -3,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 82,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 1,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/gun/ballistic/revolver/grenadelauncher/gemlock/update_icon()
    . = ..()
    cut_overlays()
    if(cocked)
        icon_state = "gemlock1"
    else
        icon_state = "gemlock0"

/datum/intent/shoot/gemlock
	chargedrain = 0 //no drain to aim

//Makes you require both hands to fire & use.
/datum/intent/shoot/gemlock/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

/datum/intent/shoot/gemlock/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
		//skill block
		newtime = newtime + 80
		newtime = newtime - (mastermob.mind.get_skill_level(/datum/skill/combat/crossbows) * 20)
		//per block
		newtime = newtime + 20
		newtime = newtime - ((mastermob.STAPER)*1.5)
		if(newtime > 0)
			return newtime
		else
			return 0.1
	return chargetime

/datum/intent/arc/gemlock
	chargetime = 1
	chargedrain = 0 //no drain to aim a crossbow

//Makes you require both hands to fire & use.
/datum/intent/arc/gemlock/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

/datum/intent/arc/gemlock/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
		//skill block
		newtime = newtime + 80
		newtime = newtime - (mastermob.mind.get_skill_level(/datum/skill/combat/crossbows) * 20)
		//per block
		newtime = newtime + 20
		newtime = newtime - ((mastermob.STAPER)*1.5)
		if(newtime > 0)
			return newtime
		else
			return 1
	return chargetime

/datum/intent/gemlock/strike
	name = "strike"
	blade_class = BCLASS_BLUNT
	attack_verb = list("strikes", "hits")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	chargetime = 0
	penfactor = 5
	swingdelay = 0
	icon_state = "instrike"
	item_d_type = "blunt"

/obj/item/gun/ballistic/revolver/grenadelauncher/gemlock/shoot_with_empty_chamber()
	if(cocked)
		playsound(src.loc, 'sound/foley/musketcock.ogg', 100, FALSE)
		cocked = FALSE
		update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/gemlock/attack_self(mob/living/user)
	if(chambered)
		..()
	else
		if(!cocked)
			to_chat(user, span_info("I ready the gemlock to be fired..."))
			if(do_after(user, 100 - user.STASTR, target = user))
				playsound(user, 'sound/foley/musketcock.ogg', 100, FALSE)
				cocked = TRUE
		else
			to_chat(user, span_warning("I carefully de-cock the gemlock."))
			cocked = FALSE
	update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/gemlock/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(cocked)
			if((loc == user) && (user.get_inactive_held_item() != src))
				return
			..()
		else
			to_chat(user, span_warning("I need to cock the gemlock first!"))


/obj/item/gun/ballistic/revolver/grenadelauncher/gemlock/process_fire/(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 100
		else
			spread = 100 - (150 * (user.client.chargedprog / 50))
	else
		spread = 0
	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB
		BB.damage = BB.damage * damfactor

	cocked = FALSE
	. = ..()

/obj/item/ammo_box/magazine/internal/shot/gemlock
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	caliber = "musketball"
	max_ammo = 1
	start_empty = TRUE
