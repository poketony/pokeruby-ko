GraniteCave_B1F_MapObjects:: @ 838BF88
	object_event 1, MAP_OBJ_GFX_ITEM_BALL, 0, 15, 0, 21, 0, 3, 1, 0, 0, 0, 0, 0, 0, GraniteCave_B1F_EventScript_1B17AD, 1051, 0, 0

GraniteCave_B1F_MapWarps:: @ 838BFA0
	warp_def 25, 13, 3, 1, GraniteCave_1F
	warp_def 4, 21, 3, 2, GraniteCave_1F
	warp_def 29, 13, 3, 0, GraniteCave_B2F
	warp_def 28, 21, 3, 1, GraniteCave_B2F
	warp_def 8, 5, 3, 2, GraniteCave_B2F
	warp_def 12, 3, 3, 3, GraniteCave_B2F
	warp_def 29, 2, 3, 4, GraniteCave_B2F

GraniteCave_B1F_MapEvents:: @ 838BFD8
	map_events GraniteCave_B1F_MapObjects, GraniteCave_B1F_MapWarps, 0x0, 0x0
