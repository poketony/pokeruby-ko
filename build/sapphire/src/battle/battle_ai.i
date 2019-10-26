# 1 "src/battle/battle_ai.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/battle/battle_ai.c"
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
# 2 "src/battle/battle_ai.c" 2
# 1 "include/battle_ai.h" 1



enum
{
    TARGET,
    USER
};


enum
{
    AIState_SettingUp,
    AIState_Processing,
    AIState_FinishedProcessing,
    AIState_DoNotProcess
};


void BattleAI_SetupAIData(void);
u8 BattleAI_GetAIActionToUse(void);
void BattleAI_DoAIProcessing(void);
void sub_810745C(void);
void AIStackPushVar(u8 *);
u8 AIStackPop(void);
void BattleAI_HandleItemUseBeforeAISetup(void);
# 3 "src/battle/battle_ai.c" 2
# 1 "include/abilities.h" 1



enum
{
    ABILITY_NONE,
    ABILITY_STENCH,
    ABILITY_DRIZZLE,
    ABILITY_SPEED_BOOST,
    ABILITY_BATTLE_ARMOR,
    ABILITY_STURDY,
    ABILITY_DAMP,
    ABILITY_LIMBER,
    ABILITY_SAND_VEIL,
    ABILITY_STATIC,
    ABILITY_VOLT_ABSORB,
    ABILITY_WATER_ABSORB,
    ABILITY_OBLIVIOUS,
    ABILITY_CLOUD_NINE,
    ABILITY_COMPOUND_EYES,
    ABILITY_INSOMNIA,
    ABILITY_COLOR_CHANGE,
    ABILITY_IMMUNITY,
    ABILITY_FLASH_FIRE,
    ABILITY_SHIELD_DUST,
    ABILITY_OWN_TEMPO,
    ABILITY_SUCTION_CUPS,
    ABILITY_INTIMIDATE,
    ABILITY_SHADOW_TAG,
    ABILITY_ROUGH_SKIN,
    ABILITY_WONDER_GUARD,
    ABILITY_LEVITATE,
    ABILITY_EFFECT_SPORE,
    ABILITY_SYNCHRONIZE,
    ABILITY_CLEAR_BODY,
    ABILITY_NATURAL_CURE,
    ABILITY_LIGHTNING_ROD,
    ABILITY_SERENE_GRACE,
    ABILITY_SWIFT_SWIM,
    ABILITY_CHLOROPHYLL,
    ABILITY_ILLUMINATE,
    ABILITY_TRACE,
    ABILITY_HUGE_POWER,
    ABILITY_POISON_POINT,
    ABILITY_INNER_FOCUS,
    ABILITY_MAGMA_ARMOR,
    ABILITY_WATER_VEIL,
    ABILITY_MAGNET_PULL,
    ABILITY_SOUNDPROOF,
    ABILITY_RAIN_DISH,
    ABILITY_SAND_STREAM,
    ABILITY_PRESSURE,
    ABILITY_THICK_FAT,
    ABILITY_EARLY_BIRD,
    ABILITY_FLAME_BODY,
    ABILITY_RUN_AWAY,
    ABILITY_KEEN_EYE,
    ABILITY_HYPER_CUTTER,
    ABILITY_PICKUP,
    ABILITY_TRUANT,
    ABILITY_HUSTLE,
    ABILITY_CUTE_CHARM,
    ABILITY_PLUS,
    ABILITY_MINUS,
    ABILITY_FORECAST,
    ABILITY_STICKY_HOLD,
    ABILITY_SHED_SKIN,
    ABILITY_GUTS,
    ABILITY_MARVEL_SCALE,
    ABILITY_LIQUID_OOZE,
    ABILITY_OVERGROW,
    ABILITY_BLAZE,
    ABILITY_TORRENT,
    ABILITY_SWARM,
    ABILITY_ROCK_HEAD,
    ABILITY_DROUGHT,
    ABILITY_ARENA_TRAP,
    ABILITY_VITAL_SPIRIT,
    ABILITY_WHITE_SMOKE,
    ABILITY_PURE_POWER,
    ABILITY_SHELL_ARMOR,
    ABILITY_CACOPHONY,
    ABILITY_AIR_LOCK
};
# 4 "src/battle/battle_ai.c" 2
# 1 "include/battle.h" 1
# 224 "include/battle.h"
enum
{
    BATTLE_TERRAIN_GRASS,
    BATTLE_TERRAIN_LONG_GRASS,
    BATTLE_TERRAIN_SAND,
    BATTLE_TERRAIN_UNDERWATER,
    BATTLE_TERRAIN_WATER,
    BATTLE_TERRAIN_POND,
    BATTLE_TERRAIN_MOUNTAIN,
    BATTLE_TERRAIN_CAVE,
    BATTLE_TERRAIN_BUILDING,
    BATTLE_TERRAIN_PLAIN,
};

struct Trainer
{
             u8 partyFlags;
             u8 trainerClass;
             u8 encounterMusic_gender;
             u8 trainerPic;
             u8 trainerName[12];
             u16 items[4];
             bool8 doubleBattle;
             u32 aiFlags;
             u8 partySize;
             void *party;
};

struct UnkBattleStruct1
{
             u16 movesUsed[2][8];
             u8 unk20[2];
             u8 unk22[2];
             u16 items[4];
             u8 numOfItems;
};

struct AI_Stack
{
    u8 *ptr[8];
    u8 size;
};

struct AI_ThinkingStruct
{
           u8 aiState;
           u8 movesetIndex;
           u16 moveConsidered;
           s8 score[4];
           u32 funcResult;
           u32 aiFlags;
           u8 aiAction;
           u8 aiLogicId;
           u8 filler12[6];
           u8 simulatedRNG[4];
};

struct BattleStruct
{
                u8 unk0;
                bool8 unk1;
                u8 unk2;
                bool8 unk3;
    u8 filler4[0x15DDA];
                u8 unk15DDE;
                u8 unk15DDF;
                u8 filler15DE0[0x220];
                u8 turnEffectsTracker;
                u8 turnEffectsBank;
                u8 animTurn;
                u8 scriptingActive;
                u8 wrappedMove[8];
                u8 cmd49StateTracker;
                u8 unk1600D;
                u8 turncountersTracker;
                u8 atk23StateTracker;
                u8 moveTarget[4];
                u8 unk16014;
                u8 unk16015;
                u8 unk16016;
                u8 unk16017;
                u8 expGetterID;
                u8 unk16019;
                u8 atk5A_StateTracker;
                u8 wildVictorySong;
                u8 dynamicMoveType;
                u8 unk1601D;
                u8 statChanger;
                u8 dmgMultiplier;
                u8 wrappedBy[4];
                u8 unk16024;
                u8 unk16025;
                u8 unk16026;
                u8 unk16027;
                u8 unk16028;
                u8 unk16029;
                u8 unk1602A;
                u8 unk1602B;
                u8 unk1602C;
                u8 unk1602D;
                u8 unk1602E;
                u8 unk1602F;
                u8 unk16030;
                u8 unk16031;
                u8 unk16032;
                u8 unk16033;
                u8 unk16034;
                u8 unk16035;
                u8 unk16036;
                u8 unk16037;
                u8 unk16038;
                u8 unk16039;
                u8 unk1603A;
                u8 unk1603B;
                u8 unk1603C;
                u8 unk1603D;
                u8 unk1603E;
                u8 unk1603F;
                u8 unk16040;
                u8 unk16041;
                u8 unk16042;
                u8 unk16043;
                u8 unk16044;
                u8 unk16045;
                u8 unk16046;
                u8 unk16047;
                u8 unk16048;
                u8 unk16049;
                u8 unk1604A;
                u8 unk1604B;
                u8 unk1604C;
                u8 unk1604D;
                u8 unk1604E;
                u8 unk1604F;
                u8 unk16050;
                u8 unk16051;
                u8 unk16052;
                u8 unk16053;
                u8 unk16054;
                u8 unk16055;
                u8 moneyMultiplier;
                u8 unk16057;
                u8 unk16058;
                u8 sub80173A4_Tracker;
                u8 unk1605A;
                u8 unk1605B;
                u16 exp;
                u8 unk1605E;
                u8 sentInPokes;
                u8 unk16060[4];
                u8 unk16064[4];
                u8 unk16068[4];
                u8 unk1606C[4][3];
                u8 unk16078;
                u8 caughtNick[11];
                u8 unk16084;
                u8 unk16085;
                u8 unk16086;
                u8 unk16087;
                u8 safariFleeRate;
                u8 unk16089;
                u8 unk1608A;
                u8 unk1608B;
                u8 ChosenMoveID[4];
                s32 bideDmg;
                u8 unk16094;
                u8 unk16095;
                u8 unk16096;
                u8 unk16097;
                u8 unk16098;
                u8 unk16099;
                u8 unk1609a;
                u8 castformToChangeInto;
                u8 atk6C_statetracker;
                u8 unk1609D;
                u8 unk1609E;
                u8 unk1609F;
                u8 stringMoveType;
                u8 animTargetsHit;
                u8 expGetterBank;
                u8 unk160A3;
                u8 animArg1;
                u8 animArg2;
                u8 unk160A6;
                u8 unk160A7;
                u8 unk160A8;
                u8 unk160A9;
                u8 unk160Aa;
                u8 unk160Ab;
                u8 unk160AC;
                u8 unk160AD;
                u8 unk160AE;
                u8 unk160AF;
                u8 unk160B0;
                u8 unk160B1;
                u8 unk160B2;
                u8 unk160B3;
                u8 unk160B4;
                u8 unk160B5;
                u8 unk160B6;
                u8 unk160B7;
                u8 unk160B8;
                u8 unk160B9;
                u8 unk160Ba;
                u8 unk160Bb;
                u16 HP_OnSwitchout[2];
                u8 unk160C0;
                u8 hpScale;
                u8 unk160C2;
                u8 unk160C3;
                u8 unk160C4;
                u8 unk160C5;
                u8 unk160C6;
                u8 unk160C7;
                u8 unk160C8;
                u8 unk160C9;
                u8 synchroniseEffect;
                u8 linkPlayerIndex;
                u16 usedHeldItems[4];
                u8 unk160D4;
                u8 unk160D5;
                u8 unk160D6;
                u8 unk160D7;
                u8 unk160D8;
                u8 unk160D9;
                u8 unk160DA;
                u8 unk160DB;
                u8 unk160DC;
                u8 intimidateBank;
                u8 unk160DE;
                u8 unk160DF;
                u8 unk160E0;
                u8 unk160E1;
                u8 unk160E2;
                u8 unk160E3;
                u8 unk160E4;
                u8 unk160E5;
                u8 unk160E6;
                u8 atkCancellerTracker;
                u8 unk160E8;
                u8 unk160E9;
                u8 unk160EA;
                u8 unk160EB;
                u8 unk160EC;
                u8 unk160ED;
                u8 unk160EE;
                u8 unk160EF;
                u8 unk160F0;
                u8 unk160F1;
                u8 unk160F2;
                u8 unk160F3;
                u8 unk160F4;
                u8 unk160F5;
                u8 unk160F6;
                u8 unk160F7;
                u8 unk160F8;
                u8 unk160F9;
                u8 unk160FA;
                u8 unk160FB;
                u8 turnSideTracker;
                u8 unk160FD;
                u8 unk160FE;
                u8 unk160FF;
             u8 unk16100;
                u8 unk16101;
                u8 unk16102;
                u8 unk16103;
                u8 unk16104;
                u8 unk16105;
                u8 unk16106;
                u8 unk16107;
                u8 unk16108;
                u8 unk16109;
                u8 unk1610A;
                u8 unk1610B;
                u8 unk1610C;
                u8 unk1610D;
                u8 unk1610E;
                u8 unk1610F;
                u8 sub80170DC_Tracker;
                u8 sub80170DC_Bank;
                u8 unk16112;
                u8 unk16113;
                u8 unk16114;
                u8 unk16115;
                u8 unk16116;
                u8 unk16117;
                u8 unk16118;
                u8 unk16119;
                u8 unk1611A;
                u8 unk1611B;
                u8 unk1611C;
                u8 unk1611D;
                u8 unk1611E;
                u8 unk1611F;


                  struct UnkBattleStruct1 unk_2016A00_2;
};

struct DisableStruct
{
             u32 unk0;
             u16 disabledMove;
             u16 encoredMove;
             u8 protectUses;
             u8 stockpileCounter;
             u8 substituteHP;
             u8 disableTimer1 : 4;
             u8 disableTimer2 : 4;
             u8 encoredMovePos;
             u8 unkD;
             u8 encoreTimer1 : 4;
             u8 encoreTimer2 : 4;
             u8 perishSong1 : 4;
             u8 perishSong2 : 4;
             u8 furyCutterCounter;
             u8 rolloutTimer1 : 4;
             u8 rolloutTimer2 : 4;
             u8 chargeTimer1 : 4;
             u8 chargeTimer2 : 4;
             u8 tauntTimer1:4;
             u8 tauntTimer2:4;
             u8 bankPreventingEscape;
             u8 bankWithSureHit;
             u8 isFirstTurn;
             u8 unk17;
             u8 truantCounter : 1;
             u8 unk18_a : 3;
             u8 unk18_b : 4;
             u8 rechargeCounter;
             u8 unk1A[2];
};

struct BattleResults
{
    u8 playerFaintCounter;
    u8 opponentFaintCounter;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5_0:1;
    u8 unk5_1:1;
    u16 poke1Species;
    u8 pokeString1[10];
    u8 unk12;
    u8 battleTurnCounter;
    u8 pokeString2[10];
    u8 filler1E[2];
    u16 lastOpponentSpecies;
    u16 lastUsedMove;
    u16 opponentMove;
    u16 opponentSpecies;
    u16 caughtPoke;
    u8 caughtNick[10];
    u8 filler34[2];
    u8 unk36[10];
};

struct Struct2017100
{
    u32 arr[4];
};

struct Struct2019348
{
    u16 unk0;
    u16 unk2;
    u8 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
};

struct Struct2017800
{
    u8 invisible:1;
    u8 unk0_1:1;
    u8 substituteSprite:1;
    u8 unk0_3:1;
    u8 unk0_4:1;
    u16 transformedSpecies;
};

struct Struct2017810
{
          u8 unk0_0:1;
          u8 unk0_1:1;
          u8 unk0_2:1;
          u8 unk0_3:1;
          u8 unk0_4:1;
          u8 unk0_5:1;
          u8 unk0_6:1;
          u8 unk0_7:1;
          u8 unk1_0:1;
          u8 unk1_1:5;
          u8 unk2;
          u8 unk3;
          u8 unk4;
          u8 unk5;
          u8 unk6;
          u8 unk7;
          u8 unk8;
          u8 unk9;
          u8 fillerA[2];
};

struct Struct2017840
{
    u16 unk0;
    u8 filler2[6];
    u8 unk8;
    u8 unk9_0:1;
};

struct Struct20238C8
{
    u8 unk0_0:7;
    u8 unk0_7:1;
};

struct ProtectStruct
{

    u32 protected:1;
    u32 endured:1;
    u32 onlyStruggle:1;
    u32 helpingHand:1;
    u32 bounceMove:1;
    u32 stealMove:1;
    u32 flag0Unknown:1;
    u32 prlzImmobility:1;

    u32 confusionSelfDmg:1;
    u32 notEffective:1;
    u32 chargingTurn:1;
    u32 fleeFlag:2;
    u32 usedImprisionedMove:1;
    u32 loveImmobility:1;
    u32 usedDisabledMove:1;

    u32 usedTauntedMove:1;
    u32 flag2Unknown:1;
    u32 flinchImmobility:1;
    u32 notFirstStrike:1;
    u32 free : 4;

    u32 field3 : 8;
    u32 physicalDmg;
    u32 specialDmg;
    u8 physicalBank;
    u8 specialBank;
    u16 fieldE;
};

struct SpecialStatus
{
    u8 statLowered : 1;
    u8 lightningRodRedirected : 1;
    u8 restoredBankSprite: 1;
    u8 intimidatedPoke : 1;
    u8 traced : 1;
    u8 flag20 : 1;
    u8 flag40 : 1;
    u8 focusBanded : 1;
    u8 field1[3];
    s32 moveturnLostHP;
    s32 moveturnLostHP_physical;
    s32 moveturnLostHP_special;
    u8 moveturnPhysicalBank;
    u8 moveturnSpecialBank;
    u8 field12;
    u8 field13;
};

struct sideTimer
{
    u8 reflectTimer;
    u8 lightscreenTimer;
    u8 mistTimer;
    u8 field3;
    u16 field4;
    u8 spikesAmount;
    u8 safeguardTimer;
    u8 followmeTimer;
    u8 followmeTarget;
    u8 fieldA;
    u8 fieldB;
};

struct WishFutureKnock
{
    u8 futureSightCounter[4];
    u8 futureSightAttacker[4];
    s32 futureSightDmg[4];
    u16 futureSightMove[4];
    u8 wishCounter[4];
    u8 wishUserID[4];
    u8 weatherDuration;
    u16 knockedOffPokes;
};

extern struct UnkBattleStruct1 unk_2016A00;
extern struct DisableStruct gDisableStructs[4];
extern struct BattleResults gBattleResults;
extern struct ProtectStruct gProtectStructs[4];
extern struct SpecialStatus gSpecialStatuses[4];
extern struct sideTimer gSideTimer[2];
extern struct WishFutureKnock gWishFutureKnock;
extern struct AI_ThinkingStruct gAIThinkingSpace;
extern struct Struct20238C8 gUnknown_020238C8;
# 762 "include/battle.h"
typedef void (*BattleCmdFunc)(void);

struct funcStack
{
    void* ptr[8];
    u8 size;
};

struct scriptsStack
{
    u8* ptr[8];
    u8 size;
};

extern u8 gBattleTextBuff1[];


void EmitGetAttributes(u8 buffID, u8 request, u8 c);
void Emitcmd1(u8 a, u8 b, u8 c);
void EmitSetAttributes(u8 a, u8 request, u8 c, u8 bytes, void *data);
void EmitSendOutPoke(u8 a, u8 b, u8 c);
void EmitReturnPokeToBall(u8 a, u8 b);
void EmitTrainerSlide(u8 a);
void Emitcmd10(u8 a);
void EmitBallThrow(u8 a, u8 shakes);

void EmitPrintString(u8 a, u16 stringID);

void EmitChoosePokemon(u8 a, u8 b, u8 c, u8 d, u8 *e);


void EmitStatusIconUpdate(u8 a, u32 b, u32 c);
void EmitStatusAnimation(u8 a, u8 b, u32 c);
void EmitStatusXor(u8 a, u8 b);
void EmitHitAnimation(u8 a);
void EmitEffectivenessSound(u8 a, u16 sound);
void Emitcmd44(u8 a, u16 sound);
void EmitFaintingCry(u8 a);
void EmitIntroSlide(u8 a, u8 b);
void Emitcmd49(u8 a);
void EmitSpriteInvisibility(u8 a, u8 b);
void EmitBattleAnimation(u8 a, u8 b, u16 c);
void EmitResetActionMoveSelection(u8 a, u8 b);
void Emitcmd55(u8 a, u8 b);
# 818 "include/battle.h"
void MarkBufferBankForExecution(u8 bank);

extern u8 gBattleTextBuff1[];


void sub_800D6D4();
void sub_800D74C();
void sub_800D7B8(void);
void sub_800DAB8();
void sub_800DE30(u8);
void sub_800E23C();


void sub_800E7C4(void);
void InitBattle(void);
void sub_800EC9C(void);
void sub_800F104(void);
void sub_800F298(void);
void sub_800F808(void);
void sub_800F838(struct Sprite *);
u8 CreateNPCTrainerParty(struct Pokemon *, u16);
void sub_800FCFC(void);
void c2_8011A1C(void);
void sub_80101B8(void);
void c2_081284E0(void);
void sub_8010278(struct Sprite *);
void sub_80102AC(struct Sprite *);
void nullsub_37(struct Sprite *);
void sub_8010320(struct Sprite *);
void sub_8010494(struct Sprite *);
void sub_801053C(struct Sprite *);
void oac_poke_ally_(struct Sprite *);
void nullsub_86(struct Sprite *);
void objc_dp11b_pingpong(struct Sprite *);
void nullsub_41(void);
void sub_8010800(void);
void sub_8010824(void);
void sub_8010874(void);
void bc_8012FAC(void);
void sub_8011384(void);
void bc_801333C(void);
void bc_battle_begin_message(void);
void bc_8013568(void);
void sub_8011800(void);
void sub_8011834(void);
void bc_801362C(void);
void sub_8011970(void);
void sub_80119B4(void);
void BattleBeginFirstTurn(void);
void BattleTurnPassed(void);


void sub_8012324(void);
void sub_8012FBC(u8, u8);
u8 GetWhoStrikesFirst(u8, u8, u8);
void TurnValuesCleanUp(u8);
void SpecialStatusesClear(void);
void sub_80138F0(void);
void sub_80155A4();
void CancelMultiTurnMoves(u8 bank);
void PrepareStringBattle();
void sub_80156DC();
void sub_80157C4(u8 index);


u8 CheckMoveLimitations(u8 bank, u8 unusableMoves, u8 check);
u8 UpdateTurnCounters(void);
u8 TurnBasedEffects(void);
u8 sub_80170DC();
u8 sub_80173A4();
u8 AbilityBattleEffects(u8 caseID, u8 bank, u8 ability, u8 special, u16 move);
u8 ItemBattleEffects(u8 caseID, u8 bank, bool8 moveTurn);


void AI_CalcDmg(u8, u8);
u8 TypeCalc(u16 move, u8 bank_atk, u8 bank_def);


void nullsub_91(void);
void SetBankFuncToPlayerBufferRunCommand(void);
void sub_802C098();
void c3_0802FDF4(u8);
void sub_802E3E4(u8, int);
void nullsub_8(u8);
void sub_802E414(void);
void sub_802E424(void);


void move_anim_start_t4(u8 a, u8 b, u8 c, u8 d);
void nullsub_9(u16);
void nullsub_10(int);
void load_gfxc_health_bar();
u8 battle_load_something();
void sub_8031F88(u8);
void sub_80324F8(struct Pokemon *, u8);
void sub_8032638();
void sub_8032AA8(u8, u8);
void SetBankFuncToOpponentBufferRunCommand(void);


void SetBankFuncToLinkOpponentBufferRunCommand(void);
# 5 "src/battle/battle_ai.c" 2
# 1 "include/battle_move_effects.h" 1



enum
{
    EFFECT_HIT,
    EFFECT_SLEEP,
    EFFECT_POISON_HIT,
    EFFECT_ABSORB,
    EFFECT_BURN_HIT,
    EFFECT_FREEZE_HIT,
    EFFECT_PARALYZE_HIT,
    EFFECT_EXPLOSION,
    EFFECT_DREAM_EATER,
    EFFECT_MIRROR_MOVE,
    EFFECT_ATTACK_UP,
    EFFECT_DEFENSE_UP,
    EFFECT_SPEED_UP,
    EFFECT_SPECIAL_ATTACK_UP,
    EFFECT_SPECIAL_DEFENSE_UP,
    EFFECT_ACCURACY_UP,
    EFFECT_EVASION_UP,
    EFFECT_ALWAYS_HIT,
    EFFECT_ATTACK_DOWN,
    EFFECT_DEFENSE_DOWN,
    EFFECT_SPEED_DOWN,
    EFFECT_SPECIAL_ATTACK_DOWN,
    EFFECT_SPECIAL_DEFENSE_DOWN,
    EFFECT_ACCURACY_DOWN,
    EFFECT_EVASION_DOWN,
    EFFECT_HAZE,
    EFFECT_BIDE,
    EFFECT_RAMPAGE,
    EFFECT_ROAR,
    EFFECT_MULTI_HIT,
    EFFECT_CONVERSION,
    EFFECT_FLINCH_HIT,
    EFFECT_RESTORE_HP,
    EFFECT_TOXIC,
    EFFECT_PAY_DAY,
    EFFECT_LIGHT_SCREEN,
    EFFECT_TRI_ATTACK,
    EFFECT_REST,
    EFFECT_OHKO,
    EFFECT_RAZOR_WIND,
    EFFECT_SUPER_FANG,
    EFFECT_DRAGON_RAGE,
    EFFECT_TRAP,
    EFFECT_HIGH_CRITICAL,
    EFFECT_DOUBLE_HIT,
    EFFECT_RECOIL_IF_MISS,
    EFFECT_MIST,
    EFFECT_FOCUS_ENERGY,
    EFFECT_RECOIL,
    EFFECT_CONFUSE,
    EFFECT_ATTACK_UP_2,
    EFFECT_DEFENSE_UP_2,
    EFFECT_SPEED_UP_2,
    EFFECT_SPECIAL_ATTACK_UP_2,
    EFFECT_SPECIAL_DEFENSE_UP_2,
    EFFECT_ACCURACY_UP_2,
    EFFECT_EVASION_UP_2,
    EFFECT_TRANSFORM,
    EFFECT_ATTACK_DOWN_2,
    EFFECT_DEFENSE_DOWN_2,
    EFFECT_SPEED_DOWN_2,
    EFFECT_SPECIAL_ATTACK_DOWN_2,
    EFFECT_SPECIAL_DEFENSE_DOWN_2,
    EFFECT_ACCURACY_DOWN_2,
    EFFECT_EVASION_DOWN_2,
    EFFECT_REFLECT,
    EFFECT_POISON,
    EFFECT_PARALYZE,
    EFFECT_ATTACK_DOWN_HIT,
    EFFECT_DEFENSE_DOWN_HIT,
    EFFECT_SPEED_DOWN_HIT,
    EFFECT_SPECIAL_ATTACK_DOWN_HIT,
    EFFECT_SPECIAL_DEFENSE_DOWN_HIT,
    EFFECT_ACCURACY_DOWN_HIT,
    EFFECT_EVASION_DOWN_HIT,
    EFFECT_SKY_ATTACK,
    EFFECT_CONFUSE_HIT,
    EFFECT_TWINEEDLE,
    EFFECT_VITAL_THROW,
    EFFECT_SUBSTITUTE,
    EFFECT_RECHARGE,
    EFFECT_RAGE,
    EFFECT_MIMIC,
    EFFECT_METRONOME,
    EFFECT_LEECH_SEED,
    EFFECT_SPLASH,
    EFFECT_DISABLE,
    EFFECT_LEVEL_DAMAGE,
    EFFECT_PSYWAVE,
    EFFECT_COUNTER,
    EFFECT_ENCORE,
    EFFECT_PAIN_SPLIT,
    EFFECT_SNORE,
    EFFECT_CONVERSION_2,
    EFFECT_LOCK_ON,
    EFFECT_SKETCH,
    EFFECT_UNUSED_60,
    EFFECT_SLEEP_TALK,
    EFFECT_DESTINY_BOND,
    EFFECT_FLAIL,
    EFFECT_SPITE,
    EFFECT_FALSE_SWIPE,
    EFFECT_HEAL_BELL,
    EFFECT_QUICK_ATTACK,
    EFFECT_TRIPLE_KICK,
    EFFECT_THIEF,
    EFFECT_MEAN_LOOK,
    EFFECT_NIGHTMARE,
    EFFECT_MINIMIZE,
    EFFECT_CURSE,
    EFFECT_UNUSED_6E,
    EFFECT_PROTECT,
    EFFECT_SPIKES,
    EFFECT_FORESIGHT,
    EFFECT_PERISH_SONG,
    EFFECT_SANDSTORM,
    EFFECT_ENDURE,
    EFFECT_ROLLOUT,
    EFFECT_SWAGGER,
    EFFECT_FURY_CUTTER,
    EFFECT_ATTRACT,
    EFFECT_RETURN,
    EFFECT_PRESENT,
    EFFECT_FRUSTRATION,
    EFFECT_SAFEGUARD,
    EFFECT_THAW_HIT,
    EFFECT_MAGNITUDE,
    EFFECT_BATON_PASS,
    EFFECT_PURSUIT,
    EFFECT_RAPID_SPIN,
    EFFECT_SONICBOOM,
    EFFECT_UNUSED_83,
    EFFECT_MORNING_SUN,
    EFFECT_SYNTHESIS,
    EFFECT_MOONLIGHT,
    EFFECT_HIDDEN_POWER,
    EFFECT_RAIN_DANCE,
    EFFECT_SUNNY_DAY,
    EFFECT_DEFENSE_UP_HIT,
    EFFECT_ATTACK_UP_HIT,
    EFFECT_ALL_STATS_UP_HIT,
    EFFECT_UNUSED_8D,
    EFFECT_BELLY_DRUM,
    EFFECT_PSYCH_UP,
    EFFECT_MIRROR_COAT,
    EFFECT_SKULL_BASH,
    EFFECT_TWISTER,
    EFFECT_EARTHQUAKE,
    EFFECT_FUTURE_SIGHT,
    EFFECT_GUST,
    EFFECT_FLINCH_HIT_2,
    EFFECT_SOLARBEAM,
    EFFECT_THUNDER,
    EFFECT_TELEPORT,
    EFFECT_BEAT_UP,
    EFFECT_FLY,
    EFFECT_DEFENSE_CURL,
    EFFECT_SOFTBOILED,
    EFFECT_FAKE_OUT,
    EFFECT_UPROAR,
    EFFECT_STOCKPILE,
    EFFECT_SPIT_UP,
    EFFECT_SWALLOW,
    EFFECT_UNUSED_A3,
    EFFECT_HAIL,
    EFFECT_TORMENT,
    EFFECT_FLATTER,
    EFFECT_WILL_O_WISP,
    EFFECT_MEMENTO,
    EFFECT_FACADE,
    EFFECT_FOCUS_PUNCH,
    EFFECT_SMELLINGSALT,
    EFFECT_FOLLOW_ME,
    EFFECT_NATURE_POWER,
    EFFECT_CHARGE,
    EFFECT_TAUNT,
    EFFECT_HELPING_HAND,
    EFFECT_TRICK,
    EFFECT_ROLE_PLAY,
    EFFECT_WISH,
    EFFECT_ASSIST,
    EFFECT_INGRAIN,
    EFFECT_SUPERPOWER,
    EFFECT_MAGIC_COAT,
    EFFECT_RECYCLE,
    EFFECT_REVENGE,
    EFFECT_BRICK_BREAK,
    EFFECT_YAWN,
    EFFECT_KNOCK_OFF,
    EFFECT_ENDEAVOR,
    EFFECT_ERUPTION,
    EFFECT_SKILL_SWAP,
    EFFECT_IMPRISON,
    EFFECT_REFRESH,
    EFFECT_GRUDGE,
    EFFECT_SNATCH,
    EFFECT_LOW_KICK,
    EFFECT_SECRET_POWER,
    EFFECT_DOUBLE_EDGE,
    EFFECT_TEETER_DANCE,
    EFFECT_BLAZE_KICK,
    EFFECT_MUD_SPORT,
    EFFECT_POISON_FANG,
    EFFECT_WEATHER_BALL,
    EFFECT_OVERHEAT,
    EFFECT_TICKLE,
    EFFECT_COSMIC_POWER,
    EFFECT_SKY_UPPERCUT,
    EFFECT_BULK_UP,
    EFFECT_POISON_TAIL,
    EFFECT_WATER_SPORT,
    EFFECT_CALM_MIND,
    EFFECT_DRAGON_DANCE,
    EFFECT_CAMOUFLAGE,
};
# 6 "src/battle/battle_ai.c" 2
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
# 7 "src/battle/battle_ai.c" 2
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
# 8 "src/battle/battle_ai.c" 2
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
# 9 "src/battle/battle_ai.c" 2
# 1 "include/pokemon.h" 1
# 10 "src/battle/battle_ai.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 11 "src/battle/battle_ai.c" 2
# 1 "include/rom_8077ABC.h" 1




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
# 6 "include/rom_8077ABC.h" 2

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
# 12 "src/battle/battle_ai.c" 2
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
# 13 "src/battle/battle_ai.c" 2
# 1 "include/util.h" 1





extern const u8 gMiscBlank_Gfx[];
extern const u32 gBitTable[];

u8 CreateInvisibleSpriteWithCallback(void (*)(struct Sprite *));
void StoreWordInTwoHalfwords(u16 *, u32);
void LoadWordFromTwoHalfwords(u16 *, u32 *);
u16 CalcCRC16(u8 *data, int length);
void DoBgAffineSet(struct BgAffineDstData *dest, u32 texX, u32 texY, s16 scrX, s16 scrY, s16 sx, s16 sy, u16 alpha);
# 14 "src/battle/battle_ai.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 15 "src/battle/battle_ai.c" 2

extern u16 gBattleTypeFlags;
extern u16 gBattleWeather;
extern u8 gActiveBank;
extern u16 gBattlePartyID[4];
extern u16 gCurrentMove;
extern int gBattleMoveDamage;
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u8 gAbsentBankFlags;
extern u8 gBattleMoveFlags;
extern u16 gDynamicBasePower;
extern u16 gLastUsedMove[4];
extern u32 gStatuses3[4];
extern u16 gSideAffecting[2];
extern struct BattlePokemon gBattleMons[4];
extern u8 gCritMultiplier;
extern u16 gTrainerBattleOpponent;
extern u8 *BattleAIs[];

enum
{
    WEATHER_TYPE_SUN,
    WEATHER_TYPE_RAIN,
    WEATHER_TYPE_SANDSTORM,
    WEATHER_TYPE_HAIL,
};
# 50 "src/battle/battle_ai.c"
__attribute__((section("ewram_data"))) u8 *gAIScriptPtr = ((void *)0);

static void BattleAICmd_if_random_less_than(void);
static void BattleAICmd_if_random_greater_than(void);
static void BattleAICmd_if_random_equal(void);
static void BattleAICmd_if_random_not_equal(void);
static void BattleAICmd_score(void);
static void BattleAICmd_if_hp_less_than(void);
static void BattleAICmd_if_hp_more_than(void);
static void BattleAICmd_if_hp_equal(void);
static void BattleAICmd_if_hp_not_equal(void);
static void BattleAICmd_if_status(void);
static void BattleAICmd_if_not_status(void);
static void BattleAICmd_if_status2(void);
static void BattleAICmd_if_not_status2(void);
static void BattleAICmd_if_status3(void);
static void BattleAICmd_if_not_status3(void);
static void BattleAICmd_if_status4(void);
static void BattleAICmd_if_not_status4(void);
static void BattleAICmd_if_less_than(void);
static void BattleAICmd_if_more_than(void);
static void BattleAICmd_if_equal(void);
static void BattleAICmd_if_not_equal(void);
static void BattleAICmd_if_less_than_32(void);
static void BattleAICmd_if_more_than_32(void);
static void BattleAICmd_if_equal_32(void);
static void BattleAICmd_if_not_equal_32(void);
static void BattleAICmd_if_move(void);
static void BattleAICmd_if_not_move(void);
static void BattleAICmd_if_in_bytes(void);
static void BattleAICmd_if_not_in_bytes(void);
static void BattleAICmd_if_in_words(void);
static void BattleAICmd_if_not_in_words(void);
static void BattleAICmd_if_user_can_damage(void);
static void BattleAICmd_if_user_cant_damage(void);
static void BattleAICmd_get_turn_count(void);
static void BattleAICmd_get_type(void);
static void BattleAICmd_get_move_power(void);
static void BattleAICmd_is_most_powerful_move(void);
static void BattleAICmd_get_move(void);
static void BattleAICmd_if_arg_equal(void);
static void BattleAICmd_if_arg_not_equal(void);
static void BattleAICmd_if_would_go_first(void);
static void BattleAICmd_if_would_not_go_first(void);
static void BattleAICmd_nullsub_2A(void);
static void BattleAICmd_nullsub_2B(void);
static void BattleAICmd_count_alive_pokemon(void);
static void BattleAICmd_get_considered_move(void);
static void BattleAICmd_get_considered_move_effect(void);
static void BattleAICmd_get_ability(void);
static void BattleAICmd_get_highest_possible_damage(void);
static void BattleAICmd_if_damage_bonus(void);
static void BattleAICmd_nullsub_32(void);
static void BattleAICmd_nullsub_33(void);
static void BattleAICmd_if_status_in_party(void);
static void BattleAICmd_if_status_not_in_party(void);
static void BattleAICmd_get_weather(void);
static void BattleAICmd_if_effect(void);
static void BattleAICmd_if_not_effect(void);
static void BattleAICmd_if_stat_level_less_than(void);
static void BattleAICmd_if_stat_level_more_than(void);
static void BattleAICmd_if_stat_level_equal(void);
static void BattleAICmd_if_stat_level_not_equal(void);
static void BattleAICmd_if_can_faint(void);
static void BattleAICmd_if_cant_faint(void);
static void BattleAICmd_if_has_move(void);
static void BattleAICmd_if_dont_have_move(void);
static void BattleAICmd_if_move_effect(void);
static void BattleAICmd_if_not_move_effect(void);
static void BattleAICmd_if_last_move_did_damage(void);
static void BattleAICmd_if_encored(void);
static void BattleAICmd_flee(void);
static void BattleAICmd_if_random_100(void);
static void BattleAICmd_watch(void);
static void BattleAICmd_get_hold_effect(void);
static void BattleAICmd_get_gender(void);
static void BattleAICmd_is_first_turn(void);
static void BattleAICmd_get_stockpile_count(void);
static void BattleAICmd_is_double_battle(void);
static void BattleAICmd_get_used_item(void);
static void BattleAICmd_get_move_type_from_result(void);
static void BattleAICmd_get_move_power_from_result(void);
static void BattleAICmd_get_move_effect_from_result(void);
static void BattleAICmd_get_protect_count(void);
static void BattleAICmd_nullsub_52(void);
static void BattleAICmd_nullsub_53(void);
static void BattleAICmd_nullsub_54(void);
static void BattleAICmd_nullsub_55(void);
static void BattleAICmd_nullsub_56(void);
static void BattleAICmd_nullsub_57(void);
static void BattleAICmd_call(void);
static void BattleAICmd_jump(void);
static void BattleAICmd_end(void);
static void BattleAICmd_if_level_compare(void);
static void BattleAICmd_if_taunted(void);
static void BattleAICmd_if_not_taunted(void);

typedef void (*BattleAICmdFunc)(void);

static const BattleAICmdFunc sBattleAICmdTable[] =
{
    BattleAICmd_if_random_less_than,
    BattleAICmd_if_random_greater_than,
    BattleAICmd_if_random_equal,
    BattleAICmd_if_random_not_equal,
    BattleAICmd_score,
    BattleAICmd_if_hp_less_than,
    BattleAICmd_if_hp_more_than,
    BattleAICmd_if_hp_equal,
    BattleAICmd_if_hp_not_equal,
    BattleAICmd_if_status,
    BattleAICmd_if_not_status,
    BattleAICmd_if_status2,
    BattleAICmd_if_not_status2,
    BattleAICmd_if_status3,
    BattleAICmd_if_not_status3,
    BattleAICmd_if_status4,
    BattleAICmd_if_not_status4,
    BattleAICmd_if_less_than,
    BattleAICmd_if_more_than,
    BattleAICmd_if_equal,
    BattleAICmd_if_not_equal,
    BattleAICmd_if_less_than_32,
    BattleAICmd_if_more_than_32,
    BattleAICmd_if_equal_32,
    BattleAICmd_if_not_equal_32,
    BattleAICmd_if_move,
    BattleAICmd_if_not_move,
    BattleAICmd_if_in_bytes,
    BattleAICmd_if_not_in_bytes,
    BattleAICmd_if_in_words,
    BattleAICmd_if_not_in_words,
    BattleAICmd_if_user_can_damage,
    BattleAICmd_if_user_cant_damage,
    BattleAICmd_get_turn_count,
    BattleAICmd_get_type,
    BattleAICmd_get_move_power,
    BattleAICmd_is_most_powerful_move,
    BattleAICmd_get_move,
    BattleAICmd_if_arg_equal,
    BattleAICmd_if_arg_not_equal,
    BattleAICmd_if_would_go_first,
    BattleAICmd_if_would_not_go_first,
    BattleAICmd_nullsub_2A,
    BattleAICmd_nullsub_2B,
    BattleAICmd_count_alive_pokemon,
    BattleAICmd_get_considered_move,
    BattleAICmd_get_considered_move_effect,
    BattleAICmd_get_ability,
    BattleAICmd_get_highest_possible_damage,
    BattleAICmd_if_damage_bonus,
    BattleAICmd_nullsub_32,
    BattleAICmd_nullsub_33,
    BattleAICmd_if_status_in_party,
    BattleAICmd_if_status_not_in_party,
    BattleAICmd_get_weather,
    BattleAICmd_if_effect,
    BattleAICmd_if_not_effect,
    BattleAICmd_if_stat_level_less_than,
    BattleAICmd_if_stat_level_more_than,
    BattleAICmd_if_stat_level_equal,
    BattleAICmd_if_stat_level_not_equal,
    BattleAICmd_if_can_faint,
    BattleAICmd_if_cant_faint,
    BattleAICmd_if_has_move,
    BattleAICmd_if_dont_have_move,
    BattleAICmd_if_move_effect,
    BattleAICmd_if_not_move_effect,
    BattleAICmd_if_last_move_did_damage,
    BattleAICmd_if_encored,
    BattleAICmd_flee,
    BattleAICmd_if_random_100,
    BattleAICmd_watch,
    BattleAICmd_get_hold_effect,
    BattleAICmd_get_gender,
    BattleAICmd_is_first_turn,
    BattleAICmd_get_stockpile_count,
    BattleAICmd_is_double_battle,
    BattleAICmd_get_used_item,
    BattleAICmd_get_move_type_from_result,
    BattleAICmd_get_move_power_from_result,
    BattleAICmd_get_move_effect_from_result,
    BattleAICmd_get_protect_count,
    BattleAICmd_nullsub_52,
    BattleAICmd_nullsub_53,
    BattleAICmd_nullsub_54,
    BattleAICmd_nullsub_55,
    BattleAICmd_nullsub_56,
    BattleAICmd_nullsub_57,
    BattleAICmd_call,
    BattleAICmd_jump,
    BattleAICmd_end,
    BattleAICmd_if_level_compare,
    BattleAICmd_if_taunted,
    BattleAICmd_if_not_taunted,
};




const u16 sDiscouragedPowerfulMoveEffects[] =
{
    EFFECT_EXPLOSION,
    EFFECT_DREAM_EATER,
    EFFECT_RAZOR_WIND,
    EFFECT_SKY_ATTACK,
    EFFECT_RECHARGE,
    EFFECT_SKULL_BASH,
    EFFECT_SOLARBEAM,
    EFFECT_SPIT_UP,
    EFFECT_FOCUS_PUNCH,
    EFFECT_SUPERPOWER,
    EFFECT_ERUPTION,
    EFFECT_OVERHEAT,
    0xFFFF
};


void BattleAI_HandleItemUseBeforeAISetup(void)
{
    s32 i;
    u8 *data;

    { data = (u8 *)((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00)); for(i = 0; i < (u32)sizeof(struct UnkBattleStruct1); i++) data[i] = 0; };

    if ((gBattleTypeFlags & 0x0008)
     && gTrainerBattleOpponent != 0x400
     && !(gBattleTypeFlags & (0x0002 | 0x0080 | 0x0100 | 0x0800)))
    {
        for (i = 0; i < 4; i++)
        {
            if (gTrainers[gTrainerBattleOpponent].items[i] != 0)
            {
                ((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->items[((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->numOfItems] = gTrainers[gTrainerBattleOpponent].items[i];
                ((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->numOfItems++;
            }
        }
    }

    BattleAI_SetupAIData();
}

void BattleAI_SetupAIData(void)
{
    s32 i;
    u8 limitations;
    u8 *data;


    { data = (u8 *)((struct AI_ThinkingStruct *)(gSharedMem + 0x16800)); for(i = 0; i < (u32)sizeof(struct AI_ThinkingStruct); i++) data[i] = 0; };

    for (i = 0; i < 4; i++)
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->score[i] = 100;

    limitations = CheckMoveLimitations(gActiveBank, 0, 0xFF);




    for (i = 0; i < 4; i++)
    {
        if (gBitTable[i] & limitations)
            ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->score[i] = 0;

        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->simulatedRNG[i] = 100 - (Random() % 16);
    }


    ((struct AI_Stack *) (gSharedMem + 0x16C00))->size = 0;
    gBankAttacker = gActiveBank;

    if (gBattleTypeFlags & 0x0001)
    {
        gBankTarget = Random() & 2;

        if (gAbsentBankFlags & gBitTable[gBankTarget])
            gBankTarget ^= 2;
    }
    else
        gBankTarget = gActiveBank ^ 1;


    if (gBattleTypeFlags & 0x0080)
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiFlags = 0x40000000;
    else if (gBattleTypeFlags & 0x0400)
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiFlags = 0x20000000;
    else if (gBattleTypeFlags & 0x0010)
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiFlags = 0x80000000;
    else
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiFlags = gTrainers[gTrainerBattleOpponent].aiFlags;
}

u8 BattleAI_GetAIActionToUse(void)
{
    u8 currentMoveArray[4];
    u8 consideredMoveArray[4];
    u8 numOfBestMoves;
    s32 i;

    sub_810745C();
    while (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiFlags != 0)
    {
        if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiFlags & 1)
        {
            ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiState = AIState_SettingUp;
            BattleAI_DoAIProcessing();
        }
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiFlags >>= 1;
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiLogicId++;
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->movesetIndex = 0;
    }


    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiAction & (0x0002))
        return 4;
    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiAction & (0x0004))
        return 5;

    numOfBestMoves = 1;
    currentMoveArray[0] = ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->score[0];
    consideredMoveArray[0] = 0;

    for (i = 1; i < 4; i++)
    {
        if (currentMoveArray[0] < ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->score[i])
        {
            numOfBestMoves = 1;
            currentMoveArray[0] = ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->score[i];
            consideredMoveArray[0] = i;
        }
        if (currentMoveArray[0] == ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->score[i])
        {
            currentMoveArray[numOfBestMoves] = ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->score[i];
            consideredMoveArray[numOfBestMoves++] = i;
        }
    }

    return consideredMoveArray[Random() % numOfBestMoves];
}

void BattleAI_DoAIProcessing(void)
{
    while (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiState != AIState_FinishedProcessing)
    {
        switch (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiState)
        {
        case AIState_DoNotProcess:
            break;
        case AIState_SettingUp:
            gAIScriptPtr = BattleAIs[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiLogicId];
            if (gBattleMons[gBankAttacker].pp[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->movesetIndex] == 0)
            {
                ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered = MOVE_NONE;
            }
            else
            {
                ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered = gBattleMons[gBankAttacker].moves[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->movesetIndex];
            }
            ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiState++;
            break;
        case AIState_Processing:
            if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered != MOVE_NONE)
                sBattleAICmdTable[*gAIScriptPtr]();
            else
            {
                ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->score[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->movesetIndex] = 0;
                ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiAction |= 0x0001;
            }
            if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiAction & 0x0001)
            {
                ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->movesetIndex++;
                if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->movesetIndex < 4 && (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiAction & 0x0008) == 0)
                    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiState = AIState_SettingUp;
                else
                    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiState++;
                ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiAction &= (0x0002 | 0x0004 | 0x0008 |
                0x0010 | 0x0020 | 0x0040 | 0x0080);
            }
            break;
        }
    }
}

void sub_810745C(void)
{
    s32 i;

    for (i = 0; i < 8; i++)
    {
        if (((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->movesUsed[gBankTarget >> 1][i] == 0)
        {
            ((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->movesUsed[gBankTarget >> 1][i] = gLastUsedMove[gBankTarget];
            return;
        }
    }
}

void unref_sub_81074A0(u8 a)
{
    s32 i;

    for (i = 0; i < 8; i++)
        ((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->movesUsed[a / 2][i] = 0;
}

void RecordAbilityBattle(u8 a, u8 b)
{
    if (GetBankSide(a) == 0)
        ((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->unk20[GetBankIdentity(a) & 1] = b;
}

void RecordItemBattle(u8 a, u8 b)
{
    if (GetBankSide(a) == 0)
        ((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->unk22[GetBankIdentity(a) & 1] = b;
}

static void BattleAICmd_if_random_less_than(void)
{
    if (Random() % 256 < gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_random_greater_than(void)
{
    if (Random() % 256 > gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_random_equal(void)
{
    if (Random() % 256 == gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_random_not_equal(void)
{
    if (Random() % 256 != gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_score(void)
{
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->score[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->movesetIndex] += gAIScriptPtr[1];

    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->score[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->movesetIndex] < 0)
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->score[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->movesetIndex] = 0;

    gAIScriptPtr += 2;
}

static void BattleAICmd_if_hp_less_than(void)
{
    u16 index;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    if ((u32)(100 * gBattleMons[index].hp / gBattleMons[index].maxHP) < gAIScriptPtr[2])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 3)[0] | ((gAIScriptPtr + 3)[1] << 8) | ((gAIScriptPtr + 3)[2] << 16) | ((gAIScriptPtr + 3)[3] << 24));
    else
        gAIScriptPtr += 7;
}

static void BattleAICmd_if_hp_more_than(void)
{
    u16 index;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    if ((u32)(100 * gBattleMons[index].hp / gBattleMons[index].maxHP) > gAIScriptPtr[2])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 3)[0] | ((gAIScriptPtr + 3)[1] << 8) | ((gAIScriptPtr + 3)[2] << 16) | ((gAIScriptPtr + 3)[3] << 24));
    else
        gAIScriptPtr += 7;
}

static void BattleAICmd_if_hp_equal(void)
{
    u16 index;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    if ((u32)(100 * gBattleMons[index].hp / gBattleMons[index].maxHP) == gAIScriptPtr[2])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 3)[0] | ((gAIScriptPtr + 3)[1] << 8) | ((gAIScriptPtr + 3)[2] << 16) | ((gAIScriptPtr + 3)[3] << 24));
    else
        gAIScriptPtr += 7;
}

static void BattleAICmd_if_hp_not_equal(void)
{
    u16 index;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    if ((u32)(100 * gBattleMons[index].hp / gBattleMons[index].maxHP) != gAIScriptPtr[2])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 3)[0] | ((gAIScriptPtr + 3)[1] << 8) | ((gAIScriptPtr + 3)[2] << 16) | ((gAIScriptPtr + 3)[3] << 24));
    else
        gAIScriptPtr += 7;
}

static void BattleAICmd_if_status(void)
{
    u16 index;
    u32 arg;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    arg = ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));

    if ((gBattleMons[index].status1 & arg) != 0)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 6)[0] | ((gAIScriptPtr + 6)[1] << 8) | ((gAIScriptPtr + 6)[2] << 16) | ((gAIScriptPtr + 6)[3] << 24));
    else
        gAIScriptPtr += 10;
}

static void BattleAICmd_if_not_status(void)
{
    u16 index;
    u32 arg;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    arg = ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));

    if ((gBattleMons[index].status1 & arg) == 0)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 6)[0] | ((gAIScriptPtr + 6)[1] << 8) | ((gAIScriptPtr + 6)[2] << 16) | ((gAIScriptPtr + 6)[3] << 24));
    else
        gAIScriptPtr += 10;
}

static void BattleAICmd_if_status2(void)
{
    u16 index;
    u32 arg;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    arg = ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));

    if ((gBattleMons[index].status2 & arg) != 0)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 6)[0] | ((gAIScriptPtr + 6)[1] << 8) | ((gAIScriptPtr + 6)[2] << 16) | ((gAIScriptPtr + 6)[3] << 24));
    else
        gAIScriptPtr += 10;
}

static void BattleAICmd_if_not_status2(void)
{
    u16 index;
    u32 arg;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    arg = ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));

    if ((gBattleMons[index].status2 & arg) == 0)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 6)[0] | ((gAIScriptPtr + 6)[1] << 8) | ((gAIScriptPtr + 6)[2] << 16) | ((gAIScriptPtr + 6)[3] << 24));
    else
        gAIScriptPtr += 10;
}

static void BattleAICmd_if_status3(void)
{
    u16 index;
    u32 arg;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    arg = ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));

    if ((gStatuses3[index] & arg) != 0)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 6)[0] | ((gAIScriptPtr + 6)[1] << 8) | ((gAIScriptPtr + 6)[2] << 16) | ((gAIScriptPtr + 6)[3] << 24));
    else
        gAIScriptPtr += 10;
}

static void BattleAICmd_if_not_status3(void)
{
    u16 index;
    u32 arg;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    arg = ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));

    if ((gStatuses3[index] & arg) == 0)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 6)[0] | ((gAIScriptPtr + 6)[1] << 8) | ((gAIScriptPtr + 6)[2] << 16) | ((gAIScriptPtr + 6)[3] << 24));
    else
        gAIScriptPtr += 10;
}

static void BattleAICmd_if_status4(void)
{
    u16 index;
    u32 arg1, arg2;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    arg1 = GetBankIdentity(index) & 1;
    arg2 = ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));

    if ((gSideAffecting[arg1] & arg2) != 0)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 6)[0] | ((gAIScriptPtr + 6)[1] << 8) | ((gAIScriptPtr + 6)[2] << 16) | ((gAIScriptPtr + 6)[3] << 24));
    else
        gAIScriptPtr += 10;
}

static void BattleAICmd_if_not_status4(void)
{
    u16 index;
    u32 arg1, arg2;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    arg1 = GetBankIdentity(index) & 1;
    arg2 = ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));

    if ((gSideAffecting[arg1] & arg2) == 0)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 6)[0] | ((gAIScriptPtr + 6)[1] << 8) | ((gAIScriptPtr + 6)[2] << 16) | ((gAIScriptPtr + 6)[3] << 24));
    else
        gAIScriptPtr += 10;
}

static void BattleAICmd_if_less_than(void)
{
    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult < gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_more_than(void)
{
    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult > gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_equal(void)
{
    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult == gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_not_equal(void)
{
    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult != gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_less_than_32(void)
{
    u8 *temp = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));

    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult < *temp)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 5)[0] | ((gAIScriptPtr + 5)[1] << 8) | ((gAIScriptPtr + 5)[2] << 16) | ((gAIScriptPtr + 5)[3] << 24));
    else
        gAIScriptPtr += 9;
}

static void BattleAICmd_if_more_than_32(void)
{
    u8 *temp = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));

    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult > *temp)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 5)[0] | ((gAIScriptPtr + 5)[1] << 8) | ((gAIScriptPtr + 5)[2] << 16) | ((gAIScriptPtr + 5)[3] << 24));
    else
        gAIScriptPtr += 9;
}

static void BattleAICmd_if_equal_32(void)
{
    u8 *temp = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));

    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult == *temp)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 5)[0] | ((gAIScriptPtr + 5)[1] << 8) | ((gAIScriptPtr + 5)[2] << 16) | ((gAIScriptPtr + 5)[3] << 24));
    else
        gAIScriptPtr += 9;
}

static void BattleAICmd_if_not_equal_32(void)
{
    u8 *temp = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));

    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult != *temp)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 5)[0] | ((gAIScriptPtr + 5)[1] << 8) | ((gAIScriptPtr + 5)[2] << 16) | ((gAIScriptPtr + 5)[3] << 24));
    else
        gAIScriptPtr += 9;
}

static void BattleAICmd_if_move(void)
{
    u16 move = ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8));

    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered == move)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 3)[0] | ((gAIScriptPtr + 3)[1] << 8) | ((gAIScriptPtr + 3)[2] << 16) | ((gAIScriptPtr + 3)[3] << 24));
    else
        gAIScriptPtr += 7;
}

static void BattleAICmd_if_not_move(void)
{
    u16 move = ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8));

    if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered != move)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 3)[0] | ((gAIScriptPtr + 3)[1] << 8) | ((gAIScriptPtr + 3)[2] << 16) | ((gAIScriptPtr + 3)[3] << 24));
    else
        gAIScriptPtr += 7;
}

static void BattleAICmd_if_in_bytes(void)
{
    u8 *ptr = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));

    while (*ptr != 0xFF)
    {
        if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult == *ptr)
        {
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 5)[0] | ((gAIScriptPtr + 5)[1] << 8) | ((gAIScriptPtr + 5)[2] << 16) | ((gAIScriptPtr + 5)[3] << 24));
            return;
        }
        ptr++;
    }
    gAIScriptPtr += 9;
}

static void BattleAICmd_if_not_in_bytes(void)
{
    u8 *ptr = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));

    while (*ptr != 0xFF)
    {
        if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult == *ptr)
        {
            gAIScriptPtr += 9;
            return;
        }
        ptr++;
    }
    gAIScriptPtr = (u8*) ((gAIScriptPtr + 5)[0] | ((gAIScriptPtr + 5)[1] << 8) | ((gAIScriptPtr + 5)[2] << 16) | ((gAIScriptPtr + 5)[3] << 24));
}

static void BattleAICmd_if_in_words(void)
{
    u16 *ptr = (u16 *)(u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));

    while (*ptr != 0xFFFF)
    {
        if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult == *ptr)
        {
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 5)[0] | ((gAIScriptPtr + 5)[1] << 8) | ((gAIScriptPtr + 5)[2] << 16) | ((gAIScriptPtr + 5)[3] << 24));
            return;
        }
        ptr++;
    }
    gAIScriptPtr += 9;
}

static void BattleAICmd_if_not_in_words(void)
{
    u16 *ptr = (u16 *)(u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));

    while (*ptr != 0xFFFF)
    {
        if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult == *ptr)
        {
            gAIScriptPtr += 9;
            return;
        }
        ptr++;
    }
    gAIScriptPtr = (u8*) ((gAIScriptPtr + 5)[0] | ((gAIScriptPtr + 5)[1] << 8) | ((gAIScriptPtr + 5)[2] << 16) | ((gAIScriptPtr + 5)[3] << 24));
}

static void BattleAICmd_if_user_can_damage(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (gBattleMons[gBankAttacker].moves[i] != 0
            && gBattleMoves[gBattleMons[gBankAttacker].moves[i]].power != 0)
            break;
    }
    if (i == 4)
        gAIScriptPtr += 5;
    else
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));
}

static void BattleAICmd_if_user_cant_damage(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (gBattleMons[gBankAttacker].moves[i] != 0
         && gBattleMoves[gBattleMons[gBankAttacker].moves[i]].power != 0)
            break;
    }
    if (i != 4)
        gAIScriptPtr += 5;
    else
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));
}

static void BattleAICmd_get_turn_count(void)
{
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleResults.battleTurnCounter;
    gAIScriptPtr += 1;
}

static void BattleAICmd_get_type(void)
{
    switch (gAIScriptPtr[1])
    {
    case 1:
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMons[gBankAttacker].type1;
        break;
    case 0:
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMons[gBankTarget].type1;
        break;
    case 3:
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMons[gBankAttacker].type2;
        break;
    case 2:
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMons[gBankTarget].type2;
        break;
    case 4:
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMoves[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered].type;
        break;
    }
    gAIScriptPtr += 2;
}

static void BattleAICmd_get_move_power(void)
{
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMoves[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered].power;
    gAIScriptPtr += 1;
}
# 1001 "src/battle/battle_ai.c"
__attribute__((naked))
static void BattleAICmd_is_most_powerful_move(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x14\n    movs r3, 0\n    ldr r0, _08108328 @ =sDiscouragedPowerfulMoveEffects\n    ldrh r1, [r0]\n    ldr r4, _0810832C @ =0x0000ffff\n    ldr r6, _08108330 @ =gBattleMoves\n    ldr r5, _08108334 @ =gSharedMem + 0x16800\n    cmp r1, r4\n    beq _0810822E\n    ldrh r1, [r5, 0x2]\n    lsls r0, r1, 1\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r6\n    ldrb r2, [r0]\n    ldr r1, _08108328 @ =sDiscouragedPowerfulMoveEffects\n_0810821E:\n    ldrh r0, [r1]\n    cmp r2, r0\n    beq _0810822E\n    adds r1, 0x2\n    adds r3, 0x1\n    ldrh r0, [r1]\n    cmp r0, r4\n    bne _0810821E\n_0810822E:\n    ldrh r0, [r5, 0x2]\n    lsls r1, r0, 1\n    adds r1, r0\n    lsls r1, 2\n    adds r1, r6\n    ldrb r0, [r1, 0x1]\n    cmp r0, 0x1\n    bhi _08108240\n    b _081083B2\n_08108240:\n    lsls r0, r3, 1\n    ldr r1, _08108328 @ =sDiscouragedPowerfulMoveEffects\n    adds r0, r1\n    ldrh r3, [r0]\n    ldr r0, _0810832C @ =0x0000ffff\n    cmp r3, r0\n    beq _08108250\n    b _081083B2\n_08108250:\n    ldr r0, _08108338 @ =gDynamicBasePower\n    movs r1, 0\n    strh r1, [r0]\n    ldr r2, _0810833C @ =0xfffff81c\n    adds r0, r5, r2\n    strb r1, [r0]\n    adds r2, 0x3\n    adds r0, r5, r2\n    movs r2, 0x1\n    strb r2, [r0]\n    ldr r0, _08108340 @ =gBattleMoveFlags\n    strb r1, [r0]\n    ldr r0, _08108344 @ =gCritMultiplier\n    strb r2, [r0]\n    movs r6, 0\n    mov r9, r3\n    ldr r0, _08108328 @ =sDiscouragedPowerfulMoveEffects\n    ldrh r0, [r0]\n    str r0, [sp, 0x10]\n_08108276:\n    movs r3, 0\n    ldr r5, _08108348 @ =gBattleMons\n    lsls r4, r6, 1\n    ldr r7, _0810834C @ =gBankAttacker\n    lsls r1, r6, 2\n    mov r8, r1\n    adds r2, r6, 0x1\n    mov r10, r2\n    ldr r0, [sp, 0x10]\n    cmp r0, r9\n    beq _081082BA\n    ldr r2, _08108330 @ =gBattleMoves\n    ldrb r1, [r7]\n    movs r0, 0x58\n    muls r0, r1\n    adds r0, r4, r0\n    adds r1, r5, 0\n    adds r1, 0xC\n    adds r0, r1\n    ldrh r1, [r0]\n    lsls r0, r1, 1\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r2\n    ldrb r2, [r0]\n    ldr r1, _08108328 @ =sDiscouragedPowerfulMoveEffects\n_081082AA:\n    ldrh r0, [r1]\n    cmp r2, r0\n    beq _081082BA\n    adds r1, 0x2\n    adds r3, 0x1\n    ldrh r0, [r1]\n    cmp r0, r9\n    bne _081082AA\n_081082BA:\n    ldrb r1, [r7]\n    movs r0, 0x58\n    muls r0, r1\n    adds r0, r4, r0\n    adds r1, r5, 0\n    adds r1, 0xC\n    adds r1, r0, r1\n    ldrh r0, [r1]\n    cmp r0, 0\n    beq _0810835C\n    lsls r0, r3, 1\n    ldr r2, _08108328 @ =sDiscouragedPowerfulMoveEffects\n    adds r0, r2\n    ldrh r0, [r0]\n    cmp r0, r9\n    bne _0810835C\n    ldr r0, _08108330 @ =gBattleMoves\n    ldrh r2, [r1]\n    lsls r1, r2, 1\n    adds r1, r2\n    lsls r1, 2\n    adds r1, r0\n    ldrb r0, [r1, 0x1]\n    cmp r0, 0x1\n    bls _0810835C\n    ldr r5, _08108350 @ =gCurrentMove\n    strh r2, [r5]\n    ldrb r0, [r7]\n    ldr r4, _08108354 @ =gBankTarget\n    ldrb r1, [r4]\n    bl AI_CalcDmg\n    ldrh r0, [r5]\n    ldrb r1, [r7]\n    ldrb r2, [r4]\n    bl TypeCalc\n    mov r4, sp\n    add r4, r8\n    ldr r2, _08108358 @ =gBattleMoveDamage\n    ldr r0, _08108334 @ =gSharedMem + 0x16800\n    adds r0, 0x18\n    adds r0, r6, r0\n    ldrb r1, [r0]\n    ldr r0, [r2]\n    muls r0, r1\n    movs r1, 0x64\n    bl __divsi3\n    str r0, [r4]\n    cmp r0, 0\n    bne _08108364\n    movs r0, 0x1\n    str r0, [r4]\n    b _08108364\n    .align 2, 0\n_08108328: .4byte sDiscouragedPowerfulMoveEffects\n_0810832C: .4byte 0x0000ffff\n_08108330: .4byte gBattleMoves\n_08108334: .4byte gSharedMem + 0x16800\n_08108338: .4byte gDynamicBasePower\n_0810833C: .4byte 0xfffff81c\n_08108340: .4byte gBattleMoveFlags\n_08108344: .4byte gCritMultiplier\n_08108348: .4byte gBattleMons\n_0810834C: .4byte gBankAttacker\n_08108350: .4byte gCurrentMove\n_08108354: .4byte gBankTarget\n_08108358: .4byte gBattleMoveDamage\n_0810835C:\n    mov r1, sp\n    add r1, r8\n    movs r0, 0\n    str r0, [r1]\n_08108364:\n    mov r6, r10\n    cmp r6, 0x3\n    ble _08108276\n    movs r6, 0\n    ldr r1, _081083A4 @ =gSharedMem + 0x16800\n    ldrb r0, [r1, 0x1]\n    lsls r0, 2\n    add r0, sp\n    ldr r2, [sp]\n    ldr r0, [r0]\n    adds r5, r1, 0\n    ldr r4, _081083A8 @ =gAIScriptPtr\n    cmp r2, r0\n    bgt _0810839A\n    adds r3, r5, 0\n    mov r2, sp\n_08108384:\n    adds r2, 0x4\n    adds r6, 0x1\n    cmp r6, 0x3\n    bgt _0810839A\n    ldrb r0, [r3, 0x1]\n    lsls r0, 2\n    add r0, sp\n    ldr r1, [r2]\n    ldr r0, [r0]\n    cmp r1, r0\n    ble _08108384\n_0810839A:\n    cmp r6, 0x4\n    bne _081083AC\n    movs r0, 0x2\n    str r0, [r5, 0x8]\n    b _081083B8\n    .align 2, 0\n_081083A4: .4byte gSharedMem + 0x16800\n_081083A8: .4byte gAIScriptPtr\n_081083AC:\n    movs r0, 0x1\n    str r0, [r5, 0x8]\n    b _081083B8\n_081083B2:\n    movs r0, 0\n    str r0, [r5, 0x8]\n    ldr r4, _081083D0 @ =gAIScriptPtr\n_081083B8:\n    ldr r0, [r4]\n    adds r0, 0x1\n    str r0, [r4]\n    add sp, 0x14\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_081083D0: .4byte gAIScriptPtr\n    .syntax divided\n");
# 1243 "src/battle/battle_ai.c"
}


static void BattleAICmd_get_move(void)
{
    if (gAIScriptPtr[1] == USER)
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gLastUsedMove[gBankAttacker];
    else
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gLastUsedMove[gBankTarget];

    gAIScriptPtr += 2;
}

static void BattleAICmd_if_arg_equal(void)
{
    if (gAIScriptPtr[1] == ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_arg_not_equal(void)
{
    if (gAIScriptPtr[1] != ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_would_go_first(void)
{
    if (GetWhoStrikesFirst(gBankAttacker, gBankTarget, 1) == gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_would_not_go_first(void)
{
    if (GetWhoStrikesFirst(gBankAttacker, gBankTarget, 1) != gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_nullsub_2A(void)
{
}

static void BattleAICmd_nullsub_2B(void)
{
}

static void BattleAICmd_count_alive_pokemon(void)
{
    struct Pokemon *party;
    int i;
    u8 index;
    u8 var, var2;

    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = 0;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    if (GetBankSide(index) == 0)
        party = gPlayerParty;
    else
        party = gEnemyParty;

    if (gBattleTypeFlags & 0x0001)
    {
        u32 status;
        var = gBattlePartyID[index];
        status = GetBankIdentity(index) ^ 2;
        var2 = gBattlePartyID[GetBankByPlayerAI(status)];
    }
    else
    {
        var = gBattlePartyID[index];
        var2 = gBattlePartyID[index];
    }

    for (i = 0; i < 6; i++)
    {
        if (i != var && i != var2
         && GetMonData(&party[i], 57) != 0
         && GetMonData(&party[i], 65) != SPECIES_NONE
         && GetMonData(&party[i], 65) != SPECIES_EGG)
        {
            ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult++;
        }
    }

    gAIScriptPtr += 2;
}

static void BattleAICmd_get_considered_move(void)
{
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered;
    gAIScriptPtr += 1;
}

static void BattleAICmd_get_considered_move_effect(void)
{
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMoves[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered].effect;
    gAIScriptPtr += 1;
}

static void BattleAICmd_get_ability(void)
{
    u8 index;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    if (GetBankSide(index) == TARGET)
    {
        u16 unk = GetBankIdentity(index) & 1;

        if (((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->unk20[unk] != 0)
        {
            ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = ((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->unk20[unk];
            gAIScriptPtr += 2;
            return;
        }


        if (gBattleMons[index].ability == ABILITY_SHADOW_TAG
        || gBattleMons[index].ability == ABILITY_MAGNET_PULL
        || gBattleMons[index].ability == ABILITY_ARENA_TRAP)
        {
            ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMons[index].ability;
            gAIScriptPtr += 2;
            return;
        }

        if (gBaseStats[gBattleMons[index].species].ability1 != ABILITY_NONE)
        {
            if (gBaseStats[gBattleMons[index].species].ability2 != ABILITY_NONE)
            {

                if (Random() % 2)
                {
                    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBaseStats[gBattleMons[index].species].ability1;
                }
                else
                {
                    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBaseStats[gBattleMons[index].species].ability2;
                }
            }
            else
            {
                ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBaseStats[gBattleMons[index].species].ability1;
            }
        }
        else
        {
            ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBaseStats[gBattleMons[index].species].ability2;
        }
    }
    else
    {

        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMons[index].ability;
    }
    gAIScriptPtr += 2;
}

static void BattleAICmd_get_highest_possible_damage(void)
{
    s32 i;

    gDynamicBasePower = 0;
    ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType = 0;
    ((struct BattleStruct *) (gSharedMem + 0x0))->dmgMultiplier = 1;
    gBattleMoveFlags = 0;
    gCritMultiplier = 1;
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = 0;

    for (i = 0; i < 4; i++)
    {
        gBattleMoveDamage = 40;
        gCurrentMove = gBattleMons[gBankAttacker].moves[i];

        if (gCurrentMove)
        {
            TypeCalc(gCurrentMove, gBankAttacker, gBankTarget);


            if (gBattleMoveDamage == 120)
                gBattleMoveDamage = 80;
            if (gBattleMoveDamage == 240)
                gBattleMoveDamage = 160;
            if (gBattleMoveDamage == 30)
                gBattleMoveDamage = 20;
            if (gBattleMoveDamage == 15)
                gBattleMoveDamage = 10;

            if (gBattleMoveFlags & 8)
                gBattleMoveDamage = 0;

            if (((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult < gBattleMoveDamage)
                ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMoveDamage;
        }
    }
    gAIScriptPtr += 1;
}

static void BattleAICmd_if_damage_bonus(void)
{
    u8 damageVar;

    gDynamicBasePower = 0;
    ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType = 0;
    ((struct BattleStruct *) (gSharedMem + 0x0))->dmgMultiplier = 1;
    gBattleMoveFlags = 0;
    gCritMultiplier = 1;

    gBattleMoveDamage = 40;
    gCurrentMove = ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered;

    TypeCalc(gCurrentMove, gBankAttacker, gBankTarget);

    if (gBattleMoveDamage == 120)
        gBattleMoveDamage = 80;
    if (gBattleMoveDamage == 240)
        gBattleMoveDamage = 160;
    if (gBattleMoveDamage == 30)
        gBattleMoveDamage = 20;
    if (gBattleMoveDamage == 15)
        gBattleMoveDamage = 10;

    if (gBattleMoveFlags & 8)
        gBattleMoveDamage = 0;


    damageVar = gBattleMoveDamage;

    if (damageVar == gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_nullsub_32(void)
{
}

static void BattleAICmd_nullsub_33(void)
{
}

static void BattleAICmd_if_status_in_party(void)
{
    struct Pokemon *party;
    struct Pokemon *partyPtr;
    int i;
    u32 statusToCompareTo;


    switch (gAIScriptPtr[1])
    {
    case 1:
        party = partyPtr = gEnemyParty;
        break;
    default:
        party = partyPtr = gPlayerParty;
        break;
    }

    statusToCompareTo = ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));

    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&party[i], 11);
        u16 hp = GetMonData(&party[i], 57);
        u32 status = GetMonData(&party[i], 55);

        if (species != SPECIES_NONE && species != SPECIES_EGG && hp != 0 && status == statusToCompareTo)
        {
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 6)[0] | ((gAIScriptPtr + 6)[1] << 8) | ((gAIScriptPtr + 6)[2] << 16) | ((gAIScriptPtr + 6)[3] << 24));
            return;
        }
    }

    gAIScriptPtr += 10;
}


static void BattleAICmd_if_status_not_in_party(void)
{
    struct Pokemon *party;
    struct Pokemon *partyPtr;
    int i;
    u32 statusToCompareTo;

    switch (gAIScriptPtr[1])
    {
    case 1:
        party = partyPtr = gEnemyParty;
        break;
    default:
        party = partyPtr = gPlayerParty;
        break;
    }

    statusToCompareTo = ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));

    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&party[i], 11);
        u16 hp = GetMonData(&party[i], 57);
        u32 status = GetMonData(&party[i], 55);


        if (species != SPECIES_NONE && species != SPECIES_EGG && hp != 0 && status == statusToCompareTo)
            gAIScriptPtr += 10;
    }
    gAIScriptPtr = (u8*) ((gAIScriptPtr + 6)[0] | ((gAIScriptPtr + 6)[1] << 8) | ((gAIScriptPtr + 6)[2] << 16) | ((gAIScriptPtr + 6)[3] << 24));
}

static void BattleAICmd_get_weather(void)
{
    if (gBattleWeather & (((1 << 0) | (1 << 1) | (1 << 2))))
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = WEATHER_TYPE_RAIN;
    if (gBattleWeather & (((1 << 3) | (1 << 4))))
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = WEATHER_TYPE_SANDSTORM;
    if (gBattleWeather & (((1 << 5) | (1 << 6))))
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = WEATHER_TYPE_SUN;
    if (gBattleWeather & (1 << 7))
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = WEATHER_TYPE_HAIL;

    gAIScriptPtr += 1;
}

static void BattleAICmd_if_effect(void)
{
    if (gBattleMoves[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered].effect == gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_not_effect(void)
{
    if (gBattleMoves[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered].effect != gAIScriptPtr[1])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
    else
        gAIScriptPtr += 6;
}

static void BattleAICmd_if_stat_level_less_than(void)
{
    u32 party;

    if (gAIScriptPtr[1] == USER)
        party = gBankAttacker;
    else
        party = gBankTarget;

    if (gBattleMons[party].statStages[gAIScriptPtr[2]] < gAIScriptPtr[3])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 4)[0] | ((gAIScriptPtr + 4)[1] << 8) | ((gAIScriptPtr + 4)[2] << 16) | ((gAIScriptPtr + 4)[3] << 24));
    else
        gAIScriptPtr += 8;
}

static void BattleAICmd_if_stat_level_more_than(void)
{
    u32 party;

    if (gAIScriptPtr[1] == USER)
        party = gBankAttacker;
    else
        party = gBankTarget;

    if (gBattleMons[party].statStages[gAIScriptPtr[2]] > gAIScriptPtr[3])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 4)[0] | ((gAIScriptPtr + 4)[1] << 8) | ((gAIScriptPtr + 4)[2] << 16) | ((gAIScriptPtr + 4)[3] << 24));
    else
        gAIScriptPtr += 8;
}

static void BattleAICmd_if_stat_level_equal(void)
{
    u32 party;

    if (gAIScriptPtr[1] == USER)
        party = gBankAttacker;
    else
        party = gBankTarget;

    if (gBattleMons[party].statStages[gAIScriptPtr[2]] == gAIScriptPtr[3])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 4)[0] | ((gAIScriptPtr + 4)[1] << 8) | ((gAIScriptPtr + 4)[2] << 16) | ((gAIScriptPtr + 4)[3] << 24));
    else
        gAIScriptPtr += 8;
}

static void BattleAICmd_if_stat_level_not_equal(void)
{
    u32 party;

    if (gAIScriptPtr[1] == USER)
        party = gBankAttacker;
    else
        party = gBankTarget;

    if (gBattleMons[party].statStages[gAIScriptPtr[2]] != gAIScriptPtr[3])
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 4)[0] | ((gAIScriptPtr + 4)[1] << 8) | ((gAIScriptPtr + 4)[2] << 16) | ((gAIScriptPtr + 4)[3] << 24));
    else
        gAIScriptPtr += 8;
}

static void BattleAICmd_if_can_faint(void)
{
    if (gBattleMoves[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered].power < 2)
    {
        gAIScriptPtr += 5;
        return;
    }

    gDynamicBasePower = 0;
    ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType = 0;
    ((struct BattleStruct *) (gSharedMem + 0x0))->dmgMultiplier = 1;
    gBattleMoveFlags = 0;
    gCritMultiplier = 1;
    gCurrentMove = ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered;
    AI_CalcDmg(gBankAttacker, gBankTarget);
    TypeCalc(gCurrentMove, gBankAttacker, gBankTarget);

    gBattleMoveDamage = gBattleMoveDamage * ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->simulatedRNG[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->movesetIndex] / 100;


    if (gBattleMoveDamage == 0)
        gBattleMoveDamage = 1;

    if (gBattleMons[gBankTarget].hp <= gBattleMoveDamage)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));
    else
        gAIScriptPtr += 5;
}

static void BattleAICmd_if_cant_faint(void)
{
    if (gBattleMoves[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered].power < 2)
    {
        gAIScriptPtr += 5;
        return;
    }

    gDynamicBasePower = 0;
    ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType = 0;
    ((struct BattleStruct *) (gSharedMem + 0x0))->dmgMultiplier = 1;
    gBattleMoveFlags = 0;
    gCritMultiplier = 1;
    gCurrentMove = ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered;
    AI_CalcDmg(gBankAttacker, gBankTarget);
    TypeCalc(gCurrentMove, gBankAttacker, gBankTarget);

    gBattleMoveDamage = gBattleMoveDamage * ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->simulatedRNG[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->movesetIndex] / 100;



    if (gBattleMons[gBankTarget].hp > gBattleMoveDamage)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));
    else
        gAIScriptPtr += 5;
}

static void BattleAICmd_if_has_move(void)
{
    int i;
    u16 *temp_ptr = (u16 *)(gAIScriptPtr + 2);

    switch (gAIScriptPtr[1])
    {
    case 1:
    case 3:
        for (i = 0; i < 4; i++)
        {
            if (gBattleMons[gBankAttacker].moves[i] == *temp_ptr)
                break;
        }
        if (i == 4)
            gAIScriptPtr += 8;
        else
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 4)[0] | ((gAIScriptPtr + 4)[1] << 8) | ((gAIScriptPtr + 4)[2] << 16) | ((gAIScriptPtr + 4)[3] << 24));
        break;
    case 0:
    case 2:
        for (i = 0; i < 8; i++)
        {
            if (((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->movesUsed[gBankTarget >> 1][i] == *temp_ptr)
                break;
        }
        if (i == 8)
            gAIScriptPtr += 8;
         else
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 4)[0] | ((gAIScriptPtr + 4)[1] << 8) | ((gAIScriptPtr + 4)[2] << 16) | ((gAIScriptPtr + 4)[3] << 24));
        break;
    }
}

static void BattleAICmd_if_dont_have_move(void)
{
    int i;
    u16 *temp_ptr = (u16 *)(gAIScriptPtr + 2);

    switch (gAIScriptPtr[1])
    {
    case 1:
    case 3:
        for (i = 0; i < 4; i++)
        {
            if (gBattleMons[gBankAttacker].moves[i] == *temp_ptr)
                break;
        }
        if (i != 4)
            gAIScriptPtr += 8;
        else
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 4)[0] | ((gAIScriptPtr + 4)[1] << 8) | ((gAIScriptPtr + 4)[2] << 16) | ((gAIScriptPtr + 4)[3] << 24));
        break;
    case 0:
    case 2:
        for (i = 0; i < 8; i++)
        {
            if (((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->movesUsed[gBankTarget >> 1][i] == *temp_ptr)
                break;
        }
        if (i != 8)
            gAIScriptPtr += 8;
        else
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 4)[0] | ((gAIScriptPtr + 4)[1] << 8) | ((gAIScriptPtr + 4)[2] << 16) | ((gAIScriptPtr + 4)[3] << 24));
        break;
    }
}

static void BattleAICmd_if_move_effect(void)
{
    int i;

    switch (gAIScriptPtr[1])
    {
    case 1:
    case 3:
        for (i = 0; i < 4; i++)
        {
            if (gBattleMons[gBankAttacker].moves[i] != 0 && gBattleMoves[gBattleMons[gBankAttacker].moves[i]].effect == gAIScriptPtr[2])
                break;
        }
        if (i != 4)
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 3)[0] | ((gAIScriptPtr + 3)[1] << 8) | ((gAIScriptPtr + 3)[2] << 16) | ((gAIScriptPtr + 3)[3] << 24));
        else
            gAIScriptPtr += 7;
        break;
    case 0:
    case 2:
        for (i = 0; i < 8; i++)
        {
            if (gBattleMons[gBankAttacker].moves[i] != 0 && gBattleMoves[((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->movesUsed[gBankTarget >> 1][i]].effect == gAIScriptPtr[2])
                break;
        }
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 3)[0] | ((gAIScriptPtr + 3)[1] << 8) | ((gAIScriptPtr + 3)[2] << 16) | ((gAIScriptPtr + 3)[3] << 24));
    }
}

static void BattleAICmd_if_not_move_effect(void)
{
    int i;

    switch (gAIScriptPtr[1])
    {
    case 1:
    case 3:
        for (i = 0; i < 4; i++)
        {
            if (gBattleMons[gBankAttacker].moves[i] != 0 && gBattleMoves[gBattleMons[gBankAttacker].moves[i]].effect == gAIScriptPtr[2])
                break;
        }
        if (i != 4)
            gAIScriptPtr += 7;
        else
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 3)[0] | ((gAIScriptPtr + 3)[1] << 8) | ((gAIScriptPtr + 3)[2] << 16) | ((gAIScriptPtr + 3)[3] << 24));
        break;
    case 0:
    case 2:
        for (i = 0; i < 8; i++)
        {
            if (((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->movesUsed[gBankTarget >> 1][i] != 0 && gBattleMoves[((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->movesUsed[gBankTarget >> 1][i]].effect == gAIScriptPtr[2])
                break;
        }
        gAIScriptPtr += 7;
    }
}

static void BattleAICmd_if_last_move_did_damage(void)
{
    u8 index;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    if (gAIScriptPtr[2] == 0)
    {
        if (gDisableStructs[index].disabledMove == 0)
        {
            gAIScriptPtr += 7;
            return;
        }
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 3)[0] | ((gAIScriptPtr + 3)[1] << 8) | ((gAIScriptPtr + 3)[2] << 16) | ((gAIScriptPtr + 3)[3] << 24));
        return;
    }
    else if (gAIScriptPtr[2] != 1)
    {
        gAIScriptPtr += 7;
        return;
    }
    else if (gDisableStructs[index].encoredMove != 0)
    {
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 3)[0] | ((gAIScriptPtr + 3)[1] << 8) | ((gAIScriptPtr + 3)[2] << 16) | ((gAIScriptPtr + 3)[3] << 24));
        return;
    }
    gAIScriptPtr += 7;
}

static void BattleAICmd_if_encored(void)
{
    switch (gAIScriptPtr[1])
    {
    case 0:
        if (gDisableStructs[gActiveBank].disabledMove == ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered)
        {
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
            return;
        }
        gAIScriptPtr += 6;
        return;
    case 1:
        if (gDisableStructs[gActiveBank].encoredMove == ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->moveConsidered)
        {
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
            return;
        }
        gAIScriptPtr += 6;
        return;
    default:
        gAIScriptPtr += 6;
        return;
    }
}

static void BattleAICmd_flee(void)
{
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiAction |= (0x0001 | 0x0002 | 0x0008);
}

static void BattleAICmd_if_random_100(void)
{
    u8 safariFleeRate = ((struct BattleStruct *) (gSharedMem + 0x0))->safariFleeRate * 5;

    if ((u8)(Random() % 100) < safariFleeRate)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));
    else
        gAIScriptPtr += 5;
}

static void BattleAICmd_watch(void)
{
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiAction |= (0x0001 | 0x0004 | 0x0008);
}

static void BattleAICmd_get_hold_effect(void)
{
    u8 index;
    u16 status;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    if (GetBankSide(index) == 0)
    {
        status = (GetBankIdentity(index) & 1);
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = ((struct UnkBattleStruct1 *) (gSharedMem + 0x16A00))->unk22[status];
    }
    else
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = ItemId_GetHoldEffect(gBattleMons[index].item);

    gAIScriptPtr += 2;
}

static void BattleAICmd_get_gender(void)
{
    u8 index;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = GetGenderFromSpeciesAndPersonality(gBattleMons[index].species, gBattleMons[index].personality);

    gAIScriptPtr += 2;
}

static void BattleAICmd_is_first_turn(void)
{
    u8 index;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gDisableStructs[index].isFirstTurn;

    gAIScriptPtr += 2;
}

static void BattleAICmd_get_stockpile_count(void)
{
    u8 index;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gDisableStructs[index].stockpileCounter;

    gAIScriptPtr += 2;
}

static void BattleAICmd_is_double_battle(void)
{
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleTypeFlags & 0x0001;

    gAIScriptPtr += 1;
}

static void BattleAICmd_get_used_item(void)
{
    u8 index;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = (gSharedMem[0x160CC + index * 2]);

    gAIScriptPtr += 2;
}

static void BattleAICmd_get_move_type_from_result(void)
{
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMoves[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult].type;

    gAIScriptPtr += 1;
}

static void BattleAICmd_get_move_power_from_result(void)
{
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMoves[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult].power;

    gAIScriptPtr += 1;
}

static void BattleAICmd_get_move_effect_from_result(void)
{
    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gBattleMoves[((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult].effect;

    gAIScriptPtr += 1;
}

static void BattleAICmd_get_protect_count(void)
{
    u8 index;

    if (gAIScriptPtr[1] == USER)
        index = gBankAttacker;
    else
        index = gBankTarget;

    ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->funcResult = gDisableStructs[index].protectUses;

    gAIScriptPtr += 2;
}

static void BattleAICmd_nullsub_52(void)
{
}

static void BattleAICmd_nullsub_53(void)
{
}

static void BattleAICmd_nullsub_54(void)
{
}

static void BattleAICmd_nullsub_55(void)
{
}

static void BattleAICmd_nullsub_56(void)
{
}

static void BattleAICmd_nullsub_57(void)
{
}

static void BattleAICmd_call(void)
{
    AIStackPushVar(gAIScriptPtr + 5);
    gAIScriptPtr = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));
}

static void BattleAICmd_jump(void)
{
    gAIScriptPtr = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));
}

static void BattleAICmd_end(void)
{
    if (AIStackPop() == 0)
        ((struct AI_ThinkingStruct *)(gSharedMem + 0x16800))->aiAction |= 0x0001;
}

static void BattleAICmd_if_level_compare(void)
{
    switch (gAIScriptPtr[1])
    {
    case 0:
        if (gBattleMons[gBankAttacker].level > gBattleMons[gBankTarget].level)
        {
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
            return;
        }
        gAIScriptPtr += 6;
        return;
    case 1:
        if (gBattleMons[gBankAttacker].level < gBattleMons[gBankTarget].level)
        {
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
            return;
        }
        gAIScriptPtr += 6;
        return;
    case 2:
        if (gBattleMons[gBankAttacker].level == gBattleMons[gBankTarget].level)
        {
            gAIScriptPtr = (u8*) ((gAIScriptPtr + 2)[0] | ((gAIScriptPtr + 2)[1] << 8) | ((gAIScriptPtr + 2)[2] << 16) | ((gAIScriptPtr + 2)[3] << 24));
            return;
        }
        gAIScriptPtr += 6;
        return;
    }
}

static void BattleAICmd_if_taunted(void)
{
    if (gDisableStructs[gBankTarget].tauntTimer1 != 0)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));
    else
        gAIScriptPtr += 5;
}

static void BattleAICmd_if_not_taunted(void)
{
    if (gDisableStructs[gBankTarget].tauntTimer1 == 0)
        gAIScriptPtr = (u8*) ((gAIScriptPtr + 1)[0] | ((gAIScriptPtr + 1)[1] << 8) | ((gAIScriptPtr + 1)[2] << 16) | ((gAIScriptPtr + 1)[3] << 24));
    else
        gAIScriptPtr += 5;
}

void AIStackPushVar(u8 *var)
{
    ((struct AI_Stack *) (gSharedMem + 0x16C00))->ptr[((struct AI_Stack *) (gSharedMem + 0x16C00))->size++] = var;
}


void AIStackPushAIPtr(void)
{
    ((struct AI_Stack *) (gSharedMem + 0x16C00))->ptr[((struct AI_Stack *) (gSharedMem + 0x16C00))->size++] = gAIScriptPtr;
}

bool8 AIStackPop(void)
{
    if (((struct AI_Stack *) (gSharedMem + 0x16C00))->size != 0)
    {
        --((struct AI_Stack *) (gSharedMem + 0x16C00))->size;
        gAIScriptPtr = ((struct AI_Stack *) (gSharedMem + 0x16C00))->ptr[((struct AI_Stack *) (gSharedMem + 0x16C00))->size];
        return 1;
    }
    else
        return 0;
}
