//Bobcats are a faster, still hostile, version of a wolf. 
/mob/living/simple_animal/hostile/retaliate/rogue/wolf/bobcat
	icon = 'icons/roguetown/mob/monster/bobcat.dmi'
	name = "lynx"
	desc = "An adorable albiet hated creacher of Azuria's northern coast, hunting livestock and vulnrable people alike.."
	icon_state = "bobcat"
	icon_living = "bobcat"
	icon_dead = "bobcat_dead"
	aggressive = 1
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 2,
						/obj/item/natural/hide = 2,
						/obj/item/alch/sinew = 2, 
						/obj/item/alch/bone = 1, 
						/obj/item/alch/viscera = 1,
						/obj/item/natural/fur = 1, 
						/obj/item/natural/bone = 3)
	remains_type = /obj/effect/decal/remains/bobcat
	health = 100
	maxHealth = 100	//Wolf is 120
	simple_detect_bonus = 40	//VERY good at detecting stealthed people
	melee_damage_lower = 15
	melee_damage_upper = 25
	STACON = 6
	STASTR = 6
	STASPD = 15	//Fast as fuck, boy
