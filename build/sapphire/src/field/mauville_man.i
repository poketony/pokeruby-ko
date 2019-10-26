# 1 "src/field/mauville_man.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/mauville_man.c"
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
# 2 "src/field/mauville_man.c" 2
# 1 "include/bard_music.h" 1



struct BardSound;

struct BardPhoneme
{
             u16 sound;
             u16 length;
             s16 pitch;
             u16 volume;
};

struct BardSong
{
             u8 currWord;
             u8 currPhoneme;
             u8 phonemeTimer;
             u8 state;
             s16 var04;
             u16 volume;
             s16 pitch;
             s16 voiceInflection;
             u16 lyrics[6];
             struct BardPhoneme phonemes[6];
};

const struct BardSound *GetWordSounds(u16 arg0, u16 arg1);
s32 GetWordPhonemes(struct BardSong *dest, const struct BardSound *src, u16 arg2);
# 3 "src/field/mauville_man.c" 2
# 1 "include/mauville_man.h" 1




enum
{
    MAUVILLE_MAN_BARD,
    MAUVILLE_MAN_HIPSTER,
    MAUVILLE_MAN_TRADER,
    MAUVILLE_MAN_STORYTELLER,
    MAUVILLE_MAN_GIDDY,
};

void SetupMauvilleOldMan(void);
void sub_80F7F30(void);
void sub_80F83D0(void);
# 4 "src/field/mauville_man.c" 2
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
# 5 "src/field/mauville_man.c" 2
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
# 6 "src/field/mauville_man.c" 2
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
# 7 "src/field/mauville_man.c" 2
# 1 "include/m4a.h" 1



# 1 "include/gba/m4a_internal.h" 1



# 1 "include/gba/gba.h" 1
# 5 "include/gba/m4a_internal.h" 2
# 39 "include/gba/m4a_internal.h"
struct WaveData
{
    u16 type;
    u16 status;
    u32 freq;
    u32 loopStart;
    u32 size;
    s8 data[1];
};
# 57 "include/gba/m4a_internal.h"
struct ToneData
{
    u8 type;
    u8 key;
    u8 length;
    u8 pan_sweep;
    struct WaveData *wav;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
};

struct CgbChannel
{
    u8 sf;
    u8 ty;
    u8 rightVolume;
    u8 leftVolume;
    u8 at;
    u8 de;
    u8 su;
    u8 re;
    u8 ky;
    u8 ev;
    u8 eg;
    u8 ec;
    u8 echoVolume;
    u8 echoLength;
    u8 d1;
    u8 d2;
    u8 gt;
    u8 mk;
    u8 ve;
    u8 pr;
    u8 rp;
    u8 d3[3];
    u8 d5;
    u8 sg;
    u8 n4;
    u8 pan;
    u8 panMask;
    u8 mo;
    u8 le;
    u8 sw;
    u32 fr;
    u32 wp;
    u32 cp;
    u32 tp;
    u32 pp;
    u32 np;
    u8 d4[8];
};

struct MusicPlayerTrack;

struct SoundChannel
{
    u8 status;
    u8 type;
    u8 rightVolume;
    u8 leftVolume;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
    u8 ky;
    u8 ev;
    u8 er;
    u8 el;
    u8 echoVolume;
    u8 echoLength;
    u8 d1;
    u8 d2;
    u8 gt;
    u8 mk;
    u8 ve;
    u8 pr;
    u8 rp;
    u8 d3[3];
    u32 ct;
    u32 fw;
    u32 freq;
    struct WaveData *wav;
    u32 cp;
    struct MusicPlayerTrack *track;
    u32 pp;
    u32 np;
    u32 d4;
    u16 xpi;
    u16 xpc;
};





struct SoundInfo
{




    u32 ident;

    vu8 pcmDmaCounter;


    u8 reverb;
    u8 maxChans;
    u8 masterVolume;
    u8 freq;

    u8 mode;
    u8 c15;
    u8 pcmDmaPeriod;
    u8 maxLines;
    u8 gap[3];
    s32 pcmSamplesPerVBlank;
    s32 pcmFreq;
    s32 divFreq;
    struct CgbChannel *cgbChans;
    u32 func;
    u32 intp;
    void (*CgbSound)(void);
    void (*CgbOscOff)(u8);
    u32 (*MidiKeyToCgbFreq)(u8, u8, u8);
    u32 MPlayJumpTable;
    u32 plynote;
    u32 ExtVolPit;
    u8 gap2[16];
    struct SoundChannel chans[12];
    s8 pcmBuffer[1584 * 2];
};

struct SongHeader
{
    u8 trackCount;
    u8 blockCount;
    u8 priority;
    u8 reverb;
    struct ToneData *tone;
    u8 *part[1];
};

struct PokemonCrySong
{
    u8 trackCount;
    u8 blockCount;
    u8 priority;
    u8 reverb;
    struct ToneData *tone;
    u8 *part[2];
    u8 gap;
    u8 part0;
    u8 tuneValue;
    u8 gotoCmd;
    u32 gotoTarget;
    u8 part1;
    u8 tuneValue2;
    u8 cont[2];
    u8 volCmd;
    u8 volumeValue;
    u8 unkCmd0D[2];
    u32 unkCmd0DParam;
    u8 xreleCmd[2];
    u8 releaseValue;
    u8 panCmd;
    u8 panValue;
    u8 tieCmd;
    u8 tieKeyValue;
    u8 tieVelocityValue;
    u8 unkCmd0C[2];
    u16 unkCmd0CParam;
    u8 end[2];
};
# 241 "include/gba/m4a_internal.h"
struct MusicPlayerTrack
{
    u8 flags;
    u8 wait;
    u8 patternLevel;
    u8 repN;
    u8 gateTime;
    u8 key;
    u8 velocity;
    u8 runningStatus;
    u8 keyM;
    u8 pitM;
    s8 keyShift;
    s8 keyShiftX;
    s8 tune;
    u8 pitX;
    s8 bend;
    u8 bendRange;
    u8 volMR;
    u8 volML;
    u8 vol;
    u8 volX;
    s8 pan;
    s8 panX;
    s8 modM;
    u8 mod;
    u8 modT;
    u8 lfoSpeed;
    u8 lfoSpeedC;
    u8 lfoDelay;
    u8 lfoDelayC;
    u8 priority;
    u8 echoVolume;
    u8 echoLength;
    struct SoundChannel *chan;
    struct ToneData tone;
    u8 gap[10];
    u16 unk_3A;
    u32 unk_3C;
    u8 *cmdPtr;
    u8 *patternStack[3];
};
# 294 "include/gba/m4a_internal.h"
struct MusicPlayerInfo
{
    struct SongHeader *songHeader;
    u32 status;
    u8 trackCount;
    u8 priority;
    u8 cmd;
    u8 unk_B;
    u32 clock;
    u8 gap[8];
    u8 *memAccArea;
    u16 tempoD;
    u16 tempoU;
    u16 tempoI;
    u16 tempoC;
    u16 fadeOI;
    u16 fadeOC;
    u16 fadeOV;
    struct MusicPlayerTrack *tracks;
    struct ToneData *tone;
    u32 ident;
    u32 func;
    u32 intp;
};

struct MusicPlayer
{
    struct MusicPlayerInfo *info;
    struct MusicPlayerTrack *track;
    u8 unk_8;
    u16 unk_A;
};

struct Song
{
    struct SongHeader *header;
    u16 ms;
    u16 me;
};

extern const struct MusicPlayer gMPlayTable[];
extern const struct Song gSongTable[];



extern u8 gMPlayMemAccArea[];






extern struct PokemonCrySong gPokemonCrySong;
extern struct PokemonCrySong gPokemonCrySongs[];

extern struct MusicPlayerInfo gPokemonCryMusicPlayers[];
extern struct MusicPlayerTrack gPokemonCryTracks[];

extern char SoundMainRAM[];

extern void *gMPlayJumpTable[];

typedef void (*XcmdFunc)(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
extern const XcmdFunc gXcmdTable[];

extern struct CgbChannel gCgbChans[];

extern const u8 gScaleTable[];
extern const u32 gFreqTable[];
extern const u16 gPcmSamplesPerVBlankTable[];

extern const u8 gCgbScaleTable[];
extern const s16 gCgbFreqTable[];
extern const u8 gNoiseTable[];

extern const struct PokemonCrySong gPokemonCrySongTemplate;

extern const struct ToneData voicegroup_pokemon_cry;

extern char gNumMusicPlayers[];
extern char gMaxLines[];




u32 umul3232H32(u32 multiplier, u32 multiplicand);
void SoundMain(void);
void SoundMainBTM(void);
void TrackStop(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track);
void MPlayMain(void);
void RealClearChain(void *x);

void MPlayContinue(struct MusicPlayerInfo *mplayInfo);
void MPlayStart(struct MusicPlayerInfo *mplayInfo, struct SongHeader *songHeader);
void m4aMPlayStop(struct MusicPlayerInfo *mplayInfo);
void FadeOutBody(struct MusicPlayerInfo *mplayInfo);
void TrkVolPitSet(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track);
void MPlayFadeOut(struct MusicPlayerInfo *mplayInfo, u16 speed);
void ClearChain(void *x);
void Clear64byte(void *addr);
void SoundInit(struct SoundInfo *soundInfo);
void MPlayExtender(struct CgbChannel *cgbChans);
void m4aSoundMode(u32 mode);
void MPlayOpen(struct MusicPlayerInfo *mplayInfo, struct MusicPlayerTrack *track, u8 a3);
void CgbSound(void);
void CgbOscOff(u8);
u32 MidiKeyToCgbFreq(u8, u8, u8);
void DummyFunc(void);
void MPlayJumpTableCopy(void **mplayJumpTable);
void SampleFreqSet(u32 freq);
void m4aSoundVSyncOn(void);
void m4aSoundVSyncOff(void);

void ClearModM(struct MusicPlayerTrack *track);
void m4aMPlayModDepthSet(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u8 modDepth);
void m4aMPlayLFOSpeedSet(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u8 lfoSpeed);

struct MusicPlayerInfo *SetPokemonCryTone(struct ToneData *tone);
void SetPokemonCryVolume(u8 val);
void SetPokemonCryPanpot(s8 val);
void SetPokemonCryPitch(s16 val);
void SetPokemonCryLength(u16 val);
void SetPokemonCryRelease(u8 val);
void SetPokemonCryProgress(u32 val);
int IsPokemonCryPlaying(struct MusicPlayerInfo *mplayInfo);
void SetPokemonCryChorus(s8 val);
void SetPokemonCryStereo(u32 val);
void SetPokemonCryPriority(u8 val);


void ply_fine(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_goto(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_patt(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_pend(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_rept(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_memacc(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_prio(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_tempo(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_keysh(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_voice(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_vol(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_pan(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_bend(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_bendr(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_lfos(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_lfodl(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_mod(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_modt(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_tune(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_port(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xcmd(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_endtie(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_note(struct MusicPlayerInfo *, struct MusicPlayerTrack *);


void ply_xxx(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xwave(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xtype(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xatta(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xdeca(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xsust(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xrele(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xiecv(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xiecl(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xleng(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xswee(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xcmd_0C(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
void ply_xcmd_0D(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
# 5 "include/m4a.h" 2

void m4aSoundVSync(void);

void m4aSoundInit(void);
void m4aSoundMain(void);
void m4aSongNumStart(u16);
void m4aSongNumStop(u16 n);
void m4aMPlayAllStop(void);
void m4aMPlayContinue(struct MusicPlayerInfo *mplayInfo);
void m4aMPlayFadeOut(struct MusicPlayerInfo *mplayInfo, u16 speed);
void m4aMPlayFadeOutTemporarily(struct MusicPlayerInfo *mplayInfo, u16 speed);
void m4aMPlayFadeIn(struct MusicPlayerInfo *mplayInfo, u16 speed);
void m4aMPlayImmInit(struct MusicPlayerInfo *mplayInfo);

void m4aMPlayTempoControl(struct MusicPlayerInfo *mplayInfo, u16 tempo);
void m4aMPlayVolumeControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, u16 volume);
void m4aMPlayPitchControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, s16 pitch);
void m4aMPlayPanpotControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, s8 pan);
# 8 "src/field/mauville_man.c" 2
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
# 9 "src/field/mauville_man.c" 2
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
# 10 "src/field/mauville_man.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 11 "src/field/mauville_man.c" 2
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
# 12 "src/field/mauville_man.c" 2
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
# 13 "src/field/mauville_man.c" 2
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
# 14 "src/field/mauville_man.c" 2
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
# 15 "src/field/mauville_man.c" 2
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
# 16 "src/field/mauville_man.c" 2
# 1 "include/task.h" 1
# 17 "src/field/mauville_man.c" 2
# 1 "include/trader.h" 1



void TraderSetup(void);
void sub_8109A20(void);
# 18 "src/field/mauville_man.c" 2



extern struct MusicPlayerInfo gMPlay_SE2;

extern u16 gScriptResult;
extern u16 gSpecialVar_0x8004;

extern const u8 gTextStoryteller_Story1Title[];
extern const u8 gTextStoryteller_Story1Action[];
extern const u8 gTextStoryteller_Story1Text[];
extern const u8 gTextStoryteller_Story2Title[];
extern const u8 gTextStoryteller_Story2Action[];
extern const u8 gTextStoryteller_Story2Text[];
extern const u8 gTextStoryteller_Story3Title[];
extern const u8 gTextStoryteller_Story3Action[];
extern const u8 gTextStoryteller_Story3Text[];
extern const u8 gTextStoryteller_Story4Title[];
extern const u8 gTextStoryteller_Story4Action[];
extern const u8 gTextStoryteller_Story4Text[];
extern const u8 gTextStoryteller_Story5Title[];
extern const u8 gTextStoryteller_Story5Action[];
extern const u8 gTextStoryteller_Story5Text[];
extern const u8 gTextStoryteller_Story6Title[];
extern const u8 gTextStoryteller_Story6Action[];
extern const u8 gTextStoryteller_Story6Text[];
extern const u8 gTextStoryteller_Story7Title[];
extern const u8 gTextStoryteller_Story7Action[];
extern const u8 gTextStoryteller_Story7Text[];
extern const u8 gTextStoryteller_Story8Title[];
extern const u8 gTextStoryteller_Story8Action[];
extern const u8 gTextStoryteller_Story8Text[];
extern const u8 gTextStoryteller_Story9Title[];
extern const u8 gTextStoryteller_Story9Action[];
extern const u8 gTextStoryteller_Story9Text[];
extern const u8 gTextStoryteller_Story10Title[];
extern const u8 gTextStoryteller_Story10Action[];
extern const u8 gTextStoryteller_Story10Text[];
extern const u8 gTextStoryteller_Story11Title[];
extern const u8 gTextStoryteller_Story11Action[];
extern const u8 gTextStoryteller_Story11Text[];
extern const u8 gTextStoryteller_Story12Title[];
extern const u8 gTextStoryteller_Story12Action[];
extern const u8 gTextStoryteller_Story12Text[];
extern const u8 gTextStoryteller_Story13Title[];
extern const u8 gTextStoryteller_Story13Action[];
extern const u8 gTextStoryteller_Story13Text[];
extern const u8 gTextStoryteller_Story14Title[];
extern const u8 gTextStoryteller_Story14Action[];
extern const u8 gTextStoryteller_Story14Text[];
extern const u8 gTextStoryteller_Story15Title[];
extern const u8 gTextStoryteller_Story15Action[];
extern const u8 gTextStoryteller_Story15Text[];
extern const u8 gTextStoryteller_Story16Title[];
extern const u8 gTextStoryteller_Story16Action[];
extern const u8 gTextStoryteller_Story16Text[];
extern const u8 gTextStoryteller_Story17Title[];
extern const u8 gTextStoryteller_Story17Action[];
extern const u8 gTextStoryteller_Story17Text[];
extern const u8 gTextStoryteller_Story18Title[];
extern const u8 gTextStoryteller_Story18Action[];
extern const u8 gTextStoryteller_Story18Text[];
extern const u8 gTextStoryteller_Story19Title[];
extern const u8 gTextStoryteller_Story19Action[];
extern const u8 gTextStoryteller_Story19Text[];
extern const u8 gTextStoryteller_Story20Title[];
extern const u8 gTextStoryteller_Story20Action[];
extern const u8 gTextStoryteller_Story20Text[];
extern const u8 gTextStoryteller_Story21Title[];
extern const u8 gTextStoryteller_Story21Action[];
extern const u8 gTextStoryteller_Story21Text[];
extern const u8 gTextStoryteller_Story22Title[];
extern const u8 gTextStoryteller_Story22Action[];
extern const u8 gTextStoryteller_Story22Text[];
extern const u8 gTextStoryteller_Story23Title[];
extern const u8 gTextStoryteller_Story23Action[];
extern const u8 gTextStoryteller_Story23Text[];
extern const u8 gTextStoryteller_Story24Title[];
extern const u8 gTextStoryteller_Story24Action[];
extern const u8 gTextStoryteller_Story24Text[];
extern const u8 gTextStoryteller_Story25Title[];
extern const u8 gTextStoryteller_Story25Action[];
extern const u8 gTextStoryteller_Story25Text[];
extern const u8 gTextStoryteller_Story26Title[];
extern const u8 gTextStoryteller_Story26Action[];
extern const u8 gTextStoryteller_Story26Text[];
extern const u8 gTextStoryteller_Story27Title[];
extern const u8 gTextStoryteller_Story27Action[];
extern const u8 gTextStoryteller_Story27Text[];
extern const u8 gTextStoryteller_Story28Title[];
extern const u8 gTextStoryteller_Story28Action[];
extern const u8 gTextStoryteller_Story28Text[];
extern const u8 gTextStoryteller_Story29Title[];
extern const u8 gTextStoryteller_Story29Action[];
extern const u8 gTextStoryteller_Story29Text[];
extern const u8 gTextStoryteller_Story30Title[];
extern const u8 gTextStoryteller_Story30Action[];
extern const u8 gTextStoryteller_Story30Text[];
extern const u8 gTextStoryteller_Story31Title[];
extern const u8 gTextStoryteller_Story31Action[];
extern const u8 gTextStoryteller_Story31Text[];
extern const u8 gTextStoryteller_Story32Title[];
extern const u8 gTextStoryteller_Story32Action[];
extern const u8 gTextStoryteller_Story32Text[];
extern const u8 gTextStoryteller_Story33Title[];
extern const u8 gTextStoryteller_Story33Action[];
extern const u8 gTextStoryteller_Story33Text[];
extern const u8 gTextStoryteller_Story34Title[];
extern const u8 gTextStoryteller_Story34Action[];
extern const u8 gTextStoryteller_Story34Text[];
extern const u8 gTextStoryteller_Story35Title[];
extern const u8 gTextStoryteller_Story35Action[];
extern const u8 gTextStoryteller_Story35Text[];
extern const u8 gTextStoryteller_Story36Title[];
extern const u8 gTextStoryteller_Story36Action[];
extern const u8 gTextStoryteller_Story36Text[];

extern struct BardSong gUnknown_03005DA0;

__attribute__((section("ewram_data"))) static u16 gUnknown_020388BC = 0;

static const u16 sDefaultBardSongLyrics[] =
{
    EC_WORD_SISTER,
    EC_WORD_EATS,
    EC_WORD_SWEETS,
    EC_WORD_VORACIOUS,
    EC_WORD_AND,
    EC_WORD_DROOLING,
};

static const u8 *const sGiddyAdjectives[] =
{
    OtherText_SoPretty,
    OtherText_SoDarling,
    OtherText_SoRelaxed,
    OtherText_SoSunny,
    OtherText_SoDesirable,
    OtherText_SoExciting,
    OtherText_SoAmusing,
    OtherText_SoMagical,
};

static const u8 *const sGiddyQuestions[] =
{
    OtherText_WantVacationNicePlace,
    OtherText_BoughtCrayonsIsNice,
    OtherText_IfWeCouldFloat,
    OtherText_SandWashesAwayMakeSad,
    OtherText_WhatsBottomSeaLike,
    OtherText_SeeSettingSun,
    OtherText_LyingInGreenGrass,
    OtherText_SecretBasesWonderful,
};

static void sub_80F7DC0(void);
static void Task_BardSong(u8);
static void StartBardSong(u8);
static void StorytellerSetup(void);
static void sub_80F8428(void);

static void SetupBard(void)
{
    u16 i;
    struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;

    bard->id = MAUVILLE_MAN_BARD;
    bard->hasChangedSong = 0;
    for (i = 0; i < 6; i++)
        bard->songLyrics[i] = sDefaultBardSongLyrics[i];
}

static void SetupHipster(void)
{
    struct MauvilleManHipster *hipster = &gSaveBlock1.mauvilleMan.hipster;

    hipster->id = MAUVILLE_MAN_HIPSTER;
    hipster->alreadySpoken = 0;
}

static void SetupStoryteller(void)
{
    StorytellerSetup();
}

static void SetupGiddy(void)
{
    struct MauvilleManGiddy *giddy = &gSaveBlock1.mauvilleMan.giddy;

    giddy->id = MAUVILLE_MAN_GIDDY;
    giddy->taleCounter = 0;
}

static void SetupTrader(void)
{
    TraderSetup();
}

void SetupMauvilleOldMan(void)
{
    u16 trainerId = (gSaveBlock2.playerTrainerId[1] << 8) | gSaveBlock2.playerTrainerId[0];


    switch ((trainerId % 10) / 2)
    {
    case MAUVILLE_MAN_BARD:
        SetupBard();
        break;
    case MAUVILLE_MAN_HIPSTER:
        SetupHipster();
        break;
    case MAUVILLE_MAN_TRADER:
        SetupTrader();
        break;
    case MAUVILLE_MAN_STORYTELLER:
        SetupStoryteller();
        break;
    case MAUVILLE_MAN_GIDDY:
        SetupGiddy();
        break;
    }
    sub_80F83D0();
}

static u8 GetCurrentMauvilleOldMan(void)
{
    struct MauvilleManCommon *common = &gSaveBlock1.mauvilleMan.common;

    return common->id;
}

void ScrSpecial_GetCurrentMauvilleMan(void)
{
    gScriptResult = GetCurrentMauvilleOldMan();
}

void ScrSpecial_HasBardSongBeenChanged(void)
{
    u16 *scriptResult = &gScriptResult;
    struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;

    *scriptResult = bard->hasChangedSong;
}

void ScrSpecial_SaveBardSongLyrics(void)
{
    u16 i;
    struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;

    StringCopy(bard->playerName, gSaveBlock2.playerName);

    for (i = 0; i < 4; i++)
        bard->playerTrainerId[i] = gSaveBlock2.playerTrainerId[i];

    for (i = 0; i < 6; i++)
        bard->songLyrics[i] = bard->temporaryLyrics[i];

    bard->hasChangedSong = 1;
}


void PrepareSongText(void)
{
    struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;
    u16 specialVar = gSpecialVar_0x8004;
    u16 *lyrics;
    u16 lineNum;
    u8 *wordEnd;
    u8 *str;

    lyrics = bard->temporaryLyrics;
    if (specialVar == 0)
        lyrics = bard->songLyrics;
    wordEnd = gStringVar4;
    str = wordEnd;

    for (lineNum = 0; lineNum < 2; lineNum++)
    {
        wordEnd = EasyChat_GetWordText(wordEnd, *(lyrics++));
        while (wordEnd != str)
        {
            if (*str == 0x00)
                *str = 0x37;
            str++;
        }

        str++;
        *(wordEnd++) = 0x00;

        wordEnd = EasyChat_GetWordText(wordEnd, *(lyrics++));
        while (wordEnd != str)
        {
            if (*str == 0x00)
                *str = 0x37;
            str++;
        }

        str++;
        *(wordEnd++) = 0xFE;

        wordEnd = EasyChat_GetWordText(wordEnd, *(lyrics++));
        while (wordEnd != str)
        {
            if (*str == 0x00)
                *str = 0x37;
            str++;
        }

        if (lineNum == 0)
        {
            *(wordEnd++) = 0xFC;
            *(wordEnd++) = 15;
        }
    }
}

void ScrSpecial_PlayBardSong(void)
{
    StartBardSong(gSpecialVar_0x8004);
    MenuDisplayMessageBox();
    ScriptContext1_Stop();
}

void ScrSpecial_GetHipsterSpokenFlag(void)
{
    u16 *scriptResult = &gScriptResult;
    struct MauvilleManHipster *hipster = &gSaveBlock1.mauvilleMan.hipster;

    *scriptResult = hipster->alreadySpoken;
}

void ScrSpecial_SetHipsterSpokenFlag(void)
{
    struct MauvilleManHipster *hipster = &gSaveBlock1.mauvilleMan.hipster;

    hipster->alreadySpoken = 1;
}

void ScrSpecial_HipsterTeachWord(void)
{
    u16 var = sub_80EB8EC();

    if (var == 0xFFFF)
    {
        gScriptResult = 0;
    }
    else
    {
        EasyChat_GetWordText(gStringVar1, var);
        gScriptResult = 1;
    }
}

void ScrSpecial_GiddyShouldTellAnotherTale(void)
{
    struct MauvilleManGiddy *giddy = &gSaveBlock1.mauvilleMan.giddy;

    if (giddy->taleCounter == 10)
    {
        gScriptResult = 0;
        giddy->taleCounter = 0;
    }
    else
    {
        gScriptResult = 1;
    }
}

void ScrSpecial_GenerateGiddyLine(void)
{
    struct MauvilleManGiddy *giddy = &gSaveBlock1.mauvilleMan.giddy;

    if (giddy->taleCounter == 0)
        sub_80F7DC0();

    if (giddy->randomWords[giddy->taleCounter] != 0xFFFF)
    {
        u8 *stringPtr;
        u32 adjective = Random();

        adjective %= 8;
        stringPtr = EasyChat_GetWordText(gStringVar4, giddy->randomWords[giddy->taleCounter]);
        stringPtr = StringCopy(stringPtr, gOtherText_Is);
        stringPtr = StringCopy(stringPtr, sGiddyAdjectives[adjective]);
        StringCopy(stringPtr, gOtherText_DontYouAgree);
    }
    else
    {
        StringCopy(gStringVar4, sGiddyQuestions[giddy->questionList[giddy->questionNum++]]);
    }

    if (!(Random() % 10))
        giddy->taleCounter = 10;
    else
        giddy->taleCounter++;

    gScriptResult = 1;
}
# 507 "src/field/mauville_man.c"
static const u16 gUnknown_083E53C8[][2] =
{
    { 0x0, 0},
    { 0xC, 0},
    { 0xD, 0},
    {0x12, 0},
    {0x13, 0},
    {0x15, 0},
};

__attribute__((naked))
static void sub_80F7DC0(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x18\n    ldr r1, _080F7E84 @ =gUnknown_083E53C8\n    mov r0, sp\n    movs r2, 0x18\n    bl memcpy\n    movs r5, 0\n    movs r0, 0x2\n    add r0, sp\n    mov r8, r0\n    ldr r1, _080F7E88 @ =gSaveBlock1 + 0x2D94\n    adds r1, 0x18\n    adds r3, r1, 0\n_080F7DE4:\n    adds r0, r3, r5\n    strb r5, [r0]\n    adds r0, r5, 0x1\n    lsls r0, 16\n    lsrs r5, r0, 16\n    cmp r5, 0x7\n    bls _080F7DE4\n    movs r5, 0\n    ldr r2, _080F7E88 @ =gSaveBlock1 + 0x2D94\n    adds r2, 0x4\n    mov r9, r2\n    adds r6, r1, 0\n_080F7DFC:\n    bl Random\n    lsls r0, 16\n    lsrs r0, 16\n    adds r4, r5, 0x1\n    adds r1, r4, 0\n    bl __modsi3\n    lsls r0, 16\n    lsrs r1, r0, 16\n    adds r2, r6, r5\n    ldrb r7, [r2]\n    adds r1, r6, r1\n    ldrb r0, [r1]\n    strb r0, [r2]\n    strb r7, [r1]\n    lsls r4, 16\n    lsrs r5, r4, 16\n    cmp r5, 0x7\n    bls _080F7DFC\n    movs r3, 0\n    mov r10, r3\n    movs r5, 0\n_080F7E2A:\n    lsls r4, r5, 2\n    mov r1, sp\n    adds r0, r1, r4\n    ldrb r0, [r0]\n    bl sub_80EAE88\n    add r4, r8\n    strh r0, [r4]\n    add r0, r10\n    lsls r0, 16\n    lsrs r0, 16\n    mov r10, r0\n    adds r0, r5, 0x1\n    lsls r0, 16\n    lsrs r5, r0, 16\n    cmp r5, 0x5\n    bls _080F7E2A\n    movs r0, 0\n    ldr r2, _080F7E88 @ =gSaveBlock1 + 0x2D94\n    strb r0, [r2, 0x2]\n    movs r7, 0\n    movs r5, 0\n_080F7E56:\n    bl Random\n    lsls r0, 16\n    lsrs r0, 16\n    movs r1, 0xA\n    bl __umodsi3\n    lsls r0, 16\n    lsrs r1, r0, 16\n    cmp r1, 0x2\n    bhi _080F7E90\n    cmp r7, 0x7\n    bhi _080F7E90\n    lsls r0, r5, 1\n    add r0, r9\n    ldr r1, _080F7E8C @ =0x0000ffff\n    strh r1, [r0]\n    adds r0, r7, 0x1\n    lsls r0, 16\n    lsrs r7, r0, 16\n    adds r4, r5, 0x1\n    b _080F7EE2\n    .align 2, 0\n_080F7E84: .4byte gUnknown_083E53C8\n_080F7E88: .4byte gSaveBlock1 + 0x2D94\n_080F7E8C: .4byte 0x0000ffff\n_080F7E90:\n    bl Random\n    lsls r0, 16\n    lsrs r0, 16\n    mov r1, r10\n    bl __umodsi3\n    lsls r0, 16\n    lsrs r2, r0, 16\n    movs r1, 0\n    adds r4, r5, 0x1\n    lsls r6, r5, 1\n    cmp r5, 0x5\n    bhi _080F7ECC\n    mov r3, r8\n    ldrh r0, [r3]\n    b _080F7EC2\n_080F7EB2:\n    adds r0, r1, 0x1\n    lsls r0, 16\n    lsrs r1, r0, 16\n    cmp r5, 0x5\n    bhi _080F7ECC\n    lsls r0, r1, 2\n    adds r0, r3, r0\n    ldrh r0, [r0]\n_080F7EC2:\n    subs r0, r2, r0\n    lsls r0, 16\n    lsrs r2, r0, 16\n    cmp r0, 0\n    bgt _080F7EB2\n_080F7ECC:\n    cmp r1, 0x6\n    bne _080F7ED2\n    movs r1, 0\n_080F7ED2:\n    lsls r0, r1, 2\n    add r0, sp\n    ldrh r0, [r0]\n    bl sub_80EB784\n    mov r2, r9\n    adds r1, r2, r6\n    strh r0, [r1]\n_080F7EE2:\n    lsls r0, r4, 16\n    lsrs r5, r0, 16\n    cmp r5, 0x9\n    bls _080F7E56\n    add sp, 0x18\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .syntax divided\n");
# 677 "src/field/mauville_man.c"
}


static void sub_80F7EFC(void)
{
    struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;

    bard->hasChangedSong = 0;
}

static void sub_80F7F0C(void)
{
    struct MauvilleManHipster *hipster = &gSaveBlock1.mauvilleMan.hipster;

    hipster->alreadySpoken = 0;
}

static void sub_80F7F18(void)
{
    sub_8109A20();
}

static void sub_80F7F24(void)
{
    sub_80F8428();
}

void sub_80F7F30(void)
{
    switch (GetCurrentMauvilleOldMan())
    {
    case MAUVILLE_MAN_BARD:
        sub_80F7EFC();
        break;
    case MAUVILLE_MAN_HIPSTER:
        sub_80F7F0C();
        break;
    case MAUVILLE_MAN_STORYTELLER:
        sub_80F7F24();
        break;
    case MAUVILLE_MAN_TRADER:
        sub_80F7F18();
        break;
    case MAUVILLE_MAN_GIDDY:
        break;
    }
    sub_80F83D0();
}






static void StartBardSong(bool8 useTemporaryLyrics)
{
    u8 taskId = CreateTask(Task_BardSong, 0x50);

    gTasks[taskId].data[5] = useTemporaryLyrics;
}

static void BardSing(struct Task *task, struct BardSong *song)
{
    switch (task->data[0])
    {
    case 0:
        {
            struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;
            u16 *lyrics;
            s32 i;


            if (gSpecialVar_0x8004 == 0)
                lyrics = bard->songLyrics;
            else
                lyrics = bard->temporaryLyrics;
            for (i = 0; i < 6; i++)
                song->lyrics[i] = lyrics[i];


            for (i = 0; i < 6; i++)
            {
                song->phonemes[i].sound = 0xFFFF;
                song->phonemes[i].length = 0;
                song->phonemes[i].pitch = 0;
                song->phonemes[i].volume = 0;
            }
            song->currWord = 0;
            song->currPhoneme = 0;
            song->var04 = 0;
        }
        break;
    case 1:
        break;
    case 2:
        {
            u16 word = song->lyrics[song->currWord];
            const struct BardSound *sounds = GetWordSounds(((word) >> 9), ((word) & 0x1FF));

            song->var04 = 0;
            GetWordPhonemes(song, sounds, (((word) % 4) + (((word) / 8) & 1)));
        }
        break;
    case 3:
    case 4:
        {
            struct BardPhoneme *phoneme = &song->phonemes[song->currPhoneme];

            switch (song->state)
            {
            case 0:
                if (song->phonemeTimer == 0)
                {
                    if (song->currPhoneme == 6 || phoneme->sound == 0xFF)
                    {
                        song->state = 0xFE;
                        break;
                    }
                    song->phonemeTimer = phoneme->length;
                    if (phoneme->sound <= 50)
                    {
                        u16 num = phoneme->sound / 3;

                        m4aSongNumStart(249 + num * 3);
                    }
                    song->state = 1;
                }
                else
                {
                    if (song->voiceInflection > 10)
                        song->volume -= 2;
                    if (song->voiceInflection & 1)
                        song->pitch += 64;
                    else
                        song->pitch -= 64;
                    m4aMPlayVolumeControl(&gMPlay_SE2, 0xFFFF, song->volume);
                    m4aMPlayPitchControl(&gMPlay_SE2, 0xFFFF, song->pitch);
                    song->voiceInflection++;
                }
                song->phonemeTimer--;
                break;
            case 1:
                song->currPhoneme++;
                song->state = 0;
                if (phoneme->sound <= 50)
                {
                    song->volume = 0x100 + phoneme->volume * 16;
                    m4aMPlayVolumeControl(&gMPlay_SE2, 0xFFFF, song->volume);
                    song->pitch = 0x200 + phoneme->pitch;
                    m4aMPlayPitchControl(&gMPlay_SE2, 0xFFFF, song->pitch);
                }
                break;
            case 0xFE:
                m4aMPlayStop(&gMPlay_SE2);
                song->state = 0xFF;
                break;
            }
        }
        break;
    case 5:
        break;
    }
}

static void Task_BardSong(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    BardSing(task, &gUnknown_03005DA0);
    switch (task->data[0])
    {
    case 0:
        PrepareSongText();
        InitWindowFromConfig(gMenuWindowPtr, &gWindowConfig_81E6CE4);
        sub_8002EB0(gMenuWindowPtr, gStringVar4, 2, 4, 15);
        task->data[1] = 0;
        task->data[2] = 0;
        task->data[3] = 0;
        task->data[4] = 0;
        FadeOutBGMTemporarily(4);
        task->data[0] = 1;
        break;
    case 1:
        if (IsBGMPausedOrStopped())
            task->data[0] = 2;
        break;
    case 2:
        {
            struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;
            u8 *str = gStringVar4 + task->data[3];
            u16 wordLen = 0;

            u32 temp;
            register s16 zero asm("r1");

            while (*str != 0x00
                && *str != 0xFE
                && *str != 0xFC
                && *str != 0xFF)
            {
                str++;
                wordLen++;
            }
            if (!task->data[5])
                gUnknown_020388BC = (((bard->songLyrics[task->data[4]]) % 4) + (((bard->songLyrics[task->data[4]]) / 8) & 1));
            else
                gUnknown_020388BC = (((bard->temporaryLyrics[task->data[4]]) % 4) + (((bard->temporaryLyrics[task->data[4]]) / 8) & 1));
            temp = gUnknown_03005DA0.var04 / wordLen;
            zero = 0;
            gUnknown_03005DA0.var04 = temp;
            if (gUnknown_03005DA0.var04 <= 0)
                gUnknown_03005DA0.var04 = 1;
            task->data[4]++;
            if (task->data[2] == 0)
                task->data[0] = 3;
            else
                task->data[0] = 5;
            task->data[1] = zero;
        }
        break;
    case 5:
        if (task->data[2] == 0)
            task->data[0] = 3;
        else
            task->data[2]--;
        break;
    case 3:
        if (gStringVar4[task->data[3]] == 0xFF)
        {
            FadeInNewBGM(BGM_POKECEN, 6);
            m4aMPlayFadeOutTemporarily(&gMPlay_SE2, 2);
            EnableBothScriptContexts();
            DestroyTask(taskId);
        }
        else if (gStringVar4[task->data[3]] == 0x00)
        {
            sub_8003418(gMenuWindowPtr);
            task->data[3]++;
            task->data[0] = 2;
            task->data[2] = 0;
        }
        else if (gStringVar4[task->data[3]] == 0xFE)
        {
            task->data[3]++;
            task->data[0] = 2;
            task->data[2] = 0;
        }
        else if (gStringVar4[task->data[3]] == 0xFC)
        {
            task->data[3] += 2;
            task->data[0] = 2;
            task->data[2] = 8;
        }
        else if (gStringVar4[task->data[3]] == 0x37)
        {
            gStringVar4[task->data[3]] = 0x00;
            sub_8003418(gMenuWindowPtr);
            task->data[3]++;
            task->data[2] = 0;
        }
        else
        {
            switch (task->data[1])
            {
            case 0:
                sub_8003418(gMenuWindowPtr);
                task->data[1]++;
                break;
            case 1:
                task->data[1]++;
                break;
            case 2:
                task->data[3]++;
                task->data[1] = 0;
                task->data[2] = gUnknown_03005DA0.var04;
                task->data[0] = 4;
                break;
            }
        }
        break;
    case 4:
        task->data[2]--;
        if (task->data[2] == 0)
            task->data[0] = 3;
        break;
    }
}

void sub_80F83D0(void)
{
    VarSet(0x4010, 0x45 + GetCurrentMauvilleOldMan());
}

struct Story
{
    u8 stat;
    u8 minVal;
    const u8 *title;
    const u8 *action;
    const u8 *fullText;
};

static const struct Story sStorytellerStories[] =
{
    {0x32, 1, gTextStoryteller_Story1Title, gTextStoryteller_Story1Action, gTextStoryteller_Story1Text},
    {0x02, 1, gTextStoryteller_Story2Title, gTextStoryteller_Story2Action, gTextStoryteller_Story2Text},
    {0x03, 1, gTextStoryteller_Story3Title, gTextStoryteller_Story3Action, gTextStoryteller_Story3Text},
    {0x04, 1, gTextStoryteller_Story4Title, gTextStoryteller_Story4Action, gTextStoryteller_Story4Text},
    {0x06, 1, gTextStoryteller_Story5Title, gTextStoryteller_Story5Action, gTextStoryteller_Story5Text},
    {0x09, 1, gTextStoryteller_Story6Title, gTextStoryteller_Story6Action, gTextStoryteller_Story6Text},
    {0x0B, 1, gTextStoryteller_Story7Title, gTextStoryteller_Story7Action, gTextStoryteller_Story7Text},
    {0x0C, 1, gTextStoryteller_Story8Title, gTextStoryteller_Story8Action, gTextStoryteller_Story8Text},
    {0x0D, 1, gTextStoryteller_Story9Title, gTextStoryteller_Story9Action, gTextStoryteller_Story9Text},
    {0x0E, 1, gTextStoryteller_Story10Title, gTextStoryteller_Story10Action, gTextStoryteller_Story10Text},
    {0x0F, 1, gTextStoryteller_Story11Title, gTextStoryteller_Story11Action, gTextStoryteller_Story11Text},
    {0x10, 1, gTextStoryteller_Story12Title, gTextStoryteller_Story12Action, gTextStoryteller_Story12Text},
    {0x11, 1, gTextStoryteller_Story13Title, gTextStoryteller_Story13Action, gTextStoryteller_Story13Text},
    {0x12, 1, gTextStoryteller_Story14Title, gTextStoryteller_Story14Action, gTextStoryteller_Story14Text},
    {0x13, 1, gTextStoryteller_Story15Title, gTextStoryteller_Story15Action, gTextStoryteller_Story15Text},
    {0x14, 1, gTextStoryteller_Story16Title, gTextStoryteller_Story16Action, gTextStoryteller_Story16Text},
    {0x1A, 1, gTextStoryteller_Story17Title, gTextStoryteller_Story17Action, gTextStoryteller_Story17Text},
    {0x1B, 1, gTextStoryteller_Story18Title, gTextStoryteller_Story18Action, gTextStoryteller_Story18Text},
    {0x1C, 1, gTextStoryteller_Story19Title, gTextStoryteller_Story19Action, gTextStoryteller_Story19Text},
    {0x1D, 2, gTextStoryteller_Story20Title, gTextStoryteller_Story20Action, gTextStoryteller_Story20Text},
    {0x1E, 1, gTextStoryteller_Story21Title, gTextStoryteller_Story21Action, gTextStoryteller_Story21Text},
    {0x21, 1, gTextStoryteller_Story22Title, gTextStoryteller_Story22Action, gTextStoryteller_Story22Text},
    {0x24, 1, gTextStoryteller_Story23Title, gTextStoryteller_Story23Action, gTextStoryteller_Story23Text},
    {0x25, 1, gTextStoryteller_Story24Title, gTextStoryteller_Story24Action, gTextStoryteller_Story24Text},
    {0x26, 1, gTextStoryteller_Story25Title, gTextStoryteller_Story25Action, gTextStoryteller_Story25Text},
    {0x27, 1, gTextStoryteller_Story26Title, gTextStoryteller_Story26Action, gTextStoryteller_Story26Text},
    {0x28, 1, gTextStoryteller_Story27Title, gTextStoryteller_Story27Action, gTextStoryteller_Story27Text},
    {0x29, 1, gTextStoryteller_Story28Title, gTextStoryteller_Story28Action, gTextStoryteller_Story28Text},
    {0x2A, 1, gTextStoryteller_Story29Title, gTextStoryteller_Story29Action, gTextStoryteller_Story29Text},
    {0x2B, 1, gTextStoryteller_Story30Title, gTextStoryteller_Story30Action, gTextStoryteller_Story30Text},
    {0x2C, 1, gTextStoryteller_Story31Title, gTextStoryteller_Story31Action, gTextStoryteller_Story31Text},
    {0x2D, 1, gTextStoryteller_Story32Title, gTextStoryteller_Story32Action, gTextStoryteller_Story32Text},
    {0x2E, 1, gTextStoryteller_Story33Title, gTextStoryteller_Story33Action, gTextStoryteller_Story33Text},
    {0x2F, 1, gTextStoryteller_Story34Title, gTextStoryteller_Story34Action, gTextStoryteller_Story34Text},
    {0x30, 1, gTextStoryteller_Story35Title, gTextStoryteller_Story35Action, gTextStoryteller_Story35Text},
    {0x31, 1, gTextStoryteller_Story36Title, gTextStoryteller_Story36Action, gTextStoryteller_Story36Text},
};

static void StorytellerSetup(void)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;
    s32 i;

    storyteller->id = MAUVILLE_MAN_STORYTELLER;
    storyteller->alreadyRecorded = 0;
    for (i = 0; i < 4; i++)
    {
        storyteller->gameStatIDs[i] = 0;
        storyteller->trainerNames[0][i] = 0xFF;
    }
}

static void sub_80F8428(void)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

    storyteller->id = MAUVILLE_MAN_STORYTELLER;
    storyteller->alreadyRecorded = 0;
}

static u32 StorytellerGetGameStat(u8 stat)
{
    if (stat == 50)
        stat = 0;
    return GetGameStat(stat);
}

static const struct Story *GetStoryByStat(u32 stat)
{
    s32 i;

    for (i = 0; i < 36; i++)
    {
        if (sStorytellerStories[i].stat == stat)
            return &sStorytellerStories[i];
    }
    return &sStorytellerStories[35];
}

static const u8 *GetStoryTitleByStat(u32 stat)
{
    return GetStoryByStat(stat)->title;
}

static const u8 *GetStoryTextByStat(u32 stat)
{
    return GetStoryByStat(stat)->fullText;
}

static const u8 *GetStoryActionByStat(u32 stat)
{
    return GetStoryByStat(stat)->action;
}

static u8 GetFreeStorySlot(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

        if (storyteller->gameStatIDs[i] == 0)
            break;
    }
    return i;
}

static u32 StorytellerGetRecordedTrainerStat(u32 trainer)
{
    u8 *ptr = gSaveBlock1.mauvilleMan.storyteller.statValues[trainer];

    return ptr[0] | (ptr[1] << 8) | (ptr[2] << 16) | (ptr[3] << 24);
}

static void StorytellerSetRecordedTrainerStat(u32 trainer, u32 val)
{
    u8 *ptr = gSaveBlock1.mauvilleMan.storyteller.statValues[trainer];

    ptr[0] = val;
    ptr[1] = val >> 8;
    ptr[2] = val >> 16;
    ptr[3] = val >> 24;
}

static bool32 HasTrainerStatIncreased(u32 trainer)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

    if (StorytellerGetGameStat(storyteller->gameStatIDs[trainer]) > StorytellerGetRecordedTrainerStat(trainer))
        return 1;
    else
        return 0;
}

static void GetStoryByStattellerPlayerName(u32 player, void *dst)
{
    u8 *name = gSaveBlock1.mauvilleMan.storyteller.trainerNames[player];

    memset(dst, 0xFF, 8);
    memcpy(dst, name, 7);
}

static void StorytellerSetPlayerName(u32 player, const u8 *src)
{
    u8 *name = gSaveBlock1.mauvilleMan.storyteller.trainerNames[player];
    u8 len = StringLength(src);

    memset(name, 0xFF, 7);
    StringCopyN(name, src, len);
}

static void StorytellerRecordNewStat(u32 player, u32 stat)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

    storyteller->gameStatIDs[player] = stat;
    StorytellerSetPlayerName(player, gSaveBlock2.playerName);
    StorytellerSetRecordedTrainerStat(player, StorytellerGetGameStat(stat));
    ConvertIntToDecimalStringN(gStringVar1, StorytellerGetGameStat(stat), 0, 10);
    StringCopy(gStringVar2, GetStoryActionByStat(stat));
}

static void ScrambleStatList(u8 *arr, s32 count)
{
    s32 i;

    for (i = 0; i < count; i++)
        arr[i] = i;
    for (i = 0; i < count; i++)
    {
        u32 a = Random() % count;
        u32 b = Random() % count;
        u8 temp = arr[a];
        arr[a] = arr[b];
        arr[b] = temp;
    }
}


static const struct {u32 length; struct MauvilleManStoryteller *unused1; u32 unused2;} sStorytellerStuff =
{
    36,
    &gSaveBlock1.mauvilleMan.storyteller,
    12,
};

static bool8 StorytellerInitializeRandomStat(void)
{
    u8 arr[sStorytellerStuff.length];
    s32 i;
    s32 j;

    ScrambleStatList(arr, 36);
    for (i = 0; i < 36; i++)
    {
        u8 stat = sStorytellerStories[arr[i]].stat;
        u8 minVal = sStorytellerStories[arr[i]].minVal;
        struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

        for (j = 0; j < 4; j++)
        {
            if (gSaveBlock1.mauvilleMan.storyteller.gameStatIDs[j] == stat)
                break;
        }
        if (j == 4 && StorytellerGetGameStat(stat) >= minVal)
        {
            storyteller->alreadyRecorded = 1;
            StorytellerRecordNewStat(GetFreeStorySlot(), stat);
            return 1;
        }
    }
    return 0;
}

static void StorytellerDisplayStory(u32 player)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;
    u8 stat = storyteller->gameStatIDs[player];

    ConvertIntToDecimalStringN(gStringVar1, StorytellerGetRecordedTrainerStat(player), 0, 10);
    StringCopy(gStringVar2, GetStoryActionByStat(stat));
    GetStoryByStattellerPlayerName(player, gStringVar3);
    ShowFieldMessage(GetStoryTextByStat(stat));
}

static void PrintStoryList(void)
{
    s32 i;

    MenuDrawTextWindow(0, 0, 25, 4 + GetFreeStorySlot() * 2);
    for (i = 0; i < 4; i++)
    {
        struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;
        u8 stat = storyteller->gameStatIDs[i];

        if (stat == 0)
            break;
        MenuPrint(GetStoryTitleByStat(stat), 1, 2 + i * 2);
    }
    MenuPrint(gPCText_Cancel, 1, 2 + i * 2);
}

static u8 gUnknown_03000748;

static void Task_StoryListMenu(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s32 selection;

    switch (task->data[0])
    {
    case 0:
        PrintStoryList();
        InitMenu(0, 1, 2, GetFreeStorySlot() + 1, 0, 24);
        task->data[0]++;
        break;
    case 1:
        selection = ProcessMenuInput();
        if (selection == -2)
            break;
        if (selection == -1 || selection == GetFreeStorySlot())
        {
            gScriptResult = 0;
        }
        else
        {
            gScriptResult = 1;
            gUnknown_03000748 = selection;
        }
        HandleDestroyMenuCursors();
        MenuZeroFillWindowRect(0, 0, 25, 12);
        DestroyTask(taskId);
        EnableBothScriptContexts();
        break;
    }
}


void ScrSpecial_StorytellerStoryListMenu(void)
{
    CreateTask(Task_StoryListMenu, 0x50);
}

void ScrSpecial_StorytellerDisplayStory(void)
{
    StorytellerDisplayStory(gUnknown_03000748);
}

u8 ScrSpecial_StorytellerGetFreeStorySlot(void)
{
    return GetFreeStorySlot();
}


bool8 ScrSpecial_StorytellerUpdateStat(void)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;
    u8 r4 = storyteller->gameStatIDs[gUnknown_03000748];

    if (HasTrainerStatIncreased(gUnknown_03000748) == 1)
    {
        StorytellerRecordNewStat(gUnknown_03000748, r4);
        return 1;
    }
    return 0;
}

bool8 ScrSpecial_HasStorytellerAlreadyRecorded(void)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

    if (storyteller->alreadyRecorded == 0)
        return 0;
    else
        return 1;
}

bool8 ScrSpecial_StorytellerInitializeRandomStat(void)
{
    return StorytellerInitializeRandomStat();
}
