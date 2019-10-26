@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.section ewram_data,"aw"
	.align	1, 0
	.type	 sWinNumberDigit,object
	.size	 sWinNumberDigit,2
sWinNumberDigit:
	.short	0x0
	.align	1, 0
	.type	 sOtIdDigit,object
	.size	 sOtIdDigit,2
sOtIdDigit:
	.short	0x0
	.section .rodata
	.align	1, 0
	.type	 sLotteryPrizes,object
sLotteryPrizes:
	.short	0x45
	.short	0xb6
	.short	0x19
	.short	0x1
	.size	 sLotteryPrizes,8
.text
	.align	2, 0
	.globl	ResetLotteryCorner
	.type	 ResetLotteryCorner,function
	.thumb_func
ResetLotteryCorner:
	push	{r4, lr}
	bl	Random
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	bl	Random
	lsl	r0, r0, #0x10
	orr	r0, r0, r4
	bl	SetLotteryNumber
	ldr	r0, .L3
	mov	r1, #0x0
	bl	VarSet
	pop	{r4}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.word	0x4045
.Lfe1:
	.size	 ResetLotteryCorner,.Lfe1-ResetLotteryCorner
	.align	2, 0
	.globl	SetRandomLotteryNumber
	.type	 SetRandomLotteryNumber,function
	.thumb_func
SetRandomLotteryNumber:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	bl	Random
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	sub	r0, r4, #0x1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	ldr	r0, .L10
	cmp	r4, r0
	beq	.L7	@cond_branch
	ldr	r5, .L10+0x4
	ldr	r3, .L10+0x8
	add	r2, r0, #0
.L8:
	mov	r0, r1
	mul	r0, r0, r5
	add	r1, r0, r3
	sub	r0, r4, #0x1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, r2
	bne	.L8	@cond_branch
.L7:
	add	r0, r1, #0
	bl	SetLotteryNumber
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L11:
	.align	2, 0
.L10:
	.word	0xffff
	.word	0x41c64e6d
	.word	0x3039
.Lfe2:
	.size	 SetRandomLotteryNumber,.Lfe2-SetRandomLotteryNumber
	.align	2, 0
	.globl	RetrieveLotteryNumber
	.type	 RetrieveLotteryNumber,function
	.thumb_func
RetrieveLotteryNumber:
	push	{lr}
	bl	GetLotteryNumber
	ldr	r1, .L13
	strh	r0, [r1]
	pop	{r0}
	bx	r0
.L14:
	.align	2, 0
.L13:
	.word	gScriptResult
.Lfe3:
	.size	 RetrieveLotteryNumber,.Lfe3-RetrieveLotteryNumber
	.align	2, 0
	.globl	PickLotteryCornerTicket
	.type	 PickLotteryCornerTicket,function
	.thumb_func
PickLotteryCornerTicket:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r1, .L40
	mov	r0, #0x0
	strh	r0, [r1]
	mov	r0, #0x0
	mov	sl, r0
	mov	r9, r0
	mov	r6, #0x0
.L19:
	mov	r0, #0x64
	mov	r1, r6
	mul	r1, r1, r0
	ldr	r0, .L40+0x4
	add	r4, r1, r0
	add	r0, r4, #0
	mov	r1, #0xb
	bl	GetMonData
	cmp	r0, #0
	beq	.L17	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x2d
	bl	GetMonData
	cmp	r0, #0
	bne	.L18	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x1
	bl	GetMonData
	add	r1, r0, #0
	ldr	r0, .L40+0x8
	ldrh	r0, [r0]
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	bl	GetMatchingDigits
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r1, .L40
	ldrh	r2, [r1]
	cmp	r0, r2
	bls	.L18	@cond_branch
	cmp	r0, #0x1
	bls	.L18	@cond_branch
	sub	r0, r0, #0x1
	strh	r0, [r1]
	mov	r0, #0xe
	mov	r9, r0
	mov	sl, r6
.L18:
	add	r0, r6, #0x1
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	cmp	r6, #0x5
	bls	.L19	@cond_branch
.L17:
	mov	r6, #0x0
.L28:
	mov	r5, #0x0
	add	r1, r6, #0x1
	mov	r8, r1
	lsl	r0, r6, #0x2
	add	r7, r0, r6
.L32:
	lsl	r2, r7, #0x4
	sub	r2, r2, r7
	lsl	r2, r2, #0x5
	lsl	r0, r5, #0x2
	add	r0, r0, r5
	lsl	r0, r0, #0x4
	ldr	r1, .L40+0xc
	add	r0, r0, r1
	add	r4, r2, r0
	add	r0, r4, #0
	mov	r1, #0xb
	bl	GetBoxMonData
	cmp	r0, #0
	beq	.L31	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x2d
	bl	GetBoxMonData
	cmp	r0, #0
	bne	.L31	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x1
	bl	GetBoxMonData
	add	r1, r0, #0
	ldr	r0, .L40+0x8
	ldrh	r0, [r0]
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	bl	GetMatchingDigits
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	ldr	r1, .L40
	ldrh	r2, [r1]
	cmp	r0, r2
	bls	.L31	@cond_branch
	cmp	r0, #0x1
	bls	.L31	@cond_branch
	sub	r0, r0, #0x1
	strh	r0, [r1]
	mov	r9, r6
	mov	sl, r5
.L31:
	add	r0, r5, #0x1
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	cmp	r5, #0x1d
	bls	.L32	@cond_branch
	mov	r1, r8
	lsl	r0, r1, #0x10
	lsr	r6, r0, #0x10
	cmp	r6, #0xd
	bls	.L28	@cond_branch
	ldr	r3, .L40
	ldrh	r0, [r3]
	cmp	r0, #0
	beq	.L37	@cond_branch
	ldr	r2, .L40+0x10
	ldr	r1, .L40+0x14
	sub	r0, r0, #0x1
	lsl	r0, r0, #0x1
	add	r0, r0, r1
	ldrh	r0, [r0]
	strh	r0, [r2]
	mov	r2, r9
	cmp	r2, #0xe
	bne	.L38	@cond_branch
	ldr	r1, .L40+0x18
	mov	r0, #0x0
	strh	r0, [r1]
	mov	r0, #0x64
	mov	r1, sl
	mul	r1, r1, r0
	add	r0, r1, #0
	ldr	r1, .L40+0x4
	add	r0, r0, r1
	ldr	r2, .L40+0x1c
	mov	r1, #0x2
	bl	GetMonData
	b	.L39
.L41:
	.align	2, 0
.L40:
	.word	gSpecialVar_0x8004
	.word	gPlayerParty
	.word	gScriptResult
	.word	gPokemonStorage+0x4
	.word	gSpecialVar_0x8005
	.word	sLotteryPrizes
	.word	gSpecialVar_0x8006
	.word	gStringVar1
.L38:
	ldr	r1, .L42
	mov	r0, #0x1
	strh	r0, [r1]
	mov	r2, r9
	lsl	r1, r2, #0x2
	add	r1, r1, r9
	lsl	r0, r1, #0x4
	sub	r0, r0, r1
	lsl	r0, r0, #0x5
	mov	r2, sl
	lsl	r1, r2, #0x2
	add	r1, r1, sl
	lsl	r1, r1, #0x4
	ldr	r2, .L42+0x4
	add	r1, r1, r2
	add	r0, r0, r1
	ldr	r2, .L42+0x8
	mov	r1, #0x2
	bl	GetBoxMonData
.L39:
	ldr	r0, .L42+0x8
	bl	StringGetEnd10
.L37:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L43:
	.align	2, 0
.L42:
	.word	gSpecialVar_0x8006
	.word	gPokemonStorage+0x4
	.word	gStringVar1
.Lfe4:
	.size	 PickLotteryCornerTicket,.Lfe4-PickLotteryCornerTicket
	.align	2, 0
	.type	 GetMatchingDigits,function
	.thumb_func
GetMatchingDigits:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	lsl	r1, r1, #0x10
	lsr	r5, r1, #0x10
	mov	r0, #0x0
	mov	r8, r0
	mov	r7, #0x0
	ldr	r1, .L52
	mov	sl, r1
	ldr	r0, .L52+0x4
	mov	r9, r0
.L48:
	add	r0, r6, #0
	mov	r1, #0xa
	bl	__umodsi3
	add	r4, r0, #0
	mov	r1, sl
	strh	r4, [r1]
	add	r0, r5, #0
	mov	r1, #0xa
	bl	__umodsi3
	mov	r1, r9
	strh	r0, [r1]
	lsl	r4, r4, #0x10
	lsl	r0, r0, #0x10
	cmp	r4, r0
	bne	.L46	@cond_branch
	add	r0, r6, #0
	mov	r1, #0xa
	bl	__udivsi3
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	add	r0, r5, #0
	mov	r1, #0xa
	bl	__udivsi3
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	mov	r0, r8
	add	r0, r0, #0x1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r8, r0
	add	r0, r7, #0x1
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	cmp	r7, #0x4
	bls	.L48	@cond_branch
.L46:
	mov	r0, r8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L53:
	.align	2, 0
.L52:
	.word	sWinNumberDigit
	.word	sOtIdDigit
.Lfe5:
	.size	 GetMatchingDigits,.Lfe5-GetMatchingDigits
	.align	2, 0
	.globl	SetLotteryNumber
	.type	 SetLotteryNumber,function
	.thumb_func
SetLotteryNumber:
	push	{r4, lr}
	add	r1, r0, #0
	lsr	r4, r1, #0x10
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	ldr	r0, .L55
	bl	VarSet
	ldr	r0, .L55+0x4
	add	r1, r4, #0
	bl	VarSet
	pop	{r4}
	pop	{r0}
	bx	r0
.L56:
	.align	2, 0
.L55:
	.word	0x404b
	.word	0x404c
.Lfe6:
	.size	 SetLotteryNumber,.Lfe6-SetLotteryNumber
	.align	2, 0
	.globl	GetLotteryNumber
	.type	 GetLotteryNumber,function
	.thumb_func
GetLotteryNumber:
	push	{r4, lr}
	ldr	r0, .L58
	bl	VarGet
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	ldr	r0, .L58+0x4
	bl	VarGet
	lsl	r0, r0, #0x10
	orr	r0, r0, r4
	pop	{r4}
	pop	{r1}
	bx	r1
.L59:
	.align	2, 0
.L58:
	.word	0x404b
	.word	0x404c
.Lfe7:
	.size	 GetLotteryNumber,.Lfe7-GetLotteryNumber
	.align	2, 0
	.globl	SetLotteryNumber16_Unused
	.type	 SetLotteryNumber16_Unused,function
	.thumb_func
SetLotteryNumber16_Unused:
	push	{lr}
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	SetLotteryNumber
	pop	{r0}
	bx	r0
.Lfe8:
	.size	 SetLotteryNumber16_Unused,.Lfe8-SetLotteryNumber16_Unused
.text
	.align	2, 0
