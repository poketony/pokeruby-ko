VerdanturfTown_MapObjects:: @ 8380F00
	object_event 1, MAP_OBJ_GFX_MAN_2, 0, 4, 0, 17, 0, 3, 5, 1, 0, 0, 0, 0, 0, VerdanturfTown_EventScript_14E899, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_LITTLE_GIRL_1, 0, 9, 0, 2, 0, 3, 9, 1, 0, 0, 0, 0, 0, VerdanturfTown_EventScript_14E866, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_BOY_1, 0, 11, 0, 9, 0, 3, 3, 16, 0, 0, 0, 0, 0, VerdanturfTown_EventScript_14E8AB, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_CAMPER, 0, 6, 0, 10, 0, 3, 5, 1, 0, 0, 0, 0, 0, VerdanturfTown_EventScript_14E8A2, 0, 0, 0

VerdanturfTown_MapWarps:: @ 8380F60
	warp_def 4, 7, 0, 0, VerdanturfTown_ContestLobby
	warp_def 12, 3, 0, 0, VerdanturfTown_Mart
	warp_def 16, 3, 0, 0, VerdanturfTown_PokemonCenter_1F
	warp_def 10, 14, 0, 0, VerdanturfTown_WandasHouse
	warp_def 8, 1, 0, 1, RusturfTunnel
	warp_def 1, 14, 0, 0, VerdanturfTown_FriendshipRatersHouse
	warp_def 17, 15, 0, 0, VerdanturfTown_House

VerdanturfTown_MapBGEvents:: @ 8380F98
	bg_event 14, 3, 0, 1, 0, VerdanturfTown_EventScript_1A00E1
	bg_event 14, 6, 0, 0, 0, VerdanturfTown_EventScript_14E8CA
	bg_event 17, 3, 0, 1, 0, VerdanturfTown_EventScript_1A00EA
	bg_event 7, 14, 0, 0, 0, VerdanturfTown_EventScript_14E8D3
	bg_event 13, 3, 0, 1, 0, VerdanturfTown_EventScript_1A00E1
	bg_event 18, 3, 0, 1, 0, VerdanturfTown_EventScript_1A00EA
	bg_event 3, 8, 0, 0, 0, VerdanturfTown_EventScript_14E8DC
	bg_event 7, 3, 0, 0, 0, VerdanturfTown_EventScript_14E8E5

VerdanturfTown_MapEvents:: @ 8380FF8
	map_events VerdanturfTown_MapObjects, VerdanturfTown_MapWarps, 0x0, VerdanturfTown_MapBGEvents
