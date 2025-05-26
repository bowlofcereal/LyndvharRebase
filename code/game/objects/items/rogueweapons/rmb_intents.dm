/datum/rmb_intent
	var/name = "intent"
	var/desc = ""
	var/icon_state = ""
	var/adjacency = TRUE

/mob/living/carbon/human/RightClickOn(atom/A, params)
	if(rmb_intent && !rmb_intent.adjacency && !istype(A, /obj/item/clothing) && cmode)
		var/held = get_active_held_item()
		if(held && istype(held, /obj/item))
			var/obj/item/I = held
			if(I.associated_skill)
				rmb_intent.special_attack(src, A)
	. = ..()

/datum/rmb_intent/proc/special_attack(mob/living/user, atom/target)
	if(!isliving(target))
		return
	if(!user)
		return
	if(user.incapacitated())
		return
	if(!user.mind)
		return
	var/mob/living/L = target
	user.changeNext_move(CLICK_CD_RAPID)
	user.visible_message(span_danger("[user] feints an attack at [target]!"))
	var/perc = 50
	var/obj/item/I = user.get_active_held_item()
	var/ourskill = 0
	var/theirskill = 0
	var/skill_factor = 0
	if(I)
		if(I.associated_skill)
			ourskill = user.mind.get_skill_level(I.associated_skill)
		if(L.mind)
			I = L.get_active_held_item()
			if(I?.associated_skill)
				theirskill = L.mind.get_skill_level(I.associated_skill)
	perc += (ourskill - theirskill)*15 	//skill is of the essence
	perc += (user.STAINT - L.STAINT)*10	//but it's also mostly a mindgame
	skill_factor = (ourskill - theirskill)/2

	if(L.has_status_effect(/datum/status_effect/debuff/exposed))
		perc = 0

	if(user.has_status_effect(/datum/status_effect/debuff/feintcd))
		to_chat(user, span_danger("[L] is too on guard for another so soon!"))
		return

	if(HAS_TRAIT(L,TRAIT_DECEIVING_MEEKNESS))
		perc -= 30
	if(HAS_TRAIT(user,TRAIT_DECEIVING_MEEKNESS))
		perc = max(perc, 65)

	user.apply_status_effect(/datum/status_effect/debuff/feintcd)
	perc = CLAMP(perc, 0, 90)

	if(!prob(perc)) //feint intent increases the immobilize duration significantly
		playsound(user, 'sound/combat/feint.ogg', 100, TRUE)
		if(user.client?.prefs.showrolls)
			to_chat(user, span_warning("[L] did not fall for my feint... [perc]%"))
		return
	if(!istype(user.rmb_intent, /datum/rmb_intent/feint))
		L.apply_status_effect(/datum/status_effect/debuff/exposed)
		L.changeNext_move(0.8 SECONDS)
		L.Immobilize(0.5 SECONDS)
		to_chat(user, span_notice("[L] fell for my feint attack!"))
		to_chat(L, span_danger("I fall for [user]'s feint attack!"))
		return

	L.apply_status_effect(/datum/status_effect/debuff/exposed)
	L.changeNext_move(max(1.5 SECONDS + skill_factor, 2.5 SECONDS))
	L.Immobilize(0.5 SECONDS)
	L.rogfat_add(L.rogfat * 0.1)
	to_chat(user, span_notice("[L] fell for my feint attack!"))
	to_chat(L, span_danger("I fall for [user]'s feint attack!"))
	playsound(user, 'sound/combat/riposte.ogg', 100, TRUE)

/datum/rmb_intent/aimed
	name = "aimed"
	desc = "Your attacks are more precise but have a longer recovery time. Higher critrate with precise attacks.\n(RMB WHILE COMBAT MODE IS ACTIVE) Bait out your targeted limb to the enemy. If it matches where they're aiming, they will be thrown off balance."
	icon_state = "rmbaimed"

/datum/rmb_intent/aimed/special_attack(mob/living/user, atom/target)
	if(!user)
		return
	if(user.incapacitated())
		return
	if(!ishuman(user))
		return
	if(!ishuman(target))
		return
	if(user == target)
		return
	
	var/mob/living/carbon/human/HT = target
	var/mob/living/carbon/human/HU = user
	var/target_zone = HT.zone_selected
	var/user_zone = HU.zone_selected

	if(HT.has_status_effect(/datum/status_effect/debuff/baited) && user.has_status_effect(/datum/status_effect/debuff/baitcd))
		return	//We don't do anything if either of us is affected by bait statuses

	HU.visible_message(span_danger("[HU] baits an attack from [HT]!"))
	HU.apply_status_effect(/datum/status_effect/debuff/baitcd)

	if((target_zone != user_zone) || ((target_zone == BODY_ZONE_CHEST) || (user_zone == BODY_ZONE_CHEST))) //Our zones match and it's not the chest//Our zones do not match, or we were targeting chest
		var/probbait = 40

		//We take the highest and the lowest stats, clamped to 14.
		var/max_target = min(max(HT.STASTR, HT.STACON, HT.STAEND, HT.STAINT, HT.STAPER, HT.STASPD), 14)
		var/min_target = min(HT.STASTR, HT.STACON, HT.STAEND, HT.STAINT, HT.STAPER, HT.STASPD)
		var/max_user = min(max(HU.STASTR, HU.STACON, HU.STAEND, HU.STAINT, HU.STAPER, HU.STASPD), 14)
		var/min_user = min(HU.STASTR, HU.STACON, HU.STAEND, HU.STAINT, HU.STAPER, HU.STASPD)
		
		if(max_target > max_user)
			probbait -= max_target
		if(min_target > min_user)
			probbait -= 3 * min_target
		
		if(max_target < max_user)
			probbait += max_user
		if(min_target < min_user)
			probbait += 3 * min_user

		probbait = clamp(probbait, 5, 75)

		if(HU.STALUC > HT.STALUC)
			probbait += rand(1, rand(1,25))	//good luck mathing this out, code divers
		if(HU.STALUC < HT.STALUC)
			probbait -= rand(1, rand(1,25))

		HU.rogfat_add(HU.maxrogfat * 0.2)

		if(!prob(probbait))
			to_chat(HU, span_notice("[HT] did not fall for my bait!"))
			to_chat(HT, span_notice("I saw through the bait!"))
			HU.changeNext_move(1 SECONDS)
			return

		HT.changeNext_move(1 SECONDS)
		to_chat(HU, span_notice("[HT] fell for my bait!"))
		to_chat(HT, span_danger("I fall for [HU]'s bait!"))
		HT.emote("huh")
		return

	HT.apply_status_effect(/datum/status_effect/debuff/baited)
	HT.apply_status_effect(/datum/status_effect/debuff/exposed)
	HT.changeNext_move(2 SECONDS)
	HT.Immobilize(2 SECONDS)
	HT.rogfat_add(HT.maxrogfat / 5)
	HT.OffBalance(2.2 SECONDS)
	HT.emote("gasp")
	HU.changeNext_move(0.1 SECONDS)
	to_chat(HU, span_notice("[HT] fell for my bait <b>perfectly</b>!"))
	to_chat(HT, span_danger("I fall for [HU]'s bait <b>perfectly</b>!"))

	if(!HT.pulling)
		return

	HT.stop_pulling()
	to_chat(HU, span_notice("[HT] fell for my dirty trick! I am loose!"))
	to_chat(HT, span_danger("I fall for [HU]'s dirty trick! My hold is broken!"))
	HU.OffBalance(2.2 SECONDS)
	playsound(user, 'sound/combat/riposte.ogg', 100, TRUE)

/datum/rmb_intent/strong
	name = "strong"
	desc = "Your attacks have +1 strength but use more stamina. Higher critrate with brutal attacks. Intentionally fails surgery steps."
	icon_state = "rmbstrong"

/datum/rmb_intent/swift
	name = "swift"
	desc = "Your attacks have less recovery time but are less accurate."
	icon_state = "rmbswift"

/datum/rmb_intent/special
	name = "special"
	desc = "(RMB WHILE DEFENSE IS ACTIVE) A special attack that depends on the type of weapon you are using."
	icon_state = "rmbspecial"

/datum/rmb_intent/feint
	name = "feint"
	desc = "(RMB WHILE DEFENSE IS ACTIVE) A deceptive half-attack with no follow-through, meant to force your opponent to open their guard. Useless against someone who is dodging."
	icon_state = "rmbfeint"

/datum/rmb_intent/riposte
	name = "defend"
	desc = "No delay between dodge and parry rolls.\n(RMB WHILE NOT GRABBING ANYTHING AND HOLDING A WEAPON)\nEnter a defensive stance, guaranteeing the next hit is defended against.\nTwo people who hit each other with the Guard up will have their weapons Clash, potentially disarming them.\nLetting it expire or hitting someone with it who has no Guard up is tiresome."
	icon_state = "rmbdef"
	adjacency = FALSE

/datum/rmb_intent/riposte/special_attack(mob/living/user, atom/target)	//Wish we could breakline these somehow.
	if(!user.has_status_effect(/datum/status_effect/buff/clash) && !user.has_status_effect(/datum/status_effect/debuff/clashcd) && user.get_active_held_item() && !user.r_grab && !user.l_grab && (user.mobility_flags & MOBILITY_STAND) && !user.IsImmobilized() && !user.IsOffBalanced())
		if(user.m_intent == MOVE_INTENT_RUN)
			to_chat(user, span_warning("I can't focus on this while running."))
			return
		user.apply_status_effect(/datum/status_effect/buff/clash)

/datum/rmb_intent/guard
	name = "guarde"
	desc = "(RMB WHILE DEFENSE IS ACTIVE) Raise your weapon, ready to attack any creature who moves onto the space you are guarding."
	icon_state = "rmbguard"

/datum/rmb_intent/weak
	name = "weak"
	desc = "Your attacks have -1 strength and will never critically-hit. Useful for longer punishments, play-fighting, and bloodletting."
	icon_state = "rmbweak"
