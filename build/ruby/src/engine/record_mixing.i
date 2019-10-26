# 1 "src/engine/record_mixing.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/engine/record_mixing.c"
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
# 2 "src/engine/record_mixing.c" 2
# 1 "include/record_mixing.h" 1





void sub_80B929C(void);
void RecordMixing_PrepareExchangePacket(void);
void RecordMixing_ReceiveExchangePacket(u32 a);
void Task_RecordMixing_SoundEffect(u8 taskId);
void Task_RecordMixing_Main(u8 taskId);
void sub_80B95F0(u8 taskId);
void Task_RecordMixing_SendPacket(u8 taskId);
void Task_RecordMixing_CopyReceiveBuffer(u8 taskId);
void sub_80B99B4(u8 taskId);
void Task_RecordMixing_ReceivePacket(u8 taskId);
void Task_RecordMixing_SendPacket_SwitchToReceive(u8 taskId);
void *LoadPtrFromTaskData(u16 *);
void StorePtrInTaskData(void *, u16 *);
u8 GetMultiplayerId_(void);
u16 *GetPlayerRecvBuffer(u8 player);
void sub_80B9A78(void);
void sub_80B9A88(u8 *a);
void sub_80B9B1C(u8 *a, size_t size, u8 index);
void sub_80B9B70(void *a, u32 size, u8 index);
u8 sub_80B9BBC(u16 *a);
void sub_80B9BC4(u8 *, size_t, u8[][2], u8 d, u8 e);
u8 sub_80B9C4C(u8 *a);


void sub_80B9C6C(u8 *, u32, u8, void *);
void sub_80B9F3C(u16 *, u8);
void sub_80BA00C(u8);
# 3 "src/engine/record_mixing.c" 2
# 1 "include/battle_tower.h" 1






enum
{
    F_EV_SPREAD_HP = 1 << 0,
    F_EV_SPREAD_ATTACK = 1 << 1,
    F_EV_SPREAD_DEFENSE = 1 << 2,
    F_EV_SPREAD_SPEED = 1 << 3,
    F_EV_SPREAD_SP_ATTACK = 1 << 4,
    F_EV_SPREAD_SP_DEFENSE = 1 << 5,
};

enum
{
    BATTLE_TOWER_ITEM_NONE,
    BATTLE_TOWER_ITEM_KINGS_ROCK,
    BATTLE_TOWER_ITEM_SITRUS_BERRY,
    BATTLE_TOWER_ITEM_ORAN_BERRY,
    BATTLE_TOWER_ITEM_CHESTO_BERRY,
    BATTLE_TOWER_ITEM_HARD_STONE,
    BATTLE_TOWER_ITEM_FOCUS_BAND,
    BATTLE_TOWER_ITEM_PERSIM_BERRY,
    BATTLE_TOWER_ITEM_MIRACLE_SEED,
    BATTLE_TOWER_ITEM_BERRY_JUICE,
    BATTLE_TOWER_ITEM_MACHO_BRACE,
    BATTLE_TOWER_ITEM_SILVER_POWDER,
    BATTLE_TOWER_ITEM_CHERI_BERRY,
    BATTLE_TOWER_ITEM_BLACK_GLASSES,
    BATTLE_TOWER_ITEM_BLACK_BELT,
    BATTLE_TOWER_ITEM_SOUL_DEW,
    BATTLE_TOWER_ITEM_CHOICE_BAND,
    BATTLE_TOWER_ITEM_MAGNET,
    BATTLE_TOWER_ITEM_SILK_SCARF,
    BATTLE_TOWER_ITEM_WHITE_HERB,
    BATTLE_TOWER_ITEM_DEEP_SEA_SCALE,
    BATTLE_TOWER_ITEM_DEEP_SEA_TOOTH,
    BATTLE_TOWER_ITEM_MYSTIC_WATER,
    BATTLE_TOWER_ITEM_SHARP_BEAK,
    BATTLE_TOWER_ITEM_QUICK_CLAW,
    BATTLE_TOWER_ITEM_LEFTOVERS,
    BATTLE_TOWER_ITEM_RAWST_BERRY,
    BATTLE_TOWER_ITEM_LIGHT_BALL,
    BATTLE_TOWER_ITEM_POISON_BARB,
    BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
    BATTLE_TOWER_ITEM_ASPEAR_BERRY,
    BATTLE_TOWER_ITEM_SPELL_TAG,
    BATTLE_TOWER_ITEM_BRIGHT_POWDER,
    BATTLE_TOWER_ITEM_LEPPA_BERRY,
    BATTLE_TOWER_ITEM_SCOPE_LENS,
    BATTLE_TOWER_ITEM_TWISTED_SPOON,
    BATTLE_TOWER_ITEM_METAL_COAT,
    BATTLE_TOWER_ITEM_MENTAL_HERB,
    BATTLE_TOWER_ITEM_CHARCOAL,
    BATTLE_TOWER_ITEM_PECHA_BERRY,
    BATTLE_TOWER_ITEM_SOFT_SAND,
    BATTLE_TOWER_ITEM_LUM_BERRY,
    BATTLE_TOWER_ITEM_DRAGON_SCALE,
    BATTLE_TOWER_ITEM_DRAGON_FANG,
    BATTLE_TOWER_ITEM_IAPAPA_BERRY,
    BATTLE_TOWER_ITEM_WIKI_BERRY,
    BATTLE_TOWER_ITEM_SEA_INCENSE,
    BATTLE_TOWER_ITEM_SHELL_BELL,
    BATTLE_TOWER_ITEM_SALAC_BERRY,
    BATTLE_TOWER_ITEM_LANSAT_BERRY,
    BATTLE_TOWER_ITEM_APICOT_BERRY,
    BATTLE_TOWER_ITEM_STARF_BERRY,
    BATTLE_TOWER_ITEM_LIECHI_BERRY,
    BATTLE_TOWER_ITEM_STICK,
    BATTLE_TOWER_ITEM_LAX_INCENSE,
    BATTLE_TOWER_ITEM_AGUAV_BERRY,
    BATTLE_TOWER_ITEM_FIGY_BERRY,
    BATTLE_TOWER_ITEM_THICK_CLUB,
    BATTLE_TOWER_ITEM_MAGO_BERRY,
    BATTLE_TOWER_ITEM_METAL_POWDER,
    BATTLE_TOWER_ITEM_PETAYA_BERRY,
    BATTLE_TOWER_ITEM_LUCKY_PUNCH,
    BATTLE_TOWER_ITEM_GANLON_BERRY,
};

struct BattleTowerPokemon
{
            u16 species;
            u8 heldItem;
            u8 teamFlags;
            u16 moves[4];
            u8 evSpread;
            u8 nature;
};

u16 GetCurrentBattleTowerWinStreak(u8);
void sub_8134AC0(struct BattleTowerRecord *);
u16 sub_8135D3C(u8);
void SetEReaderTrainerName(u8*);
u8 GetEReaderTrainerPicIndex(void);
u8 GetEReaderTrainerClassNameIndex(void);
void ValidateEReaderTrainer(void);
# 4 "src/engine/record_mixing.c" 2
# 1 "include/cable_club.h" 1



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
# 5 "include/cable_club.h" 2

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
# 5 "src/engine/record_mixing.c" 2
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
# 6 "src/engine/record_mixing.c" 2
# 1 "include/dewford_trend.h" 1



void InitDewfordTrend(void);
void sub_80FA4E4(void *, u32, u8);
void UpdateDewfordTrendPerDay(u16);
# 7 "src/engine/record_mixing.c" 2
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
# 8 "src/engine/record_mixing.c" 2
# 1 "include/fldeff_recordmixing.h" 1



u8 CreateRecordMixingSprite(void);
void DestroyRecordMixingSprite(void);
# 9 "src/engine/record_mixing.c" 2
# 1 "include/item.h" 1




typedef void (*ItemUseFunc)(u8);

struct Item
{
    u8 name[18];
    u16 itemId;
    u16 price;
    u8 holdEffect;
    u8 holdEffectParam;
    const u8 *description;
    u8 importance;
    u8 unk19;
    u8 pocket;
    u8 type;
    ItemUseFunc fieldUseFunc;
    u8 battleUsage;
    ItemUseFunc battleUseFunc;
    u8 secondaryId;
};

struct BagPocket
{
    struct ItemSlot *itemSlots;
    u8 capacity;
};



extern const struct BagPocket gBagPockets[5];

void CopyItemName(u16 itemId, u8 *string);
bool8 IsBagPocketNonEmpty(u8 pocket);
bool8 CheckBagHasItem(u16 itemId, u16 count);
bool8 CheckBagHasSpace(u16 itemId, u16 count);
bool8 AddBagItem(u16 itemId, u16 count);
bool8 RemoveBagItem(u16 itemId, u16 count);
u8 GetPocketByItemId(u16 itemId);
void ClearItemSlots(struct ItemSlot *itemSlots, u8 b);
u8 CountUsedPCItemSlots(void);
bool8 CheckPCHasItem(u16 itemId, u16 count);
bool8 AddPCItem(u16 itemId, u16 count);
void RemovePCItem(u8 index, u16 count);
void SwapRegisteredBike(void);
const struct Item *ItemId_GetItem(u16 itemId);
u16 ItemId_GetId(u16 itemId);
u16 ItemId_GetPrice(u16 itemId);
u8 ItemId_GetHoldEffect(u16 itemId);
u8 ItemId_GetHoldEffectParam(u16 itemId);
const u8 *ItemId_GetDescription(u16 itemId);
bool32 ItemId_CopyDescription(u8 *a, u32 itemId, u32 c);
u8 ItemId_GetImportance(u16 itemId);
u8 ItemId_GetUnknownValue(u16 itemId);
u8 ItemId_GetPocket(u16 itemId);
u8 ItemId_GetType(u16 itemId);
ItemUseFunc ItemId_GetFieldFunc(u16 itemId);
u8 ItemId_GetBattleUsage(u16 itemId);
ItemUseFunc ItemId_GetBattleFunc(u16 itemId);
u8 ItemId_GetSecondaryId(u16 itemId);
# 10 "src/engine/record_mixing.c" 2
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
# 11 "src/engine/record_mixing.c" 2
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
# 12 "src/engine/record_mixing.c" 2
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
# 13 "src/engine/record_mixing.c" 2
# 1 "include/mauville_man.h" 1




enum
{
    MAUVILLE_MAN_BARD,
    MAUVILLE_MAN_HIPSTER,
    MAUVILLE_MAN_TRADER,
    MAUVILLE_MAN_STORYTELLER,
    MAUVILLE_MAN_GIDDY,
};

void SetupMauvilleOldMan(void);
void sub_80F7F30(void);
void sub_80F83D0(void);
# 14 "src/engine/record_mixing.c" 2
# 1 "include/menu.h" 1




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
# 15 "src/engine/record_mixing.c" 2
# 1 "include/mystery_event_script.h" 1



u32 RunMysteryEventScript(u8 *);
void SetMysteryEventScriptStatus(u32 val);
u16 GetRecordMixingGift(void);
# 16 "src/engine/record_mixing.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 17 "src/engine/record_mixing.c" 2
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
# 18 "src/engine/record_mixing.c" 2
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
# 19 "src/engine/record_mixing.c" 2
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
# 20 "src/engine/record_mixing.c" 2
# 1 "include/secret_base.h" 1






void ResetSecretBases(void);
void sub_80BB5E4(void);
void sub_80BB63C(void);
void sub_80BB800(void);
void sub_80BB970(struct MapEvents *events);
u8 sub_80BBB24(void);
void sub_80BBCCC(u8 flagIn);
void sub_80BBFD8(struct MapPosition *, struct MapEvents *);
void sub_80BC038(struct MapPosition *, struct MapEvents *);
u8 sub_80BC050();
u8 *GetSecretBaseMapName(u8 *dest);
void sub_80BC300();
u8 sub_80BCCA4(u8 secretBaseIndex);
const u8 *sub_80BCCE8(void);
void sub_80BCF1C(u8 taskId);
void sub_80BD674(void *playerRecords, u32 size, u8 c);
# 21 "src/engine/record_mixing.c" 2
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
# 22 "src/engine/record_mixing.c" 2
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
# 23 "src/engine/record_mixing.c" 2
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
# 24 "src/engine/record_mixing.c" 2
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
# 25 "src/engine/record_mixing.c" 2
# 1 "include/task.h" 1
# 26 "src/engine/record_mixing.c" 2
# 1 "include/tv.h" 1



enum
{
    TVSHOW_FAN_CLUB_LETTER = 1,
    TVSHOW_RECENT_HAPPENINGS,
    TVSHOW_PKMN_FAN_CLUB_OPINIONS,
    TVSHOW_UNKN_SHOWTYPE_04,
    TVSHOW_NAME_RATER_SHOW,
    TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE,
    TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE,
    TVSHOW_POKEMON_TODAY_CAUGHT = 21,
    TVSHOW_SMART_SHOPPER,
    TVSHOW_POKEMON_TODAY_FAILED,
    TVSHOW_FISHING_ADVICE,
    TVSHOW_WORLD_OF_MASTERS,
    TVSHOW_MASS_OUTBREAK = 41,
};

void ClearTVShowData(void);
u8 sub_80BDEAC(u8 *);
void sub_80BE028(void);
void sub_80BE074(void);
void sub_80BE138(TVShow *show);
void sub_80BE160(TVShow *show);
void sub_80BE160(TVShow *);
void sub_80BE188(void);
void sub_80BE320(void);
void StartMassOutbreak(void);
void sub_80BE5FC(void);
void sub_80BE65C(void);
void sub_80BE6A0(void);
void nullsub_21(void);
void sub_80BE778(void);
void sub_80BE8EC(u16);
void UpdateMassOutbreakTimeLeft(u16);
void sub_80BE97C(u8);
void sub_80BE9D4();
void sub_80BEA50(u16);
void sub_80BEA5C(u16);
void sub_80BEA88(void);
void sub_80BEA88(void);
void sub_80BEB20(void);
int sub_80BEBC8(struct UnknownSaveStruct2ABC *arg0);
extern void sub_80BEBF4(void);
void sub_80BEC10(u8);
bool8 GetPriceReduction(u8);
bool8 IsPriceDiscounted(u8);
bool8 sub_80BEE48(u8);
void sub_80BEE84(u16);
size_t sub_80BF0B8(int);
bool8 sub_80BF1B4(u8);
void sub_80BF20C(void);
void sub_80BF334(void);
void sub_80BF3A4(void);
void sub_80BF3DC(void);
void sub_80BF46C(void);
void sub_80BF478(void);
void sub_80BF478(void);
void sub_80BF484(void);
void sub_80BF4BC(void);
void sub_80BF55C(TVShow tvShow[], u8 showidx);
void sub_80BF55C(TVShow tvShow[], u8 showidx);
void sub_80BF588(TVShow tvShows[]);
u16 sub_80BF674(u16 species);
void sub_80BF6D8(void);
s8 sub_80BF720(TVShow *);
s8 sub_80BF74C(TVShow tvShow[]);
bool8 sub_80BF77C(u16);
bool8 sub_80BF77C(u16);
u32 GetPlayerTrainerId(void);
void sub_80BFD44(u8 *, u32, u8);
u8 sub_80C004C(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C00B4(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C0134(TVShow *tv1, TVShow *tv2, u8 idx);
s8 sub_80C019C(TVShow tvShows[]);
void sub_80C01D4(void);
void sub_80C03A8(u8 showidx);
void sub_80C03C8(u16 species, u8 showidx);
void sub_80C0408(void);
bool8 sub_80C06E8(struct UnknownSaveStruct2ABC *arg0, struct UnknownSaveStruct2ABC *arg1, s8 arg2);
void TVShowConvertInternationalString(u8 *, u8 *, u8);
void DoTVShowTheNameRaterShow(void);
void DoTVShowPokemonTodaySuccessfulCapture(void);
void DoTVShowPokemonTodayFailedCapture(void);
void DoTVShowPokemonFanClubLetter(void);
void DoTVShowRecentHappenings(void);
void DoTVShowPokemonFanClubOpinions(void);
void nullsub_22(void);
void DoTVShowPokemonNewsMassOutbreak(void);
void DoTVShowPokemonAngler(void);
void DoTVShowTheWorldOfMasters(void);
void TVShowDone(void);
void UpdateTVScreensOnMap(int, int);
void ResetGabbyAndTy(void);
void TakeTVShowInSearchOfTrainersOffTheAir(void);
extern u8 GabbyAndTyGetBattleNum(void);
void sub_80C04A0(void);
void sub_80C0514(void *, u32, u8);
void DoTVShowBravoTrainerPokemonProfile(void);
void DoTVShowBravoTrainerBattleTowerProfile(void);
void DoTVShowTodaysSmartShopper(void);
void sub_80BE3BC(void);
void UpdateTVShowsPerDay(u16);
void sub_80C045C();
void sub_80BF088(u8, s32);
void sub_80BFD20(void);
# 27 "src/engine/record_mixing.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 28 "src/engine/record_mixing.c" 2

extern struct RecordMixingDayCareMail gUnknown_02038738;
extern u16 gSpecialVar_0x8005;

u32 gUnknown_03005D2C;

static u8 gUnknown_03000718;
static u8 gUnknown_0300071C[4];

void *recordMixingSecretBases = &gSaveBlock1.secretBases;
void *recordMixingTvShows = &gSaveBlock1.tvShows;
void *gUnknown_083D0274 = &gSaveBlock1.unknown_2ABC;
void *gUnknown_083D0278 = &gSaveBlock1.mauvilleMan;
void *recordMixingEasyChatPairs = &gSaveBlock1.easyChatPairs;
struct RecordMixingDayCareMail *gUnknown_083D0280 = &gUnknown_02038738;
void *gBattleTowerPlayerRecord = &gSaveBlock2.battleTower.playerRecord;



void sub_80B929C(void)
{
    sub_8083A84(Task_RecordMixing_Main);
}

struct PlayerRecords
{
    struct SecretBaseRecord secretBases[20];
    TVShow tvShows[25];
    u8 filler1004[0x40];
    u8 filler1044[0x40];
    struct EasyChatPair easyChatPairs[5];
    struct RecordMixingDayCareMail filler10AC;
    struct BattleTowerRecord battleTowerRecord;
    u16 filler11C8[0x34];
};

void RecordMixing_PrepareExchangePacket(void)
{
    sub_80BC300();
    sub_80C045C();

    memcpy((*(struct PlayerRecords *)(gSharedMem + 0x18000)).secretBases, recordMixingSecretBases, sizeof((*(struct PlayerRecords *)(gSharedMem + 0x18000)).secretBases));
    memcpy((*(struct PlayerRecords *)(gSharedMem + 0x18000)).tvShows, recordMixingTvShows, sizeof((*(struct PlayerRecords *)(gSharedMem + 0x18000)).tvShows));
    memcpy((*(struct PlayerRecords *)(gSharedMem + 0x18000)).filler1004, gUnknown_083D0274, sizeof((*(struct PlayerRecords *)(gSharedMem + 0x08000)).filler1004));
    memcpy((*(struct PlayerRecords *)(gSharedMem + 0x18000)).filler1044, gUnknown_083D0278, sizeof((*(struct PlayerRecords *)(gSharedMem + 0x08000)).filler1044));
    memcpy((*(struct PlayerRecords *)(gSharedMem + 0x18000)).easyChatPairs, recordMixingEasyChatPairs, sizeof((*(struct PlayerRecords *)(gSharedMem + 0x18000)).easyChatPairs));
    gUnknown_02038738.mail[0] = gSaveBlock1.daycare.misc.mail[0];
    gUnknown_02038738.mail[1] = gSaveBlock1.daycare.misc.mail[1];
    InitDaycareMailRecordMixing(gSaveBlock1.daycare.mons, &gUnknown_02038738);
    memcpy(&(*(struct PlayerRecords *)(gSharedMem + 0x18000)).filler10AC, gUnknown_083D0280, sizeof(struct RecordMixingDayCareMail));
    memcpy(&(*(struct PlayerRecords *)(gSharedMem + 0x18000)).battleTowerRecord, gBattleTowerPlayerRecord, sizeof(struct BattleTowerRecord));

    if (GetMultiplayerId() == 0)
        (*(struct PlayerRecords *)(gSharedMem + 0x18000)).filler11C8[0] = GetRecordMixingGift();
}

void RecordMixing_ReceiveExchangePacket(u32 a)
{
    sub_80BD674((*(struct PlayerRecords *)(gSharedMem + 0x08000)).secretBases, sizeof(struct PlayerRecords), a);
    sub_80BFD44((u8 *)(*(struct PlayerRecords *)(gSharedMem + 0x08000)).tvShows, sizeof(struct PlayerRecords), a);
    sub_80C0514((*(struct PlayerRecords *)(gSharedMem + 0x08000)).filler1004, sizeof(struct PlayerRecords), a);
    sub_80B9B1C((*(struct PlayerRecords *)(gSharedMem + 0x08000)).filler1044, sizeof(struct PlayerRecords), a);
    sub_80FA4E4((*(struct PlayerRecords *)(gSharedMem + 0x08000)).easyChatPairs, sizeof(struct PlayerRecords), a);
    sub_80B9C6C((u8 *)&(*(struct PlayerRecords *)(gSharedMem + 0x08000)).filler10AC, sizeof(struct PlayerRecords), a, (*(struct PlayerRecords *)(gSharedMem + 0x08000)).tvShows);
    sub_80B9B70(&(*(struct PlayerRecords *)(gSharedMem + 0x08000)).battleTowerRecord, sizeof(struct PlayerRecords), a);
    sub_80B9F3C((*(struct PlayerRecords *)(gSharedMem + 0x08000)).filler11C8, a);
}



void Task_RecordMixing_SoundEffect(u8 taskId)
{
    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] == 50)
    {
        PlaySE(SE_W213);
        gTasks[taskId].data[0] = 0;
    }
}







void Task_RecordMixing_Main(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8007270(gSpecialVar_0x8005);
        VarSet(0x4000, 1);
        gUnknown_03000718 = 0;
        RecordMixing_PrepareExchangePacket();
        CreateRecordMixingSprite();
        data[0] = 1;
        data[10] = CreateTask(sub_80B95F0, 0x50);
        data[15] = CreateTask(Task_RecordMixing_SoundEffect, 0x51);
        break;
    case 1:
        if (!gTasks[data[10]].isActive)
        {
            data[0] = 2;
            FlagSet(0x834);
            DestroyRecordMixingSprite();
            DestroyTask(data[15]);
        }
        break;
    case 2:
        data[10] = CreateTask(sub_80BA00C, 10);
        data[0] = 3;
        PlaySE(SE_W226);
        break;
    case 3:
        if (!gTasks[data[10]].isActive)
        {
            data[0] = 4;
            data[10] = sub_8083664();
            sub_80720B0();
            MenuPrint(gOtherText_MixingComplete, 2, 15);
            data[8] = 0;
        }
        break;
    case 4:
        data[8]++;
        if (data[8] > 60)
            data[0] = 5;
        break;
    case 5:
        if (!gTasks[data[10]].isActive)
        {
            sub_8055588();
            MenuZeroFillScreen();
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
        break;
    }
}

void sub_80B95F0(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        sub_80B9A78();
        MenuDisplayMessageBox();
        MenuPrint(gOtherText_MixingRecordsWithFriend, 2, 15);
        task->data[8] = 0x708;
        task->data[0] = 400;
        ClearLinkCallback_2();
        break;
    case 100:
        task->data[12]++;
        if (task->data[12] > 20)
        {
            task->data[12] = 0;
            task->data[0] = 101;
        }
        break;
    case 101:
        {
            u8 players = GetLinkPlayerCount_2();

            if (IsLinkMaster() == 1)
            {
                if (players == sub_800820C())
                {
                    PlaySE(SE_PIN);
                    task->data[0] = 201;
                    task->data[12] = 0;
                }
            }
            else
            {
                PlaySE(SE_BOO);
                task->data[0] = 301;
            }
        }
        break;
    case 201:
        if (sub_800820C() == GetLinkPlayerCount_2())
        {
            if (++task->data[12] > GetLinkPlayerCount_2() * 30)
            {
                sub_8007F4C();
                task->data[0] = 1;
            }
        }
        break;
    case 301:
        if (sub_800820C() == GetLinkPlayerCount_2())
            task->data[0] = 1;
        break;
    case 400:
        task->data[12]++;
        if (task->data[12] > 20)
        {
            task->data[0] = 1;
            task->data[12] = 0;
        }
        break;
    case 1:
        if (gReceivedRemoteLinkPlayers)
        {
            ConvertIntToDecimalStringN(gStringVar1, GetMultiplayerId_(), 2, 2);
            task->data[0] = 5;
        }
        break;
    case 2:
        {
            u8 subTaskId;

            task->data[6] = GetLinkPlayerCount_2();
            task->data[0] = 0;
            task->data[5] = GetMultiplayerId_();
            task->func = Task_RecordMixing_SendPacket;
            StorePtrInTaskData(&(*(struct PlayerRecords *)(gSharedMem + 0x18000)), &task->data[2]);
            subTaskId = CreateTask(Task_RecordMixing_CopyReceiveBuffer, 0x50);
            task->data[10] = subTaskId;
            gTasks[subTaskId].data[0] = taskId;
            StorePtrInTaskData((u8 *)&(*(struct PlayerRecords *)(gSharedMem + 0x08000)), &gTasks[subTaskId].data[5]);
        }
        break;
    case 5:
        task->data[10]++;
        if (task->data[10] > 60)
        {
            task->data[10] = 0;
            task->data[0] = 2;
        }
        break;
    }
}

void Task_RecordMixing_SendPacket(u8 taskId)
{
    struct Task *task = &gTasks[taskId];


    switch (task->data[0])
    {
    case 0:
        {
            void *recordData = (u8 *)LoadPtrFromTaskData(&task->data[2]) + 200 * task->data[4];

            memcpy(gBlockSendBuffer, recordData, 200);
            task->data[0]++;
        }
        break;
    case 1:
        if (GetMultiplayerId() == 0)
            sub_8007E9C(1);
        task->data[0]++;
        break;
    case 2:
        break;
    case 3:
        task->data[4]++;
        if ((u16)task->data[4] == 24)
            task->data[0]++;
        else
            task->data[0] = 0;
        break;
    case 4:
        if (!gTasks[task->data[10]].isActive)
            task->func = Task_RecordMixing_SendPacket_SwitchToReceive;
    }
}

void Task_RecordMixing_CopyReceiveBuffer(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s32 recvStatus = GetBlockReceivedStatus();
    u8 handledPlayers = 0;

    if (recvStatus == sub_8008198())
    {
        u8 player;

        for (player = 0; player < GetLinkPlayerCount(); player++)
        {
            void *src;
            u8 *dst;

            if ((recvStatus >> player) & 1)
            {
                dst = LoadPtrFromTaskData(&task->data[5]) + task->data[player + 1] * 200 + player * sizeof(struct PlayerRecords);
                src = GetPlayerRecvBuffer(player);
                if ((task->data[player + 1] + 1) * 200 > sizeof(struct PlayerRecords))
                    memcpy(dst, src, sizeof(struct PlayerRecords) - task->data[player + 1] * 200);
                else
                    memcpy(dst, src, 200);
                ResetBlockReceivedFlag(player);
                task->data[player + 1]++;
                if ((u16)task->data[player + 1] == 0x18)
                    handledPlayers++;
            }
        }
        gTasks[task->data[0]].data[0]++;
    }
    if (handledPlayers == GetLinkPlayerCount())
        DestroyTask(taskId);
}

void sub_80B99B4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (!gTasks[task->data[10]].isActive)
        DestroyTask(taskId);
}

void Task_RecordMixing_ReceivePacket(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->func = sub_80B99B4;
    if (gUnknown_03000718 == 1)
        RecordMixing_ReceiveExchangePacket(task->data[5]);
}

void Task_RecordMixing_SendPacket_SwitchToReceive(u8 taskId)
{
    gTasks[taskId].func = Task_RecordMixing_ReceivePacket;
    gUnknown_03000718 = 1;
}

void *LoadPtrFromTaskData(u16 *taskData)
{
    return (void *)(taskData[0] | (taskData[1] << 16));
}

void StorePtrInTaskData(void *ptr, u16 *taskData)
{
    taskData[0] = (u32)ptr;
    taskData[1] = (u32)ptr >> 16;
}

u8 GetMultiplayerId_(void)
{
    return GetMultiplayerId();
}

u16 *GetPlayerRecvBuffer(u8 player)
{
    return gBlockRecvBuffer[player];
}

void sub_80B9A78(void)
{
    gUnknown_03005D2C = sizeof(struct PlayerRecords);
}

const u8 gUnknown_083D0288[2] = {1, 0};

const u8 gUnknown_083D028A[2][3] =
{
    {1, 2, 0},
    {2, 0, 1},
};

const u8 gUnknown_083D0290[9][4] =
{
    {1, 0, 3, 2},
    {3, 0, 1, 2},
    {2, 0, 3, 1},
    {1, 3, 0, 2},
    {2, 3, 0, 1},
    {3, 2, 0, 1},
    {1, 2, 3, 0},
    {2, 3, 1, 0},
    {3, 2, 1, 0},
};

void sub_80B9A88(u8 *a)
{
    u32 i;
    u32 id;
    u32 players = GetLinkPlayerCount();

    switch (players)
    {
    case 2:
        for (i = 0; i < 2; i++)
            a[i] = gUnknown_083D0288[i];
        break;
    case 3:
        id = GetLinkPlayerTrainerId(0) % 2;
        for (i = 0; i < 3; i++)
            a[i] = gUnknown_083D028A[id][i];
        break;
    case 4:
        id = GetLinkPlayerTrainerId(0) % 9;
        for (i = 0; i < 4; i++)
            a[i] = gUnknown_083D0290[id][i];
        break;
    default:
        break;
    }
}

void sub_80B9B1C(u8 *a, size_t size, u8 index)
{
    u8 arr[4];
    u8 *ptr;

    sub_80B9A88(arr);

    memcpy(a + index * size, (ptr = gUnknown_083D0278), 0x40);
    memcpy(ptr, a + arr[index] * size, 0x40);
    sub_80F7F30();
}

void sub_80B9B70(void *battleTowerRecord, u32 size, u8 index)
{
    sub_80B9A88(gUnknown_0300071C);
    memcpy(battleTowerRecord + size * index, battleTowerRecord + size * gUnknown_0300071C[index], sizeof(struct BattleTowerRecord));
    sub_8134AC0(battleTowerRecord + size * index);
}

u8 sub_80B9BBC(u16 *a)
{
    return a[16];
}

void sub_80B9BC4(u8 *a, size_t b, u8 c[][2], u8 d, u8 e)
{
    struct DayCareMail *r6 = (struct DayCareMail *)(a + b * c[d][0]);
    struct DayCareMail *src = r6 + c[d][1];
    struct DayCareMail sp0 = *src;
    struct DayCareMail *r8 = (struct DayCareMail *)(a + b * c[e][0]);

    r6 += c[d][1];
    *r6 = *(r8 + c[e][1]);

    r8 += c[e][1];
    *r8 = sp0;
}

u8 sub_80B9C4C(u8 *a)
{
    int i;
    u8 r2 = 0;

    for (i = 0; i < 0x100; i++)
        r2 += a[i];
    return r2;
}

const u8 gUnknown_083D02B4[][2] =
{
    {0, 1},
    {1, 2},
    {2, 0},
};

const u8 gUnknown_083D02BA[3][4] =
{
    {0, 1, 2, 3},
    {0, 2, 1, 3},
    {0, 3, 2, 1},
};
# 638 "src/engine/record_mixing.c"
__attribute__((naked))
void sub_80B9C6C(u8 *a, u32 b, u8 c, void *d)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x58\n    str r0, [sp, 0x2C]\n    str r1, [sp, 0x30]\n    str r3, [sp, 0x38]\n    lsls r2, 24\n    lsrs r2, 24\n    str r2, [sp, 0x34]\n    bl Random\n    lsls r0, 16\n    lsrs r0, 16\n    str r0, [sp, 0x40]\n    ldr r0, _080B9DA8 @ =gLinkPlayers\n    ldrh r0, [r0, 0x4]\n    bl SeedRng\n    bl GetLinkPlayerCount\n    lsls r0, 24\n    lsrs r0, 24\n    mov r8, r0\n    movs r3, 0\n    add r0, sp, 0x1C\n    mov r9, r0\n    movs r1, 0x1D\n    add r1, sp\n    mov r10, r1\n    mov r2, sp\n    adds r2, 0xC\n    str r2, [sp, 0x4C]\n    movs r7, 0xFF\n    add r4, sp, 0x8\n    movs r2, 0\n    mov r6, r9\n    mov r5, r10\n_080B9CBC:\n    mov r1, sp\n    adds r1, r3\n    adds r1, 0x4\n    ldrb r0, [r1]\n    orrs r0, r7\n    strb r0, [r1]\n    adds r0, r4, r3\n    strb r2, [r0]\n    lsls r1, r3, 1\n    adds r0, r6, r1\n    strb r2, [r0]\n    adds r1, r5, r1\n    strb r2, [r1]\n    adds r0, r3, 0x1\n    lsls r0, 16\n    lsrs r3, r0, 16\n    cmp r3, 0x3\n    bls _080B9CBC\n    movs r4, 0\n    str r4, [sp, 0x3C]\n    movs r3, 0\n    mov r1, r8\n    lsls r0, r1, 16\n    lsrs r1, r0, 16\n    str r0, [sp, 0x50]\n    ldr r4, [sp, 0x30]\n    ldr r0, [sp, 0x34]\n    adds r2, r4, 0\n    muls r2, r0\n    str r2, [sp, 0x48]\n    ldr r2, [sp, 0x3C]\n    cmp r2, r1\n    bcs _080B9D46\n    mov r8, r1\n_080B9D00:\n    ldr r4, [sp, 0x30]\n    adds r0, r4, 0\n    muls r0, r3\n    ldr r1, [sp, 0x2C]\n    adds r6, r1, r0\n    ldr r0, [r6, 0x70]\n    cmp r0, 0\n    beq _080B9D3C\n    movs r7, 0\n    cmp r7, r0\n    bcs _080B9D3C\n    adds r4, r6, 0\n    adds r4, 0x74\n    mov r2, r9\n    lsls r1, r3, 1\n    movs r5, 0x1\n_080B9D20:\n    lsls r0, r7, 1\n    adds r0, r4, r0\n    ldrh r0, [r0]\n    cmp r0, 0\n    bne _080B9D30\n    adds r0, r7, r1\n    adds r0, r2, r0\n    strb r5, [r0]\n_080B9D30:\n    adds r0, r7, 0x1\n    lsls r0, 16\n    lsrs r7, r0, 16\n    ldr r0, [r6, 0x70]\n    cmp r7, r0\n    bcc _080B9D20\n_080B9D3C:\n    adds r0, r3, 0x1\n    lsls r0, 16\n    lsrs r3, r0, 16\n    cmp r3, r8\n    bcc _080B9D00\n_080B9D46:\n    movs r7, 0\n    movs r3, 0\n    ldr r2, [sp, 0x50]\n    cmp r2, 0\n    beq _080B9E3E\n    mov r4, sp\n    adds r4, 0x24\n    str r4, [sp, 0x44]\n    movs r0, 0x25\n    add r0, sp\n    mov r8, r0\n_080B9D5C:\n    ldr r1, [sp, 0x30]\n    adds r0, r1, 0\n    muls r0, r3\n    ldr r2, [sp, 0x2C]\n    adds r6, r2, r0\n    lsls r1, r3, 1\n    mov r4, r9\n    adds r0, r4, r1\n    ldrb r0, [r0]\n    cmp r0, 0x1\n    beq _080B9D7C\n    mov r2, r10\n    adds r0, r2, r1\n    ldrb r0, [r0]\n    cmp r0, 0x1\n    bne _080B9D86\n_080B9D7C:\n    ldr r0, [sp, 0x3C]\n    adds r0, 0x1\n    lsls r0, 24\n    lsrs r0, 24\n    str r0, [sp, 0x3C]\n_080B9D86:\n    mov r4, r9\n    adds r0, r4, r1\n    ldrb r0, [r0]\n    cmp r0, 0x1\n    bne _080B9DAC\n    mov r2, r10\n    adds r0, r2, r1\n    ldrb r2, [r0]\n    cmp r2, 0\n    bne _080B9DAC\n_080B9D9A:\n    lsls r1, r7, 1\n    ldr r4, [sp, 0x44]\n    adds r0, r4, r1\n    strb r3, [r0]\n    add r1, r8\n    strb r2, [r1]\n    b _080B9E2C\n    .align 2, 0\n_080B9DA8: .4byte gLinkPlayers\n_080B9DAC:\n    mov r2, r9\n    adds r0, r2, r1\n    ldrb r0, [r0]\n    cmp r0, 0\n    bne _080B9DC0\n    mov r4, r10\n    adds r0, r4, r1\n    ldrb r2, [r0]\n    cmp r2, 0x1\n    beq _080B9D9A\n_080B9DC0:\n    mov r2, r9\n    adds r0, r2, r1\n    ldrb r0, [r0]\n    cmp r0, 0x1\n    bne _080B9E32\n    mov r4, r10\n    adds r0, r4, r1\n    ldrb r0, [r0]\n    cmp r0, 0x1\n    bne _080B9E32\n    lsls r5, r7, 1\n    ldr r1, [sp, 0x44]\n    adds r0, r1, r5\n    strb r3, [r0]\n    adds r0, r6, 0\n    str r3, [sp, 0x54]\n    bl sub_80B9BBC\n    adds r4, r0, 0\n    lsls r4, 24\n    lsrs r4, 24\n    adds r0, r6, 0\n    adds r0, 0x38\n    bl sub_80B9BBC\n    lsls r0, 24\n    lsrs r1, r0, 24\n    ldr r3, [sp, 0x54]\n    cmp r4, 0\n    bne _080B9E0A\n    cmp r1, 0\n    beq _080B9E0E\n    mov r2, r8\n    adds r1, r2, r5\n    movs r0, 0x1\n    strb r0, [r1]\n    b _080B9E2C\n_080B9E0A:\n    cmp r1, 0\n    beq _080B9E26\n_080B9E0E:\n    str r3, [sp, 0x54]\n    bl Random\n    mov r4, r8\n    adds r2, r4, r5\n    lsls r0, 16\n    lsrs r0, 16\n    movs r1, 0x1\n    ands r0, r1\n    strb r0, [r2]\n    ldr r3, [sp, 0x54]\n    b _080B9E2C\n_080B9E26:\n    mov r2, r8\n    adds r0, r2, r5\n    strb r1, [r0]\n_080B9E2C:\n    adds r0, r7, 0x1\n    lsls r0, 16\n    lsrs r7, r0, 16\n_080B9E32:\n    adds r0, r3, 0x1\n    lsls r0, 16\n    lsrs r3, r0, 16\n    ldr r4, [sp, 0x50]\n    cmp r0, r4\n    bcc _080B9D5C\n_080B9E3E:\n    movs r3, 0\n    ldr r1, [sp, 0x48]\n    lsls r0, r1, 4\n    subs r0, r1\n    lsls r0, 3\n    ldr r2, [sp, 0x2C]\n    adds r6, r2, r0\n    ldr r1, [sp, 0x4C]\n_080B9E4E:\n    lsls r0, r3, 2\n    adds r0, r1, r0\n    str r6, [r0]\n    adds r0, r3, 0x1\n    lsls r0, 16\n    lsrs r3, r0, 16\n    cmp r3, 0x3\n    bls _080B9E4E\n    ldr r0, [sp, 0x38]\n    bl sub_80B9C4C\n    lsls r0, 24\n    lsrs r0, 24\n    movs r1, 0x3\n    bl __umodsi3\n    lsls r0, 24\n    lsrs r1, r0, 24\n    ldr r4, [sp, 0x3C]\n    cmp r4, 0x3\n    beq _080B9E9C\n    cmp r4, 0x3\n    bgt _080B9E82\n    cmp r4, 0x2\n    beq _080B9E8A\n    b _080B9EF0\n_080B9E82:\n    ldr r0, [sp, 0x3C]\n    cmp r0, 0x4\n    beq _080B9EBC\n    b _080B9EF0\n_080B9E8A:\n    add r2, sp, 0x24\n    movs r0, 0x1\n    str r0, [sp]\n    ldr r0, [sp, 0x2C]\n    ldr r1, [sp, 0x30]\n    movs r3, 0\n    bl sub_80B9BC4\n    b _080B9EF0\n_080B9E9C:\n    ldr r0, _080B9EB8 @ =gUnknown_083D02B4\n    lsls r1, 1\n    adds r2, r1, r0\n    ldrb r3, [r2]\n    adds r0, 0x1\n    adds r1, r0\n    ldrb r0, [r1]\n    add r2, sp, 0x24\n    str r0, [sp]\n    ldr r0, [sp, 0x2C]\n    ldr r1, [sp, 0x30]\n    bl sub_80B9BC4\n    b _080B9EF0\n    .align 2, 0\n_080B9EB8: .4byte gUnknown_083D02B4\n_080B9EBC:\n    add r6, sp, 0x24\n    ldr r4, _080B9F2C @ =gUnknown_083D02BA\n    lsls r5, r1, 2\n    adds r0, r5, r4\n    ldrb r3, [r0]\n    adds r0, r4, 0x1\n    adds r0, r5, r0\n    ldrb r0, [r0]\n    str r0, [sp]\n    ldr r0, [sp, 0x2C]\n    ldr r1, [sp, 0x30]\n    adds r2, r6, 0\n    bl sub_80B9BC4\n    adds r0, r4, 0x2\n    adds r0, r5, r0\n    ldrb r3, [r0]\n    adds r4, 0x3\n    adds r5, r4\n    ldrb r0, [r5]\n    str r0, [sp]\n    ldr r0, [sp, 0x2C]\n    ldr r1, [sp, 0x30]\n    adds r2, r6, 0\n    bl sub_80B9BC4\n_080B9EF0:\n    ldr r1, [sp, 0x2C]\n    ldr r2, [sp, 0x48]\n    adds r6, r1, r2\n    ldr r4, _080B9F30 @ =gSaveBlock1\n    ldr r1, _080B9F34 @ =0x0000303c\n    adds r0, r4, r1\n    adds r1, r6, 0\n    movs r2, 0x38\n    bl memcpy\n    ldr r2, _080B9F38 @ =0x00003074\n    adds r4, r2\n    adds r1, r6, 0\n    adds r1, 0x38\n    adds r0, r4, 0\n    movs r2, 0x38\n    bl memcpy\n    ldr r0, [sp, 0x40]\n    bl SeedRng\n    add sp, 0x58\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_080B9F2C: .4byte gUnknown_083D02BA\n_080B9F30: .4byte gSaveBlock1\n_080B9F34: .4byte 0x0000303c\n_080B9F38: .4byte 0x00003074\n    .syntax divided\n");
# 1008 "src/engine/record_mixing.c"
}


void sub_80B9F3C(u16 *a, u8 b)
{
    if (b != 0 && *a != 0)
    {
        if (GetPocketByItemId(*a) == 5)
        {
            if (!CheckBagHasItem(*a, 1) && !CheckPCHasItem(*a, 1) && AddBagItem(*a, 1))
            {
                VarSet(0x4001, *a);
                StringCopy(gStringVar1, gLinkPlayers[0].name);
                if (*a == ITEM_EON_TICKET)
                    FlagSet(0x853);
            }
            else
            {
                VarSet(0x4001, ITEM_NONE);
            }
        }
        else
        {
            if (AddBagItem(*a, 1) == 1)
            {
                VarSet(0x4001, *a);
                StringCopy(gStringVar1, gLinkPlayers[0].name);
            }
            else
            {
                VarSet(0x4001, ITEM_NONE);
            }
        }
    }
}

void sub_80BA00C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[0]++;
        break;
    case 1:
        task->data[0]++;
        break;
    case 2:
        SetSecretBase2Field_9_AndHideBG();
        sub_8125E2C();
        task->data[0]++;
        break;
    case 3:
        if (sub_8125E6C() != 0)
        {
            ClearSecretBase2Field_9_2();
            task->data[0]++;
            task->data[1] = 0;
        }
        break;
    case 4:
        task->data[1]++;
        if (task->data[1] > 10)
        {
            sub_800832C();
            task->data[0]++;
        }
        break;
    case 5:
        if (!gReceivedRemoteLinkPlayers)
            DestroyTask(taskId);
        break;
    }
}
