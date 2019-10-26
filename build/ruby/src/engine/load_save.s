@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.globl	gSaveBlock2
	.section ewram_data,"aw"
	.align	2, 0
	.type	 gSaveBlock2,object
	.size	 gSaveBlock2,2192
gSaveBlock2:
	.byte	0x0
	.space	7
	.space	2184
	.globl	gSaveBlock1
	.align	2, 0
	.type	 gSaveBlock1,object
	.size	 gSaveBlock1,15040
gSaveBlock1:
	.short	0x0
	.space	2
	.space	15036
	.align	2, 0
	.type	 gLoadedSaveData,object
	.size	 gLoadedSaveData,1240
gLoadedSaveData:
	.short	0x0
	.space	2
	.space	76
	.space	1160
.text
	.align	2, 0
	.globl	CheckForFlashMemory
	.type	 CheckForFlashMemory,function
	.thumb_func
CheckForFlashMemory:
	push	{lr}
	bl	IdentifyFlash
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L3	@cond_branch
	ldr	r1, .L5
	mov	r0, #0x1
	str	r0, [r1]
	bl	InitFlashTimer
	b	.L4
.L6:
	.align	2, 0
.L5:
	.word	gFlashMemoryPresent
.L3:
	ldr	r1, .L7
	mov	r0, #0x0
	str	r0, [r1]
.L4:
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.word	gFlashMemoryPresent
.Lfe1:
	.size	 CheckForFlashMemory,.Lfe1-CheckForFlashMemory
	.align	2, 0
	.globl	GetSecretBase2Field_9
	.type	 GetSecretBase2Field_9,function
	.thumb_func
GetSecretBase2Field_9:
	ldr	r0, .L10
	ldrb	r0, [r0, #0x9]
	bx	lr
.L11:
	.align	2, 0
.L10:
	.word	gSaveBlock2
.Lfe2:
	.size	 GetSecretBase2Field_9,.Lfe2-GetSecretBase2Field_9
	.align	2, 0
	.globl	ClearSecretBase2Field_9
	.type	 ClearSecretBase2Field_9,function
	.thumb_func
ClearSecretBase2Field_9:
	ldr	r1, .L13
	mov	r0, #0x0
	strb	r0, [r1, #0x9]
	bx	lr
.L14:
	.align	2, 0
.L13:
	.word	gSaveBlock2
.Lfe3:
	.size	 ClearSecretBase2Field_9,.Lfe3-ClearSecretBase2Field_9
	.align	2, 0
	.globl	SetSecretBase2Field_9
	.type	 SetSecretBase2Field_9,function
	.thumb_func
SetSecretBase2Field_9:
	ldr	r1, .L16
	mov	r0, #0x1
	strb	r0, [r1, #0x9]
	bx	lr
.L17:
	.align	2, 0
.L16:
	.word	gSaveBlock2
.Lfe4:
	.size	 SetSecretBase2Field_9,.Lfe4-SetSecretBase2Field_9
	.align	2, 0
	.globl	SetSecretBase2Field_9_AndHideBG
	.type	 SetSecretBase2Field_9_AndHideBG,function
	.thumb_func
SetSecretBase2Field_9_AndHideBG:
	push	{lr}
	mov	r0, #0x0
	bl	gpu_sync_bg_hide
	ldr	r1, .L19
	mov	r0, #0x1
	strb	r0, [r1, #0x9]
	pop	{r0}
	bx	r0
.L20:
	.align	2, 0
.L19:
	.word	gSaveBlock2
.Lfe5:
	.size	 SetSecretBase2Field_9_AndHideBG,.Lfe5-SetSecretBase2Field_9_AndHideBG
	.align	2, 0
	.globl	ClearSecretBase2Field_9_2
	.type	 ClearSecretBase2Field_9_2,function
	.thumb_func
ClearSecretBase2Field_9_2:
	ldr	r1, .L22
	mov	r0, #0x0
	strb	r0, [r1, #0x9]
	bx	lr
.L23:
	.align	2, 0
.L22:
	.word	gSaveBlock2
.Lfe6:
	.size	 ClearSecretBase2Field_9_2,.Lfe6-ClearSecretBase2Field_9_2
	.align	2, 0
	.globl	SavePlayerParty
	.type	 SavePlayerParty,function
	.thumb_func
SavePlayerParty:
	push	{r4, r5, r6, lr}
	ldr	r2, .L30
	ldr	r0, .L30+0x4
	ldrb	r1, [r0]
	mov	r3, #0x8d
	lsl	r3, r3, #0x2
	add	r0, r2, r3
	strb	r1, [r0]
	mov	r6, #0x0
	mov	r0, #0x8e
	lsl	r0, r0, #0x2
	add	r5, r2, r0
	mov	r4, #0x0
.L28:
	ldr	r1, .L30+0x8
	add	r1, r4, r1
	add	r0, r5, #0
	mov	r2, #0x64
	bl	memcpy
	add	r5, r5, #0x64
	add	r4, r4, #0x64
	add	r6, r6, #0x1
	cmp	r6, #0x5
	ble	.L28	@cond_branch
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L31:
	.align	2, 0
.L30:
	.word	gSaveBlock1
	.word	gPlayerPartyCount
	.word	gPlayerParty
.Lfe7:
	.size	 SavePlayerParty,.Lfe7-SavePlayerParty
	.align	2, 0
	.globl	LoadPlayerParty
	.type	 LoadPlayerParty,function
	.thumb_func
LoadPlayerParty:
	push	{r4, r5, r6, lr}
	ldr	r0, .L38
	ldr	r1, .L38+0x4
	mov	r2, #0x8d
	lsl	r2, r2, #0x2
	add	r1, r1, r2
	ldrb	r1, [r1]
	strb	r1, [r0]
	ldr	r4, .L38+0x8
	mov	r5, #0x0
	mov	r0, #0xfa
	lsl	r0, r0, #0x1
	add	r6, r4, r0
.L36:
	ldr	r1, .L38+0x4
	add	r1, r5, r1
	mov	r2, #0x8e
	lsl	r2, r2, #0x2
	add	r1, r1, r2
	add	r0, r4, #0
	mov	r2, #0x64
	bl	memcpy
	add	r4, r4, #0x64
	add	r5, r5, #0x64
	cmp	r4, r6
	ble	.L36	@cond_branch
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L39:
	.align	2, 0
.L38:
	.word	gPlayerPartyCount
	.word	gSaveBlock1
	.word	gPlayerParty
.Lfe8:
	.size	 LoadPlayerParty,.Lfe8-LoadPlayerParty
	.align	2, 0
	.type	 SaveMapObjects,function
	.thumb_func
SaveMapObjects:
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L46
	ldr	r4, .L46+0x4
	mov	r1, #0x9e
	lsl	r1, r1, #0x4
	add	r3, r0, r1
	mov	r2, #0xf
.L44:
	add	r1, r3, #0
	add	r0, r4, #0
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	add	r4, r4, #0x24
	add	r3, r3, #0x24
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L44	@cond_branch
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L47:
	.align	2, 0
.L46:
	.word	gSaveBlock1
	.word	gMapObjects
.Lfe9:
	.size	 SaveMapObjects,.Lfe9-SaveMapObjects
	.align	2, 0
	.type	 LoadMapObjects,function
	.thumb_func
LoadMapObjects:
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L54
	mov	r1, #0x9e
	lsl	r1, r1, #0x4
	add	r4, r0, r1
	ldr	r3, .L54+0x4
	mov	r2, #0xf
.L52:
	add	r1, r3, #0
	add	r0, r4, #0
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	add	r4, r4, #0x24
	add	r3, r3, #0x24
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L52	@cond_branch
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L55:
	.align	2, 0
.L54:
	.word	gSaveBlock1
	.word	gMapObjects
.Lfe10:
	.size	 LoadMapObjects,.Lfe10-LoadMapObjects
	.align	2, 0
	.globl	SaveSerializedGame
	.type	 SaveSerializedGame,function
	.thumb_func
SaveSerializedGame:
	push	{lr}
	bl	SavePlayerParty
	bl	SaveMapObjects
	pop	{r0}
	bx	r0
.Lfe11:
	.size	 SaveSerializedGame,.Lfe11-SaveSerializedGame
	.align	2, 0
	.globl	LoadSerializedGame
	.type	 LoadSerializedGame,function
	.thumb_func
LoadSerializedGame:
	push	{lr}
	bl	LoadPlayerParty
	bl	LoadMapObjects
	pop	{r0}
	bx	r0
.Lfe12:
	.size	 LoadSerializedGame,.Lfe12-LoadSerializedGame
	.align	2, 0
	.globl	LoadPlayerBag
	.type	 LoadPlayerBag,function
	.thumb_func
LoadPlayerBag:
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L89
	mov	r1, #0xac
	lsl	r1, r1, #0x3
	add	r3, r0, r1
	ldr	r1, .L89+0x4
	mov	r2, #0x13
.L62:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L62	@cond_branch
	ldr	r1, .L89+0x4
	ldr	r0, .L89
	mov	r2, #0xb6
	lsl	r2, r2, #0x3
	add	r3, r0, r2
	add	r1, r1, #0x50
	mov	r2, #0x13
.L67:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L67	@cond_branch
	ldr	r1, .L89+0x4
	ldr	r0, .L89
	mov	r5, #0xc0
	lsl	r5, r5, #0x3
	add	r3, r0, r5
	add	r1, r1, #0xa0
	mov	r2, #0xf
.L72:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L72	@cond_branch
	ldr	r1, .L89+0x4
	ldr	r0, .L89
	mov	r6, #0xc8
	lsl	r6, r6, #0x3
	add	r3, r0, r6
	add	r1, r1, #0xe0
	mov	r2, #0x3f
.L77:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L77	@cond_branch
	ldr	r1, .L89+0x4
	ldr	r0, .L89
	mov	r7, #0xe8
	lsl	r7, r7, #0x3
	add	r3, r0, r7
	mov	r0, #0xf0
	lsl	r0, r0, #0x1
	add	r1, r1, r0
	mov	r2, #0x2d
.L82:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L82	@cond_branch
	ldr	r0, .L89+0x4
	ldr	r4, .L89
	mov	r1, #0xa6
	lsl	r1, r1, #0x2
	add	r3, r0, r1
	ldr	r2, .L89+0x8
	mov	ip, r2
	mov	r2, #0xf
.L87:
	add	r1, r3, #0
	mov	r5, ip
	add	r0, r4, r5
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	add	r4, r4, #0x24
	add	r3, r3, #0x24
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L87	@cond_branch
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L90:
	.align	2, 0
.L89:
	.word	gSaveBlock1
	.word	gLoadedSaveData
	.word	0x2b4c
.Lfe13:
	.size	 LoadPlayerBag,.Lfe13-LoadPlayerBag
	.align	2, 0
	.globl	SavePlayerBag
	.type	 SavePlayerBag,function
	.thumb_func
SavePlayerBag:
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L122
	ldr	r3, .L122+0x4
	mov	r2, #0xac
	lsl	r2, r2, #0x3
	add	r1, r0, r2
	mov	r2, #0x13
.L95:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L95	@cond_branch
	ldr	r1, .L122
	ldr	r0, .L122+0x4
	add	r3, r0, #0
	add	r3, r3, #0x50
	mov	r5, #0xb6
	lsl	r5, r5, #0x3
	add	r1, r1, r5
	mov	r2, #0x13
.L100:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L100	@cond_branch
	ldr	r1, .L122
	ldr	r0, .L122+0x4
	add	r3, r0, #0
	add	r3, r3, #0xa0
	mov	r6, #0xc0
	lsl	r6, r6, #0x3
	add	r1, r1, r6
	mov	r2, #0xf
.L105:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L105	@cond_branch
	ldr	r1, .L122
	ldr	r0, .L122+0x4
	add	r3, r0, #0
	add	r3, r3, #0xe0
	mov	r7, #0xc8
	lsl	r7, r7, #0x3
	add	r1, r1, r7
	mov	r2, #0x3f
.L110:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L110	@cond_branch
	ldr	r1, .L122
	ldr	r0, .L122+0x4
	mov	r2, #0xf0
	lsl	r2, r2, #0x1
	add	r3, r0, r2
	mov	r5, #0xe8
	lsl	r5, r5, #0x3
	add	r1, r1, r5
	mov	r2, #0x2d
.L115:
	ldmia	r3!, {r0}
	stmia	r1!, {r0}
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L115	@cond_branch
	ldr	r0, .L122
	ldr	r4, .L122+0x4
	ldr	r6, .L122+0x8
	add	r3, r0, r6
	mov	r7, #0xa6
	lsl	r7, r7, #0x2
	mov	ip, r7
	mov	r2, #0xf
.L120:
	add	r1, r3, #0
	mov	r5, ip
	add	r0, r4, r5
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	ldmia	r0!, {r5, r6, r7}
	stmia	r1!, {r5, r6, r7}
	add	r4, r4, #0x24
	add	r3, r3, #0x24
	sub	r2, r2, #0x1
	cmp	r2, #0
	bge	.L120	@cond_branch
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L123:
	.align	2, 0
.L122:
	.word	gSaveBlock1
	.word	gLoadedSaveData
	.word	0x2b4c
.Lfe14:
	.size	 SavePlayerBag,.Lfe14-SavePlayerBag
	.comm	gFlashMemoryPresent, 4	@ 4
.text
	.align	2, 0
