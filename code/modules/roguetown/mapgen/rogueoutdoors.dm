/obj/effect/landmark/mapGenerator/rogue/roguetownfield
	mapGeneratorType = /datum/mapGenerator/roguetownfield
	endTurfX = 155
	endTurfY = 155
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/roguetownfield
	modules = list(/datum/mapGeneratorModule/ambushing, /datum/mapGeneratorModule/roguetownfield/grass, /datum/mapGeneratorModule/roguetownfloras, /datum/mapGeneratorModule/roguetowngrass,/datum/mapGeneratorModule/roguetownfield,/datum/mapGeneratorModule/roguetownfield/road)


/datum/mapGeneratorModule/roguetownfield
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass, /turf/open/floor/rogue/grassyel)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/newtree = 5,							
							/obj/structure/flora/roguetree/stump/log = 3,
							/obj/structure/flora/roguegrass/herb/random = 7,
							/obj/structure/flora/roguetree/stump = 4,
							/obj/structure/flora/roguetree/elder = 14,
							/obj/structure/flora/roguegrass/bush/random = 13,
							/obj/structure/flora/roguegrass = 40,
							/obj/structure/flora/roguegrass/maneater = 16,
							/obj/item/natural/stone = 18,
							/obj/item/natural/rock = 2,
							/obj/item/grown/log/tree/stick = 3,
							/obj/structure/closet/dirthole/closed/loot=3,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 3)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/road=5, /turf/open/floor/rogue/grassyel=5)
	allowed_areas = list(/area/rogue/outdoors/rtfield, /area/rogue/outdoors/sund/wilderness/woods, /area/rogue/outdoors/sund/wilderness/field)

/datum/mapGeneratorModule/roguetownfield/road
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/item/natural/stone = 18,
							/obj/item/grown/log/tree/stick = 3)
	allowed_areas = list(/area/rogue/outdoors/rtfield)

/datum/mapGeneratorModule/roguetownfield/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass, /turf/open/floor/rogue/grassyel)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableTurfs = list(/turf/open/floor/rogue/grass = 15)
	spawnableAtoms = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield, /area/rogue/outdoors/sund/wilderness/woods, /area/rogue/outdoors/sund/wilderness/field)

/datum/mapGeneratorModule/roguetownfloras
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt,/turf/open/floor/rogue/grass,/turf/open/floor/rogue/grassred,/turf/open/floor/rogue/grassyel,/turf/open/floor/rogue/grasscold)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguetree/elder = 30,
						/obj/structure/flora/roguetree = 20,
						/obj/structure/flora/roguegrass/bush/random = 41,
						/obj/effect/spawner/lootdrop/ausflora = 50,)
	allowed_areas = list(/area/rogue/outdoors/rtfield, /area/rogue/outdoors/sund/wilderness/woods, /area/rogue/outdoors/sund/wilderness/field)

/datum/mapGeneratorModule/roguetowngrass
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt,/turf/open/floor/rogue/grass,/turf/open/floor/rogue/grassred,/turf/open/floor/rogue/grassyel,/turf/open/floor/rogue/grasscold)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguegrass = 90,
						/obj/structure/flora/roguegrass/bush/random = 31,
						/obj/structure/flora/roguegrass/maneater = 7,
						/obj/item/natural/stone = 26,
						/obj/item/natural/rock = 26,  
						/obj/item/grown/log/tree/stick = 27)
	allowed_areas = list(/area/rogue/outdoors/rtfield, /area/rogue/outdoors/sund/wilderness/woods, /area/rogue/outdoors/sund/wilderness/field)
