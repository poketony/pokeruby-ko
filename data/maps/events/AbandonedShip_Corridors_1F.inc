AbandonedShip_Corridors_1F_MapObjects:: @ 838E120
	object_event 1, MAP_OBJ_GFX_YOUNGSTER, 0, 17, 0, 7, 0, 3, 2, 17, 0, 0, 0, 0, 0, AbandonedShip_Corridors_1F_EventScript_15E965, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_TUBER_M, 0, 5, 0, 10, 0, 3, 45, 116, 0, 1, 0, 3, 0, AbandonedShip_Corridors_1F_EventScript_15E96E, 0, 0, 0

AbandonedShip_Corridors_1F_MapWarps:: @ 838E150
	warp_def 9, 11, 3, 2, AbandonedShip_Deck
	warp_def 8, 11, 3, 2, AbandonedShip_Deck
	warp_def 0, 11, 3, 3, AbandonedShip_Deck
	warp_def 1, 11, 3, 3, AbandonedShip_Deck
	warp_def 11, 9, 3, 0, AbandonedShip_Rooms_1F
	warp_def 14, 9, 3, 3, AbandonedShip_Rooms_1F
	warp_def 11, 3, 3, 2, AbandonedShip_Rooms_1F
	warp_def 14, 3, 3, 4, AbandonedShip_Rooms_1F
	warp_def 3, 9, 3, 0, AbandonedShip_Rooms2_1F
	warp_def 16, 2, 3, 7, AbandonedShip_Corridors_B1F
	warp_def 5, 2, 3, 6, AbandonedShip_Corridors_B1F
	warp_def 3, 3, 3, 2, AbandonedShip_Rooms2_1F

AbandonedShip_Corridors_1F_MapEvents:: @ 838E1B0
	map_events AbandonedShip_Corridors_1F_MapObjects, AbandonedShip_Corridors_1F_MapWarps, 0x0, 0x0
