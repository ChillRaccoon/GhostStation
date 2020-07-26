/mob/living/carbon/
	gender = MALE
	var/datum/happiness_event/list/events = list()
	var/list/stomach_contents = list()
	var/brain_op_stage = 0.0
	var/chest_brain_op_stage = 0
	var/list/datum/disease2/disease/virus2 = list()
	var/antibodies = 0
	var/last_eating = 0 	//Not sure what this does... I found it hidden in food.dm

	var/life_tick = 0      // The amount of life ticks that have processed on this mob.
	var/analgesic = 0 // when this is set, the mob isn't affected by shock or pain
					  // life should decrease this by 1 every tick
	// total amount of wounds on mob, used to spread out healing and the like over all wounds
	var/number_wounds = 0
	var/obj/item/handcuffed = null //Whether or not the mob is handcuffed
	var/obj/item/legcuffed = null  //Same as handcuffs but for legs. Bear traps use this.
	//Surgery info
	var/datum/surgery_status/op_stage = new/datum/surgery_status
	//Active emote/pose

	var/pulse = PULSE_NORM	//current pulse level

	var/oxygen_alert = 0
	var/phoron_alert = 0
	var/fire_alert = 0
	var/pressure_alert = 0
	var/temperature_alert = 0
	var/co2overloadtime = null
	var/temperature_resistance = T0C+75

	var/metabolism_factor = METABOLISM_FACTOR
	var/pose = null
	var/list/chem_effects = list()
	var/list/chem_doses = list()
	var/datum/reagents/metabolism/bloodstr = null
	var/datum/reagents/metabolism/ingested = null
	var/datum/reagents/metabolism/touching = null

	var/coughedtime = null

	var/cpr_time = 1.0
	var/lastpuke = 0

	var/obj/item/weapon/tank/internal = null//Human/Monke

	var/obj/item/head
	var/obj/item/shoes
	var/obj/item/neck
	var/obj/item/mouth

	var/stamina = 100 //Ian uses this for now.

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

	var/player_triggered_sleeping = 0
