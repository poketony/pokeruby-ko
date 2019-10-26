# 1 "src/battle/battle_transition.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/battle/battle_transition.c"
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
# 2 "src/battle/battle_transition.c" 2
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
# 3 "src/battle/battle_transition.c" 2
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
# 4 "src/battle/battle_transition.c" 2
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
# 5 "src/battle/battle_transition.c" 2
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
# 6 "src/battle/battle_transition.c" 2
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
# 7 "src/battle/battle_transition.c" 2
# 1 "include/trig.h" 1



extern const s16 gSineTable[];

s16 Sin(s16 index, s16 amplitude);
s16 Cos(s16 index, s16 amplitude);
s16 Sin2(u16 angle);
s16 Cos2(u16 angle);
# 8 "src/battle/battle_transition.c" 2
# 1 "include/field_effect.h" 1




# 1 "include/task.h" 1
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
# 9 "src/battle/battle_transition.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 10 "src/battle/battle_transition.c" 2
# 1 "include/sprite.h" 1
# 11 "src/battle/battle_transition.c" 2
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
# 12 "src/battle/battle_transition.c" 2
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
# 13 "src/battle/battle_transition.c" 2
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
# 14 "src/battle/battle_transition.c" 2
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
# 15 "src/battle/battle_transition.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 16 "src/battle/battle_transition.c" 2
# 1 "include/unknown_task.h" 1



struct UnknownTaskStruct
{
    volatile void *dest;
    u32 control;
    u8 unk8;
    u8 unk9;
};

struct UnknownTaskStruct2
{
    void *src[2];
    volatile void *dest;
    u32 unkC;
    void (*unk10)(void);
    u8 srcBank;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 taskId;
    u8 filler19[0x7];
};

extern struct UnknownTaskStruct2 gUnknown_03004DC0;

extern u16 gUnknown_03004DE0[][0x3C0];

void remove_some_task(void);
void remove_some_task(void);
void dp12_8087EA4(void);
void dp12_8087EA4(void);


void sub_80895F8(struct UnknownTaskStruct unk);
void sub_8089668(void);
void sub_8089668();

u8 sub_8089944(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7);
# 17 "src/battle/battle_transition.c" 2

void sub_807DE10(void);
void dp12_8087EA4(void);

extern u16 gUnknown_03005560[];

extern const struct OamData gFieldOamData_32x32;

struct TransitionData
{
    vs8 VBlank_DMA;
    u16 WININ;
    u16 WINOUT;
    u16 field_6;
    u16 WIN0V;
    u16 field_A;
    u16 field_C;
    u16 BLDCNT;
    u16 BLDALPHA;
    u16 BLDY;
    s16 field_14;
    s16 field_16;
    s16 field_18;
    s16 field_1A;
    s16 field_1C;
    s16 field_1E;
    s16 field_20;
    s16 field_22;
    s16 data[11];
};

typedef bool8 (*TransitionState)(struct Task* task);
typedef bool8 (*TransitionSpriteCallback)(struct Sprite* sprite);


static void LaunchBattleTransitionTask(u8 transitionID);
static void Task_BattleTransitionMain(u8 taskID);
static void Phase1Task_TransitionAll(u8 taskID);
static void Phase2Task_Transition_Blur(u8 taskID);
static void Phase2Task_Transition_Swirl(u8 taskID);
static void Phase2Task_Transition_Shuffle(u8 taskID);
static void Phase2Task_Transition_BigPokeball(u8 taskID);
static void Phase2Task_Transition_PokeballsTrail(u8 taskID);
static void Phase2Task_Transition_Clockwise_BlackFade(u8 taskID);
static void Phase2Task_Transition_Ripple(u8 taskID);
static void Phase2Task_Transition_Wave(u8 taskID);
static void Phase2Task_Transition_Slice(u8 taskID);
static void Phase2Task_Transition_WhiteFade(u8 taskID);
static void Phase2Task_Transition_GridSquares(u8 taskID);
static void Phase2Task_Transition_Shards(u8 taskID);
static void Phase2Task_Transition_Sydney(u8 taskID);
static void Phase2Task_Transition_Phoebe(u8 taskID);
static void Phase2Task_Transition_Glacia(u8 taskID);
static void Phase2Task_Transition_Drake(u8 taskID);
static void Phase2Task_Transition_Steven(u8 taskID);
static bool8 Transition_Phase1(struct Task* task);
static bool8 Transition_WaitForPhase1(struct Task* task);
static bool8 Transition_Phase2(struct Task* task);
static bool8 Transition_WaitForPhase2(struct Task* task);
static void VBlankCB_Phase2_Transition_Swirl(void);
static void HBlankCB_Phase2_Transition_Swirl(void);
static void VBlankCB_Phase2_Transition_Shuffle(void);
static void HBlankCB_Phase2_Transition_Shuffle(void);
static void VBlankCB0_Phase2_Transition_BigPokeball(void);
static void VBlankCB1_Phase2_Transition_BigPokeball(void);
static void VBlankCB_Phase2_Transition_Clockwise_BlackFade(void);
static void VBlankCB_Phase2_Transition_Ripple(void);
static void HBlankCB_Phase2_Transition_Ripple(void);
static void VBlankCB_Phase2_Transition_Wave(void);
static void VBlankCB_Phase2_Transition_Slice(void);
static void HBlankCB_Phase2_Transition_Slice(void);
static void VBlankCB0_Phase2_Transition_WhiteFade(void);
static void VBlankCB1_Phase2_Transition_WhiteFade(void);
static void HBlankCB_Phase2_Transition_WhiteFade(void);
static void VBlankCB0_Phase2_Mugshots(void);
static void VBlankCB1_Phase2_Mugshots(void);
static void HBlankCB_Phase2_Mugshots(void);
static void VBlankCB_Phase2_Transition_Shards(void);
static bool8 Phase2_Transition_Blur_Func1(struct Task* task);
static bool8 Phase2_Transition_Blur_Func2(struct Task* task);
static bool8 Phase2_Transition_Blur_Func3(struct Task* task);
static bool8 Phase2_Transition_Swirl_Func1(struct Task* task);
static bool8 Phase2_Transition_Swirl_Func2(struct Task* task);
static bool8 Phase2_Transition_Shuffle_Func1(struct Task* task);
static bool8 Phase2_Transition_Shuffle_Func2(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func1(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func2(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func3(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func4(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func5(struct Task* task);
static bool8 Phase2_Transition_BigPokeball_Func6(struct Task* task);
static bool8 Phase2_Transition_PokeballsTrail_Func1(struct Task* task);
static bool8 Phase2_Transition_PokeballsTrail_Func2(struct Task* task);
static bool8 Phase2_Transition_PokeballsTrail_Func3(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func1(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func2(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func3(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func4(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func5(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func6(struct Task* task);
static bool8 Phase2_Transition_Clockwise_BlackFade_Func7(struct Task* task);
static bool8 Phase2_Transition_Ripple_Func1(struct Task* task);
static bool8 Phase2_Transition_Ripple_Func2(struct Task* task);
static bool8 Phase2_Transition_Wave_Func1(struct Task* task);
static bool8 Phase2_Transition_Wave_Func2(struct Task* task);
static bool8 Phase2_Transition_Wave_Func3(struct Task* task);
static bool8 Phase2_Transition_Slice_Func1(struct Task* task);
static bool8 Phase2_Transition_Slice_Func2(struct Task* task);
static bool8 Phase2_Transition_Slice_Func3(struct Task* task);
static bool8 Phase2_Transition_WhiteFade_Func1(struct Task* task);
static bool8 Phase2_Transition_WhiteFade_Func2(struct Task* task);
static bool8 Phase2_Transition_WhiteFade_Func3(struct Task* task);
static bool8 Phase2_Transition_WhiteFade_Func4(struct Task* task);
static bool8 Phase2_Transition_WhiteFade_Func5(struct Task* task);
static bool8 Phase2_Transition_GridSquares_Func1(struct Task* task);
static bool8 Phase2_Transition_GridSquares_Func2(struct Task* task);
static bool8 Phase2_Transition_GridSquares_Func3(struct Task* task);
static bool8 Phase2_Transition_Shards_Func1(struct Task* task);
static bool8 Phase2_Transition_Shards_Func2(struct Task* task);
static bool8 Phase2_Transition_Shards_Func3(struct Task* task);
static bool8 Phase2_Transition_Shards_Func4(struct Task* task);
static bool8 Phase2_Transition_Shards_Func5(struct Task* task);
static bool8 Phase2_Mugshot_Func1(struct Task* task);
static bool8 Phase2_Mugshot_Func2(struct Task* task);
static bool8 Phase2_Mugshot_Func3(struct Task* task);
static bool8 Phase2_Mugshot_Func4(struct Task* task);
static bool8 Phase2_Mugshot_Func5(struct Task* task);
static bool8 Phase2_Mugshot_Func6(struct Task* task);
static bool8 Phase2_Mugshot_Func7(struct Task* task);
static bool8 Phase2_Mugshot_Func8(struct Task* task);
static bool8 Phase2_Mugshot_Func9(struct Task* task);
static bool8 Phase2_Mugshot_Func10(struct Task* task);
static void Phase2Task_MugShotTransition(u8 taskID);
static void Mugshots_CreateOpponentPlayerSprites(struct Task* task);
static void sub_811CA10(s16 spriteID, s16 value);
static void sub_811CA28(s16 spriteID);
static s16 sub_811CA44(s16 spriteID);
static bool8 sub_811C934(struct Sprite* sprite);
static bool8 sub_811C938(struct Sprite* sprite);
static bool8 sub_811C984(struct Sprite* sprite);
static bool8 sub_811C9B8(struct Sprite* sprite);
static bool8 sub_811C9E4(struct Sprite* sprite);
static void CreatePhase1Task(s16 a0, s16 a1, s16 a2, s16 a3, s16 a4);
static bool8 sub_811D52C(void);
static void Phase1_Task_RunFuncs(u8 taskID);
static bool8 Phase1_TransitionAll_Func1(struct Task* task);
static bool8 Phase1_TransitionAll_Func2(struct Task* task);
static void sub_811D658(void);
static void VBlankCB_BattleTransition(void);
static void sub_811D6A8(u16** a0, u16** a1);
static void sub_811D690(u16** a0);
static void sub_811D6D4(void);
static void sub_811D6E8(s16* array, s16 sinAdd, s16 index, s16 indexIncrementer, s16 amplitude, s16 arrSize);
static void sub_811D764(u16* a0, s16 a1, s16 a2, s16 a3);
static void sub_811D8FC(s16* a0, s16 a1, s16 a2, s16 a3, s16 a4, s16 a5, s16 a6);
static bool8 sub_811D978(s16* a0, bool8 a1, bool8 a2);
static void sub_811CFD0(struct Sprite* sprite);
static void sub_811B720(struct Sprite* sprite);
static void sub_811C90C(struct Sprite* sprite);



static const u32 sBigPokeball_Tileset[] = INCBIN_U32("graphics/battle_transitions/big_pokeball.4bpp");
static const u32 sPokeballTrail_Tileset[] = INCBIN_U32("graphics/battle_transitions/pokeball_trail.4bpp");
static const u8 sSpriteImage_83FC148[] = INCBIN_U8("graphics/battle_transitions/pokeball.4bpp");
static const u32 sUnknown_083FC348[] = INCBIN_U32("graphics/battle_transitions/elite_four_bg.4bpp");
static const u8 sSpriteImage_83FC528[] = INCBIN_U8("graphics/battle_transitions/unused_brendan.4bpp");
static const u8 sSpriteImage_83FCD28[] = INCBIN_U8("graphics/battle_transitions/unused_lass.4bpp");
static const u32 sShrinkingBoxTileset[] = INCBIN_U32("graphics/battle_transitions/shrinking_box.4bpp");

static struct TransitionData * const sTransitionStructPtr = &(*(struct TransitionData *) (gSharedMem + 0xC000));

static const TaskFunc sPhase1_Tasks[17] =
{
    [0 ... 17 - 1] = &Phase1Task_TransitionAll
};

static const TaskFunc sPhase2_Tasks[17] =
{
    Phase2Task_Transition_Blur,
    Phase2Task_Transition_Swirl,
    Phase2Task_Transition_Shuffle,
    Phase2Task_Transition_BigPokeball,
    Phase2Task_Transition_PokeballsTrail,
    Phase2Task_Transition_Clockwise_BlackFade,
    Phase2Task_Transition_Ripple,
    Phase2Task_Transition_Wave,
    Phase2Task_Transition_Slice,
    Phase2Task_Transition_WhiteFade,
    Phase2Task_Transition_GridSquares,
    Phase2Task_Transition_Shards,
    Phase2Task_Transition_Sydney,
    Phase2Task_Transition_Phoebe,
    Phase2Task_Transition_Glacia,
    Phase2Task_Transition_Drake,
    Phase2Task_Transition_Steven,
};

static const TransitionState sMainTransitionPhases[] =
{
    &Transition_Phase1,
    &Transition_WaitForPhase1,
    &Transition_Phase2,
    &Transition_WaitForPhase2
};

static const TransitionState sPhase2_Transition_Blur_Funcs[] =
{
    Phase2_Transition_Blur_Func1,
    Phase2_Transition_Blur_Func2,
    Phase2_Transition_Blur_Func3
};

static const TransitionState sPhase2_Transition_Swirl_Funcs[] =
{
    Phase2_Transition_Swirl_Func1,
    Phase2_Transition_Swirl_Func2,
};

static const TransitionState sPhase2_Transition_Shuffle_Funcs[] =
{
    Phase2_Transition_Shuffle_Func1,
    Phase2_Transition_Shuffle_Func2,
};

static const TransitionState sPhase2_Transition_BigPokeball_Funcs[] =
{
    Phase2_Transition_BigPokeball_Func1,
    Phase2_Transition_BigPokeball_Func2,
    Phase2_Transition_BigPokeball_Func3,
    Phase2_Transition_BigPokeball_Func4,
    Phase2_Transition_BigPokeball_Func5,
    Phase2_Transition_BigPokeball_Func6
};

static const TransitionState sPhase2_Transition_PokeballsTrail_Funcs[] =
{
    Phase2_Transition_PokeballsTrail_Func1,
    Phase2_Transition_PokeballsTrail_Func2,
    Phase2_Transition_PokeballsTrail_Func3
};

static const s16 sUnknown_083FD7E4[2] = {-16, 256};
static const s16 sUnknown_083FD7E8[5] = {0, 32, 64, 18, 48};
static const s16 sUnknown_083FD7F2[2] = {8, -8};

static const TransitionState sPhase2_Transition_Clockwise_BlackFade_Funcs[] =
{
    Phase2_Transition_Clockwise_BlackFade_Func1,
    Phase2_Transition_Clockwise_BlackFade_Func2,
    Phase2_Transition_Clockwise_BlackFade_Func3,
    Phase2_Transition_Clockwise_BlackFade_Func4,
    Phase2_Transition_Clockwise_BlackFade_Func5,
    Phase2_Transition_Clockwise_BlackFade_Func6,
    Phase2_Transition_Clockwise_BlackFade_Func7
};

static const TransitionState sPhase2_Transition_Ripple_Funcs[] =
{
    Phase2_Transition_Ripple_Func1,
    Phase2_Transition_Ripple_Func2
};

static const TransitionState sPhase2_Transition_Wave_Funcs[] =
{
    Phase2_Transition_Wave_Func1,
    Phase2_Transition_Wave_Func2,
    Phase2_Transition_Wave_Func3
};

static const TransitionState sPhase2_Mugshot_Transition_Funcs[] =
{
    Phase2_Mugshot_Func1,
    Phase2_Mugshot_Func2,
    Phase2_Mugshot_Func3,
    Phase2_Mugshot_Func4,
    Phase2_Mugshot_Func5,
    Phase2_Mugshot_Func6,
    Phase2_Mugshot_Func7,
    Phase2_Mugshot_Func8,
    Phase2_Mugshot_Func9,
    Phase2_Mugshot_Func10
};

static const u8 sMugshotsTrainerPicIDsTable[5] = {TRAINER_PIC_SIDNEY, TRAINER_PIC_PHOEBE, TRAINER_PIC_GLACIA, TRAINER_PIC_DRAKE, TRAINER_PIC_STEVEN};
static const s16 sMugshotsOpponentRotationScales[5][2] =
{
    {0x200, 0x200},
    {0x200, 0x200},
    {0x1B0, 0x1B0},
    {0x1A0, 0x1A0},
    {0x188, 0x188},
};
static const s16 sMugshotsOpponentCoords[5][2] =
{
    {0, 0},
    {0, 0},
    {-4, 4},
    {0, 5},
    {0, 7},
};

static const TransitionSpriteCallback sUnknown_083FD880[] =
{
    sub_811C934,
    sub_811C938,
    sub_811C984,
    sub_811C9B8,
    sub_811C934,
    sub_811C9E4,
    sub_811C934
};

static const s16 sUnknown_083FD89C[2] = {12, -12};
static const s16 sUnknown_083FD8A0[2] = {-1, 1};

static const TransitionState sPhase2_Transition_Slice_Funcs[] =
{
    Phase2_Transition_Slice_Func1,
    Phase2_Transition_Slice_Func2,
    Phase2_Transition_Slice_Func3
};

static const TransitionState sPhase2_Transition_WhiteFade_Funcs[] =
{
    Phase2_Transition_WhiteFade_Func1,
    Phase2_Transition_WhiteFade_Func2,
    Phase2_Transition_WhiteFade_Func3,
    Phase2_Transition_WhiteFade_Func4,
    Phase2_Transition_WhiteFade_Func5
};

static const s16 sUnknown_083FD8C4[8] = {0, 20, 15, 40, 10, 25, 35, 5};

static const TransitionState sPhase2_Transition_GridSquares_Funcs[] =
{
    Phase2_Transition_GridSquares_Func1,
    Phase2_Transition_GridSquares_Func2,
    Phase2_Transition_GridSquares_Func3
};

static const TransitionState sPhase2_Transition_Shards_Funcs[] =
{
    Phase2_Transition_Shards_Func1,
    Phase2_Transition_Shards_Func2,
    Phase2_Transition_Shards_Func3,
    Phase2_Transition_Shards_Func4,
    Phase2_Transition_Shards_Func5
};

static const s16 sUnknown_083FD8F4[][5] =
{
    {56, 0, 0, 160, 0},
    {104, 160, 240, 88, 1},
    {240, 72, 56, 0, 1},
    {0, 32, 144, 160, 0},
    {144, 160, 184, 0, 1},
    {56, 0, 168, 160, 0},
    {168, 160, 48, 0, 1},
};

static const s16 sUnknown_083FD93A[] = {8, 4, 2, 1, 1, 1, 0};

static const TransitionState sPhase1_TransitionAll_Funcs[] =
{
    Phase1_TransitionAll_Func1,
    Phase1_TransitionAll_Func2
};

static const struct SpriteFrameImage sSpriteImageTable_83FD950[] =
{
    sSpriteImage_83FC148, 0x200
};

static const union AnimCmd sSpriteAnim_83FD958[] =
{
    {.frame = {0, 1}},
    {.type = -1}
};

static const union AnimCmd *const sSpriteAnimTable_83FD960[] =
{
    sSpriteAnim_83FD958
};

static const union AffineAnimCmd sSpriteAffineAnim_83FD964[] =
{
    {.frame = {.xScale = 0, .yScale = 0, .rotation = -4, .duration = 1}},
    {.jump = {.type = 0x7FFE, .target = 0}}
};

static const union AffineAnimCmd sSpriteAffineAnim_83FD974[] =
{
    {.frame = {.xScale = 0, .yScale = 0, .rotation = 4, .duration = 1}},
    {.jump = {.type = 0x7FFE, .target = 0}}
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_83FD984[] =
{
    sSpriteAffineAnim_83FD964,
    sSpriteAffineAnim_83FD974
};

static const struct SpriteTemplate sSpriteTemplate_83FD98C =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4105,
    .oam = &gFieldOamData_32x32,
    .anims = sSpriteAnimTable_83FD960,
    .images = sSpriteImageTable_83FD950,
    .affineAnims = sSpriteAffineAnimTable_83FD984,
    .callback = sub_811B720
};

static const struct OamData gOamData_83FD9A4 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

static const struct SpriteFrameImage sSpriteImageTable_83FD9AC[] =
{
    sSpriteImage_83FC528, 0x800
};

static const struct SpriteFrameImage sSpriteImageTable_83FD9B4[] =
{
    sSpriteImage_83FCD28, 0x800
};

static const union AnimCmd sSpriteAnim_83FD9BC[] =
{
    {.frame = {0, 1}},
    {.type = -1}
};

static const union AnimCmd *const sSpriteAnimTable_83FD9C4[] =
{
    sSpriteAnim_83FD9BC
};

static const struct SpriteTemplate sSpriteTemplate_83FD9C8 =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4106,
    .oam = &gOamData_83FD9A4,
    .anims = sSpriteAnimTable_83FD9C4,
    .images = sSpriteImageTable_83FD9AC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_811C90C
};

static const struct SpriteTemplate sSpriteTemplate_83FD9E0 =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4106,
    .oam = &gOamData_83FD9A4,
    .anims = sSpriteAnimTable_83FD9C4,
    .images = sSpriteImageTable_83FD9B4,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_811C90C
};

static const u16 gFieldEffectObjectPalette10[] = INCBIN_U16("graphics/field_effect_objects/palettes/10.gbapal");

const struct SpritePalette gFieldEffectObjectPaletteInfo10 =
{
    gFieldEffectObjectPalette10, 0x1009
};

static const u16 sMugshotPal_Sydney[] = INCBIN_U16("graphics/battle_transitions/sidney_bg.gbapal");
static const u16 sMugshotPal_Phoebe[] = INCBIN_U16("graphics/battle_transitions/phoebe_bg.gbapal");
static const u16 sMugshotPal_Glacia[] = INCBIN_U16("graphics/battle_transitions/glacia_bg.gbapal");
static const u16 sMugshotPal_Drake[] = INCBIN_U16("graphics/battle_transitions/drake_bg.gbapal");
static const u16 sMugshotPal_Steven[] = INCBIN_U16("graphics/battle_transitions/steven_bg.gbapal");
static const u16 sMugshotPal_Brendan[] = INCBIN_U16("graphics/battle_transitions/brendan_bg.gbapal");
static const u16 sMugshotPal_May[] = INCBIN_U16("graphics/battle_transitions/may_bg.gbapal");

static const u16 * const sOpponentMugshotsPals[5] =
{
    sMugshotPal_Sydney,
    sMugshotPal_Phoebe,
    sMugshotPal_Glacia,
    sMugshotPal_Drake,
    sMugshotPal_Steven
};

static const u16 * const sPlayerMugshotsPals[2] =
{
    sMugshotPal_Brendan,
    sMugshotPal_May
};

static const u16 sUnusedTrainerPalette[] = INCBIN_U16("graphics/battle_transitions/unused_trainer.gbapal");
static const struct SpritePalette sSpritePalette_UnusedTrainer =
{
    sUnusedTrainerPalette, 0x100A
};

static const u16 sBigPokeball_Tilemap[] = INCBIN_U16("graphics/battle_transitions/big_pokeball_map.bin");
static const u16 sMugshotsTilemap[] = INCBIN_U16("graphics/battle_transitions/elite_four_bg_map.bin");



void BattleTransition_StartOnField(u8 transitionID)
{
    gMain.callback2 = CB2_OverworldBasic;
    LaunchBattleTransitionTask(transitionID);
}

void BattleTransition_Start(u8 transitionID)
{
    LaunchBattleTransitionTask(transitionID);
}





bool8 IsBattleTransitionDone(void)
{
    u8 taskID = FindTaskIdByFunc(Task_BattleTransitionMain);
    if (gTasks[taskID].data[15])
    {
        DestroyTask(taskID);
        return 1;
    }
    else
        return 0;
}

static void LaunchBattleTransitionTask(u8 transitionID)
{
    u8 taskID = CreateTask(Task_BattleTransitionMain, 2);
    gTasks[taskID].data[1] = transitionID;
}

static void Task_BattleTransitionMain(u8 taskID)
{
    while (sMainTransitionPhases[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Transition_Phase1(struct Task* task)
{
    sub_807DE10();
    CpuSet(gPlttBufferFaded, gPlttBufferUnfaded, 0x04000000 | ((0x400)/(32/8) & 0x1FFFFF));
    if (sPhase1_Tasks[task->data[1]] != ((void *)0))
    {
        CreateTask(sPhase1_Tasks[task->data[1]], 4);
        task->data[0]++;
        return 0;
    }
    else
    {
        task->data[0] = 2;
        return 1;
    }
}

static bool8 Transition_WaitForPhase1(struct Task* task)
{
    if (FindTaskIdByFunc(sPhase1_Tasks[task->data[1]]) == 0xFF)
    {
        task->data[0]++;
        return 1;
    }
    else
        return 0;
}

static bool8 Transition_Phase2(struct Task* task)
{
    CreateTask(sPhase2_Tasks[task->data[1]], 0);
    task->data[0]++;
    return 0;
}

static bool8 Transition_WaitForPhase2(struct Task* task)
{
    task->data[15] = 0;
    if (FindTaskIdByFunc(sPhase2_Tasks[task->data[1]]) == 0xFF)
        task->data[15] = 1;
    return 0;
}

static void Phase1Task_TransitionAll(u8 taskID)
{
    if (gTasks[taskID].data[0] == 0)
    {
        gTasks[taskID].data[0]++;
        CreatePhase1Task(0, 0, 3, 2, 2);
    }
    else if (sub_811D52C())
        DestroyTask(taskID);
}

static void Phase2Task_Transition_Blur(u8 taskID)
{
    while (sPhase2_Transition_Blur_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Blur_Func1(struct Task* task)
{
    (*(vu16 *)(0x4000000 + 0x4c)) = 0;
    (*(vu16 *)(0x4000000 + 0xa)) |= 0x0040;
    (*(vu16 *)(0x4000000 + 0xc)) |= 0x0040;
    (*(vu16 *)(0x4000000 + 0xe)) |= 0x0040;
    task->data[0]++;
    return 1;
}

static bool8 Phase2_Transition_Blur_Func2(struct Task* task)
{
    if (task->data[1] != 0)
        task->data[1]--;
    else
    {
        task->data[1] = 4;
        if (++task->data[2] == 10)
            BeginNormalPaletteFade(-1, -1, 0, 0x10, 0);
        (*(vu16 *)(0x4000000 + 0x4c)) = (task->data[2] & 15) * 17;
        if (task->data[2] > 14)
            task->data[0]++;
    }
    return 0;
}

static bool8 Phase2_Transition_Blur_Func3(struct Task* task)
{
    if (!gPaletteFade.active)
    {
        u8 taskID = FindTaskIdByFunc(Phase2Task_Transition_Blur);
        DestroyTask(taskID);
    }
    return 0;
}

static void Phase2Task_Transition_Swirl(u8 taskID)
{
    while (sPhase2_Transition_Swirl_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Swirl_Func1(struct Task* task)
{
    u16 savedIME;

    sub_811D658();
    dp12_8087EA4();
    BeginNormalPaletteFade(-1, 4, 0, 0x10, 0);
    sub_811D6E8(gUnknown_03005560, (*(struct TransitionData *) (gSharedMem + 0xC000)).field_14, 0, 2, 0, 160);

    SetVBlankCallback(VBlankCB_Phase2_Transition_Swirl);
    SetHBlankCallback(HBlankCB_Phase2_Transition_Swirl);

    savedIME = (*(vu16 *)(0x4000000 + 0x208));
    (*(vu16 *)(0x4000000 + 0x208)) = 0;
    (*(vu16 *)(0x4000000 + 0x200)) |= ((1 << 0) | (1 << 1));
    (*(vu16 *)(0x4000000 + 0x208)) = savedIME;
    (*(vu16 *)(0x4000000 + 0x4)) |= (0x0008 | 0x0010);

    task->data[0]++;
    return 0;
}

static bool8 Phase2_Transition_Swirl_Func2(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;
    task->data[1] += 4;
    task->data[2] += 8;

    sub_811D6E8(gUnknown_03004DE0[0], (*(struct TransitionData *) (gSharedMem + 0xC000)).field_14, task->data[1], 2, task->data[2], 160);

    if (!gPaletteFade.active)
    {
        u8 taskID = FindTaskIdByFunc(Phase2Task_Transition_Swirl);
        DestroyTask(taskID);
    }

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static void VBlankCB_Phase2_Transition_Swirl(void)
{
    VBlankCB_BattleTransition();
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((320)/(16/8))); dmaRegs[2]; };
}

static void HBlankCB_Phase2_Transition_Swirl(void)
{
    u16 var = gUnknown_03004DE0[1][(*(vu16 *)(0x4000000 + 0x6))];
    (*(vu16 *)(0x4000000 + 0x14)) = var;
    (*(vu16 *)(0x4000000 + 0x18)) = var;
    (*(vu16 *)(0x4000000 + 0x1c)) = var;
}

static void Phase2Task_Transition_Shuffle(u8 taskID)
{
    while (sPhase2_Transition_Shuffle_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Shuffle_Func1(struct Task* task)
{
    u16 savedIME;

    sub_811D658();
    dp12_8087EA4();

    BeginNormalPaletteFade(-1, 4, 0, 0x10, 0);
    memset(gUnknown_03005560, (*(struct TransitionData *) (gSharedMem + 0xC000)).field_16, 0x140);

    SetVBlankCallback(VBlankCB_Phase2_Transition_Shuffle);
    SetHBlankCallback(HBlankCB_Phase2_Transition_Shuffle);

    savedIME = (*(vu16 *)(0x4000000 + 0x208));
    (*(vu16 *)(0x4000000 + 0x208)) = 0;
    (*(vu16 *)(0x4000000 + 0x200)) |= ((1 << 0) | (1 << 1));
    (*(vu16 *)(0x4000000 + 0x208)) = savedIME;
    (*(vu16 *)(0x4000000 + 0x4)) |= (0x0008 | 0x0010);

    task->data[0]++;
    return 0;
}

static bool8 Phase2_Transition_Shuffle_Func2(struct Task* task)
{
    u8 i;
    u16 r3, r4;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;
    r4 = task->data[1];
    r3 = task->data[2] >> 8;
    task->data[1] += 4224;
    task->data[2] += 384;

    for (i = 0; i < 160; i++, r4 += 4224)
    {
        u16 var = r4 / 256;
        gUnknown_03004DE0[0][i] = (*(struct TransitionData *) (gSharedMem + 0xC000)).field_16 + Sin(var, r3);
    }

    if (!gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Shuffle));

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static void VBlankCB_Phase2_Transition_Shuffle(void)
{
    VBlankCB_BattleTransition();
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((320)/(16/8))); dmaRegs[2]; };
}

static void HBlankCB_Phase2_Transition_Shuffle(void)
{
    u16 var = gUnknown_03004DE0[1][(*(vu16 *)(0x4000000 + 0x6))];
    (*(vu16 *)(0x4000000 + 0x16)) = var;
    (*(vu16 *)(0x4000000 + 0x1a)) = var;
    (*(vu16 *)(0x4000000 + 0x1e)) = var;
}

static void Phase2Task_Transition_BigPokeball(u8 taskID)
{
    while (sPhase2_Transition_BigPokeball_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_BigPokeball_Func1(struct Task* task)
{
    u16 i;
    u16 *dst1, *dst2;

    sub_811D658();
    dp12_8087EA4();

    task->data[1] = 16;
    task->data[2] = 0;
    task->data[4] = 0;
    task->data[5] = 0x4000;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ = 63;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT = 0;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_6 = 240;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V = 160;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDCNT = 0x3F41;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDALPHA = task->data[1] * 256;

    for (i = 0; i < 160; i++)
    {
        gUnknown_03005560[i] = 240;
    }

    SetVBlankCallback(VBlankCB0_Phase2_Transition_BigPokeball);

    sub_811D6A8(&dst1, & dst2);
    { vu16 tmp = (vu16)(0); CpuSet((void *)&tmp, dst1, 0x00000000 | 0x01000000 | ((0x800)/(16/8) & 0x1FFFFF)); };
    CpuSet(sBigPokeball_Tileset, dst2, 0x2C0);
    LoadPalette(gFieldEffectObjectPalette10, 240, 32);

    task->data[0]++;
    return 0;
}

static bool8 Phase2_Transition_BigPokeball_Func2(struct Task* task)
{
    s16 i, j;
    u16 *dst1, *dst2;
    const u16* BigPokeballMap;

    BigPokeballMap = sBigPokeball_Tilemap;
    sub_811D6A8(&dst1, &dst2);
    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 30; j++, BigPokeballMap++)
        {
            dst1[i * 32 + j] = *BigPokeballMap | 0xF000;
        }
    }
    sub_811D6E8(gUnknown_03004DE0[0], 0, task->data[4], 132, task->data[5], 160);

    task->data[0]++;
    return 1;
}

static bool8 Phase2_Transition_BigPokeball_Func3(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;
    if (task->data[3] == 0 || --task->data[3] == 0)
    {
        task->data[2]++;
        task->data[3] = 2;
    }
    (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDALPHA = (task->data[1] << 8) | task->data[2];
    if (task->data[2] > 15)
        task->data[0]++;
    task->data[4] += 8;
    task->data[5] -= 256;

    sub_811D6E8(gUnknown_03004DE0[0], 0, task->data[4], 132, task->data[5] >> 8, 160);

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Transition_BigPokeball_Func4(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;
    if (task->data[3] == 0 || --task->data[3] == 0)
    {
        task->data[1]--;
        task->data[3] = 2;
    }
    (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDALPHA = (task->data[1] << 8) | task->data[2];
    if (task->data[1] == 0)
        task->data[0]++;
    task->data[4] += 8;
    task->data[5] -= 256;

    sub_811D6E8(gUnknown_03004DE0[0], 0, task->data[4], 132, task->data[5] >> 8, 160);

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Transition_BigPokeball_Func5(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;
    task->data[4] += 8;
    task->data[5] -= 256;

    sub_811D6E8(gUnknown_03004DE0[0], 0, task->data[4], 132, task->data[5] >> 8, 160);

    if (task->data[5] <= 0)
    {
        task->data[0]++;
        task->data[1] = 160;
        task->data[2] = 256;
        task->data[3] = 0;
    }

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Transition_BigPokeball_Func6(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;
    if (task->data[2] < 1024)
        task->data[2] += 128;
    if (task->data[1] != 0)
    {
        task->data[1] -= (task->data[2] >> 8);
        if (task->data[1] < 0)
            task->data[1] = 0;
    }
    sub_811D764(gUnknown_03004DE0[0], 120, 80, task->data[1]);
    if (task->data[1] == 0)
    {
        { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
        sub_811D6D4();
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_BigPokeball));
    }
    if (task->data[3] == 0)
    {
        task->data[3]++;
        SetVBlankCallback(VBlankCB1_Phase2_Transition_BigPokeball);
    }

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static void Transition_BigPokeball_Vblank(void)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    VBlankCB_BattleTransition();
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((320)/(16/8))); dmaRegs[2]; };
    (*(vu16 *)(0x4000000 + 0x48)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ;
    (*(vu16 *)(0x4000000 + 0x4a)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT;
    (*(vu16 *)(0x4000000 + 0x44)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V;
    (*(vu16 *)(0x4000000 + 0x50)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDCNT;
    (*(vu16 *)(0x4000000 + 0x52)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDALPHA;
}

static void VBlankCB0_Phase2_Transition_BigPokeball(void)
{
    Transition_BigPokeball_Vblank();
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xb0); dmaRegs[0] = (vu32)(gUnknown_03005560); dmaRegs[1] = (vu32)(&(*(vu16 *)(0x4000000 + 0x10))); dmaRegs[2] = (vu32)(0xA2400001); dmaRegs[2]; };
}

static void VBlankCB1_Phase2_Transition_BigPokeball(void)
{
    Transition_BigPokeball_Vblank();
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xb0); dmaRegs[0] = (vu32)(gUnknown_03005560); dmaRegs[1] = (vu32)(&(*(vu16 *)(0x4000000 + 0x40))); dmaRegs[2] = (vu32)(0xA2400001); dmaRegs[2]; };
}

static void Phase2Task_Transition_PokeballsTrail(u8 taskID)
{
    while (sPhase2_Transition_PokeballsTrail_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_PokeballsTrail_Func1(struct Task* task)
{
    u16 *dst1, *dst2;

    sub_811D6A8(&dst1, &dst2);
    CpuSet(sPokeballTrail_Tileset, dst2, 0x20);
    { vu32 tmp = (vu32)(0); CpuSet((void *)&tmp, dst1, 0x04000000 | 0x01000000 | ((0x800)/(32/8) & 0x1FFFFF)); };
    LoadPalette(gFieldEffectObjectPalette10, 0xF0, 0x20);

    task->data[0]++;
    return 0;
}

static bool8 Phase2_Transition_PokeballsTrail_Func2(struct Task* task)
{
    s16 i;
    s16 rand;
    s16 arr0[2];
    s16 arr1[5];

    memcpy(arr0, sUnknown_083FD7E4, sizeof(sUnknown_083FD7E4));
    memcpy(arr1, sUnknown_083FD7E8, sizeof(sUnknown_083FD7E8));
    rand = Random() & 1;
    for (i = 0; i <= 4; i++, rand ^= 1)
    {
        gFieldEffectArguments[0] = arr0[rand];
        gFieldEffectArguments[1] = (i * 32) + 16;
        gFieldEffectArguments[2] = rand;
        gFieldEffectArguments[3] = arr1[i];
        FieldEffectStart(FLDEFF_POKEBALL);
    }

    task->data[0]++;
    return 0;
}

static bool8 Phase2_Transition_PokeballsTrail_Func3(struct Task* task)
{
    if (!FieldEffectActiveListContains(FLDEFF_POKEBALL))
    {
        sub_811D6D4();
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_PokeballsTrail));
    }
    return 0;
}

bool8 FldEff_Pokeball(void)
{
    u8 spriteID = CreateSpriteAtEnd(&sSpriteTemplate_83FD98C, gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    gSprites[spriteID].oam.priority = 0;
    gSprites[spriteID].oam.affineMode = 1;
    gSprites[spriteID].data[0] = gFieldEffectArguments[2];
    gSprites[spriteID].data[1] = gFieldEffectArguments[3];
    gSprites[spriteID].data[2] = -1;
    InitSpriteAffineAnim(&gSprites[spriteID]);
    StartSpriteAffineAnim(&gSprites[spriteID], gFieldEffectArguments[2]);
    return 0;
}







static void sub_811B720(struct Sprite* sprite)
{
    s16 arr0[2];

    memcpy(arr0, sUnknown_083FD7F2, sizeof(sUnknown_083FD7F2));
    if (sprite->data[1] != 0)
        sprite->data[1]--;
    else
    {
        if (sprite->pos1.x >= 0 && sprite->pos1.x <= 240)
        {
            s16 posX = sprite->pos1.x >> 3;
            s16 posY = sprite->pos1.y >> 3;

            if (posX != sprite->data[2])
            {
                u32 var;
                u16 *ptr;

                sprite->data[2] = posX;
                var = ((((*(vu16 *)(0x4000000 + 0x8)) >> 8) & 0x1F) << 11);
                ptr = (u16 *)(0x6000000 + var);

                { u32 index = (posY - 2) * 32 + posX; ptr[index] = 0xF001; };
                { u32 index = (posY - 1) * 32 + posX; ptr[index] = 0xF001; };
                { u32 index = (posY - 0) * 32 + posX; ptr[index] = 0xF001; };
                { u32 index = (posY + 1) * 32 + posX; ptr[index] = 0xF001; };
            }
        }
        sprite->pos1.x += arr0[sprite->data[0]];
        if (sprite->pos1.x < -15 || sprite->pos1.x > 255)
            FieldEffectStop(sprite, FLDEFF_POKEBALL);
    }
}

static void Phase2Task_Transition_Clockwise_BlackFade(u8 taskID)
{
    while (sPhase2_Transition_Clockwise_BlackFade_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func1(struct Task* task)
{
    u16 i;

    sub_811D658();
    dp12_8087EA4();

    (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ = 0;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT = 63;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_6 = -3855;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V = 160;

    for (i = 0; i < 160; i++)
    {
        gUnknown_03005560[i] = 0xF3F4;
    }

    SetVBlankCallback(VBlankCB_Phase2_Transition_Clockwise_BlackFade);
    (*(struct TransitionData *) (gSharedMem + 0xC000)).data[4] = 120;

    task->data[0]++;
    return 1;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func2(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    sub_811D8FC((*(struct TransitionData *) (gSharedMem + 0xC000)).data, 120, 80, (*(struct TransitionData *) (gSharedMem + 0xC000)).data[4], -1, 1, 1);
    do
    {
        gUnknown_03004DE0[0][(*(struct TransitionData *) (gSharedMem + 0xC000)).data[3]] = ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[2] + 1) | 0x7800;
    } while (!sub_811D978((*(struct TransitionData *) (gSharedMem + 0xC000)).data, 1, 1));

    (*(struct TransitionData *) (gSharedMem + 0xC000)).data[4] += 16;
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[4] >= 240)
    {
        (*(struct TransitionData *) (gSharedMem + 0xC000)).data[5] = 0;
        task->data[0]++;
    }

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func3(struct Task* task)
{
    s16 r1, r3;
    vu8 var = 0;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    sub_811D8FC((*(struct TransitionData *) (gSharedMem + 0xC000)).data, 120, 80, 240, (*(struct TransitionData *) (gSharedMem + 0xC000)).data[5], 1, 1);

    while (1)
    {
        r1 = 120, r3 = (*(struct TransitionData *) (gSharedMem + 0xC000)).data[2] + 1;
        if ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[5] >= 80)
            r1 = (*(struct TransitionData *) (gSharedMem + 0xC000)).data[2], r3 = 240;
        gUnknown_03004DE0[0][(*(struct TransitionData *) (gSharedMem + 0xC000)).data[3]] = (r3) | (r1 << 8);
        if (var != 0)
            break;
        var = sub_811D978((*(struct TransitionData *) (gSharedMem + 0xC000)).data, 1, 1);
    }

    (*(struct TransitionData *) (gSharedMem + 0xC000)).data[5] += 8;
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[5] >= 160)
    {
        (*(struct TransitionData *) (gSharedMem + 0xC000)).data[4] = 240;
        task->data[0]++;
    }
    else
    {
        while ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[3] < (*(struct TransitionData *) (gSharedMem + 0xC000)).data[5])
        {
            gUnknown_03004DE0[0][++(*(struct TransitionData *) (gSharedMem + 0xC000)).data[3]] = (r3) | (r1 << 8);
        }
    }

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func4(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    sub_811D8FC((*(struct TransitionData *) (gSharedMem + 0xC000)).data, 120, 80, (*(struct TransitionData *) (gSharedMem + 0xC000)).data[4], 160, 1, 1);
    do
    {
        gUnknown_03004DE0[0][(*(struct TransitionData *) (gSharedMem + 0xC000)).data[3]] = ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[2] << 8) | 0xF0;
    } while (!sub_811D978((*(struct TransitionData *) (gSharedMem + 0xC000)).data, 1, 1));

    (*(struct TransitionData *) (gSharedMem + 0xC000)).data[4] -= 16;
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[4] <= 0)
    {
        (*(struct TransitionData *) (gSharedMem + 0xC000)).data[5] = 160;
        task->data[0]++;
    }

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func5(struct Task* task)
{
    s16 r1, r2, r3;
    vu8 var = 0;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    sub_811D8FC((*(struct TransitionData *) (gSharedMem + 0xC000)).data, 120, 80, 0, (*(struct TransitionData *) (gSharedMem + 0xC000)).data[5], 1, 1);

    while (1)
    {
        r1 = gUnknown_03004DE0[0][(*(struct TransitionData *) (gSharedMem + 0xC000)).data[3]] & 0xFF, r2 = (*(struct TransitionData *) (gSharedMem + 0xC000)).data[2];
        if ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[5] <= 80)
            r2 = 120, r1 = (*(struct TransitionData *) (gSharedMem + 0xC000)).data[2];
        gUnknown_03004DE0[0][(*(struct TransitionData *) (gSharedMem + 0xC000)).data[3]] = (r1) | (r2 << 8);
        r3 = 0;
        if (var != 0)
            break;
        var = sub_811D978((*(struct TransitionData *) (gSharedMem + 0xC000)).data, 1, 1);
    }

    (*(struct TransitionData *) (gSharedMem + 0xC000)).data[5] -= 8;
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[5] <= 0)
    {
        (*(struct TransitionData *) (gSharedMem + 0xC000)).data[4] = r3;
        task->data[0]++;
    }
    else
    {
        while ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[3] > (*(struct TransitionData *) (gSharedMem + 0xC000)).data[5])
        {
            gUnknown_03004DE0[0][--(*(struct TransitionData *) (gSharedMem + 0xC000)).data[3]] = (r1) | (r2 << 8);
        }
    }

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func6(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    sub_811D8FC((*(struct TransitionData *) (gSharedMem + 0xC000)).data, 120, 80, (*(struct TransitionData *) (gSharedMem + 0xC000)).data[4], 0, 1, 1);
    do
    {
        s16 r2, r3;

        r2 = 120, r3 = (*(struct TransitionData *) (gSharedMem + 0xC000)).data[2];
        if ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[2] >= 120)
            r2 = 0, r3 = 240;
        gUnknown_03004DE0[0][(*(struct TransitionData *) (gSharedMem + 0xC000)).data[3]] = (r3) | (r2 << 8);

    } while (!sub_811D978((*(struct TransitionData *) (gSharedMem + 0xC000)).data, 1, 1));

    (*(struct TransitionData *) (gSharedMem + 0xC000)).data[4] += 16;
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).data[2] > 120)
        task->data[0]++;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Transition_Clockwise_BlackFade_Func7(struct Task* task)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    sub_811D6D4();
    DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Clockwise_BlackFade));
    return 0;
}

static void VBlankCB_Phase2_Transition_Clockwise_BlackFade(void)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    VBlankCB_BattleTransition();
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA != 0)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((320)/(16/8))); dmaRegs[2]; };
    (*(vu16 *)(0x4000000 + 0x48)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ;
    (*(vu16 *)(0x4000000 + 0x4a)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT;
    (*(vu16 *)(0x4000000 + 0x44)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V;
    (*(vu16 *)(0x4000000 + 0x40)) = gUnknown_03004DE0[1][0];
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xb0); dmaRegs[0] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[1] = (vu32)(&(*(vu16 *)(0x4000000 + 0x40))); dmaRegs[2] = (vu32)(0xA2400001); dmaRegs[2]; };
}

static void Phase2Task_Transition_Ripple(u8 taskID)
{
    while (sPhase2_Transition_Ripple_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Ripple_Func1(struct Task* task)
{
    u8 i;

    sub_811D658();
    dp12_8087EA4();

    for (i = 0; i < 160; i++)
    {
        gUnknown_03005560[i] = (*(struct TransitionData *) (gSharedMem + 0xC000)).field_16;
    }

    SetVBlankCallback(VBlankCB_Phase2_Transition_Ripple);
    SetHBlankCallback(HBlankCB_Phase2_Transition_Ripple);

    (*(vu16 *)(0x4000000 + 0x200)) |= (1 << 1);
    (*(vu16 *)(0x4000000 + 0x4)) |= 0x0010;

    task->data[0]++;
    return 1;
}

static bool8 Phase2_Transition_Ripple_Func2(struct Task* task)
{
    u8 i;
    s16 r3;
    u16 r4, r8;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    r3 = task->data[2] >> 8;
    r4 = task->data[1];
    r8 = 384;
    task->data[1] += 0x400;
    if (task->data[2] <= 0x1FFF)
        task->data[2] += 0x180;

    for (i = 0; i < 160; i++, r4 += r8)
    {

        s16 var = r4 >> 8;
        asm("");
        gUnknown_03004DE0[0][i] = (*(struct TransitionData *) (gSharedMem + 0xC000)).field_16 + Sin(var, r3);
        asm("");
    }

    if (++task->data[3] == 81)
    {
        task->data[4]++;
        BeginNormalPaletteFade(-1, -2, 0, 0x10, 0);
    }

    if (task->data[4] != 0 && !gPaletteFade.active)
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Ripple));

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static void VBlankCB_Phase2_Transition_Ripple(void)
{
    VBlankCB_BattleTransition();
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((320)/(16/8))); dmaRegs[2]; };
}

static void HBlankCB_Phase2_Transition_Ripple(void)
{
    u16 var = gUnknown_03004DE0[1][(*(vu16 *)(0x4000000 + 0x6))];
    (*(vu16 *)(0x4000000 + 0x16)) = var;
    (*(vu16 *)(0x4000000 + 0x1a)) = var;
    (*(vu16 *)(0x4000000 + 0x1e)) = var;
}

static void Phase2Task_Transition_Wave(u8 taskID)
{
    while (sPhase2_Transition_Wave_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Wave_Func1(struct Task* task)
{
    u8 i;

    sub_811D658();
    dp12_8087EA4();

    (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ = 63;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT = 0;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_6 = 240;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V = 160;

    for (i = 0; i < 160; i++)
    {
        gUnknown_03004DE0[1][i] = 242;
    }

    SetVBlankCallback(VBlankCB_Phase2_Transition_Wave);

    task->data[0]++;
    return 1;
}

static bool8 Phase2_Transition_Wave_Func2(struct Task* task)
{
    u8 i, r5;
    u16* toStore;
    bool8 nextFunc;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;
    toStore = gUnknown_03004DE0[0];
    r5 = task->data[2];
    task->data[2] += 16;
    task->data[1] += 8;

    for (i = 0, nextFunc = 1; i < 160; i++, r5 += 4, toStore++)
    {
        s16 value = task->data[1] + Sin(r5, 40);
        if (value < 0)
            value = 0;
        if (value > 240)
            value = 240;
        *toStore = (value << 8) | (0xF1);
        if (value < 240)
            nextFunc = 0;
    }
    if (nextFunc)
        task->data[0]++;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Transition_Wave_Func3(struct Task* task)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    sub_811D6D4();
    DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Wave));
    return 0;
}

static void VBlankCB_Phase2_Transition_Wave(void)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    VBlankCB_BattleTransition();
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA != 0)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((320)/(16/8))); dmaRegs[2]; };
    (*(vu16 *)(0x4000000 + 0x48)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ;
    (*(vu16 *)(0x4000000 + 0x4a)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT;
    (*(vu16 *)(0x4000000 + 0x44)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V;
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xb0); dmaRegs[0] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[1] = (vu32)(&(*(vu16 *)(0x4000000 + 0x40))); dmaRegs[2] = (vu32)(0xA2400001); dmaRegs[2]; };
}





static void Phase2Task_Transition_Sydney(u8 taskID)
{
    gTasks[taskID].data[15] = MUGSHOT_SYDNEY;
    Phase2Task_MugShotTransition(taskID);
}

static void Phase2Task_Transition_Phoebe(u8 taskID)
{
    gTasks[taskID].data[15] = MUGSHOT_PHOEBE;
    Phase2Task_MugShotTransition(taskID);
}

static void Phase2Task_Transition_Glacia(u8 taskID)
{
    gTasks[taskID].data[15] = MUGSHOT_GLACIA;
    Phase2Task_MugShotTransition(taskID);
}

static void Phase2Task_Transition_Drake(u8 taskID)
{
    gTasks[taskID].data[15] = MUGSHOT_DRAKE;
    Phase2Task_MugShotTransition(taskID);
}

static void Phase2Task_Transition_Steven(u8 taskID)
{
    gTasks[taskID].data[15] = MUGSHOT_STEVEN;
    Phase2Task_MugShotTransition(taskID);
}

static void Phase2Task_MugShotTransition(u8 taskID)
{
    while (sPhase2_Mugshot_Transition_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Mugshot_Func1(struct Task* task)
{
    u8 i;

    sub_811D658();
    dp12_8087EA4();
    Mugshots_CreateOpponentPlayerSprites(task);

    task->data[1] = 0;
    task->data[2] = 1;
    task->data[3] = 239;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ = 63;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT = 62;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V = 160;

    for (i = 0; i < 160; i++)
    {
        gUnknown_03004DE0[1][i] = 0xF0F1;
    }

    SetVBlankCallback(VBlankCB0_Phase2_Mugshots);

    task->data[0]++;
    return 0;
}

static bool8 Phase2_Mugshot_Func2(struct Task* task)
{
    s16 i, j;
    u16 *dst1, *dst2;
    const u16* MugshotsMap;

    MugshotsMap = sMugshotsTilemap;
    sub_811D6A8(&dst1, &dst2);
    CpuSet(sUnknown_083FC348, dst2, 0xF0);
    LoadPalette(sOpponentMugshotsPals[task->data[15]], 0xF0, 0x20);
    LoadPalette(sPlayerMugshotsPals[gSaveBlock2.playerGender], 0xFA, 0xC);

    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 32; j++, MugshotsMap++)
        {
            dst1[i * 32 + j] = *MugshotsMap | 0xF000;
        }
    }

    (*(vu16 *)(0x4000000 + 0x200)) |= (1 << 1);
    (*(vu16 *)(0x4000000 + 0x4)) |= 0x0010;
    SetHBlankCallback(HBlankCB_Phase2_Mugshots);
    task->data[0]++;
    return 0;
}

static bool8 Phase2_Mugshot_Func3(struct Task* task)
{
    u8 i, r5;
    u16* toStore;
    s16 value;
    s32 mergedValue;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    toStore = gUnknown_03004DE0[0];
    r5 = task->data[1];
    task->data[1] += 0x10;

    for (i = 0; i < 80; i++, toStore++, r5 += 0x10)
    {
        value = task->data[2] + Sin(r5, 0x10);
        if (value < 0)
            value = 1;
        if (value > 0xF0)
            value = 0xF0;
        *toStore = value;
    }
    for (; i < 160; i++, toStore++, r5 += 0x10)
    {
        value = task->data[3] - Sin(r5, 0x10);
        if (value < 0)
            value = 0;
        if (value > 0xEF)
            value = 0xEF;
        *toStore = (value << 8) | (0xF0);
    }

    task->data[2] += 8;
    task->data[3] -= 8;
    if (task->data[2] > 0xF0)
        task->data[2] = 0xF0;
    if (task->data[3] < 0)
        task->data[3] = 0;
    mergedValue = *(s32*)(&task->data[2]);
    if (mergedValue == 0xF0)
        task->data[0]++;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_18 -= 8;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_1A += 8;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Mugshot_Func4(struct Task* task)
{
    u8 i;
    u16* toStore;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    for (i = 0, toStore = gUnknown_03004DE0[0]; i < 160; i++, toStore++)
    {
        *toStore = 0xF0;
    }

    task->data[0]++;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_18 -= 8;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_1A += 8;

    sub_811CA10(task->data[13], 0);
    sub_811CA10(task->data[14], 1);
    sub_811CA28(task->data[13]);

    PlaySE(SE_BT_START);

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Mugshot_Func5(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_18 -= 8;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_1A += 8;
    if (sub_811CA44(task->data[13]))
    {
        task->data[0]++;
        sub_811CA28(task->data[14]);
    }
    return 0;
}

static bool8 Phase2_Mugshot_Func6(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_18 -= 8;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_1A += 8;
    if (sub_811CA44(task->data[14]))
    {
        (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;
        SetVBlankCallback(((void *)0));
        { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
        memset(gUnknown_03004DE0[0], 0, 0x140);
        memset(gUnknown_03004DE0[1], 0, 0x140);
        (*(vu16 *)(0x4000000 + 0x40)) = 0xF0;
        (*(vu16 *)(0x4000000 + 0x54)) = 0;
        task->data[0]++;
        task->data[3] = 0;
        task->data[4] = 0;
        (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDCNT = 0xBF;
        SetVBlankCallback(VBlankCB1_Phase2_Mugshots);
    }
    return 0;
}

static bool8 Phase2_Mugshot_Func7(struct Task* task)
{
    bool32 r6;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;
    r6 = 1;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_18 -= 8;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_1A += 8;

    if (task->data[4] < 0x50)
        task->data[4] += 2;
    if (task->data[4] > 0x50)
        task->data[4] = 0x50;

    if (++task->data[3] & 1)
    {
        s16 i;
        for (i = 0, r6 = 0; i <= task->data[4]; i++)
        {
            s16 index1 = 0x50 - i;
            s16 index2 = 0x50 + i;
            if (gUnknown_03004DE0[0][index1] <= 15)
            {
                r6 = 1;
                gUnknown_03004DE0[0][index1]++;
            }
            if (gUnknown_03004DE0[0][index2] <= 15)
            {
                r6 = 1;
                gUnknown_03004DE0[0][index2]++;
            }
        }
    }

    if (task->data[4] == 0x50 && !r6)
        task->data[0]++;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Mugshot_Func8(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;
    BlendPalettes(-1, 0x10, 0x7FFF);
    (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDCNT = 0xFF;
    task->data[3] = 0;

    task->data[0]++;
    return 1;
}

static bool8 Phase2_Mugshot_Func9(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    task->data[3]++;
    memset(gUnknown_03004DE0[0], task->data[3], 0x140);
    if (task->data[3] > 15)
        task->data[0]++;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Mugshot_Func10(struct Task* task)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    sub_811D6D4();
    DestroyTask(FindTaskIdByFunc(task->func));
    return 0;
}

static void VBlankCB0_Phase2_Mugshots(void)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    VBlankCB_BattleTransition();
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA != 0)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((320)/(16/8))); dmaRegs[2]; };
    (*(vu16 *)(0x4000000 + 0x12)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).field_1C;
    (*(vu16 *)(0x4000000 + 0x48)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ;
    (*(vu16 *)(0x4000000 + 0x4a)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT;
    (*(vu16 *)(0x4000000 + 0x44)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V;
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xb0); dmaRegs[0] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[1] = (vu32)(&(*(vu16 *)(0x4000000 + 0x40))); dmaRegs[2] = (vu32)(0xA2400001); dmaRegs[2]; };
}

static void VBlankCB1_Phase2_Mugshots(void)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    VBlankCB_BattleTransition();
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA != 0)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((320)/(16/8))); dmaRegs[2]; };
    (*(vu16 *)(0x4000000 + 0x50)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDCNT;
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xb0); dmaRegs[0] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[1] = (vu32)(&(*(vu16 *)(0x4000000 + 0x54))); dmaRegs[2] = (vu32)(0xA2400001); dmaRegs[2]; };
}

static void HBlankCB_Phase2_Mugshots(void)
{
    if ((*(vu16 *)(0x4000000 + 0x6)) < 80)
        (*(vu16 *)(0x4000000 + 0x10)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).field_18;
    else
        (*(vu16 *)(0x4000000 + 0x10)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).field_1A;
}

static void Mugshots_CreateOpponentPlayerSprites(struct Task* task)
{
    struct Sprite *opponentSprite, *playerSprite;

    s16 mugshotID = task->data[15];
    task->data[13] = CreateTrainerSprite(sMugshotsTrainerPicIDsTable[mugshotID],
                                                     sMugshotsOpponentCoords[mugshotID][0] - 32,
                                                     sMugshotsOpponentCoords[mugshotID][1] + 42,
                                                     0, (&gSharedMem[0xC03C]));
    task->data[14] = CreateTrainerSprite(gSaveBlock2.playerGender, 272, 106, 0, (&gSharedMem[0xC03C]));

    opponentSprite = &gSprites[task->data[13]];
    playerSprite = &gSprites[task->data[14]];

    opponentSprite->callback = sub_811C90C;
    playerSprite->callback = sub_811C90C;

    opponentSprite->oam.affineMode = 3;
    playerSprite->oam.affineMode = 3;

    opponentSprite->oam.matrixNum = AllocOamMatrix();
    playerSprite->oam.matrixNum = AllocOamMatrix();

    opponentSprite->oam.shape = 1;
    playerSprite->oam.shape = 1;

    opponentSprite->oam.size = 3;
    playerSprite->oam.size = 3;

    CalcCenterToCornerVec(opponentSprite, 1, 3, 3);
    CalcCenterToCornerVec(playerSprite, 1, 3, 3);

    SetOamMatrixRotationScaling(opponentSprite->oam.matrixNum, sMugshotsOpponentRotationScales[mugshotID][0], sMugshotsOpponentRotationScales[mugshotID][1], 0);
    SetOamMatrixRotationScaling(playerSprite->oam.matrixNum, -512, 0x200, 0);
}

static void sub_811C90C(struct Sprite* sprite)
{
    while (sUnknown_083FD880[sprite->data[0]](sprite));
}

static bool8 sub_811C934(struct Sprite* sprite)
{
    return 0;
}

static bool8 sub_811C938(struct Sprite* sprite)
{
    s16 arr0[2];
    s16 arr1[2];

    memcpy(arr0, sUnknown_083FD89C, sizeof(sUnknown_083FD89C));
    memcpy(arr1, sUnknown_083FD8A0, sizeof(sUnknown_083FD8A0));

    sprite->data[0]++;
    sprite->data[1] = arr0[sprite->data[7]];
    sprite->data[2] = arr1[sprite->data[7]];
    return 1;
}

static bool8 sub_811C984(struct Sprite* sprite)
{
    sprite->pos1.x += sprite->data[1];
    if (sprite->data[7] && sprite->pos1.x < 133)
        sprite->data[0]++;
    else if (!sprite->data[7] && sprite->pos1.x > 103)
        sprite->data[0]++;
    return 0;
}

static bool8 sub_811C9B8(struct Sprite* sprite)
{
    sprite->data[1] += sprite->data[2];
    sprite->pos1.x += sprite->data[1];
    if (sprite->data[1] == 0)
    {
        sprite->data[0]++;
        sprite->data[2] = -sprite->data[2];
        sprite->data[6] = 1;
    }
    return 0;
}

static bool8 sub_811C9E4(struct Sprite* sprite)
{
    sprite->data[1] += sprite->data[2];
    sprite->pos1.x += sprite->data[1];
    if (sprite->pos1.x < -31 || sprite->pos1.x > 271)
        sprite->data[0]++;
    return 0;
}

static void sub_811CA10(s16 spriteID, s16 value)
{
    gSprites[spriteID].data[7] = value;
}

static void sub_811CA28(s16 spriteID)
{
    gSprites[spriteID].data[0]++;
}

static s16 sub_811CA44(s16 spriteID)
{
    return gSprites[spriteID].data[6];
}





static void Phase2Task_Transition_Slice(u8 taskID)
{
    while (sPhase2_Transition_Slice_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Slice_Func1(struct Task* task)
{
    u16 i;

    sub_811D658();
    dp12_8087EA4();

    task->data[2] = 256;
    task->data[3] = 1;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ = 63;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT = 0;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V = 160;

    for (i = 0; i < 160; i++)
    {
        gUnknown_03004DE0[1][i] = (*(struct TransitionData *) (gSharedMem + 0xC000)).field_14;
        gUnknown_03004DE0[1][160 + i] = 0xF0;
    }

    (*(vu16 *)(0x4000000 + 0x200)) |= (1 << 1);
    (*(vu16 *)(0x4000000 + 0x4)) |= 0x0010;

    SetVBlankCallback(VBlankCB_Phase2_Transition_Slice);
    SetHBlankCallback(HBlankCB_Phase2_Transition_Slice);

    task->data[0]++;
    return 1;
}

static bool8 Phase2_Transition_Slice_Func2(struct Task* task)
{
    u16 i;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    task->data[1] += (task->data[2] >> 8);
    if (task->data[1] > 0xF0)
        task->data[1] = 0xF0;
    if (task->data[2] <= 0xFFF)
        task->data[2] += task->data[3];
    if (task->data[3] < 128)
        task->data[3] <<= 1;

    for (i = 0; i < 160; i++)
    {
        u16* storeLoc1 = &gUnknown_03004DE0[0][i];
        u16* storeLoc2 = &gUnknown_03004DE0[0][i + 160];
        if (1 & i)
        {
            *storeLoc1 = (*(struct TransitionData *) (gSharedMem + 0xC000)).field_14 + task->data[1];
            *storeLoc2 = 0xF0 - task->data[1];
        }
        else
        {
            *storeLoc1 = (*(struct TransitionData *) (gSharedMem + 0xC000)).field_14 - task->data[1];
            *storeLoc2 = (task->data[1] << 8) | (0xF1);
        }
    }

    if (task->data[1] > 0xEF)
        task->data[0]++;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Transition_Slice_Func3(struct Task* task)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    sub_811D6D4();
    DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Slice));
    return 0;
}

static void VBlankCB_Phase2_Transition_Slice(void)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    VBlankCB_BattleTransition();
    (*(vu16 *)(0x4000000 + 0x48)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ;
    (*(vu16 *)(0x4000000 + 0x4a)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT;
    (*(vu16 *)(0x4000000 + 0x44)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V;
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((640)/(16/8))); dmaRegs[2]; };
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xb0); dmaRegs[0] = (vu32)(&gUnknown_03004DE0[1][160]); dmaRegs[1] = (vu32)(&(*(vu16 *)(0x4000000 + 0x40))); dmaRegs[2] = (vu32)(0xA2400001); dmaRegs[2]; };
}

static void HBlankCB_Phase2_Transition_Slice(void)
{
    u16 var = gUnknown_03004DE0[1][(*(vu16 *)(0x4000000 + 0x6))];
    (*(vu16 *)(0x4000000 + 0x14)) = var;
    (*(vu16 *)(0x4000000 + 0x18)) = var;
    (*(vu16 *)(0x4000000 + 0x1c)) = var;
}

static void Phase2Task_Transition_WhiteFade(u8 taskID)
{
    while (sPhase2_Transition_WhiteFade_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_WhiteFade_Func1(struct Task* task)
{
    u16 i;

    sub_811D658();
    dp12_8087EA4();

    (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDCNT = 0xBF;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDY = 0;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ = 0x1E;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT = 0x3F;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V = 0xA0;

    for (i = 0; i < 160; i++)
    {
        gUnknown_03004DE0[1][i] = 0;
        gUnknown_03004DE0[1][i + 160] = 0xF0;
    }

    (*(vu16 *)(0x4000000 + 0x200)) |= (1 << 1);
    (*(vu16 *)(0x4000000 + 0x4)) |= 0x0010;

    SetHBlankCallback(HBlankCB_Phase2_Transition_WhiteFade);
    SetVBlankCallback(VBlankCB0_Phase2_Transition_WhiteFade);

    task->data[0]++;
    return 0;
}

static bool8 Phase2_Transition_WhiteFade_Func2(struct Task* task)
{
    s16 i, posY;
    s16 arr1[8];
    struct Sprite* sprite;

    memcpy(arr1, sUnknown_083FD8C4, sizeof(sUnknown_083FD8C4));
    for (i = 0, posY = 0; i < 8; i++, posY += 0x14)
    {
        sprite = &gSprites[CreateInvisibleSprite(sub_811CFD0)];
        sprite->pos1.x = 0xF0;
        sprite->pos1.y = posY;
        sprite->data[5] = arr1[i];
    }
    sprite->data[6]++;

    task->data[0]++;
    return 0;
}

static bool8 Phase2_Transition_WhiteFade_Func3(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).field_20 > 7)
    {
        BlendPalettes(-1, 0x10, 0x7FFF);
        task->data[0]++;
    }
    return 0;
}

static bool8 Phase2_Transition_WhiteFade_Func4(struct Task* task)
{
    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    SetVBlankCallback(0);
    SetHBlankCallback(0);

    (*(struct TransitionData *) (gSharedMem + 0xC000)).field_6 = 0xF0;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDY = 0;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDCNT = 0xFF;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ = 0x3F;

    SetVBlankCallback(VBlankCB1_Phase2_Transition_WhiteFade);

    task->data[0]++;
    return 0;
}

static bool8 Phase2_Transition_WhiteFade_Func5(struct Task* task)
{
   if (++(*(struct TransitionData *) (gSharedMem + 0xC000)).BLDY > 16)
   {
       sub_811D6D4();
       DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_WhiteFade));
   }
   return 0;
}

static void VBlankCB0_Phase2_Transition_WhiteFade(void)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    VBlankCB_BattleTransition();
    (*(vu16 *)(0x4000000 + 0x50)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDCNT;
    (*(vu16 *)(0x4000000 + 0x48)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ;
    (*(vu16 *)(0x4000000 + 0x4a)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT;
    (*(vu16 *)(0x4000000 + 0x44)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).field_6;
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((640)/(16/8))); dmaRegs[2]; };
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xb0); dmaRegs[0] = (vu32)(&gUnknown_03004DE0[1][160]); dmaRegs[1] = (vu32)(&(*(vu16 *)(0x4000000 + 0x40))); dmaRegs[2] = (vu32)(0xA2400001); dmaRegs[2]; };
}

static void VBlankCB1_Phase2_Transition_WhiteFade(void)
{
    VBlankCB_BattleTransition();
    (*(vu16 *)(0x4000000 + 0x54)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDY;
    (*(vu16 *)(0x4000000 + 0x50)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).BLDCNT;
    (*(vu16 *)(0x4000000 + 0x48)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ;
    (*(vu16 *)(0x4000000 + 0x4a)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT;
    (*(vu16 *)(0x4000000 + 0x40)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).field_6;
    (*(vu16 *)(0x4000000 + 0x44)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V;
}

static void HBlankCB_Phase2_Transition_WhiteFade(void)
{
    (*(vu16 *)(0x4000000 + 0x54)) = gUnknown_03004DE0[1][(*(vu16 *)(0x4000000 + 0x6))];
}

static void sub_811CFD0(struct Sprite* sprite)
{
    if (sprite->data[5])
    {
        sprite->data[5]--;
        if (sprite->data[6])
            (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 1;
    }
    else
    {
        u16 i;
        u16* ptr1 = &gUnknown_03004DE0[0][sprite->pos1.y];
        u16* ptr2 = &gUnknown_03004DE0[0][sprite->pos1.y + 160];
        for (i = 0; i < 20; i++)
        {
            ptr1[i] = sprite->data[0] >> 8;
            ptr2[i] = (u8)(sprite->pos1.x);
        }
        if (sprite->pos1.x == 0 && sprite->data[0] == 0x1000)
            sprite->data[1] = 1;

        sprite->pos1.x -= 16;
        sprite->data[0] += 0x80;

        if (sprite->pos1.x < 0)
            sprite->pos1.x = 0;
        if (sprite->data[0] > 0x1000)
            sprite->data[0] = 0x1000;

        if (sprite->data[6])
            (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 1;

        if (sprite->data[1])
        {
            if (sprite->data[6] == 0 || ((*(struct TransitionData *) (gSharedMem + 0xC000)).field_20 > 6 && sprite->data[2]++ > 7))
            {
                (*(struct TransitionData *) (gSharedMem + 0xC000)).field_20++;
                DestroySprite(sprite);
            }
        }
    }
}

static void Phase2Task_Transition_GridSquares(u8 taskID)
{
    while (sPhase2_Transition_GridSquares_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_GridSquares_Func1(struct Task* task)
{
    u16 *dst1, *dst2;

    sub_811D6A8(&dst1, &dst2);
    CpuSet(sShrinkingBoxTileset, dst2, 0x10);
    { vu16 tmp = (vu16)(0xF000); CpuSet((void *)&tmp, dst1, 0x00000000 | 0x01000000 | ((0x800)/(16/8) & 0x1FFFFF)); };
    LoadPalette(gFieldEffectObjectPalette10, 0xF0, 0x20);

    task->data[0]++;
    return 0;
}

static bool8 Phase2_Transition_GridSquares_Func2(struct Task* task)
{
    u16* dst1;

    if (task->data[1] == 0)
    {
        sub_811D690(&dst1);
        task->data[1] = 3;
        task->data[2]++;
        CpuSet(sShrinkingBoxTileset + (task->data[2] * 8), dst1, 0x10);
        if (task->data[2] > 0xD)
        {
            task->data[0]++;
            task->data[1] = 16;
        }
    }

    task->data[1]--;
    return 0;
}

static bool8 Phase2_Transition_GridSquares_Func3(struct Task* task)
{
    if (--task->data[1] == 0)
    {
        sub_811D6D4();
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_GridSquares));
    }
    return 0;
}

static void Phase2Task_Transition_Shards(u8 taskID)
{
    while (sPhase2_Transition_Shards_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase2_Transition_Shards_Func1(struct Task* task)
{
    u16 i;

    sub_811D658();
    dp12_8087EA4();

    (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ = 0x3F;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT = 0;
    (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V = 0xA0;

    for (i = 0; i < 160; i++)
    {
        gUnknown_03004DE0[0][i] = 0xF0;
    }

    CpuSet(gUnknown_03004DE0[0], gUnknown_03004DE0[1], 0xA0);
    SetVBlankCallback(VBlankCB_Phase2_Transition_Shards);

    task->data[0]++;
    return 1;
}

static bool8 Phase2_Transition_Shards_Func2(struct Task* task)
{
    sub_811D8FC((*(struct TransitionData *) (gSharedMem + 0xC000)).data,
                sUnknown_083FD8F4[task->data[1]][0],
                sUnknown_083FD8F4[task->data[1]][1],
                sUnknown_083FD8F4[task->data[1]][2],
                sUnknown_083FD8F4[task->data[1]][3],
                1, 1);
    task->data[2] = sUnknown_083FD8F4[task->data[1]][4];
    task->data[0]++;
    return 1;
}

static bool8 Phase2_Transition_Shards_Func3(struct Task* task)
{
    s16 i;
    bool8 nextFunc;

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA = 0;

    for (i = 0, nextFunc = 0; i < 16; i++)
    {
        s16 r3 = gUnknown_03004DE0[0][(*(struct TransitionData *) (gSharedMem + 0xC000)).data[3]] >> 8;
        s16 r4 = gUnknown_03004DE0[0][(*(struct TransitionData *) (gSharedMem + 0xC000)).data[3]] & 0xFF;
        if (task->data[2] == 0)
        {
            if (r3 < (*(struct TransitionData *) (gSharedMem + 0xC000)).data[2])
                r3 = (*(struct TransitionData *) (gSharedMem + 0xC000)).data[2];
            if (r3 > r4)
                r3 = r4;
        }
        else
        {
            if (r4 > (*(struct TransitionData *) (gSharedMem + 0xC000)).data[2])
                r4 = (*(struct TransitionData *) (gSharedMem + 0xC000)).data[2];
            if (r4 <= r3)
                r4 = r3;
        }
        gUnknown_03004DE0[0][(*(struct TransitionData *) (gSharedMem + 0xC000)).data[3]] = (r4) | (r3 << 8);
        if (nextFunc)
        {
            task->data[0]++;
            break;
        }
        else
            nextFunc = sub_811D978((*(struct TransitionData *) (gSharedMem + 0xC000)).data, 1, 1);
    }

    (*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA++;
    return 0;
}

static bool8 Phase2_Transition_Shards_Func4(struct Task* task)
{
    if (++task->data[1] < 7)
    {
        task->data[0]++;
        task->data[3] = sUnknown_083FD93A[task->data[1] - 1];
        return 1;
    }
    else
    {
        { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
        sub_811D6D4();
        DestroyTask(FindTaskIdByFunc(Phase2Task_Transition_Shards));
        return 0;
    }
}

static bool8 Phase2_Transition_Shards_Func5(struct Task* task)
{
    if (--task->data[3] == 0)
    {
        task->data[0] = 1;
        return 1;
    }
    else
        return 0;
}

static void VBlankCB_Phase2_Transition_Shards(void)
{
    { vu16 *dmaRegs = (vu16 *)(0x4000000 + 0xb0); dmaRegs[5] &= ~(0x3000 | 0x0800 | 0x0200); dmaRegs[5] &= ~0x8000; dmaRegs[5]; };
    VBlankCB_BattleTransition();
    if ((*(struct TransitionData *) (gSharedMem + 0xC000)).VBlank_DMA)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((320)/(16/8))); dmaRegs[2]; };
    (*(vu16 *)(0x4000000 + 0x48)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WININ;
    (*(vu16 *)(0x4000000 + 0x4a)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WINOUT;
    (*(vu16 *)(0x4000000 + 0x44)) = (*(struct TransitionData *) (gSharedMem + 0xC000)).WIN0V;
    (*(vu16 *)(0x4000000 + 0x40)) = gUnknown_03004DE0[1][0];
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xb0); dmaRegs[0] = (vu32)(gUnknown_03004DE0[1]); dmaRegs[1] = (vu32)(&(*(vu16 *)(0x4000000 + 0x40))); dmaRegs[2] = (vu32)(0xA2400001); dmaRegs[2]; };
}

static void CreatePhase1Task(s16 a0, s16 a1, s16 a2, s16 a3, s16 a4)
{
    u8 taskID = CreateTask(Phase1_Task_RunFuncs, 3);
    gTasks[taskID].data[1] = a0;
    gTasks[taskID].data[2] = a1;
    gTasks[taskID].data[3] = a2;
    gTasks[taskID].data[4] = a3;
    gTasks[taskID].data[5] = a4;
    gTasks[taskID].data[6] = a0;
}

static bool8 sub_811D52C(void)
{
    if (FindTaskIdByFunc(Phase1_Task_RunFuncs) == 0xFF)
        return 1;
    else
        return 0;
}

static void Phase1_Task_RunFuncs(u8 taskID)
{
    while (sPhase1_TransitionAll_Funcs[gTasks[taskID].data[0]](&gTasks[taskID]));
}

static bool8 Phase1_TransitionAll_Func1(struct Task* task)
{
    if (task->data[6] == 0 || --task->data[6] == 0)
    {
        task->data[6] = task->data[1];
        task->data[7] += task->data[4];
        if (task->data[7] > 16)
            task->data[7] = 16;
        BlendPalettes(-1, task->data[7], 0x2D6B);
    }
    if (task->data[7] > 15)
    {
        task->data[0]++;
        task->data[6] = task->data[2];
    }
    return 0;
}

static bool8 Phase1_TransitionAll_Func2(struct Task* task)
{
    if (task->data[6] == 0 || --task->data[6] == 0)
    {
        task->data[6] = task->data[2];
        task->data[7] -= task->data[5];
        if (task->data[7] < 0)
            task->data[7] = 0;
        BlendPalettes(-1, task->data[7], 0x2D6B);
    }
    if (task->data[7] == 0)
    {
        if (--task->data[3] == 0)
            DestroyTask(FindTaskIdByFunc(Phase1_Task_RunFuncs));
        else
        {
            task->data[6] = task->data[1];
            task->data[0] = 0;
        }
    }
    return 0;
}

static void sub_811D658(void)
{
    struct TransitionData* const* dummy = &sTransitionStructPtr;
    memset(*dummy, 0, sizeof(struct TransitionData));
    sub_8057B14(&(*(struct TransitionData *) (gSharedMem + 0xC000)).field_14, &(*(struct TransitionData *) (gSharedMem + 0xC000)).field_16);
}

static void VBlankCB_BattleTransition(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_811D690(u16** a0)
{
    u16 reg, *vram;

    reg = (*(vu16 *)(0x4000000 + 0x8)) >> 2;
    reg <<= 0xE;
    vram = (u16*)(0x6000000 + reg);

    *a0 = vram;
}

static void sub_811D6A8(u16** a0, u16** a1)
{
    u16 reg0, reg1, *vram0, *vram1;

    reg0 = (*(vu16 *)(0x4000000 + 0x8)) >> 8;
    reg1 = (*(vu16 *)(0x4000000 + 0x8)) >> 2;

    reg0 <<= 0xB;
    reg1 <<= 0xE;

    vram0 = (u16*)(0x6000000 + reg0);
    *a0 = vram0;

    vram1 = (u16*)(0x6000000 + reg1);
    *a1 = vram1;
}

static void sub_811D6D4(void)
{
    BlendPalettes(-1, 0x10, 0);
}

static void sub_811D6E8(s16* array, s16 sinAdd, s16 index, s16 indexIncrementer, s16 amplitude, s16 arrSize)
{
    u8 i;
    for (i = 0; arrSize > 0; arrSize--, i++, index += indexIncrementer)
    {
        array[i] = sinAdd + Sin(0xFF & index, amplitude);
    }
}

static void sub_811D764(u16* array, s16 a1, s16 a2, s16 a3)
{
    s16 i;

    memset(array, 0xA, 160 * sizeof(s16));
    for (i = 0; i < 64; i++)
    {
        s16 sinResult, cosResult;
        s16 toStoreOrr, r2, r3, toStore, r7, r8;

        sinResult = Sin(i, a3);
        cosResult = Cos(i, a3);

        toStoreOrr = a1 - sinResult;
        toStore = a1 + sinResult;
        r7 = a2 - cosResult;
        r8 = a2 + cosResult;

        if (toStoreOrr < 0)
            toStoreOrr = 0;
        if (toStore > 0xF0)
            toStore = 0xF0;
        if (r7 < 0)
            r7 = 0;
        if (r8 > 0x9F)
            r8 = 0x9F;

        toStore |= (toStoreOrr << 8);
        array[r7] = toStore;
        array[r8] = toStore;

        cosResult = Cos(i + 1, a3);
        r3 = a2 - cosResult;
        r2 = a2 + cosResult;

        if (r3 < 0)
            r3 = 0;
        if (r2 > 0x9F)
            r2 = 0x9F;

        while (r7 > r3)
            array[--r7] = toStore;
        while (r7 < r3)
            array[++r7] = toStore;

        while (r8 > r2)
            array[--r8] = toStore;
        while (r8 < r2)
            array[++r8] = toStore;
    }
}

static void sub_811D8FC(s16* data, s16 a1, s16 a2, s16 a3, s16 a4, s16 a5, s16 a6)
{
    data[0] = a1;
    data[1] = a2;
    data[2] = a1;
    data[3] = a2;
    data[4] = a3;
    data[5] = a4;
    data[6] = a5;
    data[7] = a6;
    data[8] = a3 - a1;
    if (data[8] < 0)
    {
        data[8] = -data[8];
        data[6] = -a5;
    }
    data[9] = a4 - a2;
    if (data[9] < 0)
    {
        data[9] = -data[9];
        data[7] = -a6;
    }
    data[10] = 0;
}

static bool8 sub_811D978(s16* data, bool8 a1, bool8 a2)
{
    u8 var;
    if (data[8] > data[9])
    {
        data[2] += data[6];
        data[10] += data[9];
        if (data[10] > data[8])
        {
            data[3] += data[7];
            data[10] -= data[8];
        }
    }
    else
    {
        data[3] += data[7];
        data[10] += data[8];
        if (data[10] > data[9])
        {
            data[2] += data[6];
            data[10] -= data[9];
        }
    }
    var = 0;
    if ((data[6] > 0 && data[2] >= data[4]) || (data[6] < 0 && data[2] <= data[4]))
    {
        var++;
        if (a1)
            data[2] = data[4];
    }
    if ((data[7] > 0 && data[3] >= data[5]) || (data[7] < 0 && data[3] <= data[5]))
    {
        var++;
        if (a2)
            data[3] = data[5];
    }
    if (var == 2)
        return 1;
    else
        return 0;
}
