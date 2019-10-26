	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gOamData_839B4D8:: @ 839B4D8
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteImageTable_839B4E0:: @ 839B4E0
	obj_frame_tiles gSpriteImage_839B308, 0x80
	obj_frame_tiles gSpriteImage_839B388, 0x80

	.align 2
gSpriteImageTable_839B4F0:: @ 839B4F0
	obj_frame_tiles gSpriteImage_839B408, 0x80

	.align 2
gSpriteAnim_839B4F8:: @ 839B4F8
	obj_image_anim_frame 0, 60
	obj_image_anim_end

	.align 2
gSpriteAnim_839B500:: @ 839B500
	obj_image_anim_frame 1, 60
	obj_image_anim_end

	.align 2
gSpriteAnimTable_839B508:: @ 839B508
	.4byte gSpriteAnim_839B4F8
	.4byte gSpriteAnim_839B500

	.align 2
gSpriteTemplate_839B510:: @ 839B510
	spr_template 0xFFFF, 0xFFFF, gOamData_839B4D8, gSpriteAnimTable_839B508, gSpriteImageTable_839B4E0, gDummySpriteAffineAnimTable, objc_exclamation_mark_probably

	.align 2
gSpriteTemplate_839B528:: @ 839B528
	spr_template 0xFFFF, 4100, gOamData_839B4D8, gSpriteAnimTable_839B508, gSpriteImageTable_839B4F0, gDummySpriteAffineAnimTable, objc_exclamation_mark_probably
