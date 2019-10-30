@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.globl	gDecorationInventories
	.section .rodata
	.align	2, 0
	.type	 gDecorationInventories,object
gDecorationInventories:
	.word	gSaveBlock1+0x26a0
	.byte	0xa
	.space	3
	.word	gSaveBlock1+0x26aa
	.byte	0xa
	.space	3
	.word	gSaveBlock1+0x26b4
	.byte	0xa
	.space	3
	.word	gSaveBlock1+0x26be
	.byte	0x1e
	.space	3
	.word	gSaveBlock1+0x26dc
	.byte	0x1e
	.space	3
	.word	gSaveBlock1+0x26fa
	.byte	0xa
	.space	3
	.word	gSaveBlock1+0x2704
	.byte	0x28
	.space	3
	.word	gSaveBlock1+0x272c
	.byte	0xa
	.space	3
	.size	 gDecorationInventories,64
.text
	.align	2, 0
	.globl	ClearDecorationInventory
	.type	 ClearDecorationInventory,function
	.thumb_func
ClearDecorationInventory:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x18
	mov	r3, #0x0
	ldr	r1, .L8
	lsr	r2, r0, #0x15
	add	r0, r2, r1
	ldrb	r0, [r0, #0x4]
	cmp	r3, r0
	bcs	.L4	@cond_branch
	add	r5, r1, #0
	mov	r4, #0x0
.L6:
	add	r0, r2, r5
	ldr	r1, [r0]
	add	r1, r1, r3
	strb	r4, [r1]
	add	r1, r3, #0x1
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldrb	r0, [r0, #0x4]
	cmp	r3, r0
	bcc	.L6	@cond_branch
.L4:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L9:
	.align	2, 0
.L8:
	.word	gDecorationInventories
.Lfe1:
	.size	 ClearDecorationInventory,.Lfe1-ClearDecorationInventory
	.align	2, 0
	.globl	ClearDecorationInventories
	.type	 ClearDecorationInventories,function
	.thumb_func
ClearDecorationInventories:
	push	{r4, lr}
	mov	r4, #0x0
.L14:
	add	r0, r4, #0
	bl	ClearDecorationInventory
	add	r0, r4, #0x1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x7
	bls	.L14	@cond_branch
	pop	{r4}
	pop	{r0}
	bx	r0
.Lfe2:
	.size	 ClearDecorationInventories,.Lfe2-ClearDecorationInventories
	.align	2, 0
	.globl	sub_8133F9C
	.type	 sub_8133F9C,function
	.thumb_func
sub_8133F9C:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	mov	r2, #0x0
	ldr	r1, .L24
	lsr	r0, r0, #0x15
	add	r0, r0, r1
	mov	r1, #0x4
	ldrsb	r1, [r0, r1]
	cmp	r2, r1
	bge	.L18	@cond_branch
	add	r4, r0, #0
	add	r3, r1, #0
.L20:
	lsl	r0, r2, #0x18
	asr	r1, r0, #0x18
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L19	@cond_branch
	add	r0, r1, #0
	b	.L23
.L25:
	.align	2, 0
.L24:
	.word	gDecorationInventories
.L19:
	add	r0, r1, #0x1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, r3
	blt	.L20	@cond_branch
.L18:
	mov	r0, #0x1
	neg	r0, r0
.L23:
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe3:
	.size	 sub_8133F9C,.Lfe3-sub_8133F9C
	.align	2, 0
	.globl	sub_8133FE4
	.type	 sub_8133FE4,function
	.thumb_func
sub_8133FE4:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	ldr	r1, .L34
	lsl	r0, r3, #0x5
	add	r0, r0, r1
	ldrb	r0, [r0, #0x13]
	mov	r2, #0x0
	ldr	r1, .L34+0x4
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	ldrb	r1, [r0, #0x4]
	cmp	r2, r1
	bcs	.L28	@cond_branch
	ldr	r4, [r0]
.L30:
	add	r0, r4, r2
	ldrb	r0, [r0]
	cmp	r0, r3
	bne	.L29	@cond_branch
	mov	r0, #0x1
	b	.L33
.L35:
	.align	2, 0
.L34:
	.word	gDecorations
	.word	gDecorationInventories
.L29:
	add	r0, r2, #0x1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, r1
	bcc	.L30	@cond_branch
.L28:
	mov	r0, #0x0
.L33:
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe4:
	.size	 sub_8133FE4,.Lfe4-sub_8133FE4
	.align	2, 0
	.globl	IsThereStorageSpaceForDecoration
	.type	 IsThereStorageSpaceForDecoration,function
	.thumb_func
IsThereStorageSpaceForDecoration:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r4, r0, #0
	cmp	r4, #0
	beq	.L38	@cond_branch
	ldr	r1, .L40
	lsl	r0, r4, #0x5
	add	r0, r0, r1
	ldrb	r5, [r0, #0x13]
	add	r0, r5, #0
	bl	sub_8133F9C
	lsl	r0, r0, #0x18
	asr	r2, r0, #0x18
	mov	r0, #0x1
	neg	r0, r0
	cmp	r2, r0
	beq	.L38	@cond_branch
	ldr	r0, .L40+0x4
	lsl	r1, r5, #0x3
	add	r1, r1, r0
	ldr	r0, [r1]
	add	r0, r0, r2
	strb	r4, [r0]
	mov	r0, #0x1
	b	.L39
.L41:
	.align	2, 0
.L40:
	.word	gDecorations
	.word	gDecorationInventories
.L38:
	mov	r0, #0x0
.L39:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.Lfe5:
	.size	 IsThereStorageSpaceForDecoration,.Lfe5-IsThereStorageSpaceForDecoration
	.align	2, 0
	.globl	sub_8134074
	.type	 sub_8134074,function
	.thumb_func
sub_8134074:
	push	{lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0
	beq	.L44	@cond_branch
	ldr	r1, .L46
	lsl	r0, r0, #0x5
	add	r0, r0, r1
	ldrb	r0, [r0, #0x13]
	bl	sub_8133F9C
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	mov	r1, #0x1
	neg	r1, r1
	cmp	r0, r1
	beq	.L44	@cond_branch
	mov	r0, #0x1
	b	.L45
.L47:
	.align	2, 0
.L46:
	.word	gDecorations
.L44:
	mov	r0, #0x0
.L45:
	pop	{r1}
	bx	r1
.Lfe6:
	.size	 sub_8134074,.Lfe6-sub_8134074
	.align	2, 0
	.globl	sub_81340A8
	.type	 sub_81340A8,function
	.thumb_func
sub_81340A8:
	push	{r4, r5, r6, lr}
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	mov	r3, #0x0
	cmp	r5, #0
	bne	.L49	@cond_branch
	b	.L51
.L57:
	mov	r0, #0x0
	strb	r0, [r1]
	add	r0, r6, #0
	bl	sub_8134104
	mov	r0, #0x1
	b	.L56
.L49:
	ldr	r2, .L58
	ldr	r1, .L58+0x4
	lsl	r0, r5, #0x5
	add	r0, r0, r1
	ldrb	r4, [r0, #0x13]
	lsl	r0, r4, #0x3
	add	r0, r0, r2
	ldrb	r1, [r0, #0x4]
	cmp	r3, r1
	bcs	.L51	@cond_branch
	add	r6, r4, #0
	add	r4, r0, #0
	add	r2, r1, #0
.L53:
	ldr	r0, [r4]
	add	r1, r0, r3
	ldrb	r0, [r1]
	cmp	r0, r5
	beq	.L57	@cond_branch
	add	r0, r3, #0x1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	cmp	r3, r2
	bcc	.L53	@cond_branch
.L51:
	mov	r0, #0x0
.L56:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L59:
	.align	2, 0
.L58:
	.word	gDecorationInventories
	.word	gDecorations
.Lfe7:
	.size	 sub_81340A8,.Lfe7-sub_81340A8
	.align	2, 0
	.globl	sub_8134104
	.type	 sub_8134104,function
	.thumb_func
sub_8134104:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x18
	mov	r6, #0x0
	ldr	r2, .L73
	lsr	r1, r0, #0x15
	add	r0, r1, r2
	ldrb	r0, [r0, #0x4]
	cmp	r6, r0
	bcs	.L62	@cond_branch
	add	r7, r1, #0
	mov	r8, r0
	str	r0, [sp]
.L64:
	add	r1, r6, #0x1
	lsl	r0, r1, #0x18
	lsr	r3, r0, #0x18
	add	r2, r7, #0
	mov	ip, r1
	cmp	r3, r8
	bcs	.L63	@cond_branch
	ldr	r1, .L73
	mov	sl, r1
	add	r0, r1, #0
	mov	r9, r0
.L68:
	mov	r1, sl
	add	r5, r2, r1
	ldr	r1, [r5]
	add	r0, r1, r3
	ldrb	r4, [r0]
	add	r2, r4, #0
	cmp	r2, #0
	beq	.L67	@cond_branch
	add	r0, r1, r6
	ldrb	r1, [r0]
	cmp	r1, #0
	beq	.L70	@cond_branch
	cmp	r1, r2
	bls	.L67	@cond_branch
.L70:
	ldrb	r1, [r0]
	strb	r4, [r0]
	ldr	r0, [r5]
	add	r0, r0, r3
	strb	r1, [r0]
.L67:
	add	r0, r3, #0x1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	add	r2, r7, #0
	mov	r1, r9
	add	r0, r2, r1
	ldrb	r0, [r0, #0x4]
	cmp	r3, r0
	bcc	.L68	@cond_branch
.L63:
	mov	r1, ip
	lsl	r0, r1, #0x18
	lsr	r6, r0, #0x18
	ldr	r0, [sp]
	cmp	r6, r0
	bcc	.L64	@cond_branch
.L62:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L74:
	.align	2, 0
.L73:
	.word	gDecorationInventories
.Lfe8:
	.size	 sub_8134104,.Lfe8-sub_8134104
	.align	2, 0
	.globl	sub_8134194
	.type	 sub_8134194,function
	.thumb_func
sub_8134194:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x18
	mov	r4, #0x0
	mov	r3, #0x0
	ldr	r2, .L82
	lsr	r1, r0, #0x15
	add	r0, r1, r2
	ldrb	r0, [r0, #0x4]
	cmp	r4, r0
	bcs	.L77	@cond_branch
	add	r5, r2, #0
.L79:
	add	r2, r1, r5
	ldr	r0, [r2]
	add	r0, r0, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L78	@cond_branch
	add	r0, r4, #0x1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
.L78:
	add	r0, r3, #0x1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	ldrb	r2, [r2, #0x4]
	cmp	r3, r2
	bcc	.L79	@cond_branch
.L77:
	add	r0, r4, #0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L83:
	.align	2, 0
.L82:
	.word	gDecorationInventories
.Lfe9:
	.size	 sub_8134194,.Lfe9-sub_8134194
	.align	2, 0
	.globl	sub_81341D4
	.type	 sub_81341D4,function
	.thumb_func
sub_81341D4:
	push	{r4, r5, lr}
	mov	r5, #0x0
	mov	r4, #0x0
.L88:
	add	r0, r4, #0
	bl	sub_8134194
	add	r0, r5, r0
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	add	r0, r4, #0x1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x7
	bls	.L88	@cond_branch
	add	r0, r5, #0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.Lfe10:
	.size	 sub_81341D4,.Lfe10-sub_81341D4
.text
	.align	2, 0