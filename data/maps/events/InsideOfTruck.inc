InsideOfTruck_MapObjects:: @ 8391618
	object_event 1, MAP_OBJ_GFX_MOVING_BOX, 0, 0, 0, 0, 0, 8, 8, 0, 0, 0, 0, 0, 0, InsideOfTruck_EventScript_15FC8B, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_MOVING_BOX, 0, 0, 0, 3, 0, 8, 8, 0, 0, 0, 0, 0, 0, InsideOfTruck_EventScript_15FC8B, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_MOVING_BOX, 0, 2, 0, 3, 0, 8, 8, 0, 0, 0, 0, 0, 0, InsideOfTruck_EventScript_15FC8B, 0, 0, 0

InsideOfTruck_MapWarps:: @ 8391660
	warp_def 4, 1, 0, 127, NONE
	warp_def 4, 2, 0, 127, NONE
	warp_def 4, 3, 0, 127, NONE

InsideOfTruck_MapCoordEvents:: @ 8391678
	coord_event 3, 1, 3, 0, 0x4092, 0, 0, InsideOfTruck_EventScript_15FC29
	coord_event 3, 2, 3, 0, 0x4092, 0, 0, InsideOfTruck_EventScript_15FC29
	coord_event 3, 3, 3, 0, 0x4092, 0, 0, InsideOfTruck_EventScript_15FC29

InsideOfTruck_MapBGEvents:: @ 83916A8
	bg_event 1, 0, 0, 0, 0, InsideOfTruck_EventScript_15FC8B
	bg_event 3, 4, 0, 0, 0, InsideOfTruck_EventScript_15FC8B
	bg_event 2, 3, 0, 0, 0, InsideOfTruck_EventScript_15FC8B
	bg_event 0, 1, 0, 0, 0, InsideOfTruck_EventScript_15FC8B
	bg_event 0, 2, 0, 0, 0, InsideOfTruck_EventScript_15FC8B

InsideOfTruck_MapEvents:: @ 83916E4
	map_events InsideOfTruck_MapObjects, InsideOfTruck_MapWarps, InsideOfTruck_MapCoordEvents, InsideOfTruck_MapBGEvents
