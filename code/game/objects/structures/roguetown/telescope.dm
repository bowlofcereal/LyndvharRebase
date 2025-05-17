/obj/structure/telescope
	name = "telescope"
	desc = "A mysterious telescope pointing towards the stars."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "telescope"
	density = TRUE
	anchored = FALSE

/obj/structure/telescope/attack_hand(mob/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	var/random_message = pick("You can see the silvery moon.", "Looking at the sun blinds you!", "The stars smile at you.", "Ectar's Star is red today.", "One blurred star reveal itself to be seven!", "You see the star of Alinde dazzling in blue-white radiance.")
	to_chat(H, span_notice("[random_message]"))

	if(random_message == "Looking at the sun blinds you!")
		if(do_after(H, 25, target = src))
			var/obj/item/bodypart/affecting = H.get_bodypart("head")
			to_chat(H, span_warning("The blinding light causes you intense pain!"))
			if(affecting && affecting.receive_damage(0, 5))
				H.update_damage_overlays()


/obj/structure/globe
	name = "globe"
	desc = "A mysterious globe representing the world, although only a fraction is of known lands."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "globe"
	density = TRUE
	anchored = FALSE

/obj/structure/globe/attack_hand(mob/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	var/random_message = pick("You spin the globe!", "You land on Sundmark!", "You land on the Darkshore Isles!", "You land on Tyria!", "You land on Alasturion!", "You land on Eichenwald!", "You land on the Eastern Wilds!")
	to_chat(H, span_notice("[random_message]"))
