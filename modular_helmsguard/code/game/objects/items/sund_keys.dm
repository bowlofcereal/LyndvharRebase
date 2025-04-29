// This file is for creating custom keys that will belong to the Sundmark map. Use sund_ as the prefix to all lockids made here and on the Sundmark map.
// Each faction will have its own keys so this anticipates the overlap we would otherwise have, that is, orc keys unlocking human doors.


// Sundmark's clockwork key replaces the old Master key with something with an in-world logic.

/obj/item/roguekey/sund/clockwork
	name = "Clockwork Key"
	desc = "A marvelous Dwarven key crafted with ingenius mechanisms, able to unlock nearly any door or chest by some contrivance of springs and clockwork."
	icon_state = "bosskey"
	lockid = "sund_clockwork"

// This sets the clockwork key's lockhash to whatever closet or mineral_door it is used on. Note this doesn't work on machines, etc.

/obj/item/roguekey/sund/clockwork/pre_attack(target, user, params)
	. = ..()
	if(istype(target, /obj/structure/closet))
		var/obj/structure/closet/C = target
		if(C.masterkey)
			lockhash = C.lockhash
	if(istype(target, /obj/structure/mineral_door))
		var/obj/structure/mineral_door/D = target
		if(D.masterkey)
			lockhash = D.lockhash

// The merchant key unlocks the Goldface. Goldface lockid is set in Goldface code; do not sund_ this.

/obj/item/roguekey/merchant
	name = "merchant's key"
	desc = "A merchant's key."
	icon_state = "bosskey"
	lockid = "merchant"

// Castle and Retinue keys.

/obj/item/roguekey/sund/sund_ruler
	name = "Markgraf's key"
	desc = "This key is emblazoned with Sundmark's arms in gold."
	icon_state = "bosskey"
	lockid = "sund_ruler"

/obj/item/roguekey/sund/sund_family
	name = "emblazoned key"
	desc = "This key is emblazoned with the Markgraf's family crest."
	icon_state = "bosskey"
	lockid = "sund_family"

/obj/item/roguekey/sund/sund_secret
	name = "fine gilded key"
	desc = "Gloved and gentle hands have not worn away the gold leaf."
	icon_state = "cheesekey"
	lockid = "sund_secret"

/obj/item/roguekey/sund/sund_steward
	name = "heavy golden key"
	desc = "This lavish key is weighty from a head of solid gold on a brass shank."
	icon_state = "cheesekey"
	lockid = "sund_steward"

/obj/item/roguekey/sund/sund_noble
	name = "staghorn key"
	desc = "The antler of some noble stag adorns this fine brass key."
	icon_state = "hornkey"
	lockid = "sund_noble"

/obj/item/roguekey/sund/sund_knight
	name = "shining key"
	desc = "Savage steel polished to a silvery finish makes up this key."
	icon_state = "ekey"
	lockid = "sund_knight"

/obj/item/roguekey/sund/sund_castle
	name = "cast iron key"
	desc = "Made cheap and sturdy, this key must have an army of brothers."
	icon_state = "rustkey"
	lockid = "sund_castle"

/obj/item/roguekey/sund/sund_arms
	name = "black iron key"
	desc = "Hard beeswax gleams on this iron key, proofing it from rust."
	icon_state = "rustkey"
	lockid = "sund_arms"

/obj/item/roguekey/sund/sund_butler
	name = "pewter key"
	desc = "This key is humble pewter, diligently polished."
	icon_state = "ekey"
	lockid = "sund_butler"

/obj/item/roguekey/sund/sund_ladymaid
	name = "bright silver key"
	desc = "Not a spot of tarnish stains this fine silver key."
	icon_state = "ekey"
	lockid = "sund_ladymaid"

/obj/item/roguekey/sund/sund_servant
	name = "tarnished bronze key"
	desc = "The greenish bronze seems as old and weary as the depths of the keep."
	icon_state = "greenkey"
	lockid = "sund_servant"

// Watch keys.

/obj/item/roguekey/sund/sund_watch
	name = "heavy bronze key"
	desc = "This rugged key bears the mark of the Watch."
	icon_state = "mazekey"
	lockid = "sund_watch"

/obj/item/roguekey/sund/sund_gaol
	name = "blood-rusted key"
	desc = "This key surely belongs to a place of misery."
	icon_state = "rustkey"
	lockid = "sund_gaol"

/obj/item/roguekey/sund/sund_wall
	name = "simple bronze key"
	desc = "Sturdy and well-worn, this key bears the town seal of Sundmark."
	icon_state = "brownkey"
	lockid = "sund_wall"

// Church keys.

/obj/item/roguekey/sund/sund_priest
	name = "cross-shaped key"
	desc = "The Cross Mundane in gold makes up the shank of this key."
	icon_state = "bosskey"
	lockid = "sund_priest"

/obj/item/roguekey/sund/sund_church
	name = "polished brass key"
	desc = "This key is of humble material but faithfully maintained."
	icon_state = "cheesekey"
	lockid = "sund_church"

/obj/item/roguekey/sund/sund_churchm
	name = "humble copper key"
	desc = "This small key is no longer than a man's finger."
	icon_state = "brownkey"
	lockid = "sund_churchm"

/obj/item/roguekey/sund/sund_churchf
	name = "modest copper key"
	desc = "This diminutive key is no longer than a lady's thumb."
	icon_state = "rustkey"
	lockid = "sund_churchf"

/obj/item/roguekey/sund/sund_inquisitor
	name = "goathorn key"
	desc = "The path sinister, the path descendant."
	icon_state = "rustkey"
	lockid = "sund_inquisitor"

// Chapter House Keys

/obj/item/roguekey/sund/sund_chapmaster
	name = "cross-sealed key"
	desc = "This bright brass key is marked with the Chapter Master's seal."
	icon_state = "cheesekey"
	lockid = "sund_chapmaster"

/obj/item/roguekey/sund/sund_chapter
	name = "sturdy bronze key"
	desc = "Resolute but tarnished bronze makes up this stout key."
	icon_state = "greenkey"
	lockid = "sund_chapter"

/obj/item/roguekey/sund/sund_chapterm
	name = "stout bronze key"
	desc = "This is the master key of the church."
	icon_state = "greenkey"
	lockid = "sund_chapterm"

/obj/item/roguekey/sund/sund_chapterf
	name = "graceful bronze key"
	desc = "While well-made, this key has a bit of a delicate handle."
	icon_state = "greenkey"
	lockid = "sund_chapterf"

// Merchants and Shops

/obj/item/roguekey/sund/sund_shop
	name = "dull silver key"
	desc = "Although made of fine metal, this key has a certain greasy feel."
	icon_state = "ekey"
	lockid = "sund_shop"

/obj/item/roguekey/sund/sund_smith
	name = "wrought-iron key"
	desc = "This hammer-forged key has a twisted shank and elaborite ironwork."
	icon_state = "rustkey"
	lockid = "sund_smith"

/obj/item/roguekey/sund/sund_tailor
	name = "ribbon-bound key"
	desc = "A white ribbon is tied round the handle of this key."
	icon_state = "hornkey"
	lockid = "sund_tailor"

/obj/item/roguekey/sund/sund_innkeep
	name = "carved antler key"
	desc = "A bit of carved antler makes this key stand out to the touch."
	icon_state = "hornkey"
	lockid = "sund_innkeep"

/obj/item/roguekey/sund/sund_inn
	name = "dull bronze key"
	desc = "This key is stained with grease and soot."
	icon_state = "brownkey"
	lockid = "sund_inn"

/obj/item/roguekey/sund/sund_parlor
	name = "bright bronze key"
	desc = "Clean and presentable, this key is well-cared for and unweathered."
	icon_state = "brownkey"
	lockid = "sund_gameroom"

/obj/item/roguekey/sund/sund_bawdymaster
	name = "ornate dark key"
	desc = "This dark key feels as heavy as a guilty secret."
	icon_state = "mazekey"
	lockid = "sund_bawdymaster"

/obj/item/roguekey/sund/sund_bawdy
	name = "filthy dark key"
	desc = "This key is filthy to a degree that can never be clean again."
	icon_state = "rustkey"
	lockid = "sund_bawdy"

/obj/item/roguekey/sund/sund_bawdyroom
	name = "gleaming brass key"
	desc = "The second-rate metal has been franticly scoured to seem better than it is."
	icon_state = "cheesekey"
	lockid = "sund_bawdyroom"


// Inn rooms.

/obj/item/roguekey/sund/sund_innroom1
	name = "number I key"
	desc = "This plain key is engraved with the numeral 'I'."
	icon_state = "brownkey"
	lockid = "sund_innroom1"

/obj/item/roguekey/sund/sund_innroom2
	name = "number II key"
	desc = "This plain key is engraved with the numeral 'II'."
	icon_state = "brownkey"
	lockid = "sund_innroom2"

/obj/item/roguekey/sund/sund_innroom3
	name = "number III key"
	desc = "This plain key is engraved with the numeral 'III'."
	icon_state = "brownkey"
	lockid = "sund_innroom3"

/obj/item/roguekey/sund/sund_innroom4
	name = "number IV key"
	desc = "This plain key is engraved with the numeral 'IV'."
	icon_state = "brownkey"
	lockid = "sund_innroom4"

/obj/item/roguekey/sund/sund_innroom5
	name = "number V key"
	desc = "This plain key is engraved with the numeral 'V'."
	icon_state = "brownkey"
	lockid = "sund_innroom5"

/obj/item/roguekey/sund/sund_innroom6
	name = "number VI key"
	desc = "This plain key is engraved with the numeral 'VI'."
	icon_state = "brownkey"
	lockid = "sund_innroom6"

/obj/item/roguekey/sund/sund_innroom7
	name = "number VII key"
	desc = "This plain key is engraved with the numeral 'VII'."
	icon_state = "brownkey"
	lockid = "sund_innroom7"
