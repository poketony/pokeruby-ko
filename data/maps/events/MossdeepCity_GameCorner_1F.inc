MossdeepCity_GameCorner_1F_MapObjects:: @ 838AC6C
	object_event 1, MAP_OBJ_GFX_OLD_MAN_1, 0, 4, 0, 4, 0, 3, 10, 0, 0, 0, 0, 0, 0, MossdeepCity_GameCorner_1F_EventScript_15AD42, 0, 0, 0

MossdeepCity_GameCorner_1F_MapWarps:: @ 838AC84
	warp_def 3, 7, 0, 9, MossdeepCity
	warp_def 4, 7, 0, 9, MossdeepCity
	warp_def 3, 1, 0, 0, MossdeepCity_GameCorner_B1F

MossdeepCity_GameCorner_1F_MapBGEvents:: @ 838AC9C
	bg_event 3, 1, 0, 0, 0, MossdeepCity_GameCorner_1F_EventScript_15AE4C

MossdeepCity_GameCorner_1F_MapEvents:: @ 838ACA8
	map_events MossdeepCity_GameCorner_1F_MapObjects, MossdeepCity_GameCorner_1F_MapWarps, 0x0, MossdeepCity_GameCorner_1F_MapBGEvents
