	.include "MPlayDef.s"

	.equ	bgm_fanfa4_grp, voicegroup_843129C
	.equ	bgm_fanfa4_pri, 5
	.equ	bgm_fanfa4_rev, reverb_set+50
	.equ	bgm_fanfa4_mvl, 127
	.equ	bgm_fanfa4_key, 0
	.equ	bgm_fanfa4_tbs, 1
	.equ	bgm_fanfa4_exg, 0
	.equ	bgm_fanfa4_cmp, 1

	.section .rodata
	.global	bgm_fanfa4
	.align	2

@********************** Track  1 **********************@

bgm_fanfa4_1:
	.byte	KEYSH , bgm_fanfa4_key+0
	.byte	W12
	.byte	TEMPO , 190*bgm_fanfa4_tbs/2
	.byte		VOICE , 46
	.byte		VOL   , 90*bgm_fanfa4_mvl/mxv
	.byte		PAN   , c_v-24
	.byte		N16   , Gs4 , v080
	.byte	W08
	.byte		MOD   , 5
	.byte	W08
	.byte		        0
	.byte	W08
	.byte		N06   , Ds4 
	.byte	W08
	.byte		        Gs4 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
	.byte		N08   , As4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		N48   , Gs4 
	.byte	W16
	.byte		MOD   , 5
	.byte	W08
	.byte		VOL   , 82*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        72*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte		        41*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        14*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte		MOD   , 0
	.byte	W24
	.byte	FINE

@********************** Track  2 **********************@

bgm_fanfa4_2:
	.byte	KEYSH , bgm_fanfa4_key+0
	.byte	W12
	.byte		VOICE , 46
	.byte		VOL   , 90*bgm_fanfa4_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N16   , Cn5 , v104
	.byte	W08
	.byte		MOD   , 5
	.byte	W08
	.byte		        0
	.byte	W08
	.byte		N06   
	.byte	W08
	.byte		N06   
	.byte	W08
	.byte		N06   
	.byte	W08
	.byte		N08   , Cs5 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		N48   , Cn5 
	.byte	W16
	.byte		MOD   , 5
	.byte	W08
	.byte		VOL   , 82*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        72*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte		        41*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        14*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte		MOD   , 0
	.byte	W24
	.byte	FINE

@********************** Track  3 **********************@

bgm_fanfa4_3:
	.byte	KEYSH , bgm_fanfa4_key+0
	.byte	W12
	.byte		VOICE , 58
	.byte		VOL   , 90*bgm_fanfa4_mvl/mxv
	.byte		N16   , Gs1 , v120
	.byte	W24
	.byte		N06   
	.byte	W08
	.byte		N06   
	.byte	W08
	.byte		N06   
	.byte	W08
	.byte		N08   , Fs1 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		        Gn1 
	.byte	W16
	.byte		N48   , Gs1 
	.byte	W24
	.byte		VOL   , 82*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        72*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte		        41*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        14*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte	W24
	.byte	FINE

@********************** Track  4 **********************@

bgm_fanfa4_4:
	.byte	KEYSH , bgm_fanfa4_key+0
	.byte	W12
	.byte		VOICE , 82
	.byte		VOL   , 90*bgm_fanfa4_mvl/mxv
	.byte		XCMD  , xIECV , 8
	.byte		        xIECL , 8
	.byte		PAN   , c_v-48
	.byte		N16   , Cn4 , v036
	.byte	W08
	.byte		MOD   , 5
	.byte	W08
	.byte		        0
	.byte	W08
	.byte		N06   , Gs3 
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		N08   , As3 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		N48   , Gs3 
	.byte	W16
	.byte		MOD   , 5
	.byte	W08
	.byte		VOL   , 82*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        72*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte		        41*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        14*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte		MOD   , 0
	.byte	W24
	.byte	FINE

@********************** Track  5 **********************@

bgm_fanfa4_5:
	.byte	KEYSH , bgm_fanfa4_key+0
	.byte	W12
	.byte		VOICE , 83
	.byte		VOL   , 90*bgm_fanfa4_mvl/mxv
	.byte		XCMD  , xIECV , 8
	.byte		        xIECL , 8
	.byte		PAN   , c_v+48
	.byte		N16   , Gs3 , v036
	.byte	W08
	.byte		MOD   , 5
	.byte	W08
	.byte		        0
	.byte	W08
	.byte		N06   , Ds3 
	.byte	W08
	.byte		        Gs3 
	.byte	W08
	.byte		        Ds3 
	.byte	W08
	.byte		N08   , Fs3 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		N48   , Ds3 
	.byte	W16
	.byte		MOD   , 5
	.byte	W08
	.byte		VOL   , 82*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        72*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte		        41*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        14*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte		MOD   , 0
	.byte	W24
	.byte	FINE

@********************** Track  6 **********************@

bgm_fanfa4_6:
	.byte	KEYSH , bgm_fanfa4_key+0
	.byte	W12
	.byte		VOICE , 46
	.byte		PAN   , c_v+24
	.byte		VOL   , 90*bgm_fanfa4_mvl/mxv
	.byte		N16   , Ds4 , v080
	.byte	W08
	.byte		MOD   , 5
	.byte	W08
	.byte		        0
	.byte	W08
	.byte		N06   , Cn4 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
	.byte		        Cn4 
	.byte	W08
	.byte		N08   , Fs4 
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		N08   
	.byte	W16
	.byte		N48   , Ds4 
	.byte	W16
	.byte		MOD   , 5
	.byte	W08
	.byte		VOL   , 82*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        72*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte		        41*bgm_fanfa4_mvl/mxv
	.byte	W05
	.byte		        14*bgm_fanfa4_mvl/mxv
	.byte	W07
	.byte		MOD   , 0
	.byte	W24
	.byte	FINE

@******************************************************@
	.align	2

bgm_fanfa4:
	.byte	6	@ NumTrks
	.byte	0	@ NumBlks
	.byte	bgm_fanfa4_pri	@ Priority
	.byte	bgm_fanfa4_rev	@ Reverb.

	.word	bgm_fanfa4_grp

	.word	bgm_fanfa4_1
	.word	bgm_fanfa4_2
	.word	bgm_fanfa4_3
	.word	bgm_fanfa4_4
	.word	bgm_fanfa4_5
	.word	bgm_fanfa4_6

	.end
