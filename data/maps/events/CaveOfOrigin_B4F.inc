CaveOfOrigin_B4F_MapObjects:: @ 838D880
	object_event 1, 248, 0, 9, 0, 10, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0x0, 825, 0, 0

CaveOfOrigin_B4F_MapWarps:: @ 838D898
	warp_def 12, 5, 3, 1, CaveOfOrigin_B3F

CaveOfOrigin_B4F_MapCoordEvents:: @ 838D8A0
	coord_event 9, 13, 3, 0, 0x409b, 0, 0, CaveOfOrigin_B4F_EventScript_15DDD7
	coord_event 13, 9, 3, 0, 0x4005, 0, 0, CaveOfOrigin_B4F_EventScript_1A04A0
	coord_event 5, 9, 3, 0, 0x4005, 0, 0, CaveOfOrigin_B4F_EventScript_1A04A0

CaveOfOrigin_B4F_MapEvents:: @ 838D8D0
	map_events CaveOfOrigin_B4F_MapObjects, CaveOfOrigin_B4F_MapWarps, CaveOfOrigin_B4F_MapCoordEvents, 0x0
