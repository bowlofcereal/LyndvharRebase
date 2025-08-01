/datum/roguestock/import
	import_only = TRUE
	stable_price = TRUE

/datum/roguestock/import/crackers
	name = "Bin of Rations"
	desc = "Low moisture bread that keeps well."
	item_type = /obj/item/roguebin/crackers
	export_price = 100
	importexport_amt = 1

/obj/item/roguebin/crackers/Initialize()
	. = ..()
	new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)
	new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)
	new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)
	new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)
	new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)
	new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)
	new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)
	new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)
	new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)
	new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)

/obj/structure/closet/crate/chest/steward
	lockid = "steward"
	locked = TRUE
	masterkey = TRUE

/datum/roguestock/import/bogguard
	name = "Bog Guard Equipment Crate"
	desc = "Starting kit for a new Bog Guard."
	item_type = /obj/structure/closet/crate/chest/steward/bogguard
	export_price = 50
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/bogguard/Initialize()
	. = ..()
	new /obj/item/clothing/cloak/stabard/bog(src)
	new /obj/item/storage/keyring/guard(src)
	new /obj/item/clothing/suit/roguetown/armor/gambeson(src)
	new /obj/item/rogueweapon/mace/cudgel(src)
	new /obj/item/rope/chain(src)
	
/datum/roguestock/import/townguard
	name = "Watchman Equipment Crate"
	desc = "Starting kit for a new Watchman."
	item_type = /obj/structure/closet/crate/chest/steward/townguard
	export_price = 50
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/townguard/Initialize()
	. = ..()
	new /obj/item/clothing/cloak/stabard/guard(src)
	new /obj/item/storage/keyring/guard(src)
	new /obj/item/clothing/suit/roguetown/armor/gambeson(src)
	new /obj/item/rogueweapon/mace/cudgel(src)
	new /obj/item/rope/chain(src)

/datum/roguestock/import/redpotion
	name = "Crate of Health Potions"
	desc = "Red that keeps men alive."
	item_type = /obj/structure/closet/crate/chest/steward/redpotion
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/redpotion/Initialize()
	. = ..()
	new /obj/item/reagent_containers/glass/bottle/rogue/healthpot(src)
	new /obj/item/reagent_containers/glass/bottle/rogue/healthpot(src)
	new /obj/item/reagent_containers/glass/bottle/rogue/healthpot(src)
	new /obj/item/reagent_containers/glass/bottle/rogue/healthpot(src)
	new /obj/item/reagent_containers/glass/bottle/rogue/healthpot(src)

/datum/roguestock/import/rotpotion
	name = "Crate of Rot Cure Potions"
	desc = "A sought-after crate of rare potions of rot-curing."
	item_type = /obj/structure/closet/crate/chest/steward/rotpotion
	export_price = 400		//Expensive, 200 each roughly. Four uses total, as only 5u needed to reverse rot. Each bottle is 10u.
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/rotpotion/Initialize()
	. = ..()
	new /obj/item/reagent_containers/glass/bottle/alchemical/rogue/rotcure(src)
	new /obj/item/reagent_containers/glass/bottle/alchemical/rogue/rotcure(src)


/datum/roguestock/import/knight
	name = "Cataphract Equipment Crate"
	desc = "Kit for a Cataphract."
	item_type = /obj/structure/closet/crate/chest/steward/knight
	export_price = 490
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/knight/Initialize()
	. = ..()
	new /obj/item/clothing/head/roguetown/helmet/heavy/knight(src)
	new /obj/item/clothing/gloves/roguetown/plate(src)
	new /obj/item/clothing/under/roguetown/platelegs(src)
	new /obj/item/clothing/cloak/tabard/knight/guard(src)
	new /obj/item/clothing/neck/roguetown/bevor(src)
	new /obj/item/clothing/suit/roguetown/armor/chainmail(src)
	new /obj/item/clothing/suit/roguetown/armor/plate/full(src)
	new /obj/item/clothing/shoes/roguetown/boots/armor(src)
	new /obj/item/storage/keyring/guardcastle(src)
	new /obj/item/storage/belt/rogue/leather/steel(src)
	new /obj/item/rogueweapon/sword/long(src)


/datum/roguestock/import/manatarms
	name = "Man at Arms Equipment Crate"
	desc = "Kit for a Man at Arms."
	item_type = /obj/structure/closet/crate/chest/steward/manatarms
	export_price = 250
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/manatarms/Initialize()
	. = ..()
	new /obj/item/clothing/head/roguetown/helmet/bascinet(src)
	new /obj/item/clothing/under/roguetown/chainlegs(src)
	new /obj/item/clothing/cloak/stabard/surcoat/guard(src)
	new /obj/item/clothing/gloves/roguetown/plate(src)
	new /obj/item/clothing/neck/roguetown/gorget(src)
	new /obj/item/clothing/suit/roguetown/armor/chainmail(src)
	new /obj/item/clothing/suit/roguetown/armor/plate/half(src)
	new /obj/item/clothing/shoes/roguetown/boots/armor(src)
	new /obj/item/storage/keyring/guardcastle(src)
	new /obj/item/storage/belt/rogue/leather/steel(src)
	new /obj/item/rogueweapon/spear(src)

/datum/roguestock/import/crossbow
	name = "Crossbows Crate"
	desc = "A crate with 3 crossbows with 3 full quivers."
	item_type = /obj/structure/closet/crate/chest/steward/crossbow
	export_price = 300
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/crossbow/Initialize()
	. = ..()
	new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(src)
	new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(src)
	new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(src)
	new /obj/item/quiver/bolts(src)
	new /obj/item/quiver/bolts(src)
	new /obj/item/quiver/bolts(src)

/datum/roguestock/import/saigabuck
	name = "Saigabuck"
	desc = "One Saigabuck tamed with a saddle from a far away land."
	item_type = /obj/structure/closet/crate/chest/steward/saigabuck
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/saigabuck/Initialize()
	. = ..()
	new /mob/living/simple_animal/hostile/retaliate/rogue/saiga/saigabuck/tame/saddled(src)

/datum/roguestock/import/cow
	name = "Cow"
	desc = "Farmer's best friend, reliable provider of milk and meat."
	item_type = /obj/structure/closet/crate/chest/steward/cow
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/cow/Initialize()
	. = ..()
	new /mob/living/simple_animal/hostile/retaliate/rogue/cow(src)

/datum/roguestock/import/bull
	name = "Bull"
	desc = "Horned and aggressive, required to start a herd."
	item_type = /obj/structure/closet/crate/chest/steward/bull
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/bull/Initialize()
	. = ..()
	new /mob/living/simple_animal/hostile/retaliate/rogue/bull(src)

/datum/roguestock/import/goat
	name = "Doe Goat"
	desc = "An all-purpose source of milk, hide and fat."
	item_type = /obj/structure/closet/crate/chest/steward/goat
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/goat/Initialize()
	. = ..()
	new /mob/living/simple_animal/hostile/retaliate/rogue/goat(src)

/datum/roguestock/import/goatmale
	name = "Billy Goat"
	desc = "Bearded, male goat capable of saddling."
	item_type = /obj/structure/closet/crate/chest/steward/goatmale
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/goatmale/Initialize()
	. = ..()
	new /mob/living/simple_animal/hostile/retaliate/rogue/goatmale(src)

/datum/roguestock/import/chicken
	name = "Chicken"
	desc = "A reliable source of egg and meat."
	item_type = /obj/structure/closet/crate/chest/steward/chicken
	export_price = 50
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/chicken/Initialize()
	. = ..()
	new /mob/living/simple_animal/hostile/retaliate/rogue/chicken(src)

/datum/roguestock/import/farmequip
	name = "Farm Equipment Crate"
	desc = "A crate with a pitchfork, sickle, hoe and some seeds."
	item_type = /obj/structure/closet/crate/chest/steward/farmequip
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/farmequip/Initialize()
	. = ..()
	new /obj/item/rogueweapon/hoe(src)
	new /obj/item/rogueweapon/pitchfork(src)
	new /obj/item/rogueweapon/sickle(src)
	new /obj/item/seeds/apple(src)
	new /obj/item/seeds/wheat(src)
	new /obj/item/seeds/berryrogue(src)

/datum/roguestock/import/blacksmith
	name = "Smith Crate"
	desc = "Stone, coal , iron ingot, wood bin, bucket with hammer and tongs."
	item_type = /obj/structure/closet/crate/chest/steward/blacksmith
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/blacksmith/Initialize()
	. = ..()
	new /obj/item/rogueweapon/hammer/iron(src)
	new /obj/item/rogueweapon/tongs(src)
	new /obj/item/natural/stone(src)
	new /obj/item/natural/stone(src)
	new /obj/item/natural/stone(src)
	new /obj/item/natural/stone(src)
	new /obj/item/rogueore/coal(src)
	new /obj/item/rogueore/coal(src)
	new /obj/item/ingot/iron(src)
	new /obj/item/natural/stone(src)
	new /obj/item/natural/stone(src)
	new /obj/item/natural/stone(src)
	new /obj/item/natural/stone(src)
	new /obj/item/roguebin(src)
	new /obj/item/reagent_containers/glass/bucket(src)

/datum/roguestock/import/craftsman
	name = "Craftsman Crate"
	desc = "Handsaw, chisel, hammer."
	item_type = /obj/structure/closet/crate/chest/steward/craftsman
	export_price = 60
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/craftsman/Initialize()
	. = ..()
	new /obj/item/rogueweapon/hammer/wood(src)
	new /obj/item/rogueweapon/chisel(src)
	new /obj/item/rogueweapon/handsaw(src)

/datum/roguestock/import/glasscrate
	name = "Glass Crate"
	desc = "A crate full of glass for windows, repairs, and works of art.."
	item_type = /obj/structure/closet/crate/chest/steward/glasscrate
	export_price = 150
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/glasscrate/Initialize()
	. = ..()
	new /obj/item/natural/glass(src)
	new /obj/item/natural/glass(src)
	new /obj/item/natural/glass(src)
	new /obj/item/natural/glass(src)
	new /obj/item/natural/glass(src)












