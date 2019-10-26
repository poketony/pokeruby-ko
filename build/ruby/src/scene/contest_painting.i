# 1 "src/scene/contest_painting.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/scene/contest_painting.c"
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
# 2 "src/scene/contest_painting.c" 2
# 1 "include/contest_painting.h" 1
# 9 "include/contest_painting.h"
enum
{
    NORMAL_RANK,
    SUPER_RANK,
    HYPER_RANK,
    MASTER_RANK,
};

enum
{
    CONTEST_COOL,
    CONTEST_BEAUTY,
    CONTEST_CUTE,
    CONTEST_SMART,
    CONTEST_TOUGH,
};

enum
{
    CONTESTRESULT_COOL = 9,
    CONTESTRESULT_BEAUTY = 13,
    CONTESTRESULT_CUTE = 2,
    CONTESTRESULT_SMART = 36,
    CONTESTRESULT_TOUGH = 6,
};

struct Unk2015E00
{
    u16 unk2015e00[128][32];
    u16 unk2017e00[0];
};

struct ContestEntry
{
             u8 var0;
             u32 var4;
             u16 var8;
             u8 contestType;
             u8 pokemon_name[10];
             u8 pad15;
             u8 trainer_name[7];
};

struct LabelPair
{
    const u8 *prefix;
    const u8 *suffix;
};

void sub_8106630(u32);
void CB2_ContestPainting(void);
# 3 "src/scene/contest_painting.c" 2
# 1 "include/cute_sketch.h" 1



struct Unk03005E20
{
    u8 var_0;
    u8 pad1[3];
    u16 (*var_4)[][32];
    u16 (*var_8)[];
    u8 pad0C[4];
    u32 var_10;
    u16 var_14;
    u16 var_16;
    u8 var_18;
    u8 var_19;
    u8 var_1A;
    u8 var_1B;
    u8 var_1C;
    u8 var_1D;
    u8 var_1E;
    u8 var_1F;
};

void sub_80FC7A0(struct Unk03005E20 *);
void sub_80FD8CC(struct Unk03005E20 *);
void sub_80FDA18(struct Unk03005E20 *);
# 4 "src/scene/contest_painting.c" 2
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
# 5 "src/scene/contest_painting.c" 2
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
# 6 "src/scene/contest_painting.c" 2
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
# 7 "src/scene/contest_painting.c" 2
# 1 "include/menu.h" 1



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
# 5 "include/menu.h" 2
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
# 8 "src/scene/contest_painting.c" 2
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
# 9 "src/scene/contest_painting.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 10 "src/scene/contest_painting.c" 2
# 1 "include/sprite.h" 1
# 11 "src/scene/contest_painting.c" 2
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
# 12 "src/scene/contest_painting.c" 2
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
# 13 "src/scene/contest_painting.c" 2
# 1 "include/text.h" 1
# 14 "src/scene/contest_painting.c" 2
# 1 "include/unknown_task.h" 1



struct UnknownTaskStruct
{
    volatile void *dest;
    u32 control;
    u8 unk8;
    u8 unk9;
};

struct UnknownTaskStruct2
{
    void *src[2];
    volatile void *dest;
    u32 unkC;
    void (*unk10)(void);
    u8 srcBank;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 taskId;
    u8 filler19[0x7];
};

extern struct UnknownTaskStruct2 gUnknown_03004DC0;

extern u16 gUnknown_03004DE0[][0x3C0];

void remove_some_task(void);
void remove_some_task(void);
void dp12_8087EA4(void);
void dp12_8087EA4(void);


void sub_80895F8(struct UnknownTaskStruct unk);
void sub_8089668(void);
void sub_8089668();

u8 sub_8089944(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7);
# 15 "src/scene/contest_painting.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 16 "src/scene/contest_painting.c" 2

static u8 gUnknown_03000750;
static u16 gUnknown_03000752;
static u16 gUnknown_03000754;
static u8 gUnknown_03000756;

u16 (*gUnknown_03005E10)[][32];
struct Unk03005E20 gUnknown_03005E20;
u8 gUnknown_03005E40[0x4C];
struct ContestEntry *gUnknown_03005E8C;
u16 (*gUnknown_03005E90)[];

static const u16 gPictureFramePalettes[][16] =
{
    INCBIN_U16("graphics/picture_frame/bg0.gbapal"),
    INCBIN_U16("graphics/picture_frame/bg1.gbapal"),
    INCBIN_U16("graphics/picture_frame/bg2.gbapal"),
    INCBIN_U16("graphics/picture_frame/bg3.gbapal"),
    INCBIN_U16("graphics/picture_frame/bg4.gbapal"),
    INCBIN_U16("graphics/picture_frame/bg5.gbapal"),
    {0},
    {0},
};
const u8 emptySpace[8 * 32] = {0};
const u8 gPictureFrameTiles_0[] = INCBIN_U8("graphics/picture_frame/frame0.4bpp.rl");
const u8 gPictureFrameTiles_1[] = INCBIN_U8("graphics/picture_frame/frame1.4bpp.rl");
const u8 gPictureFrameTiles_2[] = INCBIN_U8("graphics/picture_frame/frame2.4bpp.rl");
const u8 gPictureFrameTiles_3[] = INCBIN_U8("graphics/picture_frame/frame3.4bpp.rl");
const u8 gPictureFrameTiles_4[] = INCBIN_U8("graphics/picture_frame/frame4.4bpp.rl");
const u8 gPictureFrameTiles_5[] = INCBIN_U8("graphics/picture_frame/frame5.4bpp.rl");
const u8 gPictureFrameTilemap_0[] = INCBIN_U8("graphics/picture_frame/frame0_map.bin.rl");
const u8 gPictureFrameTilemap_1[] = INCBIN_U8("graphics/picture_frame/frame1_map.bin.rl");
const u8 gPictureFrameTilemap_2[] = INCBIN_U8("graphics/picture_frame/frame2_map.bin.rl");
const u8 gPictureFrameTilemap_3[] = INCBIN_U8("graphics/picture_frame/frame3_map.bin.rl");
const u8 gPictureFrameTilemap_4[] = INCBIN_U8("graphics/picture_frame/frame4_map.bin.rl");
const u8 gPictureFrameTilemap_5[] = INCBIN_U8("graphics/picture_frame/frame5_map.bin.rl");
const u8 *const gUnknown_083F60AC[] =
{
    OtherText_Cool,
    OtherText_Beauty2,
    OtherText_Cute,
    OtherText_Smart,
    OtherText_Tough,
};
const struct LabelPair gUnknown_083F60C0[] =
{
    {OtherText_NonstopSuperCool, OtherText_Terminator6},
    {OtherText_GoodLookingPoke, OtherText_Terminator7},
    {OtherText_MarvelousGreat, OtherText_Terminator8},
    {OtherText_CenturyLastVenus, OtherText_Terminator9},
    {OtherText_Terminator10, OtherText_DazzlingSmile},
    {OtherText_PokeCenterIdol, OtherText_Terminator11},
    {OtherText_LovelyAndSweet, OtherText_Terminator12},
    {OtherText_ThePretty, OtherText_WinningPortrait},
    {OtherText_GiveUsWink, OtherText_Terminator13},
    {OtherText_SmartnessMaestro, OtherText_Terminator15},
    {OtherText_ChosenPokeAmong, OtherText_Terminator15},
    {OtherText_TheExcellent, OtherText_ItsMomentOfElegance},
    {OtherText_PowerfullyMuscular, OtherText_Terminator16},
    {OtherText_StrongErEst, OtherText_Terminator17},
    {OtherText_MightyTough, OtherText_Exclamation},
};
const struct OamData gOamData_83F6138 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 1,
    .bpp = 1,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
const u16 gUnknown_083F6140[] = {0, 0};

static void ShowContestPainting();
static void CB2_HoldContestPainting(void);
static void HoldContestPainting(void);
static void ContestPaintingInitWindow(u8 arg0);
static void ContestPaintingPrintCaption(u8 arg0, u8 arg1);
static void ContestPaintingInitBG(void);
static void ContestPaintingInitVars(u8 arg0);
static void VBlankCB_ContestPainting(void);
void sub_8106B90();
static void sub_8107090(u8 arg0, u8 arg1);

__attribute__((naked))
void sub_8106630(u32 arg0)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    ldr r2, _0810665C @ =gSharedMem + 0x15DE0\n    subs r4, r2, 0x2\n    subs r5, r2, 0x1\n    ldr r3, _08106660 @ =gSaveBlock1\n    subs r0, 0x1\n    lsls r1, r0, 5\n    adds r1, r3\n    ldr r3, _08106664 @ =0x00002dfc\n    adds r1, r3\n    ldm r1!, {r3,r6,r7}\n    stm r2!, {r3,r6,r7}\n    ldm r1!, {r3,r6,r7}\n    stm r2!, {r3,r6,r7}\n    ldm r1!, {r6,r7}\n    stm r2!, {r6,r7}\n    strb r0, [r4]\n    movs r0, 0\n    strb r0, [r5]\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0810665C: .4byte gSharedMem + 0x15DE0\n_08106660: .4byte gSaveBlock1\n_08106664: .4byte 0x00002dfc\n    .syntax divided\n");
# 138 "src/scene/contest_painting.c"
}

void CB2_ContestPainting(void)
{
    ShowContestPainting();
}

static void ShowContestPainting(void)
{
    switch (gMain.state)
    {
    case 0:
        remove_some_task();
        SetVBlankCallback(((void *)0));
        gUnknown_03005E8C = &((*(struct ContestEntry*)(gSharedMem + 0x15DE0)));
        ContestPaintingInitVars(1);
        ContestPaintingInitBG();
        gMain.state++;
        break;
    case 1:
    {
        u8 *addr;
        size_t size;

        ResetPaletteFade();
        addr = (void *)0x6000000;
        size = 0x18000;
        while (1)
        {
            { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x1000)/(32/8))); dmaRegs[2]; }; };
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((size)/(32/8))); dmaRegs[2]; }; };
                break;
            }
        }
        ResetSpriteData();
        gMain.state++;
        break;
    }
    case 2:
        SeedRng(gMain.vblankCounter1);
        InitKeys();
        ContestPaintingInitWindow((gSharedMem[0x15DDF]));
        gMain.state++;
        break;
    case 3:
        sub_8107090((gSharedMem[0x15DDE]), (gSharedMem[0x15DDF]));
        gMain.state++;
        break;
    case 4:
        ContestPaintingPrintCaption((gSharedMem[0x15DDE]), (gSharedMem[0x15DDF]));
        LoadPalette(gUnknown_083F6140, 0, 1 * 2);
        { vu32 *_dest = (vu32 *)(0x5000000); u32 _size = 0x400; { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((_size)/(32/8))); dmaRegs[2]; }; }; };
        BeginFastPaletteFade(2);
        SetVBlankCallback(VBlankCB_ContestPainting);
        gUnknown_03000750 = 0;
        (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0100 | 0x0200 | 0x1000;
        SetMainCallback2(CB2_HoldContestPainting);
        break;
    }
}

static void CB2_HoldContestPainting(void)
{
    HoldContestPainting();
    UpdatePaletteFade();
}

static void CB2_QuitContestPainting(void)
{
    SetMainCallback2(gMain.savedCallback);
}

static void HoldContestPainting(void)
{
    switch (gUnknown_03000750)
    {
    case 0:
        if (!gPaletteFade.active)
            gUnknown_03000750 = 1;
        if (gUnknown_03000756 != 0 && gUnknown_03000754 != 0)
            gUnknown_03000754--;
        break;
    case 1:
        if ((gMain.newKeys & 1) || (gMain.newKeys & 2))
        {
            u8 two = 2;

            gUnknown_03000750 = two;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        }
        if (gUnknown_03000756 != 0)
            gUnknown_03000754 = 0;
        break;
    case 2:
        if (!gPaletteFade.active)
            SetMainCallback2(CB2_QuitContestPainting);
        if (gUnknown_03000756 != 0 && gUnknown_03000754 <= 0x1D)
            gUnknown_03000754++;
        break;
    }
}

static void ContestPaintingInitWindow(u8 arg0)
{
    InitMenuWindow(&gWindowConfig_81E7160);
    SetUpWindowConfig(&gWindowConfig_81E7160);
}

static void ContestPaintingPrintCaption(u8 contestType, u8 arg1)
{
    u8 xPos, yPos;
    u8 *ptr;
    u8 type;

    if (arg1 == 1)
        return;
    ptr = gUnknown_03005E40;
    type = gUnknown_03005E8C->contestType;
    if (contestType < 8)
    {
        ptr = StringCopy(ptr, gUnknown_083F60AC[type]);
        ptr = StringCopy(ptr, gContestText_ContestWinner);
        ptr = StringCopy(ptr, gUnknown_03005E8C->trainer_name);


        ptr[0] = 0xFC;
        ptr[1] = 0x16;
        ptr += 2;

        ptr = StringCopy(ptr, gOtherText_Unknown1);
        ptr = StringCopy10(ptr, gUnknown_03005E8C->pokemon_name);

        xPos = 6;
        yPos = 14;
    }
    else
    {
        ptr = StringCopy(ptr, gUnknown_083F60C0[type].prefix);
        ptr = StringCopy10(ptr, gUnknown_03005E8C->pokemon_name);
        ptr = StringCopy(ptr, gUnknown_083F60C0[type].suffix);

        xPos = 3;
        yPos = 14;
    }
    MenuPrint_PixelCoords(gUnknown_03005E40, xPos * 8 + 1, yPos * 8, 1);
}

static void ContestPaintingInitBG(void)
{
    (*(vu16 *)(0x4000000 + 0x0)) = 0;
    (*(vu16 *)(0x4000000 + 0x200)) |= (1 << 0);
    (*(vu16 *)(0x4000000 + 0x8)) = (2) | ((0) << 2) | ((12) << 8) | 0x0040 | 0x0000 | 0x0000;
    (*(vu16 *)(0x4000000 + 0xa)) = (1) | ((1) << 2) | ((10) << 8) | 0x0040 | 0x0000 | 0x0000;
    (*(vu16 *)(0x4000000 + 0x50)) = 0;
    (*(vu16 *)(0x4000000 + 0x52)) = 0;
    (*(vu16 *)(0x4000000 + 0x54)) = 0;
}

static void ContestPaintingInitVars(bool8 arg0)
{
    if (arg0 == 0)
    {
        gUnknown_03000756 = 0;
        gUnknown_03000752 = 0;
        gUnknown_03000754 = 0;
    }
    else
    {
        gUnknown_03000756 = 1;
        gUnknown_03000752 = 15;
        gUnknown_03000754 = 30;
    }
}

static void ContestPaintingMosaic(void)
{
    if (gUnknown_03000756 == 0)
    {
        (*(vu16 *)(0x4000000 + 0x4c)) = 0;
        return;
    }

    (*(vu16 *)(0x4000000 + 0xa)) = (1) | ((1) << 2) | ((10) << 8) | 0x0040 | 0x0000 | 0x0000;
    gUnknown_03000752 = gUnknown_03000754 / 2;

    (*(vu16 *)(0x4000000 + 0x4c)) = (gUnknown_03000752 << 12) | (gUnknown_03000752 << 8) | (gUnknown_03000752 << 4) | (gUnknown_03000752 << 0);
}

static void VBlankCB_ContestPainting(void)
{
    ContestPaintingMosaic();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}
# 375 "src/scene/contest_painting.c"
__attribute__((naked))
static void sub_8106AC4(u16 arg0, u8 arg2)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r8\n    push {r7}\n    sub sp, 0xC\n    adds r4, r1, 0\n    lsls r0, 16\n    lsrs r6, r0, 16\n    lsls r4, 24\n    lsrs r4, 24\n    ldr r7, _08106B28 @ =gUnknown_03005E8C\n    ldr r0, [r7]\n    ldr r1, [r0, 0x4]\n    ldr r2, [r0]\n    adds r0, r6, 0\n    bl GetMonSpritePalFromOtIdPersonality\n    ldr r1, _08106B2C @ =gUnknown_03005E90\n    mov r8, r1\n    ldr r1, [r1]\n    bl LZDecompressVram\n    cmp r4, 0\n    bne _08106B40\n    lsls r0, r6, 3\n    ldr r1, _08106B30 @ =gMonFrontPicTable\n    adds r0, r1\n    ldr r1, _08106B34 @ =gMonFrontPicCoords\n    lsls r2, r6, 2\n    adds r2, r1\n    ldrb r1, [r2]\n    ldrb r2, [r2, 0x1]\n    movs r3, 0x80\n    lsls r3, 18\n    ldr r4, _08106B38 @ =gUnknown_081FAF4C\n    ldr r5, [r4, 0x4]\n    str r5, [sp]\n    str r6, [sp, 0x4]\n    ldr r4, [r7]\n    ldr r4, [r4]\n    str r4, [sp, 0x8]\n    bl HandleLoadSpecialPokePic\n    mov r2, r8\n    ldr r1, [r2]\n    ldr r0, _08106B3C @ =gUnknown_03005E10\n    ldr r2, [r0]\n    adds r0, r5, 0\n    bl sub_8106B90\n    b _08106B74\n    .align 2, 0\n_08106B28: .4byte gUnknown_03005E8C\n_08106B2C: .4byte gUnknown_03005E90\n_08106B30: .4byte gMonFrontPicTable\n_08106B34: .4byte gMonFrontPicCoords\n_08106B38: .4byte gUnknown_081FAF4C\n_08106B3C: .4byte gUnknown_03005E10\n_08106B40:\n    lsls r0, r6, 3\n    ldr r1, _08106B80 @ =gMonBackPicTable\n    adds r0, r1\n    ldr r1, _08106B84 @ =gMonBackPicCoords\n    lsls r2, r6, 2\n    adds r2, r1\n    ldrb r1, [r2]\n    ldrb r2, [r2, 0x1]\n    movs r3, 0x80\n    lsls r3, 18\n    ldr r4, _08106B88 @ =gUnknown_081FAF4C\n    ldr r5, [r4]\n    str r5, [sp]\n    str r6, [sp, 0x4]\n    ldr r4, [r7]\n    ldr r4, [r4]\n    str r4, [sp, 0x8]\n    bl HandleLoadSpecialPokePic\n    mov r0, r8\n    ldr r1, [r0]\n    ldr r0, _08106B8C @ =gUnknown_03005E10\n    ldr r2, [r0]\n    adds r0, r5, 0\n    bl sub_8106B90\n_08106B74:\n    add sp, 0xC\n    pop {r3}\n    mov r8, r3\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08106B80: .4byte gMonBackPicTable\n_08106B84: .4byte gMonBackPicCoords\n_08106B88: .4byte gUnknown_081FAF4C\n_08106B8C: .4byte gUnknown_03005E10\n    .syntax divided\n");
# 470 "src/scene/contest_painting.c"
}
# 508 "src/scene/contest_painting.c"
__attribute__((naked))
void sub_8106B90()
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0xC\n    mov r10, r0\n    mov r9, r1\n    str r2, [sp]\n    movs r0, 0\n_08106BA4:\n    movs r3, 0\n    adds r1, r0, 0x1\n    str r1, [sp, 0x4]\n    lsls r0, 3\n    str r0, [sp, 0x8]\n_08106BAE:\n    movs r1, 0\n    adds r2, r3, 0x1\n    mov r8, r2\n    ldr r7, [sp, 0x8]\n    adds r0, r7, r3\n    lsls r0, 5\n    mov r12, r0\n    lsls r4, r3, 3\n_08106BBE:\n    movs r3, 0\n    lsls r0, r1, 2\n    adds r6, r1, 0x1\n    mov r2, r12\n    adds r5, r2, r0\n    ldr r7, [sp, 0x8]\n    adds r0, r7, r1\n    lsls r0, 7\n    ldr r1, [sp]\n    adds r2, r0, r1\n_08106BD2:\n    lsrs r0, r3, 1\n    adds r0, r5, r0\n    add r0, r10\n    ldrb r1, [r0]\n    movs r0, 0x1\n    ands r0, r3\n    cmp r0, 0\n    beq _08106BE6\n    lsrs r1, 4\n    b _08106BEA\n_08106BE6:\n    movs r0, 0xF\n    ands r1, r0\n_08106BEA:\n    cmp r1, 0\n    bne _08106BFC\n    adds r0, r4, r3\n    lsls r0, 1\n    adds r0, r2\n    movs r7, 0x80\n    lsls r7, 8\n    adds r1, r7, 0\n    b _08106C08\n_08106BFC:\n    adds r0, r4, r3\n    lsls r0, 1\n    adds r0, r2\n    lsls r1, 1\n    add r1, r9\n    ldrh r1, [r1]\n_08106C08:\n    strh r1, [r0]\n    adds r0, r3, 0x1\n    lsls r0, 16\n    lsrs r3, r0, 16\n    cmp r3, 0x7\n    bls _08106BD2\n    lsls r0, r6, 16\n    lsrs r1, r0, 16\n    cmp r1, 0x7\n    bls _08106BBE\n    mov r1, r8\n    lsls r0, r1, 16\n    lsrs r3, r0, 16\n    cmp r3, 0x7\n    bls _08106BAE\n    ldr r2, [sp, 0x4]\n    lsls r0, r2, 16\n    lsrs r0, 16\n    cmp r0, 0x7\n    bls _08106BA4\n    add sp, 0xC\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .syntax divided\n");
# 609 "src/scene/contest_painting.c"
}


static void sub_8106C40(u8 arg0, u8 arg1)
{
    u8 x, y;

    LoadPalette(gPictureFramePalettes, 0, sizeof(gPictureFramePalettes));
    if (arg1 == 1)
    {
        switch (gUnknown_03005E8C->contestType / 3)
        {
        case CONTEST_COOL:
            RLUnCompVram(gPictureFrameTiles_0, (void *)0x6000000);
            RLUnCompWram(gPictureFrameTilemap_0, gUnknown_03005E10);
            break;
        case CONTEST_BEAUTY:
            RLUnCompVram(gPictureFrameTiles_1, (void *)0x6000000);
            RLUnCompWram(gPictureFrameTilemap_1, gUnknown_03005E10);
            break;
        case CONTEST_CUTE:
            RLUnCompVram(gPictureFrameTiles_2, (void *)0x6000000);
            RLUnCompWram(gPictureFrameTilemap_2, gUnknown_03005E10);
            break;
        case CONTEST_SMART:
            RLUnCompVram(gPictureFrameTiles_3, (void *)0x6000000);
            RLUnCompWram(gPictureFrameTilemap_3, gUnknown_03005E10);
            break;
        case CONTEST_TOUGH:
            RLUnCompVram(gPictureFrameTiles_4, (void *)0x6000000);
            RLUnCompWram(gPictureFrameTilemap_4, gUnknown_03005E10);
            break;
        }




        for (y = 0; y < 20; y++)
        {
            for (x = 0; x < 32; x++)
                (((u16 *)(0x6000000 + 0x6000))[(y) * 32 + (x)]) = 0x1015;
        }


        for (y = 0; y < 10; y++)
        {
            for (x = 0; x < 18; x++)
                (((u16 *)(0x6000000 + 0x6000))[(y + 2) * 32 + (x + 6)]) = (*gUnknown_03005E10)[y + 2][x + 6];
        }


        for (x = 0; x < 16; x++)
            (((u16 *)(0x6000000 + 0x6000))[(2) * 32 + (x + 7)]) = (*gUnknown_03005E10)[2][7];


    }
    else if (arg0 < 8)
    {
        RLUnCompVram(gPictureFrameTiles_5, (void *)0x6000000);
        RLUnCompVram(gPictureFrameTilemap_5, (void *)(0x6000000 + 0x6000));
    }
    else
    {
        switch (gUnknown_03005E8C->contestType / 3)
        {
        case CONTEST_COOL:
            RLUnCompVram(gPictureFrameTiles_0, (void *)0x6000000);
            RLUnCompVram(gPictureFrameTilemap_0, (void *)(0x6000000 + 0x6000));
            break;
        case CONTEST_BEAUTY:
            RLUnCompVram(gPictureFrameTiles_1, (void *)0x6000000);
            RLUnCompVram(gPictureFrameTilemap_1, (void *)(0x6000000 + 0x6000));
            break;
        case CONTEST_CUTE:
            RLUnCompVram(gPictureFrameTiles_2, (void *)0x6000000);
            RLUnCompVram(gPictureFrameTilemap_2, (void *)(0x6000000 + 0x6000));
            break;
        case CONTEST_SMART:
            RLUnCompVram(gPictureFrameTiles_3, (void *)0x6000000);
            RLUnCompVram(gPictureFrameTilemap_3, (void *)(0x6000000 + 0x6000));
            break;
        case CONTEST_TOUGH:
            RLUnCompVram(gPictureFrameTiles_4, (void *)0x6000000);
            RLUnCompVram(gPictureFrameTilemap_4, (void *)(0x6000000 + 0x6000));
            break;
        }
    }
}

static void sub_8106E98(u8 arg0)
{


    asm(""::"r"(arg0));


    gMain.oamBuffer[0] = gOamData_83F6138;
    gMain.oamBuffer[0].tileNum = 0;


    if (arg0) arg0 = gMain.oamBuffer[0].tileNum;


    gMain.oamBuffer[0].x = 88;
    gMain.oamBuffer[0].y = 24;
}

static u8 sub_8106EE0(u8 arg0)
{
    u8 contestType;

    if (arg0 < 8)
        contestType = gUnknown_03005E8C->contestType;
    else
        contestType = gUnknown_03005E8C->contestType / 3;

    switch (contestType)
    {
    case CONTEST_COOL:
        return CONTESTRESULT_COOL;
    case CONTEST_BEAUTY:
        return CONTESTRESULT_BEAUTY;
    case CONTEST_CUTE:
        return CONTESTRESULT_CUTE;
    case CONTEST_SMART:
        return CONTESTRESULT_SMART;
    case CONTEST_TOUGH:
        return CONTESTRESULT_TOUGH;
    }

    return contestType;
}

static void sub_8106F4C(void)
{
    gUnknown_03005E90 = &((*(struct Unk2015E00*)(gSharedMem + 0x15E00))).unk2017e00;
    gUnknown_03005E10 = &((*(struct Unk2015E00*)(gSharedMem + 0x15E00))).unk2015e00;
}

static void sub_8106F6C(u8 arg0)
{
    gUnknown_03005E20.var_4 = gUnknown_03005E10;
    gUnknown_03005E20.var_8 = gUnknown_03005E90;
    gUnknown_03005E20.var_18 = 0;
    gUnknown_03005E20.var_1F = gUnknown_03005E8C->var0;
    gUnknown_03005E20.var_19 = 0;
    gUnknown_03005E20.var_1A = 0;
    gUnknown_03005E20.var_1B = 64;
    gUnknown_03005E20.var_1C = 64;
    gUnknown_03005E20.var_1D = 64;
    gUnknown_03005E20.var_1E = 64;

    switch (arg0)
    {
    case CONTESTRESULT_SMART:
    case CONTESTRESULT_TOUGH:
        gUnknown_03005E20.var_14 = 3;
        break;
    case CONTESTRESULT_COOL:
    case CONTESTRESULT_BEAUTY:
    case CONTESTRESULT_CUTE:
    default:
        gUnknown_03005E20.var_14 = 1;
        break;
    }

    gUnknown_03005E20.var_16 = 2;
    gUnknown_03005E20.var_0 = arg0;
    gUnknown_03005E20.var_10 = 0x6010000;

    sub_80FC7A0(&gUnknown_03005E20);
    sub_80FDA18(&gUnknown_03005E20);
    sub_80FD8CC(&gUnknown_03005E20);

    LoadPalette(gUnknown_03005E90, 256, 256 * 2);
}

static void sub_8107090(u8 arg0, u8 arg1)
{
    sub_8106F4C();
    sub_8106AC4(gUnknown_03005E8C->var8, 0);
    sub_8106F6C(sub_8106EE0(arg0));
    sub_8106E98(arg0);
    sub_8106C40(arg0, arg1);
}
