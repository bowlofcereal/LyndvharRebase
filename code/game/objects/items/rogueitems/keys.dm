/obj/item/roguekey
	name = "key"
	desc = "An unremarkable iron key."
	icon_state = "iron"
	icon = 'icons/roguetown/items/keys.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	throwforce = 0
	lockid = null
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH|ITEM_SLOT_NECK
	drop_sound = 'sound/items/gems (1).ogg'
	anvilrepair = /datum/skill/craft/blacksmithing
	resistance_flags = FIRE_PROOF
	experimental_inhand = FALSE

	grid_height = 32
	grid_width = 32

/obj/item/lockpick
	name = "lockpick"
	desc = "A small, sharp piece of metal to aid opening locks in the absence of a key."
	icon_state = "lockpick"
	icon = 'icons/roguetown/items/keys.dmi'
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	throwforce = 0
	max_integrity = 10
	picklvl = 1
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH|ITEM_SLOT_NECK
	destroy_sound = 'sound/items/pickbreak.ogg'
	resistance_flags = FIRE_PROOF
	associated_skill = /datum/skill/misc/lockpicking	//Doesn't do anything, for tracking purposes only
	always_destroy = TRUE

	grid_width = 32
	grid_height = 64

/obj/item/lockpick/goldpin
	name = "gold hairpin"
	desc = "Often used by wealthy courtesans and nobility to keep hair and clothing in place."
	icon_state = "goldpin"
	item_state = "goldpin"
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head_items.dmi'
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_MASK|ITEM_SLOT_HIP
	body_parts_covered = NONE
	w_class = WEIGHT_CLASS_TINY
	experimental_onhip = FALSE
	possible_item_intents = list(/datum/intent/use, /datum/intent/stab)
	force = 10
	throwforce = 5
	max_integrity = null
	dropshrink = 0.7
	drop_sound = 'sound/items/gems (2).ogg'
	destroy_sound = 'sound/items/pickbreak.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	associated_skill = /datum/skill/misc/lockpicking
	var/material = "gold"

	grid_width = 32
	grid_height = 32

/obj/item/lockpick/goldpin/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == SLOT_BELT_R)
		icon_state = "[material]pin_beltr"
		user.update_inv_belt()
	if(slot == SLOT_BELT_L)
		icon_state = "[material]pin_beltl"
		user.update_inv_belt()
	else
		icon_state = "[material]pin"
		user.update_icon()

/obj/item/lockpick/goldpin/silver
	name = "silver hairpin"
	desc = "Often used by wealthy courtesans and nobility to keep hair and clothing in place. This one's silver - a rarity."
	icon_state = "silverpin"
	item_state = "silverpin"
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head_items.dmi'
	material = "silver"
	is_silver = TRUE

/obj/item/lockpick/goldpin/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(!H.mind)
		return
	var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("I can't pick up the silver, it is my BANE!"))
			H.Knockdown(10)
			H.Paralyze(10)
			H.adjustFireLoss(25)
			H.fire_act(1,10)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, span_userdanger("I can't pick up the silver, it is my BANE!"))
				H.Knockdown(10)
				H.adjustFireLoss(25)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("I can't pick up the silver, it is my BANE!"))
			H.Knockdown(10)
			H.Paralyze(10)
			H.adjustFireLoss(25)
			H.fire_act(1,10)

/obj/item/roguekey/lord
	name = "master key"
	desc = "The Lord's key."
	icon_state = "bosskey"
	lockid = "lord"
	visual_replacement = /obj/item/roguekey/royal

/obj/item/roguekey/lord/Initialize()
	. = ..()
	if(SSroguemachine.key)
		qdel(src)
	else
		SSroguemachine.key = src

/obj/item/roguekey/lord/proc/anti_stall()
	src.visible_message(span_warning("The Key of Azure Peak crumbles to dust, the ashes spiriting away in the direction of the Keep."))
	SSroguemachine.key = null //Do not harddel.
	qdel(src) //Anti-stall

/obj/item/roguekey/lord/pre_attack(target, user, params)
	. = ..()
	if(istype(target, /obj/structure/closet))
		var/obj/structure/closet/C = target
		if(C.masterkey)
			lockid = C.lockid
	if(istype(target, /obj/structure/door))
		var/obj/structure/door/D = target
		if(D.masterkey)
			lockid = D.lockid

//custom key
/obj/item/key/custom
	name = "custom key"
	desc = "A custom key designed by a blacksmith."
	icon_state = "brownkey"
	var/access2add

/obj/item/key/custom/copy_access(obj/O)
	if(istype(O, /obj/item/key/custom))
		var/obj/item/key/custom/k = O
		if(k.access2add)
			src.access2add = k.access2add
			return TRUE
	var/list/access= O.get_access()
	if(access)
		access2add = access.Copy()
		return TRUE
	return FALSE

/obj/item/key/custom/examine()
	. += ..()
	if(lockids)
		. += span_info("It has been etched with [access2string()].")
		. += span_info("It can have a name etched with a hammer.")
		return
	. += span_info("Its teeth can be set with a hammer or copied from an existing lock or key.")
	if(access2add)
		. += span_info("It has been marked with [access2add[1]], but has not been finished.")

/obj/item/key/custom/attackby(obj/item/I, mob/user, params)
	if(!istype(I, /obj/item/rogueweapon/hammer))
		return ..()
	if(lockids)
		var/input = (input(user, "What would you name this key?", "", "") as text)
		if(!input)
			return
		name = input + " key"
		to_chat(user, span_notice("You rename the key to [name]."))
		return
	var/input = input(user, "What would you like to set the key ID to?", "", 0) as num
	input = abs(input)
	if(!input)
		return
	to_chat(user, span_notice("You set the key ID to [input]."))
	access2add = list("[input]")

/obj/item/key/custom/attack_right(mob/user)
	if(lockids)
		to_chat(user, span_warning("[src] has been finished, it cannot be adjusted again!"))
		return
	var/held = user.get_active_held_item()
	if(istype(held, /obj/item/rogueweapon/hammer))
		if(!access2add)
			to_chat(user, span_warning("[src] is not ready, its teeth are not set!"))
			return
		lockids = access2add
		access2add = null
		to_chat(user, span_notice("You finish [src]."))
		return
	if(!copy_access(held))
		to_chat(user, span_warning("I cannot forge a key from [held]!"))
		return
	to_chat(user, span_notice("I forge the key based on the workings of [held]."))

/obj/item/roguekey/royal
	name = "royal key"
	desc = "The Key to the royal chambers. It even feels pretentious."
	icon_state = "ekey"
	lockid = ACCESS_LORD

/obj/item/roguekey/manor
	name = "manor key"
	desc = "This key will open any manor doors."
	icon_state = "mazekey"
	lockid = ACCESS_MANOR

/obj/item/roguekey/heir
	name = "heir room key"
	desc = "A highly coveted key belonging to the doors of the heirs of this realm."
	icon_state = "hornkey"
	lockid = ACCESS_LORD

/obj/item/roguekey/garrison
	name = "town watch key"
	desc = "This key belongs to the town guards."
	icon_state = "spikekey"
	lockid = ACCESS_MANOR

/obj/item/roguekey/sergeant
	name = "sergeant key"
	desc = "This key belongs to the sergeant of the Men-at-Arms."
	icon_state = "spikekey"
	lockid = ACCESS_MANOR

/obj/item/roguekey/warden
	name = "watchtower key"
	desc = "This key belongs to the wardens."
	icon_state = "spikekey"
	lockid = ACCESS_MANOR

/obj/item/roguekey/dungeon
	name = "dungeon key"
	desc = "This key should unlock the rusty bars and doors of the dungeon."
	icon_state = "rustkey"
	lockid = ACCESS_MANOR

/obj/item/roguekey/vault
	name = "vault key"
	desc = "This key opens the mighty vault."
	icon_state = "cheesekey"
	lockid = ACCESS_MANOR

/obj/item/roguekey/sheriff
	name = "knight captain's key"
	desc = "This key belongs to the captain of the knights."
	icon_state = "cheesekey"
	lockid = ACCESS_MANOR

/obj/item/roguekey/armory
	name = "armory key"
	desc = "This key opens the garrison's armory."
	icon_state = "hornkey"
	lockid = ACCESS_MANOR

/obj/item/roguekey/knight
	name = "knight's key"
	desc = "This is a key to the knight's chambers."
	icon_state = "ekey"
	lockid = ACCESS_MANOR

/obj/item/roguekey/merchant
	name = "merchant's key"
	desc = "A merchant's key."
	icon_state = "cheesekey"
	lockid = ACCESS_MERCHANT

/obj/item/roguekey/shop
	name = "shop key"
	desc = "This key opens and closes a shop door."
	icon_state = "ekey"
	lockid = ACCESS_MERCHANT

/obj/item/roguekey/townie // For use in round-start available houses in town. Do not use default lockID.
	name = "town dwelling key"
	desc = "The key of some townie's home. Hope it's not lost."
	icon_state = "brownkey"
	lockid = ACCESS_HOUSE_I

/obj/item/roguekey/bath // For use in round-start available bathhouse quarters. Do not use default lockID.
	name = "bathhouse quarter key"
	desc = "The key to an employee's quarters. Hope it's not lost."
	icon_state = "brownkey"
	lockid = ACCESS_BATHHOUSE

/obj/item/roguekey/tavern
	name = "tavern key"
	desc = "This key should open and close any tavern door."
	icon_state = "hornkey"
	lockid = ACCESS_INN

/obj/item/roguekey/tavernkeep
	name = "innkeep's key"
	desc = "This key opens and closes the innkeep's bedroom."
	icon_state = "greenkey"
	lockid = ACCESS_INN

/obj/item/roguekey/velder
	name = "elder's key"
	desc = "This key should open and close the elder's home."
	icon_state = "brownkey"
	lockid = ACCESS_ELDER

/obj/item/roguekey/tavern/village
	lockid = ACCESS_INN

/obj/item/roguekey/roomi/village
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomii/village
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomiii/village
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomiv/village
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomv/village
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomvi/village
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomi
	name = "room I key"
	desc = "The key to the first room."
	icon_state = "brownkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomii
	name = "room II key"
	desc = "The key to the second room."
	icon_state = "brownkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomiii
	name = "room III key"
	desc = "The key to the third room."
	icon_state = "brownkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomiv
	name = "room IV key"
	desc = "The key to the fourth room."
	icon_state = "brownkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomv
	name = "room V key"
	desc = "The key to the fifth room."
	icon_state = "brownkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomvi
	name = "room VI key"
	desc = "The key to the sixth room."
	icon_state = "brownkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomvii
	name = "room VII key"
	desc = "The key to the seventh room."
	icon_state = "brownkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/roomviii
	name = "room VIII key"
	desc = "The key to the eight room."
	icon_state = "brownkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/fancyroomi
	name = "luxury room I key"
	desc = "The key to the first luxury room."
	icon_state = "hornkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/fancyroomii
	name = "luxury room II key"
	desc = "The key to the second luxury room."
	icon_state = "hornkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/fancyroomiii
	name = "luxury room III key"
	desc = "The key to the third luxury room."
	icon_state = "hornkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/fancyroomiv
	name = "luxury room IV key"
	desc = "The key to the fourth luxury room."
	icon_state = "hornkey"
	lockid = ACCESS_APART_I

/obj/item/roguekey/fancyroomv
	name = "luxury room V key"
	desc = "The key to the fifth luxury room."
	icon_state = "hornkey"
	lockid = ACCESS_APART_I

//vampire mansion//
/obj/item/roguekey/vampire
	name = "mansion key"
	desc = "The key to a vampire lord's castle."
	icon_state = "vampkey"
	lockid = ACCESS_HOUSE_V
//

/obj/item/roguekey/blacksmith
	name = "blacksmith key"
	desc = "This key opens a blacksmith's workshop."
	icon_state = "brownkey"
	lockid = ACCESS_SMITH

/obj/item/roguekey/blacksmith/town
	name = "town blacksmith key"
	lockid = ACCESS_SMITH

/obj/item/roguekey/walls
	name = "walls key"
	desc = "This is a rusty key."
	icon_state = "rustkey"
	lockid = ACCESS_GARRISON

/obj/item/roguekey/farm
	name = "farm key"
	desc = "This is a rusty key that'll open farm doors."
	icon_state = "rustkey"
	lockid = ACCESS_FARM

/obj/item/roguekey/butcher
	name = "butcher key"
	desc = "This is a rusty key that'll open butcher doors."
	icon_state = "rustkey"
	lockid = ACCESS_BUTCHER

/obj/item/roguekey/church
	name = "church key"
	desc = "This bronze key should open almost all doors in the church."
	icon_state = "brownkey"
	lockid = ACCESS_CHURCH

/obj/item/roguekey/priest
	name = "priest's key"
	desc = "This is the master key of the church."
	icon_state = "cheesekey"
	lockid = ACCESS_PRIEST

/obj/item/roguekey/tower
	name = "tower key"
	desc = "This key should open anything within the tower."
	icon_state = "greenkey"
	lockid = ACCESS_RITTER

/obj/item/roguekey/mage
	name = "magicians's key"
	desc = "This is the court wizard's key. It watches you..."
	icon_state = "eyekey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/graveyard
	name = "crypt key"
	desc = "This rusty key belongs to the gravekeeper."
	icon_state = "rustkey"
	lockid = ACCESS_GRAVE

/obj/item/roguekey/artificer
	name = "artificer's key"
	desc = "This bronze key should open the Artificer's guild."
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/tailor
	name = "tailor's key"
	desc = "This key opens the tailor's shop. There is a thin thread wrapped around it."
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/nightman
	name = "bathmaster's key"
	desc = "This regal key opens the bathmaster's office - and his vault."
	icon_state = "greenkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/nightmaiden
	name = "bathhouse key"
	desc = "This regal key opens doors inside the bath-house."
	icon_state = "bathkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/mercenary
	name = "mercenary key"
	desc = "Why, a mercenary would not kick doors down."
	icon_state = "greenkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/physician
	name = "physician key"
	desc = "The key smells of herbs, feeling soothing to the touch."
	icon_state = "greenkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/puritan
	name = "puritan's key"
	desc = "This is an intricate key." // i have no idea what is this key about
	icon_state = "mazekey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/inquisition
	name = "inquisition key"
	desc = "This key opens the doors leading into the church's basement, where the inquisition dwells."
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/inhumen
	name = "ancient key"
	desc = "A ancient, rusty key. There's no telling where this leads."
	icon_state = "rustkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/hand
	name = "hand's key"
	desc = "This regal key belongs to the Grand Duke's Right Hand."
	icon_state = "cheesekey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/steward
	name = "steward's key"
	desc = "This key belongs to the court's greedy steward."
	icon_state = "cheesekey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/archive
	name = "archive key"
	desc = "This key looks barely used."
	icon_state = "ekey"
	lockid = ACCESS_TAILOR

//grenchensnacker
/obj/item/roguekey/porta
	name = "strange key"
	desc = "Was this key enchanted by a wizard locksmith...?"//what is grenchensnacker.
	icon_state = "eyekey"
	lockid = ACCESS_TAILOR

//Apartment and shop keys
/obj/item/roguekey/apartments
	name = ""
	icon_state = ""
	lockid = ""

/obj/item/roguekey/apartments/apartment1
	name = "apartment i key"
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/apartments/apartment2
	name = "apartment ii key"
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/apartments/apartment3
	name = "apartment iii key"
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/apartments/apartment4
	name = "apartment iv key"
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/apartments/stall1
	name = "stall i key"
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/apartments/stall2
	name = "stall ii key"
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/apartments/stall3
	name = "stall iii key"
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/apartments/stall4
	name = "stall iv key"
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/apartments/stable1
	name = "stable i key"
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR

/obj/item/roguekey/apartments/stable2
	name = "stable ii key"
	icon_state = "brownkey"
	lockid = ACCESS_TAILOR
