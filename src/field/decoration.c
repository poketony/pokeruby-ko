#include "global.h"
#include "main.h"
#include "map_object_constants.h"
#include "overworld.h"
#include "sound.h"
#include "songs.h"
#include "string_util.h"
#include "menu.h"
#include "menu_helpers.h"
#include "strings.h"
#include "script.h"
#include "palette.h"
#include "field_player_avatar.h"
#include "field_camera.h"
#include "field_fadetransition.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "event_data.h"
#include "field_weather.h"
#include "decoration.h"
#include "ewram.h"

EWRAM_DATA u8 *gUnknown_020388D0 = NULL;
EWRAM_DATA u8 gUnknown_020388D4 = 0;
EWRAM_DATA u8 gUnknown_020388D5 = 0;
EWRAM_DATA u8 gUnknown_020388D6[16] = {0};
EWRAM_DATA u8 gUnknown_020388E6[12] = {0};
EWRAM_DATA u8 gUnknown_020388F2 = 0;
EWRAM_DATA u8 gUnknown_020388F3 = 0;
EWRAM_DATA u8 gUnknown_020388F4 = 0;
EWRAM_DATA u8 gUnknown_020388F5 = 0;
EWRAM_DATA u8 gUnknown_020388F6 = 0;
EWRAM_DATA u8 gUnknown_020388F7[8] = {0};
EWRAM_DATA struct UnkStruct_02038900 gUnknown_02038900 = {0};
EWRAM_DATA u16 gUnknown_020391A4 = 0;
EWRAM_DATA u16 gUnknown_020391A6 = 0;
EWRAM_DATA u8 gUnknown_020391A8 = 0;
EWRAM_DATA u8 gUnknown_020391A9 = 0;
EWRAM_DATA u8 gUnknown_020391AA = 0;
EWRAM_DATA struct OamData gUnknown_020391AC = {0};
EWRAM_DATA struct UnkStruct_020391B4 gUnknown_020391B4[16] = {0};
EWRAM_DATA u8 gUnknown_02039234 = 0;

#include "../data/decoration_descriptions.h"

const u16 DecorGfx_SMALL_DESK[] = {
    0x87
};

const u16 DecorGfx_POKEMON_DESK[] = {
    0x8F
};

const u16 DecorGfx_HEAVY_DESK[] = {
    0x90,
    0x91,
    0x92,
    0x98,
    0x99,
    0x9A
};

const u16 DecorGfx_RAGGED_DESK[] = {
    0x93,
    0x94,
    0x95,
    0x9B,
    0x9C,
    0x9D
};

const u16 DecorGfx_COMFORT_DESK[] = {
    0x96,
    0x97,
    0xA3,
    0x9E,
    0x9F,
    0xAB
};

const u16 DecorGfx_PRETTY_DESK[] = {
    0xBD,
    0xBE,
    0xBF,
    0xC5,
    0xC6,
    0xC7,
    0xCD,
    0xCE,
    0xCF
};

const u16 DecorGfx_BRICK_DESK[] = {
    0xA0,
    0xA1,
    0xA2,
    0xA8,
    0xA9,
    0xAA,
    0xB0,
    0xB1,
    0xB2
};

const u16 DecorGfx_CAMP_DESK[] = {
    0xA4,
    0xA5,
    0xA6,
    0xAC,
    0xAD,
    0xAE,
    0xB4,
    0xB5,
    0xB6
};

const u16 DecorGfx_HARD_DESK[] = {
    0xA7,
    0xBB,
    0xBC,
    0xAF,
    0xC3,
    0xC4,
    0xB7,
    0xCB,
    0xCC
};

const u16 DecorGfx_SMALL_CHAIR[] = {
    0xB8
};

const u16 DecorGfx_POKEMON_CHAIR[] = {
    0xB9
};

const u16 DecorGfx_HEAVY_CHAIR[] = {
    0xBA
};

const u16 DecorGfx_PRETTY_CHAIR[] = {
    0xC0
};

const u16 DecorGfx_COMFORT_CHAIR[] = {
    0xC1
};

const u16 DecorGfx_RAGGED_CHAIR[] = {
    0xC2
};

const u16 DecorGfx_BRICK_CHAIR[] = {
    0xC8
};

const u16 DecorGfx_CAMP_CHAIR[] = {
    0xC9
};

const u16 DecorGfx_HARD_CHAIR[] = {
    0xCA
};

const u16 DecorGfx_RED_PLANT[] = {
    0xD0,
    0xD8
};

const u16 DecorGfx_TROPICAL_PLANT[] = {
    0xD2,
    0xDA
};

const u16 DecorGfx_PRETTY_FLOWERS[] = {
    0xD4,
    0xDC
};

const u16 DecorGfx_COLORFUL_PLANT[] = {
    0xE0,
    0xE2,
    0xE8,
    0xE9
};

const u16 DecorGfx_BIG_PLANT[] = {
    0xE4,
    0xE6,
    0xEC,
    0xED
};

const u16 DecorGfx_GORGEOUS_PLANT[] = {
    0xF0,
    0xF2,
    0xF8,
    0xF9
};

const u16 DecorGfx_RED_BRICK[] = {
    0x25,
    0x2D
};

const u16 DecorGfx_YELLOW_BRICK[] = {
    0x26,
    0x2E
};

const u16 DecorGfx_BLUE_BRICK[] = {
    0x27,
    0x2F
};

const u16 DecorGfx_RED_BALLOON[] = {
    0x138
};

const u16 DecorGfx_BLUE_BALLOON[] = {
    0x13C
};

const u16 DecorGfx_YELLOW_BALLOON[] = {
    0x140
};

const u16 DecorGfx_RED_TENT[] = {
    0x30,
    0x31,
    0x32,
    0x38,
    0x39,
    0x3A,
    0x40,
    0x41,
    0x3B
};

const u16 DecorGfx_BLUE_TENT[] = {
    0x48,
    0x49,
    0x68,
    0x50,
    0x51,
    0x70,
    0x58,
    0x59,
    0x69
};

const u16 DecorGfx_SOLID_BOARD[] = {
    0x34,
    0x3C
};

const u16 DecorGfx_SLIDE[] = {
    0x35,
    0x36,
    0x3D,
    0x3E,
    0x63,
    0x64,
    0x6F,
    0x77
};

const u16 DecorGfx_FENCE_LENGTH[] = {
    0x33
};

const u16 DecorGfx_FENCE_WIDTH[] = {
    0x2C
};

const u16 DecorGfx_TIRE[] = {
    0x80,
    0x81,
    0x88,
    0x89
};

const u16 DecorGfx_STAND[] = {
    0x6A,
    0x6B,
    0x6C,
    0x6D,
    0x72,
    0x73,
    0x74,
    0x75
};

const u16 DecorGfx_MUD_BALL[] = {
    0x28
};

const u16 DecorGfx_BREAKABLE_DOOR[] = {
    0x37,
    0x3F
};

const u16 DecorGfx_SAND_ORNAMENT[] = {
    0x85,
    0x8D
};

const u16 DecorGfx_SILVER_SHIELD[] = {
    0xD6,
    0xDE
};

const u16 DecorGfx_GOLD_SHIELD[] = {
    0x12E,
    0x136
};

const u16 DecorGfx_GLASS_ORNAMENT[] = {
    0x82,
    0x8A
};

const u16 DecorGfx_TV[] = {
    0xF4
};

const u16 DecorGfx_ROUND_TV[] = {
    0xF5
};

const u16 DecorGfx_CUTE_TV[] = {
    0xF6
};

const u16 DecorGfx_GLITTER_MAT[] = {
    0x60
};

const u16 DecorGfx_JUMP_MAT[] = {
    0x61
};

const u16 DecorGfx_SPIN_MAT[] = {
    0x62
};

const u16 DecorGfx_C_LOW_NOTE_MAT[] = {
    0x78
};

const u16 DecorGfx_D_NOTE_MAT[] = {
    0x79
};

const u16 DecorGfx_E_NOTE_MAT[] = {
    0x7A
};

const u16 DecorGfx_F_NOTE_MAT[] = {
    0x7B
};

const u16 DecorGfx_G_NOTE_MAT[] = {
    0x7C
};

const u16 DecorGfx_A_NOTE_MAT[] = {
    0x7D
};

const u16 DecorGfx_B_NOTE_MAT[] = {
    0x7E
};

const u16 DecorGfx_C_HIGH_NOTE_MAT[] = {
    0xB3
};

const u16 DecorGfx_SURF_MAT[] = {
    0x42,
    0x43,
    0x44,
    0x4A,
    0x4B,
    0x4C,
    0x52,
    0x53,
    0x54
};

const u16 DecorGfx_THUNDER_MAT[] = {
    0x45,
    0x46,
    0x47,
    0x4D,
    0x4E,
    0x4F,
    0x55,
    0x56,
    0x57
};

const u16 DecorGfx_FIRE_BLAST_MAT[] = {
    0x5A,
    0x5B,
    0x5C,
    0x5D,
    0x5E,
    0x5F,
    0x65,
    0x66,
    0x67
};

const u16 DecorGfx_POWDER_SNOW_MAT[] = {
    0x100,
    0x101,
    0x102,
    0x108,
    0x109,
    0x10A,
    0x110,
    0x111,
    0x112
};

const u16 DecorGfx_ATTRACT_MAT[] = {
    0x103,
    0x104,
    0x105,
    0x10B,
    0x10C,
    0x10D,
    0x113,
    0x114,
    0x115
};

const u16 DecorGfx_FISSURE_MAT[] = {
    0x106,
    0x107,
    0x118,
    0x10E,
    0x10F,
    0x120,
    0x116,
    0x117,
    0x128
};

const u16 DecorGfx_SPIKES_MAT[] = {
    0x119,
    0x11A,
    0x11B,
    0x121,
    0x122,
    0x123,
    0x129,
    0x12A,
    0x12B
};

const u16 DecorGfx_BALL_POSTER[] = {
    0x130
};

const u16 DecorGfx_GREEN_POSTER[] = {
    0x131
};

const u16 DecorGfx_RED_POSTER[] = {
    0x132
};

const u16 DecorGfx_BLUE_POSTER[] = {
    0x133
};

const u16 DecorGfx_CUTE_POSTER[] = {
    0x134
};

const u16 DecorGfx_PIKA_POSTER[] = {
    0x11C,
    0x11D
};

const u16 DecorGfx_LONG_POSTER[] = {
    0x11E,
    0x11F
};

const u16 DecorGfx_SEA_POSTER[] = {
    0x124,
    0x125
};

const u16 DecorGfx_SKY_POSTER[] = {
    0x126,
    0x127
};

const u16 DecorGfx_KISS_POSTER[] = {
    0x12C,
    0x12D
};

const u16 DecorGfx_PICHU_DOLL[] = {
    MAP_OBJ_GFX_PICHU_DOLL
};

const u16 DecorGfx_PIKACHU_DOLL[] = {
    MAP_OBJ_GFX_PIKACHU_DOLL
};

const u16 DecorGfx_MARILL_DOLL[] = {
    MAP_OBJ_GFX_MARILL_DOLL
};

const u16 DecorGfx_TOGEPI_DOLL[] = {
    MAP_OBJ_GFX_TOGEPI_DOLL
};

const u16 DecorGfx_CYNDAQUIL_DOLL[] = {
    MAP_OBJ_GFX_CYNDAQUIL_DOLL
};

const u16 DecorGfx_CHIKORITA_DOLL[] = {
    MAP_OBJ_GFX_CHIKORITA_DOLL
};

const u16 DecorGfx_TOTODILE_DOLL[] = {
    MAP_OBJ_GFX_TOTODILE_DOLL
};

const u16 DecorGfx_JIGGLYPUFF_DOLL[] = {
    MAP_OBJ_GFX_JIGGLYPUFF_DOLL
};

const u16 DecorGfx_MEOWTH_DOLL[] = {
    MAP_OBJ_GFX_MEOWTH_DOLL
};

const u16 DecorGfx_CLEFAIRY_DOLL[] = {
    MAP_OBJ_GFX_CLEFAIRY_DOLL
};

const u16 DecorGfx_DITTO_DOLL[] = {
    MAP_OBJ_GFX_DITTO_DOLL
};

const u16 DecorGfx_SMOOCHUM_DOLL[] = {
    MAP_OBJ_GFX_SMOOCHUM_DOLL
};

const u16 DecorGfx_TREECKO_DOLL[] = {
    MAP_OBJ_GFX_TREECKO_DOLL
};

const u16 DecorGfx_TORCHIC_DOLL[] = {
    MAP_OBJ_GFX_TORCHIC_DOLL
};

const u16 DecorGfx_MUDKIP_DOLL[] = {
    MAP_OBJ_GFX_MUDKIP_DOLL
};

const u16 DecorGfx_DUSKULL_DOLL[] = {
    MAP_OBJ_GFX_DUSKULL_DOLL
};

const u16 DecorGfx_WYNAUT_DOLL[] = {
    MAP_OBJ_GFX_WYNAUT_DOLL
};

const u16 DecorGfx_BALTOY_DOLL[] = {
    MAP_OBJ_GFX_BALTOY_DOLL
};

const u16 DecorGfx_KECLEON_DOLL[] = {
    MAP_OBJ_GFX_KECLEON_DOLL
};

const u16 DecorGfx_AZURILL_DOLL[] = {
    MAP_OBJ_GFX_AZURILL_DOLL
};

const u16 DecorGfx_SKITTY_DOLL[] = {
    MAP_OBJ_GFX_SKITTY_DOLL
};

const u16 DecorGfx_SWABLU_DOLL[] = {
    MAP_OBJ_GFX_SWABLU_DOLL
};

const u16 DecorGfx_GULPIN_DOLL[] = {
    MAP_OBJ_GFX_GULPIN_DOLL
};

const u16 DecorGfx_LOTAD_DOLL[] = {
    MAP_OBJ_GFX_LOTAD_DOLL
};

const u16 DecorGfx_SEEDOT_DOLL[] = {
    MAP_OBJ_GFX_SEEDOT_DOLL
};

const u16 DecorGfx_PIKA_CUSHION[] = {
    MAP_OBJ_GFX_PIKA_CUSHION
};

const u16 DecorGfx_ROUND_CUSHION[] = {
    MAP_OBJ_GFX_ROUND_CUSHION
};

const u16 DecorGfx_KISS_CUSHION[] = {
    MAP_OBJ_GFX_KISS_CUSHION
};

const u16 DecorGfx_ZIGZAG_CUSHION[] = {
    MAP_OBJ_GFX_ZIGZAG_CUSHION
};

const u16 DecorGfx_SPIN_CUSHION[] = {
    MAP_OBJ_GFX_SPIN_CUSHION
};

const u16 DecorGfx_DIAMOND_CUSHION[] = {
    MAP_OBJ_GFX_DIAMOND_CUSHION
};

const u16 DecorGfx_BALL_CUSHION[] = {
    MAP_OBJ_GFX_BALL_CUSHION
};

const u16 DecorGfx_GRASS_CUSHION[] = {
    MAP_OBJ_GFX_GRASS_CUSHION
};

const u16 DecorGfx_FIRE_CUSHION[] = {
    MAP_OBJ_GFX_FIRE_CUSHION
};

const u16 DecorGfx_WATER_CUSHION[] = {
    MAP_OBJ_GFX_WATER_CUSHION
};

const u16 DecorGfx_SNORLAX_DOLL[] = {
    MAP_OBJ_GFX_BIG_SNORLAX_DOLL
};

const u16 DecorGfx_RHYDON_DOLL[] = {
    MAP_OBJ_GFX_BIG_RHYDON_DOLL
};

const u16 DecorGfx_LAPRAS_DOLL[] = {
    MAP_OBJ_GFX_BIG_LAPRAS_DOLL
};

const u16 DecorGfx_VENUSAUR_DOLL[] = {
    MAP_OBJ_GFX_BIG_VENUSAUR_DOLL
};

const u16 DecorGfx_CHARIZARD_DOLL[] = {
    MAP_OBJ_GFX_BIG_CHARIZARD_DOLL
};

const u16 DecorGfx_BLASTOISE_DOLL[] = {
    MAP_OBJ_GFX_BIG_BLASTOISE_DOLL
};

const u16 DecorGfx_WAILMER_DOLL[] = {
    MAP_OBJ_GFX_BIG_WAILMER_DOLL
};

const u16 DecorGfx_REGIROCK_DOLL[] = {
    MAP_OBJ_GFX_BIG_REGIROCK_DOLL
};

const u16 DecorGfx_REGICE_DOLL[] = {
    MAP_OBJ_GFX_BIG_REGICE_DOLL
};

const u16 DecorGfx_REGISTEEL_DOLL[] = {
    MAP_OBJ_GFX_BIG_REGISTEEL_DOLL
};

#include "../data/decoration_names.h"

const u8 *const gUnknown_083EC5E4[] = {
    SecretBaseText_Desk,
    SecretBaseText_Chair,
    SecretBaseText_Plant,
    SecretBaseText_Ornament,
    SecretBaseText_Mat,
    SecretBaseText_Poster,
    SecretBaseText_Doll,
    SecretBaseText_Cushion
};

const struct MenuAction2 gUnknown_083EC604[] = {
    {SecretBaseText_Decorate, sub_80FF160},
    {SecretBaseText_PutAway, sub_8100A0C},
    {SecretBaseText_Toss, sub_8101700},
    {gUnknownText_Exit, gpu_pal_decompress_alloc_tag_and_upload}
};

const u8 *const gUnknown_083EC624[] = {
    SecretBaseText_PutOutDecor,
    SecretBaseText_StoreChosenDecor,
    SecretBaseText_ThrowAwayDecor,
    gMenuText_GoBackToPrev
};

const struct YesNoFuncTable gUnknown_083EC634[] = {
    {sub_80FF5BC, sub_80FF058},
    {sub_81017A0, sub_80FF058},
    {sub_81017A0, sub_80FF058},
    {sub_8109D04, sub_80FF058}
};

const u16 gUnknown_083EC654[] = {0x6318, 0x739C, 0x7FFF};
const u8 gUnknown_083EC65A[] = _("{PALETTE 13}{STR_VAR_1}");

const u8 Unknown_3EC660[] = {0, 1, 2, 3};
const u8 Unknown_3EC664[] = {0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13};
const u8 Unknown_3EC670[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
const u8 Unknown_3EC680[] = {0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21};
const u8 Unknown_3EC68C[] = {0, 1, 2, 3, 4, 5, 6, 7};
const u8 Unknown_3EC694[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31};
const u8 Unknown_3EC6B4[] = {0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 20, 21, 24, 25, 26, 27, 28, 29, 32, 33, 34, 35, 36, 37, 40, 41, 42, 43, 44, 45};
const u8 Unknown_3EC6D8[] = {0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 20, 21, 24, 25, 26, 27, 28, 29};

const u8 Unknown_3EC6F0[] = {0, 0, 0, 0};
const u8 Unknown_3EC6F4[] = {0, 0, 1, 1, 0, 0, 1, 1};
const u8 Unknown_3EC6FC[] = {0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2};
const u8 Unknown_3EC708[] = {0, 0, 1, 1, 2, 2, 3, 3, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 4, 4, 5, 5, 6, 6, 7, 7};
const u8 Unknown_3EC728[] = {0, 0, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 2, 2, 3, 3};
const u8 Unknown_3EC738[] = {0, 0, 0, 0, 1, 1, 1, 1};
const u8 Unknown_3EC740[] = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2};
const u8 Unknown_3EC74C[] = {0, 0, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 4, 4, 5, 5, 4, 4, 5, 5, 6, 6, 7, 7, 6, 6, 7, 7};
const u8 Unknown_3EC76C[] = {0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 6, 6, 7, 7, 8, 8};
const u8 Unknown_3EC790[] = {0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 3, 3, 4, 4, 5, 5};

const u8 Unknown_3EC7A8[] = {4, 5, 6, 7};
const u8 Unknown_3EC7AC[] = {4, 5, 4, 5, 6, 7, 6, 7};
const u8 Unknown_3EC7B4[] = {4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7};
const u8 Unknown_3EC7C0[] = {4, 5, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 6, 7};
const u8 Unknown_3EC7E0[] = {4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7};
const u8 Unknown_3EC7F0[] = {4, 5, 6, 7, 4, 5, 6, 7};
const u8 Unknown_3EC7F8[] = {4, 5, 6, 7, 4, 5, 6, 7, 4, 5, 6, 7};
const u8 Unknown_3EC804[] = {4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7};
const u8 Unknown_3EC824[] = {4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7};
const u8 Unknown_3EC848[] = {4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7};

const struct UnkStruct_803EC860 gUnknown_083EC860[] = {
    {Unknown_3EC660, Unknown_3EC6F0, Unknown_3EC7A8, 0x4},
    {Unknown_3EC68C, Unknown_3EC6F4, Unknown_3EC7AC, 0x8},
    {Unknown_3EC664, Unknown_3EC6FC, Unknown_3EC7B4, 0xc},
    {Unknown_3EC694, Unknown_3EC708, Unknown_3EC7C0, 0x20},
    {Unknown_3EC670, Unknown_3EC728, Unknown_3EC7E0, 0x10},
    {Unknown_3EC68C, Unknown_3EC738, Unknown_3EC7F0, 0x8},
    {Unknown_3EC680, Unknown_3EC740, Unknown_3EC7F8, 0xc},
    {Unknown_3EC694, Unknown_3EC74C, Unknown_3EC804, 0x20},
    {Unknown_3EC6B4, Unknown_3EC76C, Unknown_3EC824, 0x24},
    {Unknown_3EC6D8, Unknown_3EC790, Unknown_3EC848, 0x18}
};

const struct UnkStruct_083EC900 gUnknown_083EC900[] = {
    {0, 1, 0x78, 0x4e},
    {1, 2, 0x80, 0x4e},
    {1, 3, 0x90, 0x56},
    {1, 3, 0x90, 0x46},
    {0, 2, 0x80, 0x46},
    {2, 2, 0x78, 0x46},
    {2, 3, 0x80, 0x56},
    {2, 3, 0x80, 0x36},
    {0, 3, 0x90, 0x46},
    {1, 3, 0x90, 0x46}
};

const union AnimCmd gSpriteAnim_83EC928[] = {
    ANIMCMD_FRAME(.imageValue = 0, .duration = 0),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83EC930[] = {
    gSpriteAnim_83EC928
};

const struct SpriteFrameImage gSpriteImageTable_83EC934[] = {
    {.data = gUnknown_02038900.image, .size = sizeof(gUnknown_02038900.image)}
};

const struct SpriteTemplate gSpriteTemplate_83EC93C = {
    .tileTag = 0xffff,
    .paletteTag = 3000,
    .oam = &gUnknown_020391AC,
    .anims = gSpriteAnimTable_83EC930,
    .images = gSpriteImageTable_83EC934,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_81009A8
};

const struct SpritePalette gUnknown_083EC954 = {.data = (u16 *)&gUnknown_02038900.palette, .tag = 3000};

const struct YesNoFuncTable gUnknown_083EC95C = {.yesFunc = sub_81000C4, .noFunc = sub_810065C};
const struct YesNoFuncTable gUnknown_083EC964 = {.yesFunc = sub_810026C, .noFunc = sub_810065C};
const struct YesNoFuncTable gUnknown_083EC96C[] = {
    {.yesFunc = sub_80FFAB0, .noFunc = sub_80FFB08},
    {.yesFunc = sub_8100F88, .noFunc = sub_8100FB4}
};

const u8 gUnknown_083EC97C[] = {4, 4, 4, 4, 0, 3, 3, 0};
const u8 gUnknown_083EC984[] = {4, 4, 4, 4, 0, 4, 3, 0};

const u16 gUnknown_083EC98C[] = INCBIN_U16("graphics/unknown/83EC98C.gbapal");
const u16 Unknown_3EC9AC[] = INCBIN_U16("graphics/unknown/83EC9AC.gbapal");
const struct YesNoFuncTable gUnknown_083EC9CC = {.yesFunc = sub_810153C, .noFunc = sub_8100EEC};
const struct YesNoFuncTable gUnknown_083EC9D4 = {.yesFunc = sub_8101590, .noFunc = sub_8100EEC};
const u32 gSpriteImage_83EC9DC[] = INCBIN_U32("graphics/unknown_sprites/83EC9DC.4bpp");
const struct SpritePalette gUnknown_083ECA5C = {.data = gUnknown_083EC98C, .tag = 8};
const struct SpritePalette gUnknown_083ECA64 = {.data = Unknown_3EC9AC, .tag = 8};
const struct OamData gOamData_83ECA6C = {
    .size = 1, .priority = 1
};

const union AnimCmd gSpriteAnim_83ECA74[] = {
    ANIMCMD_FRAME(.imageValue = 0, .duration = 0),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83ECA7C[] = {
    gSpriteAnim_83ECA74
};

const struct SpriteFrameImage gSpriteImageTable_83ECA80[] = {
    obj_frame_tiles(gSpriteImage_83EC9DC)
};

const struct SpriteTemplate gSpriteTemplate_83ECA88 = {
    .tileTag = 0xffff,
    .paletteTag = 8,
    .oam = &gOamData_83ECA6C,
    .anims = gSpriteAnimTable_83ECA7C,
    .images = gSpriteImageTable_83ECA80,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8101698
};

const struct YesNoFuncTable gUnknown_083ECAA0 = {.yesFunc = sub_8101848, .noFunc = sub_80FED3C};

u8 *const unref_label_083ECAA8[] = {gSharedMem};

// text

extern u8 gUnknown_0815F399[];

void sub_80FE1DC(void)
{
    sub_80FE2B4();
    MenuDrawTextWindow(0, 0, 12, 9);
    PrintMenuItems(1, 1, 4, (const struct MenuAction *)gUnknown_083EC604);
    InitMenu(0, 1, 1, 4, gUnknown_020388D4, 9);
}

void sub_80FE220(void)
{
    gUnknown_020388D4 = 0;
    ScriptContext2_Enable();
    sub_80FE1DC();
    sub_80FE394();
}

void DecorationPC(u8 taskId)
{
    sub_80FE220();
    gTasks[taskId].func = Task_DecorationPCProcessMenuInput;
}

void Task_SecretBasePC_Decoration(u8 taskId)
{
    DecorationPC(taskId);
    ewram_1f000.items = gSaveBlock1.secretBases[0].decorations;
    ewram_1f000.pos = gSaveBlock1.secretBases[0].decorationPos;
    ewram_1f000.size = sizeof gSaveBlock1.secretBases[0].decorations;
    ewram_1f000.isPlayerRoom = 0;
}

void DoPlayerPCDecoration(u8 taskId)
{
    DecorationPC(taskId);
    ewram_1f000.items = gSaveBlock1.playerRoomDecor;
    ewram_1f000.pos = gSaveBlock1.playerRoomDecorPos;
    ewram_1f000.size = sizeof gSaveBlock1.playerRoomDecor;
    ewram_1f000.isPlayerRoom = 1;
}

void sub_80FE2B4(void)
{
    u16 palettes[3];
    memcpy(palettes, gUnknown_083EC654, sizeof gUnknown_083EC654);
    LoadPalette(&palettes[2], 0xdf, 2);
    LoadPalette(&palettes[1], 0xd1, 2);
    LoadPalette(&palettes[0], 0xd8, 2);
}

void Task_DecorationPCProcessMenuInput(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gMain.newKeys & DPAD_UP)
        {
            PlaySE(SE_SELECT);
            gUnknown_020388D4 = MoveMenuCursor(-1);
            sub_80FE394();
        }
        if (gMain.newKeys & DPAD_DOWN)
        {
            PlaySE(SE_SELECT);
            gUnknown_020388D4 = MoveMenuCursor(1);
            sub_80FE394();
        }
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            gUnknown_083EC604[gUnknown_020388D4].func(taskId);
        } else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            gpu_pal_decompress_alloc_tag_and_upload(taskId);
        }
    }
}

void sub_80FE394(void)
{
    MenuFillWindowRectWithBlankTile(4, 15, 25, 18);
    MenuPrint(gUnknown_083EC624[gUnknown_020388D4], 4, 15);
}

void gpu_pal_decompress_alloc_tag_and_upload(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 12, 9);
    MenuFillWindowRectWithBlankTile(4, 15, 25, 18);
    FreeSpritePaletteByTag(6);
    if (ewram_1f000.isPlayerRoom == 0)
    {
        ScriptContext1_SetupScript(gUnknown_0815F399);
        DestroyTask(taskId);
    } else
    {
        ReshowPlayerPC(taskId);
    }
}

void sub_80FE418(u8 taskId)
{
    sub_80FE5AC(taskId);
}

void sub_80FE428(u8 taskId)
{
    InitMenu(0, 1, 1, 4, gUnknown_020388D4, 9);
    sub_80FE394();
    gTasks[taskId].func = Task_DecorationPCProcessMenuInput;
}

void sub_80FE470(u8 decoCat, u8 left, u8 top, u8 palIdx) // PrintDecorationCategorySelectionMenuString
{
    u8 *strptr;
    u8 v0;
    v0 = sub_8072CBC();
    // PALETTE {palIdx}
    strptr = gStringVar4;
    strptr[0] = EXT_CTRL_CODE_BEGIN;
    strptr[1] = 5;
    strptr[2] = palIdx;
    strptr += 3;
    strptr = StringCopy(strptr, gUnknown_083EC5E4[decoCat]);
    strptr = sub_8072C14(strptr, sub_8134194(decoCat), 0x4E, 1);
    *strptr++ = 0xba;
    strptr = sub_8072C14(strptr, gDecorationInventories[decoCat].size, 0x60, 1);
    strptr[0] = EXT_CTRL_CODE_BEGIN;
    strptr[1] = 5;
    strptr[2] = v0;
    strptr[3] = EOS;
    MenuPrint(gStringVar4, left, top);
}

void sub_80FE528(u8 taskId) // PrintDecorationCategorySelectionMenuStrings
{
    u8 decoCat;
    MenuDrawTextWindow(0, 0, 14, 19);
    for (decoCat=0; decoCat<8; decoCat++)
    {
        if (ewram_1f000.isPlayerRoom == 1 && gTasks[taskId].data[11] == 0 && decoCat != DECORCAT_DOLL && decoCat != DECORCAT_CUSHION)
        {
            sub_80FE470(decoCat, 2, 2 * decoCat + 1, 13); // Selectable
        } else
        {
            sub_80FE470(decoCat, 2, 2 * decoCat + 1, 255); // Unselectable
        }
    }
    MenuPrint(gUnknownText_Exit, 2, 17);
}

void sub_80FE5AC(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 29, 19);
    sub_80FE528(taskId);
    InitMenu(0, 1, 1, 9, gUnknown_020388F6, 13);
    gTasks[taskId].func = sub_80FE604;
}

void sub_80FE604(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gMain.newAndRepeatedKeys & DPAD_UP)
        {
            PlaySE(SE_SELECT);
            MoveMenuCursor(-1);
        } else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            PlaySE(SE_SELECT);
            MoveMenuCursor(1);
        } else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            gUnknown_020388F6 = GetMenuCursorPos();
            if (gUnknown_020388F6 != 8)
            {
                gUnknown_020388D5 = sub_8134194(gUnknown_020388F6);
                if (gUnknown_020388D5)
                {
                    sub_8134104(gUnknown_020388F6);
                    gUnknown_020388D0 = gDecorationInventories[gUnknown_020388F6].items;
                    sub_80FEF50(taskId);
                    sub_80F944C();
                    sub_80F9480(gUnknown_020388F7, 8);
                    LoadScrollIndicatorPalette();
                    gTasks[taskId].func = sub_80FE868;
                } else
                {
                    HandleDestroyMenuCursors();
                    MenuZeroFillWindowRect(0, 0, 14, 19);
                    DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecors, sub_80FE418, 0);
                }
            } else
            {
                sub_80FE728(taskId);
            }
        } else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            sub_80FE728(taskId);
        }
    }
}

void sub_80FE728(u8 taskId)
{
    if (gTasks[taskId].data[11] != 3)
    {
        sub_80FE758(taskId);
    } else
    {
        sub_8109DAC(taskId);
    }
}

void sub_80FE758(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 14, 19);
    if (gTasks[taskId].data[11] != 2)
    {
        sub_80FE1DC();
        MenuDisplayMessageBox();
        sub_80FE394();
        gTasks[taskId].func = Task_DecorationPCProcessMenuInput;
    } else
    {
        sub_80B3068(taskId);
    }
}

void sub_80FE7A8(u8 taskId)
{
    gTasks[taskId].data[11] = 3;
    gUnknown_020388F6 = 0;
    sub_80FE5AC(taskId);
}

void sub_80FE7D4(u8 *dest, u8 decClass)
{
    StringCopy(dest, gUnknown_083EC5E4[decClass]);
}

void sub_80FE7EC(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 29, 19);

    sub_80FEC94(taskId);
    sub_80FECB8(gUnknown_020388F6);

    MenuDrawTextWindow(15, 12, 29, 19);

    sub_80FECE0(gUnknown_020388F2 + gUnknown_020388F4);
    InitMenu(0, 1, 2, gUnknown_020388F3 + 1, gUnknown_020388F2, 13);
}

void sub_80FE868(u8 taskId)
{
    sub_80FE7EC(taskId);
    gTasks[taskId].func = sub_80FE948;
}

void sub_80FE894(u8 taskId /*r8*/, s8 cursorVector /*r5*/, s8 bgVector /*r7*/)
{
    int v0 /*r10*/;
    u8 v1;
    v0 = gUnknown_020388F2 + gUnknown_020388F4 == gUnknown_020388D5;
    PlaySE(SE_SELECT);
    if (cursorVector != 0)
    {
        gUnknown_020388F2 = MoveMenuCursor(cursorVector);
    }
    if (bgVector != 0)
    {
        v1 = gUnknown_020388F4;
        gUnknown_020388F4 = v1 + bgVector;
        sub_80FEABC(taskId, 1);
    }
    if (gUnknown_020388F2 + gUnknown_020388F4 != gUnknown_020388D5)
    {
        if (v0)
        {
            MenuDrawTextWindow(15, 12, 29, 19);
        }
        sub_80FECE0(gUnknown_020388F2 + gUnknown_020388F4);
    } else
    {
        MenuZeroFillWindowRect(15, 12, 29, 19);
    }
}

void sub_80FE948(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if ((gMain.newAndRepeatedKeys & DPAD_ANY) == DPAD_UP)
        {
            if (gUnknown_020388F2 != 0)
            {
                sub_80FE894(taskId, -1, 0);
            } else if (gUnknown_020388F4 != 0)
            {
                sub_80FE894(taskId, 0, -1);
            }
        }
        if ((gMain.newAndRepeatedKeys & DPAD_ANY) == DPAD_DOWN)
        {
            if (gUnknown_020388F2 != gUnknown_020388F3)
            {
                sub_80FE894(taskId, 1, 0);
            } else if (gUnknown_020388F4 + gUnknown_020388F2 != gUnknown_020388D5)
            {
                sub_80FE894(taskId, 0, 1);
            }
        }
        if (gMain.newKeys & A_BUTTON)
        {
            HandleDestroyMenuCursors();
            PlaySE(SE_SELECT);
            gUnknown_020388F5 = gUnknown_020388F2 + gUnknown_020388F4;
            if (gUnknown_020388F5 == gUnknown_020388D5)
            {
                gUnknown_083EC634[gTasks[taskId].data[11]].noFunc(taskId);
            } else
            {
                gUnknown_083EC634[gTasks[taskId].data[11]].yesFunc(taskId);
            }
        } else if (gMain.newKeys & B_BUTTON)
        {
            HandleDestroyMenuCursors();
            PlaySE(SE_SELECT);
            gUnknown_083EC634[gTasks[taskId].data[11]].noFunc(taskId);
        }
    }
}

void sub_80FEABC(u8 taskId, u8 dummy1)
{
    u16 i;
    u16 j;
    u8 ni;
    if (gUnknown_020388F4 != 0 || (DestroyVerticalScrollIndicator(0), gUnknown_020388F4 != 0))
    {
        CreateVerticalScrollIndicators(0, 0x3c, 0x08);
    }
    if (gUnknown_020388F4 + 7 == gUnknown_020388D5)
    {
        DestroyVerticalScrollIndicator(1);
    }
    if (gUnknown_020388F4 + 7 < gUnknown_020388D5)
    {
        CreateVerticalScrollIndicators(1, 0x3c, 0x98);
    }
    for (i=gUnknown_020388F4; i<gUnknown_020388F4+8; i++)
    {
        ni = 2 * (i - gUnknown_020388F4) + 2;
        if (gUnknown_020388F7[i - gUnknown_020388F4])
        {
            sub_80F94F8(&gUnknown_020388F7[i - gUnknown_020388F4]);
        }
        if (i == gUnknown_020388D5)
        {
            sub_8072A18(gUnknownText_Exit, 0x10, 8 * ni, 0x68, 1);
            break;
        }
        if (gUnknown_020388D0[i])
        {
            if (ewram_1f000.isPlayerRoom == 1 && gUnknown_020388F6 != DECORCAT_DOLL && gUnknown_020388F6 != DECORCAT_CUSHION && gTasks[taskId].data[11] == 0)
            {
                StringCopy(gStringVar1, gDecorations[gUnknown_020388D0[i]].name);
                sub_8072A18(gUnknown_083EC65A, 0x10, 8 * ni, 0x68, 1);
            } else
            {
                sub_8072A18(gDecorations[gUnknown_020388D0[i]].name, 0x10, 8 * ni, 0x68, 1);
            }
			SetCustomFont(1);
            for (j=0; j<16; j++)
            {
                if (gUnknown_020388D6[j] - 1 == i)
                {
                    sub_80F94A4(4, &gUnknown_020388F7[i - gUnknown_020388F4], 0x6c, (i - gUnknown_020388F4) * 16 + 24);
                    break;
                }
            }
            for (j=0; j<12; j++)
            {
                if (gUnknown_020388E6[j] - 1 == i)
                {
                    sub_80F94A4(5, &gUnknown_020388F7[i - gUnknown_020388F4], 0x6c, (i - gUnknown_020388F4) * 16 + 24);
                    break;
                }
            }
			SetCustomFont(0);
        }
    }
}

void sub_80FEC94(u8 taskId)
{
    MenuDrawTextWindow(0, 0, 14, 19);
    sub_80FEABC(taskId, 0);
}

void sub_80FECB8(u8 decoCat)
{
    MenuDrawTextWindow(16, 0, 29, 3);
    sub_80FE470(decoCat, 17, 1, 0xff);
}

void sub_80FECE0(u8 decoCat)
{
    sub_8072AB0(gDecorations[gUnknown_020388D0[decoCat]].description, 0x80, 0x68, 0x68, 0x30, 0x1);
}

void sub_80FED1C(void)
{
    MenuZeroFillWindowRect(15, 0, 29, 3);
    MenuZeroFillWindowRect(15, 12, 29, 19);
}

void sub_80FED3C(u8 taskId)
{
    LoadScrollIndicatorPalette();
    gTasks[taskId].func = sub_80FE868;
}

bool8 sub_80FED64(u8 a0)
{
    u8 i;
    for (i=0; i<16; i++)
    {
        if (gUnknown_020388D6[i] == a0)
        {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_80FED90(u8 taskId)
{
    u16 i;
    u16 j;
    u16 k;
    u16 cnt;
    cnt = 0;
    for (i=0; i<16; i++)
    {
        gUnknown_020388D6[i] = 0;
        if (i < 12)
        {
            gUnknown_020388E6[i] = 0;
        }
    }
    for (i=0; i<16; i++)
    {
        if (gSaveBlock1.secretBases[0].decorations[i] != 0)
        {
            for (j=0; j<gDecorationInventories[gUnknown_020388F6].size; j++)
            {
                if (gUnknown_020388D0[j] == gSaveBlock1.secretBases[0].decorations[i])
                {
                    for (k=0; k<cnt && gUnknown_020388D6[k]!=j+1; k++);
                    if (k == cnt)
                    {
                        gUnknown_020388D6[cnt] = j+1;
                        cnt++;
                        break;
                    }
                }
            }
        }
    }
    cnt = 0;
    for (i=0; i<12; i++)
    {
        if (gSaveBlock1.playerRoomDecor[i] != 0)
        {
            for (j=0; j<gDecorationInventories[gUnknown_020388F6].size; j++)
            {
                if (gUnknown_020388D0[j] == gSaveBlock1.playerRoomDecor[i] && !sub_80FED64(j + 1))
                {
                    for (k=0; k<cnt && gUnknown_020388E6[k]!=j+1; k++);
                    if (k == cnt)
                    {
                        gUnknown_020388E6[cnt] = j+1;
                        cnt++;
                        break;
                    }
                }
            }
        }
    }
}

void sub_80FEF28(void)
{
    if (gUnknown_020388D5 <= 7)
    {
        gUnknown_020388F3 = gUnknown_020388D5;
    } else
    {
        gUnknown_020388F3 = 7;
    }
}

void sub_80FEF50(u8 taskId)
{
    sub_80FED90(taskId);
    sub_80FEF28();
    gUnknown_020388F2 = 0;
    gUnknown_020388F4 = 0;
}

void sub_80FEF74(void)
{
    sub_80F9520(gUnknown_020388F7, 8);
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 14, 19);
}

bool8 sub_80FEFA4(void)
{
    u16 i;
    int v0;
    for (i=0; i<16; i++)
    {
        v0 = gUnknown_020388F4 + gUnknown_020388F2 + 1;
        if (gUnknown_020388D6[i] == v0 || (i < 12 && gUnknown_020388E6[i] == v0))
        {
            return FALSE;
        }
    }
    return TRUE;
}

void sub_80FEFF4(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        LoadScrollIndicatorPalette();
        gTasks[taskId].func = sub_80FE868;
    }
}

void sub_80FF034(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 14, 19);
    sub_80FE5AC(taskId);
}

void sub_80FF058(u8 taskId)
{
    sub_80F9520(gUnknown_020388F7, 8);
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
    BuyMenuFreeMemory();
    gTasks[taskId].func = sub_80FF034;
}

void sub_80FF098(u8 taskId)
{
    gUnknown_020388D5--;
    if (gUnknown_020388F4 + 7 > gUnknown_020388D5 && gUnknown_020388F4 != 0)
    {
        gUnknown_020388F4--;
    }
    sub_8134104(gUnknown_020388F6);
    sub_80FED90(taskId);
    sub_80FEF28();
}

void sub_80FF0E0(u8 taskId)
{
    gTasks[taskId].data[3] = gSaveBlock1.pos.x;
    gTasks[taskId].data[4] = gSaveBlock1.pos.y;
    PlayerGetDestCoords(&gTasks[taskId].data[0], &gTasks[taskId].data[1]);
}

void sub_80FF114(u8 taskId)
{
    DrawWholeMapView();
    Overworld_SetWarpDestination(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum, -1, gTasks[taskId].data[3], gTasks[taskId].data[4]);
    warp_in();
}
void sub_80FF160(u8 taskId)
{
    if (!sub_81341D4())
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecors, sub_80FE428, 0);
    } else
    {
        gTasks[taskId].data[11] = 0;
        gUnknown_020388F6 = 0;
        sub_80FE5AC(taskId);
    }
}

u16 sub_80FF1B0(u8 decoId, u8 a1)
{
    u16 retval;
    retval = 0xffff;

    switch (decoId)
    {
        case DECOR_STAND:
            retval = gUnknown_083EC97C[a1] << 12;
            return retval;
        case DECOR_SLIDE:
            retval = gUnknown_083EC984[a1] << 12;
            return retval;
        default:
            return retval;
    }
}

void sub_80FF1EC(u16 mapX, u16 mapY, u8 decWidth, u8 decHeight, u16 decIdx)
{
    u16 i;
    u16 j; // r10
    u16 behavior;
    u16 flags; // r8
    u16 v0;
    u16 v1;
    s16 x;
    s16 decBottom;

    for (i=0; i<decHeight; i++)
    {
        decBottom = mapY - decHeight + 1 + i;
        for (j=0; j<decWidth; j++)
        {
            x = mapX + j;
            behavior = GetBehaviorByMetatileId(0x200 + gDecorations[decIdx].tiles[i * decWidth + j]);
            if (sub_8057288(behavior) == 1 || (gDecorations[decIdx].permission != DECORPERM_PASS_FLOOR && (behavior >> 12)))
            {
                flags = 0xc00;
            } else
            {
                flags = 0x000;
            }
            if (gDecorations[decIdx].permission != DECORPERM_NA_WALL && sub_80572B0(MapGridGetMetatileBehaviorAt(x, decBottom)) == 1)
            {
                v0 = 1;
            } else
            {
                v0 = 0;
            }
            v1 = sub_80FF1B0(gDecorations[decIdx].id, i * decWidth + j);
            if (v1 != 0xffff)
            {
                MapGridSetMetatileEntryAt(x, decBottom, (gDecorations[decIdx].tiles[i * decWidth + j] + (0x200 | v0)) | flags | v1);
            } else
            {
                MapGridSetMetatileIdAt(x, decBottom, (gDecorations[decIdx].tiles[i * decWidth + j] + (0x200 | v0)) | flags);
            }
        }
    }
}

void sub_80FF394(u16 mapX, u16 mapY, u16 decIdx)
{
    switch (gDecorations[decIdx].shape)
    {
        case DECORSHAPE_1x1:
            sub_80FF1EC(mapX, mapY, 1, 1, decIdx);
            break;
        case DECORSHAPE_2x1:
            sub_80FF1EC(mapX, mapY, 2, 1, decIdx);
            break;
        case DECORSHAPE_3x1: // unused
            sub_80FF1EC(mapX, mapY, 3, 1, decIdx);
            break;
        case DECORSHAPE_4x2:
            sub_80FF1EC(mapX, mapY, 4, 2, decIdx);
            break;
        case DECORSHAPE_2x2:
            sub_80FF1EC(mapX, mapY, 2, 2, decIdx);
            break;
        case DECORSHAPE_1x2:
            sub_80FF1EC(mapX, mapY, 1, 2, decIdx);
            break;
        case DECORSHAPE_1x3: // unused
            sub_80FF1EC(mapX, mapY, 1, 3, decIdx);
            break;
        case DECORSHAPE_2x4:
            sub_80FF1EC(mapX, mapY, 2, 4, decIdx);
            break;
        case DECORSHAPE_3x3:
            sub_80FF1EC(mapX, mapY, 3, 3, decIdx);
            break;
        case DECORSHAPE_3x2:
            sub_80FF1EC(mapX, mapY, 3, 2, decIdx);
            break;
    }
}

void sub_80FF474(void)
{
    u8 i;
    u8 j;
    for (i=0; i<14; i++)
    {
        if (FlagGet(i + 0xae) == 1)
        {
            FlagClear(i + 0xae);
            for (j=0; j<gMapHeader.events->mapObjectCount; j++)
            {
                if (gMapHeader.events->mapObjects[j].flagId == i + 0xae)
                {
                    break;
                }
            }
            VarSet(0x3f20 + gMapHeader.events->mapObjects[j].graphicsId, gUnknown_02038900.decoration->tiles[0]);
            gSpecialVar_0x8005 = gMapHeader.events->mapObjects[j].localId;
            gSpecialVar_0x8006 = gUnknown_020391A4;
            gSpecialVar_0x8007 = gUnknown_020391A6;
            show_sprite(gSpecialVar_0x8005, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
            sub_805C0F8(gSpecialVar_0x8005, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, gSpecialVar_0x8006, gSpecialVar_0x8007);
            sub_805C78C(gSpecialVar_0x8005, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
            break;
        }
    }
}

bool8 sub_80FF58C/*IsThereRoomForMoreDecorations*/(void)
{
    u16 i;
    for (i=0; i<ewram_1f000.size; i++)
    {
        if (ewram_1f000.items[i] == 0)
        {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_80FF5BC(u8 taskId)
{
    if (ewram_1f000.isPlayerRoom == 1 && gUnknown_020388F6 != DECORCAT_DOLL && gUnknown_020388F6 != DECORCAT_CUSHION)
    {
        sub_80FEF74();
        sub_80FED1C();
        DisplayItemMessageOnField(taskId, gSecretBaseText_DecorCantPlace, sub_80FEFF4, 0);
    } else if (sub_80FEFA4() == TRUE)
    {
        if (sub_80FF58C() == TRUE)
        {
            fade_screen(1, 0);
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].func = sub_80FF6AC;
        } else
        {
            sub_80FEF74();
            sub_80FED1C();
            ConvertIntToDecimalStringN(gStringVar1, ewram_1f000.size, STR_CONV_MODE_RIGHT_ALIGN, 2);
            if (!ewram_1f000.isPlayerRoom)
            {
                StringExpandPlaceholders(gStringVar4, gSecretBaseText_NoMoreDecor);
            } else
            {
                StringExpandPlaceholders(gStringVar4, gSecretBaseText_NoMoreDecor2);
            }
            DisplayItemMessageOnField(taskId, gStringVar4, sub_80FEFF4, 0);
        }
    } else
    {
        sub_80FEF74();
        sub_80FED1C();
        DisplayItemMessageOnField(taskId, gSecretBaseText_InUseAlready, sub_80FEFF4, 0);
    }
}

void sub_80FF6AC(u8 taskId)
{
    switch (gTasks[taskId].data[2])
    {
        case 0:
            if (!gPaletteFade.active)
            {
                sub_80FF0E0(taskId);
                DestroyVerticalScrollIndicator(0);
                DestroyVerticalScrollIndicator(1);
                sub_80F9520(gUnknown_020388F7, 8);
                BuyMenuFreeMemory();
                gTasks[taskId].data[2] = 1;
            }
            break;
        case 1:
            gPaletteFade.bufferTransferDisabled = 1;
            AddDecorationIconObjectFromFieldObject(&gUnknown_02038900, gUnknown_020388D0[gUnknown_020388F5]);
            sub_80FF960(taskId);
            SetUpPlacingDecorationPlayerAvatar(taskId, &gUnknown_02038900);
            pal_fill_black();
            gPaletteFade.bufferTransferDisabled = 0;
            gTasks[taskId].data[2] = 2;
            break;
        case 2:
            if (sub_807D770() == 1)
            {
                gTasks[taskId].data[12] = 0;
                sub_810065C(taskId);
            }
            break;
    }
}

void AddDecorationIconObjectFromFieldObject(struct UnkStruct_02038900 * unk_02038900, u8 decoIdx)
{
    sub_80FEF74();
    sub_80FED1C();
    sub_81006D0(unk_02038900);
    unk_02038900->decoration = &gDecorations[decoIdx];
    if (gDecorations[decoIdx].permission != DECORPERM_SOLID_MAT)
    {
        sub_81008BC(unk_02038900);
        sub_8100930(unk_02038900->decoration->shape);
        sub_8100874(unk_02038900);
        sub_810070C(unk_02038900->palette, ((u16 *)gMapHeader.mapData->secondaryTileset->metatiles + 8 * unk_02038900->decoration->tiles[0])[7] >> 12);
        LoadSpritePalette(&gUnknown_083EC954);
        gUnknown_020391A8 = gSprites[gUnknown_03004880.unk4].data[0];
        gUnknown_03004880.unk4 = CreateSprite(&gSpriteTemplate_83EC93C, gUnknown_083EC900[unk_02038900->decoration->shape].x,  gUnknown_083EC900[unk_02038900->decoration->shape].y, 0);
    } else
    {
        gUnknown_020391A8 = gSprites[gUnknown_03004880.unk4].data[0];
        gUnknown_03004880.unk4 = AddPseudoFieldObject(unk_02038900->decoration->tiles[0], sub_81009A8, gUnknown_083EC900[unk_02038900->decoration->shape].x,  gUnknown_083EC900[unk_02038900->decoration->shape].y, 1);
        gSprites[gUnknown_03004880.unk4].oam.priority = 1;
    }
}

void SetUpPlacingDecorationPlayerAvatar(u8 taskId, struct UnkStruct_02038900 *unk_02038900)
{
    u8 v0;
    v0 = 16 * (u8)gTasks[taskId].data[5] + gUnknown_083EC900[unk_02038900->decoration->shape].x - 8 * ((u8)gTasks[taskId].data[5] - 1);
    if (unk_02038900->decoration->shape == DECORSHAPE_3x1 || unk_02038900->decoration->shape == DECORSHAPE_3x3 || unk_02038900->decoration->shape == DECORSHAPE_3x2)
    {
        v0 -= 8;
    }
    if (gSaveBlock2.playerGender == MALE)
    {
        gUnknown_020391A9 = AddPseudoFieldObject(0xc1, SpriteCallbackDummy, v0, 0x48, 0);
    } else
    {
        gUnknown_020391A9 = AddPseudoFieldObject(0xc2, SpriteCallbackDummy, v0, 0x48, 0);
    }
    gSprites[gUnknown_020391A9].oam.priority = 1;
    DestroySprite(&gSprites[gUnknown_020391A8]);
    gUnknown_020391A8 = gUnknown_03004880.unk4;
}

void sub_80FF960(u8 taskId)
{
    switch (gDecorations[gUnknown_020388D0[gUnknown_020388F5]].shape)
    {
        case DECORSHAPE_1x1:
            gTasks[taskId].data[5] = 1;
            gTasks[taskId].data[6] = 1;
            break;
        case DECORSHAPE_2x1:
            gTasks[taskId].data[5] = 2;
            gTasks[taskId].data[6] = 1;
            break;
        case DECORSHAPE_3x1:
            gTasks[taskId].data[5] = 3;
            gTasks[taskId].data[6] = 1;
            break;
        case DECORSHAPE_4x2:
            gTasks[taskId].data[5] = 4;
            gTasks[taskId].data[6] = 2;
            break;
        case DECORSHAPE_2x2:
            gTasks[taskId].data[5] = 2;
            gTasks[taskId].data[6] = 2;
            break;
        case DECORSHAPE_1x2:
            gTasks[taskId].data[5] = 1;
            gTasks[taskId].data[6] = 2;
            break;
        case DECORSHAPE_1x3:
            gTasks[taskId].data[5] = 1;
            gTasks[taskId].data[6] = 3;
            gTasks[taskId].data[1]++;
            break;
        case DECORSHAPE_2x4:
            gTasks[taskId].data[5] = 2;
            gTasks[taskId].data[6] = 4;
            break;
        case DECORSHAPE_3x3:
            gTasks[taskId].data[5] = 3;
            gTasks[taskId].data[6] = 3;
            break;
        case DECORSHAPE_3x2:
            gTasks[taskId].data[5] = 3;
            gTasks[taskId].data[6] = 2;
            break;
    }
}

void sub_80FFAB0(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    gSprites[gUnknown_020391A8].data[7] = 1;
    gSprites[gUnknown_020391A9].data[7] = 1;
    sub_810045C();
    sub_8100038(taskId);
}

void sub_80FFB08(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    gSprites[gUnknown_020391A8].data[7] = 1;
    gSprites[gUnknown_020391A9].data[7] = 1;
    sub_810045C();
    DisplayItemMessageOnField(taskId, gSecretBaseText_CancelDecorating, sub_8100248, 0);
}

bool8 sub_80FFB6C(u8 a0, u16 a1)
{
    if (sub_8057274(a0) != 1 || a1 != 0)
    {
        return FALSE;
    }
    return TRUE;
}

bool8 sub_80FFB94(u8 taskId, s16 x, s16 y, u16 decoId)
{
    if (x == gTasks[taskId].data[3] + 7 && y == gTasks[taskId].data[4] + 7 && decoId != 0)
    {
        return FALSE;
    }
    return TRUE;
}

bool8 sub_80FFBDC(u16 a0, const struct Decoration *decoration)
{
    if (sub_8057274(a0) != 1)
    {
        if (decoration->id == DECOR_SOLID_BOARD && sub_8057300(a0) == 1)
        {
            return TRUE;
        }
        if (sub_805729C(a0))
        {
            return TRUE;
        }
    }
    return FALSE;
}

// When behaviorBy is set, it is masked by 0xf000.  This is the step that fails to match when built.
#ifdef NONMATCHING
bool8 sub_80FFC24(u8 taskId, const struct Decoration *decoration)
{
    u8 i;
    u8 j;
    u8 behaviorAt;
    u16 behaviorBy;
    u8 mapY;
    u8 mapX;
    s16 curY;
    s16 curX;
    mapY = gTasks[taskId].data[6];
    mapX = gTasks[taskId].data[5];
    switch (decoration->permission)
    {
        case DECORPERM_SOLID_FLOOR:
        case DECORPERM_PASS_FLOOR:
            for (i=0; i<mapY; i++)
            {
                curY = gTasks[taskId].data[1] - i;
                for (j=0; j<mapX; j++)
                {
                    curX = gTasks[taskId].data[0] + j;
                    behaviorAt = MapGridGetMetatileBehaviorAt(curX, curY);
                    behaviorBy = GetBehaviorByMetatileId(0x200 + decoration->tiles[(mapY - 1 - i) * mapX + j]) & 0xf000;
                    if (!sub_80FFBDC(behaviorAt, decoration))
                    {
                        return FALSE;
                    }
                    if (!sub_80FFB94(taskId, curX, curY, behaviorBy))
                    {
                        return FALSE;
                    }
                    behaviorAt = GetFieldObjectIdByXYZ(curX, curY, 0);
                    if (behaviorAt != 0 && behaviorAt != 16)
                    {
                        return FALSE;
                    }
                }
            }
            break;
        case DECORPERM_BEHIND_FLOOR:
            for (i=0; i<mapY-1; i++)
            {
                curY = gTasks[taskId].data[1] - i;
                for (j=0; j<mapX; j++)
                {
                    curX = gTasks[taskId].data[0] + j;
                    behaviorAt = MapGridGetMetatileBehaviorAt(curX, curY);
                    behaviorBy = GetBehaviorByMetatileId(0x200 + decoration->tiles[(mapY - 1 - i) * mapX + j]) & 0xf000;
                    if (!sub_805729C(behaviorAt) && !sub_80FFB6C(behaviorAt, behaviorBy))
                    {
                        return FALSE;
                    }
                    if (!sub_80FFB94(taskId, curX, curY, behaviorBy))
                    {
                        return FALSE;
                    }
                    if (GetFieldObjectIdByXYZ(curX, curY, 0) != 16)
                    {
                        return FALSE;
                    }
                }
            }
            curY = gTasks[taskId].data[1] - mapY + 1;
            for (j=0; j<mapX; j++)
            {
                curX = gTasks[taskId].data[0] + j;
                behaviorAt = MapGridGetMetatileBehaviorAt(curX, curY);
                behaviorBy = GetBehaviorByMetatileId(0x200 + decoration->tiles[j]) & 0xf000;
                if (!sub_805729C(behaviorAt) && !sub_80572B0(behaviorAt))
                {
                    return FALSE;
                }
                if (!sub_80FFB94(taskId, curX, curY, behaviorBy))
                {
                    return FALSE;
                }
                behaviorAt = GetFieldObjectIdByXYZ(curX, curY, 0);
                if (behaviorAt != 0 && behaviorAt != 16)
                {
                    return FALSE;
                }
            }
            break;
        case DECORPERM_NA_WALL:
            for (i=0; i<mapY; i++)
            {
                curY = gTasks[taskId].data[1] - i;
                for (j=0; j<mapX; j++)
                {
                    curX = gTasks[taskId].data[0] + j;
                    if (!sub_80572B0(MapGridGetMetatileBehaviorAt(curX, curY)))
                    {
                        return FALSE;
                    }
                    if (MapGridGetMetatileIdAt(curX, curY + 1) == 0x28c)
                    {
                        return FALSE;
                    }
                }
            }
            break;
        case DECORPERM_SOLID_MAT:
            curY = gTasks[taskId].data[1];
            for (j=0; j<mapX; j++)
            {
                curX = gTasks[taskId].data[0] + j;
                behaviorAt = MapGridGetMetatileBehaviorAt(curX, curY);
                if (decoration->shape == DECORSHAPE_1x2)
                {
                    if (!sub_80572EC(behaviorAt))
                    {
                        return FALSE;
                    }
                }
                else if (!sub_80572D8(behaviorAt))
                {
                    if (!sub_80572EC(behaviorAt))
                    {
                        return FALSE;
                    }
                }
                if (GetFieldObjectIdByXYZ(curX, curY, 0) != 16)
                {
                    return FALSE;
                }
            }
            break;
    }
    return TRUE;
}
#else
__attribute__((naked))
bool8 sub_80FFC24(u8 taskId, const struct Decoration *decoration)
{
    asm(".syntax unified\n"
    "\tpush {r4-r7,lr}\n"
    "\tmov r7, r10\n"
    "\tmov r6, r9\n"
    "\tmov r5, r8\n"
    "\tpush {r5-r7}\n"
    "\tsub sp, 0x24\n"
    "\tstr r1, [sp]\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tmov r10, r0\n"
    "\tldr r1, _080FFC60 @ =gTasks\n"
    "\tlsls r0, 2\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r1\n"
    "\tldrb r2, [r0, 0x14]\n"
    "\tstr r2, [sp, 0x4]\n"
    "\tldrb r0, [r0, 0x12]\n"
    "\tstr r0, [sp, 0x8]\n"
    "\tldr r3, [sp]\n"
    "\tldrb r0, [r3, 0x11]\n"
    "\tadds r2, r1, 0\n"
    "\tcmp r0, 0x4\n"
    "\tbls _080FFC56\n"
    "\tb _08100024\n"
    "_080FFC56:\n"
    "\tlsls r0, 2\n"
    "\tldr r1, _080FFC64 @ =_080FFC68\n"
    "\tadds r0, r1\n"
    "\tldr r0, [r0]\n"
    "\tmov pc, r0\n"
    "\t.align 2, 0\n"
    "_080FFC60: .4byte gTasks\n"
    "_080FFC64: .4byte _080FFC68\n"
    "\t.align 2, 0\n"
    "_080FFC68:\n"
    "\t.4byte _080FFC7C\n"
    "\t.4byte _080FFC7C\n"
    "\t.4byte _080FFD68\n"
    "\t.4byte _080FFF1C\n"
    "\t.4byte _080FFFA0\n"
    "_080FFC7C:\n"
    "\tmovs r6, 0\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tcmp r6, r0\n"
    "\tbcc _080FFC86\n"
    "\tb _08100024\n"
    "_080FFC86:\n"
    "\tmov r1, r10\n"
    "\tlsls r1, 2\n"
    "\tstr r1, [sp, 0x1C]\n"
    "_080FFC8C:\n"
    "\tmov r2, r10\n"
    "\tlsls r0, r2, 2\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tldr r3, _080FFD64 @ =gTasks\n"
    "\tadds r0, r3\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tsubs r0, r6\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tadds r6, 0x1\n"
    "\tstr r6, [sp, 0x14]\n"
    "\tldr r0, [sp, 0x8]\n"
    "\tcmp r7, r0\n"
    "\tbcs _080FFD56\n"
    "\tmov r1, r9\n"
    "\tlsls r1, 16\n"
    "\tstr r1, [sp, 0xC]\n"
    "\tasrs r1, 16\n"
    "\tmov r9, r1\n"
    "_080FFCB8:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tldr r2, _080FFD64 @ =gTasks\n"
    "\tadds r0, r2\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tmov r8, r0\n"
    "\tasrs r6, r0, 16\n"
    "\tadds r0, r6, 0\n"
    "\tmov r1, r9\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp, 0x4]\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tsubs r0, r3, r1\n"
    "\tldr r2, [sp, 0x8]\n"
    "\tadds r1, r0, 0\n"
    "\tmuls r1, r2\n"
    "\tadds r1, r7\n"
    "\tldr r3, [sp]\n"
    "\tldr r0, [r3, 0x1C]\n"
    "\tlsls r1, 1\n"
    "\tadds r1, r0\n"
    "\tmovs r2, 0x80\n"
    "\tlsls r2, 2\n"
    "\tadds r0, r2, 0\n"
    "\tldrh r1, [r1]\n"
    "\tadds r0, r1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tbl GetBehaviorByMetatileId\n"
    "\tmovs r3, 0xF0\n"
    "\tlsls r3, 8\n"
    "\tadds r1, r3, 0\n"
    "\tadds r5, r1, 0\n"
    "\tands r5, r0\n"
    "\tadds r0, r4, 0\n"
    "\tldr r1, [sp]\n"
    "\tbl sub_80FFBDC\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFD1A\n"
    "\tb _080FFFF4\n"
    "_080FFD1A:\n"
    "\tmov r0, r10\n"
    "\tadds r1, r6, 0\n"
    "\tmov r2, r9\n"
    "\tadds r3, r5, 0\n"
    "\tbl sub_80FFB94\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFD2E\n"
    "\tb _080FFFF4\n"
    "_080FFD2E:\n"
    "\tmov r1, r8\n"
    "\tlsrs r0, r1, 16\n"
    "\tldr r2, [sp, 0xC]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tcmp r4, 0\n"
    "\tbeq _080FFD4A\n"
    "\tcmp r4, 0x10\n"
    "\tbeq _080FFD4A\n"
    "\tb _080FFFF4\n"
    "_080FFD4A:\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFCB8\n"
    "_080FFD56:\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tlsls r0, r1, 24\n"
    "\tlsrs r6, r0, 24\n"
    "\tldr r2, [sp, 0x4]\n"
    "\tcmp r6, r2\n"
    "\tbcc _080FFC8C\n"
    "\tb _08100024\n"
    "\t.align 2, 0\n"
    "_080FFD64: .4byte gTasks\n"
    "_080FFD68:\n"
    "\tmovs r6, 0\n"
    "\tmov r3, r10\n"
    "\tlsls r3, 2\n"
    "\tstr r3, [sp, 0x1C]\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tsubs r0, 0x1\n"
    "\tstr r0, [sp, 0x18]\n"
    "\tcmp r6, r0\n"
    "\tbge _080FFE54\n"
    "\tadds r0, r3, 0\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tstr r0, [sp, 0x10]\n"
    "_080FFD82:\n"
    "\tldr r1, [sp, 0x10]\n"
    "\tadds r0, r1, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tsubs r0, r6\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tadds r6, 0x1\n"
    "\tstr r6, [sp, 0x14]\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcs _080FFE48\n"
    "\tlsls r0, 16\n"
    "\tstr r0, [sp, 0x20]\n"
    "_080FFDA0:\n"
    "\tldr r1, [sp, 0x10]\n"
    "\tadds r0, r1, r2\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tmov r8, r0\n"
    "\tasrs r6, r0, 16\n"
    "\tmov r2, r9\n"
    "\tlsls r1, r2, 16\n"
    "\tadds r0, r6, 0\n"
    "\tasrs r1, 16\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp, 0x4]\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tsubs r0, r3, r1\n"
    "\tldr r2, [sp, 0x8]\n"
    "\tadds r1, r0, 0\n"
    "\tmuls r1, r2\n"
    "\tadds r1, r7\n"
    "\tldr r3, [sp]\n"
    "\tldr r0, [r3, 0x1C]\n"
    "\tlsls r1, 1\n"
    "\tadds r1, r0\n"
    "\tmovs r2, 0x80\n"
    "\tlsls r2, 2\n"
    "\tadds r0, r2, 0\n"
    "\tldrh r1, [r1]\n"
    "\tadds r0, r1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tbl GetBehaviorByMetatileId\n"
    "\tmovs r3, 0xF0\n"
    "\tlsls r3, 8\n"
    "\tadds r1, r3, 0\n"
    "\tadds r5, r1, 0\n"
    "\tands r5, r0\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_805729C\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFE0C\n"
    "\tadds r0, r4, 0\n"
    "\tadds r1, r5, 0\n"
    "\tbl sub_80FFB6C\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFE0C\n"
    "\tb _080FFFF4\n"
    "_080FFE0C:\n"
    "\tmov r0, r10\n"
    "\tadds r1, r6, 0\n"
    "\tldr r3, [sp, 0x20]\n"
    "\tasrs r2, r3, 16\n"
    "\tadds r3, r5, 0\n"
    "\tbl sub_80FFB94\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFE22\n"
    "\tb _080FFFF4\n"
    "_080FFE22:\n"
    "\tmov r1, r8\n"
    "\tlsrs r0, r1, 16\n"
    "\tldr r2, [sp, 0x20]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tcmp r0, 0x10\n"
    "\tbeq _080FFE3A\n"
    "\tb _080FFFF4\n"
    "_080FFE3A:\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r2, _080FFF18 @ =gTasks\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFDA0\n"
    "_080FFE48:\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tlsls r0, r1, 24\n"
    "\tlsrs r6, r0, 24\n"
    "\tldr r3, [sp, 0x18]\n"
    "\tcmp r6, r3\n"
    "\tblt _080FFD82\n"
    "_080FFE54:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tldr r1, [sp, 0x4]\n"
    "\tsubs r0, r1\n"
    "\tadds r0, 0x1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFE74\n"
    "\tb _08100024\n"
    "_080FFE74:\n"
    "\tlsls r0, 16\n"
    "\tstr r0, [sp, 0x20]\n"
    "_080FFE78:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tldr r1, _080FFF18 @ =gTasks\n"
    "\tadds r0, r1\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tmov r8, r0\n"
    "\tasrs r6, r0, 16\n"
    "\tmov r2, r9\n"
    "\tlsls r1, r2, 16\n"
    "\tadds r0, r6, 0\n"
    "\tasrs r1, 16\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp]\n"
    "\tldr r0, [r3, 0x1C]\n"
    "\tlsls r1, r7, 1\n"
    "\tadds r1, r0\n"
    "\tmovs r2, 0x80\n"
    "\tlsls r2, 2\n"
    "\tadds r0, r2, 0\n"
    "\tldrh r1, [r1]\n"
    "\tadds r0, r1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tbl GetBehaviorByMetatileId\n"
    "\tmovs r3, 0xF0\n"
    "\tlsls r3, 8\n"
    "\tadds r1, r3, 0\n"
    "\tadds r5, r1, 0\n"
    "\tands r5, r0\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_805729C\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFEDA\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_80572B0\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFEDA\n"
    "\tb _080FFFF4\n"
    "_080FFEDA:\n"
    "\tmov r0, r10\n"
    "\tadds r1, r6, 0\n"
    "\tldr r3, [sp, 0x20]\n"
    "\tasrs r2, r3, 16\n"
    "\tadds r3, r5, 0\n"
    "\tbl sub_80FFB94\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFEF0\n"
    "\tb _080FFFF4\n"
    "_080FFEF0:\n"
    "\tmov r1, r8\n"
    "\tlsrs r0, r1, 16\n"
    "\tldr r2, [sp, 0x20]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tcmp r4, 0\n"
    "\tbeq _080FFF0A\n"
    "\tcmp r4, 0x10\n"
    "\tbne _080FFFF4\n"
    "_080FFF0A:\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFE78\n"
    "\tb _08100024\n"
    "\t.align 2, 0\n"
    "_080FFF18: .4byte gTasks\n"
    "_080FFF1C:\n"
    "\tmovs r6, 0\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tcmp r6, r0\n"
    "\tbcc _080FFF26\n"
    "\tb _08100024\n"
    "_080FFF26:\n"
    "\tmov r1, r10\n"
    "\tlsls r0, r1, 2\n"
    "\tadd r0, r10\n"
    "\tlsls r1, r0, 3\n"
    "\tldr r2, _080FFF9C @ =gTasks\n"
    "\tadds r0, r1, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tsubs r0, r6\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcs _080FFF8C\n"
    "\tadds r0, r2, 0\n"
    "\tadds r1, r0\n"
    "\tmov r8, r1\n"
    "\tmov r1, r9\n"
    "\tlsls r0, r1, 16\n"
    "\tasrs r5, r0, 16\n"
    "_080FFF50:\n"
    "\tmov r2, r8\n"
    "\tldrh r0, [r2, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tasrs r4, r0, 16\n"
    "\tadds r0, r4, 0\n"
    "\tadds r1, r5, 0\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tbl sub_80572B0\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbeq _080FFFF4\n"
    "\tadds r0, r4, 0\n"
    "\tadds r1, r5, 0x1\n"
    "\tbl MapGridGetMetatileIdAt\n"
    "\tmovs r1, 0xA3\n"
    "\tlsls r1, 2\n"
    "\tcmp r0, r1\n"
    "\tbeq _080FFFF4\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFF50\n"
    "_080FFF8C:\n"
    "\tadds r0, r6, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r6, r0, 24\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tcmp r6, r0\n"
    "\tbcc _080FFF26\n"
    "\tb _08100024\n"
    "\t.align 2, 0\n"
    "_080FFF9C: .4byte gTasks\n"
    "_080FFFA0:\n"
    "\tmov r3, r10\n"
    "\tlsls r1, r3, 2\n"
    "\tadds r0, r1, r3\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tstr r1, [sp, 0x1C]\n"
    "\tldr r0, [sp, 0x8]\n"
    "\tcmp r7, r0\n"
    "\tbcs _08100024\n"
    "\tadds r6, r2, 0\n"
    "\tmov r1, r9\n"
    "\tlsls r1, 16\n"
    "\tstr r1, [sp, 0x20]\n"
    "_080FFFC0:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r6\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tlsrs r5, r0, 16\n"
    "\tasrs r0, 16\n"
    "\tmov r2, r9\n"
    "\tlsls r1, r2, 16\n"
    "\tasrs r1, 16\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp]\n"
    "\tldrb r0, [r3, 0x12]\n"
    "\tcmp r0, 0x5\n"
    "\tbne _080FFFF8\n"
    "_080FFFE8:\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_80572EC\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _08100004\n"
    "_080FFFF4:\n"
    "\tmovs r0, 0\n"
    "\tb _08100026\n"
    "_080FFFF8:\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_80572D8\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbeq _080FFFE8\n"
    "_08100004:\n"
    "\tadds r0, r5, 0\n"
    "\tldr r2, [sp, 0x20]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tcmp r0, 0x10\n"
    "\tbne _080FFFF4\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFFC0\n"
    "_08100024:\n"
    "\tmovs r0, 0x1\n"
    "_08100026:\n"
    "\tadd sp, 0x24\n"
    "\tpop {r3-r5}\n"
    "\tmov r8, r3\n"
    "\tmov r9, r4\n"
    "\tmov r10, r5\n"
    "\tpop {r4-r7}\n"
    "\tpop {r1}\n"
    "\tbx r1\n"
    ".syntax divided\n");
}
#endif

void sub_8100038(u8 taskId)
{
    if (sub_80FFC24(taskId, &gDecorations[gUnknown_020388D0[gUnknown_020388F5]]) == 1)
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_PlaceItHere, sub_81000A0, 0);
    } else
    {
        PlaySE(SE_HAZURE);
        DisplayItemMessageOnField(taskId, gSecretBaseText_CantBePlacedHere, sub_81006A8, 0);
    }
}

void sub_81000A0(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    DoYesNoFuncWithChoice(taskId, &gUnknown_083EC95C);
}

void sub_81000C4(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    sub_8100174(taskId);
    if (gDecorations[gUnknown_020388D0[gUnknown_020388F5]].permission != DECORPERM_SOLID_MAT)
    {
        sub_80FF394(gTasks[taskId].data[0], gTasks[taskId].data[1], gUnknown_020388D0[gUnknown_020388F5]);
    } else
    {
        gUnknown_020391A4 = gTasks[taskId].data[0] - 7;
        gUnknown_020391A6 = gTasks[taskId].data[1] - 7;
        ScriptContext1_SetupScript(gUnknown_081A2F7B);
    }
    gSprites[gUnknown_020391A8].pos1.y += 2;
    sub_810028C(taskId);
}

void sub_8100174(u8 taskId)
{
    u16 i;
    for (i=0; i<ewram_1f000.size; i++)
    {
        if (ewram_1f000.items[i] == 0)
        {
            ewram_1f000.items[i] = gUnknown_020388D0[gUnknown_020388F5];
            ewram_1f000.pos[i] = ((gTasks[taskId].data[0] - 7) << 4) + (gTasks[taskId].data[1] - 7);
            break;
        }
    }
    if (!ewram_1f000.isPlayerRoom)
    {
        for (i=0; i<16; i++)
        {
            if (gUnknown_020388D6[i] == 0)
            {
                gUnknown_020388D6[i] = gUnknown_020388F5 + 1;
                break;
            }
        }
    } else
    {
        for (i=0; i<12; i++)
        {
            if (gUnknown_020388E6[i] == 0)
            {
                gUnknown_020388E6[i] = gUnknown_020388F5 + 1;
                break;
            }
        }
    }
}

void sub_8100248(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    DoYesNoFuncWithChoice(taskId, &gUnknown_083EC964);
}

void sub_810026C(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    sub_810028C(taskId);
}

void sub_810028C(u8 taskId)
{
    fade_screen(1, 0);
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].func = c1_overworld_prev_quest;
}

void c1_overworld_prev_quest(u8 taskId)
{
    switch (gTasks[taskId].data[2])
    {
        case 0:
            ScriptContext2_Enable();
            if (!gPaletteFade.active)
            {
                sub_80FF114(taskId);
                gTasks[taskId].data[2] = 1;
            }
            break;
        case 1:
            sub_81016F4();
            FreeSpritePaletteByTag(0xbb8);
            gFieldCallback = &sub_8100364;
            SetMainCallback2(c2_exit_to_overworld_2_switch);
            DestroyTask(taskId);
            break;
    }
}

void sub_8100334(u8 taskId)
{
    if (sub_807D770() == 1)
    {
        gTasks[taskId].func = sub_80FE948;
    }
}

void sub_8100364(void)
{
    ScriptContext2_Enable();
    LoadScrollIndicatorPalette();
    pal_fill_black();
    sub_80FE7EC(CreateTask(sub_8100334, 8));
}

bool8 sub_810038C(u8 taskId)
{
    s16 *data;
    data = gTasks[taskId].data;
    if (gUnknown_020391AA == DIR_SOUTH && data[1] - data[6] - 6 < 0)
    {
        data[1]++;
        return FALSE;
    } else if (gUnknown_020391AA == DIR_NORTH && data[1] - 7 >= gMapHeader.mapData->height)
    {
        data[1]--;
        return FALSE;
    } else if (gUnknown_020391AA == DIR_WEST && data[0] - 7 < 0)
    {
        data[0]++;
        return FALSE;
    } else if (gUnknown_020391AA == DIR_EAST && data[0] + data[5] - 8 >= gMapHeader.mapData->width)
    {
        data[0]--;
        return FALSE;
    }
    return TRUE;
}

bool8 sub_8100430(void)
{
    if ((gMain.heldKeys & DPAD_ANY) != DPAD_UP && (gMain.heldKeys & DPAD_ANY) != DPAD_DOWN && (gMain.heldKeys & DPAD_ANY) != DPAD_LEFT && (gMain.heldKeys & DPAD_ANY) != DPAD_RIGHT)
    {
        return FALSE;
    }
    return TRUE;
}

void sub_810045C(void)
{
    gUnknown_020391AA = 0;
    gSprites[gUnknown_020391A8].data[2] = 0;
    gSprites[gUnknown_020391A8].data[3] = 0;
}

void sub_8100494(u8 taskId)
{
    if (!gSprites[gUnknown_020391A8].data[4])
    {
        if (gTasks[taskId].data[10] == 1)
        {
            gUnknown_083EC96C[gTasks[taskId].data[12]].yesFunc(taskId);
            return;
        } else if (gTasks[taskId].data[10] == 2)
        {
            gUnknown_083EC96C[gTasks[taskId].data[12]].noFunc(taskId);
            return;
        }
        if ((gMain.heldKeys & DPAD_ANY) == DPAD_UP)
        {
            gUnknown_020391AA = DIR_SOUTH;
            gSprites[gUnknown_020391A8].data[2] =  0;
            gSprites[gUnknown_020391A8].data[3] = -2;
            gTasks[taskId].data[1]--;
        }
        if ((gMain.heldKeys & DPAD_ANY) == DPAD_DOWN)
        {
            gUnknown_020391AA = DIR_NORTH;
            gSprites[gUnknown_020391A8].data[2] =  0;
            gSprites[gUnknown_020391A8].data[3] =  2;
            gTasks[taskId].data[1]++;
        }
        if ((gMain.heldKeys & DPAD_ANY) == DPAD_LEFT)
        {
            gUnknown_020391AA = DIR_WEST;
            gSprites[gUnknown_020391A8].data[2] = -2;
            gSprites[gUnknown_020391A8].data[3] =  0;
            gTasks[taskId].data[0]--;
        }
        if ((gMain.heldKeys & DPAD_ANY) == DPAD_RIGHT)
        {
            gUnknown_020391AA = DIR_EAST;
            gSprites[gUnknown_020391A8].data[2] =  2;
            gSprites[gUnknown_020391A8].data[3] =  0;
            gTasks[taskId].data[0]++;
        }
        if (!sub_8100430() || !sub_810038C(taskId))
        {
            sub_810045C();
        }
    }
    if (gUnknown_020391AA)
    {
        gSprites[gUnknown_020391A8].data[4]++;
        gSprites[gUnknown_020391A8].data[4] &= 7;
    }
    if (!gTasks[taskId].data[10])
    {
        if (gMain.newKeys & A_BUTTON)
        {
            gTasks[taskId].data[10] = A_BUTTON;
        }
        if (gMain.newKeys & B_BUTTON)
        {
            gTasks[taskId].data[10] = B_BUTTON;
        }
    }
}

void sub_810065C(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    gSprites[gUnknown_020391A8].data[7] = 0;
    gTasks[taskId].data[10] = 0;
    gTasks[taskId].func = sub_8100494;
}

void sub_81006A8(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
    {
        sub_810065C(taskId);
    }
}

void sub_81006D0(struct UnkStruct_02038900 *unk_02038900)
{
    u16 i;
    for (i=0; i<0x800; i++)
    {
        unk_02038900->image[i] = 0;
    }
    for (i=0; i<0x40; i++)
    {
        unk_02038900->tiles[i] = 0;
    }
}

void sub_810070C(u16 *a0, u16 a1)
{
    u16 i;
    for (i=0; i<16; i++)
    {
        a0[i] = ((u16 *)gMapHeader.mapData->primaryTileset->palettes)[16 * a1 + i];
    }
}

void sub_8100740(u8 *dest, u16 flags)
{
    u8 buffer[32];
    u16 mode;
    u16 i;
    mode = flags >> 10;
    if (flags != 0)
    {
        flags &= 0x3ff;
    }
    for (i=0; i<32; i++)
    {
        buffer[i] = ((u8 *)gMapHeader.mapData->primaryTileset->tiles)[flags * 32 + i];
    }
    switch (mode)
    {
        case 0:
            for (i=0; i<32; i++)
            {
                dest[i] = buffer[i];
            }
            break;
        case 1:
            for (i=0; i<8; i++)
            {
                dest[4*i] = (buffer[4*(i+1) - 1] >> 4) + ((buffer[4*(i+1) - 1] & 0xf) << 4);
                dest[4*i + 1] = (buffer[4*(i+1) - 2] >> 4) + ((buffer[4*(i+1) - 2] & 0xf) << 4);
                dest[4*i + 2] = (buffer[4*(i+1) - 3] >> 4) + ((buffer[4*(i+1) - 3] & 0xf) << 4);
                dest[4*i + 3] = (buffer[4*(i+1) - 4] >> 4) + ((buffer[4*(i+1) - 4] & 0xf) << 4);
            }
            break;
        case 2:
            for (i=0; i<8; i++)
            {
                dest[4*i] = buffer[4*(7-i)];
                dest[4*i + 1] = buffer[4*(7-i) + 1];
                dest[4*i + 2] = buffer[4*(7-i) + 2];
                dest[4*i + 3] = buffer[4*(7-i) + 3];
            }
            break;
        case 3:
            for (i=0; i<32; i++)
            {
                dest[i] = (buffer[31-i] >> 4) + ((buffer[31-i] & 0xf) << 4);
            }
            break;
    }
}

void sub_8100874(struct UnkStruct_02038900 *unk_02038900)
{
    u16 i;
    for (i=0; i<0x40; i++)
        sub_8100740(&unk_02038900->image[i * 32], unk_02038900->tiles[i]);
}

u16 sub_810089C(u16 a0)
{
    return ((u16 *)gMapHeader.mapData->secondaryTileset->metatiles)[a0] & 0xfff;
}

void sub_81008BC(struct UnkStruct_02038900 *unk_02038900)
{
    u8 i;
    u8 shape;
    shape = unk_02038900->decoration->shape;
    for (i=0; i<gUnknown_083EC860[shape].size; i++)
    {
        unk_02038900->tiles[gUnknown_083EC860[shape].tiles[i]] = sub_810089C(unk_02038900->decoration->tiles[gUnknown_083EC860[shape].y[i]] * 8 + gUnknown_083EC860[shape].x[i]);
    }
}

void sub_8100930(u8 decoShape)
{
    gUnknown_020391AC.y = 0;
    gUnknown_020391AC.affineMode = 0;
    gUnknown_020391AC.objMode = 0;
    gUnknown_020391AC.mosaic = 0;
    gUnknown_020391AC.bpp = 0;
    gUnknown_020391AC.shape = gUnknown_083EC900[decoShape].shape;
    gUnknown_020391AC.x = 0;
    gUnknown_020391AC.matrixNum = 0;
    gUnknown_020391AC.size = gUnknown_083EC900[decoShape].size;
    gUnknown_020391AC.tileNum = 0;
    gUnknown_020391AC.priority = 1;
    gUnknown_020391AC.paletteNum = 0;
}

void sub_81009A8(struct Sprite *sprite)
{
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
    sprite->data[6] = 0;
    sprite->data[7] = 0;
    sprite->callback = sub_81009C0;
}

void sub_81009C0(struct Sprite *sprite)
{
    if (sprite->data[7] == 0)
    {
        if (sprite->data[6] < 15)
        {
            sprite->invisible = 0;
        } else
        {
            sprite->invisible = 1;
        }
        sprite->data[6] = (sprite->data[6] + 1) & 0x1f;
    } else
    {
        sprite->invisible = 0;
    }
}

void sub_8100A0C(u8 taskId)
{
    if (sub_8100D38(taskId) == 1)
    {
        fade_screen(1, 0);
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].func = sub_8100E70;
    } else
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecorInUse, sub_80FE428, 0);
    }
}

void sub_8100A60(u8 a0)
{
    ewram_1f000.items[a0] = 0;
    ewram_1f000.pos[a0] = 0;
}

void sub_8100A7C(void)
{
    u16 i;
    gSpecialVar_0x8005 = 0;
    gScriptResult = 0;
    if (gSpecialVar_0x8004 == gUnknown_02039234)
    {
        gScriptResult = 1;
    } else if (gDecorations[ewram_1f000.items[gUnknown_020391B4[gSpecialVar_0x8004].decorId]].permission == DECORPERM_SOLID_MAT)
    {
        gSpecialVar_0x8005 = gUnknown_020391B4[gSpecialVar_0x8004].flagId;
        sub_8100A60(gUnknown_020391B4[gSpecialVar_0x8004].decorId);
        for (i=0; i<gMapHeader.events->mapObjectCount; i++)
        {
            if (gMapHeader.events->mapObjects[i].flagId == gSpecialVar_0x8005)
            {
                gSpecialVar_0x8006 = gMapHeader.events->mapObjects[i].localId;
                break;
            }
        }
    }
}

void sub_8100B20(void)
{
    u8 i;
    for (i=0; i<gMapHeader.events->mapObjectCount; i++)
    {
        if (gMapHeader.events->mapObjects[i].flagId == gSpecialVar_0x8004)
        {
            gSpecialVar_0x8005 = gMapHeader.events->mapObjects[i].localId;
            break;
        }
    }
}

void sub_8100B6C(void)
{
    u8 i;
    u8 j;
    u8 k;
    u8 x;
    u8 y;
    u8 permission;
    for (i=0; i<gUnknown_02039234; i++)
    {
        permission = gDecorations[ewram_1f000.items[gUnknown_020391B4[i].decorId]].permission;
        x = ewram_1f000.pos[gUnknown_020391B4[i].decorId] >> 4;
        y = ewram_1f000.pos[gUnknown_020391B4[i].decorId] & 0xf;
        if (permission != DECORPERM_SOLID_MAT)
        {
            if (ewram_1f000.items[gUnknown_020391B4[i].decorId] == DECOR_SAND_ORNAMENT && MapGridGetMetatileIdAt(x + 7, y + 7) == 0x28c)
            {
                gUnknown_020391B4[i].height++;
            }
            for (j=0; j<gUnknown_020391B4[i].height; j++)
            {
                for (k=0; k<gUnknown_020391B4[i].width; k++)
                {
                    MapGridSetMetatileEntryAt(x + 7 + k, y + 7 - j, ((u16 *)gMapHeader.mapData->map)[(x + k) + gMapHeader.mapData->width * (y - j)] | 0x3000);
                }
            }
            sub_8100A60(gUnknown_020391B4[i].decorId);
        }
    }
}

void sub_8100C88(u8 taskId)
{
    switch (gTasks[taskId].data[2])
    {
        case 0:
            sub_8100B6C();
            gTasks[taskId].data[2] = 1;
            break;
        case 1:
            if (!gPaletteFade.active)
            {
                DrawWholeMapView();
                ScriptContext1_SetupScript(gUnknown_081A2F8A);
                MenuZeroFillWindowRect(0, 0, 29, 19);
                gTasks[taskId].data[2] = 2;
            }
            break;
        case 2:
            ScriptContext2_Enable();
            sub_80FED90(taskId);
            pal_fill_black();
            gTasks[taskId].data[2] = 3;
            break;
        case 3:
            if (sub_807D770() == 1)
            {
                gTasks[taskId].data[13] = -1;
                DisplayItemMessageOnField(taskId, gSecretBaseText_DecorReturned, sub_81010F0, 0);
            }
            break;
    }
}

bool8 sub_8100D38(u8 taskId)
{
    u16 i;
    for (i=0; i<ewram_1f000.size; i++)
    {
        if (ewram_1f000.items[i] != 0)
        {
            gTasks[taskId].data[13] = i;
            return TRUE;
        }
    }
    return FALSE;
}

void SetUpPuttingAwayDecorationPlayerAvatar(void)
{
    player_get_direction_lower_nybble();
    MenuZeroFillWindowRect(0, 0, 29, 19);
    gUnknown_020391A8 = gSprites[gUnknown_03004880.unk4].data[0];
    sub_81016C8();
    gUnknown_03004880.unk4 = CreateSprite(&gSpriteTemplate_83ECA88, 0x78, 0x50, 0);
    if (gSaveBlock2.playerGender == MALE)
    {
        gUnknown_020391A9 = AddPseudoFieldObject(0xc1, SpriteCallbackDummy, 0x88, 0x48, 0);
    } else
    {
        gUnknown_020391A9 = AddPseudoFieldObject(0xc2, SpriteCallbackDummy, 0x88, 0x48, 0);
    }
    gSprites[gUnknown_020391A9].oam.priority = 1;
    DestroySprite(&gSprites[gUnknown_020391A8]);
    gUnknown_020391A8 = gUnknown_03004880.unk4;
    gSprites[gUnknown_020391A8].oam.priority = 1;
}

void sub_8100E70(u8 taskId)
{
    s16 *data;
    data = gTasks[taskId].data;
    switch (data[2])
    {
        case 0:
            if (!gPaletteFade.active)
            {
                sub_80FF0E0(taskId);
                data[2] = 1;
                data[6] = 1;
                data[5] = 1;
                HandleDestroyMenuCursors();
            }
            break;
        case 1:
            SetUpPuttingAwayDecorationPlayerAvatar();
            pal_fill_black();
            data[2] = 2;
            break;
        case 2:
            if (sub_807D770() == TRUE)
            {
                data[12] = 1;
                sub_8100EEC(taskId);
            }
            break;
    }
}

void sub_8100EEC(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    gSprites[gUnknown_020391A8].data[7] = 0;
    gSprites[gUnknown_020391A8].invisible = 0;
    gSprites[gUnknown_020391A8].callback = sub_8101698;
    gSprites[gUnknown_020391A9].pos1.x = 0x88;
    gSprites[gUnknown_020391A9].pos1.y = 0x48;
    gTasks[taskId].data[10] = 0;
    gTasks[taskId].func = sub_8100494;
}

void sub_8100F88(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    sub_810045C();
    sub_8101024(taskId);
}

void sub_8100FB4(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    sub_810045C();
    gSprites[gUnknown_020391A8].invisible = 0;
    gSprites[gUnknown_020391A8].callback = SpriteCallbackDummy;
    DisplayItemMessageOnField(taskId, gSecretBaseText_StopPuttingAwayDecor, sub_810156C, 0);
}

void sub_8101024(u8 taskId)
{
    u8 mtBehavior;
    s16 *data;
    sub_8101460(taskId);
    if (gUnknown_02039234 != 0)
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_ReturnDecor, sub_8101518, 0);
    } else
    {
        data = gTasks[taskId].data;
        mtBehavior = MapGridGetMetatileBehaviorAt(data[0], data[1]);
        if (MetatileBehavior_IsSecretBasePC(mtBehavior) == TRUE || sub_805738C(mtBehavior) == TRUE)
        {
            gSprites[gUnknown_020391A8].invisible = 0;
            gSprites[gUnknown_020391A8].callback = SpriteCallbackDummy;
            DisplayItemMessageOnField(taskId, gSecretBaseText_StopPuttingAwayDecor, sub_810156C, 0);
        } else
        {
            DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecor, sub_81010F0, 0);
        }
    }
}

void sub_81010F0(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
    {
        sub_8100EEC(taskId);
    }
}

void sub_8101118(u8 decorIdx, struct UnkStruct_020391B4 *unk_020391B4)
{
    if (gDecorations[decorIdx].shape == DECORSHAPE_1x1)
    {
        unk_020391B4->width = 1;
        unk_020391B4->height = 1;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_2x1)
    {
        unk_020391B4->width = 2;
        unk_020391B4->height = 1;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_3x1)
    {
        unk_020391B4->width = 3;
        unk_020391B4->height = 1;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_4x2)
    {
        unk_020391B4->width = 4;
        unk_020391B4->height = 2;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_2x2)
    {
        unk_020391B4->width = 2;
        unk_020391B4->height = 2;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_1x2)
    {
        unk_020391B4->width = 1;
        unk_020391B4->height = 2;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_1x3)
    {
        unk_020391B4->width = 1;
        unk_020391B4->height = 3;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_2x4)
    {
        unk_020391B4->width = 2;
        unk_020391B4->height = 4;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_3x3)
    {
        unk_020391B4->width = 3;
        unk_020391B4->height = 3;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_3x2)
    {
        unk_020391B4->width = 3;
        unk_020391B4->height = 2;
    }
}

void sub_8101198(u8 x, u8 y)
{
    gSprites[gUnknown_020391A8].invisible = 1;
    gSprites[gUnknown_020391A8].callback = SpriteCallbackDummy;
    gSprites[gUnknown_020391A9].pos1.x = 0x88 + x * 16;
    gSprites[gUnknown_020391A9].pos1.y = 0x48 + y * 16;
}

bool8 sub_8101200(u8 taskId, u8 decorIdx, struct UnkStruct_020391B4 *unk_020391B4)
{
    u8 x;
    u8 y;
    u8 xOff;
    u8 yOff;
    x = gTasks[taskId].data[0] - 7;
    y = gTasks[taskId].data[1] - 7;
    xOff = ewram_1f000.pos[decorIdx] >> 4;
    yOff = ewram_1f000.pos[decorIdx] & 0xf;
    if (ewram_1f000.items[decorIdx] == DECOR_SAND_ORNAMENT && MapGridGetMetatileIdAt(xOff + 7, yOff + 7) == 0x28c)
    {
        unk_020391B4->height--;
    }
    if (x >= xOff && x < xOff + unk_020391B4->width && y > yOff - unk_020391B4->height && y <= yOff)
    {
        sub_8101198(unk_020391B4->width - (x - xOff + 1), yOff - y);
        return TRUE;
    }
    return FALSE;
}

void sub_81012A0(void)
{
    u8 xOff;
    u8 yOff;
    u16 i;
    xOff = ewram_1f000.pos[gUnknown_020391B4[gUnknown_02039234].decorId] >> 4;
    yOff = ewram_1f000.pos[gUnknown_020391B4[gUnknown_02039234].decorId] & 0xf;
    for (i=0; i<0x40; i++)
    {
        if (gSaveBlock1.mapObjectTemplates[i].x == xOff && gSaveBlock1.mapObjectTemplates[i].y == yOff && !FlagGet(gSaveBlock1.mapObjectTemplates[i].flagId))
        {
            gUnknown_020391B4[gUnknown_02039234].flagId = gSaveBlock1.mapObjectTemplates[i].flagId;
            break;
        }
    }
}

bool8 sub_8101340(u8 taskId)
{
    u16 i;
    for (i=0; i<ewram_1f000.size; i++)
    {
        if (ewram_1f000.items[i] != 0)
        {
            if (gDecorations[ewram_1f000.items[i]].permission == DECORPERM_SOLID_MAT)
            {
                sub_8101118(ewram_1f000.items[i], gUnknown_020391B4);
                if (sub_8101200(taskId, i, gUnknown_020391B4) == TRUE)
                {
                    gUnknown_020391B4->decorId = i;
                    sub_81012A0();
                    gUnknown_02039234 = 1;
                    return TRUE;
                }
            }
        }
    }
    return FALSE;
}

void sub_81013B8(u8 a0, u8 a1, u8 a2, u8 a3)
{
    u8 i;
    u8 xOff;
    u8 yOff;
    u8 decorIdx;
    for (i=0; i<ewram_1f000.size; i++)
    {
        decorIdx = ewram_1f000.items[i];
        xOff = ewram_1f000.pos[i] >> 4;
        yOff = ewram_1f000.pos[i] & 0xf;
        if (decorIdx != 0 && gDecorations[decorIdx].permission == DECORPERM_SOLID_MAT && a0 <= xOff && a1 <= yOff && a2 >= xOff && a3 >= yOff)
        {
            gUnknown_020391B4[gUnknown_02039234].decorId = i;
            sub_81012A0();
            gUnknown_02039234++;
        }
    }
}

#ifdef NONMATCHING
void sub_8101460(u8 taskId)
{
    u8 i;
    u8 xOff;
    u8 yOff;
    gUnknown_02039234 = 0;
    if (sub_8101340(taskId) != TRUE)
    {
        for (i=0; i<ewram_1f000.size; i++)
        {
            if (ewram_1f000.items[i] == 0) // This is using the wrong register!
            {
                continue;
            }
            sub_8101118(ewram_1f000.items[i], gUnknown_020391B4);
            if (sub_8101200(taskId, i, gUnknown_020391B4) == TRUE)
            {
                gUnknown_020391B4[0].decorId = i;
                gUnknown_02039234++;
                break;
            }
        }
        if (gUnknown_02039234 != 0)
        {
            xOff = ewram_1f000.pos[gUnknown_020391B4[0].decorId] >> 4;
            yOff = ewram_1f000.pos[gUnknown_020391B4[0].decorId] & 0xf;
            sub_81013B8(xOff, yOff - gUnknown_020391B4[0].height + 1, xOff + gUnknown_020391B4[0].width - 1, yOff);
        }
    }
}
#else
__attribute__((naked))
void sub_8101460(u8 taskId)
{
    asm(".syntax unified\n"
    "\tpush {r4-r7,lr}\n"
    "\tlsls r0, 24\n"
    "\tlsrs r6, r0, 24\n"
    "\tldr r4, _081014B8 @ =gUnknown_02039234\n"
    "\tmovs r0, 0\n"
    "\tstrb r0, [r4]\n"
    "\tadds r0, r6, 0\n"
    "\tbl sub_8101340\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tcmp r0, 0x1\n"
    "\tbeq _08101504\n"
    "\tmovs r5, 0\n"
    "\tldr r0, _081014BC @ =ewram_1f000\n"
    "\tldrb r1, [r0, 0x8]\n"
    "\tcmp r5, r1\n"
    "\tbcs _081014D2\n"
    "\tadds r7, r4, 0\n"
    "_08101486:\n"
    "\tldr r0, [r0]\n"
    "\tadds r0, r5\n"
    "\tldrb r1, [r0] @ compiler incorrectly uses r0 for this and the next instruction\n"
    "\tcmp r1, 0\n"
    "\tbeq _081014C4\n"
    "\tldr r4, _081014C0 @ =gUnknown_020391B4\n"
    "\tadds r0, r1, 0\n"
    "\tadds r1, r4, 0\n"
    "\tbl sub_8101118\n"
    "\tadds r0, r6, 0\n"
    "\tadds r1, r5, 0\n"
    "\tadds r2, r4, 0\n"
    "\tbl sub_8101200\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tcmp r0, 0x1\n"
    "\tbne _081014C4\n"
    "\tstrb r5, [r4]\n"
    "\tldrb r0, [r7]\n"
    "\tadds r0, 0x1\n"
    "\tstrb r0, [r7]\n"
    "\tb _081014D2\n"
    "\t.align 2, 0\n"
    "_081014B8: .4byte gUnknown_02039234\n"
    "_081014BC: .4byte 0x201f000\n"
    "_081014C0: .4byte gUnknown_020391B4\n"
    "_081014C4:\n"
    "\tadds r0, r5, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r5, r0, 24\n"
    "\tldr r0, _0810150C @ =ewram_1f000\n"
    "\tldrb r1, [r0, 0x8]\n"
    "\tcmp r5, r1\n"
    "\tbcc _08101486\n"
    "_081014D2:\n"
    "\tldr r0, _08101510 @ =gUnknown_02039234\n"
    "\tldrb r0, [r0]\n"
    "\tcmp r0, 0\n"
    "\tbeq _08101504\n"
    "\tldr r0, _0810150C @ =ewram_1f000\n"
    "\tldr r2, _08101514 @ =gUnknown_020391B4\n"
    "\tldrb r1, [r2]\n"
    "\tldr r0, [r0, 0x4]\n"
    "\tadds r0, r1\n"
    "\tldrb r1, [r0]\n"
    "\tlsrs r0, r1, 4\n"
    "\tmovs r3, 0xF\n"
    "\tands r3, r1\n"
    "\tldrb r1, [r2, 0x2]\n"
    "\tsubs r1, r3, r1\n"
    "\tadds r1, 0x1\n"
    "\tlsls r1, 24\n"
    "\tlsrs r1, 24\n"
    "\tldrb r2, [r2, 0x1]\n"
    "\tadds r2, r0\n"
    "\tsubs r2, 0x1\n"
    "\tlsls r2, 24\n"
    "\tlsrs r2, 24\n"
    "\tbl sub_81013B8\n"
    "_08101504:\n"
    "\tpop {r4-r7}\n"
    "\tpop {r0}\n"
    "\tbx r0\n"
    "\t.align 2, 0\n"
    "_0810150C: .4byte 0x201f000\n"
    "_08101510: .4byte gUnknown_02039234\n"
    "_08101514: .4byte gUnknown_020391B4\n"
    ".syntax divided\n");
}
#endif

void sub_8101518(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    DoYesNoFuncWithChoice(taskId, &gUnknown_083EC9CC);
}

void sub_810153C(u8 taskId)
{
    fade_screen(1, 0);
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].func = sub_8100C88;
}

void sub_810156C(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    DoYesNoFuncWithChoice(taskId, &gUnknown_083EC9D4);
}

void sub_8101590(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    sub_81015B0(taskId);
}

void sub_81015B0(u8 taskId)
{
    fade_screen(1, 0);
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].func = sub_81015E0;
}

void sub_81015E0(u8 taskId)
{
    switch (gTasks[taskId].data[2])
    {
        case 0:
            if (!gPaletteFade.active)
            {
                sub_80FF114(taskId);
                gTasks[taskId].data[2] = 1;
            }
            break;
        case 1:
            sub_81016F4();
            gFieldCallback = sub_8101678;
            SetMainCallback2(c2_exit_to_overworld_2_switch);
            DestroyTask(taskId);
            break;
    }
}

void sub_8101648(u8 taskId)
{
    if (sub_807D770() == TRUE)
    {
        gTasks[taskId].func = Task_DecorationPCProcessMenuInput;
    }
}

void sub_8101678(void)
{
    pal_fill_black();
    MenuDisplayMessageBox();
    sub_80FE220();
    CreateTask(sub_8101648, 8);
}

void sub_8101698(struct Sprite *sprite)
{
    sprite->data[0] = (sprite->data[0] + 1) & 0x1f;
    if (sprite->data[0] >= 16)
    {
        sprite->invisible = TRUE;
    } else
    {
        sprite->invisible = FALSE;
    }
}

void sub_81016C8(void)
{
    if (gSaveBlock2.playerGender == MALE)
    {
        LoadSpritePalette(&gUnknown_083ECA5C);
    } else
    {
        LoadSpritePalette(&gUnknown_083ECA64);
    }
}

void sub_81016F4(void)
{
    FreeSpritePaletteByTag(8);
}

void sub_8101700(u8 taskId)
{
    if (!sub_81341D4())
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecors, sub_80FE428, 0);
    } else
    {
        gTasks[taskId].data[11] = 1;
        gUnknown_020388F6 = 0;
        sub_80FE5AC(taskId);
    }
}

void sub_8101750(u8 taskId)
{
    if (!sub_81341D4())
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecors, sub_80FE428, 0);
    } else
    {
        gTasks[taskId].data[11] = 2;
        gUnknown_020388F6 = 0;
        sub_80FE5AC(taskId);
    }
}

void sub_81017A0(u8 taskId)
{
    sub_80FEF74();
    sub_80FED1C();
    if (sub_80FEFA4() == TRUE)
    {
        StringCopy(gStringVar1, gDecorations[gUnknown_020388D0[gUnknown_020388F5]].name);
        StringExpandPlaceholders(gStringVar4, gSecretBaseText_WillBeDiscarded);
        DisplayItemMessageOnField(taskId, gStringVar4, sub_8101824, 0);
    } else
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_DecorInUse, sub_80FEFF4, 0);
    }
}

void sub_8101824(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    DoYesNoFuncWithChoice(taskId, &gUnknown_083ECAA0);
}

void sub_8101848(u8 taskId)
{
    MenuZeroFillWindowRect(20, 8, 27, 14);
    sub_8109A30(gUnknown_020388D0[gUnknown_020388F5]);
    gUnknown_020388D0[gUnknown_020388F5] = DECOR_NONE;
    sub_80FF098(taskId);
    DisplayItemMessageOnField(taskId, gSecretBaseText_DecorThrownAway, sub_80FEFF4, 0);
}
