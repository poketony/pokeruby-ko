CaveOfOrigin_B1F_MapWarps:: @ 838D76C
	warp_def 13, 5, 3, 1, CaveOfOrigin_1F
	warp_def 5, 11, 3, 0, CaveOfOrigin_B2F

CaveOfOrigin_B1F_MapCoordEvents:: @ 838D77C
	coord_event 12, 15, 3, 0, 0x4001, 0, 0, CaveOfOrigin_B1F_EventScript_1A04AF
	coord_event 12, 16, 3, 0, 0x4001, 0, 0, CaveOfOrigin_B1F_EventScript_1A04AF
	coord_event 12, 17, 3, 0, 0x4001, 0, 0, CaveOfOrigin_B1F_EventScript_1A04AF

CaveOfOrigin_B1F_MapEvents:: @ 838D7AC
	map_events 0x0, CaveOfOrigin_B1F_MapWarps, CaveOfOrigin_B1F_MapCoordEvents, 0x0
