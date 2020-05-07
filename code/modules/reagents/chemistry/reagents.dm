//The reaction procs must ALWAYS set src = null, this detaches the proc from the object (the reagent)
//so that it can continue working when the reagent is deleted while the proc is still active.

/datum/reagent
	var/name = "Reagent"
	var/id = "reagent"
	var/description = ""
	var/datum/reagents/holder = null
	var/reagent_state = SOLID
	var/list/data = null
	var/volume = 0
	var/nutriment_factor = 1 * REAGENTS_METABOLISM
	var/diet_flags = DIET_OMNI | DIET_HERB | DIET_CARN
	var/custom_metabolism = REAGENTS_METABOLISM
	var/taste_strength = 1 //how easy it is to taste - the more the easier
	var/taste_message = "bitterness" //life's bitter by default. Cool points for using a span class for when you're tasting <span class='userdanger'>LIQUID FUCKING DEATH</span>
	var/list/restrict_species = list(IPC) // Species that simply can not digest this reagent.

	// Currently things below work only in Tycheons.
	var/does_glow = FALSE
	var/max_glow_power = 0
	var/glow_increment = 0

	var/overdose = 0
	var/overdose_dam = 1
	//var/list/viruses = list()
	var/color = "#000000" // rgb: 0, 0, 0 (does not support alpha channels - yet!)

/datum/reagent/proc/reaction_mob(mob/M, method=TOUCH, volume) //By default we have a chance to transfer some
	if(!istype(M, /mob/living))	return 0
	var/datum/reagent/self = src
	src = null										  //of the reagent to the mob on TOUCHING it.

	if(self.holder)		//for catching rare runtimes
		if(!istype(self.holder.my_atom, /obj/effect/effect/smoke/chem))
			// If the chemicals are in a smoke cloud, do not try to let the chemicals "penetrate" into the mob's system (balance station 13) -- Doohl

			if(method == TOUCH)

				var/chance = 1
				var/block  = 0

				for(var/obj/item/clothing/C in M.get_equipped_items())
					if(C.permeability_coefficient < chance) chance = C.permeability_coefficient
					if(istype(C, /obj/item/clothing/suit/bio_suit))
						// bio suits are just about completely fool-proof - Doohl
						// kind of a hacky way of making bio suits more resistant to chemicals but w/e
						if(prob(75))
							block = 1

					if(istype(C, /obj/item/clothing/head/bio_hood))
						if(prob(75))
							block = 1

				chance = chance * 100

				if(prob(chance) && !block)
					if(M.reagents)
						M.reagents.add_reagent(self.id,self.volume/2)
	return 1

/datum/reagent/proc/reaction_obj(var/obj/O, var/volume) //By default we transfer a small part of the reagent to the object
	src = null						//if it can hold reagents. nope!
	//if(O.reagents)
	//	O.reagents.add_reagent(id,volume/3)
	return

/datum/reagent/proc/reaction_turf(var/turf/T, var/volume)
	src = null
	return

/datum/reagent/proc/on_mob_life(mob/living/M, alien)
	if(!isliving(M))
		return //Noticed runtime errors from pacid trying to damage ghosts, this should fix. --NEO
	if(!check_digesting(M, alien)) // You can't overdose on what you can't digest
		return FALSE
	if((overdose > 0) && (volume >= overdose))//Overdosing, wooo
		M.adjustToxLoss(overdose_dam)
	return TRUE

/datum/reagent/proc/on_move(mob/M)
	return

// Called after add_reagents creates a new reagent.
/datum/reagent/proc/on_new(var/data)
	return

// Called when two reagents of the same are mixing.
/datum/reagent/proc/on_merge(data)
	return

/datum/reagent/proc/on_update(atom/A)
	return

/datum/reagent/proc/check_digesting(mob/living/M, alien)
	if(restrict_species)
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(H.species in restrict_species)
				return FALSE
		if(ismonkey(M))
			var/mob/living/carbon/monkey/C = M
			if(C.race in restrict_species)
				return FALSE
	var/datum/species/specimen = all_species[alien]
	if(specimen.call_digest_proc(M, src)) // call_digest_proc returns TRUE if we need to do general digest.
		on_general_digest(M)
	return TRUE

/datum/reagent/proc/on_general_digest(mob/living/M)
	return

/datum/reagent/proc/on_skrell_digest(mob/living/M)
	return TRUE

/datum/reagent/proc/on_unathi_digest(mob/living/M)
	return TRUE

/datum/reagent/proc/on_tajaran_digest(mob/living/M)
	return TRUE

/datum/reagent/proc/on_diona_digest(mob/living/M)
	return TRUE

/datum/reagent/proc/on_vox_digest(mob/living/M)
	return TRUE

/datum/reagent/proc/on_abductor_digest(mob/living/M)
	return TRUE

/datum/reagent/proc/on_skeleton_digest(mob/living/M)
	return TRUE

/datum/reagent/proc/on_shadowling_digest(mob/living/M)
	return TRUE

/datum/reagent/proc/on_golem_digest(mob/living/M)
	return TRUE

/datum/reagent/proc/on_tycheon_digest(mob/living/M)
	if(ishuman(M) && does_glow)
		var/mob/living/carbon/human/H = M
		if(istype(H.wear_suit, /obj/item/clothing/suit/space/rig/tycheon))
			return FALSE
		if(H.light_range_reagents < max_glow_power)
			H.light_range_reagents = min(max_glow_power, H.light_range_reagents + glow_increment)
		H.reagents_lit_on = TRUE
	return FALSE // Do not call general digestion proc.