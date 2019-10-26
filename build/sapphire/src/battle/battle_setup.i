# 1 "src/battle/battle_setup.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/battle/battle_setup.c"
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
# 2 "src/battle/battle_setup.c" 2
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
# 3 "src/battle/battle_setup.c" 2
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
# 4 "src/battle/battle_setup.c" 2
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
# 5 "src/battle/battle_setup.c" 2
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
# 6 "src/battle/battle_setup.c" 2
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
# 7 "src/battle/battle_setup.c" 2
# 1 "include/field_control_avatar.h" 1



struct FieldInput
{
    u8 pressedAButton:1;
    u8 input_field_0_1:1;
    u8 pressedStartButton:1;
    u8 pressedSelectButton:1;
    u8 input_field_0_4:1;
    u8 input_field_0_5:1;
    u8 input_field_0_6:1;
    u8 pressedBButton:1;
    u8 input_field_1_0:1;
    u8 input_field_1_1:1;
    u8 input_field_1_2:1;
    u8 input_field_1_3:1;
    u8 input_field_1_4:1;
    u8 input_field_1_5:1;
    u8 input_field_1_6:1;
    u8 input_field_1_7:1;
    u8 dpadDirection;
    u8 input_field_3;
};

void FieldClearPlayerInput(struct FieldInput *pStruct);
void FieldGetPlayerInput(struct FieldInput *pStruct, u16 keys, u16 heldKeys);
int sub_8068024(struct FieldInput *pStruct);
u8 *sub_80682A8(struct MapPosition *, u8, u8);
void overworld_poison_timer_set(void);
void prev_quest_postbuffer_cursor_backup_reset(void);
u8 *sub_8068E24(struct MapPosition *);
u8 *GetFieldObjectScriptPointerPlayerFacing(void);
bool8 mapheader_trigger_activate_at__run_now(struct MapPosition *);
bool8 sub_8068870(u16 a);
bool8 sub_8068894(void);
bool8 sub_8068A64(struct MapPosition *, u16);
u8 sub_8068F18(void);
# 8 "src/battle/battle_setup.c" 2
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
# 9 "src/battle/battle_setup.c" 2
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
# 10 "src/battle/battle_setup.c" 2
# 1 "include/field_message_box.h" 1



enum
{
    FIELD_MESSAGE_BOX_HIDDEN,
    FIELD_MESSAGE_BOX_UNUSED,
    FIELD_MESSAGE_BOX_NORMAL,
    FIELD_MESSAGE_BOX_AUTO_SCROLL,
};

void InitFieldMessageBox(void);
bool8 ShowFieldMessage(const u8 *message);
bool8 ShowFieldAutoScrollMessage(const u8 *message);
bool8 unref_sub_8064BB8(const u8 *message);
bool8 unref_sub_8064BD0(const u8 *message);
void HideFieldMessageBox(void);
u8 GetFieldMessageBoxMode(void);
bool8 IsFieldMessageBoxHidden(void);
void unref_sub_8064CA0(void);
# 11 "src/battle/battle_setup.c" 2
# 1 "include/field_player_avatar.h" 1



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
# 5 "include/field_player_avatar.h" 2


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
# 12 "src/battle/battle_setup.c" 2
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
# 13 "src/battle/battle_setup.c" 2
# 1 "include/fieldmap.h" 1


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
# 14 "src/battle/battle_setup.c" 2
# 1 "include/fldeff_poison.h" 1



void DoFieldPoisonEffect(void);
bool32 FieldPoisonEffectIsRunning(void);
# 15 "src/battle/battle_setup.c" 2
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
# 16 "src/battle/battle_setup.c" 2
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
# 17 "src/battle/battle_setup.c" 2
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
# 18 "src/battle/battle_setup.c" 2
# 1 "include/opponent_constants.h" 1



enum
{
    OPPONENT_NONE,
    OPPONENT_ARCHIE_1,
    OPPONENT_GRUNT_1,
    OPPONENT_GRUNT_2,
    OPPONENT_GRUNT_3,
    OPPONENT_GRUNT_4,
    OPPONENT_GRUNT_5,
    OPPONENT_GRUNT_6,
    OPPONENT_GRUNT_7,
    OPPONENT_GRUNT_8,
    OPPONENT_GRUNT_9,
    OPPONENT_GRUNT_10,
    OPPONENT_GRUNT_11,
    OPPONENT_GRUNT_12,
    OPPONENT_GRUNT_13,
    OPPONENT_GRUNT_14,
    OPPONENT_GRUNT_15,
    OPPONENT_GRUNT_16,
    OPPONENT_GRUNT_17,
    OPPONENT_GRUNT_18,
    OPPONENT_GRUNT_19,
    OPPONENT_GRUNT_20,
    OPPONENT_GRUNT_21,
    OPPONENT_GRUNT_22,
    OPPONENT_GRUNT_23,
    OPPONENT_GRUNT_24,
    OPPONENT_GRUNT_25,
    OPPONENT_GRUNT_26,
    OPPONENT_GRUNT_27,
    OPPONENT_ANONYMOUS_1,
    OPPONENT_MATT_1,
    OPPONENT_MATT_2,
    OPPONENT_SHELLY_1,
    OPPONENT_SHELLY_2,
    OPPONENT_ARCHIE_2,
    OPPONENT_ARCHIE_3,
    OPPONENT_DAISY,
    OPPONENT_ROSE_1,
    OPPONENT_LILY,
    OPPONENT_VIOLET,
    OPPONENT_ROSE_2,
    OPPONENT_ROSE_3,
    OPPONENT_ROSE_4,
    OPPONENT_ROSE_5,
    OPPONENT_DUSTY_1,
    OPPONENT_CHIP,
    OPPONENT_FOSTER,
    OPPONENT_DUSTY_2,
    OPPONENT_DUSTY_3,
    OPPONENT_DUSTY_4,
    OPPONENT_DUSTY_5,
    OPPONENT_GABBY_AND_TY_1,
    OPPONENT_GABBY_AND_TY_2,
    OPPONENT_GABBY_AND_TY_3,
    OPPONENT_GABBY_AND_TY_4,
    OPPONENT_GABBY_AND_TY_5,
    OPPONENT_GABBY_AND_TY_6,
    OPPONENT_LOLA_1,
    OPPONENT_CARMEN,
    OPPONENT_GWEN,
    OPPONENT_LOLA_2,
    OPPONENT_LOLA_3,
    OPPONENT_LOLA_4,
    OPPONENT_LOLA_5,
    OPPONENT_RICKY_1,
    OPPONENT_SIMON,
    OPPONENT_CHARLIE,
    OPPONENT_RICKY_2,
    OPPONENT_RICKY_3,
    OPPONENT_RICKY_4,
    OPPONENT_RICKY_5,
    OPPONENT_RANDALL,
    OPPONENT_PARKER,
    OPPONENT_GEORGE,
    OPPONENT_BERKE,
    OPPONENT_CLYDE,
    OPPONENT_VINCENT,
    OPPONENT_LEROY,
    OPPONENT_WILTON_1,
    OPPONENT_EDGAR,
    OPPONENT_ALBERT,
    OPPONENT_SAMUEL,
    OPPONENT_VITO,
    OPPONENT_OWEN,
    OPPONENT_WILTON_2,
    OPPONENT_WILTON_3,
    OPPONENT_WILTON_4,
    OPPONENT_WILTON_5,
    OPPONENT_WARREN,
    OPPONENT_MARY,
    OPPONENT_LORI,
    OPPONENT_JODY,
    OPPONENT_WENDY,
    OPPONENT_ELAINE,
    OPPONENT_BROOKE_1,
    OPPONENT_JENNIFER,
    OPPONENT_HOPE,
    OPPONENT_SHANNON,
    OPPONENT_MICHELLE,
    OPPONENT_CAROLINE,
    OPPONENT_JULIE,
    OPPONENT_BROOKE_2,
    OPPONENT_BROOKE_3,
    OPPONENT_BROOKE_4,
    OPPONENT_BROOKE_5,
    OPPONENT_PATRICIA,
    OPPONENT_KINDRA,
    OPPONENT_TAMMY,
    OPPONENT_VALERIE_1,
    OPPONENT_TASHA,
    OPPONENT_VALERIE_2,
    OPPONENT_VALERIE_3,
    OPPONENT_VALERIE_4,
    OPPONENT_VALERIE_5,
    OPPONENT_CINDY_1,
    OPPONENT_ANONYMOUS_2,
    OPPONENT_BRIANNA_1,
    OPPONENT_CINDY_2,
    OPPONENT_BRIANNA_2,
    OPPONENT_ANETTE,
    OPPONENT_CINDY_3,
    OPPONENT_CINDY_4,
    OPPONENT_CINDY_5,
    OPPONENT_CINDY_6,
    OPPONENT_MELISSA,
    OPPONENT_SHEILA,
    OPPONENT_SHIRLEY,
    OPPONENT_JESSICA_1,
    OPPONENT_CONNIE,
    OPPONENT_BRIDGET,
    OPPONENT_OLIVIA,
    OPPONENT_TIFFANY,
    OPPONENT_JESSICA_2,
    OPPONENT_JESSICA_3,
    OPPONENT_JESSICA_4,
    OPPONENT_JESSICA_5,
    OPPONENT_WINSTON_1,
    OPPONENT_ANONYMOUS_3,
    OPPONENT_GARRET,
    OPPONENT_WINSTON_2,
    OPPONENT_WINSTON_3,
    OPPONENT_WINSTON_4,
    OPPONENT_WINSTON_5,
    OPPONENT_STEVE_1,
    OPPONENT_CHRIS,
    OPPONENT_MARK,
    OPPONENT_KENN,
    OPPONENT_STEVE_2,
    OPPONENT_STEVE_3,
    OPPONENT_STEVE_4,
    OPPONENT_STEVE_5,
    OPPONENT_LUIS,
    OPPONENT_AUSTIN,
    OPPONENT_DOUGLAS,
    OPPONENT_DARRIN,
    OPPONENT_TONY_1,
    OPPONENT_JEROME,
    OPPONENT_MATTHEW,
    OPPONENT_DAVID,
    OPPONENT_SPENCER,
    OPPONENT_ROLAND,
    OPPONENT_CODY,
    OPPONENT_STAN,
    OPPONENT_BARRY,
    OPPONENT_DEAN,
    OPPONENT_RODNEY,
    OPPONENT_RICHARD,
    OPPONENT_HERMAN,
    OPPONENT_ANONYMOUS_4,
    OPPONENT_GILBERT,
    OPPONENT_FRANKLIN,
    OPPONENT_DANNY,
    OPPONENT_JACK,
    OPPONENT_DUDLEY,
    OPPONENT_CHAD,
    OPPONENT_TONY_2,
    OPPONENT_TONY_3,
    OPPONENT_TONY_4,
    OPPONENT_TONY_5,
    OPPONENT_HIDEKI,
    OPPONENT_HITOSHI,
    OPPONENT_KIYO,
    OPPONENT_KOICHI,
    OPPONENT_NOB_1,
    OPPONENT_NOB_2,
    OPPONENT_NOB_3,
    OPPONENT_NOB_4,
    OPPONENT_NOB_5,
    OPPONENT_YUJI,
    OPPONENT_DAISUKE,
    OPPONENT_ATSUSHI,
    OPPONENT_KIRK,
    OPPONENT_SCOTT,
    OPPONENT_HARVEY,
    OPPONENT_SHAWN,
    OPPONENT_RANDY,
    OPPONENT_DALTON_1,
    OPPONENT_DALTON_2,
    OPPONENT_DALTON_3,
    OPPONENT_DALTON_4,
    OPPONENT_DALTON_5,
    OPPONENT_COLE,
    OPPONENT_FLINT,
    OPPONENT_AXLE,
    OPPONENT_JAKE,
    OPPONENT_ANDY,
    OPPONENT_BERNIE_1,
    OPPONENT_BERNIE_2,
    OPPONENT_BERNIE_3,
    OPPONENT_BERNIE_4,
    OPPONENT_BERNIE_5,
    OPPONENT_DREW,
    OPPONENT_CLIFF,
    OPPONENT_LARRY,
    OPPONENT_SHANE,
    OPPONENT_JUSTIN,
    OPPONENT_ETHAN_1,
    OPPONENT_JEFF,
    OPPONENT_TRAVIS,
    OPPONENT_ETHAN_2,
    OPPONENT_ETHAN_3,
    OPPONENT_ETHAN_4,
    OPPONENT_ETHAN_5,
    OPPONENT_BRENT,
    OPPONENT_DONALD,
    OPPONENT_TAYLOR,
    OPPONENT_BRANDON_1,
    OPPONENT_DEREK,
    OPPONENT_BRANDON_2,
    OPPONENT_BRANDON_3,
    OPPONENT_BRANDON_4,
    OPPONENT_BRANDON_5,
    OPPONENT_EDWARD,
    OPPONENT_PRESTON,
    OPPONENT_VIRGIL,
    OPPONENT_FRITZ,
    OPPONENT_WILLIAM,
    OPPONENT_JOSHUA,
    OPPONENT_CAMERON_1,
    OPPONENT_CAMERON_2,
    OPPONENT_CAMERON_3,
    OPPONENT_CAMERON_4,
    OPPONENT_CAMERON_5,
    OPPONENT_JACLYN,
    OPPONENT_HANNAH,
    OPPONENT_SAMANTHA,
    OPPONENT_MAURA,
    OPPONENT_KAYLA,
    OPPONENT_ALEXIS,
    OPPONENT_JACKI_1,
    OPPONENT_JACKI_2,
    OPPONENT_JACKI_3,
    OPPONENT_JACKI_4,
    OPPONENT_JACKI_5,
    OPPONENT_WALTER_1,
    OPPONENT_TUCKER,
    OPPONENT_THOMAS,
    OPPONENT_WALTER_2,
    OPPONENT_WALTER_3,
    OPPONENT_WALTER_4,
    OPPONENT_WALTER_5,
    OPPONENT_SIDNEY,
    OPPONENT_PHOEBE,
    OPPONENT_GLACIA,
    OPPONENT_DRAKE,
    OPPONENT_ROXANNE,
    OPPONENT_BRAWLY,
    OPPONENT_WATTSON,
    OPPONENT_FLANNERY,
    OPPONENT_NORMAN,
    OPPONENT_WINONA,
    OPPONENT_TATE_AND_LIZA,
    OPPONENT_WALLACE,
    OPPONENT_JERRY_1,
    OPPONENT_TED,
    OPPONENT_PAUL,
    OPPONENT_JERRY_2,
    OPPONENT_JERRY_3,
    OPPONENT_JERRY_4,
    OPPONENT_JERRY_5,
    OPPONENT_KAREN_1,
    OPPONENT_GEORGIA,
    OPPONENT_KAREN_2,
    OPPONENT_KAREN_3,
    OPPONENT_KAREN_4,
    OPPONENT_KAREN_5,
    OPPONENT_KATE_AND_JOY,
    OPPONENT_ANNA_AND_MEG_1,
    OPPONENT_ANNA_AND_MEG_2,
    OPPONENT_ANNA_AND_MEG_3,
    OPPONENT_ANNA_AND_MEG_4,
    OPPONENT_ANNA_AND_MEG_5,
    OPPONENT_VICTOR,
    OPPONENT_MIGUEL_1,
    OPPONENT_COLTON,
    OPPONENT_MIGUEL_2,
    OPPONENT_MIGUEL_3,
    OPPONENT_MIGUEL_4,
    OPPONENT_MIGUEL_5,
    OPPONENT_VICTORIA,
    OPPONENT_VANESSA,
    OPPONENT_MARISSA,
    OPPONENT_ISABEL_1,
    OPPONENT_ISABEL_2,
    OPPONENT_ISABEL_3,
    OPPONENT_ISABEL_4,
    OPPONENT_ISABEL_5,
    OPPONENT_TIMOTHY_1,
    OPPONENT_TIMOTHY_2,
    OPPONENT_TIMOTHY_3,
    OPPONENT_TIMOTHY_4,
    OPPONENT_TIMOTHY_5,
    OPPONENT_VICKY,
    OPPONENT_SHELBY_1,
    OPPONENT_SHELBY_2,
    OPPONENT_SHELBY_3,
    OPPONENT_SHELBY_4,
    OPPONENT_SHELBY_5,
    OPPONENT_CALVIN_1,
    OPPONENT_BILLY,
    OPPONENT_JOSH,
    OPPONENT_TOMMY,
    OPPONENT_JOEY,
    OPPONENT_BEN,
    OPPONENT_ANONYMOUS_5,
    OPPONENT_KEVIN,
    OPPONENT_NEAL,
    OPPONENT_DILLON,
    OPPONENT_CALVIN_2,
    OPPONENT_CALVIN_3,
    OPPONENT_CALVIN_4,
    OPPONENT_CALVIN_5,
    OPPONENT_EDDIE,
    OPPONENT_ALLEN,
    OPPONENT_TIMMY,
    OPPONENT_STEVEN,
    OPPONENT_ANDREW,
    OPPONENT_IVAN,
    OPPONENT_CLAUDE,
    OPPONENT_ELLIOT_1,
    OPPONENT_NED,
    OPPONENT_DALE,
    OPPONENT_NOLAN,
    OPPONENT_BARNY,
    OPPONENT_WADE,
    OPPONENT_CARTER,
    OPPONENT_ELLIOT_2,
    OPPONENT_ELLIOT_3,
    OPPONENT_ELLIOT_4,
    OPPONENT_ELLIOT_5,
    OPPONENT_RONALD,
    OPPONENT_JACOB,
    OPPONENT_ANTHONY,
    OPPONENT_BENJAMIN_1,
    OPPONENT_BENJAMIN_2,
    OPPONENT_BENJAMIN_3,
    OPPONENT_BENJAMIN_4,
    OPPONENT_BENJAMIN_5,
    OPPONENT_ABIGAIL_1,
    OPPONENT_JASMINE,
    OPPONENT_ABIGAIL_2,
    OPPONENT_ABIGAIL_3,
    OPPONENT_ABIGAIL_4,
    OPPONENT_ABIGAIL_5,
    OPPONENT_DYLAN_1,
    OPPONENT_DYLAN_2,
    OPPONENT_DYLAN_3,
    OPPONENT_DYLAN_4,
    OPPONENT_DYLAN_5,
    OPPONENT_MARIA_1,
    OPPONENT_MARIA_2,
    OPPONENT_MARIA_3,
    OPPONENT_MARIA_4,
    OPPONENT_MARIA_5,
    OPPONENT_CALEB,
    OPPONENT_ANONYMOUS_6,
    OPPONENT_ISAIAH_1,
    OPPONENT_ANONYMOUS_7,
    OPPONENT_CHASE,
    OPPONENT_ISAIAH_2,
    OPPONENT_ISAIAH_3,
    OPPONENT_ISAIAH_4,
    OPPONENT_ISAIAH_5,
    OPPONENT_ANONYMOUS_8,
    OPPONENT_CONNOR,
    OPPONENT_ANONYMOUS_9,
    OPPONENT_KATELYN_1,
    OPPONENT_ALLISON,
    OPPONENT_KATELYN_2,
    OPPONENT_KATELYN_3,
    OPPONENT_KATELYN_4,
    OPPONENT_KATELYN_5,
    OPPONENT_NICOLAS_1,
    OPPONENT_NICOLAS_2,
    OPPONENT_NICOLAS_3,
    OPPONENT_NICOLAS_4,
    OPPONENT_NICOLAS_5,
    OPPONENT_AARON,
    OPPONENT_PERRY,
    OPPONENT_HUGH,
    OPPONENT_PHIL,
    OPPONENT_JARED,
    OPPONENT_ANONYMOUS_10,
    OPPONENT_TANNER,
    OPPONENT_WILL,
    OPPONENT_COLIN,
    OPPONENT_ROBERT_1,
    OPPONENT_BENNY,
    OPPONENT_CHESTER,
    OPPONENT_ROBERT_2,
    OPPONENT_ROBERT_3,
    OPPONENT_ROBERT_4,
    OPPONENT_ROBERT_5,
    OPPONENT_ALEX,
    OPPONENT_BECK,
    OPPONENT_YASU,
    OPPONENT_TAKASHI,
    OPPONENT_MAKOTO,
    OPPONENT_HIDEO_1,
    OPPONENT_LAO_1,
    OPPONENT_LUNG,
    OPPONENT_LAO_2,
    OPPONENT_LAO_3,
    OPPONENT_LAO_4,
    OPPONENT_LAO_5,
    OPPONENT_TESSA,
    OPPONENT_LAURA,
    OPPONENT_CYNDY_1,
    OPPONENT_CORA,
    OPPONENT_JILL,
    OPPONENT_CYNDY_2,
    OPPONENT_CYNDY_3,
    OPPONENT_CYNDY_4,
    OPPONENT_CYNDY_5,
    OPPONENT_MADELINE_1,
    OPPONENT_CLARISSA,
    OPPONENT_ANGELICA,
    OPPONENT_MADELINE_2,
    OPPONENT_MADELINE_3,
    OPPONENT_MADELINE_4,
    OPPONENT_MADELINE_5,
    OPPONENT_BEVERLY,
    OPPONENT_DAWN,
    OPPONENT_NICOLE,
    OPPONENT_DENISE,
    OPPONENT_BETH,
    OPPONENT_TARA,
    OPPONENT_MISSY,
    OPPONENT_ALICE,
    OPPONENT_JENNY_1,
    OPPONENT_GRACE,
    OPPONENT_TANYA,
    OPPONENT_SHARON,
    OPPONENT_NIKKI,
    OPPONENT_BRENDA,
    OPPONENT_KATIE,
    OPPONENT_SUSIE,
    OPPONENT_KARA,
    OPPONENT_DANA,
    OPPONENT_ERIN,
    OPPONENT_DEBRA,
    OPPONENT_LINDA,
    OPPONENT_KAYLEE,
    OPPONENT_LAUREL,
    OPPONENT_DARCY,
    OPPONENT_JENNY_2,
    OPPONENT_JENNY_3,
    OPPONENT_JENNY_4,
    OPPONENT_JENNY_5,
    OPPONENT_HEIDI,
    OPPONENT_BECKY,
    OPPONENT_CAROL,
    OPPONENT_NANCY,
    OPPONENT_MARTHA,
    OPPONENT_DIANA_1,
    OPPONENT_NINA,
    OPPONENT_IRENE,
    OPPONENT_DIANA_2,
    OPPONENT_DIANA_3,
    OPPONENT_DIANA_4,
    OPPONENT_DIANA_5,
    OPPONENT_AMY_AND_LIV_1,
    OPPONENT_AMY_AND_LIV_2,
    OPPONENT_GINA_AND_MIA_1,
    OPPONENT_MIU_AND_YUKI,
    OPPONENT_AMY_AND_LIV_3,
    OPPONENT_GINA_AND_MIA_2,
    OPPONENT_AMY_AND_LIV_4,
    OPPONENT_AMY_AND_LIV_5,
    OPPONENT_AMY_AND_LIV_6,
    OPPONENT_HUEY,
    OPPONENT_EDMOND,
    OPPONENT_ERNEST_1,
    OPPONENT_DWAYNE,
    OPPONENT_PHILLIP,
    OPPONENT_LEONARD,
    OPPONENT_DUNCAN,
    OPPONENT_ERNEST_2,
    OPPONENT_ERNEST_3,
    OPPONENT_ERNEST_4,
    OPPONENT_ERNEST_5,
    OPPONENT_ANONYMOUS_11,
    OPPONENT_ANONYMOUS_12,
    OPPONENT_ANONYMOUS_13,
    OPPONENT_SONNY,
    OPPONENT_DONOVAN,
    OPPONENT_GERALD,
    OPPONENT_KELVIN,
    OPPONENT_KODY,
    OPPONENT_TEVIN,
    OPPONENT_DAMON,
    OPPONENT_PABLO,
    OPPONENT_EDWIN_1,
    OPPONENT_HECTOR_1,
    OPPONENT_HECTOR_2,
    OPPONENT_EDWIN_2,
    OPPONENT_EDWIN_3,
    OPPONENT_EDWIN_4,
    OPPONENT_EDWIN_5,
    OPPONENT_WALLY_1,
    OPPONENT_BRENDAN_1,
    OPPONENT_BRENDAN_2,
    OPPONENT_BRENDAN_3,
    OPPONENT_BRENDAN_4,
    OPPONENT_BRENDAN_5,
    OPPONENT_BRENDAN_6,
    OPPONENT_BRENDAN_7,
    OPPONENT_BRENDAN_8,
    OPPONENT_BRENDAN_9,
    OPPONENT_MAY_1,
    OPPONENT_MAY_2,
    OPPONENT_MAY_3,
    OPPONENT_MAY_4,
    OPPONENT_MAY_5,
    OPPONENT_MAY_6,
    OPPONENT_MAY_7,
    OPPONENT_MAY_8,
    OPPONENT_MAY_9,
    OPPONENT_ISAAC_1,
    OPPONENT_RILEY,
    OPPONENT_AIDAN,
    OPPONENT_ISAAC_2,
    OPPONENT_ISAAC_3,
    OPPONENT_ISAAC_4,
    OPPONENT_ISAAC_5,
    OPPONENT_LYDIA_1,
    OPPONENT_ALEXIA,
    OPPONENT_DANIELLE,
    OPPONENT_LYDIA_2,
    OPPONENT_LYDIA_3,
    OPPONENT_LYDIA_4,
    OPPONENT_LYDIA_5,
    OPPONENT_JACKSON_1,
    OPPONENT_CARLOS,
    OPPONENT_SEBASTIAN,
    OPPONENT_JACKSON_2,
    OPPONENT_JACKSON_3,
    OPPONENT_JACKSON_4,
    OPPONENT_JACKSON_5,
    OPPONENT_CATHERINE_1,
    OPPONENT_JENNA,
    OPPONENT_SOPHIA,
    OPPONENT_CATHERINE_2,
    OPPONENT_CATHERINE_3,
    OPPONENT_CATHERINE_4,
    OPPONENT_CATHERINE_5,
    OPPONENT_MAXIE_1,
    OPPONENT_GRUNT_28,
    OPPONENT_GRUNT_29,
    OPPONENT_GRUNT_30,
    OPPONENT_GRUNT_31,
    OPPONENT_GRUNT_32,
    OPPONENT_GRUNT_33,
    OPPONENT_GRUNT_34,
    OPPONENT_GRUNT_35,
    OPPONENT_GRUNT_36,
    OPPONENT_GRUNT_37,
    OPPONENT_GRUNT_38,
    OPPONENT_GRUNT_39,
    OPPONENT_GRUNT_40,
    OPPONENT_GRUNT_41,
    OPPONENT_GRUNT_42,
    OPPONENT_GRUNT_43,
    OPPONENT_GRUNT_44,
    OPPONENT_GRUNT_45,
    OPPONENT_GRUNT_46,
    OPPONENT_GRUNT_47,
    OPPONENT_GRUNT_48,
    OPPONENT_GRUNT_49,
    OPPONENT_GRUNT_50,
    OPPONENT_GRUNT_51,
    OPPONENT_GRUNT_52,
    OPPONENT_GRUNT_53,
    OPPONENT_GRUNT_54,
    OPPONENT_ANONYMOUS_14,
    OPPONENT_ANONYMOUS_15,
    OPPONENT_TABITHA_1,
    OPPONENT_TABITHA_2,
    OPPONENT_ANONYMOUS_16,
    OPPONENT_COURTNEY_1,
    OPPONENT_COURTNEY_2,
    OPPONENT_MAXIE_2,
    OPPONENT_MAXIE_3,
    OPPONENT_TIANA,
    OPPONENT_HALEY_1,
    OPPONENT_JANICE,
    OPPONENT_VIVI,
    OPPONENT_HALEY_2,
    OPPONENT_HALEY_3,
    OPPONENT_HALEY_4,
    OPPONENT_HALEY_5,
    OPPONENT_SALLY,
    OPPONENT_ROBIN,
    OPPONENT_ANDREA,
    OPPONENT_CRISSY,
    OPPONENT_RICK,
    OPPONENT_LYLE,
    OPPONENT_JOSE,
    OPPONENT_DOUG,
    OPPONENT_GREG,
    OPPONENT_KENT,
    OPPONENT_JAMES_1,
    OPPONENT_JAMES_2,
    OPPONENT_JAMES_3,
    OPPONENT_JAMES_4,
    OPPONENT_JAMES_5,
    OPPONENT_BRICE,
    OPPONENT_TRENT_1,
    OPPONENT_LENNY,
    OPPONENT_LUCAS_1,
    OPPONENT_ALAN,
    OPPONENT_CLARK,
    OPPONENT_ERIC,
    OPPONENT_LUCAS_2,
    OPPONENT_MIKE_1,
    OPPONENT_MIKE_2,
    OPPONENT_TRENT_2,
    OPPONENT_TRENT_3,
    OPPONENT_TRENT_4,
    OPPONENT_TRENT_5,
    OPPONENT_DEZ_AND_LUKE,
    OPPONENT_LEA_AND_JED,
    OPPONENT_LOIS_AND_HAL_1,
    OPPONENT_LOIS_AND_HAL_2,
    OPPONENT_LOIS_AND_HAL_3,
    OPPONENT_LOIS_AND_HAL_4,
    OPPONENT_LOIS_AND_HAL_5,
    OPPONENT_JOHANNA,
    OPPONENT_ZANE,
    OPPONENT_VIVIAN,
    OPPONENT_SADIE,
    OPPONENT_HIDEO_2,
    OPPONENT_KEIGO,
    OPPONENT_TSUNAO,
    OPPONENT_TERRELL,
    OPPONENT_KYLEE,
    OPPONENT_WALLY_2,
    OPPONENT_WALLY_3,
    OPPONENT_WALLY_4,
    OPPONENT_WALLY_5,
    OPPONENT_WALLY_6,
    OPPONENT_BRENDAN_10,
    OPPONENT_BRENDAN_11,
    OPPONENT_BRENDAN_12,
    OPPONENT_MAY_10,
    OPPONENT_MAY_11,
    OPPONENT_MAY_12,
    OPPONENT_JONAH,
    OPPONENT_HENRY,
    OPPONENT_ROGER,
    OPPONENT_ALEXA,
    OPPONENT_RUBEN,
    OPPONENT_KOJI,
    OPPONENT_WAYNE,
    OPPONENT_BYRON,
    OPPONENT_REED,
    OPPONENT_TISHA,
    OPPONENT_TORI_AND_TIA,
    OPPONENT_KIM_AND_IRIS,
    OPPONENT_TYRA_AND_IVY,
    OPPONENT_MEL_AND_PAUL,
    OPPONENT_JOHN_AND_JAY_1,
    OPPONENT_JOHN_AND_JAY_2,
    OPPONENT_JOHN_AND_JAY_3,
    OPPONENT_JOHN_AND_JAY_4,
    OPPONENT_JOHN_AND_JAY_5,
    OPPONENT_RELI_AND_IAN,
    OPPONENT_RITA_AND_SAM_1,
    OPPONENT_RITA_AND_SAM_2,
    OPPONENT_RITA_AND_SAM_3,
    OPPONENT_RITA_AND_SAM_4,
    OPPONENT_RITA_AND_SAM_5,
    OPPONENT_LISA_AND_RAY,
    OPPONENT_EUGENE,
};
# 19 "src/battle/battle_setup.c" 2
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
# 20 "src/battle/battle_setup.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 21 "src/battle/battle_setup.c" 2
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
# 22 "src/battle/battle_setup.c" 2
# 1 "include/safari_zone.h" 1



extern u8 gNumSafariBalls;

bool32 GetSafariZoneFlag(void);
void SetSafariZoneFlag(void);
void ResetSafariZoneFlag(void);

void EnterSafariMode(void);
void ExitSafariMode(void);

bool8 SafariZoneTakeStep(void);
void SafariZoneRetirePrompt(void);
void sub_80C824C(void);

void SafariZoneGetPokeblockNameInFeeder(void);
struct Pokeblock *unref_sub_80C8418(void);
struct Pokeblock *SafariZoneGetActivePokeblock(void);
void SafariZoneActivatePokeblockFeeder(u8 pokeblock_index);
bool8 unref_sub_80C853C(void);
# 23 "src/battle/battle_setup.c" 2
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
# 24 "src/battle/battle_setup.c" 2
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
# 25 "src/battle/battle_setup.c" 2
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
# 26 "src/battle/battle_setup.c" 2
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
# 27 "src/battle/battle_setup.c" 2
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
# 28 "src/battle/battle_setup.c" 2
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
# 29 "src/battle/battle_setup.c" 2
# 1 "include/starter_choose.h" 1





extern const u16 gBirchBagGrassPal[2][16];
extern const u8 gBirchBagTilemap[];
extern const u8 gBirchGrassTilemap[];
extern const u8 gBirchHelpGfx[];

u16 GetStarterPokemon(u16);
void CB2_ChooseStarter(void);
# 30 "src/battle/battle_setup.c" 2
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
# 31 "src/battle/battle_setup.c" 2
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
# 32 "src/battle/battle_setup.c" 2
# 1 "include/task.h" 1
# 33 "src/battle/battle_setup.c" 2
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
# 34 "src/battle/battle_setup.c" 2
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
# 35 "src/battle/battle_setup.c" 2

extern u16 gScriptResult;

extern void (*gFieldCallback)(void);

__attribute__((section("ewram_data"))) static u16 sTrainerBattleMode = 0;
__attribute__((section("ewram_data"))) u16 gTrainerBattleOpponent = 0;
__attribute__((section("ewram_data"))) static u16 sTrainerMapObjectLocalId = 0;
__attribute__((section("ewram_data"))) static u8 *sTrainerIntroSpeech = ((void *)0);
__attribute__((section("ewram_data"))) static u8 *sTrainerDefeatSpeech = ((void *)0);
__attribute__((section("ewram_data"))) static u8 *sTrainerVictorySpeech = ((void *)0);
__attribute__((section("ewram_data"))) static u8 *sTrainerCannotBattleSpeech = ((void *)0);
__attribute__((section("ewram_data"))) static u8 *sTrainerBattleScriptRetAddr = ((void *)0);
__attribute__((section("ewram_data"))) static u8 *sTrainerBattleEndScript = ((void *)0);

extern u16 gBattleTypeFlags;
extern u16 gScriptLastTalked;
extern u8 gBattleOutcome;

extern struct MapObject gMapObjects[];

extern u8 gUnknown_0819F818[];
extern u8 gUnknown_0819F840[];
extern u8 gUnknown_0819F878[];
extern u8 gUnknown_0819F887[];
extern u8 gUnknown_0819F8AE[];

extern u8 gUnknown_0819F80B[];
extern u8 gUnknown_081C6C02[];



static const u8 gBattleTransitionTable_Wild[][2] =
{
    {8, 9},
    {5, 10},
    {0, 10},
    {7, 6},
};
static const u8 gBattleTransitionTable_Trainer[][2] =
{
    {4, 11},
    {2, 3},
    {0, 10},
    {1, 6},
};

enum
{
    TRAINER_PARAM_LOAD_VAL_8BIT,
    TRAINER_PARAM_LOAD_VAL_16BIT,
    TRAINER_PARAM_LOAD_VAL_32BIT,
    TRAINER_PARAM_CLEAR_VAL_8BIT,
    TRAINER_PARAM_CLEAR_VAL_16BIT,
    TRAINER_PARAM_CLEAR_VAL_32BIT,
    TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR,
};

struct TrainerBattleParameter
{
    void *varPtr;
    u8 ptrType;
};

static const struct TrainerBattleParameter gTrainerBattleSpecs_0[] =
{
    {&sTrainerBattleMode, TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent, TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerMapObjectLocalId, TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerIntroSpeech, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerDefeatSpeech, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleEndScript, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleScriptRetAddr, TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};
static const struct TrainerBattleParameter gTrainerBattleSpecs_1[] =
{
    {&sTrainerBattleMode, TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent, TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerMapObjectLocalId, TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerIntroSpeech, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerDefeatSpeech, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleEndScript, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerBattleScriptRetAddr, TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};
static const struct TrainerBattleParameter gTrainerBattleSpecs_2[] =
{
    {&sTrainerBattleMode, TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent, TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerMapObjectLocalId, TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerIntroSpeech, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerDefeatSpeech, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerBattleEndScript, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleScriptRetAddr, TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};
static const struct TrainerBattleParameter gTrainerBattleSpecs_3[] =
{
    {&sTrainerBattleMode, TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent, TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerMapObjectLocalId, TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerIntroSpeech, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerDefeatSpeech, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleEndScript, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerBattleScriptRetAddr, TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};
static const struct TrainerBattleParameter gTrainerBattleSpecs_4[] =
{
    {&sTrainerBattleMode, TRAINER_PARAM_LOAD_VAL_8BIT},
    {&gTrainerBattleOpponent, TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerMapObjectLocalId, TRAINER_PARAM_LOAD_VAL_16BIT},
    {&sTrainerIntroSpeech, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerDefeatSpeech, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerVictorySpeech, TRAINER_PARAM_CLEAR_VAL_32BIT},
    {&sTrainerCannotBattleSpeech, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerBattleEndScript, TRAINER_PARAM_LOAD_VAL_32BIT},
    {&sTrainerBattleScriptRetAddr, TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR},
};

const struct TrainerEyeTrainer gTrainerEyeTrainers[] =
{
    {
        {OPPONENT_ROSE_1, OPPONENT_ROSE_2, OPPONENT_ROSE_3, OPPONENT_ROSE_4, OPPONENT_ROSE_5},
        0,
        MAP_ID_ROUTE118,
    },
    {
        {OPPONENT_DUSTY_1, OPPONENT_DUSTY_2, OPPONENT_DUSTY_3, OPPONENT_DUSTY_4, OPPONENT_DUSTY_5},
        0,
        MAP_ID_ROUTE111,
    },
    {
        {OPPONENT_LOLA_1, OPPONENT_LOLA_2, OPPONENT_LOLA_3, OPPONENT_LOLA_4, OPPONENT_LOLA_5},
        0,
        MAP_ID_ROUTE109,
    },
    {
        {OPPONENT_RICKY_1, OPPONENT_RICKY_2, OPPONENT_RICKY_3, OPPONENT_RICKY_4, OPPONENT_RICKY_5},
        0,
        MAP_ID_ROUTE109,
    },
    {
        {OPPONENT_RITA_AND_SAM_1, OPPONENT_RITA_AND_SAM_2, OPPONENT_RITA_AND_SAM_3, OPPONENT_RITA_AND_SAM_4, OPPONENT_RITA_AND_SAM_5},
        0,
        MAP_ID_ROUTE124,
    },
    {
        {OPPONENT_BROOKE_1, OPPONENT_BROOKE_2, OPPONENT_BROOKE_3, OPPONENT_BROOKE_4, OPPONENT_BROOKE_5},
        0,
        MAP_ID_ROUTE111,
    },
    {
        {OPPONENT_WILTON_1, OPPONENT_WILTON_2, OPPONENT_WILTON_3, OPPONENT_WILTON_4, OPPONENT_WILTON_5},
        0,
        MAP_ID_ROUTE111,
    },
    {
        {OPPONENT_VALERIE_1, OPPONENT_VALERIE_2, OPPONENT_VALERIE_3, OPPONENT_VALERIE_4, OPPONENT_VALERIE_5},
        24,
        MAP_ID_MT_PYRE_6F,
    },
    {
        {OPPONENT_CINDY_1, OPPONENT_CINDY_3, OPPONENT_CINDY_4, OPPONENT_CINDY_5, OPPONENT_CINDY_6},
        0,
        MAP_ID_ROUTE104,
    },
    {
        {OPPONENT_JESSICA_1, OPPONENT_JESSICA_2, OPPONENT_JESSICA_3, OPPONENT_JESSICA_4, OPPONENT_JESSICA_5},
        0,
        MAP_ID_ROUTE121,
    },
    {
        {OPPONENT_WINSTON_1, OPPONENT_WINSTON_2, OPPONENT_WINSTON_3, OPPONENT_WINSTON_4, OPPONENT_WINSTON_5},
        0,
        MAP_ID_ROUTE104,
    },
    {
        {OPPONENT_STEVE_1, OPPONENT_STEVE_2, OPPONENT_STEVE_3, OPPONENT_STEVE_4, OPPONENT_STEVE_5},
        0,
        MAP_ID_ROUTE114,
    },
    {
        {OPPONENT_TONY_1, OPPONENT_TONY_2, OPPONENT_TONY_3, OPPONENT_TONY_4, OPPONENT_TONY_5},
        0,
        MAP_ID_ROUTE107,
    },
    {
        {OPPONENT_NOB_1, OPPONENT_NOB_2, OPPONENT_NOB_3, OPPONENT_NOB_4, OPPONENT_NOB_5},
        0,
        MAP_ID_ROUTE115,
    },
    {
        {OPPONENT_DALTON_1, OPPONENT_DALTON_2, OPPONENT_DALTON_3, OPPONENT_DALTON_4, OPPONENT_DALTON_5},
        0,
        MAP_ID_ROUTE118,
    },
    {
        {OPPONENT_BERNIE_1, OPPONENT_BERNIE_2, OPPONENT_BERNIE_3, OPPONENT_BERNIE_4, OPPONENT_BERNIE_5},
        0,
        MAP_ID_ROUTE114,
    },
    {
        {OPPONENT_ETHAN_1, OPPONENT_ETHAN_2, OPPONENT_ETHAN_3, OPPONENT_ETHAN_4, OPPONENT_ETHAN_5},
        24,
        MAP_ID_JAGGED_PASS,
    },
    {
        {OPPONENT_JOHN_AND_JAY_1, OPPONENT_JOHN_AND_JAY_2, OPPONENT_JOHN_AND_JAY_3, OPPONENT_JOHN_AND_JAY_4, OPPONENT_JOHN_AND_JAY_5},
        24,
        MAP_ID_METEOR_FALLS_1F_2R,
    },
    {
        {OPPONENT_BRANDON_1, OPPONENT_BRANDON_2, OPPONENT_BRANDON_3, OPPONENT_BRANDON_4, OPPONENT_BRANDON_5},
        0,
        MAP_ID_ROUTE120,
    },
    {
        {OPPONENT_CAMERON_1, OPPONENT_CAMERON_2, OPPONENT_CAMERON_3, OPPONENT_CAMERON_4, OPPONENT_CAMERON_5},
        0,
        MAP_ID_ROUTE123,
    },
    {
        {OPPONENT_JACKI_1, OPPONENT_JACKI_2, OPPONENT_JACKI_3, OPPONENT_JACKI_4, OPPONENT_JACKI_5},
        0,
        MAP_ID_ROUTE123,
    },
    {
        {OPPONENT_WALTER_1, OPPONENT_WALTER_2, OPPONENT_WALTER_3, OPPONENT_WALTER_4, OPPONENT_WALTER_5},
        0,
        MAP_ID_ROUTE121,
    },
    {
        {OPPONENT_KAREN_1, OPPONENT_KAREN_2, OPPONENT_KAREN_3, OPPONENT_KAREN_4, OPPONENT_KAREN_5},
        0,
        MAP_ID_ROUTE116,
    },
    {
        {OPPONENT_JERRY_1, OPPONENT_JERRY_2, OPPONENT_JERRY_3, OPPONENT_JERRY_4, OPPONENT_JERRY_5},
        0,
        MAP_ID_ROUTE116,
    },
    {
        {OPPONENT_ANNA_AND_MEG_1, OPPONENT_ANNA_AND_MEG_2, OPPONENT_ANNA_AND_MEG_3, OPPONENT_ANNA_AND_MEG_4, OPPONENT_ANNA_AND_MEG_5},
        0,
        MAP_ID_ROUTE117,
    },
    {
        {OPPONENT_ISABEL_1, OPPONENT_ISABEL_2, OPPONENT_ISABEL_3, OPPONENT_ISABEL_4, OPPONENT_ISABEL_5},
        0,
        MAP_ID_ROUTE110,
    },
    {
        {OPPONENT_MIGUEL_1, OPPONENT_MIGUEL_2, OPPONENT_MIGUEL_3, OPPONENT_MIGUEL_4, OPPONENT_MIGUEL_5},
        0,
        MAP_ID_ROUTE103,
    },
    {
        {OPPONENT_TIMOTHY_1, OPPONENT_TIMOTHY_2, OPPONENT_TIMOTHY_3, OPPONENT_TIMOTHY_4, OPPONENT_TIMOTHY_5},
        0,
        MAP_ID_ROUTE115,
    },
    {
        {OPPONENT_SHELBY_1, OPPONENT_SHELBY_2, OPPONENT_SHELBY_3, OPPONENT_SHELBY_4, OPPONENT_SHELBY_5},
        24,
        MAP_ID_MT_CHIMNEY,
    },
    {
        {OPPONENT_CALVIN_1, OPPONENT_CALVIN_2, OPPONENT_CALVIN_3, OPPONENT_CALVIN_4, OPPONENT_CALVIN_5},
        0,
        MAP_ID_ROUTE102,
    },
    {
        {OPPONENT_ELLIOT_1, OPPONENT_ELLIOT_2, OPPONENT_ELLIOT_3, OPPONENT_ELLIOT_4, OPPONENT_ELLIOT_5},
        0,
        MAP_ID_ROUTE106,
    },
    {
        {OPPONENT_ABIGAIL_1, OPPONENT_ABIGAIL_2, OPPONENT_ABIGAIL_3, OPPONENT_ABIGAIL_4, OPPONENT_ABIGAIL_5},
        0,
        MAP_ID_ROUTE110,
    },
    {
        {OPPONENT_BENJAMIN_1, OPPONENT_BENJAMIN_2, OPPONENT_BENJAMIN_3, OPPONENT_BENJAMIN_4, OPPONENT_BENJAMIN_5},
        0,
        MAP_ID_ROUTE110,
    },
    {
        {OPPONENT_ISAIAH_1, OPPONENT_ISAIAH_2, OPPONENT_ISAIAH_3, OPPONENT_ISAIAH_4, OPPONENT_ISAIAH_5},
        0,
        MAP_ID_ROUTE128,
    },
    {
        {OPPONENT_KATELYN_1, OPPONENT_KATELYN_2, OPPONENT_KATELYN_3, OPPONENT_KATELYN_4, OPPONENT_KATELYN_5},
        0,
        MAP_ID_ROUTE128,
    },
    {
        {OPPONENT_MARIA_1, OPPONENT_MARIA_2, OPPONENT_MARIA_3, OPPONENT_MARIA_4, OPPONENT_MARIA_5},
        0,
        MAP_ID_ROUTE117,
    },
    {
        {OPPONENT_DYLAN_1, OPPONENT_DYLAN_2, OPPONENT_DYLAN_3, OPPONENT_DYLAN_4, OPPONENT_DYLAN_5},
        0,
        MAP_ID_ROUTE117,
    },
    {
        {OPPONENT_NICOLAS_1, OPPONENT_NICOLAS_2, OPPONENT_NICOLAS_3, OPPONENT_NICOLAS_4, OPPONENT_NICOLAS_5},
        24,
        MAP_ID_METEOR_FALLS_1F_2R,
    },
    {
        {OPPONENT_ROBERT_1, OPPONENT_ROBERT_2, OPPONENT_ROBERT_3, OPPONENT_ROBERT_4, OPPONENT_ROBERT_5},
        0,
        MAP_ID_ROUTE120,
    },
    {
        {OPPONENT_LAO_1, OPPONENT_LAO_2, OPPONENT_LAO_3, OPPONENT_LAO_4, OPPONENT_LAO_5},
        0,
        MAP_ID_ROUTE113,
    },
    {
        {OPPONENT_CYNDY_1, OPPONENT_CYNDY_2, OPPONENT_CYNDY_3, OPPONENT_CYNDY_4, OPPONENT_CYNDY_5},
        0,
        MAP_ID_ROUTE115,
    },
    {
        {OPPONENT_MADELINE_1, OPPONENT_MADELINE_2, OPPONENT_MADELINE_3, OPPONENT_MADELINE_4, OPPONENT_MADELINE_5},
        0,
        MAP_ID_ROUTE113,
    },
    {
        {OPPONENT_JENNY_1, OPPONENT_JENNY_2, OPPONENT_JENNY_3, OPPONENT_JENNY_4, OPPONENT_JENNY_5},
        0,
        MAP_ID_ROUTE124,
    },
    {
        {OPPONENT_DIANA_1, OPPONENT_DIANA_2, OPPONENT_DIANA_3, OPPONENT_DIANA_4, OPPONENT_DIANA_5},
        24,
        MAP_ID_JAGGED_PASS,
    },
    {
        {OPPONENT_AMY_AND_LIV_1, OPPONENT_AMY_AND_LIV_2, OPPONENT_AMY_AND_LIV_4, OPPONENT_AMY_AND_LIV_5, OPPONENT_AMY_AND_LIV_6},
        0,
        MAP_ID_ROUTE103,
    },
    {
        {OPPONENT_ERNEST_1, OPPONENT_ERNEST_2, OPPONENT_ERNEST_3, OPPONENT_ERNEST_4, OPPONENT_ERNEST_5},
        0,
        MAP_ID_ROUTE125,
    },
    {
        {OPPONENT_EDWIN_1, OPPONENT_EDWIN_2, OPPONENT_EDWIN_3, OPPONENT_EDWIN_4, OPPONENT_EDWIN_5},
        0,
        MAP_ID_ROUTE110,
    },
    {
        {OPPONENT_LYDIA_1, OPPONENT_LYDIA_2, OPPONENT_LYDIA_3, OPPONENT_LYDIA_4, OPPONENT_LYDIA_5},
        0,
        MAP_ID_ROUTE117,
    },
    {
        {OPPONENT_ISAAC_1, OPPONENT_ISAAC_2, OPPONENT_ISAAC_3, OPPONENT_ISAAC_4, OPPONENT_ISAAC_5},
        0,
        MAP_ID_ROUTE117,
    },
    {
        {OPPONENT_CATHERINE_1, OPPONENT_CATHERINE_2, OPPONENT_CATHERINE_3, OPPONENT_CATHERINE_4, OPPONENT_CATHERINE_5},
        0,
        MAP_ID_ROUTE119,
    },
    {
        {OPPONENT_JACKSON_1, OPPONENT_JACKSON_2, OPPONENT_JACKSON_3, OPPONENT_JACKSON_4, OPPONENT_JACKSON_5},
        0,
        MAP_ID_ROUTE119,
    },
    {
        {OPPONENT_HALEY_1, OPPONENT_HALEY_2, OPPONENT_HALEY_3, OPPONENT_HALEY_4, OPPONENT_HALEY_5},
        0,
        MAP_ID_ROUTE104,
    },
    {
        {OPPONENT_JAMES_1, OPPONENT_JAMES_2, OPPONENT_JAMES_3, OPPONENT_JAMES_4, OPPONENT_JAMES_5},
        24,
        MAP_ID_PETALBURG_WOODS,
    },
    {
        {OPPONENT_TRENT_1, OPPONENT_TRENT_2, OPPONENT_TRENT_3, OPPONENT_TRENT_4, OPPONENT_TRENT_5},
        0,
        MAP_ID_ROUTE112,
    },
    {
        {OPPONENT_LOIS_AND_HAL_1, OPPONENT_LOIS_AND_HAL_2, OPPONENT_LOIS_AND_HAL_3, OPPONENT_LOIS_AND_HAL_4, OPPONENT_LOIS_AND_HAL_5},
        24,
        MAP_ID_ABANDONED_SHIP_ROOMS2_1F,
    },
    {
        {OPPONENT_WALLY_3, OPPONENT_WALLY_4, OPPONENT_WALLY_5, OPPONENT_WALLY_6, OPPONENT_NONE},
        24,
        MAP_ID_VICTORY_ROAD_1F,
    },
};

static const u16 sBadgeFlags[] = {0x807, 0x808, 0x809, 0x80A, 0x80B, 0x80C, 0x80D, 0x80E};

static void DoStandardWildBattle(void);
static void DoSafariBattle(void);
static void SetTrainerFlagsAfterTrainerEyeRematch(void);
static void CB2_EndWildBattle(void);
static void CB2_EndScriptedWildBattle(void);
static u8 GetWildBattleTransition(void);
static u8 GetTrainerBattleTransition(void);
static void CB2_GiveStarter(void);
static void CB2_StartFirstBattle(void);
static void CB2_EndFirstBattle(void);
static bool32 IsPlayerDefeated(u32 a1);




static void Task_BattleStart(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        if (!FieldPoisonEffectIsRunning())
        {
            BattleTransition_StartOnField(data[1]);
            data[0]++;
        }
        break;
    case 1:
        if (IsBattleTransitionDone() == 1)
        {
            SetMainCallback2(sub_800E7C4);
            prev_quest_postbuffer_cursor_backup_reset();
            overworld_poison_timer_set();
            DestroyTask(taskId);
        }
        break;
    }
}

static void CreateBattleStartTask(u8 transition, u16 song)
{
    u8 taskId = CreateTask(Task_BattleStart, 1);

    gTasks[taskId].data[1] = transition;
    current_map_music_set__default_for_battle(song);
}




void BattleSetup_StartWildBattle(void)
{
    if (GetSafariZoneFlag())
        DoSafariBattle();
    else
        DoStandardWildBattle();
}

static void DoStandardWildBattle(void)
{
    ScriptContext2_Enable();
    FreezeMapObjects();
    sub_80597F4();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = 0;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void BattleSetup_StartRoamerBattle(void)
{
    ScriptContext2_Enable();
    FreezeMapObjects();
    sub_80597F4();
    gMain.savedCallback = CB2_EndWildBattle;
    gBattleTypeFlags = 0x0400;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

static void DoSafariBattle(void)
{
    ScriptContext2_Enable();
    FreezeMapObjects();
    sub_80597F4();
    gMain.savedCallback = sub_80C824C;
    gBattleTypeFlags = 0x0080;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
}

static void StartTheBattle(void)
{
    CreateBattleStartTask(GetTrainerBattleTransition(), 0);
    IncrementGameStat(7);
    IncrementGameStat(9);
}


void ScrSpecial_StartWallyTutorialBattle(void)
{
    CreateMaleMon(&gEnemyParty[0], SPECIES_RALTS, 5);
    ScriptContext2_Enable();
    gMain.savedCallback = c2_exit_to_overworld_1_continue_scripts_restart_music;
    gBattleTypeFlags = 0x0200;
    CreateBattleStartTask(8, 0);
}

void BattleSetup_StartScriptedWildBattle(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = 0;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void ScrSpecial_StartSouthernIslandBattle(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = 0x2000;
    CreateBattleStartTask(GetWildBattleTransition(), 0);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void ScrSpecial_StartRayquazaBattle(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = 0x2000;
    CreateBattleStartTask(0, BGM_BATTLE34);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void ScrSpecial_StartGroudonKyogreBattle(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = 0x2000 | 0x1000;
    if (gGameVersion == VERSION_RUBY)
        CreateBattleStartTask(11, BGM_BATTLE34);
    else
        CreateBattleStartTask(6, BGM_BATTLE34);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

void ScrSpecial_StartRegiBattle(void)
{
    ScriptContext2_Enable();
    gMain.savedCallback = CB2_EndScriptedWildBattle;
    gBattleTypeFlags = 0x2000 | 0x4000;
    CreateBattleStartTask(10, BGM_BATTLE36);
    IncrementGameStat(7);
    IncrementGameStat(8);
}

static void CB2_EndWildBattle(void)
{
    { vu16 tmp = (vu16)(0); CpuSet((void *)&tmp, (void *)0x5000000, 0x00000000 | 0x01000000 | ((0x200)/(16/8) & 0x1FFFFF)); };
    ResetOamRange(0, 128);

    if (IsPlayerDefeated(gBattleOutcome) == 1)
    {
        SetMainCallback2(CB2_WhiteOut);
    }
    else
    {
        SetMainCallback2(c2_exit_to_overworld_2_switch);
        gFieldCallback = sub_8080E44;
    }
}

void CB2_EndScriptedWildBattle(void)
{
    { vu16 tmp = (vu16)(0); CpuSet((void *)&tmp, (void *)0x5000000, 0x00000000 | 0x01000000 | ((0x200)/(16/8) & 0x1FFFFF)); };
    ResetOamRange(0, 128);

    if (IsPlayerDefeated(gBattleOutcome) == 1)
        SetMainCallback2(CB2_WhiteOut);
    else
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

s8 BattleSetup_GetTerrain(void)
{
    u16 tileBehavior;
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);

    if (MetatileBehavior_IsTallGrass(tileBehavior))
        return BATTLE_TERRAIN_GRASS;
    if (MetatileBehavior_IsLongGrass(tileBehavior))
        return BATTLE_TERRAIN_LONG_GRASS;
    if (MetatileBehavior_IsSandOrDeepSand(tileBehavior))
        return BATTLE_TERRAIN_SAND;
    switch (gMapHeader.mapType)
    {
    case MAP_TYPE_TOWN:
    case MAP_TYPE_CITY:
    case MAP_TYPE_ROUTE:
        break;
    case MAP_TYPE_UNDERGROUND:
        if (sub_80574C4(tileBehavior))
            return BATTLE_TERRAIN_BUILDING;
        if (MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior))
            return BATTLE_TERRAIN_POND;
        return BATTLE_TERRAIN_CAVE;
    case MAP_TYPE_INDOOR:
    case MAP_TYPE_SECRET_BASE:
        return BATTLE_TERRAIN_BUILDING;
    case MAP_TYPE_UNDERWATER:
        return BATTLE_TERRAIN_UNDERWATER;
    case MAP_TYPE_6:
        if (MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior))
            return BATTLE_TERRAIN_WATER;
        return BATTLE_TERRAIN_PLAIN;
    }
    if (sub_8057568(tileBehavior))
        return BATTLE_TERRAIN_WATER;
    if (MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior))
        return BATTLE_TERRAIN_POND;
    if (sub_80574D8(tileBehavior))
        return BATTLE_TERRAIN_MOUNTAIN;
    if (TestPlayerAvatarFlags((1 << 3)))
    {
        if (sub_8057450(tileBehavior))
            return BATTLE_TERRAIN_POND;
        if (MetatileBehavior_IsBridge(tileBehavior) == 1)
            return BATTLE_TERRAIN_WATER;
    }
    if (gSaveBlock1.location.mapGroup == 0 && gSaveBlock1.location.mapNum == MAP_ID_ROUTE113)
        return BATTLE_TERRAIN_SAND;
    if (GetSav1Weather() == 8)
        return BATTLE_TERRAIN_SAND;
    return BATTLE_TERRAIN_PLAIN;
}

static s8 GetBattleTransitionTypeByMap(void)
{
    u16 tileBehavior;
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
    if (Overworld_GetFlashLevel())
        return 2;
    if (!MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior))
    {
        switch (gMapHeader.mapType)
        {
        case MAP_TYPE_UNDERGROUND:
            return 1;
        case MAP_TYPE_UNDERWATER:
            return 3;
        default:
            return 0;
        }
    }
    return 3;
}

static u16 GetSumOfPlayerPartyLevel(u8 numMons)
{
    u8 sum = 0;
    int i;

    for (i = 0; i < 6; i++)
    {
        u32 species = GetMonData(&gPlayerParty[i], 65);

        if (species != SPECIES_EGG && species != SPECIES_NONE && GetMonData(&gPlayerParty[i], 57) != 0)
        {
            sum += GetMonData(&gPlayerParty[i], 56);
            numMons--;
            if (numMons == 0)
                break;
        }
    }
    return sum;
}

static u8 GetSumOfEnemyPartyLevel(u16 opponentId, u8 numMons)
{
    u8 i;
    u8 sum;
    u32 count = numMons;
    void *party;

    if (gTrainers[opponentId].partySize < count)
        count = gTrainers[opponentId].partySize;

    sum = 0;

    switch (gTrainers[opponentId].partyFlags)
    {
    case 0:
        party = gTrainers[opponentId].party;
        for (i = 0; i < count; i++)
            sum += ((struct TrainerPartyMember0 *)party)[i].level;
        break;
    case 1:
        party = gTrainers[opponentId].party;
        for (i = 0; i < count; i++)
            sum += ((struct TrainerPartyMember1 *)party)[i].level;
        break;
    case 2:
        party = gTrainers[opponentId].party;
        for (i = 0; i < count; i++)
            sum += ((struct TrainerPartyMember2 *)party)[i].level;
        break;
    case 3:
        party = gTrainers[opponentId].party;
        for (i = 0; i < count; i++)
            sum += ((struct TrainerPartyMember3 *)party)[i].level;
        break;
    }

    return sum;
}

static u8 GetWildBattleTransition(void)
{
    u8 transitionType = GetBattleTransitionTypeByMap();
    u8 enemyLevel = GetMonData(&gEnemyParty[0], 56);
    u8 playerLevel = GetSumOfPlayerPartyLevel(1);

    if (enemyLevel < playerLevel)
        return gBattleTransitionTable_Wild[transitionType][0];
    else
        return gBattleTransitionTable_Wild[transitionType][1];
}

static u8 GetTrainerBattleTransition(void)
{
    const struct Trainer *trainer;
    u8 minPartyCount;
    u8 transitionType;
    u8 enemyLevel;
    u8 playerLevel;

    if (gTrainerBattleOpponent == 1024)
        return 16;

    trainer = gTrainers;

    if (trainer[gTrainerBattleOpponent].trainerClass == 24)
    {
        if (gTrainerBattleOpponent == 261)
            return 12;
        if (gTrainerBattleOpponent == 262)
            return 13;
        if (gTrainerBattleOpponent == 263)
            return 14;
        if (gTrainerBattleOpponent == 264)
            return 15;
        return 16;
    }

    if (trainer[gTrainerBattleOpponent].trainerClass == 32)
        return 16;

    if (trainer[gTrainerBattleOpponent].doubleBattle == 1)
        minPartyCount = 2;
    else
        minPartyCount = 1;

    transitionType = GetBattleTransitionTypeByMap();
    enemyLevel = GetSumOfEnemyPartyLevel(gTrainerBattleOpponent, minPartyCount);
    playerLevel = GetSumOfPlayerPartyLevel(minPartyCount);
    if (enemyLevel < playerLevel)
        return gBattleTransitionTable_Trainer[transitionType][0];
    else
        return gBattleTransitionTable_Trainer[transitionType][1];
}

u8 BattleSetup_GetBattleTowerBattleTransition(void)
{
    u8 enemyLevel = GetMonData(&gEnemyParty[0], 56);
    u8 playerLevel = GetSumOfPlayerPartyLevel(1);

    if (enemyLevel < playerLevel)
        return 4;
    else
        return 3;
}

void ScrSpecial_ChooseStarter(void)
{
    SetMainCallback2(CB2_ChooseStarter);
    gMain.savedCallback = CB2_GiveStarter;
}

static void CB2_GiveStarter(void)
{
    u16 starterPoke;

    *GetVarPointer(0x4023) = gScriptResult;
    starterPoke = GetStarterPokemon(gScriptResult);
    ScriptGiveMon(starterPoke, 5, 0, 0, 0, 0);
    ResetTasks();
    sub_80408BC();
    SetMainCallback2(CB2_StartFirstBattle);
    BattleTransition_Start(0);
}

static void CB2_StartFirstBattle(void)
{
    UpdatePaletteFade();
    RunTasks();

    if (IsBattleTransitionDone() == 1)
    {
        gBattleTypeFlags = 0x0010;
        gMain.savedCallback = CB2_EndFirstBattle;
        SetMainCallback2(sub_800E7C4);
        prev_quest_postbuffer_cursor_backup_reset();
        overworld_poison_timer_set();
        IncrementGameStat(7);
        IncrementGameStat(8);
    }
}

static void CB2_EndFirstBattle(void)
{
    Overworld_ClearSavedMusic();
    SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}


static u32 TrainerBattleLoadArg32(const u8 *ptr)
{
    return ((ptr)[0] | ((ptr)[1] << 8) | ((ptr)[2] << 16) | ((ptr)[3] << 24));
}

static u16 TrainerBattleLoadArg16(const u8 *ptr)
{
    return ((ptr)[0] | ((ptr)[1] << 8));
}

static u8 TrainerBattleLoadArg8(const u8 *ptr)
{
    return ((ptr)[0]);
}

static u16 CurrentOpponentTrainerFlag(void)
{
    return 0x500 + gTrainerBattleOpponent;
}

static bool32 IsPlayerDefeated(u32 battleOutcome)
{
    switch (battleOutcome)
    {
    case 2:
    case 3:
        return 1;
    case 1:
    case 4:
    case 5:
    case 6:
    case 7:
        return 0;
    }
    return 0;
}

static void sub_80822BC(void)
{
    sTrainerBattleMode = 0;
    gTrainerBattleOpponent = 0;
    sTrainerMapObjectLocalId = 0;
    sTrainerIntroSpeech = 0;
    sTrainerDefeatSpeech = 0;
    sTrainerVictorySpeech = 0;
    sTrainerCannotBattleSpeech = 0;
    sTrainerBattleScriptRetAddr = 0;
    sTrainerBattleEndScript = 0;
}

static void TrainerBattleLoadArgs(const struct TrainerBattleParameter *specs, const u8 *data)
{
    while (1)
    {
        switch (specs->ptrType)
        {
        case TRAINER_PARAM_LOAD_VAL_8BIT:
            *(u8 *)specs->varPtr = TrainerBattleLoadArg8(data);
            data += 1;
            break;
        case TRAINER_PARAM_LOAD_VAL_16BIT:
            *(u16 *)specs->varPtr = TrainerBattleLoadArg16(data);
            data += 2;
            break;
        case TRAINER_PARAM_LOAD_VAL_32BIT:
            *(u32 *)specs->varPtr = TrainerBattleLoadArg32(data);
            data += 4;
            break;
        case TRAINER_PARAM_CLEAR_VAL_8BIT:
            *(u8 *)specs->varPtr = 0;
            break;
        case TRAINER_PARAM_CLEAR_VAL_16BIT:
            *(u16 *)specs->varPtr = 0;
            break;
        case TRAINER_PARAM_CLEAR_VAL_32BIT:
            *(u32 *)specs->varPtr = 0;
            break;
        case TRAINER_PARAM_LOAD_SCRIPT_RET_ADDR:
            *(const u8 **)specs->varPtr = data;
            return;
        }
        specs++;
    }
}

static void battle_80801F0(void)
{
    if (sTrainerMapObjectLocalId)
    {
        gScriptLastTalked = sTrainerMapObjectLocalId;
        gSelectedMapObject = GetFieldObjectIdByLocalIdAndMap(sTrainerMapObjectLocalId, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
    }
}

u8 *BattleSetup_ConfigureTrainerBattle(const u8 *data)
{
    sub_80822BC();
    sTrainerBattleMode = TrainerBattleLoadArg8(data);

    switch (sTrainerBattleMode)
    {
    case 3:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_3, data);
        return gUnknown_0819F878;
    case 4:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_2, data);
        battle_80801F0();
        return gUnknown_0819F840;
    case 1:
    case 2:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_1, data);
        battle_80801F0();
        return gUnknown_0819F818;
    case 6:
    case 8:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_4, data);
        battle_80801F0();
        return gUnknown_0819F840;
    case 7:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_2, data);
        battle_80801F0();
        gTrainerBattleOpponent = sub_8082C4C(gTrainerBattleOpponent);
        return gUnknown_0819F8AE;
    case 5:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_0, data);
        battle_80801F0();
        gTrainerBattleOpponent = sub_8082C4C(gTrainerBattleOpponent);
        return gUnknown_0819F887;
    default:
        TrainerBattleLoadArgs(gTrainerBattleSpecs_0, data);
        battle_80801F0();
        return gUnknown_0819F818;
    }
}

void TrainerWantsBattle(u8 trainerMapObjId, u8 *trainerScript)
{
    gSelectedMapObject = trainerMapObjId;
    gScriptLastTalked = gMapObjects[trainerMapObjId].localId;
    BattleSetup_ConfigureTrainerBattle(trainerScript + 1);
    ScriptContext1_SetupScript(gUnknown_0819F80B);
    ScriptContext2_Enable();
}

bool32 GetTrainerFlagFromScriptPointer(u8 *data)
{
    u32 flag = TrainerBattleLoadArg16(data + 2);
    return FlagGet(0x500 + flag);
}

void sub_8082524(void)
{
    struct MapObject *mapObject = &gMapObjects[gSelectedMapObject];

    npc_set_running_behaviour_etc(mapObject, npc_running_behaviour_by_direction(mapObject->mapobj_unk_18));
}

u8 ScrSpecial_GetTrainerBattleMode(void)
{
    return sTrainerBattleMode;
}

u8 ScrSpecial_HasTrainerBeenFought(void)
{
    return FlagGet(CurrentOpponentTrainerFlag());
}

void SetCurrentTrainerBattledFlag(void)
{
    FlagSet(CurrentOpponentTrainerFlag());
}

void unref_sub_8082590(void)
{
    FlagSet(CurrentOpponentTrainerFlag());
}

u8 HasTrainerAlreadyBeenFought(u16 flag)
{
    return FlagGet(0x500 + flag);
}

void trainer_flag_set(u16 flag)
{
    FlagSet(0x500 + flag);
}

void trainer_flag_clear(u16 flag)
{
    FlagClear(0x500 + flag);
}

void BattleSetup_StartTrainerBattle(void)
{
    gBattleTypeFlags = 0x0008;
    gMain.savedCallback = sub_808260C;
    StartTheBattle();
    ScriptContext1_Stop();
}

void sub_808260C(void)
{
    if (gTrainerBattleOpponent == 1024)
    {
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
    }
    else if (IsPlayerDefeated(gBattleOutcome) == 1)
    {
        SetMainCallback2(CB2_WhiteOut);
    }
    else
    {
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
        SetCurrentTrainerBattledFlag();
    }
}

void CB2_EndTrainerEyeRematchBattle(void)
{
    if (gTrainerBattleOpponent == 1024)
    {
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
    }
    else if (IsPlayerDefeated(gBattleOutcome) == 1)
    {
        SetMainCallback2(CB2_WhiteOut);
    }
    else
    {
        SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
        SetCurrentTrainerBattledFlag();
        SetTrainerFlagsAfterTrainerEyeRematch();
    }
}

void ScrSpecial_StartTrainerEyeRematch(void)
{
    gBattleTypeFlags = 0x0008;
    gMain.savedCallback = CB2_EndTrainerEyeRematchBattle;
    StartTheBattle();
    ScriptContext1_Stop();
}

static const u8 *GetTrainerIntroSpeech(void);
static const u8 *GetTrainerNonBattlingSpeech(void);

void ScrSpecial_ShowTrainerIntroSpeech(void)
{
    ShowFieldMessage(GetTrainerIntroSpeech());
}

u8 *BattleSetup_GetScriptAddrAfterBattle(void)
{
    if (sTrainerBattleScriptRetAddr)
        return sTrainerBattleScriptRetAddr;
    else
        return gUnknown_081C6C02;
}

u8 *BattleSetup_GetTrainerPostBattleScript(void)
{
    if (sTrainerBattleEndScript)
        return sTrainerBattleEndScript;
    else
        return gUnknown_081C6C02;
}

void ScrSpecial_ShowTrainerNonBattlingSpeech(void)
{
    ShowFieldMessage(GetTrainerNonBattlingSpeech());
}

void PlayTrainerEncounterMusic(void)
{
    u16 music;

    if (sTrainerBattleMode != 1 && sTrainerBattleMode != 8)
    {
        switch (sub_803FC58(gTrainerBattleOpponent))
        {
        case 0:
            music = BGM_BOYEYE;
            break;
        case 1:
            music = BGM_GIRLEYE;
            break;
        case 2:
            music = BGM_SYOUJOEYE;
            break;
        case 4:
            music = BGM_HAGESHII;
            break;
        case 5:
            music = BGM_KAKKOII;
            break;
        case 6:
            music = BGM_AQA_0;
            break;
        case 7:
            music = BGM_MGM0;
            break;
        case 8:
            music = BGM_SWIMEYE;
            break;
        case 9:
            music = BGM_HUTAGO;
            break;
        case 10:
            music = BGM_SITENNOU;
            break;
        case 11:
            music = BGM_YAMA_EYE;
            break;
        case 12:
            music = BGM_INTER_V;
            break;
        case 13:
            music = BGM_TEST;
            break;
        default:
            music = BGM_AYASII;
        }
        PlayNewMapMusic(music);
    }
}


static const u8 *SanitizeString(const u8 *str)
{
    if (str)
        return str;
    else
        return gOtherText_CancelWithTerminator;
}

static const u8 *GetTrainerIntroSpeech(void)
{
    return SanitizeString(sTrainerIntroSpeech);
}

u8 *sub_8082830(void)
{
    const u8 *str;

    if (gTrainerBattleOpponent == 1024)
        str = sub_80BCCE8();
    else
        str = sTrainerDefeatSpeech;

    StringExpandPlaceholders(gStringVar4, SanitizeString(str));
    return gStringVar4;
}

const u8 *unref_sub_808286C(void)
{
    return SanitizeString(sTrainerVictorySpeech);
}

static const u8 *GetTrainerNonBattlingSpeech(void)
{
    return SanitizeString(sTrainerCannotBattleSpeech);
}

s32 sub_8082894(const struct TrainerEyeTrainer *trainers, u16 opponentId)
{
    s32 i;

    for (i = 0; i < 56; i++)
    {
        if (trainers[i].opponentIDs[0] == opponentId)
            return i;
    }
    return -1;
}

s32 sub_80828B8(const struct TrainerEyeTrainer *trainers, u16 opponentId)
{
    s32 i;
    s32 j;

    for (i = 0; i < 56; i++)
    {
        for (j = 0; j < 5 && trainers[i].opponentIDs[j] != 0; j++)
        {
            if (trainers[i].opponentIDs[j] == opponentId)
                return i;
        }
    }
    return -1;
}

bool32 UpdateRandomTrainerEyeRematches(const struct TrainerEyeTrainer *trainers, u16 mapGroup, u16 mapNum)
{
    int i;
    bool32 ret = 0;

    for (i = 0; i < 56; i++)
    {
        if (trainers[i].mapGroup == mapGroup && trainers[i].mapNum == mapNum)
        {
            if (gSaveBlock1.trainerRematches[i] != 0)
            {

                ret = 1;
            }
            else if (HasTrainerAlreadyBeenFought(trainers[i].opponentIDs[0]) == 1
             && (Random() % 100) <= 30)
            {
                int rematches = 1;

                while (rematches < 5 && trainers[i].opponentIDs[rematches] != 0
                 && HasTrainerAlreadyBeenFought(trainers[i].opponentIDs[rematches]))
                    rematches++;
                gSaveBlock1.trainerRematches[i] = rematches;
                ret = 1;
            }
        }
    }
   return ret;
}

s32 sub_80829A8(const struct TrainerEyeTrainer *trainers, u16 mapGroup, u16 mapNum)
{
    s32 i;

    for (i = 0; i < 56; i++)
    {
        if (trainers[i].mapGroup == mapGroup && trainers[i].mapNum == mapNum && gSaveBlock1.trainerRematches[i])
            return 1;
    }
    return 0;
}

s32 sub_80829E8(const struct TrainerEyeTrainer *trainers, u16 mapGroup, u16 mapNum)
{
    s32 i;

    for (i = 0; i < 56; i++)
    {
        if (trainers[i].mapGroup == mapGroup && trainers[i].mapNum == mapNum)
            return 1;
    }
    return 0;
}

bool8 sub_8082A18(const struct TrainerEyeTrainer *trainers, u16 opponentId)
{
    s32 trainerEyeIndex = sub_8082894(trainers, opponentId);

    if (trainerEyeIndex != -1 && trainerEyeIndex < 100 && gSaveBlock1.trainerRematches[trainerEyeIndex])
        return 1;
    else
        return 0;
}

bool8 GetTrainerEyeRematchFlag(const struct TrainerEyeTrainer *trainers, u16 opponentId)
{
    s32 trainerEyeIndex = sub_80828B8(trainers, opponentId);

    if (trainerEyeIndex != -1 && trainerEyeIndex < 100 && gSaveBlock1.trainerRematches[trainerEyeIndex])
        return 1;
    else
        return 0;
}

u16 sub_8082A90(const struct TrainerEyeTrainer *trainers, u16 opponentId)
{
    int i;
    const struct TrainerEyeTrainer *trainer;
    s32 trainerEyeIndex = sub_8082894(trainers, opponentId);

    if (trainerEyeIndex == -1)
        return 0;
    trainer = &trainers[trainerEyeIndex];
    for (i = 1; i < 5; i++)
    {
        if (!trainer->opponentIDs[i])
            return trainer->opponentIDs[i - 1];
        if (!HasTrainerAlreadyBeenFought(trainer->opponentIDs[i]))
            return trainer->opponentIDs[i];
    }
    return trainer->opponentIDs[4];
}

void ClearTrainerEyeRematchFlag(const struct TrainerEyeTrainer *trainers, u16 opponentId)
{
    s32 trainerEyeIndex = sub_80828B8(trainers, opponentId);

    if (trainerEyeIndex != -1)
        gSaveBlock1.trainerRematches[trainerEyeIndex] = 0;
}

bool8 sub_8082B10(const struct TrainerEyeTrainer *trainers, u16 opponentId)
{
    s32 trainerEyeIndex = sub_8082894(trainers, opponentId);

    if (trainerEyeIndex != -1 && HasTrainerAlreadyBeenFought(trainers[trainerEyeIndex].opponentIDs[1]))
        return 1;
    else
        return 0;
}

bool32 sub_8082B44(void)
{
    int badgeCount = 0;
    u32 i;

    for (i = 0; i < 8; i++)
    {
        if (FlagGet(sBadgeFlags[i]) == 1)
        {
            badgeCount++;
            if (badgeCount >= 5)
                return 1;
        }
    }
    return 0;
}

void sub_8082B78(void)
{
    if (sub_8082B44())
    {
        if (gSaveBlock1.trainerRematchStepCounter >= 255)
            gSaveBlock1.trainerRematchStepCounter = 255;
        else
            gSaveBlock1.trainerRematchStepCounter++;
    }
}

bool32 sub_8082BA4(void)
{
    if (sub_8082B44() && gSaveBlock1.trainerRematchStepCounter >= 255)
        return 1;
    else
        return 0;
}

void sub_8082BD0(u16 mapGroup, u16 mapNum)
{
    if (sub_8082BA4() && UpdateRandomTrainerEyeRematches(gTrainerEyeTrainers, mapGroup, mapNum) == 1)
        gSaveBlock1.trainerRematchStepCounter = 0;
}

s32 sub_8082C0C(u16 mapGroup, u16 mapNum)
{
    return sub_80829A8(gTrainerEyeTrainers, mapGroup, mapNum);
}

s32 unref_sub_8082C2C(u16 mapGroup, u16 mapNum)
{
    return sub_80829E8(gTrainerEyeTrainers, mapGroup, mapNum);
}

u16 sub_8082C4C(u16 opponentId)
{
    return sub_8082A90(gTrainerEyeTrainers, opponentId);
}

s32 sub_8082C68(void)
{
    if (sub_8082A18(gTrainerEyeTrainers, gTrainerBattleOpponent))
        return 1;
    else
        return sub_8082B10(gTrainerEyeTrainers, gTrainerBattleOpponent);
}

u8 ScrSpecial_GetTrainerEyeRematchFlag(void)
{
    return GetTrainerEyeRematchFlag(gTrainerEyeTrainers, gTrainerBattleOpponent);
}

void SetTrainerFlagsAfterTrainerEyeRematch(void)
{
    ClearTrainerEyeRematchFlag(gTrainerEyeTrainers, gTrainerBattleOpponent);
    SetCurrentTrainerBattledFlag();
}
