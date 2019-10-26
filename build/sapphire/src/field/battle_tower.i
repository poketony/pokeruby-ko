# 1 "src/field/battle_tower.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/battle_tower.c"
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
# 2 "src/field/battle_tower.c" 2
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
# 3 "src/field/battle_tower.c" 2
# 1 "include/battle_setup.h" 1







struct TrainerPartyMember0
{
    u16 iv;
    u8 level;
    u16 species;
};


struct TrainerPartyMember1
{
    u16 iv;
    u8 level;
    u16 species;
    u16 moves[4];
};


struct TrainerPartyMember2
{
    u16 iv;
    u8 level;
    u16 species;
    u16 heldItem;
};


struct TrainerPartyMember3
{
    u16 iv;
    u8 level;
    u16 species;
    u16 heldItem;
    u16 moves[4];
};

struct TrainerEyeTrainer
{
   u16 opponentIDs[5];
   u16 mapGroup;
   u16 mapNum;
};

void BattleSetup_StartWildBattle(void);
void BattleSetup_StartRoamerBattle(void);
void BattleSetup_StartScriptedWildBattle(void);
s8 BattleSetup_GetTerrain(void);
u8 BattleSetup_GetBattleTowerBattleTransition(void);
u8 *BattleSetup_ConfigureTrainerBattle(const u8 *data);
void TrainerWantsBattle(u8, u8 *);

bool32 GetTrainerFlagFromScriptPointer(u8 *data);





u8 HasTrainerAlreadyBeenFought(u16);
void trainer_flag_set(u16);
void trainer_flag_clear(u16);
void BattleSetup_StartTrainerBattle(void);
void sub_808260C(void);
void do_choose_name_or_words_screen(void);


u8 *BattleSetup_GetScriptAddrAfterBattle(void);
u8 *BattleSetup_GetTrainerPostBattleScript(void);



u8 *sub_808281C(void);
u8 *sub_8082830(void);

u8 *sub_8082880(void);
# 92 "include/battle_setup.h"
void sub_8082B78(void);

void sub_8082BD0(u16, u16);
s32 sub_8082C0C(u16 mapGroup, u16 mapNum);
s32 unref_sub_8082C2C(u16 mapGroup, u16 mapNum);
u16 sub_8082C4C(u16 a1);


void sub_8082CB8(void);
# 4 "src/field/battle_tower.c" 2
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
# 5 "src/field/battle_tower.c" 2
# 1 "include/battle_transition.h" 1



void BattleTransition_StartOnField(u8 transitionID);
void BattleTransition_Start(u8 transitionID);
bool8 IsBattleTransitionDone(void);



enum
{
    MUGSHOT_SYDNEY,
    MUGSHOT_PHOEBE,
    MUGSHOT_GLACIA,
    MUGSHOT_DRAKE,
    MUGSHOT_STEVEN,
};
# 6 "src/field/battle_tower.c" 2
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
# 7 "src/field/battle_tower.c" 2
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
# 8 "src/field/battle_tower.c" 2
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
# 9 "src/field/battle_tower.c" 2
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
# 10 "src/field/battle_tower.c" 2
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
# 11 "src/field/battle_tower.c" 2
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
# 12 "src/field/battle_tower.c" 2
# 1 "include/map_object_constants.h" 1



enum
{
    MAP_OBJ_GFX_BRENDAN_NORMAL,
    MAP_OBJ_GFX_BRENDAN_MACH_BIKE,
    MAP_OBJ_GFX_BRENDAN_SURFING,
    MAP_OBJ_GFX_BRENDAN_FIELD_MOVE,
    MAP_OBJ_GFX_QUINTY_PLUMP,
    MAP_OBJ_GFX_LITTLE_BOY_1,
    MAP_OBJ_GFX_LITTLE_GIRL_1,
    MAP_OBJ_GFX_BOY_1,
    MAP_OBJ_GFX_GIRL_1,
    MAP_OBJ_GFX_BOY_2,
    MAP_OBJ_GFX_GIRL_2,
    MAP_OBJ_GFX_LITTLE_BOY_2,
    MAP_OBJ_GFX_LITTLE_GIRL_2,
    MAP_OBJ_GFX_BOY_3,
    MAP_OBJ_GFX_GIRL_3,
    MAP_OBJ_GFX_BOY_4,
    MAP_OBJ_GFX_WOMAN_1,
    MAP_OBJ_GFX_FAT_MAN,
    MAP_OBJ_GFX_WOMAN_2,
    MAP_OBJ_GFX_MAN_1,
    MAP_OBJ_GFX_WOMAN_3,
    MAP_OBJ_GFX_OLD_MAN_1,
    MAP_OBJ_GFX_OLD_WOMAN_1,
    MAP_OBJ_GFX_MAN_2,
    MAP_OBJ_GFX_WOMAN_4,
    MAP_OBJ_GFX_MAN_3,
    MAP_OBJ_GFX_WOMAN_5,
    MAP_OBJ_GFX_COOK,
    MAP_OBJ_GFX_WOMAN_6,
    MAP_OBJ_GFX_OLD_MAN_2,
    MAP_OBJ_GFX_OLD_WOMAN_2,
    MAP_OBJ_GFX_CAMPER,
    MAP_OBJ_GFX_PICNICKER,
    MAP_OBJ_GFX_MAN_4,
    MAP_OBJ_GFX_WOMAN_7,
    MAP_OBJ_GFX_YOUNGSTER,
    MAP_OBJ_GFX_BUG_CATCHER,
    MAP_OBJ_GFX_PSYCHIC_M,
    MAP_OBJ_GFX_SCHOOL_KID_M,
    MAP_OBJ_GFX_MANIAC,
    MAP_OBJ_GFX_HEX_MANIAC,
    MAP_OBJ_GFX_WOMAN_8,
    MAP_OBJ_GFX_SWIMMER_M,
    MAP_OBJ_GFX_SWIMMER_F,
    MAP_OBJ_GFX_BLACK_BELT,
    MAP_OBJ_GFX_BEAUTY,
    MAP_OBJ_GFX_SCIENTIST_1,
    MAP_OBJ_GFX_LASS,
    MAP_OBJ_GFX_GENTLEMAN,
    MAP_OBJ_GFX_SAILOR,
    MAP_OBJ_GFX_FISHERMAN,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_M,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_F,
    MAP_OBJ_GFX_TUBER_F,
    MAP_OBJ_GFX_TUBER_M,
    MAP_OBJ_GFX_HIKER,
    MAP_OBJ_GFX_CYCLING_TRIATHLETE_M,
    MAP_OBJ_GFX_CYCLING_TRIATHLETE_F,
    MAP_OBJ_GFX_NURSE,
    MAP_OBJ_GFX_ITEM_BALL,
    MAP_OBJ_GFX_BERRY_TREE,
    MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES,
    MAP_OBJ_GFX_BERRY_TREE_LATE_STAGES,
    MAP_OBJ_GFX_BRENDAN_ACRO_BIKE,
    MAP_OBJ_GFX_PROF_BIRCH,
    MAP_OBJ_GFX_MAN_5,
    MAP_OBJ_GFX_MAN_6,
    MAP_OBJ_GFX_REPORTER_M,
    MAP_OBJ_GFX_REPORTER_F,
    MAP_OBJ_GFX_BARD,
    MAP_OBJ_GFX_HIPSTER,
    MAP_OBJ_GFX_TRADER,
    MAP_OBJ_GFX_STORYTELLER,
    MAP_OBJ_GFX_GIDDY,
    MAP_OBJ_GFX_UNUSED_MAUVILLE_OLD_MAN_1,
    MAP_OBJ_GFX_UNUSED_MAUVILLE_OLD_MAN_2,
    MAP_OBJ_GFX_UNUSED_NATU_DOLL,
    MAP_OBJ_GFX_UNUSED_MAGNEMITE_DOLL,
    MAP_OBJ_GFX_UNUSED_SQUIRTLE_DOLL,
    MAP_OBJ_GFX_UNUSED_WOOPER_DOLL,
    MAP_OBJ_GFX_UNUSED_PIKACHU_DOLL,
    MAP_OBJ_GFX_UNUSED_PORYGON2_DOLL,
    MAP_OBJ_GFX_CUTTABLE_TREE,
    MAP_OBJ_GFX_MART_EMPLOYEE,
    MAP_OBJ_GFX_ROOFTOP_SALE_WOMAN,
    MAP_OBJ_GFX_TEALA,
    MAP_OBJ_GFX_BREAKABLE_ROCK,
    MAP_OBJ_GFX_PUSHABLE_BOULDER,
    MAP_OBJ_GFX_MR_BRINEYS_BOAT,
    MAP_OBJ_GFX_MAY_NORMAL,
    MAP_OBJ_GFX_MAY_MACH_BIKE,
    MAP_OBJ_GFX_MAY_ACRO_BIKE,
    MAP_OBJ_GFX_MAY_SURFING,
    MAP_OBJ_GFX_MAY_FIELD_MOVE,
    MAP_OBJ_GFX_TRUCK,
    MAP_OBJ_GFX_MACHOKE_CARRYING_BOX,
    MAP_OBJ_GFX_MACHOKE_FACING_AWAY,
    MAP_OBJ_GFX_BIRCHS_BAG,
    MAP_OBJ_GFX_POOCHYENA,
    MAP_OBJ_GFX_ARTIST,
    MAP_OBJ_GFX_RIVAL_BRENDAN_NORMAL,
    MAP_OBJ_GFX_RIVAL_BRENDAN_MACH_BIKE,
    MAP_OBJ_GFX_RIVAL_BRENDAN_ACRO_BIKE,
    MAP_OBJ_GFX_RIVAL_BRENDAN_SURFING,
    MAP_OBJ_GFX_RIVAL_BRENDAN_FIELD_MOVE,
    MAP_OBJ_GFX_RIVAL_MAY_NORMAL,
    MAP_OBJ_GFX_RIVAL_MAY_MACH_BIKE,
    MAP_OBJ_GFX_RIVAL_MAY_ACRO_BIKE,
    MAP_OBJ_GFX_RIVAL_MAY_SURFING,
    MAP_OBJ_GFX_RIVAL_MAY_FIELD_MOVE,
    MAP_OBJ_GFX_CAMERAMAN,
    MAP_OBJ_GFX_BRENDAN_UNDERWATER,
    MAP_OBJ_GFX_MAY_UNDERWATER,
    MAP_OBJ_GFX_MOVING_BOX,
    MAP_OBJ_GFX_CABLE_CAR,
    MAP_OBJ_GFX_SCIENTIST_2,
    MAP_OBJ_GFX_MAN_7,
    MAP_OBJ_GFX_AQUA_MEMBER_M,
    MAP_OBJ_GFX_AQUA_MEMBER_F,
    MAP_OBJ_GFX_MAGMA_MEMBER_M,
    MAP_OBJ_GFX_MAGMA_MEMBER_F,
    MAP_OBJ_GFX_SIDNEY,
    MAP_OBJ_GFX_PHOEBE,
    MAP_OBJ_GFX_GLACIA,
    MAP_OBJ_GFX_DRAKE,
    MAP_OBJ_GFX_ROXANNE,
    MAP_OBJ_GFX_BRAWLY,
    MAP_OBJ_GFX_WATTSON,
    MAP_OBJ_GFX_FLANNERY,
    MAP_OBJ_GFX_NORMAN,
    MAP_OBJ_GFX_WINONA,
    MAP_OBJ_GFX_LIZA,
    MAP_OBJ_GFX_TATE,
    MAP_OBJ_GFX_WALLACE,
    MAP_OBJ_GFX_STEVEN,
    MAP_OBJ_GFX_WALLY,
    MAP_OBJ_GFX_LITTLE_BOY_3,
    MAP_OBJ_GFX_BRENDAN_FISHING,
    MAP_OBJ_GFX_MAY_FISHING,
    MAP_OBJ_GFX_HOT_SPRINGS_OLD_WOMAN,
    MAP_OBJ_GFX_SS_TIDAL,
    MAP_OBJ_GFX_SUBMARINE_SHADOW,
    MAP_OBJ_GFX_PICHU_DOLL,
    MAP_OBJ_GFX_PIKACHU_DOLL,
    MAP_OBJ_GFX_MARILL_DOLL,
    MAP_OBJ_GFX_TOGEPI_DOLL,
    MAP_OBJ_GFX_CYNDAQUIL_DOLL,
    MAP_OBJ_GFX_CHIKORITA_DOLL,
    MAP_OBJ_GFX_TOTODILE_DOLL,
    MAP_OBJ_GFX_JIGGLYPUFF_DOLL,
    MAP_OBJ_GFX_MEOWTH_DOLL,
    MAP_OBJ_GFX_CLEFAIRY_DOLL,
    MAP_OBJ_GFX_DITTO_DOLL,
    MAP_OBJ_GFX_SMOOCHUM_DOLL,
    MAP_OBJ_GFX_TREECKO_DOLL,
    MAP_OBJ_GFX_TORCHIC_DOLL,
    MAP_OBJ_GFX_MUDKIP_DOLL,
    MAP_OBJ_GFX_DUSKULL_DOLL,
    MAP_OBJ_GFX_WYNAUT_DOLL,
    MAP_OBJ_GFX_BALTOY_DOLL,
    MAP_OBJ_GFX_KECLEON_DOLL,
    MAP_OBJ_GFX_AZURILL_DOLL,
    MAP_OBJ_GFX_SKITTY_DOLL,
    MAP_OBJ_GFX_SWABLU_DOLL,
    MAP_OBJ_GFX_GULPIN_DOLL,
    MAP_OBJ_GFX_LOTAD_DOLL,
    MAP_OBJ_GFX_SEEDOT_DOLL,
    MAP_OBJ_GFX_PIKA_CUSHION,
    MAP_OBJ_GFX_ROUND_CUSHION,
    MAP_OBJ_GFX_KISS_CUSHION,
    MAP_OBJ_GFX_ZIGZAG_CUSHION,
    MAP_OBJ_GFX_SPIN_CUSHION,
    MAP_OBJ_GFX_DIAMOND_CUSHION,
    MAP_OBJ_GFX_BALL_CUSHION,
    MAP_OBJ_GFX_GRASS_CUSHION,
    MAP_OBJ_GFX_FIRE_CUSHION,
    MAP_OBJ_GFX_WATER_CUSHION,
    MAP_OBJ_GFX_BIG_SNORLAX_DOLL,
    MAP_OBJ_GFX_BIG_RHYDON_DOLL,
    MAP_OBJ_GFX_BIG_LAPRAS_DOLL,
    MAP_OBJ_GFX_BIG_VENUSAUR_DOLL,
    MAP_OBJ_GFX_BIG_CHARIZARD_DOLL,
    MAP_OBJ_GFX_BIG_BLASTOISE_DOLL,
    MAP_OBJ_GFX_BIG_WAILMER_DOLL,
    MAP_OBJ_GFX_BIG_REGIROCK_DOLL,
    MAP_OBJ_GFX_BIG_REGICE_DOLL,
    MAP_OBJ_GFX_BIG_REGISTEEL_DOLL,
    MAP_OBJ_GFX_LATIAS,
    MAP_OBJ_GFX_LATIOS,
    MAP_OBJ_GFX_BOY_5,
    MAP_OBJ_GFX_CONTEST_JUDGE,
    MAP_OBJ_GFX_BRENDAN_WATERING,
    MAP_OBJ_GFX_MAY_WATERING,
    MAP_OBJ_GFX_BRENDAN_DECORATING,
    MAP_OBJ_GFX_MAY_DECORATING,
    MAP_OBJ_GFX_ARCHIE,
    MAP_OBJ_GFX_MAXIE,
    MAP_OBJ_GFX_KYOGRE_1,
    MAP_OBJ_GFX_GROUDON_1,
    MAP_OBJ_GFX_FOSSIL,
    MAP_OBJ_GFX_REGIROCK,
    MAP_OBJ_GFX_REGICE,
    MAP_OBJ_GFX_REGISTEEL,
    MAP_OBJ_GFX_SKITTY,
    MAP_OBJ_GFX_KECLEON_1,
    MAP_OBJ_GFX_KYOGRE_2,
    MAP_OBJ_GFX_GROUDON_2,
    MAP_OBJ_GFX_RAYQUAZA,
    MAP_OBJ_GFX_ZIGZAGOON,
    MAP_OBJ_GFX_PIKACHU,
    MAP_OBJ_GFX_AZUMARILL,
    MAP_OBJ_GFX_WINGULL,
    MAP_OBJ_GFX_KECLEON_2,
    MAP_OBJ_GFX_TUBER_M_SWIMMING,
    MAP_OBJ_GFX_AZURILL,
    MAP_OBJ_GFX_MOM,
    MAP_OBJ_GFX_LINK_BRENDAN,
    MAP_OBJ_GFX_LINK_MAY,
};

enum {
    SHADOW_SIZE_S,
    SHADOW_SIZE_M,
    SHADOW_SIZE_L,
    SHADOW_SIZE_XL
};

enum {
    TRACKS_NONE,
    TRACKS_FOOT,
    TRACKS_BIKE_TIRE
};
# 13 "src/field/battle_tower.c" 2
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
# 14 "src/field/battle_tower.c" 2
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
# 15 "src/field/battle_tower.c" 2
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
# 16 "src/field/battle_tower.c" 2
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
# 17 "src/field/battle_tower.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 18 "src/field/battle_tower.c" 2
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
# 19 "src/field/battle_tower.c" 2
# 1 "include/script_pokemon_80C4.h" 1



void sub_80C5190(u8);
void sub_80C5580(void);
void SetBattleTowerPlayerParty(void);
void ReducePlayerPartyToThree(void);

u8 sub_80C4D50(void);
void ShowContestWinner(void);
void ScrSpecial_HealPlayerParty();
u8 ScriptGiveMon(u16, u8, u16, u32, u32, u8);
u8 ScriptGiveEgg(u16);
void CreateScriptedWildMon(u16, u8, u16);
void ScriptSetMonMoveSlot(u8, u16, u8);
# 20 "src/field/battle_tower.c" 2
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
# 21 "src/field/battle_tower.c" 2
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
# 22 "src/field/battle_tower.c" 2
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
# 23 "src/field/battle_tower.c" 2
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
# 24 "src/field/battle_tower.c" 2
# 1 "include/trainer.h" 1
# 19 "include/trainer.h"
enum {
    TRAINER_CLASS_AQUA_LEADER,
    TRAINER_CLASS_TEAM_AQUA_M,
    TRAINER_CLASS_TEAM_AQUA_F,
    TRAINER_CLASS_AROMA_LADY,
    TRAINER_CLASS_RUIN_MANIAC,
    TRAINER_CLASS_INTERVIEWER,
    TRAINER_CLASS_TUBER_F,
    TRAINER_CLASS_TUBER_M,
    TRAINER_CLASS_COOL_TRAINER_M,
    TRAINER_CLASS_COOL_TRAINER_F,
    TRAINER_CLASS_HEX_MANIAC,
    TRAINER_CLASS_LADY,
    TRAINER_CLASS_BEAUTY,
    TRAINER_CLASS_RICH_BOY,
    TRAINER_CLASS_POKEMANIAC,
    TRAINER_CLASS_SWIMMER_M,
    TRAINER_CLASS_BLACK_BELT,
    TRAINER_CLASS_GUITARIST,
    TRAINER_CLASS_KINDLER,
    TRAINER_CLASS_CAMPER,
    TRAINER_CLASS_BUG_MANIAC,
    TRAINER_CLASS_PSYCHIC_M,
    TRAINER_CLASS_PSYCHIC_F,
    TRAINER_CLASS_GENTLEMAN,
    TRAINER_CLASS_ELITE_FOUR_M,
    TRAINER_CLASS_ELITE_FOUR_F,
    TRAINER_CLASS_LEADER_F,
    TRAINER_CLASS_LEADER_M,
    TRAINER_CLASS_LEADER_MF,
    TRAINER_CLASS_SCHOOL_KID_M,
    TRAINER_CLASS_SCHOOL_KID_F,
    TRAINER_CLASS_SR_AND_JR,
    TRAINER_CLASS_POKEFAN_M,
    TRAINER_CLASS_POKEFAN_F,
    TRAINER_CLASS_EXPERT_M,
    TRAINER_CLASS_EXPERT_F,
    TRAINER_CLASS_YOUNGSTER,
    TRAINER_CLASS_CHAMPION,
    TRAINER_CLASS_FISHERMAN,
    TRAINER_CLASS_CYCLING_TRIATHLETE_M,
    TRAINER_CLASS_CYCLING_TRIATHLETE_F,
    TRAINER_CLASS_RUNNING_TRIATHLETE_M,
    TRAINER_CLASS_RUNNING_TRIATHLETE_F,
    TRAINER_CLASS_SWIMMING_TRIATHLETE_M,
    TRAINER_CLASS_SWIMMING_TRIATHLETE_F,
    TRAINER_CLASS_DRAGON_TAMER,
    TRAINER_CLASS_BIRD_KEEPER,
    TRAINER_CLASS_NINJA_BOY,
    TRAINER_CLASS_BATTLE_GIRL,
    TRAINER_CLASS_PARASOL_LADY,
    TRAINER_CLASS_SWIMMER_F,
    TRAINER_CLASS_PICNICKER,
    TRAINER_CLASS_TWINS,
    TRAINER_CLASS_SAILOR,
    TRAINER_CLASS_BOARDER_1,
    TRAINER_CLASS_BOARDER_2,
    TRAINER_CLASS_COLLECTOR,
    TRAINER_CLASS_WALLY,
    TRAINER_CLASS_BRENDAN_1,
    TRAINER_CLASS_BRENDAN_2,
    TRAINER_CLASS_BRENDAN_3,
    TRAINER_CLASS_MAY_1,
    TRAINER_CLASS_MAY_2,
    TRAINER_CLASS_MAY_3,
    TRAINER_CLASS_POKEMON_BREEDER_M,
    TRAINER_CLASS_POKEMON_BREEDER_F,
    TRAINER_CLASS_POKEMON_RANGER_M,
    TRAINER_CLASS_POKEMON_RANGER_F,
    TRAINER_CLASS_MAGMA_LEADER,
    TRAINER_CLASS_TEAM_MAGMA_M,
    TRAINER_CLASS_TEAM_MAGMA_F,
    TRAINER_CLASS_LASS,
    TRAINER_CLASS_BUG_CATCHER,
    TRAINER_CLASS_HIKER,
    TRAINER_CLASS_YOUNG_COUPLE,
    TRAINER_CLASS_OLD_COUPLE,
    TRAINER_CLASS_SIS_AND_BRO
};

enum {
    TRAINER_PIC_BRENDAN,
    TRAINER_PIC_MAY,
    TRAINER_PIC_LASS,
    TRAINER_PIC_YOUNGSTER,
    TRAINER_PIC_HIKER,
    TRAINER_PIC_BEAUTY,
    TRAINER_PIC_FISHERMAN,
    TRAINER_PIC_LADY,
    TRAINER_PIC_CYCLING_TRIATHLETE_M,
    TRAINER_PIC_AQUA_GRUNT_M,
    TRAINER_PIC_TWINS,
    TRAINER_PIC_SWIMMER_F,
    TRAINER_PIC_BUG_CATCHER,
    TRAINER_PIC_SCHOOL_KID_M,
    TRAINER_PIC_RICH_BOY,
    TRAINER_PIC_SR_AND_JR,
    TRAINER_PIC_BLACK_BELT,
    TRAINER_PIC_WALLY,
    TRAINER_PIC_AQUA_GRUNT_F,
    TRAINER_PIC_TUBER_F,
    TRAINER_PIC_HEX_MANIAC,
    TRAINER_PIC_POKEMON_BREEDER_F,
    TRAINER_PIC_MAGMA_GRUNT_M,
    TRAINER_PIC_MAGMA_GRUNT_F,
    TRAINER_PIC_INTERVIEWER,
    TRAINER_PIC_TUBER_M,
    TRAINER_PIC_YOUNG_COUPLE,
    TRAINER_PIC_GUITARIST,
    TRAINER_PIC_GENTLEMAN,
    TRAINER_PIC_STEVEN,
    TRAINER_PIC_MAXIE,
    TRAINER_PIC_RUNNING_TRIATHLETE_F,
    TRAINER_PIC_RUNNING_TRIATHLETE_M,
    TRAINER_PIC_BATTLE_GIRL,
    TRAINER_PIC_CYCLING_TRIATHLETE_F,
    TRAINER_PIC_SWIMMER_M,
    TRAINER_PIC_POKEFAN_F,
    TRAINER_PIC_EXPERT_M,
    TRAINER_PIC_EXPERT_F,
    TRAINER_PIC_SWIMMING_TRIATHLETE_M,
    TRAINER_PIC_SWIMMING_TRIATHLETE_F,
    TRAINER_PIC_DRAGON_TAMER,
    TRAINER_PIC_BIRD_KEEPER,
    TRAINER_PIC_NINJA_BOY,
    TRAINER_PIC_PARASOL_LADY,
    TRAINER_PIC_BUG_MANIAC,
    TRAINER_PIC_SAILOR,
    TRAINER_PIC_COLLECTOR,
    TRAINER_PIC_POKEMON_BREEDER_M,
    TRAINER_PIC_POKEMON_RANGER_M,
    TRAINER_PIC_POKEMON_RANGER_F,
    TRAINER_PIC_MAGMA_ADMIN_M,
    TRAINER_PIC_MAGMA_ADMIN_F,
    TRAINER_PIC_AROMA_LADY,
    TRAINER_PIC_RUIN_MANIAC,
    TRAINER_PIC_COOL_TRAINER_M,
    TRAINER_PIC_COOL_TRAINER_F,
    TRAINER_PIC_POKEMANIAC,
    TRAINER_PIC_KINDLER,
    TRAINER_PIC_CAMPER,
    TRAINER_PIC_PICNICKER,
    TRAINER_PIC_PSYCHIC_M,
    TRAINER_PIC_PSYCHIC_F,
    TRAINER_PIC_SCHOOL_KID_F,
    TRAINER_PIC_POKEFAN_M,
    TRAINER_PIC_SIS_AND_BRO,
    TRAINER_PIC_OLD_COUPLE,
    TRAINER_PIC_AQUA_ADMIN_M,
    TRAINER_PIC_AQUA_ADMIN_F,
    TRAINER_PIC_UNUSED_AQUA,
    TRAINER_PIC_ARCHIE,
    TRAINER_PIC_ROXANNE,
    TRAINER_PIC_BRAWLY,
    TRAINER_PIC_WATTSON,
    TRAINER_PIC_FLANNERY,
    TRAINER_PIC_NORMAN,
    TRAINER_PIC_WINONA,
    TRAINER_PIC_TATE_AND_LIZA,
    TRAINER_PIC_WALLACE,
    TRAINER_PIC_SIDNEY,
    TRAINER_PIC_PHOEBE,
    TRAINER_PIC_GLACIA,
    TRAINER_PIC_DRAKE,
};

enum {
    TRAINER_CLASS_NAME_POKEMON_TRAINER_1,
    TRAINER_CLASS_NAME_POKEMON_TRAINER_2,
    TRAINER_CLASS_NAME_AQUA_LEADER,
    TRAINER_CLASS_NAME_TEAM_AQUA,
    TRAINER_CLASS_NAME_AQUA_ADMIN,
    TRAINER_CLASS_NAME_AROMA_LADY,
    TRAINER_CLASS_NAME_RUIN_MANIAC,
    TRAINER_CLASS_NAME_INTERVIEWER,
    TRAINER_CLASS_NAME_TUBER_F,
    TRAINER_CLASS_NAME_TUBER_M,
    TRAINER_CLASS_NAME_COOL_TRAINER,
    TRAINER_CLASS_NAME_HEX_MANIAC,
    TRAINER_CLASS_NAME_LADY,
    TRAINER_CLASS_NAME_BEAUTY,
    TRAINER_CLASS_NAME_RICH_BOY,
    TRAINER_CLASS_NAME_POKEMANIAC,
    TRAINER_CLASS_NAME_SWIMMER_M,
    TRAINER_CLASS_NAME_BLACK_BELT,
    TRAINER_CLASS_NAME_GUITARIST,
    TRAINER_CLASS_NAME_KINDLER,
    TRAINER_CLASS_NAME_CAMPER,
    TRAINER_CLASS_NAME_BUG_MANIAC,
    TRAINER_CLASS_NAME_PSYCHIC,
    TRAINER_CLASS_NAME_GENTLEMAN,
    TRAINER_CLASS_NAME_ELITE_FOUR,
    TRAINER_CLASS_NAME_LEADER,
    TRAINER_CLASS_NAME_SCHOOL_KID,
    TRAINER_CLASS_NAME_SR_AND_JR,
    TRAINER_CLASS_NAME_WINSTRATE,
    TRAINER_CLASS_NAME_POKEFAN,
    TRAINER_CLASS_NAME_EXPERT,
    TRAINER_CLASS_NAME_YOUNGSTER,
    TRAINER_CLASS_NAME_CHAMPION,
    TRAINER_CLASS_NAME_FISHERMAN,
    TRAINER_CLASS_NAME_TRIATHLETE,
    TRAINER_CLASS_NAME_DRAGON_TAMER,
    TRAINER_CLASS_NAME_BIRD_KEEPER,
    TRAINER_CLASS_NAME_NINJA_BOY,
    TRAINER_CLASS_NAME_BATTLE_GIRL,
    TRAINER_CLASS_NAME_PARASOL_LADY,
    TRAINER_CLASS_NAME_SWIMMER_F,
    TRAINER_CLASS_NAME_PICNICKER,
    TRAINER_CLASS_NAME_TWINS,
    TRAINER_CLASS_NAME_SAILOR,
    TRAINER_CLASS_NAME_BOARDER,
    TRAINER_CLASS_NAME_COLLECTOR,
    TRAINER_CLASS_NAME_POKEMON_TRAINER_3,
    TRAINER_CLASS_NAME_POKEMON_BREEDER,
    TRAINER_CLASS_NAME_POKEMON_RANGER,
    TRAINER_CLASS_NAME_MAGMA_LEADER,
    TRAINER_CLASS_NAME_TEAM_MAGMA,
    TRAINER_CLASS_NAME_MAGMA_ADMIN,
    TRAINER_CLASS_NAME_LASS,
    TRAINER_CLASS_NAME_BUG_CATCHER,
    TRAINER_CLASS_NAME_HIKER,
    TRAINER_CLASS_NAME_YOUNG_COUPLE,
    TRAINER_CLASS_NAME_OLD_COUPLE,
    TRAINER_CLASS_NAME_SIS_AND_BRO
};
# 25 "src/field/battle_tower.c" 2
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
# 26 "src/field/battle_tower.c" 2
# 1 "include/vars.h" 1
# 27 "src/field/battle_tower.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 28 "src/field/battle_tower.c" 2

# 1 "src/field/../data/battle_tower/trainers.h" 1
const struct BattleTowerTrainer gBattleTowerTrainers[] =
{
 {
  .trainerClass = TRAINER_CLASS_YOUNGSTER,
  .name = _("ALVIN"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_ARE,
    EC_WORD_YOU,
    EC_WORD_READY,
    EC_WORD_QUES,
    EC_WORD_HERE_I_COME,
    EC_WORD_EXCL,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
  .name = _("DIRK"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_OKAY,
    EC_WORD_I_AM,
    EC_WORD_GOING,
    EC_WORD_FOR,
    EC_WORD_IT,
    EC_WORD_EXCL,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_LADY,
  .name = _("CYBIL"),
  .teamFlags = 0x02,
  .greeting = {
   .easyChat = {
    EC_WORD_YOU_RE,
    EC_WORD_A,
    EC_WORD_PUSHOVER,
    EC_WORD_LET_S,
    EC_WORD_GET,
    EC_WORD_GOING,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BLACK_BELT,
  .name = _("CHEN"),
  .teamFlags = 0x05,
  .greeting = {
   .easyChat = {
    EC_WORD_MY,
    EC_WORD_SPIRIT,
    EC_WORD_IS,
    EC_WORD_ENOUGH,
    EC_WORD_SNORT,
    EC_WORD_ARRGH,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_NINJA_BOY,
  .name = _("YOSHI"),
  .teamFlags = 0x05,
  .greeting = {
   .easyChat = {
    EC_WORD_GO,
    EC_WORD_MY,
    EC_WORD_POKEMON,
    EC_WORD_FIGHT,
    EC_WORD_THE,
    EC_WORD_BATTLE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SCHOOL_KID_F,
  .name = _("TINA"),
  .teamFlags = 0x0A,
  .greeting = {
   .easyChat = {
    EC_WORD_STUDY,
    EC_WORD_IS,
    EC_WORD_BORING,
    EC_WORD_LET_S,
    EC_WORD_BATTLE,
    EC_WORD_NOW,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BUG_MANIAC,
  .name = _("COREY"),
  .teamFlags = 0x41,
  .greeting = {
   .easyChat = {
    EC_WORD_HEY,
    EC_WORD_I,
    EC_WORD_WILL,
    ((EC_GROUP_MOVE_2 << 9) | MOVE_TRANSFORM),
    EC_WORD_FOR,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_STRENGTH),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_FISHERMAN,
  .name = _("GORDON"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_NEED,
    EC_WORD_A,
    EC_WORD_VACATION,
    EC_WORD_RIGHT,
    EC_WORD_NOW,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_TUBER_F,
  .name = _("ANN"),
  .teamFlags = 0x02,
  .greeting = {
   .easyChat = {
    EC_WORD_WE,
    EC_WORD_ALL,
    EC_WORD_ADORE,
    EC_WORD_POKEMON,
    EC_WORD_ABSOLUTELY,
    EC_WORD_TRULY,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEFAN_F,
  .name = _("JULIA"),
  .teamFlags = 0x42,
  .greeting = {
   .easyChat = {
    EC_WORD_I_AM,
    EC_WORD_A,
    EC_WORD_CUTE,
    EC_WORD_LADY,
    EC_WORD_YES,
    EC_WORD_I_AM,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_GENTLEMAN,
  .name = _("GREGORY"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_THINK,
    EC_WORD_WE,
    EC_WORD_SHOULD,
    EC_WORD_START,
    EC_WORD_TODAY,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_CAMPER,
  .name = _("KEITH"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_YOU_RE,
    EC_WORD_MY,
    EC_WORD_FRIEND,
    EC_WORD_FROM,
    EC_WORD_NOW,
    EC_WORD_ON,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_RUNNING_TRIATHLETE_F,
  .name = _("KENDRA"),
  .teamFlags = 0x0A,
  .greeting = {
   .easyChat = {
    EC_WORD_I_AM,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_SWIFT),
    EC_WORD_HOW,
    EC_WORD_ABOUT,
    EC_WORD_YOU,
    EC_WORD_QUES,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_HIKER,
  .name = _("DEV"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_WAHAHAHA,
    EC_WORD_I_AM,
    EC_WORD_FEELING,
    EC_WORD_LIKE,
    EC_WORD_IT_S,
    ((EC_GROUP_MOVE_2 << 9) | MOVE_PAY_DAY),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
  .name = _("CASSIE"),
  .teamFlags = 0x0A,
  .greeting = {
   .easyChat = {
    EC_WORD_YOU_RE,
    EC_WORD_STRONG,
    EC_WORD_AREN_T,
    0xFFFF,
    EC_WORD_YOU,
    EC_WORD_QUES,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_PSYCHIC_M,
  .name = _("JULIAN"),
  .teamFlags = 0x05,
  .greeting = {
   .easyChat = {
    EC_WORD_FUFUFU,
    0xFFFF,
    EC_WORD_YOU,
    EC_WORD_CAN_T,
    EC_WORD_WIN,
    EC_WORD_KID,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_LASS,
  .name = _("JOYCE"),
  .teamFlags = 0x02,
  .greeting = {
   .easyChat = {
    EC_WORD_BE,
    EC_WORD_KIND,
    EC_WORD_TO,
    EC_WORD_THE,
    EC_WORD_DIGITAL,
    EC_WORD_IDOL,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_GUITARIST,
  .name = _("LES"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_I_AM,
    EC_WORD_GREAT,
    EC_WORD_YOU_RE,
    EC_WORD_JUST,
    EC_WORD_RATHER,
    EC_WORD_OKAY,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_RICH_BOY,
  .name = _("CLINTON"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_HAVE,
    EC_WORD_ROUGH_SKIN,
    EC_WORD_I,
    EC_WORD_NEED,
    EC_WORD_NATURAL_CURE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BUG_CATCHER,
  .name = _("LEWIS"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_THIS,
    EC_WORD_IS,
    EC_WORD_EXCITING,
    EC_WORD_CAN,
    EC_WORD_I,
    EC_WORD_WIN,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_PICNICKER,
  .name = _("RACHAEL"),
  .teamFlags = 0x02,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_LIKE,
    EC_WORD_WALKING,
    EC_WORD_WITH,
    EC_WORD_MY,
    EC_WORD_POKEMON,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_COLLECTOR,
  .name = _("HAROLD"),
  .teamFlags = 0x09,
  .greeting = {
   .easyChat = {
    EC_WORD_HERE,
    EC_WORD_THEY,
    EC_WORD_COME,
    EC_WORD_MY,
    ((EC_GROUP_MOVE_2 << 9) | MOVE_SUPERPOWER),
    EC_WORD_POKEMON,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_TUBER_M,
  .name = _("KIPP"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_I_AM,
    EC_WORD_A,
    EC_WORD_GENIUS,
    EC_WORD_I,
    EC_WORD_SHOULD,
    EC_WORD_WIN,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_KINDLER,
  .name = _("IRWIN"),
  .teamFlags = 0x05,
  .greeting = {
   .easyChat = {
    EC_WORD_YOU,
    EC_WORD_WILL,
    EC_WORD_BE,
    EC_WORD_FEELING,
    EC_WORD_MY,
    EC_WORD_FIRE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_PSYCHIC_F,
  .name = _("EILEEN"),
  .teamFlags = 0x0A,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_WILL,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_ASTONISH),
    EC_WORD_YOU,
    EC_WORD_IN,
    EC_WORD_BATTLE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SWIMMER_F,
  .name = _("ANNE"),
  .teamFlags = 0x02,
  .greeting = {
   .easyChat = {
    EC_WORD_SORRY,
    EC_WORD_BUT,
    EC_WORD_YOU,
    EC_WORD_WILL,
    EC_WORD_NOT,
    EC_WORD_WIN,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_CYCLING_TRIATHLETE_F,
  .name = _("RUTH"),
  .teamFlags = 0x06,
  .greeting = {
   .easyChat = {
    EC_WORD_A,
    EC_WORD_STRONG,
    EC_WORD_GIRL,
    EC_WORD_WANTS,
    EC_WORD_TOUGH,
    EC_WORD_POKEMON,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEMANIAC,
  .name = _("JEREMY"),
  .teamFlags = 0x40,
  .greeting = {
   .easyChat = {
    EC_WORD_MY,
    EC_WORD_POKEMON,
    EC_WORD_ARE,
    EC_WORD_COOL,
    EC_WORD_YOURS,
    EC_WORD_CAN_T_WIN,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SAILOR,
  .name = _("TREVOR"),
  .teamFlags = 0x09,
  .greeting = {
   .easyChat = {
    EC_WORD_MY,
    EC_WORD_OPPONENT,
    EC_WORD_IS,
    EC_WORD_FINALLY,
    EC_WORD_HERE,
    EC_WORD_EXCELLENT,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEMON_BREEDER_F,
  .name = _("COLETTE"),
  .teamFlags = 0x06,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_AM,
    EC_WORD_HUNGRY,
    ((EC_GROUP_MOVE_2 << 9) | MOVE_POUND),
    EC_WORD_MY,
    ((EC_GROUP_MOVE_2 << 9) | MOVE_BELLY_DRUM),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_HEX_MANIAC,
  .name = _("PAULA"),
  .teamFlags = 0x42,
  .greeting = {
   .easyChat = {
    EC_WORD_IT_S,
    EC_WORD_HARD,
    EC_WORD_TO,
    EC_WORD_TAKE,
    EC_WORD_UGLY,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_SPITE),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
  .name = _("STANLY"),
  .teamFlags = 0x41,
  .greeting = {
   .easyChat = {
    EC_WORD_ADVENTURE,
    EC_WORD_AND,
    EC_WORD_BATTLE,
    EC_WORD_ARE,
    EC_WORD_MY,
    EC_WORD_LIKES,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SWIMMING_TRIATHLETE_M,
  .name = _("TROY"),
  .teamFlags = 0x09,
  .greeting = {
   .easyChat = {
    EC_WORD_YOU,
    EC_WORD_CAN_T,
    EC_WORD_LOSE,
    EC_WORD_TO,
    EC_WORD_A,
    EC_WORD_KID,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SCHOOL_KID_M,
  .name = _("ED"),
  .teamFlags = 0x08,
  .greeting = {
   .easyChat = {
    EC_WORD_POKEMON,
    EC_WORD_DAILY,
    EC_WORD_AT,
    EC_WORD_SCHOOL,
    EC_WORD_IT_S,
    EC_WORD_AWESOME,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEMON_RANGER_F,
  .name = _("ELLEN"),
  .teamFlags = 0x04,
  .greeting = {
   .easyChat = {
    EC_WORD_ARE,
    EC_WORD_YOU,
    EC_WORD_KIND,
    EC_WORD_TO,
    EC_WORD_YOUR,
    EC_WORD_POKEMON,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SWIMMER_M,
  .name = _("ARNIE"),
  .teamFlags = 0x09,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_BATTLE,
    EC_WORD_SERIOUSLY,
    EC_WORD_BEAUTIFUL,
    EC_WORD_YOU,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_DIG),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_RUNNING_TRIATHLETE_M,
  .name = _("HAL"),
  .teamFlags = 0x09,
  .greeting = {
   .easyChat = {
    EC_WORD_BOY,
    EC_WORD_I_AM,
    EC_WORD_TIRED,
    EC_WORD_READY,
    EC_WORD_FOR,
    EC_WORD_SLEEP,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BEAUTY,
  .name = _("LAUREN"),
  .teamFlags = 0x06,
  .greeting = {
   .easyChat = {
    EC_WORD_A,
    EC_WORD_TRAINER,
    EC_WORD_LIKE,
    EC_WORD_YOU,
    EC_WORD_IS,
    EC_WORD_EXCITING,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_AROMA_LADY,
  .name = _("STACY"),
  .teamFlags = 0x06,
  .greeting = {
   .easyChat = {
    EC_WORD_HAVE,
    EC_WORD_YOU,
    EC_WORD_A,
    EC_WORD_STENCH,
    EC_WORD_OR,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_SWEET_SCENT),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_COLLECTOR,
  .name = _("DARYL"),
  .teamFlags = 0x81,
  .greeting = {
   .easyChat = {
    EC_WORD_YOUR,
    EC_WORD_POKEMON,
    EC_WORD_ELLIPSIS_ELLIPSIS_ELLIPSIS,
    EC_WORD_I,
    EC_WORD_WANT,
    EC_WORD_IT,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SWIMMING_TRIATHLETE_F,
  .name = _("KATHY"),
  .teamFlags = 0x04,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_WILL,
    EC_WORD_TRY,
    EC_WORD_MY,
    EC_WORD_BEST,
    EC_WORD_TODAY,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEMON_RANGER_M,
  .name = _("HARRIS"),
  .teamFlags = 0x0C,
  .greeting = {
   .easyChat = {
    EC_WORD_WAAAH,
    EC_WORD_WAAAH,
    EC_WORD_WAAAH,
    EC_WORD_WAAAH,
    EC_WORD_EHEHE,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_FAKE_TEARS),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEFAN_M,
  .name = _("GLENN"),
  .teamFlags = 0x80,
  .greeting = {
   .easyChat = {
    EC_WORD_LISTEN,
    EC_WORD_TO,
    EC_WORD_MY,
    EC_WORD_LOUSY,
    EC_WORD_ANIME,
    EC_WORD_SONG,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_CYCLING_TRIATHLETE_M,
  .name = _("NICO"),
  .teamFlags = 0x04,
  .greeting = {
   .easyChat = {
    EC_WORD_DON_T,
    EC_WORD_JUST,
    EC_WORD_BATTLE,
    EC_WORD_DO,
    EC_WORD_SOMETHING,
    EC_WORD_ELSE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEMON_BREEDER_M,
  .name = _("BAILEY"),
  .teamFlags = 0x41,
  .greeting = {
   .easyChat = {
    EC_WORD_ARE,
    EC_WORD_YOU,
    EC_WORD_BUSY,
    EC_WORD_GET,
    EC_WORD_WITH,
    EC_WORD_IT,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_PARASOL_LADY,
  .name = _("ABBIE"),
  .teamFlags = 0x08,
  .greeting = {
   .easyChat = {
    EC_WORD_THE,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_MORNING_SUN),
    EC_WORD_HAS,
    EC_WORD_SO,
    EC_WORD_MUCH,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_COSMIC_POWER),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_CAMPER,
  .name = _("AL"),
  .teamFlags = 0x0C,
  .greeting = {
   .easyChat = {
    EC_WORD_LET_S,
    EC_WORD_HAVE,
    EC_WORD_AN,
    EC_WORD_EXCITING,
    EC_WORD_BATTLE,
    EC_WORD_YEEHAW_EXCL,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SCHOOL_KID_F,
  .name = _("PEGGY"),
  .teamFlags = 0x42,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_WANT,
    EC_WORD_TO,
    EC_WORD_SEE,
    EC_WORD_SOME,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_GROWTH),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BEAUTY,
  .name = _("NAOMI"),
  .teamFlags = 0x04,
  .greeting = {
   .easyChat = {
    EC_WORD_IT,
    EC_WORD_WAS,
    EC_WORD_GREAT,
    EC_WORD_TO,
    EC_WORD_BE,
    EC_WORD_YOUNG,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_NINJA_BOY,
  .name = _("KENJI"),
  .teamFlags = 0x0C,
  .greeting = {
   .easyChat = {
    EC_WORD_PLEASE,
    0xFFFF,
    EC_WORD_DON_T,
    EC_WORD_BE,
    EC_WORD_MEAN,
    EC_WORD_TO_ME,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_CYCLING_TRIATHLETE_M,
  .name = _("ROSS"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_WAKE_UP,
    EC_WORD_MY,
    ((EC_GROUP_MOVE_2 << 9) | MOVE_HIDDEN_POWER),
    EC_WORD_AND,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_ASTONISH),
    EC_WORD_ME,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEMON_RANGER_F,
  .name = _("EDNA"),
  .teamFlags = 0x02,
  .greeting = {
   .easyChat = {
    EC_WORD_BATTLE_TOWER,
    EC_WORD_IS,
    EC_WORD_SO,
    EC_WORD_ENTERTAINING,
    EC_WORD_IT_S,
    EC_WORD_AWESOME,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_RUIN_MANIAC,
  .name = _("ANTON"),
  .teamFlags = 0x41,
  .greeting = {
   .easyChat = {
    EC_WORD_BLEND,
    EC_WORD_THICK_FAT,
    EC_WORD_AND,
    EC_WORD_CHLOROPHYLL,
    EC_WORD_IT_S,
    EC_WORD_TASTY,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SWIMMER_M,
  .name = _("MITCH"),
  .teamFlags = 0x81,
  .greeting = {
   .easyChat = {
    EC_WORD_NEXT,
    EC_WORD_A,
    EC_WORD_GIRL,
    EC_WORD_WITH,
    EC_WORD_A,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_SCARY_FACE),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_HEX_MANIAC,
  .name = _("ROD"),
  .teamFlags = 0x42,
  .greeting = {
   .easyChat = {
    EC_WORD_GIMME,
    EC_WORD_A,
    EC_WORD_TOUGH,
    EC_WORD_BATTLE,
    EC_WORD_NOT,
    EC_WORD_WIMPY,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_RUNNING_TRIATHLETE_M,
  .name = _("RICH"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_TASTY,
    EC_WORD_WATER,
    EC_WORD_IS,
    EC_WORD_HIP_AND,
    EC_WORD_HAPPENING,
    EC_WORD_YES_SIR_EXCL,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEFAN_M,
  .name = _("DANIEL"),
  .teamFlags = 0x80,
  .greeting = {
   .easyChat = {
    EC_WORD_GO,
    EC_WORD_FOR,
    EC_WORD_IT,
    EC_WORD_MY,
    EC_WORD_LOVEY_DOVEY,
    EC_WORD_POKEMON,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_PSYCHIC_F,
  .name = _("GLORIA"),
  .teamFlags = 0x82,
  .greeting = {
   .easyChat = {
    EC_WORD_LET_S,
    EC_WORD_GET,
    EC_WORD_THIS,
    EC_WORD_FIERY,
    EC_WORD_BATTLE,
    EC_WORD_HAPPENING,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_GUITARIST,
  .name = _("NELSON"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_MUSIC,
    EC_WORD_IS,
    EC_WORD_MY,
    EC_WORD_ALL,
    EC_WORD_MY,
    EC_WORD_DESTINY,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_KINDLER,
  .name = _("FERRIS"),
  .teamFlags = 0x41,
  .greeting = {
   .easyChat = {
    EC_WORD_GOOD,
    EC_WORD_IT,
    EC_WORD_IS,
    EC_WORD_SO,
    EC_WORD_VERY,
    EC_WORD_GOOD,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_AROMA_LADY,
  .name = _("AMANDA"),
  .teamFlags = 0x82,
  .greeting = {
   .easyChat = {
    EC_WORD_WHAT,
    EC_WORD_KIND,
    EC_WORD_OF,
    EC_WORD_TRAINER,
    EC_WORD_ARE,
    EC_WORD_YOU,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SWIMMING_TRIATHLETE_M,
  .name = _("MASON"),
  .teamFlags = 0x10,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_DON_T,
    EC_WORD_KNOW,
    EC_WORD_HOW,
    EC_WORD_TO,
    EC_WORD_LOSE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
  .name = _("NATE"),
  .teamFlags = 0x10,
  .greeting = {
   .easyChat = {
    EC_WORD_DRAGON,
    EC_WORD_POKEMON,
    EC_WORD_ARE,
    EC_WORD_ALL,
    EC_WORD_THE,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_RAGE),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_LASS,
  .name = _("MIRIAM"),
  .teamFlags = 0x82,
  .greeting = {
   .easyChat = {
    EC_WORD_YOU_RE,
    EC_WORD_TOO_STRONG,
    EC_WORD_SERIOUSLY,
    EC_WORD_IT_S,
    EC_WORD_BAD,
    EC_WORD_NEWS,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEMANIAC,
  .name = _("THEO"),
  .teamFlags = 0x40,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_ADORE,
    EC_WORD_MY,
    EC_WORD_MEGA,
    EC_WORD_CUTE,
    EC_WORD_PLUSH_DOLL,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SWIMMING_TRIATHLETE_F,
  .name = _("PAMELA"),
  .teamFlags = 0x10,
  .greeting = {
   .easyChat = {
    EC_WORD_HERE_I_COME,
    EC_WORD_I_AM,
    EC_WORD_THE,
    EC_WORD_CUTE,
    ((EC_GROUP_MOVE_2 << 9) | MOVE_WATER_SPORT),
    EC_WORD_IDOL,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEFAN_F,
  .name = _("ALISSA"),
  .teamFlags = 0x20,
  .greeting = {
   .easyChat = {
    EC_WORD_IT_S,
    EC_WORD_A,
    EC_WORD_PREPOSTEROUS,
    EC_WORD_MATCH,
    EC_WORD_I_AM,
    EC_WORD_SHOCKED,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_GENTLEMAN,
  .name = _("ARTHUR"),
  .teamFlags = 0x20,
  .greeting = {
   .easyChat = {
    EC_WORD_PLEASE,
    EC_WORD_GIVE,
    EC_WORD_ME,
    EC_WORD_A,
    EC_WORD_GOOD,
    EC_WORD_BATTLE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SWIMMER_F,
  .name = _("MARCY"),
  .teamFlags = 0x82,
  .greeting = {
   .easyChat = {
    EC_WORD_I_AM,
    EC_WORD_BEAUTIFUL,
    EC_WORD_YOU,
    EC_WORD_CAN_T,
    EC_WORD_BEAT,
    EC_WORD_ME,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_COOL_TRAINER_M,
  .name = _("MILLER"),
  .teamFlags = 0x10,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_BATTLE,
    EC_WORD_DAILY,
    EC_WORD_I,
    EC_WORD_WON_T,
    EC_WORD_LOSE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BIRD_KEEPER,
  .name = _("OLIVER"),
  .teamFlags = 0x11,
  .greeting = {
   .easyChat = {
    EC_WORD_ELLIPSIS_ELLIPSIS_ELLIPSIS,
    EC_WORD_GIGGLE,
    EC_WORD_ELLIPSIS_ELLIPSIS_ELLIPSIS,
    0xFFFF,
    0xFFFF,
    0xFFFF,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_CYCLING_TRIATHLETE_F,
  .name = _("MOLLY"),
  .teamFlags = 0x12,
  .greeting = {
   .easyChat = {
    EC_WORD_HOW,
    EC_WORD_ARE,
    EC_WORD_YOU,
    EC_WORD_ON,
    EC_WORD_MONDAY,
    EC_WORD_MORNING,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BUG_MANIAC,
  .name = _("JASON"),
  .teamFlags = 0x40,
  .greeting = {
   .easyChat = {
    EC_WORD_WATER,
    EC_WORD_AND,
    EC_WORD_BUG,
    EC_WORD_POKEMON,
    EC_WORD_ARE,
    EC_WORD_GREAT,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
  .name = _("AVA"),
  .teamFlags = 0x20,
  .greeting = {
   .easyChat = {
    EC_WORD_WHAT,
    EC_WORD_IS,
    EC_WORD_THIS,
    EC_WORD_PRESSURE,
    EC_WORD_ELLIPSIS,
    EC_WORD_STATIC,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_FISHERMAN,
  .name = _("HANK"),
  .teamFlags = 0x10,
  .greeting = {
   .easyChat = {
    EC_WORD_YOU_RE,
    EC_WORD_A,
    EC_WORD_KID,
    EC_WORD_YOU,
    EC_WORD_CAN_T,
    EC_WORD_WIN,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SAILOR,
  .name = _("PETER"),
  .teamFlags = 0x20,
  .greeting = {
   .easyChat = {
    EC_WORD_IT_S,
    EC_WORD_SERIOUSLY,
    EC_WORD_TERRIBLE,
    EC_WORD_I,
    EC_WORD_REALLY,
    EC_WORD_THINK,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_EXPERT_F,
  .name = _("MINDY"),
  .teamFlags = 0x20,
  .greeting = {
   .easyChat = {
    EC_WORD_YOU,
    EC_WORD_APPEAR,
    EC_WORD_TO,
    EC_WORD_TRAIN,
    EC_WORD_VERY,
    EC_WORD_WELL,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BUG_MANIAC,
  .name = _("DWIGHT"),
  .teamFlags = 0x11,
  .greeting = {
   .easyChat = {
    EC_WORD_ARE,
    EC_WORD_YOU,
    EC_WORD_STRONG,
    EC_WORD_YOU,
    EC_WORD_ARE,
    EC_WORD_SCARY,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEMON_BREEDER_F,
  .name = _("REENA"),
  .teamFlags = 0x12,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_ALWAYS,
    EC_WORD_LOSE,
    EC_WORD_MAYBE,
    EC_WORD_TODAY,
    EC_WORD_ELLIPSIS,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_PARASOL_LADY,
  .name = _("MEGAN"),
  .teamFlags = 0x10,
  .greeting = {
   .easyChat = {
    EC_WORD_DON_T,
    EC_WORD_MAKE,
    EC_WORD_THAT,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_SCARY_FACE),
    EC_WORD_AT,
    EC_WORD_ME,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_RUNNING_TRIATHLETE_F,
  .name = _("SIERRA"),
  .teamFlags = 0x04,
  .greeting = {
   .easyChat = {
    EC_WORD_I_VE,
    EC_WORD_RUN,
    EC_WORD_A_LOT,
    EC_WORD_SO,
    EC_WORD_I_AM,
    EC_WORD_HEALTHY,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEMON_RANGER_M,
  .name = _("ARNOLD"),
  .teamFlags = 0x08,
  .greeting = {
   .easyChat = {
    EC_WORD_I_AM,
    EC_WORD_FEELING,
    EC_WORD_AWESOME,
    EC_WORD_MY,
    EC_WORD_POKEMON,
    EC_WORD_ROCK,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BLACK_BELT,
  .name = _("XIN"),
  .teamFlags = 0x04,
  .greeting = {
   .easyChat = {
    EC_WORD_HOO_HAH,
    EC_WORD_ARE,
    EC_WORD_YOU,
    EC_WORD_READY,
    EC_WORD_TO,
    EC_WORD_ROCK,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_COOL_TRAINER_F,
  .name = _("KELLY"),
  .teamFlags = 0x02,
  .greeting = {
   .easyChat = {
    EC_WORD_YOU,
    EC_WORD_COULDN_T,
    EC_WORD_BEAT,
    EC_WORD_ME,
    EC_WORD_EVER,
    EC_WORD_KID,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_COLLECTOR,
  .name = _("VANCE"),
  .teamFlags = 0x80,
  .greeting = {
   .easyChat = {
    EC_WORD_POKEMON,
    EC_WORD_ALL,
    EC_WORD_OVER,
    EC_WORD_THE,
    EC_WORD_PLACE,
    EC_WORD_WOWEE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_SWIMMING_TRIATHLETE_M,
  .name = _("TOBY"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_THIS,
    EC_WORD_ISN_T,
    EC_WORD_SPORTS,
    EC_WORD_IT_S,
    EC_WORD_A,
    EC_WORD_BATTLE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_GENTLEMAN,
  .name = _("NORTON"),
  .teamFlags = 0x20,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_HAVE,
    EC_WORD_TO,
    EC_WORD_WIN,
    EC_WORD_PLEASE,
    EC_WORD_LOSE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BATTLE_GIRL,
  .name = _("ZOE"),
  .teamFlags = 0x02,
  .greeting = {
   .easyChat = {
    EC_WORD_THIS,
    EC_WORD_IS,
    EC_WORD_SCARY,
    EC_WORD_PLEASE,
    EC_WORD_BE,
    EC_WORD_NICE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_BEAUTY,
  .name = _("EMMA"),
  .teamFlags = 0x20,
  .greeting = {
   .easyChat = {
    EC_WORD_DON_T,
    EC_WORD_YOU,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_FLAIL),
    EC_WORD_YOU,
    EC_WORD_CAN_T,
    ((EC_GROUP_MOVE_1 << 9) | MOVE_WITHDRAW),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_HIKER,
  .name = _("VINCE"),
  .teamFlags = 0x04,
  .greeting = {
   .easyChat = {
    EC_WORD_YAHOO,
    EC_WORD_YAHOO,
    EC_WORD_ARE,
    EC_WORD_YOU,
    EC_WORD_LISTENING,
    EC_WORD_QUES,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_EXPERT_M,
  .name = _("MARV"),
  .teamFlags = 0x10,
  .greeting = {
   .easyChat = {
    EC_WORD_LEARN,
    EC_WORD_TO,
    EC_WORD_BATTLE,
    EC_WORD_THE,
    EC_WORD_CORRECT,
    EC_WORD_WAY,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_POKEMON_BREEDER_M,
  .name = _("TODD"),
  .teamFlags = 0x40,
  .greeting = {
   .easyChat = {
    EC_WORD_THE,
    EC_WORD_WAY,
    EC_WORD_YOU,
    EC_WORD_BATTLE,
    EC_WORD_IT_S,
    EC_WORD_CHILD_S_PLAY,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_GUITARIST,
  .name = _("GAVIN"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_BABY,
    EC_WORD_BABY,
    EC_WORD_BABY,
    EC_WORD_ROCK,
    EC_WORD_ME,
    EC_WORD_HARD,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_PSYCHIC_M,
  .name = _("QUINN"),
  .teamFlags = 0x08,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_HAVE,
    EC_WORD_A,
    EC_WORD_STICKY_HOLD,
    EC_WORD_ON,
    EC_WORD_YOU,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_COOL_TRAINER_F,
  .name = _("JENN"),
  .teamFlags = 0x02,
  .greeting = {
   .easyChat = {
    EC_WORD_I_AM,
    EC_WORD_ON,
    EC_WORD_A,
    EC_WORD_TOUGH,
    EC_WORD_TRAINER,
    EC_WORD_SEARCH,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_EXPERT_M,
  .name = _("JOEL"),
  .teamFlags = 0x10,
  .greeting = {
   .easyChat = {
    EC_WORD_BELIEVE,
    EC_WORD_IN,
    EC_WORD_YOUR,
    EC_WORD_POKEMON,
    EC_WORD_AND,
    EC_WORD_WIN,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_DRAGON_TAMER,
  .name = _("KYLE"),
  .teamFlags = 0x0C,
  .greeting = {
   .easyChat = {
    EC_WORD_I,
    EC_WORD_LIKE,
    EC_WORD_A,
    EC_WORD_GIRL,
    EC_WORD_WITH,
    ((EC_GROUP_MOVE_2 << 9) | MOVE_FORESIGHT),
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_COOL_TRAINER_M,
  .name = _("BRET"),
  .teamFlags = 0x01,
  .greeting = {
   .easyChat = {
    EC_WORD_TAKE,
    EC_WORD_MY,
    EC_WORD_OVERWHELMING,
    EC_WORD_POWER,
    EC_WORD_AND,
    EC_WORD_DISAPPEAR,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_EXPERT_F,
  .name = _("CARRIE"),
  .teamFlags = 0x10,
  .greeting = {
   .easyChat = {
    EC_WORD_TRAINER,
    EC_WORD_I,
    EC_WORD_SEE,
    EC_WORD_YOU,
    EC_WORD_ARE,
    EC_WORD_CAPABLE,
   },
  },
 },
 {
  .trainerClass = TRAINER_CLASS_LADY,
  .name = _("GILLIAN"),
  .teamFlags = 0x02,
  .greeting = {
   .easyChat = {
    EC_WORD_COME_ON,
    EC_WORD_SHOW,
    EC_WORD_ME,
    EC_WORD_AN,
    EC_WORD_EXCELLENT,
    EC_WORD_TIME,
   },
  },
 },
};
# 30 "src/field/battle_tower.c" 2

static const u16 sBattleTowerHeldItems[] = {
    ITEM_NONE,
    ITEM_KINGS_ROCK,
    ITEM_SITRUS_BERRY,
    ITEM_ORAN_BERRY,
    ITEM_CHESTO_BERRY,
    ITEM_HARD_STONE,
    ITEM_FOCUS_BAND,
    ITEM_PERSIM_BERRY,
    ITEM_MIRACLE_SEED,
    ITEM_BERRY_JUICE,
    ITEM_MACHO_BRACE,
    ITEM_SILVER_POWDER,
    ITEM_CHERI_BERRY,
    ITEM_BLACK_GLASSES,
    ITEM_BLACK_BELT,
    ITEM_SOUL_DEW,
    ITEM_CHOICE_BAND,
    ITEM_MAGNET,
    ITEM_SILK_SCARF,
    ITEM_WHITE_HERB,
    ITEM_DEEP_SEA_SCALE,
    ITEM_DEEP_SEA_TOOTH,
    ITEM_MYSTIC_WATER,
    ITEM_SHARP_BEAK,
    ITEM_QUICK_CLAW,
    ITEM_LEFTOVERS,
    ITEM_RAWST_BERRY,
    ITEM_LIGHT_BALL,
    ITEM_POISON_BARB,
    ITEM_NEVER_MELT_ICE,
    ITEM_ASPEAR_BERRY,
    ITEM_SPELL_TAG,
    ITEM_BRIGHT_POWDER,
    ITEM_LEPPA_BERRY,
    ITEM_SCOPE_LENS,
    ITEM_TWISTED_SPOON,
    ITEM_METAL_COAT,
    ITEM_MENTAL_HERB,
    ITEM_CHARCOAL,
    ITEM_PECHA_BERRY,
    ITEM_SOFT_SAND,
    ITEM_LUM_BERRY,
    ITEM_DRAGON_SCALE,
    ITEM_DRAGON_FANG,
    ITEM_IAPAPA_BERRY,
    ITEM_WIKI_BERRY,
    ITEM_SEA_INCENSE,
    ITEM_SHELL_BELL,
    ITEM_SALAC_BERRY,
    ITEM_LANSAT_BERRY,
    ITEM_APICOT_BERRY,
    ITEM_STARF_BERRY,
    ITEM_LIECHI_BERRY,
    ITEM_STICK,
    ITEM_LAX_INCENSE,
    ITEM_AGUAV_BERRY,
    ITEM_FIGY_BERRY,
    ITEM_THICK_CLUB,
    ITEM_MAGO_BERRY,
    ITEM_METAL_POWDER,
    ITEM_PETAYA_BERRY,
    ITEM_LUCKY_PUNCH,
    ITEM_GANLON_BERRY,
};

# 1 "src/field/../data/battle_tower/level_50_mons.h" 1
const struct BattleTowerPokemon gBattleTowerLevel50Mons[] =
{
 {
  .species = SPECIES_PIKACHU,
  .heldItem = BATTLE_TOWER_ITEM_ORAN_BERRY,
  .teamFlags = 0x42,
  .moves = {
   MOVE_QUICK_ATTACK,
   MOVE_THUNDER_WAVE,
   MOVE_THUNDER_SHOCK,
   MOVE_GROWL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_BEAUTIFLY,
  .heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
  .teamFlags = 0x41,
  .moves = {
   MOVE_ABSORB,
   MOVE_STUN_SPORE,
   MOVE_GUST,
   MOVE_SAFEGUARD
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_SWELLOW,
  .heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
  .teamFlags = 0x07,
  .moves = {
   MOVE_PECK,
   MOVE_WING_ATTACK,
   MOVE_AERIAL_ACE,
   MOVE_AGILITY
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_WALREIN,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_HAIL,
   MOVE_ENCORE,
   MOVE_ICE_BALL,
   MOVE_TOXIC
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_SEAKING,
  .heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
  .teamFlags = 0x07,
  .moves = {
   MOVE_PECK,
   MOVE_FLAIL,
   MOVE_FURY_ATTACK,
   MOVE_SURF
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_TORCHIC,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x42,
  .moves = {
   MOVE_FIRE_SPIN,
   MOVE_PROTECT,
   MOVE_SAND_ATTACK,
   MOVE_SLASH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_MASQUERAIN,
  .heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
  .teamFlags = 0x41,
  .moves = {
   MOVE_STUN_SPORE,
   MOVE_WATER_SPORT,
   MOVE_QUICK_ATTACK,
   MOVE_GUST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_ILLUMISE,
  .heldItem = BATTLE_TOWER_ITEM_NONE,
  .teamFlags = 0x41,
  .moves = {
   MOVE_FLATTER,
   MOVE_COVET,
   MOVE_WISH,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_DELCATTY,
  .heldItem = BATTLE_TOWER_ITEM_SILK_SCARF,
  .teamFlags = 0x42,
  .moves = {
   MOVE_ATTRACT,
   MOVE_TAIL_WHIP,
   MOVE_FAINT_ATTACK,
   MOVE_DIG
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LONELY,
 },
 {
  .species = SPECIES_KECLEON,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_TAIL_WHIP,
   MOVE_SLASH,
   MOVE_LICK,
   MOVE_SCREECH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_MIGHTYENA,
  .heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_BITE,
   MOVE_TAKE_DOWN,
   MOVE_ROAR,
   MOVE_HOWL
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SLAKING,
  .heldItem = BATTLE_TOWER_ITEM_BLACK_GLASSES,
  .teamFlags = 0x05,
  .moves = {
   MOVE_FAINT_ATTACK,
   MOVE_COUNTER,
   MOVE_SCRATCH,
   MOVE_TAUNT
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_MACHOKE,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_LEER,
   MOVE_DIG,
   MOVE_LOW_KICK,
   MOVE_FOCUS_PUNCH
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_RHYDON,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_STRENGTH,
   MOVE_ROCK_TOMB,
   MOVE_STOMP,
   MOVE_ROCK_SMASH
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_QUIRKY,
 },
 {
  .species = SPECIES_CACTURNE,
  .heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_POISON_STING,
   MOVE_GROWTH,
   MOVE_ABSORB,
   MOVE_SOLAR_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ZIGZAGOON,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_FLAIL,
   MOVE_SAND_ATTACK,
   MOVE_REST,
   MOVE_SURF
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_DODRIO,
  .heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
  .teamFlags = 0x03,
  .moves = {
   MOVE_PURSUIT,
   MOVE_TRI_ATTACK,
   MOVE_GROWL,
   MOVE_AGILITY
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_WHISCASH,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_WATER_GUN,
   MOVE_AMNESIA,
   MOVE_MAGNITUDE,
   MOVE_MUD_SLAP
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_NINJASK,
  .heldItem = BATTLE_TOWER_ITEM_SILVER_POWDER,
  .teamFlags = 0x41,
  .moves = {
   MOVE_SAND_ATTACK,
   MOVE_FURY_CUTTER,
   MOVE_AGILITY,
   MOVE_HARDEN
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_DUSCLOPS,
  .heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_PROTECT,
   MOVE_NIGHT_SHADE,
   MOVE_ASTONISH,
   MOVE_WILL_O_WISP
  },
  .evSpread = F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_CAMERUPT,
  .heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
  .teamFlags = 0x07,
  .moves = {
   MOVE_DIG,
   MOVE_EMBER,
   MOVE_GROWL,
   MOVE_ROCK_SMASH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_SPINDA,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0x4A,
  .moves = {
   MOVE_TEETER_DANCE,
   MOVE_FLAIL,
   MOVE_PSYCH_UP,
   MOVE_DOUBLE_EDGE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_CALM,
 },
 {
  .species = SPECIES_SEVIPER,
  .heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
  .teamFlags = 0x09,
  .moves = {
   MOVE_SCREECH,
   MOVE_GLARE,
   MOVE_DIG,
   MOVE_POISON_FANG
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_FLYGON,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x49,
  .moves = {
   MOVE_SAND_ATTACK,
   MOVE_SAND_TOMB,
   MOVE_FACADE,
   MOVE_TOXIC
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_AZUMARILL,
  .heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
  .teamFlags = 0x42,
  .moves = {
   MOVE_BUBBLE_BEAM,
   MOVE_TAIL_WHIP,
   MOVE_RAIN_DANCE,
   MOVE_ROLLOUT
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ZANGOOSE,
  .heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
  .teamFlags = 0x07,
  .moves = {
   MOVE_STRENGTH,
   MOVE_TAUNT,
   MOVE_CRUSH_CLAW,
   MOVE_DETECT
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MEDICHAM,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x07,
  .moves = {
   MOVE_REVERSAL,
   MOVE_MEDITATE,
   MOVE_CONFUSION,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_ROSELIA,
  .heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_GROWTH,
   MOVE_MEGA_DRAIN,
   MOVE_TOXIC,
   MOVE_CUT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_SWALOT,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_STOCKPILE,
   MOVE_SPIT_UP,
   MOVE_SLUDGE,
   MOVE_POISON_GAS
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MAGNETON,
  .heldItem = BATTLE_TOWER_ITEM_MAGNET,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_SUPERSONIC,
   MOVE_THUNDER_WAVE,
   MOVE_SCREECH,
   MOVE_TRI_ATTACK
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_GARDEVOIR,
  .heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
  .teamFlags = 0x09,
  .moves = {
   MOVE_CONFUSION,
   MOVE_TOXIC,
   MOVE_TORMENT,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_RELICANTH,
  .heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
  .teamFlags = 0x01,
  .moves = {
   MOVE_SURF,
   MOVE_ANCIENT_POWER,
   MOVE_ROCK_TOMB,
   MOVE_HARDEN
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_NINETALES,
  .heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
  .teamFlags = 0x03,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_FIRE_SPIN,
   MOVE_QUICK_ATTACK,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_SHARPEDO,
  .heldItem = BATTLE_TOWER_ITEM_BLACK_GLASSES,
  .teamFlags = 0x05,
  .moves = {
   MOVE_BITE,
   MOVE_SKULL_BASH,
   MOVE_RAIN_DANCE,
   MOVE_SURF
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_GIRAFARIG,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x03,
  .moves = {
   MOVE_STRENGTH,
   MOVE_PSYBEAM,
   MOVE_AGILITY,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_PELIPPER,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_MIST,
   MOVE_STOCKPILE,
   MOVE_SWALLOW,
   MOVE_SPIT_UP
  },
  .evSpread = F_EV_SPREAD_DEFENSE,
  .nature = NATURE_QUIRKY,
 },
 {
  .species = SPECIES_SABLEYE,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0x09,
  .moves = {
   MOVE_SHADOW_BALL,
   MOVE_NIGHT_SHADE,
   MOVE_SNATCH,
   MOVE_FAKE_OUT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_LUNATONE,
  .heldItem = BATTLE_TOWER_ITEM_HARD_STONE,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_COSMIC_POWER,
   MOVE_SANDSTORM,
   MOVE_PSYCHIC,
   MOVE_ROCK_THROW
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_LUDICOLO,
  .heldItem = BATTLE_TOWER_ITEM_NONE,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_THIEF,
   MOVE_FAKE_OUT,
   MOVE_SURF,
   MOVE_RAIN_DANCE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_GRUMPIG,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_ODOR_SLEUTH,
   MOVE_CONFUSE_RAY,
   MOVE_MAGIC_COAT,
   MOVE_PSYCHIC
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_CUT,
   MOVE_LEECH_SEED,
   MOVE_MEGA_DRAIN,
   MOVE_STUN_SPORE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_WAILORD,
  .heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
  .teamFlags = 0x03,
  .moves = {
   MOVE_WATER_SPOUT,
   MOVE_ROLLOUT,
   MOVE_MIST,
   MOVE_RAIN_DANCE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_WEEZING,
  .heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
  .teamFlags = 0x05,
  .moves = {
   MOVE_SMOG,
   MOVE_SELF_DESTRUCT,
   MOVE_TOXIC,
   MOVE_SLUDGE_BOMB
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_KADABRA,
  .heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_FUTURE_SIGHT,
   MOVE_FOCUS_PUNCH,
   MOVE_SKILL_SWAP,
   MOVE_SNATCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_MAGNET,
  .teamFlags = 0x07,
  .moves = {
   MOVE_THUNDER_WAVE,
   MOVE_BITE,
   MOVE_SPARK,
   MOVE_QUICK_ATTACK
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_RAICHU,
  .heldItem = BATTLE_TOWER_ITEM_ASPEAR_BERRY,
  .teamFlags = 0x03,
  .moves = {
   MOVE_QUICK_ATTACK,
   MOVE_AGILITY,
   MOVE_LIGHT_SCREEN,
   MOVE_THUNDERBOLT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_XATU,
  .heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
  .teamFlags = 0x03,
  .moves = {
   MOVE_NIGHT_SHADE,
   MOVE_PECK,
   MOVE_CONFUSE_RAY,
   MOVE_FUTURE_SIGHT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_LOUDRED,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_UPROAR,
   MOVE_STOMP,
   MOVE_SCREECH,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_MODEST,
 },
 {
  .species = SPECIES_SOLROCK,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x03,
  .moves = {
   MOVE_ROCK_THROW,
   MOVE_SUNNY_DAY,
   MOVE_SOLAR_BEAM,
   MOVE_SANDSTORM
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_MILD,
 },
 {
  .species = SPECIES_CLAYDOL,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x03,
  .moves = {
   MOVE_SANDSTORM,
   MOVE_REFLECT,
   MOVE_ROCK_TOMB,
   MOVE_STRENGTH
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_CRAWDAUNT,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x03,
  .moves = {
   MOVE_WATER_PULSE,
   MOVE_KNOCK_OFF,
   MOVE_HARDEN,
   MOVE_CUT
  },
  .evSpread = F_EV_SPREAD_HP,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_GOLBAT,
  .heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
  .teamFlags = 0x09,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_WING_ATTACK,
   MOVE_MEAN_LOOK,
   MOVE_BITE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_BELLOSSOM,
  .heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_SOLAR_BEAM,
   MOVE_PETAL_DANCE,
   MOVE_SWEET_SCENT,
   MOVE_BULLET_SEED
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_DONPHAN,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x05,
  .moves = {
   MOVE_ROCK_SMASH,
   MOVE_RAPID_SPIN,
   MOVE_FLAIL,
   MOVE_HORN_ATTACK
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_NOSEPASS,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_SANDSTORM,
   MOVE_ROCK_SLIDE,
   MOVE_BLOCK,
   MOVE_THUNDER_WAVE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_PINSIR,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_SWORDS_DANCE,
   MOVE_HARDEN,
   MOVE_CUT,
   MOVE_SEISMIC_TOSS
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_GOLDUCK,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_DISABLE,
   MOVE_PSYCH_UP,
   MOVE_WATER_PULSE,
   MOVE_BRICK_BREAK
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SHIFTRY,
  .heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
  .teamFlags = 0x07,
  .moves = {
   MOVE_TORMENT,
   MOVE_EXTRASENSORY,
   MOVE_SOLAR_BEAM,
   MOVE_AERIAL_ACE
  },
  .evSpread = F_EV_SPREAD_DEFENSE,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_DUSTOX,
  .heldItem = BATTLE_TOWER_ITEM_SILVER_POWDER,
  .teamFlags = 0x01,
  .moves = {
   MOVE_CONFUSION,
   MOVE_SILVER_WIND,
   MOVE_PSYBEAM,
   MOVE_WHIRLWIND
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_SHUPPET,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x03,
  .moves = {
   MOVE_WILL_O_WISP,
   MOVE_NIGHT_SHADE,
   MOVE_FAINT_ATTACK,
   MOVE_CURSE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SEAKING,
  .heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
  .teamFlags = 0x07,
  .moves = {
   MOVE_RAIN_DANCE,
   MOVE_SURF,
   MOVE_HORN_ATTACK,
   MOVE_HORN_DRILL
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE,
  .nature = NATURE_LONELY,
 },
 {
  .species = SPECIES_SKARMORY,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x07,
  .moves = {
   MOVE_STEEL_WING,
   MOVE_SAND_ATTACK,
   MOVE_SWIFT,
   MOVE_AGILITY
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_TORKOAL,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x43,
  .moves = {
   MOVE_FLAMETHROWER,
   MOVE_IRON_DEFENSE,
   MOVE_BODY_SLAM,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_GOLEM,
  .heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
  .teamFlags = 0x05,
  .moves = {
   MOVE_MAGNITUDE,
   MOVE_EXPLOSION,
   MOVE_STRENGTH,
   MOVE_SANDSTORM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_GARDEVOIR,
  .heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
  .teamFlags = 0x41,
  .moves = {
   MOVE_REFLECT,
   MOVE_PSYCHIC,
   MOVE_IMPRISON,
   MOVE_TOXIC
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_SANDSLASH,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x07,
  .moves = {
   MOVE_SANDSTORM,
   MOVE_SLASH,
   MOVE_EARTHQUAKE,
   MOVE_SWIFT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_WOBBUFFET,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_COUNTER,
   MOVE_MIRROR_COAT,
   MOVE_SAFEGUARD,
   MOVE_DESTINY_BOND
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_CALM,
 },
 {
  .species = SPECIES_TENTACRUEL,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_CONSTRICT,
   MOVE_SURF,
   MOVE_HYPER_BEAM,
   MOVE_SCREECH
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_TROPIUS,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x05,
  .moves = {
   MOVE_SUNNY_DAY,
   MOVE_SOLAR_BEAM,
   MOVE_SYNTHESIS,
   MOVE_RAZOR_LEAF
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_MAWILE,
  .heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
  .teamFlags = 0x43,
  .moves = {
   MOVE_IRON_DEFENSE,
   MOVE_SLUDGE_BOMB,
   MOVE_CRUNCH,
   MOVE_STRENGTH
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_CALM,
 },
 {
  .species = SPECIES_MUK,
  .heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
  .teamFlags = 0x09,
  .moves = {
   MOVE_SLUDGE,
   MOVE_ACID_ARMOR,
   MOVE_GIGA_DRAIN,
   MOVE_DISABLE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MAGCARGO,
  .heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
  .teamFlags = 0x0D,
  .moves = {
   MOVE_FLAMETHROWER,
   MOVE_ROCK_THROW,
   MOVE_HARDEN,
   MOVE_AMNESIA
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_LINOONE,
  .heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
  .teamFlags = 0x07,
  .moves = {
   MOVE_HEADBUTT,
   MOVE_TAIL_WHIP,
   MOVE_SURF,
   MOVE_DIG
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_QUIRKY,
 },
 {
  .species = SPECIES_ELECTRODE,
  .heldItem = BATTLE_TOWER_ITEM_ASPEAR_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_LIGHT_SCREEN,
   MOVE_THUNDERBOLT,
   MOVE_SWIFT,
   MOVE_ROLLOUT
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_DUSCLOPS,
  .heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
  .teamFlags = 0x09,
  .moves = {
   MOVE_MEAN_LOOK,
   MOVE_NIGHT_SHADE,
   MOVE_SKILL_SWAP,
   MOVE_SHADOW_BALL
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_VILEPLUME,
  .heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_TOXIC,
   MOVE_MOONLIGHT,
   MOVE_GIGA_DRAIN,
   MOVE_STUN_SPORE
  },
  .evSpread = F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_CROBAT,
  .heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_BITE,
   MOVE_HAZE,
   MOVE_WING_ATTACK,
   MOVE_STEEL_WING
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_CORSOLA,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_RECOVER,
   MOVE_MIRROR_COAT,
   MOVE_HAIL,
   MOVE_SURF
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_STARMIE,
  .heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_RAPID_SPIN,
   MOVE_WATER_PULSE,
   MOVE_REFLECT,
   MOVE_SKILL_SWAP
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_EXPLOUD,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x41,
  .moves = {
   MOVE_HYPER_BEAM,
   MOVE_HOWL,
   MOVE_UPROAR,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_PSYBEAM,
   MOVE_SNATCH,
   MOVE_REFLECT,
   MOVE_HYPER_BEAM
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_HERACROSS,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x05,
  .moves = {
   MOVE_HORN_ATTACK,
   MOVE_COUNTER,
   MOVE_REVERSAL,
   MOVE_LEER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_CASTFORM,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_WEATHER_BALL,
   MOVE_SUNNY_DAY,
   MOVE_RAIN_DANCE,
   MOVE_HAIL
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_VIGOROTH,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x05,
  .moves = {
   MOVE_FOCUS_PUNCH,
   MOVE_REVERSAL,
   MOVE_COUNTER,
   MOVE_TAUNT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_DUSKULL,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x09,
  .moves = {
   MOVE_TOXIC,
   MOVE_CONFUSE_RAY,
   MOVE_SHADOW_BALL,
   MOVE_WILL_O_WISP
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_LANTURN,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x07,
  .moves = {
   MOVE_FLAIL,
   MOVE_SURF,
   MOVE_SPARK,
   MOVE_TAKE_DOWN
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x05,
  .moves = {
   MOVE_STRENGTH,
   MOVE_FAKE_OUT,
   MOVE_FACADE,
   MOVE_SAND_ATTACK
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_KINGDRA,
  .heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
  .teamFlags = 0x43,
  .moves = {
   MOVE_AGILITY,
   MOVE_DIVE,
   MOVE_ICE_BEAM,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_GYARADOS,
  .heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
  .teamFlags = 0x41,
  .moves = {
   MOVE_RAIN_DANCE,
   MOVE_SURF,
   MOVE_WATER_PULSE,
   MOVE_HYPER_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_AGGRON,
  .heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
  .teamFlags = 0x45,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_BRICK_BREAK,
   MOVE_METAL_CLAW,
   MOVE_ROAR
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_ABSOL,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0xC7,
  .moves = {
   MOVE_SWORDS_DANCE,
   MOVE_IRON_TAIL,
   MOVE_SLASH,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_SWELLOW,
  .heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
  .teamFlags = 0x0F,
  .moves = {
   MOVE_DOUBLE_TEAM,
   MOVE_FLY,
   MOVE_TOXIC,
   MOVE_STEEL_WING
  },
  .evSpread = 0,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_BLACK_BELT,
  .teamFlags = 0x05,
  .moves = {
   MOVE_STRENGTH,
   MOVE_CROSS_CHOP,
   MOVE_EARTHQUAKE,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
  .teamFlags = 0x41,
  .moves = {
   MOVE_PROTECT,
   MOVE_ICE_BEAM,
   MOVE_HYPER_BEAM,
   MOVE_SURF
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
  .teamFlags = 0x41,
  .moves = {
   MOVE_LEAF_BLADE,
   MOVE_DRAGON_CLAW,
   MOVE_AGILITY,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
  .teamFlags = 0x41,
  .moves = {
   MOVE_BLAZE_KICK,
   MOVE_MIRROR_MOVE,
   MOVE_EARTHQUAKE,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_ALTARIA,
  .heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
  .teamFlags = 0x43,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_DRAGON_DANCE,
   MOVE_TOXIC,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_LUDICOLO,
  .heldItem = BATTLE_TOWER_ITEM_BLACK_BELT,
  .teamFlags = 0x43,
  .moves = {
   MOVE_BRICK_BREAK,
   MOVE_WATER_PULSE,
   MOVE_RAIN_DANCE,
   MOVE_FOCUS_PUNCH
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_SABLEYE,
  .heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
  .teamFlags = 0x49,
  .moves = {
   MOVE_SHADOW_BALL,
   MOVE_SNATCH,
   MOVE_DIG,
   MOVE_CONFUSE_RAY
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ZANGOOSE,
  .heldItem = BATTLE_TOWER_ITEM_BLACK_GLASSES,
  .teamFlags = 0x0F,
  .moves = {
   MOVE_FACADE,
   MOVE_THUNDERBOLT,
   MOVE_CRUSH_CLAW,
   MOVE_DETECT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_CALM,
 },
 {
  .species = SPECIES_LINOONE,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x0F,
  .moves = {
   MOVE_IRON_TAIL,
   MOVE_HEADBUTT,
   MOVE_ATTRACT,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WHISCASH,
  .heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
  .teamFlags = 0x07,
  .moves = {
   MOVE_MUD_SLAP,
   MOVE_EARTHQUAKE,
   MOVE_SURF,
   MOVE_AMNESIA
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_SOLROCK,
  .heldItem = BATTLE_TOWER_ITEM_HARD_STONE,
  .teamFlags = 0x43,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_LIGHT_SCREEN,
   MOVE_ROCK_SLIDE,
   MOVE_CONFUSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_STARMIE,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x03,
  .moves = {
   MOVE_RECOVER,
   MOVE_RAIN_DANCE,
   MOVE_SURF,
   MOVE_CONFUSE_RAY
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_CACTURNE,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x0F,
  .moves = {
   MOVE_INGRAIN,
   MOVE_LEECH_SEED,
   MOVE_PROTECT,
   MOVE_FRUSTRATION
  },
  .evSpread = 0,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SHIFTRY,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x05,
  .moves = {
   MOVE_FRUSTRATION,
   MOVE_HYPER_BEAM,
   MOVE_GIGA_DRAIN,
   MOVE_TORMENT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_MAGNET,
  .teamFlags = 0x0F,
  .moves = {
   MOVE_THUNDER,
   MOVE_THUNDER_WAVE,
   MOVE_IRON_TAIL,
   MOVE_ROAR
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_KECLEON,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0xC3,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_FOCUS_PUNCH,
   MOVE_IRON_TAIL,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_PINSIR,
  .heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
  .teamFlags = 0x8D,
  .moves = {
   MOVE_GUILLOTINE,
   MOVE_SUBMISSION,
   MOVE_EARTHQUAKE,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_METANG,
  .heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
  .teamFlags = 0x05,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_SHADOW_BALL,
   MOVE_PSYCHIC,
   MOVE_METEOR_MASH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_CLAYDOL,
  .heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
  .teamFlags = 0x43,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_SELF_DESTRUCT,
   MOVE_SANDSTORM,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_MASQUERAIN,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_TOXIC,
   MOVE_SILVER_WIND,
   MOVE_ATTRACT,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_RELICANTH,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0xC5,
  .moves = {
   MOVE_ROCK_TOMB,
   MOVE_DOUBLE_EDGE,
   MOVE_SURF,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WALREIN,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x0D,
  .moves = {
   MOVE_SURF,
   MOVE_ENCORE,
   MOVE_BLIZZARD,
   MOVE_HYPER_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WAILORD,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_WATER_SPOUT,
   MOVE_REST,
   MOVE_AMNESIA,
   MOVE_HAIL
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_GIRAFARIG,
  .heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
  .teamFlags = 0x4F,
  .moves = {
   MOVE_DOUBLE_TEAM,
   MOVE_CRUNCH,
   MOVE_PSYCHIC,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MEDICHAM,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0x4B,
  .moves = {
   MOVE_CALM_MIND,
   MOVE_REVERSAL,
   MOVE_ROCK_TOMB,
   MOVE_PSYCHIC
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_TROPIUS,
  .heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
  .teamFlags = 0xC7,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_SYNTHESIS,
   MOVE_RAZOR_LEAF,
   MOVE_HYPER_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_NINJASK,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x05,
  .moves = {
   MOVE_DOUBLE_TEAM,
   MOVE_SLASH,
   MOVE_SWORDS_DANCE,
   MOVE_LEECH_LIFE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_CAMERUPT,
  .heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
  .teamFlags = 0x0D,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_OVERHEAT,
   MOVE_SUNNY_DAY,
   MOVE_ROCK_SLIDE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_SHARPEDO,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x05,
  .moves = {
   MOVE_CRUNCH,
   MOVE_SURF,
   MOVE_EARTHQUAKE,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WIGGLYTUFF,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x0E,
  .moves = {
   MOVE_PROTECT,
   MOVE_TOXIC,
   MOVE_DOUBLE_TEAM,
   MOVE_DIG
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_SEVIPER,
  .heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
  .teamFlags = 0x05,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_HAZE,
   MOVE_CRUNCH,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_CRADILY,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0xC1,
  .moves = {
   MOVE_ROCK_TOMB,
   MOVE_CONFUSE_RAY,
   MOVE_INGRAIN,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ARMALDO,
  .heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
  .teamFlags = 0xC1,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_SANDSTORM,
   MOVE_PROTECT,
   MOVE_SLASH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MAGNETON,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x0D,
  .moves = {
   MOVE_ZAP_CANNON,
   MOVE_SUPERSONIC,
   MOVE_TOXIC,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_LANTURN,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x06,
  .moves = {
   MOVE_THUNDER,
   MOVE_SURF,
   MOVE_ICE_BEAM,
   MOVE_RAIN_DANCE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_SWALOT,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0x8B,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_SNATCH,
   MOVE_ENCORE,
   MOVE_BODY_SLAM
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SKARMORY,
  .heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
  .teamFlags = 0x81,
  .moves = {
   MOVE_STEEL_WING,
   MOVE_AGILITY,
   MOVE_TORMENT,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_DONPHAN,
  .heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
  .teamFlags = 0x0D,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_FLAIL,
   MOVE_ROAR,
   MOVE_IRON_TAIL
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_HERACROSS,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x41,
  .moves = {
   MOVE_FACADE,
   MOVE_REVERSAL,
   MOVE_MEGAHORN,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_BANETTE,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x83,
  .moves = {
   MOVE_SHADOW_BALL,
   MOVE_HYPER_BEAM,
   MOVE_THUNDERBOLT,
   MOVE_SKILL_SWAP
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_SANDSLASH,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x0F,
  .moves = {
   MOVE_SANDSTORM,
   MOVE_TOXIC,
   MOVE_SLASH,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_CRAWDAUNT,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x05,
  .moves = {
   MOVE_GUILLOTINE,
   MOVE_CRABHAMMER,
   MOVE_BLIZZARD,
   MOVE_SLUDGE_BOMB
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_GRUMPIG,
  .heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
  .teamFlags = 0x8B,
  .moves = {
   MOVE_MAGIC_COAT,
   MOVE_PSYCHIC,
   MOVE_REFLECT,
   MOVE_CONFUSE_RAY
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_LONELY,
 },
 {
  .species = SPECIES_RHYDON,
  .heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
  .teamFlags = 0x45,
  .moves = {
   MOVE_IRON_TAIL,
   MOVE_EARTHQUAKE,
   MOVE_SURF,
   MOVE_FIRE_BLAST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x8B,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_REFLECT,
   MOVE_RECOVER,
   MOVE_SKILL_SWAP
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_DUSCLOPS,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x41,
  .moves = {
   MOVE_SHADOW_BALL,
   MOVE_WILL_O_WISP,
   MOVE_BLIZZARD,
   MOVE_PSYCHIC
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_TORKOAL,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x09,
  .moves = {
   MOVE_FLAMETHROWER,
   MOVE_AMNESIA,
   MOVE_IRON_TAIL,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_ELECTRODE,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x09,
  .moves = {
   MOVE_SCREECH,
   MOVE_EXPLOSION,
   MOVE_MIRROR_COAT,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_IRON_TAIL,
   MOVE_FOCUS_PUNCH,
   MOVE_DOUBLE_TEAM,
   MOVE_LEECH_SEED
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_MUK,
  .heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
  .teamFlags = 0x05,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_THUNDERBOLT,
   MOVE_FLAMETHROWER,
   MOVE_FOCUS_PUNCH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_WEEZING,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x05,
  .moves = {
   MOVE_EXPLOSION,
   MOVE_SLUDGE_BOMB,
   MOVE_SHADOW_BALL,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_RAICHU,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x4E,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_DOUBLE_TEAM,
   MOVE_FOCUS_PUNCH,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_TENTACRUEL,
  .heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
  .teamFlags = 0x09,
  .moves = {
   MOVE_DOUBLE_TEAM,
   MOVE_TOXIC,
   MOVE_SURF,
   MOVE_SLUDGE_BOMB
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_EXPLOUD,
  .heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
  .teamFlags = 0x05,
  .moves = {
   MOVE_BLIZZARD,
   MOVE_FLAMETHROWER,
   MOVE_EARTHQUAKE,
   MOVE_RETURN
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_XATU,
  .heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
  .teamFlags = 0x43,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_REST,
   MOVE_CONFUSE_RAY,
   MOVE_TOXIC
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_GOLEM,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_EXPLOSION,
   MOVE_EARTHQUAKE,
   MOVE_ROCK_TOMB,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_GOLDUCK,
  .heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
  .teamFlags = 0x83,
  .moves = {
   MOVE_SURF,
   MOVE_ATTRACT,
   MOVE_CALM_MIND,
   MOVE_BLIZZARD
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_NINETALES,
  .heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
  .teamFlags = 0x4A,
  .moves = {
   MOVE_FLAMETHROWER,
   MOVE_ATTRACT,
   MOVE_TOXIC,
   MOVE_CONFUSE_RAY
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_KINGDRA,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x13,
  .moves = {
   MOVE_DOUBLE_TEAM,
   MOVE_REST,
   MOVE_SURF,
   MOVE_DRAGON_BREATH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_SLAKING,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x03,
  .moves = {
   MOVE_CURSE,
   MOVE_AMNESIA,
   MOVE_YAWN,
   MOVE_FOCUS_PUNCH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_GYARADOS,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0x03,
  .moves = {
   MOVE_THUNDER,
   MOVE_EARTHQUAKE,
   MOVE_HYDRO_PUMP,
   MOVE_RAIN_DANCE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x21,
  .moves = {
   MOVE_BELLY_DRUM,
   MOVE_ENDURE,
   MOVE_EARTHQUAKE,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_ABSOL,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0xC3,
  .moves = {
   MOVE_FAINT_ATTACK,
   MOVE_DOUBLE_EDGE,
   MOVE_SHADOW_BALL,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_ALTARIA,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x83,
  .moves = {
   MOVE_DRAGON_DANCE,
   MOVE_MIRROR_MOVE,
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_BLACK_BELT,
  .teamFlags = 0x11,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_FOCUS_PUNCH,
   MOVE_ROCK_TOMB,
   MOVE_ENCORE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_FLYGON,
  .heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
  .teamFlags = 0x43,
  .moves = {
   MOVE_CRUNCH,
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x33,
  .moves = {
   MOVE_COUNTER,
   MOVE_ROCK_SLIDE,
   MOVE_FOCUS_PUNCH,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_GLALIE,
  .heldItem = BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
  .teamFlags = 0x81,
  .moves = {
   MOVE_BLIZZARD,
   MOVE_CRUNCH,
   MOVE_ICY_WIND,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_HUNTAIL,
  .heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
  .teamFlags = 0xA1,
  .moves = {
   MOVE_RAIN_DANCE,
   MOVE_HYDRO_PUMP,
   MOVE_CRUNCH,
   MOVE_BLIZZARD
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_MILOTIC,
  .heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
  .teamFlags = 0xD3,
  .moves = {
   MOVE_SURF,
   MOVE_ATTRACT,
   MOVE_RECOVER,
   MOVE_TOXIC
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_GOREBYSS,
  .heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
  .teamFlags = 0x83,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_SURF,
   MOVE_BLIZZARD,
   MOVE_SHADOW_BALL
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x53,
  .moves = {
   MOVE_LEAF_BLADE,
   MOVE_ENDEAVOR,
   MOVE_EARTHQUAKE,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x53,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_SURF,
   MOVE_MUD_SHOT,
   MOVE_BLIZZARD
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_AGGRON,
  .heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
  .teamFlags = 0x41,
  .moves = {
   MOVE_DOUBLE_EDGE,
   MOVE_FLAMETHROWER,
   MOVE_IRON_TAIL,
   MOVE_BLIZZARD
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_CRADILY,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0xE1,
  .moves = {
   MOVE_STOCKPILE,
   MOVE_SPIT_UP,
   MOVE_SWALLOW,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_ARMALDO,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0xC1,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_HYPER_BEAM,
   MOVE_SLASH,
   MOVE_SWORDS_DANCE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x82,
  .moves = {
   MOVE_FOCUS_PUNCH,
   MOVE_COUNTER,
   MOVE_MACH_PUNCH,
   MOVE_SNATCH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_LUDICOLO,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x83,
  .moves = {
   MOVE_RAIN_DANCE,
   MOVE_SURF,
   MOVE_PROTECT,
   MOVE_TOXIC
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_SHIFTRY,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x03,
  .moves = {
   MOVE_TORMENT,
   MOVE_FAINT_ATTACK,
   MOVE_SHADOW_BALL,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_TROPIUS,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0xC3,
  .moves = {
   MOVE_SUNNY_DAY,
   MOVE_SYNTHESIS,
   MOVE_SOLAR_BEAM,
   MOVE_LEECH_SEED
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_GRUMPIG,
  .heldItem = BATTLE_TOWER_ITEM_MACHO_BRACE,
  .teamFlags = 0x23,
  .moves = {
   MOVE_TRICK,
   MOVE_SKILL_SWAP,
   MOVE_PSYCHIC,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_TORKOAL,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x81,
  .moves = {
   MOVE_IRON_DEFENSE,
   MOVE_TOXIC,
   MOVE_REST,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_NONE,
  .teamFlags = 0x03,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_CRUNCH,
   MOVE_ROAR,
   MOVE_THIEF
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_PINSIR,
  .heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
  .teamFlags = 0x61,
  .moves = {
   MOVE_GUILLOTINE,
   MOVE_EARTHQUAKE,
   MOVE_DOUBLE_TEAM,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_STARMIE,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x93,
  .moves = {
   MOVE_LIGHT_SCREEN,
   MOVE_THUNDERBOLT,
   MOVE_SURF,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_HERACROSS,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x51,
  .moves = {
   MOVE_MEGAHORN,
   MOVE_REVERSAL,
   MOVE_EARTHQUAKE,
   MOVE_COUNTER
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WALREIN,
  .heldItem = BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
  .teamFlags = 0x83,
  .moves = {
   MOVE_BLIZZARD,
   MOVE_EARTHQUAKE,
   MOVE_SURF,
   MOVE_ROCK_SLIDE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x13,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_RECOVER,
   MOVE_ENCORE,
   MOVE_SNATCH
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_MILOTIC,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0x93,
  .moves = {
   MOVE_SURF,
   MOVE_BLIZZARD,
   MOVE_RECOVER,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_REGICE,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x11,
  .moves = {
   MOVE_REST,
   MOVE_CURSE,
   MOVE_BLIZZARD,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_MILD,
 },
 {
  .species = SPECIES_REGISTEEL,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x11,
  .moves = {
   MOVE_REST,
   MOVE_IRON_DEFENSE,
   MOVE_THUNDERBOLT,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_MILD,
 },
 {
  .species = SPECIES_REGIROCK,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x91,
  .moves = {
   MOVE_ROCK_TOMB,
   MOVE_EARTHQUAKE,
   MOVE_THUNDERBOLT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_DUSCLOPS,
  .heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
  .teamFlags = 0x20,
  .moves = {
   MOVE_SHADOW_BALL,
   MOVE_EARTHQUAKE,
   MOVE_BLIZZARD,
   MOVE_DESTINY_BOND
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_SEAKING,
  .heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
  .teamFlags = 0xB2,
  .moves = {
   MOVE_HORN_DRILL,
   MOVE_AGILITY,
   MOVE_SLEEP_TALK,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_CAMERUPT,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x00,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_ERUPTION,
   MOVE_ROCK_SLIDE,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_LANTURN,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x82,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_SURF,
   MOVE_THUNDER_WAVE,
   MOVE_BLIZZARD
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_WEEZING,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x20,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_THUNDERBOLT,
   MOVE_FIRE_BLAST,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_WHISCASH,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x41,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_SURF,
   MOVE_ROCK_TOMB,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_AGGRON,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x11,
  .moves = {
   MOVE_DOUBLE_EDGE,
   MOVE_EARTHQUAKE,
   MOVE_SURF,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_CACTURNE,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x63,
  .moves = {
   MOVE_DYNAMIC_PUNCH,
   MOVE_COUNTER,
   MOVE_FAINT_ATTACK,
   MOVE_GIGA_DRAIN
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_SHARPEDO,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x01,
  .moves = {
   MOVE_CRUNCH,
   MOVE_DOUBLE_EDGE,
   MOVE_SURF,
   MOVE_SWAGGER
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_ABSOL,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x82,
  .moves = {
   MOVE_DOUBLE_EDGE,
   MOVE_FACADE,
   MOVE_SWORDS_DANCE,
   MOVE_QUICK_ATTACK
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WAILORD,
  .heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
  .teamFlags = 0x23,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_EARTHQUAKE,
   MOVE_ATTRACT,
   MOVE_FISSURE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_TENTACRUEL,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x21,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_SLUDGE_BOMB,
   MOVE_GIGA_DRAIN,
   MOVE_MIRROR_COAT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_LUDICOLO,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0xA2,
  .moves = {
   MOVE_RAIN_DANCE,
   MOVE_SURF,
   MOVE_TOXIC,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WOBBUFFET,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x23,
  .moves = {
   MOVE_ENCORE,
   MOVE_COUNTER,
   MOVE_MIRROR_COAT,
   MOVE_DESTINY_BOND
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_RHYDON,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x21,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_MEGAHORN,
   MOVE_HORN_DRILL,
   MOVE_ROCK_SLIDE
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_GLALIE,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x21,
  .moves = {
   MOVE_CRUNCH,
   MOVE_BLIZZARD,
   MOVE_HAIL,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x13,
  .moves = {
   MOVE_LEAF_BLADE,
   MOVE_EARTHQUAKE,
   MOVE_DRAGON_CLAW,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x17,
  .moves = {
   MOVE_BLAZE_KICK,
   MOVE_ROCK_TOMB,
   MOVE_ENDURE,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x17,
  .moves = {
   MOVE_SURF,
   MOVE_EARTHQUAKE,
   MOVE_MUD_SHOT,
   MOVE_BLIZZARD
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_GARDEVOIR,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x19,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_THUNDERBOLT,
   MOVE_DESTINY_BOND,
   MOVE_WILL_O_WISP
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0xF6,
  .moves = {
   MOVE_SPORE,
   MOVE_FOCUS_PUNCH,
   MOVE_BRICK_BREAK,
   MOVE_SLUDGE_BOMB
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
  .teamFlags = 0x1B,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_THUNDER_PUNCH,
   MOVE_REFLECT,
   MOVE_RECOVER
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_SHIFTRY,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x89,
  .moves = {
   MOVE_FAINT_ATTACK,
   MOVE_SHADOW_BALL,
   MOVE_DOUBLE_TEAM,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x85,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_EARTHQUAKE,
   MOVE_FACADE,
   MOVE_FAKE_OUT
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_CROBAT,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x49,
  .moves = {
   MOVE_ATTRACT,
   MOVE_CONFUSE_RAY,
   MOVE_BITE,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x15,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_FLAMETHROWER,
   MOVE_EARTHQUAKE,
   MOVE_ROCK_SLIDE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x0B,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_THUNDER_WAVE,
   MOVE_ROAR,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_ELECTRODE,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x27,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_PROTECT,
   MOVE_MIRROR_COAT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_MUK,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x05,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_FLAMETHROWER,
   MOVE_THUNDERBOLT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_FLYGON,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x4D,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_FLAMETHROWER,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_STARMIE,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0x1B,
  .moves = {
   MOVE_SURF,
   MOVE_THUNDERBOLT,
   MOVE_RECOVER,
   MOVE_CONFUSE_RAY
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_DODRIO,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x2B,
  .moves = {
   MOVE_DRILL_PECK,
   MOVE_TRI_ATTACK,
   MOVE_AGILITY,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_RAICHU,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_THUNDER_WAVE,
   MOVE_REVERSAL,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_GOLDUCK,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_SURF,
   MOVE_CROSS_CHOP,
   MOVE_ICE_BEAM,
   MOVE_HYPER_BEAM
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_HERACROSS,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x54,
  .moves = {
   MOVE_MEGAHORN,
   MOVE_ROCK_TOMB,
   MOVE_ENDURE,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_WALREIN,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x06,
  .moves = {
   MOVE_SURF,
   MOVE_ICE_BEAM,
   MOVE_EARTHQUAKE,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_KINGDRA,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x1D,
  .moves = {
   MOVE_SURF,
   MOVE_TOXIC,
   MOVE_PROTECT,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_SALAMENCE,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x9C,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_CRUNCH,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_METAGROSS,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x15,
  .moves = {
   MOVE_METEOR_MASH,
   MOVE_PSYCHIC,
   MOVE_EARTHQUAKE,
   MOVE_LIGHT_SCREEN
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_REGIROCK,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0xB5,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_ANCIENT_POWER,
   MOVE_FOCUS_PUNCH,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_REGICE,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x96,
  .moves = {
   MOVE_ICE_BEAM,
   MOVE_THUNDERBOLT,
   MOVE_DOUBLE_TEAM,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_REGISTEEL,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x94,
  .moves = {
   MOVE_METAL_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_THUNDERBOLT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_LATIAS,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x96,
  .moves = {
   MOVE_MIST_BALL,
   MOVE_THUNDERBOLT,
   MOVE_REST,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_MILD,
 },
 {
  .species = SPECIES_LATIOS,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0x95,
  .moves = {
   MOVE_LUSTER_PURGE,
   MOVE_REFLECT,
   MOVE_RECOVER,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_MILOTIC,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x96,
  .moves = {
   MOVE_SURF,
   MOVE_TOXIC,
   MOVE_RECOVER,
   MOVE_MIRROR_COAT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_SLAKING,
  .heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
  .teamFlags = 0x05,
  .moves = {
   MOVE_HYPER_BEAM,
   MOVE_EARTHQUAKE,
   MOVE_NONE,
   MOVE_NONE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x1F,
  .moves = {
   MOVE_GIGA_DRAIN,
   MOVE_DOUBLE_TEAM,
   MOVE_LEECH_SEED,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x17,
  .moves = {
   MOVE_BLAZE_KICK,
   MOVE_EARTHQUAKE,
   MOVE_ROCK_SLIDE,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x17,
  .moves = {
   MOVE_MUDDY_WATER,
   MOVE_MUD_SHOT,
   MOVE_MIRROR_COAT,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_GARDEVOIR,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x7B,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_SHADOW_BALL,
   MOVE_DESTINY_BOND,
   MOVE_SNATCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x56,
  .moves = {
   MOVE_SPORE,
   MOVE_COUNTER,
   MOVE_IRON_TAIL,
   MOVE_GIGA_DRAIN
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_THUNDER_PUNCH,
   MOVE_FIRE_PUNCH,
   MOVE_RECOVER
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x05,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_ROCK_TOMB,
   MOVE_ENDURE,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_GYARADOS,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x0C,
  .moves = {
   MOVE_HYPER_BEAM,
   MOVE_THUNDERBOLT,
   MOVE_EARTHQUAKE,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_CROBAT,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x49,
  .moves = {
   MOVE_TOXIC,
   MOVE_CONFUSE_RAY,
   MOVE_ATTRACT,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x15,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_COUNTER,
   MOVE_EARTHQUAKE,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x63,
  .moves = {
   MOVE_THUNDER,
   MOVE_THUNDER_WAVE,
   MOVE_REST,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_ELECTRODE,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x07,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_SCREECH,
   MOVE_MIRROR_COAT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_MODEST,
 },
 {
  .species = SPECIES_MUK,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x45,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_GIGA_DRAIN,
   MOVE_ROCK_TOMB,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_FLYGON,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x4D,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_IRON_TAIL,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_STARMIE,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x1B,
  .moves = {
   MOVE_LIGHT_SCREEN,
   MOVE_THUNDERBOLT,
   MOVE_SURF,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_NINETALES,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_OVERHEAT,
   MOVE_FLAMETHROWER,
   MOVE_IRON_TAIL
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_GOLEM,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x25,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_ROAR,
   MOVE_FIRE_BLAST,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_GOLDUCK,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x27,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_CROSS_CHOP,
   MOVE_BLIZZARD,
   MOVE_PSYCH_UP
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_HERACROSS,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x55,
  .moves = {
   MOVE_MEGAHORN,
   MOVE_EARTHQUAKE,
   MOVE_COUNTER,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WALREIN,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x36,
  .moves = {
   MOVE_SURF,
   MOVE_BLIZZARD,
   MOVE_ROCK_SLIDE,
   MOVE_SHEER_COLD
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_KINGDRA,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x5C,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_PROTECT,
   MOVE_DRAGON_BREATH,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_SALAMENCE,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x9D,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_FLAMETHROWER,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_METAGROSS,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x15,
  .moves = {
   MOVE_METEOR_MASH,
   MOVE_PSYCHIC,
   MOVE_EARTHQUAKE,
   MOVE_HYPER_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_REGIROCK,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x95,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_ROCK_TOMB,
   MOVE_FACADE,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_REGICE,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x96,
  .moves = {
   MOVE_BLIZZARD,
   MOVE_THUNDERBOLT,
   MOVE_HAIL,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_REGISTEEL,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x94,
  .moves = {
   MOVE_METAL_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_ANCIENT_POWER,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_LATIAS,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0x96,
  .moves = {
   MOVE_MIST_BALL,
   MOVE_REFLECT,
   MOVE_RECOVER,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_LATIOS,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x95,
  .moves = {
   MOVE_LUSTER_PURGE,
   MOVE_ICE_BEAM,
   MOVE_RECOVER,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_MILOTIC,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0xD6,
  .moves = {
   MOVE_SURF,
   MOVE_ICE_BEAM,
   MOVE_RECOVER,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_KECLEON,
  .heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
  .teamFlags = 0x69,
  .moves = {
   MOVE_TRICK,
   MOVE_REST,
   MOVE_IRON_TAIL,
   MOVE_DISABLE
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_QUIRKY,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x5F,
  .moves = {
   MOVE_LEAF_BLADE,
   MOVE_EARTHQUAKE,
   MOVE_REST,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x7F,
  .moves = {
   MOVE_FOCUS_PUNCH,
   MOVE_COUNTER,
   MOVE_SWAGGER,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x57,
  .moves = {
   MOVE_IRON_TAIL,
   MOVE_CURSE,
   MOVE_DOUBLE_TEAM,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_GARDEVOIR,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x3B,
  .moves = {
   MOVE_SHADOW_BALL,
   MOVE_PSYCHIC,
   MOVE_REST,
   MOVE_IMPRISON
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x56,
  .moves = {
   MOVE_SPORE,
   MOVE_FOCUS_PUNCH,
   MOVE_SLUDGE_BOMB,
   MOVE_IRON_TAIL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
  .teamFlags = 0x1A,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_TRICK,
   MOVE_RECOVER,
   MOVE_SNATCH
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x65,
  .moves = {
   MOVE_REVENGE,
   MOVE_COUNTER,
   MOVE_FOCUS_PUNCH,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_LUDICOLO,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x54,
  .moves = {
   MOVE_RAIN_DANCE,
   MOVE_PROTECT,
   MOVE_TOXIC,
   MOVE_SURF
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_CROBAT,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x4B,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_BITE,
   MOVE_AIR_CUTTER,
   MOVE_SHADOW_BALL
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x75,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_ROCK_SLIDE,
   MOVE_DYNAMIC_PUNCH,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_THUNDER_WAVE,
   MOVE_ATTRACT,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_ELECTRODE,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x64,
  .moves = {
   MOVE_THUNDER,
   MOVE_DOUBLE_TEAM,
   MOVE_MIRROR_COAT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_MUK,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x49,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_FLAMETHROWER,
   MOVE_THUNDERBOLT,
   MOVE_SHADOW_PUNCH
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_FLYGON,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0xCD,
  .moves = {
   MOVE_PROTECT,
   MOVE_DIG,
   MOVE_TOXIC,
   MOVE_SANDSTORM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_STARMIE,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x5B,
  .moves = {
   MOVE_SURF,
   MOVE_THUNDERBOLT,
   MOVE_BLIZZARD,
   MOVE_PSYCHIC
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_LUDICOLO,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x1A,
  .moves = {
   MOVE_RAIN_DANCE,
   MOVE_LEECH_SEED,
   MOVE_DIVE,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_RAICHU,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x4A,
  .moves = {
   MOVE_THUNDER,
   MOVE_REVERSAL,
   MOVE_FACADE,
   MOVE_IRON_TAIL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_GOLDUCK,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_SURF,
   MOVE_PSYCHIC,
   MOVE_ICE_BEAM,
   MOVE_IRON_TAIL
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_HERACROSS,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x15,
  .moves = {
   MOVE_MEGAHORN,
   MOVE_EARTHQUAKE,
   MOVE_FACADE,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WALREIN,
  .heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
  .teamFlags = 0x26,
  .moves = {
   MOVE_SURF,
   MOVE_ICE_BEAM,
   MOVE_FISSURE,
   MOVE_SHEER_COLD
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_KINGDRA,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x4D,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_BLIZZARD,
   MOVE_HYPER_BEAM,
   MOVE_DISABLE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_SALAMENCE,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x9C,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_FIRE_BLAST,
   MOVE_HYDRO_PUMP
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_METAGROSS,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0xB5,
  .moves = {
   MOVE_METEOR_MASH,
   MOVE_PSYCHIC,
   MOVE_PURSUIT,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_REGIROCK,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0x95,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_TOXIC,
   MOVE_SUPERPOWER,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_REGICE,
  .heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
  .teamFlags = 0x96,
  .moves = {
   MOVE_ICE_BEAM,
   MOVE_THUNDERBOLT,
   MOVE_ANCIENT_POWER,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_REGISTEEL,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0xB4,
  .moves = {
   MOVE_CURSE,
   MOVE_AMNESIA,
   MOVE_RETURN,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_LATIAS,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x92,
  .moves = {
   MOVE_MIST_BALL,
   MOVE_THUNDERBOLT,
   MOVE_EARTHQUAKE,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_LATIOS,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x91,
  .moves = {
   MOVE_LUSTER_PURGE,
   MOVE_THUNDERBOLT,
   MOVE_EARTHQUAKE,
   MOVE_SURF
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_MILOTIC,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0xB2,
  .moves = {
   MOVE_SURF,
   MOVE_ICE_BEAM,
   MOVE_RECOVER,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_SLAKING,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x65,
  .moves = {
   MOVE_YAWN,
   MOVE_SLASH,
   MOVE_COUNTER,
   MOVE_HYPER_BEAM
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0xDF,
  .moves = {
   MOVE_LEAF_BLADE,
   MOVE_DETECT,
   MOVE_DRAGON_CLAW,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0xD7,
  .moves = {
   MOVE_BLAZE_KICK,
   MOVE_SKY_UPPERCUT,
   MOVE_EARTHQUAKE,
   MOVE_ROCK_SLIDE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x5F,
  .moves = {
   MOVE_SURF,
   MOVE_EARTHQUAKE,
   MOVE_ICE_BEAM,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_SHEDINJA,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0xDB,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_SHADOW_BALL,
   MOVE_TOXIC,
   MOVE_HYPER_BEAM
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_METAGROSS,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x94,
  .moves = {
   MOVE_METEOR_MASH,
   MOVE_PSYCHIC,
   MOVE_SHADOW_BALL,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_GRUMPIG,
  .heldItem = BATTLE_TOWER_ITEM_MACHO_BRACE,
  .teamFlags = 0x4B,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_CONFUSE_RAY,
   MOVE_TRICK,
   MOVE_REFLECT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_LATIAS,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x92,
  .moves = {
   MOVE_MIST_BALL,
   MOVE_RECOVER,
   MOVE_ATTRACT,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_LATIOS,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x91,
  .moves = {
   MOVE_LUSTER_PURGE,
   MOVE_THUNDERBOLT,
   MOVE_ICE_BEAM,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_STARMIE,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x1A,
  .moves = {
   MOVE_SURF,
   MOVE_THUNDERBOLT,
   MOVE_PSYCHIC,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x14,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_COUNTER,
   MOVE_ROCK_TOMB,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
};
# 98 "src/field/battle_tower.c" 2
# 1 "src/field/../data/battle_tower/level_100_mons.h" 1
const struct BattleTowerPokemon gBattleTowerLevel100Mons[] =
{
 {
  .species = SPECIES_LINOONE,
  .heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
  .teamFlags = 0x42,
  .moves = {
   MOVE_SLASH,
   MOVE_GROWL,
   MOVE_TAIL_WHIP,
   MOVE_SAND_ATTACK
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_MIGHTYENA,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x41,
  .moves = {
   MOVE_BITE,
   MOVE_HOWL,
   MOVE_ODOR_SLEUTH,
   MOVE_SCARY_FACE
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_BEAUTIFLY,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x41,
  .moves = {
   MOVE_GIGA_DRAIN,
   MOVE_GUST,
   MOVE_STUN_SPORE,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_DUSTOX,
  .heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
  .teamFlags = 0x41,
  .moves = {
   MOVE_PSYBEAM,
   MOVE_GUST,
   MOVE_DOUBLE_TEAM,
   MOVE_SILVER_WIND
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_LOMBRE,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x03,
  .moves = {
   MOVE_ASTONISH,
   MOVE_GROWL,
   MOVE_MEGA_DRAIN,
   MOVE_SURF
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_LONELY,
 },
 {
  .species = SPECIES_NUZLEAF,
  .heldItem = BATTLE_TOWER_ITEM_WHITE_HERB,
  .teamFlags = 0x01,
  .moves = {
   MOVE_BULLET_SEED,
   MOVE_RAZOR_WIND,
   MOVE_FAINT_ATTACK,
   MOVE_GROWTH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SWELLOW,
  .heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
  .teamFlags = 0x42,
  .moves = {
   MOVE_AERIAL_ACE,
   MOVE_GROWL,
   MOVE_ENDEAVOR,
   MOVE_FOCUS_ENERGY
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_PELIPPER,
  .heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
  .teamFlags = 0x02,
  .moves = {
   MOVE_SURF,
   MOVE_WATER_SPORT,
   MOVE_PROTECT,
   MOVE_SUPERSONIC
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_MILD,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x42,
  .moves = {
   MOVE_MACH_PUNCH,
   MOVE_MEGA_DRAIN,
   MOVE_HEADBUTT,
   MOVE_STUN_SPORE
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_NINJASK,
  .heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
  .teamFlags = 0x41,
  .moves = {
   MOVE_SCRATCH,
   MOVE_SCREECH,
   MOVE_LEECH_LIFE,
   MOVE_FLASH
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_CROBAT,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_BITE,
   MOVE_FLY,
   MOVE_SUPERSONIC,
   MOVE_HAZE
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_MAWILE,
  .heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
  .teamFlags = 0x03,
  .moves = {
   MOVE_VICE_GRIP,
   MOVE_SWEET_SCENT,
   MOVE_ASTONISH,
   MOVE_STRENGTH
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_NOSEPASS,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_ROCK_THROW,
   MOVE_SANDSTORM,
   MOVE_HARDEN,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_DELCATTY,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x42,
  .moves = {
   MOVE_DOUBLE_SLAP,
   MOVE_TAIL_WHIP,
   MOVE_ATTRACT,
   MOVE_CHARM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_CAMERUPT,
  .heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
  .teamFlags = 0x01,
  .moves = {
   MOVE_EMBER,
   MOVE_TAKE_DOWN,
   MOVE_GROWL,
   MOVE_SANDSTORM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_MUK,
  .heldItem = BATTLE_TOWER_ITEM_ORAN_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_POISON_GAS,
   MOVE_MINIMIZE,
   MOVE_SLUDGE,
   MOVE_SCREECH
  },
  .evSpread = F_EV_SPREAD_HP,
  .nature = NATURE_CALM,
 },
 {
  .species = SPECIES_SANDSLASH,
  .heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
  .teamFlags = 0x03,
  .moves = {
   MOVE_SLASH,
   MOVE_SAND_ATTACK,
   MOVE_DEFENSE_CURL,
   MOVE_SWIFT
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SPINDA,
  .heldItem = BATTLE_TOWER_ITEM_SILK_SCARF,
  .teamFlags = 0x42,
  .moves = {
   MOVE_UPROAR,
   MOVE_WATER_PULSE,
   MOVE_THRASH,
   MOVE_SAFEGUARD
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_WHISCASH,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_TICKLE,
   MOVE_MUD_SPORT,
   MOVE_WATER_GUN,
   MOVE_WATER_SPORT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_CACTURNE,
  .heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
  .teamFlags = 0x01,
  .moves = {
   MOVE_POISON_STING,
   MOVE_PIN_MISSILE,
   MOVE_ABSORB,
   MOVE_COTTON_SPORE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_JIGGLYPUFF,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x42,
  .moves = {
   MOVE_SING,
   MOVE_ROLLOUT,
   MOVE_POUND,
   MOVE_LIGHT_SCREEN
  },
  .evSpread = F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MARILL,
  .heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
  .teamFlags = 0x42,
  .moves = {
   MOVE_BUBBLE_BEAM,
   MOVE_DEFENSE_CURL,
   MOVE_RAIN_DANCE,
   MOVE_IRON_TAIL
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_MAGNETON,
  .heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_THUNDER_SHOCK,
   MOVE_SUPERSONIC,
   MOVE_FLASH,
   MOVE_SCREECH
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_CARVANHA,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x01,
  .moves = {
   MOVE_BITE,
   MOVE_RAGE,
   MOVE_SCARY_FACE,
   MOVE_LEER
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_QUIRKY,
 },
 {
  .species = SPECIES_KECLEON,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x03,
  .moves = {
   MOVE_THIEF,
   MOVE_LICK,
   MOVE_BIND,
   MOVE_FURY_SWIPES
  },
  .evSpread = F_EV_SPREAD_DEFENSE,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_NINETALES,
  .heldItem = BATTLE_TOWER_ITEM_CHARCOAL,
  .teamFlags = 0x02,
  .moves = {
   MOVE_EMBER,
   MOVE_CONFUSE_RAY,
   MOVE_FIRE_SPIN,
   MOVE_SAFEGUARD
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_LONELY,
 },
 {
  .species = SPECIES_RAICHU,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x42,
  .moves = {
   MOVE_SHOCK_WAVE,
   MOVE_GROWL,
   MOVE_DOUBLE_TEAM,
   MOVE_LIGHT_SCREEN
  },
  .evSpread = F_EV_SPREAD_DEFENSE,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_SEALEO,
  .heldItem = BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
  .teamFlags = 0x01,
  .moves = {
   MOVE_ICE_BALL,
   MOVE_WATER_GUN,
   MOVE_ENCORE,
   MOVE_HAIL
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_GRAVELER,
  .heldItem = BATTLE_TOWER_ITEM_HARD_STONE,
  .teamFlags = 0x01,
  .moves = {
   MOVE_ROCK_THROW,
   MOVE_MUD_SPORT,
   MOVE_SANDSTORM,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_SHUPPET,
  .heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
  .teamFlags = 0x03,
  .moves = {
   MOVE_NIGHT_SHADE,
   MOVE_WILL_O_WISP,
   MOVE_SCREECH,
   MOVE_KNOCK_OFF
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_LUVDISC,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_ATTRACT,
   MOVE_FLAIL,
   MOVE_SWEET_KISS,
   MOVE_WATER_PULSE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_LANTURN,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_THUNDER_WAVE,
   MOVE_SUPERSONIC,
   MOVE_WATER_GUN,
   MOVE_SPARK
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_CORSOLA,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_MIRROR_COAT,
   MOVE_BUBBLE,
   MOVE_HARDEN,
   MOVE_LIGHT_SCREEN
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_WAILMER,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_SURF,
   MOVE_ROAR,
   MOVE_GROWL,
   MOVE_MIST
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_RHYDON,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x05,
  .moves = {
   MOVE_TAKE_DOWN,
   MOVE_SCARY_FACE,
   MOVE_TAIL_WHIP,
   MOVE_ROAR
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_DODRIO,
  .heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
  .teamFlags = 0x05,
  .moves = {
   MOVE_FURY_ATTACK,
   MOVE_PURSUIT,
   MOVE_AERIAL_ACE,
   MOVE_AGILITY
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_GOLDUCK,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x05,
  .moves = {
   MOVE_FURY_SWIPES,
   MOVE_TAIL_WHIP,
   MOVE_DISABLE,
   MOVE_PSYCH_UP
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_BELLOSSOM,
  .heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_GIGA_DRAIN,
   MOVE_POISON_POWDER,
   MOVE_STUN_SPORE,
   MOVE_ACID
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_TROPIUS,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x05,
  .moves = {
   MOVE_STOMP,
   MOVE_RAZOR_LEAF,
   MOVE_GUST,
   MOVE_SYNTHESIS
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SABLEYE,
  .heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_NIGHT_SHADE,
   MOVE_FAKE_OUT,
   MOVE_PSYCH_UP,
   MOVE_DETECT
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ELECTRODE,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x03,
  .moves = {
   MOVE_SONIC_BOOM,
   MOVE_SCREECH,
   MOVE_SPARK,
   MOVE_SELF_DESTRUCT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_QUIRKY,
 },
 {
  .species = SPECIES_TENTACRUEL,
  .heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
  .teamFlags = 0x01,
  .moves = {
   MOVE_ACID,
   MOVE_WATER_PULSE,
   MOVE_BARRIER,
   MOVE_WRAP
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_CLAYDOL,
  .heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
  .teamFlags = 0x05,
  .moves = {
   MOVE_ANCIENT_POWER,
   MOVE_MUD_SLAP,
   MOVE_RAPID_SPIN,
   MOVE_CONFUSION
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_GRUMPIG,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_PSYBEAM,
   MOVE_PSYCH_UP,
   MOVE_BOUNCE,
   MOVE_MAGIC_COAT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_CRAWDAUNT,
  .heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
  .teamFlags = 0x05,
  .moves = {
   MOVE_CRABHAMMER,
   MOVE_BUBBLE_BEAM,
   MOVE_BRICK_BREAK,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_CALM,
 },
 {
  .species = SPECIES_SEVIPER,
  .heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
  .teamFlags = 0x01,
  .moves = {
   MOVE_POISON_TAIL,
   MOVE_GLARE,
   MOVE_WRAP,
   MOVE_THIEF
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_ZANGOOSE,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_FURY_CUTTER,
   MOVE_LEER,
   MOVE_QUICK_ATTACK,
   MOVE_DETECT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ALTARIA,
  .heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
  .teamFlags = 0x03,
  .moves = {
   MOVE_DRAGON_BREATH,
   MOVE_SING,
   MOVE_SAFEGUARD,
   MOVE_TAKE_DOWN
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ROSELIA,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_LEECH_SEED,
   MOVE_MEGA_DRAIN,
   MOVE_GROWTH,
   MOVE_STUN_SPORE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_VOLBEAT,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x09,
  .moves = {
   MOVE_SIGNAL_BEAM,
   MOVE_CONFUSE_RAY,
   MOVE_DOUBLE_TEAM,
   MOVE_LIGHT_SCREEN
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ILLUMISE,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x09,
  .moves = {
   MOVE_CHARM,
   MOVE_ENCORE,
   MOVE_SOLAR_BEAM,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_MAGNET,
  .teamFlags = 0x03,
  .moves = {
   MOVE_BITE,
   MOVE_HOWL,
   MOVE_THUNDER_WAVE,
   MOVE_SPARK
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_MAWILE,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_CRUNCH,
   MOVE_IRON_DEFENSE,
   MOVE_TORMENT,
   MOVE_SANDSTORM
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x05,
  .moves = {
   MOVE_ARM_THRUST,
   MOVE_FAKE_OUT,
   MOVE_WHIRLWIND,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_SKARMORY,
  .heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
  .teamFlags = 0x01,
  .moves = {
   MOVE_STEEL_WING,
   MOVE_AGILITY,
   MOVE_TAUNT,
   MOVE_FLY
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_TORKOAL,
  .heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
  .teamFlags = 0x03,
  .moves = {
   MOVE_FIRE_SPIN,
   MOVE_SMOKESCREEN,
   MOVE_BODY_SLAM,
   MOVE_AMNESIA
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_MILD,
 },
 {
  .species = SPECIES_GYARADOS,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_THRASH,
   MOVE_DRAGON_RAGE,
   MOVE_TWISTER,
   MOVE_HYDRO_PUMP
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_QUIRKY,
 },
 {
  .species = SPECIES_MIGHTYENA,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_CRUNCH,
   MOVE_HOWL,
   MOVE_IRON_TAIL,
   MOVE_TORMENT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_QUIRKY,
 },
 {
  .species = SPECIES_LINOONE,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0x06,
  .moves = {
   MOVE_SLASH,
   MOVE_ATTRACT,
   MOVE_SHOCK_WAVE,
   MOVE_TOXIC
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MASQUERAIN,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_TOXIC,
   MOVE_STUN_SPORE,
   MOVE_SUNNY_DAY,
   MOVE_SOLAR_BEAM
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x06,
  .moves = {
   MOVE_BULLET_SEED,
   MOVE_SLAM,
   MOVE_SCREECH,
   MOVE_DETECT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x06,
  .moves = {
   MOVE_DOUBLE_KICK,
   MOVE_FLAMETHROWER,
   MOVE_DOUBLE_TEAM,
   MOVE_ROAR
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x49,
  .moves = {
   MOVE_SURF,
   MOVE_MUD_SHOT,
   MOVE_MUD_SPORT,
   MOVE_RAIN_DANCE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SALAMENCE,
  .heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
  .teamFlags = 0x49,
  .moves = {
   MOVE_DRAGON_BREATH,
   MOVE_FLY,
   MOVE_TOXIC,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_CALM,
 },
 {
  .species = SPECIES_KINGDRA,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x49,
  .moves = {
   MOVE_SURF,
   MOVE_ICE_BEAM,
   MOVE_SMOKESCREEN,
   MOVE_RAIN_DANCE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_CORSOLA,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x03,
  .moves = {
   MOVE_ANCIENT_POWER,
   MOVE_MIRROR_COAT,
   MOVE_SAFEGUARD,
   MOVE_REFLECT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_RHYDON,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x41,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_IRON_TAIL,
   MOVE_ROAR,
   MOVE_THUNDERBOLT
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_HERACROSS,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x06,
  .moves = {
   MOVE_MEGAHORN,
   MOVE_COUNTER,
   MOVE_PROTECT,
   MOVE_LEER
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_GIRAFARIG,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x09,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_CRUNCH,
   MOVE_BATON_PASS,
   MOVE_AGILITY
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_XATU,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x09,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_FLY,
   MOVE_CONFUSE_RAY,
   MOVE_TOXIC
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_DODRIO,
  .heldItem = BATTLE_TOWER_ITEM_SHARP_BEAK,
  .teamFlags = 0x03,
  .moves = {
   MOVE_DRILL_PECK,
   MOVE_TRI_ATTACK,
   MOVE_PURSUIT,
   MOVE_TORMENT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SERIOUS,
 },
 {
  .species = SPECIES_VILEPLUME,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x89,
  .moves = {
   MOVE_POISON_POWDER,
   MOVE_STUN_SPORE,
   MOVE_SLEEP_POWDER,
   MOVE_PETAL_DANCE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_MODEST,
 },
 {
  .species = SPECIES_MEDICHAM,
  .heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
  .teamFlags = 0x06,
  .moves = {
   MOVE_FOCUS_PUNCH,
   MOVE_LIGHT_SCREEN,
   MOVE_BULK_UP,
   MOVE_PSYCHIC
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_ABSOL,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x06,
  .moves = {
   MOVE_SLASH,
   MOVE_SWORDS_DANCE,
   MOVE_DOUBLE_TEAM,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_DUSCLOPS,
  .heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
  .teamFlags = 0x4B,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_WILL_O_WISP,
   MOVE_NIGHT_SHADE,
   MOVE_DISABLE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_SHUPPET,
  .heldItem = BATTLE_TOWER_ITEM_SPELL_TAG,
  .teamFlags = 0x43,
  .moves = {
   MOVE_GRUDGE,
   MOVE_SHADOW_BALL,
   MOVE_CURSE,
   MOVE_KNOCK_OFF
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_CASTFORM,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x82,
  .moves = {
   MOVE_WEATHER_BALL,
   MOVE_HAIL,
   MOVE_SUNNY_DAY,
   MOVE_RAIN_DANCE
  },
  .evSpread = F_EV_SPREAD_SPEED,
  .nature = NATURE_MODEST,
 },
 {
  .species = SPECIES_MILOTIC,
  .heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
  .teamFlags = 0x02,
  .moves = {
   MOVE_SURF,
   MOVE_REFRESH,
   MOVE_RECOVER,
   MOVE_RAIN_DANCE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_SHARPEDO,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_CRUNCH,
   MOVE_FOCUS_ENERGY,
   MOVE_SCARY_FACE,
   MOVE_SCREECH
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_FLYGON,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0x06,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_SAND_ATTACK,
   MOVE_DRAGON_BREATH,
   MOVE_SAND_TOMB
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_TRAPINCH,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x09,
  .moves = {
   MOVE_TOXIC,
   MOVE_SAND_TOMB,
   MOVE_CRUNCH,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_LUNATONE,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x43,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_ROCK_THROW,
   MOVE_HYPNOSIS,
   MOVE_LIGHT_SCREEN
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SOLROCK,
  .heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
  .teamFlags = 0x43,
  .moves = {
   MOVE_SOLAR_BEAM,
   MOVE_SUNNY_DAY,
   MOVE_COSMIC_POWER,
   MOVE_CALM_MIND
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_BALTOY,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x43,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_EARTHQUAKE,
   MOVE_REFLECT,
   MOVE_SELF_DESTRUCT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_CRAWDAUNT,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x06,
  .moves = {
   MOVE_CRABHAMMER,
   MOVE_SURF,
   MOVE_PROTECT,
   MOVE_BRICK_BREAK
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_WHISCASH,
  .heldItem = BATTLE_TOWER_ITEM_ASPEAR_BERRY,
  .teamFlags = 0x06,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_TICKLE,
   MOVE_AMNESIA,
   MOVE_SURF
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SEVIPER,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x09,
  .moves = {
   MOVE_POISON_TAIL,
   MOVE_CRUNCH,
   MOVE_GIGA_DRAIN,
   MOVE_HAZE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_MAGCARGO,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x89,
  .moves = {
   MOVE_FLAMETHROWER,
   MOVE_LIGHT_SCREEN,
   MOVE_AMNESIA,
   MOVE_ROCK_SLIDE
  },
  .evSpread = F_EV_SPREAD_ATTACK,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_BLACK_BELT,
  .teamFlags = 0x09,
  .moves = {
   MOVE_KARATE_CHOP,
   MOVE_SEISMIC_TOSS,
   MOVE_BRICK_BREAK,
   MOVE_LOW_KICK
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_SWALOT,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x86,
  .moves = {
   MOVE_YAWN,
   MOVE_WATER_PULSE,
   MOVE_SHADOW_BALL,
   MOVE_SLUDGE_BOMB
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x0C,
  .moves = {
   MOVE_LEAF_BLADE,
   MOVE_GIGA_DRAIN,
   MOVE_FURY_CUTTER,
   MOVE_DETECT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x0C,
  .moves = {
   MOVE_BLAZE_KICK,
   MOVE_FLAMETHROWER,
   MOVE_PROTECT,
   MOVE_QUICK_ATTACK
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x4C,
  .moves = {
   MOVE_SURF,
   MOVE_MUD_SHOT,
   MOVE_MUD_SLAP,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MIGHTYENA,
  .heldItem = BATTLE_TOWER_ITEM_BLACK_GLASSES,
  .teamFlags = 0x04,
  .moves = {
   MOVE_CRUNCH,
   MOVE_HOWL,
   MOVE_SWAGGER,
   MOVE_SHADOW_BALL
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_CALM,
 },
 {
  .species = SPECIES_LINOONE,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x04,
  .moves = {
   MOVE_SLASH,
   MOVE_REST,
   MOVE_BELLY_DRUM,
   MOVE_THUNDERBOLT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_MILD,
 },
 {
  .species = SPECIES_BEAUTIFLY,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x08,
  .moves = {
   MOVE_GIGA_DRAIN,
   MOVE_ATTRACT,
   MOVE_MORNING_SUN,
   MOVE_STUN_SPORE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_DUSTOX,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x08,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_SILVER_WIND,
   MOVE_MOONLIGHT,
   MOVE_TOXIC
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_LUDICOLO,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x0C,
  .moves = {
   MOVE_FAKE_OUT,
   MOVE_HYDRO_PUMP,
   MOVE_ICE_BEAM,
   MOVE_UPROAR
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_SHIFTRY,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x0C,
  .moves = {
   MOVE_FRUSTRATION,
   MOVE_GIGA_DRAIN,
   MOVE_TORMENT,
   MOVE_SWAGGER
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_SWELLOW,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x88,
  .moves = {
   MOVE_FLY,
   MOVE_ENDEAVOR,
   MOVE_AERIAL_ACE,
   MOVE_TOXIC
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_GARDEVOIR,
  .heldItem = BATTLE_TOWER_ITEM_BLACK_GLASSES,
  .teamFlags = 0x4A,
  .moves = {
   MOVE_HYPNOSIS,
   MOVE_DREAM_EATER,
   MOVE_PSYCHIC,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x0C,
  .moves = {
   MOVE_DYNAMIC_PUNCH,
   MOVE_MIND_READER,
   MOVE_SNATCH,
   MOVE_MEGA_DRAIN
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_VIGOROTH,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x04,
  .moves = {
   MOVE_SLASH,
   MOVE_UPROAR,
   MOVE_ENCORE,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_CALM,
 },
 {
  .species = SPECIES_NINJASK,
  .heldItem = BATTLE_TOWER_ITEM_SILVER_POWDER,
  .teamFlags = 0x04,
  .moves = {
   MOVE_FURY_CUTTER,
   MOVE_GIGA_DRAIN,
   MOVE_SWORDS_DANCE,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_SHEDINJA,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0xCA,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_SOLAR_BEAM,
   MOVE_SUNNY_DAY,
   MOVE_GRUDGE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_LOUDRED,
  .heldItem = BATTLE_TOWER_ITEM_PECHA_BERRY,
  .teamFlags = 0x04,
  .moves = {
   MOVE_HYPER_VOICE,
   MOVE_HOWL,
   MOVE_SHADOW_BALL,
   MOVE_TORMENT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x04,
  .moves = {
   MOVE_ARM_THRUST,
   MOVE_BULK_UP,
   MOVE_BRICK_BREAK,
   MOVE_HIDDEN_POWER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_TWISTED_SPOON,
  .teamFlags = 0x88,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_SHADOW_BALL,
   MOVE_FUTURE_SIGHT,
   MOVE_DISABLE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_CROBAT,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0x88,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_TOXIC,
   MOVE_MEAN_LOOK,
   MOVE_SNATCH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MAWILE,
  .heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
  .teamFlags = 0x04,
  .moves = {
   MOVE_CRUNCH,
   MOVE_IRON_DEFENSE,
   MOVE_FAKE_TEARS,
   MOVE_POISON_FANG
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_AGGRON,
  .heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
  .teamFlags = 0x45,
  .moves = {
   MOVE_METAL_CLAW,
   MOVE_FLAMETHROWER,
   MOVE_METAL_SOUND,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_GOLEM,
  .heldItem = BATTLE_TOWER_ITEM_SOFT_SAND,
  .teamFlags = 0xC5,
  .moves = {
   MOVE_ROLLOUT,
   MOVE_DEFENSE_CURL,
   MOVE_DOUBLE_TEAM,
   MOVE_SELF_DESTRUCT
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_MAGNET,
  .teamFlags = 0x04,
  .moves = {
   MOVE_THUNDER,
   MOVE_RAIN_DANCE,
   MOVE_THUNDER_WAVE,
   MOVE_CHARGE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_VOLBEAT,
  .heldItem = BATTLE_TOWER_ITEM_SILVER_POWDER,
  .teamFlags = 0x08,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_SIGNAL_BEAM,
   MOVE_MOONLIGHT,
   MOVE_TAIL_GLOW
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_ILLUMISE,
  .heldItem = BATTLE_TOWER_ITEM_SILVER_POWDER,
  .teamFlags = 0x08,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_FLATTER,
   MOVE_WISH,
   MOVE_ENCORE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_MASQUERAIN,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x88,
  .moves = {
   MOVE_GIGA_DRAIN,
   MOVE_SILVER_WIND,
   MOVE_STUN_SPORE,
   MOVE_TOXIC
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_ROSELIA,
  .heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
  .teamFlags = 0x08,
  .moves = {
   MOVE_PETAL_DANCE,
   MOVE_GROWTH,
   MOVE_SYNTHESIS,
   MOVE_GRASS_WHISTLE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_IMPISH,
 },
 {
  .species = SPECIES_DELCATTY,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x08,
  .moves = {
   MOVE_SING,
   MOVE_ATTRACT,
   MOVE_DOUBLE_SLAP,
   MOVE_HEAL_BELL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_SEAKING,
  .heldItem = BATTLE_TOWER_ITEM_MYSTIC_WATER,
  .teamFlags = 0x88,
  .moves = {
   MOVE_RAIN_DANCE,
   MOVE_SURF,
   MOVE_ATTRACT,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_GYARADOS,
  .heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
  .teamFlags = 0x8C,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_EARTHQUAKE,
   MOVE_DRAGON_RAGE,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_CALM,
 },
 {
  .species = SPECIES_SWALOT,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x42,
  .moves = {
   MOVE_STOCKPILE,
   MOVE_SWALLOW,
   MOVE_SPIT_UP,
   MOVE_YAWN
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_MAGCARGO,
  .heldItem = BATTLE_TOWER_ITEM_ASPEAR_BERRY,
  .teamFlags = 0x41,
  .moves = {
   MOVE_ROCK_SLIDE,
   MOVE_FIRE_BLAST,
   MOVE_BODY_SLAM,
   MOVE_LIGHT_SCREEN
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_LONELY,
 },
 {
  .species = SPECIES_MUK,
  .heldItem = BATTLE_TOWER_ITEM_POISON_BARB,
  .teamFlags = 0xC3,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_FLAMETHROWER,
   MOVE_ACID_ARMOR,
   MOVE_DISABLE
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_SPINDA,
  .heldItem = BATTLE_TOWER_ITEM_SILK_SCARF,
  .teamFlags = 0x42,
  .moves = {
   MOVE_DIZZY_PUNCH,
   MOVE_TEETER_DANCE,
   MOVE_PSYCH_UP,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_MODEST,
 },
 {
  .species = SPECIES_ALTARIA,
  .heldItem = BATTLE_TOWER_ITEM_DRAGON_FANG,
  .teamFlags = 0x03,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_DRAGON_BREATH,
   MOVE_DRAGON_DANCE,
   MOVE_REFRESH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_ZANGOOSE,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x03,
  .moves = {
   MOVE_CRUSH_CLAW,
   MOVE_TAUNT,
   MOVE_SWORDS_DANCE,
   MOVE_DETECT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_QUIRKY,
 },
 {
  .species = SPECIES_SEVIPER,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x41,
  .moves = {
   MOVE_SWAGGER,
   MOVE_TAUNT,
   MOVE_GLARE,
   MOVE_POISON_TAIL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_GRUMPIG,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x42,
  .moves = {
   MOVE_TOXIC,
   MOVE_BOUNCE,
   MOVE_CONFUSE_RAY,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_CACTURNE,
  .heldItem = BATTLE_TOWER_ITEM_MIRACLE_SEED,
  .teamFlags = 0x41,
  .moves = {
   MOVE_NEEDLE_ARM,
   MOVE_INGRAIN,
   MOVE_SPIKES,
   MOVE_COTTON_SPORE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_CLAYDOL,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x03,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_SANDSTORM,
   MOVE_COSMIC_POWER,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_TENTACRUEL,
  .heldItem = BATTLE_TOWER_ITEM_MENTAL_HERB,
  .teamFlags = 0xC1,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_HYDRO_PUMP,
   MOVE_BARRIER,
   MOVE_SUPERSONIC
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WIGGLYTUFF,
  .heldItem = BATTLE_TOWER_ITEM_RAWST_BERRY,
  .teamFlags = 0xC3,
  .moves = {
   MOVE_SING,
   MOVE_FOCUS_PUNCH,
   MOVE_DISABLE,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_ADAMANT,
 },
 {
  .species = SPECIES_AZUMARILL,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0xC2,
  .moves = {
   MOVE_SURF,
   MOVE_ATTRACT,
   MOVE_DEFENSE_CURL,
   MOVE_ROLLOUT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_RASH,
 },
 {
  .species = SPECIES_ELECTRODE,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0xC3,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_MIRROR_COAT,
   MOVE_LIGHT_SCREEN,
   MOVE_SELF_DESTRUCT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MILOTIC,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x42,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_ATTRACT,
   MOVE_RECOVER,
   MOVE_REFRESH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_KECLEON,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x43,
  .moves = {
   MOVE_SKILL_SWAP,
   MOVE_ANCIENT_POWER,
   MOVE_WATER_PULSE,
   MOVE_THUNDERBOLT
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_DUSCLOPS,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x43,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_CURSE,
   MOVE_REST,
   MOVE_MEAN_LOOK
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_ABSOL,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x41,
  .moves = {
   MOVE_SLASH,
   MOVE_SWORDS_DANCE,
   MOVE_DOUBLE_TEAM,
   MOVE_SNATCH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_NINETALES,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0xC2,
  .moves = {
   MOVE_FLAMETHROWER,
   MOVE_CONFUSE_RAY,
   MOVE_DOUBLE_TEAM,
   MOVE_WILL_O_WISP
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_PIKACHU,
  .heldItem = BATTLE_TOWER_ITEM_LIGHT_BALL,
  .teamFlags = 0xC2,
  .moves = {
   MOVE_THUNDER_WAVE,
   MOVE_THUNDER,
   MOVE_RAIN_DANCE,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_VILEPLUME,
  .heldItem = BATTLE_TOWER_ITEM_ASPEAR_BERRY,
  .teamFlags = 0xC3,
  .moves = {
   MOVE_GIGA_DRAIN,
   MOVE_SLEEP_POWDER,
   MOVE_MOONLIGHT,
   MOVE_SLUDGE_BOMB
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_DONPHAN,
  .heldItem = BATTLE_TOWER_ITEM_PERSIM_BERRY,
  .teamFlags = 0x41,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_DOUBLE_EDGE,
   MOVE_IRON_TAIL,
   MOVE_FISSURE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_QUIRKY,
 },
 {
  .species = SPECIES_STARMIE,
  .heldItem = BATTLE_TOWER_ITEM_CHERI_BERRY,
  .teamFlags = 0xC3,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_ICE_BEAM,
   MOVE_RECOVER,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_WALREIN,
  .heldItem = BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
  .teamFlags = 0x43,
  .moves = {
   MOVE_ICE_BEAM,
   MOVE_BODY_SLAM,
   MOVE_ENCORE,
   MOVE_HAIL
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_RELICANTH,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x41,
  .moves = {
   MOVE_YAWN,
   MOVE_MUD_SPORT,
   MOVE_DOUBLE_EDGE,
   MOVE_SANDSTORM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_LONELY,
 },
 {
  .species = SPECIES_KINGDRA,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x43,
  .moves = {
   MOVE_RAIN_DANCE,
   MOVE_ICE_BEAM,
   MOVE_HYDRO_PUMP,
   MOVE_AGILITY
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_CRADILY,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x43,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_INGRAIN,
   MOVE_ANCIENT_POWER,
   MOVE_GIGA_DRAIN
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_MILD,
 },
 {
  .species = SPECIES_ARMALDO,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x43,
  .moves = {
   MOVE_SLASH,
   MOVE_ROCK_SLIDE,
   MOVE_EARTHQUAKE,
   MOVE_WATER_PULSE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_METAGROSS,
  .heldItem = BATTLE_TOWER_ITEM_METAL_COAT,
  .teamFlags = 0x41,
  .moves = {
   MOVE_METAL_CLAW,
   MOVE_PSYCHIC,
   MOVE_LIGHT_SCREEN,
   MOVE_AGILITY
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_SALAMENCE,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x42,
  .moves = {
   MOVE_DRAGON_BREATH,
   MOVE_CRUNCH,
   MOVE_FLAMETHROWER,
   MOVE_AERIAL_ACE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_MIGHTYENA,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_CRUNCH,
   MOVE_YAWN,
   MOVE_FACADE,
   MOVE_HOWL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_LINOONE,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x02,
  .moves = {
   MOVE_HYPER_BEAM,
   MOVE_FACADE,
   MOVE_ATTRACT,
   MOVE_TRICK
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_LUDICOLO,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x03,
  .moves = {
   MOVE_SURF,
   MOVE_FOCUS_PUNCH,
   MOVE_FAKE_OUT,
   MOVE_SYNTHESIS
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_EXPLOUD,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_UPROAR,
   MOVE_EARTHQUAKE,
   MOVE_ICE_BEAM,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SWELLOW,
  .heldItem = BATTLE_TOWER_ITEM_LANSAT_BERRY,
  .teamFlags = 0x02,
  .moves = {
   MOVE_FACADE,
   MOVE_SUPERSONIC,
   MOVE_WING_ATTACK,
   MOVE_ENDEAVOR
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_PELIPPER,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x82,
  .moves = {
   MOVE_STOCKPILE,
   MOVE_SWALLOW,
   MOVE_SPIT_UP,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x01,
  .moves = {
   MOVE_DYNAMIC_PUNCH,
   MOVE_COUNTER,
   MOVE_BULK_UP,
   MOVE_MIND_READER
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SHEDINJA,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_RETURN,
   MOVE_DOUBLE_TEAM,
   MOVE_TOXIC,
   MOVE_SHADOW_BALL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_EXPLOUD,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_HYPER_BEAM,
   MOVE_SUPERSONIC,
   MOVE_FLAMETHROWER,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x01,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_COUNTER,
   MOVE_FACADE,
   MOVE_FAKE_OUT
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x83,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_ENCORE,
   MOVE_DISABLE,
   MOVE_RECOVER
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_CROBAT,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x81,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_AIR_CUTTER,
   MOVE_TORMENT,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SABLEYE,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x83,
  .moves = {
   MOVE_TOXIC,
   MOVE_DETECT,
   MOVE_RECOVER,
   MOVE_TORMENT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_MAWILE,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x02,
  .moves = {
   MOVE_CRUNCH,
   MOVE_SWORDS_DANCE,
   MOVE_IRON_DEFENSE,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_AGGRON,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_DOUBLE_EDGE,
   MOVE_IRON_DEFENSE,
   MOVE_ROAR,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_GOLEM,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_ROCK_SLIDE,
   MOVE_FLAMETHROWER,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_NOSEPASS,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x81,
  .moves = {
   MOVE_THUNDER_WAVE,
   MOVE_ROCK_SLIDE,
   MOVE_TORMENT,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x02,
  .moves = {
   MOVE_THUNDER,
   MOVE_CRUNCH,
   MOVE_THUNDER_WAVE,
   MOVE_QUICK_ATTACK
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_ROSELIA,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x82,
  .moves = {
   MOVE_GRASS_WHISTLE,
   MOVE_LEECH_SEED,
   MOVE_GIGA_DRAIN,
   MOVE_GROWTH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_DELCATTY,
  .heldItem = BATTLE_TOWER_ITEM_STARF_BERRY,
  .teamFlags = 0x02,
  .moves = {
   MOVE_ASSIST,
   MOVE_SING,
   MOVE_ATTRACT,
   MOVE_SUBSTITUTE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_TROPIUS,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0xC2,
  .moves = {
   MOVE_RAZOR_LEAF,
   MOVE_EARTHQUAKE,
   MOVE_ATTRACT,
   MOVE_SYNTHESIS
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_SWALOT,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x03,
  .moves = {
   MOVE_YAWN,
   MOVE_SLUDGE_BOMB,
   MOVE_ATTRACT,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_BLACK_BELT,
  .teamFlags = 0x01,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_BULK_UP,
   MOVE_LOW_KICK,
   MOVE_BRICK_BREAK
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_CAMERUPT,
  .heldItem = BATTLE_TOWER_ITEM_SITRUS_BERRY,
  .teamFlags = 0x40,
  .moves = {
   MOVE_ERUPTION,
   MOVE_EARTHQUAKE,
   MOVE_ROCK_SLIDE,
   MOVE_OVERHEAT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_MAGCARGO,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x03,
  .moves = {
   MOVE_FLAMETHROWER,
   MOVE_ROCK_SLIDE,
   MOVE_EARTHQUAKE,
   MOVE_REFLECT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WEEZING,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x81,
  .moves = {
   MOVE_WILL_O_WISP,
   MOVE_HYPER_BEAM,
   MOVE_THUNDERBOLT,
   MOVE_DESTINY_BOND
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_SPINDA,
  .heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
  .teamFlags = 0x82,
  .moves = {
   MOVE_TRICK,
   MOVE_TEETER_DANCE,
   MOVE_FOCUS_PUNCH,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_SKARMORY,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x01,
  .moves = {
   MOVE_DRILL_PECK,
   MOVE_STEEL_WING,
   MOVE_TORMENT,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ALTARIA,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x02,
  .moves = {
   MOVE_SING,
   MOVE_DRAGON_CLAW,
   MOVE_ICE_BEAM,
   MOVE_EARTHQUAKE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_GRUMPIG,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x82,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_CONFUSE_RAY,
   MOVE_CALM_MIND,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_SHIFTRY,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x20,
  .moves = {
   MOVE_SWAGGER,
   MOVE_FRUSTRATION,
   MOVE_ATTRACT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_CLAYDOL,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x20,
  .moves = {
   MOVE_COSMIC_POWER,
   MOVE_PSYCHIC,
   MOVE_EARTHQUAKE,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x33,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_COUNTER,
   MOVE_BELLY_DRUM,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_NOSEPASS,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x20,
  .moves = {
   MOVE_ROCK_SLIDE,
   MOVE_THUNDER_WAVE,
   MOVE_EARTHQUAKE,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_LAX,
 },
 {
  .species = SPECIES_DUSCLOPS,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x33,
  .moves = {
   MOVE_SHADOW_PUNCH,
   MOVE_WILL_O_WISP,
   MOVE_CONFUSE_RAY,
   MOVE_DESTINY_BOND
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_SEAKING,
  .heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
  .teamFlags = 0x20,
  .moves = {
   MOVE_HORN_DRILL,
   MOVE_AGILITY,
   MOVE_SLEEP_TALK,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_CAMERUPT,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x73,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_ERUPTION,
   MOVE_ROCK_SLIDE,
   MOVE_FISSURE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_LANTURN,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x13,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_SURF,
   MOVE_THUNDER_WAVE,
   MOVE_CONFUSE_RAY
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_WEEZING,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x33,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_THUNDERBOLT,
   MOVE_FIRE_BLAST,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WHISCASH,
  .heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
  .teamFlags = 0x20,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_SURF,
   MOVE_SPARK,
   MOVE_FISSURE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_AGGRON,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x51,
  .moves = {
   MOVE_DOUBLE_EDGE,
   MOVE_EARTHQUAKE,
   MOVE_SURF,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_KECLEON,
  .heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
  .teamFlags = 0x12,
  .moves = {
   MOVE_TRICK,
   MOVE_FOCUS_PUNCH,
   MOVE_ATTRACT,
   MOVE_SNATCH
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_MILD,
 },
 {
  .species = SPECIES_SHARPEDO,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x11,
  .moves = {
   MOVE_CRUNCH,
   MOVE_DOUBLE_EDGE,
   MOVE_SURF,
   MOVE_SWAGGER
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ABSOL,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x12,
  .moves = {
   MOVE_DOUBLE_EDGE,
   MOVE_FACADE,
   MOVE_SWORDS_DANCE,
   MOVE_QUICK_ATTACK
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WAILORD,
  .heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
  .teamFlags = 0x72,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_EARTHQUAKE,
   MOVE_ATTRACT,
   MOVE_FISSURE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_TENTACRUEL,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x20,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_SLUDGE_BOMB,
   MOVE_BARRIER,
   MOVE_MIRROR_COAT
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_SABLEYE,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x32,
  .moves = {
   MOVE_SHADOW_BALL,
   MOVE_TOXIC,
   MOVE_RECOVER,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WOBBUFFET,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x20,
  .moves = {
   MOVE_ENCORE,
   MOVE_COUNTER,
   MOVE_MIRROR_COAT,
   MOVE_DESTINY_BOND
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_MILD,
 },
 {
  .species = SPECIES_RHYDON,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x71,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_MEGAHORN,
   MOVE_BRICK_BREAK,
   MOVE_HORN_DRILL
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_GLALIE,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x31,
  .moves = {
   MOVE_CRUNCH,
   MOVE_BLIZZARD,
   MOVE_HAIL,
   MOVE_SHEER_COLD
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x8C,
  .moves = {
   MOVE_LEAF_BLADE,
   MOVE_EARTHQUAKE,
   MOVE_DRAGON_CLAW,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x8C,
  .moves = {
   MOVE_BLAZE_KICK,
   MOVE_COUNTER,
   MOVE_ENDURE,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x8C,
  .moves = {
   MOVE_SURF,
   MOVE_EARTHQUAKE,
   MOVE_MIRROR_COAT,
   MOVE_BLIZZARD
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_GARDEVOIR,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x1A,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_THUNDERBOLT,
   MOVE_DESTINY_BOND,
   MOVE_SNATCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x15,
  .moves = {
   MOVE_SPORE,
   MOVE_FOCUS_PUNCH,
   MOVE_MACH_PUNCH,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x58,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_FIRE_PUNCH,
   MOVE_ICE_PUNCH,
   MOVE_RECOVER
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x15,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_EARTHQUAKE,
   MOVE_FACADE,
   MOVE_FAKE_OUT
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_GYARADOS,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x55,
  .moves = {
   MOVE_HYPER_BEAM,
   MOVE_EARTHQUAKE,
   MOVE_SURF,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_CROBAT,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x58,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_CONFUSE_RAY,
   MOVE_AIR_CUTTER,
   MOVE_DOUBLE_TEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x5D,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_FLAMETHROWER,
   MOVE_EARTHQUAKE,
   MOVE_ROCK_SLIDE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x1A,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_THUNDER_WAVE,
   MOVE_ROAR,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_ELECTRODE,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x60,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_PROTECT,
   MOVE_MIRROR_COAT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_MUK,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x64,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_FLAMETHROWER,
   MOVE_THUNDERBOLT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_FLYGON,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x1C,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_FLAMETHROWER,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_STARMIE,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x5C,
  .moves = {
   MOVE_SURF,
   MOVE_THUNDERBOLT,
   MOVE_RECOVER,
   MOVE_CONFUSE_RAY
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_NINETALES,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x4A,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_TOXIC,
   MOVE_FIRE_SPIN,
   MOVE_HEAT_WAVE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_RAICHU,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x5A,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_THUNDER_WAVE,
   MOVE_REVERSAL,
   MOVE_IRON_TAIL
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_GOLDUCK,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x55,
  .moves = {
   MOVE_SURF,
   MOVE_CROSS_CHOP,
   MOVE_ICE_BEAM,
   MOVE_DIG
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_HERACROSS,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x5D,
  .moves = {
   MOVE_MEGAHORN,
   MOVE_EARTHQUAKE,
   MOVE_ENDURE,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WALREIN,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x26,
  .moves = {
   MOVE_SURF,
   MOVE_ICE_BEAM,
   MOVE_EARTHQUAKE,
   MOVE_SHEER_COLD
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_KINGDRA,
  .heldItem = BATTLE_TOWER_ITEM_CHESTO_BERRY,
  .teamFlags = 0x5B,
  .moves = {
   MOVE_SURF,
   MOVE_ICE_BEAM,
   MOVE_DRAGON_BREATH,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_SALAMENCE,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x0D,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_CRUNCH,
   MOVE_FIRE_BLAST
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_METAGROSS,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x3D,
  .moves = {
   MOVE_METEOR_MASH,
   MOVE_PSYCHIC,
   MOVE_EARTHQUAKE,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_REGIROCK,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x3C,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_ANCIENT_POWER,
   MOVE_THUNDERBOLT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_REGICE,
  .heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
  .teamFlags = 0x3C,
  .moves = {
   MOVE_ICE_BEAM,
   MOVE_THUNDERBOLT,
   MOVE_EARTHQUAKE,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_REGISTEEL,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x3C,
  .moves = {
   MOVE_METAL_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_THUNDERBOLT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_LATIAS,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x0E,
  .moves = {
   MOVE_MIST_BALL,
   MOVE_THUNDERBOLT,
   MOVE_RECOVER,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_LATIOS,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x0D,
  .moves = {
   MOVE_LUSTER_PURGE,
   MOVE_THUNDERBOLT,
   MOVE_RECOVER,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_MILOTIC,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x1A,
  .moves = {
   MOVE_SURF,
   MOVE_TOXIC,
   MOVE_RECOVER,
   MOVE_MIRROR_COAT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_SLAKING,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x15,
  .moves = {
   MOVE_YAWN,
   MOVE_FOCUS_PUNCH,
   MOVE_COUNTER,
   MOVE_SLACK_OFF
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x8C,
  .moves = {
   MOVE_GIGA_DRAIN,
   MOVE_DOUBLE_TEAM,
   MOVE_LEECH_SEED,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x8C,
  .moves = {
   MOVE_BLAZE_KICK,
   MOVE_EARTHQUAKE,
   MOVE_ROCK_SLIDE,
   MOVE_QUICK_ATTACK
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x8C,
  .moves = {
   MOVE_MUDDY_WATER,
   MOVE_MUD_SHOT,
   MOVE_MIRROR_COAT,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_GARDEVOIR,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_THUNDERBOLT,
   MOVE_HYPNOSIS,
   MOVE_DREAM_EATER
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_SPORE,
   MOVE_COUNTER,
   MOVE_SKY_UPPERCUT,
   MOVE_GIGA_DRAIN
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x58,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_THUNDER_PUNCH,
   MOVE_FIRE_PUNCH,
   MOVE_RECOVER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x04,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_COUNTER,
   MOVE_ENDURE,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_GYARADOS,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x44,
  .moves = {
   MOVE_HYPER_BEAM,
   MOVE_THUNDERBOLT,
   MOVE_EARTHQUAKE,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_BOLD,
 },
 {
  .species = SPECIES_CROBAT,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x48,
  .moves = {
   MOVE_TOXIC,
   MOVE_CONFUSE_RAY,
   MOVE_ATTRACT,
   MOVE_FLY
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x5D,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_COUNTER,
   MOVE_EARTHQUAKE,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_THUNDER,
   MOVE_THUNDER_WAVE,
   MOVE_QUICK_ATTACK,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_ELECTRODE,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x60,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_LIGHT_SCREEN,
   MOVE_MIRROR_COAT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_MUK,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x64,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_GIGA_DRAIN,
   MOVE_FLAMETHROWER,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_FLYGON,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x1C,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_IRON_TAIL,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_STARMIE,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0x5C,
  .moves = {
   MOVE_BLIZZARD,
   MOVE_THUNDERBOLT,
   MOVE_PSYCHIC,
   MOVE_RECOVER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_DODRIO,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x5A,
  .moves = {
   MOVE_DRILL_PECK,
   MOVE_TRI_ATTACK,
   MOVE_AGILITY,
   MOVE_FACADE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_RAICHU,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x4A,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_THUNDER_WAVE,
   MOVE_ATTRACT,
   MOVE_FOCUS_PUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_GOLDUCK,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x45,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_CROSS_CHOP,
   MOVE_BLIZZARD,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_HERACROSS,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x5D,
  .moves = {
   MOVE_MEGAHORN,
   MOVE_EARTHQUAKE,
   MOVE_COUNTER,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WALREIN,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x26,
  .moves = {
   MOVE_SURF,
   MOVE_BLIZZARD,
   MOVE_ROCK_SLIDE,
   MOVE_SHEER_COLD
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_KINGDRA,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x5C,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_ICE_BEAM,
   MOVE_DRAGON_BREATH,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_SALAMENCE,
  .heldItem = BATTLE_TOWER_ITEM_KINGS_ROCK,
  .teamFlags = 0x1D,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_CRUNCH,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_METAGROSS,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x3D,
  .moves = {
   MOVE_METEOR_MASH,
   MOVE_PSYCHIC,
   MOVE_EARTHQUAKE,
   MOVE_SHADOW_BALL
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_REGIROCK,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x3C,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_THUNDERBOLT,
   MOVE_FOCUS_PUNCH,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_REGICE,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x3C,
  .moves = {
   MOVE_ICE_BEAM,
   MOVE_THUNDERBOLT,
   MOVE_HAIL,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_REGISTEEL,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x3C,
  .moves = {
   MOVE_METAL_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_ANCIENT_POWER,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_LATIAS,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x1E,
  .moves = {
   MOVE_MIST_BALL,
   MOVE_ICE_BEAM,
   MOVE_RECOVER,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_LATIOS,
  .heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
  .teamFlags = 0x1D,
  .moves = {
   MOVE_LUSTER_PURGE,
   MOVE_ICE_BEAM,
   MOVE_RECOVER,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_MILOTIC,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x1A,
  .moves = {
   MOVE_HYDRO_PUMP,
   MOVE_ICE_BEAM,
   MOVE_RECOVER,
   MOVE_MIRROR_COAT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_SLAKING,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x15,
  .moves = {
   MOVE_YAWN,
   MOVE_FOCUS_PUNCH,
   MOVE_COUNTER,
   MOVE_PURSUIT
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x8C,
  .moves = {
   MOVE_LEAF_BLADE,
   MOVE_ROCK_TOMB,
   MOVE_DRAGON_CLAW,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
  .teamFlags = 0x8C,
  .moves = {
   MOVE_FOCUS_PUNCH,
   MOVE_COUNTER,
   MOVE_SWAGGER,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x8C,
  .moves = {
   MOVE_SURF,
   MOVE_ICE_BEAM,
   MOVE_ATTRACT,
   MOVE_REST
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_GARDEVOIR,
  .heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_THUNDERBOLT,
   MOVE_ATTRACT,
   MOVE_WILL_O_WISP
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_BRELOOM,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x05,
  .moves = {
   MOVE_SPORE,
   MOVE_FOCUS_PUNCH,
   MOVE_MACH_PUNCH,
   MOVE_COUNTER
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_CHOICE_BAND,
  .teamFlags = 0x58,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_TRICK,
   MOVE_RECOVER,
   MOVE_SNATCH
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_HARIYAMA,
  .heldItem = BATTLE_TOWER_ITEM_FOCUS_BAND,
  .teamFlags = 0x05,
  .moves = {
   MOVE_REVENGE,
   MOVE_COUNTER,
   MOVE_FOCUS_PUNCH,
   MOVE_REVERSAL
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_LUDICOLO,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_RAIN_DANCE,
   MOVE_LEECH_SEED,
   MOVE_GIGA_DRAIN,
   MOVE_DIVE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_CROBAT,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x48,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_CONFUSE_RAY,
   MOVE_SHADOW_BALL,
   MOVE_SNATCH
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x5D,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_FIRE_BLAST,
   MOVE_LOW_KICK,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_MANECTRIC,
  .heldItem = BATTLE_TOWER_ITEM_LUM_BERRY,
  .teamFlags = 0x08,
  .moves = {
   MOVE_THUNDERBOLT,
   MOVE_THUNDER_WAVE,
   MOVE_ATTRACT,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_ELECTRODE,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x60,
  .moves = {
   MOVE_THUNDER,
   MOVE_SWIFT,
   MOVE_MIRROR_COAT,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_BASHFUL,
 },
 {
  .species = SPECIES_MUK,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x64,
  .moves = {
   MOVE_SLUDGE_BOMB,
   MOVE_FLAMETHROWER,
   MOVE_THUNDERBOLT,
   MOVE_SHADOW_PUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_FLYGON,
  .heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
  .teamFlags = 0x0C,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_FIRE_BLAST,
   MOVE_SANDSTORM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_TIMID,
 },
 {
  .species = SPECIES_STARMIE,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x4C,
  .moves = {
   MOVE_SURF,
   MOVE_THUNDERBOLT,
   MOVE_ICE_BEAM,
   MOVE_PSYCHIC
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_LUDICOLO,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x4A,
  .moves = {
   MOVE_LEECH_SEED,
   MOVE_ATTRACT,
   MOVE_DOUBLE_TEAM,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_SKARMORY,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x4B,
  .moves = {
   MOVE_DRILL_PECK,
   MOVE_STEEL_WING,
   MOVE_ATTRACT,
   MOVE_PURSUIT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SPEED,
  .nature = NATURE_SASSY,
 },
 {
  .species = SPECIES_GOLDUCK,
  .heldItem = BATTLE_TOWER_ITEM_SCOPE_LENS,
  .teamFlags = 0x49,
  .moves = {
   MOVE_SURF,
   MOVE_PSYCHIC,
   MOVE_ICE_BEAM,
   MOVE_CROSS_CHOP
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_JOLLY,
 },
 {
  .species = SPECIES_HERACROSS,
  .heldItem = BATTLE_TOWER_ITEM_QUICK_CLAW,
  .teamFlags = 0x5D,
  .moves = {
   MOVE_MEGAHORN,
   MOVE_EARTHQUAKE,
   MOVE_FOCUS_PUNCH,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_WALREIN,
  .heldItem = BATTLE_TOWER_ITEM_LEPPA_BERRY,
  .teamFlags = 0x26,
  .moves = {
   MOVE_SURF,
   MOVE_ICE_BEAM,
   MOVE_FISSURE,
   MOVE_SHEER_COLD
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_KINGDRA,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x5C,
  .moves = {
   MOVE_SURF,
   MOVE_BLIZZARD,
   MOVE_HYPER_BEAM,
   MOVE_FLAIL
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_SALAMENCE,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x1D,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_EARTHQUAKE,
   MOVE_FIRE_BLAST,
   MOVE_HYDRO_PUMP
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_NAUGHTY,
 },
 {
  .species = SPECIES_METAGROSS,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x3D,
  .moves = {
   MOVE_METEOR_MASH,
   MOVE_PSYCHIC,
   MOVE_EARTHQUAKE,
   MOVE_HYPER_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_REGIROCK,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x3C,
  .moves = {
   MOVE_EARTHQUAKE,
   MOVE_THUNDERBOLT,
   MOVE_SUPERPOWER,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_REGICE,
  .heldItem = BATTLE_TOWER_ITEM_LAX_INCENSE,
  .teamFlags = 0x3C,
  .moves = {
   MOVE_ICE_BEAM,
   MOVE_THUNDERBOLT,
   MOVE_ANCIENT_POWER,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_ATTACK,
  .nature = NATURE_CAREFUL,
 },
 {
  .species = SPECIES_REGISTEEL,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x3C,
  .moves = {
   MOVE_METAL_CLAW,
   MOVE_THUNDERBOLT,
   MOVE_HYPER_BEAM,
   MOVE_EXPLOSION
  },
  .evSpread = F_EV_SPREAD_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_GENTLE,
 },
 {
  .species = SPECIES_LATIAS,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0x1E,
  .moves = {
   MOVE_MIST_BALL,
   MOVE_THUNDERBOLT,
   MOVE_EARTHQUAKE,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_LATIOS,
  .heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
  .teamFlags = 0x1D,
  .moves = {
   MOVE_LUSTER_PURGE,
   MOVE_THUNDERBOLT,
   MOVE_EARTHQUAKE,
   MOVE_ICE_BEAM
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_MILOTIC,
  .heldItem = BATTLE_TOWER_ITEM_APICOT_BERRY,
  .teamFlags = 0x1A,
  .moves = {
   MOVE_SURF,
   MOVE_ICE_BEAM,
   MOVE_RECOVER,
   MOVE_ATTRACT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_BRAVE,
 },
 {
  .species = SPECIES_ALTARIA,
  .heldItem = BATTLE_TOWER_ITEM_GANLON_BERRY,
  .teamFlags = 0x0A,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_ICE_BEAM,
   MOVE_SING,
   MOVE_FLAMETHROWER
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_SCEPTILE,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x9C,
  .moves = {
   MOVE_LEAF_BLADE,
   MOVE_DETECT,
   MOVE_DRAGON_CLAW,
   MOVE_CRUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_BLAZIKEN,
  .heldItem = BATTLE_TOWER_ITEM_SALAC_BERRY,
  .teamFlags = 0x9C,
  .moves = {
   MOVE_BLAZE_KICK,
   MOVE_SKY_UPPERCUT,
   MOVE_EARTHQUAKE,
   MOVE_ROCK_SLIDE
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_ATTACK,
  .nature = NATURE_DOCILE,
 },
 {
  .species = SPECIES_SWAMPERT,
  .heldItem = BATTLE_TOWER_ITEM_PETAYA_BERRY,
  .teamFlags = 0x9C,
  .moves = {
   MOVE_SURF,
   MOVE_EARTHQUAKE,
   MOVE_ICE_BEAM,
   MOVE_ROCK_TOMB
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_HP,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SHEDINJA,
  .heldItem = BATTLE_TOWER_ITEM_BRIGHT_POWDER,
  .teamFlags = 0x20,
  .moves = {
   MOVE_CONFUSE_RAY,
   MOVE_SHADOW_BALL,
   MOVE_TOXIC,
   MOVE_GRUDGE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_METAGROSS,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x1D,
  .moves = {
   MOVE_METEOR_MASH,
   MOVE_EARTHQUAKE,
   MOVE_DOUBLE_TEAM,
   MOVE_PROTECT
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_DEFENSE | F_EV_SPREAD_HP,
  .nature = NATURE_NAIVE,
 },
 {
  .species = SPECIES_ALAKAZAM,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x58,
  .moves = {
   MOVE_PSYCHIC,
   MOVE_THUNDER_PUNCH,
   MOVE_ICE_PUNCH,
   MOVE_FIRE_PUNCH
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_HASTY,
 },
 {
  .species = SPECIES_LATIAS,
  .heldItem = BATTLE_TOWER_ITEM_LEFTOVERS,
  .teamFlags = 0x1E,
  .moves = {
   MOVE_MIST_BALL,
   MOVE_THUNDERBOLT,
   MOVE_ICE_BEAM,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_QUIET,
 },
 {
  .species = SPECIES_LATIOS,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x1D,
  .moves = {
   MOVE_LUSTER_PURGE,
   MOVE_THUNDERBOLT,
   MOVE_ICE_BEAM,
   MOVE_DRAGON_CLAW
  },
  .evSpread = F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_SPEED,
  .nature = NATURE_HARDY,
 },
 {
  .species = SPECIES_SALAMENCE,
  .heldItem = BATTLE_TOWER_ITEM_SHELL_BELL,
  .teamFlags = 0x1D,
  .moves = {
   MOVE_DRAGON_CLAW,
   MOVE_FLAMETHROWER,
   MOVE_EARTHQUAKE,
   MOVE_AERIAL_ACE
  },
  .evSpread = F_EV_SPREAD_SP_DEFENSE | F_EV_SPREAD_SP_ATTACK | F_EV_SPREAD_DEFENSE,
  .nature = NATURE_RELAXED,
 },
 {
  .species = SPECIES_MACHAMP,
  .heldItem = BATTLE_TOWER_ITEM_LIECHI_BERRY,
  .teamFlags = 0x5D,
  .moves = {
   MOVE_CROSS_CHOP,
   MOVE_EARTHQUAKE,
   MOVE_LOW_KICK,
   MOVE_ROCK_SLIDE
  },
  .evSpread = F_EV_SPREAD_SPEED | F_EV_SPREAD_ATTACK,
  .nature = NATURE_HARDY,
 },
};
# 99 "src/field/battle_tower.c" 2

static const u8 sMaleTrainerClasses[] = {
    TRAINER_CLASS_RUIN_MANIAC,
    TRAINER_CLASS_TUBER_M,
    TRAINER_CLASS_COOL_TRAINER_M,
    TRAINER_CLASS_RICH_BOY,
    TRAINER_CLASS_POKEMANIAC,
    TRAINER_CLASS_SWIMMER_M,
    TRAINER_CLASS_BLACK_BELT,
    TRAINER_CLASS_GUITARIST,
    TRAINER_CLASS_KINDLER,
    TRAINER_CLASS_CAMPER,
    TRAINER_CLASS_BUG_MANIAC,
    TRAINER_CLASS_PSYCHIC_M,
    TRAINER_CLASS_GENTLEMAN,
    TRAINER_CLASS_SCHOOL_KID_M,
    TRAINER_CLASS_POKEFAN_M,
    TRAINER_CLASS_EXPERT_M,
    TRAINER_CLASS_YOUNGSTER,
    TRAINER_CLASS_FISHERMAN,
    TRAINER_CLASS_CYCLING_TRIATHLETE_M,
    TRAINER_CLASS_RUNNING_TRIATHLETE_M,
    TRAINER_CLASS_SWIMMING_TRIATHLETE_M,
    TRAINER_CLASS_DRAGON_TAMER,
    TRAINER_CLASS_BIRD_KEEPER,
    TRAINER_CLASS_NINJA_BOY,
    TRAINER_CLASS_SAILOR,
    TRAINER_CLASS_COLLECTOR,
    TRAINER_CLASS_POKEMON_BREEDER_M,
    TRAINER_CLASS_POKEMON_RANGER_M,
    TRAINER_CLASS_BUG_CATCHER,
    TRAINER_CLASS_HIKER,
};

static const u8 sFemaleTrainerClasses[] = {
    TRAINER_CLASS_AROMA_LADY,
    TRAINER_CLASS_TUBER_F,
    TRAINER_CLASS_COOL_TRAINER_F,
    TRAINER_CLASS_HEX_MANIAC,
    TRAINER_CLASS_LADY,
    TRAINER_CLASS_BEAUTY,
    TRAINER_CLASS_PSYCHIC_F,
    TRAINER_CLASS_SCHOOL_KID_F,
    TRAINER_CLASS_POKEFAN_F,
    TRAINER_CLASS_EXPERT_F,
    TRAINER_CLASS_CYCLING_TRIATHLETE_F,
    TRAINER_CLASS_RUNNING_TRIATHLETE_F,
    TRAINER_CLASS_SWIMMING_TRIATHLETE_F,
    TRAINER_CLASS_BATTLE_GIRL,
    TRAINER_CLASS_PARASOL_LADY,
    TRAINER_CLASS_SWIMMER_F,
    TRAINER_CLASS_PICNICKER,
    TRAINER_CLASS_POKEMON_BREEDER_F,
    TRAINER_CLASS_POKEMON_RANGER_F,
    TRAINER_CLASS_LASS,
};

static const u8 sMaleTrainerGfxIds[] = {
    MAP_OBJ_GFX_HIKER,
    MAP_OBJ_GFX_TUBER_M,
    MAP_OBJ_GFX_MAN_4,
    MAP_OBJ_GFX_BOY_4,
    MAP_OBJ_GFX_MANIAC,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_M,
    MAP_OBJ_GFX_BLACK_BELT,
    MAP_OBJ_GFX_MAN_6,
    MAP_OBJ_GFX_MAN_6,
    MAP_OBJ_GFX_CAMPER,
    MAP_OBJ_GFX_MANIAC,
    MAP_OBJ_GFX_PSYCHIC_M,
    MAP_OBJ_GFX_GENTLEMAN,
    MAP_OBJ_GFX_SCHOOL_KID_M,
    MAP_OBJ_GFX_MAN_3,
    MAP_OBJ_GFX_OLD_MAN_1,
    MAP_OBJ_GFX_YOUNGSTER,
    MAP_OBJ_GFX_FISHERMAN,
    MAP_OBJ_GFX_CYCLING_TRIATHLETE_M,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_M,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_M,
    MAP_OBJ_GFX_MAN_4,
    MAP_OBJ_GFX_MAN_6,
    MAP_OBJ_GFX_LITTLE_BOY_1,
    MAP_OBJ_GFX_SAILOR,
    MAP_OBJ_GFX_MANIAC,
    MAP_OBJ_GFX_MAN_5,
    MAP_OBJ_GFX_CAMPER,
    MAP_OBJ_GFX_BUG_CATCHER,
    MAP_OBJ_GFX_HIKER,
};

static const u8 sFemaleTrainerGfxIds[] = {
    MAP_OBJ_GFX_WOMAN_3,
    MAP_OBJ_GFX_TUBER_F,
    MAP_OBJ_GFX_WOMAN_7,
    MAP_OBJ_GFX_WOMAN_1,
    MAP_OBJ_GFX_WOMAN_3,
    MAP_OBJ_GFX_BEAUTY,
    MAP_OBJ_GFX_LASS,
    MAP_OBJ_GFX_GIRL_3,
    MAP_OBJ_GFX_WOMAN_2,
    MAP_OBJ_GFX_OLD_WOMAN_1,
    MAP_OBJ_GFX_CYCLING_TRIATHLETE_F,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_F,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_F,
    MAP_OBJ_GFX_GIRL_3,
    MAP_OBJ_GFX_WOMAN_7,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_F,
    MAP_OBJ_GFX_PICNICKER,
    MAP_OBJ_GFX_WOMAN_3,
    MAP_OBJ_GFX_PICNICKER,
    MAP_OBJ_GFX_LASS,
};

const u16 gBattleTowerBannedSpecies[] = {
    SPECIES_MEW,
    SPECIES_MEWTWO,
    SPECIES_HO_OH,
    SPECIES_LUGIA,
    SPECIES_CELEBI,
    SPECIES_KYOGRE,
    SPECIES_GROUDON,
    SPECIES_RAYQUAZA,
    SPECIES_JIRACHI,
    SPECIES_DEOXYS,
    0xFFFF,
};


           const u16 sShortStreakPrizes[] = {
    ITEM_HP_UP,
    ITEM_PROTEIN,
    ITEM_IRON,
    ITEM_CALCIUM,
    ITEM_CARBOS,
    ITEM_ZINC,
};


           const u16 sLongStreakPrizes[] = {
    ITEM_BRIGHT_POWDER,
    ITEM_WHITE_HERB,
    ITEM_QUICK_CLAW,
    ITEM_LEFTOVERS,
    ITEM_MENTAL_HERB,
    ITEM_KINGS_ROCK,
    ITEM_FOCUS_BAND,
    ITEM_SCOPE_LENS,
    ITEM_CHOICE_BAND,
};

static void ResetBattleTowerStreak(u8 levelType);
static void ValidateBattleTowerRecordChecksums(void);
static void PrintEReaderTrainerFarewellMessage(void);
extern void SetBattleTowerTrainerGfxId(u8);
extern void sub_8135A3C(void);
static void sub_8135CFC(void);
static void CheckMonBattleTowerBanlist(u16, u16, u16, u8, u8, u16 *, u16 *, u8 *);
static void ClearEReaderTrainer(struct BattleTowerEReaderTrainer *);
static void SetEReaderTrainerChecksum(struct BattleTowerEReaderTrainer *ereaderTrainer);
static void SetBattleTowerRecordChecksum(struct BattleTowerRecord *);
static void ClearBattleTowerRecord(struct BattleTowerRecord *);

extern const u8 BattleText_Format3[];
extern const u8 BattleText_Format4[];
extern const u8 BattleText_Format5[];
extern const u8 BattleText_Format6[];
extern const u8 BattleText_Format7[];
extern const u8 BattleText_Format8[];
extern const u8 BattleText_Format9[];
extern u16 gSpecialVar_0x8004;
extern u8 gTrainerClassToPicIndex[];
extern u8 gTrainerClassToNameIndex[];
extern u16 gTrainerBattleOpponent;
extern u16 gBattleTypeFlags;
extern u8 gSelectedOrderFromParty[];
extern u8 gBattleOutcome;
extern struct Pokemon gUnknown_030042FC[];
extern struct BattlePokemon gBattleMons[];

void sub_8134548(void)
{
    u8 var1 = 0;
    s32 levelType;

    for (levelType = 0; levelType < 2; levelType++)
    {
        switch (gSaveBlock2.battleTower.var_4AE[levelType])
        {
        case 0:
        default:
            ResetBattleTowerStreak(levelType);
            if (!var1)
            {
                VarSet(0x4000, 5);
            }
            break;
        case 1:
            ResetBattleTowerStreak(levelType);
            VarSet(0x4000, 1);
            var1++;
            break;
        case 4:
            VarSet(0x4000, 2);
            var1++;
            break;
        case 5:
            VarSet(0x4000, 3);
            var1++;
            break;
        case 2:
            VarSet(0x4000, 4);
            var1++;
            break;
        case 3:
        case 6:
            break;
        }
    }

    if ((gSaveBlock2.battleTower.var_4AE[0] == 3 || gSaveBlock2.battleTower.var_4AE[0] == 6)
        && (gSaveBlock2.battleTower.var_4AE[1] == 3 || gSaveBlock2.battleTower.var_4AE[1] == 6))
    {
        VarSet(0x4000, 5);
    }

    ValidateBattleTowerRecordChecksums();
}

void ResetBattleTowerStreak(u8 levelType)
{
    gSaveBlock2.battleTower.var_4AE[levelType] = 0;
    gSaveBlock2.battleTower.curChallengeBattleNum[levelType] = 1;
    gSaveBlock2.battleTower.curStreakChallengesNum[levelType] = 1;
}


bool8 ShouldBattleEReaderTrainer(u8 levelType, u16 winStreak)
{
    u8 trainerTeamLevel;
    u8 monLevel;
    s32 i;
    u16 validPartySpecies[6];
    u16 validPartyHeldItems[6];
    u8 numValid;

    numValid = 0;

    ValidateEReaderTrainer();

    if (gScriptResult != 0 || gSaveBlock2.battleTower.ereaderTrainer.winStreak != winStreak)
    {
        return 0;
    }

    trainerTeamLevel = 50;
    if (levelType != 0)
    {
        trainerTeamLevel = 100;
    }

    for (i = 0; i < 3; i++)
    {
        monLevel = gSaveBlock2.battleTower.ereaderTrainer.party[i].level;
        if (gSaveBlock2.battleTower.ereaderTrainer.party[i].level != trainerTeamLevel)
        {
            return 0;
        }

        CheckMonBattleTowerBanlist(
            gSaveBlock2.battleTower.ereaderTrainer.party[i].species,
            gSaveBlock2.battleTower.ereaderTrainer.party[i].heldItem,
            1,
            levelType,
            monLevel,
            validPartySpecies,
            validPartyHeldItems,
            &numValid);
    }

    return numValid == 3;
}

bool8 sub_81346F4(void)
{
    s32 recordIndex, i;
    u8 battleTowerLevelType;
    u16 winStreak;
    bool8 retVal;
    s32 numCandidates;
    u32 trainerIds[5];

    numCandidates = 0;
    battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    winStreak = GetCurrentBattleTowerWinStreak(battleTowerLevelType);
    if (ShouldBattleEReaderTrainer(battleTowerLevelType, winStreak))
    {
        gSaveBlock2.battleTower.battleTowerTrainerId = 200;
        retVal = 1;
    }
    else
    {

        for (recordIndex = 0; recordIndex < 5; recordIndex++)
        {
            struct BattleTowerRecord *record = &gSaveBlock2.battleTower.records[recordIndex];
            u32 recordHasData = 0;
            u32 checksum = 0;
            for (i = 0; i < sizeof(struct BattleTowerRecord) / sizeof(u32) - 1; i++)
            {
                recordHasData |= ((u32 *)record)[i];
                checksum += ((u32 *)record)[i];
            }

            if (gSaveBlock2.battleTower.records[recordIndex].winStreak == winStreak
                && gSaveBlock2.battleTower.records[recordIndex].battleTowerLevelType == battleTowerLevelType
                && recordHasData
                && gSaveBlock2.battleTower.records[recordIndex].checksum == checksum)
            {
                trainerIds[numCandidates] = recordIndex;
                numCandidates++;
            }
        }

        if (numCandidates == 0)
        {
            retVal = 0;
        }
        else
        {
            gSaveBlock2.battleTower.battleTowerTrainerId = trainerIds[Random() % numCandidates] + 100;
            retVal = 1;
        }
    }

    return retVal;
}
# 513 "src/field/battle_tower.c"
__attribute__((naked))
void sub_81347F8(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    ldr r5, _08134838 @ =gSaveBlock2\n    ldr r1, _0813483C @ =0x00000554\n    adds r0, r5, r1\n    ldrb r0, [r0]\n    lsls r0, 31\n    lsrs r6, r0, 31\n    bl sub_81346F4\n    lsls r0, 24\n    cmp r0, 0\n    beq _08134848\n    ldr r2, _08134840 @ =0x00000564\n    adds r4, r5, r2\n    ldrb r0, [r4]\n    bl SetBattleTowerTrainerGfxId\n    lsls r0, r6, 1\n    movs r3, 0xAB\n    lsls r3, 3\n    adds r1, r5, r3\n    adds r0, r1\n    ldrh r0, [r0]\n    adds r0, r5, r0\n    ldr r1, _08134844 @ =0x00000569\n    adds r0, r1\n    ldrb r1, [r4]\n    b _081349DC\n    .align 2, 0\n_08134838: .4byte gSaveBlock2\n_0813483C: .4byte 0x00000554\n_08134840: .4byte 0x00000564\n_08134844: .4byte 0x00000569\n_08134848:\n    lsls r0, r6, 1\n    ldr r2, _081348D8 @ =0x0000055c\n    adds r1, r5, r2\n    adds r1, r0, r1\n    ldrh r1, [r1]\n    adds r7, r0, 0\n    cmp r1, 0x7\n    bls _0813485A\n    b _0813495C\n_0813485A:\n    movs r3, 0xAB\n    lsls r3, 3\n    adds r0, r5, r3\n    adds r1, r7, r0\n    ldrh r0, [r1]\n    cmp r0, 0x7\n    bne _081348E4\n    adds r6, r5, 0\n    mov r9, r7\n    adds r5, r1, 0\n    ldr r0, _081348DC @ =0x0000056a\n    adds r0, r6\n    mov r10, r0\n    mov r8, r5\n_08134876:\n    bl Random\n    movs r1, 0xFF\n    ands r1, r0\n    lsls r2, r1, 2\n    adds r2, r1\n    ldr r1, _081348D8 @ =0x0000055c\n    adds r4, r6, r1\n    mov r3, r9\n    adds r0, r3, r4\n    ldrh r1, [r0]\n    subs r1, 0x1\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 1\n    adds r0, 0x14\n    lsrs r2, 7\n    adds r2, r0\n    lsls r2, 16\n    lsrs r2, 16\n    movs r1, 0\n    ldrh r0, [r5]\n    subs r0, 0x1\n    cmp r1, r0\n    bge _081348C8\n    mov r3, r10\n    ldrb r0, [r3]\n    cmp r0, r2\n    beq _081348C8\n    subs r0, r4, 0x4\n    adds r0, r7, r0\n    ldrh r0, [r0]\n    subs r3, r0, 0x1\n    adds r4, 0xE\n_081348BA:\n    adds r1, 0x1\n    cmp r1, r3\n    bge _081348C8\n    adds r0, r1, r4\n    ldrb r0, [r0]\n    cmp r0, r2\n    bne _081348BA\n_081348C8:\n    mov r3, r8\n    ldrh r0, [r3]\n    subs r0, 0x1\n    ldr r4, _081348E0 @ =gSaveBlock2\n    cmp r1, r0\n    bne _08134876\n    b _081349B6\n    .align 2, 0\n_081348D8: .4byte 0x0000055c\n_081348DC: .4byte 0x0000056a\n_081348E0: .4byte gSaveBlock2\n_081348E4:\n    adds r6, r5, 0\n    mov r9, r7\n    adds r5, r1, 0\n    ldr r2, _08134950 @ =0x0000056a\n    adds r2, r6\n    mov r10, r2\n    mov r8, r5\n_081348F2:\n    bl Random\n    movs r1, 0xFF\n    ands r1, r0\n    lsls r0, r1, 2\n    adds r0, r1\n    lsrs r2, r0, 6\n    ldr r3, _08134954 @ =0x0000055c\n    adds r4, r6, r3\n    mov r1, r9\n    adds r0, r1, r4\n    ldrh r1, [r0]\n    subs r1, 0x1\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 1\n    adds r0, r2, r0\n    lsls r0, 16\n    lsrs r2, r0, 16\n    movs r1, 0\n    ldrh r0, [r5]\n    subs r0, 0x1\n    cmp r1, r0\n    bge _08134942\n    mov r3, r10\n    ldrb r0, [r3]\n    cmp r0, r2\n    beq _08134942\n    subs r0, r4, 0x4\n    adds r0, r7, r0\n    ldrh r0, [r0]\n    subs r3, r0, 0x1\n    adds r4, 0xE\n_08134934:\n    adds r1, 0x1\n    cmp r1, r3\n    bge _08134942\n    adds r0, r1, r4\n    ldrb r0, [r0]\n    cmp r0, r2\n    bne _08134934\n_08134942:\n    mov r3, r8\n    ldrh r0, [r3]\n    subs r0, 0x1\n    ldr r4, _08134958 @ =gSaveBlock2\n    cmp r1, r0\n    bne _081348F2\n    b _081349B6\n    .align 2, 0\n_08134950: .4byte 0x0000056a\n_08134954: .4byte 0x0000055c\n_08134958: .4byte gSaveBlock2\n_0813495C:\n    movs r2, 0xAB\n    lsls r2, 3\n    adds r0, r5, r2\n    adds r6, r7, r0\n    ldr r3, _081349EC @ =0x0000056a\n    adds r3, r5\n    mov r8, r3\n    adds r5, r6, 0\n_0813496C:\n    bl Random\n    movs r1, 0xFF\n    ands r1, r0\n    lsls r0, r1, 4\n    subs r0, r1\n    lsls r0, 1\n    asrs r0, 8\n    adds r0, 0x46\n    lsls r0, 16\n    lsrs r2, r0, 16\n    movs r1, 0\n    ldrh r0, [r6]\n    subs r0, 0x1\n    cmp r1, r0\n    bge _081349AC\n    mov r3, r8\n    ldrb r0, [r3]\n    ldr r4, _081349F0 @ =gSaveBlock2\n    cmp r0, r2\n    beq _081349AC\n    ldrh r0, [r5]\n    subs r3, r0, 0x1\n    ldr r0, _081349EC @ =0x0000056a\n    adds r4, r0\n_0813499E:\n    adds r1, 0x1\n    cmp r1, r3\n    bge _081349AC\n    adds r0, r1, r4\n    ldrb r0, [r0]\n    cmp r0, r2\n    bne _0813499E\n_081349AC:\n    ldrh r0, [r6]\n    subs r0, 0x1\n    ldr r4, _081349F0 @ =gSaveBlock2\n    cmp r1, r0\n    bne _0813496C\n_081349B6:\n    ldr r1, _081349F4 @ =0x00000564\n    adds r0, r4, r1\n    strb r2, [r0]\n    ldr r2, _081349F4 @ =0x00000564\n    adds r5, r4, r2\n    ldrb r0, [r5]\n    bl SetBattleTowerTrainerGfxId\n    movs r3, 0xAB\n    lsls r3, 3\n    adds r0, r4, r3\n    adds r1, r7, r0\n    ldrh r0, [r1]\n    cmp r0, 0x6\n    bhi _081349DE\n    adds r0, r4, r0\n    ldr r1, _081349F8 @ =0x00000569\n    adds r0, r1\n    ldrb r1, [r5]\n_081349DC:\n    strb r1, [r0]\n_081349DE:\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_081349EC: .4byte 0x0000056a\n_081349F0: .4byte gSaveBlock2\n_081349F4: .4byte 0x00000564\n_081349F8: .4byte 0x00000569\n.syntax divided\n");
# 775 "src/field/battle_tower.c"
}

void SetBattleTowerTrainerGfxId(u8 trainerIndex)
{
    u32 i;
    u8 trainerClass;

    if (trainerIndex < 100)
    {
        trainerClass = gBattleTowerTrainers[trainerIndex].trainerClass;
    }
    else if (trainerIndex < 200)
    {
        trainerClass = gSaveBlock2.battleTower.records[trainerIndex - 100].trainerClass;
    }
    else
    {
        trainerClass = gSaveBlock2.battleTower.ereaderTrainer.trainerClass;
    }

    for (i = 0; i < 30 && sMaleTrainerClasses[i] != trainerClass; i++);
    if (i != 30)
    {
        u8 trainerObjectGfxId = sMaleTrainerGfxIds[i];
        VarSet(0x4010, trainerObjectGfxId);
        return;
    }

    for (i = 0; i < 20 && sFemaleTrainerClasses[i] != trainerClass; i++);
    if (i != 20)
    {
        u8 trainerObjectGfxId = sFemaleTrainerGfxIds[i];
        VarSet(0x4010, trainerObjectGfxId);
        return;
    }

    VarSet(0x4010, MAP_OBJ_GFX_BOY_1);
}

void SetEReaderTrainerGfxId(void)
{
    SetBattleTowerTrainerGfxId(200);
}
# 903 "src/field/battle_tower.c"
__attribute__((naked))
void sub_8134AC0(struct BattleTowerRecord *record)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x1C\n    movs r7, 0\n    mov r8, r0\n    movs r5, 0\n    ldr r0, _08134B3C @ =gSaveBlock2\n    mov r12, r0\n    mov r1, r8\n    ldrb r1, [r1, 0xC]\n    str r1, [sp, 0x18]\n    movs r2, 0xAA\n    lsls r2, 1\n    add r2, r12\n    mov r10, r2\n    mov r9, r5\n_08134AE6:\n    movs r6, 0\n    movs r3, 0\n    ldr r0, _08134B40 @ =gSaveBlock2 + 0x158\n    add r0, r9\n    ldrb r0, [r0]\n    ldr r1, [sp, 0x18]\n    cmp r0, r1\n    bne _08134B14\n    movs r0, 0xA4\n    muls r0, r5\n    ldr r1, _08134B40 @ =gSaveBlock2 + 0x158\n    adds r2, r0, r1\n    mov r4, r8\n    adds r4, 0xC\n_08134B02:\n    adds r2, 0x1\n    adds r3, 0x1\n    cmp r3, 0x3\n    bgt _08134B14\n    adds r1, r4, r3\n    ldrb r0, [r2]\n    ldrb r1, [r1]\n    cmp r0, r1\n    beq _08134B02\n_08134B14:\n    cmp r3, 0x4\n    bne _08134B54\n    movs r6, 0\n    mov r2, r10\n    ldrb r0, [r2]\n    mov r3, r8\n    ldrb r3, [r3, 0x8]\n    cmp r0, r3\n    bne _08134B54\n    adds r1, r0, 0\n    movs r0, 0xA4\n    muls r0, r5\n    adds r0, 0x4\n    ldr r3, _08134B44 @ =gSaveBlock2 + 0x150\n    adds r2, r0, r3\n_08134B32:\n    cmp r1, 0xFF\n    bne _08134B48\n    movs r6, 0x7\n    b _08134B54\n    .align 2, 0\n_08134B3C: .4byte gSaveBlock2\n_08134B40: .4byte gSaveBlock2 + 0x158\n_08134B44: .4byte gSaveBlock2 + 0x150\n_08134B48:\n    adds r6, 0x1\n    cmp r6, 0x6\n    bgt _08134B54\n    ldrb r0, [r2]\n    cmp r0, r1\n    beq _08134B32\n_08134B54:\n    cmp r6, 0x7\n    beq _08134B64\n    movs r0, 0xA4\n    add r10, r0\n    add r9, r0\n    adds r5, 0x1\n    cmp r5, 0x4\n    ble _08134AE6\n\n_08134B64:\n    cmp r5, 0x4\n    bgt _08134B76\n    movs r0, 0xA4\n    muls r0, r5\n    add r0, r12\n    movs r1, 0xA6\n    lsls r1, 1\n    adds r0, r1\n    b _08134B9E\n_08134B76:\n    movs r5, 0\n    movs r1, 0xA7\n    lsls r1, 1\n    add r1, r12\n    b _08134B88\n_08134B80:\n    adds r1, 0xA4\n    adds r5, 0x1\n    cmp r5, 0x4\n    bgt _08134BA8\n_08134B88:\n    ldrh r0, [r1]\n    cmp r0, 0\n    bne _08134B80\n    cmp r5, 0x4\n    bgt _08134BA8\n    movs r0, 0xA4\n    muls r0, r5\n    add r0, r12\n    movs r2, 0xA6\n    lsls r2, 1\n    adds r0, r2\n_08134B9E:\n    mov r1, r8\n    movs r2, 0xA4\n    bl memcpy\n    b _08134C5E\n\n_08134BA8:\n    mov r2, sp\n    movs r3, 0xA7\n    lsls r3, 1\n    mov r1, r12\n    adds r0, r1, r3\n    ldrh r0, [r0]\n    movs r1, 0\n    strh r0, [r2]\n    add r0, sp, 0xC\n    strh r1, [r0]\n    adds r7, 0x1\n    movs r5, 0x1\n    add r2, sp, 0xC  @var2 = r2\n    mov r9, r2\n    mov r10, r3\n_08134BC6:\n    movs r3, 0\n    adds r0, r5, 0x1\n    mov r12, r0\n    cmp r3, r7\n    bge _08134C0A  @ j < l\n    movs r1, 0xA4\n    adds r0, r5, 0\n    muls r0, r1\n    ldr r2, _08134BFC @ =gSaveBlock2\n    adds r0, r2\n    mov r1, r10\n    adds r4, r0, r1\n    mov r6, sp\n_08134BE0:\n    lsls r0, r3, 1\n    add r0, sp\n    ldrh r2, [r4]\n    adds r1, r2, 0\n    ldrh r0, [r0]\n    cmp r1, r0\n    bcs _08134C00\n    movs r3, 0\n    movs r7, 0x1\n    strh r2, [r6]\n    mov r2, r9\n    strh r5, [r2]\n    b _08134C0A\n    .align 2, 0\n_08134BFC: .4byte gSaveBlock2\n_08134C00:\n    cmp r1, r0\n    bhi _08134C0A\n    adds r3, 0x1\n    cmp r3, r7\n    blt _08134BE0\n_08134C0A:\n    cmp r3, r7\n    bne _08134C2A\n    lsls r1, r7, 1\n    mov r3, sp\n    adds r2, r3, r1\n    movs r3, 0xA4\n    adds r0, r5, 0\n    muls r0, r3\n    ldr r3, _08134C70 @ =gSaveBlock2\n    adds r0, r3\n    add r0, r10\n    ldrh r0, [r0]\n    strh r0, [r2]\n    add r1, r9\n    strh r5, [r1]\n    adds r7, 0x1\n_08134C2A:\n    mov r5, r12\n    cmp r5, 0x4\n    ble _08134BC6\n    bl Random\n    lsls r0, 16\n    lsrs r0, 16\n    adds r1, r7, 0\n    bl __modsi3\n    adds r5, r0, 0\n    ldr r2, _08134C70 @ =gSaveBlock2\n    lsls r0, r5, 1\n    add r0, sp\n    adds r0, 0xC\n    ldrh r1, [r0]\n    movs r0, 0xA4\n    muls r0, r1\n    adds r0, r2\n    movs r1, 0xA6\n    lsls r1, 1\n    adds r0, r1\n    mov r1, r8\n    movs r2, 0xA4\n    bl memcpy\n_08134C5E:\n    add sp, 0x1C\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08134C70: .4byte gSaveBlock2\n    .syntax divided\n");
# 1137 "src/field/battle_tower.c"
}

u8 get_trainer_class_pic_index(void)
{
    if (gSaveBlock2.battleTower.battleTowerTrainerId == 200)
    {
        return gTrainerClassToPicIndex[gSaveBlock2.battleTower.ereaderTrainer.trainerClass];
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 100)
    {
        return gTrainerClassToPicIndex[gBattleTowerTrainers[gSaveBlock2.battleTower.battleTowerTrainerId].trainerClass];
    }
    else
    {
        return gTrainerClassToPicIndex[gSaveBlock2.battleTower.records[gSaveBlock2.battleTower.battleTowerTrainerId - 100].trainerClass];
    }
}

u8 get_trainer_class_name_index(void)
{
    if (gSaveBlock2.battleTower.battleTowerTrainerId == 200)
    {
        return gTrainerClassToNameIndex[gSaveBlock2.battleTower.ereaderTrainer.trainerClass];
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId >= 100)
    {
        return gTrainerClassToNameIndex[gSaveBlock2.battleTower.records[gSaveBlock2.battleTower.battleTowerTrainerId - 100].trainerClass];
    }
    else
    {
        return gTrainerClassToNameIndex[gBattleTowerTrainers[gSaveBlock2.battleTower.battleTowerTrainerId].trainerClass];
    }
}

void get_trainer_name(u8* dest)
{
    s32 i;

    if (gSaveBlock2.battleTower.battleTowerTrainerId == 200)
    {
        for (i = 0; i < 7; i++)
        {
            dest[i] = gSaveBlock2.battleTower.ereaderTrainer.name[i];
        }
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 100)
    {
        for (i = 0; i < 7; i++)
        {
            dest[i] = gBattleTowerTrainers[gSaveBlock2.battleTower.battleTowerTrainerId].name[i];
        }
    }
    else
    {
        for (i = 0; i < 7; i++)
        {
            dest[i] = gSaveBlock2.battleTower.records[gSaveBlock2.battleTower.battleTowerTrainerId - 100].name[i];
        }
    }

    dest[i] = 0xFF;
}

void FillBattleTowerTrainerParty(void)
{
    s32 partyIndex, i;
    u16 chosenMonIndices[3];
    u8 friendship;
    u8 level;
    u8 fixedIV;
    u8 battleMonsOffset;
    u8 monPoolSize;
    u8 teamFlags;
    const struct BattleTowerPokemon *battleTowerMons;

    battleMonsOffset = 0;
    monPoolSize = 60;
    friendship = 255;

    ZeroEnemyPartyMons();




    if (gSaveBlock2.battleTower.battleTowerTrainerId < 20)
    {
        fixedIV = 6;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 30)
    {
        fixedIV = 9;
        battleMonsOffset = 30;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 40)
    {
        fixedIV = 12;
        battleMonsOffset = 60;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 50)
    {
        fixedIV = 15;
        battleMonsOffset = 90;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 60)
    {
        fixedIV = 18;
        battleMonsOffset = 120;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 70)
    {
        fixedIV = 21;
        battleMonsOffset = 150;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 80)
    {
        fixedIV = 31;
        battleMonsOffset = 180;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 100)
    {
        fixedIV = 31;
        battleMonsOffset = 200;
        monPoolSize = 100;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId == 200)
    {

        for (partyIndex = 0; partyIndex < 3; partyIndex++)
        {
            sub_803ADE8(&gEnemyParty[partyIndex], &gSaveBlock2.battleTower.ereaderTrainer.party[partyIndex]);
        }

        return;
    }
    else
    {

        for (partyIndex = 0; partyIndex < 3; partyIndex++)
        {
            sub_803ADE8(
                &gEnemyParty[partyIndex],
                &gSaveBlock2.battleTower.records[gSaveBlock2.battleTower.battleTowerTrainerId - 100].party[partyIndex]);
        }

        return;
    }



    if (gSaveBlock2.battleTower.battleTowerLevelType != 0)
    {
        battleTowerMons = gBattleTowerLevel100Mons;
        level = 100;
    }
    else
    {
        battleTowerMons = gBattleTowerLevel50Mons;
        level = 50;
    }

    teamFlags = gBattleTowerTrainers[gSaveBlock2.battleTower.battleTowerTrainerId].teamFlags;






    partyIndex = 0;
    while (partyIndex != 3)
    {


        s32 battleMonIndex = ((Random() & 0xFF) * monPoolSize) / 256 + battleMonsOffset;


        if (teamFlags == 0 || (battleTowerMons[battleMonIndex].teamFlags & teamFlags) == teamFlags)
        {

            for (i = 0; i < partyIndex; i++)
            {
                if (GetMonData(&gEnemyParty[i], 11, ((void *)0)) == battleTowerMons[battleMonIndex].species)
                    break;
            }

            if (i != partyIndex)
                continue;


            for (i = 0; i < partyIndex; i++)
            {
                if (GetMonData(&gEnemyParty[i], 12, ((void *)0)) != 0
                    && GetMonData(&gEnemyParty[i], 12, ((void *)0)) == sBattleTowerHeldItems[battleTowerMons[battleMonIndex].heldItem])
                {
                    break;
                }
            }

            if (i != partyIndex)
                continue;




            for (i = 0; i < partyIndex && chosenMonIndices[i] != battleMonIndex; i++);

            if (i != partyIndex)
                continue;

            chosenMonIndices[partyIndex] = battleMonIndex;


            CreateMonWithEVSpread(
                &gEnemyParty[partyIndex],
                battleTowerMons[battleMonIndex].species,
                level,
                fixedIV,
                battleTowerMons[battleMonIndex].evSpread);


            for (i = 0; i < 4; i++)
            {
                SetMonMoveSlot(&gEnemyParty[partyIndex], battleTowerMons[battleMonIndex].moves[i], i);
                if (battleTowerMons[battleMonIndex].moves[i] == MOVE_FRUSTRATION)
                {

                    friendship = 0;
                }
            }

            SetMonData(&gEnemyParty[partyIndex], 32, &friendship);
            SetMonData(&gEnemyParty[partyIndex], 12, &sBattleTowerHeldItems[battleTowerMons[battleMonIndex].heldItem]);



            partyIndex++;
        }
    }
}

u32 CountBattleTowerBanlistCaught(void)
{
    s32 i;
    u32 numCaught = 0;

    for (i = 0; gBattleTowerBannedSpecies[i] != 0xFFFF; i++)
    {
        if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleTowerBannedSpecies[i]), FLAG_GET_CAUGHT))
        {
            numCaught++;
        }
    }

    return numCaught;
}

u8 AppendBattleTowerBannedSpeciesName(u16 species, u8 curIndexToAppend, s32 numToAppend)
{
    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
    {
        curIndexToAppend++;

        switch (curIndexToAppend - 1)
        {
        case 0:
        case 2:
        case 4:
        case 6:
        case 8:
        case 10:
            if (numToAppend == curIndexToAppend)
            {

            }
            else if (numToAppend > curIndexToAppend)
            {
                StringAppend(gStringVar1, BattleText_Format4);
            }
            break;
        case 1:
            if (curIndexToAppend == numToAppend)
            {

            }
            else
            {
                StringAppend(gStringVar1, BattleText_Format4);
            }

            StringAppend(gStringVar1, BattleText_Format7);
            break;
        case 3:
        case 5:
        case 7:
        case 9:
        default:
            if (curIndexToAppend == numToAppend)
            {

            }
            else
            {
                StringAppend(gStringVar1, BattleText_Format4);
            }

            StringAppend(gStringVar1, BattleText_Format6);
            break;
        }

        StringAppend(gStringVar1, gSpeciesNames[species]);
    }

    return curIndexToAppend;
}

void CheckMonBattleTowerBanlist(u16 species, u16 heldItem, u16 hp, u8 battleTowerLevelType, u8 monLevel, u16 *validPartySpecies, u16 *validPartyHeldItems, u8 *numValid)
{
    s32 i;
    u32 counter = 0;

    if (species == SPECIES_EGG || species == SPECIES_NONE)
        return;

    while (1)
    {
        if (gBattleTowerBannedSpecies[counter] == 0xFFFF)
            goto EXIT2;

        if (gBattleTowerBannedSpecies[counter] == species)
            break;

        counter++;
    }

    if (gBattleTowerBannedSpecies[counter] != 0xFFFF)
        return;

    EXIT2:
    if (battleTowerLevelType == 0 && monLevel > 50)
        return;

    for (i = 0; i < *numValid && validPartySpecies[i] != species ; i++);
    if (i != *numValid)
        return;

    if (heldItem != 0)
    {
        for (i = 0; i < *numValid && validPartyHeldItems[i] != heldItem ; i++);
        if (i != *numValid)
            return;
    }

    validPartySpecies[*numValid] = species;
    validPartyHeldItems[*numValid] = heldItem;
    *numValid = *numValid + 1;
}

void CheckPartyBattleTowerBanlist(void)
{
    s32 i;
    u16 species2;
    u16 heldItem;
    u8 level;
    u16 hp;
    u32 numBanlistCaught;
    u16 validPartySpecies[6];
    u16 validPartyHeldItems[6];
    u8 counter;

    counter = 0;

    for (i = 0; i < 6; i++)
    {
        species2 = GetMonData(&gPlayerParty[i], 65);
        heldItem = GetMonData(&gPlayerParty[i], 12);
        level = GetMonData(&gPlayerParty[i], 56);
        hp = GetMonData(&gPlayerParty[i], 57);

        CheckMonBattleTowerBanlist(species2, heldItem, hp, gScriptResult, level, validPartySpecies, validPartyHeldItems, &counter);
    }

    if (counter < 3)
    {
        gStringVar1[0] = 0xFF;
        gSpecialVar_0x8004 = 1;
        counter = 0;

        numBanlistCaught = CountBattleTowerBanlistCaught();

        for (i = 0; gBattleTowerBannedSpecies[i] != 0xFFFF; i++)
        {
            counter = AppendBattleTowerBannedSpeciesName(gBattleTowerBannedSpecies[i], counter, numBanlistCaught);
        }

        if (counter == 0)
        {


            return;
        }

        if (1 & counter)
            StringAppend(gStringVar1, BattleText_Format6);




    }
    else
    {
        gSpecialVar_0x8004 = 0;
        gSaveBlock2.battleTower.battleTowerLevelType = gScriptResult;
    }
}

void PrintBattleTowerTrainerMessage(u16 *easyChat)
{
    sub_80EB544(gStringVar4, easyChat, 2, 3);
}

void PrintBattleTowerTrainerGreeting(void)
{
    if (gSaveBlock2.battleTower.battleTowerTrainerId == 200)
    {
        PrintBattleTowerTrainerMessage(gSaveBlock2.battleTower.ereaderTrainer.greeting.easyChat);
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 100)
    {
        PrintBattleTowerTrainerMessage((u16 *)gBattleTowerTrainers[gSaveBlock2.battleTower.battleTowerTrainerId].greeting.easyChat);
    }
    else
    {
        PrintBattleTowerTrainerMessage(gSaveBlock2.battleTower.records[gSaveBlock2.battleTower.battleTowerTrainerId - 100].greeting.easyChat);
    }
}

void sub_81354CC(void)
{
    s32 i;
    u16 heldItem;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        break;
    case 1:
        for (i = 0; i < 6; i++)
        {
            heldItem = GetMonData(&gSaveBlock1.playerParty[i], 12);
            SetMonData(&gPlayerParty[i], 12, &heldItem);
        }
        break;
    case 2:
        PrintEReaderTrainerFarewellMessage();
        break;
    }

    SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

void sub_8135534(u8 taskId)
{
    if (IsBattleTransitionDone() == 1)
    {
        gMain.savedCallback = sub_81354CC;
        SetMainCallback2(sub_800E7C4);
        DestroyTask(taskId);
    }
}

void sub_813556C(void)
{
    s32 i;
    u16 heldItem;
    u8 transition;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        gBattleTypeFlags = (0x0100 | 0x0008);
        gTrainerBattleOpponent = 0;

        FillBattleTowerTrainerParty();

        CreateTask(sub_8135534, 1);
        current_map_music_set__default_for_battle(0);
        transition = BattleSetup_GetBattleTowerBattleTransition();
        BattleTransition_StartOnField(transition);
        break;
    case 1:
        for (i = 0; i < 6; i++)
        {
            heldItem = GetMonData(&gPlayerParty[i], 12);
            SetMonData(&gSaveBlock1.playerParty[i], 12, &heldItem);
        }

        CreateTask(sub_8135534, 1);
        current_map_music_set__default_for_battle(0);
        transition = BattleSetup_GetBattleTowerBattleTransition();
        BattleTransition_StartOnField(transition);
        break;
    case 2:
        ZeroEnemyPartyMons();

        for (i = 0; i < 3; i++)
        {
            sub_803ADE8(&gEnemyParty[i], &gSaveBlock2.battleTower.ereaderTrainer.party[i]);
        }

        gBattleTypeFlags = (0x0800 | 0x0008);
        gTrainerBattleOpponent = 0;

        CreateTask(sub_8135534, 1);
        current_map_music_set__default_for_battle(0);
        transition = BattleSetup_GetBattleTowerBattleTransition();
        BattleTransition_StartOnField(transition);
        break;
    }
}

void sub_8135668(void)
{
    s32 i;
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        (gSharedMem[0x160FB]) = gSaveBlock2.battleTower.var_4AE[battleTowerLevelType];
        gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] = gSpecialVar_0x8005;
        break;
    case 1:
        gSaveBlock2.battleTower.battleTowerLevelType = gSpecialVar_0x8005;
        break;
    case 2:
        gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType] = gSpecialVar_0x8005;
        break;
    case 3:
        gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType] = gSpecialVar_0x8005;
        break;
    case 4:
        gSaveBlock2.battleTower.battleTowerTrainerId = gSpecialVar_0x8005;
        break;
    case 5:
        for (i = 0; i < 3; i++)
        {
            gSaveBlock2.battleTower.selectedPartyMons[i] = gSelectedOrderFromParty[i];
        }
        break;
    case 6:
        if (gSaveBlock2.battleTower.battleTowerTrainerId == 200)
        {
            ClearEReaderTrainer(&gSaveBlock2.battleTower.ereaderTrainer);
        }

        if (gSaveBlock2.battleTower.totalBattleTowerWins < 9999)
        {
            gSaveBlock2.battleTower.totalBattleTowerWins++;
        }

        gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType]++;
        sub_8135A3C();
        gScriptResult = gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType];

        gStringVar1[0] = gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType] + 0xA1;
        gStringVar1[1] = 0xFF;
        break;
    case 7:
        if (gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType] < 1430)
        {
            gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType]++;
        }

        sub_8135A3C();
        gScriptResult = gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType];
        break;
    case 8:
        gSaveBlock2.battleTower.unk_554 = gSpecialVar_0x8005;
        break;
    case 9:
        break;
    case 10:
        SetGameStat(32, gSaveBlock2.battleTower.bestBattleTowerWinStreak);
        break;
    case 11:
        if (gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] != 3)
        {
            ResetBattleTowerStreak(battleTowerLevelType);
        }
        break;
    case 12:
        gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] = (gSharedMem[0x160FB]);
        break;
    case 13:
        gSaveBlock2.battleTower.currentWinStreaks[battleTowerLevelType] = GetCurrentBattleTowerWinStreak(battleTowerLevelType);
        break;
    case 14:
        gSaveBlock2.battleTower.lastStreakLevelType = gSaveBlock2.battleTower.battleTowerLevelType;
        break;
    }
}

void sub_81358A4(void)
{
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        gScriptResult = gSaveBlock2.battleTower.var_4AE[battleTowerLevelType];
        break;
    case 1:
        gScriptResult = gSaveBlock2.battleTower.battleTowerLevelType;
        break;
    case 2:
        gScriptResult = gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType];
        break;
    case 3:
        gScriptResult = gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType];
        break;
    case 4:
        gScriptResult = gSaveBlock2.battleTower.battleTowerTrainerId;
        break;
    case 5:
    case 6:
    case 7:
        break;
    case 8:
        gScriptResult = gSaveBlock2.battleTower.unk_554;
        break;
    case 9:
        gScriptResult = GetCurrentBattleTowerWinStreak(battleTowerLevelType);
        break;
    case 10:
        SetGameStat(32, gSaveBlock2.battleTower.bestBattleTowerWinStreak);
        break;
    case 11:
        ResetBattleTowerStreak(battleTowerLevelType);
        break;
    case 12:
        gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] = (gSharedMem[0x160FB]);
        break;
    case 13:
        gSaveBlock2.battleTower.currentWinStreaks[battleTowerLevelType] = GetCurrentBattleTowerWinStreak(battleTowerLevelType);
        break;
    case 14:
        gSaveBlock2.battleTower.lastStreakLevelType = gSaveBlock2.battleTower.battleTowerLevelType;
        break;
    }
}

void sub_8135A14(void)
{
    s32 i;

    for (i = 0; i < 3; i++)
    {
        gSelectedOrderFromParty[i] = gSaveBlock2.battleTower.selectedPartyMons[i];
    }

    ReducePlayerPartyToThree();
}
# 1838 "src/field/battle_tower.c"
__attribute__((naked))
void sub_8135A3C(void)
{
    asm(".syntax unified\n    push {r4-r6,lr}\n    ldr r6, _08135A84 @ =gSaveBlock2\n    ldr r1, _08135A88 @ =0x00000554\n    adds r0, r6, r1\n    ldrb r4, [r0]\n    lsls r4, 31\n    lsrs r4, 31\n    adds r0, r4, 0\n    bl GetCurrentBattleTowerWinStreak\n    lsls r0, 16\n    lsrs r5, r0, 16\n    lsls r4, 1\n    movs r3, 0xAC\n    lsls r3, 3\n    adds r2, r6, r3\n    adds r4, r2\n    ldrh r0, [r4]\n    cmp r0, r5\n    bcs _08135A66\n    strh r5, [r4]\n_08135A66:\n    ldr r0, _08135A8C @ =0x00000562\n    adds r1, r6, r0\n    ldrh r0, [r2]\n    ldrh r3, [r1]\n    cmp r0, r3\n    bls _08135A94\n    adds r5, r0, 0\n    movs r0, 0x20\n    adds r1, r5, 0\n    bl SetGameStat\n    ldr r1, _08135A90 @ =0x0000270f\n    cmp r5, r1\n    bhi _08135AA4\n    b _08135AB4\n    .align 2, 0\n_08135A84: .4byte gSaveBlock2\n_08135A88: .4byte 0x00000554\n_08135A8C: .4byte 0x00000562\n_08135A90: .4byte 0x0000270f\n_08135A94:\n    ldrh r5, [r1]\n    movs r0, 0x20\n    adds r1, r5, 0\n    bl SetGameStat\n    ldr r1, _08135AAC @ =0x0000270f\n    cmp r5, r1\n    bls _08135AB4\n_08135AA4:\n    ldr r2, _08135AB0 @ =0x00000572\n    adds r0, r6, r2\n    strh r1, [r0]\n    b _08135ABA\n    .align 2, 0\n_08135AAC: .4byte 0x0000270f\n_08135AB0: .4byte 0x00000572\n_08135AB4:\n    ldr r3, _08135AC0 @ =0x00000572\n    adds r0, r6, r3\n    strh r5, [r0]\n_08135ABA:\n    pop {r4-r6}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08135AC0: .4byte 0x00000572\n    .syntax divided\n");
# 1909 "src/field/battle_tower.c"
}


void sub_8135AC4(void)
{
    s32 i;
    u8 trainerClass;
    struct BattleTowerRecord *playerRecord = &gSaveBlock2.battleTower.playerRecord;
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    if (gSaveBlock2.playerGender != MALE)
    {
        trainerClass = sFemaleTrainerClasses[(gSaveBlock2.playerTrainerId[0] + gSaveBlock2.playerTrainerId[1]
                                    + gSaveBlock2.playerTrainerId[2] + gSaveBlock2.playerTrainerId[3]) % 20u];
    }
    else
    {
        trainerClass = sMaleTrainerClasses[(gSaveBlock2.playerTrainerId[0] + gSaveBlock2.playerTrainerId[1]
                                    + gSaveBlock2.playerTrainerId[2] + gSaveBlock2.playerTrainerId[3]) % 30u];
    }

    playerRecord->battleTowerLevelType = battleTowerLevelType;
    playerRecord->trainerClass = trainerClass;

    copy_word_to_mem(playerRecord->trainerId, gSaveBlock2.playerTrainerId);
    StringCopy8(playerRecord->name, gSaveBlock2.playerName);

    playerRecord->winStreak = GetCurrentBattleTowerWinStreak(battleTowerLevelType);

    for (i = 0; i < 6; i++)
    {
        playerRecord->greeting.easyChat[i] = gSaveBlock1.easyChats.unk2B28[i];
    }

    for (i = 0; i < 3; i++)
    {
        sub_803AF78(&gUnknown_030042FC[gSaveBlock2.battleTower.selectedPartyMons[i]], &playerRecord->party[i]);
    }

    SetBattleTowerRecordChecksum(&gSaveBlock2.battleTower.playerRecord);
    sub_8135A3C();
}

void sub_8135BA0(void)
{
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    if (gSpecialVar_0x8004 == 3 || gSpecialVar_0x8004 == 0)
    {
        if (gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType] > 1
            || gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType] > 1)
        {
            sub_8135AC4();
        }
    }

    sub_8135CFC();

    gSaveBlock2.battleTower.battleOutcome = gBattleOutcome;

    if (gSpecialVar_0x8004 != 3)
    {
        gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] = gSpecialVar_0x8004;
    }

    VarSet(0x4000, 0);
    gSaveBlock2.battleTower.unk_554 = 1;
    TrySavingData(EREADER_SAVE);
}

void BattleTower_SoftReset(void)
{
    DoSoftReset();
}

void ValidateBattleTowerRecordChecksums(void)
{
    u32 i;
    s32 recordIndex;
    struct BattleTowerRecord *record;
    u32 checksum;

    checksum = 0;
    for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
    {
        checksum += ((u32 *)&gSaveBlock2.battleTower.playerRecord)[i];
    }

    if (gSaveBlock2.battleTower.playerRecord.checksum != checksum)
    {
        ClearBattleTowerRecord(&gSaveBlock2.battleTower.playerRecord);
    }

    for (recordIndex = 0; recordIndex < 5; recordIndex++)
    {
        record = &gSaveBlock2.battleTower.records[recordIndex];
        checksum = 0;
        for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
        {
            checksum += ((u32 *)record)[i];
        }

        if (gSaveBlock2.battleTower.records[recordIndex].checksum != checksum)
        {
            ClearBattleTowerRecord(&gSaveBlock2.battleTower.records[recordIndex]);
        }
    }
}

void SetBattleTowerRecordChecksum(struct BattleTowerRecord *record)
{
    u32 i;

    record->checksum = 0;
    for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
    {
        record->checksum += ((u32 *)record)[i];
    }
}

void ClearBattleTowerRecord(struct BattleTowerRecord *record)
{
    u32 i;

    for (i = 0; i < sizeof(struct BattleTowerRecord) / sizeof(u32); i++)
    {
        ((u32 *)record)[i] = 0;
    }
}

void sub_8135CFC(void)
{
    s32 i;

    get_trainer_name(gSaveBlock2.battleTower.defeatedByTrainerName);
    gSaveBlock2.battleTower.defeatedBySpecies = gBattleMons[1].species;
    gSaveBlock2.battleTower.firstMonSpecies = gBattleMons[0].species;

    for (i = 0; i < 10; i++)
    {
        gSaveBlock2.battleTower.firstMonNickname[i] = gBattleMons[0].nickname[i];
    }
}

u16 GetCurrentBattleTowerWinStreak(u8 battleTowerLevelType)
{
    u16 winStreak = ((gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType] - 1) * 7 - 1)
                    + gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType];

    if (winStreak > 9999)
    {
        return 9999;
    }

    return winStreak;
}
# 2085 "src/field/battle_tower.c"
__attribute__((naked))
void DetermineBattleTowerPrize(void)
{
    asm(".syntax unified\n    push {r4,r5,lr}\n    ldr r5, _08135DB0 @ =gSaveBlock2\n    ldr r1, _08135DB4 @ =0x00000554\n    adds r0, r5, r1\n    ldrb r0, [r0]\n    lsls r0, 31\n    lsrs r0, 31\n    lsls r0, 1\n    ldr r2, _08135DB8 @ =0x0000055c\n    adds r1, r5, r2\n    adds r0, r1\n    ldrh r0, [r0]\n    subs r0, 0x1\n    cmp r0, 0x5\n    ble _08135DC0\n    bl Random\n    ldr r4, _08135DBC @ =sLongStreakPrizes\n    lsls r0, 16\n    lsrs r0, 16\n    movs r1, 0x9\n    b _08135DCC\n    .align 2, 0\n_08135DB0: .4byte gSaveBlock2\n_08135DB4: .4byte 0x00000554\n_08135DB8: .4byte 0x0000055c\n_08135DBC: .4byte sLongStreakPrizes\n_08135DC0:\n    bl Random\n    ldr r4, _08135DE8 @ =sShortStreakPrizes\n    lsls r0, 16\n    lsrs r0, 16\n    movs r1, 0x6\n_08135DCC:\n    bl __umodsi3\n    lsls r0, 16\n    lsrs r0, 15\n    adds r0, r4\n    ldrh r1, [r0]\n    movs r2, 0xAD\n    lsls r2, 3\n    adds r0, r5, r2\n    strh r1, [r0]\n    pop {r4,r5}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08135DE8: .4byte sShortStreakPrizes\n    .syntax divided\n");
# 2137 "src/field/battle_tower.c"
}


void GiveBattleTowerPrize(void)
{
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    if (AddBagItem(gSaveBlock2.battleTower.prizeItem, 1) == 1)
    {
        CopyItemName(gSaveBlock2.battleTower.prizeItem, gStringVar1);
        gScriptResult = 1;
    }
    else
    {
        gScriptResult = 0;
        gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] = 6;
    }
}

void AwardBattleTowerRibbons(void)
{
    s32 i;
    u32 partyIndex;
    struct Pokemon *pokemon;
    u8 ribbonType;
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    ribbonType = 68;
    if (battleTowerLevelType != 0)
    {
        ribbonType = 69;
    }

    gScriptResult = 0;

    if (GetCurrentBattleTowerWinStreak(battleTowerLevelType) > 55)
    {
        for (i = 0; i < 3; i++)
        {
            partyIndex = gSaveBlock2.battleTower.selectedPartyMons[i] - 1;
            pokemon = &gPlayerParty[partyIndex];
            if (!GetMonData(pokemon, ribbonType))
            {
                gScriptResult = 1;
                SetMonData(pokemon, ribbonType, &gScriptResult);
            }
        }
    }

    if (gScriptResult != 0)
    {
        IncrementGameStat(42);
    }
}



void Debug_FillEReaderTrainerWithPlayerData(void)
{
    struct BattleTowerEReaderTrainer *ereaderTrainer;
    s32 i;
    s32 j;

    ereaderTrainer = &gSaveBlock2.battleTower.ereaderTrainer;

    if (gSaveBlock2.playerGender != MALE)
    {
        ereaderTrainer->trainerClass = sFemaleTrainerClasses[(gSaveBlock2.playerTrainerId[0] + gSaveBlock2.playerTrainerId[1]
                                                        + gSaveBlock2.playerTrainerId[2] + gSaveBlock2.playerTrainerId[3]) % 20u];
    }
    else
    {
        ereaderTrainer->trainerClass = sMaleTrainerClasses[(gSaveBlock2.playerTrainerId[0] + gSaveBlock2.playerTrainerId[1]
                                                        + gSaveBlock2.playerTrainerId[2] + gSaveBlock2.playerTrainerId[3]) % 30u];
    }

    copy_word_to_mem(ereaderTrainer->trainerId, gSaveBlock2.playerTrainerId);
    StringCopy8(ereaderTrainer->name, gSaveBlock2.playerName);

    ereaderTrainer->winStreak = 1;

    j = 7;
    for (i = 0; i < 6; i++)
    {
        ereaderTrainer->greeting.easyChat[i] = gSaveBlock1.easyChats.unk2B28[i];
        ereaderTrainer->farewellPlayerLost.easyChat[i] = j;
        ereaderTrainer->farewellPlayerWon.easyChat[i] = j + 6;
        j++;
    }

    for (i = 0; i < 3; i++)
    {
        sub_803AF78(&gPlayerParty[i], &ereaderTrainer->party[i]);
    }

    SetEReaderTrainerChecksum(ereaderTrainer);
}

u8 GetEReaderTrainerPicIndex(void)
{
    return gTrainerClassToPicIndex[gSaveBlock2.battleTower.ereaderTrainer.trainerClass];
}

u8 GetEReaderTrainerClassNameIndex(void)
{
    return gTrainerClassToNameIndex[gSaveBlock2.battleTower.ereaderTrainer.trainerClass];
}

void SetEReaderTrainerName(u8 *trainerName)
{
    s32 i;

    for (i = 0; i < 7; i++)
    {
        trainerName[i] = gSaveBlock2.battleTower.ereaderTrainer.name[i];
    }

    trainerName[i] = 0xFF;
}


void ValidateEReaderTrainer(void)
{
    u32 i;
    u32 checksum;
    struct BattleTowerEReaderTrainer *ereaderTrainer;

    gScriptResult = 0;
    ereaderTrainer = &gSaveBlock2.battleTower.ereaderTrainer;

    checksum = 0;
    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32) - 1; i++)
    {
        checksum |= ((u32 *)ereaderTrainer)[i];
    }

    if (checksum == 0)
    {
        gScriptResult = 1;
        return;
    }

    checksum = 0;
    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32) - 1; i++)
    {
        checksum += ((u32 *)ereaderTrainer)[i];
    }

    if (gSaveBlock2.battleTower.ereaderTrainer.checksum != checksum)
    {
        ClearEReaderTrainer(&gSaveBlock2.battleTower.ereaderTrainer);
        gScriptResult = 1;
    }
}

void SetEReaderTrainerChecksum(struct BattleTowerEReaderTrainer *ereaderTrainer)
{
    s32 i;

    ereaderTrainer->checksum = 0;
    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32) - 1; i++)
    {
        ereaderTrainer->checksum += ((u32 *)ereaderTrainer)[i];
    }
}

void ClearEReaderTrainer(struct BattleTowerEReaderTrainer *ereaderTrainer)
{
    u32 i;

    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32); i++)
    {
        ((u32 *)ereaderTrainer)[i] = 0;
    }
}

void PrintEReaderTrainerGreeting(void)
{
    PrintBattleTowerTrainerMessage(gSaveBlock2.battleTower.ereaderTrainer.greeting.easyChat);
}

void PrintEReaderTrainerFarewellMessage(void)
{
    if (gBattleOutcome == 0x3)
    {
        gStringVar4[0] = 0xFF;
    }
    else if (gBattleOutcome == 0x1)
    {
        PrintBattleTowerTrainerMessage(gSaveBlock2.battleTower.ereaderTrainer.farewellPlayerWon.easyChat);
    }
    else
    {
        PrintBattleTowerTrainerMessage(gSaveBlock2.battleTower.ereaderTrainer.farewellPlayerLost.easyChat);
    }
}

void sub_813610C(void)
{
    s32 i;

    for (i = 0; i < 2; i++)
    {
        if (gSaveBlock2.battleTower.var_4AE[i] == 1)
        {
            sub_80BFD20();
        }
    }
}
