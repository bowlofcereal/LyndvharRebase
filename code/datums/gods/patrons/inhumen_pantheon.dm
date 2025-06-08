/datum/patron/inhuman
	name = null
	associated_faith = /datum/faith/inhuman
	undead_hater = FALSE
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	confess_lines = list(
		"WE KNOW THE TRUTH!",
		"DARE YOU CALL US TRAITOR?",
		"THE SIX DECEIVE YOU ALL!",
	)

/datum/patron/inhuman/zizo
	name = "Lhanc"
	domain = "Perfection in Undeath."
	desc = "Once a councilor to Saeran before the Betrayal, Lhanc thereafter bent his will to attaining revenge upon all humanity. The bones of Tyrian soldiers tremble in ancient tombs and men are twisted into the form of wolves, yet perhaps his most terrible creation is yet unknown."
	worshippers = "Dusk Elves, Necromancers, Vampires, Revenge-Seekers."
	mob_traits = list(TRAIT_CABAL)
	t1 = /obj/effect/proc_holder/spell/invoked/projectile/profane/miracle
	t2 = /obj/effect/proc_holder/spell/invoked/raise_lesser_undead/miracle
	t3 = /obj/effect/proc_holder/spell/invoked/rituos/miracle
	confess_lines = list(
		"DEATH CANNOT HOLD US!",
		"MAY YOUR BONES RISE AND SLAY YOUR BELOVED!",
		"KILL ME! REVENGE IS LHANC'S!",
	)

/datum/patron/inhuman/graggar
	name = "Ectar"
	domain = "Perfection in Power."
	desc = "Champion of Beroth's armies in the War of Brothers, Ectar fought countless duels in pursuit of victory. Insisting upon duels to the death, he was disgraced when Beroth learned of his excesses and cast him out, refusing the challenge of a last duel of honor. Ectar's followers believe power is all but abhor the slaughter of innocents, seeking a warrior to give them honor or a warrior's death."
	worshippers = "Dawn Elves, Champions, the Mighty, the Feared."
	mob_traits = list(TRAIT_HORDE, TRAIT_ORGAN_EATER)
	t1 = /obj/effect/proc_holder/spell/self/call_to_slaughter
	t2 = /obj/effect/proc_holder/spell/invoked/projectile/blood_net
	t3 = /obj/effect/proc_holder/spell/invoked/revel_in_slaughter
	confess_lines = list(
		"GRAGGAR IS THE BEAST I WORSHIP!",
		"THROUGH VIOLENCE, DIVINITY!",
		"THE GOD OF CONQUEST DEMANDS BLOOD!",
	)

/datum/patron/inhuman/baotha
	name = "Alinde"
	domain = "Perfection in Pleasure."
	desc = "Lover of Calarost before he spurned her for Vannesse's petty challenge, Alinde lost her opportunity to join the Court of Saints, yet persisted in her aspirations. Held in high regard by Alasturion's nobility to the point it borders on blasphemy, what is known of her teaching is that death is but an illusion for elves, and rebirth certain for lives not spent in misery."
	worshippers = "Bright Elves, Hedonists, and Conspirators."
	mob_traits = list(TRAIT_DEPRAVED, TRAIT_CRACKHEAD)
	t1 = /obj/effect/proc_holder/spell/invoked/baothablessings
	t2 = /obj/effect/proc_holder/spell/invoked/projectile/blowingdust
	t3 = /obj/effect/proc_holder/spell/invoked/painkiller
	confess_lines = list(
		"ALINDE, EASE MY PAIN!",
		"LIFE WITHOUT WANT, PERFECTION!",
		"I AM THE THOUSAND-FACET GEM!",
	)

//		AP made Matthios unrecognizable. Alchemist? Thief? Plate armor rituals? Full Plate Alchemist? Full... Metal. Alchemist. Goddamnit AP.

/datum/patron/inhuman/matthios
	name = "Sylvan Wanderers"
	domain = "Sacrifice, Wanderlust and Remorse."
	desc = "When Saeran's people were scattered, a weary few struck out into far deeper wilds. Shunning anything they cannot carry lightly, they consider all of civilization a curse compared to the happy life of the ancient times. Outcasts of men and even dwarves sometimes go far afield to learn their ways, sacrificing gold and returning to free their loved ones from the bonds of wealth."
	worshippers = "Gloam-elves, Woodsmen, Outcasts."
	mob_traits = list(TRAIT_COMMIE, TRAIT_MATTHIOS_EYES)
	t0 = /obj/effect/proc_holder/spell/invoked/appraise
	t1 = /obj/effect/proc_holder/spell/invoked/transact
	t2 = /obj/effect/proc_holder/spell/invoked/equalize
	t3 = /obj/effect/proc_holder/spell/invoked/churnwealthy
	confess_lines = list(
		"LIFE IS ALL WORTH HOLDING!",
		"TAKE ALL FROM ME, LET ME GO!",
		"SAERAN! DID I NOT HEED YOUR CALL?",
	)
