@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.section ewram_data,"aw"
	.align	2, 0
	.type	 gMPlay_PokemonCry,object
	.size	 gMPlay_PokemonCry,4
gMPlay_PokemonCry:
	.word	0x0
	.type	 gPokemonCryBGMDuckingCounter,object
	.size	 gPokemonCryBGMDuckingCounter,1
gPokemonCryBGMDuckingCounter:
	.byte	0x0
	.section .rodata
	.align	2, 0
	.type	 sFanfares,object
sFanfares:
	.short	0x16f
	.short	0x50
	.short	0x172
	.short	0xa0
	.short	0x173
	.short	0xdc
	.short	0x174
	.short	0xdc
	.short	0x170
	.short	0xa0
	.short	0x171
	.short	0x154
	.short	0x17a
	.short	0xb4
	.short	0x183
	.short	0x78
	.short	0x184
	.short	0x2c6
	.short	0x185
	.short	0xfa
	.short	0x186
	.short	0x96
	.short	0x187
	.short	0xa0
	.size	 sFanfares,48
.text
	.align	2, 0
	.globl	InitMapMusic
	.type	 InitMapMusic,function
	.thumb_func
InitMapMusic:
	push	{lr}
	ldr	r1, .L3
	mov	r0, #0x0
	strb	r0, [r1]
	bl	ResetMapMusic
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.word	gDisableMusic
.Lfe1:
	.size	 InitMapMusic,.Lfe1-InitMapMusic
	.align	2, 0
	.globl	MapMusicMain
	.type	 MapMusicMain,function
	.thumb_func
MapMusicMain:
	push	{r4, r5, lr}
	ldr	r0, .L18
	ldrb	r1, [r0]
	add	r2, r0, #0
	cmp	r1, #0x7
	bhi	.L6	@cond_branch
	lsl	r0, r1, #0x2
	ldr	r1, .L18+0x4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L19:
	.align	2, 0
.L18:
	.word	sMapMusicState
	.word	.L16
	.align	2, 0
	.align	2, 0
.L16:
	.word	.L6
	.word	.L8
	.word	.L6
	.word	.L6
	.word	.L6
	.word	.L10
	.word	.L12
	.word	.L14
.L8:
	mov	r0, #0x2
	strb	r0, [r2]
	ldr	r0, .L20
	ldrh	r0, [r0]
	bl	PlayBGM
	b	.L6
.L21:
	.align	2, 0
.L20:
	.word	sCurrentMapMusic
.L10:
	bl	IsBGMStopped
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L6	@cond_branch
	ldr	r0, .L22
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L22+0x4
	strb	r1, [r0]
	b	.L6
.L23:
	.align	2, 0
.L22:
	.word	sNextMapMusic
	.word	sMapMusicState
.L12:
	bl	IsBGMStopped
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L6	@cond_branch
	bl	IsFanfareTaskInactive
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L6	@cond_branch
	ldr	r2, .L24
	ldr	r1, .L24+0x4
	ldrh	r0, [r1]
	strh	r0, [r2]
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r1, .L24+0x8
	mov	r0, #0x2
	strb	r0, [r1]
	ldrh	r0, [r2]
	bl	PlayBGM
	b	.L6
.L25:
	.align	2, 0
.L24:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
.L14:
	bl	IsBGMStopped
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L6	@cond_branch
	bl	IsFanfareTaskInactive
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L6	@cond_branch
	ldr	r4, .L26
	ldrh	r0, [r4]
	ldr	r5, .L26+0x4
	ldrb	r1, [r5]
	bl	FadeInNewBGM
	ldr	r1, .L26+0x8
	ldrh	r0, [r4]
	strh	r0, [r1]
	mov	r2, #0x0
	strh	r2, [r4]
	ldr	r1, .L26+0xc
	mov	r0, #0x2
	strb	r0, [r1]
	strb	r2, [r5]
.L6:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L27:
	.align	2, 0
.L26:
	.word	sNextMapMusic
	.word	sMapMusicFadeInSpeed
	.word	sCurrentMapMusic
	.word	sMapMusicState
.Lfe2:
	.size	 MapMusicMain,.Lfe2-MapMusicMain
	.align	2, 0
	.globl	ResetMapMusic
	.type	 ResetMapMusic,function
	.thumb_func
ResetMapMusic:
	ldr	r0, .L29
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L29+0x4
	strh	r1, [r0]
	ldr	r0, .L29+0x8
	strb	r1, [r0]
	ldr	r0, .L29+0xc
	strb	r1, [r0]
	bx	lr
.L30:
	.align	2, 0
.L29:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
	.word	sMapMusicFadeInSpeed
.Lfe3:
	.size	 ResetMapMusic,.Lfe3-ResetMapMusic
	.align	2, 0
	.globl	GetCurrentMapMusic
	.type	 GetCurrentMapMusic,function
	.thumb_func
GetCurrentMapMusic:
	ldr	r0, .L32
	ldrh	r0, [r0]
	bx	lr
.L33:
	.align	2, 0
.L32:
	.word	sCurrentMapMusic
.Lfe4:
	.size	 GetCurrentMapMusic,.Lfe4-GetCurrentMapMusic
	.align	2, 0
	.globl	PlayNewMapMusic
	.type	 PlayNewMapMusic,function
	.thumb_func
PlayNewMapMusic:
	ldr	r1, .L35
	strh	r0, [r1]
	ldr	r1, .L35+0x4
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r1, .L35+0x8
	mov	r0, #0x1
	strb	r0, [r1]
	bx	lr
.L36:
	.align	2, 0
.L35:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
.Lfe5:
	.size	 PlayNewMapMusic,.Lfe5-PlayNewMapMusic
	.align	2, 0
	.globl	StopMapMusic
	.type	 StopMapMusic,function
	.thumb_func
StopMapMusic:
	ldr	r0, .L38
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L38+0x4
	strh	r1, [r0]
	ldr	r1, .L38+0x8
	mov	r0, #0x1
	strb	r0, [r1]
	bx	lr
.L39:
	.align	2, 0
.L38:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
.Lfe6:
	.size	 StopMapMusic,.Lfe6-StopMapMusic
	.align	2, 0
	.globl	FadeOutMapMusic
	.type	 FadeOutMapMusic,function
	.thumb_func
FadeOutMapMusic:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	bl	IsNotWaitingForBGMStop
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L41	@cond_branch
	add	r0, r4, #0
	bl	FadeOutBGM
.L41:
	ldr	r0, .L42
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L42+0x4
	strh	r1, [r0]
	ldr	r1, .L42+0x8
	mov	r0, #0x5
	strb	r0, [r1]
	pop	{r4}
	pop	{r0}
	bx	r0
.L43:
	.align	2, 0
.L42:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
.Lfe7:
	.size	 FadeOutMapMusic,.Lfe7-FadeOutMapMusic
	.align	2, 0
	.globl	FadeOutAndPlayNewMapMusic
	.type	 FadeOutAndPlayNewMapMusic,function
	.thumb_func
FadeOutAndPlayNewMapMusic:
	push	{r4, lr}
	add	r4, r0, #0
	add	r0, r1, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	bl	FadeOutMapMusic
	ldr	r1, .L45
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r0, .L45+0x4
	strh	r4, [r0]
	ldr	r1, .L45+0x8
	mov	r0, #0x6
	strb	r0, [r1]
	pop	{r4}
	pop	{r0}
	bx	r0
.L46:
	.align	2, 0
.L45:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
.Lfe8:
	.size	 FadeOutAndPlayNewMapMusic,.Lfe8-FadeOutAndPlayNewMapMusic
	.align	2, 0
	.globl	FadeOutAndFadeInNewMapMusic
	.type	 FadeOutAndFadeInNewMapMusic,function
	.thumb_func
FadeOutAndFadeInNewMapMusic:
	push	{r4, r5, lr}
	add	r4, r0, #0
	add	r0, r1, #0
	add	r5, r2, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r5, r5, #0x18
	lsr	r5, r5, #0x18
	bl	FadeOutMapMusic
	ldr	r1, .L48
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r0, .L48+0x4
	strh	r4, [r0]
	ldr	r1, .L48+0x8
	mov	r0, #0x7
	strb	r0, [r1]
	ldr	r0, .L48+0xc
	strb	r5, [r0]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L49:
	.align	2, 0
.L48:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
	.word	sMapMusicFadeInSpeed
.Lfe9:
	.size	 FadeOutAndFadeInNewMapMusic,.Lfe9-FadeOutAndFadeInNewMapMusic
	.align	2, 0
	.globl	FadeInNewMapMusic
	.type	 FadeInNewMapMusic,function
	.thumb_func
FadeInNewMapMusic:
	push	{r4, lr}
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	bl	FadeInNewBGM
	ldr	r0, .L51
	strh	r4, [r0]
	ldr	r0, .L51+0x4
	mov	r2, #0x0
	strh	r2, [r0]
	ldr	r1, .L51+0x8
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r0, .L51+0xc
	strb	r2, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
.L52:
	.align	2, 0
.L51:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
	.word	sMapMusicFadeInSpeed
.Lfe10:
	.size	 FadeInNewMapMusic,.Lfe10-FadeInNewMapMusic
	.align	2, 0
	.globl	IsNotWaitingForBGMStop
	.type	 IsNotWaitingForBGMStop,function
	.thumb_func
IsNotWaitingForBGMStop:
	push	{lr}
	ldr	r0, .L58
	ldrb	r0, [r0]
	cmp	r0, #0x6
	beq	.L56	@cond_branch
	cmp	r0, #0x5
	beq	.L56	@cond_branch
	cmp	r0, #0x7
	beq	.L56	@cond_branch
	mov	r0, #0x1
	b	.L57
.L59:
	.align	2, 0
.L58:
	.word	sMapMusicState
.L56:
	mov	r0, #0x0
.L57:
	pop	{r1}
	bx	r1
.Lfe11:
	.size	 IsNotWaitingForBGMStop,.Lfe11-IsNotWaitingForBGMStop
	.align	2, 0
	.globl	PlayFanfareByFanfareNum
	.type	 PlayFanfareByFanfareNum,function
	.thumb_func
PlayFanfareByFanfareNum:
	push	{r4, lr}
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r0, .L61
	bl	m4aMPlayStop
	ldr	r0, .L61+0x4
	lsl	r4, r4, #0x2
	add	r4, r4, r0
	ldrh	r0, [r4]
	ldr	r2, .L61+0x8
	ldrh	r1, [r4, #0x2]
	strh	r1, [r2]
	bl	m4aSongNumStart
	pop	{r4}
	pop	{r0}
	bx	r0
.L62:
	.align	2, 0
.L61:
	.word	gMPlay_BGM
	.word	sFanfares
	.word	sFanfareCounter
.Lfe12:
	.size	 PlayFanfareByFanfareNum,.Lfe12-PlayFanfareByFanfareNum
	.align	2, 0
	.globl	WaitFanfare
	.type	 WaitFanfare,function
	.thumb_func
WaitFanfare:
	push	{lr}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	ldr	r2, .L69
	ldrh	r0, [r2]
	cmp	r0, #0
	beq	.L64	@cond_branch
	sub	r0, r0, #0x1
	strh	r0, [r2]
	mov	r0, #0x0
	b	.L68
.L70:
	.align	2, 0
.L69:
	.word	sFanfareCounter
.L64:
	cmp	r1, #0
	bne	.L66	@cond_branch
	ldr	r0, .L71
	bl	m4aMPlayContinue
	b	.L67
.L72:
	.align	2, 0
.L71:
	.word	gMPlay_BGM
.L66:
	mov	r0, #0x0
	bl	m4aSongNumStart
.L67:
	mov	r0, #0x1
.L68:
	pop	{r1}
	bx	r1
.Lfe13:
	.size	 WaitFanfare,.Lfe13-WaitFanfare
	.align	2, 0
	.globl	StopFanfareByFanfareNum
	.type	 StopFanfareByFanfareNum,function
	.thumb_func
StopFanfareByFanfareNum:
	push	{lr}
	lsl	r0, r0, #0x18
	ldr	r1, .L74
	lsr	r0, r0, #0x16
	add	r0, r0, r1
	ldrh	r0, [r0]
	bl	m4aSongNumStop
	pop	{r0}
	bx	r0
.L75:
	.align	2, 0
.L74:
	.word	sFanfares
.Lfe14:
	.size	 StopFanfareByFanfareNum,.Lfe14-StopFanfareByFanfareNum
	.align	2, 0
	.globl	PlayFanfare
	.type	 PlayFanfare,function
	.thumb_func
PlayFanfare:
	push	{lr}
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	mov	r1, #0x0
	ldr	r2, .L83
.L80:
	ldrh	r0, [r2]
	cmp	r0, r3
	bne	.L79	@cond_branch
	lsl	r0, r1, #0x18
	lsr	r0, r0, #0x18
	bl	PlayFanfareByFanfareNum
	bl	CreateFanfareTask
	b	.L76
.L84:
	.align	2, 0
.L83:
	.word	sFanfares
.L79:
	add	r2, r2, #0x4
	add	r1, r1, #0x1
	cmp	r1, #0xb
	bls	.L80	@cond_branch
	mov	r0, #0x0
	bl	PlayFanfareByFanfareNum
	bl	CreateFanfareTask
.L76:
	pop	{r0}
	bx	r0
.Lfe15:
	.size	 PlayFanfare,.Lfe15-PlayFanfare
	.align	2, 0
	.globl	IsFanfareTaskInactive
	.type	 IsFanfareTaskInactive,function
	.thumb_func
IsFanfareTaskInactive:
	push	{lr}
	ldr	r0, .L88
	bl	FuncIsActiveTask
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L86	@cond_branch
	mov	r0, #0x1
	b	.L87
.L89:
	.align	2, 0
.L88:
	.word	Task_Fanfare
.L86:
	mov	r0, #0x0
.L87:
	pop	{r1}
	bx	r1
.Lfe16:
	.size	 IsFanfareTaskInactive,.Lfe16-IsFanfareTaskInactive
	.align	2, 0
	.type	 Task_Fanfare,function
	.thumb_func
Task_Fanfare:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r1, .L93
	ldrh	r0, [r1]
	cmp	r0, #0
	beq	.L91	@cond_branch
	sub	r0, r0, #0x1
	strh	r0, [r1]
	b	.L92
.L94:
	.align	2, 0
.L93:
	.word	sFanfareCounter
.L91:
	ldr	r0, .L95
	bl	m4aMPlayContinue
	add	r0, r4, #0
	bl	DestroyTask
.L92:
	pop	{r4}
	pop	{r0}
	bx	r0
.L96:
	.align	2, 0
.L95:
	.word	gMPlay_BGM
.Lfe17:
	.size	 Task_Fanfare,.Lfe17-Task_Fanfare
	.align	2, 0
	.type	 CreateFanfareTask,function
	.thumb_func
CreateFanfareTask:
	push	{r4, lr}
	ldr	r4, .L99
	add	r0, r4, #0
	bl	FuncIsActiveTask
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L98	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x50
	bl	CreateTask
.L98:
	pop	{r4}
	pop	{r0}
	bx	r0
.L100:
	.align	2, 0
.L99:
	.word	Task_Fanfare
.Lfe18:
	.size	 CreateFanfareTask,.Lfe18-CreateFanfareTask
	.align	2, 0
	.globl	FadeInNewBGM
	.type	 FadeInNewBGM,function
	.thumb_func
FadeInNewBGM:
	push	{r4, r5, r6, lr}
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r6, r1, #0x18
	ldr	r0, .L103
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L102	@cond_branch
	mov	r5, #0x0
.L102:
	add	r0, r5, #0
	bl	m4aSongNumStart
	ldr	r4, .L103+0x4
	add	r0, r4, #0
	bl	m4aMPlayImmInit
	ldr	r1, .L103+0x8
	add	r0, r4, #0
	mov	r2, #0x0
	bl	m4aMPlayVolumeControl
	add	r0, r5, #0
	bl	m4aSongNumStop
	add	r0, r4, #0
	add	r1, r6, #0
	bl	m4aMPlayFadeIn
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L104:
	.align	2, 0
.L103:
	.word	gDisableMusic
	.word	gMPlay_BGM
	.word	0xffff
.Lfe19:
	.size	 FadeInNewBGM,.Lfe19-FadeInNewBGM
	.align	2, 0
	.globl	FadeOutBGMTemporarily
	.type	 FadeOutBGMTemporarily,function
	.thumb_func
FadeOutBGMTemporarily:
	push	{lr}
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldr	r0, .L106
	bl	m4aMPlayFadeOutTemporarily
	pop	{r0}
	bx	r0
.L107:
	.align	2, 0
.L106:
	.word	gMPlay_BGM
.Lfe20:
	.size	 FadeOutBGMTemporarily,.Lfe20-FadeOutBGMTemporarily
	.align	2, 0
	.globl	IsBGMPausedOrStopped
	.type	 IsBGMPausedOrStopped,function
	.thumb_func
IsBGMPausedOrStopped:
	push	{lr}
	ldr	r0, .L112
	ldr	r1, [r0, #0x4]
	cmp	r1, #0
	blt	.L110	@cond_branch
	ldr	r0, .L112+0x4
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L110	@cond_branch
	mov	r0, #0x0
	b	.L111
.L113:
	.align	2, 0
.L112:
	.word	gMPlay_BGM
	.word	0xffff
.L110:
	mov	r0, #0x1
.L111:
	pop	{r1}
	bx	r1
.Lfe21:
	.size	 IsBGMPausedOrStopped,.Lfe21-IsBGMPausedOrStopped
	.align	2, 0
	.globl	FadeInBGM
	.type	 FadeInBGM,function
	.thumb_func
FadeInBGM:
	push	{lr}
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldr	r0, .L115
	bl	m4aMPlayFadeIn
	pop	{r0}
	bx	r0
.L116:
	.align	2, 0
.L115:
	.word	gMPlay_BGM
.Lfe22:
	.size	 FadeInBGM,.Lfe22-FadeInBGM
	.align	2, 0
	.globl	FadeOutBGM
	.type	 FadeOutBGM,function
	.thumb_func
FadeOutBGM:
	push	{lr}
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldr	r0, .L118
	bl	m4aMPlayFadeOut
	pop	{r0}
	bx	r0
.L119:
	.align	2, 0
.L118:
	.word	gMPlay_BGM
.Lfe23:
	.size	 FadeOutBGM,.Lfe23-FadeOutBGM
	.align	2, 0
	.globl	IsBGMStopped
	.type	 IsBGMStopped,function
	.thumb_func
IsBGMStopped:
	push	{lr}
	ldr	r0, .L123
	ldrh	r0, [r0, #0x4]
	cmp	r0, #0
	beq	.L121	@cond_branch
	mov	r0, #0x0
	b	.L122
.L124:
	.align	2, 0
.L123:
	.word	gMPlay_BGM
.L121:
	mov	r0, #0x1
.L122:
	pop	{r1}
	bx	r1
.Lfe24:
	.size	 IsBGMStopped,.Lfe24-IsBGMStopped
	.align	2, 0
	.globl	PlayCry1
	.type	 PlayCry1,function
	.thumb_func
PlayCry1:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffffc
	add	r5, r0, #0
	add	r4, r1, #0
	lsl	r5, r5, #0x10
	lsr	r5, r5, #0x10
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r0, .L126
	ldr	r1, .L126+0x4
	mov	r2, #0x55
	bl	m4aMPlayVolumeControl
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	mov	r0, #0x0
	str	r0, [sp]
	add	r0, r5, #0
	add	r1, r4, #0
	mov	r2, #0x7d
	mov	r3, #0xa
	bl	PlayCryInternal
	ldr	r1, .L126+0x8
	mov	r0, #0x2
	strb	r0, [r1]
	bl	RestoreBGMVolumeAfterPokemonCry
	add	sp, sp, #0x4
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L127:
	.align	2, 0
.L126:
	.word	gMPlay_BGM
	.word	0xffff
	.word	gPokemonCryBGMDuckingCounter
.Lfe25:
	.size	 PlayCry1,.Lfe25-PlayCry1
	.align	2, 0
	.globl	PlayCry2
	.type	 PlayCry2,function
	.thumb_func
PlayCry2:
	push	{r4, lr}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	lsl	r2, r2, #0x18
	asr	r2, r2, #0x18
	mov	r4, #0x0
	str	r4, [sp]
	bl	PlayCryInternal
	add	sp, sp, #0x4
	pop	{r4}
	pop	{r0}
	bx	r0
.Lfe26:
	.size	 PlayCry2,.Lfe26-PlayCry2
	.align	2, 0
	.globl	PlayCry3
	.type	 PlayCry3,function
	.thumb_func
PlayCry3:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r5, r1, #0x18
	lsl	r2, r2, #0x18
	lsr	r4, r2, #0x18
	cmp	r4, #0x1
	bne	.L130	@cond_branch
	lsl	r1, r5, #0x18
	asr	r1, r1, #0x18
	str	r4, [sp]
	add	r0, r6, #0
	mov	r2, #0x7d
	mov	r3, #0xa
	bl	PlayCryInternal
	b	.L131
.L130:
	ldr	r0, .L132
	ldr	r1, .L132+0x4
	mov	r2, #0x55
	bl	m4aMPlayVolumeControl
	lsl	r1, r5, #0x18
	asr	r1, r1, #0x18
	str	r4, [sp]
	add	r0, r6, #0
	mov	r2, #0x7d
	mov	r3, #0xa
	bl	PlayCryInternal
	ldr	r1, .L132+0x8
	mov	r0, #0x2
	strb	r0, [r1]
	bl	RestoreBGMVolumeAfterPokemonCry
.L131:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L133:
	.align	2, 0
.L132:
	.word	gMPlay_BGM
	.word	0xffff
	.word	gPokemonCryBGMDuckingCounter
.Lfe27:
	.size	 PlayCry3,.Lfe27-PlayCry3
	.align	2, 0
	.globl	PlayCry4
	.type	 PlayCry4,function
	.thumb_func
PlayCry4:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	add	r6, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r5, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r4, r2, #0
	cmp	r2, #0x1
	bne	.L135	@cond_branch
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	str	r2, [sp]
	mov	r2, #0x7d
	mov	r3, #0xa
	bl	PlayCryInternal
	b	.L136
.L135:
	ldr	r0, .L138
	ldrh	r1, [r0]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L137	@cond_branch
	ldr	r0, .L138+0x4
	ldr	r1, .L138+0x8
	mov	r2, #0x55
	bl	m4aMPlayVolumeControl
.L137:
	lsl	r1, r5, #0x18
	asr	r1, r1, #0x18
	str	r4, [sp]
	add	r0, r6, #0
	mov	r2, #0x7d
	mov	r3, #0xa
	bl	PlayCryInternal
.L136:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L139:
	.align	2, 0
.L138:
	.word	gBattleTypeFlags
	.word	gMPlay_BGM
	.word	0xffff
.Lfe28:
	.size	 PlayCry4,.Lfe28-PlayCry4
	.align	2, 0
	.globl	PlayCry5
	.type	 PlayCry5,function
	.thumb_func
PlayCry5:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffffc
	add	r5, r0, #0
	add	r4, r1, #0
	lsl	r5, r5, #0x10
	lsr	r5, r5, #0x10
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r0, .L141
	ldr	r1, .L141+0x4
	mov	r2, #0x55
	bl	m4aMPlayVolumeControl
	str	r4, [sp]
	add	r0, r5, #0
	mov	r1, #0x0
	mov	r2, #0x7d
	mov	r3, #0xa
	bl	PlayCryInternal
	ldr	r1, .L141+0x8
	mov	r0, #0x2
	strb	r0, [r1]
	bl	RestoreBGMVolumeAfterPokemonCry
	add	sp, sp, #0x4
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L142:
	.align	2, 0
.L141:
	.word	gMPlay_BGM
	.word	0xffff
	.word	gPokemonCryBGMDuckingCounter
.Lfe29:
	.size	 PlayCry5,.Lfe29-PlayCry5
	.align	2, 0
	.type	 PlayCryInternal,function
	.thumb_func
PlayCryInternal:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff8
	ldr	r4, [sp, #0x28]
	lsl	r0, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	mov	sl, r1
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	str	r3, [sp]
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r1, .L173
	add	r0, r0, r1
	lsr	r0, r0, #0x10
	mov	r8, r0
	mov	r0, #0x0
	mov	r9, r0
	mov	r6, #0x0
	mov	r7, #0x8c
	mov	r5, #0xf0
	lsl	r5, r5, #0x6
	mov	r1, #0x0
	str	r1, [sp, #0x4]
	cmp	r4, #0x5
	bhi	.L144	@cond_branch
	lsl	r0, r4, #0x2
	ldr	r1, .L173+0x4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L174:
	.align	2, 0
.L173:
	.word	0xffff0000
	.word	.L151
	.align	2, 0
	.align	2, 0
.L151:
	.word	.L144
	.word	.L146
	.word	.L147
	.word	.L148
	.word	.L149
	.word	.L150
.L146:
	mov	r7, #0x14
	mov	r6, #0xe1
	b	.L144
.L147:
	mov	r7, #0x1e
	mov	r6, #0xe1
	ldr	r5, .L175
	mov	r2, #0x14
	str	r2, [sp, #0x4]
	mov	r2, #0x50
	b	.L144
.L176:
	.align	2, 0
.L175:
	.word	0x3cf0
.L148:
	mov	r7, #0x32
	mov	r6, #0xc8
	ldr	r5, .L177
	b	.L144
.L178:
	.align	2, 0
.L177:
	.word	0x39d0
.L149:
	mov	r7, #0x14
	mov	r6, #0xdc
	ldr	r5, .L179
	b	.L144
.L180:
	.align	2, 0
.L179:
	.word	0x3db8
.L150:
	mov	r6, #0xc8
	ldr	r5, .L181
.L144:
	add	r0, r2, #0
	bl	SetPokemonCryVolume
	mov	r1, sl
	lsl	r0, r1, #0x18
	asr	r0, r0, #0x18
	bl	SetPokemonCryPanpot
	add	r0, r5, #0
	bl	SetPokemonCryPitch
	add	r0, r7, #0
	bl	SetPokemonCryLength
	mov	r0, #0x0
	bl	SetPokemonCryProgress
	add	r0, r6, #0
	bl	SetPokemonCryRelease
	ldr	r0, [sp, #0x4]
	bl	SetPokemonCryChorus
	ldr	r0, [sp]
	bl	SetPokemonCryPriority
	mov	r0, r8
	bl	SpeciesToCryId
	mov	r8, r0
	mov	r1, #0x7f
	mov	r2, r8
	and	r1, r1, r2
	lsr	r0, r2, #0x7
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r2, r0, #0
	cmp	r0, #0x1
	beq	.L157	@cond_branch
	cmp	r0, #0x1
	bgt	.L168	@cond_branch
	cmp	r0, #0
	beq	.L154	@cond_branch
	b	.L153
.L182:
	.align	2, 0
.L181:
	.word	0x38a4
.L168:
	cmp	r2, #0x2
	beq	.L160	@cond_branch
	cmp	r2, #0x3
	beq	.L163	@cond_branch
	b	.L153
.L154:
	mov	r0, r9
	cmp	r0, #0
	beq	.L155	@cond_branch
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, .L183
	b	.L170
.L184:
	.align	2, 0
.L183:
	.word	voicegroup_84537C0
.L155:
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, .L185
	b	.L170
.L186:
	.align	2, 0
.L185:
	.word	voicegroup_8452590
.L157:
	mov	r2, r9
	cmp	r2, #0
	beq	.L158	@cond_branch
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, .L187
	b	.L170
.L188:
	.align	2, 0
.L187:
	.word	voicegroup_8453DC0
.L158:
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, .L189
	b	.L170
.L190:
	.align	2, 0
.L189:
	.word	voicegroup_8452B90
.L160:
	mov	r0, r9
	cmp	r0, #0
	beq	.L161	@cond_branch
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, .L191
	b	.L170
.L192:
	.align	2, 0
.L191:
	.word	voicegroup_84543C0
.L161:
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, .L193
	b	.L170
.L194:
	.align	2, 0
.L193:
	.word	voicegroup_8453190
.L163:
	mov	r2, r9
	cmp	r2, #0
	beq	.L164	@cond_branch
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, .L195
	b	.L170
.L196:
	.align	2, 0
.L195:
	.word	voicegroup_84549C0
.L164:
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, .L197
.L170:
	add	r0, r0, r1
	bl	SetPokemonCryTone
	ldr	r1, .L197+0x4
	str	r0, [r1]
.L153:
	add	sp, sp, #0x8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L198:
	.align	2, 0
.L197:
	.word	voicegroup_8453790
	.word	gMPlay_PokemonCry
.Lfe30:
	.size	 PlayCryInternal,.Lfe30-PlayCryInternal
	.align	2, 0
	.globl	IsCryFinished
	.type	 IsCryFinished,function
	.thumb_func
IsCryFinished:
	push	{lr}
	ldr	r0, .L203
	bl	FuncIsActiveTask
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L200	@cond_branch
	bl	ClearPokemonCrySongs
	mov	r0, #0x1
	b	.L202
.L204:
	.align	2, 0
.L203:
	.word	Task_DuckBGMForPokemonCry
.L200:
	mov	r0, #0x0
.L202:
	pop	{r1}
	bx	r1
.Lfe31:
	.size	 IsCryFinished,.Lfe31-IsCryFinished
	.align	2, 0
	.globl	StopCryAndClearCrySongs
	.type	 StopCryAndClearCrySongs,function
	.thumb_func
StopCryAndClearCrySongs:
	push	{lr}
	ldr	r0, .L206
	ldr	r0, [r0]
	bl	m4aMPlayStop
	bl	ClearPokemonCrySongs
	pop	{r0}
	bx	r0
.L207:
	.align	2, 0
.L206:
	.word	gMPlay_PokemonCry
.Lfe32:
	.size	 StopCryAndClearCrySongs,.Lfe32-StopCryAndClearCrySongs
	.align	2, 0
	.globl	StopCry
	.type	 StopCry,function
	.thumb_func
StopCry:
	push	{lr}
	ldr	r0, .L209
	ldr	r0, [r0]
	bl	m4aMPlayStop
	pop	{r0}
	bx	r0
.L210:
	.align	2, 0
.L209:
	.word	gMPlay_PokemonCry
.Lfe33:
	.size	 StopCry,.Lfe33-StopCry
	.align	2, 0
	.globl	IsCryPlayingOrClearCrySongs
	.type	 IsCryPlayingOrClearCrySongs,function
	.thumb_func
IsCryPlayingOrClearCrySongs:
	push	{lr}
	ldr	r0, .L215
	ldr	r0, [r0]
	bl	IsPokemonCryPlaying
	cmp	r0, #0
	bne	.L212	@cond_branch
	bl	ClearPokemonCrySongs
	mov	r0, #0x0
	b	.L214
.L216:
	.align	2, 0
.L215:
	.word	gMPlay_PokemonCry
.L212:
	mov	r0, #0x1
.L214:
	pop	{r1}
	bx	r1
.Lfe34:
	.size	 IsCryPlayingOrClearCrySongs,.Lfe34-IsCryPlayingOrClearCrySongs
	.align	2, 0
	.globl	IsCryPlaying
	.type	 IsCryPlaying,function
	.thumb_func
IsCryPlaying:
	push	{lr}
	ldr	r0, .L221
	ldr	r0, [r0]
	bl	IsPokemonCryPlaying
	cmp	r0, #0
	bne	.L218	@cond_branch
	mov	r0, #0x0
	b	.L220
.L222:
	.align	2, 0
.L221:
	.word	gMPlay_PokemonCry
.L218:
	mov	r0, #0x1
.L220:
	pop	{r1}
	bx	r1
.Lfe35:
	.size	 IsCryPlaying,.Lfe35-IsCryPlaying
	.align	2, 0
	.type	 Task_DuckBGMForPokemonCry,function
	.thumb_func
Task_DuckBGMForPokemonCry:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r1, .L226
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	.L224	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1]
	b	.L223
.L227:
	.align	2, 0
.L226:
	.word	gPokemonCryBGMDuckingCounter
.L224:
	ldr	r0, .L228
	ldr	r0, [r0]
	bl	IsPokemonCryPlaying
	cmp	r0, #0
	bne	.L223	@cond_branch
	ldr	r0, .L228+0x4
	ldr	r1, .L228+0x8
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	bl	m4aMPlayVolumeControl
	add	r0, r4, #0
	bl	DestroyTask
.L223:
	pop	{r4}
	pop	{r0}
	bx	r0
.L229:
	.align	2, 0
.L228:
	.word	gMPlay_PokemonCry
	.word	gMPlay_BGM
	.word	0xffff
.Lfe36:
	.size	 Task_DuckBGMForPokemonCry,.Lfe36-Task_DuckBGMForPokemonCry
	.align	2, 0
	.type	 RestoreBGMVolumeAfterPokemonCry,function
	.thumb_func
RestoreBGMVolumeAfterPokemonCry:
	push	{r4, lr}
	ldr	r4, .L232
	add	r0, r4, #0
	bl	FuncIsActiveTask
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L231	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x50
	bl	CreateTask
.L231:
	pop	{r4}
	pop	{r0}
	bx	r0
.L233:
	.align	2, 0
.L232:
	.word	Task_DuckBGMForPokemonCry
.Lfe37:
	.size	 RestoreBGMVolumeAfterPokemonCry,.Lfe37-RestoreBGMVolumeAfterPokemonCry
	.align	2, 0
	.globl	PlayBGM
	.type	 PlayBGM,function
	.thumb_func
PlayBGM:
	push	{lr}
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	ldr	r0, .L236
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L235	@cond_branch
	mov	r1, #0x0
.L235:
	add	r0, r1, #0
	bl	m4aSongNumStart
	pop	{r0}
	bx	r0
.L237:
	.align	2, 0
.L236:
	.word	gDisableMusic
.Lfe38:
	.size	 PlayBGM,.Lfe38-PlayBGM
	.align	2, 0
	.globl	PlaySE
	.type	 PlaySE,function
	.thumb_func
PlaySE:
	push	{lr}
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	m4aSongNumStart
	pop	{r0}
	bx	r0
.Lfe39:
	.size	 PlaySE,.Lfe39-PlaySE
	.align	2, 0
	.globl	PlaySE12WithPanning
	.type	 PlaySE12WithPanning,function
	.thumb_func
PlaySE12WithPanning:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	r4, r1, #0
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	m4aSongNumStart
	ldr	r6, .L240
	add	r0, r6, #0
	bl	m4aMPlayImmInit
	ldr	r0, .L240+0x4
	mov	r8, r0
	bl	m4aMPlayImmInit
	ldr	r5, .L240+0x8
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	bl	m4aMPlayPanpotControl
	mov	r0, r8
	add	r1, r5, #0
	add	r2, r4, #0
	bl	m4aMPlayPanpotControl
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L241:
	.align	2, 0
.L240:
	.word	gMPlay_SE1
	.word	gMPlay_SE2
	.word	0xffff
.Lfe40:
	.size	 PlaySE12WithPanning,.Lfe40-PlaySE12WithPanning
	.align	2, 0
	.globl	PlaySE1WithPanning
	.type	 PlaySE1WithPanning,function
	.thumb_func
PlaySE1WithPanning:
	push	{r4, r5, lr}
	add	r4, r1, #0
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	m4aSongNumStart
	ldr	r5, .L243
	add	r0, r5, #0
	bl	m4aMPlayImmInit
	ldr	r1, .L243+0x4
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	add	r0, r5, #0
	add	r2, r4, #0
	bl	m4aMPlayPanpotControl
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L244:
	.align	2, 0
.L243:
	.word	gMPlay_SE1
	.word	0xffff
.Lfe41:
	.size	 PlaySE1WithPanning,.Lfe41-PlaySE1WithPanning
	.align	2, 0
	.globl	PlaySE2WithPanning
	.type	 PlaySE2WithPanning,function
	.thumb_func
PlaySE2WithPanning:
	push	{r4, r5, lr}
	add	r4, r1, #0
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	m4aSongNumStart
	ldr	r5, .L246
	add	r0, r5, #0
	bl	m4aMPlayImmInit
	ldr	r1, .L246+0x4
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	add	r0, r5, #0
	add	r2, r4, #0
	bl	m4aMPlayPanpotControl
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L247:
	.align	2, 0
.L246:
	.word	gMPlay_SE2
	.word	0xffff
.Lfe42:
	.size	 PlaySE2WithPanning,.Lfe42-PlaySE2WithPanning
	.align	2, 0
	.globl	SE12PanpotControl
	.type	 SE12PanpotControl,function
	.thumb_func
SE12PanpotControl:
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldr	r0, .L249
	ldr	r5, .L249+0x4
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	add	r1, r5, #0
	add	r2, r4, #0
	bl	m4aMPlayPanpotControl
	ldr	r0, .L249+0x8
	add	r1, r5, #0
	add	r2, r4, #0
	bl	m4aMPlayPanpotControl
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L250:
	.align	2, 0
.L249:
	.word	gMPlay_SE1
	.word	0xffff
	.word	gMPlay_SE2
.Lfe43:
	.size	 SE12PanpotControl,.Lfe43-SE12PanpotControl
	.align	2, 0
	.globl	IsSEPlaying
	.type	 IsSEPlaying,function
	.thumb_func
IsSEPlaying:
	push	{lr}
	ldr	r0, .L256
	ldr	r1, [r0, #0x4]
	mov	r2, #0x80
	lsl	r2, r2, #0x18
	add	r3, r0, #0
	cmp	r1, #0
	bge	.L252	@cond_branch
	ldr	r0, .L256+0x4
	ldr	r0, [r0, #0x4]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L255	@cond_branch
.L252:
	ldr	r1, .L256+0x8
	ldrh	r0, [r3, #0x4]
	cmp	r0, #0
	bne	.L253	@cond_branch
	ldr	r0, .L256+0x4
	ldr	r0, [r0, #0x4]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L253	@cond_branch
.L255:
	mov	r0, #0x0
	b	.L254
.L257:
	.align	2, 0
.L256:
	.word	gMPlay_SE1
	.word	gMPlay_SE2
	.word	0xffff
.L253:
	mov	r0, #0x1
.L254:
	pop	{r1}
	bx	r1
.Lfe44:
	.size	 IsSEPlaying,.Lfe44-IsSEPlaying
	.align	2, 0
	.globl	IsBGMPlaying
	.type	 IsBGMPlaying,function
	.thumb_func
IsBGMPlaying:
	push	{lr}
	ldr	r0, .L262
	ldr	r1, [r0, #0x4]
	cmp	r1, #0
	blt	.L260	@cond_branch
	ldr	r0, .L262+0x4
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L260	@cond_branch
	mov	r0, #0x1
	b	.L261
.L263:
	.align	2, 0
.L262:
	.word	gMPlay_BGM
	.word	0xffff
.L260:
	mov	r0, #0x0
.L261:
	pop	{r1}
	bx	r1
.Lfe45:
	.size	 IsBGMPlaying,.Lfe45-IsBGMPlaying
	.align	2, 0
	.globl	IsSpecialSEPlaying
	.type	 IsSpecialSEPlaying,function
	.thumb_func
IsSpecialSEPlaying:
	push	{lr}
	ldr	r0, .L268
	ldr	r1, [r0, #0x4]
	cmp	r1, #0
	blt	.L266	@cond_branch
	ldr	r0, .L268+0x4
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L266	@cond_branch
	mov	r0, #0x1
	b	.L267
.L269:
	.align	2, 0
.L268:
	.word	gMPlay_SE3
	.word	0xffff
.L266:
	mov	r0, #0x0
.L267:
	pop	{r1}
	bx	r1
.Lfe46:
	.size	 IsSpecialSEPlaying,.Lfe46-IsSpecialSEPlaying

	.lcomm	sCurrentMapMusic,2

	.lcomm	sNextMapMusic,2

	.lcomm	sMapMusicState,1

	.lcomm	sMapMusicFadeInSpeed,1

	.lcomm	sFanfareCounter,2
	.comm	gDisableMusic, 4	@ 1
.text
	.align	2, 0
