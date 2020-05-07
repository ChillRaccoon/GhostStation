/obj/machinery/atmospherics/components/binary
	dir = SOUTH
	initialize_directions = SOUTH|NORTH
	use_power = 1

	device_type = BINARY
	layer = GAS_PUMP_LAYER

/obj/machinery/atmospherics/components/binary/SetInitDirections()
	switch(dir)
		if(NORTH, SOUTH)
			initialize_directions = NORTH|SOUTH
		if(EAST, WEST)
			initialize_directions = EAST|WEST

/*
Housekeeping and pipe network stuff
*/

/obj/machinery/atmospherics/components/binary/getNodeConnects()
	return list(turn(dir, 180), dir)
