AbandonedShip_HiddenFloorRooms_MapObjects:: @ 838E540
	object_event 1, MAP_OBJ_GFX_ITEM_BALL, 0, 41, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_1B18CB, 1077, 0, 0
	object_event 2, MAP_OBJ_GFX_ITEM_BALL, 0, 16, 0, 10, 0, 3, 1, 0, 0, 0, 0, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_1B18D8, 1078, 0, 0
	object_event 3, MAP_OBJ_GFX_ITEM_BALL, 0, 5, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_1B18F2, 1102, 0, 0
	object_event 4, MAP_OBJ_GFX_ITEM_BALL, 0, 31, 0, 11, 0, 3, 1, 17, 0, 0, 0, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_1B18E5, 1101, 0, 0

AbandonedShip_HiddenFloorRooms_MapWarps:: @ 838E5A0
	warp_def 6, 14, 3, 0, AbandonedShip_HiddenFloorCorridors
	warp_def 7, 14, 3, 0, AbandonedShip_HiddenFloorCorridors
	warp_def 21, 14, 3, 1, AbandonedShip_HiddenFloorCorridors
	warp_def 22, 14, 3, 1, AbandonedShip_HiddenFloorCorridors
	warp_def 36, 14, 3, 2, AbandonedShip_HiddenFloorCorridors
	warp_def 37, 14, 3, 2, AbandonedShip_HiddenFloorCorridors
	warp_def 6, 1, 3, 3, AbandonedShip_HiddenFloorCorridors
	warp_def 21, 1, 3, 4, AbandonedShip_HiddenFloorCorridors
	warp_def 36, 1, 3, 5, AbandonedShip_HiddenFloorCorridors

AbandonedShip_HiddenFloorRooms_MapBGEvents:: @ 838E5E8
	bg_event 42, 10, 3, 7, 0, ITEM_ROOM_1_KEY, 31, 0
	bg_event 20, 5, 3, 7, 0, ITEM_ROOM_2_KEY, 32, 0
	bg_event 1, 12, 3, 7, 0, ITEM_ROOM_4_KEY, 33, 0
	bg_event 1, 2, 0, 7, 0, ITEM_ROOM_6_KEY, 34, 0
	bg_event 8, 5, 3, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB
	bg_event 11, 3, 3, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB
	bg_event 10, 10, 3, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB
	bg_event 16, 3, 3, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB
	bg_event 25, 2, 3, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB
	bg_event 24, 6, 3, 0, 0, AbandonedShip_HiddenFloorRooms_EventScript_15EEAB

AbandonedShip_HiddenFloorRooms_MapEvents:: @ 838E660
	map_events AbandonedShip_HiddenFloorRooms_MapObjects, AbandonedShip_HiddenFloorRooms_MapWarps, 0x0, AbandonedShip_HiddenFloorRooms_MapBGEvents
