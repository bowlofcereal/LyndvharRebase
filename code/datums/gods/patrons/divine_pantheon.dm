/datum/patron/divine
	name = null
	associated_faith = /datum/faith/divine
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/divine/astrata
	name = "Anar"
	domain = "The Sun, Patriarchs and Wisdom."
	desc = "The father of the Court of Saints paired with his wife Isil, priest of the Temple of the Six-Pointed Sun. The couple disappeared in the Eclipse of Anno Nihilo without a clearly defined heir, shattering the Sun Elves into the War of Brothers."
	worshippers = "Fathers, Healers and the Enlightened."
	mob_traits = list(TRAIT_APRICITY)
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/revive
	confess_lines = list(
		"ANAR IS MY LIGHT!",
		"ANAR IS THE ALL-FATHER!",
		"I SERVE THE UNCONQUERED SUN!",
	)

/datum/patron/divine/noc
	name = "Isil"
	domain = "The Moon, Matriarchs and Mystery."
	desc = "The mother of the Court of Saints paired with her husband Anar, priestess of the Temple of the Six-Pointed Sun. The couple disappeared in the Eclipse of Anno Nihilo, the mystery of their end dooming her beloved children to centuries of strife."
	worshippers = "Mothers, Lovers and Whisperers."
	mob_traits = list(TRAIT_NIGHT_OWL, TRAIT_NOCSIGHT)
	t1 = /obj/effect/proc_holder/spell/invoked/blindness/miracle
	t2 = /obj/effect/proc_holder/spell/invoked/invisibility/miracle
	confess_lines = list(
		"ISIL IS MY SHROUD!",
		"ISIL HEARS MY CRIES!",
		"I REVEL IN THE MOONLIGHT!",
	)

	// Patrons below should be selectable as the Elven Saints.

/datum/patron/divine/abyssor
	name = "Calarost"
	domain = "Fame, Adventure and Vainglory"
	desc = "Calarost, the ever-striving brother of Beroth, sought greatness and glory in adventures abroad. Slaying horrific monsters and venturing ever further upon his ships, his return from slaying a very dragon was overshadowed by the Couple's disappearance only days later at the eclipse of Anno Nihilo. Driven back to sea by Beroth's rage, he and Lissae established their realm east of what would become the Sea of Tears, fighting centuries of battle in the War of Brothers."
	worshippers = "Adventurers, Champions and the Reckless."
	mob_traits = list(TRAIT_ABYSSOR_SWIM, TRAIT_SEA_DRINKER)
	t1 = /obj/effect/proc_holder/spell/invoked/abyssor_bends
	t2 = /obj/effect/proc_holder/spell/invoked/abyssheal
	t3 = /obj/effect/proc_holder/spell/invoked/call_mossback
	confess_lines = list(
		"REMEMBER MY NAME!",
		"CALAROST! REMEMBER THEIR CRIMES!",
		"IN GLORY I AM IMMORTAL!",
	)

/datum/patron/divine/malum
	name = "Vanesse"
	domain = "Beauty, Artifice and Indulgence."
	desc = "Vanesse's fiery hair was a wonder that captivated the suitors who laid endless gifts before her, and so when she deigned at last to wed she issued a challenge. He who can create that which matches my beauty, she declared, shall have me. Despite gems and diadems from the greatest craftsmen, it was Calarost who won her challenge; presenting her with a silver mirror."
	worshippers = "Artists and Artisans, the Vain and Self-Indulgent."
	mob_traits = list(TRAIT_FORGEBLESSED, TRAIT_BETTER_SLEEP)	
	t1 = /obj/effect/proc_holder/spell/invoked/vigorousexchange
	t2 = /obj/effect/proc_holder/spell/invoked/heatmetal
	t3 = /obj/effect/proc_holder/spell/invoked/hammerfall
	t4 = /obj/effect/proc_holder/spell/invoked/craftercovenant
	extra_spell = /obj/effect/proc_holder/spell/invoked/malum_flame_rogue
	confess_lines = list(
		"HER ART SHALL ENDURE!",
		"BLISS AND BEAUTY, HOW FLEETING!",
		"VANESSE! CURSE THESE RUINERS OF BEAUTY!",
	)

/datum/patron/divine/ravox
	name = "Beroth"
	domain = "Prowess and Valor, Tyranny."
	desc = "Beroth was the Lord-Guardian of the Court of Saints, and the disappearance of the Couple wounded him grievously. Believing only betrayal could be responsible, he drove out his brother Calarost and brother-in-law Saeran, striving to imprison their families. Only the call of his wife Lissae for mercy stayed his hand from tyranny, although the War of Brothers would rage for centuries after."
	worshippers = "Warriors, Oath-Keepers, and Rulers."
	mob_traits = list(TRAIT_SHARPER_BLADES, TRAIT_JUSTICARSIGHT)
	t1 = /obj/effect/proc_holder/spell/self/divine_strike
	t2 = /obj/effect/proc_holder/spell/self/call_to_arms
	t3 = /obj/effect/proc_holder/spell/invoked/persistence
	confess_lines = list(
		"BEROTH GIVE ME STRENGTH!",
		"I KEEP MY OATHES!",
		"BETRAYERS, ALL OF YOU!",
	)

/datum/patron/divine/eora
	name = "Lissae"
	domain = "Mercy, Altruism and Guilelessness"
	desc = "Lissae was blinded by her own beauty, legends say, and Beroth heard from her the first tears wept by elves as she wandered sightless and lost in the primordial forest. Taking her hand and returning her to his hall, they were beloved ever since; yet as Lissae cannot imagine betrayal by the faithful Beroth, she likewise assumes the best in all."
	worshippers = "Virgins and Faithful Brides, Charitable Souls, Innocent Fools."
	mob_traits = list(TRAIT_EMPATH, TRAIT_EXTEROCEPTION)
	t1 = /obj/effect/proc_holder/spell/invoked/bud
	t2 = /obj/effect/proc_holder/spell/invoked/eoracurse
	t3 = null
	confess_lines = list(
		"FORGIVE THEM!",
		"PLEASE! HAVE YOU NO MERCY?",
		"LISSAE FORGIVE YOU!",
	)

/datum/patron/divine/dendor
	name = "Saeran"
	domain = "Simplicity, the Hunt, and Seclusion."
	desc = "Saeran boldly hunted for the Court of Saints, ranging ever further into the wilds as stone and civilization grew around the ancient Sun-Elf palaces. Solitary until nearly slain in a hunt, he was the first to realize death was possible even for elves, and strove to never be bound to a prize or place he was unwilling to forsake to spare his life or his beloved's. With the War of Brothers wandering elves gathered to the realm he formed with Naime, welcoming travellers until the fateful Betrayal."
	worshippers = "Hunters, Druids, and Recluses."
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY, TRAIT_LEECHIMMUNE)
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/shapeshift/dendor
	t3 = /obj/effect/proc_holder/spell/targeted/conjure_glowshroom
	t4 = /obj/effect/proc_holder/spell/self/howl/call_of_the_moon
	confess_lines = list(
		"SAERAN! FREE ME OF THIS SNARE!",
		"THE HUNTER SHALL HAVE YOUR SCENT!",
		"YOU SLAVES TO STONE AND GOLD! FREE ME!",
	)

/datum/patron/divine/necra
	name = "Naime"
	domain = "Forbearance, Humility and Regret."
	desc = "Naime, Veiled Lady of the Wood, came upon Saeran as he lay near death from the failed hunt of a dire bear. With all her art she returned him to health, teaching him at last the value of another. With the fall of their shared realm after the Betrayal, she is yet thought to wander seeking the near-dead, as many wounded claim to have seen her pale face before their strength returns."
	worshippers = "The Humble, Wandering Healers, and Mourners."
	mob_traits = list(TRAIT_SOUL_EXAMINE, TRAIT_NOSTINK)	//No stink is generic but they deal with dead bodies so.. makes sense, I suppose?
	t1 = /obj/effect/proc_holder/spell/invoked/avert		// Move healer spells to 'necra' when said spells work with 'necra' amulets, I suppose.
	t2 = /obj/effect/proc_holder/spell/targeted/abrogation
	t3 = /obj/effect/proc_holder/spell/targeted/churn		
	extra_spell = /obj/effect/proc_holder/spell/targeted/soulspeak
	confess_lines = list(
		"I SUFFER AS NAIME WEEPS!",
		"NAIME WILL TURN HER FACE FROM YOU!",
		"WOE UPON YOU ALL!",
	)

	// Patrons below should be non-selectable until their features integrated elsewhere and they are removed.

/*
/datum/patron/divine/xylix
	name = "Xylix"
	domain = "God of Trickery, Freedom and Inspiration"
	desc = "The Laughing God, both famous and infamous for his sway over the forces of luck. Xylix is known for the inspiration of many a bards lyric. Speaks through his gift to man; the Tarot deck."
	worshippers = "Gamblers, Bards, Artists, and the Silver-Tongued"
	mob_traits = list(TRAIT_XYLIX)
	t1 = /obj/effect/proc_holder/spell/invoked/wheel
	t2 = /obj/effect/proc_holder/spell/invoked/mockery
	confess_lines = list(
		"ASTRATA IS MY LIGHT!",
		"NOC IS NIGHT!",
		"DENDOR PROVIDES!",
		"ABYSSOR COMMANDS THE WAVES!",
		"RAVOX IS JUSTICE!",
		"ALL SOULS FIND THEIR WAY TO NECRA!",
		"HAHAHAHA! AHAHAHA! HAHAHAHA!",
		"PESTRA SOOTHES ALL ILLS!",
		"MALUM IS MY MUSE!",
		"EORA BRINGS US TOGETHER!",
	)

/datum/patron/divine/pestra
	name = "Pestra"
	domain = "Goddess of Decay, Disease and Medicine"
	desc = "Goddess that blessed many a saint with healing hands, Pestra taught man the arts of medicine and its benefits."
	worshippers = "The Sick, Phyicians, Apothecaries"
	mob_traits = list(TRAIT_EMPATH, TRAIT_ROT_EATER)
	t0 = /obj/effect/proc_holder/spell/invoked/diagnose
	t1 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/attach_bodypart
	t4 = /obj/effect/proc_holder/spell/invoked/cure_rot
	confess_lines = list(
		"I SUFFER AS NAIME WEEPS!",
		"DO I DESERVE SUCH TORMENT?",
		"WHY, WHY MUST I SUFFER SO!",
	)
*/
