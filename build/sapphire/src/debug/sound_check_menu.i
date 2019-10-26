# 1 "src/debug/sound_check_menu.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/debug/sound_check_menu.c"
# 1 "include/global.h" 1



# 1 "include/gba/gba.h" 1



# 1 "include/gba/defines.h" 1



# 1 "tools/agbcc/include/stddef.h" 1





typedef long int ptrdiff_t;



typedef unsigned long int size_t;






typedef int wchar_t;
# 5 "include/gba/defines.h" 2
# 5 "include/gba/gba.h" 2
# 1 "include/gba/io_reg.h" 1
# 6 "include/gba/gba.h" 2
# 1 "include/gba/types.h" 1



# 1 "tools/agbcc/include/stdint.h" 1
# 31 "tools/agbcc/include/stdint.h"
# 1 "tools/agbcc/include/limits.h" 1
# 32 "tools/agbcc/include/stdint.h" 2



typedef signed char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef long long int64_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;



typedef signed char int_least8_t;
typedef short int_least16_t;
typedef int int_least32_t;
typedef long long int_least64_t;
typedef unsigned char uint_least8_t;
typedef unsigned short uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef int int_fast8_t;
typedef int int_fast16_t;
typedef int int_fast32_t;
typedef long long int_fast64_t;
typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long uint_fast64_t;



typedef int intptr_t;
typedef unsigned int uintptr_t;



typedef long long intmax_t;
typedef unsigned long long uintmax_t;
# 5 "include/gba/types.h" 2

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
typedef int8_t s8;
typedef int16_t s16;
typedef int32_t s32;
typedef int64_t s64;

typedef volatile u8 vu8;
typedef volatile u16 vu16;
typedef volatile u32 vu32;
typedef volatile u64 vu64;
typedef volatile s8 vs8;
typedef volatile s16 vs16;
typedef volatile s32 vs32;
typedef volatile s64 vs64;

typedef float f32;
typedef double f64;

typedef u8 bool8;
typedef u16 bool16;
typedef u32 bool32;

struct PlttData
{
    u16 r:5;
    u16 g:5;
    u16 b:5;
    u16 unused_15:1;
} ;

struct OamData
{
             u32 y:8;
             u32 affineMode:2;
             u32 objMode:2;
             u32 mosaic:1;
             u32 bpp:1;
             u32 shape:2;

             u32 x:9;
             u32 matrixNum:5;
             u32 size:2;

             u16 tileNum:10;
             u16 priority:2;
             u16 paletteNum:4;
             u16 affineParam;
};
# 77 "include/gba/types.h"
struct BgAffineSrcData
{
    s32 texX;
    s32 texY;
    s16 scrX;
    s16 scrY;
    s16 sx;
    s16 sy;
    u16 alpha;
};

struct BgAffineDstData
{
    s16 pa;
    s16 pb;
    s16 pc;
    s16 pd;
    s32 dx;
    s32 dy;
};

struct ObjAffineSrcData
{
    s16 xScale;
    s16 yScale;
    u16 rotation;
};


struct SioMultiCnt
{
    u16 baudRate:2;
    u16 si:1;
    u16 sd:1;
    u16 id:2;
    u16 error:1;
    u16 enable:1;
    u16 unused_11_8:4;
    u16 mode:2;
    u16 intrEnable:1;
    u16 unused_15:1;
    u16 data;
};
# 7 "include/gba/gba.h" 2
# 1 "include/gba/multiboot.h" 1
# 9 "include/gba/multiboot.h"
struct MultiBootParam
{
    u32 system_work[5];
    u8 handshake_data;
    u8 padding;
    u16 handshake_timeout;
    u8 probe_count;
    u8 client_data[3];
    u8 palette_data;
    u8 response_bit;
    u8 client_bit;
    u8 reserved1;
    u8 *boot_srcp;
    u8 *boot_endp;
    u8 *masterp;
    u8 *reserved2[3];
    u32 system_work2[4];
    u8 sendflag;
    u8 probe_target_bit;
    u8 check_wait;
    u8 server_type;
};
# 8 "include/gba/gba.h" 2
# 1 "include/gba/syscall.h" 1
# 14 "include/gba/syscall.h"
void SoftReset(u32 resetFlags);

void RegisterRamReset(u32 resetFlags);

void VBlankIntrWait(void);

u16 Sqrt(u32 num);

u16 ArcTan2(s16 x, s16 y);





void CpuSet(const void *src, void *dest, u32 control);



void CpuFastSet(const void *src, void *dest, u32 control);

void BgAffineSet(struct BgAffineSrcData *src, struct BgAffineDstData *dest, s32 count);

void ObjAffineSet(struct ObjAffineSrcData *src, void *dest, s32 count, s32 offset);

void LZ77UnCompWram(const void *src, void *dest);

void LZ77UnCompVram(const void *src, void *dest);

void RLUnCompWram(const void *src, void *dest);

void RLUnCompVram(const void *src, void *dest);

int MultiBoot(struct MultiBootParam *mp);
# 9 "include/gba/gba.h" 2
# 1 "include/gba/macro.h" 1
# 10 "include/gba/gba.h" 2
# 5 "include/global.h" 2
# 1 "include/config.h" 1
# 6 "include/global.h" 2
# 51 "include/global.h"
enum
{
 B_8 = 1,
 B_16 = 2,
 B_32 = 4
};
# 76 "include/global.h"
enum
{
    VERSION_SAPPHIRE = 1,
    VERSION_RUBY = 2,
    VERSION_EMERALD = 3,
};

enum LanguageId
{
    LANGUAGE_JAPANESE = 1,
    LANGUAGE_ENGLISH = 2,
    LANGUAGE_GERMAN = 5,
};



enum
{
    MALE,
    FEMALE
};

enum
{
    OPTIONS_BUTTON_MODE_NORMAL,
    OPTIONS_BUTTON_MODE_LR,
    OPTIONS_BUTTON_MODE_L_EQUALS_A
};

enum
{
    OPTIONS_TEXT_SPEED_SLOW,
    OPTIONS_TEXT_SPEED_MID,
    OPTIONS_TEXT_SPEED_FAST
};

enum
{
    OPTIONS_SOUND_MONO,
    OPTIONS_SOUND_STEREO
};

enum
{
    OPTIONS_BATTLE_STYLE_SHIFT,
    OPTIONS_BATTLE_STYLE_SET
};

enum
{
    BAG_ITEMS = 1,
    BAG_POKEBALLS,
    BAG_TMsHMs,
    BAG_BERRIES,
    BAG_KEYITEMS
};

struct Coords16
{
    s16 x;
    s16 y;
};

struct UCoords16
{
    u16 x;
    u16 y;
};

struct SecretBaseRecord
{
               u8 secretBaseId;
               u8 sbr_field_1_0:4;
               u8 gender:1;
               u8 sbr_field_1_5:1;
               u8 sbr_field_1_6:2;
               u8 playerName[7];
               u8 trainerId[4];
               u16 sbr_field_e;
               u8 sbr_field_10;
               u8 sbr_field_11;
               u8 decorations[16];
               u8 decorationPos[16];
               u32 partyPersonality[6];
               u16 partyMoves[6 * 4];
               u16 partySpecies[6];
               u16 partyHeldItems[6];
               u8 partyLevels[6];
               u8 partyEVs[6];
};

# 1 "include/game_stat.h" 1
# 168 "include/global.h" 2
# 1 "include/global.fieldmap.h" 1



enum
{
    CONNECTION_SOUTH = 1,
    CONNECTION_NORTH,
    CONNECTION_WEST,
    CONNECTION_EAST,
    CONNECTION_DIVE,
    CONNECTION_EMERGE
};


enum
{
    MAP_TYPE_0,
    MAP_TYPE_TOWN,
    MAP_TYPE_CITY,
    MAP_TYPE_ROUTE,
    MAP_TYPE_UNDERGROUND,
    MAP_TYPE_UNDERWATER,
    MAP_TYPE_6,
    MAP_TYPE_7,
    MAP_TYPE_INDOOR,
    MAP_TYPE_SECRET_BASE
};


enum
{
    MAP_BATTLE_SCENE_NORMAL,
    MAP_BATTLE_SCENE_GYM,
    MAP_BATTLE_SCENE_MAGMA,
    MAP_BATTLE_SCENE_AQUA,
    MAP_BATTLE_SCENE_SIDNEY,
    MAP_BATTLE_SCENE_PHOEBE,
    MAP_BATTLE_SCENE_GLACIA,
    MAP_BATTLE_SCENE_DRAKE,
    MAP_BATTLE_SCENE_BATTLE_TOWER,
};

typedef void (*TilesetCB)(void);

struct Tileset
{
             bool8 isCompressed;
             bool8 isSecondary;
             void *tiles;
             void *palettes;
             void *metatiles;
             void *metatileAttributes;
             TilesetCB callback;
};

struct MapData
{
             s32 width;
             s32 height;
             u16 *border;
             u16 *map;
             struct Tileset *primaryTileset;
             struct Tileset *secondaryTileset;
};

struct BackupMapData
{
    s32 width;
    s32 height;
    u16 *map;
};

struct MapObjectTemplate
{
             u8 localId;
             u8 graphicsId;
             u8 unk2;
             s16 x;
             s16 y;
             u8 elevation;
             u8 movementType;
             u8 unkA_0:4;
             u8 unkA_4:4;

             u16 unkC;
             u16 unkE;
             u8 *script;
             u16 flagId;
             u8 filler_16[2];
};

struct WarpEvent
{
    s16 x, y;
    s8 warpId;
    u8 mapGroup;
    u8 mapNum;
    u8 unk7;
};

struct CoordEvent
{
    s16 x, y;
    u8 unk4;
    u8 filler_5;
    u16 trigger;
    u16 index;
    u8 filler_A[0x2];
    u8 *script;
};

struct BgEvent
{
            u16 x;
            u16 y;
            u8 unk4;
            u8 kind;
            union {

        u8 *script;


        struct {
            u8 filler6[0x2];
            u16 hiddenItemId;
        } hiddenItem;


        u32 secretBaseId;

    } bgUnion;
};

struct MapEvents
{
    u8 mapObjectCount;
    u8 warpCount;
    u8 coordEventCount;
    u8 bgEventCount;

    struct MapObjectTemplate *mapObjects;
    struct WarpEvent *warps;
    struct CoordEvent *coordEvents;
    struct BgEvent *bgEvents;
};

struct MapConnection
{
          u8 direction;
          u32 offset;
          u8 mapGroup;
          u8 mapNum;
};

struct MapConnections
{
    s32 count;
    struct MapConnection *connections;
};

struct MapHeader
{
               struct MapData *mapData;
               struct MapEvents *events;
               u8 *mapScripts;
               struct MapConnections *connections;
               u16 music;
               u16 mapDataId;
               u8 regionMapSectionId;
               u8 cave;
               u8 weather;
               u8 mapType;
               u8 filler_18;
               u8 escapeRope;
               u8 flags;
               u8 battleType;
};

struct MapObject
{
             u32 active:1;
             u32 mapobj_bit_1:1;
             u32 mapobj_bit_2:1;
             u32 mapobj_bit_3:1;
             u32 mapobj_bit_4:1;
             u32 mapobj_bit_5:1;
             u32 mapobj_bit_6:1;
             u32 mapobj_bit_7:1;
             u32 mapobj_bit_8:1;
             u32 mapobj_bit_9:1;
             u32 mapobj_bit_10:1;
             u32 mapobj_bit_11:1;
             u32 mapobj_bit_12:1;
             u32 mapobj_bit_13:1;
             u32 mapobj_bit_14:1;
             u32 mapobj_bit_15:1;
             u32 mapobj_bit_16:1;
             u32 mapobj_bit_17:1;
             u32 mapobj_bit_18:1;
             u32 mapobj_bit_19:1;
             u32 mapobj_bit_20:1;
             u32 mapobj_bit_21:1;
             u32 mapobj_bit_22:1;
             u32 mapobj_bit_23:1;
             u32 mapobj_bit_24:1;
             u32 mapobj_bit_25:1;
             u32 mapobj_bit_26:1;
             u32 mapobj_bit_27:1;
             u32 mapobj_bit_28:1;
             u32 mapobj_bit_29:1;
             u32 mapobj_bit_30:1;
             u32 mapobj_bit_31:1;
             u8 spriteId;
             u8 graphicsId;
             u8 animPattern;
             u8 trainerType;
             u8 localId;
             u8 mapNum;
             u8 mapGroup;
             u8 mapobj_unk_0B_0:4;
             u8 elevation:4;
             struct Coords16 coords1;
             struct Coords16 coords2;
             struct Coords16 coords3;
             u8 mapobj_unk_18:4;
             u8 placeholder18:4;
             u8 mapobj_unk_19;
             u8 mapobj_unk_1A;
             u8 mapobj_unk_1B;
             u8 mapobj_unk_1C;
             u8 trainerRange_berryTreeId;
             u8 mapobj_unk_1E;
             u8 mapobj_unk_1F;
             u8 mapobj_unk_20;
             u8 mapobj_unk_21;
             u8 animId;

};


struct MapObject2
{
             u32 active:1;
             u32 mapobj_bit_1:1;
             u32 mapobj_bit_2:1;
             u32 mapobj_bit_3:1;
             u32 mapobj_bit_4:1;
             u32 mapobj_bit_5:1;
             u32 mapobj_bit_6:1;
             u32 mapobj_bit_7:1;
             u32 mapobj_bit_8:1;
             u32 mapobj_bit_9:1;
             u32 mapobj_bit_10:1;
             u32 mapobj_bit_11:1;
             u32 mapobj_bit_12:1;
             u32 mapobj_bit_13:1;
             u32 mapobj_bit_14:1;
             u32 mapobj_bit_15:1;
             u32 mapobj_bit_16:1;
             u32 mapobj_bit_17:1;
             u32 mapobj_bit_18:1;
             u32 mapobj_bit_19:1;
             u32 mapobj_bit_20:1;
             u32 mapobj_bit_21:1;
             u32 mapobj_bit_22:1;
             u32 mapobj_bit_23:1;
             u32 mapobj_bit_24:1;
             u32 mapobj_bit_25:1;
             u32 mapobj_bit_26:1;
             u32 mapobj_bit_27:1;
             u32 mapobj_bit_28:1;
             u32 mapobj_bit_29:1;
             u32 mapobj_bit_30:1;
             u32 mapobj_bit_31:1;
             u8 spriteId;
             u8 graphicsId;
             u8 animPattern;
             u8 trainerType;
             u8 localId;
             u8 mapNum;
             u8 mapGroup;
             u8 mapobj_unk_0B_0:4;
             u8 elevation:4;
             struct Coords16 coords1;
             struct Coords16 coords2;
             struct Coords16 coords3;
             u8 mapobj_unk_18:4;
             u8 placeholder18:4;
             u8 mapobj_unk_19:4;
             u8 mapobj_unk_19b:4;
             u8 mapobj_unk_1A;
             u8 mapobj_unk_1B;
             u8 mapobj_unk_1C;
             u8 trainerRange_berryTreeId;
             u8 mapobj_unk_1E;
             u8 mapobj_unk_1F;
             u8 mapobj_unk_20;
             u8 mapobj_unk_21;

};

struct MapObjectGraphicsInfo
{
             u16 tileTag;
             u16 paletteTag1;
             u16 paletteTag2;
             u16 size;
             s16 width;
             s16 height;
             u8 paletteSlot:4;
             u8 shadowSize:2;
             u8 inanimate:1;
             u8 disableReflectionPaletteLoad:1;
             u8 tracks;
             const struct OamData *oam;
             const struct SubspriteTable *subspriteTables;
             const union AnimCmd *const *anims;
             const struct SpriteFrameImage *images;
             const union AffineAnimCmd *const *affineAnims;
};
# 331 "include/global.fieldmap.h"
enum
{
    ACRO_BIKE_NORMAL,
    ACRO_BIKE_TURNING,
    ACRO_BIKE_WHEELIE_STANDING,
    ACRO_BIKE_BUNNY_HOP,
    ACRO_BIKE_WHEELIE_MOVING,
    ACRO_BIKE_STATE5,
    ACRO_BIKE_STATE6,
};

enum
{
    DIR_NONE,
    DIR_SOUTH,
    DIR_NORTH,
    DIR_WEST,
    DIR_EAST,
};

enum
{
    COLLISION_LEDGE_JUMP = 6
};


enum
{
    NOT_MOVING,
    TURN_DIRECTION,
    MOVING,
};


enum
{
    T_NOT_MOVING,
    T_TILE_TRANSITION,
    T_TILE_CENTER,
};

struct PlayerAvatar
{
             u8 flags;
             u8 unk1;
             u8 runningState;
             u8 tileTransitionState;
             u8 spriteId;
             u8 mapObjectId;
             bool8 preventStep;
             u8 gender;
             u8 acroBikeState;
             u8 newDirBackup;
             u8 bikeFrameCounter;
             u8 bikeSpeed;

             u32 directionHistory;
             u32 abStartSelectHistory;

             u8 dirTimerHistory[8];
             u8 abStartSelectTimerHistory[8];
};

struct Camera
{
    bool8 field_0:1;
    s32 x;
    s32 y;
};

extern struct MapObject gMapObjects[];
extern u8 gSelectedMapObject;
extern struct MapHeader gMapHeader;
extern struct PlayerAvatar gPlayerAvatar;
# 169 "include/global.h" 2
# 1 "include/global.berry.h" 1



struct Berry
{
             const u8 name[7];
             u8 firmness;
             u16 size;
             u8 maxYield;
             u8 minYield;
             const u8 *description1;
             const u8 *description2;
             u8 stageDuration;
             u8 spicy;
             u8 dry;
             u8 sweet;
             u8 bitter;
             u8 sour;
             u8 smoothness;
};

struct EnigmaBerry
{
              struct Berry berry;
              u8 pic[(6 * 6) * 32];
              u16 palette[16];
              u8 description1[45];
              u8 description2[45];
              u8 itemEffect[18];
              u8 holdEffect;
              u8 holdEffectParam;
              u32 checksum;
};

struct BattleEnigmaBerry
{
             u8 name[7];
             u8 holdEffect;
             u8 itemEffect[18];
             u8 holdEffectParam;
};

struct BerryTree
{
             u8 berry;
             u8 stage:7;





             bool8 growthSparkle:1;
             u16 minutesUntilNextStage;
             u8 berryYield;
             u8 regrowthCount:4;
             u8 watered1:1;
             u8 watered2:1;
             u8 watered3:1;
             u8 watered4:1;
};
# 170 "include/global.h" 2
# 1 "include/pokemon.h" 1



# 1 "include/sprite.h" 1





struct SpriteSheet
{
    const u8 *data;
    u16 size;
    u16 tag;
};

struct CompressedSpriteSheet
{
    const u8 *data;
    u16 size;
    u16 tag;
};

struct SpriteFrameImage
{
    const u8 *data;
    u16 size;
};



struct SpritePalette
{
    const u16 *data;
    u16 tag;
};

struct CompressedSpritePalette
{
    const u8 *data;
    u16 tag;
};

struct AnimFrameCmd
{


    u32 imageValue:16;

    u32 duration:6;
    u32 hFlip:1;
    u32 vFlip:1;
};

struct AnimLoopCmd
{
    u32 type:16;
    u32 count:6;
};

struct AnimJumpCmd
{
    u32 type:16;
    u32 target:6;
};




union AnimCmd
{
    s16 type;
    struct AnimFrameCmd frame;
    struct AnimLoopCmd loop;
    struct AnimJumpCmd jump;
};
# 83 "include/sprite.h"
struct AffineAnimFrameCmd
{
    s16 xScale;
    s16 yScale;
    u8 rotation;
    u8 duration;
};

struct AffineAnimLoopCmd
{
    s16 type;
    s16 count;
};

struct AffineAnimJumpCmd
{
    s16 type;
    u16 target;
};

union AffineAnimCmd
{
    s16 type;
    struct AffineAnimFrameCmd frame;
    struct AffineAnimLoopCmd loop;
    struct AffineAnimJumpCmd jump;
};
# 128 "include/sprite.h"
struct AffineAnimState
{
    u8 animNum;
    u8 animCmdIndex;
    u8 delayCounter;
    u8 loopCounter;
    s16 xScale;
    s16 yScale;
    u16 rotation;
};

enum
{
    SUBSPRITES_OFF,
    SUBSPRITES_ON,
    SUBSPRITES_IGNORE_PRIORITY,
};

struct Subsprite
{
    u16 x;
    u16 y;
    u16 shape:2;
    u16 size:2;
    u16 tileOffset:10;
    u16 priority:2;
};

struct SubspriteTable
{
    u8 subspriteCount;
    const struct Subsprite *subsprites;
};

struct Sprite;

struct SpriteTemplate
{
    u16 tileTag;
    u16 paletteTag;
    const struct OamData *oam;
    const union AnimCmd *const *anims;
    const struct SpriteFrameImage *images;
    const union AffineAnimCmd *const *affineAnims;
    void (*callback)(struct Sprite *);
};

struct Sprite
{
             struct OamData oam;
             const union AnimCmd *const *anims;
             const struct SpriteFrameImage *images;
             const union AffineAnimCmd *const *affineAnims;
             const struct SpriteTemplate *template;
             const struct SubspriteTable *subspriteTables;
             void (*callback)(struct Sprite *);

             struct Coords16 pos1;
             struct Coords16 pos2;
             s8 centerToCornerVecX;
             s8 centerToCornerVecY;

             u8 animNum;
             u8 animCmdIndex;
             u8 animDelayCounter:6;
             u8 animPaused:1;
             u8 affineAnimPaused:1;
             u8 animLoopCounter;


             s16 data[8];

             u16 inUse:1;
             u16 coordOffsetEnabled:1;
             u16 invisible:1;
             u16 flags_3:1;
             u16 flags_4:1;
             u16 flags_5:1;
             u16 flags_6:1;
             u16 flags_7:1;
             u16 hFlip:1;
             u16 vFlip:1;
             u16 animBeginning:1;
             u16 affineAnimBeginning:1;
             u16 animEnded:1;
             u16 affineAnimEnded:1;
             u16 usingSheet:1;
             u16 flags_f:1;

             u16 sheetTileStart;

             u8 subspriteTableNum:6;
             u8 subspriteMode:2;

             u8 subpriority;
};

extern const struct OamData gDummyOamData;
extern const union AnimCmd *const gDummySpriteAnimTable[];
extern const union AffineAnimCmd *const gDummySpriteAffineAnimTable[];

extern s16 gSpriteCoordOffsetX;
extern s16 gSpriteCoordOffsetY;

extern struct Sprite gSprites[];

void ResetSpriteData(void);
void AnimateSprites(void);
void BuildOamBuffer(void);
u8 CreateSprite(const struct SpriteTemplate *template, s16 x, s16 y, u8 subpriority);
u8 CreateSpriteAtEnd(const struct SpriteTemplate *template, s16 x, s16 y, u8 subpriority);
u8 CreateInvisibleSprite(void (*callback)(struct Sprite *));
u8 CreateSpriteAndAnimate(struct SpriteTemplate *template, s16 x, s16 y, u8 subpriority);
void DestroySprite(struct Sprite *sprite);
void ResetOamRange(u8 a, u8 b);
void LoadOam(void);
void SetOamMatrix(u8 matrixNum, u16 a, u16 b, u16 c, u16 d);
void CalcCenterToCornerVec(struct Sprite *sprite, u8 shape, u8 size, u8 affineMode);
void SpriteCallbackDummy(struct Sprite *sprite);
void ProcessSpriteCopyRequests(void);
void RequestSpriteCopy(const void *src, u8 *dest, u16 size);
void FreeSpriteTiles(struct Sprite *sprite);
void FreeSpritePalette(struct Sprite *sprite);
void FreeSpriteOamMatrix(struct Sprite *sprite);
void DestroySpriteAndFreeResources(struct Sprite *sprite);
void DrawPartyMenuMonText(u32 a1, u32 a2, const u16 *a3, u16 a4, u32 a5);
void AnimateSprite(struct Sprite *sprite);
void StartSpriteAnim(struct Sprite *sprite, u8 animNum);
void StartSpriteAnimIfDifferent(struct Sprite *sprite, u8 animNum);
void SeekSpriteAnim(struct Sprite *sprite, u8 animCmdIndex);
void StartSpriteAffineAnim(struct Sprite *sprite, u8 animNum);
void StartSpriteAffineAnimIfDifferent(struct Sprite *sprite, u8 animNum);
void ChangeSpriteAffineAnim(struct Sprite *sprite, u8 animNum);
void ChangeSpriteAffineAnimIfDifferent(struct Sprite *sprite, u8 animNum);
void SetSpriteSheetFrameTileNum(struct Sprite *sprite);
u8 AllocOamMatrix(void);
void FreeOamMatrix(u8 matrixNum);
void InitSpriteAffineAnim(struct Sprite *sprite);
void SetOamMatrixRotationScaling(u8 matrixNum, s16 xScale, s16 yScale, u16 rotation);
u16 LoadSpriteSheet(const struct SpriteSheet *sheet);
void LoadSpriteSheets(const struct SpriteSheet *sheets);
u16 AllocTilesForSpriteSheet(struct SpriteSheet *sheet);
void AllocTilesForSpriteSheets(struct SpriteSheet *sheets);
void LoadTilesForSpriteSheet(const struct SpriteSheet *sheet);
void LoadTilesForSpriteSheets(struct SpriteSheet *sheets);
void FreeSpriteTilesByTag(u16 tag);
void FreeSpriteTileRanges(void);
u16 GetSpriteTileStartByTag(u16 tag);
u16 GetSpriteTileTagByTileStart(u16 start);
void RequestSpriteSheetCopy(const struct SpriteSheet *sheet);
u16 LoadSpriteSheetDeferred(const struct SpriteSheet *sheet);
void FreeAllSpritePalettes(void);
u8 LoadSpritePalette(const struct SpritePalette *palette);
void LoadSpritePalettes(const struct SpritePalette *palettes);
u8 AllocSpritePalette(u16 tag);
u8 IndexOfSpritePaletteTag(u16 tag);
u16 GetSpritePaletteTagByPaletteNum(u8 paletteNum);
void FreeSpritePaletteByTag(u16 tag);
void SetSubspriteTables(struct Sprite *sprite, const struct SubspriteTable *subspriteTables);
bool8 AddSpriteToOamBuffer(struct Sprite *object, u8 *oamIndex);
bool8 AddSubspritesToOamBuffer(struct Sprite *sprite, struct OamData *destOam, u8 *oamIndex);
void CopyToSprites(u8 *src);
void CopyFromSprites(u8 *dest);
u8 SpriteTileAllocBitmapOp(u16 bit, u8 op);

extern const union AffineAnimCmd *const gDummySpriteAffineAnimTable[];

extern const struct SpriteTemplate gDummySpriteTemplate;
# 5 "include/pokemon.h" 2
# 126 "include/pokemon.h"
enum {
    EGG_GROUP_NONE,
    EGG_GROUP_MONSTER,
    EGG_GROUP_WATER_1,
    EGG_GROUP_BUG,
    EGG_GROUP_FLYING,
    EGG_GROUP_FIELD,
    EGG_GROUP_FAIRY,
    EGG_GROUP_GRASS,
    EGG_GROUP_HUMAN_LIKE,
    EGG_GROUP_WATER_3,
    EGG_GROUP_MINERAL,
    EGG_GROUP_AMORPHOUS,
    EGG_GROUP_WATER_2,
    EGG_GROUP_DITTO,
    EGG_GROUP_DRAGON,
    EGG_GROUP_UNDISCOVERED
};

enum {
    NATURE_HARDY,
    NATURE_LONELY,
    NATURE_BRAVE,
    NATURE_ADAMANT,
    NATURE_NAUGHTY,
    NATURE_BOLD,
    NATURE_DOCILE,
    NATURE_RELAXED,
    NATURE_IMPISH,
    NATURE_LAX,
    NATURE_TIMID,
    NATURE_HASTY,
    NATURE_SERIOUS,
    NATURE_JOLLY,
    NATURE_NAIVE,
    NATURE_MODEST,
    NATURE_MILD,
    NATURE_QUIET,
    NATURE_BASHFUL,
    NATURE_RASH,
    NATURE_CALM,
    NATURE_GENTLE,
    NATURE_SASSY,
    NATURE_CAREFUL,
    NATURE_QUIRKY,
};

struct PokemonSubstruct0
{
    u16 species;
    u16 heldItem;
    u32 experience;
    u8 ppBonuses;
    u8 friendship;
};

struct PokemonSubstruct1
{
    u16 moves[4];
    u8 pp[4];
};

struct PokemonSubstruct2
{
    u8 hpEV;
    u8 attackEV;
    u8 defenseEV;
    u8 speedEV;
    u8 spAttackEV;
    u8 spDefenseEV;
    u8 cool;
    u8 beauty;
    u8 cute;
    u8 smart;
    u8 tough;
    u8 sheen;
};

struct PokemonSubstruct3
{
             u8 pokerus;
             u8 metLocation;

             u16 metLevel:7;
             u16 metGame:4;
             u16 pokeball:4;
             u16 otGender:1;

             u32 hpIV:5;
             u32 attackIV:5;
             u32 defenseIV:5;
             u32 speedIV:5;
             u32 spAttackIV:5;
             u32 spDefenseIV:5;
             u32 isEgg:1;
             u32 altAbility:1;

             u32 coolRibbon:3;
             u32 beautyRibbon:3;
             u32 cuteRibbon:3;
             u32 smartRibbon:3;
             u32 toughRibbon:3;
             u32 championRibbon:1;
             u32 winningRibbon:1;
             u32 victoryRibbon:1;
             u32 artistRibbon:1;
             u32 effortRibbon:1;
             u32 giftRibbon1:1;
             u32 giftRibbon2:1;
             u32 giftRibbon3:1;
             u32 giftRibbon4:1;
             u32 giftRibbon5:1;
             u32 giftRibbon6:1;
             u32 giftRibbon7:1;
             u32 fatefulEncounter:5;
};

union PokemonSubstruct
{
    struct PokemonSubstruct0 type0;
    struct PokemonSubstruct1 type1;
    struct PokemonSubstruct2 type2;
    struct PokemonSubstruct3 type3;
    u16 raw[6];
};

struct BoxPokemon
{
             u32 personality;
             u32 otId;
             u8 nickname[10];
             u8 language;
             u8 isBadEgg:1;
             u8 hasSpecies:1;
             u8 isEgg:1;
             u8 unused:5;
             u8 otName[7];
             u8 markings;
             u16 checksum;
             u16 unknown;

    union
    {
        u32 raw[12];
        union PokemonSubstruct substructs[4];
    } secure;
};

struct Pokemon
{
             struct BoxPokemon box;
             u32 status;
             u8 level;
             u8 mail;
             u16 hp;
             u16 maxHP;
             u16 attack;
             u16 defense;
             u16 speed;
             u16 spAttack;
             u16 spDefense;
};

struct UnknownPokemonStruct
{
            u16 species;
            u16 heldItem;
            u16 moves[4];
            u8 level;
            u8 ppBonuses;
            u8 hpEV;
            u8 attackEV;
            u8 defenseEV;
            u8 speedEV;
            u8 spAttackEV;
            u8 spDefenseEV;
            u32 otId;
            u32 hpIV:5;
            u32 attackIV:5;
            u32 defenseIV:5;
            u32 speedIV:5;
            u32 spAttackIV:5;
            u32 spDefenseIV:5;
            u32 gap:1;
            u32 altAbility:1;
            u32 personality;
            u8 nickname[10 + 1];
            u8 friendship;
};

struct BattlePokemon
{
             u16 species;
             u16 attack;
             u16 defense;
             u16 speed;
             u16 spAttack;
             u16 spDefense;
             u16 moves[4];
             u32 hpIV:5;
             u32 attackIV:5;
             u32 defenseIV:5;
             u32 speedIV:5;
             u32 spAttackIV:5;
             u32 spDefenseIV:5;
             u32 isEgg:1;
             u32 altAbility:1;
             s8 statStages[8];
             u8 ability;
             u8 type1;
             u8 type2;
             u8 unknown;
             u8 pp[4];
             u16 hp;
             u8 level;
             u8 friendship;
             u16 maxHP;
             u16 item;
             u8 nickname[10 + 1];
             u8 ppBonuses;
             u8 otName[8];
             u32 experience;
             u32 personality;
             u32 status1;
             u32 status2;
             u32 otId;
};

enum
{
    STAT_STAGE_HP,
    STAT_STAGE_ATK,
    STAT_STAGE_DEF,
    STAT_STAGE_SPEED,
    STAT_STAGE_SPATK,
    STAT_STAGE_SPDEF,
    STAT_STAGE_ACC,
    STAT_STAGE_EVASION,
};

struct BaseStats
{
             u8 baseHP;
             u8 baseAttack;
             u8 baseDefense;
             u8 baseSpeed;
             u8 baseSpAttack;
             u8 baseSpDefense;
             u8 type1;
             u8 type2;
             u8 catchRate;
             u8 expYield;
             u16 evYield_HP:2;
             u16 evYield_Attack:2;
             u16 evYield_Defense:2;
             u16 evYield_Speed:2;
             u16 evYield_SpAttack:2;
             u16 evYield_SpDefense:2;
             u16 item1;
             u16 item2;
             u8 genderRatio;
             u8 eggCycles;
             u8 friendship;
             u8 growthRate;
             u8 eggGroup1;
             u8 eggGroup2;
             u8 ability1;
             u8 ability2;
             u8 safariZoneFleeRate;
             u8 bodyColor:7;
             u8 noFlip:1;
};

struct BattleMove
{
    u8 effect;
    u8 power;
    u8 type;
    u8 accuracy;
    u8 pp;
    u8 secondaryEffectChance;
    u8 target;
    u8 priority;
    u8 flags;
    u8 pad[3];
};







struct PokemonStorage
{
               u8 currentBox;
               struct BoxPokemon boxes[14][30];
               u8 boxNames[14][17];
               u8 unkArray[14];
};

struct SpindaSpot
{
    u8 x, y;
    u16 image[16];
};

struct __attribute__((packed)) LevelUpMove {
    u16 move:9;
    u16 level:7;
};

enum {
    GROWTH_MEDIUM_FAST,
    GROWTH_ERRATIC,
    GROWTH_FLUCTUATING,
    GROWTH_MEDIUM_SLOW,
    GROWTH_FAST,
    GROWTH_SLOW
};

enum {
    BODY_COLOR_RED,
    BODY_COLOR_BLUE,
    BODY_COLOR_YELLOW,
    BODY_COLOR_GREEN,
    BODY_COLOR_BLACK,
    BODY_COLOR_BROWN,
    BODY_COLOR_PURPLE,
    BODY_COLOR_GRAY,
    BODY_COLOR_WHITE,
    BODY_COLOR_PINK
};
# 476 "include/pokemon.h"
struct Evolution
{
    u16 method;
    u16 param;
    u16 targetSpecies;
};

struct EvolutionData
{
    struct Evolution evolutions[5];
};

extern u8 gPlayerPartyCount;
extern struct Pokemon gPlayerParty[6];
extern u8 gEnemyPartyCount;
extern struct Pokemon gEnemyParty[6];
extern const u8 *const gItemEffectTable[];
extern const struct BaseStats gBaseStats[];
extern const u32 gExperienceTables[][101];
extern const u16 *const gLevelUpLearnsets[];
extern const struct EvolutionData gEvolutionTable[];
extern struct PokemonStorage gPokemonStorage;

void ZeroBoxMonData(struct BoxPokemon *boxMon);
void ZeroMonData(struct Pokemon *mon);
void ZeroPlayerPartyMons(void);
void ZeroEnemyPartyMons(void);
void CreateMon(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId);
void CreateBoxMon(struct BoxPokemon *boxMon, u16 species, u8 level, u8 fixedIV, u8 hasFixedPersonality, u32 fixedPersonality, u8 otIdType, u32 fixedOtId);
void CreateMonWithNature(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 nature);
void CreateMonWithGenderNatureLetter(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 gender, u8 nature, u8 unownLetter);
void CreateMaleMon(struct Pokemon *mon, u16 species, u8 level);
void CreateMonWithIVsPersonality(struct Pokemon *mon, u16 species, u8 level, u32 ivs, u32 personality);
void CreateMonWithIVsOTID(struct Pokemon *mon, u16 species, u8 level, u8 *ivs, u32 otId);
void CreateMonWithEVSpread(struct Pokemon *mon, u16 species, u8 level, u8 fixedIV, u8 evSpread);
void sub_803ADE8(struct Pokemon *mon, struct UnknownPokemonStruct *src);
void sub_803AF78(struct Pokemon *mon, struct UnknownPokemonStruct *dest);
u16 CalculateBoxMonChecksum(struct BoxPokemon *boxMon);
void CalculateMonStats(struct Pokemon *mon);
void sub_803B4B4(const struct BoxPokemon *src, struct Pokemon *dest);
u8 GetLevelFromMonExp(struct Pokemon *mon);
u8 GetLevelFromBoxMonExp(struct BoxPokemon *boxMon);
u16 GiveMoveToMon(struct Pokemon *mon, u16 move);
u16 GiveMoveToBoxMon(struct BoxPokemon *boxMon, u16 move);
u16 GiveMoveToBattleMon(struct BattlePokemon *mon, u16 move);
void SetMonMoveSlot(struct Pokemon *mon, u16 move, u8 slot);
void SetBattleMonMoveSlot(struct BattlePokemon *mon, u16 move, u8 slot);
void GiveMonInitialMoveset(struct Pokemon *mon);
void GiveBoxMonInitialMoveset(struct BoxPokemon *boxMon);
u16 MonTryLearningNewMove(struct Pokemon *mon, bool8 firstMove);
void DeleteFirstMoveAndGiveMoveToMon(struct Pokemon *mon, u16 move);
void DeleteFirstMoveAndGiveMoveToBoxMon(struct BoxPokemon *boxMon, u16 move);

u8 CountAliveMons(u8 a1);
u8 sub_803C434(u8 a1);
u8 GetMonGender(struct Pokemon *mon);
u8 GetBoxMonGender(struct BoxPokemon *boxMon);
u8 GetGenderFromSpeciesAndPersonality(u16 species, u32 personality);
void GetMonSpriteTemplate_803C56C(u16 species, u8 a2);
void GetMonSpriteTemplate_803C5A0(u16 species, u8 a2);
void EncryptBoxMon(struct BoxPokemon *boxMon);
void DecryptBoxMon(struct BoxPokemon *boxMon);
union PokemonSubstruct *GetSubstruct(struct BoxPokemon *boxMon, u32 personality, u8 substructType);







u32 GetMonData();
u32 GetBoxMonData();
void SetMonData();
void SetBoxMonData();

void CopyMon(void *dest, void *src, size_t size);
u8 GiveMonToPlayer(struct Pokemon *mon);
u8 SendMonToPC(struct Pokemon *mon);
u8 CalculatePlayerPartyCount(void);
u8 CalculateEnemyPartyCount(void);
u8 sub_803DAA0(void);
u8 GetAbilityBySpecies(u16 species, bool8 altAbility);
u8 GetMonAbility(struct Pokemon *mon);
void CreateSecretBaseEnemyParty(struct SecretBaseRecord *secretBaseRecord);
u8 GetSecretBaseTrainerPicIndex(void);
u8 GetSecretBaseTrainerNameIndex(void);
u8 PlayerPartyAndPokemonStorageFull(void);
u8 PokemonStorageFull(void);
void GetSpeciesName(u8 *name, u16 species);
u8 CalculatePPWithBonus(u16 move, u8 ppBonuses, u8 moveIndex);
void RemoveMonPPBonus(struct Pokemon *mon, u8 moveIndex);
void RemoveBattleMonPPBonus(struct BattlePokemon *mon, u8 moveIndex);
void CopyPlayerPartyMonToBattleData(u8 battleIndex, u8 partyIndex);

u8 GetNature(struct Pokemon *mon);
u8 GetNatureFromPersonality(u32 personality);

u16 GetEvolutionTargetSpecies(struct Pokemon *mon, u8 type, u16 evolutionItem);

u16 nature_stat_mod(u8 nature, u16 n, u8 statIndex);

void MonRestorePP(struct Pokemon *);

u8 *sub_803F378(u16 itemId);

u16 NationalPokedexNumToSpecies(u16 nationalNum);
u16 NationalToHoennOrder(u16);
u16 SpeciesToNationalPokedexNum(u16);
u16 HoennToNationalOrder(u16);
u16 SpeciesToCryId(u16 species);
void DrawSpindaSpots(u16, u32, u8 *, u8);
u8 sub_803FBBC(void);
u8 sub_803FC58(u16);
void AdjustFriendship(struct Pokemon *, u8);
u8 CheckPartyHasHadPokerus(struct Pokemon *, u8);
void UpdatePartyPokerusTime(u16);
u32 CanMonLearnTMHM(struct Pokemon *, u8);
u8 GetMoveRelearnerMoves(struct Pokemon *mon, u16 *moves);
u8 sub_8040574(struct Pokemon *party);
void ClearBattleMonForms(void);
void sub_80408BC();
void current_map_music_set__default_for_battle(u16);
const u8 *GetMonSpritePal(struct Pokemon *mon);
const u8 *GetMonSpritePalFromOtIdPersonality(u16, u32, u32);
const struct CompressedSpritePalette *GetMonSpritePalStructFromOtIdPersonality(u16, u32, u32);
bool8 IsOtherTrainer(u32, u8 *);
void sub_8040B8C(void);
void SetWildMonHeldItem(void);
u8 *sub_8040D08();
bool32 ShouldHideGenderIconForLanguage(u16 species, u8 *name, u8 language);
bool32 ShouldHideGenderIcon(u16 species, u8 *name);
s8 sub_8040A54(struct Pokemon *, u8);
u16 GetMonEVCount(struct Pokemon *);
u16 GetEvolutionTargetSpecies(struct Pokemon *, u8, u16);
const struct CompressedSpritePalette *GetMonSpritePalStruct(struct Pokemon *);
bool8 IsPokeSpriteNotFlipped(u16);
u8 GetLevelUpMovesBySpecies(u16, u16 *);
u8 TryIncrementMonLevel(struct Pokemon *);
# 171 "include/global.h" 2

struct WarpData
{
    s8 mapGroup;
    s8 mapNum;
    s8 warpId;
    s16 x, y;
};

struct ItemSlot
{
    u16 itemId;
    u16 quantity;
};

struct Pokeblock
{
    u8 color;
    u8 spicy;
    u8 dry;
    u8 sweet;
    u8 bitter;
    u8 sour;
    u8 feel;
};

struct Roamer
{
             u32 ivs;
             u32 personality;
             u16 species;
             u16 hp;
             u8 level;
             u8 status;
             u8 cool;
             u8 beauty;
             u8 cute;
             u8 smart;
             u8 tough;
             bool8 active;
             u8 filler[0x8];
};

struct RamScriptData
{
    u8 magic;
    u8 mapGroup;
    u8 mapNum;
    u8 objectId;
    u8 script[995];
};

struct RamScript
{
    u32 checksum;
    struct RamScriptData data;
};

struct SB1_2EFC_Struct
{
    u16 var;
    u8 unknown[0x1E];
};

struct EasyChatPair
{
    u16 unk0_0:7;
    u16 unk0_7:7;
    u16 unk1_6:1;
    u16 unk2;
    u16 words[2];
};

struct TVShowCommon
{
             u8 var00;
             u8 var01;
             u8 pad02[20];
             u16 var16[3];
             u8 srcTrainerId3Lo;
             u8 srcTrainerId3Hi;
             u8 srcTrainerId2Lo;
             u8 srcTrainerId2Hi;
             u8 srcTrainerIdLo;
             u8 srcTrainerIdHi;
             u8 trainerIdLo;
             u8 trainerIdHi;
};

struct TVShowFanClubLetter
{
             u8 var00;
             u8 var01;
             u16 species;
             u16 pad04[6];
             u8 playerName[8];
             u8 language;
};

struct TVShowRecentHappenings
{
             u8 var00;
             u8 var01;
             u16 var02;
             u16 var04[6];
             u8 playerName[8];
             u8 language;
             u8 pad19[10];
};

struct TVShowFanclubOpinions
{
             u8 var00;
             u8 var01;
             u16 var02;
             u8 var04A:4;
             u8 var04B:4;
             u8 playerName[8];
             u8 language;
             u8 var0E;
             u8 var0F;
             u8 var10[8];
             u16 var18[2];
             u16 var1C[4];
};

struct TVShowUnknownType04
{
             u8 var00;
             u8 var01;
             u8 pad02[4];
             u16 var06;
};

struct TVShowNameRaterShow
{
             u8 var00;
             u8 var01;
             u16 species;
             u8 pokemonName[11];
             u8 trainerName[11];
             u8 random;
             u8 random2;
             u16 var1C;
             u8 language;
             u8 pokemonNameLanguage;
};

struct TVShowBravoTrainerPokemonProfiles
{
             u8 var00;
             u8 var01;
             u16 species;
             u16 var04[2];
             u8 pokemonNickname[11];
             u8 contestCategory:3;
             u8 contestRank:2;
             u8 contestResult:2;
             u8 var13_7:1;
             u16 var14;
             u8 playerName[8];
             u8 language;
             u8 var1f;
};

struct TVShowBravoTrainerBattleTowerSpotlight
{
             u8 var00;
             u8 var01;
             u8 trainerName[8];
             u16 species;
             u8 pokemonName[8];
             u16 defeatedSpecies;
             u16 var16;
             u16 var18[1];
             u8 btLevel;
             u8 var1b;
             u8 var1c;
             u8 language;
};

struct TVShowPokemonToday
{
             u8 var00;
             u8 var01;
             u8 language;
             u8 language2;
             u8 nickname[11];
             u8 ball;
             u16 species;
             u8 var12;
             u8 playerName[8];
};

struct TVShowSmartShopper
{
             u8 var00;
             u8 var01;
             u8 priceReduced;
             u8 language;
             u8 pad04[2];
             u16 itemIds[3];
             u16 itemAmounts[3];
             u8 shopLocation;
             u8 playerName[8];
};

struct TVShowPokemonTodayFailed
{
             u8 var00;
             u8 var01;
             u8 language;
             u8 pad03[9];
             u16 species;
             u16 species2;
             u8 var10;
             u8 var11;
             u8 var12;
             u8 playerName[8];
};

struct TVShowPokemonAngler
{
             u8 var00;
             u8 var01;
             u8 var02;
             u8 var03;
             u16 var04;
             u8 language;
             u8 pad07[12];
             u8 playerName[8];
};

struct TVShowWorldOfMasters
{
             u8 var00;
             u8 var01;
             u16 var02;
             u16 var04;
             u16 var06;
             u16 var08;
             u8 var0a;
             u8 language;
             u8 pad0c[7];
             u8 playerName[8];
};

struct TVShowMassOutbreak
{
             u8 var00;
             u8 var01;
             u8 var02;
             u8 var03;
             u16 moves[4];
             u16 species;
             u16 var0E;
             u8 locationMapNum;
             u8 locationMapGroup;
             u8 var12;
             u8 probability;
             u8 level;
             u8 var15;
             u16 var16;
             u8 language;
             u8 pad19[11];
};

typedef union TVShow
{
    struct TVShowCommon common;
    struct TVShowFanClubLetter fanclubLetter;
    struct TVShowRecentHappenings recentHappenings;
    struct TVShowFanclubOpinions fanclubOpinions;
    struct TVShowUnknownType04 unkShow04;
    struct TVShowNameRaterShow nameRaterShow;
    struct TVShowBravoTrainerPokemonProfiles bravoTrainer;
    struct TVShowBravoTrainerBattleTowerSpotlight bravoTrainerTower;
    struct TVShowPokemonToday pokemonToday;
    struct TVShowSmartShopper smartshopperShow;
    struct TVShowPokemonTodayFailed pokemonTodayFailed;
    struct TVShowPokemonAngler pokemonAngler;
    struct TVShowWorldOfMasters worldOfMasters;
    struct TVShowMassOutbreak massOutbreak;
} TVShow;

struct MailStruct
{
             u16 words[9];
             u8 playerName[8];
             u8 trainerId[4];
             u16 species;
             u16 itemId;
};




struct MauvilleManCommon
{
    u8 id;
};

struct MauvilleManBard
{
             u8 id;
             u16 songLyrics[6];
             u16 temporaryLyrics[6];
             u8 playerName[8];
             u8 filler_2DB6[0x3];
             u8 playerTrainerId[4];
             bool8 hasChangedSong;
};

struct MauvilleManHipster
{
    u8 id;
    bool8 alreadySpoken;
};

struct MauvilleManTrader
{
    u8 id;
    u8 unk1[4];
    u8 unk5[4][11];
    bool8 alreadyTraded;
};

struct MauvilleManStoryteller
{
    u8 id;
    bool8 alreadyRecorded;
    u8 filler2[2];
    u8 gameStatIDs[4];
    u8 trainerNames[4][7];
    u8 statValues[4][4];
};

struct MauvilleManGiddy
{
             u8 id;
             u8 taleCounter;
             u8 questionNum;
             u16 randomWords[10];
             u8 questionList[12];
};


union MauvilleMan
{
    struct MauvilleManCommon common;
    struct MauvilleManBard bard;
    struct MauvilleManHipster hipster;
    struct MauvilleManTrader trader;
    struct MauvilleManStoryteller storyteller;
    struct MauvilleManGiddy giddy;
    u8 filler[0x40];
};

struct Unk_SB_Access_Struct1
{
    u8 filler0[0xF8];
    struct SB1_2EFC_Struct sb1_2EFC_struct[5];
};

struct Unk_SB_Access_Struct2
{
               struct SB1_2EFC_Struct sb1_2EFC_struct2[12];
               u8 filler[0x18];
};


typedef union SB_Struct
{
    struct Unk_SB_Access_Struct1 unkSB1;
    struct Unk_SB_Access_Struct2 unkSB2;
} SB_Struct;


struct UnknownSaveStruct2ABC
{
    u8 val0;
    u8 val1;
    u16 val2;
};

struct GabbyAndTyData
{
             u16 mon1;
             u16 mon2;
             u16 lastMove;
             u16 quote;
             u8 mapnum;
             u8 battleNum;
             u8 valA_0:1;
             u8 valA_1:1;
             u8 valA_2:1;
             u8 valA_3:1;
             u8 valA_4:1;
             u8 valA_5:3;
             u8 valB_0:1;
             u8 valB_1:1;
             u8 valB_2:1;
             u8 valB_3:1;
             u8 valB_4:1;
             u8 valB_5:3;
};

struct DayCareMail
{
             struct MailStruct message;
             u8 names[19];
};

struct DayCareStepCountersEtc {
    u32 steps[2];
    u16 pendingEggPersonality;
    u8 eggCycleStepsRemaining;
};

struct RecordMixingDayCareMail
{
    struct DayCareMail mail[2];
    u32 numDaycareMons;
    u16 itemsHeld[2];
};

struct DayCareMisc
{
    struct DayCareMail mail[2];
    struct DayCareStepCountersEtc countersEtc;
};

struct DayCare {
    struct BoxPokemon mons[2];
    struct DayCareMisc misc;
};

struct LinkBattleRecord
{
    u8 name[8];
    u16 trainerId;
    u16 wins;
    u16 losses;
    u16 draws;
};

struct RecordMixingGiftData
{
    u8 unk0;
    u8 quantity;
    u16 itemId;
    u8 filler4[8];
};

struct RecordMixingGift
{
    int checksum;
    struct RecordMixingGiftData data;
};






struct SaveBlock1
{
             struct Coords16 pos;
             struct WarpData location;
             struct WarpData warp1;
             struct WarpData warp2;
             struct WarpData lastHealLocation;
             struct WarpData warp4;
             u16 savedMusic;
             u8 weather;
             u8 filler_2F;
             u8 flashLevel;
             u16 mapDataId;
             u16 mapView[0x100];
              u8 playerPartyCount;
              struct Pokemon playerParty[6];
              u32 money;
              u16 coins;
              u16 registeredItem;
              struct ItemSlot pcItems[50];
              struct ItemSlot bagPocket_Items[20];
              struct ItemSlot bagPocket_KeyItems[20];
              struct ItemSlot bagPocket_PokeBalls[16];
              struct ItemSlot bagPocket_TMHM[64];
              struct ItemSlot bagPocket_Berries[46];
              struct Pokeblock pokeblocks[40];
              u8 dexSeen2[((412 / 8) + ((412 % 8) ? 1 : 0))];
              u16 berryBlenderRecords[3];
              u8 filler_972[0x6];
              u16 trainerRematchStepCounter;
              u8 trainerRematches[100];
              struct MapObject mapObjects[16];
              struct MapObjectTemplate mapObjectTemplates[64];
               u8 flags[0x120];
               u16 vars[0x100];
               u32 gameStats[50];
               struct BerryTree berryTrees[128];
               struct SecretBaseRecord secretBases[20];
               u8 playerRoomDecor[12];
               u8 playerRoomDecorPos[12];
               u8 decorDesk[10];
               u8 decorChair[10];
               u8 decorPlant[10];
               u8 decorOrnament[30];
               u8 decorMat[30];
               u8 decorPoster[10];
               u8 decorDoll[40];
               u8 decorCushion[10];
               u8 padding_2736[2];
               TVShow tvShows[25];
               struct UnknownSaveStruct2ABC unknown_2ABC[16];
               u16 outbreakPokemonSpecies;
               u8 outbreakLocationMapNum;
               u8 outbreakLocationMapGroup;
               u8 outbreakPokemonLevel;
               u8 outbreakUnk1;
               u16 outbreakUnk2;
               u16 outbreakPokemonMoves[4];
               u8 outbreakUnk4;
               u8 outbreakPokemonProbability;
               u16 outbreakUnk5;
               struct GabbyAndTyData gabbyAndTyData;
               struct {
                   u16 unk2B1C[6];
                   u16 unk2B28[6];
                   u16 unk2B34[6];
                   u16 unk2B40[6];
    } easyChats;
               struct MailStruct mail[16];
               u8 unk2D8C[4];
               u8 filler_2D90[0x4];
               union MauvilleMan mauvilleMan;
               struct EasyChatPair easyChatPairs[5];
               u8 filler_2DFC[0x8];
               SB_Struct sbStruct;
               struct DayCare daycare;
               struct LinkBattleRecord linkBattleRecords[5];
               u8 filler_3108[8];
               u8 giftRibbons[11];
               u8 filler_311B[0x29];
               struct Roamer roamer;
               struct EnigmaBerry enigmaBerry;
               struct RamScript ramScript;
               struct RecordMixingGift recordMixingGift;
               u8 dexSeen3[((412 / 8) + ((412 % 8) ? 1 : 0))];
};

extern struct SaveBlock1 gSaveBlock1;

struct Time
{
             s16 days;
             s8 hours;
             s8 minutes;
             s8 seconds;
};

struct Pokedex
{
             u8 order;
             u8 unknown1;
             u8 nationalMagic;
             u8 unknown2;
             u32 unownPersonality;
             u32 spindaPersonality;
             u32 unknown3;
             u8 owned[((412 / 8) + ((412 % 8) ? 1 : 0))];
             u8 seen[((412 / 8) + ((412 % 8) ? 1 : 0))];
};

struct BattleTowerTrainer
{
    u8 trainerClass;
    u8 name[8];
    u8 teamFlags;
    struct {
        u16 easyChat[6];
    } greeting;
};

struct BattleTowerRecord
{
            u8 battleTowerLevelType;
            u8 trainerClass;
            u16 winStreak;
            u8 name[8];
            u8 trainerId[4];
            struct {
        u16 easyChat[6];
    } greeting;
            struct UnknownPokemonStruct party[3];
            u32 checksum;
};

struct BattleTowerEReaderTrainer
{
            u8 unk0;
            u8 trainerClass;
            u16 winStreak;
            u8 name[8];
            u8 trainerId[4];
            struct {
        u16 easyChat[6];
    } greeting;
            struct {
        u16 easyChat[6];
    } farewellPlayerLost;
            struct {
        u16 easyChat[6];
    } farewellPlayerWon;
            struct UnknownPokemonStruct party[3];
            u32 checksum;
};

struct BattleTowerData
{
                       struct BattleTowerRecord playerRecord;
                       struct BattleTowerRecord records[5];
                       u16 firstMonSpecies;
                       u16 defeatedBySpecies;
                       u8 defeatedByTrainerName[8];
                       u8 firstMonNickname[10];
                       struct BattleTowerEReaderTrainer ereaderTrainer;
                       u8 battleTowerLevelType:1;
                       u8 unk_554:1;
                       u8 battleOutcome;
                       u8 var_4AE[2];
                       u16 curChallengeBattleNum[2];
                       u16 curStreakChallengesNum[2];
                       u16 recordWinStreaks[2];
                       u8 battleTowerTrainerId;
                       u8 selectedPartyMons[0x3];
                       u16 prizeItem;
                       u8 filler_4C2[0x6];
                       u16 totalBattleTowerWins;
                       u16 bestBattleTowerWinStreak;
                       u16 currentWinStreaks[2];
                       u8 lastStreakLevelType;
                       u8 filler_4D1[0x317];
};

struct SaveBlock2
{
             u8 playerName[8];
             u8 playerGender;
             u8 specialSaveWarp;
             u8 playerTrainerId[4];
             u16 playTimeHours;
             u8 playTimeMinutes;
             u8 playTimeSeconds;
             u8 playTimeVBlanks;
             u8 optionsButtonMode;
             u16 optionsTextSpeed:3;
             u16 optionsWindowFrameType:5;
             u16 optionsSound:1;
             u16 optionsBattleStyle:1;
             u16 optionsBattleSceneOff:1;
             u16 regionMapZoom:1;
             struct Pokedex pokedex;
             u8 filler_90[0x8];
             struct Time localTimeOffset;
             struct Time lastBerryTreeUpdate;
             struct BattleTowerData battleTower;
};

struct MapPosition
{
    s16 x;
    s16 y;
    u8 height;
};

struct UnkStruct_8054FF8
{
    u8 a;
    u8 b;
    u8 c;
    u8 d;
    struct MapPosition sub;
    u16 field_C;
};


struct HallOfFame
{
    u8 filler[0x1F00];
};

extern struct HallOfFame gHallOfFame;
extern struct SaveBlock2 gSaveBlock2;
# 2 "src/debug/sound_check_menu.c" 2
# 1 "include/sprite.h" 1
# 3 "src/debug/sound_check_menu.c" 2
# 1 "include/palette.h" 1
# 9 "include/palette.h"
enum
{
    FAST_FADE_IN_FROM_WHITE,
    FAST_FADE_OUT_TO_WHTIE,
    FAST_FADE_IN_FROM_BLACK,
    FAST_FADE_OUT_TO_BLACK,
};

struct PaletteFadeControl
{
                u32 multipurpose1;
                u8 delayCounter:6;
                u16 y:5;
                u16 targetY:5;
                u16 blendColor:15;
                u16 active:1;
                u16 multipurpose2:6;
                u16 yDec:1;
                u16 bufferTransferDisabled:1;
                u16 mode:2;
                u16 shouldResetBlendRegisters:1;
                u16 hardwareFadeFinishing:1;
                u16 softwareFadeFinishingCounter:5;
                u16 softwareFadeFinishing:1;
                u16 objPaletteToggle:1;
                u8 deltaY:4;
};

extern struct PaletteFadeControl gPaletteFade;
extern u32 gPlttBufferTransferPending;
extern u8 gPaletteDecompressionBuffer[];
extern u16 gPlttBufferUnfaded[];
extern u16 gPlttBufferFaded[];

void LoadCompressedPalette(const void *, u16, u16);
void LoadPalette(const void *, u16, u16);
void FillPalette(u16, u16, u16);
void TransferPlttBuffer(void);
u8 UpdatePaletteFade(void);
void ResetPaletteFade(void);
void ReadPlttIntoBuffers(void);
bool8 BeginNormalPaletteFade(u32, s8, u8, u8, u16);
bool8 unref_sub_8073D3C(u32, u8, u8, u8, u16);
void unref_sub_8073D84(u8, u32 *);
void ResetPaletteStructByUid(u16);
void ResetPaletteStruct(u8);
void ResetPaletteFadeControl(void);
void unref_sub_8074168(u16);
void unref_sub_8074194(u16);
void InvertPlttBuffer(u32);
void TintPlttBuffer(u32, s8, s8, s8);
void UnfadePlttBuffer(u32);
void BeginFastPaletteFade(u8);
void BeginHardwarePaletteFade(u8, u8, u8, u8, u8);
void BlendPalettes(u32, u8, u16);
void BlendPalettesUnfaded(u32, u8, u16);
# 4 "src/debug/sound_check_menu.c" 2
# 1 "include/task.h" 1







typedef void (*TaskFunc)(u8 taskId);

struct Task
{
             TaskFunc func;
             bool8 isActive;
             u8 prev;
             u8 next;
             u8 priority;
             s16 data[16];
};

extern struct Task gTasks[];

void ResetTasks(void);
u8 CreateTask(TaskFunc func, u8 priority);
void DestroyTask(u8 taskId);
void RunTasks(void);
void TaskDummy(u8 taskId);
void SetTaskFuncWithFollowupFunc(u8 taskId, TaskFunc func, TaskFunc followupFunc);
void SwitchTaskToFollowupFunc(u8 taskId);
bool8 FuncIsActiveTask(TaskFunc func);
u8 FindTaskIdByFunc(TaskFunc func);
u8 GetTaskCount(void);
# 5 "src/debug/sound_check_menu.c" 2
# 1 "include/m4a.h" 1



# 1 "include/gba/m4a_internal.h" 1



# 1 "include/gba/gba.h" 1
# 5 "include/gba/m4a_internal.h" 2
# 39 "include/gba/m4a_internal.h"
struct WaveData
{
    u16 type;
    u16 status;
    u32 freq;
    u32 loopStart;
    u32 size;
    s8 data[1];
};
# 57 "include/gba/m4a_internal.h"
struct ToneData
{
    u8 type;
    u8 key;
    u8 length;
    u8 pan_sweep;
    struct WaveData *wav;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
};

struct CgbChannel
{
    u8 sf;
    u8 ty;
    u8 rightVolume;
    u8 leftVolume;
    u8 at;
    u8 de;
    u8 su;
    u8 re;
    u8 ky;
    u8 ev;
    u8 eg;
    u8 ec;
    u8 echoVolume;
    u8 echoLength;
    u8 d1;
    u8 d2;
    u8 gt;
    u8 mk;
    u8 ve;
    u8 pr;
    u8 rp;
    u8 d3[3];
    u8 d5;
    u8 sg;
    u8 n4;
    u8 pan;
    u8 panMask;
    u8 mo;
    u8 le;
    u8 sw;
    u32 fr;
    u32 wp;
    u32 cp;
    u32 tp;
    u32 pp;
    u32 np;
    u8 d4[8];
};

struct MusicPlayerTrack;

struct SoundChannel
{
    u8 status;
    u8 type;
    u8 rightVolume;
    u8 leftVolume;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
    u8 ky;
    u8 ev;
    u8 er;
    u8 el;
    u8 echoVolume;
    u8 echoLength;
    u8 d1;
    u8 d2;
    u8 gt;
    u8 mk;
    u8 ve;
    u8 pr;
    u8 rp;
    u8 d3[3];
    u32 ct;
    u32 fw;
    u32 freq;
    struct WaveData *wav;
    u32 cp;
    struct MusicPlayerTrack *track;
    u32 pp;
    u32 np;
    u32 d4;
    u16 xpi;
    u16 xpc;
};





struct SoundInfo
{




    u32 ident;

    vu8 pcmDmaCounter;


    u8 reverb;
    u8 maxChans;
    u8 masterVolume;
    u8 freq;

    u8 mode;
    u8 c15;
    u8 pcmDmaPeriod;
    u8 maxLines;
    u8 gap[3];
    s32 pcmSamplesPerVBlank;
    s32 pcmFreq;
    s32 divFreq;
    struct CgbChannel *cgbChans;
    u32 func;
    u32 intp;
    void (*CgbSound)(void);
    void (*CgbOscOff)(u8);
    u32 (*MidiKeyToCgbFreq)(u8, u8, u8);
    u32 MPlayJumpTable;
    u32 plynote;
    u32 ExtVolPit;
    u8 gap2[16];
    struct SoundChannel chans[12];
    s8 pcmBuffer[1584 * 2];
};

struct SongHeader
{
    u8 trackCount;
    u8 blockCount;
    u8 priority;
    u8 reverb;
    struct ToneData *tone;
    u8 *part[1];
};

struct PokemonCrySong
{
    u8 trackCount;
    u8 blockCount;
    u8 priority;
    u8 reverb;
    struct ToneData *tone;
    u8 *part[2];
    u8 gap;
    u8 part0;
    u8 tuneValue;
    u8 gotoCmd;
    u32 gotoTarget;
    u8 part1;
    u8 tuneValue2;
    u8 cont[2];
    u8 volCmd;
    u8 volumeValue;
    u8 unkCmd0D[2];
    u32 unkCmd0DParam;
    u8 xreleCmd[2];
    u8 releaseValue;
    u8 panCmd;
    u8 panValue;
    u8 tieCmd;
    u8 tieKeyValue;
    u8 tieVelocityValue;
    u8 unkCmd0C[2];
    u16 unkCmd0CParam;
    u8 end[2];
};
# 241 "include/gba/m4a_internal.h"
struct MusicPlayerTrack
{
    u8 flags;
    u8 wait;
    u8 patternLevel;
    u8 repN;
    u8 gateTime;
    u8 key;
    u8 velocity;
    u8 runningStatus;
    u8 keyM;
    u8 pitM;
    s8 keyShift;
    s8 keyShiftX;
    s8 tune;
    u8 pitX;
    s8 bend;
    u8 bendRange;
    u8 volMR;
    u8 volML;
    u8 vol;
    u8 volX;
    s8 pan;
    s8 panX;
    s8 modM;
    u8 mod;
    u8 modT;
    u8 lfoSpeed;
    u8 lfoSpeedC;
    u8 lfoDelay;
    u8 lfoDelayC;
    u8 priority;
    u8 echoVolume;
    u8 echoLength;
    struct SoundChannel *chan;
    struct ToneData tone;
    u8 gap[10];
    u16 unk_3A;
    u32 unk_3C;
    u8 *cmdPtr;
    u8 *patternStack[3];
};
# 294 "include/gba/m4a_internal.h"
struct MusicPlayerInfo
{
    struct SongHeader *songHeader;
    u32 status;
    u8 trackCount;
    u8 priority;
    u8 cmd;
    u8 unk_B;
    u32 clock;
    u8 gap[8];
    u8 *memAccArea;
    u16 tempoD;
    u16 tempoU;
    u16 tempoI;
    u16 tempoC;
    u16 fadeOI;
    u16 fadeOC;
    u16 fadeOV;
    struct MusicPlayerTrack *tracks;
    struct ToneData *tone;
    u32 ident;
    u32 func;
    u32 intp;
};

struct MusicPlayer
{
    struct MusicPlayerInfo *info;
    struct MusicPlayerTrack *track;
    u8 unk_8;
    u16 unk_A;
};

struct Song
{
    struct SongHeader *header;
    u16 ms;
    u16 me;
};

extern const struct MusicPlayer gMPlayTable[];
extern const struct Song gSongTable[];



extern u8 gMPlayMemAccArea[];






extern struct PokemonCrySong gPokemonCrySong;
extern struct PokemonCrySong gPokemonCrySongs[];

extern struct MusicPlayerInfo gPokemonCryMusicPlayers[];
extern struct MusicPlayerTrack gPokemonCryTracks[];

extern char SoundMainRAM[];

extern void *gMPlayJumpTable[];

typedef void (*XcmdFunc)(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
extern const XcmdFunc gXcmdTable[];

extern struct CgbChannel gCgbChans[];

extern const u8 gScaleTable[];
extern const u32 gFreqTable[];
extern const u16 gPcmSamplesPerVBlankTable[];

extern const u8 gCgbScaleTable[];
extern const s16 gCgbFreqTable[];
extern const u8 gNoiseTable[];

extern const struct PokemonCrySong gPokemonCrySongTemplate;

extern const struct ToneData voicegroup_pokemon_cry;

extern char gNumMusicPlayers[];
extern char gMaxLines[];




u32 umul3232H32(u32 multiplier, u32 multiplicand);
void SoundMain(void);
void SoundMainBTM(void);
void TrackStop(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track);
void MPlayMain(void);
void RealClearChain(void *x);

void MPlayContinue(struct MusicPlayerInfo *mplayInfo);
void MPlayStart(struct MusicPlayerInfo *mplayInfo, struct SongHeader *songHeader);
void m4aMPlayStop(struct MusicPlayerInfo *mplayInfo);
void FadeOutBody(struct MusicPlayerInfo *mplayInfo);
void TrkVolPitSet(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track);
void MPlayFadeOut(struct MusicPlayerInfo *mplayInfo, u16 speed);
void ClearChain(void *x);
void Clear64byte(void *addr);
void SoundInit(struct SoundInfo *soundInfo);
void MPlayExtender(struct CgbChannel *cgbChans);
void m4aSoundMode(u32 mode);
void MPlayOpen(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track, u8 a3);
void CgbSound(void);
void CgbOscOff(u8);
u32 MidiKeyToCgbFreq(u8, u8, u8);
void DummyFunc(void);
void MPlayJumpTableCopy(void **mplayJumpTable);
void SampleFreqSet(u32 freq);
void m4aSoundVSyncOn(void);
void m4aSoundVSyncOff(void);

void ClearModM(struct MusicPlayerTrack *track);
void m4aMPlayModDepthSet(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u8 modDepth);
void m4aMPlayLFOSpeedSet(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u8 lfoSpeed);

struct MusicPlayerInfo *SetPokemonCryTone(struct ToneData *tone);
void SetPokemonCryVolume(u8 val);
void SetPokemonCryPanpot(s8 val);
void SetPokemonCryPitch(s16 val);
void SetPokemonCryLength(u16 val);
void SetPokemonCryRelease(u8 val);
void SetPokemonCryProgress(u32 val);
int IsPokemonCryPlaying(struct MusicPlayerInfo *mplayInfo);
void SetPokemonCryChorus(s8 val);
void SetPokemonCryStereo(u32 val);
void SetPokemonCryPriority(u8 val);


void ply_fine(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_goto(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_patt(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_pend(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_rept(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_memacc(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_prio(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_tempo(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_keysh(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_voice(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_vol(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_pan(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_bend(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_bendr(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_lfos(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_lfodl(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_mod(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_modt(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_tune(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_port(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xcmd(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_endtie(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_note(struct MusicPlayerInfo *, struct MusicPlayerTrack *);


void ply_xxx(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xwave(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xtype(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xatta(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xdeca(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xsust(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xrele(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xiecv(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xiecl(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xleng(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xswee(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xcmd_0C(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xcmd_0D(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
# 5 "include/m4a.h" 2

void m4aSoundVSync(void);

void m4aSoundInit(void);
void m4aSoundMain(void);
void m4aSongNumStart(u16);
void m4aSongNumStop(u16 n);
void m4aMPlayAllStop(void);
void m4aMPlayContinue(struct MusicPlayerInfo *mplayInfo);
void m4aMPlayFadeOut(struct MusicPlayerInfo *mplayInfo, u16 speed);
void m4aMPlayFadeOutTemporarily(struct MusicPlayerInfo *mplayInfo, u16 speed);
void m4aMPlayFadeIn(struct MusicPlayerInfo *mplayInfo, u16 speed);
void m4aMPlayImmInit(struct MusicPlayerInfo *mplayInfo);

void m4aMPlayTempoControl(struct MusicPlayerInfo *mplayInfo, u16 tempo);
void m4aMPlayVolumeControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u16 volume);
void m4aMPlayPitchControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, s16 pitch);
void m4aMPlayPanpotControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, s8 pan);
# 6 "src/debug/sound_check_menu.c" 2
# 1 "include/main.h" 1



# 1 "include/global.h" 1
# 5 "include/main.h" 2

typedef void (*MainCallback)(void);
typedef void (*IntrCallback)(void);
typedef void (*IntrFunc)(void);

struct Main
{
              MainCallback callback1;
              MainCallback callback2;

              MainCallback savedCallback;

              IntrCallback vblankCallback;
              IntrCallback hblankCallback;
              IntrCallback vcountCallback;
              IntrCallback serialCallback;

              vu16 intrCheck;

              u32 vblankCounter1;
              u32 vblankCounter2;

              u16 heldKeysRaw;
              u16 newKeysRaw;
              u16 heldKeys;
              u16 newKeys;
              u16 newAndRepeatedKeys;
              u16 keyRepeatCounter;
              bool16 watchedKeysPressed;
              u16 watchedKeysMask;

              u8 objCount;

              struct OamData oamBuffer[128];

              u8 state;

              u8 oamLoadDisabled:1;
              u8 inBattle:1;
};

extern u8 gLinkTransferringData;
extern struct Main gMain;
extern bool8 gSoftResetDisabled;

extern bool8 gLinkVSyncDisabled;
extern const u8 gGameVersion;
extern const u8 gGameLanguage;

void AgbMain(void);
void SetMainCallback2(MainCallback callback);
void InitKeys(void);
void SetVBlankCallback(IntrCallback callback);
void SetHBlankCallback(IntrCallback callback);
void SetVCountCallback(IntrCallback callback);
void SetSerialCallback(IntrCallback callback);
void InitFlashTimer(void);
void DoSoftReset(void);
void ClearPokemonCrySongs(void);
# 7 "src/debug/sound_check_menu.c" 2
# 1 "include/text.h" 1
# 77 "include/text.h"
struct WindowConfig
{
    u8 bgNum;
    u8 charBaseBlock;
    u8 screenBaseBlock;
    u8 priority;
    u8 paletteNum;
    u8 foregroundColor;
    u8 backgroundColor;
    u8 shadowColor;
    u8 fontNum;
    u8 textMode;
    u8 spacing;
    u8 tilemapLeft;
    u8 tilemapTop;
    u8 width;
    u8 height;
    u8 *tileData;
    u16 *tilemap;
    u32 maybeUnused;
};

struct Window
{
          u8 textMode;
          u8 fontNum;
          u8 language;
          u8 foregroundColor;
          u8 backgroundColor;
          u8 shadowColor;
          u8 paletteNum;
          u8 tilemapLeft;
          u8 tilemapTop;
          u8 width;
          u8 height;
          u8 win_field_B;
          u8 win_field_C;
          u8 delayCounter;
          u8 spacing;
          u8 win_field_F;
          u8 cursorX;
          u8 cursorY;
          u8 left;
          u16 top;
          u16 state;
          u16 downArrowCounter;
          u16 tileDataStartOffset;
          u16 tileDataOffset;
          u16 textIndex;
          const u8 *text;
          u8 *tileData;
          u16 *tilemap;
          const struct WindowConfig *config;
};

extern vu16 *const gBGControlRegs[];
extern vu16 *const gBGHOffsetRegs[];
extern vu16 *const gBGVOffsetRegs[];

extern const u16 gUnknown_081E29D8[];
extern const u16 gUnknown_081E29E0[];
extern const u16 gUnknown_081E29E8[];

extern const struct WindowConfig gWindowConfig_81E6C3C;
extern const struct WindowConfig gWindowConfig_81E6C58;
extern const struct WindowConfig gWindowConfig_81E6C74;
extern const struct WindowConfig gWindowConfig_81E6C90;
extern const struct WindowConfig gWindowConfig_81E6CAC;
extern const struct WindowConfig gWindowConfig_81E6CC8;
extern const struct WindowConfig gWindowConfig_81E6CE4;
extern const struct WindowConfig gWindowConfig_TextBox;
extern const struct WindowConfig gWindowConfig_81E6D00;
extern const struct WindowConfig gWindowConfig_81E6D1C;
extern const struct WindowConfig gWindowConfig_81E6D38;
extern const struct WindowConfig gWindowConfig_81E6D54;
extern const struct WindowConfig gWindowConfig_81E6D70;
extern const struct WindowConfig gWindowConfig_81E6D8C;
extern const struct WindowConfig gWindowConfig_81E6DA8;
extern const struct WindowConfig WindowConfig_TrainerCard_Back_Values;
extern const struct WindowConfig WindowConfig_TrainerCard_Back_Labels;
extern const struct WindowConfig gWindowConfig_81E6DFC;
extern const struct WindowConfig gWindowConfig_81E6E18;
extern const struct WindowConfig gWindowConfig_81E6E34;
extern const struct WindowConfig gWindowConfig_81E6E50;
extern const struct WindowConfig gWindowConfig_81E6E6C;
extern const struct WindowConfig gWindowConfig_81E6E88;
extern const struct WindowConfig gWindowConfig_81E6EA4;
extern const struct WindowConfig gWindowConfig_81E6EC0;
extern const struct WindowConfig gWindowConfig_81E6EDC;
extern const struct WindowConfig gWindowConfig_81E6EF8;
extern const struct WindowConfig gWindowConfig_81E6F14;
extern const struct WindowConfig gWindowConfig_81E6F30;
extern const struct WindowConfig gWindowConfig_81E6F4C;
extern const struct WindowConfig gWindowConfig_81E6F68;
extern const struct WindowConfig gWindowConfig_81E6F84;
extern const struct WindowConfig gWindowConfig_81E6FA0;
extern const struct WindowConfig gWindowConfig_81E6FBC;
extern const struct WindowConfig gWindowConfig_81E6FD8;
extern const struct WindowConfig gWindowConfig_81E6FF4;
extern const struct WindowConfig gWindowConfig_81E7010;
extern const struct WindowConfig gWindowConfig_81E702C;
extern const struct WindowConfig gWindowConfig_81E7048;
extern const struct WindowConfig gWindowConfig_81E7064;
extern const struct WindowConfig gWindowConfig_81E7080;
extern const struct WindowConfig gWindowConfig_81E709C;
extern const struct WindowConfig gWindowConfig_81E70B8;
extern const struct WindowConfig gWindowConfig_81E70D4;
extern const struct WindowConfig gWindowConfig_81E70F0;
extern const struct WindowConfig gWindowConfig_81E710C;
extern const struct WindowConfig gWindowConfig_81E7128;
extern const struct WindowConfig gWindowConfig_81E7144;
extern const struct WindowConfig gWindowConfig_81E7160;
extern const struct WindowConfig gWindowConfig_81E717C;
extern const struct WindowConfig gWindowConfig_81E7198;
extern const struct WindowConfig gWindowConfig_81E71B4;
extern const struct WindowConfig gWindowConfig_81E71D0;
extern const struct WindowConfig gWindowConfig_81E71EC;
extern const struct WindowConfig gWindowConfig_81E7208;
extern const struct WindowConfig gWindowConfig_81E7224;
extern const struct WindowConfig gWindowConfig_81E7240;
extern const struct WindowConfig gWindowConfig_81E725C;
extern const struct WindowConfig gWindowConfig_81E7278;
extern const struct WindowConfig gWindowConfig_81E7294;

extern u16 gBGTilemapBuffers[4][0x400];

extern u8 gStringVar1[];
extern u8 gStringVar2[];
extern u8 gStringVar3[];
extern u8 gStringVar4[];
extern u8 gTileBuffer[];

void LoadFontDefaultPalette(const struct WindowConfig *winConfig);
void SetUpWindowConfig(const struct WindowConfig *winConfig);
u16 InitWindowTileData(struct Window *win, u16 startOffset);
u32 MultistepInitWindowTileData(struct Window *win, u16 startOffset);
bool32 MultistepLoadFont(void);
void InitWindowFromConfig(struct Window *win, const struct WindowConfig *winConfig);
void InitWindow(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top);
void sub_8002E4C(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u16 top, u32 a6);
void sub_8002E90(struct Window *win, const u8 *text);
void sub_8002EB0(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top);
u8 sub_8002F44(struct Window *win);
u8 sub_8003418(struct Window *win);
u8 sub_8003460(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top);
u8 sub_8003490(struct Window *win, u8 c, u16 tileDataStartOffset, u8 left, u8 top);
void sub_80034D4(u8 *tileData, const u8 *text);
u8 sub_80034EC(u8 *str);
u8 *sub_8003504(u8 *dest, s32 value, u8 alignAmount, u8 alignType);
u8 *sub_8003558(u8 *dest, const u8 *src, u8 alignAmount, u8 alignType);
u8 sub_80035AC(struct Window *win);
u8 sub_800374C(struct Window *win);
u8 sub_8003778(struct Window *win);
u8 sub_80037A0(struct Window *win);
u32 sub_80037C8(struct Window *win, u8 lineLength);
void ClearWindowTextLines(struct Window *win);
u16 GetWindowTilemapEntry(struct Window *win, u8 x, u8 y);
void DrawWindowRect(struct Window *win, u16 tilemapEntry, u8 left, u8 top, u8 right, u8 bottom);
void DrawWindowRect_DefaultPalette(struct Window *win, u16 tileNum, u8 left, u8 top, u8 right, u8 bottom);
void FillWindowRect(struct Window *win, u16 tilemapEntry, u8 left, u8 top, u8 right, u8 bottom);
void FillWindowRect_DefaultPalette(struct Window *win, u16 tileNum, u8 left, u8 top, u8 right, u8 bottom);
void ZeroFillWindowRect(struct Window *win, u8 left, u8 top, u8 right, u8 bottom);
void FillWindowRectWithBlankTile(struct Window *win, u8 left, u8 top, u8 right, u8 bottom);
u8 GetExtCtrlCodeLength(u8 code);
u8 *AlignInt1(struct Window *win, u8 *dest, s32 value, u8 alignAmount, u8 alignType);
u8 *AlignInt2(struct Window *win, u8 *dest, s32 value, u8 alignAmount, u8 alignType);
u8 *AlignString(struct Window *win, u8 *dest, const u8 *src, u8 alignAmount, u8 alignType);
u8 GetStringWidth(struct Window *win, const u8 *s);
u8 sub_8004D04(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u16 top, u32 a6);
u8 sub_8004D38(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top);
u8 sub_8004DB0(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top, u16 a6);
u8 sub_8004E24(struct Window *win);
void sub_8004E28(struct Window *win, u8 *foreground, u8 *background, u8 *shadow);
void sub_8004E3C(const struct WindowConfig *winConfig, u8 *tileData, const u8 *text);
u8 GetStringWidthGivenWindowConfig(const struct WindowConfig *winConfig, const u8 *s);
void ConvertInternationalString(u8 *s, u8 language);
void StripExtCtrlCodes(u8 *str);
s32 StringCompareWithoutExtCtrlCodes(const u8 *str1, const u8 *str2);
u8 sub_8004FD0(struct Window *win, u8 *dest, const u8 *src, u16 tileDataStartOffset, u8 left, u16 top, u8 width, u32 a8);

void SetCustomFont(u8 num);
# 8 "src/debug/sound_check_menu.c" 2
# 1 "include/menu.h" 1



# 1 "include/task.h" 1
# 5 "include/menu.h" 2
# 1 "include/text.h" 1
# 6 "include/menu.h" 2

struct MenuAction
{
   const u8 *text;
   u8 (*func)();
};

struct MenuAction2
{
    const u8 *text;
    TaskFunc func;
};

extern const struct MenuAction gMenuYesNoItems[];

extern struct Window gMenuWindow;
extern struct Window *gMenuWindowPtr;
extern u16 gMenuTextTileOffset;
extern u16 gMenuTextWindowContentTileOffset;
extern u16 gMenuMessageBoxContentTileOffset;

void CloseMenu(void);
void AppendToList(u8 *list, u8 *pindex, u32 value);
void InitMenuWindow(const struct WindowConfig *);
void MultistepInitMenuWindowBegin(const struct WindowConfig *);
bool32 MultistepInitMenuWindowContinue(void);
void unref_sub_8071DA4(struct WindowConfig *, u16);
void MenuLoadTextWindowGraphics_OverrideFrameType(u8);
void MenuLoadTextWindowGraphics(void);
void BasicInitMenuWindow(const struct WindowConfig *);
void MenuPrint(const u8 *, u8, u8);
void MenuZeroFillWindowRect(u8, u8, u8, u8);
void MenuFillWindowRectWithBlankTile(u8, u8, u8, u8);
void MenuZeroFillScreen(void);
void MenuDrawTextWindow(u8, u8, u8, u8);
void sub_8071F40(const u8 *);
void sub_8071F60(u8, u8, u8);
u16 unref_sub_8071F98(u8, u8);
void unref_sub_8071FBC(u16, u8, u8, u8, u8);
void MenuDisplayMessageBox(void);
void MenuPrintMessage(const u8 *, u8, u8);
void MenuPrintMessageDefaultCoords(const u8 *);
void MenuSetText(const u8 *);
u8 MenuUpdateWindowText(void);
u8 unref_sub_8072098(void);
void sub_80720B0(void);
u8 MoveMenuCursor(s8);
u8 MoveMenuCursorNoWrap(s8);
u8 GetMenuCursorPos(void);
s8 ProcessMenuInput(void);
s8 ProcessMenuInputNoWrap(void);
u8 MoveMenuCursor3(s8);
u8 MoveMenuCursor4(s8);
void sub_807274C(u8, u8, u8, u8, const struct MenuAction[], u8, u32);
s8 sub_80727CC(void);
u8 sub_807288C(u8);
void PrintMenuItems(u8, u8, u8, const struct MenuAction[]);
void PrintMenuItemsReordered(u8 left, u8 top, u8 menuItemCount, const struct MenuAction2 menuItems[], const u8 *order);
void InitYesNoMenu(u8, u8, u8);
void DisplayYesNoMenu(u8, u8, u32);
s8 ProcessMenuInputNoWrap_(void);
u8 MenuPrint_PixelCoords(const u8 *, u8, u16, u8);
u8 sub_8072A18(const u8 *, u8, u16, u8, u32);
u8 unref_sub_8072A5C(u8 *, u8 *, u8, u16, u8, u32);
int sub_8072AB0(const u8 *, u8, u16, u8, u8, u32);
void MenuPrint_RightAligned(const u8 *, u8, u8);
void sub_8072B80(const u8 *, u8, u8, const u8 *);
void sub_8072BD8(const u8 *, u8, u8, u16);
u8 *sub_8072C14(u8 *, s32, u8, u8);
u8 *sub_8072C44(u8 *, s32, u8, u8);
u8 *sub_8072C74(u8 *, const u8 *, u8, u8);
u8 sub_8072CA4(const u8 *s);
u8 sub_8072CBC(void);
void sub_8072CD4(u8 *, u8 *, u8 *);
u32 MenuUpdateWindowText_OverrideLineLength(u8);
struct Window * unref_sub_8072D0C(void);
u8 InitMenu(u8, u8, u8, u8, u8, u8);
void RedrawMenuCursor(u8, u8);
void unref_sub_8072DC0(void);
void sub_8072DCC(u8);
void sub_8072DDC(u8);
void HandleDestroyMenuCursors(void);
# 9 "src/debug/sound_check_menu.c" 2
# 1 "include/songs.h" 1



enum
{
             SE_STOP,
             SE_KAIFUKU,
             SE_PC_LOGON,
             SE_PC_OFF,
             SE_PC_ON,
             SE_SELECT,
             SE_WIN_OPEN,
             SE_WALL_HIT,
             SE_DOOR,
             SE_KAIDAN,
             SE_DANSA,
             SE_JITENSYA,
             SE_KOUKA_L,
             SE_KOUKA_M,
             SE_KOUKA_H,
             SE_BOWA2,
             SE_POKE_DEAD,
             SE_NIGERU,
             SE_JIDO_DOA,
             SE_NAMINORI,
             SE_BAN,
             SE_PIN,
             SE_BOO,
             SE_BOWA,
             SE_JYUNI,
             SE_A,
             SE_I,
             SE_U,
             SE_E,
             SE_O,
             SE_N,
             SE_SEIKAI,
             SE_HAZURE,
             SE_EXP,
             SE_JITE_PYOKO,
             SE_MU_PACHI,
             SE_TK_KASYA,
             SE_FU_ZAKU,
             SE_FU_ZAKU2,
             SE_FU_ZUZUZU,
             SE_RU_GASHIN,
             SE_RU_GASYAN,
             SE_RU_BARI,
             SE_RU_HYUU,
             SE_KI_GASYAN,
             SE_TK_WARPIN,
             SE_TK_WARPOUT,
             SE_TU_SAA,
             SE_HI_TURUN,
             SE_TRACK_MOVE,
             SE_TRACK_STOP,
             SE_TRACK_HAIK,
             SE_TRACK_DOOR,
             SE_MOTER,
             SE_CARD,
             SE_SAVE,
             SE_KON,
             SE_KON2,
             SE_KON3,
             SE_KON4,
             SE_SUIKOMU,
             SE_NAGERU,
    SE_TOY_C,
    SE_TOY_D,
    SE_TOY_E,
    SE_TOY_F,
    SE_TOY_G,
    SE_TOY_A,
    SE_TOY_B,
    SE_TOY_C1,
    SE_MIZU,
    SE_HASHI,
    SE_DAUGI,
    SE_PINPON,
    SE_FUUSEN1,
    SE_FUUSEN2,
    SE_FUUSEN3,
    SE_TOY_KABE,
    SE_TOY_DANGO,
    SE_DOKU,
             SE_ESUKA,
             SE_T_AME,
             SE_T_AME_E,
             SE_T_OOAME,
             SE_T_OOAME_E,
             SE_T_KOAME,
             SE_T_KOAME_E,
             SE_T_KAMI,
             SE_T_KAMI2,
             SE_ELEBETA,
             SE_HINSI,
             SE_EXPMAX,
             SE_TAMAKORO,
             SE_TAMAKORO_E,
             SE_BASABASA,
             SE_REGI,
    SE_C_GAJI,
    SE_C_MAKU_U,
    SE_C_MAKU_D,
    SE_C_PASI,
    SE_C_SYU,
    SE_C_PIKON,
             SE_REAPOKE,
             SE_OP_BASYU,
             SE_BT_START,
    SE_DENDOU,
    SE_JIHANKI,
    SE_TAMA,
    SE_Z_SCROLL,
             SE_Z_PAGE,
             SE_PN_ON,
             SE_PN_OFF,
             SE_Z_SEARCH,
             SE_TAMAGO,
             SE_TB_START,
             SE_TB_KON,
             SE_TB_KARA,
             SE_BIDORO,
             SE_W085,
             SE_W085B,
             SE_W231,
             SE_W171,
             SE_W233,
             SE_W233B,
             SE_W145,
             SE_W145B,
             SE_W145C,
             SE_W240,
             SE_W015,
             SE_W081,
             SE_W081B,
             SE_W088,
             SE_W016,
             SE_W016B,
             SE_W003,
             SE_W104,
             SE_W013,
             SE_W196,
             SE_W086,
             SE_W004,
             SE_W025,
             SE_W025B,
    SE_W152,
    SE_W026,
    SE_W172,
    SE_W172B,
    SE_W053,
    SE_W007,
    SE_W092,
    SE_W221,
    SE_W221B,
    SE_W052,
    SE_W036,
    SE_W059,
    SE_W059B,
    SE_W010,
    SE_W011,
    SE_W017,
    SE_W019,
    SE_W028,
    SE_W013B,
    SE_W044,
    SE_W029,
    SE_W057,
    SE_W056,
    SE_W250,
    SE_W030,
    SE_W039,
    SE_W054,
    SE_W077,
    SE_W020,
    SE_W082,
    SE_W047,
    SE_W195,
    SE_W006,
    SE_W091,
    SE_W146,
    SE_W120,
    SE_W153,
    SE_W071B,
    SE_W071,
    SE_W103,
             SE_W062,
             SE_W062B,
             SE_W048,
             SE_W187,
             SE_W118,
             SE_W155,
             SE_W122,
             SE_W060,
             SE_W185,
             SE_W014,
             SE_W043,
             SE_W207,
             SE_W207B,
             SE_W215,
             SE_W109,
             SE_W173,
             SE_W280,
             SE_W202,
             SE_W060B,
             SE_W076,
             SE_W080,
             SE_W100,
             SE_W107,
    SE_W166,
    SE_W129,
    SE_W115,
    SE_W112,
    SE_W197,
    SE_W199,
    SE_W236,
    SE_W204,
    SE_W268,
    SE_W070,
    SE_W063,
    SE_W127,
    SE_W179,
    SE_W151,
    SE_W201,
    SE_W161,
    SE_W161B,
    SE_W227,
    SE_W227B,
    SE_W226,
    SE_W208,
    SE_W213,
    SE_W213B,
    SE_W234,
    SE_W260,
    SE_W328,
    SE_W320,
    SE_W255,
    SE_W291,
    SE_W089,
    SE_W239,
    SE_W230,
    SE_W281,
    SE_W327,
    SE_W287,
    SE_W257,
    SE_W253,
    SE_W258,
    SE_W322,
    SE_W298,
    SE_W287B,
    SE_W114,
    SE_W063B,
    BGM_STOP = 349,
    BGM_TETSUJI,
    BGM_FIELD13,
    BGM_KACHI22,
    BGM_KACHI2,
    BGM_KACHI3,
    BGM_KACHI5,
    BGM_PCC,
    BGM_NIBI,
    BGM_SUIKUN,
    BGM_DOORO1,
    BGM_DOORO_X1,
    BGM_DOORO_X3,
    BGM_MACHI_S2,
    BGM_MACHI_S4,
    BGM_GIM,
    BGM_NAMINORI,
    BGM_DAN01,
              BGM_FANFA1,
              BGM_ME_ASA,
              BGM_ME_BACHI,
              BGM_FANFA4,
              BGM_FANFA5,
              BGM_ME_WAZA,
              BGM_BIJYUTU,
              BGM_DOORO_X4,
              BGM_FUNE_KAN,
              BGM_ME_SHINKA,
              BGM_SHINKA,
              BGM_ME_WASURE,
              BGM_SYOUJOEYE,
              BGM_BOYEYE,
              BGM_DAN02,
              BGM_MACHI_S3,
              BGM_ODAMAKI,
              BGM_B_TOWER,
              BGM_SWIMEYE,
              BGM_DAN03,
              BGM_ME_KINOMI,
              BGM_ME_TAMA,
              BGM_ME_B_BIG,
              BGM_ME_B_SMALL,
              BGM_ME_ZANNEN,
              BGM_BD_TIME,
              BGM_TEST1,
              BGM_TEST2,
              BGM_TEST3,
              BGM_TEST4,
              BGM_TEST,
              BGM_GOMACHI0,
              BGM_GOTOWN,
              BGM_POKECEN,
              BGM_NEXTROAD,
              BGM_GRANROAD,
              BGM_CYCLING,
    BGM_FRIENDLY,
    BGM_MISHIRO,
    BGM_TOZAN,
    BGM_GIRLEYE,
    BGM_MINAMO,
    BGM_ASHROAD,
    BGM_EVENT0,
    BGM_DEEPDEEP,
    BGM_KACHI1,
    BGM_TITLE3,
    BGM_DEMO1,
    BGM_GIRL_SUP,
    BGM_HAGESHII,
    BGM_KAKKOII,
    BGM_KAZANBAI,
    BGM_AQA_0,
    BGM_TSURETEK,
    BGM_BOY_SUP,
    BGM_RAINBOW,
    BGM_AYASII,
    BGM_KACHI4,
    BGM_ROPEWAY,
    BGM_CASINO,
    BGM_HIGHTOWN,
    BGM_SAFARI,
    BGM_C_ROAD,
    BGM_AJITO,
    BGM_M_BOAT,
    BGM_M_DUNGON,
    BGM_FINECITY,
    BGM_MACHUPI,
    BGM_P_SCHOOL,
    BGM_DENDOU,
    BGM_TONEKUSA,
    BGM_MABOROSI,
    BGM_CON_FAN,
    BGM_CONTEST0,
    BGM_MGM0,
    BGM_T_BATTLE,
    BGM_OOAME,
    BGM_HIDERI,
    BGM_RUNECITY,
    BGM_CON_K,
    BGM_EIKOU_R,
    BGM_KARAKURI,
    BGM_HUTAGO,
    BGM_SITENNOU,
    BGM_YAMA_EYE,
    BGM_CONLOBBY,
    BGM_INTER_V,
    BGM_DAIGO,
    BGM_THANKFOR,
    BGM_END,
    BGM_BATTLE27,
    BGM_BATTLE31,
    BGM_BATTLE20,
    BGM_BATTLE32,
    BGM_BATTLE33,
    BGM_BATTLE36,
    BGM_BATTLE34,
    BGM_BATTLE35,
    BGM_BATTLE38,
    BGM_BATTLE30,
};
# 10 "src/debug/sound_check_menu.c" 2
# 1 "include/title_screen.h" 1





extern const u16 gUnknown_08393E64[];

void SpriteCallback_VersionBannerLeft(struct Sprite *sprite);
void SpriteCallback_VersionBannerRight(struct Sprite *sprite);
void SpriteCallback_PressStartCopyrightBanner(struct Sprite *sprite);
void SpriteCallback_PokemonLogoShine(struct Sprite *sprite);

void CB2_InitTitleScreen(void);
# 11 "src/debug/sound_check_menu.c" 2
# 1 "include/sound.h" 1



void InitMapMusic(void);
void MapMusicMain(void);
void ResetMapMusic(void);
u16 GetCurrentMapMusic(void);
void PlayNewMapMusic(u16 songNum);
void StopMapMusic(void);
void FadeOutMapMusic(u8 speed);
void FadeOutAndPlayNewMapMusic(u16 songNum, u8 speed);
void FadeOutAndFadeInNewMapMusic(u16 songNum, u8 fadeOutSpeed, u8 fadeInSpeed);
void FadeInNewMapMusic(u16 songNum, u8 speed);
bool8 IsNotWaitingForBGMStop(void);
void PlayFanfareByFanfareNum(u8 fanfareNum);
bool8 WaitFanfare(bool8 stop);
void StopFanfareByFanfareNum(u8 fanfareNum);
void PlayFanfare(u16 songNum);
bool8 IsFanfareTaskInactive(void);
void FadeInNewBGM(u16 songNum, u8 speed);
void FadeOutBGMTemporarily(u8 speed);
bool8 IsBGMPausedOrStopped(void);
void FadeInBGM(u8 speed);
void FadeOutBGM(u8 speed);
bool8 IsBGMStopped(void);
void PlayCry1(u16 species, s8 pan);
void PlayCry2(u16 species, s8 pan, s8 volume, u8 priority);
void PlayCry3(u16 species, s8 pan, u8 mode);
void PlayCry4(u16 species, s8 pan, u8 mode);
void PlayCry5(u16 species, u8 mode);
bool8 IsCryFinished(void);
void StopCryAndClearCrySongs(void);
void StopCry(void);
bool8 IsCryPlayingOrClearCrySongs(void);
bool8 IsCryPlaying(void);
void PlayBGM(u16 songNum);
void PlaySE(u16 songNum);
void PlaySE12WithPanning(u16 songNum, s8 pan);
void PlaySE1WithPanning(u16 songNum, s8 pan);
void PlaySE2WithPanning(u16 songNum, s8 pan);
void SE12PanpotControl(s8 pan);
bool8 IsSEPlaying(void);
bool8 IsBGMPlaying(void);
bool8 IsSpecialSEPlaying(void);
# 12 "src/debug/sound_check_menu.c" 2
# 1 "include/pokedex_cry_screen.h" 1



struct CryRelatedStruct
{
    u16 unk0;
    u8 unk2;
    u8 paletteNo;
    u8 xPos;
    u8 yPos;
};

u8 ShowPokedexCryScreen(struct CryRelatedStruct *, u8);
u8 sub_8119E3C(struct CryRelatedStruct *, u8);
void sub_8119F88(u8 a);
void sub_811A050(u16 species);
void DestroyCryMeterNeedleSprite();
# 13 "src/debug/sound_check_menu.c" 2







enum
{
    BGM_WINDOW,
    SE_WINDOW
};


enum
{
    CRY_TEST_VOICE,
    CRY_TEST_VOLUME,
    CRY_TEST_PANPOT,
    CRY_TEST_PITCH,
    CRY_TEST_LENGTH,
    CRY_TEST_RELEASE,
    CRY_TEST_PROGRESS,
    CRY_TEST_CHORUS,
    CRY_TEST_PRIORITY
};


enum
{
    MIN,
    MAX
};

extern struct ToneData voicegroup_84537C0[];
extern struct ToneData voicegroup_8452590[];
extern struct ToneData voicegroup_8453DC0[];
extern struct ToneData voicegroup_8452B90[];
extern struct ToneData voicegroup_84543C0[];
extern struct ToneData voicegroup_8453190[];
extern struct ToneData voicegroup_84549C0[];
extern struct ToneData voicegroup_8453790[];

static __attribute__((section("ewram_data"))) u8 gUnknown_020387B0 = 0;
static __attribute__((section("ewram_data"))) u8 gUnknown_020387B1 = 0;
static __attribute__((section("ewram_data"))) u8 gUnknown_020387B2 = 0;
static __attribute__((section("ewram_data"))) s8 sDriverTestSelection = 0;
static __attribute__((section("ewram_data"))) int sSoundTestParams[9] = {0};
static __attribute__((section("ewram_data"))) u8 gUnknown_020387D8 = 0;
static __attribute__((section("ewram_data"))) u8 gUnknown_020387D9 = 0;

u16 gSoundTestCryNum;
extern u8 gUnknown_03005E98;

struct MusicPlayerInfo *gUnknown_03005D30;

extern struct MusicPlayerInfo gMPlay_BGM;

void Task_InitSoundCheckMenu(u8);
void sub_80BA384(u8);
void sub_80BA65C(u8);
void sub_80BA68C(u8);
void HighlightSelectedWindow(u8);
void PrintSoundNumber(u16, u16, u16);
void sub_80BA79C(const u8 *const, u16, u16);
void Task_DrawDriverTestMenu(u8);
void Task_ProcessDriverTestInput(u8);
void AdjustSelectedDriverParam(s8);
void PrintDriverTestMenuText(void);
void sub_80BAE10(u8, u8);
void PrintSignedNumber(int, u16, u16, u8);
void sub_80BAF84(u8);
void sub_80BB038(u8);
void sub_80BB1D4(void);
void Task_InitCryTest(u8);
void Task_ProcessCryTestInput(u8);
void PrintCryNumber(void);

void CB2_SoundCheckMenu(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void VBlankCB_SoundCheckMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();

    if (gUnknown_020387B0 != 0)
    {
        m4aSoundMain();
        m4aSoundMain();
        m4aSoundMain();
    }
}


void CB2_StartSoundCheckMenu(void)
{
    u8 taskId;

    SetVBlankCallback(((void *)0));
    (*(vu16 *)(0x4000000 + 0x0)) = 0;
    (*(vu16 *)(0x4000000 + 0xc)) = 0;
    (*(vu16 *)(0x4000000 + 0xa)) = 0;
    (*(vu16 *)(0x4000000 + 0x8)) = 0;
    (*(vu16 *)(0x4000000 + 0x18)) = 0;
    (*(vu16 *)(0x4000000 + 0x1a)) = 0;
    (*(vu16 *)(0x4000000 + 0x14)) = 0;
    (*(vu16 *)(0x4000000 + 0x16)) = 0;
    (*(vu16 *)(0x4000000 + 0x10)) = 0;
    (*(vu16 *)(0x4000000 + 0x12)) = 0;
    { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(0x6000000); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((0x18000)/(16/8))); dmaRegs[2]; }; };
    { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(0x7000000); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x400)/(32/8))); dmaRegs[2]; }; };
    { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(0x5000000); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((0x400)/(16/8))); dmaRegs[2]; }; };
    ResetPaletteFade();
    ResetTasks();
    ResetSpriteData();
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    (*(vu16 *)(0x4000000 + 0x40)) = (((0) << 8) | (0));
    (*(vu16 *)(0x4000000 + 0x44)) = (((0) << 8) | (0));
    (*(vu16 *)(0x4000000 + 0x42)) = (((0) << 8) | (0));
    (*(vu16 *)(0x4000000 + 0x46)) = (((0) << 8) | (0));
    (*(vu16 *)(0x4000000 + 0x48)) = 0x1111;
    (*(vu16 *)(0x4000000 + 0x4a)) = 0x31;
    (*(vu16 *)(0x4000000 + 0x50)) = 0xE1;
    (*(vu16 *)(0x4000000 + 0x52)) = 0;
    (*(vu16 *)(0x4000000 + 0x54)) = 7;
    (*(vu16 *)(0x4000000 + 0x200)) = 1;
    (*(vu16 *)(0x4000000 + 0x200)) |= 1;
    (*(vu16 *)(0x4000000 + 0x4)) |= 8;
    SetVBlankCallback(VBlankCB_SoundCheckMenu);
    SetMainCallback2(CB2_SoundCheckMenu);
    (*(vu16 *)(0x4000000 + 0x0)) = 0x7140;
    taskId = CreateTask(Task_InitSoundCheckMenu, 0);
    gTasks[taskId].data[0] = BGM_WINDOW;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    gUnknown_020387B0 = 0;
    gTasks[taskId].data[3] = 0;
    m4aSoundInit();
}

void Task_InitSoundCheckMenu(u8 taskId)
{
    u8 soundcheckStr[] = _("サウンドチェック");
    u8 bgmStr[] = _("BGM");
    u8 seStr[] = _("SE ");
    u8 abDescStr[] = _("A‥さいせい　B‥おわり");
    u8 upDownStr[] = _("L‥UP R‥DOWN");
    u8 driverStr[] = _("R‥DRIVER-TEST");

    if (!gPaletteFade.active)
    {
        MenuDrawTextWindow(2, 0, 27, 3);
        MenuDrawTextWindow(2, 5, 27, 10);
        MenuDrawTextWindow(2, 12, 27, 17);
        MenuPrint(soundcheckStr, 4, 1);
        MenuPrint(abDescStr, 14, 1);
        MenuPrint(bgmStr, 4, 6);
        MenuPrint(upDownStr, 14, 6);
        MenuPrint(seStr, 4, 13);
        MenuPrint(upDownStr, 14, 13);
        MenuPrint(driverStr, 14, 18);
        gTasks[taskId].func = sub_80BA384;
        (*(vu16 *)(0x4000000 + 0x40)) = (((17) << 8) | (223));
        (*(vu16 *)(0x4000000 + 0x44)) = (((1) << 8) | (31));
    }
}


static const u8 gUnknown_083D0300[] = { 1, 1, 1, 3, 1, 5, 1, 7, 1, 9, 1, 11, 1, 13, 1, 15, 1, 17 };

extern const u8 *const gBGMNames[];
extern const u8 *const gSENames[];

void sub_80BA384(u8 taskId)
{
    HighlightSelectedWindow(gTasks[taskId].data[0]);
    PrintSoundNumber(gTasks[taskId].data[1] + BGM_STOP, 7, 8);
    sub_80BA79C(gBGMNames[gTasks[taskId].data[1]], 11, 8);
    PrintSoundNumber(gTasks[taskId].data[2], 7, 15);
    sub_80BA79C(gSENames[gTasks[taskId].data[2]], 11, 15);
    gTasks[taskId].func = sub_80BA65C;
}

bool8 Task_ProcessSoundCheckMenuInput(u8 taskId)
{
    if (gMain.newKeys & 0x0100)
    {
        gTasks[taskId].func = Task_DrawDriverTestMenu;
    }
    else if (gMain.newKeys & 0x0200)
    {
        gTasks[taskId].func = sub_80BAF84;
    }
    else if (gMain.newKeys & 0x0008)
    {
        gTasks[taskId].func = Task_InitCryTest;
    }
    else if (gMain.newKeys & 0x0001)
    {
        if (gTasks[taskId].data[0] != 0)
        {
            if (gTasks[taskId].data[4] != 0)
            {
                if (gTasks[taskId].data[2] != 0)
                {
                    m4aSongNumStop(gTasks[taskId].data[4]);
                    m4aSongNumStart(gTasks[taskId].data[2]);
                    gTasks[taskId].data[4] = gTasks[taskId].data[2];
                }
                else
                {
                    m4aSongNumStop(gTasks[taskId].data[4]);
                    gTasks[taskId].data[4] = 0;
                }
            }
            else if (gTasks[taskId].data[2] != 0)
            {
                m4aSongNumStart(gTasks[taskId].data[2]);
                gTasks[taskId].data[4] = gTasks[taskId].data[2];
            }
        }
        else
        {
            if (gTasks[taskId].data[3] != 0)
            {
                if (gTasks[taskId].data[1] != 0)
                {
                    m4aSongNumStop(gTasks[taskId].data[3] + BGM_STOP);
                    m4aSongNumStart(gTasks[taskId].data[1] + BGM_STOP);
                    gTasks[taskId].data[3] = gTasks[taskId].data[1];
                }
                else
                {
                    m4aSongNumStop(gTasks[taskId].data[3] + BGM_STOP);
                    gTasks[taskId].data[3] = 0;
                }
            }
            else if (gTasks[taskId].data[1] != 0)
            {
                m4aSongNumStart(gTasks[taskId].data[1] + BGM_STOP);
                gTasks[taskId].data[3] = gTasks[taskId].data[1];
            }
        }
    }
    else if (gMain.newKeys & 0x0002)
    {
        m4aSongNumStart(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        gTasks[taskId].func = sub_80BA68C;
    }
    else if (gMain.newAndRepeatedKeys & 0x0040)
    {
        gTasks[taskId].data[0] ^= 1;
        return 1;
    }
    else if (gMain.newAndRepeatedKeys & 0x0080)
    {
        gTasks[taskId].data[0] ^= 1;
        return 1;
    }
    else if (gMain.newAndRepeatedKeys & 0x0010)
    {
        if (gTasks[taskId].data[0] != 0)
        {
            if (gTasks[taskId].data[2] > 0)
                gTasks[taskId].data[2]--;
            else
                gTasks[taskId].data[2] = 247;
        }
        else
        {
            if (gTasks[taskId].data[1] > 0)
                gTasks[taskId].data[1]--;
            else
                gTasks[taskId].data[1] = 117;
        }
        return 1;
    }
    else if (gMain.newAndRepeatedKeys & 0x0020)
    {
        if (gTasks[taskId].data[0] != 0)
        {
            if (gTasks[taskId].data[2] < 247)
                gTasks[taskId].data[2]++;
            else
                gTasks[taskId].data[2] = 0;
        }
        else
        {
            if (gTasks[taskId].data[1] < 117)
                gTasks[taskId].data[1]++;
            else
                gTasks[taskId].data[1] = 0;
        }
        return 1;
    }
    else if (gMain.heldKeys & 0x0004)
    {
        gUnknown_020387B0 = 1;
    }
    else
    {
        gUnknown_020387B0 = 0;
    }
    return 0;
}

void sub_80BA65C(u8 taskId)
{
    if (Task_ProcessSoundCheckMenuInput(taskId) != 0)
        gTasks[taskId].func = sub_80BA384;
}

void sub_80BA68C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        SetMainCallback2(CB2_InitTitleScreen);
    }
}

void HighlightSelectedWindow(u8 windowType)
{
    switch (windowType)
    {
    case BGM_WINDOW:
    default:
        (*(vu16 *)(0x4000000 + 0x42)) = (((17) << 8) | (223));
        (*(vu16 *)(0x4000000 + 0x46)) = (((41) << 8) | (87));
        break;
    case SE_WINDOW:
        (*(vu16 *)(0x4000000 + 0x42)) = (((17) << 8) | (223));
        (*(vu16 *)(0x4000000 + 0x46)) = (((97) << 8) | (143));
        break;
    }
}

void PrintSoundNumber(u16 soundIndex, u16 x, u16 y)
{
    u8 i;
    u8 str[5];
    bool8 someBool;
    u8 divisorValue;

    for (i = 0; i < 3; i++)
        str[i] = 0;

    str[3] = 0xB0;
    str[4] = 0xFF;
    someBool = 0;

    divisorValue = soundIndex / 100;
    if (divisorValue)
    {
        str[0] = divisorValue + 0xA1;
        someBool = 1;
    }

    divisorValue = (soundIndex % 100) / 10;
    if (divisorValue || someBool)
        str[1] = divisorValue + 0xA1;

    str[2] = ((soundIndex % 100) % 10) + 0xA1;
    MenuPrint(str, x, y);
}

void sub_80BA79C(const u8 *const string, u16 x, u16 y)
{
    u8 i;
    u8 str[11];

    for (i = 0; i <= 10; i++)
        str[i] = 0;

    str[10] = 0xFF;

    for (i = 0; string[i] != 0xFF && i < 10; i++)
        str[i] = string[i];

    MenuPrint(str, x, y);
}

void Task_DrawDriverTestMenu(u8 taskId)
{
    u8 bbackStr[] = _("Bぼたんで　もどる");
    u8 aplayStr[] = _("Aぼたんで　さいせい");
    u8 voiceStr[] = _("VOICE‥‥‥‥");
    u8 volumeStr[] = _("VOLUME‥‥‥");
    u8 panpotStr[] = _("PANPOT‥‥‥");
    u8 pitchStr[] = _("PITCH‥‥‥‥");
    u8 lengthStr[] = _("LENGTH‥‥‥");
    u8 releaseStr[] = _("RELEASE‥‥");
    u8 progressStr[] = _("PROGRESS‥");
    u8 chorusStr[] = _("CHORUS‥‥‥");
    u8 priorityStr[] = _("PRIORITY‥");
    u8 playingStr[] = _("さいせいちゆう‥");
    u8 reverseStr[] = _("はんてん‥‥‥‥");
    u8 stereoStr[] = _("すてれお‥‥‥‥");

    (*(vu16 *)(0x4000000 + 0x0)) = 0x3140;
    MenuDrawTextWindow(0, 0, 29, 19);
    MenuPrint(bbackStr, 19, 4);
    MenuPrint(aplayStr, 19, 2);
    MenuPrint(voiceStr, 2, 1);
    MenuPrint(volumeStr, 2, 3);
    MenuPrint(panpotStr, 2, 5);
    MenuPrint(pitchStr, 2, 7);
    MenuPrint(lengthStr, 2, 9);
    MenuPrint(releaseStr, 2, 11);
    MenuPrint(progressStr, 2, 13);
    MenuPrint(chorusStr, 2, 15);
    MenuPrint(priorityStr, 2, 17);
    MenuPrint(playingStr, 19, 16);
    MenuPrint(reverseStr, 19, 14);
    MenuPrint(stereoStr, 19, 12);
    (*(vu16 *)(0x4000000 + 0x40)) = (((0) << 8) | (240));
    (*(vu16 *)(0x4000000 + 0x44)) = (((0) << 8) | (160));
    sDriverTestSelection = 0;
    gUnknown_020387B1 = 0;
    gUnknown_020387B2 = 0;
    gUnknown_03005D30 = ((void *)0);
    gUnknown_020387D8 = 0;
    gUnknown_020387D9 = 1;
    sSoundTestParams[CRY_TEST_VOICE] = 0;
    sSoundTestParams[CRY_TEST_VOLUME] = 120;
    sSoundTestParams[CRY_TEST_PANPOT] = 0;
    sSoundTestParams[CRY_TEST_PITCH] = 15360;
    sSoundTestParams[CRY_TEST_LENGTH] = 180;
    sSoundTestParams[CRY_TEST_PROGRESS] = 0;
    sSoundTestParams[CRY_TEST_RELEASE] = 0;
    sSoundTestParams[CRY_TEST_CHORUS] = 0;
    sSoundTestParams[CRY_TEST_PRIORITY] = 2;
    PrintDriverTestMenuText();
    sub_80BAE10(0, 0);
    gTasks[taskId].func = Task_ProcessDriverTestInput;
}

void Task_ProcessDriverTestInput(u8 taskId)
{
    if (gMain.newKeys & 0x0002)
    {
        (*(vu16 *)(0x4000000 + 0x0)) = 0x7140;
        (*(vu16 *)(0x4000000 + 0x40)) = (((17) << 8) | (223));
        (*(vu16 *)(0x4000000 + 0x44)) = (((1) << 8) | (31));
        MenuZeroFillWindowRect(0, 0, 29, 19);
        gTasks[taskId].func = Task_InitSoundCheckMenu;
        return;
    }
    if (gMain.newAndRepeatedKeys & 0x0040)
    {
        u8 old = sDriverTestSelection;

        if(--sDriverTestSelection < 0)
            sDriverTestSelection = 8;
        sub_80BAE10(old, sDriverTestSelection);
        return;
    }
    if (gMain.newAndRepeatedKeys & 0x0080)
    {
        u8 old = sDriverTestSelection;

        if(++sDriverTestSelection > 8)
            sDriverTestSelection = 0;
        sub_80BAE10(old, sDriverTestSelection);
        return;
    }
    if (gMain.newKeys & 0x0008)
    {
        gUnknown_020387D8 ^= 1;
        PrintDriverTestMenuText();
        return;
    }
    if (gMain.newKeys & 0x0004)
    {
        gUnknown_020387D9 ^= 1;
        PrintDriverTestMenuText();
        SetPokemonCryStereo(gUnknown_020387D9);
        return;
    }
    if (gMain.newAndRepeatedKeys & 0x0100)
    {
        AdjustSelectedDriverParam(10);
        PrintDriverTestMenuText();
        return;
    }
    if (gMain.newAndRepeatedKeys & 0x0200)
    {
        AdjustSelectedDriverParam(-10);
        PrintDriverTestMenuText();
        return;
    }
    if (gMain.newAndRepeatedKeys & 0x0020)
    {
        AdjustSelectedDriverParam(-1);
        PrintDriverTestMenuText();
        return;
    }
    if (gMain.newAndRepeatedKeys & 0x0010)
    {
        AdjustSelectedDriverParam(1);
        PrintDriverTestMenuText();
        return;
    }
    if (gMain.newKeys & 0x0001)
    {
        u8 divide, remaining;

        SetPokemonCryVolume(sSoundTestParams[CRY_TEST_VOLUME]);
        SetPokemonCryPanpot(sSoundTestParams[CRY_TEST_PANPOT]);
        SetPokemonCryPitch(sSoundTestParams[CRY_TEST_PITCH]);
        SetPokemonCryLength(sSoundTestParams[CRY_TEST_LENGTH]);
        SetPokemonCryProgress(sSoundTestParams[CRY_TEST_PROGRESS]);
        SetPokemonCryRelease(sSoundTestParams[CRY_TEST_RELEASE]);
        SetPokemonCryChorus(sSoundTestParams[CRY_TEST_CHORUS]);
        SetPokemonCryPriority(sSoundTestParams[CRY_TEST_PRIORITY]);

        remaining = sSoundTestParams[CRY_TEST_VOICE] % 128;
        divide = sSoundTestParams[CRY_TEST_VOICE] / 128;

        switch (divide)
        {
        case 0:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_84537C0[remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8452590[remaining]);
            break;
        case 1:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8453DC0[remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8452B90[remaining]);
            break;
        case 2:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_84543C0[remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8453190[remaining]);
            break;
        case 3:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_84549C0[remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8453790[remaining]);
            break;
        }
    }


    if (gUnknown_03005D30 != ((void *)0))
    {
        gUnknown_020387B1 = IsPokemonCryPlaying(gUnknown_03005D30);

        if (gUnknown_020387B1 != gUnknown_020387B2)
            PrintDriverTestMenuText();

        gUnknown_020387B2 = gUnknown_020387B1;
    }
}

void AdjustSelectedDriverParam(s8 delta)
{

    int paramRanges[] =
    {
        0, 387,
        0, 127,
        -127, 127,
        -128, 32639,
        0, 65535,
        0, 255,
        0, 65535,
        -64, 63

    };

    sSoundTestParams[sDriverTestSelection] += delta;

    if (sSoundTestParams[sDriverTestSelection] > paramRanges[((sDriverTestSelection) * B_16 + (MAX))])
        sSoundTestParams[sDriverTestSelection] = paramRanges[((sDriverTestSelection) * B_16 + (MIN))];

    if (sSoundTestParams[sDriverTestSelection] < paramRanges[((sDriverTestSelection) * B_16 + (MIN))])
        sSoundTestParams[sDriverTestSelection] = paramRanges[((sDriverTestSelection) * B_16 + (MAX))];
}

void PrintDriverTestMenuText(void)
{
    PrintSignedNumber(sSoundTestParams[CRY_TEST_VOICE] + 1, 11, 1, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_VOLUME], 11, 3, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_PANPOT], 11, 5, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_PITCH], 11, 7, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_LENGTH], 11, 9, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_RELEASE], 11, 11, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_PROGRESS], 11, 13, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_CHORUS], 11, 15, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_PRIORITY], 11, 17, 5);
    PrintSignedNumber(gUnknown_020387B1, 27, 16, 1);
    PrintSignedNumber(gUnknown_020387D8, 27, 14, 1);
    PrintSignedNumber(gUnknown_020387D9, 27, 12, 1);
}

void sub_80BAE10(u8 var1, u8 var2)
{
    u8 str1[] = _("▶");
    u8 str2[] = _(" ");

    MenuPrint(str2, gUnknown_083D0300[((var1) * B_16 + (0))], gUnknown_083D0300[((var1) * B_16 + (1))]);
    MenuPrint(str1, gUnknown_083D0300[((var2) * B_16 + (0))], gUnknown_083D0300[((var2) * B_16 + (1))]);
}

void PrintSignedNumber(int n, u16 x, u16 y, u8 digits)
{
    int powersOfTen[6] =
    {
              1,
             10,
            100,
           1000,
          10000,
         100000
    };
    u8 str[8];
    s8 i;
    s8 negative;
    s8 someVar2;

    for (i = 0; i <= digits; i++)
        str[i] = 0x00;
    str[digits + 1] = 0xFF;

    negative = 0;
    if (n < 0)
    {
        n = -n;
        negative = 1;
    }

    if (digits == 1)
        someVar2 = 1;
    else
        someVar2 = 0;

    for (i = digits - 1; i >= 0; i--)
    {
        s8 d = n / powersOfTen[i];

        if (d != 0 || someVar2 || i == 0)
        {
            if (negative && !someVar2)
                str[digits - i - 1] = 0xAE;
            str[digits - i] = 0xA1 + d;
            someVar2 = 1;
        }
        n %= powersOfTen[i];
    }

    MenuPrint(str, x, y);
}

static const s8 gUnknown_083D03F8[5] = { 0x3F, 0x00, 0xC0, 0x7F, 0x80 };

void sub_80BAF84(u8 taskId)
{
    u8 seStr[] = _("SE");
    u8 panStr[] = _("PAN");
    u8 playingStr[] = _("さいせいちゆう‥");

    (*(vu16 *)(0x4000000 + 0x0)) = 0x3140;
    MenuDrawTextWindow(0, 0, 29, 19);
    MenuPrint(seStr, 3, 2);
    MenuPrint(panStr, 3, 4);
    MenuPrint(playingStr, 3, 8);
    (*(vu16 *)(0x4000000 + 0x40)) = (((0) << 8) | (240));
    (*(vu16 *)(0x4000000 + 0x44)) = (((0) << 8) | (160));
    sSoundTestParams[CRY_TEST_VOICE] = 1;
    sSoundTestParams[CRY_TEST_PANPOT] = 0;
    sSoundTestParams[CRY_TEST_CHORUS] = 0;
    sSoundTestParams[CRY_TEST_PROGRESS] = 0;
    sSoundTestParams[CRY_TEST_RELEASE] = 0;
    sub_80BB1D4();
    gTasks[taskId].func = sub_80BB038;
}

void sub_80BB038(u8 taskId)
{
    sub_80BB1D4();
    if (sSoundTestParams[CRY_TEST_PROGRESS])
    {
        if (sSoundTestParams[CRY_TEST_RELEASE])
        {
            sSoundTestParams[CRY_TEST_RELEASE]--;
        }
        else
        {
            s8 panpot = gUnknown_083D03F8[sSoundTestParams[CRY_TEST_PANPOT]];
            if (panpot != -128)
            {
                if (panpot == 127)
                {
                    sSoundTestParams[CRY_TEST_CHORUS] += 2;
                    if (sSoundTestParams[CRY_TEST_CHORUS] < 63)
                        SE12PanpotControl(sSoundTestParams[CRY_TEST_CHORUS]);
                }
            }
            else
            {
                sSoundTestParams[CRY_TEST_CHORUS] -= 2;
                if (sSoundTestParams[CRY_TEST_CHORUS] > -64)
                    SE12PanpotControl(sSoundTestParams[CRY_TEST_CHORUS]);
            }
        }
    }

    if (gMain.newKeys & 0x0002)
    {
        (*(vu16 *)(0x4000000 + 0x0)) = 0x7140;
        (*(vu16 *)(0x4000000 + 0x40)) = (((17) << 8) | (223));
        (*(vu16 *)(0x4000000 + 0x44)) = (((1) << 8) | (31));
        MenuZeroFillWindowRect(0, 0, 29, 19);
        gTasks[taskId].func = Task_InitSoundCheckMenu;
        return;
    }
    if (gMain.newKeys & 0x0001)
    {
        s8 panpot = gUnknown_083D03F8[sSoundTestParams[CRY_TEST_PANPOT]];
        if (panpot != -128)
        {
            if (panpot == 127)
            {
                PlaySE12WithPanning(sSoundTestParams[CRY_TEST_VOICE], -64);
                sSoundTestParams[CRY_TEST_CHORUS] = -64;
                sSoundTestParams[CRY_TEST_PROGRESS] = 1;
                sSoundTestParams[CRY_TEST_RELEASE] = 30;
                return;
            }
        }
        else
        {
            PlaySE12WithPanning(sSoundTestParams[CRY_TEST_VOICE], 63);
            sSoundTestParams[CRY_TEST_CHORUS] = 63;
            sSoundTestParams[CRY_TEST_PROGRESS] = 1;
            sSoundTestParams[CRY_TEST_RELEASE] = 30;
            return;
        }

        PlaySE12WithPanning(sSoundTestParams[CRY_TEST_VOICE], panpot);
        sSoundTestParams[CRY_TEST_PROGRESS] = 0;
        return;
    }
    if (gMain.newKeys & 0x0200)
    {
        sSoundTestParams[CRY_TEST_PANPOT]++;
        if (sSoundTestParams[CRY_TEST_PANPOT] > 4)
            sSoundTestParams[CRY_TEST_PANPOT] = 0;
    }
    if (gMain.newKeys & 0x0100)
    {
        sSoundTestParams[CRY_TEST_PANPOT]--;
        if (sSoundTestParams[CRY_TEST_PANPOT] < 0)
            sSoundTestParams[CRY_TEST_PANPOT] = 4;
    }
    if (gMain.newAndRepeatedKeys & 0x0010)
    {
        sSoundTestParams[CRY_TEST_VOICE]++;
        if (sSoundTestParams[CRY_TEST_VOICE] > 247)
            sSoundTestParams[CRY_TEST_VOICE] = 0;
    }
    else if (gMain.newAndRepeatedKeys & 0x0020)
    {
        sSoundTestParams[CRY_TEST_VOICE]--;
        if (sSoundTestParams[CRY_TEST_VOICE] < 0)
            sSoundTestParams[CRY_TEST_VOICE] = 247;
    }
}

void sub_80BB1D4(void)
{
    u8 lrStr[] = _("  LR");
    u8 rlStr[] = _("  RL");

    PrintSignedNumber(sSoundTestParams[CRY_TEST_VOICE], 7, 2, 3);

    switch (gUnknown_083D03F8[sSoundTestParams[CRY_TEST_PANPOT]])
    {
    case 127:
        MenuPrint(lrStr, 7, 4);
        break;
    case -128:
        MenuPrint(rlStr, 7, 4);
        break;
    default:
        PrintSignedNumber(gUnknown_083D03F8[sSoundTestParams[CRY_TEST_PANPOT]], 7, 4, 3);
        break;
    }
    PrintSignedNumber(IsSEPlaying(), 12, 8, 1);
}
# 1193 "src/debug/sound_check_menu.c"
static const u8 sBGMName_BGM_STOP[] = _("STOP"); static const u8 sBGMName_BGM_TETSUJI[] = _("TETSUJI"); static const u8 sBGMName_BGM_FIELD13[] = _("FIELD13"); static const u8 sBGMName_BGM_KACHI22[] = _("KACHI22"); static const u8 sBGMName_BGM_KACHI2[] = _("KACHI2"); static const u8 sBGMName_BGM_KACHI3[] = _("KACHI3"); static const u8 sBGMName_BGM_KACHI5[] = _("KACHI5"); static const u8 sBGMName_BGM_PCC[] = _("PCC"); static const u8 sBGMName_BGM_NIBI[] = _("NIBI"); static const u8 sBGMName_BGM_SUIKUN[] = _("SUIKUN"); static const u8 sBGMName_BGM_DOORO1[] = _("DOORO1"); static const u8 sBGMName_BGM_DOORO_X1[] = _("DOORO-X1"); static const u8 sBGMName_BGM_DOORO_X3[] = _("DOORO-X3"); static const u8 sBGMName_BGM_MACHI_S2[] = _("MACHI-S2"); static const u8 sBGMName_BGM_MACHI_S4[] = _("MACHI-S4"); static const u8 sBGMName_BGM_GIM[] = _("GIM"); static const u8 sBGMName_BGM_NAMINORI[] = _("NAMINORI"); static const u8 sBGMName_BGM_DAN01[] = _("DAN01"); static const u8 sBGMName_BGM_FANFA1[] = _("FANFA1"); static const u8 sBGMName_BGM_ME_ASA[] = _("ME-ASA"); static const u8 sBGMName_BGM_ME_BACHI[] = _("ME-BACHI"); static const u8 sBGMName_BGM_FANFA4[] = _("FANFA4"); static const u8 sBGMName_BGM_FANFA5[] = _("FANFA5"); static const u8 sBGMName_BGM_ME_WAZA[] = _("ME-WAZA"); static const u8 sBGMName_BGM_BIJYUTU[] = _("BIJYUTU"); static const u8 sBGMName_BGM_DOORO_X4[] = _("DOORO-X4"); static const u8 sBGMName_BGM_FUNE_KAN[] = _("FUNE-KAN"); static const u8 sBGMName_BGM_ME_SHINKA[] = _("ME-SHINKA"); static const u8 sBGMName_BGM_SHINKA[] = _("SHINKA"); static const u8 sBGMName_BGM_ME_WASURE[] = _("ME-WASURE"); static const u8 sBGMName_BGM_SYOUJOEYE[] = _("SYOUJOEYE"); static const u8 sBGMName_BGM_BOYEYE[] = _("BOYEYE"); static const u8 sBGMName_BGM_DAN02[] = _("DAN02"); static const u8 sBGMName_BGM_MACHI_S3[] = _("MACHI-S3"); static const u8 sBGMName_BGM_ODAMAKI[] = _("ODAMAKI"); static const u8 sBGMName_BGM_B_TOWER[] = _("B-TOWER"); static const u8 sBGMName_BGM_SWIMEYE[] = _("SWIMEYE"); static const u8 sBGMName_BGM_DAN03[] = _("DAN03"); static const u8 sBGMName_BGM_ME_KINOMI[] = _("ME-KINOMI"); static const u8 sBGMName_BGM_ME_TAMA[] = _("ME-TAMA"); static const u8 sBGMName_BGM_ME_B_BIG[] = _("ME-B-BIG"); static const u8 sBGMName_BGM_ME_B_SMALL[] = _("ME-B-SMALL"); static const u8 sBGMName_BGM_ME_ZANNEN[] = _("ME-ZANNEN"); static const u8 sBGMName_BGM_BD_TIME[] = _("BD-TIME"); static const u8 sBGMName_BGM_TEST1[] = _("TEST1"); static const u8 sBGMName_BGM_TEST2[] = _("TEST2"); static const u8 sBGMName_BGM_TEST3[] = _("TEST3"); static const u8 sBGMName_BGM_TEST4[] = _("TEST4"); static const u8 sBGMName_BGM_TEST[] = _("TEST"); static const u8 sBGMName_BGM_GOMACHI0[] = _("GOMACHI0"); static const u8 sBGMName_BGM_GOTOWN[] = _("GOTOWN"); static const u8 sBGMName_BGM_POKECEN[] = _("POKECEN"); static const u8 sBGMName_BGM_NEXTROAD[] = _("NEXTROAD"); static const u8 sBGMName_BGM_GRANROAD[] = _("GRANROAD"); static const u8 sBGMName_BGM_CYCLING[] = _("CYCLING"); static const u8 sBGMName_BGM_FRIENDLY[] = _("FRIENDLY"); static const u8 sBGMName_BGM_MISHIRO[] = _("MISHIRO"); static const u8 sBGMName_BGM_TOZAN[] = _("TOZAN"); static const u8 sBGMName_BGM_GIRLEYE[] = _("GIRLEYE"); static const u8 sBGMName_BGM_MINAMO[] = _("MINAMO"); static const u8 sBGMName_BGM_ASHROAD[] = _("ASHROAD"); static const u8 sBGMName_BGM_EVENT0[] = _("EVENT0"); static const u8 sBGMName_BGM_DEEPDEEP[] = _("DEEPDEEP"); static const u8 sBGMName_BGM_KACHI1[] = _("KACHI1"); static const u8 sBGMName_BGM_TITLE3[] = _("TITLE3"); static const u8 sBGMName_BGM_DEMO1[] = _("DEMO1"); static const u8 sBGMName_BGM_GIRL_SUP[] = _("GIRL-SUP"); static const u8 sBGMName_BGM_HAGESHII[] = _("HAGESHII"); static const u8 sBGMName_BGM_KAKKOII[] = _("KAKKOII"); static const u8 sBGMName_BGM_KAZANBAI[] = _("KAZANBAI"); static const u8 sBGMName_BGM_AQA_0[] = _("AQA-0"); static const u8 sBGMName_BGM_TSURETEK[] = _("TSURETEK"); static const u8 sBGMName_BGM_BOY_SUP[] = _("BOY-SUP"); static const u8 sBGMName_BGM_RAINBOW[] = _("RAINBOW"); static const u8 sBGMName_BGM_AYASII[] = _("AYASII"); static const u8 sBGMName_BGM_KACHI4[] = _("KACHI4"); static const u8 sBGMName_BGM_ROPEWAY[] = _("ROPEWAY"); static const u8 sBGMName_BGM_CASINO[] = _("CASINO"); static const u8 sBGMName_BGM_HIGHTOWN[] = _("HIGHTOWN"); static const u8 sBGMName_BGM_SAFARI[] = _("SAFARI"); static const u8 sBGMName_BGM_C_ROAD[] = _("C-ROAD"); static const u8 sBGMName_BGM_AJITO[] = _("AJITO"); static const u8 sBGMName_BGM_M_BOAT[] = _("M-BOAT"); static const u8 sBGMName_BGM_M_DUNGON[] = _("M-DUNGON"); static const u8 sBGMName_BGM_FINECITY[] = _("FINECITY"); static const u8 sBGMName_BGM_MACHUPI[] = _("MACHUPI"); static const u8 sBGMName_BGM_P_SCHOOL[] = _("P-SCHOOL"); static const u8 sBGMName_BGM_DENDOU[] = _("DENDOU"); static const u8 sBGMName_BGM_TONEKUSA[] = _("TONEKUSA"); static const u8 sBGMName_BGM_MABOROSI[] = _("MABOROSI"); static const u8 sBGMName_BGM_CON_FAN[] = _("CON-FAN"); static const u8 sBGMName_BGM_CONTEST0[] = _("CONTEST0"); static const u8 sBGMName_BGM_MGM0[] = _("MGM0"); static const u8 sBGMName_BGM_T_BATTLE[] = _("T-BATTLE"); static const u8 sBGMName_BGM_OOAME[] = _("OOAME"); static const u8 sBGMName_BGM_HIDERI[] = _("HIDERI"); static const u8 sBGMName_BGM_RUNECITY[] = _("RUNECITY"); static const u8 sBGMName_BGM_CON_K[] = _("CON-K"); static const u8 sBGMName_BGM_EIKOU_R[] = _("EIKOU-R"); static const u8 sBGMName_BGM_KARAKURI[] = _("KARAKURI"); static const u8 sBGMName_BGM_HUTAGO[] = _("HUTAGO"); static const u8 sBGMName_BGM_SITENNOU[] = _("SITENNOU"); static const u8 sBGMName_BGM_YAMA_EYE[] = _("YAMA-EYE"); static const u8 sBGMName_BGM_CONLOBBY[] = _("CONLOBBY"); static const u8 sBGMName_BGM_INTER_V[] = _("INTER-V"); static const u8 sBGMName_BGM_DAIGO[] = _("DAIGO"); static const u8 sBGMName_BGM_THANKFOR[] = _("THANKFOR"); static const u8 sBGMName_BGM_END[] = _("END"); static const u8 sBGMName_BGM_BATTLE27[] = _("BATTLE27"); static const u8 sBGMName_BGM_BATTLE31[] = _("BATTLE31"); static const u8 sBGMName_BGM_BATTLE20[] = _("BATTLE20"); static const u8 sBGMName_BGM_BATTLE32[] = _("BATTLE32"); static const u8 sBGMName_BGM_BATTLE33[] = _("BATTLE33"); static const u8 sBGMName_BGM_BATTLE36[] = _("BATTLE36"); static const u8 sBGMName_BGM_BATTLE34[] = _("BATTLE34"); static const u8 sBGMName_BGM_BATTLE35[] = _("BATTLE35"); static const u8 sBGMName_BGM_BATTLE38[] = _("BATTLE38"); static const u8 sBGMName_BGM_BATTLE30[] = _("BATTLE30");



static const u8 *const gBGMNames[] =
{
sBGMName_BGM_STOP, sBGMName_BGM_TETSUJI, sBGMName_BGM_FIELD13, sBGMName_BGM_KACHI22, sBGMName_BGM_KACHI2, sBGMName_BGM_KACHI3, sBGMName_BGM_KACHI5, sBGMName_BGM_PCC, sBGMName_BGM_NIBI, sBGMName_BGM_SUIKUN, sBGMName_BGM_DOORO1, sBGMName_BGM_DOORO_X1, sBGMName_BGM_DOORO_X3, sBGMName_BGM_MACHI_S2, sBGMName_BGM_MACHI_S4, sBGMName_BGM_GIM, sBGMName_BGM_NAMINORI, sBGMName_BGM_DAN01, sBGMName_BGM_FANFA1, sBGMName_BGM_ME_ASA, sBGMName_BGM_ME_BACHI, sBGMName_BGM_FANFA4, sBGMName_BGM_FANFA5, sBGMName_BGM_ME_WAZA, sBGMName_BGM_BIJYUTU, sBGMName_BGM_DOORO_X4, sBGMName_BGM_FUNE_KAN, sBGMName_BGM_ME_SHINKA, sBGMName_BGM_SHINKA, sBGMName_BGM_ME_WASURE, sBGMName_BGM_SYOUJOEYE, sBGMName_BGM_BOYEYE, sBGMName_BGM_DAN02, sBGMName_BGM_MACHI_S3, sBGMName_BGM_ODAMAKI, sBGMName_BGM_B_TOWER, sBGMName_BGM_SWIMEYE, sBGMName_BGM_DAN03, sBGMName_BGM_ME_KINOMI, sBGMName_BGM_ME_TAMA, sBGMName_BGM_ME_B_BIG, sBGMName_BGM_ME_B_SMALL, sBGMName_BGM_ME_ZANNEN, sBGMName_BGM_BD_TIME, sBGMName_BGM_TEST1, sBGMName_BGM_TEST2, sBGMName_BGM_TEST3, sBGMName_BGM_TEST4, sBGMName_BGM_TEST, sBGMName_BGM_GOMACHI0, sBGMName_BGM_GOTOWN, sBGMName_BGM_POKECEN, sBGMName_BGM_NEXTROAD, sBGMName_BGM_GRANROAD, sBGMName_BGM_CYCLING, sBGMName_BGM_FRIENDLY, sBGMName_BGM_MISHIRO, sBGMName_BGM_TOZAN, sBGMName_BGM_GIRLEYE, sBGMName_BGM_MINAMO, sBGMName_BGM_ASHROAD, sBGMName_BGM_EVENT0, sBGMName_BGM_DEEPDEEP, sBGMName_BGM_KACHI1, sBGMName_BGM_TITLE3, sBGMName_BGM_DEMO1, sBGMName_BGM_GIRL_SUP, sBGMName_BGM_HAGESHII, sBGMName_BGM_KAKKOII, sBGMName_BGM_KAZANBAI, sBGMName_BGM_AQA_0, sBGMName_BGM_TSURETEK, sBGMName_BGM_BOY_SUP, sBGMName_BGM_RAINBOW, sBGMName_BGM_AYASII, sBGMName_BGM_KACHI4, sBGMName_BGM_ROPEWAY, sBGMName_BGM_CASINO, sBGMName_BGM_HIGHTOWN, sBGMName_BGM_SAFARI, sBGMName_BGM_C_ROAD, sBGMName_BGM_AJITO, sBGMName_BGM_M_BOAT, sBGMName_BGM_M_DUNGON, sBGMName_BGM_FINECITY, sBGMName_BGM_MACHUPI, sBGMName_BGM_P_SCHOOL, sBGMName_BGM_DENDOU, sBGMName_BGM_TONEKUSA, sBGMName_BGM_MABOROSI, sBGMName_BGM_CON_FAN, sBGMName_BGM_CONTEST0, sBGMName_BGM_MGM0, sBGMName_BGM_T_BATTLE, sBGMName_BGM_OOAME, sBGMName_BGM_HIDERI, sBGMName_BGM_RUNECITY, sBGMName_BGM_CON_K, sBGMName_BGM_EIKOU_R, sBGMName_BGM_KARAKURI, sBGMName_BGM_HUTAGO, sBGMName_BGM_SITENNOU, sBGMName_BGM_YAMA_EYE, sBGMName_BGM_CONLOBBY, sBGMName_BGM_INTER_V, sBGMName_BGM_DAIGO, sBGMName_BGM_THANKFOR, sBGMName_BGM_END, sBGMName_BGM_BATTLE27, sBGMName_BGM_BATTLE31, sBGMName_BGM_BATTLE20, sBGMName_BGM_BATTLE32, sBGMName_BGM_BATTLE33, sBGMName_BGM_BATTLE36, sBGMName_BGM_BATTLE34, sBGMName_BGM_BATTLE35, sBGMName_BGM_BATTLE38, sBGMName_BGM_BATTLE30,
};




static const u8 sSEName_SE_STOP[] = _("STOP"); static const u8 sSEName_SE_KAIFUKU[] = _("KAIFUKU"); static const u8 sSEName_SE_PC_LOGON[] = _("PC-LOGON"); static const u8 sSEName_SE_PC_OFF[] = _("PC-OFF"); static const u8 sSEName_SE_PC_ON[] = _("PC-ON"); static const u8 sSEName_SE_SELECT[] = _("SELECT"); static const u8 sSEName_SE_WIN_OPEN[] = _("WIN-OPEN"); static const u8 sSEName_SE_WALL_HIT[] = _("WALL-HIT"); static const u8 sSEName_SE_DOOR[] = _("DOOR"); static const u8 sSEName_SE_KAIDAN[] = _("KAIDAN"); static const u8 sSEName_SE_DANSA[] = _("DANSA"); static const u8 sSEName_SE_JITENSYA[] = _("JITENSYA"); static const u8 sSEName_SE_KOUKA_L[] = _("KOUKA-L"); static const u8 sSEName_SE_KOUKA_M[] = _("KOUKA-M"); static const u8 sSEName_SE_KOUKA_H[] = _("KOUKA-H"); static const u8 sSEName_SE_BOWA2[] = _("BOWA2"); static const u8 sSEName_SE_POKE_DEAD[] = _("POKE-DEAD"); static const u8 sSEName_SE_NIGERU[] = _("NIGERU"); static const u8 sSEName_SE_JIDO_DOA[] = _("JIDO-DOA"); static const u8 sSEName_SE_NAMINORI[] = _("NAMINORI"); static const u8 sSEName_SE_BAN[] = _("BAN"); static const u8 sSEName_SE_PIN[] = _("PIN"); static const u8 sSEName_SE_BOO[] = _("BOO"); static const u8 sSEName_SE_BOWA[] = _("BOWA"); static const u8 sSEName_SE_JYUNI[] = _("JYUNI"); static const u8 sSEName_SE_A[] = _("A"); static const u8 sSEName_SE_I[] = _("I"); static const u8 sSEName_SE_U[] = _("U"); static const u8 sSEName_SE_E[] = _("E"); static const u8 sSEName_SE_O[] = _("O"); static const u8 sSEName_SE_N[] = _("N"); static const u8 sSEName_SE_SEIKAI[] = _("SEIKAI"); static const u8 sSEName_SE_HAZURE[] = _("HAZURE"); static const u8 sSEName_SE_EXP[] = _("EXP"); static const u8 sSEName_SE_JITE_PYOKO[] = _("JITE-PYOKO"); static const u8 sSEName_SE_MU_PACHI[] = _("MU-PACHI"); static const u8 sSEName_SE_TK_KASYA[] = _("TK-KASYA"); static const u8 sSEName_SE_FU_ZAKU[] = _("FU-ZAKU"); static const u8 sSEName_SE_FU_ZAKU2[] = _("FU-ZAKU2"); static const u8 sSEName_SE_FU_ZUZUZU[] = _("FU-ZUZUZU"); static const u8 sSEName_SE_RU_GASHIN[] = _("RU-GASHIN"); static const u8 sSEName_SE_RU_GASYAN[] = _("RU-GASYAN"); static const u8 sSEName_SE_RU_BARI[] = _("RU-BARI"); static const u8 sSEName_SE_RU_HYUU[] = _("RU-HYUU"); static const u8 sSEName_SE_KI_GASYAN[] = _("KI-GASYAN"); static const u8 sSEName_SE_TK_WARPIN[] = _("TK-WARPIN"); static const u8 sSEName_SE_TK_WARPOUT[] = _("TK-WARPOUT"); static const u8 sSEName_SE_TU_SAA[] = _("TU-SAA"); static const u8 sSEName_SE_HI_TURUN[] = _("HI-TURUN"); static const u8 sSEName_SE_TRACK_MOVE[] = _("TRACK-MOVE"); static const u8 sSEName_SE_TRACK_STOP[] = _("TRACK-STOP"); static const u8 sSEName_SE_TRACK_HAIK[] = _("TRACK-HAIK"); static const u8 sSEName_SE_TRACK_DOOR[] = _("TRACK-DOOR"); static const u8 sSEName_SE_MOTER[] = _("MOTER"); static const u8 sSEName_SE_CARD[] = _("CARD"); static const u8 sSEName_SE_SAVE[] = _("SAVE"); static const u8 sSEName_SE_KON[] = _("KON"); static const u8 sSEName_SE_KON2[] = _("KON2"); static const u8 sSEName_SE_KON3[] = _("KON3"); static const u8 sSEName_SE_KON4[] = _("KON4"); static const u8 sSEName_SE_SUIKOMU[] = _("SUIKOMU"); static const u8 sSEName_SE_NAGERU[] = _("NAGERU"); static const u8 sSEName_SE_TOY_C[] = _("TOY-C"); static const u8 sSEName_SE_TOY_D[] = _("TOY-D"); static const u8 sSEName_SE_TOY_E[] = _("TOY-E"); static const u8 sSEName_SE_TOY_F[] = _("TOY-F"); static const u8 sSEName_SE_TOY_G[] = _("TOY-G"); static const u8 sSEName_SE_TOY_A[] = _("TOY-A"); static const u8 sSEName_SE_TOY_B[] = _("TOY-B"); static const u8 sSEName_SE_TOY_C1[] = _("TOY-C1"); static const u8 sSEName_SE_MIZU[] = _("MIZU"); static const u8 sSEName_SE_HASHI[] = _("HASHI"); static const u8 sSEName_SE_DAUGI[] = _("DAUGI"); static const u8 sSEName_SE_PINPON[] = _("PINPON"); static const u8 sSEName_SE_FUUSEN1[] = _("FUUSEN1"); static const u8 sSEName_SE_FUUSEN2[] = _("FUUSEN2"); static const u8 sSEName_SE_FUUSEN3[] = _("FUUSEN3"); static const u8 sSEName_SE_TOY_KABE[] = _("TOY-KABE"); static const u8 sSEName_SE_TOY_DANGO[] = _("TOY-DANGO"); static const u8 sSEName_SE_DOKU[] = _("DOKU"); static const u8 sSEName_SE_ESUKA[] = _("ESUKA"); static const u8 sSEName_SE_T_AME[] = _("T-AME"); static const u8 sSEName_SE_T_AME_E[] = _("T-AME-E"); static const u8 sSEName_SE_T_OOAME[] = _("T-OOAME"); static const u8 sSEName_SE_T_OOAME_E[] = _("T-OOAME-E"); static const u8 sSEName_SE_T_KOAME[] = _("T-KOAME"); static const u8 sSEName_SE_T_KOAME_E[] = _("T-KOAME-E"); static const u8 sSEName_SE_T_KAMI[] = _("T-KAMI"); static const u8 sSEName_SE_T_KAMI2[] = _("T-KAMI2"); static const u8 sSEName_SE_ELEBETA[] = _("ELEBETA"); static const u8 sSEName_SE_HINSI[] = _("HINSI"); static const u8 sSEName_SE_EXPMAX[] = _("EXPMAX"); static const u8 sSEName_SE_TAMAKORO[] = _("TAMAKORO"); static const u8 sSEName_SE_TAMAKORO_E[] = _("TAMAKORO-E"); static const u8 sSEName_SE_BASABASA[] = _("BASABASA"); static const u8 sSEName_SE_REGI[] = _("REGI"); static const u8 sSEName_SE_C_GAJI[] = _("C-GAJI"); static const u8 sSEName_SE_C_MAKU_U[] = _("C-MAKU-U"); static const u8 sSEName_SE_C_MAKU_D[] = _("C-MAKU-D"); static const u8 sSEName_SE_C_PASI[] = _("C-PASI"); static const u8 sSEName_SE_C_SYU[] = _("C-SYU"); static const u8 sSEName_SE_C_PIKON[] = _("C-PIKON"); static const u8 sSEName_SE_REAPOKE[] = _("REAPOKE"); static const u8 sSEName_SE_OP_BASYU[] = _("OP-BASYU"); static const u8 sSEName_SE_BT_START[] = _("BT-START"); static const u8 sSEName_SE_DENDOU[] = _("DENDOU"); static const u8 sSEName_SE_JIHANKI[] = _("JIHANKI"); static const u8 sSEName_SE_TAMA[] = _("TAMA"); static const u8 sSEName_SE_Z_SCROLL[] = _("Z-SCROLL"); static const u8 sSEName_SE_Z_PAGE[] = _("Z-PAGE"); static const u8 sSEName_SE_PN_ON[] = _("PN-ON"); static const u8 sSEName_SE_PN_OFF[] = _("PN-OFF"); static const u8 sSEName_SE_Z_SEARCH[] = _("Z-SEARCH"); static const u8 sSEName_SE_TAMAGO[] = _("TAMAGO"); static const u8 sSEName_SE_TB_START[] = _("TB-START"); static const u8 sSEName_SE_TB_KON[] = _("TB-KON"); static const u8 sSEName_SE_TB_KARA[] = _("TB-KARA"); static const u8 sSEName_SE_BIDORO[] = _("BIDORO"); static const u8 sSEName_SE_W085[] = _("W085"); static const u8 sSEName_SE_W085B[] = _("W085B"); static const u8 sSEName_SE_W231[] = _("W231"); static const u8 sSEName_SE_W171[] = _("W171"); static const u8 sSEName_SE_W233[] = _("W233"); static const u8 sSEName_SE_W233B[] = _("W233B"); static const u8 sSEName_SE_W145[] = _("W145"); static const u8 sSEName_SE_W145B[] = _("W145B"); static const u8 sSEName_SE_W145C[] = _("W145C"); static const u8 sSEName_SE_W240[] = _("W240"); static const u8 sSEName_SE_W015[] = _("W015"); static const u8 sSEName_SE_W081[] = _("W081"); static const u8 sSEName_SE_W081B[] = _("W081B"); static const u8 sSEName_SE_W088[] = _("W088"); static const u8 sSEName_SE_W016[] = _("W016"); static const u8 sSEName_SE_W016B[] = _("W016B"); static const u8 sSEName_SE_W003[] = _("W003"); static const u8 sSEName_SE_W104[] = _("W104"); static const u8 sSEName_SE_W013[] = _("W013"); static const u8 sSEName_SE_W196[] = _("W196"); static const u8 sSEName_SE_W086[] = _("W086"); static const u8 sSEName_SE_W004[] = _("W004"); static const u8 sSEName_SE_W025[] = _("W025"); static const u8 sSEName_SE_W025B[] = _("W025B"); static const u8 sSEName_SE_W152[] = _("W152"); static const u8 sSEName_SE_W026[] = _("W026"); static const u8 sSEName_SE_W172[] = _("W172"); static const u8 sSEName_SE_W172B[] = _("W172B"); static const u8 sSEName_SE_W053[] = _("W053"); static const u8 sSEName_SE_W007[] = _("W007"); static const u8 sSEName_SE_W092[] = _("W092"); static const u8 sSEName_SE_W221[] = _("W221"); static const u8 sSEName_SE_W221B[] = _("W221B"); static const u8 sSEName_SE_W052[] = _("W052"); static const u8 sSEName_SE_W036[] = _("W036"); static const u8 sSEName_SE_W059[] = _("W059"); static const u8 sSEName_SE_W059B[] = _("W059B"); static const u8 sSEName_SE_W010[] = _("W010"); static const u8 sSEName_SE_W011[] = _("W011"); static const u8 sSEName_SE_W017[] = _("W017"); static const u8 sSEName_SE_W019[] = _("W019"); static const u8 sSEName_SE_W028[] = _("W028"); static const u8 sSEName_SE_W013B[] = _("W013B"); static const u8 sSEName_SE_W044[] = _("W044"); static const u8 sSEName_SE_W029[] = _("W029"); static const u8 sSEName_SE_W057[] = _("W057"); static const u8 sSEName_SE_W056[] = _("W056"); static const u8 sSEName_SE_W250[] = _("W250"); static const u8 sSEName_SE_W030[] = _("W030"); static const u8 sSEName_SE_W039[] = _("W039"); static const u8 sSEName_SE_W054[] = _("W054"); static const u8 sSEName_SE_W077[] = _("W077"); static const u8 sSEName_SE_W020[] = _("W020"); static const u8 sSEName_SE_W082[] = _("W082"); static const u8 sSEName_SE_W047[] = _("W047"); static const u8 sSEName_SE_W195[] = _("W195"); static const u8 sSEName_SE_W006[] = _("W006"); static const u8 sSEName_SE_W091[] = _("W091"); static const u8 sSEName_SE_W146[] = _("W146"); static const u8 sSEName_SE_W120[] = _("W120"); static const u8 sSEName_SE_W153[] = _("W153"); static const u8 sSEName_SE_W071B[] = _("W071B"); static const u8 sSEName_SE_W071[] = _("W071"); static const u8 sSEName_SE_W103[] = _("W103"); static const u8 sSEName_SE_W062[] = _("W062"); static const u8 sSEName_SE_W062B[] = _("W062B"); static const u8 sSEName_SE_W048[] = _("W048"); static const u8 sSEName_SE_W187[] = _("W187"); static const u8 sSEName_SE_W118[] = _("W118"); static const u8 sSEName_SE_W155[] = _("W155"); static const u8 sSEName_SE_W122[] = _("W122"); static const u8 sSEName_SE_W060[] = _("W060"); static const u8 sSEName_SE_W185[] = _("W185"); static const u8 sSEName_SE_W014[] = _("W014"); static const u8 sSEName_SE_W043[] = _("W043"); static const u8 sSEName_SE_W207[] = _("W207"); static const u8 sSEName_SE_W207B[] = _("W207B"); static const u8 sSEName_SE_W215[] = _("W215"); static const u8 sSEName_SE_W109[] = _("W109"); static const u8 sSEName_SE_W173[] = _("W173"); static const u8 sSEName_SE_W280[] = _("W280"); static const u8 sSEName_SE_W202[] = _("W202"); static const u8 sSEName_SE_W060B[] = _("W060B"); static const u8 sSEName_SE_W076[] = _("W076"); static const u8 sSEName_SE_W080[] = _("W080"); static const u8 sSEName_SE_W100[] = _("W100"); static const u8 sSEName_SE_W107[] = _("W107"); static const u8 sSEName_SE_W166[] = _("W166"); static const u8 sSEName_SE_W129[] = _("W129"); static const u8 sSEName_SE_W115[] = _("W115"); static const u8 sSEName_SE_W112[] = _("W112"); static const u8 sSEName_SE_W197[] = _("W197"); static const u8 sSEName_SE_W199[] = _("W199"); static const u8 sSEName_SE_W236[] = _("W236"); static const u8 sSEName_SE_W204[] = _("W204"); static const u8 sSEName_SE_W268[] = _("W268"); static const u8 sSEName_SE_W070[] = _("W070"); static const u8 sSEName_SE_W063[] = _("W063"); static const u8 sSEName_SE_W127[] = _("W127"); static const u8 sSEName_SE_W179[] = _("W179"); static const u8 sSEName_SE_W151[] = _("W151"); static const u8 sSEName_SE_W201[] = _("W201"); static const u8 sSEName_SE_W161[] = _("W161"); static const u8 sSEName_SE_W161B[] = _("W161B"); static const u8 sSEName_SE_W227[] = _("W227"); static const u8 sSEName_SE_W227B[] = _("W227B"); static const u8 sSEName_SE_W226[] = _("W226"); static const u8 sSEName_SE_W208[] = _("W208"); static const u8 sSEName_SE_W213[] = _("W213"); static const u8 sSEName_SE_W213B[] = _("W213B"); static const u8 sSEName_SE_W234[] = _("W234"); static const u8 sSEName_SE_W260[] = _("W260"); static const u8 sSEName_SE_W328[] = _("W328"); static const u8 sSEName_SE_W320[] = _("W320"); static const u8 sSEName_SE_W255[] = _("W255"); static const u8 sSEName_SE_W291[] = _("W291"); static const u8 sSEName_SE_W089[] = _("W089"); static const u8 sSEName_SE_W239[] = _("W239"); static const u8 sSEName_SE_W230[] = _("W230"); static const u8 sSEName_SE_W281[] = _("W281"); static const u8 sSEName_SE_W327[] = _("W327"); static const u8 sSEName_SE_W287[] = _("W287"); static const u8 sSEName_SE_W257[] = _("W257"); static const u8 sSEName_SE_W253[] = _("W253"); static const u8 sSEName_SE_W258[] = _("W258"); static const u8 sSEName_SE_W322[] = _("W322"); static const u8 sSEName_SE_W298[] = _("W298"); static const u8 sSEName_SE_W287B[] = _("W287B"); static const u8 sSEName_SE_W114[] = _("W114"); static const u8 sSEName_SE_W063B[] = _("W063B");



static const u8 *const gSENames[] =
{
sSEName_SE_STOP, sSEName_SE_KAIFUKU, sSEName_SE_PC_LOGON, sSEName_SE_PC_OFF, sSEName_SE_PC_ON, sSEName_SE_SELECT, sSEName_SE_WIN_OPEN, sSEName_SE_WALL_HIT, sSEName_SE_DOOR, sSEName_SE_KAIDAN, sSEName_SE_DANSA, sSEName_SE_JITENSYA, sSEName_SE_KOUKA_L, sSEName_SE_KOUKA_M, sSEName_SE_KOUKA_H, sSEName_SE_BOWA2, sSEName_SE_POKE_DEAD, sSEName_SE_NIGERU, sSEName_SE_JIDO_DOA, sSEName_SE_NAMINORI, sSEName_SE_BAN, sSEName_SE_PIN, sSEName_SE_BOO, sSEName_SE_BOWA, sSEName_SE_JYUNI, sSEName_SE_A, sSEName_SE_I, sSEName_SE_U, sSEName_SE_E, sSEName_SE_O, sSEName_SE_N, sSEName_SE_SEIKAI, sSEName_SE_HAZURE, sSEName_SE_EXP, sSEName_SE_JITE_PYOKO, sSEName_SE_MU_PACHI, sSEName_SE_TK_KASYA, sSEName_SE_FU_ZAKU, sSEName_SE_FU_ZAKU2, sSEName_SE_FU_ZUZUZU, sSEName_SE_RU_GASHIN, sSEName_SE_RU_GASYAN, sSEName_SE_RU_BARI, sSEName_SE_RU_HYUU, sSEName_SE_KI_GASYAN, sSEName_SE_TK_WARPIN, sSEName_SE_TK_WARPOUT, sSEName_SE_TU_SAA, sSEName_SE_HI_TURUN, sSEName_SE_TRACK_MOVE, sSEName_SE_TRACK_STOP, sSEName_SE_TRACK_HAIK, sSEName_SE_TRACK_DOOR, sSEName_SE_MOTER, sSEName_SE_CARD, sSEName_SE_SAVE, sSEName_SE_KON, sSEName_SE_KON2, sSEName_SE_KON3, sSEName_SE_KON4, sSEName_SE_SUIKOMU, sSEName_SE_NAGERU, sSEName_SE_TOY_C, sSEName_SE_TOY_D, sSEName_SE_TOY_E, sSEName_SE_TOY_F, sSEName_SE_TOY_G, sSEName_SE_TOY_A, sSEName_SE_TOY_B, sSEName_SE_TOY_C1, sSEName_SE_MIZU, sSEName_SE_HASHI, sSEName_SE_DAUGI, sSEName_SE_PINPON, sSEName_SE_FUUSEN1, sSEName_SE_FUUSEN2, sSEName_SE_FUUSEN3, sSEName_SE_TOY_KABE, sSEName_SE_TOY_DANGO, sSEName_SE_DOKU, sSEName_SE_ESUKA, sSEName_SE_T_AME, sSEName_SE_T_AME_E, sSEName_SE_T_OOAME, sSEName_SE_T_OOAME_E, sSEName_SE_T_KOAME, sSEName_SE_T_KOAME_E, sSEName_SE_T_KAMI, sSEName_SE_T_KAMI2, sSEName_SE_ELEBETA, sSEName_SE_HINSI, sSEName_SE_EXPMAX, sSEName_SE_TAMAKORO, sSEName_SE_TAMAKORO_E, sSEName_SE_BASABASA, sSEName_SE_REGI, sSEName_SE_C_GAJI, sSEName_SE_C_MAKU_U, sSEName_SE_C_MAKU_D, sSEName_SE_C_PASI, sSEName_SE_C_SYU, sSEName_SE_C_PIKON, sSEName_SE_REAPOKE, sSEName_SE_OP_BASYU, sSEName_SE_BT_START, sSEName_SE_DENDOU, sSEName_SE_JIHANKI, sSEName_SE_TAMA, sSEName_SE_Z_SCROLL, sSEName_SE_Z_PAGE, sSEName_SE_PN_ON, sSEName_SE_PN_OFF, sSEName_SE_Z_SEARCH, sSEName_SE_TAMAGO, sSEName_SE_TB_START, sSEName_SE_TB_KON, sSEName_SE_TB_KARA, sSEName_SE_BIDORO, sSEName_SE_W085, sSEName_SE_W085B, sSEName_SE_W231, sSEName_SE_W171, sSEName_SE_W233, sSEName_SE_W233B, sSEName_SE_W145, sSEName_SE_W145B, sSEName_SE_W145C, sSEName_SE_W240, sSEName_SE_W015, sSEName_SE_W081, sSEName_SE_W081B, sSEName_SE_W088, sSEName_SE_W016, sSEName_SE_W016B, sSEName_SE_W003, sSEName_SE_W104, sSEName_SE_W013, sSEName_SE_W196, sSEName_SE_W086, sSEName_SE_W004, sSEName_SE_W025, sSEName_SE_W025B, sSEName_SE_W152, sSEName_SE_W026, sSEName_SE_W172, sSEName_SE_W172B, sSEName_SE_W053, sSEName_SE_W007, sSEName_SE_W092, sSEName_SE_W221, sSEName_SE_W221B, sSEName_SE_W052, sSEName_SE_W036, sSEName_SE_W059, sSEName_SE_W059B, sSEName_SE_W010, sSEName_SE_W011, sSEName_SE_W017, sSEName_SE_W019, sSEName_SE_W028, sSEName_SE_W013B, sSEName_SE_W044, sSEName_SE_W029, sSEName_SE_W057, sSEName_SE_W056, sSEName_SE_W250, sSEName_SE_W030, sSEName_SE_W039, sSEName_SE_W054, sSEName_SE_W077, sSEName_SE_W020, sSEName_SE_W082, sSEName_SE_W047, sSEName_SE_W195, sSEName_SE_W006, sSEName_SE_W091, sSEName_SE_W146, sSEName_SE_W120, sSEName_SE_W153, sSEName_SE_W071B, sSEName_SE_W071, sSEName_SE_W103, sSEName_SE_W062, sSEName_SE_W062B, sSEName_SE_W048, sSEName_SE_W187, sSEName_SE_W118, sSEName_SE_W155, sSEName_SE_W122, sSEName_SE_W060, sSEName_SE_W185, sSEName_SE_W014, sSEName_SE_W043, sSEName_SE_W207, sSEName_SE_W207B, sSEName_SE_W215, sSEName_SE_W109, sSEName_SE_W173, sSEName_SE_W280, sSEName_SE_W202, sSEName_SE_W060B, sSEName_SE_W076, sSEName_SE_W080, sSEName_SE_W100, sSEName_SE_W107, sSEName_SE_W166, sSEName_SE_W129, sSEName_SE_W115, sSEName_SE_W112, sSEName_SE_W197, sSEName_SE_W199, sSEName_SE_W236, sSEName_SE_W204, sSEName_SE_W268, sSEName_SE_W070, sSEName_SE_W063, sSEName_SE_W127, sSEName_SE_W179, sSEName_SE_W151, sSEName_SE_W201, sSEName_SE_W161, sSEName_SE_W161B, sSEName_SE_W227, sSEName_SE_W227B, sSEName_SE_W226, sSEName_SE_W208, sSEName_SE_W213, sSEName_SE_W213B, sSEName_SE_W234, sSEName_SE_W260, sSEName_SE_W328, sSEName_SE_W320, sSEName_SE_W255, sSEName_SE_W291, sSEName_SE_W089, sSEName_SE_W239, sSEName_SE_W230, sSEName_SE_W281, sSEName_SE_W327, sSEName_SE_W287, sSEName_SE_W257, sSEName_SE_W253, sSEName_SE_W258, sSEName_SE_W322, sSEName_SE_W298, sSEName_SE_W287B, sSEName_SE_W114, sSEName_SE_W063B,
};


void Task_InitCryTest(u8 taskId)
{
    struct CryRelatedStruct cryStruct, cryStruct2;
    u8 zero;

    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    gSoundTestCryNum = 1;
    ResetSpriteData();
    FreeAllSpritePalettes();

    cryStruct.unk0 = 0x2000;
    cryStruct.unk2 = 29;
    cryStruct.paletteNo = 12;
    cryStruct.yPos = 30;
    cryStruct.xPos = 4;

    zero = 0;
    gUnknown_03005E98 = 0;

    while (sub_8119E3C(&cryStruct, 3) == 0)
        ;

    cryStruct2.unk0 = 0;
    cryStruct2.unk2 = 15;
    cryStruct2.paletteNo = 13;
    cryStruct2.xPos = 12;
    cryStruct2.yPos = 12;

    zero = 0;
    gUnknown_03005E98 = 0;

    while (ShowPokedexCryScreen(&cryStruct2, 2) == 0)
        ;

    MenuDrawTextWindow(0, 16, 5, 19);
    PrintCryNumber();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    (*(vu16 *)(0x4000000 + 0x18)) = 0;
    (*(vu16 *)(0x4000000 + 0x1a)) = 0;
    (*(vu16 *)(0x4000000 + 0xc)) = 0xF01;
    (*(vu16 *)(0x4000000 + 0xe)) = 0x1D03;
    (*(vu16 *)(0x4000000 + 0x0)) = 0x1d40;
    m4aMPlayFadeOutTemporarily(&gMPlay_BGM, 2);
    gTasks[taskId].func = Task_ProcessCryTestInput;
}

void Task_ProcessCryTestInput(u8 taskId)
{
    sub_8119F88(3);

    if (gMain.newKeys & 0x0001)
    {
        sub_811A050(gSoundTestCryNum);
    }
    if (gMain.newKeys & 0x0100)
    {
        StopCryAndClearCrySongs();
    }
    if (gMain.newAndRepeatedKeys & 0x0040)
    {
        if(--gSoundTestCryNum == 0)
            gSoundTestCryNum = 384;
        PrintCryNumber();
    }
    if (gMain.newAndRepeatedKeys & 0x0080)
    {
        if(++gSoundTestCryNum > 384)
            gSoundTestCryNum = 1;
        PrintCryNumber();
    }
    if (gMain.newKeys & 0x0002)
    {
        (*(vu16 *)(0x4000000 + 0x0)) = 0x7140;
        (*(vu16 *)(0x4000000 + 0x40)) = (((17) << 8) | (223));
        (*(vu16 *)(0x4000000 + 0x44)) = (((1) << 8) | (31));
        MenuZeroFillWindowRect(0, 0, 29, 19);
        gTasks[taskId].func = Task_InitSoundCheckMenu;
        DestroyCryMeterNeedleSprite();
    }
}

void PrintCryNumber(void)
{
    PrintSignedNumber(gSoundTestCryNum, 1, 17, 3);
}
