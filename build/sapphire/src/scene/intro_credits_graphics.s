@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.include "constants/gba_constants.inc"

	.code	16
.text
	.align	2, 0
	.globl	load_intro_part2_graphics
	.type	 load_intro_part2_graphics,function
	.thumb_func
load_intro_part2_graphics:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r0, .L8
	ldr	r1, .L8+0x4
	bl	LZ77UnCompVram
	ldr	r0, .L8+0x8
	ldr	r1, .L8+0xc
	bl	LZ77UnCompVram
	ldr	r0, .L8+0x10
	mov	r1, #0xf0
	mov	r2, #0x20
	bl	LoadPalette
	cmp	r4, #0
	beq	.L5	@cond_branch
	cmp	r4, #0x1
	beq	.L6	@cond_branch
.L5:
	ldr	r0, .L8+0x14
	mov	r1, #0xc0
	lsl	r1, r1, #0x13
	bl	LZ77UnCompVram
	ldr	r0, .L8+0x18
	ldr	r1, .L8+0x1c
	bl	LZ77UnCompVram
	ldr	r0, .L8+0x20
	mov	r1, #0x0
	mov	r2, #0x60
	bl	LoadPalette
	ldr	r0, .L8+0x24
	bl	LoadCompressedObjectPic
	ldr	r0, .L8+0x28
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	mov	r2, #0x20
	bl	LoadPalette
	bl	sub_8149248
	b	.L3
.L9:
	.align	2, 0
.L8:
	.word	gUnknown_0841225C
	.word	0x6004000
	.word	gUnknown_084126DC
	.word	0x6007800
	.word	gUnknown_084121FC
	.word	gUnknown_084128D8
	.word	gUnknown_08412EB4
	.word	0x6003000
	.word	gUnknown_08412818
	.word	gUnknown_08416B54
	.word	gUnknown_08413184
.L6:
	ldr	r0, .L10
	mov	r1, #0xc0
	lsl	r1, r1, #0x13
	bl	LZ77UnCompVram
	ldr	r0, .L10+0x4
	ldr	r1, .L10+0x8
	bl	LZ77UnCompVram
	ldr	r0, .L10+0xc
	mov	r1, #0x0
	mov	r2, #0x20
	bl	LoadPalette
	ldr	r0, .L10+0x10
	bl	LoadCompressedObjectPic
	ldr	r0, .L10+0x14
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	mov	r2, #0x20
	bl	LoadPalette
	bl	sub_8149264
.L3:
	ldr	r1, .L10+0x18
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r1, .L10+0x1c
	mov	r0, #0x8
	strb	r0, [r1]
	pop	{r4}
	pop	{r0}
	bx	r0
.L11:
	.align	2, 0
.L10:
	.word	gUnknown_08413340
	.word	gUnknown_084139C8
	.word	0x6003000
	.word	gUnknown_08413300
	.word	gUnknown_08416BDC
	.word	gUnknown_08413CCC
	.word	gUnknown_0203935C
	.word	gReservedSpritePaletteCount
.Lfe1:
	.size	 load_intro_part2_graphics,.Lfe1-load_intro_part2_graphics
	.align	2, 0
	.globl	sub_8148C78
	.type	 sub_8148C78,function
	.thumb_func
sub_8148C78:
	push	{lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r1, .L15
	ldr	r2, .L15+0x4
	add	r0, r2, #0
	strh	r0, [r1]
	sub	r1, r1, #0x2
	add	r2, r2, #0xff
	add	r0, r2, #0
	strh	r0, [r1]
	sub	r1, r1, #0x2
	ldr	r2, .L15+0x8
	add	r0, r2, #0
	strh	r0, [r1]
	sub	r1, r1, #0xa
	mov	r2, #0xf2
	lsl	r2, r2, #0x5
	add	r0, r2, #0
	strh	r0, [r1]
	pop	{r0}
	bx	r0
.L16:
	.align	2, 0
.L15:
	.word	0x400000e
	.word	0x603
	.word	0xf05
.Lfe2:
	.size	 sub_8148C78,.Lfe2-sub_8148C78
	.align	2, 0
	.globl	sub_8148CB0
	.type	 sub_8148CB0,function
	.thumb_func
sub_8148CB0:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r0, .L27
	ldr	r1, .L27+0x4
	bl	LZ77UnCompVram
	ldr	r0, .L27+0x8
	ldr	r1, .L27+0xc
	bl	LZ77UnCompVram
	cmp	r4, #0x4
	bhi	.L20	@cond_branch
	lsl	r0, r4, #0x2
	ldr	r1, .L27+0x10
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L28:
	.align	2, 0
.L27:
	.word	gUnknown_0841225C
	.word	0x6004000
	.word	gUnknown_084126DC
	.word	0x6007800
	.word	.L25
	.align	2, 0
	.align	2, 0
.L25:
	.word	.L20
	.word	.L21
	.word	.L23
	.word	.L23
	.word	.L24
.L20:
	ldr	r0, .L29
	mov	r1, #0xf0
	mov	r2, #0x20
	bl	LoadPalette
	ldr	r0, .L29+0x4
	mov	r1, #0xc0
	lsl	r1, r1, #0x13
	bl	LZ77UnCompVram
	ldr	r0, .L29+0x8
	ldr	r1, .L29+0xc
	bl	LZ77UnCompVram
	ldr	r0, .L29+0x10
	mov	r1, #0x0
	mov	r2, #0x60
	bl	LoadPalette
	ldr	r0, .L29+0x14
	bl	LoadCompressedObjectPic
	ldr	r0, .L29+0x18
	ldr	r1, .L29+0x1c
	bl	LZ77UnCompVram
	ldr	r0, .L29+0x20
	b	.L26
.L30:
	.align	2, 0
.L29:
	.word	gUnknown_084121FC
	.word	gUnknown_084128D8
	.word	gUnknown_08412EB4
	.word	0x6003000
	.word	gUnknown_08412818
	.word	gUnknown_08416B54
	.word	gUnknown_084131C4
	.word	0x6010000
	.word	gUnknown_08413184
.L21:
	ldr	r0, .L31
	mov	r1, #0xf0
	mov	r2, #0x20
	bl	LoadPalette
	ldr	r0, .L31+0x4
	mov	r1, #0xc0
	lsl	r1, r1, #0x13
	bl	LZ77UnCompVram
	ldr	r0, .L31+0x8
	ldr	r1, .L31+0xc
	bl	LZ77UnCompVram
	ldr	r0, .L31+0x10
	mov	r1, #0x0
	mov	r2, #0x60
	bl	LoadPalette
	ldr	r0, .L31+0x14
	bl	LoadCompressedObjectPic
	ldr	r0, .L31+0x18
	ldr	r1, .L31+0x1c
	bl	LZ77UnCompVram
	ldr	r0, .L31+0x20
.L26:
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	mov	r2, #0x20
	bl	LoadPalette
	bl	sub_8149248
	b	.L18
.L32:
	.align	2, 0
.L31:
	.word	gUnknown_0841221C
	.word	gUnknown_084128D8
	.word	gUnknown_08412EB4
	.word	0x6003000
	.word	gUnknown_08412878
	.word	gUnknown_08416B54
	.word	gUnknown_084131C4
	.word	0x6010000
	.word	gUnknown_084131A4
.L23:
	ldr	r0, .L33
	mov	r1, #0xf0
	mov	r2, #0x20
	bl	LoadPalette
	ldr	r0, .L33+0x4
	mov	r1, #0xc0
	lsl	r1, r1, #0x13
	bl	LZ77UnCompVram
	ldr	r0, .L33+0x8
	ldr	r1, .L33+0xc
	bl	LZ77UnCompVram
	ldr	r4, .L33+0x10
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x20
	bl	LoadPalette
	ldr	r0, .L33+0x14
	bl	LoadCompressedObjectPic
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	add	r0, r4, #0
	mov	r2, #0x20
	bl	LoadPalette
	bl	sub_8149264
	b	.L18
.L34:
	.align	2, 0
.L33:
	.word	gUnknown_0841221C
	.word	gUnknown_08413340
	.word	gUnknown_084139C8
	.word	0x6003000
	.word	gUnknown_08413320
	.word	gUnknown_08416BDC
.L24:
	ldr	r0, .L35
	mov	r1, #0xf0
	mov	r2, #0x20
	bl	LoadPalette
	ldr	r0, .L35+0x4
	mov	r1, #0xc0
	lsl	r1, r1, #0x13
	bl	LZ77UnCompVram
	ldr	r0, .L35+0x8
	ldr	r1, .L35+0xc
	bl	LZ77UnCompVram
	ldr	r0, .L35+0x10
	mov	r1, #0x0
	mov	r2, #0x40
	bl	LoadPalette
	ldr	r0, .L35+0x14
	bl	LoadCompressedObjectPic
	ldr	r0, .L35+0x18
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	mov	r2, #0x20
	bl	LoadPalette
	bl	sub_8149280
.L18:
	ldr	r1, .L35+0x1c
	mov	r0, #0x8
	strb	r0, [r1]
	ldr	r1, .L35+0x20
	mov	r0, #0x0
	strh	r0, [r1]
	pop	{r4}
	pop	{r0}
	bx	r0
.L36:
	.align	2, 0
.L35:
	.word	gUnknown_0841223C
	.word	gUnknown_08413E78
	.word	gUnknown_08414084
	.word	0x6003000
	.word	gUnknown_08413E38
	.word	gUnknown_08416C70
	.word	gUnknown_08414064
	.word	gReservedSpritePaletteCount
	.word	gUnknown_0203935C
.Lfe3:
	.size	 sub_8148CB0,.Lfe3-sub_8148CB0
	.align	2, 0
	.globl	sub_8148E90
	.type	 sub_8148E90,function
	.thumb_func
sub_8148E90:
	ldr	r1, .L38
	ldr	r2, .L38+0x4
	add	r0, r2, #0
	strh	r0, [r1]
	sub	r1, r1, #0x2
	add	r2, r2, #0xff
	add	r0, r2, #0
	strh	r0, [r1]
	sub	r1, r1, #0x2
	ldr	r2, .L38+0x8
	add	r0, r2, #0
	strh	r0, [r1]
	sub	r1, r1, #0xa
	mov	r2, #0xfa
	lsl	r2, r2, #0x5
	add	r0, r2, #0
	strh	r0, [r1]
	bx	lr
.L39:
	.align	2, 0
.L38:
	.word	0x400000e
	.word	0x603
	.word	0xf05
.Lfe4:
	.size	 sub_8148E90,.Lfe4-sub_8148E90
	.align	2, 0
	.globl	sub_8148EC0
	.type	 sub_8148EC0,function
	.thumb_func
sub_8148EC0:
	push	{r4, r5, r6, lr}
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6}
	add	sp, sp, #0xfffffffc
	add	r5, r0, #0
	add	r6, r1, #0
	mov	r8, r2
	lsl	r5, r5, #0x18
	lsr	r5, r5, #0x18
	lsl	r6, r6, #0x10
	lsr	r6, r6, #0x10
	mov	r0, r8
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r8, r0
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	ldr	r1, .L41
	mov	r9, r1
	mov	r0, r9
	mov	r1, #0x0
	str	r3, [sp]
	bl	CreateTask
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r1, .L41+0x4
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	mov	r2, #0x0
	strh	r5, [r0, #0x8]
	strh	r6, [r0, #0xa]
	strh	r2, [r0, #0xc]
	strh	r2, [r0, #0xe]
	mov	r1, r8
	strh	r1, [r0, #0x10]
	strh	r2, [r0, #0x12]
	strh	r2, [r0, #0x14]
	ldr	r3, [sp]
	strh	r3, [r0, #0x16]
	mov	r1, #0x8
	strh	r1, [r0, #0x18]
	strh	r2, [r0, #0x1a]
	add	r0, r4, #0
	bl	_call_via_r9
	add	r0, r4, #0
	add	sp, sp, #0x4
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L42:
	.align	2, 0
.L41:
	.word	sub_8148F3C
	.word	gTasks
.Lfe5:
	.size	 sub_8148EC0,.Lfe5-sub_8148EC0
	.align	2, 0
	.globl	sub_8148F3C
	.type	 sub_8148F3C,function
	.thumb_func
sub_8148F3C:
	.syntax unified
    push {r4-r6,lr}
    lsls r0, 24
    lsrs r5, r0, 24
    ldr r1, _08148FB4 @ =gTasks
    lsls r0, r5, 2
    adds r0, r5
    lsls r0, 3
    adds r3, r0, r1
    ldrh r0, [r3, 0xA]
    lsls r4, r0, 16
    adds r6, r1, 0
    cmp r4, 0
    beq _08148F7C
    movs r1, 0xC
    ldrsh r0, [r3, r1]
    lsls r0, 16
    ldrh r1, [r3, 0xE]
    adds r2, r0, r1
    lsrs r0, r4, 12
    subs r2, r0
    asrs r1, r2, 16
    strh r1, [r3, 0xC]
    strh r2, [r3, 0xE]
    ldr r0, _08148FB8 @ =REG_BG1HOFS
    strh r1, [r0]
    ldr r2, _08148FBC @ =REG_BG1VOFS
    ldr r1, _08148FC0 @ =gUnknown_02039358
    ldr r0, _08148FC4 @ =gUnknown_0203935A
    ldrh r0, [r0]
    ldrh r1, [r1]
    adds r0, r1
    strh r0, [r2]
_08148F7C:
    ldrh r0, [r3, 0x10]
    lsls r4, r0, 16
    cmp r4, 0
    beq _08148FD8
    movs r1, 0x12
    ldrsh r0, [r3, r1]
    lsls r0, 16
    ldrh r1, [r3, 0x14]
    adds r2, r0, r1
    lsrs r0, r4, 12
    subs r2, r0
    asrs r1, r2, 16
    strh r1, [r3, 0x12]
    strh r2, [r3, 0x14]
    ldr r0, _08148FC8 @ =REG_BG2HOFS
    strh r1, [r0]
    movs r1, 0x8
    ldrsh r0, [r3, r1]
    cmp r0, 0
    beq _08148FD0
    ldr r2, _08148FCC @ =REG_BG2VOFS
    ldr r1, _08148FC0 @ =gUnknown_02039358
    ldr r0, _08148FC4 @ =gUnknown_0203935A
    ldrh r0, [r0]
    ldrh r1, [r1]
    adds r0, r1
    strh r0, [r2]
    b _08148FD8
    .align 2, 0
_08148FB4: .4byte gTasks
_08148FB8: .4byte REG_BG1HOFS
_08148FBC: .4byte REG_BG1VOFS
_08148FC0: .4byte gUnknown_02039358
_08148FC4: .4byte gUnknown_0203935A
_08148FC8: .4byte REG_BG2HOFS
_08148FCC: .4byte REG_BG2VOFS
_08148FD0:
    ldr r0, _08149010 @ =REG_BG2VOFS
    ldr r1, _08149014 @ =gUnknown_02039358
    ldrh r1, [r1]
    strh r1, [r0]
_08148FD8:
    lsls r0, r5, 2
    adds r0, r5
    lsls r0, 3
    adds r3, r0, r6
    ldrh r0, [r3, 0x16]
    lsls r4, r0, 16
    cmp r4, 0
    beq _08149008
    movs r1, 0x18
    ldrsh r0, [r3, r1]
    lsls r0, 16
    ldrh r1, [r3, 0x1A]
    adds r2, r0, r1
    lsrs r0, r4, 12
    subs r2, r0
    asrs r1, r2, 16
    strh r1, [r3, 0x18]
    strh r2, [r3, 0x1A]
    ldr r0, _08149018 @ =REG_BG3HOFS
    strh r1, [r0]
    ldr r1, _0814901C @ =REG_BG3VOFS
    ldr r0, _08149014 @ =gUnknown_02039358
    ldrh r0, [r0]
    strh r0, [r1]
_08149008:
    pop {r4-r6}
    pop {r0}
    bx r0
    .align 2, 0
_08149010: .4byte REG_BG2VOFS
_08149014: .4byte gUnknown_02039358
_08149018: .4byte REG_BG3HOFS
_0814901C: .4byte REG_BG3VOFS
    .syntax divided

	.code	16
.Lfe6:
	.size	 sub_8148F3C,.Lfe6-sub_8148F3C
	.align	2, 0
	.globl	sub_8149020
	.type	 sub_8149020,function
	.thumb_func
sub_8149020:
	push	{r4, lr}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L45	@cond_branch
	cmp	r0, #0x1
	ble	.L47	@cond_branch
	cmp	r0, #0x2
	beq	.L52	@cond_branch
.L47:
	ldr	r0, .L62
	ldr	r2, [r0, #0x20]
	mov	r0, #0x3
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L45	@cond_branch
	ldr	r0, .L62+0x4
	ldrb	r1, [r0, #0x7]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L45	@cond_branch
	mov	r0, #0x4
	and	r2, r2, r0
	cmp	r2, #0
	beq	.L50	@cond_branch
	ldr	r2, .L62+0x8
	ldrh	r1, [r2, #0x12]
	mov	r0, sp
	strh	r1, [r0]
	ldrh	r1, [r2, #0x14]
	b	.L60
.L63:
	.align	2, 0
.L62:
	.word	gMain
	.word	gPaletteFade
	.word	gPlttBufferUnfaded
.L50:
	ldr	r2, .L64
	ldrh	r1, [r2, #0x14]
	mov	r0, sp
	strh	r1, [r0]
	ldrh	r1, [r2, #0x12]
.L60:
	add	r0, r0, #0x2
	strh	r1, [r0]
	add	r4, r0, #0
	mov	r0, sp
	mov	r1, #0x9
	mov	r2, #0x2
	bl	LoadPalette
	add	r0, r4, #0
	mov	r1, #0xa
	mov	r2, #0x2
	bl	LoadPalette
	b	.L45
.L65:
	.align	2, 0
.L64:
	.word	gPlttBufferUnfaded
.L52:
	ldr	r0, .L66
	ldr	r2, [r0, #0x20]
	mov	r0, #0x3
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L45	@cond_branch
	ldr	r0, .L66+0x4
	ldrb	r1, [r0, #0x7]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L45	@cond_branch
	mov	r0, #0x4
	and	r2, r2, r0
	cmp	r2, #0
	beq	.L55	@cond_branch
	mov	r1, sp
	ldr	r2, .L66+0x8
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r2, .L66+0xc
	b	.L61
.L67:
	.align	2, 0
.L66:
	.word	gMain
	.word	gPaletteFade
	.word	0x3d27
	.word	0x295
.L55:
	mov	r1, sp
	mov	r2, #0xc7
	lsl	r2, r2, #0x2
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r2, .L68
.L61:
	add	r0, r2, #0
	strh	r0, [r1]
	add	r4, r1, #0
	mov	r0, sp
	mov	r1, #0xc
	mov	r2, #0x2
	bl	LoadPalette
	add	r0, r4, #0
	mov	r1, #0xd
	mov	r2, #0x2
	bl	LoadPalette
.L45:
	add	sp, sp, #0x4
	pop	{r4}
	pop	{r0}
	bx	r0
.L69:
	.align	2, 0
.L68:
	.word	0x3d27
.Lfe7:
	.size	 sub_8149020,.Lfe7-sub_8149020
	.align	2, 0
	.globl	sub_814910C
	.type	 sub_814910C,function
	.thumb_func
sub_814910C:
	push	{lr}
	add	r2, r0, #0
	ldr	r0, .L77
	mov	r1, #0x0
	ldrsh	r0, [r0, r1]
	cmp	r0, #0
	beq	.L71	@cond_branch
	add	r0, r2, #0
	bl	DestroySprite
	b	.L72
.L78:
	.align	2, 0
.L77:
	.word	gUnknown_0203935C
.L71:
	mov	r1, #0x20
	ldrsh	r0, [r2, r1]
	lsl	r0, r0, #0x10
	ldrh	r1, [r2, #0x32]
	orr	r0, r0, r1
	ldrh	r1, [r2, #0x30]
	add	r0, r0, r1
	asr	r1, r0, #0x10
	strh	r1, [r2, #0x20]
	strh	r0, [r2, #0x32]
	cmp	r1, #0xff
	ble	.L73	@cond_branch
	ldr	r0, .L79
	strh	r0, [r2, #0x20]
.L73:
	mov	r1, #0x2e
	ldrsh	r0, [r2, r1]
	cmp	r0, #0
	beq	.L74	@cond_branch
	ldr	r1, .L79+0x4
	ldr	r0, .L79+0x8
	ldrh	r0, [r0]
	ldrh	r1, [r1]
	add	r0, r0, r1
	b	.L76
.L80:
	.align	2, 0
.L79:
	.word	0xffe0
	.word	gUnknown_02039358
	.word	gUnknown_0203935A
.L74:
	ldr	r0, .L81
	ldrh	r0, [r0]
.L76:
	neg	r0, r0
	strh	r0, [r2, #0x26]
.L72:
	pop	{r0}
	bx	r0
.L82:
	.align	2, 0
.L81:
	.word	gUnknown_02039358
.Lfe8:
	.size	 sub_814910C,.Lfe8-sub_814910C
	.align	2, 0
	.globl	sub_8149174
	.type	 sub_8149174,function
	.thumb_func
sub_8149174:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	str	r1, [sp, #0x4]
	str	r2, [sp, #0x8]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp]
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	mov	r8, r3
	mov	r7, #0x0
	cmp	r7, r8
	bcs	.L85	@cond_branch
	ldr	r0, .L89
	mov	sl, r0
	mov	r2, #0x3f
	mov	r9, r2
.L87:
	lsl	r6, r7, #0x3
	ldr	r0, [sp, #0x4]
	add	r6, r6, r0
	ldrb	r1, [r6, #0x1]
	ldrb	r2, [r6, #0x2]
	ldrb	r3, [r6, #0x3]
	ldr	r0, .L89+0x4
	bl	CreateSprite
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r5, r0, #0x4
	add	r5, r5, r0
	lsl	r5, r5, #0x2
	mov	r2, sl
	add	r4, r5, r2
	ldrb	r2, [r6]
	lsl	r1, r2, #0x1a
	lsr	r1, r1, #0x1e
	lsr	r2, r2, #0x6
	add	r0, r4, #0
	mov	r3, #0x0
	bl	CalcCenterToCornerVec
	ldrb	r3, [r4, #0x5]
	mov	r0, #0xc
	orr	r3, r3, r0
	strb	r3, [r4, #0x5]
	ldrb	r1, [r6]
	lsl	r1, r1, #0x1a
	lsr	r1, r1, #0x1e
	lsl	r1, r1, #0x6
	ldrb	r2, [r4, #0x1]
	mov	r0, r9
	and	r0, r0, r2
	orr	r0, r0, r1
	strb	r0, [r4, #0x1]
	ldrb	r1, [r6]
	lsr	r1, r1, #0x6
	lsl	r1, r1, #0x6
	ldrb	r2, [r4, #0x3]
	mov	r0, r9
	and	r0, r0, r2
	orr	r0, r0, r1
	strb	r0, [r4, #0x3]
	mov	r0, #0xf
	and	r3, r3, r0
	strb	r3, [r4, #0x5]
	ldr	r0, .L89+0x8
	add	r5, r5, r0
	ldr	r2, [sp, #0x8]
	str	r2, [r5]
	ldrb	r1, [r6]
	lsl	r1, r1, #0x1c
	lsr	r1, r1, #0x1c
	add	r0, r4, #0
	bl	StartSpriteAnim
	mov	r1, #0x0
	mov	r0, sp
	ldrh	r0, [r0]
	strh	r0, [r4, #0x2e]
	ldrh	r0, [r6, #0x4]
	strh	r0, [r4, #0x30]
	strh	r1, [r4, #0x32]
	add	r0, r7, #0x1
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	cmp	r7, r8
	bcc	.L87	@cond_branch
.L85:
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L90:
	.align	2, 0
.L89:
	.word	gSprites
	.word	gSpriteTemplate_8416B3C
	.word	gSprites+0x8
.Lfe9:
	.size	 sub_8149174,.Lfe9-sub_8149174
	.align	2, 0
	.globl	sub_8149248
	.type	 sub_8149248,function
	.thumb_func
sub_8149248:
	push	{lr}
	ldr	r1, .L92
	ldr	r2, .L92+0x4
	mov	r0, #0x0
	mov	r3, #0x9
	bl	sub_8149174
	pop	{r0}
	bx	r0
.L93:
	.align	2, 0
.L92:
	.word	gUnknown_08416B94
	.word	gSpriteAnimTable_8416B84
.Lfe10:
	.size	 sub_8149248,.Lfe10-sub_8149248
	.align	2, 0
	.globl	sub_8149264
	.type	 sub_8149264,function
	.thumb_func
sub_8149264:
	push	{lr}
	ldr	r1, .L95
	ldr	r2, .L95+0x4
	mov	r0, #0x1
	mov	r3, #0xc
	bl	sub_8149174
	pop	{r0}
	bx	r0
.L96:
	.align	2, 0
.L95:
	.word	gUnknown_08416C10
	.word	gSpriteAnimTable_8416C04
.Lfe11:
	.size	 sub_8149264,.Lfe11-sub_8149264
	.align	2, 0
	.globl	sub_8149280
	.type	 sub_8149280,function
	.thumb_func
sub_8149280:
	push	{lr}
	ldr	r1, .L98
	ldr	r2, .L98+0x4
	mov	r0, #0x1
	mov	r3, #0x6
	bl	sub_8149174
	pop	{r0}
	bx	r0
.L99:
	.align	2, 0
.L98:
	.word	gUnknown_08416C8C
	.word	gSpriteAnimTable_8416C88
.Lfe12:
	.size	 sub_8149280,.Lfe12-sub_8149280
	.align	2, 0
	.globl	nullsub_82
	.type	 nullsub_82,function
	.thumb_func
nullsub_82:
	bx	lr
.Lfe13:
	.size	 nullsub_82,.Lfe13-nullsub_82
	.align	2, 0
	.globl	sub_81492A0
	.type	 sub_81492A0,function
	.thumb_func
sub_81492A0:
	push	{r4, lr}
	ldr	r4, .L102
	mov	r1, #0x2e
	ldrsh	r2, [r0, r1]
	lsl	r1, r2, #0x4
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	add	r1, r1, #0x3e
	ldrb	r1, [r1]
	mov	r2, #0x3e
	add	r2, r2, r0
	mov	ip, r2
	mov	r2, #0x4
	and	r2, r2, r1
	mov	r1, ip
	ldrb	r3, [r1]
	mov	r1, #0x5
	neg	r1, r1
	and	r1, r1, r3
	orr	r1, r1, r2
	mov	r2, ip
	strb	r1, [r2]
	mov	r1, #0x2e
	ldrsh	r2, [r0, r1]
	lsl	r1, r2, #0x4
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	ldrh	r1, [r1, #0x20]
	strh	r1, [r0, #0x20]
	lsl	r1, r2, #0x4
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	ldrh	r1, [r1, #0x22]
	add	r1, r1, #0x8
	strh	r1, [r0, #0x22]
	lsl	r1, r2, #0x4
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	ldrh	r1, [r1, #0x24]
	strh	r1, [r0, #0x24]
	lsl	r1, r2, #0x4
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	ldrh	r1, [r1, #0x26]
	strh	r1, [r0, #0x26]
	pop	{r4}
	pop	{r0}
	bx	r0
.L103:
	.align	2, 0
.L102:
	.word	gSprites
.Lfe14:
	.size	 sub_81492A0,.Lfe14-sub_81492A0
	.align	2, 0
	.globl	intro_create_brendan_sprite
	.type	 intro_create_brendan_sprite,function
	.thumb_func
intro_create_brendan_sprite:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	add	r4, r1, #0
	ldr	r0, .L105
	lsl	r5, r5, #0x10
	asr	r5, r5, #0x10
	lsl	r4, r4, #0x10
	asr	r4, r4, #0x10
	add	r1, r5, #0
	add	r2, r4, #0
	mov	r3, #0x0
	bl	CreateSprite
	add	r6, r0, #0
	lsl	r6, r6, #0x18
	lsr	r6, r6, #0x18
	ldr	r0, .L105+0x4
	add	r4, r4, #0x8
	lsl	r4, r4, #0x10
	asr	r4, r4, #0x10
	add	r1, r5, #0
	add	r2, r4, #0
	mov	r3, #0x1
	bl	CreateSprite
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, .L105+0x8
	lsl	r1, r0, #0x4
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	add	r1, r1, r2
	strh	r6, [r1, #0x2e]
	add	r0, r6, #0
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L106:
	.align	2, 0
.L105:
	.word	gSpriteTemplate_8416CDC
	.word	gSpriteTemplate_Brendan
	.word	gSprites
.Lfe15:
	.size	 intro_create_brendan_sprite,.Lfe15-intro_create_brendan_sprite
	.align	2, 0
	.globl	intro_create_may_sprite
	.type	 intro_create_may_sprite,function
	.thumb_func
intro_create_may_sprite:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	add	r4, r1, #0
	ldr	r0, .L108
	lsl	r5, r5, #0x10
	asr	r5, r5, #0x10
	lsl	r4, r4, #0x10
	asr	r4, r4, #0x10
	add	r1, r5, #0
	add	r2, r4, #0
	mov	r3, #0x0
	bl	CreateSprite
	add	r6, r0, #0
	lsl	r6, r6, #0x18
	lsr	r6, r6, #0x18
	ldr	r0, .L108+0x4
	add	r4, r4, #0x8
	lsl	r4, r4, #0x10
	asr	r4, r4, #0x10
	add	r1, r5, #0
	add	r2, r4, #0
	mov	r3, #0x1
	bl	CreateSprite
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r2, .L108+0x8
	lsl	r1, r0, #0x4
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	add	r1, r1, r2
	strh	r6, [r1, #0x2e]
	add	r0, r6, #0
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L109:
	.align	2, 0
.L108:
	.word	gSpriteTemplate_8416CF4
	.word	gSpriteTemplate_May
	.word	gSprites
.Lfe16:
	.size	 intro_create_may_sprite,.Lfe16-intro_create_may_sprite
	.align	2, 0
	.globl	nullsub_83
	.type	 nullsub_83,function
	.thumb_func
nullsub_83:
	bx	lr
.Lfe17:
	.size	 nullsub_83,.Lfe17-nullsub_83
	.align	2, 0
	.globl	sub_81493C4
	.type	 sub_81493C4,function
	.thumb_func
sub_81493C4:
	push	{r4, lr}
	ldr	r4, .L112
	mov	r1, #0x2e
	ldrsh	r2, [r0, r1]
	lsl	r1, r2, #0x4
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	add	r1, r1, #0x3e
	ldrb	r1, [r1]
	mov	r2, #0x3e
	add	r2, r2, r0
	mov	ip, r2
	mov	r2, #0x4
	and	r2, r2, r1
	mov	r1, ip
	ldrb	r3, [r1]
	mov	r1, #0x5
	neg	r1, r1
	and	r1, r1, r3
	orr	r1, r1, r2
	mov	r2, ip
	strb	r1, [r2]
	mov	r1, #0x2e
	ldrsh	r2, [r0, r1]
	lsl	r1, r2, #0x4
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	ldrh	r1, [r1, #0x22]
	strh	r1, [r0, #0x22]
	lsl	r1, r2, #0x4
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	ldrh	r1, [r1, #0x24]
	strh	r1, [r0, #0x24]
	lsl	r1, r2, #0x4
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	ldrh	r1, [r1, #0x26]
	strh	r1, [r0, #0x26]
	pop	{r4}
	pop	{r0}
	bx	r0
.L113:
	.align	2, 0
.L112:
	.word	gSprites
.Lfe18:
	.size	 sub_81493C4,.Lfe18-sub_81493C4
	.align	2, 0
	.globl	intro_create_latios_sprite
	.type	 intro_create_latios_sprite,function
	.thumb_func
intro_create_latios_sprite:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	r2, r0, #0
	add	r5, r1, #0
	ldr	r0, .L115
	mov	r8, r0
	lsl	r2, r2, #0x10
	asr	r4, r2, #0x10
	ldr	r0, .L115+0x4
	add	r2, r2, r0
	asr	r2, r2, #0x10
	lsl	r5, r5, #0x10
	asr	r5, r5, #0x10
	mov	r0, r8
	add	r1, r2, #0
	add	r2, r5, #0
	mov	r3, #0x2
	bl	CreateSprite
	add	r6, r0, #0
	lsl	r6, r6, #0x18
	lsr	r6, r6, #0x18
	add	r4, r4, #0x20
	lsl	r4, r4, #0x10
	asr	r4, r4, #0x10
	mov	r0, r8
	add	r1, r4, #0
	add	r2, r5, #0
	mov	r3, #0x2
	bl	CreateSprite
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r5, .L115+0x8
	lsl	r4, r0, #0x4
	add	r4, r4, r0
	lsl	r4, r4, #0x2
	add	r0, r4, r5
	strh	r6, [r0, #0x2e]
	mov	r1, #0x1
	bl	StartSpriteAnim
	add	r5, r5, #0x1c
	add	r4, r4, r5
	ldr	r0, .L115+0xc
	str	r0, [r4]
	add	r0, r6, #0
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L116:
	.align	2, 0
.L115:
	.word	gSpriteTemplate_8416D7C
	.word	0xffe00000
	.word	gSprites
	.word	sub_81493C4
.Lfe19:
	.size	 intro_create_latios_sprite,.Lfe19-intro_create_latios_sprite
	.align	2, 0
	.globl	intro_create_latias_sprite
	.type	 intro_create_latias_sprite,function
	.thumb_func
intro_create_latias_sprite:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	r2, r0, #0
	add	r5, r1, #0
	ldr	r0, .L118
	mov	r8, r0
	lsl	r2, r2, #0x10
	asr	r4, r2, #0x10
	ldr	r0, .L118+0x4
	add	r2, r2, r0
	asr	r2, r2, #0x10
	lsl	r5, r5, #0x10
	asr	r5, r5, #0x10
	mov	r0, r8
	add	r1, r2, #0
	add	r2, r5, #0
	mov	r3, #0x2
	bl	CreateSprite
	add	r6, r0, #0
	lsl	r6, r6, #0x18
	lsr	r6, r6, #0x18
	add	r4, r4, #0x20
	lsl	r4, r4, #0x10
	asr	r4, r4, #0x10
	mov	r0, r8
	add	r1, r4, #0
	add	r2, r5, #0
	mov	r3, #0x2
	bl	CreateSprite
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r5, .L118+0x8
	lsl	r4, r0, #0x4
	add	r4, r4, r0
	lsl	r4, r4, #0x2
	add	r0, r4, r5
	strh	r6, [r0, #0x2e]
	mov	r1, #0x1
	bl	StartSpriteAnim
	add	r5, r5, #0x1c
	add	r4, r4, r5
	ldr	r0, .L118+0xc
	str	r0, [r4]
	add	r0, r6, #0
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L119:
	.align	2, 0
.L118:
	.word	gSpriteTemplate_8416D94
	.word	0xffe00000
	.word	gSprites
	.word	sub_81493C4
.Lfe20:
	.size	 intro_create_latias_sprite,.Lfe20-intro_create_latias_sprite
.text
	.align	2, 0
