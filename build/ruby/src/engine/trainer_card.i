# 1 "src/engine/trainer_card.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/engine/trainer_card.c"
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
# 2 "src/engine/trainer_card.c" 2
# 1 "include/trainer_card.h" 1



struct TrainerCard {
             u8 gender;
             u8 stars;
             bool8 hasPokedex;
             bool8 var_3;
             bool8 var_4;
             u8 var_5;
             u16 firstHallOfFameA;
             u16 firstHallOfFameB;
             u16 firstHallOfFameC;
             u16 pokedexSeen;
             u16 trainerId;
             u16 playTimeHours;
             u16 playTimeMinutes;
             u16 linkBattleWins;
             u16 linkBattleLosses;
             u16 battleTowerWins;
             u16 battleTowerLosses;
             u16 contestsWithFriends;
             u16 pokeblocksWithFriends;
             u16 pokemonTrades;
             u16 var_22;
             u32 money;
             u16 var_28[4];
             u8 playerName[8];
};

void sub_8093110(void (*)(void));
void sub_8093130(u8, void (*)(void));
void sub_8093390(struct TrainerCard *);
u8 sub_80934C4(u8 id);

extern struct TrainerCard gTrainerCards[4];
# 3 "src/engine/trainer_card.c" 2
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
# 4 "src/engine/trainer_card.c" 2
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
# 5 "src/engine/trainer_card.c" 2
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
# 6 "src/engine/trainer_card.c" 2
# 1 "include/graphics.h" 1




extern const u8 gInterfaceGfx_PokeBall[];
extern const u8 gInterfacePal_PokeBall[];
extern const u8 gInterfaceGfx_GreatBall[];
extern const u8 gInterfacePal_GreatBall[];
extern const u8 gInterfaceGfx_SafariBall[];
extern const u8 gInterfacePal_SafariBall[];
extern const u8 gInterfaceGfx_UltraBall[];
extern const u8 gInterfacePal_UltraBall[];
extern const u8 gInterfaceGfx_MasterBall[];
extern const u8 gInterfacePal_MasterBall[];
extern const u8 gInterfaceGfx_NetBall[];
extern const u8 gInterfacePal_NetBall[];
extern const u8 gInterfaceGfx_DiveBall[];
extern const u8 gInterfacePal_DiveBall[];
extern const u8 gInterfaceGfx_NestBall[];
extern const u8 gInterfacePal_NestBall[];
extern const u8 gInterfaceGfx_RepeatBall[];
extern const u8 gInterfacePal_RepeatBall[];
extern const u8 gInterfaceGfx_TimerBall[];
extern const u8 gInterfacePal_TimerBall[];
extern const u8 gInterfaceGfx_LuxuryBall[];
extern const u8 gInterfacePal_LuxuryBall[];
extern const u8 gInterfaceGfx_PremierBall[];
extern const u8 gInterfacePal_PremierBall[];
extern const u8 gUnknown_08D030D0[];

extern const u8 gMonFootprint_QuestionMark[];


extern const u8 gMonFrontPic_Bulbasaur[];
extern const u8 gMonPalette_Bulbasaur[];
extern const u8 gMonBackPic_Bulbasaur[];
extern const u8 gMonShinyPalette_Bulbasaur[];
extern const u8 gMonIcon_Bulbasaur[];
extern const u8 gMonFootprint_Bulbasaur[];
extern const u8 gMonFrontPic_Ivysaur[];
extern const u8 gMonPalette_Ivysaur[];
extern const u8 gMonBackPic_Ivysaur[];
extern const u8 gMonShinyPalette_Ivysaur[];
extern const u8 gMonIcon_Ivysaur[];
extern const u8 gMonFootprint_Ivysaur[];
extern const u8 gMonFrontPic_Venusaur[];
extern const u8 gMonPalette_Venusaur[];
extern const u8 gMonBackPic_Venusaur[];
extern const u8 gMonShinyPalette_Venusaur[];
extern const u8 gMonIcon_Venusaur[];
extern const u8 gMonFootprint_Venusaur[];
extern const u8 gMonFrontPic_Charmander[];
extern const u8 gMonPalette_Charmander[];
extern const u8 gMonBackPic_Charmander[];
extern const u8 gMonShinyPalette_Charmander[];
extern const u8 gMonIcon_Charmander[];
extern const u8 gMonFootprint_Charmander[];
extern const u8 gMonFrontPic_Charmeleon[];
extern const u8 gMonPalette_Charmeleon[];
extern const u8 gMonBackPic_Charmeleon[];
extern const u8 gMonShinyPalette_Charmeleon[];
extern const u8 gMonIcon_Charmeleon[];
extern const u8 gMonFootprint_Charmeleon[];
extern const u8 gMonFrontPic_Charizard[];
extern const u8 gMonPalette_Charizard[];
extern const u8 gMonBackPic_Charizard[];
extern const u8 gMonShinyPalette_Charizard[];
extern const u8 gMonIcon_Charizard[];
extern const u8 gMonFootprint_Charizard[];
extern const u8 gMonFrontPic_Squirtle[];
extern const u8 gMonPalette_Squirtle[];
extern const u8 gMonBackPic_Squirtle[];
extern const u8 gMonShinyPalette_Squirtle[];
extern const u8 gMonIcon_Squirtle[];
extern const u8 gMonFootprint_Squirtle[];
extern const u8 gMonFrontPic_Wartortle[];
extern const u8 gMonPalette_Wartortle[];
extern const u8 gMonBackPic_Wartortle[];
extern const u8 gMonShinyPalette_Wartortle[];
extern const u8 gMonIcon_Wartortle[];
extern const u8 gMonFootprint_Wartortle[];
extern const u8 gMonFrontPic_Blastoise[];
extern const u8 gMonPalette_Blastoise[];
extern const u8 gMonBackPic_Blastoise[];
extern const u8 gMonShinyPalette_Blastoise[];
extern const u8 gMonIcon_Blastoise[];
extern const u8 gMonFootprint_Blastoise[];
extern const u8 gMonFrontPic_Caterpie[];
extern const u8 gMonPalette_Caterpie[];
extern const u8 gMonBackPic_Caterpie[];
extern const u8 gMonShinyPalette_Caterpie[];
extern const u8 gMonIcon_Caterpie[];
extern const u8 gMonFootprint_Caterpie[];
extern const u8 gMonFrontPic_Metapod[];
extern const u8 gMonPalette_Metapod[];
extern const u8 gMonBackPic_Metapod[];
extern const u8 gMonShinyPalette_Metapod[];
extern const u8 gMonIcon_Metapod[];
extern const u8 gMonFootprint_Metapod[];
extern const u8 gMonFrontPic_Butterfree[];
extern const u8 gMonPalette_Butterfree[];
extern const u8 gMonBackPic_Butterfree[];
extern const u8 gMonShinyPalette_Butterfree[];
extern const u8 gMonIcon_Butterfree[];
extern const u8 gMonFootprint_Butterfree[];
extern const u8 gMonFrontPic_Weedle[];
extern const u8 gMonPalette_Weedle[];
extern const u8 gMonBackPic_Weedle[];
extern const u8 gMonShinyPalette_Weedle[];
extern const u8 gMonIcon_Weedle[];
extern const u8 gMonFootprint_Weedle[];
extern const u8 gMonFrontPic_Kakuna[];
extern const u8 gMonPalette_Kakuna[];
extern const u8 gMonBackPic_Kakuna[];
extern const u8 gMonShinyPalette_Kakuna[];
extern const u8 gMonIcon_Kakuna[];
extern const u8 gMonFootprint_Kakuna[];
extern const u8 gMonFrontPic_Beedrill[];
extern const u8 gMonPalette_Beedrill[];
extern const u8 gMonBackPic_Beedrill[];
extern const u8 gMonShinyPalette_Beedrill[];
extern const u8 gMonIcon_Beedrill[];
extern const u8 gMonFootprint_Beedrill[];
extern const u8 gMonFrontPic_Pidgey[];
extern const u8 gMonPalette_Pidgey[];
extern const u8 gMonBackPic_Pidgey[];
extern const u8 gMonShinyPalette_Pidgey[];
extern const u8 gMonIcon_Pidgey[];
extern const u8 gMonFootprint_Pidgey[];
extern const u8 gMonFrontPic_Pidgeotto[];
extern const u8 gMonPalette_Pidgeotto[];
extern const u8 gMonBackPic_Pidgeotto[];
extern const u8 gMonShinyPalette_Pidgeotto[];
extern const u8 gMonIcon_Pidgeotto[];
extern const u8 gMonFootprint_Pidgeotto[];
extern const u8 gMonFrontPic_Pidgeot[];
extern const u8 gMonPalette_Pidgeot[];
extern const u8 gMonBackPic_Pidgeot[];
extern const u8 gMonShinyPalette_Pidgeot[];
extern const u8 gMonIcon_Pidgeot[];
extern const u8 gMonFootprint_Pidgeot[];
extern const u8 gMonFrontPic_Rattata[];
extern const u8 gMonPalette_Rattata[];
extern const u8 gMonBackPic_Rattata[];
extern const u8 gMonShinyPalette_Rattata[];
extern const u8 gMonIcon_Rattata[];
extern const u8 gMonFootprint_Rattata[];
extern const u8 gMonFrontPic_Raticate[];
extern const u8 gMonPalette_Raticate[];
extern const u8 gMonBackPic_Raticate[];
extern const u8 gMonShinyPalette_Raticate[];
extern const u8 gMonIcon_Raticate[];
extern const u8 gMonFootprint_Raticate[];
extern const u8 gMonFrontPic_Spearow[];
extern const u8 gMonPalette_Spearow[];
extern const u8 gMonBackPic_Spearow[];
extern const u8 gMonShinyPalette_Spearow[];
extern const u8 gMonIcon_Spearow[];
extern const u8 gMonFootprint_Spearow[];
extern const u8 gMonFrontPic_Fearow[];
extern const u8 gMonPalette_Fearow[];
extern const u8 gMonBackPic_Fearow[];
extern const u8 gMonShinyPalette_Fearow[];
extern const u8 gMonIcon_Fearow[];
extern const u8 gMonFootprint_Fearow[];
extern const u8 gMonFrontPic_Ekans[];
extern const u8 gMonPalette_Ekans[];
extern const u8 gMonBackPic_Ekans[];
extern const u8 gMonShinyPalette_Ekans[];
extern const u8 gMonIcon_Ekans[];
extern const u8 gMonFootprint_Ekans[];
extern const u8 gMonFrontPic_Arbok[];
extern const u8 gMonPalette_Arbok[];
extern const u8 gMonBackPic_Arbok[];
extern const u8 gMonShinyPalette_Arbok[];
extern const u8 gMonIcon_Arbok[];
extern const u8 gMonFootprint_Arbok[];
extern const u8 gMonFrontPic_Pikachu[];
extern const u8 gMonPalette_Pikachu[];
extern const u8 gMonBackPic_Pikachu[];
extern const u8 gMonShinyPalette_Pikachu[];
extern const u8 gMonIcon_Pikachu[];
extern const u8 gMonFootprint_Pikachu[];
extern const u8 gMonFrontPic_Raichu[];
extern const u8 gMonPalette_Raichu[];
extern const u8 gMonBackPic_Raichu[];
extern const u8 gMonShinyPalette_Raichu[];
extern const u8 gMonIcon_Raichu[];
extern const u8 gMonFootprint_Raichu[];
extern const u8 gMonFrontPic_Sandshrew[];
extern const u8 gMonPalette_Sandshrew[];
extern const u8 gMonBackPic_Sandshrew[];
extern const u8 gMonShinyPalette_Sandshrew[];
extern const u8 gMonIcon_Sandshrew[];
extern const u8 gMonFootprint_Sandshrew[];
extern const u8 gMonFrontPic_Sandslash[];
extern const u8 gMonPalette_Sandslash[];
extern const u8 gMonBackPic_Sandslash[];
extern const u8 gMonShinyPalette_Sandslash[];
extern const u8 gMonIcon_Sandslash[];
extern const u8 gMonFootprint_Sandslash[];
extern const u8 gMonFrontPic_NidoranF[];
extern const u8 gMonPalette_NidoranF[];
extern const u8 gMonBackPic_NidoranF[];
extern const u8 gMonShinyPalette_NidoranF[];
extern const u8 gMonIcon_NidoranF[];
extern const u8 gMonFootprint_NidoranF[];
extern const u8 gMonFrontPic_Nidorina[];
extern const u8 gMonPalette_Nidorina[];
extern const u8 gMonBackPic_Nidorina[];
extern const u8 gMonShinyPalette_Nidorina[];
extern const u8 gMonIcon_Nidorina[];
extern const u8 gMonFootprint_Nidorina[];
extern const u8 gMonFrontPic_Nidoqueen[];
extern const u8 gMonPalette_Nidoqueen[];
extern const u8 gMonBackPic_Nidoqueen[];
extern const u8 gMonShinyPalette_Nidoqueen[];
extern const u8 gMonIcon_Nidoqueen[];
extern const u8 gMonFootprint_Nidoqueen[];
extern const u8 gMonFrontPic_NidoranM[];
extern const u8 gMonPalette_NidoranM[];
extern const u8 gMonBackPic_NidoranM[];
extern const u8 gMonShinyPalette_NidoranM[];
extern const u8 gMonIcon_NidoranM[];
extern const u8 gMonFootprint_NidoranM[];
extern const u8 gMonFrontPic_Nidorino[];
extern const u8 gMonPalette_Nidorino[];
extern const u8 gMonBackPic_Nidorino[];
extern const u8 gMonShinyPalette_Nidorino[];
extern const u8 gMonIcon_Nidorino[];
extern const u8 gMonFootprint_Nidorino[];
extern const u8 gMonFrontPic_Nidoking[];
extern const u8 gMonPalette_Nidoking[];
extern const u8 gMonBackPic_Nidoking[];
extern const u8 gMonShinyPalette_Nidoking[];
extern const u8 gMonIcon_Nidoking[];
extern const u8 gMonFootprint_Nidoking[];
extern const u8 gMonFrontPic_Clefairy[];
extern const u8 gMonPalette_Clefairy[];
extern const u8 gMonBackPic_Clefairy[];
extern const u8 gMonShinyPalette_Clefairy[];
extern const u8 gMonIcon_Clefairy[];
extern const u8 gMonFootprint_Clefairy[];
extern const u8 gMonFrontPic_Clefable[];
extern const u8 gMonPalette_Clefable[];
extern const u8 gMonBackPic_Clefable[];
extern const u8 gMonShinyPalette_Clefable[];
extern const u8 gMonIcon_Clefable[];
extern const u8 gMonFootprint_Clefable[];
extern const u8 gMonFrontPic_Vulpix[];
extern const u8 gMonPalette_Vulpix[];
extern const u8 gMonBackPic_Vulpix[];
extern const u8 gMonShinyPalette_Vulpix[];
extern const u8 gMonIcon_Vulpix[];
extern const u8 gMonFootprint_Vulpix[];
extern const u8 gMonFrontPic_Ninetales[];
extern const u8 gMonPalette_Ninetales[];
extern const u8 gMonBackPic_Ninetales[];
extern const u8 gMonShinyPalette_Ninetales[];
extern const u8 gMonIcon_Ninetales[];
extern const u8 gMonFootprint_Ninetales[];
extern const u8 gMonFrontPic_Jigglypuff[];
extern const u8 gMonPalette_Jigglypuff[];
extern const u8 gMonBackPic_Jigglypuff[];
extern const u8 gMonShinyPalette_Jigglypuff[];
extern const u8 gMonIcon_Jigglypuff[];
extern const u8 gMonFootprint_Jigglypuff[];
extern const u8 gMonFrontPic_Wigglytuff[];
extern const u8 gMonPalette_Wigglytuff[];
extern const u8 gMonBackPic_Wigglytuff[];
extern const u8 gMonShinyPalette_Wigglytuff[];
extern const u8 gMonIcon_Wigglytuff[];
extern const u8 gMonFootprint_Wigglytuff[];
extern const u8 gMonFrontPic_Zubat[];
extern const u8 gMonPalette_Zubat[];
extern const u8 gMonBackPic_Zubat[];
extern const u8 gMonShinyPalette_Zubat[];
extern const u8 gMonIcon_Zubat[];
extern const u8 gMonFootprint_Zubat[];
extern const u8 gMonFrontPic_Golbat[];
extern const u8 gMonPalette_Golbat[];
extern const u8 gMonBackPic_Golbat[];
extern const u8 gMonShinyPalette_Golbat[];
extern const u8 gMonIcon_Golbat[];
extern const u8 gMonFootprint_Golbat[];
extern const u8 gMonFrontPic_Oddish[];
extern const u8 gMonPalette_Oddish[];
extern const u8 gMonBackPic_Oddish[];
extern const u8 gMonShinyPalette_Oddish[];
extern const u8 gMonIcon_Oddish[];
extern const u8 gMonFootprint_Oddish[];
extern const u8 gMonFrontPic_Gloom[];
extern const u8 gMonPalette_Gloom[];
extern const u8 gMonBackPic_Gloom[];
extern const u8 gMonShinyPalette_Gloom[];
extern const u8 gMonIcon_Gloom[];
extern const u8 gMonFootprint_Gloom[];
extern const u8 gMonFrontPic_Vileplume[];
extern const u8 gMonPalette_Vileplume[];
extern const u8 gMonBackPic_Vileplume[];
extern const u8 gMonShinyPalette_Vileplume[];
extern const u8 gMonIcon_Vileplume[];
extern const u8 gMonFootprint_Vileplume[];
extern const u8 gMonFrontPic_Paras[];
extern const u8 gMonPalette_Paras[];
extern const u8 gMonBackPic_Paras[];
extern const u8 gMonShinyPalette_Paras[];
extern const u8 gMonIcon_Paras[];
extern const u8 gMonFootprint_Paras[];
extern const u8 gMonFrontPic_Parasect[];
extern const u8 gMonPalette_Parasect[];
extern const u8 gMonBackPic_Parasect[];
extern const u8 gMonShinyPalette_Parasect[];
extern const u8 gMonIcon_Parasect[];
extern const u8 gMonFootprint_Parasect[];
extern const u8 gMonFrontPic_Venonat[];
extern const u8 gMonPalette_Venonat[];
extern const u8 gMonBackPic_Venonat[];
extern const u8 gMonShinyPalette_Venonat[];
extern const u8 gMonIcon_Venonat[];
extern const u8 gMonFootprint_Venonat[];
extern const u8 gMonFrontPic_Venomoth[];
extern const u8 gMonPalette_Venomoth[];
extern const u8 gMonBackPic_Venomoth[];
extern const u8 gMonShinyPalette_Venomoth[];
extern const u8 gMonIcon_Venomoth[];
extern const u8 gMonFootprint_Venomoth[];
extern const u8 gMonFrontPic_Diglett[];
extern const u8 gMonPalette_Diglett[];
extern const u8 gMonBackPic_Diglett[];
extern const u8 gMonShinyPalette_Diglett[];
extern const u8 gMonIcon_Diglett[];
extern const u8 gMonFootprint_Diglett[];
extern const u8 gMonFrontPic_Dugtrio[];
extern const u8 gMonPalette_Dugtrio[];
extern const u8 gMonBackPic_Dugtrio[];
extern const u8 gMonShinyPalette_Dugtrio[];
extern const u8 gMonIcon_Dugtrio[];
extern const u8 gMonFootprint_Dugtrio[];
extern const u8 gMonFrontPic_Meowth[];
extern const u8 gMonPalette_Meowth[];
extern const u8 gMonBackPic_Meowth[];
extern const u8 gMonShinyPalette_Meowth[];
extern const u8 gMonIcon_Meowth[];
extern const u8 gMonFootprint_Meowth[];
extern const u8 gMonFrontPic_Persian[];
extern const u8 gMonPalette_Persian[];
extern const u8 gMonBackPic_Persian[];
extern const u8 gMonShinyPalette_Persian[];
extern const u8 gMonIcon_Persian[];
extern const u8 gMonFootprint_Persian[];
extern const u8 gMonFrontPic_Psyduck[];
extern const u8 gMonPalette_Psyduck[];
extern const u8 gMonBackPic_Psyduck[];
extern const u8 gMonShinyPalette_Psyduck[];
extern const u8 gMonIcon_Psyduck[];
extern const u8 gMonFootprint_Psyduck[];
extern const u8 gMonFrontPic_Golduck[];
extern const u8 gMonPalette_Golduck[];
extern const u8 gMonBackPic_Golduck[];
extern const u8 gMonShinyPalette_Golduck[];
extern const u8 gMonIcon_Golduck[];
extern const u8 gMonFootprint_Golduck[];
extern const u8 gMonFrontPic_Mankey[];
extern const u8 gMonPalette_Mankey[];
extern const u8 gMonBackPic_Mankey[];
extern const u8 gMonShinyPalette_Mankey[];
extern const u8 gMonIcon_Mankey[];
extern const u8 gMonFootprint_Mankey[];
extern const u8 gMonFrontPic_Primeape[];
extern const u8 gMonPalette_Primeape[];
extern const u8 gMonBackPic_Primeape[];
extern const u8 gMonShinyPalette_Primeape[];
extern const u8 gMonIcon_Primeape[];
extern const u8 gMonFootprint_Primeape[];
extern const u8 gMonFrontPic_Growlithe[];
extern const u8 gMonPalette_Growlithe[];
extern const u8 gMonBackPic_Growlithe[];
extern const u8 gMonShinyPalette_Growlithe[];
extern const u8 gMonIcon_Growlithe[];
extern const u8 gMonFootprint_Growlithe[];
extern const u8 gMonFrontPic_Arcanine[];
extern const u8 gMonPalette_Arcanine[];
extern const u8 gMonBackPic_Arcanine[];
extern const u8 gMonShinyPalette_Arcanine[];
extern const u8 gMonIcon_Arcanine[];
extern const u8 gMonFootprint_Arcanine[];
extern const u8 gMonFrontPic_Poliwag[];
extern const u8 gMonPalette_Poliwag[];
extern const u8 gMonBackPic_Poliwag[];
extern const u8 gMonShinyPalette_Poliwag[];
extern const u8 gMonIcon_Poliwag[];
extern const u8 gMonFootprint_Poliwag[];
extern const u8 gMonFrontPic_Poliwhirl[];
extern const u8 gMonPalette_Poliwhirl[];
extern const u8 gMonBackPic_Poliwhirl[];
extern const u8 gMonShinyPalette_Poliwhirl[];
extern const u8 gMonIcon_Poliwhirl[];
extern const u8 gMonFootprint_Poliwhirl[];
extern const u8 gMonFrontPic_Poliwrath[];
extern const u8 gMonPalette_Poliwrath[];
extern const u8 gMonBackPic_Poliwrath[];
extern const u8 gMonShinyPalette_Poliwrath[];
extern const u8 gMonIcon_Poliwrath[];
extern const u8 gMonFootprint_Poliwrath[];
extern const u8 gMonFrontPic_Abra[];
extern const u8 gMonPalette_Abra[];
extern const u8 gMonBackPic_Abra[];
extern const u8 gMonShinyPalette_Abra[];
extern const u8 gMonIcon_Abra[];
extern const u8 gMonFootprint_Abra[];
extern const u8 gMonFrontPic_Kadabra[];
extern const u8 gMonPalette_Kadabra[];
extern const u8 gMonBackPic_Kadabra[];
extern const u8 gMonShinyPalette_Kadabra[];
extern const u8 gMonIcon_Kadabra[];
extern const u8 gMonFootprint_Kadabra[];
extern const u8 gMonFrontPic_Alakazam[];
extern const u8 gMonPalette_Alakazam[];
extern const u8 gMonBackPic_Alakazam[];
extern const u8 gMonShinyPalette_Alakazam[];
extern const u8 gMonIcon_Alakazam[];
extern const u8 gMonFootprint_Alakazam[];
extern const u8 gMonFrontPic_Machop[];
extern const u8 gMonPalette_Machop[];
extern const u8 gMonBackPic_Machop[];
extern const u8 gMonShinyPalette_Machop[];
extern const u8 gMonIcon_Machop[];
extern const u8 gMonFootprint_Machop[];
extern const u8 gMonFrontPic_Machoke[];
extern const u8 gMonPalette_Machoke[];
extern const u8 gMonBackPic_Machoke[];
extern const u8 gMonShinyPalette_Machoke[];
extern const u8 gMonIcon_Machoke[];
extern const u8 gMonFootprint_Machoke[];
extern const u8 gMonFrontPic_Machamp[];
extern const u8 gMonPalette_Machamp[];
extern const u8 gMonBackPic_Machamp[];
extern const u8 gMonShinyPalette_Machamp[];
extern const u8 gMonIcon_Machamp[];
extern const u8 gMonFootprint_Machamp[];
extern const u8 gMonFrontPic_Bellsprout[];
extern const u8 gMonPalette_Bellsprout[];
extern const u8 gMonBackPic_Bellsprout[];
extern const u8 gMonShinyPalette_Bellsprout[];
extern const u8 gMonIcon_Bellsprout[];
extern const u8 gMonFootprint_Bellsprout[];
extern const u8 gMonFrontPic_Weepinbell[];
extern const u8 gMonPalette_Weepinbell[];
extern const u8 gMonBackPic_Weepinbell[];
extern const u8 gMonShinyPalette_Weepinbell[];
extern const u8 gMonIcon_Weepinbell[];
extern const u8 gMonFootprint_Weepinbell[];
extern const u8 gMonFrontPic_Victreebel[];
extern const u8 gMonPalette_Victreebel[];
extern const u8 gMonBackPic_Victreebel[];
extern const u8 gMonShinyPalette_Victreebel[];
extern const u8 gMonIcon_Victreebel[];
extern const u8 gMonFootprint_Victreebel[];
extern const u8 gMonFrontPic_Tentacool[];
extern const u8 gMonPalette_Tentacool[];
extern const u8 gMonBackPic_Tentacool[];
extern const u8 gMonShinyPalette_Tentacool[];
extern const u8 gMonIcon_Tentacool[];
extern const u8 gMonFootprint_Tentacool[];
extern const u8 gMonFrontPic_Tentacruel[];
extern const u8 gMonPalette_Tentacruel[];
extern const u8 gMonBackPic_Tentacruel[];
extern const u8 gMonShinyPalette_Tentacruel[];
extern const u8 gMonIcon_Tentacruel[];
extern const u8 gMonFootprint_Tentacruel[];
extern const u8 gMonFrontPic_Geodude[];
extern const u8 gMonPalette_Geodude[];
extern const u8 gMonBackPic_Geodude[];
extern const u8 gMonShinyPalette_Geodude[];
extern const u8 gMonIcon_Geodude[];
extern const u8 gMonFootprint_Geodude[];
extern const u8 gMonFrontPic_Graveler[];
extern const u8 gMonPalette_Graveler[];
extern const u8 gMonBackPic_Graveler[];
extern const u8 gMonShinyPalette_Graveler[];
extern const u8 gMonIcon_Graveler[];
extern const u8 gMonFootprint_Graveler[];
extern const u8 gMonFrontPic_Golem[];
extern const u8 gMonPalette_Golem[];
extern const u8 gMonBackPic_Golem[];
extern const u8 gMonShinyPalette_Golem[];
extern const u8 gMonIcon_Golem[];
extern const u8 gMonFootprint_Golem[];
extern const u8 gMonFrontPic_Ponyta[];
extern const u8 gMonPalette_Ponyta[];
extern const u8 gMonBackPic_Ponyta[];
extern const u8 gMonShinyPalette_Ponyta[];
extern const u8 gMonIcon_Ponyta[];
extern const u8 gMonFootprint_Ponyta[];
extern const u8 gMonFrontPic_Rapidash[];
extern const u8 gMonPalette_Rapidash[];
extern const u8 gMonBackPic_Rapidash[];
extern const u8 gMonShinyPalette_Rapidash[];
extern const u8 gMonIcon_Rapidash[];
extern const u8 gMonFootprint_Rapidash[];
extern const u8 gMonFrontPic_Slowpoke[];
extern const u8 gMonPalette_Slowpoke[];
extern const u8 gMonBackPic_Slowpoke[];
extern const u8 gMonShinyPalette_Slowpoke[];
extern const u8 gMonIcon_Slowpoke[];
extern const u8 gMonFootprint_Slowpoke[];
extern const u8 gMonFrontPic_Slowbro[];
extern const u8 gMonPalette_Slowbro[];
extern const u8 gMonBackPic_Slowbro[];
extern const u8 gMonShinyPalette_Slowbro[];
extern const u8 gMonIcon_Slowbro[];
extern const u8 gMonFootprint_Slowbro[];
extern const u8 gMonFrontPic_Magnemite[];
extern const u8 gMonPalette_Magnemite[];
extern const u8 gMonBackPic_Magnemite[];
extern const u8 gMonShinyPalette_Magnemite[];
extern const u8 gMonIcon_Magnemite[];
extern const u8 gMonFootprint_Magnemite[];
extern const u8 gMonFrontPic_Magneton[];
extern const u8 gMonPalette_Magneton[];
extern const u8 gMonBackPic_Magneton[];
extern const u8 gMonShinyPalette_Magneton[];
extern const u8 gMonIcon_Magneton[];
extern const u8 gMonFootprint_Magneton[];
extern const u8 gMonFrontPic_Farfetchd[];
extern const u8 gMonPalette_Farfetchd[];
extern const u8 gMonBackPic_Farfetchd[];
extern const u8 gMonShinyPalette_Farfetchd[];
extern const u8 gMonIcon_Farfetchd[];
extern const u8 gMonFootprint_Farfetchd[];
extern const u8 gMonFrontPic_Doduo[];
extern const u8 gMonPalette_Doduo[];
extern const u8 gMonBackPic_Doduo[];
extern const u8 gMonShinyPalette_Doduo[];
extern const u8 gMonIcon_Doduo[];
extern const u8 gMonFootprint_Doduo[];
extern const u8 gMonFrontPic_Dodrio[];
extern const u8 gMonPalette_Dodrio[];
extern const u8 gMonBackPic_Dodrio[];
extern const u8 gMonShinyPalette_Dodrio[];
extern const u8 gMonIcon_Dodrio[];
extern const u8 gMonFootprint_Dodrio[];
extern const u8 gMonFrontPic_Seel[];
extern const u8 gMonPalette_Seel[];
extern const u8 gMonBackPic_Seel[];
extern const u8 gMonShinyPalette_Seel[];
extern const u8 gMonIcon_Seel[];
extern const u8 gMonFootprint_Seel[];
extern const u8 gMonFrontPic_Dewgong[];
extern const u8 gMonPalette_Dewgong[];
extern const u8 gMonBackPic_Dewgong[];
extern const u8 gMonShinyPalette_Dewgong[];
extern const u8 gMonIcon_Dewgong[];
extern const u8 gMonFootprint_Dewgong[];
extern const u8 gMonFrontPic_Grimer[];
extern const u8 gMonPalette_Grimer[];
extern const u8 gMonBackPic_Grimer[];
extern const u8 gMonShinyPalette_Grimer[];
extern const u8 gMonIcon_Grimer[];
extern const u8 gMonFootprint_Grimer[];
extern const u8 gMonFrontPic_Muk[];
extern const u8 gMonPalette_Muk[];
extern const u8 gMonBackPic_Muk[];
extern const u8 gMonShinyPalette_Muk[];
extern const u8 gMonIcon_Muk[];
extern const u8 gMonFootprint_Muk[];
extern const u8 gMonFrontPic_Shellder[];
extern const u8 gMonPalette_Shellder[];
extern const u8 gMonBackPic_Shellder[];
extern const u8 gMonShinyPalette_Shellder[];
extern const u8 gMonIcon_Shellder[];
extern const u8 gMonFootprint_Shellder[];
extern const u8 gMonFrontPic_Cloyster[];
extern const u8 gMonPalette_Cloyster[];
extern const u8 gMonBackPic_Cloyster[];
extern const u8 gMonShinyPalette_Cloyster[];
extern const u8 gMonIcon_Cloyster[];
extern const u8 gMonFootprint_Cloyster[];
extern const u8 gMonFrontPic_Gastly[];
extern const u8 gMonPalette_Gastly[];
extern const u8 gMonBackPic_Gastly[];
extern const u8 gMonShinyPalette_Gastly[];
extern const u8 gMonIcon_Gastly[];
extern const u8 gMonFootprint_Gastly[];
extern const u8 gMonFrontPic_Haunter[];
extern const u8 gMonPalette_Haunter[];
extern const u8 gMonBackPic_Haunter[];
extern const u8 gMonShinyPalette_Haunter[];
extern const u8 gMonIcon_Haunter[];
extern const u8 gMonFootprint_Haunter[];
extern const u8 gMonFrontPic_Gengar[];
extern const u8 gMonPalette_Gengar[];
extern const u8 gMonBackPic_Gengar[];
extern const u8 gMonShinyPalette_Gengar[];
extern const u8 gMonIcon_Gengar[];
extern const u8 gMonFootprint_Gengar[];
extern const u8 gMonFrontPic_Onix[];
extern const u8 gMonPalette_Onix[];
extern const u8 gMonBackPic_Onix[];
extern const u8 gMonShinyPalette_Onix[];
extern const u8 gMonIcon_Onix[];
extern const u8 gMonFootprint_Onix[];
extern const u8 gMonFrontPic_Drowzee[];
extern const u8 gMonPalette_Drowzee[];
extern const u8 gMonBackPic_Drowzee[];
extern const u8 gMonShinyPalette_Drowzee[];
extern const u8 gMonIcon_Drowzee[];
extern const u8 gMonFootprint_Drowzee[];
extern const u8 gMonFrontPic_Hypno[];
extern const u8 gMonPalette_Hypno[];
extern const u8 gMonBackPic_Hypno[];
extern const u8 gMonShinyPalette_Hypno[];
extern const u8 gMonIcon_Hypno[];
extern const u8 gMonFootprint_Hypno[];
extern const u8 gMonFrontPic_Krabby[];
extern const u8 gMonPalette_Krabby[];
extern const u8 gMonBackPic_Krabby[];
extern const u8 gMonShinyPalette_Krabby[];
extern const u8 gMonIcon_Krabby[];
extern const u8 gMonFootprint_Krabby[];
extern const u8 gMonFrontPic_Kingler[];
extern const u8 gMonPalette_Kingler[];
extern const u8 gMonBackPic_Kingler[];
extern const u8 gMonShinyPalette_Kingler[];
extern const u8 gMonIcon_Kingler[];
extern const u8 gMonFootprint_Kingler[];
extern const u8 gMonFrontPic_Voltorb[];
extern const u8 gMonPalette_Voltorb[];
extern const u8 gMonBackPic_Voltorb[];
extern const u8 gMonShinyPalette_Voltorb[];
extern const u8 gMonIcon_Voltorb[];
extern const u8 gMonFootprint_Voltorb[];
extern const u8 gMonFrontPic_Electrode[];
extern const u8 gMonPalette_Electrode[];
extern const u8 gMonBackPic_Electrode[];
extern const u8 gMonShinyPalette_Electrode[];
extern const u8 gMonIcon_Electrode[];
extern const u8 gMonFootprint_Electrode[];
extern const u8 gMonFrontPic_Exeggcute[];
extern const u8 gMonPalette_Exeggcute[];
extern const u8 gMonBackPic_Exeggcute[];
extern const u8 gMonShinyPalette_Exeggcute[];
extern const u8 gMonIcon_Exeggcute[];
extern const u8 gMonFootprint_Exeggcute[];
extern const u8 gMonFrontPic_Exeggutor[];
extern const u8 gMonPalette_Exeggutor[];
extern const u8 gMonBackPic_Exeggutor[];
extern const u8 gMonShinyPalette_Exeggutor[];
extern const u8 gMonIcon_Exeggutor[];
extern const u8 gMonFootprint_Exeggutor[];
extern const u8 gMonFrontPic_Cubone[];
extern const u8 gMonPalette_Cubone[];
extern const u8 gMonBackPic_Cubone[];
extern const u8 gMonShinyPalette_Cubone[];
extern const u8 gMonIcon_Cubone[];
extern const u8 gMonFootprint_Cubone[];
extern const u8 gMonFrontPic_Marowak[];
extern const u8 gMonPalette_Marowak[];
extern const u8 gMonBackPic_Marowak[];
extern const u8 gMonShinyPalette_Marowak[];
extern const u8 gMonIcon_Marowak[];
extern const u8 gMonFootprint_Marowak[];
extern const u8 gMonFrontPic_Hitmonlee[];
extern const u8 gMonPalette_Hitmonlee[];
extern const u8 gMonBackPic_Hitmonlee[];
extern const u8 gMonShinyPalette_Hitmonlee[];
extern const u8 gMonIcon_Hitmonlee[];
extern const u8 gMonFootprint_Hitmonlee[];
extern const u8 gMonFrontPic_Hitmonchan[];
extern const u8 gMonPalette_Hitmonchan[];
extern const u8 gMonBackPic_Hitmonchan[];
extern const u8 gMonShinyPalette_Hitmonchan[];
extern const u8 gMonIcon_Hitmonchan[];
extern const u8 gMonFootprint_Hitmonchan[];
extern const u8 gMonFrontPic_Lickitung[];
extern const u8 gMonPalette_Lickitung[];
extern const u8 gMonBackPic_Lickitung[];
extern const u8 gMonShinyPalette_Lickitung[];
extern const u8 gMonIcon_Lickitung[];
extern const u8 gMonFootprint_Lickitung[];
extern const u8 gMonFrontPic_Koffing[];
extern const u8 gMonPalette_Koffing[];
extern const u8 gMonBackPic_Koffing[];
extern const u8 gMonShinyPalette_Koffing[];
extern const u8 gMonIcon_Koffing[];
extern const u8 gMonFootprint_Koffing[];
extern const u8 gMonFrontPic_Weezing[];
extern const u8 gMonPalette_Weezing[];
extern const u8 gMonBackPic_Weezing[];
extern const u8 gMonShinyPalette_Weezing[];
extern const u8 gMonIcon_Weezing[];
extern const u8 gMonFootprint_Weezing[];
extern const u8 gMonFrontPic_Rhyhorn[];
extern const u8 gMonPalette_Rhyhorn[];
extern const u8 gMonBackPic_Rhyhorn[];
extern const u8 gMonShinyPalette_Rhyhorn[];
extern const u8 gMonIcon_Rhyhorn[];
extern const u8 gMonFootprint_Rhyhorn[];
extern const u8 gMonFrontPic_Rhydon[];
extern const u8 gMonPalette_Rhydon[];
extern const u8 gMonBackPic_Rhydon[];
extern const u8 gMonShinyPalette_Rhydon[];
extern const u8 gMonIcon_Rhydon[];
extern const u8 gMonFootprint_Rhydon[];
extern const u8 gMonFrontPic_Chansey[];
extern const u8 gMonPalette_Chansey[];
extern const u8 gMonBackPic_Chansey[];
extern const u8 gMonShinyPalette_Chansey[];
extern const u8 gMonIcon_Chansey[];
extern const u8 gMonFootprint_Chansey[];
extern const u8 gMonFrontPic_Tangela[];
extern const u8 gMonPalette_Tangela[];
extern const u8 gMonBackPic_Tangela[];
extern const u8 gMonShinyPalette_Tangela[];
extern const u8 gMonIcon_Tangela[];
extern const u8 gMonFootprint_Tangela[];
extern const u8 gMonFrontPic_Kangaskhan[];
extern const u8 gMonPalette_Kangaskhan[];
extern const u8 gMonBackPic_Kangaskhan[];
extern const u8 gMonShinyPalette_Kangaskhan[];
extern const u8 gMonIcon_Kangaskhan[];
extern const u8 gMonFootprint_Kangaskhan[];
extern const u8 gMonFrontPic_Horsea[];
extern const u8 gMonPalette_Horsea[];
extern const u8 gMonBackPic_Horsea[];
extern const u8 gMonShinyPalette_Horsea[];
extern const u8 gMonIcon_Horsea[];
extern const u8 gMonFootprint_Horsea[];
extern const u8 gMonFrontPic_Seadra[];
extern const u8 gMonPalette_Seadra[];
extern const u8 gMonBackPic_Seadra[];
extern const u8 gMonShinyPalette_Seadra[];
extern const u8 gMonIcon_Seadra[];
extern const u8 gMonFootprint_Seadra[];
extern const u8 gMonFrontPic_Goldeen[];
extern const u8 gMonPalette_Goldeen[];
extern const u8 gMonBackPic_Goldeen[];
extern const u8 gMonShinyPalette_Goldeen[];
extern const u8 gMonIcon_Goldeen[];
extern const u8 gMonFootprint_Goldeen[];
extern const u8 gMonFrontPic_Seaking[];
extern const u8 gMonPalette_Seaking[];
extern const u8 gMonBackPic_Seaking[];
extern const u8 gMonShinyPalette_Seaking[];
extern const u8 gMonIcon_Seaking[];
extern const u8 gMonFootprint_Seaking[];
extern const u8 gMonFrontPic_Staryu[];
extern const u8 gMonPalette_Staryu[];
extern const u8 gMonBackPic_Staryu[];
extern const u8 gMonShinyPalette_Staryu[];
extern const u8 gMonIcon_Staryu[];
extern const u8 gMonFootprint_Staryu[];
extern const u8 gMonFrontPic_Starmie[];
extern const u8 gMonPalette_Starmie[];
extern const u8 gMonBackPic_Starmie[];
extern const u8 gMonShinyPalette_Starmie[];
extern const u8 gMonIcon_Starmie[];
extern const u8 gMonFootprint_Starmie[];
extern const u8 gMonFrontPic_Mrmime[];
extern const u8 gMonPalette_Mrmime[];
extern const u8 gMonBackPic_Mrmime[];
extern const u8 gMonShinyPalette_Mrmime[];
extern const u8 gMonIcon_Mrmime[];
extern const u8 gMonFootprint_Mrmime[];
extern const u8 gMonFrontPic_Scyther[];
extern const u8 gMonPalette_Scyther[];
extern const u8 gMonBackPic_Scyther[];
extern const u8 gMonShinyPalette_Scyther[];
extern const u8 gMonIcon_Scyther[];
extern const u8 gMonFootprint_Scyther[];
extern const u8 gMonFrontPic_Jynx[];
extern const u8 gMonPalette_Jynx[];
extern const u8 gMonBackPic_Jynx[];
extern const u8 gMonShinyPalette_Jynx[];
extern const u8 gMonIcon_Jynx[];
extern const u8 gMonFootprint_Jynx[];
extern const u8 gMonFrontPic_Electabuzz[];
extern const u8 gMonPalette_Electabuzz[];
extern const u8 gMonBackPic_Electabuzz[];
extern const u8 gMonShinyPalette_Electabuzz[];
extern const u8 gMonIcon_Electabuzz[];
extern const u8 gMonFootprint_Electabuzz[];
extern const u8 gMonFrontPic_Magmar[];
extern const u8 gMonPalette_Magmar[];
extern const u8 gMonBackPic_Magmar[];
extern const u8 gMonShinyPalette_Magmar[];
extern const u8 gMonIcon_Magmar[];
extern const u8 gMonFootprint_Magmar[];
extern const u8 gMonFrontPic_Pinsir[];
extern const u8 gMonPalette_Pinsir[];
extern const u8 gMonBackPic_Pinsir[];
extern const u8 gMonShinyPalette_Pinsir[];
extern const u8 gMonIcon_Pinsir[];
extern const u8 gMonFootprint_Pinsir[];
extern const u8 gMonFrontPic_Tauros[];
extern const u8 gMonPalette_Tauros[];
extern const u8 gMonBackPic_Tauros[];
extern const u8 gMonShinyPalette_Tauros[];
extern const u8 gMonIcon_Tauros[];
extern const u8 gMonFootprint_Tauros[];
extern const u8 gMonFrontPic_Magikarp[];
extern const u8 gMonPalette_Magikarp[];
extern const u8 gMonBackPic_Magikarp[];
extern const u8 gMonShinyPalette_Magikarp[];
extern const u8 gMonIcon_Magikarp[];
extern const u8 gMonFootprint_Magikarp[];
extern const u8 gMonFrontPic_Gyarados[];
extern const u8 gMonPalette_Gyarados[];
extern const u8 gMonBackPic_Gyarados[];
extern const u8 gMonShinyPalette_Gyarados[];
extern const u8 gMonIcon_Gyarados[];
extern const u8 gMonFootprint_Gyarados[];
extern const u8 gMonFrontPic_Lapras[];
extern const u8 gMonPalette_Lapras[];
extern const u8 gMonBackPic_Lapras[];
extern const u8 gMonShinyPalette_Lapras[];
extern const u8 gMonIcon_Lapras[];
extern const u8 gMonFootprint_Lapras[];
extern const u8 gMonFrontPic_Ditto[];
extern const u8 gMonPalette_Ditto[];
extern const u8 gMonBackPic_Ditto[];
extern const u8 gMonShinyPalette_Ditto[];
extern const u8 gMonIcon_Ditto[];
extern const u8 gMonFootprint_Ditto[];
extern const u8 gMonFrontPic_Eevee[];
extern const u8 gMonPalette_Eevee[];
extern const u8 gMonBackPic_Eevee[];
extern const u8 gMonShinyPalette_Eevee[];
extern const u8 gMonIcon_Eevee[];
extern const u8 gMonFootprint_Eevee[];
extern const u8 gMonFrontPic_Vaporeon[];
extern const u8 gMonPalette_Vaporeon[];
extern const u8 gMonBackPic_Vaporeon[];
extern const u8 gMonShinyPalette_Vaporeon[];
extern const u8 gMonIcon_Vaporeon[];
extern const u8 gMonFootprint_Vaporeon[];
extern const u8 gMonFrontPic_Jolteon[];
extern const u8 gMonPalette_Jolteon[];
extern const u8 gMonBackPic_Jolteon[];
extern const u8 gMonShinyPalette_Jolteon[];
extern const u8 gMonIcon_Jolteon[];
extern const u8 gMonFootprint_Jolteon[];
extern const u8 gMonFrontPic_Flareon[];
extern const u8 gMonPalette_Flareon[];
extern const u8 gMonBackPic_Flareon[];
extern const u8 gMonShinyPalette_Flareon[];
extern const u8 gMonIcon_Flareon[];
extern const u8 gMonFootprint_Flareon[];
extern const u8 gMonFrontPic_Porygon[];
extern const u8 gMonPalette_Porygon[];
extern const u8 gMonBackPic_Porygon[];
extern const u8 gMonShinyPalette_Porygon[];
extern const u8 gMonIcon_Porygon[];
extern const u8 gMonFootprint_Porygon[];
extern const u8 gMonFrontPic_Omanyte[];
extern const u8 gMonPalette_Omanyte[];
extern const u8 gMonBackPic_Omanyte[];
extern const u8 gMonShinyPalette_Omanyte[];
extern const u8 gMonIcon_Omanyte[];
extern const u8 gMonFootprint_Omanyte[];
extern const u8 gMonFrontPic_Omastar[];
extern const u8 gMonPalette_Omastar[];
extern const u8 gMonBackPic_Omastar[];
extern const u8 gMonShinyPalette_Omastar[];
extern const u8 gMonIcon_Omastar[];
extern const u8 gMonFootprint_Omastar[];
extern const u8 gMonFrontPic_Kabuto[];
extern const u8 gMonPalette_Kabuto[];
extern const u8 gMonBackPic_Kabuto[];
extern const u8 gMonShinyPalette_Kabuto[];
extern const u8 gMonIcon_Kabuto[];
extern const u8 gMonFootprint_Kabuto[];
extern const u8 gMonFrontPic_Kabutops[];
extern const u8 gMonPalette_Kabutops[];
extern const u8 gMonBackPic_Kabutops[];
extern const u8 gMonShinyPalette_Kabutops[];
extern const u8 gMonIcon_Kabutops[];
extern const u8 gMonFootprint_Kabutops[];
extern const u8 gMonFrontPic_Aerodactyl[];
extern const u8 gMonPalette_Aerodactyl[];
extern const u8 gMonBackPic_Aerodactyl[];
extern const u8 gMonShinyPalette_Aerodactyl[];
extern const u8 gMonIcon_Aerodactyl[];
extern const u8 gMonFootprint_Aerodactyl[];
extern const u8 gMonFrontPic_Snorlax[];
extern const u8 gMonPalette_Snorlax[];
extern const u8 gMonBackPic_Snorlax[];
extern const u8 gMonShinyPalette_Snorlax[];
extern const u8 gMonIcon_Snorlax[];
extern const u8 gMonFootprint_Snorlax[];
extern const u8 gMonFrontPic_Articuno[];
extern const u8 gMonPalette_Articuno[];
extern const u8 gMonBackPic_Articuno[];
extern const u8 gMonShinyPalette_Articuno[];
extern const u8 gMonIcon_Articuno[];
extern const u8 gMonFootprint_Articuno[];
extern const u8 gMonFrontPic_Zapdos[];
extern const u8 gMonPalette_Zapdos[];
extern const u8 gMonBackPic_Zapdos[];
extern const u8 gMonShinyPalette_Zapdos[];
extern const u8 gMonIcon_Zapdos[];
extern const u8 gMonFootprint_Zapdos[];
extern const u8 gMonFrontPic_Moltres[];
extern const u8 gMonPalette_Moltres[];
extern const u8 gMonBackPic_Moltres[];
extern const u8 gMonShinyPalette_Moltres[];
extern const u8 gMonIcon_Moltres[];
extern const u8 gMonFootprint_Moltres[];
extern const u8 gMonFrontPic_Dratini[];
extern const u8 gMonPalette_Dratini[];
extern const u8 gMonBackPic_Dratini[];
extern const u8 gMonShinyPalette_Dratini[];
extern const u8 gMonIcon_Dratini[];
extern const u8 gMonFootprint_Dratini[];
extern const u8 gMonFrontPic_Dragonair[];
extern const u8 gMonPalette_Dragonair[];
extern const u8 gMonBackPic_Dragonair[];
extern const u8 gMonShinyPalette_Dragonair[];
extern const u8 gMonIcon_Dragonair[];
extern const u8 gMonFootprint_Dragonair[];
extern const u8 gMonFrontPic_Dragonite[];
extern const u8 gMonPalette_Dragonite[];
extern const u8 gMonBackPic_Dragonite[];
extern const u8 gMonShinyPalette_Dragonite[];
extern const u8 gMonIcon_Dragonite[];
extern const u8 gMonFootprint_Dragonite[];
extern const u8 gMonFrontPic_Mewtwo[];
extern const u8 gMonPalette_Mewtwo[];
extern const u8 gMonBackPic_Mewtwo[];
extern const u8 gMonShinyPalette_Mewtwo[];
extern const u8 gMonIcon_Mewtwo[];
extern const u8 gMonFootprint_Mewtwo[];
extern const u8 gMonFrontPic_Mew[];
extern const u8 gMonPalette_Mew[];
extern const u8 gMonBackPic_Mew[];
extern const u8 gMonShinyPalette_Mew[];
extern const u8 gMonIcon_Mew[];
extern const u8 gMonFootprint_Mew[];
extern const u8 gMonFrontPic_Chikorita[];
extern const u8 gMonPalette_Chikorita[];
extern const u8 gMonBackPic_Chikorita[];
extern const u8 gMonShinyPalette_Chikorita[];
extern const u8 gMonIcon_Chikorita[];
extern const u8 gMonFootprint_Chikorita[];
extern const u8 gMonFrontPic_Bayleef[];
extern const u8 gMonPalette_Bayleef[];
extern const u8 gMonBackPic_Bayleef[];
extern const u8 gMonShinyPalette_Bayleef[];
extern const u8 gMonIcon_Bayleef[];
extern const u8 gMonFootprint_Bayleef[];
extern const u8 gMonFrontPic_Meganium[];
extern const u8 gMonPalette_Meganium[];
extern const u8 gMonBackPic_Meganium[];
extern const u8 gMonShinyPalette_Meganium[];
extern const u8 gMonIcon_Meganium[];
extern const u8 gMonFootprint_Meganium[];
extern const u8 gMonFrontPic_Cyndaquil[];
extern const u8 gMonPalette_Cyndaquil[];
extern const u8 gMonBackPic_Cyndaquil[];
extern const u8 gMonShinyPalette_Cyndaquil[];
extern const u8 gMonIcon_Cyndaquil[];
extern const u8 gMonFootprint_Cyndaquil[];
extern const u8 gMonFrontPic_Quilava[];
extern const u8 gMonPalette_Quilava[];
extern const u8 gMonBackPic_Quilava[];
extern const u8 gMonShinyPalette_Quilava[];
extern const u8 gMonIcon_Quilava[];
extern const u8 gMonFootprint_Quilava[];
extern const u8 gMonFrontPic_Typhlosion[];
extern const u8 gMonPalette_Typhlosion[];
extern const u8 gMonBackPic_Typhlosion[];
extern const u8 gMonShinyPalette_Typhlosion[];
extern const u8 gMonIcon_Typhlosion[];
extern const u8 gMonFootprint_Typhlosion[];
extern const u8 gMonFrontPic_Totodile[];
extern const u8 gMonPalette_Totodile[];
extern const u8 gMonBackPic_Totodile[];
extern const u8 gMonShinyPalette_Totodile[];
extern const u8 gMonIcon_Totodile[];
extern const u8 gMonFootprint_Totodile[];
extern const u8 gMonFrontPic_Croconaw[];
extern const u8 gMonPalette_Croconaw[];
extern const u8 gMonBackPic_Croconaw[];
extern const u8 gMonShinyPalette_Croconaw[];
extern const u8 gMonIcon_Croconaw[];
extern const u8 gMonFootprint_Croconaw[];
extern const u8 gMonFrontPic_Feraligatr[];
extern const u8 gMonPalette_Feraligatr[];
extern const u8 gMonBackPic_Feraligatr[];
extern const u8 gMonShinyPalette_Feraligatr[];
extern const u8 gMonIcon_Feraligatr[];
extern const u8 gMonFootprint_Feraligatr[];
extern const u8 gMonFrontPic_Sentret[];
extern const u8 gMonPalette_Sentret[];
extern const u8 gMonBackPic_Sentret[];
extern const u8 gMonShinyPalette_Sentret[];
extern const u8 gMonIcon_Sentret[];
extern const u8 gMonFootprint_Sentret[];
extern const u8 gMonFrontPic_Furret[];
extern const u8 gMonPalette_Furret[];
extern const u8 gMonBackPic_Furret[];
extern const u8 gMonShinyPalette_Furret[];
extern const u8 gMonIcon_Furret[];
extern const u8 gMonFootprint_Furret[];
extern const u8 gMonFrontPic_Hoothoot[];
extern const u8 gMonPalette_Hoothoot[];
extern const u8 gMonBackPic_Hoothoot[];
extern const u8 gMonShinyPalette_Hoothoot[];
extern const u8 gMonIcon_Hoothoot[];
extern const u8 gMonFootprint_Hoothoot[];
extern const u8 gMonFrontPic_Noctowl[];
extern const u8 gMonPalette_Noctowl[];
extern const u8 gMonBackPic_Noctowl[];
extern const u8 gMonShinyPalette_Noctowl[];
extern const u8 gMonIcon_Noctowl[];
extern const u8 gMonFootprint_Noctowl[];
extern const u8 gMonFrontPic_Ledyba[];
extern const u8 gMonPalette_Ledyba[];
extern const u8 gMonBackPic_Ledyba[];
extern const u8 gMonShinyPalette_Ledyba[];
extern const u8 gMonIcon_Ledyba[];
extern const u8 gMonFootprint_Ledyba[];
extern const u8 gMonFrontPic_Ledian[];
extern const u8 gMonPalette_Ledian[];
extern const u8 gMonBackPic_Ledian[];
extern const u8 gMonShinyPalette_Ledian[];
extern const u8 gMonIcon_Ledian[];
extern const u8 gMonFootprint_Ledian[];
extern const u8 gMonFrontPic_Spinarak[];
extern const u8 gMonPalette_Spinarak[];
extern const u8 gMonBackPic_Spinarak[];
extern const u8 gMonShinyPalette_Spinarak[];
extern const u8 gMonIcon_Spinarak[];
extern const u8 gMonFootprint_Spinarak[];
extern const u8 gMonFrontPic_Ariados[];
extern const u8 gMonPalette_Ariados[];
extern const u8 gMonBackPic_Ariados[];
extern const u8 gMonShinyPalette_Ariados[];
extern const u8 gMonIcon_Ariados[];
extern const u8 gMonFootprint_Ariados[];
extern const u8 gMonFrontPic_Crobat[];
extern const u8 gMonPalette_Crobat[];
extern const u8 gMonBackPic_Crobat[];
extern const u8 gMonShinyPalette_Crobat[];
extern const u8 gMonIcon_Crobat[];
extern const u8 gMonFootprint_Crobat[];
extern const u8 gMonFrontPic_Chinchou[];
extern const u8 gMonPalette_Chinchou[];
extern const u8 gMonBackPic_Chinchou[];
extern const u8 gMonShinyPalette_Chinchou[];
extern const u8 gMonIcon_Chinchou[];
extern const u8 gMonFootprint_Chinchou[];
extern const u8 gMonFrontPic_Lanturn[];
extern const u8 gMonPalette_Lanturn[];
extern const u8 gMonBackPic_Lanturn[];
extern const u8 gMonShinyPalette_Lanturn[];
extern const u8 gMonIcon_Lanturn[];
extern const u8 gMonFootprint_Lanturn[];
extern const u8 gMonFrontPic_Pichu[];
extern const u8 gMonPalette_Pichu[];
extern const u8 gMonBackPic_Pichu[];
extern const u8 gMonShinyPalette_Pichu[];
extern const u8 gMonIcon_Pichu[];
extern const u8 gMonFootprint_Pichu[];
extern const u8 gMonFrontPic_Cleffa[];
extern const u8 gMonPalette_Cleffa[];
extern const u8 gMonBackPic_Cleffa[];
extern const u8 gMonShinyPalette_Cleffa[];
extern const u8 gMonIcon_Cleffa[];
extern const u8 gMonFootprint_Cleffa[];
extern const u8 gMonFrontPic_Igglybuff[];
extern const u8 gMonPalette_Igglybuff[];
extern const u8 gMonBackPic_Igglybuff[];
extern const u8 gMonShinyPalette_Igglybuff[];
extern const u8 gMonIcon_Igglybuff[];
extern const u8 gMonFootprint_Igglybuff[];
extern const u8 gMonFrontPic_Togepi[];
extern const u8 gMonPalette_Togepi[];
extern const u8 gMonBackPic_Togepi[];
extern const u8 gMonShinyPalette_Togepi[];
extern const u8 gMonIcon_Togepi[];
extern const u8 gMonFootprint_Togepi[];
extern const u8 gMonFrontPic_Togetic[];
extern const u8 gMonPalette_Togetic[];
extern const u8 gMonBackPic_Togetic[];
extern const u8 gMonShinyPalette_Togetic[];
extern const u8 gMonIcon_Togetic[];
extern const u8 gMonFootprint_Togetic[];
extern const u8 gMonFrontPic_Natu[];
extern const u8 gMonPalette_Natu[];
extern const u8 gMonBackPic_Natu[];
extern const u8 gMonShinyPalette_Natu[];
extern const u8 gMonIcon_Natu[];
extern const u8 gMonFootprint_Natu[];
extern const u8 gMonFrontPic_Xatu[];
extern const u8 gMonPalette_Xatu[];
extern const u8 gMonBackPic_Xatu[];
extern const u8 gMonShinyPalette_Xatu[];
extern const u8 gMonIcon_Xatu[];
extern const u8 gMonFootprint_Xatu[];
extern const u8 gMonFrontPic_Mareep[];
extern const u8 gMonPalette_Mareep[];
extern const u8 gMonBackPic_Mareep[];
extern const u8 gMonShinyPalette_Mareep[];
extern const u8 gMonIcon_Mareep[];
extern const u8 gMonFootprint_Mareep[];
extern const u8 gMonFrontPic_Flaaffy[];
extern const u8 gMonPalette_Flaaffy[];
extern const u8 gMonBackPic_Flaaffy[];
extern const u8 gMonShinyPalette_Flaaffy[];
extern const u8 gMonIcon_Flaaffy[];
extern const u8 gMonFootprint_Flaaffy[];
extern const u8 gMonFrontPic_Ampharos[];
extern const u8 gMonPalette_Ampharos[];
extern const u8 gMonBackPic_Ampharos[];
extern const u8 gMonShinyPalette_Ampharos[];
extern const u8 gMonIcon_Ampharos[];
extern const u8 gMonFootprint_Ampharos[];
extern const u8 gMonFrontPic_Bellossom[];
extern const u8 gMonPalette_Bellossom[];
extern const u8 gMonBackPic_Bellossom[];
extern const u8 gMonShinyPalette_Bellossom[];
extern const u8 gMonIcon_Bellossom[];
extern const u8 gMonFootprint_Bellossom[];
extern const u8 gMonFrontPic_Marill[];
extern const u8 gMonPalette_Marill[];
extern const u8 gMonBackPic_Marill[];
extern const u8 gMonShinyPalette_Marill[];
extern const u8 gMonIcon_Marill[];
extern const u8 gMonFootprint_Marill[];
extern const u8 gMonFrontPic_Azumarill[];
extern const u8 gMonPalette_Azumarill[];
extern const u8 gMonBackPic_Azumarill[];
extern const u8 gMonShinyPalette_Azumarill[];
extern const u8 gMonIcon_Azumarill[];
extern const u8 gMonFootprint_Azumarill[];
extern const u8 gMonFrontPic_Sudowoodo[];
extern const u8 gMonPalette_Sudowoodo[];
extern const u8 gMonBackPic_Sudowoodo[];
extern const u8 gMonShinyPalette_Sudowoodo[];
extern const u8 gMonIcon_Sudowoodo[];
extern const u8 gMonFootprint_Sudowoodo[];
extern const u8 gMonFrontPic_Politoed[];
extern const u8 gMonPalette_Politoed[];
extern const u8 gMonBackPic_Politoed[];
extern const u8 gMonShinyPalette_Politoed[];
extern const u8 gMonIcon_Politoed[];
extern const u8 gMonFootprint_Politoed[];
extern const u8 gMonFrontPic_Hoppip[];
extern const u8 gMonPalette_Hoppip[];
extern const u8 gMonBackPic_Hoppip[];
extern const u8 gMonShinyPalette_Hoppip[];
extern const u8 gMonIcon_Hoppip[];
extern const u8 gMonFootprint_Hoppip[];
extern const u8 gMonFrontPic_Skiploom[];
extern const u8 gMonPalette_Skiploom[];
extern const u8 gMonBackPic_Skiploom[];
extern const u8 gMonShinyPalette_Skiploom[];
extern const u8 gMonIcon_Skiploom[];
extern const u8 gMonFootprint_Skiploom[];
extern const u8 gMonFrontPic_Jumpluff[];
extern const u8 gMonPalette_Jumpluff[];
extern const u8 gMonBackPic_Jumpluff[];
extern const u8 gMonShinyPalette_Jumpluff[];
extern const u8 gMonIcon_Jumpluff[];
extern const u8 gMonFootprint_Jumpluff[];
extern const u8 gMonFrontPic_Aipom[];
extern const u8 gMonPalette_Aipom[];
extern const u8 gMonBackPic_Aipom[];
extern const u8 gMonShinyPalette_Aipom[];
extern const u8 gMonIcon_Aipom[];
extern const u8 gMonFootprint_Aipom[];
extern const u8 gMonFrontPic_Sunkern[];
extern const u8 gMonPalette_Sunkern[];
extern const u8 gMonBackPic_Sunkern[];
extern const u8 gMonShinyPalette_Sunkern[];
extern const u8 gMonIcon_Sunkern[];
extern const u8 gMonFootprint_Sunkern[];
extern const u8 gMonFrontPic_Sunflora[];
extern const u8 gMonPalette_Sunflora[];
extern const u8 gMonBackPic_Sunflora[];
extern const u8 gMonShinyPalette_Sunflora[];
extern const u8 gMonIcon_Sunflora[];
extern const u8 gMonFootprint_Sunflora[];
extern const u8 gMonFrontPic_Yanma[];
extern const u8 gMonPalette_Yanma[];
extern const u8 gMonBackPic_Yanma[];
extern const u8 gMonShinyPalette_Yanma[];
extern const u8 gMonIcon_Yanma[];
extern const u8 gMonFootprint_Yanma[];
extern const u8 gMonFrontPic_Wooper[];
extern const u8 gMonPalette_Wooper[];
extern const u8 gMonBackPic_Wooper[];
extern const u8 gMonShinyPalette_Wooper[];
extern const u8 gMonIcon_Wooper[];
extern const u8 gMonFootprint_Wooper[];
extern const u8 gMonFrontPic_Quagsire[];
extern const u8 gMonPalette_Quagsire[];
extern const u8 gMonBackPic_Quagsire[];
extern const u8 gMonShinyPalette_Quagsire[];
extern const u8 gMonIcon_Quagsire[];
extern const u8 gMonFootprint_Quagsire[];
extern const u8 gMonFrontPic_Espeon[];
extern const u8 gMonPalette_Espeon[];
extern const u8 gMonBackPic_Espeon[];
extern const u8 gMonShinyPalette_Espeon[];
extern const u8 gMonIcon_Espeon[];
extern const u8 gMonFootprint_Espeon[];
extern const u8 gMonFrontPic_Umbreon[];
extern const u8 gMonPalette_Umbreon[];
extern const u8 gMonBackPic_Umbreon[];
extern const u8 gMonShinyPalette_Umbreon[];
extern const u8 gMonIcon_Umbreon[];
extern const u8 gMonFootprint_Umbreon[];
extern const u8 gMonFrontPic_Murkrow[];
extern const u8 gMonPalette_Murkrow[];
extern const u8 gMonBackPic_Murkrow[];
extern const u8 gMonShinyPalette_Murkrow[];
extern const u8 gMonIcon_Murkrow[];
extern const u8 gMonFootprint_Murkrow[];
extern const u8 gMonFrontPic_Slowking[];
extern const u8 gMonPalette_Slowking[];
extern const u8 gMonBackPic_Slowking[];
extern const u8 gMonShinyPalette_Slowking[];
extern const u8 gMonIcon_Slowking[];
extern const u8 gMonFootprint_Slowking[];
extern const u8 gMonFrontPic_Misdreavus[];
extern const u8 gMonPalette_Misdreavus[];
extern const u8 gMonBackPic_Misdreavus[];
extern const u8 gMonShinyPalette_Misdreavus[];
extern const u8 gMonIcon_Misdreavus[];
extern const u8 gMonFootprint_Misdreavus[];
extern const u8 gMonFrontPic_UnownA[];
extern const u8 gMonPalette_Unown[];
extern const u8 gMonBackPic_UnownA[];
extern const u8 gMonShinyPalette_Unown[];
extern const u8 gMonIcon_UnownA[];
extern const u8 gMonFootprint_Unown[];
extern const u8 gMonFrontPic_Wobbuffet[];
extern const u8 gMonPalette_Wobbuffet[];
extern const u8 gMonBackPic_Wobbuffet[];
extern const u8 gMonShinyPalette_Wobbuffet[];
extern const u8 gMonIcon_Wobbuffet[];
extern const u8 gMonFootprint_Wobbuffet[];
extern const u8 gMonFrontPic_Girafarig[];
extern const u8 gMonPalette_Girafarig[];
extern const u8 gMonBackPic_Girafarig[];
extern const u8 gMonShinyPalette_Girafarig[];
extern const u8 gMonIcon_Girafarig[];
extern const u8 gMonFootprint_Girafarig[];
extern const u8 gMonFrontPic_Pineco[];
extern const u8 gMonPalette_Pineco[];
extern const u8 gMonBackPic_Pineco[];
extern const u8 gMonShinyPalette_Pineco[];
extern const u8 gMonIcon_Pineco[];
extern const u8 gMonFootprint_Pineco[];
extern const u8 gMonFrontPic_Forretress[];
extern const u8 gMonPalette_Forretress[];
extern const u8 gMonBackPic_Forretress[];
extern const u8 gMonShinyPalette_Forretress[];
extern const u8 gMonIcon_Forretress[];
extern const u8 gMonFootprint_Forretress[];
extern const u8 gMonFrontPic_Dunsparce[];
extern const u8 gMonPalette_Dunsparce[];
extern const u8 gMonBackPic_Dunsparce[];
extern const u8 gMonShinyPalette_Dunsparce[];
extern const u8 gMonIcon_Dunsparce[];
extern const u8 gMonFootprint_Dunsparce[];
extern const u8 gMonFrontPic_Gligar[];
extern const u8 gMonPalette_Gligar[];
extern const u8 gMonBackPic_Gligar[];
extern const u8 gMonShinyPalette_Gligar[];
extern const u8 gMonIcon_Gligar[];
extern const u8 gMonFootprint_Gligar[];
extern const u8 gMonFrontPic_Steelix[];
extern const u8 gMonPalette_Steelix[];
extern const u8 gMonBackPic_Steelix[];
extern const u8 gMonShinyPalette_Steelix[];
extern const u8 gMonIcon_Steelix[];
extern const u8 gMonFootprint_Steelix[];
extern const u8 gMonFrontPic_Snubbull[];
extern const u8 gMonPalette_Snubbull[];
extern const u8 gMonBackPic_Snubbull[];
extern const u8 gMonShinyPalette_Snubbull[];
extern const u8 gMonIcon_Snubbull[];
extern const u8 gMonFootprint_Snubbull[];
extern const u8 gMonFrontPic_Granbull[];
extern const u8 gMonPalette_Granbull[];
extern const u8 gMonBackPic_Granbull[];
extern const u8 gMonShinyPalette_Granbull[];
extern const u8 gMonIcon_Granbull[];
extern const u8 gMonFootprint_Granbull[];
extern const u8 gMonFrontPic_Qwilfish[];
extern const u8 gMonPalette_Qwilfish[];
extern const u8 gMonBackPic_Qwilfish[];
extern const u8 gMonShinyPalette_Qwilfish[];
extern const u8 gMonIcon_Qwilfish[];
extern const u8 gMonFootprint_Qwilfish[];
extern const u8 gMonFrontPic_Scizor[];
extern const u8 gMonPalette_Scizor[];
extern const u8 gMonBackPic_Scizor[];
extern const u8 gMonShinyPalette_Scizor[];
extern const u8 gMonIcon_Scizor[];
extern const u8 gMonFootprint_Scizor[];
extern const u8 gMonFrontPic_Shuckle[];
extern const u8 gMonPalette_Shuckle[];
extern const u8 gMonBackPic_Shuckle[];
extern const u8 gMonShinyPalette_Shuckle[];
extern const u8 gMonIcon_Shuckle[];
extern const u8 gMonFootprint_Shuckle[];
extern const u8 gMonFrontPic_Heracross[];
extern const u8 gMonPalette_Heracross[];
extern const u8 gMonBackPic_Heracross[];
extern const u8 gMonShinyPalette_Heracross[];
extern const u8 gMonIcon_Heracross[];
extern const u8 gMonFootprint_Heracross[];
extern const u8 gMonFrontPic_Sneasel[];
extern const u8 gMonPalette_Sneasel[];
extern const u8 gMonBackPic_Sneasel[];
extern const u8 gMonShinyPalette_Sneasel[];
extern const u8 gMonIcon_Sneasel[];
extern const u8 gMonFootprint_Sneasel[];
extern const u8 gMonFrontPic_Teddiursa[];
extern const u8 gMonPalette_Teddiursa[];
extern const u8 gMonBackPic_Teddiursa[];
extern const u8 gMonShinyPalette_Teddiursa[];
extern const u8 gMonIcon_Teddiursa[];
extern const u8 gMonFootprint_Teddiursa[];
extern const u8 gMonFrontPic_Ursaring[];
extern const u8 gMonPalette_Ursaring[];
extern const u8 gMonBackPic_Ursaring[];
extern const u8 gMonShinyPalette_Ursaring[];
extern const u8 gMonIcon_Ursaring[];
extern const u8 gMonFootprint_Ursaring[];
extern const u8 gMonFrontPic_Slugma[];
extern const u8 gMonPalette_Slugma[];
extern const u8 gMonBackPic_Slugma[];
extern const u8 gMonShinyPalette_Slugma[];
extern const u8 gMonIcon_Slugma[];
extern const u8 gMonFootprint_Slugma[];
extern const u8 gMonFrontPic_Magcargo[];
extern const u8 gMonPalette_Magcargo[];
extern const u8 gMonBackPic_Magcargo[];
extern const u8 gMonShinyPalette_Magcargo[];
extern const u8 gMonIcon_Magcargo[];
extern const u8 gMonFootprint_Magcargo[];
extern const u8 gMonFrontPic_Swinub[];
extern const u8 gMonPalette_Swinub[];
extern const u8 gMonBackPic_Swinub[];
extern const u8 gMonShinyPalette_Swinub[];
extern const u8 gMonIcon_Swinub[];
extern const u8 gMonFootprint_Swinub[];
extern const u8 gMonFrontPic_Piloswine[];
extern const u8 gMonPalette_Piloswine[];
extern const u8 gMonBackPic_Piloswine[];
extern const u8 gMonShinyPalette_Piloswine[];
extern const u8 gMonIcon_Piloswine[];
extern const u8 gMonFootprint_Piloswine[];
extern const u8 gMonFrontPic_Corsola[];
extern const u8 gMonPalette_Corsola[];
extern const u8 gMonBackPic_Corsola[];
extern const u8 gMonShinyPalette_Corsola[];
extern const u8 gMonIcon_Corsola[];
extern const u8 gMonFootprint_Corsola[];
extern const u8 gMonFrontPic_Remoraid[];
extern const u8 gMonPalette_Remoraid[];
extern const u8 gMonBackPic_Remoraid[];
extern const u8 gMonShinyPalette_Remoraid[];
extern const u8 gMonIcon_Remoraid[];
extern const u8 gMonFootprint_Remoraid[];
extern const u8 gMonFrontPic_Octillery[];
extern const u8 gMonPalette_Octillery[];
extern const u8 gMonBackPic_Octillery[];
extern const u8 gMonShinyPalette_Octillery[];
extern const u8 gMonIcon_Octillery[];
extern const u8 gMonFootprint_Octillery[];
extern const u8 gMonFrontPic_Delibird[];
extern const u8 gMonPalette_Delibird[];
extern const u8 gMonBackPic_Delibird[];
extern const u8 gMonShinyPalette_Delibird[];
extern const u8 gMonIcon_Delibird[];
extern const u8 gMonFootprint_Delibird[];
extern const u8 gMonFrontPic_Mantine[];
extern const u8 gMonPalette_Mantine[];
extern const u8 gMonBackPic_Mantine[];
extern const u8 gMonShinyPalette_Mantine[];
extern const u8 gMonIcon_Mantine[];
extern const u8 gMonFootprint_Mantine[];
extern const u8 gMonFrontPic_Skarmory[];
extern const u8 gMonPalette_Skarmory[];
extern const u8 gMonBackPic_Skarmory[];
extern const u8 gMonShinyPalette_Skarmory[];
extern const u8 gMonIcon_Skarmory[];
extern const u8 gMonFootprint_Skarmory[];
extern const u8 gMonFrontPic_Houndour[];
extern const u8 gMonPalette_Houndour[];
extern const u8 gMonBackPic_Houndour[];
extern const u8 gMonShinyPalette_Houndour[];
extern const u8 gMonIcon_Houndour[];
extern const u8 gMonFootprint_Houndour[];
extern const u8 gMonFrontPic_Houndoom[];
extern const u8 gMonPalette_Houndoom[];
extern const u8 gMonBackPic_Houndoom[];
extern const u8 gMonShinyPalette_Houndoom[];
extern const u8 gMonIcon_Houndoom[];
extern const u8 gMonFootprint_Houndoom[];
extern const u8 gMonFrontPic_Kingdra[];
extern const u8 gMonPalette_Kingdra[];
extern const u8 gMonBackPic_Kingdra[];
extern const u8 gMonShinyPalette_Kingdra[];
extern const u8 gMonIcon_Kingdra[];
extern const u8 gMonFootprint_Kingdra[];
extern const u8 gMonFrontPic_Phanpy[];
extern const u8 gMonPalette_Phanpy[];
extern const u8 gMonBackPic_Phanpy[];
extern const u8 gMonShinyPalette_Phanpy[];
extern const u8 gMonIcon_Phanpy[];
extern const u8 gMonFootprint_Phanpy[];
extern const u8 gMonFrontPic_Donphan[];
extern const u8 gMonPalette_Donphan[];
extern const u8 gMonBackPic_Donphan[];
extern const u8 gMonShinyPalette_Donphan[];
extern const u8 gMonIcon_Donphan[];
extern const u8 gMonFootprint_Donphan[];
extern const u8 gMonFrontPic_Porygon2[];
extern const u8 gMonPalette_Porygon2[];
extern const u8 gMonBackPic_Porygon2[];
extern const u8 gMonShinyPalette_Porygon2[];
extern const u8 gMonIcon_Porygon2[];
extern const u8 gMonFootprint_Porygon2[];
extern const u8 gMonFrontPic_Stantler[];
extern const u8 gMonPalette_Stantler[];
extern const u8 gMonBackPic_Stantler[];
extern const u8 gMonShinyPalette_Stantler[];
extern const u8 gMonIcon_Stantler[];
extern const u8 gMonFootprint_Stantler[];
extern const u8 gMonFrontPic_Smeargle[];
extern const u8 gMonPalette_Smeargle[];
extern const u8 gMonBackPic_Smeargle[];
extern const u8 gMonShinyPalette_Smeargle[];
extern const u8 gMonIcon_Smeargle[];
extern const u8 gMonFootprint_Smeargle[];
extern const u8 gMonFrontPic_Tyrogue[];
extern const u8 gMonPalette_Tyrogue[];
extern const u8 gMonBackPic_Tyrogue[];
extern const u8 gMonShinyPalette_Tyrogue[];
extern const u8 gMonIcon_Tyrogue[];
extern const u8 gMonFootprint_Tyrogue[];
extern const u8 gMonFrontPic_Hitmontop[];
extern const u8 gMonPalette_Hitmontop[];
extern const u8 gMonBackPic_Hitmontop[];
extern const u8 gMonShinyPalette_Hitmontop[];
extern const u8 gMonIcon_Hitmontop[];
extern const u8 gMonFootprint_Hitmontop[];
extern const u8 gMonFrontPic_Smoochum[];
extern const u8 gMonPalette_Smoochum[];
extern const u8 gMonBackPic_Smoochum[];
extern const u8 gMonShinyPalette_Smoochum[];
extern const u8 gMonIcon_Smoochum[];
extern const u8 gMonFootprint_Smoochum[];
extern const u8 gMonFrontPic_Elekid[];
extern const u8 gMonPalette_Elekid[];
extern const u8 gMonBackPic_Elekid[];
extern const u8 gMonShinyPalette_Elekid[];
extern const u8 gMonIcon_Elekid[];
extern const u8 gMonFootprint_Elekid[];
extern const u8 gMonFrontPic_Magby[];
extern const u8 gMonPalette_Magby[];
extern const u8 gMonBackPic_Magby[];
extern const u8 gMonShinyPalette_Magby[];
extern const u8 gMonIcon_Magby[];
extern const u8 gMonFootprint_Magby[];
extern const u8 gMonFrontPic_Miltank[];
extern const u8 gMonPalette_Miltank[];
extern const u8 gMonBackPic_Miltank[];
extern const u8 gMonShinyPalette_Miltank[];
extern const u8 gMonIcon_Miltank[];
extern const u8 gMonFootprint_Miltank[];
extern const u8 gMonFrontPic_Blissey[];
extern const u8 gMonPalette_Blissey[];
extern const u8 gMonBackPic_Blissey[];
extern const u8 gMonShinyPalette_Blissey[];
extern const u8 gMonIcon_Blissey[];
extern const u8 gMonFootprint_Blissey[];
extern const u8 gMonFrontPic_Raikou[];
extern const u8 gMonPalette_Raikou[];
extern const u8 gMonBackPic_Raikou[];
extern const u8 gMonShinyPalette_Raikou[];
extern const u8 gMonIcon_Raikou[];
extern const u8 gMonFootprint_Raikou[];
extern const u8 gMonFrontPic_Entei[];
extern const u8 gMonPalette_Entei[];
extern const u8 gMonBackPic_Entei[];
extern const u8 gMonShinyPalette_Entei[];
extern const u8 gMonIcon_Entei[];
extern const u8 gMonFootprint_Entei[];
extern const u8 gMonFrontPic_Suicune[];
extern const u8 gMonPalette_Suicune[];
extern const u8 gMonBackPic_Suicune[];
extern const u8 gMonShinyPalette_Suicune[];
extern const u8 gMonIcon_Suicune[];
extern const u8 gMonFootprint_Suicune[];
extern const u8 gMonFrontPic_Larvitar[];
extern const u8 gMonPalette_Larvitar[];
extern const u8 gMonBackPic_Larvitar[];
extern const u8 gMonShinyPalette_Larvitar[];
extern const u8 gMonIcon_Larvitar[];
extern const u8 gMonFootprint_Larvitar[];
extern const u8 gMonFrontPic_Pupitar[];
extern const u8 gMonPalette_Pupitar[];
extern const u8 gMonBackPic_Pupitar[];
extern const u8 gMonShinyPalette_Pupitar[];
extern const u8 gMonIcon_Pupitar[];
extern const u8 gMonFootprint_Pupitar[];
extern const u8 gMonFrontPic_Tyranitar[];
extern const u8 gMonPalette_Tyranitar[];
extern const u8 gMonBackPic_Tyranitar[];
extern const u8 gMonShinyPalette_Tyranitar[];
extern const u8 gMonIcon_Tyranitar[];
extern const u8 gMonFootprint_Tyranitar[];
extern const u8 gMonFrontPic_Lugia[];
extern const u8 gMonPalette_Lugia[];
extern const u8 gMonBackPic_Lugia[];
extern const u8 gMonShinyPalette_Lugia[];
extern const u8 gMonIcon_Lugia[];
extern const u8 gMonFootprint_Lugia[];
extern const u8 gMonFrontPic_HoOh[];
extern const u8 gMonPalette_HoOh[];
extern const u8 gMonBackPic_HoOh[];
extern const u8 gMonShinyPalette_HoOh[];
extern const u8 gMonIcon_HoOh[];
extern const u8 gMonFootprint_HoOh[];
extern const u8 gMonFrontPic_Celebi[];
extern const u8 gMonPalette_Celebi[];
extern const u8 gMonBackPic_Celebi[];
extern const u8 gMonShinyPalette_Celebi[];
extern const u8 gMonIcon_Celebi[];
extern const u8 gMonFootprint_Celebi[];
extern const u8 gMonFrontPic_QuestionMark[];
extern const u8 gMonPalette_QuestionMark[];
extern const u8 gMonBackPic_QuestionMark[];
extern const u8 gMonShinyPalette_QuestionMark[];
extern const u8 gMonFrontPic_Treecko[];
extern const u8 gMonPalette_Treecko[];
extern const u8 gMonBackPic_Treecko[];
extern const u8 gMonShinyPalette_Treecko[];
extern const u8 gMonIcon_Treecko[];
extern const u8 gMonFootprint_Treecko[];
extern const u8 gMonFrontPic_Grovyle[];
extern const u8 gMonPalette_Grovyle[];
extern const u8 gMonBackPic_Grovyle[];
extern const u8 gMonShinyPalette_Grovyle[];
extern const u8 gMonIcon_Grovyle[];
extern const u8 gMonFootprint_Grovyle[];
extern const u8 gMonFrontPic_Sceptile[];
extern const u8 gMonPalette_Sceptile[];
extern const u8 gMonBackPic_Sceptile[];
extern const u8 gMonShinyPalette_Sceptile[];
extern const u8 gMonIcon_Sceptile[];
extern const u8 gMonFootprint_Sceptile[];
extern const u8 gMonFrontPic_Torchic[];
extern const u8 gMonPalette_Torchic[];
extern const u8 gMonBackPic_Torchic[];
extern const u8 gMonShinyPalette_Torchic[];
extern const u8 gMonIcon_Torchic[];
extern const u8 gMonFootprint_Torchic[];
extern const u8 gMonFrontPic_Combusken[];
extern const u8 gMonPalette_Combusken[];
extern const u8 gMonBackPic_Combusken[];
extern const u8 gMonShinyPalette_Combusken[];
extern const u8 gMonIcon_Combusken[];
extern const u8 gMonFootprint_Combusken[];
extern const u8 gMonFrontPic_Blaziken[];
extern const u8 gMonPalette_Blaziken[];
extern const u8 gMonBackPic_Blaziken[];
extern const u8 gMonShinyPalette_Blaziken[];
extern const u8 gMonIcon_Blaziken[];
extern const u8 gMonFootprint_Blaziken[];
extern const u8 gMonFrontPic_Mudkip[];
extern const u8 gMonPalette_Mudkip[];
extern const u8 gMonBackPic_Mudkip[];
extern const u8 gMonShinyPalette_Mudkip[];
extern const u8 gMonIcon_Mudkip[];
extern const u8 gMonFootprint_Mudkip[];
extern const u8 gMonFrontPic_Marshtomp[];
extern const u8 gMonPalette_Marshtomp[];
extern const u8 gMonBackPic_Marshtomp[];
extern const u8 gMonShinyPalette_Marshtomp[];
extern const u8 gMonIcon_Marshtomp[];
extern const u8 gMonFootprint_Marshtomp[];
extern const u8 gMonFrontPic_Swampert[];
extern const u8 gMonPalette_Swampert[];
extern const u8 gMonBackPic_Swampert[];
extern const u8 gMonShinyPalette_Swampert[];
extern const u8 gMonIcon_Swampert[];
extern const u8 gMonFootprint_Swampert[];
extern const u8 gMonFrontPic_Poochyena[];
extern const u8 gMonPalette_Poochyena[];
extern const u8 gMonBackPic_Poochyena[];
extern const u8 gMonShinyPalette_Poochyena[];
extern const u8 gMonIcon_Poochyena[];
extern const u8 gMonFootprint_Poochyena[];
extern const u8 gMonFrontPic_Mightyena[];
extern const u8 gMonPalette_Mightyena[];
extern const u8 gMonBackPic_Mightyena[];
extern const u8 gMonShinyPalette_Mightyena[];
extern const u8 gMonIcon_Mightyena[];
extern const u8 gMonFootprint_Mightyena[];
extern const u8 gMonFrontPic_Zigzagoon[];
extern const u8 gMonPalette_Zigzagoon[];
extern const u8 gMonBackPic_Zigzagoon[];
extern const u8 gMonShinyPalette_Zigzagoon[];
extern const u8 gMonIcon_Zigzagoon[];
extern const u8 gMonFootprint_Zigzagoon[];
extern const u8 gMonFrontPic_Linoone[];
extern const u8 gMonPalette_Linoone[];
extern const u8 gMonBackPic_Linoone[];
extern const u8 gMonShinyPalette_Linoone[];
extern const u8 gMonIcon_Linoone[];
extern const u8 gMonFootprint_Linoone[];
extern const u8 gMonFrontPic_Wurmple[];
extern const u8 gMonPalette_Wurmple[];
extern const u8 gMonBackPic_Wurmple[];
extern const u8 gMonShinyPalette_Wurmple[];
extern const u8 gMonIcon_Wurmple[];
extern const u8 gMonFootprint_Wurmple[];
extern const u8 gMonFrontPic_Silcoon[];
extern const u8 gMonPalette_Silcoon[];
extern const u8 gMonBackPic_Silcoon[];
extern const u8 gMonShinyPalette_Silcoon[];
extern const u8 gMonIcon_Silcoon[];
extern const u8 gMonFootprint_Silcoon[];
extern const u8 gMonFrontPic_Beautifly[];
extern const u8 gMonPalette_Beautifly[];
extern const u8 gMonBackPic_Beautifly[];
extern const u8 gMonShinyPalette_Beautifly[];
extern const u8 gMonIcon_Beautifly[];
extern const u8 gMonFootprint_Beautifly[];
extern const u8 gMonFrontPic_Cascoon[];
extern const u8 gMonPalette_Cascoon[];
extern const u8 gMonBackPic_Cascoon[];
extern const u8 gMonShinyPalette_Cascoon[];
extern const u8 gMonIcon_Cascoon[];
extern const u8 gMonFootprint_Cascoon[];
extern const u8 gMonFrontPic_Dustox[];
extern const u8 gMonPalette_Dustox[];
extern const u8 gMonBackPic_Dustox[];
extern const u8 gMonShinyPalette_Dustox[];
extern const u8 gMonIcon_Dustox[];
extern const u8 gMonFootprint_Dustox[];
extern const u8 gMonFrontPic_Lotad[];
extern const u8 gMonPalette_Lotad[];
extern const u8 gMonBackPic_Lotad[];
extern const u8 gMonShinyPalette_Lotad[];
extern const u8 gMonIcon_Lotad[];
extern const u8 gMonFootprint_Lotad[];
extern const u8 gMonFrontPic_Lombre[];
extern const u8 gMonPalette_Lombre[];
extern const u8 gMonBackPic_Lombre[];
extern const u8 gMonShinyPalette_Lombre[];
extern const u8 gMonIcon_Lombre[];
extern const u8 gMonFootprint_Lombre[];
extern const u8 gMonFrontPic_Ludicolo[];
extern const u8 gMonPalette_Ludicolo[];
extern const u8 gMonBackPic_Ludicolo[];
extern const u8 gMonShinyPalette_Ludicolo[];
extern const u8 gMonIcon_Ludicolo[];
extern const u8 gMonFootprint_Ludicolo[];
extern const u8 gMonFrontPic_Seedot[];
extern const u8 gMonPalette_Seedot[];
extern const u8 gMonBackPic_Seedot[];
extern const u8 gMonShinyPalette_Seedot[];
extern const u8 gMonIcon_Seedot[];
extern const u8 gMonFootprint_Seedot[];
extern const u8 gMonFrontPic_Nuzleaf[];
extern const u8 gMonPalette_Nuzleaf[];
extern const u8 gMonBackPic_Nuzleaf[];
extern const u8 gMonShinyPalette_Nuzleaf[];
extern const u8 gMonIcon_Nuzleaf[];
extern const u8 gMonFootprint_Nuzleaf[];
extern const u8 gMonFrontPic_Shiftry[];
extern const u8 gMonPalette_Shiftry[];
extern const u8 gMonBackPic_Shiftry[];
extern const u8 gMonShinyPalette_Shiftry[];
extern const u8 gMonIcon_Shiftry[];
extern const u8 gMonFootprint_Shiftry[];
extern const u8 gMonFrontPic_Nincada[];
extern const u8 gMonPalette_Nincada[];
extern const u8 gMonBackPic_Nincada[];
extern const u8 gMonShinyPalette_Nincada[];
extern const u8 gMonIcon_Nincada[];
extern const u8 gMonFootprint_Nincada[];
extern const u8 gMonFrontPic_Ninjask[];
extern const u8 gMonPalette_Ninjask[];
extern const u8 gMonBackPic_Ninjask[];
extern const u8 gMonShinyPalette_Ninjask[];
extern const u8 gMonIcon_Ninjask[];
extern const u8 gMonFootprint_Ninjask[];
extern const u8 gMonFrontPic_Shedinja[];
extern const u8 gMonPalette_Shedinja[];
extern const u8 gMonBackPic_Shedinja[];
extern const u8 gMonShinyPalette_Shedinja[];
extern const u8 gMonIcon_Shedinja[];
extern const u8 gMonFootprint_Shedinja[];
extern const u8 gMonFrontPic_Taillow[];
extern const u8 gMonPalette_Taillow[];
extern const u8 gMonBackPic_Taillow[];
extern const u8 gMonShinyPalette_Taillow[];
extern const u8 gMonIcon_Taillow[];
extern const u8 gMonFootprint_Taillow[];
extern const u8 gMonFrontPic_Swellow[];
extern const u8 gMonPalette_Swellow[];
extern const u8 gMonBackPic_Swellow[];
extern const u8 gMonShinyPalette_Swellow[];
extern const u8 gMonIcon_Swellow[];
extern const u8 gMonFootprint_Swellow[];
extern const u8 gMonFrontPic_Shroomish[];
extern const u8 gMonPalette_Shroomish[];
extern const u8 gMonBackPic_Shroomish[];
extern const u8 gMonShinyPalette_Shroomish[];
extern const u8 gMonIcon_Shroomish[];
extern const u8 gMonFootprint_Shroomish[];
extern const u8 gMonFrontPic_Breloom[];
extern const u8 gMonPalette_Breloom[];
extern const u8 gMonBackPic_Breloom[];
extern const u8 gMonShinyPalette_Breloom[];
extern const u8 gMonIcon_Breloom[];
extern const u8 gMonFootprint_Breloom[];
extern const u8 gMonFrontPic_Spinda[];
extern const u8 gMonPalette_Spinda[];
extern const u8 gMonBackPic_Spinda[];
extern const u8 gMonShinyPalette_Spinda[];
extern const u8 gMonIcon_Spinda[];
extern const u8 gMonFootprint_Spinda[];
extern const u8 gMonFrontPic_Wingull[];
extern const u8 gMonPalette_Wingull[];
extern const u8 gMonBackPic_Wingull[];
extern const u8 gMonShinyPalette_Wingull[];
extern const u8 gMonIcon_Wingull[];
extern const u8 gMonFootprint_Wingull[];
extern const u8 gMonFrontPic_Pelipper[];
extern const u8 gMonPalette_Pelipper[];
extern const u8 gMonBackPic_Pelipper[];
extern const u8 gMonShinyPalette_Pelipper[];
extern const u8 gMonIcon_Pelipper[];
extern const u8 gMonFootprint_Pelipper[];
extern const u8 gMonFrontPic_Surskit[];
extern const u8 gMonPalette_Surskit[];
extern const u8 gMonBackPic_Surskit[];
extern const u8 gMonShinyPalette_Surskit[];
extern const u8 gMonIcon_Surskit[];
extern const u8 gMonFootprint_Surskit[];
extern const u8 gMonFrontPic_Masquerain[];
extern const u8 gMonPalette_Masquerain[];
extern const u8 gMonBackPic_Masquerain[];
extern const u8 gMonShinyPalette_Masquerain[];
extern const u8 gMonIcon_Masquerain[];
extern const u8 gMonFootprint_Masquerain[];
extern const u8 gMonFrontPic_Wailmer[];
extern const u8 gMonPalette_Wailmer[];
extern const u8 gMonBackPic_Wailmer[];
extern const u8 gMonShinyPalette_Wailmer[];
extern const u8 gMonIcon_Wailmer[];
extern const u8 gMonFootprint_Wailmer[];
extern const u8 gMonFrontPic_Wailord[];
extern const u8 gMonPalette_Wailord[];
extern const u8 gMonBackPic_Wailord[];
extern const u8 gMonShinyPalette_Wailord[];
extern const u8 gMonIcon_Wailord[];
extern const u8 gMonFootprint_Wailord[];
extern const u8 gMonFrontPic_Skitty[];
extern const u8 gMonPalette_Skitty[];
extern const u8 gMonBackPic_Skitty[];
extern const u8 gMonShinyPalette_Skitty[];
extern const u8 gMonIcon_Skitty[];
extern const u8 gMonFootprint_Skitty[];
extern const u8 gMonFrontPic_Delcatty[];
extern const u8 gMonPalette_Delcatty[];
extern const u8 gMonBackPic_Delcatty[];
extern const u8 gMonShinyPalette_Delcatty[];
extern const u8 gMonIcon_Delcatty[];
extern const u8 gMonFootprint_Delcatty[];
extern const u8 gMonFrontPic_Kecleon[];
extern const u8 gMonPalette_Kecleon[];
extern const u8 gMonBackPic_Kecleon[];
extern const u8 gMonShinyPalette_Kecleon[];
extern const u8 gMonIcon_Kecleon[];
extern const u8 gMonFootprint_Kecleon[];
extern const u8 gMonFrontPic_Baltoy[];
extern const u8 gMonPalette_Baltoy[];
extern const u8 gMonBackPic_Baltoy[];
extern const u8 gMonShinyPalette_Baltoy[];
extern const u8 gMonIcon_Baltoy[];
extern const u8 gMonFootprint_Baltoy[];
extern const u8 gMonFrontPic_Claydol[];
extern const u8 gMonPalette_Claydol[];
extern const u8 gMonBackPic_Claydol[];
extern const u8 gMonShinyPalette_Claydol[];
extern const u8 gMonIcon_Claydol[];
extern const u8 gMonFootprint_Claydol[];
extern const u8 gMonFrontPic_Nosepass[];
extern const u8 gMonPalette_Nosepass[];
extern const u8 gMonBackPic_Nosepass[];
extern const u8 gMonShinyPalette_Nosepass[];
extern const u8 gMonIcon_Nosepass[];
extern const u8 gMonFootprint_Nosepass[];
extern const u8 gMonFrontPic_Torkoal[];
extern const u8 gMonPalette_Torkoal[];
extern const u8 gMonBackPic_Torkoal[];
extern const u8 gMonShinyPalette_Torkoal[];
extern const u8 gMonIcon_Torkoal[];
extern const u8 gMonFootprint_Torkoal[];
extern const u8 gMonFrontPic_Sableye[];
extern const u8 gMonPalette_Sableye[];
extern const u8 gMonBackPic_Sableye[];
extern const u8 gMonShinyPalette_Sableye[];
extern const u8 gMonIcon_Sableye[];
extern const u8 gMonFootprint_Sableye[];
extern const u8 gMonFrontPic_Barboach[];
extern const u8 gMonPalette_Barboach[];
extern const u8 gMonBackPic_Barboach[];
extern const u8 gMonShinyPalette_Barboach[];
extern const u8 gMonIcon_Barboach[];
extern const u8 gMonFootprint_Barboach[];
extern const u8 gMonFrontPic_Whiscash[];
extern const u8 gMonPalette_Whiscash[];
extern const u8 gMonBackPic_Whiscash[];
extern const u8 gMonShinyPalette_Whiscash[];
extern const u8 gMonIcon_Whiscash[];
extern const u8 gMonFootprint_Whiscash[];
extern const u8 gMonFrontPic_Luvdisc[];
extern const u8 gMonPalette_Luvdisc[];
extern const u8 gMonBackPic_Luvdisc[];
extern const u8 gMonShinyPalette_Luvdisc[];
extern const u8 gMonIcon_Luvdisc[];
extern const u8 gMonFootprint_Luvdisc[];
extern const u8 gMonFrontPic_Corphish[];
extern const u8 gMonPalette_Corphish[];
extern const u8 gMonBackPic_Corphish[];
extern const u8 gMonShinyPalette_Corphish[];
extern const u8 gMonIcon_Corphish[];
extern const u8 gMonFootprint_Corphish[];
extern const u8 gMonFrontPic_Crawdaunt[];
extern const u8 gMonPalette_Crawdaunt[];
extern const u8 gMonBackPic_Crawdaunt[];
extern const u8 gMonShinyPalette_Crawdaunt[];
extern const u8 gMonIcon_Crawdaunt[];
extern const u8 gMonFootprint_Crawdaunt[];
extern const u8 gMonFrontPic_Feebas[];
extern const u8 gMonPalette_Feebas[];
extern const u8 gMonBackPic_Feebas[];
extern const u8 gMonShinyPalette_Feebas[];
extern const u8 gMonIcon_Feebas[];
extern const u8 gMonFootprint_Feebas[];
extern const u8 gMonFrontPic_Milotic[];
extern const u8 gMonPalette_Milotic[];
extern const u8 gMonBackPic_Milotic[];
extern const u8 gMonShinyPalette_Milotic[];
extern const u8 gMonIcon_Milotic[];
extern const u8 gMonFootprint_Milotic[];
extern const u8 gMonFrontPic_Carvanha[];
extern const u8 gMonPalette_Carvanha[];
extern const u8 gMonBackPic_Carvanha[];
extern const u8 gMonShinyPalette_Carvanha[];
extern const u8 gMonIcon_Carvanha[];
extern const u8 gMonFootprint_Carvanha[];
extern const u8 gMonFrontPic_Sharpedo[];
extern const u8 gMonPalette_Sharpedo[];
extern const u8 gMonBackPic_Sharpedo[];
extern const u8 gMonShinyPalette_Sharpedo[];
extern const u8 gMonIcon_Sharpedo[];
extern const u8 gMonFootprint_Sharpedo[];
extern const u8 gMonFrontPic_Trapinch[];
extern const u8 gMonPalette_Trapinch[];
extern const u8 gMonBackPic_Trapinch[];
extern const u8 gMonShinyPalette_Trapinch[];
extern const u8 gMonIcon_Trapinch[];
extern const u8 gMonFootprint_Trapinch[];
extern const u8 gMonFrontPic_Vibrava[];
extern const u8 gMonPalette_Vibrava[];
extern const u8 gMonBackPic_Vibrava[];
extern const u8 gMonShinyPalette_Vibrava[];
extern const u8 gMonIcon_Vibrava[];
extern const u8 gMonFootprint_Vibrava[];
extern const u8 gMonFrontPic_Flygon[];
extern const u8 gMonPalette_Flygon[];
extern const u8 gMonBackPic_Flygon[];
extern const u8 gMonShinyPalette_Flygon[];
extern const u8 gMonIcon_Flygon[];
extern const u8 gMonFootprint_Flygon[];
extern const u8 gMonFrontPic_Makuhita[];
extern const u8 gMonPalette_Makuhita[];
extern const u8 gMonBackPic_Makuhita[];
extern const u8 gMonShinyPalette_Makuhita[];
extern const u8 gMonIcon_Makuhita[];
extern const u8 gMonFootprint_Makuhita[];
extern const u8 gMonFrontPic_Hariyama[];
extern const u8 gMonPalette_Hariyama[];
extern const u8 gMonBackPic_Hariyama[];
extern const u8 gMonShinyPalette_Hariyama[];
extern const u8 gMonIcon_Hariyama[];
extern const u8 gMonFootprint_Hariyama[];
extern const u8 gMonFrontPic_Electrike[];
extern const u8 gMonPalette_Electrike[];
extern const u8 gMonBackPic_Electrike[];
extern const u8 gMonShinyPalette_Electrike[];
extern const u8 gMonIcon_Electrike[];
extern const u8 gMonFootprint_Electrike[];
extern const u8 gMonFrontPic_Manectric[];
extern const u8 gMonPalette_Manectric[];
extern const u8 gMonBackPic_Manectric[];
extern const u8 gMonShinyPalette_Manectric[];
extern const u8 gMonIcon_Manectric[];
extern const u8 gMonFootprint_Manectric[];
extern const u8 gMonFrontPic_Numel[];
extern const u8 gMonPalette_Numel[];
extern const u8 gMonBackPic_Numel[];
extern const u8 gMonShinyPalette_Numel[];
extern const u8 gMonIcon_Numel[];
extern const u8 gMonFootprint_Numel[];
extern const u8 gMonFrontPic_Camerupt[];
extern const u8 gMonPalette_Camerupt[];
extern const u8 gMonBackPic_Camerupt[];
extern const u8 gMonShinyPalette_Camerupt[];
extern const u8 gMonIcon_Camerupt[];
extern const u8 gMonFootprint_Camerupt[];
extern const u8 gMonFrontPic_Spheal[];
extern const u8 gMonPalette_Spheal[];
extern const u8 gMonBackPic_Spheal[];
extern const u8 gMonShinyPalette_Spheal[];
extern const u8 gMonIcon_Spheal[];
extern const u8 gMonFootprint_Spheal[];
extern const u8 gMonFrontPic_Sealeo[];
extern const u8 gMonPalette_Sealeo[];
extern const u8 gMonBackPic_Sealeo[];
extern const u8 gMonShinyPalette_Sealeo[];
extern const u8 gMonIcon_Sealeo[];
extern const u8 gMonFootprint_Sealeo[];
extern const u8 gMonFrontPic_Walrein[];
extern const u8 gMonPalette_Walrein[];
extern const u8 gMonBackPic_Walrein[];
extern const u8 gMonShinyPalette_Walrein[];
extern const u8 gMonIcon_Walrein[];
extern const u8 gMonFootprint_Walrein[];
extern const u8 gMonFrontPic_Cacnea[];
extern const u8 gMonPalette_Cacnea[];
extern const u8 gMonBackPic_Cacnea[];
extern const u8 gMonShinyPalette_Cacnea[];
extern const u8 gMonIcon_Cacnea[];
extern const u8 gMonFootprint_Cacnea[];
extern const u8 gMonFrontPic_Cacturne[];
extern const u8 gMonPalette_Cacturne[];
extern const u8 gMonBackPic_Cacturne[];
extern const u8 gMonShinyPalette_Cacturne[];
extern const u8 gMonIcon_Cacturne[];
extern const u8 gMonFootprint_Cacturne[];
extern const u8 gMonFrontPic_Snorunt[];
extern const u8 gMonPalette_Snorunt[];
extern const u8 gMonBackPic_Snorunt[];
extern const u8 gMonShinyPalette_Snorunt[];
extern const u8 gMonIcon_Snorunt[];
extern const u8 gMonFootprint_Snorunt[];
extern const u8 gMonFrontPic_Glalie[];
extern const u8 gMonPalette_Glalie[];
extern const u8 gMonBackPic_Glalie[];
extern const u8 gMonShinyPalette_Glalie[];
extern const u8 gMonIcon_Glalie[];
extern const u8 gMonFootprint_Glalie[];
extern const u8 gMonFrontPic_Lunatone[];
extern const u8 gMonPalette_Lunatone[];
extern const u8 gMonBackPic_Lunatone[];
extern const u8 gMonShinyPalette_Lunatone[];
extern const u8 gMonIcon_Lunatone[];
extern const u8 gMonFootprint_Lunatone[];
extern const u8 gMonFrontPic_Solrock[];
extern const u8 gMonPalette_Solrock[];
extern const u8 gMonBackPic_Solrock[];
extern const u8 gMonShinyPalette_Solrock[];
extern const u8 gMonIcon_Solrock[];
extern const u8 gMonFootprint_Solrock[];
extern const u8 gMonFrontPic_Azurill[];
extern const u8 gMonPalette_Azurill[];
extern const u8 gMonBackPic_Azurill[];
extern const u8 gMonShinyPalette_Azurill[];
extern const u8 gMonIcon_Azurill[];
extern const u8 gMonFootprint_Azurill[];
extern const u8 gMonFrontPic_Spoink[];
extern const u8 gMonPalette_Spoink[];
extern const u8 gMonBackPic_Spoink[];
extern const u8 gMonShinyPalette_Spoink[];
extern const u8 gMonIcon_Spoink[];
extern const u8 gMonFootprint_Spoink[];
extern const u8 gMonFrontPic_Grumpig[];
extern const u8 gMonPalette_Grumpig[];
extern const u8 gMonBackPic_Grumpig[];
extern const u8 gMonShinyPalette_Grumpig[];
extern const u8 gMonIcon_Grumpig[];
extern const u8 gMonFootprint_Grumpig[];
extern const u8 gMonFrontPic_Plusle[];
extern const u8 gMonPalette_Plusle[];
extern const u8 gMonBackPic_Plusle[];
extern const u8 gMonShinyPalette_Plusle[];
extern const u8 gMonIcon_Plusle[];
extern const u8 gMonFootprint_Plusle[];
extern const u8 gMonFrontPic_Minun[];
extern const u8 gMonPalette_Minun[];
extern const u8 gMonBackPic_Minun[];
extern const u8 gMonShinyPalette_Minun[];
extern const u8 gMonIcon_Minun[];
extern const u8 gMonFootprint_Minun[];
extern const u8 gMonFrontPic_Mawile[];
extern const u8 gMonPalette_Mawile[];
extern const u8 gMonBackPic_Mawile[];
extern const u8 gMonShinyPalette_Mawile[];
extern const u8 gMonIcon_Mawile[];
extern const u8 gMonFootprint_Mawile[];
extern const u8 gMonFrontPic_Meditite[];
extern const u8 gMonPalette_Meditite[];
extern const u8 gMonBackPic_Meditite[];
extern const u8 gMonShinyPalette_Meditite[];
extern const u8 gMonIcon_Meditite[];
extern const u8 gMonFootprint_Meditite[];
extern const u8 gMonFrontPic_Medicham[];
extern const u8 gMonPalette_Medicham[];
extern const u8 gMonBackPic_Medicham[];
extern const u8 gMonShinyPalette_Medicham[];
extern const u8 gMonIcon_Medicham[];
extern const u8 gMonFootprint_Medicham[];
extern const u8 gMonFrontPic_Swablu[];
extern const u8 gMonPalette_Swablu[];
extern const u8 gMonBackPic_Swablu[];
extern const u8 gMonShinyPalette_Swablu[];
extern const u8 gMonIcon_Swablu[];
extern const u8 gMonFootprint_Swablu[];
extern const u8 gMonFrontPic_Altaria[];
extern const u8 gMonPalette_Altaria[];
extern const u8 gMonBackPic_Altaria[];
extern const u8 gMonShinyPalette_Altaria[];
extern const u8 gMonIcon_Altaria[];
extern const u8 gMonFootprint_Altaria[];
extern const u8 gMonFrontPic_Wynaut[];
extern const u8 gMonPalette_Wynaut[];
extern const u8 gMonBackPic_Wynaut[];
extern const u8 gMonShinyPalette_Wynaut[];
extern const u8 gMonIcon_Wynaut[];
extern const u8 gMonFootprint_Wynaut[];
extern const u8 gMonFrontPic_Duskull[];
extern const u8 gMonPalette_Duskull[];
extern const u8 gMonBackPic_Duskull[];
extern const u8 gMonShinyPalette_Duskull[];
extern const u8 gMonIcon_Duskull[];
extern const u8 gMonFootprint_Duskull[];
extern const u8 gMonFrontPic_Dusclops[];
extern const u8 gMonPalette_Dusclops[];
extern const u8 gMonBackPic_Dusclops[];
extern const u8 gMonShinyPalette_Dusclops[];
extern const u8 gMonIcon_Dusclops[];
extern const u8 gMonFootprint_Dusclops[];
extern const u8 gMonFrontPic_Roselia[];
extern const u8 gMonPalette_Roselia[];
extern const u8 gMonBackPic_Roselia[];
extern const u8 gMonShinyPalette_Roselia[];
extern const u8 gMonIcon_Roselia[];
extern const u8 gMonFootprint_Roselia[];
extern const u8 gMonFrontPic_Slakoth[];
extern const u8 gMonPalette_Slakoth[];
extern const u8 gMonBackPic_Slakoth[];
extern const u8 gMonShinyPalette_Slakoth[];
extern const u8 gMonIcon_Slakoth[];
extern const u8 gMonFootprint_Slakoth[];
extern const u8 gMonFrontPic_Vigoroth[];
extern const u8 gMonPalette_Vigoroth[];
extern const u8 gMonBackPic_Vigoroth[];
extern const u8 gMonShinyPalette_Vigoroth[];
extern const u8 gMonIcon_Vigoroth[];
extern const u8 gMonFootprint_Vigoroth[];
extern const u8 gMonFrontPic_Slaking[];
extern const u8 gMonPalette_Slaking[];
extern const u8 gMonBackPic_Slaking[];
extern const u8 gMonShinyPalette_Slaking[];
extern const u8 gMonIcon_Slaking[];
extern const u8 gMonFootprint_Slaking[];
extern const u8 gMonFrontPic_Gulpin[];
extern const u8 gMonPalette_Gulpin[];
extern const u8 gMonBackPic_Gulpin[];
extern const u8 gMonShinyPalette_Gulpin[];
extern const u8 gMonIcon_Gulpin[];
extern const u8 gMonFootprint_Gulpin[];
extern const u8 gMonFrontPic_Swalot[];
extern const u8 gMonPalette_Swalot[];
extern const u8 gMonBackPic_Swalot[];
extern const u8 gMonShinyPalette_Swalot[];
extern const u8 gMonIcon_Swalot[];
extern const u8 gMonFootprint_Swalot[];
extern const u8 gMonFrontPic_Tropius[];
extern const u8 gMonPalette_Tropius[];
extern const u8 gMonBackPic_Tropius[];
extern const u8 gMonShinyPalette_Tropius[];
extern const u8 gMonIcon_Tropius[];
extern const u8 gMonFootprint_Tropius[];
extern const u8 gMonFrontPic_Whismur[];
extern const u8 gMonPalette_Whismur[];
extern const u8 gMonBackPic_Whismur[];
extern const u8 gMonShinyPalette_Whismur[];
extern const u8 gMonIcon_Whismur[];
extern const u8 gMonFootprint_Whismur[];
extern const u8 gMonFrontPic_Loudred[];
extern const u8 gMonPalette_Loudred[];
extern const u8 gMonBackPic_Loudred[];
extern const u8 gMonShinyPalette_Loudred[];
extern const u8 gMonIcon_Loudred[];
extern const u8 gMonFootprint_Loudred[];
extern const u8 gMonFrontPic_Exploud[];
extern const u8 gMonPalette_Exploud[];
extern const u8 gMonBackPic_Exploud[];
extern const u8 gMonShinyPalette_Exploud[];
extern const u8 gMonIcon_Exploud[];
extern const u8 gMonFootprint_Exploud[];
extern const u8 gMonFrontPic_Clamperl[];
extern const u8 gMonPalette_Clamperl[];
extern const u8 gMonBackPic_Clamperl[];
extern const u8 gMonShinyPalette_Clamperl[];
extern const u8 gMonIcon_Clamperl[];
extern const u8 gMonFootprint_Clamperl[];
extern const u8 gMonFrontPic_Huntail[];
extern const u8 gMonPalette_Huntail[];
extern const u8 gMonBackPic_Huntail[];
extern const u8 gMonShinyPalette_Huntail[];
extern const u8 gMonIcon_Huntail[];
extern const u8 gMonFootprint_Huntail[];
extern const u8 gMonFrontPic_Gorebyss[];
extern const u8 gMonPalette_Gorebyss[];
extern const u8 gMonBackPic_Gorebyss[];
extern const u8 gMonShinyPalette_Gorebyss[];
extern const u8 gMonIcon_Gorebyss[];
extern const u8 gMonFootprint_Gorebyss[];
extern const u8 gMonFrontPic_Absol[];
extern const u8 gMonPalette_Absol[];
extern const u8 gMonBackPic_Absol[];
extern const u8 gMonShinyPalette_Absol[];
extern const u8 gMonIcon_Absol[];
extern const u8 gMonFootprint_Absol[];
extern const u8 gMonFrontPic_Shuppet[];
extern const u8 gMonPalette_Shuppet[];
extern const u8 gMonBackPic_Shuppet[];
extern const u8 gMonShinyPalette_Shuppet[];
extern const u8 gMonIcon_Shuppet[];
extern const u8 gMonFootprint_Shuppet[];
extern const u8 gMonFrontPic_Banette[];
extern const u8 gMonPalette_Banette[];
extern const u8 gMonBackPic_Banette[];
extern const u8 gMonShinyPalette_Banette[];
extern const u8 gMonIcon_Banette[];
extern const u8 gMonFootprint_Banette[];
extern const u8 gMonFrontPic_Seviper[];
extern const u8 gMonPalette_Seviper[];
extern const u8 gMonBackPic_Seviper[];
extern const u8 gMonShinyPalette_Seviper[];
extern const u8 gMonIcon_Seviper[];
extern const u8 gMonFootprint_Seviper[];
extern const u8 gMonFrontPic_Zangoose[];
extern const u8 gMonPalette_Zangoose[];
extern const u8 gMonBackPic_Zangoose[];
extern const u8 gMonShinyPalette_Zangoose[];
extern const u8 gMonIcon_Zangoose[];
extern const u8 gMonFootprint_Zangoose[];
extern const u8 gMonFrontPic_Relicanth[];
extern const u8 gMonPalette_Relicanth[];
extern const u8 gMonBackPic_Relicanth[];
extern const u8 gMonShinyPalette_Relicanth[];
extern const u8 gMonIcon_Relicanth[];
extern const u8 gMonFootprint_Relicanth[];
extern const u8 gMonFrontPic_Aron[];
extern const u8 gMonPalette_Aron[];
extern const u8 gMonBackPic_Aron[];
extern const u8 gMonShinyPalette_Aron[];
extern const u8 gMonIcon_Aron[];
extern const u8 gMonFootprint_Aron[];
extern const u8 gMonFrontPic_Lairon[];
extern const u8 gMonPalette_Lairon[];
extern const u8 gMonBackPic_Lairon[];
extern const u8 gMonShinyPalette_Lairon[];
extern const u8 gMonIcon_Lairon[];
extern const u8 gMonFootprint_Lairon[];
extern const u8 gMonFrontPic_Aggron[];
extern const u8 gMonPalette_Aggron[];
extern const u8 gMonBackPic_Aggron[];
extern const u8 gMonShinyPalette_Aggron[];
extern const u8 gMonIcon_Aggron[];
extern const u8 gMonFootprint_Aggron[];
extern const u8 gMonFrontPic_Castform[];
extern const u8 gMonPalette_Castform[];
extern const u8 gMonBackPic_Castform[];
extern const u8 gMonShinyPalette_Castform[];
extern const u8 gMonIcon_Castform[];
extern const u8 gMonFootprint_Castform[];
extern const u8 gMonFrontPic_Volbeat[];
extern const u8 gMonPalette_Volbeat[];
extern const u8 gMonBackPic_Volbeat[];
extern const u8 gMonShinyPalette_Volbeat[];
extern const u8 gMonIcon_Volbeat[];
extern const u8 gMonFootprint_Volbeat[];
extern const u8 gMonFrontPic_Illumise[];
extern const u8 gMonPalette_Illumise[];
extern const u8 gMonBackPic_Illumise[];
extern const u8 gMonShinyPalette_Illumise[];
extern const u8 gMonIcon_Illumise[];
extern const u8 gMonFootprint_Illumise[];
extern const u8 gMonFrontPic_Lileep[];
extern const u8 gMonPalette_Lileep[];
extern const u8 gMonBackPic_Lileep[];
extern const u8 gMonShinyPalette_Lileep[];
extern const u8 gMonIcon_Lileep[];
extern const u8 gMonFootprint_Lileep[];
extern const u8 gMonFrontPic_Cradily[];
extern const u8 gMonPalette_Cradily[];
extern const u8 gMonBackPic_Cradily[];
extern const u8 gMonShinyPalette_Cradily[];
extern const u8 gMonIcon_Cradily[];
extern const u8 gMonFootprint_Cradily[];
extern const u8 gMonFrontPic_Anorith[];
extern const u8 gMonPalette_Anorith[];
extern const u8 gMonBackPic_Anorith[];
extern const u8 gMonShinyPalette_Anorith[];
extern const u8 gMonIcon_Anorith[];
extern const u8 gMonFootprint_Anorith[];
extern const u8 gMonFrontPic_Armaldo[];
extern const u8 gMonPalette_Armaldo[];
extern const u8 gMonBackPic_Armaldo[];
extern const u8 gMonShinyPalette_Armaldo[];
extern const u8 gMonIcon_Armaldo[];
extern const u8 gMonFootprint_Armaldo[];
extern const u8 gMonFrontPic_Ralts[];
extern const u8 gMonPalette_Ralts[];
extern const u8 gMonBackPic_Ralts[];
extern const u8 gMonShinyPalette_Ralts[];
extern const u8 gMonIcon_Ralts[];
extern const u8 gMonFootprint_Ralts[];
extern const u8 gMonFrontPic_Kirlia[];
extern const u8 gMonPalette_Kirlia[];
extern const u8 gMonBackPic_Kirlia[];
extern const u8 gMonShinyPalette_Kirlia[];
extern const u8 gMonIcon_Kirlia[];
extern const u8 gMonFootprint_Kirlia[];
extern const u8 gMonFrontPic_Gardevoir[];
extern const u8 gMonPalette_Gardevoir[];
extern const u8 gMonBackPic_Gardevoir[];
extern const u8 gMonShinyPalette_Gardevoir[];
extern const u8 gMonIcon_Gardevoir[];
extern const u8 gMonFootprint_Gardevoir[];
extern const u8 gMonFrontPic_Bagon[];
extern const u8 gMonPalette_Bagon[];
extern const u8 gMonBackPic_Bagon[];
extern const u8 gMonShinyPalette_Bagon[];
extern const u8 gMonIcon_Bagon[];
extern const u8 gMonFootprint_Bagon[];
extern const u8 gMonFrontPic_Shelgon[];
extern const u8 gMonPalette_Shelgon[];
extern const u8 gMonBackPic_Shelgon[];
extern const u8 gMonShinyPalette_Shelgon[];
extern const u8 gMonIcon_Shelgon[];
extern const u8 gMonFootprint_Shelgon[];
extern const u8 gMonFrontPic_Salamence[];
extern const u8 gMonPalette_Salamence[];
extern const u8 gMonBackPic_Salamence[];
extern const u8 gMonShinyPalette_Salamence[];
extern const u8 gMonIcon_Salamence[];
extern const u8 gMonFootprint_Salamence[];
extern const u8 gMonFrontPic_Beldum[];
extern const u8 gMonPalette_Beldum[];
extern const u8 gMonBackPic_Beldum[];
extern const u8 gMonShinyPalette_Beldum[];
extern const u8 gMonIcon_Beldum[];
extern const u8 gMonFootprint_Beldum[];
extern const u8 gMonFrontPic_Metang[];
extern const u8 gMonPalette_Metang[];
extern const u8 gMonBackPic_Metang[];
extern const u8 gMonShinyPalette_Metang[];
extern const u8 gMonIcon_Metang[];
extern const u8 gMonFootprint_Metang[];
extern const u8 gMonFrontPic_Metagross[];
extern const u8 gMonPalette_Metagross[];
extern const u8 gMonBackPic_Metagross[];
extern const u8 gMonShinyPalette_Metagross[];
extern const u8 gMonIcon_Metagross[];
extern const u8 gMonFootprint_Metagross[];
extern const u8 gMonFrontPic_Regirock[];
extern const u8 gMonPalette_Regirock[];
extern const u8 gMonBackPic_Regirock[];
extern const u8 gMonShinyPalette_Regirock[];
extern const u8 gMonIcon_Regirock[];
extern const u8 gMonFootprint_Regirock[];
extern const u8 gMonFrontPic_Regice[];
extern const u8 gMonPalette_Regice[];
extern const u8 gMonBackPic_Regice[];
extern const u8 gMonShinyPalette_Regice[];
extern const u8 gMonIcon_Regice[];
extern const u8 gMonFootprint_Regice[];
extern const u8 gMonFrontPic_Registeel[];
extern const u8 gMonPalette_Registeel[];
extern const u8 gMonBackPic_Registeel[];
extern const u8 gMonShinyPalette_Registeel[];
extern const u8 gMonIcon_Registeel[];
extern const u8 gMonFootprint_Registeel[];
extern const u8 gMonFrontPic_Kyogre[];
extern const u8 gMonPalette_Kyogre[];
extern const u8 gMonBackPic_Kyogre[];
extern const u8 gMonShinyPalette_Kyogre[];
extern const u8 gMonIcon_Kyogre[];
extern const u8 gMonFootprint_Kyogre[];
extern const u8 gMonFrontPic_Groudon[];
extern const u8 gMonPalette_Groudon[];
extern const u8 gMonBackPic_Groudon[];
extern const u8 gMonShinyPalette_Groudon[];
extern const u8 gMonIcon_Groudon[];
extern const u8 gMonFootprint_Groudon[];
extern const u8 gMonFrontPic_Rayquaza[];
extern const u8 gMonPalette_Rayquaza[];
extern const u8 gMonBackPic_Rayquaza[];
extern const u8 gMonShinyPalette_Rayquaza[];
extern const u8 gMonIcon_Rayquaza[];
extern const u8 gMonFootprint_Rayquaza[];
extern const u8 gMonFrontPic_Latias[];
extern const u8 gMonPalette_Latias[];
extern const u8 gMonBackPic_Latias[];
extern const u8 gMonShinyPalette_Latias[];
extern const u8 gMonIcon_Latias[];
extern const u8 gMonFootprint_Latias[];
extern const u8 gMonFrontPic_Latios[];
extern const u8 gMonPalette_Latios[];
extern const u8 gMonBackPic_Latios[];
extern const u8 gMonShinyPalette_Latios[];
extern const u8 gMonIcon_Latios[];
extern const u8 gMonFootprint_Latios[];
extern const u8 gMonFrontPic_Jirachi[];
extern const u8 gMonPalette_Jirachi[];
extern const u8 gMonBackPic_Jirachi[];
extern const u8 gMonShinyPalette_Jirachi[];
extern const u8 gMonIcon_Jirachi[];
extern const u8 gMonFootprint_Jirachi[];
extern const u8 gMonFrontPic_Deoxys[];
extern const u8 gMonPalette_Deoxys[];
extern const u8 gMonBackPic_Deoxys[];
extern const u8 gMonShinyPalette_Deoxys[];
extern const u8 gMonIcon_Deoxys[];
extern const u8 gMonFootprint_Deoxys[];
extern const u8 gMonFrontPic_Chimecho[];
extern const u8 gMonPalette_Chimecho[];
extern const u8 gMonBackPic_Chimecho[];
extern const u8 gMonShinyPalette_Chimecho[];
extern const u8 gMonIcon_Chimecho[];
extern const u8 gMonFootprint_Chimecho[];
extern const u8 gMonPic_Egg[];
extern const u8 gMonPalette_Egg[];
extern const u8 gMonFrontPic_UnownB[];
extern const u8 gMonBackPic_UnownB[];
extern const u8 gMonIcon_UnownB[];
extern const u8 gMonFrontPic_UnownC[];
extern const u8 gMonBackPic_UnownC[];
extern const u8 gMonIcon_UnownC[];
extern const u8 gMonFrontPic_UnownD[];
extern const u8 gMonBackPic_UnownD[];
extern const u8 gMonIcon_UnownD[];
extern const u8 gMonFrontPic_UnownE[];
extern const u8 gMonBackPic_UnownE[];
extern const u8 gMonIcon_UnownE[];
extern const u8 gMonFrontPic_UnownF[];
extern const u8 gMonBackPic_UnownF[];
extern const u8 gMonIcon_UnownF[];
extern const u8 gMonFrontPic_UnownG[];
extern const u8 gMonBackPic_UnownG[];
extern const u8 gMonIcon_UnownG[];
extern const u8 gMonFrontPic_UnownH[];
extern const u8 gMonBackPic_UnownH[];
extern const u8 gMonIcon_UnownH[];
extern const u8 gMonFrontPic_UnownI[];
extern const u8 gMonBackPic_UnownI[];
extern const u8 gMonIcon_UnownI[];
extern const u8 gMonFrontPic_UnownJ[];
extern const u8 gMonBackPic_UnownJ[];
extern const u8 gMonIcon_UnownJ[];
extern const u8 gMonFrontPic_UnownK[];
extern const u8 gMonBackPic_UnownK[];
extern const u8 gMonIcon_UnownK[];
extern const u8 gMonFrontPic_UnownL[];
extern const u8 gMonBackPic_UnownL[];
extern const u8 gMonIcon_UnownL[];
extern const u8 gMonFrontPic_UnownM[];
extern const u8 gMonBackPic_UnownM[];
extern const u8 gMonIcon_UnownM[];
extern const u8 gMonFrontPic_UnownN[];
extern const u8 gMonBackPic_UnownN[];
extern const u8 gMonIcon_UnownN[];
extern const u8 gMonFrontPic_UnownO[];
extern const u8 gMonBackPic_UnownO[];
extern const u8 gMonIcon_UnownO[];
extern const u8 gMonFrontPic_UnownP[];
extern const u8 gMonBackPic_UnownP[];
extern const u8 gMonIcon_UnownP[];
extern const u8 gMonFrontPic_UnownQ[];
extern const u8 gMonBackPic_UnownQ[];
extern const u8 gMonIcon_UnownQ[];
extern const u8 gMonFrontPic_UnownR[];
extern const u8 gMonBackPic_UnownR[];
extern const u8 gMonIcon_UnownR[];
extern const u8 gMonFrontPic_UnownS[];
extern const u8 gMonBackPic_UnownS[];
extern const u8 gMonIcon_UnownS[];
extern const u8 gMonFrontPic_UnownT[];
extern const u8 gMonBackPic_UnownT[];
extern const u8 gMonIcon_UnownT[];
extern const u8 gMonFrontPic_UnownU[];
extern const u8 gMonBackPic_UnownU[];
extern const u8 gMonIcon_UnownU[];
extern const u8 gMonFrontPic_UnownV[];
extern const u8 gMonBackPic_UnownV[];
extern const u8 gMonIcon_UnownV[];
extern const u8 gMonFrontPic_UnownW[];
extern const u8 gMonBackPic_UnownW[];
extern const u8 gMonIcon_UnownW[];
extern const u8 gMonFrontPic_UnownX[];
extern const u8 gMonBackPic_UnownX[];
extern const u8 gMonIcon_UnownX[];
extern const u8 gMonFrontPic_UnownY[];
extern const u8 gMonBackPic_UnownY[];
extern const u8 gMonIcon_UnownY[];
extern const u8 gMonFrontPic_UnownZ[];
extern const u8 gMonBackPic_UnownZ[];
extern const u8 gMonIcon_UnownZ[];
extern const u8 gMonFrontPic_UnownExclamationMark[];
extern const u8 gMonBackPic_UnownExclamationMark[];
extern const u8 gMonIcon_UnownExclamationMark[];
extern const u8 gMonFrontPic_UnownQuestionMark[];
extern const u8 gMonBackPic_UnownQuestionMark[];
extern const u8 gMonIcon_UnownQuestionMark[];

extern const u8 gMonIcon_QuestionMark[];
extern const u8 gMonIcon_Egg[];
extern const u16 gMonIconPalettes[][16];


extern const u8 gBagMaleTiles[];
extern const u8 gBagFemaleTiles[];
extern const u8 gBagPalette[];
extern const u8 gBagScreen_Gfx[];
extern const u8 gBagScreenMale_Pal[];
extern const u8 gBagScreenFemale_Pal[];
extern const u16 gUnknown_08E77004[];
extern const u8 gBuyMenuFrame_Gfx[];
extern const u8 gMenuMoneyPal[];
extern const u8 gBuyMenuFrame_Tilemap[];
extern const u8 gMenuMoneyGfx[];
extern const u8 gMenuPokeblock_Gfx[];
extern const u8 gMenuPokeblock_Pal[];
extern const u8 gMenuPokeblockDevice_Gfx[];
extern const u8 gMenuPokeblockDevice_Pal[];
extern const u8 gMenuPokeblock_Tilemap[];

extern const u8 gBerryCheck_Gfx[];
extern const u8 gBerryCheck_Pal[];
extern const u8 gUnknown_08E788E4[];
extern const u8 gUnknown_08E78A84[];
extern const u8 gBerryCheckCircle_Gfx[];


extern const u8 gBerryPic_Cheri[];
extern const u8 gBerryPic_Oran[];
extern const u8 gBerryPic_Pecha[];
extern const u8 gBerryPic_Rawst[];
extern const u8 gBerryPic_Aspear[];
extern const u8 gBerryPic_Leppa[];
extern const u8 gBerryPic_Chesto[];
extern const u8 gBerryPic_Persim[];
extern const u8 gBerryPic_Lum[];
extern const u8 gBerryPic_Sitrus[];
extern const u8 gBerryPic_Figy[];
extern const u8 gBerryPic_Wiki[];
extern const u8 gBerryPic_Mago[];
extern const u8 gBerryPic_Aguav[];
extern const u8 gBerryPic_Iapapa[];
extern const u8 gBerryPic_Razz[];
extern const u8 gBerryPic_Bluk[];
extern const u8 gBerryPic_Nanab[];
extern const u8 gBerryPic_Wepear[];
extern const u8 gBerryPic_Pinap[];
extern const u8 gBerryPic_Pomeg[];
extern const u8 gBerryPic_Kelpsy[];
extern const u8 gBerryPic_Qualot[];
extern const u8 gBerryPic_Hondew[];
extern const u8 gBerryPic_Grepa[];
extern const u8 gBerryPic_Tamato[];
extern const u8 gBerryPic_Cornn[];
extern const u8 gBerryPic_Magost[];
extern const u8 gBerryPic_Rabuta[];
extern const u8 gBerryPic_Nomel[];
extern const u8 gBerryPic_Spelon[];
extern const u8 gBerryPic_Pamtre[];
extern const u8 gBerryPic_Watmel[];
extern const u8 gBerryPic_Durin[];
extern const u8 gBerryPic_Belue[];
extern const u8 gBerryPic_Liechi[];
extern const u8 gBerryPic_Ganlon[];
extern const u8 gBerryPic_Salac[];
extern const u8 gBerryPic_Petaya[];
extern const u8 gBerryPic_Apicot[];
extern const u8 gBerryPic_Lansat[];
extern const u8 gBerryPic_Starf[];
extern const u8 gBerryPic_Enigma[];
extern const u8 gBerryPalette_Cheri[];
extern const u8 gBerryPalette_Oran[];
extern const u8 gBerryPalette_Pecha[];
extern const u8 gBerryPalette_Rawst[];
extern const u8 gBerryPalette_Aspear[];
extern const u8 gBerryPalette_Leppa[];
extern const u8 gBerryPalette_Chesto[];
extern const u8 gBerryPalette_Persim[];
extern const u8 gBerryPalette_Lum[];
extern const u8 gBerryPalette_Sitrus[];
extern const u8 gBerryPalette_Figy[];
extern const u8 gBerryPalette_Wiki[];
extern const u8 gBerryPalette_Mago[];
extern const u8 gBerryPalette_Aguav[];
extern const u8 gBerryPalette_Iapapa[];
extern const u8 gBerryPalette_Razz[];
extern const u8 gBerryPalette_Bluk[];
extern const u8 gBerryPalette_Nanab[];
extern const u8 gBerryPalette_Wepear[];
extern const u8 gBerryPalette_Pinap[];
extern const u8 gBerryPalette_Pomeg[];
extern const u8 gBerryPalette_Kelpsy[];
extern const u8 gBerryPalette_Qualot[];
extern const u8 gBerryPalette_Hondew[];
extern const u8 gBerryPalette_Grepa[];
extern const u8 gBerryPalette_Tamato[];
extern const u8 gBerryPalette_Cornn[];
extern const u8 gBerryPalette_Magost[];
extern const u8 gBerryPalette_Rabuta[];
extern const u8 gBerryPalette_Nomel[];
extern const u8 gBerryPalette_Spelon[];
extern const u8 gBerryPalette_Pamtre[];
extern const u8 gBerryPalette_Watmel[];
extern const u8 gBerryPalette_Durin[];
extern const u8 gBerryPalette_Belue[];
extern const u8 gBerryPalette_Liechi[];
extern const u8 gBerryPalette_Ganlon[];
extern const u8 gBerryPalette_Salac[];
extern const u8 gBerryPalette_Petaya[];
extern const u8 gBerryPalette_Apicot[];
extern const u8 gBerryPalette_Lansat[];
extern const u8 gBerryPalette_Starf[];
extern const u8 gBerryPalette_Enigma[];

extern const u8 gUnknown_08E96EC8[];

extern const u8 gMenuTrainerCard_Gfx[];
extern const u16 gMenuTrainerCard0Star_Pal[];
extern const u16 gMenuTrainerCard1Star_Pal[];
extern const u16 gMenuTrainerCard2Star_Pal[];
extern const u16 gMenuTrainerCard3Star_Pal[];
extern const u16 gMenuTrainerCard4Star_Pal[];
extern const u8 gUnknown_08E8CAC0[];
extern const u8 gUnknown_08E8CFC0[];
extern const u8 gUnknown_08E8D4C0[];
extern const u8 gUnknown_08E8D9C0[];

extern const u8 gUnknown_08EA1DEC[];
extern const u16 gUnknown_08EA0328[];
extern const u16 gUnknown_08EA02C8[];
extern const u16 gUnknown_08EA0348[];
extern const u16 gUnknown_08EA15C8[];
extern const u16 gTradeMonBoxTilemap[];
extern const u8 gUnknown_08D00000[];
extern const u16 gUnknown_08D00524[];
extern const u8 gUnknown_08D004E0[];
# 7 "src/engine/trainer_card.c" 2
# 1 "include/link.h" 1
# 32 "include/link.h"
enum
{
    LINK_STATE_START0,
    LINK_STATE_START1,
    LINK_STATE_HANDSHAKE,
    LINK_STATE_INIT_TIMER,
    LINK_STATE_CONN_ESTABLISHED,
};

enum
{
    EXCHANGE_NOT_STARTED,
    EXCHANGE_COMPLETE,
    EXCHANGE_TIMED_OUT,
    EXCHANGE_IN_PROGRESS,
};

enum
{
    QUEUE_FULL_NONE,
    QUEUE_FULL_SEND,
    QUEUE_FULL_RECV,
};

enum
{
    LAG_NONE,
    LAG_MASTER,
    LAG_SLAVE,
};

struct LinkPlayer
{
               u16 version;
               u16 lp_field_2;
               u32 trainerId;
               u8 name[11];
               u8 gender;
               u32 linkType;
               u16 lp_field_18;
               u16 language;
};

struct LinkPlayerBlock
{
    u8 magic1[16];
    struct LinkPlayer linkPlayer;
    u8 magic2[16];
};



struct SendQueue
{
    u16 data[8][50];
    u8 pos;
    u8 count;
};

struct RecvQueue
{
    u16 data[4][8][50];
    u8 pos;
    u8 count;
};

struct Link
{
    u8 isMaster;
    u8 state;
    u8 localId;
    u8 playerCount;
    u16 tempRecvBuffer[4];
    bool8 receivedNothing;
    s8 serialIntrCounter;
    bool8 handshakeAsMaster;
    u8 link_field_F;


    bool8 hardwareError;
    bool8 badChecksum;
    u8 queueFull;
    u8 lag;

    u16 checksum;

    u8 sendCmdIndex;
    u8 recvCmdIndex;

    struct SendQueue sendQueue;
    struct RecvQueue recvQueue;
};

struct BlockRequest {
    void * address;
    u32 size;
};

extern const struct BlockRequest sBlockRequestLookupTable[5];

extern struct Link gLink;
extern u16 gRecvCmds[8][4];
extern u8 gBlockSendBuffer[0x100];
extern u16 gLinkType;
extern u32 gLinkStatus;
extern u16 gBlockRecvBuffer[4][0x100 / 2];
extern u16 gSendCmd[8];
extern u8 gShouldAdvanceLinkState;
extern struct LinkPlayer gLinkPlayers[];
extern u16 word_3002910[];
extern bool8 gReceivedRemoteLinkPlayers;
extern bool8 gLinkOpen;

void Task_DestroySelf(u8);
void sub_8007270(u8);
void OpenLink(void);
void CloseLink(void);
u16 LinkMain2(u16 *);
void sub_8007B14(void);
bool32 sub_8007B24(void);
void ClearLinkCallback(void);
void ClearLinkCallback_2(void);
u8 GetLinkPlayerCount(void);
void OpenLinkTimed(void);
u8 GetLinkPlayerDataExchangeStatusTimed(void);
bool8 IsLinkPlayerDataExchangeComplete(void);
u32 GetLinkPlayerTrainerId(u8);
void ResetLinkPlayers(void);
void sub_8007E24(void);
void sub_8007E4C(void);
u8 GetMultiplayerId(void);
u8 bitmask_all_link_players_but_self(void);
bool8 SendBlock(u8, void *, u16);
bool8 sub_8007E9C(u8);
bool8 sub_8007ECC(void);
u8 GetBlockReceivedStatus(void);
void ResetBlockReceivedFlags(void);
void ResetBlockReceivedFlag(u8);
void sub_8007F4C(void);
void SetLinkDebugValues(u32, u32);
u8 sub_8008198(void);
void sub_80081C8(u8);
u8 sub_800820C(void);
u8 sub_8008218(void);
void sub_800826C(void);
void sub_80082EC(void);
u8 GetLinkPlayerCount_2(void);
bool8 IsLinkMaster(void);
void sub_800832C(void);
void sub_8008480(void);
void sub_80084A4(void);
void CB2_LinkError(void);
u8 GetSioMultiSI(void);
bool8 IsLinkConnectionEstablished(void);
void SetSuppressLinkErrorMessage(bool8);
bool8 HasLinkErrorOccurred(void);
void ResetSerial(void);
u32 LinkMain1(u8 *, u16 *, u16[8][4]);
void LinkVSync(void);
void Timer3Intr(void);
void SerialCB(void);
# 8 "src/engine/trainer_card.c" 2
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
# 9 "src/engine/trainer_card.c" 2
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
# 10 "src/engine/trainer_card.c" 2
# 1 "include/money.h" 1



bool8 IsEnoughMoney(u32, u32);
void AddMoney(u32 *, u32);
void RemoveMoney(u32 *, u32);
void GetMoneyAmountText(u8 *buffer, u32 arg1, u8 arg2);
void PrintMoneyAmount(u32 arg0, u8 arg1, u8 x, u8 y);
void sub_80B7AEC(u32, u8 left, u8 top);
void sub_80B7B34(u8, u8, int);
void UpdateMoneyWindow(u32, u8, u8);
void OpenMoneyWindow(u32, u8, u8);
void CloseMoneyWindow(u8, u8);
bool8 sub_80B7CE8(void);
void sub_80B7D0C(void);
# 11 "src/engine/trainer_card.c" 2
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
# 12 "src/engine/trainer_card.c" 2
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
# 13 "src/engine/trainer_card.c" 2
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
# 14 "src/engine/trainer_card.c" 2
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
# 15 "src/engine/trainer_card.c" 2
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
# 16 "src/engine/trainer_card.c" 2
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
# 17 "src/engine/trainer_card.c" 2
# 1 "include/sprite.h" 1
# 18 "src/engine/trainer_card.c" 2
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
# 19 "src/engine/trainer_card.c" 2
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
# 20 "src/engine/trainer_card.c" 2
# 1 "include/task.h" 1
# 21 "src/engine/trainer_card.c" 2
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
# 22 "src/engine/trainer_card.c" 2
# 1 "include/util.h" 1





extern const u8 gMiscBlank_Gfx[];
extern const u32 gBitTable[];

u8 CreateInvisibleSpriteWithCallback(void (*)(struct Sprite *));
void StoreWordInTwoHalfwords(u16 *, u32);
void LoadWordFromTwoHalfwords(u16 *, u32 *);
u16 CalcCRC16(u8 *data, int length);
void DoBgAffineSet(struct BgAffineDstData *dest, u32 texX, u32 texY, s16 scrX, s16 scrY, s16 sx, s16 sy, u16 alpha);
# 23 "src/engine/trainer_card.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 24 "src/engine/trainer_card.c" 2

typedef void (*Callback)(void);

struct Struct2000000
{
             u8 var_0;
             bool8 var_1;
             u8 var_2;
             bool8 var_3;
             u8 var_4;
             u8 var_5;
             u8 var_6;
             bool8 var_7;
             bool8 var_8;
             bool8 var_9;
             bool8 var_a;
             bool8 var_b;
             bool8 var_c;
             bool8 var_d;
             u8 var_e[8];
             u8 filler_16[10];
             u8 var_20[4][0x10];
             Callback *var_60;
             struct TrainerCard var_64;
             u8 language;
};

extern struct LinkPlayerMapObject gLinkPlayerMapObjects[];

__attribute__((section("ewram_data"))) struct TrainerCard gTrainerCards[4] = {0};

extern const u8 gBadgesTiles[];
extern const u16 gUnknown_083B5F0C[];
extern const u16 gBadgesPalette[];
extern const u16 gUnknown_083B5F4C[];
extern const u16 gUnknown_083B5F6C[];
extern const u16 gUnknown_083B5F8C[][4];

const u8 gBadgesTiles[] = INCBIN_U8("graphics/trainer_card/badges.4bpp");

u8 *const ewram_ = gSharedMem;

bool8 sub_8093864(struct Task *);
bool8 sub_80938A8(struct Task *);
bool8 sub_80938CC(struct Task *);
bool8 sub_8093918(struct Task *);
bool8 sub_8093938(struct Task *);
bool8 sub_8093954(struct Task *);
bool8 sub_8093980(struct Task *);

bool8 (*const gUnknown_083B5EBC[])(struct Task *) =
{
    sub_8093864,
    sub_80938A8,
    sub_80938CC,
    sub_8093918,
    sub_8093938,
    sub_8093954,
    sub_8093980,
};

bool8 sub_8093AA0(struct Task *);
bool8 sub_8093AF0(struct Task *);
bool8 sub_8093C0C(struct Task *);
bool8 sub_8093C38(struct Task *);
bool8 sub_8093D50(struct Task *);

bool8 (*const gUnknown_083B5ED8[])(struct Task *) =
{
    sub_8093AA0,
    sub_8093AF0,
    sub_8093C0C,
    sub_8093C38,
    sub_8093D50,
};


void FormatPlayTime(u8 *playtime, u16 hours, u16 minutes, s16 colon);
u16 GetPokedexSeenCount(void);

enum
{
    TD_0,
    TD_1,
    TD_CALLBACK,
};

static void sub_8093174(void);
static void sub_809323C(void);
static void sub_8093254(void);
static void sub_80932AC(Callback callBack);
static void sub_80932E4(u8 arg1, Callback callBack);
void sub_8093324(void);
static void nullsub_60(u8);
static u32 sav12_xor_get_clamped_above(u8 index, u32 maxVal);
static u8 sub_80934F4(struct TrainerCard *);
static void sub_8093534(void);
static void sub_8093550(void);
static void sub_8093598(void);
static void sub_80935EC(void);
static void sub_8093610(void);
static void sub_8093688(void);
void sub_80936D4(void);
static void sub_80937A4(void);
static void sub_80937BC(void);
static void sub_80937D8(void);
static void sub_80937F0(void);
static void nullsub_15(void);
static void sub_8093800(void);
static void sub_809380C();
static void sub_809382C(u8 taskId);
static void sub_80939A4(void);
static void sub_80939C0(void);
static void sub_80939DC(u8 taskId);
static void sub_8093A28(void);
static u8 sub_8093A48(void);
static void sub_8093A68(u8 taskId);
void sub_8093D7C(void);
static void sub_8093DAC(void);
static void sub_8093DC8(void);
static void sub_8093DEC(void);
static void sub_8093E04(void);
static void sub_8093E28(void);
void sub_8093EA0(void);
static void sub_8093EF8(void);
static void sub_8093F14(void);
static void sub_8093F48(void);
static void sub_8093F64(void);
static void sub_8093F80(void);
static void sub_8093FD0(void);
static void sub_8094038(void);
static void sub_80940E4(void);
static void sub_8094110(void);
static void sub_8094140(void);
static void sub_8094188(void);
static void TrainerCard_Front_PrintTrainerID(void);
static void TrainerCard_Front_PrintMoney(void);
static void TrainerCard_Front_PrintPokedexCount(void);
static void TrainerCard_Front_PrintPlayTime(u8 *arg1, s16 colon);
static void sub_809429C(void);
static void TrainerCard_Back_PrintName(void);
static void TrainerCard_Back_PrintHallOfFameTime_Label(void);
static void TrainerCard_Back_PrintHallOfFameTime(void);
static void TrainerCard_Back_PrintLinkBattlesLabel(void);
static void TrainerCard_Back_PrintLinkBattles(void);
static void TrainerCard_Back_PrintBattleTower_Label(void);
static void TrainerCard_Back_PrintBattleTower(void);
static void TrainerCard_Back_PrintLinkContests_Label(void);
static void TrainerCard_Back_PrintLinkContests(void);
static void TrainerCard_Back_PrintLinkPokeblocks_Label(void);
static void TrainerCard_Back_PrintLinkPokeblocks(void);
static void TrainerCard_Back_PrintPokemonTrades_Label(void);
static void TrainerCard_Back_PrintPokemonTrades(void);
void unref_sub_8094588(u16 left, u16 top);

void sub_8093110(Callback arg1)
{
    sub_80932AC(arg1);
    SetMainCallback2(sub_8093174);
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).language = (LANGUAGE_ENGLISH);
}

void sub_8093130(u8 playerIndex, Callback arg2)
{
    sub_80932E4(playerIndex, arg2);
    SetMainCallback2(sub_8093174);
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).language = gLinkPlayers[gLinkPlayerMapObjects[playerIndex].linkPlayerId].language;
}

static void sub_8093174(void)
{
    switch (gMain.state)
    {
    case 0:
        sub_8093534();
        sub_8093688();
        gMain.state++;
        break;
    case 1:
        sub_8093598();
        gMain.state++;
        break;
    case 2:
        sub_80935EC();
        gMain.state++;
        break;
    case 3:
        sub_8093610();
        sub_80937A4();
        gMain.state++;
        break;
    case 4:
        sub_80937BC();
        gMain.state++;
    case 5:
        if (MultistepInitMenuWindowContinue())
            gMain.state++;
        break;
    case 6:
        sub_80937F0();
        gMain.state++;
        break;
    case 7:
        sub_80937D8();
        gMain.state++;
        break;
    case 8:
        nullsub_15();
        sub_8093800();
        sub_8093550();
        SetMainCallback2(sub_809323C);
        break;
    }
}

static void sub_809323C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_8093254(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_6++;
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_6 >= 60)
    {
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_6 = 0;
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_5 ^= 1;
    }
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_4)
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&gUnknown_03004DE0[0]); dmaRegs[1] = (vu32)(&gUnknown_03004DE0[1]); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((0x140)/(16/8))); dmaRegs[2]; };
}

static void sub_80932AC(Callback callBack)
{
    u8 taskId = CreateTask(nullsub_60, 0xFF);
    struct Task *task = &gTasks[taskId];
    task->data[TD_0] = 0;
    StoreWordInTwoHalfwords(&task->data[TD_CALLBACK], (u32)callBack);
}

static void sub_80932E4(u8 arg1, Callback callBack)
{
    u8 taskId = CreateTask(nullsub_60, 0xFF);

    struct Task *task = &gTasks[taskId];
    task->data[TD_0] = 1;
    task->data[TD_1] = arg1;
    StoreWordInTwoHalfwords(&task->data[TD_CALLBACK], (u32)callBack);
}

void sub_8093324(void)
{
    u8 taskId = FindTaskIdByFunc(nullsub_60);
    struct Task *task = &gTasks[taskId];
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_1 = task->data[TD_0];

    LoadWordFromTwoHalfwords((u16 *)&task->data[TD_CALLBACK], (u32 *)&(*(struct Struct2000000 *)(gSharedMem + 0x0)).var_60);

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_1)
    {
        struct TrainerCard(*trainerCards)[4] = &gTrainerCards;
        s16 var = task->data[TD_1];
        struct TrainerCard *dest = &(*trainerCards)[var];
        memcpy(&(*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64, dest, sizeof(struct TrainerCard));
    }
    else
    {
        sub_8093390(&(*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64);
    }
}

static void nullsub_60(u8 taskid)
{
}

void sub_8093390(struct TrainerCard *trainerCard)
{
    u32 playTime;
    bool32 enteredHallOfFame;
    bool8 r4;
    u8 i;

    trainerCard->gender = gSaveBlock2.playerGender;
    trainerCard->playTimeHours = gSaveBlock2.playTimeHours;
    trainerCard->playTimeMinutes = gSaveBlock2.playTimeMinutes;

    playTime = GetGameStat(1);
    enteredHallOfFame = GetGameStat(10);
    if (!enteredHallOfFame)
    {
        playTime = 0;
    }
    trainerCard->firstHallOfFameA = playTime >> 16;
    trainerCard->firstHallOfFameB = (playTime >> 8) & 0xFF;
    trainerCard->firstHallOfFameC = playTime & 0xFF;

    trainerCard->hasPokedex = FlagGet(0x801);
    trainerCard->var_3 = sub_8090FC0();
    trainerCard->pokedexSeen = GetPokedexSeenCount();

    trainerCard->trainerId = (gSaveBlock2.playerTrainerId[1] << 8) | gSaveBlock2.playerTrainerId[0];


    trainerCard->linkBattleWins = sav12_xor_get_clamped_above(23, 9999);
    trainerCard->linkBattleLosses = sav12_xor_get_clamped_above(24, 9999);


    trainerCard->contestsWithFriends = sav12_xor_get_clamped_above(35, 999);


    trainerCard->pokeblocksWithFriends = sav12_xor_get_clamped_above(34, 0xFFFF);


    trainerCard->pokemonTrades = sav12_xor_get_clamped_above(21, 0xFFFF);


    trainerCard->battleTowerWins = gSaveBlock2.battleTower.totalBattleTowerWins;
    trainerCard->battleTowerLosses = gSaveBlock2.battleTower.bestBattleTowerWinStreak;
    if (trainerCard->battleTowerWins > 9999)
    {
        trainerCard->battleTowerWins = 9999;
    }
    if (trainerCard->battleTowerLosses > 9999)
    {
        trainerCard->battleTowerLosses = 9999;
    }

    r4 = 0;
    if (sub_80C4D50() > 4)
    {
        r4 = 1;
    }
    trainerCard->var_4 = r4;

    trainerCard->money = gSaveBlock1.money;

    for (i = 0; i < 4; i++)
    {
        trainerCard->var_28[i] = gSaveBlock1.easyChats.unk2B1C[i];
    }

    for (i = 0; i < 8; i++)
    {
        trainerCard->playerName[i] = gSaveBlock2.playerName[i];
    }

    trainerCard->stars = sub_80934F4(trainerCard);
}

u8 sub_80934C4(u8 id)
{
    return gTrainerCards[id].stars;
}

static u32 sav12_xor_get_clamped_above(u8 index, u32 maxVal)
{
    u32 value = GetGameStat(index);

    if (value > maxVal)
    {
        value = maxVal;
    }

    return value;
}

static u8 sub_80934F4(struct TrainerCard *trainerCard)
{
    u8 value = 0;

    if (trainerCard->firstHallOfFameA != 0 || trainerCard->firstHallOfFameB != 0 || trainerCard->firstHallOfFameC != 0)
    {
        value++;
    }

    if (trainerCard->var_3)
    {
        value++;
    }

    if (trainerCard->battleTowerLosses > 49)
    {
        value++;
    }

    if (trainerCard->var_4)
    {
        value++;
    }

    return value;
}

static void sub_8093534(void)
{
    SetVBlankCallback(((void *)0));
    SetHBlankCallback(((void *)0));
    (*(vu16 *)(0x4000000 + 0x0)) = 0;
}

static void sub_8093550(void)
{
    u16 backup;

    SetVBlankCallback(sub_8093254);

    backup = (*(vu16 *)(0x4000000 + 0x208));
    (*(vu16 *)(0x4000000 + 0x208)) = 0;
    (*(vu16 *)(0x4000000 + 0x200)) |= (1 << 0) | (1 << 1);
    (*(vu16 *)(0x4000000 + 0x208)) = backup;

    (*(vu16 *)(0x4000000 + 0x4)) |= 0x0008 | 0x0010;
    (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0F00 | 0x1000;
}

void sub_8093598(void)
{
    u8 *addr = (void *)0x6000000;
    u32 size = 0x10000;

    while (1)
    {
        { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((0x1000)/(16/8))); dmaRegs[2]; }; };
        addr += 0x1000;
        size -= 0x1000;
        if (size <= 0x1000)
        {
            { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((size)/(16/8))); dmaRegs[2]; }; };
            break;
        }
    }
}

void sub_80935EC(void)
{
    void *addr = (void *)0x7000000;

    { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((0x400)/(16/8))); dmaRegs[2]; }; };
}

void sub_8093610(void)
{
    (*(vu16 *)(0x4000000 + 0x8)) = 0;
    (*(vu16 *)(0x4000000 + 0xa)) = 0;
    (*(vu16 *)(0x4000000 + 0xc)) = 0;
    (*(vu16 *)(0x4000000 + 0xe)) = 0;
    (*(vu16 *)(0x4000000 + 0x10)) = 0;
    (*(vu16 *)(0x4000000 + 0x12)) = 0;
    (*(vu16 *)(0x4000000 + 0x14)) = 0;
    (*(vu16 *)(0x4000000 + 0x16)) = 0;
    (*(vu16 *)(0x4000000 + 0x18)) = 0;
    (*(vu16 *)(0x4000000 + 0x1a)) = 0;
    (*(vu16 *)(0x4000000 + 0x1c)) = 0;
    (*(vu16 *)(0x4000000 + 0x1e)) = 0;

    (*(vu16 *)(0x4000000 + 0x8)) = (0) | ((2) << 2) | ((30) << 8) | 0x0000 | 0x0000;
    (*(vu16 *)(0x4000000 + 0xa)) = (1) | ((0) << 2) | ((8) << 8) | 0x0000 | 0x0000;
    (*(vu16 *)(0x4000000 + 0xc)) = (2) | ((0) << 2) | ((9) << 8) | 0x0000 | 0x0000;
    (*(vu16 *)(0x4000000 + 0xe)) = (3) | ((0) << 2) | ((10) << 8) | 0x0000 | 0x0000;
}

static void sub_8093688(void)
{
    u8 i;

    sub_8093324();
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_0 = 0;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_3 = 0;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_4 = 0;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_2 = (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.stars;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_5 = 0;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_6 = 0;
    for (i = 0; i < 4; i++)
        EasyChat_GetWordText((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_20[i], (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.var_28[i]);
    sub_80936D4();
}

void sub_80936D4(void)
{
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_7 = 0;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_8 = 0;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_9 = 0;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_a = 0;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_b = 0;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_c = 0;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_d = 0;
    memset((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_e, 0, sizeof((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_e));

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.hasPokedex)
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_7++;

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.firstHallOfFameA != 0
     || (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.firstHallOfFameB != 0
     || (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.firstHallOfFameC != 0)
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_8++;

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.linkBattleWins != 0 || (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.linkBattleLosses != 0)
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_9++;

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.battleTowerWins != 0 || (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.battleTowerLosses != 0)
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_a++;

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.contestsWithFriends != 0)
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_b++;

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.pokeblocksWithFriends != 0)
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_c++;

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.pokemonTrades != 0)
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_d++;

    if (!(*(struct Struct2000000 *)(gSharedMem + 0x0)).var_1)
    {
        u32 badgeFlag;
        int i = 0;

        badgeFlag = 0x807;
        while (1)
        {
            if (FlagGet(badgeFlag))
                (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_e[i]++;
            badgeFlag++;
            i++;
            if (badgeFlag > 0x80E)
            {
                break;
            }
        }
    }
}

void sub_80937A4()
{
    ResetPaletteFade();
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
}

void sub_80937BC()
{
    SetUpWindowConfig(&WindowConfig_TrainerCard_Back_Values);
    MultistepInitMenuWindowBegin(&WindowConfig_TrainerCard_Back_Values);
}

static void sub_80937D8()
{
    sub_8093E04();
    sub_8093E28();
    sub_8093F64();
    sub_8093DAC();
}

static void sub_80937F0()
{
    sub_8093EF8();
}

static void nullsub_15(void)
{
}

static void sub_8093800()
{
    sub_809380C();
}

static void sub_809380C()
{
    u8 taskId;

    taskId = CreateTask(sub_809382C, 0);
    sub_809382C(taskId);
}

static void sub_809382C(u8 taskId)
{
    while (gUnknown_083B5EBC[(*(struct Struct2000000 *)(gSharedMem + 0x0)).var_0](&gTasks[taskId]) != 0)
        ;
}

bool8 sub_8093864(struct Task *task)
{
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_5 = gSaveBlock2.playTimeSeconds & 1;
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_6 = gSaveBlock2.playTimeVBlanks;
    sub_80939A4();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_0++;
    return 0;
}

bool8 sub_80938A8(struct Task *task)
{
    if (!gPaletteFade.active)
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_0++;
    return 0;
}

bool8 sub_80938CC(struct Task *task)
{
    if (gMain.newKeys & 0x0002)
    {
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_0 = 5;
        return 1;
    }
    else if (gMain.newKeys & 0x0001)
    {
        if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_3 != 0)
        {
            (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_0 = 5;
        }
        else
        {
            (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_3 ^= 1;
            (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_0 = 3;
        }
        return 1;
    }
    return 0;
}

bool8 sub_8093918(struct Task *task)
{
    sub_8093A28();
    PlaySE(SE_CARD);
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_0++;
    return 0;
}

bool8 sub_8093938(struct Task *task)
{
    if (sub_8093A48())
        (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_0 = 2;
    return 0;
}

bool8 sub_8093954(struct Task *task)
{
    sub_80939C0();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_0++;
    return 0;
}

bool8 sub_8093980(struct Task *task)
{
    if (!gPaletteFade.active)
        SetMainCallback2((MainCallback)(*(struct Struct2000000 *)(gSharedMem + 0x0)).var_60);
    return 0;
}

static void sub_80939A4(void)
{
    CreateTask(sub_80939DC, 0);
    BasicInitMenuWindow(&WindowConfig_TrainerCard_Back_Values);
}

static void sub_80939C0(void)
{
    u8 taskId = FindTaskIdByFunc(sub_80939DC);

    if (taskId != 0xFF)
        DestroyTask(taskId);
}

static void sub_80939DC(u8 taskId)
{
    u8 buffer[32];

    struct Task *task = &gTasks[taskId];

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_5 != task->data[TD_1])
    {
        task->data[TD_1] = (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_5;
        task->data[TD_0] ^= 1;
    }
    TrainerCard_Front_PrintPlayTime(buffer, task->data[TD_0]);
    MenuPrint(buffer, 10, 12);
}

static void sub_8093A28(void)
{
    u8 taskId;

    taskId = CreateTask(sub_8093A68, 0);
    sub_8093A68(taskId);
}

static u8 sub_8093A48(void)
{
    if (FindTaskIdByFunc(sub_8093A68) == 0xFF)
        return 1;
    else
        return 0;
}

static void sub_8093A68(u8 taskId)
{
    while (gUnknown_083B5ED8[gTasks[taskId].data[0]](&gTasks[taskId]) != 0)
        ;
}

bool8 sub_8093AA0(struct Task *task)
{
    u32 i;

    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_4 = 0;
    dp12_8087EA4();
    for (i = 0; i < 0xA0; i++)
        gUnknown_03004DE0[1][i] = -4;
    SetHBlankCallback(sub_8093D7C);
    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_4 = 1;
    task->data[0]++;
    return 0;
}
# 794 "src/engine/trainer_card.c"
__attribute__((naked))
bool8 sub_8093AF0(struct Task *task)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x4\n    mov r8, r0\n    ldr r1, _08093BFC @ =gSharedMem\n    movs r0, 0\n    strb r0, [r1, 0x4]\n    mov r2, r8\n    ldrh r0, [r2, 0xA]\n    adds r0, 0x3\n    strh r0, [r2, 0xA]\n    lsls r0, 16\n    asrs r0, 16\n    cmp r0, 0x4F\n    ble _08093B18\n    movs r0, 0x4F\n    strh r0, [r2, 0xA]\n_08093B18:\n    mov r4, r8\n    movs r0, 0xA\n    ldrsh r7, [r4, r0]\n    movs r0, 0xA0\n    subs r0, r7\n    mov r9, r0\n    subs r4, r0, r7\n    negs r0, r7\n    lsls r6, r0, 16\n    movs r0, 0xA0\n    lsls r0, 16\n    adds r1, r4, 0\n    bl __udivsi3\n    adds r5, r0, 0\n    ldr r1, _08093C00 @ =0xffff0000\n    adds r5, r1\n    adds r0, r5, 0\n    muls r0, r4\n    adds r0, r6\n    mov r10, r0\n    adds r0, r5, 0\n    adds r1, r4, 0\n    bl __udivsi3\n    str r0, [sp]\n    lsls r5, 1\n    movs r3, 0\n    cmp r3, r7\n    bcs _08093B74\n    ldr r2, _08093C04 @ =gUnknown_03004DE0\n    mov r12, r2\n    ldr r0, _08093C08 @ =0x0000fffc\n    adds r4, r0, 0\n_08093B5C:\n    lsls r0, r3, 16\n    asrs r0, 16\n    lsls r1, r0, 1\n    add r1, r12\n    subs r2, r4, r0\n    strh r2, [r1]\n    adds r0, 0x1\n    lsls r0, 16\n    lsrs r3, r0, 16\n    asrs r0, 16\n    cmp r0, r7\n    bcc _08093B5C\n_08093B74:\n    lsls r2, r3, 16\n    mov r1, r9\n    lsls r0, r1, 16\n    asrs r1, r0, 16\n    mov r4, r10\n    lsrs r7, r4, 16\n    cmp r2, r0\n    bge _08093BAE\n    ldr r0, _08093C04 @ =gUnknown_03004DE0\n    mov r9, r0\n    ldr r4, _08093C08 @ =0x0000fffc\n    mov r12, r4\n    adds r4, r1, 0\n_08093B8E:\n    lsrs r1, r6, 16\n    adds r6, r5\n    ldr r0, [sp]\n    subs r5, r0\n    asrs r2, 16\n    lsls r0, r2, 1\n    add r0, r9\n    add r1, r12\n    strh r1, [r0]\n    adds r2, 0x1\n    lsls r2, 16\n    lsrs r3, r2, 16\n    lsls r2, r3, 16\n    asrs r0, r2, 16\n    cmp r0, r4\n    blt _08093B8E\n_08093BAE:\n    adds r1, r7, 0\n    lsls r0, r3, 16\n    asrs r0, 16\n    cmp r0, 0x9F\n    bgt _08093BD4\n    ldr r4, _08093C04 @ =gUnknown_03004DE0\n    ldr r0, _08093C08 @ =0x0000fffc\n    adds r2, r1, r0\n_08093BBE:\n    lsls r1, r3, 16\n    asrs r1, 16\n    lsls r0, r1, 1\n    adds r0, r4\n    strh r2, [r0]\n    adds r1, 0x1\n    lsls r1, 16\n    lsrs r3, r1, 16\n    asrs r1, 16\n    cmp r1, 0x9F\n    ble _08093BBE\n_08093BD4:\n    movs r0, 0x1\n    ldr r1, _08093BFC @ =gSharedMem\n    strb r0, [r1, 0x4]\n    mov r2, r8\n    movs r4, 0xA\n    ldrsh r0, [r2, r4]\n    cmp r0, 0x4A\n    ble _08093BEA\n    ldrh r0, [r2, 0x8]\n    adds r0, 0x1\n    strh r0, [r2, 0x8]\n_08093BEA:\n    movs r0, 0\n    add sp, 0x4\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r1}\n    bx r1\n    .align 2, 0\n_08093BFC: .4byte gSharedMem\n_08093C00: .4byte 0xffff0000\n_08093C04: .4byte gUnknown_03004DE0\n_08093C08: .4byte 0x0000fffc\n    .syntax divided\n");
# 944 "src/engine/trainer_card.c"
}

bool8 sub_8093C0C(struct Task *task)
{
    sub_80939C0();
    sub_8093DAC();
    if (!(*(struct Struct2000000 *)(gSharedMem + 0x0)).var_3)
        sub_80939A4();
    task->data[0]++;
    return 1;
}

__attribute__((naked))
bool8 sub_8093C38(struct Task *task)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x4\n    mov r8, r0\n    ldr r1, _08093D40 @ =gSharedMem\n    movs r2, 0\n    strb r2, [r1, 0x4]\n    ldrh r0, [r0, 0xA]\n    subs r0, 0x3\n    mov r3, r8\n    strh r0, [r3, 0xA]\n    lsls r0, 16\n    cmp r0, 0\n    bgt _08093C5C\n    strh r2, [r3, 0xA]\n_08093C5C:\n    mov r4, r8\n    movs r0, 0xA\n    ldrsh r7, [r4, r0]\n    movs r0, 0xA0\n    subs r0, r7\n    mov r9, r0\n    subs r4, r0, r7\n    negs r0, r7\n    lsls r6, r0, 16\n    movs r0, 0xA0\n    lsls r0, 16\n    adds r1, r4, 0\n    bl __udivsi3\n    adds r5, r0, 0\n    ldr r1, _08093D44 @ =0xffff0000\n    adds r5, r1\n    adds r0, r5, 0\n    muls r0, r4\n    adds r0, r6\n    mov r10, r0\n    adds r0, r5, 0\n    adds r1, r4, 0\n    bl __udivsi3\n    str r0, [sp]\n    lsrs r5, 1\n    movs r3, 0\n    cmp r3, r7\n    bcs _08093CB8\n    ldr r2, _08093D48 @ =gUnknown_03004DE0\n    mov r12, r2\n    ldr r0, _08093D4C @ =0x0000fffc\n    adds r4, r0, 0\n_08093CA0:\n    lsls r0, r3, 16\n    asrs r0, 16\n    lsls r1, r0, 1\n    add r1, r12\n    subs r2, r4, r0\n    strh r2, [r1]\n    adds r0, 0x1\n    lsls r0, 16\n    lsrs r3, r0, 16\n    asrs r0, 16\n    cmp r0, r7\n    bcc _08093CA0\n_08093CB8:\n    lsls r2, r3, 16\n    mov r1, r9\n    lsls r0, r1, 16\n    asrs r1, r0, 16\n    mov r4, r10\n    lsrs r7, r4, 16\n    cmp r2, r0\n    bge _08093CF2\n    ldr r0, _08093D48 @ =gUnknown_03004DE0\n    mov r9, r0\n    ldr r3, _08093D4C @ =0x0000fffc\n    mov r12, r3\n    adds r4, r1, 0\n_08093CD2:\n    lsrs r1, r6, 16\n    adds r6, r5\n    ldr r0, [sp]\n    adds r5, r0\n    asrs r2, 16\n    lsls r0, r2, 1\n    add r0, r9\n    add r1, r12\n    strh r1, [r0]\n    adds r2, 0x1\n    lsls r2, 16\n    lsrs r3, r2, 16\n    lsls r2, r3, 16\n    asrs r0, r2, 16\n    cmp r0, r4\n    blt _08093CD2\n_08093CF2:\n    adds r1, r7, 0\n    lsls r0, r3, 16\n    asrs r0, 16\n    cmp r0, 0x9F\n    bgt _08093D18\n    ldr r4, _08093D48 @ =gUnknown_03004DE0\n    ldr r0, _08093D4C @ =0x0000fffc\n    adds r2, r1, r0\n_08093D02:\n    lsls r1, r3, 16\n    asrs r1, 16\n    lsls r0, r1, 1\n    adds r0, r4\n    strh r2, [r0]\n    adds r1, 0x1\n    lsls r1, 16\n    lsrs r3, r1, 16\n    asrs r1, 16\n    cmp r1, 0x9F\n    ble _08093D02\n_08093D18:\n    movs r0, 0x1\n    ldr r1, _08093D40 @ =gSharedMem\n    strb r0, [r1, 0x4]\n    mov r2, r8\n    movs r3, 0xA\n    ldrsh r0, [r2, r3]\n    cmp r0, 0\n    bgt _08093D2E\n    ldrh r0, [r2, 0x8]\n    adds r0, 0x1\n    strh r0, [r2, 0x8]\n_08093D2E:\n    movs r0, 0\n    add sp, 0x4\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r1}\n    bx r1\n    .align 2, 0\n_08093D40: .4byte gSharedMem\n_08093D44: .4byte 0xffff0000\n_08093D48: .4byte gUnknown_03004DE0\n_08093D4C: .4byte 0x0000fffc\n    .syntax divided\n");
# 1104 "src/engine/trainer_card.c"
}

bool8 sub_8093D50(struct Task *task)
{
    u8 taskId;

    (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_4 = 0;
    SetHBlankCallback(((void *)0));
    sub_8093E04();
    taskId = FindTaskIdByFunc(sub_8093A68);
    DestroyTask(taskId);
    return 0;
}

void sub_8093D7C(void)
{
    u16 bgVOffset = gUnknown_03004DE0[1][(*(vu16 *)(0x4000000 + 0x6)) & 0xFF];

    (*(vu16 *)(0x4000000 + 0x12)) = bgVOffset;
    (*(vu16 *)(0x4000000 + 0x16)) = bgVOffset;
    (*(vu16 *)(0x4000000 + 0x1a)) = bgVOffset;
}

static void sub_8093DAC(void)
{
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_3)
        sub_8093DEC();
    else
        sub_8093DC8();
}

static void sub_8093DC8(void)
{
    MenuZeroFillScreen();
    sub_80940E4();
    sub_8093F14();
    sub_8093F80();
    sub_8093FD0();
    sub_8094038();
    sub_8094140();
}

static void sub_8093DEC(void)
{
    MenuZeroFillScreen();
    sub_80940E4();
    sub_8093F48();
    sub_8094188();
}

static void sub_8093E04(void)
{
    (*(vu16 *)(0x4000000 + 0x12)) = -4;
    (*(vu16 *)(0x4000000 + 0x14)) = 0;
    (*(vu16 *)(0x4000000 + 0x16)) = -4;
    (*(vu16 *)(0x4000000 + 0x18)) = 0;
    (*(vu16 *)(0x4000000 + 0x1a)) = -4;
}

static void sub_8093E28(void)
{
    const u8 *src;
    u8 *dst;
    u32 size;

    sub_8093EA0();
    LoadPalette(gUnknown_083B5F6C, 0xE0, 32);
    src = gMenuTrainerCard_Gfx;
    dst = (void *)0x6000000;
    size = 0x1480;
    while (1)
    {
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(src); dmaRegs[1] = (vu32)(dst); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((0x1000)/(16/8))); dmaRegs[2]; };
        src += 0x1000;
        dst += 0x1000;
        size -= 0x1000;
        if (size <= 0x1000)
        {
            { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(src); dmaRegs[1] = (vu32)(dst); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((size)/(16/8))); dmaRegs[2]; };
            break;
        }
    }
    {
        const void *src = gBadgesTiles;
        void *dst = (void *)(0x6000000 + 0x1480);

        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(src); dmaRegs[1] = (vu32)(dst); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((0x400)/(16/8))); dmaRegs[2]; };
    }
}

extern const u16 *const gUnknown_083B5EF8[];

void sub_8093EA0(void)
{
    LoadPalette(gUnknown_083B5EF8[(*(struct Struct2000000 *)(gSharedMem + 0x0)).var_2], 0, 48 * 2);
    LoadPalette(gBadgesPalette, 48, 16 * 2);
    LoadPalette(gUnknown_083B5F4C, 64, 16 * 2);
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.gender != MALE)
        LoadPalette(gUnknown_083B5F0C, 16, 16 * 2);
}

static void sub_8093EF8(void)
{
    LoadTrainerGfx_TrainerCard((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.gender, 80, (void *)(0x6000000 + 0x1880));
}

static void sub_8093F14(void)
{
    const void *arr[] = {gUnknown_08E8CAC0, gUnknown_08E8D4C0};

    CpuFastSet(arr[(*(struct Struct2000000 *)(gSharedMem + 0x0)).var_1], (void *)(0x6000000 + 0x4800), 0x140);
}



const u8 gUnknown_083B5EF4[] = _(" : ");

const u16 *const gUnknown_083B5EF8[] =
{
    gMenuTrainerCard0Star_Pal,
    gMenuTrainerCard1Star_Pal,
    gMenuTrainerCard2Star_Pal,
    gMenuTrainerCard3Star_Pal,
    gMenuTrainerCard4Star_Pal,
};

const u16 gUnknown_083B5F0C[] = INCBIN_U16("graphics/trainer_card/83B5F0C.gbapal");
const u16 gBadgesPalette[] = INCBIN_U16("graphics/trainer_card/badges.gbapal");
const u16 gUnknown_083B5F4C[] = INCBIN_U16("graphics/trainer_card/83B5F4C.gbapal");
const u16 gUnknown_083B5F6C[] = INCBIN_U16("graphics/trainer_card/83B5F6C.gbapal");
const u16 gUnknown_083B5F8C[][4] = INCBIN_U16("graphics/trainer_card/83B5F8C_map.bin");

static void sub_8093F48(void)
{
    CpuFastSet(gUnknown_08E8CFC0, (void *)(0x6000000 + 0x4800), 320);
}

static void sub_8093F64(void)
{
    CpuFastSet(gUnknown_08E8D9C0, (void *)(0x6000000 + 0x5000), 320);
}

static void sub_8093F80(void)
{
    u16 r5 = 0xC4;
    u16 *ptr = (u16 *)(0x6000000 + 0x4000);
    s16 i;
    s16 j;

    for (i = 5; i < 13; i++)
    {
        for (j = 19; j < 27; j++, r5++)
            ptr[i * 32 + j] = r5 | 0x5000;
    }
}

static void sub_8093FD0(void)
{
    u16 *ptr = (u16 *)(0x6000000 + 0x4000);
    s16 i = 15;
    s16 var = 15 + (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_2;

    while (i < var)
    {
        ptr[6 * 32 + i] = 0x408F;
        i++;
    }
    while (i < 0x13)
    {
        ptr[6 * 32 + i] = 0;
        i++;
    }
}

static void sub_8094038(void)
{
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_1 == 0)
    {
        u16 *ptr = (u16 *)(0x6000000 + 0x4000);
        s16 i;
        s16 r2;

        for (i = 0, r2 = 4; i < 8; i++, r2 += 3)
        {
            if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_e[i] != 0)
            {
                ptr[15 * 32 + r2 + 0] = gUnknown_083B5F8C[i][0] | 0x3000;
                ptr[15 * 32 + r2 + 1] = gUnknown_083B5F8C[i][1] | 0x3000;
                ptr[16 * 32 + r2 + 0] = gUnknown_083B5F8C[i][2] | 0x3000;
                ptr[16 * 32 + r2 + 1] = gUnknown_083B5F8C[i][3] | 0x3000;
            }
        }
    }
}

static void sub_80940E4(void)
{
    s16 i;
    u16 *ptr;

    for (i = 0, ptr = (u16 *)(0x6000000 + 0x4000); i < 0x400; i++, ptr++)
        *ptr = 0;
}

static void sub_8094110(void)
{
    u16 *ptr = (u16 *)(0x6000000 + 0x4800);
    u16 i;

    for (i = 3; i < 17; i++)
    {
        ptr[10 * 32 + i] = 1;
        ptr[11 * 32 + i] = 1;
    }
}

static void sub_8094140(void)
{
    u8 *buffer;

    BasicInitMenuWindow(&WindowConfig_TrainerCard_Back_Values);

    buffer = gStringVar1;
    StringCopy(buffer, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.playerName);
    ConvertInternationalString(buffer, (*(struct Struct2000000 *)(gSharedMem + 0x0)).language);
    MenuPrint(buffer, 7, 5);

    TrainerCard_Front_PrintTrainerID();
    TrainerCard_Front_PrintMoney();
    TrainerCard_Front_PrintPokedexCount();
    sub_809429C();
}

static void sub_8094188(void)
{
    BasicInitMenuWindow(&WindowConfig_TrainerCard_Back_Values);
    TrainerCard_Back_PrintName();
    TrainerCard_Back_PrintHallOfFameTime_Label();
    TrainerCard_Back_PrintLinkBattlesLabel();
    TrainerCard_Back_PrintBattleTower_Label();
    TrainerCard_Back_PrintLinkContests_Label();
    TrainerCard_Back_PrintLinkPokeblocks_Label();
    TrainerCard_Back_PrintPokemonTrades_Label();

    BasicInitMenuWindow(&WindowConfig_TrainerCard_Back_Labels);
    TrainerCard_Back_PrintHallOfFameTime();
    TrainerCard_Back_PrintLinkBattles();
    TrainerCard_Back_PrintBattleTower();
    TrainerCard_Back_PrintLinkContests();
    TrainerCard_Back_PrintLinkPokeblocks();
    TrainerCard_Back_PrintPokemonTrades();
}

static void TrainerCard_Front_PrintTrainerID(void)
{
    u8 buffer[8];

    ConvertIntToDecimalStringN(buffer, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.trainerId, STR_CONV_MODE_LEADING_ZEROS, 5);
    MenuPrint(buffer, 20, 2);
}

static void TrainerCard_Front_PrintMoney(void)
{
    sub_80B7AEC((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.money, 16, 8);
}

static void TrainerCard_Front_PrintPokedexCount(void)
{
    u8 buffer[16];
 u8 txtMons[] = _("마리");

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_7 == 0)
    {
        sub_8094110();
    }
    else
    {
        ConvertIntToDecimalString(buffer, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.pokedexSeen);
  StringAppend(buffer, txtMons);
        MenuPrint_RightAligned(buffer, 16, 10);
    }
}

static void TrainerCard_Front_PrintPlayTime(u8 *arg1, s16 colon)
{
    u8 buffer[16];
    u16 playTimeHours;
    u16 playTimeMinutes;

    playTimeHours = gSaveBlock2.playTimeHours;
    playTimeMinutes = gSaveBlock2.playTimeMinutes;
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_1 != 0)
    {
        playTimeHours = (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.playTimeHours;
        playTimeMinutes = (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.playTimeMinutes;
    }
    FormatPlayTime(buffer, playTimeHours, playTimeMinutes, colon);
    sub_8072C74(arg1, buffer, 48, 1);
}

static void sub_809429C(void)
{
    u8 *str;

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_1 != 0)
    {
        str = gStringVar1;
        str = StringCopy(str, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_20[0]);
        str[0] = 00;
        str++;
        str = StringCopy(str, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_20[1]);
        MenuPrint(gStringVar1, 2, 14);

        str = gStringVar1;
        str = StringCopy(str, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_20[2]);
        str[0] = 00;
        str++;
        str = StringCopy(str, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_20[3]);
        MenuPrint(gStringVar1, 2, 16);
    }
}

static void TrainerCard_Back_PrintName(void)
{
    u8 *str;

    str = gStringVar1;
    StringCopy(str, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.playerName);
    ConvertInternationalString(str, (*(struct Struct2000000 *)(gSharedMem + 0x0)).language);

    StringAppend(str, gOtherText_TrainersTrainerCard);
    MenuPrint_RightAligned(gStringVar1, 28, 2);
}

static void TrainerCard_Back_PrintHallOfFameTime_Label(void)
{
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_8 != 0)
        MenuPrint(gOtherText_FirstHOF, 3, 5);
}

static void TrainerCard_Back_PrintHallOfFameTime(void)
{
    u8 *str;

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_8 != 0)
    {
        str = gStringVar1;
        str = ConvertIntToDecimalStringN(str, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.firstHallOfFameA, STR_CONV_MODE_RIGHT_ALIGN, 3);
        str = StringCopy(str, gUnknown_083B5EF4);
        str = ConvertIntToDecimalStringN(str, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.firstHallOfFameB, STR_CONV_MODE_LEADING_ZEROS, 2);
        str = StringCopy(str, gUnknown_083B5EF4);
        str = ConvertIntToDecimalStringN(str, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.firstHallOfFameC, STR_CONV_MODE_LEADING_ZEROS, 2);
        MenuPrint_RightAligned(gStringVar1, 28, 5);
    }
}

static void TrainerCard_Back_PrintLinkBattlesLabel(void)
{
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_9 != 0)
        MenuPrint(gOtherText_LinkCableBattles, 3, 7);
}

static void TrainerCard_Back_PrintLinkBattles(void)
{
    u8 buffer[16];

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_9 != 0)
    {
        ConvertIntToDecimalString(buffer, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.linkBattleWins);
        MenuPrint_RightAligned(buffer, 22, 7);

        ConvertIntToDecimalString(buffer, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.linkBattleLosses);
        MenuPrint_RightAligned(buffer, 28, 7);
    }
}

static void TrainerCard_Back_PrintBattleTower_Label(void)
{
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_a != 0)
        MenuPrint(gOtherText_BattleTowerWinRecord, 3, 15);
}

static void TrainerCard_Back_PrintBattleTower(void)
{
    u8 buffer[16];

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_a != 0)
    {
        sub_8072C44(buffer, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.battleTowerWins, 24, 1);
        MenuPrint_PixelCoords(buffer, 112, 120, 0);

        sub_8072C44(buffer, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.battleTowerLosses, 24, 1);
        MenuPrint_PixelCoords(buffer, 149, 120, 0);
    }
}

static void TrainerCard_Back_PrintLinkContests_Label(void)
{
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_b != 0)
        MenuPrint(gOtherText_ContestRecord, 3, 13);
}

static void TrainerCard_Back_PrintLinkContests(void)
{
    u8 buffer[8];

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_b != 0)
    {
        ConvertIntToDecimalStringN(buffer, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.contestsWithFriends, STR_CONV_MODE_RIGHT_ALIGN, 3);
        MenuPrint_RightAligned(buffer, 28, 13);
    }
}

static void TrainerCard_Back_PrintLinkPokeblocks_Label(void)
{
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_c != 0)
        MenuPrint(gOtherText_MixingRecord, 3, 11);
}

static void TrainerCard_Back_PrintLinkPokeblocks(void)
{
    u8 buffer[8];

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_c != 0)
    {
        ConvertIntToDecimalStringN(buffer, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.pokeblocksWithFriends, STR_CONV_MODE_RIGHT_ALIGN, 5);
        MenuPrint_RightAligned(buffer, 28, 11);
    }
}

static void TrainerCard_Back_PrintPokemonTrades_Label(void)
{
    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_d != 0)
        MenuPrint(gOtherText_TradeRecord, 3, 9);
}

static void TrainerCard_Back_PrintPokemonTrades(void)
{
    u8 buffer[8];

    if ((*(struct Struct2000000 *)(gSharedMem + 0x0)).var_d != 0)
    {
        ConvertIntToDecimalStringN(buffer, (*(struct Struct2000000 *)(gSharedMem + 0x0)).var_64.pokemonTrades, STR_CONV_MODE_RIGHT_ALIGN, 5);
        MenuPrint_RightAligned(buffer, 28, 9);
    }
}

void unref_sub_8094588(u16 left, u16 top)
{
    const u8 *text = gOtherText_Boy;

    if (gSaveBlock2.playerGender == FEMALE)
        text = gOtherText_Girl;
    MenuPrint(text, left, top);
}
