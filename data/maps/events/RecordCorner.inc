RecordCorner_MapObjects:: @ 839139C
	object_event 1, MAP_OBJ_GFX_WOMAN_6, 0, 10, 0, 5, 0, 3, 8, 0, 0, 0, 0, 0, 0, RecordCorner_EventScript_1A44BC, 0, 0, 0

RecordCorner_MapWarps:: @ 83913B4
	warp_def 8, 9, 3, 127, NONE
	warp_def 9, 9, 3, 127, NONE
	warp_def 11, 9, 3, 127, NONE
	warp_def 10, 9, 3, 127, NONE

RecordCorner_MapCoordEvents:: @ 83913D4
	coord_event 6, 4, 3, 0, 0x4000, 0, 0, RecordCorner_EventScript_1A4418
	coord_event 6, 6, 3, 0, 0x4000, 0, 0, RecordCorner_EventScript_1A4442
	coord_event 13, 4, 3, 0, 0x4000, 0, 0, RecordCorner_EventScript_1A442D
	coord_event 13, 6, 3, 0, 0x4000, 0, 0, RecordCorner_EventScript_1A4457

RecordCorner_MapEvents:: @ 8391414
	map_events RecordCorner_MapObjects, RecordCorner_MapWarps, RecordCorner_MapCoordEvents, 0x0
