@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
.text
	.align	2, 0
	.globl	HandleReadMail
	.type	 HandleReadMail,function
	.thumb_func
HandleReadMail:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	add	r4, r0, #0
	add	r6, r1, #0
	lsl	r2, r2, #0x18
	lsr	r5, r2, #0x18
	ldr	r2, .L20
	add	r1, r2, #0
	add	r1, r1, #0xff
	mov	r0, #0x2
	strb	r0, [r1]
	add	r0, r0, #0xfe
	add	r1, r2, r0
	mov	r0, #0x1
	strb	r0, [r1]
	mov	r0, #0x82
	lsl	r0, r0, #0x1
	add	r1, r2, r0
	ldr	r0, .L20+0x4
	str	r0, [r1]
	mov	r0, #0x84
	lsl	r0, r0, #0x1
	add	r1, r2, r0
	ldr	r0, .L20+0x8
	str	r0, [r1]
	ldrh	r1, [r4, #0x20]
	add	r0, r1, #0
	sub	r0, r0, #0x79
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, #0xb
	bhi	.L3	@cond_branch
	sub	r1, r1, #0x79
	add	r0, r2, #0
	add	r0, r0, #0xfa
	strb	r1, [r0]
	b	.L4
.L21:
	.align	2, 0
.L20:
	.word	gSharedMem
	.word	EasyChat_GetWordText
	.word	ConvertEasyChatWordsToString
.L3:
	add	r1, r2, #0
	add	r1, r1, #0xfa
	mov	r0, #0x0
	strb	r0, [r1]
	mov	r5, #0x0
.L4:
	ldr	r1, .L22
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r1, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L7	@cond_branch
	cmp	r0, #0x1
	beq	.L8	@cond_branch
.L7:
	mov	r0, #0x86
	lsl	r0, r0, #0x1
	add	r2, r1, r0
	add	r0, r1, #0
	add	r0, r0, #0xfa
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	ldr	r1, .L22+0x4
	b	.L17
.L23:
	.align	2, 0
.L22:
	.word	gSharedMem
	.word	gUnknown_083E5730
.L8:
	mov	r0, #0x86
	lsl	r0, r0, #0x1
	add	r2, r1, r0
	add	r0, r1, #0
	add	r0, r0, #0xfa
	ldrb	r0, [r0]
	lsl	r0, r0, #0x3
	ldr	r1, .L24
.L17:
	add	r0, r0, r1
	str	r0, [r2]
	ldrh	r0, [r4, #0x1e]
	mov	r1, sp
	bl	MailSpeciesToSpecies
	lsl	r0, r0, #0x10
	ldr	r1, .L24+0x4
	add	r0, r0, r1
	mov	r1, #0xcd
	lsl	r1, r1, #0x11
	cmp	r0, r1
	bhi	.L10	@cond_branch
	ldr	r0, .L24+0x8
	add	r1, r0, #0
	add	r1, r1, #0xfa
	ldrb	r2, [r1]
	add	r1, r0, #0
	cmp	r2, #0x6
	beq	.L12	@cond_branch
	cmp	r2, #0x9
	beq	.L13	@cond_branch
	b	.L18
.L25:
	.align	2, 0
.L24:
	.word	gUnknown_083E57A4
	.word	0xffff0000
	.word	gSharedMem
.L12:
	add	r2, r1, #0
	add	r2, r2, #0xfb
	mov	r0, #0x1
	b	.L19
.L13:
	add	r2, r1, #0
	add	r2, r2, #0xfb
	mov	r0, #0x2
	b	.L19
.L10:
	ldr	r1, .L26
.L18:
	add	r2, r1, #0
	add	r2, r2, #0xfb
	mov	r0, #0x0
.L19:
	strb	r0, [r2]
	add	r0, r1, #0
	add	r0, r0, #0xf4
	str	r4, [r0]
	sub	r0, r0, #0x8
	str	r6, [r0]
	add	r0, r0, #0xc
	strb	r5, [r0]
	ldr	r0, .L26+0x4
	bl	SetMainCallback2
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L27:
	.align	2, 0
.L26:
	.word	gSharedMem
	.word	sub_80F8D50
.Lfe1:
	.size	 HandleReadMail,.Lfe1-HandleReadMail
	.align	2, 0
	.type	 sub_80F8A28,function
	.thumb_func
sub_80F8A28:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffff8
	ldr	r0, .L63
	ldr	r1, .L63+0x4
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0x12
	bls	.LCB209
	b	.L61	@long jump
.LCB209:
	lsl	r0, r0, #0x2
	ldr	r1, .L63+0x8
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L64:
	.align	2, 0
.L63:
	.word	gMain
	.word	0x43c
	.word	.L59
	.align	2, 0
	.align	2, 0
.L59:
	.word	.L30
	.word	.L31
	.word	.L32
	.word	.L33
	.word	.L34
	.word	.L35
	.word	.L36
	.word	.L37
	.word	.L38
	.word	.L40
	.word	.L41
	.word	.L42
	.word	.L43
	.word	.L44
	.word	.L45
	.word	.L47
	.word	.L49
	.word	.L55
	.word	.L57
.L30:
	mov	r0, #0x0
	bl	SetVBlankCallback
	bl	remove_some_task
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	mov	r0, #0x0
	strh	r0, [r1]
	b	.L29
.L31:
	add	r1, sp, #0x4
	mov	r0, #0x0
	strh	r0, [r1]
	mov	r1, #0xe0
	lsl	r1, r1, #0x13
	ldr	r2, .L65
	add	r0, sp, #0x4
	bl	CpuSet
	b	.L29
.L66:
	.align	2, 0
.L65:
	.word	0x1000200
.L32:
	bl	ResetPaletteFade
	b	.L29
.L33:
	bl	ResetTasks
	b	.L29
.L34:
	bl	ResetSpriteData
	b	.L29
.L35:
	bl	FreeAllSpritePalettes
	ldr	r0, .L67
	mov	r1, #0x0
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	add	r0, r0, #0x4
	strh	r1, [r0]
	sub	r0, r0, #0x2
	strh	r1, [r0]
	add	r0, r0, #0x4
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	add	r0, r0, #0x32
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	b	.L29
.L68:
	.align	2, 0
.L67:
	.word	0x4000010
.L36:
	ldr	r0, .L69
	bl	SetUpWindowConfig
	b	.L29
.L70:
	.align	2, 0
.L69:
	.word	gWindowConfig_81E6DFC
.L37:
	ldr	r0, .L71
	bl	MultistepInitMenuWindowBegin
	b	.L29
.L72:
	.align	2, 0
.L71:
	.word	gWindowConfig_81E6DFC
.L38:
	bl	MultistepInitMenuWindowContinue
	cmp	r0, #0
	beq	.LCB331
	b	.L29	@long jump
.LCB331:
	b	.L61
.L40:
	bl	MenuZeroFillScreen
	b	.L29
.L41:
	mov	r0, sp
	add	r0, r0, #0x6
	mov	r1, #0x1
	strh	r1, [r0]
	ldr	r1, .L73
	ldr	r2, .L73+0x4
	bl	CpuSet
	b	.L29
.L74:
	.align	2, 0
.L73:
	.word	0x6004800
	.word	0x1000400
.L42:
	ldr	r2, .L75
	ldr	r0, .L75+0x4
	add	r0, r0, #0xfa
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldr	r0, [r0]
	mov	r1, #0x0
	mov	r2, #0x20
	bl	LoadPalette
	b	.L29
.L76:
	.align	2, 0
.L75:
	.word	gMailGraphicsTable
	.word	gSharedMem
.L43:
	ldr	r2, .L77
	ldr	r0, .L77+0x4
	add	r0, r0, #0xfa
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r2, r2, #0x8
	add	r0, r0, r2
	ldr	r0, [r0]
	ldr	r1, .L77+0x8
	bl	LZ77UnCompVram
	b	.L29
.L78:
	.align	2, 0
.L77:
	.word	gMailGraphicsTable
	.word	gSharedMem
	.word	0x6004000
.L44:
	ldr	r5, .L79
	ldr	r4, .L79+0x4
	add	r4, r4, #0xfa
	ldrb	r1, [r4]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r1, r5, #0x4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0xc0
	lsl	r1, r1, #0x13
	bl	LZ77UnCompVram
	ldr	r3, .L79+0x8
	ldrb	r1, [r4]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r5
	ldrh	r0, [r0, #0x10]
	mov	r2, #0xf1
	lsl	r2, r2, #0x1
	add	r1, r3, r2
	strh	r0, [r1]
	ldrb	r1, [r4]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r5
	ldrh	r1, [r0, #0x12]
	add	r2, r2, #0xe
	add	r0, r3, r2
	strh	r1, [r0]
	ldr	r1, .L79+0xc
	ldr	r2, .L79+0x10
	ldrb	r0, [r2, #0x8]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldrh	r0, [r0]
	strh	r0, [r3, #0x14]
	ldrb	r0, [r2, #0x8]
	lsl	r0, r0, #0x2
	add	r1, r1, #0x2
	add	r0, r0, r1
	ldrh	r0, [r0]
	strh	r0, [r3, #0x16]
	b	.L29
.L80:
	.align	2, 0
.L79:
	.word	gMailGraphicsTable
	.word	gSharedMem
	.word	gPlttBufferUnfaded
	.word	gUnknown_083E562C
	.word	gSaveBlock2
.L45:
	ldr	r0, .L81
	add	r0, r0, #0xf8
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.LCB479
	b	.L29	@long jump
.LCB479:
	bl	sub_80F8DA0
	b	.L29
.L82:
	.align	2, 0
.L81:
	.word	gSharedMem
.L47:
	ldr	r0, .L83
	add	r0, r0, #0xf8
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L48	@cond_branch
	bl	sub_80F8E80
.L48:
	ldr	r0, .L83+0x4
	bl	SetVBlankCallback
	ldr	r2, .L83+0x8
	ldrb	r0, [r2, #0x8]
	mov	r1, #0x80
	orr	r0, r0, r1
	strb	r0, [r2, #0x8]
	b	.L29
.L84:
	.align	2, 0
.L83:
	.word	gSharedMem
	.word	sub_80F8F18
	.word	gPaletteFade
.L49:
	ldr	r5, .L85
	add	r0, r5, #0
	add	r0, r0, #0xf4
	ldr	r0, [r0]
	ldrh	r0, [r0, #0x1e]
	bl	sub_809D4A8
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	add	r0, r5, #0
	add	r0, r0, #0xfb
	ldrb	r0, [r0]
	cmp	r0, #0x1
	beq	.L51	@cond_branch
	cmp	r0, #0x2
	beq	.L52	@cond_branch
	b	.L29
.L86:
	.align	2, 0
.L85:
	.word	gSharedMem
.L51:
	add	r0, r4, #0
	bl	sub_809D580
	ldr	r1, .L87
	mov	r0, #0x0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r2, #0x60
	b	.L62
.L88:
	.align	2, 0
.L87:
	.word	SpriteCallbackDummy
.L52:
	add	r0, r4, #0
	bl	sub_809D580
	ldr	r1, .L89
	mov	r0, #0x0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r2, #0x28
.L62:
	mov	r3, #0x80
	bl	sub_809D3A4
	add	r1, r5, #0
	add	r1, r1, #0xfc
	strb	r0, [r1]
	b	.L29
.L90:
	.align	2, 0
.L89:
	.word	SpriteCallbackDummy
.L55:
	bl	sub_8055870
	cmp	r0, #0x1
	bne	.L29	@cond_branch
	b	.L61
.L57:
	ldr	r1, .L91
	ldr	r2, .L91+0x4
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r2, .L91+0x8
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r2, .L91+0xc
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x44
	mov	r0, #0x0
	strh	r0, [r1]
	sub	r1, r1, #0x50
	mov	r2, #0xba
	lsl	r2, r2, #0x5
	add	r0, r2, #0
	strh	r0, [r1]
	mov	r0, #0x1
	neg	r0, r0
	mov	r1, #0x0
	str	r1, [sp]
	mov	r2, #0x10
	mov	r3, #0x0
	bl	BeginNormalPaletteFade
	ldr	r2, .L91+0x10
	ldrb	r1, [r2, #0x8]
	mov	r0, #0x7f
	and	r0, r0, r1
	strb	r0, [r2, #0x8]
	ldr	r0, .L91+0x14
	add	r0, r0, #0xf0
	ldr	r1, .L91+0x18
	str	r1, [r0]
	mov	r0, #0x1
	b	.L60
.L92:
	.align	2, 0
.L91:
	.word	0x4000008
	.word	0x9f08
	.word	0x801
	.word	0x902
	.word	gPaletteFade
	.word	gSharedMem
	.word	sub_80F8F58
.L29:
	ldr	r1, .L93
	ldr	r0, .L93+0x4
	add	r1, r1, r0
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
.L61:
	mov	r0, #0x0
.L60:
	add	sp, sp, #0x8
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L94:
	.align	2, 0
.L93:
	.word	gMain
	.word	0x43c
.Lfe2:
	.size	 sub_80F8A28,.Lfe2-sub_80F8A28
	.align	2, 0
	.type	 sub_80F8D50,function
	.thumb_func
sub_80F8D50:
	push	{lr}
.L96:
	bl	sub_80F8A28
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	bne	.L98	@cond_branch
	ldr	r0, .L102
	bl	SetMainCallback2
	b	.L95
.L103:
	.align	2, 0
.L102:
	.word	sub_80F8F2C
.L98:
	bl	sub_80F9344
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	bne	.L96	@cond_branch
.L95:
	pop	{r0}
	bx	r0
.Lfe3:
	.size	 sub_80F8D50,.Lfe3-sub_80F8D50
	.align	2, 0
	.type	 sub_80F8D7C,function
	.thumb_func
sub_80F8D7C:
	push	{r4, lr}
	add	r4, r0, #0
	bl	StringCopy
	add	r0, r4, #0
	bl	SanitizeNameString
	add	r0, r4, #0
	bl	StringLength
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	add	r4, r4, r0
	add	r0, r4, #0
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe4:
	.size	 sub_80F8D7C,.Lfe4-sub_80F8D7C
	.align	2, 0
	.type	 sub_80F8DA0,function
	.thumb_func
sub_80F8DA0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	mov	r6, #0x0
	mov	r5, #0x0
	ldr	r2, .L114
	mov	r0, #0x86
	lsl	r0, r0, #0x1
	add	r1, r2, r0
	ldr	r0, [r1]
	ldrb	r0, [r0]
	cmp	r5, r0
	bcs	.L107	@cond_branch
	mov	r8, r2
	add	r7, r1, #0
.L109:
	lsl	r0, r5, #0x3
	sub	r0, r0, r5
	lsl	r0, r0, #0x2
	sub	r0, r0, r5
	add	r0, r0, r8
	mov	r1, r8
	add	r1, r1, #0xf4
	lsl	r2, r6, #0x1
	ldr	r1, [r1]
	add	r1, r1, r2
	ldr	r2, [r7]
	ldr	r2, [r2, #0x4]
	lsl	r4, r5, #0x2
	add	r2, r4, r2
	ldr	r2, [r2]
	lsl	r2, r2, #0x1c
	lsr	r2, r2, #0x1e
	mov	r3, #0x1
	bl	ConvertEasyChatWordsToString
	ldr	r1, [r7]
	ldr	r0, [r1, #0x4]
	add	r4, r4, r0
	ldr	r0, [r4]
	lsl	r0, r0, #0x1c
	lsr	r0, r0, #0x1e
	add	r0, r6, r0
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	add	r0, r5, #0x1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	ldrb	r1, [r1]
	cmp	r5, r1
	bcc	.L109	@cond_branch
.L107:
	ldr	r2, .L114+0x4
	add	r4, r2, #0
	sub	r4, r4, #0xd8
	add	r0, r2, #0
	add	r0, r0, #0x28
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L111	@cond_branch
	ldr	r1, [r2, #0x1c]
	add	r1, r1, #0x12
	add	r0, r2, #0
	bl	sub_80F8D7C
	add	r2, r0, #0
	ldr	r1, .L114+0x8
	bl	StringCopy
	ldr	r0, .L114+0x4
	bl	StringLength
	mov	r2, #0x86
	lsl	r2, r2, #0x1
	add	r1, r4, r2
	ldr	r1, [r1]
	ldrb	r1, [r1, #0x2]
	sub	r1, r1, r0
	b	.L113
.L115:
	.align	2, 0
.L114:
	.word	gSharedMem
	.word	gSharedMem+0xd8
	.word	gOtherText_From
.L111:
	ldr	r1, .L116
	add	r0, r2, #0
	bl	StringCopy
	add	r2, r0, #0
	add	r0, r4, #0
	add	r0, r0, #0xf4
	ldr	r1, [r0]
	add	r1, r1, #0x12
	add	r0, r2, #0
	bl	sub_80F8D7C
	mov	r1, #0x86
	lsl	r1, r1, #0x1
	add	r0, r4, r1
	ldr	r0, [r0]
	ldrb	r1, [r0, #0x2]
.L113:
	add	r0, r4, #0
	add	r0, r0, #0xf9
	strb	r1, [r0]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L117:
	.align	2, 0
.L116:
	.word	gOtherText_From
.Lfe5:
	.size	 sub_80F8DA0,.Lfe5-sub_80F8DA0
	.align	2, 0
	.type	 sub_80F8E80,function
	.thumb_func
sub_80F8E80:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	mov	r6, #0x0
	mov	r4, #0x0
	ldr	r1, .L126
	mov	r0, #0x86
	lsl	r0, r0, #0x1
	add	r2, r1, r0
	ldr	r0, [r2]
	ldrb	r0, [r0]
	cmp	r4, r0
	bcs	.L120	@cond_branch
	mov	r8, r1
	add	r7, r2, #0
.L122:
	lsl	r0, r4, #0x3
	sub	r0, r0, r4
	lsl	r0, r0, #0x2
	sub	r0, r0, r4
	mov	r1, r8
	add	r5, r0, r1
	ldrb	r0, [r5]
	cmp	r0, #0xff
	beq	.L121	@cond_branch
	cmp	r0, #0
	beq	.L121	@cond_branch
	ldr	r2, [r7]
	ldr	r1, [r2, #0x4]
	lsl	r0, r4, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	lsl	r3, r0, #0x18
	lsr	r3, r3, #0x1c
	lsl	r0, r0, #0x1e
	lsr	r0, r0, #0x1e
	add	r0, r6, r0
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	ldrb	r2, [r2, #0x3]
	lsr	r1, r2, #0x4
	add	r1, r1, r3
	lsl	r2, r2, #0x1c
	lsr	r2, r2, #0x1c
	add	r2, r6, r2
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r0, r5, #0
	bl	MenuPrint
	add	r0, r6, #0x2
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
.L121:
	add	r0, r4, #0x1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	ldr	r0, [r7]
	ldrb	r0, [r0]
	cmp	r4, r0
	bcc	.L122	@cond_branch
.L120:
	ldr	r0, .L126+0x4
	add	r1, r0, #0
	add	r1, r1, #0x21
	ldrb	r1, [r1]
	ldr	r2, [r0, #0x34]
	ldrb	r2, [r2, #0x1]
	bl	MenuPrint
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L127:
	.align	2, 0
.L126:
	.word	gSharedMem
	.word	gSharedMem+0xd8
.Lfe6:
	.size	 sub_80F8E80,.Lfe6-sub_80F8E80
	.align	2, 0
	.type	 sub_80F8F18,function
	.thumb_func
sub_80F8F18:
	push	{lr}
	bl	LoadOam
	bl	ProcessSpriteCopyRequests
	bl	TransferPlttBuffer
	pop	{r0}
	bx	r0
.Lfe7:
	.size	 sub_80F8F18,.Lfe7-sub_80F8F18
	.align	2, 0
	.type	 sub_80F8F2C,function
	.thumb_func
sub_80F8F2C:
	push	{r4, lr}
	ldr	r4, .L131
	add	r0, r4, #0
	add	r0, r0, #0xfb
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L130	@cond_branch
	bl	AnimateSprites
	bl	BuildOamBuffer
.L130:
	add	r0, r4, #0
	add	r0, r0, #0xf0
	ldr	r0, [r0]
	bl	_call_via_r0
	pop	{r4}
	pop	{r0}
	bx	r0
.L132:
	.align	2, 0
.L131:
	.word	gSharedMem
.Lfe8:
	.size	 sub_80F8F2C,.Lfe8-sub_80F8F2C
	.align	2, 0
	.type	 sub_80F8F58,function
	.thumb_func
sub_80F8F58:
	push	{lr}
	bl	UpdatePaletteFade
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L134	@cond_branch
	ldr	r0, .L135
	add	r0, r0, #0xf0
	ldr	r1, .L135+0x4
	str	r1, [r0]
.L134:
	pop	{r0}
	bx	r0
.L136:
	.align	2, 0
.L135:
	.word	gSharedMem
	.word	sub_80F8F78
.Lfe9:
	.size	 sub_80F8F58,.Lfe9-sub_80F8F58
	.align	2, 0
	.type	 sub_80F8F78,function
	.thumb_func
sub_80F8F78:
	push	{lr}
	add	sp, sp, #0xfffffffc
	ldr	r0, .L139
	ldrh	r1, [r0, #0x2e]
	mov	r0, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L138	@cond_branch
	mov	r0, #0x1
	neg	r0, r0
	mov	r1, #0x0
	str	r1, [sp]
	mov	r2, #0x0
	mov	r3, #0x10
	bl	BeginNormalPaletteFade
	ldr	r0, .L139+0x4
	add	r0, r0, #0xf0
	ldr	r1, .L139+0x8
	str	r1, [r0]
.L138:
	add	sp, sp, #0x4
	pop	{r0}
	bx	r0
.L140:
	.align	2, 0
.L139:
	.word	gMain
	.word	gSharedMem
	.word	sub_80F8FB4
.Lfe10:
	.size	 sub_80F8F78,.Lfe10-sub_80F8F78
	.align	2, 0
	.type	 sub_80F8FB4,function
	.thumb_func
sub_80F8FB4:
	push	{r4, lr}
	bl	UpdatePaletteFade
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L141	@cond_branch
	ldr	r4, .L148
	add	r0, r4, #0
	add	r0, r0, #0xec
	ldr	r0, [r0]
	bl	SetMainCallback2
	add	r0, r4, #0
	add	r0, r0, #0xfb
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bgt	.L143	@cond_branch
	cmp	r0, #0x1
	blt	.L143	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0xf4
	ldr	r0, [r0]
	ldrh	r0, [r0, #0x1e]
	bl	sub_809D4A8
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	sub_809D608
	add	r0, r4, #0
	add	r0, r0, #0xfc
	ldrb	r1, [r0]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, .L148+0x4
	add	r0, r0, r1
	bl	sub_809D510
.L143:
	ldr	r0, .L148
	mov	r2, #0x88
	lsl	r2, r2, #0x1
	mov	r1, #0x0
	bl	memset
	bl	ResetPaletteFade
.L141:
	pop	{r4}
	pop	{r0}
	bx	r0
.L149:
	.align	2, 0
.L148:
	.word	gSharedMem
	.word	gSprites
.Lfe11:
	.size	 sub_80F8FB4,.Lfe11-sub_80F8FB4
.text
	.align	2, 0
