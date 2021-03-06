SlateportCity_Harbor_MapScripts:: @ 8155F5D
	map_script 3, SlateportCity_Harbor_MapScript1_155F63
	.byte 0

SlateportCity_Harbor_MapScript1_155F63:: @ 8155F63
	setescapewarp SlateportCity, 255, 28, 13
	setvar 0x4001, 0
	compare 0x40a0, 1
	call_if 1, SlateportCity_Harbor_EventScript_155F89
	checkflag 2052
	call_if 1, SlateportCity_Harbor_EventScript_155F85
	end

SlateportCity_Harbor_EventScript_155F85:: @ 8155F85
	clearflag 860
	return

SlateportCity_Harbor_EventScript_155F89:: @ 8155F89
	savebgm BGM_EVIL_TEAM
	setobjectxyperm 4, 12, 13
	setobjectmovementtype 4, 9
	setflag 905
	return

SlateportCity_Harbor_EventScript_155F9B:: @ 8155F9B
	lockall
	setvar 0x8008, 0
	goto SlateportCity_Harbor_EventScript_155FD5
	end

SlateportCity_Harbor_EventScript_155FA7:: @ 8155FA7
	lockall
	setvar 0x8008, 1
	goto SlateportCity_Harbor_EventScript_155FD5
	end

SlateportCity_Harbor_EventScript_155FB3:: @ 8155FB3
	lockall
	setvar 0x8008, 2
	goto SlateportCity_Harbor_EventScript_155FD5
	end

SlateportCity_Harbor_EventScript_155FBF:: @ 8155FBF
	lockall
	setvar 0x8008, 3
	applymovement 255, SlateportCity_Harbor_Movement_1560C2
	waitmovement 0
	goto SlateportCity_Harbor_EventScript_155FD5
	end

SlateportCity_Harbor_EventScript_155FD5:: @ 8155FD5
	applymovement 7, SlateportCity_Harbor_Movement_1A0845
	waitmovement 0
	applymovement 255, SlateportCity_Harbor_Movement_1A0841
	waitmovement 0
	msgbox SlateportCity_Harbor_Text_17FD7D, 4
	closemessage
	applymovement 6, SlateportCity_Harbor_Movement_15609B
	applymovement 7, SlateportCity_Harbor_Movement_15609B
	applymovement 8, SlateportCity_Harbor_Movement_1560A5
	waitmovement 0
	removeobject 6
	removeobject 7
	removeobject 8
	setvar 0x40a0, 2
	compare 0x8008, 0
	call_if 1, SlateportCity_Harbor_EventScript_15605C
	compare 0x8008, 1
	call_if 1, SlateportCity_Harbor_EventScript_156071
	compare 0x8008, 2
	call_if 1, SlateportCity_Harbor_EventScript_156086
	compare 0x8008, 3
	call_if 1, SlateportCity_Harbor_EventScript_156086
	msgbox SlateportCity_Harbor_Text_17FE60, 4
	closemessage
	setflag 821
	setflag 822
	moveobjectoffscreen 4
	setobjectmovementtype 4, 10
	releaseall
	end

SlateportCity_Harbor_EventScript_15605C:: @ 815605C
	applymovement 4, SlateportCity_Harbor_Movement_1560B3
	waitmovement 0
	applymovement 255, SlateportCity_Harbor_Movement_1A0845
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_156071:: @ 8156071
	applymovement 4, SlateportCity_Harbor_Movement_1560B9
	waitmovement 0
	applymovement 255, SlateportCity_Harbor_Movement_1A0843
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_156086:: @ 8156086
	applymovement 4, SlateportCity_Harbor_Movement_1560BE
	waitmovement 0
	applymovement 255, SlateportCity_Harbor_Movement_1A0843
	waitmovement 0
	return

SlateportCity_Harbor_Movement_15609B:: @ 815609B
	step_14
	step_14
	step_43
	step_54
	step_end

@ 81560A0
	step_14
	step_14
	step_43
	step_54
	step_end

SlateportCity_Harbor_Movement_1560A5:: @ 81560A5
	step_14
	step_14
	step_14
	step_14
	step_right
	step_right
	step_right
	step_18
	step_18
	step_18
	step_18
	step_18
	step_18
	step_end

SlateportCity_Harbor_Movement_1560B3:: @ 81560B3
	step_left
	step_left
	step_left
	step_left
	step_up
	step_end

SlateportCity_Harbor_Movement_1560B9:: @ 81560B9
	step_left
	step_left
	step_up
	step_left
	step_end

SlateportCity_Harbor_Movement_1560BE:: @ 81560BE
	step_left
	step_left
	step_left
	step_end

SlateportCity_Harbor_Movement_1560C2:: @ 81560C2
	step_up
	step_end

SlateportCity_Harbor_EventScript_1560C4:: @ 81560C4
	lock
	faceplayer
	checkflag 2052
	goto_if_eq SlateportCity_Harbor_EventScript_1560D9
	msgbox SlateportCity_Harbor_Text_17FA0A, 4
	release
	end

SlateportCity_Harbor_EventScript_1560D9:: @ 81560D9
	msgbox SlateportCity_Harbor_Text_17FA73, 4
	checkitem ITEM_SS_TICKET, 1
	compare RESULT, 0
	goto_if_eq SlateportCity_Harbor_EventScript_156135
	message SlateportCity_Harbor_Text_17FB0A
	waitmessage
	goto SlateportCity_Harbor_EventScript_1560FD
	end

SlateportCity_Harbor_EventScript_1560FD:: @ 81560FD
	multichoicedefault 18, 6, 52, 2, 0
	switch RESULT
	case 0, SlateportCity_Harbor_EventScript_15613F
	case 1, SlateportCity_Harbor_EventScript_156167
	case 2, SlateportCity_Harbor_EventScript_1561DA
	case 127, SlateportCity_Harbor_EventScript_1561DA
	end

SlateportCity_Harbor_EventScript_156135:: @ 8156135
	msgbox SlateportCity_Harbor_Text_17FAAD, 4
	release
	end

SlateportCity_Harbor_EventScript_15613F:: @ 815613F
	msgbox SlateportCity_Harbor_Text_17FB81, 5
	compare RESULT, 0
	goto_if_eq SlateportCity_Harbor_EventScript_15618A
	setvar 0x40b4, 1
	call SlateportCity_Harbor_EventScript_156196
	warp SSTidalCorridor, 255, 1, 10
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_156167:: @ 8156167
	msgbox SlateportCity_Harbor_Text_17FB9C, 5
	compare RESULT, 0
	goto_if_eq SlateportCity_Harbor_EventScript_15618A
	call SlateportCity_Harbor_EventScript_156196
	warp BattleTower_Outside, 255, 19, 23
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_15618A:: @ 815618A
	message SlateportCity_Harbor_Text_17FBE5
	waitmessage
	goto SlateportCity_Harbor_EventScript_1560FD
	end

SlateportCity_Harbor_EventScript_156196:: @ 8156196
	msgbox SlateportCity_Harbor_Text_17FBB6, 4
	closemessage
	applymovement LAST_TALKED, SlateportCity_Harbor_Movement_1A0841
	waitmovement 0
	delay 30
	hideobject LAST_TALKED, 9, 8
	compare FACING, 2
	call_if 1, SlateportCity_Harbor_EventScript_1561EF
	compare FACING, 4
	call_if 1, SlateportCity_Harbor_EventScript_1561E4
	delay 30
	hideobject 255, 0, 0
	setvar 0x8004, 5
	call SlateportCity_Harbor_EventScript_1A040E
	return

SlateportCity_Harbor_EventScript_1561DA:: @ 81561DA
	msgbox SlateportCity_Harbor_Text_17FB5F, 4
	release
	end

SlateportCity_Harbor_EventScript_1561E4:: @ 81561E4
	applymovement 255, SlateportCity_Harbor_Movement_1561FA
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_1561EF:: @ 81561EF
	applymovement 255, SlateportCity_Harbor_Movement_1561FD
	waitmovement 0
	return

SlateportCity_Harbor_Movement_1561FA:: @ 81561FA
	step_right
	step_26
	step_end

SlateportCity_Harbor_Movement_1561FD:: @ 81561FD
	step_up
	step_end

SlateportCity_Harbor_EventScript_1561FF:: @ 81561FF
	msgbox SlateportCity_Harbor_Text_17FC07, 2
	end

SlateportCity_Harbor_EventScript_156208:: @ 8156208
	msgbox SlateportCity_Harbor_Text_17FC7C, 2
	end

SlateportCity_Harbor_EventScript_156211:: @ 8156211
	lock
	faceplayer
	checkflag 2061
	goto_if_eq SlateportCity_Harbor_EventScript_15626F
	checkflag 271
	goto_if_eq SlateportCity_Harbor_EventScript_156265
	checkflag 112
	goto_if_eq SlateportCity_Harbor_EventScript_156258
	compare 0x40a0, 2
	goto_if_eq SlateportCity_Harbor_EventScript_15624E
	msgbox SlateportCity_Harbor_Text_17FD1C, 4
	closemessage
	applymovement LAST_TALKED, SlateportCity_Harbor_Movement_1A083D
	waitmovement 0
	release
	end

SlateportCity_Harbor_EventScript_15624E:: @ 815624E
	msgbox SlateportCity_Harbor_Text_17FE60, 4
	release
	end

SlateportCity_Harbor_EventScript_156258:: @ 8156258
	setflag 271
	msgbox SlateportCity_Harbor_Text_17FF35, 4
	release
	end

SlateportCity_Harbor_EventScript_156265:: @ 8156265
	msgbox SlateportCity_Harbor_Text_1800A0, 4
	release
	end

SlateportCity_Harbor_EventScript_15626F:: @ 815626F
	compare 0x4001, 1
	goto_if_eq SlateportCity_Harbor_EventScript_156380
	checkitem ITEM_SCANNER, 1
	compare RESULT, 1
	goto_if_eq SlateportCity_Harbor_EventScript_1562A7
	checkflag 2052
	goto_if_eq SlateportCity_Harbor_EventScript_15629D
	msgbox SlateportCity_Harbor_Text_18017B, 4
	release
	end

SlateportCity_Harbor_EventScript_15629D:: @ 815629D
	msgbox SlateportCity_Harbor_Text_1801EA, 4
	release
	end

SlateportCity_Harbor_EventScript_1562A7:: @ 81562A7
	message SlateportCity_Harbor_Text_18028B
	waitmessage
	goto SlateportCity_Harbor_EventScript_1562B3
	end

SlateportCity_Harbor_EventScript_1562B3:: @ 81562B3
	multichoice 0, 0, 46, 0
	switch RESULT
	case 0, SlateportCity_Harbor_EventScript_1562EA
	case 1, SlateportCity_Harbor_EventScript_15632A
	case 2, SlateportCity_Harbor_EventScript_15636A
	case 127, SlateportCity_Harbor_EventScript_15636A
	end

SlateportCity_Harbor_EventScript_1562EA:: @ 81562EA
	msgbox SlateportCity_Harbor_Text_1803DD, 5
	compare RESULT, 0
	goto_if_eq SlateportCity_Harbor_EventScript_156374
	giveitem ITEM_DEEP_SEA_TOOTH
	compare RESULT, 0
	goto_if_eq SlateportCity_Harbor_EventScript_1A029B
	removeitem ITEM_SCANNER, 1
	msgbox SlateportCity_Harbor_Text_18046B, 4
	setflag 294
	goto SlateportCity_Harbor_EventScript_156380
	end

SlateportCity_Harbor_EventScript_15632A:: @ 815632A
	msgbox SlateportCity_Harbor_Text_180412, 5
	compare RESULT, 0
	goto_if_eq SlateportCity_Harbor_EventScript_156374
	giveitem ITEM_DEEP_SEA_SCALE
	compare RESULT, 0
	goto_if_eq SlateportCity_Harbor_EventScript_1A029B
	removeitem ITEM_SCANNER, 1
	msgbox SlateportCity_Harbor_Text_18046B, 4
	setflag 294
	goto SlateportCity_Harbor_EventScript_156380
	end

SlateportCity_Harbor_EventScript_15636A:: @ 815636A
	msgbox SlateportCity_Harbor_Text_180360, 4
	release
	end

SlateportCity_Harbor_EventScript_156374:: @ 8156374
	message SlateportCity_Harbor_Text_180447
	waitmessage
	goto SlateportCity_Harbor_EventScript_1562B3
	end

SlateportCity_Harbor_EventScript_156380:: @ 8156380
	setvar 0x4001, 1
	msgbox SlateportCity_Harbor_Text_180491, 4
	release
	end
