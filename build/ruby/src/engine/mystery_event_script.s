@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.section ewram_data,"aw"
	.align	2, 0
	.type	 sMysteryEventScriptContext,object
	.size	 sMysteryEventScriptContext,116
sMysteryEventScriptContext:
	.byte	0x0
	.space	115
.text
	.align	2, 0
	.type	 CheckCompatibility,function
	.thumb_func
CheckCompatibility:
	push	{r4, lr}
	add	r4, r3, #0
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	mov	r3, #0x2
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L6	@cond_branch
	and	r1, r1, r3
	cmp	r1, #0
	beq	.L6	@cond_branch
	mov	r0, #0x4
	and	r2, r2, r0
	cmp	r2, #0
	beq	.L6	@cond_branch
	mov	r0, #0x80
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L6	@cond_branch
	mov	r0, #0x1
	b	.L7
.L6:
	mov	r0, #0x0
.L7:
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe1:
	.size	 CheckCompatibility,.Lfe1-CheckCompatibility
	.align	2, 0
	.type	 SetIncompatible,function
	.thumb_func
SetIncompatible:
	push	{lr}
	ldr	r0, .L9
	ldr	r1, .L9+0x4
	bl	StringExpandPlaceholders
	mov	r0, #0x3
	bl	SetMysteryEventScriptStatus
	pop	{r0}
	bx	r0
.L10:
	.align	2, 0
.L9:
	.word	gStringVar4
	.word	gOtherText_DataCannotUseVersion
.Lfe2:
	.size	 SetIncompatible,.Lfe2-SetIncompatible
	.align	2, 0
	.type	 InitMysteryEventScript,function
	.thumb_func
InitMysteryEventScript:
	push	{r4, r5, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	ldr	r1, .L12
	ldr	r2, .L12+0x4
	bl	InitScriptContext
	add	r0, r4, #0
	add	r1, r5, #0
	bl	SetupBytecodeScript
	str	r5, [r4, #0x64]
	mov	r0, #0x0
	str	r0, [r4, #0x68]
	str	r0, [r4, #0x6c]
	str	r0, [r4, #0x70]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L13:
	.align	2, 0
.L12:
	.word	gMysteryEventScriptCmdTable
	.word	gMysteryEventScriptCmdTableEnd
.Lfe3:
	.size	 InitMysteryEventScript,.Lfe3-InitMysteryEventScript
	.align	2, 0
	.type	 RunMysteryEventScriptCommand,function
	.thumb_func
RunMysteryEventScriptCommand:
	push	{r4, lr}
	add	r4, r0, #0
	bl	RunScriptCommand
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L15	@cond_branch
	ldr	r0, [r4, #0x70]
	cmp	r0, #0
	beq	.L15	@cond_branch
	mov	r0, #0x1
	b	.L17
.L15:
	mov	r0, #0x0
.L17:
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe4:
	.size	 RunMysteryEventScriptCommand,.Lfe4-RunMysteryEventScriptCommand
	.align	2, 0
	.globl	RunMysteryEventScript
	.type	 RunMysteryEventScript,function
	.thumb_func
RunMysteryEventScript:
	push	{r4, lr}
	add	r1, r0, #0
	ldr	r4, .L23
	add	r0, r4, #0
	bl	InitMysteryEventScript
.L19:
	add	r0, r4, #0
	bl	RunMysteryEventScriptCommand
	cmp	r0, #0
	bne	.L19	@cond_branch
	ldr	r0, [r4, #0x6c]
	pop	{r4}
	pop	{r1}
	bx	r1
.L24:
	.align	2, 0
.L23:
	.word	sMysteryEventScriptContext
.Lfe5:
	.size	 RunMysteryEventScript,.Lfe5-RunMysteryEventScript
	.align	2, 0
	.globl	SetMysteryEventScriptStatus
	.type	 SetMysteryEventScriptStatus,function
	.thumb_func
SetMysteryEventScriptStatus:
	ldr	r1, .L26
	str	r0, [r1, #0x6c]
	bx	lr
.L27:
	.align	2, 0
.L26:
	.word	sMysteryEventScriptContext
.Lfe6:
	.size	 SetMysteryEventScriptStatus,.Lfe6-SetMysteryEventScriptStatus
	.align	2, 0
	.type	 CalcChecksum,function
	.thumb_func
CalcChecksum:
	push	{r4, lr}
	add	r4, r0, #0
	mov	r3, #0x0
	mov	r2, #0x0
	cmp	r3, r1
	bcs	.L30	@cond_branch
.L32:
	add	r0, r4, r2
	ldrb	r0, [r0]
	add	r3, r3, r0
	add	r2, r2, #0x1
	cmp	r2, r1
	bcc	.L32	@cond_branch
.L30:
	add	r0, r3, #0
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe7:
	.size	 CalcChecksum,.Lfe7-CalcChecksum
	.align	2, 0
	.type	 GetWord,function
	.thumb_func
GetWord:
	add	r2, r0, #0
	ldrb	r0, [r2]
	ldrb	r1, [r2, #0x1]
	lsl	r1, r1, #0x8
	orr	r0, r0, r1
	ldrb	r1, [r2, #0x2]
	lsl	r1, r1, #0x10
	orr	r0, r0, r1
	ldrb	r1, [r2, #0x3]
	lsl	r1, r1, #0x18
	orr	r0, r0, r1
	bx	lr
.Lfe8:
	.size	 GetWord,.Lfe8-GetWord
	.align	2, 0
	.type	 SetWord,function
	.thumb_func
SetWord:
	strb	r1, [r0]
	lsr	r2, r1, #0x8
	strb	r2, [r0, #0x1]
	lsr	r2, r1, #0x10
	strb	r2, [r0, #0x2]
	lsr	r1, r1, #0x18
	strb	r1, [r0, #0x3]
	bx	lr
.Lfe9:
	.size	 SetWord,.Lfe9-SetWord
	.align	2, 0
	.globl	unref_sub_81261B4
	.type	 unref_sub_81261B4,function
	.thumb_func
unref_sub_81261B4:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	add	r7, r1, #0
	ldrb	r0, [r5]
	cmp	r0, #0x1
	bne	.L37	@cond_branch
	ldrb	r0, [r5, #0x11]
	cmp	r0, #0xf
	bne	.L37	@cond_branch
	add	r6, r5, #0
	add	r6, r6, #0x12
	add	r0, r6, #0
	bl	GetWord
	cmp	r0, #0
	bne	.L37	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x16
	bl	GetWord
	add	r4, r0, #0
	sub	r4, r4, r7
	add	r4, r4, r5
	add	r0, r5, #0
	add	r0, r0, #0x1a
	bl	GetWord
	add	r1, r0, #0
	sub	r1, r1, r7
	add	r1, r1, r5
	sub	r1, r1, r4
	add	r0, r4, #0
	bl	CalcChecksum
	add	r1, r0, #0
	add	r0, r6, #0
	bl	SetWord
	mov	r0, #0x1
	b	.L38
.L37:
	mov	r0, #0x0
.L38:
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.Lfe10:
	.size	 unref_sub_81261B4,.Lfe10-unref_sub_81261B4
	.align	2, 0
	.globl	unref_sub_812620C
	.type	 unref_sub_812620C,function
	.thumb_func
unref_sub_812620C:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	add	r7, r1, #0
	ldrb	r0, [r5]
	cmp	r0, #0x1
	bne	.L40	@cond_branch
	ldrb	r0, [r5, #0x11]
	cmp	r0, #0x10
	bne	.L40	@cond_branch
	add	r6, r5, #0
	add	r6, r6, #0x12
	add	r0, r6, #0
	bl	GetWord
	cmp	r0, #0
	bne	.L40	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0x16
	bl	GetWord
	add	r4, r0, #0
	sub	r4, r4, r7
	add	r4, r4, r5
	add	r0, r5, #0
	add	r0, r0, #0x1a
	bl	GetWord
	add	r1, r0, #0
	sub	r1, r1, r7
	add	r1, r1, r5
	sub	r1, r1, r4
	add	r0, r4, #0
	bl	CalcCRC16
	add	r1, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r0, r6, #0
	bl	SetWord
	mov	r0, #0x1
	b	.L41
.L40:
	mov	r0, #0x0
.L41:
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.Lfe11:
	.size	 unref_sub_812620C,.Lfe11-unref_sub_812620C
	.align	2, 0
	.type	 CalcRecordMixingGiftChecksum,function
	.thumb_func
CalcRecordMixingGiftChecksum:
	push	{lr}
	mov	r2, #0x0
	ldr	r3, .L48
	mov	r1, #0x0
.L46:
	add	r0, r3, r1
	ldrb	r0, [r0]
	add	r2, r2, r0
	add	r1, r1, #0x1
	cmp	r1, #0xb
	bls	.L46	@cond_branch
	add	r0, r2, #0
	pop	{r1}
	bx	r1
.L49:
	.align	2, 0
.L48:
	.word	gSaveBlock1+0x3a80
.Lfe12:
	.size	 CalcRecordMixingGiftChecksum,.Lfe12-CalcRecordMixingGiftChecksum
	.align	2, 0
	.type	 IsRecordMixingGiftValid,function
	.thumb_func
IsRecordMixingGiftValid:
	push	{r4, lr}
	ldr	r4, .L59
	bl	CalcRecordMixingGiftChecksum
	add	r1, r0, #0
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L58	@cond_branch
	ldrb	r0, [r4, #0x1]
	cmp	r0, #0
	beq	.L58	@cond_branch
	ldrh	r0, [r4, #0x2]
	cmp	r0, #0
	beq	.L58	@cond_branch
	cmp	r1, #0
	beq	.L58	@cond_branch
	sub	r0, r4, #0x4
	ldr	r0, [r0]
	cmp	r1, r0
	beq	.L55	@cond_branch
.L58:
	mov	r0, #0x0
	b	.L57
.L60:
	.align	2, 0
.L59:
	.word	gSaveBlock1+0x3a80
.L55:
	mov	r0, #0x1
.L57:
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe13:
	.size	 IsRecordMixingGiftValid,.Lfe13-IsRecordMixingGiftValid
	.align	2, 0
	.type	 ClearRecordMixingGift,function
	.thumb_func
ClearRecordMixingGift:
	push	{lr}
	add	sp, sp, #0xfffffffc
	mov	r1, sp
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r1, .L62
	ldr	r2, .L62+0x4
	mov	r0, sp
	bl	CpuSet
	add	sp, sp, #0x4
	pop	{r0}
	bx	r0
.L63:
	.align	2, 0
.L62:
	.word	gSaveBlock1+0x3a7c
	.word	0x1000008
.Lfe14:
	.size	 ClearRecordMixingGift,.Lfe14-ClearRecordMixingGift
	.align	2, 0
	.type	 SetRecordMixingGift,function
	.thumb_func
SetRecordMixingGift:
	push	{r4, r5, r6, lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r3, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r5, r1, #0
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	add	r6, r2, #0
	cmp	r3, #0
	beq	.L66	@cond_branch
	cmp	r1, #0
	beq	.L66	@cond_branch
	cmp	r2, #0
	bne	.L65	@cond_branch
.L66:
	bl	ClearRecordMixingGift
	b	.L67
.L65:
	ldr	r4, .L68
	mov	r1, #0xea
	lsl	r1, r1, #0x6
	add	r0, r4, r1
	strb	r3, [r0]
	add	r1, r1, #0x1
	add	r0, r4, r1
	strb	r5, [r0]
	add	r1, r1, #0x1
	add	r0, r4, r1
	strh	r6, [r0]
	bl	CalcRecordMixingGiftChecksum
	ldr	r1, .L68+0x4
	add	r4, r4, r1
	str	r0, [r4]
.L67:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L69:
	.align	2, 0
.L68:
	.word	gSaveBlock1
	.word	0x3a7c
.Lfe15:
	.size	 SetRecordMixingGift,.Lfe15-SetRecordMixingGift
	.align	2, 0
	.globl	GetRecordMixingGift
	.type	 GetRecordMixingGift,function
	.thumb_func
GetRecordMixingGift:
	push	{r4, r5, lr}
	ldr	r4, .L76
	bl	IsRecordMixingGiftValid
	cmp	r0, #0
	bne	.L71	@cond_branch
	bl	ClearRecordMixingGift
	mov	r0, #0x0
	b	.L75
.L77:
	.align	2, 0
.L76:
	.word	gSaveBlock1+0x3a80
.L71:
	ldrh	r5, [r4, #0x2]
	ldrb	r0, [r4, #0x1]
	sub	r0, r0, #0x1
	strb	r0, [r4, #0x1]
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L73	@cond_branch
	bl	ClearRecordMixingGift
	b	.L74
.L73:
	bl	CalcRecordMixingGiftChecksum
	sub	r1, r4, #0x4
	str	r0, [r1]
.L74:
	add	r0, r5, #0
.L75:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.Lfe16:
	.size	 GetRecordMixingGift,.Lfe16-GetRecordMixingGift
	.align	2, 0
	.globl	MEScrCmd_end
	.type	 MEScrCmd_end,function
	.thumb_func
MEScrCmd_end:
	push	{lr}
	bl	StopScript
	mov	r0, #0x1
	pop	{r1}
	bx	r1
.Lfe17:
	.size	 MEScrCmd_end,.Lfe17-MEScrCmd_end
	.align	2, 0
	.globl	MEScrCmd_checkcompat
	.type	 MEScrCmd_checkcompat,function
	.thumb_func
MEScrCmd_checkcompat:
	push	{r4, r5, r6, r7, lr}
	add	r7, r0, #0
	bl	ScriptReadWord
	str	r0, [r7, #0x68]
	add	r0, r7, #0
	bl	ScriptReadHalfword
	add	r5, r0, #0
	lsl	r5, r5, #0x10
	lsr	r5, r5, #0x10
	add	r0, r7, #0
	bl	ScriptReadWord
	add	r6, r0, #0
	add	r0, r7, #0
	bl	ScriptReadHalfword
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r7, #0
	bl	ScriptReadWord
	add	r3, r0, #0
	add	r0, r5, #0
	add	r1, r6, #0
	add	r2, r4, #0
	bl	CheckCompatibility
	cmp	r0, #0x1
	bne	.L80	@cond_branch
	str	r0, [r7, #0x70]
	b	.L81
.L80:
	bl	SetIncompatible
.L81:
	mov	r0, #0x1
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.Lfe18:
	.size	 MEScrCmd_checkcompat,.Lfe18-MEScrCmd_checkcompat
	.align	2, 0
	.globl	MEScrCmd_nop
	.type	 MEScrCmd_nop,function
	.thumb_func
MEScrCmd_nop:
	mov	r0, #0x0
	bx	lr
.Lfe19:
	.size	 MEScrCmd_nop,.Lfe19-MEScrCmd_nop
	.align	2, 0
	.globl	MEScrCmd_setstatus
	.type	 MEScrCmd_setstatus,function
	.thumb_func
MEScrCmd_setstatus:
	ldr	r1, [r0, #0x8]
	ldrb	r2, [r1]
	add	r1, r1, #0x1
	str	r1, [r0, #0x8]
	str	r2, [r0, #0x6c]
	mov	r0, #0x0
	bx	lr
.Lfe20:
	.size	 MEScrCmd_setstatus,.Lfe20-MEScrCmd_setstatus
	.align	2, 0
	.globl	MEScrCmd_setmsg
	.type	 MEScrCmd_setmsg,function
	.thumb_func
MEScrCmd_setmsg:
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldr	r0, [r4, #0x8]
	ldrb	r5, [r0]
	add	r0, r0, #0x1
	str	r0, [r4, #0x8]
	add	r0, r4, #0
	bl	ScriptReadWord
	ldr	r1, [r4, #0x68]
	sub	r0, r0, r1
	ldr	r1, [r4, #0x64]
	add	r1, r0, r1
	cmp	r5, #0xff
	beq	.L86	@cond_branch
	ldr	r0, [r4, #0x6c]
	cmp	r5, r0
	bne	.L85	@cond_branch
.L86:
	ldr	r0, .L87
	bl	StringExpandPlaceholders
.L85:
	mov	r0, #0x0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L88:
	.align	2, 0
.L87:
	.word	gStringVar4
.Lfe21:
	.size	 MEScrCmd_setmsg,.Lfe21-MEScrCmd_setmsg
	.align	2, 0
	.globl	MEScrCmd_runscript
	.type	 MEScrCmd_runscript,function
	.thumb_func
MEScrCmd_runscript:
	push	{r4, lr}
	add	r4, r0, #0
	bl	ScriptReadWord
	ldr	r1, [r4, #0x68]
	sub	r0, r0, r1
	ldr	r1, [r4, #0x64]
	add	r0, r0, r1
	bl	ScriptContext2_RunNewScript
	mov	r0, #0x0
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe22:
	.size	 MEScrCmd_runscript,.Lfe22-MEScrCmd_runscript
	.align	2, 0
	.globl	MEScrCmd_setenigmaberry
	.type	 MEScrCmd_setenigmaberry,function
	.thumb_func
MEScrCmd_setenigmaberry:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r7, r0, #0
	bl	IsEnigmaBerryValid
	mov	r8, r0
	add	r0, r7, #0
	bl	ScriptReadWord
	add	r4, r0, #0
	ldr	r0, [r7, #0x68]
	sub	r4, r4, r0
	ldr	r0, [r7, #0x64]
	add	r4, r4, r0
	ldr	r6, .L97
	ldr	r5, .L97+0x4
	add	r0, r6, #0
	add	r1, r5, #0
	mov	r2, #0x7
	bl	StringCopyN
	add	r0, r4, #0
	bl	SetEnigmaBerry
	ldr	r4, .L97+0x8
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x7
	bl	StringCopyN
	mov	r0, r8
	cmp	r0, #0
	bne	.L91	@cond_branch
	ldr	r0, .L97+0xc
	ldr	r1, .L97+0x10
	b	.L92
.L98:
	.align	2, 0
.L97:
	.word	gStringVar1
	.word	gSaveBlock1+0x3160
	.word	gStringVar2
	.word	gStringVar4
	.word	gOtherText_BerryObtainedDadHasIt
.L91:
	add	r0, r6, #0
	add	r1, r4, #0
	bl	StringCompare
	cmp	r0, #0
	beq	.L93	@cond_branch
	ldr	r0, .L99
	ldr	r1, .L99+0x4
	b	.L92
.L100:
	.align	2, 0
.L99:
	.word	gStringVar4
	.word	gOtherText_BerryTransformed
.L93:
	ldr	r0, .L101
	ldr	r1, .L101+0x4
.L92:
	bl	StringExpandPlaceholders
	mov	r0, #0x2
	str	r0, [r7, #0x6c]
	bl	IsEnigmaBerryValid
	cmp	r0, #0x1
	bne	.L95	@cond_branch
	ldr	r0, .L101+0x8
	mov	r1, #0x1
	bl	VarSet
	b	.L96
.L102:
	.align	2, 0
.L101:
	.word	gStringVar4
	.word	gOtherText_BerryAlreadyObtained
	.word	0x402d
.L95:
	mov	r0, #0x1
	str	r0, [r7, #0x6c]
.L96:
	mov	r0, #0x0
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.Lfe23:
	.size	 MEScrCmd_setenigmaberry,.Lfe23-MEScrCmd_setenigmaberry
	.align	2, 0
	.globl	MEScrCmd_giveribbon
	.type	 MEScrCmd_giveribbon,function
	.thumb_func
MEScrCmd_giveribbon:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r2, [r4, #0x8]
	ldrb	r0, [r2]
	add	r2, r2, #0x1
	str	r2, [r4, #0x8]
	ldrb	r1, [r2]
	add	r2, r2, #0x1
	str	r2, [r4, #0x8]
	bl	GiveGiftRibbonToParty
	ldr	r0, .L104
	ldr	r1, .L104+0x4
	bl	StringExpandPlaceholders
	mov	r0, #0x2
	str	r0, [r4, #0x6c]
	mov	r0, #0x0
	pop	{r4}
	pop	{r1}
	bx	r1
.L105:
	.align	2, 0
.L104:
	.word	gStringVar4
	.word	gOtherText_SpecialRibbonReceived
.Lfe24:
	.size	 MEScrCmd_giveribbon,.Lfe24-MEScrCmd_giveribbon
	.align	2, 0
	.globl	MEScrCmd_initramscript
	.type	 MEScrCmd_initramscript,function
	.thumb_func
MEScrCmd_initramscript:
	push	{r4, r5, r6, lr}
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6}
	add	sp, sp, #0xfffffffc
	add	r4, r0, #0
	ldr	r0, [r4, #0x8]
	ldrb	r1, [r0]
	mov	r9, r1
	add	r0, r0, #0x1
	str	r0, [r4, #0x8]
	ldrb	r1, [r0]
	mov	r8, r1
	add	r1, r0, #0x1
	str	r1, [r4, #0x8]
	ldrb	r6, [r0, #0x1]
	add	r1, r1, #0x1
	str	r1, [r4, #0x8]
	add	r0, r4, #0
	bl	ScriptReadWord
	add	r5, r0, #0
	ldr	r0, [r4, #0x68]
	sub	r5, r5, r0
	ldr	r0, [r4, #0x64]
	add	r5, r5, r0
	add	r0, r4, #0
	bl	ScriptReadWord
	add	r1, r0, #0
	ldr	r0, [r4, #0x68]
	sub	r1, r1, r0
	ldr	r0, [r4, #0x64]
	add	r1, r1, r0
	sub	r1, r1, r5
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	str	r6, [sp]
	add	r0, r5, #0
	mov	r2, r9
	mov	r3, r8
	bl	InitRamScript
	mov	r0, #0x0
	add	sp, sp, #0x4
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.Lfe25:
	.size	 MEScrCmd_initramscript,.Lfe25-MEScrCmd_initramscript
	.align	2, 0
	.globl	MEScrCmd_givenationaldex
	.type	 MEScrCmd_givenationaldex,function
	.thumb_func
MEScrCmd_givenationaldex:
	push	{r4, lr}
	add	r4, r0, #0
	bl	EnableNationalPokedex
	ldr	r0, .L108
	ldr	r1, .L108+0x4
	bl	StringExpandPlaceholders
	mov	r0, #0x2
	str	r0, [r4, #0x6c]
	mov	r0, #0x0
	pop	{r4}
	pop	{r1}
	bx	r1
.L109:
	.align	2, 0
.L108:
	.word	gStringVar4
	.word	gOtherText_DexUpgraded
.Lfe26:
	.size	 MEScrCmd_givenationaldex,.Lfe26-MEScrCmd_givenationaldex
	.align	2, 0
	.globl	MEScrCmd_addrareword
	.type	 MEScrCmd_addrareword,function
	.thumb_func
MEScrCmd_addrareword:
	push	{r4, lr}
	add	r4, r0, #0
	ldr	r1, [r4, #0x8]
	ldrb	r0, [r1]
	add	r1, r1, #0x1
	str	r1, [r4, #0x8]
	bl	sub_80EB890
	ldr	r0, .L111
	ldr	r1, .L111+0x4
	bl	StringExpandPlaceholders
	mov	r0, #0x2
	str	r0, [r4, #0x6c]
	mov	r0, #0x0
	pop	{r4}
	pop	{r1}
	bx	r1
.L112:
	.align	2, 0
.L111:
	.word	gStringVar4
	.word	gOtherText_RareWordAdded
.Lfe27:
	.size	 MEScrCmd_addrareword,.Lfe27-MEScrCmd_addrareword
	.align	2, 0
	.globl	MEScrCmd_setrecordmixinggift
	.type	 MEScrCmd_setrecordmixinggift,function
	.thumb_func
MEScrCmd_setrecordmixinggift:
	push	{r4, r5, lr}
	ldr	r1, [r0, #0x8]
	ldrb	r5, [r1]
	add	r1, r1, #0x1
	str	r1, [r0, #0x8]
	ldrb	r4, [r1]
	add	r1, r1, #0x1
	str	r1, [r0, #0x8]
	bl	ScriptReadHalfword
	add	r2, r0, #0
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	add	r0, r5, #0
	add	r1, r4, #0
	bl	SetRecordMixingGift
	mov	r0, #0x0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.Lfe28:
	.size	 MEScrCmd_setrecordmixinggift,.Lfe28-MEScrCmd_setrecordmixinggift
	.align	2, 0
	.globl	MEScrCmd_givepokemon
	.type	 MEScrCmd_givepokemon,function
	.thumb_func
MEScrCmd_givepokemon:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xffffff78
	add	r6, r0, #0
	bl	ScriptReadWord
	ldr	r1, [r6, #0x68]
	sub	r0, r0, r1
	ldr	r1, [r6, #0x64]
	add	r5, r0, r1
	mov	r0, #0x64
	add	r0, r0, r5
	mov	r8, r0
	add	r4, sp, #0x24
	add	r0, r4, #0
	add	r1, r5, #0
	mov	r2, #0x64
	bl	memcpy
	add	r0, r4, #0
	mov	r1, #0x41
	bl	GetMonData
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	mov	r0, #0xce
	lsl	r0, r0, #0x1
	cmp	r4, r0
	bne	.L115	@cond_branch
	ldr	r0, .L122
	ldr	r1, .L122+0x4
	mov	r2, #0xb
	bl	StringCopyN
	b	.L116
.L123:
	.align	2, 0
.L122:
	.word	gStringVar1
	.word	gSystemText_Egg
.L115:
	ldr	r0, .L124
	ldr	r1, .L124+0x4
	mov	r2, #0xb
	bl	StringCopyN
.L116:
	ldr	r0, .L124+0x8
	ldrb	r0, [r0]
	cmp	r0, #0x6
	bne	.L117	@cond_branch
	ldr	r0, .L124+0xc
	ldr	r1, .L124+0x10
	bl	StringExpandPlaceholders
	mov	r0, #0x3
	b	.L121
.L125:
	.align	2, 0
.L124:
	.word	gStringVar1
	.word	gSystemText_Pokemon2
	.word	gPlayerPartyCount
	.word	gStringVar4
	.word	gOtherText_PartyIsFull
.L117:
	ldr	r7, .L126
	add	r0, r7, #0
	add	r1, r5, #0
	mov	r2, #0x64
	bl	memcpy
	mov	r0, sp
	mov	r1, r8
	mov	r2, #0x24
	bl	memcpy
	mov	r0, #0xce
	lsl	r0, r0, #0x1
	cmp	r4, r0
	beq	.L119	@cond_branch
	add	r0, r4, #0
	bl	SpeciesToNationalPokedexNum
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r4, #0
	mov	r1, #0x2
	bl	GetSetPokedexFlag
	add	r0, r4, #0
	mov	r1, #0x3
	bl	GetSetPokedexFlag
.L119:
	add	r0, r7, #0
	mov	r1, #0xc
	bl	GetMonData
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	ItemIsMail
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L120	@cond_branch
	add	r0, r7, #0
	mov	r1, sp
	bl	GiveMailToMon2
.L120:
	bl	party_compaction
	bl	CalculatePlayerPartyCount
	ldr	r0, .L126+0x4
	ldr	r1, .L126+0x8
	bl	StringExpandPlaceholders
	mov	r0, #0x2
.L121:
	str	r0, [r6, #0x6c]
	mov	r0, #0x0
	add	sp, sp, #0x88
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L127:
	.align	2, 0
.L126:
	.word	gPlayerParty+0x1f4
	.word	gStringVar4
	.word	gOtherText_PokeWasSentOver
.Lfe29:
	.size	 MEScrCmd_givepokemon,.Lfe29-MEScrCmd_givepokemon
	.align	2, 0
	.globl	MEScrCmd_addtrainer
	.type	 MEScrCmd_addtrainer,function
	.thumb_func
MEScrCmd_addtrainer:
	push	{r4, lr}
	add	r4, r0, #0
	bl	ScriptReadWord
	add	r1, r0, #0
	ldr	r0, [r4, #0x68]
	sub	r1, r1, r0
	ldr	r0, [r4, #0x64]
	add	r1, r1, r0
	ldr	r0, .L129
	mov	r2, #0xbc
	bl	memcpy
	bl	ValidateEReaderTrainer
	ldr	r0, .L129+0x4
	ldr	r1, .L129+0x8
	bl	StringExpandPlaceholders
	mov	r0, #0x2
	str	r0, [r4, #0x6c]
	mov	r0, #0x0
	pop	{r4}
	pop	{r1}
	bx	r1
.L130:
	.align	2, 0
.L129:
	.word	gSaveBlock2+0x498
	.word	gStringVar4
	.word	gOtherText_NewTrainerInHoenn
.Lfe30:
	.size	 MEScrCmd_addtrainer,.Lfe30-MEScrCmd_addtrainer
	.align	2, 0
	.globl	MEScrCmd_enableresetrtc
	.type	 MEScrCmd_enableresetrtc,function
	.thumb_func
MEScrCmd_enableresetrtc:
	push	{r4, lr}
	add	r4, r0, #0
	bl	EnableResetRTC
	ldr	r0, .L132
	ldr	r1, .L132+0x4
	bl	StringExpandPlaceholders
	mov	r0, #0x2
	str	r0, [r4, #0x6c]
	mov	r0, #0x0
	pop	{r4}
	pop	{r1}
	bx	r1
.L133:
	.align	2, 0
.L132:
	.word	gStringVar4
	.word	gSystemText_ClockAdjustmentUsable
.Lfe31:
	.size	 MEScrCmd_enableresetrtc,.Lfe31-MEScrCmd_enableresetrtc
	.align	2, 0
	.globl	MEScrCmd_checksum
	.type	 MEScrCmd_checksum,function
	.thumb_func
MEScrCmd_checksum:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	bl	ScriptReadWord
	add	r5, r0, #0
	add	r0, r6, #0
	bl	ScriptReadWord
	add	r4, r0, #0
	ldr	r0, [r6, #0x68]
	sub	r4, r4, r0
	ldr	r0, [r6, #0x64]
	add	r4, r4, r0
	add	r0, r6, #0
	bl	ScriptReadWord
	add	r1, r0, #0
	ldr	r0, [r6, #0x68]
	sub	r1, r1, r0
	ldr	r0, [r6, #0x64]
	add	r1, r1, r0
	sub	r1, r1, r4
	add	r0, r4, #0
	bl	CalcChecksum
	cmp	r5, r0
	beq	.L135	@cond_branch
	mov	r0, #0x0
	str	r0, [r6, #0x70]
	mov	r0, #0x1
	str	r0, [r6, #0x6c]
.L135:
	mov	r0, #0x1
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.Lfe32:
	.size	 MEScrCmd_checksum,.Lfe32-MEScrCmd_checksum
	.align	2, 0
	.globl	MEScrCmd_crc
	.type	 MEScrCmd_crc,function
	.thumb_func
MEScrCmd_crc:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	bl	ScriptReadWord
	add	r5, r0, #0
	add	r0, r6, #0
	bl	ScriptReadWord
	add	r4, r0, #0
	ldr	r0, [r6, #0x68]
	sub	r4, r4, r0
	ldr	r0, [r6, #0x64]
	add	r4, r4, r0
	add	r0, r6, #0
	bl	ScriptReadWord
	add	r1, r0, #0
	ldr	r0, [r6, #0x68]
	sub	r1, r1, r0
	ldr	r0, [r6, #0x64]
	add	r1, r1, r0
	sub	r1, r1, r4
	add	r0, r4, #0
	bl	CalcCRC16
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	cmp	r5, r0
	beq	.L137	@cond_branch
	mov	r0, #0x0
	str	r0, [r6, #0x70]
	mov	r0, #0x1
	str	r0, [r6, #0x6c]
.L137:
	mov	r0, #0x1
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.Lfe33:
	.size	 MEScrCmd_crc,.Lfe33-MEScrCmd_crc
.text
	.align	2, 0
