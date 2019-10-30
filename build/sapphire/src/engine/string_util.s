@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.globl	gEmptyString_81E72B0
	.section .rodata
	.type	 gEmptyString_81E72B0,object
gEmptyString_81E72B0:
	.byte	0xff
	.size	 gEmptyString_81E72B0,1
	.globl	gRightPointingTriangleString
	.type	 gRightPointingTriangleString,object
gRightPointingTriangleString:
	.byte	0xef
	.byte	0xff
	.size	 gRightPointingTriangleString,2
	.type	 sDigits,object
sDigits:
	.byte	0xa1
	.byte	0xa2
	.byte	0xa3
	.byte	0xa4
	.byte	0xa5
	.byte	0xa6
	.byte	0xa7
	.byte	0xa8
	.byte	0xa9
	.byte	0xaa
	.byte	0xbb
	.byte	0xbc
	.byte	0xbd
	.byte	0xbe
	.byte	0xbf
	.byte	0xc0
	.size	 sDigits,16
	.align	2, 0
	.type	 sPowersOfTen,object
sPowersOfTen:
	.word	0x1
	.word	0xa
	.word	0x64
	.word	0x3e8
	.word	0x2710
	.word	0x186a0
	.word	0xf4240
	.word	0x989680
	.word	0x5f5e100
	.word	0x3b9aca00
	.size	 sPowersOfTen,40
.text
	.align	2, 0
	.globl	StringCopy10
	.type	 StringCopy10,function
	.thumb_func
StringCopy10:
	push	{r4, r5, lr}
	add	r4, r0, #0
	mov	r5, #0xa
	mov	r3, #0x0
.L6:
	add	r2, r4, r3
	add	r0, r1, r3
	ldrb	r0, [r0]
	strb	r0, [r2]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0xff
	bne	.L5	@cond_branch
	add	r0, r2, #0
	b	.L9
.L5:
	add	r0, r3, #0x1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	cmp	r3, r5
	bcc	.L6	@cond_branch
	add	r0, r4, r3
	mov	r1, #0xff
	strb	r1, [r0]
.L9:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.Lfe1:
	.size	 StringCopy10,.Lfe1-StringCopy10
	.align	2, 0
	.globl	StringGetEnd10
	.type	 StringGetEnd10,function
	.thumb_func
StringGetEnd10:
	push	{r4, lr}
	add	r3, r0, #0
	mov	r4, #0xa
	mov	r2, #0x0
.L14:
	add	r1, r3, r2
	ldrb	r0, [r1]
	cmp	r0, #0xff
	bne	.L13	@cond_branch
	add	r0, r1, #0
	b	.L17
.L13:
	add	r0, r2, #0x1
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, r4
	bcc	.L14	@cond_branch
	add	r0, r3, r2
	mov	r1, #0xff
	strb	r1, [r0]
.L17:
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe2:
	.size	 StringGetEnd10,.Lfe2-StringGetEnd10
	.align	2, 0
	.globl	StringCopy8
	.type	 StringCopy8,function
	.thumb_func
StringCopy8:
	push	{r4, lr}
	add	r4, r0, #0
	mov	r3, #0x0
.L22:
	add	r2, r4, r3
	add	r0, r1, r3
	ldrb	r0, [r0]
	strb	r0, [r2]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0xff
	bne	.L21	@cond_branch
	add	r0, r2, #0
	b	.L25
.L21:
	add	r3, r3, #0x1
	cmp	r3, #0x7
	ble	.L22	@cond_branch
	add	r0, r4, r3
	mov	r1, #0xff
	strb	r1, [r0]
.L25:
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe3:
	.size	 StringCopy8,.Lfe3-StringCopy8
	.align	2, 0
	.globl	StringCopy
	.type	 StringCopy,function
	.thumb_func
StringCopy:
	push	{lr}
	add	r3, r0, #0
	b	.L31
.L29:
	strb	r2, [r3]
	add	r3, r3, #0x1
	add	r1, r1, #0x1
.L31:
	ldrb	r2, [r1]
	add	r0, r2, #0
	cmp	r0, #0xff
	bne	.L29	@cond_branch
	mov	r0, #0xff
	strb	r0, [r3]
	add	r0, r3, #0
	pop	{r1}
	bx	r1
.Lfe4:
	.size	 StringCopy,.Lfe4-StringCopy
	.align	2, 0
	.globl	StringAppend
	.type	 StringAppend,function
	.thumb_func
StringAppend:
	push	{lr}
	add	r2, r0, #0
	b	.L37
.L35:
	add	r2, r2, #0x1
.L37:
	ldrb	r0, [r2]
	cmp	r0, #0xff
	bne	.L35	@cond_branch
	add	r0, r2, #0
	bl	StringCopy
	pop	{r1}
	bx	r1
.Lfe5:
	.size	 StringAppend,.Lfe5-StringAppend
	.align	2, 0
	.globl	StringCopyN
	.type	 StringCopyN,function
	.thumb_func
StringCopyN:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	add	r6, r1, #0
	lsl	r2, r2, #0x18
	lsr	r5, r2, #0x18
	mov	r3, #0x0
	add	r0, r5, #0
	cmp	r3, r0
	bcs	.L40	@cond_branch
	add	r2, r0, #0
.L42:
	add	r1, r4, r3
	add	r0, r6, r3
	ldrb	r0, [r0]
	strb	r0, [r1]
	add	r0, r3, #0x1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	cmp	r3, r2
	bcc	.L42	@cond_branch
.L40:
	add	r0, r4, r5
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.Lfe6:
	.size	 StringCopyN,.Lfe6-StringCopyN
	.align	2, 0
	.globl	StringAppendN
	.type	 StringAppendN,function
	.thumb_func
StringAppendN:
	push	{lr}
	add	r3, r0, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	b	.L49
.L47:
	add	r3, r3, #0x1
.L49:
	ldrb	r0, [r3]
	cmp	r0, #0xff
	bne	.L47	@cond_branch
	add	r0, r3, #0
	bl	StringCopyN
	pop	{r1}
	bx	r1
.Lfe7:
	.size	 StringAppendN,.Lfe7-StringAppendN
	.align	2, 0
	.globl	StringLength
	.type	 StringLength,function
	.thumb_func
StringLength:
	push	{r4, r5, lr}
	add	r4, r0, #0
	mov	r5, #0x0
	ldrb	r0, [r4]
	cmp	r0, #0xff
	beq	.L52	@cond_branch
.L53:
	add	r0, r5, #0
	add	r1, r0, #0x1
	lsl	r1, r1, #0x10
	lsr	r5, r1, #0x10
	add	r0, r4, r0
	ldrb	r0, [r0]
	cmp	r0, #0xfc
	bne	.L51	@cond_branch
	add	r0, r4, r5
	ldrb	r0, [r0]
	bl	GetExtCtrlCodeLength
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r0, r5, r0
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
.L51:
	add	r0, r4, r5
	ldrb	r0, [r0]
	cmp	r0, #0xff
	bne	.L53	@cond_branch
.L52:
	add	r0, r5, #0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.Lfe8:
	.size	 StringLength,.Lfe8-StringLength
	.align	2, 0
	.globl	StringCompare
	.type	 StringCompare,function
	.thumb_func
StringCompare:
	push	{lr}
	add	r2, r0, #0
	b	.L63
.L59:
	cmp	r0, #0xff
	bne	.L60	@cond_branch
	mov	r0, #0x0
	b	.L62
.L60:
	add	r2, r2, #0x1
	add	r1, r1, #0x1
.L63:
	ldrb	r0, [r2]
	ldrb	r3, [r1]
	cmp	r0, r3
	beq	.L59	@cond_branch
	ldrb	r0, [r2]
	ldrb	r1, [r1]
	sub	r0, r0, r1
.L62:
	pop	{r1}
	bx	r1
.Lfe9:
	.size	 StringCompare,.Lfe9-StringCompare
	.align	2, 0
	.globl	StringCompareN
	.type	 StringCompareN,function
	.thumb_func
StringCompareN:
	push	{r4, lr}
	add	r3, r0, #0
	b	.L65
.L67:
	cmp	r0, #0xff
	beq	.L72	@cond_branch
	add	r3, r3, #0x1
	add	r1, r1, #0x1
	sub	r2, r2, #0x1
	cmp	r2, #0
	bne	.L65	@cond_branch
.L72:
	mov	r0, #0x0
	b	.L71
.L65:
	ldrb	r0, [r3]
	ldrb	r4, [r1]
	cmp	r0, r4
	beq	.L67	@cond_branch
	ldrb	r0, [r3]
	ldrb	r1, [r1]
	sub	r0, r0, r1
.L71:
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe10:
	.size	 StringCompareN,.Lfe10-StringCompareN
	.align	2, 0
	.globl	ConvertIntToDecimalStringN
	.type	 ConvertIntToDecimalStringN,function
	.thumb_func
ConvertIntToDecimalStringN:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r4, r0, #0
	add	r6, r1, #0
	lsl	r3, r3, #0x18
	ldr	r0, .L92
	lsr	r3, r3, #0x16
	sub	r3, r3, #0x4
	add	r3, r3, r0
	ldr	r0, [r3]
	mov	r7, #0x0
	cmp	r2, #0x1
	bne	.L74	@cond_branch
	mov	r7, #0x2
.L74:
	cmp	r2, #0x2
	bne	.L75	@cond_branch
	mov	r7, #0x1
.L75:
	add	r5, r0, #0
	cmp	r5, #0
	ble	.L77	@cond_branch
	ldr	r0, .L92+0x4
	mov	r8, r0
.L79:
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__divsi3
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	mov	r0, r5
	mul	r0, r0, r2
	sub	r1, r6, r0
	cmp	r7, #0x1
	bne	.L80	@cond_branch
	add	r3, r4, #0
	add	r4, r4, #0x1
	cmp	r2, #0x9
	bls	.L91	@cond_branch
	b	.L86
.L93:
	.align	2, 0
.L92:
	.word	sPowersOfTen
	.word	sDigits
.L80:
	cmp	r2, #0
	bne	.L85	@cond_branch
	cmp	r5, #0x1
	bne	.L84	@cond_branch
.L85:
	mov	r7, #0x1
	add	r3, r4, #0
	add	r4, r4, #0x1
	cmp	r2, #0x9
	bhi	.L86	@cond_branch
.L91:
	mov	r6, r8
	add	r0, r2, r6
	ldrb	r0, [r0]
	b	.L87
.L86:
	mov	r0, #0xac
.L87:
	strb	r0, [r3]
	b	.L83
.L84:
	cmp	r7, #0x2
	bne	.L83	@cond_branch
	strb	r2, [r4]
	add	r4, r4, #0x1
.L83:
	add	r6, r1, #0
	add	r0, r5, #0
	mov	r1, #0xa
	bl	__divsi3
	add	r5, r0, #0
	cmp	r5, #0
	bgt	.L79	@cond_branch
.L77:
	mov	r0, #0xff
	strb	r0, [r4]
	add	r0, r4, #0
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.Lfe11:
	.size	 ConvertIntToDecimalStringN,.Lfe11-ConvertIntToDecimalStringN
	.align	2, 0
	.globl	ConvertIntToDecimalStringN_DigitWidth6
	.type	 ConvertIntToDecimalStringN_DigitWidth6,function
	.thumb_func
ConvertIntToDecimalStringN_DigitWidth6:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r4, r0, #0
	add	r6, r1, #0
	lsl	r3, r3, #0x18
	ldr	r0, .L113
	lsr	r3, r3, #0x16
	sub	r3, r3, #0x4
	add	r3, r3, r0
	ldr	r1, [r3]
	mov	r0, #0xfc
	strb	r0, [r4]
	add	r4, r4, #0x1
	mov	r0, #0x14
	strb	r0, [r4]
	add	r4, r4, #0x1
	mov	r0, #0x6
	strb	r0, [r4]
	add	r4, r4, #0x1
	mov	r7, #0x0
	cmp	r2, #0x1
	bne	.L95	@cond_branch
	mov	r7, #0x2
.L95:
	cmp	r2, #0x2
	bne	.L96	@cond_branch
	mov	r7, #0x1
.L96:
	add	r5, r1, #0
	cmp	r5, #0
	ble	.L98	@cond_branch
	ldr	r0, .L113+0x4
	mov	r8, r0
.L100:
	add	r0, r6, #0
	add	r1, r5, #0
	bl	__divsi3
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	mov	r0, r5
	mul	r0, r0, r2
	sub	r1, r6, r0
	cmp	r7, #0x1
	bne	.L101	@cond_branch
	add	r3, r4, #0
	add	r4, r4, #0x1
	cmp	r2, #0x9
	bls	.L112	@cond_branch
	b	.L107
.L114:
	.align	2, 0
.L113:
	.word	sPowersOfTen
	.word	sDigits
.L101:
	cmp	r2, #0
	bne	.L106	@cond_branch
	cmp	r5, #0x1
	bne	.L105	@cond_branch
.L106:
	mov	r7, #0x1
	add	r3, r4, #0
	add	r4, r4, #0x1
	cmp	r2, #0x9
	bhi	.L107	@cond_branch
.L112:
	mov	r6, r8
	add	r0, r2, r6
	ldrb	r0, [r0]
	b	.L108
.L107:
	mov	r0, #0xac
.L108:
	strb	r0, [r3]
	b	.L104
.L105:
	cmp	r7, #0x2
	bne	.L104	@cond_branch
	strb	r2, [r4]
	add	r4, r4, #0x1
.L104:
	add	r6, r1, #0
	add	r0, r5, #0
	mov	r1, #0xa
	bl	__divsi3
	add	r5, r0, #0
	cmp	r5, #0
	bgt	.L100	@cond_branch
.L98:
	mov	r0, #0xfc
	strb	r0, [r4]
	add	r4, r4, #0x1
	mov	r0, #0x14
	strb	r0, [r4]
	add	r4, r4, #0x1
	mov	r0, #0x0
	strb	r0, [r4]
	add	r4, r4, #0x1
	mov	r0, #0xff
	strb	r0, [r4]
	add	r0, r4, #0
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.Lfe12:
	.size	 ConvertIntToDecimalStringN_DigitWidth6,.Lfe12-ConvertIntToDecimalStringN_DigitWidth6
	.align	2, 0
	.globl	ConvertIntToHexStringN
	.type	 ConvertIntToHexStringN,function
	.thumb_func
ConvertIntToHexStringN:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffffc
	add	r6, r0, #0
	add	r7, r1, #0
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	mov	r1, #0x1
	mov	r0, #0x1
	cmp	r1, r3
	bcs	.L117	@cond_branch
.L119:
	lsl	r1, r1, #0x4
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, r3
	bcc	.L119	@cond_branch
.L117:
	mov	r3, #0x0
	cmp	r2, #0x1
	bne	.L121	@cond_branch
	mov	r3, #0x2
.L121:
	cmp	r2, #0x2
	bne	.L122	@cond_branch
	mov	r3, #0x1
.L122:
	add	r5, r1, #0
	cmp	r5, #0
	ble	.L124	@cond_branch
	ldr	r0, .L140
	mov	r8, r0
.L126:
	add	r0, r7, #0
	add	r1, r5, #0
	str	r3, [sp]
	bl	__divsi3
	add	r4, r0, #0
	add	r0, r7, #0
	add	r1, r5, #0
	bl	__modsi3
	add	r1, r0, #0
	ldr	r3, [sp]
	cmp	r3, #0x1
	bne	.L127	@cond_branch
	add	r2, r6, #0
	add	r6, r6, #0x1
	cmp	r4, #0xf
	bls	.L139	@cond_branch
	b	.L133
.L141:
	.align	2, 0
.L140:
	.word	sDigits
.L127:
	cmp	r4, #0
	bne	.L132	@cond_branch
	cmp	r5, #0x1
	bne	.L131	@cond_branch
.L132:
	mov	r3, #0x1
	add	r2, r6, #0
	add	r6, r6, #0x1
	cmp	r4, #0xf
	bhi	.L133	@cond_branch
.L139:
	mov	r7, r8
	add	r0, r4, r7
	ldrb	r0, [r0]
	b	.L134
.L133:
	mov	r0, #0xac
.L134:
	strb	r0, [r2]
	b	.L130
.L131:
	cmp	r3, #0x2
	bne	.L130	@cond_branch
	strb	r4, [r6]
	add	r6, r6, #0x1
.L130:
	add	r7, r1, #0
	add	r0, r5, #0
	cmp	r5, #0
	bge	.L137	@cond_branch
	add	r0, r0, #0xf
.L137:
	asr	r5, r0, #0x4
	cmp	r5, #0
	bgt	.L126	@cond_branch
.L124:
	mov	r0, #0xff
	strb	r0, [r6]
	add	r0, r6, #0
	add	sp, sp, #0x4
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.Lfe13:
	.size	 ConvertIntToHexStringN,.Lfe13-ConvertIntToHexStringN
	.align	2, 0
	.globl	ConvertIntToDecimalString
	.type	 ConvertIntToDecimalString,function
	.thumb_func
ConvertIntToDecimalString:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff4
	add	r7, r0, #0
	add	r5, r1, #0
	mov	r6, #0x0
	ldr	r0, .L152
	mov	r8, r0
.L143:
	mov	r2, sp
	add	r4, r2, r6
	add	r0, r5, #0
	mov	r1, #0xa
	bl	__modsi3
	add	r0, r0, r8
	ldrb	r0, [r0]
	strb	r0, [r4]
	add	r6, r6, #0x1
	add	r0, r5, #0
	mov	r1, #0xa
	bl	__divsi3
	add	r5, r0, #0
	cmp	r5, #0
	bne	.L143	@cond_branch
	sub	r6, r6, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r6, r0
	beq	.L149	@cond_branch
	add	r1, r0, #0
.L150:
	mov	r2, sp
	add	r0, r2, r6
	ldrb	r0, [r0]
	strb	r0, [r7]
	add	r7, r7, #0x1
	sub	r6, r6, #0x1
	cmp	r6, r1
	bne	.L150	@cond_branch
.L149:
	mov	r0, #0xff
	strb	r0, [r7]
	add	r0, r7, #0
	add	sp, sp, #0xc
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L153:
	.align	2, 0
.L152:
	.word	sDigits
.Lfe14:
	.size	 ConvertIntToDecimalString,.Lfe14-ConvertIntToDecimalString
	.align	2, 0
	.globl	StringExpandPlaceholders
	.type	 StringExpandPlaceholders,function
	.thumb_func
StringExpandPlaceholders:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	add	r6, r1, #0
.L155:
	ldrb	r2, [r6]
	add	r6, r6, #0x1
	add	r0, r2, #0
	sub	r0, r0, #0xfa
	cmp	r0, #0x5
	bhi	.L165	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L168
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L169:
	.align	2, 0
.L168:
	.word	.L166
	.align	2, 0
	.align	2, 0
.L166:
	.word	.L165
	.word	.L165
	.word	.L160
	.word	.L159
	.word	.L165
	.word	.L167
.L159:
	ldrb	r0, [r6]
	add	r6, r6, #0x1
	bl	GetExpandedPlaceholder
	add	r1, r0, #0
	add	r0, r5, #0
	bl	StringExpandPlaceholders
	add	r5, r0, #0
	b	.L155
.L160:
	strb	r2, [r5]
	add	r5, r5, #0x1
	ldrb	r0, [r6]
	bl	GetExtCtrlCodeLength
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	add	r0, r5, #0
	add	r1, r6, #0
	add	r2, r4, #0
	bl	memcpy
	add	r5, r5, r4
	add	r6, r6, r4
	b	.L155
.L165:
	strb	r2, [r5]
	add	r5, r5, #0x1
	b	.L155
.L167:
	mov	r0, #0xff
	strb	r0, [r5]
	add	r0, r5, #0
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.Lfe15:
	.size	 StringExpandPlaceholders,.Lfe15-StringExpandPlaceholders
	.section .rodata
.LC7:
	.byte	0xfc
	.byte	0x6
	.byte	0x6
	.byte	0xff
.LC9:
	.byte	0xfe
	.byte	0xfc
	.byte	0xe
	.byte	0x2
	.byte	0xff
.text
	.align	2, 0
	.globl	StringBraille
	.type	 StringBraille,function
	.thumb_func
StringBraille:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff4
	add	r5, r0, #0
	add	r6, r1, #0
	ldr	r1, .L181
	mov	r0, sp
	mov	r2, #0x4
	bl	memcpy
	add	r4, sp, #0x4
	ldr	r1, .L181+0x4
	add	r0, r4, #0
	mov	r2, #0x5
	bl	memcpy
	add	r0, r5, #0
	mov	r1, sp
.L180:
	bl	StringCopy
	add	r5, r0, #0
.L171:
	ldrb	r0, [r6]
	add	r6, r6, #0x1
	cmp	r0, #0xfe
	beq	.L176	@cond_branch
	cmp	r0, #0xff
	bne	.L177	@cond_branch
	b	.L179
.L182:
	.align	2, 0
.L181:
	.word	.LC7
	.word	.LC9
.L176:
	add	r0, r5, #0
	add	r1, r4, #0
	b	.L180
.L177:
	strb	r0, [r5]
	add	r5, r5, #0x1
	add	r0, r0, #0x40
	strb	r0, [r5]
	add	r5, r5, #0x1
	b	.L171
.L179:
	strb	r0, [r5]
	add	r0, r5, #0
	add	sp, sp, #0xc
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.Lfe16:
	.size	 StringBraille,.Lfe16-StringBraille
	.align	2, 0
	.type	 ExpandPlaceholder_UnknownStringVar,function
	.thumb_func
ExpandPlaceholder_UnknownStringVar:
	ldr	r0, .L184
	bx	lr
.L185:
	.align	2, 0
.L184:
	.word	gUnknownStringVar
.Lfe17:
	.size	 ExpandPlaceholder_UnknownStringVar,.Lfe17-ExpandPlaceholder_UnknownStringVar
	.align	2, 0
	.type	 ExpandPlaceholder_PlayerName,function
	.thumb_func
ExpandPlaceholder_PlayerName:
	ldr	r0, .L187
	bx	lr
.L188:
	.align	2, 0
.L187:
	.word	gSaveBlock2
.Lfe18:
	.size	 ExpandPlaceholder_PlayerName,.Lfe18-ExpandPlaceholder_PlayerName
	.align	2, 0
	.type	 ExpandPlaceholder_StringVar1,function
	.thumb_func
ExpandPlaceholder_StringVar1:
	ldr	r0, .L190
	bx	lr
.L191:
	.align	2, 0
.L190:
	.word	gStringVar1
.Lfe19:
	.size	 ExpandPlaceholder_StringVar1,.Lfe19-ExpandPlaceholder_StringVar1
	.align	2, 0
	.type	 ExpandPlaceholder_StringVar2,function
	.thumb_func
ExpandPlaceholder_StringVar2:
	ldr	r0, .L193
	bx	lr
.L194:
	.align	2, 0
.L193:
	.word	gStringVar2
.Lfe20:
	.size	 ExpandPlaceholder_StringVar2,.Lfe20-ExpandPlaceholder_StringVar2
	.align	2, 0
	.type	 ExpandPlaceholder_StringVar3,function
	.thumb_func
ExpandPlaceholder_StringVar3:
	ldr	r0, .L196
	bx	lr
.L197:
	.align	2, 0
.L196:
	.word	gStringVar3
.Lfe21:
	.size	 ExpandPlaceholder_StringVar3,.Lfe21-ExpandPlaceholder_StringVar3
	.align	2, 0
	.type	 ExpandPlaceholder_KunChan,function
	.thumb_func
ExpandPlaceholder_KunChan:
	push	{lr}
	ldr	r0, .L202
	ldrb	r0, [r0, #0x8]
	cmp	r0, #0
	beq	.L199	@cond_branch
	ldr	r0, .L202+0x4
	b	.L201
.L203:
	.align	2, 0
.L202:
	.word	gSaveBlock2
	.word	gExpandedPlaceholder_Chan
.L199:
	ldr	r0, .L204
.L201:
	pop	{r1}
	bx	r1
.L205:
	.align	2, 0
.L204:
	.word	gExpandedPlaceholder_Kun
.Lfe22:
	.size	 ExpandPlaceholder_KunChan,.Lfe22-ExpandPlaceholder_KunChan
	.align	2, 0
	.type	 ExpandPlaceholder_RivalName,function
	.thumb_func
ExpandPlaceholder_RivalName:
	push	{lr}
	ldr	r0, .L210
	ldrb	r0, [r0, #0x8]
	cmp	r0, #0
	beq	.L207	@cond_branch
	ldr	r0, .L210+0x4
	b	.L209
.L211:
	.align	2, 0
.L210:
	.word	gSaveBlock2
	.word	gExpandedPlaceholder_Brendan
.L207:
	ldr	r0, .L212
.L209:
	pop	{r1}
	bx	r1
.L213:
	.align	2, 0
.L212:
	.word	gExpandedPlaceholder_May
.Lfe23:
	.size	 ExpandPlaceholder_RivalName,.Lfe23-ExpandPlaceholder_RivalName
	.align	2, 0
	.type	 ExpandPlaceholder_Older,function
	.thumb_func
ExpandPlaceholder_Older:
	push	{lr}
	ldr	r0, .L218
	ldrb	r0, [r0, #0x8]
	cmp	r0, #0
	beq	.L215	@cond_branch
	ldr	r0, .L218+0x4
	b	.L217
.L219:
	.align	2, 0
.L218:
	.word	gSaveBlock2
	.word	gExpandedPlaceholder_Sister
.L215:
	ldr	r0, .L220
.L217:
	pop	{r1}
	bx	r1
.L221:
	.align	2, 0
.L220:
	.word	gExpandedPlaceholder_Brother
.Lfe24:
	.size	 ExpandPlaceholder_Older,.Lfe24-ExpandPlaceholder_Older
	.align	2, 0
	.type	 ExpandPlaceholder_Older2,function
	.thumb_func
ExpandPlaceholder_Older2:
	push	{lr}
	ldr	r0, .L226
	ldrb	r0, [r0, #0x8]
	cmp	r0, #0
	beq	.L223	@cond_branch
	ldr	r0, .L226+0x4
	b	.L225
.L227:
	.align	2, 0
.L226:
	.word	gSaveBlock2
	.word	gExpandedPlaceholder_Sister2
.L223:
	ldr	r0, .L228
.L225:
	pop	{r1}
	bx	r1
.L229:
	.align	2, 0
.L228:
	.word	gExpandedPlaceholder_Brother2
.Lfe25:
	.size	 ExpandPlaceholder_Older2,.Lfe25-ExpandPlaceholder_Older2
	.align	2, 0
	.type	 ExpandPlaceholder_Version,function
	.thumb_func
ExpandPlaceholder_Version:
	ldr	r0, .L231
	bx	lr
.L232:
	.align	2, 0
.L231:
	.word	gExpandedPlaceholder_Sapphire
.Lfe26:
	.size	 ExpandPlaceholder_Version,.Lfe26-ExpandPlaceholder_Version
	.align	2, 0
	.type	 ExpandPlaceholder_EvilTeam,function
	.thumb_func
ExpandPlaceholder_EvilTeam:
	ldr	r0, .L234
	bx	lr
.L235:
	.align	2, 0
.L234:
	.word	gExpandedPlaceholder_Aqua
.Lfe27:
	.size	 ExpandPlaceholder_EvilTeam,.Lfe27-ExpandPlaceholder_EvilTeam
	.align	2, 0
	.type	 ExpandPlaceholder_GoodTeam,function
	.thumb_func
ExpandPlaceholder_GoodTeam:
	ldr	r0, .L237
	bx	lr
.L238:
	.align	2, 0
.L237:
	.word	gExpandedPlaceholder_Magma
.Lfe28:
	.size	 ExpandPlaceholder_GoodTeam,.Lfe28-ExpandPlaceholder_GoodTeam
	.align	2, 0
	.type	 ExpandPlaceholder_EvilLeader,function
	.thumb_func
ExpandPlaceholder_EvilLeader:
	ldr	r0, .L240
	bx	lr
.L241:
	.align	2, 0
.L240:
	.word	gExpandedPlaceholder_Archie
.Lfe29:
	.size	 ExpandPlaceholder_EvilLeader,.Lfe29-ExpandPlaceholder_EvilLeader
	.align	2, 0
	.type	 ExpandPlaceholder_GoodLeader,function
	.thumb_func
ExpandPlaceholder_GoodLeader:
	ldr	r0, .L243
	bx	lr
.L244:
	.align	2, 0
.L243:
	.word	gExpandedPlaceholder_Maxie
.Lfe30:
	.size	 ExpandPlaceholder_GoodLeader,.Lfe30-ExpandPlaceholder_GoodLeader
	.align	2, 0
	.type	 ExpandPlaceholder_EvilLegendary,function
	.thumb_func
ExpandPlaceholder_EvilLegendary:
	ldr	r0, .L246
	bx	lr
.L247:
	.align	2, 0
.L246:
	.word	gExpandedPlaceholder_Kyogre
.Lfe31:
	.size	 ExpandPlaceholder_EvilLegendary,.Lfe31-ExpandPlaceholder_EvilLegendary
	.align	2, 0
	.type	 ExpandPlaceholder_GoodLegendary,function
	.thumb_func
ExpandPlaceholder_GoodLegendary:
	ldr	r0, .L249
	bx	lr
.L250:
	.align	2, 0
.L249:
	.word	gExpandedPlaceholder_Groudon
.Lfe32:
	.size	 ExpandPlaceholder_GoodLegendary,.Lfe32-ExpandPlaceholder_GoodLegendary
	.section .rodata
	.align	2, 0
	.type	 funcs.99,object
funcs.99:
	.word	ExpandPlaceholder_UnknownStringVar
	.word	ExpandPlaceholder_PlayerName
	.word	ExpandPlaceholder_StringVar1
	.word	ExpandPlaceholder_StringVar2
	.word	ExpandPlaceholder_StringVar3
	.word	ExpandPlaceholder_KunChan
	.word	ExpandPlaceholder_RivalName
	.word	ExpandPlaceholder_Version
	.word	ExpandPlaceholder_EvilTeam
	.word	ExpandPlaceholder_GoodTeam
	.word	ExpandPlaceholder_EvilLeader
	.word	ExpandPlaceholder_GoodLeader
	.word	ExpandPlaceholder_EvilLegendary
	.word	ExpandPlaceholder_GoodLegendary
	.word	ExpandPlaceholder_Older
	.word	ExpandPlaceholder_Older2
.text
	.align	2, 0
	.globl	GetExpandedPlaceholder
	.type	 GetExpandedPlaceholder,function
	.thumb_func
GetExpandedPlaceholder:
	push	{lr}
	cmp	r0, #0xf
	bhi	.L252	@cond_branch
	ldr	r1, .L255
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	bl	_call_via_r0
	b	.L254
.L256:
	.align	2, 0
.L255:
	.word	funcs.99
.L252:
	ldr	r0, .L257
.L254:
	pop	{r1}
	bx	r1
.L258:
	.align	2, 0
.L257:
	.word	gExpandedPlaceholder_Empty
.Lfe33:
	.size	 GetExpandedPlaceholder,.Lfe33-GetExpandedPlaceholder
	.align	2, 0
	.globl	StringFill
	.type	 StringFill,function
	.thumb_func
StringFill:
	push	{lr}
	add	r3, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r0, #0x0
	cmp	r0, r2
	bcs	.L261	@cond_branch
.L263:
	strb	r1, [r3]
	add	r3, r3, #0x1
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r0, r2
	bcc	.L263	@cond_branch
.L261:
	mov	r0, #0xff
	strb	r0, [r3]
	add	r0, r3, #0
	pop	{r1}
	bx	r1
.Lfe34:
	.size	 StringFill,.Lfe34-StringFill
	.align	2, 0
	.globl	StringCopyPadded
	.type	 StringCopyPadded,function
	.thumb_func
StringCopyPadded:
	push	{r4, r5, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	b	.L266
.L268:
	strb	r1, [r4]
	add	r5, r5, #0x1
	add	r4, r4, #0x1
	cmp	r3, #0
	beq	.L266	@cond_branch
	sub	r0, r3, #0x1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
.L266:
	ldrb	r1, [r5]
	add	r0, r1, #0
	cmp	r0, #0xff
	bne	.L268	@cond_branch
	sub	r0, r3, #0x1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	ldr	r0, .L275
	cmp	r3, r0
	beq	.L272	@cond_branch
	add	r1, r0, #0
.L273:
	strb	r2, [r4]
	add	r4, r4, #0x1
	sub	r0, r3, #0x1
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	cmp	r3, r1
	bne	.L273	@cond_branch
.L272:
	mov	r0, #0xff
	strb	r0, [r4]
	add	r0, r4, #0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L276:
	.align	2, 0
.L275:
	.word	0xffff
.Lfe35:
	.size	 StringCopyPadded,.Lfe35-StringCopyPadded
	.align	2, 0
	.globl	StringFillWithTerminator
	.type	 StringFillWithTerminator,function
	.thumb_func
StringFillWithTerminator:
	push	{lr}
	lsl	r2, r1, #0x10
	lsr	r2, r2, #0x10
	mov	r1, #0xff
	bl	StringFill
	pop	{r1}
	bx	r1
.Lfe36:
	.size	 StringFillWithTerminator,.Lfe36-StringFillWithTerminator
	.comm	gUnknownStringVar, 16	@ 16
.text
	.align	2, 0