# 1 "src/strings.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/strings.c"
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
# 2 "src/strings.c" 2
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
# 3 "src/strings.c" 2


const u8 gExpandedPlaceholder_Empty[] = _("");
const u8 gExpandedPlaceholder_Kun[] = _("군");
const u8 gExpandedPlaceholder_Chan[] = _("양");
const u8 gExpandedPlaceholder_Sapphire[] = _("사파이어");
const u8 gExpandedPlaceholder_Ruby[] = _("루비");
const u8 gExpandedPlaceholder_Aqua[] = _("아쿠아");
const u8 gExpandedPlaceholder_Magma[] = _("마그마");
const u8 gExpandedPlaceholder_Archie[] = _("아강");
const u8 gExpandedPlaceholder_Maxie[] = _("마적");
const u8 gExpandedPlaceholder_Kyogre[] = _("가이오가");
const u8 gExpandedPlaceholder_Groudon[] = _("그란돈");
const u8 gExpandedPlaceholder_Brendan[] = _("휘웅");
const u8 gExpandedPlaceholder_May[] = _("봄이");
const u8 gExpandedPlaceholder_Brother[] = _("형");
const u8 gExpandedPlaceholder_Sister[] = _("누나");
const u8 gExpandedPlaceholder_Brother2[] = _("오빠");
const u8 gExpandedPlaceholder_Sister2[] = _("언니");


const u8 gSystemText_Egg[] = _("알");
const u8 gSystemText_Pokemon2[] = _("포켓몬");


const u8 gMainMenuString_NewGame[] = _("새로운 모험을 시작한다");
const u8 gMainMenuString_Continue[] = _("모험을 계속한다");
const u8 gMainMenuString_Option[] = _("설정을 바꾼다");
const u8 gMainMenuString_MysteryEvents[] = _("이상한 소포");


const u8 SystemText_UpdatingSaveExternal[] = _("외부 데이터를 리포트에 갱신합니다\n잠시만 기다려 주십시오");
const u8 SystemText_SaveUpdated[] = _("리포트가 갱신되었습니다!");
const u8 SystemText_SaveUpdatedExchangeBackup[] = _("리포트가 갱신되었습니다!\p더 이상 리포트를 쓸 수 없으므로\n백업 카트리지를\l교환해주시기 바랍니다!\p자세한 내용은\n닌텐도 서비스 센터로\l문의해주세요");
const u8 SystemText_SaveNotUpdated[] = _("리포트 갱신에\n실패했습니다!\p백업 카트리지를\n교환해주시기 바랍니다!\p자세한 내용은\n닌텐도 서비스 센터로\l문의해주세요");


const u8 gSaveFileCorruptMessage[] = _("리포트가 정확히 쓰여있지 않기 때문에\n전에 작성한 리포트를 읽겠습니다!");
const u8 gSaveFileDeletedMessage[] = _("리포트의 내용이 사라졌다!");


const u8 gBoardNotInstalledMessage[] = _("1M 서브보드가 꽂혀 있지 않습니다!");
const u8 gBatteryDryMessage[] = _("전지가 다 되어서\n시계가 움직이지 않습니다\p시계와 관련된 이벤트는\n일어나지 않지만\l게임은 계속 플레이할 수 있습니다");


const u8 gMainMenuString_Player[] = _("주인공");
const u8 gMainMenuString_Pokedex[] = _("포켓몬 도감");
const u8 gMainMenuString_Time[] = _("플레이 시간");
const u8 gMainMenuString_Badges[] = _("가지고 있는 배지");


const u8 gBirchText_Boy[] = _("남자");
const u8 gBirchText_Girl[] = _("여자");
const u8 gBirchText_NewName[] = _("스스로 결정한다!");




const u8 gDefaultBoyName1[] = _("대호");

const u8 gDefaultBoyName2[] = _("영성");
const u8 gDefaultBoyName3[] = _("홍준");
const u8 gDefaultBoyName4[] = _("민혁");




const u8 gDefaultGirlName1[] = _("대은");

const u8 gDefaultGirlName2[] = _("나영");
const u8 gDefaultGirlName3[] = _("연지");
const u8 gDefaultGirlName4[] = _("규희");

const u8 gSystemText_IntroWeCall[] = _("포켓몬스터\n...즉 포켓몬");
const u8 gSystemText_NewPara[] = _("\p");

const u8 gDexText_UnknownPoke[] = _("           ?????포켓몬");
const u8 gDexText_UnknownHeight[] = _("{CLEAR_TO 3}???.?m");
const u8 gDexText_UnknownWeight[] = _("{CLEAR_TO 3}???.?kg$");
const u8 gDexText_CryOf[] = _("{CLEAR_TO 2}울음소리$");
const u8 gDexText_SizeComparedTo[] = _("{K_WAGWA} {PLAYER}의 크기 비교");
const u8 gDexText_RegisterComplete[] = _("포켓몬 도감 등록 완료!");
const u8 gDexText_Searching[] = _("검색하고 있습니다...");
const u8 gDexText_SearchComplete[] = _("검색이 완료되었습니다!");
const u8 gDexText_NoMatching[] = _("해당하는 포켓몬이 없습니다...");

const u8 DexText_SearchForPoke[] = _("조건을 지정해서\n포켓몬을 검색합니다");
const u8 DexText_SwitchDex[] = _("도감리스트의 순서를 변경합니다");
const u8 DexText_ReturnToDex[] = _("도감으로 돌아갑니다");
const u8 DexText_SelectDexMode[] = _("도감 모드를 지정합니다");
const u8 DexText_SelectDexList[] = _("도감의 순서를 지정합니다");
const u8 DexText_ListByABC[] = _("이름의 첫 글자를 지정합니다\n /발견한 포켓몬만");
const u8 DexText_ListByColor[] = _("몸의 색을 지정합니다\n /발견한 포켓몬만");
const u8 DexText_ListByType[] = _("타입을 지정합니다\n /잡은 포켓몬만");
const u8 DexText_ExecuteSearchSwitch[] = _("검색 또는 변경을 실행합니다");
const u8 DexText_HoennDex[] = _("호연도감");
const u8 DexText_NationalDex[] = _("전국도감");
const u8 DexText_NumericalMode[] = _("번호 순");
const u8 DexText_ABCMode[] = _("가나다 순");
const u8 DexText_HeaviestMode[] = _("무거운 순");
const u8 DexText_LightestMode[] = _("가벼운 순");
const u8 DexText_TallestMode[] = _("키가 큰 순");
const u8 DexText_SmallestMode[] = _("키가 작은 순");
const u8 DexText_ABC[] = _("ㄱㄴ");
const u8 DexText_DEF[] = _("ㄷㄹ");
const u8 DexText_GHI[] = _("ㅁㅂ");
const u8 DexText_JKL[] = _("ㅅㅇ");
const u8 DexText_MNO[] = _("ㅈㅊ");
const u8 DexText_PQR[] = _("ㅋㅌ");
const u8 DexText_STU[] = _("ㅍㅎ");
const u8 DexText_VWX[] = _("");
const u8 DexText_YZ[] = _("");
const u8 DexText_Red[] = _("빨간색");
const u8 DexText_Blue[] = _("파란색");
const u8 DexText_Yellow[] = _("노란색");
const u8 DexText_Green[] = _("초록색");
const u8 DexText_Black[] = _("검정색");
const u8 DexText_Brown[] = _("갈색");
const u8 DexText_Purple[] = _("보라색");
const u8 DexText_Gray[] = _("회색");
const u8 DexText_White[] = _("하얀색");
const u8 DexText_Pink[] = _("분홍색");
const u8 DexText_HoennDex2[] = _("호연지방 포켓몬 도감");
const u8 DexText_NationalDex2[] = _("전국 포켓몬 도감");
const u8 DexText_ListByNumber[] = _("포켓몬을\n번호 순으로 표시합니다");
const u8 DexText_ListByABC2[] = _("발견한 포켓몬의 이름을\n가나다 순으로 표시합니다");
const u8 DexText_ListByHeavyToLightest[] = _("잡은 포켓몬을\n무거운 순으로 표시합니다");
const u8 DexText_ListByLightToHeaviest[] = _("잡은 포켓몬을\n가벼운 순으로 표시합니다");
const u8 DexText_ListByTallToSmallest[] = _("잡은 포켓몬을\n키가 큰 순으로 표시합니다");
const u8 DexText_ListBySmallToTallest[] = _("잡은 포켓몬을\n키가 작은 순으로 표시합니다");
const u8 DexText_Terminator5[] = _("");
const u8 DexText_DontSpecify[] = _("지정하지 않는다");
const u8 DexText_None[] = _("없음");
const u8 DexText_RightPointingTriangle[] = _("▶");
const u8 DexText_Terminator6[] = _(" ");

const u8 gMenuText_WelcomeToHOFAndDexRating[] = _("전당등록을 축합니다!$발견한 포켓몬 {STR_VAR_1}!\n잡은 포켓몬 {STR_VAR_2}!\p털보박사의\n포켓몬 도감 평가!\p털보박사: 어디 보자\p");
const u8 gMenuText_HOFSaving[] = _("지금까지의 리포트를 작성하고 있습니다!\n전원을 끄지마십시오");
const u8 gMenuText_HOFCorrupt[] = _("전당등록의 기록이 손상되었습니다!");
const u8 gMenuText_HOFNumber[] = _("전당등록 제 ");
const u8 gMenuText_HOFCongratulations[] = _("리그 챔피언! 축하합니다!");

const u8 gOtherText_Number2[] = _("No. ");
const u8 gOtherText_Level3[] = _("Lv. ");
const u8 gOtherText_IDNumber[] = _("IDNo. /");
const u8 gOtherText_Name[] = _("이름 /");
const u8 gOtherText_IDNumber2[] = _("IDNo. /");
const u8 gOtherText_BirchInTrouble[] = _("{HIGHLIGHT WHITE2}{COLOR DARK_GREY}털보박사님이 위험하다!\n포켓몬을 꺼내서 도와주자!");
const u8 gOtherText_DoYouChoosePoke[] = _("{HIGHLIGHT WHITE2}{COLOR DARK_GREY}이 포켓몬으로 결정하겠습니까?");
const u8 gOtherText_Poke[] = _("포켓몬");

const u8 gSystemText_SaveErrorExchangeBackup[] = _("리포트를 작성할 수 없습니다\p백업 카트리지를 교체하여 주십시오");
const u8 gOtherText_FlyToWhere[] = _("어디로 날아갈까요?");

const u8 OtherText_Use[] = _("쓴다");
const u8 OtherText_Toss[] = _("버린다");
const u8 OtherText_Register[] = _("등록");
const u8 OtherText_Give2[] = _("건네준다");
const u8 OtherText_CheckTag[] = _("태그확인");
const u8 OtherText_Confirm[] = _("결정");
const u8 gOtherText_Walk[] = _("내린다");

const u8 gUnknownText_Exit[] = _("돌아간다");
const u8 gOtherText_CancelNoTerminator[] = _("그만둔다");
const u8 gOtherText_CancelNoTerminator2[] = _("필요없다");
const u8 gOtherText_CancelWithTerminator[] = _("$그만둔다");

const u8 OtherText_Item[] = _("지닌물건");
const u8 OtherText_Mail[] = _("메일");
const u8 OtherText_Take2[] = _("가져온다");
const u8 OtherText_Store[] = _("맡긴다");

const u8 gOtherText_Check[] = _("본다");
const u8 gOtherText_None[] = _("없음");

const u8 gOtherText_ThreeQuestions2[] = _("???");

const u8 gOtherText_FiveQuestionsAndSlash[] = _("?????$/");

const u8 gOtherText_OneDash[] = _("-");
const u8 gOtherText_TwoDashes[] = _("--");
const u8 gOtherText_ThreeDashes2[] = _("---");
const u8 gOtherText_MaleSymbol2[] = _("♂");
const u8 gOtherText_FemaleSymbolAndLv[] = _("♀$Lv.");
const u8 gOtherText_TallPlusAndRightArrow[] = _("{TALL_PLUS}${RIGHT_ARROW}");
const u8 gMenuText_GoBackToPrev[] = _("이전으로 돌아갑니다!");
const u8 gOtherText_WhatWillYouDo[] = _("무엇을 하겠습니까?");

const u8 gOtherText_xString1[] = _("×{STR_VAR_1}");
const u8 gOtherText_Berry2[] = _("열매");
const u8 gOtherText_Coins2[] = _("{STR_VAR_1}개");
const u8 gOtherText_CloseBag[] = _("가방을 닫는다");

const u8 OtherText_TheField3[] = _("필드로");
const u8 OtherText_TheBattle[] = _("배틀로");
const u8 OtherText_ThePokeList[] = _("포켓몬 리스트로");
const u8 OtherText_TheShop[] = _("숍으로");
const u8 OtherText_TheField[] = _("필드로");
const u8 OtherText_TheField2[] = _("필드로");
const u8 OtherText_ThePC[] = _("PC로");

const u8 *const gUnknown_0840E740[7] =
{
    OtherText_TheField3,
    OtherText_TheBattle,
    OtherText_ThePokeList,
    OtherText_TheShop,
    OtherText_TheField,
    OtherText_TheField2,
    OtherText_ThePC,
};

const u8 gOtherText_ReturnTo[] = _("돌아갑니다");
const u8 gOtherText_WhatWillYouDo2[] = _("어떻게 할까요?");
const u8 gOtherText_CantWriteMail[] = _("여기서 메일을\n쓸 수 없습니다!");
const u8 gOtherText_NoPokemon[] = _("포켓몬이 없습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_SwitchWhichItem[] = _("어느 것과\n바꿀까요?");
const u8 gOtherText_CantBeHeld[] = _("{STR_VAR_1}{K_EULREUL}\n지니게 할 수 없습니다!");
const u8 gOtherText_CantBeHeldHere[] = _("여기서는 {STR_VAR_1}{K_EULREUL}\n지니게 할 수 없습니다!");
const u8 gOtherText_HowManyToDeposit[] = _("얼마나 맡기겠습니까?");
const u8 gOtherText_DepositedItems[] = _("{STR_VAR_1}{K_EULREUL}\n{STR_VAR_2}개 맡겼습니다!");
const u8 gOtherText_NoRoomForItems[] = _("더 이상\n맡길 수 없습니다!");
const u8 gOtherText_CantStoreSomeoneItem[] = _("PC에\n남이 맡긴 것은\n넣을 수 없습니다!");
const u8 gOtherText_TooImportant[] = _("이것은 매우\n소중한 것이므로\n버릴 수 없습니다!");
const u8 gOtherText_HowManyToToss[] = _("몇 개 버리겠습니까?");
const u8 gOtherText_ThrewAwayItem[] = _("{STR_VAR_1}{K_EULREUL}\n{STR_VAR_2}개 버렸습니다");
const u8 gOtherText_OkayToThrowAwayPrompt[] = _("{STR_VAR_1}{K_EULREUL}\n{STR_VAR_2}개 버려도\n괜찮겠습니까?");
const u8 gOtherText_DadsAdvice[] = _("아빠의 말...\n{PLAYER}! 이런 것은\l쓸 때가 따로 있단다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantGetOffBike[] = _("여기서는 탈 수 없다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ItemfinderResponding[] = _("앗!\n기계가 반응하고 있어!\p어딘가에 도구가 묻혀있어!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ItemfinderItemUnderfoot[] = _("기계가 발밑에\n엄청 반응하고 있어!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoResponse[] = _("... ...휴우!\n...아무 반응이 없다{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_Coins3[] = _("당신의 동전: {STR_VAR_1}개{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BootedTM[] = _("기술머신을 켰다!");
const u8 gOtherText_BootedHM[] = _("비전머신을 켰다!");
const u8 gOtherText_ContainsMove[] = _("안에는 {STR_VAR_1}{K_IGA}\n기록되어 있다!\p{STR_VAR_1}{K_EULREUL}\n포켓몬에게 배우게 하겠습니까?");
const u8 gOtherText_UsedItem[] = _("{PLAYER}{K_EUNNEUN}\n{STR_VAR_2}{K_EULREUL} 썼다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_RepelLingers[] = _("아직 전에 썼던\n스프레이의 효과가 남아 있습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_UsedFlute[] = _("{PLAYER}{K_EUNNEUN}\n{STR_VAR_2}{K_EULREUL} 썼다!\p포켓몬과\n마주치기 쉬워졌다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_UsedRepel[] = _("{PLAYER}{K_EUNNEUN}\n{STR_VAR_2}{K_EULREUL} 썼다!\p포켓몬과\n마주치기 힘들어졌다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BoxIsFull[] = _("박스가 가득 찼습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_Size[] = _("크기");
const u8 gOtherText_Firm[] = _("경도");

const u8 gContestStatsText_Unknown1[] = _("{STR_VAR_1}.{STR_VAR_2}cm");

const u8 ContestStatsText_VerySoft[] = _("매우 부드럽다");
const u8 ContestStatsText_Soft[] = _("부드럽다");
const u8 ContestStatsText_Hard[] = _("딱딱하다");
const u8 ContestStatsText_VeryHard[] = _("매우 딱딱하다");
const u8 ContestStatsText_SuperHard[] = _("엄청나게 딱딱하다");

const u8 ContestStatsText_RedPokeBlock[] = _("빨강포켓몬스넥");
const u8 ContestStatsText_BluePokeBlock[] = _("파랑포켓몬스넥");
const u8 ContestStatsText_PinkPokeBlock[] = _("담홍포켓몬스넥");
const u8 ContestStatsText_GreenPokeBlock[] = _("초록포켓몬스넥");
const u8 ContestStatsText_YellowPokeBlock[] = _("노랑포켓몬스넥");
const u8 ContestStatsText_PurplePokeBlock[] = _("보라포켓몬스넥");
const u8 ContestStatsText_IndigoPokeBlock[] = _("남색포켓몬스넥");
const u8 ContestStatsText_BrownPokeBlock[] = _("갈색포켓몬스넥");
const u8 ContestStatsText_LiteBluePokeBlock[] = _("하늘포켓몬스넥");
const u8 ContestStatsText_OlivePokeBlock[] = _("황록포켓몬스넥");
const u8 ContestStatsText_GrayPokeBlock[] = _("회색포켓몬스넥");
const u8 ContestStatsText_BlackPokeBlock[] = _("검정포켓몬스넥");
const u8 ContestStatsText_WhitePokeBlock[] = _("하양포켓몬스넥");
const u8 ContestStatsText_GoldPokeBlock[] = _("황금포켓몬스넥");

const u8 gContestStatsText_Spicy[] = _("매운맛");
const u8 gContestStatsText_Dry[] = _("떫은맛");
const u8 gContestStatsText_Sweet[] = _("단맛");
const u8 gContestStatsText_Bitter[] = _("쓴맛");
const u8 gContestStatsText_Sour[] = _("신맛$좋은맛$부드러움");

const u8 gContestStatsText_StowCase[] = _("케이스를 닫는다");
const u8 gContestStatsText_ThrowAwayPrompt[] = _("{STR_VAR_1}{K_EULREUL}\n전부 버려도 괜찮겠습니까?");
const u8 gContestStatsText_WasThrownAway[] = _("{STR_VAR_1}{K_EULREUL}\n버렸습니다");
const u8 gContestStatsText_NormallyAte[] = _("{STR_VAR_1}{K_EUNNEUN} {STR_VAR_2}{K_EULREUL}\n먹었다!{PAUSE_UNTIL_PRESS}");
const u8 gContestStatsText_HappilyAte[] = _("{STR_VAR_1}{K_EUNNEUN} {STR_VAR_2}{K_EULREUL}\n기뻐하며 먹었다!{PAUSE_UNTIL_PRESS}");
const u8 gContestStatsText_DisdainfullyAte[] = _("{STR_VAR_1}{K_EUNNEUN} {STR_VAR_2}{K_EULREUL}\n싫어하며 먹었다!{PAUSE_UNTIL_PRESS}");

const u8 MartText_Buy[] = _("사러 왔다");
const u8 MartText_Sell[] = _("팔러 왔다");
const u8 MartText_Quit2[] = _("아무것도 아닙니다");

const u8 gOtherText_QuitShopping[] = _("쇼핑을 그만둡니다");

const u8 gOtherText_HowManyYouWant[] = _("{STR_VAR_1}{K_EULREUL}\n몇 개 구입하시겠습니까?");
const u8 gOtherText_ThatWillBe[] = _("{STR_VAR_1} {STR_VAR_2}개로군요\n총 {STR_VAR_3}원입니다.");
const u8 gOtherText_ThatWillBe2[] = _("{STR_VAR_1} 말이지!\n{STR_VAR_2}원인데 살 거야?");
const u8 gOtherText_ThatWillBe3[] = _("{STR_VAR_1} 말이죠!\n{STR_VAR_2}원인데 사실래요?");
const u8 gOtherText_HereYouGo[] = _("네 여기 있습니다\n대단히 감사합니다");
const u8 gOtherText_HereYouGo2[] = _("감사합니다!\n집의 PC로 전송해 드리겠습니다");
const u8 gOtherText_HereYouGo3[] = _("감사합니다!\n집의 PC로 전송해 드리겠습니다");
const u8 gOtherText_NotEnoughMoney[] = _("돈이 부족하시군요!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoRoomFor[] = _("그 이상은\n가지고 다닐 수 없어요!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_SpaceForIsFull[] = _("{STR_VAR_1}{K_EUNNEUN}\n그 이상 지닐 수 없습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AnythingElse[] = _("그 밖에 저희가\n뭐 도와드릴 건 없습니까?");
const u8 gOtherText_CanIHelpYou[] = _("그 밖에 뭔가 필요한가요?");
const u8 gOtherText_FreePremierBall[] = _("프레미어볼 1개를\n서비스로 드리겠습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantBuyThat[] = _("{STR_VAR_2}{K_EUNNEUN}\n파실 수 없습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_HowManyToSell[] = _("{STR_VAR_2}{K_EULREUL}\n몇 개 파시겠습니까?");
const u8 gOtherText_CanPay[] = _("그 물건은 {STR_VAR_1}원으로\n쳐 드리겠습니다");
const u8 gOtherText_SoldItem[] = _("{STR_VAR_2}{K_EULREUL} 건네고\n{STR_VAR_1}원을 받았다");

const u8 OtherText_Money[] = _("{STR_VAR_1}원");
const u8 OtherText_Shift[] = _("교체한다");
const u8 OtherText_SendOut[] = _("교체한다");
const u8 OtherText_Switch2[] = _("순서바꾸기");
const u8 OtherText_Summary[] = _("능력치를 본다");
const u8 OtherText_Moves[] = _("기술을 본다");
const u8 OtherText_Enter2[] = _("참가한다");
const u8 OtherText_NoEntry[] = _("참가 안 한다");
const u8 OtherText_Take[] = _("메일을 받는다");
const u8 OtherText_Read2[] = _("메일을 읽는다");

const u8 gOtherText_Hp2[] = _("체력");
const u8 gOtherText_SpAtk2[] = _("특수공격");
const u8 gOtherText_SpDef2[] = _("특수방어");
const u8 gOtherText_WontHaveAnyEffect[] = _("사용해도 효과가 없다!{PAUSE_UNTIL_PRESS}");


const u8 gOtherText_CantUseOnPoke[] = _("그 포켓몬에게는\n쓸 수 없습니다{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantBeSwitched[] = _("{STR_VAR_1}{K_EULREUL}\n돌아오게 할 수 없습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadyBattle[] = _("{STR_VAR_1}{K_EUNNEUN}\n이미 배틀에 나가 있습니다{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadySelected[] = _("{STR_VAR_1}{K_EUNNEUN} 이미\n선택되어 있습니다{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoEnergyLeft[] = _("{STR_VAR_1}{K_EUNNEUN} 싸우기 위한\n기력이 남아있지 않습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantSwitchPokeWithYours[] = _("{STR_VAR_1}의 포켓몬과는\n교체할 수 없습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_EGGCantBattle[] = _("알은\n배틀에 내보낼 수 없습니다{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantBeUsedBadge[] = _("새로운 배지를 얻을 때까지\n아직 쓸 수 없습니다");
const u8 gOtherText_NoMoreThreePoke[] = _("참가할 수 있는 포켓몬은\n3마리까지입니다!");
const u8 gOtherText_SendRemovedMailPrompt[] = _("받은 메일을 PC로\n전송하겠습니까?");
const u8 gOtherText_MailWasSent[] = _("메일을 PC에\n전송하였습니다{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailboxIsFull[] = _("PC의 메일박스가\n가득 찼습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailRemovedMessageLost[] = _("메일을 받으면 메시지가 지워집니다\n괜찮겠습니까?");
const u8 gOtherText_MailMustBeRemoved[] = _("메일이 있으면\n도구를 지닐 수 없습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WasGivenToHold[] = _("{STR_VAR_1}에게\n{STR_VAR_2}{K_EULREUL} 지니게 했다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadyHolding[] = _("{STR_VAR_1}{K_EUNNEUN} 이미\n{STR_VAR_2}{K_EULREUL} 지니고 있습니다\p지니고 있는 도구를\n교환하겠습니까?");
const u8 gOtherText_NotHoldingAnything[] = _("{STR_VAR_1}{K_EUNNEUN} 도구를 아무것도\n지니고 있지 않습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ReceivedTheThingFrom[] = _("{STR_VAR_1}{K_EU}로부터\n{STR_VAR_2}{K_EULREUL} 가져왔습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailTaken[] = _("포켓몬으로부터 메일을\n받았습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_TakenAndReplaced[] = _("{STR_VAR_2}{K_EULREUL} 가져오고\n{STR_VAR_1}{K_EULREUL} 지니게 했습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_PokeHoldingItemCantMail[] = _("이미 도구를 지니고 있으므로\n메일을 지니게 할 수 없습니다{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailTransferredMailbox[] = _("박스에서 메일을 옮겼습니다{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BagFullCannotRemoveItem[] = _("가방이 가득 차서 포켓몬의\n도구를 받을 수 없습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_LearnedMove[] = _("{STR_VAR_1}{K_EUNNEUN} 새로\n{STR_VAR_2}{K_EULREUL} 배웠다!");
const u8 gOtherText_NotCompatible[] = _("{STR_VAR_1}{K_WAGWA} {STR_VAR_2}{K_EUNNEUN}\n상성이 좋지 않았다!\p{STR_VAR_2}{K_EUNNEUN} 배울 수 없다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WantsToLearn[] = _("{STR_VAR_1}{K_EUNNEUN} 새로\n{STR_VAR_2}{K_EULREUL} 배우고 싶다...\p그러나 {STR_VAR_1}{K_EUNNEUN} 기술을 4개\n알고 있어 더 이상 배울 수 없다!\p{STR_VAR_2} 대신\n다른 기술을 잊게 하겠습니까?");
const u8 gOtherText_StopTryingTo[] = _("그럼... {STR_VAR_2}{K_EULREUL}\n배우는 것을 포기하겠습니까?");
const u8 gOtherText_DidNotLearnMove2[] = _("{STR_VAR_1}{K_EUNNEUN} {STR_VAR_2}{K_EULREUL}\n결국 배우지 않았다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WhichMoveToForget2[] = _("어느 기술을 잊게 하겠습니까?{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ForgetMove123_2[] = _("{PAUSE 32}1, {PAUSE 15}2, {PAUSE 15}... {PAUSE 15}... {PAUSE 15}{PLAY_SE SE_KON}짠!\p{STR_VAR_1}{K_EUNNEUN} {STR_VAR_2}{K_EULREUL}\n깨끗이 잊었다!\p그리고...!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadyKnows[] = _("{STR_VAR_1}{K_EUNNEUN} 이미\n{STR_VAR_2}{K_EULREUL} 기억하고 있습니다{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_HPRestoredBy[] = _("{STR_VAR_1}의 체력이\n{STR_VAR_2} 회복되었다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CuredPoisoning[] = _("{STR_VAR_1}의 독은\n말끔하게 해독됐다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CuredParalysis[] = _("{STR_VAR_1}의\n몸저림이 풀렸다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WokeUp[] = _("{STR_VAR_1}{K_EUNNEUN}\n눈을 떴다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BurnHealed[] = _("{STR_VAR_1}의\n화상이 나았다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ThawedOut[] = _("{STR_VAR_1}의\n얼었던 몸이 녹았다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_PPRestored[] = _("기술포인트를 회복했다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_RegainedHealth[] = _("{STR_VAR_1}{K_EUNNEUN}\n기력을 회복했다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BecameHealthy[] = _("{STR_VAR_1}{K_EUNNEUN}\n건강해졌다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_PPIncreased[] = _("{STR_VAR_1}의\n기술포인트가 늘었다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ElevatedTo[] = _("{STR_VAR_1}{K_EUNNEUN}\n레벨{STR_VAR_2}{K_EU}로 올랐다!");
const u8 gOtherText_WasRaised[] = _("{STR_VAR_1}{K_EUNNEUN} {STR_VAR_2}의\n기초포인트가 올라갔다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_SnapConfusion[] = _("{STR_VAR_1}의\n혼란이 풀렸다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_GotOverLove[] = _("{STR_VAR_1}의\n헤롱헤롱이 풀렸다!{PAUSE_UNTIL_PRESS}");
const u8 OtherText_ChoosePoke[] = _("포켓몬을 선택해 주십시오");
const u8 OtherText_MovePokeTo[] = _("어디로 이동할까?");
const u8 OtherText_TeachWhat[] = _("어느 포켓몬에게 가르칠까?");
const u8 OtherText_UseWhat[] = _("어느 포켓몬에게 사용할까?");
const u8 OtherText_GiveWhat[] = _("어느 포켓몬에게 건네줄까?");
const u8 OtherText_DoWhat[] = _("{STR_VAR_1}{K_EULREUL} 어떻게 할까?");
const u8 OtherText_NothingToCut[] = _("여기서는 쓸 수 없습니다");
const u8 OtherText_CantSurf[] = _("여기서는 쓸 수 없습니다");
const u8 OtherText_AlreadySurfing[] = _("이미 파도타기를 하고 있습니다");
const u8 OtherText_CantUseThatHere[] = _("여기서는 쓸 수 없습니다");
const u8 OtherText_RestoreWhatMove[] = _("어느 기술을 회복하겠습니까?");
const u8 OtherText_BoostPP[] = _("어느 기술의 포인트를 늘릴까?");
const u8 OtherText_DoWhatWithItem[] = _("지닌물건을 어떻게 할까?");
const u8 OtherText_NoPokeForBattle[] = _("대전에 내보낼 포켓몬이 없습니다!");
const u8 OtherText_ChoosePoke2[] = _("맡길 포켓몬을 선택해 주십시오");
const u8 OtherText_NotEnoughHP[] = _("체력이 부족합니다...");
const u8 OtherText_ThreePokeNeeded[] = _("포켓몬 3마리가 필요합니다!");
const u8 OtherText_PokeCantBeSame[] = _("같은 포켓몬이 있습니다!");
const u8 OtherText_NoIdenticalHoldItems[] = _("도구가 같은 포켓몬이 있습니다!");
const u8 OtherText_TeachWhichPoke[] = _("어느 포켓몬에게 가르칠까?");
const u8 gOtherText_Attack[] = _("공격");
const u8 gOtherText_Defense[] = _("방어");
const u8 gOtherText_SpAtk[] = _("특수공격");
const u8 gOtherText_SpDef[] = _("특수방어");
const u8 gOtherText_Speed[] = _("스피드");
const u8 gOtherText_HP[] = _("HP");
const u8 gOtherText_Terminator18[] = _("앞으로");
const u8 gOtherText_OriginalTrainer[] = _("어버이/");
const u8 gOtherText_Type2[] = _("타입/");
const u8 gOtherText_Power2[] = _("위력");
const u8 gOtherText_Accuracy2[] = _("명중");
const u8 gOtherText_Appeal2[] = _("어필");
const u8 gOtherText_Jam2[] = _("방해");
const u8 gOtherText_Status[] = _("상태");
const u8 gOtherText_ExpPoints[] = _("현재 경험치");
const u8 gOtherText_NextLv[] = _("다음 레벨까지");
const u8 gOtherText_Ribbons00[] = _("현재{CLEAR_TO 0x38}개");

const u8 OtherText_Event[] = _("이벤트");
const u8 OtherText_Switch[] = _("교체");
const u8 OtherText_PokeInfo[] = _("포켓몬 정보");
const u8 OtherText_PokeSkills[] = _("포켓몬 능력");
const u8 OtherText_BattleMoves[] = _("싸울 기술");
const u8 OtherText_ContestMoves[] = _("콘테스트 기술");
const u8 OtherText_Info[] = _("자세히");

const u8 gOtherText_EggLongTime[] = _("이 알은 태어나기까지 상당한\n시간이 걸릴 것 같다");
const u8 gOtherText_EggSomeTime[] = _("무엇이 태어날까? 태어나기까지\n아직 시간이 걸릴 것 같다");
const u8 gOtherText_EggSoon[] = _("가끔 움직이고 있는 것 같다\n태어나기까지 이제 조금 남은 건가?");
const u8 gOtherText_EggAbout[] = _("안에서 소리가 들려온다\n이제 곧 태어날 것 같아!");
const u8 gOtherText_CantForgetHMs[] = _("그건 중요한 기술입니다\n잊게 할 수 없습니다!");
const u8 gOtherText_PlayersBase[] = _("의 비밀기지");
const u8 gOtherText_OkayToDeleteFromRegistry[] = _("{STR_VAR_1}의 등록을\n해제해도 괜찮겠습니까?");
const u8 gOtherText_RegisteredDataDeleted[] = _("등록을 해제했습니다{PAUSE_UNTIL_PRESS}");

const u8 gSecretBaseText_NoRegistry[] = _("등록 리스트가 없습니다{PAUSE_UNTIL_PRESS}");
const u8 SecretBaseText_DelRegist[] = _("등록 해제");
const u8 SecretBaseText_Decorate[] = _("굿즈를 꺼낸다");
const u8 SecretBaseText_PutAway[] = _("굿즈를 되돌린다");
const u8 SecretBaseText_Toss[] = _("굿즈를 버린다");
const u8 SecretBaseText_PutOutDecor[] = _("선택한 굿즈를 방으로 꺼냅니다!");
const u8 SecretBaseText_StoreChosenDecor[] = _("선택한 굿즈를 PC로 되돌립니다!");
const u8 SecretBaseText_ThrowAwayDecor[] = _("필요 없어진 굿즈를 버립니다!");
const u8 gSecretBaseText_NoDecors[] = _("굿즈가 없습니다!{PAUSE_UNTIL_PRESS}");
const u8 SecretBaseText_Desk[] = _("책상");
const u8 SecretBaseText_Chair[] = _("의자");
const u8 SecretBaseText_Plant[] = _("화분");
const u8 SecretBaseText_Ornament[] = _("장식품");
const u8 SecretBaseText_Mat[] = _("매트");
const u8 SecretBaseText_Poster[] = _("벽장식");
const u8 SecretBaseText_Doll[] = _("봉제인형");
const u8 SecretBaseText_Cushion[] = _("쿠션");
const u8 gSecretBaseText_GoldRank[] = _("금");
const u8 gSecretBaseText_SilverRank[] = _("은");
const u8 gSecretBaseText_PlaceItHere[] = _("여기에 놓겠습니까?");
const u8 gSecretBaseText_CantBePlacedHere[] = _("여기에 놓을 수 없습니다!");
const u8 gSecretBaseText_CancelDecorating[] = _("놓기를 그만두겠습니까?");
const u8 gSecretBaseText_InUseAlready[] = _("이미 놓여 있습니다!");
const u8 gSecretBaseText_NoMoreDecor[] = _("더는 놓을 수 없습니다\n비밀기지에 놓는 건{STR_VAR_1}개까지입니다");
const u8 gSecretBaseText_NoMoreDecor2[] = _("더는 놓을 수 없습니다\n방에 놓는 건{STR_VAR_1}개까지입니다$여기에 놓을 수 없습니다!\n책상 위 등에 놓아 주십시오!");
const u8 gSecretBaseText_DecorCantPlace[] = _("이 굿즈는\n자신의 방에 놓을 수 없습니다!");
const u8 gSecretBaseText_DecorInUse[] = _("이 굿즈는 놓여 있으므로\n버릴 수 없습니다!");
const u8 gSecretBaseText_WillBeDiscarded[] = _("{STR_VAR_1}{K_IGA} 없어져 버립니다만\n괜찮겠습니까?");
const u8 gSecretBaseText_DecorThrownAway[] = _("굿즈를 버렸습니다!");
const u8 gSecretBaseText_StopPuttingAwayDecor[] = _("되돌리는 것을 그만두겠습니까?");
const u8 gSecretBaseText_NoDecor[] = _("여기에는 굿즈가 없습니다!");
const u8 gSecretBaseText_ReturnDecor[] = _("이 굿즈를 PC로 되돌리겠습니까?");
const u8 gSecretBaseText_DecorReturned[] = _("굿즈를 PC로 되돌렸습니다!");
const u8 gSecretBaseText_NoDecorInUse[] = _("굿즈가 놓여 있지 않습니다!{PAUSE_UNTIL_PRESS}");
const u8 SecretBaseText_Tristan[] = _("원류");
const u8 SecretBaseText_Philip[] = _("향리");
const u8 SecretBaseText_Dennis[] = _("유준");
const u8 SecretBaseText_Roberto[] = _("현웅");
const u8 SecretBaseText_TurnOff[] = _("접속을 끊는다");
const u8 SecretBaseText_Decoration[] = _("모양바꾸기");
const u8 SecretBaseText_ItemStorage[] = _("도구 맡기기");

const u8 gPCText_Mailbox[] = _("메일박스");
const u8 PCText_DepositItem[] = _("도구를 맡긴다");
const u8 PCText_WithdrawItem[] = _("도구를 가져간다");
const u8 PCText_TossItem[] = _("도구를 버린다");
const u8 PCText_StoreItems[] = _("PC에 도구를\n맡길 수 있습니다");
const u8 PCText_TakeOutItems[] = _("PC에 맡긴 도구를\n가져갈 수 있습니다");
const u8 PCText_ThrowAwayItems[] = _("PC에 있는 도구를\n버릴 수 있습니다");

const u8 gOtherText_NoItems[] = _("아무것도 없습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoMoreRoom[] = _("더 이상\n가방에 넣을 수 없습니다");
const u8 gOtherText_HowManyToWithdraw[] = _("몇 개 꺼내겠습니까?");
const u8 gOtherText_WithdrewThing[] = _("{STR_VAR_1}{K_EULREUL}\n{STR_VAR_2}개 꺼냈습니다");
const u8 OtherText_Read[] = _("내용을 읽는다");
const u8 gOtherText_MoveToBag[] = _("가방으로 돌아간다");
const u8 OtherText_Give[] = _("포켓몬에게 맡긴다");
const u8 gOtherText_NoMailHere[] = _("메일이 1통도 없습니다{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WhatWillYouDoMail[] = _("{STR_VAR_1}의\n메일을 어떻게 하겠습니까?");
const u8 gOtherText_MessageWillBeLost[] = _("내용은 사라져 버립니다만\n괜찮겠습니까?");
const u8 gOtherText_BagIsFull[] = _("가방이 가득 찼습니다!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailWasReturned[] = _("내용을 지운 메일을\n가방에 넣었습니다{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_Dad[] = _("아빠");
const u8 gOtherText_Mom[] = _("엄마");
const u8 gOtherText_Wallace[] = _("윤진");
const u8 gOtherText_Steven[] = _("성호");
const u8 gOtherText_Brawly[] = _("철구");
const u8 gOtherText_Winona[] = _("은송");
const u8 gOtherText_Phoebe[] = _("회연");
const u8 gOtherText_Glacia[] = _("미혜");
const u8 gContestText_ContestWinner[] = _("콘테스트 우승자\n");
const u8 gOtherText_Unknown1[] = _("의 ");
const u8 OtherText_Cool[] = _("근사함 ");
const u8 OtherText_Beauty2[] = _("아름다움 ");
const u8 OtherText_Cute[] = _("귀여움 ");
const u8 OtherText_Smart[] = _("슬기로움 ");
const u8 OtherText_Tough[] = _("강인함 ");
const u8 OtherText_NonstopSuperCool[] = _("슈퍼 쿨\n논스톱 ");
const u8 OtherText_Terminator6[] = _("");
const u8 OtherText_GoodLookingPoke[] = _("굿 루킹 포켓몬 ");
const u8 OtherText_Terminator7[] = _("");
const u8 OtherText_MarvelousGreat[] = _("마블러스 원더풀\n그레이트 ");
const u8 OtherText_Terminator8[]= _("");
const u8 OtherText_CenturyLastVenus[]= _("금세기 최고의 비너스\n뷰티 ");
const u8 OtherText_Terminator9[]= _("");
const u8 OtherText_Terminator10[]= _("");
const u8 OtherText_DazzlingSmile[]= _("의 눈부신\n반짝반짝 스마일");
const u8 OtherText_PokeCenterIdol[]= _("포켓몬센터의\n슈퍼 아이돌 ");
const u8 OtherText_Terminator11[]= _("");
const u8 OtherText_LovelyAndSweet[]= _("러블리 스위트 ");
const u8 OtherText_Terminator12[]= _("");
const u8 OtherText_ThePretty[]= _("프리티 ");
const u8 OtherText_WinningPortrait[] = _("의\n새침한 숏");
const u8 OtherText_GiveUsWink[] = _("이쪽 봐줘!\n큐트 포켓몬 ");
const u8 OtherText_Terminator13[] = _("");
const u8 OtherText_SmartnessMaestro[] = _("슬기로운 마에스트로\n와이즈 포켓몬 ");
const u8 OtherText_Terminator14[] = _("");
const u8 OtherText_ChosenPokeAmong[] = _("선택받은 포켓몬...\n포켓몬 중의 포켓몬 ");
const u8 OtherText_Terminator15[] = _("");
const u8 OtherText_TheExcellent[] = _("엑설런트 ");
const u8 OtherText_ItsMomentOfElegance[] = _("의\n우아한 순간");
const u8 OtherText_PowerfullyMuscular[] = _("파워풀 머슬\n허슬 ");
const u8 OtherText_Terminator16[] = _("");
const u8 OtherText_StrongErEst[] = _("스트롱 스트롱거\n스트롱기스트 ");
const u8 OtherText_Terminator17[] = _("");
const u8 OtherText_MightyTough[] = _("터프니스 마이티\n하이퍼 포켓몬 ");
const u8 OtherText_Exclamation[] = _("!");
const u8 OtherText_Petalburg[] = _("등화도시");
const u8 OtherText_Slateport[] = _("잿빛도시");
const u8 OtherText_Littleroot[] = _("미로마을");
const u8 OtherText_Lilycove[] = _("해안시티");
const u8 OtherText_Dewford[] = _("무로마을");
const u8 OtherText_Enter[] = _("참가한다");
const u8 OtherText_Info3[] = _("설명을 듣는다");
const u8 OtherText_WhatsAContest[] = _("포켓몬 콘테스트란?");
const u8 OtherText_TypesOfContest[] = _("콘테스트의 종류");
const u8 OtherText_Ranks[] = _("랭크에 대해서");
const u8 OtherText_Judging[] = _("심사위원에 대해서");
const u8 OtherText_CoolContest[] = _("근사함콘테스트");
const u8 OtherText_BeautyContest[] = _("아름다움콘테스트");
const u8 OtherText_CuteContest[] = _("귀여움콘테스트");
const u8 OtherText_SmartContest[] = _("슬기로움콘테스트");
const u8 OtherText_ToughContest[] = _("강인함콘테스트");
const u8 OtherText_Decoration[] = _("모양바꾸기");
const u8 OtherText_PackUp[] = _("이사");
const u8 OtherText_Count[] = _("카운트");
const u8 OtherText_Registry[] = _("등록 리스트");
const u8 OtherText_Information[] = _("등록 설명");
const u8 OtherText_Mach[] = _("마하");
const u8 OtherText_Acro[] = _("더트");
const u8 OtherText_Poison[] = _("독");
const u8 OtherText_Paralysis[] = _("마비");
const u8 OtherText_Sleep[] = _("잠듦");
const u8 OtherText_Burn[] = _("화상");
const u8 OtherText_Frozen[] = _("얼음");
const u8 OtherText_Quit[] = _("그만 읽는다");
const u8 OtherText_SawIt[] = _("봤어요");
const u8 OtherText_NotYet[] = _("볼 거예요");
const u8 OtherText_Yes[] = _("예");
const u8 OtherText_No[] = _("아니오");
const u8 OtherText_Info2[] = _("설명");
const u8 OtherText_SingleBattle[] = _("싱글배틀");
const u8 OtherText_DoubleBattle[] = _("더블배틀");
const u8 OtherText_MultiBattle[] = _("멀티배틀");
const u8 OtherText_MrBriney[] = _("하기");
const u8 OtherText_MakeAChallenge[] = _("도전한다");
const u8 OtherText_ObtainInformation[] = _("설명을 듣는다");
const u8 OtherText_Lv50_2[] = _("레벨50");
const u8 OtherText_Lv100_2[] = _("레벨100");
const u8 OtherText_Zigzagoon[] = _("지그제구리");
const u8 OtherText_Nincada[] = _("토중몬");
const u8 OtherText_Poochyena[] = _("포챠나");
const u8 OtherText_Nincada2[] = _("토중몬");
const u8 OtherText_Lotad[] = _("연꽃몬");
const u8 OtherText_Roselia[] = _("로젤리아");
const u8 OtherText_Shroomish[] = _("버섯꼬");
const u8 OtherText_Nincada3[] = _("토중몬");
const u8 OtherText_Surskit[] = _("비구술");
const u8 OtherText_Treecko[] = _("나무지기");
const u8 OtherText_Torchic[] = _("아차모");
const u8 OtherText_Mudkip[] = _("물짱이");
const u8 OtherText_Seedot[] = _("도토링");
const u8 OtherText_Shroomish2[] = _("버섯꼬");
const u8 OtherText_Spinda[] = _("얼루기");
const u8 OtherText_Shroomish3[] = _("버섯꼬");
const u8 OtherText_Zigzagoon2[] = _("지그제구리");
const u8 OtherText_Wurmple[] = _("개무소");
const u8 OtherText_PokeBall[] = _("몬스터볼");
const u8 OtherText_SuperPotion[] = _("좋은상처약");
const u8 OtherText_SamePrice[] = _("같은 가격");
const u8 OtherText_Yen135[] = _("135원");
const u8 OtherText_Yen155[] = _("155원");
const u8 OtherText_Yen175[] = _("175원");
const u8 OtherText_CostMore[] = _("비싸다");
const u8 OtherText_CostLess[] = _("싸다");
const u8 OtherText_SamePrice2[] = _("같은 가격");
const u8 OtherText_MaleSymbol[] = _("수컷");
const u8 OtherText_FemaleSymbol[] = _("암컷");
const u8 OtherText_Neither[] = _("둘 다 아니다");
const u8 OtherText_Males[] = _("남성");
const u8 OtherText_Females[] = _("여성");
const u8 OtherText_SameNumber[] = _("똑같다");
const u8 OtherText_Male[] = _("남성");
const u8 OtherText_Female[] = _("여성");
const u8 OtherText_ItDepends[] = _("정해져 있지 않다");
const u8 OtherText_Six2[] = _("6대");
const u8 OtherText_Eight2[] = _("8대");
const u8 OtherText_Ten[] = _("10대");
const u8 OtherText_One[] = _("한 명");
const u8 OtherText_Two[] = _("두 명");
const u8 OtherText_Three[] = _("세 명");
const u8 OtherText_Six[] = _("6개");
const u8 OtherText_Seven[] = _("7개");
const u8 OtherText_Eight[] = _("8개");
const u8 OtherText_FreshWater[] = _("맛있는물{CLEAR_TO 0x48}200원");
const u8 OtherText_SodaPop[] = _("미네랄사이다{CLEAR_TO 0x48}300원");
const u8 OtherText_Lemonade[] = _("후르츠밀크{CLEAR_TO 0x48}350원");
const u8 OtherText_HowToRide[] = _("타는 방법");
const u8 OtherText_HowToTurn[] = _("도는 방법");
const u8 OtherText_SandySlopes[] = _("모래 비탈길");
const u8 OtherText_Wheelies[] = _("윌리");
const u8 OtherText_BunnyHops[] = _("다니엘");
const u8 OtherText_Jumping[] = _("점프");
const u8 OtherText_Satisfied[] = _("만족");
const u8 OtherText_Dissatisfied[] = _("불만");
const u8 OtherText_Deepseatooth[] = _("심해의이빨");
const u8 OtherText_Deepseascale[] = _("심해의비늘");
const u8 OtherText_BlueFlute2[] = _("파랑비드로");
const u8 OtherText_YellowFlute2[] = _("노랑비드로");
const u8 OtherText_RedFlute2[] = _("빨강비드로");
const u8 OtherText_WhiteFlute2[] = _("하양비드로");
const u8 OtherText_BlackFlute2[] = _("검정비드로");
const u8 OtherText_GlassChair[] = _("고운 의자");
const u8 OtherText_GlassDesk[] = _("고운 책상");
const u8 OtherText_TreeckoDoll[] = _("나무지기인형    1000");
const u8 OtherText_TorchicDoll[] = _("아차모인형     1000");
const u8 OtherText_MudkipDoll[] = _("물짱이인형     1000");
const u8 OtherText_50Coins[] = _(" 50개   1000원");
const u8 OtherText_500Coins[] = _("500개  10000원");
const u8 OtherText_Excellent[] = _("최고예요");
const u8 OtherText_NotSoHot[] = _("그냥 그래요");
const u8 OtherText_RedShard[] = _("빨강조각");
const u8 OtherText_YellowShard[] = _("노랑조각");
const u8 OtherText_BlueShard[] = _("파랑조각");
const u8 OtherText_GreenShard[] = _("초록조각");
const u8 OtherText_BattleTower[] = _("배틀타워");
const u8 OtherText_Right[] = _("오른쪽");
const u8 OtherText_Left[] = _("왼쪽");
const u8 OtherText_TM32[] = _("기술머신32  1500");
const u8 OtherText_TM29[] = _("기술머신29  3500");
const u8 OtherText_TM35[] = _("기술머신35  4000");
const u8 OtherText_TM24[] = _("기술머신24  4000");
const u8 OtherText_TM13[] = _("기술머신13  4000");
const u8 OtherText_1F_2[] = _("1층");
const u8 OtherText_2F_2[] = _("2층");
const u8 OtherText_3F_2[] = _("3층");
const u8 OtherText_4F_2[] = _("4층");
const u8 OtherText_5F_2[] = _("5층");
const u8 OtherText_Cool2[] = _("근사함");
const u8 OtherText_Beauty3[] = _("아름다움");
const u8 OtherText_Cute2[] = _("귀여움");
const u8 OtherText_Smart2[] = _("슬기로움");
const u8 OtherText_Tough2[] = _("강인함");
const u8 OtherText_Normal[] = _("노말");
const u8 OtherText_Super[] = _("슈퍼");
const u8 OtherText_Hyper[] = _("하이퍼");
const u8 OtherText_Master[] = _("마스터");
const u8 OtherText_Cool3[] = _("근사함");
const u8 OtherText_Beauty4[] = _("아름다움");
const u8 OtherText_Cute3[] = _("귀여움");
const u8 OtherText_Smart3[] = _("슬기로움");
const u8 OtherText_Tough3[] = _("강인함");
const u8 OtherText_Items[] = _("도구");
const u8 OtherText_KeyItems[] = _("중요한 물건");
const u8 OtherText_Balls[] = _("몬스터볼");
const u8 OtherText_TMsHMs[] = _("기술머신");
const u8 OtherText_Berries[] = _("나무열매");

const u8 gPCText_SomeonesPC[] = _("누군가의 PC");
const u8 gPCText_LanettesPC[] = _("보은의 PC");
const u8 gPCText_PlayersPC[] = _("{PLAYER}의 PC");
const u8 gPCText_HallOfFame[] = _("전당등록");
const u8 gPCText_LogOff[] = _("스위치를 끈다");

const u8 gOtherText_99Times[] = _("99회 이상");
const u8 gOtherText_1Minute[] = _("1분 이상");
const u8 gOtherText_Seconds[] = _("초");
const u8 gOtherText_Times[] = _("회$.");
const u8 gOtherText_BigGuy[] = _("Big guy");
const u8 gOtherText_BigGirl[] = _("Big girl");
const u8 gOtherText_Son[] = _("아들");
const u8 gOtherText_Daughter[] = _("딸");
const u8 OtherText_BlueFlute[] = _("파랑비드로");
const u8 OtherText_YellowFlute[] = _("노랑비드로");
const u8 OtherText_RedFlute[] = _("빨강비드로");
const u8 OtherText_WhiteFlute[] = _("하양비드로");
const u8 OtherText_BlackFlute[] = _("검정비드로");
const u8 OtherText_PrettyChair[] = _("고운 의자");
const u8 OtherText_PrettyDesk[] = _("고운 책상");
const u8 OtherText_1F[] = _("1층");
const u8 OtherText_2F[] = _("2층");
const u8 OtherText_3F[] = _("3층");
const u8 OtherText_4F[] = _("4층");
const u8 OtherText_5F[] = _("5층");
const u8 OtherText_6F[] = _("6층");
const u8 OtherText_7F[] = _("7층");
const u8 OtherText_8F[] = _("8층");
const u8 OtherText_9F[] = _("9층");
const u8 OtherText_10F[] = _("10층");
const u8 OtherText_11F[] = _("11층");
const u8 OtherText_B1F[] = _("지하1층");
const u8 OtherText_B2F[] = _("지하2층");
const u8 OtherText_B3F[] = _("지하3층");
const u8 OtherText_B4F[] = _("지하4층");
const u8 OtherText_Rooftop[] = _("옥상");

const u8 gOtherText_NowOn[] = _("현재 플로어");

const u8 gPCText_Cancel[] = _("돌아간다");

const u8 PCText_ExitBox[] = _("박스를 종료하겠습니까?");
const u8 PCText_WhatYouDo[] = _("이 박스를 어떻게 하겠습니까?");
const u8 PCText_PickATheme[] = _("어느 테마로 하겠습니까?");
const u8 PCText_PickAWallpaper[] = _("어느 벽지로 하겠습니까?");
const u8 PCText_IsSelected[] = _("{K_EULREUL} 어떻게 하겠습니까?");
const u8 PCText_JumpToWhichBox[] = _("어느 박스로 점프하겠습니까?");
const u8 PCText_DepositInWhichBox[] = _("어느 박스에 맡기겠습니까?");
const u8 PCText_WasDeposited[] = _("{K_EULREUL} 맡겼습니다");
const u8 PCText_BoxIsFull[] = _("이 박스는 가득 찼습니다!");
const u8 PCText_ReleasePoke[] = _("정말 놓아주겠습니까?");
const u8 PCText_WasReleased[] = _("{K_EULREUL} 밖에 놓아주었다");
const u8 PCText_ByeBye[] = _("바이바이, !");
const u8 PCText_MarkPoke[] = _("마킹해 주십시오");
const u8 PCText_LastPoke[] = _("싸울 포켓몬이 없어집니다!");
const u8 PCText_PartyFull[] = _("지닌 포켓몬이 가득합니다!");
const u8 PCText_HoldingPoke[] = _("포켓몬을 쥐고 있습니다!");
const u8 PCText_WhichOneWillTake[] = _("데리고 갈 포켓몬을 선택하십시오!");
const u8 PCText_CantReleaseEgg[] = _("알은 놓아줄 수 없습니다!");
const u8 PCText_ContinueBox[] = _("박스 조작을 계속하겠습니까?");
const u8 PCText_CameBack[] = _("{K_IGA} 되돌아와 버렸다!");
const u8 PCText_Worried[] = _("걱정했었나...");
const u8 PCText_Surprise[] = _("... ... ... ... ...!");
const u8 PCText_PleaseRemoveMail[] = _("메일을 제거해 주십시오!");
const u8 PCText_Cancel2[] = _("그만둔다");
const u8 PCText_Deposit[] = _("맡긴다");
const u8 PCText_Withdraw[] = _("데리고 간다");
const u8 PCText_Switch[] = _("교체한다");
const u8 PCText_Move[] = _("잡는다");
const u8 PCText_Place[] = _("여기에 둔다");
const u8 PCText_Summary[] = _("상태를 본다");
const u8 PCText_Release[] = _("놓아준다");
const u8 PCText_Mark[] = _("마킹");
const u8 PCText_Name[] = _("이름");
const u8 PCText_Jump[] = _("점프");
const u8 PCText_Wallpaper[] = _("벽지");
const u8 PCText_Scenery1[] = _("풍경1");
const u8 PCText_Scenery2[] = _("풍경2");
const u8 PCText_Scenery3[] = _("풍경3");
const u8 PCText_Etc[] = _("기타");
const u8 PCText_Forest[] = _("숲");
const u8 PCText_City[] = _("시티");
const u8 PCText_Desert[] = _("사막");
const u8 PCText_Savanna[] = _("사바나");
const u8 PCText_Crag[] = _("바위산");
const u8 PCText_Volcano[] = _("화산");
const u8 PCText_Snow[] = _("설산");
const u8 PCText_Cave[] = _("동굴");
const u8 PCText_Beach[] = _("바닷가");
const u8 PCText_Seafloor[] = _("해저");
const u8 PCText_River[] = _("강");
const u8 PCText_Sky[] = _("하늘");
const u8 PCText_Polka[] = _("물방울");
const u8 PCText_PokeCenter[] = _("포켓센");
const u8 PCText_Machine[] = _("기계");
const u8 PCText_Plain[] = _("심플");
const u8 PCText_WhatDoYouWant[] = _("무엇을 하겠습니까?");
const u8 PCText_WithdrawPoke[] = _("포켓몬을 데리고 간다");
const u8 PCText_DepositPoke[] = _("포켓몬을 맡긴다");
const u8 PCText_MovePoke[] = _("박스를 정리한다");
const u8 PCText_SeeYa[] = _("종료");
const u8 PCText_MovePokeToParty[] = _("박스에 맡긴 포켓몬을\n지닐 수 있습니다");
const u8 PCText_StorePokeInBox[] = _("지닌 포켓몬을\n박스에 맡길 수 있습니다");
const u8 PCText_OrganizeBoxesParty[] = _("박스에 맡긴 포켓몬이나\n지닌 포켓몬을 정리할 수 있습니다");
const u8 PCText_ReturnToPrevMenu[] = _("포켓몬 보관 시스템과의\n통신을 종료합니다");

const u8 gPCText_OnlyOne[] = _("싸울 포켓몬이 없어집니다!");
const u8 gPCText_PartyFull2[] = _("지닌 포켓몬이 가득합니다!");
const u8 gPCText_BOX[] = _("박스");


const u8 PCText_CheckMap[] = _("{CLEAR 0}호연지방의 지도를 봅니다");
const u8 PCText_CheckPoke[] = _("{CLEAR 0}포켓몬을 자세히 조사합니다");
const u8 PCText_CheckTrainer[] = _("{CLEAR 0}트레이너의 정보를 봅니다");
const u8 PCText_CheckRibbons[] = _("{CLEAR 0}손에 넣은 기념리본을 봅니다");
const u8 PCText_PutAwayNav[] = _("{CLEAR 0}포켓내비를 종료합니다");
const u8 PCText_NoRibbonWin[] = _("{CLEAR 0}리본을 가진 포켓몬이 없습니다");
const u8 PCText_NoTrainers[] = _("{CLEAR 0}트레이너가 등록되어 있지 않습니다");
const u8 PCText_CheckParty[] = _("{CLEAR 0}가진 포켓몬을 자세히 조사합니다");
const u8 PCText_CheckPokeAll[] = _("{CLEAR 0}모든 포켓몬을 자세히 조사합니다");
const u8 PCText_ReturnToNav[] = _("{CLEAR 0}포켓내비 메뉴로 돌아갑니다");
const u8 PCText_FindCool[] = _("{CLEAR 0}근사한 포켓몬을 찾습니다");
const u8 PCText_FindBeauty[] = _("{CLEAR 0}아름다운 포켓몬을 찾습니다");
const u8 PCText_FindCute[] = _("{CLEAR 0}귀여운 포켓몬을 찾습니다");
const u8 PCText_FindSmart[] = _("{CLEAR 0}슬기로운 포켓몬을 찾습니다");
const u8 PCText_FindTough[] = _("{CLEAR 0}강인한 포켓몬을 찾습니다");
const u8 PCText_ReturnToCondition[] = _("{CLEAR 0}컨디션 메뉴로 돌아갑니다");

const u8 gOtherText_NumberRegistered[] = _("등록한 수");
const u8 gOtherText_NumberBattles[] = _("대전 횟수");
const u8 gOtherText_Strategy[] = _("{PALETTE 5}작전");
const u8 gOtherText_TrainersPokemon[] = _("{PALETTE 5}지닌 포켓몬");
const u8 gOtherText_SelfIntroduction[] = _("{PALETTE 5}자기소개");
const u8 gOtherText_Nature2[] = _("성격/");
const u8 gOtherText_InParty[] = _("데리고 있음");
const u8 gOtherText_Number[] = _("No. ");
const u8 gOtherText_Ribbons[] = _("리본");
const u8 OtherText_MakeProfilePage1[] = _("4개의 단어를 조합해서");
const u8 OtherText_MakeProfilePage2[] = _("프로필을 만들자!");
const u8 OtherText_MakeMessagePage1[] = _("6개의 단어로 메시지를 만들자!");
const u8 OtherText_MakeMessagePage2[] = _("7글자의 단어는 1행에 2개까지!");
const u8 OtherText_DescribeFeelingsPage1[] = _("지금의 기분에 딱 맞는");
const u8 OtherText_DescribeFeelingsPage2[] = _("단어를 찾아보자!");
const u8 OtherText_WithFourPhrases[] = _("4개의 단어로");
const u8 OtherText_CombineNinePhrasesPage1[] = _("9개의 단어를 조합해서");
const u8 OtherText_CombineNinePhrasesPage2[] = _("메시지를 만들자!");
const u8 OtherText_ImproveBardSongPage1[] = _("단어를 1개만 바꿔서");
const u8 OtherText_ImproveBardSongPage2[] = _("아저씨의 노래를 좋게 해보자!");
const u8 OtherText_YourProfile[] = _("프로필은 ");
const u8 OtherText_YourFeelingBattle[] = _("대전이 시작될 때의 기분");
const u8 OtherText_SetWinMessage[] = _("대전에서 이겼을 때의 인삿말");
const u8 OtherText_SetLossMessage[] = _("대전에서 졌을 때의 인삿말");
const u8 OtherText_TheAnswer[] = _("대답은");
const u8 OtherText_MailMessage[] = _("메일에 적을 내용은");
const u8 OtherText_MailSalutation[] = _("메모에 적을 인삿말은");
const u8 OtherText_NewSong[] = _("새로운 노래는");
const u8 OtherText_CombineTwoPhrasesPage1[] = _("2개의 단어를 조합해서");
const u8 OtherText_CombineTwoPhrasesPage2[] = _("유행시키고 싶은 말을 만들자!");
const u8 OtherText_ConfirmTrendyPage1[] = _("유행시키고 싶은 말은");
const u8 OtherText_ConfirmTrendyPage2[] = _("이 대답으로 하시겠습니까?");
const u8 OtherText_HipsterPage1[] = _("2개의 단어를 조합해서");
const u8 OtherText_HipsterPage2[] = _("좋은 말을 알려주자!");

const u8 gOtherText_TextDeletedConfirmPage1[] = _("편집 중인 단어를");
const u8 gOtherText_TextDeletedConfirmPage2[] = _("모두 지워도 괜찮겠습니까?");
const u8 gOtherText_QuitEditing[] = _("편집을 그만두겠습니까?");
const u8 gOtherText_EditedTextNoSavePage1[] = _("편집한 단어는 저장");
const u8 gOtherText_EditedTextNoSavePage2[] = _("되지 않습니다만 괜찮겠습니까?");
const u8 gOtherText_EnterAPhraseOrWord[] = _("단어를 넣어 주십시오!");
const u8 gOtherText_TextNoDelete[] = _("단어를 모두 지울 수 없습니다!");
const u8 gOtherText_OnlyOnePhrase[] = _("바꿀 수 있는 단어는 1개까지입니다!");
const u8 gOtherText_OriginalSongRestored[] = _("노래를 원래대로 되돌립니다!");
const u8 gOtherText_TrendyAlready[] = _("그건 이미 유행하고 있습니다!");
const u8 gOtherText_CombineTwoPhrases[] = _("2개의 단어를 조합해 주십시오!");
const u8 gOtherText_QuitGivingInfo[] = _("말을 알려주지 않겠습니까?");
const u8 gOtherText_StopGivingMail[] = _("메일 맡기기를 그만두겠습니까?");
const u8 gOtherText_Profile[] = _("프로필");
const u8 gOtherText_AtBattleStart[] = _("대전이 시작되었을 때");
const u8 gOtherText_UponWinningBattle[] = _("대전에서 이겼을 때");
const u8 gOtherText_UponLosingBattle[] = _("대전에서 졌을 때");


const u8 gOtherText_TheBardsSong[] = _("아저씨의 노래");
const u8 gOtherText_WhatsHipHappening[] = _("지금의 유행어");
const u8 gOtherText_Interview[] = _("인터뷰");
const u8 gOtherText_GoodSaying[] = _("좋은 말이지");
const u8 OtherText_SoPretty[] = _(" 아름답단 말이지!");
const u8 OtherText_SoDarling[] = _(" 귀엽단 말이지!");
const u8 OtherText_SoRelaxed[] = _(" 태평하단 말이지!");
const u8 OtherText_SoSunny[] = _(" 따끈하단 말이지!");
const u8 OtherText_SoDesirable[] = _(" 동경하게 돼!");
const u8 OtherText_SoExciting[] = _(" 두근두근하지!");
const u8 OtherText_SoAmusing[] = _(" 재밌단 말이지!");
const u8 OtherText_SoMagical[] = _(" 신기하단 말이지!");

const u8 gOtherText_Is[] = _("{K_EUNNEUN}");
const u8 gOtherText_DontYouAgree[] = _("\n그렇게 생각하지 않아?");

const u8 OtherText_WantVacationNicePlace[] = _("여행 가고 싶은데\n혹시 어디 멋진 곳 알고 있어?");
const u8 OtherText_BoughtCrayonsIsNice[] = _("120색 크레파스 샀지롱-\n부럽지?");
const u8 OtherText_IfWeCouldFloat[] = _("비눗방울을 타고 한번\n날아보고 싶어-");
const u8 OtherText_SandWashesAwayMakeSad[] = _("모래해변 위에 적은 글자는\n금세 사라지니깐 슬퍼-");
const u8 OtherText_WhatsBottomSeaLike[] = _("바다 깊은 곳은 어떨까?\n한 번이라도 좋으니깐 보고 싶어-");
const u8 OtherText_SeeSettingSun[] = _("저녁 노을을 보면\n집에 돌아가고 싶지 않아?");
const u8 OtherText_LyingInGreenGrass[] = _("초록색 잔디 위에서 뒹굴뒹굴하면\n기분 좋지 않아?");
const u8 OtherText_SecretBasesWonderful[] = _("비밀기지는 정말 좋지!\n뭔가 두근거리지 않아?");

const u8 OtherText_PokeLeague[] = _("포켓몬리그");
const u8 OtherText_PokeCenter[] = _("포켓몬센터");

const u8 gOtherText_GetsAPokeBlock[] = _("에게 포켓몬스넥을 주겠습니까?");

const u8 OtherText_Coolness[] = _("근사함");
const u8 OtherText_Beauty[] = _("아름다움");
const u8 OtherText_Cuteness[] = _("귀여움");
const u8 OtherText_Smartness[] = _("슬기로움");
const u8 OtherText_Toughness[] = _("강인함");

const u8 gOtherText_WasEnhanced[] = _("{K_IGA} 올랐다!");
const u8 gOtherText_NothingChanged[] = _("변함이 없다!");
const u8 gOtherText_WontEat[] = _("더 이상 먹지 않는다...");

const u8 gSystemText_SaveFailedBackupCheck[] = _("데이터를 쓸 수 없었습니다\n백업 메모리를 검사합니다...\n잠시 기다려 주십시오\n{COLOR RED}“1분 정도 걸립니다”");
const u8 gSystemText_BackupDamagedGameContinue[] = _("백업 기능이 고장났거나\n수명이 다 되었습니다\n기록은 할 수 없지만\n게임은 즐기실 수 있습니다");
const u8 gSystemText_GameplayEnded[] = _("{COLOR RED}“이 이상 모험을 계속할 수 없습니다\n타이틀 화면으로 돌아갑니다...”");
const u8 gSystemText_CheckCompleteSaveAttempt[] = _("검사가 종료되었습니다!\n다시 한 번 더 리포트를 작성합니다\n잠시 기다려 주십시오");
const u8 gSystemText_SaveCompletedGameEnd[] = _("리포트의 작성이 끝났습니다\n{COLOR RED}“이 이상 모험을 계속할 수 없습니다\n타이틀 화면으로 돌아갑니다...”");
const u8 gSystemText_SaveCompletedPressA[] = _("리포트의 작성이 끝났습니다\n{COLOR RED}“A 버튼을 눌러 주십시오”");

const u8 gOtherText_Ferry[] = _("연락선");
const u8 gOtherText_SecretBase[] = _("비밀기지");
const u8 gOtherText_Hideout[] = _("아지트");

const u8 gSystemText_ResetRTCPrompt[] = _("RTC를 리셋합니다\nA 버튼: 결정  B 버튼: 취소");
const u8 gSystemText_PresentTime[] = _("현재 게임 내 시간");
const u8 gSystemText_PreviousTime[] = _("지난번 게임 내 시간");
const u8 gSystemText_PleaseResetTime[] = _("시간을 재설정해 주십시오");
const u8 gSystemText_ClockResetDataSave[] = _("시간을 재설정했습니다\n리포트의 작성까지 기다려 주십시오");
const u8 gSystemText_SaveCompleted[] = _("리포트를 작성했습니다!");
const u8 gSystemText_SaveFailed[] = _("리포트를 작성하는 데\n실패했습니다...");
const u8 gSystemText_NoSaveFileNoTime[] = _("리포트가 없어서\n시간을 설정할 수 없습니다!");
const u8 gSystemText_ClockAdjustmentUsable[] = _("게임 내 시간 재생 시스템이\n다시 쓸 수 있게 되었습니다!");
const u8 gSystemText_Saving[] = _("포켓몬 리포트를 작성하고 있습니다...\n전원을 끄지 않도록 해주십시오");
