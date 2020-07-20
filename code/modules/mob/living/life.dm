/mob/living/Life()
	set invisibility = 0
	set background = BACKGROUND_ENABLED

	if (notransform)
		return
	if(!loc)
		return

	if(stat != DEAD)
		add_ingame_age()

	if(pull_debuff && !pulling)	//For cases when pulling was stopped by 'pulling = null'
		pull_debuff = 0
	update_gravity(mob_has_gravity())

	handle_regular_hud_updates()

/mob/living/proc/handle_regular_hud_updates()
	if(!client)
		return 0

	handle_vision()
	update_action_buttons()

	return 1

/mob/living/proc/handle_vision()
	update_sight()

	if(stat != DEAD)
		if(blinded)
			throw_alert("blind")
			overlay_fullscreen("blind", /obj/screen/fullscreen/blind)
		else if(loc && !isturf(loc) && !is_type_in_list(loc, ignore_vision_inside))
			overlay_fullscreen("blind", /obj/screen/fullscreen/blind)
		else
			clear_alert("blind")
			clear_fullscreen("blind", 0)
			if(!ishuman(src))
				if(disabilities & NEARSIGHTED)
					overlay_fullscreen("impaired", /obj/screen/fullscreen/impaired, 1)
				else
					clear_fullscreen("impaired")

				if(eye_blurry)
					overlay_fullscreen("blurry", /obj/screen/fullscreen/blurry)
				else
					clear_fullscreen("blurry")

				if(druggy)
					overlay_fullscreen("high", /obj/screen/fullscreen/high)
				else
					clear_fullscreen("high")

		if(machine)
			if (!( machine.check_eye(src) ))
				reset_view(null)
		else
			if(!client.adminobs)
				reset_view(null)

/mob/living/proc/update_sight()
	return

/mob/living/update_action_buttons()
	if(!hud_used) return
	if(!client) return

	if(hud_used.hud_shown != 1)	//Hud toggled to minimal
		return

	client.screen -= hud_used.hide_actions_toggle
	for(var/datum/action/A in actions)
		if(A.button)
			client.screen -= A.button
		if(!A.target)
			actions -= A
			qdel(A)

	if(hud_used.action_buttons_hidden)
		if(!hud_used.hide_actions_toggle)
			hud_used.hide_actions_toggle = new(hud_used)
			hud_used.hide_actions_toggle.UpdateIcon()

		if(!hud_used.hide_actions_toggle.moved)
			hud_used.hide_actions_toggle.screen_loc = hud_used.ButtonNumberToScreenCoords(1)
			//hud_used.SetButtonCoords(hud_used.hide_actions_toggle,1)

		client.screen += hud_used.hide_actions_toggle
		return

	var/button_number = 0
	for(var/datum/action/A in actions)
		button_number++
		if(A.button == null)
			var/obj/screen/movable/action_button/N = new(hud_used)
			N.owner = A
			A.button = N

		var/obj/screen/movable/action_button/B = A.button

		B.UpdateIcon()

		B.name = A.UpdateName()

		client.screen += B

		if(!B.moved)
			B.screen_loc = hud_used.ButtonNumberToScreenCoords(button_number)
			//hud_used.SetButtonCoords(B,button_number)

	if(button_number > 0)
		if(!hud_used.hide_actions_toggle)
			hud_used.hide_actions_toggle = new(hud_used)
			hud_used.hide_actions_toggle.InitialiseIcon(src)
		if(!hud_used.hide_actions_toggle.moved)
			hud_used.hide_actions_toggle.screen_loc = hud_used.ButtonNumberToScreenCoords(button_number+1)
			//hud_used.SetButtonCoords(hud_used.hide_actions_toggle,button_number+1)
		client.screen += hud_used.hide_actions_toggle

/mob/living/carbon/human/handle_random_events()
	// Puke if toxloss is too high
	var/vomit_score = 0
	for(var/tag in list(O_LIVER,O_KIDNEYS))
		var/obj/item/organ/internal/I = internal_organs_by_name[tag]
		if(I)
			vomit_score += I.damage
		else if (should_have_organ(tag))
			vomit_score += 45
	if(chem_effects[CE_TOXIN] || radiation)
		vomit_score += 0.5 * getToxLoss()
	if(chem_effects[CE_ALCOHOL_TOXIC])
		vomit_score += 10 * chem_effects[CE_ALCOHOL_TOXIC]
	if(chem_effects[CE_ALCOHOL])
		vomit_score += 10
	if(stat != DEAD && vomit_score > 25 && prob(10))
		spawn vomit(1, vomit_score, vomit_score/25)

/*
	//0.1% chance of playing a scary sound to someone who's in complete darkness
	if(isturf(loc) && rand(1,1000) == 1)
		var/turf/T = loc
		if(T.get_lumcount() <= LIGHTING_SOFT_THRESHOLD)
			playsound_local(src,pick(GLOB.scarySounds),50, 1, -1)
*/

	var/area/A = get_area(src)
	if(client && world.time >= client.played + 600)
		A.play_ambience(src)
	if(stat == UNCONSCIOUS && world.time - l_move_time < 5 && prob(10))
		to_chat(src,"<span class='notice'>You feel like you're [pick("moving","flying","floating","falling","hovering")].</span>")