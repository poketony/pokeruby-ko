	.align 2
gUnknown_083C9408:: @ 83C9408
	.2byte 286 @ SPECIES_ID
	.string "포챠$", 11 @ POKE_NICKNAME
	.string "건강$", 8 @ TRAINER_NAME
	.byte 7 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x0c000fff @ FLAGS
	.2byte 68 @ RANK
	.2byte MOVE_ROAR, MOVE_BITE, MOVE_TAKE_DOWN, MOVE_HOWL
	.byte 10, 4, 10, 3, 4, 50 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 288 @ SPECIES_ID
	.string "ZIGOON$", 11 @ POKE_NICKNAME
	.string "EDITH$", 8 @ TRAINER_NAME
	.byte 8 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x82000fff @ FLAGS
	.2byte 16 @ RANK
	.2byte MOVE_REST, MOVE_TAIL_WHIP, MOVE_TACKLE, MOVE_COVET
	.byte 10, 10, 6, 1, 2, 60 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 294 @ SPECIES_ID
	.string "DUSTER$", 11 @ POKE_NICKNAME
	.string "주로$", 8 @ TRAINER_NAME
	.byte 11 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x21000fff @ FLAGS
	.2byte 8 @ RANK
	.2byte MOVE_SILVER_WIND, MOVE_MOONLIGHT, MOVE_LIGHT_SCREEN, MOVE_GUST
	.byte 2, 10, 10, 12, 4, 70 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 298 @ SPECIES_ID
	.string "DOTS$", 11 @ POKE_NICKNAME
	.string "나주$", 8 @ TRAINER_NAME
	.byte 16 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x20800fff @ FLAGS
	.2byte 96 @ RANK
	.2byte MOVE_BIDE, MOVE_SYNTHESIS, MOVE_BULLET_SEED, MOVE_GROWTH
	.byte 3, 3, 5, 2, 7, 80 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 304 @ SPECIES_ID
	.string "TATAY$", 11 @ POKE_NICKNAME
	.string "혜화$", 8 @ TRAINER_NAME
	.byte 18 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80400fff @ FLAGS
	.2byte 4 @ RANK
	.2byte MOVE_WING_ATTACK, MOVE_AGILITY, MOVE_AERIAL_ACE, MOVE_GROWL
	.byte 1, 3, 3, 5, 4, 90 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 301 @ SPECIES_ID
	.string "토중$", 11 @ POKE_NICKNAME
	.string "렌$", 8 @ TRAINER_NAME
	.byte 44 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x10200fff @ FLAGS
	.2byte 32 @ RANK
	.2byte MOVE_LEECH_LIFE, MOVE_FALSE_SWIPE, MOVE_FURY_SWIPES, MOVE_MIND_READER
	.byte 5, 2, 10, 7, 8, 100 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 306 @ SPECIES_ID
	.string "코코$", 11 @ POKE_NICKNAME
	.string "승인$", 8 @ TRAINER_NAME
	.byte 35 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x20100fff @ FLAGS
	.2byte 32 @ RANK
	.2byte MOVE_STUN_SPORE, MOVE_LEECH_SEED, MOVE_MEGA_DRAIN, MOVE_ATTRACT
	.byte 3, 3, 10, 2, 2, 50 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 309 @ SPECIES_ID
	.string "GULWEE$", 11 @ POKE_NICKNAME
	.string "유이카$", 8 @ TRAINER_NAME
	.byte 26 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x08080fff @ FLAGS
	.2byte 24 @ RANK
	.2byte MOVE_MIST, MOVE_WATER_GUN, MOVE_GROWL, MOVE_PURSUIT
	.byte 3, 5, 1, 10, 10, 60 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 364 @ SPECIES_ID
	.string "SLOKTH$", 11 @ POKE_NICKNAME
	.string "인목$", 8 @ TRAINER_NAME
	.byte 31 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x40040fff @ FLAGS
	.2byte 88 @ RANK
	.2byte MOVE_STRENGTH, MOVE_COUNTER, MOVE_YAWN, MOVE_ENCORE
	.byte 10, 4, 4, 5, 18, 70 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 370 @ SPECIES_ID
	.string "곤뇽$", 11 @ POKE_NICKNAME
	.string "청이$", 8 @ TRAINER_NAME
	.byte 47 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80020fff @ FLAGS
	.2byte 36 @ RANK
	.2byte MOVE_ASTONISH, MOVE_SCREECH, MOVE_UPROAR, MOVE_HYPER_VOICE
	.byte 2, 2, 7, 2, 7, 80 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 335 @ SPECIES_ID
	.string "풍풍$", 11 @ POKE_NICKNAME
	.string "명웅$", 8 @ TRAINER_NAME
	.byte 38 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x08010fff @ FLAGS
	.2byte 68 @ RANK
	.2byte MOVE_SEISMIC_TOSS, MOVE_VITAL_THROW, MOVE_TACKLE, MOVE_REVERSAL
	.byte 9, 1, 1, 8, 1, 90 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 382 @ SPECIES_ID
	.string "보리$", 11 @ POKE_NICKNAME
	.string "청엽$", 8 @ TRAINER_NAME
	.byte 10 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x08008fff @ FLAGS
	.2byte 68 @ RANK
	.2byte MOVE_METAL_CLAW, MOVE_IRON_DEFENSE, MOVE_HEADBUTT, MOVE_TAKE_DOWN
	.byte 5, 10, 2, 10, 2, 100 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 41 @ SPECIES_ID
	.string "ZUTZU$", 11 @ POKE_NICKNAME
	.string "용수$", 8 @ TRAINER_NAME
	.byte 33 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x90004fff @ FLAGS
	.2byte 56 @ RANK
	.2byte MOVE_HAZE, MOVE_MEAN_LOOK, MOVE_CONFUSE_RAY, MOVE_LEECH_LIFE
	.byte 4, 2, 2, 2, 10, 50 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 367 @ SPECIES_ID
	.string "GULIN$", 11 @ POKE_NICKNAME
	.string "유우나$", 8 @ TRAINER_NAME
	.byte 6 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x40002fff @ FLAGS
	.2byte 16 @ RANK
	.2byte MOVE_SLUDGE, MOVE_AMNESIA, MOVE_TOXIC, MOVE_YAWN
	.byte 1, 10, 1, 10, 5, 60 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 337 @ SPECIES_ID
	.string "라이건$", 11 @ POKE_NICKNAME
	.string "신광$", 8 @ TRAINER_NAME
	.byte 15 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80001fff @ FLAGS
	.2byte 12 @ RANK
	.2byte MOVE_SPARK, MOVE_THUNDER_WAVE, MOVE_THUNDER, MOVE_ROAR
	.byte 20, 10, 1, 1, 1, 70 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 363 @ SPECIES_ID
	.string "RELIA$", 11 @ POKE_NICKNAME
	.string "모모$", 8 @ TRAINER_NAME
	.byte 32 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x24000fff @ FLAGS
	.2byte 41 @ RANK
	.2byte MOVE_PETAL_DANCE, MOVE_MAGICAL_LEAF, MOVE_GRASS_WHISTLE, MOVE_INGRAIN
	.byte 50, 15, 75, 10, 20, 100 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 84 @ SPECIES_ID
	.string "두둥$", 11 @ POKE_NICKNAME
	.string "진팔$", 8 @ TRAINER_NAME
	.byte 51 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x82000fff @ FLAGS
	.2byte 125 @ RANK
	.2byte MOVE_PECK, MOVE_FURY_ATTACK, MOVE_RETURN, MOVE_GROWL
	.byte 15, 21, 15, 85, 35, 110 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 332 @ SPECIES_ID
	.string "클래러$", 11 @ POKE_NICKNAME
	.string "수정$", 8 @ TRAINER_NAME
	.byte 8 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x81000fff @ FLAGS
	.2byte 113 @ RANK
	.2byte MOVE_BITE, MOVE_SAND_ATTACK, MOVE_DIG, MOVE_FAINT_ATTACK
	.byte 75, 25, 25, 10, 25, 120 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 344 @ SPECIES_ID
	.string "NACAC$", 11 @ POKE_NICKNAME
	.string "귀남$", 8 @ TRAINER_NAME
	.byte 11 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80800fff @ FLAGS
	.2byte 37 @ RANK
	.2byte MOVE_SPIKES, MOVE_LEER, MOVE_POISON_STING, MOVE_SAND_ATTACK
	.byte 10, 30, 25, 65, 25, 130 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 27 @ SPECIES_ID
	.string "SHRAND$", 11 @ POKE_NICKNAME
	.string "연두$", 8 @ TRAINER_NAME
	.byte 18 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x10400fff @ FLAGS
	.2byte 69 @ RANK
	.2byte MOVE_SLASH, MOVE_DEFENSE_CURL, MOVE_SWIFT, MOVE_FURY_SWIPES
	.byte 30, 90, 30, 10, 100, 140 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 318 @ SPECIES_ID
	.string "오뚝$", 11 @ POKE_NICKNAME
	.string "MORGAN$", 8 @ TRAINER_NAME
	.byte 44 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x08200fff @ FLAGS
	.2byte 41 @ RANK
	.2byte MOVE_SELF_DESTRUCT, MOVE_ROCK_TOMB, MOVE_PSYBEAM, MOVE_CONFUSION
	.byte 50, 40, 10, 35, 35, 150 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 339 @ SPECIES_ID
	.string "LENUM$", 11 @ POKE_NICKNAME
	.string "마오$", 8 @ TRAINER_NAME
	.byte 26 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x10100fff @ FLAGS
	.2byte 77 @ RANK
	.2byte MOVE_MAGNITUDE, MOVE_EARTHQUAKE, MOVE_SUNNY_DAY, MOVE_FLAMETHROWER
	.byte 40, 5, 40, 40, 40, 100 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 308 @ SPECIES_ID
	.string "SPININ$", 11 @ POKE_NICKNAME
	.string "정인$", 8 @ TRAINER_NAME
	.byte 31 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80080fff @ FLAGS
	.2byte 49 @ RANK
	.2byte MOVE_TEETER_DANCE, MOVE_PSYCH_UP, MOVE_HYPNOSIS, MOVE_UPROAR
	.byte 25, 75, 25, 10, 25, 110 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 358 @ SPECIES_ID
	.string "SWABY$", 11 @ POKE_NICKNAME
	.string "조화$", 8 @ TRAINER_NAME
	.byte 47 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0xa0040fff @ FLAGS
	.2byte 41 @ RANK
	.2byte MOVE_MIRROR_MOVE, MOVE_PERISH_SONG, MOVE_SAFEGUARD, MOVE_MIST
	.byte 30, 30, 40, 30, 25, 120 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 289 @ SPECIES_ID
	.string "NOONE$", 11 @ POKE_NICKNAME
	.string "신행$", 8 @ TRAINER_NAME
	.byte 38 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80020fff @ FLAGS
	.2byte 25 @ RANK
	.2byte MOVE_GROWL, MOVE_COVET, MOVE_SAND_ATTACK, MOVE_REST
	.byte 40, 40, 30, 10, 30, 130 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 317 @ SPECIES_ID
	.string "KECON$", 11 @ POKE_NICKNAME
	.string "교화$", 8 @ TRAINER_NAME
	.byte 10 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80010fff @ FLAGS
	.2byte 97 @ RANK
	.2byte MOVE_THIEF, MOVE_SCREECH, MOVE_ANCIENT_POWER, MOVE_BIND
	.byte 10, 10, 40, 75, 35, 140 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 118 @ SPECIES_ID
	.string "GOLDEN$", 11 @ POKE_NICKNAME
	.string "도현$", 8 @ TRAINER_NAME
	.byte 33 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80008fff @ FLAGS
	.2byte 13 @ RANK
	.2byte MOVE_HORN_ATTACK, MOVE_FURY_ATTACK, MOVE_HORN_DRILL, MOVE_TAIL_WHIP
	.byte 70, 30, 5, 30, 25, 150 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 323 @ SPECIES_ID
	.string "BOBOACH$", 11 @ POKE_NICKNAME
	.string "사효$", 8 @ TRAINER_NAME
	.byte 6 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80004fff @ FLAGS
	.2byte 113 @ RANK
	.2byte MOVE_MUD_SPORT, MOVE_WATER_SPORT, MOVE_EARTHQUAKE, MOVE_FUTURE_SIGHT
	.byte 45, 45, 60, 25, 15, 100 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 227 @ SPECIES_ID
	.string "CORPY$", 11 @ POKE_NICKNAME
	.string "순태$", 8 @ TRAINER_NAME
	.byte 35 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x08002fff @ FLAGS
	.2byte 77 @ RANK
	.2byte MOVE_SWIFT, MOVE_DOUBLE_TEAM, MOVE_AGILITY, MOVE_CUT
	.byte 40, 30, 25, 60, 20, 110 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 295 @ SPECIES_ID
	.string "TADO$", 11 @ POKE_NICKNAME
	.string "무혜$", 8 @ TRAINER_NAME
	.byte 16 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x08001fff @ FLAGS
	.2byte 57 @ RANK
	.2byte MOVE_ASTONISH, MOVE_GROWL, MOVE_RAIN_DANCE, MOVE_WATER_PULSE
	.byte 15, 15, 30, 15, 75, 120 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 383 @ SPECIES_ID
	.string "LAIRN$", 11 @ POKE_NICKNAME
	.string "공효$", 8 @ TRAINER_NAME
	.byte 55 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x84000fff @ FLAGS
	.2byte 98 @ RANK
	.2byte MOVE_METAL_SOUND, MOVE_METAL_CLAW, MOVE_HARDEN, MOVE_TAKE_DOWN
	.byte 30, 50, 35, 100, 90, 200 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 299 @ SPECIES_ID
	.string "NUZLE$", 11 @ POKE_NICKNAME
	.string "자희$", 8 @ TRAINER_NAME
	.byte 8 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x82000fff @ FLAGS
	.2byte 14 @ RANK
	.2byte MOVE_GROWTH, MOVE_RAZOR_WIND, MOVE_EXPLOSION, MOVE_EXTRASENSORY
	.byte 75, 75, 65, 35, 70, 210 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 302 @ SPECIES_ID
	.string "NINAS$", 11 @ POKE_NICKNAME
	.string "기태$", 8 @ TRAINER_NAME
	.byte 11 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x81000fff @ FLAGS
	.2byte 114 @ RANK
	.2byte MOVE_SCREECH, MOVE_FURY_SWIPES, MOVE_SAND_ATTACK, MOVE_BATON_PASS
	.byte 30, 50, 95, 70, 70, 220 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 305 @ SPECIES_ID
	.string "WELOW$", 11 @ POKE_NICKNAME
	.string "초미$", 8 @ TRAINER_NAME
	.byte 18 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80800fff @ FLAGS
	.2byte 14 @ RANK
	.2byte MOVE_AGILITY, MOVE_AERIAL_ACE, MOVE_WING_ATTACK, MOVE_FLY
	.byte 65, 85, 35, 75, 40, 230 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 287 @ SPECIES_ID
	.string "YENA$", 11 @ POKE_NICKNAME
	.string "할트$", 8 @ TRAINER_NAME
	.byte 44 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80400fff @ FLAGS
	.2byte 98 @ RANK
	.2byte MOVE_TAUNT, MOVE_THIEF, MOVE_ODOR_SLEUTH, MOVE_TAKE_DOWN
	.byte 40, 80, 35, 70, 70, 240 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 292 @ SPECIES_ID
	.string "뷰티플$", 11 @ POKE_NICKNAME
	.string "릴리카$", 8 @ TRAINER_NAME
	.byte 26 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80200fff @ FLAGS
	.2byte 42 @ RANK
	.2byte MOVE_MORNING_SUN, MOVE_SILVER_WIND, MOVE_STUN_SPORE, MOVE_SECRET_POWER
	.byte 40, 70, 25, 80, 100, 250 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 119 @ SPECIES_ID
	.string "KINGSEA$", 11 @ POKE_NICKNAME
	.string "기영$", 8 @ TRAINER_NAME
	.byte 31 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80100fff @ FLAGS
	.2byte 118 @ RANK
	.2byte MOVE_FLAIL, MOVE_SUPERSONIC, MOVE_HORN_ATTACK, MOVE_FURY_ATTACK
	.byte 80, 60, 30, 70, 90, 200 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 340 @ SPECIES_ID
	.string "ERUPAM$", 11 @ POKE_NICKNAME
	.string "초선$", 8 @ TRAINER_NAME
	.byte 47 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80080fff @ FLAGS
	.2byte 78 @ RANK
	.2byte MOVE_EARTHQUAKE, MOVE_FISSURE, MOVE_OVERHEAT, MOVE_HYPER_BEAM
	.byte 100, 80, 20, 50, 65, 210 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 66 @ SPECIES_ID
	.string "CHOPAM$", 11 @ POKE_NICKNAME
	.string "키요하르$", 8 @ TRAINER_NAME
	.byte 38 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80040fff @ FLAGS
	.2byte 66 @ RANK
	.2byte MOVE_SEISMIC_TOSS, MOVE_FOCUS_ENERGY, MOVE_KARATE_CHOP, MOVE_SCARY_FACE
	.byte 70, 85, 25, 60, 50, 220 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 296 @ SPECIES_ID
	.string "LOMBE$", 11 @ POKE_NICKNAME
	.string "시연$", 8 @ TRAINER_NAME
	.byte 10 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80020fff @ FLAGS
	.2byte 58 @ RANK
	.2byte MOVE_ATTRACT, MOVE_FLASH, MOVE_UPROAR, MOVE_GROWL
	.byte 40, 60, 90, 45, 70, 230 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 379 @ SPECIES_ID
	.string "스네이키$", 11 @ POKE_NICKNAME
	.string "길성$", 8 @ TRAINER_NAME
	.byte 33 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80010fff @ FLAGS
	.2byte 98 @ RANK
	.2byte MOVE_POISON_FANG, MOVE_GLARE, MOVE_WRAP, MOVE_SCREECH
	.byte 35, 50, 90, 40, 100, 240 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 313 @ SPECIES_ID
	.string "MERAIL$", 11 @ POKE_NICKNAME
	.string "SELENA$", 8 @ TRAINER_NAME
	.byte 22 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80008fff @ FLAGS
	.2byte 26 @ RANK
	.2byte MOVE_WATER_PULSE, MOVE_REST, MOVE_WATER_SPOUT, MOVE_SPLASH
	.byte 30, 100, 100, 50, 30, 250 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 129 @ SPECIES_ID
	.string "킹$", 11 @ POKE_NICKNAME
	.string "리키$", 8 @ TRAINER_NAME
	.byte 35 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80004fff @ FLAGS
	.2byte 82 @ RANK
	.2byte MOVE_TACKLE, MOVE_SPLASH, MOVE_FLAIL, MOVE_TACKLE
	.byte 30, 30, 160, 50, 160, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 348 @ SPECIES_ID
	.string "초승이$", 11 @ POKE_NICKNAME
	.string "연화$", 8 @ TRAINER_NAME
	.byte 16 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80002fff @ FLAGS
	.2byte 42 @ RANK
	.2byte MOVE_EXPLOSION, MOVE_FUTURE_SIGHT, MOVE_PSYCHIC, MOVE_CONFUSION
	.byte 50, 70, 60, 70, 50, 210 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 310 @ SPECIES_ID
	.string "PELIPE$", 11 @ POKE_NICKNAME
	.string "계남$", 8 @ TRAINER_NAME
	.byte 39 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80001fff @ FLAGS
	.2byte 14 @ RANK
	.2byte MOVE_MIST, MOVE_HAIL, MOVE_HYPER_BEAM, MOVE_WING_ATTACK
	.byte 95, 80, 85, 35, 35, 220 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 130 @ SPECIES_ID
	.string "RADOS$", 11 @ POKE_NICKNAME
	.string "용희$", 8 @ TRAINER_NAME
	.byte 32 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x84000fff @ FLAGS
	.2byte 79 @ RANK
	.2byte MOVE_HYPER_BEAM, MOVE_HYDRO_PUMP, MOVE_RAIN_DANCE, MOVE_BITE
	.byte 160, 200, 20, 40, 160, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 371 @ SPECIES_ID
	.string "공길이$", 11 @ POKE_NICKNAME
	.string "달홍$", 8 @ TRAINER_NAME
	.byte 21 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x82000fff @ FLAGS
	.2byte 71 @ RANK
	.2byte MOVE_HYPER_VOICE, MOVE_STOMP, MOVE_ROAR, MOVE_HOWL
	.byte 170, 50, 55, 150, 160, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 316 @ SPECIES_ID
	.string "CATTED$", 11 @ POKE_NICKNAME
	.string "아키나$", 8 @ TRAINER_NAME
	.byte 8 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x81000fff @ FLAGS
	.2byte 59 @ RANK
	.2byte MOVE_ATTRACT, MOVE_ASSIST, MOVE_FAINT_ATTACK, MOVE_TAIL_WHIP
	.byte 40, 200, 150, 185, 60, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 366 @ SPECIES_ID
	.string "SLING$", 11 @ POKE_NICKNAME
	.string "용식$", 8 @ TRAINER_NAME
	.byte 11 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80800fff @ FLAGS
	.2byte 115 @ RANK
	.2byte MOVE_COVET, MOVE_COUNTER, MOVE_ENCORE, MOVE_SLACK_OFF
	.byte 85, 85, 170, 110, 150, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 359 @ SPECIES_ID
	.string "TARIA$", 11 @ POKE_NICKNAME
	.string "진준$", 8 @ TRAINER_NAME
	.byte 18 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80400fff @ FLAGS
	.2byte 15 @ RANK
	.2byte MOVE_DRAGON_DANCE, MOVE_HYPER_BEAM, MOVE_PERISH_SONG, MOVE_SAFEGUARD
	.byte 170, 150, 30, 30, 90, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 393 @ SPECIES_ID
	.string "SHEDJA$", 11 @ POKE_NICKNAME
	.string "LAMAR$", 8 @ TRAINER_NAME
	.byte 15 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80200fff @ FLAGS
	.2byte 39 @ RANK
	.2byte MOVE_SHOCK_WAVE, MOVE_SHADOW_BALL, MOVE_SKILL_SWAP, MOVE_RETURN
	.byte 230, 60, 60, 230, 80, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 45 @ SPECIES_ID
	.string "PLUMILE$", 11 @ POKE_NICKNAME
	.string "은희$", 8 @ TRAINER_NAME
	.byte 26 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80100fff @ FLAGS
	.2byte 59 @ RANK
	.2byte MOVE_PETAL_DANCE, MOVE_SWEET_SCENT, MOVE_STUN_SPORE, MOVE_FLASH
	.byte 35, 200, 150, 130, 40, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 361 @ SPECIES_ID
	.string "KULLUSK$", 11 @ POKE_NICKNAME
	.string "일남$", 8 @ TRAINER_NAME
	.byte 31 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80080fff @ FLAGS
	.2byte 115 @ RANK
	.2byte MOVE_DISABLE, MOVE_FUTURE_SIGHT, MOVE_NIGHT_SHADE, MOVE_PURSUIT
	.byte 25, 35, 230, 150, 160, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 178 @ SPECIES_ID
	.string "UTAN$", 11 @ POKE_NICKNAME
	.string "밀레이$", 8 @ TRAINER_NAME
	.byte 47 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80040fff @ FLAGS
	.2byte 115 @ RANK
	.2byte MOVE_NIGHT_SHADE, MOVE_FUTURE_SIGHT, MOVE_CONFUSE_RAY, MOVE_PSYCHIC
	.byte 35, 35, 150, 130, 170, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 331 @ SPECIES_ID
	.string "PEDOS$", 11 @ POKE_NICKNAME
	.string "카다몬$", 8 @ TRAINER_NAME
	.byte 38 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80020fff @ FLAGS
	.2byte 87 @ RANK
	.2byte MOVE_AGILITY, MOVE_SWAGGER, MOVE_TAUNT, MOVE_TAKE_DOWN
	.byte 140, 70, 140, 75, 100, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 325 @ SPECIES_ID
	.string "LUVIS$", 11 @ POKE_NICKNAME
	.string "JANELLE$", 8 @ TRAINER_NAME
	.byte 10 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80010fff @ FLAGS
	.2byte 83 @ RANK
	.2byte MOVE_SWEET_KISS, MOVE_ATTRACT, MOVE_TAKE_DOWN, MOVE_CHARM
	.byte 50, 100, 220, 40, 190, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 214 @ SPECIES_ID
	.string "HEROSS$", 11 @ POKE_NICKNAME
	.string "가람$", 8 @ TRAINER_NAME
	.byte 33 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80008fff @ FLAGS
	.2byte 71 @ RANK
	.2byte MOVE_STRENGTH, MOVE_ENDURE, MOVE_REVERSAL, MOVE_ROCK_TOMB
	.byte 170, 70, 110, 240, 140, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 101 @ SPECIES_ID
	.string "RODLECT$", 11 @ POKE_NICKNAME
	.string "주하$", 8 @ TRAINER_NAME
	.byte 6 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80004fff @ FLAGS
	.2byte 15 @ RANK
	.2byte MOVE_EXPLOSION, MOVE_LIGHT_SCREEN, MOVE_SWIFT, MOVE_FLASH
	.byte 200, 200, 30, 35, 50, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 172 @ SPECIES_ID
	.string "CHUPY$", 11 @ POKE_NICKNAME
	.string "진택$", 8 @ TRAINER_NAME
	.byte 35 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80002fff @ FLAGS
	.2byte 59 @ RANK
	.2byte MOVE_SWEET_KISS, MOVE_ATTRACT, MOVE_REST, MOVE_TAIL_WHIP
	.byte 25, 150, 180, 115, 120, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

	.2byte 202 @ SPECIES_ID
	.string "WOBET$", 11 @ POKE_NICKNAME
	.string "HELEN$", 8 @ TRAINER_NAME
	.byte 16 @ TRAINER_SPRITE
	.2byte 0x0000 @padding
	.4byte 0x80001fff @ FLAGS
	.2byte 111 @ RANK
	.2byte MOVE_COUNTER, MOVE_MIRROR_COAT, MOVE_SAFEGUARD, MOVE_DESTINY_BOND
	.byte 60, 230, 50, 220, 210, 255 @ STAT_COOL, STAT_BEAUTY, STAT_CUTE, STAT_SMART, STAT_TOUGH, STAT_SHEEN
	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0000ffff @ RESERVED

@ credit to Valkyrie for helping me properly dump these structs
