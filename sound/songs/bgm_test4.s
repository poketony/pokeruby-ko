	.include "MPlayDef.s"

	.equ	bgm_test4_grp, voicegroup_843948C
	.equ	bgm_test4_pri, 0
	.equ	bgm_test4_rev, reverb_set+50
	.equ	bgm_test4_mvl, 127
	.equ	bgm_test4_key, 0
	.equ	bgm_test4_tbs, 1
	.equ	bgm_test4_exg, 0
	.equ	bgm_test4_cmp, 1

	.section .rodata
	.global	bgm_test4
	.align	2

@********************** Track  1 **********************@

bgm_test4_1:
	.byte	KEYSH , bgm_test4_key+0
bgm_test4_1_B1:
	.byte	TEMPO , 128*bgm_test4_tbs/2
	.byte		VOICE , 36
	.byte		BENDR , 12
	.byte		LFOS  , 44
	.byte		BENDR , 12
	.byte		LFOS  , 44
	.byte		PAN   , c_v+0
	.byte		VOL   , 43*bgm_test4_mvl/mxv
	.byte		BEND  , c_v+0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		VOL   , 66*bgm_test4_mvl/mxv
	.byte	W96
	.byte	W96
	.byte		N06   , Ds1 , v112
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N24   , Ds2 
	.byte	W24
	.byte		N06   , Ds1 
	.byte	W06
	.byte		N03   , Ds2 
	.byte	W06
	.byte		N06   , As1 
	.byte	W12
	.byte		        Ds2 
	.byte	W06
	.byte		N18   , Ds1 
	.byte	W18
	.byte		N06   
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N24   , Ds2 
	.byte	W24
	.byte		N06   , Ds1 
	.byte	W06
	.byte		N03   , Ds2 
	.byte	W06
	.byte		N06   , As1 
	.byte	W12
	.byte		        Ds2 
	.byte	W06
	.byte		        Ds1 
	.byte	W12
	.byte		N03   , Ds2 
	.byte	W06
	.byte		N06   , Dn1 
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N24   , Dn2 
	.byte	W24
	.byte		N06   , Dn1 
	.byte	W06
	.byte		N03   , Dn2 
	.byte	W06
	.byte		N06   , An1 
	.byte	W12
	.byte		        Dn2 
	.byte	W06
	.byte		N18   , Dn1 
	.byte	W18
	.byte		N06   , Gn1 
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N24   , Gn2 
	.byte	W24
	.byte		N03   , Gn1 
	.byte	W06
	.byte		        Gn2 
	.byte	W12
	.byte		N06   , Dn2 
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		        Gn1 
	.byte	W06
	.byte		        Cn1 
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N24   , Cn2 
	.byte	W24
	.byte		N06   , Cn1 
	.byte	W06
	.byte		N03   , Cn2 
	.byte	W06
	.byte		N06   , Gn1 
	.byte	W12
	.byte		        Cn2 
	.byte	W06
	.byte		N18   , Cn1 
	.byte	W18
	.byte		N06   
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N24   , Cn2 
	.byte	W24
	.byte		N06   , Cn1 
	.byte	W06
	.byte		N03   , Cn2 
	.byte	W06
	.byte		N06   , Gn1 
	.byte	W12
	.byte		        Cn2 
	.byte	W06
	.byte		        Cn1 
	.byte	W06
	.byte		N03   , Cn2 
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Fn1 
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N24   , Fn2 
	.byte	W24
	.byte		N06   , Fn1 
	.byte	W06
	.byte		N03   , Fn2 
	.byte	W06
	.byte		N06   , Cn2 
	.byte	W12
	.byte		        Fn2 
	.byte	W06
	.byte		        Fn1 
	.byte	W12
	.byte		N03   , Fn2 
	.byte	W06
	.byte		N06   , Fn1 
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N24   , Fn2 
	.byte	W24
	.byte		N06   , Fn1 
	.byte	W06
	.byte		N03   , Fn2 
	.byte	W12
	.byte		N06   , Cn2 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        An1 
	.byte	W06
	.byte		        As1 
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		        Gs1 
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		        Gn1 
	.byte	W24
	.byte		N06   
	.byte	W24
	.byte		        Fs1 
	.byte	W36
	.byte		        Gs1 
	.byte	W12
	.byte		        As1 
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , As2 
	.byte	W06
	.byte		        As1 
	.byte	W06
	.byte		N03   , As2 
	.byte	W06
	.byte		N06   , As1 
	.byte	W06
	.byte		        An1 
	.byte	W06
	.byte		        Gs1 
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Gs2 
	.byte	W06
	.byte		        Gs1 
	.byte	W06
	.byte		N03   , Gs2 
	.byte	W06
	.byte		N06   , An1 
	.byte	W06
	.byte		        Gs1 
	.byte	W06
	.byte		        Gn1 
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Gn2 
	.byte	W06
	.byte		N03   , Gn1 
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Ds2 
	.byte	W06
	.byte		N03   , Gn2 
	.byte	W06
	.byte		N06   , Fs1 
	.byte	W06
	.byte		N03   , Fs2 
	.byte	W12
	.byte		N06   , Fs1 
	.byte	W06
	.byte		        Gs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W06
	.byte		        Fs1 
	.byte	W06
	.byte	GOTO
	 .word	bgm_test4_1_B1
	.byte	FINE

@********************** Track  2 **********************@

bgm_test4_2:
	.byte	KEYSH , bgm_test4_key+0
bgm_test4_2_B1:
	.byte		VOICE , 80
	.byte		LFOS  , 44
	.byte		XCMD  , xIECV , 18
	.byte		        xIECV , 16
	.byte		BENDR , 12
	.byte		VOL   , 45*bgm_test4_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N06   , Fn2 , v112
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Ds2 
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Dn2 
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Cn2 
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , An2 
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		N24   , An3 
	.byte	W24
	.byte		N03   , Gn3 , v096
	.byte	W03
	.byte		        Fn3 
	.byte	W03
	.byte		        Ds3 
	.byte	W03
	.byte		        Dn3 
	.byte	W03
	.byte		        Cn3 
	.byte	W03
	.byte		        As2 
	.byte	W03
	.byte		        An2 
	.byte	W03
	.byte		        Gn2 , v092
	.byte	W03
	.byte		N06   , Dn2 , v112
	.byte	W12
	.byte		N18   
	.byte	W24
	.byte		N06   
	.byte	W06
	.byte		        Ds2 
	.byte	W06
	.byte		N18   , Fn2 
	.byte	W24
	.byte		        As2 
	.byte	W24
	.byte		N06   , Gs2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		N32   , Gs2 
	.byte	W36
	.byte		N06   
	.byte	W12
	.byte		N18   , Ds2 
	.byte	W24
	.byte		N06   , Gs2 
	.byte	W12
	.byte		        As2 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		N36   , Dn3 
	.byte	W36
	.byte		N06   , Gn3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		N36   , As3 
	.byte	W36
	.byte		N04   , As2 
	.byte	W08
	.byte		        Cs3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		        As3 
	.byte	W08
	.byte		        Fs3 
	.byte	W08
	.byte		        Cs3 
	.byte	W08
	.byte		        Ds2 
	.byte	W04
	.byte		        Gs2 
	.byte	W04
	.byte		        Cn3 
	.byte	W04
	.byte		        Ds3 
	.byte	W04
	.byte		        Gs3 
	.byte	W04
	.byte		        Cn4 
	.byte	W04
	.byte		N03   , Ds4 
	.byte	W03
	.byte		        Cn4 
	.byte	W03
	.byte		        Gs3 
	.byte	W03
	.byte		        Ds3 
	.byte	W03
	.byte		        Cn3 
	.byte	W03
	.byte		        Gs2 
	.byte	W03
	.byte		        Ds2 
	.byte	W03
	.byte		        Cn2 
	.byte	W03
	.byte		        Fn3 
	.byte	W12
	.byte		N21   
	.byte	W24
	.byte		N03   , As2 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Fn3 
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		        As3 
	.byte	W12
	.byte		N03   , Fn3 
	.byte	W12
	.byte		N21   
	.byte	W24
	.byte		N03   , As2 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Fn3 
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		        Gs3 
	.byte	W12
	.byte		N03   , Gn3 
	.byte	W12
	.byte		N21   
	.byte	W24
	.byte		N03   , As2 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        Gn3 
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		        As3 
	.byte	W12
	.byte		N32   , Cs3 
	.byte	W36
	.byte		N02   
	.byte	W04
	.byte		N02   
	.byte	W04
	.byte		N02   
	.byte	W06
	.byte		N24   , Fn3 
	.byte	W22
	.byte		        Ds3 
	.byte	W24
bgm_test4_2_000:
	.byte	W72
	.byte		N06   , Gn3 , v112
	.byte	W06
	.byte		N03   , Gn3 , v096
	.byte	W06
	.byte		        Ds3 , v064
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte	PEND
bgm_test4_2_001:
	.byte	W72
	.byte		N06   , Gn3 , v112
	.byte	W06
	.byte		N03   , Gs3 , v096
	.byte	W06
	.byte		        Ds3 , v064
	.byte	W06
	.byte		        As3 , v112
	.byte	W06
	.byte	PEND
bgm_test4_2_002:
	.byte	W72
	.byte		N06   , An3 , v112
	.byte	W06
	.byte		N03   , An3 , v096
	.byte	W06
	.byte		        Fn3 , v064
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte	PEND
	.byte	W78
	.byte		        Gn3 , v112
	.byte	W12
	.byte		N06   , An3 
	.byte	W06
	.byte	PATT
	 .word	bgm_test4_2_000
	.byte	PATT
	 .word	bgm_test4_2_001
	.byte	PATT
	 .word	bgm_test4_2_002
	.byte	W72
	.byte		N06   , Fn3 , v112
	.byte	W06
	.byte		N03   , Gn3 
	.byte	W12
	.byte		N06   , An3 
	.byte	W06
	.byte	W72
	.byte		N03   , Gs2 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte	W72
	.byte		        Fs2 
	.byte	W06
	.byte		        As2 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte	W48
	.byte		        Dn4 
	.byte	W03
	.byte		        Gs3 
	.byte	W03
	.byte		        Fn3 
	.byte	W03
	.byte		        Dn3 
	.byte	W03
	.byte		        Gs2 
	.byte	W03
	.byte		        Fn2 
	.byte	W03
	.byte		        Dn2 
	.byte	W03
	.byte		        Gs1 
	.byte	W03
	.byte		        Dn2 
	.byte	W03
	.byte		        Ds2 
	.byte	W03
	.byte		        Fn2 
	.byte	W03
	.byte		        Gs2 
	.byte	W03
	.byte		        Dn3 
	.byte	W03
	.byte		        Ds3 
	.byte	W03
	.byte		        Fn3 
	.byte	W03
	.byte		        Gs3 
	.byte	W03
	.byte	W48
	.byte		        As3 
	.byte	W03
	.byte		        Fs3 
	.byte	W03
	.byte		        Ds3 
	.byte	W03
	.byte		        As2 
	.byte	W03
	.byte		        Fs2 
	.byte	W03
	.byte		        Ds2 
	.byte	W03
	.byte		        As1 
	.byte	W03
	.byte		        Fs1 
	.byte	W03
	.byte		        As1 
	.byte	W03
	.byte		        Ds2 
	.byte	W03
	.byte		        Fs2 
	.byte	W03
	.byte		        As2 
	.byte	W03
	.byte		        Ds3 
	.byte	W03
	.byte		        Fs3 
	.byte	W03
	.byte		        As3 
	.byte	W03
	.byte		        Ds4 
	.byte	W03
	.byte	GOTO
	 .word	bgm_test4_2_B1
	.byte	FINE

@********************** Track  3 **********************@

bgm_test4_3:
	.byte	KEYSH , bgm_test4_key+0
bgm_test4_3_B1:
	.byte		VOICE , 81
	.byte		LFOS  , 44
	.byte		XCMD  , xIECV , 18
	.byte		        xIECV , 16
	.byte		BENDR , 12
	.byte		VOL   , 45*bgm_test4_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N06   , Cn4 , v112
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W03
	.byte		        Dn4 , v076
	.byte	W03
	.byte		        Cn4 , v096
	.byte	W03
	.byte		        Dn4 , v076
	.byte	W03
	.byte		        Cn4 , v096
	.byte	W03
	.byte		        Dn4 , v076
	.byte	W03
	.byte		        Cn4 , v096
	.byte	W03
	.byte		        Dn4 , v072
	.byte	W03
	.byte		N06   , Cn4 , v112
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		N24   , Fn4 
	.byte	W24
	.byte		N03   , Ds4 , v096
	.byte	W03
	.byte		        Dn4 
	.byte	W03
	.byte		        Cn4 
	.byte	W03
	.byte		        As3 
	.byte	W03
	.byte		        An3 
	.byte	W03
	.byte		        Gn3 
	.byte	W03
	.byte		        Fn3 
	.byte	W03
	.byte		        Ds3 , v092
	.byte	W03
	.byte		N06   , As2 , v112
	.byte	W12
	.byte		N18   
	.byte	W24
	.byte		N06   
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		N18   , Dn3 
	.byte	W24
	.byte		        Fn3 
	.byte	W24
	.byte		N06   , Ds3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		N36   , Ds3 
	.byte	W36
	.byte		N06   
	.byte	W12
	.byte		N18   , Cn3 
	.byte	W24
	.byte		N06   
	.byte	W12
	.byte		        Dn3 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		N36   , Fn3 
	.byte	W36
	.byte		N06   , As3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		N36   , Dn4 
	.byte	W36
	.byte		N04   , Fs3 
	.byte	W08
	.byte		        As3 
	.byte	W08
	.byte		        Cs4 
	.byte	W08
	.byte		        Fs4 
	.byte	W08
	.byte		        Cs4 
	.byte	W08
	.byte		        As3 
	.byte	W08
	.byte		        Gs2 
	.byte	W04
	.byte		        Cn3 
	.byte	W04
	.byte		        Ds3 
	.byte	W04
	.byte		        Gs3 
	.byte	W04
	.byte		        Cn4 
	.byte	W04
	.byte		        Ds4 
	.byte	W04
	.byte		N03   , Gs4 
	.byte	W03
	.byte		        Ds4 
	.byte	W03
	.byte		        Cn4 
	.byte	W03
	.byte		        Gs3 
	.byte	W03
	.byte		        Ds3 
	.byte	W03
	.byte		        Cn3 
	.byte	W03
	.byte		        Gs2 
	.byte	W03
	.byte		        Ds2 
	.byte	W03
	.byte		        Dn4 
	.byte	W12
	.byte		N21   
	.byte	W24
	.byte		N03   , Fn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Dn4 
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		        Fn4 
	.byte	W12
	.byte		N03   , Cn4 
	.byte	W12
	.byte		N21   
	.byte	W24
	.byte		N03   , Fn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Cn4 
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		        Ds4 
	.byte	W12
	.byte		N03   , Fn4 
	.byte	W12
	.byte		N21   
	.byte	W24
	.byte		N03   , Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn4 
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W12
	.byte		N32   , As3 
	.byte	W36
	.byte		N02   
	.byte	W04
	.byte		N02   
	.byte	W04
	.byte		N02   
	.byte	W04
	.byte		N24   , Cn4 
	.byte	W24
	.byte		N24   
	.byte	W24
bgm_test4_3_000:
	.byte	W72
	.byte		N06   , Fn4 , v112
	.byte	W06
	.byte		N03   , Fn4 , v096
	.byte	W06
	.byte		        As3 , v064
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte	PEND
bgm_test4_3_001:
	.byte	W72
	.byte		N06   , Ds4 , v112
	.byte	W06
	.byte		N03   , Fn4 , v096
	.byte	W12
	.byte		        Gn4 , v112
	.byte	W06
	.byte	PEND
bgm_test4_3_002:
	.byte	W72
	.byte		N06   , Fn4 , v112
	.byte	W06
	.byte		N03   , Fn4 , v096
	.byte	W06
	.byte		        Cn4 , v064
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte	PEND
	.byte	W78
	.byte		        Bn3 , v112
	.byte	W12
	.byte		N06   , Dn4 
	.byte	W06
	.byte	PATT
	 .word	bgm_test4_3_000
	.byte	PATT
	 .word	bgm_test4_3_001
	.byte	PATT
	 .word	bgm_test4_3_002
	.byte	W72
	.byte		N06   , As3 , v112
	.byte	W06
	.byte		N03   , Cn4 
	.byte	W12
	.byte		        Dn4 
	.byte	W06
	.byte	W72
	.byte		        Fn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte	W72
	.byte		        Ds3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte	W48
	.byte		        Gs4 
	.byte	W03
	.byte		        Fn4 
	.byte	W03
	.byte		        Dn4 
	.byte	W03
	.byte		        Gs3 
	.byte	W03
	.byte		        Fn3 
	.byte	W03
	.byte		        Dn3 
	.byte	W03
	.byte		        Gs2 
	.byte	W03
	.byte		        Fn2 
	.byte	W03
	.byte		        Gs2 
	.byte	W03
	.byte		        Dn3 
	.byte	W03
	.byte		        Ds3 
	.byte	W03
	.byte		        Fn3 
	.byte	W03
	.byte		        Gs3 
	.byte	W03
	.byte		        Dn4 
	.byte	W03
	.byte		        Ds4 
	.byte	W03
	.byte		        Fn4 
	.byte	W03
	.byte	W48
	.byte		        Fs4 
	.byte	W03
	.byte		        Ds4 
	.byte	W03
	.byte		        As3 
	.byte	W03
	.byte		        Fs3 
	.byte	W03
	.byte		        Ds3 
	.byte	W03
	.byte		        As2 
	.byte	W03
	.byte		        Fs2 
	.byte	W03
	.byte		        Ds2 
	.byte	W03
	.byte		        Fs2 
	.byte	W03
	.byte		        As2 
	.byte	W03
	.byte		        Ds3 
	.byte	W03
	.byte		        Fs3 
	.byte	W03
	.byte		        As3 
	.byte	W03
	.byte		        Ds4 
	.byte	W03
	.byte		        Fs4 
	.byte	W03
	.byte		        As4 
	.byte	W03
	.byte	GOTO
	 .word	bgm_test4_3_B1
	.byte	FINE

@********************** Track  4 **********************@

bgm_test4_4:
	.byte	KEYSH , bgm_test4_key+0
bgm_test4_4_B1:
	.byte		VOICE , 0
	.byte		PAN   , c_v+0
	.byte		VOL   , 90*bgm_test4_mvl/mxv
	.byte		N06   , En1 , v112
	.byte		N48   , An2 , v092
	.byte	W06
	.byte		N03   , En1 , v036
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N06   , En1 , v112
	.byte	W06
	.byte		        En1 , v064
	.byte	W06
	.byte		        En1 , v088
	.byte	W06
	.byte		        En1 , v052
	.byte	W06
	.byte		        En1 , v096
	.byte	W06
	.byte		        En1 , v052
	.byte	W06
	.byte		        En1 , v112
	.byte	W06
	.byte		N06   
	.byte	W06
	.byte		N06   
	.byte		N24   , An2 
	.byte	W48
bgm_test4_4_000:
	.byte		N06   , En1 , v112
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		N06   
	.byte	W06
	.byte		N06   
	.byte	W06
	.byte		        Cn1 
	.byte		N48   , An2 
	.byte	W48
	.byte	PEND
	.byte		N06   , En1 
	.byte	W12
	.byte		        En1 , v092
	.byte	W24
	.byte		N03   , En1 , v112
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        Cn1 
	.byte		N24   , An2 , v076
	.byte	W24
	.byte		N06   , Cn1 , v112
	.byte		N48   , An2 
	.byte	W12
	.byte		N06   , En1 
	.byte	W24
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		N03   , En1 , v036
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N06   , En1 , v112
	.byte	W06
	.byte		N03   , En1 , v036
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		        En1 , v032
	.byte	W03
	.byte		        En1 , v036
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		        En1 , v104
	.byte	W03
	.byte		        En1 , v036
	.byte	W03
	.byte		        En1 , v096
	.byte	W03
	.byte		        En1 , v036
	.byte	W03
	.byte		        En1 , v104
	.byte	W03
	.byte		        En1 , v032
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		        En1 , v036
	.byte	W03
	.byte		        En1 , v096
	.byte	W03
	.byte		        En1 , v036
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		        En1 , v096
	.byte	W03
	.byte		        En1 , v052
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte	PATT
	 .word	bgm_test4_4_000
	.byte		N06   , En1 , v112
	.byte	W36
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        Cn1 
	.byte		N24   , An2 , v076
	.byte	W24
	.byte		N06   , Cn1 , v112
	.byte		N48   , An2 
	.byte	W06
	.byte		N06   , Cn1 
	.byte	W06
	.byte		        En1 
	.byte	W24
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N03   , En1 , v104
	.byte	W03
	.byte		        En1 , v064
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		        En1 , v104
	.byte	W03
	.byte		        En1 , v064
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		N03   
	.byte	W03
	.byte		        En1 , v096
	.byte	W03
	.byte		        En1 , v064
	.byte	W03
	.byte		        En1 , v096
	.byte	W03
	.byte		        En1 , v064
	.byte	W03
	.byte		N06   , En1 , v112
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		N06   
	.byte	W06
	.byte		        Cn1 
	.byte	W12
bgm_test4_4_001:
	.byte		N06   , Cn1 , v112
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , En1 
	.byte	W18
	.byte		N03   , Cn1 , v100
	.byte	W06
	.byte		N06   , Cn1 , v112
	.byte	W06
	.byte		        En1 
	.byte	W06
	.byte		N03   , Cn1 
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , En1 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte	PEND
	.byte		N06   
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , En1 
	.byte	W18
	.byte		N03   , Cn1 , v100
	.byte	W06
	.byte		N06   , Cn1 , v112
	.byte	W06
	.byte		        En1 
	.byte	W06
	.byte		N03   , Cn1 
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , En1 
	.byte	W06
	.byte		        Cn1 
	.byte	W12
	.byte		        En1 , v088
	.byte	W06
	.byte	PATT
	 .word	bgm_test4_4_001
bgm_test4_4_002:
	.byte		N06   , Cn1 , v112
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , En1 
	.byte	W18
	.byte		N03   , Cn1 , v100
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		        Cn1 , v092
	.byte	W12
	.byte		N06   , En1 , v112
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte	PEND
	.byte	PATT
	 .word	bgm_test4_4_001
	.byte		N06   , Cn1 , v112
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , En1 
	.byte	W18
	.byte		N03   , Cn1 , v100
	.byte	W06
	.byte		N06   , Cn1 , v112
	.byte	W06
	.byte		        En1 
	.byte	W06
	.byte		N03   , Cn1 
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , En1 
	.byte	W06
	.byte		        Cn1 
	.byte	W06
	.byte		        En1 , v104
	.byte	W06
	.byte		        En1 , v092
	.byte	W06
	.byte	PATT
	 .word	bgm_test4_4_001
	.byte	PATT
	 .word	bgm_test4_4_002
bgm_test4_4_003:
	.byte		N06   , Cn1 , v112
	.byte	W18
	.byte		        Cn1 , v088
	.byte	W06
	.byte		        Dn1 , v112
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        Cn1 , v092
	.byte	W06
	.byte		        Cn1 , v076
	.byte	W06
	.byte		        Dn1 , v104
	.byte	W12
	.byte		        En1 , v112
	.byte	W06
	.byte		        Cn1 , v096
	.byte	W06
	.byte	PEND
	.byte	PATT
	 .word	bgm_test4_4_003
	.byte	PATT
	 .word	bgm_test4_4_003
	.byte		N06   , Dn1 , v112
	.byte	W06
	.byte		        Dn1 , v080
	.byte	W12
	.byte		        Dn1 , v088
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		        Dn1 
	.byte	W12
	.byte		        Dn1 , v084
	.byte	W06
	.byte		        Dn1 , v112
	.byte	W12
	.byte		        Cn1 , v092
	.byte	W06
	.byte		        Cn1 , v076
	.byte	W06
	.byte		        Dn1 , v104
	.byte	W12
	.byte		        En1 , v112
	.byte	W06
	.byte		        Cn1 , v096
	.byte	W06
	.byte	GOTO
	 .word	bgm_test4_4_B1
	.byte	FINE

@********************** Track  5 **********************@

bgm_test4_5:
	.byte	KEYSH , bgm_test4_key+0
bgm_test4_5_B1:
	.byte		VOICE , 83
	.byte		LFOS  , 44
	.byte		XCMD  , xIECV , 18
	.byte		        xIECV , 16
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 68*bgm_test4_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N06   , Fn1 , v112
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Ds1 
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Dn1 
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Cn1 
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Cn2 
	.byte	W06
	.byte		        An1 
	.byte	W06
	.byte		        Cn2 
	.byte	W06
	.byte		        Ds2 
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		        Ds2 
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		N24   , Cn3 
	.byte	W24
	.byte		N12   , Fn1 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		N06   , As1 
	.byte	W12
	.byte		N06   
	.byte	W24
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Dn1 
	.byte	W12
	.byte		N24   , As1 
	.byte	W24
	.byte		N06   , Fn1 
	.byte	W12
	.byte		        Gs1 
	.byte	W06
	.byte		        Gn1 
	.byte	W06
	.byte		        Gs1 
	.byte	W24
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   
	.byte	W12
	.byte		N24   
	.byte	W24
	.byte		N06   , Ds1 
	.byte	W12
	.byte		        Gn1 
	.byte	W36
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte		N06   , Gn2 
	.byte	W12
	.byte		N12   , Gn1 
	.byte	W12
	.byte		N06   , Fs1 
	.byte	W36
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Gs1 
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		        Cn2 
	.byte	W12
	.byte		N06   , As1 
	.byte	W36
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   
	.byte	W12
	.byte		N24   
	.byte	W24
	.byte		N06   , Fn1 
	.byte	W12
	.byte		        Gs1 
	.byte	W36
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   
	.byte	W12
	.byte		N24   
	.byte	W24
	.byte		N06   , Ds1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		N21   , Gn2 
	.byte	W24
	.byte		N03   , Gn1 
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   
	.byte	W12
	.byte		N12   
	.byte	W12
	.byte		N06   , Gn2 
	.byte	W12
	.byte		N12   , Gn1 
	.byte	W12
	.byte		N06   , Fs1 
	.byte	W36
	.byte		N03   
	.byte	W06
	.byte		N03   
	.byte	W06
	.byte		N06   , Gs1 
	.byte	W12
	.byte		N12   , Gs2 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		        Dn1 
	.byte	W12
	.byte		VOL   , 22*bgm_test4_mvl/mxv
	.byte		BEND  , c_v+1
	.byte		N04   , Dn4 
	.byte	W08
	.byte		        Ds4 
	.byte	W08
	.byte		        En4 
	.byte	W08
	.byte		N42   , Fn4 
	.byte	W48
	.byte		N04   
	.byte	W08
	.byte		        Gn4 
	.byte	W08
	.byte		        Fn4 
	.byte	W08
	.byte		N36   , Cn4 
	.byte	W36
	.byte		N06   , An3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        An4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        Gn4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		N12   , Fs4 
	.byte	W12
	.byte		N36   , Fn4 
	.byte	W36
	.byte		N06   , Dn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		N12   , Fn4 
	.byte	W12
	.byte		N24   , Ds4 
	.byte	W24
	.byte		N12   , Dn4 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		N06   , Dn4 
	.byte	W06
	.byte		        Cn4 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        Dn4 
	.byte	W06
	.byte		N12   , Fn4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		TIE   , Gn4 
	.byte	W72
	.byte	W48
	.byte		EOT   
	.byte		N06   , Fn4 
	.byte	W06
	.byte		N03   , Ds4 
	.byte	W12
	.byte		        Dn4 
	.byte	W06
	.byte		N06   , Ds4 
	.byte	W06
	.byte		        Fn4 
	.byte	W12
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        An4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        Gn4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        Fn4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fn4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        Gn4 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		        Cn5 
	.byte	W12
	.byte		N06   
	.byte	W06
	.byte		VOL   , 68*bgm_test4_mvl/mxv
	.byte	W12
	.byte		N03   , Dn4 
	.byte	W06
	.byte		        Dn4 , v088
	.byte	W06
	.byte		N06   , Ds4 , v112
	.byte	W06
	.byte		        Dn4 
	.byte	W18
	.byte		N06   
	.byte	W12
	.byte		        Ds4 
	.byte	W06
	.byte		        Dn4 
	.byte	W30
	.byte	W12
	.byte		N03   
	.byte	W06
	.byte		        Dn4 , v092
	.byte	W06
	.byte		N06   , Ds4 , v112
	.byte	W06
	.byte		        Dn4 
	.byte	W18
	.byte		        Fn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W12
	.byte		        As3 
	.byte	W18
	.byte		        Cn4 
	.byte	W12
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		        Ds4 
	.byte	W06
	.byte		        Dn4 
	.byte	W18
	.byte		N03   
	.byte	W06
	.byte		        Dn4 , v096
	.byte	W06
	.byte		N06   , Ds4 , v112
	.byte	W06
	.byte		        Dn4 
	.byte	W30
	.byte		        Ds4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		N12   , Ds4 
	.byte	W12
	.byte		        Fn4 
	.byte	W12
	.byte		N24   , Fs4 
	.byte	W24
	.byte		N18   , Gs4 
	.byte	W24
	.byte	GOTO
	 .word	bgm_test4_5_B1
	.byte	FINE

@******************************************************@
	.align	2

bgm_test4:
	.byte	5	@ NumTrks
	.byte	0	@ NumBlks
	.byte	bgm_test4_pri	@ Priority
	.byte	bgm_test4_rev	@ Reverb.

	.word	bgm_test4_grp

	.word	bgm_test4_1
	.word	bgm_test4_2
	.word	bgm_test4_3
	.word	bgm_test4_4
	.word	bgm_test4_5

	.end
