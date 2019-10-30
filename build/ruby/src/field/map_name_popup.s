@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.section ewram_data,"aw"
	.type	 sTaskId,object
	.size	 sTaskId,1
sTaskId:
	.byte	0x0
.text
	.align	2, 0
	.globl	unref_sub_80A2F44
	.type	 unref_sub_80A2F44,function
	.thumb_func
unref_sub_80A2F44:
	push	{lr}
	bl	CloseMenu
	bl	ShowMapNamePopup
	mov	r0, #0x1
	pop	{r1}
	bx	r1
.Lfe1:
	.size	 unref_sub_80A2F44,.Lfe1-unref_sub_80A2F44
	.align	2, 0
	.globl	ShowMapNamePopup
	.type	 ShowMapNamePopup,function
	.thumb_func
ShowMapNamePopup:
	push	{r4, r5, lr}
	mov	r0, #0x80
	lsl	r0, r0, #0x7
	bl	FlagGet
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L4	@cond_branch
	ldr	r4, .L8
	add	r0, r4, #0
	bl	FuncIsActiveTask
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0
	bne	.L5	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x5a
	bl	CreateTask
	ldr	r4, .L8+0x4
	strb	r0, [r4]
	ldr	r1, .L8+0x8
	mov	r0, #0x20
	strh	r0, [r1]
	bl	DrawMapNamePopup
	ldr	r2, .L8+0xc
	ldrb	r1, [r4]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	add	r0, r0, r2
	strh	r5, [r0, #0x8]
	ldrb	r1, [r4]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	add	r0, r0, r2
	mov	r1, #0x20
	strh	r1, [r0, #0xc]
	b	.L4
.L9:
	.align	2, 0
.L8:
	.word	Task_MapNamePopup
	.word	sTaskId
	.word	0x4000012
	.word	gTasks
.L5:
	ldr	r3, .L10
	ldr	r2, .L10+0x4
	ldrb	r0, [r2]
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r3
	mov	r4, #0x8
	ldrsh	r0, [r1, r4]
	cmp	r0, #0x2
	beq	.L7	@cond_branch
	mov	r0, #0x2
	strh	r0, [r1, #0x8]
.L7:
	ldrb	r0, [r2]
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	add	r1, r1, r3
	mov	r0, #0x1
	strh	r0, [r1, #0xe]
.L4:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L11:
	.align	2, 0
.L10:
	.word	gTasks
	.word	sTaskId
.Lfe2:
	.size	 ShowMapNamePopup,.Lfe2-ShowMapNamePopup
	.align	2, 0
	.type	 Task_MapNamePopup,function
	.thumb_func
Task_MapNamePopup:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	lsl	r1, r1, #0x3
	ldr	r3, .L26
	add	r4, r1, r3
	mov	r0, #0x8
	ldrsh	r2, [r4, r0]
	cmp	r2, #0x1
	beq	.L16	@cond_branch
	cmp	r2, #0x1
	bgt	.L25	@cond_branch
	cmp	r2, #0
	beq	.L14	@cond_branch
	b	.L13
.L27:
	.align	2, 0
.L26:
	.word	gTasks
.L25:
	cmp	r2, #0x2
	beq	.L18	@cond_branch
	cmp	r2, #0x4
	beq	.L22	@cond_branch
	b	.L13
.L14:
	ldrh	r0, [r4, #0xc]
	sub	r0, r0, #0x2
	strh	r0, [r4, #0xc]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bgt	.L13	@cond_branch
	mov	r0, #0x1
	strh	r0, [r4, #0x8]
	ldr	r0, .L28
	ldrb	r1, [r0]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	add	r0, r0, r3
	strh	r2, [r0, #0xa]
	b	.L13
.L29:
	.align	2, 0
.L28:
	.word	sTaskId
.L16:
	ldrh	r0, [r4, #0xa]
	add	r0, r0, #0x1
	strh	r0, [r4, #0xa]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x78
	ble	.L13	@cond_branch
	mov	r0, #0x0
	strh	r0, [r4, #0xa]
	mov	r0, #0x2
	strh	r0, [r4, #0x8]
	b	.L13
.L18:
	ldrh	r0, [r4, #0xc]
	add	r0, r0, #0x2
	mov	r5, #0x0
	strh	r0, [r4, #0xc]
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x1f
	ble	.L13	@cond_branch
	mov	r1, #0xe
	ldrsh	r0, [r4, r1]
	cmp	r0, #0
	beq	.L20	@cond_branch
	bl	DrawMapNamePopup
	strh	r5, [r4, #0x8]
	strh	r5, [r4, #0xe]
	b	.L13
.L20:
	mov	r0, #0x4
	strh	r0, [r4, #0x8]
	b	.L12
.L22:
	bl	HideMapNamePopup
	b	.L12
.L13:
	ldr	r1, .L30
	ldrh	r0, [r4, #0xc]
	strh	r0, [r1]
.L12:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L31:
	.align	2, 0
.L30:
	.word	0x4000012
.Lfe3:
	.size	 Task_MapNamePopup,.Lfe3-Task_MapNamePopup
	.align	2, 0
	.globl	HideMapNamePopup
	.type	 HideMapNamePopup,function
	.thumb_func
HideMapNamePopup:
	push	{lr}
	ldr	r0, .L34
	bl	FuncIsActiveTask
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L33	@cond_branch
	bl	MenuLoadTextWindowGraphics
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xd
	mov	r3, #0x3
	bl	MenuZeroFillWindowRect
	ldr	r1, .L34+0x4
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r0, .L34+0x8
	ldrb	r0, [r0]
	bl	DestroyTask
.L33:
	pop	{r0}
	bx	r0
.L35:
	.align	2, 0
.L34:
	.word	Task_MapNamePopup
	.word	0x4000012
	.word	sTaskId
.Lfe4:
	.size	 HideMapNamePopup,.Lfe4-HideMapNamePopup
	.align	2, 0
	.type	 DrawMapNamePopup,function
	.thumb_func
DrawMapNamePopup:
	push	{lr}
	add	sp, sp, #0xffffffec
	mov	r0, #0x0
	bl	MenuLoadTextWindowGraphics_OverrideFrameType
	ldr	r0, .L37
	ldrb	r1, [r0, #0x14]
	mov	r0, sp
	mov	r2, #0x0
	bl	GetMapSectionName
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0xd
	mov	r3, #0x3
	bl	MenuDrawTextWindow
	mov	r0, sp
	mov	r1, #0x1
	mov	r2, #0x1
	mov	r3, #0x60
	bl	sub_8072BD8
	add	sp, sp, #0x14
	pop	{r0}
	bx	r0
.L38:
	.align	2, 0
.L37:
	.word	gMapHeader
.Lfe5:
	.size	 DrawMapNamePopup,.Lfe5-DrawMapNamePopup
.text
	.align	2, 0