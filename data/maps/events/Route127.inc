Route127_MapObjects:: @ 8384FA8
	object_event 1, MAP_OBJ_GFX_SWIMMER_M, 0, 18, 0, 68, 0, 1, 14, 0, 0, 1, 0, 2, 0, Route127_EventScript_15207A, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SWIMMER_F, 0, 45, 0, 44, 0, 1, 21, 0, 0, 1, 0, 4, 0, Route127_EventScript_152091, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_ITEM_BALL, 0, 10, 0, 7, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route127_EventScript_1B16C3, 1034, 0, 0
	object_event 4, MAP_OBJ_GFX_ITEM_BALL, 0, 64, 0, 39, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route127_EventScript_1B16D0, 1035, 0, 0
	object_event 5, MAP_OBJ_GFX_FISHERMAN, 0, 53, 0, 13, 0, 3, 7, 17, 0, 1, 0, 0, 0, Route127_EventScript_1520A8, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_FISHERMAN, 0, 52, 0, 25, 0, 3, 8, 17, 0, 1, 0, 0, 0, Route127_EventScript_1520D6, 0, 0, 0
	object_event 7, MAP_OBJ_GFX_FISHERMAN, 0, 64, 0, 19, 0, 3, 10, 17, 0, 1, 0, 0, 0, Route127_EventScript_1520BF, 0, 0, 0
	object_event 8, MAP_OBJ_GFX_MAN_6, 0, 12, 0, 18, 0, 3, 24, 17, 0, 1, 0, 2, 0, Route127_EventScript_152104, 0, 0, 0
	object_event 9, MAP_OBJ_GFX_BLACK_BELT, 0, 63, 0, 63, 0, 3, 1, 17, 0, 1, 0, 3, 0, Route127_EventScript_1520ED, 0, 0, 0

Route127_MapBGEvents:: @ 8385080
	bg_event 59, 67, 0, 8, 0, ITEM_ENERGY_ROOT, 0, 0
	bg_event 59, 72, 0, 8, 0, ITEM_SITRUS_BERRY, 0, 0
	bg_event 67, 63, 0, 8, 0, ITEM_WEPEAR_BERRY, 0, 0
	bg_event 61, 21, 0, 8, 0, ITEM_FIGY_BERRY, 0, 0
	bg_event 45, 24, 0, 8, 0, ITEM_GLITTER_MAIL, 0, 0

Route127_MapEvents:: @ 83850BC
	map_events Route127_MapObjects, 0x0, 0x0, Route127_MapBGEvents
