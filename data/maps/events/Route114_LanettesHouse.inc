Route114_LanettesHouse_MapObjects:: @ 838B92C
	object_event 1, MAP_OBJ_GFX_WOMAN_3, 0, 5, 0, 4, 0, 3, 1, 0, 0, 0, 0, 0, 0, Route114_LanettesHouse_EventScript_15C262, 870, 0, 0

Route114_LanettesHouse_MapWarps:: @ 838B944
	warp_def 5, 7, 0, 2, Route114
	warp_def 6, 7, 0, 2, Route114

Route114_LanettesHouse_MapBGEvents:: @ 838B954
	bg_event 5, 1, 0, 0, 0, Route114_LanettesHouse_EventScript_15C299
	bg_event 8, 1, 0, 0, 0, Route114_LanettesHouse_EventScript_15C2D5
	bg_event 7, 1, 0, 0, 0, Route114_LanettesHouse_EventScript_15C2D5

Route114_LanettesHouse_MapEvents:: @ 838B978
	map_events Route114_LanettesHouse_MapObjects, Route114_LanettesHouse_MapWarps, 0x0, Route114_LanettesHouse_MapBGEvents
