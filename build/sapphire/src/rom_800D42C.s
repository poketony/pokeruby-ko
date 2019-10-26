@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
.text
	.align	2, 0
	.globl	PrintLinkBattleWinLossTie
	.type	 PrintLinkBattleWinLossTie,function
	.thumb_func
PrintLinkBattleWinLossTie:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffffc
	ldr	r0, .L31
	ldrb	r2, [r0]
	cmp	r2, #0x3
	bne	.L3	@cond_branch
	ldr	r4, .L31+0x4
	ldr	r1, .L31+0x8
	mov	r0, #0x2
	str	r0, [sp]
	add	r0, r4, #0
	mov	r2, #0xa0
	mov	r3, #0xd
	b	.L29
.L32:
	.align	2, 0
.L31:
	.word	gBattleOutcome
	.word	gUnknown_03004210
	.word	BattleText_Tie
.L3:
	ldr	r0, .L33
	ldrh	r1, [r0]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L4	@cond_branch
	cmp	r2, #0x1
	bne	.L5	@cond_branch
	ldr	r2, .L33+0x4
	ldr	r0, .L33+0x8
	ldr	r1, .L33+0xc
	add	r0, r0, r1
	ldrb	r1, [r0]
	lsl	r0, r1, #0x3
	sub	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldrh	r0, [r0, #0x18]
	cmp	r0, #0x1
	beq	.L10	@cond_branch
	cmp	r0, #0x1
	bgt	.L13	@cond_branch
	cmp	r0, #0
	bne	.LCB62
	b	.L30	@long jump
.LCB62:
	b	.L2
.L34:
	.align	2, 0
.L33:
	.word	gBattleTypeFlags
	.word	gLinkPlayers
	.word	gSharedMem
	.word	0x160cb
.L13:
	cmp	r0, #0x2
	bne	.LCB76
	b	.L30	@long jump
.LCB76:
	cmp	r0, #0x3
	beq	.LCB78
	b	.L2	@long jump
.LCB78:
.L10:
	ldr	r4, .L35
	ldr	r1, .L35+0x4
	mov	r5, #0x2
	str	r5, [sp]
	add	r0, r4, #0
	mov	r2, #0xa0
	mov	r3, #0x15
	bl	InitWindow
	add	r0, r4, #0
	bl	sub_8002F44
	ldr	r1, .L35+0x8
	str	r5, [sp]
	add	r0, r4, #0
	mov	r2, #0xa8
	mov	r3, #0x6
	b	.L29
.L36:
	.align	2, 0
.L35:
	.word	gUnknown_03004210
	.word	BattleText_Win
	.word	BattleText_Loss
.L5:
	ldr	r2, .L37
	ldr	r0, .L37+0x4
	ldr	r1, .L37+0x8
	add	r0, r0, r1
	ldrb	r1, [r0]
	lsl	r0, r1, #0x3
	sub	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldrh	r0, [r0, #0x18]
	cmp	r0, #0x1
	beq	.L30	@cond_branch
	cmp	r0, #0x1
	bgt	.L22	@cond_branch
	cmp	r0, #0
	beq	.L19	@cond_branch
	b	.L2
.L38:
	.align	2, 0
.L37:
	.word	gLinkPlayers
	.word	gSharedMem
	.word	0x160cb
.L22:
	cmp	r0, #0x2
	beq	.L19	@cond_branch
	cmp	r0, #0x3
	beq	.LCB148
	b	.L2	@long jump
.LCB148:
	b	.L30
.L19:
	ldr	r4, .L39
	ldr	r1, .L39+0x4
	mov	r5, #0x2
	str	r5, [sp]
	add	r0, r4, #0
	mov	r2, #0xa0
	mov	r3, #0x15
	bl	InitWindow
	add	r0, r4, #0
	bl	sub_8002F44
	ldr	r1, .L39+0x8
	str	r5, [sp]
	add	r0, r4, #0
	mov	r2, #0xa8
	mov	r3, #0x6
	b	.L29
.L40:
	.align	2, 0
.L39:
	.word	gUnknown_03004210
	.word	BattleText_Win
	.word	BattleText_Loss
.L4:
	cmp	r2, #0x1
	bne	.L23	@cond_branch
	ldr	r2, .L41
	ldr	r0, .L41+0x4
	ldr	r1, .L41+0x8
	add	r0, r0, r1
	ldrb	r1, [r0]
	lsl	r0, r1, #0x3
	sub	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldrh	r0, [r0, #0x18]
	cmp	r0, #0
	beq	.L30	@cond_branch
	ldr	r4, .L41+0xc
	ldr	r1, .L41+0x10
	mov	r5, #0x2
	str	r5, [sp]
	add	r0, r4, #0
	mov	r2, #0xa0
	mov	r3, #0x15
	bl	InitWindow
	add	r0, r4, #0
	bl	sub_8002F44
	ldr	r1, .L41+0x14
	str	r5, [sp]
	add	r0, r4, #0
	mov	r2, #0xa8
	mov	r3, #0x6
	b	.L29
.L42:
	.align	2, 0
.L41:
	.word	gLinkPlayers
	.word	gSharedMem
	.word	0x160cb
	.word	gUnknown_03004210
	.word	BattleText_Win
	.word	BattleText_Loss
.L23:
	ldr	r2, .L43
	ldr	r0, .L43+0x4
	ldr	r1, .L43+0x8
	add	r0, r0, r1
	ldrb	r1, [r0]
	lsl	r0, r1, #0x3
	sub	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldrh	r0, [r0, #0x18]
	cmp	r0, #0
	beq	.L27	@cond_branch
.L30:
	ldr	r4, .L43+0xc
	ldr	r1, .L43+0x10
	mov	r5, #0x2
	str	r5, [sp]
	add	r0, r4, #0
	mov	r2, #0xa0
	mov	r3, #0x6
	bl	InitWindow
	add	r0, r4, #0
	bl	sub_8002F44
	ldr	r1, .L43+0x14
	str	r5, [sp]
	add	r0, r4, #0
	mov	r2, #0xa8
	mov	r3, #0x15
.L29:
	bl	InitWindow
	add	r0, r4, #0
	bl	sub_8002F44
	b	.L2
.L44:
	.align	2, 0
.L43:
	.word	gLinkPlayers
	.word	gSharedMem
	.word	0x160cb
	.word	gUnknown_03004210
	.word	BattleText_Win
	.word	BattleText_Loss
.L27:
	ldr	r4, .L45
	ldr	r1, .L45+0x4
	mov	r5, #0x2
	str	r5, [sp]
	add	r0, r4, #0
	mov	r2, #0xa0
	mov	r3, #0x15
	bl	InitWindow
	add	r0, r4, #0
	bl	sub_8002F44
	ldr	r1, .L45+0x8
	str	r5, [sp]
	add	r0, r4, #0
	mov	r2, #0xa8
	mov	r3, #0x6
	bl	InitWindow
	add	r0, r4, #0
	bl	sub_8002F44
.L2:
	add	sp, sp, #0x4
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L46:
	.align	2, 0
.L45:
	.word	gUnknown_03004210
	.word	BattleText_Win
	.word	BattleText_Loss
.Lfe1:
	.size	 PrintLinkBattleWinLossTie,.Lfe1-PrintLinkBattleWinLossTie
.text
	.align	2, 0
