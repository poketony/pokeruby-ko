MtPyre_3F_MapObjects:: @ 838C954
	object_event 1, MAP_OBJ_GFX_PSYCHIC_M, 0, 1, 0, 4, 0, 3, 18, 17, 0, 1, 0, 3, 0, MtPyre_3F_EventScript_15D3E9, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_LASS, 0, 12, 0, 7, 0, 3, 17, 17, 0, 1, 0, 3, 0, MtPyre_3F_EventScript_15D400, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_ITEM_BALL, 0, 0, 0, 7, 0, 3, 1, 17, 0, 0, 0, 0, 0, MtPyre_3F_EventScript_1B1940, 1120, 0, 0

MtPyre_3F_MapWarps:: @ 838C99C
	warp_def 10, 1, 3, 1, MtPyre_2F
	warp_def 2, 1, 3, 1, MtPyre_4F
	warp_def 9, 10, 3, 4, MtPyre_4F
	warp_def 1, 12, 3, 5, MtPyre_4F
	warp_def 10, 12, 3, 2, MtPyre_2F
	warp_def 6, 12, 3, 3, MtPyre_2F

MtPyre_3F_MapEvents:: @ 838C9CC
	map_events MtPyre_3F_MapObjects, MtPyre_3F_MapWarps, 0x0, 0x0
