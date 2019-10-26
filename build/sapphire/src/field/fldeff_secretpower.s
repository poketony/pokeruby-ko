@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
.text
	.align	2, 0
	.globl	sub_80C6264
	.type	 sub_80C6264,function
	.thumb_func
sub_80C6264:
	push	{lr}
	ldr	r0, .L3
	ldr	r1, .L3+0x4
	ldr	r1, [r1, #0x4]
	bl	sub_80BBFD8
	bl	sub_80BB5E4
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.word	gUnknown_0203923C
	.word	gMapHeader
.Lfe1:
	.size	 sub_80C6264,.Lfe1-sub_80C6264
	.align	2, 0
	.globl	sub_80C6280
	.type	 sub_80C6280,function
	.thumb_func
sub_80C6280:
	push	{lr}
	ldr	r1, .L16
	ldr	r0, [r1, #0x4]
	cmp	r0, #0x2
	beq	.L8	@cond_branch
	cmp	r0, #0x2
	bgt	.L13	@cond_branch
	cmp	r0, #0x1
	beq	.L7	@cond_branch
	b	.L6
.L17:
	.align	2, 0
.L16:
	.word	gFieldEffectArguments
.L13:
	cmp	r0, #0x3
	beq	.L9	@cond_branch
	cmp	r0, #0x4
	beq	.L10	@cond_branch
	b	.L6
.L7:
	mov	r0, #0x8
	str	r0, [r1, #0x14]
	mov	r0, #0x28
	b	.L14
.L8:
	mov	r0, #0x8
	b	.L15
.L9:
	mov	r0, #0x8
	neg	r0, r0
	str	r0, [r1, #0x14]
	mov	r0, #0x18
	b	.L14
.L10:
	mov	r0, #0x18
.L15:
	str	r0, [r1, #0x14]
.L14:
	str	r0, [r1, #0x18]
.L6:
	pop	{r0}
	bx	r0
.Lfe2:
	.size	 sub_80C6280,.Lfe2-sub_80C6280
	.align	2, 0
	.globl	SetUpFieldMove_SecretPower
	.type	 SetUpFieldMove_SecretPower,function
	.thumb_func
SetUpFieldMove_SecretPower:
	push	{r4, lr}
	bl	sub_80BB63C
	ldr	r0, .L27
	ldrh	r0, [r0]
	cmp	r0, #0x1
	beq	.L25	@cond_branch
	bl	player_get_direction_lower_nybble
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x2
	bne	.L25	@cond_branch
	ldr	r4, .L27+0x4
	add	r1, r4, #0x2
	add	r0, r4, #0
	bl	GetXYCoordsOneStepInFrontOfPlayer
	mov	r1, #0x0
	ldrsh	r0, [r4, r1]
	mov	r2, #0x2
	ldrsh	r1, [r4, r2]
	bl	MapGridGetMetatileBehaviorAt
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	add	r0, r4, #0
	bl	MetatileBehavior_IsSecretBaseCave
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	bne	.L21	@cond_branch
	bl	sub_80C6264
	ldr	r1, .L27+0x8
	ldr	r0, .L27+0xc
	str	r0, [r1]
	ldr	r1, .L27+0x10
	ldr	r0, .L27+0x14
	b	.L26
.L28:
	.align	2, 0
.L27:
	.word	gScriptResult
	.word	gUnknown_0203923C
	.word	gFieldCallback
	.word	FieldCallback_Teleport
	.word	gUnknown_03005CE4
	.word	sub_80C639C
.L21:
	add	r0, r4, #0
	bl	MetatileBehavior_IsSecretBaseTree
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	bne	.L22	@cond_branch
	bl	sub_80C6264
	ldr	r1, .L29
	ldr	r0, .L29+0x4
	str	r0, [r1]
	ldr	r1, .L29+0x8
	ldr	r0, .L29+0xc
	b	.L26
.L30:
	.align	2, 0
.L29:
	.word	gFieldCallback
	.word	FieldCallback_Teleport
	.word	gUnknown_03005CE4
	.word	sub_80C64A8
.L22:
	add	r0, r4, #0
	bl	MetatileBehavior_IsSecretBaseShrub
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L23	@cond_branch
.L25:
	mov	r0, #0x0
	b	.L24
.L23:
	bl	sub_80C6264
	ldr	r1, .L31
	ldr	r0, .L31+0x4
	str	r0, [r1]
	ldr	r1, .L31+0x8
	ldr	r0, .L31+0xc
.L26:
	str	r0, [r1]
	mov	r0, #0x1
.L24:
	pop	{r4}
	pop	{r1}
	bx	r1
.L32:
	.align	2, 0
.L31:
	.word	gFieldCallback
	.word	FieldCallback_Teleport
	.word	gUnknown_03005CE4
	.word	sub_80C660C
.Lfe3:
	.size	 SetUpFieldMove_SecretPower,.Lfe3-SetUpFieldMove_SecretPower
	.align	2, 0
	.globl	sub_80C639C
	.type	 sub_80C639C,function
	.thumb_func
sub_80C639C:
	push	{lr}
	ldr	r1, .L34
	ldr	r0, .L34+0x4
	ldrb	r0, [r0]
	str	r0, [r1]
	ldr	r0, .L34+0x8
	bl	ScriptContext1_SetupScript
	pop	{r0}
	bx	r0
.L35:
	.align	2, 0
.L34:
	.word	gFieldEffectArguments
	.word	gLastFieldPokeMenuOpened
	.word	gUnknown_081A2CE6
.Lfe4:
	.size	 sub_80C639C,.Lfe4-sub_80C639C
	.align	2, 0
	.globl	FldEff_UseSecretPowerCave
	.type	 FldEff_UseSecretPowerCave,function
	.thumb_func
FldEff_UseSecretPowerCave:
	push	{lr}
	bl	oei_task_add
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, .L37
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r2, .L37+0x4
	lsr	r0, r2, #0x10
	strh	r0, [r1, #0x18]
	strh	r2, [r1, #0x1a]
	mov	r0, #0x0
	pop	{r1}
	bx	r1
.L38:
	.align	2, 0
.L37:
	.word	gTasks
	.word	sub_80C63E8
.Lfe5:
	.size	 FldEff_UseSecretPowerCave,.Lfe5-FldEff_UseSecretPowerCave
	.align	2, 0
	.globl	sub_80C63E8
	.type	 sub_80C63E8,function
	.thumb_func
sub_80C63E8:
	push	{lr}
	mov	r0, #0xb
	bl	FieldEffectActiveListRemove
	mov	r0, #0x37
	bl	FieldEffectStart
	pop	{r0}
	bx	r0
.Lfe6:
	.size	 sub_80C63E8,.Lfe6-sub_80C63E8
	.align	2, 0
	.globl	FldEff_SecretPowerCave
	.type	 FldEff_SecretPowerCave,function
	.thumb_func
FldEff_SecretPowerCave:
	push	{r4, lr}
	bl	sub_80C6280
	ldr	r0, .L41
	ldr	r3, .L41+0x4
	ldr	r1, .L41+0x8
	ldrb	r1, [r1, #0x4]
	lsl	r2, r1, #0x4
	add	r2, r2, r1
	lsl	r2, r2, #0x2
	add	r2, r2, r3
	ldrh	r1, [r2, #0x2]
	lsl	r1, r1, #0x17
	lsr	r1, r1, #0x17
	ldr	r4, .L41+0xc
	ldr	r3, [r4, #0x14]
	add	r1, r1, r3
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	ldrb	r2, [r2]
	ldr	r3, [r4, #0x18]
	add	r2, r2, r3
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	mov	r3, #0x94
	bl	CreateSprite
	mov	r0, #0x0
	pop	{r4}
	pop	{r1}
	bx	r1
.L42:
	.align	2, 0
.L41:
	.word	gSpriteTemplate_83D2614
	.word	gSprites
	.word	gPlayerAvatar
	.word	gFieldEffectArguments
.Lfe7:
	.size	 FldEff_SecretPowerCave,.Lfe7-FldEff_SecretPowerCave
	.align	2, 0
	.globl	sub_80C644C
	.type	 sub_80C644C,function
	.thumb_func
sub_80C644C:
	push	{r4, lr}
	add	r4, r0, #0
	mov	r0, #0x83
	bl	PlaySE
	mov	r0, #0x0
	strh	r0, [r4, #0x2e]
	ldr	r0, .L44
	str	r0, [r4, #0x1c]
	pop	{r4}
	pop	{r0}
	bx	r0
.L45:
	.align	2, 0
.L44:
	.word	sub_80C6468
.Lfe8:
	.size	 sub_80C644C,.Lfe8-sub_80C644C
	.align	2, 0
	.globl	sub_80C6468
	.type	 sub_80C6468,function
	.thumb_func
sub_80C6468:
	push	{lr}
	add	r1, r0, #0
	ldrh	r2, [r1, #0x2e]
	mov	r3, #0x2e
	ldrsh	r0, [r1, r3]
	cmp	r0, #0x27
	bgt	.L47	@cond_branch
	add	r0, r2, #0x1
	strh	r0, [r1, #0x2e]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x14
	bne	.L49	@cond_branch
	bl	sub_80BB800
	b	.L49
.L47:
	mov	r0, #0x0
	strh	r0, [r1, #0x2e]
	ldr	r0, .L50
	str	r0, [r1, #0x1c]
.L49:
	pop	{r0}
	bx	r0
.L51:
	.align	2, 0
.L50:
	.word	sub_80C6498
.Lfe9:
	.size	 sub_80C6468,.Lfe9-sub_80C6468
	.align	2, 0
	.globl	sub_80C6498
	.type	 sub_80C6498,function
	.thumb_func
sub_80C6498:
	push	{lr}
	mov	r1, #0x37
	bl	FieldEffectStop
	bl	EnableBothScriptContexts
	pop	{r0}
	bx	r0
.Lfe10:
	.size	 sub_80C6498,.Lfe10-sub_80C6498
	.align	2, 0
	.globl	sub_80C64A8
	.type	 sub_80C64A8,function
	.thumb_func
sub_80C64A8:
	push	{lr}
	ldr	r1, .L54
	ldr	r0, .L54+0x4
	ldrb	r0, [r0]
	str	r0, [r1]
	ldr	r0, .L54+0x8
	bl	ScriptContext1_SetupScript
	pop	{r0}
	bx	r0
.L55:
	.align	2, 0
.L54:
	.word	gFieldEffectArguments
	.word	gLastFieldPokeMenuOpened
	.word	gUnknown_081A2D3E
.Lfe11:
	.size	 sub_80C64A8,.Lfe11-sub_80C64A8
	.align	2, 0
	.globl	FldEff_UseSecretPowerTree
	.type	 FldEff_UseSecretPowerTree,function
	.thumb_func
FldEff_UseSecretPowerTree:
	push	{lr}
	bl	oei_task_add
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, .L57
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r2, .L57+0x4
	lsr	r0, r2, #0x10
	strh	r0, [r1, #0x18]
	strh	r2, [r1, #0x1a]
	mov	r0, #0x0
	pop	{r1}
	bx	r1
.L58:
	.align	2, 0
.L57:
	.word	gTasks
	.word	sub_80C64F4
.Lfe12:
	.size	 FldEff_UseSecretPowerTree,.Lfe12-FldEff_UseSecretPowerTree
	.align	2, 0
	.globl	sub_80C64F4
	.type	 sub_80C64F4,function
	.thumb_func
sub_80C64F4:
	push	{lr}
	mov	r0, #0x1a
	bl	FieldEffectActiveListRemove
	mov	r0, #0x38
	bl	FieldEffectStart
	pop	{r0}
	bx	r0
.Lfe13:
	.size	 sub_80C64F4,.Lfe13-sub_80C64F4
	.align	2, 0
	.globl	FldEff_SecretPowerTree
	.type	 FldEff_SecretPowerTree,function
	.thumb_func
FldEff_SecretPowerTree:
	push	{r4, lr}
	ldr	r1, .L65
	mov	r2, #0x0
	ldrsh	r0, [r1, r2]
	mov	r2, #0x2
	ldrsh	r1, [r1, r2]
	bl	MapGridGetMetatileBehaviorAt
	add	r2, r0, #0
	ldr	r1, .L65+0x4
	add	r0, r1, #0
	and	r2, r2, r0
	cmp	r2, #0x96
	bne	.L61	@cond_branch
	ldr	r1, .L65+0x8
	mov	r0, #0x0
	str	r0, [r1, #0x1c]
.L61:
	cmp	r2, #0x9c
	bne	.L62	@cond_branch
	ldr	r1, .L65+0x8
	mov	r0, #0x2
	str	r0, [r1, #0x1c]
.L62:
	bl	sub_80C6280
	ldr	r0, .L65+0xc
	ldr	r3, .L65+0x10
	ldr	r1, .L65+0x14
	ldrb	r1, [r1, #0x4]
	lsl	r2, r1, #0x4
	add	r2, r2, r1
	lsl	r2, r2, #0x2
	add	r2, r2, r3
	ldrh	r1, [r2, #0x2]
	lsl	r1, r1, #0x17
	lsr	r1, r1, #0x17
	ldr	r4, .L65+0x8
	ldr	r3, [r4, #0x14]
	add	r1, r1, r3
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	ldrb	r2, [r2]
	ldr	r3, [r4, #0x18]
	add	r2, r2, r3
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	mov	r3, #0x94
	bl	CreateSprite
	ldr	r0, [r4, #0x1c]
	cmp	r0, #0x1
	beq	.L64	@cond_branch
	cmp	r0, #0x3
	bne	.L63	@cond_branch
.L64:
	bl	sub_80BB800
.L63:
	mov	r0, #0x0
	pop	{r4}
	pop	{r1}
	bx	r1
.L66:
	.align	2, 0
.L65:
	.word	gUnknown_0203923C
	.word	0xfff
	.word	gFieldEffectArguments
	.word	gSpriteTemplate_83D262C
	.word	gSprites
	.word	gPlayerAvatar
.Lfe14:
	.size	 FldEff_SecretPowerTree,.Lfe14-FldEff_SecretPowerTree
	.align	2, 0
	.globl	sub_80C6598
	.type	 sub_80C6598,function
	.thumb_func
sub_80C6598:
	push	{r4, lr}
	add	r4, r0, #0
	mov	r0, #0x9b
	bl	PlaySE
	ldr	r0, .L68
	ldr	r1, [r0, #0x1c]
	add	r2, r4, #0
	add	r2, r2, #0x2a
	mov	r0, #0x0
	strb	r1, [r2]
	strh	r0, [r4, #0x2e]
	ldr	r0, .L68+0x4
	str	r0, [r4, #0x1c]
	pop	{r4}
	pop	{r0}
	bx	r0
.L69:
	.align	2, 0
.L68:
	.word	gFieldEffectArguments
	.word	sub_80C65C4
.Lfe15:
	.size	 sub_80C6598,.Lfe15-sub_80C6598
	.align	2, 0
	.globl	sub_80C65C4
	.type	 sub_80C65C4,function
	.thumb_func
sub_80C65C4:
	push	{r4, lr}
	add	r4, r0, #0
	ldrh	r0, [r4, #0x2e]
	add	r0, r0, #0x1
	strh	r0, [r4, #0x2e]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x27
	ble	.L71	@cond_branch
	ldr	r0, .L74
	ldr	r0, [r0, #0x1c]
	cmp	r0, #0
	beq	.L73	@cond_branch
	cmp	r0, #0x2
	bne	.L72	@cond_branch
.L73:
	bl	sub_80BB800
.L72:
	mov	r0, #0x0
	strh	r0, [r4, #0x2e]
	ldr	r0, .L74+0x4
	str	r0, [r4, #0x1c]
.L71:
	pop	{r4}
	pop	{r0}
	bx	r0
.L75:
	.align	2, 0
.L74:
	.word	gFieldEffectArguments
	.word	sub_80C65FC
.Lfe16:
	.size	 sub_80C65C4,.Lfe16-sub_80C65C4
	.align	2, 0
	.globl	sub_80C65FC
	.type	 sub_80C65FC,function
	.thumb_func
sub_80C65FC:
	push	{lr}
	mov	r1, #0x38
	bl	FieldEffectStop
	bl	EnableBothScriptContexts
	pop	{r0}
	bx	r0
.Lfe17:
	.size	 sub_80C65FC,.Lfe17-sub_80C65FC
	.align	2, 0
	.globl	sub_80C660C
	.type	 sub_80C660C,function
	.thumb_func
sub_80C660C:
	push	{lr}
	ldr	r1, .L78
	ldr	r0, .L78+0x4
	ldrb	r0, [r0]
	str	r0, [r1]
	ldr	r0, .L78+0x8
	bl	ScriptContext1_SetupScript
	pop	{r0}
	bx	r0
.L79:
	.align	2, 0
.L78:
	.word	gFieldEffectArguments
	.word	gLastFieldPokeMenuOpened
	.word	gUnknown_081A2D96
.Lfe18:
	.size	 sub_80C660C,.Lfe18-sub_80C660C
	.align	2, 0
	.globl	FldEff_UseSecretPowerShrub
	.type	 FldEff_UseSecretPowerShrub,function
	.thumb_func
FldEff_UseSecretPowerShrub:
	push	{lr}
	bl	oei_task_add
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, .L81
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r2
	ldr	r2, .L81+0x4
	lsr	r0, r2, #0x10
	strh	r0, [r1, #0x18]
	strh	r2, [r1, #0x1a]
	mov	r0, #0x0
	pop	{r1}
	bx	r1
.L82:
	.align	2, 0
.L81:
	.word	gTasks
	.word	sub_80C6658
.Lfe19:
	.size	 FldEff_UseSecretPowerShrub,.Lfe19-FldEff_UseSecretPowerShrub
	.align	2, 0
	.globl	sub_80C6658
	.type	 sub_80C6658,function
	.thumb_func
sub_80C6658:
	push	{lr}
	mov	r0, #0x1b
	bl	FieldEffectActiveListRemove
	mov	r0, #0x39
	bl	FieldEffectStart
	pop	{r0}
	bx	r0
.Lfe20:
	.size	 sub_80C6658,.Lfe20-sub_80C6658
	.align	2, 0
	.globl	FldEff_SecretPowerShrub
	.type	 FldEff_SecretPowerShrub,function
	.thumb_func
FldEff_SecretPowerShrub:
	push	{r4, lr}
	bl	sub_80C6280
	ldr	r0, .L85
	ldr	r3, .L85+0x4
	ldr	r1, .L85+0x8
	ldrb	r1, [r1, #0x4]
	lsl	r2, r1, #0x4
	add	r2, r2, r1
	lsl	r2, r2, #0x2
	add	r2, r2, r3
	ldrh	r1, [r2, #0x2]
	lsl	r1, r1, #0x17
	lsr	r1, r1, #0x17
	ldr	r4, .L85+0xc
	ldr	r3, [r4, #0x14]
	add	r1, r1, r3
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	ldrb	r2, [r2]
	ldr	r3, [r4, #0x18]
	add	r2, r2, r3
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	mov	r3, #0x94
	bl	CreateSprite
	mov	r0, #0x0
	pop	{r4}
	pop	{r1}
	bx	r1
.L86:
	.align	2, 0
.L85:
	.word	gSpriteTemplate_83D2644
	.word	gSprites
	.word	gPlayerAvatar
	.word	gFieldEffectArguments
.Lfe21:
	.size	 FldEff_SecretPowerShrub,.Lfe21-FldEff_SecretPowerShrub
	.align	2, 0
	.globl	sub_80C66BC
	.type	 sub_80C66BC,function
	.thumb_func
sub_80C66BC:
	push	{r4, lr}
	add	r4, r0, #0
	mov	r0, #0xa9
	bl	PlaySE
	mov	r0, #0x0
	strh	r0, [r4, #0x2e]
	ldr	r0, .L88
	str	r0, [r4, #0x1c]
	pop	{r4}
	pop	{r0}
	bx	r0
.L89:
	.align	2, 0
.L88:
	.word	sub_80C66D8
.Lfe22:
	.size	 sub_80C66BC,.Lfe22-sub_80C66BC
	.align	2, 0
	.globl	sub_80C66D8
	.type	 sub_80C66D8,function
	.thumb_func
sub_80C66D8:
	push	{lr}
	add	r1, r0, #0
	ldrh	r2, [r1, #0x2e]
	mov	r3, #0x2e
	ldrsh	r0, [r1, r3]
	cmp	r0, #0x27
	bgt	.L91	@cond_branch
	add	r0, r2, #0x1
	strh	r0, [r1, #0x2e]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x14
	bne	.L93	@cond_branch
	bl	sub_80BB800
	b	.L93
.L91:
	mov	r0, #0x0
	strh	r0, [r1, #0x2e]
	ldr	r0, .L94
	str	r0, [r1, #0x1c]
.L93:
	pop	{r0}
	bx	r0
.L95:
	.align	2, 0
.L94:
	.word	sub_80C6708
.Lfe23:
	.size	 sub_80C66D8,.Lfe23-sub_80C66D8
	.align	2, 0
	.globl	sub_80C6708
	.type	 sub_80C6708,function
	.thumb_func
sub_80C6708:
	push	{lr}
	mov	r1, #0x39
	bl	FieldEffectStop
	bl	EnableBothScriptContexts
	pop	{r0}
	bx	r0
.Lfe24:
	.size	 sub_80C6708,.Lfe24-sub_80C6708
.text
	.align	2, 0
