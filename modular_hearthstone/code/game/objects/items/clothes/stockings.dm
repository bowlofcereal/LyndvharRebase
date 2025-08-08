/obj/item/clothing/under/roguetown/tights/stockings
	name = "stockings"
	desc = "A legwear made just for the pure aesthetics. Popular in courts and brothels alike."
	icon = 'modular_hearthstone/icons/obj/items/clothes/stockings.dmi'
	mob_overlay_icon = 'modular_hearthstone/icons/obj/items/clothes/on_mob/stockings.dmi'
	icon_state = "stockings"
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	body_parts_covered = null
	flags_inv = null
	salvage_amount = 1

/obj/item/clothing/under/roguetown/tights/stockings/random/Initialize()
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	break_sound = 'sound/foley/cloth_rip.ogg'
	blade_dulling = DULLING_CUT
	max_integrity = 200
	integrity_failure = 0.1
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	var/gendered
	var/race
	var/datum/bodypart_feature/legwear/legwears_feature
	var/covers_breasts = FALSE
	sewrepair = TRUE
	salvage_result = /obj/item/natural/cloth
	var/sprite_acc = /datum/sprite_accessory/legwear/stockings

/obj/item/legwears/attack(mob/M, mob/user, def_zone)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.legwear_socks)
			if(!get_location_accessible(H, BODY_ZONE_PRECISE_L_FOOT))
				return
			if(!get_location_accessible(H, BODY_ZONE_PRECISE_R_FOOT))
				return
			if(!legwears_feature)
				var/datum/bodypart_feature/legwear/legwear_new = new /datum/bodypart_feature/legwear()
				legwear_new.set_accessory_type(sprite_acc, color, H)
				legwears_feature = legwear_new
			user.visible_message(span_notice("[user] tries to put [src] on [H]..."))
			if(do_after(user, 50, needhand = 1, target = H))
				var/obj/item/bodypart/chest = H.get_bodypart(BODY_ZONE_CHEST)
				chest.add_bodypart_feature(legwears_feature)
				user.dropItemToGround(src)
				forceMove(H)
				H.legwear_socks = src
				legwears_feature.accessory_colors = color

/obj/item/legwears/random/Initialize()
	. = ..()
	color = pick("#e6e5e5", CLOTHING_BLACK, CLOTHING_BLUE, "#6F0000", "#664357")

/obj/item/clothing/under/roguetown/tights/stockings/white
	color = "#e6e5e5"

/obj/item/clothing/under/roguetown/tights/stockings/black
	color = CLOTHING_BLACK

/obj/item/clothing/under/roguetown/tights/stockings/blue
	color = CLOTHING_BLUE

/obj/item/clothing/under/roguetown/tights/stockings/red
	color = "#6F0000"

/obj/item/clothing/under/roguetown/tights/stockings/purple
	color = "#664357"

//Silk variants

/obj/item/clothing/under/roguetown/tights/stockings/silk
	name = "silk stockings"
	desc = "A legwear made just for the pure aesthetics. Made out of thin silk. Popular among nobles."
	icon_state = "silk"

/obj/item/clothing/under/roguetown/tights/stockings/silk/random/Initialize()
	. = ..()
	color = pick("#e6e5e5", CLOTHING_BLACK, CLOTHING_BLUE, "#6F0000", "#664357")

/obj/item/clothing/under/roguetown/tights/stockings/silk/white
	color = "#e6e5e5"

/obj/item/clothing/under/roguetown/tights/stockings/silk/black
	color = CLOTHING_BLACK

/obj/item/clothing/under/roguetown/tights/stockings/silk/blue
	color = CLOTHING_BLUE

/obj/item/clothing/under/roguetown/tights/stockings/silk/red
	color = "#6F0000"

/obj/item/clothing/under/roguetown/tights/stockings/silk/purple
	color = "#664357"

//Fishnets

/obj/item/clothing/under/roguetown/tights/stockings/fishnet
	name = "fishnet stockings"
	desc = "A legwear popular among wenches."
	icon_state = "fishnet"

/obj/item/clothing/under/roguetown/tights/stockings/fishnet/random/Initialize()
	. = ..()
	color = pick("#e6e5e5", CLOTHING_BLACK, CLOTHING_BLUE, "#6F0000", "#664357")

/obj/item/clothing/under/roguetown/tights/stockings/fishnet/white
	color = "#e6e5e5"

/obj/item/clothing/under/roguetown/tights/stockings/fishnet/black
	color = CLOTHING_BLACK

/obj/item/clothing/under/roguetown/tights/stockings/fishnet/blue
	color = CLOTHING_BLUE

/obj/item/clothing/under/roguetown/tights/stockings/fishnet/red
	color = "#6F0000"

/obj/item/clothing/under/roguetown/tights/stockings/fishnet/purple
	color = "#664357"


//SUPPLY

/datum/supply_pack/rogue/wardrobe/suits/stockings_white
	name = "White Stockings"
	cost = 10
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/white,
					/obj/item/clothing/under/roguetown/tights/stockings/white,
				)

/datum/supply_pack/rogue/wardrobe/suits/stockings_black
	name = "Black Stockings"
	cost = 10
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/black,
					/obj/item/clothing/under/roguetown/tights/stockings/black,
				)

/datum/supply_pack/rogue/wardrobe/suits/stockings_blue
	name = "Blue Stockings"
	cost = 10
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/blue,
					/obj/item/clothing/under/roguetown/tights/stockings/blue,
				)

/datum/supply_pack/rogue/wardrobe/suits/stockings_red
	name = "Red Stockings"
	cost = 10
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/red,
					/obj/item/clothing/under/roguetown/tights/stockings/red,
				)
/datum/supply_pack/rogue/wardrobe/suits/stockings_purple
	name = "Purple Stockings"
	cost = 10
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/purple,
					/obj/item/clothing/under/roguetown/tights/stockings/purple,
				)

//Silk

/datum/supply_pack/rogue/wardrobe/suits/stockings_white_silk
	name = "White Silk Stockings"
	cost = 30
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/silk/white,
					/obj/item/clothing/under/roguetown/tights/stockings/silk/white,
				)

/datum/supply_pack/rogue/wardrobe/suits/stockings_black_silk
	name = "Black Silk Stockings"
	cost = 30
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/silk/black,
					/obj/item/clothing/under/roguetown/tights/stockings/silk/black,
				)

/datum/supply_pack/rogue/wardrobe/suits/stockings_blue_silk
	name = "Blue Silk Stockings"
	cost = 30
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/silk/blue,
					/obj/item/clothing/under/roguetown/tights/stockings/silk/blue,
				)

/datum/supply_pack/rogue/wardrobe/suits/stockings_red_silk
	name = "Red Silk Stockings"
	cost = 30
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/silk/red,
					/obj/item/clothing/under/roguetown/tights/stockings/silk/red,
				)
/datum/supply_pack/rogue/wardrobe/suits/stockings_purple_silk
	name = "Purple Silk Stockings"
	cost = 30
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/silk/purple,
					/obj/item/clothing/under/roguetown/tights/stockings/silk/purple,
				)

//Fishnets

/datum/supply_pack/rogue/wardrobe/suits/stockings_white_fishnet
	name = "White Fishnet Stockings"
	cost = 5
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/fishnet/white,
					/obj/item/clothing/under/roguetown/tights/stockings/fishnet/white,
				)

/datum/supply_pack/rogue/wardrobe/suits/stockings_black_fishnet
	name = "Black Fishnet Stockings"
	cost = 5
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/fishnet/black,
					/obj/item/clothing/under/roguetown/tights/stockings/fishnet/black,
				)

/datum/supply_pack/rogue/wardrobe/suits/stockings_blue_fishnet
	name = "Blue Fishnet Stockings"
	cost = 5
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/fishnet/blue,
					/obj/item/clothing/under/roguetown/tights/stockings/fishnet/blue,
				)

/datum/supply_pack/rogue/wardrobe/suits/stockings_red_fishnet
	name = "Red Fishnet Stockings"
	cost = 5
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/fishnet/red,
					/obj/item/clothing/under/roguetown/tights/stockings/fishnet/red,
				)
/datum/supply_pack/rogue/wardrobe/suits/stockings_purple_fishnet
	name = "Purple Fishnet Stockings"
	cost = 5
	contains = list(
					/obj/item/clothing/under/roguetown/tights/stockings/fishnet/purple,
					/obj/item/clothing/under/roguetown/tights/stockings/fishnet/purple,
				)
