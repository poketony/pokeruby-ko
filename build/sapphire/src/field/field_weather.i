# 1 "src/field/field_weather.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/field_weather.c"
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
# 2 "src/field/field_weather.c" 2
# 1 "include/blend_palette.h" 1



void BlendPalette(u16 palOffset, u16 numEntries, u8 coeff, u16 blendColor);
# 3 "src/field/field_weather.c" 2
# 1 "include/field_map_obj.h" 1





extern const u8 gUnknown_0830FD14[];
# 30 "include/field_map_obj.h"
struct PairedPalettes
{
    u16 tag;
    const u16 *data;
};

extern const u16 gMapObjectPalette19[];

extern const u32 gMapObjectPic_MovingBox[32];
extern const struct SpriteFrameImage gMapObjectPicTable_PechaBerryTree[];

void sub_805C058(struct MapObject *mapObject, s16 a, s16 b);
void FieldObjectSetDirection(struct MapObject *pObject, u8 unk_18);
void MoveCoords(u8 direction, s16 *x, s16 *y);
void meta_step(struct MapObject *pObject, struct Sprite *pSprite, u8 (*d8)(struct MapObject *, struct Sprite *));
void npc_reset(struct MapObject *mapObject, struct Sprite *sprite);

u8 sub_805CAAC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CADC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CAEC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CB00(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CB5C(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CBB8(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CC14(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CC70(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CCAC(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CCE8(s16 a0, s16 a1, s16 a2, s16 a3);
u8 sub_805CD24(s16 a0, s16 a1, s16 a2, s16 a3);

u8 sub_805F3EC(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 sub_805F3F0(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 sub_805F438(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 sub_805F4F0(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 sub_805F5A8(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 sub_805F660(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 cph_IM_DIFFERENT(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 sub_805F760(struct MapObject *, struct Sprite *, u8, bool8(u8));
u8 oac_hopping(struct MapObject *, struct Sprite *, u8, bool8(u8));

extern struct CameraSomething gUnknown_03004880;
extern u16 gUnknown_03004898;
extern u16 gUnknown_0300489C;

extern const struct Coords16 gDirectionToVector[];

void FieldObjectCB_BerryTree(struct Sprite *);
void FieldObjectCB_Hidden1(struct Sprite *);
void FieldObjectCB_MountainDisguise(struct Sprite *);
void FieldObjectCB_TreeDisguise(struct Sprite *);
void sub_80587B4(struct Sprite *);
void sub_805C884(struct Sprite *);
void sub_805C8AC(struct Sprite *);
void sub_805CDE8(struct Sprite *);
void sub_805CF28(struct Sprite *);
void sub_805D0AC(struct Sprite *);
void sub_805D230(struct Sprite *);
void sub_805D4F4(struct Sprite *);
void sub_805D634(struct Sprite *);
void sub_805D774(struct Sprite *);
void sub_805D8B4(struct Sprite *);
void sub_805D9F4(struct Sprite *);
void sub_805DB34(struct Sprite *);
void sub_805DC74(struct Sprite *);
void sub_805DDB4(struct Sprite *);
void sub_805DEF4(struct Sprite *);
void sub_805E034(struct Sprite *);
void sub_805E174(struct Sprite *);
void sub_805E278(struct Sprite *);
void sub_805E37C(struct Sprite *);
void sub_805E5DC(struct Sprite *);
void sub_805E668(struct Sprite *);
void sub_805E6F4(struct Sprite *);
void sub_805E780(struct Sprite *);
void sub_805E80C(struct Sprite *);
void sub_805E898(struct Sprite *);
void sub_805E924(struct Sprite *);
void sub_805E9B0(struct Sprite *);
void sub_805EA3C(struct Sprite *);
void sub_805EAC8(struct Sprite *);
void sub_805EB54(struct Sprite *);
void sub_805EBE0(struct Sprite *);
void sub_805EC6C(struct Sprite *);
void sub_805ECF8(struct Sprite *);
void sub_805ED84(struct Sprite *);
void sub_805EE10(struct Sprite *);
void sub_805EE9C(struct Sprite *);
void sub_805EF28(struct Sprite *);
void sub_805EFB4(struct Sprite *);
void sub_805F040(struct Sprite *);
void sub_805F0CC(struct Sprite *);
void sub_805F158(struct Sprite *);
void sub_805F1E4(struct Sprite *);
void sub_805F270(struct Sprite *);
void sub_805F2FC(struct Sprite *);
void sub_805F8E0(struct Sprite *);
void sub_805FB20(struct Sprite *);
void sub_805FB90(struct Sprite *);
void sub_805FC00(struct Sprite *);
void sub_805FC70(struct Sprite *);

u8 sub_805C8F0(struct MapObject *, struct Sprite *);
u8 sub_805C904(struct MapObject *, struct Sprite *);
u8 sub_805C930(struct MapObject *, struct Sprite *);
u8 sub_805C96C(struct MapObject *, struct Sprite *);
u8 sub_805C98C(struct MapObject *, struct Sprite *);
u8 sub_805C9D8(struct MapObject *, struct Sprite *);
u8 sub_805CA08(struct MapObject *, struct Sprite *);
u8 sub_805CE2C(struct MapObject *, struct Sprite *);
u8 sub_805CE40(struct MapObject *, struct Sprite *);
u8 sub_805CE6C(struct MapObject *, struct Sprite *);
u8 sub_805CEB0(struct MapObject *, struct Sprite *);
u8 sub_805CEE0(struct MapObject *, struct Sprite *);
u8 sub_805CF6C(struct MapObject *, struct Sprite *);
u8 sub_805CF80(struct MapObject *, struct Sprite *);
u8 sub_805CFAC(struct MapObject *, struct Sprite *);
u8 sub_805CFE8(struct MapObject *, struct Sprite *);
u8 sub_805D008(struct MapObject *, struct Sprite *);
u8 sub_805D054(struct MapObject *, struct Sprite *);
u8 sub_805D084(struct MapObject *, struct Sprite *);
u8 sub_805D0F0(struct MapObject *, struct Sprite *);
u8 sub_805D104(struct MapObject *, struct Sprite *);
u8 sub_805D130(struct MapObject *, struct Sprite *);
u8 sub_805D16C(struct MapObject *, struct Sprite *);
u8 sub_805D18C(struct MapObject *, struct Sprite *);
u8 sub_805D1D8(struct MapObject *, struct Sprite *);
u8 sub_805D208(struct MapObject *, struct Sprite *);
u8 sub_805D274(struct MapObject *, struct Sprite *);
u8 sub_805D2A0(struct MapObject *, struct Sprite *);
u8 sub_805D2C0(struct MapObject *, struct Sprite *);
u8 do_berry_tree_growth_sparkle_1(struct MapObject *, struct Sprite *);
u8 sub_805D3EC(struct MapObject *, struct Sprite *);
u8 do_berry_tree_growth_sparkle_2(struct MapObject *, struct Sprite *);
u8 sub_805D458(struct MapObject *, struct Sprite *);
u8 sub_805D4A8(struct MapObject *, struct Sprite *);
u8 sub_805D538(struct MapObject *, struct Sprite *);
u8 sub_805D54C(struct MapObject *, struct Sprite *);
u8 sub_805D578(struct MapObject *, struct Sprite *);
u8 sub_805D5BC(struct MapObject *, struct Sprite *);
u8 sub_805D5EC(struct MapObject *, struct Sprite *);
u8 sub_805D678(struct MapObject *, struct Sprite *);
u8 sub_805D68C(struct MapObject *, struct Sprite *);
u8 sub_805D6B8(struct MapObject *, struct Sprite *);
u8 sub_805D6FC(struct MapObject *, struct Sprite *);
u8 sub_805D72C(struct MapObject *, struct Sprite *);
u8 sub_805D7B8(struct MapObject *, struct Sprite *);
u8 sub_805D7CC(struct MapObject *, struct Sprite *);
u8 sub_805D7F8(struct MapObject *, struct Sprite *);
u8 sub_805D83C(struct MapObject *, struct Sprite *);
u8 sub_805D86C(struct MapObject *, struct Sprite *);
u8 sub_805D8F8(struct MapObject *, struct Sprite *);
u8 sub_805D90C(struct MapObject *, struct Sprite *);
u8 sub_805D938(struct MapObject *, struct Sprite *);
u8 sub_805D97C(struct MapObject *, struct Sprite *);
u8 sub_805D9AC(struct MapObject *, struct Sprite *);
u8 sub_805DA38(struct MapObject *, struct Sprite *);
u8 sub_805DA4C(struct MapObject *, struct Sprite *);
u8 sub_805DA78(struct MapObject *, struct Sprite *);
u8 sub_805DABC(struct MapObject *, struct Sprite *);
u8 sub_805DAEC(struct MapObject *, struct Sprite *);
u8 sub_805DB78(struct MapObject *, struct Sprite *);
u8 sub_805DB8C(struct MapObject *, struct Sprite *);
u8 sub_805DBB8(struct MapObject *, struct Sprite *);
u8 sub_805DBFC(struct MapObject *, struct Sprite *);
u8 sub_805DC2C(struct MapObject *, struct Sprite *);
u8 sub_805DCB8(struct MapObject *, struct Sprite *);
u8 sub_805DCCC(struct MapObject *, struct Sprite *);
u8 sub_805DCF8(struct MapObject *, struct Sprite *);
u8 sub_805DD3C(struct MapObject *, struct Sprite *);
u8 sub_805DD6C(struct MapObject *, struct Sprite *);
u8 sub_805DDF8(struct MapObject *, struct Sprite *);
u8 sub_805DE0C(struct MapObject *, struct Sprite *);
u8 sub_805DE38(struct MapObject *, struct Sprite *);
u8 sub_805DE7C(struct MapObject *, struct Sprite *);
u8 sub_805DEAC(struct MapObject *, struct Sprite *);
u8 sub_805DF38(struct MapObject *, struct Sprite *);
u8 sub_805DF4C(struct MapObject *, struct Sprite *);
u8 sub_805DF78(struct MapObject *, struct Sprite *);
u8 sub_805DFBC(struct MapObject *, struct Sprite *);
u8 sub_805DFEC(struct MapObject *, struct Sprite *);
u8 sub_805E078(struct MapObject *, struct Sprite *);
u8 sub_805E08C(struct MapObject *, struct Sprite *);
u8 sub_805E0B8(struct MapObject *, struct Sprite *);
u8 sub_805E0FC(struct MapObject *, struct Sprite *);
u8 sub_805E12C(struct MapObject *, struct Sprite *);
u8 sub_805E1B8(struct MapObject *, struct Sprite *);
u8 sub_805E1E4(struct MapObject *, struct Sprite *);
u8 sub_805E208(struct MapObject *, struct Sprite *);
u8 sub_805E234(struct MapObject *, struct Sprite *);
u8 sub_805E2BC(struct MapObject *, struct Sprite *);
u8 sub_805E2E8(struct MapObject *, struct Sprite *);
u8 sub_805E30C(struct MapObject *, struct Sprite *);
u8 sub_805E338(struct MapObject *, struct Sprite *);
u8 sub_805E3C0(struct MapObject *, struct Sprite *);
u8 sub_805E3D4(struct MapObject *, struct Sprite *);
u8 sub_805E40C(struct MapObject *, struct Sprite *);
u8 sub_805E4C4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E620(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E6AC(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E738(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E7C4(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E850(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E8DC(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E968(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805E9F4(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EA80(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EB0C(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EB98(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EC24(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805ECB0(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805ED3C(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EDC8(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EE54(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EEE0(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EF6C(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805EFF8(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805F084(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805F110(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805F19C(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805F228(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 sub_805E4EC(struct MapObject *, struct Sprite *);
u8 sub_805F2B4(struct MapObject *, struct Sprite *);
u8 sub_805E5B4(struct MapObject *, struct Sprite *);
u8 mss_npc_reset_oampriv3_1_unk2_unk3(struct MapObject *, struct Sprite *);
u8 sub_805F364(struct MapObject *, struct Sprite *);
u8 sub_805F3C4(struct MapObject *, struct Sprite *);
u8 mss_npc_reset_oampriv3_1_unk2_unk3(struct MapObject *, struct Sprite *);
u8 mss_08062EA4(struct MapObject *, struct Sprite *);
u8 sub_805F3C4(struct MapObject *, struct Sprite *);
u8 sub_805FAF8(struct MapObject *, struct Sprite *);
u8 sub_805FB64(struct MapObject *, struct Sprite *);
u8 sub_805FB04(struct MapObject *, struct Sprite *);
u8 sub_805FBD4(struct MapObject *, struct Sprite *);
u8 sub_805FB04(struct MapObject *, struct Sprite *);
u8 sub_805FC44(struct MapObject *, struct Sprite *);
u8 sub_805FB04(struct MapObject *, struct Sprite *);
u8 sub_805FCB4(struct MapObject *, struct Sprite *);
u8 sub_805FCE8(struct MapObject *, struct Sprite *);
u8 sub_805FD08(struct MapObject *, struct Sprite *);

u8 get_go_image_anim_num(u8);
u8 get_go_fast_image_anim_num(u8);
u8 get_go_fast_image_anim_num(u8);
u8 get_go_faster_image_anim_num(u8);
u8 sub_805FD78(u8);

u32 state_to_direction(u8, u32, u32);

void sub_805AA98();
void sub_805AAB0(void);
u8 sub_805AB54(void);
u8 GetFieldObjectIdByLocalIdAndMap(u8, u8, u8);
bool8 TryGetFieldObjectIdByLocalIdAndMap(u8, u8, u8, u8 *);
u8 GetFieldObjectIdByXY(s16, s16);
u8 GetFieldObjectIdByLocalIdAndMapInternal(u8, u8, u8);
u8 GetFieldObjectIdByLocalId(u8);
u8 GetAvailableFieldObjectSlot(u16, u8, u8, u8 *);
void RemoveFieldObjectByLocalIdAndMap(u8, u8, u8);
void RemoveFieldObjectInternal(struct MapObject *);
u8 SpawnSpecialFieldObject(struct MapObjectTemplate *);
u8 show_sprite(u8, u8, u8);
void MakeObjectTemplateFromFieldObjectTemplate(struct MapObjectTemplate *mapObjTemplate, struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables);
u8 AddPseudoFieldObject(u16 graphicsId, void (*callback)(struct Sprite *), s16 c, s16 d, u8 subpriority);
u8 sub_805B410(u8, u8, s16, s16, u8, u8);
void sub_805B55C(s16 a, s16 b);
void sub_805B710(u16 i, u16 i1);
void sub_805B980(struct MapObject *, u8);
void FieldObjectTurn(struct MapObject *, u8);
void FieldObjectTurnByLocalIdAndMap(u8, u8, u8, u8);
const struct MapObjectGraphicsInfo *GetFieldObjectGraphicsInfo(u8);
void FieldObjectHandleDynamicGraphicsId(struct MapObject *);
void npc_by_local_id_and_map_set_field_1_bit_x20(u8, u8, u8, u8);
void FieldObjectGetLocalIdAndMap(struct MapObject *, void *, void *, void *);
void sub_805BCC0(s16 x, s16 y);
void sub_805BCF0(u8, u8, u8, u8);
void sub_805BD48(u8, u8, u8);
void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);
void gpu_pal_allocator_reset__manage_upper_four(void);
void sub_805BDF8(u16);
u8 sub_805BE58(const struct SpritePalette *);
void pal_patch_for_npc(u16, u16);
u8 FindFieldObjectPaletteIndexByTag(u16);
void npc_load_two_palettes__no_record(u16, u8);
void npc_load_two_palettes__and_record(u16, u8);
void npc_coords_shift(struct MapObject *pObject, s16 x, s16 y);
void sub_805C0F8(u8, u8, u8, s16, s16);
void npc_coords_shift_still(struct MapObject *pObject);
u8 GetFieldObjectIdByXYZ(u16, u16, u8);
void UpdateFieldObjectsForCameraUpdate(s16, s16);
u8 AddCameraObject(u8);
void CameraObjectReset1(void);
u8 * GetFieldObjectScriptPointerByFieldObjectId(u8);
u16 GetFieldObjectFlagIdByFieldObjectId(u8);
u8 FieldObjectGetBerryTreeId(u8);
struct MapObjectTemplate *GetFieldObjectTemplateByLocalIdAndMap(u8, u8, u8);
void sub_805C754(struct MapObject *pObject);
void sub_805C774(struct MapObject *, u8);
void sub_805C78C(u8, u8, u8);
void sub_805C7C4(u8 i);
u8 FieldObjectDirectionToImageAnimId(u8);
u8 get_go_image_anim_num(u8 unk_19);
u8 sub_805FD98(u8);
u8 sub_805FDE8(u8);
u8 sub_805FDF8(u8);
u8 sub_805FE08(u8);
void npc_set_running_behaviour_etc(struct MapObject *, u8);
u8 npc_running_behaviour_by_direction(u8);
u8 npc_block_way(struct MapObject *, s16, s16, u32);
u8 sub_8060024(struct MapObject *, s16, s16, u8);
bool8 IsBerryTreeSparkling(u8, u8, u8);
void sub_8060288(u8, u8, u8);
void sub_8060388(s16, s16, s16 *, s16 *);
void sub_80603CC(s16 x, s16 y, s16 *pInt, s16 *pInt1);
void GetFieldObjectMovingCameraOffset(s16 *, s16 *);
void FieldObjectMoveDestCoords(struct MapObject *pObject, u32 unk_19, s16 *pInt, s16 *pInt1);
bool8 FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(struct MapObject *);
bool8 FieldObjectIsSpecialAnimActive(struct MapObject *);
bool8 FieldObjectSetSpecialAnim(struct MapObject *, u8);
void FieldObjectForceSetSpecialAnim(struct MapObject *pObject, u8 a);
void FieldObjectClearAnimIfSpecialAnimActive(struct MapObject *);
void FieldObjectClearAnim(struct MapObject *);
bool8 FieldObjectCheckIfSpecialAnimFinishedOrInactive(struct MapObject *);
u8 FieldObjectClearAnimIfSpecialAnimFinished(struct MapObject *);
u8 FieldObjectGetSpecialAnim(struct MapObject *);
u8 GetFaceDirectionAnimId(u32);
u8 GetSimpleGoAnimId(u32);
u8 GetGoSpeed0AnimId(u32);
u8 sub_8060744(u32);
u8 d2s_08064034(u32);
u8 sub_806079C(u32);
u8 sub_80607C8(u32);
u8 sub_80607F4(u32);
u8 GetJumpLedgeAnimId(u32);
u8 sub_806084C(u32);
u8 sub_8060878(u32);
u8 sub_80608A4(u32);
u8 sub_80608D0(u32);
u8 GetStepInPlaceDelay32AnimId(u32);
u8 GetStepInPlaceDelay16AnimId(u32);
u8 GetStepInPlaceDelay8AnimId(u32);
u8 GetStepInPlaceDelay4AnimId(u32);
u8 FieldObjectFaceOppositeDirection(struct MapObject *, u8);
u8 sub_80609D8(u8);
u8 sub_8060A04(u8);
u8 sub_8060A30(u8);
u8 sub_8060A5C(u8);
u8 sub_8060A88(u8);
u8 sub_8060AB4(u8);
u8 sub_8060AE0(u8);
u8 sub_8060B0C(u8);
u8 sub_8060B38(u8);
u8 sub_8060B64(u8);
u8 GetOppositeDirection(u8);
void sub_80634D0(struct MapObject *, struct Sprite *);
u8 SpawnSpecialFieldObjectParametrized(u8, u8, u8, s16, s16, u8);
void CameraObjectSetFollowedObjectId(u8);
u8 sub_805ADDC(u8);
void sub_8060320(u32, s16 *, s16 *, s16, s16);
u8 obj_unfreeze(struct Sprite *, s16, s16, u8);
u16 npc_paltag_by_palslot(u8);
void sub_8060470(s16 *, s16 *, s16, s16);
# 4 "src/field/field_weather.c" 2
# 1 "include/field_weather.h" 1



void sub_807C828(void);
void DoWeatherEffect(u8 effect);
void sub_807C988(u8 effect);
void sub_807C9B4(u8 effect);
void sub_807C9E4(u8);
void sub_807CA34(u8);
void sub_807CAE8(void);
void nullsub_38(void);
u32 sub_807CB0C(void);
void sub_807CB10(void);
void sub_807CC24(void);
void sub_807CCAC(void);
u8 sub_807CDC4(void);
u8 sub_807CE24(void);
u8 sub_807CE7C(void);
void nullsub_39(void);


void sub_807CEBC(u8, u8, s8);

void sub_807D1BC(u8 a, u8 a2, s8 c, u8 d, u16 e);
void sub_807D304(s8 a, u8 arg2, u16 c);
void sub_807D424(u8, u16);

void fade_screen(u8, u8);

void sub_807D78C(u8 tag);
void sub_807D874(u8);

void sub_807DB64(u8, u8);

void sub_807DE68(void);

void PlayRainSoundEffect(void);

void SetSav1Weather(u32);
u8 GetSav1Weather(void);
void sub_80806E4(void);

void DoCurrentWeather(void);
void sub_8080750();

bool8 sub_807D770(void);
bool8 sub_807DDFC(void);
void SetWeather(u32);
void UpdateWeatherPerDay(u16);
# 5 "src/field/field_weather.c" 2
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
# 6 "src/field/field_weather.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 7 "src/field/field_weather.c" 2
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
# 8 "src/field/field_weather.c" 2
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
# 9 "src/field/field_weather.c" 2
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
# 10 "src/field/field_weather.c" 2
# 1 "include/sprite.h" 1
# 11 "src/field/field_weather.c" 2
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
# 12 "src/field/field_weather.c" 2
# 1 "include/trig.h" 1



extern const s16 gSineTable[];

s16 Sin(s16 index, s16 amplitude);
s16 Cos(s16 index, s16 amplitude);
s16 Sin2(u16 angle);
s16 Cos2(u16 angle);
# 13 "src/field/field_weather.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 14 "src/field/field_weather.c" 2



struct RGBColor
{
    u16 r:5;
    u16 g:5;
    u16 b:5;
};

struct WeatherPaletteData
{
    u16 data[0][0x1000];
};

struct Weather
{
    struct Sprite *unknown_0[24];
    struct Sprite *unknown_60[0x65];
    struct Sprite *unknown_1F4[3];
    u8 unknown_200[2][32];
    u8 filler_240[0x460-0x240];
    u8 unk460[2][32];
    u8 filler4A0[0x6B6-0x4A0];
    s8 unknown_6B6;
    u8 filler_6B7[0xC0-0xB7];
    s8 unknown_6C0;
    s8 unknown_6C1;
    u8 unknown_6C2;
    u8 unknown_6C3;
    u16 unknown_6C4;
    u8 unknown_6C6;
    u8 unknown_6C7;
    u8 unknown_6C8;
    u8 unknown_6C9;
    u8 unknown_6CA;
    u8 unknown_6CB;
    u16 unknown_6CC;
    u16 unknown_6CE;
    u8 unknown_6D0;
    u8 unknown_6D1;
    u8 unknown_6D2;
    u8 unknown_6D3;
    u8 unknown_6D4;
    u8 unknown_6D5;
    u16 unknown_6D6;
    u8 unknown_6D8;
    u8 unknown_6D9;
    u8 unknown_6DA;
    u8 unknown_6DB;
    u8 unknown_6DC;
    u8 unknown_6DD;
    u8 unknown_6DE;
    u8 filler_6DF[1];
    u16 unknown_6E0;
    u16 unknown_6E2;
    u8 unknown_6E4;
    u8 unknown_6E5;
    u16 unknown_6E6;
    u16 unknown_6E8;
    u8 unknown_6EA;
    u8 unknown_6EB;
    u8 unknown_6EC;
    u8 unknown_6ED;
    u16 unknown_6EE;
    u16 unknown_6F0;
    u16 unknown_6F2;
    u8 unknown_6F4[6];
    u8 unknown_6FA;
    u8 unknown_6FB;
    u8 filler_6FC[4];
    u8 unknown_700;
    u8 filler_701[0x15];
    u8 unknown_716;
    u8 unknown_717;
    u8 filler_718[0xc];
    u8 unknown_724;
    u8 filler_725[9];
    u8 unknown_72E;
    u8 filler_72F;
    u16 unknown_730;
    u16 unknown_732;
    u16 unknown_734;
    u16 unknown_736;
    u8 unknown_738;
    u8 unknown_739;
    u8 unknown_73A;
    u8 filler_73B[0x3C-0x3B];
    s16 unknown_73C;
    s16 unknown_73E;
    s16 unknown_740;
    s16 unknown_742;
    u8 filler_744[0xD-4];
    s8 unknown_74D;
    u8 unknown_74E;
};


extern struct Weather gUnknown_0202F7E8;
extern u8 gUnknown_0202FF38[];
extern u16 gUnknown_0202FF58;
extern u8 *gUnknown_083970E8;
extern u8 (*gUnknown_08396FC8[][4])(void);
extern u8 (*gUnknown_083970B8[])(void);
__attribute__((section("iwram_data"))) const u8 *gUnknown_030006DC;
extern const u8 gUnknown_083970C8[];



extern struct Weather *const gUnknown_08396FC4;

extern const struct SpriteSheet gUnknown_0839A9D4;
extern const struct SpriteTemplate gSpriteTemplate_839A9F0;
extern const u16 gUnknown_08397108[];

extern const struct Coords16 gUnknown_0839A9C8[];
extern const struct SpriteSheet gUnknown_0839AACC;
extern const struct SpriteTemplate gSpriteTemplate_839AAA4;
extern const struct SpriteTemplate gSpriteTemplate_839AB04;

const u8 DroughtPaletteData_0[] = INCBIN_U8("graphics/weather/drought0.bin.lz");
const u8 DroughtPaletteData_1[] = INCBIN_U8("graphics/weather/drought1.bin.lz");
const u8 DroughtPaletteData_2[] = INCBIN_U8("graphics/weather/drought2.bin.lz");
const u8 DroughtPaletteData_3[] = INCBIN_U8("graphics/weather/drought3.bin.lz");
const u8 DroughtPaletteData_4[] = INCBIN_U8("graphics/weather/drought4.bin.lz");
const u8 DroughtPaletteData_5[] = INCBIN_U8("graphics/weather/drought5.bin.lz");
extern u8 (*gUnknown_0202FC48)[32];
extern u8 gUnknown_0202F9E8[32];

const u8 *const gUnknown_08396FA8[] =
{
    DroughtPaletteData_0,
    DroughtPaletteData_1,
    DroughtPaletteData_2,
    DroughtPaletteData_3,
    DroughtPaletteData_4,
    DroughtPaletteData_5,
    gSharedMem,
};

void sub_807C828(void)
{
    u8 index;
    if (!FuncIsActiveTask(&sub_807CA34))
    {
        index = AllocSpritePalette(0x1200);
        CpuSet(&gUnknown_083970E8, &gPlttBufferUnfaded[0x100 + index * 16], 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
        sub_807CB10();
        gUnknown_0202F7E8.unknown_6D5 = index;
        gUnknown_0202F7E8.unknown_6D4 = AllocSpritePalette(0x1201);
        gUnknown_0202F7E8.unknown_6DA = 0;
        gUnknown_0202F7E8.unknown_6D8 = 0;
        gUnknown_0202F7E8.unknown_6DE = 0;
        gUnknown_0202F7E8.unknown_6E4 = 0;
        gUnknown_0202F7E8.unknown_700 = 0;
        gUnknown_0202F7E8.unknown_6FB = 0;
        gUnknown_0202F7E8.unknown_724 = 0;
        gUnknown_0202F7E8.unknown_716 = 0;
        gUnknown_0202F7E8.unknown_717 = 0;
        gUnknown_0202F7E8.unknown_72E = 0;
        gUnknown_0202F7E8.unknown_6FA = 0;
        sub_807DB64(16, 0);
        gUnknown_0202F7E8.unknown_6D0 = 0;
        gUnknown_0202F7E8.unknown_6C6 = 3;
        gUnknown_0202F7E8.unknown_6C8 = 0;
        gUnknown_0202F7E8.unknown_6D3 = 1;
        gUnknown_0202F7E8.unknown_6C9 = CreateTask(sub_807C9E4, 80);
    }
}

void DoWeatherEffect(u8 effect)
{
    if (effect != 3 && effect != 5 && effect != 13)
    {
        PlayRainSoundEffect();
    }
    if (gUnknown_0202F7E8.unknown_6D1 != effect && gUnknown_0202F7E8.unknown_6D0 == effect)
    {
        gUnknown_08396FC8[effect][0]();
    }
    gUnknown_0202F7E8.unknown_6D3 = 0;
    gUnknown_0202F7E8.unknown_6D1 = effect;
    gUnknown_0202F7E8.unknown_6CE = 0;
}

void sub_807C988(u8 effect)
{
    PlayRainSoundEffect();
    gUnknown_0202F7E8.unknown_6D0 = effect;
    gUnknown_0202F7E8.unknown_6D1 = effect;
}

void sub_807C9B4(u8 effect)
{
    PlayRainSoundEffect();
    gUnknown_0202F7E8.unknown_6D0 = effect;
    gUnknown_0202F7E8.unknown_6D1 = effect;
    gUnknown_0202F7E8.unknown_6C8 = 1;
}

void sub_807C9E4(u8 taskId)
{
    if (gUnknown_0202F7E8.unknown_6C8)
    {
        gUnknown_08396FC8[gUnknown_0202F7E8.unknown_6D0][2]();
        gTasks[taskId].func = sub_807CA34;
    }
}

void sub_807CA34(u8 task)
{
    u8 v1;
    if (gUnknown_0202F7E8.unknown_6D0 != gUnknown_0202F7E8.unknown_6D1)
    {
        v1 = gUnknown_08396FC8[gUnknown_0202F7E8.unknown_6D0][3]();
        if (!v1)
        {
            gUnknown_08396FC8[gUnknown_0202F7E8.unknown_6D1][0]();
            gUnknown_0202F7E8.unknown_6C3 = 0;
            gUnknown_0202F7E8.unknown_6C6 = 0;
            gUnknown_0202F7E8.unknown_6D0 = gUnknown_0202F7E8.unknown_6D1;
            gUnknown_0202F7E8.unknown_6D3 = 1;
        }
    }
    else
    {
        gUnknown_08396FC8[gUnknown_0202F7E8.unknown_6D0][1]();
    }
    gUnknown_083970B8[gUnknown_0202F7E8.unknown_6C6]();
}

void sub_807CAE8(void)
{
    gUnknown_0202F7E8.unknown_6C1 = 0;
    gUnknown_0202F7E8.unknown_6C2 = 0;
}

void nullsub_38(void)
{
}

u32 sub_807CB0C(void)
{
    return 0;
}

void sub_807CB10(void)
{
    u16 v0;
    u8 (*v1)[32];
    u16 v2;
    u16 v4;
    u16 v5;
    u16 v6;
    u16 v9;
    u32 v10;
    u16 v11;
    s16 dunno;

    gUnknown_030006DC = gUnknown_083970C8;
    for (v0 = 0; v0 <= 1; v0++)
    {
        if (v0 == 0)
            v1 = gUnknown_0202F7E8.unknown_200;
        else
            v1 = gUnknown_0202F7E8.unk460;

        for (v2 = 0; (u16)v2 <= 0x1f; v2++)
        {
            v4 = v2 << 8;
            if (v0 == 0)
                v5 = (v2 << 8) / 16;
            else
                v5 = 0;
            for (v6 = 0; v6 <= 2; v6++)
            {
                v4 = (v4 - v5);
                v1[v6][v2] = v4 >> 8;
            }
            v9 = v4;
            v10 = 0x1f00 - v4;
            if ((0x1f00 - v4) < 0)
            {
                v10 += 0xf;
            }
            v11 = v10 >> 4;
            if (v2 <= 0xb)
            {
                for (; v6 <= 0x12; v6++)
                {
                    v4 += v11;
                    dunno = v4 - v9;
                    if (dunno > 0)
                    {
                        v4 -= (dunno + ((u16)dunno >> 15)) >> 1;
                    }
                    v1[v6][v2] = v4 >> 8;
                    if (v1[v6][v2] > 0x1f)
                    {
                        v1[v6][v2] = 0x1f;
                    }
                }
            }
            else
            {
                for (; v6 <= 0x12; v6++)
                {
                    v4 += v11;
                    v1[v6][v2] = v4 >> 8;
                    if (v1[v6][v2] > 0x1f)
                    {
                        v1[v6][v2] = 0x1f;
                    }
                }
            }
        }
    }
}

void sub_807CC24(void)
{
    if (gUnknown_0202F7E8.unknown_6C0 == gUnknown_0202F7E8.unknown_6C1)
    {
        gUnknown_0202F7E8.unknown_6C6 = 3;
    }
    else
    {
        if (++gUnknown_0202F7E8.unknown_6C3 >= gUnknown_0202F7E8.unknown_6C2)
        {
            gUnknown_0202F7E8.unknown_6C3 = 0;
            if (gUnknown_0202F7E8.unknown_6C0 < gUnknown_0202F7E8.unknown_6C1)
                gUnknown_0202F7E8.unknown_6C0++;
            else
                gUnknown_0202F7E8.unknown_6C0--;
            sub_807CEBC(0, 0x20, gUnknown_0202F7E8.unknown_6C0);
        }
    }
}

void sub_807CCAC(void)
{
    if (++gUnknown_0202F7E8.unknown_6CB > 1)
        gUnknown_0202F7E8.unknown_6CA = 0;
    switch (gUnknown_0202F7E8.unknown_6D0)
    {
    case 3:
    case 4:
    case 5:
    case 11:
    case 13:
        if (sub_807CDC4() == 0)
        {
            gUnknown_0202F7E8.unknown_6C0 = 3;
            gUnknown_0202F7E8.unknown_6C6 = 3;
        }
        break;
    case 12:
        if (sub_807CE24() == 0)
        {
            gUnknown_0202F7E8.unknown_6C0 = -6;
            gUnknown_0202F7E8.unknown_6C6 = 3;
        }
        break;
    case 6:
        if (sub_807CE7C() == 0)
        {
            gUnknown_0202F7E8.unknown_6C0 = 0;
            gUnknown_0202F7E8.unknown_6C6 = 3;
        }
        break;
    case 7:
    case 8:
    case 9:
    case 10:
    default:
        if (!gPaletteFade.active)
        {
            gUnknown_0202F7E8.unknown_6C0 = gUnknown_0202F7E8.unknown_6C1;
            gUnknown_0202F7E8.unknown_6C6 = 3;
        }
        break;
    }
}

u8 sub_807CDC4(void)
{
    if (gUnknown_0202F7E8.unknown_6C7 == 0x10)
        return 0;
    if (++gUnknown_0202F7E8.unknown_6C7 >= 0x10)
    {
        sub_807CEBC(0, 0x20, 3);
        gUnknown_0202F7E8.unknown_6C7 = 0x10;
        return 0;
    }
    sub_807D1BC(0, 0x20, 3, 0x10 - gUnknown_0202F7E8.unknown_6C7, gUnknown_0202F7E8.unknown_6C4);
    return 1;
}

u8 sub_807CE24(void)
{
    if (gUnknown_0202F7E8.unknown_6C7 == 0x10)
        return 0;
    if (++gUnknown_0202F7E8.unknown_6C7 >= 0x10)
    {
        sub_807CEBC(0, 0x20, -6);
        gUnknown_0202F7E8.unknown_6C7 = 0x10;
        return 0;
    }
    sub_807D304(-6, 0x10 - gUnknown_0202F7E8.unknown_6C7, gUnknown_0202F7E8.unknown_6C4);
    return 1;
}

u8 sub_807CE7C(void)
{
    if (gUnknown_0202F7E8.unknown_6C7 == 0x10)
        return 0;
    ++gUnknown_0202F7E8.unknown_6C7;
    sub_807D424(0x10 - gUnknown_0202F7E8.unknown_6C7, gUnknown_0202F7E8.unknown_6C4);
    return 1;
}

void nullsub_39(void)
{
}

void sub_807CEBC(u8 a, u8 b, s8 c)
{
    u16 r4;
    u16 palOffset;
    u8 *r6;
    u16 i;

    if (c > 0)
    {
        c = c - 1;
        palOffset = a * 16;
        b += a;
        r4 = a;
        while (r4 < b)
        {
            if (gUnknown_030006DC[r4] == 0)
            {
                CpuFastSet(gPlttBufferUnfaded + palOffset, gPlttBufferFaded + palOffset, ((16 * sizeof(u16))/(32/8) & 0x1FFFFF));
                palOffset += 16;
            }
            else
            {
                u8 r, g, b;

                if (gUnknown_030006DC[r4] == 2 || r4 - 16 == gUnknown_0202F7E8.unknown_6D5)
                    r6 = gUnknown_0202F7E8.unk460[c];
                else
                    r6 = gUnknown_0202F7E8.unknown_200[c];
                if (r4 == 16 || r4 > 0x1B)
                {
                    for (i = 0; i < 16; i++)
                    {
                        if (gPlttBufferUnfaded[palOffset] == 0x2D9F)
                        {
                            palOffset++;
                        }
                        else
                        {
                            struct RGBColor color = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];

                            r = r6[color.r];
                            g = r6[color.g];
                            b = r6[color.b];
                            gPlttBufferFaded[palOffset++] = (b << 10) | (g << 5) | r;
                        }
                    }
                }
                else
                {
                    for (i = 0; i < 16; i++)
                    {
                        struct RGBColor color = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];

                        r = r6[color.r];
                        g = r6[color.g];
                        b = r6[color.b];
                        gPlttBufferFaded[palOffset++] = (b << 10) | (g << 5) | r;
                    }
                }
            }
            r4++;
        }
    }
    else if (c < 0)
    {
        c = -c - 1;
        palOffset = a * 16;
        b += a;
        r4 = a;
        while (r4 < b)
        {
            if (gUnknown_030006DC[r4] == 0)
            {
                CpuFastSet(gPlttBufferUnfaded + palOffset, gPlttBufferFaded + palOffset, ((16 * sizeof(u16))/(32/8) & 0x1FFFFF));
                palOffset += 16;
            }
            else
            {
                if (r4 == 16 || r4 > 0x1B)
                {
                    for (i = 0; i < 16; i++)
                    {
                        if (gPlttBufferUnfaded[palOffset] != 0x2D9F)
                            gPlttBufferFaded[palOffset] = (*(struct WeatherPaletteData *)gSharedMem).data[c][((((gPlttBufferUnfaded[palOffset]) >> 1) & 0xF) | (((gPlttBufferUnfaded[palOffset]) >> 2) & 0xF0) | (((gPlttBufferUnfaded[palOffset]) >> 3) & 0xF00))];
                        palOffset++;
                    }
                }
                else
                {
                    for (i = 0; i < 16; i++)
                    {
                        gPlttBufferFaded[palOffset] = (*(struct WeatherPaletteData *)gSharedMem).data[c][((((gPlttBufferUnfaded[palOffset]) >> 1) & 0xF) | (((gPlttBufferUnfaded[palOffset]) >> 2) & 0xF0) | (((gPlttBufferUnfaded[palOffset]) >> 3) & 0xF00))];
                        palOffset++;
                    }
                }
            }
            r4++;
        }
    }
    else
    {
        CpuFastSet(gPlttBufferUnfaded + a * 16, gPlttBufferFaded + a * 16, ((b * 16 * sizeof(u16))/(32/8) & 0x1FFFFF));
    }
}

void sub_807D1BC(u8 a1, u8 a2, s8 c, u8 d, u16 e)
{
    u16 palOffset;
    u16 r4;
    u16 i;
    struct RGBColor color = *(struct RGBColor *)&e;
    u8 r_ = color.r;
    u8 g_ = color.g;
    u8 b_ = color.b;

    palOffset = a1 * 16;
    a2 += a1;
    c = c - 1;
    r4 = a1;
    while (r4 < a2)
    {
        if (gUnknown_030006DC[r4] == 0)
        {
            BlendPalette(palOffset, 16, d, e);
            palOffset += 16;
        }
        else
        {
            u8 *r5;

            if (gUnknown_030006DC[r4] == 1)
                r5 = gUnknown_0202F7E8.unknown_200[c];
            else
                r5 = gUnknown_0202F7E8.unk460[c];

            for (i = 0; i < 16; i++)
            {
                struct RGBColor color = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                u8 r = r5[color.r];
                u8 g = r5[color.g];
                u8 b = r5[color.b];

                r += ((r_ - r) * d) >> 4;
                g += ((g_ - g) * d) >> 4;
                b += ((b_ - b) * d) >> 4;
                gPlttBufferFaded[palOffset++] = (b << 10) | (g << 5) | r;
            }
        }
        r4++;
    }
}

void sub_807D304(s8 a, u8 arg2, u16 c)
{
    struct RGBColor color;
    u8 r_;
    u8 g_;
    u8 b_;
    u16 r4;
    u16 r5;
    u16 r12;

    a = -a - 1;
    color = *(struct RGBColor *)&c;
    r_ = color.r;
    g_ = color.g;
    b_ = color.b;
    r5 = 0;
    for (r4 = 0; r4 < 32; r4++)
    {
        if (gUnknown_030006DC[r4] == 0)
        {
            BlendPalette(r5, 16, arg2, c);
            r5 += 16;
        }
        else
        {
            for (r12 = 0; r12 < 16; r12++)
            {
                u32 offset;
                struct RGBColor color1;
                struct RGBColor color2;
                u8 r1, g1, b1;
                u8 r2, g2, b2;

                color1 = *(struct RGBColor *)&gPlttBufferUnfaded[r5];
                r1 = color1.r;
                g1 = color1.g;
                b1 = color1.b;

                offset = ((b1 & 0x1E) << 7) | ((g1 & 0x1E) << 3) | ((r1 & 0x1E) >> 1);
                color2 = *(struct RGBColor *)&(*(struct WeatherPaletteData *)gSharedMem).data[a][offset];
                r2 = color2.r;
                g2 = color2.g;
                b2 = color2.b;

                r2 += ((r_ - r2) * arg2) >> 4;
                g2 += ((g_ - g2) * arg2) >> 4;
                b2 += ((b_ - b2) * arg2) >> 4;

                gPlttBufferFaded[r5++] = (b2 << 10) | (g2 << 5) | r2;
            }
        }
    }
}

bool8 sub_807D574(u8);

void sub_807D424(u8 a, u16 b)
{
    struct RGBColor color;
    u8 r_;
    u8 g_;
    u8 b_;
    u16 r4;

    BlendPalette(0, 0x100, a, b);
    color = *(struct RGBColor *)&b;
    r_ = color.r;
    g_ = color.g;
    b_ = color.b;

    r4 = 16;
    while (r4 < 32)
    {
        if (sub_807D574(r4))
        {
            u16 r12 = (r4 + 1) * 16;
            u16 r6 = r4 * 16;

            while (r6 < r12)
            {
                struct RGBColor color = *(struct RGBColor *)&gPlttBufferUnfaded[r6];
                u8 r = color.r;
                u8 g = color.g;
                u8 b = color.b;

                r += ((28 - r) * 3) >> 2;
                g += ((31 - g) * 3) >> 2;
                b += ((28 - b) * 3) >> 2;

                r += ((r_ - r) * a) >> 4;
                g += ((g_ - g) * a) >> 4;
                b += ((b_ - b) * a) >> 4;

                gPlttBufferFaded[r6] = (b << 10) | (g << 5) | r;
                r6++;
            }
        }
        else
        {
            BlendPalette(r4 * 16, 16, a, b);
        }
        r4++;
    }
}

void sub_807D540(u8 a)
{
    if (gUnknown_0202F7E8.unknown_6FA < 6)
    {
        gUnknown_0202F7E8.unknown_6F4[gUnknown_0202F7E8.unknown_6FA] = a;
        gUnknown_0202F7E8.unknown_6FA++;
    }
}

bool8 sub_807D574(u8 a)
{
    u16 i;

    for (i = 0; i < gUnknown_0202F7E8.unknown_6FA; i++)
    {
        if (gUnknown_0202F7E8.unknown_6F4[i] == a)
            return 1;
    }
    return 0;
}

void sub_807D5BC(s8 a)
{
    if (gUnknown_0202F7E8.unknown_6C6 == 3)
    {
        sub_807CEBC(0, 32, a);
        gUnknown_0202F7E8.unknown_6C0 = a;
    }
}

void sub_807D5F0(u8 a, u8 b, u8 c)
{
    if (gUnknown_0202F7E8.unknown_6C6 == 3)
    {
        gUnknown_0202F7E8.unknown_6C6 = 0;
        gUnknown_0202F7E8.unknown_6C0 = a;
        gUnknown_0202F7E8.unknown_6C1 = b;
        gUnknown_0202F7E8.unknown_6C3 = 0;
        gUnknown_0202F7E8.unknown_6C2 = c;
        sub_807D5BC(a);
    }
}

void fade_screen(u8 a, u8 b)
{
    u32 r4;
    u32 r1;
    u32 r2;

    switch (a)
    {
    case 0:
        r4 = 0;
        r1 = 0;
        break;
    case 2:
        r4 = 0xFFFF;
        r1 = 0;
        break;
    case 1:
        r4 = 0;
        r1 = 1;
        break;
    case 3:
        r4 = 0xFFFF;
        r1 = 1;
        break;
    default:
        return;
    }

    switch (gUnknown_0202F7E8.unknown_6D0)
    {
    case 3:
    case 4:
    case 5:
    case 6:
    case 11:
    case 12:
    case 13:
        r2 = 1;
        break;
    default:
        r2 = 0;
        break;
    }

    if (r1 != 0)
    {
        if (r2 != 0)
            CpuFastSet(gPlttBufferFaded, gPlttBufferUnfaded, ((0x400)/(32/8) & 0x1FFFFF));
        BeginNormalPaletteFade(0xFFFFFFFF, b, 0, 16, r4);
        gUnknown_0202F7E8.unknown_6C6 = 2;
    }
    else
    {
        gUnknown_0202F7E8.unknown_6C4 = r4;
        if (r2 != 0)
            gUnknown_0202F7E8.unknown_6C7 = 0;
        else
            BeginNormalPaletteFade(0xFFFFFFFF, b, 16, 0, r4);
        gUnknown_0202F7E8.unknown_6C6 = 1;
        gUnknown_0202F7E8.unknown_6CA = 1;
        gUnknown_0202F7E8.unknown_6CB = 0;
        sub_807DB64(gUnknown_0202F7E8.unknown_730, gUnknown_0202F7E8.unknown_732);
        gUnknown_0202F7E8.unknown_6C8 = 1;
    }
}

bool8 sub_807D770(void)
{
    return gUnknown_0202F7E8.unknown_6C6 ^ 1 ? 1 : 0;
}

void sub_807D78C(u8 a)
{
    u16 r4 = 16 + a;
    u16 i;

    switch (gUnknown_0202F7E8.unknown_6C6)
    {
    case 1:
        if (gUnknown_0202F7E8.unknown_6CA != 0)
        {
            if (gUnknown_0202F7E8.unknown_6D0 == 6)
                sub_807D540(r4);
            r4 *= 16;
            for (i = 0; i < 16; i++)
                gPlttBufferFaded[r4 + i] = gUnknown_0202F7E8.unknown_6C4;
        }
        break;
    case 2:
        r4 *= 16;
        CpuFastSet(gPlttBufferFaded + r4, gPlttBufferUnfaded + r4, ((32)/(32/8) & 0x1FFFFF));
        BlendPalette(r4, 16, gPaletteFade.y, gPaletteFade.blendColor);
        break;
    default:
        if (gUnknown_0202F7E8.unknown_6D0 != 6)
        {
            sub_807CEBC(r4, 1, gUnknown_0202F7E8.unknown_6C0);
        }
        else
        {
            r4 *= 16;
            BlendPalette(r4, 16, 12, 0x73FC);
        }
        break;
    }
}

void sub_807D874(u8 a)
{
    sub_807CEBC(a, 1, gUnknown_0202F7E8.unknown_6C0);
}

u8 unref_sub_807D894(void)
{
    if (gUnknown_0202F7E8.unknown_6C6 == 1)
        return gUnknown_0202F7E8.unknown_6CA;
    else
        return 0;
}

void sub_807D8C0(const u16 *palette)
{
    LoadPalette(palette, 0x100 + gUnknown_0202F7E8.unknown_6D4 * 16, 32);
    sub_807D78C(gUnknown_0202F7E8.unknown_6D4);
}

void sub_807D8F0(u8 *a, u8 *b)
{
    u8 r4 = *a;
    u16 i;

    if (r4 < 7)
    {
        r4--;
        LZ77UnCompWram(gUnknown_08396FA8[r4], (*(struct WeatherPaletteData *)gSharedMem).data[r4]);
        if (r4 == 0)
        {
            (*(struct WeatherPaletteData *)gSharedMem).data[r4][0] = 0x421;
            for (i = 1; i < 0x1000; i++)
                (*(struct WeatherPaletteData *)gSharedMem).data[r4][i] += (*(struct WeatherPaletteData *)gSharedMem).data[r4][i - 1];
        }
        else
        {
            for (i = 0; i < 0x1000; i++)
                (*(struct WeatherPaletteData *)gSharedMem).data[r4][i] += (*(struct WeatherPaletteData *)gSharedMem).data[r4 - 1][i];
        }
        (*a)++;
        if (*a == 7)
        {
            *a = 32;
            *b = 32;
        }
    }
}

void sub_807D9A8(void)
{
    gUnknown_0202F7E8.unknown_74D = 1;
    gUnknown_0202F7E8.unknown_74E = 1;
}

bool8 sub_807D9C8(void)
{
    if (gUnknown_0202F7E8.unknown_74D < 32)
    {
        sub_807D8F0(&gUnknown_0202F7E8.unknown_74D, &gUnknown_0202F7E8.unknown_74E);
        if (gUnknown_0202F7E8.unknown_74D < 32)
            return 1;
    }
    return 0;
}

void sub_807DA04(s8 a)
{
    sub_807D5BC(-a - 1);
}

void sub_807DA14(void)
{
    gUnknown_0202F7E8.unknown_73C = 0;
    gUnknown_0202F7E8.unknown_740 = 0;
    gUnknown_0202F7E8.unknown_742 = 0;
    gUnknown_0202F7E8.unknown_73E = 0;
    gUnknown_0202FF58 = 5;
}

void sub_807DA4C(void)
{
    switch (gUnknown_0202F7E8.unknown_742)
    {
    case 0:
        if (++gUnknown_0202F7E8.unknown_740 > gUnknown_0202FF58)
        {
            gUnknown_0202F7E8.unknown_740 = 0;
            sub_807DA04(gUnknown_0202F7E8.unknown_73C++);
            if (gUnknown_0202F7E8.unknown_73C > 5)
            {
                gUnknown_0202F7E8.unknown_73E = gUnknown_0202F7E8.unknown_73C;
                gUnknown_0202F7E8.unknown_742 = 1;
                gUnknown_0202F7E8.unknown_740 = 0x3C;
            }
        }
        break;
    case 1:
        gUnknown_0202F7E8.unknown_740 = (gUnknown_0202F7E8.unknown_740 + 3) & 0x7F;
        gUnknown_0202F7E8.unknown_73C = ((gSineTable[gUnknown_0202F7E8.unknown_740] - 1) >> 6) + 2;
        if (gUnknown_0202F7E8.unknown_73C != gUnknown_0202F7E8.unknown_73E)
            sub_807DA04(gUnknown_0202F7E8.unknown_73C);
        gUnknown_0202F7E8.unknown_73E = gUnknown_0202F7E8.unknown_73C;
        break;
    case 2:
        if (++gUnknown_0202F7E8.unknown_740 > gUnknown_0202FF58)
        {
            gUnknown_0202F7E8.unknown_740 = 0;
            sub_807DA04(--gUnknown_0202F7E8.unknown_73C);
            if (gUnknown_0202F7E8.unknown_73C == 3)
                gUnknown_0202F7E8.unknown_742 = 0;
        }
        break;
    }
}

void sub_807DB64(u8 a, u8 b)
{
    gUnknown_0202F7E8.unknown_730 = a;
    gUnknown_0202F7E8.unknown_732 = b;
    gUnknown_0202F7E8.unknown_734 = a;
    gUnknown_0202F7E8.unknown_736 = b;
    (*(vu16 *)(0x4000000 + 0x52)) = (b << 8) | a;
}

void sub_807DBA4(u8 a, u8 b, int c)
{
    gUnknown_0202F7E8.unknown_734 = a;
    gUnknown_0202F7E8.unknown_736 = b;
    gUnknown_0202F7E8.unknown_73A = c;
    gUnknown_0202F7E8.unknown_739 = 0;
    gUnknown_0202F7E8.unknown_738 = 0;
}

bool8 sub_807DBE8(void)
{
    if (gUnknown_0202F7E8.unknown_730 == gUnknown_0202F7E8.unknown_734
     && gUnknown_0202F7E8.unknown_732 == gUnknown_0202F7E8.unknown_736)
        return 1;
    if (++gUnknown_0202F7E8.unknown_739 > gUnknown_0202F7E8.unknown_73A)
    {
        gUnknown_0202F7E8.unknown_739 = 0;
        gUnknown_0202F7E8.unknown_738++;
        if (gUnknown_0202F7E8.unknown_738 & 1)
        {
            if (gUnknown_0202F7E8.unknown_730 < gUnknown_0202F7E8.unknown_734)
                gUnknown_0202F7E8.unknown_730++;
            else if (gUnknown_0202F7E8.unknown_730 > gUnknown_0202F7E8.unknown_734)
                gUnknown_0202F7E8.unknown_730--;
        }
        else
        {
            if (gUnknown_0202F7E8.unknown_732 < gUnknown_0202F7E8.unknown_736)
                gUnknown_0202F7E8.unknown_732++;
            else if (gUnknown_0202F7E8.unknown_732 > gUnknown_0202F7E8.unknown_736)
                gUnknown_0202F7E8.unknown_732--;
        }
    }
    (*(vu16 *)(0x4000000 + 0x52)) = (gUnknown_0202F7E8.unknown_732 << 8) | gUnknown_0202F7E8.unknown_730;
    if (gUnknown_0202F7E8.unknown_730 == gUnknown_0202F7E8.unknown_734
     && gUnknown_0202F7E8.unknown_732 == gUnknown_0202F7E8.unknown_736)
        return 1;
    return 0;
}

void unref_sub_807DCB4(u8 a)
{
    switch (a)
    {
    case 1:
        SetWeather(1);
        break;
    case 2:
        SetWeather(2);
        break;
    case 3:
        SetWeather(3);
        break;
    case 4:
        SetWeather(4);
        break;
    case 5:
        SetWeather(5);
        break;
    case 6:
        SetWeather(6);
        break;
    case 7:
        SetWeather(9);
        break;
    case 8:
        SetWeather(7);
        break;
    case 9:
        SetWeather(8);
        break;
    case 10:
        SetWeather(11);
        break;
    }
}

u8 weather_get_current(void)
{
    return gUnknown_0202F7E8.unknown_6D0;
}

void sub_807DD5C(u16 sndEff)
{
    if (gUnknown_0202F7E8.unknown_6C6 != 2)
    {
        switch (sndEff)
        {
        case SE_T_KOAME:
            gUnknown_0202F7E8.unknown_6DD = 0;
            break;
        case SE_T_OOAME:
            gUnknown_0202F7E8.unknown_6DD = 1;
            break;
        case SE_T_AME:
            gUnknown_0202F7E8.unknown_6DD = 2;
            break;
        default:
            return;
        }
        PlaySE(sndEff);
    }
}

void PlayRainSoundEffect(void)
{
    if (IsSpecialSEPlaying())
    {
        switch (gUnknown_0202F7E8.unknown_6DD)
        {
        case 0:
            PlaySE(0x56);
            break;
        case 1:
            PlaySE(0x54);
            break;
        case 2:
        default:
            PlaySE(0x52);
            break;
        }
    }
}

u8 sub_807DDFC(void)
{
    return gUnknown_0202F7E8.unknown_6D3;
}

void sub_807DE10(void)
{
    gUnknown_0202F7E8.unknown_6C6 = 2;
}

void unref_sub_807DE24(void)
{
    gUnknown_0202F7E8.unknown_6C6 = 3;
}

void sub_807DE38(u8 a)
{
    CpuSet(gUnknown_083970C8, gUnknown_0202FF38, 0x00000000 | ((32)/(16/8) & 0x1FFFFF));
    gUnknown_0202FF38[a] = 0;
    gUnknown_030006DC = gUnknown_0202FF38;
}

void sub_807DE68(void)
{
    gUnknown_030006DC = gUnknown_083970C8;
}

void sub_807DE78(void)
{
    gUnknown_08396FC4->unknown_6C1 = 0;
    gUnknown_08396FC4->unknown_6C2 = 20;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6CC = 0;
    if (gUnknown_08396FC4->unknown_6DE == 0)
        sub_807DB64(0, 16);
}

void sub_807DEF4(void);

void sub_807DEC4(void)
{
    sub_807DE78();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807DEF4();
}

void sub_807DFD4(void);

void sub_807DEF4(void)
{
    switch (gUnknown_08396FC4->unknown_6CC)
    {
    case 0:
        sub_807DFD4();
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 1:
        sub_807DBA4(12, 8, 1);
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 2:
        if (sub_807DBE8())
        {
            gUnknown_08396FC4->unknown_6D2 = 1;
            gUnknown_08396FC4->unknown_6CC++;
        }
        break;
    }
}

void sub_807E0A0(void);

bool8 sub_807DF54(void)
{
    switch (gUnknown_08396FC4->unknown_6CE)
    {
    case 0:
        sub_807DBA4(0, 16, 1);
        gUnknown_08396FC4->unknown_6CE++;
        return 1;
    case 1:
        if (sub_807DBE8())
        {
            sub_807E0A0();
            gUnknown_08396FC4->unknown_6CE++;
        }
        return 1;
    }
    return 0;
}

void sub_807DF9C(void)
{
    gUnknown_08396FC4->unknown_6C1 = 0;
    gUnknown_08396FC4->unknown_6C2 = 20;
}

void sub_807DFC0(void)
{
    sub_807DF9C();
}

void nullsub_55(void)
{
}

int sub_807DFD0(void)
{
    return 0;
}

void sub_807DFD4(void)
{
    u16 i;

    if (gUnknown_08396FC4->unknown_6DE == 1)
        return;
    LoadSpriteSheet(&gUnknown_0839A9D4);
    sub_807D8C0(gUnknown_08397108);
    for (i = 0; i < 3; i++)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_839A9F0, 0, 0, 0xFF);

        if (spriteId != 64)
        {
            struct Sprite *sprite;

            gUnknown_08396FC4->unknown_1F4[i] = &gSprites[spriteId];
            sprite = gUnknown_08396FC4->unknown_1F4[i];
            sub_80603CC(gUnknown_0839A9C8[i].x + 7, gUnknown_0839A9C8[i].y + 7, &sprite->pos1.x, &sprite->pos1.y);
            sprite->coordOffsetEnabled = 1;
        }
        else
        {
            gUnknown_08396FC4->unknown_1F4[i] = ((void *)0);
        }
    }
    gUnknown_08396FC4->unknown_6DE = 1;
}

void sub_807E0A0(void)
{
    u16 i;

    if (gUnknown_08396FC4->unknown_6DE == 0)
        return;
    for (i = 0; i < 3; i++)
    {
        if (gUnknown_08396FC4->unknown_1F4[i] != ((void *)0))
            DestroySprite(gUnknown_08396FC4->unknown_1F4[i]);
    }
    FreeSpriteTilesByTag(0x1200);
    gUnknown_08396FC4->unknown_6DE = 0;
}

void sub_807E0F4(struct Sprite *sprite)
{
    sprite->data[0] = (sprite->data[0] + 1) & 1;
    if (sprite->data[0] != 0)
        sprite->pos1.x--;
}

void sub_807E110(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6C1 = 0;
    gUnknown_08396FC4->unknown_6C2 = 0;
}

void sub_807E174(void);

void sub_807E144(void)
{
    sub_807E110();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807E174();
}

void sub_807E174(void)
{
    switch (gUnknown_08396FC4->unknown_6CC)
    {
    case 0:
        if (gUnknown_08396FC4->unknown_6C6 != 0)
            gUnknown_08396FC4->unknown_6CC++;
        break;
    case 1:
        sub_807D9A8();
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 2:
        if (sub_807D9C8() == 0)
            gUnknown_08396FC4->unknown_6CC++;
        break;
    case 3:
        sub_807DA14();
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 4:
        sub_807DA4C();
        if (gUnknown_08396FC4->unknown_73C == 6)
        {
            gUnknown_08396FC4->unknown_6D2 = 1;
            gUnknown_08396FC4->unknown_6CC++;
        }
        break;
    default:
        sub_807DA4C();
        break;
    }
}

int sub_807E258(void)
{
    return 0;
}

void task50_0807B6D4(u8);

void sub_807E25C(void)
{
    CreateTask(task50_0807B6D4, 0x50);
}






void task50_0807B6D4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[1] = 0;
        task->data[2] = 0;
        task->data[3] = (*(vu16 *)(0x4000000 + 0x48));
        (*(vu16 *)(0x4000000 + 0x48)) = (((63) << 8) | (63));
        (*(vu16 *)(0x4000000 + 0x50)) = 0x9E;
        (*(vu16 *)(0x4000000 + 0x54)) = 0;
        task->data[0]++;

    case 1:
        task->data[1] += 3;
        if (task->data[1] > 16)
            task->data[1] = 16;
        (*(vu16 *)(0x4000000 + 0x54)) = task->data[1];
        if (task->data[1] >= 16)
            task->data[0]++;
        break;
    case 2:
        task->data[2]++;
        if (task->data[2] > 9)
        {
            task->data[2] = 0;
            task->data[1]--;
            if (task->data[1] <= 0)
            {
                task->data[1] = 0;
                task->data[0]++;
            }
            (*(vu16 *)(0x4000000 + 0x54)) = task->data[1];
        }
        break;
    case 3:
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x54)) = 0;
        (*(vu16 *)(0x4000000 + 0x48)) = task->data[3];
        task->data[0]++;
        break;
    case 4:
        EnableBothScriptContexts();
        DestroyTask(taskId);
        break;
    }
}






void sub_807E364(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6D6 = 0;
    gUnknown_08396FC4->unknown_6DB = 8;
    gUnknown_08396FC4->unknown_6DC = 0;
    gUnknown_08396FC4->unknown_6D9 = 10;
    gUnknown_08396FC4->unknown_6C1 = 3;
    gUnknown_08396FC4->unknown_6C2 = 20;
    sub_807DD5C(SE_T_KOAME);
}

void sub_807E400(void);

void sub_807E3D0(void)
{
    sub_807E364();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807E400();
}

void sub_807E7A4(void);
u8 sub_807E7B4(void);
u8 sub_807E8E8(void);

void sub_807E400(void)
{
    switch (gUnknown_08396FC4->unknown_6CC)
    {
    case 0:
        sub_807E7A4();
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 1:
        if (sub_807E7B4() == 0)
            gUnknown_08396FC4->unknown_6CC++;
        break;
    case 2:
        if (sub_807E8E8() == 0)
        {
            gUnknown_08396FC4->unknown_6D2 = 1;
            gUnknown_08396FC4->unknown_6CC++;
        }
        break;
    }
}

void sub_807E974(void);

bool8 sub_807E460(void)
{
    switch (gUnknown_08396FC4->unknown_6CE)
    {
    case 0:
        if (gUnknown_08396FC4->unknown_6D1 == 3
         || gUnknown_08396FC4->unknown_6D1 == 5
         || gUnknown_08396FC4->unknown_6D1 == 13)
        {
            gUnknown_08396FC4->unknown_6CE = 0xFF;
            return 0;
        }
        else
        {
            gUnknown_08396FC4->unknown_6D9 = 0;
            gUnknown_08396FC4->unknown_6CE++;
        }

    case 1:
        if (sub_807E8E8() == 0)
        {
            sub_807E974();
            gUnknown_08396FC4->unknown_6CE++;
            return 0;
        }
        return 1;
    }
    return 0;
}


extern const u16 gUnknown_0839AAC4[][2];

extern const s16 gUnknown_0839AABC[][2];

void sub_807E4EC(struct Sprite *sprite)
{
    u32 randVal;
    u16 r6;
    s32 r4;
    s32 r0;

    if (sprite->data[1] == 0)
        sprite->data[1] = 361;
    randVal = sprite->data[1] * 1103515245 + 12345;
    sprite->data[1] = ((randVal & 0x7FFF0000) >> 16) % 600;

    r6 = gUnknown_0839AAC4[gUnknown_08396FC4->unknown_6DC][0];

    r4 = sprite->data[1] % 30;
    sprite->data[2] = r4 * 8;

    r0 = sprite->data[1] / 30;
    sprite->data[3] = r0 * 8;

    sprite->data[2] = r4;
    sprite->data[2] <<= 7;

    sprite->data[3] = r0;
    sprite->data[3] <<= 7;

    sprite->data[2] -= gUnknown_0839AABC[gUnknown_08396FC4->unknown_6DC][0] * r6;
    sprite->data[3] -= gUnknown_0839AABC[gUnknown_08396FC4->unknown_6DC][1] * r6;

    StartSpriteAnim(sprite, 0);
    sprite->data[4] = 0;
    sprite->coordOffsetEnabled = 0;
    sprite->data[0] = r6;
}

void sub_807E5C0(struct Sprite *sprite)
{
    if (sprite->data[4] == 0)
    {
        sprite->data[2] += gUnknown_0839AABC[gUnknown_08396FC4->unknown_6DC][0];
        sprite->data[3] += gUnknown_0839AABC[gUnknown_08396FC4->unknown_6DC][1];
        sprite->pos1.x = sprite->data[2] >> 4;
        sprite->pos1.y = sprite->data[3] >> 4;

        if (sprite->data[5] != 0
         && (sprite->pos1.x >= -8 && sprite->pos1.x <= 248)
         && sprite->pos1.y >= -16 && sprite->pos1.y <= 176)
            sprite->invisible = 0;
        else
            sprite->invisible = 1;

        sprite->data[0]--;
        if (sprite->data[0] == 0)
        {
            StartSpriteAnim(sprite, gUnknown_08396FC4->unknown_6DC + 1);
            sprite->data[4] = 1;
            sprite->pos1.x -= gSpriteCoordOffsetX;
            sprite->pos1.y -= gSpriteCoordOffsetY;
            sprite->coordOffsetEnabled = 1;
        }
    }
    else if (sprite->animEnded)
    {
        sprite->invisible = 1;
        sub_807E4EC(sprite);
    }
}

void sub_807E6C4(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sub_807E4EC(sprite);
        sprite->callback = sub_807E5C0;
    }
    else
    {
        sprite->data[0]--;
    }
}

void sub_807E6F0(struct Sprite *sprite, u16 b)
{
    u16 r8 = gUnknown_0839AAC4[gUnknown_08396FC4->unknown_6DC][0];
    u16 r6 = b / (gUnknown_0839AAC4[gUnknown_08396FC4->unknown_6DC][1] + r8);
    u16 r4 = b % (gUnknown_0839AAC4[gUnknown_08396FC4->unknown_6DC][1] + r8);

    while (--r6 != 0xFFFF)
        sub_807E4EC(sprite);
    if (r4 < r8)
    {
        while (--r4 != 0xFFFF)
            sub_807E5C0(sprite);
        sprite->data[6] = 0;
    }
    else
    {
        sprite->data[0] = r4 - r8;
        sprite->invisible = 1;
        sprite->data[6] = 1;
    }
}

void sub_807E7A4(void)
{
    LoadSpriteSheet(&gUnknown_0839AACC);
}

extern const struct Coords16 gUnknown_0839AA08[];

bool8 sub_807E7B4(void)
{
    u8 r7;
    u8 spriteId;

    if (gUnknown_08396FC4->unknown_6DA == 24)
        return 0;

    r7 = gUnknown_08396FC4->unknown_6DA;
    spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839AAA4,
      gUnknown_0839AA08[r7].x, gUnknown_0839AA08[r7].y, 78);
    if (spriteId != 64)
    {
        gSprites[spriteId].data[5] = 0;
        gSprites[spriteId].data[1] = r7 * 145;
        while (gSprites[spriteId].data[1] >= 600)
            gSprites[spriteId].data[1] -= 600;
        sub_807E4EC(&gSprites[spriteId]);
        sub_807E6F0(&gSprites[spriteId], r7 * 9);
        gSprites[spriteId].invisible = 1;
        gUnknown_08396FC4->unknown_0[r7] = &gSprites[spriteId];
    }
    else
    {
        gUnknown_08396FC4->unknown_0[r7] = ((void *)0);
    }

    if (++gUnknown_08396FC4->unknown_6DA == 24)
    {
        u16 i;

        for (i = 0; i < 24; i++)
        {
            if (gUnknown_08396FC4->unknown_0[i] != ((void *)0))
            {
                if (gUnknown_08396FC4->unknown_0[i]->data[6] == 0)
                    gUnknown_08396FC4->unknown_0[i]->callback = sub_807E5C0;
                else
                    gUnknown_08396FC4->unknown_0[i]->callback = sub_807E6C4;
            }
        }
        return 0;
    }
    return 1;
}

bool8 sub_807E8E8(void)
{
    if (gUnknown_08396FC4->unknown_6D8 == gUnknown_08396FC4->unknown_6D9)
        return 0;

    if (++gUnknown_08396FC4->unknown_6D6 > gUnknown_08396FC4->unknown_6DB)
    {
        gUnknown_08396FC4->unknown_6D6 = 0;
        if (gUnknown_08396FC4->unknown_6D8 < gUnknown_08396FC4->unknown_6D9)
        {
            gUnknown_08396FC4->unknown_0[gUnknown_08396FC4->unknown_6D8++]->data[5] = 1;
        }
        else
        {
            gUnknown_08396FC4->unknown_6D8--;
            gUnknown_08396FC4->unknown_0[gUnknown_08396FC4->unknown_6D8]->data[5] = 0;
            gUnknown_08396FC4->unknown_0[gUnknown_08396FC4->unknown_6D8]->invisible = 1;
        }
    }
    return 1;
}

void sub_807E974(void)
{
    u16 i;

    for (i = 0; i < gUnknown_08396FC4->unknown_6DA; i++)
    {
        if (gUnknown_08396FC4->unknown_0[i] != ((void *)0))
            DestroySprite(gUnknown_08396FC4->unknown_0[i]);
    }
    gUnknown_08396FC4->unknown_6DA = 0;
    FreeSpriteTilesByTag(0x1206);
}

void sub_807E9C8(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6C1 = 3;
    gUnknown_08396FC4->unknown_6C2 = 20;
    gUnknown_08396FC4->unknown_6E5 = 16;
    gUnknown_08396FC4->unknown_6E0 = 0;
}

void snowflakes_progress2(void);
void sub_807ED48(struct Sprite *);

void sub_807EA18(void)
{
    sub_807E9C8();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
    {
        u16 i;

        snowflakes_progress2();
        for (i = 0; i < gUnknown_08396FC4->unknown_6E4; i++)
        {
            sub_807ED48(gUnknown_08396FC4->unknown_60[i]);
        }
    }
}

u8 snowflakes_progress(void);

void snowflakes_progress2(void)
{
    if (gUnknown_08396FC4->unknown_6CC == 0 && snowflakes_progress() == 0)
    {
        gUnknown_08396FC4->unknown_6D2 = 1;
        gUnknown_08396FC4->unknown_6CC++;
    }
}

bool8 sub_807EAC0(void)
{
    switch (gUnknown_08396FC4->unknown_6CE)
    {
    case 0:
        gUnknown_08396FC4->unknown_6E5 = 0;
        gUnknown_08396FC4->unknown_6E0 = 0;
        gUnknown_08396FC4->unknown_6CE++;

    case 1:
        if (snowflakes_progress() == 0)
        {
            gUnknown_08396FC4->unknown_6CE++;
            return 0;
        }
        return 1;
    }
    return 0;
}

bool8 snowflake_add(void);
bool8 snowflake_remove(void);

bool8 snowflakes_progress(void)
{
    if (gUnknown_08396FC4->unknown_6E4 == gUnknown_08396FC4->unknown_6E5)
        return 0;

    gUnknown_08396FC4->unknown_6E0++;
    if (gUnknown_08396FC4->unknown_6E0 > 36)
    {
        gUnknown_08396FC4->unknown_6E0 = 0;
        if (gUnknown_08396FC4->unknown_6E4 < gUnknown_08396FC4->unknown_6E5)
            snowflake_add();
        else
            snowflake_remove();
    }
    return (gUnknown_08396FC4->unknown_6E4 != gUnknown_08396FC4->unknown_6E5);
}

void sub_807EC40(struct Sprite *);

bool8 snowflake_add(void)
{
    u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839AB04, 0, 0, 78);

    if (spriteId == 64)
        return 0;
    gSprites[spriteId].data[4] = gUnknown_08396FC4->unknown_6E4;
    sub_807EC40(&gSprites[spriteId]);
    gSprites[spriteId].coordOffsetEnabled = 1;
    gUnknown_08396FC4->unknown_60[gUnknown_08396FC4->unknown_6E4++] = &gSprites[spriteId];
    return 1;
}

bool8 snowflake_remove(void)
{
    if (gUnknown_08396FC4->unknown_6E4 != 0)
    {
        DestroySprite(gUnknown_08396FC4->unknown_60[--gUnknown_08396FC4->unknown_6E4]);
        return 1;
    }
    return 0;
}

void sub_807EC40(struct Sprite *sprite)
{
    u16 r4 = ((sprite->data[4] * 5) & 7) * 30 + (Random() % 30);
    u16 r6;

    sprite->pos1.y = -3 - (gSpriteCoordOffsetY + sprite->centerToCornerVecY);
    sprite->pos1.x = r4 - (gSpriteCoordOffsetX + sprite->centerToCornerVecX);
    sprite->data[0] = sprite->pos1.y * 128;
    sprite->pos2.x = 0;
    r6 = Random();
    sprite->data[1] = (r6 & 3) * 5 + 64;
    sprite->data[7] = (r6 & 3) * 5 + 64;
    StartSpriteAnim(sprite, (r6 & 1) ? 0 : 1);
    sprite->data[3] = 0;
    sprite->data[2] = ((r6 & 3) == 0) ? 2 : 1;
    sprite->data[6] = (r6 & 0x1F) + 210;
    sprite->data[5] = 0;
}

void sub_807ECEC(struct Sprite *sprite)
{
    if (gUnknown_08396FC4->unknown_6E2 > 18)
    {
        sprite->invisible = 0;
        sprite->callback = sub_807ED48;
        sprite->pos1.y = 0xFA - (gSpriteCoordOffsetY + sprite->centerToCornerVecY);
        sprite->data[0] = sprite->pos1.y * 128;
        gUnknown_08396FC4->unknown_6E2 = 0;
    }
}

void sub_807ED48(struct Sprite *sprite)
{
    s16 r3;
    s16 r2;

    sprite->data[0] += sprite->data[1];
    sprite->pos1.y = sprite->data[0] >> 7;
    sprite->data[3] = (sprite->data[3] + sprite->data[2]) & 0xFF;
    sprite->pos2.x = gSineTable[sprite->data[3]] / 64;

    r3 = (sprite->pos1.x + sprite->centerToCornerVecX + gSpriteCoordOffsetX) & 0x1FF;
    if (r3 & 0x100)
        r3 = -0x100 | r3;
    if (r3 < -3)
        sprite->pos1.x = 242 - (gSpriteCoordOffsetX + sprite->centerToCornerVecX);
    else if (r3 > 242)
        sprite->pos1.x = -3 - (gSpriteCoordOffsetX + sprite->centerToCornerVecX);

    r2 = (sprite->pos1.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY) & 0xFF;
    if (r2 > 163 && r2 < 171)
    {
        sprite->pos1.y = 250 - (gSpriteCoordOffsetY + sprite->centerToCornerVecY);
        sprite->data[0] = sprite->pos1.y * 128;
        sprite->data[5] = 0;
        sprite->data[6] = 220;
    }
    else if (r2 > 242 && r2 < 250)
    {
        sprite->pos1.y = 163;
        sprite->data[0] = sprite->pos1.y * 128;
        sprite->data[5] = 0;
        sprite->data[6] = 220;
        sprite->invisible = 1;
        sprite->callback = sub_807ECEC;
    }

    sprite->data[5]++;
    if (sprite->data[5] == sprite->data[6])
    {
        sub_807EC40(sprite);
        sprite->pos1.y = 250;
        sprite->invisible = 1;
        sprite->callback = sub_807ECEC;
    }
}

void sub_807EE80(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6D6 = 0;
    gUnknown_08396FC4->unknown_6DB = 4;
    gUnknown_08396FC4->unknown_6DC = 0;
    gUnknown_08396FC4->unknown_6D9 = 16;
    gUnknown_08396FC4->unknown_6C1 = 3;
    gUnknown_08396FC4->unknown_6C2 = 20;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6ED = 0;
    sub_807DD5C(0x51);
}

void sub_807EFC0(void);

void sub_807EEF4(void)
{
    sub_807EE80();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807EFC0();
}

void sub_807EF24(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6D6 = 0;
    gUnknown_08396FC4->unknown_6DB = 4;
    gUnknown_08396FC4->unknown_6DC = 1;
    gUnknown_08396FC4->unknown_6D9 = 24;
    gUnknown_08396FC4->unknown_6C1 = 3;
    gUnknown_08396FC4->unknown_6C2 = 20;
    gUnknown_08396FC4->unknown_6D2 = 0;
    sub_807DD5C(0x53);
}

void sub_807EF90(void)
{
    sub_807EF24();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807EFC0();
}

void sub_807F434(void);
void sub_807F3F8(u16);

void sub_807EFC0(void)
{
    sub_807F434();
    switch (gUnknown_08396FC4->unknown_6CC)
    {
    case 0:
        sub_807E7A4();
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 1:
        if (sub_807E7B4())
            break;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 2:
        if (sub_807E8E8())
            break;
        gUnknown_08396FC4->unknown_6D2 = 1;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 3:
        if (gUnknown_08396FC4->unknown_6C6 == 0)
            break;
        gUnknown_08396FC4->unknown_6CC = 6;
        break;
    case 4:
        gUnknown_08396FC4->unknown_6EA = 1;
        gUnknown_08396FC4->unknown_6E6 = (Random() % 360) + 360;
        gUnknown_08396FC4->unknown_6CC++;

    case 5:
        if (--gUnknown_08396FC4->unknown_6E6 != 0)
            break;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 6:
        gUnknown_08396FC4->unknown_6EA = 1;
        gUnknown_08396FC4->unknown_6EB = Random() % 2;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 7:
        gUnknown_08396FC4->unknown_6EC = (Random() & 1) + 1;
        gUnknown_08396FC4->unknown_6CC++;

    case 8:
        sub_807D5BC(19);
        if (gUnknown_08396FC4->unknown_6EB == 0 && gUnknown_08396FC4->unknown_6EC == 1)
            sub_807F3F8(20);
        gUnknown_08396FC4->unknown_6E6 = (Random() % 3) + 6;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 9:
        if (--gUnknown_08396FC4->unknown_6E6 != 0)
            break;
        sub_807D5BC(3);
        gUnknown_08396FC4->unknown_6EA = 1;
        if (--gUnknown_08396FC4->unknown_6EC != 0)
        {
            gUnknown_08396FC4->unknown_6E6 = (Random() % 16) + 60;
            gUnknown_08396FC4->unknown_6CC = 10;
        }
        else if (gUnknown_08396FC4->unknown_6EB == 0)
        {
            gUnknown_08396FC4->unknown_6CC = 4;
        }
        else
        {
            gUnknown_08396FC4->unknown_6CC = 11;
        }
        break;
    case 10:
        if (--gUnknown_08396FC4->unknown_6E6 != 0)
            break;
        gUnknown_08396FC4->unknown_6CC = 8;
        break;
    case 11:
        gUnknown_08396FC4->unknown_6E6 = (Random() % 16) + 60;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 12:
        if (--gUnknown_08396FC4->unknown_6E6 != 0)
            break;
        sub_807F3F8(100);
        sub_807D5BC(19);

        gUnknown_08396FC4->unknown_6E6 = (Random() & 0xF) + 30;
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 13:
        if (--gUnknown_08396FC4->unknown_6E6 != 0)
            break;
        sub_807D5F0(19, 3, 5);
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 14:
        if (gUnknown_08396FC4->unknown_6C6 != 3)
            break;
        gUnknown_08396FC4->unknown_6EA = 1;
        gUnknown_08396FC4->unknown_6CC = 4;
        break;
    }
}

bool8 sub_807F34C(void)
{
    switch (gUnknown_08396FC4->unknown_6CE)
    {
    case 0:
        gUnknown_08396FC4->unknown_6EA = 0;
        gUnknown_08396FC4->unknown_6CE++;

    case 1:
        sub_807EFC0();
        if (gUnknown_08396FC4->unknown_6EA != 0)
        {
            if (gUnknown_08396FC4->unknown_6D1 == 3
             || gUnknown_08396FC4->unknown_6D1 == 5
             || gUnknown_08396FC4->unknown_6D1 == 13)
                return 0;
            gUnknown_08396FC4->unknown_6D9 = 0;
            gUnknown_08396FC4->unknown_6CE++;
        }
        break;
    case 2:
        if (sub_807E8E8())
            break;
        sub_807E974();
        gUnknown_08396FC4->unknown_6ED = 0;
        gUnknown_08396FC4->unknown_6CE++;
        return 0;
    default:
        return 0;
    }
    return 1;
}

void sub_807F3F8(u16 a)
{
    if (gUnknown_08396FC4->unknown_6ED == 0)
    {
        gUnknown_08396FC4->unknown_6E8 = Random() % a;
        gUnknown_08396FC4->unknown_6ED = 1;
    }
}

void sub_807F434(void)
{
    if (gUnknown_08396FC4->unknown_6ED == 1)
    {
        if (gUnknown_08396FC4->unknown_6E8 == 0)
        {
            if (IsSEPlaying())
                return;
            if (Random() & 1)
                PlaySE(0x57);
            else
                PlaySE(0x58);
            gUnknown_08396FC4->unknown_6ED = 0;
        }
        else
        {
            gUnknown_08396FC4->unknown_6E8--;
        }
    }
}

void sub_807F49C(void)
{
    gUnknown_08396FC4->unknown_6CC = 0;
    gUnknown_08396FC4->unknown_6D2 = 0;
    gUnknown_08396FC4->unknown_6C1 = 0;
    gUnknown_08396FC4->unknown_6C2 = 20;
    if (gUnknown_08396FC4->unknown_6FB == 0)
    {
        gUnknown_08396FC4->unknown_6F0 = 0;
        gUnknown_08396FC4->unknown_6F2 = 0;
        gUnknown_08396FC4->unknown_6EE = 0;
        sub_807DB64(0, 16);
    }
}

void sub_807F52C(void);

void sub_807F4FC(void)
{
    sub_807F49C();
    while (gUnknown_08396FC4->unknown_6D2 == 0)
        sub_807F52C();
}

void sub_807F6E8(void);

void sub_807F52C(void)
{
    gUnknown_08396FC4->unknown_6EE = (gSpriteCoordOffsetX - gUnknown_08396FC4->unknown_6F2) & 0xFF;
    if (++gUnknown_08396FC4->unknown_6F0 > 3)
    {
        gUnknown_08396FC4->unknown_6F0 = 0;
        gUnknown_08396FC4->unknown_6F2++;
    }
    switch (gUnknown_08396FC4->unknown_6CC)
    {
    case 0:
        sub_807F6E8();
        if (gUnknown_08396FC4->unknown_6D0 == 6)
            sub_807DBA4(12, 8, 3);
        else
            sub_807DBA4(4, 16, 0);
        gUnknown_08396FC4->unknown_6CC++;
        break;
    case 1:
        if (sub_807DBE8())
        {
            gUnknown_08396FC4->unknown_6D2 = 1;
            gUnknown_08396FC4->unknown_6CC++;
        }
        break;
    }
}

void sub_807F7A4(void);

bool8 sub_807F5EC(void)
{
    gUnknown_08396FC4->unknown_6EE = (gSpriteCoordOffsetX - gUnknown_08396FC4->unknown_6F2) & 0xFF;
    if (++gUnknown_08396FC4->unknown_6F0 > 3)
    {
        gUnknown_08396FC4->unknown_6F0 = 0;
        gUnknown_08396FC4->unknown_6F2++;
    }
    switch (gUnknown_08396FC4->unknown_6CE)
    {
    case 0:
        sub_807DBA4(0, 16, 3);
        gUnknown_08396FC4->unknown_6CE++;
        break;
    case 1:
        if (!sub_807DBE8())
            break;
        gUnknown_08396FC4->unknown_6CE++;
        break;
    case 2:
        sub_807F7A4();
        gUnknown_08396FC4->unknown_6CE++;
        break;
    default:
        return 0;
    }
    return 1;
}

void sub_807F688(struct Sprite *sprite)
{
    sprite->pos2.y = (u8)gSpriteCoordOffsetY;
    sprite->pos1.x = gUnknown_08396FC4->unknown_6EE + 32 + sprite->data[0] * 64;
    if (sprite->pos1.x > 0x10F)
    {
        sprite->pos1.x = 480 + gUnknown_08396FC4->unknown_6EE - (4 - sprite->data[0]) * 64;
        sprite->pos1.x &= 0x1FF;
    }
}
