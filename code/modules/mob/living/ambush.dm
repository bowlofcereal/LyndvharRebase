GLOBAL_VAR_INIT(ambush_chance_pct, 20) // Please don't raise this over 100 admins :')
GLOBAL_VAR_INIT(ambush_global_cooldown, 3 MINUTES) // Cooldown for the game spawning ambushes on anyone
GLOBAL_VAR_INIT(ambush_mobconsider_cooldown, 15 SECONDS) // Cooldown for each individual mob being considered for an ambush

/mob/living/proc/ambushable()
	if(mob_timers["ambushlast"])
		if(world.time < mob_timers["ambushlast"] + GLOB.ambush_global_cooldown)
			return FALSE
	if(stat)
		return FALSE
	return ambushable

/mob/living/proc/consider_ambush()
	// Check if the mob has the Curse of Woe
	var/has_woe = has_status_effect(/datum/status_effect/curse_of_woe)
	var/ambush_chance = has_woe ? 40 : GLOB.ambush_chance_pct // 40% chance for those with Curse of Woe
	
	if(prob(100 - ambush_chance))
		return
	if(mob_timers["ambush_check"])
		if(world.time < mob_timers["ambush_check"] + GLOB.ambush_mobconsider_cooldown)
			return
	mob_timers["ambush_check"] = world.time
	if(!ambushable())
		return
	var/area/AR = get_area(src)
	var/turf/T = get_turf(src)
	if(!T)
		return
	
	// Skip area check for those with Curse of Woe
	if(!has_woe && !(T.type in AR.ambush_types))
		return
		
	// For town areas, ensure we have ambush mobs defined for those with Curse of Woe
	if(has_woe && (!AR.ambush_mobs || !length(AR.ambush_mobs)))
		// If we're in a town area with no ambush mobs defined, use a default set
		AR.ambush_mobs = list(
			/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 40,
			/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 60
		)
		
	var/campfires = 0
	for(var/obj/machinery/light/rogue/RF in view(5, src))
		if(RF.on)
			campfires++
	// Those with Curse of Woe can be ambushed even near light sources
	if(campfires > 0 && !has_woe)
		return
	var/victims = 1
	var/list/victimsa = list()
	for(var/mob/living/V in view(5, src))
		if(V != src)
			if(V.ambushable())
				victims++
				victimsa += V
			if(victims > 3)
				return
	var/list/possible_targets = list()
	
	// For those with Curse of Woe, we'll use any nearby open tiles as spawn points
	if(has_woe)
		// ANY open tile can be a spawn point
		for(var/turf/open/F in view(7, src))
			if(F != T && !F.density)
				possible_targets += F
		
		// Also use any dense object as a potential spawn point
		for(var/obj/O in view(5, src))
			if(O.density && isturf(O.loc))
				possible_targets += O.loc
	
	// Regular spawn points for normal ambushes or as additional options for Curse of Woe
	for(var/obj/structure/flora/roguetree/RT in view(5, src))
		if(istype(RT,/obj/structure/flora/roguetree/stump))
			continue
		if(isturf(RT.loc))
			testing("foundtree")
			possible_targets += RT.loc
//	for(var/obj/structure/flora/roguegrass/bush/RB in range(7, src))
//		if(can_see(src, RB))
//			possible_targets += RB
	for(var/obj/structure/flora/rogueshroom/RX in view(5, src))
		if(isturf(RX.loc))
			testing("foundshroom")
			possible_targets += RX.loc
	for(var/obj/structure/flora/newtree/RS in view(5, src))
		if(!RS.density)
			continue
		if(isturf(RS.loc))
			testing("foundshroom")
			possible_targets += RS.loc
			
	if(length(possible_targets))
		mob_timers["ambushlast"] = world.time
		for(var/mob/living/V in victimsa)
			V.mob_timers["ambushlast"] = world.time
		
		var/spawnedtype = pickweight(AR.ambush_mobs)
		var/mustype = 1
		
		// Those with Curse of Woe get more attackers
		var/spawn_count = has_woe ? CLAMP(victims*1.5, 2, 4) : CLAMP(victims*1, 2, 3)
		
		for(var/i in 1 to spawn_count)
			var/spawnloc = pick(possible_targets)
			if(spawnloc)
				var/mob/spawnedmob = new spawnedtype(spawnloc)
				if(istype(spawnedmob, /mob/living/simple_animal/hostile))
					var/mob/living/simple_animal/hostile/M = spawnedmob
					M.attack_same = FALSE
					M.del_on_deaggro = 44 SECONDS
					M.GiveTarget(src)
					
					// Make ambush mobs for Curse of Woe victims more dangerous
					if(has_woe)
						M.melee_damage_lower = round(M.melee_damage_lower * 1.2)
						M.melee_damage_upper = round(M.melee_damage_upper * 1.2)
						M.maxHealth = round(M.maxHealth * 1.2)
						M.health = M.maxHealth
						
				if(istype(spawnedmob, /mob/living/carbon/human))
					var/mob/living/carbon/human/H = spawnedmob
					H.del_on_deaggro = 44 SECONDS
					H.last_aggro_loss = world.time
					H.retaliate(src)
					mustype = 2
					
		// Special effects for those with Curse of Woe
		if(has_woe)
			to_chat(src, span_warning("<b>Xylix's curse draws enemies to you...</b>"))
			
		if(mustype == 1)
			playsound_local(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
		else
			playsound_local(src, pick('sound/misc/jumphumans (1).ogg','sound/misc/jumphumans (2).ogg','sound/misc/jumphumans (3).ogg'), 100)
		shake_camera(src, 2, 2)
		if(iscarbon(src))
			var/mob/living/carbon/C = src
			if(C.get_stress_amount() >= 30 && (prob(has_woe ? 5 : 0)))
				C.heart_attack()
				
		// Check if this was triggered by Xylix's Curse of Woe and remove it if so
		check_curse_of_woe_ambush()
