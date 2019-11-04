# 1 "src/field/item.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/item.c"
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
# 2 "src/field/item.c" 2
# 1 "include/hold_effects.h" 1
# 3 "src/field/item.c" 2
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
# 4 "src/field/item.c" 2
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
# 5 "src/field/item.c" 2
# 1 "include/item_use.h" 1



extern u16 gScriptItemId;

void ItemUseOutOfBattle_Mail(u8);
void ItemUseOutOfBattle_Bike(u8);
void ItemUseOnFieldCB_Bike(u8);
void ItemUseOutOfBattle_Rod(u8);
void ItemUseOnFieldCB_Rod(u8);
void ItemUseOutOfBattle_Itemfinder(u8);
void ItemUseOnFieldCB_Itemfinder(u8);
void RunItemfinderResults(u8);
void ExitItemfinder(u8);
bool8 ItemfinderCheckForHiddenItems(struct MapEvents *, u8);
void sub_80C9720(u8);
void sub_80C9838(u8, s16, s16);
u8 GetPlayerDirectionTowardsHiddenItem(s16, s16);
void SetPlayerDirectionTowardsItem(u8);
void DisplayItemRespondingMessageAndExitItemfinder(u8);
void RotatePlayerAndExitItemfinder(u8);
void ItemUseOutOfBattle_PokeblockCase(u8);
void ItemUseOutOfBattle_CoinCase(u8);
void ItemUseOutOfBattle_SSTicket(u8);
void sub_80C9D00(u8);
void ItemUseOutOfBattle_WailmerPail(u8);
void sub_80C9D74(u8);
void ItemUseOutOfBattle_Medicine(u8);
void ItemUseOutOfBattle_SacredAsh(u8);
void ItemUseOutOfBattle_PPRecovery(u8);
void ItemUseOutOfBattle_PPUp(u8);
void ItemUseOutOfBattle_RareCandy(u8);
void ItemUseOutOfBattle_TMHM(u8);
void sub_80C9EE4(u8);
void sub_80C9F10(u8);
void sub_80C9F80(u8);
void sub_80C9FC0(u8);
void ItemUseOutOfBattle_Repel(u8);
void ItemUseOutOfBattle_BlackWhiteFlute(u8);
void task08_080A1C44(u8);
u8 CanUseEscapeRopeOnCurrMap(void);
void ItemUseOutOfBattle_EscapeRope(u8);
void ItemUseOutOfBattle_EvolutionStone(u8);
void ItemUseInBattle_PokeBall(u8);
void ItemUseInBattle_StatIncrease(u8);
void ItemUseInBattle_Medicine(u8);
void ItemUseInBattle_PPRecovery(u8);
void ItemUseInBattle_Escape(u8);
void ItemUseOutOfBattle_EnigmaBerry(u8);
void ItemUseInBattle_EnigmaBerry(u8);
void ItemUseOutOfBattle_CannotUse(u8);
u8 CheckIfItemIsTMHMOrEvolutionStone(u16 itemId);
# 6 "src/field/item.c" 2
# 1 "include/berry.h" 1



enum
{
    BERRY_FIRMNESS_UNKNOWN,
    BERRY_FIRMNESS_VERY_SOFT,
    BERRY_FIRMNESS_SOFT,
    BERRY_FIRMNESS_HARD,
    BERRY_FIRMNESS_VERY_HARD,
    BERRY_FIRMNESS_SUPER_HARD,
};


enum
{
    BERRY_STAGE_NO_BERRY,
    BERRY_STAGE_PLANTED,
    BERRY_STAGE_SPROUTED,
    BERRY_STAGE_TALLER,
    BERRY_STAGE_FLOWERING,
    BERRY_STAGE_BERRIES,
    BERRY_STAGE_SPARKLING = 0xFF,
};

void SetEnigmaBerry(u8 *src);
bool32 IsEnigmaBerryValid(void);
const struct Berry *GetBerryInfo(u8 berry);
bool32 FieldObjectInteractionWaterBerryTree(void);
bool8 IsPlayerFacingUnplantedSoil(void);
bool8 TryToWaterBerryTree(void);
void ClearBerryTrees(void);
void BerryTreeTimeUpdate(s32 minutes);
void PlantBerryTree(u8 id, u8 berry, u8 stage, bool8 sparkle);
void RemoveBerryTree(u8 id);
u8 GetBerryTypeByBerryTreeId(u8 id);
u8 GetStageByBerryTreeId(u8);
u8 ItemIdToBerryType(u16 item);
void GetBerryNameByBerryType(u8 berry, u8 *string);
void ResetBerryTreeSparkleFlag(u8 id);
void FieldObjectInteractionGetBerryTreeData(void);
void Berry_FadeAndGoToBerryBagMenu(void);
void FieldObjectInteractionPlantBerryTree(void);
void FieldObjectInteractionPickBerryTree(void);
void FieldObjectInteractionRemoveBerryTree(void);
bool8 PlayerHasBerries(void);
void ResetBerryTreeSparkleFlags(void);
# 7 "src/field/item.c" 2
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
# 8 "src/field/item.c" 2
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
# 9 "src/field/item.c" 2

extern u8 gUnknown_02038560;


enum
{
    POCKET_NONE,
    POCKET_ITEMS,
    POCKET_POKE_BALLS,
    POCKET_TM_HM,
    POCKET_BERRIES,
    POCKET_KEY_ITEMS,
};

enum
{
    ITEMS_POCKET,
    BALLS_POCKET,
    TMHM_POCKET,
    BERRIES_POCKET,
    KEYITEMS_POCKET
};

# 1 "src/field/../data/item_descriptions.h" 1
static const u8 gItemDescription_MasterBall[] = _(
    "포켓몬을 반드시\n"
    "잡을 수 있는\n"
    "최고의 볼");

static const u8 gItemDescription_UltraBall[] = _(
    "수퍼볼보다\n"
    "잡기 쉬워진\n"
    "무척 대단한 볼");

static const u8 gItemDescription_GreatBall[] = _(
    "몬스터볼보다\n"
    "잡기 쉬워진\n"
    "고성능의 볼");

static const u8 gItemDescription_PokeBall[] = _(
    "야생 포켓몬을\n"
    "잡기 위한 도구");

static const u8 gItemDescription_SafariBall[] = _(
    "사파리존에서만\n"
    "쓸 수 있는\n"
    "특수한 볼");

static const u8 gItemDescription_NetBall[] = _(
    "물타입과 벌레타입의\n"
    "포켓몬을 잡기\n"
    "쉬워진 볼");

static const u8 gItemDescription_DiveBall[] = _(
    "해저에서 사는\n"
    "포켓몬을 잡기\n"
    "쉬워진 볼");

static const u8 gItemDescription_NestBall[] = _(
    "잡을 수 있는 포켓몬이\n"
    "약할수록 잡기\n"
    "쉬워진 볼");

static const u8 gItemDescription_RepeatBall[] = _(
    "잡은 적이 있는\n"
    "포켓몬을 잡기\n"
    "쉬워진 볼");

static const u8 gItemDescription_TimerBall[] = _(
    "턴 수가 길어지면\n"
    "길어질수록 잡기\n"
    "쉬워진 볼");

static const u8 gItemDescription_LuxuryBall[] = _(
    "잡은 포켓몬이\n"
    "친밀해지기 쉬운\n"
    "편안한 볼");

static const u8 gItemDescription_PremierBall[] = _(
    "무언가의 기념품으로\n"
    "만들어진 조금 희귀한\n"
    "몬스터볼");

static const u8 gItemDescription_Potion[] = _(
    "포켓몬의 체력을\n"
    "20 회복한다");

static const u8 gItemDescription_Antidote[] = _(
    "독 상태를\n"
 "회복한다");

static const u8 gItemDescription_BurnHeal[] = _(
    "화상 상태를\n"
 "회복한다");

static const u8 gItemDescription_IceHeal[] = _(
    "얼음 상태를\n"
 "회복한다");

static const u8 gItemDescription_Awakening[] = _(
    "잠듦 상태를\n"
 "회복한다");

static const u8 gItemDescription_ParalyzeHeal[] = _(
    "마비 상태를\n"
 "회복한다");

static const u8 gItemDescription_FullRestore[] = _(
    "포켓몬의 체력과\n"
    "상태 이상을\n"
    "모두 회복한다");

static const u8 gItemDescription_MaxPotion[] = _(
    "포켓몬의 체력을\n"
 "모두 회복한다");

static const u8 gItemDescription_HyperPotion[] = _(
    "포켓몬의 체력을\n"
    "200 회복한다");

static const u8 gItemDescription_SuperPotion[] = _(
    "포켓몬의 체력을\n"
    "50 회복한다");

static const u8 gItemDescription_FullHeal[] = _(
    "상태 이상을\n"
    "모두 회복한다");

static const u8 gItemDescription_Revive[] = _(
    "기절 상태에서\n"
    "체력을 절반까지\n"
    "회복한다");

static const u8 gItemDescription_MaxRevive[] = _(
    "기절 상태에서\n"
    "체력을\n"
    "모두 회복한다");

static const u8 gItemDescription_FreshWater[] = _(
    "미네랄이 가득한 물\n"
    "포켓몬의 체력을\n"
    "50 회복한다");

static const u8 gItemDescription_SodaPop[] = _(
    "쏴-하고 상쾌하다\n"
    "포켓몬의 체력을\n"
    "60 회복한다");

static const u8 gItemDescription_Lemonade[] = _(
    "매우 달콤하다\n"
    "포켓몬의 체력을\n"
    "80 회복한다");

static const u8 gItemDescription_MoomooMilk[] = _(
    "영양 만점\n"
    "포켓몬의 체력을\n"
    "100 회복한다");

static const u8 gItemDescription_EnergyPowder[] = _(
    "매우 쓴 가루\n"
    "포켓몬의 체력을\n"
    "50 회복한다");

static const u8 gItemDescription_EnergyRoot[] = _(
    "매우 쓴 뿌리\n"
    "포켓몬의 체력을\n"
    "200 회복한다");

static const u8 gItemDescription_HealPowder[] = _(
    "무척 쓴 가루\n"
    "상태 이상을\n"
    "모두 회복한다");

static const u8 gItemDescription_RevivalHerb[] = _(
    "매우 쓴 풀\n"
    "기절 상태로부터\n"
    "부활한다");

static const u8 gItemDescription_Ether[] = _(
    "1개 기술의\n"
    "기술 포인트를\n"
    "10 회복한다");

static const u8 gItemDescription_MaxEther[] = _(
    "1개 기술의\n"
    "기술 포인트를\n"
    "전부 회복한다");

static const u8 gItemDescription_Elixir[] = _(
    "모든 기술의\n"
    "기술 포인트를\n"
    "10 회복한다");

static const u8 gItemDescription_MaxElixir[] = _(
    "포켓몬 1마리의\n"
    "모든 기술 포인트를\n"
    "전부 회복한다");

static const u8 gItemDescription_LavaCookie[] = _(
    "용암마을의 명물\n"
    "상태 이상을\n"
    "모두 회복한다");

static const u8 gItemDescription_BlueFlute[] = _(
    "유리로 된 피리\n"
    "잠듦 상태를\n"
    "회복한다");

static const u8 gItemDescription_YellowFlute[] = _(
    "유리로 된 피리\n"
    "혼란 상태를\n"
    "회복한다");

static const u8 gItemDescription_RedFlute[] = _(
    "유리로 된 피리\n"
    "헤롱헤롱 상태를\n"
    "회복한다");

static const u8 gItemDescription_BlackFlute[] = _(
    "유리로 된 피리\n"
    "야생 포켓몬과\n"
    "마주치기 어려워진다");

static const u8 gItemDescription_WhiteFlute[] = _(
    "유리로 된 피리\n"
 "야생 포켓몬과\n"
    "마주치기 쉬워진다");

static const u8 gItemDescription_BerryJuice[] = _(
    "나무열매 100%\n"
    "포켓몬의 체력을\n"
    "20 회복한다");

static const u8 gItemDescription_SacredAsh[] = _(
    "기절해 버린 포켓몬\n"
    "전원을 정상\n"
    "상태로 한다");

static const u8 gItemDescription_ShoalSalt[] = _(
    "여울의 동굴에서\n"
    "발견한 소금");

static const u8 gItemDescription_ShoalShell[] = _(
    "여울의 동굴에서\n"
    "발견한 조개껍질");

static const u8 gItemDescription_RedShard[] = _(
    "이전에 만들어진\n"
    "도구의 일부인 듯하다\n"
    "싸게 팔린다");

static const u8 gItemDescription_BlueShard[] = _(
    "옛날에 만들어진\n"
    "도구의 일부인 듯하다\n"
    "싸게 팔린다");

static const u8 gItemDescription_YellowShard[] = _(
    "옛날에 만들어진\n"
    "도구의 일부인 듯하다\n"
    "싸게 팔린다");

static const u8 gItemDescription_GreenShard[] = _(
    "옛날에 만들어진\n"
    "도구의 일부인 듯하다\n"
    "싸게 팔린다");

static const u8 gItemDescription_HPUp[] = _(
    "체력의\n"
    "기초 포인트를 올린다");

static const u8 gItemDescription_Protein[] = _(
    "공격의\n"
    "기초 포인트를 올린다");

static const u8 gItemDescription_Iron[] = _(
    "방어의\n"
    "기초 포인트를 올린다");

static const u8 gItemDescription_Carbos[] = _(
    "스피드의\n"
    "기초 포인트를 올린다");

static const u8 gItemDescription_Calcium[] = _(
    "특수공격의\n"
    "기초 포인트를 올린다");

static const u8 gItemDescription_RareCandy[] = _(
    "포켓몬의 레벨을\n"
    "1 올린다");

static const u8 gItemDescription_PPUp[] = _(
    "기술 포인트의\n"
    "최대치가 올라간다");

static const u8 gItemDescription_Zinc[] = _(
    "특수방어의\n"
    "기초 포인트를 올린다");

static const u8 gItemDescription_PPMax[] = _(
    "기술 포인트를\n"
    "최대치까지 올린다");

static const u8 gItemDescription_GuardSpec[] = _(
    "배틀에서 사용하면\n"
    "같은 편의 능력이\n"
    "떨어지지 않게 된다");

static const u8 gItemDescription_DireHit[] = _(
    "사용한 배틀 중\n"
    "상대의 급소에\n"
    "맞기 쉬워진다");

static const u8 gItemDescription_XAttack[] = _(
    "사용한 배틀 중\n"
    "공격력이 올라간다");

static const u8 gItemDescription_XDefend[] = _(
    "사용한 배틀 중\n"
    "방어력이 올라간다");

static const u8 gItemDescription_XSpeed[] = _(
    "사용한 배틀 중\n"
    "스피드가 올라간다");

static const u8 gItemDescription_XAccuracy[] = _(
    "사용한 배틀 중\n"
    "기술이 맞기 쉬워진다");

static const u8 gItemDescription_XSpecial[] = _(
    "사용한 배틀 중\n"
    "특수공격력이\n"
    "올라간다");

static const u8 gItemDescription_PokeDoll[] = _(
    "마주친 야생\n"
    "포켓몬과의 배틀에서\n"
    "도망칠 수 있다");

static const u8 gItemDescription_FluffyTail[] = _(
    "마주친 야생\n"
    "포켓몬과의 배틀에서\n"
    "도망칠 수도 있다");

static const u8 gItemDescription_SuperRepel[] = _(
    "200보 걸어가는 동안\n"
    "약한 야생 포켓몬과\n"
    "마주치지 않게 된다");

static const u8 gItemDescription_MaxRepel[] = _(
    "250보 걸어가는 동안\n"
    "약한 야생 포켓몬과\n"
    "마주치지 않게 된다");

static const u8 gItemDescription_EscapeRope[] = _(
    "동굴이나 던전에서\n"
    "빠져나올 수 있다");

static const u8 gItemDescription_Repel[] = _(
    "100보 걸어가는 동안\n"
    "약한 야생 포켓몬과\n"
    "마주치지 않게 된다");

static const u8 gItemDescription_SunStone[] = _(
    "특정한 포켓몬을\n"
    "진화시킨다");

static const u8 gItemDescription_MoonStone[] = _(
    "특정한 포켓몬을\n"
    "진화시킨다");

static const u8 gItemDescription_FireStone[] = _(
    "특정한 포켓몬을\n"
    "진화시킨다");

static const u8 gItemDescription_ThunderStone[] = _(
    "특정한 포켓몬을\n"
    "진화시킨다");

static const u8 gItemDescription_WaterStone[] = _(
    "특정한 포켓몬을\n"
    "진화시킨다");

static const u8 gItemDescription_LeafStone[] = _(
    "특정한 포켓몬을\n"
    "진화시킨다");

static const u8 gItemDescription_TinyMushroom[] = _(
    "보통의 버섯\n"
    "싸게 팔린다");

static const u8 gItemDescription_BigMushroom[] = _(
    "진귀한 버섯\n"
    "비싸게 팔린다");

static const u8 gItemDescription_Pearl[] = _(
    "예쁜 진주\n"
    "싸게 팔린다");

static const u8 gItemDescription_BigPearl[] = _(
    "엄청 예쁜\n"
    "큰 낱알의 진주\n"
    "비싸게 팔린다");

static const u8 gItemDescription_Stardust[] = _(
    "빨갛고 예쁜 모래\n"
    "비싸게 팔린다");

static const u8 gItemDescription_StarPiece[] = _(
    "빨갛고 예쁜\n"
    "보석 조각\n"
    "매우 비싸게 팔린다");

static const u8 gItemDescription_Nugget[] = _(
    "순금으로 만들어졌다\n"
    "비싸게 팔린다");

static const u8 gItemDescription_HeartScale[] = _(
    "예쁜 비늘\n"
    "마니아 사이에서\n"
    "인기가 높다");

static const u8 gItemDescription_OrangeMail[] = _(
    "지그제구리의 모습이\n"
    "프린트된 편지지\n"
    "포켓몬에게 지니게 한다");

static const u8 gItemDescription_HarborMail[] = _(
    "갈모매의 모습이\n"
    "프린트된 편지지\n"
    "포켓몬에게 지니게 한다");

static const u8 gItemDescription_GlitterMail[] = _(
    "피카츄의 모습이\n"
    "프린트된 편지지\n"
    "포켓몬에게 지니게 한다");

static const u8 gItemDescription_MechMail[] = _(
    "코일의 모습이\n"
    "프린트된 편지지\n"
    "포켓몬에게 지니게 한다");

static const u8 gItemDescription_WoodMail[] = _(
    "게을로의 모습이\n"
    "프린트된 편지지\n"
    "포켓몬에게 지니게 한다");

static const u8 gItemDescription_WaveMail[] = _(
    "고래왕자의 모습이\n"
    "프린트된 편지지\n"
    "포켓몬에게 지니게 한다");

static const u8 gItemDescription_BeadMail[] = _(
    "지니게 한 포켓몬의\n"
    "초상화가 나오는 편지지");

static const u8 gItemDescription_ShadowMail[] = _(
    "해골몽의 모습이\n"
    "프린트된 편지지\n"
    "포켓몬에게 지니게 한다");

static const u8 gItemDescription_TropicMail[] = _(
    "아르코의 모습이\n"
    "프린트된 편지지\n"
    "포켓몬에게 지니게 한다");

static const u8 gItemDescription_DreamMail[] = _(
    "지니게 한 포켓몬의\n"
    "초상화가 나오는 편지지");

static const u8 gItemDescription_FabMail[] = _(
    "호화로운 모양이\n"
    "프린트된 편지지\n"
    "포켓몬에게 지니게 한다");

static const u8 gItemDescription_RetroMail[] = _(
    "3마리의 포켓몬이\n"
    "프린트된 편지지\n"
    "포켓몬에게 지니게 한다");

static const u8 gItemDescription_CheriBerry[] = _(
    "지니게 하면 스스로\n"
    "마비 상태를\n"
    "회복한다");

static const u8 gItemDescription_ChestoBerry[] = _(
    "지니게 하면 스스로\n"
    "잠듦 상태를\n"
    "회복한다");

static const u8 gItemDescription_PechaBerry[] = _(
    "지니게 하면 스스로\n"
    "독 상태를\n"
    "회복한다");

static const u8 gItemDescription_RawstBerry[] = _(
    "지니게 하면 스스로\n"
    "화상 상태를\n"
    "회복한다");

static const u8 gItemDescription_AspearBerry[] = _(
    "지니게 하면 스스로\n"
    "얼음 상태를\n"
    "회복한다");

static const u8 gItemDescription_LeppaBerry[] = _(
    "지니게 하면 스스로\n"
    "기술 포인트를\n"
    "10 회복한다");

static const u8 gItemDescription_OranBerry[] = _(
    "지니게 하면 스스로\n"
    "체력을\n"
    "10 회복한다");

static const u8 gItemDescription_PersimBerry[] = _(
    "지니게 하면 스스로\n"
    "혼란 상태를\n"
    "회복한다");

static const u8 gItemDescription_LumBerry[] = _(
    "지니게 하면 스스로\n"
    "상태 이상을\n"
    "회복한다");

static const u8 gItemDescription_SitrusBerry[] = _(
    "지니게 하면 스스로\n"
    "체력을\n"
    "30 회복한다");

static const u8 gItemDescription_FigyBerry[] = _(
    "지니게 하면 체력을\n"
    "회복하지만\n"
    "혼란에 빠질 수도 있다");

static const u8 gItemDescription_WikiBerry[] = _(
    "지니게 하면 체력을\n"
    "회복하지만\n"
    "혼란에 빠질 수도 있다");

static const u8 gItemDescription_MagoBerry[] = _(
    "지니게 하면 체력을\n"
    "회복하지만\n"
    "혼란에 빠질 수도 있다");

static const u8 gItemDescription_AguavBerry[] = _(
    "지니게 하면 체력을\n"
    "회복하지만\n"
    "혼란에 빠질 수도 있다");

static const u8 gItemDescription_IapapaBerry[] = _(
    "지니게 하면 체력을\n"
    "회복하지만\n"
    "혼란에 빠질 수도 있다");

static const u8 gItemDescription_RazzBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "라즈가 자란다");

static const u8 gItemDescription_BlukBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "블리가 자란다");

static const u8 gItemDescription_NanabBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "나나가 자란다");

static const u8 gItemDescription_WepearBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "서배가 자란다");

static const u8 gItemDescription_PinapBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "파인이 자란다");

static const u8 gItemDescription_PomegBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "유석이 자란다");

static const u8 gItemDescription_KelpsyBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "시마가 자란다");

static const u8 gItemDescription_QualotBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "파비가 자란다");

static const u8 gItemDescription_HondewBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "로매가 자란다");

static const u8 gItemDescription_GrepaBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "또뽀가 자란다");

static const u8 gItemDescription_TamatoBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "토망이 자란다");

static const u8 gItemDescription_CornnBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "수숙이 자란다");

static const u8 gItemDescription_MagostBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "고스티가 자란다");

static const u8 gItemDescription_RabutaBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "라부탐이 자란다");

static const u8 gItemDescription_NomelBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "노멜이 자란다");

static const u8 gItemDescription_SpelonBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "메호키가 자란다");

static const u8 gItemDescription_PamtreBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "자야가 자란다");

static const u8 gItemDescription_WatmelBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "슈박이 자란다");

static const u8 gItemDescription_DurinBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "두리가 자란다");

static const u8 gItemDescription_BelueBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "루베가 자란다");

static const u8 gItemDescription_LiechiBerry[] = _(
    "지니게 하면 위급할 때\n"
    "공격력이 올라간다");

static const u8 gItemDescription_GanlonBerry[] = _(
    "지니게 하면 위급할 때\n"
    "방어력이 올라간다");

static const u8 gItemDescription_SalacBerry[] = _(
    "지니게 하면 위급할 때\n"
    "스피드가 올라간다");

static const u8 gItemDescription_PetayaBerry[] = _(
    "지니게 하면 위급할 때\n"
    "특수공격이 올라간다");

static const u8 gItemDescription_ApicotBerry[] = _(
    "지니게 하면 위급할 때\n"
    "특수방어가 올라간다");

static const u8 gItemDescription_LansatBerry[] = _(
    "지니게 하면 위급할 때\n"
 "적의 급소를\n"
    "맞추기 쉬워진다");

static const u8 gItemDescription_StarfBerry[] = _(
    "지니게 하면 위급할 때\n"
    "능력 중 어느\n"
    "하나가 크게 올라간다");

static const u8 gItemDescription_EnigmaBerry[] = _(
    "포켓몬스넥의 재료\n"
    "땅속에 심으면\n"
    "의문의 열매가 자란다");

static const u8 gItemDescription_BrightPowder[] = _(
    "지니게 하면 빛이\n"
    "상대를 혼란시켜\n"
    "명중률을 떨어뜨린다");

static const u8 gItemDescription_WhiteHerb[] = _(
    "포켓몬에게 지니게 하면\n"
    "떨어진 능력을\n"
    "원래대로 돌린다");

static const u8 gItemDescription_MachoBrace[] = _(
    "포켓몬에게 지니게 하면\n"
    "스피드가 떨어지지만\n"
    "강하게 자란다");

static const u8 gItemDescription_ExpShare[] = _(
    "지니게 한 포켓몬이\n"
    "경험치를\n"
    "나누어 받는다");

static const u8 gItemDescription_QuickClaw[] = _(
    "포켓몬에게 지니게 하면\n"
    "선제공격을\n"
    "가끔씩 할 때가 있다");

static const u8 gItemDescription_SootheBell[] = _(
    "지니게 하면 포켓몬이\n"
    "무척 마음이 편안해져서\n"
    "친밀해지기 쉬워진다");

static const u8 gItemDescription_MentalHerb[] = _(
    "지니게 한 포켓몬이\n"
    "헤롱헤롱 상태가 되었을 때\n"
    "낫게 한다");

static const u8 gItemDescription_ChoiceBand[] = _(
    "공격의 위력이\n"
    "올라가지만 똑같은\n"
    "기술밖에 쓰지 못한다");

static const u8 gItemDescription_KingsRock[] = _(
    "포켓몬에게 지니게 하면\n"
    "데미지를 받은\n"
    "상대가 가끔씩 풀죽는다");

static const u8 gItemDescription_SilverPowder[] = _(
    "포켓몬에게 지니게 하면\n"
    "벌레타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_AmuletCoin[] = _(
    "지니게 한 포켓몬이\n"
    "배틀에 나오면\n"
    "돈을 2배로 받을 수 있다");

static const u8 gItemDescription_CleanseTag[] = _(
    "포켓몬에게 지니게 하면\n"
    "야생 포켓몬과\n"
    "마주치기 어려워진다");

static const u8 gItemDescription_SoulDew[] = _(
    "라티오스 라티아스에게\n"
    "지니게 하면 특수공격과\n"
    "특수방어가 올라간다");

static const u8 gItemDescription_DeepSeaTooth[] = _(
    "날카롭게 빛나는 이빨\n"
    "진주몽에게 지니게 하면\n"
    "특수공격이 올라간다");

static const u8 gItemDescription_DeepSeaScale[] = _(
    "희미하게 빛나는 비늘\n"
    "진주몽에게 지니게 하면\n"
    "특수방어가 올라간다");

static const u8 gItemDescription_SmokeBall[] = _(
    "마주친 야생\n"
    "포켓몬에게서 반드시\n"
    "도망칠 수 있다");

static const u8 gItemDescription_Everstone[] = _(
    "지니게 한 포켓몬이\n"
    "진화하지 않게 되는\n"
    "이상한 돌");

static const u8 gItemDescription_FocusBand[] = _(
    "포켓몬에게 지니게 하면\n"
    "가끔씩 기절을\n"
    "막기도 한다");

static const u8 gItemDescription_LuckyEgg[] = _(
    "지니게 한 포켓몬의\n"
    "경험치가 여느 때보다\n"
    "조금 더 늘어난다");

static const u8 gItemDescription_ScopeLens[] = _(
    "포켓몬에게 지니게 하면\n"
    "급소에\n"
    "맞추기 쉬워진다");

static const u8 gItemDescription_MetalCoat[] = _(
    "포켓몬에게 지니게 하면\n"
    "강철타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_Leftovers[] = _(
    "지니게 하면 체력이\n"
    "배틀을 하는 동안\n"
    "조금씩 회복된다");

static const u8 gItemDescription_DragonScale[] = _(
    "드래곤타입의\n"
    "포켓몬이 지니고 있는\n"
    "이상한 비늘");

static const u8 gItemDescription_LightBall[] = _(
    "찌릿찌릿한 구슬\n"
    "피카츄에게 지니게 하면\n"
    "특수공격이 올라간다");

static const u8 gItemDescription_SoftSand[] = _(
    "포켓몬에게 지니게 하면\n"
    "땅타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_HardStone[] = _(
    "포켓몬에게 지니게 하면\n"
    "바위타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_MiracleSeed[] = _(
    "포켓몬에게 지니게 하면\n"
    "풀타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_BlackGlasses[] = _(
    "포켓몬에게 지니게 하면\n"
    "악타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_BlackBelt[] = _(
    "포켓몬에게 지니게 하면\n"
    "격투타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_Magnet[] = _(
    "포켓몬에게 지니게 하면\n"
    "전기타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_MysticWater[] = _(
    "포켓몬에게 지니게 하면\n"
    "물타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_SharpBeak[] = _(
    "포켓몬에게 지니게 하면\n"
    "비행타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_PoisonBarb[] = _(
    "포켓몬에게 지니게 하면\n"
    "독타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_NeverMeltIce[] = _(
    "포켓몬에게 지니게 하면\n"
    "얼음타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_SpellTag[] = _(
    "포켓몬에게 지니게 하면\n"
    "고스트타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_TwistedSpoon[] = _(
    "포켓몬에게 지니게 하면\n"
    "에스퍼타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_Charcoal[] = _(
    "포켓몬에게 지니게 하면\n"
    "불꽃타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_DragonFang[] = _(
    "포켓몬에게 지니게 하면\n"
    "드래곤타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_SilkScarf[] = _(
    "포켓몬에게 지니게 하면\n"
    "노말타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_UpGrade[] = _(
    "이상한 상자\n"
    "실프주식회사 제품");

static const u8 gItemDescription_ShellBell[] = _(
    "지니게 하면 적에게\n"
    "데미지를 주었을 때\n"
    "체력을 회복한다");

static const u8 gItemDescription_SeaIncense[] = _(
    "포켓몬에게 지니게 하면\n"
    "조금 물타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_LaxIncense[] = _(
    "포켓몬에게 지니게 하면\n"
    "적의 명중률을\n"
    "조금 떨어뜨린다");

static const u8 gItemDescription_LuckyPunch[] = _(
    "럭키에게 지니게 하면\n"
    "상대의 급소에\n"
    "맞추기 쉬워진다");

static const u8 gItemDescription_MetalPowder[] = _(
    "메타몽에게 지니게 하면\n"
    "방어력이 올라간다");

static const u8 gItemDescription_ThickClub[] = _(
    "무언가의 뼈\n"
    "싸게 팔린다");

static const u8 gItemDescription_Stick[] = _(
    "평범한 대파\n"
    "싸게 팔린다");

static const u8 gItemDescription_RedScarf[] = _(
    "지니게 하고 콘테스트에\n"
    "참가시키면 여느 때보다\n"
    "근사하게 보인다");

static const u8 gItemDescription_BlueScarf[] = _(
    "지니게 하고 콘테스트에\n"
    "참가시키면 여느 때보다\n"
    "아름답게 보인다");

static const u8 gItemDescription_PinkScarf[] = _(
    "지니게 하고 콘테스트에\n"
    "참가시키면 여느 때보다\n"
    "귀엽게 보인다");

static const u8 gItemDescription_GreenScarf[] = _(
    "지니게 하고 콘테스트에\n"
    "참가시키면 여느 때보다\n"
    "슬기롭게 보인다");

static const u8 gItemDescription_YellowScarf[] = _(
    "지니게 하고 콘테스트에\n"
    "참가시키면 여느 때보다\n"
    "강인하게 보인다");

static const u8 gItemDescription_MachBike[] = _(
    "2배 이상의 스피드로\n"
    "이동할 수 있는\n"
    "접이식 자전거다");

static const u8 gItemDescription_CoinCase[] = _(
    "손에 넣은 동전을\n"
 "9999개까지\n"
    "넣을 수 있다");

static const u8 gItemDescription_Itemfinder[] = _(
    "보이지 않는 도구에\n"
    "반응해서\n"
    "소리로 가르쳐준다");

static const u8 gItemDescription_OldRod[] = _(
    "포켓몬을 낚는 도구\n"
    "물가에서 사용하면\n"
    "포켓몬을 낚을 수 있다");

static const u8 gItemDescription_GoodRod[] = _(
    "포켓몬을 낚는 도구\n"
    "그럭저럭인 낚싯대라고\n"
    "전해진다");

static const u8 gItemDescription_SuperRod[] = _(
    "포켓몬을 낚는 도구\n"
    "최고의 낚싯대라고\n"
    "전해진다");

static const u8 gItemDescription_SSTicket[] = _(
    "연락선에\n"
    "탈 때 필요하다");

static const u8 gItemDescription_ContestPass[] = _(
    "포켓몬 콘테스트에\n"
    "참가할 수 있다");

static const u8 gItemDescription_WailmerPail[] = _(
    "물을 주는 도구\n"
    "땅에 심은 나무열매를\n"
    "쑥쑥 키운다");

static const u8 gItemDescription_DevonGoods[] = _(
    "데봉에서 만들어진\n"
    "무언가의 파츠가\n"
    "들어 있는 화물");

static const u8 gItemDescription_SootSack[] = _(
    "쌓인 화산재를\n"
 "모으기 위한 주머니");

static const u8 gItemDescription_BasementKey[] = _(
    "보라시티 근처에 있는\n"
    "뉴보라에 들어가기 위한\n"
    "열쇠다");

static const u8 gItemDescription_AcroBike[] = _(
    "점프나 윌리 액션을\n"
    "할 수 있는\n"
    "접이식 자전거다");

static const u8 gItemDescription_PokeblockCase[] = _(
    "나무열매블렌더로\n"
    "만든 포켓몬스넥을\n"
    "저장하는 용기");

static const u8 gItemDescription_Letter[] = _(
    "데봉사장이\n"
    "맡긴 편지");

static const u8 gItemDescription_EonTicket[] = _(
    "남쪽의 외딴섬으로 가는\n"
    "배의 승선티켓");

static const u8 gItemDescription_RedOrb[] = _(
    "고대의 힘이\n"
    "깃들어 있다고 하는\n"
    "빨갛게 빛나는 구슬");

static const u8 gItemDescription_BlueOrb[] = _(
    "고대의 힘이\n"
    "깃들어 있다고 하는\n"
    "파랗게 빛나는 구슬");

static const u8 gItemDescription_Scanner[] = _(
    "버려진 배 안에서\n"
    "발견한 도구");

static const u8 gItemDescription_GoGoggles[] = _(
    "사막의 모래바람으로부터\n"
    "눈을 보호해 주는\n"
    "근사한 고글");

static const u8 gItemDescription_Meteorite[] = _(
    "유성의 폭포에\n"
    "떨어져 있던 운석이다");

static const u8 gItemDescription_Room1Key[] = _(
    "버려진 배의 방으로\n"
    "들어가기 위한 열쇠");

static const u8 gItemDescription_Room2Key[] = _(
    "버려진 배의 방으로\n"
    "들어가기 위한 열쇠");

static const u8 gItemDescription_Room4Key[] = _(
    "버려진 배의 방으로\n"
    "들어가기 위한 열쇠");

static const u8 gItemDescription_Room6Key[] = _(
    "버려진 배의 방으로\n"
    "들어가기 위한 열쇠");

static const u8 gItemDescription_StorageKey[] = _(
    "버려진 배의 창고로\n"
    "들어가기 위한 열쇠");

static const u8 gItemDescription_RootFossil[] = _(
    "오랜 옛날 해저에\n"
    "살았던 포켓몬의\n"
    "화석이라고 전해진다");

static const u8 gItemDescription_ClawFossil[] = _(
    "오랜 옛날 해저에\n"
    "살았던 포켓몬의\n"
    "화석이라고 전해진다");

static const u8 gItemDescription_DevonScope[] = _(
    "보이지 않는 포켓몬에\n"
    "반응하여 소리를 내는\n"
    "데봉의 특제품");

static const u8 gItemDescription_TM01[] = _(
    "적에게 큰 데미지를\n"
    "줄 수 있지만 공격을\n"
    "받으면 풀죽어 버린다");

static const u8 gItemDescription_TM02[] = _(
    "길고 날카로운 발톱으로\n"
    "적을 할퀴어\n"
 "공격한다");

static const u8 gItemDescription_TM03[] = _(
    "초음파 공격으로\n"
    "적을 혼란하게\n"
    "만들기도 한다");

static const u8 gItemDescription_TM04[] = _(
    "정신을 집중\n"
    "시켜서 특수공격과\n"
 "특수방어를 올린다.");

static const u8 gItemDescription_TM05[] = _(
    "짖어서 적을 쫓는다\n"
    "적이 도망가면\n"
    "배틀이 끝난다");

static const u8 gItemDescription_TM06[] = _(
    "점점 데미지가\n"
    "늘어나는 맹독을\n"
    "적에게 준다");

static const u8 gItemDescription_TM07[] = _(
    "싸라기눈을 내리게 해서\n"
    "얼음타입 이외에\n"
    "데미지를 준다");

static const u8 gItemDescription_TM08[] = _(
    "몸을 단련하여\n"
    "공격과 방어의\n"
    "힘을 올린다");

static const u8 gItemDescription_TM09[] = _(
    "씨앗을 2-5회\n"
    "연속으로 발사하여\n"
    "적을 공격한다");

static const u8 gItemDescription_TM10[] = _(
    "포켓몬에 따라 적에게\n"
    "주는 데미지의\n"
    "위력이 변화한다");

static const u8 gItemDescription_TM11[] = _(
    "5턴 동안\n"
    "불꽃타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_TM12[] = _(
    "상대를 화나게 해서\n"
    "공격 기술밖에\n"
    "쓸 수 없게 한다");

static const u8 gItemDescription_TM13[] = _(
    "냉기를 발사해서\n"
    "적을 공격한다\n"
    "얼릴 때가 있다");

static const u8 gItemDescription_TM14[] = _(
    "눈을 강한 바람에\n"
    "실어서 공격한다\n"
    "얼릴 때가 있다");

static const u8 gItemDescription_TM15[] = _(
    "데미지는 크지만\n"
    "사용하면 다음 턴에\n"
    "움직일 수 없게 된다");

static const u8 gItemDescription_TM16[] = _(
    "빛의 장막을 만들어\n"
    "특수공격의 데미지를\n"
    "약하게 한다");

static const u8 gItemDescription_TM17[] = _(
    "그 턴의 공격을\n"
    "받지 않지만 연속으로\n"
    "쓰면 실패하기 쉬워진다");

static const u8 gItemDescription_TM18[] = _(
    "5턴 동안\n"
    "물타입\n"
    "기술의 위력이 올라간다");

static const u8 gItemDescription_TM19[] = _(
    "입힌 데미지의\n"
    "절반의 체력을\n"
    "회복할 수 있다");

static const u8 gItemDescription_TM20[] = _(
    "이상한 힘으로\n"
    "보호받아 특수\n"
    "상태가 되지 않는다");

static const u8 gItemDescription_TM21[] = _(
    "포켓몬이 친밀하지\n"
    "않을수록 주는\n"
    "데미지가 올라간다");

static const u8 gItemDescription_TM22[] = _(
    "1턴으로 빛을\n"
    "흡수해서 다음\n"
    "턴에 공격한다");

static const u8 gItemDescription_TM23[] = _(
    "단단한 꼬리로 공격\n"
    "적의 방어를\n"
    "떨어뜨리기도 한다");

static const u8 gItemDescription_TM24[] = _(
    "전자파를 날려\n"
    "준 적을\n"
    "마비시키기도 한다");

static const u8 gItemDescription_TM25[] = _(
    "번개를 떨어뜨려\n"
    "준 적을\n"
    "마비시키기도 한다");

static const u8 gItemDescription_TM26[] = _(
    "땅을 강하게 흔들어\n"
    "나는 적 이외에\n"
    "큰 데미지를 입힌다");

static const u8 gItemDescription_TM27[] = _(
    "포켓몬이 친밀\n"
    "할수록 주는\n"
    "데미지가 올라간다");

static const u8 gItemDescription_TM28[] = _(
    "1턴째에 땅에\n"
    "파고들어 다음 턴에\n"
    "적을 공격한다");

static const u8 gItemDescription_TM29[] = _(
    "강한 초능력을 내어\n"
    "적의 특수방어를\n"
    "떨어뜨리기도 한다");

static const u8 gItemDescription_TM30[] = _(
    "검은 덩어리를 내던진다\n"
    "적의 특수방어를\n"
    "떨어뜨리기도 한다");

static const u8 gItemDescription_TM31[] = _(
    "빛의장막 등을\n"
    "부숴서 적에게\n"
    "데미지를 줄 수 있다");

static const u8 gItemDescription_TM32[] = _(
    "자신을 만들어\n"
    "적을 혼란하게 해\n"
    "회피율을 올린다");

static const u8 gItemDescription_TM33[] = _(
    "빛나는 장막을 만들어\n"
    "물리 공격의\n"
    "데미지를 약하게 한다");

static const u8 gItemDescription_TM34[] = _(
    "절대로 피할 수 없는\n"
    "스피드로 적에게\n"
    "전격을 날린다");

static const u8 gItemDescription_TM35[] = _(
    "불꽃을 흩뿌린다\n"
    "맞은 적을\n"
    "화상 입힐 때가 있다");

static const u8 gItemDescription_TM36[] = _(
    "오물을 내던진다\n"
    "맞은 적에게 독을\n"
    "줄 때가 있다");

static const u8 gItemDescription_TM37[] = _(
    "모래바람을 일으켜서\n"
    "매 턴 적에게\n"
    "데미지를 준다");

static const u8 gItemDescription_TM38[] = _(
    "큰 문자로 모든 것을\n"
    "불태우는 공격\n"
    "화상 입힐 때가 있다");

static const u8 gItemDescription_TM39[] = _(
    "바위로 적의 움직임을\n"
    "막아서 공격\n"
    "스피드를 떨어뜨릴 수 있다");

static const u8 gItemDescription_TM40[] = _(
    "재빠른 움직임으로\n"
    "절대로 피할 수 없는\n"
    "공격을 한다");

static const u8 gItemDescription_TM41[] = _(
    "적이 똑같은 기술을\n"
    "연속으로 쓸 수\n"
    "없게 한다");

static const u8 gItemDescription_TM42[] = _(
    "독, 마비, 화상일 때\n"
    "공격의 힘을\n"
    "올릴 수 있다");

static const u8 gItemDescription_TM43[] = _(
    "싸우는 장소에 따라\n"
    "적에게 주는\n"
    "추가 효과가 바뀐다");

static const u8 gItemDescription_TM44[] = _(
    "2턴 잠자서 몸의\n"
    "이상과 체력을\n"
    "전부 회복한다");

static const u8 gItemDescription_TM45[] = _(
    "수컷은 암컷에게\n"
    "암컷은 수컷에게\n"
    "기술을 쓸 수 없게 된다");

static const u8 gItemDescription_TM46[] = _(
    "공격 중에 틈을\n"
    "봐서 적이 지니고 있는\n"
    "도구를 훔친다");

static const u8 gItemDescription_TM47[] = _(
    "단단한 날개를 크게\n"
    "펼쳐서 그대로\n"
    "적에게 몸통박치기한다");

static const u8 gItemDescription_TM48[] = _(
    "기술을 쓴 턴에\n"
    "자신과 적의\n"
    "특성을 바꾼다");

static const u8 gItemDescription_TM49[] = _(
    "적이 사용하려고 했던\n"
    "기술을 빼앗아\n"
    "자신이 쓴다");

static const u8 gItemDescription_TM50[] = _(
    "풀 파워로 공격\n"
    "할 수 있지만 특수공격이\n"
    "크게 떨어져 버린다");

static const u8 gItemDescription_HM01[] = _(
    "낫이나 발톱 등\n"
    "날카로운 것으로 적을\n"
    "갈라서 공격한다");

static const u8 gItemDescription_HM02[] = _(
    "1턴째에 하늘을 날아\n"
    "다음 턴에 적을\n"
    "공격한다");

static const u8 gItemDescription_HM03[] = _(
    "물에 파도를 일으켜서\n"
    "그것을 엄청난\n"
    "힘으로 내리친다");

static const u8 gItemDescription_HM04[] = _(
    "전신에 엄청난\n"
    "힘을 담아\n"
    "적을 공격한다");

static const u8 gItemDescription_HM05[] = _(
    "강한 빛으로 눈을\n"
    "속여서 적의\n"
    "명중률을 떨어뜨린다");

static const u8 gItemDescription_HM06[] = _(
    "바위를 깨뜨리는 힘으로\n"
    "적의 방어를\n"
    "떨어뜨릴 때가 있다");

static const u8 gItemDescription_HM07[] = _(
    "폭포를 거꾸로 오르는 듯한\n"
    "기세로 적에게\n"
    "돌진한다");

static const u8 gItemDescription_HM08[] = _(
    "1턴째에 물에\n"
    "잠수해 다음 턴에\n"
    "적을 공격한다");

static const u8 gItemDescription_Dummy[] = _("");
# 33 "src/field/item.c" 2
# 1 "src/field/../data/items.h" 1
const struct Item gItems[] =
{
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("마스터볼"),
        .itemId = ITEM_MASTER_BALL,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_MasterBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 0,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 0,
    },
    {
        .name = _("하이퍼볼"),
        .itemId = ITEM_ULTRA_BALL,
        .price = 1200,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_UltraBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 1,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 1,
    },
    {
        .name = _("수퍼볼"),
        .itemId = ITEM_GREAT_BALL,
        .price = 600,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_GreatBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 2,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 2,
    },
    {
        .name = _("몬스터볼"),
        .itemId = ITEM_POKE_BALL,
        .price = 200,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_PokeBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 3,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 3,
    },
    {
        .name = _("사파리볼"),
        .itemId = ITEM_SAFARI_BALL,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_SafariBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 4,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 4,
    },
    {
        .name = _("넷트볼"),
        .itemId = ITEM_NET_BALL,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_NetBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 5,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 5,
    },
    {
        .name = _("다이브볼"),
        .itemId = ITEM_DIVE_BALL,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_DiveBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 6,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 6,
    },
    {
        .name = _("네스트볼"),
        .itemId = ITEM_NEST_BALL,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_NestBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 7,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 7,
    },
    {
        .name = _("리피드볼"),
        .itemId = ITEM_REPEAT_BALL,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_RepeatBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 8,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 8,
    },
    {
        .name = _("타이마볼"),
        .itemId = ITEM_TIMER_BALL,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TimerBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 9,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 9,
    },
    {
        .name = _("럭셔리볼"),
        .itemId = ITEM_LUXURY_BALL,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_LuxuryBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 10,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 10,
    },
    {
        .name = _("프레미어볼"),
        .itemId = ITEM_PREMIER_BALL,
        .price = 200,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_PremierBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_POKE_BALLS,
        .type = 11,
        .fieldUseFunc = ((void *)0),
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_PokeBall,
        .secondaryId = 11,
    },
    {
        .name = _("상처약"),
        .itemId = ITEM_POTION,
        .price = 300,
        .holdEffect = 0,
        .holdEffectParam = 20,
        .description = gItemDescription_Potion,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("해독제"),
        .itemId = ITEM_ANTIDOTE,
        .price = 100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Antidote,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("화상치료제"),
        .itemId = ITEM_BURN_HEAL,
        .price = 250,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_BurnHeal,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("얼음상태치료제"),
        .itemId = ITEM_ICE_HEAL,
        .price = 250,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_IceHeal,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("잠깨는약"),
        .itemId = ITEM_AWAKENING,
        .price = 250,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Awakening,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("마비치료제"),
        .itemId = ITEM_PARALYZE_HEAL,
        .price = 200,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_ParalyzeHeal,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("회복약"),
        .itemId = ITEM_FULL_RESTORE,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 255,
        .description = gItemDescription_FullRestore,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("풀회복약"),
        .itemId = ITEM_MAX_POTION,
        .price = 2500,
        .holdEffect = 0,
        .holdEffectParam = 255,
        .description = gItemDescription_MaxPotion,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("고급상처약"),
        .itemId = ITEM_HYPER_POTION,
        .price = 1200,
        .holdEffect = 0,
        .holdEffectParam = 200,
        .description = gItemDescription_HyperPotion,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("좋은상처약"),
        .itemId = ITEM_SUPER_POTION,
        .price = 700,
        .holdEffect = 0,
        .holdEffectParam = 50,
        .description = gItemDescription_SuperPotion,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("만병통치제"),
        .itemId = ITEM_FULL_HEAL,
        .price = 600,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_FullHeal,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("기력의조각"),
        .itemId = ITEM_REVIVE,
        .price = 1500,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Revive,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("기력의덩어리"),
        .itemId = ITEM_MAX_REVIVE,
        .price = 4000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_MaxRevive,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("맛있는물"),
        .itemId = ITEM_FRESH_WATER,
        .price = 200,
        .holdEffect = 0,
        .holdEffectParam = 50,
        .description = gItemDescription_FreshWater,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("미네랄사이다"),
        .itemId = ITEM_SODA_POP,
        .price = 300,
        .holdEffect = 0,
        .holdEffectParam = 60,
        .description = gItemDescription_SodaPop,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("후르츠밀크"),
        .itemId = ITEM_LEMONADE,
        .price = 350,
        .holdEffect = 0,
        .holdEffectParam = 80,
        .description = gItemDescription_Lemonade,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("튼튼밀크"),
        .itemId = ITEM_MOOMOO_MILK,
        .price = 500,
        .holdEffect = 0,
        .holdEffectParam = 100,
        .description = gItemDescription_MoomooMilk,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("힘의가루"),
        .itemId = ITEM_ENERGY_POWDER,
        .price = 500,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_EnergyPowder,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("힘의뿌리"),
        .itemId = ITEM_ENERGY_ROOT,
        .price = 800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_EnergyRoot,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("만능가루"),
        .itemId = ITEM_HEAL_POWDER,
        .price = 450,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HealPowder,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("부활초"),
        .itemId = ITEM_REVIVAL_HERB,
        .price = 2800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_RevivalHerb,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("PP에이드"),
        .itemId = ITEM_ETHER,
        .price = 1200,
        .holdEffect = 0,
        .holdEffectParam = 10,
        .description = gItemDescription_Ether,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_PPRecovery,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_PPRecovery,
        .secondaryId = 0,
    },
    {
        .name = _("PP회복"),
        .itemId = ITEM_MAX_ETHER,
        .price = 2000,
        .holdEffect = 0,
        .holdEffectParam = 255,
        .description = gItemDescription_MaxEther,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_PPRecovery,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_PPRecovery,
        .secondaryId = 0,
    },
    {
        .name = _("PP에이더"),
        .itemId = ITEM_ELIXIR,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 10,
        .description = gItemDescription_Elixir,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_PPRecovery,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_PPRecovery,
        .secondaryId = 0,
    },
    {
        .name = _("PP맥스"),
        .itemId = ITEM_MAX_ELIXIR,
        .price = 4500,
        .holdEffect = 0,
        .holdEffectParam = 255,
        .description = gItemDescription_MaxElixir,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_PPRecovery,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_PPRecovery,
        .secondaryId = 0,
    },
    {
        .name = _("용암전병"),
        .itemId = ITEM_LAVA_COOKIE,
        .price = 200,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_LavaCookie,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("파랑비드로"),
        .itemId = ITEM_BLUE_FLUTE,
        .price = 100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_BlueFlute,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("노랑비드로"),
        .itemId = ITEM_YELLOW_FLUTE,
        .price = 200,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_YellowFlute,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("빨강비드로"),
        .itemId = ITEM_RED_FLUTE,
        .price = 300,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_RedFlute,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("검정비드로"),
        .itemId = ITEM_BLACK_FLUTE,
        .price = 400,
        .holdEffect = 0,
        .holdEffectParam = 50,
        .description = gItemDescription_BlackFlute,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_BlackWhiteFlute,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("하양비드로"),
        .itemId = ITEM_WHITE_FLUTE,
        .price = 500,
        .holdEffect = 0,
        .holdEffectParam = 150,
        .description = gItemDescription_WhiteFlute,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_BlackWhiteFlute,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("나무열매쥬스"),
        .itemId = ITEM_BERRY_JUICE,
        .price = 100,
        .holdEffect = 1,
        .holdEffectParam = 20,
        .description = gItemDescription_BerryJuice,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("성스러운분말"),
        .itemId = ITEM_SACRED_ASH,
        .price = 200,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_SacredAsh,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_SacredAsh,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("여울소금"),
        .itemId = ITEM_SHOAL_SALT,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_ShoalSalt,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("여울조개껍질"),
        .itemId = ITEM_SHOAL_SHELL,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_ShoalShell,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("빨강조각"),
        .itemId = ITEM_RED_SHARD,
        .price = 200,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_RedShard,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("파랑조각"),
        .itemId = ITEM_BLUE_SHARD,
        .price = 200,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_BlueShard,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("노랑조각"),
        .itemId = ITEM_YELLOW_SHARD,
        .price = 200,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_YellowShard,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("초록조각"),
        .itemId = ITEM_GREEN_SHARD,
        .price = 200,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_GreenShard,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("맥스업"),
        .itemId = ITEM_HP_UP,
        .price = 9800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HPUp,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("타우린"),
        .itemId = ITEM_PROTEIN,
        .price = 9800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Protein,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("사포닌"),
        .itemId = ITEM_IRON,
        .price = 9800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Iron,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("알칼로이드"),
        .itemId = ITEM_CARBOS,
        .price = 9800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Carbos,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("리보플라빈"),
        .itemId = ITEM_CALCIUM,
        .price = 9800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Calcium,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("이상한사탕"),
        .itemId = ITEM_RARE_CANDY,
        .price = 4800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_RareCandy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_RareCandy,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("포인트업"),
        .itemId = ITEM_PP_UP,
        .price = 9800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_PPUp,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_PPUp,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("키토산"),
        .itemId = ITEM_ZINC,
        .price = 9800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Zinc,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("포인트맥스"),
        .itemId = ITEM_PP_MAX,
        .price = 9800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_PPMax,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_PPUp,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("이펙트가드"),
        .itemId = ITEM_GUARD_SPEC,
        .price = 700,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_GuardSpec,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_StatIncrease,
        .secondaryId = 0,
    },
    {
        .name = _("크리티컬커터"),
        .itemId = ITEM_DIRE_HIT,
        .price = 650,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_DireHit,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_StatIncrease,
        .secondaryId = 0,
    },
    {
        .name = _("플러스파워"),
        .itemId = ITEM_X_ATTACK,
        .price = 500,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_XAttack,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_StatIncrease,
        .secondaryId = 0,
    },
    {
        .name = _("디펜드업"),
        .itemId = ITEM_X_DEFEND,
        .price = 550,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_XDefend,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_StatIncrease,
        .secondaryId = 0,
    },
    {
        .name = _("스피드업"),
        .itemId = ITEM_X_SPEED,
        .price = 350,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_XSpeed,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_StatIncrease,
        .secondaryId = 0,
    },
    {
        .name = _("잘-맞히기"),
        .itemId = ITEM_X_ACCURACY,
        .price = 950,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_XAccuracy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_StatIncrease,
        .secondaryId = 0,
    },
    {
        .name = _("스페셜업"),
        .itemId = ITEM_X_SPECIAL,
        .price = 350,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_XSpecial,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_StatIncrease,
        .secondaryId = 0,
    },
    {
        .name = _("삐삐인형"),
        .itemId = ITEM_POKE_DOLL,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_PokeDoll,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_Escape,
        .secondaryId = 0,
    },
    {
        .name = _("에나비꼬리"),
        .itemId = ITEM_FLUFFY_TAIL,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_FluffyTail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 2,
        .battleUseFunc = ItemUseInBattle_Escape,
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("실버스프레이"),
        .itemId = ITEM_SUPER_REPEL,
        .price = 500,
        .holdEffect = 0,
        .holdEffectParam = 200,
        .description = gItemDescription_SuperRepel,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_Repel,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("골드스프레이"),
        .itemId = ITEM_MAX_REPEL,
        .price = 700,
        .holdEffect = 0,
        .holdEffectParam = 250,
        .description = gItemDescription_MaxRepel,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_Repel,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("동굴탈출로프"),
        .itemId = ITEM_ESCAPE_ROPE,
        .price = 550,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_EscapeRope,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 2,
        .fieldUseFunc = ItemUseOutOfBattle_EscapeRope,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("벌레회피스프레이"),
        .itemId = ITEM_REPEL,
        .price = 350,
        .holdEffect = 0,
        .holdEffectParam = 100,
        .description = gItemDescription_Repel,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_Repel,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("태양의돌"),
        .itemId = ITEM_SUN_STONE,
        .price = 2100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_SunStone,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_EvolutionStone,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("달의돌"),
        .itemId = ITEM_MOON_STONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_MoonStone,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_EvolutionStone,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("불꽃의돌"),
        .itemId = ITEM_FIRE_STONE,
        .price = 2100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_FireStone,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_EvolutionStone,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("천둥의돌"),
        .itemId = ITEM_THUNDER_STONE,
        .price = 2100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_ThunderStone,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_EvolutionStone,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("물의돌"),
        .itemId = ITEM_WATER_STONE,
        .price = 2100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_WaterStone,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_EvolutionStone,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("리프의돌"),
        .itemId = ITEM_LEAF_STONE,
        .price = 2100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_LeafStone,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_EvolutionStone,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("작은버섯"),
        .itemId = ITEM_TINY_MUSHROOM,
        .price = 500,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TinyMushroom,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("큰버섯"),
        .itemId = ITEM_BIG_MUSHROOM,
        .price = 5000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_BigMushroom,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("진주"),
        .itemId = ITEM_PEARL,
        .price = 1400,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Pearl,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("큰진주"),
        .itemId = ITEM_BIG_PEARL,
        .price = 7500,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_BigPearl,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("별의모래"),
        .itemId = ITEM_STARDUST,
        .price = 2000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Stardust,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("별의조각"),
        .itemId = ITEM_STAR_PIECE,
        .price = 9800,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_StarPiece,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("금구슬"),
        .itemId = ITEM_NUGGET,
        .price = 10000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Nugget,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("하트비늘"),
        .itemId = ITEM_HEART_SCALE,
        .price = 100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HeartScale,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("오렌지메일"),
        .itemId = ITEM_ORANGE_MAIL,
        .price = 50,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_OrangeMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("항구메일"),
        .itemId = ITEM_HARBOR_MAIL,
        .price = 50,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HarborMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 1,
    },
    {
        .name = _("반짝반짝메일"),
        .itemId = ITEM_GLITTER_MAIL,
        .price = 50,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_GlitterMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 2,
    },
    {
        .name = _("메카니컬메일"),
        .itemId = ITEM_MECH_MAIL,
        .price = 50,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_MechMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 3,
    },
    {
        .name = _("나무메일"),
        .itemId = ITEM_WOOD_MAIL,
        .price = 50,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_WoodMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 4,
    },
    {
        .name = _("파도메일"),
        .itemId = ITEM_WAVE_MAIL,
        .price = 50,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_WaveMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 5,
    },
    {
        .name = _("보배메일"),
        .itemId = ITEM_BEAD_MAIL,
        .price = 50,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_BeadMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 6,
    },
    {
        .name = _("그림자메일"),
        .itemId = ITEM_SHADOW_MAIL,
        .price = 50,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_ShadowMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 7,
    },
    {
        .name = _("열대메일"),
        .itemId = ITEM_TROPIC_MAIL,
        .price = 50,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TropicMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 8,
    },
    {
        .name = _("꿈의메일"),
        .itemId = ITEM_DREAM_MAIL,
        .price = 50,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_DreamMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 9,
    },
    {
        .name = _("미라클메일"),
        .itemId = ITEM_FAB_MAIL,
        .price = 50,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_FabMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 10,
    },
    {
        .name = _("복고풍메일"),
        .itemId = ITEM_RETRO_MAIL,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_RetroMail,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 0,
        .fieldUseFunc = ItemUseOutOfBattle_Mail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 11,
    },
    {
        .name = _("버치열매"),
        .itemId = ITEM_CHERI_BERRY,
        .price = 20,
        .holdEffect = 2,
        .holdEffectParam = 0,
        .description = gItemDescription_CheriBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("유루열매"),
        .itemId = ITEM_CHESTO_BERRY,
        .price = 20,
        .holdEffect = 3,
        .holdEffectParam = 0,
        .description = gItemDescription_ChestoBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("복슝열매"),
        .itemId = ITEM_PECHA_BERRY,
        .price = 20,
        .holdEffect = 4,
        .holdEffectParam = 0,
        .description = gItemDescription_PechaBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("복분열매"),
        .itemId = ITEM_RAWST_BERRY,
        .price = 20,
        .holdEffect = 5,
        .holdEffectParam = 0,
        .description = gItemDescription_RawstBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("배리열매"),
        .itemId = ITEM_ASPEAR_BERRY,
        .price = 20,
        .holdEffect = 6,
        .holdEffectParam = 0,
        .description = gItemDescription_AspearBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("과사열매"),
        .itemId = ITEM_LEPPA_BERRY,
        .price = 20,
        .holdEffect = 7,
        .holdEffectParam = 10,
        .description = gItemDescription_LeppaBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_PPRecovery,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_PPRecovery,
        .secondaryId = 0,
    },
    {
        .name = _("오랭열매"),
        .itemId = ITEM_ORAN_BERRY,
        .price = 20,
        .holdEffect = 1,
        .holdEffectParam = 10,
        .description = gItemDescription_OranBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("시몬열매"),
        .itemId = ITEM_PERSIM_BERRY,
        .price = 20,
        .holdEffect = 8,
        .holdEffectParam = 0,
        .description = gItemDescription_PersimBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("리샘열매"),
        .itemId = ITEM_LUM_BERRY,
        .price = 20,
        .holdEffect = 9,
        .holdEffectParam = 0,
        .description = gItemDescription_LumBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("자뭉열매"),
        .itemId = ITEM_SITRUS_BERRY,
        .price = 20,
        .holdEffect = 1,
        .holdEffectParam = 30,
        .description = gItemDescription_SitrusBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_Medicine,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_Medicine,
        .secondaryId = 0,
    },
    {
        .name = _("무화열매"),
        .itemId = ITEM_FIGY_BERRY,
        .price = 20,
        .holdEffect = 10,
        .holdEffectParam = 8,
        .description = gItemDescription_FigyBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("위키열매"),
        .itemId = ITEM_WIKI_BERRY,
        .price = 20,
        .holdEffect = 11,
        .holdEffectParam = 8,
        .description = gItemDescription_WikiBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("마고열매"),
        .itemId = ITEM_MAGO_BERRY,
        .price = 20,
        .holdEffect = 12,
        .holdEffectParam = 8,
        .description = gItemDescription_MagoBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("아바열매"),
        .itemId = ITEM_AGUAV_BERRY,
        .price = 20,
        .holdEffect = 13,
        .holdEffectParam = 8,
        .description = gItemDescription_AguavBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("파야열매"),
        .itemId = ITEM_IAPAPA_BERRY,
        .price = 20,
        .holdEffect = 14,
        .holdEffectParam = 8,
        .description = gItemDescription_IapapaBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("라즈열매"),
        .itemId = ITEM_RAZZ_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_RazzBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("블리열매"),
        .itemId = ITEM_BLUK_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_BlukBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("나나열매"),
        .itemId = ITEM_NANAB_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_NanabBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("서배열매"),
        .itemId = ITEM_WEPEAR_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_WepearBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("파인열매"),
        .itemId = ITEM_PINAP_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_PinapBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("유석열매"),
        .itemId = ITEM_POMEG_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_PomegBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("시마열매"),
        .itemId = ITEM_KELPSY_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_KelpsyBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("파비열매"),
        .itemId = ITEM_QUALOT_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_QualotBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("로매열매"),
        .itemId = ITEM_HONDEW_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HondewBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("또뽀열매"),
        .itemId = ITEM_GREPA_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_GrepaBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("토망열매"),
        .itemId = ITEM_TAMATO_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TamatoBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("수숙열매"),
        .itemId = ITEM_CORNN_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_CornnBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("고스티열매"),
        .itemId = ITEM_MAGOST_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_MagostBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("라부탐열매"),
        .itemId = ITEM_RABUTA_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_RabutaBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("노멜열매"),
        .itemId = ITEM_NOMEL_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_NomelBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("메호키열매"),
        .itemId = ITEM_SPELON_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_SpelonBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("자야열매"),
        .itemId = ITEM_PAMTRE_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_PamtreBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("슈박열매"),
        .itemId = ITEM_WATMEL_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_WatmelBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("두리열매"),
        .itemId = ITEM_DURIN_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_DurinBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("루베열매"),
        .itemId = ITEM_BELUE_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_BelueBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("치리열매"),
        .itemId = ITEM_LIECHI_BERRY,
        .price = 20,
        .holdEffect = 15,
        .holdEffectParam = 4,
        .description = gItemDescription_LiechiBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("용아열매"),
        .itemId = ITEM_GANLON_BERRY,
        .price = 20,
        .holdEffect = 16,
        .holdEffectParam = 4,
        .description = gItemDescription_GanlonBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("캄라열매"),
        .itemId = ITEM_SALAC_BERRY,
        .price = 20,
        .holdEffect = 17,
        .holdEffectParam = 4,
        .description = gItemDescription_SalacBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("야타비열매"),
        .itemId = ITEM_PETAYA_BERRY,
        .price = 20,
        .holdEffect = 18,
        .holdEffectParam = 4,
        .description = gItemDescription_PetayaBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("규살열매"),
        .itemId = ITEM_APICOT_BERRY,
        .price = 20,
        .holdEffect = 19,
        .holdEffectParam = 4,
        .description = gItemDescription_ApicotBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("랑사열매"),
        .itemId = ITEM_LANSAT_BERRY,
        .price = 20,
        .holdEffect = 20,
        .holdEffectParam = 4,
        .description = gItemDescription_LansatBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("스타열매"),
        .itemId = ITEM_STARF_BERRY,
        .price = 20,
        .holdEffect = 21,
        .holdEffectParam = 4,
        .description = gItemDescription_StarfBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("의문열매"),
        .itemId = ITEM_ENIGMA_BERRY,
        .price = 20,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_EnigmaBerry,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_BERRIES,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_EnigmaBerry,
        .battleUsage = 1,
        .battleUseFunc = ItemUseInBattle_EnigmaBerry,
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("반짝가루"),
        .itemId = ITEM_BRIGHT_POWDER,
        .price = 10,
        .holdEffect = 22,
        .holdEffectParam = 10,
        .description = gItemDescription_BrightPowder,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("하양허브"),
        .itemId = ITEM_WHITE_HERB,
        .price = 100,
        .holdEffect = 23,
        .holdEffectParam = 0,
        .description = gItemDescription_WhiteHerb,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("교정깁스"),
        .itemId = ITEM_MACHO_BRACE,
        .price = 3000,
        .holdEffect = 24,
        .holdEffectParam = 0,
        .description = gItemDescription_MachoBrace,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("학습장치"),
        .itemId = ITEM_EXP_SHARE,
        .price = 3000,
        .holdEffect = 25,
        .holdEffectParam = 0,
        .description = gItemDescription_ExpShare,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("선제공격손톱"),
        .itemId = ITEM_QUICK_CLAW,
        .price = 100,
        .holdEffect = 26,
        .holdEffectParam = 20,
        .description = gItemDescription_QuickClaw,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("평온의방울"),
        .itemId = ITEM_SOOTHE_BELL,
        .price = 100,
        .holdEffect = 27,
        .holdEffectParam = 0,
        .description = gItemDescription_SootheBell,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("멘탈허브"),
        .itemId = ITEM_MENTAL_HERB,
        .price = 100,
        .holdEffect = 28,
        .holdEffectParam = 0,
        .description = gItemDescription_MentalHerb,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("구애의머리띠"),
        .itemId = ITEM_CHOICE_BAND,
        .price = 100,
        .holdEffect = 29,
        .holdEffectParam = 0,
        .description = gItemDescription_ChoiceBand,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("왕의징표석"),
        .itemId = ITEM_KINGS_ROCK,
        .price = 100,
        .holdEffect = 30,
        .holdEffectParam = 10,
        .description = gItemDescription_KingsRock,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("은빛가루"),
        .itemId = ITEM_SILVER_POWDER,
        .price = 100,
        .holdEffect = 31,
        .holdEffectParam = 10,
        .description = gItemDescription_SilverPowder,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("부적금화"),
        .itemId = ITEM_AMULET_COIN,
        .price = 100,
        .holdEffect = 32,
        .holdEffectParam = 10,
        .description = gItemDescription_AmuletCoin,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("순결의부적"),
        .itemId = ITEM_CLEANSE_TAG,
        .price = 200,
        .holdEffect = 33,
        .holdEffectParam = 0,
        .description = gItemDescription_CleanseTag,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("마음의물방울"),
        .itemId = ITEM_SOUL_DEW,
        .price = 200,
        .holdEffect = 34,
        .holdEffectParam = 0,
        .description = gItemDescription_SoulDew,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("심해의이빨"),
        .itemId = ITEM_DEEP_SEA_TOOTH,
        .price = 200,
        .holdEffect = 35,
        .holdEffectParam = 0,
        .description = gItemDescription_DeepSeaTooth,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("심해의비늘"),
        .itemId = ITEM_DEEP_SEA_SCALE,
        .price = 200,
        .holdEffect = 36,
        .holdEffectParam = 0,
        .description = gItemDescription_DeepSeaScale,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("연막탄"),
        .itemId = ITEM_SMOKE_BALL,
        .price = 200,
        .holdEffect = 37,
        .holdEffectParam = 0,
        .description = gItemDescription_SmokeBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("변함없는돌"),
        .itemId = ITEM_EVERSTONE,
        .price = 200,
        .holdEffect = 38,
        .holdEffectParam = 0,
        .description = gItemDescription_Everstone,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기합의머리띠"),
        .itemId = ITEM_FOCUS_BAND,
        .price = 200,
        .holdEffect = 39,
        .holdEffectParam = 10,
        .description = gItemDescription_FocusBand,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("행복의알"),
        .itemId = ITEM_LUCKY_EGG,
        .price = 200,
        .holdEffect = 40,
        .holdEffectParam = 0,
        .description = gItemDescription_LuckyEgg,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("초점렌즈"),
        .itemId = ITEM_SCOPE_LENS,
        .price = 200,
        .holdEffect = 41,
        .holdEffectParam = 0,
        .description = gItemDescription_ScopeLens,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("금속코트"),
        .itemId = ITEM_METAL_COAT,
        .price = 100,
        .holdEffect = 42,
        .holdEffectParam = 10,
        .description = gItemDescription_MetalCoat,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("먹다남은음식"),
        .itemId = ITEM_LEFTOVERS,
        .price = 200,
        .holdEffect = 43,
        .holdEffectParam = 10,
        .description = gItemDescription_Leftovers,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("용의비늘"),
        .itemId = ITEM_DRAGON_SCALE,
        .price = 2100,
        .holdEffect = 44,
        .holdEffectParam = 10,
        .description = gItemDescription_DragonScale,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("전기구슬"),
        .itemId = ITEM_LIGHT_BALL,
        .price = 100,
        .holdEffect = 45,
        .holdEffectParam = 0,
        .description = gItemDescription_LightBall,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("부드러운모래"),
        .itemId = ITEM_SOFT_SAND,
        .price = 100,
        .holdEffect = 46,
        .holdEffectParam = 10,
        .description = gItemDescription_SoftSand,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("딱딱한돌"),
        .itemId = ITEM_HARD_STONE,
        .price = 100,
        .holdEffect = 47,
        .holdEffectParam = 10,
        .description = gItemDescription_HardStone,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기적의씨"),
        .itemId = ITEM_MIRACLE_SEED,
        .price = 100,
        .holdEffect = 48,
        .holdEffectParam = 10,
        .description = gItemDescription_MiracleSeed,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("검은안경"),
        .itemId = ITEM_BLACK_GLASSES,
        .price = 100,
        .holdEffect = 49,
        .holdEffectParam = 10,
        .description = gItemDescription_BlackGlasses,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("검은띠"),
        .itemId = ITEM_BLACK_BELT,
        .price = 100,
        .holdEffect = 50,
        .holdEffectParam = 10,
        .description = gItemDescription_BlackBelt,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("자석"),
        .itemId = ITEM_MAGNET,
        .price = 100,
        .holdEffect = 51,
        .holdEffectParam = 10,
        .description = gItemDescription_Magnet,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("신비의물방울"),
        .itemId = ITEM_MYSTIC_WATER,
        .price = 100,
        .holdEffect = 52,
        .holdEffectParam = 10,
        .description = gItemDescription_MysticWater,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("예리한부리"),
        .itemId = ITEM_SHARP_BEAK,
        .price = 100,
        .holdEffect = 53,
        .holdEffectParam = 10,
        .description = gItemDescription_SharpBeak,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("독바늘"),
        .itemId = ITEM_POISON_BARB,
        .price = 100,
        .holdEffect = 54,
        .holdEffectParam = 10,
        .description = gItemDescription_PoisonBarb,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("녹지않는얼음"),
        .itemId = ITEM_NEVER_MELT_ICE,
        .price = 100,
        .holdEffect = 55,
        .holdEffectParam = 10,
        .description = gItemDescription_NeverMeltIce,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("저주의부적"),
        .itemId = ITEM_SPELL_TAG,
        .price = 100,
        .holdEffect = 56,
        .holdEffectParam = 10,
        .description = gItemDescription_SpellTag,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("휘어진스푼"),
        .itemId = ITEM_TWISTED_SPOON,
        .price = 100,
        .holdEffect = 57,
        .holdEffectParam = 10,
        .description = gItemDescription_TwistedSpoon,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("목탄"),
        .itemId = ITEM_CHARCOAL,
        .price = 9800,
        .holdEffect = 58,
        .holdEffectParam = 10,
        .description = gItemDescription_Charcoal,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("용의이빨"),
        .itemId = ITEM_DRAGON_FANG,
        .price = 100,
        .holdEffect = 59,
        .holdEffectParam = 10,
        .description = gItemDescription_DragonFang,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("실크스카프"),
        .itemId = ITEM_SILK_SCARF,
        .price = 100,
        .holdEffect = 60,
        .holdEffectParam = 10,
        .description = gItemDescription_SilkScarf,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("업그레이드"),
        .itemId = ITEM_UP_GRADE,
        .price = 2100,
        .holdEffect = 61,
        .holdEffectParam = 0,
        .description = gItemDescription_UpGrade,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("조개껍질방울"),
        .itemId = ITEM_SHELL_BELL,
        .price = 200,
        .holdEffect = 62,
        .holdEffectParam = 8,
        .description = gItemDescription_ShellBell,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("바닷물향로"),
        .itemId = ITEM_SEA_INCENSE,
        .price = 9600,
        .holdEffect = 52,
        .holdEffectParam = 5,
        .description = gItemDescription_SeaIncense,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("무사태평향로"),
        .itemId = ITEM_LAX_INCENSE,
        .price = 9600,
        .holdEffect = 22,
        .holdEffectParam = 5,
        .description = gItemDescription_LaxIncense,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("럭키펀치"),
        .itemId = ITEM_LUCKY_PUNCH,
        .price = 10,
        .holdEffect = 63,
        .holdEffectParam = 0,
        .description = gItemDescription_LuckyPunch,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("금속파우더"),
        .itemId = ITEM_METAL_POWDER,
        .price = 10,
        .holdEffect = 64,
        .holdEffectParam = 0,
        .description = gItemDescription_MetalPowder,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("굵은뼈"),
        .itemId = ITEM_THICK_CLUB,
        .price = 500,
        .holdEffect = 65,
        .holdEffectParam = 0,
        .description = gItemDescription_ThickClub,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("대파"),
        .itemId = ITEM_STICK,
        .price = 200,
        .holdEffect = 66,
        .holdEffectParam = 0,
        .description = gItemDescription_Stick,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("빨강밴드"),
        .itemId = ITEM_RED_SCARF,
        .price = 100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_RedScarf,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("파랑밴드"),
        .itemId = ITEM_BLUE_SCARF,
        .price = 100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_BlueScarf,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("분홍밴드"),
        .itemId = ITEM_PINK_SCARF,
        .price = 100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_PinkScarf,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("초록밴드"),
        .itemId = ITEM_GREEN_SCARF,
        .price = 100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_GreenScarf,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("노랑밴드"),
        .itemId = ITEM_YELLOW_SCARF,
        .price = 100,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_YellowScarf,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("마하자전거"),
        .itemId = ITEM_MACH_BIKE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_MachBike,
        .importance = 1,
        .unk19 = 1,
        .pocket = POCKET_KEY_ITEMS,
        .type = 2,
        .fieldUseFunc = ItemUseOutOfBattle_Bike,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("동전케이스"),
        .itemId = ITEM_COIN_CASE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_CoinCase,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CoinCase,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("다우징머신"),
        .itemId = ITEM_ITEMFINDER,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Itemfinder,
        .importance = 1,
        .unk19 = 1,
        .pocket = POCKET_KEY_ITEMS,
        .type = 2,
        .fieldUseFunc = ItemUseOutOfBattle_Itemfinder,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("낡은낚싯대"),
        .itemId = ITEM_OLD_ROD,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_OldRod,
        .importance = 1,
        .unk19 = 1,
        .pocket = POCKET_KEY_ITEMS,
        .type = 2,
        .fieldUseFunc = ItemUseOutOfBattle_Rod,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("좋은낚싯대"),
        .itemId = ITEM_GOOD_ROD,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_GoodRod,
        .importance = 1,
        .unk19 = 1,
        .pocket = POCKET_KEY_ITEMS,
        .type = 2,
        .fieldUseFunc = ItemUseOutOfBattle_Rod,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 1,
    },
    {
        .name = _("대단한낚싯대"),
        .itemId = ITEM_SUPER_ROD,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_SuperRod,
        .importance = 1,
        .unk19 = 1,
        .pocket = POCKET_KEY_ITEMS,
        .type = 2,
        .fieldUseFunc = ItemUseOutOfBattle_Rod,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 2,
    },
    {
        .name = _("승선티켓"),
        .itemId = ITEM_SS_TICKET,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_SSTicket,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("콘테스트패스"),
        .itemId = ITEM_CONTEST_PASS,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_ContestPass,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("고래왕자물뿌리개"),
        .itemId = ITEM_WAILMER_PAIL,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_WailmerPail,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 2,
        .fieldUseFunc = ItemUseOutOfBattle_WailmerPail,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("데봉화물"),
        .itemId = ITEM_DEVON_GOODS,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_DevonGoods,
        .importance = 2,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("검댕자루"),
        .itemId = ITEM_SOOT_SACK,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_SootSack,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("지하열쇠"),
        .itemId = ITEM_BASEMENT_KEY,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_BasementKey,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("더트자전거"),
        .itemId = ITEM_ACRO_BIKE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_AcroBike,
        .importance = 1,
        .unk19 = 1,
        .pocket = POCKET_KEY_ITEMS,
        .type = 2,
        .fieldUseFunc = ItemUseOutOfBattle_Bike,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 1,
    },
    {
        .name = _("포켓몬스넥케이스"),
        .itemId = ITEM_POKEBLOCK_CASE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_PokeblockCase,
        .importance = 1,
        .unk19 = 1,
        .pocket = POCKET_KEY_ITEMS,
        .type = 3,
        .fieldUseFunc = ItemUseOutOfBattle_PokeblockCase,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("성호에게줄편지"),
        .itemId = ITEM_LETTER,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Letter,
        .importance = 2,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("무한티켓"),
        .itemId = ITEM_EON_TICKET,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_EonTicket,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 1,
    },
    {
        .name = _("주홍구슬"),
        .itemId = ITEM_RED_ORB,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_RedOrb,
        .importance = 2,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("쪽빛구슬"),
        .itemId = ITEM_BLUE_ORB,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_BlueOrb,
        .importance = 2,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("탐지기"),
        .itemId = ITEM_SCANNER,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Scanner,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("고고고글"),
        .itemId = ITEM_GO_GOGGLES,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_GoGoggles,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("운석"),
        .itemId = ITEM_METEORITE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Meteorite,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("1호실열쇠"),
        .itemId = ITEM_ROOM_1_KEY,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Room1Key,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("2호실열쇠"),
        .itemId = ITEM_ROOM_2_KEY,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Room2Key,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("4호실열쇠"),
        .itemId = ITEM_ROOM_4_KEY,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Room4Key,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("6호실열쇠"),
        .itemId = ITEM_ROOM_6_KEY,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Room6Key,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("창고열쇠"),
        .itemId = ITEM_STORAGE_KEY,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_StorageKey,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("뿌리화석"),
        .itemId = ITEM_ROOT_FOSSIL,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_RootFossil,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("발톱화석"),
        .itemId = ITEM_CLAW_FOSSIL,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_ClawFossil,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("데봉스코프"),
        .itemId = ITEM_DEVON_SCOPE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_DevonScope,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_KEY_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신01"),
        .itemId = ITEM_TM01,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM01,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신02"),
        .itemId = ITEM_TM02,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM02,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신03"),
        .itemId = ITEM_TM03,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM03,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신04"),
        .itemId = ITEM_TM04,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM04,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신05"),
        .itemId = ITEM_TM05,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM05,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신06"),
        .itemId = ITEM_TM06,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM06,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신07"),
        .itemId = ITEM_TM07,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM07,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신08"),
        .itemId = ITEM_TM08,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM08,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신09"),
        .itemId = ITEM_TM09,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM09,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신10"),
        .itemId = ITEM_TM10,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM10,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신11"),
        .itemId = ITEM_TM11,
        .price = 2000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM11,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신12"),
        .itemId = ITEM_TM12,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM12,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신13"),
        .itemId = ITEM_TM13,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM13,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신14"),
        .itemId = ITEM_TM14,
        .price = 5500,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM14,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신15"),
        .itemId = ITEM_TM15,
        .price = 7500,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM15,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신16"),
        .itemId = ITEM_TM16,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM16,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신17"),
        .itemId = ITEM_TM17,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM17,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신18"),
        .itemId = ITEM_TM18,
        .price = 2000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM18,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신19"),
        .itemId = ITEM_TM19,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM19,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신20"),
        .itemId = ITEM_TM20,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM20,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신21"),
        .itemId = ITEM_TM21,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM21,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신22"),
        .itemId = ITEM_TM22,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM22,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신23"),
        .itemId = ITEM_TM23,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM23,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신24"),
        .itemId = ITEM_TM24,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM24,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신25"),
        .itemId = ITEM_TM25,
        .price = 5500,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM25,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신26"),
        .itemId = ITEM_TM26,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM26,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신27"),
        .itemId = ITEM_TM27,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM27,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신28"),
        .itemId = ITEM_TM28,
        .price = 2000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM28,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신29"),
        .itemId = ITEM_TM29,
        .price = 2000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM29,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신30"),
        .itemId = ITEM_TM30,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM30,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신31"),
        .itemId = ITEM_TM31,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM31,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신32"),
        .itemId = ITEM_TM32,
        .price = 2000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM32,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신33"),
        .itemId = ITEM_TM33,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM33,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신34"),
        .itemId = ITEM_TM34,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM34,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신35"),
        .itemId = ITEM_TM35,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM35,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신36"),
        .itemId = ITEM_TM36,
        .price = 1000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM36,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신37"),
        .itemId = ITEM_TM37,
        .price = 2000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM37,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신38"),
        .itemId = ITEM_TM38,
        .price = 5500,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM38,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신39"),
        .itemId = ITEM_TM39,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM39,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신40"),
        .itemId = ITEM_TM40,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM40,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신41"),
        .itemId = ITEM_TM41,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM41,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신42"),
        .itemId = ITEM_TM42,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM42,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신43"),
        .itemId = ITEM_TM43,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM43,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신44"),
        .itemId = ITEM_TM44,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM44,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신45"),
        .itemId = ITEM_TM45,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM45,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신46"),
        .itemId = ITEM_TM46,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM46,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신47"),
        .itemId = ITEM_TM47,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM47,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신48"),
        .itemId = ITEM_TM48,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM48,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신49"),
        .itemId = ITEM_TM49,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM49,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("기술머신50"),
        .itemId = ITEM_TM50,
        .price = 3000,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_TM50,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("비전머신01"),
        .itemId = ITEM_HM01,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HM01,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("비전머신02"),
        .itemId = ITEM_HM02,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HM02,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("비전머신03"),
        .itemId = ITEM_HM03,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HM03,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("비전머신04"),
        .itemId = ITEM_HM04,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HM04,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("비전머신05"),
        .itemId = ITEM_HM05,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HM05,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("비전머신06"),
        .itemId = ITEM_HM06,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HM06,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("비전머신07"),
        .itemId = ITEM_HM07,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HM07,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("비전머신08"),
        .itemId = ITEM_HM08,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_HM08,
        .importance = 1,
        .unk19 = 0,
        .pocket = POCKET_TM_HM,
        .type = 1,
        .fieldUseFunc = ItemUseOutOfBattle_TMHM,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
    {
        .name = _("????????"),
        .itemId = ITEM_NONE,
        .price = 0,
        .holdEffect = 0,
        .holdEffectParam = 0,
        .description = gItemDescription_Dummy,
        .importance = 0,
        .unk19 = 0,
        .pocket = POCKET_ITEMS,
        .type = 4,
        .fieldUseFunc = ItemUseOutOfBattle_CannotUse,
        .battleUsage = 0,
        .battleUseFunc = ((void *)0),
        .secondaryId = 0,
    },
};
# 34 "src/field/item.c" 2

static void CompactPCItems(void);

void CopyItemName(u16 itemId, u8 *string)
{
    if (itemId == ITEM_ENIGMA_BERRY)
    {
        StringCopy(string, GetBerryInfo(0x2B)->name);
        StringAppend(string, gOtherText_Berry2);
    }
    else
        StringCopy(string, ItemId_GetItem(itemId)->name);
}


s8 CountUsedBagPocketSlots(u8 pocket)
{
    u8 i;

    for (i = 0; i < gBagPockets[pocket].capacity; i++)
    {
        if (gBagPockets[pocket].itemSlots[i].itemId == 0)
            return i;
    }
    return -1;
}

bool8 IsBagPocketNonEmpty(u8 pocket)
{
    u8 i;

    for (i = 0; i < gBagPockets[pocket - 1].capacity; i++)
    {
        if (gBagPockets[pocket - 1].itemSlots[i].itemId != 0)
            return 1;
    }
    return 0;
}

bool8 CheckBagHasItem(u16 itemId, u16 count)
{
    u8 i;
    u8 pocket;

    if (ItemId_GetPocket(itemId) == 0)
        return 0;
    pocket = ItemId_GetPocket(itemId) - 1;

    for (i = 0; i < gBagPockets[pocket].capacity; i++)
    {
        if (gBagPockets[pocket].itemSlots[i].itemId == itemId)
        {

            if (gBagPockets[pocket].itemSlots[i].quantity >= count)
                return 1;
            count -= gBagPockets[pocket].itemSlots[i].quantity;

            if (count == 0)
                return 1;
        }
    }
    return 0;
}

bool8 CheckBagHasSpace(u16 itemId, u16 count)
{
    u8 i;
    u8 pocket;
    u16 slotCapacity;

    if (ItemId_GetPocket(itemId) == 0)
        return 0;
    pocket = ItemId_GetPocket(itemId) - 1;
    if (pocket != BERRIES_POCKET)
        slotCapacity = 99;
    else
        slotCapacity = 999;


    for (i = 0; i < gBagPockets[pocket].capacity; i++)
    {
        if (gBagPockets[pocket].itemSlots[i].itemId == itemId)
        {
            if (gBagPockets[pocket].itemSlots[i].quantity + count <= slotCapacity)
                return 1;
            if (pocket == TMHM_POCKET || pocket == BERRIES_POCKET)
                return 0;
            count -= slotCapacity - gBagPockets[pocket].itemSlots[i].quantity;
            if (count == 0)
                return 1;
        }
    }


    if (count > 0)
    {
        for (i = 0; i < gBagPockets[pocket].capacity; i++)
        {
            if (gBagPockets[pocket].itemSlots[i].itemId == 0)
            {
                if (count <= slotCapacity)
                    return 1;
                else
                    count -= slotCapacity;
            }
        }
        if (count > 0)
            return 0;
    }

    return 1;
}
# 215 "src/field/item.c"
__attribute__((naked))
bool8 AddBagItem(u16 itemId, u16 count)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r9\n    mov r6, r8\n    push {r6,r7}\n    sub sp, 0x100\n    lsls r0, 16\n    lsrs r0, 16\n    mov r8, r0\n    lsls r1, 16\n    lsrs r4, r1, 16\n    bl ItemId_GetPocket\n    lsls r0, 24\n    cmp r0, 0\n    beq _080A9510\n    mov r0, r8\n    bl ItemId_GetPocket\n    subs r0, 0x1\n    lsls r0, 24\n    lsrs r6, r0, 24\n    ldr r1, _080A94F8 @ =gBagPockets\n    lsls r0, r6, 3\n    adds r5, r0, r1\n    ldr r1, [r5]\n    ldrb r2, [r5, 0x4]\n    lsls r2, 2\n    mov r0, sp\n    bl memcpy\n    ldr r7, _080A94FC @ =0x000003e7\n    cmp r6, 0x3\n    beq _080A9468\n    movs r7, 0x63\n_080A9468:\n    movs r1, 0\n    ldrb r0, [r5, 0x4]\n    cmp r1, r0\n    bcs _080A94B2\n    subs r0, r6, 0x2\n    lsls r0, 24\n    lsrs r0, 24\n    mov r12, r0\n_080A9478:\n    lsls r0, r1, 2\n    mov r2, sp\n    adds r3, r2, r0\n    ldrh r0, [r3]\n    cmp r0, r8\n    bne _080A94A6\n    ldrh r2, [r3, 0x2]\n    adds r0, r2, r4\n    cmp r0, r7\n    ble _080A9500\n    mov r0, r12\n    cmp r0, 0x1\n    bls _080A9510\n    subs r0, r7, r2\n    subs r0, r4, r0\n    lsls r0, 16\n    lsrs r4, r0, 16\n    strh r7, [r3, 0x2]\n    ldr r2, _080A94F8 @ =gBagPockets\n    mov r9, r2\n    lsls r3, r6, 3\n    cmp r4, 0\n    beq _080A9516\n_080A94A6:\n    adds r0, r1, 0x1\n    lsls r0, 24\n    lsrs r1, r0, 24\n    ldrb r0, [r5, 0x4]\n    cmp r1, r0\n    bcc _080A9478\n_080A94B2:\n    ldr r2, _080A94F8 @ =gBagPockets\n    mov r9, r2\n    lsls r3, r6, 3\n    cmp r4, 0\n    beq _080A9516\n    movs r1, 0\n    adds r0, r3, r2\n    ldrb r0, [r0, 0x4]\n    cmp r1, r0\n    bcs _080A94F2\n    mov r6, r9\n    adds r5, r3, r6\n_080A94CA:\n    lsls r0, r1, 2\n    mov r6, sp\n    adds r2, r6, r0\n    ldrh r0, [r2]\n    cmp r0, 0\n    bne _080A94E6\n    mov r0, r8\n    strh r0, [r2]\n    cmp r4, r7\n    bls _080A9514\n    subs r0, r4, r7\n    lsls r0, 16\n    lsrs r4, r0, 16\n    strh r7, [r2, 0x2]\n_080A94E6:\n    adds r0, r1, 0x1\n    lsls r0, 24\n    lsrs r1, r0, 24\n    ldrb r2, [r5, 0x4]\n    cmp r1, r2\n    bcc _080A94CA\n_080A94F2:\n    cmp r4, 0\n    beq _080A9516\n    b _080A9510\n    .align 2, 0\n_080A94F8: .4byte gBagPockets\n_080A94FC: .4byte 0x000003e7\n_080A9500:\n    strh r0, [r3, 0x2]\n    ldr r0, _080A950C @ =gBagPockets\n    lsls r1, r6, 3\n    adds r1, r0\n    b _080A951A\n    .align 2, 0\n_080A950C: .4byte gBagPockets\n_080A9510:\n    movs r0, 0\n    b _080A9528\n_080A9514:\n    strh r4, [r2, 0x2]\n_080A9516:\n    mov r6, r9\n    adds r1, r3, r6\n_080A951A:\n    ldr r0, [r1]\n    ldrb r2, [r1, 0x4]\n    lsls r2, 2\n    mov r1, sp\n    bl memcpy\n    movs r0, 0x1\n_080A9528:\n    add sp, 0x100\n    pop {r3,r4}\n    mov r8, r3\n    mov r9, r4\n    pop {r4-r7}\n    pop {r1}\n    bx r1\n    .syntax divided\n");
# 364 "src/field/item.c"
}


bool8 RemoveBagItem(u16 itemId, u16 count)
{
    u8 i;
    u8 pocket;
    u16 totalQuantity = 0;

    if (ItemId_GetPocket(itemId) == 0 || itemId == 0)
        return 0;
    pocket = ItemId_GetPocket(itemId) - 1;

    for (i = 0; i < gBagPockets[pocket].capacity; i++)
    {
        if (gBagPockets[pocket].itemSlots[i].itemId == itemId)
            totalQuantity += gBagPockets[pocket].itemSlots[i].quantity;
    }
    if (totalQuantity < count)
        return 0;

    if (gBagPockets[pocket].capacity > gUnknown_02038560
     && gBagPockets[pocket].itemSlots[gUnknown_02038560].itemId == itemId)
    {
        if (gBagPockets[pocket].itemSlots[gUnknown_02038560].quantity >= count)
        {
            gBagPockets[pocket].itemSlots[gUnknown_02038560].quantity -= count;
            count = 0;
        }
        else
        {
            count -= gBagPockets[pocket].itemSlots[gUnknown_02038560].quantity;
            gBagPockets[pocket].itemSlots[gUnknown_02038560].quantity = 0;
        }
        if (gBagPockets[pocket].itemSlots[gUnknown_02038560].quantity == 0)
            gBagPockets[pocket].itemSlots[gUnknown_02038560].itemId = 0;
        if (count == 0)
            return 1;
    }

    for (i = 0; i < gBagPockets[pocket].capacity; i++)
    {
        if (gBagPockets[pocket].itemSlots[i].itemId == itemId)
        {
            if (gBagPockets[pocket].itemSlots[i].quantity >= count)
            {
                gBagPockets[pocket].itemSlots[i].quantity -= count;
                count = 0;
            }
            else
            {
                count -= gBagPockets[pocket].itemSlots[i].quantity;
                gBagPockets[pocket].itemSlots[i].quantity = 0;
            }
            if (gBagPockets[pocket].itemSlots[i].quantity == 0)
                gBagPockets[pocket].itemSlots[i].itemId = 0;
            if (count == 0)
                return 1;
        }
    }
    return 1;
}

u8 GetPocketByItemId(u16 itemId)
{
    return ItemId_GetPocket(itemId);
}

void ClearItemSlots(struct ItemSlot *itemSlots, u8 b)
{
    u16 i;

    for (i = 0; i < b; i++)
    {
        itemSlots[i].itemId = 0;
        itemSlots[i].quantity = 0;
    }
}

static s32 FindFreePCItemSlot(void)
{
    s8 i;

    for (i = 0; i < 50; i++)
    {
        if (gSaveBlock1.pcItems[i].itemId == 0)
            return i;
    }
    return -1;
}

u8 CountUsedPCItemSlots(void)
{
    u8 usedSlots = 0;
    u8 i;

    for (i = 0; i < 50; i++)
    {
        if (gSaveBlock1.pcItems[i].itemId != 0)
            usedSlots++;
    }
    return usedSlots;
}

bool8 CheckPCHasItem(u16 itemId, u16 count)
{
    u8 i;

    for (i = 0; i < 50; i++)
    {
        if (gSaveBlock1.pcItems[i].itemId == itemId && gSaveBlock1.pcItems[i].quantity >= count)
            return 1;
    }
    return 0;
}

bool8 AddPCItem(u16 itemId, u16 count)
{
    u8 i;
    s8 freeSlot;
    struct ItemSlot newItems[50];


    memcpy(newItems, gSaveBlock1.pcItems, sizeof(newItems));


    for (i = 0; i < 50; i++)
    {
        if (newItems[i].itemId == itemId)
        {
            if (newItems[i].quantity + count <= 999)
            {
                newItems[i].quantity += count;
                memcpy(gSaveBlock1.pcItems, newItems, sizeof(gSaveBlock1.pcItems));
                return 1;
            }
            count += newItems[i].quantity - 999;
            newItems[i].quantity = 999;
            if (count == 0)
            {
                memcpy(gSaveBlock1.pcItems, newItems, sizeof(gSaveBlock1.pcItems));
                return 1;
            }
        }
    }


    if (count > 0)
    {
        freeSlot = FindFreePCItemSlot();
        if (freeSlot == -1)
            return 0;
        newItems[freeSlot].itemId = itemId;
        newItems[freeSlot].quantity = count;
    }


    memcpy(gSaveBlock1.pcItems, newItems, sizeof(gSaveBlock1.pcItems));
    return 1;
}

void RemovePCItem(u8 index, u16 count)
{
    gSaveBlock1.pcItems[index].quantity -= count;
    if (gSaveBlock1.pcItems[index].quantity == 0)
    {
        gSaveBlock1.pcItems[index].itemId = 0;
        CompactPCItems();
    }
}

static void CompactPCItems(void)
{
    u16 i;
    u16 j;

    for (i = 0; i < 49; i++)
    {
        for (j = i + 1; j <= 49; j++)
        {
            if (gSaveBlock1.pcItems[i].itemId == 0)
            {
                struct ItemSlot temp = gSaveBlock1.pcItems[i];
                gSaveBlock1.pcItems[i] = gSaveBlock1.pcItems[j];
                gSaveBlock1.pcItems[j] = temp;
            }
        }
    }
}

void SwapRegisteredBike(void)
{
    switch (gSaveBlock1.registeredItem)
    {
    case 0x103:
        gSaveBlock1.registeredItem = 0x110;
        break;
    case 0x110:
        gSaveBlock1.registeredItem = 0x103;
        break;
    }
}

static u16 SanitizeItemId(u16 itemId)
{
    if (itemId > 0x15C)
        return 0;
    else
        return itemId;
}

const struct Item *ItemId_GetItem(u16 itemId)
{
    return &gItems[SanitizeItemId(itemId)];
}

u16 ItemId_GetId(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].itemId;
}

u16 ItemId_GetPrice(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].price;
}

u8 ItemId_GetHoldEffect(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].holdEffect;
}

u8 ItemId_GetHoldEffectParam(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].holdEffectParam;
}

const u8 *ItemId_GetDescription(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].description;
}

bool32 ItemId_CopyDescription(u8 *a, u32 itemId, u32 c)
{
    u32 r5 = c + 1;
    const u8 *description = gItems[SanitizeItemId(itemId)].description;
    u8 *str = a;

    for (;;)
    {
        if (*description == 0xFF || *description == 0xFE)
        {
            r5--;
            if (r5 == 0)
            {
                *str = 0xFF;
                return 1;
            }
            if (*description == 0xFF)
                return 0;
            str = a;
            description++;
        }
        else
            *(str++) = *(description++);
    }
}

u8 ItemId_GetImportance(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].importance;
}

u8 ItemId_GetUnknownValue(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].unk19;
}

u8 ItemId_GetPocket(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].pocket;
}

u8 ItemId_GetType(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].type;
}

ItemUseFunc ItemId_GetFieldFunc(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].fieldUseFunc;
}

u8 ItemId_GetBattleUsage(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].battleUsage;
}

ItemUseFunc ItemId_GetBattleFunc(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].battleUseFunc;
}

u8 ItemId_GetSecondaryId(u16 itemId)
{
    return gItems[SanitizeItemId(itemId)].secondaryId;
}
