//Subtype of wolf, but non-hostile until attacked instead of default hostile.
/mob/living/simple_animal/hostile/retaliate/rogue/wolf/fox
	icon = 'icons/roguetown/mob/monster/fox.dmi'
	name = "venard"
	desc = "A majestic beast of Dendor's realm, hopping through the local fauna."
	icon_state = "fox"
	icon_living = "fox"
	icon_dead = "fox_dead"
	aggressive = 1
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 2,
						/obj/item/natural/hide = 2,
						/obj/item/alch/sinew = 2, 
						/obj/item/alch/bone = 1, 
						/obj/item/alch/viscera = 1,
						/obj/item/natural/fur = 2, 
						/obj/item/natural/bone = 4,
						/obj/item/natural/head/volf/fox = 1)
	remains_type = /obj/effect/decal/remains/fox
	health = 100
	maxHealth = 100	//Wolf is 120
	melee_damage_lower = 10
	melee_damage_upper = 20
	STACON = 6
	STASTR = 5
	STASPD = 13	//Fast
