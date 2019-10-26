	.section korean_data, "aw", %progbits

	.align 2
gFont3KoreanGlyphs::
	.incbin "graphics/fonts/font3_kor.4bpp"

	.align 2
gFont4KoreanGlyphs::
	.incbin "graphics/fonts/font4_kor.4bpp"

	.align 2
gFont3Korean2Glyphs::
	.incbin "graphics/fonts/font3_kor2.4bpp"

	.align 2
gFont3Korean3Glyphs::
	.incbin "graphics/fonts/font3_kor3.4bpp"

	.align 2
gUnicodeToKorean::
	.incbin "graphics/fonts/uni2kor.bin"

	.align 2
gKoreanToUnicode::
	.incbin "graphics/fonts/kor2uni.bin"
