Route110_SeasideCyclingRoadNorthEntrance_MapObjects:: @ 8392CAC
	object_event 1, MAP_OBJ_GFX_MART_EMPLOYEE, 0, 7, 0, 2, 0, 3, 8, 0, 0, 0, 0, 0, 0, Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634EB, 0, 0, 0

Route110_SeasideCyclingRoadNorthEntrance_MapWarps:: @ 8392CC4
	warp_def 1, 5, 0, 2, Route110
	warp_def 2, 5, 0, 2, Route110
	warp_def 12, 5, 0, 3, Route110
	warp_def 13, 5, 0, 3, Route110

Route110_SeasideCyclingRoadNorthEntrance_MapCoordEvents:: @ 8392CE4
	coord_event 7, 4, 3, 0, 0x4001, 0, 0, Route110_SeasideCyclingRoadNorthEntrance_EventScript_1634F7
	coord_event 5, 4, 3, 0, 0x4001, 1, 0, Route110_SeasideCyclingRoadNorthEntrance_EventScript_16353A

Route110_SeasideCyclingRoadNorthEntrance_MapEvents:: @ 8392D04
	map_events Route110_SeasideCyclingRoadNorthEntrance_MapObjects, Route110_SeasideCyclingRoadNorthEntrance_MapWarps, Route110_SeasideCyclingRoadNorthEntrance_MapCoordEvents, 0x0
