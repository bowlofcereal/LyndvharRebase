
/obj/item/gun/ballistic/revolver/grenadelauncher/gearlocke
	name = "gearlocke"
	desc = "A mechanical contraption that fires a small metal sphere at exceptional speeds."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "gearlocke0"
	item_state = "gearlocke"
	possible_item_intents = list(/datum/intent/shoot/gearlocke, /datum/intent/arc/gearlocke, INTENT_GENERIC)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/gearlocke
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

/obj/item/gun/ballistic/revolver/grenadelauncher/gearlocke/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 11,"ny" = 2,"wx" = -8,"wy" = -4,"ex" = 6,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -40,"sturn" = 90,"wturn" = 144,"eturn" = 28,"nflip" = 0,"sflip" = 1,"wflip" = 1,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -3,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 82,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 1,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/gun/ballistic/revolver/grenadelauncher/gearlocke/update_icon()
    . = ..()
    cut_overlays()
    if(cocked)
        icon_state = "gearlocke1"
    else
        icon_state = "gearlocke0"

/datum/intent/shoot/gearlocke
	chargedrain = 0 //no drain to aim

/datum/intent/shoot/gearlocke/get_chargetime()
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

/datum/intent/arc/gearlocke
	chargetime = 1
	chargedrain = 0 //no drain to aim a crossbow
	
/datum/intent/arc/gearlocke/get_chargetime()
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

/datum/intent/gearlocke/strike
	name = "strike"
	blade_class = BCLASS_BLUNT
	attack_verb = list("strikes", "hits")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	chargetime = 0
	penfactor = 5
	swingdelay = 0
	icon_state = "instrike"
	item_d_type = "blunt"

/obj/item/gun/ballistic/revolver/grenadelauncher/gearlocke/shoot_with_empty_chamber()
	if(cocked)
		playsound(src.loc, 'sound/foley/musketcock.ogg', 100, FALSE)
		cocked = FALSE
		update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/gearlocke/attack_self(mob/living/user)
	if(chambered)
		..()
	else
		if(!cocked)
			to_chat(user, span_info("I ready the gearlocke to be fired..."))
			if(do_after(user, 100 - user.STASTR, target = user))
				playsound(user, 'sound/foley/musketcock.ogg', 100, FALSE)
				cocked = TRUE
		else
			to_chat(user, span_warning("I carefully de-cock the gearlocke."))
			cocked = FALSE
	update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/gearlocke/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(cocked)
			if((loc == user) && (user.get_inactive_held_item() != src))
				return
			..()
		else
			to_chat(user, span_warning("I need to cock the gearlocke first!"))


/obj/item/gun/ballistic/revolver/grenadelauncher/gearlocke/process_fire/(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
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

/obj/item/ammo_box/magazine/internal/shot/gearlocke
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	caliber = "musketball"
	max_ammo = 1
	start_empty = TRUE
