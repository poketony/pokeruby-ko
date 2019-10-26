# 1 "src/scene/intro.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/scene/intro.c"
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
# 2 "src/scene/intro.c" 2
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
# 3 "src/scene/intro.c" 2
# 1 "include/intro.h" 1



void CB2_InitCopyrightScreenAfterBootup(void);
void CB2_InitCopyrightScreenAfterTitleScreen(void);
void sub_813CE30(u16, u16, u16, u16);
# 4 "src/scene/intro.c" 2
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
# 5 "src/scene/intro.c" 2
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
# 6 "src/scene/intro.c" 2
# 1 "include/hall_of_fame.h" 1



void sub_8141F90(void);
void sub_8143648(u16 paletteTag, u8 arg1);
void sub_81428CC(void);
void sub_8143680(int, u8);
# 7 "src/scene/intro.c" 2
# 1 "include/intro_credits_graphics.h" 1



extern const struct CompressedSpriteSheet gIntro2BrendanSpriteSheet;
extern const struct CompressedSpriteSheet gIntro2MaySpriteSheet;
extern const struct CompressedSpriteSheet gIntro2BicycleSpriteSheet;
extern const struct CompressedSpriteSheet gIntro2LatiosSpriteSheet;
extern const struct CompressedSpriteSheet gIntro2LatiasSpriteSheet;
extern const struct SpritePalette gIntro2SpritePalettes[];
extern const struct CompressedSpriteSheet gUnknown_08416E24;
extern const struct CompressedSpriteSheet gUnknown_08416E34;

void load_intro_part2_graphics(u8 a);
void sub_8148C78(u8 a);
void sub_8148CB0(u8);
void sub_8148E90(u8);
u8 sub_8148EC0(u8 a, u16 b, u16 c, u16 d);
void sub_8148F3C(u8);
void sub_8149020(u8);
u8 intro_create_brendan_sprite(s16 a, s16 b);
u8 intro_create_may_sprite(s16 a, s16 b);
u8 intro_create_latios_sprite(s16 a, s16 b);
u8 intro_create_latias_sprite(s16 a, s16 b);
# 8 "src/scene/intro.c" 2
# 1 "include/libgncmultiboot.h" 1



struct GcmbStruct
{
    u16 gcmb_field_0;
    u8 gcmb_field_2;
    u8 filler3[0x2C - 0x3];
};

void GameCubeMultiBoot_Main(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_ExecuteProgram(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_Init(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_HandleSerialInterrupt(struct GcmbStruct *pStruct);
void GameCubeMultiBoot_Quit(void);
# 9 "src/scene/intro.c" 2
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
# 10 "src/scene/intro.c" 2
# 1 "include/m4a.h" 1



# 1 "include/gba/m4a_internal.h" 1
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
# 11 "src/scene/intro.c" 2
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
# 12 "src/scene/intro.c" 2
# 1 "include/new_game.h" 1



void write_word_to_mem(u32 var, u8 *dataPtr);
void copy_word_to_mem(u8 *copyTo, u8 *copyFrom);
void InitPlayerTrainerId(void);
void SetDefaultOptions(void);
void ClearPokedexFlags(void);
void sub_8052DA8(void);
void sub_8052DE4(void);
void WarpToTruck(void);
void ClearSav2(void);
void sub_8052E4C(void);
void NewGameInitData(void);
# 13 "src/scene/intro.c" 2
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
# 14 "src/scene/intro.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 15 "src/scene/intro.c" 2
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
# 16 "src/scene/intro.c" 2
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
# 17 "src/scene/intro.c" 2
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
# 18 "src/scene/intro.c" 2
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
# 19 "src/scene/intro.c" 2
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
# 20 "src/scene/intro.c" 2
# 1 "include/title_screen.h" 1





extern const u16 gUnknown_08393E64[];

void SpriteCallback_VersionBannerLeft(struct Sprite *sprite);
void SpriteCallback_VersionBannerRight(struct Sprite *sprite);
void SpriteCallback_PressStartCopyrightBanner(struct Sprite *sprite);
void SpriteCallback_PokemonLogoShine(struct Sprite *sprite);

void CB2_InitTitleScreen(void);
# 21 "src/scene/intro.c" 2
# 1 "include/trig.h" 1



extern const s16 gSineTable[];

s16 Sin(s16 index, s16 amplitude);
s16 Cos(s16 index, s16 amplitude);
s16 Sin2(u16 angle);
s16 Cos2(u16 angle);
# 22 "src/scene/intro.c" 2
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
# 23 "src/scene/intro.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 24 "src/scene/intro.c" 2

extern struct SpriteTemplate gUnknown_02024E8C;
extern u16 gUnknown_02039358;
extern u16 gUnknown_0203935A;
extern u16 gSaveFileStatus;
extern u8 gReservedSpritePaletteCount;
extern const u8 gInterfaceGfx_PokeBall[];
extern const u8 gInterfacePal_PokeBall[];
extern const u8 gIntroCopyright_Gfx[];
extern const u16 gIntroCopyright_Pal[];
extern const u16 gIntroCopyright_Tilemap[];
extern void *const gUnknown_0840B5A0[];

static __attribute__((section("ewram_data"))) u16 gUnknown_02039318 = 0;
static __attribute__((section("ewram_data"))) u16 gUnknown_0203931A = 0;

u32 gIntroFrameCounter;
struct GcmbStruct gMultibootProgramStruct;





static const u16 Palette_406340[] = INCBIN_U16("graphics/intro/unknown1.gbapal");
static const u16 Palette_406360[] = INCBIN_U16("graphics/intro/unknown2.gbapal");
static const u8 gIntroTiles[] = INCBIN_U8("graphics/intro/intro.4bpp.lz");

static const u16 gIntro1BGPals[][16] =
{
    INCBIN_U16("graphics/intro/intro1_bgpal1.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal2.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal3.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal4.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal5.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal6.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal7.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal8.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal9.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal10.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal11.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal12.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal13.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal14.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal15.gbapal"),
    INCBIN_U16("graphics/intro/intro1_bgpal16.gbapal"),
};
static const u8 gIntro1BG0_Tilemap[] = INCBIN_U8("graphics/intro/intro1_bg0_map.bin.lz");
static const u8 gIntro1BG1_Tilemap[] = INCBIN_U8("graphics/intro/intro1_bg1_map.bin.lz");
static const u8 gIntro1BG2_Tilemap[] = INCBIN_U8("graphics/intro/intro1_bg2_map.bin.lz");
static const u8 gIntro1BG3_Tilemap[] = INCBIN_U8("graphics/intro/intro1_bg3_map.bin.lz");
static const u8 gIntro1BGLeavesGfx[] = INCBIN_U8("graphics/intro/introgfx.4bpp.lz");
static const u16 gIntro3PokeballPal[] = INCBIN_U16("graphics/intro/intro3_pokeball.gbapal");
static const u8 gIntro3Pokeball_Tilemap[] = INCBIN_U8("graphics/intro/intro3_pokeball_map.bin.lz");
static const u8 gIntro3Pokeball_Gfx[] = INCBIN_U8("graphics/intro/intro3_pokeball.8bpp.lz");
static const u16 gIntro3Streaks_Pal[] = INCBIN_U16("graphics/intro/intro3_streaks.gbapal");
static const u8 gIntro3Streaks_Gfx[] = INCBIN_U8("graphics/intro/intro3_streaks.4bpp.lz");
static const u8 gIntro3Streaks_Tilemap[] = INCBIN_U8("graphics/intro/intro3_streaks_map.bin.lz");
static const u16 gIntro3Misc1Palette[] = INCBIN_U16("graphics/intro/intro3_misc1.gbapal");
static const u16 gIntro3Misc2Palette[] = INCBIN_U16("graphics/intro/intro3_misc2.gbapal");
static const u8 gIntro3MiscTiles[] = INCBIN_U8("graphics/intro/intro3_misc.4bpp.lz");
static const u16 gIntro1EonPalette[] = INCBIN_U16("graphics/intro/intro1_eon.gbapal");
static const u8 gIntro1EonTiles[] = INCBIN_U8("graphics/intro/intro1_eon.4bpp.lz");
static const struct OamData gOamData_840ADE8 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840ADF0[] =
{
    {.frame = {16, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840ADF8[] =
{
    {.frame = {24, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AE00[] =
{
    {.frame = {0, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AE08[] =
{
    {.frame = {48, 8}},
    {.type = -1},
};
static const union AnimCmd *const gSpriteAnimTable_840AE10[] =
{
    gSpriteAnim_840ADF0,
    gSpriteAnim_840ADF8,
    gSpriteAnim_840AE00,
    gSpriteAnim_840AE08,
};
static void sub_813D208(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840AE20 =
{
    .tileTag = 2000,
    .paletteTag = 2000,
    .oam = &gOamData_840ADE8,
    .anims = gSpriteAnimTable_840AE10,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813D208,
};
static const union AnimCmd Unknown_40AE38[] =
{
    {.frame = {0, 4}},
    {.frame = {64, 4}},
    {.frame = {128, 4}},
    {.frame = {192, 4}},
    {.jump = {.type = -2, .target = 0}},
};
static const union AnimCmd Unknown_40AE4C[] =
{
    {.frame = {0, 8}},
    {.frame = {64, 8}},
    {.frame = {128, 8}},
    {.frame = {192, 8}},
    {.jump = {.type = -2, .target = 0}},
};
static const union AnimCmd Unknown_40AE60[] =
{
    {.frame = {256, 4}},
    {.frame = {0x140, 4}},
    {.frame = {0x180, 4}},
    {.type = -1},
};
static const union AnimCmd Unknown_40AE70[] =
{
    {.frame = {0x180, 16}},
    {.frame = {0x140, 16}},
    {.frame = {256, 16}},
    {.type = -1},
};
static const union AnimCmd *const gUnknown_0840AE80[] =
{
    Unknown_40AE38,
    Unknown_40AE4C,
    Unknown_40AE60,
    Unknown_40AE70,
};
static const struct OamData gOamData_840AE90 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_840AE98 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_840AEA0 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 2,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840AEA8[] =
{
    {.frame = {80, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AEB0[] =
{
    {.frame = {84, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AEB8[] =
{
    {.frame = {88, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AEC0[] =
{
    {.frame = {92, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AEC8[] =
{
    {.frame = {96, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AED0[] =
{
    {.frame = {100, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AED8[] =
{
    {.frame = {104, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AEE0[] =
{
    {.frame = {112, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AEE8[] =
{
    {.frame = {113, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AEF0[] =
{
    {.frame = {114, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AEF8[] =
{
    {.frame = {115, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AF00[] =
{
    {.frame = {116, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AF08[] =
{
    {.frame = {117, 8}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_840AF10[] =
{
    {.frame = {128, 8}},
    {.type = -1},
};
static const union AnimCmd *const gSpriteAnimTable_840AF18[] =
{
    gSpriteAnim_840AEA8,
    gSpriteAnim_840AEB0,
    gSpriteAnim_840AEB8,
    gSpriteAnim_840AEC0,
    gSpriteAnim_840AEC8,
    gSpriteAnim_840AED0,
    gSpriteAnim_840AED8,
};
static const union AnimCmd *const gSpriteAnimTable_840AF34[] =
{
    gSpriteAnim_840AEE0,
    gSpriteAnim_840AEE8,
    gSpriteAnim_840AEF0,
    gSpriteAnim_840AEF8,
    gSpriteAnim_840AF00,
    gSpriteAnim_840AF08,
};
static const union AnimCmd *const gSpriteAnimTable_840AF4C[] =
{
    gSpriteAnim_840AF10,
};
static const s16 gUnknown_0840AF50[][2] =
{
    {0, -72},
    {1, -56},
    {2, -40},
    {3, -24},
    {4, 8},
    {5, 24},
    {3, 40},
    {1, 56},
    {6, 72},
};
static const s16 gUnknown_0840AF74[][2] =
{
    {0, -28},
    {1, -20},
    {2, -12},
    {3, -4},
    {2, 4},
    {4, 12},
    {5, 20},
    {3, 28},
};
static void sub_813D908(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840AF94 =
{
    .tileTag = 2000,
    .paletteTag = 2001,
    .oam = &gOamData_840AE90,
    .anims = gSpriteAnimTable_840AF18,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813D908,
};
static const struct SpriteTemplate gSpriteTemplate_840AFAC =
{
    .tileTag = 2000,
    .paletteTag = 2001,
    .oam = &gOamData_840AE98,
    .anims = gSpriteAnimTable_840AF34,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813D908,
};
static const struct SpriteTemplate gSpriteTemplate_840AFC4 =
{
    .tileTag = 2000,
    .paletteTag = 2001,
    .oam = &gOamData_840AEA0,
    .anims = gSpriteAnimTable_840AF4C,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813D908,
};
static const struct OamData gOamData_840AFDC =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840AFE4[] =
{
    {.frame = {0, 10}},
    {.jump = {.type = -2, .target = 0}},
};
static const union AnimCmd *const gSpriteAnimTable_840AFEC[] =
{
    gSpriteAnim_840AFE4,
};
static void sub_813DA64(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840AFF0 =
{
    .tileTag = 2002,
    .paletteTag = 2002,
    .oam = &gOamData_840AFDC,
    .anims = gSpriteAnimTable_840AFEC,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813DA64,
};
const struct CompressedSpriteSheet gUnknown_0840B008[] =
{
    {gIntroTiles, 0x1400, 2000},
    {((void *)0)},
};
const struct CompressedSpriteSheet gUnknown_0840B018[] =
{
    {gIntro1EonTiles, 0x400, 2002},
    {((void *)0)},
};
const struct SpritePalette gUnknown_0840B028[] =
{
    {Palette_406340, 2000},
    {Palette_406360, 2001},
    {gIntro1EonPalette, 2002},
    {((void *)0)},
};
static const union AnimCmd gUnknown_0840B048[] =
{
    {.frame = {3, 0}},
    {.type = -1},
};
static const union AnimCmd gUnknown_0840B050[] =
{
    {.frame = {0, 8}},
    {.type = -1},
};
static const union AnimCmd gUnknown_0840B058[] =
{
    {.frame = {1, 8}},
    {.frame = {2, 8}},
    {.type = -1},
};
static const union AnimCmd *const gUnknown_0840B064[] =
{
    gUnknown_0840B048,
    gUnknown_0840B050,
    gUnknown_0840B058,
};
static const struct OamData gOamData_840B070 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840B078[] =
{
    {.frame = {0, 8}},
    {.type = -1},
};
static const union AnimCmd *const gSpriteAnimTable_840B080[] =
{
    gSpriteAnim_840B078,
};
static void sub_813E30C(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B084 =
{
    .tileTag = 2002,
    .paletteTag = 2002,
    .oam = &gOamData_840B070,
    .anims = gSpriteAnimTable_840B080,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E30C,
};
static const struct OamData gOamData_840B09C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840B0A4[] =
{
    {.frame = {1, 8}},
    {.type = -1},
};
static const union AnimCmd *const gSpriteAnimTable_840B0AC[] =
{
    gSpriteAnim_840B0A4,
};
static void sub_813E4B8(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B0B0 =
{
    .tileTag = 2003,
    .paletteTag = 2003,
    .oam = &gOamData_840B09C,
    .anims = gSpriteAnimTable_840B0AC,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E4B8,
};
static const struct OamData gOamData_840B0C8 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840B0D0[] =
{
    {.frame = {14, 8}},
    {.type = -1},
};
static const union AnimCmd *const gSpriteAnimTable_840B0D8[] =
{
    gSpriteAnim_840B0D0,
};
static void sub_813E5E0(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B0DC =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B0C8,
    .anims = gSpriteAnimTable_840B0D8,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E5E0,
};
static void sub_813E6C0(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B0F4 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B0C8,
    .anims = gSpriteAnimTable_840B0D8,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E6C0,
};
static const struct OamData gOamData_840B10C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840B114[] =
{
    {.frame = {6, 8}},
    {.frame = {6, 8, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}},
};
static const union AnimCmd *const gSpriteAnimTable_840B120[] =
{
    gSpriteAnim_840B114,
};
static void sub_813E804(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B124 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B10C,
    .anims = gSpriteAnimTable_840B120,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E804,
};
static const struct OamData gOamData_840B13C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840B144[] =
{
    {.frame = {10, 8}},
    {.type = -1},
};
static const union AnimCmd *const gSpriteAnimTable_840B14C[] =
{
    gSpriteAnim_840B144,
};
static void sub_813E980(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B150 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B13C,
    .anims = gSpriteAnimTable_840B14C,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813E980,
};
static const u8 gUnknown_0840B168[] = {0xE6, 0xEB, 0xE4, 0xEA, 0xE5, 0xE9, 0xE7, 0xE8};
static void sub_813EA60(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B170 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B13C,
    .anims = gSpriteAnimTable_840B14C,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813EA60,
};
static const u16 gUnknown_0840B188[] = {0x200, 0x1C0, 0x180, 0x140, 0x100, 0xE0, 0xC0, 0xA0, 0x80, 0x80};
static const struct OamData gOamData_840B19C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840B1A4[] =
{
    {.frame = {2, 8}},
    {.type = -1},
};
static const union AnimCmd *const gSpriteAnimTable_840B1AC[] =
{
    gSpriteAnim_840B1A4,
};
static void sub_813EBBC(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B1B0 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B19C,
    .anims = gSpriteAnimTable_840B1AC,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813EBBC,
};
static void sub_813EC90(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B1C8 =
{
    .tileTag = 2003,
    .paletteTag = 2004,
    .oam = &gOamData_840B19C,
    .anims = gSpriteAnimTable_840B1AC,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813EC90,
};
static const struct OamData gOamData_840B1E0 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_840B1E8[] =
{
    {.frame = {16, 8}},
    {.type = -1},
};
static const union AnimCmd *const gSpriteAnimTable_840B1F0[] =
{
    gSpriteAnim_840B1E8,
};
static void sub_813EDFC(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_840B1F4 =
{
    .tileTag = 2003,
    .paletteTag = 2003,
    .oam = &gOamData_840B1E0,
    .anims = gSpriteAnimTable_840B1F0,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_813EDFC,
};
const struct CompressedSpriteSheet gIntro3PokeballGfx_Table[] =
{
    {gInterfaceGfx_PokeBall, 0x100, 2002},
    {((void *)0)},
};
const struct CompressedSpriteSheet gIntro3MiscGfx_Table[] =
{
    {gIntro3MiscTiles, 0xa00, 2003},
    {((void *)0)},
};
const struct CompressedSpritePalette gInterfacePokeballPal_Table[] =
{
    {gInterfacePal_PokeBall, 2002},
    {((void *)0)},
};
const struct SpritePalette gIntro3MiscPal_Table[] =
{
    {gIntro3Misc1Palette, 2003},
    {gIntro3Misc2Palette, 2004},
    {((void *)0)},
};




const u32 unusedSharedMemPtr = (u32)gSharedMem;

static void MainCB2_EndIntro(void);
void Task_IntroLoadPart1Graphics(u8);
static void Task_IntroFadeIn(u8);
static void Task_IntroWaterDrops(u8);
static void Task_IntroScrollDownAndShowEon(u8);
static void Task_IntroWaitToSetupPart2(u8);
static void Task_IntroLoadPart2Graphics(u8);
static void Task_IntroStartBikeRide(u8);
static void Task_IntroHandleBikeAndEonMovement(u8);
static void Task_IntroWaitToSetupPart3(u8);
static void Task_IntroLoadPart3Graphics(u8);
static void Task_IntroSpinAndZoomPokeball(u8);
static void Task_IntroWaitToSetupPart3DoubleFight(u8);
static void Task_IntroLoadPart3Streaks(u8);
static void task_intro_14(u8);
static void task_intro_15(u8);
static void task_intro_16(u8);
static void task_intro_17(u8);
static void Task_IntroPokemonBattle(u8);
static void task_intro_19(u8);
static void task_intro_20(u8);
static void intro_reset_and_hide_bgs(void);
static void sub_813CCE8(u8);
static u16 sub_813CE88(u16, s16, s16, u16, u8);
static u8 sub_813CFA8(u16, u16, u16, u16);
static void sub_813D084(u8);
static void sub_813D220(struct Sprite *);
static void sub_813D368(struct Sprite *);
static void sub_813D414(struct Sprite *);
static void SpriteCB_WaterDropFall(struct Sprite *);
static u8 CreateWaterDrop(s16, s16, u16, u16, u16, u8);
static void sub_813D788(struct Sprite *);
static void sub_813D880(struct Sprite *);
static u8 CreateGameFreakLogo(s16, s16, u8);
static void sub_813DB9C(struct Sprite *);
static void sub_813DE70(struct Sprite *);
static void sub_813E10C(struct Sprite *);
static void sub_813E210(struct Sprite *);
static void sub_813E580(u16, u16);
static void sub_813E7C0(u8);
static void sub_813E930(u8);
static void InitIntroTorchicAttackAnim(u8);
static void InitIntroMudkipAttackAnim(u8);

static void VBlankCB_Intro(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void MainCB2_Intro(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    if (gMain.newKeys && !gPaletteFade.active)
        SetMainCallback2(MainCB2_EndIntro);
    else if (gIntroFrameCounter != -1)
        gIntroFrameCounter++;
}

static void MainCB2_EndIntro(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(CB2_InitTitleScreen);
}

static void LoadCopyrightGraphics(u16 tilesetAddress, u16 tilemapAddress, u16 paletteAddress)
{
    LZ77UnCompVram(gIntroCopyright_Gfx, (void *)(0x6000000 + tilesetAddress));
    LoadPalette(gIntroCopyright_Pal, paletteAddress, 0x20);
    CpuSet(gIntroCopyright_Tilemap, (void *)(0x6000000 + tilemapAddress), 0x00000000 | ((0x500)/(16/8) & 0x1FFFFF));
}

static void SerialCB_CopyrightScreen(void)
{
    GameCubeMultiBoot_HandleSerialInterrupt(&gMultibootProgramStruct);
}

static u8 SetUpCopyrightScreen(void)
{
    u16 ime;

    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(((void *)0));
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x52)) = 0;
        (*(vu16 *)(0x4000000 + 0x54)) = 0;
        *(u16 *)0x5000000 = 0x7FFF;
        (*(vu16 *)(0x4000000 + 0x0)) = 0;
        (*(vu16 *)(0x4000000 + 0x10)) = 0;
        (*(vu16 *)(0x4000000 + 0x12)) = 0;
        { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)((void *)0x6000000); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((0x18000)/(16/8))); dmaRegs[2]; }; };
        { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)((void *)0x7000000); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x400)/(32/8))); dmaRegs[2]; }; };
        { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)((void *)(0x5000000 + 2)); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((0x400 - 2)/(16/8))); dmaRegs[2]; }; };
        ResetPaletteFade();
        LoadCopyrightGraphics(0, 0x3800, 0);
        remove_some_task();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0xFFFF);
        (*(vu16 *)(0x4000000 + 0x8)) = (0)
                   | ((0) << 2)
                   | ((7) << 8)
                   | 0x0000
                   | 0x0000;
        ime = (*(vu16 *)(0x4000000 + 0x208));
        (*(vu16 *)(0x4000000 + 0x208)) = 0;
        (*(vu16 *)(0x4000000 + 0x200)) |= (1 << 0);
        (*(vu16 *)(0x4000000 + 0x208)) = ime;
        (*(vu16 *)(0x4000000 + 0x4)) |= 0x0008;
        SetVBlankCallback(VBlankCB_Intro);
        (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0100;
        SetSerialCallback(SerialCB_CopyrightScreen);
        GameCubeMultiBoot_Init(&gMultibootProgramStruct);
    default:
        UpdatePaletteFade();
        gMain.state++;
        GameCubeMultiBoot_Main(&gMultibootProgramStruct);
        break;
    case 140:
        GameCubeMultiBoot_Main(&gMultibootProgramStruct);
        if (gMultibootProgramStruct.gcmb_field_2 != 1)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0);
            gMain.state++;
        }
        break;
    case 141:
        if (UpdatePaletteFade())
            break;
        CreateTask(Task_IntroLoadPart1Graphics, 0);
        SetMainCallback2(MainCB2_Intro);
        if (gMultibootProgramStruct.gcmb_field_2)
        {
            GameCubeMultiBoot_ExecuteProgram(&gMultibootProgramStruct);
        }
        else
        {
            GameCubeMultiBoot_Quit();
            SetSerialCallback(SerialCB);
        }
        return 0;
    }

    return 1;
}

void CB2_InitCopyrightScreenAfterBootup(void)
{
    if (!SetUpCopyrightScreen())
    {
        sub_8052E4C();
        ResetSaveCounters();
        sub_8125EC8(0);
        if (gSaveFileStatus == 0 || gSaveFileStatus == 2)
            ClearSav2();
        SetPokemonCryStereo(gSaveBlock2.optionsSound);
    }
}

void CB2_InitCopyrightScreenAfterTitleScreen(void)
{
    SetUpCopyrightScreen();
}

void Task_IntroLoadPart1Graphics(u8 taskId)
{
    SetVBlankCallback(((void *)0));
    gUnknown_02039318 = Random() & 1;
    intro_reset_and_hide_bgs();
    (*(vu16 *)(0x4000000 + 0x1e)) = 0;
    (*(vu16 *)(0x4000000 + 0x1a)) = 0x50;
    (*(vu16 *)(0x4000000 + 0x16)) = 0x18;
    (*(vu16 *)(0x4000000 + 0x12)) = 0x28;
    LZ77UnCompVram(gIntro1BGLeavesGfx, (void *)0x6000000);
    LZ77UnCompVram(gIntro1BG0_Tilemap, (void *)(0x6000000 + 0x8000));
    { vu16 *_dest = (vu16 *)(0x6000000 + 0x8800); u32 _size = 0x800; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };
    LZ77UnCompVram(gIntro1BG1_Tilemap, (void *)(0x6000000 + 0x9000));
    { vu16 *_dest = (vu16 *)(0x6000000 + 0x9800); u32 _size = 0x800; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };
    LZ77UnCompVram(gIntro1BG2_Tilemap, (void *)(0x6000000 + 0xA000));
    { vu16 *_dest = (vu16 *)(0x6000000 + 0xA800); u32 _size = 0x800; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };
    LZ77UnCompVram(gIntro1BG3_Tilemap, (void *)(0x6000000 + 0xB000));
    { vu16 *_dest = (vu16 *)(0x6000000 + 0xB800); u32 _size = 0x800; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };
    LoadPalette(gIntro1BGPals, 0, sizeof(gIntro1BGPals));
    (*(vu16 *)(0x4000000 + 0xe)) = (3) | ((0) << 2) | ((22) << 8) | 0x0000 | 0x8000;
    (*(vu16 *)(0x4000000 + 0xc)) = (2) | ((0) << 2) | ((20) << 8) | 0x0000 | 0x8000;
    (*(vu16 *)(0x4000000 + 0xa)) = (1) | ((0) << 2) | ((18) << 8) | 0x0000 | 0x8000;
    (*(vu16 *)(0x4000000 + 0x8)) = (0) | ((0) << 2) | ((16) << 8) | 0x0000 | 0x8000;
    LoadCompressedObjectPic(&gUnknown_0840B008[0]);
    LoadCompressedObjectPic(&gUnknown_0840B018[0]);
    LoadSpritePalettes(gUnknown_0840B028);
    CpuSet(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1F0, 0x00000000 | ((0x20)/(16/8) & 0x1FFFFF));
    CpuSet(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1E1, 0x00000000 | ((0x1E)/(16/8) & 0x1FFFFF));
    CpuSet(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1D2, 0x00000000 | ((0x1C)/(16/8) & 0x1FFFFF));
    CpuSet(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1C3, 0x00000000 | ((0x1A)/(16/8) & 0x1FFFFF));
    CpuSet(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1B4, 0x00000000 | ((0x18)/(16/8) & 0x1FFFFF));
    CpuSet(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x1A5, 0x00000000 | ((0x16)/(16/8) & 0x1FFFFF));
    CpuSet(gPlttBufferUnfaded + 0x100, gPlttBufferUnfaded + 0x196, 0x00000000 | ((0x14)/(16/8) & 0x1FFFFF));
    gTasks[taskId].data[0] = CreateWaterDrop(236, -14, 0x200, 1, 0x78, 0);
    gTasks[taskId].func = Task_IntroFadeIn;
}

static void Task_IntroFadeIn(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    SetVBlankCallback(VBlankCB_Intro);
    (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0F00 | 0x1000;
    gTasks[taskId].func = Task_IntroWaterDrops;
    gIntroFrameCounter = 0;
    m4aSongNumStart(0x19E);
    ResetSerial();
}

static void Task_IntroWaterDrops(u8 taskId)
{

    if (gIntroFrameCounter == 76)
        gSprites[gTasks[taskId].data[0]].data[0] = 1;


    if (gIntroFrameCounter == 251)
        gSprites[gTasks[taskId].data[0]].data[0] = 2;

    if (gIntroFrameCounter == 368)
        CreateWaterDrop(48, 0, 0x400, 5, 0x70, 1);
    if (gIntroFrameCounter == 384)
        CreateWaterDrop(200, 60, 0x400, 9, 0x80, 1);

    if (gIntroFrameCounter == 560)
        CreateGameFreakLogo(240 / 2, 160 / 2, CreateTask(sub_813CCE8, 0));

    if (gIntroFrameCounter > 739)
    {
        gTasks[taskId].data[1] = 0x50;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 0x18;
        gTasks[taskId].data[4] = 0;
        gTasks[taskId].data[5] = 0x28;
        gTasks[taskId].data[6] = 0;
        gTasks[taskId].func = Task_IntroScrollDownAndShowEon;
    }
}

static void Task_IntroScrollDownAndShowEon(u8 taskId)
{
    if (gIntroFrameCounter < 904)
    {
        s32 r2;


        r2 = (gTasks[taskId].data[1] << 16) + (u16)gTasks[taskId].data[2] - 0xC000;
        gTasks[taskId].data[1] = r2 >> 16;
        gTasks[taskId].data[2] = r2;
        (*(vu16 *)(0x4000000 + 0x1a)) = gTasks[taskId].data[1];
        r2 = (gTasks[taskId].data[3] << 16) + (u16)gTasks[taskId].data[4] - 0x10000;
        gTasks[taskId].data[3] = r2 >> 16;
        gTasks[taskId].data[4] = r2;
        (*(vu16 *)(0x4000000 + 0x16)) = gTasks[taskId].data[3];
        r2 = (gTasks[taskId].data[5] << 16) + (u16)gTasks[taskId].data[6] - 0x18000;
        gTasks[taskId].data[5] = r2 >> 16;
        gTasks[taskId].data[6] = r2;
        (*(vu16 *)(0x4000000 + 0x12)) = gTasks[taskId].data[5];


        if (gIntroFrameCounter == 880)
        {
            u8 spriteId = CreateSprite(&gSpriteTemplate_840AFF0, 200, 160, 10);

            gSprites[spriteId].invisible = 1;
        }
    }
    else
    {

        if (gIntroFrameCounter > 1007)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0xFFFF);
            gTasks[taskId].func = Task_IntroWaitToSetupPart2;
        }
    }
}

static void Task_IntroWaitToSetupPart2(u8 taskId)
{
    if (gIntroFrameCounter > 1026)
        gTasks[taskId].func = Task_IntroLoadPart2Graphics;
}

static void Task_IntroLoadPart2Graphics(u8 taskId)
{
    intro_reset_and_hide_bgs();
    SetVBlankCallback(((void *)0));
    ResetSpriteData();
    FreeAllSpritePalettes();
    gUnknown_02039358 = 0;
    gUnknown_0203935A = 0;



    load_intro_part2_graphics(1);

    gTasks[taskId].func = Task_IntroStartBikeRide;
}

static void Task_IntroStartBikeRide(u8 taskId)
{
    u8 spriteId;

    if (gUnknown_02039318 == 0)
        LoadCompressedObjectPic(&gIntro2BrendanSpriteSheet);
    else
        LoadCompressedObjectPic(&gIntro2MaySpriteSheet);
    LoadCompressedObjectPic(&gIntro2BicycleSpriteSheet);



    LoadCompressedObjectPic(&gIntro2LatiosSpriteSheet);

    LoadSpritePalettes(gIntro2SpritePalettes);
    if (gUnknown_02039318 == 0)
        spriteId = intro_create_brendan_sprite(0x110, 100);
    else
        spriteId = intro_create_may_sprite(0x110, 100);
    gSprites[spriteId].callback = sub_813D788;
    gSprites[spriteId].anims = gUnknown_0840AE80;
    gTasks[taskId].data[1] = spriteId;



    spriteId = intro_create_latios_sprite(-0x40, 0x3C);

    gSprites[spriteId].callback = sub_813D880;
    gTasks[taskId].data[2] = spriteId;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0xFFFF);
    SetVBlankCallback(VBlankCB_Intro);




    gTasks[taskId].data[0] = sub_8148EC0(1, 0x4000, 0x400, 0x10);
    sub_8148C78(1);

    gTasks[taskId].func = Task_IntroHandleBikeAndEonMovement;
}

static void Task_IntroHandleBikeAndEonMovement(u8 taskId)
{
    s16 a;
    u16 sine;

    if (gIntroFrameCounter > 1823)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 16, 0, 16, 0xFFFF);
        gTasks[taskId].func = Task_IntroWaitToSetupPart3;
    }
    if (gIntroFrameCounter == 1109)
        gSprites[gTasks[taskId].data[1]].data[0] = 1;
    if (gIntroFrameCounter == 1214)
        gSprites[gTasks[taskId].data[1]].data[0] = 0;
    if (gIntroFrameCounter == 1394)
        gSprites[gTasks[taskId].data[2]].data[0] = 1;
    if (gIntroFrameCounter == 1398)
        gSprites[gTasks[taskId].data[1]].data[0] = 2;
    if (gIntroFrameCounter == 1586)
        gSprites[gTasks[taskId].data[1]].data[0] = 3;
    if (gIntroFrameCounter == 1727)
        gSprites[gTasks[taskId].data[1]].data[0] = 4;


    a = (((u16)gTasks[taskId].data[3] << 16) >> 18) & 0x7F;
    sine = Sin(a, 48);
    gUnknown_0203935A = sine;
    if (gTasks[taskId].data[3] < 512)
        gTasks[taskId].data[3]++;



    sub_8149020(1);

}

static void Task_IntroWaitToSetupPart3(u8 taskId)
{
    if (gIntroFrameCounter > 2068)
    {
        DestroyTask(gTasks[taskId].data[0]);
        gTasks[taskId].func = Task_IntroLoadPart3Graphics;
    }
}

static void Task_IntroLoadPart3Graphics(u8 taskId)
{
    intro_reset_and_hide_bgs();
    LZ77UnCompVram(gIntro3Pokeball_Gfx, (void *)0x6000000);
    LZ77UnCompVram(gIntro3Pokeball_Tilemap, (void *)(0x6000000 + 0x4000));
    LoadPalette(gIntro3PokeballPal, 0, 0x200);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    sub_813CE30(0x78, 0x50, 0, 0);
    ResetSpriteData();
    FreeAllSpritePalettes();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0xFFFF);
    (*(vu16 *)(0x4000000 + 0xc)) = (3) | ((0) << 2) | ((8) << 8) | 0x0080 | 0x4000;
    (*(vu16 *)(0x4000000 + 0x0)) = 0x0001 | 0x0040 | 0x0400 | 0x1000;
    gTasks[taskId].func = Task_IntroSpinAndZoomPokeball;
    gIntroFrameCounter = 0;
    m4aSongNumStart(0x1BA);
}

static void Task_IntroSpinAndZoomPokeball(u8 taskId)
{
    gTasks[taskId].data[0] += 0x400;
    if (gTasks[taskId].data[1] <= 0x6BF)
    {
        gTasks[taskId].data[1] += gTasks[taskId].data[2];
        gTasks[taskId].data[2]++;
    }
    else
    {
        gTasks[taskId].func = Task_IntroWaitToSetupPart3DoubleFight;
    }
    sub_813CE30(0x78, 0x50, 0x10000 / gTasks[taskId].data[1], gTasks[taskId].data[0]);
    if (gIntroFrameCounter == 44)
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0xFFFF);
}

static void Task_IntroWaitToSetupPart3DoubleFight(u8 taskId)
{
    if (gIntroFrameCounter > 59)
        gTasks[taskId].func = Task_IntroLoadPart3Streaks;
}



static void Task_IntroLoadPart3Streaks(u8 taskId)
{
    u16 i;
    void *vram;

    intro_reset_and_hide_bgs();
    for (i = 0; i < 32; i++)
    {
        ((u8 (*)[32])gSharedMem)[0][i] = 0;
        ((u8 (*)[32])gSharedMem)[1][i] = 17;
        ((u8 (*)[32])gSharedMem)[2][i] = 34;
    }
    vram = (void *)0x6000000;
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gSharedMem); dmaRegs[1] = (vu32)(vram); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((0x60)/(16/8))); dmaRegs[2]; };
    for (i = 0; i < 0x280; i++)
        ((u16 *)(0x6000000 + 0x3000))[i] = 0xF001;
    for (i = 0; i < 0x80; i++)
        ((u16 *)(0x6000000 + 0x3800))[i] = 0xF002;
    for (i = 0; i < 0x180; i++)
        ((u16 *)(0x6000000 + 0x3900))[i] = 0xF000;
    for (i = 0; i < 0x80; i++)
        ((u16 *)(0x6000000 + 0x3C00))[i] = 0xF002;
    gPlttBufferUnfaded[0xF0] = ((31) | ((31) << 5) | ((31) << 10));
    gPlttBufferFaded[0xF0] = ((31) | ((31) << 5) | ((31) << 10));
    sub_813D084(1);
    gPlttBufferUnfaded[0xF2] = ((0) | ((0) << 5) | ((0) << 10));
    gPlttBufferFaded[0xF2] = ((0) | ((0) << 5) | ((0) << 10));
    LZ77UnCompVram(gIntro3Streaks_Gfx, (void *)(0x6000000 + 0x4000));
    LZ77UnCompVram(gIntro3Streaks_Tilemap, (void *)(0x6000000 + 0x7000));
    LoadPalette(gIntro3Streaks_Pal, 0, 0x20);
    ResetSpriteData();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 8;
    LoadCompressedObjectPic(&gIntro3PokeballGfx_Table[0]);
    LoadCompressedObjectPic(&gIntro3MiscGfx_Table[0]);
    LoadCompressedObjectPalette(&gInterfacePokeballPal_Table[0]);
    LoadSpritePalettes(gIntro3MiscPal_Table);
    gTasks[taskId].func = task_intro_14;
}

static void task_intro_14(u8 taskId)
{
    (*(vu16 *)(0x4000000 + 0x40)) = 0xF0;
    (*(vu16 *)(0x4000000 + 0x44)) = 0xA0;
    (*(vu16 *)(0x4000000 + 0x48)) = 0x1C;
    (*(vu16 *)(0x4000000 + 0x4a)) = 0x1D;
    (*(vu16 *)(0x4000000 + 0xe)) = (3)
               | ((0) << 2)
               | ((6) << 8)
               | 0x0000
               | 0x0000;
    (*(vu16 *)(0x4000000 + 0x8)) = (0)
               | ((0) << 2)
               | ((7) << 8)
               | 0x0000
               | 0x0000;
    (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0100 | 0x0800 | 0x1000 | 0x2000;
    gTasks[taskId].data[15] = CreateTask(task_intro_20, 0);
    gTasks[gTasks[taskId].data[15]].data[0] = 0;
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].func = task_intro_15;
}

static void task_intro_15(u8 taskId)
{
    u16 foo = gTasks[taskId].data[0];

    if (gTasks[taskId].data[0] != 32)
    {
        u32 bar;

        gTasks[taskId].data[0] += 4;
        (*(vu16 *)(0x4000000 + 0x44)) = (gTasks[taskId].data[0] * 256) - (bar = foo - 0x9C);
    }
    else
    {
        (*(vu16 *)(0x4000000 + 0x44)) = 0x2080;
        gTasks[taskId].func = task_intro_16;
    }
}

static void task_intro_16(u8 taskId)
{
    gTasks[taskId].func = task_intro_17;
}

static void task_intro_17(u8 taskId)
{
    gUnknown_0203931A = 0;
    gTasks[taskId].func = Task_IntroPokemonBattle;
}

static void Task_IntroPokemonBattle(u8 taskId)
{
    u8 spriteId;

    if (gIntroFrameCounter == 80)
    {
        spriteId = sub_813CE88(SPECIES_SHARPEDO, 0xF0, 0xA0, 5, 1);
        gSprites[spriteId].callback = sub_813DB9C;
        gSprites[spriteId].data[1] = 1;
        gSprites[spriteId].data[2] = 0;
    }
    if (gIntroFrameCounter == 152)
    {
        spriteId = sub_813CE88(SPECIES_DUSKULL, 0, 0xA0, 4, 1);
        gSprites[spriteId].callback = sub_813DB9C;
        gSprites[spriteId].data[1] = 2;
        gSprites[spriteId].data[2] = 1;
    }
    if (gIntroFrameCounter == 219)
    {
        sub_813D084(0);
        spriteId = sub_813CFA8(gUnknown_02039318, 0x110, 0x60, 6);
        gSprites[spriteId].callback = sub_813DE70;
        gTasks[taskId].data[1] = spriteId;
    }
    if (gIntroFrameCounter == 304)
    {
        gTasks[gTasks[taskId].data[15]].data[0] = 4;
        gSprites[gTasks[taskId].data[1]].data[0] = 2;
    }
    if (gIntroFrameCounter == 384)
    {
        gTasks[gTasks[taskId].data[15]].data[0] = 0;
        gSprites[gTasks[taskId].data[1]].data[0] = 4;
    }
    if (gIntroFrameCounter == 400)
    {
        BeginNormalPaletteFade(0xFF0000, 0, 0x10, 0, 0x7EFF);
    }
    if (gIntroFrameCounter == 432)
    {
        gSprites[gTasks[taskId].data[1]].data[0] = 5;
    }
    if (gIntroFrameCounter == 462)
    {
        gSprites[gTasks[taskId].data[1]].data[0] = 6;
        gTasks[gTasks[taskId].data[15]].data[0] = 2;
    }
    if (gIntroFrameCounter == 463)
    {
        sub_813D084(1);
        spriteId = sub_813CE88(SPECIES_SHARPEDO, 0xD0, 8, 5, 1);
        gSprites[spriteId].callback = sub_813E10C;
        gTasks[taskId].data[2] = spriteId;
        sub_813E7C0(spriteId);
    }
    if (gIntroFrameCounter == 539)
    {
        spriteId = sub_813CE88(SPECIES_DUSKULL, 0xF8, 0x10, 4, 1);
        gSprites[spriteId].callback = sub_813E10C;
        gTasks[taskId].data[3] = spriteId;
        sub_813E930(spriteId);
    }
    if (gIntroFrameCounter == 623)
    {
        gSprites[gTasks[taskId].data[2]].data[0] = 2;
        gSprites[gTasks[taskId].data[3]].data[0] = 2;
        gTasks[gTasks[taskId].data[15]].data[0] = 3;
    }
    if (gIntroFrameCounter == 624)
    {
        sub_813D084(0);
        spriteId = sub_813CE88(SPECIES_MUDKIP, 0x20, 0x98, 0, 0);
        gSprites[spriteId].callback = sub_813E210;
        gTasks[taskId].data[4] = spriteId;
        InitIntroMudkipAttackAnim(spriteId);
    }
    if (gIntroFrameCounter == 700)
    {
        spriteId = sub_813CE88(SPECIES_TORCHIC, -8, 0x90, 1, 0);
        gSprites[spriteId].callback = sub_813E210;
        gTasks[taskId].data[5] = spriteId;
        InitIntroTorchicAttackAnim(spriteId);
    }
    if (gIntroFrameCounter == 776)
    {
        gUnknown_0203931A = 1;
        gSprites[gTasks[taskId].data[4]].data[0] = 2;
        gSprites[gTasks[taskId].data[5]].data[0] = 2;
        gTasks[gTasks[taskId].data[15]].data[0] = 0;
    }
    if (gIntroFrameCounter == 781)
    {
        sub_813D084(2);
        gSprites[gTasks[taskId].data[2]].data[0] = 3;
        gSprites[gTasks[taskId].data[3]].data[0] = 3;
        gSprites[gTasks[taskId].data[4]].data[0] = 3;
        gSprites[gTasks[taskId].data[5]].data[0] = 3;
        spriteId = CreateSprite(&gSpriteTemplate_840B1F4, 0x78, 0x50, 15);
        gSprites[spriteId].invisible = 1;
    }
    if (gIntroFrameCounter == 800)
        PlaySE(SE_OP_BASYU);
    if (gIntroFrameCounter == 850)
        BeginNormalPaletteFade(0xFFFFFFFF, 4, 0, 0x10, 0xFFFF);
    if (gIntroFrameCounter == 946)
        gTasks[taskId].func = task_intro_19;
}

static void task_intro_19(u8 taskId)
{
    DestroyTask(taskId);
    SetMainCallback2(MainCB2_EndIntro);
}

static void task_intro_20(u8 taskId)
{



    gTasks[taskId].data[15]++;
    switch (gTasks[taskId].data[0])
    {
    case 0:
        (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0100 | 0x0800 | 0x1000 | 0x2000;
        (*(vu16 *)(0x4000000 + 0xc)) = 0;
        gTasks[taskId].data[0] = 0xFF;
        break;
    case 2:
        BeginNormalPaletteFade(1, 0, 0x10, 0, 0xFFFF);
        (*(vu16 *)(0x4000000 + 0xc)) = ((3) | ((1) << 2) | ((14) << 8) | 0x0000 | 0x0000);
        (*(vu16 *)(0x4000000 + 0x0)) = (0x0000 | 0x0040 | 0x0100 | 0x0400 | 0x0800 | 0x1000 | 0x2000);
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[0] = 20;

    case 20:
        (*(vu16 *)(0x4000000 + 0x1a)) = gTasks[taskId].data[1];
        (*(vu16 *)(0x4000000 + 0x18)) = gTasks[taskId].data[2];
        gTasks[taskId].data[1] += 6;
        gTasks[taskId].data[2] -= 8;
        break;
    case 3:
        BeginNormalPaletteFade(1, 0, 0x10, 0, 0xFFFF);
        (*(vu16 *)(0x4000000 + 0xc)) = ((3) | ((1) << 2) | ((14) << 8) | 0x0000 | 0x0000);
        (*(vu16 *)(0x4000000 + 0x0)) = (0x0000 | 0x0040 | 0x0100 | 0x0400 | 0x0800 | 0x1000 | 0x2000);
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[0] = 0x1E;

    case 0x1E:
        (*(vu16 *)(0x4000000 + 0x1a)) = gTasks[taskId].data[1];
        (*(vu16 *)(0x4000000 + 0x18)) = gTasks[taskId].data[2];
        gTasks[taskId].data[1] -= 6;
        gTasks[taskId].data[2] += 8;
        break;
    case 4:
        BeginNormalPaletteFade(1, 5, 0, 0x10, 0x37F7);
        (*(vu16 *)(0x4000000 + 0xc)) = ((3) | ((1) << 2) | ((14) << 8) | 0x0000 | 0x0000);
        (*(vu16 *)(0x4000000 + 0x0)) = (0x0000 | 0x0040 | 0x0100 | 0x0400 | 0x0800 | 0x1000 | 0x2000);
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 8;
        gTasks[taskId].data[0] = 0x28;

    case 0x28:
        (*(vu16 *)(0x4000000 + 0x1a)) = gTasks[taskId].data[1];
        (*(vu16 *)(0x4000000 + 0x18)) = gTasks[taskId].data[2];
        gTasks[taskId].data[1] -= gTasks[taskId].data[3];
        gTasks[taskId].data[2] += gTasks[taskId].data[3];
        if (!(gTasks[taskId].data[15] & 7) && gTasks[taskId].data[3] != 0)
            gTasks[taskId].data[3]--;
        break;
    case 0xFF:
        break;
    }



}

static void intro_reset_and_hide_bgs(void)
{
    (*(vu16 *)(0x4000000 + 0x0)) = 0;
    (*(vu16 *)(0x4000000 + 0x1c)) = 0;
    (*(vu16 *)(0x4000000 + 0x1e)) = 0;
    (*(vu16 *)(0x4000000 + 0x18)) = 0;
    (*(vu16 *)(0x4000000 + 0x1a)) = 0;
    (*(vu16 *)(0x4000000 + 0x14)) = 0;
    (*(vu16 *)(0x4000000 + 0x16)) = 0;
    (*(vu16 *)(0x4000000 + 0x10)) = 0;
    (*(vu16 *)(0x4000000 + 0x12)) = 0;
    (*(vu16 *)(0x4000000 + 0x50)) = 0;
    (*(vu16 *)(0x4000000 + 0x52)) = 0;
    (*(vu16 *)(0x4000000 + 0x54)) = 0;
}
# 1573 "src/scene/intro.c"
__attribute__((naked))
static void sub_813CCE8(u8 taskId)
{
    asm("\n    .equ REG_BLDCNT, 0x4000050\n    .equ REG_BLDALPHA, 0x4000052\n    .syntax unified\n    push {r4,lr}\n    lsls r0, 24\n    lsrs r3, r0, 24\n    ldr r1, _0813CD0C @ =gTasks\n    lsls r0, r3, 2\n    adds r0, r3\n    lsls r0, 3\n    adds r0, r1\n    movs r2, 0x8\n    ldrsh r0, [r0, r2]\n    adds r2, r1, 0\n    cmp r0, 0x4\n    bhi _0813CD28\n    lsls r0, 2\n    ldr r1, _0813CD10 @ =_0813CD14\n    adds r0, r1\n    ldr r0, [r0]\n    mov pc, r0\n    .align 2, 0\n_0813CD0C: .4byte gTasks\n_0813CD10: .4byte _0813CD14\n    .align 2, 0\n_0813CD14:\n    .4byte _0813CD28\n    .4byte _0813CD5C\n    .4byte _0813CD8C\n    .4byte _0813CDA8\n    .4byte _0813CDFC\n_0813CD28:\n    ldr r1, _0813CD54 @ =REG_BLDCNT\n    ldr r4, _0813CD58 @ =0x00003f50\n    adds r0, r4, 0\n    strh r0, [r1]\n    adds r1, 0x2\n    movs r4, 0x80\n    lsls r4, 5\n    adds r0, r4, 0\n    strh r0, [r1]\n    adds r1, 0x2\n    movs r0, 0\n    strh r0, [r1]\n    lsls r0, r3, 2\n    adds r0, r3\n    lsls r0, 3\n    adds r0, r2\n    movs r1, 0x40\n    strh r1, [r0, 0xA]\n    movs r1, 0x1\n    strh r1, [r0, 0x8]\n    b _0813CE26\n    .align 2, 0\n_0813CD54: .4byte REG_BLDCNT\n_0813CD58: .4byte 0x00003f50\n_0813CD5C:\n    lsls r0, r3, 2\n    adds r0, r3\n    lsls r0, 3\n    adds r2, r0, r2\n    ldrh r1, [r2, 0xA]\n    movs r3, 0xA\n    ldrsh r0, [r2, r3]\n    cmp r0, 0\n    beq _0813CD78\n    subs r0, r1, 0x1\n    strh r0, [r2, 0xA]\n    movs r4, 0xA\n    ldrsh r0, [r2, r4]\n    b _0813CDC2\n_0813CD78:\n    ldr r1, _0813CD84 @ =REG_BLDALPHA\n    ldr r0, _0813CD88 @ =gUnknown_08393E64\n    ldrh r0, [r0]\n    strh r0, [r1]\n    movs r0, 0x80\n    b _0813CDEA\n    .align 2, 0\n_0813CD84: .4byte REG_BLDALPHA\n_0813CD88: .4byte gUnknown_08393E64\n_0813CD8C:\n    lsls r0, r3, 2\n    adds r0, r3\n    lsls r0, 3\n    adds r1, r0, r2\n    ldrh r0, [r1, 0xA]\n    movs r3, 0xA\n    ldrsh r2, [r1, r3]\n    cmp r2, 0\n    bne _0813CE0E\n    strh r2, [r1, 0xA]\n    ldrh r0, [r1, 0x8]\n    adds r0, 0x1\n    strh r0, [r1, 0x8]\n    b _0813CE26\n_0813CDA8:\n    lsls r0, r3, 2\n    adds r0, r3\n    lsls r0, 3\n    adds r2, r0, r2\n    ldrh r1, [r2, 0xA]\n    movs r4, 0xA\n    ldrsh r0, [r2, r4]\n    cmp r0, 0x3D\n    bgt _0813CDE0\n    adds r0, r1, 0x1\n    strh r0, [r2, 0xA]\n    movs r1, 0xA\n    ldrsh r0, [r2, r1]\n_0813CDC2:\n    lsrs r1, r0, 31\n    adds r0, r1\n    movs r2, 0xFF\n    lsls r2, 1\n    ldr r3, _0813CDD8 @ =REG_BLDALPHA\n    ldr r1, _0813CDDC @ =gUnknown_08393E64\n    ands r0, r2\n    adds r0, r1\n    ldrh r0, [r0]\n    strh r0, [r3]\n    b _0813CE26\n    .align 2, 0\n_0813CDD8: .4byte REG_BLDALPHA\n_0813CDDC: .4byte gUnknown_08393E64\n_0813CDE0:\n    ldr r1, _0813CDF4 @ =REG_BLDALPHA\n    ldr r0, _0813CDF8 @ =gUnknown_08393E64\n    ldrh r0, [r0, 0x3E]\n    strh r0, [r1]\n    movs r0, 0x10\n_0813CDEA:\n    strh r0, [r2, 0xA]\n    ldrh r0, [r2, 0x8]\n    adds r0, 0x1\n    strh r0, [r2, 0x8]\n    b _0813CE26\n    .align 2, 0\n_0813CDF4: .4byte REG_BLDALPHA\n_0813CDF8: .4byte gUnknown_08393E64\n_0813CDFC:\n    lsls r0, r3, 2\n    adds r0, r3\n    lsls r0, 3\n    adds r1, r0, r2\n    ldrh r0, [r1, 0xA]\n    movs r4, 0xA\n    ldrsh r2, [r1, r4]\n    cmp r2, 0\n    beq _0813CE14\n_0813CE0E:\n    subs r0, 0x1\n    strh r0, [r1, 0xA]\n    b _0813CE26\n_0813CE14:\n    ldr r0, _0813CE2C @ =REG_BLDCNT\n    strh r2, [r0]\n    adds r0, 0x2\n    strh r2, [r0]\n    adds r0, 0x2\n    strh r2, [r0]\n    adds r0, r3, 0\n    bl DestroyTask\n_0813CE26:\n    pop {r4}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0813CE2C: .4byte REG_BLDCNT\n    .syntax divided\n");
# 1747 "src/scene/intro.c"
}


void sub_813CE30(u16 scrX, u16 scrY, u16 zoom, u16 alpha)
{
    struct BgAffineSrcData src;
    struct BgAffineDstData dest;

    src.texX = 0x8000;
    src.texY = 0x8000;
    src.scrX = scrX;
    src.scrY = scrY;
    src.sx = zoom;
    src.sy = zoom;
    src.alpha = alpha;
    BgAffineSet(&src, &dest, 1);
    (*(vu16 *)(0x4000000 + 0x20)) = dest.pa;
    (*(vu16 *)(0x4000000 + 0x22)) = dest.pb;
    (*(vu16 *)(0x4000000 + 0x24)) = dest.pc;
    (*(vu16 *)(0x4000000 + 0x26)) = dest.pd;
    (*(vu32 *)(0x4000000 + 0x28)) = dest.dx;
    (*(vu32 *)(0x4000000 + 0x2c)) = dest.dy;
}

static u16 sub_813CE88(u16 species, s16 x, s16 y, u16 d, u8 front)
{
    const u8 *lzPaletteData;
    u8 spriteId;

    if (front)
        LoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, 0x2000000, gUnknown_0840B5A0[d], species, 0, 1);
    else
        LoadSpecialPokePic(&gMonBackPicTable[species], gMonBackPicCoords[species].coords, gMonBackPicCoords[species].y_offset, 0x2000000, gUnknown_0840B5A0[d], species, 0, 0);
    lzPaletteData = GetMonSpritePalFromOtIdPersonality(species, 0, 0xFFFF);
    LoadCompressedPalette(lzPaletteData, 0x100 + d * 0x10, 0x20);
    sub_8143648(d, d);
    spriteId = CreateSprite(&gUnknown_02024E8C, x, y, (d + 1) * 4);
    gSprites[spriteId].oam.paletteNum = d;
    gSprites[spriteId].oam.priority = 1;
    return spriteId;
}

static u8 sub_813CFA8(u16 a, u16 b, u16 c, u16 d)
{
    u8 spriteId;

    DecompressPicFromTable_2(&gTrainerBackPicTable[a], gTrainerBackPicCoords[a].coords, gTrainerBackPicCoords[a].y_offset, (void *)0x2000000, gUnknown_0840B5A0[d], a);
    LoadCompressedPalette(gTrainerBackPicPaletteTable[a].data, 0x100 + d * 0x10, 0x20);
    sub_8143680(d, d);
    gUnknown_02024E8C.anims = gUnknown_0840B064;
    spriteId = CreateSprite(&gUnknown_02024E8C, b, c, 1);
    gSprites[spriteId].oam.paletteNum = d;
    gSprites[spriteId].oam.priority = 1;
    return spriteId;
}

static void sub_813D084(u8 a)
{
    u16 color;

    switch (a)
    {
    default:
    case 0:
        color = ((22) | ((31) << 5) | ((15) << 10));
        break;
    case 1:
        color = ((31) | ((14) << 5) | ((12) << 10));
        break;
    case 2:
        color = ((12) | ((12) << 5) | ((20) << 10));
        break;
    }
    gPlttBufferUnfaded[241] = color;
    gPlttBufferFaded[241] = color;
}

static void sub_813D0CC(struct Sprite *sprite)
{
    u8 r0;

    if (sprite->data[2] >= 192)
    {
        if (sprite->data[3] != 0)
        {
            sprite->data[3]--;
        }
        else
        {
            sprite->invisible = 0;
            SetOamMatrix(sprite->data[1], sprite->data[2], 0, 0, sprite->data[2]);
            sprite->data[2] = (sprite->data[2] * 95) / 100;
            r0 = (sprite->data[2] - 192) / 128 + 9;
            if (r0 > 15)
                r0 = 15;
            sprite->oam.paletteNum = r0;
        }
    }
    else
    {
        DestroySprite(sprite);
    }
}

static void sub_813D158(struct Sprite *sprite)
{
    if (gSprites[sprite->data[7]].data[7] != 0)
    {
        sprite->invisible = 1;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        StartSpriteAnim(sprite, 3);
        sprite->data[2] = 1024;
        sprite->data[3] = 8 * (sprite->data[1] & 3);
        sprite->callback = sub_813D0CC;
        sprite->oam.shape = 1;
        sprite->oam.size = 3;
        CalcCenterToCornerVec(sprite, 1, 3, 2);
    }
    else
    {
        sprite->pos2.x = gSprites[sprite->data[7]].pos2.x;
        sprite->pos2.y = gSprites[sprite->data[7]].pos2.y;
        sprite->pos1.x = gSprites[sprite->data[7]].pos1.x;
        sprite->pos1.y = gSprites[sprite->data[7]].pos1.y;
    }
}

static void sub_813D208(struct Sprite *sprite)
{
    if (sprite->data[0] != 0)
        sprite->callback = sub_813D220;
}

static void sub_813D220(struct Sprite *sprite)
{
    if (sprite->pos1.x <= 116)
    {
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos1.x += 4;
        sprite->pos2.x = -4;
        sprite->data[4] = 128;
        sprite->callback = sub_813D368;
    }
    else
    {
        u16 data2;
        u16 data3;
        u16 data4;
        s16 sin1;
        s16 sin2;
        s16 sin3;
        s16 sin4;
        s16 var1;
        s16 var2;
        s16 var3;
        s16 var4;
        s16 temp;

        data4 = sprite->data[4];
        sin1 = gSineTable[(u8)data4];
        sin2 = gSineTable[(u8)(data4 + 64)];
        sprite->data[4] += 2;
        sprite->pos2.y = sin1 / 32;
        sprite->pos1.x--;
        if (sprite->pos1.x & 1)
            sprite->pos1.y++;
        temp = -sin2 / 16;
        data2 = sprite->data[2];
        data3 = sprite->data[3];
        sin3 = gSineTable[(u8)(temp - 16)];
        sin4 = gSineTable[(u8)(temp + 48)];
        var1 = sin4 * data2 / 256;
        var2 = -sin3 * data3 / 256;
        var3 = sin3 * data2 / 256;
        var4 = sin4 * data3 / 256;
        SetOamMatrix(sprite->data[1], data2, 0, 0, data3);
        SetOamMatrix(sprite->data[1] + 1, var1, var3, var2, var4);
        SetOamMatrix(sprite->data[1] + 2, var1, var3, var2 * 2, var4 * 2);
    }
}

static void sub_813D368(struct Sprite *sprite)
{
    SetOamMatrix(sprite->data[1], sprite->data[6] + 64, 0, 0, sprite->data[6] + 64);
    SetOamMatrix(sprite->data[1] + 1, sprite->data[6] + 64, 0, 0, sprite->data[6] + 64);
    SetOamMatrix(sprite->data[1] + 2, sprite->data[6] + 64, 0, 0, sprite->data[6] + 64);
    if (sprite->data[4] != 64)
    {
        u16 data4;

        sprite->data[4] -= 8;
        data4 = sprite->data[4];
        sprite->pos2.x = gSineTable[(u8)(data4 + 64)] / 64;
        sprite->pos2.y = gSineTable[(u8)data4] / 64;
    }
    else
    {
        sprite->data[4] = 0;
        sprite->callback = sub_813D414;
    }
}

static void sub_813D414(struct Sprite *sprite)
{
    if (sprite->data[0] != 2)
    {
        s16 r2;

        sprite->data[4] += 8;
        r2 = gSineTable[(u8)sprite->data[4]] / 16 + 64;
        sprite->pos2.x = gSineTable[(u8)(r2 + 64)] / 64;
        sprite->pos2.y = gSineTable[(u8)r2] / 64;
    }
    else
    {
        sprite->callback = SpriteCB_WaterDropFall;
    }
}

static void SpriteCB_WaterDropFall(struct Sprite *sprite)
{
    if (sprite->pos1.y < sprite->data[5])
    {
        sprite->pos1.y += 4;
    }
    else
    {
        sprite->data[7] = 1;
        sprite->invisible = 1;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        StartSpriteAnim(sprite, 3);
        sprite->data[2] = 1024;
        sprite->data[3] = 8 * (sprite->data[1] & 3);
        sprite->callback = sub_813D0CC;
        sprite->oam.shape = 1;
        sprite->oam.size = 3;
        CalcCenterToCornerVec(sprite, 1, 3, 2);
    }
}


static void SpriteCB_WaterDropFall_2(struct Sprite *sprite)
{
    if (sprite->pos1.y < sprite->data[5])
    {
        sprite->pos1.y += 4;
    }
    else
    {
        sprite->data[7] = 1;
        sprite->invisible = 1;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        StartSpriteAnim(sprite, 3);
        sprite->data[2] = 1024;
        sprite->data[3] = 8 * (sprite->data[1] & 3);
        sprite->callback = sub_813D0CC;
        sprite->oam.shape = 1;
        sprite->oam.size = 3;
        CalcCenterToCornerVec(sprite, 1, 3, 2);
    }
}

static u8 CreateWaterDrop(s16 x, s16 y, u16 c, u16 d, u16 e, u8 fallImmediately)
{
    u8 spriteId;
    u8 oldSpriteId;

    spriteId = CreateSprite(&gSpriteTemplate_840AE20, x, y, 0);
    gSprites[spriteId].data[0] = 0;
    gSprites[spriteId].data[7] = 0;
    gSprites[spriteId].data[1] = d;
    gSprites[spriteId].data[2] = c;
    gSprites[spriteId].data[3] = c;
    gSprites[spriteId].data[5] = e;
    gSprites[spriteId].data[6] = c;
    gSprites[spriteId].oam.affineMode = 3;
    gSprites[spriteId].oam.matrixNum = d;
    CalcCenterToCornerVec(&gSprites[spriteId], 0, 2, 2);
    StartSpriteAnim(&gSprites[spriteId], 2);
    if (!fallImmediately)
        gSprites[spriteId].callback = sub_813D208;
    else
        gSprites[spriteId].callback = SpriteCB_WaterDropFall_2;
    oldSpriteId = spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_840AE20, x, y, 0);
    gSprites[spriteId].data[7] = oldSpriteId;
    gSprites[spriteId].data[1] = d + 1;
    gSprites[spriteId].oam.affineMode = 3;
    gSprites[spriteId].oam.matrixNum = d + 1;
    CalcCenterToCornerVec(&gSprites[spriteId], 0, 2, 2);
    gSprites[spriteId].callback = sub_813D158;

    spriteId = CreateSprite(&gSpriteTemplate_840AE20, x, y, 0);
    gSprites[spriteId].data[7] = oldSpriteId;
    gSprites[spriteId].data[1] = d + 2;
    StartSpriteAnim(&gSprites[spriteId], 1);
    gSprites[spriteId].oam.affineMode = 3;
    gSprites[spriteId].oam.matrixNum = d + 2;
    CalcCenterToCornerVec(&gSprites[spriteId], 0, 2, 2);
    gSprites[spriteId].callback = sub_813D158;

    SetOamMatrix(d, c + 32, 0, 0, c + 32);
    SetOamMatrix(d + 1, c + 32, 0, 0, c + 32);
    SetOamMatrix(d + 2, c + 32, 0, 0, 2 * (c + 32));

    return oldSpriteId;
}

static void sub_813D788(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        StartSpriteAnimIfDifferent(sprite, 0);
        sprite->pos1.x--;
        break;
    case 1:
        StartSpriteAnimIfDifferent(sprite, 0);
        if (gIntroFrameCounter & 7)
            return;
        sprite->pos1.x++;
        break;
    case 2:
        StartSpriteAnimIfDifferent(sprite, 2);
        if (sprite->pos1.x <= 120 || (gIntroFrameCounter & 7))
            sprite->pos1.x++;
        break;
    case 3:
        StartSpriteAnimIfDifferent(sprite, 3);
        break;
    case 4:
        StartSpriteAnimIfDifferent(sprite, 0);
        if (sprite->pos1.x > -32)
            sprite->pos1.x -= 2;
        break;
    }
    if (gIntroFrameCounter & 7)
        return;
    if (sprite->pos2.y != 0)
    {
        sprite->pos2.y = 0;
    }
    else
    {
        switch (Random() & 3)
        {
        case 0:
            sprite->pos2.y = -1;
            break;
        case 1:
            sprite->pos2.y = 1;
            break;
        case 2:
        case 3:
            sprite->pos2.y = 0;
            break;
        }
    }
}

static void sub_813D880(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        break;
    case 1:
        if (sprite->pos2.x + sprite->pos1.x < 304)
            sprite->pos2.x += 8;
        else
            sprite->data[0] = 2;
        break;
    case 2:
        if (sprite->pos2.x + sprite->pos1.x > 120)
            sprite->pos2.x -= 1;
        else
            sprite->data[0] = 3;
        break;
    case 3:
        if (sprite->pos2.x > 0)
            sprite->pos2.x -= 2;
        break;
    }
    sprite->pos2.y = Sin((u8)sprite->data[1], 8) - gUnknown_0203935A;
    sprite->data[1] += 4;
}

static void sub_813D908(struct Sprite *sprite)
{
    if (gTasks[sprite->data[0]].data[0] == 0)
    {
        sprite->invisible = 1;
    }
    else if (gTasks[sprite->data[0]].data[0] != 4)
    {
        sprite->invisible = 0;
    }
    else
    {
        DestroySprite(sprite);
    }
}

static u8 CreateGameFreakLogo(s16 a, s16 b, u8 c)
{
    u8 spriteId;
    u16 i;

    for (i = 0; i < 9; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_840AF94, gUnknown_0840AF50[i][1] + a, b - 4, 0);
        gSprites[spriteId].data[0] = c;
        StartSpriteAnim(&gSprites[spriteId], gUnknown_0840AF50[i][0]);
    }
    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_840AFAC, gUnknown_0840AF74[i][1] + a, b + 12, 0);
        gSprites[spriteId].data[0] = c;
        StartSpriteAnim(&gSprites[spriteId], gUnknown_0840AF74[i][0]);
    }
    spriteId = CreateSprite(&gSpriteTemplate_840AFC4, 120, b - 4, 0);
    gSprites[spriteId].data[0] = c;

    return spriteId;
}
# 2239 "src/scene/intro.c"
__attribute__((naked))
static void sub_813DA64(struct Sprite *sprite)
{
    asm(".syntax unified\n    push {r4-r6,lr}\n    sub sp, 0x4\n    adds r4, r0, 0\n    ldrh r0, [r4, 0x3C]\n    adds r0, 0x1\n    strh r0, [r4, 0x3C]\n    movs r1, 0x2E\n    ldrsh r0, [r4, r1]\n    cmp r0, 0\n    beq _0813DA7C\n    cmp r0, 0x1\n    beq _0813DAC0\n_0813DA7C:\n    ldrb r0, [r4, 0x1]\n    movs r1, 0x3\n    orrs r0, r1\n    strb r0, [r4, 0x1]\n    ldrb r1, [r4, 0x3]\n    movs r0, 0x3F\n    negs r0, r0\n    ands r0, r1\n    movs r1, 0x2\n    orrs r0, r1\n    strb r0, [r4, 0x3]\n    adds r0, r4, 0\n    movs r1, 0x1\n    movs r2, 0x3\n    movs r3, 0x3\n    bl CalcCenterToCornerVec\n    adds r2, r4, 0\n    adds r2, 0x3E\n    ldrb r1, [r2]\n    movs r0, 0x5\n    negs r0, r0\n    ands r0, r1\n    strb r0, [r2]\n    movs r0, 0x1\n    strh r0, [r4, 0x2E]\n    movs r0, 0x80\n    strh r0, [r4, 0x30]\n    ldr r0, _0813DABC @ =0x0000ffe8\n    strh r0, [r4, 0x32]\n    movs r0, 0\n    b _0813DB92\n    .align 2, 0\n_0813DABC: .4byte 0x0000ffe8\n_0813DAC0:\n    ldrh r1, [r4, 0x34]\n    movs r2, 0x34\n    ldrsh r0, [r4, r2]\n    cmp r0, 0x4F\n    bgt _0813DAF8\n    lsls r0, r1, 24\n    lsrs r0, 24\n    movs r1, 0x78\n    bl Sin\n    negs r0, r0\n    strh r0, [r4, 0x26]\n    ldrh r0, [r4, 0x34]\n    lsls r0, 24\n    lsrs r0, 24\n    movs r1, 0x8C\n    bl Sin\n    negs r0, r0\n    strh r0, [r4, 0x24]\n    movs r1, 0x34\n    ldrsh r0, [r4, r1]\n    cmp r0, 0x40\n    ble _0813DAF8\n    ldrb r0, [r4, 0x5]\n    movs r1, 0xC\n    orrs r0, r1\n    strb r0, [r4, 0x5]\n_0813DAF8:\n    ldr r2, _0813DB60 @ =gSineTable\n    ldrh r1, [r4, 0x32]\n    lsls r0, r1, 24\n    lsrs r0, 23\n    adds r0, r2\n    ldrh r3, [r0]\n    adds r1, 0x40\n    lsls r1, 24\n    lsrs r1, 23\n    adds r1, r2\n    movs r2, 0\n    ldrsh r0, [r1, r2]\n    movs r1, 0x30\n    ldrsh r2, [r4, r1]\n    adds r1, r0, 0\n    muls r1, r2\n    adds r0, r1, 0\n    cmp r1, 0\n    bge _0813DB20\n    adds r0, 0xFF\n_0813DB20:\n    lsls r0, 8\n    lsrs r6, r0, 16\n    lsls r0, r3, 16\n    asrs r3, r0, 16\n    negs r0, r3\n    muls r0, r2\n    cmp r0, 0\n    bge _0813DB32\n    adds r0, 0xFF\n_0813DB32:\n    lsls r0, 8\n    lsrs r5, r0, 16\n    adds r0, r3, 0\n    muls r0, r2\n    cmp r0, 0\n    bge _0813DB40\n    adds r0, 0xFF\n_0813DB40:\n    lsls r0, 8\n    lsrs r2, r0, 16\n    adds r1, r6, 0\n    adds r3, r5, 0\n    str r1, [sp]\n    movs r0, 0x1\n    bl SetOamMatrix\n    ldrh r1, [r4, 0x30]\n    movs r2, 0x30\n    ldrsh r0, [r4, r2]\n    cmp r0, 0xFF\n    bgt _0813DB64\n    adds r0, r1, 0\n    adds r0, 0x8\n    b _0813DB68\n    .align 2, 0\n_0813DB60: .4byte gSineTable\n_0813DB64:\n    adds r0, r1, 0\n    adds r0, 0x20\n_0813DB68:\n    strh r0, [r4, 0x30]\n    ldrh r1, [r4, 0x32]\n    movs r2, 0x32\n    ldrsh r0, [r4, r2]\n    cmp r0, 0x17\n    bgt _0813DB78\n    adds r0, r1, 0x1\n    strh r0, [r4, 0x32]\n_0813DB78:\n    ldrh r2, [r4, 0x34]\n    movs r1, 0x34\n    ldrsh r0, [r4, r1]\n    cmp r0, 0x3F\n    bgt _0813DB86\n    adds r0, r2, 0x2\n    b _0813DB92\n_0813DB86:\n    ldrh r1, [r4, 0x3C]\n    movs r0, 0x3\n    ands r0, r1\n    cmp r0, 0\n    bne _0813DB94\n    adds r0, r2, 0x1\n_0813DB92:\n    strh r0, [r4, 0x34]\n_0813DB94:\n    add sp, 0x4\n    pop {r4-r6}\n    pop {r0}\n    bx r0\n    .syntax divided\n");
# 2408 "src/scene/intro.c"
}


static void sub_813DB9C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    default:
        if (sprite->data[2] != 0)
            sprite->hFlip = 1;
        else
            sprite->hFlip = 0;
        sprite->data[0] = 1;

    case 1:
        if (sprite->pos1.y > 96)
        {
            sprite->pos1.y -= 4;
            if (sprite->data[2] != 0)
                sprite->pos1.x += 2;
            else
                sprite->pos1.x -= 2;
        }
        else
        {
            sprite->data[0]++;
            sprite->data[3] = 8;
        }
        break;
    case 2:
        if (sprite->data[3] != 0)
        {
            sprite->data[3]--;
        }
        else
        {
            sprite->data[0]++;
            sprite->data[3] = 0;
        }
        break;
    case 3:
        sprite->oam.affineMode = 3;
        sprite->oam.matrixNum = sprite->data[1];
        CalcCenterToCornerVec(sprite, 0, 3, 3);
        if (sprite->data[2] != 0)
            SetOamMatrix(sprite->data[1], -256, 0, 0, 256);
        else
            SetOamMatrix(sprite->data[1], 256, 0, 0, 256);
        sprite->data[0]++;
        sprite->data[4] = 0;
        break;
    case 4:
        sprite->data[4]++;
        if (sprite->pos1.y + sprite->pos2.y > -32
         && sprite->pos1.x + sprite->pos2.x > -64)
        {
            u16 r2;

            sprite->pos2.y = -(sprite->data[4] * sprite->data[4]) / 8;
            if (sprite->data[2] != 0)
                sprite->pos2.x += sprite->data[4];
            else
                sprite->pos2.x -= sprite->data[4];
            if (sprite->data[3] < 128)
                sprite->data[3] += 8;
            r2 = 256 - sprite->data[3];
            if (sprite->data[2] != 0)
                SetOamMatrix(sprite->data[1], -r2, 0, 0, r2);
            else
                SetOamMatrix(sprite->data[1], r2, 0, 0, r2);
        }
        else
        {
            DestroySprite(sprite);
        }
    }
}

static void sub_813DD58(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    default:
        sprite->invisible = 0;
        sprite->oam.affineMode = 1;
        sprite->oam.matrixNum = sprite->data[1];
        sprite->data[3] = 2048;
        sprite->data[0] = 1;

    case 1:
        if (sprite->data[3] > 256)
        {
            sprite->data[3] -= 128;
            if (sprite->data[2] != 0)
                SetOamMatrix(sprite->data[1], -sprite->data[3], 0, 0, sprite->data[3]);
            else
                SetOamMatrix(sprite->data[1], sprite->data[3], 0, 0, sprite->data[3]);
        }
        else
        {
            if (sprite->data[2] != 0)
                SetOamMatrix(sprite->data[1], -256, 0, 0, 256);
            else
                SetOamMatrix(sprite->data[1], 256, 0, 0, 256);
            sprite->data[0]++;
        }
        break;
    case 2:
        break;
    case 3:
        sprite->data[4]++;
        sprite->pos2.y = sprite->data[4] * sprite->data[4] / 32;
        if (sprite->data[2] != 0)
            sprite->pos2.x = sprite->data[4] / 4;
        else
            sprite->pos2.x = -(sprite->data[4] / 4);
        break;
    }
}

static void sub_813DE70(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    default:
        if (sprite->pos1.x > 40)
        {
            sprite->pos1.x -= 4;
        }
        else
        {
            StartSpriteAnim(sprite, 1);
            sprite->data[6] = CreateSprite(&gSpriteTemplate_840B084, 16, 104, 100);
            sprite->data[7] = CreateSprite(&gSpriteTemplate_840B084, 12, 106, 101);
            sprite->data[0] = 1;
        }
        break;
    case 1:
        break;
    case 2:
        StartSpriteAnim(sprite, 2);
        gSprites[sprite->data[6]].data[0] = 1;
        gSprites[sprite->data[7]].data[0] = 2;
        sprite->data[0]++;
        break;
    case 3:
        if (sprite->pos1.y > 160)
        {
            sprite->invisible = 1;
            sprite->data[0] = 1;
        }
        else
        {
            sprite->pos1.y += 2;
            sprite->pos1.x--;
        }
        break;
    case 4:
    {
        s16 r4, r5;

        r5 = gSprites[sprite->data[6]].pos1.x + gSprites[sprite->data[6]].pos2.x;
        r4 = gSprites[sprite->data[6]].pos1.y + gSprites[sprite->data[6]].pos2.y;
        DestroySprite(&gSprites[sprite->data[6]]);
        sprite->data[6] = sub_813CE88(SPECIES_TORCHIC, r5, r4, 2, 1);
        gSprites[sprite->data[6]].callback = sub_813DD58;
        gSprites[sprite->data[6]].invisible = 1;
        gSprites[sprite->data[6]].data[1] = 1;
        gSprites[sprite->data[6]].data[2] = 1;
        sub_813E580(r5, r4);

        r5 = gSprites[sprite->data[7]].pos1.x + gSprites[sprite->data[7]].pos2.x;
        r4 = gSprites[sprite->data[7]].pos1.y + gSprites[sprite->data[7]].pos2.y;
        DestroySprite(&gSprites[sprite->data[7]]);
        sprite->data[7] = sub_813CE88(SPECIES_MUDKIP, r5, r4, 3, 1);
        gSprites[sprite->data[7]].callback = sub_813DD58;
        gSprites[sprite->data[7]].invisible = 1;
        gSprites[sprite->data[7]].data[1] = 2;
        gSprites[sprite->data[7]].data[2] = 0;
        sub_813E580(r5, r4);

        BeginNormalPaletteFade(0xFF0000, 0, 16, 16, ((31) | ((23) << 5) | ((31) << 10)));
        sprite->data[0] = 1;
        break;
    }
    case 5:
        gSprites[sprite->data[6]].data[0] = 3;
        gSprites[sprite->data[7]].data[0] = 3;
        break;
    case 6:
        DestroySprite(&gSprites[sprite->data[6]]);
        DestroySprite(&gSprites[sprite->data[7]]);
        DestroySprite(sprite);
        break;
    }
}

static void sub_813E10C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    default:
        if (sprite->pos2.x > -56)
        {
            sprite->pos2.x -= 8;
            sprite->pos2.y += 6;
        }
        else
        {
            sprite->data[6] = sprite->pos1.x;
            sprite->data[7] = sprite->pos1.y;
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[0] = 1;
            sprite->data[1] = 0;
        }
        break;
    case 1:
        if (!(sprite->data[1] & 1))
        {
            if (sprite->data[1] & 2)
            {
                sprite->pos2.x = -1;
                sprite->pos2.y = 1;
            }
            else
            {
                sprite->pos2.x = 0;
                sprite->pos2.y = 0;
            }
        }
        sprite->data[1]++;
        break;
    case 2:
        sprite->invisible = 1;
        sprite->pos1.x = sprite->data[6];
        sprite->pos1.y = sprite->data[7];
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        break;
    case 3:
        sprite->invisible = 0;
        sprite->data[1]++;

    case 4:
        if (sprite->pos2.x > -56)
        {
            sprite->pos2.x -= 4;
            sprite->pos2.y += 3;
        }
        else
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[0] = 1;
        }
        break;
    }
}

static void sub_813E210(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    default:
        if (sprite->pos2.x < 56)
        {
            sprite->pos2.x += 8;
            sprite->pos2.y -= 6;
        }
        else
        {
            sprite->data[6] = sprite->pos1.x;
            sprite->data[7] = sprite->pos1.y;
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[0] = 1;
            sprite->data[1] = 0;
        }
        break;
    case 1:
        if (!(sprite->data[1] & 1))
        {
            if (sprite->data[1] & 2)
            {
                sprite->pos2.x = 1;
                sprite->pos2.y = -1;
            }
            else
            {
                sprite->pos2.x = 0;
                sprite->pos2.y = 0;
            }
        }
        sprite->data[1]++;
        break;
    case 2:
        sprite->invisible = 1;
        sprite->pos1.x = sprite->data[6];
        sprite->pos1.y = sprite->data[7];
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        break;
    case 3:
        sprite->invisible = 0;
        sprite->data[1]++;

    case 4:
        if (sprite->pos2.x < 56)
        {
            sprite->pos2.x += 4;
            sprite->pos2.y -= 3;
        }
        else
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[0] = 1;
        }
        break;
    }
}

static void sub_813E30C(struct Sprite *sprite)
{
    u16 r4, r1;

    sprite->data[7]++;
    switch (sprite->data[0])
    {
    case 0:
    default:
        break;
    case 1:
        sprite->oam.affineMode = 1;
        sprite->oam.matrixNum = 1;
        sprite->data[0] = 10;
        sprite->data[4] = 36;

    case 10:
        if (sprite->pos1.x <= 144)
        {
            sprite->pos1.x += 4;
            sprite->pos1.y -= 1;
            sprite->pos2.y = -Sin((u8)sprite->data[2], 24);
            sprite->data[2] += 4;
        }
        sprite->data[3] -= sprite->data[4];
        if ((sprite->data[7] & 1) && sprite->data[4] != 0)
            sprite->data[4]--;
        r4 = gSineTable[(u8)sprite->data[3]];
        r1 = gSineTable[(u8)(sprite->data[3] + 64)];
        SetOamMatrix(1, r1, r4, -r4, r1);
        break;
    case 2:
        sprite->oam.affineMode = 1;
        sprite->oam.matrixNum = 2;
        sprite->data[0] = 20;
        sprite->data[4] = 36;

    case 20:
        if (sprite->pos1.x <= 96)
        {
            sprite->pos1.x += 3;
            sprite->pos1.y -= 1;
            sprite->pos2.y = -Sin((u8)sprite->data[2], 24);
            sprite->data[2] += 4;
        }
        sprite->data[3] -= sprite->data[4];
        if ((sprite->data[7] & 1) && sprite->data[4] != 0)
            sprite->data[4]--;
        r4 = gSineTable[(u8)sprite->data[3]];
        r1 = gSineTable[(u8)(sprite->data[3] + 64)];
        SetOamMatrix(2, r1, r4, -r4, r1);
        break;
    }
}

static void sub_813E4B8(struct Sprite *sprite)
{
    u16 r4;
    u16 r2;
    u16 r1;

    sprite->data[7]++;
    if (sprite->data[7] & 1)
        sprite->invisible = 0;
    else
        sprite->invisible = 1;
    if (sprite->data[2] >= 64)
    {
        DestroySprite(sprite);
        return;
    }
    sprite->data[2] += 2;
    r4 = Sin((u8)sprite->data[2], 40);
    sprite->pos2.x = Cos((u8)(sprite->data[0] * 32), r4);
    sprite->pos2.y = Sin((u8)(sprite->data[0] * 32), r4);
    if (sprite->data[0] == 0)
    {
        sprite->data[3] -= sprite->data[1];
        if ((sprite->data[7] & 1) && sprite->data[1] != 0)
            sprite->data[1]--;
        r2 = gSineTable[(u8)sprite->data[3]];
        r1 = gSineTable[(u8)(sprite->data[3] + 64)];
        SetOamMatrix(16, r1, r2, -r2, r1);
    }
}

static void sub_813E580(u16 x, u16 y)
{
    u8 i;
    u8 spriteId;

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_840B0B0, x, y, 0);
        gSprites[spriteId].oam.affineMode = 1;
        gSprites[spriteId].oam.matrixNum = 16;
        gSprites[spriteId].data[0] = i;
        gSprites[spriteId].data[1] = 32;
    }
}

static void sub_813E5E0(struct Sprite *sprite)
{
    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->invisible = gSprites[sprite->data[0]].invisible;
        if (sprite->data[7] < 12)
            sprite->data[7]++;
        sprite->data[6] += 4;
        sprite->pos1.x = sprite->data[4] + gSineTable[(u8)(sprite->data[3] + 64)] * sprite->data[6] / 256;

        sprite->pos1.y = sprite->data[5] + gSineTable[(u8)(sprite->data[3] + 0)] * sprite->data[6] / 256;
        sprite->pos2.y = gSineTable[(u8)(sprite->data[1] + 0)] * sprite->data[7] / 256;
        sprite->data[1] += 16;
        if (sprite->pos1.y > sprite->data[2])
            DestroySprite(sprite);
    }
}

static void sub_813E6C0(struct Sprite *sprite)
{
    u8 spriteId;
    u8 i;
    s16 var1;
    s16 var2;

    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->data[7]++;
        sprite->invisible = 1;
        if (gSprites[sprite->data[0]].data[0] == 1 && !(sprite->data[7] & 3))
        {
            var1 = sprite->data[1] + gSprites[sprite->data[0]].pos1.x;
            var2 = sprite->data[2] + gSprites[sprite->data[0]].pos1.y;
            for (i = 0; i < 3; i++)
            {
                u8 r3 = gSprites[sprite->data[0]].subpriority - 1;

                s16 _var1 = var1;
                s16 _var2 = var2;

                spriteId = CreateSprite(&gSpriteTemplate_840B0DC, _var1, _var2, r3);
                if (spriteId != 64)
                {
                    gSprites[spriteId].data[0] = sprite->data[0];
                    gSprites[spriteId].data[1] = (((sprite->data[7] >> 2) & 7) << 5) + i * 85;
                    gSprites[spriteId].data[2] = sprite->data[3];
                    gSprites[spriteId].data[3] = 104;
                    gSprites[spriteId].data[4] = var1;
                    gSprites[spriteId].data[5] = var2;
                    gSprites[spriteId].data[6] = 0;
                }
            }
        }
    }
}

static void sub_813E7C0(u8 a)
{
    u8 spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_840B0F4, 0, 0, 0);
    if (spriteId != 64)
    {
        gSprites[spriteId].data[0] = a;
        gSprites[spriteId].data[1] = -12;
        gSprites[spriteId].data[2] = 0;
        gSprites[spriteId].data[3] = 136;
    }
}

static void sub_813E804(struct Sprite *sprite)
{
    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->invisible = gSprites[sprite->data[0]].invisible;
        sprite->data[7]++;
        if (sprite->data[3] < 40)
            sprite->data[3] += 2;

        sprite->pos1.x = gSprites[sprite->data[0]].pos1.x + gSprites[sprite->data[0]].pos2.x + gSineTable[(u8)(sprite->data[1] + 64)] * sprite->data[3] / 256;
        sprite->pos1.y = gSprites[sprite->data[0]].pos1.y + gSprites[sprite->data[0]].pos2.y + gSineTable[(u8)(sprite->data[1] + 0)] * sprite->data[3] / 512;
        sprite->data[1] += 2;
        sprite->pos2.y = gSineTable[(u8)(sprite->data[2] + 0)] / 32;
        sprite->data[2] += 8;
        if ((sprite->data[1] & 0xFF) < 128)
            sprite->subpriority = gSprites[sprite->data[0]].subpriority - 1;
        else
            sprite->subpriority = gSprites[sprite->data[0]].subpriority + 1;
    }
}

static void sub_813E930(u8 a)
{
    u8 i;
    u8 spriteId;

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_840B124, gSprites[a].pos1.x, gSprites[a].pos1.y, 0);
        if (spriteId != 64)
        {
            gSprites[spriteId].data[0] = a;
            gSprites[spriteId].data[1] = i * 32;
        }
    }
}

static void sub_813E980(struct Sprite *sprite)
{
    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        u8 r0;
        u16 matrixNum;

        sprite->invisible = gSprites[sprite->data[0]].invisible;
        sprite->data[7]++;
        sprite->data[6] += 8;
        sprite->pos1.x = sprite->data[4] + gSineTable[(u8)(sprite->data[3] + 64)] * sprite->data[6] / 256;
        sprite->pos1.y = sprite->data[5] + gSineTable[(u8)(sprite->data[3] + 0)] * sprite->data[6] / 256;
        r0 = sprite->data[6] / 16;
        if (r0 > 9)
            r0 = 9;
        matrixNum = (r0 + 18) & 31;
        sprite->oam.matrixNum = matrixNum;
        if (sprite->data[6] > 160)
            DestroySprite(sprite);
    }
}

static void sub_813EA60(struct Sprite *sprite)
{
    bool32 r6;
    s16 r1, r2;
    u8 spriteId;

    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->data[7]++;
        sprite->invisible = 1;
        if (gSprites[sprite->data[0]].data[0] == 1)
        {
            r6 = (sprite->data[7] & 1);
            if (!r6)
            {
                r1 = sprite->data[1] + gSprites[sprite->data[0]].pos1.x;
                r2 = sprite->data[2] + gSprites[sprite->data[0]].pos1.y;
                spriteId = CreateSprite(&gSpriteTemplate_840B150, r1, r2, gSprites[sprite->data[0]].subpriority + 1);
                if (spriteId != 64)
                {
                    gSprites[spriteId].oam.affineMode = 3;
                    gSprites[spriteId].oam.matrixNum = 18;
                    CalcCenterToCornerVec(&gSprites[spriteId], 0, 1, 3);
                    gSprites[spriteId].data[0] = sprite->data[0];
                    gSprites[spriteId].data[3] = gUnknown_0840B168[(sprite->data[7] >> 1) & 7];
                    gSprites[spriteId].data[4] = r1;
                    gSprites[spriteId].data[5] = r2;
                    gSprites[spriteId].data[6] = r6;
                }
            }
        }
    }
}

static void InitIntroTorchicAttackAnim(u8 a)
{
    u8 spriteId;
    u8 i;

    spriteId = CreateSprite(&gSpriteTemplate_840B170, 0, 0, 0);
    if (spriteId != 64)
    {
        gSprites[spriteId].data[0] = a;
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].data[2] = 8;
        gSprites[spriteId].data[3] = 24;
    }
    for (i = 0; i < 10; i++)
    {
        SetOamMatrix(18 + i, gUnknown_0840B188[i], 0, 0, gUnknown_0840B188[i]);
    }
}

static void sub_813EBBC(struct Sprite *sprite)
{
    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->invisible = gSprites[sprite->data[0]].invisible;
        sprite->data[7] += 1;
        sprite->data[6] += 8;
        sprite->pos1.x = sprite->data[4] + gSineTable[(u8)(sprite->data[3] + 64)] * sprite->data[6] / 256;
        sprite->pos1.y = sprite->data[5] + gSineTable[(u8)(sprite->data[3] + 0)] * sprite->data[6] / 256;
        sprite->pos2.y = gSineTable[(u8)(sprite->data[1] + 0)] / 64;
        sprite->data[1] += 16;
        if (sprite->pos1.y < sprite->data[2])
            DestroySprite(sprite);
    }
}

static void sub_813EC90(struct Sprite *sprite)
{
    bool32 r6;
    s16 r1, r2;
    u8 spriteId;
    u16 foo;

    if (gUnknown_0203931A != 0)
    {
        DestroySprite(sprite);
    }
    else
    {
        sprite->data[7]++;
        sprite->invisible = 1;
        if (gSprites[sprite->data[0]].data[0] == 1)
        {
            r6 = sprite->data[7] & 1;
            if (!r6)
            {
                r1 = sprite->data[1] + gSprites[sprite->data[0]].pos1.x;
                r2 = sprite->data[2] + gSprites[sprite->data[0]].pos1.y;
                spriteId = CreateSprite(&gSpriteTemplate_840B1B0, r1, r2, gSprites[sprite->data[0]].subpriority + 1);
                if (spriteId != 64)
                {
                    gSprites[spriteId].oam.affineMode = 3;
                    gSprites[spriteId].oam.matrixNum = 17;
                    CalcCenterToCornerVec(&gSprites[spriteId], 0, 1, 3);
                    gSprites[spriteId].data[0] = sprite->data[0];
                    gSprites[spriteId].data[1] = ((sprite->data[7] >> 2) & 7) << 5;
                    gSprites[spriteId].data[2] = sprite->data[3];
                    gSprites[spriteId].data[3] = 232;
                    gSprites[spriteId].data[4] = r1;
                    gSprites[spriteId].data[5] = r2;
                    gSprites[spriteId].data[6] = r6;
                }
            }
            if (sprite->data[6] < 112)
                sprite->data[6] += 4;
        }
        foo = 256 - gSineTable[(u8)sprite->data[6]] / 2;
        SetOamMatrix(17, foo, 0, 0, foo);
    }
}

static void InitIntroMudkipAttackAnim(u8 a)
{
    u8 spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_840B1C8, 0, 0, 0);
    if (spriteId != 64)
    {
        gSprites[spriteId].data[0] = a;
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].data[2] = 12;
        gSprites[spriteId].data[3] = 24;
    }
}

static void sub_813EDFC(struct Sprite *sprite)
{
    u16 foo;



    switch (sprite->data[0])
    {
    case 0:
    default:
        sprite->invisible = 0;
        sprite->oam.affineMode = 3;
        sprite->oam.matrixNum = 18;
        CalcCenterToCornerVec(sprite, 0, 3, 3);
        sprite->data[1] = 0;
        sprite->data[0] = 1;

    case 1:
        break;
    }
    sprite->data[7]++;
    if (sprite->data[7] & 1)
    {
        sprite->invisible = 1;
    }
    else
    {
        sprite->invisible = 0;
        if (sprite->data[1] < 64)
            sprite->data[1]++;
    }
    foo = 256 - gSineTable[(u8)sprite->data[1]] / 2;
    SetOamMatrix(18, foo, 0, 0, foo);
}
