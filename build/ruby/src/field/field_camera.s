@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.globl	gUnusedBikeCameraAheadPanback
	.section ewram_data,"aw"
	.type	 gUnusedBikeCameraAheadPanback,object
	.size	 gUnusedBikeCameraAheadPanback,1
gUnusedBikeCameraAheadPanback:
	.byte	0x0
.text
	.align	2, 0
	.type	 move_tilemap_camera_to_upper_left_corner_,function
	.thumb_func
move_tilemap_camera_to_upper_left_corner_:
	mov	r1, #0x0
	strb	r1, [r0, #0x2]
	strb	r1, [r0, #0x3]
	strb	r1, [r0]
	strb	r1, [r0, #0x1]
	mov	r1, #0x1
	strb	r1, [r0, #0x4]
	bx	lr
.Lfe1:
	.size	 move_tilemap_camera_to_upper_left_corner_,.Lfe1-move_tilemap_camera_to_upper_left_corner_
	.align	2, 0
	.type	 tilemap_move_something,function
	.thumb_func
tilemap_move_something:
	ldrb	r3, [r0, #0x2]
	add	r3, r3, r1
	strb	r3, [r0, #0x2]
	ldrb	r1, [r0, #0x2]
	mov	r3, #0x1f
	and	r1, r1, r3
	strb	r1, [r0, #0x2]
	ldrb	r1, [r0, #0x3]
	add	r1, r1, r2
	strb	r1, [r0, #0x3]
	ldrb	r1, [r0, #0x3]
	and	r1, r1, r3
	strb	r1, [r0, #0x3]
	bx	lr
.Lfe2:
	.size	 tilemap_move_something,.Lfe2-tilemap_move_something
	.align	2, 0
	.type	 coords8_add,function
	.thumb_func
coords8_add:
	ldrb	r3, [r0]
	add	r3, r3, r1
	strb	r3, [r0]
	ldrb	r1, [r0, #0x1]
	add	r1, r1, r2
	strb	r1, [r0, #0x1]
	bx	lr
.Lfe3:
	.size	 coords8_add,.Lfe3-coords8_add
	.align	2, 0
	.globl	move_tilemap_camera_to_upper_left_corner
	.type	 move_tilemap_camera_to_upper_left_corner,function
	.thumb_func
move_tilemap_camera_to_upper_left_corner:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff8
	ldr	r0, .L6
	bl	move_tilemap_camera_to_upper_left_corner_
	mov	r0, sp
	mov	r6, #0x0
	strh	r6, [r0]
	ldr	r4, .L6+0x4
	ldr	r5, .L6+0x8
	add	r1, r4, #0
	add	r2, r5, #0
	bl	CpuSet
	mov	r0, sp
	add	r0, r0, #0x2
	strh	r6, [r0]
	ldr	r2, .L6+0xc
	add	r1, r4, r2
	add	r2, r5, #0
	bl	CpuSet
	add	r0, sp, #0x4
	ldr	r2, .L6+0x10
	add	r1, r2, #0
	strh	r1, [r0]
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	add	r4, r4, r1
	add	r1, r4, #0
	add	r2, r5, #0
	bl	CpuSet
	add	sp, sp, #0x8
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L7:
	.align	2, 0
.L6:
	.word	gUnknown_03000590
	.word	gBGTilemapBuffers+0x1000
	.word	0x1000400
	.word	0xfffff800
	.word	0x3014
.Lfe4:
	.size	 move_tilemap_camera_to_upper_left_corner,.Lfe4-move_tilemap_camera_to_upper_left_corner
	.align	2, 0
	.globl	sub_8057A58
	.type	 sub_8057A58,function
	.thumb_func
sub_8057A58:
	push	{r4, r5, r6, r7, lr}
	ldr	r5, .L10
	ldr	r1, [r5, #0x4]
	ldr	r6, .L10+0x4
	ldr	r4, .L10+0x8
	ldrh	r0, [r4]
	ldrb	r2, [r6]
	add	r0, r0, r2
	strh	r0, [r1]
	ldr	r3, .L10+0xc
	ldr	r1, [r3, #0x4]
	ldr	r2, .L10+0x10
	ldrh	r0, [r2]
	ldrb	r7, [r6, #0x1]
	add	r0, r0, r7
	add	r0, r0, #0x8
	strh	r0, [r1]
	ldr	r1, [r5, #0x8]
	ldrh	r0, [r4]
	ldrb	r7, [r6]
	add	r0, r0, r7
	strh	r0, [r1]
	ldr	r1, [r3, #0x8]
	ldrh	r0, [r2]
	ldrb	r7, [r6, #0x1]
	add	r0, r0, r7
	add	r0, r0, #0x8
	strh	r0, [r1]
	ldr	r1, [r5, #0xc]
	ldrh	r0, [r4]
	ldrb	r4, [r6]
	add	r0, r0, r4
	strh	r0, [r1]
	ldr	r1, [r3, #0xc]
	ldrh	r0, [r2]
	ldrb	r7, [r6, #0x1]
	add	r0, r0, r7
	add	r0, r0, #0x8
	strh	r0, [r1]
	ldrb	r0, [r6, #0x4]
	cmp	r0, #0
	beq	.L9	@cond_branch
	ldr	r0, .L10+0x14
	ldr	r2, .L10+0x18
	str	r2, [r0]
	ldr	r1, .L10+0x1c
	str	r1, [r0, #0x4]
	ldr	r3, .L10+0x20
	str	r3, [r0, #0x8]
	ldr	r1, [r0, #0x8]
	mov	r4, #0x80
	lsl	r4, r4, #0x4
	add	r1, r2, r4
	str	r1, [r0]
	ldr	r1, .L10+0x24
	str	r1, [r0, #0x4]
	str	r3, [r0, #0x8]
	ldr	r1, [r0, #0x8]
	mov	r7, #0x80
	lsl	r7, r7, #0x5
	add	r2, r2, r7
	str	r2, [r0]
	ldr	r1, .L10+0x28
	str	r1, [r0, #0x4]
	str	r3, [r0, #0x8]
	ldr	r0, [r0, #0x8]
	mov	r0, #0x0
	strb	r0, [r6, #0x4]
.L9:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L11:
	.align	2, 0
.L10:
	.word	gBGHOffsetRegs
	.word	gUnknown_03000590
	.word	gUnknown_03000598
	.word	gBGVOffsetRegs
	.word	gUnknown_0300059A
	.word	0x40000d4
	.word	gBGTilemapBuffers+0x800
	.word	0x600e800
	.word	0x80000400
	.word	0x600e000
	.word	0x600f000
.Lfe5:
	.size	 sub_8057A58,.Lfe5-sub_8057A58
	.align	2, 0
	.globl	sub_8057B14
	.type	 sub_8057B14,function
	.thumb_func
sub_8057B14:
	push	{r4, lr}
	ldr	r3, .L13
	ldr	r2, .L13+0x4
	ldrh	r2, [r2]
	ldrb	r4, [r3]
	add	r2, r2, r4
	strh	r2, [r0]
	ldr	r0, .L13+0x8
	ldrh	r0, [r0]
	ldrb	r3, [r3, #0x1]
	add	r0, r0, r3
	add	r0, r0, #0x8
	strh	r0, [r1]
	pop	{r4}
	pop	{r0}
	bx	r0
.L14:
	.align	2, 0
.L13:
	.word	gUnknown_03000590
	.word	gUnknown_03000598
	.word	gUnknown_0300059A
.Lfe6:
	.size	 sub_8057B14,.Lfe6-sub_8057B14
	.align	2, 0
	.globl	DrawWholeMapView
	.type	 DrawWholeMapView,function
	.thumb_func
DrawWholeMapView:
	push	{lr}
	ldr	r1, .L16
	mov	r2, #0x0
	ldrsh	r0, [r1, r2]
	mov	r2, #0x2
	ldrsh	r1, [r1, r2]
	ldr	r2, .L16+0x4
	ldr	r2, [r2]
	bl	DrawWholeMapViewInternal
	ldr	r1, .L16+0x8
	mov	r0, #0x1
	strb	r0, [r1, #0x4]
	pop	{r0}
	bx	r0
.L17:
	.align	2, 0
.L16:
	.word	gSaveBlock1
	.word	gMapHeader
	.word	gUnknown_03000590
.Lfe7:
	.size	 DrawWholeMapView,.Lfe7-DrawWholeMapView
	.align	2, 0
	.type	 DrawWholeMapViewInternal,function
	.thumb_func
DrawWholeMapViewInternal:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	mov	sl, r0
	mov	r9, r1
	mov	r8, r2
	mov	r1, #0x0
.L22:
	ldr	r2, .L31
	ldrb	r0, [r2, #0x3]
	add	r0, r1, r0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1f
	bls	.L23	@cond_branch
	sub	r0, r0, #0x20
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
.L23:
	lsl	r6, r0, #0x5
	mov	r4, #0x0
	add	r7, r1, #0x2
	str	r7, [sp]
	lsr	r5, r1, #0x1
.L27:
	ldr	r1, .L31
	ldrb	r0, [r1, #0x2]
	add	r0, r4, r0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1f
	bls	.L28	@cond_branch
	sub	r0, r0, #0x20
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
.L28:
	add	r1, r6, r0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsr	r2, r4, #0x1
	add	r2, r2, sl
	mov	r0, r8
	mov	r7, r9
	add	r3, r7, r5
	bl	DrawMetatileAt
	add	r0, r4, #0x2
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x1f
	bls	.L27	@cond_branch
	ldr	r1, [sp]
	lsl	r0, r1, #0x18
	lsr	r1, r0, #0x18
	cmp	r1, #0x1f
	bls	.L22	@cond_branch
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L32:
	.align	2, 0
.L31:
	.word	gUnknown_03000590
.Lfe8:
	.size	 DrawWholeMapViewInternal,.Lfe8-DrawWholeMapViewInternal
	.align	2, 0
	.type	 RedrawMapSlicesForCameraUpdate,function
	.thumb_func
RedrawMapSlicesForCameraUpdate:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	add	r6, r1, #0
	add	r7, r2, #0
	ldr	r0, .L38
	ldr	r4, [r0]
	cmp	r6, #0
	ble	.L34	@cond_branch
	add	r0, r5, #0
	add	r1, r4, #0
	bl	RedrawMapSliceWest
.L34:
	cmp	r6, #0
	bge	.L35	@cond_branch
	add	r0, r5, #0
	add	r1, r4, #0
	bl	RedrawMapSliceEast
.L35:
	cmp	r7, #0
	ble	.L36	@cond_branch
	add	r0, r5, #0
	add	r1, r4, #0
	bl	RedrawMapSliceNorth
.L36:
	cmp	r7, #0
	bge	.L37	@cond_branch
	add	r0, r5, #0
	add	r1, r4, #0
	bl	RedrawMapSliceSouth
.L37:
	mov	r0, #0x1
	strb	r0, [r5, #0x4]
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L39:
	.align	2, 0
.L38:
	.word	gMapHeader
.Lfe9:
	.size	 RedrawMapSlicesForCameraUpdate,.Lfe9-RedrawMapSlicesForCameraUpdate
	.align	2, 0
	.type	 RedrawMapSliceNorth,function
	.thumb_func
RedrawMapSliceNorth:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r5, r0, #0
	mov	r8, r1
	ldrb	r0, [r5, #0x3]
	add	r0, r0, #0x1c
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1f
	bls	.L41	@cond_branch
	sub	r0, r0, #0x20
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
.L41:
	lsl	r7, r0, #0x5
	mov	r4, #0x0
	ldr	r6, .L48
.L45:
	ldrb	r0, [r5, #0x2]
	add	r0, r4, r0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1f
	bls	.L46	@cond_branch
	sub	r0, r0, #0x20
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
.L46:
	add	r1, r7, r0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	r0, #0x0
	ldrsh	r2, [r6, r0]
	lsr	r0, r4, #0x1
	add	r2, r2, r0
	mov	r0, #0x2
	ldrsh	r3, [r6, r0]
	add	r3, r3, #0xe
	mov	r0, r8
	bl	DrawMetatileAt
	add	r0, r4, #0x2
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x1f
	bls	.L45	@cond_branch
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L49:
	.align	2, 0
.L48:
	.word	gSaveBlock1
.Lfe10:
	.size	 RedrawMapSliceNorth,.Lfe10-RedrawMapSliceNorth
	.align	2, 0
	.type	 RedrawMapSliceSouth,function
	.thumb_func
RedrawMapSliceSouth:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r5, r0, #0
	mov	r8, r1
	ldrb	r0, [r5, #0x3]
	lsl	r7, r0, #0x5
	mov	r4, #0x0
	ldr	r6, .L57
.L54:
	ldrb	r0, [r5, #0x2]
	add	r0, r4, r0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1f
	bls	.L55	@cond_branch
	sub	r0, r0, #0x20
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
.L55:
	add	r1, r7, r0
	mov	r0, #0x0
	ldrsh	r2, [r6, r0]
	lsr	r0, r4, #0x1
	add	r2, r2, r0
	mov	r0, #0x2
	ldrsh	r3, [r6, r0]
	mov	r0, r8
	bl	DrawMetatileAt
	add	r0, r4, #0x2
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x1f
	bls	.L54	@cond_branch
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L58:
	.align	2, 0
.L57:
	.word	gSaveBlock1
.Lfe11:
	.size	 RedrawMapSliceSouth,.Lfe11-RedrawMapSliceSouth
	.align	2, 0
	.type	 RedrawMapSliceEast,function
	.thumb_func
RedrawMapSliceEast:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r5, r0, #0
	mov	r8, r1
	ldrb	r6, [r5, #0x2]
	mov	r4, #0x0
.L63:
	ldrb	r0, [r5, #0x3]
	add	r0, r4, r0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1f
	bls	.L64	@cond_branch
	sub	r0, r0, #0x20
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
.L64:
	lsl	r1, r0, #0x5
	add	r1, r1, r6
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	ldr	r0, .L66
	mov	r3, #0x0
	ldrsh	r2, [r0, r3]
	mov	r7, #0x2
	ldrsh	r3, [r0, r7]
	lsr	r0, r4, #0x1
	add	r3, r3, r0
	mov	r0, r8
	bl	DrawMetatileAt
	add	r0, r4, #0x2
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x1f
	bls	.L63	@cond_branch
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L67:
	.align	2, 0
.L66:
	.word	gSaveBlock1
.Lfe12:
	.size	 RedrawMapSliceEast,.Lfe12-RedrawMapSliceEast
	.align	2, 0
	.type	 RedrawMapSliceWest,function
	.thumb_func
RedrawMapSliceWest:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r6, r0, #0
	mov	r8, r1
	ldrb	r0, [r6, #0x2]
	add	r0, r0, #0x1c
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0x1f
	bls	.L69	@cond_branch
	add	r0, r5, #0
	sub	r0, r0, #0x20
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
.L69:
	mov	r4, #0x0
	ldr	r7, .L76
.L73:
	ldrb	r0, [r6, #0x3]
	add	r0, r4, r0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1f
	bls	.L74	@cond_branch
	sub	r0, r0, #0x20
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
.L74:
	lsl	r1, r0, #0x5
	add	r1, r1, r5
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	r0, #0x0
	ldrsh	r2, [r7, r0]
	add	r2, r2, #0xe
	mov	r0, #0x2
	ldrsh	r3, [r7, r0]
	lsr	r0, r4, #0x1
	add	r3, r3, r0
	mov	r0, r8
	bl	DrawMetatileAt
	add	r0, r4, #0x2
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x1f
	bls	.L73	@cond_branch
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L77:
	.align	2, 0
.L76:
	.word	gSaveBlock1
.Lfe13:
	.size	 RedrawMapSliceWest,.Lfe13-RedrawMapSliceWest
	.align	2, 0
	.globl	CurrentMapDrawMetatileAt
	.type	 CurrentMapDrawMetatileAt,function
	.thumb_func
CurrentMapDrawMetatileAt:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	ldr	r6, .L80
	add	r0, r6, #0
	add	r1, r4, #0
	add	r2, r5, #0
	bl	MapPosToBgTilemapOffset
	add	r1, r0, #0
	cmp	r1, #0
	blt	.L79	@cond_branch
	ldr	r0, .L80+0x4
	ldr	r0, [r0]
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r2, r4, #0
	add	r3, r5, #0
	bl	DrawMetatileAt
	mov	r0, #0x1
	strb	r0, [r6, #0x4]
.L79:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L81:
	.align	2, 0
.L80:
	.word	gUnknown_03000590
	.word	gMapHeader
.Lfe14:
	.size	 CurrentMapDrawMetatileAt,.Lfe14-CurrentMapDrawMetatileAt
	.align	2, 0
	.globl	DrawDoorMetatileAt
	.type	 DrawDoorMetatileAt,function
	.thumb_func
DrawDoorMetatileAt:
	push	{r4, r5, r6, lr}
	add	r3, r0, #0
	add	r4, r1, #0
	add	r5, r2, #0
	ldr	r6, .L84
	add	r0, r6, #0
	add	r1, r3, #0
	add	r2, r4, #0
	bl	MapPosToBgTilemapOffset
	cmp	r0, #0
	blt	.L83	@cond_branch
	lsl	r2, r0, #0x10
	lsr	r2, r2, #0x10
	mov	r0, #0x1
	add	r1, r5, #0
	bl	DrawMetatile
	mov	r0, #0x1
	strb	r0, [r6, #0x4]
.L83:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L85:
	.align	2, 0
.L84:
	.word	gUnknown_03000590
.Lfe15:
	.size	 DrawDoorMetatileAt,.Lfe15-DrawDoorMetatileAt
	.align	2, 0
	.type	 DrawMetatileAt,function
	.thumb_func
DrawMetatileAt:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r5, r0, #0
	add	r6, r2, #0
	add	r7, r3, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	r8, r1
	add	r0, r6, #0
	add	r1, r7, #0
	bl	MapGridGetMetatileIdAt
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	cmp	r4, r0
	bls	.L87	@cond_branch
	mov	r4, #0x0
.L87:
	ldr	r0, .L90
	cmp	r4, r0
	bhi	.L88	@cond_branch
	ldr	r0, [r5, #0x10]
	ldr	r5, [r0, #0xc]
	b	.L89
.L91:
	.align	2, 0
.L90:
	.word	0x1ff
.L88:
	ldr	r0, [r5, #0x14]
	ldr	r5, [r0, #0xc]
	ldr	r1, .L92
	add	r0, r4, r1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
.L89:
	add	r0, r6, #0
	add	r1, r7, #0
	bl	MapGridGetMetatileLayerTypeAt
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r1, r4, #0x4
	add	r1, r5, r1
	mov	r2, r8
	bl	DrawMetatile
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L93:
	.align	2, 0
.L92:
	.word	0xfffffe00
.Lfe16:
	.size	 DrawMetatileAt,.Lfe16-DrawMetatileAt
	.align	2, 0
	.type	 DrawMetatile,function
	.thumb_func
DrawMetatile:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r7, r1, #0
	lsl	r2, r2, #0x10
	lsr	r6, r2, #0x10
	cmp	r0, #0x1
	beq	.L97	@cond_branch
	cmp	r0, #0x1
	bgt	.L101	@cond_branch
	cmp	r0, #0
	bne	.LCB861
	b	.L98	@long jump
.LCB861:
	b	.L95
.L101:
	cmp	r0, #0x2
	beq	.LCB866
	b	.L95	@long jump
.LCB866:
	ldr	r0, .L103
	mov	ip, r0
	lsl	r1, r6, #0x1
	mov	r9, r1
	mov	r5, #0xc0
	lsl	r5, r5, #0x5
	add	r5, r5, ip
	add	r1, r1, r5
	ldrh	r0, [r7]
	mov	r2, #0x0
	mov	r8, r2
	strh	r0, [r1]
	add	r4, r6, #0x1
	lsl	r4, r4, #0x1
	add	r1, r4, r5
	ldrh	r0, [r7, #0x2]
	strh	r0, [r1]
	add	r3, r6, #0
	add	r3, r3, #0x20
	lsl	r3, r3, #0x1
	add	r1, r3, r5
	ldrh	r0, [r7, #0x4]
	strh	r0, [r1]
	add	r2, r6, #0
	add	r2, r2, #0x21
	lsl	r2, r2, #0x1
	add	r5, r2, r5
	ldrh	r0, [r7, #0x6]
	strh	r0, [r5]
	mov	r1, #0x80
	lsl	r1, r1, #0x5
	add	r1, r1, ip
	mov	r5, r9
	add	r0, r5, r1
	mov	r5, r8
	strh	r5, [r0]
	add	r0, r4, r1
	strh	r5, [r0]
	add	r0, r3, r1
	strh	r5, [r0]
	add	r1, r2, r1
	strh	r5, [r1]
	mov	r5, #0x80
	lsl	r5, r5, #0x4
	add	r5, r5, ip
	add	r9, r9, r5
	ldrh	r0, [r7, #0x8]
	mov	r1, r9
	strh	r0, [r1]
	add	r4, r4, r5
	ldrh	r0, [r7, #0xa]
	strh	r0, [r4]
	add	r3, r3, r5
	ldrh	r0, [r7, #0xc]
	strh	r0, [r3]
	add	r2, r2, r5
	ldrh	r0, [r7, #0xe]
	strh	r0, [r2]
	b	.L95
.L104:
	.align	2, 0
.L103:
	.word	gBGTilemapBuffers
.L97:
	ldr	r2, .L105
	mov	ip, r2
	lsl	r3, r6, #0x1
	mov	r8, r3
	mov	r2, #0xc0
	lsl	r2, r2, #0x5
	add	r2, r2, ip
	add	r1, r3, r2
	ldrh	r0, [r7]
	mov	r5, #0x0
	mov	r9, r5
	strh	r0, [r1]
	add	r5, r6, #0x1
	lsl	r5, r5, #0x1
	add	r1, r5, r2
	ldrh	r0, [r7, #0x2]
	strh	r0, [r1]
	add	r4, r6, #0
	add	r4, r4, #0x20
	lsl	r4, r4, #0x1
	add	r1, r4, r2
	ldrh	r0, [r7, #0x4]
	strh	r0, [r1]
	add	r3, r6, #0
	add	r3, r3, #0x21
	lsl	r3, r3, #0x1
	add	r2, r3, r2
	ldrh	r0, [r7, #0x6]
	strh	r0, [r2]
	mov	r1, #0x80
	lsl	r1, r1, #0x5
	add	r1, r1, ip
	mov	r0, r8
	add	r2, r0, r1
	ldrh	r0, [r7, #0x8]
	strh	r0, [r2]
	add	r2, r5, r1
	ldrh	r0, [r7, #0xa]
	strh	r0, [r2]
	add	r2, r4, r1
	ldrh	r0, [r7, #0xc]
	strh	r0, [r2]
	add	r1, r3, r1
	ldrh	r0, [r7, #0xe]
	strh	r0, [r1]
	ldr	r1, .L105+0x4
	add	r8, r8, r1
	mov	r0, r9
	mov	r2, r8
	strh	r0, [r2]
	add	r5, r5, r1
	strh	r0, [r5]
	add	r4, r4, r1
	strh	r0, [r4]
	add	r3, r3, r1
	b	.L102
.L106:
	.align	2, 0
.L105:
	.word	gBGTilemapBuffers
	.word	gBGTilemapBuffers+0x800
.L98:
	ldr	r1, .L107
	mov	r9, r1
	lsl	r2, r6, #0x1
	mov	r8, r2
	mov	r1, #0xc0
	lsl	r1, r1, #0x5
	add	r1, r1, r9
	add	r0, r2, r1
	ldr	r2, .L107+0x4
	strh	r2, [r0]
	add	r5, r6, #0x1
	lsl	r5, r5, #0x1
	add	r0, r5, r1
	strh	r2, [r0]
	add	r4, r6, #0
	add	r4, r4, #0x20
	lsl	r4, r4, #0x1
	add	r0, r4, r1
	strh	r2, [r0]
	add	r3, r6, #0
	add	r3, r3, #0x21
	lsl	r3, r3, #0x1
	add	r1, r3, r1
	strh	r2, [r1]
	mov	r1, #0x80
	lsl	r1, r1, #0x5
	add	r1, r1, r9
	mov	r0, r8
	add	r2, r0, r1
	ldrh	r0, [r7]
	strh	r0, [r2]
	add	r2, r5, r1
	ldrh	r0, [r7, #0x2]
	strh	r0, [r2]
	add	r2, r4, r1
	ldrh	r0, [r7, #0x4]
	strh	r0, [r2]
	add	r1, r3, r1
	ldrh	r0, [r7, #0x6]
	strh	r0, [r1]
	mov	r2, #0x80
	lsl	r2, r2, #0x4
	add	r2, r2, r9
	add	r8, r8, r2
	ldrh	r0, [r7, #0x8]
	mov	r1, r8
	strh	r0, [r1]
	add	r5, r5, r2
	ldrh	r0, [r7, #0xa]
	strh	r0, [r5]
	add	r4, r4, r2
	ldrh	r0, [r7, #0xc]
	strh	r0, [r4]
	add	r3, r3, r2
	ldrh	r0, [r7, #0xe]
.L102:
	strh	r0, [r3]
.L95:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L108:
	.align	2, 0
.L107:
	.word	gBGTilemapBuffers
	.word	0x3014
.Lfe17:
	.size	 DrawMetatile,.Lfe17-DrawMetatile
	.align	2, 0
	.type	 MapPosToBgTilemapOffset,function
	.thumb_func
MapPosToBgTilemapOffset:
	push	{r4, r5, lr}
	add	r3, r0, #0
	ldr	r4, .L116
	mov	r5, #0x0
	ldrsh	r0, [r4, r5]
	sub	r1, r1, r0
	lsl	r1, r1, #0x1
	cmp	r1, #0x1f
	bhi	.L115	@cond_branch
	ldrb	r0, [r3, #0x2]
	add	r1, r1, r0
	cmp	r1, #0x1f
	ble	.L111	@cond_branch
	sub	r1, r1, #0x20
.L111:
	mov	r5, #0x2
	ldrsh	r0, [r4, r5]
	sub	r0, r2, r0
	lsl	r2, r0, #0x1
	cmp	r2, #0x1f
	bls	.L112	@cond_branch
.L115:
	mov	r0, #0x1
	neg	r0, r0
	b	.L114
.L117:
	.align	2, 0
.L116:
	.word	gSaveBlock1
.L112:
	ldrb	r0, [r3, #0x3]
	add	r2, r2, r0
	cmp	r2, #0x1f
	ble	.L113	@cond_branch
	sub	r2, r2, #0x20
.L113:
	lsl	r0, r2, #0x5
	add	r0, r0, r1
.L114:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.Lfe18:
	.size	 MapPosToBgTilemapOffset,.Lfe18-MapPosToBgTilemapOffset
	.align	2, 0
	.type	 CameraUpdateCallback,function
	.thumb_func
CameraUpdateCallback:
	push	{lr}
	add	r3, r0, #0
	ldr	r2, [r3, #0x4]
	cmp	r2, #0
	beq	.L119	@cond_branch
	ldr	r1, .L120
	lsl	r0, r2, #0x4
	add	r0, r0, r2
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	mov	r2, #0x32
	ldrsh	r1, [r0, r2]
	str	r1, [r3, #0x8]
	mov	r1, #0x34
	ldrsh	r0, [r0, r1]
	str	r0, [r3, #0xc]
.L119:
	pop	{r0}
	bx	r0
.L121:
	.align	2, 0
.L120:
	.word	gSprites
.Lfe19:
	.size	 CameraUpdateCallback,.Lfe19-CameraUpdateCallback
	.align	2, 0
	.globl	ResetCameraUpdateInfo
	.type	 ResetCameraUpdateInfo,function
	.thumb_func
ResetCameraUpdateInfo:
	ldr	r1, .L123
	mov	r0, #0x0
	str	r0, [r1, #0x8]
	str	r0, [r1, #0xc]
	str	r0, [r1, #0x10]
	str	r0, [r1, #0x14]
	str	r0, [r1, #0x4]
	str	r0, [r1]
	bx	lr
.L124:
	.align	2, 0
.L123:
	.word	gUnknown_03004880
.Lfe20:
	.size	 ResetCameraUpdateInfo,.Lfe20-ResetCameraUpdateInfo
	.align	2, 0
	.globl	InitCameraUpdateCallback
	.type	 InitCameraUpdateCallback,function
	.thumb_func
InitCameraUpdateCallback:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	ldr	r4, .L127
	ldr	r1, [r4, #0x4]
	cmp	r1, #0
	beq	.L126	@cond_branch
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r1, .L127+0x4
	add	r0, r0, r1
	bl	DestroySprite
.L126:
	add	r0, r5, #0
	bl	AddCameraObject
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [r4, #0x4]
	ldr	r0, .L127+0x8
	str	r0, [r4]
	mov	r0, #0x0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L128:
	.align	2, 0
.L127:
	.word	gUnknown_03004880
	.word	gSprites
	.word	CameraUpdateCallback
.Lfe21:
	.size	 InitCameraUpdateCallback,.Lfe21-InitCameraUpdateCallback
	.align	2, 0
	.globl	CameraUpdate
	.type	 CameraUpdate,function
	.thumb_func
CameraUpdate:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	ldr	r6, .L147
	ldr	r1, [r6]
	cmp	r1, #0
	beq	.L130	@cond_branch
	add	r0, r6, #0
	bl	_call_via_r1
.L130:
	ldr	r7, [r6, #0x8]
	ldr	r0, [r6, #0xc]
	mov	r8, r0
	mov	r4, #0x0
	mov	r5, #0x0
	ldr	r1, [r6, #0x10]
	ldr	r0, [r6, #0x14]
	cmp	r1, #0
	bne	.L131	@cond_branch
	cmp	r7, #0
	beq	.L131	@cond_branch
	sub	r4, r4, #0x1
	cmp	r7, #0
	ble	.L131	@cond_branch
	mov	r4, #0x1
.L131:
	cmp	r0, #0
	bne	.L134	@cond_branch
	mov	r2, r8
	cmp	r2, #0
	beq	.L134	@cond_branch
	mov	r5, #0x1
	neg	r5, r5
	cmp	r2, #0
	ble	.L134	@cond_branch
	mov	r5, #0x1
.L134:
	cmp	r1, #0
	beq	.L137	@cond_branch
	cmn	r1, r7
	bne	.L137	@cond_branch
	mov	r4, #0x1
	neg	r4, r4
	cmp	r7, #0
	ble	.L137	@cond_branch
	mov	r4, #0x1
.L137:
	cmp	r0, #0
	beq	.L140	@cond_branch
	mov	r3, r8
	cmn	r0, r3
	bne	.L140	@cond_branch
	mov	r4, #0x1
	neg	r4, r4
	cmp	r3, #0
	ble	.L140	@cond_branch
	mov	r4, #0x1
.L140:
	ldr	r2, .L147
	ldr	r0, [r2, #0x10]
	add	r1, r0, r7
	str	r1, [r2, #0x10]
	add	r0, r1, #0
	cmp	r1, #0
	bge	.L143	@cond_branch
	add	r0, r0, #0xf
.L143:
	asr	r0, r0, #0x4
	lsl	r0, r0, #0x4
	sub	r0, r1, r0
	str	r0, [r2, #0x10]
	ldr	r0, [r2, #0x14]
	mov	r3, r8
	add	r1, r0, r3
	str	r1, [r2, #0x14]
	add	r0, r1, #0
	cmp	r1, #0
	bge	.L144	@cond_branch
	add	r0, r0, #0xf
.L144:
	asr	r0, r0, #0x4
	lsl	r0, r0, #0x4
	sub	r0, r1, r0
	str	r0, [r2, #0x14]
	cmp	r4, #0
	bne	.L146	@cond_branch
	cmp	r5, #0
	beq	.L145	@cond_branch
.L146:
	add	r0, r4, #0
	add	r1, r5, #0
	bl	CameraMove
	add	r0, r4, #0
	add	r1, r5, #0
	bl	UpdateFieldObjectsForCameraUpdate
	add	r0, r4, #0
	add	r1, r5, #0
	bl	RotatingGatePuzzleCameraUpdate
	bl	ResetBerryTreeSparkleFlags
	ldr	r6, .L147+0x4
	lsl	r4, r4, #0x1
	lsl	r5, r5, #0x1
	add	r0, r6, #0
	add	r1, r4, #0
	add	r2, r5, #0
	bl	tilemap_move_something
	add	r0, r6, #0
	add	r1, r4, #0
	add	r2, r5, #0
	bl	RedrawMapSlicesForCameraUpdate
.L145:
	ldr	r0, .L147+0x4
	add	r1, r7, #0
	mov	r2, r8
	bl	coords8_add
	ldr	r1, .L147+0x8
	ldrh	r0, [r1]
	sub	r0, r0, r7
	strh	r0, [r1]
	ldr	r1, .L147+0xc
	ldrh	r0, [r1]
	mov	r2, r8
	sub	r0, r0, r2
	strh	r0, [r1]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L148:
	.align	2, 0
.L147:
	.word	gUnknown_03004880
	.word	gUnknown_03000590
	.word	gUnknown_0300489C
	.word	gUnknown_03004898
.Lfe22:
	.size	 CameraUpdate,.Lfe22-CameraUpdate
	.align	2, 0
	.globl	camera_move_and_redraw
	.type	 camera_move_and_redraw,function
	.thumb_func
camera_move_and_redraw:
	push	{r4, r5, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	bl	CameraMove
	lsl	r0, r4, #0x10
	asr	r0, r0, #0x10
	lsl	r1, r5, #0x10
	asr	r1, r1, #0x10
	bl	UpdateFieldObjectsForCameraUpdate
	bl	DrawWholeMapView
	ldr	r1, .L150
	lsl	r4, r4, #0x4
	ldrh	r0, [r1]
	sub	r0, r0, r4
	strh	r0, [r1]
	ldr	r1, .L150+0x4
	lsl	r5, r5, #0x4
	ldrh	r0, [r1]
	sub	r0, r0, r5
	strh	r0, [r1]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L151:
	.align	2, 0
.L150:
	.word	gUnknown_0300489C
	.word	gUnknown_03004898
.Lfe23:
	.size	 camera_move_and_redraw,.Lfe23-camera_move_and_redraw
	.align	2, 0
	.globl	SetCameraPanningCallback
	.type	 SetCameraPanningCallback,function
	.thumb_func
SetCameraPanningCallback:
	ldr	r1, .L153
	str	r0, [r1]
	bx	lr
.L154:
	.align	2, 0
.L153:
	.word	gUnknown_030005A0
.Lfe24:
	.size	 SetCameraPanningCallback,.Lfe24-SetCameraPanningCallback
	.align	2, 0
	.globl	SetCameraPanning
	.type	 SetCameraPanning,function
	.thumb_func
SetCameraPanning:
	ldr	r2, .L156
	strh	r0, [r2]
	ldr	r0, .L156+0x4
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	add	r1, r1, #0x20
	strh	r1, [r0]
	bx	lr
.L157:
	.align	2, 0
.L156:
	.word	gUnknown_03000598
	.word	gUnknown_0300059A
.Lfe25:
	.size	 SetCameraPanning,.Lfe25-SetCameraPanning
	.align	2, 0
	.globl	InstallCameraPanAheadCallback
	.type	 InstallCameraPanAheadCallback,function
	.thumb_func
InstallCameraPanAheadCallback:
	ldr	r1, .L159
	ldr	r0, .L159+0x4
	str	r0, [r1]
	ldr	r1, .L159+0x8
	mov	r0, #0x0
	strb	r0, [r1]
	ldr	r1, .L159+0xc
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r1, .L159+0x10
	mov	r0, #0x20
	strh	r0, [r1]
	bx	lr
.L160:
	.align	2, 0
.L159:
	.word	gUnknown_030005A0
	.word	CameraPanningCB_PanAhead
	.word	gUnknown_0300059C
	.word	gUnknown_03000598
	.word	gUnknown_0300059A
.Lfe26:
	.size	 InstallCameraPanAheadCallback,.Lfe26-InstallCameraPanAheadCallback
	.align	2, 0
	.globl	UpdateCameraPanning
	.type	 UpdateCameraPanning,function
	.thumb_func
UpdateCameraPanning:
	push	{lr}
	ldr	r0, .L163
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L162	@cond_branch
	bl	_call_via_r0
.L162:
	ldr	r2, .L163+0x4
	ldr	r0, .L163+0x8
	ldr	r1, .L163+0xc
	ldrh	r0, [r0]
	ldrh	r1, [r1]
	sub	r0, r0, r1
	strh	r0, [r2]
	ldr	r2, .L163+0x10
	ldr	r0, .L163+0x14
	ldr	r1, .L163+0x18
	ldrh	r0, [r0]
	ldrh	r1, [r1]
	sub	r0, r0, r1
	sub	r0, r0, #0x8
	strh	r0, [r2]
	pop	{r0}
	bx	r0
.L164:
	.align	2, 0
.L163:
	.word	gUnknown_030005A0
	.word	gSpriteCoordOffsetX
	.word	gUnknown_0300489C
	.word	gUnknown_03000598
	.word	gSpriteCoordOffsetY
	.word	gUnknown_03004898
	.word	gUnknown_0300059A
.Lfe27:
	.size	 UpdateCameraPanning,.Lfe27-UpdateCameraPanning
	.align	2, 0
	.type	 CameraPanningCB_PanAhead,function
	.thumb_func
CameraPanningCB_PanAhead:
	push	{lr}
	ldr	r0, .L181
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L166	@cond_branch
	bl	InstallCameraPanAheadCallback
	b	.L165
.L182:
	.align	2, 0
.L181:
	.word	gUnusedBikeCameraAheadPanback
.L166:
	ldr	r0, .L183
	ldrb	r0, [r0, #0x3]
	cmp	r0, #0x1
	bne	.L168	@cond_branch
	ldr	r0, .L183+0x4
	ldrb	r1, [r0]
	mov	r2, #0x1
	eor	r1, r1, r2
	strb	r1, [r0]
	cmp	r1, #0
	beq	.L165	@cond_branch
	b	.L170
.L184:
	.align	2, 0
.L183:
	.word	gPlayerAvatar
	.word	gUnknown_0300059C
.L168:
	ldr	r1, .L185
	mov	r0, #0x0
	strb	r0, [r1]
.L170:
	bl	player_get_direction_upper_nybble
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x2
	bne	.L171	@cond_branch
	ldr	r2, .L185+0x4
	ldrh	r3, [r2]
	mov	r0, #0x0
	ldrsh	r1, [r2, r0]
	mov	r0, #0x8
	neg	r0, r0
	cmp	r1, r0
	ble	.L165	@cond_branch
	sub	r0, r3, #0x2
	b	.L180
.L186:
	.align	2, 0
.L185:
	.word	gUnknown_0300059C
	.word	gUnknown_0300059A
.L171:
	cmp	r0, #0x1
	bne	.L174	@cond_branch
	ldr	r1, .L187
	ldrh	r2, [r1]
	mov	r3, #0x0
	ldrsh	r0, [r1, r3]
	cmp	r0, #0x47
	bgt	.L165	@cond_branch
	add	r0, r2, #0x2
	strh	r0, [r1]
	b	.L165
.L188:
	.align	2, 0
.L187:
	.word	gUnknown_0300059A
.L174:
	ldr	r2, .L189
	ldrh	r0, [r2]
	mov	r3, #0x0
	ldrsh	r1, [r2, r3]
	cmp	r1, #0x1f
	bgt	.L177	@cond_branch
	add	r0, r0, #0x2
	b	.L180
.L190:
	.align	2, 0
.L189:
	.word	gUnknown_0300059A
.L177:
	cmp	r1, #0x20
	ble	.L165	@cond_branch
	sub	r0, r0, #0x2
.L180:
	strh	r0, [r2]
.L165:
	pop	{r0}
	bx	r0
.Lfe28:
	.size	 CameraPanningCB_PanAhead,.Lfe28-CameraPanningCB_PanAhead
	.comm	gUnknown_03004880, 24	@ 24
	.comm	gUnknown_03004898, 4	@ 2
	.comm	gUnknown_0300489C, 4	@ 2

	.lcomm	gUnknown_03000590,8

	.lcomm	gUnknown_03000598,2

	.lcomm	gUnknown_0300059A,2

	.lcomm	gUnknown_0300059C,1

	.lcomm	gUnknown_030005A0,4
.text
	.align	2, 0