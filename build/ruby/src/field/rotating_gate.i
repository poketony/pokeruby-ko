# 1 "src/field/rotating_gate.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/rotating_gate.c"
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
# 2 "src/field/rotating_gate.c" 2
# 1 "include/bike.h" 1





struct BikeHistoryInputInfo
{
    u32 dirHistoryMatch;
    u32 abStartSelectHistoryMatch;
    u32 dirHistoryMask;
    u32 abStartSelectHistoryMask;
    const u8 *dirTimerHistoryList;
    const u8 *abStartSelectHistoryList;
    u32 direction;
};


enum
{
    SPEED_STANDING,
    SPEED_NORMAL,
    SPEED_FAST,
    SPEED_FASTER,
    SPEED_FASTEST,
};


enum
{
    MACH_TRANS_FACE_DIRECTION,
    MACH_TRANS_TURN_DIRECTION,
    MACH_TRANS_KEEP_MOVING,
    MACH_TRANS_START_MOVING
};


enum
{
    ACRO_STATE_NORMAL,
    ACRO_STATE_TURNING,
    ACRO_STATE_WHEELIE_STANDING,
    ACRO_STATE_BUNNY_HOP,
    ACRO_STATE_WHEELIE_MOVING,
    ACRO_STATE_SIDE_JUMP,
    ACRO_STATE_TURN_JUMP,
};


enum
{
    ACRO_TRANS_FACE_DIRECTION,
    ACRO_TRANS_TURN_DIRECTION,
    ACRO_TRANS_MOVING,
    ACRO_TRANS_NORMAL_TO_WHEELIE,
    ACRO_TRANS_WHEELIE_TO_NORMAL,
    ACRO_TRANS_WHEELIE_IDLE,
    ACRO_TRANS_WHEELIE_HOPPING_STANDING,
    ACRO_TRANS_WHEELIE_HOPPING_MOVING,
    ACRO_TRANS_SIDE_JUMP,
    ACRO_TRANS_TURN_JUMP,
    ACRO_TRANS_WHEELIE_MOVING,
    ACRO_TRANS_WHEELIE_RISING_MOVING,
    ACRO_TRANS_WHEELIE_LOWERING_MOVING,
};

void MovePlayerOnBike(u8 direction, u16 newKeys, u16 heldKeys);
void Bike_TryAcroBikeHistoryUpdate(u16 a, u16 b);
bool8 IsRunningDisallowed(u8 tile);
bool8 IsBikingDisallowedByPlayer(void);
bool8 player_should_look_direction_be_enforced_upon_movement(void);
void GetOnOffBike(u8 var);
void BikeClearState(int var1, int var2);
void Bike_UpdateBikeCounterSpeed(u8 var);
s16 GetPlayerSpeed(void);
void Bike_HandleBumpySlopeJump(void);
# 3 "src/field/rotating_gate.c" 2
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
# 4 "src/field/rotating_gate.c" 2
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
# 5 "src/field/rotating_gate.c" 2
# 1 "include/fieldmap.h" 1


# 1 "include/field_map_obj.h" 1
# 4 "include/fieldmap.h" 2

extern struct BackupMapData gUnknown_03004870;
struct MapHeader *mapconnection_get_mapheader(struct MapConnection *connection);
int GetMapBorderIdAt(int x, int y);
extern bool8 IsMetatileDirectionallyImpassable(struct MapObject *mapObject, s16 x, s16 y, u8 direction);
int CanCameraMoveInDirection(int direction);
u32 GetBehaviorByMetatileId(u16 metatile);
void MapGridSetMetatileEntryAt(int, int, u16);

void not_trainer_hill_battle_pyramid(void);
void sub_8055FC0(void);
void mapheader_copy_mapdata_with_padding(struct MapHeader *mapHeader);
void map_copy_with_padding(u16 *map, u16 width, u16 height);
void sub_80560AC(struct MapHeader *);
void fillSouthConnection(struct MapHeader *, struct MapHeader *, s32);
void fillNorthConnection(struct MapHeader *, struct MapHeader *, s32);
void fillWestConnection(struct MapHeader *, struct MapHeader *, s32);
void fillEastConnection(struct MapHeader *, struct MapHeader *, s32);
u8 MapGridGetZCoordAt(int s, int y);
u8 MapGridIsImpassableAt(int, int);
u32 MapGridGetMetatileIdAt(int, int);
u32 MapGridGetMetatileBehaviorAt(int x, int y);
u8 MapGridGetMetatileLayerTypeAt(int, int);
void MapGridSetMetatileIdAt(int, int, u16);
u32 GetBehaviorByMetatileId(u16 metatile);
void save_serialize_map(void);
void sub_8056670();
bool8 CameraMove(int, int);
struct MapConnection *sub_8056A64(u8 direction, int x, int y);
bool8 sub_8056ABC(u8 direction, int x, int y, struct MapConnection *connection);
bool8 sub_8056B20(int x, int src_width, int dest_width, int offset);
struct MapConnection *sub_8056BA0(s16 x, s16 y);
void sub_8056C50(u16, u16);
void sav1_camera_get_focus_coords(u16 *x, u16 *y);
void GetCameraCoords(u16*, u16*);
void sub_8056D28(struct MapData *pData);
void sub_8056D38(struct MapData *pData);
void apply_map_tileset2_palette(struct MapData *pData);
void copy_map_tileset1_tileset2_to_vram( );
void apply_map_tileset1_tileset2_palette( );
# 6 "src/field/rotating_gate.c" 2
# 1 "include/map_constants.h" 1







enum
{
    MAP_ID_PETALBURG_CITY,
    MAP_ID_SLATEPORT_CITY,
    MAP_ID_MAUVILLE_CITY,
    MAP_ID_RUSTBORO_CITY,
    MAP_ID_FORTREE_CITY,
    MAP_ID_LILYCOVE_CITY,
    MAP_ID_MOSSDEEP_CITY,
    MAP_ID_SOOTOPOLIS_CITY,
    MAP_ID_EVER_GRANDE_CITY,
    MAP_ID_LITTLEROOT_TOWN,
    MAP_ID_OLDALE_TOWN,
    MAP_ID_DEWFORD_TOWN,
    MAP_ID_LAVARIDGE_TOWN,
    MAP_ID_FALLARBOR_TOWN,
    MAP_ID_VERDANTURF_TOWN,
    MAP_ID_PACIFIDLOG_TOWN,
    MAP_ID_ROUTE101,
    MAP_ID_ROUTE102,
    MAP_ID_ROUTE103,
    MAP_ID_ROUTE104,
    MAP_ID_ROUTE105,
    MAP_ID_ROUTE106,
    MAP_ID_ROUTE107,
    MAP_ID_ROUTE108,
    MAP_ID_ROUTE109,
    MAP_ID_ROUTE110,
    MAP_ID_ROUTE111,
    MAP_ID_ROUTE112,
    MAP_ID_ROUTE113,
    MAP_ID_ROUTE114,
    MAP_ID_ROUTE115,
    MAP_ID_ROUTE116,
    MAP_ID_ROUTE117,
    MAP_ID_ROUTE118,
    MAP_ID_ROUTE119,
    MAP_ID_ROUTE120,
    MAP_ID_ROUTE121,
    MAP_ID_ROUTE122,
    MAP_ID_ROUTE123,
    MAP_ID_ROUTE124,
    MAP_ID_ROUTE125,
    MAP_ID_ROUTE126,
    MAP_ID_ROUTE127,
    MAP_ID_ROUTE128,
    MAP_ID_ROUTE129,
    MAP_ID_ROUTE130,
    MAP_ID_ROUTE131,
    MAP_ID_ROUTE132,
    MAP_ID_ROUTE133,
    MAP_ID_ROUTE134,
    MAP_ID_UNDERWATER1,
    MAP_ID_UNDERWATER2,
    MAP_ID_UNDERWATER3,
    MAP_ID_UNDERWATER4,
};
# 125 "include/map_constants.h"
enum
{
    MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F,
    MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F,
    MAP_ID_LITTLEROOT_TOWN_MAYS_HOUSE_1F,
    MAP_ID_LITTLEROOT_TOWN_MAYS_HOUSE_2F,
    MAP_ID_LITTLEROOT_TOWN_PROFESSOR_BIRCHS_LAB,
};
# 144 "include/map_constants.h"
enum
{
    MAP_ID_OLDALE_TOWN_HOUSE1,
    MAP_ID_OLDALE_TOWN_HOUSE2,
    MAP_ID_OLDALE_TOWN_POKEMON_CENTER_1F,
    MAP_ID_OLDALE_TOWN_POKEMON_CENTER_2F,
    MAP_ID_OLDALE_TOWN_MART,
};
# 163 "include/map_constants.h"
enum
{
    MAP_ID_DEWFORD_TOWN_HOUSE1,
    MAP_ID_DEWFORD_TOWN_POKEMON_CENTER_1F,
    MAP_ID_DEWFORD_TOWN_POKEMON_CENTER_2F,
    MAP_ID_DEWFORD_TOWN_GYM,
    MAP_ID_DEWFORD_TOWN_HALL,
    MAP_ID_DEWFORD_TOWN_HOUSE2,
};
# 184 "include/map_constants.h"
enum
{
    MAP_ID_LAVARIDGE_TOWN_HERB_SHOP,
    MAP_ID_LAVARIDGE_TOWN_GYM_1F,
    MAP_ID_LAVARIDGE_TOWN_GYM_B1F,
    MAP_ID_LAVARIDGE_TOWN_HOUSE,
    MAP_ID_LAVARIDGE_TOWN_MART,
    MAP_ID_LAVARIDGE_TOWN_POKEMON_CENTER_1F,
    MAP_ID_LAVARIDGE_TOWN_POKEMON_CENTER_2F,
};
# 207 "include/map_constants.h"
enum
{
    MAP_ID_FALLARBOR_TOWN_MART,
    MAP_ID_FALLARBOR_TOWN_CONTEST_LOBBY,
    MAP_ID_FALLARBOR_TOWN_CONTEST_HALL,
    MAP_ID_FALLARBOR_TOWN_POKEMON_CENTER_1F,
    MAP_ID_FALLARBOR_TOWN_POKEMON_CENTER_2F,
    MAP_ID_FALLARBOR_TOWN_HOUSE1,
    MAP_ID_FALLARBOR_TOWN_HOUSE2,
};
# 230 "include/map_constants.h"
enum
{
    MAP_ID_VERDANTURF_TOWN_CONTEST_LOBBY,
    MAP_ID_VERDANTURF_TOWN_CONTEST_HALL,
    MAP_ID_VERDANTURF_TOWN_MART,
    MAP_ID_VERDANTURF_TOWN_POKEMON_CENTER_1F,
    MAP_ID_VERDANTURF_TOWN_POKEMON_CENTER_2F,
    MAP_ID_VERDANTURF_TOWN_WANDAS_HOUSE,
    MAP_ID_VERDANTURF_TOWN_FRIENDSHIP_RATERS_HOUSE,
    MAP_ID_VERDANTURF_TOWN_HOUSE,
};
# 255 "include/map_constants.h"
enum
{
    MAP_ID_PACIFIDLOG_TOWN_POKEMON_CENTER_1F,
    MAP_ID_PACIFIDLOG_TOWN_POKEMON_CENTER_2F,
    MAP_ID_PACIFIDLOG_TOWN_HOUSE1,
    MAP_ID_PACIFIDLOG_TOWN_HOUSE2,
    MAP_ID_PACIFIDLOG_TOWN_HOUSE3,
    MAP_ID_PACIFIDLOG_TOWN_HOUSE4,
    MAP_ID_PACIFIDLOG_TOWN_HOUSE5,
};
# 278 "include/map_constants.h"
enum
{
    MAP_ID_PETALBURG_CITY_WALLYS_HOUSE,
    MAP_ID_PETALBURG_CITY_GYM,
    MAP_ID_PETALBURG_CITY_HOUSE1,
    MAP_ID_PETALBURG_CITY_HOUSE2,
    MAP_ID_PETALBURG_CITY_POKEMON_CENTER_1F,
    MAP_ID_PETALBURG_CITY_POKEMON_CENTER_2F,
    MAP_ID_PETALBURG_CITY_MART,
};
# 301 "include/map_constants.h"
enum
{
    MAP_ID_SLATEPORT_CITY_STERNS_SHIPYARD_1F,
    MAP_ID_SLATEPORT_CITY_STERNS_SHIPYARD_2F,
    MAP_ID_SLATEPORT_CITY_CONTEST_LOBBY,
    MAP_ID_SLATEPORT_CITY_CONTEST_HALL,
    MAP_ID_SLATEPORT_CITY_HOUSE1,
    MAP_ID_SLATEPORT_CITY_POKEMON_FAN_CLUB,
    MAP_ID_SLATEPORT_CITY_OCEANIC_MUSEUM_1F,
    MAP_ID_SLATEPORT_CITY_OCEANIC_MUSEUM_2F,
    MAP_ID_SLATEPORT_CITY_HARBOR,
    MAP_ID_SLATEPORT_CITY_HOUSE2,
    MAP_ID_SLATEPORT_CITY_POKEMON_CENTER_1F,
    MAP_ID_SLATEPORT_CITY_POKEMON_CENTER_2F,
    MAP_ID_SLATEPORT_CITY_MART,
};
# 336 "include/map_constants.h"
enum
{
    MAP_ID_MAUVILLE_CITY_GYM,
    MAP_ID_MAUVILLE_CITY_BIKE_SHOP,
    MAP_ID_MAUVILLE_CITY_HOUSE1,
    MAP_ID_MAUVILLE_CITY_GAME_CORNER,
    MAP_ID_MAUVILLE_CITY_HOUSE2,
    MAP_ID_MAUVILLE_CITY_POKEMON_CENTER_1F,
    MAP_ID_MAUVILLE_CITY_POKEMON_CENTER_2F,
    MAP_ID_MAUVILLE_CITY_MART,
};
# 361 "include/map_constants.h"
enum
{
    MAP_ID_RUSTBORO_CITY_DEVON_CORP_1F,
    MAP_ID_RUSTBORO_CITY_DEVON_CORP_2F,
    MAP_ID_RUSTBORO_CITY_DEVON_CORP_3F,
    MAP_ID_RUSTBORO_CITY_GYM,
    MAP_ID_RUSTBORO_CITY_POKEMON_SCHOOL,
    MAP_ID_RUSTBORO_CITY_POKEMON_CENTER_1F,
    MAP_ID_RUSTBORO_CITY_POKEMON_CENTER_2F,
    MAP_ID_RUSTBORO_CITY_MART,
    MAP_ID_RUSTBORO_CITY_FLAT1_1F,
    MAP_ID_RUSTBORO_CITY_FLAT1_2F,
    MAP_ID_RUSTBORO_CITY_HOUSE1,
    MAP_ID_RUSTBORO_CITY_CUTTERS_HOUSE,
    MAP_ID_RUSTBORO_CITY_HOUSE2,
    MAP_ID_RUSTBORO_CITY_FLAT2_1F,
    MAP_ID_RUSTBORO_CITY_FLAT2_2F,
    MAP_ID_RUSTBORO_CITY_FLAT2_3F,
    MAP_ID_RUSTBORO_CITY_HOUSE3,
};
# 404 "include/map_constants.h"
enum
{
    MAP_ID_FORTREE_CITY_HOUSE1,
    MAP_ID_FORTREE_CITY_GYM,
    MAP_ID_FORTREE_CITY_POKEMON_CENTER_1F,
    MAP_ID_FORTREE_CITY_POKEMON_CENTER_2F,
    MAP_ID_FORTREE_CITY_MART,
    MAP_ID_FORTREE_CITY_HOUSE2,
    MAP_ID_FORTREE_CITY_HOUSE3,
    MAP_ID_FORTREE_CITY_HOUSE4,
    MAP_ID_FORTREE_CITY_HOUSE5,
    MAP_ID_FORTREE_CITY_DECORATION_SHOP,
};
# 433 "include/map_constants.h"
enum
{
    MAP_ID_LILYCOVE_CITY_COVE_LILY_MOTEL_1F,
    MAP_ID_LILYCOVE_CITY_COVE_LILY_MOTEL_2F,
    MAP_ID_LILYCOVE_CITY_LILYCOVE_MUSEUM_1F,
    MAP_ID_LILYCOVE_CITY_LILYCOVE_MUSEUM_2F,
    MAP_ID_LILYCOVE_CITY_CONTEST_LOBBY,
    MAP_ID_LILYCOVE_CITY_CONTEST_HALL,
    MAP_ID_LILYCOVE_CITY_POKEMON_CENTER_1F,
    MAP_ID_LILYCOVE_CITY_POKEMON_CENTER_2F,
    MAP_ID_LILYCOVE_CITY_UNUSED_MART,
    MAP_ID_LILYCOVE_CITY_POKEMON_TRAINER_FAN_CLUB,
    MAP_ID_LILYCOVE_CITY_HARBOR,
    MAP_ID_LILYCOVE_CITY_EMPTY_MAP,
    MAP_ID_LILYCOVE_CITY_MOVE_DELETERS_HOUSE,
    MAP_ID_LILYCOVE_CITY_HOUSE1,
    MAP_ID_LILYCOVE_CITY_HOUSE2,
    MAP_ID_LILYCOVE_CITY_HOUSE3,
    MAP_ID_LILYCOVE_CITY_HOUSE4,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_1F,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_2F,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_3F,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_4F,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_5F,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_ELEVATOR,
};
# 490 "include/map_constants.h"
enum
{
    MAP_ID_MOSSDEEP_CITY_GYM,
    MAP_ID_MOSSDEEP_CITY_HOUSE1,
    MAP_ID_MOSSDEEP_CITY_HOUSE2,
    MAP_ID_MOSSDEEP_CITY_POKEMON_CENTER_1F,
    MAP_ID_MOSSDEEP_CITY_POKEMON_CENTER_2F,
    MAP_ID_MOSSDEEP_CITY_MART,
    MAP_ID_MOSSDEEP_CITY_HOUSE3,
    MAP_ID_MOSSDEEP_CITY_STEVENS_HOUSE,
    MAP_ID_MOSSDEEP_CITY_HOUSE4,
    MAP_ID_MOSSDEEP_CITY_SPACE_CENTER_1F,
    MAP_ID_MOSSDEEP_CITY_SPACE_CENTER_2F,
    MAP_ID_MOSSDEEP_CITY_GAME_CORNER_1F,
    MAP_ID_MOSSDEEP_CITY_GAME_CORNER_B1F,
};
# 525 "include/map_constants.h"
enum
{
    MAP_ID_SOOTOPOLIS_CITY_GYM_1F,
    MAP_ID_SOOTOPOLIS_CITY_GYM_B1F,
    MAP_ID_SOOTOPOLIS_CITY_POKEMON_CENTER_1F,
    MAP_ID_SOOTOPOLIS_CITY_POKEMON_CENTER_2F,
    MAP_ID_SOOTOPOLIS_CITY_MART,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE1,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE2,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE3,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE4,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE5,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE6,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE7,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE8,
};
# 560 "include/map_constants.h"
enum
{
    MAP_ID_EVER_GRANDE_CITY_SIDNEYS_ROOM,
    MAP_ID_EVER_GRANDE_CITY_PHOEBES_ROOM,
    MAP_ID_EVER_GRANDE_CITY_GLACIAS_ROOM,
    MAP_ID_EVER_GRANDE_CITY_DRAKES_ROOM,
    MAP_ID_EVER_GRANDE_CITY_CHAMPIONS_ROOM,
    MAP_ID_EVER_GRANDE_CITY_CORRIDOR1,
    MAP_ID_EVER_GRANDE_CITY_CORRIDOR2,
    MAP_ID_EVER_GRANDE_CITY_CORRIDOR3,
    MAP_ID_EVER_GRANDE_CITY_CORRIDOR4,
    MAP_ID_EVER_GRANDE_CITY_CORRIDOR5,
    MAP_ID_EVER_GRANDE_CITY_POKEMON_LEAGUE,
    MAP_ID_EVER_GRANDE_CITY_HALL_OF_FAME,
    MAP_ID_EVER_GRANDE_CITY_POKEMON_CENTER_1F,
    MAP_ID_EVER_GRANDE_CITY_POKEMON_CENTER_2F,
};
# 597 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE104_MR_BRINEYS_HOUSE,
    MAP_ID_ROUTE104_PRETTY_PETAL_FLOWER_SHOP,
};
# 610 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE111_WINSTRATE_FAMILYS_HOUSE,
    MAP_ID_ROUTE111_OLD_LADYS_REST_STOP,
};
# 623 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE112_CABLE_CAR_STATION,
    MAP_ID_MT_CHIMNEY_CABLE_CAR_STATION,
};
# 636 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE114_FOSSIL_MANIACS_HOUSE,
    MAP_ID_ROUTE114_FOSSIL_MANIACS_TUNNEL,
    MAP_ID_ROUTE114_LANETTES_HOUSE,
};
# 651 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE116_TUNNELERS_REST_HOUSE,
};







enum
{
    MAP_ID_ROUTE117_POKEMON_DAY_CARE,
};







enum
{
    MAP_ID_ROUTE121_SAFARI_ZONE_ENTRANCE,
};







enum
{
    MAP_ID_METEOR_FALLS_1F_1R,
    MAP_ID_METEOR_FALLS_1F_2R,
    MAP_ID_METEOR_FALLS_B1F_1R,
    MAP_ID_METEOR_FALLS_B1F_2R,
    MAP_ID_RUSTURF_TUNNEL,
    MAP_ID_UNDERWATER_SOOTOPOLIS_CITY,
    MAP_ID_DESERT_RUINS,
    MAP_ID_GRANITE_CAVE_1F,
    MAP_ID_GRANITE_CAVE_B1F,
    MAP_ID_GRANITE_CAVE_B2F,
    MAP_ID_GRANITE_CAVE_STEVENS_ROOM,
    MAP_ID_PETALBURG_WOODS,
    MAP_ID_MT_CHIMNEY,
    MAP_ID_JAGGED_PASS,
    MAP_ID_FIERY_PATH,
    MAP_ID_MT_PYRE_1F,
    MAP_ID_MT_PYRE_2F,
    MAP_ID_MT_PYRE_3F,
    MAP_ID_MT_PYRE_4F,
    MAP_ID_MT_PYRE_5F,
    MAP_ID_MT_PYRE_6F,
    MAP_ID_MT_PYRE_EXTERIOR,
    MAP_ID_MT_PYRE_SUMMIT,
    MAP_ID_AQUA_HIDEOUT_1F,
    MAP_ID_AQUA_HIDEOUT_B1F,
    MAP_ID_AQUA_HIDEOUT_B2F,
    MAP_ID_UNDERWATER_SEAFLOOR_CAVERN,
    MAP_ID_SEAFLOOR_CAVERN_ENTRANCE,
    MAP_ID_SEAFLOOR_CAVERN_ROOM1,
    MAP_ID_SEAFLOOR_CAVERN_ROOM2,
    MAP_ID_SEAFLOOR_CAVERN_ROOM3,
    MAP_ID_SEAFLOOR_CAVERN_ROOM4,
    MAP_ID_SEAFLOOR_CAVERN_ROOM5,
    MAP_ID_SEAFLOOR_CAVERN_ROOM6,
    MAP_ID_SEAFLOOR_CAVERN_ROOM7,
    MAP_ID_SEAFLOOR_CAVERN_ROOM8,
    MAP_ID_SEAFLOOR_CAVERN_ROOM9,
    MAP_ID_CAVE_OF_ORIGIN_ENTRANCE,
    MAP_ID_CAVE_OF_ORIGIN_1F,
    MAP_ID_CAVE_OF_ORIGIN_B1F,
    MAP_ID_CAVE_OF_ORIGIN_B2F,
    MAP_ID_CAVE_OF_ORIGIN_B3F,
    MAP_ID_CAVE_OF_ORIGIN_B4F,
    MAP_ID_VICTORY_ROAD_1F,
    MAP_ID_VICTORY_ROAD_B1F,
    MAP_ID_VICTORY_ROAD_B2F,
    MAP_ID_SHOAL_CAVE_LOW_TIDE_ENTRANCE_ROOM,
    MAP_ID_SHOAL_CAVE_LOW_TIDE_INNER_ROOM,
    MAP_ID_SHOAL_CAVE_LOW_TIDE_STAIRS_ROOM,
    MAP_ID_SHOAL_CAVE_LOW_TIDE_LOWER_ROOM,
    MAP_ID_SHOAL_CAVE_HIGH_TIDE_ENTRANCE_ROOM,
    MAP_ID_SHOAL_CAVE_HIGH_TIDE_INNER_ROOM,
    MAP_ID_NEW_MAUVILLE_ENTRANCE,
    MAP_ID_NEW_MAUVILLE_INSIDE,
    MAP_ID_ABANDONED_SHIP_DECK,
    MAP_ID_ABANDONED_SHIP_CORRIDORS_1F,
    MAP_ID_ABANDONED_SHIP_ROOMS_1F,
    MAP_ID_ABANDONED_SHIP_CORRIDORS_B1F,
    MAP_ID_ABANDONED_SHIP_ROOMS_B1F,
    MAP_ID_ABANDONED_SHIP_ROOMS2_B1F,
    MAP_ID_ABANDONED_SHIP_UNDERWATER1,
    MAP_ID_ABANDONED_SHIP_ROOM_B1F,
    MAP_ID_ABANDONED_SHIP_ROOMS2_1F,
    MAP_ID_ABANDONED_SHIP_CAPTAINS_OFFICE,
    MAP_ID_ABANDONED_SHIP_UNDERWATER2,
    MAP_ID_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS,
    MAP_ID_ABANDONED_SHIP_HIDDEN_FLOOR_ROOMS,
    MAP_ID_ISLAND_CAVE,
    MAP_ID_ANCIENT_TOMB,
    MAP_ID_UNDERWATER_ROUTE134,
    MAP_ID_UNDERWATER_SEALED_CHAMBER,
    MAP_ID_SEALED_CHAMBER_OUTER_ROOM,
    MAP_ID_SEALED_CHAMBER_INNER_ROOM,
    MAP_ID_SCORCHED_SLAB,
    MAP_ID_MAGMA_HIDEOUT_1F,
    MAP_ID_MAGMA_HIDEOUT_B1F,
    MAP_ID_MAGMA_HIDEOUT_B2F,
    MAP_ID_SKY_PILLAR_ENTRANCE,
    MAP_ID_SKY_PILLAR_OUTSIDE,
    MAP_ID_SKY_PILLAR_1F,
    MAP_ID_SKY_PILLAR_2F,
    MAP_ID_SKY_PILLAR_3F,
    MAP_ID_SKY_PILLAR_4F,
    MAP_ID_SHOAL_CAVE_LOW_TIDE_ICE_ROOM,
    MAP_ID_SKY_PILLAR_5F,
    MAP_ID_SKY_PILLAR_TOP,
};
# 865 "include/map_constants.h"
enum
{
    MAP_ID_SECRET_BASE_RED_CAVE1,
    MAP_ID_SECRET_BASE_BROWN_CAVE1,
    MAP_ID_SECRET_BASE_BLUE_CAVE1,
    MAP_ID_SECRET_BASE_YELLOW_CAVE1,
    MAP_ID_SECRET_BASE_TREE1,
    MAP_ID_SECRET_BASE_SHRUB1,
    MAP_ID_SECRET_BASE_RED_CAVE2,
    MAP_ID_SECRET_BASE_BROWN_CAVE2,
    MAP_ID_SECRET_BASE_BLUE_CAVE2,
    MAP_ID_SECRET_BASE_YELLOW_CAVE2,
    MAP_ID_SECRET_BASE_TREE2,
    MAP_ID_SECRET_BASE_SHRUB2,
    MAP_ID_SECRET_BASE_RED_CAVE3,
    MAP_ID_SECRET_BASE_BROWN_CAVE3,
    MAP_ID_SECRET_BASE_BLUE_CAVE3,
    MAP_ID_SECRET_BASE_YELLOW_CAVE3,
    MAP_ID_SECRET_BASE_TREE3,
    MAP_ID_SECRET_BASE_SHRUB3,
    MAP_ID_SECRET_BASE_RED_CAVE4,
    MAP_ID_SECRET_BASE_BROWN_CAVE4,
    MAP_ID_SECRET_BASE_BLUE_CAVE4,
    MAP_ID_SECRET_BASE_YELLOW_CAVE4,
    MAP_ID_SECRET_BASE_TREE4,
    MAP_ID_SECRET_BASE_SHRUB4,
    MAP_ID_SINGLE_BATTLE_COLOSSEUM,
    MAP_ID_TRADE_CENTER,
    MAP_ID_RECORD_CORNER,
    MAP_ID_DOUBLE_BATTLE_COLOSSEUM,
    MAP_ID_LINK_CONTEST_ROOM1,
    MAP_ID_UNKNOWN_MAP_25_29,
    MAP_ID_UNKNOWN_MAP_25_30,
    MAP_ID_UNKNOWN_MAP_25_31,
    MAP_ID_UNKNOWN_MAP_25_32,
    MAP_ID_UNKNOWN_MAP_25_33,
    MAP_ID_UNKNOWN_MAP_25_34,
    MAP_ID_LINK_CONTEST_ROOM2,
    MAP_ID_LINK_CONTEST_ROOM3,
    MAP_ID_LINK_CONTEST_ROOM4,
    MAP_ID_LINK_CONTEST_ROOM5,
    MAP_ID_LINK_CONTEST_ROOM6,
    MAP_ID_INSIDE_OF_TRUCK,
    MAP_ID_SS_TIDAL_CORRIDOR,
    MAP_ID_SS_TIDAL_LOWER_DECK,
    MAP_ID_SS_TIDAL_ROOMS,
};
# 962 "include/map_constants.h"
enum
{
    MAP_ID_SAFARI_ZONE_NORTHWEST,
    MAP_ID_SAFARI_ZONE_NORTHEAST,
    MAP_ID_SAFARI_ZONE_SOUTHWEST,
    MAP_ID_SAFARI_ZONE_SOUTHEAST,
    MAP_ID_BATTLE_TOWER_OUTSIDE,
    MAP_ID_BATTLE_TOWER_LOBBY,
    MAP_ID_BATTLE_TOWER_ELEVATOR,
    MAP_ID_BATTLE_TOWER_CORRIDOR,
    MAP_ID_BATTLE_TOWER_BATTLE_ROOM,
    MAP_ID_SOUTHERN_ISLAND_EXTERIOR,
    MAP_ID_SOUTHERN_ISLAND_INTERIOR,
    MAP_ID_SAFARI_ZONE_REST_HOUSE,
};
# 995 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE104_PROTOTYPE,
    MAP_ID_ROUTE104_PROTOTYPE_PRETTY_PETAL_FLOWER_SHOP,
};
# 1008 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE109_SEASHORE_HOUSE,
};







enum
{
    MAP_ID_ROUTE110_TRICK_HOUSE_ENTRANCE,
    MAP_ID_ROUTE110_TRICK_HOUSE_END,
    MAP_ID_ROUTE110_TRICK_HOUSE_CORRIDOR,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE1,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE2,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE3,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE4,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE5,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE6,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE7,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE8,
    MAP_ID_ROUTE110_SEASIDE_CYCLING_ROAD_SOUTH_ENTRANCE,
    MAP_ID_ROUTE110_SEASIDE_CYCLING_ROAD_NORTH_ENTRANCE,
};
# 1054 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE113_GLASS_WORKSHOP,
};







enum
{
    MAP_ID_ROUTE123_BERRY_MASTERS_HOUSE,
};







enum
{
    MAP_ID_ROUTE119_WEATHER_INSTITUTE_1F,
    MAP_ID_ROUTE119_WEATHER_INSTITUTE_2F,
    MAP_ID_ROUTE119_HOUSE,
};
# 1091 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE124_DIVING_TREASURE_HUNTERS_HOUSE,
};
# 7 "src/field/rotating_gate.c" 2
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
# 8 "src/field/rotating_gate.c" 2
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
# 9 "src/field/rotating_gate.c" 2
# 1 "include/sprite.h" 1
# 10 "src/field/rotating_gate.c" 2
# 21 "src/field/rotating_gate.c"
static void SpriteCallback_RotatingGate(struct Sprite *sprite);
static u8 RotatingGate_CreateGate(u8 gateId, s16 deltaX, s16 deltaY);
static void RotatingGate_HideGatesOutsideViewport(struct Sprite *sprite);

enum
{




    GATE_SHAPE_L1,






    GATE_SHAPE_L2,





    GATE_SHAPE_L3,






    GATE_SHAPE_L4,






    GATE_SHAPE_T1,







    GATE_SHAPE_T2,






    GATE_SHAPE_T3,
# 82 "src/field/rotating_gate.c"
    GATE_SHAPE_T4,
# 91 "src/field/rotating_gate.c"
    GATE_SHAPE_UNUSED_T1,
# 101 "src/field/rotating_gate.c"
    GATE_SHAPE_UNUSED_T2,
# 110 "src/field/rotating_gate.c"
    GATE_SHAPE_UNUSED_T3,
# 120 "src/field/rotating_gate.c"
    GATE_SHAPE_UNUSED_T4,
};

enum
{






    GATE_ORIENTATION_0,






    GATE_ORIENTATION_90,







    GATE_ORIENTATION_180,






    GATE_ORIENTATION_270,

    GATE_ORIENTATION_MAX,
};



enum
{
    GATE_ARM_NORTH,
    GATE_ARM_EAST,
    GATE_ARM_SOUTH,
    GATE_ARM_WEST,
};

enum
{
    ROTATE_NONE,
    ROTATE_ANTICLOCKWISE,
    ROTATE_CLOCKWISE,
};

enum
{
    PUZZLE_NONE,
    PUZZLE_FORTREE_CITY_GYM,
    PUZZLE_ROUTE110_TRICK_HOUSE_PUZZLE6,
};

struct RotatingGatePuzzle
{
    s16 x;
    s16 y;
    u8 shape;
    u8 orientation;
};

struct Coords8
{
    s8 deltaX;
    s8 deltaY;
};


static const struct RotatingGatePuzzle sRotatingGate_FortreePuzzleConfig[] =
{
    {12, 5, GATE_SHAPE_L4, GATE_ORIENTATION_0},
    {14, 7, GATE_SHAPE_L4, GATE_ORIENTATION_270},
    {16, 4, GATE_SHAPE_T2, GATE_ORIENTATION_90},
    {15, 14, GATE_SHAPE_L2, GATE_ORIENTATION_0},
    {18, 13, GATE_SHAPE_T1, GATE_ORIENTATION_180},
    { 8, 20, GATE_SHAPE_T1, GATE_ORIENTATION_180},
    {16, 20, GATE_SHAPE_T4, GATE_ORIENTATION_90},
};


static const struct RotatingGatePuzzle sRotatingGate_TrickHousePuzzleConfig[] =
{
    {13, 3, GATE_SHAPE_T1, GATE_ORIENTATION_270},
    {12, 6, GATE_SHAPE_T1, GATE_ORIENTATION_180},
    { 3, 6, GATE_SHAPE_T1, GATE_ORIENTATION_180},
    { 3, 9, GATE_SHAPE_T2, GATE_ORIENTATION_270},
    { 8, 8, GATE_SHAPE_L1, GATE_ORIENTATION_90},
    { 2, 12, GATE_SHAPE_T3, GATE_ORIENTATION_180},
    { 9, 13, GATE_SHAPE_L2, GATE_ORIENTATION_0},
    { 3, 14, GATE_SHAPE_L3, GATE_ORIENTATION_90},
    { 9, 15, GATE_SHAPE_L4, GATE_ORIENTATION_180},
    { 3, 18, GATE_SHAPE_T2, GATE_ORIENTATION_180},
    { 2, 19, GATE_SHAPE_T1, GATE_ORIENTATION_0},
    { 5, 21, GATE_SHAPE_L1, GATE_ORIENTATION_0},
    { 9, 19, GATE_SHAPE_L4, GATE_ORIENTATION_270},
    {12, 20, GATE_SHAPE_T1, GATE_ORIENTATION_90},
};

static const u8 sRotatingGateTiles_1[] = INCBIN_U8("graphics/rotating_gates/1.4bpp");
static const u8 sRotatingGateTiles_2[] = INCBIN_U8("graphics/rotating_gates/2.4bpp");
static const u8 sRotatingGateTiles_3[] = INCBIN_U8("graphics/rotating_gates/3.4bpp");
static const u8 sRotatingGateTiles_5[] = INCBIN_U8("graphics/rotating_gates/5.4bpp");
static const u8 sRotatingGateTiles_6[] = INCBIN_U8("graphics/rotating_gates/6.4bpp");
static const u8 sRotatingGateTiles_7[] = INCBIN_U8("graphics/rotating_gates/7.4bpp");
static const u8 sRotatingGateTiles_0[] = INCBIN_U8("graphics/rotating_gates/0.4bpp");
static const u8 sRotatingGateTiles_4[] = INCBIN_U8("graphics/rotating_gates/4.4bpp");

static const struct OamData sOamData_RotatingGateLarge =
{
    .y = 0,
    .affineMode = 1,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 5,
    .affineParam = 0,
};

static const struct OamData sOamData_RotatingGateRegular =
{
    .y = 0,
    .affineMode = 1,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 5,
    .affineParam = 0,
};

static const struct SpriteSheet sRotatingGatesGraphicsTable[] =
{
    {sRotatingGateTiles_0, 0x200, 0x1300 + GATE_SHAPE_L1},
    {sRotatingGateTiles_1, 0x800, 0x1300 + GATE_SHAPE_L2},
    {sRotatingGateTiles_2, 0x800, 0x1300 + GATE_SHAPE_L3},
    {sRotatingGateTiles_3, 0x800, 0x1300 + GATE_SHAPE_L4},
    {sRotatingGateTiles_4, 0x200, 0x1300 + GATE_SHAPE_T1},
    {sRotatingGateTiles_5, 0x800, 0x1300 + GATE_SHAPE_T2},
    {sRotatingGateTiles_6, 0x800, 0x1300 + GATE_SHAPE_T3},
    {sRotatingGateTiles_7, 0x800, 0x1300 + GATE_SHAPE_T4},
    {((void *)0)},
};

static const union AnimCmd sSpriteAnim_RotatingGateLarge[] =
{
    {.frame = {0, 0}},
    {.type = -1},
};

static const union AnimCmd sSpriteAnim_RotatingGateRegular[] =
{
    {.frame = {0, 0}}, {.type = -1},
};

static const union AnimCmd *const sSpriteAnimTable_RotatingGateLarge[] =
{
    sSpriteAnim_RotatingGateLarge,
};

static const union AnimCmd *const sSpriteAnimTable_RotatingGateRegular[] =
{
    sSpriteAnim_RotatingGateRegular,
};

static const union AffineAnimCmd sSpriteAffineAnim_Rotated0[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = 0, .duration = 0}},
    {.jump = {.type = 0x7FFE, .target = 0}},
};

static const union AffineAnimCmd sSpriteAffineAnim_Rotated90[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = -64, .duration = 0}},
    {.jump = {.type = 0x7FFE, .target = 0}},
};

static const union AffineAnimCmd sSpriteAffineAnim_Rotated180[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = -128, .duration = 0}},
    {.jump = {.type = 0x7FFE, .target = 0}},
};

static const union AffineAnimCmd sSpriteAffineAnim_Rotated270[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = 64, .duration = 0}},
    {.jump = {.type = 0x7FFE, .target = 0}},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingClockwise0to90[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = 0, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = -4, .duration = 16}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingClockwise90to180[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = -64, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = -4, .duration = 16}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingClockwise180to270[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = -128, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = -4, .duration = 16}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingClockwise270to360[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = 64, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = -4, .duration = 16}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingAnticlockwise360to270[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = 0, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 4, .duration = 16}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingAnticlockwise270to180[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = 64, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 4, .duration = 16}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingAnticlockwise180to90[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = -128, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 4, .duration = 16}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingAnticlockwise90to0[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = -64, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 4, .duration = 16}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingClockwise0to90Faster[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = 0, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = -8, .duration = 8}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingClockwise90to180Faster[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = -64, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = -8, .duration = 8}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingClockwise180to270Faster[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = -128, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = -8, .duration = 8}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingClockwise270to360Faster[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = 64, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = -8, .duration = 8}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingAnticlockwise360to270Faster[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = 0, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 8, .duration = 8}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingAnticlockwise270to180Faster[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = 64, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 8, .duration = 8}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingAnticlockwise180to90Faster[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = -128, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 8, .duration = 8}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sSpriteAffineAnim_RotatingAnticlockwise90to0Faster[] =
{
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = -64, .duration = 0}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 8, .duration = 8}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_RotatingGate[] =
{
    sSpriteAffineAnim_Rotated0,
    sSpriteAffineAnim_Rotated90,
    sSpriteAffineAnim_Rotated180,
    sSpriteAffineAnim_Rotated270,
    sSpriteAffineAnim_RotatingAnticlockwise360to270,
    sSpriteAffineAnim_RotatingAnticlockwise90to0,
    sSpriteAffineAnim_RotatingAnticlockwise180to90,
    sSpriteAffineAnim_RotatingAnticlockwise270to180,
    sSpriteAffineAnim_RotatingClockwise0to90,
    sSpriteAffineAnim_RotatingClockwise90to180,
    sSpriteAffineAnim_RotatingClockwise180to270,
    sSpriteAffineAnim_RotatingClockwise270to360,
    sSpriteAffineAnim_RotatingAnticlockwise360to270Faster,
    sSpriteAffineAnim_RotatingAnticlockwise90to0Faster,
    sSpriteAffineAnim_RotatingAnticlockwise180to90Faster,
    sSpriteAffineAnim_RotatingAnticlockwise270to180Faster,
    sSpriteAffineAnim_RotatingClockwise0to90Faster,
    sSpriteAffineAnim_RotatingClockwise90to180Faster,
    sSpriteAffineAnim_RotatingClockwise180to270Faster,
    sSpriteAffineAnim_RotatingClockwise270to360Faster,
};

static const struct SpriteTemplate sSpriteTemplate_RotatingGateLarge =
{
    .tileTag = 0x1300,
    .paletteTag = 0xFFFF,
    .oam = &sOamData_RotatingGateLarge,
    .anims = sSpriteAnimTable_RotatingGateLarge,
    .images = ((void *)0),
    .affineAnims = sSpriteAffineAnimTable_RotatingGate,
    .callback = SpriteCallback_RotatingGate,
};

static const struct SpriteTemplate sSpriteTemplate_RotatingGateRegular =
{
    .tileTag = 0x1300,
    .paletteTag = 0xFFFF,
    .oam = &sOamData_RotatingGateRegular,
    .anims = sSpriteAnimTable_RotatingGateRegular,
    .images = ((void *)0),
    .affineAnims = sSpriteAffineAnimTable_RotatingGate,
    .callback = SpriteCallback_RotatingGate,
};







static const u8 sRotatingGate_RotationInfoNorth[4 * 4] =
{
    255, 255, 255, 255,
    ((ROTATE_CLOCKWISE & 15) << 4) | ((GATE_ARM_WEST & 7) << 1) | (1 & 1), ((ROTATE_CLOCKWISE & 15) << 4) | ((GATE_ARM_WEST & 7) << 1) | (0 & 1), ((ROTATE_ANTICLOCKWISE & 15) << 4) | ((GATE_ARM_EAST & 7) << 1) | (0 & 1), ((ROTATE_ANTICLOCKWISE & 15) << 4) | ((GATE_ARM_EAST & 7) << 1) | (1 & 1),
    255, 255, 255, 255,
    255, 255, 255, 255,
};

static const u8 sRotatingGate_RotationInfoSouth[4 * 4] =
{
    255, 255, 255, 255,
    255, 255, 255, 255,
    ((ROTATE_ANTICLOCKWISE & 15) << 4) | ((GATE_ARM_WEST & 7) << 1) | (1 & 1), ((ROTATE_ANTICLOCKWISE & 15) << 4) | ((GATE_ARM_WEST & 7) << 1) | (0 & 1), ((ROTATE_CLOCKWISE & 15) << 4) | ((GATE_ARM_EAST & 7) << 1) | (0 & 1), ((ROTATE_CLOCKWISE & 15) << 4) | ((GATE_ARM_EAST & 7) << 1) | (1 & 1),
    255, 255, 255, 255,
};

static const u8 sRotatingGate_RotationInfoWest[4 * 4] =
{
    255, ((ROTATE_ANTICLOCKWISE & 15) << 4) | ((GATE_ARM_NORTH & 7) << 1) | (1 & 1), 255, 255,
    255, ((ROTATE_ANTICLOCKWISE & 15) << 4) | ((GATE_ARM_NORTH & 7) << 1) | (0 & 1), 255, 255,
    255, ((ROTATE_CLOCKWISE & 15) << 4) | ((GATE_ARM_SOUTH & 7) << 1) | (0 & 1), 255, 255,
    255, ((ROTATE_CLOCKWISE & 15) << 4) | ((GATE_ARM_SOUTH & 7) << 1) | (1 & 1), 255, 255,
};

static const u8 sRotatingGate_RotationInfoEast[4 * 4] =
{
    255, 255, ((ROTATE_CLOCKWISE & 15) << 4) | ((GATE_ARM_NORTH & 7) << 1) | (1 & 1), 255,
    255, 255, ((ROTATE_CLOCKWISE & 15) << 4) | ((GATE_ARM_NORTH & 7) << 1) | (0 & 1), 255,
    255, 255, ((ROTATE_ANTICLOCKWISE & 15) << 4) | ((GATE_ARM_SOUTH & 7) << 1) | (0 & 1), 255,
    255, 255, ((ROTATE_ANTICLOCKWISE & 15) << 4) | ((GATE_ARM_SOUTH & 7) << 1) | (1 & 1), 255,
};



static const struct Coords8 sRotatingGate_ArmPositionsClockwiseRotation[] = {
    { 0, -1 }, { 1, -2 }, { 0, 0 }, { 1, 0 }, { -1, 0 }, { -1, 1 }, { -1, -1 }, { -2, -1 },
};

static const struct Coords8 sRotatingGate_ArmPositionsAntiClockwiseRotation[] = {
    { -1, -1 }, { -1, -2 }, { 0, -1 }, { 1, -1 }, { 0, 0 }, { 0, 1 }, { -1, 0 }, { -2, 0 },
};



static const u8 sRotatingGate_ArmLayout[][4 * 2] =
{

    {
        1, 0,
        1, 0,
        0, 0,
        0, 0,
    },
    {
        1, 1,
        1, 0,
        0, 0,
        0, 0,
    },
    {
        1, 0,
        1, 1,
        0, 0,
        0, 0,
    },
    {
        1, 1,
        1, 1,
        0, 0,
        0, 0,
    },


    {
        1, 0,
        1, 0,
        1, 0,
        0, 0,
    },
    {
        1, 1,
        1, 0,
        1, 0,
        0, 0,
    },
    {
        1, 0,
        1, 1,
        1, 0,
        0, 0,
    },
    {
        1, 0,
        1, 0,
        1, 1,
        0, 0,
    },




    {
        1, 1,
        1, 1,
        1, 0,
        0, 0,
    },
    {
        1, 1,
        1, 0,
        1, 1,
        0, 0,
    },
    {
        1, 0,
        1, 1,
        1, 1,
        0, 0,
    },
    {
        1, 1,
        1, 1,
        1, 1,
        0, 0,
    },
};

static __attribute__((section("ewram_data"))) u8 gRotatingGate_GateSpriteIds[14] = {0};
static __attribute__((section("ewram_data"))) const struct RotatingGatePuzzle *gRotatingGate_PuzzleConfig = ((void *)0);
static __attribute__((section("ewram_data"))) u8 gRotatingGate_PuzzleCount = 0;

static int GetCurrentMapRotatingGatePuzzleType(void)
{
    if (gSaveBlock1.location.mapGroup == 12 &&
        gSaveBlock1.location.mapNum == MAP_ID_FORTREE_CITY_GYM)
    {
        return PUZZLE_FORTREE_CITY_GYM;
    }

    if (gSaveBlock1.location.mapGroup == 29 &&
        gSaveBlock1.location.mapNum == MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE6)
    {
        return PUZZLE_ROUTE110_TRICK_HOUSE_PUZZLE6;
    }

    return PUZZLE_NONE;
}

static void RotatingGate_ResetAllGateOrientations(void)
{
    int i;
    u8 *ptr;

    ptr = (u8 *)GetVarPointer(0x4000);

    for (i = 0; i < gRotatingGate_PuzzleCount; i++)
    {
        ptr[i] = gRotatingGate_PuzzleConfig[i].orientation;
    }
}

static int RotatingGate_GetGateOrientation(u8 gateId)
{
    return ((u8 *)GetVarPointer(0x4000))[gateId];
}

static void RotatingGate_SetGateOrientation(u8 gateId, u8 orientation)
{
    ((u8 *)GetVarPointer(0x4000))[gateId] = orientation;
}

static void RotatingGate_RotateInDirection(u8 gateId, u32 rotationDirection)
{
    u8 orientation = RotatingGate_GetGateOrientation(gateId);

    if (rotationDirection == ROTATE_ANTICLOCKWISE)
    {
        if (orientation)
        {
            orientation--;
        }
        else
        {
            orientation = GATE_ORIENTATION_270;
        }
    }
    else
    {
        orientation = ++orientation % GATE_ORIENTATION_MAX;
    }

    RotatingGate_SetGateOrientation(gateId, orientation);
}

static void RotatingGate_LoadPuzzleConfig(void)
{
    int puzzleType = GetCurrentMapRotatingGatePuzzleType();
    u32 i;

    switch (puzzleType)
    {
    case PUZZLE_FORTREE_CITY_GYM:
        gRotatingGate_PuzzleConfig = sRotatingGate_FortreePuzzleConfig;
        gRotatingGate_PuzzleCount =
            sizeof(sRotatingGate_FortreePuzzleConfig) / sizeof(struct RotatingGatePuzzle);
        break;
    case PUZZLE_ROUTE110_TRICK_HOUSE_PUZZLE6:
        gRotatingGate_PuzzleConfig = sRotatingGate_TrickHousePuzzleConfig;
        gRotatingGate_PuzzleCount =
            sizeof(sRotatingGate_TrickHousePuzzleConfig) / sizeof(struct RotatingGatePuzzle);
        break;
    case PUZZLE_NONE:
    default:
        return;
    }

    for (i = 0; i < 14; i++)
    {
        gRotatingGate_GateSpriteIds[i] = 64;
    }
}

static void RotatingGate_CreateGatesWithinViewport(s16 deltaX, s16 deltaY)
{
    u8 i;



    s16 x = gSaveBlock1.pos.x - 2;
    s16 x2 = gSaveBlock1.pos.x + 0x11;
    s16 y = gSaveBlock1.pos.y - 2;
    s16 y2 = gSaveBlock1.pos.y + 0xe;

    s16 x3, y3;

    for (i = 0; i < gRotatingGate_PuzzleCount; i++)
    {
        x3 = gRotatingGate_PuzzleConfig[i].x + 7;
        y3 = gRotatingGate_PuzzleConfig[i].y + 7;

        if (y <= y3 && y2 >= y3 && x <= x3 && x2 >= x3 &&
            gRotatingGate_GateSpriteIds[i] == 64)
        {
            gRotatingGate_GateSpriteIds[i] = RotatingGate_CreateGate(i, deltaX, deltaY);
        }
    }
}

static u8 RotatingGate_CreateGate(u8 gateId, s16 deltaX, s16 deltaY)
{
    struct Sprite *sprite;
    struct SpriteTemplate template;
    const struct RotatingGatePuzzle *gate;
    u8 spriteId;
    s16 x, y;

    gate = &gRotatingGate_PuzzleConfig[gateId];

    if (gate->shape == GATE_SHAPE_L1 || gate->shape == GATE_SHAPE_T1)
        template = sSpriteTemplate_RotatingGateRegular;
    else
        template = sSpriteTemplate_RotatingGateLarge;

    template.tileTag = gate->shape + 0x1300;

    spriteId = CreateSprite(&template, 0, 0, 0x94);
    if (spriteId == 64)
        return 64;

    x = gate->x + 7;
    y = gate->y + 7;

    sprite = &gSprites[spriteId];
    sprite->data[0] = gateId;
    sprite->coordOffsetEnabled = 1;

    sub_8060388(x + deltaX, y + deltaY, &sprite->pos1.x, &sprite->pos1.y);
    RotatingGate_HideGatesOutsideViewport(sprite);
    StartSpriteAffineAnim(sprite, RotatingGate_GetGateOrientation(gateId));

    return spriteId;
}

static void SpriteCallback_RotatingGate(struct Sprite *sprite)
{
    u8 rotationDirection;
    u8 orientation;
    u8 affineAnimation;

    rotationDirection = sprite->data[1];
    orientation = sprite->data[2];

    RotatingGate_HideGatesOutsideViewport(sprite);

    if (rotationDirection == ROTATE_ANTICLOCKWISE)
    {
        affineAnimation = orientation + 4;

        if (GetPlayerSpeed() != 1)
            affineAnimation += 8;

        PlaySE(SE_HI_TURUN);
        StartSpriteAffineAnim(sprite, affineAnimation);
    }
    else if (rotationDirection == ROTATE_CLOCKWISE)
    {
        affineAnimation = orientation + 8;

        if (GetPlayerSpeed() != 1)
            affineAnimation += 8;

        PlaySE(SE_HI_TURUN);
        StartSpriteAffineAnim(sprite, affineAnimation);
    }

    sprite->data[1] = ROTATE_NONE;
}

static void RotatingGate_HideGatesOutsideViewport(struct Sprite *sprite)
{
    u16 x;
    s16 x2;
    u16 y;
    s16 y2;

    sprite->invisible = 0;
    x = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX + gSpriteCoordOffsetX;
    y = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY;

    x2 = x + 0x40;
    y2 = y + 0x40;

    if ((s16)x > 240 + 0x10 - 1 || x2 < -0x10)
    {
        sprite->invisible = 1;
    }

    if ((s16)y > 160 + 0x10 - 1 || y2 < -0x10)
    {
        sprite->invisible = 1;
    }
}

static void LoadRotatingGatePics(void)
{
    LoadSpriteSheets(sRotatingGatesGraphicsTable);
}

static void RotatingGate_DestroyGatesOutsideViewport(void)
{
    s16 x;
    s16 x2;
    s16 y;
    s16 y2;
    s16 xGate;
    s16 yGate;
    int i;
    struct Sprite *sprite;


    x = gSaveBlock1.pos.x - 2;
    x2 = gSaveBlock1.pos.x + 0x11;
    y = gSaveBlock1.pos.y - 2;
    y2 = gSaveBlock1.pos.y + 0xe;

    for (i = 0; i < gRotatingGate_PuzzleCount; i++)
    {
        xGate = gRotatingGate_PuzzleConfig[i].x + 7;
        yGate = gRotatingGate_PuzzleConfig[i].y + 7;

        if (gRotatingGate_GateSpriteIds[i] == 64)
            continue;

        if (xGate < x || xGate > x2 || yGate < y || yGate > y2)
        {
            sprite = &gSprites[gRotatingGate_GateSpriteIds[i]];
            FreeSpriteOamMatrix(sprite);
            DestroySprite(sprite);
            gRotatingGate_GateSpriteIds[i] = 64;
        }
    }
}
# 926 "src/field/rotating_gate.c"
__attribute__((naked))
static int RotatingGate_CanRotate(u8 a, int puzzleType)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0xC\n    lsls r0, 24\n    lsrs r4, r0, 24\n    cmp r1, 0x1\n    bne _080C7EAC\n    ldr r0, _080C7EA8 @ =sRotatingGate_ArmPositionsAntiClockwiseRotation\n    mov r10, r0\n    b _080C7EB8\n    .align 2, 0\n_080C7EA8: .4byte sRotatingGate_ArmPositionsAntiClockwiseRotation\n_080C7EAC:\n    cmp r1, 0x2\n    beq _080C7EB4\n_080C7EB0:\n    movs r0, 0\n    b _080C7F48\n_080C7EB4:\n    ldr r1, _080C7F58 @ =sRotatingGate_ArmPositionsClockwiseRotation\n    mov r10, r1\n_080C7EB8:\n    adds r0, r4, 0\n    bl RotatingGate_GetGateOrientation\n    lsls r0, 24\n    lsrs r0, 24\n    str r0, [sp]\n    ldr r0, _080C7F5C @ =gRotatingGate_PuzzleConfig\n    ldr r1, [r0]\n    lsls r0, r4, 3\n    adds r0, r1\n    ldrb r2, [r0, 0x4]\n    ldrh r1, [r0]\n    adds r1, 0x7\n    ldrh r0, [r0, 0x2]\n    adds r0, 0x7\n    movs r3, 0\n    lsls r2, 3\n    str r2, [sp, 0x4]\n    lsls r1, 16\n    asrs r1, 16\n    mov r9, r1\n    lsls r0, 16\n    asrs r0, 16\n    mov r8, r0\n_080C7EE8:\n    movs r6, 0\n    ldr r2, [sp]\n    adds r7, r2, r3\n    lsls r0, r3, 1\n    adds r5, r7, 0\n    ldr r1, [sp, 0x4]\n    adds r0, r1\n    ldr r2, _080C7F60 @ =sRotatingGate_ArmLayout\n    adds r4, r0, r2\n_080C7EFA:\n    adds r0, r5, 0\n    cmp r5, 0\n    bge _080C7F02\n    adds r0, r7, 0x3\n_080C7F02:\n    asrs r0, 2\n    lsls r0, 2\n    subs r0, r5, r0\n    lsls r0, 1\n    adds r0, r6\n    lsls r0, 24\n    lsrs r1, r0, 24\n    ldrb r0, [r4]\n    cmp r0, 0\n    beq _080C7F38\n    lsls r1, 2\n    add r1, r10\n    movs r0, 0\n    ldrsb r0, [r1, r0]\n    add r0, r9\n    ldrb r1, [r1, 0x1]\n    lsls r1, 24\n    asrs r1, 24\n    add r1, r8\n    str r3, [sp, 0x8]\n    bl MapGridIsImpassableAt\n    lsls r0, 24\n    lsrs r0, 24\n    ldr r3, [sp, 0x8]\n    cmp r0, 0x1\n    beq _080C7EB0\n_080C7F38:\n    adds r4, 0x1\n    adds r6, 0x1\n    cmp r6, 0x1\n    ble _080C7EFA\n    adds r3, 0x1\n    cmp r3, 0x3\n    ble _080C7EE8\n    movs r0, 0x1\n_080C7F48:\n    add sp, 0xC\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r1}\n    bx r1\n    .align 2, 0\n_080C7F58: .4byte sRotatingGate_ArmPositionsClockwiseRotation\n_080C7F5C: .4byte gRotatingGate_PuzzleConfig\n_080C7F60: .4byte sRotatingGate_ArmLayout\n.syntax divided\n");
# 1043 "src/field/rotating_gate.c"
}


static int RotatingGate_HasArm(u8 gateId, u8 armInfo)
{
    int isLongArm;
    s8 armOrientation;
    int arm;
    int shape;

    arm = armInfo >> 1;
    isLongArm = armInfo & 1;

    armOrientation = (arm - RotatingGate_GetGateOrientation(gateId) + 4) % 4;
    shape = gRotatingGate_PuzzleConfig[gateId].shape;
    return sRotatingGate_ArmLayout[shape][armOrientation * 2 + isLongArm];
}

static void RotatingGate_TriggerRotationAnimation(u8 gateId, int rotationDirection)
{
    struct Sprite *sprite;

    if (gRotatingGate_GateSpriteIds[gateId] != 64)
    {
        sprite = &gSprites[gRotatingGate_GateSpriteIds[gateId]];
        sprite->data[1] = rotationDirection;
        sprite->data[2] = RotatingGate_GetGateOrientation(gateId);
    }
}

static u8 RotatingGate_GetRotationInfo(u8 direction, s16 x, s16 y)
{
    register const u8 *ptr;

    if (direction == DIR_NORTH)
        ptr = sRotatingGate_RotationInfoNorth;
    else if (direction == DIR_SOUTH)
        ptr = sRotatingGate_RotationInfoSouth;
    else if (direction == DIR_WEST)
        ptr = sRotatingGate_RotationInfoWest;
    else if (direction == DIR_EAST)
        ptr = sRotatingGate_RotationInfoEast;
    else
        return 255;

    return ptr[y * 4 + x];
}

void RotatingGate_InitPuzzle(void)
{
    if (GetCurrentMapRotatingGatePuzzleType())
    {
        RotatingGate_LoadPuzzleConfig();
        RotatingGate_ResetAllGateOrientations();
    }
}

void RotatingGatePuzzleCameraUpdate(u16 deltaX, u16 deltaY)
{
    if (GetCurrentMapRotatingGatePuzzleType())
    {
        RotatingGate_CreateGatesWithinViewport(deltaX, deltaY);
        RotatingGate_DestroyGatesOutsideViewport();
    }
}

void RotatingGate_InitPuzzleAndGraphics(void)
{
    if (GetCurrentMapRotatingGatePuzzleType())
    {
        LoadRotatingGatePics();
        RotatingGate_LoadPuzzleConfig();
        RotatingGate_CreateGatesWithinViewport(0, 0);
    }
}

bool8 CheckForRotatingGatePuzzleCollision(u8 direction, s16 x, s16 y)
{
    int i;

    if (!GetCurrentMapRotatingGatePuzzleType())
        return 0;
    for (i = 0; i < gRotatingGate_PuzzleCount; i++)
    {
        s16 gateX = gRotatingGate_PuzzleConfig[i].x + 7;
        s16 gateY = gRotatingGate_PuzzleConfig[i].y + 7;

        if (gateX - 2 <= x && x <= gateX + 1 && gateY - 2 <= y && y <= gateY + 1)
        {
            s16 centerX = x - gateX + 2;
            s16 centerY = y - gateY + 2;
            u8 rotationInfo = RotatingGate_GetRotationInfo(direction, centerX, centerY);

            if (rotationInfo != 255)
            {
                u8 rotationDirection = ((rotationInfo & 0xF0) >> 4);
                u8 armInfo = rotationInfo & 0xF;

                if (RotatingGate_HasArm(i, armInfo))
                {
                    if (RotatingGate_CanRotate(i, rotationDirection))
                    {
                        RotatingGate_TriggerRotationAnimation(i, rotationDirection);
                        RotatingGate_RotateInDirection(i, rotationDirection);
                        return 0;
                    }
                    return 1;
                }
            }
        }
    }
    return 0;
}
