MauvilleCity_BikeShop_MapObjects:: @ 8388318
	object_event 1, MAP_OBJ_GFX_MAN_2, 0, 2, 0, 5, 0, 3, 9, 0, 0, 0, 0, 0, 0, MauvilleCity_BikeShop_EventScript_156796, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_MAN_6, 0, 7, 0, 6, 0, 3, 2, 17, 0, 0, 0, 0, 0, MauvilleCity_BikeShop_EventScript_15690B, 0, 0, 0

MauvilleCity_BikeShop_MapWarps:: @ 8388348
	warp_def 3, 8, 0, 2, MauvilleCity
	warp_def 4, 8, 0, 2, MauvilleCity

MauvilleCity_BikeShop_MapBGEvents:: @ 8388358
	bg_event 8, 1, 0, 0, 0, MauvilleCity_BikeShop_EventScript_156914
	bg_event 11, 1, 0, 0, 0, MauvilleCity_BikeShop_EventScript_156988

MauvilleCity_BikeShop_MapEvents:: @ 8388370
	map_events MauvilleCity_BikeShop_MapObjects, MauvilleCity_BikeShop_MapWarps, 0x0, MauvilleCity_BikeShop_MapBGEvents
