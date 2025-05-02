/mob/living/simple_animal/hostile/retaliate/rogue/wolf/direbear	//This way don't need new unqiue AI controller. Wolves are modular anyway.
	icon = 'icons/roguetown/mob/monster/direbear.dmi'
	name = "direbear"
	icon_state = "direbear"
	icon_living = "direbear"
	icon_dead = "direbear_dead"
	base_intents = list(/datum/intent/simple/bite/bear)
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 1, 
									/obj/item/natural/hide = 1, 
									/obj/item/natural/fur/direbear = 1, 
									/obj/item/natural/bone = 3)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 2,
									/obj/item/natural/hide = 2,
									/obj/item/natural/fur/direbear = 1,
									/obj/item/alch/sinew = 2, 
									/obj/item/alch/bone = 1, 
									/obj/item/alch/viscera = 2,
									/obj/item/natural/bone = 4)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 3,
									/obj/item/natural/hide = 3,
									/obj/item/natural/fur/direbear = 2,
									/obj/item/alch/sinew = 2, 
									/obj/item/alch/bone = 1, 
									/obj/item/alch/viscera = 2,
									/obj/item/natural/bone = 4,
									/obj/item/natural/head/direbear = 1)
	health = 250	//Wolf is 120
	maxHealth = 250
	vision_range = 7
	aggro_vision_range = 7
	food_type = list(/obj/item/reagent_containers/food/snacks, 
				/obj/item/bodypart, 	//Woe be upon ye
				/obj/item/organ, 		//Woe be upon ye
				/obj/effect/decal/remains,
				)
	STACON = 12
	STASTR = 12
	STASPD = 8
	remains_type = /obj/effect/decal/remains/bear
	attack_sound = list('sound/vo/mobs/direbear/direbear_attack1.ogg','sound/vo/mobs/direbear/direbear_attack2.ogg','sound/vo/mobs/direbear/direbear_attack3.ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/direbear/direbear_attack1.ogg')	//Placeholder till we get more sounds
		if("pain")
			return pick('sound/vo/mobs/direbear/direbear_death1.ogg')	//Placeholder till we get more sounds
		if("death")
			return pick('sound/vo/mobs/direbear/direbear_death1.ogg', 'sound/vo/mobs/direbear/direbear_death2.ogg')

/obj/effect/decal/remains/bear
	name = "remains"
	gender = PLURAL
	icon_state = "bones"
	icon = 'icons/roguetown/mob/monster/direbear.dmi'

/datum/intent/simple/bite/bear
	clickcd = RAT_ATTACK_SPEED	//Slightly slower than wolfs by .1
