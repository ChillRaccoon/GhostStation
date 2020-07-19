//Sound environment defines. Reverb preset for sounds played in an area, see sound datum reference for more.
#define GENERIC 0
#define PADDED_CELL 1
#define ROOM 2
#define BATHROOM 3
#define LIVINGROOM 4
#define STONEROOM 5
#define AUDITORIUM 6
#define CONCERT_HALL 7
#define CAVE 8
#define ARENA 9
#define HANGAR 10
#define CARPETED_HALLWAY 11
#define HALLWAY 12
#define STONE_CORRIDOR 13
#define ALLEY 14
#define FOREST 15
#define CITY 16
#define MOUNTAINS 17
#define QUARRY 18
#define PLAIN 19
#define PARKING_LOT 20
#define SEWER_PIPE 21
#define UNDERWATER 22
#define DRUGGED 23
#define DIZZY 24
#define PSYCHOTIC 25

#define STANDARD_STATION STONEROOM
#define LARGE_ENCLOSED HANGAR
#define SMALL_ENCLOSED BATHROOM
#define TUNNEL_ENCLOSED CAVE
#define LARGE_SOFTFLOOR CARPETED_HALLWAY
#define MEDIUM_SOFTFLOOR LIVINGROOM
#define SMALL_SOFTFLOOR ROOM
#define ASTEROID CAVE
#define SPACE UNDERWATER

var/list/shatter_sound = list('sound/effects/Glassbr1.ogg','sound/effects/Glassbr2.ogg','sound/effects/Glassbr3.ogg')
var/list/spark_sound = list('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg','sound/effects/sparks4.ogg')
var/list/rustle_sound = list('sound/effects/rustle1.ogg','sound/effects/rustle2.ogg','sound/effects/rustle3.ogg','sound/effects/rustle4.ogg','sound/effects/rustle5.ogg')
var/list/punch_sound = list('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg')
var/list/clown_sound = list('sound/effects/clownstep1.ogg','sound/effects/clownstep2.ogg')
var/list/swing_hit_sound = list('sound/weapons/genhit1.ogg', 'sound/weapons/genhit2.ogg', 'sound/weapons/genhit3.ogg')
var/list/hiss_sound = list('sound/voice/hiss1.ogg','sound/voice/hiss2.ogg','sound/voice/hiss3.ogg','sound/voice/hiss4.ogg')
var/list/page_sound = list('sound/effects/pageturn1.ogg', 'sound/effects/pageturn2.ogg','sound/effects/pageturn3.ogg')
var/list/fracture_sound = list('sound/effects/bonebreak1.ogg','sound/effects/bonebreak2.ogg','sound/effects/bonebreak3.ogg','sound/effects/bonebreak4.ogg')
var/list/lighter_sound = list('sound/items/lighter1.ogg','sound/items/lighter2.ogg','sound/items/lighter3.ogg')
var/list/keypress_sound = list('sound/machines/keyboard/keypress1.ogg','sound/machines/keyboard/keypress2.ogg','sound/machines/keyboard/keypress3.ogg','sound/machines/keyboard/keypress4.ogg')
var/list/keystroke_sound = list('sound/machines/keyboard/keystroke1.ogg','sound/machines/keyboard/keystroke2.ogg','sound/machines/keyboard/keystroke3.ogg','sound/machines/keyboard/keystroke4.ogg')
var/list/switch_sound = list('sound/machines/switch1.ogg','sound/machines/switch2.ogg','sound/machines/switch3.ogg','sound/machines/switch4.ogg')
var/list/button_sound = list('sound/machines/button1.ogg','sound/machines/button2.ogg','sound/machines/button3.ogg','sound/machines/button4.ogg')
var/list/flop_sound = list('sound/effects/bodyfall1.ogg','sound/effects/bodyfall2.ogg','sound/effects/bodyfall3.ogg','sound/effects/bodyfall4.ogg')
var/list/trauma_sound = list('sound/effects/gore/trauma1.ogg', 'sound/effects/gore/trauma2.ogg', 'sound/effects/gore/trauma3.ogg')
var/list/casing_sound = list('sound/weapons/guns/misc/casingfall1.ogg','sound/weapons/guns/misc/casingfall2.ogg','sound/weapons/guns/misc/casingfall3.ogg')
var/list/terminal_type = list('sound/machines/keypress1.ogg', 'sound/machines/keypress2.ogg', 'sound/machines/keypress3.ogg', 'sound/machines/keypress4.ogg')
var/list/keyboard_sound = list('sound/machines/terminal_button01.ogg', 'sound/machines/terminal_button02.ogg', 'sound/machines/terminal_button03.ogg',
							  'sound/machines/terminal_button04.ogg', 'sound/machines/terminal_button05.ogg', 'sound/machines/terminal_button06.ogg',
							  'sound/machines/terminal_button07.ogg', 'sound/machines/terminal_button08.ogg')
var/list/gun_sound = list('sound/weapons/gunshot.ogg', 'sound/weapons/gunshot2.ogg', 'sound/weapons/gunshot3.ogg', 'sound/weapons/gunshot4.ogg')
var/list/brifle = list('sound/weapons/newrifle.ogg', 'sound/weapons/newrifle2.ogg', 'sound/weapons/newrifle3.ogg')
var/list/bullet_hit_wall = list('sound/weapons/guns/misc/ric1.ogg', 'sound/weapons/guns/misc/ric2.ogg', 'sound/weapons/guns/misc/ric3.ogg', 'sound/weapons/guns/misc/ric4.ogg', 'sound/weapons/guns/misc/ric5.ogg')
var/list/stab_sound = list('sound/weapons/stab1.ogg', 'sound/weapons/stab2.ogg', 'sound/weapons/stab3.ogg')
var/list/slash_sound = list('sound/weapons/slash1.ogg','sound/weapons/slash2.ogg','sound/weapons/slash3.ogg')
var/list/blunt_swing = list('sound/weapons/blunt_swing1.ogg','sound/weapons/blunt_swing2.ogg','sound/weapons/blunt_swing3.ogg')
var/list/swing_sound = list('sound/weapons/swing_01.ogg', 'sound/weapons/swing_02.ogg', 'sound/weapons/swing_03.ogg')
var/list/chop_sound = list('sound/weapons/chop1.ogg','sound/weapons/chop2.ogg','sound/weapons/chop3.ogg')

var/list/explosion_sound = list('sound/effects/Explosion1.ogg','sound/effects/Explosion2.ogg')

//var/list/gun_sound = list('sound/weapons/Gunshot.ogg', 'sound/weapons/Gunshot2.ogg','sound/weapons/Gunshot3.ogg','sound/weapons/Gunshot4.ogg')
//var/list/footsteps_sound = list('sound/effects/footsteps.ogg','sound/effects/footsteps2.ogg')

/proc/playsound(atom/source, soundin, vol, vary, extrarange, falloff, channel = 0, is_global)

	soundin = get_sfx(soundin) // same sound for everyone

	if(isarea(source))
		error("[source] is an area and is trying to make the sound: [soundin]")
		return

	var/frequency = get_rand_frequency() // Same frequency for everybody
	var/turf/turf_source = get_turf(source)

 	// Looping through the player list has the added bonus of working for mobs inside containers
	for (var/P in player_list)
		var/mob/M = P
		if(!M || !M.client)
			continue

		var/distance = get_dist(M, turf_source)
		if(distance <= (world.view + extrarange) * 3)
			var/turf/T = get_turf(M)

			if(T && T.z == turf_source.z)
				M.playsound_local(turf_source, soundin, vol, vary, frequency, falloff, is_global)

var/const/FALLOFF_SOUNDS = 0.5

/mob/proc/playsound_local(turf/turf_source, soundin, vol, vary, frequency, falloff, channel = 0, is_global)
	if(!src.client || ear_deaf > 0)
		return FALSE
	soundin = get_sfx(soundin)

	var/sound/S = sound(soundin)
	S.wait = 0 //No queue
	//S.channel = 0 //Any channel
	S.channel = channel
	S.volume = vol
	S.environment = -1
	if (vary)
		if(frequency)
			S.frequency = frequency
		else
			S.frequency = get_rand_frequency()

	if(isturf(turf_source))
		// 3D sounds, the technology is here!
		var/turf/T = get_turf(src)

		//sound volume falloff with distance
		var/distance = get_dist(T, turf_source)

		S.volume -= max(distance - world.view, 0) * 2 //multiplicative falloff to add on top of natural audio falloff.

		//sound volume falloff with pressure
		var/pressure_factor = 1.0

		var/datum/gas_mixture/hearer_env = T.return_air()
		var/datum/gas_mixture/source_env = turf_source.return_air()

		if (hearer_env && source_env)
			var/pressure = min(hearer_env.return_pressure(), source_env.return_pressure())

			if (pressure < ONE_ATMOSPHERE)
				pressure_factor = max((pressure - SOUND_MINIMUM_PRESSURE)/(ONE_ATMOSPHERE - SOUND_MINIMUM_PRESSURE), 0)
		else //in space
			pressure_factor = 0

		if (distance <= 1)
			pressure_factor = max(pressure_factor, 0.15)	//hearing through contact

		S.volume *= pressure_factor

		if (S.volume <= 0)
			return FALSE	//no volume means no sound

		var/dx = turf_source.x - T.x // Hearing from the right/left
		S.x = dx
		var/dz = turf_source.y - T.y // Hearing from infront/behind
		S.z = dz
		// The y value is for above your head, but there is no ceiling in 2d spessmens.
		S.y = 1
		S.falloff = (falloff ? falloff : FALLOFF_SOUNDS)
	if(!is_global)
		S.environment = 2
	src << S

	for(var/mob/M in remote_hearers)
		var/dist = get_dist(src, M)
		if(dist > MAX_TELEPATHY_RANGE)
			S.volume = max(S.volume - (dist - MAX_TELEPATHY_RANGE) * 2, 0)
		if(M.remote_hearing.len > 3)
			S.volume = max(S.volume - (M.remote_hearing.len * 2), 0)
		if(S.volume <= 0)
			continue // No volume - no sound.
 		M << S

/mob/living/parasite/playsound_local(turf/turf_source, soundin, vol, vary, frequency, falloff, channel = 0, is_global)
	if(!host || host.ear_deaf > 0)
		return FALSE
	return ..()


/client/proc/playtitlemusic()
	if(!ticker || !ticker.login_music)	return
	if(prefs.toggles & SOUND_LOBBY)
		src << sound(ticker.login_music, repeat = 0, wait = 0, volume = 85, channel = 1) // MAD JAMS

/proc/get_rand_frequency()
	return rand(32000, 55000) //Frequency stuff only works with 45kbps oggs.

/proc/get_sfx(soundin)
	if(istext(soundin))
		switch(soundin)
			if ("shatter") soundin = pick(shatter_sound)
			if ("explosion") soundin = pick(explosion_sound)
			if ("sparks") soundin = pick(spark_sound)
			if ("rustle") soundin = pick(rustle_sound)
			if ("bodyfall") soundin = pick('sound/effects/bodyfall1.ogg','sound/effects/bodyfall2.ogg','sound/effects/bodyfall3.ogg','sound/effects/bodyfall4.ogg')
			if ("punch") soundin = pick(punch_sound)
			if ("clownstep") soundin = pick(clown_sound)
			if ("swing_hit") soundin = pick(swing_hit_sound)
			if ("hiss") soundin = pick(hiss_sound)
			if ("pageturn") soundin = pick(page_sound)
			if ("fracture") soundin = pick(fracture_sound)
			//if ("gunshot") soundin = pick(gun_sound)
	return soundin
