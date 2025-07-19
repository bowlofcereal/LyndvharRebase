/*

Usage:
Override /Run() to run your test code

Call Fail() to fail the test (You should specify a reason)

You may use /New() and /Destroy() for setup/teardown respectively

You can use the run_loc_bottom_left and run_loc_top_right to get turfs for testing

*/

GLOBAL_DATUM(current_test, /datum/unit_test)
GLOBAL_VAR_INIT(failed_any_test, FALSE)
GLOBAL_VAR(test_log)

/datum/unit_test
	//Bit of metadata for the future maybe
	var/list/procs_tested

	//usable vars
	var/turf/run_loc_bottom_left
	var/turf/run_loc_top_right

	///The priority of the test, the larger it is the later it fires
	var/priority = TEST_DEFAULT

	//internal shit
	var/list/allocated
	var/succeeded = TRUE
	var/list/fail_reasons

/// List of atoms that we don't want to ever initialize in an agnostic context, like for Create and Destroy. Stored on the base datum for usability in other relevant tests that need this data.
	var/static/list/uncreatables = null

/proc/cmp_unit_test_priority(datum/unit_test/a, datum/unit_test/b)
	return initial(a.priority) - initial(b.priority)

/datum/unit_test/New()
	run_loc_bottom_left = locate(1, 1, 1)
	run_loc_top_right = locate(5, 5, 1)
	allocated = list()

/datum/unit_test/Destroy()
	QDEL_LIST(allocated)
	// clear the test area
	for(var/turf/turf in Z_TURFS(run_loc_bottom_left.z))
		for(var/content in turf.contents)
			if(istype(content, /obj/effect/landmark))
				continue
			qdel(content)
	return ..()

/datum/unit_test/proc/Run()
	Fail("Run() called parent or not implemented")

/datum/unit_test/proc/Fail(reason = "No reason")
	succeeded = FALSE

	if(!istext(reason))
		reason = "FORMATTED: [reason != null ? reason : "NULL"]"

	LAZYADD(fail_reasons, reason)

/proc/RunUnitTests()
	CHECK_TICK

	var/list/tests_to_run = sortTim(subtypesof(/datum/unit_test), /proc/cmp_unit_test_priority)
	for(var/I in tests_to_run)
		var/datum/unit_test/test = new I

		GLOB.current_test = test
		var/duration = REALTIMEOFDAY

		test.Run()

		duration = REALTIMEOFDAY - duration
		GLOB.current_test = null
		GLOB.failed_any_test |= !test.succeeded

		var/list/log_entry = list("[test.succeeded ? "PASS" : "FAIL"]: [I] [duration / 10]s")
		var/list/fail_reasons = test.fail_reasons

		qdel(test)

		for(var/J in 1 to LAZYLEN(fail_reasons))
			log_entry += "\tREASON #[J]: [fail_reasons[J]]"
		log_test(log_entry.Join("\n"))

		CHECK_TICK

	SSticker.force_ending = TRUE

/// Allocates an instance of the provided type, and places it somewhere in an available loc
/// Instances allocated through this proc will be destroyed when the test is over
/datum/unit_test/proc/allocate(type, ...)
	var/list/arguments = args.Copy(2)
	if(ispath(type, /atom))
		if (!arguments.len)
			arguments = list(run_loc_bottom_left)
		else if (arguments[1] == null)
			arguments[1] = run_loc_bottom_left
	var/instance
	// Byond will throw an index out of bounds if arguments is empty in that arglist call. Sigh
	if(length(arguments))
		instance = new type(arglist(arguments))
	else
		instance = new type()
	allocated += instance
	return instance

/datum/unit_test/proc/log_for_test(text, priority, file, line)
	var/map_name = SSmapping.config?.map_name

	// Need to escape the text to properly support newlines.
	var/annotation_text = replacetext(text, "%", "%25")
	annotation_text = replacetext(annotation_text, "\n", "%0A")

	log_world("::[priority] file=[file],line=[line],title=[map_name]: [type]::[annotation_text]")

/datum/unit_test/proc/final/build_list_of_uncreatables()
	var/list/ignore = list(
		//Never meant to be created, errors out the ass for mobcode reasons
		/mob/living/carbon,
		//Needs a seed passed, but subtypes set one by default
		/obj/item/grown,
		/obj/item/reagent_containers/food/snacks/grown,
		//Template type
		/obj/effect/mob_spawn,
		//Singleton
		/mob/dview,
		//Template type
		/obj/item/bodypart,
		//template types
		//template type again
		/obj/item/storage/fancy,
		//needs a mob passed to view it
		/atom/movable/screen/credit,
		//invalid without mob/living passed
		/obj/shapeshift_holder,
		// requires a pod passed
		/obj/effect/DPfall,
		/obj/effect/DPtarget,
		// prompts loc for input
		/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/grenzelhoft,
		// Sets usr on initialise,
		/obj/item/sendingstonesummoner,
		// This should be obvious
		/obj/merge_conflict_marker,
	)
	//these are VERY situational and need info passed
	ignore += typesof(/obj/effect/abstract)
	//needs a lich passed
	ignore += typesof(/obj/item/phylactery)
	//cba to fix hitscans erroring in Destroy, so just ignore all projectiles
	ignore += typesof(/obj/projectile)
	//Say it with me now, type template
	ignore += typesof(/obj/effect/mapping_helpers)
	//This turf existing is an error in and of itself
	ignore += typesof(/turf/baseturf_skipover)
	ignore += typesof(/turf/baseturf_bottom)
	//We have a baseturf limit of 10, adding more than 10 baseturf helpers will kill CI, so here's a future edge case to fix.
	ignore += typesof(/obj/effect/baseturf_helper)
	//Expects a mob to holderize, we have nothing to give
	ignore += typesof(/obj/item/clothing/head/mob_holder)
	//Needs cards passed into the initilazation args
	ignore += typesof(/obj/item/toy/cards/cardhand)
	//needs multiple atoms passed
	ignore += typesof(/obj/effect/buildmode_line)
	//runtimes without a landmark to spawn on
	ignore += typesof(/obj/structure/industrial_lift)

	ignore += typesof(/obj/effect/spawner)
	ignore += typesof(/atom/movable/screen)
	//ignore += typesof(/obj/abstract) vanderlin ui stuff

	return ignore

/datum/map_template/unit_tests
	name = "Unit Tests Zone"
	mappath = "_maps/templates/unit_tests.dmm"
