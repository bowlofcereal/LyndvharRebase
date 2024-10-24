// T1: (fires a bone splinter at a target for brute and bleeding if you're not holding bones in your other hand, fires a significantly stronger bone lance if you are)

/obj/effect/proc_holder/spell/invoked/projectile/profane
	name = "Profane"
	desc = "Fire forth a splinter of unholy bone, tearing flesh and causing bleeding. If you hold pieces of bone in your other hand, you will coax a much stronger lance of bone into being."
	clothes_req = FALSE
	range = 8
	associated_skill = /datum/skill/magic/arcane
	projectile_type = /obj/projectile/magic/profane
	chargedloop = /datum/looping_sound/invokefire
	releasedrain = 30
	chargedrain = 1
	chargetime = 15
	charge_max = 10 SECONDS

/obj/effect/proc_holder/spell/invoked/projectile/profane/miracle
	miracle = TRUE
	devotion_cost = 15
	associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/projectile/profane/fire_projectile(mob/living/user, atom/target)
	current_amount--

	var/obj/item/held_item = user.get_active_held_item()
	var/big_cast = FALSE
	if (istype(held_item, /obj/item/stack/sheet/bone))
		var/obj/item/stack/sheet/bone/bonez = held_item
		if (bonez.use(1))
			projectile_type = /obj/projectile/magic/profane/major
			big_cast = TRUE

	var/obj/projectile/P = new projectile_type(user.loc)
	P.firer = user
	P.preparePixelProjectile(target, user)
	P.fire()

	if (big_cast)
		user.visible_message(span_danger("[user] conjures and hurls a vicious lance of bone towards [target]!"), span_notice("I hurl forth a vicious lance of profaned bone at [target]!"))
	else
		user.visible_message(span_danger("[user] directs forth a splinter of bone towards [target]!"), span_notice("I fling forth a shard of profaned bone at [target]!"))

	projectile_type = initial(projectile_type)

/obj/projectile/magic/profane
	name = "profaned bone splinter"
	icon_state = "chronobolt"
	damage = 20
	damage_type = BRUTE
	nodamage = FALSE
	var/embed_prob = 10

/obj/projectile/magic/profane/major
	name = "profaned bone lance"
	damage = 35
	embed_prob = 30

/obj/projectile/magic/profane/on_hit(atom/target, blocked)
	. = ..()
	if (iscarbon(target) && prob(embed_prob))
		var/mob/living/carbon/carbon_target = target
		var/obj/item/bodypart/victim_limb = pick(carbon_target.bodyparts)
		var/obj/item/stack/sheet/bone/splinter/our_splinter = new
		victim_limb.add_embedded_object(our_splinter, FALSE, TRUE)

/obj/item/stack/sheet/bone/splinter
	name = "bone splinter"
	singular_name = "bone splinter"
	embedding = list(
		"embed_chance" = 100,
		"embedded_pain_chance" = 25,
		"embedded_fall_chance" = 5,
	)

/obj/item/stack/sheet/bone/splinter/dropped(mob/user, silent)
	. = ..()
	to_chat(user, span_danger("[src] crumbles into dust..."))
	qdel(src)

