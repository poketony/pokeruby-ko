@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.section .rodata
	.align	2, 0
	.type	 gUnknown_083761F0,object
	.size	 gUnknown_083761F0,160
gUnknown_083761F0:
	.word	gTextWindowFrame1_Gfx
	.word	gTextWindowFrame1_Pal
	.word	gTextWindowFrame2_Gfx
	.word	gTextWindowFrame2_Pal
	.word	gTextWindowFrame3_Gfx
	.word	gTextWindowFrame3_Pal
	.word	gTextWindowFrame4_Gfx
	.word	gTextWindowFrame4_Pal
	.word	gTextWindowFrame5_Gfx
	.word	gTextWindowFrame5_Pal
	.word	gTextWindowFrame6_Gfx
	.word	gTextWindowFrame6_Pal
	.word	gTextWindowFrame7_Gfx
	.word	gTextWindowFrame7_Pal
	.word	gTextWindowFrame8_Gfx
	.word	gTextWindowFrame8_Pal
	.word	gTextWindowFrame9_Gfx
	.word	gTextWindowFrame9_Pal
	.word	gTextWindowFrame10_Gfx
	.word	gTextWindowFrame10_Pal
	.word	gTextWindowFrame11_Gfx
	.word	gTextWindowFrame11_Pal
	.word	gTextWindowFrame12_Gfx
	.word	gTextWindowFrame12_Pal
	.word	gTextWindowFrame13_Gfx
	.word	gTextWindowFrame13_Pal
	.word	gTextWindowFrame14_Gfx
	.word	gTextWindowFrame14_Pal
	.word	gTextWindowFrame15_Gfx
	.word	gTextWindowFrame15_Pal
	.word	gTextWindowFrame16_Gfx
	.word	gTextWindowFrame16_Pal
	.word	gTextWindowFrame17_Gfx
	.word	gTextWindowFrame17_Pal
	.word	gTextWindowFrame18_Gfx
	.word	gTextWindowFrame18_Pal
	.word	gTextWindowFrame19_Gfx
	.word	gTextWindowFrame19_Pal
	.word	gTextWindowFrame20_Gfx
	.word	gTextWindowFrame20_Pal
	.align	1, 0
	.type	 gMessageBoxTilemap,object
	.size	 gMessageBoxTilemap,70
gMessageBoxTilemap:
	.short	0x1
	.short	0x2
	.short	0x3
	.short	0x4
	.short	0x5
	.short	0x402
	.short	0x6
	.short	0x7
	.short	0xd
	.short	0x9
	.short	0x9
	.short	0x9
	.short	0x40d
	.short	0xa
	.short	0x7
	.short	0x8
	.short	0x9
	.short	0x9
	.short	0x9
	.short	0x408
	.short	0xa
	.short	0x7
	.short	0x80d
	.short	0x809
	.short	0x9
	.short	0x9
	.short	0xc0d
	.short	0xa
	.short	0x801
	.short	0x802
	.short	0x803
	.short	0x804
	.short	0x805
	.short	0xc02
	.short	0x806
.text
	.align	2, 0
	.globl	SetTextWindowBaseTileNum
	.type	 SetTextWindowBaseTileNum,function
	.thumb_func
SetTextWindowBaseTileNum:
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	ldr	r1, .L3
	strh	r0, [r1]
	add	r0, r0, #0x9
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bx	lr
.L4:
	.align	2, 0
.L3:
	.word	sTextWindowBaseTileNum
.Lfe1:
	.size	 SetTextWindowBaseTileNum,.Lfe1-SetTextWindowBaseTileNum
	.align	2, 0
	.globl	LoadTextWindowGraphics
	.type	 LoadTextWindowGraphics,function
	.thumb_func
LoadTextWindowGraphics:
	push	{r4, lr}
	ldr	r1, [r0, #0x2c]
	ldr	r0, .L6
	ldrh	r0, [r0]
	lsl	r0, r0, #0x5
	ldr	r1, [r1, #0x10]
	add	r1, r1, r0
	ldr	r4, .L6+0x4
	ldrb	r0, [r4, #0x14]
	lsr	r0, r0, #0x3
	bl	LoadTextWindowTiles
	ldrb	r0, [r4, #0x14]
	lsr	r0, r0, #0x3
	mov	r1, #0xe
	bl	LoadTextWindowPalette
	pop	{r4}
	pop	{r0}
	bx	r0
.L7:
	.align	2, 0
.L6:
	.word	sTextWindowBaseTileNum
	.word	gSaveBlock2
.Lfe2:
	.size	 LoadTextWindowGraphics,.Lfe2-LoadTextWindowGraphics
	.align	2, 0
	.globl	LoadTextWindowGraphics_OverridePalSlot
	.type	 LoadTextWindowGraphics_OverridePalSlot,function
	.thumb_func
LoadTextWindowGraphics_OverridePalSlot:
	push	{r4, r5, lr}
	lsl	r5, r1, #0x18
	lsr	r5, r5, #0x18
	ldr	r1, [r0, #0x2c]
	ldr	r0, .L9
	ldrh	r0, [r0]
	lsl	r0, r0, #0x5
	ldr	r1, [r1, #0x10]
	add	r1, r1, r0
	ldr	r4, .L9+0x4
	ldrb	r0, [r4, #0x14]
	lsr	r0, r0, #0x3
	bl	LoadTextWindowTiles
	ldrb	r0, [r4, #0x14]
	lsr	r0, r0, #0x3
	add	r1, r5, #0
	bl	LoadTextWindowPalette
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L10:
	.align	2, 0
.L9:
	.word	sTextWindowBaseTileNum
	.word	gSaveBlock2
.Lfe3:
	.size	 LoadTextWindowGraphics_OverridePalSlot,.Lfe3-LoadTextWindowGraphics_OverridePalSlot
	.align	2, 0
	.globl	LoadTextWindowGraphics_OverrideFrameType
	.type	 LoadTextWindowGraphics_OverrideFrameType,function
	.thumb_func
LoadTextWindowGraphics_OverrideFrameType:
	push	{r4, lr}
	lsl	r4, r1, #0x18
	lsr	r4, r4, #0x18
	ldr	r1, [r0, #0x2c]
	ldr	r0, .L12
	ldrh	r0, [r0]
	lsl	r0, r0, #0x5
	ldr	r1, [r1, #0x10]
	add	r1, r1, r0
	add	r0, r4, #0
	bl	LoadTextWindowTiles
	add	r0, r4, #0
	mov	r1, #0xe
	bl	LoadTextWindowPalette
	pop	{r4}
	pop	{r0}
	bx	r0
.L13:
	.align	2, 0
.L12:
	.word	sTextWindowBaseTileNum
.Lfe4:
	.size	 LoadTextWindowGraphics_OverrideFrameType,.Lfe4-LoadTextWindowGraphics_OverrideFrameType
	.align	2, 0
	.globl	DrawTextWindow
	.type	 DrawTextWindow,function
	.thumb_func
DrawTextWindow:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffff8
	add	r4, r1, #0
	add	r5, r2, #0
	ldr	r2, [sp, #0x14]
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	lsl	r5, r5, #0x18
	lsr	r5, r5, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	ldr	r0, [r0, #0x2c]
	ldr	r0, [r0, #0x14]
	ldr	r1, .L15
	ldrh	r1, [r1]
	str	r3, [sp]
	str	r2, [sp, #0x4]
	add	r2, r4, #0
	add	r3, r5, #0
	bl	DrawTextWindowInternal
	add	sp, sp, #0x8
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L16:
	.align	2, 0
.L15:
	.word	sTextWindowBaseTileNum
.Lfe5:
	.size	 DrawTextWindow,.Lfe5-DrawTextWindow
	.align	2, 0
	.globl	GetTextWindowFrameGraphics
	.type	 GetTextWindowFrameGraphics,function
	.thumb_func
GetTextWindowFrameGraphics:
	push	{lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x13
	bhi	.L18	@cond_branch
	lsl	r0, r0, #0x3
	ldr	r1, .L21
	add	r0, r0, r1
	b	.L20
.L22:
	.align	2, 0
.L21:
	.word	gUnknown_083761F0
.L18:
	ldr	r0, .L23
.L20:
	pop	{r1}
	bx	r1
.L24:
	.align	2, 0
.L23:
	.word	gUnknown_083761F0
.Lfe6:
	.size	 GetTextWindowFrameGraphics,.Lfe6-GetTextWindowFrameGraphics
	.align	2, 0
	.type	 LoadTextWindowTiles,function
	.thumb_func
LoadTextWindowTiles:
	push	{r4, lr}
	add	r4, r1, #0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	bl	GetTextWindowFrameGraphics
	ldr	r0, [r0]
	add	r1, r4, #0
	mov	r2, #0x48
	bl	CpuFastSet
	pop	{r4}
	pop	{r0}
	bx	r0
.Lfe7:
	.size	 LoadTextWindowTiles,.Lfe7-LoadTextWindowTiles
	.align	2, 0
	.type	 LoadTextWindowPalette,function
	.thumb_func
LoadTextWindowPalette:
	push	{r4, lr}
	add	r4, r1, #0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	GetTextWindowFrameGraphics
	ldr	r0, [r0, #0x4]
	lsl	r4, r4, #0x4
	add	r1, r4, #0
	mov	r2, #0x20
	bl	LoadPalette
	pop	{r4}
	pop	{r0}
	bx	r0
.Lfe8:
	.size	 LoadTextWindowPalette,.Lfe8-LoadTextWindowPalette
	.align	2, 0
	.type	 DrawTextWindowInternal,function
	.thumb_func
DrawTextWindowInternal:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe4
	add	r7, r0, #0
	ldr	r0, [sp, #0x3c]
	ldr	r4, [sp, #0x40]
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	r9, r1
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r6, r2, #0
	lsl	r3, r3, #0x18
	lsr	r5, r3, #0x18
	mov	sl, r5
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	mov	r8, r4
	add	r1, r0, #0
	cmp	r0, r2
	bls	.L28	@cond_branch
	add	r1, r2, #0
.L28:
	str	r1, [sp]
	add	r1, r6, #0
	cmp	r6, r0
	bcs	.L29	@cond_branch
	add	r1, r0, #0
.L29:
	add	r6, r1, #0
	add	r3, r4, #0
	cmp	r4, r5
	bls	.L30	@cond_branch
	add	r3, r5, #0
.L30:
	add	r5, r3, #0
	mov	r0, sl
	cmp	sl, r8
	bcs	.L31	@cond_branch
	mov	r0, r8
.L31:
	str	r0, [sp, #0x4]
	lsl	r3, r5, #0x5
	ldr	r0, [sp]
	add	r1, r3, r0
	lsl	r1, r1, #0x1
	add	r1, r1, r7
	mov	r4, #0xe0
	lsl	r4, r4, #0x8
	add	r2, r4, #0
	mov	r0, r9
	orr	r0, r0, r2
	strh	r0, [r1]
	ldr	r1, [sp]
	add	r1, r1, #0x1
	lsl	r0, r1, #0x18
	lsr	r2, r0, #0x18
	str	r1, [sp, #0x18]
	mov	r4, r9
	add	r4, r4, #0x2
	add	r5, r5, #0x1
	mov	r8, r5
	mov	r5, r9
	add	r5, r5, #0x6
	str	r5, [sp, #0x10]
	mov	r0, r9
	add	r0, r0, #0x8
	str	r0, [sp, #0x14]
	cmp	r2, r6
	bcs	.L33	@cond_branch
	mov	sl, r3
	mov	r1, r9
	add	r1, r1, #0x1
	ldr	r5, .L52
	add	r0, r5, #0
	orr	r1, r1, r0
.L35:
	mov	r5, sl
	add	r0, r5, r2
	lsl	r0, r0, #0x1
	add	r0, r0, r7
	strh	r1, [r0]
	add	r0, r2, #0x1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, r6
	bcc	.L35	@cond_branch
.L33:
	add	r0, r3, r6
	lsl	r0, r0, #0x1
	add	r0, r0, r7
	ldr	r2, .L52
	add	r1, r2, #0
	orr	r4, r4, r1
	strh	r4, [r0]
	mov	r4, r8
	lsl	r0, r4, #0x18
	lsr	r3, r0, #0x18
	ldr	r5, [sp, #0x4]
	lsl	r5, r5, #0x5
	mov	sl, r5
	ldr	r0, [sp, #0x4]
	cmp	r3, r0
	bcs	.L38	@cond_branch
	mov	r2, #0x3
	add	r2, r2, r9
	orr	r2, r2, r1
	mov	r8, r2
	ldr	r4, [sp, #0x18]
	lsl	r4, r4, #0x18
	str	r4, [sp, #0x8]
	mov	r5, #0x5
	add	r5, r5, r9
	orr	r5, r5, r1
	mov	ip, r5
	mov	r0, r9
	add	r0, r0, #0x4
	str	r0, [sp, #0xc]
.L40:
	lsl	r1, r3, #0x5
	ldr	r2, [sp]
	add	r0, r1, r2
	lsl	r0, r0, #0x1
	add	r0, r0, r7
	mov	r4, r8
	strh	r4, [r0]
	ldr	r5, [sp, #0x8]
	lsr	r2, r5, #0x18
	add	r5, r1, #0
	add	r3, r3, #0x1
	cmp	r2, r6
	bcs	.L42	@cond_branch
	ldr	r4, .L52
	add	r0, r4, #0
	ldr	r4, [sp, #0xc]
	orr	r4, r4, r0
.L44:
	add	r0, r1, r2
	lsl	r0, r0, #0x1
	add	r0, r0, r7
	strh	r4, [r0]
	add	r0, r2, #0x1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, r6
	bcc	.L44	@cond_branch
.L42:
	add	r0, r5, r6
	lsl	r0, r0, #0x1
	add	r0, r0, r7
	mov	r5, ip
	strh	r5, [r0]
	lsl	r0, r3, #0x18
	lsr	r3, r0, #0x18
	ldr	r0, [sp, #0x4]
	cmp	r3, r0
	bcc	.L40	@cond_branch
.L38:
	ldr	r0, [sp]
	add	r0, r0, sl
	lsl	r0, r0, #0x1
	add	r0, r0, r7
	ldr	r1, .L52
	add	r4, r1, #0
	ldr	r2, [sp, #0x10]
	orr	r2, r2, r4
	strh	r2, [r0]
	ldr	r1, [sp, #0x18]
	lsl	r0, r1, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, r6
	bcs	.L48	@cond_branch
	mov	r3, sl
	mov	r1, r9
	add	r1, r1, #0x7
	orr	r1, r1, r4
.L50:
	add	r0, r3, r2
	lsl	r0, r0, #0x1
	add	r0, r0, r7
	strh	r1, [r0]
	add	r0, r2, #0x1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, r6
	bcc	.L50	@cond_branch
.L48:
	mov	r2, sl
	add	r0, r2, r6
	lsl	r0, r0, #0x1
	add	r0, r0, r7
	ldr	r4, .L52
	add	r1, r4, #0
	ldr	r5, [sp, #0x14]
	orr	r5, r5, r1
	strh	r5, [r0]
	add	sp, sp, #0x1c
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L53:
	.align	2, 0
.L52:
	.word	0xffffe000
.Lfe9:
	.size	 DrawTextWindowInternal,.Lfe9-DrawTextWindowInternal
	.align	2, 0
	.globl	SetMessageBoxBaseTileNum
	.type	 SetMessageBoxBaseTileNum,function
	.thumb_func
SetMessageBoxBaseTileNum:
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	ldr	r1, .L55
	strh	r0, [r1]
	add	r0, r0, #0xe
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bx	lr
.L56:
	.align	2, 0
.L55:
	.word	sMessageBoxBaseTileNum
.Lfe10:
	.size	 SetMessageBoxBaseTileNum,.Lfe10-SetMessageBoxBaseTileNum
	.align	2, 0
	.globl	unref_sub_80651DC
	.type	 unref_sub_80651DC,function
	.thumb_func
unref_sub_80651DC:
	push	{lr}
	add	sp, sp, #0xfffffffc
	ldr	r2, .L58
	ldrh	r2, [r2]
	add	r2, r2, #0xe
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r3, #0xf
	str	r3, [sp]
	mov	r3, #0x2
	bl	sub_8002EB0
	add	sp, sp, #0x4
	pop	{r0}
	bx	r0
.L59:
	.align	2, 0
.L58:
	.word	sMessageBoxBaseTileNum
.Lfe11:
	.size	 unref_sub_80651DC,.Lfe11-unref_sub_80651DC
	.align	2, 0
	.globl	DisplayMessageBox
	.type	 DisplayMessageBox,function
	.thumb_func
DisplayMessageBox:
	push	{r4, lr}
	add	r4, r0, #0
	bl	LoadMessageBoxTiles
	add	r0, r4, #0
	bl	DrawStandardMessageBox
	pop	{r4}
	pop	{r0}
	bx	r0
.Lfe12:
	.size	 DisplayMessageBox,.Lfe12-DisplayMessageBox
	.align	2, 0
	.type	 GetMessageBoxTilemapEntry,function
	.thumb_func
GetMessageBoxTilemapEntry:
	push	{r4, r5, r6, lr}
	ldr	r4, [sp, #0x10]
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r5, r1, #0x18
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	lsl	r4, r4, #0x18
	lsr	r0, r4, #0x18
	mov	r1, #0x9
	cmp	r2, r0
	bcc	.L62	@cond_branch
	sub	r0, r2, r0
	add	r0, r0, #0x3
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	b	.L63
.L62:
	cmp	r2, #0x1
	bls	.L63	@cond_branch
	mov	r2, #0x2
.L63:
	add	r0, r3, #0x1
	cmp	r5, r0
	blt	.L65	@cond_branch
	sub	r0, r5, r0
	add	r0, r0, #0x4
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	b	.L66
.L65:
	cmp	r5, #0x3
	bls	.L66	@cond_branch
	mov	r5, #0x3
.L66:
	cmp	r5, #0x6
	bhi	.L68	@cond_branch
	cmp	r2, #0x4
	bhi	.L68	@cond_branch
	ldr	r1, .L69
	lsl	r0, r2, #0x3
	sub	r0, r0, r2
	add	r0, r0, r5
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r1, [r0]
.L68:
	add	r0, r1, r6
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	add	r0, r1, #0
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L70:
	.align	2, 0
.L69:
	.word	gMessageBoxTilemap
.Lfe13:
	.size	 GetMessageBoxTilemapEntry,.Lfe13-GetMessageBoxTilemapEntry
	.align	2, 0
	.type	 DrawMessageBox,function
	.thumb_func
DrawMessageBox:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe4
	str	r0, [sp, #0x4]
	ldr	r0, [sp, #0x3c]
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	str	r1, [sp, #0x8]
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	str	r2, [sp, #0xc]
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	str	r3, [sp, #0x10]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r9, r0
	ldr	r1, [sp, #0x4]
	ldrb	r0, [r1, #0x6]
	lsl	r0, r0, #0xc
	ldr	r1, .L82
	ldrh	r1, [r1]
	orr	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp, #0x14]
	ldr	r3, [sp, #0x4]
	ldr	r0, [r3, #0x2c]
	ldr	r0, [r0, #0x14]
	mov	sl, r0
	mov	r5, #0x0
	mov	r0, r9
	add	r0, r0, #0x2
	cmp	r5, r0
	bge	.L73	@cond_branch
	ldr	r7, [sp, #0x10]
	add	r7, r7, #0x4
	str	r0, [sp, #0x18]
.L75:
	mov	r4, #0x0
	add	r0, r5, #0x1
	mov	r8, r0
	cmp	r4, r7
	bge	.L74	@cond_branch
	ldr	r1, [sp, #0xc]
	add	r0, r1, r5
	lsl	r6, r0, #0x5
.L79:
	mov	r3, r9
	str	r3, [sp]
	ldr	r0, [sp, #0x14]
	add	r1, r4, #0
	add	r2, r5, #0
	ldr	r3, [sp, #0x10]
	bl	GetMessageBoxTilemapEntry
	ldr	r1, [sp, #0x8]
	add	r2, r1, r4
	add	r2, r6, r2
	lsl	r2, r2, #0x1
	add	r2, r2, sl
	ldr	r3, [sp, #0x4]
	ldrb	r1, [r3, #0x6]
	lsl	r1, r1, #0xc
	orr	r1, r1, r0
	strh	r1, [r2, #0x2]
	add	r0, r4, #0x1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, r7
	blt	.L79	@cond_branch
.L74:
	mov	r1, r8
	lsl	r0, r1, #0x18
	lsr	r5, r0, #0x18
	ldr	r3, [sp, #0x18]
	cmp	r5, r3
	blt	.L75	@cond_branch
.L73:
	add	sp, sp, #0x1c
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L83:
	.align	2, 0
.L82:
	.word	sMessageBoxBaseTileNum
.Lfe14:
	.size	 DrawMessageBox,.Lfe14-DrawMessageBox
	.align	2, 0
	.globl	DrawStandardMessageBox
	.type	 DrawStandardMessageBox,function
	.thumb_func
DrawStandardMessageBox:
	push	{lr}
	add	sp, sp, #0xfffffffc
	mov	r1, #0x4
	str	r1, [sp]
	mov	r1, #0x0
	mov	r2, #0xe
	mov	r3, #0x18
	bl	DrawMessageBox
	add	sp, sp, #0x4
	pop	{r0}
	bx	r0
.Lfe15:
	.size	 DrawStandardMessageBox,.Lfe15-DrawStandardMessageBox
	.align	2, 0
	.globl	LoadMessageBoxTiles
	.type	 LoadMessageBoxTiles,function
	.thumb_func
LoadMessageBoxTiles:
	push	{lr}
	ldr	r0, [r0, #0x2c]
	ldr	r1, [r0, #0x10]
	ldr	r0, .L86
	ldr	r2, .L86+0x4
	ldrh	r2, [r2]
	lsl	r2, r2, #0x5
	add	r1, r1, r2
	mov	r2, #0x70
	bl	CpuFastSet
	pop	{r0}
	bx	r0
.L87:
	.align	2, 0
.L86:
	.word	gMessageBox_Gfx
	.word	sMessageBoxBaseTileNum
.Lfe16:
	.size	 LoadMessageBoxTiles,.Lfe16-LoadMessageBoxTiles
	.align	2, 0
	.globl	ClearStandardMessageBox
	.type	 ClearStandardMessageBox,function
	.thumb_func
ClearStandardMessageBox:
	push	{lr}
	ldr	r1, [r0, #0x2c]
	ldr	r1, [r1, #0x14]
	mov	r2, #0xe0
	lsl	r2, r2, #0x2
	add	r1, r1, r2
	ldrb	r0, [r0, #0x6]
	lsl	r0, r0, #0x1c
	lsr	r3, r0, #0x10
	mov	r2, #0x0
.L92:
	lsl	r0, r2, #0x1
	add	r0, r0, r1
	strh	r3, [r0]
	add	r0, r2, #0x1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0xbf
	bls	.L92	@cond_branch
	pop	{r0}
	bx	r0
.Lfe17:
	.size	 ClearStandardMessageBox,.Lfe17-ClearStandardMessageBox

	.lcomm	sTextWindowBaseTileNum,2

	.lcomm	sMessageBoxBaseTileNum,2
.text
	.align	2, 0