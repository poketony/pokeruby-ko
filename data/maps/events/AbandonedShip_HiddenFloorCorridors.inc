AbandonedShip_HiddenFloorCorridors_MapWarps:: @ 838E4CC
	warp_def 3, 8, 3, 0, AbandonedShip_HiddenFloorRooms
	warp_def 6, 8, 3, 2, AbandonedShip_HiddenFloorRooms
	warp_def 9, 8, 3, 4, AbandonedShip_HiddenFloorRooms
	warp_def 3, 3, 3, 6, AbandonedShip_HiddenFloorRooms
	warp_def 6, 3, 3, 7, AbandonedShip_HiddenFloorRooms
	warp_def 9, 3, 3, 8, AbandonedShip_HiddenFloorRooms

AbandonedShip_HiddenFloorCorridors_MapBGEvents:: @ 838E4FC
	bg_event 3, 8, 3, 0, 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EBF3
	bg_event 6, 8, 3, 0, 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EC2A
	bg_event 3, 4, 0, 0, 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EC61
	bg_event 9, 4, 0, 0, 0, AbandonedShip_HiddenFloorCorridors_EventScript_15EC98

AbandonedShip_HiddenFloorCorridors_MapEvents:: @ 838E52C
	map_events 0x0, AbandonedShip_HiddenFloorCorridors_MapWarps, 0x0, AbandonedShip_HiddenFloorCorridors_MapBGEvents
