@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
.text
	.align	2, 0
	.globl	BlendPalette
	.type	 BlendPalette,function
	.thumb_func
BlendPalette:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r8, r0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	ip, r1
	lsl	r2, r2, #0x18
	lsr	r7, r2, #0x18
	mov	r0, sp
	strh	r3, [r0]
	mov	r6, #0x0
	cmp	r6, ip
	bcs	.L4	@cond_branch
	ldr	r0, .L8
	mov	sl, r0
	ldr	r1, .L8+0x4
	mov	r9, r1
.L6:
	mov	r0, r8
	add	r5, r6, r0
	lsl	r5, r5, #0x10
	lsr	r5, r5, #0xf
	mov	r1, sl
	add	r0, r5, r1
	ldr	r3, [r0]
	lsl	r4, r3, #0x1b
	lsl	r2, r3, #0x16
	lsl	r3, r3, #0x11
	add	r5, r5, r9
	lsr	r4, r4, #0x1b
	ldr	r1, [sp]
	lsl	r0, r1, #0x1b
	lsr	r0, r0, #0x1b
	sub	r0, r0, r4
	mul	r0, r0, r7
	asr	r0, r0, #0x4
	add	r4, r4, r0
	lsr	r2, r2, #0x1b
	lsl	r0, r1, #0x16
	lsr	r0, r0, #0x1b
	sub	r0, r0, r2
	mul	r0, r0, r7
	asr	r0, r0, #0x4
	add	r2, r2, r0
	lsl	r2, r2, #0x5
	orr	r4, r4, r2
	lsr	r3, r3, #0x1b
	lsl	r1, r1, #0x11
	lsr	r1, r1, #0x1b
	sub	r1, r1, r3
	mov	r0, r1
	mul	r0, r0, r7
	asr	r0, r0, #0x4
	add	r3, r3, r0
	lsl	r3, r3, #0xa
	orr	r4, r4, r3
	strh	r4, [r5]
	add	r0, r6, #0x1
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	cmp	r6, ip
	bcc	.L6	@cond_branch
.L4:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L9:
	.align	2, 0
.L8:
	.word	gPlttBufferUnfaded
	.word	gPlttBufferFaded
.Lfe1:
	.size	 BlendPalette,.Lfe1-BlendPalette
.text
	.align	2, 0
