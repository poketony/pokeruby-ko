# 1 "src/battle/battle_4.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/battle/battle_4.c"
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
# 2 "src/battle/battle_4.c" 2
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
# 3 "src/battle/battle_4.c" 2
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
# 4 "src/battle/battle_4.c" 2
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
# 5 "src/battle/battle_4.c" 2
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
# 6 "src/battle/battle_4.c" 2
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
# 7 "src/battle/battle_4.c" 2
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
# 8 "src/battle/battle_4.c" 2
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
# 9 "src/battle/battle_4.c" 2
# 1 "include/hold_effects.h" 1
# 10 "src/battle/battle_4.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 11 "src/battle/battle_4.c" 2
# 1 "include/rom3.h" 1



struct HpAndStatus
{
    u16 hp;
    u32 status;
};

struct DisableStruct;

void sub_800B858(void);
void setup_poochyena_battle();
void sub_800B950(void);
void sub_800B9A8(void);
void sub_800BA78(void);
void sub_800BD54(void);
void sub_800BF28(void);
void PrepareBufferDataTransferLink(u8 a, u16, u8 *c);
void sub_800C1A8(u8);
void sub_800C35C(void);
void sub_800C47C(u8);
void EmitGetAttributes(u8 a, u8 b, u8 c);
void Emitcmd1(u8 a, u8 b, u8 c);
void EmitLoadPokeSprite(u8 a);
void EmitSendOutPoke(u8, u8, u8);
void EmitReturnPokeToBall(u8 a, u8 b);
void EmitTrainerThrow(u8 a);
void EmitTrainerSlide(u8 a);
void EmitTrainerSlideBack(u8 a);
void Emitcmd10(u8 a);
void Emitcmd11(u8 a);
void Emitcmd12(u8 a);
void EmitBallThrow(u8 a, u8 b);
void EmitMoveAnimation(u8 a, u16 b, u8 c, u16 d, s32 e, u8 f, struct DisableStruct *g);
void EmitPrintString(u8 a, u16 b);
void EmitPrintStringPlayerOnly(u8 a, u16 stringID);
void Emitcmd18(u8 a, u8 b, u16 c);
void Emitcmd20(u8 a, u8 b, u8 c, u8 *d);
void EmitOpenBag(u8 a, u8 *b);
void EmitChoosePokemon(u8 a, u8 b, u8 c, u8 d, u8 *e);
void Emitcmd23(u8 a);
void EmitHealthBarUpdate(u8 a, u16 b);
void EmitExpBarUpdate(u8 a, u8 b, u16 c);
void EmitStatusIconUpdate(u8 a, u32 b, u32 c);
void EmitStatusAnimation(u8 a, u8 b, u32 c);
void EmitStatusXor(u8 a, u8 b);
void Emitcmd29(u8, u16, u8 *);
void Emitcmd33(u8 a, u8 b, u16 c);
void Emitcmd34(u8 a, u8 b, u8 *c);
void Emitcmd35(u8 a, u16 b);
void Emitcmd36(u8 a, u16 b);
void Emitcmd37(u8 a);
void Emitcmd38(u8 a, u8 b);
void Emitcmd39(u8 a);
void Emitcmd40(u8 a);
void EmitHitAnimation(u8 a);
void Emitcmd42(u8 a);
void EmitEffectivenessSound(u8 a, u16 b);
void Emitcmd44(u8 a, u16 b);
void EmitFaintingCry(u8 a);
void EmitIntroSlide(u8 a, u8 b);
void EmitTrainerBallThrow(u8 a);
void EmitDrawPartyStatusSummary(u8 a, struct HpAndStatus *hpAndStatus, u8 c);
void Emitcmd49(u8 a);
void Emitcmd50(u8 a);
void EmitSpriteInvisibility(u8 a, u8 b);
void EmitBattleAnimation(u8 a, u8 b, u16 c);
void EmitLinkStandbyMsg(u8 a, u8 b);
void EmitResetActionMoveSelection(u8 a, u8 b);
void Emitcmd55(u8 a, u8 b);
# 12 "src/battle/battle_4.c" 2
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
# 13 "src/battle/battle_4.c" 2
# 1 "include/pokemon.h" 1
# 14 "src/battle/battle_4.c" 2
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
# 15 "src/battle/battle_4.c" 2
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
# 16 "src/battle/battle_4.c" 2
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
# 17 "src/battle/battle_4.c" 2
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
# 18 "src/battle/battle_4.c" 2
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
# 19 "src/battle/battle_4.c" 2
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
# 20 "src/battle/battle_4.c" 2
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
# 21 "src/battle/battle_4.c" 2
# 1 "include/naming_screen.h" 1



# 1 "include/main.h" 1
# 5 "include/naming_screen.h" 2







enum
{
    NAMING_SCREEN_TEMPLATE_PLAYER_NAME,
    NAMING_SCREEN_TEMPLATE_BOX_NAME,
    NAMING_SCREEN_TEMPLATE_MON_NAME,
};

struct NamingScreenTemplate
{
    u8 unk0;
    u8 maxChars;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    const u8 *title;
};

struct NamingScreenData
{
          u8 state;
          u8 templateNum;
          u16 unk2;
          u16 bg1vOffset;
          u16 bg2vOffset;
          u16 unk8;
          u16 unkA;
          u8 unkC;
          u8 unkD;
          u8 currentPage;
          u8 cursorSpriteId;
          u8 unk10;
          u8 textBuffer[0x20];
          u8 filler21[0x13];
            const struct NamingScreenTemplate *template;
          u8 *destBuffer;
          u16 unk3C;
          u16 unk3E;
          u16 unk40;
          u32 unk42;
          MainCallback returnCallback;
          u8 koreanState;
          u8 backupBuffer[0x20];
};

enum
{
    PAGE_UPPER,
    PAGE_LOWER,
    PAGE_OTHERS,
};

enum
{
    MAIN_STATE_BEGIN_FADE_IN,
    MAIN_STATE_WAIT_FADE_IN,
    MAIN_STATE_HANDLE_INPUT,
    MAIN_STATE_MOVE_TO_OK_BUTTON,
    MAIN_STATE_START_PAGE_SWAP,
    MAIN_STATE_WAIT_PAGE_SWAP,
    MAIN_STATE_6,
    MAIN_STATE_UPDATE_SENT_TO_PC_MESSAGE,
    MAIN_STATE_BEGIN_FADE_OUT,
};

enum
{
    INPUT_STATE_DISABLED,
    INPUT_STATE_ENABLED,
};

void DoNamingScreen(u8 r0, u8 *r1, u16 r2, u16 r3, u32 s0, MainCallback s4);
# 22 "src/battle/battle_4.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 23 "src/battle/battle_4.c" 2


extern u8 gCritMultiplier;
extern s32 gBattleMoveDamage;
extern u32 gStatuses3[4];
extern u16 gBattleTypeFlags;
extern const u32 gBitTable[];
extern const struct BaseStats gBaseStats[];
extern struct BattleEnigmaBerry gEnigmaBerries[4];
extern struct BattlePokemon gBattleMons[4];
extern u8 gActiveBank;
extern u32 gBattleExecBuffer;
extern u8 gNoOfAllBanks;
extern u16 gBattlePartyID[4];
extern u8 gTurnOrder[4];
extern u8 gUnknown_02024A76[4];
extern u16 gCurrentMove;
extern u8 gLastUsedAbility;
extern u16 gBattleWeather;
extern u8 gStringBank;
extern u8 gEffectBank;
extern u8 gAbsentBankFlags;
extern u8 gMultiHitCounter;
extern u16 gLastUsedMove[4];
extern u16 gLockedMove[4];
extern u16 gChosenMovesByBanks[4];
extern u16 gSideAffecting[2];
extern u16 gPauseCounterBattle;
extern u16 gPaydayMoney;
extern u16 gRandomTurnNumber;
extern u8 gBattleOutcome;
extern u8 gBattleTerrain;
extern u16 gTrainerBattleOpponent;
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u8* gBattlescriptCurrInstr;
extern u8 gCurrMovePos;
extern u8 gFightStateTracker;
extern u32 gHitMarker;
extern u8 gBattleMoveFlags;
extern u8 gBattleCommunication[];
extern u16 gMoveHitWith[4];
extern u16 gUnknown_02024C44[4];
extern u8 gStringBank;
extern u16 gDynamicBasePower;
extern const u8 gTypeEffectiveness[];
extern u16 gLastUsedItem;
extern u16 gBattleMovePower;
extern s32 gHP_dealt;
extern s32 gTakenDmg[4];
extern u8 gTakenDmgBanks[4];
extern const u16 gMissStrings[];
extern u8 gSentPokesToOpponent[2];
extern u8 gBank1;
extern u16 gExpShareExp;
extern u8 gBattleTextBuff1[];
extern u8 gBattleTextBuff2[];
extern u8 gBattleTextBuff3[];
extern u8 gLeveledUpInBattle;
extern void (*gBattleMainFunc)(void);
extern struct Window gUnknown_03004210;
extern const u8 BattleText_YesNo[];
extern u8 gPlayerPartyCount;
extern u16 gMoveToLearn;
extern const u8 gTrainerMoney[];
extern u16 gRandomMove;
extern u8* gBattleScriptsEffectsTable[];
extern u16 gUnknown_02024BE8;
extern u8 gBankInMenu;
extern u8 gActionForBanks[4];
extern u16 gUnknown_02024C2C[4];
extern u16 gUnknown_030041B0;
extern u16 gUnknown_02024C4C[4];
extern u8 gCurrentMoveTurn;
extern u16 gTrappingMoves[];


u8 AtkCanceller_UnableToUseMove(void);
void PressurePPLose(u8 bank_atk, u8 bank_def, u16 move);
void CancelMultiTurnMoves(u8 bank);
void b_movescr_stack_push(u8* BS_ptr);
void b_movescr_stack_push_cursor(void);
void RecordAbilityBattle(u8 bank, u8 ability);
void RecordItemBattle(u8 bank, u8 holdEffect);
int IsPokeDisobedient(void);
static bool8 IsTwoTurnsMove(u16 move);
static void DestinyBondFlagUpdate(void);
static void b_wonderguard_and_levitate(void);
u8 GetBankIdentity(u8 bank);
u8 GetBankSide(u8 bank);
u8 GetBattleBank(u8 bankValue);
s32 CalculateBaseDamage(struct BattlePokemon *attacker, struct BattlePokemon *defender, u32 move, u16 a4, u16 powerOverride, u8 typeOverride, u8 bank_atk, u8 bank_def);
static u8 AttacksThisTurn(u8 bank, u16 move);
void UndoEffectsAfterFainting(void);
void BattleMusicStop(void);
void PlayBGM(u16 songID);
void MonGainEVs(struct Pokemon*, u16 defeatedSpecies);
extern u8 gBattleBufferB[4][0x200];
void sub_80324F8(struct Pokemon*, u8 bank);
void AdjustFriendship(struct Pokemon*, u8 value);
bool8 IsTradedMon(struct Pokemon*);
void b_movescr_stack_pop_cursor(void);
void SwitchInClearStructs(void);
u8* ConvertIntToDecimalStringN(u8*, s32, u8, u8);
u8 GetSetPokedexFlag(u16 nationalNum, u8 caseID);
u16 SpeciesToNationalPokedexNum(u16 species);
u8 sub_803FC34(u8 bank);
u16 sub_803FBFC(u8 a);
u8 GetBankByPlayerAI(u8 ID);
void sub_8012258(u8);
void sub_80157C4(u8 bank);

u16 GiveMoveToBattleMon(struct BattlePokemon *mon, u16 move);
void IncrementGameStat(u8 index);
u8 GetScaledHPFraction(s16 hp, s16 maxhp, u8 scale);
u16 GetPokedexHeightWeight(u16 national_num, u8 heightweight);
u8 sub_814A5C0(u8 a1, u16 a2, u8 a3, u16 a4, u8 a5);
void DestroyMenuCursor(void);
void sub_802BC6C(void);
void sub_809D9F0(struct Pokemon *party, u8, u8, void *, u32);
u8 sub_809FA30(void);
bool32 IsHMMove2(u16 move);
void sub_802BBD4(u8 r0, u8 r1, u8 r2, u8 r3, u8 sp0);
void nullsub_6(void);
void ReshowBattleScreenAfterMenu(void);
void sub_800F808(void);
void AddMoney(u32* moneySaveblock, u32 to_give);
void sub_80156DC(void);
bool8 sub_8014AB8(u8 bank);
u8 CountAliveMons(u8 caseID);
void sub_803E1B0(struct Pokemon*, u16 item, u8 partyID, u8 r3, u8 sp);
u8 CanRunFromBattle(void);
u8 GetMoveTarget(u16 move, u8 targetbyte);
void sub_80153D0(u8 atk);
u8 CastformDataTypeChange(u8 bank);
void b_push_move_exec(u8* bs_ptr);
u8 Overworld_GetMapTypeOfSaveblockLocation(void);
u8 CalculatePlayerPartyCount(void);
u16 Sqrt(u32 num);
u8 sub_809070C(u16 nationalNum, u32 TiD, u32 PiD);
void sub_814A880(u8 a1, u8 a2);
u8 CheckMoveLimitations(u8 bank, u8 unusable_moves, u8 flags);
void sub_801529C(u8 bank);
bool8 IsLinkDoubleBattle(void);
void sub_8094B6C(u8 bank, u8 partyID, u8 r2);


extern u8 BattleScript_EndTurn[];
extern u8 BattleScript_NoPPForMove[];
extern u8 BattleScript_MagicCoatBounce[];
extern u8 BattleScript_TookAttack[];
extern u8 BattleScript_SnatchedMove[];
extern u8 BattleScript_Pausex20[];
extern u8 BattleScript_SubstituteFade[];
extern u8 BattleScript_HangedOnMsg[];
extern u8 BattleScript_OneHitKOMsg[];
extern u8 BattleScript_EnduredMsg[];
extern u8 BattleScript_PSNPrevention[];
extern u8 BattleScript_BRNPrevention[];
extern u8 BattleScript_PRLZPrevention[];
extern u8 BattleScript_FlinchPrevention[];
extern u8 BattleScript_StatUp[];
extern u8 BattleScript_StatDown[];
extern u8 BattleScript_NoItemSteal[];
extern u8 BattleScript_ItemSteal[];
extern u8 BattleScript_RapidSpinAway[];
extern u8 BattleScript_TargetPRLZHeal[];
extern u8 BattleScript_KnockedOff[];
extern u8 BattleScript_LevelUp[];
extern u8 BattleScript_WrapFree[];
extern u8 BattleScript_LeechSeedFree[];
extern u8 BattleScript_SpikesFree[];
extern u8 BattleScript_ButItFailed[];
extern u8 BattleScript_ObliviousPreventsAttraction[];
extern u8 BattleScript_MistProtected[];
extern u8 BattleScript_AbilityNoStatLoss[];
extern u8 BattleScript_AbilityNoSpecificStatLoss[];
extern u8 BattleScript_TrainerBallBlock[];
extern u8 BattleScript_WallyBallThrow[];
extern u8 BattleScript_SuccessBallThrow[];
extern u8 BattleScript_ShakeBallThrow[];
extern u8 BattleScript_AllStatsUp[];
extern u8 BattleScript_AtkDefDown[];
extern u8 BattleScript_SAtkDown2[];

extern u8 gUnknown_081D919F[];
extern u8 gUnknown_081D9171[];
extern u8 gUnknown_081D91CD[];
extern u8 BattleScript_1D6F44[];
extern u8 BattleScript_1D83B5[];
extern u8 BattleScript_1D839B[];
extern u8 BattleScript_1D6F74[];
extern u8 BattleScript_CastformChange[];
extern u8 gUnknown_081D9834[];
extern u8 gUnknown_081D90FC[];
extern u8 gUnknown_081D95DB[];
extern u8 gUnknown_081D8C58[];
extern u8 gUnknown_081D8C65[];
extern u8 gUnknown_081D9156[];
extern u8 gUnknown_081D9468[];
# 280 "src/battle/battle_4.c"
static void atk00_attackcanceler(void);
static void atk01_accuracycheck(void);
static void atk02_attackstring(void);
static void atk03_ppreduce(void);
static void atk04_critcalc(void);
static void atk05_damagecalc1(void);
static void atk06_typecalc(void);
static void atk07_dmg_adjustment(void);
static void atk08_dmg_adjustment2(void);
static void atk09_attackanimation(void);
static void atk0A_waitanimation(void);
static void atk0B_healthbarupdate(void);
static void atk0C_datahpupdate(void);
static void atk0D_critmessage(void);
static void atk0E_effectiveness_sound(void);
static void atk0F_resultmessage(void);
static void atk10_printstring(void);
static void atk11_printstring_playeronly(void);
static void atk12_waitmessage(void);
static void atk13_printfromtable(void);
static void atk14_printfromtable_playeronly(void);
static void atk15_seteffectwithchancetarget(void);
static void atk16_seteffectprimary(void);
static void atk17_seteffectsecondary(void);
static void atk18_status_effect_clear(void);
static void atk19_faint_pokemon(void);
static void atk1A_faint_animation(void);
static void atk1B_faint_effects_clear(void);
static void atk1C_jumpifstatus(void);
static void atk1D_jumpifstatus2(void);
static void atk1E_jumpifability(void);
static void atk1F_jumpifsideaffecting(void);
static void atk20_jumpifstat(void);
static void atk21_jumpifstatus3(void);
static void atk22_jumpiftype(void);
static void atk23_getexp(void);
static void atk24(void);
static void atk25_move_values_cleanup(void);
static void atk26_set_multihit(void);
static void atk27_decrement_multihit(void);
static void atk28_goto(void);
static void atk29_jumpifbyte(void);
static void atk2A_jumpifhalfword(void);
static void atk2B_jumpifword(void);
static void atk2C_jumpifarrayequal(void);
static void atk2D_jumpifarraynotequal(void);
static void atk2E_setbyte(void);
static void atk2F_addbyte(void);
static void atk30_subbyte(void);
static void atk31_copyarray(void);
static void atk32_copyarray_withindex(void);
static void atk33_orbyte(void);
static void atk34_orhalfword(void);
static void atk35_orword(void);
static void atk36_bicbyte(void);
static void atk37_bichalfword(void);
static void atk38_bicword(void);
static void atk39_pause(void);
static void atk3A_waitstate(void);
static void atk3B_healthbar_update(void);
static void atk3C_return(void);
static void atk3D_end(void);
static void atk3E_end2(void);
static void atk3F_end3(void);
static void atk40_jump_if_move_affected_by_protect(void);
static void atk41_call(void);
static void atk42_jumpiftype2(void);
static void atk43_jumpifabilitypresent(void);
static void atk44(void);
static void atk45_playanimation(void);
static void atk46_playanimation2(void);
static void atk47_setgraphicalstatchangevalues(void);
static void atk48_playstatchangeanimation(void);
static void atk49_moveendturn(void);
static void atk4A_typecalc2(void);
static void atk4B_return_atk_to_ball(void);
static void atk4C_copy_poke_data(void);
static void atk4D_switch_data_update(void);
static void atk4E_switchin_anim(void);
static void atk4F_jump_if_cannot_switch(void);
static void atk50_openpartyscreen(void);
static void atk51_switch_handle_order(void);
static void atk52_switch_in_effects(void);
static void atk53_trainer_slide(void);
static void atk54_effectiveness_sound(void);
static void atk55_play_sound(void);
static void atk56_fainting_cry(void);
static void atk57(void);
static void atk58_return_to_ball(void);
void atk59_learnmove_inbattle(void);
static void atk5A(void);
static void atk5B_80256E0(void);
static void atk5C_hitanimation(void);
static void atk5D_getmoneyreward(void);
static void atk5E_8025A70(void);
static void atk5F_8025B24(void);
static void atk60_increment_gamestat(void);
static void atk61_8025BA4(void);
static void atk62_08025C6C(void);
static void atk63_jumptorandomattack(void);
static void atk64_statusanimation(void);
static void atk65_status2animation(void);
static void atk66_chosenstatusanimation(void);
static void atk67_8025ECC(void);
static void atk68_80246A0(void);
static void atk69_dmg_adjustment2(void);
void atk6A_removeitem(void);
static void atk6B_atknameinbuff1(void);
static void atk6C_lvlbox_display(void);
static void atk6D_set_sentpokes_values(void);
static void atk6E_set_atk_to_player0(void);
static void atk6F_set_visible(void);
static void atk70_record_ability(void);
static void atk71_buffer_move_to_learn(void);
static void atk72_jump_if_can_run_frombattle(void);
static void atk73_hp_thresholds(void);
static void atk74_hp_thresholds2(void);
static void atk75_8026A58(void);
static void atk76_various(void);
static void atk77_setprotect(void);
static void atk78_faintifabilitynotdamp(void);
static void atk79_setatkhptozero(void);
static void atk7A_jumpwhiletargetvalid(void);
static void atk7B_healhalfHP_if_possible(void);
static void atk7C_8025508(void);
static void atk7D_set_rain(void);
static void atk7E_setreflect(void);
static void atk7F_setseeded(void);
static void atk80_manipulatedamage(void);
static void atk81_setrest(void);
static void atk82_jumpifnotfirstturn(void);
static void atk83_nop(void);
static void atk84_jump_if_cant_sleep(void);
static void atk85_stockpile(void);
static void atk86_stockpiletobasedamage(void);
static void atk87_stockpiletohpheal(void);
static void atk88_negativedamage(void);
static u8 ChangeStatBuffs(s8, u8, u8, u8*);
static void atk89_statbuffchange(void);
static void atk8A_normalisebuffs(void);
static void atk8B_setbide(void);
static void atk8C_confuseifrepeatingattackends(void);
static void atk8D_setmultihit_counter(void);
static void atk8E_prepare_multihit(void);
static void atk8F_forcerandomswitch(void);
static void atk90_conversion_type_change(void);
static void atk91_givepaydaymoney(void);
static void atk92_setlightscreen(void);
static void atk93_ko_move(void);
static void atk94_gethalfcurrentenemyhp(void);
static void atk95_setsandstorm(void);
static void atk96_weatherdamage(void);
static void atk97_try_infatuation(void);
static void atk98_status_icon_update(void);
static void atk99_setmist(void);
static void atk9A_set_focusenergy(void);
static void atk9B_transformdataexecution(void);
static void atk9C_set_substitute(void);
static void atk9D_copyattack(void);
static void atk9E_metronome(void);
static void atk9F_dmgtolevel(void);
static void atkA0_psywavedamageeffect(void);
static void atkA1_counterdamagecalculator(void);
static void atkA2_mirrorcoatdamagecalculator(void);
static void atkA3_disablelastusedattack(void);
static void atkA4_setencore(void);
static void atkA5_painsplitdmgcalc(void);
static void atkA6_settypetorandomresistance(void);
static void atkA7_setalwayshitflag(void);
static void atkA8_copymovepermanently(void);
static void atkA9_sleeptalk_choose_move(void);
static void atkAA_set_destinybond(void);
static void atkAB_DestinyBondFlagUpdate(void);
static void atkAC_remaininghptopower(void);
static void atkAD_spite_ppreduce(void);
static void atkAE_heal_party_status(void);
static void atkAF_cursetarget(void);
static void atkB0_set_spikes(void);
static void atkB1_set_foresight(void);
static void atkB2_setperishsong(void);
static void atkB3_rolloutdamagecalculation(void);
static void atkB4_jumpifconfusedandstatmaxed(void);
static void atkB5_furycuttercalc(void);
static void atkB6_happinesstodamagecalculation(void);
static void atkB7_presentdamagecalculation(void);
static void atkB8_set_safeguard(void);
static void atkB9_magnitudedamagecalculation(void);
static void atkBA_jumpifnopursuitswitchdmg(void);
static void atkBB_setsunny(void);
static void atkBC_maxattackhalvehp(void);
static void atkBD_copyfoestats(void);
static void atkBE_breakfree(void);
static void atkBF_set_defense_curl(void);
static void atkC0_recoverbasedonsunlight(void);
static void atkC1_hidden_power(void);
static void atkC2_selectnexttarget(void);
static void atkC3_setfutureattack(void);
static void atkC4_beat_up(void);
static void atkC5_hidepreattack(void);
static void atkC6_unhidepostattack(void);
static void atkC7_setminimize(void);
static void atkC8_sethail(void);
static void atkC9_jumpifattackandspecialattackcannotfall(void);
static void atkCA_setforcedtarget(void);
static void atkCB_setcharge(void);
static void atkCC_callterrainattack(void);
static void atkCD_cureifburnedparalysedorpoisoned(void);
static void atkCE_settorment(void);
static void atkCF_jumpifnodamage(void);
static void atkD0_settaunt(void);
static void atkD1_set_helpinghand(void);
static void atkD2_swap_items(void);
static void atkD3_copy_ability(void);
static void atkD4_wish_effect(void);
static void atkD5_setroots(void);
static void atkD6_doubledamagedealtifdamaged(void);
static void atkD7_setyawn(void);
static void atkD8_setdamagetohealthdifference(void);
static void atkD9_scaledamagebyhealthratio(void);
static void atkDA_abilityswap(void);
static void atkDB_imprisoneffect(void);
static void atkDC_setgrudge(void);
static void atkDD_weightdamagecalculation(void);
static void atkDE_asistattackselect(void);
static void atkDF_setmagiccoat(void);
static void atkE0_setstealstatchange(void);
static void atkE1_intimidate_string_loader(void);
static void atkE2_switchout_abilities(void);
static void atkE3_jumpiffainted(void);
static void atkE4_getsecretpowereffect(void);
static void atkE5_pickup(void);
static void atkE6_castform_change_animation(void);
static void atkE7_castform_data_change(void);
static void atkE8_settypebasedhalvers(void);
static void atkE9_setweatherballtype(void);
static void atkEA_recycleitem(void);
static void atkEB_settypetoterrain(void);
static void atkEC_pursuit_sth(void);
static void atkED_802B4B4(void);
static void atkEE_removelightscreenreflect(void);
void atkEF_pokeball_catch_calculation(void);
static void atkF0_copy_caught_poke(void);
static void atkF1_setpoke_as_caught(void);
static void atkF2_display_dex_info(void);
static void atkF3_nickname_caught_poke(void);
static void atkF4_802BEF0(void);
static void atkF5_removeattackerstatus1(void);
static void atkF6_802BF48(void);
static void atkF7_802BF54(void);

const BattleCmdFunc gBattleScriptingCommandsTable[] =
{
    atk00_attackcanceler,
    atk01_accuracycheck,
    atk02_attackstring,
    atk03_ppreduce,
    atk04_critcalc,
    atk05_damagecalc1,
    atk06_typecalc,
    atk07_dmg_adjustment,
    atk08_dmg_adjustment2,
    atk09_attackanimation,
    atk0A_waitanimation,
    atk0B_healthbarupdate,
    atk0C_datahpupdate,
    atk0D_critmessage,
    atk0E_effectiveness_sound,
    atk0F_resultmessage,
    atk10_printstring,
    atk11_printstring_playeronly,
    atk12_waitmessage,
    atk13_printfromtable,
    atk14_printfromtable_playeronly,
    atk15_seteffectwithchancetarget,
    atk16_seteffectprimary,
    atk17_seteffectsecondary,
    atk18_status_effect_clear,
    atk19_faint_pokemon,
    atk1A_faint_animation,
    atk1B_faint_effects_clear,
    atk1C_jumpifstatus,
    atk1D_jumpifstatus2,
    atk1E_jumpifability,
    atk1F_jumpifsideaffecting,
    atk20_jumpifstat,
    atk21_jumpifstatus3,
    atk22_jumpiftype,
    atk23_getexp,
    atk24,
    atk25_move_values_cleanup,
    atk26_set_multihit,
    atk27_decrement_multihit,
    atk28_goto,
    atk29_jumpifbyte,
    atk2A_jumpifhalfword,
    atk2B_jumpifword,
    atk2C_jumpifarrayequal,
    atk2D_jumpifarraynotequal,
    atk2E_setbyte,
    atk2F_addbyte,
    atk30_subbyte,
    atk31_copyarray,
    atk32_copyarray_withindex,
    atk33_orbyte,
    atk34_orhalfword,
    atk35_orword,
    atk36_bicbyte,
    atk37_bichalfword,
    atk38_bicword,
    atk39_pause,
    atk3A_waitstate,
    atk3B_healthbar_update,
    atk3C_return,
    atk3D_end,
    atk3E_end2,
    atk3F_end3,
    atk40_jump_if_move_affected_by_protect,
    atk41_call,
    atk42_jumpiftype2,
    atk43_jumpifabilitypresent,
    atk44,
    atk45_playanimation,
    atk46_playanimation2,
    atk47_setgraphicalstatchangevalues,
    atk48_playstatchangeanimation,
    atk49_moveendturn,
    atk4A_typecalc2,
    atk4B_return_atk_to_ball,
    atk4C_copy_poke_data,
    atk4D_switch_data_update,
    atk4E_switchin_anim,
    atk4F_jump_if_cannot_switch,
    atk50_openpartyscreen,
    atk51_switch_handle_order,
    atk52_switch_in_effects,
    atk53_trainer_slide,
    atk54_effectiveness_sound,
    atk55_play_sound,
    atk56_fainting_cry,
    atk57,
    atk58_return_to_ball,
    atk59_learnmove_inbattle,
    atk5A,
    atk5B_80256E0,
    atk5C_hitanimation,
    atk5D_getmoneyreward,
    atk5E_8025A70,
    atk5F_8025B24,
    atk60_increment_gamestat,
    atk61_8025BA4,
    atk62_08025C6C,
    atk63_jumptorandomattack,
    atk64_statusanimation,
    atk65_status2animation,
    atk66_chosenstatusanimation,
    atk67_8025ECC,
    atk68_80246A0,
    atk69_dmg_adjustment2,
    atk6A_removeitem,
    atk6B_atknameinbuff1,
    atk6C_lvlbox_display,
    atk6D_set_sentpokes_values,
    atk6E_set_atk_to_player0,
    atk6F_set_visible,
    atk70_record_ability,
    atk71_buffer_move_to_learn,
    atk72_jump_if_can_run_frombattle,
    atk73_hp_thresholds,
    atk74_hp_thresholds2,
    atk75_8026A58,
    atk76_various,
    atk77_setprotect,
    atk78_faintifabilitynotdamp,
    atk79_setatkhptozero,
    atk7A_jumpwhiletargetvalid,
    atk7B_healhalfHP_if_possible,
    atk7C_8025508,
    atk7D_set_rain,
    atk7E_setreflect,
    atk7F_setseeded,
    atk80_manipulatedamage,
    atk81_setrest,
    atk82_jumpifnotfirstturn,
    atk83_nop,
    atk84_jump_if_cant_sleep,
    atk85_stockpile,
    atk86_stockpiletobasedamage,
    atk87_stockpiletohpheal,
    atk88_negativedamage,
    atk89_statbuffchange,
    atk8A_normalisebuffs,
    atk8B_setbide,
    atk8C_confuseifrepeatingattackends,
    atk8D_setmultihit_counter,
    atk8E_prepare_multihit,
    atk8F_forcerandomswitch,
    atk90_conversion_type_change,
    atk91_givepaydaymoney,
    atk92_setlightscreen,
    atk93_ko_move,
    atk94_gethalfcurrentenemyhp,
    atk95_setsandstorm,
    atk96_weatherdamage,
    atk97_try_infatuation,
    atk98_status_icon_update,
    atk99_setmist,
    atk9A_set_focusenergy,
    atk9B_transformdataexecution,
    atk9C_set_substitute,
    atk9D_copyattack,
    atk9E_metronome,
    atk9F_dmgtolevel,
    atkA0_psywavedamageeffect,
    atkA1_counterdamagecalculator,
    atkA2_mirrorcoatdamagecalculator,
    atkA3_disablelastusedattack,
    atkA4_setencore,
    atkA5_painsplitdmgcalc,
    atkA6_settypetorandomresistance,
    atkA7_setalwayshitflag,
    atkA8_copymovepermanently,
    atkA9_sleeptalk_choose_move,
    atkAA_set_destinybond,
    atkAB_DestinyBondFlagUpdate,
    atkAC_remaininghptopower,
    atkAD_spite_ppreduce,
    atkAE_heal_party_status,
    atkAF_cursetarget,
    atkB0_set_spikes,
    atkB1_set_foresight,
    atkB2_setperishsong,
    atkB3_rolloutdamagecalculation,
    atkB4_jumpifconfusedandstatmaxed,
    atkB5_furycuttercalc,
    atkB6_happinesstodamagecalculation,
    atkB7_presentdamagecalculation,
    atkB8_set_safeguard,
    atkB9_magnitudedamagecalculation,
    atkBA_jumpifnopursuitswitchdmg,
    atkBB_setsunny,
    atkBC_maxattackhalvehp,
    atkBD_copyfoestats,
    atkBE_breakfree,
    atkBF_set_defense_curl,
    atkC0_recoverbasedonsunlight,
    atkC1_hidden_power,
    atkC2_selectnexttarget,
    atkC3_setfutureattack,
    atkC4_beat_up,
    atkC5_hidepreattack,
    atkC6_unhidepostattack,
    atkC7_setminimize,
    atkC8_sethail,
    atkC9_jumpifattackandspecialattackcannotfall,
    atkCA_setforcedtarget,
    atkCB_setcharge,
    atkCC_callterrainattack,
    atkCD_cureifburnedparalysedorpoisoned,
    atkCE_settorment,
    atkCF_jumpifnodamage,
    atkD0_settaunt,
    atkD1_set_helpinghand,
    atkD2_swap_items,
    atkD3_copy_ability,
    atkD4_wish_effect,
    atkD5_setroots,
    atkD6_doubledamagedealtifdamaged,
    atkD7_setyawn,
    atkD8_setdamagetohealthdifference,
    atkD9_scaledamagebyhealthratio,
    atkDA_abilityswap,
    atkDB_imprisoneffect,
    atkDC_setgrudge,
    atkDD_weightdamagecalculation,
    atkDE_asistattackselect,
    atkDF_setmagiccoat,
    atkE0_setstealstatchange,
    atkE1_intimidate_string_loader,
    atkE2_switchout_abilities,
    atkE3_jumpiffainted,
    atkE4_getsecretpowereffect,
    atkE5_pickup,
    atkE6_castform_change_animation,
    atkE7_castform_data_change,
    atkE8_settypebasedhalvers,
    atkE9_setweatherballtype,
    atkEA_recycleitem,
    atkEB_settypetoterrain,
    atkEC_pursuit_sth,
    atkED_802B4B4,
    atkEE_removelightscreenreflect,
    atkEF_pokeball_catch_calculation,
    atkF0_copy_caught_poke,
    atkF1_setpoke_as_caught,
    atkF2_display_dex_info,
    atkF3_nickname_caught_poke,
    atkF4_802BEF0,
    atkF5_removeattackerstatus1,
    atkF6_802BF48,
    atkF7_802BF54,
};

struct statFractions
{
    u8 dividend;
    u8 divisor;
};

static const struct statFractions gAccuracyStageRatios[] =
{
    { 33, 100},
    { 36, 100},
    { 43, 100},
    { 50, 100},
    { 60, 100},
    { 75, 100},
    { 1, 1},
    {133, 100},
    {166, 100},
    { 2, 1},
    {233, 100},
    {133, 50},
    { 3, 1},
};


static const u16 gCriticalHitChance[] = {16, 8, 4, 3, 2};

static const u32 gStatusFlagsForMoveEffects[] =
{
    0x00000000,
    0x00000007,
    0x00000008,
    0x00000010,
    0x00000020,
    0x00000040,
    0x00000080,
    0x00000007,
    0x00000008,
    0x00000000,
    0x00000070,
    0x00000000,
    0x00001000,
    0x0000E000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00400000,
    0x00000000,
    0x00000000,
    0x04000000,
    0x08000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000C00,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000
};

extern u8 BattleScript_1D963E[];
extern u8 BattleScript_1D965A[];
extern u8 BattleScript_1D9669[];
extern u8 BattleScript_1D9678[];
extern u8 BattleScript_1D9687[];
extern u8 BattleScript_1D969D[];
extern u8 BattleScript_1D96BA[];
extern u8 BattleScript_1D9696[];
extern u8 BattleScript_1D96B1[];
extern u8 BattleScript_1D96AA[];
extern u8 BattleScript_1D96C8[];

u8* const gMoveEffectBS_Ptrs[] =
{
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D965A,
    BattleScript_1D9669,
    BattleScript_1D9678,
    BattleScript_1D9687,
    BattleScript_1D969D,
    BattleScript_1D96BA,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D9696,
    BattleScript_1D96AA,
    BattleScript_1D963E,
    BattleScript_1D96B1,
    BattleScript_1D96C8,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D963E,
    BattleScript_1D96C8
};

const u8 sUnreferencedBitMask1[] = {0, 1, 3, 7, 0xF, 0x1F, 0x3F};

const u8 gLevelUpStatBoxStats[] = {58, 62, 59, 63, 60, 61};

static const u16 sProtectSuccessRates[] = {0xFFFF, 0x7FFF, 0x3FFF, 0x1FFF};

static const u16 sUnknown_081FACFE[] =
{
     MOVE_METRONOME,
     MOVE_STRUGGLE,
     MOVE_SKETCH,
     MOVE_MIMIC,
     0xFFFE,
     MOVE_COUNTER,
     MOVE_MIRROR_COAT,
     MOVE_PROTECT,
     MOVE_DETECT,
     MOVE_ENDURE,
     MOVE_DESTINY_BOND,
     MOVE_SLEEP_TALK,
     MOVE_THIEF,
     MOVE_FOLLOW_ME,
     MOVE_SNATCH,
     MOVE_HELPING_HAND,
     MOVE_COVET,
     MOVE_TRICK,
     MOVE_FOCUS_PUNCH,
     0xFFFF
};

static const u8 sUnknown_081FAD26[] =
{
    1, 200,
    4, 150,
    9, 100,
    16, 80,
    32, 40,
    48, 20
};

static const u16 sNaturePowerMoves[] =
{
    MOVE_STUN_SPORE,
    MOVE_RAZOR_LEAF,
    MOVE_EARTHQUAKE,
    MOVE_HYDRO_PUMP,
    MOVE_SURF,
    MOVE_BUBBLE_BEAM,
    MOVE_ROCK_SLIDE,
    MOVE_SHADOW_BALL,
    MOVE_SWIFT,
    MOVE_SWIFT
};



static const u16 sWeightDamage[] =
{
    100, 20,
    250, 40,
    500, 60,
    1000, 80,
    2000, 100,
    -1, -1
};

static const u16 sPickupItems[] =
{
    ITEM_SUPER_POTION, 30,
    ITEM_FULL_HEAL, 40,
    ITEM_ULTRA_BALL, 50,
    ITEM_RARE_CANDY, 60,
    ITEM_FULL_RESTORE, 70,
    ITEM_REVIVE, 80,
    ITEM_NUGGET, 90,
    ITEM_PROTEIN, 95,
    ITEM_PP_UP, 99,
    ITEM_KINGS_ROCK, 1
};

static const u8 sTerrainToType[] =
{
    0x0c,
    0x0c,
    0x04,
    0x0b,
    0x0b,
    0x0b,
    0x05 ,
    0x05 ,
    0x00,
    0x00,
};

static const u8 sBallCatchBonuses[] =
{
    20, 15, 10, 15
};

static void atk00_attackcanceler(void)
{
    int i;
    if (gBattleOutcome)
    {
        gFightStateTracker = 0xC;
        return;
    }
    if (gBattleMons[gBankAttacker].hp == 0 && !(gHitMarker & 0x00000200))
    {
        gHitMarker |= 0x00080000;
        gBattlescriptCurrInstr = BattleScript_EndTurn;
        return;
    }
    if (AtkCanceller_UnableToUseMove())
        return;
    if (AbilityBattleEffects(2, gBankTarget, 0, 0, 0))
        return;
    if (!gBattleMons[gBankAttacker].pp[gCurrMovePos] && gCurrentMove != MOVE_STRUGGLE && !(gHitMarker & 0x800200)
     && !(gBattleMons[gBankAttacker].status2 & 0x00001000))
    {
        gBattlescriptCurrInstr = BattleScript_NoPPForMove;
        gBattleMoveFlags |= (1 << 0);
        return;
    }
    gHitMarker &= ~(0x00800000);
    if (!(gHitMarker & 0x02000000) && !(gBattleMons[gBankAttacker].status2 & 0x00001000))
    {
        u8 disobedient = IsPokeDisobedient();
        asm("":::"r0");
        asm("":::"r1");
        if ((disobedient))
        {
            if (disobedient == 2)
                gHitMarker |= 0x02000000;
            else
                gBattleMoveFlags |= (1 << 0);
            return;
        }
    }
    gHitMarker |= 0x02000000;
    if (gProtectStructs[gBankTarget].bounceMove && gBattleMoves[gCurrentMove].flags & 0x4)
    {
        PressurePPLose(gBankAttacker, gBankTarget, MOVE_MAGIC_COAT);
        gProtectStructs[gBankTarget].bounceMove = 0;
        b_movescr_stack_push_cursor();
        gBattlescriptCurrInstr = BattleScript_MagicCoatBounce;
        return;
    }
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if ((gProtectStructs[gTurnOrder[i]].stealMove) && gBattleMoves[gCurrentMove].flags & 0x8)
        {
            PressurePPLose(gBankAttacker, gTurnOrder[i], MOVE_SNATCH);
            gProtectStructs[gTurnOrder[i]].stealMove = 0;
            ((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive = gTurnOrder[i];
            b_movescr_stack_push_cursor();
            gBattlescriptCurrInstr = BattleScript_SnatchedMove;
            return;
        }
    }
    if (gSpecialStatuses[gBankTarget].lightningRodRedirected)
    {
        gSpecialStatuses[gBankTarget].lightningRodRedirected = 0;
        gLastUsedAbility = ABILITY_LIGHTNING_ROD;
        b_movescr_stack_push_cursor();
        gBattlescriptCurrInstr = BattleScript_TookAttack;
        RecordAbilityBattle(gBankTarget, gLastUsedAbility);
    }
    else if (((gProtectStructs[gBankTarget].protected && gBattleMoves[gCurrentMove].flags & 0x2))
     && (gCurrentMove != MOVE_CURSE || (gBattleMons[gBankAttacker].type1 == 0x07 || gBattleMons[gBankAttacker].type2 == 0x07))
     && ((!IsTwoTurnsMove(gCurrentMove) || (gBattleMons[gBankAttacker].status2 & 0x00001000))))
    {
        CancelMultiTurnMoves(gBankAttacker);
        gBattleMoveFlags |= (1 << 0);
        gMoveHitWith[gBankTarget] = 0;
        gUnknown_02024C44[gBankTarget] = 0;
        gBattleCommunication[6] = 1;
        gBattlescriptCurrInstr++;
    }
    else
    {
        gBattlescriptCurrInstr++;
    }
}

static void JumpIfMoveFailed(u8 adder, u16 move)
{
    void* to_store = gBattlescriptCurrInstr + adder;
    if (gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5))))
    {
        gMoveHitWith[gBankTarget] = 0;
        gUnknown_02024C44[gBankTarget] = 0;
        to_store = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
    else
    {
        DestinyBondFlagUpdate();
        if (AbilityBattleEffects(3, gBankTarget, 0, 0, move))
            return;
    }
    gBattlescriptCurrInstr = to_store;
}

static void atk40_jump_if_move_affected_by_protect(void)
{
    if (((gProtectStructs[gBankTarget].protected && gBattleMoves[gCurrentMove].flags & 0x2)))
    {
        gBattleMoveFlags |= (1 << 0);
        JumpIfMoveFailed(5, 0);
        gBattleCommunication[6] = 1;
    }
    else
    {
        gBattlescriptCurrInstr += 5;
    }
}

static bool8 JumpIfMoveAffectedByProtect(u16 move)
{
    bool8 affected = 0;
    if (((gProtectStructs[gBankTarget].protected && gBattleMoves[gCurrentMove].flags & 0x2)))
    {
        gBattleMoveFlags |= (1 << 0);
        JumpIfMoveFailed(7, move);
        gBattleCommunication[6] = 1;
        affected = 1;
    }
    return affected;
}

static bool8 AccuracyCalcHelper(u16 move)
{
    if (gStatuses3[gBankTarget] & 0x18 && gDisableStructs[gBankTarget].bankWithSureHit == gBankAttacker)
    {
        JumpIfMoveFailed(7, move);
        return 1;
    }

    if (!(gHitMarker & 0x00010000) && gStatuses3[gBankTarget] & 0x40)
    {
        gBattleMoveFlags |= (1 << 0);
        JumpIfMoveFailed(7, move);
        return 1;
    }
    gHitMarker &= ~0x00010000;

    if (!(gHitMarker & 0x00020000) && gStatuses3[gBankTarget] & 0x80)
    {
        gBattleMoveFlags |= (1 << 0);
        JumpIfMoveFailed(7, move);
        return 1;
    }
    gHitMarker &= ~0x00020000;

    if (!(gHitMarker & 0x00040000) && gStatuses3[gBankTarget] & 0x40000)
    {
        gBattleMoveFlags |= (1 << 0);
        JumpIfMoveFailed(7, move);
        return 1;
    }
    gHitMarker &= ~0x00040000;

    if ((((!AbilityBattleEffects(0x13, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(0x13, 0, ABILITY_AIR_LOCK, 0, 0))) && (gBattleWeather & (((1 << 0) | (1 << 1) | (1 << 2)))) && gBattleMoves[move].effect == EFFECT_THUNDER)
     || (gBattleMoves[move].effect == EFFECT_ALWAYS_HIT || gBattleMoves[move].effect == EFFECT_VITAL_THROW))
    {
        JumpIfMoveFailed(7, move);
        return 1;
    }
    return 0;
}

static void atk01_accuracycheck(void)
{
    u16 move = ((gBattlescriptCurrInstr + 5)[0] + ((gBattlescriptCurrInstr + 5)[1] << 8));
    if (move == 0xFFFE || move == 0xFFFF)
    {
        if (gStatuses3[gBankTarget] & 0x18 && move == 0xFFFF && gDisableStructs[gBankTarget].bankWithSureHit == gBankAttacker)
            gBattlescriptCurrInstr += 7;
        else if (gStatuses3[gBankTarget] & (0x40 | 0x80 | 0x40000))
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
        else if (!JumpIfMoveAffectedByProtect(0))
            gBattlescriptCurrInstr += 7;
    }
    else
    {
        u8 type; s8 buff; u8 MoveAcc; u16 calc; u8 hold_effect; u8 quality;
        if (move == 0) {move = gCurrentMove;}

        if (((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType)
            type = ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType & 0x3F;
        else
            type = gBattleMoves[move].type;

        if (JumpIfMoveAffectedByProtect(move))
            return;
        if (AccuracyCalcHelper(move))
            return;

        if (gBattleMons[gBankTarget].status2 & 0x20000000)
        {
            u8 acc = gBattleMons[gBankAttacker].statStages[STAT_STAGE_ACC];
            buff = acc;
        }
        else
        {
            u8 acc = gBattleMons[gBankAttacker].statStages[STAT_STAGE_ACC];
            buff = acc + 6 - gBattleMons[gBankTarget].statStages[STAT_STAGE_EVASION];
        }

        if (buff < 0) {buff = 0;}
        if (buff > 0xC) {buff = 0xC;}

        MoveAcc = gBattleMoves[move].accuracy;

        if (((!AbilityBattleEffects(0x13, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(0x13, 0, ABILITY_AIR_LOCK, 0, 0))) && gBattleWeather & (((1 << 5) | (1 << 6))) && gBattleMoves[move].effect == EFFECT_THUNDER)
            MoveAcc = 50;

        calc = gAccuracyStageRatios[buff].dividend * MoveAcc;
        calc /= gAccuracyStageRatios[buff].divisor;

        if (gBattleMons[gBankAttacker].ability == ABILITY_COMPOUND_EYES)
            calc = (calc * 130) / 100;
        if (((!AbilityBattleEffects(0x13, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(0x13, 0, ABILITY_AIR_LOCK, 0, 0))) && gBattleMons[gBankTarget].ability == ABILITY_SAND_VEIL && gBattleWeather & (((1 << 3) | (1 << 4))))
            calc = (calc * 80) / 100;
        if (gBattleMons[gBankAttacker].ability == ABILITY_HUSTLE && type < 9)
            calc = (calc * 80) / 100;

        if (gBattleMons[gBankTarget].item == ITEM_ENIGMA_BERRY)
            hold_effect = gEnigmaBerries[gBankTarget].holdEffect, quality = gEnigmaBerries[gBankTarget].holdEffectParam;
        else
        {
            hold_effect = ItemId_GetHoldEffect(gBattleMons[gBankTarget].item);
            quality = ItemId_GetHoldEffectParam(gBattleMons[gBankTarget].item);
        }

        gStringBank = gBankTarget;

        if (hold_effect == 22)
            calc = (calc * (100 - quality)) / 100;


        if ((Random() % 100 + 1) > calc)
        {
            gBattleMoveFlags |= (1 << 0);
            if (gBattleTypeFlags & 0x0001 && (gBattleMoves[move].target == 0x8 || gBattleMoves[move].target == 0x20))
                gBattleCommunication[6] = 2;
            else
                gBattleCommunication[6] = 0;
            b_wonderguard_and_levitate();

        }
        JumpIfMoveFailed(7, move);
    }
}

static void atk02_attackstring(void)
{
    if (gBattleExecBuffer)
         return;
    if (!(gHitMarker & (0x00000200 | 0x00000400)))
    {
        PrepareStringBattle(4, gBankAttacker);
        gHitMarker |= 0x00000400;
    }
    gBattlescriptCurrInstr++;
    gBattleCommunication[0x7] = 0;
}

static void atk03_ppreduce(void)
{
    int to_deduct = 1;
    if (gBattleExecBuffer)
        return;
    if (!gSpecialStatuses[gBankAttacker].flag20)
    {
        switch (gBattleMoves[gCurrentMove].target)
        {
        case 0x20:
            to_deduct += AbilityBattleEffects(0x12, gBankAttacker, ABILITY_PRESSURE, 0, 0);
            break;
        case 0x8:
        case 0x40:
            to_deduct += AbilityBattleEffects(0x10, gBankAttacker, ABILITY_PRESSURE, 0, 0);
            break;
        default:
            if (gBankAttacker != gBankTarget && gBattleMons[gBankTarget].ability == ABILITY_PRESSURE)
                to_deduct++;
            break;
        }
    }
    if (!(gHitMarker & (0x00000800 | 0x00000200)) && gBattleMons[gBankAttacker].pp[gCurrMovePos])
    {
        gProtectStructs[gBankAttacker].notFirstStrike = 1;
        if (gBattleMons[gBankAttacker].pp[gCurrMovePos] > to_deduct)
            gBattleMons[gBankAttacker].pp[gCurrMovePos] -= to_deduct;
        else
            gBattleMons[gBankAttacker].pp[gCurrMovePos] = 0;

        if (!(gBattleMons[gBankAttacker].status2 & 0x00200000)
            && !((gDisableStructs[gBankAttacker].unk18_b) & gBitTable[gCurrMovePos]))
        {
            gActiveBank = gBankAttacker;
            EmitSetAttributes(0, 0x9 + gCurrMovePos, 0, 1, &gBattleMons[gBankAttacker].pp[gCurrMovePos]);
            MarkBufferBankForExecution(gBankAttacker);
        }
    }
    gHitMarker &= ~(0x00000800);
    gBattlescriptCurrInstr++;
}

static void atk04_critcalc(void)
{
    u8 hold_effect; u16 item; u16 crit_chance; int adderv3, adderv5, adderv6, adderv7, adderv8, adderv9, adderv10, adderv11; u16 adderv12;
    item = gBattleMons[gBankAttacker].item;
    if (item == ITEM_ENIGMA_BERRY)
        hold_effect = gEnigmaBerries[gBankAttacker].holdEffect;
    else
        hold_effect = ItemId_GetHoldEffect(item);

    gStringBank = gBankAttacker;

    if (gBattleMons[gBankAttacker].status2 & 0x00100000)
        adderv3 = 2;
    else
        adderv3 = 0;

    if (gBattleMoves[gCurrentMove].effect == EFFECT_HIGH_CRITICAL) {adderv3++;}
    adderv5 = adderv3;
    if (gBattleMoves[gCurrentMove].effect == EFFECT_SKY_ATTACK) {adderv5 = adderv3 + 1;}

    if (gBattleMoves[gCurrentMove].effect == EFFECT_BLAZE_KICK) {adderv5++;}
    adderv6 = adderv5;
    if (gBattleMoves[gCurrentMove].effect == EFFECT_POISON_TAIL) {adderv6 = adderv5 + 1;}

    adderv7 = 0;
    if (hold_effect == 63 && gBattleMons[gBankAttacker].species == SPECIES_CHANSEY) {adderv7 = 1;}
    adderv8 = 2 * adderv7;
    adderv9 = 0;
    if (hold_effect == 66 && gBattleMons[gBankAttacker].species == SPECIES_FARFETCHD) {adderv9 = 1;}
    adderv11 = 2 * adderv9;
    if (hold_effect == 41)
        {adderv10 = 1 + adderv6 + adderv8; adderv12 = adderv10 + adderv11;}
    else
        {adderv10 = adderv6 + adderv8; adderv12 = adderv10 + adderv11;}

    crit_chance = adderv12;

    if (crit_chance > 4) {crit_chance = 4;}

    if ((gBattleMons[gBankTarget].ability != ABILITY_BATTLE_ARMOR && gBattleMons[gBankTarget].ability != ABILITY_SHELL_ARMOR)
     && !(gStatuses3[gBankAttacker] & 0x8000)
     && !(gBattleTypeFlags & (0x0200 | 0x0010))
     && !(Random() % gCriticalHitChance[crit_chance]))
        gCritMultiplier = 2;
    else
        gCritMultiplier = 1;
    gBattlescriptCurrInstr++;
}

static void atk05_damagecalc1(void)
{
    u16 side_hword = gSideAffecting[GetBankIdentity(gBankTarget) & 1];
    gBattleMoveDamage = CalculateBaseDamage(&gBattleMons[gBankAttacker], &gBattleMons[gBankTarget], gCurrentMove,
                                            side_hword, gDynamicBasePower,
                                            ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType, gBankAttacker, gBankTarget);
    gBattleMoveDamage = gBattleMoveDamage * gCritMultiplier * ((struct BattleStruct *) (gSharedMem + 0x0))->dmgMultiplier;

    if (gStatuses3[gBankAttacker] & 0x200 && gBattleMoves[gCurrentMove].type == 0x0d)
        gBattleMoveDamage *= 2;
    if (gProtectStructs[gBankAttacker].helpingHand)
        gBattleMoveDamage = gBattleMoveDamage * 15 / 10;

    gBattlescriptCurrInstr++;
}

void AI_CalcDmg(u8 BankAtk, u8 BankDef)
{
    u16 side_hword = gSideAffecting[GetBankIdentity(BankDef) & 1];
    gBattleMoveDamage = CalculateBaseDamage(&gBattleMons[BankAtk], &gBattleMons[BankDef], gCurrentMove,
                                            side_hword, gDynamicBasePower,
                                            ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType, BankAtk, BankDef);
    gDynamicBasePower = 0;
    gBattleMoveDamage = gBattleMoveDamage * gCritMultiplier * ((struct BattleStruct *) (gSharedMem + 0x0))->dmgMultiplier;

    if (gStatuses3[BankAtk] & 0x200 && gBattleMoves[gCurrentMove].type == 0x0d)
        gBattleMoveDamage *= 2;
    if (gProtectStructs[BankAtk].helpingHand)
        gBattleMoveDamage = gBattleMoveDamage * 15 / 10;
}

static void ModulateDmgByType(u8 multiplier)
{
    gBattleMoveDamage = gBattleMoveDamage * multiplier / 10;
    if (gBattleMoveDamage == 0 && multiplier != 0)
        gBattleMoveDamage = 1;

    switch (multiplier)
    {
    case 0:
        gBattleMoveFlags |= (1 << 3);
        gBattleMoveFlags &= ~(1 << 2);
        gBattleMoveFlags &= ~(1 << 1);
        break;
    case 5:
        if (gBattleMoves[gCurrentMove].power && !(gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5)))))
        {
            if (gBattleMoveFlags & (1 << 1))
                gBattleMoveFlags &= ~(1 << 1);
            else
                gBattleMoveFlags |= (1 << 2);
        }
        break;
    case 20:
        if (gBattleMoves[gCurrentMove].power && !(gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5)))))
        {
            if (gBattleMoveFlags & (1 << 2))
                gBattleMoveFlags &= ~(1 << 2);
            else
                gBattleMoveFlags |= (1 << 1);
        }
        break;
    }
}

static void atk06_typecalc(void)
{
    int i = 0;
    u8 move_type;
    if (gCurrentMove != MOVE_STRUGGLE)
    {
        if (((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType)
            move_type = ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType & 0x3F;
        else
            move_type = gBattleMoves[gCurrentMove].type;


        if (gBattleMons[gBankAttacker].type1 == move_type || gBattleMons[gBankAttacker].type2 == move_type)
        {
            gBattleMoveDamage = gBattleMoveDamage * 15;
            gBattleMoveDamage = gBattleMoveDamage / 10;
        }

        if (gBattleMons[gBankTarget].ability == ABILITY_LEVITATE && move_type == 0x04)
        {
            gLastUsedAbility = gBattleMons[gBankTarget].ability;
            gBattleMoveFlags |= ((1 << 0) | (1 << 3));
            gMoveHitWith[gBankTarget] = 0;
            gUnknown_02024C44[gBankTarget] = 0;
            gBattleCommunication[6] = move_type;
            RecordAbilityBattle(gBankTarget, gLastUsedAbility);
        }
        else
        {
            while (gTypeEffectiveness[i]!= 0xFF)
            {
                if (gTypeEffectiveness[i] == 0xFE)
                {
                    if (gBattleMons[gBankTarget].status2 & 0x20000000)
                        break;
                    i += 3;
                    continue;
                }

                else if (gTypeEffectiveness[i] == move_type)
                {

                    if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type1)
                        ModulateDmgByType(gTypeEffectiveness[i + 2]);

                    if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type2 &&
                        gBattleMons[gBankTarget].type1 != gBattleMons[gBankTarget].type2)
                        ModulateDmgByType(gTypeEffectiveness[i + 2]);
                }
                i += 3;
            }
        }

        if (gBattleMons[gBankTarget].ability == ABILITY_WONDER_GUARD && AttacksThisTurn(gBankAttacker, gCurrentMove) == 2
         && (!(gBattleMoveFlags & (1 << 1)) || ((gBattleMoveFlags & ((1 << 1) | (1 << 2))) == ((1 << 1) | (1 << 2))))
         && gBattleMoves[gCurrentMove].power)
        {
            gLastUsedAbility = ABILITY_WONDER_GUARD;
            gBattleMoveFlags |= (1 << 0);
            gMoveHitWith[gBankTarget] = 0;
            gUnknown_02024C44[gBankTarget] = 0;
            gBattleCommunication[6] = 3;
            RecordAbilityBattle(gBankTarget, gLastUsedAbility);
        }
        if (gBattleMoveFlags & (1 << 3))
            gProtectStructs[gBankAttacker].notEffective = 1;
    }
    gBattlescriptCurrInstr++;
}
static void b_wonderguard_and_levitate(void)
{
    u8 flags = 0;
    int i = 0;
    u8 move_type;

    if (gCurrentMove == MOVE_STRUGGLE || !gBattleMoves[gCurrentMove].power)
        return;

    if (((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType)
        move_type = ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType & 0x3F;
    else
        move_type = gBattleMoves[gCurrentMove].type;

    if (gBattleMons[gBankTarget].ability == ABILITY_LEVITATE && move_type == 0x04)
    {
        (gLastUsedAbility = ABILITY_LEVITATE, gBattleCommunication[6] = move_type, RecordAbilityBattle(gBankTarget, ABILITY_LEVITATE));
        return;
    }

    while (gTypeEffectiveness[i]!= 0xFF)
    {
        if (gTypeEffectiveness[i] == 0xFE)
        {
            if (gBattleMons[gBankTarget].status2 & 0x20000000)
                break;
            i += 3;
            continue;
        }

        if (gTypeEffectiveness[i] == move_type)
        {

            if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type1 && gTypeEffectiveness[i + 2] == 0)
            {
                gBattleMoveFlags |= (1 << 3);
                gProtectStructs[gBankAttacker].notEffective = 1;
            }
            if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type2 &&
                gBattleMons[gBankTarget].type1 != gBattleMons[gBankTarget].type2 &&
                gTypeEffectiveness[i + 2] == 0)
            {
                gBattleMoveFlags |= (1 << 3);
                gProtectStructs[gBankAttacker].notEffective = 1;
            }


            if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type1 && gTypeEffectiveness[i + 2] == 20)
                flags |= 1;
            if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type2
             && gBattleMons[gBankTarget].type1 != gBattleMons[gBankTarget].type2
             && gTypeEffectiveness[i + 2] == 20)
                flags |= 1;


            if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type1 && gTypeEffectiveness[i + 2] == 5)
                flags |= 2;
            if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type2
             && gBattleMons[gBankTarget].type1 != gBattleMons[gBankTarget].type2
             && gTypeEffectiveness[i + 2] == 5)
                flags |= 2;
        }
        i += 3;
    }

    if (gBattleMons[gBankTarget].ability == ABILITY_WONDER_GUARD && AttacksThisTurn(gBankAttacker, gCurrentMove) == 2)
    {
        if (((flags & 2) || !(flags & 1)) && gBattleMoves[gCurrentMove].power)
        {
            (gLastUsedAbility = ABILITY_WONDER_GUARD, gBattleCommunication[6] = 3, RecordAbilityBattle(gBankTarget, ABILITY_WONDER_GUARD));
        }
    }
}

static void ModulateDmgByType2(u8 multiplier, u16 move, u8* flags)
{
    gBattleMoveDamage = gBattleMoveDamage * multiplier / 10;
    if (gBattleMoveDamage == 0 && multiplier != 0)
        gBattleMoveDamage = 1;

    switch (multiplier)
    {
    case 0:
        *flags |= (1 << 3);
        *flags &= ~(1 << 2);
        *flags &= ~(1 << 1);
        break;
    case 5:
        if (gBattleMoves[move].power && !(*flags & (((1 << 0) | (1 << 3) | (1 << 5)))))
        {
            if (*flags & (1 << 1))
                *flags &= ~(1 << 1);
            else
                *flags |= (1 << 2);
        }
        break;
    case 20:
        if (gBattleMoves[move].power && !(*flags & (((1 << 0) | (1 << 3) | (1 << 5)))))
        {
            if (*flags & (1 << 2))
                *flags &= ~(1 << 2);
            else
                *flags |= (1 << 1);
        }
        break;
    }
}

u8 TypeCalc(u16 move, u8 bank_atk, u8 bank_def)
{
    int i = 0;
    u8 flags = 0;
    u8 move_type;

    if (move == MOVE_STRUGGLE)
        return 0;

    move_type = gBattleMoves[move].type;


    if (gBattleMons[bank_atk].type1 == move_type || gBattleMons[bank_atk].type2 == move_type)
    {
        gBattleMoveDamage = gBattleMoveDamage * 15;
        gBattleMoveDamage = gBattleMoveDamage / 10;
    }

    if (gBattleMons[bank_def].ability == ABILITY_LEVITATE && move_type == 0x04)
    {
        flags |= ((1 << 0) | (1 << 3));
    }
    else
    {
        while (gTypeEffectiveness[i]!= 0xFF)
        {
            if (gTypeEffectiveness[i] == 0xFE)
            {
                if (gBattleMons[bank_def].status2 & 0x20000000)
                    break;
                i += 3;
                continue;
            }

            else if (gTypeEffectiveness[i] == move_type)
            {

                if (gTypeEffectiveness[i + 1] == gBattleMons[bank_def].type1)
                    ModulateDmgByType2(gTypeEffectiveness[i + 2], move, &flags);

                if (gTypeEffectiveness[i + 1] == gBattleMons[bank_def].type2 &&
                    gBattleMons[gBankTarget ].type1 != gBattleMons[bank_def].type2)
                    ModulateDmgByType2(gTypeEffectiveness[i + 2], move, &flags);
            }
            i += 3;
        }
    }

    if (gBattleMons[bank_def].ability == ABILITY_WONDER_GUARD && !(flags & (1 << 0)) &&
        AttacksThisTurn(bank_atk, move) == 2 &&
        (!(flags & (1 << 1)) || ((flags & ((1 << 1) | (1 << 2))) == ((1 << 1) | (1 << 2)))) &&
        gBattleMoves[move].power)
    {
        flags |= (1 << 0);
    }
    return flags;
}

u8 AI_TypeCalc(u16 move, u16 species, u8 ability)
{
    int i = 0;
    u8 flags = 0;
    u8 type1 = gBaseStats[species].type1, type2 = gBaseStats[species].type2, move_type;

    if (move == MOVE_STRUGGLE)
        return 0;

    move_type = gBattleMoves[move].type;

    if (ability == ABILITY_LEVITATE && move_type == 0x04)
        flags = (1 << 0) | (1 << 3);
    else
    {
        while (gTypeEffectiveness[i]!= 0xFF)
        {
            if (gTypeEffectiveness[i] == 0xFE)
            {
                i += 3;
                continue;
            }
            if (gTypeEffectiveness[i] == move_type)
            {

                if (gTypeEffectiveness[i + 1] == type1)
                    ModulateDmgByType2(gTypeEffectiveness[i + 2], move, &flags);

                if (gTypeEffectiveness[i + 1] == type2 && gBattleMons[gBankTarget].type1 != type2)
                    ModulateDmgByType2(gTypeEffectiveness[i + 2], move, &flags);
            }
            i += 3;
        }
    }
    if (ability == ABILITY_WONDER_GUARD
     && (!(flags & (1 << 1)) || ((flags & ((1 << 1) | (1 << 2))) == ((1 << 1) | (1 << 2))))
     && gBattleMoves[move].power)
        flags |= (1 << 3);
    return flags;
}


static inline void ApplyRandomDmgMultiplier(void)
{
    u16 rand = Random();
    u16 randPercent = 100 - (rand % 16);

    if (gBattleMoveDamage != 0)
    {
        gBattleMoveDamage *= randPercent;
        gBattleMoveDamage /= 100;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
    }
}

void Unused_ApplyRandomDmgMultiplier(void)
{
    ApplyRandomDmgMultiplier();
}

static void atk07_dmg_adjustment(void)
{
    u8 hold_effect, quality;
    ApplyRandomDmgMultiplier();
    if (gBattleMons[gBankTarget].item == ITEM_ENIGMA_BERRY)
    {
        hold_effect = gEnigmaBerries[gBankTarget].holdEffect, quality = gEnigmaBerries[gBankTarget].holdEffectParam;
    }
    else
    {
        hold_effect = ItemId_GetHoldEffect(gBattleMons[gBankTarget].item);
        quality = ItemId_GetHoldEffectParam(gBattleMons[gBankTarget].item);
    }

    gStringBank = gBankTarget;

    if (hold_effect == 39 && (Random() % 100) < quality)
    {
        RecordItemBattle(gBankTarget, hold_effect);
        gSpecialStatuses[gBankTarget].focusBanded = 1;
    }
    if (gBattleMons[gBankTarget].status2 & 0x01000000)
        goto END;
    if (gBattleMoves[gCurrentMove].effect != EFFECT_FALSE_SWIPE && !gProtectStructs[gBankTarget].endured
     && !gSpecialStatuses[gBankTarget].focusBanded)
        goto END;

    if (gBattleMons[gBankTarget].hp > gBattleMoveDamage)
        goto END;

    gBattleMoveDamage = gBattleMons[gBankTarget].hp - 1;

    if (gProtectStructs[gBankTarget].endured)
    {
        gBattleMoveFlags |= (1 << 6);
        goto END;
    }
    if (gSpecialStatuses[gBankTarget].focusBanded)
    {
        gBattleMoveFlags |= (1 << 7);
        gLastUsedItem = gBattleMons[gBankTarget].item;
    }

    END:
        gBattlescriptCurrInstr++;
}

static void atk08_dmg_adjustment2(void)
{
    u8 hold_effect, quality;
    ApplyRandomDmgMultiplier();
    if (gBattleMons[gBankTarget].item == ITEM_ENIGMA_BERRY)
    {
        hold_effect = gEnigmaBerries[gBankTarget].holdEffect, quality = gEnigmaBerries[gBankTarget].holdEffectParam;
    }
    else
    {
        hold_effect = ItemId_GetHoldEffect(gBattleMons[gBankTarget].item);
        quality = ItemId_GetHoldEffectParam(gBattleMons[gBankTarget].item);
    }

    gStringBank = gBankTarget;

    if (hold_effect == 39 && (Random() % 100) < quality)
    {
        RecordItemBattle(gBankTarget, hold_effect);
        gSpecialStatuses[gBankTarget].focusBanded = 1;
    }
    if (gBattleMons[gBankTarget].status2 & 0x01000000)
        goto END;
    if (!gProtectStructs[gBankTarget].endured
     && !gSpecialStatuses[gBankTarget].focusBanded)
        goto END;

    if (gBattleMons[gBankTarget].hp > gBattleMoveDamage)
        goto END;

    gBattleMoveDamage = gBattleMons[gBankTarget].hp - 1;

    if (gProtectStructs[gBankTarget].endured)
    {
        gBattleMoveFlags |= (1 << 6);
        goto END;
    }
    if (gSpecialStatuses[gBankTarget].focusBanded)
    {
        gBattleMoveFlags |= (1 << 7);
        gLastUsedItem = gBattleMons[gBankTarget].item;
    }

    END:
        gBattlescriptCurrInstr++;
}

static void atk09_attackanimation(void)
{
    if (gBattleExecBuffer)
        return;

    if ((gHitMarker & 0x00000080) && (gCurrentMove != MOVE_TRANSFORM && gCurrentMove != MOVE_SUBSTITUTE))
    {
        b_movescr_stack_push(gBattlescriptCurrInstr + 1);
        gBattlescriptCurrInstr = BattleScript_Pausex20;
        ((struct BattleStruct *) (gSharedMem + 0x0))->animTurn += 1;
        ((struct BattleStruct *) (gSharedMem + 0x0))->animTargetsHit += 1;
    }
    else
    {
        if ((gBattleMoves[gCurrentMove].target & 0x8 || gBattleMoves[gCurrentMove].target & 0x20 || gBattleMoves[gCurrentMove].target & 0x1) && ((struct BattleStruct *) (gSharedMem + 0x0))->animTargetsHit)
        {
            gBattlescriptCurrInstr++;
            return;
        }
        if (!(gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5)))))
        {
            gActiveBank = gBankAttacker;

            EmitMoveAnimation(0, gCurrentMove, ((struct BattleStruct *) (gSharedMem + 0x0))->animTurn, gBattleMovePower, gBattleMoveDamage, gBattleMons[gBankAttacker].friendship, &gDisableStructs[gBankAttacker]);
            ((struct BattleStruct *) (gSharedMem + 0x0))->animTurn += 1;
            ((struct BattleStruct *) (gSharedMem + 0x0))->animTargetsHit += 1;
            MarkBufferBankForExecution(gBankAttacker);
            gBattlescriptCurrInstr++;
        }
        else
        {
            b_movescr_stack_push(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = BattleScript_Pausex20;
        }
    }
}

static void atk0A_waitanimation(void)
{
    if (gBattleExecBuffer == 0)
        gBattlescriptCurrInstr++;
}

static void atk0B_healthbarupdate(void)
{
    if (gBattleExecBuffer)
        return;
    if (gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5))))
        goto END;

    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));

    if (gBattleMons[gActiveBank].status2 & 0x01000000 && gDisableStructs[gActiveBank].substituteHP && !(gHitMarker & 0x00000100))
    {
        PrepareStringBattle(0x80, gActiveBank);
        goto END;
    }

    EmitHealthBarUpdate(0, gBattleMoveDamage);
    MarkBufferBankForExecution(gActiveBank);

    if (!GetBankSide(gActiveBank) && gBattleMoveDamage > 0)
        gBattleResults.unk5_0 = 1;

    END:
        gBattlescriptCurrInstr += 2;
}

static void atk0C_datahpupdate(void)
{
    register u32 move_type asm("r6");
    u8 dynamic_move_type;

    if (gBattleExecBuffer)
        return;

    dynamic_move_type = ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType;
    if (dynamic_move_type && !(dynamic_move_type & 0x40))
    {
        move_type = 0x3F;
        move_type &= dynamic_move_type;
    }
    else
    {
        move_type = gBattleMoves[gCurrentMove].type;
    }

    if (!(gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5)))))
    {
        gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
        if (gBattleMons[gActiveBank].status2 & 0x01000000 && gDisableStructs[gActiveBank].substituteHP && !(gHitMarker & 0x00000100))
        {
            if (gDisableStructs[gActiveBank].substituteHP >= gBattleMoveDamage)
            {
                if (gSpecialStatuses[gActiveBank].moveturnLostHP == 0)
                    gSpecialStatuses[gActiveBank].moveturnLostHP = gBattleMoveDamage;
                gDisableStructs[gActiveBank].substituteHP -= gBattleMoveDamage;
                gHP_dealt = gBattleMoveDamage;
            }
            else
            {
                if (gSpecialStatuses[gActiveBank].moveturnLostHP == 0)
                    gSpecialStatuses[gActiveBank].moveturnLostHP = gDisableStructs[gActiveBank].substituteHP;
                gHP_dealt = gDisableStructs[gActiveBank].substituteHP;
                gDisableStructs[gActiveBank].substituteHP = 0;
            }

            if (gDisableStructs[gActiveBank].substituteHP == 0)
            {
                gBattlescriptCurrInstr += 2;
                b_movescr_stack_push_cursor();
                gBattlescriptCurrInstr = BattleScript_SubstituteFade;
                return;
            }
        }
        else
        {
            gHitMarker &= ~(0x00000100);
            if (gBattleMoveDamage < 0)
            {
                gBattleMons[gActiveBank].hp -= gBattleMoveDamage;
                if (gBattleMons[gActiveBank].hp > gBattleMons[gActiveBank].maxHP)
                    gBattleMons[gActiveBank].hp = gBattleMons[gActiveBank].maxHP;

            }
            else
            {
                if (gHitMarker & 0x00000020)
                {
                    gHitMarker &= ~(0x00000020);
                }
                else
                {
                    gTakenDmg[gActiveBank] += gBattleMoveDamage;
                    if (((gBattlescriptCurrInstr + 1)[0]) == 0)
                        gTakenDmgBanks[gActiveBank] = gBankAttacker;
                    else
                        gTakenDmgBanks[gActiveBank] = gBankTarget;
                }

                if (gBattleMons[gActiveBank].hp > gBattleMoveDamage)
                {
                    gBattleMons[gActiveBank].hp -= gBattleMoveDamage;
                    gHP_dealt = gBattleMoveDamage;
                }
                else
                {
                    gHP_dealt = gBattleMons[gActiveBank].hp;
                    gBattleMons[gActiveBank].hp = 0;
                }

                if (!gSpecialStatuses[gActiveBank].moveturnLostHP && !(gHitMarker & 0x00100000))
                    gSpecialStatuses[gActiveBank].moveturnLostHP = gHP_dealt;

                if (move_type <= 8 && !(gHitMarker & 0x00100000) && gCurrentMove != MOVE_PAIN_SPLIT)
                {
                    gProtectStructs[gActiveBank].physicalDmg = gHP_dealt;
                    gSpecialStatuses[gActiveBank].moveturnLostHP_physical = gHP_dealt;
                    if (((gBattlescriptCurrInstr + 1)[0]) == 0)
                    {
                        gProtectStructs[gActiveBank].physicalBank = gBankAttacker;
                        gSpecialStatuses[gActiveBank].moveturnPhysicalBank = gBankAttacker;
                    }
                    else
                    {
                        gProtectStructs[gActiveBank].physicalBank = gBankTarget;
                        gSpecialStatuses[gActiveBank].moveturnPhysicalBank = gBankTarget;
                    }
                }
                else if (move_type > 8 && !(gHitMarker & 0x00100000))
                {
                    gProtectStructs[gActiveBank].specialDmg = gHP_dealt;
                    gSpecialStatuses[gActiveBank].moveturnLostHP_special = gHP_dealt;
                    if (((gBattlescriptCurrInstr + 1)[0]) == 0)
                    {
                        gProtectStructs[gActiveBank].specialBank = gBankAttacker;
                        gSpecialStatuses[gActiveBank].moveturnSpecialBank = gBankAttacker;
                    }
                    else
                    {
                        gProtectStructs[gActiveBank].specialBank = gBankTarget;
                        gSpecialStatuses[gActiveBank].moveturnSpecialBank = gBankTarget;
                    }
                }
            }
            gHitMarker &= ~(0x00100000);
            EmitSetAttributes(0, 0x2A, 0, 2, &gBattleMons[gActiveBank].hp);
            MarkBufferBankForExecution(gActiveBank);
        }
    }
    else
    {
        gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
        if (gSpecialStatuses[gActiveBank].moveturnLostHP == 0)
            gSpecialStatuses[gActiveBank].moveturnLostHP = 0xFFFF;
    }
    gBattlescriptCurrInstr += 2;
}

static void atk0D_critmessage(void)
{
    if (gBattleExecBuffer == 0)
    {
        if (gCritMultiplier == 2 && !(gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5)))))
        {
            PrepareStringBattle(0xD9, gBankAttacker);
            gBattleCommunication[0x7] = 1;
        }
        gBattlescriptCurrInstr++;
    }
}

static void atk0E_effectiveness_sound(void)
{
    if (gBattleExecBuffer)
        return;
    gActiveBank = gBankTarget;
    if (!(gBattleMoveFlags & (1 << 0)))
    {
        u8 flag = ~(1 << 0);
        switch (gBattleMoveFlags & flag)
        {
        case (1 << 1):
            EmitEffectivenessSound(0, 14);
            MarkBufferBankForExecution(gActiveBank);
            break;
        case (1 << 2):
            EmitEffectivenessSound(0, 12);
            MarkBufferBankForExecution(gActiveBank);
            break;
        case (1 << 3):
        case (1 << 5):
            break;
        case (1 << 6):
        case (1 << 4):
        case (1 << 7):
        default:
            if (gBattleMoveFlags & (1 << 1))
            {
                EmitEffectivenessSound(0, 14);
                MarkBufferBankForExecution(gActiveBank);
            }
            else if (gBattleMoveFlags & (1 << 2))
            {
                EmitEffectivenessSound(0, 12);
                MarkBufferBankForExecution(gActiveBank);
            }
            else if (!(gBattleMoveFlags & ((1 << 3) | (1 << 5))))
            {
                EmitEffectivenessSound(0, 13);
                MarkBufferBankForExecution(gActiveBank);
            }
            break;
        }
    }
    gBattlescriptCurrInstr++;
}

static void atk0F_resultmessage(void)
{
    u16 stringID = 0;

    if (gBattleExecBuffer)
        return;

    if (gBattleMoveFlags & (1 << 0) && (!(gBattleMoveFlags & (1 << 3)) || gBattleCommunication[6] > 2))
    {
        stringID = gMissStrings[gBattleCommunication[6]];
        gBattleCommunication[0x7] = 1;
    }
    else
    {
        gBattleCommunication[0x7] = 1;
        switch (gBattleMoveFlags & 0xFE)
        {
        case (1 << 1):
            stringID = 0xDE;
            break;
        case (1 << 2):
            stringID = 0xDD;
            break;
        case (1 << 4):
            stringID = 0xDA;
            break;
        case (1 << 6):
            stringID = 0x99;
            break;
        case (1 << 5):
            goto FAILED;
        case (1 << 3):
            goto NOTAFFECTED;
        case (1 << 7):
            gLastUsedItem = gBattleMons[gBankTarget].item;
            gStringBank = gBankTarget;
            gBattleMoveFlags &= ~((1 << 6) | (1 << 7));
            b_movescr_stack_push_cursor();
            gBattlescriptCurrInstr = BattleScript_HangedOnMsg;
            return;
        default:
            if (gBattleMoveFlags & (1 << 3))
          NOTAFFECTED:
                stringID = 0x1B;
            else if (gBattleMoveFlags & (1 << 4))
            {
                gBattleMoveFlags &= ~((1 << 4));
                gBattleMoveFlags &= ~((1 << 1));
                gBattleMoveFlags &= ~((1 << 2));
                b_movescr_stack_push_cursor();
                gBattlescriptCurrInstr = BattleScript_OneHitKOMsg;
                return;
            }
            else if (gBattleMoveFlags & (1 << 6))
            {
                gBattleMoveFlags &= ~((1 << 6) | (1 << 7));
                b_movescr_stack_push_cursor();
                gBattlescriptCurrInstr = BattleScript_EnduredMsg;
                return;
            }
            else if (gBattleMoveFlags & (1 << 7))
            {
                gLastUsedItem = gBattleMons[gBankTarget].item;
                gStringBank = gBankTarget;
                gBattleMoveFlags &= ~((1 << 6) | (1 << 7));
                b_movescr_stack_push_cursor();
                gBattlescriptCurrInstr = BattleScript_HangedOnMsg;
                return;
            }
            else if (gBattleMoveFlags & (1 << 5))
          FAILED:
                stringID = 0xE5;
            else
                gBattleCommunication[0x7] = 0;
        }
    }

    if (stringID)
    {
        register u16 dummy asm("r0") = stringID;
        PrepareStringBattle(dummy, gBankAttacker);
    }
    gBattlescriptCurrInstr++;
}

static void atk10_printstring(void)
{
    if (gBattleExecBuffer == 0)
    {
        u16 var = ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8));
        PrepareStringBattle(var, gBankAttacker);
        gBattlescriptCurrInstr += 3;
        gBattleCommunication[0x7] = 1;
    }
}

static void atk11_printstring_playeronly(void)
{
    gActiveBank = gBankAttacker;
    EmitPrintStringPlayerOnly(0, ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8)));
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 3;
    gBattleCommunication[0x7] = 1;
}

static void atk12_waitmessage(void)
{
    if (gBattleExecBuffer == 0)
    {
        if (!gBattleCommunication[0x7])
        {
            gBattlescriptCurrInstr += 3;
        }
        else
        {
            u16 to_wait = ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8));
            if (++gPauseCounterBattle >= to_wait)
            {
                gPauseCounterBattle = 0;
                gBattlescriptCurrInstr += 3;
                gBattleCommunication[0x7] = 0;
            }
        }
    }
}

static void atk13_printfromtable(void)
{
    if (gBattleExecBuffer == 0)
    {
        u16 *ptr = (u16 *)(u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
        ptr += gBattleCommunication[0x5];
        PrepareStringBattle(*(u16*)ptr, gBankAttacker);
        gBattlescriptCurrInstr += 5;
        gBattleCommunication[0x7] = 1;
    }
}

static void atk14_printfromtable_playeronly(void)
{
    if (gBattleExecBuffer == 0)
    {
        u16 *ptr = (u16 *)(u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
        ptr += gBattleCommunication[0x5];
        gActiveBank = gBankAttacker;
        EmitPrintStringPlayerOnly(0, *(u16*)ptr);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 5;
        gBattleCommunication[0x7] = 1;
    }
}

u8 BankGetTurnOrder(u8 bank)
{
    int i;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (gTurnOrder[i] == bank)
            break;
    }
    return i;
}
# 2752 "src/battle/battle_4.c"
__attribute__((naked))
void SetMoveEffect(bool8 primary, u8 certainArg)
{
    asm(".syntax unified\n            push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x8\n    lsls r0, 24\n    lsrs r4, r0, 24\n    lsls r1, 24\n    lsrs r5, r1, 24\n    movs r0, 0\n    mov r10, r0\n    movs r6, 0\n    movs r1, 0x1\n    str r1, [sp, 0x4]\n    ldr r1, _0801E430 @ =gBattleCommunication\n    ldrb r3, [r1, 0x3]\n    movs r0, 0x40\n    ands r0, r3\n    adds r7, r1, 0\n    cmp r0, 0\n    beq _0801E444\n    ldr r2, _0801E434 @ =gEffectBank\n    ldr r0, _0801E438 @ =gBankAttacker\n    ldrb r0, [r0]\n    strb r0, [r2]\n    movs r0, 0xBF\n    ands r0, r3\n    strb r0, [r7, 0x3]\n    movs r6, 0x40\n    ldr r0, _0801E43C @ =gSharedMem\n    ldr r1, _0801E440 @ =gBankTarget\n    b _0801E450\n    .align 2, 0\n_0801E430: .4byte gBattleCommunication\n_0801E434: .4byte gEffectBank\n_0801E438: .4byte gBankAttacker\n_0801E43C: .4byte gSharedMem\n_0801E440: .4byte gBankTarget\n_0801E444:\n    ldr r2, _0801E538 @ =gEffectBank\n    ldr r0, _0801E53C @ =gBankTarget\n    ldrb r0, [r0]\n    strb r0, [r2]\n    ldr r0, _0801E540 @ =gSharedMem\n    ldr r1, _0801E544 @ =gBankAttacker\n_0801E450:\n    ldrb r1, [r1]\n    ldr r3, _0801E548 @ =0x00016003\n    adds r0, r3\n    strb r1, [r0]\n    mov r8, r2\n    ldr r2, _0801E54C @ =gBattleMons\n    mov r0, r8\n    ldrb r1, [r0]\n    movs r0, 0x58\n    muls r0, r1\n    adds r0, r2\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x13\n    bne _0801E48A\n    ldr r0, _0801E550 @ =gHitMarker\n    ldr r0, [r0]\n    movs r1, 0x80\n    lsls r1, 6\n    ands r0, r1\n    cmp r0, 0\n    bne _0801E48A\n    cmp r4, 0\n    bne _0801E48A\n    ldrb r0, [r7, 0x3]\n    cmp r0, 0x9\n    bhi _0801E48A\n    bl _0801F5DC\n_0801E48A:\n    mov r1, r8\n    ldrb r0, [r1]\n    bl GetBankIdentity\n    ldr r2, _0801E554 @ =gSideAffecting\n    movs r1, 0x1\n    ands r1, r0\n    lsls r1, 1\n    adds r1, r2\n    ldrh r1, [r1]\n    movs r0, 0x20\n    ands r0, r1\n    cmp r0, 0\n    beq _0801E4C4\n    ldr r0, _0801E550 @ =gHitMarker\n    ldr r0, [r0]\n    movs r1, 0x80\n    lsls r1, 6\n    ands r0, r1\n    cmp r0, 0\n    bne _0801E4C4\n    cmp r4, 0\n    bne _0801E4C4\n    ldr r0, _0801E558 @ =gBattleCommunication\n    ldrb r0, [r0, 0x3]\n    cmp r0, 0x7\n    bhi _0801E4C4\n    bl _0801F5DC\n_0801E4C4:\n    ldr r3, _0801E54C @ =gBattleMons\n    ldr r2, _0801E538 @ =gEffectBank\n    ldrb r1, [r2]\n    movs r0, 0x58\n    muls r0, r1\n    adds r0, r3\n    ldrh r0, [r0, 0x28]\n    mov r8, r2\n    mov r9, r3\n    cmp r0, 0\n    bne _0801E4EA\n    ldr r0, _0801E558 @ =gBattleCommunication\n    ldrb r0, [r0, 0x3]\n    cmp r0, 0xB\n    beq _0801E4EA\n    cmp r0, 0x1F\n    beq _0801E4EA\n    bl _0801F5DC\n_0801E4EA:\n    mov r2, r8\n    ldrb r1, [r2]\n    movs r0, 0x58\n    muls r0, r1\n    mov r1, r9\n    adds r1, 0x50\n    adds r0, r1\n    ldr r0, [r0]\n    movs r1, 0x80\n    lsls r1, 17\n    ands r0, r1\n    cmp r0, 0\n    beq _0801E50C\n    cmp r6, 0x40\n    beq _0801E50C\n    bl _0801F5DC\n_0801E50C:\n    ldr r0, _0801E558 @ =gBattleCommunication\n    ldrb r1, [r0, 0x3]\n    adds r7, r0, 0\n    cmp r1, 0x6\n    bls _0801E518\n    b _0801EB4A\n_0801E518:\n    ldr r1, _0801E55C @ =gStatusFlagsForMoveEffects\n    ldrb r0, [r7, 0x3]\n    lsls r0, 2\n    adds r0, r1\n    ldr r0, [r0]\n    cmp r0, 0x10\n    bne _0801E528\n    b _0801E714\n_0801E528:\n    cmp r0, 0x10\n    bhi _0801E560\n    cmp r0, 0x7\n    beq _0801E57A\n    cmp r0, 0x8\n    bne _0801E536\n    b _0801E630\n_0801E536:\n    b _0801EA14\n    .align 2, 0\n_0801E538: .4byte gEffectBank\n_0801E53C: .4byte gBankTarget\n_0801E540: .4byte gSharedMem\n_0801E544: .4byte gBankAttacker\n_0801E548: .4byte 0x00016003\n_0801E54C: .4byte gBattleMons\n_0801E550: .4byte gHitMarker\n_0801E554: .4byte gSideAffecting\n_0801E558: .4byte gBattleCommunication\n_0801E55C: .4byte gStatusFlagsForMoveEffects\n_0801E560:\n    cmp r0, 0x40\n    bne _0801E566\n    b _0801E888\n_0801E566:\n    cmp r0, 0x40\n    bhi _0801E572\n    cmp r0, 0x20\n    bne _0801E570\n    b _0801E7EA\n_0801E570:\n    b _0801EA14\n_0801E572:\n    cmp r0, 0x80\n    bne _0801E578\n    b _0801E8E4\n_0801E578:\n    b _0801EA14\n_0801E57A:\n    mov r3, r8\n    ldrb r1, [r3]\n    movs r0, 0x58\n    muls r0, r1\n    add r0, r9\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x2B\n    beq _0801E5DC\n    ldr r0, _0801E5D4 @ =gActiveBank\n    movs r1, 0\n    strb r1, [r0]\n    ldr r1, _0801E5D8 @ =gNoOfAllBanks\n    ldrb r3, [r1]\n    adds r7, r0, 0\n    mov r12, r1\n    cmp r3, 0\n    beq _0801E5E8\n    mov r4, r9\n    ldr r0, [r4, 0x50]\n    movs r1, 0x70\n    ands r0, r1\n    cmp r0, 0\n    bne _0801E5E8\n    adds r1, r7, 0\n    mov r6, r9\n    adds r6, 0x50\n    movs r5, 0x58\n    movs r4, 0x70\n_0801E5B4:\n    ldrb r0, [r1]\n    adds r0, 0x1\n    strb r0, [r1]\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, r3\n    bcs _0801E5E8\n    ldrb r0, [r7]\n    muls r0, r5\n    adds r0, r6\n    ldr r0, [r0]\n    ands r0, r4\n    cmp r0, 0\n    beq _0801E5B4\n    b _0801E5E8\n    .align 2, 0\n_0801E5D4: .4byte gActiveBank\n_0801E5D8: .4byte gNoOfAllBanks\n_0801E5DC:\n    ldr r0, _0801E628 @ =gActiveBank\n    ldr r2, _0801E62C @ =gNoOfAllBanks\n    ldrb r1, [r2]\n    strb r1, [r0]\n    adds r7, r0, 0\n    mov r12, r2\n_0801E5E8:\n    mov r0, r8\n    ldrb r2, [r0]\n    movs r0, 0x58\n    adds r1, r2, 0\n    muls r1, r0\n    mov r0, r9\n    adds r0, 0x4C\n    adds r0, r1, r0\n    ldr r0, [r0]\n    cmp r0, 0\n    beq _0801E600\n    b _0801EA14\n_0801E600:\n    ldrb r0, [r7]\n    mov r3, r12\n    ldrb r3, [r3]\n    cmp r0, r3\n    beq _0801E60C\n    b _0801EA14\n_0801E60C:\n    mov r4, r9\n    adds r0, r1, r4\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x48\n    bne _0801E61A\n    b _0801EA14\n_0801E61A:\n    cmp r0, 0xF\n    bne _0801E620\n    b _0801EA14\n_0801E620:\n    adds r0, r2, 0\n    bl CancelMultiTurnMoves\n    b _0801EA04\n    .align 2, 0\n_0801E628: .4byte gActiveBank\n_0801E62C: .4byte gNoOfAllBanks\n_0801E630:\n    mov r2, r8\n    ldrb r1, [r2]\n    movs r0, 0x58\n    muls r0, r1\n    add r0, r9\n    adds r0, 0x20\n    ldrb r1, [r0]\n    cmp r1, 0x11\n    bne _0801E688\n    cmp r4, 0x1\n    beq _0801E64A\n    cmp r5, 0x80\n    bne _0801E688\n_0801E64A:\n    ldr r0, _0801E678 @ =gLastUsedAbility\n    strb r1, [r0]\n    mov r3, r8\n    ldrb r0, [r3]\n    movs r1, 0x11\n    bl RecordAbilityBattle\n    ldr r4, _0801E67C @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801E680 @ =BattleScript_PSNPrevention\n_0801E664:\n    str r0, [r4]\n    ldr r2, _0801E684 @ =gHitMarker\n    ldr r1, [r2]\n    movs r0, 0x80\n    lsls r0, 6\n    ands r0, r1\n    cmp r0, 0\n    beq _0801E676\n    b _0801E928\n_0801E676:\n    b _0801E94C\n    .align 2, 0\n_0801E678: .4byte gLastUsedAbility\n_0801E67C: .4byte gBattlescriptCurrInstr\n_0801E680: .4byte BattleScript_PSNPrevention\n_0801E684: .4byte gHitMarker\n_0801E688:\n    mov r1, r8\n    ldrb r0, [r1]\n    movs r1, 0x58\n    muls r0, r1\n    add r0, r9\n    adds r1, r0, 0\n    adds r1, 0x21\n    ldrb r1, [r1]\n    cmp r1, 0x3\n    beq _0801E6AC\n    adds r0, 0x22\n    ldrb r0, [r0]\n    cmp r0, 0x3\n    beq _0801E6AC\n    cmp r1, 0x8\n    beq _0801E6AC\n    cmp r0, 0x8\n    bne _0801E6C6\n_0801E6AC:\n    ldr r0, _0801E710 @ =gHitMarker\n    ldr r0, [r0]\n    movs r1, 0x80\n    lsls r1, 6\n    ands r0, r1\n    cmp r0, 0\n    beq _0801E6C6\n    cmp r4, 0x1\n    bne _0801E6C0\n    b _0801E98C\n_0801E6C0:\n    cmp r5, 0x80\n    bne _0801E6C6\n    b _0801E98C\n_0801E6C6:\n    mov r2, r8\n    ldrb r1, [r2]\n    movs r0, 0x58\n    muls r1, r0\n    mov r4, r9\n    adds r3, r1, r4\n    adds r0, r3, 0\n    adds r0, 0x21\n    ldrb r4, [r0]\n    cmp r4, 0x3\n    bne _0801E6DE\n    b _0801EA14\n_0801E6DE:\n    adds r0, 0x1\n    ldrb r0, [r0]\n    cmp r0, 0x3\n    bne _0801E6E8\n    b _0801EA14\n_0801E6E8:\n    cmp r4, 0x8\n    bne _0801E6EE\n    b _0801EA14\n_0801E6EE:\n    cmp r0, 0x8\n    bne _0801E6F4\n    b _0801EA14\n_0801E6F4:\n    mov r0, r9\n    adds r0, 0x4C\n    adds r0, r1, r0\n    ldr r0, [r0]\n    cmp r0, 0\n    beq _0801E702\n    b _0801EA14\n_0801E702:\n    adds r0, r3, 0\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x11\n    bne _0801E70E\n    b _0801EA14\n_0801E70E:\n    b _0801EA04\n    .align 2, 0\n_0801E710: .4byte gHitMarker\n_0801E714:\n    mov r2, r8\n    ldrb r1, [r2]\n    movs r0, 0x58\n    muls r0, r1\n    add r0, r9\n    adds r0, 0x20\n    ldrb r1, [r0]\n    cmp r1, 0x29\n    bne _0801E758\n    cmp r4, 0x1\n    beq _0801E72E\n    cmp r5, 0x80\n    bne _0801E758\n_0801E72E:\n    ldr r0, _0801E74C @ =gLastUsedAbility\n    strb r1, [r0]\n    mov r3, r8\n    ldrb r0, [r3]\n    movs r1, 0x29\n    bl RecordAbilityBattle\n    ldr r4, _0801E750 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801E754 @ =BattleScript_BRNPrevention\n    b _0801E664\n    .align 2, 0\n_0801E74C: .4byte gLastUsedAbility\n_0801E750: .4byte gBattlescriptCurrInstr\n_0801E754: .4byte BattleScript_BRNPrevention\n_0801E758:\n    mov r0, r8\n    ldrb r1, [r0]\n    movs r0, 0x58\n    muls r0, r1\n    mov r2, r9\n    adds r1, r0, r2\n    adds r0, r1, 0\n    adds r0, 0x21\n    ldrb r0, [r0]\n    cmp r0, 0xA\n    beq _0801E778\n    adds r0, r1, 0\n    adds r0, 0x22\n    ldrb r0, [r0]\n    cmp r0, 0xA\n    bne _0801E7A8\n_0801E778:\n    ldr r0, _0801E79C @ =gHitMarker\n    ldr r0, [r0]\n    movs r1, 0x80\n    lsls r1, 6\n    ands r0, r1\n    cmp r0, 0\n    beq _0801E7A8\n    cmp r4, 0x1\n    beq _0801E78E\n    cmp r5, 0x80\n    bne _0801E7A8\n_0801E78E:\n    ldr r4, _0801E7A0 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801E7A4 @ =BattleScript_BRNPrevention\n    b _0801E998\n    .align 2, 0\n_0801E79C: .4byte gHitMarker\n_0801E7A0: .4byte gBattlescriptCurrInstr\n_0801E7A4: .4byte BattleScript_BRNPrevention\n_0801E7A8:\n    mov r3, r8\n    ldrb r0, [r3]\n    movs r1, 0x58\n    adds r2, r0, 0\n    muls r2, r1\n    mov r4, r9\n    adds r1, r2, r4\n    adds r0, r1, 0\n    adds r0, 0x21\n    ldrb r0, [r0]\n    cmp r0, 0xA\n    bne _0801E7C2\n    b _0801EA14\n_0801E7C2:\n    adds r0, r1, 0\n    adds r0, 0x22\n    ldrb r0, [r0]\n    cmp r0, 0xA\n    bne _0801E7CE\n    b _0801EA14\n_0801E7CE:\n    adds r0, r1, 0\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x29\n    bne _0801E7DA\n    b _0801EA14\n_0801E7DA:\n    mov r0, r9\n    adds r0, 0x4C\n    adds r0, r2, r0\n    ldr r0, [r0]\n    cmp r0, 0\n    beq _0801E7E8\n    b _0801EA14\n_0801E7E8:\n    b _0801EA04\n_0801E7EA:\n    movs r0, 0\n    str r0, [sp]\n    movs r0, 0x13\n    movs r1, 0\n    movs r2, 0xD\n    movs r3, 0\n    bl AbilityBattleEffects\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0\n    bne _0801E826\n    str r0, [sp]\n    movs r0, 0x13\n    movs r1, 0\n    movs r2, 0x4D\n    movs r3, 0\n    bl AbilityBattleEffects\n    lsls r0, 24\n    cmp r0, 0\n    bne _0801E826\n    ldr r0, _0801E87C @ =gBattleWeather\n    ldrh r1, [r0]\n    movs r0, 0x60\n    ands r0, r1\n    cmp r0, 0\n    beq _0801E826\n    movs r1, 0\n    str r1, [sp, 0x4]\n_0801E826:\n    ldr r4, _0801E880 @ =gBattleMons\n    ldr r0, _0801E884 @ =gEffectBank\n    ldrb r3, [r0]\n    movs r0, 0x58\n    adds r2, r3, 0\n    muls r2, r0\n    adds r1, r2, r4\n    adds r0, r1, 0\n    adds r0, 0x21\n    ldrb r0, [r0]\n    cmp r0, 0xF\n    bne _0801E840\n    b _0801EA14\n_0801E840:\n    adds r0, r1, 0\n    adds r0, 0x22\n    ldrb r0, [r0]\n    cmp r0, 0xF\n    bne _0801E84C\n    b _0801EA14\n_0801E84C:\n    adds r0, r4, 0\n    adds r0, 0x4C\n    adds r0, r2, r0\n    ldr r0, [r0]\n    cmp r0, 0\n    beq _0801E85A\n    b _0801EA14\n_0801E85A:\n    ldr r2, [sp, 0x4]\n    cmp r2, 0\n    bne _0801E862\n    b _0801EA14\n_0801E862:\n    adds r0, r1, 0\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x28\n    bne _0801E86E\n    b _0801EA14\n_0801E86E:\n    adds r0, r3, 0\n    bl CancelMultiTurnMoves\n    movs r3, 0x1\n    mov r10, r3\n    b _0801EA14\n    .align 2, 0\n_0801E87C: .4byte gBattleWeather\n_0801E880: .4byte gBattleMons\n_0801E884: .4byte gEffectBank\n_0801E888:\n    mov r0, r8\n    ldrb r1, [r0]\n    movs r0, 0x58\n    muls r1, r0\n    mov r2, r9\n    adds r0, r1, r2\n    adds r0, 0x20\n    ldrb r2, [r0]\n    cmp r2, 0x7\n    bne _0801E8D0\n    cmp r4, 0x1\n    beq _0801E8A6\n    cmp r5, 0x80\n    beq _0801E8A6\n    b _0801EA14\n_0801E8A6:\n    ldr r0, _0801E8C4 @ =gLastUsedAbility\n    strb r2, [r0]\n    mov r3, r8\n    ldrb r0, [r3]\n    movs r1, 0x7\n    bl RecordAbilityBattle\n    ldr r4, _0801E8C8 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801E8CC @ =BattleScript_PRLZPrevention\n    b _0801E664\n    .align 2, 0\n_0801E8C4: .4byte gLastUsedAbility\n_0801E8C8: .4byte gBattlescriptCurrInstr\n_0801E8CC: .4byte BattleScript_PRLZPrevention\n_0801E8D0:\n    mov r0, r9\n    adds r0, 0x4C\n    adds r0, r1, r0\n    ldr r0, [r0]\n    cmp r0, 0\n    beq _0801E8DE\n    b _0801EA14\n_0801E8DE:\n    movs r4, 0x1\n    mov r10, r4\n    b _0801EA14\n_0801E8E4:\n    mov r0, r8\n    ldrb r1, [r0]\n    movs r0, 0x58\n    muls r0, r1\n    add r0, r9\n    adds r0, 0x20\n    ldrb r1, [r0]\n    cmp r1, 0x11\n    bne _0801E952\n    cmp r4, 0x1\n    beq _0801E8FE\n    cmp r5, 0x80\n    bne _0801E952\n_0801E8FE:\n    ldr r0, _0801E938 @ =gLastUsedAbility\n    strb r1, [r0]\n    mov r1, r8\n    ldrb r0, [r1]\n    movs r1, 0x11\n    bl RecordAbilityBattle\n    ldr r4, _0801E93C @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801E940 @ =BattleScript_PSNPrevention\n    str r0, [r4]\n    ldr r2, _0801E944 @ =gHitMarker\n    ldr r1, [r2]\n    movs r0, 0x80\n    lsls r0, 6\n    ands r0, r1\n    cmp r0, 0\n    beq _0801E94C\n_0801E928:\n    movs r0, 0x1\n    strb r0, [r7, 0x5]\n    ldr r0, _0801E948 @ =0xffffdfff\n    ands r1, r0\n    str r1, [r2]\n    bl _0801F5FA\n    .align 2, 0\n_0801E938: .4byte gLastUsedAbility\n_0801E93C: .4byte gBattlescriptCurrInstr\n_0801E940: .4byte BattleScript_PSNPrevention\n_0801E944: .4byte gHitMarker\n_0801E948: .4byte 0xffffdfff\n_0801E94C:\n    strb r0, [r7, 0x5]\n    bl _0801F5FA\n_0801E952:\n    mov r2, r8\n    ldrb r0, [r2]\n    movs r1, 0x58\n    muls r0, r1\n    add r0, r9\n    adds r1, r0, 0\n    adds r1, 0x21\n    ldrb r1, [r1]\n    cmp r1, 0x3\n    beq _0801E976\n    adds r0, 0x22\n    ldrb r0, [r0]\n    cmp r0, 0x3\n    beq _0801E976\n    cmp r1, 0x8\n    beq _0801E976\n    cmp r0, 0x8\n    bne _0801E9B4\n_0801E976:\n    ldr r0, _0801E9A4 @ =gHitMarker\n    ldr r0, [r0]\n    movs r1, 0x80\n    lsls r1, 6\n    ands r0, r1\n    cmp r0, 0\n    beq _0801E9B4\n    cmp r4, 0x1\n    beq _0801E98C\n    cmp r5, 0x80\n    bne _0801E9B4\n_0801E98C:\n    ldr r4, _0801E9A8 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801E9AC @ =BattleScript_PSNPrevention\n_0801E998:\n    str r0, [r4]\n    ldr r1, _0801E9B0 @ =gBattleCommunication\n    movs r0, 0x2\n    strb r0, [r1, 0x5]\n    bl _0801F5FA\n    .align 2, 0\n_0801E9A4: .4byte gHitMarker\n_0801E9A8: .4byte gBattlescriptCurrInstr\n_0801E9AC: .4byte BattleScript_PSNPrevention\n_0801E9B0: .4byte gBattleCommunication\n_0801E9B4:\n    mov r3, r8\n    ldrb r0, [r3]\n    movs r6, 0x58\n    muls r0, r6\n    mov r2, r9\n    adds r2, 0x4C\n    adds r5, r0, r2\n    ldr r4, [r5]\n    cmp r4, 0\n    bne _0801EA14\n    mov r3, r9\n    adds r1, r0, r3\n    adds r0, r1, 0\n    adds r0, 0x21\n    ldrb r3, [r0]\n    cmp r3, 0x3\n    beq _0801EA0A\n    adds r0, 0x1\n    ldrb r0, [r0]\n    cmp r0, 0x3\n    beq _0801EA0A\n    cmp r3, 0x8\n    beq _0801EA0A\n    cmp r0, 0x8\n    beq _0801EA0A\n    adds r0, r1, 0\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x11\n    beq _0801EA14\n    mov r4, r8\n    ldrb r0, [r4]\n    adds r1, r0, 0\n    muls r1, r6\n    adds r1, r2\n    ldr r0, [r1]\n    movs r2, 0x9\n    negs r2, r2\n    ands r0, r2\n    str r0, [r1]\n_0801EA04:\n    movs r0, 0x1\n    mov r10, r0\n    b _0801EA14\n_0801EA0A:\n    ldr r0, _0801EA58 @ =gBattleMoveFlags\n    ldrb r1, [r0]\n    movs r2, 0x8\n    orrs r1, r2\n    strb r1, [r0]\n_0801EA14:\n    mov r1, r10\n    cmp r1, 0x1\n    beq _0801EA1C\n    b _0801EB3C\n_0801EA1C:\n    ldr r0, _0801EA5C @ =gBattlescriptCurrInstr\n    ldr r0, [r0]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r1, _0801EA60 @ =gStatusFlagsForMoveEffects\n    ldr r0, _0801EA64 @ =gBattleCommunication\n    ldrb r0, [r0, 0x3]\n    lsls r0, 2\n    adds r0, r1\n    ldr r3, [r0]\n    cmp r3, 0x7\n    bne _0801EA70\n    bl Random\n    ldr r2, _0801EA68 @ =gBattleMons\n    ldr r1, _0801EA6C @ =gEffectBank\n    ldrb r3, [r1]\n    movs r1, 0x58\n    muls r3, r1\n    adds r2, 0x4C\n    adds r3, r2\n    movs r1, 0x3\n    ands r1, r0\n    adds r1, 0x2\n    ldr r0, [r3]\n    orrs r0, r1\n    str r0, [r3]\n    b _0801EA84\n    .align 2, 0\n_0801EA58: .4byte gBattleMoveFlags\n_0801EA5C: .4byte gBattlescriptCurrInstr\n_0801EA60: .4byte gStatusFlagsForMoveEffects\n_0801EA64: .4byte gBattleCommunication\n_0801EA68: .4byte gBattleMons\n_0801EA6C: .4byte gEffectBank\n_0801EA70:\n    ldr r2, _0801EAD4 @ =gBattleMons\n    ldr r0, _0801EAD8 @ =gEffectBank\n    ldrb r1, [r0]\n    movs r0, 0x58\n    muls r1, r0\n    adds r2, 0x4C\n    adds r1, r2\n    ldr r0, [r1]\n    orrs r0, r3\n    str r0, [r1]\n_0801EA84:\n    ldr r2, _0801EADC @ =gBattlescriptCurrInstr\n    ldr r1, _0801EAE0 @ =gMoveEffectBS_Ptrs\n    ldr r5, _0801EAE4 @ =gBattleCommunication\n    ldrb r0, [r5, 0x3]\n    lsls r0, 2\n    adds r0, r1\n    ldr r0, [r0]\n    str r0, [r2]\n    ldr r4, _0801EAE8 @ =gActiveBank\n    ldr r1, _0801EAD8 @ =gEffectBank\n    ldrb r0, [r1]\n    strb r0, [r4]\n    ldrb r1, [r1]\n    movs r0, 0x58\n    muls r0, r1\n    ldr r1, _0801EAEC @ =gUnknown_02024ACC\n    adds r0, r1\n    str r0, [sp]\n    movs r0, 0\n    movs r1, 0x28\n    movs r2, 0\n    movs r3, 0x4\n    bl EmitSetAttributes\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    ldr r2, _0801EAF0 @ =gHitMarker\n    ldr r1, [r2]\n    movs r0, 0x80\n    lsls r0, 6\n    ands r0, r1\n    cmp r0, 0\n    beq _0801EAF8\n    movs r0, 0x1\n    strb r0, [r5, 0x5]\n    ldr r0, _0801EAF4 @ =0xffffdfff\n    ands r1, r0\n    str r1, [r2]\n    b _0801EAFA\n    .align 2, 0\n_0801EAD4: .4byte gBattleMons\n_0801EAD8: .4byte gEffectBank\n_0801EADC: .4byte gBattlescriptCurrInstr\n_0801EAE0: .4byte gMoveEffectBS_Ptrs\n_0801EAE4: .4byte gBattleCommunication\n_0801EAE8: .4byte gActiveBank\n_0801EAEC: .4byte gUnknown_02024ACC\n_0801EAF0: .4byte gHitMarker\n_0801EAF4: .4byte 0xffffdfff\n_0801EAF8:\n    strb r0, [r5, 0x5]\n_0801EAFA:\n    ldr r0, _0801EB2C @ =gBattleCommunication\n    ldrb r2, [r0, 0x3]\n    adds r7, r0, 0\n    cmp r2, 0x2\n    beq _0801EB14\n    cmp r2, 0x6\n    beq _0801EB14\n    cmp r2, 0x5\n    beq _0801EB14\n    cmp r2, 0x3\n    beq _0801EB14\n    bl _0801F5FA\n_0801EB14:\n    ldr r0, _0801EB30 @ =gSharedMem\n    ldrb r1, [r7, 0x3]\n    ldr r2, _0801EB34 @ =0x000160ca\n    adds r0, r2\n    strb r1, [r0]\n    ldr r2, _0801EB38 @ =gHitMarker\n    ldr r0, [r2]\n    movs r1, 0x80\n    lsls r1, 7\n    bl _0801F4F2\n    .align 2, 0\n_0801EB2C: .4byte gBattleCommunication\n_0801EB30: .4byte gSharedMem\n_0801EB34: .4byte 0x000160ca\n_0801EB38: .4byte gHitMarker\n_0801EB3C:\n    mov r3, r10\n    cmp r3, 0\n    beq _0801EB46\n    bl _0801F5FA\n_0801EB46:\n    bl _0801F5DC\n_0801EB4A:\n    mov r0, r8\n    ldrb r1, [r0]\n    movs r0, 0x58\n    muls r1, r0\n    mov r0, r9\n    adds r0, 0x50\n    adds r1, r0\n    ldr r2, _0801EB84 @ =gStatusFlagsForMoveEffects\n    ldrb r3, [r7, 0x3]\n    lsls r0, r3, 2\n    adds r0, r2\n    ldr r1, [r1]\n    ldr r0, [r0]\n    ands r1, r0\n    cmp r1, 0\n    beq _0801EB6E\n    bl _0801F5DC\n_0801EB6E:\n    subs r0, r3, 0x7\n    cmp r0, 0x34\n    bls _0801EB78\n    bl _0801F5FA\n_0801EB78:\n    lsls r0, 2\n    ldr r1, _0801EB88 @ =_0801EB8C\n    adds r0, r1\n    ldr r0, [r0]\n    mov pc, r0\n    .align 2, 0\n_0801EB84: .4byte gStatusFlagsForMoveEffects\n_0801EB88: .4byte _0801EB8C\n    .align 2, 0\n_0801EB8C:\n    .4byte _0801EC60\n    .4byte _0801ECD4\n    .4byte _0801EE4C\n    .4byte _0801ED60\n    .4byte _0801EDDC\n    .4byte _0801EE84\n    .4byte _0801EECC\n    .4byte _0801EFA8\n    .4byte _0801EFEC\n    .4byte _0801EFEC\n    .4byte _0801EFEC\n    .4byte _0801EFEC\n    .4byte _0801EFEC\n    .4byte _0801EFEC\n    .4byte _0801EFEC\n    .4byte _0801F040\n    .4byte _0801F040\n    .4byte _0801F040\n    .4byte _0801F040\n    .4byte _0801F040\n    .4byte _0801F040\n    .4byte _0801F040\n    .4byte _0801F13C\n    .4byte _0801F184\n    .4byte _0801F1A4\n    .4byte _0801F364\n    .4byte _0801F3A0\n    .4byte _0801F3BC\n    .4byte _0801F3D4\n    .4byte _0801F3EC\n    .4byte _0801F44C\n    .4byte _0801F464\n    .4byte _0801F094\n    .4byte _0801F094\n    .4byte _0801F094\n    .4byte _0801F094\n    .4byte _0801F094\n    .4byte _0801F094\n    .4byte _0801F094\n    .4byte _0801F0E8\n    .4byte _0801F0E8\n    .4byte _0801F0E8\n    .4byte _0801F0E8\n    .4byte _0801F0E8\n    .4byte _0801F0E8\n    .4byte _0801F0E8\n    .4byte _0801F4A8\n    .4byte _0801F500\n    .4byte _0801F5FA\n    .4byte _0801F5FA\n    .4byte _0801F5FA\n    .4byte _0801F5FA\n    .4byte _0801F5EC\n_0801EC60:\n    mov r1, r8\n    ldrb r0, [r1]\n    movs r5, 0x58\n    adds r1, r0, 0\n    muls r1, r5\n    mov r2, r9\n    adds r0, r1, r2\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x14\n    bne _0801EC7A\n    bl _0801F5DC\n_0801EC7A:\n    mov r4, r9\n    adds r4, 0x50\n    adds r0, r1, r4\n    ldr r0, [r0]\n    movs r1, 0x7\n    ands r0, r1\n    cmp r0, 0\n    beq _0801EC8E\n    bl _0801F5DC\n_0801EC8E:\n    bl Random\n    mov r3, r8\n    ldrb r1, [r3]\n    adds r2, r1, 0\n    muls r2, r5\n    adds r2, r4\n    lsls r0, 16\n    movs r1, 0xC0\n    lsls r1, 10\n    ands r1, r0\n    lsrs r1, 16\n    adds r1, 0x2\n    ldr r0, [r2]\n    orrs r0, r1\n    str r0, [r2]\n    ldr r4, _0801ECC8 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r1, _0801ECCC @ =gMoveEffectBS_Ptrs\n    ldr r0, _0801ECD0 @ =gBattleCommunication\n    ldrb r0, [r0, 0x3]\n    lsls r0, 2\n    adds r0, r1\n    ldr r0, [r0]\n    bl _0801F5F8\n    .align 2, 0\n_0801ECC8: .4byte gBattlescriptCurrInstr\n_0801ECCC: .4byte gMoveEffectBS_Ptrs\n_0801ECD0: .4byte gBattleCommunication\n_0801ECD4:\n    mov r0, r8\n    ldrb r2, [r0]\n    movs r6, 0x58\n    adds r0, r2, 0\n    muls r0, r6\n    add r0, r9\n    adds r0, 0x20\n    ldrb r1, [r0]\n    cmp r1, 0x27\n    bne _0801ED18\n    cmp r4, 0x1\n    beq _0801ECF4\n    cmp r5, 0x80\n    beq _0801ECF4\n    bl _0801F5DC\n_0801ECF4:\n    ldr r0, _0801ED0C @ =gLastUsedAbility\n    strb r1, [r0]\n    mov r1, r8\n    ldrb r0, [r1]\n    movs r1, 0x27\n    bl RecordAbilityBattle\n    ldr r1, _0801ED10 @ =gBattlescriptCurrInstr\n    ldr r0, _0801ED14 @ =BattleScript_FlinchPrevention\n    str r0, [r1]\n    bl _0801F5FA\n    .align 2, 0\n_0801ED0C: .4byte gLastUsedAbility\n_0801ED10: .4byte gBattlescriptCurrInstr\n_0801ED14: .4byte BattleScript_FlinchPrevention\n_0801ED18:\n    adds r0, r2, 0\n    bl BankGetTurnOrder\n    ldr r1, _0801ED54 @ =gCurrentMoveTurn\n    lsls r0, 24\n    lsrs r0, 24\n    ldrb r1, [r1]\n    cmp r0, r1\n    bhi _0801ED2E\n    bl _0801F5DC\n_0801ED2E:\n    mov r2, r8\n    ldrb r0, [r2]\n    adds r2, r0, 0\n    muls r2, r6\n    mov r0, r9\n    adds r0, 0x50\n    adds r2, r0\n    ldr r1, _0801ED58 @ =gStatusFlagsForMoveEffects\n    ldr r0, _0801ED5C @ =gBattleCommunication\n    ldrb r0, [r0, 0x3]\n    lsls r0, 2\n    adds r0, r1\n    ldr r1, [r2]\n    ldr r0, [r0]\n    orrs r1, r0\n    str r1, [r2]\n    bl _0801F5DC\n    .align 2, 0\n_0801ED54: .4byte gCurrentMoveTurn\n_0801ED58: .4byte gStatusFlagsForMoveEffects\n_0801ED5C: .4byte gBattleCommunication\n_0801ED60:\n    mov r3, r8\n    ldrb r0, [r3]\n    movs r5, 0x58\n    muls r0, r5\n    mov r4, r9\n    adds r4, 0x50\n    adds r2, r0, r4\n    ldr r1, [r2]\n    movs r0, 0x70\n    ands r0, r1\n    cmp r0, 0\n    beq _0801ED7C\n    bl _0801F5DC\n_0801ED7C:\n    movs r0, 0x80\n    lsls r0, 5\n    orrs r1, r0\n    str r1, [r2]\n    ldr r1, _0801EDC8 @ =gLockedMove\n    ldrb r0, [r3]\n    lsls r0, 1\n    adds r0, r1\n    ldr r1, _0801EDCC @ =gCurrentMove\n    ldrh r1, [r1]\n    strh r1, [r0]\n    bl Random\n    mov r2, r8\n    ldrb r1, [r2]\n    adds r2, r1, 0\n    muls r2, r5\n    adds r2, r4\n    movs r1, 0x3\n    ands r1, r0\n    adds r1, 0x2\n    lsls r1, 4\n    ldr r0, [r2]\n    orrs r0, r1\n    str r0, [r2]\n    ldr r4, _0801EDD0 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r1, _0801EDD4 @ =gMoveEffectBS_Ptrs\n    ldr r0, _0801EDD8 @ =gBattleCommunication\n    ldrb r0, [r0, 0x3]\n    lsls r0, 2\n    adds r0, r1\n    ldr r0, [r0]\n    bl _0801F5F8\n    .align 2, 0\n_0801EDC8: .4byte gLockedMove\n_0801EDCC: .4byte gCurrentMove\n_0801EDD0: .4byte gBattlescriptCurrInstr\n_0801EDD4: .4byte gMoveEffectBS_Ptrs\n_0801EDD8: .4byte gBattleCommunication\n_0801EDDC:\n    ldr r5, _0801EE30 @ =gBankAttacker\n    ldrb r0, [r5]\n    bl GetBankIdentity\n    movs r1, 0x1\n    ands r1, r0\n    cmp r1, 0\n    bne _0801EE14\n    ldr r4, _0801EE34 @ =gPaydayMoney\n    ldrh r3, [r4]\n    ldr r2, _0801EE38 @ =gBattleMons\n    ldrb r1, [r5]\n    movs r0, 0x58\n    muls r0, r1\n    adds r0, r2\n    adds r0, 0x2A\n    ldrb r1, [r0]\n    lsls r0, r1, 2\n    adds r0, r1\n    adds r0, r3, r0\n    strh r0, [r4]\n    lsls r0, 16\n    lsrs r0, 16\n    cmp r3, r0\n    bls _0801EE14\n    ldr r3, _0801EE3C @ =0x0000ffff\n    adds r0, r3, 0\n    strh r0, [r4]\n_0801EE14:\n    ldr r4, _0801EE40 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r1, _0801EE44 @ =gMoveEffectBS_Ptrs\n    ldr r0, _0801EE48 @ =gBattleCommunication\n    ldrb r0, [r0, 0x3]\n    lsls r0, 2\n    adds r0, r1\n    ldr r0, [r0]\n    bl _0801F5F8\n    .align 2, 0\n_0801EE30: .4byte gBankAttacker\n_0801EE34: .4byte gPaydayMoney\n_0801EE38: .4byte gBattleMons\n_0801EE3C: .4byte 0x0000ffff\n_0801EE40: .4byte gBattlescriptCurrInstr\n_0801EE44: .4byte gMoveEffectBS_Ptrs\n_0801EE48: .4byte gBattleCommunication\n_0801EE4C:\n    mov r4, r8\n    ldrb r1, [r4]\n    movs r0, 0x58\n    muls r0, r1\n    mov r1, r9\n    adds r1, 0x4C\n    adds r0, r1\n    ldr r0, [r0]\n    cmp r0, 0\n    beq _0801EE62\n    b _0801F5DC\n_0801EE62:\n    bl Random\n    ldr r4, _0801EE80 @ =gBattleCommunication\n    lsls r0, 16\n    lsrs r0, 16\n    movs r1, 0x3\n    bl __umodsi3\n    adds r0, 0x3\n    strb r0, [r4, 0x3]\n    movs r0, 0\n    movs r1, 0\n    bl SetMoveEffect\n    b _0801F5FA\n    .align 2, 0\n_0801EE80: .4byte gBattleCommunication\n_0801EE84:\n    mov r0, r8\n    ldrb r1, [r0]\n    movs r0, 0x58\n    adds r2, r1, 0\n    muls r2, r0\n    mov r0, r9\n    adds r0, 0x50\n    adds r2, r0\n    ldr r0, [r2]\n    movs r1, 0x80\n    lsls r1, 5\n    orrs r0, r1\n    str r0, [r2]\n    ldr r1, _0801EEC0 @ =gLockedMove\n    mov r2, r8\n    ldrb r0, [r2]\n    lsls r0, 1\n    adds r0, r1\n    ldr r1, _0801EEC4 @ =gCurrentMove\n    ldrh r1, [r1]\n    strh r1, [r0]\n    ldr r0, _0801EEC8 @ =gProtectStructs\n    ldrb r1, [r2]\n    lsls r1, 4\n    adds r1, r0\n    ldrb r0, [r1, 0x1]\n    movs r2, 0x4\n    orrs r0, r2\n    strb r0, [r1, 0x1]\n    b _0801F5DC\n    .align 2, 0\n_0801EEC0: .4byte gLockedMove\n_0801EEC4: .4byte gCurrentMove\n_0801EEC8: .4byte gProtectStructs\n_0801EECC:\n    mov r3, r8\n    ldrb r0, [r3]\n    movs r6, 0x58\n    muls r0, r6\n    mov r4, r9\n    adds r4, 0x50\n    adds r0, r4\n    ldr r5, [r0]\n    movs r0, 0xE0\n    lsls r0, 8\n    ands r5, r0\n    cmp r5, 0\n    beq _0801EEE8\n    b _0801F5DC\n_0801EEE8:\n    bl Random\n    mov r2, r8\n    ldrb r1, [r2]\n    adds r2, r1, 0\n    muls r2, r6\n    adds r2, r4\n    movs r1, 0x3\n    ands r1, r0\n    adds r1, 0x3\n    lsls r1, 13\n    ldr r0, [r2]\n    orrs r0, r1\n    str r0, [r2]\n    ldr r2, _0801EF80 @ =gSharedMem\n    mov r3, r8\n    ldrb r0, [r3]\n    lsls r0, 1\n    ldr r4, _0801EF84 @ =0x00016004\n    adds r0, r4\n    adds r0, r2\n    ldr r6, _0801EF88 @ =gCurrentMove\n    ldrh r1, [r6]\n    strb r1, [r0]\n    ldrb r0, [r3]\n    lsls r0, 1\n    ldr r1, _0801EF8C @ =0x00016005\n    adds r0, r1\n    adds r0, r2\n    ldrh r1, [r6]\n    lsrs r1, 8\n    strb r1, [r0]\n    ldrb r0, [r3]\n    ldr r3, _0801EF90 @ =0x00016020\n    adds r0, r3\n    adds r0, r2\n    ldr r1, _0801EF94 @ =gBankAttacker\n    ldrb r1, [r1]\n    strb r1, [r0]\n    ldr r4, _0801EF98 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r1, _0801EF9C @ =gMoveEffectBS_Ptrs\n    ldr r2, _0801EFA0 @ =gBattleCommunication\n    ldrb r0, [r2, 0x3]\n    lsls r0, 2\n    adds r0, r1\n    ldr r0, [r0]\n    str r0, [r4]\n    strb r5, [r2, 0x5]\n    ldr r1, _0801EFA4 @ =gTrappingMoves\n    ldrh r0, [r1]\n    ldrh r4, [r6]\n    cmp r0, r4\n    bne _0801EF5C\n    b _0801F5FA\n_0801EF5C:\n    adds r3, r1, 0\n    adds r1, r6, 0\n_0801EF60:\n    ldrb r0, [r2, 0x5]\n    adds r0, 0x1\n    strb r0, [r2, 0x5]\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x4\n    bls _0801EF70\n    b _0801F5FA\n_0801EF70:\n    ldrb r0, [r2, 0x5]\n    lsls r0, 1\n    adds r0, r3\n    ldrh r0, [r0]\n    ldrh r4, [r1]\n    cmp r0, r4\n    bne _0801EF60\n    b _0801F5FA\n    .align 2, 0\n_0801EF80: .4byte gSharedMem\n_0801EF84: .4byte 0x00016004\n_0801EF88: .4byte gCurrentMove\n_0801EF8C: .4byte 0x00016005\n_0801EF90: .4byte 0x00016020\n_0801EF94: .4byte gBankAttacker\n_0801EF98: .4byte gBattlescriptCurrInstr\n_0801EF9C: .4byte gMoveEffectBS_Ptrs\n_0801EFA0: .4byte gBattleCommunication\n_0801EFA4: .4byte gTrappingMoves\n_0801EFA8:\n    ldr r1, _0801EFD8 @ =gBattleMoveDamage\n    ldr r0, _0801EFDC @ =gHP_dealt\n    ldr r0, [r0]\n    cmp r0, 0\n    bge _0801EFB4\n    adds r0, 0x3\n_0801EFB4:\n    asrs r0, 2\n    str r0, [r1]\n    cmp r0, 0\n    bne _0801EFC0\n    movs r0, 0x1\n    str r0, [r1]\n_0801EFC0:\n    ldr r4, _0801EFE0 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r1, _0801EFE4 @ =gMoveEffectBS_Ptrs\n    ldr r0, _0801EFE8 @ =gBattleCommunication\n    ldrb r0, [r0, 0x3]\n    lsls r0, 2\n    adds r0, r1\n    ldr r0, [r0]\n    b _0801F5F8\n    .align 2, 0\n_0801EFD8: .4byte gBattleMoveDamage\n_0801EFDC: .4byte gHP_dealt\n_0801EFE0: .4byte gBattlescriptCurrInstr\n_0801EFE4: .4byte gMoveEffectBS_Ptrs\n_0801EFE8: .4byte gBattleCommunication\n_0801EFEC:\n    ldrb r1, [r7, 0x3]\n    adds r1, 0xF2\n    lsls r1, 24\n    lsrs r1, 24\n    movs r0, 0x10\n    adds r2, r6, 0\n    movs r3, 0\n    bl ChangeStatBuffs\n    lsls r0, 24\n    lsrs r3, r0, 24\n    cmp r3, 0\n    beq _0801F008\n    b _0801F5DC\n_0801F008:\n    ldr r2, _0801F02C @ =gSharedMem\n    ldrb r1, [r7, 0x3]\n    movs r0, 0x3F\n    ands r0, r1\n    ldr r4, _0801F030 @ =0x000160a4\n    adds r1, r2, r4\n    strb r0, [r1]\n    ldr r0, _0801F034 @ =0x000160a5\n    adds r2, r0\n    strb r3, [r2]\n    ldr r4, _0801F038 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801F03C @ =BattleScript_StatUp\n    b _0801F5F8\n    .align 2, 0\n_0801F02C: .4byte gSharedMem\n_0801F030: .4byte 0x000160a4\n_0801F034: .4byte 0x000160a5\n_0801F038: .4byte gBattlescriptCurrInstr\n_0801F03C: .4byte BattleScript_StatUp\n_0801F040:\n    movs r0, 0x70\n    negs r0, r0\n    ldrb r1, [r7, 0x3]\n    adds r1, 0xEB\n    lsls r1, 24\n    lsrs r1, 24\n    adds r2, r6, 0\n    movs r3, 0\n    bl ChangeStatBuffs\n    lsls r0, 24\n    lsrs r3, r0, 24\n    cmp r3, 0\n    beq _0801F05E\n    b _0801F5DC\n_0801F05E:\n    ldr r2, _0801F080 @ =gSharedMem\n    ldrb r1, [r7, 0x3]\n    movs r0, 0x3F\n    ands r0, r1\n    ldr r4, _0801F084 @ =0x000160a4\n    adds r1, r2, r4\n    strb r0, [r1]\n    ldr r0, _0801F088 @ =0x000160a5\n    adds r2, r0\n    strb r3, [r2]\n    ldr r4, _0801F08C @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801F090 @ =BattleScript_StatDown\n    b _0801F5F8\n    .align 2, 0\n_0801F080: .4byte gSharedMem\n_0801F084: .4byte 0x000160a4\n_0801F088: .4byte 0x000160a5\n_0801F08C: .4byte gBattlescriptCurrInstr\n_0801F090: .4byte BattleScript_StatDown\n_0801F094:\n    ldrb r1, [r7, 0x3]\n    adds r1, 0xDA\n    lsls r1, 24\n    lsrs r1, 24\n    movs r0, 0x20\n    adds r2, r6, 0\n    movs r3, 0\n    bl ChangeStatBuffs\n    lsls r0, 24\n    lsrs r3, r0, 24\n    cmp r3, 0\n    beq _0801F0B0\n    b _0801F5DC\n_0801F0B0:\n    ldr r2, _0801F0D4 @ =gSharedMem\n    ldrb r1, [r7, 0x3]\n    movs r0, 0x3F\n    ands r0, r1\n    ldr r4, _0801F0D8 @ =0x000160a4\n    adds r1, r2, r4\n    strb r0, [r1]\n    ldr r0, _0801F0DC @ =0x000160a5\n    adds r2, r0\n    strb r3, [r2]\n    ldr r4, _0801F0E0 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801F0E4 @ =BattleScript_StatUp\n    b _0801F5F8\n    .align 2, 0\n_0801F0D4: .4byte gSharedMem\n_0801F0D8: .4byte 0x000160a4\n_0801F0DC: .4byte 0x000160a5\n_0801F0E0: .4byte gBattlescriptCurrInstr\n_0801F0E4: .4byte BattleScript_StatUp\n_0801F0E8:\n    movs r0, 0x60\n    negs r0, r0\n    ldrb r1, [r7, 0x3]\n    adds r1, 0xD3\n    lsls r1, 24\n    lsrs r1, 24\n    adds r2, r6, 0\n    movs r3, 0\n    bl ChangeStatBuffs\n    lsls r0, 24\n    lsrs r3, r0, 24\n    cmp r3, 0\n    beq _0801F106\n    b _0801F5DC\n_0801F106:\n    ldr r2, _0801F128 @ =gSharedMem\n    ldrb r1, [r7, 0x3]\n    movs r0, 0x3F\n    ands r0, r1\n    ldr r4, _0801F12C @ =0x000160a4\n    adds r1, r2, r4\n    strb r0, [r1]\n    ldr r0, _0801F130 @ =0x000160a5\n    adds r2, r0\n    strb r3, [r2]\n    ldr r4, _0801F134 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801F138 @ =BattleScript_StatDown\n    b _0801F5F8\n    .align 2, 0\n_0801F128: .4byte gSharedMem\n_0801F12C: .4byte 0x000160a4\n_0801F130: .4byte 0x000160a5\n_0801F134: .4byte gBattlescriptCurrInstr\n_0801F138: .4byte BattleScript_StatDown\n_0801F13C:\n    mov r2, r8\n    ldrb r1, [r2]\n    movs r0, 0x58\n    adds r2, r1, 0\n    muls r2, r0\n    mov r0, r9\n    adds r0, 0x50\n    adds r2, r0\n    ldr r0, [r2]\n    movs r1, 0x80\n    lsls r1, 15\n    orrs r0, r1\n    str r0, [r2]\n    ldr r2, _0801F178 @ =gDisableStructs\n    mov r3, r8\n    ldrb r1, [r3]\n    lsls r0, r1, 3\n    subs r0, r1\n    lsls r0, 2\n    adds r0, r2\n    movs r1, 0x2\n    strb r1, [r0, 0x19]\n    ldr r1, _0801F17C @ =gLockedMove\n    ldrb r0, [r3]\n    lsls r0, 1\n    adds r0, r1\n    ldr r1, _0801F180 @ =gCurrentMove\n    ldrh r1, [r1]\n    strh r1, [r0]\n    b _0801F5DC\n    .align 2, 0\n_0801F178: .4byte gDisableStructs\n_0801F17C: .4byte gLockedMove\n_0801F180: .4byte gCurrentMove\n_0801F184:\n    ldr r0, _0801F1A0 @ =gBankAttacker\n    ldrb r1, [r0]\n    movs r0, 0x58\n    adds r2, r1, 0\n    muls r2, r0\n    mov r0, r9\n    adds r0, 0x50\n    adds r2, r0\n    ldr r0, [r2]\n    movs r1, 0x80\n    lsls r1, 16\n_0801F19A:\n    orrs r0, r1\n    str r0, [r2]\n    b _0801F5DC\n    .align 2, 0\n_0801F1A0: .4byte gBankAttacker\n_0801F1A4:\n    ldr r4, _0801F254 @ =gBankAttacker\n    ldrb r0, [r4]\n    bl GetBankSide\n    lsls r0, 24\n    lsrs r6, r0, 24\n    ldrb r0, [r4]\n    bl GetBankSide\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x1\n    bne _0801F1D8\n    ldr r0, _0801F258 @ =gBattleTypeFlags\n    ldrh r1, [r0]\n    ldr r0, _0801F25C @ =0x00000902\n    ands r0, r1\n    cmp r0, 0\n    bne _0801F214\n    ldr r0, _0801F260 @ =gTrainerBattleOpponent\n    ldrh r1, [r0]\n    movs r0, 0x80\n    lsls r0, 3\n    cmp r1, r0\n    beq _0801F1D8\n    b _0801F5DC\n_0801F1D8:\n    ldr r0, _0801F258 @ =gBattleTypeFlags\n    ldrh r1, [r0]\n    ldr r0, _0801F25C @ =0x00000902\n    ands r0, r1\n    cmp r0, 0\n    bne _0801F214\n    ldr r0, _0801F260 @ =gTrainerBattleOpponent\n    ldrh r1, [r0]\n    movs r0, 0x80\n    lsls r0, 3\n    cmp r1, r0\n    beq _0801F214\n    ldr r0, _0801F264 @ =gWishFutureKnock\n    adds r0, 0x29\n    adds r0, r6, r0\n    ldrb r1, [r0]\n    ldr r3, _0801F268 @ =gBitTable\n    ldr r2, _0801F26C @ =gBattlePartyID\n    ldr r0, _0801F254 @ =gBankAttacker\n    ldrb r0, [r0]\n    lsls r0, 1\n    adds r0, r2\n    ldrh r0, [r0]\n    lsls r0, 2\n    adds r0, r3\n    ldr r0, [r0]\n    ands r1, r0\n    cmp r1, 0\n    beq _0801F214\n    b _0801F5DC\n_0801F214:\n    ldr r2, _0801F270 @ =gBattleMons\n    ldr r1, _0801F274 @ =gBankTarget\n    ldrb r0, [r1]\n    movs r3, 0x58\n    muls r0, r3\n    adds r4, r0, r2\n    ldrh r0, [r4, 0x2E]\n    adds r7, r1, 0\n    mov r9, r2\n    cmp r0, 0\n    beq _0801F284\n    adds r0, r4, 0\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x3C\n    bne _0801F284\n    ldr r1, _0801F278 @ =gBattlescriptCurrInstr\n    ldr r0, _0801F27C @ =BattleScript_NoItemSteal\n    str r0, [r1]\n    ldr r1, _0801F280 @ =gLastUsedAbility\n    ldrb r0, [r7]\n    muls r0, r3\n    add r0, r9\n    adds r0, 0x20\n    ldrb r0, [r0]\n    strb r0, [r1]\n    ldrb r0, [r7]\n    ldrb r1, [r1]\n    bl RecordAbilityBattle\n    b _0801F5FA\n    .align 2, 0\n_0801F254: .4byte gBankAttacker\n_0801F258: .4byte gBattleTypeFlags\n_0801F25C: .4byte 0x00000902\n_0801F260: .4byte gTrainerBattleOpponent\n_0801F264: .4byte gWishFutureKnock\n_0801F268: .4byte gBitTable\n_0801F26C: .4byte gBattlePartyID\n_0801F270: .4byte gBattleMons\n_0801F274: .4byte gBankTarget\n_0801F278: .4byte gBattlescriptCurrInstr\n_0801F27C: .4byte BattleScript_NoItemSteal\n_0801F280: .4byte gLastUsedAbility\n_0801F284:\n    ldr r4, _0801F340 @ =gBankAttacker\n    mov r10, r4\n    ldrb r1, [r4]\n    movs r0, 0x58\n    mov r8, r0\n    mov r0, r8\n    muls r0, r1\n    add r0, r9\n    ldrh r3, [r0, 0x2E]\n    cmp r3, 0\n    beq _0801F29C\n    b _0801F5DC\n_0801F29C:\n    ldrb r0, [r7]\n    mov r2, r8\n    muls r2, r0\n    adds r0, r2, 0\n    add r0, r9\n    ldrh r2, [r0, 0x2E]\n    adds r0, r2, 0\n    cmp r0, 0xAF\n    bne _0801F2B0\n    b _0801F5DC\n_0801F2B0:\n    cmp r0, 0\n    bne _0801F2B6\n    b _0801F5DC\n_0801F2B6:\n    lsls r0, r1, 1\n    ldr r5, _0801F344 @ =gSharedMem + 0x160F0\n    adds r0, r5\n    ldr r1, _0801F348 @ =gLastUsedItem\n    strh r2, [r0]\n    strh r2, [r1]\n    ldrb r0, [r7]\n    mov r4, r8\n    muls r4, r0\n    adds r0, r4, 0\n    add r0, r9\n    movs r6, 0\n    strh r3, [r0, 0x2E]\n    ldr r4, _0801F34C @ =gActiveBank\n    mov r2, r10\n    ldrb r0, [r2]\n    strb r0, [r4]\n    str r1, [sp]\n    movs r0, 0\n    movs r1, 0x2\n    movs r2, 0\n    movs r3, 0x2\n    bl EmitSetAttributes\n    mov r3, r10\n    ldrb r0, [r3]\n    bl MarkBufferBankForExecution\n    ldrb r0, [r7]\n    strb r0, [r4]\n    ldrb r0, [r7]\n    mov r4, r8\n    muls r4, r0\n    adds r0, r4, 0\n    mov r1, r9\n    adds r1, 0x2E\n    adds r0, r1\n    str r0, [sp]\n    movs r0, 0\n    movs r1, 0x2\n    movs r2, 0\n    movs r3, 0x2\n    bl EmitSetAttributes\n    ldrb r0, [r7]\n    bl MarkBufferBankForExecution\n    ldr r4, _0801F350 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801F354 @ =BattleScript_ItemSteal\n    str r0, [r4]\n    ldr r0, _0801F358 @ =0xfffe9f10\n    adds r5, r0\n    ldrb r0, [r7]\n    lsls r0, 1\n    ldr r1, _0801F35C @ =0x000160e8\n    adds r0, r1\n    adds r0, r5\n    strb r6, [r0]\n    ldrb r0, [r7]\n    lsls r0, 1\n    ldr r2, _0801F360 @ =0x000160e9\n    adds r0, r2\n    adds r0, r5\n    strb r6, [r0]\n    b _0801F5FA\n    .align 2, 0\n_0801F340: .4byte gBankAttacker\n_0801F344: .4byte gSharedMem + 0x160F0\n_0801F348: .4byte gLastUsedItem\n_0801F34C: .4byte gActiveBank\n_0801F350: .4byte gBattlescriptCurrInstr\n_0801F354: .4byte BattleScript_ItemSteal\n_0801F358: .4byte 0xfffe9f10\n_0801F35C: .4byte 0x000160e8\n_0801F360: .4byte 0x000160e9\n_0801F364:\n    ldr r3, _0801F394 @ =gBankTarget\n    ldrb r1, [r3]\n    movs r0, 0x58\n    adds r2, r1, 0\n    muls r2, r0\n    mov r0, r9\n    adds r0, 0x50\n    adds r2, r0\n    ldr r0, [r2]\n    movs r1, 0x80\n    lsls r1, 19\n    orrs r0, r1\n    str r0, [r2]\n    ldr r2, _0801F398 @ =gDisableStructs\n    ldrb r1, [r3]\n    lsls r0, r1, 3\n    subs r0, r1\n    lsls r0, 2\n    adds r0, r2\n    ldr r1, _0801F39C @ =gBankAttacker\n    ldrb r1, [r1]\n    strb r1, [r0, 0x14]\n    b _0801F5DC\n    .align 2, 0\n_0801F394: .4byte gBankTarget\n_0801F398: .4byte gDisableStructs\n_0801F39C: .4byte gBankAttacker\n_0801F3A0:\n    ldr r0, _0801F3B8 @ =gBankTarget\n    ldrb r1, [r0]\n    movs r0, 0x58\n    adds r2, r1, 0\n    muls r2, r0\n    mov r0, r9\n    adds r0, 0x50\n    adds r2, r0\n    ldr r0, [r2]\n    movs r1, 0x80\n    lsls r1, 20\n    b _0801F19A\n    .align 2, 0\n_0801F3B8: .4byte gBankTarget\n_0801F3BC:\n    ldr r4, _0801F3CC @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801F3D0 @ =BattleScript_AllStatsUp\n    b _0801F5F8\n    .align 2, 0\n_0801F3CC: .4byte gBattlescriptCurrInstr\n_0801F3D0: .4byte BattleScript_AllStatsUp\n_0801F3D4:\n    ldr r4, _0801F3E4 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801F3E8 @ =BattleScript_RapidSpinAway\n    b _0801F5F8\n    .align 2, 0\n_0801F3E4: .4byte gBattlescriptCurrInstr\n_0801F3E8: .4byte BattleScript_RapidSpinAway\n_0801F3EC:\n    ldr r6, _0801F43C @ =gBankTarget\n    ldrb r0, [r6]\n    movs r2, 0x58\n    muls r0, r2\n    mov r1, r9\n    adds r1, 0x4C\n    adds r5, r0, r1\n    ldr r4, [r5]\n    movs r0, 0x40\n    ands r0, r4\n    cmp r0, 0\n    bne _0801F406\n    b _0801F5DC\n_0801F406:\n    movs r0, 0x41\n    negs r0, r0\n    ands r4, r0\n    str r4, [r5]\n    ldr r4, _0801F440 @ =gActiveBank\n    ldrb r0, [r6]\n    strb r0, [r4]\n    ldrb r0, [r4]\n    muls r0, r2\n    adds r0, r1\n    str r0, [sp]\n    movs r0, 0\n    movs r1, 0x28\n    movs r2, 0\n    movs r3, 0x4\n    bl EmitSetAttributes\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    ldr r4, _0801F444 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801F448 @ =BattleScript_TargetPRLZHeal\n    b _0801F5F8\n    .align 2, 0\n_0801F43C: .4byte gBankTarget\n_0801F440: .4byte gActiveBank\n_0801F444: .4byte gBattlescriptCurrInstr\n_0801F448: .4byte BattleScript_TargetPRLZHeal\n_0801F44C:\n    ldr r4, _0801F45C @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801F460 @ =BattleScript_AtkDefDown\n    b _0801F5F8\n    .align 2, 0\n_0801F45C: .4byte gBattlescriptCurrInstr\n_0801F460: .4byte BattleScript_AtkDefDown\n_0801F464:\n    ldr r4, _0801F494 @ =gBattleMoveDamage\n    ldr r0, _0801F498 @ =gHP_dealt\n    ldr r0, [r0]\n    movs r1, 0x3\n    bl __divsi3\n    str r0, [r4]\n    cmp r0, 0\n    bne _0801F47A\n    movs r0, 0x1\n    str r0, [r4]\n_0801F47A:\n    ldr r4, _0801F49C @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r1, _0801F4A0 @ =gMoveEffectBS_Ptrs\n    ldr r0, _0801F4A4 @ =gBattleCommunication\n    ldrb r0, [r0, 0x3]\n    lsls r0, 2\n    adds r0, r1\n    ldr r0, [r0]\n    b _0801F5F8\n    .align 2, 0\n_0801F494: .4byte gBattleMoveDamage\n_0801F498: .4byte gHP_dealt\n_0801F49C: .4byte gBattlescriptCurrInstr\n_0801F4A0: .4byte gMoveEffectBS_Ptrs\n_0801F4A4: .4byte gBattleCommunication\n_0801F4A8:\n    mov r3, r8\n    ldrb r0, [r3]\n    movs r5, 0x58\n    muls r0, r5\n    mov r4, r9\n    adds r4, 0x50\n    adds r2, r0, r4\n    ldr r1, [r2]\n    movs r0, 0xC0\n    lsls r0, 4\n    ands r0, r1\n    cmp r0, 0\n    beq _0801F4C4\n    b _0801F5DC\n_0801F4C4:\n    movs r0, 0x80\n    lsls r0, 5\n    orrs r1, r0\n    str r1, [r2]\n    ldr r1, _0801F4F8 @ =gLockedMove\n    ldrb r0, [r3]\n    lsls r0, 1\n    adds r0, r1\n    ldr r1, _0801F4FC @ =gCurrentMove\n    ldrh r1, [r1]\n    strh r1, [r0]\n    bl Random\n    mov r2, r8\n    ldrb r1, [r2]\n    adds r2, r1, 0\n    muls r2, r5\n    adds r2, r4\n    movs r1, 0x1\n    ands r1, r0\n    adds r1, 0x2\n    lsls r1, 10\n    ldr r0, [r2]\n_0801F4F2:\n    orrs r0, r1\n    str r0, [r2]\n    b _0801F5FA\n    .align 2, 0\n_0801F4F8: .4byte gLockedMove\n_0801F4FC: .4byte gCurrentMove\n_0801F500:\n    mov r5, r8\n    ldrb r3, [r5]\n    movs r4, 0x58\n    adds r0, r3, 0\n    muls r0, r4\n    mov r2, r9\n    adds r1, r0, r2\n    adds r0, r1, 0\n    adds r0, 0x20\n    ldrb r2, [r0]\n    cmp r2, 0x3C\n    bne _0801F540\n    ldrh r0, [r1, 0x2E]\n    cmp r0, 0\n    beq _0801F5DC\n    ldr r0, _0801F534 @ =gLastUsedAbility\n    strb r2, [r0]\n    ldr r1, _0801F538 @ =gBattlescriptCurrInstr\n    ldr r0, _0801F53C @ =BattleScript_NoItemSteal\n    str r0, [r1]\n    ldrb r0, [r5]\n    movs r1, 0x3C\n    bl RecordAbilityBattle\n    b _0801F5FA\n    .align 2, 0\n_0801F534: .4byte gLastUsedAbility\n_0801F538: .4byte gBattlescriptCurrInstr\n_0801F53C: .4byte BattleScript_NoItemSteal\n_0801F540:\n    ldrh r0, [r1, 0x2E]\n    cmp r0, 0\n    beq _0801F5DC\n    adds r0, r3, 0\n    bl GetBankSide\n    lsls r0, 24\n    lsrs r6, r0, 24\n    ldr r1, _0801F5B8 @ =gLastUsedItem\n    mov r3, r8\n    ldrb r0, [r3]\n    muls r0, r4\n    add r0, r9\n    ldrh r0, [r0, 0x2E]\n    strh r0, [r1]\n    ldrb r0, [r3]\n    muls r0, r4\n    add r0, r9\n    movs r5, 0\n    movs r1, 0\n    strh r1, [r0, 0x2E]\n    ldr r2, _0801F5BC @ =gWishFutureKnock\n    adds r2, 0x29\n    adds r2, r6, r2\n    ldr r3, _0801F5C0 @ =gBitTable\n    ldr r1, _0801F5C4 @ =gBattlePartyID\n    mov r4, r8\n    ldrb r0, [r4]\n    lsls r0, 1\n    adds r0, r1\n    ldrh r0, [r0]\n    lsls r0, 2\n    adds r0, r3\n    ldr r0, [r0]\n    ldrb r1, [r2]\n    orrs r0, r1\n    strb r0, [r2]\n    ldr r4, _0801F5C8 @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801F5CC @ =BattleScript_KnockedOff\n    str r0, [r4]\n    ldr r1, _0801F5D0 @ =gSharedMem\n    mov r2, r8\n    ldrb r0, [r2]\n    lsls r0, 1\n    ldr r3, _0801F5D4 @ =0x000160e8\n    adds r0, r3\n    adds r0, r1\n    strb r5, [r0]\n    ldrb r0, [r2]\n    lsls r0, 1\n    ldr r4, _0801F5D8 @ =0x000160e9\n    adds r0, r4\n    adds r0, r1\n    strb r5, [r0]\n    b _0801F5FA\n    .align 2, 0\n_0801F5B8: .4byte gLastUsedItem\n_0801F5BC: .4byte gWishFutureKnock\n_0801F5C0: .4byte gBitTable\n_0801F5C4: .4byte gBattlePartyID\n_0801F5C8: .4byte gBattlescriptCurrInstr\n_0801F5CC: .4byte BattleScript_KnockedOff\n_0801F5D0: .4byte gSharedMem\n_0801F5D4: .4byte 0x000160e8\n_0801F5D8: .4byte 0x000160e9\n_0801F5DC:\n    ldr r1, _0801F5E8 @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x1\n    str r0, [r1]\n    b _0801F5FA\n    .align 2, 0\n_0801F5E8: .4byte gBattlescriptCurrInstr\n_0801F5EC:\n    ldr r4, _0801F60C @ =gBattlescriptCurrInstr\n    ldr r0, [r4]\n    adds r0, 0x1\n    bl b_movescr_stack_push\n    ldr r0, _0801F610 @ =BattleScript_SAtkDown2\n_0801F5F8:\n    str r0, [r4]\n_0801F5FA:\n    add sp, 0x8\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0801F60C: .4byte gBattlescriptCurrInstr\n_0801F610: .4byte BattleScript_SAtkDown2\n        .syntax divided\n");
# 4918 "src/battle/battle_4.c"
}



static void atk15_seteffectwithchancetarget(void)
{
    u32 PercentChance;
    if (gBattleMons[gBankAttacker].ability == ABILITY_SERENE_GRACE)
        PercentChance = gBattleMoves[gCurrentMove].secondaryEffectChance * 2;
    else
        PercentChance = gBattleMoves[gCurrentMove].secondaryEffectChance;
    if (gBattleCommunication[0x3] & 0x80 && !(gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5)))))
    {
        gBattleCommunication[0x3] &= 0x7F;
        SetMoveEffect(0, 0x80);
    }
    else if (Random() % 100 <= PercentChance && gBattleCommunication[0x3] && !(gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5)))))
    {
        if (PercentChance >= 100)
            SetMoveEffect(0, 0x80);
        else
            SetMoveEffect(0, 0);
    }
    else
        gBattlescriptCurrInstr++;
    gBattleCommunication[0x3] = 0;
    ((struct BattleStruct *) (gSharedMem + 0x0))->unk16112 = 0;
}

static void atk16_seteffectprimary(void)
{
    SetMoveEffect(1, 0);
}

static void atk17_seteffectsecondary(void)
{
    SetMoveEffect(0, 0);
}

static void atk18_status_effect_clear(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    if (gBattleCommunication[0x3] <= 6)
        gBattleMons[gActiveBank].status1 &= (~gStatusFlagsForMoveEffects[gBattleCommunication[0x3]]);
    else
        gBattleMons[gActiveBank].status2 &= (~gStatusFlagsForMoveEffects[gBattleCommunication[0x3]]);

    gBattleCommunication[0x3] = 0;
    gBattlescriptCurrInstr += 2;
    ((struct BattleStruct *) (gSharedMem + 0x0))->unk16112 = 0;
}

static void atk19_faint_pokemon(void)
{
    u8 *r4;

    if (gBattlescriptCurrInstr[2] != 0)
    {
        gActiveBank = GetBattleBank(gBattlescriptCurrInstr[1]);
        if (gHitMarker & ((gBitTable[gActiveBank] << 0x1C)))
        {
            r4 = (u8*) ((gBattlescriptCurrInstr + 3)[0] | ((gBattlescriptCurrInstr + 3)[1] << 8) | ((gBattlescriptCurrInstr + 3)[2] << 16) | ((gBattlescriptCurrInstr + 3)[3] << 24));

            b_movescr_stack_pop_cursor();
            gBattlescriptCurrInstr = r4;
            gSideAffecting[GetBankSide(gActiveBank)] &= ~(1 << 9);
        }
        else
        {
            gBattlescriptCurrInstr += 7;
        }
    }
    else
    {
        u8 bank;

        if (gBattlescriptCurrInstr[1] == 1)
        {
            gActiveBank = gBankAttacker;
            bank = gBankTarget;
            r4 = gUnknown_081D8C58;
        }
        else
        {
            gActiveBank = gBankTarget;
            bank = gBankAttacker;
            r4 = gUnknown_081D8C65;
        }
        if (!(gAbsentBankFlags & gBitTable[gActiveBank])
         && gBattleMons[gActiveBank].hp == 0)
        {
            (gSharedMem[0x160AC + 0 + bank * 2]) = 0;
            (gSharedMem[0x160AC + 1 + bank * 2]) = 0;
            (gSharedMem[0x16100 + 0 + bank * 4]) = 0;
            (gSharedMem[0x16100 + 1 + bank * 4]) = 0;
            (gSharedMem[0x16100 + 2 + bank * 4]) = 0;
            (gSharedMem[0x16100 + 3 + bank * 4]) = 0;

            gHitMarker |= ((gBitTable[gActiveBank] << 0x1C));
            b_movescr_stack_push(gBattlescriptCurrInstr + 7);
            gBattlescriptCurrInstr = r4;
            if (GetBankSide(gActiveBank) == 0)
            {
                gHitMarker |= 0x00400000;
                if (gBattleResults.playerFaintCounter < 0xFF)
                    gBattleResults.playerFaintCounter++;
                if (gBattleMons[bank].level > gBattleMons[gActiveBank].level)
                {
                    if (gBattleMons[bank].level - gBattleMons[gActiveBank].level > 0x1D)
                        AdjustFriendship(&gPlayerParty[gBattlePartyID[gActiveBank]], 8);
                    else
                        AdjustFriendship(&gPlayerParty[gBattlePartyID[gActiveBank]], 6);
                }
            }
            else
            {
                if (gBattleResults.opponentFaintCounter < 0xFF)
                    gBattleResults.opponentFaintCounter++;
                gBattleResults.lastOpponentSpecies = gBattleMons[gActiveBank].species;
            }
            if ((gHitMarker & 0x00000040) && gBattleMons[gBankAttacker].hp != 0)
            {
                b_movescr_stack_push(gBattlescriptCurrInstr);
                gBattleMoveDamage = gBattleMons[bank].hp;
                gBattlescriptCurrInstr = gUnknown_081D9156;
            }
            if ((gStatuses3[gBankTarget] & 0x4000)
             && !(gHitMarker & 0x01000000)
             && GetBankSide(gBankAttacker) != GetBankSide(gBankTarget)
             && gBattleMons[gBankAttacker].hp != 0
             && gCurrentMove != MOVE_STRUGGLE)
            {
                u8 moveIndex = (gSharedMem[0x1608C + gBankAttacker]);

                gBattleMons[gBankAttacker].pp[moveIndex] = 0;
                b_movescr_stack_push(gBattlescriptCurrInstr);
                gBattlescriptCurrInstr = gUnknown_081D9468;
                gActiveBank = gBankAttacker;
                EmitSetAttributes(0, moveIndex + 9, 0, 1, &gBattleMons[gActiveBank].pp[moveIndex]);
                MarkBufferBankForExecution(gActiveBank);

                gBattleTextBuff1[0] = 0xFD;
                gBattleTextBuff1[1] = 2;
                gBattleTextBuff1[2] = gBattleMons[gBankAttacker].moves[moveIndex];
                gBattleTextBuff1[3] = gBattleMons[gBankAttacker].moves[moveIndex] >> 8;
                gBattleTextBuff1[4] = 0xFF;
            }
        }
        else
        {
            gBattlescriptCurrInstr += 7;
        }
    }
}

static void atk1A_faint_animation(void)
{
    if (gBattleExecBuffer == 0)
    {
        gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
        Emitcmd10(0);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 2;
    }
}

static void atk1B_faint_effects_clear(void)
{

    if (gBattleExecBuffer == 0)
    {
        gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
        gBattleMons[gActiveBank].status1 = 0;
        EmitSetAttributes(0, 0x28, 0, 0x4, &gBattleMons[gActiveBank].status1);
        MarkBufferBankForExecution(gActiveBank);
        UndoEffectsAfterFainting();
        gBattlescriptCurrInstr += 2;
    }
}

static void atk1C_jumpifstatus(void)
{
    u8 bank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    u32 flags = ((gBattlescriptCurrInstr + 2)[0] + ((gBattlescriptCurrInstr + 2)[1] << 8) + ((gBattlescriptCurrInstr + 2)[2] << 16) + ((gBattlescriptCurrInstr + 2)[3] << 24));
    void* jump_loc = (void*) ((gBattlescriptCurrInstr + 6)[0] + ((gBattlescriptCurrInstr + 6)[1] << 8) + ((gBattlescriptCurrInstr + 6)[2] << 16) + ((gBattlescriptCurrInstr + 6)[3] << 24));
    if (gBattleMons[bank].status1 & flags && gBattleMons[bank].hp)
        gBattlescriptCurrInstr = jump_loc;
    else
        gBattlescriptCurrInstr += 10;
}

static void atk1D_jumpifstatus2(void)
{
    u8 bank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    u32 flags = ((gBattlescriptCurrInstr + 2)[0] + ((gBattlescriptCurrInstr + 2)[1] << 8) + ((gBattlescriptCurrInstr + 2)[2] << 16) + ((gBattlescriptCurrInstr + 2)[3] << 24));
    void* jump_loc = (void*) ((gBattlescriptCurrInstr + 6)[0] + ((gBattlescriptCurrInstr + 6)[1] << 8) + ((gBattlescriptCurrInstr + 6)[2] << 16) + ((gBattlescriptCurrInstr + 6)[3] << 24));
    if (gBattleMons[bank].status2 & flags && gBattleMons[bank].hp)
        gBattlescriptCurrInstr = jump_loc;
    else
        gBattlescriptCurrInstr += 10;
}

static void atk1E_jumpifability(void)
{
    u8 bank;
    u8 ability = ((gBattlescriptCurrInstr + 2)[0]);
    void* jump_loc = (void*) ((gBattlescriptCurrInstr + 3)[0] + ((gBattlescriptCurrInstr + 3)[1] << 8) + ((gBattlescriptCurrInstr + 3)[2] << 16) + ((gBattlescriptCurrInstr + 3)[3] << 24));
    if (((gBattlescriptCurrInstr + 1)[0]) == 8)
    {
        bank = AbilityBattleEffects(0xD, gBankAttacker, ability, 0, 0);
        if (bank)
        {
            gLastUsedAbility = ability;
            gBattlescriptCurrInstr = jump_loc;
            RecordAbilityBattle(bank -1, gLastUsedAbility);
            (gSharedMem[0x160F8]) = bank - 1;
        }
        else
            gBattlescriptCurrInstr += 7;
    }
    else if (((gBattlescriptCurrInstr + 1)[0]) == 9)
    {
        bank = AbilityBattleEffects(0xC, gBankAttacker, ability, 0, 0);
        if (bank)
        {
            gLastUsedAbility = ability;
            gBattlescriptCurrInstr = jump_loc;
            RecordAbilityBattle(bank - 1, gLastUsedAbility);
            (gSharedMem[0x160F8]) = bank - 1;
        }
        else
            gBattlescriptCurrInstr += 7;
    }
    else
    {
        bank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
        if (gBattleMons[bank].ability == ability)
        {
            gLastUsedAbility = ability;
            gBattlescriptCurrInstr = jump_loc;
            RecordAbilityBattle(bank, gLastUsedAbility);
            (gSharedMem[0x160F8]) = bank;
        }
        else
            gBattlescriptCurrInstr += 7;
    }
}

static void atk1F_jumpifsideaffecting(void)
{
    u8 side;
    u16 flags;
    void* jump_loc;
    if (((gBattlescriptCurrInstr + 1)[0]) == 1)
        side = GetBankIdentity(gBankAttacker) & 1;
    else
        side = GetBankIdentity(gBankTarget) & 1;

    flags = ((gBattlescriptCurrInstr + 2)[0] + ((gBattlescriptCurrInstr + 2)[1] << 8));
    jump_loc = (void*) ((gBattlescriptCurrInstr + 4)[0] + ((gBattlescriptCurrInstr + 4)[1] << 8) + ((gBattlescriptCurrInstr + 4)[2] << 16) + ((gBattlescriptCurrInstr + 4)[3] << 24));

    if (gSideAffecting[side] & flags)
        gBattlescriptCurrInstr = jump_loc;
    else
        gBattlescriptCurrInstr += 8;
}

static void atk20_jumpifstat(void)
{
    u8 ret = 0;
    u8 bank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    u8 value = gBattleMons[bank].statStages[((gBattlescriptCurrInstr + 3)[0])];
    switch (((gBattlescriptCurrInstr + 2)[0]))
    {
    case 0x0:
        if (value == ((gBattlescriptCurrInstr + 4)[0]))
            ret++;
        break;
    case 0x1:
        if (value != ((gBattlescriptCurrInstr + 4)[0]))
            ret++;
        break;
    case 0x2:
        if (value > ((gBattlescriptCurrInstr + 4)[0]))
            ret++;
        break;
    case 0x3:
        if (value < ((gBattlescriptCurrInstr + 4)[0]))
            ret++;
        break;
    case 0x4:
        if (value & ((gBattlescriptCurrInstr + 4)[0]))
            ret++;
        break;
    case 0x5:
        if (!(value & ((gBattlescriptCurrInstr + 4)[0])))
            ret++;
        break;
    }
    if (ret)
        gBattlescriptCurrInstr = (void*) ((gBattlescriptCurrInstr + 5)[0] + ((gBattlescriptCurrInstr + 5)[1] << 8) + ((gBattlescriptCurrInstr + 5)[2] << 16) + ((gBattlescriptCurrInstr + 5)[3] << 24));
    else
        gBattlescriptCurrInstr += 9;
}

static void atk21_jumpifstatus3(void)
{
    u32 flags;
    void* jump_loc;

    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    flags = ((gBattlescriptCurrInstr + 2)[0] + ((gBattlescriptCurrInstr + 2)[1] << 8) + ((gBattlescriptCurrInstr + 2)[2] << 16) + ((gBattlescriptCurrInstr + 2)[3] << 24));
    jump_loc = (void*) ((gBattlescriptCurrInstr + 7)[0] + ((gBattlescriptCurrInstr + 7)[1] << 8) + ((gBattlescriptCurrInstr + 7)[2] << 16) + ((gBattlescriptCurrInstr + 7)[3] << 24));
    if (((gBattlescriptCurrInstr + 6)[0]))
    {
        if ((gStatuses3[gActiveBank] & flags) != 0)
            gBattlescriptCurrInstr += 11;
        else
            gBattlescriptCurrInstr = jump_loc;
    }
    else
    {
        if ((gStatuses3[gActiveBank] & flags) != 0)
            gBattlescriptCurrInstr = jump_loc;
        else
            gBattlescriptCurrInstr += 11;
    }
}

static void atk22_jumpiftype(void)
{
    u8 bank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    u8 type = ((gBattlescriptCurrInstr + 2)[0]);
    void* jump_loc = (void*) ((gBattlescriptCurrInstr + 3)[0] + ((gBattlescriptCurrInstr + 3)[1] << 8) + ((gBattlescriptCurrInstr + 3)[2] << 16) + ((gBattlescriptCurrInstr + 3)[3] << 24));

    if (gBattleMons[bank].type1 == type || gBattleMons[bank].type2 == type)
        gBattlescriptCurrInstr = jump_loc;
    else
        gBattlescriptCurrInstr += 7;
}
# 5543 "src/battle/battle_4.c"
__attribute__((naked))
static void atk23_getexp(void)
{
    asm(".syntax unified\n            push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    movs r6, 0\n    ldr r0, _0802004C @ =gSharedMem + 0x1605C\n    mov r10, r0\n    ldr r0, _08020050 @ =gBattlescriptCurrInstr\n    ldr r0, [r0]\n    ldrb r0, [r0, 0x1]\n    bl GetBattleBank\n    ldr r1, _08020054 @ =gBank1\n    strb r0, [r1]\n    ldr r2, _08020058 @ =gSentPokesToOpponent\n    movs r1, 0x2\n    ands r1, r0\n    lsls r1, 24\n    lsrs r1, 25\n    adds r1, r2\n    ldrb r1, [r1]\n    mov r8, r1\n    mov r0, r10\n    subs r0, 0x4D\n    ldrb r0, [r0]\n    cmp r0, 0x6\n    bls _08020040\n    bl _08020996\n_08020040:\n    lsls r0, 2\n    ldr r1, _0802005C @ =_08020060\n    adds r0, r1\n    ldr r0, [r0]\n    mov pc, r0\n    .align 2, 0\n_0802004C: .4byte gSharedMem + 0x1605C\n_08020050: .4byte gBattlescriptCurrInstr\n_08020054: .4byte gBank1\n_08020058: .4byte gSentPokesToOpponent\n_0802005C: .4byte _08020060\n    .align 2, 0\n_08020060:\n    .4byte _0802007C\n    .4byte _080200FC\n    .4byte _08020216\n    .4byte _0802055C\n    .4byte _08020648\n    .4byte _08020910\n    .4byte _0802096C\n_0802007C:\n    ldr r4, _080200A8 @ =gBank1\n    ldrb r0, [r4]\n    bl GetBankSide\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x1\n    bne _08020098\n    ldr r0, _080200AC @ =gBattleTypeFlags\n    ldrh r1, [r0]\n    ldr r0, _080200B0 @ =0x00000982\n    ands r0, r1\n    cmp r0, 0\n    beq _080200BC\n_08020098:\n    ldr r0, _080200B4 @ =gSharedMem\n    ldr r1, _080200B8 @ =0x0001600f\n    adds r0, r1\n    movs r1, 0x6\n    strb r1, [r0]\n    bl _08020996\n    .align 2, 0\n_080200A8: .4byte gBank1\n_080200AC: .4byte gBattleTypeFlags\n_080200B0: .4byte 0x00000982\n_080200B4: .4byte gSharedMem\n_080200B8: .4byte 0x0001600f\n_080200BC:\n    ldr r2, _080200E8 @ =gSharedMem\n    ldr r3, _080200EC @ =0x0001600f\n    adds r1, r2, r3\n    ldrb r0, [r1]\n    adds r0, 0x1\n    strb r0, [r1]\n    ldr r0, _080200F0 @ =0x00016113\n    adds r2, r0\n    ldr r3, _080200F4 @ =gBitTable\n    ldr r1, _080200F8 @ =gBattlePartyID\n    ldrb r0, [r4]\n    lsls r0, 1\n    adds r0, r1\n    ldrh r0, [r0]\n    lsls r0, 2\n    adds r0, r3\n    ldr r0, [r0]\n    ldrb r1, [r2]\n    orrs r0, r1\n    strb r0, [r2]\n    bl _08020996\n    .align 2, 0\n_080200E8: .4byte gSharedMem\n_080200EC: .4byte 0x0001600f\n_080200F0: .4byte 0x00016113\n_080200F4: .4byte gBitTable\n_080200F8: .4byte gBattlePartyID\n_080200FC:\n    movs r5, 0\n    movs r7, 0\n    ldr r1, _08020150 @ =gSaveBlock1 + 0x3688\n    mov r9, r1\n_08020104:\n    movs r0, 0x64\n    adds r1, r7, 0\n    muls r1, r0\n    ldr r0, _08020154 @ =gPlayerParty\n    adds r4, r1, r0\n    adds r0, r4, 0\n    movs r1, 0xB\n    bl GetMonData\n    cmp r0, 0\n    beq _0802016A\n    adds r0, r4, 0\n    movs r1, 0x39\n    bl GetMonData\n    cmp r0, 0\n    beq _0802016A\n    ldr r0, _08020158 @ =gBitTable\n    lsls r1, r7, 2\n    adds r1, r0\n    ldr r0, [r1]\n    mov r2, r8\n    ands r0, r2\n    cmp r0, 0\n    beq _08020138\n    adds r5, 0x1\n_08020138:\n    adds r0, r4, 0\n    movs r1, 0xC\n    bl GetMonData\n    lsls r0, 16\n    lsrs r0, 16\n    cmp r0, 0xAF\n    bne _0802015C\n    mov r3, r9\n    ldrb r4, [r3]\n    b _08020164\n    .align 2, 0\n_08020150: .4byte gSaveBlock1 + 0x3688\n_08020154: .4byte gPlayerParty\n_08020158: .4byte gBitTable\n_0802015C:\n    bl ItemId_GetHoldEffect\n    lsls r0, 24\n    lsrs r4, r0, 24\n_08020164:\n    cmp r4, 0x19\n    bne _0802016A\n    adds r6, 0x1\n_0802016A:\n    adds r7, 0x1\n    cmp r7, 0x5\n    ble _08020104\n    ldr r3, _080201D0 @ =gBaseStats\n    ldr r2, _080201D4 @ =gBattleMons\n    ldr r0, _080201D8 @ =gBank1\n    ldrb r1, [r0]\n    movs r0, 0x58\n    muls r1, r0\n    adds r1, r2\n    ldrh r2, [r1]\n    lsls r0, r2, 3\n    subs r0, r2\n    lsls r0, 2\n    adds r0, r3\n    ldrb r2, [r0, 0x9]\n    adds r1, 0x2A\n    ldrb r0, [r1]\n    muls r0, r2\n    movs r1, 0x7\n    bl __divsi3\n    lsls r0, 16\n    lsrs r1, r0, 16\n    cmp r6, 0\n    beq _080201E0\n    lsrs r4, r0, 17\n    adds r0, r4, 0\n    adds r1, r5, 0\n    bl __divsi3\n    mov r1, r10\n    strh r0, [r1]\n    lsls r0, 16\n    cmp r0, 0\n    bne _080201B6\n    movs r0, 0x1\n    strh r0, [r1]\n_080201B6:\n    ldr r5, _080201DC @ =gExpShareExp\n    adds r0, r4, 0\n    adds r1, r6, 0\n    bl __divsi3\n    strh r0, [r5]\n    lsls r0, 16\n    cmp r0, 0\n    bne _080201FA\n    movs r0, 0x1\n    strh r0, [r5]\n    b _080201FA\n    .align 2, 0\n_080201D0: .4byte gBaseStats\n_080201D4: .4byte gBattleMons\n_080201D8: .4byte gBank1\n_080201DC: .4byte gExpShareExp\n_080201E0:\n    adds r0, r1, 0\n    adds r1, r5, 0\n    bl __divsi3\n    mov r2, r10\n    strh r0, [r2]\n    lsls r0, 16\n    cmp r0, 0\n    bne _080201F6\n    movs r0, 0x1\n    strh r0, [r2]\n_080201F6:\n    ldr r0, _08020248 @ =gExpShareExp\n    strh r6, [r0]\n_080201FA:\n    ldr r1, _0802024C @ =gSharedMem\n    ldr r3, _08020250 @ =0x0001600f\n    adds r2, r1, r3\n    ldrb r0, [r2]\n    adds r0, 0x1\n    movs r3, 0\n    strb r0, [r2]\n    ldr r2, _08020254 @ =0x00016018\n    adds r0, r1, r2\n    strb r3, [r0]\n    ldr r3, _08020258 @ =0x0001605f\n    adds r1, r3\n    mov r0, r8\n    strb r0, [r1]\n_08020216:\n    ldr r0, _0802025C @ =gBattleExecBuffer\n    ldr r0, [r0]\n    cmp r0, 0\n    beq _08020220\n    b _08020996\n_08020220:\n    ldr r0, _0802024C @ =gSharedMem\n    ldr r1, _08020254 @ =0x00016018\n    adds r0, r1\n    ldrb r1, [r0]\n    movs r0, 0x64\n    muls r0, r1\n    ldr r1, _08020260 @ =gPlayerParty\n    adds r0, r1\n    movs r1, 0xC\n    bl GetMonData\n    lsls r0, 16\n    lsrs r0, 16\n    cmp r0, 0xAF\n    bne _0802026C\n    ldr r0, _08020264 @ =gSaveBlock1\n    ldr r2, _08020268 @ =0x00003688\n    adds r0, r2\n    ldrb r4, [r0]\n    b _08020274\n    .align 2, 0\n_08020248: .4byte gExpShareExp\n_0802024C: .4byte gSharedMem\n_08020250: .4byte 0x0001600f\n_08020254: .4byte 0x00016018\n_08020258: .4byte 0x0001605f\n_0802025C: .4byte gBattleExecBuffer\n_08020260: .4byte gPlayerParty\n_08020264: .4byte gSaveBlock1\n_08020268: .4byte 0x00003688\n_0802026C:\n    bl ItemId_GetHoldEffect\n    lsls r0, 24\n    lsrs r4, r0, 24\n_08020274:\n    ldr r5, _08020294 @ =gSharedMem\n    cmp r4, 0x19\n    beq _080202A0\n    ldr r3, _08020298 @ =0x0001605f\n    adds r1, r5, r3\n    ldrb r0, [r1]\n    movs r2, 0x1\n    ands r2, r0\n    cmp r2, 0\n    bne _080202A0\n    lsrs r0, 1\n    strb r0, [r1]\n    ldr r0, _0802029C @ =0x0001600f\n    adds r1, r5, r0\n    b _080202C8\n    .align 2, 0\n_08020294: .4byte gSharedMem\n_08020298: .4byte 0x0001605f\n_0802029C: .4byte 0x0001600f\n_080202A0:\n    ldr r1, _080202D4 @ =0x00016018\n    adds r0, r5, r1\n    ldrb r1, [r0]\n    movs r0, 0x64\n    muls r0, r1\n    ldr r1, _080202D8 @ =gPlayerParty\n    adds r0, r1\n    movs r1, 0x38\n    bl GetMonData\n    cmp r0, 0x64\n    bne _080202E8\n    ldr r2, _080202DC @ =0x0001605f\n    adds r1, r5, r2\n    ldrb r0, [r1]\n    lsrs r0, 1\n    movs r2, 0\n    strb r0, [r1]\n    ldr r3, _080202E0 @ =0x0001600f\n    adds r1, r5, r3\n_080202C8:\n    movs r0, 0x5\n    strb r0, [r1]\n    ldr r0, _080202E4 @ =gBattleMoveDamage\n    str r2, [r0]\n    b _08020996\n    .align 2, 0\n_080202D4: .4byte 0x00016018\n_080202D8: .4byte gPlayerParty\n_080202DC: .4byte 0x0001605f\n_080202E0: .4byte 0x0001600f\n_080202E4: .4byte gBattleMoveDamage\n_080202E8:\n    ldr r0, _0802034C @ =gBattleTypeFlags\n    ldrh r1, [r0]\n    movs r0, 0x8\n    ands r0, r1\n    cmp r0, 0\n    bne _08020316\n    ldr r0, _08020350 @ =gBattleMons\n    ldrh r0, [r0, 0x28]\n    cmp r0, 0\n    beq _08020316\n    ldr r0, _08020354 @ =0x0001601b\n    adds r5, r0\n    ldrb r0, [r5]\n    cmp r0, 0\n    bne _08020316\n    bl BattleMusicStop\n    ldr r0, _08020358 @ =0x00000161\n    bl PlayBGM\n    ldrb r0, [r5]\n    adds r0, 0x1\n    strb r0, [r5]\n_08020316:\n    ldr r5, _0802035C @ =gSharedMem\n    ldr r1, _08020360 @ =0x00016018\n    adds r0, r5, r1\n    ldrb r1, [r0]\n    movs r0, 0x64\n    muls r0, r1\n    ldr r1, _08020364 @ =gPlayerParty\n    adds r0, r1\n    movs r1, 0x39\n    bl GetMonData\n    cmp r0, 0\n    bne _08020332\n    b _0802051E\n_08020332:\n    ldr r2, _08020368 @ =0x0001605f\n    adds r0, r5, r2\n    ldrb r0, [r0]\n    movs r3, 0x1\n    ands r3, r0\n    cmp r3, 0\n    beq _08020370\n    ldr r1, _0802036C @ =gBattleMoveDamage\n    mov r3, r10\n    ldrh r0, [r3]\n    str r0, [r1]\n    mov r8, r1\n    b _08020376\n    .align 2, 0\n_0802034C: .4byte gBattleTypeFlags\n_08020350: .4byte gBattleMons\n_08020354: .4byte 0x0001601b\n_08020358: .4byte 0x00000161\n_0802035C: .4byte gSharedMem\n_08020360: .4byte 0x00016018\n_08020364: .4byte gPlayerParty\n_08020368: .4byte 0x0001605f\n_0802036C: .4byte gBattleMoveDamage\n_08020370:\n    ldr r0, _080203EC @ =gBattleMoveDamage\n    str r3, [r0]\n    mov r8, r0\n_08020376:\n    cmp r4, 0x19\n    bne _08020386\n    ldr r0, _080203F0 @ =gExpShareExp\n    ldrh r1, [r0]\n    mov r2, r8\n    ldr r0, [r2]\n    adds r0, r1\n    str r0, [r2]\n_08020386:\n    cmp r4, 0x28\n    bne _0802039C\n    mov r3, r8\n    ldr r1, [r3]\n    movs r0, 0x96\n    muls r0, r1\n    movs r1, 0x64\n    bl __divsi3\n    mov r1, r8\n    str r0, [r1]\n_0802039C:\n    ldr r0, _080203F4 @ =gBattleTypeFlags\n    ldrh r1, [r0]\n    movs r0, 0x8\n    ands r0, r1\n    cmp r0, 0\n    beq _080203B8\n    ldr r4, _080203EC @ =gBattleMoveDamage\n    ldr r1, [r4]\n    movs r0, 0x96\n    muls r0, r1\n    movs r1, 0x64\n    bl __divsi3\n    str r0, [r4]\n_080203B8:\n    ldr r0, _080203F8 @ =gSharedMem\n    ldr r2, _080203FC @ =0x00016018\n    adds r0, r2\n    ldrb r1, [r0]\n    movs r0, 0x64\n    muls r0, r1\n    ldr r1, _08020400 @ =gPlayerParty\n    adds r0, r1\n    bl IsTradedMon\n    lsls r0, 24\n    cmp r0, 0\n    beq _08020404\n    ldr r4, _080203EC @ =gBattleMoveDamage\n    ldr r1, [r4]\n    movs r0, 0x96\n    muls r0, r1\n    movs r1, 0x64\n    bl __divsi3\n    str r0, [r4]\n    movs r7, 0xA5\n    lsls r7, 1\n    mov r8, r4\n    b _0802040A\n    .align 2, 0\n_080203EC: .4byte gBattleMoveDamage\n_080203F0: .4byte gExpShareExp\n_080203F4: .4byte gBattleTypeFlags\n_080203F8: .4byte gSharedMem\n_080203FC: .4byte 0x00016018\n_08020400: .4byte gPlayerParty\n_08020404:\n    ldr r7, _0802043C @ =0x00000149\n    ldr r3, _08020440 @ =gBattleMoveDamage\n    mov r8, r3\n_0802040A:\n    ldr r0, _08020444 @ =gBattleTypeFlags\n    ldrh r0, [r0]\n    movs r1, 0x1\n    ands r1, r0\n    cmp r1, 0\n    beq _08020488\n    ldr r1, _08020448 @ =gBattlePartyID\n    ldr r0, _0802044C @ =gSharedMem\n    ldr r3, _08020450 @ =0x00016018\n    adds r2, r0, r3\n    ldrh r1, [r1, 0x4]\n    adds r5, r0, 0\n    ldr r4, _08020454 @ =gBitTable\n    ldr r3, _08020458 @ =gAbsentBankFlags\n    ldrb r2, [r2]\n    cmp r1, r2\n    bne _08020460\n    ldrb r1, [r3]\n    ldr r0, [r4, 0x8]\n    ands r1, r0\n    cmp r1, 0\n    bne _08020460\n    ldr r0, _0802045C @ =0x000160a2\n    adds r1, r5, r0\n    b _0802047C\n    .align 2, 0\n_0802043C: .4byte 0x00000149\n_08020440: .4byte gBattleMoveDamage\n_08020444: .4byte gBattleTypeFlags\n_08020448: .4byte gBattlePartyID\n_0802044C: .4byte gSharedMem\n_08020450: .4byte 0x00016018\n_08020454: .4byte gBitTable\n_08020458: .4byte gAbsentBankFlags\n_0802045C: .4byte 0x000160a2\n_08020460:\n    ldrb r2, [r3]\n    ldr r0, [r4]\n    ands r2, r0\n    cmp r2, 0\n    bne _08020478\n    ldr r1, _08020474 @ =0x000160a2\n    adds r0, r5, r1\n    strb r2, [r0]\n    b _08020490\n    .align 2, 0\n_08020474: .4byte 0x000160a2\n_08020478:\n    ldr r2, _08020484 @ =0x000160a2\n    adds r1, r5, r2\n_0802047C:\n    movs r0, 0x2\n    strb r0, [r1]\n    b _08020490\n    .align 2, 0\n_08020484: .4byte 0x000160a2\n_08020488:\n    ldr r0, _08020530 @ =gSharedMem\n    ldr r3, _08020534 @ =0x000160a2\n    adds r0, r3\n    strb r1, [r0]\n_08020490:\n    ldr r1, _08020538 @ =gBattleTextBuff1\n    movs r3, 0\n    movs r2, 0xFD\n    strb r2, [r1]\n    movs r5, 0x4\n    strb r5, [r1, 0x1]\n    ldr r4, _08020530 @ =gSharedMem\n    ldr r0, _08020534 @ =0x000160a2\n    adds r6, r4, r0\n    ldrb r0, [r6]\n    strb r0, [r1, 0x2]\n    ldr r0, _0802053C @ =0x00016018\n    adds r4, r0\n    ldrb r0, [r4]\n    strb r0, [r1, 0x3]\n    movs r0, 0xFF\n    strb r0, [r1, 0x4]\n    ldr r1, _08020540 @ =gBattleTextBuff2\n    strb r2, [r1]\n    strb r3, [r1, 0x1]\n    strb r7, [r1, 0x2]\n    movs r3, 0xFF\n    lsls r3, 8\n    ands r7, r3\n    asrs r0, r7, 8\n    strb r0, [r1, 0x3]\n    movs r0, 0x1\n    negs r0, r0\n    strb r0, [r1, 0x4]\n    ldr r1, _08020544 @ =gBattleTextBuff3\n    strb r2, [r1]\n    movs r0, 0x1\n    strb r0, [r1, 0x1]\n    strb r5, [r1, 0x2]\n    movs r0, 0x5\n    strb r0, [r1, 0x3]\n    mov r0, r8\n    ldr r2, [r0]\n    strb r2, [r1, 0x4]\n    adds r0, r2, 0\n    ands r0, r3\n    asrs r0, 8\n    strb r0, [r1, 0x5]\n    movs r0, 0xFF\n    lsls r0, 16\n    ands r0, r2\n    asrs r0, 16\n    strb r0, [r1, 0x6]\n    lsrs r2, 24\n    strb r2, [r1, 0x7]\n    movs r0, 0x1\n    negs r0, r0\n    strb r0, [r1, 0x8]\n    ldrb r1, [r6]\n    movs r0, 0xD\n    bl PrepareStringBattle\n    ldrb r1, [r4]\n    movs r0, 0x64\n    muls r0, r1\n    ldr r1, _08020548 @ =gPlayerParty\n    adds r0, r1\n    ldr r3, _0802054C @ =gBattleMons\n    ldr r1, _08020550 @ =gBank1\n    ldrb r2, [r1]\n    movs r1, 0x58\n    muls r1, r2\n    adds r1, r3\n    ldrh r1, [r1]\n    bl MonGainEVs\n_0802051E:\n    ldr r1, _08020530 @ =gSharedMem\n    ldr r3, _08020554 @ =0x0001605f\n    adds r2, r1, r3\n    ldrb r0, [r2]\n    lsrs r0, 1\n    strb r0, [r2]\n    ldr r0, _08020558 @ =0x0001600f\n    adds r1, r0\n    b _08020618\n    .align 2, 0\n_08020530: .4byte gSharedMem\n_08020534: .4byte 0x000160a2\n_08020538: .4byte gBattleTextBuff1\n_0802053C: .4byte 0x00016018\n_08020540: .4byte gBattleTextBuff2\n_08020544: .4byte gBattleTextBuff3\n_08020548: .4byte gPlayerParty\n_0802054C: .4byte gBattleMons\n_08020550: .4byte gBank1\n_08020554: .4byte 0x0001605f\n_08020558: .4byte 0x0001600f\n_0802055C:\n    ldr r0, _08020620 @ =gBattleExecBuffer\n    ldr r2, [r0]\n    cmp r2, 0\n    beq _08020566\n    b _08020996\n_08020566:\n    ldr r1, _08020624 @ =gBattleBufferB\n    ldr r4, _08020628 @ =gSharedMem\n    ldr r3, _0802062C @ =0x000160a2\n    adds r3, r4\n    mov r8, r3\n    ldrb r0, [r3]\n    lsls r0, 9\n    adds r0, r1\n    strb r2, [r0]\n    ldr r0, _08020630 @ =0x00016018\n    adds r7, r4, r0\n    ldrb r0, [r7]\n    movs r6, 0x64\n    muls r0, r6\n    ldr r5, _08020634 @ =gPlayerParty\n    adds r0, r5\n    movs r1, 0x39\n    bl GetMonData\n    cmp r0, 0\n    beq _08020612\n    ldrb r0, [r7]\n    muls r0, r6\n    adds r0, r5\n    movs r1, 0x38\n    bl GetMonData\n    cmp r0, 0x64\n    beq _08020612\n    ldrb r0, [r7]\n    muls r0, r6\n    adds r0, r5\n    movs r1, 0x3A\n    bl GetMonData\n    ldr r1, _08020638 @ =0x00017180\n    adds r4, r1\n    strh r0, [r4]\n    ldrb r0, [r7]\n    muls r0, r6\n    adds r0, r5\n    movs r1, 0x3B\n    bl GetMonData\n    strh r0, [r4, 0x2]\n    ldrb r0, [r7]\n    muls r0, r6\n    adds r0, r5\n    movs r1, 0x3C\n    bl GetMonData\n    strh r0, [r4, 0x4]\n    ldrb r0, [r7]\n    muls r0, r6\n    adds r0, r5\n    movs r1, 0x3D\n    bl GetMonData\n    strh r0, [r4, 0x6]\n    ldrb r0, [r7]\n    muls r0, r6\n    adds r0, r5\n    movs r1, 0x3E\n    bl GetMonData\n    strh r0, [r4, 0x8]\n    ldrb r0, [r7]\n    muls r0, r6\n    adds r0, r5\n    movs r1, 0x3F\n    bl GetMonData\n    strh r0, [r4, 0xA]\n    ldr r4, _0802063C @ =gActiveBank\n    mov r2, r8\n    ldrb r0, [r2]\n    strb r0, [r4]\n    ldrb r1, [r7]\n    ldr r0, _08020640 @ =gBattleMoveDamage\n    ldrh r2, [r0]\n    movs r0, 0\n    bl EmitExpBarUpdate\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n_08020612:\n    ldr r1, _08020628 @ =gSharedMem\n    ldr r3, _08020644 @ =0x0001600f\n    adds r1, r3\n_08020618:\n    ldrb r0, [r1]\n    adds r0, 0x1\n    strb r0, [r1]\n    b _08020996\n    .align 2, 0\n_08020620: .4byte gBattleExecBuffer\n_08020624: .4byte gBattleBufferB\n_08020628: .4byte gSharedMem\n_0802062C: .4byte 0x000160a2\n_08020630: .4byte 0x00016018\n_08020634: .4byte gPlayerParty\n_08020638: .4byte 0x00017180\n_0802063C: .4byte gActiveBank\n_08020640: .4byte gBattleMoveDamage\n_08020644: .4byte 0x0001600f\n_08020648:\n    ldr r0, _080208AC @ =gBattleExecBuffer\n    ldr r0, [r0]\n    cmp r0, 0\n    beq _08020652\n    b _08020996\n_08020652:\n    ldr r1, _080208B0 @ =gActiveBank\n    ldr r4, _080208B4 @ =gSharedMem\n    ldr r2, _080208B8 @ =0x000160a2\n    adds r0, r4, r2\n    ldrb r0, [r0]\n    strb r0, [r1]\n    ldr r2, _080208BC @ =gBattleBufferB\n    ldrb r3, [r1]\n    lsls r1, r3, 9\n    adds r0, r1, r2\n    ldrb r0, [r0]\n    cmp r0, 0x21\n    beq _0802066E\n    b _080208F0\n_0802066E:\n    adds r0, r2, 0x1\n    adds r0, r1, r0\n    ldrb r0, [r0]\n    cmp r0, 0xB\n    beq _0802067A\n    b _080208F0\n_0802067A:\n    ldr r0, _080208C0 @ =gBattleTypeFlags\n    ldrh r1, [r0]\n    movs r0, 0x8\n    ands r0, r1\n    cmp r0, 0\n    beq _080206A8\n    ldr r1, _080208C4 @ =gBattlePartyID\n    lsls r0, r3, 1\n    adds r2, r0, r1\n    ldr r0, _080208C8 @ =0x00016018\n    adds r1, r4, r0\n    ldrh r0, [r2]\n    ldrb r1, [r1]\n    cmp r0, r1\n    bne _080206A8\n    adds r1, r0, 0\n    movs r0, 0x64\n    muls r0, r1\n    ldr r1, _080208CC @ =gPlayerParty\n    adds r0, r1\n    adds r1, r3, 0\n    bl sub_80324F8\n_080206A8:\n    ldr r1, _080208D0 @ =gBattleTextBuff1\n    movs r2, 0xFD\n    strb r2, [r1]\n    movs r0, 0x4\n    strb r0, [r1, 0x1]\n    ldr r5, _080208B0 @ =gActiveBank\n    ldrb r0, [r5]\n    strb r0, [r1, 0x2]\n    ldr r0, _080208B4 @ =gSharedMem\n    ldr r3, _080208C8 @ =0x00016018\n    adds r6, r0, r3\n    ldrb r0, [r6]\n    strb r0, [r1, 0x3]\n    movs r0, 0xFF\n    strb r0, [r1, 0x4]\n    ldr r4, _080208D4 @ =gBattleTextBuff2\n    strb r2, [r4]\n    movs r0, 0x1\n    strb r0, [r4, 0x1]\n    strb r0, [r4, 0x2]\n    movs r0, 0x3\n    strb r0, [r4, 0x3]\n    ldrb r0, [r6]\n    movs r1, 0x64\n    mov r8, r1\n    mov r2, r8\n    muls r2, r0\n    adds r0, r2, 0\n    ldr r7, _080208CC @ =gPlayerParty\n    adds r0, r7\n    movs r1, 0x38\n    bl GetMonData\n    strb r0, [r4, 0x4]\n    movs r0, 0x1\n    negs r0, r0\n    strb r0, [r4, 0x5]\n    bl b_movescr_stack_push_cursor\n    ldr r2, _080208D8 @ =gLeveledUpInBattle\n    ldr r1, _080208DC @ =gBitTable\n    ldrb r0, [r6]\n    lsls r0, 2\n    adds r0, r1\n    ldr r0, [r0]\n    ldrb r1, [r2]\n    orrs r0, r1\n    strb r0, [r2]\n    ldr r1, _080208E0 @ =gBattlescriptCurrInstr\n    ldr r0, _080208E4 @ =BattleScript_LevelUp\n    str r0, [r1]\n    ldr r4, _080208E8 @ =gBattleMoveDamage\n    ldr r2, _080208BC @ =gBattleBufferB\n    ldrb r1, [r5]\n    lsls r1, 9\n    adds r0, r2, 0x2\n    adds r0, r1, r0\n    ldrb r3, [r0]\n    adds r2, 0x3\n    adds r1, r2\n    ldrb r0, [r1]\n    lsls r0, 8\n    orrs r3, r0\n    str r3, [r4]\n    ldrb r0, [r6]\n    mov r3, r8\n    muls r3, r0\n    adds r0, r3, 0\n    adds r0, r7\n    movs r1, 0\n    bl AdjustFriendship\n    ldr r0, _080208C4 @ =gBattlePartyID\n    ldrb r1, [r6]\n    ldrh r0, [r0]\n    cmp r0, r1\n    bne _080207EC\n    ldr r4, _080208EC @ =gBattleMons\n    ldrh r0, [r4, 0x28]\n    cmp r0, 0\n    beq _080207EC\n    mov r0, r8\n    muls r0, r1\n    adds r0, r7\n    movs r1, 0x38\n    bl GetMonData\n    adds r1, r4, 0\n    adds r1, 0x2A\n    strb r0, [r1]\n    ldrb r0, [r6]\n    mov r1, r8\n    muls r1, r0\n    adds r0, r1, 0\n    adds r0, r7\n    movs r1, 0x39\n    bl GetMonData\n    strh r0, [r4, 0x28]\n    ldrb r0, [r6]\n    mov r2, r8\n    muls r2, r0\n    adds r0, r2, 0\n    adds r0, r7\n    movs r1, 0x3A\n    bl GetMonData\n    strh r0, [r4, 0x2C]\n    ldrb r0, [r6]\n    mov r3, r8\n    muls r3, r0\n    adds r0, r3, 0\n    adds r0, r7\n    movs r1, 0x3B\n    bl GetMonData\n    strh r0, [r4, 0x2]\n    ldrb r0, [r6]\n    mov r1, r8\n    muls r1, r0\n    adds r0, r1, 0\n    adds r0, r7\n    movs r1, 0x3C\n    bl GetMonData\n    strh r0, [r4, 0x4]\n    ldrb r0, [r6]\n    mov r2, r8\n    muls r2, r0\n    adds r0, r2, 0\n    adds r0, r7\n    movs r1, 0x3D\n    bl GetMonData\n    strh r0, [r4, 0x6]\n    ldrb r0, [r6]\n    mov r3, r8\n    muls r3, r0\n    adds r0, r3, 0\n    adds r0, r7\n    movs r1, 0x3D\n    bl GetMonData\n    strh r0, [r4, 0x6]\n    ldrb r0, [r6]\n    mov r1, r8\n    muls r1, r0\n    adds r0, r1, 0\n    adds r0, r7\n    movs r1, 0x3E\n    bl GetMonData\n    strh r0, [r4, 0x8]\n    ldrb r0, [r6]\n    mov r2, r8\n    muls r2, r0\n    adds r0, r2, 0\n    adds r0, r7\n    movs r1, 0x3F\n    bl GetMonData\n    strh r0, [r4, 0xA]\n_080207EC:\n    ldr r0, _080208C4 @ =gBattlePartyID\n    ldr r1, _080208B4 @ =gSharedMem\n    ldr r3, _080208C8 @ =0x00016018\n    adds r7, r1, r3\n    ldrb r2, [r7]\n    ldrh r0, [r0, 0x4]\n    cmp r0, r2\n    bne _080208F6\n    ldr r6, _080208EC @ =gBattleMons\n    movs r0, 0xD8\n    adds r0, r6\n    mov r8, r0\n    ldrh r0, [r0]\n    cmp r0, 0\n    beq _080208F6\n    ldr r0, _080208C0 @ =gBattleTypeFlags\n    ldrh r1, [r0]\n    movs r0, 0x1\n    ands r0, r1\n    cmp r0, 0\n    beq _080208F6\n    movs r5, 0x64\n    adds r0, r2, 0\n    muls r0, r5\n    ldr r4, _080208CC @ =gPlayerParty\n    adds r0, r4\n    movs r1, 0x38\n    bl GetMonData\n    adds r1, r6, 0\n    adds r1, 0xDA\n    strb r0, [r1]\n    ldrb r0, [r7]\n    muls r0, r5\n    adds r0, r4\n    movs r1, 0x39\n    bl GetMonData\n    mov r1, r8\n    strh r0, [r1]\n    ldrb r0, [r7]\n    muls r0, r5\n    adds r0, r4\n    movs r1, 0x3A\n    bl GetMonData\n    adds r1, r6, 0\n    adds r1, 0xDC\n    strh r0, [r1]\n    ldrb r0, [r7]\n    muls r0, r5\n    adds r0, r4\n    movs r1, 0x3B\n    bl GetMonData\n    adds r1, r6, 0\n    adds r1, 0xB2\n    strh r0, [r1]\n    ldrb r0, [r7]\n    muls r0, r5\n    adds r0, r4\n    movs r1, 0x3C\n    bl GetMonData\n    adds r1, r6, 0\n    adds r1, 0xB4\n    strh r0, [r1]\n    ldrb r0, [r7]\n    muls r0, r5\n    adds r0, r4\n    movs r1, 0x3D\n    bl GetMonData\n    movs r2, 0xB6\n    adds r2, r6\n    mov r8, r2\n    strh r0, [r2]\n    ldrb r0, [r7]\n    muls r0, r5\n    adds r0, r4\n    movs r1, 0x3D\n    bl GetMonData\n    mov r3, r8\n    strh r0, [r3]\n    ldrb r0, [r7]\n    muls r0, r5\n    adds r0, r4\n    movs r1, 0x3E\n    bl GetMonData\n    adds r1, r6, 0\n    adds r1, 0xB8\n    strh r0, [r1]\n    b _080208F6\n    .align 2, 0\n_080208AC: .4byte gBattleExecBuffer\n_080208B0: .4byte gActiveBank\n_080208B4: .4byte gSharedMem\n_080208B8: .4byte 0x000160a2\n_080208BC: .4byte gBattleBufferB\n_080208C0: .4byte gBattleTypeFlags\n_080208C4: .4byte gBattlePartyID\n_080208C8: .4byte 0x00016018\n_080208CC: .4byte gPlayerParty\n_080208D0: .4byte gBattleTextBuff1\n_080208D4: .4byte gBattleTextBuff2\n_080208D8: .4byte gLeveledUpInBattle\n_080208DC: .4byte gBitTable\n_080208E0: .4byte gBattlescriptCurrInstr\n_080208E4: .4byte BattleScript_LevelUp\n_080208E8: .4byte gBattleMoveDamage\n_080208EC: .4byte gBattleMons\n_080208F0:\n    ldr r1, _08020904 @ =gBattleMoveDamage\n    movs r0, 0\n    str r0, [r1]\n_080208F6:\n    ldr r0, _08020908 @ =gSharedMem\n    ldr r1, _0802090C @ =0x0001600f\n    adds r0, r1\n    movs r1, 0x5\n    strb r1, [r0]\n    b _08020996\n    .align 2, 0\n_08020904: .4byte gBattleMoveDamage\n_08020908: .4byte gSharedMem\n_0802090C: .4byte 0x0001600f\n_08020910:\n    ldr r0, _08020924 @ =gBattleMoveDamage\n    ldr r0, [r0]\n    cmp r0, 0\n    beq _08020930\n    ldr r0, _08020928 @ =gSharedMem\n    ldr r2, _0802092C @ =0x0001600f\n    adds r0, r2\n    movs r1, 0x3\n    strb r1, [r0]\n    b _08020996\n    .align 2, 0\n_08020924: .4byte gBattleMoveDamage\n_08020928: .4byte gSharedMem\n_0802092C: .4byte 0x0001600f\n_08020930:\n    ldr r2, _08020950 @ =gSharedMem\n    ldr r3, _08020954 @ =0x00016018\n    adds r1, r2, r3\n    ldrb r0, [r1]\n    adds r0, 0x1\n    strb r0, [r1]\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x5\n    bhi _0802095C\n    ldr r0, _08020958 @ =0x0001600f\n    adds r1, r2, r0\n    movs r0, 0x2\n    strb r0, [r1]\n    b _08020996\n    .align 2, 0\n_08020950: .4byte gSharedMem\n_08020954: .4byte 0x00016018\n_08020958: .4byte 0x0001600f\n_0802095C:\n    ldr r3, _08020968 @ =0x0001600f\n    adds r1, r2, r3\n    movs r0, 0x6\n    strb r0, [r1]\n    b _08020996\n    .align 2, 0\n_08020968: .4byte 0x0001600f\n_0802096C:\n    ldr r0, _080209A4 @ =gBattleExecBuffer\n    ldr r5, [r0]\n    cmp r5, 0\n    bne _08020996\n    ldr r4, _080209A8 @ =gBattleMons\n    ldr r2, _080209AC @ =gBank1\n    ldrb r0, [r2]\n    movs r1, 0x58\n    muls r0, r1\n    adds r0, r4\n    movs r3, 0\n    strh r5, [r0, 0x2E]\n    ldrb r0, [r2]\n    muls r0, r1\n    adds r0, r4\n    adds r0, 0x20\n    strb r3, [r0]\n    ldr r1, _080209B0 @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x2\n    str r0, [r1]\n_08020996:\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_080209A4: .4byte gBattleExecBuffer\n_080209A8: .4byte gBattleMons\n_080209AC: .4byte gBank1\n_080209B0: .4byte gBattlescriptCurrInstr\n        .syntax divided\n");
# 6671 "src/battle/battle_4.c"
}
# 6739 "src/battle/battle_4.c"
__attribute__((naked))
static void atk24(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r8\n    push {r7}\n    movs r6, 0\n    ldr r0, _08020AF0 @ =gBattleExecBuffer\n    ldr r0, [r0]\n    cmp r0, 0\n    beq _080209C6\n    b _08020B46\n_080209C6:\n    movs r5, 0\n_080209C8:\n    movs r0, 0x64\n    adds r1, r5, 0\n    muls r1, r0\n    ldr r0, _08020AF4 @ =gPlayerParty\n    adds r4, r1, r0\n    adds r0, r4, 0\n    movs r1, 0xB\n    bl GetMonData\n    cmp r0, 0\n    beq _080209F8\n    adds r0, r4, 0\n    movs r1, 0x2D\n    bl GetMonData\n    cmp r0, 0\n    bne _080209F8\n    adds r0, r4, 0\n    movs r1, 0x39\n    bl GetMonData\n    adds r0, r6, r0\n    lsls r0, 16\n    lsrs r6, r0, 16\n_080209F8:\n    adds r5, 0x1\n    cmp r5, 0x5\n    ble _080209C8\n    cmp r6, 0\n    bne _08020A0C\n    ldr r0, _08020AF8 @ =gBattleOutcome\n    ldrb r1, [r0]\n    movs r2, 0x2\n    orrs r1, r2\n    strb r1, [r0]\n_08020A0C:\n    movs r6, 0\n    movs r5, 0\n_08020A10:\n    movs r0, 0x64\n    adds r1, r5, 0\n    muls r1, r0\n    ldr r0, _08020AFC @ =gEnemyParty\n    adds r4, r1, r0\n    adds r0, r4, 0\n    movs r1, 0xB\n    bl GetMonData\n    cmp r0, 0\n    beq _08020A40\n    adds r0, r4, 0\n    movs r1, 0x2D\n    bl GetMonData\n    cmp r0, 0\n    bne _08020A40\n    adds r0, r4, 0\n    movs r1, 0x39\n    bl GetMonData\n    adds r0, r6, r0\n    lsls r0, 16\n    lsrs r6, r0, 16\n_08020A40:\n    adds r5, 0x1\n    cmp r5, 0x5\n    ble _08020A10\n    ldr r2, _08020AF8 @ =gBattleOutcome\n    cmp r6, 0\n    bne _08020A54\n    ldrb r0, [r2]\n    movs r1, 0x1\n    orrs r0, r1\n    strb r0, [r2]\n_08020A54:\n    ldrb r0, [r2]\n    cmp r0, 0\n    bne _08020B3E\n    ldr r2, _08020B00 @ =gBattleTypeFlags\n    ldrh r1, [r2]\n    movs r0, 0x2\n    ands r0, r1\n    mov r8, r2\n    cmp r0, 0\n    beq _08020B3E\n    movs r2, 0\n    movs r5, 0\n    ldr r0, _08020B04 @ =gNoOfAllBanks\n    ldrb r3, [r0]\n    mov r12, r0\n    ldr r7, _08020B08 @ =gBattlescriptCurrInstr\n    cmp r2, r3\n    bge _08020AA0\n    ldr r0, _08020B0C @ =gHitMarker\n    movs r1, 0x80\n    lsls r1, 21\n    ldr r6, [r0]\n    adds r4, r3, 0\n    ldr r3, _08020B10 @ =gSpecialStatuses\n_08020A84:\n    adds r0, r1, 0\n    lsls r0, r5\n    ands r0, r6\n    cmp r0, 0\n    beq _08020A98\n    ldrb r0, [r3]\n    lsls r0, 25\n    cmp r0, 0\n    blt _08020A98\n    adds r2, 0x1\n_08020A98:\n    adds r3, 0x28\n    adds r5, 0x2\n    cmp r5, r4\n    blt _08020A84\n_08020AA0:\n    movs r4, 0\n    movs r5, 0x1\n    mov r0, r12\n    ldrb r3, [r0]\n    cmp r5, r3\n    bge _08020ADA\n    ldr r0, _08020B0C @ =gHitMarker\n    movs r1, 0x80\n    lsls r1, 21\n    mov r12, r1\n    ldr r1, [r0]\n    ldr r0, _08020B10 @ =gSpecialStatuses\n    adds r6, r3, 0\n    adds r3, r0, 0\n    adds r3, 0x14\n_08020ABE:\n    mov r0, r12\n    lsls r0, r5\n    ands r0, r1\n    cmp r0, 0\n    beq _08020AD2\n    ldrb r0, [r3]\n    lsls r0, 25\n    cmp r0, 0\n    blt _08020AD2\n    adds r4, 0x1\n_08020AD2:\n    adds r3, 0x28\n    adds r5, 0x2\n    cmp r5, r6\n    blt _08020ABE\n_08020ADA:\n    mov r0, r8\n    ldrh r1, [r0]\n    movs r0, 0x40\n    ands r0, r1\n    cmp r0, 0\n    beq _08020B14\n    adds r0, r4, r2\n    cmp r0, 0x1\n    bgt _08020B1C\n    b _08020B36\n    .align 2, 0\n_08020AF0: .4byte gBattleExecBuffer\n_08020AF4: .4byte gPlayerParty\n_08020AF8: .4byte gBattleOutcome\n_08020AFC: .4byte gEnemyParty\n_08020B00: .4byte gBattleTypeFlags\n_08020B04: .4byte gNoOfAllBanks\n_08020B08: .4byte gBattlescriptCurrInstr\n_08020B0C: .4byte gHitMarker\n_08020B10: .4byte gSpecialStatuses\n_08020B14:\n    cmp r4, 0\n    beq _08020B36\n    cmp r2, 0\n    beq _08020B36\n_08020B1C:\n    ldr r2, [r7]\n    ldrb r1, [r2, 0x1]\n    ldrb r0, [r2, 0x2]\n    lsls r0, 8\n    adds r1, r0\n    ldrb r0, [r2, 0x3]\n    lsls r0, 16\n    adds r1, r0\n    ldrb r0, [r2, 0x4]\n    lsls r0, 24\n    adds r1, r0\n    str r1, [r7]\n    b _08020B46\n_08020B36:\n    ldr r0, [r7]\n    adds r0, 0x5\n    str r0, [r7]\n    b _08020B46\n_08020B3E:\n    ldr r1, _08020B50 @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x5\n    str r0, [r1]\n_08020B46:\n    pop {r3}\n    mov r8, r3\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08020B50: .4byte gBattlescriptCurrInstr\n        .syntax divided\n");
# 6955 "src/battle/battle_4.c"
}


static void MoveValuesCleanUp(void)
{
    gBattleMoveFlags = 0;
    ((struct BattleStruct *) (gSharedMem + 0x0))->dmgMultiplier = 1;
    gCritMultiplier = 1;
    gBattleCommunication[0x3] = 0;
    gBattleCommunication[6] = 0;
    gHitMarker &= ~(0x00000040);
    gHitMarker &= ~(0x00004000);
}

static void atk25_move_values_cleanup(void)
{
    MoveValuesCleanUp();
    gBattlescriptCurrInstr += 1;
}

static void atk26_set_multihit(void)
{
    gMultiHitCounter = ((gBattlescriptCurrInstr + 1)[0]);
    gBattlescriptCurrInstr += 2;
}

static void atk27_decrement_multihit(void)
{
    if (--gMultiHitCounter == 0)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atk28_goto(void)
{
    gBattlescriptCurrInstr = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atk29_jumpifbyte(void)
{
    u8 caseID = ((gBattlescriptCurrInstr + 1)[0]);
    u8* ptr = (void*) ((gBattlescriptCurrInstr + 2)[0] + ((gBattlescriptCurrInstr + 2)[1] << 8) + ((gBattlescriptCurrInstr + 2)[2] << 16) + ((gBattlescriptCurrInstr + 2)[3] << 24));
    u8 value = ((gBattlescriptCurrInstr + 6)[0]);
    u8* jump_loc = (void*) ((gBattlescriptCurrInstr + 7)[0] + ((gBattlescriptCurrInstr + 7)[1] << 8) + ((gBattlescriptCurrInstr + 7)[2] << 16) + ((gBattlescriptCurrInstr + 7)[3] << 24));
    gBattlescriptCurrInstr += 11;
    switch (caseID)
    {
    case 0x0:
        if (*ptr == value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x1:
        if (*ptr != value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x2:
        if (*ptr > value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x3:
        if (*ptr < value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x4:
        if (*ptr & value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x5:
        if (!(*ptr & value))
            gBattlescriptCurrInstr = jump_loc;
        break;
    }
}

static void atk2A_jumpifhalfword(void)
{
    u8 caseID = ((gBattlescriptCurrInstr + 1)[0]);
    u16* ptr = (void*) ((gBattlescriptCurrInstr + 2)[0] + ((gBattlescriptCurrInstr + 2)[1] << 8) + ((gBattlescriptCurrInstr + 2)[2] << 16) + ((gBattlescriptCurrInstr + 2)[3] << 24));
    u16 value = ((gBattlescriptCurrInstr + 6)[0] + ((gBattlescriptCurrInstr + 6)[1] << 8));
    u8* jump_loc = (void*) ((gBattlescriptCurrInstr + 8)[0] + ((gBattlescriptCurrInstr + 8)[1] << 8) + ((gBattlescriptCurrInstr + 8)[2] << 16) + ((gBattlescriptCurrInstr + 8)[3] << 24));
    gBattlescriptCurrInstr += 12;
    switch (caseID)
    {
    case 0x0:
        if (*ptr == value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x1:
        if (*ptr != value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x2:
        if (*ptr > value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x3:
        if (*ptr < value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x4:
        if (*ptr & value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x5:
        if (!(*ptr & value))
            gBattlescriptCurrInstr = jump_loc;
        break;
    }
}


static void atk2B_jumpifword(void)
{
    u8 caseID = ((gBattlescriptCurrInstr + 1)[0]);
    u32* ptr = (void*) ((gBattlescriptCurrInstr + 2)[0] + ((gBattlescriptCurrInstr + 2)[1] << 8) + ((gBattlescriptCurrInstr + 2)[2] << 16) + ((gBattlescriptCurrInstr + 2)[3] << 24));
    u32 value = ((gBattlescriptCurrInstr + 6)[0] | ((gBattlescriptCurrInstr + 6)[1] << 8) | ((gBattlescriptCurrInstr + 6)[2] << 16) | ((gBattlescriptCurrInstr + 6)[3] << 24));
    u8* jump_loc = (void*) ((gBattlescriptCurrInstr + 10)[0] + ((gBattlescriptCurrInstr + 10)[1] << 8) + ((gBattlescriptCurrInstr + 10)[2] << 16) + ((gBattlescriptCurrInstr + 10)[3] << 24));
    gBattlescriptCurrInstr += 14;
    switch (caseID)
    {
    case 0x0:
        if (*ptr == value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x1:
        if (*ptr != value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x2:
        if (*ptr > value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x3:
        if (*ptr < value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x4:
        if (*ptr & value)
            gBattlescriptCurrInstr = jump_loc;
        break;
    case 0x5:
        if (!(*ptr & value))
            gBattlescriptCurrInstr = jump_loc;
        break;
    }
}

static void atk2C_jumpifarrayequal(void)
{

    u8* mem1 = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    u8* mem2 = (void*) ((gBattlescriptCurrInstr + 5)[0] + ((gBattlescriptCurrInstr + 5)[1] << 8) + ((gBattlescriptCurrInstr + 5)[2] << 16) + ((gBattlescriptCurrInstr + 5)[3] << 24));
    u32 size = ((gBattlescriptCurrInstr + 9)[0]);
    u8* jump_loc = (void*) ((gBattlescriptCurrInstr + 10)[0] + ((gBattlescriptCurrInstr + 10)[1] << 8) + ((gBattlescriptCurrInstr + 10)[2] << 16) + ((gBattlescriptCurrInstr + 10)[3] << 24));

    u8 i;
    for (i = 0; i < size; i++)
    {
        if (*mem1 != *mem2)
        {
            gBattlescriptCurrInstr += 14;
            break;
        }
        mem1++, mem2++;
    }

    if (i == size)
        gBattlescriptCurrInstr = jump_loc;
}

static void atk2D_jumpifarraynotequal(void)
{

    u8 equal_bytes = 0;
    u8* mem1 = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    u8* mem2 = (void*) ((gBattlescriptCurrInstr + 5)[0] + ((gBattlescriptCurrInstr + 5)[1] << 8) + ((gBattlescriptCurrInstr + 5)[2] << 16) + ((gBattlescriptCurrInstr + 5)[3] << 24));
    u32 size = ((gBattlescriptCurrInstr + 9)[0]);
    u8* jump_loc = (void*) ((gBattlescriptCurrInstr + 10)[0] + ((gBattlescriptCurrInstr + 10)[1] << 8) + ((gBattlescriptCurrInstr + 10)[2] << 16) + ((gBattlescriptCurrInstr + 10)[3] << 24));

    u8 i;
    for (i = 0; i < size; i++)
    {
        if (*mem1 == *mem2)
        {
            equal_bytes++;
        }
        mem1++, mem2++;
    }

    if (equal_bytes != size)
        gBattlescriptCurrInstr = jump_loc;
    else
        gBattlescriptCurrInstr += 14;
}

static void atk2E_setbyte(void)
{
    u8* mem = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    *mem = ((gBattlescriptCurrInstr + 5)[0]);
    gBattlescriptCurrInstr += 6;
}

static void atk2F_addbyte(void)
{
    u8* mem = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    *mem += ((gBattlescriptCurrInstr + 5)[0]);
    gBattlescriptCurrInstr += 6;
}

static void atk30_subbyte(void)
{
    u8* mem = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    *mem -= ((gBattlescriptCurrInstr + 5)[0]);
    gBattlescriptCurrInstr += 6;
}

static void atk31_copyarray(void)
{
    u8* mem1 = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    u8* mem2 = (void*) ((gBattlescriptCurrInstr + 5)[0] + ((gBattlescriptCurrInstr + 5)[1] << 8) + ((gBattlescriptCurrInstr + 5)[2] << 16) + ((gBattlescriptCurrInstr + 5)[3] << 24));
    s32 size = ((gBattlescriptCurrInstr + 9)[0]);

    s32 i;
    for (i = 0; i < size; i++)
    {
        mem1[i] = mem2[i];
    }

    gBattlescriptCurrInstr += 10;
}

static void atk32_copyarray_withindex(void)
{
    u8* mem1 = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    u8* mem2 = (void*) ((gBattlescriptCurrInstr + 5)[0] + ((gBattlescriptCurrInstr + 5)[1] << 8) + ((gBattlescriptCurrInstr + 5)[2] << 16) + ((gBattlescriptCurrInstr + 5)[3] << 24));
    u8* index = (void*) ((gBattlescriptCurrInstr + 9)[0] + ((gBattlescriptCurrInstr + 9)[1] << 8) + ((gBattlescriptCurrInstr + 9)[2] << 16) + ((gBattlescriptCurrInstr + 9)[3] << 24));
    s32 size = ((gBattlescriptCurrInstr + 13)[0]);

    s32 i;
    for (i = 0; i < size; i++)
    {
        mem1[i] = mem2[i + *index];
    }

    gBattlescriptCurrInstr += 14;
}

static void atk33_orbyte(void)
{
    u8* mem = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    *mem |= ((gBattlescriptCurrInstr + 5)[0]);
    gBattlescriptCurrInstr += 6;
}

static void atk34_orhalfword(void)
{
    u16* mem = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    u16 val = ((gBattlescriptCurrInstr + 5)[0] + ((gBattlescriptCurrInstr + 5)[1] << 8));

    *mem |= val;
    gBattlescriptCurrInstr += 7;
}

static void atk35_orword(void)
{
    u32* mem = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    u32 val = ((gBattlescriptCurrInstr + 5)[0] + ((gBattlescriptCurrInstr + 5)[1] << 8) + ((gBattlescriptCurrInstr + 5)[2] << 16) + ((gBattlescriptCurrInstr + 5)[3] << 24));

    *mem |= val;
    gBattlescriptCurrInstr += 9;
}

static void atk36_bicbyte(void)
{
    u8* mem = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    *mem &= ~(((gBattlescriptCurrInstr + 5)[0]));
    gBattlescriptCurrInstr += 6;
}

static void atk37_bichalfword(void)
{
    u16* mem = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    u16 val = ((gBattlescriptCurrInstr + 5)[0] + ((gBattlescriptCurrInstr + 5)[1] << 8));

    *mem &= ~val;
    gBattlescriptCurrInstr += 7;
}

static void atk38_bicword(void)
{
    u32* mem = (void*) ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8) + ((gBattlescriptCurrInstr + 1)[2] << 16) + ((gBattlescriptCurrInstr + 1)[3] << 24));
    u32 val = ((gBattlescriptCurrInstr + 5)[0] + ((gBattlescriptCurrInstr + 5)[1] << 8) + ((gBattlescriptCurrInstr + 5)[2] << 16) + ((gBattlescriptCurrInstr + 5)[3] << 24));

    *mem &= ~val;
    gBattlescriptCurrInstr += 9;
}

static void atk39_pause(void)
{
    if (gBattleExecBuffer == 0)
    {
        u16 value = ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8));
        if (++gPauseCounterBattle >= value)
        {
            gPauseCounterBattle = 0;
            gBattlescriptCurrInstr += 3;
        }
    }
}

static void atk3A_waitstate(void)
{
    if (gBattleExecBuffer == 0)
        gBattlescriptCurrInstr++;
}

static void atk3B_healthbar_update(void)
{
    if (!((gBattlescriptCurrInstr + 1)[0]))
        gActiveBank = gBankTarget;
    else
        gActiveBank = gBankAttacker;

    EmitHealthBarUpdate(0, gBattleMoveDamage);
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 2;
}

static void atk3C_return(void)
{
    b_movescr_stack_pop_cursor();
}

static void atk3D_end(void)
{
    gBattleMoveFlags = 0;
    gActiveBank = 0;
    gFightStateTracker = 0xB;
}

static void atk3E_end2(void)
{

    gActiveBank = 0;
    gFightStateTracker = 0xB;
}

static void atk3F_end3(void)
{
    b_movescr_stack_pop_cursor();
    if (((struct funcStack *) (gSharedMem + 0x17140))->size)
        ((struct funcStack *) (gSharedMem + 0x17140))->size--;
    gBattleMainFunc = ((struct funcStack *) (gSharedMem + 0x17140))->ptr[((struct funcStack *) (gSharedMem + 0x17140))->size];
}

static void atk41_call(void)
{
    b_movescr_stack_push(gBattlescriptCurrInstr + 5);
    gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atk42_jumpiftype2(void)
{
    u8 bank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));

    if (((gBattlescriptCurrInstr + 2)[0]) == gBattleMons[bank].type1 || ((gBattlescriptCurrInstr + 2)[0]) == gBattleMons[bank].type2)
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 3)[0] | ((gBattlescriptCurrInstr + 3)[1] << 8) | ((gBattlescriptCurrInstr + 3)[2] << 16) | ((gBattlescriptCurrInstr + 3)[3] << 24));
    else
        gBattlescriptCurrInstr += 7;
}

static void atk43_jumpifabilitypresent(void)
{
    if (AbilityBattleEffects(0x13, 0, ((gBattlescriptCurrInstr + 1)[0]), 0, 0))
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 2)[0] | ((gBattlescriptCurrInstr + 2)[1] << 8) | ((gBattlescriptCurrInstr + 2)[2] << 16) | ((gBattlescriptCurrInstr + 2)[3] << 24));
    else
        gBattlescriptCurrInstr += 6;
}

static void atk44(void)
{
    (gSharedMem[0x16060 + gBankAttacker]) = 1;
}

static void atk45_playanimation(void)
{
    const u16* argumentPtr;

    gActiveBank = GetBattleBank(gBattlescriptCurrInstr[1]);
    argumentPtr = ((void *)((gBattlescriptCurrInstr + 3)[0] + ((gBattlescriptCurrInstr + 3)[1] << 8) + ((gBattlescriptCurrInstr + 3)[2] << 16) + ((gBattlescriptCurrInstr + 3)[3] << 24)));

    if (gBattlescriptCurrInstr[2] == 0x1
        || gBattlescriptCurrInstr[2] == 0x11
        || gBattlescriptCurrInstr[2] == 0x2)
    {
        EmitBattleAnimation(0, gBattlescriptCurrInstr[2], *argumentPtr);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 7;
    }
    else if (gHitMarker & 0x00000080)
    {
        b_movescr_stack_push(gBattlescriptCurrInstr + 7);
        gBattlescriptCurrInstr = BattleScript_Pausex20;
    }
    else if (gBattlescriptCurrInstr[2] == 0xA
             || gBattlescriptCurrInstr[2] == 0xB
             || gBattlescriptCurrInstr[2] == 0xC
             || gBattlescriptCurrInstr[2] == 0xD)
    {
        EmitBattleAnimation(0, gBattlescriptCurrInstr[2], *argumentPtr);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 7;
    }
    else if (gStatuses3[gActiveBank] & ((0x80 | 0x40 | 0x40000)))
    {
        gBattlescriptCurrInstr += 7;
    }
    else
    {
        EmitBattleAnimation(0, gBattlescriptCurrInstr[2], *argumentPtr);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 7;
    }
}

static void atk46_playanimation2(void)
{
    const u16* argumentPtr;
    const u8* animationIdPtr;

    gActiveBank = GetBattleBank(gBattlescriptCurrInstr[1]);
    animationIdPtr = ((void *)((gBattlescriptCurrInstr + 2)[0] + ((gBattlescriptCurrInstr + 2)[1] << 8) + ((gBattlescriptCurrInstr + 2)[2] << 16) + ((gBattlescriptCurrInstr + 2)[3] << 24)));
    argumentPtr = ((void *)((gBattlescriptCurrInstr + 6)[0] + ((gBattlescriptCurrInstr + 6)[1] << 8) + ((gBattlescriptCurrInstr + 6)[2] << 16) + ((gBattlescriptCurrInstr + 6)[3] << 24)));

    if (*animationIdPtr == 0x1
        || *animationIdPtr == 0x11
        || *animationIdPtr == 0x2)
    {
        EmitBattleAnimation(0, *animationIdPtr, *argumentPtr);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 10;
    }
    else if (gHitMarker & 0x00000080)
    {
        gBattlescriptCurrInstr += 10;
    }
    else if (*animationIdPtr == 0xA
             || *animationIdPtr == 0xB
             || *animationIdPtr == 0xC
             || *animationIdPtr == 0xD)
    {
        EmitBattleAnimation(0, *animationIdPtr, *argumentPtr);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 10;
    }
    else if (gStatuses3[gActiveBank] & ((0x80 | 0x40 | 0x40000)))
    {
        gBattlescriptCurrInstr += 10;
    }
    else
    {
        EmitBattleAnimation(0, *animationIdPtr, *argumentPtr);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 10;
    }
}

static void atk47_setgraphicalstatchangevalues(void)
{
    u8 to_add = 0;
    switch (((struct BattleStruct *) (gSharedMem + 0x0))->statChanger & 0xF0)
    {
    case 0x10:
        to_add = 0xF;
        break;
    case 0x20:
        to_add = 0x27;
        break;
    case 0x90:
        to_add = 0x16;
        break;
    case 0xA0:
        to_add = 0x2E;
        break;
    }
    ((struct BattleStruct *) (gSharedMem + 0x0))->animArg1 = (((struct BattleStruct *) (gSharedMem + 0x0))->statChanger & 0xF) + to_add - 1;
    ((struct BattleStruct *) (gSharedMem + 0x0))->animArg2 = 0;
    gBattlescriptCurrInstr++;
}
# 7529 "src/battle/battle_4.c"
__attribute__((naked))
static void atk48_playstatchangeanimation(void)
{
    asm(".syntax unified\npush {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x4\n    movs r7, 0\n    movs r0, 0\n    mov r8, r0\n    movs r3, 0\n    ldr r5, _08021670 @ =gBattlescriptCurrInstr\n    ldr r0, [r5]\n    ldrb r0, [r0, 0x1]\n    str r3, [sp]\n    bl GetBattleBank\n    ldr r2, _08021674 @ =gActiveBank\n    strb r0, [r2]\n    ldr r0, [r5]\n    ldrb r4, [r0, 0x2]\n    ldrb r1, [r0, 0x3]\n    movs r0, 0x1\n    ands r0, r1\n    ldr r3, [sp]\n    cmp r0, 0\n    beq _08021710\n    movs r0, 0x2\n    ands r0, r1\n    movs r1, 0x15\n    cmp r0, 0\n    beq _0802163C\n    movs r1, 0x2D\n_0802163C:\n    cmp r4, 0\n    beq _080216E4\n    movs r0, 0x1\n    mov r10, r0\n    ldr r0, _08021678 @ =gUnknown_02024A98\n    mov r9, r0\n    lsls r5, r1, 16\n_0802164A:\n    adds r0, r4, 0\n    mov r1, r10\n    ands r0, r1\n    cmp r0, 0\n    beq _080216D6\n    ldr r0, _08021670 @ =gBattlescriptCurrInstr\n    ldr r0, [r0]\n    ldrb r1, [r0, 0x3]\n    movs r0, 0x8\n    ands r0, r1\n    cmp r0, 0\n    beq _0802167C\n    ldr r0, _08021674 @ =gActiveBank\n    ldrb r1, [r0]\n    movs r0, 0x58\n    muls r0, r1\n    adds r0, r7, r0\n    b _080216C4\n    .align 2, 0\n_08021670: .4byte gBattlescriptCurrInstr\n_08021674: .4byte gActiveBank\n_08021678: .4byte gUnknown_02024A98\n_0802167C:\n    ldr r6, _08021700 @ =gActiveBank\n    ldrb r0, [r6]\n    str r3, [sp]\n    bl GetBankIdentity\n    mov r1, r10\n    ands r1, r0\n    lsls r0, r1, 1\n    adds r0, r1\n    lsls r0, 2\n    ldr r1, _08021704 @ =gSideTimer\n    adds r0, r1\n    ldrb r0, [r0, 0x2]\n    ldr r3, [sp]\n    cmp r0, 0\n    bne _080216D6\n    ldr r0, _08021708 @ =gBattleMons\n    ldrb r2, [r6]\n    movs r1, 0x58\n    muls r2, r1\n    adds r0, r2, r0\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x1D\n    beq _080216D6\n    cmp r0, 0x49\n    beq _080216D6\n    cmp r0, 0x33\n    bne _080216BA\n    cmp r7, 0x6\n    beq _080216D6\n_080216BA:\n    cmp r0, 0x34\n    bne _080216C2\n    cmp r7, 0x1\n    beq _080216D6\n_080216C2:\n    adds r0, r7, r2\n_080216C4:\n    add r0, r9\n    ldrb r0, [r0]\n    lsls r0, 24\n    asrs r0, 24\n    cmp r0, 0\n    ble _080216D6\n    lsrs r0, r5, 16\n    mov r8, r0\n    adds r3, 0x1\n_080216D6:\n    lsrs r4, 1\n    movs r1, 0x80\n    lsls r1, 9\n    adds r5, r1\n    adds r7, 0x1\n    cmp r4, 0\n    bne _0802164A\n_080216E4:\n    ldr r0, _0802170C @ =gBattlescriptCurrInstr\n    mov r9, r0\n    cmp r3, 0x1\n    ble _08021772\n    ldr r0, [r0]\n    ldrb r1, [r0, 0x3]\n    movs r0, 0x2\n    ands r0, r1\n    movs r1, 0x39\n    mov r8, r1\n    cmp r0, 0\n    beq _08021772\n    movs r0, 0x3A\n    b _08021770\n    .align 2, 0\n_08021700: .4byte gActiveBank\n_08021704: .4byte gSideTimer\n_08021708: .4byte gBattleMons\n_0802170C: .4byte gBattlescriptCurrInstr\n_08021710:\n    movs r0, 0x2\n    ands r0, r1\n    movs r1, 0xE\n    cmp r0, 0\n    beq _0802171C\n    movs r1, 0x26\n_0802171C:\n    mov r9, r5\n    cmp r4, 0\n    beq _08021758\n    ldr r6, _0802178C @ =gUnknown_02024A98\n    adds r5, r2, 0\n    lsls r2, r1, 16\n_08021728:\n    movs r0, 0x1\n    ands r0, r4\n    cmp r0, 0\n    beq _0802174A\n    ldrb r1, [r5]\n    movs r0, 0x58\n    muls r0, r1\n    adds r0, r7, r0\n    adds r0, r6\n    ldrb r0, [r0]\n    lsls r0, 24\n    asrs r0, 24\n    cmp r0, 0xB\n    bgt _0802174A\n    lsrs r1, r2, 16\n    mov r8, r1\n    adds r3, 0x1\n_0802174A:\n    lsrs r4, 1\n    movs r0, 0x80\n    lsls r0, 9\n    adds r2, r0\n    adds r7, 0x1\n    cmp r4, 0\n    bne _08021728\n_08021758:\n    cmp r3, 0x1\n    ble _08021772\n    mov r1, r9\n    ldr r0, [r1]\n    ldrb r1, [r0, 0x3]\n    movs r0, 0x2\n    ands r0, r1\n    movs r1, 0x37\n    mov r8, r1\n    cmp r0, 0\n    beq _08021772\n    movs r0, 0x38\n_08021770:\n    mov r8, r0\n_08021772:\n    mov r1, r9\n    ldr r2, [r1]\n    ldrb r1, [r2, 0x3]\n    movs r0, 0x4\n    ands r0, r1\n    cmp r0, 0\n    beq _08021790\n    cmp r3, 0x1\n    bgt _08021790\n    adds r0, r2, 0x4\n    mov r1, r9\n    b _080217E6\n    .align 2, 0\n_0802178C: .4byte gUnknown_02024A98\n_08021790:\n    cmp r3, 0\n    beq _080217E0\n    ldr r0, _080217D0 @ =gSharedMem\n    ldr r1, _080217D4 @ =0x000160dc\n    adds r4, r0, r1\n    ldrb r0, [r4]\n    cmp r0, 0\n    bne _080217E0\n    movs r0, 0\n    movs r1, 0x1\n    mov r2, r8\n    str r3, [sp]\n    bl EmitBattleAnimation\n    ldr r0, _080217D8 @ =gActiveBank\n    ldrb r0, [r0]\n    bl MarkBufferBankForExecution\n    ldr r0, _080217DC @ =gBattlescriptCurrInstr\n    ldr r0, [r0]\n    ldrb r1, [r0, 0x3]\n    movs r0, 0x4\n    ands r0, r1\n    ldr r3, [sp]\n    cmp r0, 0\n    beq _080217CC\n    cmp r3, 0x1\n    ble _080217CC\n    movs r0, 0x1\n    strb r0, [r4]\n_080217CC:\n    ldr r1, _080217DC @ =gBattlescriptCurrInstr\n    b _080217E2\n    .align 2, 0\n_080217D0: .4byte gSharedMem\n_080217D4: .4byte 0x000160dc\n_080217D8: .4byte gActiveBank\n_080217DC: .4byte gBattlescriptCurrInstr\n_080217E0:\n    mov r1, r9\n_080217E2:\n    ldr r0, [r1]\n    adds r0, 0x4\n_080217E6:\n    str r0, [r1]\n    add sp, 0x4\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n        .syntax divided");
# 7794 "src/battle/battle_4.c"
}
# 7938 "src/battle/battle_4.c"
__attribute__((naked))
static void atk49_moveendturn(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x18\n    movs r0, 0\n    mov r10, r0\n    ldr r0, _08021834 @ =gBattlescriptCurrInstr\n    ldr r0, [r0]\n    ldrb r1, [r0, 0x1]\n    str r1, [sp, 0x10]\n    ldrb r0, [r0, 0x2]\n    str r0, [sp, 0x14]\n    ldr r1, _08021838 @ =gBattleMons\n    ldr r0, _0802183C @ =gBankAttacker\n    ldrb r2, [r0]\n    movs r0, 0x58\n    muls r0, r2\n    adds r1, r0, r1\n    ldrh r0, [r1, 0x2E]\n    cmp r0, 0xAF\n    bne _08021844\n    ldr r1, _08021840 @ =gEnigmaBerries\n    lsls r0, r2, 3\n    subs r0, r2\n    lsls r0, 2\n    adds r0, r1\n    ldrb r0, [r0, 0x7]\n    b _0802184E\n    .align 2, 0\n_08021834: .4byte gBattlescriptCurrInstr\n_08021838: .4byte gBattleMons\n_0802183C: .4byte gBankAttacker\n_08021840: .4byte gEnigmaBerries\n_08021844:\n    ldrh r0, [r1, 0x2E]\n    bl ItemId_GetHoldEffect\n    lsls r0, 24\n    lsrs r0, 24\n_0802184E:\n    str r0, [sp, 0x8]\n    ldr r0, _0802186C @ =gBankAttacker\n    ldrb r1, [r0]\n    lsls r1, 1\n    ldr r0, _08021870 @ =gSharedMem + 0x160E8\n    adds r1, r0\n    str r1, [sp, 0xC]\n    subs r0, 0xCC\n    ldrb r0, [r0]\n    cmp r0, 0\n    beq _080218C0\n    movs r2, 0x3F\n    ands r2, r0\n    str r2, [sp, 0x4]\n    b _080218D2\n    .align 2, 0\n_0802186C: .4byte gBankAttacker\n_08021870: .4byte gSharedMem + 0x160E8\n_08021874:\n    strb r2, [r7]\n    ldr r0, [r5]\n    orrs r0, r6\n    str r0, [r5]\n    ldr r0, _080218AC @ =gSharedMem\n    ldr r3, _080218B0 @ =0x0001600c\n    adds r0, r3\n    strb r4, [r0]\n    bl MoveValuesCleanUp\n    ldr r2, _080218B4 @ =gBattleScriptsEffectsTable\n    mov r4, r8\n    ldrh r1, [r4]\n    lsls r0, r1, 1\n    adds r0, r1\n    lsls r0, 2\n    add r0, r9\n    ldrb r0, [r0]\n    lsls r0, 2\n    adds r0, r2\n    ldr r0, [r0]\n    bl b_movescr_stack_push\n    ldr r1, _080218B8 @ =gBattlescriptCurrInstr\n    ldr r0, _080218BC @ =gUnknown_081D9B2D\n    bl _0802229C\n    .align 2, 0\n_080218AC: .4byte gSharedMem\n_080218B0: .4byte 0x0001600c\n_080218B4: .4byte gBattleScriptsEffectsTable\n_080218B8: .4byte gBattlescriptCurrInstr\n_080218BC: .4byte gUnknown_081D9B2D\n_080218C0:\n    ldr r2, _080218D8 @ =gBattleMoves\n    ldr r0, _080218DC @ =gCurrentMove\n    ldrh r1, [r0]\n    lsls r0, r1, 1\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r2\n    ldrb r0, [r0, 0x2]\n    str r0, [sp, 0x4]\n_080218D2:\n    ldr r5, _080218E0 @ =gSharedMem\n    mov r12, r5\n    b _080218EE\n    .align 2, 0\n_080218D8: .4byte gBattleMoves\n_080218DC: .4byte gCurrentMove\n_080218E0: .4byte gSharedMem\n_080218E4:\n    mov r0, r10\n    cmp r0, 0\n    beq _080218EE\n    bl _08022286\n_080218EE:\n    ldr r0, _08021908 @ =0x0001600c\n    add r0, r12\n    ldrb r0, [r0]\n    cmp r0, 0x11\n    bls _080218FC\n    bl _0802224E\n_080218FC:\n    lsls r0, 2\n    ldr r1, _0802190C @ =_08021910\n    adds r0, r1\n    ldr r0, [r0]\n    mov pc, r0\n    .align 2, 0\n_08021908: .4byte 0x0001600c\n_0802190C: .4byte _08021910\n    .align 2, 0\n_08021910:\n    .4byte _08021958\n    .4byte _08021A34\n    .4byte _08021AF0\n    .4byte _08021B20\n    .4byte _08021B44\n    .4byte _08021B78\n    .4byte _08021B9C\n    .4byte _08021C40\n    .4byte _08021C78\n    .4byte _08021CA8\n    .4byte _08021CCC\n    .4byte _08021D18\n    .4byte _08021DAC\n    .4byte _08021E30\n    .4byte _08021E70\n    .4byte _08022068\n    .4byte _080221C0\n    .4byte _0802224E\n_08021958:\n    ldr r5, _08021A08 @ =gBattleMons\n    ldr r2, _08021A0C @ =gBankTarget\n    ldrb r4, [r2]\n    movs r6, 0x58\n    adds r3, r4, 0\n    muls r3, r6\n    adds r0, r5, 0\n    adds r0, 0x50\n    adds r0, r3, r0\n    ldr r1, [r0]\n    movs r0, 0x80\n    lsls r0, 16\n    ands r1, r0\n    cmp r1, 0\n    beq _080219FE\n    adds r0, r3, r5\n    ldrh r0, [r0, 0x28]\n    cmp r0, 0\n    beq _080219FE\n    ldr r0, _08021A10 @ =gBankAttacker\n    ldrb r1, [r0]\n    cmp r1, r4\n    beq _080219FE\n    adds r0, r1, 0\n    bl GetBankSide\n    adds r4, r0, 0\n    ldr r1, _08021A0C @ =gBankTarget\n    ldrb r0, [r1]\n    bl GetBankSide\n    lsls r4, 24\n    lsls r0, 24\n    cmp r4, r0\n    beq _080219FE\n    ldr r0, _08021A14 @ =gBattleMoveFlags\n    ldrb r1, [r0]\n    movs r0, 0x29\n    ands r0, r1\n    cmp r0, 0\n    bne _080219FE\n    ldr r2, _08021A18 @ =gProtectStructs\n    ldr r4, _08021A0C @ =gBankTarget\n    ldrb r3, [r4]\n    lsls r1, r3, 4\n    adds r0, r2, 0x4\n    adds r0, r1, r0\n    ldr r0, [r0]\n    cmp r0, 0\n    bne _080219C8\n    adds r0, r2, 0\n    adds r0, 0x8\n    adds r0, r1, r0\n    ldr r0, [r0]\n    cmp r0, 0\n    beq _080219FE\n_080219C8:\n    ldr r2, _08021A1C @ =gBattleMoves\n    ldr r0, _08021A20 @ =gCurrentMove\n    ldrh r1, [r0]\n    lsls r0, r1, 1\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r2\n    ldrb r0, [r0, 0x1]\n    cmp r0, 0\n    beq _080219FE\n    adds r0, r3, 0\n    muls r0, r6\n    adds r1, r0, r5\n    ldrb r2, [r1, 0x19]\n    movs r0, 0x19\n    ldrsb r0, [r1, r0]\n    cmp r0, 0xB\n    bgt _080219FE\n    adds r0, r2, 0x1\n    strb r0, [r1, 0x19]\n    bl b_movescr_stack_push_cursor\n    ldr r1, _08021A24 @ =gBattlescriptCurrInstr\n    ldr r0, _08021A28 @ =gUnknown_081D9132\n    str r0, [r1]\n    movs r5, 0x1\n    mov r10, r5\n_080219FE:\n    ldr r2, _08021A2C @ =gSharedMem\n    ldr r0, _08021A30 @ =0x0001600c\n    adds r1, r2, r0\n    b _08021E00\n    .align 2, 0\n_08021A08: .4byte gBattleMons\n_08021A0C: .4byte gBankTarget\n_08021A10: .4byte gBankAttacker\n_08021A14: .4byte gBattleMoveFlags\n_08021A18: .4byte gProtectStructs\n_08021A1C: .4byte gBattleMoves\n_08021A20: .4byte gCurrentMove\n_08021A24: .4byte gBattlescriptCurrInstr\n_08021A28: .4byte gUnknown_081D9132\n_08021A2C: .4byte gSharedMem\n_08021A30: .4byte 0x0001600c\n_08021A34:\n    ldr r2, _08021AD0 @ =gBattleMons\n    ldr r1, _08021AD4 @ =gBankTarget\n    ldrb r4, [r1]\n    movs r3, 0x58\n    mov r12, r3\n    mov r3, r12\n    muls r3, r4\n    adds r7, r2, 0\n    adds r7, 0x4C\n    adds r6, r3, r7\n    ldr r5, [r6]\n    movs r0, 0x20\n    ands r0, r5\n    cmp r0, 0\n    bne _08021A54\n    b _08021DFA\n_08021A54:\n    adds r0, r3, r2\n    ldrh r0, [r0, 0x28]\n    cmp r0, 0\n    bne _08021A5E\n    b _08021DFA\n_08021A5E:\n    ldr r0, _08021AD8 @ =gBankAttacker\n    ldrb r0, [r0]\n    cmp r0, r4\n    bne _08021A68\n    b _08021DFA\n_08021A68:\n    ldr r0, _08021ADC @ =gSpecialStatuses\n    lsls r1, r4, 2\n    adds r1, r4\n    lsls r1, 2\n    adds r0, 0xC\n    adds r1, r0\n    ldr r0, [r1]\n    cmp r0, 0\n    bne _08021A7C\n    b _08021DFA\n_08021A7C:\n    ldr r0, _08021AE0 @ =gBattleMoveFlags\n    ldrb r1, [r0]\n    movs r0, 0x29\n    ands r0, r1\n    cmp r0, 0\n    beq _08021A8A\n    b _08021DFA\n_08021A8A:\n    ldr r4, [sp, 0x4]\n    cmp r4, 0xA\n    beq _08021A92\n    b _08021DFA\n_08021A92:\n    movs r0, 0x21\n    negs r0, r0\n    ands r5, r0\n    str r5, [r6]\n    ldr r4, _08021AE4 @ =gActiveBank\n    ldr r5, _08021AD4 @ =gBankTarget\n    ldrb r0, [r5]\n    strb r0, [r4]\n    ldrb r0, [r5]\n    mov r1, r12\n    muls r1, r0\n    adds r0, r1, 0\n    adds r0, r7\n    str r0, [sp]\n    movs r0, 0\n    movs r1, 0x28\n    movs r2, 0\n    movs r3, 0x4\n    bl EmitSetAttributes\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    bl b_movescr_stack_push_cursor\n    ldr r1, _08021AE8 @ =gBattlescriptCurrInstr\n    ldr r0, _08021AEC @ =gUnknown_081D955D\n    str r0, [r1]\n    movs r2, 0x1\n    mov r10, r2\n    b _08021DFA\n    .align 2, 0\n_08021AD0: .4byte gBattleMons\n_08021AD4: .4byte gBankTarget\n_08021AD8: .4byte gBankAttacker\n_08021ADC: .4byte gSpecialStatuses\n_08021AE0: .4byte gBattleMoveFlags\n_08021AE4: .4byte gActiveBank\n_08021AE8: .4byte gBattlescriptCurrInstr\n_08021AEC: .4byte gUnknown_081D955D\n_08021AF0:\n    ldr r0, _08021B14 @ =gBankTarget\n    ldrb r1, [r0]\n    movs r0, 0\n    str r0, [sp]\n    movs r0, 0x7\n    movs r2, 0\n    movs r3, 0\n    bl AbilityBattleEffects\n    lsls r0, 24\n    cmp r0, 0\n    beq _08021B0C\n    movs r4, 0x1\n    mov r10, r4\n_08021B0C:\n    ldr r2, _08021B18 @ =gSharedMem\n    ldr r5, _08021B1C @ =0x0001600c\n    adds r1, r2, r5\n    b _08021E00\n    .align 2, 0\n_08021B14: .4byte gBankTarget\n_08021B18: .4byte gSharedMem\n_08021B1C: .4byte 0x0001600c\n_08021B20:\n    ldr r0, _08021B40 @ =gBankTarget\n    ldrb r1, [r0]\n    movs r0, 0\n    str r0, [sp]\n    movs r0, 0x4\n    movs r2, 0\n    movs r3, 0\n    bl AbilityBattleEffects\n    lsls r0, 24\n    cmp r0, 0\n    bne _08021B3A\n    b _08021DFA\n_08021B3A:\n    movs r0, 0x1\n    mov r10, r0\n    b _08021DFA\n    .align 2, 0\n_08021B40: .4byte gBankTarget\n_08021B44:\n    movs r0, 0\n    str r0, [sp]\n    movs r0, 0x5\n    movs r1, 0\n    movs r2, 0\n    movs r3, 0\n    bl AbilityBattleEffects\n    lsls r0, 24\n    cmp r0, 0\n    beq _08021B68\n    movs r4, 0x1\n    mov r10, r4\n    ldr r5, _08021B64 @ =gSharedMem\n    mov r12, r5\n    b _0802224E\n    .align 2, 0\n_08021B64: .4byte gSharedMem\n_08021B68:\n    ldr r2, _08021B70 @ =gSharedMem\n    ldr r0, _08021B74 @ =0x0001600c\n    adds r1, r2, r0\n    b _08021E00\n    .align 2, 0\n_08021B70: .4byte gSharedMem\n_08021B74: .4byte 0x0001600c\n_08021B78:\n    ldr r0, _08021B98 @ =gBankAttacker\n    ldrb r1, [r0]\n    movs r0, 0\n    str r0, [sp]\n    movs r0, 0x8\n    movs r2, 0\n    movs r3, 0\n    bl AbilityBattleEffects\n    lsls r0, 24\n    cmp r0, 0\n    bne _08021B92\n    b _08021DFA\n_08021B92:\n    movs r1, 0x1\n    mov r10, r1\n    b _08021DFA\n    .align 2, 0\n_08021B98: .4byte gBankAttacker\n_08021B9C:\n    ldr r0, _08021C28 @ =gHitMarker\n    ldr r0, [r0]\n    movs r1, 0x80\n    lsls r1, 18\n    ands r0, r1\n    cmp r0, 0\n    beq _08021BE0\n    ldr r4, [sp, 0x8]\n    cmp r4, 0x1D\n    bne _08021BE0\n    ldr r0, _08021C2C @ =gUnknown_02024BE8\n    ldrh r2, [r0]\n    adds r7, r0, 0\n    cmp r2, 0xA5\n    beq _08021BE0\n    ldr r5, [sp, 0xC]\n    ldrh r1, [r5]\n    cmp r1, 0\n    beq _08021BC8\n    ldr r0, _08021C30 @ =0x0000ffff\n    cmp r1, r0\n    bne _08021BE0\n_08021BC8:\n    cmp r2, 0xE2\n    bne _08021BDA\n    ldr r0, _08021C34 @ =gBattleMoveFlags\n    ldrb r1, [r0]\n    movs r0, 0x20\n    ands r0, r1\n    cmp r0, 0\n    bne _08021BDA\n    b _08022244\n_08021BDA:\n    ldrh r0, [r7]\n    ldr r1, [sp, 0xC]\n    strh r0, [r1]\n_08021BE0:\n    movs r4, 0\n    ldr r2, _08021C38 @ =gBattleMons\n    ldr r3, _08021C3C @ =gBankAttacker\n    ldrb r1, [r3]\n    movs r0, 0x58\n    muls r0, r1\n    adds r2, 0xC\n    adds r0, r2\n    ldrh r0, [r0]\n    ldr r5, [sp, 0xC]\n    ldrh r1, [r5]\n    mov r9, r3\n    cmp r0, r1\n    beq _08021C18\n    mov r6, r9\n    movs r3, 0x58\n    adds r5, r1, 0\n_08021C02:\n    adds r4, 0x1\n    cmp r4, 0x3\n    bgt _08021C18\n    lsls r0, r4, 1\n    ldrb r1, [r6]\n    muls r1, r3\n    adds r0, r1\n    adds r0, r2\n    ldrh r0, [r0]\n    cmp r0, r5\n    bne _08021C02\n_08021C18:\n    cmp r4, 0x4\n    beq _08021C1E\n    b _08022244\n_08021C1E:\n    movs r0, 0\n    ldr r1, [sp, 0xC]\n_08021C22:\n    strh r0, [r1]\n    b _08022244\n    .align 2, 0\n_08021C28: .4byte gHitMarker\n_08021C2C: .4byte gUnknown_02024BE8\n_08021C30: .4byte 0x0000ffff\n_08021C34: .4byte gBattleMoveFlags\n_08021C38: .4byte gBattleMons\n_08021C3C: .4byte gBankAttacker\n_08021C40:\n    movs r4, 0\n    ldr r0, _08021C6C @ =gNoOfAllBanks\n    ldrb r2, [r0]\n    cmp r4, r2\n    blt _08021C4C\n    b _08022244\n_08021C4C:\n    movs r5, 0\n    ldr r2, _08021C70 @ =gSharedMem + 0x160F0\n    ldr r3, _08021C74 @ =gBattleMons\n_08021C52:\n    ldrh r1, [r2]\n    cmp r1, 0\n    beq _08021C5C\n    strh r1, [r3, 0x2E]\n    strh r5, [r2]\n_08021C5C:\n    adds r2, 0x2\n    adds r3, 0x58\n    adds r4, 0x1\n    ldrb r1, [r0]\n    cmp r4, r1\n    blt _08021C52\n    b _08022244\n    .align 2, 0\n_08021C6C: .4byte gNoOfAllBanks\n_08021C70: .4byte gSharedMem + 0x160F0\n_08021C74: .4byte gBattleMons\n_08021C78:\n    movs r0, 0x3\n    movs r1, 0\n    movs r2, 0\n    bl ItemBattleEffects\n    lsls r0, 24\n    cmp r0, 0\n    beq _08021C98\n    movs r2, 0x1\n    mov r10, r2\n    ldr r3, _08021C94 @ =gSharedMem\n    mov r12, r3\n    b _0802224E\n    .align 2, 0\n_08021C94: .4byte gSharedMem\n_08021C98:\n    ldr r2, _08021CA0 @ =gSharedMem\n    ldr r4, _08021CA4 @ =0x0001600c\n    adds r1, r2, r4\n    b _08021E00\n    .align 2, 0\n_08021CA0: .4byte gSharedMem\n_08021CA4: .4byte 0x0001600c\n_08021CA8:\n    movs r0, 0x4\n    movs r1, 0\n    movs r2, 0\n    bl ItemBattleEffects\n    lsls r0, 24\n    cmp r0, 0\n    beq _08021CBC\n    movs r5, 0x1\n    mov r10, r5\n_08021CBC:\n    ldr r2, _08021CC4 @ =gSharedMem\n    ldr r0, _08021CC8 @ =0x0001600c\n    adds r1, r2, r0\n    b _08021E00\n    .align 2, 0\n_08021CC4: .4byte gSharedMem\n_08021CC8: .4byte 0x0001600c\n_08021CCC:\n    ldr r1, _08021D04 @ =gStatuses3\n    ldr r0, _08021D08 @ =gBankAttacker\n    ldrb r2, [r0]\n    lsls r0, r2, 2\n    adds r0, r1\n    ldr r0, [r0]\n    ldr r1, _08021D0C @ =0x000400c0\n    ands r0, r1\n    cmp r0, 0\n    bne _08021CE2\n    b _08021DFA\n_08021CE2:\n    ldr r0, _08021D10 @ =gHitMarker\n    ldr r0, [r0]\n    movs r1, 0x80\n    ands r0, r1\n    cmp r0, 0\n    bne _08021CF0\n    b _08021DFA\n_08021CF0:\n    ldr r4, _08021D14 @ =gActiveBank\n    strb r2, [r4]\n    movs r0, 0\n    movs r1, 0x1\n    bl EmitSpriteInvisibility\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    b _08021DFA\n    .align 2, 0\n_08021D04: .4byte gStatuses3\n_08021D08: .4byte gBankAttacker\n_08021D0C: .4byte 0x000400c0\n_08021D10: .4byte gHitMarker\n_08021D14: .4byte gActiveBank\n_08021D18:\n    ldr r0, _08021D88 @ =gBattleMoveFlags\n    ldrb r1, [r0]\n    movs r0, 0x29\n    ands r0, r1\n    cmp r0, 0\n    bne _08021D44\n    ldr r1, _08021D8C @ =gStatuses3\n    ldr r0, _08021D90 @ =gBankAttacker\n    ldrb r2, [r0]\n    lsls r0, r2, 2\n    adds r0, r1\n    ldr r0, [r0]\n    ldr r1, _08021D94 @ =0x000400c0\n    ands r0, r1\n    cmp r0, 0\n    beq _08021D44\n    adds r0, r2, 0\n    bl sub_8015660\n    lsls r0, 24\n    cmp r0, 0\n    beq _08021D7E\n_08021D44:\n    ldr r4, _08021D98 @ =gActiveBank\n    ldr r5, _08021D90 @ =gBankAttacker\n    ldrb r0, [r5]\n    strb r0, [r4]\n    movs r0, 0\n    movs r1, 0\n    bl EmitSpriteInvisibility\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    ldr r0, _08021D8C @ =gStatuses3\n    ldrb r2, [r5]\n    lsls r2, 2\n    adds r2, r0\n    ldr r0, [r2]\n    ldr r1, _08021D9C @ =0xfffbff3f\n    ands r0, r1\n    str r0, [r2]\n    ldr r2, _08021DA0 @ =gSpecialStatuses\n    ldrb r1, [r5]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r2\n    ldrb r1, [r0]\n    movs r2, 0x4\n    orrs r1, r2\n    strb r1, [r0]\n_08021D7E:\n    ldr r2, _08021DA4 @ =gSharedMem\n    ldr r4, _08021DA8 @ =0x0001600c\n    adds r1, r2, r4\n    b _08021E00\n    .align 2, 0\n_08021D88: .4byte gBattleMoveFlags\n_08021D8C: .4byte gStatuses3\n_08021D90: .4byte gBankAttacker\n_08021D94: .4byte 0x000400c0\n_08021D98: .4byte gActiveBank\n_08021D9C: .4byte 0xfffbff3f\n_08021DA0: .4byte gSpecialStatuses\n_08021DA4: .4byte gSharedMem\n_08021DA8: .4byte 0x0001600c\n_08021DAC:\n    ldr r2, _08021E0C @ =gSpecialStatuses\n    ldr r1, _08021E10 @ =gBankTarget\n    ldrb r3, [r1]\n    lsls r4, r3, 2\n    adds r0, r4, r3\n    lsls r0, 2\n    adds r0, r2\n    ldrb r0, [r0]\n    lsls r0, 29\n    cmp r0, 0\n    blt _08021DFA\n    ldr r0, _08021E14 @ =gNoOfAllBanks\n    ldrb r0, [r0]\n    cmp r3, r0\n    bcs _08021DFA\n    ldr r5, _08021E18 @ =gStatuses3\n    adds r0, r4, r5\n    ldr r0, [r0]\n    ldr r1, _08021E1C @ =0x000400c0\n    ands r0, r1\n    cmp r0, 0\n    bne _08021DFA\n    ldr r4, _08021E20 @ =gActiveBank\n    strb r3, [r4]\n    movs r0, 0\n    movs r1, 0\n    bl EmitSpriteInvisibility\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    ldr r0, _08021E10 @ =gBankTarget\n    ldrb r2, [r0]\n    lsls r2, 2\n    adds r2, r5\n    ldr r0, [r2]\n    ldr r1, _08021E24 @ =0xfffbff3f\n    ands r0, r1\n    str r0, [r2]\n_08021DFA:\n    ldr r2, _08021E28 @ =gSharedMem\n    ldr r3, _08021E2C @ =0x0001600c\n    adds r1, r2, r3\n_08021E00:\n    ldrb r0, [r1]\n    adds r0, 0x1\n    strb r0, [r1]\n    mov r12, r2\n    b _0802224E\n    .align 2, 0\n_08021E0C: .4byte gSpecialStatuses\n_08021E10: .4byte gBankTarget\n_08021E14: .4byte gNoOfAllBanks\n_08021E18: .4byte gStatuses3\n_08021E1C: .4byte 0x000400c0\n_08021E20: .4byte gActiveBank\n_08021E24: .4byte 0xfffbff3f\n_08021E28: .4byte gSharedMem\n_08021E2C: .4byte 0x0001600c\n_08021E30:\n    movs r4, 0\n    ldr r0, _08021E60 @ =gNoOfAllBanks\n    ldrb r5, [r0]\n    cmp r4, r5\n    blt _08021E3C\n    b _08022244\n_08021E3C:\n    ldr r2, _08021E64 @ =gDisableStructs\n    ldr r5, _08021E68 @ =0xfeffffff\n    adds r3, r0, 0\n    ldr r1, _08021E6C @ =gUnknown_02024AD0\n_08021E44:\n    ldrb r0, [r2, 0xA]\n    cmp r0, 0\n    bne _08021E50\n    ldr r0, [r1]\n    ands r0, r5\n    str r0, [r1]\n_08021E50:\n    adds r2, 0x1C\n    adds r1, 0x58\n    adds r4, 0x1\n    ldrb r0, [r3]\n    cmp r4, r0\n    blt _08021E44\n    b _08022244\n    .align 2, 0\n_08021E60: .4byte gNoOfAllBanks\n_08021E64: .4byte gDisableStructs\n_08021E68: .4byte 0xfeffffff\n_08021E6C: .4byte gUnknown_02024AD0\n_08021E70:\n    ldr r1, _08021F2C @ =gHitMarker\n    ldr r3, [r1]\n    movs r0, 0x80\n    lsls r0, 5\n    ands r0, r3\n    ldr r2, _08021F30 @ =gBankAttacker\n    mov r9, r2\n    adds r5, r1, 0\n    cmp r0, 0\n    beq _08021E9A\n    ldr r0, _08021F34 @ =gActiveBank\n    ldrb r2, [r2]\n    strb r2, [r0]\n    ldr r1, _08021F38 @ =gBankTarget\n    ldrb r0, [r1]\n    mov r4, r9\n    strb r0, [r4]\n    strb r2, [r1]\n    ldr r0, _08021F3C @ =0xffffefff\n    ands r3, r0\n    str r3, [r5]\n_08021E9A:\n    ldr r1, _08021F40 @ =gBattleMoves\n    ldr r2, _08021F44 @ =gUnknown_02024BE8\n    ldrh r3, [r2]\n    lsls r0, r3, 1\n    adds r0, r3\n    lsls r0, 2\n    adds r0, r1\n    ldrb r0, [r0]\n    mov r8, r1\n    adds r7, r2, 0\n    cmp r0, 0x7F\n    bne _08021EBE\n    ldr r0, _08021F48 @ =gBattleMoveFlags\n    ldrb r1, [r0]\n    movs r0, 0x29\n    ands r0, r1\n    cmp r0, 0\n    beq _08021ECA\n_08021EBE:\n    ldr r1, _08021F4C @ =gUnknown_02024C2C\n    mov r2, r9\n    ldrb r0, [r2]\n    lsls r0, 1\n    adds r0, r1\n    strh r3, [r0]\n_08021ECA:\n    ldr r0, _08021F50 @ =gAbsentBankFlags\n    ldrb r1, [r0]\n    ldr r2, _08021F54 @ =gBitTable\n    mov r3, r9\n    ldrb r4, [r3]\n    lsls r0, r4, 2\n    adds r0, r2\n    ldr r3, [r0]\n    ands r1, r3\n    adds r6, r2, 0\n    cmp r1, 0\n    beq _08021EE4\n    b _08022244\n_08021EE4:\n    ldr r0, _08021F58 @ =0x000160a6\n    add r0, r12\n    ldrb r0, [r0]\n    ands r0, r3\n    cmp r0, 0\n    beq _08021EF2\n    b _08022244\n_08021EF2:\n    ldrh r2, [r7]\n    lsls r0, r2, 1\n    adds r0, r2\n    lsls r0, 2\n    add r0, r8\n    ldrb r0, [r0]\n    cmp r0, 0x7F\n    bne _08021F04\n    b _08022244\n_08021F04:\n    ldr r0, [r5]\n    movs r1, 0x80\n    lsls r1, 18\n    ands r0, r1\n    cmp r0, 0\n    beq _08021F68\n    ldr r1, _08021F5C @ =gLastUsedMove\n    lsls r0, r4, 1\n    adds r0, r1\n    strh r2, [r0]\n    ldr r0, _08021F60 @ =gUnknown_02024C4C\n    mov r4, r9\n    ldrb r1, [r4]\n    lsls r1, 1\n    adds r1, r0\n    ldr r0, _08021F64 @ =gCurrentMove\n    ldrh r0, [r0]\n    strh r0, [r1]\n    b _08021F82\n    .align 2, 0\n_08021F2C: .4byte gHitMarker\n_08021F30: .4byte gBankAttacker\n_08021F34: .4byte gActiveBank\n_08021F38: .4byte gBankTarget\n_08021F3C: .4byte 0xffffefff\n_08021F40: .4byte gBattleMoves\n_08021F44: .4byte gUnknown_02024BE8\n_08021F48: .4byte gBattleMoveFlags\n_08021F4C: .4byte gUnknown_02024C2C\n_08021F50: .4byte gAbsentBankFlags\n_08021F54: .4byte gBitTable\n_08021F58: .4byte 0x000160a6\n_08021F5C: .4byte gLastUsedMove\n_08021F60: .4byte gUnknown_02024C4C\n_08021F64: .4byte gCurrentMove\n_08021F68:\n    ldr r1, _08021FD0 @ =gLastUsedMove\n    lsls r0, r4, 1\n    adds r0, r1\n    ldr r1, _08021FD4 @ =0x0000ffff\n    strh r1, [r0]\n    ldr r1, _08021FD8 @ =gUnknown_02024C4C\n    mov r2, r9\n    ldrb r0, [r2]\n    lsls r0, 1\n    adds r0, r1\n    movs r1, 0x1\n    negs r1, r1\n    strh r1, [r0]\n_08021F82:\n    ldr r2, _08021FDC @ =gBankTarget\n    ldrb r3, [r2]\n    lsls r0, r3, 2\n    adds r0, r6\n    ldr r0, [r0]\n    lsls r0, 28\n    ldr r1, [r5]\n    ands r1, r0\n    cmp r1, 0\n    bne _08021FA0\n    ldr r0, _08021FE0 @ =gUnknown_02024C5C\n    adds r0, r3, r0\n    mov r3, r9\n    ldrb r1, [r3]\n    strb r1, [r0]\n_08021FA0:\n    ldr r0, [r5]\n    movs r1, 0x80\n    lsls r1, 18\n    ands r0, r1\n    cmp r0, 0\n    beq _0802204C\n    ldr r0, _08021FE4 @ =gBattleMoveFlags\n    ldrb r1, [r0]\n    movs r0, 0x29\n    ands r0, r1\n    cmp r0, 0\n    bne _0802204C\n    ldrh r2, [r7]\n    ldr r0, _08021FD4 @ =0x0000ffff\n    cmp r2, r0\n    bne _08021FEC\n    ldr r1, _08021FE8 @ =gMoveHitWith\n    ldr r4, _08021FDC @ =gBankTarget\n    ldrb r0, [r4]\n    lsls r0, 1\n    adds r0, r1\n    strh r2, [r0]\n    b _08022244\n    .align 2, 0\n_08021FD0: .4byte gLastUsedMove\n_08021FD4: .4byte 0x0000ffff\n_08021FD8: .4byte gUnknown_02024C4C\n_08021FDC: .4byte gBankTarget\n_08021FE0: .4byte gUnknown_02024C5C\n_08021FE4: .4byte gBattleMoveFlags\n_08021FE8: .4byte gMoveHitWith\n_08021FEC:\n    ldr r0, _08022014 @ =gMoveHitWith\n    ldr r5, _08022018 @ =gBankTarget\n    ldrb r1, [r5]\n    lsls r1, 1\n    adds r1, r0\n    ldr r4, _0802201C @ =gCurrentMove\n    ldrh r0, [r4]\n    strh r0, [r1]\n    ldr r0, _08022020 @ =0x0001601c\n    add r0, r12\n    ldrb r3, [r0]\n    cmp r3, 0\n    beq _08022028\n    ldr r0, _08022024 @ =gUnknown_02024C44\n    ldrb r1, [r5]\n    lsls r1, 1\n    adds r1, r0\n    movs r0, 0x3F\n    ands r0, r3\n    b _08021C22\n    .align 2, 0\n_08022014: .4byte gMoveHitWith\n_08022018: .4byte gBankTarget\n_0802201C: .4byte gCurrentMove\n_08022020: .4byte 0x0001601c\n_08022024: .4byte gUnknown_02024C44\n_08022028:\n    ldr r0, _08022044 @ =gUnknown_02024C44\n    ldr r1, _08022048 @ =gBankTarget\n    ldrb r2, [r1]\n    lsls r2, 1\n    adds r2, r0\n    ldrh r1, [r4]\n    lsls r0, r1, 1\n    adds r0, r1\n    lsls r0, 2\n    add r0, r8\n    ldrb r0, [r0, 0x2]\n    strh r0, [r2]\n    b _08022244\n    .align 2, 0\n_08022044: .4byte gUnknown_02024C44\n_08022048: .4byte gBankTarget\n_0802204C:\n    ldr r0, _0802205C @ =gMoveHitWith\n    ldr r2, _08022060 @ =gBankTarget\n    ldrb r1, [r2]\n    lsls r1, 1\n    adds r1, r0\n    ldr r0, _08022064 @ =0x0000ffff\n    b _08021C22\n    .align 2, 0\n_0802205C: .4byte gMoveHitWith\n_08022060: .4byte gBankTarget\n_08022064: .4byte 0x0000ffff\n_08022068:\n    ldr r0, _0802212C @ =gAbsentBankFlags\n    ldrb r1, [r0]\n    ldr r6, _08022130 @ =gBitTable\n    ldr r2, _08022134 @ =gBankAttacker\n    ldrb r5, [r2]\n    lsls r0, r5, 2\n    adds r0, r6\n    ldr r4, [r0]\n    ands r1, r4\n    mov r9, r2\n    cmp r1, 0\n    beq _08022082\n    b _08022244\n_08022082:\n    ldr r0, _08022138 @ =0x000160a6\n    add r0, r12\n    ldrb r0, [r0]\n    ands r0, r4\n    cmp r0, 0\n    beq _08022090\n    b _08022244\n_08022090:\n    ldr r1, _0802213C @ =gBattleMoves\n    ldr r4, _08022140 @ =gUnknown_02024BE8\n    ldrh r3, [r4]\n    lsls r0, r3, 1\n    adds r0, r3\n    lsls r0, 2\n    adds r0, r1\n    ldrb r1, [r0, 0x8]\n    movs r0, 0x10\n    ands r0, r1\n    cmp r0, 0\n    beq _0802215C\n    ldr r0, _08022144 @ =gHitMarker\n    ldr r1, [r0]\n    movs r0, 0x80\n    lsls r0, 18\n    ands r0, r1\n    cmp r0, 0\n    beq _0802215C\n    ldr r2, _08022148 @ =gBankTarget\n    ldrb r0, [r2]\n    cmp r5, r0\n    bne _080220C0\n    b _08022244\n_080220C0:\n    adds r2, r0, 0\n    lsls r0, r2, 2\n    adds r0, r6\n    ldr r0, [r0]\n    lsls r0, 28\n    ands r1, r0\n    cmp r1, 0\n    bne _0802215C\n    ldr r0, _0802214C @ =gBattleMoveFlags\n    ldrb r1, [r0]\n    movs r0, 0x29\n    ands r0, r1\n    cmp r0, 0\n    bne _0802215C\n    lsls r0, r2, 1\n    ldr r5, _08022150 @ =0x000160ac\n    adds r0, r5\n    add r0, r12\n    strb r3, [r0]\n    ldr r0, _08022148 @ =gBankTarget\n    ldrb r1, [r0]\n    lsls r1, 1\n    ldr r2, _08022154 @ =0x000160ad\n    adds r1, r2\n    add r1, r12\n    ldrh r0, [r4]\n    lsrs r0, 8\n    strb r0, [r1]\n    ldr r3, _08022148 @ =gBankTarget\n    ldrb r2, [r3]\n    lsls r2, 2\n    mov r5, r9\n    ldrb r0, [r5]\n    lsrs r0, 1\n    lsls r0, 1\n    ldr r1, _08022158 @ =0x00016100\n    adds r0, r1\n    adds r2, r0\n    add r2, r12\n    ldrh r0, [r4]\n    strb r0, [r2]\n    ldrb r2, [r3]\n    lsls r2, 2\n    ldrb r0, [r5]\n    lsrs r0, 1\n    lsls r0, 1\n    adds r1, 0x1\n    adds r0, r1\n    adds r2, r0\n    add r2, r12\n    ldrh r0, [r4]\n    lsrs r0, 8\n    strb r0, [r2]\n    b _08022244\n    .align 2, 0\n_0802212C: .4byte gAbsentBankFlags\n_08022130: .4byte gBitTable\n_08022134: .4byte gBankAttacker\n_08022138: .4byte 0x000160a6\n_0802213C: .4byte gBattleMoves\n_08022140: .4byte gUnknown_02024BE8\n_08022144: .4byte gHitMarker\n_08022148: .4byte gBankTarget\n_0802214C: .4byte gBattleMoveFlags\n_08022150: .4byte 0x000160ac\n_08022154: .4byte 0x000160ad\n_08022158: .4byte 0x00016100\n_0802215C:\n    mov r1, r9\n    ldrb r0, [r1]\n    ldr r2, _080221B4 @ =gBankTarget\n    ldrb r2, [r2]\n    cmp r0, r2\n    beq _08022244\n    ldr r3, _080221B4 @ =gBankTarget\n    ldrb r0, [r3]\n    lsls r0, 1\n    ldr r4, _080221B8 @ =0x000160ac\n    adds r0, r4\n    add r0, r12\n    movs r3, 0\n    strb r3, [r0]\n    ldr r5, _080221B4 @ =gBankTarget\n    ldrb r0, [r5]\n    lsls r0, 1\n    ldr r1, _080221BC @ =0x000160ad\n    adds r0, r1\n    add r0, r12\n    strb r3, [r0]\n    ldrb r2, [r5]\n    lsls r2, 2\n    mov r4, r9\n    ldrb r0, [r4]\n    lsrs r0, 1\n    lsls r0, 1\n    adds r1, 0x53\n    adds r0, r1\n    adds r2, r0\n    add r2, r12\n    strb r3, [r2]\n    ldrb r2, [r5]\n    lsls r2, 2\n    ldrb r0, [r4]\n    lsrs r0, 1\n    lsls r0, 1\n    adds r1, 0x1\n    adds r0, r1\n    adds r2, r0\n    add r2, r12\n    strb r3, [r2]\n    b _08022244\n    .align 2, 0\n_080221B4: .4byte gBankTarget\n_080221B8: .4byte 0x000160ac\n_080221BC: .4byte 0x000160ad\n_080221C0:\n    ldr r5, _080222B0 @ =gHitMarker\n    ldr r2, [r5]\n    movs r0, 0x80\n    lsls r0, 12\n    ands r0, r2\n    cmp r0, 0\n    bne _08022244\n    ldr r0, _080222B4 @ =gBattleTypeFlags\n    ldrh r1, [r0]\n    movs r0, 0x1\n    ands r0, r1\n    cmp r0, 0\n    beq _08022244\n    ldr r1, _080222B8 @ =gProtectStructs\n    ldr r0, _080222BC @ =gBankAttacker\n    ldrb r0, [r0]\n    lsls r0, 4\n    adds r0, r1\n    ldrb r0, [r0, 0x1]\n    lsls r0, 29\n    cmp r0, 0\n    blt _08022244\n    ldr r0, _080222C0 @ =gBattleMoves\n    mov r9, r0\n    ldr r1, _080222C4 @ =gCurrentMove\n    mov r8, r1\n    ldrh r0, [r1]\n    lsls r1, r0, 1\n    adds r1, r0\n    lsls r1, 2\n    add r1, r9\n    ldrb r0, [r1, 0x6]\n    cmp r0, 0x8\n    bne _08022244\n    movs r6, 0x80\n    lsls r6, 2\n    adds r4, r6, 0\n    ands r4, r2\n    cmp r4, 0\n    bne _08022244\n    ldr r7, _080222C8 @ =gBankTarget\n    ldrb r0, [r7]\n    bl GetBankIdentity\n    movs r1, 0x2\n    eors r0, r1\n    lsls r0, 24\n    lsrs r0, 24\n    bl GetBankByPlayerAI\n    lsls r0, 24\n    lsrs r2, r0, 24\n    ldr r1, _080222CC @ =gBattleMons\n    movs r0, 0x58\n    muls r0, r2\n    adds r0, r1\n    ldrh r0, [r0, 0x28]\n    cmp r0, 0\n    beq _0802223A\n    bl _08021874\n_0802223A:\n    ldr r0, [r5]\n    orrs r0, r6\n    str r0, [r5]\n    ldr r2, _080222D0 @ =gSharedMem\n    mov r12, r2\n_08022244:\n    ldr r1, _080222D4 @ =0x0001600c\n    add r1, r12\n    ldrb r0, [r1]\n    adds r0, 0x1\n    strb r0, [r1]\n_0802224E:\n    ldr r3, [sp, 0x10]\n    cmp r3, 0x1\n    bne _08022262\n    mov r4, r10\n    cmp r4, 0\n    bne _08022262\n    ldr r1, _080222D4 @ =0x0001600c\n    add r1, r12\n    movs r0, 0x11\n    strb r0, [r1]\n_08022262:\n    ldr r5, [sp, 0x10]\n    cmp r5, 0x2\n    bne _08022278\n    ldr r1, _080222D4 @ =0x0001600c\n    add r1, r12\n    ldr r0, [sp, 0x14]\n    ldrb r2, [r1]\n    cmp r0, r2\n    bne _08022278\n    movs r0, 0x11\n    strb r0, [r1]\n_08022278:\n    ldr r0, _080222D4 @ =0x0001600c\n    add r0, r12\n    ldrb r0, [r0]\n    cmp r0, 0x11\n    beq _08022286\n    bl _080218E4\n_08022286:\n    ldr r0, _080222D4 @ =0x0001600c\n    add r0, r12\n    ldrb r0, [r0]\n    cmp r0, 0x11\n    bne _0802229E\n    mov r3, r10\n    cmp r3, 0\n    bne _0802229E\n    ldr r1, _080222D8 @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x3\n_0802229C:\n    str r0, [r1]\n_0802229E:\n    add sp, 0x18\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_080222B0: .4byte gHitMarker\n_080222B4: .4byte gBattleTypeFlags\n_080222B8: .4byte gProtectStructs\n_080222BC: .4byte gBankAttacker\n_080222C0: .4byte gBattleMoves\n_080222C4: .4byte gCurrentMove\n_080222C8: .4byte gBankTarget\n_080222CC: .4byte gBattleMons\n_080222D0: .4byte gSharedMem\n_080222D4: .4byte 0x0001600c\n_080222D8: .4byte gBattlescriptCurrInstr\n        .syntax divided"
# 9246 "src/battle/battle_4.c"
                );
}


static void atk4A_typecalc2(void)
{
    u8 flags = 0;
    int i = 0;
    u8 move_type = gBattleMoves[gCurrentMove].type;

    if (gBattleMons[gBankTarget].ability == ABILITY_LEVITATE && move_type == 0x04)
    {
        gLastUsedAbility = gBattleMons[gBankTarget].ability;
        gBattleMoveFlags |= ((1 << 0) | (1 << 3));
        gMoveHitWith[gBankTarget] = 0;
        gBattleCommunication[6] = move_type;
        RecordAbilityBattle(gBankTarget, gLastUsedAbility);
    }
    else
    {
        while (gTypeEffectiveness[i]!= 0xFF)
        {
            if (gTypeEffectiveness[i] == 0xFE)
            {
                if (gBattleMons[gBankTarget].status2 & 0x20000000) {break;}
                else {i += 3; continue;}
            }

            if (gTypeEffectiveness[i] == move_type)
            {

                if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type1)
                {
                    if (gTypeEffectiveness[i + 2] == 0)
                    {
                        gBattleMoveFlags |= (1 << 3);
                        break;
                    }
                    if (gTypeEffectiveness[i + 2] == 5)
                        flags |= (1 << 2);
                    if (gTypeEffectiveness[i + 2] == 20)
                        flags |= (1 << 1);
                }

                if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type2)
                {
                    if (gBattleMons[gBankTarget].type1 != gBattleMons[gBankTarget].type2
                        && gTypeEffectiveness[i + 2] == 0)
                    {
                        gBattleMoveFlags |= (1 << 3);
                        break;
                    }
                    if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type2 && gBattleMons[gBankTarget].type1 != gBattleMons[gBankTarget].type2 && gTypeEffectiveness[i + 2] == 5)
                        flags |= (1 << 2);
                    if (gTypeEffectiveness[i + 1] == gBattleMons[gBankTarget].type2
                        && gBattleMons[gBankTarget].type1 != gBattleMons[gBankTarget].type2 && gTypeEffectiveness[i + 2] == 20)
                            flags |= (1 << 1);
                }
            }
            i += 3;
        }
    }

    if (gBattleMons[gBankTarget].ability == ABILITY_WONDER_GUARD && !(flags & (((1 << 0) | (1 << 3) | (1 << 5)))) && AttacksThisTurn(gBankAttacker, gCurrentMove) == 2 &&
        (!(flags & (1 << 1)) || ((flags & ((1 << 1) | (1 << 2))) == ((1 << 1) | (1 << 2)))) &&
        gBattleMoves[gCurrentMove].power)
    {
        gLastUsedAbility = ABILITY_WONDER_GUARD;
        gBattleMoveFlags |= (1 << 0);
        gMoveHitWith[gBankTarget] = 0;
        gBattleCommunication[6] = 3;
        RecordAbilityBattle(gBankTarget, gLastUsedAbility);
    }
    if (gBattleMoveFlags & (1 << 3))
        gProtectStructs[gBankAttacker].notEffective = 1;

    gBattlescriptCurrInstr++;
}

static void atk4B_return_atk_to_ball(void)
{
    gActiveBank = gBankAttacker;
    if (!(gHitMarker & ((gBitTable[gActiveBank] << 0x1C))))
    {
        EmitReturnPokeToBall(0, 0);
        MarkBufferBankForExecution(gActiveBank);
    }
    gBattlescriptCurrInstr++;
}

static void atk4C_copy_poke_data(void)
{
    if (gBattleExecBuffer)
        return;

    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));

    gBattlePartyID[gActiveBank] = (gSharedMem[0x16068 + gActiveBank]);

    EmitGetAttributes(0, 0, gBitTable[gBattlePartyID[gActiveBank]]);
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 2;
}

static inline u8 get_knocked_off_byte(u8 bank)
{
    register u32 side asm("r2") = GetBankSide(bank);
    register struct WishFutureKnock* dummy = &gWishFutureKnock;
    register u8* aa = ((u8*)((u8*)(dummy)));
    register u8* bb = aa + 0x29;
    register u8* cc asm("r0") = side + bb;
    return *cc;
}

static void atk4D_switch_data_update(void)
{
    struct BattlePokemon OldData;
    int i;
    u8 *monData;
    if (gBattleExecBuffer)
        return;

    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    OldData = gBattleMons[gActiveBank];
    monData = (u8*)(&gBattleMons[gActiveBank]);
    for (i = 0; i < sizeof(struct BattlePokemon); i++)
    {
        monData[i] = gBattleBufferB[gActiveBank][4 + i];
    }

    gBattleMons[gActiveBank].type1 = gBaseStats[gBattleMons[gActiveBank].species].type1;
    gBattleMons[gActiveBank].type2 = gBaseStats[gBattleMons[gActiveBank].species].type2;
    gBattleMons[gActiveBank].ability = GetAbilityBySpecies(gBattleMons[gActiveBank].species, gBattleMons[gActiveBank].altAbility);

    if (get_knocked_off_byte(gActiveBank) & gBitTable[gBattlePartyID[gActiveBank]])
    {
        gBattleMons[gActiveBank].item = 0;
    }

    if (gBattleMoves[gCurrentMove].effect == EFFECT_BATON_PASS)
    {
        for (i = 0; i < 8; i++)
        {
            gBattleMons[gActiveBank].statStages[i] = OldData.statStages[i];
        }
        gBattleMons[gActiveBank].status2 = OldData.status2;
    }
    SwitchInClearStructs();
    ((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive = gActiveBank;
    gBattleTextBuff1[0] = 0xFD;
    gBattleTextBuff1[1] = 7;
    gBattleTextBuff1[2] = gActiveBank;
    gBattleTextBuff1[3] = gBattlePartyID[gActiveBank];
    gBattleTextBuff1[4] = 0xFF;

    gBattlescriptCurrInstr += 2;
}

static void atk4E_switchin_anim(void)
{
    if (gBattleExecBuffer)
        return;

    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    if (GetBankSide(gActiveBank) == 1 && !(gBattleTypeFlags & (0x0002 | 0x0800 | 0x0100)))
    {
        GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gActiveBank].species), 2);
    }
    gAbsentBankFlags &= ~(gBitTable[gActiveBank]);
    EmitSendOutPoke(0, gBattlePartyID[gActiveBank], ((gBattlescriptCurrInstr + 2)[0]));
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 3;
}

static void atk4F_jump_if_cannot_switch(void)
{
    int val, to_cmp;
    register struct Pokemon *party;
    u8 r7;

    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]) & 0x7F);
    if (!(((gBattlescriptCurrInstr + 1)[0]) & 0x80)
        && ((gBattleMons[gActiveBank].status2 & (0x0000E000 | 0x04000000))
            || (gStatuses3[gActiveBank] & 0x400)))
    {
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 2)[0] | ((gBattlescriptCurrInstr + 2)[1] << 8) | ((gBattlescriptCurrInstr + 2)[2] << 16) | ((gBattlescriptCurrInstr + 2)[3] << 24));
        return;
    }
    if (gBattleTypeFlags & 0x0040)
    {
        if (GetBankSide(gActiveBank) == 1)
            party = gEnemyParty;
        else
            party = gPlayerParty;
        val = 0;
        if (sub_803FBFC(sub_803FC34(gActiveBank)) == 1)
            val = 3;
        for (to_cmp = val + 3; val < to_cmp; val++)
        {
            if (GetMonData(&party[val], 11) != SPECIES_NONE
             && !GetMonData(&party[val], 45)
             && GetMonData(&party[val], 57) != 0
             && gBattlePartyID[gActiveBank] != val)
                break;
        }
        if (val == to_cmp)
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 2)[0] | ((gBattlescriptCurrInstr + 2)[1] << 8) | ((gBattlescriptCurrInstr + 2)[2] << 16) | ((gBattlescriptCurrInstr + 2)[3] << 24));
        else
            gBattlescriptCurrInstr += 6;
    }
    else
    {
        if (GetBankSide(gActiveBank) == 1)
        {
            r7 = GetBankByPlayerAI(1);
            if (gBattleTypeFlags & 0x0001)
                to_cmp = GetBankByPlayerAI(3);
            else
                to_cmp = r7;
            party = gEnemyParty;
        }
        else
        {
            r7 = GetBankByPlayerAI(0);
            if (gBattleTypeFlags & 0x0001)
                to_cmp = GetBankByPlayerAI(2);
            else
                to_cmp = r7;
            party = gPlayerParty;
        }
        for (val = 0; val < 6; val++)
        {
            if (GetMonData(&party[val], 57) != 0
             && GetMonData(&party[val], 11) != SPECIES_NONE
             && !GetMonData(&party[val], 45)
             && val != gBattlePartyID[r7] && val != gBattlePartyID[to_cmp])
                break;
        }
        if (val == 6)
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 2)[0] | ((gBattlescriptCurrInstr + 2)[1] << 8) | ((gBattlescriptCurrInstr + 2)[2] << 16) | ((gBattlescriptCurrInstr + 2)[3] << 24));
        else
            gBattlescriptCurrInstr += 6;
    }
}

void sub_8022A3C(u8 unkown)
{
    (gSharedMem[0x16064 + gActiveBank]) = gBattlePartyID[gActiveBank];
    EmitChoosePokemon(0, 1, unkown, 0, ((struct BattleStruct *) (gSharedMem + 0x0))->unk1606C[gActiveBank]);
    MarkBufferBankForExecution(gActiveBank);
}
# 9551 "src/battle/battle_4.c"
__attribute__((naked))
static void atk50_openpartyscreen(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r9\n    mov r6, r8\n    push {r6,r7}\n    sub sp, 0x4\n    movs r7, 0\n    movs r0, 0\n    mov r9, r0\n    ldr r6, _08022B44 @ =gBattlescriptCurrInstr\n    ldr r1, [r6]\n    ldrb r2, [r1, 0x2]\n    ldrb r0, [r1, 0x3]\n    lsls r0, 8\n    orrs r2, r0\n    ldrb r0, [r1, 0x4]\n    lsls r0, 16\n    orrs r2, r0\n    ldrb r0, [r1, 0x5]\n    lsls r0, 24\n    orrs r2, r0\n    mov r8, r2\n    ldrb r2, [r1, 0x1]\n    adds r0, r2, 0\n    mov r12, r6\n    cmp r0, 0x5\n    beq _08022ACE\n    b _08022F74\n_08022ACE:\n    ldr r0, _08022B48 @ =gBattleTypeFlags\n    ldrh r0, [r0]\n    movs r1, 0x41\n    ands r1, r0\n    cmp r1, 0x1\n    beq _08022BBC\n    ldr r1, _08022B4C @ =gActiveBank\n    strb r7, [r1]\n    ldr r0, _08022B50 @ =gNoOfAllBanks\n    ldrb r0, [r0]\n    cmp r7, r0\n    bcc _08022AE8\n    b _08022F62\n_08022AE8:\n    ldr r7, _08022B54 @ =gHitMarker\n    ldr r6, _08022B58 @ =gBitTable\n    adds r4, r1, 0\n    ldr r0, _08022B5C @ =gAbsentBankFlags\n    mov r8, r0\n_08022AF2:\n    ldrb r2, [r4]\n    lsls r0, r2, 2\n    adds r0, r6\n    ldr r1, [r0]\n    lsls r1, 28\n    ldr r0, [r7]\n    ands r0, r1\n    cmp r0, 0\n    beq _08022B94\n    adds r0, r2, 0\n    movs r1, 0x6\n    movs r2, 0x6\n    bl sub_8018018\n    lsls r0, 24\n    cmp r0, 0\n    beq _08022B60\n    ldrb r0, [r4]\n    lsls r0, 2\n    adds r0, r6\n    ldr r0, [r0]\n    mov r2, r8\n    ldrb r1, [r2]\n    orrs r0, r1\n    strb r0, [r2]\n    ldrb r0, [r4]\n    lsls r0, 2\n    adds r0, r6\n    ldr r1, [r0]\n    lsls r1, 28\n    ldr r0, [r7]\n    bics r0, r1\n    str r0, [r7]\n    movs r0, 0\n    movs r1, 0x2\n    bl EmitLinkStandbyMsg\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    b _08022BA2\n    .align 2, 0\n_08022B44: .4byte gBattlescriptCurrInstr\n_08022B48: .4byte gBattleTypeFlags\n_08022B4C: .4byte gActiveBank\n_08022B50: .4byte gNoOfAllBanks\n_08022B54: .4byte gHitMarker\n_08022B58: .4byte gBitTable\n_08022B5C: .4byte gAbsentBankFlags\n_08022B60:\n    ldr r5, _08022B90 @ =gSpecialStatuses\n    ldrb r0, [r4]\n    lsls r1, r0, 2\n    adds r1, r0\n    lsls r1, 2\n    adds r1, r5\n    ldrb r0, [r1]\n    lsls r0, 25\n    cmp r0, 0\n    blt _08022BA2\n    movs r0, 0x6\n    bl sub_8022A3C\n    ldrb r1, [r4]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r5\n    ldrb r1, [r0]\n    movs r2, 0x40\n    orrs r1, r2\n    strb r1, [r0]\n    b _08022BA2\n    .align 2, 0\n_08022B90: .4byte gSpecialStatuses\n_08022B94:\n    movs r0, 0\n    movs r1, 0x2\n    bl EmitLinkStandbyMsg\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n_08022BA2:\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n    ldr r1, _08022BB8 @ =gNoOfAllBanks\n    lsls r0, 24\n    lsrs r0, 24\n    ldrb r1, [r1]\n    cmp r0, r1\n    bcc _08022AF2\n    b _08022F62\n    .align 2, 0\n_08022BB8: .4byte gNoOfAllBanks\n_08022BBC:\n    ands r1, r0\n    cmp r1, 0\n    bne _08022BC4\n    b _08022F62\n_08022BC4:\n    ldr r0, _08022C1C @ =gHitMarker\n    mov r8, r0\n    ldr r0, [r0]\n    lsrs r5, r0, 28\n    ldr r6, _08022C20 @ =gBitTable\n    ldr r0, [r6]\n    ands r0, r5\n    cmp r0, 0\n    beq _08022C7E\n    ldr r4, _08022C24 @ =gActiveBank\n    strb r7, [r4]\n    movs r0, 0\n    movs r1, 0x6\n    movs r2, 0x6\n    bl sub_8018018\n    lsls r0, 24\n    cmp r0, 0\n    beq _08022C2C\n    ldr r2, _08022C28 @ =gAbsentBankFlags\n    ldrb r0, [r4]\n    lsls r0, 2\n    adds r0, r6\n    ldr r0, [r0]\n    ldrb r1, [r2]\n    orrs r0, r1\n    strb r0, [r2]\n    ldrb r0, [r4]\n    lsls r0, 2\n    adds r0, r6\n    ldr r1, [r0]\n    lsls r1, 28\n    mov r2, r8\n    ldr r0, [r2]\n    bics r0, r1\n    str r0, [r2]\n    movs r0, 0\n    bl Emitcmd42\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    b _08022C7E\n    .align 2, 0\n_08022C1C: .4byte gHitMarker\n_08022C20: .4byte gBitTable\n_08022C24: .4byte gActiveBank\n_08022C28: .4byte gAbsentBankFlags\n_08022C2C:\n    ldr r6, _08022C60 @ =gSpecialStatuses\n    ldrb r0, [r4]\n    lsls r1, r0, 2\n    adds r1, r0\n    lsls r1, 2\n    adds r1, r6\n    ldrb r0, [r1]\n    lsls r0, 25\n    cmp r0, 0\n    blt _08022C6C\n    ldr r0, _08022C64 @ =gSharedMem\n    ldr r1, _08022C68 @ =0x0001606a\n    adds r0, r1\n    ldrb r0, [r0]\n    bl sub_8022A3C\n    ldrb r1, [r4]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r6\n    ldrb r1, [r0]\n    movs r2, 0x40\n    orrs r1, r2\n    strb r1, [r0]\n    b _08022C7E\n    .align 2, 0\n_08022C60: .4byte gSpecialStatuses\n_08022C64: .4byte gSharedMem\n_08022C68: .4byte 0x0001606a\n_08022C6C:\n    movs r0, 0\n    movs r1, 0x2\n    bl EmitLinkStandbyMsg\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    movs r2, 0x1\n    mov r9, r2\n_08022C7E:\n    ldr r6, _08022CD8 @ =gBitTable\n    ldr r0, [r6, 0x8]\n    ands r0, r5\n    cmp r0, 0\n    beq _08022D40\n    ldr r0, [r6]\n    ands r0, r5\n    cmp r0, 0\n    bne _08022D40\n    ldr r4, _08022CDC @ =gActiveBank\n    movs r0, 0x2\n    strb r0, [r4]\n    movs r0, 0x2\n    movs r1, 0x6\n    movs r2, 0x6\n    bl sub_8018018\n    lsls r0, 24\n    cmp r0, 0\n    beq _08022CE8\n    ldr r2, _08022CE0 @ =gAbsentBankFlags\n    ldrb r0, [r4]\n    lsls r0, 2\n    adds r0, r6\n    ldr r0, [r0]\n    ldrb r1, [r2]\n    orrs r0, r1\n    strb r0, [r2]\n    ldr r2, _08022CE4 @ =gHitMarker\n    ldrb r0, [r4]\n    lsls r0, 2\n    adds r0, r6\n    ldr r1, [r0]\n    lsls r1, 28\n    ldr r0, [r2]\n    bics r0, r1\n    str r0, [r2]\n    movs r0, 0\n    bl Emitcmd42\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    b _08022D40\n    .align 2, 0\n_08022CD8: .4byte gBitTable\n_08022CDC: .4byte gActiveBank\n_08022CE0: .4byte gAbsentBankFlags\n_08022CE4: .4byte gHitMarker\n_08022CE8:\n    ldr r6, _08022D1C @ =gSpecialStatuses\n    ldrb r0, [r4]\n    lsls r1, r0, 2\n    adds r1, r0\n    lsls r1, 2\n    adds r1, r6\n    ldrb r0, [r1]\n    lsls r0, 25\n    cmp r0, 0\n    blt _08022D28\n    ldr r0, _08022D20 @ =gSharedMem\n    ldr r1, _08022D24 @ =0x00016068\n    adds r0, r1\n    ldrb r0, [r0]\n    bl sub_8022A3C\n    ldrb r1, [r4]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r6\n    ldrb r1, [r0]\n    movs r2, 0x40\n    orrs r1, r2\n    strb r1, [r0]\n    b _08022D40\n    .align 2, 0\n_08022D1C: .4byte gSpecialStatuses\n_08022D20: .4byte gSharedMem\n_08022D24: .4byte 0x00016068\n_08022D28:\n    movs r0, 0x1\n    mov r2, r9\n    ands r0, r2\n    cmp r0, 0\n    bne _08022D40\n    movs r0, 0\n    movs r1, 0x2\n    bl EmitLinkStandbyMsg\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n_08022D40:\n    ldr r6, _08022D90 @ =gBitTable\n    ldr r0, [r6, 0x4]\n    ands r0, r5\n    cmp r0, 0\n    beq _08022DF6\n    ldr r4, _08022D94 @ =gActiveBank\n    movs r0, 0x1\n    strb r0, [r4]\n    movs r0, 0x1\n    movs r1, 0x6\n    movs r2, 0x6\n    bl sub_8018018\n    lsls r0, 24\n    cmp r0, 0\n    beq _08022DA0\n    ldr r2, _08022D98 @ =gAbsentBankFlags\n    ldrb r0, [r4]\n    lsls r0, 2\n    adds r0, r6\n    ldr r0, [r0]\n    ldrb r1, [r2]\n    orrs r0, r1\n    strb r0, [r2]\n    ldr r2, _08022D9C @ =gHitMarker\n    ldrb r0, [r4]\n    lsls r0, 2\n    adds r0, r6\n    ldr r1, [r0]\n    lsls r1, 28\n    ldr r0, [r2]\n    bics r0, r1\n    str r0, [r2]\n    movs r0, 0\n    bl Emitcmd42\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    b _08022DF6\n    .align 2, 0\n_08022D90: .4byte gBitTable\n_08022D94: .4byte gActiveBank\n_08022D98: .4byte gAbsentBankFlags\n_08022D9C: .4byte gHitMarker\n_08022DA0:\n    ldr r6, _08022DD4 @ =gSpecialStatuses\n    ldrb r0, [r4]\n    lsls r1, r0, 2\n    adds r1, r0\n    lsls r1, 2\n    adds r1, r6\n    ldrb r0, [r1]\n    lsls r0, 25\n    cmp r0, 0\n    blt _08022DE0\n    ldr r0, _08022DD8 @ =gSharedMem\n    ldr r1, _08022DDC @ =0x0001606b\n    adds r0, r1\n    ldrb r0, [r0]\n    bl sub_8022A3C\n    ldrb r1, [r4]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r6\n    ldrb r1, [r0]\n    movs r2, 0x40\n    orrs r1, r2\n    strb r1, [r0]\n    b _08022DF6\n    .align 2, 0\n_08022DD4: .4byte gSpecialStatuses\n_08022DD8: .4byte gSharedMem\n_08022DDC: .4byte 0x0001606b\n_08022DE0:\n    movs r0, 0\n    movs r1, 0x2\n    bl EmitLinkStandbyMsg\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    movs r0, 0x2\n    mov r2, r9\n    orrs r2, r0\n    mov r9, r2\n_08022DF6:\n    ldr r6, _08022E50 @ =gBitTable\n    ldr r0, [r6, 0xC]\n    ands r0, r5\n    cmp r0, 0\n    beq _08022EB8\n    ldr r0, [r6, 0x4]\n    ands r0, r5\n    cmp r0, 0\n    bne _08022EB8\n    ldr r4, _08022E54 @ =gActiveBank\n    movs r0, 0x3\n    strb r0, [r4]\n    movs r0, 0x3\n    movs r1, 0x6\n    movs r2, 0x6\n    bl sub_8018018\n    lsls r0, 24\n    cmp r0, 0\n    beq _08022E60\n    ldr r2, _08022E58 @ =gAbsentBankFlags\n    ldrb r0, [r4]\n    lsls r0, 2\n    adds r0, r6\n    ldr r0, [r0]\n    ldrb r1, [r2]\n    orrs r0, r1\n    strb r0, [r2]\n    ldr r2, _08022E5C @ =gHitMarker\n    ldrb r0, [r4]\n    lsls r0, 2\n    adds r0, r6\n    ldr r1, [r0]\n    lsls r1, 28\n    ldr r0, [r2]\n    bics r0, r1\n    str r0, [r2]\n    movs r0, 0\n    bl Emitcmd42\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    b _08022EB8\n    .align 2, 0\n_08022E50: .4byte gBitTable\n_08022E54: .4byte gActiveBank\n_08022E58: .4byte gAbsentBankFlags\n_08022E5C: .4byte gHitMarker\n_08022E60:\n    ldr r6, _08022E94 @ =gSpecialStatuses\n    ldrb r0, [r4]\n    lsls r1, r0, 2\n    adds r1, r0\n    lsls r1, 2\n    adds r1, r6\n    ldrb r0, [r1]\n    lsls r0, 25\n    cmp r0, 0\n    blt _08022EA0\n    ldr r0, _08022E98 @ =gSharedMem\n    ldr r1, _08022E9C @ =0x00016069\n    adds r0, r1\n    ldrb r0, [r0]\n    bl sub_8022A3C\n    ldrb r1, [r4]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r6\n    ldrb r1, [r0]\n    movs r2, 0x40\n    orrs r1, r2\n    strb r1, [r0]\n    b _08022EB8\n    .align 2, 0\n_08022E94: .4byte gSpecialStatuses\n_08022E98: .4byte gSharedMem\n_08022E9C: .4byte 0x00016069\n_08022EA0:\n    movs r0, 0x2\n    mov r2, r9\n    ands r2, r0\n    cmp r2, 0\n    bne _08022EB8\n    movs r0, 0\n    movs r1, 0x2\n    bl EmitLinkStandbyMsg\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n_08022EB8:\n    ldr r1, _08022EE8 @ =gSpecialStatuses\n    ldrb r0, [r1]\n    lsls r0, 25\n    cmp r0, 0\n    blt _08022F0C\n    adds r0, r1, 0\n    adds r0, 0x28\n    ldrb r0, [r0]\n    lsls r0, 25\n    cmp r0, 0\n    blt _08022F0C\n    cmp r5, 0\n    beq _08022F0C\n    ldr r0, _08022EEC @ =gAbsentBankFlags\n    ldrb r1, [r0]\n    ldr r0, _08022EF0 @ =gBitTable\n    ldr r0, [r0]\n    ands r1, r0\n    cmp r1, 0\n    beq _08022EF8\n    ldr r1, _08022EF4 @ =gActiveBank\n    movs r0, 0x2\n    strb r0, [r1]\n    b _08022EFC\n    .align 2, 0\n_08022EE8: .4byte gSpecialStatuses\n_08022EEC: .4byte gAbsentBankFlags\n_08022EF0: .4byte gBitTable\n_08022EF4: .4byte gActiveBank\n_08022EF8:\n    ldr r0, _08022F3C @ =gActiveBank\n    strb r1, [r0]\n_08022EFC:\n    movs r0, 0\n    movs r1, 0x2\n    bl EmitLinkStandbyMsg\n    ldr r0, _08022F3C @ =gActiveBank\n    ldrb r0, [r0]\n    bl MarkBufferBankForExecution\n_08022F0C:\n    ldr r1, _08022F40 @ =gSpecialStatuses\n    ldrb r0, [r1, 0x14]\n    lsls r0, 25\n    cmp r0, 0\n    blt _08022F62\n    adds r0, r1, 0\n    adds r0, 0x3C\n    ldrb r0, [r0]\n    lsls r0, 25\n    cmp r0, 0\n    blt _08022F62\n    cmp r5, 0\n    beq _08022F62\n    ldr r0, _08022F44 @ =gAbsentBankFlags\n    ldrb r0, [r0]\n    ldr r1, _08022F48 @ =gBitTable\n    ldr r1, [r1, 0x4]\n    ands r0, r1\n    cmp r0, 0\n    beq _08022F4C\n    ldr r1, _08022F3C @ =gActiveBank\n    movs r0, 0x3\n    b _08022F50\n    .align 2, 0\n_08022F3C: .4byte gActiveBank\n_08022F40: .4byte gSpecialStatuses\n_08022F44: .4byte gAbsentBankFlags\n_08022F48: .4byte gBitTable\n_08022F4C:\n    ldr r1, _08022F6C @ =gActiveBank\n    movs r0, 0x1\n_08022F50:\n    strb r0, [r1]\n    movs r0, 0\n    movs r1, 0x2\n    bl EmitLinkStandbyMsg\n    ldr r0, _08022F6C @ =gActiveBank\n    ldrb r0, [r0]\n    bl MarkBufferBankForExecution\n_08022F62:\n    ldr r1, _08022F70 @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x6\n    str r0, [r1]\n    b _08023302\n    .align 2, 0\n_08022F6C: .4byte gActiveBank\n_08022F70: .4byte gBattlescriptCurrInstr\n_08022F74:\n    cmp r0, 0x6\n    beq _08022F7A\n    b _08023170\n_08022F7A:\n    ldr r0, _08022FF0 @ =gBattleTypeFlags\n    ldrh r2, [r0]\n    movs r0, 0x40\n    ands r0, r2\n    cmp r0, 0\n    beq _08022F88\n    b _0802310C\n_08022F88:\n    movs r0, 0x1\n    ands r0, r2\n    cmp r0, 0\n    bne _08022F92\n    b _0802310C\n_08022F92:\n    ldr r7, _08022FF4 @ =gHitMarker\n    ldr r0, [r7]\n    lsrs r5, r0, 28\n    ldr r4, _08022FF8 @ =gBitTable\n    ldr r0, [r4, 0x8]\n    ands r0, r5\n    cmp r0, 0\n    beq _0802303A\n    ldr r0, [r4]\n    ands r0, r5\n    cmp r0, 0\n    beq _0802303A\n    ldr r6, _08022FFC @ =gActiveBank\n    movs r0, 0x2\n    strb r0, [r6]\n    ldr r0, _08023000 @ =gBattleBufferB\n    ldrb r1, [r0, 0x1]\n    movs r0, 0x2\n    movs r2, 0x6\n    bl sub_8018018\n    lsls r0, 24\n    cmp r0, 0\n    beq _08023008\n    ldr r2, _08023004 @ =gAbsentBankFlags\n    ldrb r0, [r6]\n    lsls r0, 2\n    adds r0, r4\n    ldr r0, [r0]\n    ldrb r1, [r2]\n    orrs r0, r1\n    strb r0, [r2]\n    ldrb r0, [r6]\n    lsls r0, 2\n    adds r0, r4\n    ldr r1, [r0]\n    lsls r1, 28\n    ldr r0, [r7]\n    bics r0, r1\n    str r0, [r7]\n    movs r0, 0\n    bl Emitcmd42\n    ldrb r0, [r6]\n    bl MarkBufferBankForExecution\n    b _0802303A\n    .align 2, 0\n_08022FF0: .4byte gBattleTypeFlags\n_08022FF4: .4byte gHitMarker\n_08022FF8: .4byte gBitTable\n_08022FFC: .4byte gActiveBank\n_08023000: .4byte gBattleBufferB\n_08023004: .4byte gAbsentBankFlags\n_08023008:\n    ldr r4, _08023098 @ =gSpecialStatuses\n    ldrb r0, [r6]\n    lsls r1, r0, 2\n    adds r1, r0\n    lsls r1, 2\n    adds r1, r4\n    ldrb r0, [r1]\n    lsls r0, 25\n    cmp r0, 0\n    blt _0802303A\n    ldr r0, _0802309C @ =gSharedMem\n    ldr r1, _080230A0 @ =0x00016068\n    adds r0, r1\n    ldrb r0, [r0]\n    bl sub_8022A3C\n    ldrb r1, [r6]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r4\n    ldrb r1, [r0]\n    movs r2, 0x40\n    orrs r1, r2\n    strb r1, [r0]\n_0802303A:\n    ldr r4, _080230A4 @ =gBitTable\n    ldr r0, [r4, 0xC]\n    ands r0, r5\n    cmp r0, 0\n    beq _080230EE\n    ldr r0, [r4, 0x4]\n    ands r5, r0\n    cmp r5, 0\n    beq _080230EE\n    ldr r5, _080230A8 @ =gActiveBank\n    movs r0, 0x3\n    strb r0, [r5]\n    ldr r0, _080230AC @ =gBattleBufferB\n    ldr r2, _080230B0 @ =0x00000201\n    adds r0, r2\n    ldrb r1, [r0]\n    movs r0, 0x3\n    movs r2, 0x6\n    bl sub_8018018\n    lsls r0, 24\n    cmp r0, 0\n    beq _080230BC\n    ldr r2, _080230B4 @ =gAbsentBankFlags\n    ldrb r0, [r5]\n    lsls r0, 2\n    adds r0, r4\n    ldr r0, [r0]\n    ldrb r1, [r2]\n    orrs r0, r1\n    strb r0, [r2]\n    ldr r2, _080230B8 @ =gHitMarker\n    ldrb r0, [r5]\n    lsls r0, 2\n    adds r0, r4\n    ldr r1, [r0]\n    lsls r1, 28\n    ldr r0, [r2]\n    bics r0, r1\n    str r0, [r2]\n    movs r0, 0\n    bl Emitcmd42\n    ldrb r0, [r5]\n    bl MarkBufferBankForExecution\n    b _080230EE\n    .align 2, 0\n_08023098: .4byte gSpecialStatuses\n_0802309C: .4byte gSharedMem\n_080230A0: .4byte 0x00016068\n_080230A4: .4byte gBitTable\n_080230A8: .4byte gActiveBank\n_080230AC: .4byte gBattleBufferB\n_080230B0: .4byte 0x00000201\n_080230B4: .4byte gAbsentBankFlags\n_080230B8: .4byte gHitMarker\n_080230BC:\n    ldr r4, _080230FC @ =gSpecialStatuses\n    ldrb r0, [r5]\n    lsls r1, r0, 2\n    adds r1, r0\n    lsls r1, 2\n    adds r1, r4\n    ldrb r0, [r1]\n    lsls r0, 25\n    cmp r0, 0\n    blt _080230EE\n    ldr r0, _08023100 @ =gSharedMem\n    ldr r1, _08023104 @ =0x00016069\n    adds r0, r1\n    ldrb r0, [r0]\n    bl sub_8022A3C\n    ldrb r1, [r5]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r4\n    ldrb r1, [r0]\n    movs r2, 0x40\n    orrs r1, r2\n    strb r1, [r0]\n_080230EE:\n    ldr r1, _08023108 @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x6\n    str r0, [r1]\n    mov r12, r1\n    b _08023110\n    .align 2, 0\n_080230FC: .4byte gSpecialStatuses\n_08023100: .4byte gSharedMem\n_08023104: .4byte 0x00016069\n_08023108: .4byte gBattlescriptCurrInstr\n_0802310C:\n    adds r0, r1, 0x6\n    str r0, [r6]\n_08023110:\n    ldr r0, _08023160 @ =gHitMarker\n    ldr r0, [r0]\n    lsrs r5, r0, 28\n    ldr r1, _08023164 @ =gBank1\n    movs r0, 0\n    strb r0, [r1]\n    ldr r4, _08023168 @ =gBitTable\n    ldr r2, [r4]\n    ands r2, r5\n    ldr r6, _0802316C @ =gNoOfAllBanks\n    cmp r2, 0\n    bne _0802314C\n    adds r7, r6, 0\n    ldrb r0, [r6]\n    cmp r2, r0\n    bcs _0802314C\n    adds r3, r1, 0\n_08023132:\n    ldrb r0, [r3]\n    adds r0, 0x1\n    strb r0, [r3]\n    ldrb r2, [r3]\n    lsls r0, r2, 2\n    adds r0, r4\n    ldr r0, [r0]\n    ands r0, r5\n    cmp r0, 0\n    bne _0802314C\n    ldrb r0, [r7]\n    cmp r2, r0\n    bcc _08023132\n_0802314C:\n    ldrb r0, [r1]\n    ldrb r6, [r6]\n    cmp r0, r6\n    beq _08023156\n    b _08023302\n_08023156:\n    mov r1, r8\n    mov r2, r12\n    str r1, [r2]\n    b _08023302\n    .align 2, 0\n_08023160: .4byte gHitMarker\n_08023164: .4byte gBank1\n_08023168: .4byte gBitTable\n_0802316C: .4byte gNoOfAllBanks\n_08023170:\n    movs r0, 0x80\n    ands r0, r2\n    movs r5, 0x1\n    cmp r0, 0\n    beq _0802317C\n    movs r5, 0\n_0802317C:\n    movs r0, 0x7F\n    ands r0, r2\n    bl GetBattleBank\n    lsls r0, 24\n    lsrs r7, r0, 24\n    ldr r1, _080231A4 @ =gSpecialStatuses\n    lsls r0, r7, 2\n    adds r0, r7\n    lsls r0, 2\n    adds r0, r1\n    ldrb r0, [r0]\n    lsls r0, 25\n    cmp r0, 0\n    bge _080231A8\n    ldr r0, [r6]\n    adds r0, 0x6\n    str r0, [r6]\n    b _08023302\n    .align 2, 0\n_080231A4: .4byte gSpecialStatuses\n_080231A8:\n    adds r0, r7, 0\n    movs r1, 0x6\n    movs r2, 0x6\n    bl sub_8018018\n    lsls r0, 24\n    cmp r0, 0\n    beq _080231F8\n    ldr r2, _080231E8 @ =gActiveBank\n    strb r7, [r2]\n    ldr r3, _080231EC @ =gAbsentBankFlags\n    ldr r4, _080231F0 @ =gBitTable\n    ldrb r0, [r2]\n    lsls r0, 2\n    adds r0, r4\n    ldr r0, [r0]\n    ldrb r1, [r3]\n    orrs r0, r1\n    strb r0, [r3]\n    ldr r3, _080231F4 @ =gHitMarker\n    ldrb r0, [r2]\n    lsls r0, 2\n    adds r0, r4\n    ldr r1, [r0]\n    lsls r1, 28\n    ldr r0, [r3]\n    bics r0, r1\n    str r0, [r3]\n    mov r0, r8\n    str r0, [r6]\n    b _08023302\n    .align 2, 0\n_080231E8: .4byte gActiveBank\n_080231EC: .4byte gAbsentBankFlags\n_080231F0: .4byte gBitTable\n_080231F4: .4byte gHitMarker\n_080231F8:\n    ldr r4, _080232A0 @ =gActiveBank\n    strb r7, [r4]\n    ldr r3, _080232A4 @ =gSharedMem\n    ldrb r0, [r4]\n    ldr r2, _080232A8 @ =0x00016064\n    adds r1, r0, r2\n    adds r1, r3\n    ldr r2, _080232AC @ =gBattlePartyID\n    lsls r0, 1\n    adds r0, r2\n    ldrh r0, [r0]\n    strb r0, [r1]\n    ldrb r1, [r4]\n    movs r0, 0x2\n    eors r0, r1\n    ldr r1, _080232B0 @ =0x00016068\n    adds r0, r1\n    adds r0, r3\n    ldrb r2, [r0]\n    ldrb r1, [r4]\n    lsls r0, r1, 1\n    adds r0, r1\n    ldr r1, _080232B4 @ =0x0001606c\n    adds r3, r1\n    adds r0, r3\n    str r0, [sp]\n    movs r0, 0\n    adds r1, r5, 0\n    movs r3, 0\n    bl EmitChoosePokemon\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n    ldr r0, [r6]\n    adds r0, 0x6\n    str r0, [r6]\n    ldrb r0, [r4]\n    bl GetBankIdentity\n    lsls r0, 24\n    cmp r0, 0\n    bne _0802325A\n    ldr r1, _080232B8 @ =gBattleResults\n    ldrb r0, [r1, 0x2]\n    cmp r0, 0xFE\n    bhi _0802325A\n    adds r0, 0x1\n    strb r0, [r1, 0x2]\n_0802325A:\n    ldr r0, _080232BC @ =gBattleTypeFlags\n    ldrh r1, [r0]\n    movs r0, 0x40\n    ands r0, r1\n    cmp r0, 0\n    beq _080232C4\n    ldr r1, _080232A0 @ =gActiveBank\n    movs r0, 0\n    strb r0, [r1]\n    ldr r0, _080232C0 @ =gNoOfAllBanks\n    ldrb r0, [r0]\n    cmp r0, 0\n    beq _08023302\n    adds r4, r1, 0\n_08023276:\n    ldrb r0, [r4]\n    cmp r0, r7\n    beq _0802328A\n    movs r0, 0\n    movs r1, 0x2\n    bl EmitLinkStandbyMsg\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n_0802328A:\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n    ldr r1, _080232C0 @ =gNoOfAllBanks\n    lsls r0, 24\n    lsrs r0, 24\n    ldrb r1, [r1]\n    cmp r0, r1\n    bcc _08023276\n    b _08023302\n    .align 2, 0\n_080232A0: .4byte gActiveBank\n_080232A4: .4byte gSharedMem\n_080232A8: .4byte 0x00016064\n_080232AC: .4byte gBattlePartyID\n_080232B0: .4byte 0x00016068\n_080232B4: .4byte 0x0001606c\n_080232B8: .4byte gBattleResults\n_080232BC: .4byte gBattleTypeFlags\n_080232C0: .4byte gNoOfAllBanks\n_080232C4:\n    adds r0, r7, 0\n    bl GetBankIdentity\n    movs r1, 0x1\n    eors r0, r1\n    lsls r0, 24\n    lsrs r0, 24\n    bl GetBankByPlayerAI\n    ldr r4, _08023310 @ =gActiveBank\n    strb r0, [r4]\n    ldr r0, _08023314 @ =gAbsentBankFlags\n    ldrb r1, [r0]\n    ldr r2, _08023318 @ =gBitTable\n    ldrb r3, [r4]\n    lsls r0, r3, 2\n    adds r0, r2\n    ldr r0, [r0]\n    ands r1, r0\n    cmp r1, 0\n    beq _080232F4\n    movs r0, 0x2\n    eors r3, r0\n    strb r3, [r4]\n_080232F4:\n    movs r0, 0\n    movs r1, 0x2\n    bl EmitLinkStandbyMsg\n    ldrb r0, [r4]\n    bl MarkBufferBankForExecution\n_08023302:\n    add sp, 0x4\n    pop {r3,r4}\n    mov r8, r3\n    mov r9, r4\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08023310: .4byte gActiveBank\n_08023314: .4byte gAbsentBankFlags\n_08023318: .4byte gBitTable\n        .syntax divided");
# 10566 "src/battle/battle_4.c"
}

static void atk51_switch_handle_order(void)
{
    int i;
    if (gBattleExecBuffer)
        return;

    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    switch (((gBattlescriptCurrInstr + 2)[0]))
    {
    case 0:
        for (i = 0; i < gNoOfAllBanks; i++)
        {
            if (gBattleBufferB[i][0] == 0x22)
                (gSharedMem[0x16068 + i]) = gBattleBufferB[i][1];
        }
        break;
    case 1:
        if (!(gBattleTypeFlags & 0x0040))
            sub_8012258(gActiveBank);
        break;
    case 2:
        gBattleCommunication[0] = gBattleBufferB[gActiveBank][1];
        (gSharedMem[0x16068 + gActiveBank]) = gBattleBufferB[gActiveBank][1];
        if (gBattleTypeFlags & 0x0040)
        {
            (gSharedMem[0x1606C + 0 + gActiveBank * 3]) &= 0xF;
            (gSharedMem[0x1606C + 0 + gActiveBank * 3]) |= (gBattleBufferB[gActiveBank][2] & 0xF0);
            (gSharedMem[0x1606C + 1 + gActiveBank * 3]) = gBattleBufferB[gActiveBank][3];
            (gSharedMem[0x1606C + 0 + (gActiveBank ^ 2) * 3]) &= (0xF0);
            (gSharedMem[0x1606C + 0 + (gActiveBank ^ 2) * 3]) |= (gBattleBufferB[gActiveBank][2] & 0xF0) >> 4;
            (gSharedMem[0x1606C + 2 + (gActiveBank ^ 2) * 3]) = gBattleBufferB[gActiveBank][3];
        }
        else
            sub_8012258(gActiveBank);

        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 6;
        gBattleTextBuff1[2] = gBattleMons[gBankAttacker].species;
        gBattleTextBuff1[3] = gBattleMons[gBankAttacker].species >> 8;
        gBattleTextBuff1[4] = 0xFF;

        gBattleTextBuff2[0] = 0xFD;
        gBattleTextBuff2[1] = 7;
        gBattleTextBuff2[2] = gActiveBank;
        gBattleTextBuff2[3] = gBattleBufferB[gActiveBank][1];
        gBattleTextBuff2[4] = 0xFF;
        break;
    }
    gBattlescriptCurrInstr += 3;
}

static void atk52_switch_in_effects(void)
{
    int i;

    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    sub_80157C4(gActiveBank);
    gHitMarker &= ~(((gBitTable[gActiveBank] << 0x1C)));
    gSpecialStatuses[gActiveBank].flag40 = 0;

    if (!(gSideAffecting[GetBankSide(gActiveBank)] & (1 << 9)) && (gSideAffecting[GetBankSide(gActiveBank)] & (1 << 4))
        && gBattleMons[gActiveBank].type1 != 0x02 && gBattleMons[gActiveBank].type2 != 0x02 && gBattleMons[gActiveBank].ability != ABILITY_LEVITATE)
    {
        u8 spikesDmg;

        gSideAffecting[GetBankSide(gActiveBank)] |= (1 << 9);

        spikesDmg = (5 - gSideTimer[GetBankSide(gActiveBank)].spikesAmount) * 2;
        gBattleMoveDamage = gBattleMons[gActiveBank].maxHP / (spikesDmg);
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;

        ((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive = gActiveBank;
        b_movescr_stack_push_cursor();

        if (((gBattlescriptCurrInstr + 1)[0]) == 0)
            gBattlescriptCurrInstr = gUnknown_081D919F;
        else if (((gBattlescriptCurrInstr + 1)[0]) == 1)
            gBattlescriptCurrInstr = gUnknown_081D9171;
        else
            gBattlescriptCurrInstr = gUnknown_081D91CD;
    }
    else
    {
        if (gBattleMons[gActiveBank].ability == ABILITY_TRUANT)
        {
            gDisableStructs[gActiveBank].truantCounter = 1;
        }

        if (AbilityBattleEffects(0, gActiveBank, 0, 0, 0) == 0 && ItemBattleEffects(0, gActiveBank, 0) == 0)
        {
            gSideAffecting[GetBankSide(gActiveBank)] &= ~((1 << 9));

            for (i = 0; i < gNoOfAllBanks; i++)
            {
                if (gTurnOrder[i] == gActiveBank)
                    gUnknown_02024A76[i] = 0xC;
            }

            for (i = 0; i < gNoOfAllBanks; i++)
            {
                *((((u16*)(0x02000000 + 0x160BC))) + GetBankSide(i)) = gBattleMons[i].hp;
            }

            if (((gBattlescriptCurrInstr + 1)[0]) == 5)
            {
                u32 hitmark = gHitMarker >> 0x1C;
                gBank1++;
                while (1)
                {
                    if (hitmark & gBitTable[gBank1] && !(gAbsentBankFlags & gBitTable[gBank1]))
                        break;
                    if (gBank1 >= gNoOfAllBanks)
                        break;
                    gBank1++;
                }
            }
            gBattlescriptCurrInstr += 2;
        }
    }
}

static void atk53_trainer_slide(void)
{
    if (!((gBattlescriptCurrInstr + 1)[0]))
        gActiveBank = GetBankByPlayerAI(0);
    else
        gActiveBank = GetBankByPlayerAI(1);

    EmitTrainerSlide(0);
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 2;
}

static void atk54_effectiveness_sound(void)
{
    gActiveBank = gBankAttacker;
    EmitEffectivenessSound(0, ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8)));
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 3;
}

static void atk55_play_sound(void)
{
    gActiveBank = gBankAttacker;
    Emitcmd44(0, ((gBattlescriptCurrInstr + 1)[0] + ((gBattlescriptCurrInstr + 1)[1] << 8)));
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 3;
}

static void atk56_fainting_cry(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    EmitFaintingCry(0);
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 2;
}

static void atk57(void)
{
    gActiveBank = GetBankByPlayerAI(0);
    Emitcmd55(0, gBattleOutcome);
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 1;
}

static void atk58_return_to_ball(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    EmitReturnPokeToBall(0, 1);
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 2;
}

void atk59_learnmove_inbattle(void)
{
    u8* loc1 = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    u8* loc2 = (u8*) ((gBattlescriptCurrInstr + 5)[0] | ((gBattlescriptCurrInstr + 5)[1] << 8) | ((gBattlescriptCurrInstr + 5)[2] << 16) | ((gBattlescriptCurrInstr + 5)[3] << 24));

    u16 ret = MonTryLearningNewMove(&gPlayerParty[((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID], ((gBattlescriptCurrInstr + 9)[0]));
    while (ret == 0xFFFE)
        ret = MonTryLearningNewMove(&gPlayerParty[((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID], 0);

    if (ret == 0)
    {
        gBattlescriptCurrInstr = loc2;
    }
    else if (ret == 0xFFFF)
    {
        gBattlescriptCurrInstr += 10;
    }
    else
    {
        gActiveBank = GetBankByPlayerAI(0);
        if (gBattlePartyID[gActiveBank] == ((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID && !(gBattleMons[gActiveBank].status2 & 0x00200000))
            GiveMoveToBattleMon(&gBattleMons[gActiveBank], ret);
        if (gBattleTypeFlags & 0x0001)
        {
            gActiveBank = GetBankByPlayerAI(2);
            if (gBattlePartyID[gActiveBank] == ((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID && !(gBattleMons[gActiveBank].status2 & 0x00200000))
                GiveMoveToBattleMon(&gBattleMons[gActiveBank], ret);
        }
        gBattlescriptCurrInstr = loc1;
    }
}

void sub_8023A80(void)
{
    sub_802BBD4(0x17, 8, 0x1D, 0xD, 0);
    InitWindow(&gUnknown_03004210, BattleText_YesNo, 0x100, 0x19, 0x9);
    sub_8002F44(&gUnknown_03004210);
    sub_814A5C0(0, 0xFFFF, 0xC, 0x2D9F, 0x20);
}

void sub_8023AD8(void)
{
    sub_802BBD4(0x17, 8, 0x1D, 0xD, 1);
    DestroyMenuCursor();
}

static void atk5A(void)
{
    gActiveBank = 0;
    switch (((struct BattleStruct *) (gSharedMem + 0x0))->atk5A_StateTracker)
    {
    case 0:
        sub_8023A80();
        ((struct BattleStruct *) (gSharedMem + 0x0))->atk5A_StateTracker++;
        gBattleCommunication[1] = 0;
        sub_802BC6C();
        break;
    case 1:
        if (gMain.newKeys & 0x0040 && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (gMain.newKeys & 0x0080 && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (gMain.newKeys & 0x0001)
        {
            PlaySE(SE_SELECT);
            if (gBattleCommunication[1] == 0)
            {
                sub_8023AD8();
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                ((struct BattleStruct *) (gSharedMem + 0x0))->atk5A_StateTracker++;
                return;
            }
            goto state_tracker_4;
        }
        else if (gMain.newKeys & 0x0002)
        {
            PlaySE(SE_SELECT);
          state_tracker_4:
            ((struct BattleStruct *) (gSharedMem + 0x0))->atk5A_StateTracker = 4;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            sub_809D9F0(gPlayerParty, ((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID, gPlayerPartyCount - 1, ReshowBattleScreenAfterMenu, gMoveToLearn);
            ((struct BattleStruct *) (gSharedMem + 0x0))->atk5A_StateTracker++;
        }
        break;
    case 3:
        if (!gPaletteFade.active && gMain.callback2 == sub_800F808)
        {
            u8 move_pos = sub_809FA30();
            if (move_pos == 4)
            {
                ((struct BattleStruct *) (gSharedMem + 0x0))->atk5A_StateTracker = 4;
            }
            else
            {
                u16 move = GetMonData(&gPlayerParty[((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID], 13 + move_pos);
                if (IsHMMove2(move))
                {
                    PrepareStringBattle(0x13F, gActiveBank);
                    ((struct BattleStruct *) (gSharedMem + 0x0))->atk5A_StateTracker = 5;
                }
                else
                {
                    u8 *ptr;

                    gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
                    ptr = gBattleTextBuff2;
                    {
                        ptr[0] = 0xFD;
                        ptr[1] = 2;
                        ptr[2] = move;
                        ptr[3] = ((move & 0xFF00) >> 8);
                        ptr += 4;
                    }
                    ptr[0] = 0xFF;
                    RemoveMonPPBonus(&gPlayerParty[((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID], move_pos);
                    SetMonMoveSlot(&gPlayerParty[((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID], gMoveToLearn, move_pos);
                    if (gBattlePartyID[0] == ((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID && !(gBattleMons[0].status2 & 0x00200000)
                        && !(gDisableStructs[0].unk18_b & gBitTable[move_pos]))
                    {
                        RemoveBattleMonPPBonus(&gBattleMons[0], move_pos);
                        SetBattleMonMoveSlot(&gBattleMons[0], gMoveToLearn, move_pos);
                    }
                    if (gBattleTypeFlags & 0x0001 && gBattlePartyID[2] == ((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID && !(gBattleMons[2].status2 & 0x00200000)
                        && !(gDisableStructs[2].unk18_b & gBitTable[move_pos]))
                    {
                        RemoveBattleMonPPBonus(&gBattleMons[2], move_pos);
                        SetBattleMonMoveSlot(&gBattleMons[2], gMoveToLearn, move_pos);
                    }
                }
            }
        }
        break;
    case 4:
        sub_8023AD8();
        gBattlescriptCurrInstr += 5;
        break;
    case 5:
        if (gBattleExecBuffer == 0)
        {
            ((struct BattleStruct *) (gSharedMem + 0x0))->atk5A_StateTracker = 2;
        }
        break;
    }
}

static void atk5B_80256E0(void)
{
    switch (((struct BattleStruct *) (gSharedMem + 0x0))->atk5A_StateTracker)
    {
    case 0:
        sub_8023A80();
        ((struct BattleStruct *) (gSharedMem + 0x0))->atk5A_StateTracker++;
        gBattleCommunication[1] = 0;
        sub_802BC6C();
        break;
    case 1:
        if (gMain.newKeys & 0x0040 && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (gMain.newKeys & 0x0080 && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (gMain.newKeys & 0x0001)
        {
            PlaySE(SE_SELECT);
            if (gBattleCommunication[1] != 0)
                gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
            else
                gBattlescriptCurrInstr += 5;
            sub_8023AD8();
        }
        else if (gMain.newKeys & 0x0002)
        {
            PlaySE(SE_SELECT);
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
            sub_8023AD8();
        }
    }
}

static void atk5C_hitanimation(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    if (gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5))))
        gBattlescriptCurrInstr += 2;
    else if (!(gHitMarker & 0x00000100) || !(gBattleMons[gActiveBank].status2 & 0x01000000) || gDisableStructs[gActiveBank].substituteHP == 0)
    {
        EmitHitAnimation(0);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 2;
    }
    else
        gBattlescriptCurrInstr += 2;
}
# 11018 "src/battle/battle_4.c"
__attribute__((naked))
static void atk5D_getmoneyreward(void)
{
    asm(".syntax unified\n        push {r4-r7,lr}\n    mov r7, r8\n    push {r7}\n    movs r6, 0\n    movs r5, 0\n    ldr r0, _08024048 @ =gTrainerBattleOpponent\n    ldrh r2, [r0]\n    movs r1, 0x80\n    lsls r1, 3\n    cmp r2, r1\n    bne _08024058\n    ldr r0, _0802404C @ =gSharedMem + 0x17000\n    adds r1, r0, 0\n    adds r1, 0x94\n    ldrb r2, [r1]\n    ldr r1, _08024050 @ =0xfffff056\n    adds r0, r1\n    ldrb r1, [r0]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r4, r2, 0\n    muls r4, r0\n    ldr r0, _08024054 @ =gSaveBlock1 + 0x490\n    mov r8, r0\n    b _08024140\n    .align 2, 0\n_08024048: .4byte gTrainerBattleOpponent\n_0802404C: .4byte gSharedMem + 0x17000\n_08024050: .4byte 0xfffff056\n_08024054: .4byte gSaveBlock1 + 0x490\n_08024058:\n    ldr r2, _08024074 @ =gTrainers\n    ldrh r1, [r0]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r3, r0, 3\n    adds r4, r3, r2\n    ldrb r1, [r4]\n    cmp r1, 0x1\n    beq _080240AE\n    cmp r1, 0x1\n    bgt _08024078\n    cmp r1, 0\n    beq _08024082\n    b _080240C4\n    .align 2, 0\n_08024074: .4byte gTrainers\n_08024078:\n    cmp r1, 0x2\n    beq _08024098\n    cmp r1, 0x3\n    beq _080240AE\n    b _080240C4\n_08024082:\n    adds r0, r2, 0\n    adds r0, 0x24\n    adds r0, r3, r0\n    ldr r1, [r0]\n    adds r0, r4, 0\n    adds r0, 0x20\n    ldrb r0, [r0]\n    lsls r0, 3\n    adds r0, r1\n    subs r0, 0x8\n    b _080240C2\n_08024098:\n    adds r0, r2, 0\n    adds r0, 0x24\n    adds r0, r3, r0\n    ldr r1, [r0]\n    adds r0, r4, 0\n    adds r0, 0x20\n    ldrb r0, [r0]\n    lsls r0, 3\n    adds r0, r1\n    subs r0, 0x8\n    b _080240C2\n_080240AE:\n    adds r0, r2, 0\n    adds r0, 0x24\n    adds r0, r3, r0\n    ldr r1, [r0]\n    adds r0, r4, 0\n    adds r0, 0x20\n    ldrb r0, [r0]\n    lsls r0, 4\n    adds r0, r1\n    subs r0, 0x10\n_080240C2:\n    ldrb r5, [r0, 0x2]\n_080240C4:\n    ldr r0, _08024120 @ =gTrainerMoney\n    lsls r1, r6, 2\n    adds r3, r1, r0\n    ldrb r1, [r3]\n    mov r12, r0\n    lsls r4, r5, 2\n    ldr r5, _08024124 @ =gSharedMem\n    ldr r7, _08024128 @ =gBattleTypeFlags\n    ldr r0, _0802412C @ =gSaveBlock1 + 0x490\n    mov r8, r0\n    cmp r1, 0xFF\n    beq _080240FE\n    ldr r2, _08024130 @ =gTrainers\n    ldr r0, _08024134 @ =gTrainerBattleOpponent\n    ldrh r1, [r0]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 3\n    adds r0, r2\n    ldrb r2, [r0, 0x1]\n    adds r1, r3, 0\n_080240EE:\n    ldrb r0, [r1]\n    cmp r0, r2\n    beq _080240FE\n    adds r1, 0x4\n    adds r6, 0x1\n    ldrb r0, [r1]\n    cmp r0, 0xFF\n    bne _080240EE\n_080240FE:\n    ldr r1, _08024138 @ =0x00016056\n    adds r0, r5, r1\n    ldrb r0, [r0]\n    adds r3, r4, 0\n    muls r3, r0\n    lsls r0, r6, 2\n    add r0, r12\n    ldrb r2, [r0, 0x1]\n    ldrh r1, [r7]\n    movs r0, 0x1\n    ands r0, r1\n    cmp r0, 0\n    beq _0802413C\n    lsls r0, r2, 1\n    adds r4, r3, 0\n    muls r4, r0\n    b _08024140\n    .align 2, 0\n_08024120: .4byte gTrainerMoney\n_08024124: .4byte gSharedMem\n_08024128: .4byte gBattleTypeFlags\n_0802412C: .4byte gSaveBlock1 + 0x490\n_08024130: .4byte gTrainers\n_08024134: .4byte gTrainerBattleOpponent\n_08024138: .4byte 0x00016056\n_0802413C:\n    adds r4, r3, 0\n    muls r4, r2\n_08024140:\n    mov r0, r8\n    adds r1, r4, 0\n    bl AddMoney\n    ldr r1, _0802418C @ =gBattleTextBuff1\n    movs r0, 0xFD\n    strb r0, [r1]\n    movs r0, 0x1\n    strb r0, [r1, 0x1]\n    movs r0, 0x4\n    strb r0, [r1, 0x2]\n    movs r0, 0x5\n    strb r0, [r1, 0x3]\n    strb r4, [r1, 0x4]\n    movs r0, 0xFF\n    lsls r0, 8\n    ands r0, r4\n    lsrs r0, 8\n    strb r0, [r1, 0x5]\n    movs r0, 0xFF\n    lsls r0, 16\n    ands r0, r4\n    lsrs r0, 16\n    strb r0, [r1, 0x6]\n    lsrs r0, r4, 24\n    strb r0, [r1, 0x7]\n    movs r0, 0xFF\n    strb r0, [r1, 0x8]\n    ldr r1, _08024190 @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x1\n    str r0, [r1]\n    pop {r3}\n    mov r8, r3\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0802418C: .4byte gBattleTextBuff1\n_08024190: .4byte gBattlescriptCurrInstr\n        .syntax divided");
# 11214 "src/battle/battle_4.c"
}


static void atk5E_8025A70(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    switch (gBattleCommunication[0])
    {
    case 0:
        EmitGetAttributes(0, 0x0, 0);
        MarkBufferBankForExecution(gActiveBank);
        gBattleCommunication[0]++;
        break;
    case 1:
         if (gBattleExecBuffer == 0)
         {
            int i;
            struct BattlePokemon* bufferPoke = (struct BattlePokemon*) &gBattleBufferB[gActiveBank][4];
            for (i = 0; i < 4; i++)
            {
                gBattleMons[gActiveBank].moves[i] = bufferPoke->moves[i];
                gBattleMons[gActiveBank].pp[i] = bufferPoke->pp[i];
            }
            gBattlescriptCurrInstr += 2;
         }
         break;
    }
}

static void atk5F_8025B24(void)
{
    gActiveBank = gBankAttacker;
    gBankAttacker = gBankTarget;
    gBankTarget = gActiveBank;

    if (gHitMarker & 0x00001000)
        gHitMarker &= ~(0x00001000);
    else
        gHitMarker |= 0x00001000;
    gBattlescriptCurrInstr++;
}

static void atk60_increment_gamestat(void)
{
    if (GetBankSide(gBankAttacker) == 0)
    {
        IncrementGameStat(((gBattlescriptCurrInstr + 1)[0]));
    }
    gBattlescriptCurrInstr += 2;
}

static void atk61_8025BA4(void)
{
    int i;
    struct Pokemon* party;
    struct HpAndStatus hpStatus[6];
    if (gBattleExecBuffer)
        return;

    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    if (GetBankSide(gActiveBank) == 0)
        party = gPlayerParty;
    else
        party = gEnemyParty;

    for (i = 0; i < 6; i++)
    {
        if (GetMonData(&party[i], 65) == 0 || GetMonData(&party[i], 65) == SPECIES_EGG)
        {
            hpStatus[i].hp = 0xFFFF;
            hpStatus[i].status = 0;
        }
        else
        {
            hpStatus[i].hp = GetMonData(&party[i], 57);
            hpStatus[i].status = GetMonData(&party[i], 55);
        }
    }
    EmitDrawPartyStatusSummary(0, hpStatus, 1);
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 2;
}

static void atk62_08025C6C(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    Emitcmd49(0);
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 2;
}

static void atk63_jumptorandomattack(void)
{
    if (((gBattlescriptCurrInstr + 1)[0]))
        gCurrentMove = gRandomMove;
    else
        gUnknown_02024BE8 = gCurrentMove = gRandomMove;
    gBattlescriptCurrInstr = gBattleScriptsEffectsTable[gBattleMoves[gCurrentMove].effect];
}

static void atk64_statusanimation(void)
{
    if (gBattleExecBuffer == 0)
    {
        gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
        if (!(gStatuses3[gActiveBank] & ((0x80 | 0x40 | 0x40000))) && gDisableStructs[gActiveBank].substituteHP == 0 && !(gHitMarker & 0x00000080))
        {
            EmitStatusAnimation(0, 0, gBattleMons[gActiveBank].status1);
            MarkBufferBankForExecution(gActiveBank);
        }
        gBattlescriptCurrInstr += 2;
    }
}

static void atk65_status2animation(void)
{
    if (gBattleExecBuffer == 0)
    {
        u32 possible_to_anim;
        gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
        possible_to_anim = ((gBattlescriptCurrInstr + 2)[0] | ((gBattlescriptCurrInstr + 2)[1] << 8) | ((gBattlescriptCurrInstr + 2)[2] << 16) | ((gBattlescriptCurrInstr + 2)[3] << 24));
        if (!(gStatuses3[gActiveBank] & ((0x80 | 0x40 | 0x40000))) && gDisableStructs[gActiveBank].substituteHP == 0 && !(gHitMarker & 0x00000080))
        {
            EmitStatusAnimation(0, 1, gBattleMons[gActiveBank].status2 & possible_to_anim);
            MarkBufferBankForExecution(gActiveBank);
        }
        gBattlescriptCurrInstr += 6;
    }
}

static void atk66_chosenstatusanimation(void)
{
    if (gBattleExecBuffer == 0)
    {
        u32 status;
        gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
        status = ((gBattlescriptCurrInstr + 3)[0] | ((gBattlescriptCurrInstr + 3)[1] << 8) | ((gBattlescriptCurrInstr + 3)[2] << 16) | ((gBattlescriptCurrInstr + 3)[3] << 24));
        if (!(gStatuses3[gActiveBank] & ((0x80 | 0x40 | 0x40000))) && gDisableStructs[gActiveBank].substituteHP == 0 && !(gHitMarker & 0x00000080))
        {
            EmitStatusAnimation(0, ((gBattlescriptCurrInstr + 2)[0]), status);
            MarkBufferBankForExecution(gActiveBank);
        }
        gBattlescriptCurrInstr += 7;
    }
}

static void atk67_8025ECC(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        sub_8023A80();
        gBattleCommunication[0]++;
        gBattleCommunication[1] = 0;
        sub_802BC6C();
        break;
    case 1:
        if (gMain.newKeys & 0x0040 && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (gMain.newKeys & 0x0080 && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (gMain.newKeys & 0x0002)
        {
            gBattleCommunication[1] = 1;
            PlaySE(SE_SELECT);
            sub_8023AD8();
            gBattlescriptCurrInstr++;
        }
        else if (gMain.newKeys & 0x0001)
        {
            PlaySE(SE_SELECT);
            sub_8023AD8();
            gBattlescriptCurrInstr++;
        }
        break;
    }
}

static void atk68_80246A0(void)
{
    int i;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        gUnknown_02024A76[i] = 0xC;
    }
    gBattlescriptCurrInstr++;
}

static void atk69_dmg_adjustment2(void)
{
    u8 hold_effect, quality;
    if (gBattleMons[gBankTarget].item == ITEM_ENIGMA_BERRY)
        hold_effect = gEnigmaBerries[gBankTarget].holdEffect, quality = gEnigmaBerries[gBankTarget].holdEffectParam;
    else
    {
        hold_effect = ItemId_GetHoldEffect(gBattleMons[gBankTarget].item);
        quality = ItemId_GetHoldEffectParam(gBattleMons[gBankTarget].item);
    }

    gStringBank = gBankTarget;

    if (hold_effect == 39 && (Random() % 100) < quality)
    {
        RecordItemBattle(gBankTarget, hold_effect);
        gSpecialStatuses[gBankTarget].focusBanded = 1;
    }
    if (gBattleMons[gBankTarget].status2 & 0x01000000)
        goto END;
    if (gBattleMoves[gCurrentMove].effect != EFFECT_FALSE_SWIPE && !gProtectStructs[gBankTarget].endured
     && !gSpecialStatuses[gBankTarget].focusBanded)
        goto END;
    if (gBattleMons[gBankTarget].hp > gBattleMoveDamage)
        goto END;

    gBattleMoveDamage = gBattleMons[gBankTarget].hp - 1;

    if (gProtectStructs[gBankTarget].endured)
    {
        gBattleMoveFlags |= (1 << 6);
        goto END;
    }
    if (gSpecialStatuses[gBankTarget].focusBanded)
    {
        gBattleMoveFlags |= (1 << 7);
        gLastUsedItem = gBattleMons[gBankTarget].item;
    }

    END:
        gBattlescriptCurrInstr++;
}

void atk6A_removeitem(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    (*(u16 *)&gSharedMem[0x160CC + 2 * (gActiveBank)]) = gBattleMons[gActiveBank].item;

    gBattleMons[gActiveBank].item = 0;
    EmitSetAttributes(0, 0x2, 0, 2, &gBattleMons[gActiveBank].item);
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 2;
}

static void atk6B_atknameinbuff1(void)
{
    gBattleTextBuff1[0] = 0xFD;
    gBattleTextBuff1[1] = 7;
    gBattleTextBuff1[2] = gBankAttacker;
    gBattleTextBuff1[3] = gBattlePartyID[gBankAttacker];
    gBattleTextBuff1[4] = 0xFF;
    gBattlescriptCurrInstr++;
}
# 11491 "src/battle/battle_4.c"
__attribute__((naked))
static void atk6C_lvlbox_display(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x4\n    movs r1, 0\n    movs r7, 0\n    ldr r0, _08024928 @ =gSharedMem\n    mov r10, r0\n    ldr r4, _0802492C @ =0x0001609c\n    add r4, r10\n    ldrb r0, [r4]\n    cmp r0, 0x1\n    bne _0802491C\n    b _08024AF4\n_0802491C:\n    cmp r0, 0x1\n    bgt _08024930\n    cmp r0, 0\n    beq _0802493E\n    b _08024C38\n    .align 2, 0\n_08024928: .4byte gSharedMem\n_0802492C: .4byte 0x0001609c\n_08024930:\n    cmp r0, 0x2\n    bne _08024936\n    b _08024C04\n_08024936:\n    cmp r0, 0x3\n    bne _0802493C\n    b _08024C30\n_0802493C:\n    b _08024C38\n_0802493E:\n    str r1, [sp]\n    movs r0, 0xB\n    movs r1, 0\n    movs r2, 0x1D\n    movs r3, 0x7\n    bl sub_802BBD4\n    ldr r0, _0802499C @ =gStringVar4\n    ldr r1, _080249A0 @ =BattleText_Format2\n    bl StringCopy\n    adds r5, r0, 0\n    movs r1, 0\n    mov r8, r1\n_0802495A:\n    movs r2, 0\n    mov r9, r2\n    ldr r0, _080249A4 @ =gUnknown_0840165C\n    mov r1, r8\n    lsls r4, r1, 2\n    adds r0, r4, r0\n    ldr r1, [r0]\n    adds r0, r5, 0\n    bl StringAppend\n    adds r5, r0, 0\n    ldr r0, _080249A8 @ =gSharedMem\n    ldr r2, _080249AC @ =0x00016018\n    adds r0, r2\n    ldrb r1, [r0]\n    movs r0, 0x64\n    muls r0, r1\n    ldr r1, _080249B0 @ =gPlayerParty\n    adds r0, r1\n    ldr r1, _080249B4 @ =gLevelUpStatBoxStats\n    add r1, r8\n    ldrb r1, [r1]\n    bl GetMonData\n    lsls r0, 16\n    lsrs r1, r0, 16\n    mov r0, r8\n    cmp r0, 0x5\n    bhi _08024A1A\n    ldr r0, _080249B8 @ =_080249BC\n    adds r0, r4, r0\n    ldr r0, [r0]\n    mov pc, r0\n    .align 2, 0\n_0802499C: .4byte gStringVar4\n_080249A0: .4byte BattleText_Format2\n_080249A4: .4byte gUnknown_0840165C\n_080249A8: .4byte gSharedMem\n_080249AC: .4byte 0x00016018\n_080249B0: .4byte gPlayerParty\n_080249B4: .4byte gLevelUpStatBoxStats\n_080249B8: .4byte _080249BC\n    .align 2, 0\n_080249BC:\n    .4byte _080249D4\n    .4byte _080249E0\n    .4byte _080249EC\n    .4byte _080249F8\n    .4byte _08024A04\n    .4byte _08024A10\n_080249D4:\n    ldr r0, _080249DC @ =gSharedMem + 0x17180\n    ldrh r0, [r0]\n    b _08024A14\n    .align 2, 0\n_080249DC: .4byte gSharedMem + 0x17180\n_080249E0:\n    ldr r0, _080249E8 @ =gSharedMem + 0x17180\n    ldrh r0, [r0, 0x8]\n    b _08024A14\n    .align 2, 0\n_080249E8: .4byte gSharedMem + 0x17180\n_080249EC:\n    ldr r0, _080249F4 @ =gSharedMem + 0x17180\n    ldrh r0, [r0, 0x2]\n    b _08024A14\n    .align 2, 0\n_080249F4: .4byte gSharedMem + 0x17180\n_080249F8:\n    ldr r0, _08024A00 @ =gSharedMem + 0x17180\n    ldrh r0, [r0, 0xA]\n    b _08024A14\n    .align 2, 0\n_08024A00: .4byte gSharedMem + 0x17180\n_08024A04:\n    ldr r0, _08024A0C @ =gSharedMem + 0x17180\n    ldrh r0, [r0, 0x4]\n    b _08024A14\n    .align 2, 0\n_08024A0C: .4byte gSharedMem + 0x17180\n_08024A10:\n    ldr r0, _08024A54 @ =gSharedMem + 0x17180\n    ldrh r0, [r0, 0x6]\n_08024A14:\n    subs r0, r1, r0\n    lsls r0, 16\n    lsrs r7, r0, 16\n_08024A1A:\n    lsls r0, r7, 16\n    asrs r0, 16\n    cmp r0, 0\n    bge _08024A2C\n    negs r0, r0\n    lsls r0, 16\n    lsrs r7, r0, 16\n    movs r1, 0x1\n    add r9, r1\n_08024A2C:\n    movs r0, 0xFC\n    strb r0, [r5]\n    movs r0, 0x13\n    strb r0, [r5, 0x1]\n    movs r1, 0x1\n    mov r2, r8\n    ands r1, r2\n    lsls r0, r1, 3\n    adds r0, r1\n    adds r0, 0x5\n    lsls r0, 3\n    adds r0, 0x6\n    strb r0, [r5, 0x2]\n    adds r5, 0x3\n    mov r0, r9\n    cmp r0, 0\n    beq _08024A5C\n    ldr r1, _08024A58 @ =BattleText_Dash\n    b _08024A5E\n    .align 2, 0\n_08024A54: .4byte gSharedMem + 0x17180\n_08024A58: .4byte BattleText_Dash\n_08024A5C:\n    ldr r1, _08024AA4 @ =BattleText_Plus\n_08024A5E:\n    adds r0, r5, 0\n    bl StringCopy\n    adds r5, r0, 0\n    movs r6, 0xFC\n    strb r6, [r5]\n    movs r4, 0x14\n    strb r4, [r5, 0x1]\n    movs r0, 0x6\n    strb r0, [r5, 0x2]\n    adds r5, 0x3\n    lsls r1, r7, 16\n    asrs r1, 16\n    adds r0, r5, 0\n    movs r2, 0x1\n    movs r3, 0x2\n    bl ConvertIntToDecimalStringN\n    adds r5, r0, 0\n    strb r6, [r5]\n    strb r4, [r5, 0x1]\n    movs r0, 0\n    strb r0, [r5, 0x2]\n    adds r5, 0x3\n    movs r0, 0x1\n    mov r1, r8\n    ands r0, r1\n    cmp r0, 0\n    beq _08024AA8\n    movs r0, 0xFE\n    strb r0, [r5]\n    movs r0, 0xFF\n    strb r0, [r5, 0x1]\n    adds r5, 0x1\n    b _08024AB8\n    .align 2, 0\n_08024AA4: .4byte BattleText_Plus\n_08024AA8:\n    strb r6, [r5]\n    movs r0, 0x11\n    strb r0, [r5, 0x1]\n    movs r0, 0x8\n    strb r0, [r5, 0x2]\n    adds r5, 0x3\n    movs r0, 0xFF\n    strb r0, [r5]\n_08024AB8:\n    movs r2, 0x1\n    add r8, r2\n    mov r0, r8\n    cmp r0, 0x5\n    bgt _08024AC4\n    b _0802495A\n_08024AC4:\n    ldr r4, _08024AE4 @ =gUnknown_03004210\n    ldr r1, _08024AE8 @ =gStringVar4\n    adds r2, 0xFF\n    movs r0, 0x1\n    str r0, [sp]\n    adds r0, r4, 0\n    movs r3, 0xC\n    bl InitWindow\n    adds r0, r4, 0\n    bl sub_8002F44\n    ldr r1, _08024AEC @ =gSharedMem\n    ldr r2, _08024AF0 @ =0x0001609c\n    adds r1, r2\n    b _08024BEA\n    .align 2, 0\n_08024AE4: .4byte gUnknown_03004210\n_08024AE8: .4byte gStringVar4\n_08024AEC: .4byte gSharedMem\n_08024AF0: .4byte 0x0001609c\n_08024AF4:\n    ldr r0, _08024B94 @ =gMain\n    ldrh r0, [r0, 0x2E]\n    cmp r0, 0\n    bne _08024AFE\n    b _08024C38\n_08024AFE:\n    movs r0, 0x5\n    bl PlaySE\n    ldr r0, _08024B98 @ =gStringVar4\n    ldr r1, _08024B9C @ =BattleText_Format2\n    bl StringCopy\n    adds r5, r0, 0\n    movs r0, 0\n    mov r8, r0\n    mov r9, r0\n    movs r6, 0xFC\n    movs r7, 0x14\n    ldr r1, _08024BA0 @ =0x00016018\n    add r10, r1\n_08024B1C:\n    ldr r1, _08024BA4 @ =gUnknown_0840165C\n    mov r2, r8\n    lsls r0, r2, 2\n    adds r0, r1\n    ldr r1, [r0]\n    adds r0, r5, 0\n    bl StringAppend\n    adds r5, r0, 0\n    mov r0, r10\n    ldrb r1, [r0]\n    movs r0, 0x64\n    muls r0, r1\n    ldr r1, _08024BA8 @ =gPlayerParty\n    adds r0, r1\n    ldr r1, _08024BAC @ =gLevelUpStatBoxStats\n    add r1, r8\n    ldrb r1, [r1]\n    bl GetMonData\n    adds r1, r0, 0\n    strb r6, [r5]\n    movs r0, 0x13\n    strb r0, [r5, 0x1]\n    movs r4, 0x1\n    mov r2, r8\n    ands r4, r2\n    lsls r0, r4, 3\n    adds r0, r4\n    adds r0, 0x5\n    lsls r0, 3\n    adds r0, 0x6\n    strb r0, [r5, 0x2]\n    adds r5, 0x3\n    strb r6, [r5]\n    strb r7, [r5, 0x1]\n    movs r0, 0x6\n    strb r0, [r5, 0x2]\n    adds r5, 0x3\n    lsls r1, 16\n    asrs r1, 16\n    adds r0, r5, 0\n    movs r2, 0x1\n    movs r3, 0x3\n    bl ConvertIntToDecimalStringN\n    adds r5, r0, 0\n    strb r6, [r5]\n    strb r7, [r5, 0x1]\n    mov r0, r9\n    strb r0, [r5, 0x2]\n    adds r5, 0x3\n    cmp r4, 0\n    beq _08024BB0\n    movs r0, 0xFE\n    strb r0, [r5]\n    movs r0, 0xFF\n    strb r0, [r5, 0x1]\n    adds r5, 0x1\n    b _08024BC0\n    .align 2, 0\n_08024B94: .4byte gMain\n_08024B98: .4byte gStringVar4\n_08024B9C: .4byte BattleText_Format2\n_08024BA0: .4byte 0x00016018\n_08024BA4: .4byte gUnknown_0840165C\n_08024BA8: .4byte gPlayerParty\n_08024BAC: .4byte gLevelUpStatBoxStats\n_08024BB0:\n    strb r6, [r5]\n    movs r0, 0x11\n    strb r0, [r5, 0x1]\n    movs r0, 0x8\n    strb r0, [r5, 0x2]\n    adds r5, 0x3\n    movs r0, 0xFF\n    strb r0, [r5]\n_08024BC0:\n    movs r1, 0x1\n    add r8, r1\n    mov r2, r8\n    cmp r2, 0x5\n    ble _08024B1C\n    ldr r4, _08024BF4 @ =gUnknown_03004210\n    ldr r1, _08024BF8 @ =gStringVar4\n    movs r2, 0x80\n    lsls r2, 1\n    movs r0, 0x1\n    str r0, [sp]\n    adds r0, r4, 0\n    movs r3, 0xC\n    bl InitWindow\n    adds r0, r4, 0\n    bl sub_8002F44\n    ldr r1, _08024BFC @ =gSharedMem\n    ldr r0, _08024C00 @ =0x0001609c\n    adds r1, r0\n_08024BEA:\n    ldrb r0, [r1]\n    adds r0, 0x1\n    strb r0, [r1]\n    b _08024C38\n    .align 2, 0\n_08024BF4: .4byte gUnknown_03004210\n_08024BF8: .4byte gStringVar4\n_08024BFC: .4byte gSharedMem\n_08024C00: .4byte 0x0001609c\n_08024C04:\n    ldr r0, _08024C2C @ =gMain\n    ldrh r0, [r0, 0x2E]\n    cmp r0, 0\n    beq _08024C38\n    movs r0, 0x5\n    bl PlaySE\n    movs r0, 0x1\n    str r0, [sp]\n    movs r0, 0xB\n    movs r1, 0\n    movs r2, 0x1D\n    movs r3, 0x7\n    bl sub_802BBD4\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n    b _08024C38\n    .align 2, 0\n_08024C2C: .4byte gMain\n_08024C30:\n    ldr r1, _08024C48 @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x1\n    str r0, [r1]\n_08024C38:\n    add sp, 0x4\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08024C48: .4byte gBattlescriptCurrInstr\n        .syntax divided");
# 11898 "src/battle/battle_4.c"
}



static void atk6D_set_sentpokes_values(void)
{
    sub_80156DC();
    gBattlescriptCurrInstr++;
}

static void atk6E_set_atk_to_player0(void)
{
    gBankAttacker = GetBankByPlayerAI(0);
    gBattlescriptCurrInstr++;
}

static void atk6F_set_visible(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    EmitSpriteInvisibility(0, 0);
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr += 2;
}

static void atk70_record_ability(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    RecordAbilityBattle(gActiveBank, gLastUsedAbility);
    gBattlescriptCurrInstr += 1;
}

void sub_8024CEC(void)
{
    gBattleTextBuff2[0] = 0xFD;
    gBattleTextBuff2[1] = 2;
    gBattleTextBuff2[2] = (gMoveToLearn);
    gBattleTextBuff2[3] = (( (u8) (((u16)(gMoveToLearn) & (0x0000FF00)) >> 0x08)));
    gBattleTextBuff2[4] = 0xFF;
}

static void atk71_buffer_move_to_learn(void)
{
    sub_8024CEC();
    gBattlescriptCurrInstr++;
}

static void atk72_jump_if_can_run_frombattle(void)
{
    if (sub_8014AB8(gBank1))
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
        gBattlescriptCurrInstr += 5;
}

static void atk73_hp_thresholds(void)
{
    u8 opposing_bank;
    s32 result;
    if (!(gBattleTypeFlags & 0x0001))
    {
        gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
        opposing_bank = gActiveBank ^ 1;

        result = gBattleMons[opposing_bank].hp * 100 / gBattleMons[opposing_bank].maxHP;
        if (result == 0)
            result = 1;

        if (result > 69 || !gBattleMons[opposing_bank].hp)
            ((struct BattleStruct *) (gSharedMem + 0x0))->hpScale = 0;
        else if (result > 39)
            ((struct BattleStruct *) (gSharedMem + 0x0))->hpScale = 1;
        else if (result > 9)
            ((struct BattleStruct *) (gSharedMem + 0x0))->hpScale = 2;
        else
            ((struct BattleStruct *) (gSharedMem + 0x0))->hpScale = 3;
    }

    gBattlescriptCurrInstr += 2;
}

static void atk74_hp_thresholds2(void)
{
    u8 opposing_bank;
    u8 hp_switchout;
    s32 result;
    if (!(gBattleTypeFlags & 0x0001))
    {
        gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
        opposing_bank = gActiveBank ^ 1;
        hp_switchout = (gSharedMem[0x160BC + GetBankSide(opposing_bank) * 2]);
        result = (hp_switchout - gBattleMons[opposing_bank].hp) * 100 / hp_switchout;

        if (gBattleMons[opposing_bank].hp >= hp_switchout)
            ((struct BattleStruct *) (gSharedMem + 0x0))->hpScale = 0;
        else if (result <= 29)
            ((struct BattleStruct *) (gSharedMem + 0x0))->hpScale = 1;
        else if (result <= 69)
            ((struct BattleStruct *) (gSharedMem + 0x0))->hpScale = 2;
        else
            ((struct BattleStruct *) (gSharedMem + 0x0))->hpScale = 3;
    }

    gBattlescriptCurrInstr += 2;
}

static void atk75_8026A58(void)
{
    gBankInMenu = gBankAttacker;
    sub_803E1B0(&gEnemyParty[gBattlePartyID[gBankAttacker]], gLastUsedItem, gBattlePartyID[gBankAttacker], 0, 1);
    gBattlescriptCurrInstr += 1;
}

static void atk76_various(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    switch (((gBattlescriptCurrInstr + 2)[0]))
    {
    case 0:
        CancelMultiTurnMoves(gActiveBank);
        break;
    case 1:
        {
            u8 side;
            gBankAttacker = gBankTarget;
            side = GetBankSide(gBankAttacker) ^ 1;
            if (gSideTimer[side].followmeTimer && gBattleMons[gSideTimer[side].followmeTarget].hp)
                gBankTarget = gSideTimer[side].followmeTarget;
            else
                gBankTarget = gActiveBank;
        }
        break;
    case 2:
        gBattleCommunication[0] = CanRunFromBattle();
        break;
    case 3:
        gBankTarget = GetMoveTarget(gCurrentMove, 0);
        break;
    case 4:
        if (gHitMarker & ((gBitTable[gActiveBank] << 0x1C)))
            gBattleCommunication[0] = 1;
        else
            gBattleCommunication[0] = 0;
        break;
    case 5:
        gSpecialStatuses[gActiveBank].intimidatedPoke = 0;
        gSpecialStatuses[gActiveBank].traced = 0;
        break;
    case 6:
        {
            int i;
            u16* choiced_move;
            if (gBattlePartyID[0] == ((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID)
                goto ACTIVE_0;
            if (gBattlePartyID[2] != ((struct BattleStruct *) (gSharedMem + 0x0))->expGetterID)
                break;
            if (gBattlePartyID[0] == gBattlePartyID[2])
            {
                ACTIVE_0:
                    gActiveBank = 0;
            }
            else
                gActiveBank = 2;

            choiced_move = (((u16*)(&gSharedMem[0x160E8 + gActiveBank * 2])));
            for (i = 0; i < 4; i++)
            {
                if (gBattleMons[gActiveBank].moves[i] == *choiced_move)
                    break;
            }
            if (i == 4)
                *choiced_move = 0;
        }
        break;
    }

    gBattlescriptCurrInstr += 3;
}

static void atk77_setprotect(void)
{
    bool8 not_last_turn = 1;
    u16 last_move = gUnknown_02024C4C[gBankAttacker];

    if (last_move != MOVE_PROTECT && last_move != MOVE_DETECT && last_move != MOVE_ENDURE)
        gDisableStructs[gBankAttacker].protectUses = 0;
    if (gCurrentMoveTurn == (gNoOfAllBanks - 1))
        not_last_turn = 0;

    if (sProtectSuccessRates[gDisableStructs[gBankAttacker].protectUses] > Random() && not_last_turn)
    {
        if (gBattleMoves[gCurrentMove].effect == EFFECT_PROTECT)
        {
            gProtectStructs[gBankAttacker].protected = 1;
            gBattleCommunication[0x5] = 0;
        }
        if (gBattleMoves[gCurrentMove].effect == EFFECT_ENDURE)
        {
            gProtectStructs[gBankAttacker].endured = 1;
            gBattleCommunication[0x5] = 1;
        }
        gDisableStructs[gBankAttacker].protectUses++;
    }
    else
    {
        gDisableStructs[gBankAttacker].protectUses = 0;
        gBattleCommunication[0x5] = 2;
        gBattleMoveFlags |= (1 << 0);
    }

    gBattlescriptCurrInstr++;
}

static void atk78_faintifabilitynotdamp(void)
{
    if (gBattleExecBuffer)
        return;

    for (gBankTarget = 0; gBankTarget < gNoOfAllBanks; gBankTarget++)
    {
        if (gBattleMons[gBankTarget].ability == ABILITY_DAMP)
            break;
    }

    if (gBankTarget == gNoOfAllBanks)
    {
        gActiveBank = gBankAttacker;
        gBattleMoveDamage = gBattleMons[gActiveBank].hp;
        EmitHealthBarUpdate(0, 0x7FFF);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr++;

        for (gBankTarget = 0; gBankTarget < gNoOfAllBanks; gBankTarget++)
        {
            if (gBankTarget == gBankAttacker)
                continue;
            if (!(gAbsentBankFlags & gBitTable[gBankTarget]))
                break;
        }
    }
    else
    {
        gLastUsedAbility = ABILITY_DAMP;
        RecordAbilityBattle(gBankTarget, gBattleMons[gBankTarget].ability);
        gBattlescriptCurrInstr = gUnknown_081D9834;
    }
}

static void atk79_setatkhptozero(void)
{
    if (gBattleExecBuffer)
        return;

    gActiveBank = gBankAttacker;
    gBattleMons[gActiveBank].hp = 0;
    EmitSetAttributes(0, 0x2A, 0, 2, &gBattleMons[gActiveBank].hp);
    MarkBufferBankForExecution(gActiveBank);

    gBattlescriptCurrInstr++;
}

static void atk7A_jumpwhiletargetvalid(void)
{
    u8* jump_loc = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));

    if (gBattleTypeFlags & 0x0001)
    {
        for (gBankTarget++; ; gBankTarget++)
        {
            if (gBankTarget == gBankAttacker)
                continue;
            if (!(gAbsentBankFlags & gBitTable[gBankTarget]))
                break;
        }

        if (gBankTarget >= gNoOfAllBanks)
            gBattlescriptCurrInstr += 5;
        else
            gBattlescriptCurrInstr = jump_loc;
    }
    else
        gBattlescriptCurrInstr += 5;
}

static void atk7B_healhalfHP_if_possible(void)
{
    u8* fail_loc = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));

    if (((gBattlescriptCurrInstr + 5)[0]) == 1)
        gBankTarget = gBankAttacker;

    gBattleMoveDamage = gBattleMons[gBankTarget].maxHP / 2;
    if (gBattleMoveDamage == 0)
        gBattleMoveDamage = 1;
    gBattleMoveDamage *= -1;

    if (gBattleMons[gBankTarget].hp == gBattleMons[gBankTarget].maxHP)
        gBattlescriptCurrInstr = fail_loc;
    else
        gBattlescriptCurrInstr += 6;
}

static void atk7C_8025508(void)
{
    u16 r7 = (gSharedMem[0x160AC + 0 + gBankAttacker * 2]) | ((gSharedMem[0x160AC + 1 + gBankAttacker * 2]) << 8);
    u16 r6 = (gSharedMem[0x16100 + 0 + gBankAttacker * 4]) | ((gSharedMem[0x16100 + 1 + gBankAttacker * 4]) << 8);
    u16 r5 = (gSharedMem[0x16100 + 2 + gBankAttacker * 4]) | ((gSharedMem[0x16100 + 3 + gBankAttacker * 4]) << 8);

    if (r7 != 0 && r7 != 0xFFFF)
    {
        gHitMarker &= ~(0x00000400);
        gCurrentMove = r7;
        gBankTarget = GetMoveTarget(gCurrentMove, 0);
        gBattlescriptCurrInstr = gBattleScriptsEffectsTable[gBattleMoves[gCurrentMove].effect];
    }
    else if (r6 != 0 && r5 != 0 && r6 != 0xFFFF && r5 != 0xFFFF)
    {
        gHitMarker &= ~(0x00000400);
        if (Random() & 1)
            gCurrentMove = r6;
        else
            gCurrentMove = r5;
        gBankTarget = GetMoveTarget(gCurrentMove, 0);
        gBattlescriptCurrInstr = gBattleScriptsEffectsTable[gBattleMoves[gCurrentMove].effect];
    }
    else if (r6 != 0 && r6 != 0xFFFF)
    {
        gHitMarker &= ~(0x00000400);
        gCurrentMove = r6;
        gBankTarget = GetMoveTarget(gCurrentMove, 0);
        gBattlescriptCurrInstr = gBattleScriptsEffectsTable[gBattleMoves[gCurrentMove].effect];
    }
    else if (r5 != 0 && r5 != 0xFFFF)
    {
        gHitMarker &= ~(0x00000400);
        gCurrentMove = r5;
        gBankTarget = GetMoveTarget(gCurrentMove, 0);
        gBattlescriptCurrInstr = gBattleScriptsEffectsTable[gBattleMoves[gCurrentMove].effect];
    }
    else
    {
        gSpecialStatuses[gBankAttacker].flag20 = 1;
        gBattlescriptCurrInstr++;
    }
}

static void atk7D_set_rain(void)
{
    if (gBattleWeather & (((1 << 0) | (1 << 1) | (1 << 2))))
    {
        gBattleMoveFlags |= (1 << 0);
        gBattleCommunication[0x5] = 2;
    }
    else
    {
        gBattleWeather = (1 << 0);
        gBattleCommunication[0x5] = 0;
        gWishFutureKnock.weatherDuration = 5;
    }
    gBattlescriptCurrInstr++;
}

static void atk7E_setreflect(void)
{
    if (gSideAffecting[GetBankIdentity(gBankAttacker) & 1] & (1 << 0))
    {
        gBattleMoveFlags |= (1 << 0);
        gBattleCommunication[0x5] = 0;
    }
    else
    {
        gSideAffecting[GetBankIdentity(gBankAttacker) & 1] |= (1 << 0);
        gSideTimer[GetBankIdentity(gBankAttacker) & 1].reflectTimer = 5;
        if (gBattleTypeFlags & 0x0001 && CountAliveMons(1) == 2)
            gBattleCommunication[0x5] = 2;
        else
            gBattleCommunication[0x5] = 1;
    }
    gBattlescriptCurrInstr++;
}

static void atk7F_setseeded(void)
{
    if (gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5))) || gStatuses3[gBankTarget] & 0x4)
    {
        gBattleMoveFlags |= (1 << 0);
        gBattleCommunication[0x5] = 1;
    }
    else if (gBattleMons[gBankTarget].type1 == 0x0c || gBattleMons[gBankTarget].type2 == 0x0c)
    {
        gBattleMoveFlags |= (1 << 0);
        gBattleCommunication[0x5] = 2;
    }
    else
    {
        gStatuses3[gBankTarget] |= gBankAttacker;
        gStatuses3[gBankTarget] |= 0x4;
        gBattleCommunication[0x5] = 0;
    }

    gBattlescriptCurrInstr++;
}

static void atk80_manipulatedamage(void)
{
    switch (((gBattlescriptCurrInstr + 1)[0]))
    {
    case 0:
        gBattleMoveDamage *= -1;
        break;
    case 1:
        gBattleMoveDamage /= 2;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        if ((gBattleMons[gBankTarget].maxHP / 2) < gBattleMoveDamage)
            gBattleMoveDamage = gBattleMons[gBankTarget].maxHP / 2;
        break;
    case 2:
        gBattleMoveDamage *= 2;
        break;
    }

    gBattlescriptCurrInstr += 2;
}

static void atk81_setrest(void)
{
    u8* fail_loc = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    gActiveBank = gBankTarget = gBankAttacker;
    gBattleMoveDamage = gBattleMons[gBankTarget].maxHP * (-1);
    if (gBattleMons[gBankTarget].hp == gBattleMons[gBankTarget].maxHP)
        gBattlescriptCurrInstr = fail_loc;
    else
    {
        if (gBattleMons[gBankTarget].status1 & ((u8)(~0x7)))
            gBattleCommunication[0x5] = 1;
        else
            gBattleCommunication[0x5] = 0;

        gBattleMons[gBankTarget].status1 = 3;
        EmitSetAttributes(0, 0x28, 0, 4, &gBattleMons[gActiveBank].status1);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 5;
    }
}

static void atk82_jumpifnotfirstturn(void)
{
    u8* jump_loc = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));

    if (gDisableStructs[gBankAttacker].isFirstTurn)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = jump_loc;
}

static void atk83_nop(void)
{
    gBattlescriptCurrInstr++;
}

bool8 UproarWakeUpCheck(u8 bank)
{
    int i;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (!(gBattleMons[i].status2 & 0x00000070) || gBattleMons[bank].ability == ABILITY_SOUNDPROOF)
            continue;
        ((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive = i;
        if (gBankTarget == 0xFF)
            gBankTarget = i;
        else if (gBankTarget == i)
            gBattleCommunication[0x5] = 0;
        else
            gBattleCommunication[0x5] = 1;
        break;
    }
    if (i == gNoOfAllBanks)
        return 0;
    else
        return 1;
}

static void atk84_jump_if_cant_sleep(void)
{
    u8* jump_loc = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    if (UproarWakeUpCheck(gBankTarget))
        gBattlescriptCurrInstr = jump_loc;
    else if (gBattleMons[gBankTarget].ability == ABILITY_INSOMNIA || gBattleMons[gBankTarget].ability == ABILITY_VITAL_SPIRIT)
    {
        gLastUsedAbility = gBattleMons[gBankTarget].ability;
        gBattleCommunication[0x5] = 2;
        gBattlescriptCurrInstr = jump_loc;
        RecordAbilityBattle(gBankTarget, gLastUsedAbility);
    }
    else
    {
        gBattlescriptCurrInstr += 5;
    }
}

static void atk85_stockpile(void)
{
    if (gDisableStructs[gBankAttacker].stockpileCounter == 3)
    {
        gBattleMoveFlags |= (1 << 0);
        gBattleCommunication[0x5] = 1;
    }
    else
    {
        gDisableStructs[gBankAttacker].stockpileCounter++;
        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 1;
        gBattleTextBuff1[2] = 1;
        gBattleTextBuff1[3] = 1;
        gBattleTextBuff1[4] = gDisableStructs[gBankAttacker].stockpileCounter;
        gBattleTextBuff1[5] = 0xFF;
        gBattleCommunication[0x5] = 0;
    }
    gBattlescriptCurrInstr++;
}

static void atk86_stockpiletobasedamage(void)
{
    u8* jump_loc = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    if (gDisableStructs[gBankAttacker].stockpileCounter == 0)
    {
        gBattlescriptCurrInstr = jump_loc;
    }
    else
    {
        if (gBattleCommunication[6] != 1)
        {
            gBattleMoveDamage = CalculateBaseDamage(&gBattleMons[gBankAttacker], &gBattleMons[gBankTarget], gCurrentMove,
                                                    gSideAffecting[GetBankIdentity(gBankTarget) & 1], 0,
                                                    0, gBankAttacker, gBankTarget)
                                * gDisableStructs[gBankAttacker].stockpileCounter;
            ((struct BattleStruct *) (gSharedMem + 0x0))->animTurn = gDisableStructs[gBankAttacker].stockpileCounter;

            if (gProtectStructs[gBankAttacker].helpingHand)
                gBattleMoveDamage = gBattleMoveDamage * 15 / 10;
        }
        gDisableStructs[gBankAttacker].stockpileCounter = 0;
        gBattlescriptCurrInstr += 5;
    }
}

static void atk87_stockpiletohpheal(void)
{
    u8* jump_loc = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    if (gDisableStructs[gBankAttacker].stockpileCounter == 0)
    {
        gBattlescriptCurrInstr = jump_loc;
        gBattleCommunication[0x5] = 0;
    }
    else if (gBattleMons[gBankAttacker].maxHP == gBattleMons[gBankAttacker].hp)
    {
        gDisableStructs[gBankAttacker].stockpileCounter = 0;
        gBattlescriptCurrInstr = jump_loc;
        gBankTarget = gBankAttacker;
        gBattleCommunication[0x5] = 1;
    }
    else
    {
        gBattleMoveDamage = gBattleMons[gBankAttacker].maxHP / (1 << (3 - gDisableStructs[gBankAttacker].stockpileCounter));
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;
        ((struct BattleStruct *) (gSharedMem + 0x0))->animTurn = gDisableStructs[gBankAttacker].stockpileCounter;
        gDisableStructs[gBankAttacker].stockpileCounter = 0;
        gBattlescriptCurrInstr += 5;
        gBankTarget = gBankAttacker;
    }
}

static void atk88_negativedamage(void)
{
    gBattleMoveDamage = -(gHP_dealt / 2);
    if (gBattleMoveDamage == 0)
        gBattleMoveDamage = -1;
    gBattlescriptCurrInstr++;
}
# 12653 "src/battle/battle_4.c"
__attribute__((naked))
u8 ChangeStatBuffs(s8 statchanger, u8 stat, u8 flags, u8* bs_ptr)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    mov r8, r3\n    lsls r0, 24\n    lsrs r6, r0, 24\n    lsls r1, 24\n    lsrs r7, r1, 24\n    lsls r2, 24\n    lsrs r5, r2, 24\n    movs r0, 0\n    mov r9, r0\n    mov r10, r0\n    movs r0, 0x40\n    ands r0, r5\n    cmp r0, 0\n    beq _08025E54\n    ldr r0, _08025E4C @ =gActiveBank\n    ldr r1, _08025E50 @ =gBankAttacker\n    b _08025E58\n    .align 2, 0\n_08025E4C: .4byte gActiveBank\n_08025E50: .4byte gBankAttacker\n_08025E54:\n    ldr r0, _08025EF8 @ =gActiveBank\n    ldr r1, _08025EFC @ =gBankTarget\n_08025E58:\n    ldrb r1, [r1]\n    strb r1, [r0]\n    movs r0, 0xBF\n    ands r5, r0\n    movs r0, 0x80\n    ands r0, r5\n    cmp r0, 0\n    beq _08025E72\n    mov r0, r9\n    adds r0, 0x1\n    lsls r0, 24\n    lsrs r0, 24\n    mov r9, r0\n_08025E72:\n    movs r0, 0x7F\n    ands r5, r0\n    movs r0, 0x20\n    ands r0, r5\n    cmp r0, 0\n    beq _08025E88\n    mov r0, r10\n    adds r0, 0x1\n    lsls r0, 24\n    lsrs r0, 24\n    mov r10, r0\n_08025E88:\n    movs r0, 0xDF\n    ands r5, r0\n    ldr r1, _08025F00 @ =gBattleTextBuff1\n    movs r4, 0\n    movs r2, 0xFD\n    strb r2, [r1]\n    movs r0, 0x5\n    strb r0, [r1, 0x1]\n    strb r7, [r1, 0x2]\n    movs r3, 0x1\n    negs r3, r3\n    mov r12, r3\n    movs r0, 0xFF\n    strb r0, [r1, 0x3]\n    lsls r0, r6, 24\n    cmp r0, 0\n    blt _08025EAC\n    b _080261B0\n_08025EAC:\n    ldr r4, _08025F04 @ =gSideTimer\n    ldr r1, _08025EF8 @ =gActiveBank\n    ldrb r0, [r1]\n    bl GetBankIdentity\n    movs r1, 0x1\n    ands r1, r0\n    lsls r0, r1, 1\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r4\n    ldrb r0, [r0, 0x2]\n    cmp r0, 0\n    beq _08025F54\n    mov r2, r9\n    cmp r2, 0\n    bne _08025F54\n    ldr r0, _08025F08 @ =gCurrentMove\n    ldrh r0, [r0]\n    cmp r0, 0xAE\n    beq _08025F84\n    cmp r5, 0x1\n    bne _08025F74\n    ldr r4, _08025F0C @ =gSpecialStatuses\n    ldr r3, _08025EF8 @ =gActiveBank\n    ldrb r0, [r3]\n    lsls r1, r0, 2\n    adds r1, r0\n    lsls r1, 2\n    adds r1, r4\n    ldrb r0, [r1]\n    lsls r0, 31\n    cmp r0, 0\n    beq _08025F14\n    ldr r0, _08025F10 @ =gBattlescriptCurrInstr\n    mov r4, r8\n    str r4, [r0]\n    b _08025F74\n    .align 2, 0\n_08025EF8: .4byte gActiveBank\n_08025EFC: .4byte gBankTarget\n_08025F00: .4byte gBattleTextBuff1\n_08025F04: .4byte gSideTimer\n_08025F08: .4byte gCurrentMove\n_08025F0C: .4byte gSpecialStatuses\n_08025F10: .4byte gBattlescriptCurrInstr\n_08025F14:\n    mov r0, r8\n    bl b_movescr_stack_push\n    ldr r0, _08025F40 @ =gSharedMem\n    ldr r6, _08025F44 @ =gActiveBank\n    ldrb r1, [r6]\n    ldr r2, _08025F48 @ =0x00016003\n    adds r0, r2\n    strb r1, [r0]\n    ldr r1, _08025F4C @ =gBattlescriptCurrInstr\n    ldr r0, _08025F50 @ =BattleScript_MistProtected\n    str r0, [r1]\n    ldrb r1, [r6]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r4\n    ldrb r1, [r0]\n    movs r2, 0x1\n    orrs r1, r2\n    strb r1, [r0]\n    b _08025F74\n    .align 2, 0\n_08025F40: .4byte gSharedMem\n_08025F44: .4byte gActiveBank\n_08025F48: .4byte 0x00016003\n_08025F4C: .4byte gBattlescriptCurrInstr\n_08025F50: .4byte BattleScript_MistProtected\n_08025F54:\n    ldr r0, _08025F78 @ =gCurrentMove\n    ldrh r0, [r0]\n    cmp r0, 0xAE\n    beq _08025F84\n    mov r3, r10\n    cmp r3, 0x1\n    beq _08025F84\n    movs r0, 0\n    bl JumpIfMoveAffectedByProtect\n    lsls r0, 24\n    cmp r0, 0\n    beq _08025F84\n    ldr r1, _08025F7C @ =gBattlescriptCurrInstr\n    ldr r0, _08025F80 @ =BattleScript_ButItFailed\n    str r0, [r1]\n_08025F74:\n    movs r0, 0x1\n    b _080262A4\n    .align 2, 0\n_08025F78: .4byte gCurrentMove\n_08025F7C: .4byte gBattlescriptCurrInstr\n_08025F80: .4byte BattleScript_ButItFailed\n_08025F84:\n    ldr r2, _08025FCC @ =gBattleMons\n    ldr r1, _08025FD0 @ =gActiveBank\n    ldrb r3, [r1]\n    movs r4, 0x58\n    adds r0, r3, 0\n    muls r0, r4\n    adds r0, r2\n    adds r0, 0x20\n    ldrb r0, [r0]\n    mov r10, r2\n    cmp r0, 0x1D\n    beq _08025FA0\n    cmp r0, 0x49\n    bne _08026040\n_08025FA0:\n    mov r0, r9\n    cmp r0, 0\n    bne _08026040\n    ldr r0, _08025FD4 @ =gCurrentMove\n    ldrh r0, [r0]\n    cmp r0, 0xAE\n    beq _08026040\n    cmp r5, 0x1\n    bne _08025F74\n    ldr r4, _08025FD8 @ =gSpecialStatuses\n    lsls r0, r3, 2\n    adds r0, r3\n    lsls r0, 2\n    adds r0, r4\n    ldrb r0, [r0]\n    lsls r0, 31\n    cmp r0, 0\n    beq _08025FE0\n    ldr r0, _08025FDC @ =gBattlescriptCurrInstr\n    mov r1, r8\n    str r1, [r0]\n    b _08025F74\n    .align 2, 0\n_08025FCC: .4byte gBattleMons\n_08025FD0: .4byte gActiveBank\n_08025FD4: .4byte gCurrentMove\n_08025FD8: .4byte gSpecialStatuses\n_08025FDC: .4byte gBattlescriptCurrInstr\n_08025FE0:\n    mov r0, r8\n    bl b_movescr_stack_push\n    ldr r0, _08026028 @ =gSharedMem\n    ldr r2, _0802602C @ =gActiveBank\n    ldrb r1, [r2]\n    ldr r3, _08026030 @ =0x00016003\n    adds r0, r3\n    strb r1, [r0]\n    ldr r1, _08026034 @ =gBattlescriptCurrInstr\n    ldr r0, _08026038 @ =BattleScript_AbilityNoStatLoss\n    str r0, [r1]\n    ldr r1, _0802603C @ =gLastUsedAbility\n    ldrb r0, [r2]\n    movs r6, 0x58\n    muls r0, r6\n    add r0, r10\n    adds r0, 0x20\n    ldrb r0, [r0]\n    strb r0, [r1]\n    ldrb r0, [r2]\n    ldrb r1, [r1]\n    bl RecordAbilityBattle\n    ldr r0, _0802602C @ =gActiveBank\n    ldrb r1, [r0]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r4\n    ldrb r1, [r0]\n    movs r2, 0x1\n    orrs r1, r2\n    strb r1, [r0]\n    b _08025F74\n    .align 2, 0\n_08026028: .4byte gSharedMem\n_0802602C: .4byte gActiveBank\n_08026030: .4byte 0x00016003\n_08026034: .4byte gBattlescriptCurrInstr\n_08026038: .4byte BattleScript_AbilityNoStatLoss\n_0802603C: .4byte gLastUsedAbility\n_08026040:\n    ldr r1, _08026090 @ =gActiveBank\n    ldrb r0, [r1]\n    movs r4, 0x58\n    muls r0, r4\n    add r0, r10\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x33\n    bne _080260A8\n    mov r2, r9\n    cmp r2, 0\n    bne _080260A8\n    cmp r7, 0x6\n    bne _080260A8\n    cmp r5, 0x1\n    bne _08025F74\n    mov r0, r8\n    bl b_movescr_stack_push\n    ldr r0, _08026094 @ =gSharedMem\n    ldr r3, _08026090 @ =gActiveBank\n    ldrb r1, [r3]\n    ldr r6, _08026098 @ =0x00016003\n    adds r0, r6\n    strb r1, [r0]\n    ldr r1, _0802609C @ =gBattlescriptCurrInstr\n    ldr r0, _080260A0 @ =BattleScript_AbilityNoSpecificStatLoss\n    str r0, [r1]\n    ldr r1, _080260A4 @ =gLastUsedAbility\n    ldrb r0, [r3]\n    muls r0, r4\n    add r0, r10\n    adds r0, 0x20\n    ldrb r0, [r0]\n    strb r0, [r1]\n    ldrb r0, [r3]\n    ldrb r1, [r1]\n    bl RecordAbilityBattle\n    b _08025F74\n    .align 2, 0\n_08026090: .4byte gActiveBank\n_08026094: .4byte gSharedMem\n_08026098: .4byte 0x00016003\n_0802609C: .4byte gBattlescriptCurrInstr\n_080260A0: .4byte BattleScript_AbilityNoSpecificStatLoss\n_080260A4: .4byte gLastUsedAbility\n_080260A8:\n    ldr r1, _080260FC @ =gActiveBank\n    ldrb r0, [r1]\n    movs r4, 0x58\n    muls r0, r4\n    add r0, r10\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x34\n    bne _08026114\n    mov r2, r9\n    cmp r2, 0\n    bne _08026114\n    cmp r7, 0x1\n    bne _08026114\n    cmp r5, 0x1\n    beq _080260CA\n    b _08025F74\n_080260CA:\n    mov r0, r8\n    bl b_movescr_stack_push\n    ldr r0, _08026100 @ =gSharedMem\n    ldr r3, _080260FC @ =gActiveBank\n    ldrb r1, [r3]\n    ldr r6, _08026104 @ =0x00016003\n    adds r0, r6\n    strb r1, [r0]\n    ldr r1, _08026108 @ =gBattlescriptCurrInstr\n    ldr r0, _0802610C @ =BattleScript_AbilityNoSpecificStatLoss\n    str r0, [r1]\n    ldr r1, _08026110 @ =gLastUsedAbility\n    ldrb r0, [r3]\n    muls r0, r4\n    add r0, r10\n    adds r0, 0x20\n    ldrb r0, [r0]\n    strb r0, [r1]\n    ldrb r0, [r3]\n    ldrb r1, [r1]\n    bl RecordAbilityBattle\n    b _08025F74\n    .align 2, 0\n_080260FC: .4byte gActiveBank\n_08026100: .4byte gSharedMem\n_08026104: .4byte 0x00016003\n_08026108: .4byte gBattlescriptCurrInstr\n_0802610C: .4byte BattleScript_AbilityNoSpecificStatLoss\n_08026110: .4byte gLastUsedAbility\n_08026114:\n    ldr r0, _080261A0 @ =gActiveBank\n    ldrb r1, [r0]\n    movs r0, 0x58\n    muls r0, r1\n    add r0, r10\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x13\n    bne _0802612C\n    cmp r5, 0\n    bne _0802612C\n    b _08025F74\n_0802612C:\n    lsls r0, r6, 24\n    asrs r0, 28\n    movs r1, 0x7\n    ands r0, r1\n    negs r0, r0\n    lsls r0, 24\n    ldr r3, _080261A4 @ =gBattleTextBuff2\n    movs r4, 0\n    movs r1, 0xFD\n    strb r1, [r3]\n    movs r2, 0x1\n    lsrs r6, r0, 24\n    asrs r0, 24\n    subs r1, 0xFF\n    cmp r0, r1\n    bne _08026156\n    strb r4, [r3, 0x1]\n    movs r0, 0xD3\n    strb r0, [r3, 0x2]\n    strb r4, [r3, 0x3]\n    movs r2, 0x4\n_08026156:\n    adds r0, r2, r3\n    strb r4, [r0]\n    adds r2, 0x1\n    adds r1, r2, r3\n    movs r0, 0xD4\n    strb r0, [r1]\n    adds r2, 0x1\n    adds r0, r2, r3\n    strb r4, [r0]\n    adds r2, 0x1\n    adds r1, r2, r3\n    movs r0, 0xFF\n    strb r0, [r1]\n    ldr r1, _080261A0 @ =gActiveBank\n    ldrb r2, [r1]\n    movs r0, 0x58\n    muls r0, r2\n    adds r0, r7, r0\n    mov r1, r10\n    adds r1, 0x18\n    adds r0, r1\n    ldrb r0, [r0]\n    lsls r0, 24\n    asrs r0, 24\n    cmp r0, 0\n    beq _08026206\n    movs r1, 0\n    ldr r0, _080261A8 @ =gBankTarget\n    ldrb r0, [r0]\n    ldr r3, _080261AC @ =gBattleCommunication\n    mov r8, r3\n    cmp r0, r2\n    bne _0802619A\n    movs r1, 0x1\n_0802619A:\n    mov r4, r8\n    strb r1, [r4, 0x5]\n    b _08026234\n    .align 2, 0\n_080261A0: .4byte gActiveBank\n_080261A4: .4byte gBattleTextBuff2\n_080261A8: .4byte gBankTarget\n_080261AC: .4byte gBattleCommunication\n_080261B0:\n    asrs r6, r0, 28\n    movs r0, 0x7\n    ands r6, r0\n    ldr r3, _08026210 @ =gBattleTextBuff2\n    strb r2, [r3]\n    movs r2, 0x1\n    cmp r6, 0x2\n    bne _080261CA\n    strb r4, [r3, 0x1]\n    movs r0, 0xD1\n    strb r0, [r3, 0x2]\n    strb r4, [r3, 0x3]\n    movs r2, 0x4\n_080261CA:\n    adds r0, r2, r3\n    strb r4, [r0]\n    adds r2, 0x1\n    adds r1, r2, r3\n    movs r0, 0xD2\n    strb r0, [r1]\n    adds r2, 0x1\n    adds r0, r2, r3\n    strb r4, [r0]\n    adds r2, 0x1\n    adds r1, r2, r3\n    ldrb r0, [r1]\n    mov r2, r12\n    orrs r0, r2\n    strb r0, [r1]\n    ldr r2, _08026214 @ =gBattleMons\n    ldr r4, _08026218 @ =gActiveBank\n    ldrb r3, [r4]\n    movs r0, 0x58\n    muls r0, r3\n    adds r0, r7, r0\n    adds r1, r2, 0\n    adds r1, 0x18\n    adds r0, r1\n    ldrb r0, [r0]\n    lsls r0, 24\n    asrs r0, 24\n    mov r10, r2\n    cmp r0, 0xC\n    bne _08026220\n_08026206:\n    ldr r1, _0802621C @ =gBattleCommunication\n    movs r0, 0x2\n    strb r0, [r1, 0x5]\n    mov r8, r1\n    b _08026234\n    .align 2, 0\n_08026210: .4byte gBattleTextBuff2\n_08026214: .4byte gBattleMons\n_08026218: .4byte gActiveBank\n_0802621C: .4byte gBattleCommunication\n_08026220:\n    movs r1, 0\n    ldr r0, _080262B4 @ =gBankTarget\n    ldrb r0, [r0]\n    ldr r2, _080262B8 @ =gBattleCommunication\n    mov r8, r2\n    cmp r0, r3\n    bne _08026230\n    movs r1, 0x1\n_08026230:\n    mov r3, r8\n    strb r1, [r3, 0x5]\n_08026234:\n    ldr r2, _080262BC @ =gActiveBank\n    ldrb r0, [r2]\n    movs r4, 0x58\n    adds r1, r0, 0\n    muls r1, r4\n    adds r1, r7, r1\n    mov r3, r10\n    adds r3, 0x18\n    adds r1, r3\n    lsls r0, r6, 24\n    asrs r0, 24\n    ldrb r6, [r1]\n    adds r0, r6\n    strb r0, [r1]\n    ldrb r0, [r2]\n    muls r0, r4\n    adds r0, r7, r0\n    adds r1, r0, r3\n    movs r0, 0\n    ldrsb r0, [r1, r0]\n    cmp r0, 0\n    bge _08026264\n    movs r0, 0\n    strb r0, [r1]\n_08026264:\n    ldr r1, _080262BC @ =gActiveBank\n    ldrb r0, [r1]\n    muls r0, r4\n    adds r0, r7, r0\n    adds r1, r0, r3\n    movs r0, 0\n    ldrsb r0, [r1, r0]\n    cmp r0, 0xC\n    ble _0802627A\n    movs r0, 0xC\n    strb r0, [r1]\n_0802627A:\n    mov r2, r8\n    ldrb r0, [r2, 0x5]\n    cmp r0, 0x2\n    bne _080262A2\n    movs r3, 0x1\n    ands r3, r5\n    cmp r3, 0\n    beq _08026294\n    ldr r0, _080262C0 @ =gBattleMoveFlags\n    ldrb r1, [r0]\n    movs r2, 0x1\n    orrs r1, r2\n    strb r1, [r0]\n_08026294:\n    mov r4, r8\n    ldrb r0, [r4, 0x5]\n    cmp r0, 0x2\n    bne _080262A2\n    cmp r3, 0\n    bne _080262A2\n    b _08025F74\n_080262A2:\n    movs r0, 0\n_080262A4:\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r1}\n    bx r1\n    .align 2, 0\n_080262B4: .4byte gBankTarget\n_080262B8: .4byte gBattleCommunication\n_080262BC: .4byte gActiveBank\n_080262C0: .4byte gBattleMoveFlags\n        .syntax divided");
# 13228 "src/battle/battle_4.c"
}


static void atk89_statbuffchange(void)
{
    u8* jump_loc = (u8*) ((gBattlescriptCurrInstr + 2)[0] | ((gBattlescriptCurrInstr + 2)[1] << 8) | ((gBattlescriptCurrInstr + 2)[2] << 16) | ((gBattlescriptCurrInstr + 2)[3] << 24));
    if (ChangeStatBuffs(((struct BattleStruct *) (gSharedMem + 0x0))->statChanger & 0xF0, ((struct BattleStruct *) (gSharedMem + 0x0))->statChanger & 0xF, ((gBattlescriptCurrInstr + 1)[0]), jump_loc) == 0)
        gBattlescriptCurrInstr += 6;
}

static void atk8A_normalisebuffs(void)
{
    int i, j;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        for (j = 0; j < 8; j++)
        {
            gBattleMons[i].statStages[j] = 6;
        }
    }
    gBattlescriptCurrInstr++;
}

static void atk8B_setbide(void)
{
    gBattleMons[gBankAttacker].status2 |= 0x00001000;
    gLockedMove[gBankAttacker] = gCurrentMove;
    gTakenDmg[gBankAttacker] = 0;
    gBattleMons[gBankAttacker].status2 |= (0x00000300 - 0x100);
    gBattlescriptCurrInstr++;
}

static void atk8C_confuseifrepeatingattackends(void)
{
    if (!(gBattleMons[gBankAttacker].status2 & 0x00000C00))
        gBattleCommunication[0x3] = 0x75;
    gBattlescriptCurrInstr++;
}

static void atk8D_setmultihit_counter(void)
{
    if (((gBattlescriptCurrInstr + 1)[0]))
        gMultiHitCounter = ((gBattlescriptCurrInstr + 1)[0]);
    else
    {
        gMultiHitCounter = Random() & 3;
        if (gMultiHitCounter > 1)
            gMultiHitCounter = (Random() & 3) + 2;
        else
            gMultiHitCounter += 2;
    }
    gBattlescriptCurrInstr += 2;
}

static void atk8E_prepare_multihit(void)
{
    (gSharedMem[0x160E0 + 0]) = 0xFD;
    (gSharedMem[0x160E0 + 1]) = 1;
    (gSharedMem[0x160E0 + 2]) = 1;
    (gSharedMem[0x160E0 + 3]) = 1;
    (gSharedMem[0x160E0 + 4]) = 0;
    (gSharedMem[0x160E0 + 5]) = 0xFF;
    gBattlescriptCurrInstr++;
}

static bool8 sub_80264C0(void)
{
    if (gBattleMons[gBankAttacker].level >= gBattleMons[gBankTarget].level)
    {
        (gSharedMem[0x16064 + gBankTarget]) = gBattlePartyID[gBankTarget];
    }
    else
    {
        u16 random = Random() & 0xFF;
        if ((u32)((random * (gBattleMons[gBankAttacker].level + gBattleMons[gBankTarget].level) >> 8) + 1) <= (gBattleMons[gBankTarget].level / 4))
        {
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
            return 0;
        }
        (gSharedMem[0x16064 + gBankTarget]) = gBattlePartyID[gBankTarget];
    }
    gBattlescriptCurrInstr = gUnknown_081D90FC;
    return 1;
}

static void atk8F_forcerandomswitch(void)
{
    if ((gBattleTypeFlags & 0x0008))
    {
        u8 i;
        struct Pokemon* party;
        u8 valid;
        u8 val;
        if (!GetBankSide(gBankTarget))
            party = gPlayerParty;
        else
            party = gEnemyParty;

        if (gBattleTypeFlags & 0x0040)
        {
            valid = 0;
            val = 0;
            if (sub_803FBFC(sub_803FC34(gBankTarget)) == 1)
                val = 3;
            for (i = val; i < val + 3; i++)
            {
                if (GetMonData(&party[i], 11) != SPECIES_NONE
                 && !GetMonData(&party[i], 45)
                 && GetMonData(&party[i], 57) != 0)
                    valid++;
            }
        }
        else
        {
            valid = 0;
            for (i = 0; i < 6; i++)
            {
                if (GetMonData(&party[i], 11) != SPECIES_NONE
                 && !GetMonData(&party[i], 45)
                 && GetMonData(&party[i], 57) != 0)
                    valid++;
            }
        }

        if ((valid < 2 && (gBattleTypeFlags & (0x0001 | 0x0040)) != 0x0001)
         || (valid < 3 && (gBattleTypeFlags & 0x0001) && !(gBattleTypeFlags & 0x0040)))
        {
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
        }
        else if (sub_80264C0())
        {

            if (gBattleTypeFlags & 0x0040)
            {
                do
                {
                    val = Random() % 3;
                    if (sub_803FBFC(sub_803FC34(gBankTarget)) == 1)
                        i = val + 3;
                    else
                        i = val;
                } while (i == gBattlePartyID[gBankTarget] || i == gBattlePartyID[gBankTarget ^ 2] || !(((GetMonData(&party[i], 11) && GetMonData(&party[i], 45) != 1 && GetMonData(&party[i], 57)))));
            }
            else
            {
                if (gBattleTypeFlags & 0x0001)
                {
                    do
                    {
                        i = Random() % 6;
                    } while (i == gBattlePartyID[gBankTarget] || i == gBattlePartyID[gBankTarget ^ 2] || !(((GetMonData(&party[i], 11) && GetMonData(&party[i], 45) != 1 && GetMonData(&party[i], 57)))));
                }
                else
                {
                    do
                    {
                        i = Random() % 6;
                    } while (i == gBattlePartyID[gBankTarget] || !(((GetMonData(&party[i], 11) && GetMonData(&party[i], 45) != 1 && GetMonData(&party[i], 57)))));
                }
            }
            (gSharedMem[0x16068 + gBankTarget]) = i;
            if (!IsLinkDoubleBattle())
                sub_8012258(gBankTarget);
            sub_8094B6C(gBankTarget, i, 0);
            sub_8094B6C(gBankTarget ^ 2, i, 1);

        }
    }
    else
    {
        sub_80264C0();
    }
}

static void atk90_conversion_type_change(void)
{

    u8 valid_moves = 0;
    u8 checked_move;
    u8 move_type;
    while (valid_moves < 4)
    {
        if (gBattleMons[gBankAttacker].moves[valid_moves] == 0)
            break;
        valid_moves++;
    }

    for (checked_move = 0; checked_move < valid_moves; checked_move++)
    {
        move_type = gBattleMoves[gBattleMons[gBankAttacker].moves[checked_move]].type;
        if (move_type == 0x09)
        {
            if (gBattleMons[gBankAttacker].type1 == 0x07 || gBattleMons[gBankAttacker].type2 == 0x07)
                move_type = 0x07;
            else
                move_type = 0x00;
        }
        if (move_type != gBattleMons[gBankAttacker].type1 && move_type != gBattleMons[gBankAttacker].type2)
            break;
    }

    if (checked_move == valid_moves)
    {
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
    else
    {
        do
        {

            while ((checked_move = Random() & 3) >= valid_moves);

            move_type = gBattleMoves[gBattleMons[gBankAttacker].moves[checked_move]].type;
            if (move_type == 0x09)
            {
                if (gBattleMons[gBankAttacker].type1 == 0x07 || gBattleMons[gBankAttacker].type2 == 0x07)
                    move_type = 0x07;
                else
                    move_type = 0x00;
            }
        } while (move_type == gBattleMons[gBankAttacker].type1 || move_type == gBattleMons[gBankAttacker].type2);

        gBattleMons[gBankAttacker].type1 = move_type;
        gBattleMons[gBankAttacker].type2 = move_type;

        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 3;
        gBattleTextBuff1[2] = move_type;
        gBattleTextBuff1[3] = 0xFF;

        gBattlescriptCurrInstr += 5;
    }
}

static void atk91_givepaydaymoney(void)
{
    if (!(gBattleTypeFlags & 0x0002) && gPaydayMoney)
    {
        AddMoney(&gSaveBlock1.money, gPaydayMoney * ((struct BattleStruct *) (gSharedMem + 0x0))->moneyMultiplier);
        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 1;
        gBattleTextBuff1[2] = 2;
        gBattleTextBuff1[3] = 5;
        gBattleTextBuff1[4] = gPaydayMoney;
        gBattleTextBuff1[5] = (( (u8) (((u16)(gPaydayMoney) & (0x0000FF00)) >> 0x08)));
        gBattleTextBuff1[6] = 0xFF;
        b_movescr_stack_push(gBattlescriptCurrInstr + 1);
        gBattlescriptCurrInstr = gUnknown_081D95DB;
    }
    else
        gBattlescriptCurrInstr++;
}

static void atk92_setlightscreen(void)
{
    if (gSideAffecting[GetBankIdentity(gBankAttacker) & 1] & (1 << 1))
    {
        gBattleMoveFlags |= (1 << 0);
        gBattleCommunication[0x5] = 0;
    }
    else
    {
        gSideAffecting[GetBankIdentity(gBankAttacker) & 1] |= (1 << 1);
        gSideTimer[GetBankIdentity(gBankAttacker) & 1].lightscreenTimer = 5;
        if (gBattleTypeFlags & 0x0001 && CountAliveMons(1) == 2)
            gBattleCommunication[0x5] = 4;
        else
            gBattleCommunication[0x5] = 3;
    }
    gBattlescriptCurrInstr++;
}
# 13554 "src/battle/battle_4.c"
__attribute((naked))
static void atk93_ko_move(void)
{
    asm(".syntax unified\n        push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    ldr r7, _08026BA8 @ =gBattleMons\n    ldr r6, _08026BAC @ =gBankTarget\n    ldrb r2, [r6]\n    movs r5, 0x58\n    adds r0, r2, 0\n    muls r0, r5\n    adds r1, r0, r7\n    ldrh r0, [r1, 0x2E]\n    cmp r0, 0xAF\n    bne _08026BB4\n    ldr r1, _08026BB0 @ =gEnigmaBerries\n    lsls r0, r2, 3\n    subs r0, r2\n    lsls r0, 2\n    adds r0, r1\n    ldrb r4, [r0, 0x7]\n    ldrb r6, [r0, 0x1A]\n    b _08026BCE\n    .align 2, 0\n_08026BA8: .4byte gBattleMons\n_08026BAC: .4byte gBankTarget\n_08026BB0: .4byte gEnigmaBerries\n_08026BB4:\n    ldrh r0, [r1, 0x2E]\n    bl ItemId_GetHoldEffect\n    lsls r0, 24\n    lsrs r4, r0, 24\n    ldrb r0, [r6]\n    muls r0, r5\n    adds r0, r7\n    ldrh r0, [r0, 0x2E]\n    bl ItemId_GetHoldEffectParam\n    lsls r0, 24\n    lsrs r6, r0, 24\n_08026BCE:\n    ldr r1, _08026C4C @ =gStringBank\n    ldr r5, _08026C50 @ =gBankTarget\n    ldrb r0, [r5]\n    strb r0, [r1]\n    cmp r4, 0x27\n    bne _08026C0C\n    bl Random\n    lsls r0, 16\n    lsrs r0, 16\n    movs r1, 0x64\n    bl __umodsi3\n    lsls r0, 16\n    lsrs r0, 16\n    cmp r0, r6\n    bcs _08026C0C\n    ldrb r0, [r5]\n    movs r1, 0x27\n    bl RecordItemBattle\n    ldr r2, _08026C54 @ =gSpecialStatuses\n    ldrb r1, [r5]\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r2\n    ldrb r1, [r0]\n    movs r2, 0x80\n    orrs r1, r2\n    strb r1, [r0]\n_08026C0C:\n    ldr r0, _08026C58 @ =gBattleMons\n    mov r8, r0\n    ldr r1, _08026C50 @ =gBankTarget\n    ldrb r2, [r1]\n    movs r6, 0x58\n    adds r0, r2, 0\n    muls r0, r6\n    mov r3, r8\n    adds r5, r0, r3\n    adds r0, r5, 0\n    adds r0, 0x20\n    ldrb r3, [r0]\n    mov r10, r8\n    cmp r3, 0x5\n    bne _08026C6C\n    ldr r2, _08026C5C @ =gBattleMoveFlags\n    ldrb r0, [r2]\n    movs r1, 0x1\n    orrs r0, r1\n    strb r0, [r2]\n    ldr r0, _08026C60 @ =gLastUsedAbility\n    strb r3, [r0]\n    ldr r1, _08026C64 @ =gBattlescriptCurrInstr\n    ldr r0, _08026C68 @ =gUnknown_081D9826\n    str r0, [r1]\n    ldr r1, _08026C50 @ =gBankTarget\n    ldrb r0, [r1]\n    movs r1, 0x5\n    bl RecordAbilityBattle\n    b _08026E40\n    .align 2, 0\n_08026C4C: .4byte gStringBank\n_08026C50: .4byte gBankTarget\n_08026C54: .4byte gSpecialStatuses\n_08026C58: .4byte gBattleMons\n_08026C5C: .4byte gBattleMoveFlags\n_08026C60: .4byte gLastUsedAbility\n_08026C64: .4byte gBattlescriptCurrInstr\n_08026C68: .4byte gUnknown_081D9826\n_08026C6C:\n    ldr r1, _08026CE0 @ =gStatuses3\n    lsls r0, r2, 2\n    adds r0, r1\n    ldr r0, [r0]\n    movs r1, 0x18\n    ands r0, r1\n    cmp r0, 0\n    bne _08026CF4\n    ldr r1, _08026CE4 @ =gBattleMoves\n    ldr r0, _08026CE8 @ =gCurrentMove\n    ldrh r0, [r0]\n    lsls r2, r0, 1\n    adds r2, r0\n    lsls r2, 2\n    adds r2, r1\n    ldr r7, _08026CEC @ =gBankAttacker\n    ldrb r0, [r7]\n    muls r0, r6\n    add r0, r10\n    adds r0, 0x2A\n    ldrb r0, [r0]\n    adds r1, r5, 0\n    adds r1, 0x2A\n    ldrb r1, [r1]\n    subs r0, r1\n    ldrb r2, [r2, 0x3]\n    adds r0, r2\n    lsls r0, 16\n    lsrs r4, r0, 16\n    bl Random\n    lsls r0, 16\n    lsrs r0, 16\n    movs r1, 0x64\n    bl __umodsi3\n    lsls r0, 16\n    lsrs r0, 16\n    adds r0, 0x1\n    cmp r0, r4\n    bge _08026CDC\n    ldrb r0, [r7]\n    adds r1, r0, 0\n    muls r1, r6\n    add r1, r10\n    adds r1, 0x2A\n    ldr r2, _08026CF0 @ =gBankTarget\n    ldrb r0, [r2]\n    muls r0, r6\n    add r0, r10\n    adds r0, 0x2A\n    ldrb r1, [r1]\n    movs r4, 0x1\n    ldrb r0, [r0]\n    cmp r1, r0\n    bcs _08026D20\n_08026CDC:\n    mov r10, r8\n    b _08026DE0\n    .align 2, 0\n_08026CE0: .4byte gStatuses3\n_08026CE4: .4byte gBattleMoves\n_08026CE8: .4byte gCurrentMove\n_08026CEC: .4byte gBankAttacker\n_08026CF0: .4byte gBankTarget\n_08026CF4:\n    ldr r0, _08026D4C @ =gDisableStructs\n    lsls r1, r2, 3\n    subs r1, r2\n    lsls r1, 2\n    adds r1, r0\n    ldr r2, _08026D50 @ =gBankAttacker\n    ldrb r0, [r1, 0x15]\n    movs r4, 0\n    ldrb r3, [r2]\n    cmp r0, r3\n    bne _08026D20\n    ldrb r0, [r2]\n    muls r0, r6\n    add r0, r10\n    adds r0, 0x2A\n    adds r1, r5, 0\n    adds r1, 0x2A\n    ldrb r0, [r0]\n    ldrb r1, [r1]\n    cmp r0, r1\n    bcc _08026D20\n    movs r4, 0x1\n_08026D20:\n    cmp r4, 0\n    beq _08026DE0\n    ldr r0, _08026D54 @ =gProtectStructs\n    ldr r1, _08026D58 @ =gBankTarget\n    ldrb r2, [r1]\n    lsls r1, r2, 4\n    adds r1, r0\n    ldrb r0, [r1]\n    lsls r0, 30\n    cmp r0, 0\n    bge _08026D64\n    ldr r1, _08026D5C @ =gBattleMoveDamage\n    movs r0, 0x58\n    muls r0, r2\n    add r0, r10\n    ldrh r0, [r0, 0x28]\n    subs r0, 0x1\n    str r0, [r1]\n    ldr r2, _08026D60 @ =gBattleMoveFlags\n    ldrb r0, [r2]\n    movs r1, 0x40\n    b _08026DC6\n    .align 2, 0\n_08026D4C: .4byte gDisableStructs\n_08026D50: .4byte gBankAttacker\n_08026D54: .4byte gProtectStructs\n_08026D58: .4byte gBankTarget\n_08026D5C: .4byte gBattleMoveDamage\n_08026D60: .4byte gBattleMoveFlags\n_08026D64:\n    ldr r0, _08026DA0 @ =gSpecialStatuses\n    lsls r1, r2, 2\n    adds r1, r2\n    lsls r1, 2\n    adds r1, r0\n    ldrb r0, [r1]\n    lsrs r0, 7\n    cmp r0, 0\n    beq _08026DB4\n    ldr r1, _08026DA4 @ =gBattleMoveDamage\n    movs r3, 0x58\n    adds r0, r2, 0\n    muls r0, r3\n    add r0, r10\n    ldrh r0, [r0, 0x28]\n    subs r0, 0x1\n    str r0, [r1]\n    ldr r2, _08026DA8 @ =gBattleMoveFlags\n    ldrb r0, [r2]\n    movs r1, 0x80\n    orrs r0, r1\n    strb r0, [r2]\n    ldr r1, _08026DAC @ =gLastUsedItem\n    ldr r2, _08026DB0 @ =gBankTarget\n    ldrb r0, [r2]\n    muls r0, r3\n    add r0, r10\n    ldrh r0, [r0, 0x2E]\n    strh r0, [r1]\n    b _08026DCA\n    .align 2, 0\n_08026DA0: .4byte gSpecialStatuses\n_08026DA4: .4byte gBattleMoveDamage\n_08026DA8: .4byte gBattleMoveFlags\n_08026DAC: .4byte gLastUsedItem\n_08026DB0: .4byte gBankTarget\n_08026DB4:\n    ldr r1, _08026DD4 @ =gBattleMoveDamage\n    movs r0, 0x58\n    muls r0, r2\n    add r0, r10\n    ldrh r0, [r0, 0x28]\n    str r0, [r1]\n    ldr r2, _08026DD8 @ =gBattleMoveFlags\n    ldrb r0, [r2]\n    movs r1, 0x10\n_08026DC6:\n    orrs r0, r1\n    strb r0, [r2]\n_08026DCA:\n    ldr r1, _08026DDC @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x5\n    str r0, [r1]\n    b _08026E40\n    .align 2, 0\n_08026DD4: .4byte gBattleMoveDamage\n_08026DD8: .4byte gBattleMoveFlags\n_08026DDC: .4byte gBattlescriptCurrInstr\n_08026DE0:\n    ldr r2, _08026E10 @ =gBattleMoveFlags\n    ldrb r0, [r2]\n    movs r1, 0x1\n    orrs r0, r1\n    strb r0, [r2]\n    ldr r0, _08026E14 @ =gBankAttacker\n    ldrb r0, [r0]\n    movs r2, 0x58\n    adds r1, r0, 0\n    muls r1, r2\n    add r1, r10\n    adds r1, 0x2A\n    ldr r3, _08026E18 @ =gBankTarget\n    ldrb r0, [r3]\n    muls r0, r2\n    add r0, r10\n    adds r0, 0x2A\n    ldrb r1, [r1]\n    ldrb r0, [r0]\n    cmp r1, r0\n    bcc _08026E20\n    ldr r1, _08026E1C @ =gBattleCommunication\n    movs r0, 0\n    b _08026E24\n    .align 2, 0\n_08026E10: .4byte gBattleMoveFlags\n_08026E14: .4byte gBankAttacker\n_08026E18: .4byte gBankTarget\n_08026E1C: .4byte gBattleCommunication\n_08026E20:\n    ldr r1, _08026E50 @ =gBattleCommunication\n    movs r0, 0x1\n_08026E24:\n    strb r0, [r1, 0x5]\n    ldr r3, _08026E54 @ =gBattlescriptCurrInstr\n    ldr r2, [r3]\n    ldrb r1, [r2, 0x1]\n    ldrb r0, [r2, 0x2]\n    lsls r0, 8\n    orrs r1, r0\n    ldrb r0, [r2, 0x3]\n    lsls r0, 16\n    orrs r1, r0\n    ldrb r0, [r2, 0x4]\n    lsls r0, 24\n    orrs r1, r0\n    str r1, [r3]\n_08026E40:\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08026E50: .4byte gBattleCommunication\n_08026E54: .4byte gBattlescriptCurrInstr\n        .syntax divided");
# 13903 "src/battle/battle_4.c"
}


static void atk94_gethalfcurrentenemyhp(void)
{
    gBattleMoveDamage = gBattleMons[gBankTarget].hp / 2;
    if (gBattleMoveDamage == 0)
        gBattleMoveDamage = 1;
    gBattlescriptCurrInstr++;
}

static void atk95_setsandstorm(void)
{
    if (gBattleWeather & (((1 << 3) | (1 << 4))))
    {
        gBattleMoveFlags |= (1 << 0);
        gBattleCommunication[0x5] = 2;
    }
    else
    {
        gBattleWeather = (1 << 3);
        gBattleCommunication[0x5] = 3;
        gWishFutureKnock.weatherDuration = 5;
    }
    gBattlescriptCurrInstr++;
}

static void atk96_weatherdamage(void)
{
    if (((!AbilityBattleEffects(0x13, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(0x13, 0, ABILITY_AIR_LOCK, 0, 0))))
    {
        if (gBattleWeather & (((1 << 3) | (1 << 4))))
        {
            if (gBattleMons[gBankAttacker].type1 != 0x05 && gBattleMons[gBankAttacker].type1 != 0x08 && gBattleMons[gBankAttacker].type1 != 0x04
             && gBattleMons[gBankAttacker].type2 != 0x05 && gBattleMons[gBankAttacker].type2 != 0x08 && gBattleMons[gBankAttacker].type2 != 0x04
             && gBattleMons[gBankAttacker].ability != ABILITY_SAND_VEIL && !(gStatuses3[gBankAttacker] & 0x80) && !(gStatuses3[gBankAttacker] & 0x40000))
            {
                gBattleMoveDamage = gBattleMons[gBankAttacker].maxHP / 16;
                if (gBattleMoveDamage == 0)
                    gBattleMoveDamage = 1;
            }
            else
            {
                gBattleMoveDamage = 0;
            }
        }
        if (gBattleWeather & (1 << 7))
        {
            if (gBattleMons[gBankAttacker].type1 != 0x0f && gBattleMons[gBankAttacker].type2 != 0x0f && !(gStatuses3[gBankAttacker] & 0x80) && !(gStatuses3[gBankAttacker] & 0x40000))
            {
                gBattleMoveDamage = gBattleMons[gBankAttacker].maxHP / 16;
                if (gBattleMoveDamage == 0)
                    gBattleMoveDamage = 1;
            }
            else
            {
                gBattleMoveDamage = 0;
            }
        }
    }
    else
        gBattleMoveDamage = 0;

    if (gAbsentBankFlags & gBitTable[gBankAttacker])
        gBattleMoveDamage = 0;

    gBattlescriptCurrInstr++;
}

static void atk97_try_infatuation(void)
{
    struct Pokemon *attacker, *target;
    u16 atk_species, def_species;
    u32 atk_pid, def_pid;
    if (!GetBankSide(gBankAttacker))
        attacker = &gPlayerParty[gBattlePartyID[gBankAttacker]];
    else
        attacker = &gEnemyParty[gBattlePartyID[gBankAttacker]];

    if (!GetBankSide(gBankTarget))
        target = &gPlayerParty[gBattlePartyID[gBankTarget]];
    else
        target = &gEnemyParty[gBattlePartyID[gBankTarget]];

    atk_species = GetMonData(attacker, 11);
    atk_pid = GetMonData(attacker, 0);

    def_species = GetMonData(target, 11);
    def_pid = GetMonData(target, 0);

    if (gBattleMons[gBankTarget].ability == ABILITY_OBLIVIOUS)
    {
        gBattlescriptCurrInstr = BattleScript_ObliviousPreventsAttraction;
        gLastUsedAbility = ABILITY_OBLIVIOUS;
        RecordAbilityBattle(gBankTarget, ABILITY_OBLIVIOUS);
    }
    else
    {
        if (GetGenderFromSpeciesAndPersonality(atk_species, atk_pid) == GetGenderFromSpeciesAndPersonality(def_species, def_pid)
            || gStatuses3[gBankTarget] & ((0x80 | 0x40 | 0x40000)) || gBattleMons[gBankTarget].status2 & 0x000F0000 || GetGenderFromSpeciesAndPersonality(atk_species, atk_pid) == 0xFF
            || GetGenderFromSpeciesAndPersonality(def_species, def_pid) == 0xFF)
            {
                gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
            }
        else
        {
            gBattleMons[gBankTarget].status2 |= (gBitTable[gBankAttacker] << 16);
            gBattlescriptCurrInstr += 5;
        }
    }
}

static void atk98_status_icon_update(void)
{
    if (gBattleExecBuffer)
        return;

    if (((gBattlescriptCurrInstr + 1)[0]) != 4)
    {
        gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
        EmitStatusIconUpdate(0, gBattleMons[gActiveBank].status1, gBattleMons[gActiveBank].status2);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 2;
    }
    else
    {
        gActiveBank = gBankAttacker;
        if (!(gAbsentBankFlags & gBitTable[gActiveBank]))
        {
            EmitStatusIconUpdate(0, gBattleMons[gActiveBank].status1, gBattleMons[gActiveBank].status2);
            MarkBufferBankForExecution(gActiveBank);
        }
        if ((gBattleTypeFlags & 0x0001))
        {
            gActiveBank = GetBankByPlayerAI(GetBankIdentity(gBankAttacker) ^ 2);
            if (!(gAbsentBankFlags & gBitTable[gActiveBank]))
            {
                EmitStatusIconUpdate(0, gBattleMons[gActiveBank].status1, gBattleMons[gActiveBank].status2);
                MarkBufferBankForExecution(gActiveBank);
            }
        }
        gBattlescriptCurrInstr += 2;
    }
}

static void atk99_setmist(void)
{
    if (gSideTimer[GetBankIdentity(gBankAttacker) & 1].mistTimer)
    {
        gBattleMoveFlags |= (1 << 5);
        gBattleCommunication[0x5] = 1;
    }
    else
    {
        gSideTimer[GetBankIdentity(gBankAttacker) & 1].mistTimer = 5;
        gSideAffecting[GetBankIdentity(gBankAttacker) & 1] |= (1 << 8);
        gBattleCommunication[0x5] = 0;
    }
    gBattlescriptCurrInstr++;
}

static void atk9A_set_focusenergy(void)
{
    if (gBattleMons[gBankAttacker].status2 & 0x00100000)
    {
        gBattleMoveFlags |= (1 << 5);
        gBattleCommunication[0x5] = 1;
    }
    else
    {
        gBattleMons[gBankAttacker].status2 |= 0x00100000;
        gBattleCommunication[0x5] = 0;
    }
    gBattlescriptCurrInstr++;
}

static void atk9B_transformdataexecution(void)
{
    gUnknown_02024BE8 = 0xFFFF;
    gBattlescriptCurrInstr++;
    if (gBattleMons[gBankTarget].status2 & 0x00200000 || gStatuses3[gBankTarget] & ((0x80 | 0x40 | 0x40000)))
    {
        gBattleMoveFlags |= (1 << 5);
        gBattleCommunication[0x5] = 1;
    }
    else
    {
        u32 i; s32 j;
        u8 *atk_data, *def_data;
        gBattleMons[gBankAttacker].status2 |= 0x00200000;
        gDisableStructs[gBankAttacker].disabledMove = 0;
        gDisableStructs[gBankAttacker].disableTimer1 = 0;
        gDisableStructs[gBankAttacker].unk0 = gBattleMons[gBankTarget].personality;
        gDisableStructs[gBankAttacker].unk18_b = 0;

        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 6;
        gBattleTextBuff1[2] = (gBattleMons[gBankTarget].species);
        gBattleTextBuff1[3] = (( (u8) (((u16)(gBattleMons[gBankTarget].species) & (0x0000FF00)) >> 0x08)));
        gBattleTextBuff1[4] = 0xFF;

        atk_data = (u8*)(&gBattleMons[gBankAttacker]);
        def_data = (u8*)(&gBattleMons[gBankTarget]);

        for (i = 0; i < 0x24; i++)
            atk_data[i] = def_data[i];

        for (j = 0; j < 4; j++)
        {
            if (gBattleMoves[gBattleMons[gBankAttacker].moves[j]].pp < 5)
                gBattleMons[gBankAttacker].pp[j] = gBattleMoves[gBattleMons[gBankAttacker].moves[j]].pp;
            else
                gBattleMons[gBankAttacker].pp[j] = 5;
        }

        gActiveBank = gBankAttacker;
        EmitResetActionMoveSelection(0, 2);
        MarkBufferBankForExecution(gActiveBank);
        gBattleCommunication[0x5] = 0;
    }
}

static void atk9C_set_substitute(void)
{
    u32 hp = gBattleMons[gBankAttacker].maxHP / 4;
    if (gBattleMons[gBankAttacker].maxHP / 4 == 0)
        hp = 1;
    if (gBattleMons[gBankAttacker].hp <= hp)
    {
        gBattleMoveDamage = 0;
        gBattleCommunication[0x5] = 1;
    }
    else
    {
        gBattleMoveDamage = gBattleMons[gBankAttacker].maxHP / 4;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMons[gBankAttacker].status2 |= 0x01000000;
        gBattleMons[gBankAttacker].status2 &= ~(0x0000E000);
        gDisableStructs[gBankAttacker].substituteHP = gBattleMoveDamage;
        gBattleCommunication[0x5] = 0;
        gHitMarker |= 0x00000100;
    }
    gBattlescriptCurrInstr++;
}

static bool8 IsMoveUncopyable(u16 move)
{
    int i;
    for (i = 0; sUnknown_081FACFE[i] != 0xFFFE && sUnknown_081FACFE[i] != move; i++) {}
    return (sUnknown_081FACFE[i] != 0xFFFE);
}

static void atk9D_copyattack(void)
{
    gUnknown_02024BE8 = 0xFFFF;
    if (IsMoveUncopyable(gLastUsedMove[gBankTarget]) || gBattleMons[gBankAttacker].status2 & 0x00200000
        || gLastUsedMove[gBankTarget] == 0 || gLastUsedMove[gBankTarget] == 0xFFFF)
    {
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
    else
    {
        int i;
        for (i = 0; i < 4; i++)
        {
            if (gBattleMons[gBankAttacker].moves[i] == gLastUsedMove[gBankTarget])
                break;
        }
        if (i == 4)
        {
            gBattleMons[gBankAttacker].moves[gCurrMovePos] = gLastUsedMove[gBankTarget];
            if (gBattleMoves[gLastUsedMove[gBankTarget]].pp < 5)
                gBattleMons[gBankAttacker].pp[gCurrMovePos] = gBattleMoves[gLastUsedMove[gBankTarget]].pp;
            else
                gBattleMons[gBankAttacker].pp[gCurrMovePos] = 5;

            gBattleTextBuff1[0] = 0xFD;
            gBattleTextBuff1[1] = 2;
            gBattleTextBuff1[2] = gLastUsedMove[gBankTarget];
            gBattleTextBuff1[3] = (( (u8) (((u16)(gLastUsedMove[gBankTarget]) & (0x0000FF00)) >> 0x08)));
            gBattleTextBuff1[4] = 0xFF;

            gDisableStructs[gBankAttacker].unk18_b |= gBitTable[gCurrMovePos];
            gBattlescriptCurrInstr += 5;
        }
        else
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
}
# 14211 "src/battle/battle_4.c"
__attribute__((naked))
static void atk9E_metronome(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r8\n    push {r7}\n    ldr r7, _08027938 @ =gCurrentMove\n    movs r6, 0xB1\n    lsls r6, 1\n    ldr r5, _0802793C @ =sUnknown_081FACFE\n    ldr r0, _08027940 @ =gBattlescriptCurrInstr\n    mov r8, r0\n_080278CA:\n    bl Random\n    ldr r2, _08027944 @ =0x000001ff\n    adds r1, r2, 0\n    ands r0, r1\n    adds r0, 0x1\n    strh r0, [r7]\n    cmp r0, r6\n    bhi _080278CA\n    movs r0, 0x3\n_080278DE:\n    subs r0, 0x1\n    cmp r0, 0\n    bge _080278DE\n    ldr r4, _08027938 @ =gCurrentMove\n    ldrh r2, [r4]\n    ldr r3, _08027948 @ =0x0000ffff\n    subs r0, r5, 0x2\n_080278EC:\n    adds r0, 0x2\n    ldrh r1, [r0]\n    cmp r1, r2\n    beq _080278F8\n    cmp r1, r3\n    bne _080278EC\n_080278F8:\n    ldr r0, _08027948 @ =0x0000ffff\n    cmp r1, r0\n    bne _080278CA\n    ldr r2, _0802794C @ =gHitMarker\n    ldr r0, [r2]\n    ldr r1, _08027950 @ =0xfffffbff\n    ands r0, r1\n    str r0, [r2]\n    ldr r3, _08027954 @ =gBattleScriptsEffectsTable\n    ldr r2, _08027958 @ =gBattleMoves\n    ldrh r1, [r4]\n    lsls r0, r1, 1\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r2\n    ldrb r0, [r0]\n    lsls r0, 2\n    adds r0, r3\n    ldr r0, [r0]\n    mov r1, r8\n    str r0, [r1]\n    ldrh r0, [r4]\n    movs r1, 0\n    bl GetMoveTarget\n    ldr r1, _0802795C @ =gBankTarget\n    strb r0, [r1]\n    pop {r3}\n    mov r8, r3\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08027938: .4byte gCurrentMove\n_0802793C: .4byte sUnknown_081FACFE\n_08027940: .4byte gBattlescriptCurrInstr\n_08027944: .4byte 0x000001ff\n_08027948: .4byte 0x0000ffff\n_0802794C: .4byte gHitMarker\n_08027950: .4byte 0xfffffbff\n_08027954: .4byte gBattleScriptsEffectsTable\n_08027958: .4byte gBattleMoves\n_0802795C: .4byte gBankTarget\n        .syntax divided");
# 14293 "src/battle/battle_4.c"
}


static void atk9F_dmgtolevel(void)
{
    gBattleMoveDamage = gBattleMons[gBankAttacker].level;
    gBattlescriptCurrInstr++;
}

static void atkA0_psywavedamageeffect(void)
{
    s32 rand_dmg;
    while ((rand_dmg = (Random() & 0xF)) > 0xA);
    rand_dmg *= 10;
    gBattleMoveDamage = gBattleMons[gBankAttacker].level * (rand_dmg + 50) / 100;
    gBattlescriptCurrInstr++;
}

static void atkA1_counterdamagecalculator(void)
{
    u8 atk_side = GetBankSide(gBankAttacker);
    u8 def_side = GetBankSide(gProtectStructs[gBankAttacker].physicalBank);
    if (gProtectStructs[gBankAttacker].physicalDmg && atk_side != def_side && gBattleMons[gProtectStructs[gBankAttacker].physicalBank].hp)
    {
        gBattleMoveDamage = gProtectStructs[gBankAttacker].physicalDmg * 2;
        if (gSideTimer[def_side].followmeTimer && gBattleMons[gSideTimer[def_side].followmeTarget].hp)
            gBankTarget = gSideTimer[def_side].followmeTarget;
        else
            gBankTarget = gProtectStructs[gBankAttacker].physicalBank;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gSpecialStatuses[gBankAttacker].flag20 = 1;
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
}

static void atkA2_mirrorcoatdamagecalculator(void)
{
    u8 atk_side = GetBankSide(gBankAttacker);
    u8 def_side = GetBankSide(gProtectStructs[gBankAttacker].specialBank);
    if (gProtectStructs[gBankAttacker].specialDmg && atk_side != def_side && gBattleMons[gProtectStructs[gBankAttacker].specialBank].hp)
    {
        gBattleMoveDamage = gProtectStructs[gBankAttacker].specialDmg * 2;
        if (gSideTimer[def_side].followmeTimer && gBattleMons[gSideTimer[def_side].followmeTarget].hp)
            gBankTarget = gSideTimer[def_side].followmeTarget;
        else
            gBankTarget = gProtectStructs[gBankAttacker].specialBank;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gSpecialStatuses[gBankAttacker].flag20 = 1;
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
}

static void atkA3_disablelastusedattack(void)
{
    int i;
    for (i = 0; i < 4; i++)
    {
        if (gBattleMons[gBankTarget].moves[i] == gLastUsedMove[gBankTarget])
            break;
    }
    if (gDisableStructs[gBankTarget].disabledMove == 0 && i != 4 && gBattleMons[gBankTarget].pp[i] != 0)
    {
        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 2;
        gBattleTextBuff1[2] = gBattleMons[gBankTarget].moves[i];
        gBattleTextBuff1[3] = (( (u8) (((u16)(gBattleMons[gBankTarget].moves[i]) & (0x0000FF00)) >> 0x08)));
        gBattleTextBuff1[4] = 0xFF;

        gDisableStructs[gBankTarget].disabledMove = gBattleMons[gBankTarget].moves[i];
        gDisableStructs[gBankTarget].disableTimer1 = (Random() & 3) + 2;
        gDisableStructs[gBankTarget].disableTimer2 = gDisableStructs[gBankTarget].disableTimer1;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
}

static void atkA4_setencore(void)
{
    int i;
    for (i = 0; i < 4; i++)
    {
        if (gBattleMons[gBankTarget].moves[i] == gLastUsedMove[gBankTarget])
            break;
    }
    if (gLastUsedMove[gBankTarget] == MOVE_STRUGGLE || gLastUsedMove[gBankTarget] == MOVE_ENCORE || gLastUsedMove[gBankTarget] == MOVE_MIRROR_MOVE)
        i = 4;
    if (gDisableStructs[gBankTarget].encoredMove == 0 && i != 4 && gBattleMons[gBankTarget].pp[i] != 0)
    {
        gDisableStructs[gBankTarget].encoredMove = gBattleMons[gBankTarget].moves[i];
        gDisableStructs[gBankTarget].encoredMovePos = i;
        gDisableStructs[gBankTarget].encoreTimer1 = (Random() & 3) + 3;
        gDisableStructs[gBankTarget].encoreTimer2 = gDisableStructs[gBankTarget].encoreTimer1;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
}

static void atkA5_painsplitdmgcalc(void)
{
    if (!(gBattleMons[gBankTarget].status2 & 0x01000000))
    {
        s32 hp_diff = (gBattleMons[gBankAttacker].hp + gBattleMons[gBankTarget].hp) / 2;
        s32 to_store = gBattleMoveDamage = gBattleMons[gBankTarget].hp - hp_diff;
        ((struct BattleStruct *) (gSharedMem + 0x0))->unk16014 = (( (u8) (((s32)(to_store) & (0x000000FF)) >> 0x00)));
        ((struct BattleStruct *) (gSharedMem + 0x0))->unk16015 = (( (u8) (((s32)(to_store) & (0x0000FF00)) >> 0x08)));
        ((struct BattleStruct *) (gSharedMem + 0x0))->unk16016 = (( (u8) (((s32)(to_store) & (0x00FF0000)) >> 0x10)));
        ((struct BattleStruct *) (gSharedMem + 0x0))->unk16017 = (( (u8) (((s32)(to_store) & (0xFF000000)) >> 0x18)));

        gBattleMoveDamage = gBattleMons[gBankAttacker].hp - hp_diff;
        gSpecialStatuses[gBankTarget].moveturnLostHP = 0xFFFF;

        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}
# 14473 "src/battle/battle_4.c"
__attribute__((naked))
static void atkA6_settypetorandomresistance(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    ldr r1, _08027FA8 @ =gMoveHitWith\n    ldr r4, _08027FAC @ =gBankAttacker\n    ldrb r0, [r4]\n    lsls r0, 1\n    adds r2, r0, r1\n    ldrh r1, [r2]\n    cmp r1, 0\n    beq _08027F8C\n    ldr r0, _08027FB0 @ =0x0000ffff\n    cmp r1, r0\n    beq _08027F8C\n    ldrh r0, [r2]\n    bl IsTwoTurnsMove\n    lsls r0, 24\n    cmp r0, 0\n    beq _08028024\n    ldr r2, _08027FB4 @ =gProtectStructs\n    ldrb r0, [r4]\n    lsls r1, r0, 4\n    adds r0, r2, 0x4\n    adds r0, r1, r0\n    ldr r0, [r0]\n    cmp r0, 0\n    bne _08028024\n    adds r0, r2, 0\n    adds r0, 0x8\n    adds r0, r1, r0\n    ldr r0, [r0]\n    cmp r0, 0\n    bne _08028024\n_08027F8C:\n    ldr r3, _08027FB8 @ =gBattlescriptCurrInstr\n    ldr r2, [r3]\n    ldrb r1, [r2, 0x1]\n    ldrb r0, [r2, 0x2]\n    lsls r0, 8\n    orrs r1, r0\n    ldrb r0, [r2, 0x3]\n    lsls r0, 16\n    orrs r1, r0\n    ldrb r0, [r2, 0x4]\n    lsls r0, 24\n    orrs r1, r0\n    str r1, [r3]\n    b _08028110\n    .align 2, 0\n_08027FA8: .4byte gMoveHitWith\n_08027FAC: .4byte gBankAttacker\n_08027FB0: .4byte 0x0000ffff\n_08027FB4: .4byte gProtectStructs\n_08027FB8: .4byte gBattlescriptCurrInstr\n_08027FBC:\n    mov r0, r12\n    strb r5, [r0]\n    mov r1, r10\n    ldrb r0, [r1]\n    muls r0, r2\n    adds r0, r7\n    adds r0, 0x22\n    strb r5, [r0]\n    ldr r1, _08027FE0 @ =gBattleTextBuff1\n    movs r0, 0xFD\n    strb r0, [r1]\n    movs r0, 0x3\n    strb r0, [r1, 0x1]\n    strb r5, [r1, 0x2]\n    movs r0, 0xFF\n    strb r0, [r1, 0x3]\n    ldr r1, _08027FE4 @ =gBattlescriptCurrInstr\n    b _08028012\n    .align 2, 0\n_08027FE0: .4byte gBattleTextBuff1\n_08027FE4: .4byte gBattlescriptCurrInstr\n_08027FE8:\n    mov r0, r8\n    adds r0, 0x1\n    adds r0, r3\n    ldrb r2, [r0]\n    strb r2, [r4]\n    mov r4, r10\n    ldrb r0, [r4]\n    muls r0, r6\n    ldr r7, _0802801C @ =gBattleMons\n    adds r0, r7\n    adds r0, 0x22\n    strb r2, [r0]\n    ldr r1, _08028020 @ =gBattleTextBuff1\n    movs r0, 0xFD\n    strb r0, [r1]\n    movs r0, 0x3\n    strb r0, [r1, 0x1]\n    strb r2, [r1, 0x2]\n    movs r0, 0xFF\n    strb r0, [r1, 0x3]\n    mov r1, r12\n_08028012:\n    ldr r0, [r1]\n    adds r0, 0x5\n    str r0, [r1]\n    b _08028110\n    .align 2, 0\n_0802801C: .4byte gBattleMons\n_08028020: .4byte gBattleTextBuff1\n_08028024:\n    movs r4, 0\n    mov r8, r4\n    movs r7, 0x7F\n    mov r9, r7\n_0802802C:\n    bl Random\n    mov r4, r9\n    ands r4, r0\n    cmp r4, 0x70\n    bhi _0802802C\n    lsls r0, r4, 1\n    adds r4, r0, r4\n    ldr r6, _08028120 @ =gTypeEffectiveness\n    adds r3, r4, r6\n    ldr r1, _08028124 @ =gUnknown_02024C44\n    ldr r2, _08028128 @ =gBankAttacker\n    ldrb r5, [r2]\n    lsls r0, r5, 1\n    adds r0, r1\n    ldrb r1, [r3]\n    mov r10, r2\n    ldrh r0, [r0]\n    cmp r1, r0\n    bne _08028088\n    adds r0, r4, 0x2\n    adds r0, r6\n    ldrb r0, [r0]\n    cmp r0, 0x5\n    bhi _08028088\n    ldr r7, _0802812C @ =gBattleMons\n    movs r2, 0x58\n    adds r0, r5, 0\n    muls r0, r2\n    adds r3, r0, r7\n    movs r0, 0x21\n    adds r0, r3\n    mov r12, r0\n    adds r0, r4, 0x1\n    adds r0, r6\n    ldrb r5, [r0]\n    mov r1, r12\n    ldrb r0, [r1]\n    adds r1, r5, 0\n    cmp r0, r1\n    beq _08028088\n    adds r0, r3, 0\n    adds r0, 0x22\n    ldrb r0, [r0]\n    cmp r0, r1\n    bne _08027FBC\n_08028088:\n    movs r7, 0x1\n    add r8, r7\n    ldr r0, _08028130 @ =0x000003e7\n    cmp r8, r0\n    ble _0802802C\n    movs r0, 0\n    mov r8, r0\n    ldr r1, _08028134 @ =gBattlescriptCurrInstr\n    mov r12, r1\n    ldr r3, _08028120 @ =gTypeEffectiveness\n    adds r0, r4, 0x1\n    adds r0, r3\n    mov r9, r0\n    adds r5, r3, 0\n_080280A4:\n    ldrb r1, [r5]\n    cmp r1, 0xFF\n    bgt _080280AE\n    cmp r1, 0xFE\n    bge _080280E8\n_080280AE:\n    mov r4, r10\n    ldrb r2, [r4]\n    lsls r0, r2, 1\n    ldr r7, _08028124 @ =gUnknown_02024C44\n    adds r0, r7\n    ldrh r0, [r0]\n    cmp r1, r0\n    bne _080280E8\n    ldrb r0, [r5, 0x2]\n    cmp r0, 0x5\n    bhi _080280E8\n    movs r6, 0x58\n    adds r0, r2, 0\n    muls r0, r6\n    ldr r1, _0802812C @ =gBattleMons\n    adds r2, r0, r1\n    adds r4, r2, 0\n    adds r4, 0x21\n    ldrb r0, [r4]\n    mov r7, r9\n    ldrb r1, [r7]\n    cmp r0, r1\n    beq _080280E8\n    adds r0, r2, 0\n    adds r0, 0x22\n    ldrb r0, [r0]\n    cmp r0, r1\n    beq _080280E8\n    b _08027FE8\n_080280E8:\n    adds r5, 0x3\n    movs r0, 0x3\n    add r8, r0\n    ldr r0, _08028138 @ =0x0000014f\n    cmp r8, r0\n    bls _080280A4\n    mov r1, r12\n    ldr r2, [r1]\n    ldrb r1, [r2, 0x1]\n    ldrb r0, [r2, 0x2]\n    lsls r0, 8\n    orrs r1, r0\n    ldrb r0, [r2, 0x3]\n    lsls r0, 16\n    orrs r1, r0\n    ldrb r0, [r2, 0x4]\n    lsls r0, 24\n    orrs r1, r0\n    mov r4, r12\n    str r1, [r4]\n_08028110:\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08028120: .4byte gTypeEffectiveness\n_08028124: .4byte gUnknown_02024C44\n_08028128: .4byte gBankAttacker\n_0802812C: .4byte gBattleMons\n_08028130: .4byte 0x000003e7\n_08028134: .4byte gBattlescriptCurrInstr\n_08028138: .4byte 0x0000014f\n        .syntax divided");
# 14725 "src/battle/battle_4.c"
}


static void atkA7_setalwayshitflag(void)
{
    gStatuses3[gBankTarget] &= ~(0x18);
    gStatuses3[gBankTarget] |= 0x10;
    gDisableStructs[gBankTarget].bankWithSureHit = gBankAttacker;
    gBattlescriptCurrInstr++;
}

struct move_pp
{
    u16 move[4];
    u8 pp[4];
    u8 ppBonuses;
};

static void atkA8_copymovepermanently(void)
{
    gUnknown_02024BE8 = 0xFFFF;
    if (!(gBattleMons[gBankAttacker].status2 & 0x00200000) && gUnknown_02024C2C[gBankTarget] != MOVE_STRUGGLE && gUnknown_02024C2C[gBankTarget] != 0 && gUnknown_02024C2C[gBankTarget] != 0xFFFF && gUnknown_02024C2C[gBankTarget] != MOVE_SKETCH)
    {
        int i;
        for (i = 0; i < 4; i++)
        {
            if (gBattleMons[gBankAttacker].moves[i] == MOVE_SKETCH)
                continue;
            if (gBattleMons[gBankAttacker].moves[i] == gUnknown_02024C2C[gBankTarget])
                break;
        }
        if (i != 4)
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
        else
        {
            struct move_pp moves_data;
            gBattleMons[gBankAttacker].moves[gCurrMovePos] = gUnknown_02024C2C[gBankTarget];
            gBattleMons[gBankAttacker].pp[gCurrMovePos] = gBattleMoves[gUnknown_02024C2C[gBankTarget]].pp;
            gActiveBank = gBankAttacker;
            for (i = 0; i < 4; i++)
            {
                moves_data.move[i] = gBattleMons[gBankAttacker].moves[i];
                moves_data.pp[i] = gBattleMons[gBankAttacker].pp[i];
            }
            moves_data.ppBonuses = gBattleMons[gBankAttacker].ppBonuses;
            EmitSetAttributes(0, 0x3, 0, sizeof(struct move_pp), &moves_data);
            MarkBufferBankForExecution(gActiveBank);
            gBattleTextBuff1[0] = 0xFD;
            gBattleTextBuff1[1] = 2;
            gBattleTextBuff1[2] = gUnknown_02024C2C[gBankTarget];
            gBattleTextBuff1[3] = gUnknown_02024C2C[gBankTarget] >> 8;
            gBattleTextBuff1[4] = 0xFF;
            gBattlescriptCurrInstr += 5;
        }
    }
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static bool8 IsTwoTurnsMove(u16 move)
{
    u8 effect = gBattleMoves[move].effect;
    if (effect == EFFECT_SKULL_BASH || effect == EFFECT_RAZOR_WIND || effect == EFFECT_SKY_ATTACK || effect == EFFECT_SOLARBEAM || effect == EFFECT_FLY || effect == EFFECT_BIDE)
        return 1;
    else
        return 0;
}

static bool8 IsMoveUnchoosable(u16 move)
{
    if (move == 0 || move == MOVE_SLEEP_TALK || move == MOVE_ASSIST || move == MOVE_MIRROR_MOVE || move == MOVE_METRONOME)
        return 1;
    else
        return 0;
}

static u8 AttacksThisTurn(u8 bank, u16 move)
{

    u8 effect;
    if (gBattleMoves[move].effect == EFFECT_SOLARBEAM && (gBattleWeather & (((1 << 5) | (1 << 6)))))
        return 2;
    effect = gBattleMoves[move].effect;
    if (effect == EFFECT_SKULL_BASH || effect == EFFECT_RAZOR_WIND || effect == EFFECT_SKY_ATTACK || effect == EFFECT_SOLARBEAM || effect == EFFECT_FLY || effect == EFFECT_BIDE)
    {
        if ((gHitMarker & 0x08000000))
            return 1;
    }
    return 2;
}

static void atkA9_sleeptalk_choose_move(void)
{
    u8 unusable_moves = 0;
    int i;

    for (i = 0; i < 4; i++)
    {
        if (IsMoveUnchoosable(gBattleMons[gBankAttacker].moves[i]) || gBattleMons[gBankAttacker].moves[i] == MOVE_FOCUS_PUNCH
            || gBattleMons[gBankAttacker].moves[i] == MOVE_UPROAR || IsTwoTurnsMove(gBattleMons[gBankAttacker].moves[i]))
                unusable_moves |= gBitTable[i];
    }
    unusable_moves = CheckMoveLimitations(gBankAttacker, unusable_moves, 0xFD);
    if (unusable_moves == 0xF)
        gBattlescriptCurrInstr += 5;
    else
    {
        u32 random_pos;
        do
        {
            random_pos = Random() & 3;
        } while ((gBitTable[random_pos] & unusable_moves));

        gRandomMove = gBattleMons[gBankAttacker].moves[random_pos];
        gCurrMovePos = random_pos;
        gHitMarker &= ~(0x00000400);
        gBankTarget = GetMoveTarget(gRandomMove, 0);
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
}

static void atkAA_set_destinybond(void)
{
    gBattleMons[gBankAttacker].status2 |= 0x02000000;
    gBattlescriptCurrInstr++;
}

static void DestinyBondFlagUpdate(void)
{
    u8 atk_side = GetBankSide(gBankAttacker);
    u8 def_side = GetBankSide(gBankTarget);
    if (gBattleMons[gBankTarget].status2 & 0x02000000 && atk_side != def_side && !(gHitMarker & 0x01000000))
        gHitMarker |= 0x00000040;
}

static void atkAB_DestinyBondFlagUpdate(void)
{
    DestinyBondFlagUpdate();
    gBattlescriptCurrInstr++;
}

static void atkAC_remaininghptopower(void)
{
    s32 hp_fraction = GetScaledHPFraction(gBattleMons[gBankAttacker].hp, gBattleMons[gBankAttacker].maxHP, 48);
    int i;
    for (i = 0; i < 12; i += 2)
    {
        if (hp_fraction <= sUnknown_081FAD26[i])
            break;
    }
    gDynamicBasePower = sUnknown_081FAD26[i + 1];
    gBattlescriptCurrInstr++;
}

static void atkAD_spite_ppreduce(void)
{
    if (gLastUsedMove[gBankTarget] != 0 && gLastUsedMove[gBankTarget] != 0xFFFF && !(gStatuses3[gBankTarget] & ((0x80 | 0x40 | 0x40000))))
    {
        int i;
        for (i = 0; i < 4; i++)
        {
            if (gLastUsedMove[gBankTarget] == gBattleMons[gBankTarget].moves[i])
                break;
        }
        if (i != 4 && gBattleMons[gBankTarget].pp[i] > 1)
        {
            s32 lost_pp = (Random() & 3) + 2;
            if (gBattleMons[gBankTarget].pp[i] < lost_pp)
                lost_pp = gBattleMons[gBankTarget].pp[i];

            gBattleTextBuff1[0] = 0xFD;
            gBattleTextBuff1[1] = 2;
            gBattleTextBuff1[2] = gLastUsedMove[gBankTarget];
            gBattleTextBuff1[3] = gLastUsedMove[gBankTarget] >> 8;
            gBattleTextBuff1[4] = 0xFF;
            ConvertIntToDecimalStringN(gBattleTextBuff2, lost_pp, 0, 1);
            gBattleTextBuff2[0] = 0xFD;
            gBattleTextBuff2[1] = 1;
            gBattleTextBuff2[2] = 1;
            gBattleTextBuff2[3] = 1;
            gBattleTextBuff2[4] = lost_pp;
            gBattleTextBuff2[5] = 0xFF;

            gBattleMons[gBankTarget].pp[i] -= lost_pp;
            gActiveBank = gBankTarget;
            if (!(gDisableStructs[gActiveBank].unk18_b & gBitTable[i])
                && !(gBattleMons[gActiveBank].status2 & 0x00200000))
            {
                EmitSetAttributes(0, 0x9 + i, 0, 1, &gBattleMons[gActiveBank].pp[i]);
                MarkBufferBankForExecution(gActiveBank);
            }
            gBattlescriptCurrInstr += 5;
            if (gBattleMons[gBankTarget].pp[i] == 0)
                CancelMultiTurnMoves(gBankTarget);
            return;
        }
    }
    gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atkAE_heal_party_status(void)
{
    register u32 zero2 asm("r4") = 0;
    u32 zero = zero2;
    u8 to_heal = 0;
    if (gCurrentMove == MOVE_HEAL_BELL)
    {
        struct Pokemon* party;
        int i;

        gBattleCommunication[0x5] = 0;
        if (GetBankSide(gBankAttacker) == 0)
            party = gPlayerParty;
        else
            party = gEnemyParty;

        if (gBattleMons[gBankAttacker].ability != ABILITY_SOUNDPROOF)
        {
            gBattleMons[gBankAttacker].status1 = 0;
        }
        else
        {
            RecordAbilityBattle(gBankAttacker, gBattleMons[gBankAttacker].ability);
            gBattleCommunication[0x5] |= 1;
        }

        gActiveBank = ((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive = GetBankByPlayerAI(GetBankIdentity(gBankAttacker) ^ 2);
        if (gBattleTypeFlags & 0x0001 && !(gAbsentBankFlags & gBitTable[gActiveBank]))
        {
            if (gBattleMons[gActiveBank].ability != ABILITY_SOUNDPROOF)
            {
                gBattleMons[gActiveBank].status1 = 0;
            }
            else
            {
                RecordAbilityBattle(gActiveBank, gBattleMons[gActiveBank].ability);
                gBattleCommunication[0x5] |= 2;
            }
        }

        for (i = 0; i < 6; i++)
        {
            u16 species = GetMonData(&party[i], 65);
            u8 abilityBit = GetMonData(&party[i], 46);
            if (species != 0 && species != SPECIES_EGG)
            {
                u8 ability;
                if (gBattlePartyID[gBankAttacker] == i)
                    ability = gBattleMons[gBankAttacker].ability;
                else if (gBattleTypeFlags & 0x0001 && gBattlePartyID[gActiveBank] == i && !(gAbsentBankFlags & gBitTable[gActiveBank]))
                    ability = gBattleMons[gActiveBank].ability;
                else
                    ability = GetAbilityBySpecies(species, abilityBit);
                if (ability != ABILITY_SOUNDPROOF)
                    to_heal |= (1 << i);
            }
        }
    }
    else
    {
        gBattleCommunication[0x5] = 4;
        to_heal = 0x3F;
        gBattleMons[gBankAttacker].status1 = zero2;

        gActiveBank = GetBankByPlayerAI(GetBankIdentity(gBankAttacker) ^ 2);
        if (gBattleTypeFlags & 0x0001 && !(gAbsentBankFlags & gBitTable[gActiveBank]))
            gBattleMons[gActiveBank].status1 = 0;

    }

    gActiveBank = gBankAttacker;
    EmitSetAttributes(0, 0x28, to_heal, 4, &zero);
    MarkBufferBankForExecution(gActiveBank);

    gBattlescriptCurrInstr++;
}

static void atkAF_cursetarget(void)
{
    if (gBattleMons[gBankTarget].status2 & 0x10000000 || gStatuses3[gBankTarget] & ((0x80 | 0x40 | 0x40000)))
    {
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
    else
    {
        gBattleMons[gBankTarget].status2 |= 0x10000000;
        gBattleMoveDamage = gBattleMons[gBankAttacker].maxHP / 2;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkB0_set_spikes(void)
{
    u8 side = GetBankSide(gBankAttacker) ^ 1;
    if (gSideTimer[side].spikesAmount == 3)
    {
        gSpecialStatuses[gBankAttacker].flag20 = 1;
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
    else
    {
        gSideAffecting[side] |= (1 << 4);
        gSideTimer[side].spikesAmount++;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkB1_set_foresight(void)
{
    gBattleMons[gBankTarget].status2 |= 0x20000000;
    gBattlescriptCurrInstr++;
}

static void atkB2_setperishsong(void)
{
    int not_affected_pokes = 0, i;

    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (gStatuses3[i] & 0x20 || gBattleMons[i].ability == ABILITY_SOUNDPROOF)
            not_affected_pokes++;
        else
        {
            gStatuses3[i] |= 0x20;
            gDisableStructs[i].perishSong1 = 3;
            gDisableStructs[i].perishSong2 = 3;
        }
    }

    sub_80153D0(gBankAttacker);
    if (not_affected_pokes == gNoOfAllBanks)
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
        gBattlescriptCurrInstr += 5;
}

static void atkB3_rolloutdamagecalculation(void)
{
    if (gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5))))
    {
        CancelMultiTurnMoves(gBankAttacker);
        gBattlescriptCurrInstr = BattleScript_1D6F74;
    }
    else
    {
        int i;
        if (!(gBattleMons[gBankAttacker].status2 & 0x00001000))
        {
            gDisableStructs[gBankAttacker].rolloutTimer1 = 5;
            gDisableStructs[gBankAttacker].rolloutTimer2 = 5;
            gBattleMons[gBankAttacker].status2 |= 0x00001000;
            gLockedMove[gBankAttacker] = gCurrentMove;
        }
        if (--gDisableStructs[gBankAttacker].rolloutTimer1 == 0)
            gBattleMons[gBankAttacker].status2 &= ~(0x00001000);

        gDynamicBasePower = gBattleMoves[gCurrentMove].power;
        for (i = 1; i < (5 - gDisableStructs[gBankAttacker].rolloutTimer1); i++)
            gDynamicBasePower *= 2;

        if (gBattleMons[gBankAttacker].status2 & 0x40000000)
            gDynamicBasePower *= 2;

        gBattlescriptCurrInstr++;
    }
}

static void atkB4_jumpifconfusedandstatmaxed(void)
{
    if (gBattleMons[gBankTarget].status2 & 0x00000007 && gBattleMons[gBankTarget].statStages[((gBattlescriptCurrInstr + 1)[0])] == 0xC)
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 2)[0] | ((gBattlescriptCurrInstr + 2)[1] << 8) | ((gBattlescriptCurrInstr + 2)[2] << 16) | ((gBattlescriptCurrInstr + 2)[3] << 24));
    else
        gBattlescriptCurrInstr += 6;
}

static void atkB5_furycuttercalc(void)
{
    if (gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5))))
    {
        gDisableStructs[gBankAttacker].furyCutterCounter = 0;
        gBattlescriptCurrInstr = BattleScript_1D6F74;
    }
    else
    {
        int i;

        if (gDisableStructs[gBankAttacker].furyCutterCounter != 5)
            gDisableStructs[gBankAttacker].furyCutterCounter++;

        gDynamicBasePower = gBattleMoves[gCurrentMove].power;
        for (i = 1; i < gDisableStructs[gBankAttacker].furyCutterCounter; i++)
            gDynamicBasePower *= 2;

        gBattlescriptCurrInstr++;
    }
}

static void atkB6_happinesstodamagecalculation(void)
{
    if (gBattleMoves[gCurrentMove].effect == EFFECT_RETURN)
        gDynamicBasePower = 10 * (gBattleMons[gBankAttacker].friendship) / 25;
    else
        gDynamicBasePower = 10 * (255 - gBattleMons[gBankAttacker].friendship) / 25;
    gBattlescriptCurrInstr++;
}

static void atkB7_presentdamagecalculation(void)
{
    s32 rand = Random() & 0xFF;
    if (rand < 102)
        gDynamicBasePower = 40;
    else if (rand < 178)
        gDynamicBasePower = 80;
    else if (rand < 204)
        gDynamicBasePower = 120;
    else
    {
        gBattleMoveDamage = gBattleMons[gBankTarget].maxHP / 4;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;
    }
    if (rand < 204)
        gBattlescriptCurrInstr = BattleScript_1D6F44;
    else if (gBattleMons[gBankTarget].maxHP == gBattleMons[gBankTarget].hp)
        gBattlescriptCurrInstr = BattleScript_1D83B5;
    else
    {

        gBattlescriptCurrInstr = BattleScript_1D839B;
    }
}

static void atkB8_set_safeguard(void)
{
    if (gSideAffecting[GetBankIdentity(gBankAttacker) & 1] & (1 << 5))
    {
        gBattleMoveFlags |= (1 << 0);
        gBattleCommunication[0x5] = 0;
    }
    else
    {
        gSideAffecting[GetBankIdentity(gBankAttacker) & 1] |= (1 << 5);
        gSideTimer[GetBankIdentity(gBankAttacker) & 1].safeguardTimer = 5;
        gBattleCommunication[0x5] = 5;
    }
    gBattlescriptCurrInstr++;
}

static void atkB9_magnitudedamagecalculation(void)
{
    s32 magnitude = Random() % 100;
    if (magnitude < 5)
    {
        gDynamicBasePower = 10;
        magnitude = 4;
    }
    else if (magnitude < 15)
    {
        gDynamicBasePower = 30;
        magnitude = 5;
    }
    else if (magnitude < 35)
    {
        gDynamicBasePower = 50;
        magnitude = 6;
    }
    else if (magnitude < 65)
    {
        gDynamicBasePower = 70;
        magnitude = 7;
    }
    else if (magnitude < 85)
    {
        gDynamicBasePower = 90;
        magnitude = 8;
    }
    else if (magnitude < 95)
    {
        gDynamicBasePower = 110;
        magnitude = 9;
    }
    else
    {
        gDynamicBasePower = 150;
        magnitude = 10;
    }

    gBattleTextBuff1[0] = 0xFD;
    gBattleTextBuff1[1] = 1;
    gBattleTextBuff1[2] = 1;
    gBattleTextBuff1[3] = 2;
    gBattleTextBuff1[4] = magnitude;
    gBattleTextBuff1[5] = 0xFF;

    for (gBankTarget = 0; gBankTarget < gNoOfAllBanks; gBankTarget++)
    {
        if (gBankTarget == gBankAttacker)
            continue;
        if (!(gAbsentBankFlags & gBitTable[gBankTarget]))
            break;
    }
    gBattlescriptCurrInstr++;
}

static void atkBA_jumpifnopursuitswitchdmg(void)
{
    if (gMultiHitCounter == 1)
    {
        if (GetBankSide(gBankAttacker) == 0)
            gBankTarget = GetBankByPlayerAI(1);
        else
            gBankTarget = GetBankByPlayerAI(0);
    }
    else
    {
        if (GetBankSide(gBankAttacker) == 0)
            gBankTarget = GetBankByPlayerAI(3);
        else
            gBankTarget = GetBankByPlayerAI(2);
    }

    if (gActionForBanks[gBankTarget] == 0 && gBankAttacker == (gSharedMem[0x16010 + gBankTarget]) && !(gBattleMons[gBankTarget].status1 & (0x7 | 0x20))
        && gBattleMons[gBankAttacker].hp && !gDisableStructs[gBankTarget].truantCounter && gChosenMovesByBanks[gBankTarget] == MOVE_PURSUIT)
    {
        int i;
        for (i = 0; i < gNoOfAllBanks; i++)
        {
            if (gTurnOrder[i] == gBankTarget)
                gUnknown_02024A76[i] = 11;
        }
        gCurrentMove = MOVE_PURSUIT;
        gBattlescriptCurrInstr += 5;
        ((struct BattleStruct *) (gSharedMem + 0x0))->animTurn = 1;
        gHitMarker &= ~(0x00000400);
    }
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atkBB_setsunny(void)
{
    if (gBattleWeather & (((1 << 5) | (1 << 6))))
    {
        gBattleMoveFlags |= (1 << 0);
        gBattleCommunication[0x5] = 2;
    }
    else
    {
        gBattleWeather = (1 << 5);
        gBattleCommunication[0x5] = 4;
        gWishFutureKnock.weatherDuration = 5;
    }
    gBattlescriptCurrInstr++;
}

static void atkBC_maxattackhalvehp(void)
{
    u32 half_hp = gBattleMons[gBankAttacker].maxHP / 2;
    if (!(gBattleMons[gBankAttacker].maxHP / 2))
        half_hp = 1;

    if (gBattleMons[gBankAttacker].statStages[STAT_STAGE_ATK] < 12 && gBattleMons[gBankAttacker].hp > half_hp)
    {
        gBattleMons[gBankAttacker].statStages[STAT_STAGE_ATK] = 12;
        gBattleMoveDamage = gBattleMons[gBankAttacker].maxHP / 2;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
}

static void atkBD_copyfoestats(void)
{
    int i;
    for (i = 0; i < 8; i++)
    {
        gBattleMons[gBankAttacker].statStages[i] = gBattleMons[gBankTarget].statStages[i];
    }
    gBattlescriptCurrInstr += 5;
}

static void atkBE_breakfree(void)
{
    if (gBattleMons[gBankAttacker].status2 & 0x0000E000)
    {
        gBattleMons[gBankAttacker].status2 &= ~(0x0000E000);
        gBankTarget = (gSharedMem[0x16020 + gBankAttacker]);
        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 2;
        gBattleTextBuff1[2] = (gSharedMem[0x16004 + 0 + gBankAttacker * 2]);
        gBattleTextBuff1[3] = (gSharedMem[0x16004 + 1 + gBankAttacker * 2]);
        gBattleTextBuff1[4] = 0xFF;
        b_movescr_stack_push_cursor();
        gBattlescriptCurrInstr = BattleScript_WrapFree;
    }
    else if (gStatuses3[gBankAttacker] & 0x4)
    {
        gStatuses3[gBankAttacker] &= ~(0x4);
        gStatuses3[gBankAttacker] &= ~(0x3);
        b_movescr_stack_push_cursor();
        gBattlescriptCurrInstr = BattleScript_LeechSeedFree;
    }
    else if (gSideAffecting[GetBankSide(gBankAttacker)] & (1 << 4))
    {
        gSideAffecting[GetBankSide(gBankAttacker)] &= ~((1 << 4));
        gSideTimer[GetBankSide(gBankAttacker)].spikesAmount = 0;
        b_movescr_stack_push_cursor();
        gBattlescriptCurrInstr = BattleScript_SpikesFree;
    }
    else
        gBattlescriptCurrInstr++;
}

static void atkBF_set_defense_curl(void)
{
    gBattleMons[gBankAttacker].status2 |= 0x40000000;
    gBattlescriptCurrInstr++;
}

static void atkC0_recoverbasedonsunlight(void)
{
    gBankTarget = gBankAttacker;
    if (gBattleMons[gBankAttacker].hp != gBattleMons[gBankAttacker].maxHP)
    {
        if (!gBattleWeather || !((!AbilityBattleEffects(0x13, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(0x13, 0, ABILITY_AIR_LOCK, 0, 0))))
            gBattleMoveDamage = gBattleMons[gBankAttacker].maxHP / 2;
        else if (gBattleWeather & (((1 << 5) | (1 << 6))))
            gBattleMoveDamage = 20 * gBattleMons[gBankAttacker].maxHP / 30;
        else
            gBattleMoveDamage = gBattleMons[gBankAttacker].maxHP / 4;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
}

__attribute__((naked))
static void atkC1_hidden_power(void)
{
    asm(".syntax unified\npush {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    ldr r2, _08029894 @ =gBattleMons\n    ldr r0, _08029898 @ =gBankAttacker\n    ldrb r1, [r0]\n    movs r0, 0x58\n    adds r4, r1, 0\n    muls r4, r0\n    adds r4, r2\n    ldrb r0, [r4, 0x14]\n    mov r10, r0\n    mov r7, r10\n    lsls r7, 27\n    adds r0, r7, 0\n    lsrs r0, 27\n    mov r10, r0\n    movs r1, 0x2\n    mov r2, r10\n    ands r2, r1\n    asrs r2, 1\n    ldrh r7, [r4, 0x14]\n    mov r9, r7\n    mov r0, r9\n    lsls r0, 22\n    mov r9, r0\n    lsrs r3, r0, 27\n    adds r0, r1, 0\n    ands r0, r3\n    orrs r2, r0\n    ldrb r7, [r4, 0x15]\n    mov r8, r7\n    mov r0, r8\n    lsls r0, 25\n    mov r8, r0\n    lsrs r3, r0, 27\n    adds r0, r1, 0\n    ands r0, r3\n    lsls r0, 1\n    orrs r2, r0\n    ldr r6, [r4, 0x14]\n    lsls r6, 12\n    lsrs r3, r6, 27\n    adds r0, r1, 0\n    ands r0, r3\n    lsls r0, 2\n    orrs r2, r0\n    ldrh r5, [r4, 0x16]\n    lsls r5, 23\n    lsrs r3, r5, 27\n    adds r0, r1, 0\n    ands r0, r3\n    lsls r0, 3\n    orrs r2, r0\n    ldrb r3, [r4, 0x17]\n    lsls r3, 26\n    lsrs r0, r3, 27\n    ands r1, r0\n    lsls r1, 4\n    orrs r2, r1\n    movs r1, 0x1\n    adds r4, r1, 0\n    mov r7, r10\n    ands r4, r7\n    mov r0, r9\n    lsrs r0, 27\n    mov r9, r0\n    adds r0, r1, 0\n    mov r7, r9\n    ands r0, r7\n    lsls r0, 1\n    orrs r4, r0\n    mov r0, r8\n    lsrs r0, 27\n    mov r8, r0\n    adds r0, r1, 0\n    mov r7, r8\n    ands r0, r7\n    lsls r0, 2\n    orrs r4, r0\n    lsrs r6, 27\n    adds r0, r1, 0\n    ands r0, r6\n    lsls r0, 3\n    orrs r4, r0\n    lsrs r5, 27\n    adds r0, r1, 0\n    ands r0, r5\n    lsls r0, 4\n    orrs r4, r0\n    lsrs r3, 27\n    ands r1, r3\n    lsls r1, 5\n    orrs r4, r1\n    ldr r5, _0802989C @ =gDynamicBasePower\n    lsls r0, r2, 2\n    adds r0, r2\n    lsls r0, 3\n    movs r1, 0x3F\n    bl __divsi3\n    adds r0, 0x1E\n    strh r0, [r5]\n    ldr r5, _080298A0 @ =gSharedMem\n    lsls r0, r4, 4\n    subs r0, r4\n    movs r1, 0x3F\n    bl __divsi3\n    adds r1, r0, 0x1\n    ldr r0, _080298A4 @ =0x0001601c\n    adds r5, r0\n    strb r1, [r5]\n    lsls r0, r1, 24\n    lsrs r0, 24\n    cmp r0, 0x8\n    bls _08029876\n    adds r0, r1, 0x1\n    strb r0, [r5]\n_08029876:\n    ldrb r0, [r5]\n    movs r1, 0xC0\n    orrs r0, r1\n    strb r0, [r5]\n    ldr r1, _080298A8 @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x1\n    str r0, [r1]\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08029894: .4byte gBattleMons\n_08029898: .4byte gBankAttacker\n_0802989C: .4byte gDynamicBasePower\n_080298A0: .4byte gSharedMem\n_080298A4: .4byte 0x0001601c\n_080298A8: .4byte gBattlescriptCurrInstr\n        .syntax divided");
# 15520 "src/battle/battle_4.c"
}

static void atkC2_selectnexttarget(void)
{
    for (gBankTarget = 0; gBankTarget < gNoOfAllBanks; gBankTarget++)
    {
        if (gBankTarget == gBankAttacker)
            continue;
        if (!(gAbsentBankFlags & gBitTable[gBankTarget]))
            break;
    }
    gBattlescriptCurrInstr++;
}

static void atkC3_setfutureattack(void)
{
    if (gWishFutureKnock.futureSightCounter[gBankTarget] != 0)
    {
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
    else
    {
        gWishFutureKnock.futureSightMove[gBankTarget] = gCurrentMove;
        gWishFutureKnock.futureSightAttacker[gBankTarget] = gBankAttacker;
        gWishFutureKnock.futureSightCounter[gBankTarget] = 3;
        gWishFutureKnock.futureSightDmg[gBankTarget] = CalculateBaseDamage(&gBattleMons[gBankAttacker], &gBattleMons[gBankTarget], gCurrentMove,
                                                    gSideAffecting[GetBankIdentity(gBankTarget) & 1], 0,
                                                    0, gBankAttacker, gBankTarget);

        if (gProtectStructs[gBankAttacker].helpingHand)
            gWishFutureKnock.futureSightDmg[gBankTarget] = gWishFutureKnock.futureSightDmg[gBankTarget] * 15 / 10;

        if (gCurrentMove == MOVE_DOOM_DESIRE)
            gBattleCommunication[0x5] = 1;
        else
            gBattleCommunication[0x5] = 0;

        gBattlescriptCurrInstr += 5;
    }
}
# 15607 "src/battle/battle_4.c"
__attribute__((naked))
static void atkC4_beat_up(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r9\n    mov r6, r8\n    push {r6,r7}\n    ldr r0, _08029A8C @ =gBankAttacker\n    ldrb r0, [r0]\n    bl GetBankSide\n    lsls r0, 24\n    ldr r7, _08029A90 @ =gEnemyParty\n    cmp r0, 0\n    bne _08029A62\n    ldr r7, _08029A94 @ =gPlayerParty\n_08029A62:\n    ldr r2, _08029A98 @ =gBattleMons\n    ldr r0, _08029A9C @ =gBankTarget\n    ldrb r1, [r0]\n    movs r0, 0x58\n    muls r0, r1\n    adds r0, r2\n    ldrh r0, [r0, 0x28]\n    cmp r0, 0\n    bne _08029AA4\n    ldr r3, _08029AA0 @ =gBattlescriptCurrInstr\n    ldr r2, [r3]\n    ldrb r1, [r2, 0x1]\n    ldrb r0, [r2, 0x2]\n    lsls r0, 8\n    orrs r1, r0\n    ldrb r0, [r2, 0x3]\n    lsls r0, 16\n    orrs r1, r0\n    ldrb r0, [r2, 0x4]\n    b _08029C40\n    .align 2, 0\n_08029A8C: .4byte gBankAttacker\n_08029A90: .4byte gEnemyParty\n_08029A94: .4byte gPlayerParty\n_08029A98: .4byte gBattleMons\n_08029A9C: .4byte gBankTarget\n_08029AA0: .4byte gBattlescriptCurrInstr\n_08029AA4:\n    ldr r6, _08029BE0 @ =gBattleCommunication\n    ldrb r0, [r6]\n    mov r8, r0\n    cmp r0, 0x5\n    bls _08029AB0\n    b _08029C0C\n_08029AB0:\n    adds r4, r6, 0\n    movs r5, 0x64\n_08029AB4:\n    ldrb r0, [r4]\n    muls r0, r5\n    adds r0, r7, r0\n    movs r1, 0x39\n    bl GetMonData\n    cmp r0, 0\n    beq _08029AF8\n    ldrb r0, [r6]\n    muls r0, r5\n    adds r0, r7, r0\n    movs r1, 0x41\n    bl GetMonData\n    cmp r0, 0\n    beq _08029AF8\n    ldrb r0, [r4]\n    muls r0, r5\n    adds r0, r7, r0\n    movs r1, 0x41\n    bl GetMonData\n    movs r1, 0xCE\n    lsls r1, 1\n    cmp r0, r1\n    beq _08029AF8\n    ldrb r0, [r4]\n    muls r0, r5\n    adds r0, r7, r0\n    movs r1, 0x37\n    bl GetMonData\n    cmp r0, 0\n    beq _08029B08\n_08029AF8:\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n    adds r6, r4, 0\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x5\n    bls _08029AB4\n_08029B08:\n    ldr r1, _08029BE0 @ =gBattleCommunication\n    mov r9, r1\n    ldrb r2, [r1]\n    cmp r2, 0x5\n    bhi _08029C0C\n    ldr r1, _08029BE4 @ =gBattleTextBuff1\n    movs r0, 0xFD\n    strb r0, [r1]\n    movs r0, 0x4\n    strb r0, [r1, 0x1]\n    ldr r6, _08029BE8 @ =gBankAttacker\n    ldrb r0, [r6]\n    strb r0, [r1, 0x2]\n    strb r2, [r1, 0x3]\n    movs r0, 0xFF\n    strb r0, [r1, 0x4]\n    ldr r1, _08029BEC @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x9\n    str r0, [r1]\n    ldr r2, _08029BF0 @ =gBattleMoveDamage\n    mov r8, r2\n    ldr r5, _08029BF4 @ =gBaseStats\n    mov r1, r9\n    ldrb r0, [r1]\n    movs r4, 0x64\n    muls r0, r4\n    adds r0, r7, r0\n    movs r1, 0xB\n    bl GetMonData\n    lsls r1, r0, 3\n    subs r1, r0\n    lsls r1, 2\n    adds r1, r5\n    ldrb r3, [r1, 0x1]\n    mov r2, r8\n    str r3, [r2]\n    ldr r2, _08029BF8 @ =gBattleMoves\n    ldr r0, _08029BFC @ =gCurrentMove\n    ldrh r1, [r0]\n    lsls r0, r1, 1\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r2\n    ldrb r0, [r0, 0x1]\n    muls r0, r3\n    mov r1, r8\n    str r0, [r1]\n    mov r2, r9\n    ldrb r0, [r2]\n    muls r0, r4\n    adds r0, r7, r0\n    movs r1, 0x38\n    bl GetMonData\n    lsls r0, 1\n    movs r1, 0x5\n    bl __udivsi3\n    adds r0, 0x2\n    mov r2, r8\n    ldr r1, [r2]\n    muls r0, r1\n    str r0, [r2]\n    ldr r3, _08029C00 @ =gBattleMons\n    ldr r1, _08029C04 @ =gBankTarget\n    ldrb r2, [r1]\n    movs r1, 0x58\n    muls r1, r2\n    adds r1, r3\n    ldrh r2, [r1]\n    lsls r1, r2, 3\n    subs r1, r2\n    lsls r1, 2\n    adds r1, r5\n    ldrb r1, [r1, 0x2]\n    bl __divsi3\n    mov r1, r8\n    str r0, [r1]\n    movs r1, 0x32\n    bl __divsi3\n    adds r2, r0, 0x2\n    mov r0, r8\n    str r2, [r0]\n    ldr r1, _08029C08 @ =gProtectStructs\n    ldrb r0, [r6]\n    lsls r0, 4\n    adds r0, r1\n    ldrb r0, [r0]\n    lsls r0, 28\n    cmp r0, 0\n    bge _08029BD4\n    lsls r0, r2, 4\n    subs r0, r2\n    movs r1, 0xA\n    bl __divsi3\n    mov r1, r8\n    str r0, [r1]\n_08029BD4:\n    mov r2, r9\n    ldrb r0, [r2]\n    adds r0, 0x1\n    strb r0, [r2]\n    b _08029C46\n    .align 2, 0\n_08029BE0: .4byte gBattleCommunication\n_08029BE4: .4byte gBattleTextBuff1\n_08029BE8: .4byte gBankAttacker\n_08029BEC: .4byte gBattlescriptCurrInstr\n_08029BF0: .4byte gBattleMoveDamage\n_08029BF4: .4byte gBaseStats\n_08029BF8: .4byte gBattleMoves\n_08029BFC: .4byte gCurrentMove\n_08029C00: .4byte gBattleMons\n_08029C04: .4byte gBankTarget\n_08029C08: .4byte gProtectStructs\n_08029C0C:\n    mov r0, r8\n    cmp r0, 0\n    beq _08029C2C\n    ldr r3, _08029C28 @ =gBattlescriptCurrInstr\n    ldr r2, [r3]\n    ldrb r1, [r2, 0x1]\n    ldrb r0, [r2, 0x2]\n    lsls r0, 8\n    orrs r1, r0\n    ldrb r0, [r2, 0x3]\n    lsls r0, 16\n    orrs r1, r0\n    ldrb r0, [r2, 0x4]\n    b _08029C40\n    .align 2, 0\n_08029C28: .4byte gBattlescriptCurrInstr\n_08029C2C:\n    ldr r3, _08029C54 @ =gBattlescriptCurrInstr\n    ldr r2, [r3]\n    ldrb r1, [r2, 0x5]\n    ldrb r0, [r2, 0x6]\n    lsls r0, 8\n    orrs r1, r0\n    ldrb r0, [r2, 0x7]\n    lsls r0, 16\n    orrs r1, r0\n    ldrb r0, [r2, 0x8]\n_08029C40:\n    lsls r0, 24\n    orrs r1, r0\n    str r1, [r3]\n_08029C46:\n    pop {r3,r4}\n    mov r8, r3\n    mov r9, r4\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08029C54: .4byte gBattlescriptCurrInstr\n        .syntax divided");
# 15858 "src/battle/battle_4.c"
}


static void atkC5_hidepreattack(void)
{
    switch (gCurrentMove)
    {
    case MOVE_FLY:
    case MOVE_BOUNCE:
        gStatuses3[gBankAttacker] |= 0x40;
        break;
    case MOVE_DIG:
        gStatuses3[gBankAttacker] |= 0x80;
        break;
    case MOVE_DIVE:
        gStatuses3[gBankAttacker] |= 0x40000;
        break;
    }
    gBattlescriptCurrInstr++;
}

static void atkC6_unhidepostattack(void)
{
    switch (gCurrentMove)
    {
    case MOVE_FLY:
    case MOVE_BOUNCE:
        gStatuses3[gBankAttacker] &= ~0x40;
        break;
    case MOVE_DIG:
        gStatuses3[gBankAttacker] &= ~0x80;
        break;
    case MOVE_DIVE:
        gStatuses3[gBankAttacker] &= ~0x40000;
        break;
    }
    gBattlescriptCurrInstr++;
}

static void atkC7_setminimize(void)
{
    if (gHitMarker & 0x02000000)
        gStatuses3[gBankAttacker] |= 0x100;
    gBattlescriptCurrInstr++;
}

static void atkC8_sethail(void)
{
    if (gBattleWeather & (1 << 7))
    {
        gBattleMoveFlags |= (1 << 0);
        gBattleCommunication[0x5] = 2;
    }
    else
    {
        gBattleWeather = (1 << 7);
        gBattleCommunication[0x5] = 5;
        gWishFutureKnock.weatherDuration = 5;
    }
    gBattlescriptCurrInstr++;
}

static void atkC9_jumpifattackandspecialattackcannotfall(void)
{
    if (gBattleMons[gBankTarget].statStages[STAT_STAGE_ATK] == 0
        && gBattleMons[gBankTarget].statStages[STAT_STAGE_SPATK] == 0
        && gBattleCommunication[6] != 1)
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
    {
        gActiveBank = gBankAttacker;
        gBattleMoveDamage = gBattleMons[gActiveBank].hp;
        EmitHealthBarUpdate(0, 0x7FFF);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 5;
    }
}

static void atkCA_setforcedtarget(void)
{
    gSideTimer[GetBankSide(gBankAttacker)].followmeTimer = 1;
    gSideTimer[GetBankSide(gBankAttacker)].followmeTarget = gBankAttacker;
    gBattlescriptCurrInstr++;
}

static void atkCB_setcharge(void)
{
    gStatuses3[gBankAttacker] |= 0x200;
    gDisableStructs[gBankAttacker].chargeTimer1 = 2;
    gDisableStructs[gBankAttacker].chargeTimer2 = 2;
    gBattlescriptCurrInstr++;
}

static void atkCC_callterrainattack(void)
{
    gHitMarker &= ~(0x00000400);
    gCurrentMove = sNaturePowerMoves[gBattleTerrain];
    gBankTarget = GetMoveTarget(gCurrentMove, 0);
    b_movescr_stack_push(gBattleScriptsEffectsTable[gBattleMoves[gCurrentMove].effect]);
    gBattlescriptCurrInstr++;
}

static void atkCD_cureifburnedparalysedorpoisoned(void)
{
    if (gBattleMons[gBankAttacker].status1 & (0x8 | 0x10 | 0x40 | 0x80))
    {
        gBattleMons[gBankAttacker].status1 = 0;
        gBattlescriptCurrInstr += 5;
        gActiveBank = gBankAttacker;
        EmitSetAttributes(0, 0x28, 0, 4, &gBattleMons[gActiveBank].status1);
        MarkBufferBankForExecution(gActiveBank);
    }
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atkCE_settorment(void)
{
    if (gBattleMons[gBankTarget].status2 & 0x80000000)
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
    {
        gBattleMons[gBankTarget].status2 |= 0x80000000;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkCF_jumpifnodamage(void)
{
    if (gProtectStructs[gBankAttacker].physicalDmg || gProtectStructs[gBankAttacker].specialDmg)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atkD0_settaunt(void)
{
    if (gDisableStructs[gBankTarget].tauntTimer1 == 0)
    {
        gDisableStructs[gBankTarget].tauntTimer1 = 2;
        gDisableStructs[gBankTarget].tauntTimer2 = 2;
        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atkD1_set_helpinghand(void)
{
    gBankTarget = GetBankByPlayerAI(GetBankIdentity(gBankAttacker) ^ 2);
    if (gBattleTypeFlags & 0x0001 && !(gAbsentBankFlags & gBitTable[gBankTarget])
        && !gProtectStructs[gBankAttacker].helpingHand && !gProtectStructs[gBankTarget].helpingHand)
    {
        gProtectStructs[gBankTarget].helpingHand = 1;
        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}
# 16031 "src/battle/battle_4.c"
__attribute__((naked))
static void atkD2_swap_items(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x4\n    ldr r0, _0802A30C @ =gBankAttacker\n    ldrb r0, [r0]\n    bl GetBankSide\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x1\n    bne _0802A24C\n    ldr r0, _0802A310 @ =gBattleTypeFlags\n    ldrh r1, [r0]\n    ldr r0, _0802A314 @ =0x00000902\n    ands r0, r1\n    cmp r0, 0\n    bne _0802A24C\n    ldr r0, _0802A318 @ =gTrainerBattleOpponent\n    ldrh r1, [r0]\n    movs r0, 0x80\n    lsls r0, 3\n    cmp r1, r0\n    bne _0802A2EE\n_0802A24C:\n    ldr r4, _0802A30C @ =gBankAttacker\n    ldrb r0, [r4]\n    bl GetBankSide\n    lsls r0, 24\n    lsrs r2, r0, 24\n    ldr r0, _0802A310 @ =gBattleTypeFlags\n    ldrh r1, [r0]\n    ldr r0, _0802A314 @ =0x00000902\n    ands r0, r1\n    cmp r0, 0\n    bne _0802A290\n    ldr r0, _0802A318 @ =gTrainerBattleOpponent\n    ldrh r1, [r0]\n    movs r0, 0x80\n    lsls r0, 3\n    cmp r1, r0\n    beq _0802A290\n    ldr r0, _0802A31C @ =gWishFutureKnock\n    adds r0, 0x29\n    adds r0, r2, r0\n    ldrb r1, [r0]\n    ldr r3, _0802A320 @ =gBitTable\n    ldr r2, _0802A324 @ =gBattlePartyID\n    ldrb r0, [r4]\n    lsls r0, 1\n    adds r0, r2\n    ldrh r0, [r0]\n    lsls r0, 2\n    adds r0, r3\n    ldr r0, [r0]\n    ands r1, r0\n    cmp r1, 0\n    bne _0802A2EE\n_0802A290:\n    ldr r0, _0802A328 @ =gBattleMons\n    mov r9, r0\n    ldr r1, _0802A30C @ =gBankAttacker\n    ldrb r4, [r1]\n    movs r2, 0x58\n    mov r8, r2\n    mov r0, r8\n    muls r0, r4\n    mov r3, r9\n    adds r5, r0, r3\n    ldrh r3, [r5, 0x2E]\n    adds r1, r3, 0\n    cmp r1, 0\n    bne _0802A2BE\n    ldr r0, _0802A32C @ =gBankTarget\n    ldrb r0, [r0]\n    mov r2, r8\n    muls r2, r0\n    adds r0, r2, 0\n    add r0, r9\n    ldrh r0, [r0, 0x2E]\n    cmp r0, 0\n    beq _0802A2EE\n_0802A2BE:\n    cmp r1, 0xAF\n    beq _0802A2EE\n    ldr r7, _0802A32C @ =gBankTarget\n    ldrb r0, [r7]\n    mov r1, r8\n    muls r1, r0\n    adds r0, r1, 0\n    mov r1, r9\n    adds r2, r0, r1\n    ldrh r1, [r2, 0x2E]\n    cmp r1, 0xAF\n    beq _0802A2EE\n    adds r0, r3, 0\n    subs r0, 0x79\n    lsls r0, 16\n    lsrs r0, 16\n    cmp r0, 0xB\n    bls _0802A2EE\n    adds r0, r1, 0\n    subs r0, 0x79\n    lsls r0, 16\n    lsrs r0, 16\n    cmp r0, 0xB\n    bhi _0802A334\n_0802A2EE:\n    ldr r3, _0802A330 @ =gBattlescriptCurrInstr\n    ldr r2, [r3]\n    ldrb r1, [r2, 0x1]\n    ldrb r0, [r2, 0x2]\n    lsls r0, 8\n    orrs r1, r0\n    ldrb r0, [r2, 0x3]\n    lsls r0, 16\n    orrs r1, r0\n    ldrb r0, [r2, 0x4]\n    lsls r0, 24\n    orrs r1, r0\n    str r1, [r3]\n    b _0802A49A\n    .align 2, 0\n_0802A30C: .4byte gBankAttacker\n_0802A310: .4byte gBattleTypeFlags\n_0802A314: .4byte 0x00000902\n_0802A318: .4byte gTrainerBattleOpponent\n_0802A31C: .4byte gWishFutureKnock\n_0802A320: .4byte gBitTable\n_0802A324: .4byte gBattlePartyID\n_0802A328: .4byte gBattleMons\n_0802A32C: .4byte gBankTarget\n_0802A330: .4byte gBattlescriptCurrInstr\n_0802A334:\n    adds r0, r2, 0\n    adds r0, 0x20\n    ldrb r0, [r0]\n    cmp r0, 0x3C\n    bne _0802A36C\n    ldr r1, _0802A360 @ =gBattlescriptCurrInstr\n    ldr r0, _0802A364 @ =BattleScript_NoItemSteal\n    str r0, [r1]\n    ldr r1, _0802A368 @ =gLastUsedAbility\n    ldrb r0, [r7]\n    mov r2, r8\n    muls r2, r0\n    adds r0, r2, 0\n    add r0, r9\n    adds r0, 0x20\n    ldrb r0, [r0]\n    strb r0, [r1]\n    ldrb r0, [r7]\n    ldrb r1, [r1]\n    bl RecordAbilityBattle\n    b _0802A49A\n    .align 2, 0\n_0802A360: .4byte gBattlescriptCurrInstr\n_0802A364: .4byte BattleScript_NoItemSteal\n_0802A368: .4byte gLastUsedAbility\n_0802A36C:\n    lsls r0, r4, 1\n    ldr r4, _0802A458 @ =gSharedMem + 0x160F0\n    adds r6, r0, r4\n    ldrh r5, [r5, 0x2E]\n    mov r10, r5\n    strh r1, [r6]\n    ldr r3, _0802A45C @ =gBankAttacker\n    ldrb r0, [r3]\n    mov r1, r8\n    muls r1, r0\n    adds r0, r1, 0\n    add r0, r9\n    movs r1, 0\n    strh r1, [r0, 0x2E]\n    ldrb r0, [r7]\n    mov r2, r8\n    muls r2, r0\n    adds r0, r2, 0\n    add r0, r9\n    mov r3, r10\n    strh r3, [r0, 0x2E]\n    ldr r5, _0802A460 @ =gActiveBank\n    ldr r1, _0802A45C @ =gBankAttacker\n    ldrb r0, [r1]\n    strb r0, [r5]\n    str r6, [sp]\n    movs r0, 0\n    movs r1, 0x2\n    movs r2, 0\n    movs r3, 0x2\n    bl EmitSetAttributes\n    ldr r2, _0802A45C @ =gBankAttacker\n    ldrb r0, [r2]\n    bl MarkBufferBankForExecution\n    ldrb r0, [r7]\n    strb r0, [r5]\n    ldrb r0, [r7]\n    mov r3, r8\n    muls r3, r0\n    adds r0, r3, 0\n    mov r1, r9\n    adds r1, 0x2E\n    adds r0, r1\n    str r0, [sp]\n    movs r0, 0\n    movs r1, 0x2\n    movs r2, 0\n    movs r3, 0x2\n    bl EmitSetAttributes\n    ldrb r0, [r7]\n    bl MarkBufferBankForExecution\n    ldr r0, _0802A464 @ =0xfffe9f10\n    adds r4, r0\n    ldrb r0, [r7]\n    lsls r0, 1\n    ldr r2, _0802A468 @ =0x000160e8\n    adds r0, r2\n    adds r0, r4\n    movs r1, 0\n    strb r1, [r0]\n    ldrb r0, [r7]\n    lsls r0, 1\n    ldr r1, _0802A46C @ =0x000160e9\n    adds r0, r1\n    adds r0, r4\n    movs r3, 0\n    strb r3, [r0]\n    ldr r3, _0802A45C @ =gBankAttacker\n    ldrb r0, [r3]\n    lsls r0, 1\n    adds r0, r2\n    adds r0, r4\n    movs r2, 0\n    strb r2, [r0]\n    ldrb r0, [r3]\n    lsls r0, 1\n    adds r0, r1\n    adds r0, r4\n    strb r2, [r0]\n    ldr r1, _0802A470 @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x5\n    str r0, [r1]\n    ldr r1, _0802A474 @ =gBattleTextBuff1\n    movs r3, 0xFD\n    strb r3, [r1]\n    movs r2, 0xA\n    strb r2, [r1, 0x1]\n    ldrh r0, [r6]\n    strb r0, [r1, 0x2]\n    ldrh r0, [r6]\n    lsrs r0, 8\n    strb r0, [r1, 0x3]\n    movs r0, 0xFF\n    strb r0, [r1, 0x4]\n    ldr r1, _0802A478 @ =gBattleTextBuff2\n    strb r3, [r1]\n    strb r2, [r1, 0x1]\n    mov r3, r10\n    strb r3, [r1, 0x2]\n    mov r2, r10\n    lsrs r0, r2, 8\n    strb r0, [r1, 0x3]\n    movs r0, 0x1\n    negs r0, r0\n    strb r0, [r1, 0x4]\n    cmp r2, 0\n    beq _0802A480\n    ldrh r0, [r6]\n    cmp r0, 0\n    beq _0802A494\n    ldr r1, _0802A47C @ =gBattleCommunication\n    movs r0, 0x2\n    b _0802A498\n    .align 2, 0\n_0802A458: .4byte gSharedMem + 0x160F0\n_0802A45C: .4byte gBankAttacker\n_0802A460: .4byte gActiveBank\n_0802A464: .4byte 0xfffe9f10\n_0802A468: .4byte 0x000160e8\n_0802A46C: .4byte 0x000160e9\n_0802A470: .4byte gBattlescriptCurrInstr\n_0802A474: .4byte gBattleTextBuff1\n_0802A478: .4byte gBattleTextBuff2\n_0802A47C: .4byte gBattleCommunication\n_0802A480:\n    ldrh r0, [r6]\n    cmp r0, 0\n    beq _0802A494\n    ldr r0, _0802A490 @ =gBattleCommunication\n    movs r3, 0\n    strb r3, [r0, 0x5]\n    b _0802A49A\n    .align 2, 0\n_0802A490: .4byte gBattleCommunication\n_0802A494:\n    ldr r1, _0802A4AC @ =gBattleCommunication\n    movs r0, 0x1\n_0802A498:\n    strb r0, [r1, 0x5]\n_0802A49A:\n    add sp, 0x4\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0802A4AC: .4byte gBattleCommunication\n        .syntax divided");
# 16348 "src/battle/battle_4.c"
}


static void atkD3_copy_ability(void)
{
    if (gBattleMons[gBankTarget].ability != 0 && gBattleMons[gBankTarget].ability != ABILITY_WONDER_GUARD)
    {
        gBattleMons[gBankAttacker].ability = gBattleMons[gBankTarget].ability;
        gLastUsedAbility = gBattleMons[gBankTarget].ability;
        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atkD4_wish_effect(void)
{
    switch (((gBattlescriptCurrInstr + 1)[0]))
    {
    case 0:
        if (gWishFutureKnock.wishCounter[gBankAttacker] == 0)
        {
            gWishFutureKnock.wishCounter[gBankAttacker] = 2;
            gWishFutureKnock.wishUserID[gBankAttacker] = gBattlePartyID[gBankAttacker];
            gBattlescriptCurrInstr += 6;
        }
        else
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 2)[0] | ((gBattlescriptCurrInstr + 2)[1] << 8) | ((gBattlescriptCurrInstr + 2)[2] << 16) | ((gBattlescriptCurrInstr + 2)[3] << 24));
        break;
    case 1:
        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 4;
        gBattleTextBuff1[2] = gBankTarget;
        gBattleTextBuff1[3] = gWishFutureKnock.wishUserID[gBankTarget];
        gBattleTextBuff1[4] = 0xFF;
        gBattleMoveDamage = gBattleMons[gBankTarget].maxHP / 2;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;
        if (gBattleMons[gBankTarget].hp == gBattleMons[gBankTarget].maxHP)
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 2)[0] | ((gBattlescriptCurrInstr + 2)[1] << 8) | ((gBattlescriptCurrInstr + 2)[2] << 16) | ((gBattlescriptCurrInstr + 2)[3] << 24));
        else
            gBattlescriptCurrInstr += 6;
        break;
    }
}

static void atkD5_setroots(void)
{
    if (gStatuses3[gBankAttacker] & 0x400)
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
    {
        gStatuses3[gBankAttacker] |= 0x400;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkD6_doubledamagedealtifdamaged(void)
{
    if ((gProtectStructs[gBankAttacker].physicalDmg && gProtectStructs[gBankAttacker].physicalBank == gBankTarget)
        || (gProtectStructs[gBankAttacker].specialDmg && gProtectStructs[gBankAttacker].specialBank == gBankTarget))
            ((struct BattleStruct *) (gSharedMem + 0x0))->dmgMultiplier = 2;
    gBattlescriptCurrInstr++;
}

static void atkD7_setyawn(void)
{
    if (gStatuses3[gBankTarget] & 0x1800 || (u8) gBattleMons[gBankTarget].status1)
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
    {
        gStatuses3[gBankTarget] |= 0x1000;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkD8_setdamagetohealthdifference(void)
{
    if (gBattleMons[gBankTarget].hp <= gBattleMons[gBankAttacker].hp)
    {
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
    else
    {
        gBattleMoveDamage = gBattleMons[gBankTarget].hp - gBattleMons[gBankAttacker].hp;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkD9_scaledamagebyhealthratio(void)
{
    if (gDynamicBasePower == 0)
    {
        u8 power = gBattleMoves[gCurrentMove].power;
        gDynamicBasePower = gBattleMons[gBankAttacker].hp * power / gBattleMons[gBankAttacker].maxHP;
        if (gDynamicBasePower == 0)
            gDynamicBasePower = 1;
    }
    gBattlescriptCurrInstr++;
}

static void atkDA_abilityswap(void)
{
    if ((gBattleMons[gBankAttacker].ability == 0 && gBattleMons[gBankTarget].ability == 0)
     || gBattleMons[gBankAttacker].ability == ABILITY_WONDER_GUARD || gBattleMons[gBankTarget].ability == ABILITY_WONDER_GUARD
     || gBattleMoveFlags & (((1 << 0) | (1 << 3) | (1 << 5))))
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
    {
        u8 atk_ability = gBattleMons[gBankAttacker].ability;
        gBattleMons[gBankAttacker].ability = gBattleMons[gBankTarget].ability;
        gBattleMons[gBankTarget].ability = atk_ability;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkDB_imprisoneffect(void)
{
    u8 r8 = 0;
    if ((gStatuses3[gBankAttacker] & 0x2000))
    {
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
    else
    {
        u8 bank;
        sub_801529C(gBankAttacker);
        for (bank = 0; bank < gNoOfAllBanks; bank++)
        {
            if (r8 != GetBankSide(bank))
            {
                int j;
                for (j = 0; j < 4; j++)
                {
                    int k;
                    for (k = 0; k < 4; k++)
                    {
                        if (gBattleMons[gBankAttacker].moves[j] == gBattleMons[bank].moves[k] && gBattleMons[gBankAttacker].moves[j])
                            break;
                    }
                    if (k != 4)
                        break;
                }
                if (j != 4)
                {
                    gStatuses3[gBankAttacker] |= 0x2000;
                    gBattlescriptCurrInstr += 5;
                    break;
                }
            }
        }
        if (bank == gNoOfAllBanks)
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    }
}

static void atkDC_setgrudge(void)
{
    if (gStatuses3[gBankAttacker] & 0x4000)
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
    {
        gStatuses3[gBankAttacker] |= 0x4000;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkDD_weightdamagecalculation(void)
{
    int i;
    for (i = 0; sWeightDamage[i] != 0xFFFF; i += 2)
    {
        if (sWeightDamage[i] > GetPokedexHeightWeight(SpeciesToNationalPokedexNum(gBattleMons[gBankTarget].species), 1))
            break;
    }
    if (sWeightDamage[i] != 0xFFFF)
        gDynamicBasePower = sWeightDamage[i + 1];
    else
        gDynamicBasePower = 120;
    gBattlescriptCurrInstr++;
}
# 16586 "src/battle/battle_4.c"
__attribute__((naked))
static void atkDE_asistattackselect(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x8\n    movs r0, 0\n    mov r10, r0\n    ldr r0, _0802AB9C @ =gBankAttacker\n    ldrb r0, [r0]\n    bl GetBankIdentity\n    movs r1, 0x1\n    ands r1, r0\n    ldr r0, _0802ABA0 @ =gPlayerParty\n    str r0, [sp]\n    cmp r1, 0\n    beq _0802AAAC\n    ldr r1, _0802ABA4 @ =gEnemyParty\n    str r1, [sp]\n_0802AAAC:\n    movs r2, 0\n_0802AAAE:\n    ldr r1, _0802ABA8 @ =gBattlePartyID\n    ldr r0, _0802AB9C @ =gBankAttacker\n    ldrb r0, [r0]\n    lsls r0, 1\n    adds r0, r1\n    adds r1, r2, 0x1\n    str r1, [sp, 0x4]\n    ldrh r0, [r0]\n    cmp r2, r0\n    beq _0802AB54\n    movs r0, 0x64\n    adds r6, r2, 0\n    muls r6, r0\n    ldr r0, [sp]\n    adds r4, r0, r6\n    adds r0, r4, 0\n    movs r1, 0x41\n    bl GetMonData\n    cmp r0, 0\n    beq _0802AB54\n    adds r0, r4, 0\n    movs r1, 0x41\n    bl GetMonData\n    movs r1, 0xCE\n    lsls r1, 1\n    cmp r0, r1\n    beq _0802AB54\n    movs r5, 0\n    ldr r1, _0802ABAC @ =0x0000ffff\n    mov r8, r1\n    mov r9, r6\n    mov r1, r10\n    lsls r0, r1, 1\n    ldr r1, _0802ABB0 @ =gSharedMem + 0x16024\n    adds r6, r0, r1\n_0802AAF8:\n    movs r7, 0\n    adds r1, r5, 0\n    adds r1, 0xD\n    ldr r0, [sp]\n    add r0, r9\n    bl GetMonData\n    lsls r0, 16\n    lsrs r4, r0, 16\n    adds r0, r4, 0\n    bl IsMoveUnchoosable\n    lsls r0, 24\n    adds r1, r5, 0x1\n    cmp r0, 0\n    bne _0802AB4E\n    ldr r0, _0802ABB4 @ =sUnknown_081FACFE\n    ldrh r2, [r0]\n    adds r3, r0, 0\n    cmp r2, r8\n    beq _0802AB42\n    cmp r4, r2\n    beq _0802AB38\n    ldr r5, _0802ABAC @ =0x0000ffff\n    adds r2, r3, 0\n_0802AB2A:\n    adds r2, 0x2\n    adds r7, 0x1\n    ldrh r0, [r2]\n    cmp r0, r5\n    beq _0802AB42\n    cmp r4, r0\n    bne _0802AB2A\n_0802AB38:\n    lsls r0, r7, 1\n    adds r0, r3\n    ldrh r0, [r0]\n    cmp r0, r8\n    bne _0802AB4E\n_0802AB42:\n    cmp r4, 0\n    beq _0802AB4E\n    strh r4, [r6]\n    adds r6, 0x2\n    movs r0, 0x1\n    add r10, r0\n_0802AB4E:\n    adds r5, r1, 0\n    cmp r5, 0x3\n    ble _0802AAF8\n_0802AB54:\n    ldr r2, [sp, 0x4]\n    cmp r2, 0x5\n    ble _0802AAAE\n    mov r1, r10\n    cmp r1, 0\n    beq _0802ABCC\n    ldr r2, _0802ABB8 @ =gHitMarker\n    ldr r0, [r2]\n    ldr r1, _0802ABBC @ =0xfffffbff\n    ands r0, r1\n    str r0, [r2]\n    ldr r4, _0802ABC0 @ =gRandomMove\n    bl Random\n    movs r1, 0xFF\n    ands r1, r0\n    mov r0, r10\n    muls r0, r1\n    asrs r0, 8\n    lsls r0, 1\n    ldr r1, _0802ABB0 @ =gSharedMem + 0x16024\n    adds r0, r1\n    ldrh r0, [r0]\n    strh r0, [r4]\n    ldrh r0, [r4]\n    movs r1, 0\n    bl GetMoveTarget\n    ldr r1, _0802ABC4 @ =gBankTarget\n    strb r0, [r1]\n    ldr r1, _0802ABC8 @ =gBattlescriptCurrInstr\n    ldr r0, [r1]\n    adds r0, 0x5\n    str r0, [r1]\n    b _0802ABE6\n    .align 2, 0\n_0802AB9C: .4byte gBankAttacker\n_0802ABA0: .4byte gPlayerParty\n_0802ABA4: .4byte gEnemyParty\n_0802ABA8: .4byte gBattlePartyID\n_0802ABAC: .4byte 0x0000ffff\n_0802ABB0: .4byte gSharedMem + 0x16024\n_0802ABB4: .4byte sUnknown_081FACFE\n_0802ABB8: .4byte gHitMarker\n_0802ABBC: .4byte 0xfffffbff\n_0802ABC0: .4byte gRandomMove\n_0802ABC4: .4byte gBankTarget\n_0802ABC8: .4byte gBattlescriptCurrInstr\n_0802ABCC:\n    ldr r3, _0802ABF8 @ =gBattlescriptCurrInstr\n    ldr r2, [r3]\n    ldrb r1, [r2, 0x1]\n    ldrb r0, [r2, 0x2]\n    lsls r0, 8\n    orrs r1, r0\n    ldrb r0, [r2, 0x3]\n    lsls r0, 16\n    orrs r1, r0\n    ldrb r0, [r2, 0x4]\n    lsls r0, 24\n    orrs r1, r0\n    str r1, [r3]\n_0802ABE6:\n    add sp, 0x8\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0802ABF8: .4byte gBattlescriptCurrInstr\n        .syntax divided");
# 16769 "src/battle/battle_4.c"
}



static void atkDF_setmagiccoat(void)
{
    gBankTarget = gBankAttacker;
    gSpecialStatuses[gBankAttacker].flag20 = 1;
    if (gCurrentMoveTurn == gNoOfAllBanks - 1)
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
    {
        gProtectStructs[gBankAttacker].bounceMove = 1;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkE0_setstealstatchange(void)
{
    gSpecialStatuses[gBankAttacker].flag20 = 1;
    if (gCurrentMoveTurn == gNoOfAllBanks - 1)
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
    {
        gProtectStructs[gBankAttacker].stealMove = 1;
        gBattlescriptCurrInstr += 5;
    }
}

static void atkE1_intimidate_string_loader(void)
{
    u8 side;

    ((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive = (gSharedMem[0x160DD]);
    side = GetBankSide(((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive);
    gBattleTextBuff1[0] = 0xFD;
    gBattleTextBuff1[1] = 9;
    gBattleTextBuff1[2] = gBattleMons[((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive].ability;
    gBattleTextBuff1[3] = 0xFF;

    for (;gBankTarget < gNoOfAllBanks; gBankTarget++)
    {
        if (GetBankSide(gBankTarget) == side)
            continue;
        if (!(gAbsentBankFlags & gBitTable[gBankTarget]))
            break;
    }

    if (gBankTarget >= gNoOfAllBanks)
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
        gBattlescriptCurrInstr += 5;
}

static void atkE2_switchout_abilities(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    switch (gBattleMons[gActiveBank].ability)
    {
    case ABILITY_NATURAL_CURE:
        gBattleMons[gActiveBank].status1 = 0;
        EmitSetAttributes(0, 0x28, gBitTable[(gSharedMem[0x16064 + gActiveBank])], 4, &gBattleMons[gActiveBank].status1);
        MarkBufferBankForExecution(gActiveBank);
        break;
    }
    gBattlescriptCurrInstr += 2;
}

static void atkE3_jumpiffainted(void)
{
    gActiveBank = GetBattleBank(((gBattlescriptCurrInstr + 1)[0]));
    if (gBattleMons[gActiveBank].hp == 0)
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 2)[0] | ((gBattlescriptCurrInstr + 2)[1] << 8) | ((gBattlescriptCurrInstr + 2)[2] << 16) | ((gBattlescriptCurrInstr + 2)[3] << 24));
    else
        gBattlescriptCurrInstr += 6;
}

static void atkE4_getsecretpowereffect(void)
{
    switch (gBattleTerrain)
    {
    case BATTLE_TERRAIN_GRASS:
        gBattleCommunication[0x3] = 2;
        break;
    case BATTLE_TERRAIN_LONG_GRASS:
        gBattleCommunication[0x3] = 1;
        break;
    case BATTLE_TERRAIN_SAND:
        gBattleCommunication[0x3] = 27;
        break;
    case BATTLE_TERRAIN_UNDERWATER:
        gBattleCommunication[0x3] = 23;
        break;
    case BATTLE_TERRAIN_WATER:
        gBattleCommunication[0x3] = 22;
        break;
    case BATTLE_TERRAIN_POND:
        gBattleCommunication[0x3] = 24;
        break;
    case BATTLE_TERRAIN_MOUNTAIN:
        gBattleCommunication[0x3] = 7;
        break;
    case BATTLE_TERRAIN_CAVE:
        gBattleCommunication[0x3] = 8;
        break;
    default:
        gBattleCommunication[0x3] = 5;
        break;
    }
    gBattlescriptCurrInstr++;
}

static void atkE5_pickup(void)
{
    int i;
    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&gPlayerParty[i], 65);
        u16 held_item = GetMonData(&gPlayerParty[i], 12);
        u8 ability;
        if (GetMonData(&gPlayerParty[i], 46))
            ability = gBaseStats[species].ability2;
        else
            ability = gBaseStats[species].ability1;

        if (ability == ABILITY_PICKUP && species != 0 && species != SPECIES_EGG && held_item == 0 && (Random() % 10) == 0)
        {
            s32 chance = Random() % 100;
            s32 j;
            for (j = 0; j < 18; j += 2)
            {
                if (sPickupItems[j + 1] > chance)
                    break;
            }
            SetMonData(&gPlayerParty[i], 12, (const void*) &sPickupItems[j]);
        }
    }
    gBattlescriptCurrInstr++;
}

static void atkE6_castform_change_animation(void)
{
    gActiveBank = ((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive;
    if (gBattleMons[gActiveBank].status2 & 0x01000000)
        ((struct BattleStruct *) (gSharedMem + 0x0))->castformToChangeInto |= 0x80;
    EmitBattleAnimation(0, 0x0, ((struct BattleStruct *) (gSharedMem + 0x0))->castformToChangeInto);
    MarkBufferBankForExecution(gActiveBank);
    gBattlescriptCurrInstr++;
}

static void atkE7_castform_data_change(void)
{
    u8 form;
    gBattlescriptCurrInstr++;
    form = CastformDataTypeChange(((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive);
    if (form)
    {
        b_push_move_exec(BattleScript_CastformChange);
        ((struct BattleStruct *) (gSharedMem + 0x0))->castformToChangeInto = form - 1;
    }
}

static void atkE8_settypebasedhalvers(void)
{
    bool8 worked = 0;
    if (gBattleMoves[gCurrentMove].effect == EFFECT_MUD_SPORT)
    {
        if (!(gStatuses3[gBankAttacker] & 0x10000))
        {
            gStatuses3[gBankAttacker] |= 0x10000;
            gBattleCommunication[0x5] = 0;
            worked = 1;
        }
    }
    else
    {
        if (!(gStatuses3[gBankAttacker] & 0x20000))
        {
            gStatuses3[gBankAttacker] |= 0x20000;
            gBattleCommunication[0x5] = 1;
            worked = 1;
        }
    }
    if (worked)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atkE9_setweatherballtype(void)
{
    if (((!AbilityBattleEffects(0x13, 0, ABILITY_CLOUD_NINE, 0, 0) && !AbilityBattleEffects(0x13, 0, ABILITY_AIR_LOCK, 0, 0))))
    {
        if ((u8)(gBattleWeather))
            ((struct BattleStruct *) (gSharedMem + 0x0))->dmgMultiplier = 2;
        if (gBattleWeather & (((1 << 0) | (1 << 1) | (1 << 2))))
            ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType = 0x0b | 0x80;
        else if (gBattleWeather & (((1 << 3) | (1 << 4))))
            ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType = 0x05 | 0x80;
        else if (gBattleWeather & (((1 << 5) | (1 << 6))))
            ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType = 0x0a | 0x80;
        else if (gBattleWeather & (1 << 7))
            ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType = 0x0f | 0x80;
        else
            ((struct BattleStruct *) (gSharedMem + 0x0))->dynamicMoveType = 0x00 | 0x80;
    }
    gBattlescriptCurrInstr++;
}

static void atkEA_recycleitem(void)
{
    u16* used_item;
    gActiveBank = gBankAttacker;
    used_item = ((((u16*)(&gSharedMem[0x160CC + gActiveBank * 2]))));
    if (*used_item && gBattleMons[gActiveBank].item == 0)
    {
        gLastUsedItem = *used_item;
        *used_item = 0;
        gBattleMons[gActiveBank].item = gLastUsedItem;
        EmitSetAttributes(0, 0x2, 0, 2, &gBattleMons[gActiveBank].item);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atkEB_settypetoterrain(void)
{
    if (gBattleMons[gBankAttacker].type1 != sTerrainToType[gBattleTerrain] && gBattleMons[gBankAttacker].type2 != sTerrainToType[gBattleTerrain])
    {
        gBattleMons[gBankAttacker].type1 = sTerrainToType[gBattleTerrain];
        gBattleMons[gBankAttacker].type2 = sTerrainToType[gBattleTerrain];
        gBattleTextBuff1[0] = 0xFD;
        gBattleTextBuff1[1] = 3;
        gBattleTextBuff1[2] = sTerrainToType[gBattleTerrain];
        gBattleTextBuff1[3] = 0xFF;
        gBattlescriptCurrInstr += 5;
    }
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atkEC_pursuit_sth(void)
{
    gActiveBank = GetBankByPlayerAI(GetBankIdentity(gBankAttacker) ^ 2);
    if (gBattleTypeFlags & 0x0001 && !(gAbsentBankFlags & gBitTable[gActiveBank]) && gActionForBanks[gActiveBank] == 0 && gChosenMovesByBanks[gActiveBank] == MOVE_PURSUIT)
    {
        gUnknown_02024A76[gActiveBank] = 11;
        gCurrentMove = MOVE_PURSUIT;
        gBattlescriptCurrInstr += 5;
        ((struct BattleStruct *) (gSharedMem + 0x0))->animTurn = 1;
        ((struct BattleStruct *) (gSharedMem + 0x0))->unk160A7 = gBankAttacker;
        gBankAttacker = gActiveBank;
    }
    else
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
}

static void atkED_802B4B4(void)
{
    gEffectBank = gBankAttacker;
    if (gBankAttacker == gBankTarget)
        gBankAttacker = gBankTarget = ((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive;
    else
        gBankTarget = ((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive;
    ((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive = gEffectBank;
    gBattlescriptCurrInstr++;
}

static void atkEE_removelightscreenreflect(void)
{
    u8 side = GetBankSide(gBankAttacker) ^ 1;
    if (gSideTimer[side].reflectTimer || gSideTimer[side].lightscreenTimer)
    {
        gSideAffecting[side] &= ~((1 << 0));
        gSideAffecting[side] &= ~((1 << 1));
        gSideTimer[side].reflectTimer = 0;
        gSideTimer[side].lightscreenTimer = 0;
        ((struct BattleStruct *) (gSharedMem + 0x0))->animTurn = 1;
        ((struct BattleStruct *) (gSharedMem + 0x0))->animTargetsHit = 1;
    }
    else
    {
        ((struct BattleStruct *) (gSharedMem + 0x0))->animTurn = 0;
        ((struct BattleStruct *) (gSharedMem + 0x0))->animTargetsHit = 0;
    }
    gBattlescriptCurrInstr++;
}

void atkEF_pokeball_catch_calculation(void)
{
    u8 ball_multiplier = 0;
    if (gBattleExecBuffer)
        return;

    gActiveBank = gBankAttacker;
    gBankTarget = gBankAttacker ^ 1;
    if (gBattleTypeFlags & 0x0008)
    {
        EmitBallThrow(0, 5);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr = BattleScript_TrainerBallBlock;
    }
    else if (gBattleTypeFlags & 0x0200)
    {
        EmitBallThrow(0, 4);
        MarkBufferBankForExecution(gActiveBank);
        gBattlescriptCurrInstr = BattleScript_WallyBallThrow;
    }
    else
    {
        u32 odds;
        u8 catch_rate;
        if (gLastUsedItem == ITEM_SAFARI_BALL)
            catch_rate = ((struct BattleStruct *) (gSharedMem + 0x0))->unk16089 * 1275 / 100;
        else
            catch_rate = gBaseStats[gBattleMons[gBankTarget].species].catchRate;
        if (gLastUsedItem > 5)
        {
            switch (gLastUsedItem)
            {
            case ITEM_NET_BALL:
                if (gBattleMons[gBankTarget].type1 == 0x0b || gBattleMons[gBankTarget].type2 == 0x0b || gBattleMons[gBankTarget].type1 == 0x06 || gBattleMons[gBankTarget].type2 == 0x06)
                    ball_multiplier = 30;
                else
                    ball_multiplier = 10;
                break;
            case ITEM_DIVE_BALL:
                if (Overworld_GetMapTypeOfSaveblockLocation() == 5)
                    ball_multiplier = 35;
                else
                    ball_multiplier = 10;
                break;
            case ITEM_NEST_BALL:
                if (gBattleMons[gBankTarget].level <= 39)
                {
                    ball_multiplier = 40 - gBattleMons[gBankTarget].level;
                    if (ball_multiplier <= 9)
                        ball_multiplier = 10;
                }
                else
                    ball_multiplier = 10;
                break;
            case ITEM_REPEAT_BALL:
                if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gBankTarget].species), 1))
                    ball_multiplier = 30;
                else
                    ball_multiplier = 10;
                break;
            case ITEM_TIMER_BALL:
                ball_multiplier = gBattleResults.battleTurnCounter + 10;
                if (ball_multiplier > 40)
                    ball_multiplier = 40;
                break;
            case ITEM_LUXURY_BALL:
            case ITEM_PREMIER_BALL:
                ball_multiplier = 10;
                break;
            }
        }
        else
            ball_multiplier = sBallCatchBonuses[gLastUsedItem - 2];

        odds = (catch_rate * ball_multiplier / 10) * (gBattleMons[gBankTarget].maxHP * 3 - gBattleMons[gBankTarget].hp * 2) / (3 * gBattleMons[gBankTarget].maxHP);
        if (gBattleMons[gBankTarget].status1 & (0x7 | 0x20))
            odds *= 2;
        if (gBattleMons[gBankTarget].status1 & (0x8 | 0x10 | 0x40 ))
            odds = (odds * 15) / 10;

        if (gLastUsedItem != ITEM_SAFARI_BALL)
        {
            if (gLastUsedItem == ITEM_MASTER_BALL)
            {
                gBattleResults.unk5_1 = 1;
            }
            else
            {
                if (gBattleResults.unk36[gLastUsedItem - ITEM_ULTRA_BALL] < 0xFF)
                    gBattleResults.unk36[gLastUsedItem - ITEM_ULTRA_BALL]++;
            }
        }
        if (odds > 254)
        {
            EmitBallThrow(0, 4);
            MarkBufferBankForExecution(gActiveBank);
            gBattlescriptCurrInstr = BattleScript_SuccessBallThrow;
            SetMonData(&gEnemyParty[gBattlePartyID[gBankTarget]], 38, (const void*) &gLastUsedItem);
            if (CalculatePlayerPartyCount() == 6)
                gBattleCommunication[0x5] = 0;
            else
                gBattleCommunication[0x5] = 1;
        }
        else
        {
            u8 shakes;
            odds = Sqrt(Sqrt(16711680 / odds));
            odds = 1048560 / odds;
            for (shakes = 0; shakes < 4 && Random() < odds; shakes++) {}
            if (gLastUsedItem == ITEM_MASTER_BALL)
                shakes = 4;
            EmitBallThrow(0, shakes);
            MarkBufferBankForExecution(gActiveBank);
            if (shakes == 4)
            {
                gBattlescriptCurrInstr = BattleScript_SuccessBallThrow;
                SetMonData(&gEnemyParty[gBattlePartyID[gBankTarget]], 38, (const void*) &gLastUsedItem);
                if (CalculatePlayerPartyCount() == 6)
                    gBattleCommunication[0x5] = 0;
                else
                    gBattleCommunication[0x5] = 1;
            }
            else
            {
                gBattleCommunication[0x5] = shakes;
                gBattlescriptCurrInstr = BattleScript_ShakeBallThrow;
            }
        }
    }
}

static void atkF0_copy_caught_poke(void)
{
    GiveMonToPlayer(&gEnemyParty[gBattlePartyID[gBankAttacker ^ 1]]);
    gBattleResults.caughtPoke = gBattleMons[gBankAttacker ^ 1].species;
    GetMonData(&gEnemyParty[gBattlePartyID[gBankAttacker ^ 1]], 2, gBattleResults.caughtNick);
    gBattlescriptCurrInstr++;
}

static void atkF1_setpoke_as_caught(void)
{
    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gBankTarget].species), 1))
        gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
    else
    {
        GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gBankTarget].species), 3);
        if (gBattleMons[gBankTarget].species == SPECIES_UNOWN)
            gSaveBlock2.pokedex.unownPersonality = gBattleMons[gBankTarget].personality;
        if (gBattleMons[gBankTarget].species == SPECIES_SPINDA)
            gSaveBlock2.pokedex.spindaPersonality = gBattleMons[gBankTarget].personality;
        gBattlescriptCurrInstr += 5;
    }
}

extern const u32 gBattleTerrainTiles_Building[];
extern const u32 gBattleTerrainTilemap_Building[];
extern const u32 gBattleTerrainPalette_BattleTower[];

static void atkF2_display_dex_info(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
        gBattleCommunication[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            gBattleCommunication[1] = sub_809070C(SpeciesToNationalPokedexNum(gBattleMons[gBankTarget].species), gBattleMons[gBankTarget].otId, gBattleMons[gBankTarget].personality);
            gBattleCommunication[0]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active && gMain.callback2 == sub_800F808 && !gTasks[gBattleCommunication[1]].isActive)
        {
            LZDecompressVram(gBattleTerrainTiles_Building, (void*)(0x06008000));
            LZDecompressVram(gBattleTerrainTilemap_Building, (void*)(0x0600d000));
            LoadCompressedPalette(gBattleTerrainPalette_BattleTower, 0x20, 0x60);
            (*(vu16 *)(0x4000000 + 0xe)) = 0x5a0b;
            gUnknown_030041B0 = 0x100;
            BeginNormalPaletteFade(0xfffc, 0, 0x10, 0, 0);
            gBattleCommunication[0]++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
            gBattlescriptCurrInstr++;
        break;
    }
}

__attribute__((naked))
void sub_802BBD4(u8 r0, u8 r1, u8 r2, u8 r3, u8 sp0)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    ldr r4, [sp, 0x20]\n    lsls r0, 24\n    lsrs r6, r0, 24\n    lsls r1, 24\n    lsrs r1, 24\n    mov r12, r1\n    lsls r2, 24\n    lsrs r5, r2, 24\n    lsls r3, 24\n    lsrs r7, r3, 24\n    lsls r4, 24\n    lsrs r4, 24\n    mov r8, r4\n    mov r2, r12\n    cmp r2, r7\n    bgt _0802BC5A\n    lsls r1, r6, 1\n    ldr r0, _0802BC20 @ =0x0600c000\n    adds r1, r0\n    mov r9, r1\n_0802BC06:\n    adds r1, r6, 0\n    adds r0, r2, 0x1\n    mov r10, r0\n    cmp r1, r5\n    bgt _0802BC54\n    lsls r0, r2, 6\n    mov r4, r9\n    adds r3, r4, r0\n_0802BC16:\n    cmp r2, r12\n    bne _0802BC28\n    ldr r0, _0802BC24 @ =0x00001022\n    b _0802BC36\n    .align 2, 0\n_0802BC20: .4byte 0x0600c000\n_0802BC24: .4byte 0x00001022\n_0802BC28:\n    cmp r2, r7\n    bne _0802BC34\n    ldr r0, _0802BC30 @ =0x00001028\n    b _0802BC36\n    .align 2, 0\n_0802BC30: .4byte 0x00001028\n_0802BC34:\n    ldr r0, _0802BC68 @ =0x00001025\n_0802BC36:\n    cmp r1, r6\n    beq _0802BC42\n    adds r0, 0x1\n    cmp r1, r5\n    bne _0802BC42\n    adds r0, 0x1\n_0802BC42:\n    mov r4, r8\n    cmp r4, 0\n    beq _0802BC4A\n    movs r0, 0\n_0802BC4A:\n    strh r0, [r3]\n    adds r3, 0x2\n    adds r1, 0x1\n    cmp r1, r5\n    ble _0802BC16\n_0802BC54:\n    mov r2, r10\n    cmp r2, r7\n    ble _0802BC06\n_0802BC5A:\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0802BC68: .4byte 0x00001025\n        .syntax divided");
# 17339 "src/battle/battle_4.c"
}

void sub_802BC6C(void)
{
 u16 *Target = (u16 *)0x600C270;

 if (!gBattleCommunication[1])
 {
  *Target = 1;
  *(Target + 0x20) = 2;
  *(Target + 0x40) = 32;
  *(Target + 0x60) = 32;
 } else
 {
  *Target = 32;
  *(Target + 0x20) = 32;
  *(Target + 0x40) = 1;
  *(Target + 0x60) = 2;
 }
}

void nullsub_6(void)
{
    return;
}

static void atkF3_nickname_caught_poke(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        sub_8023A80();
        gBattleCommunication[0]++;
        gBattleCommunication[1] = 0;
        sub_802BC6C();
        break;
    case 1:
        if (gMain.newKeys & 0x0040 && gBattleCommunication[1] != 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 0;
            sub_802BC6C();
        }
        if (gMain.newKeys & 0x0080 && gBattleCommunication[1] == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_6();
            gBattleCommunication[1] = 1;
            sub_802BC6C();
        }
        if (gMain.newKeys & 0x0001)
        {
            PlaySE(SE_SELECT);
            if (gBattleCommunication[1] == 0)
            {
                gBattleCommunication[0]++;
                BeginFastPaletteFade(3);
            }
            else
                gBattleCommunication[0] = 4;
        }
        else if (gMain.newKeys & 0x0002)
        {
            PlaySE(SE_SELECT);
            gBattleCommunication[0] = 4;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            GetMonData(&gEnemyParty[gBattlePartyID[gBankAttacker ^ 1]], 2, ((struct BattleStruct *) (gSharedMem + 0x0))->caughtNick);
            DoNamingScreen(2, ((struct BattleStruct *) (gSharedMem + 0x0))->caughtNick, GetMonData(&gEnemyParty[gBattlePartyID[gBankAttacker ^ 1]], 11), GetMonGender(&gEnemyParty[gBattlePartyID[gBankAttacker ^ 1]]), GetMonData(&gEnemyParty[gBattlePartyID[gBankAttacker ^ 1]], 0, 0), sub_800F808);
            gBattleCommunication[0]++;
        }
        break;
    case 3:
        if (gMain.callback2 == sub_800F808 && !gPaletteFade.active )
        {
            SetMonData(&gEnemyParty[gBattlePartyID[gBankAttacker ^ 1]], 2, ((struct BattleStruct *) (gSharedMem + 0x0))->caughtNick);
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
        }
        break;
    case 4:
        if (CalculatePlayerPartyCount() == 6)
            gBattlescriptCurrInstr += 5;
        else
            gBattlescriptCurrInstr = (u8*) ((gBattlescriptCurrInstr + 1)[0] | ((gBattlescriptCurrInstr + 1)[1] << 8) | ((gBattlescriptCurrInstr + 1)[2] << 16) | ((gBattlescriptCurrInstr + 1)[3] << 24));
        break;
    }
}

static void atkF4_802BEF0(void)
{
    gBattleMons[gBankAttacker].hp -= gBattleMoveDamage;
    gBattlescriptCurrInstr++;
}

static void atkF5_removeattackerstatus1(void)
{
    gBattleMons[gBankAttacker].status1 = 0;
    gBattlescriptCurrInstr++;
}

static void atkF6_802BF48(void)
{
    gFightStateTracker = 0xC;
}

static void atkF7_802BF54(void)
{
    gFightStateTracker = 0xC;
    gCurrentMoveTurn = gNoOfAllBanks;
}
