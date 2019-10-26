MossdeepCity_Gym_MapObjects:: @ 838A660
	object_event 1, MAP_OBJ_GFX_TATE, 0, 8, 0, 3, 0, 3, 8, 0, 0, 0, 0, 0, 0, MossdeepCity_Gym_EventScript_15A56B, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_PSYCHIC_M, 0, 2, 0, 24, 0, 3, 7, 0, 0, 1, 0, 1, 0, MossdeepCity_Gym_EventScript_15A74E, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_PSYCHIC_M, 0, 17, 0, 18, 0, 3, 7, 0, 0, 1, 0, 1, 0, MossdeepCity_Gym_EventScript_15A77C, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_LASS, 0, 9, 0, 17, 0, 3, 9, 0, 0, 1, 0, 1, 0, MossdeepCity_Gym_EventScript_15A7C1, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_LASS, 0, 11, 0, 10, 0, 3, 8, 0, 0, 1, 0, 1, 0, MossdeepCity_Gym_EventScript_15A7AA, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_PSYCHIC_M, 0, 0, 0, 7, 0, 3, 10, 0, 0, 1, 0, 1, 0, MossdeepCity_Gym_EventScript_15A765, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_LASS, 0, 4, 0, 3, 0, 3, 8, 0, 0, 1, 0, 2, 0, MossdeepCity_Gym_EventScript_15A793, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_MAN_2, 0, 8, 0, 29, 0, 3, 10, 0, 0, 0, 0, 0, 0, MossdeepCity_Gym_EventScript_15A7D8, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_LIZA, 0, 9, 0, 3, 0, 3, 8, 0, 0, 0, 0, 0, 0, MossdeepCity_Gym_EventScript_15A56B, 0, 0, 0

MossdeepCity_Gym_MapWarps:: @ 838A738
	warp_def 9, 29, 0, 1, MossdeepCity
	warp_def 10, 29, 0, 1, MossdeepCity

MossdeepCity_Gym_MapCoordEvents:: @ 838A748
	coord_event 12, 3, 3, 0, 0x4001, 0, 0, MossdeepCity_Gym_EventScript_15A742

MossdeepCity_Gym_MapBGEvents:: @ 838A758
	bg_event 2, 7, 0, 0, 0, MossdeepCity_Gym_EventScript_15A5EA
	bg_event 8, 10, 0, 0, 0, MossdeepCity_Gym_EventScript_15A646
	bg_event 17, 15, 0, 0, 0, MossdeepCity_Gym_EventScript_15A69A
	bg_event 5, 24, 0, 0, 0, MossdeepCity_Gym_EventScript_15A6EE
	bg_event 7, 27, 0, 1, 0, MossdeepCity_Gym_EventScript_15A7FA
	bg_event 11, 27, 0, 1, 0, MossdeepCity_Gym_EventScript_15A80A

MossdeepCity_Gym_MapEvents:: @ 838A7A0
	map_events MossdeepCity_Gym_MapObjects, MossdeepCity_Gym_MapWarps, MossdeepCity_Gym_MapCoordEvents, MossdeepCity_Gym_MapBGEvents
