@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
.text
	.align	2, 0
	.globl	LZDecompressWram
	.type	 LZDecompressWram,function
	.thumb_func
LZDecompressWram:
	push	{lr}
	bl	LZ77UnCompWram
	pop	{r0}
	bx	r0
.Lfe1:
	.size	 LZDecompressWram,.Lfe1-LZDecompressWram
	.align	2, 0
	.globl	LZDecompressVram
	.type	 LZDecompressVram,function
	.thumb_func
LZDecompressVram:
	push	{lr}
	bl	LZ77UnCompVram
	pop	{r0}
	bx	r0
.Lfe2:
	.size	 LZDecompressVram,.Lfe2-LZDecompressVram
	.align	2, 0
	.globl	LoadCompressedObjectPic
	.type	 LoadCompressedObjectPic,function
	.thumb_func
LoadCompressedObjectPic:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffff8
	add	r4, r0, #0
	ldr	r0, [r4]
	mov	r5, #0x80
	lsl	r5, r5, #0x12
	add	r1, r5, #0
	bl	LZ77UnCompWram
	str	r5, [sp]
	ldrh	r1, [r4, #0x6]
	lsl	r1, r1, #0x10
	ldrh	r0, [r4, #0x4]
	orr	r0, r0, r1
	str	r0, [sp, #0x4]
	mov	r0, sp
	bl	LoadSpriteSheet
	add	sp, sp, #0x8
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.Lfe3:
	.size	 LoadCompressedObjectPic,.Lfe3-LoadCompressedObjectPic
	.align	2, 0
	.globl	LoadCompressedObjectPicOverrideBuffer
	.type	 LoadCompressedObjectPicOverrideBuffer,function
	.thumb_func
LoadCompressedObjectPicOverrideBuffer:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffff8
	add	r4, r0, #0
	add	r5, r1, #0
	ldr	r0, [r4]
	bl	LZ77UnCompWram
	str	r5, [sp]
	ldrh	r1, [r4, #0x6]
	lsl	r1, r1, #0x10
	ldrh	r0, [r4, #0x4]
	orr	r0, r0, r1
	str	r0, [sp, #0x4]
	mov	r0, sp
	bl	LoadSpriteSheet
	add	sp, sp, #0x8
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.Lfe4:
	.size	 LoadCompressedObjectPicOverrideBuffer,.Lfe4-LoadCompressedObjectPicOverrideBuffer
	.align	2, 0
	.globl	LoadCompressedObjectPalette
	.type	 LoadCompressedObjectPalette,function
	.thumb_func
LoadCompressedObjectPalette:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffff8
	add	r5, r0, #0
	ldr	r0, [r5]
	mov	r4, #0x80
	lsl	r4, r4, #0x12
	add	r1, r4, #0
	bl	LZ77UnCompWram
	str	r4, [sp]
	ldrh	r2, [r5, #0x4]
	ldr	r1, .L7
	ldr	r0, [sp, #0x4]
	and	r0, r0, r1
	orr	r0, r0, r2
	str	r0, [sp, #0x4]
	mov	r0, sp
	bl	LoadSpritePalette
	add	sp, sp, #0x8
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.word	0xffff0000
.Lfe5:
	.size	 LoadCompressedObjectPalette,.Lfe5-LoadCompressedObjectPalette
	.align	2, 0
	.globl	LoadCompressedObjectPaletteOverrideBuffer
	.type	 LoadCompressedObjectPaletteOverrideBuffer,function
	.thumb_func
LoadCompressedObjectPaletteOverrideBuffer:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffff8
	add	r5, r0, #0
	add	r4, r1, #0
	ldr	r0, [r5]
	bl	LZ77UnCompWram
	str	r4, [sp]
	ldrh	r2, [r5, #0x4]
	ldr	r1, .L10
	ldr	r0, [sp, #0x4]
	and	r0, r0, r1
	orr	r0, r0, r2
	str	r0, [sp, #0x4]
	mov	r0, sp
	bl	LoadSpritePalette
	add	sp, sp, #0x8
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L11:
	.align	2, 0
.L10:
	.word	0xffff0000
.Lfe6:
	.size	 LoadCompressedObjectPaletteOverrideBuffer,.Lfe6-LoadCompressedObjectPaletteOverrideBuffer
	.align	2, 0
	.globl	DecompressPicFromTable_2
	.type	 DecompressPicFromTable_2,function
	.thumb_func
DecompressPicFromTable_2:
	push	{lr}
	add	r2, r0, #0
	ldr	r3, [sp, #0x4]
	ldr	r1, [sp, #0x8]
	mov	r0, #0xce
	lsl	r0, r0, #0x1
	cmp	r1, r0
	ble	.L13	@cond_branch
	ldr	r0, .L15
	ldr	r0, [r0]
	add	r1, r3, #0
	bl	LZ77UnCompWram
	b	.L14
.L16:
	.align	2, 0
.L15:
	.word	gMonFrontPicTable
.L13:
	ldr	r0, [r2]
	add	r1, r3, #0
	bl	LZ77UnCompWram
.L14:
	pop	{r0}
	bx	r0
.Lfe7:
	.size	 DecompressPicFromTable_2,.Lfe7-DecompressPicFromTable_2
	.align	2, 0
	.globl	HandleLoadSpecialPokePic
	.type	 HandleLoadSpecialPokePic,function
	.thumb_func
HandleLoadSpecialPokePic:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r4, r0, #0
	add	r5, r1, #0
	add	r6, r2, #0
	ldr	r2, [sp, #0x20]
	ldr	r1, .L21
	ldr	r0, [r1]
	cmp	r2, r0
	beq	.L19	@cond_branch
	ldr	r0, [r1, #0x8]
	cmp	r2, r0
	bne	.L18	@cond_branch
.L19:
	mov	r1, #0x0
	b	.L20
.L22:
	.align	2, 0
.L21:
	.word	gUnknown_081FAF4C
.L18:
	mov	r1, #0x1
.L20:
	str	r2, [sp]
	ldr	r0, [sp, #0x24]
	str	r0, [sp, #0x4]
	ldr	r0, [sp, #0x28]
	str	r0, [sp, #0x8]
	str	r1, [sp, #0xc]
	add	r0, r4, #0
	add	r1, r5, #0
	add	r2, r6, #0
	bl	LoadSpecialPokePic
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.Lfe8:
	.size	 HandleLoadSpecialPokePic,.Lfe8-HandleLoadSpecialPokePic
	.align	2, 0
	.globl	LoadSpecialPokePic
	.type	 LoadSpecialPokePic,function
	.thumb_func
LoadSpecialPokePic:
	push	{r4, r5, r6, r7, lr}
	add	r1, r0, #0
	ldr	r5, [sp, #0x14]
	ldr	r6, [sp, #0x18]
	ldr	r4, [sp, #0x1c]
	ldr	r0, [sp, #0x20]
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	cmp	r6, #0xc9
	bne	.L24	@cond_branch
	mov	r0, #0xc0
	lsl	r0, r0, #0x12
	and	r0, r0, r4
	lsr	r0, r0, #0x12
	mov	r1, #0xc0
	lsl	r1, r1, #0xa
	and	r1, r1, r4
	lsr	r1, r1, #0xc
	orr	r0, r0, r1
	mov	r1, #0xc0
	lsl	r1, r1, #0x2
	and	r1, r1, r4
	lsr	r1, r1, #0x6
	orr	r0, r0, r1
	mov	r1, #0x3
	and	r1, r1, r4
	orr	r0, r0, r1
	mov	r1, #0x1c
	bl	__umodsi3
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, #0
	bne	.L25	@cond_branch
	mov	r1, #0xc9
	b	.L26
.L25:
	mov	r2, #0xce
	lsl	r2, r2, #0x1
	add	r0, r1, r2
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
.L26:
	cmp	r7, #0
	bne	.L27	@cond_branch
	ldr	r0, .L33
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, [r1]
	b	.L32
.L34:
	.align	2, 0
.L33:
	.word	gMonBackPicTable
.L27:
	ldr	r0, .L35
	lsl	r1, r1, #0x3
	add	r1, r1, r0
	ldr	r0, [r1]
	b	.L32
.L36:
	.align	2, 0
.L35:
	.word	gMonFrontPicTable
.L24:
	mov	r0, #0xce
	lsl	r0, r0, #0x1
	cmp	r6, r0
	ble	.L30	@cond_branch
	ldr	r0, .L37
	ldr	r0, [r0]
.L32:
	add	r1, r5, #0
	bl	LZ77UnCompWram
	b	.L29
.L38:
	.align	2, 0
.L37:
	.word	gMonFrontPicTable
.L30:
	ldr	r0, [r1]
	add	r1, r5, #0
	bl	LZ77UnCompWram
.L29:
	lsl	r0, r6, #0x10
	lsr	r0, r0, #0x10
	add	r1, r4, #0
	add	r2, r5, #0
	add	r3, r7, #0
	bl	DrawSpindaSpots
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.Lfe9:
	.size	 LoadSpecialPokePic,.Lfe9-LoadSpecialPokePic
	.align	2, 0
	.globl	Unused_LZDecompressWramIndirect
	.type	 Unused_LZDecompressWramIndirect,function
	.thumb_func
Unused_LZDecompressWramIndirect:
	push	{lr}
	ldr	r0, [r0]
	bl	LZ77UnCompWram
	pop	{r0}
	bx	r0
.Lfe10:
	.size	 Unused_LZDecompressWramIndirect,.Lfe10-Unused_LZDecompressWramIndirect
.text
	.align	2, 0
