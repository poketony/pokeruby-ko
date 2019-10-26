# 1 "src/engine/tileset_anim.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/engine/tileset_anim.c"
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
# 2 "src/engine/tileset_anim.c" 2
# 1 "include/tileset_anim.h" 1



void sub_8072E74(void);
void cur_mapheader_run_tileset_funcs_after_some_cpuset(void);
void sub_8072ED0(void);
void sub_8072EDC(void);
void TilesetCB_General(void);
void TilesetCB_Building(void);
void TilesetCB_Petalburg(void);
void TilesetCB_Rustboro(void);
void TilesetCB_Dewford(void);
void TilesetCB_Slateport(void);
void TilesetCB_Mauville(void);
void TilesetCB_Lavaridge(void);
void TilesetCB_Fallarbor(void);
void TilesetCB_Fortree(void);
void TilesetCB_Lilycove(void);
void TilesetCB_Mossdeep(void);
void TilesetCB_EverGrande(void);
void TilesetCB_Pacifidlog(void);
void TilesetCB_Sootopolis(void);
void TilesetCB_Underwater(void);
void TilesetCB_SootopolisGym(void);
void TilesetCB_Cave(void);
void TilesetCB_EliteFour(void);
void TilesetCB_MauvilleGym(void);
void TilesetCB_BikeShop(void);
# 3 "src/engine/tileset_anim.c" 2

struct Dma
{
    const void *src;
    const void *dest;
    u16 size;
};

__attribute__((section("ewram_data"))) static struct Dma gTilesetAnimDmas[20] = {0};

static u8 gNumTilesetAnimDmas;
static u16 gTileset1AnimFrame;
static u16 gTileset1AnimLength;
static u16 gTileset2AnimFrame;
static u16 gTileset2AnimLength;
static void (*gTileset1AnimCallback)(u16);
static void (*gTileset2AnimCallback)(u16);

static void StartTileset1Animation(void);
static void StartTileset2Animation(void);

static void sub_8073014(u16);
static void sub_8073058(u16);

static void sub_8073070(u16);
static void sub_8073098(u16);
static void sub_80730C0(u16);
static void sub_80730E8(u16);
static void sub_807361C(u16);

static void sub_8073424(u16);
static void sub_80734A0(u16);
static void sub_8073514(u16);
static void sub_8073540(u16);
static void sub_80735B4(u16);
static void sub_80735E4(u16);
static void sub_80738A8(u16);
static void sub_8073600(u16);
static void sub_80738C0(u16);
static void sub_8073890(u16);
static void sub_80738EC(u16);

static void sub_80737A4(u16, u8);
static void sub_80737E0(u16);
static void sub_8073704(u16, u8);
static void sub_8073644(u8);
static void sub_8073808(u16);
static void sub_8073830(u16, u8);
static void sub_807368C(u8);
static void sub_80736DC(u8);
static void sub_80736B4(u8);
static void sub_8073868(u16);

static void sub_8073904(u16);
static void sub_80739C4(u16);
static void sub_807392C(u16);
static void sub_807399C(u16);
static void sub_8073974(u16);
static void sub_80739EC(u16);

static const u8 TilesetAnimTiles_General_0_1[] = INCBIN_U8("data/tilesets/primary/general/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_General_0_0[] = INCBIN_U8("data/tilesets/primary/general/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_General_0_2[] = INCBIN_U8("data/tilesets/primary/general/anim/0/2.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnimTable_General_0[] =
{
    TilesetAnimTiles_General_0_0,
    TilesetAnimTiles_General_0_1,
    TilesetAnimTiles_General_0_0,
    TilesetAnimTiles_General_0_2,
};

static const u8 TilesetAnimTiles_General_1_0[] = INCBIN_U8("data/tilesets/primary/general/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_General_1_1[] = INCBIN_U8("data/tilesets/primary/general/anim/1/1.4bpp");
static const u8 TilesetAnimTiles_General_1_2[] = INCBIN_U8("data/tilesets/primary/general/anim/1/2.4bpp");
static const u8 TilesetAnimTiles_General_1_3[] = INCBIN_U8("data/tilesets/primary/general/anim/1/3.4bpp");
static const u8 TilesetAnimTiles_General_1_4[] = INCBIN_U8("data/tilesets/primary/general/anim/1/4.4bpp");
static const u8 TilesetAnimTiles_General_1_5[] = INCBIN_U8("data/tilesets/primary/general/anim/1/5.4bpp");
static const u8 TilesetAnimTiles_General_1_6[] = INCBIN_U8("data/tilesets/primary/general/anim/1/6.4bpp");
static const u8 TilesetAnimTiles_General_1_7[] = INCBIN_U8("data/tilesets/primary/general/anim/1/7.4bpp");

static const u8 *const gTilesetAnimTable_General_1[] =
{
    TilesetAnimTiles_General_1_0,
    TilesetAnimTiles_General_1_1,
    TilesetAnimTiles_General_1_2,
    TilesetAnimTiles_General_1_3,
    TilesetAnimTiles_General_1_4,
    TilesetAnimTiles_General_1_5,
    TilesetAnimTiles_General_1_6,
    TilesetAnimTiles_General_1_7,
};

static const u8 TilesetAnimTiles_General_2_0[] = INCBIN_U8("data/tilesets/primary/general/anim/2/0.4bpp");
static const u8 TilesetAnimTiles_General_2_1[] = INCBIN_U8("data/tilesets/primary/general/anim/2/1.4bpp");
static const u8 TilesetAnimTiles_General_2_2[] = INCBIN_U8("data/tilesets/primary/general/anim/2/2.4bpp");
static const u8 TilesetAnimTiles_General_2_3[] = INCBIN_U8("data/tilesets/primary/general/anim/2/3.4bpp");
static const u8 TilesetAnimTiles_General_2_4[] = INCBIN_U8("data/tilesets/primary/general/anim/2/4.4bpp");
static const u8 TilesetAnimTiles_General_2_5[] = INCBIN_U8("data/tilesets/primary/general/anim/2/5.4bpp");
static const u8 TilesetAnimTiles_General_2_6[] = INCBIN_U8("data/tilesets/primary/general/anim/2/6.4bpp");

static const u8 *const gTilesetAnimTable_General_2[] =
{
    TilesetAnimTiles_General_2_0,
    TilesetAnimTiles_General_2_1,
    TilesetAnimTiles_General_2_2,
    TilesetAnimTiles_General_2_3,
    TilesetAnimTiles_General_2_4,
    TilesetAnimTiles_General_2_5,
    TilesetAnimTiles_General_2_6,
    TilesetAnimTiles_General_2_0,
};

static const u8 TilesetAnimTiles_General_3_0[] = INCBIN_U8("data/tilesets/primary/general/anim/3/0.4bpp");
static const u8 TilesetAnimTiles_General_3_1[] = INCBIN_U8("data/tilesets/primary/general/anim/3/1.4bpp");
static const u8 TilesetAnimTiles_General_3_2[] = INCBIN_U8("data/tilesets/primary/general/anim/3/2.4bpp");
static const u8 TilesetAnimTiles_General_3_3[] = INCBIN_U8("data/tilesets/primary/general/anim/3/3.4bpp");

static const u8 *const gTilesetAnimTable_General_3[] =
{
    TilesetAnimTiles_General_3_0,
    TilesetAnimTiles_General_3_1,
    TilesetAnimTiles_General_3_2,
    TilesetAnimTiles_General_3_3,
};

static const u8 TilesetAnimTiles_General_4_0[] = INCBIN_U8("data/tilesets/primary/general/anim/4/0.4bpp");
static const u8 TilesetAnimTiles_General_4_1[] = INCBIN_U8("data/tilesets/primary/general/anim/4/1.4bpp");
static const u8 TilesetAnimTiles_General_4_2[] = INCBIN_U8("data/tilesets/primary/general/anim/4/2.4bpp");
static const u8 TilesetAnimTiles_General_4_3[] = INCBIN_U8("data/tilesets/primary/general/anim/4/3.4bpp");

static const u8 *const gTilesetAnimTable_General_4[] =
{
    TilesetAnimTiles_General_4_0,
    TilesetAnimTiles_General_4_1,
    TilesetAnimTiles_General_4_2,
    TilesetAnimTiles_General_4_3,
};

static const u8 TilesetAnimTiles_Lavaridge_0[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/0.4bpp");
static const u8 TilesetAnimTiles_Lavaridge_1[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/1.4bpp");
static const u8 TilesetAnimTiles_Lavaridge_2[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/2.4bpp");
static const u8 TilesetAnimTiles_Lavaridge_3[] = INCBIN_U8("data/tilesets/secondary/lavaridge/anim/3.4bpp");

static const u8 *const gTilesetAnimTable_Lavaridge[] =
{
    TilesetAnimTiles_Lavaridge_0,
    TilesetAnimTiles_Lavaridge_1,
    TilesetAnimTiles_Lavaridge_2,
    TilesetAnimTiles_Lavaridge_3,
};

static const u8 TilesetAnimTiles_Pacifidlog_0_0[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_0_1[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_0_2[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/0/2.4bpp");

static const u8 *const gTilesetAnimTable_Pacifidlog_0[] =
{
    TilesetAnimTiles_Pacifidlog_0_0,
    TilesetAnimTiles_Pacifidlog_0_1,
    TilesetAnimTiles_Pacifidlog_0_2,
    TilesetAnimTiles_Pacifidlog_0_1,
};

static const u8 TilesetAnimTiles_Underwater_0[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/0.4bpp");
static const u8 TilesetAnimTiles_Underwater_1[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/1.4bpp");
static const u8 TilesetAnimTiles_Underwater_2[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/2.4bpp");
static const u8 TilesetAnimTiles_Underwater_3[] = INCBIN_U8("data/tilesets/secondary/underwater/anim/3.4bpp");

static const u8 *const gTilesetAnimTable_Underwater[] =
{
    TilesetAnimTiles_Underwater_0,
    TilesetAnimTiles_Underwater_1,
    TilesetAnimTiles_Underwater_2,
    TilesetAnimTiles_Underwater_3,
};

static const u8 TilesetAnimTiles_Pacifidlog_1_0[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_1[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/1.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_2[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/2.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_3[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/3.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_4[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/4.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_5[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/5.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_6[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/6.4bpp");
static const u8 TilesetAnimTiles_Pacifidlog_1_7[] = INCBIN_U8("data/tilesets/secondary/pacifidlog/anim/1/7.4bpp");

static const u8 *const gTilesetAnimTable_Pacifidlog_1[] =
{
    TilesetAnimTiles_Pacifidlog_1_0,
    TilesetAnimTiles_Pacifidlog_1_1,
    TilesetAnimTiles_Pacifidlog_1_2,
    TilesetAnimTiles_Pacifidlog_1_3,
    TilesetAnimTiles_Pacifidlog_1_4,
    TilesetAnimTiles_Pacifidlog_1_5,
    TilesetAnimTiles_Pacifidlog_1_6,
    TilesetAnimTiles_Pacifidlog_1_7,
};

static const u8 TilesetAnimTiles_Mauville_0_0[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_Mauville_0_1[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_Mauville_0_2[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/2.4bpp");
static const u8 TilesetAnimTiles_Mauville_0_3[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/3.4bpp");
static const u8 TilesetAnimTiles_Mauville_0_4[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/0/4.4bpp");

static const u8 TilesetAnimTiles_Mauville_1_0[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_Mauville_1_1[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/1.4bpp");
static const u8 TilesetAnimTiles_Mauville_1_2[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/2.4bpp");
static const u8 TilesetAnimTiles_Mauville_1_3[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/3.4bpp");
static const u8 TilesetAnimTiles_Mauville_1_4[] = INCBIN_U8("data/tilesets/secondary/mauville/anim/1/4.4bpp");

static const void *const gUnknown_0837BAE4[] =
{
    (void *)(0x6000000 + 0x4C00),
    (void *)(0x6000000 + 0x4C80),
    (void *)(0x6000000 + 0x4D00),
    (void *)(0x6000000 + 0x4D80),
    (void *)(0x6000000 + 0x4E00),
    (void *)(0x6000000 + 0x4E80),
    (void *)(0x6000000 + 0x4F00),
    (void *)(0x6000000 + 0x4F80),
};

static const void *const gUnknown_0837BB04[] =
{
    (void *)(0x6000000 + 0x5000),
    (void *)(0x6000000 + 0x5080),
    (void *)(0x6000000 + 0x5100),
    (void *)(0x6000000 + 0x5180),
    (void *)(0x6000000 + 0x5200),
    (void *)(0x6000000 + 0x5280),
    (void *)(0x6000000 + 0x5300),
    (void *)(0x6000000 + 0x5380),
};

static const u8 *const gTilesetAnimTable_Mauville_0A[] =
{
    TilesetAnimTiles_Mauville_0_0,
    TilesetAnimTiles_Mauville_0_0,
    TilesetAnimTiles_Mauville_0_1,
    TilesetAnimTiles_Mauville_0_2,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_3,
    TilesetAnimTiles_Mauville_0_2,
    TilesetAnimTiles_Mauville_0_1,
};

static const u8 *const gTilesetAnimTable_Mauville_1A[] =
{
    TilesetAnimTiles_Mauville_1_0,
    TilesetAnimTiles_Mauville_1_0,
    TilesetAnimTiles_Mauville_1_1,
    TilesetAnimTiles_Mauville_1_2,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_3,
    TilesetAnimTiles_Mauville_1_2,
    TilesetAnimTiles_Mauville_1_1,
};

static const u8 *const gTilesetAnimTable_Mauville_0B[] =
{
    TilesetAnimTiles_Mauville_0_0,
    TilesetAnimTiles_Mauville_0_0,
    TilesetAnimTiles_Mauville_0_4,
    TilesetAnimTiles_Mauville_0_4,
};

static const u8 *const gTilesetAnimTable_Mauville_1B[] =
{
    TilesetAnimTiles_Mauville_1_0,
    TilesetAnimTiles_Mauville_1_0,
    TilesetAnimTiles_Mauville_1_4,
    TilesetAnimTiles_Mauville_1_4,
};

static const u8 TilesetAnimTiles_Rustboro_0_0[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_1[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_2[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/2.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_3[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/3.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_4[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/4.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_5[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/5.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_6[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/6.4bpp");
static const u8 TilesetAnimTiles_Rustboro_0_7[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/0/7.4bpp");

static const void *const gUnknown_0837BFA4[] =
{
    (void *)(0x6000000 + 0x5000),
    (void *)(0x6000000 + 0x5080),
    (void *)(0x6000000 + 0x5100),
    (void *)(0x6000000 + 0x5180),
    (void *)(0x6000000 + 0x5200),
    (void *)(0x6000000 + 0x5280),
    (void *)(0x6000000 + 0x5300),
    (void *)(0x6000000 + 0x5380),
};

static const u8 *const gTilesetAnimTable_Rustboro_0[] =
{
    TilesetAnimTiles_Rustboro_0_0,
    TilesetAnimTiles_Rustboro_0_1,
    TilesetAnimTiles_Rustboro_0_2,
    TilesetAnimTiles_Rustboro_0_3,
    TilesetAnimTiles_Rustboro_0_4,
    TilesetAnimTiles_Rustboro_0_5,
    TilesetAnimTiles_Rustboro_0_6,
    TilesetAnimTiles_Rustboro_0_7,
};

static const u8 TilesetAnimTiles_Rustboro_1_0[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_Rustboro_1_1[] = INCBIN_U8("data/tilesets/secondary/rustboro/anim/1/1.4bpp");

static const u8 *const gTilesetAnimTable_Rustboro_1[] =
{
    TilesetAnimTiles_Rustboro_1_0,
    TilesetAnimTiles_Rustboro_1_1,
};

static const u8 TilesetAnimTiles_Cave_0[] = INCBIN_U8("data/tilesets/secondary/cave/anim/0.4bpp");
static const u8 TilesetAnimTiles_Cave_1[] = INCBIN_U8("data/tilesets/secondary/cave/anim/1.4bpp");
static const u8 TilesetAnimTiles_Cave_2[] = INCBIN_U8("data/tilesets/secondary/cave/anim/2.4bpp");
static const u8 TilesetAnimTiles_Cave_3[] = INCBIN_U8("data/tilesets/secondary/cave/anim/3.4bpp");

static const u8 TilesetAnimTiles_Cave_4[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/0.4bpp");
static const u8 TilesetAnimTiles_Cave_5[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/1.4bpp");
static const u8 TilesetAnimTiles_Cave_6[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/2.4bpp");
static const u8 TilesetAnimTiles_Cave_7[] = INCBIN_U8("data/tilesets/secondary/cave/anim/unused/3.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnimTable_Cave[] =
{
    TilesetAnimTiles_Cave_0,
    TilesetAnimTiles_Cave_1,
    TilesetAnimTiles_Cave_2,
    TilesetAnimTiles_Cave_3,
};

static const u8 TilesetAnimTiles_EverGrande_0[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/0.4bpp");
static const u8 TilesetAnimTiles_EverGrande_1[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/1.4bpp");
static const u8 TilesetAnimTiles_EverGrande_2[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/2.4bpp");
static const u8 TilesetAnimTiles_EverGrande_3[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/3.4bpp");
static const u8 TilesetAnimTiles_EverGrande_4[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/4.4bpp");
static const u8 TilesetAnimTiles_EverGrande_5[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/5.4bpp");
static const u8 TilesetAnimTiles_EverGrande_6[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/6.4bpp");
static const u8 TilesetAnimTiles_EverGrande_7[] = INCBIN_U8("data/tilesets/secondary/ever_grande/anim/7.4bpp");
asm(".space 32");

static const void *const gUnknown_0837C93C[] =
{
    (void *)(0x6000000 + 0x5C00),
    (void *)(0x6000000 + 0x5C80),
    (void *)(0x6000000 + 0x5D00),
    (void *)(0x6000000 + 0x5D80),
    (void *)(0x6000000 + 0x5E00),
    (void *)(0x6000000 + 0x5E80),
    (void *)(0x6000000 + 0x5F00),
    (void *)(0x6000000 + 0x5F80),
};

static const u8 *const gTilesetAnimTable_EverGrande[] =
{
    TilesetAnimTiles_EverGrande_0,
    TilesetAnimTiles_EverGrande_1,
    TilesetAnimTiles_EverGrande_2,
    TilesetAnimTiles_EverGrande_3,
    TilesetAnimTiles_EverGrande_4,
    TilesetAnimTiles_EverGrande_5,
    TilesetAnimTiles_EverGrande_6,
    TilesetAnimTiles_EverGrande_7,
};

static const u8 TilesetAnimTiles_Building_0[] = INCBIN_U8("data/tilesets/primary/building/anim/0.4bpp");
static const u8 TilesetAnimTiles_Building_1[] = INCBIN_U8("data/tilesets/primary/building/anim/1.4bpp");

static const u8 *const gTilesetAnimTable_Building[] =
{
    TilesetAnimTiles_Building_0,
    TilesetAnimTiles_Building_1,
};

static const u8 TilesetAnimTiles_SootopolisGym_0_0[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_SootopolisGym_0_1[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_SootopolisGym_0_2[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/0/2.4bpp");
static const u8 TilesetAnimTiles_SootopolisGym_1_0[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_SootopolisGym_1_1[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/1/1.4bpp");
static const u8 TilesetAnimTiles_SootopolisGym_1_2[] = INCBIN_U8("data/tilesets/secondary/sootopolis_gym/anim/1/2.4bpp");

static const u8 *const gTilesetAnimTable_SootopolisGym_0[] =
{
    TilesetAnimTiles_SootopolisGym_0_0,
    TilesetAnimTiles_SootopolisGym_0_1,
    TilesetAnimTiles_SootopolisGym_0_2,
};

static const u8 *const gTilesetAnimTable_SootopolisGym_1[] =
{
    TilesetAnimTiles_SootopolisGym_1_0,
    TilesetAnimTiles_SootopolisGym_1_1,
    TilesetAnimTiles_SootopolisGym_1_2,
};

static const u8 TilesetAnimTiles_EliteFour_1_0[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/1/0.4bpp");
static const u8 TilesetAnimTiles_EliteFour_1_1[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/1/1.4bpp");
static const u8 TilesetAnimTiles_EliteFour_0_0[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/0.4bpp");
static const u8 TilesetAnimTiles_EliteFour_0_1[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/1.4bpp");
static const u8 TilesetAnimTiles_EliteFour_0_2[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/2.4bpp");
static const u8 TilesetAnimTiles_EliteFour_0_3[] = INCBIN_U8("data/tilesets/secondary/elite_four/anim/0/3.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnimTable_EliteFour_0[] =
{
    TilesetAnimTiles_EliteFour_0_0,
    TilesetAnimTiles_EliteFour_0_1,
    TilesetAnimTiles_EliteFour_0_2,
    TilesetAnimTiles_EliteFour_0_3,
};

static const u8 *const gTilesetAnimTable_EliteFour_1[] =
{
    TilesetAnimTiles_EliteFour_1_0,
    TilesetAnimTiles_EliteFour_1_1,
};

static const u8 TilesetAnimTiles_MauvilleGym_0[] = INCBIN_U8("data/tilesets/secondary/mauville_gym/anim/0.4bpp");
static const u8 TilesetAnimTiles_MauvilleGym_1[] = INCBIN_U8("data/tilesets/secondary/mauville_gym/anim/1.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnimTable_MauvilleGym[] =
{
    TilesetAnimTiles_MauvilleGym_0,
    TilesetAnimTiles_MauvilleGym_1,
};

static const u8 TilesetAnimTiles_BikeShop_0[] = INCBIN_U8("data/tilesets/secondary/bike_shop/anim/0.4bpp");
static const u8 TilesetAnimTiles_BikeShop_1[] = INCBIN_U8("data/tilesets/secondary/bike_shop/anim/1.4bpp");
asm(".space 32");

static const u8 *const gTilesetAnimTable_BikeShop[] =
{
    TilesetAnimTiles_BikeShop_0,
    TilesetAnimTiles_BikeShop_1,
};

static void ClearTilesetAnimDmas(void)
{
    gNumTilesetAnimDmas = 0;
    { vu32 tmp = (vu32)(0); CpuSet((void *)&tmp, &gTilesetAnimDmas, 0x04000000 | 0x01000000 | ((sizeof(gTilesetAnimDmas))/(32/8) & 0x1FFFFF)); };
}

static void QueueTilesetAnimDma(const void *src, const void *dest, u16 size)
{
    if (gNumTilesetAnimDmas < 20)
    {
        gTilesetAnimDmas[gNumTilesetAnimDmas].src = src;
        gTilesetAnimDmas[gNumTilesetAnimDmas].dest = dest;
        gTilesetAnimDmas[gNumTilesetAnimDmas].size = size;
        gNumTilesetAnimDmas++;
    }
}

void sub_8072E74(void)
{
    int i;
    for (i = 0; i < gNumTilesetAnimDmas; i++)
    {
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gTilesetAnimDmas[i].src); dmaRegs[1] = (vu32)(gTilesetAnimDmas[i].dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((gTilesetAnimDmas[i].size)/(16/8))); dmaRegs[2]; }


                                     ;
    }
    gNumTilesetAnimDmas = 0;
}

void cur_mapheader_run_tileset_funcs_after_some_cpuset(void)
{
    ClearTilesetAnimDmas();
    StartTileset1Animation();
    StartTileset2Animation();
}

void sub_8072ED0(void)
{
    StartTileset2Animation();
}

void sub_8072EDC(void)
{
    ClearTilesetAnimDmas();
    if (++gTileset1AnimFrame >= gTileset1AnimLength)
    {
        gTileset1AnimFrame = 0;
    }
    if (++gTileset2AnimFrame >= gTileset2AnimLength)
    {
        gTileset2AnimFrame = 0;
    }
    if (gTileset1AnimCallback)
    {
        gTileset1AnimCallback(gTileset1AnimFrame);
    }
    if (gTileset2AnimCallback)
    {
        gTileset2AnimCallback(gTileset2AnimFrame);
    }
}

static void StartTileset1Animation(void)
{
    gTileset1AnimFrame = 0;
    gTileset1AnimLength = 0;
    gTileset1AnimCallback = 0;
    if (gMapHeader.mapData->primaryTileset)
    {
        if (gMapHeader.mapData->primaryTileset->callback)
        {
            gMapHeader.mapData->primaryTileset->callback();
        }
    }
}

static void StartTileset2Animation(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = 0;
    gTileset2AnimCallback = 0;
    if (gMapHeader.mapData->secondaryTileset)
    {
        if (gMapHeader.mapData->secondaryTileset->callback)
        {
            gMapHeader.mapData->secondaryTileset->callback();
        }
    }
}

void TilesetCB_General(void)
{
    gTileset1AnimFrame = 0;
    gTileset1AnimLength = 0x100;
    gTileset1AnimCallback = sub_8073014;
}

void TilesetCB_Building(void)
{
    gTileset1AnimFrame = 0;
    gTileset1AnimLength = 0x100;
    gTileset1AnimCallback = sub_8073058;
}

static void sub_8073014(u16 a1)
{
    int v1;
    v1 = a1 % 0x10;
    if (v1 == 0) sub_8073070(a1 / 0x10);
    if (v1 == 1) sub_8073098(a1 / 0x10);
    if (v1 == 2) sub_80730C0(a1 / 0x10);
    if (v1 == 3) sub_80730E8(a1 / 0x10);
    if (v1 == 4) sub_807361C(a1 / 0x10);
}

static void sub_8073058(u16 a1)
{
    if (a1 % 8 == 0)
    {
        sub_8073904(a1 / 8);
    }
}

static void sub_8073070(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_General_0[v1], (void *)(0x6000000 + (0x80 * (127))), 0x80);
}

static void sub_8073098(u16 a1)
{
    u8 v1;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnimTable_General_1[v1], (void *)(0x6000000 + (0x80 * (108))), 0x3c0);
}

static void sub_80730C0(u16 a1)
{
    int v1;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnimTable_General_2[v1], (void *)(0x6000000 + (0x80 * (116))), 0x140);
}

static void sub_80730E8(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_General_3[v1], (void *)(0x6000000 + (0x80 * (124))), 0xc0);
}

void TilesetCB_Petalburg(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Rustboro(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_8073424;
}

void TilesetCB_Dewford(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Slateport(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Mauville(void)
{
    gTileset2AnimFrame = gTileset1AnimFrame;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_80734A0;
}

void TilesetCB_Lavaridge(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_8073514;
}

void TilesetCB_Fallarbor(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Fortree(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Lilycove(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Mossdeep(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_EverGrande(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_8073540;
}

void TilesetCB_Pacifidlog(void)
{
    gTileset2AnimFrame = gTileset1AnimFrame;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_80735B4;
}

void TilesetCB_Sootopolis(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = 0;
}

void TilesetCB_Underwater(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = 0x80;
    gTileset2AnimCallback = sub_80735E4;
}

void TilesetCB_SootopolisGym(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = 0xf0;
    gTileset2AnimCallback = sub_80738A8;
}

void TilesetCB_Cave(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_8073600;
}

void TilesetCB_EliteFour(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = 0x80;
    gTileset2AnimCallback = sub_80738C0;
}

void TilesetCB_MauvilleGym(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_8073890;
}

void TilesetCB_BikeShop(void)
{
    gTileset2AnimFrame = 0;
    gTileset2AnimLength = gTileset1AnimLength;
    gTileset2AnimCallback = sub_80738EC;
}

static void sub_8073424(u16 a1)
{
    int v1;
    v1 = a1 % 8;
    if (v1 == 0)
    {
        sub_80737A4(a1 / 8, 0);
        sub_80737E0(a1 / 8);
    }
    if (v1 == 1) sub_80737A4(a1 / 8, 1);
    if (v1 == 2) sub_80737A4(a1 / 8, 2);
    if (v1 == 3) sub_80737A4(a1 / 8, 3);
    if (v1 == 4) sub_80737A4(a1 / 8, 4);
    if (v1 == 5) sub_80737A4(a1 / 8, 5);
    if (v1 == 6) sub_80737A4(a1 / 8, 6);
    if (v1 == 7) sub_80737A4(a1 / 8, 7);
}

static void sub_80734A0(u16 a1)
{
    int v1;
    v1 = a1 % 8;
    if (v1 == 0) sub_8073704(a1 / 8, 0);
    if (v1 == 1) sub_8073704(a1 / 8, 1);
    if (v1 == 2) sub_8073704(a1 / 8, 2);
    if (v1 == 3) sub_8073704(a1 / 8, 3);
    if (v1 == 4) sub_8073704(a1 / 8, 4);
    if (v1 == 5) sub_8073704(a1 / 8, 5);
    if (v1 == 6) sub_8073704(a1 / 8, 6);
    if (v1 == 7) sub_8073704(a1 / 8, 7);
}

static void sub_8073514(u16 a1)
{
    int v1;
    v1 = a1 % 0x10;
    if (v1 == 0) sub_8073644(a1 / 0x10);
    if (v1 == 1) sub_8073808(a1 / 0x10);
}

static void sub_8073540(u16 a1)
{
    int v1;
    v1 = a1 % 8;
    if (v1 == 0) sub_8073830(a1 / 8, 0);
    if (v1 == 1) sub_8073830(a1 / 8, 1);
    if (v1 == 2) sub_8073830(a1 / 8, 2);
    if (v1 == 3) sub_8073830(a1 / 8, 3);
    if (v1 == 4) sub_8073830(a1 / 8, 4);
    if (v1 == 5) sub_8073830(a1 / 8, 5);
    if (v1 == 6) sub_8073830(a1 / 8, 6);
    if (v1 == 7) sub_8073830(a1 / 8, 7);
}

static void sub_80735B4(u16 a1)
{
    int v1;
    v1 = a1 % 0x10;
    if (v1 == 0) sub_807368C(a1 / 0x10);
    if (v1 == 1) sub_80736DC(a1 / 0x10);
}

static void sub_80735E4(u16 a1)
{
    int v1;
    v1 = a1 % 0x10;
    if (v1 == 0) sub_80736B4(a1 / 0x10);
}

static void sub_8073600(u16 a1)
{
    int v1;
    v1 = a1 % 0x10;
    if (v1 == 1) sub_8073868(a1 / 0x10);
}

static void sub_807361C(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_General_4[v1], (void *)(0x6000000 + (0x80 * (120))), 0x140);
}

static void sub_8073644(u8 a1)
{
    u8 v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Lavaridge[v1], (void *)(0x6000000 + (0x80 * (200))), 0x80);
    v1 = (a1 + 2) % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Lavaridge[v1], (void *)(0x6000000 + (0x80 * (201))), 0x80);
}

static void sub_807368C(u8 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Pacifidlog_0[v1], (void *)(0x6000000 + (0x80 * (244))), 0x3c0);
}

static void sub_80736B4(u8 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Underwater[v1], (void *)(0x6000000 + (0x80 * (252))), 0x80);
}

static void sub_80736DC(u8 a1)
{
    int v1;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnimTable_Pacifidlog_1[v1], (void *)(0x6000000 + (0x80 * (252))), 0x100);
}

static void sub_8073704(u16 a1, u8 a2)
{
    int v1;
    a1 -= a2;
    if (a1 < 12)
    {
        v1 = a1 % 12;
        QueueTilesetAnimDma(gTilesetAnimTable_Mauville_0A[v1], gUnknown_0837BAE4[a2], 0x80);
        QueueTilesetAnimDma(gTilesetAnimTable_Mauville_1A[v1], gUnknown_0837BB04[a2], 0x80);
    }
    else
    {
        v1 = a1 % 4;
        QueueTilesetAnimDma(gTilesetAnimTable_Mauville_0B[v1], gUnknown_0837BAE4[a2], 0x80);
        QueueTilesetAnimDma(gTilesetAnimTable_Mauville_1B[v1], gUnknown_0837BB04[a2], 0x80);
    }
}

static void sub_80737A4(u16 a1, u8 a2)
{
    int v1;
    a1 -= a2;

    v1 = a1 % 8;
    if (gTilesetAnimTable_Rustboro_0[v1])
    {
        QueueTilesetAnimDma(gTilesetAnimTable_Rustboro_0[v1], gUnknown_0837BFA4[a2], 0x80);
    }
}

static void sub_80737E0(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnimTable_Rustboro_1[v1], (void *)(0x6000000 + (0x80 * (240))), 0x80);
}

static void sub_8073808(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Cave[v1], (void *)(0x6000000 + (0x80 * (168))), 0x80);
}

static void sub_8073830(u16 a1, u8 a2)
{
    int v1;
    a1 -= a2;
    v1 = a1 % 8;
    QueueTilesetAnimDma(gTilesetAnimTable_EverGrande[v1], gUnknown_0837C93C[a2], 0x80);
}

static void sub_8073868(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_Cave[v1], (void *)(0x6000000 + (0x80 * (232))), 0x80);
}

static void sub_8073890(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    if (!v1)
    {
        sub_80739C4(a1 / 2);
    }
}

static void sub_80738A8(u16 a1)
{
    int v1;
    v1 = a1 % 8;
    if (!v1)
    {
        sub_807392C(a1 / 8);
    }
}

static void sub_80738C0(u16 a1)
{
    if (a1 % 0x40 == 0)
    {
        sub_807399C(a1 / 0x40);
    }
    if (a1 % 8 == 1)
    {
        sub_8073974(a1 / 8);
    }
}

static void sub_80738EC(u16 a1)
{
    if (a1 % 4 == 0)
    {
        sub_80739EC(a1 / 4);
    }
}

static void sub_8073904(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnimTable_Building[v1], (void *)(0x6000000 + (0x80 * (124))), 0x80);
}

static void sub_807392C(u16 a1)
{
    int v1;
    v1 = a1 % 3;
    QueueTilesetAnimDma(gTilesetAnimTable_SootopolisGym_0[v1], (void *)(0x6000000 + (0x80 * (252))), 0x180);
    QueueTilesetAnimDma(gTilesetAnimTable_SootopolisGym_1[v1], (void *)(0x6000000 + (0x80 * (244))), 0x280);
}

static void sub_8073974(u16 a1)
{
    int v1;
    v1 = a1 % 4;
    QueueTilesetAnimDma(gTilesetAnimTable_EliteFour_0[v1], (void *)(0x6000000 + (0x80 * (254))), 0x20);
}

static void sub_807399C(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnimTable_EliteFour_1[v1], (void *)(0x6000000 + (0x80 * (248))), 0x80);
}

static void sub_80739C4(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnimTable_MauvilleGym[v1], (void *)(0x6000000 + (0x80 * (164))), 0x200);
}

static void sub_80739EC(u16 a1)
{
    int v1;
    v1 = a1 % 2;
    QueueTilesetAnimDma(gTilesetAnimTable_BikeShop[v1], (void *)(0x6000000 + (0x80 * (252))), 0x120);
}
