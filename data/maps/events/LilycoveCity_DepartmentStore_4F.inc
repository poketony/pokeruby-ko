LilycoveCity_DepartmentStore_4F_MapObjects:: @ 838A430
	object_event 1, MAP_OBJ_GFX_GENTLEMAN, 0, 0, 0, 2, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_4F_EventScript_159FFE, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_WOMAN_3, 0, 6, 0, 2, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_4F_EventScript_15A007, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_YOUNGSTER, 0, 13, 0, 4, 0, 3, 2, 17, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_4F_EventScript_15A010, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_WOMAN_4, 0, 7, 0, 6, 0, 3, 7, 0, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_4F_EventScript_15A019, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_WOMAN_4, 0, 9, 0, 6, 0, 3, 7, 0, 0, 0, 0, 0, 0, LilycoveCity_DepartmentStore_4F_EventScript_15A03C, 0, 0, 0

LilycoveCity_DepartmentStore_4F_MapWarps:: @ 838A4A8
	warp_def 16, 1, 0, 1, LilycoveCity_DepartmentStore_3F
	warp_def 13, 1, 0, 0, LilycoveCity_DepartmentStore_5F
	warp_def 2, 1, 0, 0, LilycoveCity_DepartmentStoreElevator

LilycoveCity_DepartmentStore_4F_MapEvents:: @ 838A4C0
	map_events LilycoveCity_DepartmentStore_4F_MapObjects, LilycoveCity_DepartmentStore_4F_MapWarps, 0x0, 0x0
