CaveOfOrigin_B3F_MapObjects:: @ 838D814
	object_event 1, MAP_OBJ_GFX_ITEM_BALL, 0, 6, 0, 5, 0, 3, 1, 0, 0, 0, 0, 0, 0, CaveOfOrigin_B3F_EventScript_1B1A44, 1059, 0, 0

CaveOfOrigin_B3F_MapWarps:: @ 838D82C
	warp_def 7, 14, 3, 1, CaveOfOrigin_B2F
	warp_def 12, 6, 3, 0, CaveOfOrigin_B4F

CaveOfOrigin_B3F_MapCoordEvents:: @ 838D83C
	coord_event 5, 11, 3, 0, 0x4001, 0, 0, CaveOfOrigin_B3F_EventScript_1A04AF
	coord_event 8, 6, 3, 0, 0x4002, 0, 0, CaveOfOrigin_B3F_EventScript_1A04BB
	coord_event 8, 5, 3, 0, 0x4002, 0, 0, CaveOfOrigin_B3F_EventScript_1A04BB

CaveOfOrigin_B3F_MapEvents:: @ 838D86C
	map_events CaveOfOrigin_B3F_MapObjects, CaveOfOrigin_B3F_MapWarps, CaveOfOrigin_B3F_MapCoordEvents, 0x0
