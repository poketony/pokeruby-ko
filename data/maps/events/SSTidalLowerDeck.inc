SSTidalLowerDeck_MapObjects:: @ 8391844
	object_event 1, MAP_OBJ_GFX_SAILOR, 0, 10, 0, 4, 0, 3, 46, 68, 0, 1, 0, 3, 0, SSTidalLowerDeck_EventScript_15FED7, 0, 0, 0
	object_event 2, MAP_OBJ_GFX_SAILOR, 0, 7, 0, 4, 0, 3, 50, 71, 0, 1, 0, 3, 0, SSTidalLowerDeck_EventScript_15FEEE, 0, 0, 0

SSTidalLowerDeck_MapWarps:: @ 8391874
	warp_def 15, 2, 3, 8, SSTidalCorridor

SSTidalLowerDeck_MapBGEvents:: @ 839187C
	bg_event 0, 2, 0, 7, 0, ITEM_LEFTOVERS, 35, 0

SSTidalLowerDeck_MapEvents:: @ 8391888
	map_events SSTidalLowerDeck_MapObjects, SSTidalLowerDeck_MapWarps, 0x0, SSTidalLowerDeck_MapBGEvents
