/obj/structure/flora/roguetree/pine
	name = "pine tree"
	desc = "A tall pine tree with dense foliage, its sturdy trunk and evergreen needles stand resilient against the elements."
	icon = 'modular_stonehedge/pines.dmi'
	icon_state = "pine1"
	opacity = 1
	density = 1
	max_integrity = 200
	blade_dulling = DULLING_CUT
	pixel_x = -35
	pixel_y = -5
	layer = 4.81
	plane = GAME_PLANE_UPPER
	attacked_sound = 'sound/misc/woodhit.ogg'
	destroy_sound = 'sound/misc/woodhit.ogg'
	debris = list(/obj/item/grown/log/tree/stick = 2)
	static_debris = list(/obj/item/grown/log/tree = 1)
	alpha = 200
	stump_type = /obj/structure/flora/roguetree/stump/pine


/obj/structure/flora/roguetree/pine/snow
	icon_state = "pine1-snow"

/obj/structure/flora/roguetree/pine/snow/Initialize()
	. = ..()
	icon_state = "pine[rand(1,4)]-snow"


/obj/structure/flora/roguetree/pine/Initialize()
	. = ..()
	icon_state = "pine[rand(1,4)]"

/obj/structure/flora/roguetree/pine/dead
	name = "dead pine tree"
	desc = "A lifeless pine tree, its once vibrant needles now brittle and gray, standing as a solemn reminder of nature's cycle."
	icon_state = "dead1"

/obj/structure/flora/roguetree/pine/dead/Initialize()
	. = ..()
	icon_state = "dead[rand(1,3)]"

/obj/structure/flora/roguetree/stump/pine
	icon = 'modular_stonehedge/pines.dmi'
	icon_state = "dead4"
	pixel_x = -35

/obj/structure/flora/roguetree/stump/pine/Initialize()
	. = ..()
	icon_state = "dead[rand(4,5)]"
