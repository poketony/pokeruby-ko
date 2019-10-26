RSFONT := tools/rsfont/rsfont
GBAGFX := tools/gbagfx/gbagfx

graphics/fonts/font0_jpn.1bpp: graphics/fonts/font0_jpn.png
	$(RSFONT) $< $@ 240 1

graphics/fonts/font1_jpn.1bpp: graphics/fonts/font1_jpn.png
	$(RSFONT) $< $@ 256 0

graphics/fonts/font3_jpn.4bpp: graphics/fonts/font3_jpn.png
	$(RSFONT) $< $@ 252 2

graphics/fonts/font4_jpn.4bpp: graphics/fonts/font4_jpn.png
	$(RSFONT) $< $@ 220 0

graphics/fonts/font0_lat.1bpp: graphics/fonts/font0_lat.png
	$(RSFONT) $< $@ 256 1

graphics/fonts/font1_lat.1bpp: graphics/fonts/font1_lat.png
	$(RSFONT) $< $@ 256 0

graphics/fonts/font3_lat.4bpp: graphics/fonts/font3_lat.png
	$(RSFONT) $< $@ 254 1

graphics/fonts/font3_lat_rev1.4bpp: graphics/fonts/font3_lat_rev1.png
	$(RSFONT) $< $@ 254 1

graphics/fonts/font4_lat.4bpp: graphics/fonts/font4_lat.png
	$(RSFONT) $< $@ 220 0

graphics/fonts/font4_lat_rev1.4bpp: graphics/fonts/font4_lat_rev1.png
	$(RSFONT) $< $@ 220 0

graphics/fonts/font6_braille.1bpp: graphics/fonts/font6_braille.png
	$(RSFONT) $< $@ 192 0

graphics/fonts/font3_kor.4bpp: graphics/fonts/font3_kor.png
	$(RSFONT) $< $@ 5216 1

graphics/fonts/font4_kor.4bpp: graphics/fonts/font4_kor.png
	$(RSFONT) $< $@ 2608 0

graphics/fonts/font3_kor2.4bpp: graphics/fonts/font3_kor2.png
	$(RSFONT) $< $@ 2608 1

graphics/fonts/font3_kor3.4bpp: graphics/fonts/font3_kor3.png
	$(RSFONT) $< $@ 5216 1
