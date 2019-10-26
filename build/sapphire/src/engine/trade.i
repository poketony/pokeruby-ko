# 1 "src/engine/trade.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/engine/trade.c"
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
# 2 "src/engine/trade.c" 2
# 1 "include/name_string_util.h" 1



void PadNameString(u8 *a1, u8 a2);
void SanitizeNameString(u8 *a1);
# 3 "src/engine/trade.c" 2
# 1 "include/string_util.h" 1



enum StringConvertMode
{
    STR_CONV_MODE_LEFT_ALIGN,
    STR_CONV_MODE_RIGHT_ALIGN,
    STR_CONV_MODE_LEADING_ZEROS
};

extern const u8 gEmptyString_81E72B0[];

u8 *StringCopy10(u8 *dest, const u8 *src);
u8 *StringGetEnd10(u8 *str);
u8 *StringCopy8(u8 *dest, const u8 *src);
u8 *StringCopy(u8 *dest, const u8 *src);
u8 *StringAppend(u8 *dest, const u8 *src);
u8 *StringCopyN(u8 *dest, const u8 *src, u8 n);
u8 *StringAppendN(u8 *dest, const u8 *src, u8 n);
u16 StringLength(const u8 *str);
s32 StringCompare(const u8 *str1, const u8 *str2);
s32 StringCompareN(const u8 *str1, const u8 *str2, u32 n);
u8 *ConvertIntToDecimalStringN(u8 *dest, s32 value, enum StringConvertMode mode, u8 n);
u8 *ConvertIntToDecimalStringN_DigitWidth6(u8 *dest, s32 value, enum StringConvertMode mode, u8 n);
u8 *ConvertIntToHexStringN(u8 *dest, s32 value, enum StringConvertMode mode, u8 n);
u8 *ConvertIntToDecimalString(u8 *dest, s32 value);
u8 *StringExpandPlaceholders(u8 *dest, const u8 *src);
u8 *StringBraille(u8 *dest, const u8 *src);
const u8 *GetExpandedPlaceholder(u32 id);
u8 *StringFill(u8 *dest, u8 c, u16 n);
u8 *StringCopyPadded(u8 *dest, const u8 *src, u8 c, u16 n);
u8 *StringFillWithTerminator(u8 *dest, u16 n);
# 4 "src/engine/trade.c" 2
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
# 5 "src/engine/trade.c" 2
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
# 6 "src/engine/trade.c" 2
# 1 "include/species.h" 1



enum
{
    SPECIES_NONE,
    SPECIES_BULBASAUR,
    SPECIES_IVYSAUR,
    SPECIES_VENUSAUR,
    SPECIES_CHARMANDER,
    SPECIES_CHARMELEON,
    SPECIES_CHARIZARD,
    SPECIES_SQUIRTLE,
    SPECIES_WARTORTLE,
    SPECIES_BLASTOISE,
    SPECIES_CATERPIE,
    SPECIES_METAPOD,
    SPECIES_BUTTERFREE,
    SPECIES_WEEDLE,
    SPECIES_KAKUNA,
    SPECIES_BEEDRILL,
    SPECIES_PIDGEY,
    SPECIES_PIDGEOTTO,
    SPECIES_PIDGEOT,
    SPECIES_RATTATA,
    SPECIES_RATICATE,
    SPECIES_SPEAROW,
    SPECIES_FEAROW,
    SPECIES_EKANS,
    SPECIES_ARBOK,
    SPECIES_PIKACHU,
    SPECIES_RAICHU,
    SPECIES_SANDSHREW,
    SPECIES_SANDSLASH,
    SPECIES_NIDORAN_F,
    SPECIES_NIDORINA,
    SPECIES_NIDOQUEEN,
    SPECIES_NIDORAN_M,
    SPECIES_NIDORINO,
    SPECIES_NIDOKING,
    SPECIES_CLEFAIRY,
    SPECIES_CLEFABLE,
    SPECIES_VULPIX,
    SPECIES_NINETALES,
    SPECIES_JIGGLYPUFF,
    SPECIES_WIGGLYTUFF,
    SPECIES_ZUBAT,
    SPECIES_GOLBAT,
    SPECIES_ODDISH,
    SPECIES_GLOOM,
    SPECIES_VILEPLUME,
    SPECIES_PARAS,
    SPECIES_PARASECT,
    SPECIES_VENONAT,
    SPECIES_VENOMOTH,
    SPECIES_DIGLETT,
    SPECIES_DUGTRIO,
    SPECIES_MEOWTH,
    SPECIES_PERSIAN,
    SPECIES_PSYDUCK,
    SPECIES_GOLDUCK,
    SPECIES_MANKEY,
    SPECIES_PRIMEAPE,
    SPECIES_GROWLITHE,
    SPECIES_ARCANINE,
    SPECIES_POLIWAG,
    SPECIES_POLIWHIRL,
    SPECIES_POLIWRATH,
    SPECIES_ABRA,
    SPECIES_KADABRA,
    SPECIES_ALAKAZAM,
    SPECIES_MACHOP,
    SPECIES_MACHOKE,
    SPECIES_MACHAMP,
    SPECIES_BELLSPROUT,
    SPECIES_WEEPINBELL,
    SPECIES_VICTREEBEL,
    SPECIES_TENTACOOL,
    SPECIES_TENTACRUEL,
    SPECIES_GEODUDE,
    SPECIES_GRAVELER,
    SPECIES_GOLEM,
    SPECIES_PONYTA,
    SPECIES_RAPIDASH,
    SPECIES_SLOWPOKE,
    SPECIES_SLOWBRO,
    SPECIES_MAGNEMITE,
    SPECIES_MAGNETON,
    SPECIES_FARFETCHD,
    SPECIES_DODUO,
    SPECIES_DODRIO,
    SPECIES_SEEL,
    SPECIES_DEWGONG,
    SPECIES_GRIMER,
    SPECIES_MUK,
    SPECIES_SHELLDER,
    SPECIES_CLOYSTER,
    SPECIES_GASTLY,
    SPECIES_HAUNTER,
    SPECIES_GENGAR,
    SPECIES_ONIX,
    SPECIES_DROWZEE,
    SPECIES_HYPNO,
    SPECIES_KRABBY,
    SPECIES_KINGLER,
    SPECIES_VOLTORB,
    SPECIES_ELECTRODE,
    SPECIES_EXEGGCUTE,
    SPECIES_EXEGGUTOR,
    SPECIES_CUBONE,
    SPECIES_MAROWAK,
    SPECIES_HITMONLEE,
    SPECIES_HITMONCHAN,
    SPECIES_LICKITUNG,
    SPECIES_KOFFING,
    SPECIES_WEEZING,
    SPECIES_RHYHORN,
    SPECIES_RHYDON,
    SPECIES_CHANSEY,
    SPECIES_TANGELA,
    SPECIES_KANGASKHAN,
    SPECIES_HORSEA,
    SPECIES_SEADRA,
    SPECIES_GOLDEEN,
    SPECIES_SEAKING,
    SPECIES_STARYU,
    SPECIES_STARMIE,
    SPECIES_MR_MIME,
    SPECIES_SCYTHER,
    SPECIES_JYNX,
    SPECIES_ELECTABUZZ,
    SPECIES_MAGMAR,
    SPECIES_PINSIR,
    SPECIES_TAUROS,
    SPECIES_MAGIKARP,
    SPECIES_GYARADOS,
    SPECIES_LAPRAS,
    SPECIES_DITTO,
    SPECIES_EEVEE,
    SPECIES_VAPOREON,
    SPECIES_JOLTEON,
    SPECIES_FLAREON,
    SPECIES_PORYGON,
    SPECIES_OMANYTE,
    SPECIES_OMASTAR,
    SPECIES_KABUTO,
    SPECIES_KABUTOPS,
    SPECIES_AERODACTYL,
    SPECIES_SNORLAX,
    SPECIES_ARTICUNO,
    SPECIES_ZAPDOS,
    SPECIES_MOLTRES,
    SPECIES_DRATINI,
    SPECIES_DRAGONAIR,
    SPECIES_DRAGONITE,
    SPECIES_MEWTWO,
    SPECIES_MEW,
    SPECIES_CHIKORITA,
    SPECIES_BAYLEEF,
    SPECIES_MEGANIUM,
    SPECIES_CYNDAQUIL,
    SPECIES_QUILAVA,
    SPECIES_TYPHLOSION,
    SPECIES_TOTODILE,
    SPECIES_CROCONAW,
    SPECIES_FERALIGATR,
    SPECIES_SENTRET,
    SPECIES_FURRET,
    SPECIES_HOOTHOOT,
    SPECIES_NOCTOWL,
    SPECIES_LEDYBA,
    SPECIES_LEDIAN,
    SPECIES_SPINARAK,
    SPECIES_ARIADOS,
    SPECIES_CROBAT,
    SPECIES_CHINCHOU,
    SPECIES_LANTURN,
    SPECIES_PICHU,
    SPECIES_CLEFFA,
    SPECIES_IGGLYBUFF,
    SPECIES_TOGEPI,
    SPECIES_TOGETIC,
    SPECIES_NATU,
    SPECIES_XATU,
    SPECIES_MAREEP,
    SPECIES_FLAAFFY,
    SPECIES_AMPHAROS,
    SPECIES_BELLOSSOM,
    SPECIES_MARILL,
    SPECIES_AZUMARILL,
    SPECIES_SUDOWOODO,
    SPECIES_POLITOED,
    SPECIES_HOPPIP,
    SPECIES_SKIPLOOM,
    SPECIES_JUMPLUFF,
    SPECIES_AIPOM,
    SPECIES_SUNKERN,
    SPECIES_SUNFLORA,
    SPECIES_YANMA,
    SPECIES_WOOPER,
    SPECIES_QUAGSIRE,
    SPECIES_ESPEON,
    SPECIES_UMBREON,
    SPECIES_MURKROW,
    SPECIES_SLOWKING,
    SPECIES_MISDREAVUS,
    SPECIES_UNOWN,
    SPECIES_WOBBUFFET,
    SPECIES_GIRAFARIG,
    SPECIES_PINECO,
    SPECIES_FORRETRESS,
    SPECIES_DUNSPARCE,
    SPECIES_GLIGAR,
    SPECIES_STEELIX,
    SPECIES_SNUBBULL,
    SPECIES_GRANBULL,
    SPECIES_QWILFISH,
    SPECIES_SCIZOR,
    SPECIES_SHUCKLE,
    SPECIES_HERACROSS,
    SPECIES_SNEASEL,
    SPECIES_TEDDIURSA,
    SPECIES_URSARING,
    SPECIES_SLUGMA,
    SPECIES_MAGCARGO,
    SPECIES_SWINUB,
    SPECIES_PILOSWINE,
    SPECIES_CORSOLA,
    SPECIES_REMORAID,
    SPECIES_OCTILLERY,
    SPECIES_DELIBIRD,
    SPECIES_MANTINE,
    SPECIES_SKARMORY,
    SPECIES_HOUNDOUR,
    SPECIES_HOUNDOOM,
    SPECIES_KINGDRA,
    SPECIES_PHANPY,
    SPECIES_DONPHAN,
    SPECIES_PORYGON2,
    SPECIES_STANTLER,
    SPECIES_SMEARGLE,
    SPECIES_TYROGUE,
    SPECIES_HITMONTOP,
    SPECIES_SMOOCHUM,
    SPECIES_ELEKID,
    SPECIES_MAGBY,
    SPECIES_MILTANK,
    SPECIES_BLISSEY,
    SPECIES_RAIKOU,
    SPECIES_ENTEI,
    SPECIES_SUICUNE,
    SPECIES_LARVITAR,
    SPECIES_PUPITAR,
    SPECIES_TYRANITAR,
    SPECIES_LUGIA,
    SPECIES_HO_OH,
    SPECIES_CELEBI,

    SPECIES_OLD_UNOWN_B,
    SPECIES_OLD_UNOWN_C,
    SPECIES_OLD_UNOWN_D,
    SPECIES_OLD_UNOWN_E,
    SPECIES_OLD_UNOWN_F,
    SPECIES_OLD_UNOWN_G,
    SPECIES_OLD_UNOWN_H,
    SPECIES_OLD_UNOWN_I,
    SPECIES_OLD_UNOWN_J,
    SPECIES_OLD_UNOWN_K,
    SPECIES_OLD_UNOWN_L,
    SPECIES_OLD_UNOWN_M,
    SPECIES_OLD_UNOWN_N,
    SPECIES_OLD_UNOWN_O,
    SPECIES_OLD_UNOWN_P,
    SPECIES_OLD_UNOWN_Q,
    SPECIES_OLD_UNOWN_R,
    SPECIES_OLD_UNOWN_S,
    SPECIES_OLD_UNOWN_T,
    SPECIES_OLD_UNOWN_U,
    SPECIES_OLD_UNOWN_V,
    SPECIES_OLD_UNOWN_W,
    SPECIES_OLD_UNOWN_X,
    SPECIES_OLD_UNOWN_Y,
    SPECIES_OLD_UNOWN_Z,

    SPECIES_TREECKO,
    SPECIES_GROVYLE,
    SPECIES_SCEPTILE,
    SPECIES_TORCHIC,
    SPECIES_COMBUSKEN,
    SPECIES_BLAZIKEN,
    SPECIES_MUDKIP,
    SPECIES_MARSHTOMP,
    SPECIES_SWAMPERT,
    SPECIES_POOCHYENA,
    SPECIES_MIGHTYENA,
    SPECIES_ZIGZAGOON,
    SPECIES_LINOONE,
    SPECIES_WURMPLE,
    SPECIES_SILCOON,
    SPECIES_BEAUTIFLY,
    SPECIES_CASCOON,
    SPECIES_DUSTOX,
    SPECIES_LOTAD,
    SPECIES_LOMBRE,
    SPECIES_LUDICOLO,
    SPECIES_SEEDOT,
    SPECIES_NUZLEAF,
    SPECIES_SHIFTRY,
    SPECIES_NINCADA,
    SPECIES_NINJASK,
    SPECIES_SHEDINJA,
    SPECIES_TAILLOW,
    SPECIES_SWELLOW,
    SPECIES_SHROOMISH,
    SPECIES_BRELOOM,
    SPECIES_SPINDA,
    SPECIES_WINGULL,
    SPECIES_PELIPPER,
    SPECIES_SURSKIT,
    SPECIES_MASQUERAIN,
    SPECIES_WAILMER,
    SPECIES_WAILORD,
    SPECIES_SKITTY,
    SPECIES_DELCATTY,
    SPECIES_KECLEON,
    SPECIES_BALTOY,
    SPECIES_CLAYDOL,
    SPECIES_NOSEPASS,
    SPECIES_TORKOAL,
    SPECIES_SABLEYE,
    SPECIES_BARBOACH,
    SPECIES_WHISCASH,
    SPECIES_LUVDISC,
    SPECIES_CORPHISH,
    SPECIES_CRAWDAUNT,
    SPECIES_FEEBAS,
    SPECIES_MILOTIC,
    SPECIES_CARVANHA,
    SPECIES_SHARPEDO,
    SPECIES_TRAPINCH,
    SPECIES_VIBRAVA,
    SPECIES_FLYGON,
    SPECIES_MAKUHITA,
    SPECIES_HARIYAMA,
    SPECIES_ELECTRIKE,
    SPECIES_MANECTRIC,
    SPECIES_NUMEL,
    SPECIES_CAMERUPT,
    SPECIES_SPHEAL,
    SPECIES_SEALEO,
    SPECIES_WALREIN,
    SPECIES_CACNEA,
    SPECIES_CACTURNE,
    SPECIES_SNORUNT,
    SPECIES_GLALIE,
    SPECIES_LUNATONE,
    SPECIES_SOLROCK,
    SPECIES_AZURILL,
    SPECIES_SPOINK,
    SPECIES_GRUMPIG,
    SPECIES_PLUSLE,
    SPECIES_MINUN,
    SPECIES_MAWILE,
    SPECIES_MEDITITE,
    SPECIES_MEDICHAM,
    SPECIES_SWABLU,
    SPECIES_ALTARIA,
    SPECIES_WYNAUT,
    SPECIES_DUSKULL,
    SPECIES_DUSCLOPS,
    SPECIES_ROSELIA,
    SPECIES_SLAKOTH,
    SPECIES_VIGOROTH,
    SPECIES_SLAKING,
    SPECIES_GULPIN,
    SPECIES_SWALOT,
    SPECIES_TROPIUS,
    SPECIES_WHISMUR,
    SPECIES_LOUDRED,
    SPECIES_EXPLOUD,
    SPECIES_CLAMPERL,
    SPECIES_HUNTAIL,
    SPECIES_GOREBYSS,
    SPECIES_ABSOL,
    SPECIES_SHUPPET,
    SPECIES_BANETTE,
    SPECIES_SEVIPER,
    SPECIES_ZANGOOSE,
    SPECIES_RELICANTH,
    SPECIES_ARON,
    SPECIES_LAIRON,
    SPECIES_AGGRON,
    SPECIES_CASTFORM,
    SPECIES_VOLBEAT,
    SPECIES_ILLUMISE,
    SPECIES_LILEEP,
    SPECIES_CRADILY,
    SPECIES_ANORITH,
    SPECIES_ARMALDO,
    SPECIES_RALTS,
    SPECIES_KIRLIA,
    SPECIES_GARDEVOIR,
    SPECIES_BAGON,
    SPECIES_SHELGON,
    SPECIES_SALAMENCE,
    SPECIES_BELDUM,
    SPECIES_METANG,
    SPECIES_METAGROSS,
    SPECIES_REGIROCK,
    SPECIES_REGICE,
    SPECIES_REGISTEEL,
    SPECIES_KYOGRE,
    SPECIES_GROUDON,
    SPECIES_RAYQUAZA,
    SPECIES_LATIAS,
    SPECIES_LATIOS,
    SPECIES_JIRACHI,
    SPECIES_DEOXYS,
    SPECIES_CHIMECHO,
    SPECIES_EGG,

    SPECIES_UNOWN_B,
    SPECIES_UNOWN_C,
    SPECIES_UNOWN_D,
    SPECIES_UNOWN_E,
    SPECIES_UNOWN_F,
    SPECIES_UNOWN_G,
    SPECIES_UNOWN_H,
    SPECIES_UNOWN_I,
    SPECIES_UNOWN_J,
    SPECIES_UNOWN_K,
    SPECIES_UNOWN_L,
    SPECIES_UNOWN_M,
    SPECIES_UNOWN_N,
    SPECIES_UNOWN_O,
    SPECIES_UNOWN_P,
    SPECIES_UNOWN_Q,
    SPECIES_UNOWN_R,
    SPECIES_UNOWN_S,
    SPECIES_UNOWN_T,
    SPECIES_UNOWN_U,
    SPECIES_UNOWN_V,
    SPECIES_UNOWN_W,
    SPECIES_UNOWN_X,
    SPECIES_UNOWN_Y,
    SPECIES_UNOWN_Z,
    SPECIES_UNOWN_EMARK,
    SPECIES_UNOWN_QMARK,
};
# 7 "src/engine/trade.c" 2
# 1 "include/items.h" 1



enum
{
    ITEM_NONE,
    ITEM_MASTER_BALL,
    ITEM_ULTRA_BALL,
    ITEM_GREAT_BALL,
    ITEM_POKE_BALL,
    ITEM_SAFARI_BALL,
    ITEM_NET_BALL,
    ITEM_DIVE_BALL,
    ITEM_NEST_BALL,
    ITEM_REPEAT_BALL,
    ITEM_TIMER_BALL,
    ITEM_LUXURY_BALL,
    ITEM_PREMIER_BALL,
    ITEM_POTION,
    ITEM_ANTIDOTE,
    ITEM_BURN_HEAL,
    ITEM_ICE_HEAL,
    ITEM_AWAKENING,
    ITEM_PARALYZE_HEAL,
    ITEM_FULL_RESTORE,
    ITEM_MAX_POTION,
    ITEM_HYPER_POTION,
    ITEM_SUPER_POTION,
    ITEM_FULL_HEAL,
    ITEM_REVIVE,
    ITEM_MAX_REVIVE,
    ITEM_FRESH_WATER,
    ITEM_SODA_POP,
    ITEM_LEMONADE,
    ITEM_MOOMOO_MILK,
    ITEM_ENERGY_POWDER,
    ITEM_ENERGY_ROOT,
    ITEM_HEAL_POWDER,
    ITEM_REVIVAL_HERB,
    ITEM_ETHER,
    ITEM_MAX_ETHER,
    ITEM_ELIXIR,
    ITEM_MAX_ELIXIR,
    ITEM_LAVA_COOKIE,
    ITEM_BLUE_FLUTE,
    ITEM_YELLOW_FLUTE,
    ITEM_RED_FLUTE,
    ITEM_BLACK_FLUTE,
    ITEM_WHITE_FLUTE,
    ITEM_BERRY_JUICE,
    ITEM_SACRED_ASH,
    ITEM_SHOAL_SALT,
    ITEM_SHOAL_SHELL,
    ITEM_RED_SHARD,
    ITEM_BLUE_SHARD,
    ITEM_YELLOW_SHARD,
    ITEM_GREEN_SHARD,
    ITEM_034,
    ITEM_035,
    ITEM_036,
    ITEM_037,
    ITEM_038,
    ITEM_039,
    ITEM_03A,
    ITEM_03B,
    ITEM_03C,
    ITEM_03D,
    ITEM_03E,
    ITEM_HP_UP,
    ITEM_PROTEIN,
    ITEM_IRON,
    ITEM_CARBOS,
    ITEM_CALCIUM,
    ITEM_RARE_CANDY,
    ITEM_PP_UP,
    ITEM_ZINC,
    ITEM_PP_MAX,
    ITEM_048,
    ITEM_GUARD_SPEC,
    ITEM_DIRE_HIT,
    ITEM_X_ATTACK,
    ITEM_X_DEFEND,
    ITEM_X_SPEED,
    ITEM_X_ACCURACY,
    ITEM_X_SPECIAL,
    ITEM_POKE_DOLL,
    ITEM_FLUFFY_TAIL,
    ITEM_052,
    ITEM_SUPER_REPEL,
    ITEM_MAX_REPEL,
    ITEM_ESCAPE_ROPE,
    ITEM_REPEL,
    ITEM_057,
    ITEM_058,
    ITEM_059,
    ITEM_05A,
    ITEM_05B,
    ITEM_05C,
    ITEM_SUN_STONE,
    ITEM_MOON_STONE,
    ITEM_FIRE_STONE,
    ITEM_THUNDER_STONE,
    ITEM_WATER_STONE,
    ITEM_LEAF_STONE,
    ITEM_063,
    ITEM_064,
    ITEM_065,
    ITEM_066,
    ITEM_TINY_MUSHROOM,
    ITEM_BIG_MUSHROOM,
    ITEM_069,
    ITEM_PEARL,
    ITEM_BIG_PEARL,
    ITEM_STARDUST,
    ITEM_STAR_PIECE,
    ITEM_NUGGET,
    ITEM_HEART_SCALE,
    ITEM_070,
    ITEM_071,
    ITEM_072,
    ITEM_073,
    ITEM_074,
    ITEM_075,
    ITEM_076,
    ITEM_077,
    ITEM_078,
    ITEM_ORANGE_MAIL,
    ITEM_HARBOR_MAIL,
    ITEM_GLITTER_MAIL,
    ITEM_MECH_MAIL,
    ITEM_WOOD_MAIL,
    ITEM_WAVE_MAIL,
    ITEM_BEAD_MAIL,
    ITEM_SHADOW_MAIL,
    ITEM_TROPIC_MAIL,
    ITEM_DREAM_MAIL,
    ITEM_FAB_MAIL,
    ITEM_RETRO_MAIL,
    ITEM_CHERI_BERRY,
    ITEM_CHESTO_BERRY,
    ITEM_PECHA_BERRY,
    ITEM_RAWST_BERRY,
    ITEM_ASPEAR_BERRY,
    ITEM_LEPPA_BERRY,
    ITEM_ORAN_BERRY,
    ITEM_PERSIM_BERRY,
    ITEM_LUM_BERRY,
    ITEM_SITRUS_BERRY,
    ITEM_FIGY_BERRY,
    ITEM_WIKI_BERRY,
    ITEM_MAGO_BERRY,
    ITEM_AGUAV_BERRY,
    ITEM_IAPAPA_BERRY,
    ITEM_RAZZ_BERRY,
    ITEM_BLUK_BERRY,
    ITEM_NANAB_BERRY,
    ITEM_WEPEAR_BERRY,
    ITEM_PINAP_BERRY,
    ITEM_POMEG_BERRY,
    ITEM_KELPSY_BERRY,
    ITEM_QUALOT_BERRY,
    ITEM_HONDEW_BERRY,
    ITEM_GREPA_BERRY,
    ITEM_TAMATO_BERRY,
    ITEM_CORNN_BERRY,
    ITEM_MAGOST_BERRY,
    ITEM_RABUTA_BERRY,
    ITEM_NOMEL_BERRY,
    ITEM_SPELON_BERRY,
    ITEM_PAMTRE_BERRY,
    ITEM_WATMEL_BERRY,
    ITEM_DURIN_BERRY,
    ITEM_BELUE_BERRY,
    ITEM_LIECHI_BERRY,
    ITEM_GANLON_BERRY,
    ITEM_SALAC_BERRY,
    ITEM_PETAYA_BERRY,
    ITEM_APICOT_BERRY,
    ITEM_LANSAT_BERRY,
    ITEM_STARF_BERRY,
    ITEM_ENIGMA_BERRY,
    ITEM_0B0,
    ITEM_0B1,
    ITEM_0B2,
    ITEM_BRIGHT_POWDER,
    ITEM_WHITE_HERB,
    ITEM_MACHO_BRACE,
    ITEM_EXP_SHARE,
    ITEM_QUICK_CLAW,
    ITEM_SOOTHE_BELL,
    ITEM_MENTAL_HERB,
    ITEM_CHOICE_BAND,
    ITEM_KINGS_ROCK,
    ITEM_SILVER_POWDER,
    ITEM_AMULET_COIN,
    ITEM_CLEANSE_TAG,
    ITEM_SOUL_DEW,
    ITEM_DEEP_SEA_TOOTH,
    ITEM_DEEP_SEA_SCALE,
    ITEM_SMOKE_BALL,
    ITEM_EVERSTONE,
    ITEM_FOCUS_BAND,
    ITEM_LUCKY_EGG,
    ITEM_SCOPE_LENS,
    ITEM_METAL_COAT,
    ITEM_LEFTOVERS,
    ITEM_DRAGON_SCALE,
    ITEM_LIGHT_BALL,
    ITEM_SOFT_SAND,
    ITEM_HARD_STONE,
    ITEM_MIRACLE_SEED,
    ITEM_BLACK_GLASSES,
    ITEM_BLACK_BELT,
    ITEM_MAGNET,
    ITEM_MYSTIC_WATER,
    ITEM_SHARP_BEAK,
    ITEM_POISON_BARB,
    ITEM_NEVER_MELT_ICE,
    ITEM_SPELL_TAG,
    ITEM_TWISTED_SPOON,
    ITEM_CHARCOAL,
    ITEM_DRAGON_FANG,
    ITEM_SILK_SCARF,
    ITEM_UP_GRADE,
    ITEM_SHELL_BELL,
    ITEM_SEA_INCENSE,
    ITEM_LAX_INCENSE,
    ITEM_LUCKY_PUNCH,
    ITEM_METAL_POWDER,
    ITEM_THICK_CLUB,
    ITEM_STICK,
    ITEM_0E2,
    ITEM_0E3,
    ITEM_0E4,
    ITEM_0E5,
    ITEM_0E6,
    ITEM_0E7,
    ITEM_0E8,
    ITEM_0E9,
    ITEM_0EA,
    ITEM_0EB,
    ITEM_0EC,
    ITEM_0ED,
    ITEM_0EE,
    ITEM_0EF,
    ITEM_0F0,
    ITEM_0F1,
    ITEM_0F2,
    ITEM_0F3,
    ITEM_0F4,
    ITEM_0F5,
    ITEM_0F6,
    ITEM_0F7,
    ITEM_0F8,
    ITEM_0F9,
    ITEM_0FA,
    ITEM_0FB,
    ITEM_0FC,
    ITEM_0FD,
    ITEM_RED_SCARF,
    ITEM_BLUE_SCARF,
    ITEM_PINK_SCARF,
    ITEM_GREEN_SCARF,
    ITEM_YELLOW_SCARF,
    ITEM_MACH_BIKE,
    ITEM_COIN_CASE,
    ITEM_ITEMFINDER,
    ITEM_OLD_ROD,
    ITEM_GOOD_ROD,
    ITEM_SUPER_ROD,
    ITEM_SS_TICKET,
    ITEM_CONTEST_PASS,
    ITEM_10B,
    ITEM_WAILMER_PAIL,
    ITEM_DEVON_GOODS,
    ITEM_SOOT_SACK,
    ITEM_BASEMENT_KEY,
    ITEM_ACRO_BIKE,
    ITEM_POKEBLOCK_CASE,
    ITEM_LETTER,
    ITEM_EON_TICKET,
    ITEM_RED_ORB,
    ITEM_BLUE_ORB,
    ITEM_SCANNER,
    ITEM_GO_GOGGLES,
    ITEM_METEORITE,
    ITEM_ROOM_1_KEY,
    ITEM_ROOM_2_KEY,
    ITEM_ROOM_4_KEY,
    ITEM_ROOM_6_KEY,
    ITEM_STORAGE_KEY,
    ITEM_ROOT_FOSSIL,
    ITEM_CLAW_FOSSIL,
    ITEM_DEVON_SCOPE,
    ITEM_TM01,
    ITEM_TM02,
    ITEM_TM03,
    ITEM_TM04,
    ITEM_TM05,
    ITEM_TM06,
    ITEM_TM07,
    ITEM_TM08,
    ITEM_TM09,
    ITEM_TM10,
    ITEM_TM11,
    ITEM_TM12,
    ITEM_TM13,
    ITEM_TM14,
    ITEM_TM15,
    ITEM_TM16,
    ITEM_TM17,
    ITEM_TM18,
    ITEM_TM19,
    ITEM_TM20,
    ITEM_TM21,
    ITEM_TM22,
    ITEM_TM23,
    ITEM_TM24,
    ITEM_TM25,
    ITEM_TM26,
    ITEM_TM27,
    ITEM_TM28,
    ITEM_TM29,
    ITEM_TM30,
    ITEM_TM31,
    ITEM_TM32,
    ITEM_TM33,
    ITEM_TM34,
    ITEM_TM35,
    ITEM_TM36,
    ITEM_TM37,
    ITEM_TM38,
    ITEM_TM39,
    ITEM_TM40,
    ITEM_TM41,
    ITEM_TM42,
    ITEM_TM43,
    ITEM_TM44,
    ITEM_TM45,
    ITEM_TM46,
    ITEM_TM47,
    ITEM_TM48,
    ITEM_TM49,
    ITEM_TM50,
    ITEM_HM01,
    ITEM_HM02,
    ITEM_HM03,
    ITEM_HM04,
    ITEM_HM05,
    ITEM_HM06,
    ITEM_HM07,
    ITEM_HM08,
    ITEM_15B,
    ITEM_15C,


    ITEM_OAKS_PARCEL,
    ITEM_POKE_FLUTE,
    ITEM_SECRET_KEY,
    ITEM_BIKE_VOUCHER,
    ITEM_GOLD_TEETH,
    ITEM_OLD_AMBER,
    ITEM_CARD_KEY,
    ITEM_LIFT_KEY,
    ITEM_HELIX_FOSSIL,
    ITEM_DOME_FOSSIL,
    ITEM_SILPH_SCOPE,
    ITEM_BICYCLE,
    ITEM_TOWN_MAP,
    ITEM_VS_SEEKER,
    ITEM_FAME_CHECKER,
    ITEM_TM_CASE,
    ITEM_BERRY_POUCH,
    ITEM_TEACHY_TV,
    ITEM_TRI_PASS,
    ITEM_RAINBOW_PASS,
    ITEM_TEA,
    ITEM_MYSTIC_TICKET,
    ITEM_AURORA_TICKET,
    ITEM_POWDER_JAR,
    ITEM_RUBY,
    ITEM_SAPPHIRE,


    ITEM_MAGMA_EMBLEM,
    ITEM_OLD_SEA_MAP,
};
# 8 "src/engine/trade.c" 2
# 1 "include/moves.h" 1



enum
{
            MOVE_NONE,
            MOVE_POUND,
            MOVE_KARATE_CHOP,
            MOVE_DOUBLE_SLAP,
            MOVE_COMET_PUNCH,
            MOVE_MEGA_PUNCH,
            MOVE_PAY_DAY,
            MOVE_FIRE_PUNCH,
            MOVE_ICE_PUNCH,
            MOVE_THUNDER_PUNCH,
            MOVE_SCRATCH,
            MOVE_VICE_GRIP,
            MOVE_GUILLOTINE,
            MOVE_RAZOR_WIND,
            MOVE_SWORDS_DANCE,
            MOVE_CUT,
            MOVE_GUST,
            MOVE_WING_ATTACK,
            MOVE_WHIRLWIND,
            MOVE_FLY,
            MOVE_BIND,
            MOVE_SLAM,
            MOVE_VINE_WHIP,
            MOVE_STOMP,
            MOVE_DOUBLE_KICK,
            MOVE_MEGA_KICK,
            MOVE_JUMP_KICK,
            MOVE_ROLLING_KICK,
            MOVE_SAND_ATTACK,
            MOVE_HEADBUTT,
            MOVE_HORN_ATTACK,
            MOVE_FURY_ATTACK,
            MOVE_HORN_DRILL,
            MOVE_TACKLE,
            MOVE_BODY_SLAM,
            MOVE_WRAP,
            MOVE_TAKE_DOWN,
            MOVE_THRASH,
            MOVE_DOUBLE_EDGE,
            MOVE_TAIL_WHIP,
            MOVE_POISON_STING,
            MOVE_TWINEEDLE,
            MOVE_PIN_MISSILE,
            MOVE_LEER,
            MOVE_BITE,
            MOVE_GROWL,
            MOVE_ROAR,
            MOVE_SING,
            MOVE_SUPERSONIC,
            MOVE_SONIC_BOOM,
            MOVE_DISABLE,
            MOVE_ACID,
            MOVE_EMBER,
            MOVE_FLAMETHROWER,
            MOVE_MIST,
            MOVE_WATER_GUN,
            MOVE_HYDRO_PUMP,
            MOVE_SURF,
            MOVE_ICE_BEAM,
            MOVE_BLIZZARD,
            MOVE_PSYBEAM,
            MOVE_BUBBLE_BEAM,
            MOVE_AURORA_BEAM,
            MOVE_HYPER_BEAM,
            MOVE_PECK,
            MOVE_DRILL_PECK,
            MOVE_SUBMISSION,
            MOVE_LOW_KICK,
            MOVE_COUNTER,
            MOVE_SEISMIC_TOSS,
            MOVE_STRENGTH,
            MOVE_ABSORB,
            MOVE_MEGA_DRAIN,
            MOVE_LEECH_SEED,
            MOVE_GROWTH,
            MOVE_RAZOR_LEAF,
            MOVE_SOLAR_BEAM,
            MOVE_POISON_POWDER,
            MOVE_STUN_SPORE,
            MOVE_SLEEP_POWDER,
            MOVE_PETAL_DANCE,
            MOVE_STRING_SHOT,
            MOVE_DRAGON_RAGE,
            MOVE_FIRE_SPIN,
            MOVE_THUNDER_SHOCK,
            MOVE_THUNDERBOLT,
            MOVE_THUNDER_WAVE,
            MOVE_THUNDER,
            MOVE_ROCK_THROW,
            MOVE_EARTHQUAKE,
            MOVE_FISSURE,
            MOVE_DIG,
            MOVE_TOXIC,
            MOVE_CONFUSION,
            MOVE_PSYCHIC,
            MOVE_HYPNOSIS,
            MOVE_MEDITATE,
            MOVE_AGILITY,
            MOVE_QUICK_ATTACK,
            MOVE_RAGE,
            MOVE_TELEPORT,
            MOVE_NIGHT_SHADE,
            MOVE_MIMIC,
            MOVE_SCREECH,
            MOVE_DOUBLE_TEAM,
            MOVE_RECOVER,
            MOVE_HARDEN,
            MOVE_MINIMIZE,
            MOVE_SMOKESCREEN,
            MOVE_CONFUSE_RAY,
            MOVE_WITHDRAW,
            MOVE_DEFENSE_CURL,
            MOVE_BARRIER,
            MOVE_LIGHT_SCREEN,
            MOVE_HAZE,
            MOVE_REFLECT,
            MOVE_FOCUS_ENERGY,
            MOVE_BIDE,
            MOVE_METRONOME,
            MOVE_MIRROR_MOVE,
            MOVE_SELF_DESTRUCT,
            MOVE_EGG_BOMB,
            MOVE_LICK,
            MOVE_SMOG,
            MOVE_SLUDGE,
            MOVE_BONE_CLUB,
            MOVE_FIRE_BLAST,
            MOVE_WATERFALL,
            MOVE_CLAMP,
            MOVE_SWIFT,
            MOVE_SKULL_BASH,
            MOVE_SPIKE_CANNON,
            MOVE_CONSTRICT,
            MOVE_AMNESIA,
            MOVE_KINESIS,
            MOVE_SOFT_BOILED,
            MOVE_HI_JUMP_KICK,
            MOVE_GLARE,
            MOVE_DREAM_EATER,
            MOVE_POISON_GAS,
            MOVE_BARRAGE,
            MOVE_LEECH_LIFE,
            MOVE_LOVELY_KISS,
            MOVE_SKY_ATTACK,
            MOVE_TRANSFORM,
            MOVE_BUBBLE,
            MOVE_DIZZY_PUNCH,
            MOVE_SPORE,
            MOVE_FLASH,
            MOVE_PSYWAVE,
            MOVE_SPLASH,
            MOVE_ACID_ARMOR,
            MOVE_CRABHAMMER,
            MOVE_EXPLOSION,
            MOVE_FURY_SWIPES,
            MOVE_BONEMERANG,
            MOVE_REST,
            MOVE_ROCK_SLIDE,
            MOVE_HYPER_FANG,
            MOVE_SHARPEN,
            MOVE_CONVERSION,
            MOVE_TRI_ATTACK,
            MOVE_SUPER_FANG,
            MOVE_SLASH,
            MOVE_SUBSTITUTE,
            MOVE_STRUGGLE,
            MOVE_SKETCH,
            MOVE_TRIPLE_KICK,
            MOVE_THIEF,
            MOVE_SPIDER_WEB,
            MOVE_MIND_READER,
            MOVE_NIGHTMARE,
            MOVE_FLAME_WHEEL,
            MOVE_SNORE,
            MOVE_CURSE,
            MOVE_FLAIL,
            MOVE_CONVERSION_2,
            MOVE_AEROBLAST,
            MOVE_COTTON_SPORE,
            MOVE_REVERSAL,
            MOVE_SPITE,
            MOVE_POWDER_SNOW,
            MOVE_PROTECT,
            MOVE_MACH_PUNCH,
            MOVE_SCARY_FACE,
            MOVE_FAINT_ATTACK,
            MOVE_SWEET_KISS,
            MOVE_BELLY_DRUM,
            MOVE_SLUDGE_BOMB,
            MOVE_MUD_SLAP,
            MOVE_OCTAZOOKA,
            MOVE_SPIKES,
            MOVE_ZAP_CANNON,
            MOVE_FORESIGHT,
            MOVE_DESTINY_BOND,
            MOVE_PERISH_SONG,
            MOVE_ICY_WIND,
            MOVE_DETECT,
            MOVE_BONE_RUSH,
            MOVE_LOCK_ON,
            MOVE_OUTRAGE,
            MOVE_SANDSTORM,
            MOVE_GIGA_DRAIN,
            MOVE_ENDURE,
            MOVE_CHARM,
            MOVE_ROLLOUT,
            MOVE_FALSE_SWIPE,
            MOVE_SWAGGER,
            MOVE_MILK_DRINK,
            MOVE_SPARK,
            MOVE_FURY_CUTTER,
            MOVE_STEEL_WING,
            MOVE_MEAN_LOOK,
            MOVE_ATTRACT,
            MOVE_SLEEP_TALK,
            MOVE_HEAL_BELL,
            MOVE_RETURN,
            MOVE_PRESENT,
            MOVE_FRUSTRATION,
            MOVE_SAFEGUARD,
            MOVE_PAIN_SPLIT,
            MOVE_SACRED_FIRE,
            MOVE_MAGNITUDE,
            MOVE_DYNAMIC_PUNCH,
            MOVE_MEGAHORN,
            MOVE_DRAGON_BREATH,
            MOVE_BATON_PASS,
            MOVE_ENCORE,
            MOVE_PURSUIT,
            MOVE_RAPID_SPIN,
            MOVE_SWEET_SCENT,
            MOVE_IRON_TAIL,
            MOVE_METAL_CLAW,
            MOVE_VITAL_THROW,
            MOVE_MORNING_SUN,
            MOVE_SYNTHESIS,
            MOVE_MOONLIGHT,
            MOVE_HIDDEN_POWER,
            MOVE_CROSS_CHOP,
            MOVE_TWISTER,
            MOVE_RAIN_DANCE,
            MOVE_SUNNY_DAY,
            MOVE_CRUNCH,
            MOVE_MIRROR_COAT,
            MOVE_PSYCH_UP,
            MOVE_EXTREME_SPEED,
            MOVE_ANCIENT_POWER,
            MOVE_SHADOW_BALL,
            MOVE_FUTURE_SIGHT,
            MOVE_ROCK_SMASH,
            MOVE_WHIRLPOOL,
            MOVE_BEAT_UP,
            MOVE_FAKE_OUT,
            MOVE_UPROAR,
            MOVE_STOCKPILE,
            MOVE_SPIT_UP,
            MOVE_SWALLOW,
            MOVE_HEAT_WAVE,
            MOVE_HAIL,
            MOVE_TORMENT,
            MOVE_FLATTER,
            MOVE_WILL_O_WISP,
            MOVE_MEMENTO,
            MOVE_FACADE,
            MOVE_FOCUS_PUNCH,
            MOVE_SMELLING_SALT,
            MOVE_FOLLOW_ME,
            MOVE_NATURE_POWER,
            MOVE_CHARGE,
            MOVE_TAUNT,
            MOVE_HELPING_HAND,
            MOVE_TRICK,
            MOVE_ROLE_PLAY,
            MOVE_WISH,
            MOVE_ASSIST,
            MOVE_INGRAIN,
            MOVE_SUPERPOWER,
            MOVE_MAGIC_COAT,
            MOVE_RECYCLE,
            MOVE_REVENGE,
            MOVE_BRICK_BREAK,
            MOVE_YAWN,
            MOVE_KNOCK_OFF,
            MOVE_ENDEAVOR,
            MOVE_ERUPTION,
            MOVE_SKILL_SWAP,
            MOVE_IMPRISON,
            MOVE_REFRESH,
            MOVE_GRUDGE,
            MOVE_SNATCH,
            MOVE_SECRET_POWER,
            MOVE_DIVE,
            MOVE_ARM_THRUST,
            MOVE_CAMOUFLAGE,
            MOVE_TAIL_GLOW,
            MOVE_LUSTER_PURGE,
            MOVE_MIST_BALL,
            MOVE_FEATHER_DANCE,
            MOVE_TEETER_DANCE,
            MOVE_BLAZE_KICK,
            MOVE_MUD_SPORT,
            MOVE_ICE_BALL,
            MOVE_NEEDLE_ARM,
            MOVE_SLACK_OFF,
            MOVE_HYPER_VOICE,
            MOVE_POISON_FANG,
            MOVE_CRUSH_CLAW,
            MOVE_BLAST_BURN,
            MOVE_HYDRO_CANNON,
            MOVE_METEOR_MASH,
            MOVE_ASTONISH,
            MOVE_WEATHER_BALL,
            MOVE_AROMATHERAPY,
            MOVE_FAKE_TEARS,
            MOVE_AIR_CUTTER,
            MOVE_OVERHEAT,
            MOVE_ODOR_SLEUTH,
            MOVE_ROCK_TOMB,
            MOVE_SILVER_WIND,
            MOVE_METAL_SOUND,
            MOVE_GRASS_WHISTLE,
            MOVE_TICKLE,
            MOVE_COSMIC_POWER,
            MOVE_WATER_SPOUT,
            MOVE_SIGNAL_BEAM,
            MOVE_SHADOW_PUNCH,
            MOVE_EXTRASENSORY,
            MOVE_SKY_UPPERCUT,
            MOVE_SAND_TOMB,
            MOVE_SHEER_COLD,
            MOVE_MUDDY_WATER,
            MOVE_BULLET_SEED,
            MOVE_AERIAL_ACE,
            MOVE_ICICLE_SPEAR,
            MOVE_IRON_DEFENSE,
            MOVE_BLOCK,
            MOVE_HOWL,
            MOVE_DRAGON_CLAW,
            MOVE_FRENZY_PLANT,
            MOVE_BULK_UP,
            MOVE_BOUNCE,
            MOVE_MUD_SHOT,
            MOVE_POISON_TAIL,
            MOVE_COVET,
            MOVE_VOLT_TACKLE,
            MOVE_MAGICAL_LEAF,
            MOVE_WATER_SPORT,
            MOVE_CALM_MIND,
            MOVE_LEAF_BLADE,
            MOVE_DRAGON_DANCE,
            MOVE_ROCK_BLAST,
            MOVE_SHOCK_WAVE,
            MOVE_WATER_PULSE,
            MOVE_DOOM_DESIRE,
            MOVE_PSYCHO_BOOST,
};
# 9 "src/engine/trade.c" 2
# 1 "include/easy_chat.h" 1



enum
{
    EC_GROUP_POKEMON,
    EC_GROUP_TRAINER,
    EC_GROUP_STATUS,
    EC_GROUP_BATTLE,
    EC_GROUP_GREETINGS,
    EC_GROUP_PEOPLE,
    EC_GROUP_VOICES,
    EC_GROUP_SPEECH,
    EC_GROUP_ENDINGS,
    EC_GROUP_FEELINGS,
    EC_GROUP_CONDITIONS,
    EC_GROUP_ACTIONS,
    EC_GROUP_LIFESTYLE,
    EC_GROUP_HOBBIES,
    EC_GROUP_TIME,
    EC_GROUP_MISC,
    EC_GROUP_ADJECTIVES,
    EC_GROUP_EVENTS,
    EC_GROUP_MOVE_1,
    EC_GROUP_MOVE_2,
    EC_GROUP_TRENDY_SAYING,
    EC_GROUP_POKEMON_2,
};

enum {
    EC_WORD_I_CHOOSE_YOU = EC_GROUP_TRAINER << 9,
    EC_WORD_GOTCHA,
    EC_WORD_TRADE,
    EC_WORD_SAPPHIRE,
    EC_WORD_EVOLVE,
    EC_WORD_ENCYCLOPEDIA,
    EC_WORD_NATURE,
    EC_WORD_CENTER,
    EC_WORD_EGG,
    EC_WORD_LINK,
    EC_WORD_SP_ABILITY,
    EC_WORD_TRAINER,
    EC_WORD_VERSION,
    EC_WORD_POKENAV,
    EC_WORD_POKEMON,
    EC_WORD_GET,
    EC_WORD_POKEDEX,
    EC_WORD_RUBY,
    EC_WORD_LEVEL
};
enum {
    EC_WORD_DARK = EC_GROUP_STATUS << 9,
    EC_WORD_STENCH,
    EC_WORD_THICK_FAT,
    EC_WORD_RAIN_DISH,
    EC_WORD_DRIZZLE,
    EC_WORD_ARENA_TRAP,
    EC_WORD_INTIMIDATE,
    EC_WORD_ROCK_HEAD,
    EC_WORD_COLOR,
    EC_WORD_ALT_COLOR,
    EC_WORD_ROCK,
    EC_WORD_BEAUTIFUL,
    EC_WORD_BEAUTY,
    EC_WORD_AIR_LOCK,
    EC_WORD_PSYCHIC,
    EC_WORD_HYPER_CUTTER,
    EC_WORD_FIGHTING,
    EC_WORD_SHADOW_TAG,
    EC_WORD_SMART,
    EC_WORD_SMARTNESS,
    EC_WORD_SPEED_BOOST,
    EC_WORD_COOL,
    EC_WORD_COOLNESS,
    EC_WORD_BATTLE_ARMOR,
    EC_WORD_CUTE,
    EC_WORD_CUTENESS,
    EC_WORD_STURDY,
    EC_WORD_SUCTION_CUPS,
    EC_WORD_GRASS,
    EC_WORD_CLEAR_BODY,
    EC_WORD_TORRENT,
    EC_WORD_GHOST,
    EC_WORD_ICE,
    EC_WORD_GUTS,
    EC_WORD_ROUGH_SKIN,
    EC_WORD_SHELL_ARMOR,
    EC_WORD_NATURAL_CURE,
    EC_WORD_DAMP,
    EC_WORD_GROUND,
    EC_WORD_LIMBER,
    EC_WORD_MAGNET_PULL,
    EC_WORD_WHITE_SMOKE,
    EC_WORD_SYNCHRONIZE,
    EC_WORD_OVERGROW,
    EC_WORD_SWIFT_SWIM,
    EC_WORD_SAND_STREAM,
    EC_WORD_SAND_VEIL,
    EC_WORD_KEEN_EYE,
    EC_WORD_INNER_FOCUS,
    EC_WORD_STATIC,
    EC_WORD_TYPE,
    EC_WORD_TOUGH,
    EC_WORD_TOUGHNESS,
    EC_WORD_SHED_SKIN,
    EC_WORD_HUGE_POWER,
    EC_WORD_VOLT_ABSORB,
    EC_WORD_WATER_ABSORB,
    EC_WORD_ELECTRIC,
    EC_WORD_FORECAST,
    EC_WORD_SERENE_GRACE,
    EC_WORD_POISON,
    EC_WORD_POISON_POINT,
    EC_WORD_DRAGON,
    EC_WORD_TRACE,
    EC_WORD_OBLIVIOUS,
    EC_WORD_TRUANT,
    EC_WORD_RUN_AWAY,
    EC_WORD_STICKY_HOLD,
    EC_WORD_CLOUD_NINE,
    EC_WORD_NORMAL,
    EC_WORD_STEEL,
    EC_WORD_ILLUMINATE,
    EC_WORD_EARLY_BIRD,
    EC_WORD_HUSTLE,
    EC_WORD_SHINE,
    EC_WORD_FLYING,
    EC_WORD_DROUGHT,
    EC_WORD_LIGHTNINGROD,
    EC_WORD_COMPOUNDEYES,
    EC_WORD_MARVEL_SCALE,
    EC_WORD_WONDER_GUARD,
    EC_WORD_INSOMNIA,
    EC_WORD_LEVITATE,
    EC_WORD_PLUS,
    EC_WORD_PRESSURE,
    EC_WORD_LIQUID_OOZE,
    EC_WORD_COLOR_CHANGE,
    EC_WORD_SOUNDPROOF,
    EC_WORD_EFFECT_SPORE,
    EC_WORD_PKRS,
    EC_WORD_FIRE,
    EC_WORD_FLAME_BODY,
    EC_WORD_MINUS,
    EC_WORD_OWN_TEMPO,
    EC_WORD_MAGMA_ARMOR,
    EC_WORD_WATER,
    EC_WORD_WATER_VEIL,
    EC_WORD_BUG,
    EC_WORD_SWARM,
    EC_WORD_CUTE_CHARM,
    EC_WORD_IMMUNITY,
    EC_WORD_BLAZE,
    EC_WORD_PICKUP,
    EC_WORD_PATTERN,
    EC_WORD_FLASH_FIRE,
    EC_WORD_VITAL_SPIRIT,
    EC_WORD_CHLOROPHYLL,
    EC_WORD_PURE_POWER,
    EC_WORD_SHIELD_DUST,
};
enum {
    EC_WORD_MATCH_UP = EC_GROUP_BATTLE << 9,
    EC_WORD_GO,
    EC_WORD_NO_1,
    EC_WORD_DECIDE,
    EC_WORD_LET_ME_WIN,
    EC_WORD_WINS,
    EC_WORD_WIN,
    EC_WORD_WON,
    EC_WORD_IF_I_WIN,
    EC_WORD_WHEN_I_WIN,
    EC_WORD_CAN_T_WIN,
    EC_WORD_CAN_WIN,
    EC_WORD_NO_MATCH,
    EC_WORD_SPIRIT,
    EC_WORD_DECIDED,
    EC_WORD_TRUMP_CARD,
    EC_WORD_TAKE_THAT,
    EC_WORD_COME_ON,
    EC_WORD_ATTACK,
    EC_WORD_SURRENDER,
    EC_WORD_GUTSY,
    EC_WORD_TALENT,
    EC_WORD_STRATEGY,
    EC_WORD_SMITE,
    EC_WORD_MATCH,
    EC_WORD_VICTORY,
    EC_WORD_OFFENSIVE,
    EC_WORD_SENSE,
    EC_WORD_VERSUS,
    EC_WORD_FIGHTS,
    EC_WORD_POWER,
    EC_WORD_CHALLENGE,
    EC_WORD_STRONG,
    EC_WORD_TOO_STRONG,
    EC_WORD_GO_EASY,
    EC_WORD_FOE,
    EC_WORD_GENIUS,
    EC_WORD_LEGEND,
    EC_WORD_ESCAPE,
    EC_WORD_AIM,
    EC_WORD_BATTLE,
    EC_WORD_FIGHT,
    EC_WORD_RESUSCITATE,
    EC_WORD_POINTS,
    EC_WORD_SERIOUS,
    EC_WORD_GIVE_UP,
    EC_WORD_LOSS,
    EC_WORD_IF_I_LOSE,
    EC_WORD_LOST,
    EC_WORD_LOSE,
    EC_WORD_GUARD,
    EC_WORD_PARTNER,
    EC_WORD_REJECT,
    EC_WORD_ACCEPT,
    EC_WORD_INVINCIBLE,
    EC_WORD_RECEIVED,
    EC_WORD_EASY,
    EC_WORD_WEAK,
    EC_WORD_TOO_WEAK,
    EC_WORD_PUSHOVER,
    EC_WORD_LEADER,
    EC_WORD_RULE,
    EC_WORD_MOVE
};
enum {
    EC_WORD_THANKS = EC_GROUP_GREETINGS << 9,
    EC_WORD_YES,
    EC_WORD_HERE_GOES,
    EC_WORD_HERE_I_COME,
    EC_WORD_HERE_IT_IS,
    EC_WORD_YEAH,
    EC_WORD_WELCOME,
    EC_WORD_OI,
    EC_WORD_HOW_DO,
    EC_WORD_CONGRATS,
    EC_WORD_GIVE_ME,
    EC_WORD_SORRY,
    EC_WORD_APOLOGIZE,
    EC_WORD_FORGIVE,
    EC_WORD_HEY_THERE,
    EC_WORD_HELLO,
    EC_WORD_GOOD_BYE,
    EC_WORD_THANK_YOU,
    EC_WORD_I_VE_ARRIVED,
    EC_WORD_PARDON,
    EC_WORD_EXCUSE,
    EC_WORD_SEE_YA,
    EC_WORD_EXCUSE_ME,
    EC_WORD_WELL_THEN,
    EC_WORD_GO_AHEAD,
    EC_WORD_APPRECIATE,
    EC_WORD_HEY_QUES,
    EC_WORD_WHAT_S_UP_QUES,
    EC_WORD_HUH_QUES,
    EC_WORD_NO,
    EC_WORD_HI,
    EC_WORD_YEAH_YEAH,
    EC_WORD_BYE_BYE,
    EC_WORD_MEET_YOU,
    EC_WORD_HEY,
    EC_WORD_SMELL,
    EC_WORD_LISTENING,
    EC_WORD_HOO_HAH,
    EC_WORD_YAHOO,
    EC_WORD_YO,
    EC_WORD_COME_OVER,
    EC_WORD_COUNT_ON
};
enum {
    EC_WORD_OPPONENT = EC_GROUP_PEOPLE << 9,
    EC_WORD_I,
    EC_WORD_YOU,
    EC_WORD_YOURS,
    EC_WORD_SON,
    EC_WORD_YOUR,
    EC_WORD_YOU_RE,
    EC_WORD_YOU_VE,
    EC_WORD_MOTHER,
    EC_WORD_GRANDFATHER,
    EC_WORD_UNCLE,
    EC_WORD_FATHER,
    EC_WORD_BOY,
    EC_WORD_ADULT,
    EC_WORD_BROTHER,
    EC_WORD_SISTER,
    EC_WORD_GRANDMOTHER,
    EC_WORD_AUNT,
    EC_WORD_PARENT,
    EC_WORD_MAN,
    EC_WORD_ME,
    EC_WORD_GIRL,
    EC_WORD_BABE,
    EC_WORD_FAMILY,
    EC_WORD_HER,
    EC_WORD_HIM,
    EC_WORD_HE,
    EC_WORD_PLACE,
    EC_WORD_DAUGHTER,
    EC_WORD_HIS,
    EC_WORD_HE_S,
    EC_WORD_AREN_T,
    EC_WORD_SIBLINGS,
    EC_WORD_KID,
    EC_WORD_CHILDREN,
    EC_WORD_MR,
    EC_WORD_MRS,
    EC_WORD_MYSELF,
    EC_WORD_I_WAS,
    EC_WORD_TO_ME,
    EC_WORD_MY,
    EC_WORD_I_AM,
    EC_WORD_I_VE,
    EC_WORD_WHO,
    EC_WORD_SOMEONE,
    EC_WORD_WHO_WAS,
    EC_WORD_TO_WHOM,
    EC_WORD_WHOSE,
    EC_WORD_WHO_IS,
    EC_WORD_IT_S,
    EC_WORD_LADY,
    EC_WORD_FRIEND,
    EC_WORD_ALLY,
    EC_WORD_PERSON,
    EC_WORD_DUDE,
    EC_WORD_THEY,
    EC_WORD_THEY_WERE,
    EC_WORD_TO_THEM,
    EC_WORD_THEIR,
    EC_WORD_THEY_RE,
    EC_WORD_THEY_VE,
    EC_WORD_WE,
    EC_WORD_BEEN,
    EC_WORD_TO_US,
    EC_WORD_OUR,
    EC_WORD_WE_RE,
    EC_WORD_RIVAL,
    EC_WORD_WE_VE,
    EC_WORD_WOMAN,
    EC_WORD_SHE,
    EC_WORD_SHE_WAS,
    EC_WORD_TO_HER,
    EC_WORD_HERS,
    EC_WORD_SHE_IS,
    EC_WORD_SOME
};
enum {
    EC_WORD_EXCL = EC_GROUP_VOICES << 9,
    EC_WORD_EXCL_EXCL,
    EC_WORD_QUES_EXCL,
    EC_WORD_QUES,
    EC_WORD_ELLIPSIS,
    EC_WORD_ELLIPSIS_EXCL,
    EC_WORD_ELLIPSIS_ELLIPSIS_ELLIPSIS,
    EC_WORD_DASH,
    EC_WORD_DASH_DASH_DASH,
    EC_WORD_UH_OH,
    EC_WORD_WAAAH,
    EC_WORD_AHAHA,
    EC_WORD_OH_QUES,
    EC_WORD_NOPE,
    EC_WORD_URGH,
    EC_WORD_HMM,
    EC_WORD_WHOAH,
    EC_WORD_WROOOAAR_EXCL,
    EC_WORD_WOW,
    EC_WORD_GIGGLE,
    EC_WORD_SIGH,
    EC_WORD_UNBELIEVABLE,
    EC_WORD_CRIES,
    EC_WORD_AGREE,
    EC_WORD_EH_QUES,
    EC_WORD_CRY,
    EC_WORD_EHEHE,
    EC_WORD_OI_OI_OI,
    EC_WORD_OH_YEAH,
    EC_WORD_OH,
    EC_WORD_OOPS,
    EC_WORD_SHOCKED,
    EC_WORD_EEK,
    EC_WORD_GRAAAH,
    EC_WORD_GWAHAHAHA,
    EC_WORD_WAY,
    EC_WORD_TCH,
    EC_WORD_HEHE,
    EC_WORD_HAH,
    EC_WORD_YUP,
    EC_WORD_HAHAHA,
    EC_WORD_AIYEEH,
    EC_WORD_HIYAH,
    EC_WORD_FUFUFU,
    EC_WORD_LOL,
    EC_WORD_SNORT,
    EC_WORD_HUMPH,
    EC_WORD_HEHEHE,
    EC_WORD_HEH,
    EC_WORD_HOHOHO,
    EC_WORD_UH_HUH,
    EC_WORD_OH_DEAR,
    EC_WORD_ARRGH,
    EC_WORD_MUFUFU,
    EC_WORD_MMM,
    EC_WORD_OH_KAY,
    EC_WORD_OKAY,
    EC_WORD_LALALA,
    EC_WORD_YAY,
    EC_WORD_AWW,
    EC_WORD_WOWEE,
    EC_WORD_GWAH,
    EC_WORD_WAHAHAHA
};
enum {
    EC_WORD_LISTEN = EC_GROUP_SPEECH << 9,
    EC_WORD_NOT_VERY,
    EC_WORD_MEAN,
    EC_WORD_LIE,
    EC_WORD_LAY,
    EC_WORD_RECOMMEND,
    EC_WORD_NITWIT,
    EC_WORD_QUITE,
    EC_WORD_FROM,
    EC_WORD_FEELING,
    EC_WORD_BUT,
    EC_WORD_HOWEVER,
    EC_WORD_CASE,
    EC_WORD_THE,
    EC_WORD_MISS,
    EC_WORD_HOW,
    EC_WORD_HIT,
    EC_WORD_ENOUGH,
    EC_WORD_A_LOT,
    EC_WORD_A_LITTLE,
    EC_WORD_ABSOLUTELY,
    EC_WORD_AND,
    EC_WORD_ONLY,
    EC_WORD_AROUND,
    EC_WORD_PROBABLY,
    EC_WORD_IF,
    EC_WORD_VERY,
    EC_WORD_A_TINY_BIT,
    EC_WORD_WILD,
    EC_WORD_THAT_S,
    EC_WORD_JUST,
    EC_WORD_EVEN_SO,
    EC_WORD_MUST_BE,
    EC_WORD_NATURALLY,
    EC_WORD_FOR_NOW,
    EC_WORD_UNDERSTOOD,
    EC_WORD_JOKING,
    EC_WORD_READY,
    EC_WORD_SOMETHING,
    EC_WORD_SOMEHOW,
    EC_WORD_ALTHOUGH,
    EC_WORD_ALSO,
    EC_WORD_PERFECT,
    EC_WORD_AS_MUCH_AS,
    EC_WORD_REALLY,
    EC_WORD_TRULY,
    EC_WORD_SERIOUSLY,
    EC_WORD_TOTALLY,
    EC_WORD_UNTIL,
    EC_WORD_AS_IF,
    EC_WORD_MOOD,
    EC_WORD_RATHER,
    EC_WORD_AWFULLY,
    EC_WORD_MODE,
    EC_WORD_MORE,
    EC_WORD_TOO_LATE,
    EC_WORD_FINALLY,
    EC_WORD_ANY,
    EC_WORD_INSTEAD,
    EC_WORD_FANTASTIC
};
enum {
    EC_WORD_WILL = EC_GROUP_ENDINGS << 9,
    EC_WORD_WILL_BE_HERE,
    EC_WORD_OR,
    EC_WORD_TIMES,
    EC_WORD_WONDER,
    EC_WORD_IS_IT_QUES,
    EC_WORD_BE,
    EC_WORD_GIMME,
    EC_WORD_COULD,
    EC_WORD_LIKELY_TO,
    EC_WORD_WOULD,
    EC_WORD_IS,
    EC_WORD_ISN_T_IT_QUES,
    EC_WORD_LET_S,
    EC_WORD_OTHER,
    EC_WORD_ARE,
    EC_WORD_WAS,
    EC_WORD_WERE,
    EC_WORD_THOSE,
    EC_WORD_ISN_T,
    EC_WORD_WON_T,
    EC_WORD_CAN_T,
    EC_WORD_CAN,
    EC_WORD_DON_T,
    EC_WORD_DO,
    EC_WORD_DOES,
    EC_WORD_WHOM,
    EC_WORD_WHICH,
    EC_WORD_WASN_T,
    EC_WORD_WEREN_T,
    EC_WORD_HAVE,
    EC_WORD_HAVEN_T,
    EC_WORD_A,
    EC_WORD_AN,
    EC_WORD_NOT,
    EC_WORD_THERE,
    EC_WORD_OK_QUES,
    EC_WORD_SO,
    EC_WORD_MAYBE,
    EC_WORD_ABOUT,
    EC_WORD_OVER,
    EC_WORD_IT,
    EC_WORD_ALL,
    EC_WORD_FOR,
    EC_WORD_ON,
    EC_WORD_OFF,
    EC_WORD_AS,
    EC_WORD_TO,
    EC_WORD_WITH,
    EC_WORD_BETTER,
    EC_WORD_EVER,
    EC_WORD_SINCE,
    EC_WORD_OF,
    EC_WORD_BELONGS_TO,
    EC_WORD_AT,
    EC_WORD_IN,
    EC_WORD_OUT,
    EC_WORD_TOO,
    EC_WORD_LIKE,
    EC_WORD_DID,
    EC_WORD_DIDN_T,
    EC_WORD_DOESN_T,
    EC_WORD_WITHOUT,
    EC_WORD_AFTER,
    EC_WORD_BEFORE,
    EC_WORD_WHILE,
    EC_WORD_THAN,
    EC_WORD_ONCE,
    EC_WORD_ANYWHERE
};
enum {
    EC_WORD_MEET = EC_GROUP_FEELINGS << 9,
    EC_WORD_PLAY,
    EC_WORD_HURRIED,
    EC_WORD_GOES,
    EC_WORD_GIDDY,
    EC_WORD_HAPPY,
    EC_WORD_HAPPINESS,
    EC_WORD_EXCITE,
    EC_WORD_IMPORTANT,
    EC_WORD_FUNNY,
    EC_WORD_GOT,
    EC_WORD_GO_HOME,
    EC_WORD_DISAPPOINTED,
    EC_WORD_DISAPPOINTS,
    EC_WORD_SAD,
    EC_WORD_TRY,
    EC_WORD_TRIES,
    EC_WORD_HEARS,
    EC_WORD_THINK,
    EC_WORD_HEAR,
    EC_WORD_WANTS,
    EC_WORD_MISHEARD,
    EC_WORD_DISLIKE,
    EC_WORD_ANGRY,
    EC_WORD_ANGER,
    EC_WORD_SCARY,
    EC_WORD_LONESOME,
    EC_WORD_DISAPPOINT,
    EC_WORD_JOY,
    EC_WORD_GETS,
    EC_WORD_NEVER,
    EC_WORD_DARN,
    EC_WORD_DOWNCAST,
    EC_WORD_INCREDIBLE,
    EC_WORD_LIKES,
    EC_WORD_DISLIKES,
    EC_WORD_BORING,
    EC_WORD_CARE,
    EC_WORD_CARES,
    EC_WORD_ALL_RIGHT,
    EC_WORD_ADORE,
    EC_WORD_DISASTER,
    EC_WORD_ENJOY,
    EC_WORD_ENJOYS,
    EC_WORD_EAT,
    EC_WORD_LACKING,
    EC_WORD_BAD,
    EC_WORD_HARD,
    EC_WORD_TERRIBLE,
    EC_WORD_SHOULD,
    EC_WORD_NICE,
    EC_WORD_DRINK,
    EC_WORD_SURPRISE,
    EC_WORD_FEAR,
    EC_WORD_WANT,
    EC_WORD_WAIT,
    EC_WORD_SATISFIED,
    EC_WORD_SEE,
    EC_WORD_RARE,
    EC_WORD_NEGATIVE,
    EC_WORD_DONE,
    EC_WORD_DANGER,
    EC_WORD_DEFEATED,
    EC_WORD_BEAT,
    EC_WORD_GREAT,
    EC_WORD_ROMANTIC,
    EC_WORD_QUESTION,
    EC_WORD_UNDERSTAND,
    EC_WORD_UNDERSTANDS
};
enum {
    EC_WORD_HOT = EC_GROUP_CONDITIONS << 9,
    EC_WORD_EXISTS,
    EC_WORD_EXCESS,
    EC_WORD_APPROVED,
    EC_WORD_HAS,
    EC_WORD_GOOD,
    EC_WORD_LESS,
    EC_WORD_MOMENTUM,
    EC_WORD_GOING,
    EC_WORD_WEIRD,
    EC_WORD_BUSY,
    EC_WORD_TOGETHER,
    EC_WORD_FULL,
    EC_WORD_ABSENT,
    EC_WORD_BEING,
    EC_WORD_NEED,
    EC_WORD_TASTY,
    EC_WORD_SKILLED,
    EC_WORD_NOISY,
    EC_WORD_BIG,
    EC_WORD_LATE,
    EC_WORD_CLOSE,
    EC_WORD_DOCILE,
    EC_WORD_AMUSING,
    EC_WORD_ENTERTAINING,
    EC_WORD_PERFECTION,
    EC_WORD_PRETTY,
    EC_WORD_HEALTHY,
    EC_WORD_EXCELLENT,
    EC_WORD_UPSIDE_DOWN,
    EC_WORD_COLD,
    EC_WORD_REFRESHING,
    EC_WORD_UNAVOIDABLE,
    EC_WORD_MUCH,
    EC_WORD_OVERWHELMING,
    EC_WORD_FABULOUS,
    EC_WORD_ELSE,
    EC_WORD_EXPENSIVE,
    EC_WORD_CORRECT,
    EC_WORD_IMPOSSIBLE,
    EC_WORD_SMALL,
    EC_WORD_DIFFERENT,
    EC_WORD_TIRED,
    EC_WORD_SKILL,
    EC_WORD_TOP,
    EC_WORD_NON_STOP,
    EC_WORD_PREPOSTEROUS,
    EC_WORD_NONE,
    EC_WORD_NOTHING,
    EC_WORD_NATURAL,
    EC_WORD_BECOMES,
    EC_WORD_LUKEWARM,
    EC_WORD_FAST,
    EC_WORD_LOW,
    EC_WORD_AWFUL,
    EC_WORD_ALONE,
    EC_WORD_BORED,
    EC_WORD_SECRET,
    EC_WORD_MYSTERY,
    EC_WORD_LACKS,
    EC_WORD_BEST,
    EC_WORD_LOUSY,
    EC_WORD_MISTAKE,
    EC_WORD_KIND,
    EC_WORD_WELL,
    EC_WORD_WEAKENED,
    EC_WORD_SIMPLE,
    EC_WORD_SEEMS,
    EC_WORD_BADLY
};
enum {
    EC_WORD_MEETS = EC_GROUP_ACTIONS << 9,
    EC_WORD_CONCEDE,
    EC_WORD_GIVE,
    EC_WORD_GIVES,
    EC_WORD_PLAYED,
    EC_WORD_PLAYS,
    EC_WORD_COLLECT,
    EC_WORD_WALKING,
    EC_WORD_WALKS,
    EC_WORD_SAYS,
    EC_WORD_WENT,
    EC_WORD_SAID,
    EC_WORD_WAKE_UP,
    EC_WORD_WAKES_UP,
    EC_WORD_ANGERS,
    EC_WORD_TEACH,
    EC_WORD_TEACHES,
    EC_WORD_PLEASE,
    EC_WORD_LEARN,
    EC_WORD_CHANGE,
    EC_WORD_STORY,
    EC_WORD_TRUST,
    EC_WORD_LAVISH,
    EC_WORD_LISTENS,
    EC_WORD_HEARING,
    EC_WORD_TRAINS,
    EC_WORD_CHOOSE,
    EC_WORD_COME,
    EC_WORD_CAME,
    EC_WORD_SEARCH,
    EC_WORD_MAKE,
    EC_WORD_CAUSE,
    EC_WORD_KNOW,
    EC_WORD_KNOWS,
    EC_WORD_REFUSE,
    EC_WORD_STORES,
    EC_WORD_BRAG,
    EC_WORD_IGNORANT,
    EC_WORD_THINKS,
    EC_WORD_BELIEVE,
    EC_WORD_SLIDE,
    EC_WORD_EATS,
    EC_WORD_USE,
    EC_WORD_USES,
    EC_WORD_USING,
    EC_WORD_COULDN_T,
    EC_WORD_CAPABLE,
    EC_WORD_DISAPPEAR,
    EC_WORD_APPEAR,
    EC_WORD_THROW,
    EC_WORD_WORRY,
    EC_WORD_SLEPT,
    EC_WORD_SLEEP,
    EC_WORD_RELEASE,
    EC_WORD_DRINKS,
    EC_WORD_RUNS,
    EC_WORD_RUN,
    EC_WORD_WORKS,
    EC_WORD_WORKING,
    EC_WORD_TALKING,
    EC_WORD_TALK,
    EC_WORD_SINK,
    EC_WORD_SMACK,
    EC_WORD_PRETEND,
    EC_WORD_PRAISE,
    EC_WORD_OVERDO,
    EC_WORD_SHOW,
    EC_WORD_LOOKS,
    EC_WORD_SEES,
    EC_WORD_SEEK,
    EC_WORD_OWN,
    EC_WORD_TAKE,
    EC_WORD_ALLOW,
    EC_WORD_FORGET,
    EC_WORD_FORGETS,
    EC_WORD_APPEARS,
    EC_WORD_FAINT,
    EC_WORD_FAINTED
};
enum {
    EC_WORD_CHORES = EC_GROUP_LIFESTYLE << 9,
    EC_WORD_HOME,
    EC_WORD_MONEY,
    EC_WORD_ALLOWANCE,
    EC_WORD_BATH,
    EC_WORD_CONVERSATION,
    EC_WORD_SCHOOL,
    EC_WORD_COMMEMORATE,
    EC_WORD_HABIT,
    EC_WORD_GROUP,
    EC_WORD_WORD,
    EC_WORD_STORE,
    EC_WORD_SERVICE,
    EC_WORD_WORK,
    EC_WORD_SYSTEM,
    EC_WORD_TRAIN,
    EC_WORD_CLASS,
    EC_WORD_LESSONS,
    EC_WORD_INFORMATION,
    EC_WORD_LIVING,
    EC_WORD_TEACHER,
    EC_WORD_TOURNAMENT,
    EC_WORD_LETTER,
    EC_WORD_EVENT,
    EC_WORD_DIGITAL,
    EC_WORD_TEST,
    EC_WORD_DEPT_STORE,
    EC_WORD_TELEVISION,
    EC_WORD_PHONE,
    EC_WORD_ITEM,
    EC_WORD_NAME,
    EC_WORD_NEWS,
    EC_WORD_POPULAR,
    EC_WORD_PARTY,
    EC_WORD_STUDY,
    EC_WORD_MACHINE,
    EC_WORD_MAIL,
    EC_WORD_MESSAGE,
    EC_WORD_PROMISE,
    EC_WORD_DREAM,
    EC_WORD_KINDERGARTEN,
    EC_WORD_LIFE,
    EC_WORD_RADIO,
    EC_WORD_RENTAL,
    EC_WORD_WORLD
};
enum {
    EC_WORD_IDOL = EC_GROUP_HOBBIES << 9,
    EC_WORD_ANIME,
    EC_WORD_SONG,
    EC_WORD_MOVIE,
    EC_WORD_SWEETS,
    EC_WORD_CHAT,
    EC_WORD_CHILD_S_PLAY,
    EC_WORD_TOYS,
    EC_WORD_MUSIC,
    EC_WORD_CARDS,
    EC_WORD_SHOPPING,
    EC_WORD_CAMERA,
    EC_WORD_VIEWING,
    EC_WORD_SPECTATOR,
    EC_WORD_GOURMET,
    EC_WORD_GAME,
    EC_WORD_RPG,
    EC_WORD_COLLECTION,
    EC_WORD_COMPLETE,
    EC_WORD_MAGAZINE,
    EC_WORD_WALK,
    EC_WORD_BIKE,
    EC_WORD_HOBBY,
    EC_WORD_SPORTS,
    EC_WORD_SOFTWARE,
    EC_WORD_SONGS,
    EC_WORD_DIET,
    EC_WORD_TREASURE,
    EC_WORD_TRAVEL,
    EC_WORD_DANCE,
    EC_WORD_CHANNEL,
    EC_WORD_MAKING,
    EC_WORD_FISHING,
    EC_WORD_DATE,
    EC_WORD_DESIGN,
    EC_WORD_LOCOMOTIVE,
    EC_WORD_PLUSH_DOLL,
    EC_WORD_PC,
    EC_WORD_FLOWERS,
    EC_WORD_HERO,
    EC_WORD_NAP,
    EC_WORD_HEROINE,
    EC_WORD_FASHION,
    EC_WORD_ADVENTURE,
    EC_WORD_BOARD,
    EC_WORD_BALL,
    EC_WORD_BOOK,
    EC_WORD_FESTIVAL,
    EC_WORD_COMICS,
    EC_WORD_HOLIDAY,
    EC_WORD_PLANS,
    EC_WORD_TRENDY,
    EC_WORD_VACATION,
    EC_WORD_LOOK
};
enum {
    EC_WORD_FALL = EC_GROUP_TIME << 9,
    EC_WORD_MORNING,
    EC_WORD_TOMORROW,
    EC_WORD_LAST,
    EC_WORD_DAY,
    EC_WORD_SOMETIME,
    EC_WORD_ALWAYS,
    EC_WORD_CURRENT,
    EC_WORD_FOREVER,
    EC_WORD_DAYS,
    EC_WORD_END,
    EC_WORD_TUESDAY,
    EC_WORD_YESTERDAY,
    EC_WORD_TODAY,
    EC_WORD_FRIDAY,
    EC_WORD_MONDAY,
    EC_WORD_LATER,
    EC_WORD_EARLIER,
    EC_WORD_ANOTHER,
    EC_WORD_TIME,
    EC_WORD_FINISH,
    EC_WORD_WEDNESDAY,
    EC_WORD_SOON,
    EC_WORD_START,
    EC_WORD_MONTH,
    EC_WORD_STOP,
    EC_WORD_NOW,
    EC_WORD_FINAL,
    EC_WORD_NEXT,
    EC_WORD_AGE,
    EC_WORD_SATURDAY,
    EC_WORD_SUMMER,
    EC_WORD_SUNDAY,
    EC_WORD_BEGINNING,
    EC_WORD_SPRING,
    EC_WORD_DAYTIME,
    EC_WORD_WINTER,
    EC_WORD_DAILY,
    EC_WORD_OLDEN,
    EC_WORD_ALMOST,
    EC_WORD_NEARLY,
    EC_WORD_THURSDAY,
    EC_WORD_NIGHTTIME,
    EC_WORD_NIGHT,
    EC_WORD_WEEK
};
enum {
    EC_WORD_HIGHS = EC_GROUP_MISC << 9,
    EC_WORD_LOWS,
    EC_WORD_UM,
    EC_WORD_REAR,
    EC_WORD_THINGS,
    EC_WORD_THING,
    EC_WORD_BELOW,
    EC_WORD_ABOVE,
    EC_WORD_BACK,
    EC_WORD_HIGH,
    EC_WORD_HERE,
    EC_WORD_INSIDE,
    EC_WORD_OUTSIDE,
    EC_WORD_BESIDE,
    EC_WORD_THIS_IS_IT_EXCL,
    EC_WORD_THIS,
    EC_WORD_EVERY,
    EC_WORD_THESE,
    EC_WORD_THESE_WERE,
    EC_WORD_DOWN,
    EC_WORD_THAT,
    EC_WORD_THOSE_ARE,
    EC_WORD_THOSE_WERE,
    EC_WORD_THAT_S_IT_EXCL,
    EC_WORD_AM,
    EC_WORD_THAT_WAS,
    EC_WORD_FRONT,
    EC_WORD_UP,
    EC_WORD_CHOICE,
    EC_WORD_FAR,
    EC_WORD_AWAY,
    EC_WORD_NEAR,
    EC_WORD_WHERE,
    EC_WORD_WHEN,
    EC_WORD_WHAT,
    EC_WORD_DEEP,
    EC_WORD_SHALLOW,
    EC_WORD_WHY,
    EC_WORD_CONFUSED,
    EC_WORD_OPPOSITE,
    EC_WORD_LEFT,
    EC_WORD_RIGHT
};
enum {
    EC_WORD_WANDERING = EC_GROUP_ADJECTIVES << 9,
    EC_WORD_RICKETY,
    EC_WORD_ROCK_SOLID,
    EC_WORD_HUNGRY,
    EC_WORD_TIGHT,
    EC_WORD_TICKLISH,
    EC_WORD_TWIRLING,
    EC_WORD_SPIRALING,
    EC_WORD_THIRSTY,
    EC_WORD_LOLLING,
    EC_WORD_SILKY,
    EC_WORD_SADLY,
    EC_WORD_HOPELESS,
    EC_WORD_USELESS,
    EC_WORD_DROOLING,
    EC_WORD_EXCITING,
    EC_WORD_THICK,
    EC_WORD_SMOOTH,
    EC_WORD_SLIMY,
    EC_WORD_THIN,
    EC_WORD_BREAK,
    EC_WORD_VORACIOUS,
    EC_WORD_SCATTER,
    EC_WORD_AWESOME,
    EC_WORD_WIMPY,
    EC_WORD_WOBBLY,
    EC_WORD_SHAKY,
    EC_WORD_RIPPED,
    EC_WORD_SHREDDED,
    EC_WORD_INCREASING,
    EC_WORD_YET,
    EC_WORD_DESTROYED,
    EC_WORD_FIERY,
    EC_WORD_LOVEY_DOVEY,
    EC_WORD_HAPPILY,
    EC_WORD_ANTICIPATION
};
enum {
    EC_WORD_APPEAL = EC_GROUP_EVENTS << 9,
    EC_WORD_EVENTS,
    EC_WORD_STAY_AT_HOME,
    EC_WORD_BERRY,
    EC_WORD_CONTEST,
    EC_WORD_MC,
    EC_WORD_JUDGE,
    EC_WORD_SUPER,
    EC_WORD_STAGE,
    EC_WORD_HALL_OF_FAME,
    EC_WORD_EVOLUTION,
    EC_WORD_HYPER,
    EC_WORD_BATTLE_TOWER,
    EC_WORD_LEADERS,
    EC_WORD_BATTLE_ROOM,
    EC_WORD_HIDDEN,
    EC_WORD_SECRET_BASE,
    EC_WORD_BLEND,
    EC_WORD_POKEBLOCK,
    EC_WORD_MASTER,
    EC_WORD_RANK,
    EC_WORD_RIBBON
};
enum {
    EC_WORD_KTHX_BYE = EC_GROUP_TRENDY_SAYING << 9,
    EC_WORD_YES_SIR_EXCL,
    EC_WORD_AVANT_GARDE,
    EC_WORD_COUPLE,
    EC_WORD_MUCH_OBLIGED,
    EC_WORD_YEEHAW_EXCL,
    EC_WORD_MEGA,
    EC_WORD_1_HIT_KO_EXCL,
    EC_WORD_DESTINY,
    EC_WORD_CANCEL,
    EC_WORD_NEW,
    EC_WORD_FLATTEN,
    EC_WORD_KIDDING,
    EC_WORD_LOSER,
    EC_WORD_LOSING,
    EC_WORD_HAPPENING,
    EC_WORD_HIP_AND,
    EC_WORD_SHAKE,
    EC_WORD_SHADY,
    EC_WORD_UPBEAT,
    EC_WORD_MODERN,
    EC_WORD_SMELL_YA,
    EC_WORD_BANG,
    EC_WORD_KNOCKOUT,
    EC_WORD_HASSLE,
    EC_WORD_WINNER,
    EC_WORD_FEVER,
    EC_WORD_WANNABE,
    EC_WORD_BABY,
    EC_WORD_HEART,
    EC_WORD_OLD,
    EC_WORD_YOUNG,
    EC_WORD_UGLY
};
# 1068 "include/easy_chat.h"
extern u8 gUnknown_020388AC;

u16 sub_80EB72C(u16 group);
void sub_80EB6FC(u16 *, u16);
void InitEasyChatPhrases(void);
u8 sub_80EAD7C(u8 group);
u16 sub_80EAE88(u8);
u8 sub_80EB37C(u16);
u8* EasyChat_GetWordText(u8 *, u16);
u8 *ConvertEasyChatWordsToString(u8 *dst, u16 *words, u16, u16);
u16 sub_80EB784(u16 group);
u8 sub_80EB868(u8);
void sub_80EB890(u8);
u8 sub_80EB8C0(void);
u16 sub_80EB8EC(void);
u8 *sub_80EB544(u8 *dst, u16 *words, u16 arg2, u16 arg3);
# 10 "src/engine/trade.c" 2
# 1 "include/link.h" 1
# 32 "include/link.h"
enum
{
    LINK_STATE_START0,
    LINK_STATE_START1,
    LINK_STATE_HANDSHAKE,
    LINK_STATE_INIT_TIMER,
    LINK_STATE_CONN_ESTABLISHED,
};

enum
{
    EXCHANGE_NOT_STARTED,
    EXCHANGE_COMPLETE,
    EXCHANGE_TIMED_OUT,
    EXCHANGE_IN_PROGRESS,
};

enum
{
    QUEUE_FULL_NONE,
    QUEUE_FULL_SEND,
    QUEUE_FULL_RECV,
};

enum
{
    LAG_NONE,
    LAG_MASTER,
    LAG_SLAVE,
};

struct LinkPlayer
{
               u16 version;
               u16 lp_field_2;
               u32 trainerId;
               u8 name[11];
               u8 gender;
               u32 linkType;
               u16 lp_field_18;
               u16 language;
};

struct LinkPlayerBlock
{
    u8 magic1[16];
    struct LinkPlayer linkPlayer;
    u8 magic2[16];
};



struct SendQueue
{
    u16 data[8][50];
    u8 pos;
    u8 count;
};

struct RecvQueue
{
    u16 data[4][8][50];
    u8 pos;
    u8 count;
};

struct Link
{
    u8 isMaster;
    u8 state;
    u8 localId;
    u8 playerCount;
    u16 tempRecvBuffer[4];
    bool8 receivedNothing;
    s8 serialIntrCounter;
    bool8 handshakeAsMaster;
    u8 link_field_F;


    bool8 hardwareError;
    bool8 badChecksum;
    u8 queueFull;
    u8 lag;

    u16 checksum;

    u8 sendCmdIndex;
    u8 recvCmdIndex;

    struct SendQueue sendQueue;
    struct RecvQueue recvQueue;
};

struct BlockRequest {
    void * address;
    u32 size;
};

extern const struct BlockRequest sBlockRequestLookupTable[5];

extern struct Link gLink;
extern u16 gRecvCmds[8][4];
extern u8 gBlockSendBuffer[0x100];
extern u16 gLinkType;
extern u32 gLinkStatus;
extern u16 gBlockRecvBuffer[4][0x100 / 2];
extern u16 gSendCmd[8];
extern u8 gShouldAdvanceLinkState;
extern struct LinkPlayer gLinkPlayers[];
extern u16 word_3002910[];
extern bool8 gReceivedRemoteLinkPlayers;
extern bool8 gLinkOpen;

void Task_DestroySelf(u8);
void sub_8007270(u8);
void OpenLink(void);
void CloseLink(void);
u16 LinkMain2(u16 *);
void sub_8007B14(void);
bool32 sub_8007B24(void);
void ClearLinkCallback(void);
void ClearLinkCallback_2(void);
u8 GetLinkPlayerCount(void);
void OpenLinkTimed(void);
u8 GetLinkPlayerDataExchangeStatusTimed(void);
bool8 IsLinkPlayerDataExchangeComplete(void);
u32 GetLinkPlayerTrainerId(u8);
void ResetLinkPlayers(void);
void sub_8007E24(void);
void sub_8007E4C(void);
u8 GetMultiplayerId(void);
u8 bitmask_all_link_players_but_self(void);
bool8 SendBlock(u8, void *, u16);
bool8 sub_8007E9C(u8);
bool8 sub_8007ECC(void);
u8 GetBlockReceivedStatus(void);
void ResetBlockReceivedFlags(void);
void ResetBlockReceivedFlag(u8);
void sub_8007F4C(void);
void SetLinkDebugValues(u32, u32);
u8 sub_8008198(void);
void sub_80081C8(u8);
u8 sub_800820C(void);
u8 sub_8008218(void);
void sub_800826C(void);
void sub_80082EC(void);
u8 GetLinkPlayerCount_2(void);
bool8 IsLinkMaster(void);
void sub_800832C(void);
void sub_8008480(void);
void sub_80084A4(void);
void CB2_LinkError(void);
u8 GetSioMultiSI(void);
bool8 IsLinkConnectionEstablished(void);
void SetSuppressLinkErrorMessage(bool8);
bool8 HasLinkErrorOccurred(void);
void ResetSerial(void);
u32 LinkMain1(u8 *, u16 *, u16[8][4]);
void LinkVSync(void);
void Timer3Intr(void);
void SerialCB(void);
# 11 "src/engine/trade.c" 2
# 1 "include/strings2.h" 1




extern const u8 gOtherText_TopSpeed[];


extern const u8 gMultiText_BerryBlenderMaxSpeedRecord[];
extern const u8 gMultiText_2P3P4P[];
extern const u8 gMultiText_Saving[];


extern const u8 gMultiText_LinkError[];


extern const u8 gSystemText_OptionMenu[];
extern const u8 gSystemText_TextSpeed[];
extern const u8 gSystemText_BattleScene[];
extern const u8 gSystemText_BattleStyle[];
extern const u8 gSystemText_Sound[];
extern const u8 gSystemText_Frame[];
extern const u8 gSystemText_Cancel[];
extern const u8 gSystemText_ButtonMode[];
extern const u8 gSystemText_Slow[];
extern const u8 gSystemText_Mid[];
extern const u8 gSystemText_Fast[];
extern const u8 gSystemText_On[];
extern const u8 gSystemText_Off[];
extern const u8 gSystemText_Shift[];
extern const u8 gSystemText_Set[];
extern const u8 gSystemText_Mono[];
extern const u8 gSystemText_Stereo[];
extern const u8 gSystemText_Type[];
extern const u8 gSystemText_Terminator[];
extern const u8 gSystemText_Normal[];
extern const u8 gSystemText_LR[];
extern const u8 gSystemText_LA[];


extern const u8 SystemText_Pokedex[];
extern const u8 SystemText_Pokemon[];
extern const u8 SystemText_BAG[];
extern const u8 SystemText_Pokenav[];
extern const u8 SystemText_Player[];
extern const u8 SystemText_Save[];
extern const u8 SystemText_Option[];
extern const u8 SystemText_Exit[];
extern const u8 SystemText_Retire[];
extern const u8 gOtherText_SafariStock[];


extern const u8 gSystemText_LinkStandby[];
extern const u8 gSystemText_LoadEventPressA[];
extern const u8 gSystemText_LoadingEvent[];
extern const u8 gSystemText_DontCutLink[];
extern const u8 gSystemText_EventLoadSuccess[];
extern const u8 gSystemText_LoadingError[];


extern const u8 gOtherText_Hoenn[];


extern const u8 gOtherText_OhABite[];
extern const u8 gOtherText_PokeOnHook[];
extern const u8 gOtherText_NotEvenANibble[];
extern const u8 gOtherText_ItGotAway[];


extern const u8 gTradeText_WillBeSent[];
extern const u8 gTradeText_ByeBye[];
extern const u8 gTradeText_SentOverPoke[];
extern const u8 gTradeText_TakeGoodCare[];
extern const u8 TradeText_Cancel[];
extern const u8 TradeText_ChoosePoke[];
extern const u8 TradeText_Summary1[];
extern const u8 TradeText_Trade1[];
extern const u8 TradeText_CancelTradePrompt[];
extern const u8 TradeText_PressBToExit[];
extern const u8 TradeText_Summary2[];
extern const u8 TradeText_Trade2[];
extern const u8 TradeText_LinkStandby[];
extern const u8 TradeText_TradeCancelled[];
extern const u8 TradeText_OnlyPoke[];
extern const u8 TradeText_NonTradablePoke[];
extern const u8 TradeText_WaitingForFriend[];
extern const u8 TradeText_WantToTrade[];
extern const u8 gTradeText_TradeOkayPrompt[];
extern const u8 gOtherText_Terminator2[];
extern const u8 gOtherText_ControlAndMiscText[];
extern const u8 gOtherText_FourQuestions[];


extern const u8 gEasyChatGroupName_Pokemon[];
extern const u8 gEasyChatGroupName_Trainer[];
extern const u8 gEasyChatGroupName_Status[];
extern const u8 gEasyChatGroupName_Battle[];
extern const u8 gEasyChatGroupName_Greetings[];
extern const u8 gEasyChatGroupName_People[];
extern const u8 gEasyChatGroupName_Voices[];
extern const u8 gEasyChatGroupName_Speech[];
extern const u8 gEasyChatGroupName_Endings[];
extern const u8 gEasyChatGroupName_Feelings[];
extern const u8 gEasyChatGroupName_Conditions[];
extern const u8 gEasyChatGroupName_Actions[];
extern const u8 gEasyChatGroupName_Lifestyle[];
extern const u8 gEasyChatGroupName_Hobbies[];
extern const u8 gEasyChatGroupName_Time[];
extern const u8 gEasyChatGroupName_Misc[];
extern const u8 gEasyChatGroupName_Adjectives[];
extern const u8 gEasyChatGroupName_Events[];
extern const u8 gEasyChatGroupName_Move1[];
extern const u8 gEasyChatGroupName_Move2[];
extern const u8 gEasyChatGroupName_TrendySaying[];
extern const u8 gEasyChatGroupName_Pokemon2[];
extern const u8 gOtherText_ThreeQuestions[];


extern const u8 gOtherText_From[];


extern const u8 gOtherText_MixingRecordsWithFriend[];
extern const u8 gOtherText_MixingComplete[];


extern const u8 gOtherText_TrainersTrainerCard[];
extern const u8 gOtherText_FirstHOF[];
extern const u8 gOtherText_LinkCableBattles[];
extern const u8 gOtherText_BattleTowerWinRecord[];
extern const u8 gOtherText_ContestRecord[];
extern const u8 gOtherText_MixingRecord[];
extern const u8 gOtherText_TradeRecord[];
extern const u8 gOtherText_Boy[];
extern const u8 gOtherText_Girl[];


extern const u8 gOtherText_Player[];
extern const u8 gOtherText_Badges[];
extern const u8 gOtherText_Pokedex[];
extern const u8 gOtherText_PlayTime[];


extern const u8 gOtherText_SentToPC[];
extern const u8 OtherText_YourName[];
extern const u8 OtherText_BoxName[];
extern const u8 OtherText_PokeName[];


extern const u8 gOtherText_Marco[];


extern const u8 gOtherText_Coins[];


extern const u8 gOtherText_BattleResults[];
extern const u8 gOtherText_WinRecord[];
extern const u8 gOtherText_WinLoseDraw[];
extern const u8 gOtherText_SevenDashes[];
extern const u8 gOtherText_FourDashes[];
extern const u8 gOtherText_BattleTowerResults[];
extern const u8 gOtherText_Lv50[];
extern const u8 gOtherText_Lv100[];
extern const u8 gOtherText_WinStreak[];
extern const u8 gOtherText_Current[];
extern const u8 gOtherText_Record[];
extern const u8 gOtherText_Prev[];


extern const u8 gOtherText_QuitGamePrompt[];
extern const u8 gOtherText_MaxCoins[];
extern const u8 gOtherText_OutOfCoins[];
extern const u8 gOtherText_DontHaveThreeCoins[];
extern const u8 gOtherText_ReelTime[];


extern const u8 DaycareText_GetAlongVeryWell[];
extern const u8 DaycareText_GetAlong[];
extern const u8 DaycareText_DontLikeOther[];
extern const u8 DaycareText_PlayOther[];
extern const u8 gOtherText_NewLine2[];
extern const u8 gOtherText_CancelAndLv[];


extern const u8 gEggNickname[];


extern const u8 gOtherText_HatchedFromEgg[];
extern const u8 gOtherText_NickHatchPrompt[];


extern const u8 OtherText_Battle[];
extern const u8 OtherText_Contest[];


extern const u8 OtherText_Type[];
extern const u8 OtherText_PP[];


extern const u8 OtherText_Power[];
extern const u8 OtherText_Accuracy[];
extern const u8 OtherText_Appeal[];
extern const u8 OtherText_Jam[];
extern const u8 gOtherText_TeachWhichMove[];
extern const u8 gOtherText_TeachSpecificMove[];
extern const u8 gOtherText_PokeLearnedMove[];
extern const u8 gOtherText_DeleteOlderMove[];
extern const u8 gOtherText_StopLearningMove[];
extern const u8 gOtherText_ForgotMove123[];
extern const u8 gOtherText_ForgotOrDidNotLearnMove[];
extern const u8 gOtherText_GiveUpTeachingMove[];
extern const u8 gOtherText_WhichMoveToForget[];


extern const u8 gSystemText_ClearAllSaveDataPrompt[];
extern const u8 gSystemText_ClearingData[];


extern const u8 gContestText_AnnounceResults[];
extern const u8 gContestText_PreliminaryResults[];
extern const u8 gContestText_Round2Results[];
extern const u8 gContestText_PokeWon[];
extern const u8 gOtherText_LinkStandby[];


extern const u8 gLandmarkName_FlowerShop[];
extern const u8 gLandmarkName_PetalburgWoods[];
extern const u8 gLandmarkName_MrBrineysCottage[];
extern const u8 gLandmarkName_AbandonedShip[];
extern const u8 gLandmarkName_SeashoreHouse[];
extern const u8 gLandmarkName_SlateportBeach[];
extern const u8 gLandmarkName_CyclingRoad[];
extern const u8 gLandmarkName_NewMauville[];
extern const u8 gLandmarkName_TrickHouse[];
extern const u8 gLandmarkName_OldLadysRestShop[];
extern const u8 gLandmarkName_Desert[];
extern const u8 gLandmarkName_WinstrateFamily[];
extern const u8 gLandmarkName_CableCar[];
extern const u8 gLandmarkName_GlassWorkshop[];
extern const u8 gLandmarkName_WeatherInstitute[];
extern const u8 gLandmarkName_MeteorFalls[];
extern const u8 gLandmarkName_TunnelersRestHouse[];
extern const u8 gLandmarkName_RusturfTunnel[];
extern const u8 gLandmarkName_PokemonDayCare[];
extern const u8 gLandmarkName_SafariZoneEntrance[];
extern const u8 gLandmarkName_MtPyre[];
extern const u8 gLandmarkName_ShoalCave[];
extern const u8 gLandmarkName_SeafloorCavern[];
extern const u8 gLandmarkName_GraniteCave[];
extern const u8 gLandmarkName_OceanCurrent[];
extern const u8 gLandmarkName_LanettesHouse[];
extern const u8 gLandmarkName_FieryPath[];
extern const u8 gLandmarkName_JaggedPass[];
extern const u8 gLandmarkName_SkyPillar[];
extern const u8 gLandmarkName_BerryMastersHouse[];
extern const u8 gLandmarkName_IslandCave[];
extern const u8 gLandmarkName_DesertRuins[];
extern const u8 gLandmarkName_ScorchedSlab[];
extern const u8 gLandmarkName_AncientTomb[];
extern const u8 gLandmarkName_SealedChamber[];
extern const u8 gLandmarkName_FossilManiacsHouse[];
extern const u8 gLandmarkName_HuntersHouse[];


extern const u8 gOtherText_Terminator4[];
extern const u8 gOtherText_Nature[];
extern const u8 gOtherText_Comma[];
extern const u8 gOtherText_Met[];
extern const u8 gOtherText_Egg2[];
extern const u8 gOtherText_ObtainedInTrade[];
extern const u8 gOtherText_FatefulEncounter[];
extern const u8 gOtherText_Met2[];
extern const u8 gOtherText_EggDayCare[];
extern const u8 gOtherText_EggNicePlace[];
extern const u8 gOtherText_EggObtainedInTrade[];
extern const u8 gOtherText_EggHotSprings[];


extern const u8 gOtherText_LinkStandby2[];


extern const u8 gOtherText_YesNoAndPlayer[];


extern const u8 gOtherText_HoennDex[];
extern const u8 gOtherText_NationalDex[];
extern const u8 gOtherText_DiplomaCertificationGameFreak[];


extern const u8 gOtherText_PLink[];


extern const u8 gOtherText_YesNoTerminating[];
extern const u8 gOtherText_LinkNotFound[];
extern const u8 gOtherText_BlenderChooseBerry[];
extern const u8 gOtherText_PokeBlockMade[];
extern const u8 gOtherText_PressAToStart[];
extern const u8 gOtherText_PleaseWait[];
extern const u8 gOtherText_LinkStandby3[];
extern const u8 gOtherText_BlendAnotherBerryPrompt[];
extern const u8 gOtherText_OutOfBerries[];
extern const u8 gOtherText_CaseIsFull[];
extern const u8 gOtherText_NoBerriesForBlend[];
extern const u8 gOtherText_OtherCaseIsFull[];
extern const u8 gOtherText_ResultsOfBlending[];
extern const u8 gOtherText_Berry[];
extern const u8 gOtherText_RequiredTime[];
extern const u8 gOtherText_Min[];
extern const u8 gOtherText_Sec[];
extern const u8 gOtherText_MaxSpeed[];
extern const u8 gOtherText_RPM[];
extern const u8 gOtherText_Ranking[];
extern const u8 gOtherText_BlockLevelIs[];
extern const u8 gOtherText_BlockFeelIs[];
extern const u8 gOtherText_Period[];


extern const u8 gOtherText_Day[];
extern const u8 gOtherText_OK[];


extern const u8 gOtherText_CorrectTimePrompt[];
# 12 "src/engine/trade.c" 2
# 1 "include/graphics.h" 1




extern const u8 gInterfaceGfx_PokeBall[];
extern const u8 gInterfacePal_PokeBall[];
extern const u8 gInterfaceGfx_GreatBall[];
extern const u8 gInterfacePal_GreatBall[];
extern const u8 gInterfaceGfx_SafariBall[];
extern const u8 gInterfacePal_SafariBall[];
extern const u8 gInterfaceGfx_UltraBall[];
extern const u8 gInterfacePal_UltraBall[];
extern const u8 gInterfaceGfx_MasterBall[];
extern const u8 gInterfacePal_MasterBall[];
extern const u8 gInterfaceGfx_NetBall[];
extern const u8 gInterfacePal_NetBall[];
extern const u8 gInterfaceGfx_DiveBall[];
extern const u8 gInterfacePal_DiveBall[];
extern const u8 gInterfaceGfx_NestBall[];
extern const u8 gInterfacePal_NestBall[];
extern const u8 gInterfaceGfx_RepeatBall[];
extern const u8 gInterfacePal_RepeatBall[];
extern const u8 gInterfaceGfx_TimerBall[];
extern const u8 gInterfacePal_TimerBall[];
extern const u8 gInterfaceGfx_LuxuryBall[];
extern const u8 gInterfacePal_LuxuryBall[];
extern const u8 gInterfaceGfx_PremierBall[];
extern const u8 gInterfacePal_PremierBall[];
extern const u8 gUnknown_08D030D0[];

extern const u8 gMonFootprint_QuestionMark[];


extern const u8 gMonFrontPic_Bulbasaur[];
extern const u8 gMonPalette_Bulbasaur[];
extern const u8 gMonBackPic_Bulbasaur[];
extern const u8 gMonShinyPalette_Bulbasaur[];
extern const u8 gMonIcon_Bulbasaur[];
extern const u8 gMonFootprint_Bulbasaur[];
extern const u8 gMonFrontPic_Ivysaur[];
extern const u8 gMonPalette_Ivysaur[];
extern const u8 gMonBackPic_Ivysaur[];
extern const u8 gMonShinyPalette_Ivysaur[];
extern const u8 gMonIcon_Ivysaur[];
extern const u8 gMonFootprint_Ivysaur[];
extern const u8 gMonFrontPic_Venusaur[];
extern const u8 gMonPalette_Venusaur[];
extern const u8 gMonBackPic_Venusaur[];
extern const u8 gMonShinyPalette_Venusaur[];
extern const u8 gMonIcon_Venusaur[];
extern const u8 gMonFootprint_Venusaur[];
extern const u8 gMonFrontPic_Charmander[];
extern const u8 gMonPalette_Charmander[];
extern const u8 gMonBackPic_Charmander[];
extern const u8 gMonShinyPalette_Charmander[];
extern const u8 gMonIcon_Charmander[];
extern const u8 gMonFootprint_Charmander[];
extern const u8 gMonFrontPic_Charmeleon[];
extern const u8 gMonPalette_Charmeleon[];
extern const u8 gMonBackPic_Charmeleon[];
extern const u8 gMonShinyPalette_Charmeleon[];
extern const u8 gMonIcon_Charmeleon[];
extern const u8 gMonFootprint_Charmeleon[];
extern const u8 gMonFrontPic_Charizard[];
extern const u8 gMonPalette_Charizard[];
extern const u8 gMonBackPic_Charizard[];
extern const u8 gMonShinyPalette_Charizard[];
extern const u8 gMonIcon_Charizard[];
extern const u8 gMonFootprint_Charizard[];
extern const u8 gMonFrontPic_Squirtle[];
extern const u8 gMonPalette_Squirtle[];
extern const u8 gMonBackPic_Squirtle[];
extern const u8 gMonShinyPalette_Squirtle[];
extern const u8 gMonIcon_Squirtle[];
extern const u8 gMonFootprint_Squirtle[];
extern const u8 gMonFrontPic_Wartortle[];
extern const u8 gMonPalette_Wartortle[];
extern const u8 gMonBackPic_Wartortle[];
extern const u8 gMonShinyPalette_Wartortle[];
extern const u8 gMonIcon_Wartortle[];
extern const u8 gMonFootprint_Wartortle[];
extern const u8 gMonFrontPic_Blastoise[];
extern const u8 gMonPalette_Blastoise[];
extern const u8 gMonBackPic_Blastoise[];
extern const u8 gMonShinyPalette_Blastoise[];
extern const u8 gMonIcon_Blastoise[];
extern const u8 gMonFootprint_Blastoise[];
extern const u8 gMonFrontPic_Caterpie[];
extern const u8 gMonPalette_Caterpie[];
extern const u8 gMonBackPic_Caterpie[];
extern const u8 gMonShinyPalette_Caterpie[];
extern const u8 gMonIcon_Caterpie[];
extern const u8 gMonFootprint_Caterpie[];
extern const u8 gMonFrontPic_Metapod[];
extern const u8 gMonPalette_Metapod[];
extern const u8 gMonBackPic_Metapod[];
extern const u8 gMonShinyPalette_Metapod[];
extern const u8 gMonIcon_Metapod[];
extern const u8 gMonFootprint_Metapod[];
extern const u8 gMonFrontPic_Butterfree[];
extern const u8 gMonPalette_Butterfree[];
extern const u8 gMonBackPic_Butterfree[];
extern const u8 gMonShinyPalette_Butterfree[];
extern const u8 gMonIcon_Butterfree[];
extern const u8 gMonFootprint_Butterfree[];
extern const u8 gMonFrontPic_Weedle[];
extern const u8 gMonPalette_Weedle[];
extern const u8 gMonBackPic_Weedle[];
extern const u8 gMonShinyPalette_Weedle[];
extern const u8 gMonIcon_Weedle[];
extern const u8 gMonFootprint_Weedle[];
extern const u8 gMonFrontPic_Kakuna[];
extern const u8 gMonPalette_Kakuna[];
extern const u8 gMonBackPic_Kakuna[];
extern const u8 gMonShinyPalette_Kakuna[];
extern const u8 gMonIcon_Kakuna[];
extern const u8 gMonFootprint_Kakuna[];
extern const u8 gMonFrontPic_Beedrill[];
extern const u8 gMonPalette_Beedrill[];
extern const u8 gMonBackPic_Beedrill[];
extern const u8 gMonShinyPalette_Beedrill[];
extern const u8 gMonIcon_Beedrill[];
extern const u8 gMonFootprint_Beedrill[];
extern const u8 gMonFrontPic_Pidgey[];
extern const u8 gMonPalette_Pidgey[];
extern const u8 gMonBackPic_Pidgey[];
extern const u8 gMonShinyPalette_Pidgey[];
extern const u8 gMonIcon_Pidgey[];
extern const u8 gMonFootprint_Pidgey[];
extern const u8 gMonFrontPic_Pidgeotto[];
extern const u8 gMonPalette_Pidgeotto[];
extern const u8 gMonBackPic_Pidgeotto[];
extern const u8 gMonShinyPalette_Pidgeotto[];
extern const u8 gMonIcon_Pidgeotto[];
extern const u8 gMonFootprint_Pidgeotto[];
extern const u8 gMonFrontPic_Pidgeot[];
extern const u8 gMonPalette_Pidgeot[];
extern const u8 gMonBackPic_Pidgeot[];
extern const u8 gMonShinyPalette_Pidgeot[];
extern const u8 gMonIcon_Pidgeot[];
extern const u8 gMonFootprint_Pidgeot[];
extern const u8 gMonFrontPic_Rattata[];
extern const u8 gMonPalette_Rattata[];
extern const u8 gMonBackPic_Rattata[];
extern const u8 gMonShinyPalette_Rattata[];
extern const u8 gMonIcon_Rattata[];
extern const u8 gMonFootprint_Rattata[];
extern const u8 gMonFrontPic_Raticate[];
extern const u8 gMonPalette_Raticate[];
extern const u8 gMonBackPic_Raticate[];
extern const u8 gMonShinyPalette_Raticate[];
extern const u8 gMonIcon_Raticate[];
extern const u8 gMonFootprint_Raticate[];
extern const u8 gMonFrontPic_Spearow[];
extern const u8 gMonPalette_Spearow[];
extern const u8 gMonBackPic_Spearow[];
extern const u8 gMonShinyPalette_Spearow[];
extern const u8 gMonIcon_Spearow[];
extern const u8 gMonFootprint_Spearow[];
extern const u8 gMonFrontPic_Fearow[];
extern const u8 gMonPalette_Fearow[];
extern const u8 gMonBackPic_Fearow[];
extern const u8 gMonShinyPalette_Fearow[];
extern const u8 gMonIcon_Fearow[];
extern const u8 gMonFootprint_Fearow[];
extern const u8 gMonFrontPic_Ekans[];
extern const u8 gMonPalette_Ekans[];
extern const u8 gMonBackPic_Ekans[];
extern const u8 gMonShinyPalette_Ekans[];
extern const u8 gMonIcon_Ekans[];
extern const u8 gMonFootprint_Ekans[];
extern const u8 gMonFrontPic_Arbok[];
extern const u8 gMonPalette_Arbok[];
extern const u8 gMonBackPic_Arbok[];
extern const u8 gMonShinyPalette_Arbok[];
extern const u8 gMonIcon_Arbok[];
extern const u8 gMonFootprint_Arbok[];
extern const u8 gMonFrontPic_Pikachu[];
extern const u8 gMonPalette_Pikachu[];
extern const u8 gMonBackPic_Pikachu[];
extern const u8 gMonShinyPalette_Pikachu[];
extern const u8 gMonIcon_Pikachu[];
extern const u8 gMonFootprint_Pikachu[];
extern const u8 gMonFrontPic_Raichu[];
extern const u8 gMonPalette_Raichu[];
extern const u8 gMonBackPic_Raichu[];
extern const u8 gMonShinyPalette_Raichu[];
extern const u8 gMonIcon_Raichu[];
extern const u8 gMonFootprint_Raichu[];
extern const u8 gMonFrontPic_Sandshrew[];
extern const u8 gMonPalette_Sandshrew[];
extern const u8 gMonBackPic_Sandshrew[];
extern const u8 gMonShinyPalette_Sandshrew[];
extern const u8 gMonIcon_Sandshrew[];
extern const u8 gMonFootprint_Sandshrew[];
extern const u8 gMonFrontPic_Sandslash[];
extern const u8 gMonPalette_Sandslash[];
extern const u8 gMonBackPic_Sandslash[];
extern const u8 gMonShinyPalette_Sandslash[];
extern const u8 gMonIcon_Sandslash[];
extern const u8 gMonFootprint_Sandslash[];
extern const u8 gMonFrontPic_NidoranF[];
extern const u8 gMonPalette_NidoranF[];
extern const u8 gMonBackPic_NidoranF[];
extern const u8 gMonShinyPalette_NidoranF[];
extern const u8 gMonIcon_NidoranF[];
extern const u8 gMonFootprint_NidoranF[];
extern const u8 gMonFrontPic_Nidorina[];
extern const u8 gMonPalette_Nidorina[];
extern const u8 gMonBackPic_Nidorina[];
extern const u8 gMonShinyPalette_Nidorina[];
extern const u8 gMonIcon_Nidorina[];
extern const u8 gMonFootprint_Nidorina[];
extern const u8 gMonFrontPic_Nidoqueen[];
extern const u8 gMonPalette_Nidoqueen[];
extern const u8 gMonBackPic_Nidoqueen[];
extern const u8 gMonShinyPalette_Nidoqueen[];
extern const u8 gMonIcon_Nidoqueen[];
extern const u8 gMonFootprint_Nidoqueen[];
extern const u8 gMonFrontPic_NidoranM[];
extern const u8 gMonPalette_NidoranM[];
extern const u8 gMonBackPic_NidoranM[];
extern const u8 gMonShinyPalette_NidoranM[];
extern const u8 gMonIcon_NidoranM[];
extern const u8 gMonFootprint_NidoranM[];
extern const u8 gMonFrontPic_Nidorino[];
extern const u8 gMonPalette_Nidorino[];
extern const u8 gMonBackPic_Nidorino[];
extern const u8 gMonShinyPalette_Nidorino[];
extern const u8 gMonIcon_Nidorino[];
extern const u8 gMonFootprint_Nidorino[];
extern const u8 gMonFrontPic_Nidoking[];
extern const u8 gMonPalette_Nidoking[];
extern const u8 gMonBackPic_Nidoking[];
extern const u8 gMonShinyPalette_Nidoking[];
extern const u8 gMonIcon_Nidoking[];
extern const u8 gMonFootprint_Nidoking[];
extern const u8 gMonFrontPic_Clefairy[];
extern const u8 gMonPalette_Clefairy[];
extern const u8 gMonBackPic_Clefairy[];
extern const u8 gMonShinyPalette_Clefairy[];
extern const u8 gMonIcon_Clefairy[];
extern const u8 gMonFootprint_Clefairy[];
extern const u8 gMonFrontPic_Clefable[];
extern const u8 gMonPalette_Clefable[];
extern const u8 gMonBackPic_Clefable[];
extern const u8 gMonShinyPalette_Clefable[];
extern const u8 gMonIcon_Clefable[];
extern const u8 gMonFootprint_Clefable[];
extern const u8 gMonFrontPic_Vulpix[];
extern const u8 gMonPalette_Vulpix[];
extern const u8 gMonBackPic_Vulpix[];
extern const u8 gMonShinyPalette_Vulpix[];
extern const u8 gMonIcon_Vulpix[];
extern const u8 gMonFootprint_Vulpix[];
extern const u8 gMonFrontPic_Ninetales[];
extern const u8 gMonPalette_Ninetales[];
extern const u8 gMonBackPic_Ninetales[];
extern const u8 gMonShinyPalette_Ninetales[];
extern const u8 gMonIcon_Ninetales[];
extern const u8 gMonFootprint_Ninetales[];
extern const u8 gMonFrontPic_Jigglypuff[];
extern const u8 gMonPalette_Jigglypuff[];
extern const u8 gMonBackPic_Jigglypuff[];
extern const u8 gMonShinyPalette_Jigglypuff[];
extern const u8 gMonIcon_Jigglypuff[];
extern const u8 gMonFootprint_Jigglypuff[];
extern const u8 gMonFrontPic_Wigglytuff[];
extern const u8 gMonPalette_Wigglytuff[];
extern const u8 gMonBackPic_Wigglytuff[];
extern const u8 gMonShinyPalette_Wigglytuff[];
extern const u8 gMonIcon_Wigglytuff[];
extern const u8 gMonFootprint_Wigglytuff[];
extern const u8 gMonFrontPic_Zubat[];
extern const u8 gMonPalette_Zubat[];
extern const u8 gMonBackPic_Zubat[];
extern const u8 gMonShinyPalette_Zubat[];
extern const u8 gMonIcon_Zubat[];
extern const u8 gMonFootprint_Zubat[];
extern const u8 gMonFrontPic_Golbat[];
extern const u8 gMonPalette_Golbat[];
extern const u8 gMonBackPic_Golbat[];
extern const u8 gMonShinyPalette_Golbat[];
extern const u8 gMonIcon_Golbat[];
extern const u8 gMonFootprint_Golbat[];
extern const u8 gMonFrontPic_Oddish[];
extern const u8 gMonPalette_Oddish[];
extern const u8 gMonBackPic_Oddish[];
extern const u8 gMonShinyPalette_Oddish[];
extern const u8 gMonIcon_Oddish[];
extern const u8 gMonFootprint_Oddish[];
extern const u8 gMonFrontPic_Gloom[];
extern const u8 gMonPalette_Gloom[];
extern const u8 gMonBackPic_Gloom[];
extern const u8 gMonShinyPalette_Gloom[];
extern const u8 gMonIcon_Gloom[];
extern const u8 gMonFootprint_Gloom[];
extern const u8 gMonFrontPic_Vileplume[];
extern const u8 gMonPalette_Vileplume[];
extern const u8 gMonBackPic_Vileplume[];
extern const u8 gMonShinyPalette_Vileplume[];
extern const u8 gMonIcon_Vileplume[];
extern const u8 gMonFootprint_Vileplume[];
extern const u8 gMonFrontPic_Paras[];
extern const u8 gMonPalette_Paras[];
extern const u8 gMonBackPic_Paras[];
extern const u8 gMonShinyPalette_Paras[];
extern const u8 gMonIcon_Paras[];
extern const u8 gMonFootprint_Paras[];
extern const u8 gMonFrontPic_Parasect[];
extern const u8 gMonPalette_Parasect[];
extern const u8 gMonBackPic_Parasect[];
extern const u8 gMonShinyPalette_Parasect[];
extern const u8 gMonIcon_Parasect[];
extern const u8 gMonFootprint_Parasect[];
extern const u8 gMonFrontPic_Venonat[];
extern const u8 gMonPalette_Venonat[];
extern const u8 gMonBackPic_Venonat[];
extern const u8 gMonShinyPalette_Venonat[];
extern const u8 gMonIcon_Venonat[];
extern const u8 gMonFootprint_Venonat[];
extern const u8 gMonFrontPic_Venomoth[];
extern const u8 gMonPalette_Venomoth[];
extern const u8 gMonBackPic_Venomoth[];
extern const u8 gMonShinyPalette_Venomoth[];
extern const u8 gMonIcon_Venomoth[];
extern const u8 gMonFootprint_Venomoth[];
extern const u8 gMonFrontPic_Diglett[];
extern const u8 gMonPalette_Diglett[];
extern const u8 gMonBackPic_Diglett[];
extern const u8 gMonShinyPalette_Diglett[];
extern const u8 gMonIcon_Diglett[];
extern const u8 gMonFootprint_Diglett[];
extern const u8 gMonFrontPic_Dugtrio[];
extern const u8 gMonPalette_Dugtrio[];
extern const u8 gMonBackPic_Dugtrio[];
extern const u8 gMonShinyPalette_Dugtrio[];
extern const u8 gMonIcon_Dugtrio[];
extern const u8 gMonFootprint_Dugtrio[];
extern const u8 gMonFrontPic_Meowth[];
extern const u8 gMonPalette_Meowth[];
extern const u8 gMonBackPic_Meowth[];
extern const u8 gMonShinyPalette_Meowth[];
extern const u8 gMonIcon_Meowth[];
extern const u8 gMonFootprint_Meowth[];
extern const u8 gMonFrontPic_Persian[];
extern const u8 gMonPalette_Persian[];
extern const u8 gMonBackPic_Persian[];
extern const u8 gMonShinyPalette_Persian[];
extern const u8 gMonIcon_Persian[];
extern const u8 gMonFootprint_Persian[];
extern const u8 gMonFrontPic_Psyduck[];
extern const u8 gMonPalette_Psyduck[];
extern const u8 gMonBackPic_Psyduck[];
extern const u8 gMonShinyPalette_Psyduck[];
extern const u8 gMonIcon_Psyduck[];
extern const u8 gMonFootprint_Psyduck[];
extern const u8 gMonFrontPic_Golduck[];
extern const u8 gMonPalette_Golduck[];
extern const u8 gMonBackPic_Golduck[];
extern const u8 gMonShinyPalette_Golduck[];
extern const u8 gMonIcon_Golduck[];
extern const u8 gMonFootprint_Golduck[];
extern const u8 gMonFrontPic_Mankey[];
extern const u8 gMonPalette_Mankey[];
extern const u8 gMonBackPic_Mankey[];
extern const u8 gMonShinyPalette_Mankey[];
extern const u8 gMonIcon_Mankey[];
extern const u8 gMonFootprint_Mankey[];
extern const u8 gMonFrontPic_Primeape[];
extern const u8 gMonPalette_Primeape[];
extern const u8 gMonBackPic_Primeape[];
extern const u8 gMonShinyPalette_Primeape[];
extern const u8 gMonIcon_Primeape[];
extern const u8 gMonFootprint_Primeape[];
extern const u8 gMonFrontPic_Growlithe[];
extern const u8 gMonPalette_Growlithe[];
extern const u8 gMonBackPic_Growlithe[];
extern const u8 gMonShinyPalette_Growlithe[];
extern const u8 gMonIcon_Growlithe[];
extern const u8 gMonFootprint_Growlithe[];
extern const u8 gMonFrontPic_Arcanine[];
extern const u8 gMonPalette_Arcanine[];
extern const u8 gMonBackPic_Arcanine[];
extern const u8 gMonShinyPalette_Arcanine[];
extern const u8 gMonIcon_Arcanine[];
extern const u8 gMonFootprint_Arcanine[];
extern const u8 gMonFrontPic_Poliwag[];
extern const u8 gMonPalette_Poliwag[];
extern const u8 gMonBackPic_Poliwag[];
extern const u8 gMonShinyPalette_Poliwag[];
extern const u8 gMonIcon_Poliwag[];
extern const u8 gMonFootprint_Poliwag[];
extern const u8 gMonFrontPic_Poliwhirl[];
extern const u8 gMonPalette_Poliwhirl[];
extern const u8 gMonBackPic_Poliwhirl[];
extern const u8 gMonShinyPalette_Poliwhirl[];
extern const u8 gMonIcon_Poliwhirl[];
extern const u8 gMonFootprint_Poliwhirl[];
extern const u8 gMonFrontPic_Poliwrath[];
extern const u8 gMonPalette_Poliwrath[];
extern const u8 gMonBackPic_Poliwrath[];
extern const u8 gMonShinyPalette_Poliwrath[];
extern const u8 gMonIcon_Poliwrath[];
extern const u8 gMonFootprint_Poliwrath[];
extern const u8 gMonFrontPic_Abra[];
extern const u8 gMonPalette_Abra[];
extern const u8 gMonBackPic_Abra[];
extern const u8 gMonShinyPalette_Abra[];
extern const u8 gMonIcon_Abra[];
extern const u8 gMonFootprint_Abra[];
extern const u8 gMonFrontPic_Kadabra[];
extern const u8 gMonPalette_Kadabra[];
extern const u8 gMonBackPic_Kadabra[];
extern const u8 gMonShinyPalette_Kadabra[];
extern const u8 gMonIcon_Kadabra[];
extern const u8 gMonFootprint_Kadabra[];
extern const u8 gMonFrontPic_Alakazam[];
extern const u8 gMonPalette_Alakazam[];
extern const u8 gMonBackPic_Alakazam[];
extern const u8 gMonShinyPalette_Alakazam[];
extern const u8 gMonIcon_Alakazam[];
extern const u8 gMonFootprint_Alakazam[];
extern const u8 gMonFrontPic_Machop[];
extern const u8 gMonPalette_Machop[];
extern const u8 gMonBackPic_Machop[];
extern const u8 gMonShinyPalette_Machop[];
extern const u8 gMonIcon_Machop[];
extern const u8 gMonFootprint_Machop[];
extern const u8 gMonFrontPic_Machoke[];
extern const u8 gMonPalette_Machoke[];
extern const u8 gMonBackPic_Machoke[];
extern const u8 gMonShinyPalette_Machoke[];
extern const u8 gMonIcon_Machoke[];
extern const u8 gMonFootprint_Machoke[];
extern const u8 gMonFrontPic_Machamp[];
extern const u8 gMonPalette_Machamp[];
extern const u8 gMonBackPic_Machamp[];
extern const u8 gMonShinyPalette_Machamp[];
extern const u8 gMonIcon_Machamp[];
extern const u8 gMonFootprint_Machamp[];
extern const u8 gMonFrontPic_Bellsprout[];
extern const u8 gMonPalette_Bellsprout[];
extern const u8 gMonBackPic_Bellsprout[];
extern const u8 gMonShinyPalette_Bellsprout[];
extern const u8 gMonIcon_Bellsprout[];
extern const u8 gMonFootprint_Bellsprout[];
extern const u8 gMonFrontPic_Weepinbell[];
extern const u8 gMonPalette_Weepinbell[];
extern const u8 gMonBackPic_Weepinbell[];
extern const u8 gMonShinyPalette_Weepinbell[];
extern const u8 gMonIcon_Weepinbell[];
extern const u8 gMonFootprint_Weepinbell[];
extern const u8 gMonFrontPic_Victreebel[];
extern const u8 gMonPalette_Victreebel[];
extern const u8 gMonBackPic_Victreebel[];
extern const u8 gMonShinyPalette_Victreebel[];
extern const u8 gMonIcon_Victreebel[];
extern const u8 gMonFootprint_Victreebel[];
extern const u8 gMonFrontPic_Tentacool[];
extern const u8 gMonPalette_Tentacool[];
extern const u8 gMonBackPic_Tentacool[];
extern const u8 gMonShinyPalette_Tentacool[];
extern const u8 gMonIcon_Tentacool[];
extern const u8 gMonFootprint_Tentacool[];
extern const u8 gMonFrontPic_Tentacruel[];
extern const u8 gMonPalette_Tentacruel[];
extern const u8 gMonBackPic_Tentacruel[];
extern const u8 gMonShinyPalette_Tentacruel[];
extern const u8 gMonIcon_Tentacruel[];
extern const u8 gMonFootprint_Tentacruel[];
extern const u8 gMonFrontPic_Geodude[];
extern const u8 gMonPalette_Geodude[];
extern const u8 gMonBackPic_Geodude[];
extern const u8 gMonShinyPalette_Geodude[];
extern const u8 gMonIcon_Geodude[];
extern const u8 gMonFootprint_Geodude[];
extern const u8 gMonFrontPic_Graveler[];
extern const u8 gMonPalette_Graveler[];
extern const u8 gMonBackPic_Graveler[];
extern const u8 gMonShinyPalette_Graveler[];
extern const u8 gMonIcon_Graveler[];
extern const u8 gMonFootprint_Graveler[];
extern const u8 gMonFrontPic_Golem[];
extern const u8 gMonPalette_Golem[];
extern const u8 gMonBackPic_Golem[];
extern const u8 gMonShinyPalette_Golem[];
extern const u8 gMonIcon_Golem[];
extern const u8 gMonFootprint_Golem[];
extern const u8 gMonFrontPic_Ponyta[];
extern const u8 gMonPalette_Ponyta[];
extern const u8 gMonBackPic_Ponyta[];
extern const u8 gMonShinyPalette_Ponyta[];
extern const u8 gMonIcon_Ponyta[];
extern const u8 gMonFootprint_Ponyta[];
extern const u8 gMonFrontPic_Rapidash[];
extern const u8 gMonPalette_Rapidash[];
extern const u8 gMonBackPic_Rapidash[];
extern const u8 gMonShinyPalette_Rapidash[];
extern const u8 gMonIcon_Rapidash[];
extern const u8 gMonFootprint_Rapidash[];
extern const u8 gMonFrontPic_Slowpoke[];
extern const u8 gMonPalette_Slowpoke[];
extern const u8 gMonBackPic_Slowpoke[];
extern const u8 gMonShinyPalette_Slowpoke[];
extern const u8 gMonIcon_Slowpoke[];
extern const u8 gMonFootprint_Slowpoke[];
extern const u8 gMonFrontPic_Slowbro[];
extern const u8 gMonPalette_Slowbro[];
extern const u8 gMonBackPic_Slowbro[];
extern const u8 gMonShinyPalette_Slowbro[];
extern const u8 gMonIcon_Slowbro[];
extern const u8 gMonFootprint_Slowbro[];
extern const u8 gMonFrontPic_Magnemite[];
extern const u8 gMonPalette_Magnemite[];
extern const u8 gMonBackPic_Magnemite[];
extern const u8 gMonShinyPalette_Magnemite[];
extern const u8 gMonIcon_Magnemite[];
extern const u8 gMonFootprint_Magnemite[];
extern const u8 gMonFrontPic_Magneton[];
extern const u8 gMonPalette_Magneton[];
extern const u8 gMonBackPic_Magneton[];
extern const u8 gMonShinyPalette_Magneton[];
extern const u8 gMonIcon_Magneton[];
extern const u8 gMonFootprint_Magneton[];
extern const u8 gMonFrontPic_Farfetchd[];
extern const u8 gMonPalette_Farfetchd[];
extern const u8 gMonBackPic_Farfetchd[];
extern const u8 gMonShinyPalette_Farfetchd[];
extern const u8 gMonIcon_Farfetchd[];
extern const u8 gMonFootprint_Farfetchd[];
extern const u8 gMonFrontPic_Doduo[];
extern const u8 gMonPalette_Doduo[];
extern const u8 gMonBackPic_Doduo[];
extern const u8 gMonShinyPalette_Doduo[];
extern const u8 gMonIcon_Doduo[];
extern const u8 gMonFootprint_Doduo[];
extern const u8 gMonFrontPic_Dodrio[];
extern const u8 gMonPalette_Dodrio[];
extern const u8 gMonBackPic_Dodrio[];
extern const u8 gMonShinyPalette_Dodrio[];
extern const u8 gMonIcon_Dodrio[];
extern const u8 gMonFootprint_Dodrio[];
extern const u8 gMonFrontPic_Seel[];
extern const u8 gMonPalette_Seel[];
extern const u8 gMonBackPic_Seel[];
extern const u8 gMonShinyPalette_Seel[];
extern const u8 gMonIcon_Seel[];
extern const u8 gMonFootprint_Seel[];
extern const u8 gMonFrontPic_Dewgong[];
extern const u8 gMonPalette_Dewgong[];
extern const u8 gMonBackPic_Dewgong[];
extern const u8 gMonShinyPalette_Dewgong[];
extern const u8 gMonIcon_Dewgong[];
extern const u8 gMonFootprint_Dewgong[];
extern const u8 gMonFrontPic_Grimer[];
extern const u8 gMonPalette_Grimer[];
extern const u8 gMonBackPic_Grimer[];
extern const u8 gMonShinyPalette_Grimer[];
extern const u8 gMonIcon_Grimer[];
extern const u8 gMonFootprint_Grimer[];
extern const u8 gMonFrontPic_Muk[];
extern const u8 gMonPalette_Muk[];
extern const u8 gMonBackPic_Muk[];
extern const u8 gMonShinyPalette_Muk[];
extern const u8 gMonIcon_Muk[];
extern const u8 gMonFootprint_Muk[];
extern const u8 gMonFrontPic_Shellder[];
extern const u8 gMonPalette_Shellder[];
extern const u8 gMonBackPic_Shellder[];
extern const u8 gMonShinyPalette_Shellder[];
extern const u8 gMonIcon_Shellder[];
extern const u8 gMonFootprint_Shellder[];
extern const u8 gMonFrontPic_Cloyster[];
extern const u8 gMonPalette_Cloyster[];
extern const u8 gMonBackPic_Cloyster[];
extern const u8 gMonShinyPalette_Cloyster[];
extern const u8 gMonIcon_Cloyster[];
extern const u8 gMonFootprint_Cloyster[];
extern const u8 gMonFrontPic_Gastly[];
extern const u8 gMonPalette_Gastly[];
extern const u8 gMonBackPic_Gastly[];
extern const u8 gMonShinyPalette_Gastly[];
extern const u8 gMonIcon_Gastly[];
extern const u8 gMonFootprint_Gastly[];
extern const u8 gMonFrontPic_Haunter[];
extern const u8 gMonPalette_Haunter[];
extern const u8 gMonBackPic_Haunter[];
extern const u8 gMonShinyPalette_Haunter[];
extern const u8 gMonIcon_Haunter[];
extern const u8 gMonFootprint_Haunter[];
extern const u8 gMonFrontPic_Gengar[];
extern const u8 gMonPalette_Gengar[];
extern const u8 gMonBackPic_Gengar[];
extern const u8 gMonShinyPalette_Gengar[];
extern const u8 gMonIcon_Gengar[];
extern const u8 gMonFootprint_Gengar[];
extern const u8 gMonFrontPic_Onix[];
extern const u8 gMonPalette_Onix[];
extern const u8 gMonBackPic_Onix[];
extern const u8 gMonShinyPalette_Onix[];
extern const u8 gMonIcon_Onix[];
extern const u8 gMonFootprint_Onix[];
extern const u8 gMonFrontPic_Drowzee[];
extern const u8 gMonPalette_Drowzee[];
extern const u8 gMonBackPic_Drowzee[];
extern const u8 gMonShinyPalette_Drowzee[];
extern const u8 gMonIcon_Drowzee[];
extern const u8 gMonFootprint_Drowzee[];
extern const u8 gMonFrontPic_Hypno[];
extern const u8 gMonPalette_Hypno[];
extern const u8 gMonBackPic_Hypno[];
extern const u8 gMonShinyPalette_Hypno[];
extern const u8 gMonIcon_Hypno[];
extern const u8 gMonFootprint_Hypno[];
extern const u8 gMonFrontPic_Krabby[];
extern const u8 gMonPalette_Krabby[];
extern const u8 gMonBackPic_Krabby[];
extern const u8 gMonShinyPalette_Krabby[];
extern const u8 gMonIcon_Krabby[];
extern const u8 gMonFootprint_Krabby[];
extern const u8 gMonFrontPic_Kingler[];
extern const u8 gMonPalette_Kingler[];
extern const u8 gMonBackPic_Kingler[];
extern const u8 gMonShinyPalette_Kingler[];
extern const u8 gMonIcon_Kingler[];
extern const u8 gMonFootprint_Kingler[];
extern const u8 gMonFrontPic_Voltorb[];
extern const u8 gMonPalette_Voltorb[];
extern const u8 gMonBackPic_Voltorb[];
extern const u8 gMonShinyPalette_Voltorb[];
extern const u8 gMonIcon_Voltorb[];
extern const u8 gMonFootprint_Voltorb[];
extern const u8 gMonFrontPic_Electrode[];
extern const u8 gMonPalette_Electrode[];
extern const u8 gMonBackPic_Electrode[];
extern const u8 gMonShinyPalette_Electrode[];
extern const u8 gMonIcon_Electrode[];
extern const u8 gMonFootprint_Electrode[];
extern const u8 gMonFrontPic_Exeggcute[];
extern const u8 gMonPalette_Exeggcute[];
extern const u8 gMonBackPic_Exeggcute[];
extern const u8 gMonShinyPalette_Exeggcute[];
extern const u8 gMonIcon_Exeggcute[];
extern const u8 gMonFootprint_Exeggcute[];
extern const u8 gMonFrontPic_Exeggutor[];
extern const u8 gMonPalette_Exeggutor[];
extern const u8 gMonBackPic_Exeggutor[];
extern const u8 gMonShinyPalette_Exeggutor[];
extern const u8 gMonIcon_Exeggutor[];
extern const u8 gMonFootprint_Exeggutor[];
extern const u8 gMonFrontPic_Cubone[];
extern const u8 gMonPalette_Cubone[];
extern const u8 gMonBackPic_Cubone[];
extern const u8 gMonShinyPalette_Cubone[];
extern const u8 gMonIcon_Cubone[];
extern const u8 gMonFootprint_Cubone[];
extern const u8 gMonFrontPic_Marowak[];
extern const u8 gMonPalette_Marowak[];
extern const u8 gMonBackPic_Marowak[];
extern const u8 gMonShinyPalette_Marowak[];
extern const u8 gMonIcon_Marowak[];
extern const u8 gMonFootprint_Marowak[];
extern const u8 gMonFrontPic_Hitmonlee[];
extern const u8 gMonPalette_Hitmonlee[];
extern const u8 gMonBackPic_Hitmonlee[];
extern const u8 gMonShinyPalette_Hitmonlee[];
extern const u8 gMonIcon_Hitmonlee[];
extern const u8 gMonFootprint_Hitmonlee[];
extern const u8 gMonFrontPic_Hitmonchan[];
extern const u8 gMonPalette_Hitmonchan[];
extern const u8 gMonBackPic_Hitmonchan[];
extern const u8 gMonShinyPalette_Hitmonchan[];
extern const u8 gMonIcon_Hitmonchan[];
extern const u8 gMonFootprint_Hitmonchan[];
extern const u8 gMonFrontPic_Lickitung[];
extern const u8 gMonPalette_Lickitung[];
extern const u8 gMonBackPic_Lickitung[];
extern const u8 gMonShinyPalette_Lickitung[];
extern const u8 gMonIcon_Lickitung[];
extern const u8 gMonFootprint_Lickitung[];
extern const u8 gMonFrontPic_Koffing[];
extern const u8 gMonPalette_Koffing[];
extern const u8 gMonBackPic_Koffing[];
extern const u8 gMonShinyPalette_Koffing[];
extern const u8 gMonIcon_Koffing[];
extern const u8 gMonFootprint_Koffing[];
extern const u8 gMonFrontPic_Weezing[];
extern const u8 gMonPalette_Weezing[];
extern const u8 gMonBackPic_Weezing[];
extern const u8 gMonShinyPalette_Weezing[];
extern const u8 gMonIcon_Weezing[];
extern const u8 gMonFootprint_Weezing[];
extern const u8 gMonFrontPic_Rhyhorn[];
extern const u8 gMonPalette_Rhyhorn[];
extern const u8 gMonBackPic_Rhyhorn[];
extern const u8 gMonShinyPalette_Rhyhorn[];
extern const u8 gMonIcon_Rhyhorn[];
extern const u8 gMonFootprint_Rhyhorn[];
extern const u8 gMonFrontPic_Rhydon[];
extern const u8 gMonPalette_Rhydon[];
extern const u8 gMonBackPic_Rhydon[];
extern const u8 gMonShinyPalette_Rhydon[];
extern const u8 gMonIcon_Rhydon[];
extern const u8 gMonFootprint_Rhydon[];
extern const u8 gMonFrontPic_Chansey[];
extern const u8 gMonPalette_Chansey[];
extern const u8 gMonBackPic_Chansey[];
extern const u8 gMonShinyPalette_Chansey[];
extern const u8 gMonIcon_Chansey[];
extern const u8 gMonFootprint_Chansey[];
extern const u8 gMonFrontPic_Tangela[];
extern const u8 gMonPalette_Tangela[];
extern const u8 gMonBackPic_Tangela[];
extern const u8 gMonShinyPalette_Tangela[];
extern const u8 gMonIcon_Tangela[];
extern const u8 gMonFootprint_Tangela[];
extern const u8 gMonFrontPic_Kangaskhan[];
extern const u8 gMonPalette_Kangaskhan[];
extern const u8 gMonBackPic_Kangaskhan[];
extern const u8 gMonShinyPalette_Kangaskhan[];
extern const u8 gMonIcon_Kangaskhan[];
extern const u8 gMonFootprint_Kangaskhan[];
extern const u8 gMonFrontPic_Horsea[];
extern const u8 gMonPalette_Horsea[];
extern const u8 gMonBackPic_Horsea[];
extern const u8 gMonShinyPalette_Horsea[];
extern const u8 gMonIcon_Horsea[];
extern const u8 gMonFootprint_Horsea[];
extern const u8 gMonFrontPic_Seadra[];
extern const u8 gMonPalette_Seadra[];
extern const u8 gMonBackPic_Seadra[];
extern const u8 gMonShinyPalette_Seadra[];
extern const u8 gMonIcon_Seadra[];
extern const u8 gMonFootprint_Seadra[];
extern const u8 gMonFrontPic_Goldeen[];
extern const u8 gMonPalette_Goldeen[];
extern const u8 gMonBackPic_Goldeen[];
extern const u8 gMonShinyPalette_Goldeen[];
extern const u8 gMonIcon_Goldeen[];
extern const u8 gMonFootprint_Goldeen[];
extern const u8 gMonFrontPic_Seaking[];
extern const u8 gMonPalette_Seaking[];
extern const u8 gMonBackPic_Seaking[];
extern const u8 gMonShinyPalette_Seaking[];
extern const u8 gMonIcon_Seaking[];
extern const u8 gMonFootprint_Seaking[];
extern const u8 gMonFrontPic_Staryu[];
extern const u8 gMonPalette_Staryu[];
extern const u8 gMonBackPic_Staryu[];
extern const u8 gMonShinyPalette_Staryu[];
extern const u8 gMonIcon_Staryu[];
extern const u8 gMonFootprint_Staryu[];
extern const u8 gMonFrontPic_Starmie[];
extern const u8 gMonPalette_Starmie[];
extern const u8 gMonBackPic_Starmie[];
extern const u8 gMonShinyPalette_Starmie[];
extern const u8 gMonIcon_Starmie[];
extern const u8 gMonFootprint_Starmie[];
extern const u8 gMonFrontPic_Mrmime[];
extern const u8 gMonPalette_Mrmime[];
extern const u8 gMonBackPic_Mrmime[];
extern const u8 gMonShinyPalette_Mrmime[];
extern const u8 gMonIcon_Mrmime[];
extern const u8 gMonFootprint_Mrmime[];
extern const u8 gMonFrontPic_Scyther[];
extern const u8 gMonPalette_Scyther[];
extern const u8 gMonBackPic_Scyther[];
extern const u8 gMonShinyPalette_Scyther[];
extern const u8 gMonIcon_Scyther[];
extern const u8 gMonFootprint_Scyther[];
extern const u8 gMonFrontPic_Jynx[];
extern const u8 gMonPalette_Jynx[];
extern const u8 gMonBackPic_Jynx[];
extern const u8 gMonShinyPalette_Jynx[];
extern const u8 gMonIcon_Jynx[];
extern const u8 gMonFootprint_Jynx[];
extern const u8 gMonFrontPic_Electabuzz[];
extern const u8 gMonPalette_Electabuzz[];
extern const u8 gMonBackPic_Electabuzz[];
extern const u8 gMonShinyPalette_Electabuzz[];
extern const u8 gMonIcon_Electabuzz[];
extern const u8 gMonFootprint_Electabuzz[];
extern const u8 gMonFrontPic_Magmar[];
extern const u8 gMonPalette_Magmar[];
extern const u8 gMonBackPic_Magmar[];
extern const u8 gMonShinyPalette_Magmar[];
extern const u8 gMonIcon_Magmar[];
extern const u8 gMonFootprint_Magmar[];
extern const u8 gMonFrontPic_Pinsir[];
extern const u8 gMonPalette_Pinsir[];
extern const u8 gMonBackPic_Pinsir[];
extern const u8 gMonShinyPalette_Pinsir[];
extern const u8 gMonIcon_Pinsir[];
extern const u8 gMonFootprint_Pinsir[];
extern const u8 gMonFrontPic_Tauros[];
extern const u8 gMonPalette_Tauros[];
extern const u8 gMonBackPic_Tauros[];
extern const u8 gMonShinyPalette_Tauros[];
extern const u8 gMonIcon_Tauros[];
extern const u8 gMonFootprint_Tauros[];
extern const u8 gMonFrontPic_Magikarp[];
extern const u8 gMonPalette_Magikarp[];
extern const u8 gMonBackPic_Magikarp[];
extern const u8 gMonShinyPalette_Magikarp[];
extern const u8 gMonIcon_Magikarp[];
extern const u8 gMonFootprint_Magikarp[];
extern const u8 gMonFrontPic_Gyarados[];
extern const u8 gMonPalette_Gyarados[];
extern const u8 gMonBackPic_Gyarados[];
extern const u8 gMonShinyPalette_Gyarados[];
extern const u8 gMonIcon_Gyarados[];
extern const u8 gMonFootprint_Gyarados[];
extern const u8 gMonFrontPic_Lapras[];
extern const u8 gMonPalette_Lapras[];
extern const u8 gMonBackPic_Lapras[];
extern const u8 gMonShinyPalette_Lapras[];
extern const u8 gMonIcon_Lapras[];
extern const u8 gMonFootprint_Lapras[];
extern const u8 gMonFrontPic_Ditto[];
extern const u8 gMonPalette_Ditto[];
extern const u8 gMonBackPic_Ditto[];
extern const u8 gMonShinyPalette_Ditto[];
extern const u8 gMonIcon_Ditto[];
extern const u8 gMonFootprint_Ditto[];
extern const u8 gMonFrontPic_Eevee[];
extern const u8 gMonPalette_Eevee[];
extern const u8 gMonBackPic_Eevee[];
extern const u8 gMonShinyPalette_Eevee[];
extern const u8 gMonIcon_Eevee[];
extern const u8 gMonFootprint_Eevee[];
extern const u8 gMonFrontPic_Vaporeon[];
extern const u8 gMonPalette_Vaporeon[];
extern const u8 gMonBackPic_Vaporeon[];
extern const u8 gMonShinyPalette_Vaporeon[];
extern const u8 gMonIcon_Vaporeon[];
extern const u8 gMonFootprint_Vaporeon[];
extern const u8 gMonFrontPic_Jolteon[];
extern const u8 gMonPalette_Jolteon[];
extern const u8 gMonBackPic_Jolteon[];
extern const u8 gMonShinyPalette_Jolteon[];
extern const u8 gMonIcon_Jolteon[];
extern const u8 gMonFootprint_Jolteon[];
extern const u8 gMonFrontPic_Flareon[];
extern const u8 gMonPalette_Flareon[];
extern const u8 gMonBackPic_Flareon[];
extern const u8 gMonShinyPalette_Flareon[];
extern const u8 gMonIcon_Flareon[];
extern const u8 gMonFootprint_Flareon[];
extern const u8 gMonFrontPic_Porygon[];
extern const u8 gMonPalette_Porygon[];
extern const u8 gMonBackPic_Porygon[];
extern const u8 gMonShinyPalette_Porygon[];
extern const u8 gMonIcon_Porygon[];
extern const u8 gMonFootprint_Porygon[];
extern const u8 gMonFrontPic_Omanyte[];
extern const u8 gMonPalette_Omanyte[];
extern const u8 gMonBackPic_Omanyte[];
extern const u8 gMonShinyPalette_Omanyte[];
extern const u8 gMonIcon_Omanyte[];
extern const u8 gMonFootprint_Omanyte[];
extern const u8 gMonFrontPic_Omastar[];
extern const u8 gMonPalette_Omastar[];
extern const u8 gMonBackPic_Omastar[];
extern const u8 gMonShinyPalette_Omastar[];
extern const u8 gMonIcon_Omastar[];
extern const u8 gMonFootprint_Omastar[];
extern const u8 gMonFrontPic_Kabuto[];
extern const u8 gMonPalette_Kabuto[];
extern const u8 gMonBackPic_Kabuto[];
extern const u8 gMonShinyPalette_Kabuto[];
extern const u8 gMonIcon_Kabuto[];
extern const u8 gMonFootprint_Kabuto[];
extern const u8 gMonFrontPic_Kabutops[];
extern const u8 gMonPalette_Kabutops[];
extern const u8 gMonBackPic_Kabutops[];
extern const u8 gMonShinyPalette_Kabutops[];
extern const u8 gMonIcon_Kabutops[];
extern const u8 gMonFootprint_Kabutops[];
extern const u8 gMonFrontPic_Aerodactyl[];
extern const u8 gMonPalette_Aerodactyl[];
extern const u8 gMonBackPic_Aerodactyl[];
extern const u8 gMonShinyPalette_Aerodactyl[];
extern const u8 gMonIcon_Aerodactyl[];
extern const u8 gMonFootprint_Aerodactyl[];
extern const u8 gMonFrontPic_Snorlax[];
extern const u8 gMonPalette_Snorlax[];
extern const u8 gMonBackPic_Snorlax[];
extern const u8 gMonShinyPalette_Snorlax[];
extern const u8 gMonIcon_Snorlax[];
extern const u8 gMonFootprint_Snorlax[];
extern const u8 gMonFrontPic_Articuno[];
extern const u8 gMonPalette_Articuno[];
extern const u8 gMonBackPic_Articuno[];
extern const u8 gMonShinyPalette_Articuno[];
extern const u8 gMonIcon_Articuno[];
extern const u8 gMonFootprint_Articuno[];
extern const u8 gMonFrontPic_Zapdos[];
extern const u8 gMonPalette_Zapdos[];
extern const u8 gMonBackPic_Zapdos[];
extern const u8 gMonShinyPalette_Zapdos[];
extern const u8 gMonIcon_Zapdos[];
extern const u8 gMonFootprint_Zapdos[];
extern const u8 gMonFrontPic_Moltres[];
extern const u8 gMonPalette_Moltres[];
extern const u8 gMonBackPic_Moltres[];
extern const u8 gMonShinyPalette_Moltres[];
extern const u8 gMonIcon_Moltres[];
extern const u8 gMonFootprint_Moltres[];
extern const u8 gMonFrontPic_Dratini[];
extern const u8 gMonPalette_Dratini[];
extern const u8 gMonBackPic_Dratini[];
extern const u8 gMonShinyPalette_Dratini[];
extern const u8 gMonIcon_Dratini[];
extern const u8 gMonFootprint_Dratini[];
extern const u8 gMonFrontPic_Dragonair[];
extern const u8 gMonPalette_Dragonair[];
extern const u8 gMonBackPic_Dragonair[];
extern const u8 gMonShinyPalette_Dragonair[];
extern const u8 gMonIcon_Dragonair[];
extern const u8 gMonFootprint_Dragonair[];
extern const u8 gMonFrontPic_Dragonite[];
extern const u8 gMonPalette_Dragonite[];
extern const u8 gMonBackPic_Dragonite[];
extern const u8 gMonShinyPalette_Dragonite[];
extern const u8 gMonIcon_Dragonite[];
extern const u8 gMonFootprint_Dragonite[];
extern const u8 gMonFrontPic_Mewtwo[];
extern const u8 gMonPalette_Mewtwo[];
extern const u8 gMonBackPic_Mewtwo[];
extern const u8 gMonShinyPalette_Mewtwo[];
extern const u8 gMonIcon_Mewtwo[];
extern const u8 gMonFootprint_Mewtwo[];
extern const u8 gMonFrontPic_Mew[];
extern const u8 gMonPalette_Mew[];
extern const u8 gMonBackPic_Mew[];
extern const u8 gMonShinyPalette_Mew[];
extern const u8 gMonIcon_Mew[];
extern const u8 gMonFootprint_Mew[];
extern const u8 gMonFrontPic_Chikorita[];
extern const u8 gMonPalette_Chikorita[];
extern const u8 gMonBackPic_Chikorita[];
extern const u8 gMonShinyPalette_Chikorita[];
extern const u8 gMonIcon_Chikorita[];
extern const u8 gMonFootprint_Chikorita[];
extern const u8 gMonFrontPic_Bayleef[];
extern const u8 gMonPalette_Bayleef[];
extern const u8 gMonBackPic_Bayleef[];
extern const u8 gMonShinyPalette_Bayleef[];
extern const u8 gMonIcon_Bayleef[];
extern const u8 gMonFootprint_Bayleef[];
extern const u8 gMonFrontPic_Meganium[];
extern const u8 gMonPalette_Meganium[];
extern const u8 gMonBackPic_Meganium[];
extern const u8 gMonShinyPalette_Meganium[];
extern const u8 gMonIcon_Meganium[];
extern const u8 gMonFootprint_Meganium[];
extern const u8 gMonFrontPic_Cyndaquil[];
extern const u8 gMonPalette_Cyndaquil[];
extern const u8 gMonBackPic_Cyndaquil[];
extern const u8 gMonShinyPalette_Cyndaquil[];
extern const u8 gMonIcon_Cyndaquil[];
extern const u8 gMonFootprint_Cyndaquil[];
extern const u8 gMonFrontPic_Quilava[];
extern const u8 gMonPalette_Quilava[];
extern const u8 gMonBackPic_Quilava[];
extern const u8 gMonShinyPalette_Quilava[];
extern const u8 gMonIcon_Quilava[];
extern const u8 gMonFootprint_Quilava[];
extern const u8 gMonFrontPic_Typhlosion[];
extern const u8 gMonPalette_Typhlosion[];
extern const u8 gMonBackPic_Typhlosion[];
extern const u8 gMonShinyPalette_Typhlosion[];
extern const u8 gMonIcon_Typhlosion[];
extern const u8 gMonFootprint_Typhlosion[];
extern const u8 gMonFrontPic_Totodile[];
extern const u8 gMonPalette_Totodile[];
extern const u8 gMonBackPic_Totodile[];
extern const u8 gMonShinyPalette_Totodile[];
extern const u8 gMonIcon_Totodile[];
extern const u8 gMonFootprint_Totodile[];
extern const u8 gMonFrontPic_Croconaw[];
extern const u8 gMonPalette_Croconaw[];
extern const u8 gMonBackPic_Croconaw[];
extern const u8 gMonShinyPalette_Croconaw[];
extern const u8 gMonIcon_Croconaw[];
extern const u8 gMonFootprint_Croconaw[];
extern const u8 gMonFrontPic_Feraligatr[];
extern const u8 gMonPalette_Feraligatr[];
extern const u8 gMonBackPic_Feraligatr[];
extern const u8 gMonShinyPalette_Feraligatr[];
extern const u8 gMonIcon_Feraligatr[];
extern const u8 gMonFootprint_Feraligatr[];
extern const u8 gMonFrontPic_Sentret[];
extern const u8 gMonPalette_Sentret[];
extern const u8 gMonBackPic_Sentret[];
extern const u8 gMonShinyPalette_Sentret[];
extern const u8 gMonIcon_Sentret[];
extern const u8 gMonFootprint_Sentret[];
extern const u8 gMonFrontPic_Furret[];
extern const u8 gMonPalette_Furret[];
extern const u8 gMonBackPic_Furret[];
extern const u8 gMonShinyPalette_Furret[];
extern const u8 gMonIcon_Furret[];
extern const u8 gMonFootprint_Furret[];
extern const u8 gMonFrontPic_Hoothoot[];
extern const u8 gMonPalette_Hoothoot[];
extern const u8 gMonBackPic_Hoothoot[];
extern const u8 gMonShinyPalette_Hoothoot[];
extern const u8 gMonIcon_Hoothoot[];
extern const u8 gMonFootprint_Hoothoot[];
extern const u8 gMonFrontPic_Noctowl[];
extern const u8 gMonPalette_Noctowl[];
extern const u8 gMonBackPic_Noctowl[];
extern const u8 gMonShinyPalette_Noctowl[];
extern const u8 gMonIcon_Noctowl[];
extern const u8 gMonFootprint_Noctowl[];
extern const u8 gMonFrontPic_Ledyba[];
extern const u8 gMonPalette_Ledyba[];
extern const u8 gMonBackPic_Ledyba[];
extern const u8 gMonShinyPalette_Ledyba[];
extern const u8 gMonIcon_Ledyba[];
extern const u8 gMonFootprint_Ledyba[];
extern const u8 gMonFrontPic_Ledian[];
extern const u8 gMonPalette_Ledian[];
extern const u8 gMonBackPic_Ledian[];
extern const u8 gMonShinyPalette_Ledian[];
extern const u8 gMonIcon_Ledian[];
extern const u8 gMonFootprint_Ledian[];
extern const u8 gMonFrontPic_Spinarak[];
extern const u8 gMonPalette_Spinarak[];
extern const u8 gMonBackPic_Spinarak[];
extern const u8 gMonShinyPalette_Spinarak[];
extern const u8 gMonIcon_Spinarak[];
extern const u8 gMonFootprint_Spinarak[];
extern const u8 gMonFrontPic_Ariados[];
extern const u8 gMonPalette_Ariados[];
extern const u8 gMonBackPic_Ariados[];
extern const u8 gMonShinyPalette_Ariados[];
extern const u8 gMonIcon_Ariados[];
extern const u8 gMonFootprint_Ariados[];
extern const u8 gMonFrontPic_Crobat[];
extern const u8 gMonPalette_Crobat[];
extern const u8 gMonBackPic_Crobat[];
extern const u8 gMonShinyPalette_Crobat[];
extern const u8 gMonIcon_Crobat[];
extern const u8 gMonFootprint_Crobat[];
extern const u8 gMonFrontPic_Chinchou[];
extern const u8 gMonPalette_Chinchou[];
extern const u8 gMonBackPic_Chinchou[];
extern const u8 gMonShinyPalette_Chinchou[];
extern const u8 gMonIcon_Chinchou[];
extern const u8 gMonFootprint_Chinchou[];
extern const u8 gMonFrontPic_Lanturn[];
extern const u8 gMonPalette_Lanturn[];
extern const u8 gMonBackPic_Lanturn[];
extern const u8 gMonShinyPalette_Lanturn[];
extern const u8 gMonIcon_Lanturn[];
extern const u8 gMonFootprint_Lanturn[];
extern const u8 gMonFrontPic_Pichu[];
extern const u8 gMonPalette_Pichu[];
extern const u8 gMonBackPic_Pichu[];
extern const u8 gMonShinyPalette_Pichu[];
extern const u8 gMonIcon_Pichu[];
extern const u8 gMonFootprint_Pichu[];
extern const u8 gMonFrontPic_Cleffa[];
extern const u8 gMonPalette_Cleffa[];
extern const u8 gMonBackPic_Cleffa[];
extern const u8 gMonShinyPalette_Cleffa[];
extern const u8 gMonIcon_Cleffa[];
extern const u8 gMonFootprint_Cleffa[];
extern const u8 gMonFrontPic_Igglybuff[];
extern const u8 gMonPalette_Igglybuff[];
extern const u8 gMonBackPic_Igglybuff[];
extern const u8 gMonShinyPalette_Igglybuff[];
extern const u8 gMonIcon_Igglybuff[];
extern const u8 gMonFootprint_Igglybuff[];
extern const u8 gMonFrontPic_Togepi[];
extern const u8 gMonPalette_Togepi[];
extern const u8 gMonBackPic_Togepi[];
extern const u8 gMonShinyPalette_Togepi[];
extern const u8 gMonIcon_Togepi[];
extern const u8 gMonFootprint_Togepi[];
extern const u8 gMonFrontPic_Togetic[];
extern const u8 gMonPalette_Togetic[];
extern const u8 gMonBackPic_Togetic[];
extern const u8 gMonShinyPalette_Togetic[];
extern const u8 gMonIcon_Togetic[];
extern const u8 gMonFootprint_Togetic[];
extern const u8 gMonFrontPic_Natu[];
extern const u8 gMonPalette_Natu[];
extern const u8 gMonBackPic_Natu[];
extern const u8 gMonShinyPalette_Natu[];
extern const u8 gMonIcon_Natu[];
extern const u8 gMonFootprint_Natu[];
extern const u8 gMonFrontPic_Xatu[];
extern const u8 gMonPalette_Xatu[];
extern const u8 gMonBackPic_Xatu[];
extern const u8 gMonShinyPalette_Xatu[];
extern const u8 gMonIcon_Xatu[];
extern const u8 gMonFootprint_Xatu[];
extern const u8 gMonFrontPic_Mareep[];
extern const u8 gMonPalette_Mareep[];
extern const u8 gMonBackPic_Mareep[];
extern const u8 gMonShinyPalette_Mareep[];
extern const u8 gMonIcon_Mareep[];
extern const u8 gMonFootprint_Mareep[];
extern const u8 gMonFrontPic_Flaaffy[];
extern const u8 gMonPalette_Flaaffy[];
extern const u8 gMonBackPic_Flaaffy[];
extern const u8 gMonShinyPalette_Flaaffy[];
extern const u8 gMonIcon_Flaaffy[];
extern const u8 gMonFootprint_Flaaffy[];
extern const u8 gMonFrontPic_Ampharos[];
extern const u8 gMonPalette_Ampharos[];
extern const u8 gMonBackPic_Ampharos[];
extern const u8 gMonShinyPalette_Ampharos[];
extern const u8 gMonIcon_Ampharos[];
extern const u8 gMonFootprint_Ampharos[];
extern const u8 gMonFrontPic_Bellossom[];
extern const u8 gMonPalette_Bellossom[];
extern const u8 gMonBackPic_Bellossom[];
extern const u8 gMonShinyPalette_Bellossom[];
extern const u8 gMonIcon_Bellossom[];
extern const u8 gMonFootprint_Bellossom[];
extern const u8 gMonFrontPic_Marill[];
extern const u8 gMonPalette_Marill[];
extern const u8 gMonBackPic_Marill[];
extern const u8 gMonShinyPalette_Marill[];
extern const u8 gMonIcon_Marill[];
extern const u8 gMonFootprint_Marill[];
extern const u8 gMonFrontPic_Azumarill[];
extern const u8 gMonPalette_Azumarill[];
extern const u8 gMonBackPic_Azumarill[];
extern const u8 gMonShinyPalette_Azumarill[];
extern const u8 gMonIcon_Azumarill[];
extern const u8 gMonFootprint_Azumarill[];
extern const u8 gMonFrontPic_Sudowoodo[];
extern const u8 gMonPalette_Sudowoodo[];
extern const u8 gMonBackPic_Sudowoodo[];
extern const u8 gMonShinyPalette_Sudowoodo[];
extern const u8 gMonIcon_Sudowoodo[];
extern const u8 gMonFootprint_Sudowoodo[];
extern const u8 gMonFrontPic_Politoed[];
extern const u8 gMonPalette_Politoed[];
extern const u8 gMonBackPic_Politoed[];
extern const u8 gMonShinyPalette_Politoed[];
extern const u8 gMonIcon_Politoed[];
extern const u8 gMonFootprint_Politoed[];
extern const u8 gMonFrontPic_Hoppip[];
extern const u8 gMonPalette_Hoppip[];
extern const u8 gMonBackPic_Hoppip[];
extern const u8 gMonShinyPalette_Hoppip[];
extern const u8 gMonIcon_Hoppip[];
extern const u8 gMonFootprint_Hoppip[];
extern const u8 gMonFrontPic_Skiploom[];
extern const u8 gMonPalette_Skiploom[];
extern const u8 gMonBackPic_Skiploom[];
extern const u8 gMonShinyPalette_Skiploom[];
extern const u8 gMonIcon_Skiploom[];
extern const u8 gMonFootprint_Skiploom[];
extern const u8 gMonFrontPic_Jumpluff[];
extern const u8 gMonPalette_Jumpluff[];
extern const u8 gMonBackPic_Jumpluff[];
extern const u8 gMonShinyPalette_Jumpluff[];
extern const u8 gMonIcon_Jumpluff[];
extern const u8 gMonFootprint_Jumpluff[];
extern const u8 gMonFrontPic_Aipom[];
extern const u8 gMonPalette_Aipom[];
extern const u8 gMonBackPic_Aipom[];
extern const u8 gMonShinyPalette_Aipom[];
extern const u8 gMonIcon_Aipom[];
extern const u8 gMonFootprint_Aipom[];
extern const u8 gMonFrontPic_Sunkern[];
extern const u8 gMonPalette_Sunkern[];
extern const u8 gMonBackPic_Sunkern[];
extern const u8 gMonShinyPalette_Sunkern[];
extern const u8 gMonIcon_Sunkern[];
extern const u8 gMonFootprint_Sunkern[];
extern const u8 gMonFrontPic_Sunflora[];
extern const u8 gMonPalette_Sunflora[];
extern const u8 gMonBackPic_Sunflora[];
extern const u8 gMonShinyPalette_Sunflora[];
extern const u8 gMonIcon_Sunflora[];
extern const u8 gMonFootprint_Sunflora[];
extern const u8 gMonFrontPic_Yanma[];
extern const u8 gMonPalette_Yanma[];
extern const u8 gMonBackPic_Yanma[];
extern const u8 gMonShinyPalette_Yanma[];
extern const u8 gMonIcon_Yanma[];
extern const u8 gMonFootprint_Yanma[];
extern const u8 gMonFrontPic_Wooper[];
extern const u8 gMonPalette_Wooper[];
extern const u8 gMonBackPic_Wooper[];
extern const u8 gMonShinyPalette_Wooper[];
extern const u8 gMonIcon_Wooper[];
extern const u8 gMonFootprint_Wooper[];
extern const u8 gMonFrontPic_Quagsire[];
extern const u8 gMonPalette_Quagsire[];
extern const u8 gMonBackPic_Quagsire[];
extern const u8 gMonShinyPalette_Quagsire[];
extern const u8 gMonIcon_Quagsire[];
extern const u8 gMonFootprint_Quagsire[];
extern const u8 gMonFrontPic_Espeon[];
extern const u8 gMonPalette_Espeon[];
extern const u8 gMonBackPic_Espeon[];
extern const u8 gMonShinyPalette_Espeon[];
extern const u8 gMonIcon_Espeon[];
extern const u8 gMonFootprint_Espeon[];
extern const u8 gMonFrontPic_Umbreon[];
extern const u8 gMonPalette_Umbreon[];
extern const u8 gMonBackPic_Umbreon[];
extern const u8 gMonShinyPalette_Umbreon[];
extern const u8 gMonIcon_Umbreon[];
extern const u8 gMonFootprint_Umbreon[];
extern const u8 gMonFrontPic_Murkrow[];
extern const u8 gMonPalette_Murkrow[];
extern const u8 gMonBackPic_Murkrow[];
extern const u8 gMonShinyPalette_Murkrow[];
extern const u8 gMonIcon_Murkrow[];
extern const u8 gMonFootprint_Murkrow[];
extern const u8 gMonFrontPic_Slowking[];
extern const u8 gMonPalette_Slowking[];
extern const u8 gMonBackPic_Slowking[];
extern const u8 gMonShinyPalette_Slowking[];
extern const u8 gMonIcon_Slowking[];
extern const u8 gMonFootprint_Slowking[];
extern const u8 gMonFrontPic_Misdreavus[];
extern const u8 gMonPalette_Misdreavus[];
extern const u8 gMonBackPic_Misdreavus[];
extern const u8 gMonShinyPalette_Misdreavus[];
extern const u8 gMonIcon_Misdreavus[];
extern const u8 gMonFootprint_Misdreavus[];
extern const u8 gMonFrontPic_UnownA[];
extern const u8 gMonPalette_Unown[];
extern const u8 gMonBackPic_UnownA[];
extern const u8 gMonShinyPalette_Unown[];
extern const u8 gMonIcon_UnownA[];
extern const u8 gMonFootprint_Unown[];
extern const u8 gMonFrontPic_Wobbuffet[];
extern const u8 gMonPalette_Wobbuffet[];
extern const u8 gMonBackPic_Wobbuffet[];
extern const u8 gMonShinyPalette_Wobbuffet[];
extern const u8 gMonIcon_Wobbuffet[];
extern const u8 gMonFootprint_Wobbuffet[];
extern const u8 gMonFrontPic_Girafarig[];
extern const u8 gMonPalette_Girafarig[];
extern const u8 gMonBackPic_Girafarig[];
extern const u8 gMonShinyPalette_Girafarig[];
extern const u8 gMonIcon_Girafarig[];
extern const u8 gMonFootprint_Girafarig[];
extern const u8 gMonFrontPic_Pineco[];
extern const u8 gMonPalette_Pineco[];
extern const u8 gMonBackPic_Pineco[];
extern const u8 gMonShinyPalette_Pineco[];
extern const u8 gMonIcon_Pineco[];
extern const u8 gMonFootprint_Pineco[];
extern const u8 gMonFrontPic_Forretress[];
extern const u8 gMonPalette_Forretress[];
extern const u8 gMonBackPic_Forretress[];
extern const u8 gMonShinyPalette_Forretress[];
extern const u8 gMonIcon_Forretress[];
extern const u8 gMonFootprint_Forretress[];
extern const u8 gMonFrontPic_Dunsparce[];
extern const u8 gMonPalette_Dunsparce[];
extern const u8 gMonBackPic_Dunsparce[];
extern const u8 gMonShinyPalette_Dunsparce[];
extern const u8 gMonIcon_Dunsparce[];
extern const u8 gMonFootprint_Dunsparce[];
extern const u8 gMonFrontPic_Gligar[];
extern const u8 gMonPalette_Gligar[];
extern const u8 gMonBackPic_Gligar[];
extern const u8 gMonShinyPalette_Gligar[];
extern const u8 gMonIcon_Gligar[];
extern const u8 gMonFootprint_Gligar[];
extern const u8 gMonFrontPic_Steelix[];
extern const u8 gMonPalette_Steelix[];
extern const u8 gMonBackPic_Steelix[];
extern const u8 gMonShinyPalette_Steelix[];
extern const u8 gMonIcon_Steelix[];
extern const u8 gMonFootprint_Steelix[];
extern const u8 gMonFrontPic_Snubbull[];
extern const u8 gMonPalette_Snubbull[];
extern const u8 gMonBackPic_Snubbull[];
extern const u8 gMonShinyPalette_Snubbull[];
extern const u8 gMonIcon_Snubbull[];
extern const u8 gMonFootprint_Snubbull[];
extern const u8 gMonFrontPic_Granbull[];
extern const u8 gMonPalette_Granbull[];
extern const u8 gMonBackPic_Granbull[];
extern const u8 gMonShinyPalette_Granbull[];
extern const u8 gMonIcon_Granbull[];
extern const u8 gMonFootprint_Granbull[];
extern const u8 gMonFrontPic_Qwilfish[];
extern const u8 gMonPalette_Qwilfish[];
extern const u8 gMonBackPic_Qwilfish[];
extern const u8 gMonShinyPalette_Qwilfish[];
extern const u8 gMonIcon_Qwilfish[];
extern const u8 gMonFootprint_Qwilfish[];
extern const u8 gMonFrontPic_Scizor[];
extern const u8 gMonPalette_Scizor[];
extern const u8 gMonBackPic_Scizor[];
extern const u8 gMonShinyPalette_Scizor[];
extern const u8 gMonIcon_Scizor[];
extern const u8 gMonFootprint_Scizor[];
extern const u8 gMonFrontPic_Shuckle[];
extern const u8 gMonPalette_Shuckle[];
extern const u8 gMonBackPic_Shuckle[];
extern const u8 gMonShinyPalette_Shuckle[];
extern const u8 gMonIcon_Shuckle[];
extern const u8 gMonFootprint_Shuckle[];
extern const u8 gMonFrontPic_Heracross[];
extern const u8 gMonPalette_Heracross[];
extern const u8 gMonBackPic_Heracross[];
extern const u8 gMonShinyPalette_Heracross[];
extern const u8 gMonIcon_Heracross[];
extern const u8 gMonFootprint_Heracross[];
extern const u8 gMonFrontPic_Sneasel[];
extern const u8 gMonPalette_Sneasel[];
extern const u8 gMonBackPic_Sneasel[];
extern const u8 gMonShinyPalette_Sneasel[];
extern const u8 gMonIcon_Sneasel[];
extern const u8 gMonFootprint_Sneasel[];
extern const u8 gMonFrontPic_Teddiursa[];
extern const u8 gMonPalette_Teddiursa[];
extern const u8 gMonBackPic_Teddiursa[];
extern const u8 gMonShinyPalette_Teddiursa[];
extern const u8 gMonIcon_Teddiursa[];
extern const u8 gMonFootprint_Teddiursa[];
extern const u8 gMonFrontPic_Ursaring[];
extern const u8 gMonPalette_Ursaring[];
extern const u8 gMonBackPic_Ursaring[];
extern const u8 gMonShinyPalette_Ursaring[];
extern const u8 gMonIcon_Ursaring[];
extern const u8 gMonFootprint_Ursaring[];
extern const u8 gMonFrontPic_Slugma[];
extern const u8 gMonPalette_Slugma[];
extern const u8 gMonBackPic_Slugma[];
extern const u8 gMonShinyPalette_Slugma[];
extern const u8 gMonIcon_Slugma[];
extern const u8 gMonFootprint_Slugma[];
extern const u8 gMonFrontPic_Magcargo[];
extern const u8 gMonPalette_Magcargo[];
extern const u8 gMonBackPic_Magcargo[];
extern const u8 gMonShinyPalette_Magcargo[];
extern const u8 gMonIcon_Magcargo[];
extern const u8 gMonFootprint_Magcargo[];
extern const u8 gMonFrontPic_Swinub[];
extern const u8 gMonPalette_Swinub[];
extern const u8 gMonBackPic_Swinub[];
extern const u8 gMonShinyPalette_Swinub[];
extern const u8 gMonIcon_Swinub[];
extern const u8 gMonFootprint_Swinub[];
extern const u8 gMonFrontPic_Piloswine[];
extern const u8 gMonPalette_Piloswine[];
extern const u8 gMonBackPic_Piloswine[];
extern const u8 gMonShinyPalette_Piloswine[];
extern const u8 gMonIcon_Piloswine[];
extern const u8 gMonFootprint_Piloswine[];
extern const u8 gMonFrontPic_Corsola[];
extern const u8 gMonPalette_Corsola[];
extern const u8 gMonBackPic_Corsola[];
extern const u8 gMonShinyPalette_Corsola[];
extern const u8 gMonIcon_Corsola[];
extern const u8 gMonFootprint_Corsola[];
extern const u8 gMonFrontPic_Remoraid[];
extern const u8 gMonPalette_Remoraid[];
extern const u8 gMonBackPic_Remoraid[];
extern const u8 gMonShinyPalette_Remoraid[];
extern const u8 gMonIcon_Remoraid[];
extern const u8 gMonFootprint_Remoraid[];
extern const u8 gMonFrontPic_Octillery[];
extern const u8 gMonPalette_Octillery[];
extern const u8 gMonBackPic_Octillery[];
extern const u8 gMonShinyPalette_Octillery[];
extern const u8 gMonIcon_Octillery[];
extern const u8 gMonFootprint_Octillery[];
extern const u8 gMonFrontPic_Delibird[];
extern const u8 gMonPalette_Delibird[];
extern const u8 gMonBackPic_Delibird[];
extern const u8 gMonShinyPalette_Delibird[];
extern const u8 gMonIcon_Delibird[];
extern const u8 gMonFootprint_Delibird[];
extern const u8 gMonFrontPic_Mantine[];
extern const u8 gMonPalette_Mantine[];
extern const u8 gMonBackPic_Mantine[];
extern const u8 gMonShinyPalette_Mantine[];
extern const u8 gMonIcon_Mantine[];
extern const u8 gMonFootprint_Mantine[];
extern const u8 gMonFrontPic_Skarmory[];
extern const u8 gMonPalette_Skarmory[];
extern const u8 gMonBackPic_Skarmory[];
extern const u8 gMonShinyPalette_Skarmory[];
extern const u8 gMonIcon_Skarmory[];
extern const u8 gMonFootprint_Skarmory[];
extern const u8 gMonFrontPic_Houndour[];
extern const u8 gMonPalette_Houndour[];
extern const u8 gMonBackPic_Houndour[];
extern const u8 gMonShinyPalette_Houndour[];
extern const u8 gMonIcon_Houndour[];
extern const u8 gMonFootprint_Houndour[];
extern const u8 gMonFrontPic_Houndoom[];
extern const u8 gMonPalette_Houndoom[];
extern const u8 gMonBackPic_Houndoom[];
extern const u8 gMonShinyPalette_Houndoom[];
extern const u8 gMonIcon_Houndoom[];
extern const u8 gMonFootprint_Houndoom[];
extern const u8 gMonFrontPic_Kingdra[];
extern const u8 gMonPalette_Kingdra[];
extern const u8 gMonBackPic_Kingdra[];
extern const u8 gMonShinyPalette_Kingdra[];
extern const u8 gMonIcon_Kingdra[];
extern const u8 gMonFootprint_Kingdra[];
extern const u8 gMonFrontPic_Phanpy[];
extern const u8 gMonPalette_Phanpy[];
extern const u8 gMonBackPic_Phanpy[];
extern const u8 gMonShinyPalette_Phanpy[];
extern const u8 gMonIcon_Phanpy[];
extern const u8 gMonFootprint_Phanpy[];
extern const u8 gMonFrontPic_Donphan[];
extern const u8 gMonPalette_Donphan[];
extern const u8 gMonBackPic_Donphan[];
extern const u8 gMonShinyPalette_Donphan[];
extern const u8 gMonIcon_Donphan[];
extern const u8 gMonFootprint_Donphan[];
extern const u8 gMonFrontPic_Porygon2[];
extern const u8 gMonPalette_Porygon2[];
extern const u8 gMonBackPic_Porygon2[];
extern const u8 gMonShinyPalette_Porygon2[];
extern const u8 gMonIcon_Porygon2[];
extern const u8 gMonFootprint_Porygon2[];
extern const u8 gMonFrontPic_Stantler[];
extern const u8 gMonPalette_Stantler[];
extern const u8 gMonBackPic_Stantler[];
extern const u8 gMonShinyPalette_Stantler[];
extern const u8 gMonIcon_Stantler[];
extern const u8 gMonFootprint_Stantler[];
extern const u8 gMonFrontPic_Smeargle[];
extern const u8 gMonPalette_Smeargle[];
extern const u8 gMonBackPic_Smeargle[];
extern const u8 gMonShinyPalette_Smeargle[];
extern const u8 gMonIcon_Smeargle[];
extern const u8 gMonFootprint_Smeargle[];
extern const u8 gMonFrontPic_Tyrogue[];
extern const u8 gMonPalette_Tyrogue[];
extern const u8 gMonBackPic_Tyrogue[];
extern const u8 gMonShinyPalette_Tyrogue[];
extern const u8 gMonIcon_Tyrogue[];
extern const u8 gMonFootprint_Tyrogue[];
extern const u8 gMonFrontPic_Hitmontop[];
extern const u8 gMonPalette_Hitmontop[];
extern const u8 gMonBackPic_Hitmontop[];
extern const u8 gMonShinyPalette_Hitmontop[];
extern const u8 gMonIcon_Hitmontop[];
extern const u8 gMonFootprint_Hitmontop[];
extern const u8 gMonFrontPic_Smoochum[];
extern const u8 gMonPalette_Smoochum[];
extern const u8 gMonBackPic_Smoochum[];
extern const u8 gMonShinyPalette_Smoochum[];
extern const u8 gMonIcon_Smoochum[];
extern const u8 gMonFootprint_Smoochum[];
extern const u8 gMonFrontPic_Elekid[];
extern const u8 gMonPalette_Elekid[];
extern const u8 gMonBackPic_Elekid[];
extern const u8 gMonShinyPalette_Elekid[];
extern const u8 gMonIcon_Elekid[];
extern const u8 gMonFootprint_Elekid[];
extern const u8 gMonFrontPic_Magby[];
extern const u8 gMonPalette_Magby[];
extern const u8 gMonBackPic_Magby[];
extern const u8 gMonShinyPalette_Magby[];
extern const u8 gMonIcon_Magby[];
extern const u8 gMonFootprint_Magby[];
extern const u8 gMonFrontPic_Miltank[];
extern const u8 gMonPalette_Miltank[];
extern const u8 gMonBackPic_Miltank[];
extern const u8 gMonShinyPalette_Miltank[];
extern const u8 gMonIcon_Miltank[];
extern const u8 gMonFootprint_Miltank[];
extern const u8 gMonFrontPic_Blissey[];
extern const u8 gMonPalette_Blissey[];
extern const u8 gMonBackPic_Blissey[];
extern const u8 gMonShinyPalette_Blissey[];
extern const u8 gMonIcon_Blissey[];
extern const u8 gMonFootprint_Blissey[];
extern const u8 gMonFrontPic_Raikou[];
extern const u8 gMonPalette_Raikou[];
extern const u8 gMonBackPic_Raikou[];
extern const u8 gMonShinyPalette_Raikou[];
extern const u8 gMonIcon_Raikou[];
extern const u8 gMonFootprint_Raikou[];
extern const u8 gMonFrontPic_Entei[];
extern const u8 gMonPalette_Entei[];
extern const u8 gMonBackPic_Entei[];
extern const u8 gMonShinyPalette_Entei[];
extern const u8 gMonIcon_Entei[];
extern const u8 gMonFootprint_Entei[];
extern const u8 gMonFrontPic_Suicune[];
extern const u8 gMonPalette_Suicune[];
extern const u8 gMonBackPic_Suicune[];
extern const u8 gMonShinyPalette_Suicune[];
extern const u8 gMonIcon_Suicune[];
extern const u8 gMonFootprint_Suicune[];
extern const u8 gMonFrontPic_Larvitar[];
extern const u8 gMonPalette_Larvitar[];
extern const u8 gMonBackPic_Larvitar[];
extern const u8 gMonShinyPalette_Larvitar[];
extern const u8 gMonIcon_Larvitar[];
extern const u8 gMonFootprint_Larvitar[];
extern const u8 gMonFrontPic_Pupitar[];
extern const u8 gMonPalette_Pupitar[];
extern const u8 gMonBackPic_Pupitar[];
extern const u8 gMonShinyPalette_Pupitar[];
extern const u8 gMonIcon_Pupitar[];
extern const u8 gMonFootprint_Pupitar[];
extern const u8 gMonFrontPic_Tyranitar[];
extern const u8 gMonPalette_Tyranitar[];
extern const u8 gMonBackPic_Tyranitar[];
extern const u8 gMonShinyPalette_Tyranitar[];
extern const u8 gMonIcon_Tyranitar[];
extern const u8 gMonFootprint_Tyranitar[];
extern const u8 gMonFrontPic_Lugia[];
extern const u8 gMonPalette_Lugia[];
extern const u8 gMonBackPic_Lugia[];
extern const u8 gMonShinyPalette_Lugia[];
extern const u8 gMonIcon_Lugia[];
extern const u8 gMonFootprint_Lugia[];
extern const u8 gMonFrontPic_HoOh[];
extern const u8 gMonPalette_HoOh[];
extern const u8 gMonBackPic_HoOh[];
extern const u8 gMonShinyPalette_HoOh[];
extern const u8 gMonIcon_HoOh[];
extern const u8 gMonFootprint_HoOh[];
extern const u8 gMonFrontPic_Celebi[];
extern const u8 gMonPalette_Celebi[];
extern const u8 gMonBackPic_Celebi[];
extern const u8 gMonShinyPalette_Celebi[];
extern const u8 gMonIcon_Celebi[];
extern const u8 gMonFootprint_Celebi[];
extern const u8 gMonFrontPic_QuestionMark[];
extern const u8 gMonPalette_QuestionMark[];
extern const u8 gMonBackPic_QuestionMark[];
extern const u8 gMonShinyPalette_QuestionMark[];
extern const u8 gMonFrontPic_Treecko[];
extern const u8 gMonPalette_Treecko[];
extern const u8 gMonBackPic_Treecko[];
extern const u8 gMonShinyPalette_Treecko[];
extern const u8 gMonIcon_Treecko[];
extern const u8 gMonFootprint_Treecko[];
extern const u8 gMonFrontPic_Grovyle[];
extern const u8 gMonPalette_Grovyle[];
extern const u8 gMonBackPic_Grovyle[];
extern const u8 gMonShinyPalette_Grovyle[];
extern const u8 gMonIcon_Grovyle[];
extern const u8 gMonFootprint_Grovyle[];
extern const u8 gMonFrontPic_Sceptile[];
extern const u8 gMonPalette_Sceptile[];
extern const u8 gMonBackPic_Sceptile[];
extern const u8 gMonShinyPalette_Sceptile[];
extern const u8 gMonIcon_Sceptile[];
extern const u8 gMonFootprint_Sceptile[];
extern const u8 gMonFrontPic_Torchic[];
extern const u8 gMonPalette_Torchic[];
extern const u8 gMonBackPic_Torchic[];
extern const u8 gMonShinyPalette_Torchic[];
extern const u8 gMonIcon_Torchic[];
extern const u8 gMonFootprint_Torchic[];
extern const u8 gMonFrontPic_Combusken[];
extern const u8 gMonPalette_Combusken[];
extern const u8 gMonBackPic_Combusken[];
extern const u8 gMonShinyPalette_Combusken[];
extern const u8 gMonIcon_Combusken[];
extern const u8 gMonFootprint_Combusken[];
extern const u8 gMonFrontPic_Blaziken[];
extern const u8 gMonPalette_Blaziken[];
extern const u8 gMonBackPic_Blaziken[];
extern const u8 gMonShinyPalette_Blaziken[];
extern const u8 gMonIcon_Blaziken[];
extern const u8 gMonFootprint_Blaziken[];
extern const u8 gMonFrontPic_Mudkip[];
extern const u8 gMonPalette_Mudkip[];
extern const u8 gMonBackPic_Mudkip[];
extern const u8 gMonShinyPalette_Mudkip[];
extern const u8 gMonIcon_Mudkip[];
extern const u8 gMonFootprint_Mudkip[];
extern const u8 gMonFrontPic_Marshtomp[];
extern const u8 gMonPalette_Marshtomp[];
extern const u8 gMonBackPic_Marshtomp[];
extern const u8 gMonShinyPalette_Marshtomp[];
extern const u8 gMonIcon_Marshtomp[];
extern const u8 gMonFootprint_Marshtomp[];
extern const u8 gMonFrontPic_Swampert[];
extern const u8 gMonPalette_Swampert[];
extern const u8 gMonBackPic_Swampert[];
extern const u8 gMonShinyPalette_Swampert[];
extern const u8 gMonIcon_Swampert[];
extern const u8 gMonFootprint_Swampert[];
extern const u8 gMonFrontPic_Poochyena[];
extern const u8 gMonPalette_Poochyena[];
extern const u8 gMonBackPic_Poochyena[];
extern const u8 gMonShinyPalette_Poochyena[];
extern const u8 gMonIcon_Poochyena[];
extern const u8 gMonFootprint_Poochyena[];
extern const u8 gMonFrontPic_Mightyena[];
extern const u8 gMonPalette_Mightyena[];
extern const u8 gMonBackPic_Mightyena[];
extern const u8 gMonShinyPalette_Mightyena[];
extern const u8 gMonIcon_Mightyena[];
extern const u8 gMonFootprint_Mightyena[];
extern const u8 gMonFrontPic_Zigzagoon[];
extern const u8 gMonPalette_Zigzagoon[];
extern const u8 gMonBackPic_Zigzagoon[];
extern const u8 gMonShinyPalette_Zigzagoon[];
extern const u8 gMonIcon_Zigzagoon[];
extern const u8 gMonFootprint_Zigzagoon[];
extern const u8 gMonFrontPic_Linoone[];
extern const u8 gMonPalette_Linoone[];
extern const u8 gMonBackPic_Linoone[];
extern const u8 gMonShinyPalette_Linoone[];
extern const u8 gMonIcon_Linoone[];
extern const u8 gMonFootprint_Linoone[];
extern const u8 gMonFrontPic_Wurmple[];
extern const u8 gMonPalette_Wurmple[];
extern const u8 gMonBackPic_Wurmple[];
extern const u8 gMonShinyPalette_Wurmple[];
extern const u8 gMonIcon_Wurmple[];
extern const u8 gMonFootprint_Wurmple[];
extern const u8 gMonFrontPic_Silcoon[];
extern const u8 gMonPalette_Silcoon[];
extern const u8 gMonBackPic_Silcoon[];
extern const u8 gMonShinyPalette_Silcoon[];
extern const u8 gMonIcon_Silcoon[];
extern const u8 gMonFootprint_Silcoon[];
extern const u8 gMonFrontPic_Beautifly[];
extern const u8 gMonPalette_Beautifly[];
extern const u8 gMonBackPic_Beautifly[];
extern const u8 gMonShinyPalette_Beautifly[];
extern const u8 gMonIcon_Beautifly[];
extern const u8 gMonFootprint_Beautifly[];
extern const u8 gMonFrontPic_Cascoon[];
extern const u8 gMonPalette_Cascoon[];
extern const u8 gMonBackPic_Cascoon[];
extern const u8 gMonShinyPalette_Cascoon[];
extern const u8 gMonIcon_Cascoon[];
extern const u8 gMonFootprint_Cascoon[];
extern const u8 gMonFrontPic_Dustox[];
extern const u8 gMonPalette_Dustox[];
extern const u8 gMonBackPic_Dustox[];
extern const u8 gMonShinyPalette_Dustox[];
extern const u8 gMonIcon_Dustox[];
extern const u8 gMonFootprint_Dustox[];
extern const u8 gMonFrontPic_Lotad[];
extern const u8 gMonPalette_Lotad[];
extern const u8 gMonBackPic_Lotad[];
extern const u8 gMonShinyPalette_Lotad[];
extern const u8 gMonIcon_Lotad[];
extern const u8 gMonFootprint_Lotad[];
extern const u8 gMonFrontPic_Lombre[];
extern const u8 gMonPalette_Lombre[];
extern const u8 gMonBackPic_Lombre[];
extern const u8 gMonShinyPalette_Lombre[];
extern const u8 gMonIcon_Lombre[];
extern const u8 gMonFootprint_Lombre[];
extern const u8 gMonFrontPic_Ludicolo[];
extern const u8 gMonPalette_Ludicolo[];
extern const u8 gMonBackPic_Ludicolo[];
extern const u8 gMonShinyPalette_Ludicolo[];
extern const u8 gMonIcon_Ludicolo[];
extern const u8 gMonFootprint_Ludicolo[];
extern const u8 gMonFrontPic_Seedot[];
extern const u8 gMonPalette_Seedot[];
extern const u8 gMonBackPic_Seedot[];
extern const u8 gMonShinyPalette_Seedot[];
extern const u8 gMonIcon_Seedot[];
extern const u8 gMonFootprint_Seedot[];
extern const u8 gMonFrontPic_Nuzleaf[];
extern const u8 gMonPalette_Nuzleaf[];
extern const u8 gMonBackPic_Nuzleaf[];
extern const u8 gMonShinyPalette_Nuzleaf[];
extern const u8 gMonIcon_Nuzleaf[];
extern const u8 gMonFootprint_Nuzleaf[];
extern const u8 gMonFrontPic_Shiftry[];
extern const u8 gMonPalette_Shiftry[];
extern const u8 gMonBackPic_Shiftry[];
extern const u8 gMonShinyPalette_Shiftry[];
extern const u8 gMonIcon_Shiftry[];
extern const u8 gMonFootprint_Shiftry[];
extern const u8 gMonFrontPic_Nincada[];
extern const u8 gMonPalette_Nincada[];
extern const u8 gMonBackPic_Nincada[];
extern const u8 gMonShinyPalette_Nincada[];
extern const u8 gMonIcon_Nincada[];
extern const u8 gMonFootprint_Nincada[];
extern const u8 gMonFrontPic_Ninjask[];
extern const u8 gMonPalette_Ninjask[];
extern const u8 gMonBackPic_Ninjask[];
extern const u8 gMonShinyPalette_Ninjask[];
extern const u8 gMonIcon_Ninjask[];
extern const u8 gMonFootprint_Ninjask[];
extern const u8 gMonFrontPic_Shedinja[];
extern const u8 gMonPalette_Shedinja[];
extern const u8 gMonBackPic_Shedinja[];
extern const u8 gMonShinyPalette_Shedinja[];
extern const u8 gMonIcon_Shedinja[];
extern const u8 gMonFootprint_Shedinja[];
extern const u8 gMonFrontPic_Taillow[];
extern const u8 gMonPalette_Taillow[];
extern const u8 gMonBackPic_Taillow[];
extern const u8 gMonShinyPalette_Taillow[];
extern const u8 gMonIcon_Taillow[];
extern const u8 gMonFootprint_Taillow[];
extern const u8 gMonFrontPic_Swellow[];
extern const u8 gMonPalette_Swellow[];
extern const u8 gMonBackPic_Swellow[];
extern const u8 gMonShinyPalette_Swellow[];
extern const u8 gMonIcon_Swellow[];
extern const u8 gMonFootprint_Swellow[];
extern const u8 gMonFrontPic_Shroomish[];
extern const u8 gMonPalette_Shroomish[];
extern const u8 gMonBackPic_Shroomish[];
extern const u8 gMonShinyPalette_Shroomish[];
extern const u8 gMonIcon_Shroomish[];
extern const u8 gMonFootprint_Shroomish[];
extern const u8 gMonFrontPic_Breloom[];
extern const u8 gMonPalette_Breloom[];
extern const u8 gMonBackPic_Breloom[];
extern const u8 gMonShinyPalette_Breloom[];
extern const u8 gMonIcon_Breloom[];
extern const u8 gMonFootprint_Breloom[];
extern const u8 gMonFrontPic_Spinda[];
extern const u8 gMonPalette_Spinda[];
extern const u8 gMonBackPic_Spinda[];
extern const u8 gMonShinyPalette_Spinda[];
extern const u8 gMonIcon_Spinda[];
extern const u8 gMonFootprint_Spinda[];
extern const u8 gMonFrontPic_Wingull[];
extern const u8 gMonPalette_Wingull[];
extern const u8 gMonBackPic_Wingull[];
extern const u8 gMonShinyPalette_Wingull[];
extern const u8 gMonIcon_Wingull[];
extern const u8 gMonFootprint_Wingull[];
extern const u8 gMonFrontPic_Pelipper[];
extern const u8 gMonPalette_Pelipper[];
extern const u8 gMonBackPic_Pelipper[];
extern const u8 gMonShinyPalette_Pelipper[];
extern const u8 gMonIcon_Pelipper[];
extern const u8 gMonFootprint_Pelipper[];
extern const u8 gMonFrontPic_Surskit[];
extern const u8 gMonPalette_Surskit[];
extern const u8 gMonBackPic_Surskit[];
extern const u8 gMonShinyPalette_Surskit[];
extern const u8 gMonIcon_Surskit[];
extern const u8 gMonFootprint_Surskit[];
extern const u8 gMonFrontPic_Masquerain[];
extern const u8 gMonPalette_Masquerain[];
extern const u8 gMonBackPic_Masquerain[];
extern const u8 gMonShinyPalette_Masquerain[];
extern const u8 gMonIcon_Masquerain[];
extern const u8 gMonFootprint_Masquerain[];
extern const u8 gMonFrontPic_Wailmer[];
extern const u8 gMonPalette_Wailmer[];
extern const u8 gMonBackPic_Wailmer[];
extern const u8 gMonShinyPalette_Wailmer[];
extern const u8 gMonIcon_Wailmer[];
extern const u8 gMonFootprint_Wailmer[];
extern const u8 gMonFrontPic_Wailord[];
extern const u8 gMonPalette_Wailord[];
extern const u8 gMonBackPic_Wailord[];
extern const u8 gMonShinyPalette_Wailord[];
extern const u8 gMonIcon_Wailord[];
extern const u8 gMonFootprint_Wailord[];
extern const u8 gMonFrontPic_Skitty[];
extern const u8 gMonPalette_Skitty[];
extern const u8 gMonBackPic_Skitty[];
extern const u8 gMonShinyPalette_Skitty[];
extern const u8 gMonIcon_Skitty[];
extern const u8 gMonFootprint_Skitty[];
extern const u8 gMonFrontPic_Delcatty[];
extern const u8 gMonPalette_Delcatty[];
extern const u8 gMonBackPic_Delcatty[];
extern const u8 gMonShinyPalette_Delcatty[];
extern const u8 gMonIcon_Delcatty[];
extern const u8 gMonFootprint_Delcatty[];
extern const u8 gMonFrontPic_Kecleon[];
extern const u8 gMonPalette_Kecleon[];
extern const u8 gMonBackPic_Kecleon[];
extern const u8 gMonShinyPalette_Kecleon[];
extern const u8 gMonIcon_Kecleon[];
extern const u8 gMonFootprint_Kecleon[];
extern const u8 gMonFrontPic_Baltoy[];
extern const u8 gMonPalette_Baltoy[];
extern const u8 gMonBackPic_Baltoy[];
extern const u8 gMonShinyPalette_Baltoy[];
extern const u8 gMonIcon_Baltoy[];
extern const u8 gMonFootprint_Baltoy[];
extern const u8 gMonFrontPic_Claydol[];
extern const u8 gMonPalette_Claydol[];
extern const u8 gMonBackPic_Claydol[];
extern const u8 gMonShinyPalette_Claydol[];
extern const u8 gMonIcon_Claydol[];
extern const u8 gMonFootprint_Claydol[];
extern const u8 gMonFrontPic_Nosepass[];
extern const u8 gMonPalette_Nosepass[];
extern const u8 gMonBackPic_Nosepass[];
extern const u8 gMonShinyPalette_Nosepass[];
extern const u8 gMonIcon_Nosepass[];
extern const u8 gMonFootprint_Nosepass[];
extern const u8 gMonFrontPic_Torkoal[];
extern const u8 gMonPalette_Torkoal[];
extern const u8 gMonBackPic_Torkoal[];
extern const u8 gMonShinyPalette_Torkoal[];
extern const u8 gMonIcon_Torkoal[];
extern const u8 gMonFootprint_Torkoal[];
extern const u8 gMonFrontPic_Sableye[];
extern const u8 gMonPalette_Sableye[];
extern const u8 gMonBackPic_Sableye[];
extern const u8 gMonShinyPalette_Sableye[];
extern const u8 gMonIcon_Sableye[];
extern const u8 gMonFootprint_Sableye[];
extern const u8 gMonFrontPic_Barboach[];
extern const u8 gMonPalette_Barboach[];
extern const u8 gMonBackPic_Barboach[];
extern const u8 gMonShinyPalette_Barboach[];
extern const u8 gMonIcon_Barboach[];
extern const u8 gMonFootprint_Barboach[];
extern const u8 gMonFrontPic_Whiscash[];
extern const u8 gMonPalette_Whiscash[];
extern const u8 gMonBackPic_Whiscash[];
extern const u8 gMonShinyPalette_Whiscash[];
extern const u8 gMonIcon_Whiscash[];
extern const u8 gMonFootprint_Whiscash[];
extern const u8 gMonFrontPic_Luvdisc[];
extern const u8 gMonPalette_Luvdisc[];
extern const u8 gMonBackPic_Luvdisc[];
extern const u8 gMonShinyPalette_Luvdisc[];
extern const u8 gMonIcon_Luvdisc[];
extern const u8 gMonFootprint_Luvdisc[];
extern const u8 gMonFrontPic_Corphish[];
extern const u8 gMonPalette_Corphish[];
extern const u8 gMonBackPic_Corphish[];
extern const u8 gMonShinyPalette_Corphish[];
extern const u8 gMonIcon_Corphish[];
extern const u8 gMonFootprint_Corphish[];
extern const u8 gMonFrontPic_Crawdaunt[];
extern const u8 gMonPalette_Crawdaunt[];
extern const u8 gMonBackPic_Crawdaunt[];
extern const u8 gMonShinyPalette_Crawdaunt[];
extern const u8 gMonIcon_Crawdaunt[];
extern const u8 gMonFootprint_Crawdaunt[];
extern const u8 gMonFrontPic_Feebas[];
extern const u8 gMonPalette_Feebas[];
extern const u8 gMonBackPic_Feebas[];
extern const u8 gMonShinyPalette_Feebas[];
extern const u8 gMonIcon_Feebas[];
extern const u8 gMonFootprint_Feebas[];
extern const u8 gMonFrontPic_Milotic[];
extern const u8 gMonPalette_Milotic[];
extern const u8 gMonBackPic_Milotic[];
extern const u8 gMonShinyPalette_Milotic[];
extern const u8 gMonIcon_Milotic[];
extern const u8 gMonFootprint_Milotic[];
extern const u8 gMonFrontPic_Carvanha[];
extern const u8 gMonPalette_Carvanha[];
extern const u8 gMonBackPic_Carvanha[];
extern const u8 gMonShinyPalette_Carvanha[];
extern const u8 gMonIcon_Carvanha[];
extern const u8 gMonFootprint_Carvanha[];
extern const u8 gMonFrontPic_Sharpedo[];
extern const u8 gMonPalette_Sharpedo[];
extern const u8 gMonBackPic_Sharpedo[];
extern const u8 gMonShinyPalette_Sharpedo[];
extern const u8 gMonIcon_Sharpedo[];
extern const u8 gMonFootprint_Sharpedo[];
extern const u8 gMonFrontPic_Trapinch[];
extern const u8 gMonPalette_Trapinch[];
extern const u8 gMonBackPic_Trapinch[];
extern const u8 gMonShinyPalette_Trapinch[];
extern const u8 gMonIcon_Trapinch[];
extern const u8 gMonFootprint_Trapinch[];
extern const u8 gMonFrontPic_Vibrava[];
extern const u8 gMonPalette_Vibrava[];
extern const u8 gMonBackPic_Vibrava[];
extern const u8 gMonShinyPalette_Vibrava[];
extern const u8 gMonIcon_Vibrava[];
extern const u8 gMonFootprint_Vibrava[];
extern const u8 gMonFrontPic_Flygon[];
extern const u8 gMonPalette_Flygon[];
extern const u8 gMonBackPic_Flygon[];
extern const u8 gMonShinyPalette_Flygon[];
extern const u8 gMonIcon_Flygon[];
extern const u8 gMonFootprint_Flygon[];
extern const u8 gMonFrontPic_Makuhita[];
extern const u8 gMonPalette_Makuhita[];
extern const u8 gMonBackPic_Makuhita[];
extern const u8 gMonShinyPalette_Makuhita[];
extern const u8 gMonIcon_Makuhita[];
extern const u8 gMonFootprint_Makuhita[];
extern const u8 gMonFrontPic_Hariyama[];
extern const u8 gMonPalette_Hariyama[];
extern const u8 gMonBackPic_Hariyama[];
extern const u8 gMonShinyPalette_Hariyama[];
extern const u8 gMonIcon_Hariyama[];
extern const u8 gMonFootprint_Hariyama[];
extern const u8 gMonFrontPic_Electrike[];
extern const u8 gMonPalette_Electrike[];
extern const u8 gMonBackPic_Electrike[];
extern const u8 gMonShinyPalette_Electrike[];
extern const u8 gMonIcon_Electrike[];
extern const u8 gMonFootprint_Electrike[];
extern const u8 gMonFrontPic_Manectric[];
extern const u8 gMonPalette_Manectric[];
extern const u8 gMonBackPic_Manectric[];
extern const u8 gMonShinyPalette_Manectric[];
extern const u8 gMonIcon_Manectric[];
extern const u8 gMonFootprint_Manectric[];
extern const u8 gMonFrontPic_Numel[];
extern const u8 gMonPalette_Numel[];
extern const u8 gMonBackPic_Numel[];
extern const u8 gMonShinyPalette_Numel[];
extern const u8 gMonIcon_Numel[];
extern const u8 gMonFootprint_Numel[];
extern const u8 gMonFrontPic_Camerupt[];
extern const u8 gMonPalette_Camerupt[];
extern const u8 gMonBackPic_Camerupt[];
extern const u8 gMonShinyPalette_Camerupt[];
extern const u8 gMonIcon_Camerupt[];
extern const u8 gMonFootprint_Camerupt[];
extern const u8 gMonFrontPic_Spheal[];
extern const u8 gMonPalette_Spheal[];
extern const u8 gMonBackPic_Spheal[];
extern const u8 gMonShinyPalette_Spheal[];
extern const u8 gMonIcon_Spheal[];
extern const u8 gMonFootprint_Spheal[];
extern const u8 gMonFrontPic_Sealeo[];
extern const u8 gMonPalette_Sealeo[];
extern const u8 gMonBackPic_Sealeo[];
extern const u8 gMonShinyPalette_Sealeo[];
extern const u8 gMonIcon_Sealeo[];
extern const u8 gMonFootprint_Sealeo[];
extern const u8 gMonFrontPic_Walrein[];
extern const u8 gMonPalette_Walrein[];
extern const u8 gMonBackPic_Walrein[];
extern const u8 gMonShinyPalette_Walrein[];
extern const u8 gMonIcon_Walrein[];
extern const u8 gMonFootprint_Walrein[];
extern const u8 gMonFrontPic_Cacnea[];
extern const u8 gMonPalette_Cacnea[];
extern const u8 gMonBackPic_Cacnea[];
extern const u8 gMonShinyPalette_Cacnea[];
extern const u8 gMonIcon_Cacnea[];
extern const u8 gMonFootprint_Cacnea[];
extern const u8 gMonFrontPic_Cacturne[];
extern const u8 gMonPalette_Cacturne[];
extern const u8 gMonBackPic_Cacturne[];
extern const u8 gMonShinyPalette_Cacturne[];
extern const u8 gMonIcon_Cacturne[];
extern const u8 gMonFootprint_Cacturne[];
extern const u8 gMonFrontPic_Snorunt[];
extern const u8 gMonPalette_Snorunt[];
extern const u8 gMonBackPic_Snorunt[];
extern const u8 gMonShinyPalette_Snorunt[];
extern const u8 gMonIcon_Snorunt[];
extern const u8 gMonFootprint_Snorunt[];
extern const u8 gMonFrontPic_Glalie[];
extern const u8 gMonPalette_Glalie[];
extern const u8 gMonBackPic_Glalie[];
extern const u8 gMonShinyPalette_Glalie[];
extern const u8 gMonIcon_Glalie[];
extern const u8 gMonFootprint_Glalie[];
extern const u8 gMonFrontPic_Lunatone[];
extern const u8 gMonPalette_Lunatone[];
extern const u8 gMonBackPic_Lunatone[];
extern const u8 gMonShinyPalette_Lunatone[];
extern const u8 gMonIcon_Lunatone[];
extern const u8 gMonFootprint_Lunatone[];
extern const u8 gMonFrontPic_Solrock[];
extern const u8 gMonPalette_Solrock[];
extern const u8 gMonBackPic_Solrock[];
extern const u8 gMonShinyPalette_Solrock[];
extern const u8 gMonIcon_Solrock[];
extern const u8 gMonFootprint_Solrock[];
extern const u8 gMonFrontPic_Azurill[];
extern const u8 gMonPalette_Azurill[];
extern const u8 gMonBackPic_Azurill[];
extern const u8 gMonShinyPalette_Azurill[];
extern const u8 gMonIcon_Azurill[];
extern const u8 gMonFootprint_Azurill[];
extern const u8 gMonFrontPic_Spoink[];
extern const u8 gMonPalette_Spoink[];
extern const u8 gMonBackPic_Spoink[];
extern const u8 gMonShinyPalette_Spoink[];
extern const u8 gMonIcon_Spoink[];
extern const u8 gMonFootprint_Spoink[];
extern const u8 gMonFrontPic_Grumpig[];
extern const u8 gMonPalette_Grumpig[];
extern const u8 gMonBackPic_Grumpig[];
extern const u8 gMonShinyPalette_Grumpig[];
extern const u8 gMonIcon_Grumpig[];
extern const u8 gMonFootprint_Grumpig[];
extern const u8 gMonFrontPic_Plusle[];
extern const u8 gMonPalette_Plusle[];
extern const u8 gMonBackPic_Plusle[];
extern const u8 gMonShinyPalette_Plusle[];
extern const u8 gMonIcon_Plusle[];
extern const u8 gMonFootprint_Plusle[];
extern const u8 gMonFrontPic_Minun[];
extern const u8 gMonPalette_Minun[];
extern const u8 gMonBackPic_Minun[];
extern const u8 gMonShinyPalette_Minun[];
extern const u8 gMonIcon_Minun[];
extern const u8 gMonFootprint_Minun[];
extern const u8 gMonFrontPic_Mawile[];
extern const u8 gMonPalette_Mawile[];
extern const u8 gMonBackPic_Mawile[];
extern const u8 gMonShinyPalette_Mawile[];
extern const u8 gMonIcon_Mawile[];
extern const u8 gMonFootprint_Mawile[];
extern const u8 gMonFrontPic_Meditite[];
extern const u8 gMonPalette_Meditite[];
extern const u8 gMonBackPic_Meditite[];
extern const u8 gMonShinyPalette_Meditite[];
extern const u8 gMonIcon_Meditite[];
extern const u8 gMonFootprint_Meditite[];
extern const u8 gMonFrontPic_Medicham[];
extern const u8 gMonPalette_Medicham[];
extern const u8 gMonBackPic_Medicham[];
extern const u8 gMonShinyPalette_Medicham[];
extern const u8 gMonIcon_Medicham[];
extern const u8 gMonFootprint_Medicham[];
extern const u8 gMonFrontPic_Swablu[];
extern const u8 gMonPalette_Swablu[];
extern const u8 gMonBackPic_Swablu[];
extern const u8 gMonShinyPalette_Swablu[];
extern const u8 gMonIcon_Swablu[];
extern const u8 gMonFootprint_Swablu[];
extern const u8 gMonFrontPic_Altaria[];
extern const u8 gMonPalette_Altaria[];
extern const u8 gMonBackPic_Altaria[];
extern const u8 gMonShinyPalette_Altaria[];
extern const u8 gMonIcon_Altaria[];
extern const u8 gMonFootprint_Altaria[];
extern const u8 gMonFrontPic_Wynaut[];
extern const u8 gMonPalette_Wynaut[];
extern const u8 gMonBackPic_Wynaut[];
extern const u8 gMonShinyPalette_Wynaut[];
extern const u8 gMonIcon_Wynaut[];
extern const u8 gMonFootprint_Wynaut[];
extern const u8 gMonFrontPic_Duskull[];
extern const u8 gMonPalette_Duskull[];
extern const u8 gMonBackPic_Duskull[];
extern const u8 gMonShinyPalette_Duskull[];
extern const u8 gMonIcon_Duskull[];
extern const u8 gMonFootprint_Duskull[];
extern const u8 gMonFrontPic_Dusclops[];
extern const u8 gMonPalette_Dusclops[];
extern const u8 gMonBackPic_Dusclops[];
extern const u8 gMonShinyPalette_Dusclops[];
extern const u8 gMonIcon_Dusclops[];
extern const u8 gMonFootprint_Dusclops[];
extern const u8 gMonFrontPic_Roselia[];
extern const u8 gMonPalette_Roselia[];
extern const u8 gMonBackPic_Roselia[];
extern const u8 gMonShinyPalette_Roselia[];
extern const u8 gMonIcon_Roselia[];
extern const u8 gMonFootprint_Roselia[];
extern const u8 gMonFrontPic_Slakoth[];
extern const u8 gMonPalette_Slakoth[];
extern const u8 gMonBackPic_Slakoth[];
extern const u8 gMonShinyPalette_Slakoth[];
extern const u8 gMonIcon_Slakoth[];
extern const u8 gMonFootprint_Slakoth[];
extern const u8 gMonFrontPic_Vigoroth[];
extern const u8 gMonPalette_Vigoroth[];
extern const u8 gMonBackPic_Vigoroth[];
extern const u8 gMonShinyPalette_Vigoroth[];
extern const u8 gMonIcon_Vigoroth[];
extern const u8 gMonFootprint_Vigoroth[];
extern const u8 gMonFrontPic_Slaking[];
extern const u8 gMonPalette_Slaking[];
extern const u8 gMonBackPic_Slaking[];
extern const u8 gMonShinyPalette_Slaking[];
extern const u8 gMonIcon_Slaking[];
extern const u8 gMonFootprint_Slaking[];
extern const u8 gMonFrontPic_Gulpin[];
extern const u8 gMonPalette_Gulpin[];
extern const u8 gMonBackPic_Gulpin[];
extern const u8 gMonShinyPalette_Gulpin[];
extern const u8 gMonIcon_Gulpin[];
extern const u8 gMonFootprint_Gulpin[];
extern const u8 gMonFrontPic_Swalot[];
extern const u8 gMonPalette_Swalot[];
extern const u8 gMonBackPic_Swalot[];
extern const u8 gMonShinyPalette_Swalot[];
extern const u8 gMonIcon_Swalot[];
extern const u8 gMonFootprint_Swalot[];
extern const u8 gMonFrontPic_Tropius[];
extern const u8 gMonPalette_Tropius[];
extern const u8 gMonBackPic_Tropius[];
extern const u8 gMonShinyPalette_Tropius[];
extern const u8 gMonIcon_Tropius[];
extern const u8 gMonFootprint_Tropius[];
extern const u8 gMonFrontPic_Whismur[];
extern const u8 gMonPalette_Whismur[];
extern const u8 gMonBackPic_Whismur[];
extern const u8 gMonShinyPalette_Whismur[];
extern const u8 gMonIcon_Whismur[];
extern const u8 gMonFootprint_Whismur[];
extern const u8 gMonFrontPic_Loudred[];
extern const u8 gMonPalette_Loudred[];
extern const u8 gMonBackPic_Loudred[];
extern const u8 gMonShinyPalette_Loudred[];
extern const u8 gMonIcon_Loudred[];
extern const u8 gMonFootprint_Loudred[];
extern const u8 gMonFrontPic_Exploud[];
extern const u8 gMonPalette_Exploud[];
extern const u8 gMonBackPic_Exploud[];
extern const u8 gMonShinyPalette_Exploud[];
extern const u8 gMonIcon_Exploud[];
extern const u8 gMonFootprint_Exploud[];
extern const u8 gMonFrontPic_Clamperl[];
extern const u8 gMonPalette_Clamperl[];
extern const u8 gMonBackPic_Clamperl[];
extern const u8 gMonShinyPalette_Clamperl[];
extern const u8 gMonIcon_Clamperl[];
extern const u8 gMonFootprint_Clamperl[];
extern const u8 gMonFrontPic_Huntail[];
extern const u8 gMonPalette_Huntail[];
extern const u8 gMonBackPic_Huntail[];
extern const u8 gMonShinyPalette_Huntail[];
extern const u8 gMonIcon_Huntail[];
extern const u8 gMonFootprint_Huntail[];
extern const u8 gMonFrontPic_Gorebyss[];
extern const u8 gMonPalette_Gorebyss[];
extern const u8 gMonBackPic_Gorebyss[];
extern const u8 gMonShinyPalette_Gorebyss[];
extern const u8 gMonIcon_Gorebyss[];
extern const u8 gMonFootprint_Gorebyss[];
extern const u8 gMonFrontPic_Absol[];
extern const u8 gMonPalette_Absol[];
extern const u8 gMonBackPic_Absol[];
extern const u8 gMonShinyPalette_Absol[];
extern const u8 gMonIcon_Absol[];
extern const u8 gMonFootprint_Absol[];
extern const u8 gMonFrontPic_Shuppet[];
extern const u8 gMonPalette_Shuppet[];
extern const u8 gMonBackPic_Shuppet[];
extern const u8 gMonShinyPalette_Shuppet[];
extern const u8 gMonIcon_Shuppet[];
extern const u8 gMonFootprint_Shuppet[];
extern const u8 gMonFrontPic_Banette[];
extern const u8 gMonPalette_Banette[];
extern const u8 gMonBackPic_Banette[];
extern const u8 gMonShinyPalette_Banette[];
extern const u8 gMonIcon_Banette[];
extern const u8 gMonFootprint_Banette[];
extern const u8 gMonFrontPic_Seviper[];
extern const u8 gMonPalette_Seviper[];
extern const u8 gMonBackPic_Seviper[];
extern const u8 gMonShinyPalette_Seviper[];
extern const u8 gMonIcon_Seviper[];
extern const u8 gMonFootprint_Seviper[];
extern const u8 gMonFrontPic_Zangoose[];
extern const u8 gMonPalette_Zangoose[];
extern const u8 gMonBackPic_Zangoose[];
extern const u8 gMonShinyPalette_Zangoose[];
extern const u8 gMonIcon_Zangoose[];
extern const u8 gMonFootprint_Zangoose[];
extern const u8 gMonFrontPic_Relicanth[];
extern const u8 gMonPalette_Relicanth[];
extern const u8 gMonBackPic_Relicanth[];
extern const u8 gMonShinyPalette_Relicanth[];
extern const u8 gMonIcon_Relicanth[];
extern const u8 gMonFootprint_Relicanth[];
extern const u8 gMonFrontPic_Aron[];
extern const u8 gMonPalette_Aron[];
extern const u8 gMonBackPic_Aron[];
extern const u8 gMonShinyPalette_Aron[];
extern const u8 gMonIcon_Aron[];
extern const u8 gMonFootprint_Aron[];
extern const u8 gMonFrontPic_Lairon[];
extern const u8 gMonPalette_Lairon[];
extern const u8 gMonBackPic_Lairon[];
extern const u8 gMonShinyPalette_Lairon[];
extern const u8 gMonIcon_Lairon[];
extern const u8 gMonFootprint_Lairon[];
extern const u8 gMonFrontPic_Aggron[];
extern const u8 gMonPalette_Aggron[];
extern const u8 gMonBackPic_Aggron[];
extern const u8 gMonShinyPalette_Aggron[];
extern const u8 gMonIcon_Aggron[];
extern const u8 gMonFootprint_Aggron[];
extern const u8 gMonFrontPic_Castform[];
extern const u8 gMonPalette_Castform[];
extern const u8 gMonBackPic_Castform[];
extern const u8 gMonShinyPalette_Castform[];
extern const u8 gMonIcon_Castform[];
extern const u8 gMonFootprint_Castform[];
extern const u8 gMonFrontPic_Volbeat[];
extern const u8 gMonPalette_Volbeat[];
extern const u8 gMonBackPic_Volbeat[];
extern const u8 gMonShinyPalette_Volbeat[];
extern const u8 gMonIcon_Volbeat[];
extern const u8 gMonFootprint_Volbeat[];
extern const u8 gMonFrontPic_Illumise[];
extern const u8 gMonPalette_Illumise[];
extern const u8 gMonBackPic_Illumise[];
extern const u8 gMonShinyPalette_Illumise[];
extern const u8 gMonIcon_Illumise[];
extern const u8 gMonFootprint_Illumise[];
extern const u8 gMonFrontPic_Lileep[];
extern const u8 gMonPalette_Lileep[];
extern const u8 gMonBackPic_Lileep[];
extern const u8 gMonShinyPalette_Lileep[];
extern const u8 gMonIcon_Lileep[];
extern const u8 gMonFootprint_Lileep[];
extern const u8 gMonFrontPic_Cradily[];
extern const u8 gMonPalette_Cradily[];
extern const u8 gMonBackPic_Cradily[];
extern const u8 gMonShinyPalette_Cradily[];
extern const u8 gMonIcon_Cradily[];
extern const u8 gMonFootprint_Cradily[];
extern const u8 gMonFrontPic_Anorith[];
extern const u8 gMonPalette_Anorith[];
extern const u8 gMonBackPic_Anorith[];
extern const u8 gMonShinyPalette_Anorith[];
extern const u8 gMonIcon_Anorith[];
extern const u8 gMonFootprint_Anorith[];
extern const u8 gMonFrontPic_Armaldo[];
extern const u8 gMonPalette_Armaldo[];
extern const u8 gMonBackPic_Armaldo[];
extern const u8 gMonShinyPalette_Armaldo[];
extern const u8 gMonIcon_Armaldo[];
extern const u8 gMonFootprint_Armaldo[];
extern const u8 gMonFrontPic_Ralts[];
extern const u8 gMonPalette_Ralts[];
extern const u8 gMonBackPic_Ralts[];
extern const u8 gMonShinyPalette_Ralts[];
extern const u8 gMonIcon_Ralts[];
extern const u8 gMonFootprint_Ralts[];
extern const u8 gMonFrontPic_Kirlia[];
extern const u8 gMonPalette_Kirlia[];
extern const u8 gMonBackPic_Kirlia[];
extern const u8 gMonShinyPalette_Kirlia[];
extern const u8 gMonIcon_Kirlia[];
extern const u8 gMonFootprint_Kirlia[];
extern const u8 gMonFrontPic_Gardevoir[];
extern const u8 gMonPalette_Gardevoir[];
extern const u8 gMonBackPic_Gardevoir[];
extern const u8 gMonShinyPalette_Gardevoir[];
extern const u8 gMonIcon_Gardevoir[];
extern const u8 gMonFootprint_Gardevoir[];
extern const u8 gMonFrontPic_Bagon[];
extern const u8 gMonPalette_Bagon[];
extern const u8 gMonBackPic_Bagon[];
extern const u8 gMonShinyPalette_Bagon[];
extern const u8 gMonIcon_Bagon[];
extern const u8 gMonFootprint_Bagon[];
extern const u8 gMonFrontPic_Shelgon[];
extern const u8 gMonPalette_Shelgon[];
extern const u8 gMonBackPic_Shelgon[];
extern const u8 gMonShinyPalette_Shelgon[];
extern const u8 gMonIcon_Shelgon[];
extern const u8 gMonFootprint_Shelgon[];
extern const u8 gMonFrontPic_Salamence[];
extern const u8 gMonPalette_Salamence[];
extern const u8 gMonBackPic_Salamence[];
extern const u8 gMonShinyPalette_Salamence[];
extern const u8 gMonIcon_Salamence[];
extern const u8 gMonFootprint_Salamence[];
extern const u8 gMonFrontPic_Beldum[];
extern const u8 gMonPalette_Beldum[];
extern const u8 gMonBackPic_Beldum[];
extern const u8 gMonShinyPalette_Beldum[];
extern const u8 gMonIcon_Beldum[];
extern const u8 gMonFootprint_Beldum[];
extern const u8 gMonFrontPic_Metang[];
extern const u8 gMonPalette_Metang[];
extern const u8 gMonBackPic_Metang[];
extern const u8 gMonShinyPalette_Metang[];
extern const u8 gMonIcon_Metang[];
extern const u8 gMonFootprint_Metang[];
extern const u8 gMonFrontPic_Metagross[];
extern const u8 gMonPalette_Metagross[];
extern const u8 gMonBackPic_Metagross[];
extern const u8 gMonShinyPalette_Metagross[];
extern const u8 gMonIcon_Metagross[];
extern const u8 gMonFootprint_Metagross[];
extern const u8 gMonFrontPic_Regirock[];
extern const u8 gMonPalette_Regirock[];
extern const u8 gMonBackPic_Regirock[];
extern const u8 gMonShinyPalette_Regirock[];
extern const u8 gMonIcon_Regirock[];
extern const u8 gMonFootprint_Regirock[];
extern const u8 gMonFrontPic_Regice[];
extern const u8 gMonPalette_Regice[];
extern const u8 gMonBackPic_Regice[];
extern const u8 gMonShinyPalette_Regice[];
extern const u8 gMonIcon_Regice[];
extern const u8 gMonFootprint_Regice[];
extern const u8 gMonFrontPic_Registeel[];
extern const u8 gMonPalette_Registeel[];
extern const u8 gMonBackPic_Registeel[];
extern const u8 gMonShinyPalette_Registeel[];
extern const u8 gMonIcon_Registeel[];
extern const u8 gMonFootprint_Registeel[];
extern const u8 gMonFrontPic_Kyogre[];
extern const u8 gMonPalette_Kyogre[];
extern const u8 gMonBackPic_Kyogre[];
extern const u8 gMonShinyPalette_Kyogre[];
extern const u8 gMonIcon_Kyogre[];
extern const u8 gMonFootprint_Kyogre[];
extern const u8 gMonFrontPic_Groudon[];
extern const u8 gMonPalette_Groudon[];
extern const u8 gMonBackPic_Groudon[];
extern const u8 gMonShinyPalette_Groudon[];
extern const u8 gMonIcon_Groudon[];
extern const u8 gMonFootprint_Groudon[];
extern const u8 gMonFrontPic_Rayquaza[];
extern const u8 gMonPalette_Rayquaza[];
extern const u8 gMonBackPic_Rayquaza[];
extern const u8 gMonShinyPalette_Rayquaza[];
extern const u8 gMonIcon_Rayquaza[];
extern const u8 gMonFootprint_Rayquaza[];
extern const u8 gMonFrontPic_Latias[];
extern const u8 gMonPalette_Latias[];
extern const u8 gMonBackPic_Latias[];
extern const u8 gMonShinyPalette_Latias[];
extern const u8 gMonIcon_Latias[];
extern const u8 gMonFootprint_Latias[];
extern const u8 gMonFrontPic_Latios[];
extern const u8 gMonPalette_Latios[];
extern const u8 gMonBackPic_Latios[];
extern const u8 gMonShinyPalette_Latios[];
extern const u8 gMonIcon_Latios[];
extern const u8 gMonFootprint_Latios[];
extern const u8 gMonFrontPic_Jirachi[];
extern const u8 gMonPalette_Jirachi[];
extern const u8 gMonBackPic_Jirachi[];
extern const u8 gMonShinyPalette_Jirachi[];
extern const u8 gMonIcon_Jirachi[];
extern const u8 gMonFootprint_Jirachi[];
extern const u8 gMonFrontPic_Deoxys[];
extern const u8 gMonPalette_Deoxys[];
extern const u8 gMonBackPic_Deoxys[];
extern const u8 gMonShinyPalette_Deoxys[];
extern const u8 gMonIcon_Deoxys[];
extern const u8 gMonFootprint_Deoxys[];
extern const u8 gMonFrontPic_Chimecho[];
extern const u8 gMonPalette_Chimecho[];
extern const u8 gMonBackPic_Chimecho[];
extern const u8 gMonShinyPalette_Chimecho[];
extern const u8 gMonIcon_Chimecho[];
extern const u8 gMonFootprint_Chimecho[];
extern const u8 gMonPic_Egg[];
extern const u8 gMonPalette_Egg[];
extern const u8 gMonFrontPic_UnownB[];
extern const u8 gMonBackPic_UnownB[];
extern const u8 gMonIcon_UnownB[];
extern const u8 gMonFrontPic_UnownC[];
extern const u8 gMonBackPic_UnownC[];
extern const u8 gMonIcon_UnownC[];
extern const u8 gMonFrontPic_UnownD[];
extern const u8 gMonBackPic_UnownD[];
extern const u8 gMonIcon_UnownD[];
extern const u8 gMonFrontPic_UnownE[];
extern const u8 gMonBackPic_UnownE[];
extern const u8 gMonIcon_UnownE[];
extern const u8 gMonFrontPic_UnownF[];
extern const u8 gMonBackPic_UnownF[];
extern const u8 gMonIcon_UnownF[];
extern const u8 gMonFrontPic_UnownG[];
extern const u8 gMonBackPic_UnownG[];
extern const u8 gMonIcon_UnownG[];
extern const u8 gMonFrontPic_UnownH[];
extern const u8 gMonBackPic_UnownH[];
extern const u8 gMonIcon_UnownH[];
extern const u8 gMonFrontPic_UnownI[];
extern const u8 gMonBackPic_UnownI[];
extern const u8 gMonIcon_UnownI[];
extern const u8 gMonFrontPic_UnownJ[];
extern const u8 gMonBackPic_UnownJ[];
extern const u8 gMonIcon_UnownJ[];
extern const u8 gMonFrontPic_UnownK[];
extern const u8 gMonBackPic_UnownK[];
extern const u8 gMonIcon_UnownK[];
extern const u8 gMonFrontPic_UnownL[];
extern const u8 gMonBackPic_UnownL[];
extern const u8 gMonIcon_UnownL[];
extern const u8 gMonFrontPic_UnownM[];
extern const u8 gMonBackPic_UnownM[];
extern const u8 gMonIcon_UnownM[];
extern const u8 gMonFrontPic_UnownN[];
extern const u8 gMonBackPic_UnownN[];
extern const u8 gMonIcon_UnownN[];
extern const u8 gMonFrontPic_UnownO[];
extern const u8 gMonBackPic_UnownO[];
extern const u8 gMonIcon_UnownO[];
extern const u8 gMonFrontPic_UnownP[];
extern const u8 gMonBackPic_UnownP[];
extern const u8 gMonIcon_UnownP[];
extern const u8 gMonFrontPic_UnownQ[];
extern const u8 gMonBackPic_UnownQ[];
extern const u8 gMonIcon_UnownQ[];
extern const u8 gMonFrontPic_UnownR[];
extern const u8 gMonBackPic_UnownR[];
extern const u8 gMonIcon_UnownR[];
extern const u8 gMonFrontPic_UnownS[];
extern const u8 gMonBackPic_UnownS[];
extern const u8 gMonIcon_UnownS[];
extern const u8 gMonFrontPic_UnownT[];
extern const u8 gMonBackPic_UnownT[];
extern const u8 gMonIcon_UnownT[];
extern const u8 gMonFrontPic_UnownU[];
extern const u8 gMonBackPic_UnownU[];
extern const u8 gMonIcon_UnownU[];
extern const u8 gMonFrontPic_UnownV[];
extern const u8 gMonBackPic_UnownV[];
extern const u8 gMonIcon_UnownV[];
extern const u8 gMonFrontPic_UnownW[];
extern const u8 gMonBackPic_UnownW[];
extern const u8 gMonIcon_UnownW[];
extern const u8 gMonFrontPic_UnownX[];
extern const u8 gMonBackPic_UnownX[];
extern const u8 gMonIcon_UnownX[];
extern const u8 gMonFrontPic_UnownY[];
extern const u8 gMonBackPic_UnownY[];
extern const u8 gMonIcon_UnownY[];
extern const u8 gMonFrontPic_UnownZ[];
extern const u8 gMonBackPic_UnownZ[];
extern const u8 gMonIcon_UnownZ[];
extern const u8 gMonFrontPic_UnownExclamationMark[];
extern const u8 gMonBackPic_UnownExclamationMark[];
extern const u8 gMonIcon_UnownExclamationMark[];
extern const u8 gMonFrontPic_UnownQuestionMark[];
extern const u8 gMonBackPic_UnownQuestionMark[];
extern const u8 gMonIcon_UnownQuestionMark[];

extern const u8 gMonIcon_QuestionMark[];
extern const u8 gMonIcon_Egg[];
extern const u16 gMonIconPalettes[][16];


extern const u8 gBagMaleTiles[];
extern const u8 gBagFemaleTiles[];
extern const u8 gBagPalette[];
extern const u8 gBagScreen_Gfx[];
extern const u8 gBagScreenMale_Pal[];
extern const u8 gBagScreenFemale_Pal[];
extern const u16 gUnknown_08E77004[];
extern const u8 gBuyMenuFrame_Gfx[];
extern const u8 gMenuMoneyPal[];
extern const u8 gBuyMenuFrame_Tilemap[];
extern const u8 gMenuMoneyGfx[];
extern const u8 gMenuPokeblock_Gfx[];
extern const u8 gMenuPokeblock_Pal[];
extern const u8 gMenuPokeblockDevice_Gfx[];
extern const u8 gMenuPokeblockDevice_Pal[];
extern const u8 gMenuPokeblock_Tilemap[];

extern const u8 gBerryCheck_Gfx[];
extern const u8 gBerryCheck_Pal[];
extern const u8 gUnknown_08E788E4[];
extern const u8 gUnknown_08E78A84[];
extern const u8 gBerryCheckCircle_Gfx[];


extern const u8 gBerryPic_Cheri[];
extern const u8 gBerryPic_Oran[];
extern const u8 gBerryPic_Pecha[];
extern const u8 gBerryPic_Rawst[];
extern const u8 gBerryPic_Aspear[];
extern const u8 gBerryPic_Leppa[];
extern const u8 gBerryPic_Chesto[];
extern const u8 gBerryPic_Persim[];
extern const u8 gBerryPic_Lum[];
extern const u8 gBerryPic_Sitrus[];
extern const u8 gBerryPic_Figy[];
extern const u8 gBerryPic_Wiki[];
extern const u8 gBerryPic_Mago[];
extern const u8 gBerryPic_Aguav[];
extern const u8 gBerryPic_Iapapa[];
extern const u8 gBerryPic_Razz[];
extern const u8 gBerryPic_Bluk[];
extern const u8 gBerryPic_Nanab[];
extern const u8 gBerryPic_Wepear[];
extern const u8 gBerryPic_Pinap[];
extern const u8 gBerryPic_Pomeg[];
extern const u8 gBerryPic_Kelpsy[];
extern const u8 gBerryPic_Qualot[];
extern const u8 gBerryPic_Hondew[];
extern const u8 gBerryPic_Grepa[];
extern const u8 gBerryPic_Tamato[];
extern const u8 gBerryPic_Cornn[];
extern const u8 gBerryPic_Magost[];
extern const u8 gBerryPic_Rabuta[];
extern const u8 gBerryPic_Nomel[];
extern const u8 gBerryPic_Spelon[];
extern const u8 gBerryPic_Pamtre[];
extern const u8 gBerryPic_Watmel[];
extern const u8 gBerryPic_Durin[];
extern const u8 gBerryPic_Belue[];
extern const u8 gBerryPic_Liechi[];
extern const u8 gBerryPic_Ganlon[];
extern const u8 gBerryPic_Salac[];
extern const u8 gBerryPic_Petaya[];
extern const u8 gBerryPic_Apicot[];
extern const u8 gBerryPic_Lansat[];
extern const u8 gBerryPic_Starf[];
extern const u8 gBerryPic_Enigma[];
extern const u8 gBerryPalette_Cheri[];
extern const u8 gBerryPalette_Oran[];
extern const u8 gBerryPalette_Pecha[];
extern const u8 gBerryPalette_Rawst[];
extern const u8 gBerryPalette_Aspear[];
extern const u8 gBerryPalette_Leppa[];
extern const u8 gBerryPalette_Chesto[];
extern const u8 gBerryPalette_Persim[];
extern const u8 gBerryPalette_Lum[];
extern const u8 gBerryPalette_Sitrus[];
extern const u8 gBerryPalette_Figy[];
extern const u8 gBerryPalette_Wiki[];
extern const u8 gBerryPalette_Mago[];
extern const u8 gBerryPalette_Aguav[];
extern const u8 gBerryPalette_Iapapa[];
extern const u8 gBerryPalette_Razz[];
extern const u8 gBerryPalette_Bluk[];
extern const u8 gBerryPalette_Nanab[];
extern const u8 gBerryPalette_Wepear[];
extern const u8 gBerryPalette_Pinap[];
extern const u8 gBerryPalette_Pomeg[];
extern const u8 gBerryPalette_Kelpsy[];
extern const u8 gBerryPalette_Qualot[];
extern const u8 gBerryPalette_Hondew[];
extern const u8 gBerryPalette_Grepa[];
extern const u8 gBerryPalette_Tamato[];
extern const u8 gBerryPalette_Cornn[];
extern const u8 gBerryPalette_Magost[];
extern const u8 gBerryPalette_Rabuta[];
extern const u8 gBerryPalette_Nomel[];
extern const u8 gBerryPalette_Spelon[];
extern const u8 gBerryPalette_Pamtre[];
extern const u8 gBerryPalette_Watmel[];
extern const u8 gBerryPalette_Durin[];
extern const u8 gBerryPalette_Belue[];
extern const u8 gBerryPalette_Liechi[];
extern const u8 gBerryPalette_Ganlon[];
extern const u8 gBerryPalette_Salac[];
extern const u8 gBerryPalette_Petaya[];
extern const u8 gBerryPalette_Apicot[];
extern const u8 gBerryPalette_Lansat[];
extern const u8 gBerryPalette_Starf[];
extern const u8 gBerryPalette_Enigma[];

extern const u8 gUnknown_08E96EC8[];

extern const u8 gMenuTrainerCard_Gfx[];
extern const u16 gMenuTrainerCard0Star_Pal[];
extern const u16 gMenuTrainerCard1Star_Pal[];
extern const u16 gMenuTrainerCard2Star_Pal[];
extern const u16 gMenuTrainerCard3Star_Pal[];
extern const u16 gMenuTrainerCard4Star_Pal[];
extern const u8 gUnknown_08E8CAC0[];
extern const u8 gUnknown_08E8CFC0[];
extern const u8 gUnknown_08E8D4C0[];
extern const u8 gUnknown_08E8D9C0[];

extern const u8 gUnknown_08EA1DEC[];
extern const u16 gUnknown_08EA0328[];
extern const u16 gUnknown_08EA02C8[];
extern const u16 gUnknown_08EA0348[];
extern const u16 gUnknown_08EA15C8[];
extern const u16 gTradeMonBoxTilemap[];
extern const u8 gUnknown_08D00000[];
extern const u16 gUnknown_08D00524[];
extern const u8 gUnknown_08D004E0[];
# 13 "src/engine/trade.c" 2
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
# 14 "src/engine/trade.c" 2
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
# 15 "src/engine/trade.c" 2
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
# 16 "src/engine/trade.c" 2
# 1 "include/text_window.h" 1





struct FrameGraphics
{
    const u8 *tiles;
    const u16 *palette;
};

u16 SetTextWindowBaseTileNum(u16 baseTileNum);
void LoadTextWindowGraphics(struct Window *win);
void LoadTextWindowGraphics_OverridePalSlot(struct Window *win, u8 palSlot);
void LoadTextWindowGraphics_OverrideFrameType(struct Window *win, u8 frameType);
void DrawTextWindow(struct Window *win, u8 left, u8 top, u8 right, u8 bottom);
const struct FrameGraphics *GetTextWindowFrameGraphics(u8 frameType);
u16 SetMessageBoxBaseTileNum(u16 baseTileNum);
void unref_sub_80651DC(struct Window *, u8 *);
void DisplayMessageBox(struct Window *);
void DrawStandardMessageBox(struct Window *win);
void LoadMessageBoxTiles(struct Window *win);
void ClearStandardMessageBox(struct Window *win);
# 17 "src/engine/trade.c" 2
# 1 "include/pokemon_icon.h" 1



u8 CreateMonIcon(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority, u32 personality);
u8 UpdateMonIconFrame(struct Sprite *sprite);
u8 sub_809D3A4(u16 arg0, void (*)(struct Sprite *), int, u8 arg3, u32 arg4);
u16 GetUnownLetterByPersonality(u32);
u16 sub_809D4A8(u16);
void sub_809D510(struct Sprite *);
void sub_809D51C(void);
void sub_809D580(u16);
void sub_809D608(u16);
void sub_809D62C(struct Sprite *sprite);
void sub_809D824(struct Sprite *sprite, u8 animNum);
# 18 "src/engine/trade.c" 2
# 1 "include/cable_club.h" 1





void sub_808347C(u8 arg0);
void sub_80834E4(void);
void sub_808350C(void);
void sub_80835D8(void);
void sub_8083614(void);
void sub_808363C(void);
u8 sub_8083664(void);
void sub_8083820(void);
void sub_80839A4(void);
void sub_80839D0(void);
void sub_8083A84(TaskFunc followupFunc);
void sub_8083B5C(void);
void sub_8083B80(void);
void sub_8083B90(void);
void sub_8083BDC(void);
bool32 sub_8083BF4(u8 linkPlayerIndex);
void sub_8083C50(u8 taskId);
# 19 "src/engine/trade.c" 2
# 1 "include/party_menu.h" 1



# 1 "include/menu.h" 1
# 5 "include/party_menu.h" 2



enum
{
    PARTY_MENU_TYPE_STANDARD,
    PARTY_MENU_TYPE_BATTLE,
    PARTY_MENU_TYPE_CONTEST,
    PARTY_MENU_TYPE_IN_GAME_TRADE,
    PARTY_MENU_TYPE_BATTLE_TOWER,
    PARTY_MENU_TYPE_LINK_MULTI_BATTLE,
    PARTY_MENU_TYPE_DAYCARE,
    PARTY_MENU_TYPE_MOVE_TUTOR,
};


enum
{
    PARTY_MENU_LAYOUT_STANDARD,
    PARTY_MENU_LAYOUT_DOUBLE_BATTLE,
    PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE,
    PARTY_MENU_LAYOUT_MULTI_BATTLE,
};

struct PartyPopupMenu
{
           u8 numChoices;
           u8 width;
           const u8 *items;
};



struct Unk201B000
{
    struct Pokemon unk0[6];
    u8 menuType;
    u8 promptTextId;
    u8 filler25A[2];
    TaskFunc menuHandler;
    u8 menuHandlerTaskId;
    u8 unk261;
    u8 unk262;
    u8 unk263;

    s16 statGrowths[6 * 2];
    u8 filler27C[2];
    s16 unk27E;
    s16 unk280;
    s16 unk282;
};

struct Struct201B000
{
    u8 filler0[0x259];
    u8 promptTextId;
    u8 filler25A[6];
    u8 menuHandlerTaskId;
    u8 unk261;
    u8 unk262;
    s16 setupState;
    s16 monIndex;
    s16 unk268;
    u8 filler26A[8];
    u16 unk272;
    u8 filler274[14];
    u16 unk282;
};

struct Unk2001000
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    s16 unk8;
    s16 unkA;
    TaskFunc unkC;
    u16 array[53561];
};

struct UnknownPokemonStruct2
{
             u16 species;
             u16 heldItem;
             u8 nickname[11];
             u8 level;
             u16 hp;
             u16 maxhp;
             u32 status;
             u32 personality;
             u8 gender;
             u8 language;
};

void CB2_PartyMenuMain(void);
void ChangeBattleTowerPartyMenuSelection(u8 taskId, s8 directionPressed);
void SetPartyMenuSettings(u8 menuType, u8 battleTypeFlags, TaskFunc menuHandlerFunc, u8 textId);
void OpenPartyMenu(u8 menuType, u8 battleFlags);
bool8 InitPartyMenu(void);
bool8 IsLinkDoubleBattle(void);
u8 DrawPartyMonBackground(u8);
void sub_806B908(void);
void sub_806BC3C(u8, u8);
void sub_806BCE8(void);
u8 sub_806BD58(u8, u8);
u8 sub_806BD58(u8, u8);
u16 HandleDefaultPartyMenuInput(u8 taskId);
u16 HandleBattleTowerPartyMenuInput(u8 taskId);
void task_pc_turn_off(const u8 *a, u8 b);
void ChangePartyMenuSelection(u8 taskId, s8 directionPressed);
void SelectBattleTowerOKButton(u8 taskId);
void sub_806C994(u8 taskId, u8 b);
u8 sub_806CA38(u8 taskID);
void HandlePartyMenuSwitchPokemonInput(u8 taskId);
void sub_806CCE4(void);
void sub_806CD44(u8 taskId);
void sub_806D3B4(u8 taskId, u16 species1, u16 species2);
void sub_806D4AC(u8 taskId, u16 species, u8 c);
void sub_806D50C(u8 taskId, u8 monIndex);
void PrintPartyMenuPromptText(u8 textId, u8 b);
void sub_806D5A4(void);
void SetMonIconAnim(u8 spriteId, struct Pokemon *pokemon);
void CreatePartyMenuMonIcon(u8 taskId, u8 monIndex, u8 c, struct Pokemon *pokemon);
void TryCreatePartyMenuMonIcon(u8 a, u8 monIndex, struct Pokemon *pokemon);
void LoadHeldItemIconGraphics(void);
void PartyMenuTryGiveMonHeldItem(u8 taskId, u16 newItem, TaskFunc c);
void SetMonIconSpriteId(u8 taskId, u8 monIndex, u8 spriteId);
void CreateHeldItemIcon_806DCD4(u8 taskId, u8 monIndex, u16 item);
void CreateHeldItemIcons_806DC34(u8 taskId);
void CreateHeldItemIcons(u8 *a, u8 *b, u8 c);
void SetHeldItemIconVisibility(u8 a, u8 monIndex);
void PartyMenuDoPrintMonNickname(u8 monIndex, int b, const u8 *nameBuffer);
void PrintPartyMenuMonNickname(u8 monIndex, u8 b, struct Pokemon *pokemon);
void PrintPartyMenuMonNicknames(void);
void CreateMonIcon_LinkMultiBattle(u8 taskId, u8 monIndex, u8 menuType, struct UnknownPokemonStruct2 *pokemon);
u8 *GetMonNickname(struct Pokemon *pokemon, u8 *stringBuffer);
void PartyMenuPutStatusTilemap(u8 monIndex, u8 b, u8 status);
void PartyMenuDoPrintLevel(u8 monIndex, u8 b, u8 level);
void PartyMenuPrintLevel(u8 monIndex, u8 b, struct Pokemon *pokemon);
void PartyMenuPrintMonLevelOrStatus(u8 monIndex, struct Pokemon *pokemon);
void PartyMenuPrintMonsLevelOrStatus(void);
void PartyMenuDoPrintGenderIcon(u16 species, u8 gender, u8 c, u8 monIndex, u8 *nickname);
void PartyMenuPrintGenderIcon(u8 monIndex, u8 b, struct Pokemon *pokemon);
void PartyMenuDoPrintHP(u8 monIndex, u8 b, u16 currentHP, u16 maxHP);
void PartyMenuTryPrintMonsHP(void);
void nullsub_13(void);
void PartyMenuDoDrawHPBar(u8 monIndex, u8 b, u16 currentHP, u16 maxHP);
void PartyMenuDrawHPBar(u8 monIndex, u8 b, struct Pokemon *pokemon);
void PartyMenuTryDrawHPBar(u8 monIndex, struct Pokemon *pokemon);
void PartyMenuDrawHPBars(void);
void SwapPokemon(struct Pokemon *a, struct Pokemon *b);
void SetPartyPopupMenuOffsets(u8 menuIndex, u8 *left, u8 *top, const struct PartyPopupMenu *menu);
void ShowPartyPopupMenu(u8 menuIndex, const struct PartyPopupMenu *menu, const struct MenuAction2 *menuActions, u8 cursorPos);
void ClosePartyPopupMenu(u8 index, const struct PartyPopupMenu *menu);
TaskFunc PartyMenuGetPopupMenuFunc(u8 menuIndex, const struct PartyPopupMenu *menus, const struct MenuAction2 *menuActions, u8 itemIndex);
u8 sub_806E834(const u8 *message, u8 arg1);
void sub_806E8D0(u8 taskId, u16 b, TaskFunc c);
void party_menu_link_mon_held_item_object(u8);
void Task_ConfirmGiveHeldItem(u8);
void DisplayGiveHeldItemMessage(u8, u16, u8);
void DisplayTakeHeldItemMessage(u8, u16, u8);
void Task_ConfirmTakeHeldMail(u8);
u16 ItemIdToBattleMoveId(u16);
bool8 pokemon_has_move(struct Pokemon *, u16);
void TeachMonTMMove(u8, u16, TaskFunc);
void Task_TeamMonTMMove(u8);
void Task_TeamMonTMMove2(u8);
void Task_TeamMonTMMove3(u8);
void Task_TeamMonTMMove4(u8);
void sub_806F358(u8);
void sub_806F390(u8);
void sub_806F44C(u8);
void TMMoveUpdateMoveSlot(u8);
void StopTryingToTeachMove_806F614(u8);
void StopTryingToTeachMove_806F67C(u8);
void StopTryingToTeachMove_806F6B4(u8);
void sub_806F8AC(u8 taskId);
void sub_806FA18(u8 taskId);
void sub_806FB0C(u8 taskId);
void sub_806FB44(u8);
void PartyMenuUpdateLevelOrStatus(struct Pokemon *, u8);
void GetMedicineItemEffectMessage(u16);
bool8 ExecuteTableBasedItemEffect__(u8, u16, u8);
void UseMedicine(u8, u16, TaskFunc);
bool8 IsBlueYellowRedFlute(u16);
void sub_8070048(u8, u16, TaskFunc);
void sub_8070088(u8);
void sub_80701DC(u8 taskId);
void DoPPRecoveryItemEffect(u8, u16, TaskFunc);
void DoRecoverPP(u8);
void DoPPUpItemEffect(u8, u16, TaskFunc);
void DoRareCandyItemEffect(u8, u16, TaskFunc);
void Task_RareCandy1(u8);
void Task_RareCandy2(u8);
void PrintStatGrowthsInLevelUpWindow(u8 taskId);
void PrintNewStatsInLevelUpWindow(u8 taskId);
void RedrawPokemonInfoInMenu(u8, struct Pokemon *);
void Task_RareCandy3(u8);
void TeachMonMoveInPartyMenu(u8);
void DoEvolutionStoneItemEffect(u8 taskId, u16 evolutionStoneItem, TaskFunc c);
u8 GetItemEffectType(u16 item);
void SetupDefaultPartyMenuSwitchPokemon(u8 taskId);
void sub_806CD5C(u8 taskId);
void DoTakeMail(u8 taskId, TaskFunc func);
void PartyMenuTryGiveMonHeldItem_806ECE8(u8 taskId, TaskFunc func);
void PartyMenuTryGiveMonMail(u8 taskId, TaskFunc func);
void sub_806D668(u8 monIndex);
void TaughtMove(u8 taskId);
void StopTryingToTeachMove_806F588(u8 taskId);
# 20 "src/engine/trade.c" 2
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
# 21 "src/engine/trade.c" 2
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
# 22 "src/engine/trade.c" 2
# 1 "include/data2.h" 1





struct UnknownTaskStruct;

struct MonCoords
{


    u8 coords;
    u8 y_offset;
};

extern const struct OamData gOamData_81F96F0;
extern const struct OamData gOamData_81F96E8;
extern const struct SpriteFrameImage gSpriteImageTable_81E7A10[];
extern const struct SpriteFrameImage gSpriteImageTable_81E7A30[];
extern const struct SpriteFrameImage gSpriteImageTable_81E7A50[];
extern const struct SpriteFrameImage gSpriteImageTable_81E7A70[];
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_81E7B70[];
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_81E7BEC[];

extern const union AffineAnimCmd *const gSpriteAffineAnimTable_81E7C18;
extern const union AnimCmd *const gSpriteAnimTable_81E7C64[];
extern struct MonCoords gMonFrontPicCoords[];
extern struct MonCoords gMonBackPicCoords[];
extern struct CompressedSpriteSheet gMonFrontPicTable[];
extern struct CompressedSpriteSheet gMonBackPicTable[];
extern const struct CompressedSpritePalette gMonPaletteTable[];
extern const struct CompressedSpritePalette gMonShinyPaletteTable[];
extern const union AnimCmd *const *const gUnknown_081EC2A4[];
extern const union AnimCmd *const *const gUnknown_081ECACC[];
extern struct MonCoords gTrainerBackPicCoords[];
extern struct CompressedSpriteSheet gTrainerBackPicTable[];
extern const struct CompressedSpritePalette gTrainerBackPicPaletteTable[];
extern u8 gEnemyMonElevation[];
extern const u8 gTrainerClassNames[][16];
extern const struct Trainer gTrainers[];
extern u8 gSpeciesNames[][11];
extern const u8 gMoveNames[][15];
extern const u8 gAbilityNames[][13];
extern const u8 gTypeNames[][7];
extern const struct UnknownTaskStruct gUnknown_081F9674;
extern const u8 gUnknown_081F96C8[];
extern struct CompressedSpriteSheet gUnknown_081FAEA4;
extern struct CompressedSpritePalette gUnknown_081FAEAC;
extern const struct SpriteTemplate gSpriteTemplate_81FAF0C;
extern void *const gUnknown_081FAF4C[];
extern struct BattleMove gBattleMoves[];


extern const struct MonCoords gTrainerFrontPicCoords[];


extern const struct CompressedSpriteSheet gTrainerFrontPicTable[];


extern const struct CompressedSpritePalette gTrainerFrontPicPaletteTable[];
# 23 "src/engine/trade.c" 2
# 1 "include/pokemon_summary_screen.h" 1



extern const u8 *const gNatureNames[];

void ShowPokemonSummaryScreen(struct Pokemon *, u8, u8, void (*)(void), int);
void sub_809D9F0(struct Pokemon *party, u8, u8, void *, u32);
void sub_809D9F0(struct Pokemon *, u8, u8, void *, u32);
u8 sub_809FA30(void);
u8 pokemon_ailments_get_primary(u32);
u8 GetMonStatusAndPokerus();
u8 *sub_80A1E9C(u8 *dest, const u8 *src, u8);
u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level);
u8 PokemonSummaryScreen_CheckOT(struct Pokemon *pokemon);
bool8 CheckPartyPokerus(struct Pokemon *, u8);
# 24 "src/engine/trade.c" 2
# 1 "include/overworld.h" 1





struct UnkPlayerStruct
{
    u8 player_field_0;
    u8 player_field_1;
};

struct LinkPlayerMapObject
{
    u8 active;
    u8 linkPlayerId;
    u8 mapObjId;
    u8 mode;
};

struct UCoords32
{
    u32 x, y;
};

extern const struct UCoords32 gUnknown_0821664C[];
extern void (*gFieldCallback)(void);


void Overworld_ResetStateAfterFly(void);
void Overworld_ResetStateAfterTeleport(void);
void Overworld_ResetStateAfterDigEscRope(void);
void Overworld_ResetStateAfterWhiteOut(void);

void ResetGameStats(void);
void IncrementGameStat(u8 index);
u32 GetGameStat(u8 index);
void SetGameStat(u8, u32);


void Overworld_SetMapObjTemplateCoords(u8, s16, s16);
void Overworld_SetMapObjTemplateMovementType(u8, u8);





struct MapHeader * const Overworld_GetMapHeaderByGroupAndId(u16 mapGroup, u16 mapNum);
struct MapHeader * const warp1_get_mapheader(void);



void warp_in(void);
void Overworld_SetWarpDestination(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void warp1_set_2(s8 mapGroup, s8 mapNum, s8 warpId);
void saved_warp2_set(int unused, s8 mapGroup, s8 mapNum, s8 warpId);
void saved_warp2_set_2(int unused, s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void copy_saved_warp2_bank_and_enter_x_to_warp1(u8 unused);
void sub_8053538(u8);
void Overworld_SetWarpDestToLastHealLoc(void);
void Overworld_SetHealLocationWarp(u8);
void sub_80535C4(s16 a1, s16 a2);
void sub_805363C(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void sub_8053678(void);
void sub_8053690(s8, s8, s8, s8, s8);

void sub_80536E4(s8, s8, s8, s8, s8);
void sub_8053720(s16, s16);


void sub_80537CC(u8);
void gpu_sync_bg_hide();


bool8 sub_80538B0(u16 x, u16 y);
bool8 sub_80538D0(u16 x, u16 y);
void sub_80538F0(u8 mapGroup, u8 mapNum);

void player_avatar_init_params_reset(void);
void walkrun_find_lowest_active_bit_in_bitfield(void);

u8 sub_8053B00(struct UnkPlayerStruct *playerStruct, u16 a2, u8 a3);
u8 sub_8053B60(struct UnkPlayerStruct *playerStruct, u8, u16, u8);
u16 cur_mapdata_block_role_at_screen_center_acc_to_sav1(void);
bool32 Overworld_IsBikingAllowed(void);
void SetDefaultFlashLevel(void);
void Overworld_SetFlashLevel(s32 a1);
u8 Overworld_GetFlashLevel(void);
void sub_8053D14(u16);






void Overworld_PlaySpecialMapMusic(void);
void Overworld_SetSavedMusic(u16);
void Overworld_ClearSavedMusic(void);
void sub_8053F0C(void);
void Overworld_ChangeMusicToDefault(void);
void Overworld_ChangeMusicTo(u16);

void sub_8053FF8(void);
bool8 sub_8054034(void);
void Overworld_FadeOutMapMusic(void);

void UpdateAmbientCry(s16 *, u16 *);
void ChooseAmbientCrySpecies(void);
u8 GetMapTypeByGroupAndId(s8 mapGroup, s8 mapNum);

u8 Overworld_GetMapTypeOfSaveblockLocation(void);
u8 get_map_type_from_warp0(void);
bool8 is_map_type_1_2_3_5_or_6(u8 a1);
bool8 Overworld_MapTypeAllowsTeleportAndFly(u8 a1);
u8 Overworld_MapTypeIsIndoors(u8);

u8 sav1_map_get_name();


bool32 is_c1_link_related_active(void);



void CB2_OverworldBasic(void);
void c2_overworld(void);



void CB2_NewGame(void);
void CB2_WhiteOut(void);
void CB2_LoadMap(void);
void CB2_LoadMap2(void);
void sub_8054534(void);
void sub_8054588(void);
void c2_80567AC(void);
void c2_exit_to_overworld_2_switch(void);
void c2_exit_to_overworld_2_local(void);
void c2_exit_to_overworld_2_link(void);

void sub_805469C(void);

void c2_exit_to_overworld_1_continue_scripts_restart_music(void);
void sub_80546F0(void);

void CB2_ContinueSavedGame(void);
void FieldClearVBlankHBlankCallbacks(void);
void SetFieldVBlankCallback(void);
void VBlankCB_Field(void);

bool32 sub_805483C(u8 *);
bool32 sub_805493C(u8 *, u32);
bool32 sub_8054A4C(u8 *);
bool32 sub_8054A9C(u8 *a1);
void do_load_map_stuff_loop(u8 *a1);
void sub_8054BA8(void);
void sub_8054C2C(void);
void sub_8054C54(void);
void sub_8054D4C(u32 a1);
void sub_8054D90(void);
void mli4_mapscripts_and_other(void);
void sub_8054E20(void);
void sub_8054E34(void);
void sub_8054E60(void);
void sub_8054E7C(void);
void sub_8054E98(void);
void sub_8054EC8(void);
void sub_8054F48(void);
void sub_8054F70(void);






u16 sub_805530C(u16);
void sub_8055340(u16 *);
void sub_8055354(void);
u16 sub_8055390(u32);

u16 sub_80553E4(u32);
u16 sub_8055408(u32);
u16 sub_8055438(u32);
# 191 "include/overworld.h"
u16 sub_8055588(void);

void sub_80555B0(int linkPlayerId, int a2, struct UnkStruct_8054FF8 *a3);
bool32 sub_8055618(struct UnkStruct_8054FF8 *);
bool32 sub_8055630(struct UnkStruct_8054FF8 *);
u8 *sub_8055648(struct UnkStruct_8054FF8 *);
bool32 sub_8055660(struct UnkStruct_8054FF8 *);
u8 *sub_805568C(struct UnkStruct_8054FF8 *);
u16 sub_8055758(u8 *);
void sub_80557E8(void);
void sub_80557F4(void);
void sub_8055808(u8 *);
void sub_8055824(void);
void sub_8055840(u8 *);
void sub_805585C(void);
bool32 sub_8055870(void);
u32 sub_80558AC(void);
u32 sub_8055910(void);
u32 sub_8055940(void);

void strange_npc_table_clear(void);

void SpawnLinkPlayerMapObject(u8, s16, s16, u8);
void InitLinkPlayerMapObjectPos(struct MapObject *, s16, s16);


u8 sub_8055AE8(u8);
void sub_8055B08(u8, u16 *, u16 *);
u8 sub_8055B30(u8);
u8 sub_8055B50(u8);

u8 GetLinkPlayerIdAt(s16, s16);
void sub_8055BFC(u8, u8);
# 232 "include/overworld.h"
u8 npc_something3(u8, u8);
u8 LinkPlayerDetectCollision(u8, u8, s16, s16);
void CreateLinkPlayerSprite(u8);
void SpriteCB_LinkPlayer(struct Sprite *);
void sub_805465C(void);
# 25 "src/engine/trade.c" 2
# 1 "include/rom_8077ABC.h" 1






enum
{
    ANIM_BANK_ATK,
    ANIM_BANK_DEF,
    ANIM_BANK_ATK_PARTNER,
    ANIM_BANK_DEF_PARTNER
};

u8 sub_8077ABC(u8, u8);
u8 sub_8077E44(u8 slot, u16 species, u8 a3);
u8 GetAnimBankSpriteId(u8 side);
void StoreSpriteCallbackInData(struct Sprite *sprite, void(*callback)(struct Sprite *));
void sub_8078314(struct Sprite *sprite);
void sub_8078364(struct Sprite *sprite);
void sub_8078458(struct Sprite *sprite);
void sub_80784A8(struct Sprite *sprite);
u8 GetBankSide(u8);
u8 GetBankSide(u8);
u8 GetBankSide(u8 side);
u8 GetBankSide(u8 slot);
u8 GetBankSide(u8);
u8 GetBankIdentity(u8);
u8 GetBankIdentity(u8 slot);
u8 GetBankByPlayerAI(u8);
u8 GetBankByPlayerAI(u8);
u8 GetBankByPlayerAI(u8 state);
u8 AnimBankSpriteExists(u8);
bool8 AnimBankSpriteExists(u8);
bool8 IsDoubleBattle();
u8 IsDoubleBattle(void);
bool8 IsDoubleBattle(void);
void sub_8078914();
u8 sub_80789BC();
void sub_8078A5C(struct Sprite *sprite);
void sub_8078A5C(struct Sprite *sprite);
void obj_translate_based_on_private_1_2_3_4(struct Sprite *sprite);
bool8 sub_8078B5C(struct Sprite *sprite);
void sub_8078BB8(struct Sprite *sprite);
void sub_8078D44(struct Sprite *sprite);
void obj_id_set_rotscale(u8 sprite, s16, s16, u16);
bool8 sub_8078E38();
void sub_8078E70(u8 sprite, u8);
void sub_8078F40(u8 sprite);
void sub_8078F9C(u8 sprite);
void sub_8079518(struct Sprite *sprite);
void sub_80796F8(u8 task);
void sub_80797EC(struct Task *task);
void sub_8079814(u8 taskId);
void sub_8079A64(u8 sprite);
u16 sub_8079B10(u8 sprite);
void sub_8079BF4(s16 *bottom, s16 *top, void *ptr);
void *sub_8079BFC(s16 bottom, s16 top);
void sub_8079E24();
u8 sub_8079E90(u8 slot);
u8 GetBankIdentity_permutated(u8 slot);
void sub_807A784(u8 taskId);
void sub_807A850(struct Task *task, u8 taskId);
void sub_807A8D4(struct Sprite *sprite);
void sub_807A960(struct Sprite *sprite);
void sub_8078A34(struct Sprite *sprite);
void sub_80787B0(struct Sprite *sprite, u8);
void sub_8078764(struct Sprite *sprite, u8);
void sub_8078B34(struct Sprite *sprite);
void sub_8078D60(struct Sprite *sprite);
void sub_80786EC(struct Sprite *sprite);
void sub_80782D8(struct Sprite *sprite);
void sub_8078CC0(struct Sprite *sprite);
void sub_8078600(struct Sprite *sprite);
void sub_8078504(struct Sprite *sprite);
void sub_807861C(struct Sprite *sprite);
void sub_8078650(struct Sprite *sprite);
void sub_8078394(struct Sprite *sprite);
void sub_80785E4(struct Sprite *sprite);
void sub_8078278(struct Sprite *sprite);
void sub_8078C00(struct Sprite *sprite);
void sub_8078114(struct Sprite *sprite);
void sub_80793C4(struct Sprite *sprite);
void sub_807A3FC(u8 slot, u8 a2, s16 *a3, s16 *a4);
u8 sub_8079ED4(u8 slot);
int sub_807A100(u8 slot, u8 a2);
u16 sub_80790F0(s16 a, s16 b);
void sub_8078FDC(struct Sprite *sprite, bool8 a2, s16 xScale, s16 yScale, u16 rotation);
void sub_807867C(struct Sprite *sprite, s16 a2);
u8 sub_8077EE4(u8 slot, u8 a2);
u32 sub_80791A8(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7);
u32 sub_80792C0(u8 a1, u8 a2, u8 a3, u8 a4);
s16 duplicate_obj_of_side_rel2move_in_transparent_mode(u8 a1);
void obj_delete_but_dont_free_vram(struct Sprite *sprite);
void sub_8079108(u16 a1, bool8 a2);
void sub_80798F4(struct Task *task, u8 a2, void *a3);
bool8 sub_807992C(struct Task *task);
u8 sub_8077FC0(u8 slot);
void move_anim_8074EE0(struct Sprite *sprite);
bool8 sub_8078718(struct Sprite *sprite);
bool8 sub_8078CE8(struct Sprite *sprite);
# 26 "src/engine/trade.c" 2
# 1 "include/daycare.h" 1



u8 *GetMonNick(struct Pokemon *, u8 *);
u8 *GetBoxMonNick(struct BoxPokemon *, u8 *);
u8 CountPokemonInDaycare(struct DayCare *);
void InitDaycareMailRecordMixing(struct BoxPokemon *, struct RecordMixingDayCareMail *);
void Debug_AddDaycareSteps(u16 i);
u16 GetEggSpecies(u16);
void TriggerPendingDaycareEgg(void);
void TriggerPendingDaycareMaleEgg(void);
void CreateEgg(struct Pokemon *mon, u16, u8);
u8 ShouldEggHatch(void);
u8 GetDaycareCompatibilityScoreFromSave(void);
bool8 NameHasGenderSymbol(const u8 *, u8);
# 27 "src/engine/trade.c" 2
# 1 "include/event_data.h" 1



# 1 "include/flags.h" 1
# 94 "include/flags.h"
bool8 FlagGet(u16 flag);
# 5 "include/event_data.h" 2
# 1 "include/vars.h" 1
# 6 "include/event_data.h" 2

void InitEventData(void);
void ClearTempFieldEventData(void);
void ClearUpperFlags(void);
void DisableNationalPokedex(void);
void EnableNationalPokedex(void);
bool32 IsNationalPokedexEnabled(void);
void DisableMysteryGift(void);
void EnableMysteryGift(void);
bool32 IsMysteryGiftEnabled(void);
void DisableResetRTC(void);
void EnableResetRTC(void);
bool32 CanResetRTC(void);
u16 *GetVarPointer(u16 id);
u16 VarGet(u16 id);
bool8 VarSet(u16 id, u16 value);
u8 VarGetFieldObjectGraphicsId(u8 id);
u8 *GetFlagPointer(u16 id);
u8 FlagSet(u16 id);
u8 FlagClear(u16 id);
bool8 FlagGet(u16 id);

extern u16 gSpecialVar_0x8000;
extern u16 gSpecialVar_0x8001;
extern u16 gSpecialVar_0x8002;
extern u16 gSpecialVar_0x8003;
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;
extern u16 gSpecialVar_0x8007;
extern u16 gSpecialVar_0x8008;
extern u16 gSpecialVar_0x8009;
extern u16 gSpecialVar_0x800A;
extern u16 gSpecialVar_0x800B;
extern u16 gScriptResult;
extern u16 gScriptLastTalked;
extern u16 gScriptFacing;
# 28 "src/engine/trade.c" 2
# 1 "include/strings.h" 1




extern const u8 gExpandedPlaceholder_Empty[];
extern const u8 gExpandedPlaceholder_Kun[];
extern const u8 gExpandedPlaceholder_Chan[];
extern const u8 gExpandedPlaceholder_Sapphire[];
extern const u8 gExpandedPlaceholder_Ruby[];
extern const u8 gExpandedPlaceholder_Aqua[];
extern const u8 gExpandedPlaceholder_Magma[];
extern const u8 gExpandedPlaceholder_Archie[];
extern const u8 gExpandedPlaceholder_Maxie[];
extern const u8 gExpandedPlaceholder_Kyogre[];
extern const u8 gExpandedPlaceholder_Groudon[];
extern const u8 gExpandedPlaceholder_Brendan[];
extern const u8 gExpandedPlaceholder_May[];
extern const u8 gExpandedPlaceholder_Brother[];
extern const u8 gExpandedPlaceholder_Sister[];
extern const u8 gExpandedPlaceholder_Brother2[];
extern const u8 gExpandedPlaceholder_Sister2[];


extern const u8 gSystemText_Egg[];
extern const u8 gSystemText_Pokemon2[];


extern const u8 gMainMenuString_NewGame[];
extern const u8 gMainMenuString_Continue[];
extern const u8 gMainMenuString_Option[];
extern const u8 gMainMenuString_MysteryEvents[];


extern const u8 SystemText_UpdatingSaveExternal[];
extern const u8 SystemText_SaveUpdated[];
extern const u8 SystemText_SaveUpdatedExchangeBackup[];
extern const u8 SystemText_SaveNotUpdated[];


extern const u8 gSaveFileCorruptMessage[];
extern const u8 gSaveFileDeletedMessage[];


extern const u8 gBoardNotInstalledMessage[];
extern const u8 gBatteryDryMessage[];


extern const u8 gMainMenuString_Player[];
extern const u8 gMainMenuString_Pokedex[];
extern const u8 gMainMenuString_Time[];
extern const u8 gMainMenuString_Badges[];


extern const u8 gBirchText_Boy[];
extern const u8 gBirchText_Girl[];
extern const u8 gBirchText_NewName[];

extern const u8 gDefaultBoyName1[];
extern const u8 gDefaultBoyName2[];
extern const u8 gDefaultBoyName3[];
extern const u8 gDefaultBoyName4[];

extern const u8 gDefaultGirlName1[];
extern const u8 gDefaultGirlName2[];
extern const u8 gDefaultGirlName3[];
extern const u8 gDefaultGirlName4[];

extern const u8 gSystemText_IntroWeCall[];
extern const u8 gSystemText_NewPara[];

extern const u8 gDexText_UnknownPoke[];
extern const u8 gDexText_UnknownHeight[];
extern const u8 gDexText_UnknownWeight[];
extern const u8 gDexText_CryOf[];
extern const u8 gDexText_SizeComparedTo[];
extern const u8 gDexText_RegisterComplete[];
extern const u8 gDexText_Searching[];
extern const u8 gDexText_SearchComplete[];
extern const u8 gDexText_NoMatching[];

extern const u8 DexText_SearchForPoke[];
extern const u8 DexText_SwitchDex[];
extern const u8 DexText_ReturnToDex[];
extern const u8 DexText_SelectDexMode[];
extern const u8 DexText_SelectDexList[];
extern const u8 DexText_ListByABC[];
extern const u8 DexText_ListByColor[];
extern const u8 DexText_ListByType[];
extern const u8 DexText_ExecuteSearchSwitch[];
extern const u8 DexText_HoennDex[];
extern const u8 DexText_NationalDex[];
extern const u8 DexText_NumericalMode[];
extern const u8 DexText_ABCMode[];
extern const u8 DexText_HeaviestMode[];
extern const u8 DexText_LightestMode[];
extern const u8 DexText_TallestMode[];
extern const u8 DexText_SmallestMode[];
extern const u8 DexText_ABC[];
extern const u8 DexText_DEF[];
extern const u8 DexText_GHI[];
extern const u8 DexText_JKL[];
extern const u8 DexText_MNO[];
extern const u8 DexText_PQR[];
extern const u8 DexText_STU[];
extern const u8 DexText_VWX[];
extern const u8 DexText_YZ[];
extern const u8 DexText_Red[];
extern const u8 DexText_Blue[];
extern const u8 DexText_Yellow[];
extern const u8 DexText_Green[];
extern const u8 DexText_Black[];
extern const u8 DexText_Brown[];
extern const u8 DexText_Purple[];
extern const u8 DexText_Gray[];
extern const u8 DexText_White[];
extern const u8 DexText_Pink[];
extern const u8 DexText_HoennDex2[];
extern const u8 DexText_NationalDex2[];
extern const u8 DexText_ListByNumber[];
extern const u8 DexText_ListByABC2[];
extern const u8 DexText_ListByHeavyToLightest[];
extern const u8 DexText_ListByLightToHeaviest[];
extern const u8 DexText_ListByTallToSmallest[];
extern const u8 DexText_ListBySmallToTallest[];
extern const u8 DexText_Terminator5[];
extern const u8 DexText_DontSpecify[];
extern const u8 DexText_None[];
extern const u8 DexText_RightPointingTriangle[];
extern const u8 DexText_Terminator6[];

extern const u8 gMenuText_WelcomeToHOFAndDexRating[];
extern const u8 gMenuText_HOFSaving[];
extern const u8 gMenuText_HOFCorrupt[];
extern const u8 gMenuText_HOFNumber[];
extern const u8 gMenuText_HOFCongratulations[];

extern const u8 gOtherText_Number2[];
extern const u8 gOtherText_Level3[];
extern const u8 gOtherText_IDNumber[];
extern const u8 gOtherText_Name[];
extern const u8 gOtherText_IDNumber2[];
extern const u8 gOtherText_BirchInTrouble[];
extern const u8 gOtherText_DoYouChoosePoke[];
extern const u8 gOtherText_Poke[];

extern const u8 gSystemText_SaveErrorExchangeBackup[];
extern const u8 gOtherText_FlyToWhere[];

extern const u8 OtherText_Use[];
extern const u8 OtherText_Toss[];
extern const u8 OtherText_Register[];
extern const u8 OtherText_Give2[];
extern const u8 OtherText_CheckTag[];
extern const u8 OtherText_Confirm[];
extern const u8 gOtherText_Walk[];

extern const u8 gUnknownText_Exit[];
extern const u8 gOtherText_CancelNoTerminator[];
extern const u8 gOtherText_CancelNoTerminator2[];
extern const u8 gOtherText_CancelWithTerminator[];

extern const u8 OtherText_Item[];
extern const u8 OtherText_Mail[];
extern const u8 OtherText_Take2[];
extern const u8 OtherText_Store[];

extern const u8 gOtherText_Check[];
extern const u8 gOtherText_None[];

extern const u8 gOtherText_ThreeQuestions2[];

extern const u8 gOtherText_FiveQuestionsAndSlash[];

extern const u8 gOtherText_OneDash[];
extern const u8 gOtherText_TwoDashes[];
extern const u8 gOtherText_ThreeDashes2[];
extern const u8 gOtherText_MaleSymbol2[];
extern const u8 gOtherText_FemaleSymbolAndLv[];
extern const u8 gOtherText_TallPlusAndRightArrow[];
extern const u8 gMenuText_GoBackToPrev[];
extern const u8 gOtherText_WhatWillYouDo[];

extern const u8 gOtherText_xString1[];
extern const u8 gOtherText_Berry2[];
extern const u8 gOtherText_Coins2[];
extern const u8 gOtherText_CloseBag[];

extern const u8 OtherText_TheField3[];
extern const u8 OtherText_TheBattle[];
extern const u8 OtherText_ThePokeList[];
extern const u8 OtherText_TheShop[];
extern const u8 OtherText_TheField[];
extern const u8 OtherText_TheField2[];
extern const u8 OtherText_ThePC[];

extern const u8 *const gUnknown_0840E740[7];

extern const u8 gOtherText_ReturnTo[];
extern const u8 gOtherText_WhatWillYouDo2[];
extern const u8 gOtherText_CantWriteMail[];
extern const u8 gOtherText_NoPokemon[];
extern const u8 gOtherText_SwitchWhichItem[];
extern const u8 gOtherText_CantBeHeld[];
extern const u8 gOtherText_CantBeHeldHere[];
extern const u8 gOtherText_HowManyToDeposit[];
extern const u8 gOtherText_DepositedItems[];
extern const u8 gOtherText_NoRoomForItems[];
extern const u8 gOtherText_CantStoreSomeoneItem[];
extern const u8 gOtherText_TooImportant[];
extern const u8 gOtherText_HowManyToToss[];
extern const u8 gOtherText_ThrewAwayItem[];
extern const u8 gOtherText_OkayToThrowAwayPrompt[];
extern const u8 gOtherText_DadsAdvice[];
extern const u8 gOtherText_CantGetOffBike[];
extern const u8 gOtherText_ItemfinderResponding[];
extern const u8 gOtherText_ItemfinderItemUnderfoot[];
extern const u8 gOtherText_NoResponse[];
extern const u8 gOtherText_Coins3[];
extern const u8 gOtherText_BootedTM[];
extern const u8 gOtherText_BootedHM[];
extern const u8 gOtherText_ContainsMove[];
extern const u8 gOtherText_UsedItem[];
extern const u8 gOtherText_RepelLingers[];
extern const u8 gOtherText_UsedFlute[];
extern const u8 gOtherText_UsedRepel[];
extern const u8 gOtherText_BoxIsFull[];
extern const u8 gOtherText_Size[];
extern const u8 gOtherText_Firm[];

extern const u8 gContestStatsText_Unknown1[];

extern const u8 ContestStatsText_VerySoft[];
extern const u8 ContestStatsText_Soft[];
extern const u8 ContestStatsText_Hard[];
extern const u8 ContestStatsText_VeryHard[];
extern const u8 ContestStatsText_SuperHard[];

extern const u8 ContestStatsText_RedPokeBlock[];
extern const u8 ContestStatsText_BluePokeBlock[];
extern const u8 ContestStatsText_PinkPokeBlock[];
extern const u8 ContestStatsText_GreenPokeBlock[];
extern const u8 ContestStatsText_YellowPokeBlock[];
extern const u8 ContestStatsText_PurplePokeBlock[];
extern const u8 ContestStatsText_IndigoPokeBlock[];
extern const u8 ContestStatsText_BrownPokeBlock[];
extern const u8 ContestStatsText_LiteBluePokeBlock[];
extern const u8 ContestStatsText_OlivePokeBlock[];
extern const u8 ContestStatsText_GrayPokeBlock[];
extern const u8 ContestStatsText_BlackPokeBlock[];
extern const u8 ContestStatsText_WhitePokeBlock[];
extern const u8 ContestStatsText_GoldPokeBlock[];

extern const u8 gContestStatsText_Spicy[];
extern const u8 gContestStatsText_Dry[];
extern const u8 gContestStatsText_Sweet[];
extern const u8 gContestStatsText_Bitter[];
extern const u8 gContestStatsText_Sour[];

extern const u8 gContestStatsText_StowCase[];
extern const u8 gContestStatsText_ThrowAwayPrompt[];
extern const u8 gContestStatsText_WasThrownAway[];
extern const u8 gContestStatsText_NormallyAte[];
extern const u8 gContestStatsText_HappilyAte[];
extern const u8 gContestStatsText_DisdainfullyAte[];

extern const u8 MartText_Buy[];
extern const u8 MartText_Sell[];
extern const u8 MartText_Quit2[];

extern const u8 gOtherText_QuitShopping[];

extern const u8 gOtherText_HowManyYouWant[];
extern const u8 gOtherText_ThatWillBe[];
extern const u8 gOtherText_ThatWillBe2[];
extern const u8 gOtherText_ThatWillBe3[];
extern const u8 gOtherText_HereYouGo[];
extern const u8 gOtherText_HereYouGo2[];
extern const u8 gOtherText_HereYouGo3[];
extern const u8 gOtherText_NotEnoughMoney[];
extern const u8 gOtherText_NoRoomFor[];
extern const u8 gOtherText_SpaceForIsFull[];
extern const u8 gOtherText_AnythingElse[];
extern const u8 gOtherText_CanIHelpYou[];
extern const u8 gOtherText_FreePremierBall[];
extern const u8 gOtherText_CantBuyThat[];
extern const u8 gOtherText_HowManyToSell[];
extern const u8 gOtherText_CanPay[];
extern const u8 gOtherText_SoldItem[];

extern const u8 OtherText_Money[];
extern const u8 OtherText_Shift[];
extern const u8 OtherText_SendOut[];
extern const u8 OtherText_Switch2[];
extern const u8 OtherText_Summary[];
extern const u8 OtherText_Moves[];
extern const u8 OtherText_Enter2[];
extern const u8 OtherText_NoEntry[];
extern const u8 OtherText_Take[];
extern const u8 OtherText_Read2[];

extern const u8 gOtherText_Hp2[];
extern const u8 gOtherText_SpAtk2[];
extern const u8 gOtherText_SpDef2[];
extern const u8 gOtherText_WontHaveAnyEffect[];

extern const u8 gOtherText_CantUseOnPoke[];

extern const u8 gOtherText_CantBeSwitched[];
extern const u8 gOtherText_AlreadyBattle[];
extern const u8 gOtherText_AlreadySelected[];
extern const u8 gOtherText_NoEnergyLeft[];
extern const u8 gOtherText_CantSwitchPokeWithYours[];
extern const u8 gOtherText_EGGCantBattle[];
extern const u8 gOtherText_CantBeUsedBadge[];
extern const u8 gOtherText_NoMoreThreePoke[];
extern const u8 gOtherText_SendRemovedMailPrompt[];
extern const u8 gOtherText_MailWasSent[];
extern const u8 gOtherText_MailboxIsFull[];
extern const u8 gOtherText_MailRemovedMessageLost[];
extern const u8 gOtherText_MailMustBeRemoved[];
extern const u8 gOtherText_WasGivenToHold[];
extern const u8 gOtherText_AlreadyHolding[];
extern const u8 gOtherText_NotHoldingAnything[];
extern const u8 gOtherText_ReceivedTheThingFrom[];
extern const u8 gOtherText_MailTaken[];
extern const u8 gOtherText_TakenAndReplaced[];
extern const u8 gOtherText_PokeHoldingItemCantMail[];
extern const u8 gOtherText_MailTransferredMailbox[];
extern const u8 gOtherText_BagFullCannotRemoveItem[];
extern const u8 gOtherText_LearnedMove[];
extern const u8 gOtherText_NotCompatible[];
extern const u8 gOtherText_WantsToLearn[];
extern const u8 gOtherText_StopTryingTo[];
extern const u8 gOtherText_DidNotLearnMove2[];
extern const u8 gOtherText_WhichMoveToForget2[];
extern const u8 gOtherText_ForgetMove123_2[];
extern const u8 gOtherText_AlreadyKnows[];
extern const u8 gOtherText_HPRestoredBy[];
extern const u8 gOtherText_CuredPoisoning[];
extern const u8 gOtherText_CuredParalysis[];
extern const u8 gOtherText_WokeUp[];
extern const u8 gOtherText_BurnHealed[];
extern const u8 gOtherText_ThawedOut[];
extern const u8 gOtherText_PPRestored[];
extern const u8 gOtherText_RegainedHealth[];
extern const u8 gOtherText_BecameHealthy[];
extern const u8 gOtherText_PPIncreased[];
extern const u8 gOtherText_ElevatedTo[];
extern const u8 gOtherText_WasRaised[];
extern const u8 gOtherText_SnapConfusion[];
extern const u8 gOtherText_GotOverLove[];
extern const u8 OtherText_ChoosePoke[];
extern const u8 OtherText_MovePokeTo[];
extern const u8 OtherText_TeachWhat[];
extern const u8 OtherText_UseWhat[];
extern const u8 OtherText_GiveWhat[];
extern const u8 OtherText_DoWhat[];
extern const u8 OtherText_NothingToCut[];
extern const u8 OtherText_CantSurf[];
extern const u8 OtherText_AlreadySurfing[];
extern const u8 OtherText_CantUseThatHere[];
extern const u8 OtherText_RestoreWhatMove[];
extern const u8 OtherText_BoostPP[];
extern const u8 OtherText_DoWhatWithItem[];
extern const u8 OtherText_NoPokeForBattle[];
extern const u8 OtherText_ChoosePoke2[];
extern const u8 OtherText_NotEnoughHP[];
extern const u8 OtherText_ThreePokeNeeded[];
extern const u8 OtherText_PokeCantBeSame[];
extern const u8 OtherText_NoIdenticalHoldItems[];
extern const u8 OtherText_TeachWhichPoke[];
extern const u8 gOtherText_Attack[];
extern const u8 gOtherText_Defense[];
extern const u8 gOtherText_SpAtk[];
extern const u8 gOtherText_SpDef[];
extern const u8 gOtherText_Speed[];
extern const u8 gOtherText_HP[];
extern const u8 gOtherText_Terminator18[];
extern const u8 gOtherText_OriginalTrainer[];
extern const u8 gOtherText_Type2[];
extern const u8 gOtherText_Power2[];
extern const u8 gOtherText_Accuracy2[];
extern const u8 gOtherText_Appeal2[];
extern const u8 gOtherText_Jam2[];
extern const u8 gOtherText_Status[];
extern const u8 gOtherText_ExpPoints[];
extern const u8 gOtherText_NextLv[];
extern const u8 gOtherText_Ribbons00[];

extern const u8 OtherText_Event[];
extern const u8 OtherText_Switch[];
extern const u8 OtherText_PokeInfo[];
extern const u8 OtherText_PokeSkills[];
extern const u8 OtherText_BattleMoves[];
extern const u8 OtherText_ContestMoves[];
extern const u8 OtherText_Info[];

extern const u8 gOtherText_EggLongTime[];
extern const u8 gOtherText_EggSomeTime[];
extern const u8 gOtherText_EggSoon[];
extern const u8 gOtherText_EggAbout[];
extern const u8 gOtherText_CantForgetHMs[];
extern const u8 gOtherText_PlayersBase[];
extern const u8 gOtherText_OkayToDeleteFromRegistry[];
extern const u8 gOtherText_RegisteredDataDeleted[];

extern const u8 gSecretBaseText_NoRegistry[];
extern const u8 SecretBaseText_DelRegist[];
extern const u8 SecretBaseText_Decorate[];
extern const u8 SecretBaseText_PutAway[];
extern const u8 SecretBaseText_Toss[];
extern const u8 SecretBaseText_PutOutDecor[];
extern const u8 SecretBaseText_StoreChosenDecor[];
extern const u8 SecretBaseText_ThrowAwayDecor[];
extern const u8 gSecretBaseText_NoDecors[];
extern const u8 SecretBaseText_Desk[];
extern const u8 SecretBaseText_Chair[];
extern const u8 SecretBaseText_Plant[];
extern const u8 SecretBaseText_Ornament[];
extern const u8 SecretBaseText_Mat[];
extern const u8 SecretBaseText_Poster[];
extern const u8 SecretBaseText_Doll[];
extern const u8 SecretBaseText_Cushion[];
extern const u8 gSecretBaseText_GoldRank[];
extern const u8 gSecretBaseText_SilverRank[];
extern const u8 gSecretBaseText_PlaceItHere[];
extern const u8 gSecretBaseText_CantBePlacedHere[];
extern const u8 gSecretBaseText_CancelDecorating[];
extern const u8 gSecretBaseText_InUseAlready[];
extern const u8 gSecretBaseText_NoMoreDecor[];
extern const u8 gSecretBaseText_NoMoreDecor2[];
extern const u8 gSecretBaseText_DecorCantPlace[];
extern const u8 gSecretBaseText_DecorInUse[];
extern const u8 gSecretBaseText_WillBeDiscarded[];
extern const u8 gSecretBaseText_DecorThrownAway[];
extern const u8 gSecretBaseText_StopPuttingAwayDecor[];
extern const u8 gSecretBaseText_NoDecor[];
extern const u8 gSecretBaseText_ReturnDecor[];
extern const u8 gSecretBaseText_DecorReturned[];
extern const u8 gSecretBaseText_NoDecorInUse[];
extern const u8 SecretBaseText_Tristan[];
extern const u8 SecretBaseText_Philip[];
extern const u8 SecretBaseText_Dennis[];
extern const u8 SecretBaseText_Roberto[];
extern const u8 SecretBaseText_TurnOff[];
extern const u8 SecretBaseText_Decoration[];
extern const u8 SecretBaseText_ItemStorage[];

extern const u8 gPCText_Mailbox[];
extern const u8 PCText_DepositItem[];
extern const u8 PCText_WithdrawItem[];
extern const u8 PCText_TossItem[];
extern const u8 PCText_StoreItems[];
extern const u8 PCText_TakeOutItems[];
extern const u8 PCText_ThrowAwayItems[];

extern const u8 gOtherText_NoItems[];
extern const u8 gOtherText_NoMoreRoom[];
extern const u8 gOtherText_HowManyToWithdraw[];
extern const u8 gOtherText_WithdrewThing[];
extern const u8 OtherText_Read[];
extern const u8 gOtherText_MoveToBag[];
extern const u8 OtherText_Give[];
extern const u8 gOtherText_NoMailHere[];
extern const u8 gOtherText_WhatWillYouDoMail[];
extern const u8 gOtherText_MessageWillBeLost[];
extern const u8 gOtherText_BagIsFull[];
extern const u8 gOtherText_MailWasReturned[];
extern const u8 gOtherText_Dad[];
extern const u8 gOtherText_Mom[];
extern const u8 gOtherText_Wallace[];
extern const u8 gOtherText_Steven[];
extern const u8 gOtherText_Brawly[];
extern const u8 gOtherText_Winona[];
extern const u8 gOtherText_Phoebe[];
extern const u8 gOtherText_Glacia[];
extern const u8 gContestText_ContestWinner[];
extern const u8 gOtherText_Unknown1[];
extern const u8 OtherText_Cool[];
extern const u8 OtherText_Beauty2[];
extern const u8 OtherText_Cute[];
extern const u8 OtherText_Smart[];
extern const u8 OtherText_Tough[];
extern const u8 OtherText_NonstopSuperCool[];
extern const u8 OtherText_Terminator6[];
extern const u8 OtherText_GoodLookingPoke[];
extern const u8 OtherText_Terminator7[];
extern const u8 OtherText_MarvelousGreat[];
extern const u8 OtherText_Terminator8[];
extern const u8 OtherText_CenturyLastVenus[];
extern const u8 OtherText_Terminator9[];
extern const u8 OtherText_Terminator10[];
extern const u8 OtherText_DazzlingSmile[];
extern const u8 OtherText_PokeCenterIdol[];
extern const u8 OtherText_Terminator11[];
extern const u8 OtherText_LovelyAndSweet[];
extern const u8 OtherText_Terminator12[];
extern const u8 OtherText_ThePretty[];
extern const u8 OtherText_WinningPortrait[];
extern const u8 OtherText_GiveUsWink[];
extern const u8 OtherText_Terminator13[];
extern const u8 OtherText_SmartnessMaestro[];
extern const u8 OtherText_Terminator14[];
extern const u8 OtherText_ChosenPokeAmong[];
extern const u8 OtherText_Terminator15[];
extern const u8 OtherText_TheExcellent[];
extern const u8 OtherText_ItsMomentOfElegance[];
extern const u8 OtherText_PowerfullyMuscular[];
extern const u8 OtherText_Terminator16[];
extern const u8 OtherText_StrongErEst[];
extern const u8 OtherText_Terminator17[];
extern const u8 OtherText_MightyTough[];
extern const u8 OtherText_Exclamation[];
extern const u8 OtherText_Petalburg[];
extern const u8 OtherText_Slateport[];
extern const u8 OtherText_Littleroot[];
extern const u8 OtherText_Lilycove[];
extern const u8 OtherText_Dewford[];
extern const u8 OtherText_Enter[];
extern const u8 OtherText_Info3[];
extern const u8 OtherText_WhatsAContest[];
extern const u8 OtherText_TypesOfContest[];
extern const u8 OtherText_Ranks[];
extern const u8 OtherText_Judging[];
extern const u8 OtherText_CoolContest[];
extern const u8 OtherText_BeautyContest[];
extern const u8 OtherText_CuteContest[];
extern const u8 OtherText_SmartContest[];
extern const u8 OtherText_ToughContest[];
extern const u8 OtherText_Decoration[];
extern const u8 OtherText_PackUp[];
extern const u8 OtherText_Count[];
extern const u8 OtherText_Registry[];
extern const u8 OtherText_Information[];
extern const u8 OtherText_Mach[];
extern const u8 OtherText_Acro[];
extern const u8 OtherText_Poison[];
extern const u8 OtherText_Paralysis[];
extern const u8 OtherText_Sleep[];
extern const u8 OtherText_Burn[];
extern const u8 OtherText_Frozen[];
extern const u8 OtherText_Quit[];
extern const u8 OtherText_SawIt[];
extern const u8 OtherText_NotYet[];
extern const u8 OtherText_Yes[];
extern const u8 OtherText_No[];
extern const u8 OtherText_Info2[];
extern const u8 OtherText_SingleBattle[];
extern const u8 OtherText_DoubleBattle[];
extern const u8 OtherText_MultiBattle[];
extern const u8 OtherText_MrBriney[];
extern const u8 OtherText_MakeAChallenge[];
extern const u8 OtherText_ObtainInformation[];
extern const u8 OtherText_Lv50_2[];
extern const u8 OtherText_Lv100_2[];
extern const u8 OtherText_Zigzagoon[];
extern const u8 OtherText_Nincada[];
extern const u8 OtherText_Poochyena[];
extern const u8 OtherText_Nincada2[];
extern const u8 OtherText_Lotad[];
extern const u8 OtherText_Roselia[];
extern const u8 OtherText_Shroomish[];
extern const u8 OtherText_Nincada3[];
extern const u8 OtherText_Surskit[];
extern const u8 OtherText_Treecko[];
extern const u8 OtherText_Torchic[];
extern const u8 OtherText_Mudkip[];
extern const u8 OtherText_Seedot[];
extern const u8 OtherText_Shroomish2[];
extern const u8 OtherText_Spinda[];
extern const u8 OtherText_Shroomish3[];
extern const u8 OtherText_Zigzagoon2[];
extern const u8 OtherText_Wurmple[];
extern const u8 OtherText_PokeBall[];
extern const u8 OtherText_SuperPotion[];
extern const u8 OtherText_SamePrice[];
extern const u8 OtherText_Yen135[];
extern const u8 OtherText_Yen155[];
extern const u8 OtherText_Yen175[];
extern const u8 OtherText_CostMore[];
extern const u8 OtherText_CostLess[];
extern const u8 OtherText_SamePrice2[];
extern const u8 OtherText_MaleSymbol[];
extern const u8 OtherText_FemaleSymbol[];
extern const u8 OtherText_Neither[];
extern const u8 OtherText_Males[];
extern const u8 OtherText_Females[];
extern const u8 OtherText_SameNumber[];
extern const u8 OtherText_Male[];
extern const u8 OtherText_Female[];
extern const u8 OtherText_ItDepends[];
extern const u8 OtherText_Six2[];
extern const u8 OtherText_Eight2[];
extern const u8 OtherText_Ten[];
extern const u8 OtherText_One[];
extern const u8 OtherText_Two[];
extern const u8 OtherText_Three[];
extern const u8 OtherText_Six[];
extern const u8 OtherText_Seven[];
extern const u8 OtherText_Eight[];
extern const u8 OtherText_FreshWater[];
extern const u8 OtherText_SodaPop[];
extern const u8 OtherText_Lemonade[];
extern const u8 OtherText_HowToRide[];
extern const u8 OtherText_HowToTurn[];
extern const u8 OtherText_SandySlopes[];
extern const u8 OtherText_Wheelies[];
extern const u8 OtherText_BunnyHops[];
extern const u8 OtherText_Jumping[];
extern const u8 OtherText_Satisfied[];
extern const u8 OtherText_Dissatisfied[];
extern const u8 OtherText_Deepseatooth[];
extern const u8 OtherText_Deepseascale[];
extern const u8 OtherText_BlueFlute2[];
extern const u8 OtherText_YellowFlute2[];
extern const u8 OtherText_RedFlute2[];
extern const u8 OtherText_WhiteFlute2[];
extern const u8 OtherText_BlackFlute2[];
extern const u8 OtherText_GlassChair[];
extern const u8 OtherText_GlassDesk[];
extern const u8 OtherText_TreeckoDoll[];
extern const u8 OtherText_TorchicDoll[];
extern const u8 OtherText_MudkipDoll[];
extern const u8 OtherText_50Coins[];
extern const u8 OtherText_500Coins[];
extern const u8 OtherText_Excellent[];
extern const u8 OtherText_NotSoHot[];
extern const u8 OtherText_RedShard[];
extern const u8 OtherText_YellowShard[];
extern const u8 OtherText_BlueShard[];
extern const u8 OtherText_GreenShard[];
extern const u8 OtherText_BattleTower[];
extern const u8 OtherText_Right[];
extern const u8 OtherText_Left[];
extern const u8 OtherText_TM32[];
extern const u8 OtherText_TM29[];
extern const u8 OtherText_TM35[];
extern const u8 OtherText_TM24[];
extern const u8 OtherText_TM13[];
extern const u8 OtherText_1F_2[];
extern const u8 OtherText_2F_2[];
extern const u8 OtherText_3F_2[];
extern const u8 OtherText_4F_2[];
extern const u8 OtherText_5F_2[];
extern const u8 OtherText_Cool2[];
extern const u8 OtherText_Beauty3[];
extern const u8 OtherText_Cute2[];
extern const u8 OtherText_Smart2[];
extern const u8 OtherText_Tough2[];
extern const u8 OtherText_Normal[];
extern const u8 OtherText_Super[];
extern const u8 OtherText_Hyper[];
extern const u8 OtherText_Master[];
extern const u8 OtherText_Cool3[];
extern const u8 OtherText_Beauty4[];
extern const u8 OtherText_Cute3[];
extern const u8 OtherText_Smart3[];
extern const u8 OtherText_Tough3[];
extern const u8 OtherText_Items[];
extern const u8 OtherText_KeyItems[];
extern const u8 OtherText_Balls[];
extern const u8 OtherText_TMsHMs[];
extern const u8 OtherText_Berries[];

extern const u8 gPCText_SomeonesPC[];
extern const u8 gPCText_LanettesPC[];
extern const u8 gPCText_PlayersPC[];
extern const u8 gPCText_HallOfFame[];
extern const u8 gPCText_LogOff[];

extern const u8 gOtherText_99Times[];
extern const u8 gOtherText_1Minute[];
extern const u8 gOtherText_Seconds[];
extern const u8 gOtherText_Times[];
extern const u8 gOtherText_BigGuy[];
extern const u8 gOtherText_BigGirl[];
extern const u8 gOtherText_Son[];
extern const u8 gOtherText_Daughter[];
extern const u8 OtherText_BlueFlute[];
extern const u8 OtherText_YellowFlute[];
extern const u8 OtherText_RedFlute[];
extern const u8 OtherText_WhiteFlute[];
extern const u8 OtherText_BlackFlute[];
extern const u8 OtherText_PrettyChair[];
extern const u8 OtherText_PrettyDesk[];
extern const u8 OtherText_1F[];
extern const u8 OtherText_2F[];
extern const u8 OtherText_3F[];
extern const u8 OtherText_4F[];
extern const u8 OtherText_5F[];
extern const u8 OtherText_6F[];
extern const u8 OtherText_7F[];
extern const u8 OtherText_8F[];
extern const u8 OtherText_9F[];
extern const u8 OtherText_10F[];
extern const u8 OtherText_11F[];
extern const u8 OtherText_B1F[];
extern const u8 OtherText_B2F[];
extern const u8 OtherText_B3F[];
extern const u8 OtherText_B4F[];
extern const u8 OtherText_Rooftop[];

extern const u8 gOtherText_NowOn[];

extern const u8 gPCText_Cancel[];

extern const u8 PCText_ExitBox[];
extern const u8 PCText_WhatYouDo[];
extern const u8 PCText_PickATheme[];
extern const u8 PCText_PickAWallpaper[];
extern const u8 PCText_IsSelected[];
extern const u8 PCText_JumpToWhichBox[];
extern const u8 PCText_DepositInWhichBox[];
extern const u8 PCText_WasDeposited[];
extern const u8 PCText_BoxIsFull[];
extern const u8 PCText_ReleasePoke[];
extern const u8 PCText_WasReleased[];
extern const u8 PCText_ByeBye[];
extern const u8 PCText_MarkPoke[];
extern const u8 PCText_LastPoke[];
extern const u8 PCText_PartyFull[];
extern const u8 PCText_HoldingPoke[];
extern const u8 PCText_WhichOneWillTake[];
extern const u8 PCText_CantReleaseEgg[];
extern const u8 PCText_ContinueBox[];
extern const u8 PCText_CameBack[];
extern const u8 PCText_Worried[];
extern const u8 PCText_Surprise[];
extern const u8 PCText_PleaseRemoveMail[];
extern const u8 PCText_Cancel2[];
extern const u8 PCText_Deposit[];
extern const u8 PCText_Withdraw[];
extern const u8 PCText_Switch[];
extern const u8 PCText_Move[];
extern const u8 PCText_Place[];
extern const u8 PCText_Summary[];
extern const u8 PCText_Release[];
extern const u8 PCText_Mark[];
extern const u8 PCText_Name[];
extern const u8 PCText_Jump[];
extern const u8 PCText_Wallpaper[];
extern const u8 PCText_Scenery1[];
extern const u8 PCText_Scenery2[];
extern const u8 PCText_Scenery3[];
extern const u8 PCText_Etc[];
extern const u8 PCText_Forest[];
extern const u8 PCText_City[];
extern const u8 PCText_Desert[];
extern const u8 PCText_Savanna[];
extern const u8 PCText_Crag[];
extern const u8 PCText_Volcano[];
extern const u8 PCText_Snow[];
extern const u8 PCText_Cave[];
extern const u8 PCText_Beach[];
extern const u8 PCText_Seafloor[];
extern const u8 PCText_River[];
extern const u8 PCText_Sky[];
extern const u8 PCText_Polka[];
extern const u8 PCText_PokeCenter[];
extern const u8 PCText_Machine[];
extern const u8 PCText_Plain[];
extern const u8 PCText_WhatDoYouWant[];
extern const u8 PCText_WithdrawPoke[];
extern const u8 PCText_DepositPoke[];
extern const u8 PCText_MovePoke[];
extern const u8 PCText_SeeYa[];
extern const u8 PCText_MovePokeToParty[];
extern const u8 PCText_StorePokeInBox[];
extern const u8 PCText_OrganizeBoxesParty[];
extern const u8 PCText_ReturnToPrevMenu[];

extern const u8 gPCText_OnlyOne[];
extern const u8 gPCText_PartyFull2[];
extern const u8 gPCText_BOX[];


extern const u8 PCText_CheckMap[];
extern const u8 PCText_CheckPoke[];
extern const u8 PCText_CheckTrainer[];
extern const u8 PCText_CheckRibbons[];
extern const u8 PCText_PutAwayNav[];
extern const u8 PCText_NoRibbonWin[];
extern const u8 PCText_NoTrainers[];
extern const u8 PCText_CheckParty[];
extern const u8 PCText_CheckPokeAll[];
extern const u8 PCText_ReturnToNav[];
extern const u8 PCText_FindCool[];
extern const u8 PCText_FindBeauty[];
extern const u8 PCText_FindCute[];
extern const u8 PCText_FindSmart[];
extern const u8 PCText_FindTough[];
extern const u8 PCText_ReturnToCondition[];

extern const u8 gOtherText_NumberRegistered[];
extern const u8 gOtherText_NumberBattles[];
extern const u8 gOtherText_Strategy[];
extern const u8 gOtherText_TrainersPokemon[];
extern const u8 gOtherText_SelfIntroduction[];
extern const u8 gOtherText_Nature2[];
extern const u8 gOtherText_InParty[];
extern const u8 gOtherText_Number[];
extern const u8 gOtherText_Ribbons[];
extern const u8 OtherText_MakeProfilePage1[];
extern const u8 OtherText_MakeProfilePage2[];
extern const u8 OtherText_MakeMessagePage1[];
extern const u8 OtherText_MakeMessagePage2[];
extern const u8 OtherText_DescribeFeelingsPage1[];
extern const u8 OtherText_DescribeFeelingsPage2[];
extern const u8 OtherText_WithFourPhrases[];
extern const u8 OtherText_CombineNinePhrasesPage1[];
extern const u8 OtherText_CombineNinePhrasesPage2[];
extern const u8 OtherText_ImproveBardSongPage1[];
extern const u8 OtherText_ImproveBardSongPage2[];
extern const u8 OtherText_YourProfile[];
extern const u8 OtherText_YourFeelingBattle[];
extern const u8 OtherText_SetWinMessage[];
extern const u8 OtherText_SetLossMessage[];
extern const u8 OtherText_TheAnswer[];
extern const u8 OtherText_MailMessage[];
extern const u8 OtherText_MailSalutation[];
extern const u8 OtherText_NewSong[];
extern const u8 OtherText_CombineTwoPhrasesPage1[];
extern const u8 OtherText_CombineTwoPhrasesPage2[];
extern const u8 OtherText_ConfirmTrendyPage1[];
extern const u8 OtherText_ConfirmTrendyPage2[];
extern const u8 OtherText_HipsterPage1[];
extern const u8 OtherText_HipsterPage2[];

extern const u8 gOtherText_TextDeletedConfirmPage1[];
extern const u8 gOtherText_TextDeletedConfirmPage2[];
extern const u8 gOtherText_QuitEditing[];
extern const u8 gOtherText_EditedTextNoSavePage1[];
extern const u8 gOtherText_EditedTextNoSavePage2[];
extern const u8 gOtherText_EnterAPhraseOrWord[];
extern const u8 gOtherText_TextNoDelete[];
extern const u8 gOtherText_OnlyOnePhrase[];
extern const u8 gOtherText_OriginalSongRestored[];
extern const u8 gOtherText_TrendyAlready[];
extern const u8 gOtherText_CombineTwoPhrases[];
extern const u8 gOtherText_QuitGivingInfo[];
extern const u8 gOtherText_StopGivingMail[];
extern const u8 gOtherText_Profile[];
extern const u8 gOtherText_AtBattleStart[];
extern const u8 gOtherText_UponWinningBattle[];
extern const u8 gOtherText_UponLosingBattle[];


extern const u8 gOtherText_TheBardsSong[];
extern const u8 gOtherText_WhatsHipHappening[];
extern const u8 gOtherText_Interview[];
extern const u8 gOtherText_GoodSaying[];
extern const u8 OtherText_SoPretty[];
extern const u8 OtherText_SoDarling[];
extern const u8 OtherText_SoRelaxed[];
extern const u8 OtherText_SoSunny[];
extern const u8 OtherText_SoDesirable[];
extern const u8 OtherText_SoExciting[];
extern const u8 OtherText_SoAmusing[];
extern const u8 OtherText_SoMagical[];

extern const u8 gOtherText_Is[];
extern const u8 gOtherText_DontYouAgree[];

extern const u8 OtherText_WantVacationNicePlace[];
extern const u8 OtherText_BoughtCrayonsIsNice[];
extern const u8 OtherText_IfWeCouldFloat[];
extern const u8 OtherText_SandWashesAwayMakeSad[];
extern const u8 OtherText_WhatsBottomSeaLike[];
extern const u8 OtherText_SeeSettingSun[];
extern const u8 OtherText_LyingInGreenGrass[];
extern const u8 OtherText_SecretBasesWonderful[];

extern const u8 OtherText_PokeLeague[];
extern const u8 OtherText_PokeCenter[];

extern const u8 gOtherText_GetsAPokeBlock[];

extern const u8 OtherText_Coolness[];
extern const u8 OtherText_Beauty[];
extern const u8 OtherText_Cuteness[];
extern const u8 OtherText_Smartness[];
extern const u8 OtherText_Toughness[];

extern const u8 gOtherText_WasEnhanced[];
extern const u8 gOtherText_NothingChanged[];
extern const u8 gOtherText_WontEat[];

extern const u8 gSystemText_SaveFailedBackupCheck[];
extern const u8 gSystemText_BackupDamagedGameContinue[];
extern const u8 gSystemText_GameplayEnded[];
extern const u8 gSystemText_CheckCompleteSaveAttempt[];
extern const u8 gSystemText_SaveCompletedGameEnd[];
extern const u8 gSystemText_SaveCompletedPressA[];

extern const u8 gOtherText_Ferry[];
extern const u8 gOtherText_SecretBase[];
extern const u8 gOtherText_Hideout[];

extern const u8 gSystemText_ResetRTCPrompt[];
extern const u8 gSystemText_PresentTime[];
extern const u8 gSystemText_PreviousTime[];
extern const u8 gSystemText_PleaseResetTime[];
extern const u8 gSystemText_ClockResetDataSave[];
extern const u8 gSystemText_SaveCompleted[];
extern const u8 gSystemText_SaveFailed[];
extern const u8 gSystemText_NoSaveFileNoTime[];
extern const u8 gSystemText_ClockAdjustmentUsable[];
extern const u8 gSystemText_Saving[];
# 29 "src/engine/trade.c" 2
# 1 "include/load_save.h" 1



extern bool32 gFlashMemoryPresent;

void CheckForFlashMemory(void);
bool32 GetSecretBase2Field_9(void);
void ClearSecretBase2Field_9(void);
void SetSecretBase2Field_9(void);
void SetSecretBase2Field_9_AndHideBG(void);
void ClearSecretBase2Field_9_2(void);
void SavePlayerParty(void);
void LoadPlayerParty(void);
void SaveSerializedGame(void);
void LoadSerializedGame(void);
void LoadPlayerBag(void);
void SavePlayerBag(void);
# 30 "src/engine/trade.c" 2
# 1 "include/save.h" 1



struct SaveSectionLocation
{
    u8 *data;
    u16 size;
};

struct SaveSection
{
    u8 data[0xFF4];
    u16 id;
    u16 checksum;
    u32 security;
    u32 counter;
};


struct UnkSaveSection
{
    u8 data[0xFF4];
    u32 security;
};







enum
{
    ENABLE,
    DISABLE,
    CHECK
};


enum
{
    NORMAL_SAVE,
    LINK_SAVE,
    EREADER_SAVE,
    HOF_SAVE,
    DIFFERENT_FILE_SAVE,
    HOF_DELETE_SAVE
};

void ClearSaveData(void);
void ResetSaveCounters(void);
bool32 ManipulateSectorBits(u8 op, u8 bit);
u8 save_write_to_flash(u16 a1, const struct SaveSectionLocation *a2);
u8 HandleWriteSector(u16, const struct SaveSectionLocation *);
u8 HandleWriteSectorNBytes(u8 sector, u8 *data, u16 size);
u8 TryWriteSector(u8, u8 *);
u32 RestoreSaveBackupVarsAndIncrement(const struct SaveSectionLocation *location);
u32 RestoreSaveBackupVars(const struct SaveSectionLocation *location);
u8 sub_812550C(u16 a1, const struct SaveSectionLocation *location);
u8 sub_812556C(u16 a1, const struct SaveSectionLocation *location);
u8 sub_81255B8(u16, const struct SaveSectionLocation *location);
u8 sub_8125758(u16 a1, const struct SaveSectionLocation *location);
u8 sub_81257F0(u16 a1, const struct SaveSectionLocation *location);
u8 sub_812587C(u16 a1, const struct SaveSectionLocation *location);
u8 sub_81258BC(u16, const struct SaveSectionLocation *location);
u8 GetSaveValidStatus(const struct SaveSectionLocation *location);
u8 sub_8125B88(u8 a1, u8 *data, u16 size);
u8 DoReadFlashWholeSection(u8, struct SaveSection *);
u16 CalculateChecksum(void *, u16);
u8 HandleSavingData(u8 saveType);
u8 TrySavingData(u8 saveType);
u8 sub_8125D80(void);
bool8 sub_8125DA8(void);
u8 sub_8125DDC(void);
u8 sub_8125E04(void);
u8 sub_8125E2C(void);
bool8 sub_8125E6C(void);
u8 sub_8125EC8(u8 a1);
bool8 unref_sub_8125F4C(struct UnkSaveSection *a1);
u8 unref_sub_8125FA0(void);
u8 unref_sub_8125FF0(u8 *data, u16 size);
u8 unref_sub_8126068(u8 sector, u8 *data, u32 size);
u8 unref_sub_8126080(u8 sector, u8 *data);
# 31 "src/engine/trade.c" 2
# 1 "include/script.h" 1



struct ScriptContext;

typedef bool8 (*ScrCmdFunc)(struct ScriptContext *);
typedef u8 Script[];

struct ScriptContext
{
    u8 stackDepth;
    u8 mode;
    u8 comparisonResult;
    bool8 (*nativePtr)(void);
    const u8 *scriptPtr;
    const u8 *stack[20];
    ScrCmdFunc *cmdTable;
    ScrCmdFunc *cmdTableEnd;
    u32 data[4];
};



void InitScriptContext(struct ScriptContext *ctx, void *cmdTable, void *cmdTableEnd);
u8 SetupBytecodeScript(struct ScriptContext *ctx, const u8 *ptr);
void SetupNativeScript(struct ScriptContext *ctx, bool8 (*ptr)(void));
void StopScript(struct ScriptContext *ctx);
u8 RunScriptCommand(struct ScriptContext *ctx);
u8 ScriptPush(struct ScriptContext *ctx, const u8 *ptr);
const u8 *ScriptPop(struct ScriptContext *ctx);
void ScriptJump(struct ScriptContext *ctx, u8 *ptr);
void ScriptCall(struct ScriptContext *ctx, u8 *ptr);
void ScriptReturn(struct ScriptContext *ctx);
u16 ScriptReadHalfword(struct ScriptContext *ctx);
u32 ScriptReadWord(struct ScriptContext *ctx);
void ScriptContext2_Enable(void);
void ScriptContext2_Disable(void);
bool8 ScriptContext2_IsEnabled(void);
void ScriptContext1_Init(void);
bool8 ScriptContext2_RunScript(void);
void ScriptContext1_SetupScript(const u8 *ptr);
void ScriptContext1_Stop(void);
void EnableBothScriptContexts(void);
void ScriptContext2_RunNewScript(const u8 *ptr);
void mapheader_run_script_with_tag_x1(void);
void mapheader_run_script_with_tag_x3(void);
void mapheader_run_script_with_tag_x5(void);
void mapheader_run_script_with_tag_x6(void);
bool8 mapheader_run_first_tag2_script_list_match(void);
void mapheader_run_first_tag4_script_list_match(void);
void ClearRamScript(void);
bool8 InitRamScript(u8 *script, u16 scriptSize, u8 mapGroup, u8 mapNum, u8 objectId);
u8 *GetRamScript(u8 objectId, u8 *script);
# 32 "src/engine/trade.c" 2
# 1 "include/field_fadetransition.h" 1



void palette_bg_fill_white(void);
void palette_bg_fill_black(void);
void pal_fill_black(void);
void pal_fill_black();
void pal_fill_black(void);
void task0A_asap_script_env_2_enable_and_set_ctx_running(u8);
void sub_8080990(void);
void sub_80809B0(void);
void sub_8080A3C(void);
void sub_8080AC4(void);
void mapldr_default();
void sub_8080B60(void);
void atk17_seteffectuser(void);
void sub_8080E28(void);
void sub_8080E44(void);
bool32 sub_8080E70(void);
void sub_8080E88(void);
void sub_8080E88();
void sp13E_warp_to_last_warp(void);
void sub_8080EF0(void);
void sp13F_fall_to_last_warp(void);
void sub_8080F2C(u8);
void sub_8080F48(void);
void sub_8080F58(void);
void sub_8080F68(void);
void sub_8080F9C(void);
# 33 "src/engine/trade.c" 2
# 1 "include/decompress.h" 1





void LZDecompressWram(const void *src, void *dest);
void LZDecompressVram(const void *src, void *dest);
void LoadCompressedObjectPic(const struct CompressedSpriteSheet *a);
void LoadCompressedObjectPicOverrideBuffer(const struct CompressedSpriteSheet *a, void *buffer);
void LoadCompressedObjectPalette(const struct CompressedSpritePalette *a);
void LoadCompressedObjectPaletteOverrideBuffer(const struct CompressedSpritePalette *a, void *buffer);
void DecompressPicFromTable_2(const struct CompressedSpriteSheet *a, u8 b, u8 c, void *d, void *e, s32 f);
void HandleLoadSpecialPokePic(const struct CompressedSpriteSheet *spriteSheet, u32 b, u32 c, u32 d, void *dest, s32 species, u32 pid);
void LoadSpecialPokePic(const struct CompressedSpriteSheet *spriteSheet, u32 b, u32 c, u32 d, void *dest, s32 species, u32 g, u32 h);
void Unused_LZDecompressWramIndirect(const void **src, void *dest);
# 34 "src/engine/trade.c" 2
# 1 "include/mail_data.h" 1



void ClearMailData(void);
void ClearMailStruct(struct MailStruct *);
void ClearMailStruct(struct MailStruct *);
u8 GiveMailToMon(struct Pokemon *, u16);
u16 SpeciesToMailSpecies(u16, u32);
u16 MailSpeciesToSpecies(u16, u16 *);
u8 GiveMailToMon2(struct Pokemon *, struct MailStruct *);
void TakeMailFromMon(struct Pokemon *);
u8 TakeMailFromMon2(struct Pokemon *);
bool8 ItemIsMail(u16);
bool8 MonHasMail(struct Pokemon *);
# 35 "src/engine/trade.c" 2
# 1 "include/evolution_scene.h" 1



void EvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, bool8 canStopEvo, u8 partyID);
void BeginEvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, bool8 canStopEvo, u8 partyID);
void TradeEvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, u8 preEvoSpriteID, u8 partyID);

extern void (*gCB2_AfterEvolution)(void);
# 36 "src/engine/trade.c" 2
# 1 "include/pokeball.h" 1



extern const struct SpriteTemplate gBallSpriteTemplates[];

void CreatePokeballSprite(u8 r0, u8 r1, u8 r2, u8 r3, u8 s1, u8 s2, u8 s3, u32 s4);
void sub_804777C(u8);
void sub_80478DC(u8);
void sub_804794C(u8);
u8 sub_8047580(u8, u8, u8, u8, u8, u8, u8, u32);
# 37 "src/engine/trade.c" 2
# 1 "include/pokedex.h" 1





void ResetPokedex(void);
void sub_808C0A0(void);
void CB2_InitPokedex(void);
u8 sub_809070C(u16 dexNum, u32 b, u32 c);
const u8 *GetPokemonCategory(u16);
u16 GetPokedexHeightWeight(u16 dexNum, u8 data);

enum
{
    FLAG_GET_SEEN,
    FLAG_GET_CAUGHT,
    FLAG_SET_SEEN,
    FLAG_SET_CAUGHT
};

s8 GetSetPokedexFlag(u16, u8);

u16 GetNationalPokedexCount(u8);
u16 GetHoennPokedexCount(u8);
bool8 sub_8090FC0(void);
u16 sub_8090FF4(void);
# 38 "src/engine/trade.c" 2
# 1 "include/field_effect.h" 1






enum FieldEffectScriptIdx
{
    FLDEFF_EXCLAMATION_MARK_ICON_1,
    FLDEFF_USE_CUT_ON_GRASS,
    FLDEFF_USE_CUT_ON_TREE,
    FLDEFF_SHADOW,
    FLDEFF_TALL_GRASS,
    FLDEFF_RIPPLE,
    FLDEFF_FIELD_MOVE_SHOW_MON,
    FLDEFF_ASH,
    FLDEFF_SURF_BLOB,
    FLDEFF_USE_SURF,
    FLDEFF_DUST,
    FLDEFF_USE_SECRET_POWER_CAVE,
    FLDEFF_JUMP_TALL_GRASS,
    FLDEFF_SAND_FOOTPRINTS,
    FLDEFF_JUMP_BIG_SPLASH,
    FLDEFF_SPLASH,
    FLDEFF_JUMP_SMALL_SPLASH,
    FLDEFF_LONG_GRASS,
    FLDEFF_JUMP_LONG_GRASS,
    FLDEFF_UNKNOWN_19,
    FLDEFF_UNKNOWN_20,
    FLDEFF_UNKNOWN_21,
    FLDEFF_UNKNOWN_22,
    FLDEFF_BERRY_TREE_GROWTH_SPARKLE,
    FLDEFF_DEEP_SAND_FOOTPRINTS,
    FLDEFF_POKECENTER_HEAL,
    FLDEFF_USE_SECRET_POWER_TREE,
    FLDEFF_USE_SECRET_POWER_SHRUB,
    FLDEFF_TREE_DISGUISE,
    FLDEFF_MOUNTAIN_DISGUISE,
    FLDEFF_NPCFLY_OUT,
    FLDEFF_USE_FLY,
    FLDEFF_FLY_IN,
    FLDEFF_EXCLAMATION_MARK_ICON_2,
    FLDEFF_FEET_IN_FLOWING_WATER,
    FLDEFF_BIKE_TIRE_TRACKS,
    FLDEFF_SAND_DISGUISE,
    FLDEFF_USE_ROCK_SMASH,
    FLDEFF_USE_DIG,
    FLDEFF_SAND_PILE,
    FLDEFF_USE_STRENGTH,
    FLDEFF_SHORT_GRASS,
    FLDEFF_HOT_SPRINGS_WATER,
    FLDEFF_USE_WATERFALL,
    FLDEFF_USE_DIVE,
    FLDEFF_POKEBALL,
    FLDEFF_HEART_ICON,
    FLDEFF_NOP_47,
    FLDEFF_NOP_48,
    FLDEFF_POP_OUT_OF_ASH,
    FLDEFF_LAVARIDGE_GYM_WARP,
    FLDEFF_SWEET_SCENT,
    FLDEFF_SAND_PILLAR,
    FLDEFF_BUBBLES,
    FLDEFF_SPARKLE,
    FLDEFF_SECRET_POWER_CAVE,
    FLDEFF_SECRET_POWER_TREE,
    FLDEFF_SECRET_POWER_SHRUB,
    FLDEFF_CUT_GRASS,
    FLDEFF_FIELD_MOVE_SHOW_MON_INIT,
    FLDEFF_USE_FLY_ANCIENT_TOMB,
    FLDEFF_SECRET_BASE_PC_TURN_ON,
    FLDEFF_HALL_OF_FAME_RECORD,
    FLDEFF_USE_TELEPORT
};

extern const struct CompressedSpritePalette gTrainerFrontPicPaletteTable[2];
extern const struct SpritePalette gUnknown_0839F114;
extern const struct CompressedSpriteSheet gTrainerFrontPicTable[2];
extern const struct SpriteTemplate gSpriteTemplate_839F128;
extern const struct OamData gOamData_839F0F4;
extern struct SpriteTemplate gUnknown_02024E8C;

extern u8 gLastFieldPokeMenuOpened;

u32 FieldEffectStart(u8 id);
bool8 FieldEffectCmd_loadtiles(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadfadedpal(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadpal(u8 **script, u32 *val);
bool8 FieldEffectCmd_callnative(u8 **script, u32 *val);
bool8 FieldEffectCmd_end(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadgfx_callnative(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadtiles_callnative(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadfadedpal_callnative(u8 **script, u32 *val);
u32 FieldEffectScript_ReadWord(u8 **script);
void FieldEffectScript_LoadTiles(u8 **script);
void FieldEffectScript_LoadFadedPalette(u8 **script);
void FieldEffectScript_LoadPalette(u8 **script);
void FieldEffectScript_CallNative(u8 **script, u32 *val);
void FieldEffectFreeGraphicsResources(struct Sprite *sprite);
void FieldEffectStop(struct Sprite *sprite, u8 id);
void FieldEffectFreeTilesIfUnused(u16 tileStart);
void FieldEffectFreePaletteIfUnused(u8 paletteNum);
void FieldEffectActiveListClear(void);
void FieldEffectActiveListAdd(u8 id);
void FieldEffectActiveListRemove(u8 id);
bool8 FieldEffectActiveListContains(u8 id);
void sub_807DE38(u8 index);

void SpriteCB_PokeballGlow(struct Sprite *);
void SpriteCB_PokecenterMonitor(struct Sprite *);
void SpriteCB_HallOfFameMonitor(struct Sprite *);

void sub_80865BC(void);

void PokecenterHealEffect_0(struct Task *);
void PokecenterHealEffect_1(struct Task *);
void PokecenterHealEffect_2(struct Task *);
void PokecenterHealEffect_3(struct Task *);

void HallOfFameRecordEffect_0(struct Task *);
void HallOfFameRecordEffect_1(struct Task *);
void HallOfFameRecordEffect_2(struct Task *);
void HallOfFameRecordEffect_3(struct Task *);

void PokeballGlowEffect_0(struct Sprite *);
void PokeballGlowEffect_1(struct Sprite *);
void PokeballGlowEffect_2(struct Sprite *);
void PokeballGlowEffect_3(struct Sprite *);
void PokeballGlowEffect_4(struct Sprite *);
void PokeballGlowEffect_5(struct Sprite *);
void PokeballGlowEffect_6(struct Sprite *);
void PokeballGlowEffect_7(struct Sprite *);

void sub_8086748(void);

bool8 sub_80867AC(struct Task *);
bool8 sub_8086854(struct Task *);
bool8 sub_8086870(struct Task *);
bool8 sub_80868E4(struct Task *);
bool8 sub_808699C(struct Task *);
bool8 sub_80869B8(struct Task *);
bool8 sub_80869F8(struct Task *);

void sub_8086A2C(u8, u8);

bool8 sub_8086AA0(struct Task *);
bool8 sub_8086AC0(struct Task *);
bool8 sub_8086B30(struct Task *);
bool8 sub_8086B54(struct Task *);
bool8 sub_8086B64(struct Task *);
bool8 sub_8086B88(struct Task *);

bool8 sub_8086CF4(struct Task *);
bool8 sub_8086D70(struct Task *);
bool8 sub_8086DB0(struct Task *);
bool8 sub_8086E10(struct Task *);
bool8 sub_8086E50(struct Task *);
bool8 sub_8086EB0(struct Task *);
bool8 sub_8086ED4(struct Task *);

bool8 sub_8086FB0(struct Task *, struct MapObject *);
bool8 waterfall_1_do_anim_probably(struct Task *, struct MapObject *);
bool8 waterfall_2_wait_anim_finish_probably(struct Task *, struct MapObject *);
bool8 sub_8087030(struct Task *, struct MapObject *);
bool8 sub_8087058(struct Task *, struct MapObject *);

bool8 sub_8087124(struct Task *);
bool8 dive_2_unknown(struct Task *);
bool8 dive_3_unknown(struct Task *);

void sub_80871B8(u8);

bool8 sub_808722C(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_8087264(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_8087298(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80872E4(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80873D8(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80873F4(struct Task *, struct MapObject *, struct Sprite *);

bool8 sub_80874CC(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80874FC(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_8087548(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_808759C(struct Task *, struct MapObject *, struct Sprite *);

void sub_8087654(u8);

bool8 sub_80876C8(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80876F8(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_8087774(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80877AC(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80877D4(struct Task *, struct MapObject *, struct Sprite *);

void sub_80878F4(struct Task *);
void sub_8087914(struct Task *);

void sub_8087AA4(struct Task *);
void sub_8087AC8(struct Task *);

void sub_8087BEC(struct Task *);
void sub_8087C14(struct Task *);
void sub_8087CA4(struct Task *);
void sub_8087D78(struct Task *);

void sub_8087E4C(struct Task *);
void sub_8087ED8(struct Task *);
void sub_8087FDC(struct Task *);

void sub_8088150(struct Task *);
void sub_80881C0(struct Task *);
void sub_8088228(struct Task *);
void sub_80882B4(struct Task *);
void sub_80882E4(struct Task *);
void sub_8088338(struct Task *);
void sub_8088380(struct Task *);

void sub_80884AC(struct Task *);
void sub_80884E8(struct Task *);
void sub_8088554(struct Task *);
void sub_80885A8(struct Task *);
void sub_80885D8(struct Task *);
void sub_808860C(struct Task *);
void sub_808862C(struct Task *);

void sub_8088984(struct Task *);
void sub_80889E4(struct Task *);
void sub_8088A30(struct Task *);
void sub_8088A78(struct Task *);
void sub_8088AF4(struct Task *);

void sub_8088CA0(struct Task *);
void sub_8088CF8(struct Task *);
void sub_8088D3C(struct Task *);
void sub_8088D94(struct Task *);
void sub_8088DD8(struct Task *);
void sub_8088E2C(struct Task *);
void sub_8088EB4(struct Task *);
void sub_8088F10(struct Task *);
void sub_8088F30(struct Task *);

void sub_80892A0(struct Task *);
void sub_8089354(struct Task *);
void sub_80893C0(struct Task *);
void sub_8089414(struct Task *);
void sub_808948C(struct Task *);
void sub_80894C4(struct Task *);
void fishE(struct Task *);

u8 CreateTrainerSprite(u8 trainerSpriteID, s16 x, s16 y, u8 subpriority, u8 *buffer);
void LoadTrainerGfx_TrainerCard(u8 gender, u16 palOffset, u8 *dest);
u8 CreateBirchSprite(s16 x, s16 y, u8 subpriority);
u8 CreateMonSprite_PicBox(u16, s16, s16, u8);
void FreeResourcesAndDestroySprite(struct Sprite *sprite);
void MultiplyInvertedPaletteRGBComponents(u16, u8, u8, u8);
void sub_80878A8(void);
void sub_8087BA8(void);

extern s32 gFieldEffectArguments[8];
# 39 "src/engine/trade.c" 2
# 1 "include/util.h" 1





extern const u8 gMiscBlank_Gfx[];
extern const u32 gBitTable[];

u8 CreateInvisibleSpriteWithCallback(void (*)(struct Sprite *));
void StoreWordInTwoHalfwords(u16 *, u32);
void LoadWordFromTwoHalfwords(u16 *, u32 *);
u16 CalcCRC16(u8 *data, int length);
void DoBgAffineSet(struct BgAffineDstData *dest, u32 texX, u32 texY, s16 scrX, s16 scrY, s16 sx, s16 sy, u16 alpha);
# 40 "src/engine/trade.c" 2
# 1 "include/battle_interface.h" 1



struct BattleInterfaceStruct1
{
    s32 unk0;
    s32 unk4;
    s32 unk8;
    u32 unkC_0:5;
    u32 unk10;
};

struct BattleInterfaceStruct2
{
    u16 unk0;
    u32 unk4;
};

u8 battle_make_oam_normal_battle(u8);
u8 battle_make_oam_safari_battle(void);
void sub_8043D84(u8, u8, u32, u32, u32);
void sub_8043DB0(u8);
void sub_8043DFC(u8);
void nullsub_11();
void sub_8043EB4(u8);
void sub_8043F44(u8);
void sub_804454C(void);
u8 sub_8044804(u8, const struct BattleInterfaceStruct2 *, u8, u8);
void sub_8044CA0(u8);
void sub_8045A5C(u8, struct Pokemon *, u8);
s32 sub_8045C78(u8, u8, u8, u8);
s16 sub_80460C8(struct BattleInterfaceStruct1 *, int *, u16 *, int);
u8 GetScaledHPFraction(s16, s16, u8);
u8 GetHPBarLevel(s16, s16);
void sub_80440EC(u8 a, s16 b, u8 c);
# 41 "src/engine/trade.c" 2
# 1 "include/trade.h" 1




struct TradeEwramSubstruct2 {
               u8 filler_0000;
               struct Window window;
               u8 textWindowBaseTileNum;
               struct Pokemon pokemon;
               u8 unk_009c;
               u8 unk_009d;
               u16 linkData[10];
               u8 unk_00b2;
               u8 unk_00b3;
               u16 unk_00b4;
               u16 unk_00b6;

               u8 pokePicSpriteIdxs[2];
               u8 unk_00ba;
               u8 unk_00bb;
               u8 unk_00bc;
               u8 unk_00bd;

               u32 unk_00c0;

               u16 unk_00c4;
               u8 filler_00c6[0x3c];
               u8 unk_0102;
               u8 unk_0103;
               u16 unk_0104;
               u16 unk_0106;
               u16 unk_0108;
               u16 unk_010a;
               u16 unk_010c;
               s16 unk_010e;
               s16 bg1vofs;
               s16 bg1hofs;
               s16 bg2vofs;
               s16 bg2hofs;
               u16 unk_0118;
               u16 unk_011a;
               u16 unk_011c;
               u8 isLinkTrade;
               u16 tradeSpecies[2];
               u16 unk_0124;
};

extern struct TradeEwramSubstruct2 *gUnknown_03004828;
extern const u16 gUnknown_0820C9F8[][16];
extern const u32 gUnknown_0820CA98[];
extern const u16 gUnknown_0820F798[];

void sub_8047CD8(void);
u16 sub_804DB2C(void);
void sub_804DB68(void);
void sub_804E174(void);
extern const u8 gOtherText_MaleSymbol3[2];
extern const u8 gOtherText_FemaleSymbol3[2];
extern const u8 gOtherText_GenderlessSymbol[2];

void sub_804E22C(void);
u16 sub_804D89C(void);
# 42 "src/engine/trade.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 43 "src/engine/trade.c" 2


asm(".set sub_804A96C_alt, sub_804A96C");



struct InGameTrade {
             u8 name[11];
             u16 species;
             u8 ivs[6];
             bool8 secondAbility;
             u32 otId;
             u8 stats[5];
             u32 personality;
             u16 heldItem;
             u8 mailNum;
             u8 otName[11];
             u8 otGender;
             u8 sheen;
             u16 playerSpecies;
};

struct UnkStructC {
             u16 words[9];
             u8 string[8];
             u8 otId[4];
             u16 species;
             u16 heldItem;
};

struct UnkStructD {
             u8 filler_00[8];
             void *vramAddr;
             u8 filler_0c[4];
             u8 unk_10;
             u16 unk_12[0x400];
};

struct UnkStructE {
             u8 unk_00;
             u16 unk_02;
             u8 unk_04;
};

struct TradeEwramSubstruct {
               u8 unk_0000;
               u8 unk_0001;
               struct Window window;
               u8 partyIcons[2][6];
               u8 tradeMenuCursorSpriteIdx;
               u8 tradeMenuCursorPosition;
               u8 partyCounts[2];
               u8 tradeMenuOptionsActive[13];
               u8 unk_0051[2][6];
               u8 unk_005d[2][6];
               u8 unk_0069[2][6];
               u8 unk_0075;
               u8 filler_0076[4];
               u8 unk_007a;
               u8 unk_007b;
               u8 unk_007c;
               u8 unk_007d;
               u16 unk_007e;
               u8 unk_0080[2];
               u8 unk_0082[2];
               u8 unk_0084;
               u8 unk_0085;
               u8 unk_0086;
               u8 unk_0087;
               u8 filler_0088[2];
               u8 unk_008a;
               u16 linkData[20];
               u8 unk_00b4;
               u8 unk_00b5[11];
               u8 filler_00c0[8];
               struct UnkStructD unk_00c8;
               struct UnkStructE unk_08dc[4];
               u8 filler_08fc[0x704];
};

__attribute__((section("iwram_data"))) u8 gUnknown_03000508[8];

struct UnkStructF {
    u8 filler_0000[9];
    u8 unk_0009;
    u8 filler_000a[0xff6];
};

struct TradeEwramStruct {
                u8 filler_00000[0x7000];
                struct TradeEwramSubstruct unk_07000;
                struct UnkStructF unk_08000;
                u8 filler_09000[0x4000];
                u8 tileBuffers[13][256];
                u8 filler_0dd00[0x1300];
                struct TradeEwramSubstruct2 unk_0f000;
};

static void sub_8047EC0(void);
static void sub_804AFB8(const struct WindowConfig *, u8 *, const u8 *, u8);
static void sub_804ACD8(const u8 *, u8 *, u8);
static void nullsub_5(u8, u8);
static void sub_804AA88(void);
static void sub_804A964(struct UnkStructD *, void *);
static void sub_80489F4(void);
static void sub_804AA0C(u8);
static bool8 sub_8048D44(void);
static void sub_804AF84(void);
static bool8 sub_804ABF8(void);
static void sub_804ACF4(u8);
static void sub_804A41C(u8);
static void sub_8048C70(void);
static void sub_8048B0C(u8);
static void sub_804AE3C(u8);
static void sub_804AF10(void);
static void sub_80494D8(void);
static void sub_8048AB4(void);
static void sub_804A940(struct UnkStructD *);
static void sub_804B41C(void);
static void sub_8049DE0(void);
static void sub_804AB30(void);
static void sub_8049ED4(u8);
static void sub_804A6DC(u8);
static void sub_804A938(struct UnkStructD *);
static void sub_804A9F4(u8);
static void sub_804AA00(u8);
static void sub_8049E9C(u8);
static void sub_804AADC(u16, u8);
static void sub_804A80C(void);
static u8 sub_80499F0(const u8 *, u8, u8);
static void sub_804A840(u8);



u8 sub_804A2B4(u8 *, u8, u8);
static void sub_804A96C(struct UnkStructD *, u8, u8, const u16 *, u8, u8, u16);
static void sub_804A96C(struct UnkStructD *, u8, u8, const u16 *, u8, u8, u16);



void sub_804A33C(u8 *, u8, u8);



void sub_804A51C(u8, u8, u8, u8, u8, u8);
static void sub_804D7AC(struct Sprite *);
static bool8 sub_804C29C(void);
static void sub_804DC18(void);
static u8 sub_804B2B0(void);
static void sub_804E144(void);
static void sub_804E1A0(u8);
static void sub_804DAD4(struct MailStruct *, const struct InGameTrade *);
static void sub_804DC88(void);
static void sub_804D6BC(struct Sprite *);
static void sub_804D738(struct Sprite *);
static void sub_804BBE8(u8);
static void sub_804B058(struct Sprite *);
static void sub_804B07C(struct Sprite *);
static void sub_804B0BC(struct Sprite *);
static void sub_804B104(struct Sprite *);
static void sub_804D80C(struct Sprite *);
static void sub_804E1DC(void);
static void sub_804BBCC(void);
static void sub_804D8E4(void);
static void sub_804C164(void);
static void sub_804C1A8(void);



void sub_804DB84(void);

extern u8 gUnknown_020297D8[2];
extern u8 *gUnknown_020296CC[13];
extern struct TradeEwramSubstruct *gUnknown_03004824;
extern struct MailStruct gUnknown_02029700[16];

const u32 unref_data_820ABD4[] = {
    0x00000890,
    0x00003AC0,
    0x0000001C,
    0x00000530,
    0x00000024,
    0x00000064,
    0x000004D8
};

const u16 gTradeMovesBoxTilemap[] = INCBIN_U16("graphics/trade/moves_box_map.bin");
const u16 gTradePartyBoxTilemap[] = INCBIN_U16("graphics/trade/party_box_map.bin");
const u16 gTradeStripesBG2Tilemap[] = INCBIN_U16("graphics/trade/stripes_bg2_map.bin");
const u16 gTradeStripesBG3Tilemap[] = INCBIN_U16("graphics/trade/stripes_bg3_map.bin");

const struct OamData gOamData_820BFEC = {
    .shape = 1,
    .size = 2,
    .priority = 1
};

const union AnimCmd gSpriteAnim_820BFF4[] = {
    {.frame = {0, 5}},
    {.type = -1}
};

const union AnimCmd gSpriteAnim_820BFFC[] = {
    {.frame = {8, 5}},
    {.type = -1}
};

const union AnimCmd gSpriteAnim_820C004[] = {
    {.frame = {16, 5}},
    {.type = -1}
};

const union AnimCmd gSpriteAnim_820C00C[] = {
    {.frame = {24, 5}},
    {.type = -1}
};

const union AnimCmd gSpriteAnim_820C014[] = {
    {.frame = {32, 5}},
    {.type = -1}
};

const union AnimCmd gSpriteAnim_820C01C[] = {
    {.frame = {40, 5}},
    {.type = -1}
};

const union AnimCmd *const gSpriteAnimTable_820C024[] = {
    gSpriteAnim_820BFF4,
    gSpriteAnim_820BFFC,
    gSpriteAnim_820C004,
    gSpriteAnim_820C00C,
    gSpriteAnim_820C014,
    gSpriteAnim_820C01C
};

const u16 TradeScreenTextPalette[] = INCBIN_U16("graphics/trade/text1.gbapal");
const u16 UnrefTradeScreenTextPalette[] = INCBIN_U16("graphics/trade/text2.gbapal");

const struct SpriteSheet gUnknown_0820C07C[] = {
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[ 0], 256, 200},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[ 1], 256, 201},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[ 2], 256, 202},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[ 3], 256, 203},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[ 4], 256, 204},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[ 5], 256, 205},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[ 6], 256, 206},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[ 7], 256, 207},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[ 8], 256, 208},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[ 9], 256, 209},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[10], 256, 210},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[11], 256, 211},
    {(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[12], 256, 212},
};

const struct SpritePalette gSpritePalette_TradeScreenText = {
    TradeScreenTextPalette, 4925
};

const struct SpriteTemplate gSpriteTemplate_820C0EC = {
    200,
    4925,
    &gOamData_820BFEC,
    gSpriteAnimTable_820C024,
    ((void *)0),
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

const struct OamData gOamData_820C104 = {
    .shape = 1,
    .size = 3,
    .priority = 1
};

const union AnimCmd gSpriteAnim_820C10C[] = {
    {.frame = {0, 5}},
    {.type = -1}
};

const union AnimCmd gSpriteAnim_820C114[] = {
    {.frame = {32, 5}},
    {.type = -1}
};

const union AnimCmd *const gSpriteAnimTable_820C11C[] = {
    gSpriteAnim_820C10C,
    gSpriteAnim_820C114
};

const struct SpriteSheet gUnknown_0820C124 = {
    gUnknown_08EA1DEC, 0x800, 300
};

const struct SpritePalette gUnknown_0820C12C = {
    gUnknown_08EA0328, 2345
};

const struct SpriteTemplate gSpriteTemplate_820C134 = {
    300,
    2345,
    &gOamData_820C104,
    gSpriteAnimTable_820C11C,
    ((void *)0),
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

const u8 *const gUnknown_0820C14C[] = {
    TradeText_Cancel,
    TradeText_ChoosePoke,
    TradeText_Summary1,
    TradeText_Trade1,
    TradeText_CancelTradePrompt,
    TradeText_PressBToExit
};
# 370 "src/engine/trade.c"
const u8 gTradeNextSelectedMonTable[][4][6] = {
    {
        { 4, 2, 12, 12, 0, 0},
        { 2, 4, 12, 12, 0, 0},
        { 7, 6, 1, 0, 0, 0},
        { 1, 6, 7, 0, 0, 0}
    }, {
        { 5, 3, 12, 12, 0, 0},
        { 3, 5, 12, 12, 0, 0},
        { 0, 7, 6, 1, 0, 0},
        { 6, 7, 0, 1, 0, 0}
    }, {
        { 0, 0, 0, 0, 0, 0},
        { 4, 0, 0, 0, 0, 0},
        { 9, 8, 7, 6, 0, 0},
        { 3, 1, 0, 0, 0, 0}
    }, {
        { 1, 1, 1, 1, 0, 0},
        { 5, 1, 1, 1, 0, 0},
        { 2, 9, 8, 7, 0, 0},
        { 8, 9, 6, 6, 0, 0}
    }, {
        { 2, 2, 2, 2, 0, 0},
        { 0, 0, 0, 0, 0, 0},
        {11, 10, 9, 8, 7, 6},
        { 5, 3, 1, 0, 0, 0}
    }, {
        { 3, 3, 3, 3, 0, 0},
        { 1, 1, 1, 1, 0, 0},
        { 4, 4, 4, 4, 0, 0},
        {10, 8, 6, 0, 0, 0}
    }, {
        {10, 8, 12, 0, 0, 0},
        { 8, 10, 12, 0, 0, 0},
        { 1, 0, 0, 0, 0, 0},
        { 7, 0, 1, 0, 0, 0}
    }, {
        {12, 0, 0, 0, 0, 0},
        { 9, 12, 0, 0, 0, 0},
        { 6, 0, 0, 0, 0, 0},
        { 0, 0, 0, 0, 0, 0}
    }, {
        { 6, 0, 0, 0, 0, 0},
        {10, 6, 0, 0, 0, 0},
        { 3, 2, 1, 0, 0, 0},
        { 9, 7, 0, 0, 0, 0}
    }, {
        { 7, 0, 0, 0, 0, 0},
        {11, 12, 0, 0, 0, 0},
        { 8, 0, 0, 0, 0, 0},
        { 2, 1, 0, 0, 0, 0}
    }, {
        { 8, 0, 0, 0, 0, 0},
        { 6, 0, 0, 0, 0, 0},
        { 5, 4, 3, 2, 1, 0},
        {11, 9, 7, 0, 0, 0}
    }, {
        { 9, 0, 0, 0, 0, 0},
        {12, 0, 0, 0, 0, 0},
        {10, 0, 0, 0, 0, 0},
        { 4, 2, 0, 0, 0, 0}
    }, {
        {11, 9, 7, 6, 0, 0},
        { 7, 6, 0, 0, 0, 0},
        {12, 0, 0, 0, 0, 0},
        {12, 0, 0, 0, 0, 0}
    }
};

const u8 gTradeMonSpriteCoords[][2] = {

    {1, 5},
    {8, 5},
    {1, 10},
    {8, 10},
    {1, 15},
    {8, 15},


    {16, 5},
    {23, 5},
    {16, 10},
    {23, 10},
    {16, 15},
    {23, 15},

    {23, 18}
};

const u8 gTradeLevelDisplayCoords[2][6][2] = {
    {

        {5, 4},
        {12, 4},
        {5, 9},
        {12, 9},
        {5, 14},
        {12, 14},
    },
    {

        {20, 4},
        {27, 4},
        {20, 9},
        {27, 9},
        {20, 14},
        {27, 14}
    }
};

const u8 gTradeMonBoxCoords[2][6][2] = {
    {

        {1, 3},
        {8, 3},
        {1, 8},
        {8, 8},
        {1, 13},
        {8, 13},
    },
    {

        {16, 3},
        {23, 3},
        {16, 8},
        {23, 8},
        {16, 13},
        {23, 13}
    }
};

const u8 gTradeUnknownSpriteCoords[][2][2] = {
    {
        { 59, 10},
        {179, 10},
    },
    {
        { 59, 10},
        {179, 10}
    }
};

const u8 *const gUnknown_0820C2F0[] = {
    TradeText_LinkStandby,
    TradeText_TradeCancelled,
    TradeText_OnlyPoke,
    TradeText_NonTradablePoke,
    TradeText_WaitingForFriend,
    TradeText_WantToTrade
};

const u8 gTradeMessageWindowRects[][4] = {
    {8, 7, 22, 12},
    {8, 7, 22, 12},
    {6, 7, 24, 12},
    {6, 7, 24, 12},
    {8, 7, 22, 12},
    {7, 7, 23, 12}
};

const struct MenuAction2 gUnknown_0820C320[] = {
    {TradeText_Summary2, sub_804A9F4},
    {TradeText_Trade2, sub_804AA00}
};

const u8 gUnknown_0820C330[][2] = {
    { 0, 14},
    {15, 29}
};

const u8 gUnknown_0820C334[][2] = {
    { 3, 5},
    { 3, 7},
    {18, 5},
    {18, 7}
};

const u8 gOtherText_Terminator[] = _("");
const u8 gOtherText_MaleSymbol3[] = _("♂");
const u8 gOtherText_FemaleSymbol3[] = _("♀");
const u8 gOtherText_GenderlessSymbol[] = _("$");

u8 *const unref_data_820C344 = gTileBuffer;
const u8 unref_strings_820C348[][13] = {
    _("かいめの そうしん"),
    _("かいめの じゅしん"),
    _("ポケモンアイコンセット"),
    _("OBJテキストセット"),
    _("セルセット"),
    _("OBJテキストADD"),
    _("システムメッセージADD"),
    _("はいけいセット"),
};

const u8 gUnknown_0820C3B0[] = _("ヌケニン");
const u8 unref_string_0820C3B5[] = _("こうかんせいりつ     ");
const u8 unref_string_0820C3C3[] = _("だめだたらしいよ     ");
const u8 gUnknown_0820C3D1[][2] = {
    { 4, 3},
    {19, 3},
    { 0, 0}
};

const u16 gTradeBallPalette[] = INCBIN_U16("graphics/trade/ball.gbapal");
const u32 gTradeBallTiles[] = INCBIN_U32("graphics/trade/ball.4bpp");
const u16 gUnknown_0820C9F8[][16] = {
    INCBIN_U16("graphics/trade/unknown.gbapal"),
    INCBIN_U16("graphics/trade/gba.gbapal"),
    INCBIN_U16("graphics/trade/shadow.gbapal"),
    {},
    INCBIN_U16("graphics/trade/misc.gbapal")
};

const u32 gUnknown_0820CA98[] = INCBIN_U32("graphics/trade/gba.4bpp");
const u32 gUnknown_0820CA98_2[] = INCBIN_U32("graphics/trade/shadow.4bpp");
const u32 gUnknown_0820DD98[] = INCBIN_U32("graphics/trade/pokeball_symbol.8bpp");
const u16 gUnknown_0820F798[] = INCBIN_U16("graphics/trade/shadow_map.bin");
const u16 gUnknown_08210798[] = INCBIN_U16("graphics/trade/gba_map.bin");
const u16 gUnknown_08211798[] = INCBIN_U16("graphics/trade/cable_closeup_map.bin");
const u16 gUnknown_08211F98[] = INCBIN_U16("graphics/trade/pokeball_symbol_map.bin");
const u16 unused_08212098[] = INCBIN_U16("graphics/unused/unknown/8212098.gbapal");
const u16 gTradeCableEndPalette[] = INCBIN_U16("graphics/trade/cable_end.gbapal");
const u16 unused_082120D8[] = INCBIN_U16("graphics/unused/unknown/82120D8.gbapal");
const u16 nullpal_082120F8[16] = {};
const u16 gTradeGlowPalette[] = INCBIN_U16("graphics/trade/glow.gbapal");
const u32 gTradeGlow1Tiles[] = INCBIN_U32("graphics/trade/glow1.4bpp");
const u32 gTradeGlow2Tiles[] = INCBIN_U32("graphics/trade/glow2.4bpp");
const u32 gTradeCableEndTiles[] = INCBIN_U32("graphics/trade/cable_end.4bpp");
const u32 gTradeGBAScreenTiles[] = INCBIN_U32("graphics/trade/gba_screen.4bpp");
const u32 gUnknown_08213738[] = INCBIN_U32("graphics/trade/gba_affine.8bpp");
const u16 gUnknown_08215778[] = INCBIN_U16("graphics/trade/gba_affine_map.bin");

const struct OamData gOamData_8215878 = {
    .affineMode = 1,
    .size = 1
};

const union AnimCmd gSpriteAnim_8215880[] = {
    {.frame = {0, 3}},
    {.frame = {4, 3}},
    {.frame = {8, 3}},
    {.frame = {12, 3}},
    {.frame = {16, 3}},
    {.frame = {20, 3}},
    {.frame = {24, 3}},
    {.frame = {28, 3}},
    {.frame = {32, 3}},
    {.frame = {36, 3}},
    {.frame = {40, 3}},
    {.frame = {44, 3}},
    {.loop = {.type = -3, .count = 1}},
    {.frame = {0, 3}},
    {.type = -1}
};

const union AnimCmd gSpriteAnim_82158BC[] = {
    {.frame = {0, 3}},
    {.frame = {4, 3}},
    {.frame = {8, 3}},
    {.frame = {12, 3}},
    {.frame = {16, 3}},
    {.frame = {20, 3}},
    {.frame = {24, 3}},
    {.frame = {28, 3}},
    {.frame = {32, 3}},
    {.frame = {36, 3}},
    {.frame = {40, 3}},
    {.frame = {44, 3}},
    {.loop = {.type = -3, .count = 2}},
    {.frame = {0, 3}},
    {.type = -1}
};

const union AnimCmd *const gSpriteAnimTable_82158F8[] = {
    gSpriteAnim_8215880,
    gSpriteAnim_82158BC
};

const union AffineAnimCmd gSpriteAffineAnim_8215900[] = {
    {.frame = {.xScale = 0, .yScale = 0, .rotation = 0, .duration = 1}},
    {.type = 0x7FFF}
};

const union AffineAnimCmd gSpriteAffineAnim_8215910[] = {
    {.frame = {.xScale = -8, .yScale = 0, .rotation = 0, .duration = 20}},
    {.type = 0x7FFF}
};

const union AffineAnimCmd gSpriteAffineAnim_8215920[] = {
    {.frame = {.xScale = 0x60, .yScale = 0x100, .rotation = 0, .duration = 0}},
    {.frame = {.xScale = 0, .yScale = 0, .rotation = 0, .duration = 5}},
    {.frame = {.xScale = 8, .yScale = 0, .rotation = 0, .duration = 20}},
    {.type = 0x7FFF}
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_8215940[] = {
    gSpriteAffineAnim_8215900,
    gSpriteAffineAnim_8215910,
    gSpriteAffineAnim_8215920
};

const struct SpriteSheet gUnknown_0821594C = {
    (const u8 *)gTradeBallTiles, 0x600, 5557
};

const struct SpritePalette gUnknown_08215954 = {
    gTradeBallPalette, 5558
};

const struct SpriteTemplate gSpriteTemplate_821595C = {
    5557,
    5558,
    &gOamData_8215878,
    gSpriteAnimTable_82158F8,
    ((void *)0),
    gSpriteAffineAnimTable_8215940,
    sub_804D6BC
};

const struct OamData gOamData_8215974 = {
    .affineMode = 1,
    .objMode = 1,
    .size = 2,
    .priority = 1
};

const union AnimCmd gSpriteAnim_821597C[] = {
    {.frame = {0, 5, .hFlip = 1, .vFlip = 1}},
    {.type = -1}
};

const union AnimCmd *const gSpriteAnimTable_8215984[] = {
    gSpriteAnim_821597C
};

const union AffineAnimCmd gSpriteAffineAnim_8215988[] = {
    {.frame = {.xScale = -10, .yScale = -10, .rotation = 0, .duration = 5}},
    {.frame = {.xScale = 10, .yScale = 10, .rotation = 0, .duration = 5}},
    {.jump = {.type = 0x7FFE, .target = 0}}
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_82159A0[] = {
    gSpriteAffineAnim_8215988
};

const struct SpriteSheet gUnknown_082159A4 = {
    (const u8 *)gTradeGlow1Tiles, 0x200, 5550
};

const struct SpritePalette gUnknown_082159AC = {
    gTradeGlowPalette, 5551
};

const struct SpritePalette gUnknown_082159B4 = {
    gTradeCableEndPalette, 5555
};

const struct SpriteTemplate gSpriteTemplate_82159BC = {
    5550,
    5551,
    &gOamData_8215974,
    gSpriteAnimTable_8215984,
    ((void *)0),
    gSpriteAffineAnimTable_82159A0,
    sub_804B058
};

const struct OamData gOamData_82159D4 = {
    .shape = 2,
    .size = 2,
    .priority = 1
};

const union AnimCmd gSpriteAnim_82159DC[] = {
    {.frame = {0, 5, .vFlip = 1, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd gSpriteAnim_82159E4[] = {
    {.frame = {8, 5, .vFlip = 1, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd *const gSpriteAnimTable_82159EC[] = {
    gSpriteAnim_82159DC,
    gSpriteAnim_82159E4
};

const struct SpriteSheet gUnknown_082159F4 = {
    (const u8 *)gTradeGlow2Tiles, 0x300, 5552
};

const struct SpriteTemplate gSpriteTemplate_82159FC = {
    5552,
    5551,
    &gOamData_82159D4,
    gSpriteAnimTable_82159EC,
    ((void *)0),
    gDummySpriteAffineAnimTable,
    sub_804B07C
};

const struct OamData gOamData_8215A14 = {
    .shape = 2,
    .size = 2,
    .priority = 1
};

const union AnimCmd gSpriteAnim_8215A1C[] = {
    {.frame = {0, 10}},
    {.type = -1}
};

const union AnimCmd *const gSpriteAnimTable_8215A24[] = {
    gSpriteAnim_8215A1C
};

const struct SpriteSheet gUnknown_08215A28 = {
    (const u8 *)gTradeCableEndTiles, 0x100, 5554
};

const struct SpriteTemplate gSpriteTemplate_8215A30 = {
    5554,
    5555,
    &gOamData_8215A14,
    gSpriteAnimTable_8215A24,
    ((void *)0),
    gDummySpriteAffineAnimTable,
    sub_804B0BC
};

const struct OamData gOamData_8215A48 = {
    .shape = 1,
    .size = 3,
    .priority = 1
};

const union AnimCmd gSpriteAnim_8215A50[] = {
    {.frame = {0, 2, .vFlip = 1, .hFlip = 1}},
    {.frame = {32, 2, .vFlip = 1, .hFlip = 1}},
    {.frame = {64, 2, .vFlip = 1, .hFlip = 1}},
    {.frame = {96, 2, .vFlip = 1, .hFlip = 1}},
    {.frame = {64, 2, .vFlip = 1, .hFlip = 1}},
    {.frame = {32, 2, .vFlip = 1, .hFlip = 1}},
    {.frame = {0, 2, .vFlip = 1, .hFlip = 1}},
    {.loop = {.type = -3, .count = 8}},
    {.type = -1}
};

const union AnimCmd *const gSpriteAnimTable_8215A74[] = {
    gSpriteAnim_8215A50
};

const struct SpriteSheet gUnknown_08215A78 = {
    (const u8 *)gTradeGBAScreenTiles, 0x1000, 5556
};

const struct SpriteTemplate gSpriteTemplate_8215A80 = {
    5556,
    5555,
    &gOamData_8215A48,
    gSpriteAnimTable_8215A74,
    ((void *)0),
    gDummySpriteAffineAnimTable,
    sub_804B104
};

const u16 gTradeGlow2PaletteAnimTable[] = {
    ((18) | ((24) << 5) | ((31) << 10)),
    ((18) | ((24) << 5) | ((31) << 10)),
    ((18) | ((24) << 5) | ((31) << 10)),
    ((31) | ((31) << 5) | ((31) << 10)),
    ((31) | ((31) << 5) | ((31) << 10)),
    ((31) | ((31) << 5) | ((31) << 10)),
    ((18) | ((24) << 5) | ((31) << 10)),
    ((18) | ((24) << 5) | ((31) << 10)),
    ((18) | ((24) << 5) | ((31) << 10)),
    ((31) | ((31) << 5) | ((31) << 10)),
    ((31) | ((31) << 5) | ((31) << 10)),
    ((31) | ((31) << 5) | ((31) << 10)),
};

const union AffineAnimCmd gSpriteAffineAnim_8215AB0[] = {
    {.frame = {.xScale = -0x100, .yScale = 0x100, .rotation = 0, .duration = 0}},
    {.jump = {.type = 0x7FFE, .target = 0}}
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_8215AC0[] = {
    gSpriteAffineAnim_8215AB0
};

const struct InGameTrade gIngameTrades[] = {
    {
        _("MAKIT"), SPECIES_MAKUHITA,
        5, 5, 4, 4, 4, 4,
        1, 49562,
        5, 5, 5, 5, 30,
        0x9C40,
        ITEM_X_ATTACK, -1,
        _("ELYSSA"), MALE, 10,
        SPECIES_SLAKOTH
    }, {
        _("SKITIT"), SPECIES_SKITTY,
        5, 4, 4, 5, 4, 4,
        0, 2259,
        5, 5, 30, 5, 5,
        0x498A2E17,
        ITEM_GLITTER_MAIL, 0,
        _("DARRELL"), FEMALE, 10,
        SPECIES_PIKACHU
    }, {
        _("COROSO"),
        SPECIES_CORSOLA,
        4, 4, 5, 4, 4, 5,
        1, 50183,
        5, 30, 5, 5, 5,
        0x4C970B7F,
        ITEM_TROPIC_MAIL, 1,
        _("LANE"), FEMALE, 10,
        SPECIES_BELLOSSOM
    }

};

const u16 gIngameTradeMail[][10] = {
    {
        ((EC_GROUP_POKEMON << 9) | SPECIES_PIKACHU),
        EC_WORD_THANK_YOU,
        EC_WORD_EXCL,
        EC_WORD_MY,
        ((EC_GROUP_POKEMON << 9) | SPECIES_SKITTY),
        EC_WORD_EATS,
        EC_WORD_A_LOT,
        EC_WORD_NOW,
        EC_WORD_EXCL,
        0
    }, {
        EC_WORD_I,
        EC_WORD_WANT,
        EC_WORD_TO,
        EC_WORD_SEE,
        EC_WORD_A,
        ((EC_GROUP_MOVE_2 << 9) | MOVE_PETAL_DANCE),
        EC_WORD_IT_S,
        EC_WORD_SO,
        EC_WORD_PRETTY,
        0
    }
};

const s8 gTradeBallVerticalVelocityTable[] = {
    0, 0, 1, 0,
    1, 0, 1, 1,
    1, 1, 2, 2,
    2, 2, 3, 3,
    3, 3, 4, 4,
    4, 4, -4, -4,
    -4, -3, -3, -3,
    -3, -2, -2, -2,
    -2, -1, -1, -1,
    -1, 0, -1, 0,
    -1, 0, 0, 0,
    0, 0, 1, 0,
    1, 0, 1, 1,
    1, 1, 2, 2,
    2, 2, 3, 3,
    3, 3, 4, 4,
    4, 4, -4, -3,
    -3, -2, -2, -1,
    -1, -1, 0, -1,
    0, 0, 0, 0,
    0, 0, 1, 0,
    1, 1, 1, 2,
    2, 3, 3, 4,
    -4, -3, -2, -1,
    -1, -1, 0, 0,
    0, 0, 1, 0,
    1, 1, 2, 3
};



void sub_8047CD8(void)
{
    SetMainCallback2(sub_8047EC0);
}

static void sub_8047CE8(void)
{
    u8 mpId;
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC[0], gSaveBlock2.playerName, 0xC);
    mpId = GetMultiplayerId();
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC[3], gLinkPlayers[mpId ^ 1].name, 0xC);
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC[6], gUnknown_0820C14C[0], 0x8);
    sub_804ACD8(gUnknown_0820C14C[1], gUnknown_020296CC[8], 0x14);
    nullsub_5(3, 0);
}

static void sub_8047D58(void)
{
    struct SpriteTemplate spriteTemplate;
    int i;
    u8 mpId;
    u16 slen;
    int language;

    slen = StringLength(gSaveBlock2.playerName);
    language = slen <= 5 ? 0 : 1;
    for (i = 0; i < 3; i ++)
    {
        spriteTemplate = gSpriteTemplate_820C0EC;
        spriteTemplate.tileTag += i;
        CreateSprite(&spriteTemplate, gTradeUnknownSpriteCoords[language][0][0] + 32 * i, gTradeUnknownSpriteCoords[language][0][1], 1);
    }

    mpId = GetMultiplayerId();
    slen = StringLength(gLinkPlayers[mpId ^ 1].name);
    language = slen <= 5 ? 0 : 1;
    for (i = 0; i < 3; i ++)
    {
        spriteTemplate = gSpriteTemplate_820C0EC;
        spriteTemplate.tileTag += i + 3;
        CreateSprite(&spriteTemplate, gTradeUnknownSpriteCoords[language][1][0] + 32 * i, gTradeUnknownSpriteCoords[language][1][1], 1);
    }
    nullsub_5(5, 0);
}

static void sub_8047E44(void)
{
    struct SpriteTemplate spriteTemplate;
    int i;

    for (i = 0; i < 2; i ++)
    {
        spriteTemplate = gSpriteTemplate_820C0EC;
        spriteTemplate.tileTag += i + 6;
        CreateSprite(&spriteTemplate, 0xd6 + 32 * i, 0x98, 1);
    }

    for (i = 0; i < 5; i ++)
    {
        spriteTemplate = gSpriteTemplate_820C0EC;
        spriteTemplate.tileTag += i + 8;
        CreateSprite(&spriteTemplate, 0x18 + 32 * i, 0x96, 1);
    }
}

static void sub_8047EC0(void)
{
    int i;

    switch (gMain.state)
    {
        case 0:
            gUnknown_03004824 = &(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).unk_07000;
            sub_804AA88();
            ResetSpriteData();
            FreeAllSpritePalettes();
            ResetTasks();
            sub_804A964(&gUnknown_03004824->unk_00c8, (void *)(0x6000000 + (0x800 * (5))));
            SetVBlankCallback(sub_80489F4);
            InitMenuWindow(&gWindowConfig_81E6CE4);
            SetUpWindowConfig(&gWindowConfig_81E6F84);
            InitWindowFromConfig(&gUnknown_03004824->window, &gWindowConfig_81E6F84);
            gUnknown_03004824->unk_007a = SetTextWindowBaseTileNum(20);
            LoadTextWindowGraphics(&gUnknown_03004824->window);
            MenuZeroFillScreen();
            sub_809D51C();
            gUnknown_03004824->unk_0075 = 0;
            gUnknown_03004824->unk_007b = 0;
            gUnknown_03004824->unk_007c = 0;
            gUnknown_03004824->unk_0080[0] = 0;
            gUnknown_03004824->unk_0080[1] = 0;
            gUnknown_03004824->unk_0086 = 0;
            gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_00b4 = 0;
            gUnknown_03000508[0] = 0;
            gMain.state ++;
            sub_804AA0C(0);
            { vu16 tmp = (vu16)(0); CpuSet((void *)&tmp, (*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers, 0x00000000 | 0x01000000 | ((sizeof((*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers))/(16/8) & 0x1FFFFF)); };
            for (i = 0; i < 13; i ++)
                gUnknown_020296CC[i] = (*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[i];
            break;
        case 1:
            gLinkType = 0x1122;
            OpenLink();
            for (i = 0; i < 6; i ++)
                CreateMon(&gEnemyParty[i], 0, 0, 0x20, 0, 0, 0, 0);
            gMain.state ++;
            gUnknown_03004824->unk_00b4 = 0;
            CreateTask(sub_8083C50, 1);
            break;
        case 2:
            gUnknown_03004824->unk_00b4 ++;
            if (gUnknown_03004824->unk_00b4 > 11)
            {
                gUnknown_03004824->unk_00b4 = 0;
                gMain.state ++;
            }
            break;
        case 3:
            if (GetLinkPlayerCount_2() >= sub_800820C())
            {
                if (IsLinkMaster())
                {
                    if (++gUnknown_03004824->unk_00b4 > 30)
                    {
                        sub_8007F4C();
                        gMain.state ++;
                    }
                }
                else
                    gMain.state ++;
            }
            break;
        case 4:
            if (gReceivedRemoteLinkPlayers == 1 && IsLinkPlayerDataExchangeComplete() == 1)
            {
                CalculatePlayerPartyCount();
                gMain.state ++;
            }
            break;
        case 5:
            if (sub_8048D44())
            {
                sub_804AF84();
                gMain.state ++;
            }
            break;
        case 6:
            CalculateEnemyPartyCount();
            FillWindowRect_DefaultPalette(&gUnknown_03004824->window, 0, 0, 0, 29, 19);
            (*(vu16 *)(0x4000000 + 0x0)) = 0;
            gUnknown_03004824->partyCounts[0] = gPlayerPartyCount;
            gUnknown_03004824->partyCounts[1] = gEnemyPartyCount;
            for (i = 0; i < gUnknown_03004824->partyCounts[0]; i ++)
                gUnknown_03004824->partyIcons[0][i] = CreateMonIcon(GetMonData(&gPlayerParty[i], 65), sub_809D62C, gTradeMonSpriteCoords[i][0] * 8 + 14, gTradeMonSpriteCoords[i][1] * 8 - 12, 1, GetMonData(&gPlayerParty[i], 0));
            for (i = 0; i < gUnknown_03004824->partyCounts[1]; i ++)
                gUnknown_03004824->partyIcons[1][i] = CreateMonIcon(GetMonData(&gEnemyParty[i], 65, ((void *)0)), sub_809D62C, gTradeMonSpriteCoords[6 + i][0] * 8 + 14, gTradeMonSpriteCoords[6 + i][1] * 8 - 12, 1, GetMonData(&gEnemyParty[i], 0));
            nullsub_5(2, 0);
            gMain.state ++;
            break;
        case 7:
            LoadHeldItemIconGraphics();
            CreateHeldItemIcons(&gUnknown_03004824->partyCounts[0], gUnknown_03004824->partyIcons[0], 0);
            gMain.state ++;
            break;
        case 8:
            CreateHeldItemIcons(&gUnknown_03004824->partyCounts[0], gUnknown_03004824->partyIcons[0], 1);
            gMain.state ++;
            break;
        case 9:
            sub_8047CE8();
            gMain.state ++;
            gUnknown_03004824->unk_00b4 = 0;
            break;
        case 10:
            nullsub_5(4, 0);
            if (sub_804ABF8())
                gMain.state ++;
            break;
        case 11:
            sub_8047D58();
            gMain.state ++;
            break;
        case 12:
            sub_8047E44();
            gUnknown_03004824->tradeMenuCursorSpriteIdx = CreateSprite(&gSpriteTemplate_820C134, gTradeMonSpriteCoords[0][0] * 8 + 32, gTradeMonSpriteCoords[0][1] * 8, 2);
            gUnknown_03004824->tradeMenuCursorPosition = 0;
            gMain.state ++;
            nullsub_5(6, 0);
            break;
        case 13:
            sub_804ACF4(0);
            sub_804A41C(0);
            gUnknown_03004824->unk_0000 = 0;
            gUnknown_03004824->unk_0001 = 0;
            sub_8048C70();
            gMain.state ++;
            nullsub_5(7, 0);
            PlayBGM(BGM_P_SCHOOL);
            break;
        case 14:
            sub_804ACF4(1);
            sub_804A41C(1);
            gMain.state ++;

        case 15:
            sub_8048B0C(0);
            gMain.state ++;
            break;
        case 16:
            sub_8048B0C(1);
            gMain.state ++;
            break;
        case 17:
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            gMain.state ++;
            break;
        case 18:
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0040 | 0x0F00 | 0x1000;
            gMain.state ++;
            break;
        case 19:
            sub_804AE3C(0);
            gMain.state ++;
            break;
        case 20:
            sub_804AE3C(1);
            sub_804AF10();
            gMain.state ++;
            break;
        case 21:
            if (!gPaletteFade.active)
            {
                gMain.callback1 = sub_80494D8;
                SetMainCallback2(sub_8048AB4);
                gUnknown_03000508[0] = 0;
            }
            break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_80484F4(void)
{
    int i;
    struct UnkStructF *unkStructF;

    switch (gMain.state)
    {
        case 0:
            gUnknown_03004824 = &(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).unk_07000;
            ResetSpriteData();
            FreeAllSpritePalettes();
            ResetTasks();
            sub_804A964(&gUnknown_03004824->unk_00c8, (void *)(0x6000000 + (0x800 * (5))));
            SetVBlankCallback(sub_80489F4);
            InitMenuWindow(&gWindowConfig_81E6CE4);
            SetUpWindowConfig(&gWindowConfig_81E6F84);
            InitWindowFromConfig(&gUnknown_03004824->window, &gWindowConfig_81E6F84);
            gUnknown_03004824->unk_007a = SetTextWindowBaseTileNum(20);
            LoadTextWindowGraphics(&gUnknown_03004824->window);
            MenuZeroFillScreen();
            sub_809D51C();
            gUnknown_03004824->unk_0075 = 0;
            gUnknown_03004824->unk_007b = 0;
            gUnknown_03004824->unk_007c = 0;
            gUnknown_03004824->unk_0080[0] = 0;
            gUnknown_03004824->unk_0080[1] = 0;
            gUnknown_03004824->unk_0086 = 0;
            gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_00b4 = 0;
            gUnknown_03000508[0] = 0;
            gMain.state ++;
            for (i = 0; i < 13; i ++)
                gUnknown_020296CC[i] = (*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).tileBuffers[i];
            break;
        case 1:
            gMain.state ++;
            gUnknown_03004824->unk_00b4 = 0;
            break;
        case 2:
            gMain.state ++;
            break;
        case 3:
            gMain.state ++;
            break;
        case 4:
            CalculatePlayerPartyCount();
            gMain.state ++;
            break;
        case 5:
            gMain.state ++;
            break;
        case 6:
            CalculateEnemyPartyCount();
            (*(vu16 *)(0x4000000 + 0x0)) = 0;
            gUnknown_03004824->partyCounts[0] = gPlayerPartyCount;
            gUnknown_03004824->partyCounts[1] = gEnemyPartyCount;
            sub_804A41C(0);
            sub_804A41C(1);
            for (i = 0; i < gUnknown_03004824->partyCounts[0]; i ++)
                gUnknown_03004824->partyIcons[0][i] = CreateMonIcon(GetMonData(&gPlayerParty[i], 65, ((void *)0)), sub_809D62C, gTradeMonSpriteCoords[i][0] * 8 + 14, gTradeMonSpriteCoords[i][1] * 8 - 12, 1, GetMonData(&gPlayerParty[i], 0));
            for (i = 0; i < gUnknown_03004824->partyCounts[1]; i ++)
                gUnknown_03004824->partyIcons[1][i] = CreateMonIcon(GetMonData(&gEnemyParty[i], 65, ((void *)0)), sub_809D62C, gTradeMonSpriteCoords[6 + i][0] * 8 + 14, gTradeMonSpriteCoords[6 + i][1] * 8 - 12, 1, GetMonData(&gEnemyParty[i], 0));
            nullsub_5(2, 0);
            gMain.state ++;
            break;
        case 7:
            LoadHeldItemIconGraphics();
            CreateHeldItemIcons(&gUnknown_03004824->partyCounts[0], gUnknown_03004824->partyIcons[0], 0);
            gMain.state ++;
            break;
        case 8:
            CreateHeldItemIcons(&gUnknown_03004824->partyCounts[0], gUnknown_03004824->partyIcons[0], 1);
            gMain.state ++;
            break;
        case 9:
            sub_8047CE8();
            gMain.state ++;
            gUnknown_03004824->unk_00b4 = 0;
            break;
        case 10:
            nullsub_5(4, 0);
            if (sub_804ABF8())
            {
                gMain.state ++;
            }
            break;
        case 11:
            sub_8047D58();
            gMain.state ++;
            break;
        case 12:
            sub_8047E44();
            unkStructF = &(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).unk_08000;
            if (gUnknown_03004824->tradeMenuCursorPosition < 6)
                gUnknown_03004824->tradeMenuCursorPosition = unkStructF->unk_0009;
            else
                gUnknown_03004824->tradeMenuCursorPosition = unkStructF->unk_0009 + 6;
            gUnknown_03004824->tradeMenuCursorSpriteIdx = CreateSprite(&gSpriteTemplate_820C134, gTradeMonSpriteCoords[gUnknown_03004824->tradeMenuCursorPosition][0] * 8 + 32, gTradeMonSpriteCoords[gUnknown_03004824->tradeMenuCursorPosition][1] * 8, 2);
            gMain.state = 15;
            nullsub_5(6, 0);
            break;
        case 15:
            sub_8048B0C(0);
            gMain.state ++;
            break;
        case 16:
            sub_8048B0C(1);
            gUnknown_03004824->unk_0000 = 0;
            gUnknown_03004824->unk_0001 = 0;
            sub_8048C70();
            nullsub_5(7, 0);
            gMain.state ++;
            break;
        case 17:
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            gMain.state ++;
            break;
        case 18:
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0040 | 0x0F00 | 0x1000;
            gMain.state ++;
            break;
        case 19:
            gMain.state ++;
            break;
        case 20:
            sub_804AF10();
            gMain.state ++;
            break;
        case 21:
            if (!gPaletteFade.active)
            {
                SetMainCallback2(sub_8048AB4);
                gUnknown_03000508[0] = 0;
            }
            break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_80489F4(void)
{
    sub_804A940(&gUnknown_03004824->unk_00c8);
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

           void sub_8048A14(void)
{
    if (++gUnknown_03004824->unk_00b4 >= 16)
    {
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        gUnknown_03004824->unk_007b = 10;
    }
}

           void sub_8048A50(void)
{
    if (!gPaletteFade.active)
    {
        gUnknown_020297D8[0] = gUnknown_03004824->tradeMenuCursorPosition;
        gUnknown_020297D8[1] = gUnknown_03004824->unk_008a;
        sub_800832C();
        gUnknown_03004824->unk_007b = 13;
    }
}

           void sub_8048A90(void)
{
    if (!gReceivedRemoteLinkPlayers)
    {
        gMain.callback1 = ((void *)0);
        SetMainCallback2(sub_804B41C);
    }
}

static void sub_8048AB4(void)
{
    sub_8049DE0();
    sub_804AB30();
    sub_8049ED4(0);
    sub_8049ED4(1);
    (*(vu16 *)(0x4000000 + 0x18)) = gUnknown_03004824->unk_0000++;
    (*(vu16 *)(0x4000000 + 0x1c)) = gUnknown_03004824->unk_0001--;
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}
# 1452 "src/engine/trade.c"
asm(".include \"constants/gba_constants.inc\"");
__attribute__((naked))
static void sub_8048B0C(u8 a0)
{
    asm(".syntax unified\n" "\tpush {r4-r7,lr}\n" "\tlsls r0, 24\n" "\tlsrs r0, 24\n" "\tcmp r0, 0\n" "\tbeq _08048B1C\n" "\tcmp r0, 0x1\n" "\tbeq _08048BD0\n" "\tb _08048C3A\n" "_08048B1C:\n" "\tldr r5, _08048BA0 @ =gUnknown_08EA0348\n" "\tldr r0, _08048BA4 @ =gTradeStripesBG2Tilemap\n" "\tmov r12, r0\n" "\tldr r1, _08048BA8 @ =gUnknown_08EA02C8\n" "\tldr r4, _08048BAC @ =gPlttBufferFaded\n" "\tldr r3, _08048BB0 @ =gPlttBufferUnfaded\n" "\tmovs r2, 0x2F\n" "_08048B2A:\n" "\tldrh r0, [r1]\n" "\tstrh r0, [r3]\n" "\tldrh r0, [r1]\n" "\tstrh r0, [r4]\n" "\tadds r1, 0x2\n" "\tadds r4, 0x2\n" "\tadds r3, 0x2\n" "\tsubs r2, 0x1\n" "\tcmp r2, 0\n" "\tbge _08048B2A\n" "\tadds r3, r5, 0\n" "\tmovs r4, 0xC0\n" "\tlsls r4, 19\n" "\tmovs r5, 0x94\n" "\tlsls r5, 5\n" "\tldr r1, _08048BB4 @ =0x040000d4\n" "\tldr r6, _08048BB8 @ =0x80000800\n" "\tmovs r2, 0x80\n" "\tlsls r2, 5\n" "\tmovs r7, 0x80\n" "\tlsls r7, 24\n" "_08048B54:\n" "\tstr r3, [r1]\n" "\tstr r4, [r1, 0x4]\n" "\tstr r6, [r1, 0x8]\n" "\tldr r0, [r1, 0x8]\n" "\tadds r3, r2\n" "\tadds r4, r2\n" "\tsubs r5, r2\n" "\tcmp r5, r2\n" "\tbhi _08048B54\n" "\tstr r3, [r1]\n" "\tstr r4, [r1, 0x4]\n" "\tlsrs r0, r5, 1\n" "\torrs r0, r7\n" "\tstr r0, [r1, 0x8]\n" "\tldr r0, [r1, 0x8]\n" "\tmovs r2, 0\n" "\tldr r5, _08048BBC @ =0x000003ff\n" "\tldr r4, _08048BC0 @ =gUnknown_03004824\n" "\tldr r3, _08048BC4 @ =gUnknown_08EA15C8\n" "_08048B7A:\n" "\tldr r0, [r4]\n" "\tlsls r1, r2, 1\n" "\tadds r0, 0xDA\n" "\tadds r0, r1\n" "\tldrh r1, [r3]\n" "\tstrh r1, [r0]\n" "\tadds r3, 0x2\n" "\tadds r2, 0x1\n" "\tcmp r2, r5\n" "\tble _08048B7A\n" "\tldr r1, _08048BC8 @ =0x06003000\n" "\tldr r0, _08048BB4 @ =0x040000d4\n" "\tmov r2, r12\n" "\tstr r2, [r0]\n" "\tstr r1, [r0, 0x4]\n" "\tldr r1, _08048BCC @ =0x80000400\n" "\tstr r1, [r0, 0x8]\n" "\tldr r0, [r0, 0x8]\n" "\tb _08048C3A\n" "\t.align 2, 0\n" "_08048BA0: .4byte gUnknown_08EA0348\n" "_08048BA4: .4byte gTradeStripesBG2Tilemap\n" "_08048BA8: .4byte gUnknown_08EA02C8\n" "_08048BAC: .4byte gPlttBufferFaded\n" "_08048BB0: .4byte gPlttBufferUnfaded\n" "_08048BB4: .4byte 0x040000d4\n" "_08048BB8: .4byte 0x80000800\n" "_08048BBC: .4byte 0x000003ff\n" "_08048BC0: .4byte gUnknown_03004824\n" "_08048BC4: .4byte gUnknown_08EA15C8\n" "_08048BC8: .4byte 0x06003000\n" "_08048BCC: .4byte 0x80000400\n" "_08048BD0:\n" "\tldr r1, _08048C40 @ =gTradeStripesBG3Tilemap\n" "\tldr r2, _08048C44 @ =0x06003800\n" "\tldr r0, _08048C48 @ =0x040000d4\n" "\tstr r1, [r0]\n" "\tstr r2, [r0, 0x4]\n" "\tldr r1, _08048C4C @ =0x80000400\n" "\tstr r1, [r0, 0x8]\n" "\tldr r0, [r0, 0x8]\n" "\tmovs r0, 0\n" "\tbl sub_804A6DC\n" "\tmovs r0, 0x1\n" "\tbl sub_804A6DC\n" "\tldr r0, _08048C50 @ =gUnknown_03004824\n" "\tldr r0, [r0]\n" "\tadds r0, 0xC8\n" "\tbl sub_804A938\n" "\tldr r2, _08048C54 @ =REG_BG0CNT\n" "\tldrh r1, [r2]\n" "\tldr r0, _08048C58 @ =0x0000fffc\n" "\tands r0, r1\n" "\tstrh r0, [r2]\n" "\tldr r1, _08048C5C @ =REG_BG1CNT\n" "\tldr r2, _08048C60 @ =0x00000501\n" "\tadds r0, r2, 0\n" "\tstrh r0, [r1]\n" "\tadds r1, 0x2\n" "\tldr r2, _08048C64 @ =0x00000602\n" "\tadds r0, r2, 0\n" "\tstrh r0, [r1]\n" "\tadds r1, 0x2\n" "\tldr r2, _08048C68 @ =0x00000703\n" "\tadds r0, r2, 0\n" "\tstrh r0, [r1]\n" "\tldr r0, _08048C6C @ =REG_BG0HOFS\n" "\tmovs r1, 0\n" "\tstrh r1, [r0]\n" "\tadds r0, 0x4\n" "\tstrh r1, [r0]\n" "\tadds r0, 0x4\n" "\tstrh r1, [r0]\n" "\tadds r0, 0x4\n" "\tstrh r1, [r0]\n" "\tsubs r0, 0xA\n" "\tstrh r1, [r0]\n" "\tadds r0, 0x4\n" "\tstrh r1, [r0]\n" "\tadds r0, 0x4\n" "\tstrh r1, [r0]\n" "\tadds r0, 0x4\n" "\tstrh r1, [r0]\n" "_08048C3A:\n" "\tpop {r4-r7}\n" "\tpop {r0}\n" "\tbx r0\n" "\t.align 2, 0\n" "_08048C40: .4byte gTradeStripesBG3Tilemap\n" "_08048C44: .4byte 0x06003800\n" "_08048C48: .4byte 0x040000d4\n" "_08048C4C: .4byte 0x80000400\n" "_08048C50: .4byte gUnknown_03004824\n" "_08048C54: .4byte REG_BG0CNT\n" "_08048C58: .4byte 0x0000fffc\n" "_08048C5C: .4byte REG_BG1CNT\n" "_08048C60: .4byte 0x00000501\n" "_08048C64: .4byte 0x00000602\n" "_08048C68: .4byte 0x00000703\n" "_08048C6C: .4byte REG_BG0HOFS" "\n.syntax divided\n")
# 1614 "src/engine/trade.c"
                                                        ;
}


static void sub_8048C70(void)
{
    int i;
    for (i = 0; i < 6; i ++)
    {
        if (i < gUnknown_03004824->partyCounts[0])
        {
            gSprites[gUnknown_03004824->partyIcons[0][i]].invisible = 0;
            gUnknown_03004824->tradeMenuOptionsActive[i] = 1;
        }
        else
        {
            gUnknown_03004824->tradeMenuOptionsActive[i] = 0;
        }
        if (i < gUnknown_03004824->partyCounts[1])
        {
            gSprites[gUnknown_03004824->partyIcons[1][i]].invisible = 0;
            gUnknown_03004824->tradeMenuOptionsActive[i + 6] = 1;
        }
        else
        {
            gUnknown_03004824->tradeMenuOptionsActive[i + 6] = 0;
        }
    }
    gUnknown_03004824->tradeMenuOptionsActive[12] = 1;
}

static void nullsub_5(u8 a0, u8 a1) {}


static void Trade_Memcpy(void *dataDest, void *dataSrc, u32 size)
{
    u8 *dest = dataDest;
    u8 *src = dataSrc;
    int i;
    for (i = 0; i < size; i ++) dest[i] = src[i];
}

static bool8 sub_8048D44(void)
{
    u8 mpId = GetMultiplayerId();
    int i;
    u16 species;
    u8 nickname[11];
    struct Pokemon *pokemon;

    SetLinkDebugValues(gUnknown_03004824->unk_0075 / 100, gUnknown_03004824->unk_0075 % 100);
    switch (gUnknown_03004824->unk_0075)
    {
        case 0:
            Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[0], 2 * sizeof(struct Pokemon));
            gUnknown_03004824->unk_0075 ++;
            break;
        case 1:
            if (sub_8007ECC())
            {
                if (GetBlockReceivedStatus() == 0)
                {
                    gUnknown_03004824->unk_0075 ++;
                }
                else
                {
                    ResetBlockReceivedFlags();
                    gUnknown_03004824->unk_0075 ++;
                }
            }
            break;
        case 2:
            if (mpId == 0)
            {
                sub_8007E9C(1);
            }
            gUnknown_03004824->unk_0075 ++;
            break;
        case 3:
            if (GetBlockReceivedStatus() == 3)
            {
                Trade_Memcpy(&gEnemyParty[0], gBlockRecvBuffer[mpId ^ 1], 2 * sizeof(struct Pokemon));
                ResetBlockReceivedFlags();
                gUnknown_03004824->unk_0075 ++;
            }
            break;
        case 4:
            Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[2], 2 * sizeof(struct Pokemon));
            gUnknown_03004824->unk_0075 ++;
            break;
        case 5:
            if (mpId == 0)
            {
                sub_8007E9C(1);
            }
            gUnknown_03004824->unk_0075 ++;
            break;
        case 6:
            if (GetBlockReceivedStatus() == 3)
            {
                Trade_Memcpy(&gEnemyParty[2], gBlockRecvBuffer[mpId ^ 1], 2 * sizeof(struct Pokemon));
                ResetBlockReceivedFlags();
                gUnknown_03004824->unk_0075 ++;
            }
            break;
        case 7:
            Trade_Memcpy(gBlockSendBuffer, &gPlayerParty[4], 2 * sizeof(struct Pokemon));
            gUnknown_03004824->unk_0075 ++;
            break;
        case 8:
            if (mpId == 0)
            {
                sub_8007E9C(1);
            }
            gUnknown_03004824->unk_0075 ++;
            break;
        case 9:
            if (GetBlockReceivedStatus() == 3)
            {
                Trade_Memcpy(&gEnemyParty[4], gBlockRecvBuffer[mpId ^ 1], 2 * sizeof(struct Pokemon));
                ResetBlockReceivedFlags();
                gUnknown_03004824->unk_0075 ++;
            }
            break;
        case 10:
            Trade_Memcpy(gBlockSendBuffer, &gSaveBlock1.mail[0], 6 * sizeof(struct MailStruct) + 4);
            gUnknown_03004824->unk_0075 ++;
            break;
        case 11:
            if (mpId == 0)
            {
                sub_8007E9C(3);
            }
            gUnknown_03004824->unk_0075 ++;
            break;
        case 12:
            if (GetBlockReceivedStatus() == 3)
            {
                Trade_Memcpy(&gUnknown_02029700[0], gBlockRecvBuffer[mpId ^ 1], 6 * sizeof(struct MailStruct));
                ResetBlockReceivedFlags();
                gUnknown_03004824->unk_0075 ++;
            }
            break;
        case 13:
            Trade_Memcpy(gBlockSendBuffer, gSaveBlock1.giftRibbons, 11);
            gUnknown_03004824->unk_0075 ++;
            break;
        case 14:
            if (mpId == 0)
            {
                sub_8007E9C(4);
            }
            gUnknown_03004824->unk_0075 ++;
            break;
        case 15:
            if (GetBlockReceivedStatus() == 3)
            {
                Trade_Memcpy(gUnknown_03004824->unk_00b5, gBlockRecvBuffer[mpId ^ 1], 11);
                ResetBlockReceivedFlags();
                gUnknown_03004824->unk_0075 ++;
            }
            break;
        case 16:
            pokemon = gEnemyParty;
            for (i = 0; i < 6; i ++)
            {
                if ((species = GetMonData(pokemon, 11)) != SPECIES_NONE && species == SPECIES_SHEDINJA && GetMonData(pokemon, 3) != LANGUAGE_JAPANESE)
                {
                    GetMonData(pokemon, 2, nickname);
                    if (!StringCompareWithoutExtCtrlCodes(nickname, gUnknown_0820C3B0))
                        SetMonData(pokemon, 2, gSpeciesNames[SPECIES_SHEDINJA]);
                }
                pokemon ++;
            }
            return 1;
    }
    return 0;
}

static void sub_8049088(void)
{
    u8 string[28];
    StringCopy(string, gTradeText_TradeOkayPrompt);
    sub_804ACD8(string, (void *)(0x6000000 + (0x4000 * (4))) + gUnknown_03004824->unk_007e * 32, 20);
}

static void sub_80490BC(u8 mpId, u8 a1)
{
    if (a1 & 1)
    {
        switch (gBlockRecvBuffer[mpId][0])
        {
            case 0xeeaa:
                gUnknown_03004824->unk_0084 = 2;
                break;
            case 0xaabb:
                gUnknown_03004824->unk_0084 = 1;
                break;
            case 0xbbbb:
                gUnknown_03004824->unk_0086 = 1;
                break;
            case 0xbbcc:
                gUnknown_03004824->unk_0086 = 2;
                break;
        }
        ResetBlockReceivedFlag(0);
    }
    if (a1 & 2)
    {
        switch (gBlockRecvBuffer[1][0])
        {
            case 0xeeaa:
                gUnknown_03004824->unk_0085 = 2;
                break;
            case 0xaabb:
                gUnknown_03004824->unk_008a = gBlockRecvBuffer[1][1] + 6;
                gUnknown_03004824->unk_0085 = 1;
                break;
            case 0xbbbb:
                gUnknown_03004824->unk_0087 = 1;
                break;
            case 0xbbcc:
                gUnknown_03004824->unk_0087 = 2;
                break;
        }
        ResetBlockReceivedFlag(1);
    }
}

static void sub_80491E4(u8 mpId, u8 status)
{
    if (status & 1)
    {
        switch (gBlockRecvBuffer[0][0])
        {
            case 0xeebb:
                BeginNormalPaletteFade(-1, 0, 0, 16, 0);
                sub_804AA0C(4);
                gUnknown_03004824->unk_007b = 11;
                break;
            case 0xeecc:
                sub_804AA0C(5);
                gUnknown_03004824->unk_007b = 8;
                break;
            case 0xdddd:
                gUnknown_03004824->unk_008a = gBlockRecvBuffer[0][1] + 6;
                sub_8049E9C(gUnknown_03004824->tradeMenuCursorPosition);
                sub_8049E9C(gUnknown_03004824->unk_008a);
                gUnknown_03004824->unk_007b = 7;
                break;
            case 0xccdd:
                BeginNormalPaletteFade(-1, 0, 0, 16, 0);
                gUnknown_03004824->unk_007b = 10;
                break;
            case 0xddee:
                sub_804AA0C(1);
                gUnknown_03004824->unk_007b = 8;
                break;
        }
        ResetBlockReceivedFlag(0);
    }
    if (status & 2)
    {
        ResetBlockReceivedFlag(1);
    }
}

static void sub_80492D8(void)
{
    if (gUnknown_03004824->unk_0084 && gUnknown_03004824->unk_0085)
    {
        if (gUnknown_03004824->unk_0084 == 1 && gUnknown_03004824->unk_0085 == 1)
        {
            gUnknown_03004824->unk_007b = 6;
            gUnknown_03004824->linkData[0] = 0xdddd;
            gUnknown_03004824->linkData[1] = gUnknown_03004824->tradeMenuCursorPosition;
            sub_804AADC(5, 0);
            gUnknown_03004824->unk_0084 = gUnknown_03004824->unk_0085 = 0;
        }
        else if (gUnknown_03004824->unk_0084 == 1 && gUnknown_03004824->unk_0085 == 2)
        {
            sub_804AA0C(1);
            gUnknown_03004824->linkData[0] = 0xeecc;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            gUnknown_03004824->unk_0086 = gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_0084 = gUnknown_03004824->unk_0085 = 0;
            gUnknown_03004824->unk_007b = 8;
        }
        else if (gUnknown_03004824->unk_0084 == 2 && gUnknown_03004824->unk_0085 == 1)
        {
            sub_804AA0C(5);
            gUnknown_03004824->linkData[0] = 0xddee;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            gUnknown_03004824->unk_0086 = gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_0084 = gUnknown_03004824->unk_0085 = 0;
            gUnknown_03004824->unk_007b = 8;
        }
        else if (gUnknown_03004824->unk_0084 == 2 && gUnknown_03004824->unk_0085 == 2)
        {
            gUnknown_03004824->linkData[0] = 0xeebb;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004824->unk_0084 = gUnknown_03004824->unk_0085 = 0;
            gUnknown_03004824->unk_007b = 11;
        }
    }
    if (gUnknown_03004824->unk_0086 && gUnknown_03004824->unk_0087)
    {
        if (gUnknown_03004824->unk_0086 == 1 && gUnknown_03004824->unk_0087 == 1)
        {
            gUnknown_03004824->linkData[0] = 0xccdd;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            gUnknown_03004824->unk_0086 = 0;
            gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_007b = 9;
        }
        if (gUnknown_03004824->unk_0086 == 2 || gUnknown_03004824->unk_0087 == 2)
        {
            sub_804AA0C(1);
            gUnknown_03004824->linkData[0] = 0xddee;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            gUnknown_03004824->unk_0086 = 0;
            gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_007b = 8;
        }
    }
}

static void sub_80494D8(void)
{
    u8 mpId = GetMultiplayerId();
    u8 status;
    if ((status = GetBlockReceivedStatus()))
    {
        if (mpId == 0)
            sub_80490BC(mpId, status);
        else
            sub_80491E4(mpId, status);
        ResetBlockReceivedFlags();
    }
    if (mpId == 0)
        sub_80492D8();
}

static u8 sub_8049514(u8 oldPosition, u8 direction)
{
    int i;
    u8 newPosition = 0;
    for (i = 0; i < 6; i ++)
    {
        if (gUnknown_03004824->tradeMenuOptionsActive[gTradeNextSelectedMonTable[oldPosition][direction][i]] == 1)
        {
            newPosition = gTradeNextSelectedMonTable[oldPosition][direction][i];
            break;
        }
    }
    return newPosition;
}

static void TradeMenuMoveCursor(u8 *tradeMenuCursorPosition, u8 direction)
{
    u8 newPosition = sub_8049514(*tradeMenuCursorPosition, direction);
    if (newPosition == 12)
    {
        StartSpriteAnim(&gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx], 1);
        gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].pos1.x = 0xe0;
        gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].pos1.y = 0xa0;
    }
    else
    {
        StartSpriteAnim(&gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx], 0);
        gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].pos1.x = gTradeMonSpriteCoords[newPosition][0] * 8 + 32;
        gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].pos1.y = gTradeMonSpriteCoords[newPosition][1] * 8;
    }
    if (*tradeMenuCursorPosition != newPosition)
    {
        PlaySE(SE_SELECT);
    }
    *tradeMenuCursorPosition = newPosition;
}

static void sub_8049620(void)
{
    sub_804AA0C(0);
    gUnknown_03004824->unk_007b = 5;
    if (GetMultiplayerId() == 1)
    {
        gUnknown_03004824->linkData[0] = 0xaabb;
        gUnknown_03004824->linkData[1] = gUnknown_03004824->tradeMenuCursorPosition;
        (SendBlock(bitmask_all_link_players_but_self(), gUnknown_03004824->linkData, 20));
    }
    else
    {
        gUnknown_03004824->unk_0084 = 1;
    }
}

static void sub_8049680(void)
{
    int i;
    if (gMain.newAndRepeatedKeys & 0x0040)
    {
        TradeMenuMoveCursor(&gUnknown_03004824->tradeMenuCursorPosition, 0);
    }
    else if (gMain.newAndRepeatedKeys & 0x0080)
    {
        TradeMenuMoveCursor(&gUnknown_03004824->tradeMenuCursorPosition, 1);
    }
    else if (gMain.newAndRepeatedKeys & 0x0020)
    {
        TradeMenuMoveCursor(&gUnknown_03004824->tradeMenuCursorPosition, 2);
    }
    else if (gMain.newAndRepeatedKeys & 0x0010)
    {
        TradeMenuMoveCursor(&gUnknown_03004824->tradeMenuCursorPosition, 3);
    }
    if (gMain.newKeys & 0x0001)
    {
        PlaySE(SE_SELECT);
        if (gUnknown_03004824->tradeMenuCursorPosition < 6)
        {
            DrawTextWindow(&gUnknown_03004824->window, 18, 14, 28, 19);
            PrintMenuItems(19, 15, 2, (const struct MenuAction *)gUnknown_0820C320);
            InitMenu(0, 19, 15, 2, 0, 9);
            gUnknown_03004824->unk_007b = 1;
        }
        else if (gUnknown_03004824->tradeMenuCursorPosition < 2 * 6)
        {
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004824->unk_007b = 2;
        }
        else if (gUnknown_03004824->tradeMenuCursorPosition == 2 * 6)
        {
            DrawTextWindow(&gUnknown_03004824->window, 24, 14, 29, 19);
            InitYesNoMenu(24, 14, 4);
            gUnknown_03004824->unk_007b = 4;
            sub_804ACD8(gUnknown_0820C14C[4], (void *)(0x6000000 + (0x4000 * (4))) + 32 * gUnknown_03004824->unk_007e, 20);
        }
    }
    if (gMain.newKeys & 0x0100)
    {
        for (i = 0; i < 10; i ++)
        {
            gUnknown_03004824->linkData[i] = i;
        }
        (SendBlock(bitmask_all_link_players_but_self(), gUnknown_03004824->linkData, 20));
    }
}

static void sub_8049804(void)
{
    HandleDestroyMenuCursors();
    sub_804A80C();
    gUnknown_03004824->unk_007b = 0;
    gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].invisible = 0;
    sub_804ACD8(gUnknown_0820C14C[1], (void *)(0x6000000 + (0x4000 * (4))) + 32 * gUnknown_03004824->unk_007e, 20);
}

static void sub_8049860(void)
{
    if (gMain.newAndRepeatedKeys & 0x0040)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(-1);
    }
    else if (gMain.newAndRepeatedKeys & 0x0080)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(+1);
    }
    if (gMain.newKeys & 0x0001)
    {
        PlaySE(SE_SELECT);
        if (GetMenuCursorPos() == 0)
        {
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004824->unk_007b = 2;
        }
        else if (sub_80499F0(gUnknown_03004824->unk_0051[0], gUnknown_03004824->partyCounts[0], gUnknown_03004824->tradeMenuCursorPosition) == 0)
        {
            sub_804AADC(3, 2);
            gUnknown_03004824->unk_007b = 8;
        }
        else
        {
            sub_8049620();
            gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].invisible = 1;
        }
    }
    else if (gMain.newKeys & 0x0002)
    {
        PlaySE(SE_SELECT);
        sub_8049804();
    }
}

static void sub_8049954(void)
{
    if (gMain.newKeys & 0x0001 || gMain.newKeys & 0x0002)
    {
        PlaySE(SE_SELECT);
        sub_8049804();
    }
}

static void sub_804997C(void)
{
    if (!gPaletteFade.active)
    {
        if (gUnknown_03004824->tradeMenuCursorPosition < 6)
        {
            ShowPokemonSummaryScreen(gPlayerParty, gUnknown_03004824->tradeMenuCursorPosition, gUnknown_03004824->partyCounts[0] - 1, sub_80484F4, 4);
        }
        else
        {
            ShowPokemonSummaryScreen(gEnemyParty, gUnknown_03004824->tradeMenuCursorPosition - 6, gUnknown_03004824->partyCounts[1] - 1, sub_80484F4, 4);
        }
    }
}

static u8 sub_80499F0(const u8 *src, u8 partyCount, u8 tradeMenuCursorPosition)
{
    u8 retval = 0;
    int i;
    for (i = 0; i < partyCount; i ++)
    {
        if (tradeMenuCursorPosition != i)
        {
            retval += src[i];
        }
    }
    return retval;
}

static void sub_8049A20(void)
{
    u8 unk_0051[12];
    int i;
    for (i = 0; i < gUnknown_03004824->partyCounts[0]; i ++)
    {
        unk_0051[i] = gUnknown_03004824->unk_0051[0][i];
    }
    if (sub_80499F0(unk_0051, gUnknown_03004824->partyCounts[0], gUnknown_03004824->tradeMenuCursorPosition) == 0)
    {
        sub_804AADC(3, 2);
        gUnknown_03004824->linkData[0] = 0xbbcc;
        sub_804AADC(0xb4, 0);
    }
    else
    {
        sub_804AADC(3, 1);
        gUnknown_03004824->linkData[0] = 0xbbbb;
        if (sub_8007ECC())
        {
            (SendBlock(bitmask_all_link_players_but_self(), gUnknown_03004824->linkData, 20));
        }
    }
}

static void sub_8049AC0(void)
{
    if (gMain.newAndRepeatedKeys & 0x0040)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(-1);
    }
    else if (gMain.newAndRepeatedKeys & 0x0080)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(+1);
    }
    if (gMain.newKeys & 0x0001)
    {
        PlaySE(SE_SELECT);
        if (GetMenuCursorPos() == 0)
        {
            sub_8049A20();
        }
        else
        {
            sub_804AADC(3, 1);
            if (sub_8007ECC())
            {
                gUnknown_03004824->linkData[0] = 0xbbcc;
                (SendBlock(bitmask_all_link_players_but_self(), gUnknown_03004824->linkData, 20));
            }
        }
        gUnknown_03004824->unk_007b = 100;
    }
    else if (gMain.newKeys & 0x0002)
    {
        sub_804AADC(3, 1);
        if (GetMenuCursorPos() == 0)
        {
            gUnknown_03004824->unk_007c = MoveMenuCursor(+1);
        }
        gUnknown_03004824->linkData[0] = 0xbbcc;
        (SendBlock(bitmask_all_link_players_but_self(), gUnknown_03004824->linkData, 20));
        gUnknown_03004824->unk_007b = 100;
    }
}

static void sub_8049BC0(void)
{
    if (gMain.newAndRepeatedKeys & 0x0040)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(-1);
    }
    else if (gMain.newAndRepeatedKeys & 0x0080)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(+1);
    }
    if (gMain.newKeys & 0x0001)
    {
        PlaySE(SE_SELECT);
        if (GetMenuCursorPos() == 0)
        {
            sub_804AA0C(4);
            gUnknown_03004824->linkData[0] = 0xeeaa;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].invisible = 1;
            gUnknown_03004824->unk_007b = 100;
        }
        else
        {
            sub_8049804();
        }
    }
    else if (gMain.newKeys & 0x0002)
    {
        PlaySE(SE_SELECT);
        sub_8049804();
    }
}

static void sub_8049C8C(void)
{
    if (GetMultiplayerId() == 0)
    {
        sub_8049E9C(gUnknown_03004824->tradeMenuCursorPosition);
        sub_8049E9C(gUnknown_03004824->unk_008a);
    }
    gUnknown_03004824->unk_007b = 7;
}

static void sub_8049CC4(void)
{
    if (gUnknown_03004824->unk_0080[0] == 5 && gUnknown_03004824->unk_0080[1] == 5)
    {
        sub_8049088();
        gUnknown_03004824->unk_007b = 14;
    }
}

static void DisplayMessageAndContinueTask(void)
{
    gUnknown_03004824->unk_00b4++;
    if (gUnknown_03004824->unk_00b4 > 120)
    {
        DrawTextWindow(&gUnknown_03004824->window, 24, 14, 29, 19);
        InitYesNoMenu(24, 14, 4);
        gUnknown_03004824->unk_00b4 = 0;
        gUnknown_03004824->unk_007b = 3;
    }
}

static void sub_8049D44(void)
{
    if (gMain.newKeys & 0x0001)
    {
        PlaySE(SE_SELECT);
        sub_804A840(0);
        sub_804A840(1);
        gUnknown_03004824->unk_007b = 0;
        gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].invisible = 0;
    }
}

static void sub_8049D9C(void)
{
    if (!gPaletteFade.active)
    {
        sub_800832C();
        gUnknown_03004824->unk_007b = 12;
    }
}

static void sub_8049DC4(void)
{
    if (gReceivedRemoteLinkPlayers == 0)
    {
        SetMainCallback2(sub_805465C);
    }
}

static void sub_8049DE0(void)
{
    switch (gUnknown_03004824->unk_007b)
    {
        case 0:
            sub_8049680();
            break;
        case 1:
            sub_8049860();
            break;
        case 2:
            sub_804997C();
            break;
        case 3:
            sub_8049AC0();
            break;
        case 4:
            sub_8049BC0();
            break;
        case 6:
            sub_8049C8C();
            break;
        case 7:
            sub_8049CC4();
            break;
        case 8:
            sub_8049D44();
            break;
        case 9:
            sub_8048A14();
            break;
        case 10:
            sub_8048A50();
            break;
        case 11:
            sub_8049D9C();
            break;
        case 12:
            sub_8049DC4();
            break;
        case 13:
            sub_8048A90();
            break;
        case 14:
            DisplayMessageAndContinueTask();
            break;
        case 15:
            sub_8049954();
            break;
    }
}

static void sub_8049E9C(u8 a0)
{
    u8 v0 = a0 / 6;
    if (gUnknown_03004824->unk_0080[v0] == 0)
    {
        gUnknown_03004824->unk_0080[v0] = 1;
        gUnknown_03004824->unk_0082[v0] = a0;
    }
}
# 2449 "src/engine/trade.c"
__attribute__((naked))
static void sub_8049ED4(u8 a0)
{
    asm(".syntax unified\n" "\tpush {r4-r7,lr}\n" "\tmov r7, r10\n" "\tmov r6, r9\n" "\tmov r5, r8\n" "\tpush {r5-r7}\n" "\tsub sp, 0x74\n" "\tlsls r0, 24\n" "\tlsrs r0, 24\n" "\tmov r10, r0\n" "\tldr r0, _08049F24 @ =gUnknown_03004824\n" "\tldr r5, [r0]\n" "\tadds r0, r5, 0\n" "\tadds r0, 0x82\n" "\tadd r0, r10\n" "\tldrb r0, [r0]\n" "\tmovs r1, 0x1\n" "\tstr r1, [sp, 0x6C]\n" "\tcmp r0, 0x5\n" "\tbhi _08049EFE\n" "\tmovs r2, 0\n" "\tstr r2, [sp, 0x6C]\n" "_08049EFE:\n" "\tmovs r1, 0x6\n" "\tbl __umodsi3\n" "\tlsls r0, 24\n" "\tlsrs r0, 24\n" "\tmov r8, r0\n" "\tadds r0, r5, 0\n" "\tadds r0, 0x80\n" "\tmov r1, r10\n" "\tadds r3, r0, r1\n" "\tldrb r0, [r3]\n" "\tcmp r0, 0x2\n" "\tbne _08049F1A\n" "\tb _0804A0AC\n" "_08049F1A:\n" "\tcmp r0, 0x2\n" "\tbgt _08049F28\n" "\tcmp r0, 0x1\n" "\tbeq _08049F36\n" "\tb _0804A294\n" "\t.align 2, 0\n" "_08049F24: .4byte gUnknown_03004824\n" "_08049F28:\n" "\tcmp r0, 0x3\n" "\tbne _08049F2E\n" "\tb _0804A0E4\n" "_08049F2E:\n" "\tcmp r0, 0x4\n" "\tbne _08049F34\n" "\tb _0804A244\n" "_08049F34:\n" "\tb _0804A294\n" "_08049F36:\n" "\tmovs r4, 0\n" "\tadds r0, r5, 0\n" "\tadds r0, 0x42\n" "\tadd r0, r10\n" "\tldr r7, _0804A094 @ =gSprites\n" "\tldr r2, [sp, 0x6C]\n" "\tlsls r2, 1\n" "\tmov r9, r2\n" "\tldr r3, _0804A098 @ =gTradeMonSpriteCoords\n" "\tmov r12, r3\n" "\tmov r5, r10\n" "\tlsls r5, 4\n" "\tstr r5, [sp, 0x70]\n" "\tldrb r0, [r0]\n" "\tcmp r4, r0\n" "\tbcs _08049F8E\n" "\tadds r6, r7, 0\n" "\tldr r2, _0804A09C @ =gUnknown_03004824\n" "\tldr r0, [sp, 0x6C]\n" "\tadd r0, r9\n" "\tlsls r3, r0, 1\n" "\tmovs r5, 0x4\n" "_08049F62:\n" "\tldr r0, [r2]\n" "\tadds r1, r4, r3\n" "\tadds r0, 0x34\n" "\tadds r0, r1\n" "\tldrb r1, [r0]\n" "\tlsls r0, r1, 4\n" "\tadds r0, r1\n" "\tlsls r0, 2\n" "\tadds r0, r6\n" "\tadds r0, 0x3E\n" "\tldrb r1, [r0]\n" "\torrs r1, r5\n" "\tstrb r1, [r0]\n" "\tadds r0, r4, 0x1\n" "\tlsls r0, 24\n" "\tlsrs r4, r0, 24\n" "\tldr r0, [r2]\n" "\tadds r0, 0x42\n" "\tadd r0, r10\n" "\tldrb r0, [r0]\n" "\tcmp r4, r0\n" "\tbcc _08049F62\n" "_08049F8E:\n" "\tldr r1, _0804A09C @ =gUnknown_03004824\n" "\tldr r0, [r1]\n" "\tldr r5, [sp, 0x6C]\n" "\tadd r5, r9\n" "\tlsls r3, r5, 1\n" "\tmov r2, r8\n" "\tadds r6, r2, r3\n" "\tadds r0, 0x34\n" "\tadds r0, r6\n" "\tldrb r1, [r0]\n" "\tlsls r0, r1, 4\n" "\tadds r0, r1\n" "\tlsls r0, 2\n" "\tadds r0, r7\n" "\tadds r0, 0x3E\n" "\tldrb r2, [r0]\n" "\tmovs r1, 0x5\n" "\tnegs r1, r1\n" "\tands r1, r2\n" "\tstrb r1, [r0]\n" "\tldr r0, _0804A09C @ =gUnknown_03004824\n" "\tldr r4, [r0]\n" "\tadds r4, 0x34\n" "\tadds r4, r6\n" "\tldrb r1, [r4]\n" "\tlsls r0, r1, 4\n" "\tadds r0, r1\n" "\tlsls r0, 2\n" "\tadds r0, r7\n" "\tmovs r1, 0x14\n" "\tstrh r1, [r0, 0x2E]\n" "\tldrb r0, [r4]\n" "\tlsls r2, r0, 4\n" "\tadds r2, r0\n" "\tlsls r2, 2\n" "\tadds r2, r7\n" "\tlsls r5, 2\n" "\tmov r1, r12\n" "\tadds r0, r5, r1\n" "\tldrb r0, [r0]\n" "\tadds r3, 0x1\n" "\tlsls r3, 1\n" "\tadd r3, r12\n" "\tldrb r1, [r3]\n" "\tadds r0, r1\n" "\tasrs r0, 1\n" "\tlsls r0, 3\n" "\tadds r0, 0xE\n" "\tstrh r0, [r2, 0x32]\n" "\tldrb r0, [r4]\n" "\tlsls r1, r0, 4\n" "\tadds r1, r0\n" "\tlsls r1, 2\n" "\tadds r1, r7\n" "\tmov r0, r12\n" "\tadds r0, 0x1\n" "\tadds r5, r0\n" "\tldrb r0, [r5]\n" "\tlsls r0, 3\n" "\tsubs r0, 0xC\n" "\tstrh r0, [r1, 0x36]\n" "\tldrb r1, [r4]\n" "\tlsls r0, r1, 4\n" "\tadds r0, r1\n" "\tlsls r0, 2\n" "\tadds r0, r7\n" "\tldr r1, _0804A0A0 @ =sub_809D62C\n" "\tbl StoreSpriteCallbackInData\n" "\tldr r2, _0804A09C @ =gUnknown_03004824\n" "\tldr r1, [r2]\n" "\tadds r1, 0x80\n" "\tadd r1, r10\n" "\tldrb r0, [r1]\n" "\tadds r0, 0x1\n" "\tstrb r0, [r1]\n" "\tldr r0, [r2]\n" "\tadds r0, 0x34\n" "\tadds r0, r6\n" "\tldrb r1, [r0]\n" "\tlsls r0, r1, 4\n" "\tadds r0, r1\n" "\tlsls r0, 2\n" "\tadds r0, r7\n" "\tbl sub_8078A34\n" "\tbl HandleDestroyMenuCursors\n" "\tldr r3, _0804A09C @ =gUnknown_03004824\n" "\tldr r0, [r3]\n" "\tadds r0, 0x4\n" "\tldr r1, _0804A0A4 @ =gUnknown_0820C330\n" "\tmov r5, r9\n" "\tadds r2, r5, r1\n" "\tldrb r2, [r2]\n" "\tadds r1, 0x1\n" "\tadd r1, r9\n" "\tldrb r1, [r1]\n" "\tstr r1, [sp]\n" "\tmovs r1, 0x13\n" "\tstr r1, [sp, 0x4]\n" "\tmovs r1, 0\n" "\tmovs r3, 0\n" "\tbl FillWindowRect_DefaultPalette\n" "\tldr r1, _0804A09C @ =gUnknown_03004824\n" "\tldr r0, [r1]\n" "\tadds r0, 0xC8\n" "\tldr r2, [sp, 0x70]\n" "\tmov r3, r10\n" "\tsubs r1, r2, r3\n" "\tlsls r1, 24\n" "\tlsrs r1, 24\n" "\tldr r3, _0804A0A8 @ =gTradePartyBoxTilemap\n" "\tmovs r2, 0xF\n" "\tstr r2, [sp]\n" "\tmovs r2, 0x11\n" "\tstr r2, [sp, 0x4]\n" "\tmovs r5, 0\n" "\tstr r5, [sp, 0x8]\n" "\tmovs r2, 0\n" "\tbl sub_804A96C_alt\n" "\tldr r0, [sp, 0x6C]\n" "\tcmp r0, 0\n" "\tbeq _0804A08C\n" "\tb _0804A294\n" "_0804A08C:\n" "\tbl sub_804A80C\n" "\tb _0804A294\n" "\t.align 2, 0\n" "_0804A094: .4byte gSprites\n" "_0804A098: .4byte gTradeMonSpriteCoords\n" "_0804A09C: .4byte gUnknown_03004824\n" "_0804A0A0: .4byte sub_809D62C\n" "_0804A0A4: .4byte gUnknown_0820C330\n" "_0804A0A8: .4byte gTradePartyBoxTilemap\n" "_0804A0AC:\n" "\tldr r2, _0804A0DC @ =gSprites\n" "\tldr r1, [sp, 0x6C]\n" "\tlsls r0, r1, 1\n" "\tadds r0, r1\n" "\tlsls r0, 1\n" "\tadd r0, r8\n" "\tadds r1, r5, 0\n" "\tadds r1, 0x34\n" "\tadds r1, r0\n" "\tldrb r1, [r1]\n" "\tlsls r0, r1, 4\n" "\tadds r0, r1\n" "\tlsls r0, 2\n" "\tadds r2, 0x1C\n" "\tadds r0, r2\n" "\tldr r1, [r0]\n" "\tldr r0, _0804A0E0 @ =sub_809D62C\n" "\tcmp r1, r0\n" "\tbeq _0804A0D4\n" "\tb _0804A294\n" "_0804A0D4:\n" "\tmovs r0, 0x3\n" "\tstrb r0, [r3]\n" "\tb _0804A294\n" "\t.align 2, 0\n" "_0804A0DC: .4byte gSprites\n" "_0804A0E0: .4byte sub_809D62C\n" "_0804A0E4:\n" "\tadds r0, r5, 0\n" "\tadds r0, 0xC8\n" "\tldr r2, [sp, 0x6C]\n" "\tlsls r1, r2, 4\n" "\tsubs r1, r2\n" "\tlsls r1, 24\n" "\tlsrs r1, 24\n" "\tldr r3, _0804A228 @ =gTradeMovesBoxTilemap\n" "\tmovs r2, 0xF\n" "\tstr r2, [sp]\n" "\tmovs r7, 0x11\n" "\tstr r7, [sp, 0x4]\n" "\tmovs r5, 0\n" "\tstr r5, [sp, 0x8]\n" "\tmovs r2, 0\n" "\tbl sub_804A96C_alt\n" "\tldr r0, _0804A22C @ =gUnknown_03004824\n" "\tldr r3, [r0]\n" "\tldr r1, [sp, 0x6C]\n" "\tlsls r6, r1, 1\n" "\tadds r1, r6\n" "\tmov r9, r1\n" "\tlsls r1, 1\n" "\tmov r2, r8\n" "\tadds r0, r2, r1\n" "\tadds r3, 0x34\n" "\tadds r3, r0\n" "\tldrb r0, [r3]\n" "\tlsls r2, r0, 4\n" "\tadds r2, r0\n" "\tlsls r2, 2\n" "\tldr r5, _0804A230 @ =gSprites\n" "\tadds r2, r5\n" "\tldr r4, _0804A234 @ =gTradeMonSpriteCoords\n" "\tmov r0, r9\n" "\tlsls r5, r0, 2\n" "\tadds r0, r5, r4\n" "\tldrb r0, [r0]\n" "\tadds r1, 0x1\n" "\tlsls r1, 1\n" "\tadds r1, r4\n" "\tldrb r1, [r1]\n" "\tadds r0, r1\n" "\tasrs r0, 1\n" "\tlsls r0, 3\n" "\tadds r0, 0xE\n" "\tstrh r0, [r2, 0x20]\n" "\tldrb r0, [r3]\n" "\tlsls r1, r0, 4\n" "\tadds r1, r0\n" "\tlsls r1, 2\n" "\tldr r2, _0804A230 @ =gSprites\n" "\tadds r1, r2\n" "\tadds r4, 0x1\n" "\tadds r5, r4\n" "\tldrb r0, [r5]\n" "\tlsls r0, 3\n" "\tsubs r0, 0xC\n" "\tstrh r0, [r1, 0x22]\n" "\tldrb r1, [r3]\n" "\tlsls r0, r1, 4\n" "\tadds r0, r1\n" "\tlsls r0, 2\n" "\tadds r0, r2\n" "\tmovs r5, 0\n" "\tstrh r5, [r0, 0x24]\n" "\tldrb r1, [r3]\n" "\tlsls r0, r1, 4\n" "\tadds r0, r1\n" "\tlsls r0, 2\n" "\tadds r0, r2\n" "\tstrh r5, [r0, 0x26]\n" "\tmov r0, sp\n" "\tadds r0, 0x12\n" "\tldr r1, [sp, 0x6C]\n" "\tmov r2, r8\n" "\tbl sub_804A2B4\n" "\tadd r1, sp, 0xC\n" "\tmovs r3, 0xFC\n" "\tstrb r3, [r1]\n" "\tadds r2, r1, 0\n" "\tmovs r1, 0x6\n" "\tstrb r1, [r2, 0x1]\n" "\tmovs r1, 0x4\n" "\tstrb r1, [r2, 0x2]\n" "\tadds r1, r2, 0\n" "\tstrb r3, [r1, 0x3]\n" "\tstrb r7, [r1, 0x4]\n" "\tlsls r0, 24\n" "\tasrs r0, 24\n" "\tmovs r1, 0x40\n" "\tsubs r1, r0\n" "\tlsrs r0, r1, 31\n" "\tadds r1, r0\n" "\tasrs r1, 1\n" "\tstrb r1, [r2, 0x5]\n" "\tldr r0, _0804A22C @ =gUnknown_03004824\n" "\tldr r1, [r0]\n" "\tadds r0, r1, 0x4\n" "\tadds r1, 0x7A\n" "\tldrb r2, [r1]\n" "\tmov r1, r9\n" "\tlsls r1, 6\n" "\tmov r9, r1\n" "\tadd r2, r9\n" "\tldr r4, _0804A238 @ =gUnknown_0820C334\n" "\tldr r3, [sp, 0x6C]\n" "\tlsls r1, r3, 2\n" "\tadds r3, r1, r4\n" "\tldrb r3, [r3]\n" "\tldr r5, _0804A23C @ =gUnknown_0820C334 + 0x1\n" "\tadds r1, r5\n" "\tldrb r1, [r1]\n" "\tstr r1, [sp]\n" "\tadd r1, sp, 0xC\n" "\tbl sub_8003460\n" "\tadd r7, sp, 0x34\n" "\tadds r0, r7, 0\n" "\tldr r1, [sp, 0x6C]\n" "\tmov r2, r8\n" "\tbl sub_804A33C\n" "\tldr r0, _0804A22C @ =gUnknown_03004824\n" "\tldr r2, [r0]\n" "\tadds r0, r2, 0x4\n" "\tldr r1, _0804A240 @ =gOtherText_Terminator2\n" "\tadds r2, 0x7A\n" "\tldrb r2, [r2]\n" "\tadd r2, r9\n" "\tadds r2, 0x20\n" "\tadds r6, 0x1\n" "\tlsls r6, 1\n" "\tadds r4, r6, r4\n" "\tldrb r5, [r4]\n" "\tldr r3, _0804A23C @ =gUnknown_0820C334 + 0x1\n" "\tadds r6, r3\n" "\tldrb r4, [r6]\n" "\tadds r4, 0x1\n" "\tlsls r4, 24\n" "\tlsrs r4, 24\n" "\tstr r4, [sp]\n" "\tadds r3, r5, 0\n" "\tbl sub_8003460\n" "\tldr r0, _0804A22C @ =gUnknown_03004824\n" "\tldr r1, [r0]\n" "\tadds r0, r1, 0x4\n" "\tadds r1, 0x7A\n" "\tldrb r2, [r1]\n" "\tadd r2, r9\n" "\tadds r2, 0x26\n" "\tstr r4, [sp]\n" "\tadds r1, r7, 0\n" "\tadds r3, r5, 0\n" "\tbl sub_8003460\n" "\tldr r2, _0804A22C @ =gUnknown_03004824\n" "\tldr r1, [r2]\n" "\tb _0804A28A\n" "\t.align 2, 0\n" "_0804A228: .4byte gTradeMovesBoxTilemap\n" "_0804A22C: .4byte gUnknown_03004824\n" "_0804A230: .4byte gSprites\n" "_0804A234: .4byte gTradeMonSpriteCoords\n" "_0804A238: .4byte gUnknown_0820C334\n" "_0804A23C: .4byte gUnknown_0820C334 + 0x1\n" "_0804A240: .4byte gOtherText_Terminator2\n" "_0804A244:\n" "\tldr r0, _0804A2A4 @ =gUnknown_0820C14C\n" "\tldr r0, [r0, 0x14]\n" "\tadds r1, r5, 0\n" "\tadds r1, 0x7E\n" "\tldrh r1, [r1]\n" "\tlsls r1, 5\n" "\tldr r3, _0804A2A8 @ =0x06010000\n" "\tadds r1, r3\n" "\tmovs r2, 0x14\n" "\tbl sub_804ACD8\n" "\tldr r0, _0804A2AC @ =gUnknown_0820C3D1\n" "\tmov r5, r10\n" "\tlsls r1, r5, 1\n" "\tadds r4, r1, r0\n" "\tldrb r2, [r4]\n" "\tadds r2, 0x4\n" "\tlsls r2, 24\n" "\tlsrs r2, 24\n" "\tadds r0, 0x1\n" "\tadds r1, r0\n" "\tldrb r3, [r1]\n" "\tadds r3, 0x1\n" "\tlsls r3, 24\n" "\tlsrs r3, 24\n" "\tldrb r0, [r4]\n" "\tstr r0, [sp]\n" "\tldrb r0, [r1]\n" "\tstr r0, [sp, 0x4]\n" "\tmov r0, r10\n" "\tmov r1, r8\n" "\tbl sub_804A51C\n" "\tldr r0, _0804A2B0 @ =gUnknown_03004824\n" "\tldr r1, [r0]\n" "_0804A28A:\n" "\tadds r1, 0x80\n" "\tadd r1, r10\n" "\tldrb r0, [r1]\n" "\tadds r0, 0x1\n" "\tstrb r0, [r1]\n" "_0804A294:\n" "\tadd sp, 0x74\n" "\tpop {r3-r5}\n" "\tmov r8, r3\n" "\tmov r9, r4\n" "\tmov r10, r5\n" "\tpop {r4-r7}\n" "\tpop {r0}\n" "\tbx r0\n" "\t.align 2, 0\n" "_0804A2A4: .4byte gUnknown_0820C14C\n" "_0804A2A8: .4byte 0x06010000\n" "_0804A2AC: .4byte gUnknown_0820C3D1\n" "_0804A2B0: .4byte gUnknown_03004824" "\n.syntax divided\n")
# 2930 "src/engine/trade.c"
                                                          ;
}





u8 sub_804A2B4(u8 *a0, u8 whichParty, u8 whichPokemon)
{
    u8 string[11];
    if (whichParty == 0)
    {
        GetMonData(&gPlayerParty[whichPokemon], 2, string);
        StringCopy10(a0, string);
        GetMonGender(&gPlayerParty[whichPokemon]);
        GetMonData(&gPlayerParty[whichPokemon], 56);
    }
    else
    {
        GetMonData(&gEnemyParty[whichPokemon], 2, string);
        StringCopy10(a0, string);
        GetMonGender(&gEnemyParty[whichPokemon]);
        GetMonData(&gEnemyParty[whichPokemon], 56);
    }
    return GetStringWidthGivenWindowConfig(&gWindowConfig_81E7294, a0);
}




void sub_804A33C(u8 *a0, u8 whichParty, u8 whichPokemon)
{
    u16 i;
    u16 moves[4];
    if (gUnknown_03004824->unk_005d[whichParty][whichPokemon] == 0)
    {
        for (i = 0; i < 4; i ++)
        {
            if (whichParty == 0)
                moves[i] = GetMonData(&gPlayerParty[whichPokemon], 13 + i, ((void *)0));
            else
                moves[i] = GetMonData(&gEnemyParty[whichPokemon], 13 + i, ((void *)0));
        }
        StringCopy(a0, gOtherText_Terminator);
        for (i = 0; i < 4; i ++)
        {
            if (moves[i] != 0)
            {
                StringAppend(a0, gMoveNames[moves[i]]);
            }
            StringAppend(a0, gOtherText_ControlAndMiscText);
        }
    }
    else
    {
        StringCopy(a0, gOtherText_Terminator);
        StringAppend(a0, gOtherText_FourQuestions);
    }
}
# 3016 "src/engine/trade.c"
__attribute__((naked))
static void sub_804A41C(u8 whichParty)
{
    asm(".syntax unified\n" "\tpush {r4-r7,lr}\n" "\tmov r7, r10\n" "\tmov r6, r9\n" "\tmov r5, r8\n" "\tpush {r5-r7}\n" "\tsub sp, 0x44\n" "\tlsls r0, 24\n" "\tlsrs r5, r0, 24\n" "\tadd r3, sp, 0x1C\n" "\tmovs r2, 0\n" "\tmovs r1, 0xFC\n" "\tstrb r1, [r3]\n" "\tmovs r0, 0x6\n" "\tstrb r0, [r3, 0x1]\n" "\tmovs r0, 0x4\n" "\tstrb r0, [r3, 0x2]\n" "\tstrb r1, [r3, 0x3]\n" "\tmovs r0, 0x11\n" "\tstrb r0, [r3, 0x4]\n" "\tstrb r2, [r3, 0x5]\n" "\tmovs r6, 0\n" "\tldr r1, _0804A470 @ =gUnknown_03004824\n" "\tldr r0, [r1]\n" "\tadds r0, 0x42\n" "\tadds r0, r5\n" "\tldrb r0, [r0]\n" "\tcmp r6, r0\n" "\tbcs _0804A504\n" "\tmov r8, r3\n" "\tadds r7, r1, 0\n" "\tldr r0, _0804A474 @ =gTradeMonSpriteCoords\n" "\tmov r9, r0\n" "\tmovs r4, 0x1\n" "\tadd r4, r9\n" "\tmov r10, r4\n" "_0804A462:\n" "\tcmp r5, 0\n" "\tbne _0804A47C\n" "\tmovs r0, 0x64\n" "\tadds r4, r6, 0\n" "\tmuls r4, r0\n" "\tldr r0, _0804A478 @ =gPlayerParty\n" "\tb _0804A484\n" "\t.align 2, 0\n" "_0804A470: .4byte gUnknown_03004824\n" "_0804A474: .4byte gTradeMonSpriteCoords\n" "_0804A478: .4byte gPlayerParty\n" "_0804A47C:\n" "\tmovs r0, 0x64\n" "\tadds r4, r6, 0\n" "\tmuls r4, r0\n" "\tldr r0, _0804A514 @ =gEnemyParty\n" "_0804A484:\n" "\tadds r4, r0\n" "\tadds r0, r4, 0\n" "\tmovs r1, 0x2\n" "\tadd r2, sp, 0x4\n" "\tbl GetMonData\n" "\tmov r0, sp\n" "\tadds r0, 0x22\n" "\tadd r1, sp, 0x4\n" "\tbl StringCopy10\n" "\tadds r0, r4, 0\n" "\tbl GetMonGender\n" "\tmov r1, sp\n" "\tadds r1, 0x22\n" "\tldr r0, _0804A518 @ =gWindowConfig_81E7294\n" "\tbl GetStringWidthGivenWindowConfig\n" "\tlsls r0, 24\n" "\tlsrs r0, 24\n" "\tmovs r1, 0x32\n" "\tsubs r1, r0\n" "\tlsrs r0, r1, 31\n" "\tadds r1, r0\n" "\tasrs r1, 1\n" "\tmov r0, r8\n" "\tstrb r1, [r0, 0x5]\n" "\tldr r1, [r7]\n" "\tadds r0, r1, 0x4\n" "\tadds r1, 0x7A\n" "\tlsls r2, r5, 5\n" "\tadds r2, r5\n" "\tlsls r2, 2\n" "\tldrb r1, [r1]\n" "\tadds r2, r1\n" "\tmovs r1, 0x16\n" "\tmuls r1, r6\n" "\tadds r2, r1\n" "\tlsls r2, 16\n" "\tlsrs r2, 16\n" "\tlsls r1, r5, 1\n" "\tadds r1, r5\n" "\tlsls r1, 1\n" "\tadds r1, r6, r1\n" "\tlsls r1, 1\n" "\tmov r4, r9\n" "\tadds r3, r1, r4\n" "\tldrb r3, [r3]\n" "\tadd r1, r10\n" "\tldrb r1, [r1]\n" "\tstr r1, [sp]\n" "\tmov r1, r8\n" "\tbl sub_8003460\n" "\tadds r0, r6, 0x1\n" "\tlsls r0, 24\n" "\tlsrs r6, r0, 24\n" "\tldr r0, [r7]\n" "\tadds r0, 0x42\n" "\tadds r0, r5\n" "\tldrb r0, [r0]\n" "\tcmp r6, r0\n" "\tbcc _0804A462\n" "_0804A504:\n" "\tadd sp, 0x44\n" "\tpop {r3-r5}\n" "\tmov r8, r3\n" "\tmov r9, r4\n" "\tmov r10, r5\n" "\tpop {r4-r7}\n" "\tpop {r0}\n" "\tbx r0\n" "\t.align 2, 0\n" "_0804A514: .4byte gEnemyParty\n" "_0804A518: .4byte gWindowConfig_81E7294" "\n.syntax divided\n")
# 3142 "src/engine/trade.c"
                                                              ;
}





void sub_804A51C(u8 a0, u8 a1, u8 a2, u8 a3, u8 a4, u8 a5)
{
    u8 nickname[24];
    u8 level;
    u8 gender;
    u8 lv_div_10;
    sub_804A96C(&gUnknown_03004824->unk_00c8, a4, a5, gTradeMonBoxTilemap, 6, 3, 0);
    if (a0 == 0)
    {
        level = GetMonData(&gPlayerParty[a1], 56, ((void *)0));
        gender = GetMonGender(&gPlayerParty[a1]);
        GetMonData(&gPlayerParty[a1], 2, nickname);
    }
    else
    {
        level = GetMonData(&gEnemyParty[a1], 56, ((void *)0));
        gender = GetMonGender(&gEnemyParty[a1]);
        GetMonData(&gEnemyParty[a1], 2, nickname);
    }
    if (gUnknown_03004824->unk_005d[a0][a1] == 0)
    {
        lv_div_10 = level / 10;
        if (lv_div_10 != 0)
        {
            gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3] = lv_div_10 + 0x60;
        }
        gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 + 1] = (u8)(level % 10) + 0x70;
        if (gender == 0x00)
        {
            if (!NameHasGenderSymbol(nickname, 0x00))
            {
                gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 31] += 1;
            }
        }
        else if (gender == 0xFE)
        {
            if (!NameHasGenderSymbol(nickname, 0xFE))
            {
                gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 31] += 2;
            }
        }
    }
    else
    {
        gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 32] = gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 33];
        gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 31] = gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 36] | 0x400;
    }
}
# 3208 "src/engine/trade.c"
__attribute__((naked))
static void sub_804A6DC(u8 whichParty)
{
    asm(".syntax unified\n" "\tpush {r4-r7,lr}\n" "\tsub sp, 0x8\n" "\tlsls r0, 24\n" "\tlsrs r6, r0, 24\n" "\tmovs r7, 0\n" "\tldr r0, _0804A734 @ =gUnknown_03004824\n" "\tldr r0, [r0]\n" "\tadds r0, 0x42\n" "\tadds r0, r6\n" "\tldrb r0, [r0]\n" "\tcmp r7, r0\n" "\tbge _0804A72C\n" "\tlsls r0, r6, 1\n" "\tadds r0, r6\n" "\tldr r1, _0804A738 @ =gTradeLevelDisplayCoords\n" "\tlsls r0, 2\n" "\tadds r5, r0, r1\n" "\tldr r1, _0804A73C @ =gTradeMonBoxCoords\n" "\tadds r4, r0, r1\n" "_0804A702:\n" "\tlsls r1, r7, 24\n" "\tlsrs r1, 24\n" "\tldrb r2, [r5]\n" "\tldrb r3, [r5, 0x1]\n" "\tldrb r0, [r4]\n" "\tstr r0, [sp]\n" "\tldrb r0, [r4, 0x1]\n" "\tstr r0, [sp, 0x4]\n" "\tadds r0, r6, 0\n" "\tbl sub_804A51C\n" "\tadds r5, 0x2\n" "\tadds r4, 0x2\n" "\tadds r7, 0x1\n" "\tldr r0, _0804A734 @ =gUnknown_03004824\n" "\tldr r0, [r0]\n" "\tadds r0, 0x42\n" "\tadds r0, r6\n" "\tldrb r0, [r0]\n" "\tcmp r7, r0\n" "\tblt _0804A702\n" "_0804A72C:\n" "\tadd sp, 0x8\n" "\tpop {r4-r7}\n" "\tpop {r0}\n" "\tbx r0\n" "\t.align 2, 0\n" "_0804A734: .4byte gUnknown_03004824\n" "_0804A738: .4byte gTradeLevelDisplayCoords\n" "_0804A73C: .4byte gTradeMonBoxCoords" "\n.syntax divided\n")
# 3259 "src/engine/trade.c"
                                                           ;
}


static void sub_804A740(u8 whichParty)
{
    int i;
    for (i = 0; i < gUnknown_03004824->partyCounts[whichParty]; i ++)
    {
        gSprites[gUnknown_03004824->partyIcons[whichParty][i]].invisible = 0;
        gSprites[gUnknown_03004824->partyIcons[whichParty][i]].pos1.x = gTradeMonSpriteCoords[6 * whichParty + i][0] * 8 + 14;
        gSprites[gUnknown_03004824->partyIcons[whichParty][i]].pos1.y = gTradeMonSpriteCoords[6 * whichParty + i][1] * 8 - 12;
        gSprites[gUnknown_03004824->partyIcons[whichParty][i]].pos2.x = 0;
        gSprites[gUnknown_03004824->partyIcons[whichParty][i]].pos2.y = 0;
    }
}

static void sub_804A80C(void)
{
    FillWindowRect_DefaultPalette(&gUnknown_03004824->window, 0, gUnknown_0820C330[1][0], 0, gUnknown_0820C330[1][1], 19);
    sub_804A41C(1);
}

static void sub_804A840(u8 whichParty)
{
    if (whichParty == 0)
    {
        FillWindowRect_DefaultPalette(&gUnknown_03004824->window, 0, gUnknown_0820C330[0][0], 0, gUnknown_0820C330[0][1], 19);
        sub_804A96C(&gUnknown_03004824->unk_00c8, 0, 0, gTradePartyBoxTilemap, 15, 17, 0);
        sub_804A6DC(0);
        sub_804A41C(0);
        sub_804A740(0);
        sub_804A938(&gUnknown_03004824->unk_00c8);
    }
    else
    {
        HandleDestroyMenuCursors();
        FillWindowRect_DefaultPalette(&gUnknown_03004824->window, 0, gUnknown_0820C330[1][0], 0, gUnknown_0820C330[1][1], 19);
        sub_804A96C(&gUnknown_03004824->unk_00c8, 15, 0, gTradePartyBoxTilemap, 15, 17, 0);
        sub_804A6DC(1);
        sub_804A41C(1);
        sub_804A740(1);
        sub_804A938(&gUnknown_03004824->unk_00c8);
    }
    sub_804ACD8(gUnknown_0820C14C[1], (void *)(0x6000000 + (0x4000 * (4))) + 32 * gUnknown_03004824->unk_007e, 20);
    gUnknown_03004824->unk_0080[whichParty] = 0;
}

static void sub_804A938(struct UnkStructD *unkStructD)
{
    unkStructD->unk_10 = 1;
}

static void sub_804A940(struct UnkStructD *unkStructD)
{
    if (unkStructD->unk_10)
    {
        CpuSet(unkStructD->unk_12, unkStructD->vramAddr, 0x00000000 | ((sizeof(unkStructD->unk_12))/(16/8) & 0x1FFFFF));
        unkStructD->unk_10 = 0;
    }
}

static void sub_804A964(struct UnkStructD *unkStructD, void *dest)
{
    unkStructD->unk_10 = 0;
    unkStructD->vramAddr = dest;
}

static void sub_804A96C(struct UnkStructD *arg0, u8 left, u8 top, const u16 *tilemap, u8 width, u8 height, u16 sp8) {
    int y, x;

    for (y = 0; y < height; y++)
    {

        for (x = 0; x < width; x++)
        {
            arg0->unk_12[(top * 32 + left) + y * 32 + x] = tilemap[width * y + x] | sp8;
        }
    }

    arg0->unk_10 = 1;
}

static void sub_804A9F4(u8 unused)
{
    MenuZeroFillScreen();
}

static void sub_804AA00(u8 unused)
{
    MenuZeroFillScreen();
}

static void sub_804AA0C(u8 a0)
{
    DrawTextWindow(&gUnknown_03004824->window, gTradeMessageWindowRects[a0][0], gTradeMessageWindowRects[a0][1], gTradeMessageWindowRects[a0][2], gTradeMessageWindowRects[a0][3]);
    sub_8003460(&gUnknown_03004824->window, gUnknown_0820C2F0[a0], 0x180 + gUnknown_03004824->unk_007a, gTradeMessageWindowRects[a0][0] + 1, gTradeMessageWindowRects[a0][1] + 1);
}

static void sub_804AA88(void)
{
    int i;
    for (i = 0; i < 4; i ++)
    {
        gUnknown_03004824->unk_08dc[i].unk_00 = 0;
        gUnknown_03004824->unk_08dc[i].unk_02 = 0;
        gUnknown_03004824->unk_08dc[i].unk_04 |= 0xff;
    }
}

static void sub_804AADC(u16 a0, u8 a1)
{
    int i;
    for (i = 0; i < 4; i ++)
    {
        if (gUnknown_03004824->unk_08dc[i].unk_00 == 0)
        {
            gUnknown_03004824->unk_08dc[i].unk_02 = a0;
            gUnknown_03004824->unk_08dc[i].unk_04 = a1;
            gUnknown_03004824->unk_08dc[i].unk_00 = 1;
            break;
        }
    }
}

static void sub_804AB30(void)
{
    int i;
    for (i = 0; i < 4; i ++)
    {
        if (gUnknown_03004824->unk_08dc[i].unk_00)
        {
            if (gUnknown_03004824->unk_08dc[i].unk_02 != 0)
            {
                gUnknown_03004824->unk_08dc[i].unk_02 --;
                continue;
            }
            switch (gUnknown_03004824->unk_08dc[i].unk_04)
            {
                case 0:
                    (SendBlock(bitmask_all_link_players_but_self(), gUnknown_03004824->linkData, 20));
                    break;
                case 1:
                    sub_804AA0C(0);
                    break;
                case 2:
                    sub_804AA0C(2);
                    break;
                case 3:
                    sub_804AA0C(3);
                    break;
                case 4:
                    sub_804AA0C(3);
                    break;
                case 5:
                    sub_804AA0C(3);
                    break;
            }
            gUnknown_03004824->unk_08dc[i].unk_00 = 0;
        }
    }
}

static bool8 sub_804ABF8(void)
{
    switch (gUnknown_03004824->unk_00b4)
    {
        case 8:
            gUnknown_03004824->unk_007e = LoadSpriteSheet(&gUnknown_0820C07C[gUnknown_03004824->unk_00b4]);
            gUnknown_03004824->unk_00b4 ++;
            return 0;
        case 13:
            LoadSpritePalette(&gSpritePalette_TradeScreenText);
            gUnknown_03004824->unk_00b4 ++;
            return 0;
        case 14:
            LoadSpritePalette(&gUnknown_0820C12C);
            gUnknown_03004824->unk_00b4 ++;
            return 0;
        case 15:
            LoadSpriteSheet(&gUnknown_0820C124);
            gUnknown_03004824->unk_00b4 ++;

        case 16:
            gUnknown_03004824->unk_00b4 = 0;
            return 1;
        default:
            LoadSpriteSheet(&gUnknown_0820C07C[gUnknown_03004824->unk_00b4]);
            gUnknown_03004824->unk_00b4 ++;
            return 0;
    }
}

static void sub_804ACD8(const u8 *src, u8 *dest, u8 a2)
{
    sub_804AFB8(&gWindowConfig_81E725C, dest, src, a2);
}
# 3509 "src/engine/trade.c"
static __attribute__((naked)) void sub_804ACF4(u8 who)
{
    asm(".syntax unified\n" "\tpush {r4-r7,lr}\n" "\tmov r7, r9\n" "\tmov r6, r8\n" "\tpush {r6,r7}\n" "\tlsls r0, 24\n" "\tlsrs r0, 24\n" "\tmov r8, r0\n" "\tcmp r0, 0\n" "\tbeq _0804AD0C\n" "\tcmp r0, 0x1\n" "\tbeq _0804ADA0\n" "\tb _0804AE2C\n" "_0804AD0C:\n" "\tmovs r7, 0\n" "\tldr r1, _0804AD4C @ =gUnknown_03004824\n" "\tldr r0, [r1]\n" "\tadds r0, 0x42\n" "\tldrb r0, [r0]\n" "\tcmp r7, r0\n" "\tblt _0804AD1C\n" "\tb _0804AE2C\n" "_0804AD1C:\n" "\tadds r6, r1, 0\n" "\tmovs r5, 0\n" "\tmov r9, r5\n" "_0804AD22:\n" "\tmovs r0, 0x64\n" "\tadds r1, r7, 0\n" "\tmuls r1, r0\n" "\tldr r0, _0804AD50 @ =gPlayerParty\n" "\tadds r4, r1, r0\n" "\tadds r0, r4, 0\n" "\tmovs r1, 0x2D\n" "\tbl GetMonData\n" "\tadds r1, r0, 0\n" "\tcmp r1, 0x1\n" "\tbne _0804AD54\n" "\tldr r0, [r6]\n" "\tadds r0, 0x51\n" "\tadds r0, r5\n" "\tmov r2, r9\n" "\tstrb r2, [r0]\n" "\tldr r0, [r6]\n" "\tadds r0, 0x5D\n" "\tadds r0, r5\n" "\tb _0804AD84\n" "\t.align 2, 0\n" "_0804AD4C: .4byte gUnknown_03004824\n" "_0804AD50: .4byte gPlayerParty\n" "_0804AD54:\n" "\tadds r0, r4, 0\n" "\tmovs r1, 0x39\n" "\tbl GetMonData\n" "\tadds r1, r0, 0\n" "\tcmp r1, 0\n" "\tbne _0804AD72\n" "\tldr r0, [r6]\n" "\tadds r0, 0x51\n" "\tadds r0, r5\n" "\tstrb r1, [r0]\n" "\tldr r0, [r6]\n" "\tadds r0, 0x5D\n" "\tadds r0, r5\n" "\tb _0804AD84\n" "_0804AD72:\n" "\tldr r0, [r6]\n" "\tadds r0, 0x51\n" "\tadds r0, r5\n" "\tmovs r1, 0x1\n" "\tstrb r1, [r0]\n" "\tldr r0, [r6]\n" "\tadds r0, 0x5D\n" "\tadds r0, r5\n" "\tmov r1, r9\n" "_0804AD84:\n" "\tstrb r1, [r0]\n" "\tldr r0, _0804AD9C @ =gUnknown_03004824\n" "\tadds r5, 0x1\n" "\tadds r7, 0x1\n" "\tldr r0, [r0]\n" "\tadds r0, 0x42\n" "\tadd r0, r8\n" "\tldrb r0, [r0]\n" "\tcmp r7, r0\n" "\tblt _0804AD22\n" "\tb _0804AE2C\n" "\t.align 2, 0\n" "_0804AD9C: .4byte gUnknown_03004824\n" "_0804ADA0:\n" "\tmovs r7, 0\n" "\tldr r1, _0804ADE0 @ =gUnknown_03004824\n" "\tldr r0, [r1]\n" "\tadds r0, 0x43\n" "\tldrb r0, [r0]\n" "\tcmp r7, r0\n" "\tbge _0804AE2C\n" "\tadds r6, r1, 0\n" "\tmovs r5, 0x6\n" "\tmovs r2, 0\n" "\tmov r9, r2\n" "_0804ADB6:\n" "\tmovs r0, 0x64\n" "\tadds r1, r7, 0\n" "\tmuls r1, r0\n" "\tldr r0, _0804ADE4 @ =gEnemyParty\n" "\tadds r4, r1, r0\n" "\tadds r0, r4, 0\n" "\tmovs r1, 0x2D\n" "\tbl GetMonData\n" "\tadds r1, r0, 0\n" "\tcmp r1, 0x1\n" "\tbne _0804ADE8\n" "\tldr r0, [r6]\n" "\tadds r0, 0x51\n" "\tadds r0, r5\n" "\tmov r2, r9\n" "\tstrb r2, [r0]\n" "\tldr r0, [r6]\n" "\tadds r0, 0x5D\n" "\tadds r0, r5\n" "\tb _0804AE18\n" "\t.align 2, 0\n" "_0804ADE0: .4byte gUnknown_03004824\n" "_0804ADE4: .4byte gEnemyParty\n" "_0804ADE8:\n" "\tadds r0, r4, 0\n" "\tmovs r1, 0x39\n" "\tbl GetMonData\n" "\tadds r1, r0, 0\n" "\tcmp r1, 0\n" "\tbne _0804AE06\n" "\tldr r0, [r6]\n" "\tadds r0, 0x51\n" "\tadds r0, r5\n" "\tstrb r1, [r0]\n" "\tldr r0, [r6]\n" "\tadds r0, 0x5D\n" "\tadds r0, r5\n" "\tb _0804AE18\n" "_0804AE06:\n" "\tldr r0, [r6]\n" "\tadds r0, 0x51\n" "\tadds r0, r5\n" "\tmovs r1, 0x1\n" "\tstrb r1, [r0]\n" "\tldr r0, [r6]\n" "\tadds r0, 0x5D\n" "\tadds r0, r5\n" "\tmov r1, r9\n" "_0804AE18:\n" "\tstrb r1, [r0]\n" "\tldr r0, _0804AE38 @ =gUnknown_03004824\n" "\tadds r5, 0x1\n" "\tadds r7, 0x1\n" "\tldr r0, [r0]\n" "\tadds r0, 0x42\n" "\tadd r0, r8\n" "\tldrb r0, [r0]\n" "\tcmp r7, r0\n" "\tblt _0804ADB6\n" "_0804AE2C:\n" "\tpop {r3,r4}\n" "\tmov r8, r3\n" "\tmov r9, r4\n" "\tpop {r4-r7}\n" "\tpop {r0}\n" "\tbx r0\n" "\t.align 2, 0\n" "_0804AE38: .4byte gUnknown_03004824" "\n.syntax divided\n")
# 3679 "src/engine/trade.c"
                                                          ;
}


static void sub_804AE3C(u8 who)
{
    u16 i;
    u16 curHp;
    u16 maxHp;
    switch (who)
    {
        case 0:
            for (i = 0; i < gUnknown_03004824->partyCounts[0]; i ++)
            {
                curHp = GetMonData(&gPlayerParty[i], 57);
                maxHp = GetMonData(&gPlayerParty[i], 58);
                gUnknown_03004824->unk_0069[0][i] = GetHPBarLevel(curHp, maxHp);
            }
            break;
        case 1:
            for (i = 0; i < gUnknown_03004824->partyCounts[1]; i ++)
            {
                curHp = GetMonData(&gEnemyParty[i], 57);
                maxHp = GetMonData(&gEnemyParty[i], 58);
                gUnknown_03004824->unk_0069[1][i] = GetHPBarLevel(curHp, maxHp);
            }
            break;
    }
}

static void sub_804AF10(void)
{
    int i, j;
    for (i = 0; i < 2; i ++)
    {
        for (j = 0; j < gUnknown_03004824->partyCounts[i]; j ++)
        {
            sub_809D824(&gSprites[gUnknown_03004824->partyIcons[i][j]], 4 - gUnknown_03004824->unk_0069[i][j]);
        }
    }
}

static void sub_804AF84(void)
{
    int i;
    for (i = 0; i < 11; i ++)
        if (gSaveBlock1.giftRibbons[i] == 0 && gUnknown_03004824->unk_00b5[i] != 0)
            gSaveBlock1.giftRibbons[i] = gUnknown_03004824->unk_00b5[i];
}

static void sub_804AFB8(const struct WindowConfig *windowConfig, u8 *dest, const u8 *src, u8 size)
{
    u8 i;
    u8 *tileBuffer;
    size = (size + 3) / 4;
    tileBuffer = gTileBuffer;
    { vu16 tmp = (vu16)(0); CpuSet((void *)&tmp, tileBuffer, 0x00000000 | 0x01000000 | ((size * 0x80)/(16/8) & 0x1FFFFF)); };
    { vu16 tmp = (vu16)(0); CpuSet((void *)&tmp, tileBuffer + windowConfig->width * 0x20, 0x00000000 | 0x01000000 | ((size * 0x80)/(16/8) & 0x1FFFFF)); };
    sub_8004E3C(windowConfig, tileBuffer, src);
    for (i = 0; i < size; i ++)
    {
        CpuSet(&tileBuffer[32 * (i * 4)], &dest[32 * (i * 8)], 0x00000000 | ((0x80)/(16/8) & 0x1FFFFF));
        CpuSet(&tileBuffer[32 * (i * 4 + windowConfig->width)], &dest[32 * (i * 8 + 4)], 0x00000000 | ((0x80)/(16/8) & 0x1FFFFF));
    }
}

static void sub_804B058(struct Sprite *sprite)
{
    if (++ sprite->data[0] == 10)
    {
        PlaySE(SE_BOWA);
        sprite->data[0] = 0;
    }
}

static void sub_804B07C(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        if (++ sprite->data[0] == 12)
            sprite->data[0] = 0;
        LoadPalette(&gTradeGlow2PaletteAnimTable[sprite->data[0]], 16 * (sprite->oam.paletteNum + 16) + 4, 2);
    }
}

static void sub_804B0BC(struct Sprite *sprite)
{
    sprite->data[0] ++;
    sprite->pos2.y ++;
    if (sprite->data[0] == 10)
        DestroySprite(sprite);
}

static void sub_804B0E0(struct Sprite *sprite)
{
    sprite->data[0] ++;
    sprite->pos2.y --;
    if (sprite->data[0] == 10)
        DestroySprite(sprite);
}

static void sub_804B104(struct Sprite *sprite)
{
    if (++ sprite->data[0] == 15)
    {
        PlaySE(SE_W107);
        sprite->data[0] = 0;
    }
}

static void sub_804B128(void)
{
    struct BgAffineDstData dest;
    DoBgAffineSet(&dest, gUnknown_03004828->unk_0104 << 8, gUnknown_03004828->unk_0106 << 8, gUnknown_03004828->unk_010c, gUnknown_03004828->unk_010e, gUnknown_03004828->unk_0118, gUnknown_03004828->unk_0118, gUnknown_03004828->unk_011c);
    (*(vu16 *)(0x4000000 + 0x20)) = dest.pa;
    (*(vu16 *)(0x4000000 + 0x22)) = dest.pb;
    (*(vu16 *)(0x4000000 + 0x24)) = dest.pc;
    (*(vu16 *)(0x4000000 + 0x26)) = dest.pd;
    (*(vu32 *)(0x4000000 + 0x28)) = dest.dx;
    (*(vu32 *)(0x4000000 + 0x2c)) = dest.dy;
}
# 3817 "src/engine/trade.c"
__attribute__((naked)) static void sub_804B1BC(void)
{
    asm(".syntax unified\n" "\tpush {lr}\n" "\tldr r1, _0804B1FC @ =REG_BG1VOFS\n" "\tldr r0, _0804B200 @ =gUnknown_03004828\n" "\tldr r2, [r0]\n" "\tmovs r3, 0x88\n" "\tlsls r3, 1\n" "\tadds r0, r2, r3\n" "\tldrh r0, [r0]\n" "\tstrh r0, [r1]\n" "\tsubs r1, 0x2\n" "\tadds r3, 0x2\n" "\tadds r0, r2, r3\n" "\tldrh r0, [r0]\n" "\tstrh r0, [r1]\n" "\tmovs r0, 0x80\n" "\tlsls r0, 19\n" "\tldrh r0, [r0]\n" "\tmovs r1, 0x7\n" "\tands r0, r1\n" "\tcmp r0, 0\n" "\tbne _0804B208\n" "\tldr r1, _0804B204 @ =REG_BG2VOFS\n" "\tadds r3, 0x2\n" "\tadds r0, r2, r3\n" "\tldrh r0, [r0]\n" "\tstrh r0, [r1]\n" "\tsubs r1, 0x2\n" "\tadds r3, 0x2\n" "\tadds r0, r2, r3\n" "\tldrh r0, [r0]\n" "\tstrh r0, [r1]\n" "\tb _0804B20C\n" "\t.align 2, 0\n" "_0804B1FC: .4byte REG_BG1VOFS\n" "_0804B200: .4byte gUnknown_03004828\n" "_0804B204: .4byte REG_BG2VOFS\n" "_0804B208:\n" "\tbl sub_804B128\n" "_0804B20C:\n" "\tpop {r0}\n" "\tbx r0" "\n.syntax divided\n")
# 3859 "src/engine/trade.c"
                              ;
}


static void sub_804B210(void)
{
    sub_804B1BC();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_804B228(void)
{
    gUnknown_03004828->unk_00b4 = 0;
    gUnknown_03004828->unk_00b2 = 0;
    gUnknown_03004828->unk_00b3 = 0;
}




void sub_804B24C(void)
{
    if (gUnknown_03004828->unk_00b2 == gUnknown_03004828->unk_00b3)
    {
        gUnknown_03004828->unk_00b4 ++;
    }
    else
    {
        gUnknown_03004828->unk_00b4 = 0;
    }
    if (gUnknown_03004828->unk_00b4 > 0xb4)
    {
        gUnknown_03004828->unk_00b4 = 0;
        gUnknown_03004828->unk_00b3 = 0;
        gUnknown_03004828->unk_00b2 = 0;
    }
    gUnknown_03004828->unk_00b3 = gUnknown_03004828->unk_00b2;
}

static u8 sub_804B2B0(void)
{
    if (gReceivedRemoteLinkPlayers)
        return GetMultiplayerId();
    return 0;
}

static void sub_804B2D0(u8 whichParty, u8 a1)
{
    u8 v0;
    struct Pokemon *pokemon;
    u16 species;
    u32 personality;

    v0 = 0;
    pokemon = ((void *)0);
    if (whichParty == 0)
    {
        pokemon = &gPlayerParty[gUnknown_020297D8[0]];
        v0 = 1;
    }
    if (whichParty == 1)
    {
        pokemon = &gEnemyParty[gUnknown_020297D8[1] % 6];
        v0 = 3;
    }
    switch (a1)
    {
        case 0:
            species = GetMonData(pokemon, 65);
            personality = GetMonData(pokemon, 0);
            HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, (u32)gSharedMem, gUnknown_081FAF4C[whichParty * 2 + 1], species, personality);
            LoadCompressedObjectPalette(GetMonSpritePalStruct(pokemon));
            gUnknown_03004828->tradeSpecies[whichParty] = species;
            break;
        case 1:
            GetMonSpriteTemplate_803C56C(GetMonSpritePalStruct(pokemon)->tag, v0);
            gUnknown_03004828->pokePicSpriteIdxs[whichParty] = CreateSprite(&gUnknown_02024E8C, 0x78, 0x3c, 0x6);
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[whichParty]].invisible = 1;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[whichParty]].callback = SpriteCallbackDummy;
            break;
    }
}
# 4061 "src/engine/trade.c"
static __attribute__((naked)) void sub_804B41C(void)
{
    asm(".syntax unified\n" "\tpush {r4-r6,lr}\n" "\tsub sp, 0x4\n" "\tldr r1, _0804B43C @ =gMain\n" "\tldr r2, _0804B440 @ =0x0000043c\n" "\tadds r0, r1, r2\n" "\tldrb r0, [r0]\n" "\tadds r2, r1, 0\n" "\tcmp r0, 0xC\n" "\tbls _0804B430\n" "\tb _0804B76E_break\n" "_0804B430:\n" "\tlsls r0, 2\n" "\tldr r1, _0804B444 @ =_0804B448\n" "\tadds r0, r1\n" "\tldr r0, [r0]\n" "\tmov pc, r0\n" "\t.align 2, 0\n" "_0804B43C: .4byte gMain\n" "_0804B440: .4byte 0x0000043c\n" "_0804B444: .4byte _0804B448\n" "\t.align 2, 0\n" "_0804B448:\n" "\t.4byte _0804B47C_case00\n" "\t.4byte _0804B5AC_case01\n" "\t.4byte _0804B5D4_case02\n" "\t.4byte _0804B5FC_case03\n" "\t.4byte _0804B648_case04\n" "\t.4byte _0804B678_case05\n" "\t.4byte _0804B6A8_case06\n" "\t.4byte _0804B6B2_case07\n" "\t.4byte _0804B6CC_case08\n" "\t.4byte _0804B6E4_case09\n" "\t.4byte _0804B71C_case10\n" "\t.4byte _0804B726_case11\n" "\t.4byte _0804B75C_case12\n" "_0804B47C_case00:\n" "\tmovs r1, 0x80\n" "\tlsls r1, 19\n" "\tmovs r0, 0\n" "\tstrh r0, [r1]\n" "\tbl ResetTasks\n" "\tbl CloseLink\n" "\tldr r6, _0804B570 @ =gUnknown_03004828\n" "\tldr r5, _0804B574 @ =gSharedMem + 0x1F000\n" "\tstr r5, [r6]\n" "\tbl ResetSpriteData\n" "\tbl FreeAllSpritePalettes\n" "\tldr r0, _0804B578 @ =sub_804B210\n" "\tbl SetVBlankCallback\n" "\tbl sub_804B228\n" "\tldr r4, _0804B57C @ =gWindowConfig_81E6F84\n" "\tadds r0, r4, 0\n" "\tbl SetUpWindowConfig\n" "\tldr r0, [r6]\n" "\tadds r0, 0x4\n" "\tadds r1, r4, 0\n" "\tbl InitWindowFromConfig\n" "\tmovs r0, 0x2\n" "\tbl SetTextWindowBaseTileNum\n" "\tldr r1, [r6]\n" "\tadds r1, 0x34\n" "\tstrb r0, [r1]\n" "\tldr r0, [r6]\n" "\tadds r0, 0x4\n" "\tbl LoadTextWindowGraphics\n" "\tbl MenuZeroFillScreen\n" "\tldr r1, _0804B580 @ =gLinkType\n" "\tldr r4, _0804B584 @ =0x00001144\n" "\tadds r0, r4, 0\n" "\tstrh r0, [r1]\n" "\tldr r1, _0804B588 @ =gMain\n" "\tldr r0, _0804B58C @ =0x0000043c\n" "\tadds r1, r0\n" "\tldrb r0, [r1]\n" "\tadds r0, 0x1\n" "\tstrb r0, [r1]\n" "\tldr r0, _0804B590 @ =gUnknown_08D00000\n" "\tmovs r1, 0xC0\n" "\tlsls r1, 19\n" "\tbl LZDecompressVram\n" "\tldr r0, _0804B594 @ =gUnknown_08D00524\n" "\tldr r1, _0804B598 @ =0xfffe1000\n" "\tadds r5, r1\n" "\tmovs r2, 0x80\n" "\tlsls r2, 4\n" "\tadds r1, r5, 0\n" "\tbl CpuSet\n" "\tldr r1, _0804B59C @ =0x06002800\n" "\tldr r0, _0804B5A0 @ =0x040000d4\n" "\tstr r5, [r0]\n" "\tstr r1, [r0, 0x4]\n" "\tldr r1, _0804B5A4 @ =0x80000280\n" "\tstr r1, [r0, 0x8]\n" "\tldr r0, [r0, 0x8]\n" "\tldr r0, _0804B5A8 @ =gUnknown_08D004E0\n" "\tmovs r1, 0\n" "\tmovs r2, 0x20\n" "\tbl LoadCompressedPalette\n" "\tldr r1, [r6]\n" "\tadds r0, r1, 0\n" "\tadds r0, 0xB6\n" "\tmovs r2, 0\n" "\tstrh r2, [r0]\n" "\tadds r0, 0xE\n" "\tstrh r2, [r0]\n" "\tmovs r4, 0x8F\n" "\tlsls r4, 1\n" "\tadds r1, r4\n" "\tmovs r0, 0x1\n" "\tstrb r0, [r1]\n" "\tldr r3, [r6]\n" "\tmovs r1, 0x82\n" "\tlsls r1, 1\n" "\tadds r0, r3, r1\n" "\tmovs r1, 0x40\n" "\tstrh r1, [r0]\n" "\tsubs r4, 0x18\n" "\tadds r0, r3, r4\n" "\tstrh r1, [r0]\n" "\tadds r1, 0xC8\n" "\tadds r0, r3, r1\n" "\tstrh r2, [r0]\n" "\tadds r4, 0x4\n" "\tadds r0, r3, r4\n" "\tstrh r2, [r0]\n" "\tmovs r0, 0x86\n" "\tlsls r0, 1\n" "\tadds r1, r3, r0\n" "\tmovs r0, 0x78\n" "\tstrh r0, [r1]\n" "\tadds r4, 0x4\n" "\tadds r1, r3, r4\n" "\tmovs r0, 0x50\n" "\tstrh r0, [r1]\n" "\tadds r0, 0xC8\n" "\tadds r1, r3, r0\n" "\tsubs r0, 0x18\n" "\tstrh r0, [r1]\n" "\tmovs r1, 0x8E\n" "\tlsls r1, 1\n" "\tadds r0, r3, r1\n" "\tstrh r2, [r0]\n" "\tb _0804B76E_break\n" "\t.align 2, 0\n" "_0804B570: .4byte gUnknown_03004828\n" "_0804B574: .4byte gSharedMem + 0x1F000\n" "_0804B578: .4byte sub_804B210\n" "_0804B57C: .4byte gWindowConfig_81E6F84\n" "_0804B580: .4byte gLinkType\n" "_0804B584: .4byte 0x00001144\n" "_0804B588: .4byte gMain\n" "_0804B58C: .4byte 0x0000043c\n" "_0804B590: .4byte gUnknown_08D00000\n" "_0804B594: .4byte gUnknown_08D00524\n" "_0804B598: .4byte 0xfffe1000\n" "_0804B59C: .4byte 0x06002800\n" "_0804B5A0: .4byte 0x040000d4\n" "_0804B5A4: .4byte 0x80000280\n" "_0804B5A8: .4byte gUnknown_08D004E0\n" "_0804B5AC_case01:\n" "\tbl OpenLink\n" "\tldr r1, _0804B5C8 @ =gMain\n" "\tldr r2, _0804B5CC @ =0x0000043c\n" "\tadds r1, r2\n" "\tldrb r0, [r1]\n" "\tadds r0, 0x1\n" "\tmovs r2, 0\n" "\tstrb r0, [r1]\n" "\tldr r0, _0804B5D0 @ =gUnknown_03004828\n" "\tldr r0, [r0]\n" "\tadds r0, 0xC0\n" "\tstr r2, [r0]\n" "\tb _0804B76E_break\n" "\t.align 2, 0\n" "_0804B5C8: .4byte gMain\n" "_0804B5CC: .4byte 0x0000043c\n" "_0804B5D0: .4byte gUnknown_03004828\n" "_0804B5D4_case02:\n" "\tldr r0, _0804B5F4 @ =gUnknown_03004828\n" "\tldr r0, [r0]\n" "\tadds r1, r0, 0\n" "\tadds r1, 0xC0\n" "\tldr r0, [r1]\n" "\tadds r0, 0x1\n" "\tstr r0, [r1]\n" "\tcmp r0, 0x3C\n" "\tbhi _0804B5E8\n" "\tb _0804B76E_break\n" "_0804B5E8:\n" "\tmovs r0, 0\n" "\tstr r0, [r1]\n" "\tldr r4, _0804B5F8 @ =0x0000043c\n" "\tadds r1, r2, r4\n" "\tb _0804B74C\n" "\t.align 2, 0\n" "_0804B5F4: .4byte gUnknown_03004828\n" "_0804B5F8: .4byte 0x0000043c\n" "_0804B5FC_case03:\n" "\tbl IsLinkMaster\n" "\tlsls r0, 24\n" "\tcmp r0, 0\n" "\tbne _0804B608\n" "\tb _0804B746\n" "_0804B608:\n" "\tbl GetLinkPlayerCount_2\n" "\tadds r4, r0, 0\n" "\tbl sub_800820C\n" "\tlsls r4, 24\n" "\tlsls r0, 24\n" "\tcmp r4, r0\n" "\tbcs _0804B61C\n" "\tb _0804B76E_break\n" "_0804B61C:\n" "\tldr r0, _0804B63C @ =gUnknown_03004828\n" "\tldr r1, [r0]\n" "\tadds r1, 0xC0\n" "\tldr r0, [r1]\n" "\tadds r0, 0x1\n" "\tstr r0, [r1]\n" "\tcmp r0, 0x1E\n" "\tbhi _0804B62E\n" "\tb _0804B76E_break\n" "_0804B62E:\n" "\tbl sub_8007F4C\n" "\tldr r1, _0804B640 @ =gMain\n" "\tldr r0, _0804B644 @ =0x0000043c\n" "\tadds r1, r0\n" "\tb _0804B74C\n" "\t.align 2, 0\n" "_0804B63C: .4byte gUnknown_03004828\n" "_0804B640: .4byte gMain\n" "_0804B644: .4byte 0x0000043c\n" "_0804B648_case04:\n" "\tbl sub_804B24C\n" "\tldr r0, _0804B66C @ =gReceivedRemoteLinkPlayers\n" "\tldrb r0, [r0]\n" "\tcmp r0, 0x1\n" "\tbeq _0804B656\n" "\tb _0804B76E_break\n" "_0804B656:\n" "\tbl IsLinkPlayerDataExchangeComplete\n" "\tlsls r0, 24\n" "\tlsrs r0, 24\n" "\tcmp r0, 0x1\n" "\tbeq _0804B664\n" "\tb _0804B76E_break\n" "_0804B664:\n" "\tldr r1, _0804B670 @ =gMain\n" "\tldr r4, _0804B674 @ =0x0000043c\n" "\tadds r1, r4\n" "\tb _0804B74C\n" "\t.align 2, 0\n" "_0804B66C: .4byte gReceivedRemoteLinkPlayers\n" "_0804B670: .4byte gMain\n" "_0804B674: .4byte 0x0000043c\n" "_0804B678_case05:\n" "\tldr r2, _0804B69C @ =gUnknown_03004828\n" "\tldr r0, [r2]\n" "\tadds r0, 0x9C\n" "\tmovs r1, 0\n" "\tstrb r1, [r0]\n" "\tldr r0, [r2]\n" "\tadds r0, 0x9D\n" "\tstrb r1, [r0]\n" "\tldr r0, [r2]\n" "\tadds r0, 0xBD\n" "\tstrb r1, [r0]\n" "\tmovs r0, 0\n" "\tbl sub_804B2D0\n" "\tldr r1, _0804B6A0 @ =gMain\n" "\tldr r0, _0804B6A4 @ =0x0000043c\n" "\tadds r1, r0\n" "\tb _0804B74C\n" "\t.align 2, 0\n" "_0804B69C: .4byte gUnknown_03004828\n" "_0804B6A0: .4byte gMain\n" "_0804B6A4: .4byte 0x0000043c\n" "_0804B6A8_case06:\n" "\tmovs r0, 0\n" "\tmovs r1, 0x1\n" "\tbl sub_804B2D0\n" "\tb _0804B746\n" "_0804B6B2_case07:\n" "\tmovs r0, 0x1\n" "\tmovs r1, 0\n" "\tbl sub_804B2D0\n" "\tldr r1, _0804B6C4 @ =gMain\n" "\tldr r4, _0804B6C8 @ =0x0000043c\n" "\tadds r1, r4\n" "\tb _0804B74C\n" "\t.align 2, 0\n" "_0804B6C4: .4byte gMain\n" "_0804B6C8: .4byte 0x0000043c\n" "_0804B6CC_case08:\n" "\tmovs r0, 0x1\n" "\tmovs r1, 0x1\n" "\tbl sub_804B2D0\n" "\tldr r1, _0804B6DC @ =gMain\n" "\tldr r0, _0804B6E0 @ =0x0000043c\n" "\tadds r1, r0\n" "\tb _0804B74C\n" "\t.align 2, 0\n" "_0804B6DC: .4byte gMain\n" "_0804B6E0: .4byte 0x0000043c\n" "_0804B6E4_case09:\n" "\tbl sub_804C164\n" "\tldr r0, _0804B704 @ =gUnknown_0821594C\n" "\tbl LoadSpriteSheet\n" "\tldr r0, _0804B708 @ =gUnknown_08215954\n" "\tbl LoadSpritePalette\n" "\tldr r1, _0804B70C @ =REG_BG1CNT\n" "\tldr r2, _0804B710 @ =0x00000502\n" "\tadds r0, r2, 0\n" "\tstrh r0, [r1]\n" "\tldr r1, _0804B714 @ =gMain\n" "\tldr r4, _0804B718 @ =0x0000043c\n" "\tadds r1, r4\n" "\tb _0804B74C\n" "\t.align 2, 0\n" "_0804B704: .4byte gUnknown_0821594C\n" "_0804B708: .4byte gUnknown_08215954\n" "_0804B70C: .4byte REG_BG1CNT\n" "_0804B710: .4byte 0x00000502\n" "_0804B714: .4byte gMain\n" "_0804B718: .4byte 0x0000043c\n" "_0804B71C_case10:\n" "\tldr r0, _0804B754 @ =0x0000043c\n" "\tadds r1, r2, r0\n" "\tldrb r0, [r1]\n" "\tadds r0, 0x1\n" "\tstrb r0, [r1]\n" "_0804B726_case11:\n" "\tmovs r0, 0x5\n" "\tbl sub_804BBE8\n" "\tmovs r0, 0\n" "\tbl sub_804BBE8\n" "\tbl sub_804C1A8\n" "\tmovs r0, 0x1\n" "\tnegs r0, r0\n" "\tmovs r1, 0\n" "\tstr r1, [sp]\n" "\tmovs r2, 0x10\n" "\tmovs r3, 0\n" "\tbl BeginNormalPaletteFade\n" "_0804B746:\n" "\tldr r1, _0804B758 @ =gMain\n" "\tldr r2, _0804B754 @ =0x0000043c\n" "\tadds r1, r2\n" "_0804B74C:\n" "\tldrb r0, [r1]\n" "\tadds r0, 0x1\n" "\tstrb r0, [r1]\n" "\tb _0804B76E_break\n" "\t.align 2, 0\n" "_0804B754: .4byte 0x0000043c\n" "_0804B758: .4byte gMain\n" "_0804B75C_case12:\n" "\tldr r0, _0804B788 @ =gPaletteFade\n" "\tldrb r1, [r0, 0x7]\n" "\tmovs r0, 0x80\n" "\tands r0, r1\n" "\tcmp r0, 0\n" "\tbne _0804B76E_break\n" "\tldr r0, _0804B78C @ =sub_804DB84\n" "\tbl SetMainCallback2\n" "_0804B76E_break:\n" "\tbl RunTasks\n" "\tbl AnimateSprites\n" "\tbl BuildOamBuffer\n" "\tbl UpdatePaletteFade\n" "\tadd sp, 0x4\n" "\tpop {r4-r6}\n" "\tpop {r0}\n" "\tbx r0\n" "\t.align 2, 0\n" "_0804B788: .4byte gPaletteFade\n" "_0804B78C: .4byte sub_804DB84" "\n.syntax divided\n")
# 4439 "src/engine/trade.c"
                                                    ;
}


static void sub_804B790(void)

{
    u8 otName[11];
    switch (gMain.state)
    {
        case 0:
            gUnknown_020297D8[0] = gSpecialVar_0x8005;
            gUnknown_020297D8[1] = 6;
            StringCopy(gLinkPlayers[0].name, gSaveBlock2.playerName);
            GetMonData(&gEnemyParty[0], 7, otName);
            StringCopy(gLinkPlayers[1].name, otName);
            (*(vu16 *)(0x4000000 + 0x0)) = 0;
            ResetTasks();
            gUnknown_03004828 = &(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).unk_0f000;
            ResetSpriteData();
            FreeAllSpritePalettes();
            SetVBlankCallback(sub_804B210);
            sub_804B228();
            SetUpWindowConfig(&gWindowConfig_81E717C);
            InitWindowFromConfig(&gUnknown_03004828->window, &gWindowConfig_81E717C);
            gUnknown_03004828->textWindowBaseTileNum = SetTextWindowBaseTileNum(2);
            LoadTextWindowGraphics(&gUnknown_03004828->window);
            MenuZeroFillScreen();
            gLinkType = 0x1144;
            gUnknown_03004828->isLinkTrade = 0;
            gUnknown_03004828->unk_00b6 = 0;
            gUnknown_03004828->unk_00c4 = 0;
            gUnknown_03004828->unk_0104 = 0x40;
            gUnknown_03004828->unk_0106 = 0x40;
            gUnknown_03004828->unk_0108 = 0;
            gUnknown_03004828->unk_010a = 0;
            gUnknown_03004828->unk_010c = 0x78;
            gUnknown_03004828->unk_010e = 0x50;
            gUnknown_03004828->unk_0118 = 0x100;
            gUnknown_03004828->unk_011c = 0;
            gUnknown_03004828->unk_00c0 = 0;
            gMain.state = 5;
            break;
        case 5:
            sub_804B2D0(0, 0);
            gMain.state ++;
            break;
        case 6:
            sub_804B2D0(0, 1);
            gMain.state ++;
            break;
        case 7:
            sub_804B2D0(1, 0);
            gMain.state ++;
            break;
        case 8:
            sub_804B2D0(1, 1);
            gMain.state ++;
            break;
        case 9:
            sub_804C164();
            LoadSpriteSheet(&gUnknown_0821594C);
            LoadSpritePalette(&gUnknown_08215954);
            (*(vu16 *)(0x4000000 + 0xa)) = (2) | ((5) << 8);
            gMain.state ++;
            break;
        case 10:
            gMain.state ++;

        case 11:
            sub_804BBE8(5);
            sub_804BBE8(0);
            sub_804C1A8();
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            gMain.state ++;
            break;
        case 12:
            if (!gPaletteFade.active)
            {
                SetMainCallback2(sub_804BBCC);
            }
            break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804BA18(u8 partyIdx)
{
    struct Pokemon *pokemon = &gPlayerParty[partyIdx];
    if (!GetMonData(pokemon, 45))
    {
        u16 species = SpeciesToNationalPokedexNum(GetMonData(pokemon, 11, ((void *)0)));
        GetSetPokedexFlag(species, 2);
        GetSetPokedexFlag(species, 3);
    }
}

static void sub_804BA64(void)
{
    u8 mpId = GetMultiplayerId();
    if (gLinkPlayers[mpId ^ 1].lp_field_2 == 0x8000)
        EnableNationalPokedex();
}

static void sub_804BA94(u8 a0, u8 a1)
{
    u8 friendship;
    struct Pokemon *playerPokemon = &gPlayerParty[a0];
    u16 playerMail = GetMonData(playerPokemon, 64);

    struct Pokemon *friendPokemon = &gEnemyParty[a1];
    u16 friendMail = GetMonData(friendPokemon, 64);

    if (playerMail != 0xff)
        ClearMailStruct(&gSaveBlock1.mail[playerMail]);


    gUnknown_03004828->pokemon = *playerPokemon;
    *playerPokemon = *friendPokemon;
    *friendPokemon = gUnknown_03004828->pokemon;

    friendship = 70;
    if (!GetMonData(playerPokemon, 45))
        SetMonData(playerPokemon, 32, &friendship);

    if (friendMail != 0xff)
        GiveMailToMon2(playerPokemon, &gUnknown_02029700[friendMail]);

    sub_804BA18(a0);
    if (gReceivedRemoteLinkPlayers)
        sub_804BA64();
}

static void sub_804BB78(void)
{
    switch (gUnknown_03004828->unk_00bd)
    {
        case 1:
            if (sub_8007ECC())
            {
                (SendBlock(bitmask_all_link_players_but_self(), gUnknown_03004828->linkData, 20));
                gUnknown_03004828->unk_00bd ++;
            }

        case 2:
            gUnknown_03004828->unk_00bd = 0;
            break;
    }
}

static void sub_804BBCC(void)
{
    sub_804C29C();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804BBE8(u8 a0)
{
    int i;
    u16 *buffer;
    switch (a0)
    {
        case 0:
            LoadPalette(gUnknown_0820C9F8, 0x10, 0xa0);
            { const void *_src = gUnknown_0820CA98; void *_dest = (void *)(0x6000000 + (0x4000 * (1))); u32 _size = 0x1300; while (1) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | (((0x1000))/(16/8))); dmaRegs[2]; }; _src += (0x1000); _dest += (0x1000); _size -= (0x1000); if (_size <= (0x1000)) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; break; } } };
            { const void *_src = gUnknown_0820F798; void *_dest = (void *)(0x6000000 + (0x800 * (18))); u32 _size = 0x1000; { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; };
            gUnknown_03004828->bg2vofs = 0;
            gUnknown_03004828->bg2hofs = 0xb4;
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0100 | 0x0200 | 0x0400 | 0x1000;
            (*(vu16 *)(0x4000000 + 0xc)) = (2) | ((1) << 2) | ((18) << 8) | 0x4000;
            break;
        case 1:
            gUnknown_03004828->bg1hofs = 0;
            gUnknown_03004828->bg1vofs = 0x15c;
            (*(vu16 *)(0x4000000 + 0x16)) = 0x15c;
            (*(vu16 *)(0x4000000 + 0xa)) = (2) | ((0) << 2) | ((5) << 8) | 0x8000;

            { const void *_src = gUnknown_08210798; void *_dest = (void *)(0x6000000 + (0x800 * (5))); u32 _size = 0x1000; { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; };
            { const void *_src = gUnknown_0820CA98; void *_dest = (void *)(0x6000000 + (0x4000 * (0))); u32 _size = 0x1300; while (1) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | (((0x1000))/(16/8))); dmaRegs[2]; }; _src += (0x1000); _dest += (0x1000); _size -= (0x1000); if (_size <= (0x1000)) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; break; } } };
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0001 | 0x0040 | 0x0200 | 0x1000;
            break;
        case 2:
            gUnknown_03004828->bg1vofs = 0;
            gUnknown_03004828->bg1hofs = 0;
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0001 | 0x0040 | 0x0200 | 0x1000;
            { const void *_src = gUnknown_08211798; void *_dest = (void *)(0x6000000 + (0x800 * (5))); u32 _size = 0x800; { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; };
            break;
        case 3:
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0200 | 0x1000;
            gUnknown_03004828->unk_0104 = 0x40;
            gUnknown_03004828->unk_0106 = 0x40;
            gUnknown_03004828->unk_010c = 0x78;
            gUnknown_03004828->unk_010e = -0x46;
            gUnknown_03004828->unk_011c = 0;
            { const void *_src = gUnknown_0820DD98; void *_dest = (void *)(0x6000000 + (0x4000 * (1))); u32 _size = 0x1a00; while (1) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | (((0x1000))/(16/8))); dmaRegs[2]; }; _src += (0x1000); _dest += (0x1000); _size -= (0x1000); if (_size <= (0x1000)) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; break; } } };
            { const void *_src = gUnknown_08211F98; void *_dest = (void *)(0x6000000 + (0x800 * (18))); u32 _size = 0x100; { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; };
            break;
        case 4:
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0001 | 0x0040 | 0x0400 | 0x1000;
            (*(vu16 *)(0x4000000 + 0xc)) = (3) | ((1) << 2) | 0x0080 | ((18) << 8);
            gUnknown_03004828->unk_0104 = 0x40;
            gUnknown_03004828->unk_0106 = 0x5c;
            gUnknown_03004828->unk_0118 = 0x20;
            gUnknown_03004828->unk_011a = 0x400;
            gUnknown_03004828->unk_011c = 0;
            { const void *_src = gUnknown_08213738; void *_dest = (void *)(0x6000000 + (0x4000 * (1))); u32 _size = 0x2040; while (1) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | (((0x1000))/(16/8))); dmaRegs[2]; }; _src += (0x1000); _dest += (0x1000); _size -= (0x1000); if (_size <= (0x1000)) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; break; } } };
            { const void *_src = gUnknown_08215778; void *_dest = (void *)(0x6000000 + (0x800 * (18))); u32 _size = 0x100; { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; };
            break;
        case 5:
            gUnknown_03004828->bg1vofs = 0;
            gUnknown_03004828->bg1hofs = 0;
            (*(vu16 *)(0x4000000 + 0xa)) = (2) | ((0) << 2) | ((5) << 8);
            LZDecompressVram(gUnknown_08D00000, (void *)(0x6000000 + (0x4000 * (0))));
            CpuSet(gUnknown_08D00524, buffer = (u16 *)gSharedMem, 0x00000000 | ((0x1000)/(16/8) & 0x1FFFFF));
            LoadCompressedPalette(gUnknown_08D004E0, 0x70, 0x20);
            FillPalette(0, 0, 2);
            for (i = 0; i < 0x280; i ++)
                buffer[i] |= 0x7000;
            { const void *_src = gSharedMem; void *_dest = (void *)(0x6000000 + (0x800 * (5))); u32 _size = 0x500; { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; };
            MenuZeroFillWindowRect(2, 15, 27, 18);
            break;
        case 6:
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0001 | 0x0040 | 0x0400 | 0x1000;
            (*(vu16 *)(0x4000000 + 0xc)) = (3) | ((1) << 2) | 0x0080 | ((18) << 8);
            gUnknown_03004828->unk_0104 = 0x40;
            gUnknown_03004828->unk_0106 = 0x5c;
            gUnknown_03004828->unk_0118 = 0x100;
            gUnknown_03004828->unk_011a = 0x80;
            gUnknown_03004828->unk_010c = 0x78;
            gUnknown_03004828->unk_010e = 0x50;
            gUnknown_03004828->unk_011c = 0;
            { const void *_src = gUnknown_08213738; void *_dest = (void *)(0x6000000 + (0x4000 * (1))); u32 _size = 0x2040; while (1) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | (((0x1000))/(16/8))); dmaRegs[2]; }; _src += (0x1000); _dest += (0x1000); _size -= (0x1000); if (_size <= (0x1000)) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; break; } } };
            { const void *_src = gUnknown_08215778; void *_dest = (void *)(0x6000000 + (0x800 * (18))); u32 _size = 0x100; { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; };
            break;
        case 7:
            gUnknown_03004828->bg2vofs = 0;
            gUnknown_03004828->bg2hofs = 0;
            (*(vu16 *)(0x4000000 + 0xc)) = (2) | ((1) << 2) | ((18) << 8) | 0x4000;
            LoadPalette(gUnknown_0820C9F8, 0x10, 0xa0);
            { const void *_src = gUnknown_0820CA98; void *_dest = (void *)(0x6000000 + (0x4000 * (1))); u32 _size = 0x1300; while (1) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | (((0x1000))/(16/8))); dmaRegs[2]; }; _src += (0x1000); _dest += (0x1000); _size -= (0x1000); if (_size <= (0x1000)) { { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; break; } } };
            { const void *_src = gUnknown_0820F798; void *_dest = (void *)(0x6000000 + (0x800 * (18))); u32 _size = 0x1000; { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; };
            break;
    }
}

static void sub_804C0F8(u8 a0)
{
    if (a0 == 0)
    {
        if (gUnknown_03004828->bg1vofs < 0x10a)
        {
            gUnknown_03004828->unk_010e ++;
            gUnknown_03004828->unk_011c += 64;
        }
    }
    else
    {
        if (gUnknown_03004828->unk_010e > -0x40)
        {
            gUnknown_03004828->unk_010e --;
            gUnknown_03004828->unk_011c += 64;
        }
    }
}

static void sub_804C164(void)
{
    LoadSpriteSheet(&gUnknown_082159A4);
    LoadSpriteSheet(&gUnknown_082159F4);
    LoadSpriteSheet(&gUnknown_08215A28);
    LoadSpriteSheet(&gUnknown_08215A78);
    LoadSpritePalette(&gUnknown_082159AC);
    LoadSpritePalette(&gUnknown_082159B4);
}

static void sub_804C1A8(void)
{
    u8 mpId;
    u8 string[20];
    const struct InGameTrade *ingameTrade;
    if (gUnknown_03004828->isLinkTrade)
    {
        mpId = GetMultiplayerId();
        StringCopy(gStringVar1, gLinkPlayers[mpId ^ 1].name);
        GetMonData(&gEnemyParty[gUnknown_020297D8[1] % 6], 2, string);
        StringCopy10(gStringVar3, string);
        GetMonData(&gPlayerParty[gUnknown_020297D8[0]], 2, string);
        StringCopy10(gStringVar2, string);
    }
    else
    {
        ingameTrade = &gIngameTrades[gSpecialVar_0x8004];
        StringCopy(gStringVar1, ingameTrade->otName);
        StringCopy10(gStringVar3, ingameTrade->name);
        GetMonData(&gPlayerParty[gSpecialVar_0x8005], 2, string);
        StringCopy10(gStringVar2, string);
    }
}

static bool8 sub_804C29C(void)
{
    u16 evoTarget;

    switch (gUnknown_03004828->unk_00c4)
    {
        case 0:
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].invisible = 0;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].pos2.x = -0xb4;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].pos2.y = gMonFrontPicCoords[gUnknown_03004828->tradeSpecies[0]].y_offset;
            gUnknown_03004828->unk_00c4 ++;
            gUnknown_03004828->unk_0124 = GetCurrentMapMusic();
            PlayBGM(BGM_SHINKA);
            break;
        case 1:
            if (gUnknown_03004828->bg2hofs > 0)
            {
                gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].pos2.x += 3;
                gUnknown_03004828->bg2hofs -= 3;
            }
            else
            {
                gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].pos2.x = 0;
                gUnknown_03004828->bg2hofs = 0;
                gUnknown_03004828->unk_00c4 = 10;
            }
            break;

        case 10:
            StringExpandPlaceholders(gStringVar4, gTradeText_WillBeSent);
            sub_8003460(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            gUnknown_03004828->unk_00c4 = 11;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 11:
            if (++gUnknown_03004828->unk_00c0 == 80)
            {
                gUnknown_03004828->unk_0102 = sub_8047580(gUnknown_03004828->pokePicSpriteIdxs[0], gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].oam.paletteNum, 0x78, 0x20, 0x2, 0x1, 0x14, 0xfffff);
                gUnknown_03004828->unk_00c4 ++;
                ZeroFillWindowRect(&gUnknown_03004828->window, 0, 0, 29, 19);
                StringExpandPlaceholders(gStringVar4, gTradeText_ByeBye);
                sub_8003460(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            }
            break;
        case 12:
            if (gSprites[gUnknown_03004828->unk_0102].callback == SpriteCallbackDummy && sub_80035AC(&gUnknown_03004828->window) == 1)
            {
                gUnknown_03004828->unk_0103 = CreateSprite(&gSpriteTemplate_821595C, 0x78, 0x20, 0);
                gSprites[gUnknown_03004828->unk_0103].callback = sub_804D738;
                DestroySprite(&gSprites[gUnknown_03004828->unk_0102]);
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 13:

            break;
        case 14:
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004828->unk_00c4 = 20;
            break;

        case 20:
            if (!gPaletteFade.active)
            {
                sub_804BBE8(4);
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 21:
            BeginNormalPaletteFade(-1, -1, 16, 0, 0);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 22:
            if (!gPaletteFade.active)
            {
                gUnknown_03004828->unk_00c4 = 23;
            }
            break;
        case 23:
            if (gUnknown_03004828->unk_011a > 0x100)
            {
                gUnknown_03004828->unk_011a -= 0x34;
            }
            else
            {
                sub_804BBE8(1);
                gUnknown_03004828->unk_011a = 0x80;
                gUnknown_03004828->unk_00c4 ++;
                gUnknown_03004828->unk_00c0 = 0;
            }
            gUnknown_03004828->unk_0118 = 0x8000 / gUnknown_03004828->unk_011a;
            break;
        case 24:
            if (++ gUnknown_03004828->unk_00c0 > 20)
            {
                sub_804BBE8(3);
                sub_804B128();
                gUnknown_03004828->unk_00bb = CreateSprite(&gSpriteTemplate_8215A80, 0x78, 0x50, 0);
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 25:
            if (gSprites[gUnknown_03004828->unk_00bb].animEnded)
            {
                DestroySprite(&gSprites[gUnknown_03004828->unk_00bb]);
                (*(vu16 *)(0x4000000 + 0x50)) = 0x640;
                (*(vu16 *)(0x4000000 + 0x52)) = 0x40C;
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 26:
            if (-- gUnknown_03004828->bg1vofs == 0x13C)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            if (gUnknown_03004828->bg1vofs == 0x148)
            {
                gUnknown_03004828->unk_00bc = CreateSprite(&gSpriteTemplate_8215A30, 0x80, 0x41, 0);
            }
            break;
        case 27:
            gUnknown_03004828->unk_00ba = CreateSprite(&gSpriteTemplate_82159BC, 0x80, 0x50, 3);
            gUnknown_03004828->unk_00bb = CreateSprite(&gSpriteTemplate_82159FC, 0x80, 0x50, 0);
            StartSpriteAnim(&gSprites[gUnknown_03004828->unk_00bb], 1);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 28:
            if ((gUnknown_03004828->bg1vofs -= 2) == 0xA6)
            {
                gUnknown_03004828->unk_00c4 = 200;
            }
            sub_804C0F8(0);
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0001 | 0x0040 | 0x0200 | 0x0400 | 0x1000;
            break;
        case 200:
            gSprites[gUnknown_03004828->unk_00ba].pos1.y -= 2;
            gSprites[gUnknown_03004828->unk_00bb].pos1.y -= 2;
            sub_804C0F8(0);
            if (gSprites[gUnknown_03004828->unk_00ba].pos1.y < -8)
            {
                gUnknown_03004828->unk_00c4 = 29;
            }
            break;
        case 29:
            BeginNormalPaletteFade(-1, -1, 0, 16, 0);
            gUnknown_03004828->unk_00c4 = 30;
            break;
        case 30:
            if (!gPaletteFade.active)
            {
                DestroySprite(&gSprites[gUnknown_03004828->unk_00ba]);
                DestroySprite(&gSprites[gUnknown_03004828->unk_00bb]);
                sub_804BBE8(2);
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 31:
            BeginNormalPaletteFade(-1, -1, 16, 0, 0);
            gUnknown_03004828->unk_00ba = CreateSprite(&gSpriteTemplate_82159FC, 0x6f, 0xaa, 0);
            gUnknown_03004828->unk_00bb = CreateSprite(&gSpriteTemplate_82159FC, 0x81, -0xa, 0);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 32:
            if (!gPaletteFade.active)
            {
                PlaySE(SE_TK_WARPOUT);
                gUnknown_03004828->unk_00c4 ++;
            }
            gSprites[gUnknown_03004828->unk_00ba].pos2.y -= 3;
            gSprites[gUnknown_03004828->unk_00bb].pos2.y += 3;
            break;
        case 33:
            gSprites[gUnknown_03004828->unk_00ba].pos2.y -= 3;
            gSprites[gUnknown_03004828->unk_00bb].pos2.y += 3;
            if (gSprites[gUnknown_03004828->unk_00ba].pos2.y <= -0x5a)
            {
                gSprites[gUnknown_03004828->unk_00ba].data[1] = 1;
                gSprites[gUnknown_03004828->unk_00bb].data[1] = 1;
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 34:
            BlendPalettes(1, 16, 0xffff);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 35:
            BlendPalettes(1, 0, 0xffff);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 36:
            BlendPalettes(1, 16, 0xffff);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 37:
            if (!IsPokeSpriteNotFlipped(gUnknown_03004828->tradeSpecies[0]))
            {
                gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].affineAnims = gSpriteAffineAnimTable_8215AC0;
                gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].oam.affineMode = 3;
                CalcCenterToCornerVec(&gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]], 0, 3, 3);
                StartSpriteAffineAnim(&gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]], 0);
            }
            else
            {
                StartSpriteAffineAnim(&gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]], 0);
            }
            StartSpriteAffineAnim(&gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]], 0);
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].pos1.x = 0x3c;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]].pos1.x = 0xb4;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].pos1.y = 0xc0;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]].pos1.y = -0x20;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].invisible = 0;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]].invisible = 0;
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 38:
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].pos2.y -= 3;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]].pos2.y += 3;
            if (-0xa0 > gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].pos2.y && gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].pos2.y >= -0xa3)
            {
                PlaySE(SE_TK_WARPIN);
            }
            if (gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].pos2.y < -0xde)
            {
                gSprites[gUnknown_03004828->unk_00ba].data[1] = 0;
                gSprites[gUnknown_03004828->unk_00bb].data[1] = 0;
                gUnknown_03004828->unk_00c4 ++;
                gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]].invisible = 1;
                gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]].invisible = 1;
                BlendPalettes(1, 0, 0xffff);
            }
            break;
        case 39:
            gSprites[gUnknown_03004828->unk_00ba].pos2.y -= 3;
            gSprites[gUnknown_03004828->unk_00bb].pos2.y += 3;
            if (gSprites[gUnknown_03004828->unk_00ba].pos2.y <= -0xde)
            {
                BeginNormalPaletteFade(-1, -1, 0, 16, 0);
                gUnknown_03004828->unk_00c4 ++;
                DestroySprite(&gSprites[gUnknown_03004828->unk_00ba]);
                DestroySprite(&gSprites[gUnknown_03004828->unk_00bb]);
            }
            break;
        case 40:
            if (!gPaletteFade.active)
            {
                gUnknown_03004828->unk_00c4 ++;
                sub_804BBE8(1);
                gUnknown_03004828->bg1vofs = 0xa6;
                gUnknown_03004828->unk_00ba = CreateSprite(&gSpriteTemplate_82159BC, 0x80, -0x14, 3);
                gUnknown_03004828->unk_00bb = CreateSprite(&gSpriteTemplate_82159FC, 0x80, -0x14, 0);
                StartSpriteAnim(&gSprites[gUnknown_03004828->unk_00bb], 1);
            }
            break;
        case 41:
            BeginNormalPaletteFade(-1, -1, 16, 0, 0);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 42:
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0001 | 0x0040 | 0x0200 | 0x0400 | 0x1000;
            sub_804C0F8(1);
            if (!gPaletteFade.active)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 43:
            sub_804C0F8(1);
            gSprites[gUnknown_03004828->unk_00ba].pos2.y += 3;
            gSprites[gUnknown_03004828->unk_00bb].pos2.y += 3;
            if (gSprites[gUnknown_03004828->unk_00ba].pos2.y + gSprites[gUnknown_03004828->unk_00ba].pos1.y == 64)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 44:
            sub_804C0F8(1);
            if ((gUnknown_03004828->bg1vofs += 2) > 0x13c)
            {
                gUnknown_03004828->bg1vofs = 0x13c;
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 45:
            DestroySprite(&gSprites[gUnknown_03004828->unk_00ba]);
            DestroySprite(&gSprites[gUnknown_03004828->unk_00bb]);
            gUnknown_03004828->unk_00c4 ++;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 46:
            if (++ gUnknown_03004828->unk_00c0 == 10)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 47:
            if (++ gUnknown_03004828->bg1vofs > 0x15c)
            {
                gUnknown_03004828->bg1vofs = 0x15c;
                gUnknown_03004828->unk_00c4 ++;
            }
            if (gUnknown_03004828->bg1vofs == 0x148)
                gUnknown_03004828->unk_00bc = CreateSprite(&gSpriteTemplate_8215A30, 0x80, 0x41, 0);
            gSprites[gUnknown_03004828->unk_00bc].callback = sub_804B0E0;
            break;
        case 48:
            gUnknown_03004828->unk_00bb = CreateSprite(&gSpriteTemplate_8215A80, 0x78, 0x50, 0);
            gUnknown_03004828->unk_00c4 = 50;
            break;

        case 50:
            if (gSprites[gUnknown_03004828->unk_00bb].animEnded)
            {
                DestroySprite(&gSprites[gUnknown_03004828->unk_00bb]);
                sub_804BBE8(6);
                gUnknown_03004828->unk_00c4 ++;
                PlaySE(SE_W028);
            }
            break;
        case 51:
            if (gUnknown_03004828->unk_011a < 0x400)
            {
                gUnknown_03004828->unk_011a += 0x34;
            }
            else
            {
                gUnknown_03004828->unk_011a = 0x400;
                gUnknown_03004828->unk_00c4 ++;
            }
            gUnknown_03004828->unk_0118 = 0x8000 / gUnknown_03004828->unk_011a;
            break;
        case 52:
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004828->unk_00c4 = 60;
            break;

        case 60:
            if (!gPaletteFade.active)
            {
                sub_804BBE8(5);
                sub_804BBE8(7);
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 61:
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 62:
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0400 | 0x1000;
            if (!gPaletteFade.active)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 63:
            gUnknown_03004828->unk_0103 = CreateSprite(&gSpriteTemplate_821595C, 0x78, -0x8, 0);
            gSprites[gUnknown_03004828->unk_0103].data[3] = 0x4a;
            gSprites[gUnknown_03004828->unk_0103].callback = sub_804D80C;
            StartSpriteAnim(&gSprites[gUnknown_03004828->unk_0103], 1);
            StartSpriteAffineAnim(&gSprites[gUnknown_03004828->unk_0103], 2);
            BlendPalettes(1 << (16 + gSprites[gUnknown_03004828->unk_0103].oam.paletteNum), 16, 0xffff);
            gUnknown_03004828->unk_00c4 ++;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 64:
            BeginNormalPaletteFade(1 << (16 + gSprites[gUnknown_03004828->unk_0103].oam.paletteNum), 1, 16, 0, 0xffff);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 65:
            if (gSprites[gUnknown_03004828->unk_0103].callback == SpriteCallbackDummy)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 66:
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]].pos1.x = 0x78;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]].pos1.y = gMonFrontPicCoords[gUnknown_03004828->tradeSpecies[1]].y_offset + 60;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]].pos2.x = 0;
            gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]].pos2.y = 0;
            CreatePokeballSprite(gUnknown_03004828->pokePicSpriteIdxs[1], gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]].oam.paletteNum, 0x78, 0x54, 2, 1, 0x14, 0xfffff);
            FreeSpriteOamMatrix(&gSprites[gUnknown_03004828->unk_0103]);
            DestroySprite(&gSprites[gUnknown_03004828->unk_0103]);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 67:
            (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0100 | 0x0200 | 0x0400 | 0x1000;
            ZeroFillWindowRect(&gUnknown_03004828->window, 0, 0, 29, 19);
            StringExpandPlaceholders(gStringVar4, gTradeText_SentOverPoke);
            sub_8003460(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            gUnknown_03004828->unk_00c4 ++;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 68:
            if (++ gUnknown_03004828->unk_00c0 == 4)
            {
                PlayFanfare(BGM_FANFA5);
            }
            if (gUnknown_03004828->unk_00c0 == 0xf0)
            {
                gUnknown_03004828->unk_00c4 ++;
                ZeroFillWindowRect(&gUnknown_03004828->window, 0, 0, 29, 19);
                StringExpandPlaceholders(gStringVar4, gTradeText_TakeGoodCare);
                sub_8003460(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gUnknown_03004828->unk_00c0 = 0;
            }
            break;
        case 69:
            if (++ gUnknown_03004828->unk_00c0 == 60)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 70:
            sub_804E1DC();
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 71:
            if (gUnknown_03004828->isLinkTrade)
            {
                return 1;
            }
            else if (gMain.newKeys & 0x0001)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 72:
            sub_804BA94(gSpecialVar_0x8005, 0);
            gCB2_AfterEvolution = sub_804BBCC;
            evoTarget = GetEvolutionTargetSpecies(&gPlayerParty[gUnknown_020297D8[0]], 1, ITEM_NONE);
            if (evoTarget != SPECIES_NONE)
                TradeEvolutionScene(&gPlayerParty[gUnknown_020297D8[0]], evoTarget, gUnknown_03004828->pokePicSpriteIdxs[1], gUnknown_020297D8[0]);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 73:
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 74:
            if (!gPaletteFade.active)
            {
                PlayBGM(gUnknown_03004828->unk_0124);
                SetMainCallback2(c2_exit_to_overworld_2_switch);
                sub_804D8E4();
            }
            break;
    }
    return 0;
}

static void sub_804D588(void)
{
    u16 evoTarget;
    switch (gMain.state)
    {
        case 0:
            gMain.state = 4;
            gSoftResetDisabled = 1;
            break;
        case 4:
            gCB2_AfterEvolution = sub_804DC88;
            evoTarget = GetEvolutionTargetSpecies(&gPlayerParty[gUnknown_020297D8[0]], 1, ITEM_NONE);
            if (evoTarget != SPECIES_NONE)
                TradeEvolutionScene(&gPlayerParty[gUnknown_020297D8[0]], evoTarget, gUnknown_03004828->pokePicSpriteIdxs[1], gUnknown_020297D8[0]);
            else
                SetMainCallback2(sub_804DC88);
            gUnknown_020297D8[0] = 255;
            break;
    }
    if (!HasLinkErrorOccurred())
        RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804D63C(void)
{
    u8 blockReceivedStatus;
    sub_804B2B0();
    blockReceivedStatus = GetBlockReceivedStatus();
    if (blockReceivedStatus & 0x01)
    {
        if (gBlockRecvBuffer[0][0] == 0xdcba)
        {
            SetMainCallback2(sub_804D588);
        }
        if (gBlockRecvBuffer[0][0] == 0xabcd)
        {
            gUnknown_03004828->unk_009c = 1;
        }
        ResetBlockReceivedFlag(0);
    }
    if (blockReceivedStatus & 0x02)
    {
        if (gBlockRecvBuffer[1][0] == 0xabcd)
        {
            gUnknown_03004828->unk_009d = 1;
        }
        ResetBlockReceivedFlag(1);
    }
}

static void sub_804D6BC(struct Sprite *sprite)
{
    sprite->pos1.y += sprite->data[0] / 10;
    sprite->data[5] += sprite->data[1];
    sprite->pos1.x = sprite->data[5] / 10;
    if (sprite->pos1.y > 0x4c)
    {
        sprite->pos1.y = 0x4c;
        sprite->data[0] = -(sprite->data[0] * sprite->data[2]) / 100;
        sprite->data[3] ++;
    }
    if (sprite->pos1.x == 0x78)
        sprite->data[1] = 0;
    sprite->data[0] += sprite->data[4];
    if (sprite->data[3] == 4)
    {
        sprite->data[7] = 1;
        sprite->callback = SpriteCallbackDummy;
    }
}

static void sub_804D738(struct Sprite *sprite)
{
    sprite->pos2.y += gTradeBallVerticalVelocityTable[sprite->data[0]];
    if (sprite->data[0] == 22)
        PlaySE(SE_KON);
    if (++ sprite->data[0] == 44)
    {
        PlaySE(SE_W025);
        sprite->callback = sub_804D7AC;
        sprite->data[0] = 0;
        BeginNormalPaletteFade(1 << (16 + sprite->oam.paletteNum), -1, 0, 16, -1);
    }
}

static void sub_804D7AC(struct Sprite *sprite)
{
    if (sprite->data[1] == 20)
        StartSpriteAffineAnim(sprite, 1);
    if (++ sprite->data[1] > 20)
    {
        sprite->pos2.y -= gTradeBallVerticalVelocityTable[sprite->data[0]];
        if (++ sprite->data[0] == 23)
        {
            DestroySprite(sprite);
            gUnknown_03004828->unk_00c4 = 14;
        }
    }
}

static void sub_804D80C(struct Sprite *sprite)
{
    if (sprite->data[2] == 0)
    {
        if ((sprite->pos1.y += 4) > sprite->data[3])
        {
            sprite->data[2] ++;
            sprite->data[0] = 0x16;
            PlaySE(SE_KON);
        }
    }
    else
    {
        if (sprite->data[0] == 0x42)
            PlaySE(SE_KON2);
        if (sprite->data[0] == 0x5c)
            PlaySE(SE_KON3);
        if (sprite->data[0] == 0x6b)
            PlaySE(SE_KON4);
        sprite->pos2.y += gTradeBallVerticalVelocityTable[sprite->data[0]];
        if (++sprite->data[0] == 0x6c)
            sprite->callback = SpriteCallbackDummy;
    }
}

u16 sub_804D89C(void)
{
    const struct InGameTrade *inGameTrade = &gIngameTrades[gSpecialVar_0x8004];
    StringCopy(gStringVar1, gSpeciesNames[inGameTrade->playerSpecies]);
    StringCopy(gStringVar2, gSpeciesNames[inGameTrade->species]);
    return inGameTrade->playerSpecies;
}

static void sub_804D8E4(void)
{
    u8 nickname[32];
    const struct InGameTrade *inGameTrade = &gIngameTrades[gSpecialVar_0x8004];
    GetMonData(&gPlayerParty[gSpecialVar_0x8005], 2, nickname);
    StringCopy10(gStringVar1, nickname);
    StringCopy(gStringVar2, gSpeciesNames[inGameTrade->species]);
}

static void sub_804D948(u8 whichPlayerMon, u8 whichInGameTrade)
{
    const struct InGameTrade *inGameTrade = &gIngameTrades[whichInGameTrade];
    u8 level = GetMonData(&gPlayerParty[whichPlayerMon], 56);

    struct MailStruct mail;
    u8 metLocation = 0xFE;
    u8 isMail;
    struct Pokemon *pokemon = &gEnemyParty[0];

    CreateMon(pokemon, inGameTrade->species, level, 32, 1, inGameTrade->personality, 1, inGameTrade->otId);

    SetMonData(pokemon, 39, &inGameTrade->ivs[0]);
    SetMonData(pokemon, 40, &inGameTrade->ivs[1]);
    SetMonData(pokemon, 41, &inGameTrade->ivs[2]);
    SetMonData(pokemon, 42, &inGameTrade->ivs[3]);
    SetMonData(pokemon, 43, &inGameTrade->ivs[4]);
    SetMonData(pokemon, 44, &inGameTrade->ivs[5]);
    SetMonData(pokemon, 2, inGameTrade->name);
    SetMonData(pokemon, 7, inGameTrade->otName);
    SetMonData(pokemon, 49, &inGameTrade->otGender);
    SetMonData(pokemon, 46, &inGameTrade->secondAbility);
    SetMonData(pokemon, 23, &inGameTrade->stats[1]);
    SetMonData(pokemon, 24, &inGameTrade->stats[2]);
    SetMonData(pokemon, 22, &inGameTrade->stats[0]);
    SetMonData(pokemon, 33, &inGameTrade->stats[3]);
    SetMonData(pokemon, 47, &inGameTrade->stats[4]);
    SetMonData(pokemon, 48, &inGameTrade->sheen);
    SetMonData(pokemon, 35, &metLocation);

    isMail = 0;
    if (inGameTrade->heldItem != ITEM_NONE)
    {
        if (ItemIsMail(inGameTrade->heldItem))
        {
            sub_804DAD4(&mail, inGameTrade);
            gUnknown_02029700[0] = mail;
            SetMonData(pokemon, 64, &isMail);
            SetMonData(pokemon, 12, &inGameTrade->heldItem);
        }
        else
        {
            SetMonData(pokemon, 12, &inGameTrade->heldItem);
        }
    }
    CalculateMonStats(&gEnemyParty[0]);
}

static void sub_804DAD4(struct MailStruct *mail, const struct InGameTrade *trade) {
    s32 i;

    for (i = 0; i < 9; i++)
    {
        mail->words[i] = gIngameTradeMail[trade->mailNum][i];
    }

    StringCopy(mail->playerName, trade->otName);

    mail->trainerId[0] = trade->otId >> 24;
    mail->trainerId[1] = trade->otId >> 16;
    mail->trainerId[2] = trade->otId >> 8;
    mail->trainerId[3] = trade->otId;
    mail->species = trade->species;
    mail->itemId = trade->heldItem;
}

u16 sub_804DB2C(void)
{
    if (GetMonData(&gPlayerParty[gSpecialVar_0x8005], 45))
        return SPECIES_NONE;
    return GetMonData(&gPlayerParty[gSpecialVar_0x8005], 11);
}

void sub_804DB68(void)
{
    sub_804D948(gSpecialVar_0x8005, gSpecialVar_0x8004);
}




void sub_804DB84(void)
{
    if (sub_804C29C() == 1)
    {
        DestroySprite(&gSprites[gUnknown_03004828->pokePicSpriteIdxs[0]]);
        FreeSpriteOamMatrix(&gSprites[gUnknown_03004828->pokePicSpriteIdxs[1]]);
        sub_804BA94(gUnknown_020297D8[0], gUnknown_020297D8[1] % 6);
        gUnknown_03004828->linkData[0] = 0xabcd;
        gUnknown_03004828->unk_00bd = 1;
        SetMainCallback2(sub_804DC18);
    }
    sub_804BB78();
    sub_804D63C();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804DC18(void)
{
    u8 mpId = sub_804B2B0();
    sub_804D63C();
    if (mpId == 0 && gUnknown_03004828->unk_009c == 1 && gUnknown_03004828->unk_009d == 1)
    {
        gUnknown_03004828->linkData[0] = 0xdcba;
        (SendBlock(bitmask_all_link_players_but_self(), gUnknown_03004828->linkData, 20));
        gUnknown_03004828->unk_009c = 2;
        gUnknown_03004828->unk_009d = 2;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804DC88(void)
{
    switch (gMain.state)
    {
        case 0:
            gUnknown_03004828 = &(*(struct TradeEwramStruct *)(gSharedMem + 0x10000)).unk_0f000;
            gMain.state ++;
            ZeroFillWindowRect(&gUnknown_03004828->window, 0, 0, 29, 19);
            StringExpandPlaceholders(gStringVar4, gOtherText_LinkStandby2);
            sub_8003460(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            break;
        case 1:
            sub_80084A4();
            gMain.state = 100;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 100:
            if (++ gUnknown_03004828->unk_00c0 > 180)
            {
                gMain.state = 101;
                gUnknown_03004828->unk_00c0 = 0;
            }
            if (sub_8007ECC())
            {
                gMain.state = 2;
            }
            break;
        case 101:
            if (sub_8007ECC())
            {
                gMain.state = 2;
            }
            break;
        case 2:
            gMain.state = 50;
            ZeroFillWindowRect(&gUnknown_03004828->window, 0, 0, 29, 19);
            sub_8003460(&gUnknown_03004828->window, gSystemText_Saving, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            break;
        case 50:
            SetSecretBase2Field_9_AndHideBG();
            IncrementGameStat(21);
            sub_8125D80();
            gMain.state ++;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 51:
            if (++ gUnknown_03004828->unk_00c0 == 5)
            {
                gMain.state ++;
            }
            break;
        case 52:
            if (sub_8125DA8())
            {
                ClearSecretBase2Field_9_2();
                gMain.state = 4;
            }
            else
            {
                gUnknown_03004828->unk_00c0 = 0;
                gMain.state = 51;
            }
            break;
        case 4:
            sub_8125DDC();
            gMain.state = 40;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 40:
            if (++ gUnknown_03004828->unk_00c0 > 50)
            {
                gUnknown_03004828->unk_00c0 = 0;
                gMain.state = 41;
            }
            break;
        case 41:
            sub_80084A4();
            gMain.state = 42;
            break;
        case 42:
            if (sub_8007ECC())
            {
                sub_8125E04();
                gSoftResetDisabled = 0;
                gMain.state = 5;
            }
            break;
        case 5:
            if (++ gUnknown_03004828->unk_00c0 > 60)
            {
                gMain.state ++;
                sub_80084A4();
            }
            break;
        case 6:
            if (sub_8007ECC())
            {
                BeginNormalPaletteFade(-1, 0, 0, 16, 0);
                gMain.state ++;
            }
            break;
        case 7:
            if (!gPaletteFade.active)
            {
                FadeOutBGM(3);
                gMain.state ++;
            }
            break;
        case 8:
            if (IsBGMStopped() == 1)
            {
                sub_800832C();
                gMain.state ++;
            }
            break;
        case 9:
            if (!gReceivedRemoteLinkPlayers)
            {
                SetMainCallback2(sub_804E144);
            }
            break;
    }
    if (!HasLinkErrorOccurred())
    {
        RunTasks();
    }
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804E144(void)
{
    if (!gPaletteFade.active)
        SetMainCallback2((sub_8047CD8));
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_804E174(void)
{
    ScriptContext2_Enable();
    CreateTask(sub_804E1A0, 10);
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
}

static void sub_804E1A0(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(sub_804B790);
        gFieldCallback = sub_8080990;
        DestroyTask(taskId);
    }
}

static void sub_804E1DC(void)
{
    u8 i;
    u8 numRibbons = 0;
    for (i = 0; i < 12; i ++)
    {
        numRibbons += GetMonData(&gEnemyParty[gUnknown_020297D8[1] % 6], 67 + i);
    }
    if (numRibbons != 0)
        FlagSet(0x83B);
}

void sub_804E22C(void)
{
    const u16 *src;
    u16 *dest;
    LZDecompressVram(gUnknown_08D00000, (void *)0x6000000);
    CpuSet(gUnknown_08D00524, gSharedMem, 0x00000000 | ((0x1000)/(16/8) & 0x1FFFFF));
    src = (const u16 *)gSharedMem;
    dest = (void *)(0x6000000 + (0x800 * (5)));
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(src); dmaRegs[1] = (vu32)(dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((0x500)/(16/8))); dmaRegs[2]; }
    LoadCompressedPalette(gUnknown_08D004E0, 0, 32);
    (*(vu16 *)(0x4000000 + 0xa)) = (2) | ((5) << 8);
}
