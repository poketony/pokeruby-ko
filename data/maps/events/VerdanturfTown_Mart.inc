VerdanturfTown_Mart_MapObjects:: @ 8386B70
	object_event 1, MAP_OBJ_GFX_MART_EMPLOYEE, 0, 1, 0, 3, 0, 3, 10, 0, 0, 0, 0, 0, 0, VerdanturfTown_Mart_EventScript_153EBC, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_BOY_2, 0, 5, 0, 4, 0, 3, 10, 0, 0, 0, 0, 0, 0, VerdanturfTown_Mart_EventScript_153EEE, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_OLD_WOMAN_1, 0, 8, 0, 5, 0, 3, 9, 0, 0, 0, 0, 0, 0, VerdanturfTown_Mart_EventScript_153EF7, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_LASS, 0, 3, 0, 2, 0, 3, 9, 17, 0, 0, 0, 0, 0, VerdanturfTown_Mart_EventScript_153F00, 0, 0, 0

VerdanturfTown_Mart_MapWarps:: @ 8386BD0
	warp_def 3, 7, 0, 1, VerdanturfTown
	warp_def 4, 7, 0, 1, VerdanturfTown

VerdanturfTown_Mart_MapEvents:: @ 8386BE0
	map_events VerdanturfTown_Mart_MapObjects, VerdanturfTown_Mart_MapWarps, 0x0, 0x0
