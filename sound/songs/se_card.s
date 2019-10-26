	.include "MPlayDef.s"

	.equ	se_card_grp, voicegroup_8451F90
	.equ	se_card_pri, 4
	.equ	se_card_rev, reverb_set+50
	.equ	se_card_mvl, 127
	.equ	se_card_key, 0
	.equ	se_card_tbs, 1
	.equ	se_card_exg, 0
	.equ	se_card_cmp, 1

	.section .rodata
	.global	se_card
	.align	2

@********************** Track  1 **********************@

se_card_1:
	.byte	KEYSH , se_card_key+0
	.byte	TEMPO , 180*se_card_tbs/2
	.byte		VOICE , 2
	.byte		BENDR , 12
	.byte		VOL   , 45*se_card_mvl/mxv
	.byte		BEND  , c_v+63
	.byte		N02   , Gn3 , v044
	.byte	W01
	.byte		VOL   , 87*se_card_mvl/mxv
	.byte	W01
	.byte		        120*se_card_mvl/mxv
	.byte		N01   , Gn4 
	.byte	W02
	.byte		N30   , Cn4 , v127
	.byte	W02
	.byte		BEND  , c_v+59
	.byte	W01
	.byte		VOL   , 3*se_card_mvl/mxv
	.byte	W01
	.byte		        30*se_card_mvl/mxv
	.byte	W01
	.byte		        68*se_card_mvl/mxv
	.byte		BEND  , c_v+55
	.byte	W01
	.byte		VOL   , 92*se_card_mvl/mxv
	.byte	W02
	.byte		        120*se_card_mvl/mxv
	.byte		BEND  , c_v+46
	.byte	W03
	.byte		VOL   , 111*se_card_mvl/mxv
	.byte		BEND  , c_v+37
	.byte	W03
	.byte		VOL   , 95*se_card_mvl/mxv
	.byte		BEND  , c_v+28
	.byte	W03
	.byte		VOL   , 79*se_card_mvl/mxv
	.byte		BEND  , c_v+20
	.byte	W03
	.byte		VOL   , 63*se_card_mvl/mxv
	.byte		BEND  , c_v+11
	.byte	W03
	.byte		VOL   , 46*se_card_mvl/mxv
	.byte		BEND  , c_v+2
	.byte	W03
	.byte		VOL   , 30*se_card_mvl/mxv
	.byte		BEND  , c_v-7
	.byte	W03
	.byte		VOL   , 14*se_card_mvl/mxv
	.byte		BEND  , c_v-16
	.byte	W03
	.byte	FINE

@******************************************************@
	.align	2

se_card:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	se_card_pri	@ Priority
	.byte	se_card_rev	@ Reverb.

	.word	se_card_grp

	.word	se_card_1

	.end
