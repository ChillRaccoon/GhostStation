/mob/living/carbon/
	gender = MALE
	var/datum/happiness_event/list/events = list()

	//Active emote/pose
	var/pose = null
	var/list/chem_effects = list()
	var/list/chem_doses = list()
	var/datum/reagents/metabolism/bloodstr = null
	var/datum/reagents/metabolism/ingested = null
	var/datum/reagents/metabolism/touching = null

	var/coughedtime = null

	var/cpr_time = 1.0
	var/lastpuke = 0

	var/obj/item/weapon/tank/internal = null//Human/Monkey


	//these two help govern taste. The first is the last time a taste message was shown to the plaer.
	//the second is the message in question.
	var/last_taste_time = 0
	var/last_taste_text = ""

	//For sad, thirsty, and dirty lads.
	var/happiness = 0
	var/thirst = THIRST_LEVEL_FILLED
	var/hygiene = HYGIENE_LEVEL_NORMAL
	var/my_hygiene_factor = HYGIENE_FACTOR
	// organ-related variables, see organ.dm and human_organs.dm
	var/list/internal_organs = list()

	var/list/stasis_sources = list()
	var/stasis_value
	var/social_class = null
