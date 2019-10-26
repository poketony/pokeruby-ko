#ifndef GUARD_DECORATION_H
#define GUARD_DECORATION_H

#include "task.h"

enum DecoId {
    /*000*/ DECOR_NONE,
    /*001*/ DECOR_SMALL_DESK,
    /*002*/ DECOR_POKEMON_DESK,
    /*003*/ DECOR_HEAVY_DESK,
    /*004*/ DECOR_RAGGED_DESK,
    /*005*/ DECOR_COMFORT_DESK,
    /*006*/ DECOR_PRETTY_DESK,
    /*007*/ DECOR_BRICK_DESK,
    /*008*/ DECOR_CAMP_DESK,
    /*009*/ DECOR_HARD_DESK,
    /*010*/ DECOR_SMALL_CHAIR,
    /*011*/ DECOR_POKEMON_CHAIR,
    /*012*/ DECOR_HEAVY_CHAIR,
    /*013*/ DECOR_PRETTY_CHAIR,
    /*014*/ DECOR_COMFORT_CHAIR,
    /*015*/ DECOR_RAGGED_CHAIR,
    /*016*/ DECOR_BRICK_CHAIR,
    /*017*/ DECOR_CAMP_CHAIR,
    /*018*/ DECOR_HARD_CHAIR,
    /*019*/ DECOR_RED_PLANT,
    /*020*/ DECOR_TROPICAL_PLANT,
    /*021*/ DECOR_PRETTY_FLOWERS,
    /*022*/ DECOR_COLORFUL_PLANT,
    /*023*/ DECOR_BIG_PLANT,
    /*024*/ DECOR_GORGEOUS_PLANT,
    /*025*/ DECOR_RED_BRICK,
    /*026*/ DECOR_YELLOW_BRICK,
    /*027*/ DECOR_BLUE_BRICK,
    /*028*/ DECOR_RED_BALLOON,
    /*029*/ DECOR_BLUE_BALLOON,
    /*030*/ DECOR_YELLOW_BALLOON,
    /*031*/ DECOR_RED_TENT,
    /*032*/ DECOR_BLUE_TENT,
    /*033*/ DECOR_SOLID_BOARD,
    /*034*/ DECOR_SLIDE,
    /*035*/ DECOR_FENCE_LENGTH,
    /*036*/ DECOR_FENCE_WIDTH,
    /*037*/ DECOR_TIRE,
    /*038*/ DECOR_STAND,
    /*039*/ DECOR_MUD_BALL,
    /*040*/ DECOR_BREAKABLE_DOOR,
    /*041*/ DECOR_SAND_ORNAMENT,
    /*042*/ DECOR_SILVER_SHIELD,
    /*043*/ DECOR_GOLD_SHIELD,
    /*044*/ DECOR_GLASS_ORNAMENT,
    /*045*/ DECOR_TV,
    /*046*/ DECOR_ROUND_TV,
    /*047*/ DECOR_CUTE_TV,
    /*048*/ DECOR_GLITTER_MAT,
    /*049*/ DECOR_JUMP_MAT,
    /*050*/ DECOR_SPIN_MAT,
    /*051*/ DECOR_C_LOW_NOTE_MAT,
    /*052*/ DECOR_D_NOTE_MAT,
    /*053*/ DECOR_E_NOTE_MAT,
    /*054*/ DECOR_F_NOTE_MAT,
    /*055*/ DECOR_G_NOTE_MAT,
    /*056*/ DECOR_A_NOTE_MAT,
    /*057*/ DECOR_B_NOTE_MAT,
    /*058*/ DECOR_C_HIGH_NOTE_MAT,
    /*059*/ DECOR_SURF_MAT,
    /*060*/ DECOR_THUNDER_MAT,
    /*061*/ DECOR_FIRE_BLAST_MAT,
    /*062*/ DECOR_POWDER_SNOW_MAT,
    /*063*/ DECOR_ATTRACT_MAT,
    /*064*/ DECOR_FISSURE_MAT,
    /*065*/ DECOR_SPIKES_MAT,
    /*066*/ DECOR_BALL_POSTER,
    /*067*/ DECOR_GREEN_POSTER,
    /*068*/ DECOR_RED_POSTER,
    /*069*/ DECOR_BLUE_POSTER,
    /*070*/ DECOR_CUTE_POSTER,
    /*071*/ DECOR_PIKA_POSTER,
    /*072*/ DECOR_LONG_POSTER,
    /*073*/ DECOR_SEA_POSTER,
    /*074*/ DECOR_SKY_POSTER,
    /*075*/ DECOR_KISS_POSTER,
    /*076*/ DECOR_PICHU_DOLL,
    /*077*/ DECOR_PIKACHU_DOLL,
    /*078*/ DECOR_MARILL_DOLL,
    /*079*/ DECOR_TOGEPI_DOLL,
    /*080*/ DECOR_CYNDAQUIL_DOLL,
    /*081*/ DECOR_CHIKORITA_DOLL,
    /*082*/ DECOR_TOTODILE_DOLL,
    /*083*/ DECOR_JIGGLYPUFF_DOLL,
    /*084*/ DECOR_MEOWTH_DOLL,
    /*085*/ DECOR_CLEFAIRY_DOLL,
    /*086*/ DECOR_DITTO_DOLL,
    /*087*/ DECOR_SMOOCHUM_DOLL,
    /*088*/ DECOR_TREECKO_DOLL,
    /*089*/ DECOR_TORCHIC_DOLL,
    /*090*/ DECOR_MUDKIP_DOLL,
    /*091*/ DECOR_DUSKULL_DOLL,
    /*092*/ DECOR_WYNAUT_DOLL,
    /*093*/ DECOR_BALTOY_DOLL,
    /*094*/ DECOR_KECLEON_DOLL,
    /*095*/ DECOR_AZURILL_DOLL,
    /*096*/ DECOR_SKITTY_DOLL,
    /*097*/ DECOR_SWABLU_DOLL,
    /*098*/ DECOR_GULPIN_DOLL,
    /*099*/ DECOR_LOTAD_DOLL,
    /*100*/ DECOR_SEEDOT_DOLL,
    /*101*/ DECOR_PIKA_CUSHION,
    /*102*/ DECOR_ROUND_CUSHION,
    /*103*/ DECOR_KISS_CUSHION,
    /*104*/ DECOR_ZIGZAG_CUSHION,
    /*105*/ DECOR_SPIN_CUSHION,
    /*106*/ DECOR_DIAMOND_CUSHION,
    /*107*/ DECOR_BALL_CUSHION,
    /*108*/ DECOR_GRASS_CUSHION,
    /*109*/ DECOR_FIRE_CUSHION,
    /*110*/ DECOR_WATER_CUSHION,
    /*111*/ DECOR_SNORLAX_DOLL,
    /*112*/ DECOR_RHYDON_DOLL,
    /*113*/ DECOR_LAPRAS_DOLL,
    /*114*/ DECOR_VENUSAUR_DOLL,
    /*115*/ DECOR_CHARIZARD_DOLL,
    /*116*/ DECOR_BLASTOISE_DOLL,
    /*117*/ DECOR_WAILMER_DOLL,
    /*118*/ DECOR_REGIROCK_DOLL,
    /*119*/ DECOR_REGICE_DOLL,
    /*120*/ DECOR_REGISTEEL_DOLL
};

enum DecorPerm {
    /*
     * The nomenclature here describes collision and placement permissions, in that order.
     */
    DECORPERM_SOLID_FLOOR,
    DECORPERM_PASS_FLOOR,
    DECORPERM_BEHIND_FLOOR,
    DECORPERM_NA_WALL,
    DECORPERM_SOLID_MAT
};

enum DecorShape {
    /*
     * Width-x-height
     */
    DECORSHAPE_1x1,
    DECORSHAPE_2x1,
    DECORSHAPE_3x1, // unused
    DECORSHAPE_4x2,
    DECORSHAPE_2x2,
    DECORSHAPE_1x2,
    DECORSHAPE_1x3, // unused
    DECORSHAPE_2x4,
    DECORSHAPE_3x3,
    DECORSHAPE_3x2
};

enum DecoCat {
    /*
     * In which category you can find the decoration in the PC.
     */
    /*0*/ DECORCAT_DESK,
    /*1*/ DECORCAT_CHAIR,
    /*2*/ DECORCAT_PLANT,
    /*3*/ DECORCAT_ORNAMENT,
    /*4*/ DECORCAT_MAT,
    /*5*/ DECORCAT_POSTER,
    /*6*/ DECORCAT_DOLL,
    /*7*/ DECORCAT_CUSHION
};

struct Decoration
{
    /*0x00*/ u8 id;
    /*0x01*/ u8 name[16];
    /*0x11*/ u8 permission;
    /*0x12*/ u8 shape;
    /*0x13*/ u8 category;
    /*0x14*/ u16 price;
    /*0x18*/ const u8 *description;
    /*0x1c*/ const u16 *tiles;
};

struct DecoPCPointers
{
    /* 0x00 */ u8 *items;
    /* 0x04 */ u8 *pos;
    /* 0x08 */ u8 size;
    /* 0x09 */ u8 isPlayerRoom;
};

struct DecorationInventory
{
    u8 *items;
    u8 size;
};

struct UnkStruct_803EC860
{
    const u8 *tiles;
    const u8 *y;
    const u8 *x;
    u8 size;
};

extern const struct UnkStruct_803EC860 gUnknown_083EC860[];

struct UnkStruct_02038900
{
    /*0x000; 0x02038900*/ const struct Decoration *decoration;
    /*0x004; 0x02038904*/ u16 tiles[0x40];
    /*0x084; 0x02038984*/ u8 image[0x800];
    /*0x884; 0x02039184*/ u16 palette[16];
};

struct UnkStruct_083EC900
{
    u8 shape;
    u8 size;
    u8 x;
    u8 y;
};

struct UnkStruct_020391B4
{
    u8 decorId;
    u8 width;
    u8 height;
    u16 flagId;
};

extern const struct UnkStruct_083EC900 gUnknown_083EC900[];
extern const struct SpritePalette gUnknown_083EC954;
extern const struct SpritePalette gUnknown_083ECA5C;
extern const struct SpritePalette gUnknown_083ECA64;
extern const struct SpriteTemplate gSpriteTemplate_83EC93C;
extern const struct SpriteTemplate gSpriteTemplate_83ECA88;

extern const struct Decoration gDecorations[];
extern struct UnkStruct_02038900 gUnknown_02038900;
extern u8 *gUnknown_020388D0;
extern u8 gUnknown_081A2F7B[];
extern u8 gUnknown_081A2F8A[];
extern struct OamData gUnknown_020391AC;

extern u8 gUnknown_020388D4;
extern u8 gUnknown_020388D5;
extern u8 gUnknown_020388F2;
extern u8 gUnknown_020388F3;
extern u8 gUnknown_020388F4;
extern u8 gUnknown_020388F5;
extern u8 gUnknown_020388F6;
extern u8 gUnknown_020388D6[16];
extern u8 gUnknown_020388E6[12];
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;
extern u16 gSpecialVar_0x8007;
extern u16 gUnknown_020391A4;
extern u16 gUnknown_020391A6;
extern u8 gUnknown_020391A8;
extern u8 gUnknown_020391A9;
extern u8 gUnknown_020391AA;
extern u8 gUnknown_02039234;
extern void (*gFieldCallback)(void);
extern const struct YesNoFuncTable gUnknown_083EC96C[];
extern struct UnkStruct_020391B4 gUnknown_020391B4[16];

extern const u16 gUnknown_083EC654[3];
extern const struct DecorationInventory gDecorationInventories[];
extern const u8 *const gUnknown_083EC5E4[];
extern const u8 *const gUnknown_083EC624[];
extern u8 gUnknown_020388F7[];
extern const struct MenuAction2 gUnknown_083EC604[];
extern const struct YesNoFuncTable gUnknown_083EC634[];
extern const u8 gUnknown_083EC65A[];
extern const u8 gUnknown_083EC97C[];
extern const u8 gUnknown_083EC984[];
extern void sub_80B3068(u8); // src/shop
extern const struct YesNoFuncTable gUnknown_083EC95C;
extern const struct YesNoFuncTable gUnknown_083EC964;
extern const struct YesNoFuncTable gUnknown_083EC9CC;
extern const struct YesNoFuncTable gUnknown_083EC9D4;
extern const struct YesNoFuncTable gUnknown_083ECAA0;

extern u8 sub_8134194(u8); // src/decoration_inventory
extern bool8 sub_81341D4(void); // src/decoration_inventory
extern void sub_8134104(u8); // src/decoration_inventory
extern bool8 sub_807D770(void);
extern void sub_8109DAC(u8); // src/trader
extern void ReshowPlayerPC(u8); // src/player_pc
void Task_SecretBasePC_Decoration(u8);

void Task_SecretBasePC_Decoration(u8 taskId);
void sub_80FE2B4(void);
void Task_DecorationPCProcessMenuInput(u8);
void sub_80FE394(void);
void gpu_pal_decompress_alloc_tag_and_upload(u8);
void sub_80FE5AC(u8);
void sub_80FE604(u8);
void sub_80FE728(u8);
void sub_80FE758(u8);
void sub_80FE7A8(u8);
void sub_80FE7D4(u8 *, u8);
void sub_80FE868(u8);
void sub_80FE948(u8);
void sub_80FEABC(u8, u8);
void sub_80FEC94(u8);
void sub_80FECB8(u8);
void sub_80FECE0(u8);
void sub_80FEF50(u8);
bool8 sub_80FEFA4(void);
void sub_80FF394(u16, u16, u16);
void sub_80FF6AC(u8);
void sub_80FF960(u8);
void AddDecorationIconObjectFromFieldObject(struct UnkStruct_02038900 *, u8);
void SetUpPlacingDecorationPlayerAvatar(u8, struct UnkStruct_02038900 *);
void sub_8100038(u8);
void sub_81000A0(u8);
void sub_8100174(u8);
void sub_8100248(u8);
void sub_810028C(u8);
void c1_overworld_prev_quest(u8);
void sub_8100364(void);
void sub_810045C(void);
void sub_810065C(u8);
void sub_81006A8(u8);
void sub_81006D0(struct UnkStruct_02038900 *);
void sub_810070C(u16 *, u16);
void sub_8100874(struct UnkStruct_02038900 *);
void sub_81008BC(struct UnkStruct_02038900 *);
void sub_8100930(u8);
void sub_81009A8(struct Sprite *);
void sub_81009C0(struct Sprite *);
bool8 sub_8100D38(u8);
void sub_8100E70(u8);
void sub_8100EEC(u8);
void sub_8101024(u8);
void sub_81010F0(u8);
void sub_8101460(u8);
void sub_8101518(u8);
void sub_81015B0(u8);
void sub_81015E0(u8);
void sub_810156C(u8);
void sub_8101678(void);
void sub_8101698(struct Sprite *);
void sub_81016C8(void);
void sub_81016F4(void);
void sub_8101824(u8);
void sub_8109A30(u8);

void sub_80FF160(u8);
void sub_80FF5BC(u8);
void sub_80FF058(u8);
void sub_8100A0C(u8);
void sub_8101700(u8);
void sub_81017A0(u8);
void sub_8109D04(u8);

void sub_80FED3C(u8);
void sub_80FFAB0(u8);
void sub_80FFB08(u8);
void sub_81000C4(u8);
void sub_810026C(u8);
void sub_8100F88(u8);
void sub_8100FB4(u8);
void sub_810153C(u8);
void sub_8101590(u8);
void sub_8101848(u8);
void DoPlayerPCDecoration(u8);

#endif // GUARD_DECORATION_H
