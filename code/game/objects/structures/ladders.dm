/obj/structure/ladder
	name = "ladder"
	desc = "A sturdy metal ladder."
	icon = 'icons/obj/structures.dmi'
	icon_state = "ladder11"
	var/id = null
	var/height = 0							//the 'height' of the ladder. higher numbers are considered physically higher
	var/obj/structure/ladder/down = null	//the ladder below this one
	var/obj/structure/ladder/up = null		//the ladder above this one

/obj/structure/ladder/atom_init()
	ladder_list += src
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/structure/ladder/atom_init_late()
	for(var/obj/structure/ladder/L in ladder_list)
		if(L.id == id)
			if(L.height == (height - 1))
				down = L
				continue
			if(L.height == (height + 1))
				up = L
				continue

		if(up && down)	//if both our connections are filled
			break
	update_icon()

/obj/structure/ladder/Destroy()
	ladder_list -= src
	return ..()

/obj/structure/ladder/update_icon()
	if(up && down)
		icon_state = "ladder11"

	else if(up)
		icon_state = "ladder10"

	else if(down)
		icon_state = "ladder01"

	else	//wtf make your ladders properly assholes
		icon_state = "ladder00"

/obj/structure/ladder/attack_hand(mob/user)
	if(up && down)
		switch( alert("Go up or down the ladder?", "Ladder", "Up", "Down", "Cancel") )
			if("Up")
				user.visible_message("<span class='notice'>[user] climbs up \the [src]!</span>", \
									 "<span class='notice'>You climb up \the [src]!</span>")
				user.loc = get_turf(up)
				up.add_fingerprint(user)
			if("Down")
				user.visible_message("<span class='notice'>[user] climbs down \the [src]!</span>", \
									 "<span class='notice'>You climb down \the [src]!</span>")
				user.loc = get_turf(down)
				down.add_fingerprint(user)
			if("Cancel")
				return

	else if(up)
		user.visible_message("<span class='notice'>[user] climbs up \the [src]!</span>", \
							 "<span class='notice'>You climb up \the [src]!</span>")
		user.loc = get_turf(up)
		up.add_fingerprint(user)

	else if(down)
		user.visible_message("<span class='notice'>[user] climbs down \the [src]!</span>", \
							 "<span class='notice'>You climb down \the [src]!</span>")
		user.loc = get_turf(down)
		down.add_fingerprint(user)

	add_fingerprint(user)

/obj/structure/ladder/attack_paw(mob/user)
	return attack_hand(user)

/obj/structure/ladder/attackby(obj/item/weapon/W, mob/user)
	return attack_hand(user)

/obj/structure/ladder/MouseDrop_T(atom/movable/AM, mob/user)
	if(user.is_busy(src) || !atom_ladder_check(AM))
		return
	add_fingerprint(user)
	if(up && down)
		switch( alert("Move [AM] up or down the ladder?", "Ladder", "Up", "Down", "Cancel") )
			if("Up")
				user.visible_message("<span class='notice'>[user] pushes [AM] up \the [src]!</span>", \
								 	"<span class='notice'>You push [AM] up \the [src]!</span>")
				if(do_after(user, 30, target = src) && CanMouseDrop(AM, user) && atom_ladder_check(AM))
					AM.forceMove(get_turf(up))
					up.add_fingerprint(user)
			if("Down")
				user.visible_message("<span class='notice'>[user] pushes [AM] down \the [src]!</span>", \
								 	"<span class='notice'>You push [AM] down \the [src]!</span>")
				if(do_after(user, 30, target = src) && CanMouseDrop(AM, user) && atom_ladder_check(AM))
					AM.forceMove(get_turf(down))
					down.add_fingerprint(user)
			if("Cancel")
				return

	else if(up)
		user.visible_message("<span class='notice'>[user] pushes [AM] up \the [src]!</span>", \
					 "<span class='notice'>You push [AM] up \the [src]!</span>")
		if(do_after(user, 30, target = src) && CanMouseDrop(AM, user) && atom_ladder_check(AM))
			AM.forceMove(get_turf(up))
			up.add_fingerprint(user)

	else if(down)
		user.visible_message("<span class='notice'>[user] pushes [AM] down \the [src]!</span>", \
					 "<span class='notice'>You push [AM] down \the [src]!</span>")
		if(do_after(user, 30, target = src) && CanMouseDrop(AM, user) && atom_ladder_check(AM))
			AM.forceMove(get_turf(down))
			up.add_fingerprint(user)

/obj/structure/ladder/proc/atom_ladder_check(atom/movable/AM)
	if(!isturf(AM.loc) || AM.anchored)
		return FALSE
	else
	 return TRUE
