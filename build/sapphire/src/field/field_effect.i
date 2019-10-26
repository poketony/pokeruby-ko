# 1 "src/field/field_effect.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/field_effect.c"
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
# 2 "src/field/field_effect.c" 2
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
# 3 "src/field/field_effect.c" 2
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
# 4 "src/field/field_effect.c" 2
# 1 "include/trig.h" 1



extern const s16 gSineTable[];

s16 Sin(s16 index, s16 amplitude);
s16 Cos(s16 index, s16 amplitude);
s16 Sin2(u16 angle);
s16 Cos2(u16 angle);
# 5 "src/field/field_effect.c" 2
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
# 6 "src/field/field_effect.c" 2
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
# 7 "src/field/field_effect.c" 2
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
# 8 "src/field/field_effect.c" 2
# 1 "include/sprite.h" 1
# 9 "src/field/field_effect.c" 2
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
# 10 "src/field/field_effect.c" 2
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
# 11 "src/field/field_effect.c" 2
# 1 "include/text.h" 1
# 12 "src/field/field_effect.c" 2
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
# 13 "src/field/field_effect.c" 2
# 1 "include/task.h" 1
# 14 "src/field/field_effect.c" 2
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
# 15 "src/field/field_effect.c" 2
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
# 16 "src/field/field_effect.c" 2
# 1 "include/decoration.h" 1





enum DecoId {
            DECOR_NONE,
            DECOR_SMALL_DESK,
            DECOR_POKEMON_DESK,
            DECOR_HEAVY_DESK,
            DECOR_RAGGED_DESK,
            DECOR_COMFORT_DESK,
            DECOR_PRETTY_DESK,
            DECOR_BRICK_DESK,
            DECOR_CAMP_DESK,
            DECOR_HARD_DESK,
            DECOR_SMALL_CHAIR,
            DECOR_POKEMON_CHAIR,
            DECOR_HEAVY_CHAIR,
            DECOR_PRETTY_CHAIR,
            DECOR_COMFORT_CHAIR,
            DECOR_RAGGED_CHAIR,
            DECOR_BRICK_CHAIR,
            DECOR_CAMP_CHAIR,
            DECOR_HARD_CHAIR,
            DECOR_RED_PLANT,
            DECOR_TROPICAL_PLANT,
            DECOR_PRETTY_FLOWERS,
            DECOR_COLORFUL_PLANT,
            DECOR_BIG_PLANT,
            DECOR_GORGEOUS_PLANT,
            DECOR_RED_BRICK,
            DECOR_YELLOW_BRICK,
            DECOR_BLUE_BRICK,
            DECOR_RED_BALLOON,
            DECOR_BLUE_BALLOON,
            DECOR_YELLOW_BALLOON,
            DECOR_RED_TENT,
            DECOR_BLUE_TENT,
            DECOR_SOLID_BOARD,
            DECOR_SLIDE,
            DECOR_FENCE_LENGTH,
            DECOR_FENCE_WIDTH,
            DECOR_TIRE,
            DECOR_STAND,
            DECOR_MUD_BALL,
            DECOR_BREAKABLE_DOOR,
            DECOR_SAND_ORNAMENT,
            DECOR_SILVER_SHIELD,
            DECOR_GOLD_SHIELD,
            DECOR_GLASS_ORNAMENT,
            DECOR_TV,
            DECOR_ROUND_TV,
            DECOR_CUTE_TV,
            DECOR_GLITTER_MAT,
            DECOR_JUMP_MAT,
            DECOR_SPIN_MAT,
            DECOR_C_LOW_NOTE_MAT,
            DECOR_D_NOTE_MAT,
            DECOR_E_NOTE_MAT,
            DECOR_F_NOTE_MAT,
            DECOR_G_NOTE_MAT,
            DECOR_A_NOTE_MAT,
            DECOR_B_NOTE_MAT,
            DECOR_C_HIGH_NOTE_MAT,
            DECOR_SURF_MAT,
            DECOR_THUNDER_MAT,
            DECOR_FIRE_BLAST_MAT,
            DECOR_POWDER_SNOW_MAT,
            DECOR_ATTRACT_MAT,
            DECOR_FISSURE_MAT,
            DECOR_SPIKES_MAT,
            DECOR_BALL_POSTER,
            DECOR_GREEN_POSTER,
            DECOR_RED_POSTER,
            DECOR_BLUE_POSTER,
            DECOR_CUTE_POSTER,
            DECOR_PIKA_POSTER,
            DECOR_LONG_POSTER,
            DECOR_SEA_POSTER,
            DECOR_SKY_POSTER,
            DECOR_KISS_POSTER,
            DECOR_PICHU_DOLL,
            DECOR_PIKACHU_DOLL,
            DECOR_MARILL_DOLL,
            DECOR_TOGEPI_DOLL,
            DECOR_CYNDAQUIL_DOLL,
            DECOR_CHIKORITA_DOLL,
            DECOR_TOTODILE_DOLL,
            DECOR_JIGGLYPUFF_DOLL,
            DECOR_MEOWTH_DOLL,
            DECOR_CLEFAIRY_DOLL,
            DECOR_DITTO_DOLL,
            DECOR_SMOOCHUM_DOLL,
            DECOR_TREECKO_DOLL,
            DECOR_TORCHIC_DOLL,
            DECOR_MUDKIP_DOLL,
            DECOR_DUSKULL_DOLL,
            DECOR_WYNAUT_DOLL,
            DECOR_BALTOY_DOLL,
            DECOR_KECLEON_DOLL,
            DECOR_AZURILL_DOLL,
            DECOR_SKITTY_DOLL,
            DECOR_SWABLU_DOLL,
            DECOR_GULPIN_DOLL,
            DECOR_LOTAD_DOLL,
            DECOR_SEEDOT_DOLL,
            DECOR_PIKA_CUSHION,
            DECOR_ROUND_CUSHION,
            DECOR_KISS_CUSHION,
            DECOR_ZIGZAG_CUSHION,
            DECOR_SPIN_CUSHION,
            DECOR_DIAMOND_CUSHION,
            DECOR_BALL_CUSHION,
            DECOR_GRASS_CUSHION,
            DECOR_FIRE_CUSHION,
            DECOR_WATER_CUSHION,
            DECOR_SNORLAX_DOLL,
            DECOR_RHYDON_DOLL,
            DECOR_LAPRAS_DOLL,
            DECOR_VENUSAUR_DOLL,
            DECOR_CHARIZARD_DOLL,
            DECOR_BLASTOISE_DOLL,
            DECOR_WAILMER_DOLL,
            DECOR_REGIROCK_DOLL,
            DECOR_REGICE_DOLL,
            DECOR_REGISTEEL_DOLL
};

enum DecorPerm {



    DECORPERM_SOLID_FLOOR,
    DECORPERM_PASS_FLOOR,
    DECORPERM_BEHIND_FLOOR,
    DECORPERM_NA_WALL,
    DECORPERM_SOLID_MAT
};

enum DecorShape {



    DECORSHAPE_1x1,
    DECORSHAPE_2x1,
    DECORSHAPE_3x1,
    DECORSHAPE_4x2,
    DECORSHAPE_2x2,
    DECORSHAPE_1x2,
    DECORSHAPE_1x3,
    DECORSHAPE_2x4,
    DECORSHAPE_3x3,
    DECORSHAPE_3x2
};

enum DecoCat {



          DECORCAT_DESK,
          DECORCAT_CHAIR,
          DECORCAT_PLANT,
          DECORCAT_ORNAMENT,
          DECORCAT_MAT,
          DECORCAT_POSTER,
          DECORCAT_DOLL,
          DECORCAT_CUSHION
};

struct Decoration
{
             u8 id;
             u8 name[16];
             u8 permission;
             u8 shape;
             u8 category;
             u16 price;
             const u8 *description;
             const u16 *tiles;
};

struct DecoPCPointers
{
               u8 *items;
               u8 *pos;
               u8 size;
               u8 isPlayerRoom;
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
                          const struct Decoration *decoration;
                          u16 tiles[0x40];
                          u8 image[0x800];
                          u16 palette[16];
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
extern void sub_80B3068(u8);
extern const struct YesNoFuncTable gUnknown_083EC95C;
extern const struct YesNoFuncTable gUnknown_083EC964;
extern const struct YesNoFuncTable gUnknown_083EC9CC;
extern const struct YesNoFuncTable gUnknown_083EC9D4;
extern const struct YesNoFuncTable gUnknown_083ECAA0;

extern u8 sub_8134194(u8);
extern bool8 sub_81341D4(void);
extern void sub_8134104(u8);
extern bool8 sub_807D770(void);
extern void sub_8109DAC(u8);
extern void ReshowPlayerPC(u8);
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
# 17 "src/field/field_effect.c" 2
# 1 "include/field_player_avatar.h" 1






void player_step(u8 a, u16 b, u16 c);
u8 ForcedMovement_None(void);
u8 ForcedMovement_Slip(void);
u8 sub_8058AAC(void);
u8 sub_8058AC4(void);
u8 sub_8058ADC(void);
u8 sub_8058AF4(void);
u8 sub_8058B0C(void);
u8 sub_8058B24(void);
u8 sub_8058B3C(void);
u8 sub_8058B54(void);
u8 ForcedMovement_SlideSouth(void);
u8 ForcedMovement_SlideNorth(void);
u8 ForcedMovement_SlideWest(void);
u8 ForcedMovement_SlideEast(void);
u8 ForcedMovement_MatJump(void);
u8 sub_8058C10(void);
u8 ForcedMovement_MuddySlope(void);
void PlayerNotOnBikeNotMoving(u8 direction, u16 heldKeys);
void PlayerNotOnBikeTurningInPlace(u8 direction, u16 heldKeys);
void sub_8058D0C(u8 direction, u16 heldKeys);
u8 CheckForFieldObjectCollision(struct MapObject *a, s16 b, s16 c, u8 d, u8 e);
void SetPlayerAvatarTransitionFlags(u16 a);
void nullsub_49(struct MapObject *a);
void PlayerAvatarTransition_Normal(struct MapObject *a);
void PlayerAvatarTransition_MachBike(struct MapObject *a);
void PlayerAvatarTransition_AcroBike(struct MapObject *a);
void PlayerAvatarTransition_Surfing(struct MapObject *a);
void PlayerAvatarTransition_Underwater(struct MapObject *a);
void sub_80591F4(struct MapObject *a);
void sub_8059204(void);
u8 player_get_x22(void);
void PlayerSetAnimId(u8 a, u8 b);
void PlayerGoSpeed1(u8 a);
void PlayerGoSpeed2(u8 a);
void npc_use_some_d2s(u8 a);
void PlayerGoSpeed4(u8 a);
void sub_805940C(u8 a);
void PlayerOnBikeCollide(u8);
void PlayerFaceDirection(u8 a);
void PlayerTurnInPlace(u8 a);
void PlayerJumpLedge(u8 a);
void sub_80594C0(void);
void PlayerIdleWheelie(u8 a);
void PlayerStartWheelie(u8 a);
void PlayerEndWheelie(u8 a);
void PlayerStandingHoppingWheelie(u8 a);
void PlayerMovingHoppingWheelie(u8 a);
void PlayerLedgeHoppingWheelie(u8 a);
void PlayerAcroTurnJump(u8 a);
void sub_80595DC(u8 a);
void sub_8059600(u8 a);
void sub_8059618(u8 a);
void sub_8059630(u8 a);
void GetXYCoordsOneStepInFrontOfPlayer(s16 *x, s16 *y);
void PlayerGetDestCoords(s16 *, s16 *);
u8 player_get_direction_lower_nybble(void);
u8 player_get_direction_upper_nybble(void);
u8 PlayerGetZCoord(void);
u8 TestPlayerAvatarFlags(u8);
u8 sub_80597D0(void);
u8 GetPlayerAvatarObjectId(void);
void sub_80597E8(void);
void sub_80597F4(void);
u8 GetRivalAvatarGraphicsIdByStateIdAndGender(u8 a, u8 b);
u8 GetPlayerAvatarGraphicsIdByStateId(u8 a);
u8 GetPlayerAvatarGenderByGraphicsId(u8 gfxId);
bool8 PartyHasMonWithSurf(void);
bool8 IsPlayerSurfingNorth(void);
bool8 IsPlayerFacingSurfableFishableWater(void);
void ClearPlayerAvatarInfo(void);
void SetPlayerAvatarStateMask(u8 a);
u8 GetPlayerAvatarGraphicsIdByCurrentState(void);
void SetPlayerAvatarExtraStateTransition(u8 a, u8 b);
void InitPlayerAvatar(s16 a, s16 b, u8 c, u8 d);
void sub_8059B88(u8);
void sub_8059BF4(void);

void sub_8059C94(u8);
void sub_8059D08(u8);
u8 sub_8059E84(struct Task *task, struct MapObject *b, struct MapObject *c);
u8 sub_8059EA4(struct Task *task, struct MapObject *b, struct MapObject *c);
u8 sub_8059F40(struct Task *task, struct MapObject *b, struct MapObject *c);
u8 PlayerAvatar_DoSecretBaseMatJump(struct Task *task, struct MapObject *mapObject);
u8 sub_805A0D8(struct Task *task, struct MapObject *mapObject);
u8 sub_805A100(struct Task *task, struct MapObject *mapObject);
u8 sub_805A178(struct Task *task, struct MapObject *mapObject);
u8 sub_805A1B8(struct Task *task, struct MapObject *mapObject);
void sub_805A20C(u8 a);
void StartFishing(u8 a);
u8 Fishing1(struct Task *task);
u8 Fishing2(struct Task *task);
u8 Fishing3(struct Task *task);
u8 Fishing4(struct Task *task);
u8 Fishing5(struct Task *task);
u8 Fishing6(struct Task *task);
u8 Fishing7(struct Task *task);
u8 Fishing8(struct Task *task);
u8 Fishing9(struct Task *task);
u8 Fishing10(struct Task *task);
u8 Fishing11(struct Task *task);
u8 Fishing12(struct Task *task);
u8 Fishing13(struct Task *task);
u8 Fishing14(struct Task *task);
u8 Fishing15(struct Task *task);
u8 Fishing16(struct Task *task);
# 18 "src/field/field_effect.c" 2
# 1 "include/field_map_obj_helpers.h" 1





bool8 FreezeMapObject(struct MapObject *);
void FreezeMapObjects(void);
void FreezeMapObjectsExceptOne(u8);
void UnfreezeMapObjects(void);
void sub_806487C(struct Sprite *sprite, bool8 invisible);
void sub_8064990(u8, u8);
void UnfreezeMapObject(struct MapObject *mapObject);
void oamt_npc_ministep_reset(struct Sprite *sprite, u8 a2, u8 a3);
void sub_806467C(struct Sprite *sprite, u8 direction);
bool8 sub_806468C(struct Sprite *sprite);
void sub_80646E4(struct Sprite *sprite, u8 a2, u8 a3, u8 a4);
void DoShadowFieldEffect(struct MapObject *mapObject);
u8 sub_8064704(struct Sprite *);
u8 sub_806478C(struct Sprite *);
void obj_anim_image_set_and_seek(struct Sprite *sprite, u8 a2, u8 a3);
void DoRippleFieldEffect(struct MapObject *mapObj, struct Sprite *sprite);
# 19 "src/field/field_effect.c" 2
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
# 20 "src/field/field_effect.c" 2
# 1 "include/metatile_behavior.h" 1



bool8 MetatileBehavior_IsATile(u8);
bool8 MetatileBehavior_IsEncounterTile(u8);
bool8 MetatileBehavior_IsJumpEast(u8);
bool8 MetatileBehavior_IsJumpWest(u8);
bool8 MetatileBehavior_IsJumpNorth(u8);
bool8 MetatileBehavior_IsJumpSouth(u8);
bool8 MetatileBehavior_IsPokeGrass(u8);
bool8 MetatileBehavior_IsSandOrDeepSand(u8);
bool8 MetatileBehavior_IsDeepSand(u8);
bool8 MetatileBehavior_IsReflective(u8);
bool8 MetatileBehavior_IsIce(u8);
bool8 MetatileBehavior_IsWarpDoor(u8);
bool8 MetatileBehavior_IsDoor(u8);
bool8 MetatileBehavior_IsEscalator(u8);
bool8 unref_sub_8056EE0(u8);
bool8 MetatileBehavior_IsLadder(u8);
bool8 MetatileBehavior_IsNonAnimDoor(u8);
bool8 MetatileBehavior_IsDeepSouthWarp(u8);
bool8 MetatileBehavior_IsSurfableWaterOrUnderwater(u8);
bool8 MetatileBehavior_IsEastArrowWarp(u8);
bool8 MetatileBehavior_IsWestArrowWarp(u8);
bool8 MetatileBehavior_IsNorthArrowWarp(u8);
bool8 MetatileBehavior_IsSouthArrowWarp(u8);
bool8 MetatileBehavior_IsArrowWarp(u8);
bool8 MetatileBehavior_IsMoveTile(u8);
bool8 MetatileBehavior_IsIce_2(u8);
bool8 MetatileBehavior_IsTrickHouseSlipperyFloor(u8);
bool8 MetatileBehavior_0x05(u8);
bool8 MetatileBehavior_IsWalkNorth(u8);
bool8 MetatileBehavior_IsWalkSouth(u8);
bool8 MetatileBehavior_IsWalkWest(u8);
bool8 MetatileBehavior_IsWalkEast(u8);
bool8 MetatileBehavior_IsNorthwardCurrent(u8);
bool8 MetatileBehavior_IsSouthwardCurrent(u8);
bool8 MetatileBehavior_IsWestwardCurrent(u8);
bool8 MetatileBehavior_IsEastwardCurrent(u8);
bool8 MetatileBehavior_IsSlideNorth(u8);
bool8 MetatileBehavior_IsSlideSouth(u8);
bool8 MetatileBehavior_IsSlideWest(u8);
bool8 MetatileBehavior_IsSlideEast(u8);
bool8 MetatileBehavior_IsCounter(u8);
bool8 MetatileBehavior_IsPlayerFacingTVScreen(u8, u8);
bool8 MetatileBehavior_IsPC(u8);
bool8 is_tile_x84(u8);
bool8 sub_80571C0(u8);
bool8 MetatileBehavior_IsSecretBaseCave(u8);
bool8 MetatileBehavior_IsSecretBaseTree(u8);
bool8 MetatileBehavior_IsSecretBaseShrub(u8);
bool8 MetatileBehavior_IsSecretBasePC(u8);
bool8 sub_805724C(u8);
bool8 unref_sub_8057260(u8);
bool8 sub_8057274(u8);
bool8 sub_8057288(u8);
bool8 sub_805729C(u8);
bool8 sub_80572B0(u8);
bool8 unref_sub_80572C4(u8);
bool8 sub_80572D8(u8);
bool8 sub_80572EC(u8);
bool8 sub_8057300(u8);
bool8 sub_8057314(u8);
bool8 sub_8057328(u8);
bool8 sub_805733C(u8);
bool8 sub_8057350(u8);
bool8 sub_8057364(u8);
bool8 sub_8057378(u8);
bool8 sub_805738C(u8);
bool8 MetatileBehavior_HasRipples(u8);
bool8 MetatileBehavior_IsPuddle(u8);
bool8 MetatileBehavior_IsTallGrass(u8);
bool8 MetatileBehavior_IsLongGrass(u8);
bool8 MetatileBehavior_IsBerryTreeSoil(u8);
bool8 MetatileBehavior_IsAshGrass(u8);
bool8 MetatileBehavior_IsUnusedFootprintMetatile(u8);
bool8 MetatileBehavior_IsBridge(u8);
u8 sub_8057450(u8);
bool8 MetatileBehavior_IsLandWildEncounter(u8);
bool8 MetatileBehavior_IsWaterWildEncounter(u8);
bool8 sub_80574C4(u8);
bool8 sub_80574D8(u8);
bool8 sub_80574EC(u8);
bool8 sub_805750C(u8);
bool8 MetatileBehavior_IsShallowFlowingWater(u8);
bool8 MetatileBehavior_IsThinIce(u8);
bool8 MetatileBehavior_IsCrackedIce(u8);
bool8 sub_8057568(u8);
bool8 unref_sub_8057584(u8);
bool8 sub_805759C(u8);
bool8 MetatileBehavior_IsEastBlocked(u8);
bool8 MetatileBehavior_IsWestBlocked(u8);
bool8 MetatileBehavior_IsNorthBlocked(u8);
bool8 MetatileBehavior_IsSouthBlocked(u8);
bool8 MetatileBehavior_IsShortGrass(u8);
bool8 MetatileBehavior_IsHotSprings(u8);
bool8 MetatileBehavior_IsWaterfall(u8);
bool8 MetatileBehavior_IsFortreeBridge(u8);
bool8 sub_80576A0(u8);
bool8 sub_80576B4(u8);
bool8 sub_80576C8(u8);
bool8 sub_80576DC(u8);
bool8 MetatileBehavior_IsPacifidlogLog(u8);
bool8 MetatileBehavior_IsTrickHousePuzzleDoor(u8);
bool8 MetatileBehavior_IsRegionMap(u8);
bool8 MetatileBehavior_IsClosedSootopolisGymDoor(u8);
bool8 MetatileBehavior_IsRoulette(u8);
bool8 MetatileBehavior_IsPokeblockFeeder(u8);
bool8 MetatileBehavior_0xBB(u8);
bool8 MetatileBehavior_0xBC(u8);
bool8 MetatileBehavior_IsLavaridgeB1FWarp(u8);
bool8 MetatileBehavior_IsLavaridge1FWarp(u8);
bool8 MetatileBehavior_IsAquaHideoutWarp(u8);
bool8 MetatileBehavior_IsSurfableFishableWater(u8);
bool8 MetatileBehavior_IsMtPyreHole(u8);
bool8 MetatileBehavior_IsCrackedFloorHole(u8);
bool8 MetatileBehavior_IsCrackedFloor(u8);
bool8 MetatileBehavior_IsMuddySlope(u8);
bool8 MetatileBehavior_IsBumpySlope(u8);
bool8 MetatileBehavior_IsIsolatedVerticalRail(u8);
bool8 MetatileBehavior_IsIsolatedHorizontalRail(u8);
bool8 MetatileBehavior_IsVerticalRail(u8);
bool8 MetatileBehavior_IsHorizontalRail(u8);
bool8 MetatileBehavior_IsSeaweed(u8);
bool8 MetatileBehavior_IsRunningDisallowed(u8);
bool8 MetatileBehavior_IsCuttableGrass(u8);
bool8 sub_805791C(u8);
bool8 MetatileBehavior_IsPictureBookShelf(u8);
bool8 MetatileBehavior_IsBookShelf(u8);
bool8 MetatileBehavior_IsPokeCenterBookShelf(u8);
bool8 MetatileBehavior_IsVase(u8);
bool8 MetatileBehavior_IsTrashCan(u8);
bool8 MetatileBehavior_IsShopShelf(u8);
bool8 MetatileBehavior_IsBlueprint(u8);
# 21 "src/field/field_effect.c" 2
# 1 "include/field_camera.h" 1



struct CameraSomething
{
    void (*callback)(struct CameraSomething *);
    u32 unk4;
    s32 unk8;
    s32 unkC;
    s32 unk10;
    s32 unk14;
};

extern struct Camera gCamera;

void move_tilemap_camera_to_upper_left_corner(void);
void sub_8057A58(void);
void sub_8057B14(u16 *a, u16 *b);
void DrawWholeMapView(void);
void CurrentMapDrawMetatileAt(int a, int b);
void DrawDoorMetatileAt(int x, int y, u16 *arr);
void ResetCameraUpdateInfo(void);
u32 InitCameraUpdateCallback(u8 a);
void CameraUpdate(void);
void SetCameraPanningCallback(void (*a)(void));
void SetCameraPanning(s16 a, s16 b);
void InstallCameraPanAheadCallback(void);
void UpdateCameraPanning(void);
# 22 "src/field/field_effect.c" 2
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
# 23 "src/field/field_effect.c" 2
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
# 24 "src/field/field_effect.c" 2
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
# 25 "src/field/field_effect.c" 2

# 1 "include/util.h" 1





extern const u8 gMiscBlank_Gfx[];
extern const u32 gBitTable[];

u8 CreateInvisibleSpriteWithCallback(void (*)(struct Sprite *));
void StoreWordInTwoHalfwords(u16 *, u32);
void LoadWordFromTwoHalfwords(u16 *, u32 *);
u16 CalcCRC16(u8 *data, int length);
void DoBgAffineSet(struct BgAffineDstData *dest, u32 texX, u32 texY, s16 scrX, s16 scrY, s16 sx, s16 sy, u16 alpha);
# 27 "src/field/field_effect.c" 2
# 1 "include/field_effect_helpers.h" 1



extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[];

void sub_812869C(struct MapObject *);
bool8 sub_81286C4(struct MapObject *);
void oamc_shadow(struct Sprite *);
void sub_8087638(struct Sprite *);
void sub_808788C(struct Sprite *);
void sub_8127334(struct Sprite *);
void sub_8127584(struct Sprite *);
void sub_81276B4(struct Sprite *);
void sub_8127A7C(struct Sprite *);
void sub_8127D84(struct Sprite *);
void sub_8127F7C(struct Sprite *);
void sub_81282E0(struct Sprite *);
void sub_8128410(struct Sprite *);
void sub_81285AC(struct Sprite *);
void sub_8128774(struct Sprite *);
void sub_81287C4(struct Sprite *);
void sub_8128800(struct Sprite *);
void unc_grass_normal(struct Sprite *);
void unc_grass_tall(struct Sprite *);
u8 sub_8126B54(void);
void objid_set_invisible(u8);
void sub_8126BC4(u8 unk_1B, u8 r6, s16 x, s16 y);
void sub_8127ED0(u8, u8);
void sub_8127F28(u8, u8, s16);
u8 sub_8128124(u8 id);
void ash(s16, s16, u16, s16);
void SetUpReflection(struct MapObject *mapObj, struct Sprite *sprite, u8 a);
u32 oe_exec_and_other_stuff(u8 fieldEffectId, struct MapObject *mapObject);
u8 sub_8126FF0(u8, u8, u8, s16, s16);
# 28 "src/field/field_effect.c" 2



__attribute__((section("ewram_data"))) s32 gFieldEffectArguments[8] = {0};

const u32 gSpriteImage_839DC14[] = INCBIN_U32("graphics/birch_speech/birch.4bpp");
const u16 gBirchPalette[16] = INCBIN_U16("graphics/birch_speech/birch.gbapal");
const u32 gSpriteImage_839E434[] = INCBIN_U32("graphics/misc/pokeball_glow.4bpp");
const u16 gFieldEffectObjectPalette4[16] = INCBIN_U16("graphics/field_effect_objects/palettes/04.gbapal");
const u32 gSpriteImage_839E474[] = INCBIN_U32("graphics/misc/pokecenter_monitor/0.4bpp");
const u32 gSpriteImage_839E534[] = INCBIN_U32("graphics/misc/pokecenter_monitor/1.4bpp");
const u32 gSpriteImage_839E5F4[] = INCBIN_U32("graphics/misc/big_hof_monitor.4bpp");
const u8 gSpriteImage_839E7F4[] = INCBIN_U8("graphics/misc/small_hof_monitor.4bpp");
const u16 gFieldEffectObjectPalette5[16] = INCBIN_U16("graphics/field_effect_objects/palettes/05.gbapal");


const u32 gFieldMoveStreaksTiles[] = INCBIN_U32("graphics/misc/field_move_streaks.4bpp");
const u16 gFieldMoveStreaksPalette[16] = INCBIN_U16("graphics/misc/field_move_streaks.gbapal");
const u16 gFieldMoveStreaksTilemap[] = INCBIN_U16("graphics/misc/field_move_streaks_map.bin");


const u32 gDarknessFieldMoveStreaksTiles[] = INCBIN_U32("graphics/misc/darkness_field_move_streaks.4bpp");
const u16 gDarknessFieldMoveStreaksPalette[16] = INCBIN_U16("graphics/misc/darkness_field_move_streaks.gbapal");
const u16 gDarknessFieldMoveStreaksTilemap[] = INCBIN_U16("graphics/misc/darkness_field_move_streaks_map.bin");

bool8 (*const gFieldEffectScriptFuncs[])(u8 **, u32 *) = {
    FieldEffectCmd_loadtiles,
    FieldEffectCmd_loadfadedpal,
    FieldEffectCmd_loadpal,
    FieldEffectCmd_callnative,
    FieldEffectCmd_end,
    FieldEffectCmd_loadgfx_callnative,
    FieldEffectCmd_loadtiles_callnative,
    FieldEffectCmd_loadfadedpal_callnative,
};

const struct OamData gOamData_839F0F4 = {.size = 3};
const struct OamData gOamData_839F0FC = {.size = 0};
const struct OamData gOamData_839F104 = {.size = 1};

const struct SpriteFrameImage gSpriteImageTable_839F10C[] = {
    {.data = (u8 *)gSpriteImage_839DC14, .size = sizeof gSpriteImage_839DC14}
};
const struct SpritePalette gUnknown_0839F114 = {.data = gBirchPalette, .tag = 0x1006};

const union AnimCmd gSpriteAnim_839F11C[] = {
    {.frame = {.imageValue = 0, .duration = 1}},
    {.type = -1}
};

const union AnimCmd *const gSpriteAnimTable_839F124[] = {
    gSpriteAnim_839F11C
};

const struct SpriteTemplate gSpriteTemplate_839F128 = {
    .tileTag = 0xffff,
    .paletteTag = 4102,
    .oam = &gOamData_839F0F4,
    .anims = (const union AnimCmd *const *)&gSpriteAnimTable_839F124,
    .images = gSpriteImageTable_839F10C,
    .affineAnims = (const union AffineAnimCmd *const *)&gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct SpritePalette gFieldEffectObjectPaletteInfo4 = {.data = gFieldEffectObjectPalette4, .tag = 0x1007};
const struct SpritePalette gFieldEffectObjectPaletteInfo5 = {.data = gFieldEffectObjectPalette5, .tag = 0x1010};
const struct OamData gOamData_839F150 = {
    .shape = 1,
    .size = 2
};

const struct SpriteFrameImage gSpriteImageTable_839F158[] = {
    {.data = (u8 *)gSpriteImage_839E434, .size = sizeof gSpriteImage_839E434}
};

const struct SpriteFrameImage gSpriteImageTable_839F160[] = {
    {.data = (u8 *)gSpriteImage_839E474, .size = sizeof gSpriteImage_839E474},
    {.data = (u8 *)gSpriteImage_839E534, .size = sizeof gSpriteImage_839E534}
};

const struct SpriteFrameImage gSpriteImageTable_839F170[] = {
    {.data = (u8 *)gSpriteImage_839E5F4, .size = sizeof gSpriteImage_839E5F4}
};

const struct SpriteFrameImage gSpriteImageTable_839F178[] = {
    {.data = gSpriteImage_839E7F4, .size = 0x200}
};

const struct Subsprite Unknown_39F180[] = {
    {.x = -12, .y = -8, .priority = 2, .tileOffset = 0, .shape = 1, .size = 0},
    {.x = 4, .y = -8, .priority = 2, .tileOffset = 2, .shape = 0, .size = 0},
    {.x = -12, .y = 0, .priority = 2, .tileOffset = 3, .shape = 1, .size = 0},
    {.x = 4, .y = 0, .priority = 2, .tileOffset = 5, .shape = 0, .size = 0}
};

const struct SubspriteTable gUnknown_0839F1A0 = {.subsprites = Unknown_39F180, .subspriteCount = (sizeof Unknown_39F180) / (sizeof(struct Subsprite))};

const struct Subsprite Unknown_39F1A8[] = {
    {.x = -32, .y = -8, .priority = 2, .tileOffset = 0, .shape = 1, .size = 1},
    {.x = 0, .y = -8, .priority = 2, .tileOffset = 4, .shape = 1, .size = 1},
    {.x = -32, .y = 0, .priority = 2, .tileOffset = 8, .shape = 1, .size = 1},
    {.x = 0, .y = 0, .priority = 2, .tileOffset = 12, .shape = 1, .size = 1}
};

const struct SubspriteTable gUnknown_0839F1C8 = {.subsprites = Unknown_39F1A8, .subspriteCount = (sizeof Unknown_39F1A8) / (sizeof(struct Subsprite))};

const union AnimCmd gSpriteAnim_839F1D0[] = {
    {.frame = {.imageValue = 0, .duration = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gSpriteAnim_839F1D8[] = {
    {.frame = {.imageValue = 0, .duration = 16}},
    {.frame = {.imageValue = 1, .duration = 16}},
    {.frame = {.imageValue = 0, .duration = 16}},
    {.frame = {.imageValue = 1, .duration = 16}},
    {.frame = {.imageValue = 0, .duration = 16}},
    {.frame = {.imageValue = 1, .duration = 16}},
    {.frame = {.imageValue = 0, .duration = 16}},
    {.frame = {.imageValue = 1, .duration = 16}},
    {.type = -1}
};

const union AnimCmd *const gSpriteAnimTable_839F1FC[] = {
    gSpriteAnim_839F1D0,
    gSpriteAnim_839F1D8
};

const union AnimCmd *const gSpriteAnimTable_839F204[] = {
    gSpriteAnim_839F1D0
};

const struct SpriteTemplate gSpriteTemplate_839F208 = {
    .tileTag = 0xffff,
    .paletteTag = 4103,
    .oam = &gOamData_839F0FC,
    .anims = gSpriteAnimTable_839F1FC,
    .images = gSpriteImageTable_839F158,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_PokeballGlow
};


const struct SpriteTemplate gSpriteTemplate_839F220 = {
    .tileTag = 0xffff,
    .paletteTag = 4100,
    .oam = &gOamData_839F104,
    .anims = gSpriteAnimTable_839F1FC,
    .images = gSpriteImageTable_839F160,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_PokecenterMonitor
};


const struct SpriteTemplate gSpriteTemplate_839F238 = {
    .tileTag = 0xffff,
    .paletteTag = 4112,
    .oam = &gOamData_839F104,
    .anims = gSpriteAnimTable_839F204,
    .images = gSpriteImageTable_839F170,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_HallOfFameMonitor
};


const struct SpriteTemplate gSpriteTemplate_839F250 = {
    .tileTag = 0xffff,
    .paletteTag = 4112,
    .oam = &gOamData_839F150,
    .anims = gSpriteAnimTable_839F204,
    .images = gSpriteImageTable_839F178,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_HallOfFameMonitor
};

void (*const gUnknown_0839F268[])(struct Task *) = {
    PokecenterHealEffect_0,
    PokecenterHealEffect_1,
    PokecenterHealEffect_2,
    PokecenterHealEffect_3
};

void (*const gUnknown_0839F278[])(struct Task *) = {
    HallOfFameRecordEffect_0,
    HallOfFameRecordEffect_1,
    HallOfFameRecordEffect_2,
    HallOfFameRecordEffect_3
};

void (*const gUnknown_0839F288[])(struct Sprite *) = {
    PokeballGlowEffect_0,
    PokeballGlowEffect_1,
    PokeballGlowEffect_2,
    PokeballGlowEffect_3,
    PokeballGlowEffect_4,
    PokeballGlowEffect_5,
    PokeballGlowEffect_6,
    PokeballGlowEffect_7
};

const struct Coords16 gUnknown_0839F2A8[] = {
    {.x = 0, .y = 0},
    {.x = 6, .y = 0},
    {.x = 0, .y = 4},
    {.x = 6, .y = 4},
    {.x = 0, .y = 8},
    {.x = 6, .y = 8}
};

const u8 gUnknown_0839F2C0[] = {16, 12, 8, 0};
const u8 gUnknown_0839F2C4[] = {16, 12, 8, 0};
const u8 gUnknown_0839F2C8[] = { 0, 0, 0, 0};

bool8 (*const gUnknown_0839F2CC[])(struct Task *) = {
    sub_80867AC,
    sub_8086854,
    sub_8086870,
    sub_80868E4,
    sub_808699C,
    sub_80869B8,
    sub_80869F8
};

bool8 (*const gUnknown_0839F2E8[])(struct Task *) = {
    sub_8086AA0,
    sub_8086AC0,
    sub_8086B30,
    sub_8086B54,
    sub_8086B64,
    sub_8086B88
};

bool8 (*const gUnknown_0839F300[])(struct Task *) = {
    sub_8086CF4,
    sub_8086D70,
    sub_8086DB0,
    sub_8086E10,
    sub_8086E50,
    sub_8086EB0,
    sub_8086ED4
};

bool8 (*const gUnknown_0839F31C[])(struct Task *, struct MapObject *) = {
    sub_8086FB0,
    waterfall_1_do_anim_probably,
    waterfall_2_wait_anim_finish_probably,
    sub_8087030,
    sub_8087058
};

bool8 (*const gUnknown_0839F330[])(struct Task *) = {
    sub_8087124,
    dive_2_unknown,
    dive_3_unknown
};

bool8 (*const gUnknown_0839F33C[])(struct Task *, struct MapObject *, struct Sprite *) = {
    sub_808722C,
    sub_8087264,
    sub_8087298,
    sub_80872E4,
    sub_80873D8,
    sub_80873F4
};

bool8 (*const gUnknown_0839F354[])(struct Task *, struct MapObject *, struct Sprite *) = {
    sub_80874CC,
    sub_80874FC,
    sub_8087548,
    sub_808759C
};

bool8 (*const gUnknown_0839F364[])(struct Task *, struct MapObject *, struct Sprite *) = {
    sub_80876C8,
    sub_80876F8,
    sub_8087774,
    sub_80877AC,
    sub_80877D4
};

void (*const gUnknown_0839F378[])(struct Task *) = {
    sub_80878F4,
    sub_8087914
};

const u8 gUnknown_0839F380[] = {1, 3, 4, 2, 1};

void (*const gUnknown_0839F388[])(struct Task *) = {
    sub_8087AA4,
    sub_8087AC8
};

void (*const gUnknown_0839F390[])(struct Task *) = {
    sub_8087BEC,
    sub_8087C14,
    sub_8087CA4,
    sub_8087D78
};

void (*const gUnknown_0839F3A0[])(struct Task *) = {
    sub_8087E4C,
    sub_8087ED8,
    sub_8087FDC
};

void (*const gUnknown_0839F3AC[])(struct Task *) = {
    sub_8088150,
    sub_80881C0,
    sub_8088228,
    sub_80882B4,
    sub_80882E4,
    sub_8088338,
    sub_8088380
};

void (*const gUnknown_0839F3C8[])(struct Task *) = {
    sub_80884AC,
    sub_80884E8,
    sub_8088554,
    sub_80885A8,
    sub_80885D8,
    sub_808860C,
    sub_808862C
};

void (*const gUnknown_0839F3E4[])(struct Task *) = {
    sub_8088984,
    sub_80889E4,
    sub_8088A30,
    sub_8088A78,
    sub_8088AF4
};

void (*const gUnknown_0839F3F8[])(struct Task *) = {
    sub_8088CA0,
    sub_8088CF8,
    sub_8088D3C,
    sub_8088D94,
    sub_8088DD8,
    sub_8088E2C,
    sub_8088EB4,
    sub_8088F10,
    sub_8088F30
};

const union AffineAnimCmd SpriteAffineAnim_839F41C[] = {
    {.frame = {.xScale = 8, .yScale = 8, .rotation = -30, .duration = 0}},
    {.frame = {.xScale = 28, .yScale = 28, .rotation = 0, .duration = 30}},
    {.type = 0x7FFF}
};

const union AffineAnimCmd SpriteAffineAnim_839F434[] = {
    {.frame = {.xScale = 256, .yScale = 256, .rotation = 64, .duration = 0}},
    {.frame = {.xScale = -10, .yScale = -10, .rotation = 0, .duration = 22}},
    {.type = 0x7FFF}
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_0839F44C[] = {
    SpriteAffineAnim_839F41C,
    SpriteAffineAnim_839F434
};

void (*const gUnknown_0839F454[])(struct Task *) = {
    sub_80892A0,
    sub_8089354,
    sub_80893C0,
    sub_8089414,
    sub_808948C,
    sub_80894C4,
    fishE
};

const s16 gUnknown_0839F470[] = {
    -2,
    -4,
    -5,
    -6,
    -7,
    -8,
    -8,
    -8,
    -7,
    -7,
    -6,
    -5,
    -3,
    -2,
    0,
    2,
    4,
    8
};

static u8 sActiveList[32];

extern u8 *gFieldEffectScriptPointers[];

u32 FieldEffectStart(u8 id)
{
    u8 *script;
    u32 val;

    FieldEffectActiveListAdd(id);

    script = gFieldEffectScriptPointers[id];

    while (gFieldEffectScriptFuncs[*script](&script, &val))
        ;

    return val;
}

bool8 FieldEffectCmd_loadtiles(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    return 1;
}

bool8 FieldEffectCmd_loadfadedpal(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadFadedPalette(script);
    return 1;
}

bool8 FieldEffectCmd_loadpal(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadPalette(script);
    return 1;
}

bool8 FieldEffectCmd_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_CallNative(script, val);
    return 1;
}

bool8 FieldEffectCmd_end(u8 **script, u32 *val)
{
    return 0;
}

bool8 FieldEffectCmd_loadgfx_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    FieldEffectScript_LoadFadedPalette(script);
    FieldEffectScript_CallNative(script, val);
    return 1;
}

bool8 FieldEffectCmd_loadtiles_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    FieldEffectScript_CallNative(script, val);
    return 1;
}

bool8 FieldEffectCmd_loadfadedpal_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadFadedPalette(script);
    FieldEffectScript_CallNative(script, val);
    return 1;
}

u32 FieldEffectScript_ReadWord(u8 **script)
{
    return (*script)[0]
         + ((*script)[1] << 8)
         + ((*script)[2] << 16)
         + ((*script)[3] << 24);
}

void FieldEffectScript_LoadTiles(u8 **script)
{
    struct SpriteSheet *sheet = (struct SpriteSheet *)FieldEffectScript_ReadWord(script);
    if (GetSpriteTileStartByTag(sheet->tag) == 0xFFFF)
        LoadSpriteSheet(sheet);
    (*script) += 4;
}

void FieldEffectScript_LoadFadedPalette(u8 **script)
{
    struct SpritePalette *palette = (struct SpritePalette *)FieldEffectScript_ReadWord(script);
    LoadSpritePalette(palette);
    sub_807D78C(IndexOfSpritePaletteTag(palette->tag));
    (*script) += 4;
}

void FieldEffectScript_LoadPalette(u8 **script)
{
    struct SpritePalette *palette = (struct SpritePalette *)FieldEffectScript_ReadWord(script);
    LoadSpritePalette(palette);
    (*script) += 4;
}

void FieldEffectScript_CallNative(u8 **script, u32 *val)
{
    u32 (*func)(void) = (u32 (*)(void))FieldEffectScript_ReadWord(script);
    *val = func();
    (*script) += 4;
}

void FieldEffectFreeGraphicsResources(struct Sprite *sprite)
{
    u16 sheetTileStart = sprite->sheetTileStart;
    u32 paletteNum = sprite->oam.paletteNum;
    DestroySprite(sprite);
    FieldEffectFreeTilesIfUnused(sheetTileStart);
    FieldEffectFreePaletteIfUnused(paletteNum);
}

void FieldEffectStop(struct Sprite *sprite, u8 id)
{
    FieldEffectFreeGraphicsResources(sprite);
    FieldEffectActiveListRemove(id);
}

void FieldEffectFreeTilesIfUnused(u16 tileStart)
{
    u8 i;
    u16 tag = GetSpriteTileTagByTileStart(tileStart);

    if (tag != 0xFFFF)
    {
        for (i = 0; i < 64; i++)
            if (gSprites[i].inUse && gSprites[i].usingSheet && tileStart == gSprites[i].sheetTileStart)
                return;
        FreeSpriteTilesByTag(tag);
    }
}

void FieldEffectFreePaletteIfUnused(u8 paletteNum)
{
    u8 i;
    u16 tag = GetSpritePaletteTagByPaletteNum(paletteNum);

    if (tag != 0xFFFF)
    {
        for (i = 0; i < 64; i++)
            if (gSprites[i].inUse && gSprites[i].oam.paletteNum == paletteNum)
                return;
        FreeSpritePaletteByTag(tag);
    }
}

void FieldEffectActiveListClear(void)
{
    u8 i;
    for (i = 0; i < (sizeof(sActiveList) / sizeof((sActiveList)[0])); i++)
        sActiveList[i] = 0xFF;
}

void FieldEffectActiveListAdd(u8 id)
{
    u8 i;
    for (i = 0; i < (sizeof(sActiveList) / sizeof((sActiveList)[0])); i++)
    {
        if (sActiveList[i] == 0xFF)
        {
            sActiveList[i] = id;
            return;
        }
    }
}

void FieldEffectActiveListRemove(u8 id)
{
    u8 i;
    for (i = 0; i < (sizeof(sActiveList) / sizeof((sActiveList)[0])); i++)
    {
        if (sActiveList[i] == id)
        {
            sActiveList[i] = 0xFF;
            return;
        }
    }
}

bool8 FieldEffectActiveListContains(u8 id)
{
    u8 i;
    for (i = 0; i < (sizeof(sActiveList) / sizeof((sActiveList)[0])); i++)
        if (sActiveList[i] == id)
            return 1;
    return 0;
}

u8 CreateTrainerSprite(u8 trainerSpriteID, s16 x, s16 y, u8 subpriority, u8 *buffer)
{
    struct SpriteTemplate spriteTemplate;
    LoadCompressedObjectPaletteOverrideBuffer(&gTrainerFrontPicPaletteTable[trainerSpriteID], buffer);
    LoadCompressedObjectPicOverrideBuffer(&gTrainerFrontPicTable[trainerSpriteID], buffer);
    spriteTemplate.tileTag = gTrainerFrontPicTable[trainerSpriteID].tag;
    spriteTemplate.paletteTag = gTrainerFrontPicPaletteTable[trainerSpriteID].tag;
    spriteTemplate.oam = &gOamData_839F0F4;
    spriteTemplate.anims = gDummySpriteAnimTable;
    spriteTemplate.images = ((void *)0);
    spriteTemplate.affineAnims = gDummySpriteAffineAnimTable;
    spriteTemplate.callback = SpriteCallbackDummy;
    return CreateSprite(&spriteTemplate, x, y, subpriority);
}

void LoadTrainerGfx_TrainerCard(u8 gender, u16 palOffset, u8 *dest)
{
    LZDecompressVram(gTrainerFrontPicTable[gender].data, dest);
    LoadCompressedPalette(gTrainerFrontPicPaletteTable[gender].data, palOffset, 0x20);
}

u8 CreateBirchSprite(s16 x, s16 y, u8 subpriority)
{
    LoadSpritePalette(&gUnknown_0839F114);
    return CreateSprite(&gSpriteTemplate_839F128, x, y, subpriority);
}

u8 CreateMonSprite_PicBox(u16 species, s16 x, s16 y, u8 subpriority)
{
    DecompressPicFromTable_2(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, gUnknown_081FAF4C[3], gUnknown_081FAF4C[3], species);
    LoadCompressedObjectPalette(&gMonPaletteTable[species]);
    GetMonSpriteTemplate_803C56C(species, 3);
    gUnknown_02024E8C.paletteTag = gMonPaletteTable[0].tag;
    sub_807DE38(IndexOfSpritePaletteTag(gMonPaletteTable[0].tag) + 0x10);
    return CreateSprite(&gUnknown_02024E8C, x, y, subpriority);
}

u8 CreateMonSprite_FieldMove(u16 species, u32 d, u32 g, s16 x, s16 y, u8 subpriority)
{
    const struct CompressedSpritePalette *spritePalette;

    HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, (u32)gUnknown_081FAF4C[3] , gUnknown_081FAF4C[3], species, g);
    spritePalette = GetMonSpritePalStructFromOtIdPersonality(species, d, g);
    LoadCompressedObjectPalette(spritePalette);
    GetMonSpriteTemplate_803C56C(species, 3);
    gUnknown_02024E8C.paletteTag = spritePalette->tag;
    sub_807DE38(IndexOfSpritePaletteTag(spritePalette->tag) + 0x10);
    return CreateSprite(&gUnknown_02024E8C, x, y, subpriority);
}

void FreeResourcesAndDestroySprite(struct Sprite *sprite)
{
    sub_807DE68();
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(sprite->oam.paletteNum));
    if (sprite->oam.affineMode != 0)
    {
        FreeOamMatrix(sprite->oam.matrixNum);
    }
    DestroySprite(sprite);
}
# 713 "src/field/field_effect.c"
__attribute__((naked))
void MultiplyInvertedPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    asm(".syntax unified\n"
    "\tpush {r4-r7,lr}\n"
    "\tmov r7, r9\n"
    "\tmov r6, r8\n"
    "\tpush {r6,r7}\n"
    "\tlsls r0, 16\n"
    "\tlsls r1, 24\n"
    "\tlsrs r1, 24\n"
    "\tlsls r2, 24\n"
    "\tlsrs r2, 24\n"
    "\tlsls r3, 24\n"
    "\tlsrs r3, 24\n"
    "\tldr r4, _08085D00 @ =gPlttBufferUnfaded\n"
    "\tlsrs r0, 15\n"
    "\tadds r4, r0, r4\n"
    "\tldrh r4, [r4]\n"
    "\tmovs r5, 0x1F\n"
    "\tmov r9, r5\n"
    "\tmov r8, r4\n"
    "\tmov r6, r8\n"
    "\tands r6, r5\n"
    "\tmov r8, r6\n"
    "\tmovs r6, 0xF8\n"
    "\tlsls r6, 2\n"
    "\tands r6, r4\n"
    "\tlsrs r6, 5\n"
    "\tmovs r5, 0xF8\n"
    "\tlsls r5, 7\n"
    "\tands r4, r5\n"
    "\tlsrs r4, 10\n"
    "\tmov r7, r9\n"
    "\tmov r5, r8\n"
    "\tsubs r7, r5\n"
    "\tmov r12, r7\n"
    "\tmov r7, r12\n"
    "\tmuls r7, r1\n"
    "\tadds r1, r7, 0\n"
    "\tasrs r1, 4\n"
    "\tadd r8, r1\n"
    "\tmov r5, r9\n"
    "\tsubs r1, r5, r6\n"
    "\tmuls r1, r2\n"
    "\tasrs r1, 4\n"
    "\tadds r6, r1\n"
    "\tsubs r5, r4\n"
    "\tmov r9, r5\n"
    "\tmov r1, r9\n"
    "\tmuls r1, r3\n"
    "\tasrs r1, 4\n"
    "\tadds r4, r1\n"
    "\tmov r7, r8\n"
    "\tlsls r7, 16\n"
    "\tlsls r6, 21\n"
    "\torrs r6, r7\n"
    "\tlsls r4, 26\n"
    "\torrs r4, r6\n"
    "\tlsrs r4, 16\n"
    "\tldr r1, _08085D04 @ =gPlttBufferFaded\n"
    "\tadds r0, r1\n"
    "\tstrh r4, [r0]\n"
    "\tpop {r3,r4}\n"
    "\tmov r8, r3\n"
    "\tmov r9, r4\n"
    "\tpop {r4-r7}\n"
    "\tpop {r0}\n"
    "\tbx r0\n"
    "\t.align 2, 0\n"
    "_08085D00: .4byte gPlttBufferUnfaded\n"
    "_08085D04: .4byte gPlttBufferFaded\n"
    ".syntax divided");
}

__attribute__((naked))
void MultiplyPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    asm(".syntax unified\n"
    "\tpush {r4-r6,lr}\n"
    "\tmov r6, r8\n"
    "\tpush {r6}\n"
    "\tlsls r0, 16\n"
    "\tlsls r1, 24\n"
    "\tlsrs r1, 24\n"
    "\tlsls r2, 24\n"
    "\tlsrs r2, 24\n"
    "\tlsls r3, 24\n"
    "\tlsrs r3, 24\n"
    "\tldr r4, _08085D78 @ =gPlttBufferUnfaded\n"
    "\tlsrs r0, 15\n"
    "\tadds r4, r0, r4\n"
    "\tldrh r4, [r4]\n"
    "\tmovs r5, 0x1F\n"
    "\tmov r8, r5\n"
    "\tmov r6, r8\n"
    "\tands r6, r4\n"
    "\tmov r8, r6\n"
    "\tmovs r5, 0xF8\n"
    "\tlsls r5, 2\n"
    "\tands r5, r4\n"
    "\tlsrs r5, 5\n"
    "\tmovs r6, 0xF8\n"
    "\tlsls r6, 7\n"
    "\tands r4, r6\n"
    "\tlsrs r4, 10\n"
    "\tmov r6, r8\n"
    "\tmuls r6, r1\n"
    "\tadds r1, r6, 0\n"
    "\tasrs r1, 4\n"
    "\tmov r6, r8\n"
    "\tsubs r6, r1\n"
    "\tadds r1, r5, 0\n"
    "\tmuls r1, r2\n"
    "\tasrs r1, 4\n"
    "\tsubs r5, r1\n"
    "\tadds r1, r4, 0\n"
    "\tmuls r1, r3\n"
    "\tasrs r1, 4\n"
    "\tsubs r4, r1\n"
    "\tlsls r6, 16\n"
    "\tlsls r5, 21\n"
    "\torrs r5, r6\n"
    "\tlsls r4, 26\n"
    "\torrs r4, r5\n"
    "\tlsrs r4, 16\n"
    "\tldr r1, _08085D7C @ =gPlttBufferFaded\n"
    "\tadds r0, r1\n"
    "\tstrh r4, [r0]\n"
    "\tpop {r3}\n"
    "\tmov r8, r3\n"
    "\tpop {r4-r6}\n"
    "\tpop {r0}\n"
    "\tbx r0\n"
    "\t.align 2, 0\n"
    "_08085D78: .4byte gPlttBufferUnfaded\n"
    "_08085D7C: .4byte gPlttBufferFaded\n"
    ".syntax divided");
}


void Task_PokecenterHeal(u8 taskId);
u8 CreatePokeballGlowSprite(s16, s16, s16, u16);
u8 PokecenterHealEffectHelper(s16, s16);

bool8 FldEff_PokecenterHeal(void)
{
    u8 nPokemon;
    struct Task *task;

    nPokemon = CalculatePlayerPartyCount();
    task = &gTasks[CreateTask(Task_PokecenterHeal, 0xff)];
    task->data[1] = nPokemon;
    task->data[2] = 0x5d;
    task->data[3] = 0x24;
    task->data[4] = 0x7c;
    task->data[5] = 0x18;
    return 0;
}

void Task_PokecenterHeal(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    gUnknown_0839F268[task->data[0]](task);
}

void PokecenterHealEffect_0(struct Task *task)
{
    task->data[0]++;
    task->data[6] = CreatePokeballGlowSprite(task->data[1], task->data[2], task->data[3], 1);
    task->data[7] = PokecenterHealEffectHelper(task->data[4], task->data[5]);
}

void PokecenterHealEffect_1(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 1)
    {
        gSprites[task->data[7]].data[0]++;
        task->data[0]++;
    }
}

void PokecenterHealEffect_2(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 4)
    {
        task->data[0]++;
    }
}

void PokecenterHealEffect_3(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 6)
    {
        DestroySprite(&gSprites[task->data[6]]);
        FieldEffectActiveListRemove(FLDEFF_POKECENTER_HEAL);
        DestroyTask(FindTaskIdByFunc(Task_PokecenterHeal));
    }
}

void Task_HallOfFameRecord(u8 taskId);
void HallOfFameRecordEffectHelper(s16, s16, s16, u8);

bool8 FldEff_HallOfFameRecord(void)
{
    u8 nPokemon;
    struct Task *task;

    nPokemon = CalculatePlayerPartyCount();
    task = &gTasks[CreateTask(Task_HallOfFameRecord, 0xff)];
    task->data[1] = nPokemon;
    task->data[2] = 0x75;
    task->data[3] = 0x34;
    return 0;
}

void Task_HallOfFameRecord(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    gUnknown_0839F278[task->data[0]](task);
}

void HallOfFameRecordEffect_0(struct Task *task)
{
    u8 taskId;
    task->data[0]++;
    task->data[6] = CreatePokeballGlowSprite(task->data[1], task->data[2], task->data[3], 0);
    taskId = FindTaskIdByFunc(Task_HallOfFameRecord);
    HallOfFameRecordEffectHelper(taskId, 0x78, 0x18, 0);
    HallOfFameRecordEffectHelper(taskId, 0x28, 0x08, 1);
    HallOfFameRecordEffectHelper(taskId, 0x48, 0x08, 1);
    HallOfFameRecordEffectHelper(taskId, 0xa8, 0x08, 1);
    HallOfFameRecordEffectHelper(taskId, 0xc8, 0x08, 1);
}

void HallOfFameRecordEffect_1(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 1)
    {
        task->data[15]++;
        task->data[0]++;
    }
}

void HallOfFameRecordEffect_2(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 4)
    {
        task->data[0]++;
    }
}

void HallOfFameRecordEffect_3(struct Task *task)
{
    if (gSprites[task->data[6]].data[0] > 6)
    {
        DestroySprite(&gSprites[task->data[6]]);
        FieldEffectActiveListRemove(FLDEFF_HALL_OF_FAME_RECORD);
        DestroyTask(FindTaskIdByFunc(Task_HallOfFameRecord));
    }
}

void SpriteCB_PokeballGlowEffect(struct Sprite *);

u8 CreatePokeballGlowSprite(s16 data6, s16 x, s16 y, u16 data5)
{
    u8 spriteId;
    struct Sprite *sprite;
    spriteId = CreateInvisibleSprite(SpriteCB_PokeballGlowEffect);
    sprite = &gSprites[spriteId];
    sprite->pos2.x = x;
    sprite->pos2.y = y;
    sprite->data[5] = data5;
    sprite->data[6] = data6;
    sprite->data[7] = spriteId;
    return spriteId;
}

void SpriteCB_PokeballGlowEffect(struct Sprite *sprite)
{
    gUnknown_0839F288[sprite->data[0]](sprite);
}

void PokeballGlowEffect_0(struct Sprite *sprite)
{
    u8 endSpriteId;
    if (sprite->data[1] == 0 || (--sprite->data[1]) == 0)
    {
        sprite->data[1] = 25;
        endSpriteId = CreateSpriteAtEnd(&gSpriteTemplate_839F208, gUnknown_0839F2A8[sprite->data[2]].x + sprite->pos2.x, gUnknown_0839F2A8[sprite->data[2]].y + sprite->pos2.y, 0);
        gSprites[endSpriteId].oam.priority = 2;
        gSprites[endSpriteId].data[0] = sprite->data[7];
        sprite->data[2]++;
        sprite->data[6]--;
        PlaySE(SE_BOWA);
    }
    if (sprite->data[6] == 0)
    {
        sprite->data[1] = 32;
        sprite->data[0]++;
    }
}

void PokeballGlowEffect_1(struct Sprite *sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[0]++;
        sprite->data[1] = 8;
        sprite->data[2] = 0;
        sprite->data[3] = 0;
        if (sprite->data[5])
        {
            PlayFanfare(BGM_ME_ASA);
        }
    }
}

void PokeballGlowEffect_2(struct Sprite *sprite)
{
    u8 phase;
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[1] = 8;
        sprite->data[2]++;
        sprite->data[2] &= 3;
        if (sprite->data[2] == 0)
        {
            sprite->data[3]++;
        }
    }
    phase = (sprite->data[2] + 3) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x108, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    phase = (sprite->data[2] + 2) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x106, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    phase = (sprite->data[2] + 1) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x102, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    phase = sprite->data[2];
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x105, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x103, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    if (sprite->data[3] > 2)
    {
        sprite->data[0]++;
        sprite->data[1] = 8;
        sprite->data[2] = 0;
    }
}

void PokeballGlowEffect_3(struct Sprite *sprite)
{
    u8 phase;
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[1] = 8;
        sprite->data[2]++;
        sprite->data[2] &= 3;
        if (sprite->data[2] == 3)
        {
            sprite->data[0]++;
            sprite->data[1] = 30;
        }
    }
    phase = sprite->data[2];
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x108, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x106, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x102, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x105, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x103, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
}

void PokeballGlowEffect_4(struct Sprite *sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->data[0]++;
    }
}

void PokeballGlowEffect_5(struct Sprite *sprite)
{
    sprite->data[0]++;
}

void PokeballGlowEffect_6(struct Sprite *sprite)
{
    if (sprite->data[5] == 0 || IsFanfareTaskInactive())
    {
        sprite->data[0]++;
    }
}

void PokeballGlowEffect_7(struct Sprite *sprite)
{
}

void SpriteCB_PokeballGlow(struct Sprite *sprite)
{
    if (gSprites[sprite->data[0]].data[0] > 4)
    {
        FieldEffectFreeGraphicsResources(sprite);
    }
}

u8 PokecenterHealEffectHelper(s16 x, s16 y)
{
    u8 spriteIdAtEnd;
    struct Sprite *sprite;
    spriteIdAtEnd = CreateSpriteAtEnd(&gSpriteTemplate_839F220, x, y, 0);
    sprite = &gSprites[spriteIdAtEnd];
    sprite->oam.priority = 2;
    sprite->invisible = 1;
    SetSubspriteTables(sprite, &gUnknown_0839F1A0);
    return spriteIdAtEnd;
}

void SpriteCB_PokecenterMonitor(struct Sprite *sprite)
{
    if (sprite->data[0] != 0)
    {
        sprite->data[0] = 0;
        sprite->invisible = 0;
        StartSpriteAnim(sprite, 1);
    }
    if (sprite->animEnded)
    {
        FieldEffectFreeGraphicsResources(sprite);
    }
}

void HallOfFameRecordEffectHelper(s16 a0, s16 a1, s16 a2, u8 a3)
{
    u8 spriteIdAtEnd;
    if (!a3)
    {
        spriteIdAtEnd = CreateSpriteAtEnd(&gSpriteTemplate_839F238, a1, a2, 0);
        SetSubspriteTables(&gSprites[spriteIdAtEnd], &gUnknown_0839F1C8);
    } else
    {
        spriteIdAtEnd = CreateSpriteAtEnd(&gSpriteTemplate_839F250, a1, a2, 0);
    }
    gSprites[spriteIdAtEnd].invisible = 1;
    gSprites[spriteIdAtEnd].data[0] = a0;
}

void SpriteCB_HallOfFameMonitor(struct Sprite *sprite)
{
    if (gTasks[sprite->data[0]].data[15])
    {
        if (sprite->data[1] == 0 || (--sprite->data[1]) == 0)
        {
            sprite->data[1] = 16;
            sprite->invisible ^= 1;
        }
        sprite->data[2]++;
    }
    if (sprite->data[2] > 127)
    {
        FieldEffectFreeGraphicsResources(sprite);
    }
}

void mapldr_080842E8(void);
void mapldr_08084390(void);
void task00_8084310(u8);
void c3_080843F8(u8);

void sub_80865BC(void)
{
    SetMainCallback2(c2_exit_to_overworld_2_switch);
    gFieldCallback = mapldr_080842E8;
}

void mapldr_080842E8(void)
{
    pal_fill_black();
    CreateTask(task00_8084310, 0);
    ScriptContext2_Enable();
    FreezeMapObjects();
    gFieldCallback = ((void *)0);
}

void task00_8084310(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    if (!task->data[0])
    {
        if (!sub_807D770())
        {
            return;
        }
        gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
        if ((int)gFieldEffectArguments[0] > 5)
        {
            gFieldEffectArguments[0] = 0;
        }
        FieldEffectStart(FLDEFF_USE_FLY);
        task->data[0]++;
    }
    if (!FieldEffectActiveListContains(FLDEFF_USE_FLY))
    {
        Overworld_ResetStateAfterFly();
        warp_in();
        SetMainCallback2(CB2_LoadMap);
        gFieldCallback = mapldr_08084390;
        DestroyTask(taskId);
    }
}

void mapldr_08084390(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_black();
    CreateTask(c3_080843F8, 0);
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_13 = 1;
    if (gPlayerAvatar.flags & 0x08)
    {
        FieldObjectTurn(&gMapObjects[gPlayerAvatar.mapObjectId], DIR_WEST);
    }
    ScriptContext2_Enable();
    FreezeMapObjects();
    gFieldCallback = ((void *)0);
}

void c3_080843F8(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    if (task->data[0] == 0)
    {
        if (gPaletteFade.active)
        {
            return;
        }
        FieldEffectStart(FLDEFF_FLY_IN);
        task->data[0]++;
    }
    if (!FieldEffectActiveListContains(FLDEFF_FLY_IN))
    {
        ScriptContext2_Disable();
        UnfreezeMapObjects();
        DestroyTask(taskId);
    }
}

extern void pal_fill_for_map_transition(void);
void sub_8086774(u8);
extern void CameraObjectReset2(void);
extern void CameraObjectReset1(void);

void sub_8086748(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    FreezeMapObjects();
    CreateTask(sub_8086774, 0);
    gFieldCallback = ((void *)0);
}

void sub_8086774(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (gUnknown_0839F2CC[task->data[0]](task));
}

bool8 sub_80867AC(struct Task *task)
{
    struct MapObject *playerObject;
    struct Sprite *playerSprite;
    playerObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    playerSprite = &gSprites[gPlayerAvatar.spriteId];
    CameraObjectReset2();
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_13 = 1;
    gPlayerAvatar.preventStep = 1;
    FieldObjectSetSpecialAnim(playerObject, GetFaceDirectionAnimId(player_get_direction_lower_nybble()));
    task->data[4] = playerSprite->subspriteMode;
    playerObject->mapobj_bit_26 = 1;
    playerSprite->oam.priority = 1;
    playerSprite->subspriteMode = 2;
    task->data[0]++;
    return 1;
}

bool8 sub_8086854(struct Task *task)
{
    if (sub_807D770())
    {
        task->data[0]++;
    }
    return 0;
}

bool8 sub_8086870(struct Task *task)
{
    struct Sprite *sprite;
    s16 centerToCornerVecY;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
    sprite->pos2.y = -(sprite->pos1.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY);
    task->data[1] = 1;
    task->data[2] = 0;
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_13 = 0;
    PlaySE(SE_RU_HYUU);
    task->data[0]++;
    return 0;
}

bool8 sub_80868E4(struct Task *task)
{
    struct MapObject *mapObject;
    struct Sprite *sprite;

    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.y += task->data[1];
    if (task->data[1] < 8)
    {
        task->data[2] += task->data[1];
        if (task->data[2] & 0xf)
        {
            task->data[1] <<= 1;
        }
    }
    if (task->data[3] == 0 && sprite->pos2.y >= -16)
    {
        task->data[3]++;
        mapObject->mapobj_bit_26 = 0;
        sprite->subspriteMode = task->data[4];
        mapObject->mapobj_bit_2 = 1;
    }
    if (sprite->pos2.y >= 0)
    {
        PlaySE(SE_W070);
        mapObject->mapobj_bit_3 = 1;
        mapObject->mapobj_bit_5 = 1;
        sprite->pos2.y = 0;
        task->data[0]++;
    }
    return 0;
}

bool8 sub_808699C(struct Task *task)
{
    task->data[0]++;
    task->data[1] = 4;
    task->data[2] = 0;
    SetCameraPanningCallback(((void *)0));
    return 1;
}

bool8 sub_80869B8(struct Task *task)
{
    SetCameraPanning(0, task->data[1]);
    task->data[1] = -task->data[1];
    task->data[2]++;
    if ((task->data[2] & 3) == 0)
    {
        task->data[1] >>= 1;
    }
    if (task->data[1] == 0)
    {
        task->data[0]++;
    }
    return 0;
}

bool8 sub_80869F8(struct Task *task)
{
    gPlayerAvatar.preventStep = 0;
    ScriptContext2_Disable();
    CameraObjectReset1();
    UnfreezeMapObjects();
    InstallCameraPanAheadCallback();
    DestroyTask(FindTaskIdByFunc(sub_8086774));
    return 0;
}

void sub_8086A68(u8);
extern void sub_80B4824(u8);
extern void sub_8053FF8(void);
extern void fade_8080918(void);

void sub_8086B98(struct Task *);
void sub_8086BE4(struct Task *);
void sub_8086C30(void);
void sub_8086C40(void);
bool8 sub_8054034(void);
void sub_8086C94(void);
void sub_80B483C(void);
void sub_8086CBC(u8);

void sub_8086A2C(u8 a0, u8 priority)
{
    u8 taskId;
    taskId = CreateTask(sub_8086A68, priority);
    gTasks[taskId].data[1] = 0;
    if (a0 == 0x6a)
    {
        gTasks[taskId].data[1] = 1;
    }
}

void sub_8086A68(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (gUnknown_0839F2E8[task->data[0]](task));
}

bool8 sub_8086AA0(struct Task *task)
{
    FreezeMapObjects();
    CameraObjectReset2();
    sub_80B4824(task->data[1]);
    task->data[0]++;
    return 0;
}

bool8 sub_8086AC0(struct Task *task)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject) || FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        FieldObjectSetSpecialAnim(mapObject, GetFaceDirectionAnimId(player_get_direction_lower_nybble()));
        task->data[0]++;
        task->data[2] = 0;
        task->data[3] = 0;
        if ((u8)task->data[1] == 0)
        {
            task->data[0] = 4;
        }
        PlaySE(SE_ESUKA);
    }
    return 0;
}

bool8 sub_8086B30(struct Task *task)
{
    sub_8086B98(task);
    if (task->data[2] > 3)
    {
        sub_8086C30();
        task->data[0]++;
    }
    return 0;
}

bool8 sub_8086B54(struct Task *task)
{
    sub_8086B98(task);
    sub_8086C40();
    return 0;
}

bool8 sub_8086B64(struct Task *task)
{
    sub_8086BE4(task);
    if (task->data[2] > 3)
    {
        sub_8086C30();
        task->data[0]++;
    }
    return 0;
}

bool8 sub_8086B88(struct Task *task)
{
    sub_8086BE4(task);
    sub_8086C40();
    return 0;
}

void sub_8086B98(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x84, task->data[2]);
    sprite->pos2.y = Sin(0x94, task->data[2]);
    task->data[3]++;
    if (task->data[3] & 1)
    {
        task->data[2]++;
    }
}

void sub_8086BE4(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x7c, task->data[2]);
    sprite->pos2.y = Sin(0x76, task->data[2]);
    task->data[3]++;
    if (task->data[3] & 1)
    {
        task->data[2]++;
    }
}

void sub_8086C30(void)
{
    sub_8053FF8();
    fade_8080918();
}

void sub_8086C40(void)
{
    if (!gPaletteFade.active && sub_8054034() == 1)
    {
        sub_80B483C();
        warp_in();
        gFieldCallback = sub_8086C94;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(sub_8086A68));
    }
}

void sub_8086C94(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    CreateTask(sub_8086CBC, 0);
    gFieldCallback = ((void *)0);
}

void sub_8086CBC(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (gUnknown_0839F300[task->data[0]](task));
}

bool8 sub_8086CF4(struct Task *task)
{
    struct MapObject *mapObject;
    s16 x;
    s16 y;
    u8 behavior;
    CameraObjectReset2();
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    FieldObjectSetSpecialAnim(mapObject, GetFaceDirectionAnimId(DIR_EAST));
    PlayerGetDestCoords(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);
    task->data[0]++;
    task->data[1] = 16;
    if (behavior == 0x6b)
    {
        behavior = 1;
        task->data[0] = 3;
    } else
    {
        behavior = 0;
    }
    sub_80B4824(behavior);
    return 1;
}

bool8 sub_8086D70(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x84, task->data[1]);
    sprite->pos2.y = Sin(0x94, task->data[1]);
    task->data[0]++;
    return 0;
}

bool8 sub_8086DB0(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x84, task->data[1]);
    sprite->pos2.y = Sin(0x94, task->data[1]);
    task->data[2]++;
    if (task->data[2] & 1)
    {
        task->data[1]--;
    }
    if (task->data[1] == 0)
    {
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        task->data[0] = 5;
    }
    return 0;
}

bool8 sub_8086E10(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x7c, task->data[1]);
    sprite->pos2.y = Sin(0x76, task->data[1]);
    task->data[0]++;
    return 0;
}

bool8 sub_8086E50(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x7c, task->data[1]);
    sprite->pos2.y = Sin(0x76, task->data[1]);
    task->data[2]++;
    if (task->data[2] & 1)
    {
        task->data[1]--;
    }
    if (task->data[1] == 0)
    {
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        task->data[0]++;
    }
    return 0;
}

extern bool8 sub_80B4850(void);

bool8 sub_8086EB0(struct Task *task)
{
    if (sub_80B4850())
    {
        return 0;
    }
    sub_80B483C();
    task->data[0]++;
    return 1;
}

bool8 sub_8086ED4(struct Task *task)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        CameraObjectReset1();
        ScriptContext2_Disable();
        FieldObjectSetSpecialAnim(mapObject, GetGoSpeed0AnimId(DIR_EAST));
        DestroyTask(FindTaskIdByFunc(sub_8086CBC));
    }
    return 0;
}

void sub_8086F64(u8);

bool8 FldEff_UseWaterfall(void)
{
    u8 taskId;
    taskId = CreateTask(sub_8086F64, 0xff);
    gTasks[taskId].data[1] = gFieldEffectArguments[0];
    sub_8086F64(taskId);
    return 0;
}

void sub_8086F64(u8 taskId)
{
    while (gUnknown_0839F31C[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId]));
}

bool8 sub_8086FB0(struct Task *task, struct MapObject *mapObject)
{
    ScriptContext2_Enable();
    gPlayerAvatar.preventStep = 1;
    task->data[0]++;
    return 0;
}

bool8 waterfall_1_do_anim_probably(struct Task *task, struct MapObject *mapObject)
{
    ScriptContext2_Enable();
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject))
    {
        FieldObjectClearAnimIfSpecialAnimFinished(mapObject);
        gFieldEffectArguments[0] = task->data[1];
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        task->data[0]++;
    }
    return 0;
}

bool8 waterfall_2_wait_anim_finish_probably(struct Task *task, struct MapObject *mapObject)
{
    if (FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        return 0;
    }
    task->data[0]++;
    return 1;
}

bool8 sub_8087030(struct Task *task, struct MapObject *mapObject)
{
    FieldObjectSetSpecialAnim(mapObject, GetSimpleGoAnimId(DIR_NORTH));
    task->data[0]++;
    return 0;
}

bool8 sub_8087058(struct Task *task, struct MapObject *mapObject)
{
    if (!FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        return 0;
    }
    if (MetatileBehavior_IsWaterfall(mapObject->mapobj_unk_1E))
    {
        task->data[0] = 3;
        return 1;
    }
    ScriptContext2_Disable();
    gPlayerAvatar.preventStep = 0;
    DestroyTask(FindTaskIdByFunc(sub_8086F64));
    FieldEffectActiveListRemove(FLDEFF_USE_WATERFALL);
    return 0;
}

void Task_Dive(u8);
extern int dive_warp(struct MapPosition *, u16);

bool8 FldEff_UseDive(void)
{
    u8 taskId;
    taskId = CreateTask(Task_Dive, 0xff);
    gTasks[taskId].data[15] = gFieldEffectArguments[0];
    gTasks[taskId].data[14] = gFieldEffectArguments[1];
    Task_Dive(taskId);
    return 0;
}

void Task_Dive(u8 taskId)
{
    while (gUnknown_0839F330[gTasks[taskId].data[0]](&gTasks[taskId]));
}

bool8 sub_8087124(struct Task *task)
{
    gPlayerAvatar.preventStep = 1;
    task->data[0]++;
    return 0;
}

bool8 dive_2_unknown(struct Task *task)
{
    ScriptContext2_Enable();
    gFieldEffectArguments[0] = task->data[15];
    FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    task->data[0]++;
    return 0;
}

bool8 dive_3_unknown(struct Task *task)
{
    struct MapPosition mapPosition;
    PlayerGetDestCoords(&mapPosition.x, &mapPosition.y);
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        dive_warp(&mapPosition, gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E);
        DestroyTask(FindTaskIdByFunc(Task_Dive));
        FieldEffectActiveListRemove(FLDEFF_USE_DIVE);
    }
    return 0;
}

void sub_80871D0(u8);
void mapldr_080851BC(void);

void sub_80871B8(u8 priority)
{
    CreateTask(sub_80871D0, priority);
}

void sub_80871D0(u8 taskId)
{
    while (gUnknown_0839F33C[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId], &gSprites[gPlayerAvatar.spriteId]));
}

bool8 sub_808722C(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    FreezeMapObjects();
    CameraObjectReset2();
    SetCameraPanningCallback(((void *)0));
    gPlayerAvatar.preventStep = 1;
    mapObject->mapobj_bit_26 = 1;
    task->data[1] = 1;
    task->data[0]++;
    return 1;
}

bool8 sub_8087264(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    SetCameraPanning(0, task->data[1]);
    task->data[1] = -task->data[1];
    task->data[2]++;
    if (task->data[2] > 7)
    {
        task->data[2] = 0;
        task->data[0]++;
    }
    return 0;
}

bool8 sub_8087298(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->pos2.y = 0;
    task->data[3] = 1;
    gFieldEffectArguments[0] = mapObject->coords2.x;
    gFieldEffectArguments[1] = mapObject->coords2.y;
    gFieldEffectArguments[2] = sprite->subpriority - 1;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_LAVARIDGE_GYM_WARP);
    PlaySE(SE_W153);
    task->data[0]++;
    return 1;
}

bool8 sub_80872E4(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    s16 centerToCornerVecY;
    SetCameraPanning(0, task->data[1]);
    if (task->data[1] = -task->data[1], ++task->data[2] <= 17)
    {
        if (!(task->data[2] & 1) && (task->data[1] <= 3))
        {
            task->data[1] <<= 1;
        }
    } else if (!(task->data[2] & 4) && (task->data[1] > 0))
    {
        task->data[1] >>= 1;
    }
    if (task->data[2] > 6)
    {
        centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
        if (sprite->pos2.y > -(sprite->pos1.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY))
        {
            sprite->pos2.y -= task->data[3];
            if (task->data[3] <= 7)
            {
                task->data[3]++;
            }
        } else
        {
            task->data[4] = 1;
        }
    }
    if (task->data[5] == 0 && sprite->pos2.y < -0x10)
    {
        task->data[5]++;
        mapObject->mapobj_bit_26 = 1;
        sprite->oam.priority = 1;
        sprite->subspriteMode = 2;
    }
    if (task->data[1] == 0 && task->data[4] != 0)
    {
        task->data[0]++;
    }
    return 0;
}

bool8 sub_80873D8(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8053FF8();
    fade_8080918();
    task->data[0]++;
    return 0;
}

bool8 sub_80873F4(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    if (!gPaletteFade.active && sub_8054034() == 1)
    {
        warp_in();
        gFieldCallback = mapldr_080851BC;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(sub_80871D0));
    }
    return 0;
}

void sub_8087470(u8);

void mapldr_080851BC(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    gFieldCallback = ((void *)0);
    CreateTask(sub_8087470, 0);
}

void sub_8087470(u8 taskId)
{
    while (gUnknown_0839F354[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId], &gSprites[gPlayerAvatar.spriteId]));
}

bool8 sub_80874CC(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    CameraObjectReset2();
    FreezeMapObjects();
    gPlayerAvatar.preventStep = 1;
    mapObject->mapobj_bit_13 = 1;
    task->data[0]++;
    return 0;
}

bool8 sub_80874FC(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_807D770())
    {
        gFieldEffectArguments[0] = mapObject->coords2.x;
        gFieldEffectArguments[1] = mapObject->coords2.y;
        gFieldEffectArguments[2] = sprite->subpriority - 1;
        gFieldEffectArguments[3] = sprite->oam.priority;
        task->data[1] = FieldEffectStart(FLDEFF_POP_OUT_OF_ASH);
        task->data[0]++;
    }
    return 0;
}

bool8 sub_8087548(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite = &gSprites[task->data[1]];
    if (sprite->animCmdIndex > 1)
    {
        task->data[0]++;
        mapObject->mapobj_bit_13 = 0;
        CameraObjectReset1();
        PlaySE(SE_W091);
        FieldObjectSetSpecialAnim(mapObject, sub_80608A4(DIR_EAST));
    }
    return 0;
}

bool8 sub_808759C(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        gPlayerAvatar.preventStep = 0;
        ScriptContext2_Disable();
        UnfreezeMapObjects();
        DestroyTask(FindTaskIdByFunc(sub_8087470));
    }
    return 0;
}

extern void sub_8060470(s16 *x, s16 *y, s16 dx, s16 dy);
extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[36];

u8 FldEff_LavaridgeGymWarp(void)
{
    u8 spriteId;
    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[33], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    gSprites[spriteId].oam.priority = gFieldEffectArguments[3];
    gSprites[spriteId].coordOffsetEnabled = 1;
    return spriteId;
}

void sub_8087638(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        FieldEffectStop(sprite, FLDEFF_LAVARIDGE_GYM_WARP);
    }
}

void sub_808766C(u8);

void sub_8087654(u8 priority)
{
    CreateTask(sub_808766C, priority);
}

void sub_808766C(u8 taskId)
{
    while(gUnknown_0839F364[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId], &gSprites[gPlayerAvatar.spriteId]));
}

bool8 sub_80876C8(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    FreezeMapObjects();
    CameraObjectReset2();
    gPlayerAvatar.preventStep = 1;
    mapObject->mapobj_bit_26 = 1;
    task->data[0]++;
    return 0;
}

bool8 sub_80876F8(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        if (task->data[1] > 3)
        {
            gFieldEffectArguments[0] = mapObject->coords2.x;
            gFieldEffectArguments[1] = mapObject->coords2.y;
            gFieldEffectArguments[2] = sprite->subpriority - 1;
            gFieldEffectArguments[3] = sprite->oam.priority;
            task->data[1] = FieldEffectStart(FLDEFF_POP_OUT_OF_ASH);
            task->data[0]++;
        } else
        {
            task->data[1]++;
            FieldObjectSetSpecialAnim(mapObject, GetStepInPlaceDelay4AnimId(mapObject->mapobj_unk_18));
            PlaySE(SE_FU_ZUZUZU);
        }
    }
    return 0;
}

bool8 sub_8087774(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    if (gSprites[task->data[1]].animCmdIndex == 2)
    {
        mapObject->mapobj_bit_13 = 1;
        task->data[0]++;
    }
    return 0;
}

bool8 sub_80877AC(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    if (!FieldEffectActiveListContains(FLDEFF_POP_OUT_OF_ASH))
    {
        sub_8053FF8();
        fade_8080918();
        task->data[0]++;
    }
    return 0;
}

void sub_80878C4(u8);
void mapldr_080859D4(void);

bool8 sub_80877D4(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    if (!gPaletteFade.active && sub_8054034() == 1)
    {
        warp_in();
        gFieldCallback = sub_8086748;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(sub_808766C));
    }
    return 0;
}

u8 FldEff_PopOutOfAsh(void)
{
    u8 spriteId;
    sub_8060470((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[32], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    gSprites[spriteId].oam.priority = gFieldEffectArguments[3];
    gSprites[spriteId].coordOffsetEnabled = 1;
    return spriteId;
}

void sub_808788C(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        FieldEffectStop(sprite, FLDEFF_POP_OUT_OF_ASH);
    }
}

void sub_80878A8(void)
{
    ScriptContext2_Enable();
    FreezeMapObjects();
    CreateTask(sub_80878C4, 0x50);
}

void sub_80878C4(u8 taskId)
{
    gUnknown_0839F378[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_80878F4(struct Task *task)
{
    task->data[0]++;
    task->data[14] = 64;
    task->data[15] = player_get_direction_lower_nybble();
}

void sub_8087914(struct Task *task)
{
    struct MapObject *mapObject;
    u8 unknown_0839F380[5];
    memcpy(unknown_0839F380, gUnknown_0839F380, sizeof gUnknown_0839F380);
    if (task->data[14] != 0 && (--task->data[14]) == 0)
    {
        sub_8053FF8();
        fade_8080918();
    }
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject) || FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        if (task->data[14] == 0 && !gPaletteFade.active && sub_8054034() == 1)
        {
            FieldObjectSetDirection(mapObject, task->data[15]);
            sub_8053678();
            warp_in();
            gFieldCallback = mapldr_080859D4;
            SetMainCallback2(CB2_LoadMap);
            DestroyTask(FindTaskIdByFunc(sub_80878C4));
        } else if (task->data[1] == 0 || (--task->data[1]) == 0)
        {
            FieldObjectSetSpecialAnim(mapObject, GetFaceDirectionAnimId(unknown_0839F380[mapObject->mapobj_unk_18]));
            if (task->data[2] < 12)
            {
                task->data[2]++;
            }
            task->data[1] = 8 >> (task->data[2] >> 2);
        }
    }
}

void sub_8087A74(u8);

void mapldr_080859D4(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    FreezeMapObjects();
    gFieldCallback = ((void *)0);
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_13 = 1;
    CreateTask(sub_8087A74, 0);
}

void sub_8087A74(u8 taskId)
{
    gUnknown_0839F388[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_8087AA4(struct Task *task)
{
    if (sub_807D770())
    {
        task->data[0]++;
        task->data[15] = player_get_direction_lower_nybble();
    }
}

void sub_8087AC8(struct Task *task)
{
    struct MapObject *mapObject;
    u8 unknown_0839F380[5];
    memcpy(unknown_0839F380, gUnknown_0839F380, sizeof gUnknown_0839F380);
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (task->data[1] == 0 || (--task->data[1]) == 0)
    {
        if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject) && !FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
        {
            return;
        }
        if (task->data[2] >= 32 && task->data[15] == player_get_direction_lower_nybble())
        {
            mapObject->mapobj_bit_13 = 0;
            ScriptContext2_Disable();
            UnfreezeMapObjects();
            DestroyTask(FindTaskIdByFunc(sub_8087A74));
            return;
        }
        FieldObjectSetSpecialAnim(mapObject, GetFaceDirectionAnimId(unknown_0839F380[mapObject->mapobj_unk_18]));
        if (task->data[2] < 32)
        {
            task->data[2]++;
        }
        task->data[1] = task->data[2] >> 2;
    }
    mapObject->mapobj_bit_13 ^= 1;
}

void sub_8087BBC(u8);
void mapldr_08085D88(void);

void sub_8087BA8(void)
{
    CreateTask(sub_8087BBC, 0);
}

void sub_8087BBC(u8 taskId)
{
    gUnknown_0839F390[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_8087BEC(struct Task *task)
{
    ScriptContext2_Enable();
    FreezeMapObjects();
    CameraObjectReset2();
    task->data[15] = player_get_direction_lower_nybble();
    task->data[0]++;
}

void sub_8087C14(struct Task *task)
{
    struct MapObject *mapObject;
    u8 unknown_0839F380[5];
    memcpy(unknown_0839F380, gUnknown_0839F380, sizeof gUnknown_0839F380);
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (task->data[1] == 0 || (--task->data[1]) == 0)
    {
        FieldObjectTurn(mapObject, unknown_0839F380[mapObject->mapobj_unk_18]);
        task->data[1] = 8;
        task->data[2]++;
    }
    if (task->data[2] > 7 && task->data[15] == mapObject->mapobj_unk_18)
    {
        task->data[0]++;
        task->data[1] = 4;
        task->data[2] = 8;
        task->data[3] = 1;
        PlaySE(SE_TK_WARPIN);
    }
}

void sub_8087CA4(struct Task *task)
{
    struct MapObject *mapObject;
    struct Sprite *sprite;
    u8 unknown_0839F380[5];
    memcpy(unknown_0839F380, gUnknown_0839F380, sizeof gUnknown_0839F380);
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    sprite = &gSprites[gPlayerAvatar.spriteId];
    if ((--task->data[1]) <= 0)
    {
        task->data[1] = 4;
        FieldObjectTurn(mapObject, unknown_0839F380[mapObject->mapobj_unk_18]);
    }
    sprite->pos1.y -= task->data[3];
    task->data[4] += task->data[3];
    if ((--task->data[2]) <= 0 && (task->data[2] = 4, task->data[3] < 8))
    {
        task->data[3] <<= 1;
    }
    if (task->data[4] > 8 && (sprite->oam.priority = 1, sprite->subspriteMode != 0))
    {
        sprite->subspriteMode = 2;
    }
    if (task->data[4] >= 0xa8)
    {
        task->data[0]++;
        sub_8053FF8();
        fade_8080918();
    }
}

void sub_8087D78(struct Task *task)
{
    if (!gPaletteFade.active && sub_8054034() == 1)
    {
        Overworld_SetWarpDestToLastHealLoc();
        warp_in();
        SetMainCallback2(CB2_LoadMap);
        gFieldCallback = mapldr_08085D88;
        DestroyTask(FindTaskIdByFunc(sub_8087BBC));
    }
}

void sub_8087E1C(u8);

void mapldr_08085D88(void)
{
    Overworld_PlaySpecialMapMusic();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    FreezeMapObjects();
    gFieldCallback = ((void *)0);
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_13 = 1;
    CameraObjectReset2();
    CreateTask(sub_8087E1C, 0);
}

void sub_8087E1C(u8 taskId)
{
    gUnknown_0839F3A0[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_8087E4C(struct Task *task)
{
    struct Sprite *sprite;
    s16 centerToCornerVecY;
    if (sub_807D770())
    {
        sprite = &gSprites[gPlayerAvatar.spriteId];
        centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
        sprite->pos2.y = -(sprite->pos1.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY);
        gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_13 = 0;
        task->data[0]++;
        task->data[1] = 8;
        task->data[2] = 1;
        task->data[14] = sprite->subspriteMode;
        task->data[15] = player_get_direction_lower_nybble();
        PlaySE(SE_TK_WARPIN);
    }
}

void sub_8087ED8(struct Task *task)
{
    u8 unknown_0839F380[5];
    struct MapObject *mapObject;
    struct Sprite *sprite;
    memcpy(unknown_0839F380, gUnknown_0839F380, sizeof gUnknown_0839F380);
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    sprite = &gSprites[gPlayerAvatar.spriteId];
    if ((sprite->pos2.y += task->data[1]) >= -8)
    {
        if (task->data[13] == 0)
        {
            task->data[13]++;
            mapObject->mapobj_bit_2 = 1;
            sprite->subspriteMode = task->data[14];
        }
    } else
    {
        sprite->oam.priority = 1;
        if (sprite->subspriteMode != 0)
        {
            sprite->subspriteMode = 2;
        }
    }
    if (sprite->pos2.y >= -0x30 && task->data[1] > 1 && !(sprite->pos2.y & 1))
    {
        task->data[1]--;
    }
    if ((--task->data[2]) == 0)
    {
        task->data[2] = 4;
        FieldObjectTurn(mapObject, unknown_0839F380[mapObject->mapobj_unk_18]);
    }
    if (sprite->pos2.y >= 0)
    {
        sprite->pos2.y = 0;
        task->data[0]++;
        task->data[1] = 1;
        task->data[2] = 0;
    }
}

void sub_8087FDC(struct Task *task)
{
    u8 unknown_0839F380[5];
    struct MapObject *mapObject;
    memcpy(unknown_0839F380, gUnknown_0839F380, sizeof gUnknown_0839F380);
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if ((--task->data[1]) == 0)
    {
        FieldObjectTurn(mapObject, unknown_0839F380[mapObject->mapobj_unk_18]);
        task->data[1] = 8;
        if ((++task->data[2]) > 4 && task->data[14] == mapObject->mapobj_unk_18)
        {
            ScriptContext2_Disable();
            CameraObjectReset1();
            UnfreezeMapObjects();
            DestroyTask(FindTaskIdByFunc(sub_8087E1C));
        }
    }
}

void sub_8088120(u8);
void sub_808847C(u8);
u8 sub_8088830(u32, u32, u32);
void sub_80883DC(void);
void sub_808843C(u16);
void sub_8088890(struct Sprite *);

bool8 FldEff_FieldMoveShowMon(void)
{
    u8 taskId;
    if (is_map_type_1_2_3_5_or_6(Overworld_GetMapTypeOfSaveblockLocation()) == 1)
    {
        taskId = CreateTask(sub_8088120, 0xff);
    } else
    {
        taskId = CreateTask(sub_808847C, 0xff);
    }
    gTasks[taskId].data[15] = sub_8088830(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    return 0;
}

bool8 FldEff_FieldMoveShowMonInit(void)
{
    struct Pokemon *pokemon;
    u32 flag = gFieldEffectArguments[0] & 0x80000000;
    pokemon = &gPlayerParty[(u8)gFieldEffectArguments[0]];
    gFieldEffectArguments[0] = GetMonData(pokemon, 11);
    gFieldEffectArguments[1] = GetMonData(pokemon, 1);
    gFieldEffectArguments[2] = GetMonData(pokemon, 0);
    gFieldEffectArguments[0] |= flag;
    FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON);
    FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    return 0;
}

void sub_8088120(u8 taskId)
{
    gUnknown_0839F3AC[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_8088150(struct Task *task)
{
    task->data[11] = (*(vu16 *)(0x4000000 + 0x48));
    task->data[12] = (*(vu16 *)(0x4000000 + 0x4a));
    StoreWordInTwoHalfwords(&task->data[13], (u32)gMain.vblankCallback);
    task->data[1] = 0xf0f1;
    task->data[2] = 0x5051;
    task->data[3] = 0x3f;
    task->data[4] = 0x3e;
    (*(vu16 *)(0x4000000 + 0x40)) = task->data[1];
    (*(vu16 *)(0x4000000 + 0x44)) = task->data[2];
    (*(vu16 *)(0x4000000 + 0x48)) = task->data[3];
    (*(vu16 *)(0x4000000 + 0x4a)) = task->data[4];
    SetVBlankCallback(sub_80883DC);
    task->data[0]++;
}

void sub_80881C0(struct Task *task)
{
    u16 offset;
    u16 delta;
    offset = (((*(vu16 *)(0x4000000 + 0x8)) >> 2) << 14);
    delta = (((*(vu16 *)(0x4000000 + 0x8)) >> 8) << 11);
    CpuSet(gFieldMoveStreaksTiles, (void *)(0x6000000 + offset), 0x00000000 | ((0x200)/(16/8) & 0x1FFFFF));
    { vu32 tmp = (vu32)(0); CpuSet((void *)&tmp, (void *)(0x6000000 + delta), 0x04000000 | 0x01000000 | ((0x800)/(32/8) & 0x1FFFFF)); };
    LoadPalette(gFieldMoveStreaksPalette, 0xf0, 0x20);
    sub_808843C(delta);
    task->data[0]++;
}

void sub_8088228(struct Task *task)
{
    s16 v0;
    s16 v2;
    s16 v3;
    task->data[5] -= 16;
    v0 = ((u16)task->data[1] >> 8);
    v2 = ((u16)task->data[2] >> 8);
    v3 = ((u16)task->data[2] & 0xff);
    v0 -= 16;
    v2 -= 2;
    v3 += 2;
    if (v0 < 0)
    {
        v0 = 0;
    }
    if (v2 < 0x28)
    {
        v2 = 0x28;
    }
    if (v3 > 0x78)
    {
        v3 = 0x78;
    }
    task->data[1] = (v0 << 8) | (task->data[1] & 0xff);
    task->data[2] = (v2 << 8) | v3;
    if (v0 == 0 && v2 == 0x28 && v3 == 0x78)
    {
        gSprites[task->data[15]].callback = sub_8088890;
        task->data[0]++;
    }
}

void sub_80882B4(struct Task *task)
{
    task->data[5] -= 16;
    if (gSprites[task->data[15]].data[7])
    {
        task->data[0]++;
    }
}

void sub_80882E4(struct Task *task)
{
    s16 v2;
    s16 v3;
    task->data[5] -= 16;
    v2 = (task->data[2] >> 8);
    v3 = (task->data[2] & 0xff);
    v2 += 6;
    v3 -= 6;
    if (v2 > 0x50)
    {
        v2 = 0x50;
    }
    if (v3 < 0x51)
    {
        v3 = 0x51;
    }
    task->data[2] = (v2 << 8) | v3;
    if (v2 == 0x50 && v3 == 0x51)
    {
        task->data[0]++;
    }
}

void sub_8088338(struct Task *task)
{
    u16 bg0cnt;
    bg0cnt = ((*(vu16 *)(0x4000000 + 0x8)) >> 8) << 11;
    { vu32 tmp = (vu32)(0); CpuSet((void *)&tmp, (void *)0x6000000 + bg0cnt, 0x04000000 | 0x01000000 | ((0x800)/(32/8) & 0x1FFFFF)); };
    task->data[1] = 0xf1;
    task->data[2] = 0xa1;
    task->data[3] = task->data[11];
    task->data[4] = task->data[12];
    task->data[0]++;
}

void sub_8088380(struct Task *task)
{
    IntrCallback callback;
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (u32 *)&callback);
    SetVBlankCallback(callback);
    SetUpWindowConfig(&gWindowConfig_81E6CE4);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    FreeResourcesAndDestroySprite(&gSprites[task->data[15]]);
    FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON);
    DestroyTask(FindTaskIdByFunc(sub_8088120));
}

void sub_80883DC(void)
{
    struct Task *task;
    IntrCallback callback;
    task = &gTasks[FindTaskIdByFunc(sub_8088120)];
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (u32 *)&callback);
    callback();
    (*(vu16 *)(0x4000000 + 0x40)) = task->data[1];
    (*(vu16 *)(0x4000000 + 0x44)) = task->data[2];
    (*(vu16 *)(0x4000000 + 0x48)) = task->data[3];
    (*(vu16 *)(0x4000000 + 0x4a)) = task->data[4];
    (*(vu16 *)(0x4000000 + 0x10)) = task->data[5];
    (*(vu16 *)(0x4000000 + 0x12)) = task->data[6];
}

void sub_808843C(u16 offs)
{
    u16 i;
    u16 *dest;
    dest = (u16 *)(0x6000000 + 0x140 + offs);
    for (i=0; i<0x140; i++, dest++)
    {
        *dest = gFieldMoveStreaksTilemap[i] | 0xf000;
    }
}

void sub_80886B0(void);
bool8 sub_8088708(struct Task *);
void sub_80886F8(struct Task *);
bool8 sub_80887C0(struct Task *);

void sub_808847C(u8 taskId)
{
    gUnknown_0839F3C8[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_80884AC(struct Task *task)
{
    (*(vu16 *)(0x4000000 + 0x10)) = task->data[1];
    (*(vu16 *)(0x4000000 + 0x12)) = task->data[2];
    StoreWordInTwoHalfwords((u16 *)&task->data[13], (u32)gMain.vblankCallback);
    SetVBlankCallback(sub_80886B0);
    task->data[0]++;
}

void sub_80884E8(struct Task *task)
{
    u16 offset;
    u16 delta;
    offset = (((*(vu16 *)(0x4000000 + 0x8)) >> 2) << 14);
    delta = (((*(vu16 *)(0x4000000 + 0x8)) >> 8) << 11);
    task->data[12] = delta;
    CpuSet(gDarknessFieldMoveStreaksTiles, (void *)(0x6000000 + offset), 0x00000000 | ((0x80)/(16/8) & 0x1FFFFF));
    { vu32 tmp = (vu32)(0); CpuSet((void *)&tmp, (void *)(0x6000000 + delta), 0x04000000 | 0x01000000 | ((0x800)/(32/8) & 0x1FFFFF)); };
    LoadPalette(gDarknessFieldMoveStreaksPalette, 0xf0, 0x20);
    task->data[0]++;
}

void sub_8088554(struct Task *task)
{
    if (sub_8088708(task))
    {
        (*(vu16 *)(0x4000000 + 0x42)) = 0x00f0;
        (*(vu16 *)(0x4000000 + 0x46)) = 0x2878;
        gSprites[task->data[15]].callback = sub_8088890;
        task->data[0]++;
    }
    sub_80886F8(task);
}

void sub_80885A8(struct Task *task)
{
    sub_80886F8(task);
    if (gSprites[task->data[15]].data[7])
    {
        task->data[0]++;
    }
}

void sub_80885D8(struct Task *task)
{
    sub_80886F8(task);
    task->data[3] = task->data[1] & 7;
    task->data[4] = 0;
    (*(vu16 *)(0x4000000 + 0x42)) = 0xffff;
    (*(vu16 *)(0x4000000 + 0x46)) = 0xffff;
    task->data[0]++;
}

void sub_808860C(struct Task *task)
{
    sub_80886F8(task);
    if (sub_80887C0(task))
    {
        task->data[0]++;
    }
}

void sub_808862C(struct Task *task)
{
    IntrCallback intrCallback;
    u16 bg0cnt;
    bg0cnt = ((*(vu16 *)(0x4000000 + 0x8)) >> 8) << 11;
    { vu32 tmp = (vu32)(0); CpuSet((void *)&tmp, (void *)0x6000000 + bg0cnt, 0x04000000 | 0x01000000 | ((0x800)/(32/8) & 0x1FFFFF)); };
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (u32 *)&intrCallback);
    SetVBlankCallback(intrCallback);
    SetUpWindowConfig(&gWindowConfig_81E6CE4);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    FreeResourcesAndDestroySprite(&gSprites[task->data[15]]);
    FieldEffectActiveListRemove(FLDEFF_FIELD_MOVE_SHOW_MON);
    DestroyTask(FindTaskIdByFunc(sub_808847C));
}

void sub_80886B0(void)
{
    IntrCallback intrCallback;
    struct Task *task;
    task = &gTasks[FindTaskIdByFunc(sub_808847C)];
    LoadWordFromTwoHalfwords((u16 *)&task->data[13], (u32 *)&intrCallback);
    intrCallback();
    (*(vu16 *)(0x4000000 + 0x10)) = task->data[1];
    (*(vu16 *)(0x4000000 + 0x12)) = task->data[2];
}

void sub_80886F8(struct Task *task)
{
    task->data[1] -= 16;
    task->data[3] += 16;
}
# 2694 "src/field/field_effect.c"
__attribute__((naked))
bool8 sub_8088708(struct Task *task)
{
    asm(".syntax unified\n" "\tpush {r4-r7,lr}\n" "\tmov r7, r10\n" "\tmov r6, r9\n" "\tmov r5, r8\n" "\tpush {r5-r7}\n" "\tsub sp, 0x4\n" "\tadds r5, r0, 0\n" "\tldrh r2, [r5, 0x10]\n" "\tmovs r1, 0x10\n" "\tldrsh r0, [r5, r1]\n" "\tcmp r0, 0x1F\n" "\tble _08088724\n" "\tmovs r0, 0x1\n" "\tb _080887A8\n" "_08088724:\n" "\tldrh r0, [r5, 0xE]\n" "\tlsls r0, 16\n" "\tasrs r3, r0, 19\n" "\tmovs r1, 0x1F\n" "\tands r3, r1\n" "\tmovs r4, 0x10\n" "\tldrsh r0, [r5, r4]\n" "\tcmp r3, r0\n" "\tblt _080887A6\n" "\tmovs r0, 0x20\n" "\tsubs r3, r0, r3\n" "\tands r3, r1\n" "\tsubs r0, r2\n" "\tmov r12, r0\n" "\tmov r7, r12\n" "\tands r7, r1\n" "\tmov r12, r7\n" "\tldrh r0, [r5, 0x20]\n" "\tldr r1, _080887B8 @ =0x06000140\n" "\tadds r1, r0\n" "\tmov r8, r1\n" "\tmovs r4, 0\n" "\tldr r7, _080887BC @ =gDarknessFieldMoveStreaksTilemap\n" "\tmov r10, r7\n" "\tmovs r0, 0xF0\n" "\tlsls r0, 8\n" "\tmov r9, r0\n" "\tadds r1, r3, 0x1\n" "\tmovs r0, 0x1F\n" "\tands r1, r0\n" "\tstr r1, [sp]\n" "\tmov r6, r12\n" "\tadds r6, 0x1\n" "\tands r6, r0\n" "_08088768:\n" "\tlsls r1, r4, 5\n" "\tadds r2, r1, r3\n" "\tlsls r2, 1\n" "\tadd r2, r8\n" "\tmov r7, r12\n" "\tadds r0, r7, r1\n" "\tlsls r0, 1\n" "\tadd r0, r10\n" "\tldrh r0, [r0]\n" "\tmov r7, r9\n" "\torrs r0, r7\n" "\tstrh r0, [r2]\n" "\tldr r0, [sp]\n" "\tadds r2, r1, r0\n" "\tlsls r2, 1\n" "\tadd r2, r8\n" "\tadds r1, r6, r1\n" "\tlsls r1, 1\n" "\tadd r1, r10\n" "\tldrh r0, [r1]\n" "\tmov r1, r9\n" "\torrs r0, r1\n" "\tstrh r0, [r2]\n" "\tadds r0, r4, 0x1\n" "\tlsls r0, 16\n" "\tlsrs r4, r0, 16\n" "\tcmp r4, 0x9\n" "\tbls _08088768\n" "\tldrh r0, [r5, 0x10]\n" "\tadds r0, 0x2\n" "\tstrh r0, [r5, 0x10]\n" "_080887A6:\n" "\tmovs r0, 0\n" "_080887A8:\n" "\tadd sp, 0x4\n" "\tpop {r3-r5}\n" "\tmov r8, r3\n" "\tmov r9, r4\n" "\tmov r10, r5\n" "\tpop {r4-r7}\n" "\tpop {r1}\n" "\tbx r1\n" "\t.align 2, 0\n" "_080887B8: .4byte 0x06000140\n" "_080887BC: .4byte gDarknessFieldMoveStreaksTilemap" "\n.syntax divided\n")
# 2791 "src/field/field_effect.c"
                                                                         ;
}


bool8 sub_80887C0(struct Task *task)
{
    u16 i;
    u16 dstOffs;
    u16 *dest;
    if (task->data[4] >= 32)
    {
        return 1;
    }
    dstOffs = task->data[3] >> 3;
    if (dstOffs >= task->data[4])
    {
        dstOffs = (task->data[1] >> 3) & 0x1f;
        dest = (u16 *)(0x6000000 + 0x140 + (u16)task->data[12]);
        for (i=0; i<10; i++)
        {
            dest[dstOffs + i * 32] = 0xf000;
            dest[((dstOffs + 1) & 0x1f) + i * 32] = 0xf000;
        }
        task->data[4] += 2;
    }
    return 0;
}

u8 sub_8088830(u32 a0, u32 a1, u32 a2)
{
    u16 v0;
    u8 monSprite;
    struct Sprite *sprite;
    v0 = (a0 & 0x80000000) >> 16;
    a0 &= 0x7fffffff;
    monSprite = CreateMonSprite_FieldMove(a0, a1, a2, 0x140, 0x50, 0);
    sprite = &gSprites[monSprite];
    sprite->callback = SpriteCallbackDummy;
    sprite->oam.priority = 0;
    sprite->data[0] = a0;
    sprite->data[6] = v0;
    return monSprite;
}

void sub_80888D4(struct Sprite *);

void sub_8088890(struct Sprite *sprite)
{
    if ((sprite->pos1.x -= 20) <= 0x78)
    {
        sprite->pos1.x = 0x78;
        sprite->data[1] = 30;
        sprite->callback = sub_80888D4;
        if (sprite->data[6])
        {
            PlayCry2(sprite->data[0], 0, 0x7d, 0xa);
        } else
        {
            PlayCry1(sprite->data[0], 0);
        }
    }
}

void sub_80888F0(struct Sprite *);

void sub_80888D4(struct Sprite *sprite)
{
    if ((--sprite->data[1]) == 0)
    {
        sprite->callback = sub_80888F0;
    }
}

void sub_80888F0(struct Sprite *sprite)
{
    if (sprite->pos1.x < -0x40)
    {
        sprite->data[7] = 1;
    } else
    {
        sprite->pos1.x -= 20;
    }
}

void sub_8088954(u8);

u8 FldEff_UseSurf(void)
{
    u8 taskId;
    taskId = CreateTask(sub_8088954, 0xff);
    gTasks[taskId].data[15] = gFieldEffectArguments[0];
    Overworld_ClearSavedMusic();
    Overworld_ChangeMusicTo(0x016d);
    return 0;
}

void sub_8088954(u8 taskId)
{
    gUnknown_0839F3E4[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_8088984(struct Task *task)
{
    ScriptContext2_Enable();
    FreezeMapObjects();
    gPlayerAvatar.preventStep = 1;
    SetPlayerAvatarStateMask(8);
    PlayerGetDestCoords(&task->data[1], &task->data[2]);
    MoveCoords(gMapObjects[gPlayerAvatar.mapObjectId].placeholder18, &task->data[1], &task->data[2]);
    task->data[0]++;
}

void sub_80889E4(struct Task *task)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject) || FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        sub_8059BF4();
        FieldObjectSetSpecialAnim(mapObject, 0x39);
        task->data[0]++;
    }
}

void sub_8088A30(struct Task *task)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (FieldObjectCheckIfSpecialAnimFinishedOrInactive(mapObject))
    {
        gFieldEffectArguments[0] = task->data[15] | 0x80000000;
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        task->data[0]++;
    }
}

void sub_8088A78(struct Task *task)
{
    struct MapObject *mapObject;
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
        sub_805B980(mapObject, GetPlayerAvatarGraphicsIdByStateId(3));
        FieldObjectClearAnimIfSpecialAnimFinished(mapObject);
        FieldObjectSetSpecialAnim(mapObject, sub_80608D0(mapObject->placeholder18));
        gFieldEffectArguments[0] = task->data[1];
        gFieldEffectArguments[1] = task->data[2];
        gFieldEffectArguments[2] = gPlayerAvatar.mapObjectId;
        mapObject->mapobj_unk_1A = FieldEffectStart(FLDEFF_SURF_BLOB);
        task->data[0]++;
    }
}

void sub_8088AF4(struct Task *task)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        gPlayerAvatar.preventStep = 0;
        gPlayerAvatar.flags &= 0xdf;
        FieldObjectSetSpecialAnim(mapObject, GetFaceDirectionAnimId(mapObject->placeholder18));
        sub_8127ED0(mapObject->mapobj_unk_1A, 1);
        UnfreezeMapObjects();
        ScriptContext2_Disable();
        FieldEffectActiveListRemove(FLDEFF_USE_SURF);
        DestroyTask(FindTaskIdByFunc(sub_8088954));
    }
}

void sub_8088BC4(struct Sprite *);

u8 FldEff_NPCFlyOut(void)
{
    u8 spriteId;
    struct Sprite *sprite;
    spriteId = CreateSprite(gFieldEffectObjectTemplatePointers[26], 0x78, 0, 1);
    sprite = &gSprites[spriteId];
    sprite->oam.paletteNum = 0;
    sprite->oam.priority = 1;
    sprite->callback = sub_8088BC4;
    sprite->data[1] = gFieldEffectArguments[0];
    PlaySE(SE_W019);
    return spriteId;
}

void sub_8088BC4(struct Sprite *sprite)
{
    struct Sprite *npcSprite;
    sprite->pos2.x = Cos(sprite->data[2], 0x8c);
    sprite->pos2.y = Sin(sprite->data[2], 0x48);
    sprite->data[2] = (sprite->data[2] + 4) & 0xff;
    if (sprite->data[0])
    {
        npcSprite = &gSprites[sprite->data[1]];
        npcSprite->coordOffsetEnabled = 0;
        npcSprite->pos1.x = sprite->pos1.x + sprite->pos2.x;
        npcSprite->pos1.y = sprite->pos1.y + sprite->pos2.y - 8;
        npcSprite->pos2.x = 0;
        npcSprite->pos2.y = 0;
    }
    if (sprite->data[2] >= 0x80)
    {
        FieldEffectStop(sprite, FLDEFF_NPCFLY_OUT);
    }
}

void sub_8088C70(u8);
extern void sub_8127EFC(u8, u8);
u8 sub_8088F60(void);
bool8 sub_8088FA4(u8);
void sub_8088FC0(u8);
void sub_8088FFC(u8, u8);
void sub_8089018(struct Sprite *);
void sub_80890D8(struct Sprite *);

u8 FldEff_UseFly(void)
{
    u8 taskId;
    taskId = CreateTask(sub_8088C70, 0xfe);
    gTasks[taskId].data[1] = gFieldEffectArguments[0];
    return 0;
}

void sub_8088C70(u8 taskId)
{
    gUnknown_0839F3F8[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_8088CA0(struct Task *task)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject) || FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        task->data[15] = gPlayerAvatar.flags;
        gPlayerAvatar.preventStep = 1;
        SetPlayerAvatarStateMask(1);
        sub_8059BF4();
        FieldObjectSetSpecialAnim(mapObject, 0x39);
        task->data[0]++;
    }
}

void sub_8088CF8(struct Task *task)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        task->data[0]++;
        gFieldEffectArguments[0] = task->data[1];
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    }
}

void sub_8088D3C(struct Task *task)
{
    struct MapObject *mapObject;
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
        if (task->data[15] & 0x08)
        {
            sub_8127ED0(mapObject->mapobj_unk_1A, 2);
            sub_8127EFC(mapObject->mapobj_unk_1A, 0);
        }
        task->data[1] = sub_8088F60();
        task->data[0]++;
    }
}

void sub_8088D94(struct Task *task)
{
    if (sub_8088FA4(task->data[1]))
    {
        task->data[0]++;
        task->data[2] = 16;
        SetPlayerAvatarTransitionFlags(0x01);
        FieldObjectSetSpecialAnim(&gMapObjects[gPlayerAvatar.mapObjectId], 0x02);
    }
}

void sub_8088DD8(struct Task *task)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if ((task->data[2] == 0 || (--task->data[2]) == 0) && FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        task->data[0]++;
        PlaySE(SE_W019);
        sub_8088FC0(task->data[1]);
    }
}

void sub_8088E2C(struct Task *task)
{
    struct MapObject *mapObject;
    if ((++task->data[2]) >= 8)
    {
        mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
        sub_805B980(mapObject, GetPlayerAvatarGraphicsIdByStateId(0x03));
        StartSpriteAnim(&gSprites[mapObject->spriteId], 0x16);
        mapObject->mapobj_bit_12 = 1;
        FieldObjectSetSpecialAnim(mapObject, 0x48);
        if (task->data[15] & 0x08)
        {
            DestroySprite(&gSprites[mapObject->mapobj_unk_1A]);
        }
        task->data[0]++;
        task->data[2] = 0;
    }
}

void sub_8088EB4(struct Task *task)
{
    struct MapObject *mapObject;
    if ((++task->data[2]) >= 10)
    {
        mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
        FieldObjectClearAnimIfSpecialAnimActive(mapObject);
        mapObject->mapobj_bit_12 = 0;
        mapObject->mapobj_bit_22 = 0;
        sub_8088FFC(task->data[1], mapObject->spriteId);
        CameraObjectReset2();
        task->data[0]++;
    }
}

void sub_8088F10(struct Task *task)
{
    if (sub_8088FA4(task->data[1]))
    {
        fade_8080918();
        task->data[0]++;
    }
}

void sub_8088F30(struct Task *task)
{
    if (!gPaletteFade.active)
    {
        FieldEffectActiveListRemove(FLDEFF_USE_FLY);
        DestroyTask(FindTaskIdByFunc(sub_8088C70));
    }
}

u8 sub_8088F60(void)
{
    u8 spriteId;
    struct Sprite *sprite;
    spriteId = CreateSprite(gFieldEffectObjectTemplatePointers[26], 0xff, 0xb4, 0x1);
    sprite = &gSprites[spriteId];
    sprite->oam.paletteNum = 0;
    sprite->oam.priority = 1;
    sprite->callback = sub_8089018;
    return spriteId;
}

u8 sub_8088FA4(u8 spriteId)
{
    return gSprites[spriteId].data[7];
}

void sub_8088FC0(u8 spriteId)
{
    struct Sprite *sprite;
    sprite = &gSprites[spriteId];
    sprite->callback = sub_80890D8;
    sprite->pos1.x = 0x78;
    sprite->pos1.y = 0x00;
    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
    memset(&sprite->data[0], 0, 8 * sizeof(u16) );
    sprite->data[6] = 0x40;
}

void sub_8088FFC(u8 a0, u8 a1)
{
    gSprites[a0].data[6] = a1;
}

void sub_8089018(struct Sprite *sprite)
{
    if (sprite->data[7] == 0)
    {
        if (sprite->data[0] == 0)
        {
            sprite->oam.affineMode = 3;
            sprite->affineAnims = gSpriteAffineAnimTable_0839F44C;
            InitSpriteAffineAnim(sprite);
            StartSpriteAffineAnim(sprite, 0);
            sprite->pos1.x = 0x76;
            sprite->pos1.y = -0x30;
            sprite->data[0]++;
            sprite->data[1] = 0x40;
            sprite->data[2] = 0x100;
        }
        sprite->data[1] += (sprite->data[2] >> 8);
        sprite->pos2.x = Cos(sprite->data[1], 0x78);
        sprite->pos2.y = Sin(sprite->data[1], 0x78);
        if (sprite->data[2] < 0x800)
        {
            sprite->data[2] += 0x60;
        }
        if (sprite->data[1] > 0x81)
        {
            sprite->data[7]++;
            sprite->oam.affineMode = 0;
            FreeOamMatrix(sprite->oam.matrixNum);
            CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, 0);
        }
    }
}

void sub_80890D8(struct Sprite *sprite)
{
    struct Sprite *sprite1;
    sprite->pos2.x = Cos(sprite->data[2], 0x8c);
    sprite->pos2.y = Sin(sprite->data[2], 0x48);
    sprite->data[2] = (sprite->data[2] + 4) & 0xff;
    if (sprite->data[6] != 0x40)
    {
        sprite1 = &gSprites[sprite->data[6]];
        sprite1->coordOffsetEnabled = 0;
        sprite1->pos1.x = sprite->pos1.x + sprite->pos2.x;
        sprite1->pos1.y = sprite->pos1.y + sprite->pos2.y - 8;
        sprite1->pos2.x = 0;
        sprite1->pos2.y = 0;
    }
    if (sprite->data[2] >= 0x80)
    {
        sprite->data[7] = 1;
    }
}

void sub_808914C(struct Sprite *sprite)
{
    if (sprite->data[7] == 0)
    {
        if (sprite->data[0] == 0)
        {
            sprite->oam.affineMode = 3;
            sprite->affineAnims = gSpriteAffineAnimTable_0839F44C;
            InitSpriteAffineAnim(sprite);
            StartSpriteAffineAnim(sprite, 1);
            sprite->pos1.x = 0x5e;
            sprite->pos1.y = -0x20;
            sprite->data[0]++;
            sprite->data[1] = 0xf0;
            sprite->data[2] = 0x800;
            sprite->data[4] = 0x80;
        }
        sprite->data[1] += sprite->data[2] >> 8;
        sprite->data[3] += sprite->data[2] >> 8;
        sprite->data[1] &= 0xff;
        sprite->pos2.x = Cos(sprite->data[1], 0x20);
        sprite->pos2.y = Sin(sprite->data[1], 0x78);
        if (sprite->data[2] > 0x100)
        {
            sprite->data[2] -= sprite->data[4];
        }
        if (sprite->data[4] < 0x100)
        {
            sprite->data[4] += 24;
        }
        if (sprite->data[2] < 0x100)
        {
            sprite->data[2] = 0x100;
        }
        if (sprite->data[3] >= 60)
        {
            sprite->data[7]++;
            sprite->oam.affineMode = 0;
            FreeOamMatrix(sprite->oam.matrixNum);
            sprite->invisible = 1;
        }
    }
}

void sub_8089230(u8 spriteId)
{
    sub_8088FC0(spriteId);
    gSprites[spriteId].callback = sub_808914C;
}

void sub_8089270(u8);

u8 FldEff_FlyIn(void)
{
    CreateTask(sub_8089270, 0xfe);
    return 0;
}

void sub_8089270(u8 taskId)
{
    gUnknown_0839F454[gTasks[taskId].data[0]](&gTasks[taskId]);
}

void sub_80892A0(struct Task *task)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject) || FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        task->data[0]++;
        task->data[2] = 17;
        task->data[15] = gPlayerAvatar.flags;
        gPlayerAvatar.preventStep = 1;
        SetPlayerAvatarStateMask(0x01);
        if (task->data[15] & 0x08)
        {
            sub_8127ED0(mapObject->mapobj_unk_1A, 0);
        }
        sub_805B980(mapObject, GetPlayerAvatarGraphicsIdByStateId(0x3));
        CameraObjectReset2();
        FieldObjectTurn(mapObject, DIR_WEST);
        StartSpriteAnim(&gSprites[mapObject->spriteId], 0x16);
        mapObject->mapobj_bit_13 = 0;
        task->data[1] = sub_8088F60();
        sub_8088FC0(task->data[1]);
        sub_8088FFC(task->data[1], mapObject->spriteId);
    }
}

void sub_8089354(struct Task *task)
{
    struct MapObject *mapObject;
    struct Sprite *sprite;
    if (task->data[2] == 0 || (--task->data[2]) == 0)
    {
        mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
        sprite = &gSprites[mapObject->spriteId];
        sub_8088FFC(task->data[1], 0x40);
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        task->data[0]++;
        task->data[2] = 0;
    }
}

void sub_80893C0(struct Task *task)
{
    s16 unknown_0839F470[18];
    struct Sprite *sprite;
    memcpy(unknown_0839F470, gUnknown_0839F470, sizeof gUnknown_0839F470);
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.y = unknown_0839F470[task->data[2]];
    if ((++task->data[2]) >= 18)
    {
        task->data[0]++;
    }
}

void sub_8089414(struct Task *task)
{
    struct MapObject *mapObject;
    struct Sprite *sprite;
    if (sub_8088FA4(task->data[1]))
    {
        mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
        sprite = &gSprites[mapObject->spriteId];
        mapObject->mapobj_bit_12 = 0;
        sub_805C058(mapObject, mapObject->coords2.x, mapObject->coords2.y);
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->coordOffsetEnabled = 1;
        sub_8059BF4();
        FieldObjectSetSpecialAnim(mapObject, 0x39);
        task->data[0]++;
    }
}

void sub_808948C(struct Task *task)
{
    if (FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[gPlayerAvatar.mapObjectId]))
    {
        task->data[0]++;
        sub_8089230(task->data[1]);
    }
}

void sub_80894C4(struct Task *task)
{
    if (sub_8088FA4(task->data[1]))
    {
        DestroySprite(&gSprites[task->data[1]]);
        task->data[0]++;
        task->data[1] = 0x10;
    }
}

void fishE(struct Task *task)
{
    u8 state;
    struct MapObject *mapObject;
    if ((--task->data[1]) == 0)
    {
        mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
        state = 0;
        if (task->data[15] & 0x08)
        {
            state = 3;
            sub_8127ED0(mapObject->mapobj_unk_1A, 1);
        }
        sub_805B980(mapObject, GetPlayerAvatarGraphicsIdByStateId(state));
        FieldObjectTurn(mapObject, DIR_SOUTH);
        gPlayerAvatar.flags = task->data[15];
        gPlayerAvatar.preventStep = 0;
        FieldEffectActiveListRemove(FLDEFF_FLY_IN);
        DestroyTask(FindTaskIdByFunc(sub_8089270));
    }
}
