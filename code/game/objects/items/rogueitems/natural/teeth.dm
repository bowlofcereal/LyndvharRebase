/obj/item/natural/tooth
	icon = 'icons/roguetown/mob/teeth.dmi'
	name = "tooth"
	force = 0
	throwforce = 0
	embedding = list("embedded_pain_multiplier" = 0, "embed_chance" = 0, "embedded_fall_chance" = 100)
	dropshrink = 0.5

/obj/item/natural/tooth/proc/make_bloody()
	icon_state = "tooth[rand(1, 3)]_b"

/obj/item/natural/tooth/fang
	name = "fang"
	icon_state = "fang"

/obj/item/natural/tooth/fang/make_bloody()
	icon_state = "fang_b"

/obj/item/natural/tooth/golden
	name = "golden tooth"
	icon_state = "gtooth"
	sellprice = 12

/obj/item/natural/tooth/golden/make_bloody()
	icon_state = "gtooth_b"

/obj/item/natural/tooth/fang/golden
	name = "golden fang"
	icon_state = "gfang"
	sellprice = 30

/obj/item/natural/tooth/fang/golden/make_bloody()
	icon_state = "gfang_b"

/obj/item/natural/tooth/woooden
	name = "wooden tooth"
	icon_state = "wtooth"

/obj/item/natural/tooth/woooden/make_bloody()
	icon_state = "wtooth_b"
