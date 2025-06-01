// Sundmark Areas - Nikov

/area/rogue/sund
	name = "sundmark"
	location_name = "the distance"	// Should only occur as a fail condition if child objects lack more specific locations names, or areas are meant to be secret.
	icon = 'modular_helmsguard/icons/turf/sund_areas.dmi'	// Redirect to the modular icons.
	icon_state = "rogue"

/*	These are all inherited  from the parent /rogue. Leaving in comments as a reference.

	has_gravity = STANDARD_GRAVITY
	ambientsounds = null
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = TRUE
	power_equip = TRUE
	power_light = TRUE
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	requires_power = FALSE
//	var/previous_ambient = ""
	var/town_area = FALSE
	var/keep_area = FALSE
	var/warden_area = FALSE
	var/ceiling_protected = FALSE //Prevents tunneling into these from above
*/


/*		AP's zone-specific buffs for certain classes based on areas. Here for reference until removed. If this is here in 2026, axe it.

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.town_area == TRUE) && HAS_TRAIT(guy, TRAIT_GUARDSMAN) && guy.z == 3 && !guy.has_status_effect(/datum/status_effect/buff/guardbuffone)) //man at arms
		guy.apply_status_effect(/datum/status_effect/buff/guardbuffone)
		if(HAS_TRAIT(guy, TRAIT_KNIGHTSMAN) && guy.has_status_effect(/datum/status_effect/buff/knightbuff))
			guy.remove_status_effect(/datum/status_effect/buff/knightbuff)

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.warden_area == TRUE) && HAS_TRAIT(guy, TRAIT_WOODSMAN) && !guy.has_status_effect(/datum/status_effect/buff/wardenbuff)) // Warden
		guy.apply_status_effect(/datum/status_effect/buff/wardenbuff)

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.keep_area == TRUE) && HAS_TRAIT(guy, TRAIT_KNIGHTSMAN) && !guy.has_status_effect(/datum/status_effect/buff/knightbuff)) //royal guard
		guy.apply_status_effect(/datum/status_effect/buff/knightbuff)
		if(HAS_TRAIT(guy, TRAIT_GUARDSMAN) && guy.has_status_effect(/datum/status_effect/buff/guardbuffone))
			guy.remove_status_effect(/datum/status_effect/buff/guardbuffone)
*/

// Roguetown organized by indoor/outdoor, but Sund areas are organized by geographic location.
// Is this quite so optimized for the specific indoor/outdoor flagging of things in code?
// No, but it makes for a cleaner map editor's experience. And that's who uses areas most. - Nikov

/area/rogue/sund/generic
	name = "sund generic"
	location_name = "somewhere"
	icon_state = "rogue"

// Templates.

/area/rogue/sund/generic/exterior
	name = "generic exterior"
	location_name = "the outdoors"
	icon_state = "exterior"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/sund/generic/interior
	soundenv = 16

/area/rogue/sund/generic/interior
	name = "generic interior"
	location_name = "the indoors"
	icon_state = "interior"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/towngen.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 2
	plane = INDOOR_PLANE
	converted_type = /area/rogue/sund/generic/exterior

// Keep
/area/rogue/sund/keep
	location_name = "the keep"
	keep_area = TRUE
	town_area = TRUE
	first_time_text = "Sundburg Keep"
	icon_state = "keep"

/area/rogue/sund/keep/keep_exterior	// Setting exterior defaults.
	name = "Keep Exterior"
	location_name = "above the keep"
	icon_state = "keep_exterior"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/sund/keep/keep_interior
	soundenv = 16

/area/rogue/sund/keep/keep_interior	// Setting interior defaults.
	name = "Keep Interior"
	location_name = "the keep's interior"
	icon_state = "keep"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/towngen.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 2
	plane = INDOOR_PLANE
	converted_type = /area/rogue/sund/keep/keep_exterior

/area/rogue/sund/keep/keep_interior/markgrafs_chambers	// Specific subtypes for notable areas.
	name = "Markgraf's Chambers"
	location_name = "the keep's bedchambers"

/area/rogue/sund/keep/keep_interior/throne_room
	name = "Throne Room"
	location_name = "the throne room"

/area/rogue/sund/keep/keep_interior/keep_commons
	name = "Keep Commons"
	location_name = "the keep's interior"

/area/rogue/sund/keep/keep_interior/servants_chambers
	name = "Servant's Interior"
	location_name = "the servant's chambers of the keep"

/area/rogue/sund/keep/keep_interior/keep_cellars
	name = "Keep Cellars"
	location_name = "underneath the keep"

/area/rogue/sund/keep/keep_interior/keep_gatehouse
	name = "Keep Gatehouse"
	location_name = "the keep's gatehouse"

/area/rogue/sund/keep/keep_interior/knights_tower
	name = "Knight's Tower"
	location_name = "the knight's tower"

/area/rogue/sund/keep/keep_interior/stewards_tower
	name = "Steward's Tower"
	location_name = "the steward's tower"

// Castle
/area/rogue/sund/castle
	location_name = "the castle"
	keep_area = TRUE
	town_area = TRUE
	first_time_text = "The Sundburg"
	droning_sound = 'sound/music/area/siege.ogg'
	droning_sound_dusk = 'sound/music/area/siege.ogg'
	droning_sound_night = 'sound/music/area/manor2.ogg'
	icon_state = "castle"

/area/rogue/sund/castle/castle_exterior
	name = "Castle Exterior"
	location_name = "above the castle"
	icon_state = "castle_exterior"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	converted_type = /area/rogue/sund/castle/castle_interior
	soundenv = 16

/area/rogue/sund/castle/castle_exterior/courtyard
	name = "Castle Courtyard"
	location_name = "the castle courtyard"
	icon_state = "castle_courtyard"

/area/rogue/sund/castle/castle_interior
	name = "Castle Interior"
	location_name = "the castle's interior"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	soundenv = 2
	plane = INDOOR_PLANE
	converted_type = /area/rogue/sund/castle/castle_exterior

/area/rogue/sund/castle/castle_interior/castle_nobles
	name = "Tower of Nobles"
	location_name = "the Tower of Nobles"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	soundenv = 2
	plane = INDOOR_PLANE

// Town Walls
/area/rogue/sund/walls
	name = "Sundberg Walls"
	location_name = "the walls"
	first_time_text = "Sundberg Walls"
	icon_state = "walls"
	town_area = TRUE

/area/rogue/sund/walls/exterior
	name = "Sundberg Walls"
	location_name = "the walls"
	icon_state = "walls_exterior"
	converted_type = /area/rogue/sund/walls/interior
	soundenv = 16

/area/rogue/sund/walls/exterior/gatehouse
	name = "Sundberg Gatehouse"
	location_name = "the city gates"

/area/rogue/sund/walls/interior
	name = "Sundberg Walls"
	location_name = "the walls"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	soundenv = 2
	plane = INDOOR_PLANE
	converted_type = /area/rogue/sund/walls/exterior

/area/rogue/sund/walls/interior/gatehouse
	name = "Sundberg Gatehouse"
	location_name = "the city gates"

// Sundmark Streets

/area/rogue/sund/streets/
	name = "Sundberg Streets"
	location_name = "the streets of Sundberg"
	icon_state = "streets"
	town_area = TRUE
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 16

/area/rogue/sund/streets/above
	name = "Above Sundberg"
	location_name = "above Sundberg"

/area/rogue/sund/streets/highstreet
	name = "High Street"
	location_name = "High Street"
	first_time_text = "High Street"

/area/rogue/sund/streets/churchstreet
	name = "Church Street"
	location_name = "Church Street"
	first_time_text = "Church Street"

/area/rogue/sund/streets/gatestreet
	name = "Gate Street"
	location_name = "Gate Street"
	first_time_text = "Gate Street"

/area/rogue/sund/streets/lowstreet
	name = "Low Street"
	location_name = "Low Street"
	first_time_text = "Low Street"

/area/rogue/sund/streets/backways
	name = "the Backways"
	location_name = "the Backways"
	first_time_text = "The Backways"

// Guild House

/area/rogue/sund/guild/
	name = "Guild House"
	location_name = "the guildhouse"
	icon_state = "guild"
	town_area = TRUE

/area/rogue/sund/guild/exterior
	name = "Guild House Exterior"
	location_name = "above the guildhouse"
	icon_state = "guild_exterior"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

/area/rogue/sund/guild/interior
	name = "Guild House"
	location_name = "within the guildhouse"
	icon_state = "guild"

	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	soundenv = 2
	plane = INDOOR_PLANE

/area/rogue/sund/guild/interior/merchant
	name = "Merchant Shop"

/area/rogue/sund/guild/interior/smith
	name = "Smith Shop"
	location_name = "within the smithy"

/area/rogue/sund/guild/interior/tailor
	name = "Tailor Shop"
	location_name = "within the tailor's shop"

// Public House - Watch-house Complex

/area/rogue/sund/public/
	name = "Public House"
	location_name = "the public house"
	icon_state = "inn"
	town_area = TRUE

/area/rogue/sund/public/exterior/
	name = "Public House Exterior"
	location_name = "above the public house"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 16

/area/rogue/sund/public/exterior/inn
	name = "Inn Exterior"
	location_name = "above the inn"
	icon_state = "inn_exterior"

/area/rogue/sund/public/exterior/watch
	name = "Watch-house Exterior"
	location_name = "above the watch-house"
	icon_state = "watch_exterior"

/area/rogue/sund/public/interior/
	name = "Public House"
	location_name = "the public house"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	soundenv = 2
	plane = INDOOR_PLANE

/area/rogue/sund/public/interior/inn
	name = "The Golden Goblet"
	location_name = "the inn"
	first_time_text = "The Golden Goblet"
	icon_state = "inn"

/area/rogue/sund/public/interior/watch
	name = "The Watch-House"
	location_name = "the watch-house"
	icon_state = "watch"
	droning_sound = 'sound/music/area/manorgarri.ogg'

/area/rogue/sund/public/interior/gaol
	name = "The Gaol"
	location_name = "the gaol"
	icon_state = "watch_gaol"
	droning_sound = 'sound/music/area/dungeon2.ogg'

// Church

/area/rogue/sund/church/
	name = "The Church"
	location_name = "the Church"
	icon_state = "church"
	town_area = TRUE

/area/rogue/sund/church/exterior/
	name = "Church Exterior"
	location_name = "above the church"
	icon_state = "church_exterior"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 16

/area/rogue/sund/church/exterior/covered	// The 'breezeways'.
	name = "Church Walkways"
	location_name = "inside the church"
	ambientrain = RAIN_OUT
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = 'sound/music/area/churchdawn.ogg'
	droning_sound_night = 'sound/music/area/towngen.ogg'
	soundenv = 16
	plane = INDOOR_PLANE

/area/rogue/sund/church/interior/
	name = "Church Interior"
	location_name = "inside the church"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = 'sound/music/area/churchdawn.ogg'
	droning_sound_night = 'sound/music/area/towngen.ogg'
	soundenv = 2
	plane = INDOOR_PLANE

/area/rogue/sund/church/interior/cathedral
	name = "Cathedral"
	location_name = "inside the cathendral"

/area/rogue/sund/church/interior/chapterhouse
	name = "Chapter House"
	location_name = "inside the chapter house"

/area/rogue/sund/church/interior/monastery
	name = "Monastery"
	location_name = "inside the monastery"

// Town Houses

/area/rogue/sund/houses/
	name = "Sundberg Houses"
	location_name = "a house in Sundmark"
	icon_state = "houses"
	town_area = TRUE

/area/rogue/sund/houses/exterior
	name = "Sundberg House Rooftops"
	location_name = "above the houses of Sundberg"
	icon_state = "houses_exterior"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 16

/area/rogue/sund/houses/interior
	name = "Sundberg House Interior"
	location_name = "within the houses of Sundberg"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/sleeping.ogg'
	soundenv = 2
	plane = INDOOR_PLANE

// Bath and Bawdy Werks		I will not apologize.

/area/rogue/sund/bawdy
	name = "Bawdyhouse"
	location_name = "the bawdyhouse"
	icon_state = "bawdy"

/area/rogue/sund/bawdy/exterior
	name = "Sundberg House Rooftops"
	location_name = "above the houses of Sundberg"	// Deliberate obfuscation with other town houses.
	icon_state = "bawdy_exterior"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 16

/area/rogue/sund/bawdy/interior
	name = "Sundberg Bawdyhouse"
	location_name = "within the bawdyhouse"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/bath.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/bath
	soundenv = 2
	plane = INDOOR_PLANE

/area/rogue/sund/bath/interior/baths
	name = "Sundberg Baths"
	location_name = "within the bawdyhouse"	// Deliberate obfuscation with the upstairs.
	icon_state = "baths"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_RATS
	spookynight = SPOOKY_RATS
	droning_sound_dusk = null
	droning_sound_night = null
	ambientrain = RAIN_SEWER
	soundenv = 21

// Sundberg Outskirts		No-ambush, safe areas around Sundberg's walls.

/area/rogue/sund/outskirts
	name = "Sundberg Outskirts"
	icon_state = "outskirts"
	location_name = "the outskirts of Sundberg"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/towngen.ogg'
	droning_sound_night = 'sound/music/area/field.ogg'

/area/rogue/sund/outskirts/farmlands
	name = "Sundberg Farmlands"
	location_name = "the farms of Sundberg"
	icon_state = "outskirts_road"

/area/rogue/sund/outskirts/gateroad
	name = "Sundberg Gate Road"
	location_name = "outside the gates of Sundberg"
	icon_state = "outskirts_road"

/area/rogue/sund/outskirts/wallroad
	name = "Sundberg Wall Road"
	location_name = "outside the walls of Sundberg"
	icon_state = "outskirts_road"

/area/rogue/sund/outskirts/bridge
	name = "Sundberg Bridge"
	location_name = "outside the walls of Sundberg"
	icon_state = "outskirts_road"
	first_time_text = "The Bridge of Sundberg"
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = 'sound/music/area/bog.ogg'
	droning_sound_night = 'sound/music/area/bog.ogg'

/area/rogue/sund/outskirts/interior
	name = "Sundberg Farmhouses"
	location_name = "the farmhouses around Sundberg"
	icon_state = "outskirts_interior"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 2
	plane = INDOOR_PLANE

/area/rogue/sund/outskirts/interior/barge
	name = "Sundberg Outbuildings"
	icon_state = "outskirts_interior"
	ambientrain = RAIN_IN
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = 'sound/music/area/bog.ogg'
	droning_sound_night = 'sound/music/area/bog.ogg'

/area/rogue/indoors/town/warehouse		// Unless or until we touch import code, use this path.
	name = "dock warehouse import"
	icon_state = "warehouse"
	ambientrain = RAIN_IN
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = 'sound/music/area/bog.ogg'
	droning_sound_night = 'sound/music/area/bog.ogg'

// Ambush Wilderness (All Ambush Zones Within, Please!!!)

/area/rogue/sund/wilderness
	name = "Sundmark Wildnerness"
	location_name = "the wilds of Sundmark"
	icon_state = "wilderness"
	soundenv = 19

/area/rogue/sund/wilderness/field
	name = "Sundmark Field"
	location_name = "the fields of Sundmark"
	icon_state = "wilderness_field"
	ambush_times = list("night")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30)

	droning_sound = 'sound/music/area/field.ogg'
	droning_sound_night = 'sound/music/area/bog.ogg'

/area/rogue/sund/wilderness/river
	name = "The Asen River"	// The deepest of lore. Actual Pre-Tacitus cut.
	location_name = "the river Asen"
	icon_state = "river"
	warden_area = TRUE
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/bog.ogg'
	converted_type = /area/rogue/indoors/shelter/woods

/area/rogue/sund/wilderness/woods
	name = "Sundmark Forest"
	location_name = "the forests of Sundmark"
	first_time_text = "The Asenwald"
	icon_state = "wilderness_woods"
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	soundenv = 15
	warden_area = TRUE
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/saiga = 40,
				/mob/living/simple_animal/hostile/retaliate/rogue/spider = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 30)

/area/rogue/sund/wilderness/mountain
	name = "Sundmark Mountains"
	location_name = "the mountains of Sundmark"
	first_time_text = "Mountains of Sundmark"
	icon_state = "wilderness_mountain"
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 30,
				/mob/living/carbon/human/species/goblin/npc/ambush = 20,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 10)
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	warden_area = TRUE
	soundenv = 17

/area/rogue/sund/wilderness/mountain/danger
	name = "Sundmark Peaks"
	icon_state = "wilderness_mountains"
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 30,
				/mob/living/simple_animal/hostile/retaliate/rogue/orc = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 20)
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/caves.ogg'
	ambush_times = list("night","dawn","dusk","day")

// 2025. Nikov was here.
