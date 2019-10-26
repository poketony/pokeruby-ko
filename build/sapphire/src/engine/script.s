@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.globl	gUnknown_0202E8AC
	.section ewram_data,"aw"
	.align	2, 0
	.type	 gUnknown_0202E8AC,object
	.size	 gUnknown_0202E8AC,4
gUnknown_0202E8AC:
	.word	0x0
.text
	.align	2, 0
	.globl	InitScriptContext
	.type	 InitScriptContext,function
	.thumb_func
InitScriptContext:
	push	{lr}
	add	r3, r0, #0
	mov	r0, #0x0
	strb	r0, [r3, #0x1]
	str	r0, [r3, #0x8]
	strb	r0, [r3]
	str	r0, [r3, #0x4]
	str	r1, [r3, #0x5c]
	str	r2, [r3, #0x60]
	mov	r2, #0x0
	mov	r1, #0x3
	add	r0, r3, #0
	add	r0, r0, #0x70
.L6:
	str	r2, [r0]
	sub	r0, r0, #0x4
	sub	r1, r1, #0x1
	cmp	r1, #0
	bge	.L6	@cond_branch
	add	r1, r3, #0
	add	r1, r1, #0xc
	mov	r2, #0x0
	add	r0, r3, #0
	add	r0, r0, #0x58
.L11:
	str	r2, [r0]
	sub	r0, r0, #0x4
	cmp	r0, r1
	bge	.L11	@cond_branch
	pop	{r0}
	bx	r0
.Lfe1:
	.size	 InitScriptContext,.Lfe1-InitScriptContext
	.align	2, 0
	.globl	SetupBytecodeScript
	.type	 SetupBytecodeScript,function
	.thumb_func
SetupBytecodeScript:
	str	r1, [r0, #0x8]
	mov	r1, #0x1
	strb	r1, [r0, #0x1]
	mov	r0, #0x1
	bx	lr
.Lfe2:
	.size	 SetupBytecodeScript,.Lfe2-SetupBytecodeScript
	.align	2, 0
	.globl	SetupNativeScript
	.type	 SetupNativeScript,function
	.thumb_func
SetupNativeScript:
	mov	r2, #0x2
	strb	r2, [r0, #0x1]
	str	r1, [r0, #0x4]
	bx	lr
.Lfe3:
	.size	 SetupNativeScript,.Lfe3-SetupNativeScript
	.align	2, 0
	.globl	StopScript
	.type	 StopScript,function
	.thumb_func
StopScript:
	mov	r1, #0x0
	strb	r1, [r0, #0x1]
	str	r1, [r0, #0x8]
	bx	lr
.Lfe4:
	.size	 StopScript,.Lfe4-StopScript
	.align	2, 0
	.globl	RunScriptCommand
	.type	 RunScriptCommand,function
	.thumb_func
RunScriptCommand:
	push	{r4, lr}
	add	r4, r0, #0
	ldrb	r0, [r4, #0x1]
	cmp	r0, #0
	bne	.L17	@cond_branch
.L43:
	mov	r0, #0x0
	b	.L39
.L17:
	ldrb	r0, [r4, #0x1]
	cmp	r0, #0x1
	beq	.L26	@cond_branch
	cmp	r0, #0x1
	bgt	.L38	@cond_branch
	cmp	r0, #0
	beq	.L43	@cond_branch
	b	.L18
.L38:
	cmp	r0, #0x2
	bne	.L18	@cond_branch
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	beq	.L21	@cond_branch
	bl	_call_via_r0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	bne	.L18	@cond_branch
	strb	r0, [r4, #0x1]
	b	.L18
.L40:
	strb	r2, [r4, #0x1]
	b	.L43
.L41:
	mov	r0, #0x0
	strb	r0, [r4, #0x1]
	b	.L39
.L21:
	mov	r0, #0x1
	strb	r0, [r4, #0x1]
.L26:
	ldr	r2, [r4, #0x8]
	cmp	r2, #0
	beq	.L40	@cond_branch
	ldr	r0, .L44
	ldr	r0, [r0]
	cmp	r2, r0
	bne	.L28	@cond_branch
.L31:
	svc 2
	.code	16
	b	.L31
.L45:
	.align	2, 0
.L44:
	.word	gNullScriptPtr
.L28:
	ldrb	r1, [r2]
	add	r0, r2, #0x1
	str	r0, [r4, #0x8]
	lsl	r1, r1, #0x2
	ldr	r0, [r4, #0x5c]
	add	r1, r0, r1
	ldr	r0, [r4, #0x60]
	cmp	r1, r0
	bcs	.L41	@cond_branch
	ldr	r1, [r1]
	add	r0, r4, #0
	bl	_call_via_r1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	bne	.L26	@cond_branch
.L18:
	mov	r0, #0x1
.L39:
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe5:
	.size	 RunScriptCommand,.Lfe5-RunScriptCommand
	.align	2, 0
	.globl	ScriptPush
	.type	 ScriptPush,function
	.thumb_func
ScriptPush:
	push	{lr}
	add	r2, r0, #0
	add	r3, r1, #0
	ldrb	r1, [r2]
	add	r0, r1, #0x1
	cmp	r0, #0x13
	bgt	.L47	@cond_branch
	lsl	r0, r1, #0x2
	add	r1, r2, #0
	add	r1, r1, #0xc
	add	r1, r1, r0
	str	r3, [r1]
	ldrb	r0, [r2]
	add	r0, r0, #0x1
	strb	r0, [r2]
	mov	r0, #0x0
	b	.L49
.L47:
	mov	r0, #0x1
.L49:
	pop	{r1}
	bx	r1
.Lfe6:
	.size	 ScriptPush,.Lfe6-ScriptPush
	.align	2, 0
	.globl	ScriptPop
	.type	 ScriptPop,function
	.thumb_func
ScriptPop:
	push	{lr}
	add	r2, r0, #0
	ldrb	r0, [r2]
	cmp	r0, #0
	beq	.L51	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r2]
	ldrb	r1, [r2]
	lsl	r1, r1, #0x2
	add	r0, r2, #0
	add	r0, r0, #0xc
	add	r0, r0, r1
	ldr	r0, [r0]
	b	.L52
.L51:
	mov	r0, #0x0
.L52:
	pop	{r1}
	bx	r1
.Lfe7:
	.size	 ScriptPop,.Lfe7-ScriptPop
	.align	2, 0
	.globl	ScriptJump
	.type	 ScriptJump,function
	.thumb_func
ScriptJump:
	str	r1, [r0, #0x8]
	bx	lr
.Lfe8:
	.size	 ScriptJump,.Lfe8-ScriptJump
	.align	2, 0
	.globl	ScriptCall
	.type	 ScriptCall,function
	.thumb_func
ScriptCall:
	push	{r4, r5, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	ldr	r1, [r4, #0x8]
	bl	ScriptPush
	str	r5, [r4, #0x8]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.Lfe9:
	.size	 ScriptCall,.Lfe9-ScriptCall
	.align	2, 0
	.globl	ScriptReturn
	.type	 ScriptReturn,function
	.thumb_func
ScriptReturn:
	push	{r4, lr}
	add	r4, r0, #0
	bl	ScriptPop
	str	r0, [r4, #0x8]
	pop	{r4}
	pop	{r0}
	bx	r0
.Lfe10:
	.size	 ScriptReturn,.Lfe10-ScriptReturn
	.align	2, 0
	.globl	ScriptReadHalfword
	.type	 ScriptReadHalfword,function
	.thumb_func
ScriptReadHalfword:
	add	r3, r0, #0
	ldr	r2, [r3, #0x8]
	ldrb	r0, [r2]
	add	r2, r2, #0x1
	str	r2, [r3, #0x8]
	ldrb	r1, [r2]
	lsl	r1, r1, #0x8
	orr	r0, r0, r1
	add	r2, r2, #0x1
	str	r2, [r3, #0x8]
	bx	lr
.Lfe11:
	.size	 ScriptReadHalfword,.Lfe11-ScriptReadHalfword
	.align	2, 0
	.globl	ScriptReadWord
	.type	 ScriptReadWord,function
	.thumb_func
ScriptReadWord:
	push	{r4, r5, r6, lr}
	add	r3, r0, #0
	ldr	r0, [r3, #0x8]
	ldrb	r6, [r0]
	add	r0, r0, #0x1
	str	r0, [r3, #0x8]
	ldrb	r5, [r0]
	add	r2, r0, #0x1
	str	r2, [r3, #0x8]
	ldrb	r4, [r0, #0x1]
	add	r1, r2, #0x1
	str	r1, [r3, #0x8]
	ldrb	r0, [r2, #0x1]
	add	r1, r1, #0x1
	str	r1, [r3, #0x8]
	lsl	r0, r0, #0x8
	add	r0, r0, r4
	lsl	r0, r0, #0x8
	add	r0, r0, r5
	lsl	r0, r0, #0x8
	add	r0, r0, r6
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.Lfe12:
	.size	 ScriptReadWord,.Lfe12-ScriptReadWord
	.align	2, 0
	.globl	ScriptContext2_Enable
	.type	 ScriptContext2_Enable,function
	.thumb_func
ScriptContext2_Enable:
	ldr	r1, .L59
	mov	r0, #0x1
	strb	r0, [r1]
	bx	lr
.L60:
	.align	2, 0
.L59:
	.word	sScriptContext2Enabled
.Lfe13:
	.size	 ScriptContext2_Enable,.Lfe13-ScriptContext2_Enable
	.align	2, 0
	.globl	ScriptContext2_Disable
	.type	 ScriptContext2_Disable,function
	.thumb_func
ScriptContext2_Disable:
	ldr	r1, .L62
	mov	r0, #0x0
	strb	r0, [r1]
	bx	lr
.L63:
	.align	2, 0
.L62:
	.word	sScriptContext2Enabled
.Lfe14:
	.size	 ScriptContext2_Disable,.Lfe14-ScriptContext2_Disable
	.align	2, 0
	.globl	ScriptContext2_IsEnabled
	.type	 ScriptContext2_IsEnabled,function
	.thumb_func
ScriptContext2_IsEnabled:
	ldr	r0, .L65
	ldrb	r0, [r0]
	bx	lr
.L66:
	.align	2, 0
.L65:
	.word	sScriptContext2Enabled
.Lfe15:
	.size	 ScriptContext2_IsEnabled,.Lfe15-ScriptContext2_IsEnabled
	.align	2, 0
	.globl	ScriptContext1_Init
	.type	 ScriptContext1_Init,function
	.thumb_func
ScriptContext1_Init:
	push	{lr}
	ldr	r0, .L68
	ldr	r1, .L68+0x4
	ldr	r2, .L68+0x8
	bl	InitScriptContext
	ldr	r1, .L68+0xc
	mov	r0, #0x2
	strb	r0, [r1]
	pop	{r0}
	bx	r0
.L69:
	.align	2, 0
.L68:
	.word	sScriptContext1
	.word	gScriptCmdTable
	.word	gScriptCmdTableEnd
	.word	sScriptContext1Status
.Lfe16:
	.size	 ScriptContext1_Init,.Lfe16-ScriptContext1_Init
	.align	2, 0
	.globl	ScriptContext2_RunScript
	.type	 ScriptContext2_RunScript,function
	.thumb_func
ScriptContext2_RunScript:
	push	{r4, lr}
	ldr	r4, .L76
	ldrb	r0, [r4]
	cmp	r0, #0x2
	beq	.L75	@cond_branch
	cmp	r0, #0x1
	beq	.L75	@cond_branch
	bl	ScriptContext2_Enable
	ldr	r0, .L76+0x4
	bl	RunScriptCommand
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L73	@cond_branch
	mov	r0, #0x1
	b	.L74
.L77:
	.align	2, 0
.L76:
	.word	sScriptContext1Status
	.word	sScriptContext1
.L73:
	mov	r0, #0x2
	strb	r0, [r4]
	bl	ScriptContext2_Disable
.L75:
	mov	r0, #0x0
.L74:
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe17:
	.size	 ScriptContext2_RunScript,.Lfe17-ScriptContext2_RunScript
	.align	2, 0
	.globl	ScriptContext1_SetupScript
	.type	 ScriptContext1_SetupScript,function
	.thumb_func
ScriptContext1_SetupScript:
	push	{r4, r5, lr}
	add	r5, r0, #0
	ldr	r4, .L79
	ldr	r1, .L79+0x4
	ldr	r2, .L79+0x8
	add	r0, r4, #0
	bl	InitScriptContext
	add	r0, r4, #0
	add	r1, r5, #0
	bl	SetupBytecodeScript
	bl	ScriptContext2_Enable
	ldr	r1, .L79+0xc
	mov	r0, #0x0
	strb	r0, [r1]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L80:
	.align	2, 0
.L79:
	.word	sScriptContext1
	.word	gScriptCmdTable
	.word	gScriptCmdTableEnd
	.word	sScriptContext1Status
.Lfe18:
	.size	 ScriptContext1_SetupScript,.Lfe18-ScriptContext1_SetupScript
	.align	2, 0
	.globl	ScriptContext1_Stop
	.type	 ScriptContext1_Stop,function
	.thumb_func
ScriptContext1_Stop:
	ldr	r1, .L82
	mov	r0, #0x1
	strb	r0, [r1]
	bx	lr
.L83:
	.align	2, 0
.L82:
	.word	sScriptContext1Status
.Lfe19:
	.size	 ScriptContext1_Stop,.Lfe19-ScriptContext1_Stop
	.align	2, 0
	.globl	EnableBothScriptContexts
	.type	 EnableBothScriptContexts,function
	.thumb_func
EnableBothScriptContexts:
	push	{lr}
	ldr	r1, .L85
	mov	r0, #0x0
	strb	r0, [r1]
	bl	ScriptContext2_Enable
	pop	{r0}
	bx	r0
.L86:
	.align	2, 0
.L85:
	.word	sScriptContext1Status
.Lfe20:
	.size	 EnableBothScriptContexts,.Lfe20-EnableBothScriptContexts
	.align	2, 0
	.globl	ScriptContext2_RunNewScript
	.type	 ScriptContext2_RunNewScript,function
	.thumb_func
ScriptContext2_RunNewScript:
	push	{r4, r5, lr}
	add	r5, r0, #0
	ldr	r4, .L92
	ldr	r1, .L92+0x4
	ldr	r2, .L92+0x8
	add	r0, r4, #0
	bl	InitScriptContext
	add	r0, r4, #0
	add	r1, r5, #0
	bl	SetupBytecodeScript
.L88:
	ldr	r0, .L92
	bl	RunScriptCommand
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L88	@cond_branch
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L93:
	.align	2, 0
.L92:
	.word	sScriptContext2
	.word	gScriptCmdTable
	.word	gScriptCmdTableEnd
.Lfe21:
	.size	 ScriptContext2_RunNewScript,.Lfe21-ScriptContext2_RunNewScript
	.align	2, 0
	.type	 mapheader_get_tagged_pointer,function
	.thumb_func
mapheader_get_tagged_pointer:
	push	{lr}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	ldr	r0, .L104
	ldr	r2, [r0, #0x8]
	cmp	r2, #0
	beq	.L103	@cond_branch
.L98:
	ldrb	r0, [r2]
	cmp	r0, #0
	bne	.L99	@cond_branch
.L103:
	mov	r0, #0x0
	b	.L102
.L105:
	.align	2, 0
.L104:
	.word	gMapHeader
.L99:
	cmp	r0, r1
	beq	.L100	@cond_branch
	add	r2, r2, #0x5
	b	.L98
.L100:
	add	r2, r2, #0x1
	ldrb	r0, [r2]
	ldrb	r1, [r2, #0x1]
	lsl	r1, r1, #0x8
	add	r0, r0, r1
	ldrb	r1, [r2, #0x2]
	lsl	r1, r1, #0x10
	add	r0, r0, r1
	ldrb	r1, [r2, #0x3]
	lsl	r1, r1, #0x18
	add	r0, r0, r1
.L102:
	pop	{r1}
	bx	r1
.Lfe22:
	.size	 mapheader_get_tagged_pointer,.Lfe22-mapheader_get_tagged_pointer
	.align	2, 0
	.type	 mapheader_run_script_by_tag,function
	.thumb_func
mapheader_run_script_by_tag:
	push	{lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	bl	mapheader_get_tagged_pointer
	cmp	r0, #0
	beq	.L107	@cond_branch
	bl	ScriptContext2_RunNewScript
.L107:
	pop	{r0}
	bx	r0
.Lfe23:
	.size	 mapheader_run_script_by_tag,.Lfe23-mapheader_run_script_by_tag
	.align	2, 0
	.type	 mapheader_get_first_match_from_tagged_ptr_list,function
	.thumb_func
mapheader_get_first_match_from_tagged_ptr_list:
	push	{r4, r5, r6, lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	bl	mapheader_get_tagged_pointer
	add	r6, r0, #0
	cmp	r6, #0
	beq	.L117	@cond_branch
.L112:
	ldrb	r1, [r6]
	ldrb	r0, [r6, #0x1]
	lsl	r0, r0, #0x8
	orr	r1, r1, r0
	cmp	r1, #0
	bne	.L113	@cond_branch
.L117:
	mov	r0, #0x0
	b	.L116
.L113:
	add	r6, r6, #0x2
	ldrb	r5, [r6]
	ldrb	r0, [r6, #0x1]
	lsl	r0, r0, #0x8
	orr	r5, r5, r0
	add	r6, r6, #0x2
	add	r0, r1, #0
	bl	VarGet
	add	r4, r0, #0
	add	r0, r5, #0
	bl	VarGet
	lsl	r4, r4, #0x10
	lsl	r0, r0, #0x10
	cmp	r4, r0
	beq	.L114	@cond_branch
	add	r6, r6, #0x4
	b	.L112
.L114:
	ldrb	r0, [r6]
	ldrb	r1, [r6, #0x1]
	lsl	r1, r1, #0x8
	add	r0, r0, r1
	ldrb	r1, [r6, #0x2]
	lsl	r1, r1, #0x10
	add	r0, r0, r1
	ldrb	r1, [r6, #0x3]
	lsl	r1, r1, #0x18
	add	r0, r0, r1
.L116:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.Lfe24:
	.size	 mapheader_get_first_match_from_tagged_ptr_list,.Lfe24-mapheader_get_first_match_from_tagged_ptr_list
	.align	2, 0
	.globl	mapheader_run_script_with_tag_x1
	.type	 mapheader_run_script_with_tag_x1,function
	.thumb_func
mapheader_run_script_with_tag_x1:
	push	{lr}
	mov	r0, #0x1
	bl	mapheader_run_script_by_tag
	pop	{r0}
	bx	r0
.Lfe25:
	.size	 mapheader_run_script_with_tag_x1,.Lfe25-mapheader_run_script_with_tag_x1
	.align	2, 0
	.globl	mapheader_run_script_with_tag_x3
	.type	 mapheader_run_script_with_tag_x3,function
	.thumb_func
mapheader_run_script_with_tag_x3:
	push	{lr}
	mov	r0, #0x3
	bl	mapheader_run_script_by_tag
	pop	{r0}
	bx	r0
.Lfe26:
	.size	 mapheader_run_script_with_tag_x3,.Lfe26-mapheader_run_script_with_tag_x3
	.align	2, 0
	.globl	mapheader_run_script_with_tag_x5
	.type	 mapheader_run_script_with_tag_x5,function
	.thumb_func
mapheader_run_script_with_tag_x5:
	push	{lr}
	mov	r0, #0x5
	bl	mapheader_run_script_by_tag
	pop	{r0}
	bx	r0
.Lfe27:
	.size	 mapheader_run_script_with_tag_x5,.Lfe27-mapheader_run_script_with_tag_x5
	.align	2, 0
	.globl	mapheader_run_script_with_tag_x6
	.type	 mapheader_run_script_with_tag_x6,function
	.thumb_func
mapheader_run_script_with_tag_x6:
	push	{lr}
	mov	r0, #0x6
	bl	mapheader_run_script_by_tag
	pop	{r0}
	bx	r0
.Lfe28:
	.size	 mapheader_run_script_with_tag_x6,.Lfe28-mapheader_run_script_with_tag_x6
	.align	2, 0
	.globl	mapheader_run_first_tag2_script_list_match
	.type	 mapheader_run_first_tag2_script_list_match,function
	.thumb_func
mapheader_run_first_tag2_script_list_match:
	push	{lr}
	mov	r0, #0x2
	bl	mapheader_get_first_match_from_tagged_ptr_list
	cmp	r0, #0
	beq	.L123	@cond_branch
	bl	ScriptContext1_SetupScript
	mov	r0, #0x1
	b	.L124
.L123:
	mov	r0, #0x0
.L124:
	pop	{r1}
	bx	r1
.Lfe29:
	.size	 mapheader_run_first_tag2_script_list_match,.Lfe29-mapheader_run_first_tag2_script_list_match
	.align	2, 0
	.globl	mapheader_run_first_tag4_script_list_match
	.type	 mapheader_run_first_tag4_script_list_match,function
	.thumb_func
mapheader_run_first_tag4_script_list_match:
	push	{lr}
	mov	r0, #0x4
	bl	mapheader_get_first_match_from_tagged_ptr_list
	cmp	r0, #0
	beq	.L126	@cond_branch
	bl	ScriptContext2_RunNewScript
.L126:
	pop	{r0}
	bx	r0
.Lfe30:
	.size	 mapheader_run_first_tag4_script_list_match,.Lfe30-mapheader_run_first_tag4_script_list_match
	.align	2, 0
	.type	 CalculateRamScriptChecksum,function
	.thumb_func
CalculateRamScriptChecksum:
	push	{r4, lr}
	mov	r2, #0x0
	mov	r1, #0x0
	ldr	r4, .L133
	ldr	r3, .L133+0x4
.L131:
	add	r0, r1, r3
	ldrb	r0, [r0]
	add	r2, r2, r0
	add	r1, r1, #0x1
	cmp	r1, r4
	bls	.L131	@cond_branch
	add	r0, r2, #0
	pop	{r4}
	pop	{r1}
	bx	r1
.L134:
	.align	2, 0
.L133:
	.word	0x3e7
	.word	gSaveBlock1+0x3694
.Lfe31:
	.size	 CalculateRamScriptChecksum,.Lfe31-CalculateRamScriptChecksum
	.align	2, 0
	.globl	ClearRamScript
	.type	 ClearRamScript,function
	.thumb_func
ClearRamScript:
	push	{lr}
	add	sp, sp, #0xfffffffc
	mov	r0, #0x0
	str	r0, [sp]
	ldr	r1, .L136
	ldr	r2, .L136+0x4
	mov	r0, sp
	bl	CpuSet
	add	sp, sp, #0x4
	pop	{r0}
	bx	r0
.L137:
	.align	2, 0
.L136:
	.word	gSaveBlock1+0x3690
	.word	0x50000fb
.Lfe32:
	.size	 ClearRamScript,.Lfe32-ClearRamScript
	.align	2, 0
	.globl	InitRamScript
	.type	 InitRamScript,function
	.thumb_func
InitRamScript:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	mov	r9, r0
	ldr	r0, [sp, #0x1c]
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	r8, r1
	lsl	r2, r2, #0x18
	lsr	r7, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r6, r3, #0x18
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	ldr	r4, .L141
	bl	ClearRamScript
	ldr	r0, .L141+0x4
	cmp	r8, r0
	bhi	.L139	@cond_branch
	mov	r0, #0x33
	strb	r0, [r4]
	strb	r7, [r4, #0x1]
	strb	r6, [r4, #0x2]
	strb	r5, [r4, #0x3]
	add	r0, r4, #0x4
	mov	r1, r9
	mov	r2, r8
	bl	memcpy
	bl	CalculateRamScriptChecksum
	sub	r1, r4, #0x4
	str	r0, [r1]
	mov	r0, #0x1
	b	.L140
.L142:
	.align	2, 0
.L141:
	.word	gSaveBlock1+0x3694
	.word	0x3e3
.L139:
	mov	r0, #0x0
.L140:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.Lfe33:
	.size	 InitRamScript,.Lfe33-InitRamScript
	.align	2, 0
	.globl	GetRamScript
	.type	 GetRamScript,function
	.thumb_func
GetRamScript:
	push	{r4, r5, r6, lr}
	add	r5, r1, #0
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	ldr	r4, .L147
	ldr	r6, .L147+0x4
	mov	r0, #0x0
	str	r0, [r6]
	ldrb	r0, [r4]
	cmp	r0, #0x33
	bne	.L144	@cond_branch
	ldrb	r1, [r4, #0x1]
	ldr	r0, .L147+0x8
	add	r2, r4, r0
	mov	r0, #0x4
	ldrsb	r0, [r2, r0]
	cmp	r1, r0
	bne	.L144	@cond_branch
	ldrb	r1, [r4, #0x2]
	mov	r0, #0x5
	ldrsb	r0, [r2, r0]
	cmp	r1, r0
	bne	.L144	@cond_branch
	ldrb	r0, [r4, #0x3]
	cmp	r0, r3
	bne	.L144	@cond_branch
	bl	CalculateRamScriptChecksum
	sub	r1, r4, #0x4
	ldr	r1, [r1]
	cmp	r0, r1
	bne	.L145	@cond_branch
	str	r5, [r6]
	add	r0, r4, #0x4
	b	.L146
.L148:
	.align	2, 0
.L147:
	.word	gSaveBlock1+0x3694
	.word	gUnknown_0202E8AC
	.word	0xffffc96c
.L145:
	bl	ClearRamScript
.L144:
	add	r0, r5, #0
.L146:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.Lfe34:
	.size	 GetRamScript,.Lfe34-GetRamScript

	.lcomm	sScriptContext1Status,1

	.lcomm	sScriptContext1,116

	.lcomm	sScriptContext2,116

	.lcomm	sScriptContext2Enabled,1
.text
	.align	2, 0
