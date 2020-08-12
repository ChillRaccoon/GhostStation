/*
 LIFE WEB package | For turfs/items from LFWB. Ave RS.
 GHOST STATION COMM.
>>>>>ORBITAL STATION<<<<<} C-WALLS
*/

/lfwb/ancient/os13
	name = 'Обшивка'
	desc = 'Здоровенный кусок сплавов, пробить такой руками явно не выйдет..'
	icon = 'icons/GhostStation/LIFE/wR.dmi'

	var/mineral = "metal"
	var/rotting = 0

	var/damage = 0
	var/damage_cap = 100 //Wall will break down to girders if damage reaches this point

	var/damage_overlay
	var/global/damage_overlays[8]

	var/max_temperature = 2200 //K, walls will take damage if they're next to a fire hotter than this

	opacity = 1
	density = 1
	blocks_air = 1

	thermal_conductivity = WALL_HEAT_TRANSFER_COEFFICIENT
	heat_capacity = 425500