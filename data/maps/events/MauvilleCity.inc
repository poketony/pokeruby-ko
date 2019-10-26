MauvilleCity_MapObjects:: @ 837FB90
	object_event 1, MAP_OBJ_GFX_BOY_3, 0, 29, 0, 16, 0, 3, 5, 17, 0, 0, 0, 0, 0, MauvilleCity_EventScript_14C05A, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_BOY_4, 0, 24, 0, 10, 0, 3, 5, 1, 0, 0, 0, 0, 0, MauvilleCity_EventScript_14C075, 0, 0, 0
	object_event 3, MAP_OBJ_GFX_MANIAC, 0, 14, 0, 11, 0, 3, 10, 0, 0, 0, 0, 0, 0, MauvilleCity_EventScript_14C063, 0, 0, 0
	object_event 4, MAP_OBJ_GFX_WOMAN_5, 0, 18, 0, 6, 0, 3, 1, 0, 0, 0, 0, 0, 0, MauvilleCity_EventScript_14C06C, 0, 0, 0
	object_event 5, MAP_OBJ_GFX_SCHOOL_KID_M, 0, 17, 0, 14, 0, 3, 8, 0, 0, 0, 0, 0, 0, MauvilleCity_EventScript_14C0A2, 0, 0, 0
	object_event 6, MAP_OBJ_GFX_WALLY, 0, 8, 0, 6, 0, 3, 7, 0, 0, 0, 0, 0, 0, MauvilleCity_EventScript_14C0F9, 804, 0, 0
	object_event 7, MAP_OBJ_GFX_MAN_3, 0, 9, 0, 6, 0, 3, 9, 0, 0, 0, 0, 0, 0, MauvilleCity_EventScript_14C0C4, 805, 0, 0
	object_event 8, MAP_OBJ_GFX_WATTSON, 0, 29, 0, 9, 0, 3, 1, 0, 0, 0, 0, 0, 0, MauvilleCity_EventScript_14C2F2, 912, 0, 0
	object_event 9, MAP_OBJ_GFX_ITEM_BALL, 0, 28, 0, 19, 0, 3, 1, 17, 0, 0, 0, 0, 0, MauvilleCity_EventScript_1B171E, 1116, 0, 0

MauvilleCity_MapWarps:: @ 837FC68
	warp_def 8, 5, 0, 0, MauvilleCity_Gym
	warp_def 22, 5, 0, 0, MauvilleCity_PokemonCenter_1F
	warp_def 35, 5, 0, 0, MauvilleCity_BikeShop
	warp_def 23, 14, 0, 0, MauvilleCity_Mart
	warp_def 32, 14, 0, 0, MauvilleCity_House1
	warp_def 8, 13, 0, 0, MauvilleCity_GameCorner
	warp_def 19, 14, 0, 0, MauvilleCity_House2

MauvilleCity_MapBGEvents:: @ 837FCA0
	bg_event 23, 5, 0, 1, 0, MauvilleCity_EventScript_1A00EA
	bg_event 11, 6, 3, 0, 0, MauvilleCity_EventScript_14C087
	bg_event 24, 14, 0, 1, 0, MauvilleCity_EventScript_1A00E1
	bg_event 25, 14, 0, 1, 0, MauvilleCity_EventScript_1A00E1
	bg_event 24, 5, 0, 1, 0, MauvilleCity_EventScript_1A00EA
	bg_event 19, 7, 0, 0, 0, MauvilleCity_EventScript_14C07E
	bg_event 33, 6, 0, 0, 0, MauvilleCity_EventScript_14C090
	bg_event 11, 15, 0, 0, 0, MauvilleCity_EventScript_14C099

MauvilleCity_MapEvents:: @ 837FD00
	map_events MauvilleCity_MapObjects, MauvilleCity_MapWarps, 0x0, MauvilleCity_MapBGEvents
