/obj/structure/flora/roguetree/elder
	name = "elder tree"
	desc = "A relatively tall and lush tree "
	icon = 'modular_stonehedge/eldertree.dmi'
	icon_state = "e1"
	opacity = 1
	density = 1
	max_integrity = 200
	blade_dulling = DULLING_CUT
	pixel_x = -16
	layer = 4.81
	plane = GAME_PLANE_UPPER
	attacked_sound = 'sound/misc/woodhit.ogg'
	destroy_sound = 'sound/misc/woodhit.ogg'
	debris = list(/obj/item/grown/log/tree/stick = 2)
	static_debris = list(/obj/item/grown/log/tree = 1)
	alpha = 200

/obj/structure/flora/roguetree/elder/Initialize()
	. = ..()
	icon_state = "e[rand(1,15)]"
