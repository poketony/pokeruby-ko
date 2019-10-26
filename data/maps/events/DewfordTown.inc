DewfordTown_MapObjects:: @ 8380B88
	object_event 1, MAP_OBJ_GFX_WOMAN_3, 0, 7, 0, 12, 0, 3, 5, 1, 0, 0, 0, 0, 0, DewfordTown_EventScript_14E0A2, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_OLD_MAN_1, 0, 12, 0, 9, 0, 3, 9, 16, 0, 0, 0, 3, 0, DewfordTown_EventScript_14E002, 740, 0, 0
	object_event 3, MAP_OBJ_GFX_FISHERMAN, 0, 12, 0, 14, 0, 3, 5, 1, 0, 0, 0, 0, 0, DewfordTown_EventScript_14E0C6, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_MR_BRINEYS_BOAT, 0, 12, 0, 8, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0x0, 743, 0, 0
	object_event 5, MAP_OBJ_GFX_BOY_1, 0, 1, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, DewfordTown_EventScript_14E413, 0, 0, 0

DewfordTown_MapWarps:: @ 8380C00
	warp_def 3, 3, 0, 0, DewfordTown_Hall
	warp_def 2, 10, 0, 0, DewfordTown_PokemonCenter_1F
	warp_def 8, 17, 0, 0, DewfordTown_Gym
	warp_def 17, 14, 0, 0, DewfordTown_House1
	warp_def 8, 8, 0, 0, DewfordTown_House2

DewfordTown_MapBGEvents:: @ 8380C28
	bg_event 10, 10, 0, 0, 0, DewfordTown_EventScript_14E0AB
	bg_event 11, 16, 0, 0, 0, DewfordTown_EventScript_14E0B4
	bg_event 4, 10, 0, 1, 0, DewfordTown_EventScript_1A00EA
	bg_event 3, 10, 0, 1, 0, DewfordTown_EventScript_1A00EA
	bg_event 2, 4, 0, 0, 0, DewfordTown_EventScript_14E0BD

DewfordTown_MapEvents:: @ 8380C64
	map_events DewfordTown_MapObjects, DewfordTown_MapWarps, 0x0, DewfordTown_MapBGEvents
