/datum/migrant_wave/weocilyn
	name = "The Barony of Weocilyn"
	max_spawns = 1
	shared_wave_type = /datum/migrant_wave/weocilyn
	weight = 50
	downgrade_wave = /datum/migrant_wave/weocilyn_down_one
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/lady = 1,
		/datum/migrant_role/weocilyn/hand = 1,
		/datum/migrant_role/weocilyn/knight = 1,
		/datum/migrant_role/weocilyn/scion = 1,
		/datum/migrant_role/weocilyn/housekeeper = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"

/datum/migrant_wave/weocilyn_down_one
	name = "The Barony of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_two
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/lady = 1,
		/datum/migrant_role/weocilyn/hand = 1,
		/datum/migrant_role/weocilyn/knight = 1,
		/datum/migrant_role/weocilyn/scion = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain! Some of you already did not make it on the way here..."

/datum/migrant_wave/weocilyn_down_two
	name = "The Barony of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_three
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/lady = 1,
		/datum/migrant_role/weocilyn/hand = 1,
		/datum/migrant_role/weocilyn/knight = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain! Some of you already did not make it on the way here..."


/datum/migrant_wave/weocilyn_down_three
	name = "The Barony of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_four
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/knight = 1,
		/datum/migrant_role/weocilyn/hand = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain! Some of you already did not make it on the way here..."

/datum/migrant_wave/weocilyn_down_four
	name = "The Barony of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_five
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/lady = 1,
		/datum/migrant_role/weocilyn/knight = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain! Some of you already did not make it on the way here..."

/datum/migrant_wave/weocilyn_down_five
	name = "The Barony of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_six
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/hand = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain! Now, in the end, it is only the Lord and their trusty Hand left on their lonesome..."

/datum/migrant_wave/weocilyn_down_six
	name = "The Barony of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_seven
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/knight = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain! Now, in the end, it is only the Lord and their trusty knight left on their lonesome..."


/datum/migrant_wave/weocilyn_down_seven
	name = "The Barony of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_eight
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/lady = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain! Now, in the end, it is only the Lord and their love left on their lonesome..."

/datum/migrant_wave/weocilyn_down_eight
	name = "The Barony of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain! It was all for naught - in the end, only you are left, bereft of your family and men. How the mighty have fallen..."
