
/datum/game_mode
	var/list/datum/mind/wizards = list()

/datum/game_mode/wizard
	name = "wizard"
	config_tag = "wizard"
	role_type = ROLE_WIZARD
	required_players = 2
	required_players_secret = 10
	required_enemies = 1
	recommended_enemies = 1

	votable = 0

	uplink_welcome = "Wizardly Uplink Console:"
	uplink_uses = 20

	var/finished = 0

/datum/game_mode/wizard/announce()
	to_chat(world, "<B>The current game mode is - Wizard!</B>")
	to_chat(world, "<B>There is a \red SPACE WIZARD\black on the station. You can't let him achieve his objective!</B>")


/datum/game_mode/wizard/can_start()//This could be better, will likely have to recode it later
	if(!..())
		return 0
	var/datum/mind/wizard = pick(antag_candidates)
	wizards += wizard
	modePlayer += wizard
	wizard.assigned_role = "MODE" //So they aren't chosen for other jobs.
	wizard.special_role = "Wizard"
	wizard.original = wizard.current
	if(wizardstart.len == 0)
		to_chat(wizard.current, "<span class='danger'>A starting location for you could not be found, please report this bug!</span>")
		return 0
	return 1


/datum/game_mode/wizard/pre_setup()
	for(var/datum/mind/wizard in wizards)
		wizard.current.loc = pick(wizardstart)
	return 1


/datum/game_mode/wizard/post_setup()
	for(var/datum/mind/wizard in wizards)
		if(!config.objectives_disabled)
			forge_wizard_objectives(wizard)
		//learn_basic_spells(wizard.current)
		equip_wizard(wizard.current)
		name_wizard(wizard.current)
		greet_wizard(wizard)

	return ..()


/datum/game_mode/proc/forge_wizard_objectives(datum/mind/wizard)
	if (config.objectives_disabled)
		return

	switch(rand(1,100))
		if(1 to 30)

			var/datum/objective/assassinate/kill_objective = new
			kill_objective.owner = wizard
			kill_objective.find_target()
			wizard.objectives += kill_objective

			if (!(locate(/datum/objective/escape) in wizard.objectives))
				var/datum/objective/escape/escape_objective = new
				escape_objective.owner = wizard
				wizard.objectives += escape_objective
		if(31 to 60)
			var/datum/objective/steal/steal_objective = new
			steal_objective.owner = wizard
			steal_objective.find_target()
			wizard.objectives += steal_objective

			if (!(locate(/datum/objective/escape) in wizard.objectives))
				var/datum/objective/escape/escape_objective = new
				escape_objective.owner = wizard
				wizard.objectives += escape_objective

		if(61 to 100)
			var/datum/objective/assassinate/kill_objective = new
			kill_objective.owner = wizard
			kill_objective.find_target()
			wizard.objectives += kill_objective

			var/datum/objective/steal/steal_objective = new
			steal_objective.owner = wizard
			steal_objective.find_target()
			wizard.objectives += steal_objective

			if (!(locate(/datum/objective/survive) in wizard.objectives))
				var/datum/objective/survive/survive_objective = new
				survive_objective.owner = wizard
				wizard.objectives += survive_objective

		else
			if (!(locate(/datum/objective/hijack) in wizard.objectives))
				var/datum/objective/hijack/hijack_objective = new
				hijack_objective.owner = wizard
				wizard.objectives += hijack_objective
	return


/datum/game_mode/proc/name_wizard(mob/living/carbon/human/wizard_mob)
	//Allows the wizard to choose a custom name or go with a random one. Spawn 0 so it does not lag the round starting.
	var/wizard_name_first = pick(wizard_first)
	var/wizard_name_second = pick(wizard_second)
	var/randomname = "[wizard_name_first] [wizard_name_second]"
	spawn(0)
		var/newname = sanitize_safe(input(wizard_mob, "You are the Space Wizard. Would you like to change your name to something else?", "Name change", randomname) as null|text, MAX_NAME_LEN)

		if (!newname)
			newname = randomname

		wizard_mob.real_name = newname
		wizard_mob.name = newname
		if(wizard_mob.mind)
			wizard_mob.mind.name = newname
	return


/datum/game_mode/proc/greet_wizard(datum/mind/wizard, you_are=1)
	if (you_are)
		to_chat(wizard.current, "<span class='danger'>You are the Space Wizard!</span>")
	to_chat(wizard.current, "<B>The Space Wizards Federation has given you the following tasks:</B>")
	if(!config.objectives_disabled)
		var/obj_count = 1
		for(var/datum/objective/objective in wizard.objectives)
			to_chat(wizard.current, "<B>Objective #[obj_count]</B>: [objective.explanation_text]")
			obj_count++
	else
		to_chat(wizard.current, "<span class='info'>Within the rules,</span> try to act as an opposing force to the crew. Further RP and try to make sure other players have </i>fun<i>! If you are confused or at a loss, always adminhelp, and before taking extreme actions, please try to also contact the administration! Think through your actions and make the roleplay immersive! <b>Please remember all rules aside from those without explicit exceptions apply to antagonists.</i></b>")
	return


/*/datum/game_mode/proc/learn_basic_spells(mob/living/carbon/human/wizard_mob)
	if (!istype(wizard_mob))
		return
	if(!config.feature_object_spell_system)
		wizard_mob.verbs += /client/proc/jaunt
		wizard_mob.mind.special_verbs += /client/proc/jaunt
	else
		wizard_mob.spell_list += new /obj/effect/proc_holder/spell/targeted/ethereal_jaunt(usr)
*/

/datum/game_mode/proc/equip_wizard(mob/living/carbon/human/wizard_mob)
	if (!istype(wizard_mob))
		return

	//So zards properly get their items when they are admin-made.
	qdel(wizard_mob.wear_suit)
	qdel(wizard_mob.head)
	qdel(wizard_mob.shoes)
	qdel(wizard_mob.r_hand)
	qdel(wizard_mob.r_store)
	qdel(wizard_mob.l_store)

	wizard_mob.equip_to_slot_or_del(new /obj/item/device/radio/headset(wizard_mob), slot_l_ear)
	wizard_mob.equip_to_slot_or_del(new /obj/item/clothing/under/lightpurple(wizard_mob), slot_w_uniform)
	wizard_mob.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(wizard_mob), slot_shoes)
	wizard_mob.equip_to_slot_or_del(new /obj/item/clothing/suit/wizrobe(wizard_mob), slot_wear_suit)
	wizard_mob.equip_to_slot_or_del(new /obj/item/clothing/head/wizard(wizard_mob), slot_head)
	if(wizard_mob.backbag == 2) wizard_mob.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(wizard_mob), slot_back)
	if(wizard_mob.backbag == 3) wizard_mob.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/norm(wizard_mob), slot_back)
	if(wizard_mob.backbag == 4) wizard_mob.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(wizard_mob), slot_back)
	wizard_mob.equip_to_slot_or_del(new /obj/item/weapon/storage/box(wizard_mob), slot_in_backpack)
//	wizard_mob.equip_to_slot_or_del(new /obj/item/weapon/scrying_gem(wizard_mob), slot_l_store) For scrying gem.
	wizard_mob.equip_to_slot_or_del(new /obj/item/weapon/teleportation_scroll(wizard_mob), slot_r_store)
	wizard_mob.equip_to_slot_or_del(new /obj/item/weapon/spellbook(wizard_mob), slot_r_hand)

	to_chat(wizard_mob, "<span class='info'>You will find a list of available spells in your spell book. Choose your magic arsenal carefully.</span>")
	to_chat(wizard_mob, "<span class='info'>In your pockets you will find a teleport scroll. Use it as needed.</span>")
	wizard_mob.mind.store_memory("<B>Remember:</B> do not forget to prepare your spells.")
	wizard_mob.update_icons()
	return 1


/datum/game_mode/wizard/check_finished()

	if(config.continous_rounds)
		return ..()

	var/wizards_alive = 0
	for(var/datum/mind/wizard in wizards)
		if(!istype(wizard.current,/mob/living/carbon))
			continue
		if(wizard.current.stat==2)
			continue
		wizards_alive++

	if (wizards_alive)
		return ..()
	else
		finished = 1
		return 1



/datum/game_mode/wizard/declare_completion()
	var/prefinal_text = ""
	var/final_text = ""
	completion_text += "<B>Wizard mode resume:</B><BR>"

	for(var/datum/mind/wizard in wizards)
		if(wizard.current.stat == DEAD || finished)
			feedback_set_details("round_end_result","loss - wizard killed")
			prefinal_text = "<FONT size = 3>Wizard <b>[wizard.name]</b><i> ([wizard.key])</I> has been <font color='red'><b>killed</b></font by the crew! The Space Wizards Federation has been taught a lesson they will not soon forget!</FONT><BR>"
		else
			var/failed = 0
			for(var/datum/objective/objective in wizard.objectives)
				if(!objective.check_completion())
					failed = 1
			if(!failed)
				feedback_set_details("round_end_result","win - wizard alive")
				prefinal_text = "<FONT size = 3>Wizard <b>[wizard.name]</b><i> ([wizard.key])</i> managed to <font color='green'><B>complete</B></font> his mission! The Space Wizards Federation understood that station crew - easy target and will use them next time.</FONT><BR>"
			else
				feedback_set_details("round_end_result","loss - wizard alive")
				prefinal_text = "<FONT size = 3>Wizard <b>[wizard.name]</b><i> ([wizard.key])</i> managed to stay alive, but <font color='red'><B>failed</B></font> his mission! The Space Wizards Federation wouldn't forget this shame!</FONT><BR>"
		final_text += "[prefinal_text]"

	completion_text += "[final_text]"
	..()
	return 1


/datum/game_mode/proc/auto_declare_completion_wizard()
	var/text = ""
	if(wizards.len)
		text += printlogo("wizard", "wizards/witches")

		for(var/datum/mind/wizard in wizards)
			text += printplayerwithicon(wizard)

			var/count = 1
			var/wizardwin = 1
			if(!config.objectives_disabled)
				for(var/datum/objective/objective in wizard.objectives)
					if(objective.check_completion())
						text += "<BR><B>Objective #[count]</B>: [objective.explanation_text] <font color='green'><B>Success!</B></font>"
						feedback_add_details("wizard_objective","[objective.type]|SUCCESS")
					else
						text += "<BR><B>Objective #[count]</B>: [objective.explanation_text] <font color='red'>Fail.</font>"
						feedback_add_details("wizard_objective","[objective.type]|FAIL")
						wizardwin = 0
					count++

				if(wizard.current && wizard.current.stat!=2 && wizardwin)
					text += "<BR><FONT color='green'><B>The wizard was successful!</B></FONT>"
					feedback_add_details("wizard_success","SUCCESS")
					score["roleswon"]++
				else
					text += "<BR><FONT color='red'><B>The wizard has failed!</B></FONT>"
					feedback_add_details("wizard_success","FAIL")
				if(wizard.current && wizard.current.spell_list)
					text += "<BR><B>[wizard.name] used the following spells: </B>"
					var/i = 1
					for(var/obj/effect/proc_holder/spell/S in wizard.current.spell_list)
						var/icon/spellicon = icon('icons/mob/actions.dmi', S.action_icon_state)
						end_icons += spellicon
						var/tempstate = end_icons.len
						text += {"<BR><img src="logo_[tempstate].png"> [S.name]"}
						if(wizard.current.spell_list.len > i)
							text += ", "
						i++
				text += "<BR>"
		text += "<HR>"
	return text

//OTHER PROCS

//To batch-remove wizard spells. Linked to mind.dm.
/mob/proc/spellremove(mob/M)
	for(var/obj/effect/proc_holder/spell/spell_to_remove in src.spell_list)
		qdel(spell_to_remove)
	spell_list.Cut()
	mind.spell_list.Cut()

/*Checks if the wizard can cast spells.
Made a proc so this is not repeated 14 (or more) times.*/
/mob/proc/casting()
//Removed the stat check because not all spells require clothing now.
	if(!istype(usr:wear_suit, /obj/item/clothing/suit/wizrobe))
		to_chat(usr, "I don't feel strong enough without my robe.")
		return 0
	if(!istype(usr:shoes, /obj/item/clothing/shoes/sandal))
		to_chat(usr, "I don't feel strong enough without my sandals.")
		return 0
	if(!istype(usr:head, /obj/item/clothing/head/wizard))
		to_chat(usr, "I don't feel strong enough without my hat.")
		return 0
	else
		return 1
