Route112_CableCarStation_MapObjects:: @ 838B7D4
	object_event 1, MAP_OBJ_GFX_BEAUTY, 0, 6, 0, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route112_CableCarStation_EventScript_15C08C, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_CABLE_CAR, 0, 6, 0, 3, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0x0, 0, 0, 0

Route112_CableCarStation_MapWarps:: @ 838B804
	warp_def 6, 11, 0, 0, Route112
	warp_def 7, 11, 0, 1, Route112

Route112_CableCarStation_MapEvents:: @ 838B814
	map_events Route112_CableCarStation_MapObjects, Route112_CableCarStation_MapWarps, 0x0, 0x0
