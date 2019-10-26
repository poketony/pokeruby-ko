# 1 "src/engine/text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/engine/text.c"
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
# 2 "src/engine/text.c" 2
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
# 3 "src/engine/text.c" 2
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
# 4 "src/engine/text.c" 2
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
# 5 "src/engine/text.c" 2
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
# 6 "src/engine/text.c" 2
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
# 7 "src/engine/text.c" 2
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
# 8 "src/engine/text.c" 2
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
# 9 "src/engine/text.c" 2
# 1 "include/korean.h" 1

u8 isHavingJong(u16 kor);

u8 getJong(u16 kor);
u8 getJung(u16 kor);
u8 getCho(u16 kor);

u8 distJamo(u8 ch);

u16 MakeKorean(u8 cho, u8 jung, u8 jong);

u8 MakeJong(u8 ch);
u8 MakeJung(u8 ch);
u8 MakeCho(u8 ch);

u8 DoubleJong(u8 ch, u8 ch2);
u8 DoubleJung(u8 ch, u8 ch2);
u8 SplitJong(u8 ch, u8 dir);

u8 JongToCho(u8 ch);
# 10 "src/engine/text.c" 2

enum
{
    WIN_STATE_END,
    WIN_STATE_BEGIN,
    WIN_STATE_NORMAL,
    WIN_STATE_INTERRUPTIBLE_PAUSE,
    WIN_STATE_PAUSE,
    WIN_STATE_WAIT_BUTTON,
    WIN_STATE_NEWLINE,
    WIN_STATE_PLACEHOLDER,
    WIN_STATE_PARAGRAPH,
    WIN_STATE_NEWLINE_WAIT,
    WIN_STATE_WAIT_SOUND,
};

struct Font
{
    u32 type;
    u8 *glyphs;
    u16 glyphSize;
    u16 lowerTileOffset;
};

struct GlyphBuffer
{


    u32 pixelRows[16];


    u32 background;


    u32 colors[16];
};

struct GlyphTileInfo
{
    u8 textMode;
    u8 startPixel;
    u8 width;
    u8 *src;
    u32 *dest;
    u32 *colors;
};

struct ShiftAmount
{
    u32 left;
    u32 right;
};

static u16 InitVariableWidthFontTileData(struct Window *, u16);
static u16 LoadFixedWidthFont(struct Window *, u16);
static u16 LoadFixedWidthFont_Font1Latin(struct Window *, u16);
static u16 LoadFixedWidthFont_Font4Latin(struct Window *, u16);
static u16 LoadFixedWidthFont_Braille(struct Window *, u16);
static void MultistepLoadFont_LoadGlyph(struct Window *, u16, u8);
static u8 sub_8002FA0(struct Window *, const u8 *);
static u8 InterpretText(struct Window *);
static u8 HandleExtCtrlCode(struct Window *);
static u8 UpdateWindowText(struct Window *);
static u8 DrawGlyph_TextMode0(struct Window *, u32);
static u8 DrawGlyph_TextMode2(struct Window *, u32);
static void LoadFixedWidthGlyph(struct Window *, u32, u8 *);
static void WriteGlyphTilemap(struct Window *, u16, u16);
static void GetGlyphTilePointers(u8, u8, u16, u8 **, u8 **);
static u16 *GetCursorTilemapPointer(struct Window *);
static void ApplyColors_UnshadowedFont(const u8 *, u32 *, u8, u8);
static void ApplyColors_ShadowedFont(const void *, void *, u8, u8, u8);
static void SetCursorX(struct Window *, u8);
static void AddToCursorX(struct Window *, u8);
static void AddToCursorY(struct Window *, u8);
static void ClipLeft(struct Window *);
static void ClipRight(struct Window *);
static void InitColors(struct Window *);
static void SetBackgroundColor(struct Window *, u8);
static void SetShadowColor(struct Window *, u8);
static void SetForegroundColor(struct Window *, u8);
static u8 GetTextDelay(struct Window *);
static bool8 PlayerCanInterruptWait(struct Window *);
static void ScrollWindowTextLines(struct Window *);
static void ScrollWindowTextLines_TextMode0(struct Window *);
static void DoScroll_TextMode0(struct Window *, u16);
static void ScrollWindowTextLines_TextMode1(struct Window *);
static void DoScroll_TextMode1(struct Window *, u16);
static void ScrollWindowTextLines_TextMode2(struct Window *);
static void DoScroll_TextMode2(struct Window *, u8);
void ClearWindowTextLines(struct Window *);
static void ClearWindowTextLines_TextMode0_TextMode1(struct Window *, u8);
static void ClearWindowTextLines_TextMode2(struct Window *, u8);
static void TryEraseDownArrow(struct Window *);
static u16 GetBlankTileNum(struct Window *);
static u8 WaitWithDownArrow(struct Window *);
static void DrawInitialDownArrow(struct Window *);
static void DrawMovingDownArrow(struct Window *);
static u16 GetCursorTileNum(struct Window *, u32, u32);
static s32 DrawGlyphTiles(struct Window *, u32, u32);
static void UpdateTilemap(struct Window *, u32);
static u8 GetGlyphWidth(struct Window *, u32);
static s32 DrawGlyphTile_ShadowedFont(struct GlyphTileInfo *);

static void PrintGlyph_TextMode0(struct Window *, u32);
static void PrintGlyph_TextMode1(struct Window *, u32);
static void PrintGlyph_TextMode2(struct Window *, u32);

static void WriteGlyphTilemap_Font0_Font3(struct Window *, u32);
static void WriteGlyphTilemap_Font1_Font4(struct Window *, u32);
static void WriteGlyphTilemap_Font2_Font5(struct Window *, u32);
static void WriteGlyphTilemap_Font1_Font4(struct Window *, u32);
static void WriteGlyphTilemap_Font2_Font5(struct Window *, u32);
static void WriteGlyphTilemap_Font6(struct Window *, u32);

static u8 ExtCtrlCode_Nop(struct Window *);
static u8 ExtCtrlCode_ForegroundColor(struct Window *);
static u8 ExtCtrlCode_BackgroundColor(struct Window *);
static u8 ExtCtrlCode_ShadowColor(struct Window *);
static u8 ExtCtrlCode_AllColors(struct Window *);
static u8 ExtCtrlCode_Palette(struct Window *);
static u8 ExtCtrlCode_Font(struct Window *);
static u8 ExtCtrlCode_DefaultFont(struct Window *);
static u8 ExtCtrlCode_Pause(struct Window *);
static u8 ExtCtrlCode_WaitButton(struct Window *);
static u8 ExtCtrlCode_WaitSound(struct Window *);
static u8 ExtCtrlCode_PlayBGM(struct Window *);
static u8 ExtCtrlCode_Escape(struct Window *);
static u8 ExtCtrlCode_Nop2(struct Window *);
static u8 ExtCtrlCode_SetCursorY(struct Window *);
static u8 ExtCtrlCode_ClearWindowTextLines(struct Window *);
static u8 ExtCtrlCode_PlaySE(struct Window *);
static u8 ExtCtrlCode_Skip(struct Window *);
static u8 ExtCtrlCode_SetCursorX(struct Window *);
static u8 ExtCtrlCode_SkipTo(struct Window *);
static u8 ExtCtrlCode_Spacing(struct Window *);
static u8 ExtCtrlCode_Japanese(struct Window *);
static u8 ExtCtrlCode_Latin(struct Window *);

static void ShiftGlyphTile_UnshadowedFont_Width0(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width1(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width2(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width3(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width4(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width5(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width6(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width7(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width8(struct GlyphBuffer *, u8 *, u32 *, u8);

static void ShiftGlyphTile_ShadowedFont_Width0(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width1(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width2(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width3(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width4(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width5(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width6(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width7(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width8(struct GlyphBuffer *, u32 *, u32 *, u8);

static struct Window *sMultistepLoadFont_Window;
static u16 sMultistepLoadFont_StartOffset;
static u16 sMultistepLoadFont_Index;
static struct Window sTempWindow;
static u8 sWaitType;
static u8 sLineLength;
static struct GlyphBuffer sGlyphBuffer;

__attribute__((section("ewram_data"))) u16 gBGTilemapBuffers[4][0x400] = {0};

__attribute__((section("ewram_data"))) u8 gStringVar1[0x100] = {0};
__attribute__((section("ewram_data"))) u8 gStringVar2[0x100] = {0};
__attribute__((section("ewram_data"))) u8 gStringVar3[0x100] = {0};
__attribute__((section("ewram_data"))) u8 gStringVar4[0x100] = {0};

extern u16 gBattleTypeFlags;
extern u8 gIsLinkContest;
extern u8 gTileBuffer[];

extern u8 gFont3KoreanGlyphs[];
extern u8 gFont4KoreanGlyphs[];
extern u8 gFont3Korean2Glyphs[];
extern u8 gFont3Korean3Glyphs[];

static u8 gHavingJong;
static u8 gCustomFont;

vu16 *const gBGControlRegs[] =
{
    &(*(vu16 *)(0x4000000 + 0x8)),
    &(*(vu16 *)(0x4000000 + 0xa)),
    &(*(vu16 *)(0x4000000 + 0xc)),
    &(*(vu16 *)(0x4000000 + 0xe)),
};

vu16 *const gBGHOffsetRegs[] =
{
    &(*(vu16 *)(0x4000000 + 0x10)),
    &(*(vu16 *)(0x4000000 + 0x14)),
    &(*(vu16 *)(0x4000000 + 0x18)),
    &(*(vu16 *)(0x4000000 + 0x1c)),
};

vu16 *const gBGVOffsetRegs[] =
{
    &(*(vu16 *)(0x4000000 + 0x12)),
    &(*(vu16 *)(0x4000000 + 0x16)),
    &(*(vu16 *)(0x4000000 + 0x1a)),
    &(*(vu16 *)(0x4000000 + 0x1e)),
};

const u16 gUnknown_081E29D8[] = { 0x100, 0x200, 0x400, 0x800 };
const u16 gUnknown_081E29E0[] = { 0x100, 0x200, 0x400, 0x800 };
const u16 gUnknown_081E29E8[] = { 1, 2, 4, 8 };

static const u8 sFont0LatinGlyphs[] = INCBIN_U8("graphics/fonts/font0_lat.1bpp");
static const u8 sFont1LatinGlyphs[] = INCBIN_U8("graphics/fonts/font1_lat.1bpp");
static const u8 sFont0JapaneseGlyphs[] = INCBIN_U8("graphics/fonts/font0_jpn.1bpp");
static const u8 sFont1JapaneseGlyphs[] = INCBIN_U8("graphics/fonts/font1_jpn.1bpp");
static const u8 sBrailleGlyphs[] = INCBIN_U8("graphics/fonts/font6_braille.1bpp");
static const u32 sDownArrowTiles[] = INCBIN_U32("graphics/fonts/down_arrow.4bpp");


# 1 "src/engine/../data/text/type1_map.h" 1
static const u8 sFontType1Map[] = {
    0xD4, 0xD4,
    0xD4, 0x31,
    0xD4, 0x32,
    0xD4, 0x33,
    0xD4, 0x34,
    0xD4, 0x35,
    0xD4, 0x36,
    0xD4, 0x37,
    0xD4, 0x38,
    0xD4, 0x39,
    0xD4, 0x3A,
    0xD4, 0x3B,
    0xD4, 0x3C,
    0xD4, 0x3D,
    0xD4, 0x3E,
    0xD4, 0x3F,
    0xD4, 0x40,
    0xD4, 0x41,
    0xD4, 0x42,
    0xD4, 0x43,
    0xD4, 0x44,
    0xD4, 0x45,
    0xD4, 0x46,
    0xD4, 0x47,
    0xD4, 0x48,
    0xD4, 0x49,
    0xD4, 0x4A,
    0xD4, 0x4B,
    0xD4, 0x4C,
    0xD4, 0x4D,
    0xD4, 0x4E,
    0xD4, 0x4F,
    0xD4, 0x50,
    0xD4, 0x51,
    0xD4, 0x52,
    0xD4, 0x53,
    0xD4, 0x54,
    0xD4, 0x55,
    0xD4, 0x56,
    0xD4, 0x57,
    0xD4, 0x58,
    0xD4, 0x59,
    0xD4, 0x5A,
    0xD4, 0x5B,
    0xD4, 0x5C,
    0xD4, 0x5D,
    0xD4, 0x5E,
    0xD4, 0x31,
    0xD4, 0x32,
    0xD4, 0x33,
    0xD4, 0x34,
    0xD4, 0x35,
    0xD4, 0x60,
    0xD4, 0x61,
    0xD4, 0x62,
    0x65, 0x36,
    0x65, 0x37,
    0x65, 0x38,
    0x65, 0x39,
    0x65, 0x3A,
    0x65, 0x3B,
    0x65, 0x3C,
    0x65, 0x3D,
    0x65, 0x3E,
    0x65, 0x3F,
    0x65, 0x40,
    0x65, 0x41,
    0x65, 0x42,
    0x65, 0x43,
    0x65, 0x44,
    0x65, 0x4A,
    0x65, 0x4B,
    0x65, 0x4C,
    0x65, 0x4D,
    0x65, 0x4E,
    0x64, 0x4A,
    0x64, 0x4B,
    0x64, 0x4C,
    0x64, 0x4D,
    0x64, 0x4E,
    0xD4, 0x5F,
    0xD4, 0x00,
    0xD4, 0x01,
    0xD4, 0x02,
    0xD4, 0x03,
    0xD4, 0x04,
    0xD4, 0x05,
    0xD4, 0x06,
    0xD4, 0x07,
    0xD4, 0x08,
    0xD4, 0x09,
    0xD4, 0x0A,
    0xD4, 0x0B,
    0xD4, 0x0C,
    0xD4, 0x0D,
    0xD4, 0x0E,
    0xD4, 0x0F,
    0xD4, 0x10,
    0xD4, 0x11,
    0xD4, 0x12,
    0xD4, 0x13,
    0xD4, 0x14,
    0xD4, 0x15,
    0xD4, 0x16,
    0xD4, 0x17,
    0xD4, 0x18,
    0xD4, 0x19,
    0xD4, 0x1A,
    0xD4, 0x1B,
    0xD4, 0x4D,
    0xD4, 0x1C,
    0xD4, 0x1D,
    0xD4, 0x1E,
    0xD4, 0x1F,
    0xD4, 0x20,
    0xD4, 0x21,
    0xD4, 0x22,
    0xD4, 0x23,
    0xD4, 0x24,
    0xD4, 0x25,
    0xD4, 0x58,
    0xD4, 0x26,
    0xD4, 0x27,
    0xD4, 0x28,
    0xD4, 0x29,
    0xD4, 0x2A,
    0xD4, 0x2B,
    0xD4, 0x69,
    0xD4, 0x30,
    0xD4, 0x6A,
    0xD4, 0x6B,
    0xD4, 0x74,
    0xD4, 0x2D,
    0xD4, 0x2E,
    0xD4, 0x2F,
    0x65, 0x05,
    0x65, 0x06,
    0x65, 0x07,
    0x65, 0x08,
    0x65, 0x09,
    0x65, 0x0A,
    0x65, 0x0B,
    0x65, 0x0C,
    0x65, 0x0D,
    0x65, 0x0E,
    0x65, 0x0F,
    0x65, 0x10,
    0x65, 0x11,
    0x65, 0x12,
    0x65, 0x13,
    0x65, 0x19,
    0x65, 0x1A,
    0x65, 0x1B,
    0x65, 0x4D,
    0x65, 0x1C,
    0x64, 0x19,
    0x64, 0x1A,
    0x64, 0x1B,
    0x64, 0x4D,
    0x64, 0x1C,
    0xD4, 0x2C,
    0xD4, 0x76,
    0xD4, 0x77,
    0xD4, 0x78,
    0xD4, 0x79,
    0xD4, 0x7A,
    0xD4, 0x7B,
    0xD4, 0x7C,
    0xD4, 0x7D,
    0xD4, 0x7E,
    0xD4, 0x7F,
    0xD4, 0x67,
    0xD4, 0x66,
    0xD4, 0x68,
    0xD4, 0x63,
    0xD4, 0xD2,
    0xD4, 0xD3,
    0xD4, 0xD0,
    0xD4, 0xD1,
    0xD4, 0xCE,
    0xD4, 0xCF,
    0xD4, 0x6F,
    0xD4, 0x75,
    0xD4, 0x70,
    0xD4, 0x72,
    0xD4, 0x71,
    0xD4, 0x73,
    0xD4, 0x80,
    0xD4, 0x81,
    0xD4, 0x82,
    0xD4, 0x83,
    0xD4, 0x84,
    0xD4, 0x85,
    0xD4, 0x86,
    0xD4, 0x87,
    0xD4, 0x88,
    0xD4, 0x89,
    0xD4, 0x8A,
    0xD4, 0x8B,
    0xD4, 0x8C,
    0xD4, 0x8D,
    0xD4, 0x8E,
    0xD4, 0x8F,
    0xD4, 0x90,
    0xD4, 0x91,
    0xD4, 0x92,
    0xD4, 0x93,
    0xD4, 0x94,
    0xD4, 0x95,
    0xD4, 0x96,
    0xD4, 0x97,
    0xD4, 0x98,
    0xD4, 0x99,
    0xD4, 0x9A,
    0xD4, 0x9B,
    0xD4, 0x9C,
    0xD4, 0x9D,
    0xD4, 0x9E,
    0xD4, 0x9F,
    0xD4, 0xA0,
    0xD4, 0xA1,
    0xD4, 0xA2,
    0xD4, 0xA3,
    0xD4, 0xA4,
    0xD4, 0xA5,
    0xD4, 0xA6,
    0xD4, 0xA7,
    0xD4, 0xA8,
    0xD4, 0xA9,
    0xD4, 0xAA,
    0xD4, 0xAB,
    0xD4, 0xAC,
    0xD4, 0xAD,
    0xD4, 0xAE,
    0xD4, 0xAF,
    0xD4, 0xB0,
    0xD4, 0xB1,
    0xD4, 0xB2,
    0xD4, 0xB3,
    0xD4, 0x6D,
    0xD4, 0xD5,
    0xD4, 0xD6,
    0xD4, 0xD7,
    0xD4, 0xD8,
    0xD4, 0xD9,
    0xD4, 0xDA,
    0xD4, 0xDB,
};
# 232 "src/engine/text.c" 2
# 1 "src/engine/../data/text/type3_map.h" 1
static const u8 sFontType3Map[] = {
    0x00, 0x10,
    0x01, 0x10,
    0x02, 0x10,
    0x03, 0x10,
    0x04, 0x11,
    0x05, 0x11,
    0x06, 0x11,
    0x07, 0x11,
    0x08, 0x12,
    0x09, 0x12,
    0x0A, 0x12,
    0x0B, 0x12,
    0x0C, 0x13,
    0x0D, 0x13,
    0x0E, 0x13,
    0x0F, 0x13,
    0x00, 0x14,
    0x01, 0x14,
    0x02, 0x14,
    0x03, 0x14,
    0x04, 0x15,
    0x05, 0x15,
    0x06, 0x15,
    0x07, 0x15,
    0x08, 0x16,
    0x09, 0x16,
    0x0A, 0x16,
    0x0B, 0x16,
    0x0C, 0x17,
    0x0D, 0x17,
    0x0E, 0x17,
    0x0F, 0x17,
    0x00, 0x18,
    0x01, 0x18,
    0x02, 0x18,
    0x03, 0x18,
    0x04, 0x19,
    0x05, 0x19,
    0x06, 0x19,
    0x07, 0x19,
    0x08, 0x1A,
    0x09, 0x1A,
    0x0A, 0x1A,
    0x0B, 0x1A,
    0x0C, 0x1B,
    0x0D, 0x1B,
    0x0E, 0x1B,
    0x0F, 0x1B,
    0x00, 0x1C,
    0x01, 0x1C,
    0x02, 0x1C,
    0x03, 0x1C,
    0x04, 0x1D,
    0x05, 0x1D,
    0x06, 0x1D,
    0x07, 0x1D,
    0x08, 0x1E,
    0x09, 0x1E,
    0x0A, 0x1E,
    0x0B, 0x1E,
    0x0C, 0x1F,
    0x0D, 0x1F,
    0x0E, 0x1F,
    0x0F, 0x1F,
    0x20, 0x24,
    0x20, 0x24,
    0x21, 0x24,
    0x21, 0x24,
    0x20, 0x24,
    0x20, 0x24,
    0x21, 0x24,
    0x21, 0x24,
    0x22, 0x25,
    0x22, 0x25,
    0x23, 0x25,
    0x23, 0x25,
    0x22, 0x25,
    0x22, 0x25,
    0x23, 0x25,
    0x23, 0x25,
    0x20, 0x24,
    0x20, 0x24,
    0x21, 0x24,
    0x21, 0x24,
    0x20, 0x24,
    0x20, 0x24,
    0x21, 0x24,
    0x21, 0x24,
    0x22, 0x25,
    0x22, 0x25,
    0x23, 0x25,
    0x23, 0x25,
    0x22, 0x25,
    0x22, 0x25,
    0x23, 0x25,
    0x23, 0x25,
    0x20, 0x26,
    0x20, 0x26,
    0x21, 0x26,
    0x21, 0x26,
    0x20, 0x26,
    0x20, 0x26,
    0x21, 0x26,
    0x21, 0x26,
    0x22, 0x27,
    0x22, 0x27,
    0x23, 0x27,
    0x23, 0x27,
    0x22, 0x27,
    0x22, 0x27,
    0x23, 0x27,
    0x23, 0x27,
    0x20, 0x26,
    0x20, 0x26,
    0x21, 0x26,
    0x21, 0x26,
    0x20, 0x26,
    0x20, 0x26,
    0x21, 0x26,
    0x21, 0x26,
    0x22, 0x27,
    0x22, 0x27,
    0x23, 0x27,
    0x23, 0x27,
    0x22, 0x27,
    0x22, 0x27,
    0x23, 0x27,
    0x23, 0x27,
};
# 233 "src/engine/text.c" 2
# 1 "src/engine/../data/text/font1_widths.h" 1
# 19 "src/engine/../data/text/font1_widths.h"
static const u8 sFont1Widths[] = {
    5, 3, 8, 8, 8, 8, 8, 8, 8, 4, 5, 4, 4, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 5, 8, 8, 8, 8, 8, 4, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 6, 6, 6, 5,
    6, 5, 5, 5, 5, 5, 5, 5, 5, 4, 8, 4, 4, 5, 5, 5,
    5, 5, 5, 5, 5, 5, 5, 5, 8, 4, 5, 5, 5, 5, 4, 8,
    4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6,
    8, 7, 6, 5, 3, 3, 5, 4, 3, 6, 6, 6, 7, 7, 8, 5,
    5, 5, 3, 5, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
    5, 5, 5, 5, 5, 5, 5, 5, 4, 5, 5, 5, 5, 5, 5, 5,
    5, 5, 5, 4, 5, 5, 5, 5, 4, 5, 5, 5, 5, 5, 5, 5,
    5, 5, 4, 4, 5, 3, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
    5, 5, 5, 5, 6, 6, 7, 7, 7, 7, 6, 7, 6, 6, 7, 6,
    7, 7, 7, 6, 7, 6, 7, 6, 7, 6, 6, 7, 6, 6, 3, 3,
    5, 5, 5, 5, 3, 3, 5, 5, 5, 5, 5, 5,
};
# 234 "src/engine/text.c" 2
# 1 "src/engine/../data/text/font4_widths.h" 1
# 19 "src/engine/../data/text/font4_widths.h"
static const u8 sFont4Widths[] = {
    5, 3, 8, 8, 8, 8, 8, 8, 8, 4, 5, 4, 4, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 5, 8, 8, 8, 8, 8, 4, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 7, 5, 5, 5,
    6, 5, 5, 5, 5, 5, 5, 5, 5, 4, 8, 4, 4, 5, 5, 5,
    5, 5, 5, 5, 5, 5, 5, 5, 8, 4, 5, 5, 5, 5, 4, 8,
    4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 8, 5, 6, 6,
    8, 7, 3, 5, 3, 3, 5, 4, 3, 6, 6, 6, 7, 7, 8, 5,
    5, 5, 3, 8, 6, 5, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    5, 5, 5, 5, 5, 5, 5, 5, 4, 5, 5, 5, 5, 5, 5, 5,
    5, 5, 5, 4, 5, 5, 5, 5, 4, 5, 5, 5, 5, 5, 5, 5,
    5, 5, 4, 4, 5, 3, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
    5, 5, 5, 5, 6, 6, 7, 7, 7, 7, 6, 7, 6, 6, 7, 6,
    7, 7, 7, 6, 7, 6, 7, 6, 7, 6, 6, 7, 6, 6, 3, 3,
    5, 5, 5, 5, 3, 3, 5, 5, 5, 5, 5, 5,
};
# 235 "src/engine/text.c" 2
# 1 "src/engine/../data/text/font0_widths.h" 1
# 21 "src/engine/../data/text/font0_widths.h"
static const u8 sFont0Widths[] = {
    3, 6, 6, 6, 6, 6, 6, 6, 6, 6, 8, 6, 6, 6, 6, 6,
    6, 6, 6, 6, 6, 6, 6, 6, 8, 6, 6, 6, 6, 6, 5, 8,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 8,
    7, 7, 7, 8, 8, 8, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    7, 6, 3, 8, 8, 8, 7, 8, 8, 4, 6, 6, 4, 4, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 7, 8, 7, 7, 8, 8, 6,
    7, 8, 8, 8, 8, 8, 7, 8, 7, 7, 7, 7, 7, 7, 8, 7,
    7, 7, 7, 7, 7, 7, 7, 8, 6, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    7, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 3, 6, 3, 5, 3,
    6, 6, 6, 3, 3, 6, 6, 6, 3, 6, 6, 6, 6, 6, 6, 6,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 4, 5, 6,
    3, 6, 6, 6, 6, 6, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7,
    3, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 1, 1,
};
# 236 "src/engine/text.c" 2
# 1 "src/engine/../data/text/font3_widths.h" 1
# 21 "src/engine/../data/text/font3_widths.h"
static const u8 sFont3Widths[] = {
    3, 6, 6, 6, 6, 6, 6, 6, 6, 6, 8, 6, 6, 6, 6, 6,
    8, 6, 6, 6, 6, 6, 6, 6, 8, 6, 6, 6, 6, 6, 4, 8,
    6, 6, 6, 6, 6, 8, 6, 6, 6, 6, 6, 6, 8, 6, 6, 8,
    8, 8, 8, 8, 8, 8, 3, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    7, 6, 4, 8, 8, 8, 7, 8, 8, 4, 6, 6, 4, 4, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 6, 7, 8, 7, 7, 8, 8, 4,
    7, 8, 8, 8, 8, 8, 7, 8, 7, 7, 7, 7, 7, 7, 8, 7,
    7, 7, 7, 7, 5, 6, 6, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 4, 6, 5, 5, 3,
    6, 6, 6, 3, 3, 6, 6, 6, 3, 6, 6, 6, 6, 6, 6, 6,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 4, 5, 6,
    3, 6, 6, 6, 6, 6, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7,
    3, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 1, 1,
};
# 237 "src/engine/text.c" 2


const u16 gSummaryScreenPalette[] = INCBIN_U16("graphics/fonts/summary_screen.gbapal");
const u16 gUnknownPalette_81E6692[] = INCBIN_U16("graphics/fonts/unknown_81E6692.gbapal");
const u16 gFontDefaultPalette[] = INCBIN_U16("graphics/fonts/default.gbapal");

const u8 sBlankTile[8] = { 0, 0, 0, 0, 0, 0, 0, 0, };

static const u32 sGlyphMasks[9][8][3] =
{
    {
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFFFFFFF0, },
        { 0x0000000F,0xFFFFFFFF,0xFFFFFF00, },
        { 0x000000FF,0xFFFFFFFF,0xFFFFF000, },
        { 0x00000FFF,0xFFFFFFFF,0xFFFF0000, },
        { 0x0000FFFF,0xFFFFFFFF,0xFFF00000, },
        { 0x000FFFFF,0xFFFFFFFF,0xFF000000, },
        { 0x00FFFFFF,0xFFFFFFFF,0xF0000000, },
        { 0x0FFFFFFF,0xFFFFFFFF,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFFFFFF00, },
        { 0x0000000F,0xFFFFFFFF,0xFFFFF000, },
        { 0x000000FF,0xFFFFFFFF,0xFFFF0000, },
        { 0x00000FFF,0xFFFFFFFF,0xFFF00000, },
        { 0x0000FFFF,0xFFFFFFFF,0xFF000000, },
        { 0x000FFFFF,0xFFFFFFFF,0xF0000000, },
        { 0x00FFFFFF,0xFFFFFFFF,0x00000000, },
        { 0x0FFFFFFF,0xFFFFFFF0,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFFFFF000, },
        { 0x0000000F,0xFFFFFFFF,0xFFFF0000, },
        { 0x000000FF,0xFFFFFFFF,0xFFF00000, },
        { 0x00000FFF,0xFFFFFFFF,0xFF000000, },
        { 0x0000FFFF,0xFFFFFFFF,0xF0000000, },
        { 0x000FFFFF,0xFFFFFFFF,0x00000000, },
        { 0x00FFFFFF,0xFFFFFFF0,0x00000000, },
        { 0x0FFFFFFF,0xFFFFFF00,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFFFF0000, },
        { 0x0000000F,0xFFFFFFFF,0xFFF00000, },
        { 0x000000FF,0xFFFFFFFF,0xFF000000, },
        { 0x00000FFF,0xFFFFFFFF,0xF0000000, },
        { 0x0000FFFF,0xFFFFFFFF,0x00000000, },
        { 0x000FFFFF,0xFFFFFFF0,0x00000000, },
        { 0x00FFFFFF,0xFFFFFF00,0x00000000, },
        { 0x0FFFFFFF,0xFFFFF000,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFFF00000, },
        { 0x0000000F,0xFFFFFFFF,0xFF000000, },
        { 0x000000FF,0xFFFFFFFF,0xF0000000, },
        { 0x00000FFF,0xFFFFFFFF,0x00000000, },
        { 0x0000FFFF,0xFFFFFFF0,0x00000000, },
        { 0x000FFFFF,0xFFFFFF00,0x00000000, },
        { 0x00FFFFFF,0xFFFFF000,0x00000000, },
        { 0x0FFFFFFF,0xFFFF0000,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFF000000, },
        { 0x0000000F,0xFFFFFFFF,0xF0000000, },
        { 0x000000FF,0xFFFFFFFF,0x00000000, },
        { 0x00000FFF,0xFFFFFFF0,0x00000000, },
        { 0x0000FFFF,0xFFFFFF00,0x00000000, },
        { 0x000FFFFF,0xFFFFF000,0x00000000, },
        { 0x00FFFFFF,0xFFFF0000,0x00000000, },
        { 0x0FFFFFFF,0xFFF00000,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xF0000000, },
        { 0x0000000F,0xFFFFFFFF,0x00000000, },
        { 0x000000FF,0xFFFFFFF0,0x00000000, },
        { 0x00000FFF,0xFFFFFF00,0x00000000, },
        { 0x0000FFFF,0xFFFFF000,0x00000000, },
        { 0x000FFFFF,0xFFFF0000,0x00000000, },
        { 0x00FFFFFF,0xFFF00000,0x00000000, },
        { 0x0FFFFFFF,0xFF000000,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0x00000000, },
        { 0x0000000F,0xFFFFFFF0,0x00000000, },
        { 0x000000FF,0xFFFFFF00,0x00000000, },
        { 0x00000FFF,0xFFFFF000,0x00000000, },
        { 0x0000FFFF,0xFFFF0000,0x00000000, },
        { 0x000FFFFF,0xFFF00000,0x00000000, },
        { 0x00FFFFFF,0xFF000000,0x00000000, },
        { 0x0FFFFFFF,0xF0000000,0x00000000, },
    },
};

static const struct ShiftAmount sGlyphShiftAmounts[8] =
{
    { 0, 32 },
    { 4, 28 },
    { 8, 24 },
    { 12, 20 },
    { 16, 16 },
    { 20, 12 },
    { 24, 8 },
    { 28, 4 },
};

typedef void (*PrintGlyphFunc)(struct Window *, u32);

static const PrintGlyphFunc sPrintGlyphFuncs[] =
{
    PrintGlyph_TextMode0,
    PrintGlyph_TextMode1,
    PrintGlyph_TextMode2,
};

typedef void (*WriteGlyphTilemapFunc)(struct Window *, u32);

static const WriteGlyphTilemapFunc sWriteGlyphTilemapFuncs[] =
{
    WriteGlyphTilemap_Font0_Font3,
    WriteGlyphTilemap_Font1_Font4,
    WriteGlyphTilemap_Font2_Font5,
    WriteGlyphTilemap_Font0_Font3,
    WriteGlyphTilemap_Font1_Font4,
    WriteGlyphTilemap_Font2_Font5,
    WriteGlyphTilemap_Font6,
};

static const struct Window sDefaultWindow = { .language = (LANGUAGE_ENGLISH) };

typedef u8 (*ExtCtrlCodeFunc)(struct Window *);

static const ExtCtrlCodeFunc sExtCtrlCodeFuncs[] =
{
    ExtCtrlCode_Nop,
    ExtCtrlCode_ForegroundColor,
    ExtCtrlCode_BackgroundColor,
    ExtCtrlCode_ShadowColor,
    ExtCtrlCode_AllColors,
    ExtCtrlCode_Palette,
    ExtCtrlCode_Font,
    ExtCtrlCode_DefaultFont,
    ExtCtrlCode_Pause,
    ExtCtrlCode_WaitButton,
    ExtCtrlCode_WaitSound,
    ExtCtrlCode_PlayBGM,
    ExtCtrlCode_Escape,
    ExtCtrlCode_Nop2,
    ExtCtrlCode_SetCursorY,
    ExtCtrlCode_ClearWindowTextLines,
    ExtCtrlCode_PlaySE,
    ExtCtrlCode_Skip,
    ExtCtrlCode_SetCursorX,
    ExtCtrlCode_SkipTo,
    ExtCtrlCode_Spacing,
    ExtCtrlCode_Japanese,
    ExtCtrlCode_Latin,
};

extern const u32 gFont3LatinGlyphs[];
extern const u32 gFont4LatinGlyphs[];
extern const u32 gFont3JapaneseGlyphs[];
extern const u32 gFont4JapaneseGlyphs[];



static const struct Font sFonts[] =
{

    { 0, (u8 *)sFont0JapaneseGlyphs, 16, 8 },
    { 1, (u8 *)sFont1JapaneseGlyphs, 8, 0 },
    { 2, (u8 *)sFont1JapaneseGlyphs, 8, 0 },
    { 4, (u8 *)gFont3JapaneseGlyphs, 64, 512 },
    { 1, (u8 *)gFont4JapaneseGlyphs, 32, 0 },
    { 2, (u8 *)gFont4JapaneseGlyphs, 32, 0 },
    { 3, (u8 *)sBrailleGlyphs, 8, 0 },

    { 0, (u8 *)sFont0LatinGlyphs, 16, 8 },
    { 1, (u8 *)sFont1LatinGlyphs, 8, 0 },
    { 2, (u8 *)sFont1LatinGlyphs, 8, 0 },
    { 0, (u8 *)gFont3LatinGlyphs, 64, 32 },
    { 1, (u8 *)gFont4LatinGlyphs, 32, 0 },
    { 2, (u8 *)gFont4LatinGlyphs, 32, 0 },
    { 3, (u8 *)sBrailleGlyphs, 8, 0 },
};

static const u8 sTextSpeedDelays[] = { 6, 3, 1 };

static const u8 sExtCtrlCodeLengths[] =
{
    1,
    2,
    2,
    2,
    4,
    2,
    2,
    1,
    2,
    1,
    1,
    3,
    2,
    2,
    2,
    1,
    3,
    2,
    2,
    2,
    2,
    1,
    1,
};

typedef void (*ShiftGlyphTileUnshadowedFunc)(struct GlyphBuffer *, u8 *, u32 *, u8);

static const ShiftGlyphTileUnshadowedFunc sShiftGlyphTileUnshadowedFuncs[] =
{
    ShiftGlyphTile_UnshadowedFont_Width0,
    ShiftGlyphTile_UnshadowedFont_Width1,
    ShiftGlyphTile_UnshadowedFont_Width2,
    ShiftGlyphTile_UnshadowedFont_Width3,
    ShiftGlyphTile_UnshadowedFont_Width4,
    ShiftGlyphTile_UnshadowedFont_Width5,
    ShiftGlyphTile_UnshadowedFont_Width6,
    ShiftGlyphTile_UnshadowedFont_Width7,
    ShiftGlyphTile_UnshadowedFont_Width8,
};

typedef void (*ShiftGlyphTileShadowedFunc)(struct GlyphBuffer *, u32 *, u32 *, u8);

static const ShiftGlyphTileShadowedFunc sShiftGlyphTileShadowedFuncs[] =
{
    ShiftGlyphTile_ShadowedFont_Width0,
    ShiftGlyphTile_ShadowedFont_Width1,
    ShiftGlyphTile_ShadowedFont_Width2,
    ShiftGlyphTile_ShadowedFont_Width3,
    ShiftGlyphTile_ShadowedFont_Width4,
    ShiftGlyphTile_ShadowedFont_Width5,
    ShiftGlyphTile_ShadowedFont_Width6,
    ShiftGlyphTile_ShadowedFont_Width7,
    ShiftGlyphTile_ShadowedFont_Width8,
};

const struct WindowConfig gWindowConfig_81E6C3C =
{
    0,
    2,
    31,
    0,
    15,
    1,
    15,
    8,
    0,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E6C58 =
{
    0,
    0,
    24,
    0,
    0,
    1,
    15,
    8,
    3,
    0,
    0,
    0,
    0,
    26,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (24))),
};

const struct WindowConfig gWindowConfig_81E6C74 =
{
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    3,
    4,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + 0x10000),
    ((void *)0),
};

const struct WindowConfig gWindowConfig_81E6C90 =
{
    0,
    1,
    30,
    2,
    31,
    15,
    0,
    1,
    4,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (1))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig gWindowConfig_81E6CAC =
{
    0,
    0,
    0,
    0,
    0,
    15,
    0,
    1,
    4,
    2,
    0,
    0,
    0,
    8,
    60,
    gTileBuffer,
    ((void *)0),
};

const struct WindowConfig gWindowConfig_81E6CC8 =
{
    2,
    2,
    15,
    0,
    15,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (15))),
};

const struct WindowConfig gWindowConfig_81E6CE4 =
{
    0,
    2,
    31,
    0,
    15,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_TextBox =
{
    0,
    2,
    31,
    0,
    15,
    1,
    15,
    8,
    8,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E6D00 =
{
    0,
    0,
    31,
    0,
    15,
    2,
    15,
    3,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E6D1C =
{
    1,
    0,
    31,
    1,
    15,
    2,
    15,
    3,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E6D38 =
{
    0,
    0,
    0,
    0,
    0,
    15,
    0,
    14,
    3,
    2,
    0,
    0,
    0,
    8,
    64,
    gTileBuffer,
    ((void *)0),
};

const struct WindowConfig gWindowConfig_81E6D54 =
{
    3,
    3,
    15,
    3,
    2,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (3))),
    (void *)(0x6000000 + (0x800 * (15))),
};

const struct WindowConfig gWindowConfig_81E6D70 =
{
    3,
    3,
    15,
    3,
    3,
    1,
    3,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (3))),
    (void *)(0x6000000 + (0x800 * (15))),
};

const struct WindowConfig gWindowConfig_81E6D8C =
{
    1,
    0,
    14,
    1,
    0,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (14))),
};

const struct WindowConfig gWindowConfig_81E6DA8 =
{
    0,
    0,
    12,
    0,
    15,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (11))),
};

const struct WindowConfig WindowConfig_TrainerCard_Back_Values =
{
    0,
    2,
    30,
    0,
    15,
    1,
    0,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig WindowConfig_TrainerCard_Back_Labels =
{
    0,
    2,
    30,
    0,
    14,
    1,
    0,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig gWindowConfig_81E6DFC =
{
    0,
    2,
    31,
    0,
    15,
    1,
    0,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E6E18 =
{
    0,
    2,
    31,
    1,
    15,
    1,
    0,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E6E34 =
{
    1,
    0,
    31,
    1,
    15,
    1,
    0,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E6E50 =
{
    0,
    2,
    28,
    0,
    13,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (28))),
};

const struct WindowConfig gWindowConfig_81E6E6C =
{
    0,
    2,
    30,
    0,
    13,
    15,
    0,
    10,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig gWindowConfig_81E6E88 =
{
    0,
    0,
    31,
    0,
    15,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E6EA4 =
{
    1,
    0,
    28,
    1,
    1,
    1,
    15,
    8,
    3,
    2,
    8,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (28))),
};

const struct WindowConfig gWindowConfig_81E6EC0 =
{
    2,
    2,
    29,
    2,
    1,
    1,
    15,
    8,
    3,
    2,
    8,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (29))),
};

const struct WindowConfig gWindowConfig_81E6EDC =
{
    1,
    0,
    28,
    1,
    2,
    1,
    15,
    8,
    3,
    2,
    8,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (28))),
};

const struct WindowConfig gWindowConfig_81E6EF8 =
{
    2,
    2,
    29,
    2,
    2,
    1,
    15,
    8,
    3,
    2,
    8,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (29))),
};

const struct WindowConfig gWindowConfig_81E6F14 =
{
    1,
    0,
    28,
    1,
    3,
    1,
    15,
    8,
    3,
    2,
    8,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (28))),
};

const struct WindowConfig gWindowConfig_81E6F30 =
{
    2,
    2,
    29,
    2,
    3,
    1,
    15,
    8,
    3,
    2,
    8,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (29))),
};

const struct WindowConfig gWindowConfig_81E6F4C =
{
    3,
    0,
    30,
    3,
    0,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig gWindowConfig_81E6F68 =
{
    0,
    2,
    13,
    0,
    15,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (13))),
};

const struct WindowConfig gWindowConfig_81E6F84 =
{
    0,
    2,
    31,
    0,
    15,
    15,
    0,
    1,
    3,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E6FA0 =
{
    1,
    0,
    24,
    3,
    15,
    1,
    0,
    8,
    3,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (24))),
};

const struct WindowConfig gWindowConfig_81E6FBC =
{
    0,
    0,
    30,
    0,
    15,
    15,
    0,
    8,
    3,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig gWindowConfig_81E6FD8 =
{
    0,
    0,
    24,
    0,
    15,
    15,
    0,
    8,
    3,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (24))),
};

const struct WindowConfig gWindowConfig_81E6FF4 =
{
    0,
    0,
    24,
    0,
    15,
    1,
    0,
    8,
    3,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (24))),
};

const struct WindowConfig gWindowConfig_81E7010 =
{
    0,
    0,
    30,
    0,
    15,
    1,
    0,
    8,
    3,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig gWindowConfig_81E702C =
{
    3,
    2,
    15,
    0,
    15,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (15))),
};

const struct WindowConfig gWindowConfig_81E7048 =
{
    2,
    2,
    14,
    2,
    15,
    1,
    0,
    8,
    3,
    2,
    0,
    16,
    0,
    16,
    32,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (14))),
};

const struct WindowConfig gWindowConfig_81E7064 =
{
    2,
    2,
    14,
    2,
    15,
    1,
    0,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (14))),
};

const struct WindowConfig gWindowConfig_81E7080 =
{
    3,
    0,
    30,
    3,
    11,
    1,
    15,
    5,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig gWindowConfig_81E709C =
{
    0,
    0,
    31,
    1,
    15,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E70B8 =
{
    2,
    0,
    30,
    2,
    11,
    1,
    0,
    5,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig gWindowConfig_81E70D4 =
{
    3,
    0,
    30,
    3,
    11,
    1,
    15,
    5,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig gWindowConfig_81E70F0 =
{
    0,
    0,
    0,
    0,
    0,
    15,
    1,
    14,
    3,
    2,
    0,
    0,
    0,
    32,
    32,
    gTileBuffer,
    ((void *)0),
};

const struct WindowConfig gWindowConfig_81E710C =
{
    0,
    0,
    31,
    1,
    15,
    1,
    0,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E7128 =
{
    0,
    2,
    31,
    0,
    15,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E7144 =
{
    0,
    2,
    31,
    0,
    13,
    1,
    0,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E7160 =
{
    1,
    1,
    10,
    1,
    14,
    1,
    0,
    8,
    3,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (1))),
    (void *)(0x6000000 + (0x800 * (10))),
};

const struct WindowConfig gWindowConfig_81E717C =
{
    0,
    3,
    31,
    0,
    15,
    15,
    0,
    8,
    3,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (3))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E7198 =
{
    0,
    2,
    15,
    0,
    15,
    15,
    0,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (15))),
};

const struct WindowConfig gWindowConfig_81E71B4 =
{
    0,
    2,
    15,
    0,
    15,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (15))),
};

const struct WindowConfig gWindowConfig_81E71D0 =
{
    1,
    1,
    28,
    0,
    5,
    13,
    14,
    15,
    3,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (1))),
    (void *)(0x6000000 + (0x800 * (28))),
};

const struct WindowConfig gWindowConfig_81E71EC =
{
    2,
    1,
    30,
    0,
    5,
    13,
    14,
    15,
    3,
    0,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (1))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig gWindowConfig_81E7208 =
{
    0,
    2,
    28,
    0,
    8,
    1,
    0,
    2,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (28))),
};

const struct WindowConfig gWindowConfig_81E7224 =
{
    0,
    0,
    31,
    0,
    15,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (0))),
    (void *)(0x6000000 + (0x800 * (31))),
};

const struct WindowConfig gWindowConfig_81E7240 =
{
    1,
    2,
    30,
    0,
    15,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + (0x4000 * (2))),
    (void *)(0x6000000 + (0x800 * (30))),
};

const struct WindowConfig gWindowConfig_81E725C =
{
    0,
    0,
    0,
    0,
    0,
    15,
    0,
    14,
    3,
    2,
    0,
    0,
    0,
    30,
    20,
    (void *)(0x6000000 + 0x10000),
    ((void *)0),
};

const struct WindowConfig gWindowConfig_81E7278 =
{
    0,
    0,
    0,
    0,
    0,
    1,
    15,
    8,
    3,
    2,
    0,
    0,
    0,
    16,
    32,
    gTileBuffer,
    ((void *)0),
};

const struct WindowConfig gWindowConfig_81E7294 =
{
    0,
    0,
    0,
    0,
    0,
    1,
    15,
    8,
    4,
    2,
    0,
    0,
    0,
    16,
    32,
    gTileBuffer,
    ((void *)0),
};

static void UpdateBGRegs(const struct WindowConfig *winConfig)
{
    u8 bgNum = winConfig->bgNum;
    *gBGHOffsetRegs[bgNum] = 0;
    *gBGVOffsetRegs[bgNum] = 0;
    *gBGControlRegs[bgNum] = winConfig->priority | (winConfig->screenBaseBlock << 8) | (winConfig->charBaseBlock << 2);
}

static void ClearBGMem(const struct WindowConfig *winConfig)
{
    { vu32 tmp = (vu32)(0); CpuFastSet((void *)&tmp, winConfig->tileData, 0x01000000 | ((32)/(32/8) & 0x1FFFFF)); };

    if (winConfig->tilemap)
        { vu32 tmp = (vu32)(0); CpuFastSet((void *)&tmp, winConfig->tilemap, 0x01000000 | ((0x800)/(32/8) & 0x1FFFFF)); };
}

void LoadFontDefaultPalette(const struct WindowConfig *winConfig)
{
    LoadPalette(gFontDefaultPalette, 16 * winConfig->paletteNum, 32);
}

void SetUpWindowConfig(const struct WindowConfig *winConfig)
{
    UpdateBGRegs(winConfig);
    ClearBGMem(winConfig);
    LoadFontDefaultPalette(winConfig);
}

u16 InitWindowTileData(struct Window *win, u16 startOffset)
{
    u16 retVal;

    win->tileDataStartOffset = startOffset;
    retVal = 0;

    switch (win->config->textMode)
    {
    case 2:
        retVal = InitVariableWidthFontTileData(win, startOffset);
        break;
    case 1:
        switch (win->config->fontNum)
        {
        case 0:
        case 3:
            retVal = LoadFixedWidthFont(win, startOffset);
            break;
        case 1:
        case 2:
            retVal = LoadFixedWidthFont_Font1Latin(win, startOffset);
            break;
        case 4:
        case 5:
            retVal = LoadFixedWidthFont_Font4Latin(win, startOffset);
            break;
        case 6:
            retVal = LoadFixedWidthFont_Braille(win, startOffset);
            break;
        }
        break;
    }

    return retVal;
}

static u16 InitVariableWidthFontTileData(struct Window *win, u16 startOffset)
{
    u8 *buffer;

    win->tileDataStartOffset = startOffset;
    win->tileDataOffset = 2;
    buffer = win->tileData + 32 * win->tileDataStartOffset;
    { vu32 tmp = (vu32)(0); CpuFastSet((void *)&tmp, buffer, 0x01000000 | ((32)/(32/8) & 0x1FFFFF)); };
    ApplyColors_UnshadowedFont(sBlankTile, (u32 *)(buffer + 32), win->config->foregroundColor, win->config->backgroundColor);
    return win->tileDataStartOffset + win->tileDataOffset + win->width * win->height;
}

static u16 LoadFixedWidthFont(struct Window *win, u16 startOffset)
{
    s32 glyph;
    u8 *buffer = win->tileData + 32 * startOffset;
    for (glyph = 0; glyph < 256; glyph++)
    {
        LoadFixedWidthGlyph(win, glyph, buffer);
        buffer += 64;
    }
    return 2 * glyph;
}

static u16 LoadFixedWidthFont_Font1Latin(struct Window *win, u16 startOffset)
{
    s32 i;
    u8 *buffer = win->tileData + 32 * startOffset;
    for (i = 0; i < 256; i++)
    {
        ApplyColors_UnshadowedFont(&sFont1LatinGlyphs[8 * i], (u32 *)buffer, win->foregroundColor, win->backgroundColor);
        buffer += 32;
    }
    return i;
}

static u16 LoadFixedWidthFont_Font4Latin(struct Window *win, u16 startOffset)
{
    s32 i;
    u8 *buffer = win->tileData + 32 * startOffset;
    for (i = 0; i < 256; i++)
    {
        ApplyColors_ShadowedFont(&gFont4LatinGlyphs[8 * i], buffer, win->foregroundColor, win->shadowColor, win->backgroundColor);
        buffer += 32;
    }
    return i;
}

static u16 LoadFixedWidthFont_Braille(struct Window *win, u16 startOffset)
{
    s32 i;
    u8 *buffer = win->tileData + 32 * startOffset;
    for (i = 0; i < 256; i++)
    {
        ApplyColors_UnshadowedFont(&sBrailleGlyphs[8 * i], (u32 *)buffer, win->foregroundColor, win->backgroundColor);
        buffer += 32;
    }
    return i;
}

u32 MultistepInitWindowTileData(struct Window *win, u16 startOffset)
{
    u32 retVal;
    sMultistepLoadFont_Window = win;
    sMultistepLoadFont_Index = 0;
    sMultistepLoadFont_StartOffset = startOffset;
    win->tileDataStartOffset = startOffset;
    retVal = 0;

    switch (win->config->textMode)
    {
    case 2:
        retVal = InitVariableWidthFontTileData(win, startOffset);
        break;
    case 1:
        retVal = 256;
        if (win->config->fontNum == 0
         || win->config->fontNum == 3)
            retVal *= 2;
        break;
    }

    return retVal;
}

bool32 MultistepLoadFont(void)
{
    bool32 retVal = 1;

    if (sMultistepLoadFont_Window->config->textMode == 1)
    {
        s32 i;

        for (i = sMultistepLoadFont_Index; i < sMultistepLoadFont_Index + 16; i++)
            MultistepLoadFont_LoadGlyph(sMultistepLoadFont_Window, sMultistepLoadFont_StartOffset, i);

        sMultistepLoadFont_Index += 16;

        if (sMultistepLoadFont_Index < 256)
            retVal = 0;
    }

    return retVal;
}

static void MultistepLoadFont_LoadGlyph(struct Window *win, u16 startOffset, u8 glyph)
{
    u8 *buffer;

    switch (win->config->fontNum)
    {
    case 0:
    case 3:
        buffer = win->tileData + 32 * startOffset + 64 * glyph;
        LoadFixedWidthGlyph(win, glyph, buffer);
        break;
    case 1:
    case 2:
        buffer = win->tileData + 32 * (glyph + startOffset);
        ApplyColors_UnshadowedFont(
            &sFont1LatinGlyphs[8 * glyph],
            (u32 *)buffer,
            win->foregroundColor,
            win->backgroundColor);
        break;
    case 4:
    case 5:
        buffer = win->tileData + 32 * (glyph + startOffset);
        ApplyColors_ShadowedFont(
            &gFont4LatinGlyphs[8 * glyph],
            buffer,
            win->foregroundColor,
            win->shadowColor,
            win->backgroundColor);
        break;
    }
}

void EmptyFunc(void)
{
}

void InitWindowFromConfig(struct Window *win, const struct WindowConfig *winConfig)
{
    *win = sDefaultWindow;
    win->config = (struct WindowConfig *)winConfig;
    win->textMode = winConfig->textMode;
    win->spacing = winConfig->spacing;
    win->fontNum = winConfig->fontNum;
    win->paletteNum = winConfig->paletteNum;
    win->tilemapLeft = winConfig->tilemapLeft;
    win->tilemapTop = winConfig->tilemapTop;
    win->width = winConfig->width;
    win->height = winConfig->height;
    win->tileData = winConfig->tileData;
    win->tilemap = winConfig->tilemap;
    InitColors(win);
    SetBackgroundColor(win, winConfig->backgroundColor);
    SetShadowColor(win, winConfig->shadowColor);
    SetForegroundColor(win, winConfig->foregroundColor);
}

void InitWindow(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top)
{
    const struct WindowConfig *winConfig = win->config;
    win->textMode = winConfig->textMode;
    win->fontNum = winConfig->fontNum;
    win->language = (LANGUAGE_ENGLISH);
    win->paletteNum = winConfig->paletteNum;
    win->win_field_B = 0;
    win->win_field_C = 0;
    win->delayCounter = 0;
    win->spacing = winConfig->spacing;
    win->win_field_F = 0;
    win->tilemapLeft = winConfig->tilemapLeft;
    win->tilemapTop = winConfig->tilemapTop;
    win->width = winConfig->width;
    win->height = winConfig->height;
    win->text = text;
    win->textIndex = 0;
    win->tileDataStartOffset = tileDataStartOffset;
    win->tileDataOffset = 0;
    win->left = 8 * left;
    win->cursorX = 0;
    win->top = 8 * top;
    win->cursorY = 0;
    win->state = WIN_STATE_BEGIN;
    win->downArrowCounter = 0;
    win->tileData = winConfig->tileData;
    win->tilemap = winConfig->tilemap;
    InitColors(win);
    SetBackgroundColor(win, winConfig->backgroundColor);
    SetShadowColor(win, winConfig->shadowColor);
    SetForegroundColor(win, winConfig->foregroundColor);
}

void sub_8002E4C(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u16 top, u32 a6)
{
    u8 val;

    InitWindow(win, text, tileDataStartOffset, 0, 0);
    win->left = left;
    win->top = top;
    val = 0;
    if (a6)
        val = 255;
    win->win_field_F = val;
    if (val)
        ClipLeft(win);
}

void sub_8002E90(struct Window *win, const u8 *text)
{
    win->state = WIN_STATE_NORMAL;
    win->text = text;
    win->textIndex = 0;
    win->downArrowCounter = 0;
    win->win_field_B = -1;
    win->win_field_C = 0;
    win->delayCounter = 0;
}

void sub_8002EB0(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top)
{
    gMain.watchedKeysMask = 0x0001 | 0x0002;
    gMain.watchedKeysPressed = 0;
    sWaitType = 0;
    sLineLength = 23;
    InitWindow(win, text, tileDataStartOffset, left, top);
    win->win_field_B = -1;
    if (win->textMode == 0)
    {
        u16 val = GetCursorTileNum(win, 0, 0);
        u8 *buffer = win->tileData + 32 * val;
        ApplyColors_UnshadowedFont(sBlankTile, (u32 *)buffer, win->backgroundColor, win->backgroundColor);
        ApplyColors_UnshadowedFont(&sFont1LatinGlyphs[8 * 0x6E], (u32 *)(buffer + 32), win->foregroundColor, win->backgroundColor);
        win->tileDataOffset = 2;
    }
}

u8 sub_8002F44(struct Window *win)
{
    while (win->state)
    {
        if (win->state == WIN_STATE_NEWLINE)
        {
            AddToCursorY(win, 16);
            win->cursorX = 0;
            if (win->win_field_F)
                ClipLeft(win);
            win->state = WIN_STATE_NORMAL;
        }
        else if (win->state == WIN_STATE_PLACEHOLDER)
        {
            sub_8002FA0(win, GetExpandedPlaceholder(win->text[win->textIndex++]));
        }

        InterpretText(win);
    }
    return 1;
}

static u8 sub_8002FA0(struct Window *win, const u8 *text)
{
    u8 retVal;
    u8 savedLanguage = win->language;
    const u8 *savedText = win->text;
    u16 savedTextIndex = win->textIndex;
    win->text = text;
    win->textIndex = 0;
    win->state = WIN_STATE_NORMAL;
    retVal = sub_8002F44(win);
    win->text = savedText;
    win->textIndex = savedTextIndex;
    win->state = WIN_STATE_NORMAL;
    win->language = savedLanguage;
    return retVal;
}

static u8 InterpretText(struct Window *win)
{
    u8 c = win->text[win->textIndex++];

    switch (c)
    {
    case 0xFF:
        ClipRight(win);
        win->state = WIN_STATE_END;
        return 0;
    case 0xFD:
        win->state = WIN_STATE_PLACEHOLDER;
        return 2;
    case 0xFE:
        ClipRight(win);
        win->state = WIN_STATE_NEWLINE;
        return 2;
    case 0xFB:
        DrawInitialDownArrow(win);
        win->state = WIN_STATE_PARAGRAPH;
        return 2;
    case 0xFA:
        DrawInitialDownArrow(win);
        win->state = WIN_STATE_NEWLINE_WAIT;
        return 2;
    case 0xFC:
        return HandleExtCtrlCode(win);
    }

    sPrintGlyphFuncs[win->textMode](win, c);
    return 1;
}

static u8 HandleExtCtrlCode(struct Window *win)
{
    return sExtCtrlCodeFuncs[win->text[win->textIndex++]](win);
}

static u8 ExtCtrlCode_Nop(struct Window *win)
{
    return 2;
}

static u8 ExtCtrlCode_ForegroundColor(struct Window *win)
{
    SetForegroundColor(win, win->text[win->textIndex++]);
    return 2;
}

static u8 ExtCtrlCode_BackgroundColor(struct Window *win)
{
    SetBackgroundColor(win, win->text[win->textIndex++]);
    return 2;
}

static u8 ExtCtrlCode_ShadowColor(struct Window *win)
{
    SetShadowColor(win, win->text[win->textIndex++]);
    return 2;
}

static u8 ExtCtrlCode_AllColors(struct Window *win)
{
    SetForegroundColor(win, win->text[win->textIndex++]);
    SetBackgroundColor(win, win->text[win->textIndex++]);
    SetShadowColor(win, win->text[win->textIndex++]);
    return 2;
}

static u8 ExtCtrlCode_Palette(struct Window *win)
{
    win->paletteNum = win->text[win->textIndex++];
    return 2;
}

static u8 ExtCtrlCode_Font(struct Window *win)
{
    win->fontNum = win->text[win->textIndex++];
    return 2;
}

static u8 ExtCtrlCode_DefaultFont(struct Window *win)
{
    win->fontNum = win->config->fontNum;
    return 2;
}

static u8 ExtCtrlCode_Pause(struct Window *win)
{
    ClipRight(win);
    win->state = WIN_STATE_PAUSE;
    win->delayCounter = win->text[win->textIndex++];
    return 2;
}

static u8 ExtCtrlCode_WaitButton(struct Window *win)
{
    ClipRight(win);
    win->state = WIN_STATE_WAIT_BUTTON;
    return 2;
}

static u8 ExtCtrlCode_WaitSound(struct Window *win)
{
    ClipRight(win);
    win->state = WIN_STATE_WAIT_SOUND;
    return 2;
}

static u8 ExtCtrlCode_PlayBGM(struct Window *win)
{
    u16 loByte = win->text[win->textIndex++];
    u16 hiByte = win->text[win->textIndex++] << 8;
    PlayBGM(loByte | hiByte);
    return 2;
}

static u8 ExtCtrlCode_Escape(struct Window *win)
{
    sPrintGlyphFuncs[win->textMode](win, win->text[win->textIndex++]);
    return 1;
}

u8 ExtCtrlCode_Nop2(struct Window *win)
{
    return 1;
}

static u8 ExtCtrlCode_SetCursorY(struct Window *win)
{
    ClipRight(win);
    AddToCursorY(win, 8 * win->text[win->textIndex++]);
    return 1;
}

static u8 ExtCtrlCode_ClearWindowTextLines(struct Window *win)
{
    ClearWindowTextLines(win);
    return 2;
}

static u8 ExtCtrlCode_PlaySE(struct Window *win)
{
    u16 loByte = win->text[win->textIndex++];
    u16 hiByte = win->text[win->textIndex++] << 8;
    PlaySE(loByte | hiByte);
    return 2;
}

static void DrawSpace(struct Window *win)
{
    if (win->textMode == 1 || (win->left + win->cursorX) & 7 || win->spacing <= 7)
    {
        sPrintGlyphFuncs[win->textMode](win, 0);
    }
    else
    {
        u32 val = sGlyphBuffer.background;
        u16 index = GetCursorTileNum(win, 0, 0);
        u32 *buffer = (u32 *)(win->tileData + 32 * index);
        buffer[0] = val;
        buffer[1] = val;
        buffer[2] = val;
        buffer[3] = val;
        buffer[4] = val;
        buffer[5] = val;
        buffer[6] = val;
        buffer[7] = val;
        index = GetCursorTileNum(win, 0, 1);
        buffer = (u32 *)(win->tileData + 32 * index);
        buffer[0] = val;
        buffer[1] = val;
        buffer[2] = val;
        buffer[3] = val;
        buffer[4] = val;
        buffer[5] = val;
        buffer[6] = val;
        buffer[7] = val;
        UpdateTilemap(win, 1);
        AddToCursorX(win, 8);
    }
}

static void sub_8003344(struct Window *win, u8 newX)
{
    u8 savedSpacing = win->spacing;

    if (newX - win->cursorX <= 8)
        win->spacing = newX - win->cursorX;
    else
        win->spacing = 8 - ((win->left + win->cursorX) & 7);

    while (win->cursorX < newX)
    {
        s32 spacing;
        DrawSpace(win);
        spacing = newX - win->cursorX;
        if (spacing >= 8)
            spacing = 8;
        win->spacing = spacing;
    }

    win->spacing = savedSpacing;
}

static u8 ExtCtrlCode_Skip(struct Window *win)
{
    sub_8003344(win, win->cursorX + win->text[win->textIndex++]);
    return 1;
}

static u8 ExtCtrlCode_SetCursorX(struct Window *win)
{
    ClipRight(win);
    SetCursorX(win, win->text[win->textIndex++]);
    return 1;
}

static u8 ExtCtrlCode_SkipTo(struct Window *win)
{
    sub_8003344(win, win->text[win->textIndex++]);
    return 1;
}

static u8 ExtCtrlCode_Spacing(struct Window *win)
{
    win->spacing = win->text[win->textIndex++];
    return 2;
}

static u8 ExtCtrlCode_Japanese(struct Window *win)
{
    win->language = LANGUAGE_JAPANESE;
    return 2;
}

static u8 ExtCtrlCode_Latin(struct Window *win)
{
    win->language = (LANGUAGE_ENGLISH);
    return 2;
}

u8 sub_8003418(struct Window *win)
{
    u8 retVal = 1;
    while (win->state)
    {
        if (win->state == WIN_STATE_NEWLINE)
        {
            AddToCursorY(win, 16);
            win->cursorX = 0;
            if (win->win_field_F)
                ClipLeft(win);
            win->state = WIN_STATE_NORMAL;
        }
        if (InterpretText(win) == 1)
        {
            retVal = 0;
            break;
        }
    }
    return retVal;
}

u8 sub_8003460(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top)
{
    InitWindow(win, text, tileDataStartOffset, left, top);
    return sub_8002F44(win);
}

u8 sub_8003490(struct Window *win, u8 c, u16 tileDataStartOffset, u8 left, u8 top)
{
    u8 retVal;
    u8 text[2];
    text[0] = c;
    text[1] = 0xFF;
    InitWindow(win, text, tileDataStartOffset, left, top);
    retVal = InterpretText(win);
    ClipRight(win);
    return retVal;
}

void sub_80034D4(u8 *tileData, const u8 *text)
{
    sub_8004E3C(&gWindowConfig_81E6C74, tileData, text);
}

u8 sub_80034EC(u8 *str)
{
    return GetStringWidthGivenWindowConfig((struct WindowConfig *)&gWindowConfig_81E6C74, str);
}

u8 *sub_8003504(u8 *dest, s32 value, u8 alignAmount, u8 alignType)
{
    sTempWindow.config = (struct WindowConfig *)&gWindowConfig_81E6C74;
    InitWindow(&sTempWindow, 0, 0, 0, 0);
    return AlignInt2(&sTempWindow, dest, value, alignAmount, alignType);
}

u8 *sub_8003558(u8 *dest, const u8 *src, u8 alignAmount, u8 alignType)
{
    sTempWindow.config = (struct WindowConfig *)&gWindowConfig_81E6C74;
    InitWindow(&sTempWindow, src, 0, 0, 0);
    return AlignString(&sTempWindow, dest, src, alignAmount, alignType);
}

u8 sub_80035AC(struct Window *win)
{
    sWaitType = 0;
    return UpdateWindowText(win);
}

static u8 UpdateWindowText(struct Window *win)
{
    switch (win->state)
    {
    case WIN_STATE_WAIT_BUTTON:
        if (PlayerCanInterruptWait(win))
        {
            if (gMain.newKeys & (0x0001 | 0x0002))
            {
                PlaySE(SE_SELECT);
            }
            else
            {
                return 0;
            }
        }
        else
        {
            win->delayCounter--;
            if (win->delayCounter)
                return 0;
        }
        win->state = WIN_STATE_NORMAL;
  return 0;
    case WIN_STATE_INTERRUPTIBLE_PAUSE:
        if (PlayerCanInterruptWait(win) && (gMain.heldKeys & (0x0001 | 0x0002)) && gMain.watchedKeysPressed == 1)
        {
            win->delayCounter = 0;
            win->state = WIN_STATE_NORMAL;
            break;
        }
    case WIN_STATE_PAUSE:
        if (win->delayCounter)
        {
            win->delayCounter--;
            if (win->delayCounter)
                return 0;
        }

        win->state = WIN_STATE_NORMAL;
        break;
    case WIN_STATE_PARAGRAPH:
        if (!WaitWithDownArrow(win))
            return 0;
        ClearWindowTextLines(win);
        win->state = WIN_STATE_NORMAL;
        asm("");
        return 0;
    case WIN_STATE_NEWLINE_WAIT:
        if (!WaitWithDownArrow(win))
            return 0;
        ScrollWindowTextLines(win);
        win->state = WIN_STATE_NORMAL;
        asm("");
        return 0;
    case WIN_STATE_PLACEHOLDER:
        win->textIndex++;
        win->state = WIN_STATE_NORMAL;
        break;
    case WIN_STATE_NEWLINE:
        ScrollWindowTextLines(win);
        win->state = WIN_STATE_NORMAL;
        asm("");
        return 0;
    case WIN_STATE_BEGIN:
        ClearWindowTextLines(win);
        break;
    case WIN_STATE_WAIT_SOUND:
        if (IsSEPlaying())
            return 0;
        win->state = WIN_STATE_NORMAL;
        break;
    case WIN_STATE_END:
        return 1;
    case WIN_STATE_NORMAL:
        break;
    default:
        win->state = WIN_STATE_END;
        return 1;
    }

    InterpretText(win);

    switch (win->state)
    {
    case WIN_STATE_END:
        return 1;
    case WIN_STATE_WAIT_BUTTON:
    case WIN_STATE_PARAGRAPH:
    case WIN_STATE_NEWLINE_WAIT:
        if (PlayerCanInterruptWait(win))
            return 0;
        win->delayCounter = 60;
        break;
    case WIN_STATE_PAUSE:
    case WIN_STATE_NEWLINE:
    case WIN_STATE_WAIT_SOUND:
        break;
    default:
        win->state = WIN_STATE_INTERRUPTIBLE_PAUSE;
        win->delayCounter = GetTextDelay(win);
    }

    return 0;
}



u8 sub_800374C(struct Window *win)
{
    u8 retVal;

    sWaitType = 1;
    sLineLength = 26;
    retVal = UpdateWindowText(win);
    sLineLength = 23;
    sWaitType = 0;
    return retVal;
}

u8 sub_8003778(struct Window *win)
{
    u8 retVal;

    sWaitType = 2;
    sLineLength = 23;
    retVal = UpdateWindowText(win);
    sWaitType = 0;
    return retVal;
}

u8 sub_80037A0(struct Window *win)
{
    u8 retVal;

    sWaitType = 3;
    sLineLength = 17;
    retVal = UpdateWindowText(win);
    sLineLength = 23;
    return retVal;
}

u32 sub_80037C8(struct Window *win, u8 lineLength)
{
    u8 retVal;

    sWaitType = 0;
    sLineLength = lineLength;
    retVal = UpdateWindowText(win);
    sLineLength = 23;
    return retVal;
}

static void PrintGlyph_TextMode0(struct Window *win, u32 glyph)
{
    AddToCursorX(win, DrawGlyph_TextMode0(win, glyph));
    if (win->win_field_B)
        ClipRight(win);
}

static u8 DrawGlyph_TextMode0(struct Window *win, u32 glyph)
{
    u8 pixelsWidth = GetGlyphWidth(win, glyph);
    u32 tilesWidth = DrawGlyphTiles(win, glyph, pixelsWidth);

 if (pixelsWidth == 11)
  pixelsWidth = 3;
 else if (pixelsWidth == 9)
  pixelsWidth = 1;

    UpdateTilemap(win, tilesWidth);

 if (glyph == 0xF9 && tilesWidth == -1)
  return 0;

 return pixelsWidth;
}

static void PrintGlyph_TextMode1(struct Window *win, u32 glyph)
{
    sWriteGlyphTilemapFuncs[win->fontNum](win, glyph);
    win->cursorX += 8;
}

static void WriteGlyphTilemap_Font0_Font3(struct Window *win, u32 glyph)
{
    s16 val = win->tileDataStartOffset + 2 * glyph;
    WriteGlyphTilemap(win, val, val + 1);
}

static void WriteGlyphTilemap_Font1_Font4(struct Window *win, u32 glyph)
{
    u32 val = glyph * 2;
    WriteGlyphTilemap(
        win,
        win->tileDataStartOffset + sFontType1Map[val],
        win->tileDataStartOffset + sFontType1Map[val + 1]);
}

static void WriteGlyphTilemap_Font2_Font5(struct Window *win, u32 glyph)
{
    WriteGlyphTilemap(
        win,
        win->tileDataStartOffset + 212,
        win->tileDataStartOffset + glyph);
}

static void WriteGlyphTilemap_Font6(struct Window *win, u32 glyph)
{
    u32 val = glyph * 2;
    WriteGlyphTilemap(
        win,
        win->tileDataStartOffset + sFontType3Map[val],
        win->tileDataStartOffset + sFontType3Map[val + 1]);
}

static void PrintGlyph_TextMode2(struct Window *win, u32 glyph)
{
    u8 width = GetGlyphWidth(win, glyph);
    u8 isPrint = DrawGlyph_TextMode2(win, glyph);

 if (isPrint == 1)
  width = 0;

 if (width == 11)
  AddToCursorX(win, 3);
 else if (width == 9)
  AddToCursorX(win, 1);
 else
  AddToCursorX(win, width);

    if (win->win_field_B)
        ClipRight(win);
}

static u8 DrawGlyph_TextMode2(struct Window *win, u32 glyph)
{
    u8 pixelsWidth = GetGlyphWidth(win, glyph);
    u32 tilesWidth = DrawGlyphTiles(win, glyph, pixelsWidth);

 if (glyph == 0xF9 && tilesWidth == -1)
  return 1;
 else
 {
  UpdateTilemap(win, tilesWidth);
  return 0;
 }
}

static void LoadFixedWidthGlyph(struct Window *win, u32 glyph, u8 *dest)
{
    u8 *upperTile;
    u8 *lowerTile;

    GetGlyphTilePointers(win->fontNum, win->language, glyph, &upperTile, &lowerTile);

    switch (win->fontNum)
    {
    case 0:
    case 1:
    case 2:
    case 6:
        ApplyColors_UnshadowedFont(upperTile, (u32 *)dest, win->foregroundColor, win->backgroundColor);
        ApplyColors_UnshadowedFont(lowerTile, (u32 *)(dest + 32), win->foregroundColor, win->backgroundColor);
        break;
    case 3:
    case 4:
    case 5:
        ApplyColors_ShadowedFont(upperTile, dest, win->foregroundColor, win->shadowColor, win->backgroundColor);
        ApplyColors_ShadowedFont(lowerTile, dest + 32, win->foregroundColor, win->shadowColor, win->backgroundColor);
        break;
    }
}

static void WriteGlyphTilemap(struct Window *win, u16 upperTileNum, u16 lowerTileNum)
{
    u16 *buffer = GetCursorTilemapPointer(win);
    if (buffer)
    {
        u16 palette = (win->paletteNum << 12);
        buffer[0] = upperTileNum | palette;
        buffer[32] = lowerTileNum | palette;
    }
}

static void GetGlyphTilePointers(u8 fontNum, u8 language, u16 glyph, u8 **upperTilePtr, u8 **lowerTilePtr)
{
    u16 index;
    const struct Font *font;

    if (language == LANGUAGE_JAPANESE)
        language = 0;
    else
        language = 7;

    font = &sFonts[language + fontNum];

    switch (font->type)
    {
    case 0:
  *upperTilePtr = font->glyphs + glyph * font->glyphSize;
  *lowerTilePtr = *upperTilePtr + font->lowerTileOffset;
        break;
    case 1:
        index = 2 * glyph;
        *upperTilePtr = font->glyphs + sFontType1Map[index] * font->glyphSize;
        *lowerTilePtr = font->glyphs + sFontType1Map[index + 1] * font->glyphSize;
        break;
    case 2:
        *upperTilePtr = font->glyphs + 212 * font->glyphSize;
        *lowerTilePtr = font->glyphs + glyph * font->glyphSize;
        break;
    case 3:
  index = 2 * glyph;
  *upperTilePtr = font->glyphs + sFontType3Map[index] * font->glyphSize;
  *lowerTilePtr = font->glyphs + sFontType3Map[index + 1] * font->glyphSize;
  break;
    case 4:
        *upperTilePtr = font->glyphs
            + (glyph & 0xFFF0) * font->glyphSize
            + (((glyph &= 0xF) * font->glyphSize) >> 1);
        *lowerTilePtr = *upperTilePtr + font->lowerTileOffset;
        break;
    }
}

static u16 *GetCursorTilemapPointer(struct Window *win)
{
    u16 *ptr = ((void *)0);
    if (win->tilemap)
    {
        u8 x = ((win->left + win->cursorX) >> 3) + win->tilemapLeft;
        u8 y = ((win->top + win->cursorY) >> 3) + win->tilemapTop;
        ptr = &win->tilemap[(y * 32) + x];
    }
    return ptr;
}

static void ApplyColors_UnshadowedFont(const u8 *src, u32 *dest, u8 foreground, u8 background)
{
    u32 a[2];
    s32 i;
    const u8 *srcRows = src;

    a[0] = background;
    a[1] = foreground;

    for (i = 0; i < 8; i++)
    {
        u32 destRow = a[srcRows[i] & 1]
                    | (a[(srcRows[i] >> 1) & 1] << 4)
                    | (a[(srcRows[i] >> 2) & 1] << 8)
                    | (a[(srcRows[i] >> 3) & 1] << 12)
                    | (a[(srcRows[i] >> 4) & 1] << 16)
                    | (a[(srcRows[i] >> 5) & 1] << 20)
                    | (a[(srcRows[i] >> 6) & 1] << 24)
                    | (a[(srcRows[i] >> 7) ] << 28);
        dest[i] = destRow;
    }
}

static void ApplyColors_ShadowedFont(const void *src, void *dest, u8 foreground, u8 shadow, u8 background)
{
    u32 a[0x10];
    s32 i;
    const u32 *curSrc;
    u32 *curDest;
    u32 colorMask;

    a[0x1] = 0x1;
    a[0x2] = 0x2;
    a[0x3] = 0x3;
    a[0x4] = 0x4;
    a[0x5] = 0x5;
    a[0x6] = 0x6;
    a[0x7] = 0x7;
    a[0x8] = 0x8;
    a[0x9] = 0x9;
    a[0xA] = 0xA;
    a[0xB] = 0xB;
    a[0xC] = 0xC;
    a[0xD] = 0xD;
    a[0x0] = background;
    a[0xE] = shadow;
    a[0xF] = foreground;

    colorMask = 0xF;

    curSrc = src;
    curDest = dest;

    for (i = 7; i >= 0; i--)
    {
        u32 row = *curSrc++;
        u32 recoloredRow = a[row & colorMask]
                         | (a[(row >> 4) & colorMask] << 4)
                         | (a[(row >> 8) & colorMask] << 8)
                         | (a[(row >> 12) & colorMask] << 12)
                         | (a[(row >> 16) & colorMask] << 16)
                         | (a[(row >> 20) & colorMask] << 20)
                         | (a[(row >> 24) & colorMask] << 24)
                         | (a[(row >> 28) ] << 28);
        *curDest++ = recoloredRow;
    }
}

static void SetCursorX(struct Window *win, u8 x)
{
    if (win->textMode == 0 && ((win->left + win->cursorX) & 7))
        win->tileDataOffset += 2;
    win->cursorX = x;
}

static void AddToCursorX(struct Window *win, u8 deltaX)
{
    if (win->textMode == 0)
    {
        u8 x = win->cursorX;
        win->cursorX += deltaX;
        if (((win->left + win->cursorX) & 0xF8) != ((win->left + x) & 0xF8))
            win->tileDataOffset += 2;
    }
    else
    {
        win->cursorX += deltaX;
    }
}

static void AddToCursorY(struct Window *win, u8 deltaY)
{
    if (win->textMode == 0 && ((win->left + win->cursorX) & 7))
        win->tileDataOffset += 2;
    win->cursorY += deltaY;
}

static void EraseAtCursor(struct Window *win)
{
    switch (win->textMode)
    {
    case 0:
    case 2:
        DrawGlyphTiles(win, 0, 8);
        break;
    case 1:
        sWriteGlyphTilemapFuncs[win->fontNum](win, 0);
        break;
    }
}

static void ClipLeft(struct Window *win)
{
    u32 pixel = win->left & 7;
    if (win->textMode != 1 && pixel)
    {
        const u32 *masks = sGlyphMasks[8][pixel];
        u32 outsideMask = masks[0];
        u32 insideMask = ~outsideMask;
        u32 outside = sGlyphBuffer.background & outsideMask;
        u16 tileNum = GetCursorTileNum(win, 0, 0);
        u32 *buffer = (u32 *)(win->tileData + 32 * tileNum);
        buffer[0] = (buffer[0] & insideMask) | outside;
        buffer[1] = (buffer[1] & insideMask) | outside;
        buffer[2] = (buffer[2] & insideMask) | outside;
        buffer[3] = (buffer[3] & insideMask) | outside;
        buffer[4] = (buffer[4] & insideMask) | outside;
        buffer[5] = (buffer[5] & insideMask) | outside;
        buffer[6] = (buffer[6] & insideMask) | outside;
        buffer[7] = (buffer[7] & insideMask) | outside;
        tileNum = GetCursorTileNum(win, 0, 1);
        buffer = (u32 *)(win->tileData + 32 * tileNum);
        buffer[0] = (buffer[0] & insideMask) | outside;
        buffer[1] = (buffer[1] & insideMask) | outside;
        buffer[2] = (buffer[2] & insideMask) | outside;
        buffer[3] = (buffer[3] & insideMask) | outside;
        buffer[4] = (buffer[4] & insideMask) | outside;
        buffer[5] = (buffer[5] & insideMask) | outside;
        buffer[6] = (buffer[6] & insideMask) | outside;
        buffer[7] = (buffer[7] & insideMask) | outside;
    }
}

static void ClipRight(struct Window *win)
{
    register u8 cursorX asm("r0") = win->cursorX;
    u8 left = win->left;
    u32 pixel = (cursorX + left) & 7;
    if (win->textMode != 1 && pixel)
    {
        const u32 *masks = sGlyphMasks[8 - pixel][pixel];
        u32 insideMask = masks[0];
        u32 outside = (sGlyphBuffer.background & ~insideMask);
        u16 tileNum = GetCursorTileNum(win, 0, 0);
        u32 *buffer = (u32 *)(win->tileData + 32 * tileNum);
        buffer[0] = (buffer[0] & insideMask) | outside;
        buffer[1] = (buffer[1] & insideMask) | outside;
        buffer[2] = (buffer[2] & insideMask) | outside;
        buffer[3] = (buffer[3] & insideMask) | outside;
        buffer[4] = (buffer[4] & insideMask) | outside;
        buffer[5] = (buffer[5] & insideMask) | outside;
        buffer[6] = (buffer[6] & insideMask) | outside;
        buffer[7] = (buffer[7] & insideMask) | outside;
        tileNum = GetCursorTileNum(win, 0, 1);
        buffer = (u32 *)(win->tileData + 32 * tileNum);
        buffer[0] = (buffer[0] & insideMask) | outside;
        buffer[1] = (buffer[1] & insideMask) | outside;
        buffer[2] = (buffer[2] & insideMask) | outside;
        buffer[3] = (buffer[3] & insideMask) | outside;
        buffer[4] = (buffer[4] & insideMask) | outside;
        buffer[5] = (buffer[5] & insideMask) | outside;
        buffer[6] = (buffer[6] & insideMask) | outside;
        buffer[7] = (buffer[7] & insideMask) | outside;
        UpdateTilemap(win, 1);
    }
}

static void InitColors(struct Window *win)
{
    u32 i;

    win->backgroundColor = 0;
    win->shadowColor = 14;
    win->foregroundColor = 15;

    for (i = 0; i < 16; i++)
        sGlyphBuffer.colors[i] = i;
}

static void SetBackgroundColor(struct Window *win, u8 color)
{
    u32 val1;
    u32 val2;
    u32 val3;
    win->backgroundColor = color;
    sGlyphBuffer.colors[0] = color;
    val1 = color | (color << 4);
    val2 = val1 | (val1 << 8);
    val3 = val2 | (val2 << 16);
    sGlyphBuffer.background = val3;
}

static void SetShadowColor(struct Window *win, u8 color)
{
    win->shadowColor = color;
    sGlyphBuffer.colors[14] = color;
}

static void SetForegroundColor(struct Window *win, u8 color)
{
    win->foregroundColor = color;
    sGlyphBuffer.colors[15] = color;
}

static u8 GetTextDelay(struct Window *win)
{
    if (!PlayerCanInterruptWait(win))
        return 3;

    return sTextSpeedDelays[gSaveBlock2.optionsTextSpeed];
}

static bool8 PlayerCanInterruptWait(struct Window *win)
{
    bool8 retVal = 1;

    switch (sWaitType)
    {
    case 2:
        retVal = 0;
        break;
    case 3:
        retVal = gIsLinkContest ? 0 : 1;
        break;
    case 1:
        retVal = (gBattleTypeFlags & 0x0002) ? 0 : 1;
        break;
    }

    return retVal;
}

static void ScrollWindowTextLines(struct Window *win)
{
    switch (win->textMode)
    {
    case 0:
        ScrollWindowTextLines_TextMode0(win);
        break;
    case 1:
        ScrollWindowTextLines_TextMode1(win);
        break;
    case 2:
        ScrollWindowTextLines_TextMode2(win);
        break;
    }
}

static void ScrollWindowTextLines_TextMode0(struct Window *win)
{
    if (win->cursorY == 0)
    {
        win->tileDataOffset = 2 * sLineLength + 2;
        win->cursorX = 0;
        win->cursorY += 16;
    }
    else
    {
        if (win->win_field_C & 2)
            win->tileDataOffset = 2 * sLineLength + 2;
        else
            win->tileDataOffset = 2;
        win->win_field_C = win->win_field_C ^ 2;
        win->cursorX = 0;
        DoScroll_TextMode0(win, sLineLength);
    }
}

static void DoScroll_TextMode0(struct Window *win, u16 lineLength)
{
    u16 *buffer = win->tilemap;
    u32 val1 = 32 * (win->top >> 3);
    u32 val2 = (win->left >> 3);
    u16 fill;
    buffer += val1 + val2;
    fill = (win->paletteNum << 12) | GetBlankTileNum(win);
    CpuSet(buffer + 64, buffer, 0x00000000 | ((lineLength * 2)/(16/8) & 0x1FFFFF));
    CpuSet(buffer + 96, buffer + 32, 0x00000000 | ((lineLength * 2)/(16/8) & 0x1FFFFF));
    { vu16 tmp = (vu16)(fill); CpuSet((void *)&tmp, buffer + 64, 0x00000000 | 0x01000000 | ((lineLength * 2)/(16/8) & 0x1FFFFF)); };
    { vu16 tmp = (vu16)(fill); CpuSet((void *)&tmp, buffer + 96, 0x00000000 | 0x01000000 | ((lineLength * 2)/(16/8) & 0x1FFFFF)); };
}

static void ScrollWindowTextLines_TextMode1(struct Window *win)
{
    if (win->cursorY == 0)
    {
        win->cursorX = 0;
        win->cursorY += 16;
    }
    else
    {
        win->win_field_C ^= 2;
        win->cursorX = 0;
        DoScroll_TextMode1(win, sLineLength);
    }
}

static void DoScroll_TextMode1(struct Window *win, u16 lineLength)
{
    u16 *buffer = GetCursorTilemapPointer(win);
    u16 *dest = buffer - 32;
    u16 fill = (win->paletteNum << 12) | GetBlankTileNum(win);
    CpuSet(buffer + 32, dest, 0x00000000 | ((lineLength * 2)/(16/8) & 0x1FFFFF));
    CpuSet(buffer + 64, buffer, 0x00000000 | ((lineLength * 2)/(16/8) & 0x1FFFFF));
    { vu16 tmp = (vu16)(fill); CpuSet((void *)&tmp, buffer + 32, 0x00000000 | 0x01000000 | ((lineLength * 2)/(16/8) & 0x1FFFFF)); };
    { vu16 tmp = (vu16)(fill); CpuSet((void *)&tmp, buffer + 64, 0x00000000 | 0x01000000 | ((lineLength * 2)/(16/8) & 0x1FFFFF)); };
}

static void ScrollWindowTextLines_TextMode2(struct Window *win)
{
    if (win->cursorY == 0)
    {
        win->cursorX = 0;
        win->cursorY += 16;
    }
    else
    {
        win->win_field_C ^= 2;
        win->cursorX = 0;
        DoScroll_TextMode2(win, sLineLength);
    }
}

static void DoScroll_TextMode2(struct Window *win, u8 lineLength)
{
    u8 i;
    u8 *buf1 = win->tileData + 32 * GetCursorTileNum(win, 0, -2);
    u8 *buf2 = win->tileData + 32 * GetCursorTileNum(win, 0, 0);
    u8 *buf4;
    u16 *buf3;
    u16 a[4];

    CpuFastSet(buf2, buf1, ((32 * lineLength)/(32/8) & 0x1FFFFF));
    { vu32 tmp = (vu32)(sGlyphBuffer.background); CpuFastSet((void *)&tmp, buf2, 0x01000000 | ((32 * lineLength)/(32/8) & 0x1FFFFF)); };
    buf4 = buf2 + 32 * win->width;
    CpuFastSet(buf4, buf1 + 32 * win->width, ((32 * lineLength)/(32/8) & 0x1FFFFF));
    { vu32 tmp = (vu32)(sGlyphBuffer.background); CpuFastSet((void *)&tmp, buf4, 0x01000000 | ((32 * lineLength)/(32/8) & 0x1FFFFF)); };

    buf3 = GetCursorTilemapPointer(win) - 64;

    a[0] = (win->tileDataStartOffset + win->tileDataOffset
          + ((win->top >> 3) * win->width)
          + (win->left >> 3))
         | (win->paletteNum << 12);
    a[1] = a[0] + win->width;
    a[2] = a[1] + win->width;
    a[3] = a[2] + win->width;

    for (i = 0; i < lineLength; i++)
    {
        buf3[0] = a[0]++;
        buf3[32] = a[1]++;
        buf3[64] = a[2]++;
        buf3[96] = a[3]++;
        buf3++;
    }
}

void ClearWindowTextLines(struct Window *win)
{
    switch (win->textMode)
    {
    case 0:
        ClearWindowTextLines_TextMode0_TextMode1(win, sLineLength);
        win->tileDataOffset = 2;
        break;
    case 1:
        ClearWindowTextLines_TextMode0_TextMode1(win, sLineLength);
        break;
    case 2:
        ClearWindowTextLines_TextMode2(win, sLineLength);
        break;
    }
}

static void ClearWindowTextLines_TextMode0_TextMode1(struct Window *win, u8 lineLength)
{
    u8 i;
    u16 *buffer;
    u16 fill;

    win->cursorX = 0;
    win->cursorY = 0;
    win->win_field_C = 0;

    buffer = GetCursorTilemapPointer(win);
    fill = GetBlankTileNum(win) | (win->paletteNum << 12);

    for (i = 0; i < 4; i++)
    {
        u8 j;
        for (j = 0; j < lineLength; j++)
            buffer[j] = fill;
        buffer += 32;
    }
}

static void ClearWindowTextLines_TextMode2(struct Window *win, u8 lineLength)
{
    u8 *buffer;

    win->cursorX = 0;
    win->cursorY = 0;
    win->win_field_C = 0;

    buffer = win->tileData + 32 * GetCursorTileNum(win, 0, 0);
    { vu32 tmp = (vu32)(sGlyphBuffer.background); CpuFastSet((void *)&tmp, buffer, 0x01000000 | ((32 * lineLength)/(32/8) & 0x1FFFFF)); };
    buffer += 32 * win->width;
    { vu32 tmp = (vu32)(sGlyphBuffer.background); CpuFastSet((void *)&tmp, buffer, 0x01000000 | ((32 * lineLength)/(32/8) & 0x1FFFFF)); };
    buffer += 32 * win->width;
    { vu32 tmp = (vu32)(sGlyphBuffer.background); CpuFastSet((void *)&tmp, buffer, 0x01000000 | ((32 * lineLength)/(32/8) & 0x1FFFFF)); };
    buffer += 32 * win->width;
    { vu32 tmp = (vu32)(sGlyphBuffer.background); CpuFastSet((void *)&tmp, buffer, 0x01000000 | ((32 * lineLength)/(32/8) & 0x1FFFFF)); };
}

static void DrawDownArrow(struct Window *win)
{
    if (PlayerCanInterruptWait(win))
    {
        const u32 *downArrowTiles = &sDownArrowTiles[((win->downArrowCounter & 0x0F00) >> 8) * 16];

        switch (win->textMode)
        {
        case 1:
        {
            u8 *buffer;
            u16 tileNum = win->tileDataStartOffset + 254;
            if (win->fontNum == 0 || win->fontNum == 3)
                tileNum *= 2;
            buffer = win->tileData + 32 * tileNum;
            ApplyColors_ShadowedFont(downArrowTiles, buffer, win->foregroundColor, win->shadowColor, win->backgroundColor);
            ApplyColors_ShadowedFont(downArrowTiles + 8, buffer + 32, win->foregroundColor, win->shadowColor, win->backgroundColor);
            WriteGlyphTilemap(win, tileNum, tileNum + 1);
            break;
        }
        case 0:
        case 2:
        {
            struct GlyphTileInfo glyphTileInfo;
            glyphTileInfo.textMode = win->textMode;
            glyphTileInfo.startPixel = (win->left + win->cursorX) & 7;
            if (glyphTileInfo.startPixel != 0)
            {
                u8 *upperTile;
                u8 *lowerTile;
                GetGlyphTilePointers(win->fontNum, win->language, 0, &upperTile, &lowerTile);
                glyphTileInfo.width = 8 - glyphTileInfo.startPixel;
                glyphTileInfo.src = upperTile;
                glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 1, 0));
                glyphTileInfo.colors = sGlyphBuffer.colors;
                DrawGlyphTile_ShadowedFont(&glyphTileInfo);
                glyphTileInfo.src = lowerTile;
                glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 1, 1));
                DrawGlyphTile_ShadowedFont(&glyphTileInfo);
            }
            glyphTileInfo.width = 8;
            glyphTileInfo.src = (u8 *)downArrowTiles;
            glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 0));
            glyphTileInfo.colors = sGlyphBuffer.colors;
            DrawGlyphTile_ShadowedFont(&glyphTileInfo);
            glyphTileInfo.src += 32;
            glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
            DrawGlyphTile_ShadowedFont(&glyphTileInfo);
            if (glyphTileInfo.startPixel != 0)
                UpdateTilemap(win, 2);
            else
                UpdateTilemap(win, 1);
            break;
        }
        }
    }
}

static u8 WaitWithDownArrow(struct Window *win)
{
    u8 retVal = 1;

    if (!PlayerCanInterruptWait(win))
    {
        win->delayCounter--;
        if (!win->delayCounter)
        {
            TryEraseDownArrow(win);
        }
        else
        {
            DrawMovingDownArrow(win);
            retVal = 0;
        }
    }
    else
    {
        if (gMain.newKeys & (0x0001 | 0x0002))
        {
            PlaySE(SE_SELECT);
            TryEraseDownArrow(win);
        }
        else
        {
            DrawMovingDownArrow(win);
            retVal = 0;
        }
    }

    return retVal;
}

static void DrawInitialDownArrow(struct Window *win)
{
    win->downArrowCounter = 0;
    DrawDownArrow(win);
}

static void DrawMovingDownArrow(struct Window *win)
{
    u16 downArrowPos = (win->downArrowCounter & 0x0F00) >> 8;
    u16 wait = win->downArrowCounter & 0x000F;
    u16 newVal;

    wait++;

    if (wait == 6)
    {
        wait = 0;
        downArrowPos++;
        if (downArrowPos > 3)
            downArrowPos = 0;
        win->downArrowCounter = downArrowPos << 8;
        DrawDownArrow(win);
    }

    newVal = downArrowPos << 8;
    newVal |= wait;

    win->downArrowCounter = newVal;
}

static void TryEraseDownArrow(struct Window *win)
{
    win->downArrowCounter = 0;
    if (PlayerCanInterruptWait(win) == 1)
        EraseAtCursor(win);
}

u16 GetWindowTilemapEntry(struct Window *win, u8 x, u8 y)
{
    u16 *tilemap = win->tilemap;
    return tilemap[32 * y + x];
}

void DrawWindowRect(struct Window *win, u16 tilemapEntry, u8 left, u8 top, u8 right, u8 bottom)
{
    u8 i;
    u16 *buffer = &win->tilemap[top * 32];

    for (i = left; i <= right; i++)
        buffer[i] = tilemapEntry;

    for (i = top + 1; i < bottom - 1; i++)
    {
        buffer += 32;
        buffer[left] = tilemapEntry;
        buffer[right] = tilemapEntry;
    }

    if (top != bottom)
    {
        buffer += 32;
        for (i = left; i <= right; i++)
            buffer[i] = tilemapEntry;
    }
}

void DrawWindowRect_DefaultPalette(struct Window *win, u16 tileNum, u8 left, u8 top, u8 right, u8 bottom)
{
    DrawWindowRect(win, (win->paletteNum << 12) | tileNum, left, top, right, bottom);
}

void FillWindowRect(struct Window *win, u16 tilemapEntry, u8 left, u8 top, u8 right, u8 bottom)
{
    u16 *buffer = &win->tilemap[top * 32];
    while (top++ <= bottom)
    {
        u8 j;
        for (j = left; j <= right; j++)
            buffer[j] = tilemapEntry;
        buffer += 32;
    }
}

void FillWindowRect_DefaultPalette(struct Window *win, u16 tileNum, u8 left, u8 top, u8 right, u8 bottom)
{
    FillWindowRect(win, (win->paletteNum << 12) | tileNum, left, top, right, bottom);
}

void ZeroFillWindowRect(struct Window *win, u8 left, u8 top, u8 right, u8 bottom)
{
    FillWindowRect_DefaultPalette(win, 0, left, top, right, bottom);
}

void FillWindowRectWithBlankTile(struct Window *win, u8 left, u8 top, u8 right, u8 bottom)
{
    u16 tileNum = GetBlankTileNum(win);
    FillWindowRect_DefaultPalette(win, tileNum, left, top, right, bottom);
}

static u16 GetBlankTileNum(struct Window *win)
{
    u16 retVal = win->tileDataStartOffset;

    switch (win->textMode)
    {
    case 0:
        break;
    case 2:
        retVal++;
        break;
    case 1:
        switch (win->fontNum)
        {
        case 1:
        case 2:
        case 4:
        case 5:
            retVal += 212;
        case 0:
        case 3:
        case 6:
            break;
        default:
            retVal = 0;
        }
        break;
    }

    return retVal;
}

static s32 sub_80048D8(struct Window *win, u8 x, u8 y)
{
    win->cursorX = x;
    win->cursorY = y & 0xF8;
}

static u8 GetGlyphWidth(struct Window *win, u32 glyph)
{
    u8 width = 8;


 if (win->language == LANGUAGE_JAPANESE)
  return width;

 if (glyph >= 0x37 && glyph <= 0x41)
 {
  switch (win->fontNum)
  {
  case 1:
  case 2:
  case 3:
   if (gCustomFont == 0)
    width = 11;
   else if (gCustomFont == 2)
    width = 9;
   else
    width = 8;
   break;
  case 0:
  case 4:
  case 5:
   width = 8;
   break;
  }
 } else if (glyph == 0xF9)
 {
  switch (win->fontNum)
  {
  case 1:
  case 2:
  case 3:
   if (gCustomFont == 0)
    width = 11;
   else if (gCustomFont == 2)
    width = 9;
   else
    width = 8;
   break;
  case 0:
  case 4:
  case 5:
   width = 8;
   break;
  }
 } else
 {
        width = win->spacing;
        if (!win->spacing)
        {
            switch (win->fontNum)
            {
            case 3:
                width = sFont3Widths[glyph];
                break;
            case 4:
            case 5:
                width = sFont4Widths[sFontType1Map[2 * glyph + 1]];
                break;
            case 0:
                width = sFont0Widths[glyph];
                break;
            case 1:
            case 2:
                width = sFont1Widths[sFontType1Map[2 * glyph + 1]];
                break;
            case 6:
                width = 8;
                break;
            default:
                width = 8;
            }
        }
    }

    return width;
}

u8 GetExtCtrlCodeLength(u8 code)
{
    u8 length = 0;
    if (code <= 0x16)
        length = sExtCtrlCodeLengths[code];
    return length;
}

u8 *AlignInt1(struct Window *win, u8 *dest, s32 value, u8 alignAmount, u8 alignType)
{
    u8 temp[16];
    u8 width;
    switch (alignType)
    {
    case 0:
        ConvertIntToDecimalString(temp, value);
        dest = StringCopy(dest, temp);
        dest[0] = 0xFC;
        dest[1] = 19;
        dest[2] = alignAmount;
        dest += 3;
        *dest = 0xFF;
        break;
    case 1:
        ConvertIntToDecimalString(temp, value);
        width = GetStringWidth(win, temp);
        if (alignAmount > width)
        {
            dest[0] = 0xFC;
            dest[1] = 19;
            dest[2] = alignAmount - width;
            dest += 3;
        }
        dest = StringCopy(dest, temp);
        break;
    case 2:
        ConvertIntToDecimalString(temp, value);
        width = GetStringWidth(win, temp);
        if (alignAmount > width)
        {
            dest[0] = 0xFC;
            dest[1] = 19;
            dest[2] = (alignAmount - width) / 2;
            dest += 3;
        }
        dest = StringCopy(dest, temp);
        if (alignAmount > width)
        {
            dest[0] = 0xFC;
            dest[1] = 19;
            dest[2] = alignAmount;
            dest += 3;
            *dest = 0xFF;
        }
        break;
    }
    return dest;
}

u8 *AlignInt2(struct Window *win, u8 *dest, s32 value, u8 alignAmount, u8 alignType)
{
    u8 temp[16];
    u8 width;
    switch (alignType)
    {
    case 0:
        ConvertIntToDecimalString(temp, value);
        width = GetStringWidth(win, temp);
        dest = StringCopy(dest, temp);
        dest[0] = 0xFC;
        dest[1] = 17;
        dest[2] = alignAmount - width;
        dest += 3;
        *dest = 0xFF;
        break;
    case 1:
        ConvertIntToDecimalString(temp, value);
        width = GetStringWidth(win, temp);
        if (alignAmount > width)
        {
            dest[0] = 0xFC;
            dest[1] = 17;
            dest[2] = alignAmount - width;
            dest += 3;
        }
        dest = StringCopy(dest, temp);
        break;
    case 2:
        ConvertIntToDecimalString(temp, value);
        width = GetStringWidth(win, temp);
        if (alignAmount > width)
        {
            dest[0] = 0xFC;
            dest[1] = 17;
            dest[2] = (alignAmount - width) / 2;
            dest += 3;
        }
        dest = StringCopy(dest, temp);
        if (alignAmount > width)
        {
            dest[0] = 0xFC;
            dest[1] = 17;
            dest[2] = (alignAmount - width) / 2;
            dest += 3;
            *dest = 0xFF;
        }
        break;
    }
    return dest;
}

u8 *AlignString(struct Window *win, u8 *dest, const u8 *src, u8 alignAmount, u8 alignType)
{
    u8 width;
    switch (alignType)
    {
    case 0:
        dest = StringCopy(dest, src);
        dest[0] = 0xFC;
        dest[1] = 19;
        dest[2] = alignAmount;
        dest += 3;
        *dest = 0xFF;
        break;
    case 1:
        width = GetStringWidth(win, src);
        if (alignAmount > width)
        {
            dest[0] = 0xFC;
            dest[1] = 19;
            dest[2] = alignAmount - width;
            dest += 3;
        }
        dest = StringCopy(dest, src);
        break;
    case 2:
        width = GetStringWidth(win, src);
        if (alignAmount > width)
        {
            dest[0] = 0xFC;
            dest[1] = 19;
            dest[2] = (alignAmount - width) / 2;
            dest += 3;
        }
        dest = StringCopy(dest, src);
        if (alignAmount > width)
        {
            dest[0] = 0xFC;
            dest[1] = 19;
            dest[2] = alignAmount;
            dest += 3;
            *dest = 0xFF;
        }
        break;
    }
    return dest;
}

u8 GetStringWidth(struct Window *win, const u8 *s)
{
    u8 width = 0;
    u8 savedFontNum = win->fontNum;
    u8 savedCharset = win->language;
    u8 savedSpacing = win->spacing;
    s32 i = 0;

    while (s[i] != 0xFF)
    {
        u8 c = s[i];
        switch (c)
        {
        case 0xFD:
        {
            u8 temp;
            i++;
            temp = win->language;
            width += GetStringWidth(win, GetExpandedPlaceholder(s[i]));
            win->language = temp;
            i++;
            break;
        }
        case 0xFC:
            i++;
            switch (s[i])
            {
            case 6:
                win->fontNum = s[i + 1];
                break;
            case 7:
                win->fontNum = win->config->fontNum;
                break;
            case 0x11:
                width += s[i + 1];
                break;
            case 0x12:
            case 0x13:
                if (width < s[i + 1])
                    width = s[i + 1];
                break;
            case 0x14:
                win->spacing = s[i + 1];
                break;
            case 0x15:
                win->language = LANGUAGE_JAPANESE;
                break;
            case 0x16:
                win->language = (LANGUAGE_ENGLISH);
                break;
            }

            i += GetExtCtrlCodeLength(s[i]);
            break;
  case 0x37:
  case 0x38:
  case 0x39:
  case 0x3A:
  case 0x3B:
  case 0x3C:
  case 0x3D:
  case 0x3E:
  case 0x3F:
  case 0x40:
  case 0x41:
   if (gCustomFont == 0)
    width += 11;
   else if (gCustomFont == 2)
    width += 9;
   else
    width += 8;
   i += 2;
   break;
        default:
            i++;
            width += GetGlyphWidth(win, c);
        }
    }

    win->spacing = savedSpacing;
    win->language = savedCharset;
    win->fontNum = savedFontNum;

    return width;
}

u8 sub_8004D04(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u16 top, u32 a6)
{
    sub_8002E4C(win, text, tileDataStartOffset, left, top, a6);
    return sub_8002F44(win);
}

u8 sub_8004D38(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top)
{
    u8 width = GetStringWidth(win, text);
    InitWindow(win, text, tileDataStartOffset, left - ((u32)(width + 7) >> 3), top);
    EraseAtCursor(win);
    width &= 7;
    if (width)
        width = 8 - width;
    sub_80048D8(win, width, 0);
    return sub_8002F44(win);
}

u8 sub_8004DB0(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top, u16 a6)
{
    register u32 val asm("r5") = (u8)((a6 >> 1) - (GetStringWidth(win, text) >> 1));
    left += (val >> 3);
    InitWindow(win, text, tileDataStartOffset, left, top);
    EraseAtCursor(win);
    sub_80048D8(win, val & 7, 0);
    return sub_8002F44(win);
}

u8 sub_8004E24(struct Window *win)
{
    return win->paletteNum;
}

void sub_8004E28(struct Window *win, u8 *foreground, u8 *background, u8 *shadow)
{
    *foreground = win->foregroundColor;
    *background = win->backgroundColor;
    *shadow = win->shadowColor;
}

void sub_8004E3C(const struct WindowConfig *winConfig, u8 *tileData, const u8 *text)
{
    sTempWindow.config = winConfig;
    InitWindow(&sTempWindow, text, 0, 0, 0);
    sTempWindow.tileData = tileData;
    sub_8002F44(&sTempWindow);
}

u8 GetStringWidthGivenWindowConfig(const struct WindowConfig *winConfig, const u8 *s)
{
    sTempWindow.config = winConfig;
    InitWindow(&sTempWindow, s, 0, 0, 0);
    return GetStringWidth(&sTempWindow, s);
}

void ConvertInternationalString(u8 *s, u8 language)
{
    if (language == LANGUAGE_JAPANESE)
    {
        u8 i;

        StripExtCtrlCodes(s);
        i = StringLength(s);
        s[i++] = 0xFC;
        s[i++] = 22;
        s[i++] = 0xFF;

        i--;

        while (i != (u8)-1)
        {
            s[i + 2] = s[i];
            i--;
        }

        s[0] = 0xFC;
        s[1] = 21;
    }
}

void StripExtCtrlCodes(u8 *str)
{
    u16 srcIndex = 0;
    u16 destIndex = 0;
    while (str[srcIndex] != 0xFF)
    {
        if (str[srcIndex] == 0xFC)
        {
            srcIndex++;
            srcIndex += GetExtCtrlCodeLength(str[srcIndex]);
        }
        else
        {
            str[destIndex++] = str[srcIndex++];
        }
    }
    str[destIndex] = 0xFF;
}

static const u8 *SkipExtCtrlCode(const u8 *s)
{
    while (*s == 0xFC)
    {
        s++;
        s += GetExtCtrlCodeLength(*s);
    }

    return s;
}

s32 StringCompareWithoutExtCtrlCodes(const u8 *str1, const u8 *str2)
{
    s32 retVal = 0;

    while (1)
    {
        str1 = SkipExtCtrlCode(str1);
        str2 = SkipExtCtrlCode(str2);

        if (*str1 > *str2)
            break;

        if (*str1 < *str2)
        {
            retVal = -1;
            if (*str2 == 0xFF)
                retVal = 1;
        }

        if (*str1 == 0xFF)
            return retVal;

        str1++;
        str2++;
    }

    retVal = 1;

    if (*str1 == 0xFF)
        retVal = -1;

    return retVal;
}

u8 sub_8004FD0(struct Window *win, u8 *dest, const u8 *src, u16 tileDataStartOffset, u8 left, u16 top, u8 width, u32 a8)
{
    u8 newlineCount = 0;
    u8 extCtrlCodeLength;
    u8 *start;
    u32 endsWithoutNewline;

    if (dest == ((void *)0))
        dest = gStringVar4;

    start = dest;
    endsWithoutNewline = 0;

    while (*src != 0xFF)
    {
        switch (*src)
        {
        default:
            *dest = *src;
            dest++;
            src++;
            endsWithoutNewline = 1;
            break;
        case 0xFC:
            extCtrlCodeLength = GetExtCtrlCodeLength(src[1]) + 1;
            memcpy(dest, src, extCtrlCodeLength);
            dest += extCtrlCodeLength;
            src += extCtrlCodeLength;
            break;
        case 0xFE:
            dest[0] = 0xFC;
            dest[1] = 19;
            dest[2] = width;
            dest[3] = 0xFE;
            dest += 4;
            src++;
            newlineCount++;
            endsWithoutNewline = 0;
            break;
        }
    }

    dest[0] = 0xFC;
    dest[1] = 19;
    dest[2] = width;
    dest[3] = 0xFF;

    if (endsWithoutNewline)
        newlineCount++;

    sub_8002E4C(win, start, tileDataStartOffset, left, top, a8);
    sub_8002F44(win);

    return newlineCount;
}

static s32 DrawGlyphTile_UnshadowedFont(struct GlyphTileInfo *glyphTileInfo)
{
    struct GlyphBuffer *glyphBuffer = &sGlyphBuffer;
    u32 colors[2];
    u32 *buffer = glyphTileInfo->dest;
    const u32 *masks = sGlyphMasks[glyphTileInfo->width][glyphTileInfo->startPixel];
    u32 mask1 = masks[0] | masks[2];

    glyphBuffer->pixelRows[0] = buffer[0] & mask1;
    glyphBuffer->pixelRows[1] = buffer[1] & mask1;
    glyphBuffer->pixelRows[2] = buffer[2] & mask1;
    glyphBuffer->pixelRows[3] = buffer[3] & mask1;
    glyphBuffer->pixelRows[4] = buffer[4] & mask1;
    glyphBuffer->pixelRows[5] = buffer[5] & mask1;
    glyphBuffer->pixelRows[6] = buffer[6] & mask1;
    glyphBuffer->pixelRows[7] = buffer[7] & mask1;

    if (glyphTileInfo->startPixel + glyphTileInfo->width > 8)
    {
        u32 mask2 = masks[1];
        if (glyphTileInfo->textMode == 2)
        {
            glyphBuffer->pixelRows[8] = buffer[8] & mask2;
            glyphBuffer->pixelRows[9] = buffer[9] & mask2;
            glyphBuffer->pixelRows[10] = buffer[10] & mask2;
            glyphBuffer->pixelRows[11] = buffer[11] & mask2;
            glyphBuffer->pixelRows[12] = buffer[12] & mask2;
            glyphBuffer->pixelRows[13] = buffer[13] & mask2;
            glyphBuffer->pixelRows[14] = buffer[14] & mask2;
            glyphBuffer->pixelRows[15] = buffer[15] & mask2;
        }
        else
        {
            glyphBuffer->pixelRows[8] = buffer[16] & mask2;
            glyphBuffer->pixelRows[9] = buffer[17] & mask2;
            glyphBuffer->pixelRows[10] = buffer[18] & mask2;
            glyphBuffer->pixelRows[11] = buffer[19] & mask2;
            glyphBuffer->pixelRows[12] = buffer[20] & mask2;
            glyphBuffer->pixelRows[13] = buffer[21] & mask2;
            glyphBuffer->pixelRows[14] = buffer[22] & mask2;
            glyphBuffer->pixelRows[15] = buffer[23] & mask2;
        }
    }

    colors[0] = glyphTileInfo->colors[0];
    colors[1] = glyphTileInfo->colors[15];

    sShiftGlyphTileUnshadowedFuncs[glyphTileInfo->width](glyphBuffer, glyphTileInfo->src, colors, glyphTileInfo->startPixel);

    buffer[0] = glyphBuffer->pixelRows[0];
    buffer[1] = glyphBuffer->pixelRows[1];
    buffer[2] = glyphBuffer->pixelRows[2];
    buffer[3] = glyphBuffer->pixelRows[3];
    buffer[4] = glyphBuffer->pixelRows[4];
    buffer[5] = glyphBuffer->pixelRows[5];
    buffer[6] = glyphBuffer->pixelRows[6];
    buffer[7] = glyphBuffer->pixelRows[7];

    if (glyphTileInfo->startPixel + glyphTileInfo->width > 8)
    {
        if (glyphTileInfo->textMode != 2)
            buffer += 8;
        buffer[8] = glyphBuffer->pixelRows[8];
        buffer[9] = glyphBuffer->pixelRows[9];
        buffer[10] = glyphBuffer->pixelRows[10];
        buffer[11] = glyphBuffer->pixelRows[11];
        buffer[12] = glyphBuffer->pixelRows[12];
        buffer[13] = glyphBuffer->pixelRows[13];
        buffer[14] = glyphBuffer->pixelRows[14];
        buffer[15] = glyphBuffer->pixelRows[15];
    }

    return (glyphTileInfo->startPixel + glyphTileInfo->width) / 8;
}

static void ShiftGlyphTile_UnshadowedFont_Width0(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *a3, u8 startPixel)
{
}

static void ShiftGlyphTile_UnshadowedFont_Width1(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = colors[src[i] >> 7];
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width2(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] << 0)
                | (colors[(src[i] >> 6) & 1] << 4);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width3(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {

        u32 val = (colors[(src[i] >> 7) & 1] << 0)
                | (colors[(src[i] >> 6) & 1] << 4)
                | (colors[(src[i] >> 5) & 1] << 8)
                | (colors[(src[i] >> 4) & 1] << 12);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width4(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] << 0)
                | (colors[(src[i] >> 6) & 1] << 4)
                | (colors[(src[i] >> 5) & 1] << 8)
                | (colors[(src[i] >> 4) & 1] << 12);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width5(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] << 0)
                | (colors[(src[i] >> 6) & 1] << 4)
                | (colors[(src[i] >> 5) & 1] << 8)
                | (colors[(src[i] >> 4) & 1] << 12)
                | (colors[(src[i] >> 3) & 1] << 16);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width6(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] << 0)
                | (colors[(src[i] >> 6) & 1] << 4)
                | (colors[(src[i] >> 5) & 1] << 8)
                | (colors[(src[i] >> 4) & 1] << 12)
                | (colors[(src[i] >> 3) & 1] << 16)
                | (colors[(src[i] >> 2) & 1] << 20);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width7(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] << 0)
                | (colors[(src[i] >> 6) & 1] << 4)
                | (colors[(src[i] >> 5) & 1] << 8)
                | (colors[(src[i] >> 4) & 1] << 12)
                | (colors[(src[i] >> 3) & 1] << 16)
                | (colors[(src[i] >> 2) & 1] << 20)
                | (colors[(src[i] >> 1) & 1] << 24);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width8(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] << 0)
                | (colors[(src[i] >> 6) & 1] << 4)
                | (colors[(src[i] >> 5) & 1] << 8)
                | (colors[(src[i] >> 4) & 1] << 12)
                | (colors[(src[i] >> 3) & 1] << 16)
                | (colors[(src[i] >> 2) & 1] << 20)
                | (colors[(src[i] >> 1) & 1] << 24)
                | (colors[(src[i] >> 0) & 1] << 28);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static s32 DrawGlyphTile_ShadowedFont(struct GlyphTileInfo *glyphTileInfo)
{
    struct GlyphBuffer *glyphBuffer = &sGlyphBuffer;
    u32 *buffer = glyphTileInfo->dest;
    const u32 *masks = sGlyphMasks[glyphTileInfo->width][glyphTileInfo->startPixel];
    u32 mask1 = masks[0] | masks[2];

    glyphBuffer->pixelRows[0] = buffer[0] & mask1;
    glyphBuffer->pixelRows[1] = buffer[1] & mask1;
    glyphBuffer->pixelRows[2] = buffer[2] & mask1;
    glyphBuffer->pixelRows[3] = buffer[3] & mask1;
    glyphBuffer->pixelRows[4] = buffer[4] & mask1;
    glyphBuffer->pixelRows[5] = buffer[5] & mask1;
    glyphBuffer->pixelRows[6] = buffer[6] & mask1;
    glyphBuffer->pixelRows[7] = buffer[7] & mask1;

    if (glyphTileInfo->startPixel + glyphTileInfo->width > 8)
    {
        u32 mask2 = masks[1];
        if (glyphTileInfo->textMode == 2)
        {
            glyphBuffer->pixelRows[8] = buffer[8] & mask2;
            glyphBuffer->pixelRows[9] = buffer[9] & mask2;
            glyphBuffer->pixelRows[10] = buffer[10] & mask2;
            glyphBuffer->pixelRows[11] = buffer[11] & mask2;
            glyphBuffer->pixelRows[12] = buffer[12] & mask2;
            glyphBuffer->pixelRows[13] = buffer[13] & mask2;
            glyphBuffer->pixelRows[14] = buffer[14] & mask2;
            glyphBuffer->pixelRows[15] = buffer[15] & mask2;
        }
        else
        {
            glyphBuffer->pixelRows[8] = buffer[16] & mask2;
            glyphBuffer->pixelRows[9] = buffer[17] & mask2;
            glyphBuffer->pixelRows[10] = buffer[18] & mask2;
            glyphBuffer->pixelRows[11] = buffer[19] & mask2;
            glyphBuffer->pixelRows[12] = buffer[20] & mask2;
            glyphBuffer->pixelRows[13] = buffer[21] & mask2;
            glyphBuffer->pixelRows[14] = buffer[22] & mask2;
            glyphBuffer->pixelRows[15] = buffer[23] & mask2;
        }
    }

    sShiftGlyphTileShadowedFuncs[glyphTileInfo->width](glyphBuffer, (u32 *)glyphTileInfo->src, glyphTileInfo->colors, glyphTileInfo->startPixel);

    buffer[0] = glyphBuffer->pixelRows[0];
    buffer[1] = glyphBuffer->pixelRows[1];
    buffer[2] = glyphBuffer->pixelRows[2];
    buffer[3] = glyphBuffer->pixelRows[3];
    buffer[4] = glyphBuffer->pixelRows[4];
    buffer[5] = glyphBuffer->pixelRows[5];
    buffer[6] = glyphBuffer->pixelRows[6];
    buffer[7] = glyphBuffer->pixelRows[7];

    if (glyphTileInfo->startPixel + glyphTileInfo->width > 8)
    {
        if (glyphTileInfo->textMode != 2)
            buffer += 8;
        buffer[8] = glyphBuffer->pixelRows[8];
        buffer[9] = glyphBuffer->pixelRows[9];
        buffer[10] = glyphBuffer->pixelRows[10];
        buffer[11] = glyphBuffer->pixelRows[11];
        buffer[12] = glyphBuffer->pixelRows[12];
        buffer[13] = glyphBuffer->pixelRows[13];
        buffer[14] = glyphBuffer->pixelRows[14];
        buffer[15] = glyphBuffer->pixelRows[15];
    }

    return (glyphTileInfo->startPixel + glyphTileInfo->width) / 8;
}

static void ShiftGlyphTile_ShadowedFont_Width0(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
}

static void ShiftGlyphTile_ShadowedFont_Width1(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = colors[src[i] & 0xF];
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_ShadowedFont_Width2(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 0) & 0xF] << 0)
                | (colors[(src[i] >> 4) & 0xF] << 4);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_ShadowedFont_Width3(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 0) & 0xF] << 0)
                | (colors[(src[i] >> 4) & 0xF] << 4)
                | (colors[(src[i] >> 8) & 0xF] << 8);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_ShadowedFont_Width4(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 0) & 0xF] << 0)
                | (colors[(src[i] >> 4) & 0xF] << 4)
                | (colors[(src[i] >> 8) & 0xF] << 8)
                | (colors[(src[i] >> 12) & 0xF] << 12);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}
# 4278 "src/engine/text.c"
static void ShiftGlyphTile_ShadowedFont_Width5(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u32 val;
    val = (colors[(src[0] >> 0) & 0xF] << 0) | (colors[(src[0] >> 4) & 0xF] << 4) | (colors[(src[0] >> 8) & 0xF] << 8) | (colors[(src[0] >> 12) & 0xF] << 12) | (colors[(src[0] >> 16) & 0xF] << 16); glyphBuffer->pixelRows[0] |= val << shiftAmount->left; glyphBuffer->pixelRows[0 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[1] >> 0) & 0xF] << 0) | (colors[(src[1] >> 4) & 0xF] << 4) | (colors[(src[1] >> 8) & 0xF] << 8) | (colors[(src[1] >> 12) & 0xF] << 12) | (colors[(src[1] >> 16) & 0xF] << 16); glyphBuffer->pixelRows[1] |= val << shiftAmount->left; glyphBuffer->pixelRows[1 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[2] >> 0) & 0xF] << 0) | (colors[(src[2] >> 4) & 0xF] << 4) | (colors[(src[2] >> 8) & 0xF] << 8) | (colors[(src[2] >> 12) & 0xF] << 12) | (colors[(src[2] >> 16) & 0xF] << 16); glyphBuffer->pixelRows[2] |= val << shiftAmount->left; glyphBuffer->pixelRows[2 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[3] >> 0) & 0xF] << 0) | (colors[(src[3] >> 4) & 0xF] << 4) | (colors[(src[3] >> 8) & 0xF] << 8) | (colors[(src[3] >> 12) & 0xF] << 12) | (colors[(src[3] >> 16) & 0xF] << 16); glyphBuffer->pixelRows[3] |= val << shiftAmount->left; glyphBuffer->pixelRows[3 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[4] >> 0) & 0xF] << 0) | (colors[(src[4] >> 4) & 0xF] << 4) | (colors[(src[4] >> 8) & 0xF] << 8) | (colors[(src[4] >> 12) & 0xF] << 12) | (colors[(src[4] >> 16) & 0xF] << 16); glyphBuffer->pixelRows[4] |= val << shiftAmount->left; glyphBuffer->pixelRows[4 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[5] >> 0) & 0xF] << 0) | (colors[(src[5] >> 4) & 0xF] << 4) | (colors[(src[5] >> 8) & 0xF] << 8) | (colors[(src[5] >> 12) & 0xF] << 12) | (colors[(src[5] >> 16) & 0xF] << 16); glyphBuffer->pixelRows[5] |= val << shiftAmount->left; glyphBuffer->pixelRows[5 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[6] >> 0) & 0xF] << 0) | (colors[(src[6] >> 4) & 0xF] << 4) | (colors[(src[6] >> 8) & 0xF] << 8) | (colors[(src[6] >> 12) & 0xF] << 12) | (colors[(src[6] >> 16) & 0xF] << 16); glyphBuffer->pixelRows[6] |= val << shiftAmount->left; glyphBuffer->pixelRows[6 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[7] >> 0) & 0xF] << 0) | (colors[(src[7] >> 4) & 0xF] << 4) | (colors[(src[7] >> 8) & 0xF] << 8) | (colors[(src[7] >> 12) & 0xF] << 12) | (colors[(src[7] >> 16) & 0xF] << 16); glyphBuffer->pixelRows[7] |= val << shiftAmount->left; glyphBuffer->pixelRows[7 + 8] |= val >> shiftAmount->right;
}
# 4302 "src/engine/text.c"
static void ShiftGlyphTile_ShadowedFont_Width6(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u32 val;
    val = (colors[(src[0] >> 0) & 0xF] << 0) | (colors[(src[0] >> 4) & 0xF] << 4) | (colors[(src[0] >> 8) & 0xF] << 8) | (colors[(src[0] >> 12) & 0xF] << 12) | (colors[(src[0] >> 16) & 0xF] << 16) | (colors[(src[0] >> 20) & 0xF] << 20); glyphBuffer->pixelRows[0] |= val << shiftAmount->left; glyphBuffer->pixelRows[0 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[1] >> 0) & 0xF] << 0) | (colors[(src[1] >> 4) & 0xF] << 4) | (colors[(src[1] >> 8) & 0xF] << 8) | (colors[(src[1] >> 12) & 0xF] << 12) | (colors[(src[1] >> 16) & 0xF] << 16) | (colors[(src[1] >> 20) & 0xF] << 20); glyphBuffer->pixelRows[1] |= val << shiftAmount->left; glyphBuffer->pixelRows[1 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[2] >> 0) & 0xF] << 0) | (colors[(src[2] >> 4) & 0xF] << 4) | (colors[(src[2] >> 8) & 0xF] << 8) | (colors[(src[2] >> 12) & 0xF] << 12) | (colors[(src[2] >> 16) & 0xF] << 16) | (colors[(src[2] >> 20) & 0xF] << 20); glyphBuffer->pixelRows[2] |= val << shiftAmount->left; glyphBuffer->pixelRows[2 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[3] >> 0) & 0xF] << 0) | (colors[(src[3] >> 4) & 0xF] << 4) | (colors[(src[3] >> 8) & 0xF] << 8) | (colors[(src[3] >> 12) & 0xF] << 12) | (colors[(src[3] >> 16) & 0xF] << 16) | (colors[(src[3] >> 20) & 0xF] << 20); glyphBuffer->pixelRows[3] |= val << shiftAmount->left; glyphBuffer->pixelRows[3 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[4] >> 0) & 0xF] << 0) | (colors[(src[4] >> 4) & 0xF] << 4) | (colors[(src[4] >> 8) & 0xF] << 8) | (colors[(src[4] >> 12) & 0xF] << 12) | (colors[(src[4] >> 16) & 0xF] << 16) | (colors[(src[4] >> 20) & 0xF] << 20); glyphBuffer->pixelRows[4] |= val << shiftAmount->left; glyphBuffer->pixelRows[4 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[5] >> 0) & 0xF] << 0) | (colors[(src[5] >> 4) & 0xF] << 4) | (colors[(src[5] >> 8) & 0xF] << 8) | (colors[(src[5] >> 12) & 0xF] << 12) | (colors[(src[5] >> 16) & 0xF] << 16) | (colors[(src[5] >> 20) & 0xF] << 20); glyphBuffer->pixelRows[5] |= val << shiftAmount->left; glyphBuffer->pixelRows[5 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[6] >> 0) & 0xF] << 0) | (colors[(src[6] >> 4) & 0xF] << 4) | (colors[(src[6] >> 8) & 0xF] << 8) | (colors[(src[6] >> 12) & 0xF] << 12) | (colors[(src[6] >> 16) & 0xF] << 16) | (colors[(src[6] >> 20) & 0xF] << 20); glyphBuffer->pixelRows[6] |= val << shiftAmount->left; glyphBuffer->pixelRows[6 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[7] >> 0) & 0xF] << 0) | (colors[(src[7] >> 4) & 0xF] << 4) | (colors[(src[7] >> 8) & 0xF] << 8) | (colors[(src[7] >> 12) & 0xF] << 12) | (colors[(src[7] >> 16) & 0xF] << 16) | (colors[(src[7] >> 20) & 0xF] << 20); glyphBuffer->pixelRows[7] |= val << shiftAmount->left; glyphBuffer->pixelRows[7 + 8] |= val >> shiftAmount->right;
}
# 4327 "src/engine/text.c"
static void ShiftGlyphTile_ShadowedFont_Width7(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u32 val;
    val = (colors[(src[0] >> 0) & 0xF] << 0) | (colors[(src[0] >> 4) & 0xF] << 4) | (colors[(src[0] >> 8) & 0xF] << 8) | (colors[(src[0] >> 12) & 0xF] << 12) | (colors[(src[0] >> 16) & 0xF] << 16) | (colors[(src[0] >> 20) & 0xF] << 20) | (colors[(src[0] >> 24) & 0xF] << 24); glyphBuffer->pixelRows[0] |= val << shiftAmount->left; glyphBuffer->pixelRows[0 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[1] >> 0) & 0xF] << 0) | (colors[(src[1] >> 4) & 0xF] << 4) | (colors[(src[1] >> 8) & 0xF] << 8) | (colors[(src[1] >> 12) & 0xF] << 12) | (colors[(src[1] >> 16) & 0xF] << 16) | (colors[(src[1] >> 20) & 0xF] << 20) | (colors[(src[1] >> 24) & 0xF] << 24); glyphBuffer->pixelRows[1] |= val << shiftAmount->left; glyphBuffer->pixelRows[1 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[2] >> 0) & 0xF] << 0) | (colors[(src[2] >> 4) & 0xF] << 4) | (colors[(src[2] >> 8) & 0xF] << 8) | (colors[(src[2] >> 12) & 0xF] << 12) | (colors[(src[2] >> 16) & 0xF] << 16) | (colors[(src[2] >> 20) & 0xF] << 20) | (colors[(src[2] >> 24) & 0xF] << 24); glyphBuffer->pixelRows[2] |= val << shiftAmount->left; glyphBuffer->pixelRows[2 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[3] >> 0) & 0xF] << 0) | (colors[(src[3] >> 4) & 0xF] << 4) | (colors[(src[3] >> 8) & 0xF] << 8) | (colors[(src[3] >> 12) & 0xF] << 12) | (colors[(src[3] >> 16) & 0xF] << 16) | (colors[(src[3] >> 20) & 0xF] << 20) | (colors[(src[3] >> 24) & 0xF] << 24); glyphBuffer->pixelRows[3] |= val << shiftAmount->left; glyphBuffer->pixelRows[3 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[4] >> 0) & 0xF] << 0) | (colors[(src[4] >> 4) & 0xF] << 4) | (colors[(src[4] >> 8) & 0xF] << 8) | (colors[(src[4] >> 12) & 0xF] << 12) | (colors[(src[4] >> 16) & 0xF] << 16) | (colors[(src[4] >> 20) & 0xF] << 20) | (colors[(src[4] >> 24) & 0xF] << 24); glyphBuffer->pixelRows[4] |= val << shiftAmount->left; glyphBuffer->pixelRows[4 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[5] >> 0) & 0xF] << 0) | (colors[(src[5] >> 4) & 0xF] << 4) | (colors[(src[5] >> 8) & 0xF] << 8) | (colors[(src[5] >> 12) & 0xF] << 12) | (colors[(src[5] >> 16) & 0xF] << 16) | (colors[(src[5] >> 20) & 0xF] << 20) | (colors[(src[5] >> 24) & 0xF] << 24); glyphBuffer->pixelRows[5] |= val << shiftAmount->left; glyphBuffer->pixelRows[5 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[6] >> 0) & 0xF] << 0) | (colors[(src[6] >> 4) & 0xF] << 4) | (colors[(src[6] >> 8) & 0xF] << 8) | (colors[(src[6] >> 12) & 0xF] << 12) | (colors[(src[6] >> 16) & 0xF] << 16) | (colors[(src[6] >> 20) & 0xF] << 20) | (colors[(src[6] >> 24) & 0xF] << 24); glyphBuffer->pixelRows[6] |= val << shiftAmount->left; glyphBuffer->pixelRows[6 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[7] >> 0) & 0xF] << 0) | (colors[(src[7] >> 4) & 0xF] << 4) | (colors[(src[7] >> 8) & 0xF] << 8) | (colors[(src[7] >> 12) & 0xF] << 12) | (colors[(src[7] >> 16) & 0xF] << 16) | (colors[(src[7] >> 20) & 0xF] << 20) | (colors[(src[7] >> 24) & 0xF] << 24); glyphBuffer->pixelRows[7] |= val << shiftAmount->left; glyphBuffer->pixelRows[7 + 8] |= val >> shiftAmount->right;
}
# 4353 "src/engine/text.c"
static void ShiftGlyphTile_ShadowedFont_Width8(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u32 val;
    val = (colors[(src[0] >> 0) & 0xF] << 0) | (colors[(src[0] >> 4) & 0xF] << 4) | (colors[(src[0] >> 8) & 0xF] << 8) | (colors[(src[0] >> 12) & 0xF] << 12) | (colors[(src[0] >> 16) & 0xF] << 16) | (colors[(src[0] >> 20) & 0xF] << 20) | (colors[(src[0] >> 24) & 0xF] << 24) | (colors[(src[0] >> 28) ] << 28); glyphBuffer->pixelRows[0] |= val << shiftAmount->left; glyphBuffer->pixelRows[0 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[1] >> 0) & 0xF] << 0) | (colors[(src[1] >> 4) & 0xF] << 4) | (colors[(src[1] >> 8) & 0xF] << 8) | (colors[(src[1] >> 12) & 0xF] << 12) | (colors[(src[1] >> 16) & 0xF] << 16) | (colors[(src[1] >> 20) & 0xF] << 20) | (colors[(src[1] >> 24) & 0xF] << 24) | (colors[(src[1] >> 28) ] << 28); glyphBuffer->pixelRows[1] |= val << shiftAmount->left; glyphBuffer->pixelRows[1 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[2] >> 0) & 0xF] << 0) | (colors[(src[2] >> 4) & 0xF] << 4) | (colors[(src[2] >> 8) & 0xF] << 8) | (colors[(src[2] >> 12) & 0xF] << 12) | (colors[(src[2] >> 16) & 0xF] << 16) | (colors[(src[2] >> 20) & 0xF] << 20) | (colors[(src[2] >> 24) & 0xF] << 24) | (colors[(src[2] >> 28) ] << 28); glyphBuffer->pixelRows[2] |= val << shiftAmount->left; glyphBuffer->pixelRows[2 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[3] >> 0) & 0xF] << 0) | (colors[(src[3] >> 4) & 0xF] << 4) | (colors[(src[3] >> 8) & 0xF] << 8) | (colors[(src[3] >> 12) & 0xF] << 12) | (colors[(src[3] >> 16) & 0xF] << 16) | (colors[(src[3] >> 20) & 0xF] << 20) | (colors[(src[3] >> 24) & 0xF] << 24) | (colors[(src[3] >> 28) ] << 28); glyphBuffer->pixelRows[3] |= val << shiftAmount->left; glyphBuffer->pixelRows[3 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[4] >> 0) & 0xF] << 0) | (colors[(src[4] >> 4) & 0xF] << 4) | (colors[(src[4] >> 8) & 0xF] << 8) | (colors[(src[4] >> 12) & 0xF] << 12) | (colors[(src[4] >> 16) & 0xF] << 16) | (colors[(src[4] >> 20) & 0xF] << 20) | (colors[(src[4] >> 24) & 0xF] << 24) | (colors[(src[4] >> 28) ] << 28); glyphBuffer->pixelRows[4] |= val << shiftAmount->left; glyphBuffer->pixelRows[4 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[5] >> 0) & 0xF] << 0) | (colors[(src[5] >> 4) & 0xF] << 4) | (colors[(src[5] >> 8) & 0xF] << 8) | (colors[(src[5] >> 12) & 0xF] << 12) | (colors[(src[5] >> 16) & 0xF] << 16) | (colors[(src[5] >> 20) & 0xF] << 20) | (colors[(src[5] >> 24) & 0xF] << 24) | (colors[(src[5] >> 28) ] << 28); glyphBuffer->pixelRows[5] |= val << shiftAmount->left; glyphBuffer->pixelRows[5 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[6] >> 0) & 0xF] << 0) | (colors[(src[6] >> 4) & 0xF] << 4) | (colors[(src[6] >> 8) & 0xF] << 8) | (colors[(src[6] >> 12) & 0xF] << 12) | (colors[(src[6] >> 16) & 0xF] << 16) | (colors[(src[6] >> 20) & 0xF] << 20) | (colors[(src[6] >> 24) & 0xF] << 24) | (colors[(src[6] >> 28) ] << 28); glyphBuffer->pixelRows[6] |= val << shiftAmount->left; glyphBuffer->pixelRows[6 + 8] |= val >> shiftAmount->right;
    val = (colors[(src[7] >> 0) & 0xF] << 0) | (colors[(src[7] >> 4) & 0xF] << 4) | (colors[(src[7] >> 8) & 0xF] << 8) | (colors[(src[7] >> 12) & 0xF] << 12) | (colors[(src[7] >> 16) & 0xF] << 16) | (colors[(src[7] >> 20) & 0xF] << 20) | (colors[(src[7] >> 24) & 0xF] << 24) | (colors[(src[7] >> 28) ] << 28); glyphBuffer->pixelRows[7] |= val << shiftAmount->left; glyphBuffer->pixelRows[7 + 8] |= val >> shiftAmount->right;
}

static s32 DrawGlyphTiles(struct Window *win, u32 glyph, u32 glyphWidth)
{
    struct GlyphTileInfo glyphTileInfo;
    u8 *upperTile, *lowerTile;
 u16 koreanGlyph;
    s32 retVal = 0;

 glyphTileInfo.textMode = win->textMode;
 glyphTileInfo.colors = sGlyphBuffer.colors;
 glyphTileInfo.startPixel = (win->left + win->cursorX) & 7;

 if ((glyph >= 0x37 && glyph <= 0x41) || glyph == 0xF9)
 {
  koreanGlyph = (glyph << 8) + win->text[win->textIndex];
  win->textIndex++;

  glyphTileInfo.width = 8;

  if (glyph == 0xF9)
  {
   switch (koreanGlyph)
   {
   case 0xF900:

    koreanGlyph = (gHavingJong == 0) ? 0x38AB : 0x3D60;
    break;
   case 0xF901:

    koreanGlyph = (gHavingJong == 0) ? 0x3A29 : 0x3D61;
    break;
   case 0xF902:

    if (gHavingJong == 0)
    {
     return -1;
    } else
    {
     koreanGlyph = 0x3D5E;
    }
    break;
   case 0xF903:

    koreanGlyph = (gHavingJong == 0) ? 0x3701 : 0x3D72;
    break;
   case 0xF904:

    koreanGlyph = (gHavingJong == 0) ? 0x3CB8 : 0x3C9F;
    break;
   case 0xF905:

    koreanGlyph = (gHavingJong == 0) ? 0x3D15 : 0x375A;
    break;
   case 0xF906:

    if (gHavingJong == 0)
     return -1;
    else
     koreanGlyph = 0x3D72;
    break;
   }
  }


  if (koreanGlyph >= 0x4101 && koreanGlyph <= 0x4128)
   gHavingJong = 0;
  else
   gHavingJong = isHavingJong(koreanGlyph);

  koreanGlyph -= 0x3700;


  switch (win->fontNum)
  {
  case 1:
  case 2:
  case 3:
   if (gCustomFont == 0)
   {

    glyphTileInfo.src = (u8 *)gFont3KoreanGlyphs + 0x80 * koreanGlyph;
    glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 0));
    DrawGlyphTile_ShadowedFont(&glyphTileInfo);
    glyphTileInfo.src += 0x20;
    glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
    retVal = DrawGlyphTile_ShadowedFont(&glyphTileInfo);

    UpdateTilemap(win, retVal);
    AddToCursorX(win, 8);

    glyphTileInfo.startPixel = (win->left + win->cursorX) & 7;
    glyphTileInfo.width = 3;

    glyphTileInfo.src = (u8 *)gFont3KoreanGlyphs + 0x80 * koreanGlyph + 0x40;
    glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 0));
    DrawGlyphTile_ShadowedFont(&glyphTileInfo);
    glyphTileInfo.src += 0x20;
    glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
    retVal = DrawGlyphTile_ShadowedFont(&glyphTileInfo);
   } else if (gCustomFont == 2)
   {

    glyphTileInfo.src = (u8 *)gFont3Korean3Glyphs + 0x80 * koreanGlyph;
    glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 0));
    DrawGlyphTile_ShadowedFont(&glyphTileInfo);
    glyphTileInfo.src += 0x20;
    glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
    retVal = DrawGlyphTile_ShadowedFont(&glyphTileInfo);

    UpdateTilemap(win, retVal);
    AddToCursorX(win, 8);

    glyphTileInfo.startPixel = (win->left + win->cursorX) & 7;
    glyphTileInfo.width = 1;

    glyphTileInfo.src = (u8 *)gFont3Korean3Glyphs + 0x80 * koreanGlyph + 0x40;
    glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 0));
    DrawGlyphTile_ShadowedFont(&glyphTileInfo);
    glyphTileInfo.src += 0x20;
    glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
    retVal = DrawGlyphTile_ShadowedFont(&glyphTileInfo);
   } else
   {

    glyphTileInfo.src = (u8 *)gFont3Korean2Glyphs + 0x40 * koreanGlyph;
    glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 0));
    DrawGlyphTile_ShadowedFont(&glyphTileInfo);
    glyphTileInfo.src += 0x20;
    glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
    retVal = DrawGlyphTile_ShadowedFont(&glyphTileInfo);
   }
   break;

  case 0:
  case 4:
  case 5:

   glyphTileInfo.src = (u8 *)gFont4KoreanGlyphs + 0x20 * koreanGlyph;
   glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
   retVal = DrawGlyphTile_ShadowedFont(&glyphTileInfo);
   break;
  }
 } else
 {

  GetGlyphTilePointers(win->fontNum, win->language, glyph, &upperTile, &lowerTile);
  glyphTileInfo.width = glyphWidth;
  glyphTileInfo.src = upperTile;
  glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 0));


  if (glyph == 0xA1 || glyph == 0xA2 || glyph == 0xA4 ||
      glyph == 0xA7 || glyph == 0xA8 || glyph == 0xA9)
   gHavingJong = 1;
  else
   gHavingJong = 0;

  switch (win->fontNum)
  {
  case 0:
  case 1:
  case 2:
   DrawGlyphTile_UnshadowedFont(&glyphTileInfo);
   glyphTileInfo.src = lowerTile;
   glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
   retVal = DrawGlyphTile_UnshadowedFont(&glyphTileInfo);
   break;
  case 3:
  case 4:
  case 5:
   DrawGlyphTile_ShadowedFont(&glyphTileInfo);
   glyphTileInfo.src = lowerTile;
   glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
   retVal = DrawGlyphTile_ShadowedFont(&glyphTileInfo);
   break;
  }
 }

    return retVal;
}

static void UpdateTilemap(struct Window *win, u32 tilesWidth)
{
    u16 *tilemap = GetCursorTilemapPointer(win);
    if (tilesWidth && tilemap)
    {
        u16 paletteNum = (win->paletteNum << 12);
        u16 upperLeftTileNum = GetCursorTileNum(win, 0, 0);
        u16 lowerLeftTileNum = GetCursorTileNum(win, 0, 1);


  if ((tilemap[0] == 0xE260 || tilemap[32] == 0xE260) ||
   (tilemap[0] == 0x1027 || tilemap[32] == 0x1027))
   return;

        tilemap[0] = upperLeftTileNum | paletteNum;
        tilemap[32] = lowerLeftTileNum | paletteNum;
        if (tilesWidth == 2)
        {
            u16 upperRightTileNum = GetCursorTileNum(win, 1, 0);
            u16 lowerRightTileNum = GetCursorTileNum(win, 1, 1);
            tilemap[1] = upperRightTileNum | paletteNum;
            tilemap[33] = lowerRightTileNum | paletteNum;
        }
    }
}

static u16 GetCursorTileNum(struct Window *win, u32 xOffset, u32 yOffset)
{
    u16 index;

    if (win->textMode == 2)
        index = win->tileDataStartOffset
              + win->tileDataOffset
              + (((win->top + win->cursorY) >> 3) + yOffset) * win->width
              + (((win->left + win->cursorX) >> 3) + xOffset);
    else
        index = win->tileDataStartOffset + win->tileDataOffset + 2 * xOffset + yOffset;

    return index;
}

void SetCustomFont(u8 num)
{
 gCustomFont = num;
}
