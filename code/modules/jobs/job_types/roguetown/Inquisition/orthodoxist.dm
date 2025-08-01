/datum/job/roguetown/orthodoxist
	title = "Orthodoxist"
	flag = ORTHODOXIST
	department_flag = INQUISITION
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_races = RACES_SHUNNED_UP
	allowed_patrons = list(/datum/patron/old_god) //You MUST have a Psydonite character to start. Just so people don't get japed into Oops Suddenly Psydon!
	tutorial = "A fervent believer in the cause of the Orthodoxy. Recruited by the Valorian Inquisition either through faith or penance to further the Psydonian goal in the locale."
	selection_color = JCOLOR_INQUISITION
	outfit = null
	outfit_female = null
	display_order = JDO_ORTHODOXIST
	min_pq = 3
	max_pq = null
	round_contrib_points = 2
	advclass_cat_rolls = list(CTAG_INQUISITION = 20)
	wanderer_examine = FALSE
	advjob_examine = TRUE
	give_bank_account = 15

/datum/job/roguetown/orthodoxist/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		if(!H.mind)
			return
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
