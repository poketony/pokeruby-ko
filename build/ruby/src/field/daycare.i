# 1 "src/field/daycare.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/daycare.c"
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
# 2 "src/field/daycare.c" 2
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
# 3 "src/field/daycare.c" 2
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
# 4 "src/field/daycare.c" 2
# 1 "include/field_effect.h" 1




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
# 6 "include/field_effect.h" 2

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
# 5 "src/field/daycare.c" 2
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
# 6 "src/field/daycare.c" 2
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
# 7 "src/field/daycare.c" 2
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
# 8 "src/field/daycare.c" 2
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
# 9 "src/field/daycare.c" 2
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
# 10 "src/field/daycare.c" 2
# 1 "include/name_string_util.h" 1



void PadNameString(u8 *a1, u8 a2);
void SanitizeNameString(u8 *a1);
# 11 "src/field/daycare.c" 2
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
# 12 "src/field/daycare.c" 2
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
# 13 "src/field/daycare.c" 2
# 1 "include/pokemon.h" 1
# 14 "src/field/daycare.c" 2
# 1 "include/pokemon_storage_system.h" 1



void ResetPokemonStorageSystem(void);
void BoxMonRestorePP(struct BoxPokemon *);
void party_compaction(void);
# 15 "src/field/daycare.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 16 "src/field/daycare.c" 2
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
# 17 "src/field/daycare.c" 2
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
# 18 "src/field/daycare.c" 2
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
# 19 "src/field/daycare.c" 2
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
# 20 "src/field/daycare.c" 2
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
# 21 "src/field/daycare.c" 2
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
# 22 "src/field/daycare.c" 2
# 1 "include/text.h" 1
# 23 "src/field/daycare.c" 2
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
# 24 "src/field/daycare.c" 2


__attribute__((section("iwram_data"))) u16 gHatchedEggLevelUpMoves[52];
__attribute__((section("iwram_data"))) u16 gHatchedEggFatherMoves[4];
__attribute__((section("iwram_data"))) u16 gHatchedEggFinalMoves[4];
__attribute__((section("iwram_data"))) u16 gHatchedEggEggMoves[12];
__attribute__((section("iwram_data"))) u16 gHatchedEggMotherMoves[4];

extern u16 gMoveToLearn;

static void ClearDaycareMail(struct DayCareMail *);
static void SetInitialEggData(struct Pokemon *, u16, struct DayCare *);
static u8 GetDaycareCompatibilityScore(struct DayCare *);

# 1 "src/field/../data/pokemon/egg_moves.h" 1
# 13 "src/field/../data/pokemon/egg_moves.h"
const u16 gEggMoves[] = {
    (SPECIES_BULBASAUR + 20000), MOVE_LIGHT_SCREEN, MOVE_SKULL_BASH, MOVE_SAFEGUARD, MOVE_CHARM, MOVE_PETAL_DANCE, MOVE_MAGICAL_LEAF, MOVE_GRASS_WHISTLE, MOVE_CURSE







                         ,

    (SPECIES_CHARMANDER + 20000), MOVE_BELLY_DRUM, MOVE_ANCIENT_POWER, MOVE_ROCK_SLIDE, MOVE_BITE, MOVE_OUTRAGE, MOVE_BEAT_UP, MOVE_SWORDS_DANCE, MOVE_DRAGON_DANCE







                                ,

    (SPECIES_SQUIRTLE + 20000), MOVE_MIRROR_COAT, MOVE_HAZE, MOVE_MIST, MOVE_FORESIGHT, MOVE_FLAIL, MOVE_REFRESH, MOVE_MUD_SPORT, MOVE_YAWN







                        ,

    (SPECIES_PIDGEY + 20000), MOVE_PURSUIT, MOVE_FAINT_ATTACK, MOVE_FORESIGHT, MOVE_STEEL_WING, MOVE_AIR_CUTTER




                              ,

    (SPECIES_RATTATA + 20000), MOVE_SCREECH, MOVE_FLAME_WHEEL, MOVE_FURY_SWIPES, MOVE_BITE, MOVE_COUNTER, MOVE_REVERSAL, MOVE_UPROAR, MOVE_SWAGGER







                           ,

    (SPECIES_SPEAROW + 20000), MOVE_FAINT_ATTACK, MOVE_FALSE_SWIPE, MOVE_SCARY_FACE, MOVE_QUICK_ATTACK, MOVE_TRI_ATTACK, MOVE_ASTONISH, MOVE_SKY_ATTACK






                              ,

    (SPECIES_EKANS + 20000), MOVE_PURSUIT, MOVE_SLAM, MOVE_SPITE, MOVE_BEAT_UP, MOVE_POISON_FANG




                               ,

    (SPECIES_SANDSHREW + 20000), MOVE_FLAIL, MOVE_SAFEGUARD, MOVE_COUNTER, MOVE_RAPID_SPIN, MOVE_ROCK_SLIDE, MOVE_METAL_CLAW, MOVE_SWORDS_DANCE, MOVE_CRUSH_CLAW







                              ,

    (SPECIES_NIDORAN_F + 20000), MOVE_SUPERSONIC, MOVE_DISABLE, MOVE_TAKE_DOWN, MOVE_FOCUS_ENERGY, MOVE_CHARM, MOVE_COUNTER, MOVE_BEAT_UP






                           ,

    (SPECIES_NIDORAN_M + 20000), MOVE_COUNTER, MOVE_DISABLE, MOVE_SUPERSONIC, MOVE_TAKE_DOWN, MOVE_AMNESIA, MOVE_CONFUSION, MOVE_BEAT_UP






                           ,

    (SPECIES_VULPIX + 20000), MOVE_FAINT_ATTACK, MOVE_HYPNOSIS, MOVE_FLAIL, MOVE_SPITE, MOVE_DISABLE, MOVE_HOWL, MOVE_PSYCH_UP, MOVE_HEAT_WAVE







                             ,

    (SPECIES_ZUBAT + 20000), MOVE_QUICK_ATTACK, MOVE_PURSUIT, MOVE_FAINT_ATTACK, MOVE_GUST, MOVE_WHIRLWIND, MOVE_CURSE





                         ,

    (SPECIES_ODDISH + 20000), MOVE_SWORDS_DANCE, MOVE_RAZOR_LEAF, MOVE_FLAIL, MOVE_SYNTHESIS, MOVE_CHARM, MOVE_INGRAIN





                           ,

    (SPECIES_PARAS + 20000), MOVE_FALSE_SWIPE, MOVE_SCREECH, MOVE_COUNTER, MOVE_PSYBEAM, MOVE_FLAIL, MOVE_SWEET_SCENT, MOVE_LIGHT_SCREEN, MOVE_PURSUIT







                           ,

    (SPECIES_VENONAT + 20000), MOVE_BATON_PASS, MOVE_SCREECH, MOVE_GIGA_DRAIN, MOVE_SIGNAL_BEAM



                               ,

    (SPECIES_DIGLETT + 20000), MOVE_FAINT_ATTACK, MOVE_SCREECH, MOVE_ANCIENT_POWER, MOVE_PURSUIT, MOVE_BEAT_UP, MOVE_UPROAR, MOVE_ROCK_SLIDE






                              ,

    (SPECIES_MEOWTH + 20000), MOVE_SPITE, MOVE_CHARM, MOVE_HYPNOSIS, MOVE_AMNESIA, MOVE_PSYCH_UP, MOVE_ASSIST





                          ,

    (SPECIES_PSYDUCK + 20000), MOVE_HYPNOSIS, MOVE_PSYBEAM, MOVE_FORESIGHT, MOVE_LIGHT_SCREEN, MOVE_FUTURE_SIGHT, MOVE_PSYCHIC, MOVE_CROSS_CHOP, MOVE_REFRESH







                           ,

    (SPECIES_MANKEY + 20000), MOVE_ROCK_SLIDE, MOVE_FORESIGHT, MOVE_MEDITATE, MOVE_COUNTER, MOVE_REVERSAL, MOVE_BEAT_UP, MOVE_REVENGE, MOVE_SMELLING_SALT







                                 ,

    (SPECIES_GROWLITHE + 20000), MOVE_BODY_SLAM, MOVE_SAFEGUARD, MOVE_CRUNCH, MOVE_THRASH, MOVE_FIRE_SPIN, MOVE_HOWL, MOVE_HEAT_WAVE






                             ,

    (SPECIES_POLIWAG + 20000), MOVE_MIST, MOVE_SPLASH, MOVE_BUBBLE_BEAM, MOVE_HAZE, MOVE_MIND_READER, MOVE_WATER_SPORT, MOVE_ICE_BALL






                            ,

    (SPECIES_ABRA + 20000), MOVE_ENCORE, MOVE_BARRIER, MOVE_KNOCK_OFF, MOVE_FIRE_PUNCH, MOVE_THUNDER_PUNCH, MOVE_ICE_PUNCH





                             ,

    (SPECIES_MACHOP + 20000), MOVE_LIGHT_SCREEN, MOVE_MEDITATE, MOVE_ROLLING_KICK, MOVE_ENCORE, MOVE_SMELLING_SALT, MOVE_COUNTER, MOVE_ROCK_SLIDE






                              ,

    (SPECIES_BELLSPROUT + 20000), MOVE_SWORDS_DANCE, MOVE_ENCORE, MOVE_REFLECT, MOVE_SYNTHESIS, MOVE_LEECH_LIFE, MOVE_INGRAIN, MOVE_MAGICAL_LEAF






                                ,

    (SPECIES_TENTACOOL + 20000), MOVE_AURORA_BEAM, MOVE_MIRROR_COAT, MOVE_RAPID_SPIN, MOVE_HAZE, MOVE_SAFEGUARD, MOVE_CONFUSE_RAY





                               ,

    (SPECIES_GEODUDE + 20000), MOVE_MEGA_PUNCH, MOVE_ROCK_SLIDE, MOVE_BLOCK


                         ,

    (SPECIES_PONYTA + 20000), MOVE_FLAME_WHEEL, MOVE_THRASH, MOVE_DOUBLE_KICK, MOVE_HYPNOSIS, MOVE_CHARM, MOVE_DOUBLE_EDGE





                               ,

    (SPECIES_SLOWPOKE + 20000), MOVE_SAFEGUARD, MOVE_BELLY_DRUM, MOVE_FUTURE_SIGHT, MOVE_STOMP, MOVE_MUD_SPORT, MOVE_SLEEP_TALK, MOVE_SNORE






                         ,

    (SPECIES_FARFETCHD + 20000), MOVE_STEEL_WING, MOVE_FORESIGHT, MOVE_MIRROR_MOVE, MOVE_GUST, MOVE_QUICK_ATTACK, MOVE_FLAIL, MOVE_FEATHER_DANCE, MOVE_CURSE







                         ,

    (SPECIES_DODUO + 20000), MOVE_QUICK_ATTACK, MOVE_SUPERSONIC, MOVE_HAZE, MOVE_FAINT_ATTACK, MOVE_FLAIL, MOVE_ENDEAVOR





                            ,

    (SPECIES_SEEL + 20000), MOVE_LICK, MOVE_PERISH_SONG, MOVE_DISABLE, MOVE_HORN_DRILL, MOVE_SLAM, MOVE_ENCORE, MOVE_FAKE_OUT, MOVE_ICICLE_SPEAR







                                ,

    (SPECIES_GRIMER + 20000), MOVE_HAZE, MOVE_MEAN_LOOK, MOVE_LICK, MOVE_IMPRISON, MOVE_CURSE, MOVE_SHADOW_PUNCH, MOVE_EXPLOSION






                             ,

    (SPECIES_SHELLDER + 20000), MOVE_BUBBLE_BEAM, MOVE_TAKE_DOWN, MOVE_BARRIER, MOVE_RAPID_SPIN, MOVE_SCREECH, MOVE_ICICLE_SPEAR





                                ,

    (SPECIES_GASTLY + 20000), MOVE_PSYWAVE, MOVE_PERISH_SONG, MOVE_HAZE, MOVE_ASTONISH, MOVE_WILL_O_WISP, MOVE_GRUDGE, MOVE_EXPLOSION






                             ,

    (SPECIES_ONIX + 20000), MOVE_ROCK_SLIDE, MOVE_FLAIL, MOVE_EXPLOSION, MOVE_BLOCK



                         ,

    (SPECIES_DROWZEE + 20000), MOVE_BARRIER, MOVE_ASSIST, MOVE_ROLE_PLAY, MOVE_FIRE_PUNCH, MOVE_THUNDER_PUNCH, MOVE_ICE_PUNCH





                             ,

    (SPECIES_KRABBY + 20000), MOVE_DIG, MOVE_HAZE, MOVE_AMNESIA, MOVE_FLAIL, MOVE_SLAM, MOVE_KNOCK_OFF, MOVE_SWORDS_DANCE






                                ,

    (SPECIES_EXEGGCUTE + 20000), MOVE_SYNTHESIS, MOVE_MOONLIGHT, MOVE_REFLECT, MOVE_ANCIENT_POWER, MOVE_PSYCH_UP, MOVE_INGRAIN, MOVE_CURSE






                         ,

    (SPECIES_CUBONE + 20000), MOVE_ROCK_SLIDE, MOVE_ANCIENT_POWER, MOVE_BELLY_DRUM, MOVE_SCREECH, MOVE_SKULL_BASH, MOVE_PERISH_SONG, MOVE_SWORDS_DANCE






                                ,

    (SPECIES_LICKITUNG + 20000), MOVE_BELLY_DRUM, MOVE_MAGNITUDE, MOVE_BODY_SLAM, MOVE_CURSE, MOVE_SMELLING_SALT, MOVE_SLEEP_TALK, MOVE_SNORE, MOVE_SUBSTITUTE







                              ,

    (SPECIES_KOFFING + 20000), MOVE_SCREECH, MOVE_PSYWAVE, MOVE_PSYBEAM, MOVE_DESTINY_BOND, MOVE_PAIN_SPLIT, MOVE_WILL_O_WISP





                               ,

    (SPECIES_RHYHORN + 20000), MOVE_CRUNCH, MOVE_REVERSAL, MOVE_ROCK_SLIDE, MOVE_COUNTER, MOVE_MAGNITUDE, MOVE_SWORDS_DANCE, MOVE_CURSE, MOVE_CRUSH_CLAW







                              ,

    (SPECIES_CHANSEY + 20000), MOVE_PRESENT, MOVE_METRONOME, MOVE_HEAL_BELL, MOVE_AROMATHERAPY, MOVE_SUBSTITUTE




                              ,

    (SPECIES_TANGELA + 20000), MOVE_FLAIL, MOVE_CONFUSION, MOVE_MEGA_DRAIN, MOVE_REFLECT, MOVE_AMNESIA, MOVE_LEECH_SEED, MOVE_NATURE_POWER






                                ,

    (SPECIES_KANGASKHAN + 20000), MOVE_STOMP, MOVE_FORESIGHT, MOVE_FOCUS_ENERGY, MOVE_SAFEGUARD, MOVE_DISABLE, MOVE_COUNTER, MOVE_CRUSH_CLAW, MOVE_SUBSTITUTE







                              ,

    (SPECIES_HORSEA + 20000), MOVE_FLAIL, MOVE_AURORA_BEAM, MOVE_OCTAZOOKA, MOVE_DISABLE, MOVE_SPLASH, MOVE_DRAGON_RAGE, MOVE_DRAGON_BREATH






                                 ,

    (SPECIES_GOLDEEN + 20000), MOVE_PSYBEAM, MOVE_HAZE, MOVE_HYDRO_PUMP, MOVE_SLEEP_TALK, MOVE_MUD_SPORT




                             ,

    (SPECIES_MR_MIME + 20000), MOVE_FUTURE_SIGHT, MOVE_HYPNOSIS, MOVE_MIMIC, MOVE_PSYCH_UP, MOVE_FAKE_OUT, MOVE_TRICK





                         ,

    (SPECIES_SCYTHER + 20000), MOVE_COUNTER, MOVE_SAFEGUARD, MOVE_BATON_PASS, MOVE_RAZOR_WIND, MOVE_REVERSAL, MOVE_LIGHT_SCREEN, MOVE_ENDURE, MOVE_SILVER_WIND







                               ,

    (SPECIES_PINSIR + 20000), MOVE_FURY_ATTACK, MOVE_FLAIL, MOVE_FALSE_SWIPE, MOVE_FAINT_ATTACK



                                ,

    (SPECIES_LAPRAS + 20000), MOVE_FORESIGHT, MOVE_SUBSTITUTE, MOVE_TICKLE, MOVE_REFRESH, MOVE_DRAGON_DANCE, MOVE_CURSE, MOVE_SLEEP_TALK, MOVE_HORN_DRILL







                              ,

    (SPECIES_EEVEE + 20000), MOVE_CHARM, MOVE_FLAIL, MOVE_ENDURE, MOVE_CURSE, MOVE_TICKLE, MOVE_WISH





                        ,

    (SPECIES_OMANYTE + 20000), MOVE_BUBBLE_BEAM, MOVE_AURORA_BEAM, MOVE_SLAM, MOVE_SUPERSONIC, MOVE_HAZE, MOVE_ROCK_SLIDE, MOVE_SPIKES






                          ,

    (SPECIES_KABUTO + 20000), MOVE_BUBBLE_BEAM, MOVE_AURORA_BEAM, MOVE_RAPID_SPIN, MOVE_DIG, MOVE_FLAIL, MOVE_KNOCK_OFF, MOVE_CONFUSE_RAY






                               ,

    (SPECIES_AERODACTYL + 20000), MOVE_WHIRLWIND, MOVE_PURSUIT, MOVE_FORESIGHT, MOVE_STEEL_WING, MOVE_DRAGON_BREATH, MOVE_CURSE





                         ,

    (SPECIES_SNORLAX + 20000), MOVE_LICK, MOVE_CHARM, MOVE_DOUBLE_EDGE, MOVE_CURSE, MOVE_FISSURE, MOVE_SUBSTITUTE





                              ,

    (SPECIES_DRATINI + 20000), MOVE_LIGHT_SCREEN, MOVE_MIST, MOVE_HAZE, MOVE_SUPERSONIC, MOVE_DRAGON_BREATH, MOVE_DRAGON_DANCE





                                ,

    (SPECIES_CHIKORITA + 20000), MOVE_VINE_WHIP, MOVE_LEECH_SEED, MOVE_COUNTER, MOVE_ANCIENT_POWER, MOVE_FLAIL, MOVE_NATURE_POWER, MOVE_INGRAIN, MOVE_GRASS_WHISTLE







                                 ,

    (SPECIES_CYNDAQUIL + 20000), MOVE_FURY_SWIPES, MOVE_QUICK_ATTACK, MOVE_REVERSAL, MOVE_THRASH, MOVE_FORESIGHT, MOVE_COVET, MOVE_HOWL, MOVE_CRUSH_CLAW







                              ,

    (SPECIES_TOTODILE + 20000), MOVE_CRUNCH, MOVE_THRASH, MOVE_HYDRO_PUMP, MOVE_ANCIENT_POWER, MOVE_ROCK_SLIDE, MOVE_MUD_SPORT, MOVE_WATER_SPORT, MOVE_DRAGON_CLAW







                               ,

    (SPECIES_SENTRET + 20000), MOVE_DOUBLE_EDGE, MOVE_PURSUIT, MOVE_SLASH, MOVE_FOCUS_ENERGY, MOVE_REVERSAL, MOVE_SUBSTITUTE, MOVE_TRICK, MOVE_ASSIST







                          ,

    (SPECIES_HOOTHOOT + 20000), MOVE_MIRROR_MOVE, MOVE_SUPERSONIC, MOVE_FAINT_ATTACK, MOVE_WING_ATTACK, MOVE_WHIRLWIND, MOVE_SKY_ATTACK, MOVE_FEATHER_DANCE






                                 ,

    (SPECIES_LEDYBA + 20000), MOVE_PSYBEAM, MOVE_BIDE, MOVE_SILVER_WIND


                               ,

    (SPECIES_SPINARAK + 20000), MOVE_PSYBEAM, MOVE_DISABLE, MOVE_SONIC_BOOM, MOVE_BATON_PASS, MOVE_PURSUIT, MOVE_SIGNAL_BEAM





                               ,

    (SPECIES_CHINCHOU + 20000), MOVE_FLAIL, MOVE_SCREECH, MOVE_AMNESIA


                           ,

    (SPECIES_PICHU + 20000), MOVE_REVERSAL, MOVE_BIDE, MOVE_PRESENT, MOVE_ENCORE, MOVE_DOUBLE_SLAP, MOVE_WISH, MOVE_CHARGE






                          ,

    (SPECIES_CLEFFA + 20000), MOVE_PRESENT, MOVE_METRONOME, MOVE_AMNESIA, MOVE_BELLY_DRUM, MOVE_SPLASH, MOVE_MIMIC, MOVE_WISH, MOVE_SUBSTITUTE







                              ,

    (SPECIES_IGGLYBUFF + 20000), MOVE_PERISH_SONG, MOVE_PRESENT, MOVE_FAINT_ATTACK, MOVE_WISH, MOVE_FAKE_TEARS




                              ,

    (SPECIES_TOGEPI + 20000), MOVE_PRESENT, MOVE_MIRROR_MOVE, MOVE_PECK, MOVE_FORESIGHT, MOVE_FUTURE_SIGHT, MOVE_SUBSTITUTE, MOVE_PSYCH_UP






                            ,

    (SPECIES_NATU + 20000), MOVE_HAZE, MOVE_DRILL_PECK, MOVE_QUICK_ATTACK, MOVE_FAINT_ATTACK, MOVE_STEEL_WING, MOVE_PSYCH_UP, MOVE_FEATHER_DANCE, MOVE_REFRESH







                           ,

    (SPECIES_MAREEP + 20000), MOVE_TAKE_DOWN, MOVE_BODY_SLAM, MOVE_SAFEGUARD, MOVE_SCREECH, MOVE_REFLECT, MOVE_ODOR_SLEUTH, MOVE_CHARGE






                          ,

    (SPECIES_MARILL + 20000), MOVE_LIGHT_SCREEN, MOVE_PRESENT, MOVE_AMNESIA, MOVE_FUTURE_SIGHT, MOVE_BELLY_DRUM, MOVE_PERISH_SONG, MOVE_SUPERSONIC, MOVE_SUBSTITUTE







                              ,

    (SPECIES_SUDOWOODO + 20000), MOVE_SELF_DESTRUCT
                                 ,

    (SPECIES_HOPPIP + 20000), MOVE_CONFUSION, MOVE_ENCORE, MOVE_DOUBLE_EDGE, MOVE_REFLECT, MOVE_AMNESIA, MOVE_HELPING_HAND, MOVE_PSYCH_UP






                            ,

    (SPECIES_AIPOM + 20000), MOVE_COUNTER, MOVE_SCREECH, MOVE_PURSUIT, MOVE_AGILITY, MOVE_SPITE, MOVE_SLAM, MOVE_DOUBLE_SLAP, MOVE_BEAT_UP







                           ,

    (SPECIES_SUNKERN + 20000), MOVE_GRASS_WHISTLE, MOVE_ENCORE, MOVE_LEECH_SEED, MOVE_NATURE_POWER, MOVE_CURSE, MOVE_HELPING_HAND





                                ,

    (SPECIES_YANMA + 20000), MOVE_WHIRLWIND, MOVE_REVERSAL, MOVE_LEECH_LIFE, MOVE_SIGNAL_BEAM, MOVE_SILVER_WIND




                               ,

    (SPECIES_WOOPER + 20000), MOVE_BODY_SLAM, MOVE_ANCIENT_POWER, MOVE_SAFEGUARD, MOVE_CURSE, MOVE_MUD_SPORT, MOVE_STOCKPILE, MOVE_SWALLOW, MOVE_SPIT_UP







                           ,

    (SPECIES_MURKROW + 20000), MOVE_WHIRLWIND, MOVE_DRILL_PECK, MOVE_MIRROR_MOVE, MOVE_WING_ATTACK, MOVE_SKY_ATTACK, MOVE_CONFUSE_RAY, MOVE_FEATHER_DANCE, MOVE_PERISH_SONG







                               ,

    (SPECIES_MISDREAVUS + 20000), MOVE_SCREECH, MOVE_DESTINY_BOND, MOVE_PSYCH_UP, MOVE_IMPRISON



                            ,

    (SPECIES_GIRAFARIG + 20000), MOVE_TAKE_DOWN, MOVE_AMNESIA, MOVE_FORESIGHT, MOVE_FUTURE_SIGHT, MOVE_BEAT_UP, MOVE_PSYCH_UP, MOVE_WISH, MOVE_MAGIC_COAT







                              ,

    (SPECIES_PINECO + 20000), MOVE_REFLECT, MOVE_PIN_MISSILE, MOVE_FLAIL, MOVE_SWIFT, MOVE_COUNTER, MOVE_SAND_TOMB





                             ,

    (SPECIES_DUNSPARCE + 20000), MOVE_BIDE, MOVE_ANCIENT_POWER, MOVE_ROCK_SLIDE, MOVE_BITE, MOVE_HEADBUTT, MOVE_ASTONISH, MOVE_CURSE






                         ,

    (SPECIES_GLIGAR + 20000), MOVE_METAL_CLAW, MOVE_WING_ATTACK, MOVE_RAZOR_WIND, MOVE_COUNTER, MOVE_SAND_TOMB




                             ,

    (SPECIES_SNUBBULL + 20000), MOVE_METRONOME, MOVE_FAINT_ATTACK, MOVE_REFLECT, MOVE_PRESENT, MOVE_CRUNCH, MOVE_HEAL_BELL, MOVE_SNORE, MOVE_SMELLING_SALT







                                 ,

    (SPECIES_QWILFISH + 20000), MOVE_FLAIL, MOVE_HAZE, MOVE_BUBBLE_BEAM, MOVE_SUPERSONIC, MOVE_ASTONISH




                            ,

    (SPECIES_SHUCKLE + 20000), MOVE_SWEET_SCENT
                               ,

    (SPECIES_HERACROSS + 20000), MOVE_HARDEN, MOVE_BIDE, MOVE_FLAIL, MOVE_FALSE_SWIPE



                               ,

    (SPECIES_SNEASEL + 20000), MOVE_COUNTER, MOVE_SPITE, MOVE_FORESIGHT, MOVE_REFLECT, MOVE_BITE, MOVE_CRUSH_CLAW, MOVE_FAKE_OUT






                            ,

    (SPECIES_TEDDIURSA + 20000), MOVE_CRUNCH, MOVE_TAKE_DOWN, MOVE_SEISMIC_TOSS, MOVE_COUNTER, MOVE_METAL_CLAW, MOVE_FAKE_TEARS, MOVE_YAWN, MOVE_SLEEP_TALK







                              ,

    (SPECIES_SLUGMA + 20000), MOVE_ACID_ARMOR, MOVE_HEAT_WAVE

                             ,

    (SPECIES_SWINUB + 20000), MOVE_TAKE_DOWN, MOVE_BITE, MOVE_BODY_SLAM, MOVE_ROCK_SLIDE, MOVE_ANCIENT_POWER, MOVE_MUD_SHOT, MOVE_ICICLE_SPEAR, MOVE_DOUBLE_EDGE







                               ,

    (SPECIES_CORSOLA + 20000), MOVE_ROCK_SLIDE, MOVE_SCREECH, MOVE_MIST, MOVE_AMNESIA, MOVE_BARRIER, MOVE_INGRAIN, MOVE_CONFUSE_RAY, MOVE_ICICLE_SPEAR







                                ,

    (SPECIES_REMORAID + 20000), MOVE_AURORA_BEAM, MOVE_OCTAZOOKA, MOVE_SUPERSONIC, MOVE_HAZE, MOVE_SCREECH, MOVE_THUNDER_WAVE, MOVE_ROCK_BLAST






                              ,

    (SPECIES_DELIBIRD + 20000), MOVE_AURORA_BEAM, MOVE_QUICK_ATTACK, MOVE_FUTURE_SIGHT, MOVE_SPLASH, MOVE_RAPID_SPIN, MOVE_ICE_BALL





                            ,

    (SPECIES_MANTINE + 20000), MOVE_TWISTER, MOVE_HYDRO_PUMP, MOVE_HAZE, MOVE_SLAM, MOVE_MUD_SPORT, MOVE_ROCK_SLIDE





                              ,

    (SPECIES_SKARMORY + 20000), MOVE_DRILL_PECK, MOVE_PURSUIT, MOVE_WHIRLWIND, MOVE_SKY_ATTACK, MOVE_CURSE




                         ,

    (SPECIES_HOUNDOUR + 20000), MOVE_FIRE_SPIN, MOVE_RAGE, MOVE_PURSUIT, MOVE_COUNTER, MOVE_SPITE, MOVE_REVERSAL, MOVE_BEAT_UP, MOVE_WILL_O_WISP







                               ,

    (SPECIES_PHANPY + 20000), MOVE_FOCUS_ENERGY, MOVE_BODY_SLAM, MOVE_ANCIENT_POWER, MOVE_SNORE, MOVE_COUNTER, MOVE_FISSURE





                           ,

    (SPECIES_STANTLER + 20000), MOVE_SPITE, MOVE_DISABLE, MOVE_BITE, MOVE_SWAGGER, MOVE_PSYCH_UP, MOVE_EXTRASENSORY





                                ,

    (SPECIES_TYROGUE + 20000), MOVE_RAPID_SPIN, MOVE_HI_JUMP_KICK, MOVE_MACH_PUNCH, MOVE_MIND_READER, MOVE_HELPING_HAND




                                ,

    (SPECIES_SMOOCHUM + 20000), MOVE_MEDITATE, MOVE_PSYCH_UP, MOVE_FAKE_OUT, MOVE_WISH, MOVE_ICE_PUNCH




                             ,

    (SPECIES_ELEKID + 20000), MOVE_KARATE_CHOP, MOVE_BARRIER, MOVE_ROLLING_KICK, MOVE_MEDITATE, MOVE_CROSS_CHOP, MOVE_FIRE_PUNCH, MOVE_ICE_PUNCH






                             ,

    (SPECIES_MAGBY + 20000), MOVE_KARATE_CHOP, MOVE_MEGA_PUNCH, MOVE_BARRIER, MOVE_SCREECH, MOVE_CROSS_CHOP, MOVE_THUNDER_PUNCH





                                 ,

    (SPECIES_MILTANK + 20000), MOVE_PRESENT, MOVE_REVERSAL, MOVE_SEISMIC_TOSS, MOVE_ENDURE, MOVE_PSYCH_UP, MOVE_CURSE, MOVE_HELPING_HAND, MOVE_SLEEP_TALK







                              ,

    (SPECIES_LARVITAR + 20000), MOVE_PURSUIT, MOVE_STOMP, MOVE_OUTRAGE, MOVE_FOCUS_ENERGY, MOVE_ANCIENT_POWER, MOVE_DRAGON_DANCE, MOVE_CURSE






                         ,

    (SPECIES_TREECKO + 20000), MOVE_CRUNCH, MOVE_MUD_SPORT, MOVE_ENDEAVOR, MOVE_LEECH_SEED, MOVE_DRAGON_BREATH, MOVE_CRUSH_CLAW





                              ,

    (SPECIES_TORCHIC + 20000), MOVE_COUNTER, MOVE_REVERSAL, MOVE_ENDURE, MOVE_SWAGGER, MOVE_ROCK_SLIDE, MOVE_SMELLING_SALT





                                 ,

    (SPECIES_MUDKIP + 20000), MOVE_REFRESH, MOVE_UPROAR, MOVE_CURSE, MOVE_STOMP, MOVE_ICE_BALL, MOVE_MIRROR_COAT





                               ,

    (SPECIES_POOCHYENA + 20000), MOVE_ASTONISH, MOVE_POISON_FANG, MOVE_COVET, MOVE_LEER, MOVE_YAWN




                        ,

    (SPECIES_ZIGZAGOON + 20000), MOVE_CHARM, MOVE_PURSUIT, MOVE_SUBSTITUTE, MOVE_TICKLE, MOVE_TRICK




                         ,

    (SPECIES_LOTAD + 20000), MOVE_SYNTHESIS, MOVE_RAZOR_LEAF, MOVE_SWEET_SCENT, MOVE_LEECH_SEED, MOVE_FLAIL, MOVE_WATER_GUN





                             ,

    (SPECIES_SEEDOT + 20000), MOVE_LEECH_SEED, MOVE_AMNESIA, MOVE_QUICK_ATTACK, MOVE_RAZOR_WIND, MOVE_TAKE_DOWN, MOVE_FALSE_SWIPE





                               ,

    (SPECIES_NINCADA + 20000), MOVE_ENDURE, MOVE_FAINT_ATTACK, MOVE_GUST, MOVE_SILVER_WIND



                               ,

    (SPECIES_TAILLOW + 20000), MOVE_PURSUIT, MOVE_SUPERSONIC, MOVE_REFRESH, MOVE_MIRROR_MOVE, MOVE_RAGE, MOVE_SKY_ATTACK





                              ,

    (SPECIES_SHROOMISH + 20000), MOVE_FAKE_TEARS, MOVE_SWAGGER, MOVE_CHARM, MOVE_FALSE_SWIPE, MOVE_HELPING_HAND




                                ,

    (SPECIES_SPINDA + 20000), MOVE_ENCORE, MOVE_ROCK_SLIDE, MOVE_ASSIST, MOVE_DISABLE, MOVE_BATON_PASS, MOVE_WISH, MOVE_TRICK, MOVE_SMELLING_SALT







                                 ,

    (SPECIES_WINGULL + 20000), MOVE_MIST, MOVE_TWISTER, MOVE_AGILITY, MOVE_GUST, MOVE_WATER_SPORT




                               ,

    (SPECIES_SURSKIT + 20000), MOVE_FORESIGHT, MOVE_MUD_SHOT, MOVE_PSYBEAM, MOVE_HYDRO_PUMP, MOVE_MIND_READER




                               ,

    (SPECIES_WAILMER + 20000), MOVE_DOUBLE_EDGE, MOVE_THRASH, MOVE_SWAGGER, MOVE_SNORE, MOVE_SLEEP_TALK, MOVE_CURSE, MOVE_FISSURE, MOVE_TICKLE







                          ,

    (SPECIES_SKITTY + 20000), MOVE_HELPING_HAND, MOVE_PSYCH_UP, MOVE_UPROAR, MOVE_FAKE_TEARS, MOVE_WISH, MOVE_BATON_PASS, MOVE_SUBSTITUTE, MOVE_TICKLE







                          ,

    (SPECIES_KECLEON + 20000), MOVE_DISABLE, MOVE_MAGIC_COAT, MOVE_TRICK


                         ,

    (SPECIES_NOSEPASS + 20000), MOVE_MAGNITUDE, MOVE_ROLLOUT, MOVE_EXPLOSION


                             ,

    (SPECIES_TORKOAL + 20000), MOVE_ERUPTION, MOVE_ENDURE, MOVE_SLEEP_TALK, MOVE_YAWN



                        ,

    (SPECIES_SABLEYE + 20000), MOVE_PSYCH_UP, MOVE_RECOVER, MOVE_MOONLIGHT


                             ,

    (SPECIES_BARBOACH + 20000), MOVE_THRASH, MOVE_WHIRLPOOL, MOVE_SPARK


                         ,

    (SPECIES_LUVDISC + 20000), MOVE_SPLASH, MOVE_SUPERSONIC, MOVE_WATER_SPORT, MOVE_MUD_SPORT



                             ,

    (SPECIES_CORPHISH + 20000), MOVE_MUD_SPORT, MOVE_ENDEAVOR, MOVE_BODY_SLAM, MOVE_ANCIENT_POWER



                                 ,

    (SPECIES_FEEBAS + 20000), MOVE_MIRROR_COAT, MOVE_DRAGON_BREATH, MOVE_MUD_SPORT, MOVE_HYPNOSIS, MOVE_LIGHT_SCREEN, MOVE_CONFUSE_RAY





                               ,

    (SPECIES_CARVANHA + 20000), MOVE_HYDRO_PUMP, MOVE_DOUBLE_EDGE, MOVE_THRASH


                          ,

    (SPECIES_TRAPINCH + 20000), MOVE_FOCUS_ENERGY, MOVE_QUICK_ATTACK, MOVE_GUST


                        ,

    (SPECIES_MAKUHITA + 20000), MOVE_FAINT_ATTACK, MOVE_DETECT, MOVE_FORESIGHT, MOVE_HELPING_HAND, MOVE_CROSS_CHOP, MOVE_REVENGE, MOVE_DYNAMIC_PUNCH, MOVE_COUNTER







                           ,

    (SPECIES_ELECTRIKE + 20000), MOVE_CRUNCH, MOVE_HEADBUTT, MOVE_UPROAR, MOVE_CURSE, MOVE_SWIFT




                         ,

    (SPECIES_NUMEL + 20000), MOVE_HOWL, MOVE_SCARY_FACE, MOVE_BODY_SLAM, MOVE_ROLLOUT, MOVE_DEFENSE_CURL, MOVE_STOMP





                         ,

    (SPECIES_SPHEAL + 20000), MOVE_WATER_SPORT, MOVE_STOCKPILE, MOVE_SWALLOW, MOVE_SPIT_UP, MOVE_YAWN, MOVE_ROCK_SLIDE, MOVE_CURSE, MOVE_FISSURE







                           ,

    (SPECIES_CACNEA + 20000), MOVE_GRASS_WHISTLE, MOVE_ACID, MOVE_TEETER_DANCE, MOVE_DYNAMIC_PUNCH, MOVE_COUNTER




                           ,

    (SPECIES_SNORUNT + 20000), MOVE_BLOCK, MOVE_SPIKES

                          ,

    (SPECIES_AZURILL + 20000), MOVE_ENCORE, MOVE_SING, MOVE_REFRESH, MOVE_SLAM, MOVE_TICKLE




                          ,

    (SPECIES_SPOINK + 20000), MOVE_FUTURE_SIGHT, MOVE_EXTRASENSORY, MOVE_SUBSTITUTE, MOVE_TRICK



                         ,

    (SPECIES_PLUSLE + 20000), MOVE_SUBSTITUTE, MOVE_WISH

                        ,

    (SPECIES_MINUN + 20000), MOVE_SUBSTITUTE, MOVE_WISH

                        ,

    (SPECIES_MAWILE + 20000), MOVE_SWORDS_DANCE, MOVE_FALSE_SWIPE, MOVE_POISON_FANG, MOVE_PSYCH_UP, MOVE_ANCIENT_POWER, MOVE_TICKLE





                          ,

    (SPECIES_MEDITITE + 20000), MOVE_FIRE_PUNCH, MOVE_THUNDER_PUNCH, MOVE_ICE_PUNCH, MOVE_FORESIGHT, MOVE_FAKE_OUT, MOVE_BATON_PASS, MOVE_DYNAMIC_PUNCH






                                 ,

    (SPECIES_SWABLU + 20000), MOVE_AGILITY, MOVE_HAZE, MOVE_PURSUIT, MOVE_RAGE



                        ,

    (SPECIES_DUSKULL + 20000), MOVE_IMPRISON, MOVE_DESTINY_BOND, MOVE_PAIN_SPLIT, MOVE_GRUDGE, MOVE_MEMENTO, MOVE_FAINT_ATTACK





                                ,

    (SPECIES_ROSELIA + 20000), MOVE_SPIKES, MOVE_SYNTHESIS, MOVE_PIN_MISSILE, MOVE_COTTON_SPORE



                                ,

    (SPECIES_SLAKOTH + 20000), MOVE_PURSUIT, MOVE_SLASH, MOVE_BODY_SLAM, MOVE_SNORE, MOVE_CRUSH_CLAW, MOVE_CURSE, MOVE_SLEEP_TALK






                              ,

    (SPECIES_GULPIN + 20000), MOVE_DREAM_EATER, MOVE_ACID_ARMOR, MOVE_SMOG, MOVE_PAIN_SPLIT



                              ,

    (SPECIES_TROPIUS + 20000), MOVE_HEADBUTT, MOVE_SLAM, MOVE_RAZOR_WIND, MOVE_LEECH_SEED, MOVE_NATURE_POWER




                                ,

    (SPECIES_WHISMUR + 20000), MOVE_TAKE_DOWN, MOVE_SNORE, MOVE_SWAGGER, MOVE_EXTRASENSORY, MOVE_SMELLING_SALT




                                 ,

    (SPECIES_CLAMPERL + 20000), MOVE_REFRESH, MOVE_MUD_SPORT, MOVE_BODY_SLAM, MOVE_SUPERSONIC, MOVE_BARRIER, MOVE_CONFUSE_RAY





                               ,

    (SPECIES_ABSOL + 20000), MOVE_BATON_PASS, MOVE_FAINT_ATTACK, MOVE_DOUBLE_EDGE, MOVE_MAGIC_COAT, MOVE_CURSE, MOVE_SUBSTITUTE





                              ,

    (SPECIES_SHUPPET + 20000), MOVE_DISABLE, MOVE_DESTINY_BOND, MOVE_FORESIGHT, MOVE_ASTONISH, MOVE_IMPRISON




                            ,

    (SPECIES_SEVIPER + 20000), MOVE_STOCKPILE, MOVE_SWALLOW, MOVE_SPIT_UP, MOVE_BODY_SLAM



                             ,

    (SPECIES_ZANGOOSE + 20000), MOVE_FLAIL, MOVE_DOUBLE_KICK, MOVE_RAZOR_WIND, MOVE_COUNTER, MOVE_ROAR, MOVE_CURSE





                         ,

    (SPECIES_RELICANTH + 20000), MOVE_MAGNITUDE, MOVE_SKULL_BASH, MOVE_WATER_SPORT, MOVE_AMNESIA, MOVE_SLEEP_TALK, MOVE_ROCK_SLIDE





                              ,

    (SPECIES_ARON + 20000), MOVE_ENDEAVOR, MOVE_BODY_SLAM, MOVE_STOMP, MOVE_SMELLING_SALT



                                 ,

    (SPECIES_CASTFORM + 20000), MOVE_FUTURE_SIGHT, MOVE_PSYCH_UP

                            ,

    (SPECIES_VOLBEAT + 20000), MOVE_BATON_PASS, MOVE_SILVER_WIND, MOVE_TRICK


                         ,

    (SPECIES_ILLUMISE + 20000), MOVE_BATON_PASS, MOVE_SILVER_WIND, MOVE_GROWTH


                          ,

    (SPECIES_LILEEP + 20000), MOVE_BARRIER, MOVE_RECOVER, MOVE_MIRROR_COAT, MOVE_ROCK_SLIDE



                              ,

    (SPECIES_ANORITH + 20000), MOVE_RAPID_SPIN, MOVE_KNOCK_OFF, MOVE_SWORDS_DANCE, MOVE_ROCK_SLIDE



                              ,

    (SPECIES_RALTS + 20000), MOVE_DISABLE, MOVE_WILL_O_WISP, MOVE_MEAN_LOOK, MOVE_MEMENTO, MOVE_DESTINY_BOND




                                ,

    (SPECIES_BAGON + 20000), MOVE_HYDRO_PUMP, MOVE_THRASH, MOVE_DRAGON_RAGE, MOVE_TWISTER, MOVE_DRAGON_DANCE




                                ,

    (SPECIES_CHIMECHO + 20000), MOVE_DISABLE, MOVE_CURSE, MOVE_HYPNOSIS, MOVE_DREAM_EATER



                               ,

    0xFFFF
};
# 39 "src/field/daycare.c" 2

static const u8 *const sCompatibilityMessages[] = {
    DaycareText_GetAlongVeryWell,
    DaycareText_GetAlong,
    DaycareText_DontLikeOther,
    DaycareText_PlayOther
};

const u8 sJapaneseEggNickname[] = _("タマゴ");

u8 *GetMonNick(struct Pokemon *mon, u8 *dest)
{
    s8 nickname[10 * 2];

    GetMonData(mon, 2, nickname);
    return StringCopy10(dest, nickname);
}

u8 *GetBoxMonNick(struct BoxPokemon *mon, u8 *dest)
{
    s8 nickname[10 * 2];

    GetBoxMonData(mon, 2, nickname);
    return StringCopy10(dest, nickname);
}

u8 CountPokemonInDaycare(struct DayCare *daycare)
{
    u8 i, count;
    count = 0;

    for (i = 0; i < 2; i++)
    {
        if (GetBoxMonData(&daycare->mons[i], 11) != 0)
            count++;
    }

    return count;
}

void InitDaycareMailRecordMixing(struct BoxPokemon * daycareMons, struct RecordMixingDayCareMail * daycareMail)
{
    u8 i;
    u8 numDaycareMons = 0;

    for (i = 0; i < 2; i++)
    {
        if (GetBoxMonData(&daycareMons[i], 11) != SPECIES_NONE)
        {
            numDaycareMons++;
            if (GetBoxMonData(&daycareMons[i], 12) == ITEM_NONE)
            {
                daycareMail->itemsHeld[i] = 0;
            }
            else
            {
                daycareMail->itemsHeld[i] = 1;
            }
        }
        else
        {
            daycareMail->itemsHeld[i] = 1;
        }
    }

    daycareMail->numDaycareMons = numDaycareMons;
}

static s8 Daycare_FindEmptySpot(struct BoxPokemon * daycareMons)
{
    u8 i;

    for (i = 0; i < 2; i++)
    {
        if (GetBoxMonData(&daycareMons[i], 11) == 0)
            return i;
    }

    return -1;
}

static void StorePokemonInDaycare(struct Pokemon * mon, struct DayCare * daycare)
{
    s8 emptySlot;
    u8 mail;
    u8 *names;

    emptySlot = Daycare_FindEmptySpot(daycare->mons);
    if (MonHasMail(mon))
    {
        StringCopy((names = daycare->misc.mail[emptySlot].names), gSaveBlock2.playerName);
        PadNameString(names, 0xFC);
        names += 8;
        GetMonNick(mon, names);
        mail = GetMonData(mon, 64);
        daycare->misc.mail[emptySlot].message = gSaveBlock1.mail[mail];
        TakeMailFromMon(mon);
    }

    daycare->mons[emptySlot] = mon->box;
    BoxMonRestorePP(&daycare->mons[emptySlot]);
    daycare->misc.countersEtc.steps[emptySlot] = 0;
    ZeroMonData(mon);
    party_compaction();
    CalculatePlayerPartyCount();
}

void StoreSelectedPokemonInDaycare(void)
{
    StorePokemonInDaycare(&gPlayerParty[gLastFieldPokeMenuOpened], &gSaveBlock1.daycare);
}


static void ShiftDaycareSlots(struct DayCare * daycare)
{

    if (GetBoxMonData(&daycare->mons[1], 11) != 0 && GetBoxMonData(&daycare->mons[0], 11) == 0)
    {
        daycare->mons[0] = daycare->mons[1];
        ZeroBoxMonData(&daycare->mons[1]);

        daycare->misc.mail[0] = daycare->misc.mail[1];
        daycare->misc.countersEtc.steps[0] = daycare->misc.countersEtc.steps[1];
        daycare->misc.countersEtc.steps[1] = 0;
        ClearDaycareMail(&daycare->misc.mail[1]);
    }
}

static void ApplyDaycareExperience(struct Pokemon * mon)
{
    s32 i;
    bool8 firstMove;
    u16 learnedMove;

    for (i = 0; i < 100; i++)
    {

        if (TryIncrementMonLevel(mon))
        {

            firstMove = 1;
            while ((learnedMove = MonTryLearningNewMove(mon, firstMove)) != 0)
            {
                firstMove = 0;
                if (learnedMove == 0xffff)
                {

                    DeleteFirstMoveAndGiveMoveToMon(mon, gMoveToLearn);
                }
            }
        }
        else
        {
            break;
        }
    }


    CalculateMonStats(mon);
}

static u16 TakeSelectedPokemonFromDaycare(struct DayCare * daycare, u8 slot)
{
    u16 species;
    u32 experience;
    struct Pokemon pokemon;

    GetBoxMonNick(&daycare->mons[slot], gStringVar1);
    species = GetBoxMonData(&daycare->mons[slot], 11);
    sub_803B4B4(&daycare->mons[slot], &pokemon);

    if (GetMonData(&pokemon, 56) != 100)
    {
        experience = GetMonData(&pokemon, 25) + daycare->misc.countersEtc.steps[slot];
        SetMonData(&pokemon, 25, &experience);
        ApplyDaycareExperience(&pokemon);
    }

    gPlayerParty[6 - 1] = pokemon;
    if (daycare->misc.mail[slot].message.itemId)
    {
        GiveMailToMon2(&gPlayerParty[6 - 1], &daycare->misc.mail[slot].message);
        ClearDaycareMail(&daycare->misc.mail[slot]);
    }

    party_compaction();
    ZeroBoxMonData(&daycare->mons[slot]);
    daycare->misc.countersEtc.steps[slot] = 0;
    ShiftDaycareSlots(daycare);
    CalculatePlayerPartyCount();
    return species;
}

u16 TakePokemonFromDaycare(void)
{
    return TakeSelectedPokemonFromDaycare(&gSaveBlock1.daycare, gSpecialVar_0x8004);
}

static u8 GetLevelAfterDaycareSteps(struct BoxPokemon * mon, u32 steps)
{
    struct BoxPokemon tempMon = *mon;

    u32 experience = GetBoxMonData(mon, 25) + steps;
    SetBoxMonData(&tempMon, 25, &experience);
    return GetLevelFromBoxMonExp(&tempMon);
}

static u8 GetNumLevelsGainedFromSteps(struct DayCare *daycare, u8 slot)
{
    u8 levelBefore;
    u8 levelAfter;

    levelBefore = GetLevelFromBoxMonExp(&daycare->mons[slot]);
    levelAfter = GetLevelAfterDaycareSteps(&daycare->mons[slot], daycare->misc.countersEtc.steps[slot]);
    return levelAfter - levelBefore;
}

static u8 GetNumLevelsGainedForDaycareSlot(struct DayCare *daycare, u8 slot)
{
    u8 numLevelsGained = GetNumLevelsGainedFromSteps(daycare, slot);
    GetBoxMonNick(&daycare->mons[slot], gStringVar1);
    ConvertIntToDecimalStringN(gStringVar2, numLevelsGained, STR_CONV_MODE_LEFT_ALIGN, 2);
    return numLevelsGained;
}

static u16 GetDaycareCostForSelectedMon(struct DayCare *daycare, u8 slot)
{
    u16 cost;

    u8 numLevelsGained = GetNumLevelsGainedFromSteps(daycare, slot);
    GetBoxMonNick(&daycare->mons[slot], gStringVar1);
    cost = 100 + 100 * numLevelsGained;
    ConvertIntToDecimalStringN(gStringVar2, cost, STR_CONV_MODE_LEFT_ALIGN, 5);
    return cost;
}

void GetDaycareCost(void)
{
    gSpecialVar_0x8005 = GetDaycareCostForSelectedMon(&gSaveBlock1.daycare, gSpecialVar_0x8004);
}

void Debug_AddDaycareSteps(u16 numSteps)
{
    gSaveBlock1.daycare.misc.countersEtc.steps[0] += numSteps;
    gSaveBlock1.daycare.misc.countersEtc.steps[1] += numSteps;
}

u8 GetNumLevelsGainedFromDaycare(void)
{
    if (GetBoxMonData(&gSaveBlock1.daycare.mons[gSpecialVar_0x8004], 11) != 0)
        return GetNumLevelsGainedForDaycareSlot(&gSaveBlock1.daycare, gSpecialVar_0x8004);

    return 0;
}

static void ClearDaycareMail(struct DayCareMail *mail)
{
    u8 *names;
    u8 *names2;
    s32 i;
    u8 zero = 0;

    for (i = 7, names = &mail->names[7]; i >= 0; i--)
    {
        *names-- = zero;
    }

    names2 = &mail->names[8];
    zero = 0;
    names = &mail->names[18];
    do *names-- = zero; while ((s32)names >= (s32)names2);
    ClearMailStruct(&mail->message);
}

void unref_sub_8041824(struct DayCare *daycare)
{
    u8 slot;
    for (slot = 0; slot < (sizeof(daycare->mons) / sizeof((daycare->mons)[0])); slot++)
    {
        ZeroBoxMonData(&daycare->mons[slot]);
        daycare->misc.countersEtc.steps[slot] = 0;
        ClearDaycareMail(&daycare->misc.mail[slot]);
    }

    daycare->misc.countersEtc.pendingEggPersonality = 0;
    daycare->misc.countersEtc.eggCycleStepsRemaining = 0;
}




u16 GetEggSpecies(u16 species)
{
    int i, j, k;
    bool8 found;



    for (i = 0; i < 5; i++)
    {
        found = 0;
        for (j = 1; j < SPECIES_EGG; j++)
        {
            for (k = 0; k < 5; k++)
            {
                if (gEvolutionTable[j].evolutions[k].targetSpecies == species)
                {
                    species = j;
                    found = 1;
                    break;
                }
            }

            if (found)
                break;
        }

        if (j == SPECIES_EGG)
            break;
    }

    return species;
}

static void _TriggerPendingDaycareEgg(struct DayCare *daycare)
{
    daycare->misc.countersEtc.pendingEggPersonality = (Random() % 0xfffe) + 1;
    FlagSet(0x86);
}

static void _TriggerPendingDaycareMaleEgg(struct DayCare *daycare)
{
    daycare->misc.countersEtc.pendingEggPersonality = Random() | 0x8000;
    FlagSet(0x86);
}

void TriggerPendingDaycareEgg(void)
{
    _TriggerPendingDaycareEgg(&gSaveBlock1.daycare);
}

void TriggerPendingDaycareMaleEgg(void)
{
    _TriggerPendingDaycareMaleEgg(&gSaveBlock1.daycare);
}



static void RemoveIVIndexFromList(u8 *ivs, u8 selectedIv)
{
    s32 i, j;
    u8 temp[6];

    ivs[selectedIv] = 0xff;
    for (i = 0; i < 6; i++)
    {
        temp[i] = ivs[i];
    }

    j = 0;
    for (i = 0; i < 6; i++)
    {
        if (temp[i] != 0xff)
            ivs[j++] = temp[i];
    }
}

static void InheritIVs(struct Pokemon *egg, struct DayCare *daycare)
{
    u8 i;
    u8 selectedIvs[3];
    u8 availableIVs[6];
    u8 whichParent[(sizeof(selectedIvs) / sizeof((selectedIvs)[0]))];
    u8 iv;


    for (i = 0; i < 6; i++)
    {
        availableIVs[i] = i;
    }


    for (i = 0; i < (sizeof(selectedIvs) / sizeof((selectedIvs)[0])); i++)
    {

        selectedIvs[i] = availableIVs[Random() % (6 - i)];


        RemoveIVIndexFromList(availableIVs, selectedIvs[i]);
    }


    for (i = 0; i < (sizeof(selectedIvs) / sizeof((selectedIvs)[0])); i++)
    {
        whichParent[i] = Random() % 2;
    }


    for (i = 0; i < (sizeof(selectedIvs) / sizeof((selectedIvs)[0])); i++)
    {
        switch (selectedIvs[i])
        {
            case 0:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], 39);
                SetMonData(egg, 39, &iv);
                break;
            case 1:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], 40);
                SetMonData(egg, 40, &iv);
                break;
            case 2:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], 41);
                SetMonData(egg, 41, &iv);
                break;
            case 3:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], 42);
                SetMonData(egg, 42, &iv);
                break;
            case 4:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], 43);
                SetMonData(egg, 43, &iv);
                break;
            case 5:
                iv = GetBoxMonData(&daycare->mons[whichParent[i]], 44);
                SetMonData(egg, 44, &iv);
                break;
        }
    }
}






u8 GetEggMoves(struct Pokemon *pokemon, u16 *eggMoves)
{
    u16 eggMoveIdx;
    u16 numEggMoves;
    u16 species;
    u16 i;

    numEggMoves = 0;
    eggMoveIdx = 0;
    species = GetMonData(pokemon, 11);
    for (i = 0; i < (sizeof(gEggMoves) / sizeof((gEggMoves)[0])) - 1; i++)
    {
        if (gEggMoves[i] == species + 20000)
        {
            eggMoveIdx = i + 1;
            break;
        }
    }

    for (i = 0; i < 10; i++)
    {
        if (gEggMoves[eggMoveIdx + i] > 20000)
        {

            break;
        }

        eggMoves[i] = gEggMoves[eggMoveIdx + i];
        numEggMoves++;
    }

    return numEggMoves;
}
# 595 "src/field/daycare.c"
__attribute__((naked))
void BuildEggMoveset(struct Pokemon *egg, struct BoxPokemon *father, struct BoxPokemon *mother)
{
    asm(".syntax unified\n" "\tpush {r4-r7,lr}\n" "\tmov r7, r10\n" "\tmov r6, r9\n" "\tmov r5, r8\n" "\tpush {r5-r7}\n" "\tsub sp, 0xC\n" "\tadds r7, r0, 0\n" "\tmov r10, r1\n" "\tmov r9, r2\n" "\tmovs r0, 0\n" "\tstr r0, [sp]\n" "\tmovs r6, 0\n" "\tldr r5, _08041CC8 @ =gHatchedEggMotherMoves\n" "\tmovs r2, 0\n" "\tldr r4, _08041CCC @ =gHatchedEggFatherMoves\n" "\tldr r3, _08041CD0 @ =gHatchedEggFinalMoves\n" "_08041BE4:\n" "\tlsls r1, r6, 1\n" "\tadds r0, r1, r5\n" "\tstrh r2, [r0]\n" "\tadds r0, r1, r4\n" "\tstrh r2, [r0]\n" "\tadds r1, r3\n" "\tstrh r2, [r1]\n" "\tadds r0, r6, 0x1\n" "\tlsls r0, 16\n" "\tlsrs r6, r0, 16\n" "\tcmp r6, 0x3\n" "\tbls _08041BE4\n" "\tmovs r6, 0\n" "\tldr r2, _08041CD4 @ =gHatchedEggEggMoves\n" "\tmovs r1, 0\n" "_08041C02:\n" "\tlsls r0, r6, 1\n" "\tadds r0, r2\n" "\tstrh r1, [r0]\n" "\tadds r0, r6, 0x1\n" "\tlsls r0, 16\n" "\tlsrs r6, r0, 16\n" "\tcmp r6, 0x9\n" "\tbls _08041C02\n" "\tmovs r6, 0\n" "\tldr r2, _08041CD8 @ =gHatchedEggLevelUpMoves\n" "\tmovs r1, 0\n" "_08041C18:\n" "\tlsls r0, r6, 1\n" "\tadds r0, r2\n" "\tstrh r1, [r0]\n" "\tadds r0, r6, 0x1\n" "\tlsls r0, 16\n" "\tlsrs r6, r0, 16\n" "\tcmp r6, 0x31\n" "\tbls _08041C18\n" "\tadds r0, r7, 0\n" "\tmovs r1, 0xB\n" "\tbl GetMonData\n" "\tlsls r0, 16\n" "\tlsrs r0, 16\n" "\tldr r1, _08041CD8 @ =gHatchedEggLevelUpMoves\n" "\tbl GetLevelUpMovesBySpecies\n" "\tlsls r0, 24\n" "\tlsrs r0, 24\n" "\tstr r0, [sp, 0x4]\n" "\tmovs r6, 0\n" "\tldr r1, _08041CCC @ =gHatchedEggFatherMoves\n" "\tmov r8, r1\n" "_08041C46:\n" "\tadds r5, r6, 0\n" "\tadds r5, 0xD\n" "\tmov r0, r10\n" "\tadds r1, r5, 0\n" "\tbl GetBoxMonData\n" "\tlsls r4, r6, 1\n" "\tmov r2, r8\n" "\tadds r1, r4, r2\n" "\tstrh r0, [r1]\n" "\tmov r0, r9\n" "\tadds r1, r5, 0\n" "\tbl GetBoxMonData\n" "\tldr r1, _08041CC8 @ =gHatchedEggMotherMoves\n" "\tadds r4, r1\n" "\tstrh r0, [r4]\n" "\tadds r0, r6, 0x1\n" "\tlsls r0, 16\n" "\tlsrs r6, r0, 16\n" "\tcmp r6, 0x3\n" "\tbls _08041C46\n" "\tldr r1, _08041CD4 @ =gHatchedEggEggMoves\n" "\tadds r0, r7, 0\n" "\tbl GetEggMoves\n" "\tlsls r0, 24\n" "\tlsrs r0, 24\n" "\tmov r8, r0\n" "\tmovs r6, 0\n" "_08041C82:\n" "\tldr r0, _08041CCC @ =gHatchedEggFatherMoves\n" "\tlsls r1, r6, 1\n" "\tadds r2, r1, r0\n" "\tldrh r1, [r2]\n" "\tmov r9, r0\n" "\tcmp r1, 0\n" "\tbeq _08041CF8\n" "\tmovs r5, 0\n" "\tcmp r5, r8\n" "\tbcs _08041CEA\n" "\tadds r4, r2, 0\n" "\tldr r2, _08041CDC @ =0x0000ffff\n" "_08041C9A:\n" "\tldr r0, _08041CD4 @ =gHatchedEggEggMoves\n" "\tlsls r1, r5, 1\n" "\tadds r1, r0\n" "\tldrh r0, [r4]\n" "\tldrh r1, [r1]\n" "\tcmp r0, r1\n" "\tbne _08041CE0\n" "\tadds r1, r0, 0\n" "\tadds r0, r7, 0\n" "\tstr r2, [sp, 0x8]\n" "\tbl GiveMoveToMon\n" "\tlsls r0, 16\n" "\tlsrs r0, 16\n" "\tldr r2, [sp, 0x8]\n" "\tcmp r0, r2\n" "\tbne _08041CEA\n" "\tldrh r1, [r4]\n" "\tadds r0, r7, 0\n" "\tbl DeleteFirstMoveAndGiveMoveToMon\n" "\tb _08041CEA\n" "\t.align 2, 0\n" "_08041CC8: .4byte gHatchedEggMotherMoves\n" "_08041CCC: .4byte gHatchedEggFatherMoves\n" "_08041CD0: .4byte gHatchedEggFinalMoves\n" "_08041CD4: .4byte gHatchedEggEggMoves\n" "_08041CD8: .4byte gHatchedEggLevelUpMoves\n" "_08041CDC: .4byte 0x0000ffff\n" "_08041CE0:\n" "\tadds r0, r5, 0x1\n" "\tlsls r0, 16\n" "\tlsrs r5, r0, 16\n" "\tcmp r5, r8\n" "\tbcc _08041C9A\n" "_08041CEA:\n" "\tadds r0, r6, 0x1\n" "\tlsls r0, 16\n" "\tlsrs r6, r0, 16\n" "\tldr r3, _08041E14 @ =gHatchedEggFatherMoves\n" "\tmov r9, r3\n" "\tcmp r6, 0x3\n" "\tbls _08041C82\n" "_08041CF8:\n" "\tmovs r6, 0\n" "_08041CFA:\n" "\tlsls r0, r6, 1\n" "\tmov r2, r9\n" "\tadds r1, r0, r2\n" "\tldrh r1, [r1]\n" "\tadds r2, r0, 0\n" "\tadds r6, 0x1\n" "\tmov r8, r6\n" "\tcmp r1, 0\n" "\tbeq _08041D5C\n" "\tmovs r5, 0\n" "\tldr r0, _08041E14 @ =gHatchedEggFatherMoves\n" "\tadds r4, r2, r0\n" "\tldr r6, _08041E18 @ =0x0000ffff\n" "\tmov r9, r0\n" "_08041D16:\n" "\tldr r3, _08041E1C @ =0x00000121\n" "\tadds r0, r5, r3\n" "\tlsls r0, 16\n" "\tlsrs r0, 16\n" "\tbl ItemIdToBattleMoveId\n" "\tldrh r1, [r4]\n" "\tlsls r0, 16\n" "\tlsrs r0, 16\n" "\tcmp r1, r0\n" "\tbne _08041D52\n" "\tlsls r1, r5, 24\n" "\tlsrs r1, 24\n" "\tadds r0, r7, 0\n" "\tbl CanMonLearnTMHM\n" "\tcmp r0, 0\n" "\tbeq _08041D52\n" "\tldrh r1, [r4]\n" "\tadds r0, r7, 0\n" "\tbl GiveMoveToMon\n" "\tlsls r0, 16\n" "\tlsrs r0, 16\n" "\tcmp r0, r6\n" "\tbne _08041D52\n" "\tldrh r1, [r4]\n" "\tadds r0, r7, 0\n" "\tbl DeleteFirstMoveAndGiveMoveToMon\n" "_08041D52:\n" "\tadds r0, r5, 0x1\n" "\tlsls r0, 16\n" "\tlsrs r5, r0, 16\n" "\tcmp r5, 0x39\n" "\tbls _08041D16\n" "_08041D5C:\n" "\tmov r1, r8\n" "\tlsls r0, r1, 16\n" "\tlsrs r6, r0, 16\n" "\tcmp r6, 0x3\n" "\tbls _08041CFA\n" "\tmovs r6, 0\n" "\tmov r2, r9\n" "\tldrh r0, [r2]\n" "\tldr r3, _08041E20 @ =gHatchedEggFinalMoves\n" "\tmov r10, r3\n" "\tcmp r0, 0\n" "\tbeq _08041DC6\n" "\tmov r4, r9\n" "\tldr r0, _08041E24 @ =gHatchedEggMotherMoves\n" "\tmov r9, r0\n" "\tmov r12, r10\n" "_08041D7C:\n" "\tmovs r5, 0\n" "\tlsls r2, r6, 1\n" "\tadds r6, 0x1\n" "\tmov r8, r6\n" "\tadds r3, r2, r4\n" "_08041D86:\n" "\tlsls r0, r5, 1\n" "\tadd r0, r9\n" "\tldrh r2, [r3]\n" "\tadds r1, r2, 0\n" "\tldrh r0, [r0]\n" "\tcmp r1, r0\n" "\tbne _08041DA8\n" "\tcmp r1, 0\n" "\tbeq _08041DA8\n" "\tldr r1, [sp]\n" "\tadds r0, r1, 0x1\n" "\tlsls r0, 16\n" "\tlsrs r0, 16\n" "\tstr r0, [sp]\n" "\tlsls r1, 1\n" "\tadd r1, r12\n" "\tstrh r2, [r1]\n" "_08041DA8:\n" "\tadds r0, r5, 0x1\n" "\tlsls r0, 16\n" "\tlsrs r5, r0, 16\n" "\tcmp r5, 0x3\n" "\tbls _08041D86\n" "\tmov r1, r8\n" "\tlsls r0, r1, 16\n" "\tlsrs r6, r0, 16\n" "\tcmp r6, 0x3\n" "\tbhi _08041DC6\n" "\tlsls r0, r6, 1\n" "\tadds r0, r4\n" "\tldrh r0, [r0]\n" "\tcmp r0, 0\n" "\tbne _08041D7C\n" "_08041DC6:\n" "\tmovs r6, 0\n" "\tmov r2, r10\n" "\tldrh r0, [r2]\n" "\tcmp r0, 0\n" "\tbeq _08041E50\n" "_08041DD0:\n" "\tmovs r5, 0\n" "\tadds r3, r6, 0x1\n" "\tmov r8, r3\n" "\tldr r0, [sp, 0x4]\n" "\tcmp r5, r0\n" "\tbcs _08041E38\n" "\tldr r2, _08041E18 @ =0x0000ffff\n" "_08041DDE:\n" "\tldr r1, _08041E28 @ =gHatchedEggLevelUpMoves\n" "\tlsls r0, r5, 1\n" "\tadds r0, r1\n" "\tldrh r1, [r0]\n" "\tcmp r1, 0\n" "\tbeq _08041E2C\n" "\tlsls r0, r6, 1\n" "\tmov r3, r10\n" "\tadds r4, r0, r3\n" "\tldrh r0, [r4]\n" "\tcmp r0, r1\n" "\tbne _08041E2C\n" "\tadds r1, r0, 0\n" "\tadds r0, r7, 0\n" "\tstr r2, [sp, 0x8]\n" "\tbl GiveMoveToMon\n" "\tlsls r0, 16\n" "\tlsrs r0, 16\n" "\tldr r2, [sp, 0x8]\n" "\tcmp r0, r2\n" "\tbne _08041E38\n" "\tldrh r1, [r4]\n" "\tadds r0, r7, 0\n" "\tbl DeleteFirstMoveAndGiveMoveToMon\n" "\tb _08041E38\n" "\t.align 2, 0\n" "_08041E14: .4byte gHatchedEggFatherMoves\n" "_08041E18: .4byte 0x0000ffff\n" "_08041E1C: .4byte 0x00000121\n" "_08041E20: .4byte gHatchedEggFinalMoves\n" "_08041E24: .4byte gHatchedEggMotherMoves\n" "_08041E28: .4byte gHatchedEggLevelUpMoves\n" "_08041E2C:\n" "\tadds r0, r5, 0x1\n" "\tlsls r0, 16\n" "\tlsrs r5, r0, 16\n" "\tldr r0, [sp, 0x4]\n" "\tcmp r5, r0\n" "\tbcc _08041DDE\n" "_08041E38:\n" "\tmov r1, r8\n" "\tlsls r0, r1, 16\n" "\tlsrs r6, r0, 16\n" "\tcmp r6, 0x3\n" "\tbhi _08041E50\n" "\tldr r0, _08041E60 @ =gHatchedEggFinalMoves\n" "\tlsls r1, r6, 1\n" "\tadds r1, r0\n" "\tldrh r1, [r1]\n" "\tmov r10, r0\n" "\tcmp r1, 0\n" "\tbne _08041DD0\n" "_08041E50:\n" "\tadd sp, 0xC\n" "\tpop {r3-r5}\n" "\tmov r8, r3\n" "\tmov r9, r4\n" "\tmov r10, r5\n" "\tpop {r4-r7}\n" "\tpop {r0}\n" "\tbx r0\n" "\t.align 2, 0\n" "_08041E60: .4byte gHatchedEggFinalMoves" "\n.syntax divided\n")
# 931 "src/field/daycare.c"
                                                              ;
}


static void RemoveEggFromDayCare(struct DayCare *daycare)
{
    daycare->misc.countersEtc.pendingEggPersonality = 0;
    daycare->misc.countersEtc.eggCycleStepsRemaining = 0;
}

void RejectEggFromDayCare(void)
{
    RemoveEggFromDayCare(&gSaveBlock1.daycare);
}

static void AlterEggSpeciesWithIncenseItem(u16 *species, struct DayCare *daycare)
{
    u16 motherItem, fatherItem;
    if (*species == SPECIES_WYNAUT || *species == SPECIES_AZURILL)
    {
        motherItem = GetBoxMonData(&daycare->mons[0], 12);
        fatherItem = GetBoxMonData(&daycare->mons[1], 12);
        if (*species == SPECIES_WYNAUT && motherItem != ITEM_LAX_INCENSE && fatherItem != ITEM_LAX_INCENSE)
        {
            *species = SPECIES_WOBBUFFET;
        }

        if (*species == SPECIES_AZURILL && motherItem != ITEM_SEA_INCENSE && fatherItem != ITEM_SEA_INCENSE)
        {
            *species = SPECIES_MARILL;
        }
    }
}

static u16 DetermineEggSpeciesAndParentSlots(struct DayCare *daycare, u8 *parentSlots)
{
    u16 i;
    u16 species[2];
    u16 eggSpecies;




    for (i = 0; i < 2; i++)
    {
        species[i] = GetBoxMonData(&daycare->mons[i], 11);
        if (species[i] == SPECIES_DITTO)
        {
            parentSlots[0] = i ^ 1;
            parentSlots[1] = i;
        }
        else if (GetBoxMonGender(&daycare->mons[i]) == 0xFE)
        {
            parentSlots[0] = i;
            parentSlots[1] = i ^ 1;
        }
    }

    eggSpecies = GetEggSpecies(species[parentSlots[0]]);
    if (eggSpecies == SPECIES_NIDORAN_F && daycare->misc.countersEtc.pendingEggPersonality & 0x8000)
    {
        eggSpecies = SPECIES_NIDORAN_M;
    }
    if (eggSpecies == SPECIES_ILLUMISE && daycare->misc.countersEtc.pendingEggPersonality & 0x8000)
    {
        eggSpecies = SPECIES_VOLBEAT;
    }


    if (species[parentSlots[1]] == SPECIES_DITTO && GetBoxMonGender(&daycare->mons[parentSlots[0]]) != 0xFE)
    {
        u8 temp = parentSlots[1];
        parentSlots[1] = parentSlots[0];
        parentSlots[0] = temp;
    }

    return eggSpecies;
}

static void _GiveEggFromDaycare(struct DayCare *daycare)
{
    struct Pokemon egg;
    u16 species;
    u8 parentSlots[2];
    u8 isEgg;

    species = DetermineEggSpeciesAndParentSlots(daycare, parentSlots);
    AlterEggSpeciesWithIncenseItem(&species, daycare);
    SetInitialEggData(&egg, species, daycare);
    InheritIVs(&egg, daycare);
    BuildEggMoveset(&egg, &daycare->mons[parentSlots[1]], &daycare->mons[parentSlots[0]]);
    isEgg = 1;
    SetMonData(&egg, 45, &isEgg);
    gPlayerParty[5] = egg;
    party_compaction();
    CalculatePlayerPartyCount();
    RemoveEggFromDayCare(daycare);
}


void CreateEgg(struct Pokemon *mon, u16 species, bool8 setMetLocation)
{
    u8 metLevel;
    u16 ball;
    u8 language;
    u8 metLocation;
    u8 isEgg;

    CreateMon(mon, species, 5, 0x20, 0, 0, 0, 0);
    metLevel = 0;
    ball = ITEM_POKE_BALL;
    language = LANGUAGE_JAPANESE;
    SetMonData(mon, 38, &ball);
    SetMonData(mon, 2, sJapaneseEggNickname);
    SetMonData(mon, 32, &gBaseStats[species].eggCycles);
    SetMonData(mon, 36, &metLevel);
    SetMonData(mon, 3, &language);
    if (setMetLocation)
    {
        metLocation = 253;
        SetMonData(mon, 35, &metLocation);
    }

    isEgg = 1;
    SetMonData(mon, 45, &isEgg);
}

static void SetInitialEggData(struct Pokemon *mon, u16 species, struct DayCare *daycare)
{
    u32 personality;
    u16 ball;
    u8 metLevel;
    u8 language;

    personality = daycare->misc.countersEtc.pendingEggPersonality | (Random() << 16);
    CreateMon(mon, species, 5, 0x20, 1, personality, 0, 0);
    metLevel = 0;
    ball = ITEM_POKE_BALL;
    language = LANGUAGE_JAPANESE;
    SetMonData(mon, 38, &ball);
    SetMonData(mon, 2, sJapaneseEggNickname);
    SetMonData(mon, 32, &gBaseStats[species].eggCycles);
    SetMonData(mon, 36, &metLevel);
    SetMonData(mon, 3, &language);
}

void GiveEggFromDaycare(void)
{
    _GiveEggFromDaycare(&gSaveBlock1.daycare);
}
# 1122 "src/field/daycare.c"
__attribute__((naked))
static bool8 _ShouldEggHatch(struct DayCare *daycare)
{
    asm(".syntax unified\n" "\tpush {r4-r7,lr}\n" "\tsub sp, 0x8\n" "\tadds r7, r0, 0\n" "\tmovs r2, 0\n" "\tmovs r6, 0\n" "\tadds r5, r7, 0\n" "_080421BC:\n" "\tlsls r4, r6, 2\n" "\tadds r0, r5, 0\n" "\tmovs r1, 0x5\n" "\tstr r2, [sp, 0x4]\n" "\tbl GetBoxMonData\n" "\tldr r2, [sp, 0x4]\n" "\tcmp r0, 0\n" "\tbeq _080421DE\n" "\tmovs r0, 0x88\n" "\tlsls r0, 1\n" "\tadds r1, r7, r0\n" "\tadds r1, r4\n" "\tldr r0, [r1]\n" "\tadds r0, 0x1\n" "\tstr r0, [r1]\n" "\tadds r2, 0x1\n" "_080421DE:\n" "\tadds r5, 0x50\n" "\tadds r6, 0x1\n" "\tcmp r6, 0x1\n" "\tbls _080421BC\n" "\tmovs r1, 0x8C\n" "\tlsls r1, 1\n" "\tadds r0, r7, r1\n" "\tldrh r0, [r0]\n" "\tcmp r0, 0\n" "\tbne _08042226\n" "\tcmp r2, 0x2\n" "\tbne _08042226\n" "\tsubs r1, 0x4\n" "\tadds r0, r7, r1\n" "\tldrb r0, [r0]\n" "\tcmp r0, 0xFF\n" "\tbne _08042226\n" "\tadds r0, r7, 0\n" "\tbl GetDaycareCompatibilityScore\n" "\tadds r4, r0, 0\n" "\tlsls r4, 24\n" "\tlsrs r4, 24\n" "\tbl Random\n" "\tlsls r0, 16\n" "\tlsrs r0, 16\n" "\tmovs r1, 0x64\n" "\tmuls r0, r1\n" "\tldr r1, _08042240 @ =0x0000ffff\n" "\tbl __udivsi3\n" "\tcmp r4, r0\n" "\tbls _08042226\n" "\tbl TriggerPendingDaycareEgg\n" "_08042226:\n" "\tmovs r0, 0x8D\n" "\tlsls r0, 1\n" "\tadds r1, r7, r0\n" "\tldrb r0, [r1]\n" "\tadds r0, 0x1\n" "\tstrb r0, [r1]\n" "\tlsls r0, 24\n" "\tlsrs r0, 24\n" "\tcmp r0, 0xFF\n" "\tbne _08042290\n" "\tmovs r6, 0\n" "\tb _08042288\n" "\t.align 2, 0\n" "_08042240: .4byte 0x0000ffff\n" "_08042244:\n" "\tmovs r0, 0x64\n" "\tadds r1, r6, 0\n" "\tmuls r1, r0\n" "\tldr r0, _08042270 @ =gPlayerParty\n" "\tadds r4, r1, r0\n" "\tadds r0, r4, 0\n" "\tmovs r1, 0x2D\n" "\tbl GetMonData\n" "\tcmp r0, 0\n" "\tbeq _08042286\n" "\tadds r0, r4, 0\n" "\tmovs r1, 0x20\n" "\tbl GetMonData\n" "\tstr r0, [sp]\n" "\tcmp r0, 0\n" "\tbne _08042278\n" "\tldr r0, _08042274 @ =gSpecialVar_0x8004\n" "\tstrh r6, [r0]\n" "\tmovs r0, 0x1\n" "\tb _08042292\n" "\t.align 2, 0\n" "_08042270: .4byte gPlayerParty\n" "_08042274: .4byte gSpecialVar_0x8004\n" "_08042278:\n" "\tsubs r0, 0x1\n" "\tstr r0, [sp]\n" "\tadds r0, r4, 0\n" "\tmovs r1, 0x20\n" "\tmov r2, sp\n" "\tbl SetMonData\n" "_08042286:\n" "\tadds r6, 0x1\n" "_08042288:\n" "\tldr r0, _0804229C @ =gPlayerPartyCount\n" "\tldrb r0, [r0]\n" "\tcmp r6, r0\n" "\tbcc _08042244\n" "_08042290:\n" "\tmovs r0, 0\n" "_08042292:\n" "\tadd sp, 0x8\n" "\tpop {r4-r7}\n" "\tpop {r1}\n" "\tbx r1\n" "\t.align 2, 0\n" "_0804229C: .4byte gPlayerPartyCount" "\n.syntax divided\n")
# 1242 "src/field/daycare.c"
                                                          ;
}


bool8 ShouldEggHatch(void)
{
    return _ShouldEggHatch(&gSaveBlock1.daycare);
}

static bool8 IsEggPending(struct DayCare *daycare)
{
    return (u32)((-daycare->misc.countersEtc.pendingEggPersonality) | daycare->misc.countersEtc.pendingEggPersonality) >> 31;
}

static void _GetDaycareMonNicknames(struct DayCare *daycare)
{
    u8 language;
    if (GetBoxMonData(&daycare->mons[0], 11) != 0)
    {
        GetBoxMonNick(&daycare->mons[0], gStringVar1);
        language = GetBoxMonData(&daycare->mons[0], 3);
        GetBoxMonData(&daycare->mons[0], 7, gStringVar3);
        ConvertInternationalString(gStringVar3, language);
    }

    if (GetBoxMonData(&daycare->mons[1], 11) != 0)
    {
        GetBoxMonNick(&daycare->mons[1], gStringVar2);
    }
}

u16 GetSelectedDaycareMonNickname(void)
{
    GetBoxMonNick(&gPlayerParty[gLastFieldPokeMenuOpened].box, gStringVar1);
    return GetBoxMonData(&gPlayerParty[gLastFieldPokeMenuOpened].box, 11);
}

void GetDaycareMonNicknames(void)
{
    _GetDaycareMonNicknames(&gSaveBlock1.daycare);
}

u8 GetDaycareState(void)
{






    u8 numMons;
    if (IsEggPending(&gSaveBlock1.daycare))
    {

        return 1;
    }

    numMons = CountPokemonInDaycare(&gSaveBlock1.daycare);
    if (numMons != 0)
    {
        return numMons + 1;
    }

    return 0;
}




bool8 EggGroupsOverlap(u16 *eggGroups1, u16 *eggGroups2)
{


    s32 i, j;
    u16 *v0, *v1, v2;

    for (i = 0, v0 = eggGroups1; i < 2; v0++, i++)
    {
        for (j = 0, v2 = *v0, v1 = eggGroups2; j < 2; v1++, j++)
        {
            if (v2 == *v1)
            {
                return 1;
            }
        }
    }

    return 0;
}
# 1401 "src/field/daycare.c"
__attribute__((naked))
static u8 GetDaycareCompatibilityScore(struct DayCare *daycare)
{
    asm(".syntax unified\n" "\tpush {r4-r7,lr}\n" "\tmov r7, r10\n" "\tmov r6, r9\n" "\tmov r5, r8\n" "\tpush {r5-r7}\n" "\tsub sp, 0x2C\n" "\tmovs r1, 0\n" "\tmov r8, r1\n" "\tmov r2, sp\n" "\tadds r2, 0x8\n" "\tstr r2, [sp, 0x1C]\n" "\tadd r1, sp, 0xC\n" "\tmov r10, r1\n" "\tadds r2, 0xC\n" "\tstr r2, [sp, 0x20]\n" "\tmov r1, sp\n" "\tadds r1, 0x2\n" "\tldr r2, _08042488 @ =gBaseStats\n" "\tmov r9, r2\n" "\tldr r5, [sp, 0x1C]\n" "\tadds r7, r1, 0\n" "\tmov r6, sp\n" "\tldr r1, [sp, 0x20]\n" "\tstr r1, [sp, 0x24]\n" "\tmov r2, r10\n" "\tstr r2, [sp, 0x28]\n" "\tadds r4, r0, 0\n" "_0804240E:\n" "\tadds r0, r4, 0\n" "\tmovs r1, 0xB\n" "\tbl GetBoxMonData\n" "\tstrh r0, [r5]\n" "\tadds r0, r4, 0\n" "\tmovs r1, 0x1\n" "\tbl GetBoxMonData\n" "\tldr r1, [sp, 0x28]\n" "\tstm r1!, {r0}\n" "\tstr r1, [sp, 0x28]\n" "\tadds r0, r4, 0\n" "\tmovs r1, 0\n" "\tbl GetBoxMonData\n" "\tadds r1, r0, 0\n" "\tldrh r0, [r5]\n" "\tbl GetGenderFromSpeciesAndPersonality\n" "\tlsls r0, 24\n" "\tlsrs r0, 24\n" "\tldr r2, [sp, 0x24]\n" "\tstm r2!, {r0}\n" "\tstr r2, [sp, 0x24]\n" "\tldrh r1, [r5]\n" "\tlsls r0, r1, 3\n" "\tsubs r0, r1\n" "\tlsls r0, 2\n" "\tadd r0, r9\n" "\tldrb r0, [r0, 0x14]\n" "\tstrh r0, [r6]\n" "\tldrh r1, [r5]\n" "\tlsls r0, r1, 3\n" "\tsubs r0, r1\n" "\tlsls r0, 2\n" "\tadd r0, r9\n" "\tldrb r0, [r0, 0x15]\n" "\tstrh r0, [r7]\n" "\tadds r5, 0x2\n" "\tadds r7, 0x4\n" "\tadds r6, 0x4\n" "\tadds r4, 0x50\n" "\tmovs r0, 0x1\n" "\tadd r8, r0\n" "\tmov r1, r8\n" "\tcmp r1, 0x1\n" "\tbls _0804240E\n" "\tmov r0, sp\n" "\tldrh r1, [r0]\n" "\tcmp r1, 0xF\n" "\tbeq _08042484\n" "\tldrh r0, [r0, 0x4]\n" "\tcmp r0, 0xF\n" "\tbeq _08042484\n" "\tcmp r1, 0xD\n" "\tbne _0804248C\n" "\tcmp r0, 0xD\n" "\tbne _08042490\n" "_08042484:\n" "\tmovs r0, 0\n" "\tb _080424E4\n" "\t.align 2, 0\n" "_08042488: .4byte gBaseStats\n" "_0804248C:\n" "\tcmp r0, 0xD\n" "\tbne _0804249C\n" "_08042490:\n" "\tldr r1, [sp, 0xC]\n" "\tmov r2, r10\n" "\tldr r0, [r2, 0x4]\n" "\tcmp r1, r0\n" "\tbeq _080424DE\n" "\tb _080424E2\n" "_0804249C:\n" "\tldr r0, [sp, 0x14]\n" "\tldr r2, [sp, 0x20]\n" "\tldr r1, [r2, 0x4]\n" "\tcmp r0, r1\n" "\tbeq _08042484\n" "\tcmp r0, 0xFF\n" "\tbeq _08042484\n" "\tcmp r1, 0xFF\n" "\tbeq _08042484\n" "\tadd r1, sp, 0x4\n" "\tmov r0, sp\n" "\tbl EggGroupsOverlap\n" "\tlsls r0, 24\n" "\tcmp r0, 0\n" "\tbeq _08042484\n" "\tldr r0, [sp, 0x1C]\n" "\tldrh r1, [r0, 0x2]\n" "\tldrh r0, [r0]\n" "\tcmp r0, r1\n" "\tbne _080424D4\n" "\tldr r1, [sp, 0xC]\n" "\tmov r2, r10\n" "\tldr r0, [r2, 0x4]\n" "\tcmp r1, r0\n" "\tbeq _080424E2\n" "\tmovs r0, 0x46\n" "\tb _080424E4\n" "_080424D4:\n" "\tldr r1, [sp, 0xC]\n" "\tmov r2, r10\n" "\tldr r0, [r2, 0x4]\n" "\tcmp r1, r0\n" "\tbne _080424E2\n" "_080424DE:\n" "\tmovs r0, 0x14\n" "\tb _080424E4\n" "_080424E2:\n" "\tmovs r0, 0x32\n" "_080424E4:\n" "\tadd sp, 0x2C\n" "\tpop {r3-r5}\n" "\tmov r8, r3\n" "\tmov r9, r4\n" "\tmov r10, r5\n" "\tpop {r4-r7}\n" "\tpop {r1}\n" "\tbx r1" "\n.syntax divided\n")
# 1549 "src/field/daycare.c"
                              ;
}


u8 GetDaycareCompatibilityScoreFromSave(void)
{
    return GetDaycareCompatibilityScore(&gSaveBlock1.daycare);
}

void SetDaycareCompatibilityString(void)
{
    u8 whichString;
    u8 relationshipScore;

    relationshipScore = GetDaycareCompatibilityScoreFromSave();
    whichString = 0;
    if (relationshipScore == 0)
        whichString = 3;
    if (relationshipScore == 20)
        whichString = 2;
    if (relationshipScore == 50)
        whichString = 1;
    if (relationshipScore == 70)
        whichString = 0;

    StringCopy(gStringVar4, sCompatibilityMessages[whichString]);
}
# 1598 "src/field/daycare.c"
__attribute__((naked))
bool8 NameHasGenderSymbol(const u8 *name, u8 genderRatio)
{
    asm(".syntax unified\n" "\n" "\tpush {r4,r5,lr}\n" "\tsub sp, 0x4\n" "\tadds r4, r0, 0\n" "\tlsls r1, 24\n" "\tlsrs r5, r1, 24\n" "\tmov r2, sp\n" "\tmov r1, sp\n" "\tmovs r0, 0\n" "\tstrb r0, [r1, 0x1]\n" "\tstrb r0, [r2]\n" "\tmovs r3, 0\n" "\tldrb r0, [r4]\n" "\tcmp r0, 0xFF\n" "\tbeq _0804258C\n" "_08042564:\n" "\tadds r1, r4, r3\n" "\tldrb r0, [r1]\n" "\tcmp r0, 0xB5\n" "\tbne _08042572\n" "\tldrb r0, [r2]\n" "\tadds r0, 0x1\n" "\tstrb r0, [r2]\n" "_08042572:\n" "\tldrb r0, [r1]\n" "\tcmp r0, 0xB6\n" "\tbne _0804257E\n" "\tldrb r0, [r2, 0x1]\n" "\tadds r0, 0x1\n" "\tstrb r0, [r2, 0x1]\n" "_0804257E:\n" "\tadds r0, r3, 0x1\n" "\tlsls r0, 24\n" "\tlsrs r3, r0, 24\n" "\tadds r0, r4, r3\n" "\tldrb r0, [r0]\n" "\tcmp r0, 0xFF\n" "\tbne _08042564\n" "_0804258C:\n" "\tcmp r5, 0\n" "\tbne _080425A0\n" "\tmov r0, sp\n" "\tldrb r0, [r0]\n" "\tcmp r0, 0\n" "\tbeq _080425A0\n" "\tmov r0, sp\n" "\tldrb r0, [r0, 0x1]\n" "\tcmp r0, 0\n" "\tbeq _080425B4\n" "_080425A0:\n" "\tcmp r5, 0xFE\n" "\tbne _080425B8\n" "\tmov r0, sp\n" "\tldrb r0, [r0, 0x1]\n" "\tcmp r0, 0\n" "\tbeq _080425B8\n" "\tmov r0, sp\n" "\tldrb r0, [r0]\n" "\tcmp r0, 0\n" "\tbne _080425B8\n" "_080425B4:\n" "\tmovs r0, 0x1\n" "\tb _080425BA\n" "_080425B8:\n" "\tmovs r0, 0\n" "_080425BA:\n" "\tadd sp, 0x4\n" "\tpop {r4,r5}\n" "\tpop {r1}\n" "\tbx r1" "\n.syntax divided\n")
# 1670 "src/field/daycare.c"
                              ;
}


static u8 *AppendGenderSymbol(u8 *name, u8 gender)
{
    if (gender == 0x00)
    {
        if (!NameHasGenderSymbol(name, 0x00))
            return StringAppend(name, gOtherText_MaleSymbol3);
    }
    else if (gender == 0xFE)
    {
        if (!NameHasGenderSymbol(name, 0xFE))
            return StringAppend(name, gOtherText_FemaleSymbol3);
    }

    return StringAppend(name, gOtherText_GenderlessSymbol);
}

static u8 *AppendMonGenderSymbol(u8 *name, struct BoxPokemon *boxMon)
{
    return AppendGenderSymbol(name, GetBoxMonGender(boxMon));
}

static void GetDaycareLevelMenuText(struct DayCare *daycare, u8 *dest)
{
    u8 monNames[2][20];
    u8 i;

    *dest = 0xFF;
    for (i = 0; i < 2; i++)
    {
        GetBoxMonNick(&daycare->mons[i], monNames[i]);
        AppendMonGenderSymbol(monNames[i], &daycare->mons[i]);
    }

    StringCopy(dest, monNames[0]);
    StringAppend(dest, gOtherText_NewLine2);
    StringAppend(dest, monNames[1]);
    StringAppend(dest, gOtherText_NewLine2);
    StringAppend(dest, gOtherText_CancelAndLv);
}

static void GetDaycareLevelMenuLevelText(struct DayCare *daycare, u8 *dest)
{
    u8 i;
    u8 level;

    *dest = 0xFF;
    for (i = 0; i < 2; i++)
    {
        level = GetLevelAfterDaycareSteps(&daycare->mons[i], daycare->misc.countersEtc.steps[i]);
        dest[0] = 0x34;
        dest[1] = 0xFC;
        dest[2] = 0x14;
        dest[3] = 0x06;
        dest = ConvertIntToDecimalStringN(dest + 4, level, STR_CONV_MODE_RIGHT_ALIGN, 3);
        dest[0] = 0xFC;
        dest[1] = 0x14;
        dest[2] = 0x00;
        dest = StringCopy(dest + 3, gOtherText_NewLine2);
    }

    *dest = 0xFF;
}

static void HandleDaycareLevelMenuInput(u8 taskId)
{
    if (gMain.newKeys & 0x0040)
    {
        if (gTasks[taskId].data[0] != 0)
        {
            gTasks[taskId].data[0] --;
            MoveMenuCursor(-1);
            PlaySE(SE_SELECT);
        }
    }
    else if (gMain.newKeys & 0x0080)
    {
        if (gTasks[taskId].data[0] != 2)
        {
            gTasks[taskId].data[0]++;
            MoveMenuCursor(+1);
            PlaySE(SE_SELECT);
        }
    }
    else if (gMain.newKeys & 0x0001)
    {
        HandleDestroyMenuCursors();
        PlaySE(SE_SELECT);
        gLastFieldPokeMenuOpened = gScriptResult = gTasks[taskId].data[0];
        DestroyTask(taskId);
        MenuZeroFillWindowRect(15, 6, 29, 13);
        EnableBothScriptContexts();
    }
    else if (gMain.newKeys & 0x0002)
    {
        HandleDestroyMenuCursors();
        gLastFieldPokeMenuOpened = gScriptResult = 2;
        DestroyTask(taskId);
        MenuZeroFillWindowRect(15, 6, 29, 13);
        EnableBothScriptContexts();
    }
}

void ShowDaycareLevelMenu(void)
{
    u8 buffer[100];
    MenuDrawTextWindow(15, 6, 29, 13);
    GetDaycareLevelMenuText(&gSaveBlock1.daycare, buffer);
    MenuPrint(buffer, 16, 7);
    GetDaycareLevelMenuLevelText(&gSaveBlock1.daycare, buffer);
    MenuPrint_PixelCoords(buffer, 0xce, 0x38, 1);
    InitMenu(0, 16, 7, 3, 0, 13);
    CreateTask(HandleDaycareLevelMenuInput, 3);
}

void ChooseSendDaycareMon(void)
{
    OpenPartyMenu(PARTY_MENU_TYPE_DAYCARE, 0);
    gMain.savedCallback = c2_exit_to_overworld_2_switch;
}
