/datum/job/roguetown/artisan
	title = "Artisan"
	flag = ARTISAN
	department_flag = TOWNER
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	allowed_races = RACES_ALL_KINDS
	tutorial = "You earn your living through your craftmanship, you possess the skills and precision to turn raw resources into polished products ready for consumption."
	advclass_cat_rolls = list(CTAG_ARTISAN = 20)
	outfit = null
	outfit_female = null
	bypass_lastclass = TRUE
	bypass_jobban = FALSE
	display_order = JDO_ARTISAN
	give_bank_account = TRUE
	min_pq = -15
	max_pq = null
	round_contrib_points = 2
	wanderer_examine = FALSE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	same_job_respawn_delay = 0

/datum/job/roguetown/artisan/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

