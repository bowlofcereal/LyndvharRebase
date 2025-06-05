// Security equipment, security records, gulag item storage, secbots
#define ACCESS_SECURITY 1
/// Brig cells+timers, permabrig, gulag+gulag shuttle, prisoner management console
#define ACCESS_BRIG 2
 /// Armory, gulag teleporter, execution chamber
#define ACCESS_ARMORY 3
///Detective's office, forensics lockers, security+medical records
#define ACCESS_FORENSICS_LOCKERS 4
/// Medical general access
#define ACCESS_MEDICAL 5
/// Morgue access
#define ACCESS_MORGUE 6
/// R&D department, R&D console, burn chamber on some maps
#define ACCESS_TOX 7
/// Toxins storage, burn chamber on some maps
#define ACCESS_TOX_STORAGE 8
/// Genetics access
#define ACCESS_GENETICS 9
/// Engineering area, power monitor, power flow control console
#define ACCESS_ENGINE 10
///APCs, EngiVend/YouTool, engineering equipment lockers
#define ACCESS_ENGINE_EQUIP 11
#define ACCESS_MAINT_TUNNELS 12
#define ACCESS_EXTERNAL_AIRLOCKS 13
#define ACCESS_CHANGE_IDS 15
#define ACCESS_AI_UPLOAD 16
#define ACCESS_TELEPORTER 17
#define ACCESS_EVA 18
/// Bridge, EVA storage windoors, gateway shutters, AI integrity restorer, clone record deletion, comms console
#define ACCESS_HEADS 19
#define ACCESS_ALL_PERSONAL_LOCKERS 21
#define ACCESS_CHAPEL_OFFICE 22
#define ACCESS_TECH_STORAGE 23
#define ACCESS_ATMOSPHERICS 24
#define ACCESS_BAR 25
#define ACCESS_JANITOR 26
#define ACCESS_CREMATORIUM 27
#define ACCESS_KITCHEN 28
#define ACCESS_ROBOTICS 29
#define ACCESS_RD 30
#define ACCESS_CARGO 31
#define ACCESS_CONSTRUCTION 32
#define ACCESS_CHEMISTRY 33
#define ACCESS_HYDROPONICS 35
#define ACCESS_LIBRARY 37
#define ACCESS_LAWYER 38
#define ACCESS_VIROLOGY 39
#define ACCESS_CMO 40
#define ACCESS_QM 41
#define ACCESS_COURT 42
#define ACCESS_SURGERY 45
#define ACCESS_THEATRE 46
#define ACCESS_RESEARCH 47
#define ACCESS_MINING 48
#define ACCESS_MAILSORTING 50
#define ACCESS_MINING_STATION 54
#define ACCESS_XENOBIOLOGY 55
#define ACCESS_CE 56
#define ACCESS_HOP 57
#define ACCESS_HOS 58
/// Request console announcements
#define ACCESS_RC_ANNOUNCE 59
/// Used for events which require at least two people to confirm them
#define ACCESS_KEYCARD_AUTH 60
/// has access to the entire telecomms satellite / machinery
#define ACCESS_TCOMSAT 61
#define ACCESS_GATEWAY 62
/// Outer brig doors, department security posts
#define ACCESS_SEC_DOORS 63
/// For releasing minerals from the ORM
#define ACCESS_MINERAL_STOREROOM 64
#define ACCESS_MINISAT 65
/// Weapon authorization for secbots
#define ACCESS_WEAPONS 66
/// NTnet diagnostics/monitoring software
#define ACCESS_NETWORK 67
/// Cloning room and clone pod ejection
#define ACCESS_CLONING 68

	//BEGIN CENTCOM ACCESS
	/*Should leave plenty of room if we need to add more access levels.
	Mostly for admin fun times.*/
/// General facilities. CentCom ferry.
#define ACCESS_CENT_GENERAL 101
/// Thunderdome.
#define ACCESS_CENT_THUNDER 102
/// Special Ops. Captain's display case, Marauder and Seraph mechs.
#define ACCESS_CENT_SPECOPS 103
/// Medical/Research
#define ACCESS_CENT_MEDICAL 104
/// Living quarters.
#define ACCESS_CENT_LIVING 105
/// Generic storage areas.
#define ACCESS_CENT_STORAGE 106
/// Teleporter.
#define ACCESS_CENT_TELEPORTER 107
/// Captain's office/ID comp/AI.
#define ACCESS_CENT_CAPTAIN 109
/// The non-existent CentCom Bar
#define ACCESS_CENT_BAR 110

	//The Syndicate
/// General Syndicate Access. Includes Syndicate mechs and ruins.
#define ACCESS_SYNDICATE 150
/// Nuke Op Leader Access
#define ACCESS_SYNDICATE_LEADER 151

	//Away Missions or Ruins
	/*For generic away-mission/ruin access. Why would normal crew have access to a long-abandoned derelict
	or a 2000 year-old temple? */
/// Away general facilities.
#define ACCESS_AWAY_GENERAL 200
/// Away maintenance
#define ACCESS_AWAY_MAINT 201
/// Away medical
#define ACCESS_AWAY_MED 202
/// Away security
#define ACCESS_AWAY_SEC 203
/// Away engineering
#define ACCESS_AWAY_ENGINE 204
///Away generic access
#define ACCESS_AWAY_GENERIC1 205
#define ACCESS_AWAY_GENERIC2 206
#define ACCESS_AWAY_GENERIC3 207
#define ACCESS_AWAY_GENERIC4 208

	//Special, for anything that's basically internal
#define ACCESS_BLOODCULT 250

	// Mech Access, allows maintanenace of internal components and altering keycard requirements.
#define ACCESS_MECH_MINING 300
#define ACCESS_MECH_MEDICAL 301
#define ACCESS_MECH_SECURITY 302
#define ACCESS_MECH_SCIENCE 303
#define ACCESS_MECH_ENGINE 304



// Town
#define ACCESS_TAILOR "tailor"
#define ACCESS_SMITH "blacksmith"
#define ACCESS_INN "tavern"
#define ACCESS_CLINIC "clinic"
#define ACCESS_MERCHANT "merchant"
#define ACCESS_FARM "soilson"
#define ACCESS_BUTCHER "butcher"
#define ACCESS_APOTHECARY "apothecary"
#define ACCESS_FELDSHER "doctor"
#define ACCESS_MATRON "orphanage"
#define ACCESS_ELDER "elder"
#define ACCESS_VETERAN "veteran"
#define ACCESS_MERC "mercenary"
#define ACCESS_TOWER "tower"
#define ACCESS_WAREHOUSE "warehouse"
#define ACCESS_ARTIFICER "artificer"
#define ACCESS_BATHHOUSE "bathhouse"
#define ACCESS_MINER "miner"
#define ACCESS_GAFFER "gaffer"
#define ACCESS_PHYSICIAN "physician"

// Town Garrison (Including forest)
#define ACCESS_GARRISON "garrison"
#define ACCESS_FOREST "forest"
#define ACCESS_CAPTAIN "captain"
#define ACCESS_GATE "gate"

// Church
#define ACCESS_CHURCH "church"
#define ACCESS_PRIEST "priest"
#define ACCESS_RITTER "inquistion"
#define ACCESS_GRAVE "graveyard"

// Manor
#define ACCESS_MANOR "manor"
#define ACCESS_MANOR_GATE "walls"
#define ACCESS_STEWARD "steward"
#define ACCESS_DUNGEON "dungeon"
#define ACCESS_HAND "hand"
#define ACCESS_LORD "lord"
#define ACCESS_VAULT "vault"
#define ACCESS_ARCHIVE "archive"
#define ACCESS_MAGE "mage"
#define ACCESS_AT_ARMS "at_arms"
#define ACCESS_GUEST "guest"

// Shops
#define ACCESS_SHOP_I "shop1"
#define ACCESS_SHOP_II "shop2"
#define ACCESS_SHOP_III "shop3"
#define ACCESS_SHOP_IV "shop4"
#define ACCESS_SHOP_V "shop5"

// House
#define ACCESS_HOUSE_I "house1"
#define ACCESS_HOUSE_II "house2"
#define ACCESS_HOUSE_III "house3"
#define ACCESS_HOUSE_IV "house4"
#define ACCESS_HOUSE_V "house5"

// Waterfront
#define ACCESS_WATER_I "waterfront1"
#define ACCESS_WATER_II "waterfront2"
#define ACCESS_WATER_III "waterfront3"
#define ACCESS_WATER_IV "waterfront4"
#define ACCESS_WATER_V "waterfront5"

// Apartments
#define ACCESS_APART_I "apartment1"
#define ACCESS_APART_II "apartment2"
#define ACCESS_APART_III "apartment3"
#define ACCESS_APART_IV "apartment4"
#define ACCESS_APART_V "apartment5"
#define ACCESS_APART_VI "apartment6"
#define ACCESS_APART_VII "apartment7"
#define ACCESS_APART_VIII "apartment8"
#define ACCESS_APART_IX "apartment9"
#define ACCESS_APART_X "apartment10"
#define ACCESS_APART_XI "apartment11"
#define ACCESS_APART_XII "apartment12"
#define ACCESS_APART_XIII "apartment13"
#define ACCESS_APART_XIV "apartment14"
#define ACCESS_APART_XV "apartment15"
#define ACCESS_APART_XVI "apartment16"
#define ACCESS_APART_XVII "apartment17"
#define ACCESS_APART_XVIII "apartment18"
#define ACCESS_APART_XIX "apartment19"
#define ACCESS_APART_XX "apartment20"
