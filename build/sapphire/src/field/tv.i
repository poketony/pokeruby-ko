# 1 "src/field/tv.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/tv.c"
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
# 2 "src/field/tv.c" 2
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
# 3 "src/field/tv.c" 2
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
# 4 "src/field/tv.c" 2
# 1 "include/contest_painting.h" 1
# 9 "include/contest_painting.h"
enum
{
    NORMAL_RANK,
    SUPER_RANK,
    HYPER_RANK,
    MASTER_RANK,
};

enum
{
    CONTEST_COOL,
    CONTEST_BEAUTY,
    CONTEST_CUTE,
    CONTEST_SMART,
    CONTEST_TOUGH,
};

enum
{
    CONTESTRESULT_COOL = 9,
    CONTESTRESULT_BEAUTY = 13,
    CONTESTRESULT_CUTE = 2,
    CONTESTRESULT_SMART = 36,
    CONTESTRESULT_TOUGH = 6,
};

struct Unk2015E00
{
    u16 unk2015e00[128][32];
    u16 unk2017e00[0];
};

struct ContestEntry
{
             u8 var0;
             u32 var4;
             u16 var8;
             u8 contestType;
             u8 pokemon_name[10];
             u8 pad15;
             u8 trainer_name[7];
};

struct LabelPair
{
    const u8 *prefix;
    const u8 *suffix;
};

void sub_8106630(u32);
void CB2_ContestPainting(void);
# 5 "src/field/tv.c" 2
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
# 6 "src/field/tv.c" 2
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
# 7 "src/field/tv.c" 2
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
# 8 "src/field/tv.c" 2
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
# 9 "src/field/tv.c" 2
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
# 10 "src/field/tv.c" 2
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
# 11 "src/field/tv.c" 2
# 1 "include/flags.h" 1
# 94 "include/flags.h"
bool8 FlagGet(u16 flag);
# 12 "src/field/tv.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 13 "src/field/tv.c" 2
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
# 14 "src/field/tv.c" 2
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
# 15 "src/field/tv.c" 2
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
# 16 "src/field/tv.c" 2
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
# 17 "src/field/tv.c" 2
# 1 "include/naming_screen.h" 1



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
# 18 "src/field/tv.c" 2
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
# 19 "src/field/tv.c" 2
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
# 20 "src/field/tv.c" 2
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
# 21 "src/field/tv.c" 2
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
# 22 "src/field/tv.c" 2
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
# 23 "src/field/tv.c" 2

# 1 "include/field_map_obj.h" 1
# 25 "src/field/tv.c" 2
# 1 "include/field_specials.h" 1



struct ElevatorMenu {
    u8 var0;
    s8 var1;
    s8 var2;
    u8 var3;
};

extern u8 gUnknown_02039250;
extern u8 gUnknown_02039251;
extern u32 gUnknown_02039254;
extern u8 gUnknown_02039258;
extern u8 gUnknown_02039259;
extern u8 gUnknown_0203925A;
extern u8 gUnknown_0203925B;
extern u8 gUnknown_0203925C;

void ResetCyclingRoadChallengeData(void);
bool32 CountSSTidalStep(u16);
u8 GetSSTidalLocation(s8 *, s8 *, s16 *, s16 *);
void ScriptAddElevatorMenuItem(u8, u8, u8, u8);
void ScriptShowElevatorMenu(void);
void SetShoalItemFlag(u16);
u8 GetLeadMonIndex(void);
void ResetFanClub(void);
u8 sub_810FB10(u8 a0);
# 26 "src/field/tv.c" 2
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
# 27 "src/field/tv.c" 2
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
# 28 "src/field/tv.c" 2




# 1 "include/region_map.h" 1



struct RegionMap
{
    u8 mapSectionName[20];
    u16 mapSectionId;
    u8 unk16;
    u8 everGrandeCityArea;
    u8 (*inputCallback)(void);
    struct Sprite *cursorSprite;
    struct Sprite *playerIconSprite;
    s32 bg2x;
    s32 bg2y;
    u32 unk2C;
    u32 unk30;
    u32 unk34;
    u32 unk38;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s32 unk50;
    u16 cursorPosX;
    u16 cursorPosY;
    u16 cursorTileTag;
    u16 cursorPaletteTag;
    s16 scrollX;
    s16 scrollY;
    s16 unk60;
    s16 unk62;
    u16 unk64;
    u16 unk66;
    u16 unk68;
    u16 unk6A;
    u16 unk6C;
    u16 unk6E;
    u16 playerIconTileTag;
    u16 playerIconPaletteTag;
    u16 unk74;
    u16 unk76;
    bool8 zoomed;
    u8 initStep;
    s8 unk7A;
    s8 cursorDeltaX;
    s8 cursorDeltaY;
    bool8 needUpdateVideoRegs;
    bool8 blinkPlayerIcon;
    bool8 playerIsInCave;
              u8 filler80[0x100];
              u8 cursorSmallImage[0x100];
              u8 cursorLargeImage[0x600];
};

void InitRegionMap(struct RegionMap *regionMap, bool8 zoomed);
void sub_80FA904(struct RegionMap *regionMap, bool8 zoomed);
bool8 sub_80FA940(void);
void FreeRegionMapIconResources(void);
u8 sub_80FAB60(void);
void sub_80FAEC4(void);
u8 sub_80FAFC0(void);
void UpdateRegionMapVideoRegs(void);
void sub_80FB2A4(s16, s16);
u16 sub_80FBA04(u16 mapSectionId);
void CreateRegionMapCursor(u16, u16);
void CreateRegionMapPlayerIcon(u16, u16);
const u8 *GetMapSectionName(u8 *dest, u16 mapSectionId, u16 length);
const u8 *CopyMapName(u8 *dest, u16 b);
const u8 *CopyLocationName(u8 *dest, u16 b);
# 33 "src/field/tv.c" 2


# 1 "include/rtc.h" 1



# 1 "include/siirtc.h" 1
# 12 "include/siirtc.h"
enum
{
    MONTH_JAN = 1,
    MONTH_FEB,
    MONTH_MAR,
    MONTH_APR,
    MONTH_MAY,
    MONTH_JUN,
    MONTH_JUL,
    MONTH_AUG,
    MONTH_SEP,
    MONTH_OCT,
    MONTH_NOV,
    MONTH_DEC
};

struct SiiRtcInfo
{
    u8 year;
    u8 month;
    u8 day;
    u8 dayOfWeek;
    u8 hour;
    u8 minute;
    u8 second;
    u8 status;
    u8 alarmHour;
    u8 alarmMinute;
};

void SiiRtcUnprotect(void);
void SiiRtcProtect(void);
u8 SiiRtcProbe(void);
bool8 SiiRtcReset(void);
bool8 SiiRtcGetStatus(struct SiiRtcInfo *rtc);
bool8 SiiRtcSetStatus(struct SiiRtcInfo *rtc);
bool8 SiiRtcGetDateTime(struct SiiRtcInfo *rtc);
bool8 SiiRtcSetDateTime(struct SiiRtcInfo *rtc);
bool8 SiiRtcGetTime(struct SiiRtcInfo *rtc);
bool8 SiiRtcSetTime(struct SiiRtcInfo *rtc);
bool8 SiiRtcSetAlarm(struct SiiRtcInfo *rtc);
# 5 "include/rtc.h" 2
# 20 "include/rtc.h"
extern struct Time gLocalTime;

void RtcDisableInterrupts(void);
void RtcRestoreInterrupts(void);
u32 ConvertBcdToBinary(u8 bcd);
bool8 IsLeapYear(u8 year);
u16 ConvertDateToDayCount(u8 year, u8 month, u8 day);
u16 RtcGetDayCount(struct SiiRtcInfo *rtc);
void RtcInit(void);
u16 RtcGetErrorStatus(void);
void RtcGetInfo(struct SiiRtcInfo *rtc);
void RtcGetDateTime(struct SiiRtcInfo *rtc);
void RtcGetStatus(struct SiiRtcInfo *rtc);
void RtcGetRawInfo(struct SiiRtcInfo *rtc);
u16 RtcCheckInfo(struct SiiRtcInfo *rtc);
void RtcReset(void);
void FormatDecimalTime(u8 *dest, s32 hour, s32 minute, s32 second);
void FormatHexTime(u8 *dest, s32 hour, s32 minute, s32 second);
void FormatHexRtcTime(u8 *dest);
void FormatDecimalDate(u8 *dest, s32 year, s32 month, s32 day);
void FormatHexDate(u8 *dest, s32 year, s32 month, s32 day);
void RtcCalcTimeDifference(struct SiiRtcInfo *rtc, struct Time *result, struct Time *t);
void RtcCalcLocalTime(void);
void RtcInitLocalTimeOffset(s32 hour, s32 minute);
void RtcCalcLocalTimeOffset(s32 days, s32 hours, s32 minutes, s32 seconds);
void CalcTimeDifference(struct Time *result, struct Time *t1, struct Time *t2);
u32 RtcGetMinuteCount(void);
# 36 "src/field/tv.c" 2
# 1 "include/script_menu.h" 1



struct MenuAction;

extern const u8 *const gUnknown_083CE048[];

bool8 ScriptMenu_Multichoice(u8 left, u8 top, u8 var3, u8 var4);
bool8 ScriptMenu_MultichoiceWithDefault(u8 left, u8 top, u8 var3, u8 var4, u8 var5);
bool8 Multichoice(u8 var1, u8 var2, u8 var3, u8 var4);
bool8 ScriptMenu_YesNo(u8 var1, u8 var2);
bool8 ScriptMenu_MultichoiceGrid(u8 left, u8 top, u8 multichoiceId, u8 a4, u8 columnCount);
bool8 ScrSpecial_CreatePCMenu(void);
void ScriptMenu_CreatePCMenu(void);
void ScriptMenu_DisplayPCStartupPrompt(void);
bool8 ScriptMenu_ShowPokemonPic(u16 var1, u8 var2, u8 var3);
bool8 (*ScriptMenu_GetPicboxWaitFunc(void))(void);
# 37 "src/field/tv.c" 2




# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 42 "src/field/tv.c" 2
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
# 43 "src/field/tv.c" 2
# 1 "include/region_map_sections.h" 1



enum
{
    MAPSEC_LittlerootTown,
    MAPSEC_OldaleTown,
    MAPSEC_DewfordTown,
    MAPSEC_LavaridgeTown,
    MAPSEC_FallarborTown,
    MAPSEC_VerdanturfTown,
    MAPSEC_PacifidlogTown,
    MAPSEC_PetalburgCity,
    MAPSEC_SlateportCity,
    MAPSEC_MauvilleCity,
    MAPSEC_RustboroCity,
    MAPSEC_FortreeCity,
    MAPSEC_LilycoveCity,
    MAPSEC_MossdeepCity,
    MAPSEC_SootopolisCity,
    MAPSEC_EverGrandeCity,
    MAPSEC_Route101,
    MAPSEC_Route102,
    MAPSEC_Route103,
    MAPSEC_Route104,
    MAPSEC_Route105,
    MAPSEC_Route106,
    MAPSEC_Route107,
    MAPSEC_Route108,
    MAPSEC_Route109,
    MAPSEC_Route110,
    MAPSEC_Route111,
    MAPSEC_Route112,
    MAPSEC_Route113,
    MAPSEC_Route114,
    MAPSEC_Route115,
    MAPSEC_Route116,
    MAPSEC_Route117,
    MAPSEC_Route118,
    MAPSEC_Route119,
    MAPSEC_Route120,
    MAPSEC_Route121,
    MAPSEC_Route122,
    MAPSEC_Route123,
    MAPSEC_Route124,
    MAPSEC_Route125,
    MAPSEC_Route126,
    MAPSEC_Route127,
    MAPSEC_Route128,
    MAPSEC_Route129,
    MAPSEC_Route130,
    MAPSEC_Route131,
    MAPSEC_Route132,
    MAPSEC_Route133,
    MAPSEC_Route134,
    MAPSEC_MtChimney,
    MAPSEC_Nothing,
};
# 44 "src/field/tv.c" 2

struct UnkTvStruct
{
    s8 var0;
};

extern u8 gUnknown_0300430A[11];

struct OutbreakPokemon
{
             u16 species;
             u16 moves[4];
             u8 level;
             u8 location;
};

struct TVSaleItem {
    u16 item_id;
    u16 item_amount;
};

extern u8 gUnknown_02038694;

extern struct TVSaleItem gUnknown_02038724[3];

struct UnkTvStruct gUnknown_03005D38;

extern u16 gScriptLastTalked;

extern u8 gScriptContestCategory;
extern u8 gScriptContestRank;
extern u8 gUnknown_03004316[11];
extern u8 gBattleOutcome;

extern u16 gLastUsedItem;

static __attribute__((section("ewram_data"))) u16 gUnknown_020387E0 = 0;
static __attribute__((section("ewram_data"))) u16 gUnknown_020387E2 = 0;
static __attribute__((section("ewram_data"))) u8 gUnknown_020387E4 = 0;
static __attribute__((section("ewram_data"))) __attribute__((aligned(4))) u8 gUnknown_020387E8 = 0;

static u8 gUnknown_03000720;
static u8 gUnknown_03000721;
static s8 gUnknown_03000722;

const struct OutbreakPokemon gPokeOutbreakSpeciesList[5] =
{
    {
        .species = SPECIES_SURSKIT,
        .moves = {MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE},
        .level = 3,
        .location = MAPSEC_Route102,
    },
    {
        .species = SPECIES_SURSKIT,
        .moves = {MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE},
        .level = 15,
        .location = MAPSEC_Route114,
    },
    {
        .species = SPECIES_SURSKIT,
        .moves = {MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE},
        .level = 15,
        .location = MAPSEC_Route117,
    },
    {
        .species = SPECIES_SURSKIT,
        .moves = {MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE},
        .level = 28,
        .location = MAPSEC_Route120,
    },
    {
        .species = SPECIES_SKITTY,
        .moves = {MOVE_GROWL, MOVE_TACKLE, MOVE_NONE, MOVE_NONE},
        .level = 15,
        .location = MAPSEC_Route116,
    },
};

extern const u8 gTVNewsText_EnergyGuru1[];
extern const u8 gTVNewsText_GameCorner1[];
extern const u8 gTVNewsText_LilycoveDepartment1[];
extern const u8 gTVNewsText_EnergyGuru2[];
extern const u8 gTVNewsText_GameCorner2[];
extern const u8 gTVNewsText_LilycoveDepartment2[];
extern const u8 gTVNewsText_EnergyGuru3[];
extern const u8 gTVNewsText_GameCorner3[];
extern const u8 gTVNewsText_LilycoveDepartment3[];
extern const u8 gTVFanClubText1[];
extern const u8 gTVFanClubText2[];
extern const u8 gTVFanClubText3[];
extern const u8 gTVFanClubText4[];
extern const u8 gTVFanClubText5[];
extern const u8 gTVFanClubText6[];
extern const u8 gTVFanClubText7[];
extern const u8 gTVFanClubText8[];
extern const u8 gTVRecentHappeningsText1[];
extern const u8 gTVRecentHappeningsText2[];
extern const u8 gTVRecentHappeningsText3[];
extern const u8 gTVRecentHappeningsText4[];
extern const u8 gTVRecentHappeningsText5[];
extern const u8 gTVRecentHappeningsText6[];
extern const u8 gTVFanClubOpinionsText1[];
extern const u8 gTVFanClubOpinionsText2[];
extern const u8 gTVFanClubOpinionsText3[];
extern const u8 gTVFanClubOpinionsText4[];
extern const u8 gTVFanClubOpinionsText5[];
extern const u8 gTVPokemonOutbreakText[];
extern const u8 gTVPokemonTodayText1[];
extern const u8 gTVPokemonTodayText2[];
extern const u8 gTVPokemonTodayText3[];
extern const u8 gTVPokemonTodayText4[];
extern const u8 gTVPokemonTodayText5[];
extern const u8 gTVPokemonTodayText6[];
extern const u8 gTVPokemonTodayText7[];
extern const u8 gTVPokemonTodayText8[];
extern const u8 gTVPokemonTodayText9[];
extern const u8 gTVPokemonTodayText10[];
extern const u8 gTVPokemonTodayText11[];
extern const u8 gTVPokemonTodayText12[];
extern const u8 gTVSmartShopperText1[];
extern const u8 gTVSmartShopperText2[];
extern const u8 gTVSmartShopperText3[];
extern const u8 gTVSmartShopperText4[];
extern const u8 gTVSmartShopperText5[];
extern const u8 gTVSmartShopperText6[];
extern const u8 gTVSmartShopperText7[];
extern const u8 gTVSmartShopperText8[];
extern const u8 gTVSmartShopperText9[];
extern const u8 gTVSmartShopperText10[];
extern const u8 gTVSmartShopperText11[];
extern const u8 gTVSmartShopperText12[];
extern const u8 gTVSmartShopperText13[];
extern const u8 gTVBravoTrainerText1[];
extern const u8 gTVBravoTrainerText2[];
extern const u8 gTVBravoTrainerText3[];
extern const u8 gTVBravoTrainerText4[];
extern const u8 gTVBravoTrainerText5[];
extern const u8 gTVBravoTrainerText6[];
extern const u8 gTVBravoTrainerText7[];
extern const u8 gTVBravoTrainerText8[];
extern const u8 gTVBravoTrainerText9[];
extern const u8 gTVBravoTrainerBattleTowerText1[];
extern const u8 gTVBravoTrainerBattleTowerText2[];
extern const u8 gTVBravoTrainerBattleTowerText3[];
extern const u8 gTVBravoTrainerBattleTowerText4[];
extern const u8 gTVBravoTrainerBattleTowerText5[];
extern const u8 gTVBravoTrainerBattleTowerText6[];
extern const u8 gTVBravoTrainerBattleTowerText7[];
extern const u8 gTVBravoTrainerBattleTowerText8[];
extern const u8 gTVBravoTrainerBattleTowerText9[];
extern const u8 gTVBravoTrainerBattleTowerText10[];
extern const u8 gTVBravoTrainerBattleTowerText11[];
extern const u8 gTVBravoTrainerBattleTowerText12[];
extern const u8 gTVBravoTrainerBattleTowerText13[];
extern const u8 gTVBravoTrainerBattleTowerText14[];
extern const u8 gTVBravoTrainerBattleTowerText15[];
extern const u8 gTVNameRaterText1[];
extern const u8 gTVNameRaterText2[];
extern const u8 gTVNameRaterText3[];
extern const u8 gTVNameRaterText4[];
extern const u8 gTVNameRaterText5[];
extern const u8 gTVNameRaterText6[];
extern const u8 gTVNameRaterText7[];
extern const u8 gTVNameRaterText8[];
extern const u8 gTVNameRaterText9[];
extern const u8 gTVNameRaterText10[];
extern const u8 gTVNameRaterText11[];
extern const u8 gTVNameRaterText12[];
extern const u8 gTVNameRaterText13[];
extern const u8 gTVNameRaterText14[];
extern const u8 gTVNameRaterText15[];
extern const u8 gTVNameRaterText16[];
extern const u8 gTVNameRaterText17[];
extern const u8 gTVNameRaterText18[];
extern const u8 gTVNameRaterText19[];
extern const u8 gTVPokemonTodayFailedCaptureText1[];
extern const u8 gTVPokemonTodayFailedCaptureText2[];
extern const u8 gTVPokemonTodayFailedCaptureText3[];
extern const u8 gTVPokemonTodayFailedCaptureText4[];
extern const u8 gTVPokemonTodayFailedCaptureText5[];
extern const u8 gTVPokemonTodayFailedCaptureText6[];
extern const u8 gTVPokemonTodayFailedCaptureText7[];
extern const u8 gTVFishingGuruAdviceText1[];
extern const u8 gTVFishingGuruAdviceText2[];
extern const u8 gTVWorldOfMastersText1[];
extern const u8 gTVWorldOfMastersText2[];
extern const u8 gTVWorldOfMastersText3[];
extern const u8 gTVGabbyAndTyText1[];
extern const u8 gTVGabbyAndTyText2[];
extern const u8 gTVGabbyAndTyText3[];
extern const u8 gTVGabbyAndTyText4[];
extern const u8 gTVGabbyAndTyText5[];
extern const u8 gTVGabbyAndTyText6[];
extern const u8 gTVGabbyAndTyText7[];
extern const u8 gTVGabbyAndTyText8[];
extern const u8 gTVGabbyAndTyText9[];

const u8 *const gTVNewsTextGroup1[] =
{
    ((void *)0),
    gTVNewsText_EnergyGuru1,
    gTVNewsText_GameCorner1,
    gTVNewsText_LilycoveDepartment1,
};

const u8 *const gTVNewsTextGroup2[] =
{
    ((void *)0),
    gTVNewsText_EnergyGuru2,
    gTVNewsText_GameCorner2,
    gTVNewsText_LilycoveDepartment2,
};

const u8 *const gTVNewsTextGroup3[] =
{
    ((void *)0),
    gTVNewsText_EnergyGuru3,
    gTVNewsText_GameCorner3,
    gTVNewsText_LilycoveDepartment3,
};

u8 *const gUnknown_083D1464[] =
{
    gStringVar1,
    gStringVar2,
    gStringVar3,
};

const u8 *const gTVFanClubTextGroup[] =
{
    gTVFanClubText1,
    gTVFanClubText2,
    gTVFanClubText3,
    gTVFanClubText4,
    gTVFanClubText5,
    gTVFanClubText6,
    gTVFanClubText7,
    gTVFanClubText8,
};

const u8 *const gTVRecentHappeningsTextGroup[] =
{
    gTVRecentHappeningsText1,
    gTVRecentHappeningsText2,
    gTVRecentHappeningsText3,
    gTVRecentHappeningsText4,
    gTVRecentHappeningsText5,
    gTVRecentHappeningsText6,
};

const u8 *const gTVFanClubOpinionsTextGroup[] =
{
    gTVFanClubOpinionsText1,
    gTVFanClubOpinionsText2,
    gTVFanClubOpinionsText3,
    gTVFanClubOpinionsText4,
    gTVFanClubOpinionsText5,
};

const u8 *const gTVPokemonOutbreakTextGroup[] =
{
    gTVPokemonOutbreakText,
};

const u8 *const gTVPokemonTodayTextGroup[] =
{
    gTVPokemonTodayText1,
    gTVPokemonTodayText2,
    gTVPokemonTodayText3,
    gTVPokemonTodayText4,
    gTVPokemonTodayText5,
    gTVPokemonTodayText6,
    gTVPokemonTodayText7,
    gTVPokemonTodayText8,
    gTVPokemonTodayText9,
    gTVPokemonTodayText10,
    gTVPokemonTodayText11,
    gTVPokemonTodayText12,
};

const u8 *const gTVSmartShopperTextGroup[] =
{
    gTVSmartShopperText1,
    gTVSmartShopperText2,
    gTVSmartShopperText3,
    gTVSmartShopperText4,
    gTVSmartShopperText5,
    gTVSmartShopperText6,
    gTVSmartShopperText7,
    gTVSmartShopperText8,
    gTVSmartShopperText9,
    gTVSmartShopperText10,
    gTVSmartShopperText11,
    gTVSmartShopperText12,
    gTVSmartShopperText13,
};

const u8 *const gTVBravoTrainerTextGroup[] =
{
    gTVBravoTrainerText1,
    gTVBravoTrainerText2,
    gTVBravoTrainerText3,
    gTVBravoTrainerText4,
    gTVBravoTrainerText5,
    gTVBravoTrainerText6,
    gTVBravoTrainerText7,
    gTVBravoTrainerText8,
    gTVBravoTrainerText9,
};

const u8 *const gTVBravoTrainerBattleTowerTextGroup[] =
{
    gTVBravoTrainerBattleTowerText1,
    gTVBravoTrainerBattleTowerText2,
    gTVBravoTrainerBattleTowerText3,
    gTVBravoTrainerBattleTowerText4,
    gTVBravoTrainerBattleTowerText5,
    gTVBravoTrainerBattleTowerText6,
    gTVBravoTrainerBattleTowerText7,
    gTVBravoTrainerBattleTowerText8,
    gTVBravoTrainerBattleTowerText9,
    gTVBravoTrainerBattleTowerText10,
    gTVBravoTrainerBattleTowerText11,
    gTVBravoTrainerBattleTowerText12,
    gTVBravoTrainerBattleTowerText13,
    gTVBravoTrainerBattleTowerText14,
    gTVBravoTrainerBattleTowerText15,
};

const u8 *const gTVNameRaterTextGroup[] =
{
    gTVNameRaterText1,
    gTVNameRaterText2,
    gTVNameRaterText3,
    gTVNameRaterText4,
    gTVNameRaterText5,
    gTVNameRaterText6,
    gTVNameRaterText7,
    gTVNameRaterText8,
    gTVNameRaterText9,
    gTVNameRaterText10,
    gTVNameRaterText11,
    gTVNameRaterText12,
    gTVNameRaterText13,
    gTVNameRaterText14,
    gTVNameRaterText15,
    gTVNameRaterText16,
    gTVNameRaterText17,
    gTVNameRaterText18,
    gTVNameRaterText19,
};

const u8 *const gTVPokemonTodayFailedCaptureTextGroup[] =
{
    gTVPokemonTodayFailedCaptureText1,
    gTVPokemonTodayFailedCaptureText2,
    gTVPokemonTodayFailedCaptureText3,
    gTVPokemonTodayFailedCaptureText4,
    gTVPokemonTodayFailedCaptureText5,
    gTVPokemonTodayFailedCaptureText6,
    gTVPokemonTodayFailedCaptureText7,
};

const u8 *const gTVFishingGuruAdviceTextGroup[] =
{
    gTVFishingGuruAdviceText1,
    gTVFishingGuruAdviceText2,
};

const u8 *const gTVWorldOfMastersTextGroup[] =
{
    gTVWorldOfMastersText1,
    gTVWorldOfMastersText2,
    gTVWorldOfMastersText3,
};

const u8 *const gTVGabbyAndTyTextGroup[] =
{
    gTVGabbyAndTyText1,
    gTVGabbyAndTyText2,
    gTVGabbyAndTyText3,
    gTVGabbyAndTyText4,
    gTVGabbyAndTyText5,
    gTVGabbyAndTyText6,
    gTVGabbyAndTyText7,
    gTVGabbyAndTyText8,
    gTVGabbyAndTyText9,
};

void ClearTVShowData(void)
{
    u8 showidx;
    u8 extradataidx;
    for (showidx=0; showidx<25; showidx++) {
        gSaveBlock1.tvShows[showidx].common.var00 = 0;
        gSaveBlock1.tvShows[showidx].common.var01 = 0;
        for (extradataidx=0; extradataidx<34; extradataidx++) {
            gSaveBlock1.tvShows[showidx].common.pad02[extradataidx] = 0;
        }
    }
    sub_80BEBF4();
}

bool8 sub_80BF1B4(u8);
void sub_80BF20C(void);
extern u8 gScriptContestCategory;
extern u8 gScriptContestRank;
extern u8 gUnknown_03004316[11];
extern u8 gBattleOutcome;

void sub_80BF334(void);
void sub_80BF3A4(void);
void sub_80BF3DC(void);
void sub_80BF46C(void);
void sub_80BF478(void);
void sub_80BF484(void);
void sub_80BF4BC(void);

void sub_80BE028(void);
void sub_80BE074(void);
void sub_80BE778(void);
void sub_80BEB20(void);

u8 sub_80BFB54(u8);

s8 sub_80BF74C(TVShow tvShow[]);

void sub_80BF55C(TVShow tvShow[], u8 showidx);
void sub_80BEA88(void);

void sub_80BE138(TVShow *show);
void sub_80BE160(TVShow *show);
extern u16 gLastUsedItem;

void sub_80BE5FC(void);
void sub_80BE65C(void);
void sub_80BE6A0(void);
void nullsub_21(void);
void sub_80BE188(void);
void sub_80BE320(void);

u8 special_0x44(void)
{
    u8 i;
    u8 j;


    asm("":::"r5");


    for (i = 5; i < 24; i++)
    {
        if (gSaveBlock1.tvShows[i].common.var00 == 0)
            break;
    }
    i = Random() % i;
    j = i;
    do
    {
        if (sub_80BFB54(gSaveBlock1.tvShows[i].common.var00) != 4)
        {
            if (gSaveBlock1.tvShows[i].common.var01 == 1)
                return i;
        }
        else
        {
            struct TVShowMassOutbreak *massOutbreak = &gSaveBlock1.tvShows[i].massOutbreak;

            if (massOutbreak->var16 == 0 && massOutbreak->var01 == 1)
                return i;
        }

        if (i == 0)
            i = 23;
        else
            i--;
    } while (i != j);
    return 0xFF;
}

u8 sub_80BDA30(void);

u8 sub_80BD8B8(void)
{
    u8 retval = special_0x44();

    if (retval == 0xff)
        return 0xff;
    if (gSaveBlock1.outbreakPokemonSpecies != 0 && gSaveBlock1.tvShows[retval].common.var00 == TVSHOW_MASS_OUTBREAK)
        return sub_80BDA30();
    return retval;
}

u8 CheckForBigMovieOrEmergencyNewsOnTV(void);
void SetTVMetatilesOnMap(int, int, u16);
bool8 sub_80BECA0(void);
bool8 IsTVShowInSearchOfTrainersAiring(void);

void UpdateTVScreensOnMap(int width, int height)
{
    FlagSet(0x831);
    switch (CheckForBigMovieOrEmergencyNewsOnTV())
    {
    case 1:
        SetTVMetatilesOnMap(width, height, 0x3);
        break;
    case 2:
        break;
    default:
        if (gSaveBlock1.location.mapGroup == 13
         && gSaveBlock1.location.mapNum == MAP_ID_LILYCOVE_CITY_COVE_LILY_MOTEL_1F)
        {
            SetTVMetatilesOnMap(width, height, 0x3);
        }
        else if (FlagGet(0x832) && (sub_80BD8B8() != 0xff || sub_80BECA0() != 0xff || IsTVShowInSearchOfTrainersAiring()))
        {
            FlagClear(0x831);
            SetTVMetatilesOnMap(width, height, 0x3);
        }
        break;
    }
}

void SetTVMetatilesOnMap(int width, int height, u16 tileId)
{
    int x;
    int y;

    for (y=0; y<height; y++)
    {
        for (x=0; x<width; x++)
        {
            if (MapGridGetMetatileBehaviorAt(x, y) == 0x86)
                MapGridSetMetatileIdAt(x, y, tileId | 0xc00);
        }
    }
}

void TurnOffTVScreen(void)
{
    SetTVMetatilesOnMap(gUnknown_03004870.width, gUnknown_03004870.height, 0x2);
    DrawWholeMapView();
}

u8 sub_80BDA0C(void)
{
    return gSaveBlock1.tvShows[gSpecialVar_0x8004].common.var00;
}

u8 sub_80BDA30(void)
{
    u8 showIdx;
    for (showIdx=0; showIdx<24; showIdx++)
    {
        if (gSaveBlock1.tvShows[showIdx].common.var00 != 0 && gSaveBlock1.tvShows[showIdx].common.var00 != TVSHOW_MASS_OUTBREAK && gSaveBlock1.tvShows[showIdx].common.var01 == 1)
            return showIdx;
    }
    return 0xff;
}

u8 special_0x4a(void)
{
    TVShow *tvShow;
    tvShow = &gSaveBlock1.tvShows[gSpecialVar_0x8004];
    if (tvShow->common.var00 == TVSHOW_MASS_OUTBREAK && gSaveBlock1.outbreakPokemonSpecies)
        return sub_80BDA30();
    return gSpecialVar_0x8004;
}

void ResetGabbyAndTy(void)
{
    gSaveBlock1.gabbyAndTyData.mon1 = 0;
    gSaveBlock1.gabbyAndTyData.mon2 = 0;
    gSaveBlock1.gabbyAndTyData.lastMove = 0;
    gSaveBlock1.gabbyAndTyData.quote = 0xffff;
    gSaveBlock1.gabbyAndTyData.valA_0 = 0;
    gSaveBlock1.gabbyAndTyData.valA_1 = 0;
    gSaveBlock1.gabbyAndTyData.valA_2 = 0;
    gSaveBlock1.gabbyAndTyData.valA_3 = 0;
    gSaveBlock1.gabbyAndTyData.valA_4 = 0;
    gSaveBlock1.gabbyAndTyData.valA_5 = 0;
    gSaveBlock1.gabbyAndTyData.valB_0 = 0;
    gSaveBlock1.gabbyAndTyData.valB_1 = 0;
    gSaveBlock1.gabbyAndTyData.valB_2 = 0;
    gSaveBlock1.gabbyAndTyData.valB_3 = 0;
    gSaveBlock1.gabbyAndTyData.valB_4 = 0;
    gSaveBlock1.gabbyAndTyData.valB_5 = 0;
    gSaveBlock1.gabbyAndTyData.mapnum = 0;
    gSaveBlock1.gabbyAndTyData.battleNum = 0;
}

void TakeTVShowInSearchOfTrainersOffTheAir(void);

void GabbyAndTyBeforeInterview(void)
{
    u8 i;

    gSaveBlock1.gabbyAndTyData.mon1 = gBattleResults.poke1Species;
    gSaveBlock1.gabbyAndTyData.mon2 = gBattleResults.opponentSpecies;
    gSaveBlock1.gabbyAndTyData.lastMove = gBattleResults.lastUsedMove;
    if (gSaveBlock1.gabbyAndTyData.battleNum != 0xff)
        gSaveBlock1.gabbyAndTyData.battleNum ++;
    gSaveBlock1.gabbyAndTyData.valA_0 = gBattleResults.unk5_0;

    if (gBattleResults.playerFaintCounter)
        gSaveBlock1.gabbyAndTyData.valA_1 = 1;
    else
        gSaveBlock1.gabbyAndTyData.valA_1 = 0;

    if (gBattleResults.unk3)
        gSaveBlock1.gabbyAndTyData.valA_2 = 1;
    else
        gSaveBlock1.gabbyAndTyData.valA_2 = 0;

    if (!gBattleResults.unk5_1)
    {
        for (i=0; i<11; i++)
        {
            if (gBattleResults.unk36[i] != 0)
            {
                gSaveBlock1.gabbyAndTyData.valA_3 = 1;
                break;
            }
        }
    }
    else
    {
        gSaveBlock1.gabbyAndTyData.valA_3 = 1;
    }

    TakeTVShowInSearchOfTrainersOffTheAir();
    if (gSaveBlock1.gabbyAndTyData.lastMove == 0)
        FlagSet(1);
}

void sub_80BDC14(void)
{
    gSaveBlock1.gabbyAndTyData.valB_0 = gSaveBlock1.gabbyAndTyData.valA_0;
    gSaveBlock1.gabbyAndTyData.valB_1 = gSaveBlock1.gabbyAndTyData.valA_1;
    gSaveBlock1.gabbyAndTyData.valB_2 = gSaveBlock1.gabbyAndTyData.valA_2;
    gSaveBlock1.gabbyAndTyData.valB_3 = gSaveBlock1.gabbyAndTyData.valA_3;
    gSaveBlock1.gabbyAndTyData.valA_4 = 1;
    gSaveBlock1.gabbyAndTyData.mapnum = gMapHeader.regionMapSectionId;
    IncrementGameStat(6);
}

void TakeTVShowInSearchOfTrainersOffTheAir(void)
{
    gSaveBlock1.gabbyAndTyData.valA_4 = 0;
}

u8 GabbyAndTyGetBattleNum(void)
{
    if (gSaveBlock1.gabbyAndTyData.battleNum >= 6)
        return (gSaveBlock1.gabbyAndTyData.battleNum % 3) + 6;
    else
        return gSaveBlock1.gabbyAndTyData.battleNum;
}

bool8 IsTVShowInSearchOfTrainersAiring(void)
{
    return gSaveBlock1.gabbyAndTyData.valA_4;
}

bool8 GabbyAndTyGetLastQuote(void)
{
    if (gSaveBlock1.gabbyAndTyData.quote == 0xffff)
        return 0;

    EasyChat_GetWordText(gStringVar1, gSaveBlock1.gabbyAndTyData.quote);
    gSaveBlock1.gabbyAndTyData.quote |= 0xffff;
    return 1;
}

u8 sub_80BDD18(void)
{
    if (!gSaveBlock1.gabbyAndTyData.valB_0)
        return 1;
    if (gSaveBlock1.gabbyAndTyData.valB_3)
        return 2;
    if (gSaveBlock1.gabbyAndTyData.valB_2)
        return 3;
    if (gSaveBlock1.gabbyAndTyData.valB_1)
        return 4;
    return 0;
}

void GabbyAndTySetScriptVarsToFieldObjectLocalIds(void)
{
    switch (GabbyAndTyGetBattleNum())
    {
    case 1:
        gSpecialVar_0x8004 = 0xE;
        gSpecialVar_0x8005 = 0xD;
        break;
    case 2:
        gSpecialVar_0x8004 = 0x5;
        gSpecialVar_0x8005 = 0x6;
        break;
    case 3:
        gSpecialVar_0x8004 = 0x12;
        gSpecialVar_0x8005 = 0x11;
        break;
    case 4:
        gSpecialVar_0x8004 = 0x15;
        gSpecialVar_0x8005 = 0x16;
        break;
    case 5:
        gSpecialVar_0x8004 = 0x8;
        gSpecialVar_0x8005 = 0x9;
        break;
    case 6:
        gSpecialVar_0x8004 = 0x13;
        gSpecialVar_0x8005 = 0x14;
        break;
    case 7:
        gSpecialVar_0x8004 = 0x17;
        gSpecialVar_0x8005 = 0x18;
        break;
    case 8:
        gSpecialVar_0x8004 = 0xA;
        gSpecialVar_0x8005 = 0xB;
        break;
    }
}

void sub_80BDE48(void)
{
    switch (gSpecialVar_0x8005)
    {
    case TVSHOW_FAN_CLUB_LETTER:
        sub_80BE5FC();
        break;
    case TVSHOW_RECENT_HAPPENINGS:
        sub_80BE65C();
        break;
    case TVSHOW_PKMN_FAN_CLUB_OPINIONS:
        sub_80BE6A0();
        break;
    case TVSHOW_UNKN_SHOWTYPE_04:
        nullsub_21();
        break;
    case TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE:
        sub_80BE188();
        break;
    case TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE:
        sub_80BE320();
        break;
    }
}

u8 sub_80BDEAC(u8 *a0)
{
    u8 lang = (LANGUAGE_ENGLISH);

    if (a0[0] == 0xFC && a0[1] == 0x15)
        lang = LANGUAGE_JAPANESE;
    return lang;
}

void sub_80BDEC8(void)
{
    u8 i;
    u16 total;
    u16 item;

    total = 0;
    sub_80BEB20();
    sub_80BE778();

    if (gBattleResults.caughtPoke == 0)
    {
        sub_80BE074();
    }
    else
    {
        sub_80BE028();
        if (sub_80BF77C(0xffff) == 0 && StringCompareWithoutExtCtrlCodes(gSpeciesNames[gBattleResults.caughtPoke], gBattleResults.caughtNick) != 0)
        {
            gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows);
            if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_POKEMON_TODAY_CAUGHT) != 1)
            {
                for (i = 0; i < 11; i++)
                    total += gBattleResults.unk36[i];
                if (total != 0 || gBattleResults.unk5_1 != 0)
                {
                    struct TVShowPokemonToday *pokemonToday;

                    total = 0;
                    pokemonToday = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].pokemonToday;
                    pokemonToday->var00 = TVSHOW_POKEMON_TODAY_CAUGHT;
                    pokemonToday->var01 = total;
                    if (gBattleResults.unk5_1 != 0)
                    {
                        total = 1;
                        item = ITEM_MASTER_BALL;
                    }
                    else
                    {
                        for (i = 0; i < 11; i++)
                            total += gBattleResults.unk36[i];
                        if (total > 0xff)
                            total = 0xff;
                        item = gLastUsedItem;
                    }
                    pokemonToday->var12 = total;
                    pokemonToday->ball = item;
                    StringCopy(pokemonToday->playerName, gSaveBlock2.playerName);
                    StringCopy(pokemonToday->nickname, gBattleResults.caughtNick);
                    pokemonToday->species = gBattleResults.caughtPoke;
                    sub_80BE138((TVShow *)pokemonToday);
                    pokemonToday->language = (LANGUAGE_ENGLISH);
                    pokemonToday->language2 = sub_80BDEAC(pokemonToday->nickname);
                    StripExtCtrlCodes(pokemonToday->nickname);
                }
            }
        }
    }
}

void sub_80BE028(void)
{
    struct TVShowWorldOfMasters *worldOfMasters = &gSaveBlock1.tvShows[24].worldOfMasters;

    if (worldOfMasters->var00 != TVSHOW_WORLD_OF_MASTERS)
    {
        sub_80BF55C(gSaveBlock1.tvShows, 24);
        worldOfMasters->var06 = GetGameStat(5);
        worldOfMasters->var00 = TVSHOW_WORLD_OF_MASTERS;
    }
    worldOfMasters->var02++;
    worldOfMasters->var04 = gBattleResults.caughtPoke;
    worldOfMasters->var08 = gBattleResults.poke1Species;
    worldOfMasters->var0a = gMapHeader.regionMapSectionId;
}

void sub_80BE074(void)
{
    u8 i;
    u16 total;
    u8 zero = 0;

    if (sub_80BF77C(0xffff) == 0)
    {
        for (i = 0, total = 0; i < (sizeof(gUnknown_03004316) / sizeof((gUnknown_03004316)[0])); i++)
            total += gUnknown_03004316[i];
        if (total > 0xff)
            total = 0xff;
        if (total > 2 && gBattleOutcome == 1)
        {
            gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows);
            if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_POKEMON_TODAY_FAILED) != 1)
            {
                struct TVShowPokemonTodayFailed *pokemonTodayFailed = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].pokemonTodayFailed;

                zero = 0;
                pokemonTodayFailed->var00 = TVSHOW_POKEMON_TODAY_FAILED;
                pokemonTodayFailed->var01 = zero;
                pokemonTodayFailed->species = gBattleResults.poke1Species;
                pokemonTodayFailed->species2 = gBattleResults.lastOpponentSpecies;
                pokemonTodayFailed->var10 = total;
                pokemonTodayFailed->var11 = gBattleOutcome;
                pokemonTodayFailed->var12 = gMapHeader.regionMapSectionId;
                StringCopy(pokemonTodayFailed->playerName, gSaveBlock2.playerName);
                sub_80BE138((TVShow *)pokemonTodayFailed);
                pokemonTodayFailed->language = (LANGUAGE_ENGLISH);
            }
        }
    }
}


void sub_80BE138(TVShow *show)
{
    u32 playerId = GetPlayerTrainerId();

    show->common.srcTrainerId2Lo = playerId & 0xFF;
    show->common.srcTrainerId2Hi = playerId >> 8;
    show->common.srcTrainerIdLo = playerId & 0xFF;
    show->common.srcTrainerIdHi = playerId >> 8;
    show->common.trainerIdLo = playerId & 0xFF;
    show->common.trainerIdHi = playerId >> 8;
}

void sub_80BE160(TVShow *show)
{
    u32 playerId = GetPlayerTrainerId();

    show->common.srcTrainerIdLo = playerId & 0xFF;
    show->common.srcTrainerIdHi = playerId >> 8;
    show->common.trainerIdLo = playerId & 0xFF;
    show->common.trainerIdHi = playerId >> 8;
}

void sub_80BE188(void)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainerSrc = &gSaveBlock1.tvShows[24].bravoTrainer;

    if (bravoTrainerSrc->var00 == TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE)
    {
        struct TVShowBravoTrainerPokemonProfiles *bravoTrainerNew = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainer;

        bravoTrainerNew->var00 = TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE;
        bravoTrainerNew->var01 = 1;
        bravoTrainerNew->species = bravoTrainerSrc->species;
        StringCopy(bravoTrainerNew->playerName, gSaveBlock2.playerName);
        StringCopy(bravoTrainerNew->pokemonNickname, bravoTrainerSrc->pokemonNickname);
        bravoTrainerNew->contestCategory = bravoTrainerSrc->contestCategory;
        bravoTrainerNew->contestRank = bravoTrainerSrc->contestRank;
        bravoTrainerNew->var14 = bravoTrainerSrc->var14;
        bravoTrainerNew->contestResult = bravoTrainerSrc->contestResult;
        bravoTrainerNew->contestCategory = bravoTrainerSrc->contestCategory;
        sub_80BE160((TVShow *)bravoTrainerNew);
        bravoTrainerNew->language = (LANGUAGE_ENGLISH);
        bravoTrainerNew->var1f = sub_80BDEAC(bravoTrainerNew->pokemonNickname);
        StripExtCtrlCodes(bravoTrainerNew->pokemonNickname);
    }
}

void sub_80BE23C(u16 a0)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer = &gSaveBlock1.tvShows[24].bravoTrainer;

    sub_80BF484();
    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows);
    if (gUnknown_03005D38.var0 != -1)
    {
        sub_80BF55C(gSaveBlock1.tvShows, 24);
        bravoTrainer->var14 = a0;
        bravoTrainer->var00 = TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE;
    }
}

void sub_80BE284(u8 a0)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer = &gSaveBlock1.tvShows[24].bravoTrainer;

    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows);
    if (gUnknown_03005D38.var0 != -1)
    {
        bravoTrainer->contestResult = a0;
        bravoTrainer->contestCategory = gScriptContestCategory;
        bravoTrainer->contestRank = gScriptContestRank;
        bravoTrainer->species = GetMonData(&gPlayerParty[gUnknown_02038694], 11, ((void *)0));
        GetMonData(&gPlayerParty[gUnknown_02038694], 2, bravoTrainer->pokemonNickname);
    }
}

void sub_80BE320(void)
{
    struct TVShowBravoTrainerBattleTowerSpotlight *bravoTrainerTower = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainerTower;

    bravoTrainerTower->var00 = TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE;
    bravoTrainerTower->var01 = 1;
    StringCopy(bravoTrainerTower->trainerName, gSaveBlock2.playerName);
    StringCopy(bravoTrainerTower->pokemonName, gSaveBlock2.battleTower.defeatedByTrainerName);
    bravoTrainerTower->species = gSaveBlock2.battleTower.firstMonSpecies;
    bravoTrainerTower->defeatedSpecies = gSaveBlock2.battleTower.defeatedBySpecies;
    bravoTrainerTower->var16 = GetCurrentBattleTowerWinStreak(gSaveBlock2.battleTower.lastStreakLevelType);
    bravoTrainerTower->var1c = gSaveBlock2.battleTower.battleOutcome;
    if (gSaveBlock2.battleTower.lastStreakLevelType == 0)
        bravoTrainerTower->btLevel = 50;
    else
        bravoTrainerTower->btLevel = 100;
    bravoTrainerTower->var1b = gSpecialVar_0x8004;
    sub_80BE160((TVShow *)bravoTrainerTower);
    bravoTrainerTower->language = (LANGUAGE_ENGLISH);
}

void sub_80BE3BC(void)
{
    u8 rval;
    u8 i;

    rval = sub_80BF77C(0x5555);
    if (rval == 0)
    {
        gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows);
        if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_SMART_SHOPPER) != 1)
        {
            sub_80BF20C();
            if (gUnknown_02038724[0].item_amount >= 20)
            {
                struct TVShowSmartShopper *smartShopper = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].smartshopperShow;

                smartShopper->var00 = TVSHOW_SMART_SHOPPER;
                smartShopper->var01 = rval;
                smartShopper->shopLocation = gMapHeader.regionMapSectionId;
                for (i=0; i<3; i++)
                {
                    smartShopper->itemIds[i] = gUnknown_02038724[i].item_id;
                    smartShopper->itemAmounts[i] = gUnknown_02038724[i].item_amount;
                }
                smartShopper->priceReduced = GetPriceReduction(1);
                StringCopy(smartShopper->playerName, gSaveBlock2.playerName);
                sub_80BE138((TVShow *)smartShopper);
                smartShopper->language = (LANGUAGE_ENGLISH);
            }
        }
    }
}

void sub_80BE478(void)
{
    sub_80BF478();
    if (gScriptResult == 1)
        return;

    GetMonData(&gPlayerParty[gSpecialVar_0x8004], 2, gStringVar1);
    if (StringLength(gSaveBlock2.playerName) > 1 && StringLength(gStringVar1) > 1)
    {
        struct TVShowNameRaterShow *nameRaterShow = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].nameRaterShow;

        nameRaterShow->var00 = TVSHOW_NAME_RATER_SHOW;
        nameRaterShow->var01 = 1;
        nameRaterShow->species = GetMonData(&gPlayerParty[gSpecialVar_0x8004], 11, ((void *)0));
        nameRaterShow->random = Random() % 3;
        nameRaterShow->random2 = Random() % 2;
        nameRaterShow->var1C = sub_80BF674(nameRaterShow->species);
        StringCopy(nameRaterShow->trainerName, gSaveBlock2.playerName);
        GetMonData(&gPlayerParty[gSpecialVar_0x8004], 2, nameRaterShow->pokemonName);
        sub_80BE160((TVShow *)nameRaterShow);
        nameRaterShow->language = (LANGUAGE_ENGLISH);
        nameRaterShow->pokemonNameLanguage = sub_80BDEAC(nameRaterShow->pokemonName);
        StripExtCtrlCodes(nameRaterShow->pokemonName);
    }
}

void StartMassOutbreak(void)
{
    struct TVShowMassOutbreak *massOutbreak = &gSaveBlock1.tvShows[gSpecialVar_0x8004].massOutbreak;

    gSaveBlock1.outbreakPokemonSpecies = massOutbreak->species;
    gSaveBlock1.outbreakLocationMapNum = massOutbreak->locationMapNum;
    gSaveBlock1.outbreakLocationMapGroup = massOutbreak->locationMapGroup;
    gSaveBlock1.outbreakPokemonLevel = massOutbreak->level;
    gSaveBlock1.outbreakUnk1 = massOutbreak->var02;
    gSaveBlock1.outbreakUnk2 = massOutbreak->var0E;
    gSaveBlock1.outbreakPokemonMoves[0] = massOutbreak->moves[0];
    gSaveBlock1.outbreakPokemonMoves[1] = massOutbreak->moves[1];
    gSaveBlock1.outbreakPokemonMoves[2] = massOutbreak->moves[2];
    gSaveBlock1.outbreakPokemonMoves[3] = massOutbreak->moves[3];
    gSaveBlock1.outbreakUnk4 = massOutbreak->var03;
    gSaveBlock1.outbreakPokemonProbability = massOutbreak->probability;
    gSaveBlock1.outbreakUnk5 = 2;
}

void sub_80BE5FC(void)
{
    struct TVShowFanClubLetter *fanclubLetter = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubLetter;

    fanclubLetter->var00 = TVSHOW_FAN_CLUB_LETTER;
    fanclubLetter->var01 = 1;
    StringCopy(fanclubLetter->playerName, gSaveBlock2.playerName);
    fanclubLetter->species = GetMonData(&gPlayerParty[GetLeadMonIndex()], 11, ((void *)0));
    sub_80BE160((TVShow *)fanclubLetter);
    fanclubLetter->language = (LANGUAGE_ENGLISH);
}

void sub_80BE65C(void)
{
    struct TVShowRecentHappenings *recentHappenings = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].recentHappenings;

    recentHappenings->var00 = TVSHOW_RECENT_HAPPENINGS;
    recentHappenings->var01 = 1;
    StringCopy(recentHappenings->playerName, gSaveBlock2.playerName);
    recentHappenings->var02 = 0;
    sub_80BE160((TVShow *)recentHappenings);
    recentHappenings->language = (LANGUAGE_ENGLISH);
}

void sub_80BE6A0(void)
{
    u8 monIndex;
    struct TVShowFanclubOpinions *fanclubOpinions = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubOpinions;

    fanclubOpinions->var00 = TVSHOW_PKMN_FAN_CLUB_OPINIONS;
    fanclubOpinions->var01 = 1;
    monIndex = GetLeadMonIndex();
    fanclubOpinions->var04A = GetMonData(&gPlayerParty[monIndex], 32, ((void *)0)) / 16;
    fanclubOpinions->var04B = gSpecialVar_0x8007;
    StringCopy(fanclubOpinions->playerName, gSaveBlock2.playerName);
    GetMonData(&gPlayerParty[GetLeadMonIndex()], 2, fanclubOpinions->var10);
    fanclubOpinions->var02 = GetMonData(&gPlayerParty[GetLeadMonIndex()], 11, ((void *)0));
    sub_80BE160((TVShow *)fanclubOpinions);
    fanclubOpinions->language = (LANGUAGE_ENGLISH);
    fanclubOpinions->var0E = sub_80BDEAC(fanclubOpinions->var10);
    StripExtCtrlCodes(fanclubOpinions->var10);
}

void nullsub_21(void)
{
}

void sub_80BE778(void)
{
    if (FlagGet(0x804))
    {
        u8 i;

        for (i = 0; i < 24; i++)
        {
            if (gSaveBlock1.tvShows[i].massOutbreak.var00 == TVSHOW_MASS_OUTBREAK)
                return;
        }
        if (sub_80BF77C(0x147))
            return;

        gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows);
        if (gUnknown_03005D38.var0 != -1)
        {
            u16 rand = Random();
            u16 val = rand % 5;
            s32 val2 = gUnknown_03005D38.var0;
            struct TVShowMassOutbreak *massOutbreak = &gSaveBlock1.tvShows[val2].massOutbreak;

            massOutbreak->var00 = TVSHOW_MASS_OUTBREAK;
            massOutbreak->var01 = 1;
            massOutbreak->level = gPokeOutbreakSpeciesList[val].level;
            massOutbreak->var02 = 0;
            massOutbreak->var03 = 0;
            massOutbreak->species = gPokeOutbreakSpeciesList[val].species;
            massOutbreak->var0E = 0;
            massOutbreak->moves[0] = gPokeOutbreakSpeciesList[val].moves[0];
            massOutbreak->moves[1] = gPokeOutbreakSpeciesList[val].moves[1];
            massOutbreak->moves[2] = gPokeOutbreakSpeciesList[val].moves[2];
            massOutbreak->moves[3] = gPokeOutbreakSpeciesList[val].moves[3];
            massOutbreak->locationMapNum = gPokeOutbreakSpeciesList[val].location;
            massOutbreak->locationMapGroup = 0;
            massOutbreak->var12 = 0;
            massOutbreak->probability = 0x32;
            massOutbreak->var15 = 0;
            massOutbreak->var16 = 0x01;
            sub_80BE160((TVShow *)massOutbreak);
            massOutbreak->language = (LANGUAGE_ENGLISH);
        }
    }
}

void EndMassOutbreak(void)
{
    gSaveBlock1.outbreakPokemonSpecies = 0;
    gSaveBlock1.outbreakLocationMapNum = 0;
    gSaveBlock1.outbreakLocationMapGroup = 0;
    gSaveBlock1.outbreakPokemonLevel = 0;
    gSaveBlock1.outbreakUnk1 = 0;
    gSaveBlock1.outbreakUnk2 = 0;
    gSaveBlock1.outbreakPokemonMoves[0] = 0;
    gSaveBlock1.outbreakPokemonMoves[1] = 0;
    gSaveBlock1.outbreakPokemonMoves[2] = 0;
    gSaveBlock1.outbreakPokemonMoves[3] = 0;
    gSaveBlock1.outbreakUnk4 = 0;
    gSaveBlock1.outbreakPokemonProbability = 0;
    gSaveBlock1.outbreakUnk5 = 0;
}

void UpdateTVShowsPerDay(u16 arg0)
{
    sub_80BE8EC(arg0);
    UpdateMassOutbreakTimeLeft(arg0);
    sub_80BEE84(arg0);
    sub_80BEA5C(arg0);
}

void sub_80BE8EC(u16 arg0)
{
    u8 showidx;

    if (gSaveBlock1.outbreakPokemonSpecies == 0)
    {
        for (showidx=0; showidx<24; showidx++)
        {
            if (gSaveBlock1.tvShows[showidx].massOutbreak.var00 == TVSHOW_MASS_OUTBREAK
             && gSaveBlock1.tvShows[showidx].massOutbreak.var01 == 0x01)
            {
                struct TVShowMassOutbreak *massOutbreak = &gSaveBlock1.tvShows[showidx].massOutbreak;

                if (massOutbreak->var16 < arg0)
                    massOutbreak->var16 = 0;
                else
                    massOutbreak->var16 -= arg0;
                break;
            }
        }
    }
}

void UpdateMassOutbreakTimeLeft(u16 arg0)
{
    if (gSaveBlock1.outbreakUnk5 <= arg0)
        EndMassOutbreak();
    else
        gSaveBlock1.outbreakUnk5 -= arg0;
}

void sub_80BE97C(bool8 flag)
{
    u8 var0, var1;

    if (flag)
    {
        var0 = gUnknown_020387E2 >> 8;
        if (var0 > 4)
            sub_80BE9D4();
        gUnknown_020387E2 &= 0xFF;
        var1 = gUnknown_020387E2 & 0xFF;
        if (var1 != 0xFF)
            gUnknown_020387E2++;
    }
    else
    {
        var0 = gUnknown_020387E2 & 0xFF;
        if (var0 > 4)
            sub_80BE9D4();
        gUnknown_020387E2 &= 0xFF00;
        var1 = gUnknown_020387E2 >> 8;
        if (var1 != 0xFF)
            gUnknown_020387E2 += 0x100;
    }
}

void sub_80BE9D4(void)
{
    gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows);
    if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_FISHING_ADVICE) != 1)
    {
        struct TVShowPokemonAngler *pokemonAngler = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].pokemonAngler;
        register u8 zero asm("r1") = 0;

        asm(""::"r"(zero));
        pokemonAngler->var00 = TVSHOW_FISHING_ADVICE;
        pokemonAngler->var01 = zero;
        pokemonAngler->var02 = gUnknown_020387E2 & 0xFF;
        pokemonAngler->var03 = gUnknown_020387E2 >> 8;
        pokemonAngler->var04 = gUnknown_020387E0;
        StringCopy(pokemonAngler->playerName, gSaveBlock2.playerName);
        sub_80BE138((TVShow *)pokemonAngler);
        pokemonAngler->language = (LANGUAGE_ENGLISH);
    }
}

void sub_80BEA50(u16 var)
{
    gUnknown_020387E0 = var;
}

void sub_80BEA88(void);

void sub_80BEA5C(u16 arg0)
{
    struct TVShowWorldOfMasters *worldOfMasters = &gSaveBlock1.tvShows[24].worldOfMasters;

    if (worldOfMasters->var00 == TVSHOW_WORLD_OF_MASTERS)
    {
        if (worldOfMasters->var02 < 20)
            sub_80BF55C(gSaveBlock1.tvShows, 0x18);
        else
            sub_80BEA88();
    }
}
void sub_80BEA88(void)
{
    struct TVShowWorldOfMasters *worldOfMastersSrc = &gSaveBlock1.tvShows[24].worldOfMasters;

    if (sub_80BF77C(0xFFFF) == 0)
    {
        gUnknown_03005D38.var0 = sub_80BF74C(gSaveBlock1.tvShows);
        if (gUnknown_03005D38.var0 != -1 && sub_80BF1B4(TVSHOW_WORLD_OF_MASTERS) != 1)
        {
            struct TVShowWorldOfMasters *worldOfMastersDst = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].worldOfMasters;

            worldOfMastersDst->var00 = TVSHOW_WORLD_OF_MASTERS;
            worldOfMastersDst->var01 = 0;
            worldOfMastersDst->var02 = worldOfMastersSrc->var02;
            worldOfMastersDst->var06 = GetGameStat(5) - worldOfMastersSrc->var06;
            worldOfMastersDst->var04 = worldOfMastersSrc->var04;
            worldOfMastersDst->var08 = worldOfMastersSrc->var08;
            worldOfMastersDst->var0a = worldOfMastersSrc->var0a;
            StringCopy(worldOfMastersDst->playerName, gSaveBlock2.playerName);
            sub_80BE138((TVShow *)worldOfMastersDst);
            worldOfMastersDst->language = (LANGUAGE_ENGLISH);
        }
    }
}

void sub_80BEB20(void)
{
    u16 rval;

    if (FlagGet(0x804) != 0)
    {
        gUnknown_03005D38.var0 = sub_80BEBC8(gSaveBlock1.unknown_2ABC);
        if (gUnknown_03005D38.var0 != -1 && sub_80BF77C(0x28f) != 1)
        {
            rval = (Random() % 3) + 1;
            if (sub_80BEE48(rval) != 1)
            {
                gSaveBlock1.unknown_2ABC[gUnknown_03005D38.var0].val0 = rval;
                gSaveBlock1.unknown_2ABC[gUnknown_03005D38.var0].val2 = 4;
                gSaveBlock1.unknown_2ABC[gUnknown_03005D38.var0].val1 = 1;
            }
        }
    }
}

int sub_80BEBC8(struct UnknownSaveStruct2ABC *arg0)
{
    s8 i;

    for (i = 0; i < 16; i++)
    {
        if (arg0[i].val0 == 0)
            return i;
    }
    return -1;
}

void sub_80BEBF4(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
        sub_80BEC10(i);
}

void sub_80BEC10(u8 arg0)
{
    gSaveBlock1.unknown_2ABC[arg0].val0 = 0;
    gSaveBlock1.unknown_2ABC[arg0].val1 = 0;
    gSaveBlock1.unknown_2ABC[arg0].val2 = 0;
}

void sub_80BEC40(void)
{
    u8 i, j;

    for (i = 0; i < 15; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 == 0)
        {
            for (j = i + 1; j < 16; j++)
            {
                if (gSaveBlock1.unknown_2ABC[j].val0 != 0)
                {
                    gSaveBlock1.unknown_2ABC[i] = gSaveBlock1.unknown_2ABC[j];
                    sub_80BEC10(j);
                    break;
                }
            }
        }
    }
}

u8 sub_80BECA0(void)
{
    u8 i;
    for (i = 0; i < 16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 != 0
         && gSaveBlock1.unknown_2ABC[i].val1 == 1
         && gSaveBlock1.unknown_2ABC[i].val2 < 3)
            return i;
    }
    return 0xFF;
}

void sub_80BECE8(void)
{
    u8 arg0;
    arg0 = sub_80BECA0();
    if (arg0 == 0xff)
    {
        gScriptResult = 0;
        return;
    }
    if (gSaveBlock1.unknown_2ABC[arg0].val2 == 0)
    {
        gSaveBlock1.unknown_2ABC[arg0].val1 = 2;
        if (gLocalTime.hours < 20)
            ShowFieldMessage(gTVNewsTextGroup2[gSaveBlock1.unknown_2ABC[arg0].val0]);
        else
            ShowFieldMessage(gTVNewsTextGroup3[gSaveBlock1.unknown_2ABC[arg0].val0]);
    }
    else
    {
        u16 value = gSaveBlock1.unknown_2ABC[arg0].val2;

        ConvertIntToDecimalStringN(gStringVar1, value, 0, 1);
        gSaveBlock1.unknown_2ABC[arg0].val1 = 0;
        ShowFieldMessage(gTVNewsTextGroup1[gSaveBlock1.unknown_2ABC[arg0].val0]);
    }
    gScriptResult = 1;
}

bool8 GetPriceReduction(u8 arg0)
{
    u8 i;

    if (arg0 == 0)
        return 0;
    for (i=0; i<16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 == arg0)
        {
            if (gSaveBlock1.unknown_2ABC[i].val1 == 2 && IsPriceDiscounted(arg0) != 0)
                return 1;
            else
                return 0;
        }
    }
    return 0;
}

bool8 IsPriceDiscounted(u8 arg0)
{
    switch (arg0)
    {
    case 1:
        if (gSaveBlock1.location.mapGroup == 0
         && gSaveBlock1.location.mapNum == MAP_ID_SLATEPORT_CITY
         && gScriptLastTalked == 0x1a)
            return 1;
        else
            return 0;
        break;
    case 3:
        if (gSaveBlock1.location.mapGroup == 13
         && gSaveBlock1.location.mapNum == MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP)
            return 1;
        else
            return 0;
        break;
    default:
        return 1;
    }
}

bool8 sub_80BEE48(u8 arg0)
{
    u8 i;

    if (arg0 == 0)
        return 1;
    for (i=0; i<16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 == arg0)
            return 1;
    }
    return 0;
}

void sub_80BEE84(u16 var0)
{
    u8 i;

    for (i=0; i<16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0)
        {
            if (gSaveBlock1.unknown_2ABC[i].val2 < var0)
            {
                sub_80BEC10(i);
            }
            else
            {
                if (!gSaveBlock1.unknown_2ABC[i].val1 && FlagGet(0x804) == 1)
                    gSaveBlock1.unknown_2ABC[i].val1 = 1;
                gSaveBlock1.unknown_2ABC[i].val2 -= var0;
            }
        }
    }
    sub_80BEC40();
}

void sub_80BEF10(u8 strvaridx, u8 rank)
{
    switch (rank)
    {
    case NORMAL_RANK:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[NORMAL_RANK + 5]);
        break;
    case SUPER_RANK:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[SUPER_RANK + 5]);
        break;
    case HYPER_RANK:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[HYPER_RANK + 5]);
        break;
    case MASTER_RANK:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[MASTER_RANK + 5]);
        break;
    }
}

void CopyContestCategoryToStringVar(u8 strvaridx, u8 category)
{
    switch (category)
    {
    case CONTEST_COOL:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[CONTEST_COOL]);
        break;
    case CONTEST_BEAUTY:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[CONTEST_BEAUTY]);
        break;
    case CONTEST_CUTE:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[CONTEST_CUTE]);
        break;
    case CONTEST_SMART:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[CONTEST_SMART]);
        break;
    case CONTEST_TOUGH:
        StringCopy(gUnknown_083D1464[strvaridx], gUnknown_083CE048[CONTEST_TOUGH]);
        break;
    }
}

void SetContestCategoryStringVarForInterview(void)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer = &gSaveBlock1.tvShows[gSpecialVar_0x8004].bravoTrainer;

    CopyContestCategoryToStringVar(1, bravoTrainer->contestCategory);
}

void sub_80BF088(u8 arg0, s32 price)
{
    size_t log10val = sub_80BF0B8(price);

    ConvertIntToDecimalStringN(gUnknown_083D1464[arg0], price, 0, log10val);
}

size_t sub_80BF0B8(int value)
{
    if (value / 10 == 0)
        return 1;
    else if (value / 100 == 0)
        return 2;
    else if (value / 1000 == 0)
        return 3;
    else if (value / 10000 == 0)
        return 4;
    else if (value / 100000 == 0)
        return 5;
    else if (value / 1000000 == 0)
        return 6;
    else if (value / 10000000 == 0)
        return 7;
    else if (value / 100000000 == 0)
        return 8;
    else
        return 1;
}

void sub_80BF154(u8 arg0, struct TVShowSmartShopper *arg1)
{
    u8 i;
    s32 price;
    price = 0;

    for (i = 0; i < 3; i++)
    {
        if (arg1->itemIds[i])
            price += ItemId_GetPrice(arg1->itemIds[i]) * arg1->itemAmounts[i];
    }
    if (arg1->priceReduced == 1)
        sub_80BF088(arg0, price >> 1);
    else
        sub_80BF088(arg0, price);
}

bool8 sub_80BF1B4(u8 showIdx)
{
    u8 i;

    TVShow *tvShows = gSaveBlock1.tvShows;
    u32 trainerId = GetPlayerTrainerId();

    for (i = 5; i < 24; i++)
    {
        if (tvShows[i].common.var00 == showIdx)
        {
            if ((trainerId & 0xFF) == tvShows[i].common.trainerIdLo && ((trainerId >> 8) & 0xFF) == tvShows[i].common.trainerIdHi)
                return 1;
        }
    }
    return 0;
}

void sub_80BF20C(void)
{
    u8 i, j;
    u16 tmpId, tmpAmount;

    for (i = 0; i < 2; i++)
    {
        for (j = i + 1; j < 3; j++)
        {
            if (gUnknown_02038724[i].item_amount < gUnknown_02038724[j].item_amount)
            {
                tmpId = gUnknown_02038724[i].item_id;
                tmpAmount = gUnknown_02038724[i].item_amount;
                gUnknown_02038724[i].item_id = gUnknown_02038724[j].item_id;
                gUnknown_02038724[i].item_amount = gUnknown_02038724[j].item_amount;
                gUnknown_02038724[j].item_id = tmpId;
                gUnknown_02038724[j].item_amount = tmpAmount;
            }
        }
    }
}

void sub_80BF25C(u8 showType)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (gSaveBlock1.tvShows[i].common.var00 == showType)
        {
            if(gSaveBlock1.tvShows[i].common.var01 == 1)
            {
                gScriptResult = 1;
            }
            else
            {
                sub_80BF55C(gSaveBlock1.tvShows, i);
                sub_80BF588(gSaveBlock1.tvShows);
                sub_80BF6D8();
            }
            return;
        }
    }
    sub_80BF6D8();
}

void sub_80BF2C4(void)
{
    gScriptResult = 0;
    switch (gSpecialVar_0x8005)
    {
    case TVSHOW_FAN_CLUB_LETTER:
        sub_80BF334();
        break;
    case TVSHOW_RECENT_HAPPENINGS:
        sub_80BF3A4();
        break;
    case TVSHOW_PKMN_FAN_CLUB_OPINIONS:
        sub_80BF3DC();
        break;
    case TVSHOW_UNKN_SHOWTYPE_04:
        sub_80BF46C();
        break;
    case TVSHOW_NAME_RATER_SHOW:
        sub_80BF478();
        break;
    case TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE:
        sub_80BF484();
        break;
    case TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE:
        sub_80BF4BC();
        break;
    }
}

void sub_80BF334(void)
{
    struct TVShowFanClubLetter *fanclubLetter;

    sub_80BF25C(TVSHOW_FAN_CLUB_LETTER);
    if (gScriptResult == 0)
    {
        StringCopy(gStringVar1, gSpeciesNames[GetMonData(&gPlayerParty[GetLeadMonIndex()], 11, 0)]);
        fanclubLetter = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubLetter;
        sub_80EB6FC(fanclubLetter->pad04, 6);
    }
}

void sub_80BF3A4(void)
{
    struct TVShowRecentHappenings *recentHappenings;

    sub_80BF25C(TVSHOW_RECENT_HAPPENINGS);
    if (gScriptResult == 0)
    {
        recentHappenings = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].recentHappenings;
        sub_80EB6FC(recentHappenings->var04, 6);
    }
}

void sub_80BF3DC(void)
{
    struct TVShowFanclubOpinions *fanclubOpinions;

    sub_80BF25C(TVSHOW_PKMN_FAN_CLUB_OPINIONS);
    if (gScriptResult == 0)
    {
        StringCopy(gStringVar1, gSpeciesNames[GetMonData(&gPlayerParty[GetLeadMonIndex()], 11, 0)]);
        GetMonData(&gPlayerParty[GetLeadMonIndex()], 2, gStringVar2);
        StringGetEnd10(gStringVar2);
        fanclubOpinions = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].fanclubOpinions;
        sub_80EB6FC(fanclubOpinions->var1C, 2);
    }
}

void sub_80BF46C(void)
{
    gScriptResult = 1;
}

void sub_80BF478(void)
{
    sub_80BF25C(TVSHOW_NAME_RATER_SHOW);
}

void sub_80BF484(void)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer;

    sub_80BF25C(TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE);
    if (gScriptResult == 0)
    {
        bravoTrainer = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainer;
        sub_80EB6FC(bravoTrainer->var04, 2);
    }
}

void sub_80BF4BC(void)
{
    struct TVShowBravoTrainerBattleTowerSpotlight *bravoTrainerTower;

    sub_80BF25C(TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE);
    if (gScriptResult == 0)
    {
        bravoTrainerTower = &gSaveBlock1.tvShows[gUnknown_03005D38.var0].bravoTrainerTower;
        sub_80EB6FC(bravoTrainerTower->var18, 1);
    }
}

u8 sub_80BF4F4(u8 arg0)
{
    u32 species;

    GetMonData(&gPlayerParty[arg0], 2, &gStringVar1);
    species = GetMonData(&gPlayerParty[arg0], 11, ((void *)0));
    if (StringCompareWithoutExtCtrlCodes(gSpeciesNames[species], gStringVar1) == 0)
        return 0;

    return 1;
}

u8 sub_80BF544(void)
{
    return sub_80BF4F4(GetLeadMonIndex());
}

void sub_80BF55C(TVShow tvShow[], u8 showidx)
{
    u8 idx;

    tvShow[showidx].common.var00 = 0;
    tvShow[showidx].common.var01 = 0;
    for (idx = 0; idx < 34; idx++)
        tvShow[showidx].common.pad02[idx] = 0;
}

void sub_80BF588(TVShow tvShow[])
{
    u8 showidx;
    u8 showidx2;

    for (showidx = 0; showidx < 4; showidx++)
    {
        if (tvShow[showidx].common.var00 == 0)
        {
            for (showidx2 = showidx + 1; showidx2 < 5; showidx2++)
            {
                if (tvShow[showidx2].common.var00 != 0)
                {
                    tvShow[showidx] = tvShow[showidx2];
                    sub_80BF55C(tvShow, showidx2);
                    break;
                }
            }
        }
    }
    for (showidx = 5; showidx < 24; showidx++)
    {
        if (tvShow[showidx].common.var00 == 0)
        {
            for (showidx2 = showidx + 1; showidx2 < 24; showidx2++)
            {
                if (tvShow[showidx2].common.var00 != 0)
                {
                    tvShow[showidx] = tvShow[showidx2];
                    sub_80BF55C(gSaveBlock1.tvShows, showidx2);
                    break;
                }
            }
        }
    }
}

u16 sub_80BF638(u8 arg0, u16 arg1)
{
    u16 retval = sub_80BF674(arg1);

    StringCopy(gUnknown_083D1464[arg0], gSpeciesNames[retval]);
    return retval;
}

u16 sub_80BF674(u16 species)
{
    u16 rspecies;
    u16 cspecies;

    rspecies = (Random() % (SPECIES_EGG - 1)) + 1;
    cspecies = rspecies;
    while (GetSetPokedexFlag(SpeciesToNationalPokedexNum(cspecies), 0) != 1 || cspecies == species)
    {
        if (cspecies == SPECIES_BULBASAUR)
            cspecies = SPECIES_EGG - 1;
        else
            cspecies --;
        if (cspecies == rspecies)
        {
            cspecies = species;
            return cspecies;
        }
    }
    return cspecies;
}

void sub_80BF6D8(void)
{
    gUnknown_03005D38.var0 = sub_80BF720(gSaveBlock1.tvShows);
    gSpecialVar_0x8006 = gUnknown_03005D38.var0;
    if (gUnknown_03005D38.var0 == -1)
        gScriptResult = 1;
    else
        gScriptResult = 0;
}

s8 sub_80BF720(TVShow tvShow[])
{
    u8 idx;

    for (idx = 0; idx < 5; idx++)
    {
        if (tvShow[idx].common.var00 == 0)
            return idx;
    }
    return -1;
}

s8 sub_80BF74C(TVShow tvShow[])
{
    s8 idx;

    for (idx = 5; idx < 24; idx++)
    {
        if (tvShow[idx].common.var00 == 0)
            return idx;
    }
    return -1;
}

bool8 sub_80BF77C(u16 value)
{
    if (Random() <= value)
        return 0;
    return 1;
}

void sub_80BF79C(TVShow *arg0)
{
    u8 i = Random() % 6;

    while (1)
    {
        if (i == 6)
            i = 0;
        if (arg0->recentHappenings.var04[i] != 0xFFFF)
            break;
        i++;
    }
    EasyChat_GetWordText(gStringVar3, arg0->recentHappenings.var04[i]);
}

u8 sub_80BF7E8(struct TVShowNameRaterShow *arg0)
{
    u16 flagsum = 0;
    u8 i = 0;

    if (arg0->pokemonName[0] != 0xFF)
    {
        while (i < 11 && arg0->pokemonName[i] != 0xFF)
        {
            flagsum += arg0->pokemonName[i];
            i++;
        }
    }
    return flagsum & 0x7;
}


void sub_80BF820(u8 arg0, u8 arg1, u8 arg2, u16 arg3, u16 arg4, struct TVShowNameRaterShow *tvShow)
{
    u8 flags[3];
    u16 nameLength;
    u8 i;

    for (i = 0; i < 3; i++)
        flags[i] = 0xFF;

    if (arg3 == 0)
    {
        nameLength = StringLength(tvShow->trainerName);
        if (arg2 == 0)
        {
            flags[0] = tvShow->trainerName[arg1];
        }
        else if (arg2 == 1)
        {
            flags[0] = tvShow->trainerName[nameLength - arg1];
        }
        else if (arg2 == 2) {
            flags[0] = tvShow->trainerName[arg1];
            flags[1] = tvShow->trainerName[arg1 + 1];
        }
        else
        {
            flags[0] = tvShow->trainerName[nameLength - (arg1 + 2)];
            flags[1] = tvShow->trainerName[nameLength - (arg1 + 1)];
        }
    }
    else if (arg3 == 1)
    {
        nameLength = StringLength(tvShow->pokemonName);
        if (arg2 == 0)
        {
            flags[0] = tvShow->pokemonName[arg1];
        }
        else if (arg2 == 1)
        {
            flags[0] = tvShow->pokemonName[nameLength - arg1];
        }
        else if (arg2 == 2)
        {
            flags[0] = tvShow->pokemonName[arg1];
            flags[1] = tvShow->pokemonName[arg1 + 1];
        }
        else
        {
            flags[0] = tvShow->pokemonName[nameLength - (arg1 + 2)];
            flags[1] = tvShow->pokemonName[nameLength - (arg1 + 1)];
        }
    }
    else
    {
        nameLength = StringLength(gSpeciesNames[arg4]);
        if (arg2 == 0)
        {
            flags[0] = gSpeciesNames[arg4][arg1];
        }
        else if (arg2 == 1)
        {
            flags[0] = gSpeciesNames[arg4][nameLength - arg1];
        }
        else if (arg2 == 2)
        {
            flags[0] = gSpeciesNames[arg4][arg1];
            flags[1] = gSpeciesNames[arg4][arg1 + 1];
        }
        else
        {
            flags[0] = gSpeciesNames[arg4][nameLength - (arg1 + 2)];
            flags[1] = gSpeciesNames[arg4][nameLength - (arg1 + 1)];
        }
    }
    StringCopy(gUnknown_083D1464[arg0], flags);
}

bool8 sub_80BF974(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (gSaveBlock1.tvShows[i].common.var00 == gSpecialVar_0x8004)
            return 1;
    }
    return 0;
}

bool8 sub_80BF9B4(void)
{
    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), 2, &gStringVar1);
    if (!StringCompareWithoutExtCtrlCodes(gStringVar3, gStringVar1))
        return 0;
    sub_80BE478();
    return 1;
}

void c2_080CC144(void);

void sub_80BF9F8(void)
{
    u16 spec;
    u16 gender;
    u32 pval;

    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), 2, &gStringVar3);
    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), 2, &gStringVar2);
    spec = GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), 11, 0);
    gender = GetMonGender(&(gPlayerParty[gSpecialVar_0x8004]));
    pval = GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), 0, 0);
    DoNamingScreen(3, gStringVar2, spec, gender, pval, c2_080CC144);
}

void c2_080CC144(void)
{
    SetMonData(&(gPlayerParty[gSpecialVar_0x8004]), 2, gStringVar2);
    c2_exit_to_overworld_1_continue_scripts_restart_music();
}

void sub_80BFAE0(void)
{
    GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), 2, &gStringVar1);
    StringGetEnd10(gStringVar1);
}

void sub_80BFB10(void)
{
    if (GetPlayerTrainerId() == GetMonData(&(gPlayerParty[gSpecialVar_0x8004]), 1, 0))
        gScriptResult = 0;
    else
        gScriptResult = 1;
}

u8 sub_80BFB54(u8 arg0)
{
    if (arg0 == 0)
        return 0;
    else if (arg0 > 0 && arg0 <= 20)
        return 2;
    else if (arg0 > 20 && arg0 <= 40)
        return 3;
    else if (arg0 > 40 && arg0 <= 60)
        return 4;
    else
        return 0;
}

u32 GetPlayerTrainerId(void)
{
    return (gSaveBlock2.playerTrainerId[3] << 24) | (gSaveBlock2.playerTrainerId[2] << 16) | (gSaveBlock2.playerTrainerId[1] << 8) | (gSaveBlock2.playerTrainerId[0]);
}

u8 CheckForBigMovieOrEmergencyNewsOnTV(void)
{
    if (gSaveBlock1.location.mapGroup != 1)
        return 0;
    if (gSaveBlock2.playerGender == MALE)
    {
        if (gSaveBlock1.location.mapNum != MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F)
            return 0;
    }
    else
    {
        if (gSaveBlock1.location.mapNum != MAP_ID_LITTLEROOT_TOWN_MAYS_HOUSE_1F)
            return 0;
    }
    if (FlagGet(0x85D) == 1)
        return 1;
    if (FlagGet(0x830) == 1)
        return 2;
    return 1;
}

void GetMomOrDadStringForTVMessage(void)
{
    if (gSaveBlock1.location.mapGroup == 1)
    {
        if (gSaveBlock2.playerGender == MALE)
        {
            if (gSaveBlock1.location.mapNum == MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F)
            {
                StringCopy(gStringVar1, gOtherText_Mom);
                VarSet(0x4003, 1);
            }
        }
        else
        {
            if (gSaveBlock1.location.mapNum == MAP_ID_LITTLEROOT_TOWN_MAYS_HOUSE_1F)
            {
                StringCopy(gStringVar1, gOtherText_Mom);
                VarSet(0x4003, 1);
            }
        }
    }
    if (VarGet(0x4003) == 1)
    {
        StringCopy(gStringVar1, gOtherText_Mom);
    }
    else if (VarGet(0x4003) == 2)
    {
        StringCopy(gStringVar1, gOtherText_Dad);
    }
    else if (VarGet(0x4003) > 2)
    {
        if (VarGet(0x4003) % 2 == 0)
            StringCopy(gStringVar1, gOtherText_Mom);
        else
            StringCopy(gStringVar1, gOtherText_Dad);
    }
    else
    {
        if (Random() % 2 != 0)
        {
            StringCopy(gStringVar1, gOtherText_Mom);
            VarSet(0x4003, 1);
        }
        else
        {
            StringCopy(gStringVar1, gOtherText_Dad);
            VarSet(0x4003, 2);
        }
    }
}

void sub_80BFD20(void)
{
    VarSet(0x40BC, 0);
    RemoveFieldObjectByLocalIdAndMap(5, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
}

typedef union ewramStruct_02007000
{
    TVShow tvshows[4][25];
    struct UnknownSaveStruct2ABC unknown_2abc[4][16];
} ewramStruct_02007000;

void sub_80BFE24(TVShow arg0[25], TVShow arg1[25], TVShow arg2[25], TVShow arg3[25]);

void sub_80C04A0(void);
void sub_80C01D4(void);
void sub_80C0408(void);

void sub_80BFD44(u8 *arg0, u32 arg1, u8 arg2)
{
    u8 i;
    ewramStruct_02007000 *ewramTVShows;

    for (i = 0; i < 4; i++)
        memcpy(&(*(ewramStruct_02007000 *)(gSharedMem + 0x7000)).tvshows[i], &arg0[i * arg1], 25 * sizeof(TVShow));
    ewramTVShows = &(*(ewramStruct_02007000 *)(gSharedMem + 0x7000));
    switch (arg2)
    {
    case 0:
        sub_80BFE24(gSaveBlock1.tvShows, ewramTVShows->tvshows[1], ewramTVShows->tvshows[2], ewramTVShows->tvshows[3]);
        break;
    case 1:
        sub_80BFE24(ewramTVShows->tvshows[0], gSaveBlock1.tvShows, ewramTVShows->tvshows[2], ewramTVShows->tvshows[3]);
        break;
    case 2:
        sub_80BFE24(ewramTVShows->tvshows[0], ewramTVShows->tvshows[1], gSaveBlock1.tvShows, ewramTVShows->tvshows[3]);
        break;
    case 3:
        sub_80BFE24(ewramTVShows->tvshows[0], ewramTVShows->tvshows[1], ewramTVShows->tvshows[2], gSaveBlock1.tvShows);
        break;
    }
    sub_80BF588(gSaveBlock1.tvShows);
    sub_80C04A0();
    sub_80BF588(gSaveBlock1.tvShows);
    sub_80C01D4();
    sub_80C0408();
}

s8 sub_80C019C(TVShow tvShows[]);
bool8 sub_80BFF68(TVShow * tv1[25], TVShow * tv2[25], u8 idx);
u8 sub_80C004C(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C00B4(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C0134(TVShow *tv1, TVShow *tv2, u8 idx);

void sub_80BFE24(TVShow arg0[25], TVShow arg1[25], TVShow arg2[25], TVShow arg3[25])
{
    u8 i, j;
    TVShow **argslist[4];

    argslist[0] = &arg0;
    argslist[1] = &arg1;
    argslist[2] = &arg2;
    argslist[3] = &arg3;
    gUnknown_03000720 = GetLinkPlayerCount();
    while (1)
    {
        for (i=0; i<gUnknown_03000720; i++)
        {
            if (i == 0)
                gUnknown_020387E4 = i;
            gUnknown_03000722 = sub_80C019C(argslist[i][0]);
            if (gUnknown_03000722 == -1)
            {
                gUnknown_020387E4++;
                if (gUnknown_020387E4 == gUnknown_03000720)
                    return;
            }
            else
            {
                for (j=0; j<gUnknown_03000720-1; j++)
                {
                    gUnknown_03005D38.var0 = sub_80BF74C(argslist[(i + j + 1) % gUnknown_03000720][0]);
                    if (gUnknown_03005D38.var0 != -1
                     && sub_80BFF68(&argslist[(i + j + 1) % gUnknown_03000720][0], &argslist[i][0], (i + j + 1) % gUnknown_03000720) == 1)
                        break;
                }
                if (j == gUnknown_03000720 - 1)
                    sub_80BF55C(argslist[i][0], gUnknown_03000722);
            }
        }
    }
}

bool8 sub_80BFF68(TVShow * arg1[25], TVShow * arg2[25], u8 idx)
{
    u8 value;
    u8 switchval;
    TVShow *tv1;
    TVShow *tv2;

    tv1 = *arg1;
    tv2 = *arg2;
    value = 0;
    switchval = sub_80BFB54(tv2[gUnknown_03000722].common.var00);
    switch (switchval)
    {
    case 2:
        value = sub_80C004C(&tv1[gUnknown_03005D38.var0], &tv2[gUnknown_03000722], idx);
        break;
    case 3:
        value = sub_80C00B4(&tv1[gUnknown_03005D38.var0], &tv2[gUnknown_03000722], idx);
        break;
    case 4:
        value = sub_80C0134(&tv1[gUnknown_03005D38.var0], &tv2[gUnknown_03000722], idx);
        break;
    }
    if (value == 1)
    {
        sub_80BF55C(tv2, gUnknown_03000722);
        return 1;
    }
    else
    {
        return 0;
    }
}

u8 sub_80C004C(TVShow *tv1, TVShow *tv2, u8 idx)
{
    u32 linkTrainerId = GetLinkPlayerTrainerId(idx);

    if ((linkTrainerId & 0xFF) == tv2->common.trainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.trainerIdHi)
        return 0;
    tv2->common.trainerIdLo = tv2->common.srcTrainerIdLo;
    tv2->common.trainerIdHi = tv2->common.srcTrainerIdHi;
    tv2->common.srcTrainerIdLo = linkTrainerId & 0xFF;
    tv2->common.srcTrainerIdHi = linkTrainerId >> 8;
    *tv1 = *tv2;
    tv1->common.var01 = 1;
    return 1;
}

u8 sub_80C00B4(TVShow *tv1, TVShow *tv2, u8 idx)
{
    u32 linkTrainerId = GetLinkPlayerTrainerId(idx);
    if ((linkTrainerId & 0xFF) == tv2->common.srcTrainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.srcTrainerIdHi)
        return 0;
    if ((linkTrainerId & 0xFF) == tv2->common.trainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.trainerIdHi)
        return 0;
    tv2->common.srcTrainerIdLo = tv2->common.srcTrainerId2Lo;
    tv2->common.srcTrainerIdHi = tv2->common.srcTrainerId2Hi;
    tv2->common.srcTrainerId2Lo = linkTrainerId & 0xFF;
    tv2->common.srcTrainerId2Hi = linkTrainerId >> 8;
    *tv1 = *tv2;
    tv1->common.var01 = 1;
    return 1;
}

u8 sub_80C0134(TVShow *tv1, TVShow *tv2, u8 idx)
{
    u32 linkTrainerId = GetLinkPlayerTrainerId(idx);
    if ((linkTrainerId & 0xFF) == tv2->common.trainerIdLo && ((linkTrainerId >> 8) & 0xFF) == tv2->common.trainerIdHi)
        return 0;
    tv2->common.trainerIdLo = tv2->common.srcTrainerIdLo;
    tv2->common.trainerIdHi = tv2->common.srcTrainerIdHi;
    tv2->common.srcTrainerIdLo = linkTrainerId & 0xFF;
    tv2->common.srcTrainerIdHi = linkTrainerId >> 8;
    *tv1 = *tv2;
    tv1->common.var01 = 1;
    tv1->common.var16[0] = 1;
    return 1;
}

s8 sub_80C019C(TVShow tvShows[])
{
    u8 i;
    for (i = 0; i < 24; i++)
    {
        if (tvShows[i].common.var01 == 0 && (u8)(tvShows[i].common.var00 - 1) < 60)
            return i;
    }
    return -1;
}
# 2409 "src/field/tv.c"
__attribute__((naked))
void sub_80C01D4(void) {
    asm(".syntax unified\n    push {r4-r6,lr}\n    movs r6, 0\n_080C01D8:\n    ldr r0, _080C01F8 @ =gSaveBlock1\n    lsls r2, r6, 3\n    adds r1, r2, r6\n    lsls r1, 2\n    adds r1, r0\n    ldr r0, _080C01FC @ =0x00002738\n    adds r1, r0\n    ldrb r0, [r1]\n    cmp r0, 0x29\n    bls _080C01EE\n    b _default\n_080C01EE:\n    lsls r0, 2\n    ldr r1, _080C0200 @ =_080C0204\n    adds r0, r1\n    ldr r0, [r0]\n    mov pc, r0\n    .align 2, 0\n_080C01F8: .4byte gSaveBlock1\n_080C01FC: .4byte 0x00002738\n_080C0200: .4byte _080C0204\n    .align 2, 0\n_080C0204:\n    .4byte _break\n    .4byte _fanclubLetter @ TVSHOW_FAN_CLUB_LETTER\n    .4byte _break    @ TVSHOW_RECENT_HAPPENINGS\n    .4byte _fanclubOpinions @ TVSHOW_PKMN_FAN_CLUB_OPINIONS\n    .4byte _showtype4 @ TVSHOW_UNKN_SHOWTYPE_04\n    .4byte _nameRater @ TVSHOW_NAME_RATER_SHOW\n    .4byte _bravoTrainerContest @ TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE\n    .4byte _bravoTrainerTower @ TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _pokemonTodayS @ TVSHOW_POKEMON_TODAY_CAUGHT\n    .4byte _break    @ TVSHOW_SMART_SHOPPER\n    .4byte _pokemonTodayF @ TVSHOW_POKEMON_TODAY_FAILED\n    .4byte _fishing @ TVSHOW_FISHING_ADVICE\n    .4byte _worldOfMasters @ TVSHOW_WORLD_OF_MASTERS\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _default\n    .4byte _break    @ TVSHOW_MASS_OUTBREAK\n_fanclubLetter:\n    adds r0, r2, r6\n    lsls r0, 2\n    ldr r1, _080C02B8 @ =gSaveBlock1 + 0x2738\n    adds r0, r1\n    ldrh r0, [r0, 0x2]\n    b _checkSpecies1 @ sub_80C03C8(r0, i)\n    .align 2, 0\n_080C02B8: .4byte gSaveBlock1 + 0x2738\n_fanclubOpinions:\n    adds r0, r2, r6\n    lsls r0, 2\n    ldr r1, _080C02C8 @ =gSaveBlock1 + 0x2738\n    adds r0, r1\n    ldrh r0, [r0, 0x2]\n    b _checkSpecies1 @ sub_80C03C8(r0, i)\n    .align 2, 0\n_080C02C8: .4byte gSaveBlock1 + 0x2738\n_showtype4:\n    adds r0, r2, r6\n    lsls r0, 2\n    ldr r1, _080C02D8 @ =gSaveBlock1 + 0x2738\n    adds r0, r1\n    ldrh r0, [r0, 0x6]\n    b _checkSpecies1 @ sub_80C03C8(r0, i)\n    .align 2, 0\n_080C02D8: .4byte gSaveBlock1 + 0x2738\n_nameRater:\n    adds r4, r2, r6\n    lsls r4, 2\n    ldr r0, _080C02F4 @ =gSaveBlock1 + 0x2738\n    adds r4, r0\n    ldrh r0, [r4, 0x2]\n    lsls r5, r6, 24\n    lsrs r5, 24\n    adds r1, r5, 0\n    bl sub_80C03C8\n    ldrh r0, [r4, 0x1C]\n    b _checkSpecies2 @ sub_80C03C8(r0, i)\n    .align 2, 0\n_080C02F4: .4byte gSaveBlock1 + 0x2738\n_bravoTrainerContest:\n    adds r0, r2, r6\n    lsls r0, 2\n    ldr r1, _080C0304 @ =gSaveBlock1 + 0x2738\n    adds r0, r1\n    ldrh r0, [r0, 0x2]\n    b _checkSpecies1 @ sub_80C03C8(r0, i)\n    .align 2, 0\n_080C0304: .4byte gSaveBlock1 + 0x2738\n_bravoTrainerTower:\n    adds r4, r2, r6\n    lsls r4, 2\n    ldr r0, _080C0320 @ =gSaveBlock1 + 0x2738\n    adds r4, r0\n    ldrh r0, [r4, 0xA]\n    lsls r5, r6, 24\n    lsrs r5, 24\n    adds r1, r5, 0\n    bl sub_80C03C8\n    ldrh r0, [r4, 0x14]\n    b _checkSpecies2 @ sub_80C03C8(r0, i)\n    .align 2, 0\n_080C0320: .4byte gSaveBlock1 + 0x2738\n_pokemonTodayS:\n    adds r0, r2, r6\n    lsls r0, 2\n    ldr r1, _080C0330 @ =gSaveBlock1 + 0x2738\n    adds r0, r1\n    ldrh r0, [r0, 0x10]\n    b _checkSpecies1 @ sub_80C03C8(r0, i)\n    .align 2, 0\n_080C0330: .4byte gSaveBlock1 + 0x2738\n_pokemonTodayF:\n    adds r4, r2, r6\n    lsls r4, 2\n    ldr r0, _080C034C @ =gSaveBlock1 + 0x2738\n    adds r4, r0\n    ldrh r0, [r4, 0xC]\n    lsls r5, r6, 24\n    lsrs r5, 24\n    adds r1, r5, 0\n    bl sub_80C03C8\n    ldrh r0, [r4, 0xE]\n    b _checkSpecies2 @ sub_80C03C8(r0, i)\n    .align 2, 0\n_080C034C: .4byte gSaveBlock1 + 0x2738\n_fishing:\n    adds r0, r2, r6\n    lsls r0, 2\n    ldr r1, _080C0364 @ =gSaveBlock1 + 0x2738\n    adds r0, r1\n    ldrh r0, [r0, 0x4]\n_checkSpecies1:\n    lsls r1, r6, 24\n    lsrs r1, 24\n    bl sub_80C03C8\n    b _break\n    .align 2, 0\n_080C0364: .4byte gSaveBlock1 + 0x2738\n_worldOfMasters:\n    adds r4, r2, r6\n    lsls r4, 2\n    ldr r0, _080C0388 @ =gSaveBlock1 + 0x2738\n    adds r4, r0\n    ldrh r0, [r4, 0x8]\n    lsls r5, r6, 24\n    lsrs r5, 24\n    adds r1, r5, 0\n    bl sub_80C03C8\n    ldrh r0, [r4, 0x4]\n_checkSpecies2:\n    adds r1, r5, 0\n    bl sub_80C03C8\n    b _break\n    .align 2, 0\n_080C0388: .4byte gSaveBlock1 + 0x2738\n_default:\n    lsls r0, r6, 24\n    lsrs r0, 24\n    bl sub_80C03A8\n_break:\n    adds r0, r6, 0x1\n    lsls r0, 16\n    lsrs r6, r0, 16\n    cmp r6, 0x17\n    bhi _080C03A0\n    b _080C01D8\n_080C03A0:\n    pop {r4-r6}\n    pop {r0}\n    bx r0\n.syntax divided\n");
# 2613 "src/field/tv.c"
}


void sub_80C03A8(u8 showidx)
{
    gSaveBlock1.tvShows[showidx].common.var01 = 0;
}

void sub_80C03C8(u16 species, u8 showidx)
{
    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), 0) == 0)
        gSaveBlock1.tvShows[showidx].common.var01 = 0;
}

void sub_80C0408(void)
{
    u16 i;

    if (FlagGet(0x804) == 1)
        return;
    for (i = 0; i < 24; i++)
    {
        if (gSaveBlock1.tvShows[i].common.var00 == TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE)
            gSaveBlock1.tvShows[i].common.var01 = 0;
        else if (gSaveBlock1.tvShows[i].common.var00 == TVSHOW_MASS_OUTBREAK)
            gSaveBlock1.tvShows[i].common.var01 = 0;
    }
}

void sub_80C045C(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (sub_80BFB54(gSaveBlock1.tvShows[i].common.var00) == 2)
            gSaveBlock1.tvShows[i].common.var01 = 0;
    }
}

void sub_80C04A0(void)
{
    s8 showIdx;
    s8 count;
    count = 0;

    for (showIdx = 5; showIdx < 24; showIdx++)
    {
        if (gSaveBlock1.tvShows[showIdx].common.var00 == 0)
            count++;
    }
    for (showIdx = 0; showIdx < 5 - count; showIdx++)
        sub_80BF55C(gSaveBlock1.tvShows, showIdx+5);
}

void sub_80C05C4(struct UnknownSaveStruct2ABC[16], struct UnknownSaveStruct2ABC[16], struct UnknownSaveStruct2ABC[16], struct UnknownSaveStruct2ABC[16]);
void sub_80C0750(void);
void sub_80C0788(void);
s8 sub_80C0730(struct UnknownSaveStruct2ABC[16], u8);
void sub_80C06BC(struct UnknownSaveStruct2ABC *[16], struct UnknownSaveStruct2ABC *[16]);

void sub_80C0514(void *a0, u32 a1, u8 a2)
{
    ewramStruct_02007000 *struct02007000;
    u8 i;

    for (i = 0; i < 4; i++)
        memcpy((*(ewramStruct_02007000 *)(gSharedMem + 0x7000)).unknown_2abc[i], a0 + i * a1, 64);
    struct02007000 = &(*(ewramStruct_02007000 *)(gSharedMem + 0x7000));
    switch (a2)
    {
    case 0:
        sub_80C05C4(gSaveBlock1.unknown_2ABC, struct02007000->unknown_2abc[1], struct02007000->unknown_2abc[2], struct02007000->unknown_2abc[3]);
        break;
    case 1:
        sub_80C05C4(struct02007000->unknown_2abc[0], gSaveBlock1.unknown_2ABC, struct02007000->unknown_2abc[2], struct02007000->unknown_2abc[3]);
        break;
    case 2:
        sub_80C05C4(struct02007000->unknown_2abc[0], struct02007000->unknown_2abc[1], gSaveBlock1.unknown_2ABC, struct02007000->unknown_2abc[3]);
        break;
    case 3:
        sub_80C05C4(struct02007000->unknown_2abc[0], struct02007000->unknown_2abc[1], struct02007000->unknown_2abc[2], gSaveBlock1.unknown_2ABC);
        break;
    }
    sub_80C0750();
    sub_80C0788();
}

void sub_80C05C4(struct UnknownSaveStruct2ABC a0[16], struct UnknownSaveStruct2ABC a1[16], struct UnknownSaveStruct2ABC a2[16], struct UnknownSaveStruct2ABC a3[16])
{
    u8 i;
    u8 j;
    u8 k;
    struct UnknownSaveStruct2ABC ** arglist[4];

    arglist[0] = &a0;
    arglist[1] = &a1;
    arglist[2] = &a2;
    arglist[3] = &a3;
    gUnknown_03000721 = GetLinkPlayerCount();
    for (i = 0; i < 16; i++)
    {
        for (j = 0; j < gUnknown_03000721; j++)
        {
            gUnknown_03000722 = sub_80C0730(*arglist[j], i);
            if (gUnknown_03000722 != -1)
            {
                for (k = 0; k < gUnknown_03000721-1; k++)
                {
                    gUnknown_03005D38.var0 = sub_80BEBC8(*arglist[(j + k + 1) % gUnknown_03000721]);
                    if (gUnknown_03005D38.var0 != -1)
                        sub_80C06BC(arglist[(j + k + 1) % gUnknown_03000721], arglist[j]);
                }
            }
        }
    }
}

void sub_80C06BC(struct UnknownSaveStruct2ABC *arg0[16], struct UnknownSaveStruct2ABC *arg1[16])
{
    struct UnknownSaveStruct2ABC *str0;
    struct UnknownSaveStruct2ABC *str1;

    str0 = arg0[0];
    str1 = arg1[0];
    str1 += gUnknown_03000722;
    sub_80C06E8(str0, str1, gUnknown_03005D38.var0);
}

bool8 sub_80C06E8(struct UnknownSaveStruct2ABC *arg0, struct UnknownSaveStruct2ABC *arg1, s8 arg2)
{
    u8 i;

    if (arg1->val0 == 0)
        return 0;
    for (i = 0; i < 16; i++)
    {
        if (arg0[i].val0 == arg1->val0)
            return 0;
    }
    arg0[arg2].val0 = arg1->val0;
    arg0[arg2].val1 = 1;
    arg0[arg2].val2 = arg1->val2;
    return 1;
}

s8 sub_80C0730(struct UnknownSaveStruct2ABC *arg0, u8 arg1)
{
    if (arg0[arg1].val0 == 0)
        return -1;
    return arg1;
}

void sub_80C0750(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (gSaveBlock1.unknown_2ABC[i].val0 > 3)
            sub_80BEC10(i);
    }
    sub_80BEC40();
}

void sub_80C0788(void)
{
    u8 i;

    if (FlagGet(0x804) != 1)
    {
        for (i = 0; i < 16; i++)
            gSaveBlock1.unknown_2ABC[i].val1 = 0;
    }
}

void DoTVShow(void)
{
    if (gSaveBlock1.tvShows[gSpecialVar_0x8004].common.var01 != 0)
    {
        switch (gSaveBlock1.tvShows[gSpecialVar_0x8004].common.var00)
        {
        case TVSHOW_FAN_CLUB_LETTER:
            DoTVShowPokemonFanClubLetter();
            break;
        case TVSHOW_RECENT_HAPPENINGS:
            DoTVShowRecentHappenings();
            break;
        case TVSHOW_PKMN_FAN_CLUB_OPINIONS:
            DoTVShowPokemonFanClubOpinions();
            break;
        case TVSHOW_UNKN_SHOWTYPE_04:
            nullsub_22();
            break;
        case TVSHOW_MASS_OUTBREAK:
            DoTVShowPokemonNewsMassOutbreak();
            break;
        case TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE:
            DoTVShowBravoTrainerPokemonProfile();
            break;
        case TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE:
            DoTVShowBravoTrainerBattleTowerProfile();
            break;
        case TVSHOW_POKEMON_TODAY_CAUGHT:
            DoTVShowPokemonTodaySuccessfulCapture();
            break;
        case TVSHOW_SMART_SHOPPER:
            DoTVShowTodaysSmartShopper();
            break;
        case TVSHOW_NAME_RATER_SHOW:
            DoTVShowTheNameRaterShow();
            break;
        case TVSHOW_POKEMON_TODAY_FAILED:
            DoTVShowPokemonTodayFailedCapture();
            break;
        case TVSHOW_FISHING_ADVICE:
            DoTVShowPokemonAngler();
            break;
        case TVSHOW_WORLD_OF_MASTERS:
            DoTVShowTheWorldOfMasters();
            break;
        }
    }
}

void TVShowConvertInternationalString(u8 *dest, u8 *src, u8 language)
{
    StringCopy(dest, src);
    if (language < LANGUAGE_ENGLISH)
        ConvertInternationalString(dest, LANGUAGE_JAPANESE);
}

void DoTVShowBravoTrainerPokemonProfile(void)
{
    struct TVShowBravoTrainerPokemonProfiles *bravoTrainer = &gSaveBlock1.tvShows[gSpecialVar_0x8004].bravoTrainer;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch(state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        CopyContestCategoryToStringVar(1, bravoTrainer->contestCategory);
        sub_80BEF10(2, bravoTrainer->contestRank);
        if (!StringCompareWithoutExtCtrlCodes(gSpeciesNames[bravoTrainer->species], bravoTrainer->pokemonNickname))
            gUnknown_020387E8 = 8;
        else
            gUnknown_020387E8 = 1;
        break;
    case 1:
        StringCopy(gStringVar1, gSpeciesNames[bravoTrainer->species]);
        TVShowConvertInternationalString(gStringVar2, bravoTrainer->pokemonNickname, bravoTrainer->var1f);
        CopyContestCategoryToStringVar(2, bravoTrainer->contestCategory);
        gUnknown_020387E8 = 2;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        if (bravoTrainer->contestResult == 0)
            gUnknown_020387E8 = 3;
        else
            gUnknown_020387E8 = 4;
        break;
    case 3:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        EasyChat_GetWordText(gStringVar2, bravoTrainer->var04[0]);
        sub_80BF088(2, bravoTrainer->contestResult + 1);
        gUnknown_020387E8 = 5;
        break;
    case 4:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        EasyChat_GetWordText(gStringVar2, bravoTrainer->var04[0]);
        sub_80BF088(2, bravoTrainer->contestResult + 1);
        gUnknown_020387E8 = 5;
        break;
    case 5:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        CopyContestCategoryToStringVar(1, bravoTrainer->contestCategory);
        EasyChat_GetWordText(gStringVar3, bravoTrainer->var04[1]);
        if (bravoTrainer->var14)
            gUnknown_020387E8 = 6;
        else
            gUnknown_020387E8 = 7;
        break;
    case 6:
        StringCopy(gStringVar1, gSpeciesNames[bravoTrainer->species]);
        StringCopy(gStringVar2, gMoveNames[bravoTrainer->var14]);
        EasyChat_GetWordText(gStringVar3, bravoTrainer->var04[1]);
        gUnknown_020387E8 = 7;
        break;
    case 7:
        TVShowConvertInternationalString(gStringVar1, bravoTrainer->playerName, bravoTrainer->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainer->species]);
        TVShowDone();
        break;
    case 8:
        StringCopy(gStringVar1, gSpeciesNames[bravoTrainer->species]);
        gUnknown_020387E8 = 2;
        break;
    }
    ShowFieldMessage(gTVBravoTrainerTextGroup[state]);
}

void DoTVShowBravoTrainerBattleTowerProfile(void)
{
    struct TVShowBravoTrainerBattleTowerSpotlight *bravoTrainerTower = &gSaveBlock1.tvShows[gSpecialVar_0x8004].bravoTrainerTower;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch(state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->trainerName, bravoTrainerTower->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainerTower->species]);
        if (bravoTrainerTower->var16 >= 7)
            gUnknown_020387E8 = 1;
        else
            gUnknown_020387E8 = 2;
        break;
    case 1:
        sub_80BF088(0, bravoTrainerTower->btLevel);
        sub_80BF088(1, bravoTrainerTower->var16);
        if (bravoTrainerTower->var1c == 1)
            gUnknown_020387E8 = 3;
        else
            gUnknown_020387E8 = 4;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        sub_80BF088(1, bravoTrainerTower->var16 + 1);
        if (bravoTrainerTower->var1b == 0)
            gUnknown_020387E8 = 5;
        else
            gUnknown_020387E8 = 6;
        break;
    case 3:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainerTower->defeatedSpecies]);
        if (bravoTrainerTower->var1b == 0)
            gUnknown_020387E8 = 5;
        else
            gUnknown_020387E8 = 6;
        break;
    case 4:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainerTower->defeatedSpecies]);
        if (bravoTrainerTower->var1b == 0)
            gUnknown_020387E8 = 5;
        else
            gUnknown_020387E8 = 6;
        break;
    case 5:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        gUnknown_020387E8 = 11;
        break;
    case 6:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        gUnknown_020387E8 = 11;
        break;
    case 7:
        gUnknown_020387E8 = 11;
        break;
    case 8:
    case 9:
    case 10:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->trainerName, bravoTrainerTower->language);
        gUnknown_020387E8 = 11;
        break;
    case 11:
        EasyChat_GetWordText(gStringVar1, bravoTrainerTower->var18[0]);
        if (bravoTrainerTower->var1b == 0)
            gUnknown_020387E8 = 12;
        else
            gUnknown_020387E8 = 13;
        break;
    case 12:
    case 13:
        EasyChat_GetWordText(gStringVar1, bravoTrainerTower->var18[0]);
        TVShowConvertInternationalString(gStringVar2, bravoTrainerTower->trainerName, bravoTrainerTower->language);
        TVShowConvertInternationalString(gStringVar3, bravoTrainerTower->pokemonName, bravoTrainerTower->language);
        gUnknown_020387E8 = 14;
        break;
    case 14:
        TVShowConvertInternationalString(gStringVar1, bravoTrainerTower->trainerName, bravoTrainerTower->language);
        StringCopy(gStringVar2, gSpeciesNames[bravoTrainerTower->species]);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVBravoTrainerBattleTowerTextGroup[state]);
}

void DoTVShowTodaysSmartShopper(void)
{
    struct TVShowSmartShopper *smartShopper = &gSaveBlock1.tvShows[gSpecialVar_0x8004].smartshopperShow;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch(state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, smartShopper->playerName, smartShopper->language);
        GetMapSectionName(gStringVar2, smartShopper->shopLocation, 0);
        if (smartShopper->itemAmounts[0] >= 0xff)
            gUnknown_020387E8 = 11;
        else
            gUnknown_020387E8 = 1;
        break;
    case 1:
        TVShowConvertInternationalString(gStringVar1, smartShopper->playerName, smartShopper->language);
        StringCopy(gStringVar2, ItemId_GetItem(smartShopper->itemIds[0])->name);
        sub_80BF088(2, smartShopper->itemAmounts[0]);
        gUnknown_020387E8 += (Random() % 4) + 1;
        break;
    case 2:
    case 4:
    case 5:
        if (smartShopper->itemIds[1] != 0)
            gUnknown_020387E8 = 6;
        else
            gUnknown_020387E8 = 10;
        break;
    case 3:
        sub_80BF088(2, smartShopper->itemAmounts[0] + 1);
        if (smartShopper->itemIds[1] != 0)
            gUnknown_020387E8 = 6;
        else
            gUnknown_020387E8 = 10;
        break;
    case 6:
        StringCopy(gStringVar2, ItemId_GetItem(smartShopper->itemIds[1])->name);
        sub_80BF088(2, smartShopper->itemAmounts[1]);
        if (smartShopper->itemIds[2] != 0)
            gUnknown_020387E8 = 7;
        else if (smartShopper->priceReduced == 1)
            gUnknown_020387E8 = 8;
        else
            gUnknown_020387E8 = 9;
        break;
    case 7:
        StringCopy(gStringVar2, ItemId_GetItem(smartShopper->itemIds[2])->name);
        sub_80BF088(2, smartShopper->itemAmounts[2]);
        if (smartShopper->priceReduced == 1)
            gUnknown_020387E8 = 8;
        else
            gUnknown_020387E8 = 9;
        break;
    case 8:
        if (smartShopper->itemAmounts[0] < 0xff)
            gUnknown_020387E8 = 9;
        else
            gUnknown_020387E8 = 12;
        break;
    case 9:
        sub_80BF154(1, smartShopper);
        TVShowDone();
        break;
    case 10:
        if (smartShopper->priceReduced == 1)
            gUnknown_020387E8 = 8;
        else
            gUnknown_020387E8 = 9;
        break;
    case 11:
        TVShowConvertInternationalString(gStringVar1, smartShopper->playerName, smartShopper->language);
        StringCopy(gStringVar2, ItemId_GetItem(smartShopper->itemIds[0])->name);
        if (smartShopper->priceReduced == 1)
            gUnknown_020387E8 = 8;
        else
            gUnknown_020387E8 = 12;
        break;
    case 12:
        TVShowConvertInternationalString(gStringVar1, smartShopper->playerName, smartShopper->language);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVSmartShopperTextGroup[state]);
}

void DoTVShowTheNameRaterShow(void)
{
    struct TVShowNameRaterShow *nameRaterShow = &gSaveBlock1.tvShows[gSpecialVar_0x8004].nameRaterShow;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        StringCopy(gStringVar2, gSpeciesNames[nameRaterShow->species]);
        TVShowConvertInternationalString(gStringVar3, nameRaterShow->pokemonName, nameRaterShow->pokemonNameLanguage);
        gUnknown_020387E8 = sub_80BF7E8(nameRaterShow) + 1;
        break;
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
        if (nameRaterShow->random == 0)
            gUnknown_020387E8 = 9;
        else if (nameRaterShow->random == 1)
            gUnknown_020387E8 = 10;
        else if (nameRaterShow->random == 2)
            gUnknown_020387E8 = 11;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        if (nameRaterShow->random == 0)
            gUnknown_020387E8 = 9;
        else if (nameRaterShow->random == 1)
            gUnknown_020387E8 = 10;
        else if (nameRaterShow->random == 2)
            gUnknown_020387E8 = 11;
        break;
    case 9:
    case 10:
    case 11:
        sub_80BF820(0, 1, 0, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(0, 0, 0, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, nameRaterShow->pokemonNameLanguage);
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->pokemonName, nameRaterShow->pokemonNameLanguage);
        gUnknown_020387E8 = 12;
        break;
    case 13:
        sub_80BF820(0, 0, 3, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(0, 0, 2, 0, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, nameRaterShow->language);
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        gUnknown_020387E8 = 14;
        break;
    case 14:
        sub_80BF820(0, 0, 3, 0, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->language);
        sub_80BF820(0, 0, 2, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar2, gStringVar1, nameRaterShow->pokemonNameLanguage);
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->trainerName, nameRaterShow->language);
        gUnknown_020387E8 = 18;
        break;
    case 15:
        sub_80BF820(1, 0, 2, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar1, gStringVar2, nameRaterShow->pokemonNameLanguage);
        StringCopy(gStringVar2, gSpeciesNames[nameRaterShow->species]);
        sub_80BF820(2, 0, 3, 2, nameRaterShow->species, nameRaterShow);
        gUnknown_020387E8 = 16;
        break;
    case 16:
        sub_80BF820(0, 0, 3, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar3, gStringVar1, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(0, 0, 2, 2, nameRaterShow->species, nameRaterShow);
        gUnknown_020387E8 = 17;
        break;
    case 17:
        sub_80BF820(1, 0, 2, 1, 0, nameRaterShow);
        TVShowConvertInternationalString(gStringVar1, gStringVar2, nameRaterShow->pokemonNameLanguage);
        sub_80BF820(2, 0, 3, 2, nameRaterShow->var1C, nameRaterShow);
        StringCopy(gStringVar2, gSpeciesNames[nameRaterShow->var1C]);
        gUnknown_020387E8 = 18;
        break;
    case 12:
        state = 18;
        gUnknown_020387E8 = 18;
    case 18:
        TVShowConvertInternationalString(gStringVar1, nameRaterShow->pokemonName, nameRaterShow->pokemonNameLanguage);
        TVShowConvertInternationalString(gStringVar2, nameRaterShow->trainerName, nameRaterShow->language);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVNameRaterTextGroup[state]);
}

void DoTVShowPokemonTodaySuccessfulCapture(void)
{
    struct TVShowPokemonToday *pokemonToday = &gSaveBlock1.tvShows[gSpecialVar_0x8004].pokemonToday;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar3, pokemonToday->nickname, pokemonToday->language2);
        if (pokemonToday->ball == ITEM_MASTER_BALL)
            gUnknown_020387E8 = 5;
        else
            gUnknown_020387E8 = 1;
        break;
    case 1:
        gUnknown_020387E8 = 2;
        break;
    case 2:
        StringCopy(gStringVar2, ItemId_GetItem(pokemonToday->ball)->name);
        sub_80BF088(2, pokemonToday->var12);
        if (pokemonToday->var12 < 4)
            gUnknown_020387E8 = 3;
        else
            gUnknown_020387E8 = 4;
        break;
    case 3:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar3, pokemonToday->nickname, pokemonToday->language2);
        gUnknown_020387E8 = 6;
        break;
    case 4:
        gUnknown_020387E8 = 6;
        break;
    case 5:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        gUnknown_020387E8 = 6;
        break;
    case 6:
        TVShowConvertInternationalString(gStringVar1, pokemonToday->playerName, pokemonToday->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar3, pokemonToday->nickname, pokemonToday->language2);
        gUnknown_020387E8 += (Random() % 4) + 1;
        break;
    case 7:
    case 8:
        StringCopy(gStringVar1, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar2, pokemonToday->nickname, pokemonToday->language2);
        sub_80BF638(2, pokemonToday->species);
        gUnknown_020387E8 = 11;
        break;
    case 9:
    case 10:
        StringCopy(gStringVar1, gSpeciesNames[pokemonToday->species]);
        TVShowConvertInternationalString(gStringVar2, pokemonToday->nickname, pokemonToday->language2);
        gUnknown_020387E8 = 11;
        break;
    case 11:
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVPokemonTodayTextGroup[state]);
}

void DoTVShowPokemonTodayFailedCapture(void)
{
    struct TVShowPokemonTodayFailed *pokemonTodayFailed = &gSaveBlock1.tvShows[gSpecialVar_0x8004].pokemonTodayFailed;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonTodayFailed->species]);
        gUnknown_020387E8 = 1;
        break;
    case 1:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        GetMapSectionName(gStringVar2, pokemonTodayFailed->var12, 0);
        StringCopy(gStringVar3, gSpeciesNames[pokemonTodayFailed->species2]);
        if (pokemonTodayFailed->var11 == 1)
            gUnknown_020387E8 = 3;
        else
            gUnknown_020387E8 = 2;
        break;
    case 2:
    case 3:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        sub_80BF088(1, pokemonTodayFailed->var10);
        if ((Random() % 3) == 0)
            gUnknown_020387E8 = 5;
        else
            gUnknown_020387E8 = 4;
        break;
    case 4:
    case 5:
        TVShowConvertInternationalString(gStringVar1, pokemonTodayFailed->playerName, pokemonTodayFailed->language);
        gUnknown_020387E8 = 6;
        break;
    case 6:
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVPokemonTodayFailedCaptureTextGroup[state]);
}

void DoTVShowPokemonFanClubLetter(void)
{
    struct TVShowFanClubLetter *fanclubLetter = &gSaveBlock1.tvShows[gSpecialVar_0x8004].fanclubLetter;
    u8 state;
    u16 rval;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, fanclubLetter->playerName, fanclubLetter->language);
        StringCopy(gStringVar2, gSpeciesNames[fanclubLetter->species]);
        gUnknown_020387E8 = 50;
        break;
    case 1:
        rval = (Random() % 4) + 1;
        if (rval == 1)
            gUnknown_020387E8 = 2;
        else
            gUnknown_020387E8 = rval + 2;
        break;
    case 2:
        gUnknown_020387E8 = 51;
        break;
    case 3:
        gUnknown_020387E8 += (Random() % 3) + 1;
        break;
    case 4:
    case 5:
    case 6:
        sub_80BF79C((TVShow *)fanclubLetter);
        gUnknown_020387E8 = 7;
        break;
    case 7:
        rval = (Random() % 0x1f) + 0x46;
        sub_80BF088(2, rval);
        TVShowDone();
        break;
    case 50:
        ConvertEasyChatWordsToString(gStringVar4, fanclubLetter->pad04, 2, 2);
        ShowFieldMessage(gStringVar4);
        gUnknown_020387E8 = 1;
        return;
    case 51:
        ConvertEasyChatWordsToString(gStringVar4, fanclubLetter->pad04, 2, 2);
        ShowFieldMessage(gStringVar4);
        gUnknown_020387E8 = 3;
        return;
    }
    ShowFieldMessage(gTVFanClubTextGroup[state]);
}

void DoTVShowRecentHappenings(void)
{
    struct TVShowRecentHappenings *recentHappenings = &gSaveBlock1.tvShows[gSpecialVar_0x8004].recentHappenings;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, recentHappenings->playerName, recentHappenings->language);
        sub_80BF79C((TVShow *)recentHappenings);
        gUnknown_020387E8 = 50;
        break;
    case 1:
        gUnknown_020387E8 += 1 + (Random() % 3);
        break;
    case 2:
    case 3:
    case 4:
        gUnknown_020387E8 = 5;
        break;
    case 5:
        TVShowDone();
        break;
    case 50:
        ConvertEasyChatWordsToString(gStringVar4, recentHappenings->var04, 2, 2);
        ShowFieldMessage(gStringVar4);
        gUnknown_020387E8 = 1;
        return;
    }
    ShowFieldMessage(gTVRecentHappeningsTextGroup[state]);
}

void DoTVShowPokemonFanClubOpinions(void)
{
    struct TVShowFanclubOpinions *fanclubOpinions = &gSaveBlock1.tvShows[gSpecialVar_0x8004].fanclubOpinions;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, fanclubOpinions->playerName, fanclubOpinions->language);
        StringCopy(gStringVar2, gSpeciesNames[fanclubOpinions->var02]);
        TVShowConvertInternationalString(gStringVar3, fanclubOpinions->var10, fanclubOpinions->var0E);
        gUnknown_020387E8 = fanclubOpinions->var04B + 1;
        break;
    case 1:
    case 2:
    case 3:
        TVShowConvertInternationalString(gStringVar1, fanclubOpinions->playerName, fanclubOpinions->language);
        StringCopy(gStringVar2, gSpeciesNames[fanclubOpinions->var02]);
        EasyChat_GetWordText(gStringVar3, fanclubOpinions->var1C[0]);
        gUnknown_020387E8 = 4;
        break;
    case 4:
        TVShowConvertInternationalString(gStringVar1, fanclubOpinions->playerName, fanclubOpinions->language);
        EasyChat_GetWordText(gStringVar3, fanclubOpinions->var1C[1]);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVFanClubOpinionsTextGroup[state]);
}

void nullsub_22(void)
{
}

void DoTVShowPokemonNewsMassOutbreak(void)
{
    struct TVShowMassOutbreak *massOutbreak = &gSaveBlock1.tvShows[gSpecialVar_0x8004].massOutbreak;

    GetMapSectionName(gStringVar1, massOutbreak->locationMapNum, 0);
    StringCopy(gStringVar2, gSpeciesNames[massOutbreak->species]);
    TVShowDone();
    StartMassOutbreak();
    ShowFieldMessage(gTVPokemonOutbreakTextGroup[gUnknown_020387E8]);
}

void DoTVShowInSearchOfTrainers(void)
{
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        GetMapSectionName(gStringVar1, gSaveBlock1.gabbyAndTyData.mapnum, 0);
        if (gSaveBlock1.gabbyAndTyData.battleNum > 1)
            gUnknown_020387E8 = 1;
        else
            gUnknown_020387E8 = 2;
        break;
    case 1:
        gUnknown_020387E8 = 2;
        break;
    case 2:
        if (gSaveBlock1.gabbyAndTyData.valA_0 == 0)
            gUnknown_020387E8 = 4;
        else if (gSaveBlock1.gabbyAndTyData.valA_3 != 0)
            gUnknown_020387E8 = 5;
        else if (gSaveBlock1.gabbyAndTyData.valA_2 != 0)
            gUnknown_020387E8 = 6;
        else if (gSaveBlock1.gabbyAndTyData.valA_1 != 0)
            gUnknown_020387E8 = 7;
        else
            gUnknown_020387E8 = 3;
        break;
    case 3:
        StringCopy(gStringVar1, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon1]);
        StringCopy(gStringVar2, gMoveNames[gSaveBlock1.gabbyAndTyData.lastMove]);
        StringCopy(gStringVar3, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon2]);
        gUnknown_020387E8 = 8;
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        gUnknown_020387E8 = 8;
        break;
    case 8:
        EasyChat_GetWordText(gStringVar1, gSaveBlock1.gabbyAndTyData.quote);
        StringCopy(gStringVar2, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon1]);
        StringCopy(gStringVar3, gSpeciesNames[gSaveBlock1.gabbyAndTyData.mon2]);
        gScriptResult = 1;
        gUnknown_020387E8 = 0;;
        TakeTVShowInSearchOfTrainersOffTheAir();
        break;
    }
    ShowFieldMessage(gTVGabbyAndTyTextGroup[state]);
}

void DoTVShowPokemonAngler(void)
{
    struct TVShowPokemonAngler *pokemonAngler = &gSaveBlock1.tvShows[gSpecialVar_0x8004].pokemonAngler;
    u8 state;

    gScriptResult = 0;
    if (pokemonAngler->var02 < pokemonAngler->var03)
        gUnknown_020387E8 = 0;
    else
        gUnknown_020387E8 = 1;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, pokemonAngler->playerName, pokemonAngler->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonAngler->var04]);
        sub_80BF088(2, pokemonAngler->var03);
        TVShowDone();
        break;
    case 1:
        TVShowConvertInternationalString(gStringVar1, pokemonAngler->playerName, pokemonAngler->language);
        StringCopy(gStringVar2, gSpeciesNames[pokemonAngler->var04]);
        sub_80BF088(2, pokemonAngler->var02);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVFishingGuruAdviceTextGroup[state]);
}

void DoTVShowTheWorldOfMasters(void)
{
    struct TVShowWorldOfMasters *worldOfMasters = &gSaveBlock1.tvShows[gSpecialVar_0x8004].worldOfMasters;
    u8 state;

    gScriptResult = 0;
    state = gUnknown_020387E8;
    switch (state)
    {
    case 0:
        TVShowConvertInternationalString(gStringVar1, worldOfMasters->playerName,
                                         worldOfMasters->language);
        sub_80BF088(1, worldOfMasters->var06);
        sub_80BF088(2, worldOfMasters->var02);
        gUnknown_020387E8 = 1;
        break;
    case 1:
        StringCopy(gStringVar1, gSpeciesNames[worldOfMasters->var08]);
        gUnknown_020387E8 = 2;
        break;
    case 2:
        TVShowConvertInternationalString(gStringVar1, worldOfMasters->playerName,
                                         worldOfMasters->language);
        GetMapSectionName(gStringVar2, worldOfMasters->var0a, 0);
        StringCopy(gStringVar3, gSpeciesNames[worldOfMasters->var04]);
        TVShowDone();
        break;
    }
    ShowFieldMessage(gTVWorldOfMastersTextGroup[state]);
}

void TVShowDone(void)
{
    gScriptResult = 1;
    gUnknown_020387E8 = 0;
    gSaveBlock1.tvShows[gSpecialVar_0x8004].common.var01 = 0;
}

void sub_80C2014(void)
{
    gUnknown_020387E8 = 0;
}
