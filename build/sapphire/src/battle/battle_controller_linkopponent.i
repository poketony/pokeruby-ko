# 1 "src/battle/battle_controller_linkopponent.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/battle/battle_controller_linkopponent.c"
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
# 2 "src/battle/battle_controller_linkopponent.c" 2
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
# 3 "src/battle/battle_controller_linkopponent.c" 2
# 1 "include/battle_interface.h" 1



struct BattleInterfaceStruct1
{
    s32 unk0;
    s32 unk4;
    s32 unk8;
    u32 unkC_0:5;
    u32 unk10;
};

struct BattleInterfaceStruct2
{
    u16 unk0;
    u32 unk4;
};

u8 battle_make_oam_normal_battle(u8);
u8 battle_make_oam_safari_battle(void);
void sub_8043D84(u8, u8, u32, u32, u32);
void sub_8043DB0(u8);
void sub_8043DFC(u8);
void nullsub_11();
void sub_8043EB4(u8);
void sub_8043F44(u8);
void sub_804454C(void);
u8 sub_8044804(u8, const struct BattleInterfaceStruct2 *, u8, u8);
void sub_8044CA0(u8);
void sub_8045A5C(u8, struct Pokemon *, u8);
s32 sub_8045C78(u8, u8, u8, u8);
s16 sub_80460C8(struct BattleInterfaceStruct1 *, int *, u16 *, int);
u8 GetScaledHPFraction(s16, s16, u8);
u8 GetHPBarLevel(s16, s16);
void sub_80440EC(u8 a, s16 b, u8 c);
# 4 "src/battle/battle_controller_linkopponent.c" 2
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
# 5 "src/battle/battle_controller_linkopponent.c" 2
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
# 6 "src/battle/battle_controller_linkopponent.c" 2
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
# 7 "src/battle/battle_controller_linkopponent.c" 2
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
# 8 "src/battle/battle_controller_linkopponent.c" 2
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
# 9 "src/battle/battle_controller_linkopponent.c" 2
# 1 "include/rom_8077ABC.h" 1




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
# 6 "include/rom_8077ABC.h" 2

enum
{
    ANIM_BANK_ATK,
    ANIM_BANK_DEF,
    ANIM_BANK_ATK_PARTNER,
    ANIM_BANK_DEF_PARTNER
};

u8 sub_8077ABC(u8, u8);
u8 sub_8077E44(u8 slot, u16 species, u8 a3);
u8 GetAnimBankSpriteId(u8 side);
void StoreSpriteCallbackInData(struct Sprite *sprite, void(*callback)(struct Sprite *));
void sub_8078314(struct Sprite *sprite);
void sub_8078364(struct Sprite *sprite);
void sub_8078458(struct Sprite *sprite);
void sub_80784A8(struct Sprite *sprite);
u8 GetBankSide(u8);
u8 GetBankSide(u8);
u8 GetBankSide(u8 side);
u8 GetBankSide(u8 slot);
u8 GetBankSide(u8);
u8 GetBankIdentity(u8);
u8 GetBankIdentity(u8 slot);
u8 GetBankByPlayerAI(u8);
u8 GetBankByPlayerAI(u8);
u8 GetBankByPlayerAI(u8 state);
u8 AnimBankSpriteExists(u8);
bool8 AnimBankSpriteExists(u8);
bool8 IsDoubleBattle();
u8 IsDoubleBattle(void);
bool8 IsDoubleBattle(void);
void sub_8078914();
u8 sub_80789BC();
void sub_8078A5C(struct Sprite *sprite);
void sub_8078A5C(struct Sprite *sprite);
void obj_translate_based_on_private_1_2_3_4(struct Sprite *sprite);
bool8 sub_8078B5C(struct Sprite *sprite);
void sub_8078BB8(struct Sprite *sprite);
void sub_8078D44(struct Sprite *sprite);
void obj_id_set_rotscale(u8 sprite, s16, s16, u16);
bool8 sub_8078E38();
void sub_8078E70(u8 sprite, u8);
void sub_8078F40(u8 sprite);
void sub_8078F9C(u8 sprite);
void sub_8079518(struct Sprite *sprite);
void sub_80796F8(u8 task);
void sub_80797EC(struct Task *task);
void sub_8079814(u8 taskId);
void sub_8079A64(u8 sprite);
u16 sub_8079B10(u8 sprite);
void sub_8079BF4(s16 *bottom, s16 *top, void *ptr);
void *sub_8079BFC(s16 bottom, s16 top);
void sub_8079E24();
u8 sub_8079E90(u8 slot);
u8 GetBankIdentity_permutated(u8 slot);
void sub_807A784(u8 taskId);
void sub_807A850(struct Task *task, u8 taskId);
void sub_807A8D4(struct Sprite *sprite);
void sub_807A960(struct Sprite *sprite);
void sub_8078A34(struct Sprite *sprite);
void sub_80787B0(struct Sprite *sprite, u8);
void sub_8078764(struct Sprite *sprite, u8);
void sub_8078B34(struct Sprite *sprite);
void sub_8078D60(struct Sprite *sprite);
void sub_80786EC(struct Sprite *sprite);
void sub_80782D8(struct Sprite *sprite);
void sub_8078CC0(struct Sprite *sprite);
void sub_8078600(struct Sprite *sprite);
void sub_8078504(struct Sprite *sprite);
void sub_807861C(struct Sprite *sprite);
void sub_8078650(struct Sprite *sprite);
void sub_8078394(struct Sprite *sprite);
void sub_80785E4(struct Sprite *sprite);
void sub_8078278(struct Sprite *sprite);
void sub_8078C00(struct Sprite *sprite);
void sub_8078114(struct Sprite *sprite);
void sub_80793C4(struct Sprite *sprite);
void sub_807A3FC(u8 slot, u8 a2, s16 *a3, s16 *a4);
u8 sub_8079ED4(u8 slot);
int sub_807A100(u8 slot, u8 a2);
u16 sub_80790F0(s16 a, s16 b);
void sub_8078FDC(struct Sprite *sprite, bool8 a2, s16 xScale, s16 yScale, u16 rotation);
void sub_807867C(struct Sprite *sprite, s16 a2);
u8 sub_8077EE4(u8 slot, u8 a2);
u32 sub_80791A8(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7);
u32 sub_80792C0(u8 a1, u8 a2, u8 a3, u8 a4);
s16 duplicate_obj_of_side_rel2move_in_transparent_mode(u8 a1);
void obj_delete_but_dont_free_vram(struct Sprite *sprite);
void sub_8079108(u16 a1, bool8 a2);
void sub_80798F4(struct Task *task, u8 a2, void *a3);
bool8 sub_807992C(struct Task *task);
u8 sub_8077FC0(u8 slot);
void move_anim_8074EE0(struct Sprite *sprite);
bool8 sub_8078718(struct Sprite *sprite);
bool8 sub_8078CE8(struct Sprite *sprite);
# 10 "src/battle/battle_controller_linkopponent.c" 2
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
# 11 "src/battle/battle_controller_linkopponent.c" 2
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
# 12 "src/battle/battle_controller_linkopponent.c" 2
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
# 13 "src/battle/battle_controller_linkopponent.c" 2
# 1 "include/sprite.h" 1
# 14 "src/battle/battle_controller_linkopponent.c" 2
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
# 15 "src/battle/battle_controller_linkopponent.c" 2
# 1 "include/task.h" 1
# 16 "src/battle/battle_controller_linkopponent.c" 2
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
# 17 "src/battle/battle_controller_linkopponent.c" 2
# 1 "include/util.h" 1





extern const u8 gMiscBlank_Gfx[];
extern const u32 gBitTable[];

u8 CreateInvisibleSpriteWithCallback(void (*)(struct Sprite *));
void StoreWordInTwoHalfwords(u16 *, u32);
void LoadWordFromTwoHalfwords(u16 *, u32 *);
u16 CalcCRC16(u8 *data, int length);
void DoBgAffineSet(struct BgAffineDstData *dest, u32 texX, u32 texY, s16 scrX, s16 scrY, s16 sx, s16 sy, u16 alpha);
# 18 "src/battle/battle_controller_linkopponent.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 19 "src/battle/battle_controller_linkopponent.c" 2

struct UnknownStruct3
{
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;
};

extern u8 gActiveBank;
extern u8 gBattleBufferA[][0x200];
extern u8 gObjectBankIDs[];
extern u16 gBattlePartyID[];
extern u8 gHealthboxIDs[];
extern u16 gBattleTypeFlags;
extern u8 gBattleMonForms[];
extern void (*gBattleBankFunc[])(void);
extern u32 *gDisableStructMoveAnim;
extern u32 gMoveDmgMoveAnim;
extern u16 gMovePowerMoveAnim;
extern u8 gHappinessMoveAnim;
extern u16 gWeatherMoveAnim;
extern u32 gPID_perBank[];
extern u8 gAnimScriptActive;
extern void (*gAnimScriptCallback)(void);
extern u8 gDisplayedStringBattle[];
extern bool8 gDoingBattleAnim;
extern u8 gBattleOutcome;
extern u16 gUnknown_02024DE8;
extern u8 gUnknown_02024E68[];
extern struct SpriteTemplate gUnknown_02024E8C;
extern u8 gUnknown_0202F7C4;
extern struct Window gUnknown_03004210;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;
extern u8 gUnknown_0300434C[];
extern u32 gBattleExecBuffer;
extern MainCallback gPreBattleCallback1;
extern struct MusicPlayerInfo gMPlay_BGM;

extern u8 sub_8077F68();
extern u8 sub_8079E90();
extern u8 GetBankIdentity(u8);
extern void BattleLoadOpponentMonSprite(struct Pokemon *, u8);
extern void sub_8037A74(void);
extern void sub_8032984(u8, u16);
extern void sub_8037E30(void);
extern void sub_80312F0(struct Sprite *);
extern u8 sub_8046400();
extern void sub_8032A08();
extern void sub_8043DB0();
extern void sub_8037BBC(void);
extern s32 sub_803FC34(u16);
extern void sub_8031A6C(u16, u8);
extern void sub_80313A0(struct Sprite *);
extern void sub_803757C(void);
extern void oamt_add_pos2_onto_pos1();
extern void StoreSpriteCallbackInData();
extern void sub_8078B34(struct Sprite *);
extern void sub_80375B4(void);
extern void sub_8010384(struct Sprite *);
extern void sub_8037B78(void);
extern u8 sub_8031720();
extern bool8 mplay_80342A4(u8);
extern void ExecuteMoveAnim();
extern void sub_80326EC();
extern void sub_8031F24(void);
extern void sub_80324BC();
extern void BufferStringBattle();
extern void sub_8037C2C(void);
extern void sub_8043D84();
extern void sub_8037B24(void);
extern void sub_8045A5C();
extern void sub_8037FAC(void);
extern void move_anim_start_t2_for_situation();
extern void dp01t_0F_4_move_anim(void);
extern void sub_8047858();
extern u8 GetBankSide(u8);
extern void sub_80E43C0();
extern void sub_803A3A8(struct Sprite *);
extern void sub_8044CA0(u8);
extern void nullsub_47(void);
extern bool8 IsDoubleBattle(void);
extern void sub_8037840(void);
extern void sub_8031B74();
extern u8 AnimBankSpriteExists();
extern u8 move_anim_start_t3();
extern void sub_8037FD8(void);
extern void sub_8037F34(void);
extern void LinkOpponentBufferExecCompleted(void);
extern void sub_8141828();
extern void sub_804777C();



u32 dp01_getattr_by_ch1_for_player_pokemon__(u8, u8 *);
void sub_803752C(void);
void sub_8037D2C(void);
void sub_8038900(u8);
void sub_8039430(u8, u8);
void sub_8039648(void);
void sub_8039B64(void);
void sub_803A2C4(u8);
void sub_803A4E0(void);

void LinkOpponentHandleGetAttributes(void);
void LinkOpponentHandlecmd1(void);
void LinkOpponentHandleSetAttributes(void);
void LinkOpponentHandlecmd3(void);
void LinkOpponentHandleLoadPokeSprite(void);
void LinkOpponentHandleSendOutPoke(void);
void LinkOpponentHandleReturnPokeToBall(void);
void LinkOpponentHandleTrainerThrow(void);
void LinkOpponentHandleTrainerSlide(void);
void LinkOpponentHandleTrainerSlideBack(void);
void LinkOpponentHandlecmd10(void);
void LinkOpponentHandlecmd11(void);
void LinkOpponentHandlecmd12(void);
void LinkOpponentHandleBallThrow(void);
void LinkOpponentHandlePuase(void);
void LinkOpponentHandleMoveAnimation(void);
void LinkOpponentHandlePrintString(void);
void LinkOpponentHandlePrintStringPlayerOnly(void);
void LinkOpponentHandlecmd18(void);
void LinkOpponentHandlecmd19(void);
void LinkOpponentHandlecmd20(void);
void LinkOpponentHandleOpenBag(void);
void LinkOpponentHandlecmd22(void);
void LinkOpponentHandlecmd23(void);
void LinkOpponentHandleHealthBarUpdate(void);
void LinkOpponentHandleExpBarUpdate(void);
void LinkOpponentHandleStatusIconUpdate(void);
void LinkOpponentHandleStatusAnimation(void);
void LinkOpponentHandleStatusXor(void);
void LinkOpponentHandlecmd29(void);
void LinkOpponentHandleDMATransfer(void);
void LinkOpponentHandlecmd31(void);
void LinkOpponentHandlecmd32(void);
void LinkOpponentHandlecmd33(void);
void LinkOpponentHandlecmd34(void);
void LinkOpponentHandlecmd35(void);
void LinkOpponentHandlecmd36(void);
void LinkOpponentHandlecmd37(void);
void LinkOpponentHandlecmd38(void);
void LinkOpponentHandlecmd39(void);
void LinkOpponentHandlecmd40(void);
void LinkOpponentHandleHitAnimation(void);
void LinkOpponentHandlecmd42(void);
void LinkOpponentHandleEffectivenessSound(void);
void LinkOpponentHandlecmd44(void);
void LinkOpponentHandleFaintingCry(void);
void LinkOpponentHandleIntroSlide(void);
void LinkOpponentHandleTrainerBallThrow(void);
void LinkOpponentHandlecmd48(void);
void LinkOpponentHandlecmd49(void);
void LinkOpponentHandlecmd50(void);
void LinkOpponentHandleSpriteInvisibility(void);
void LinkOpponentHandleBattleAnimation(void);
void LinkOpponentHandleLinkStandbyMsg(void);
void LinkOpponentHandleResetActionMoveSelection(void);
void LinkOpponentHandlecmd55(void);
void LinkOpponentHandlecmd56(void);



typedef void (*BattleBufferCmd) (void);
const BattleBufferCmd gLinkOpponentBufferCommands[] =
{
    LinkOpponentHandleGetAttributes,
    LinkOpponentHandlecmd1,
    LinkOpponentHandleSetAttributes,
    LinkOpponentHandlecmd3,
    LinkOpponentHandleLoadPokeSprite,
    LinkOpponentHandleSendOutPoke,
    LinkOpponentHandleReturnPokeToBall,
    LinkOpponentHandleTrainerThrow,
    LinkOpponentHandleTrainerSlide,
    LinkOpponentHandleTrainerSlideBack,
    LinkOpponentHandlecmd10,
    LinkOpponentHandlecmd11,
    LinkOpponentHandlecmd12,
    LinkOpponentHandleBallThrow,
    LinkOpponentHandlePuase,
    LinkOpponentHandleMoveAnimation,
    LinkOpponentHandlePrintString,
    LinkOpponentHandlePrintStringPlayerOnly,
    LinkOpponentHandlecmd18,
    LinkOpponentHandlecmd19,
    LinkOpponentHandlecmd20,
    LinkOpponentHandleOpenBag,
    LinkOpponentHandlecmd22,
    LinkOpponentHandlecmd23,
    LinkOpponentHandleHealthBarUpdate,
    LinkOpponentHandleExpBarUpdate,
    LinkOpponentHandleStatusIconUpdate,
    LinkOpponentHandleStatusAnimation,
    LinkOpponentHandleStatusXor,
    LinkOpponentHandlecmd29,
    LinkOpponentHandleDMATransfer,
    LinkOpponentHandlecmd31,
    LinkOpponentHandlecmd32,
    LinkOpponentHandlecmd33,
    LinkOpponentHandlecmd34,
    LinkOpponentHandlecmd35,
    LinkOpponentHandlecmd36,
    LinkOpponentHandlecmd37,
    LinkOpponentHandlecmd38,
    LinkOpponentHandlecmd39,
    LinkOpponentHandlecmd40,
    LinkOpponentHandleHitAnimation,
    LinkOpponentHandlecmd42,
    LinkOpponentHandleEffectivenessSound,
    LinkOpponentHandlecmd44,
    LinkOpponentHandleFaintingCry,
    LinkOpponentHandleIntroSlide,
    LinkOpponentHandleTrainerBallThrow,
    LinkOpponentHandlecmd48,
    LinkOpponentHandlecmd49,
    LinkOpponentHandlecmd50,
    LinkOpponentHandleSpriteInvisibility,
    LinkOpponentHandleBattleAnimation,
    LinkOpponentHandleLinkStandbyMsg,
    LinkOpponentHandleResetActionMoveSelection,
    LinkOpponentHandlecmd55,
    LinkOpponentHandlecmd56
};



void nullsub_47(void)
{
}

void SetBankFuncToLinkOpponentBufferRunCommand(void)
{
    gBattleBankFunc[gActiveBank] = sub_803752C;
}

void sub_803752C(void)
{
    if (gBattleExecBuffer & gBitTable[gActiveBank])
    {
        if (gBattleBufferA[gActiveBank][0] <= 0x38)
            gLinkOpponentBufferCommands[gBattleBufferA[gActiveBank][0]]();
        else
            LinkOpponentBufferExecCompleted();
    }
}

void sub_803757C(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].callback == SpriteCallbackDummy)
        LinkOpponentBufferExecCompleted();
}

void sub_80375B4(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].callback == SpriteCallbackDummy)
    {
        sub_8031B74(gSprites[gObjectBankIDs[gActiveBank]].oam.affineParam);
        gSprites[gObjectBankIDs[gActiveBank]].oam.tileNum = gSprites[gObjectBankIDs[gActiveBank]].data[5];
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8037644(void)
{
    if ((--((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk9) == 0xFF)
    {
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk9 = 0;
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8037680(void)
{
    bool8 r6 = 0;

    if (!IsDoubleBattle() || (IsDoubleBattle() && (gBattleTypeFlags & 0x0040)))
    {
        if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy)
            r6 = 1;
    }
    else
    {
        if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy
         && gSprites[gHealthboxIDs[gActiveBank ^ 2]].callback == SpriteCallbackDummy)
            r6 = 1;
    }
    if (IsCryPlayingOrClearCrySongs())
        r6 = 0;

    if (r6)
    {
        if (GetBankIdentity(gActiveBank) == 1)
        {
            if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk1_0 || !((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank ^ 2].unk1_0)
                return;
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_7 = 0;
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk1_0 = 0;
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank ^ 2].unk0_7 = 0;
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank ^ 2].unk1_0 = 0;
            FreeSpriteTilesByTag(0x27F9);
            FreeSpritePaletteByTag(0x27F9);
        }
        if (gBattleTypeFlags & 0x0040)
        {
            if (GetBankIdentity(gActiveBank) == 1)
                m4aMPlayContinue(&gMPlay_BGM);
        }
        else
        {
            m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 256);
        }
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk9 = 3;
        gBattleBankFunc[gActiveBank] = sub_8037644;
    }
}

void sub_8037840(void)
{
    if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_3 && !((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_7)
        sub_8141828(gActiveBank, &gEnemyParty[gBattlePartyID[gActiveBank]]);
    if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank ^ 2].unk0_3 && !((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank ^ 2].unk0_7)
        sub_8141828(gActiveBank ^ 2, &gEnemyParty[gBattlePartyID[gActiveBank ^ 2]]);
    if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_3 && !((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank ^ 2].unk0_3)
    {
        if ((gBattleTypeFlags & 0x0040) && GetBankIdentity(gActiveBank) == 3)
        {
            if (++((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk9 == 1)
                return;
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk9 = 0;
        }
        if (IsDoubleBattle() && !(gBattleTypeFlags & 0x0040))
        {
            DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank ^ 2]]);
            sub_8045A5C(
              gHealthboxIDs[gActiveBank ^ 2],
              &gEnemyParty[gBattlePartyID[gActiveBank ^ 2]],
              0);
            sub_804777C(gActiveBank ^ 2);
            sub_8043DFC(gHealthboxIDs[gActiveBank ^ 2]);
            sub_8032984(
              gActiveBank ^ 2,
              GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank ^ 2]], 11));
        }
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank]]);
        sub_8045A5C(
          gHealthboxIDs[gActiveBank],
          &gEnemyParty[gBattlePartyID[gActiveBank]],
          0);
        sub_804777C(gActiveBank);
        sub_8043DFC(gHealthboxIDs[gActiveBank]);
        sub_8032984(
          gActiveBank,
          GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], 11));

        (*(struct Struct2017840 *) (gSharedMem + 0x17840)).unk9_0 = 0;
        gBattleBankFunc[gActiveBank] = sub_8037680;
    }
}

void sub_8037A74(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].animEnded == 1
     && gSprites[gObjectBankIDs[gActiveBank]].pos2.x == 0)
    {
        if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_7)
        {
            sub_8141828(gActiveBank, &gEnemyParty[gBattlePartyID[gActiveBank]]);
            return;
        }
        if (((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk1_0)
        {
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_7 = 0;
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk1_0 = 0;
            FreeSpriteTilesByTag(0x27F9);
            FreeSpritePaletteByTag(0x27F9);
            LinkOpponentBufferExecCompleted();
            return;
        }
    }
}

void sub_8037B24(void)
{
    s16 r4 = sub_8045C78(gActiveBank, gHealthboxIDs[gActiveBank], 0, 0);

    sub_8043DFC(gHealthboxIDs[gActiveBank]);
    if (r4 != -1)
        sub_80440EC(gHealthboxIDs[gActiveBank], r4, 0);
    else
        LinkOpponentBufferExecCompleted();
}

void sub_8037B78(void)
{
    if (!gSprites[gObjectBankIDs[gActiveBank]].inUse)
    {
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8037BBC(void)
{
    if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_6)
    {
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        sub_8032A08(gActiveBank);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8037C2C(void)
{
    if (gUnknown_03004210.state == 0)
        LinkOpponentBufferExecCompleted();
}

void dp01t_0F_4_move_anim(void)
{
    u8 spriteId = gObjectBankIDs[gActiveBank];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = 0;
        gDoingBattleAnim = 0;
        LinkOpponentBufferExecCompleted();
    }
    else
    {
        if (((u16)gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        gSprites[spriteId].data[1]++;
    }
}

void sub_8037CC0(void)
{
    if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy)
    {
        if (((struct Struct2017800 *) (gSharedMem + 0x17800))[gActiveBank].substituteSprite)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 6);
        gBattleBankFunc[gActiveBank] = sub_8037D2C;
    }
}

void sub_8037D2C(void)
{
    if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_6)
    {
        CreateTask(c3_0802FDF4, 10);
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8037D64(void)
{
    if (((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk1_0)
    {
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_7 = 0;
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk1_0 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        StartSpriteAnim(&gSprites[gObjectBankIDs[gActiveBank]], 0);
        sub_8045A5C(
          gHealthboxIDs[gActiveBank],
          &gEnemyParty[gBattlePartyID[gActiveBank]],
          0);
        sub_804777C(gActiveBank);
        sub_8043DFC(gHealthboxIDs[gActiveBank]);
        sub_8031F88(gActiveBank);
        gBattleBankFunc[gActiveBank] = sub_8037CC0;
    }
}

void sub_8037E30(void)
{
    if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_3 && !((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_7)
        sub_8141828(gActiveBank, &gEnemyParty[gBattlePartyID[gActiveBank]]);
    if (gSprites[gUnknown_0300434C[gActiveBank]].callback == SpriteCallbackDummy
     && !((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_3)
    {
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank]]);
        sub_8032984(gActiveBank, GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], 11));
        gBattleBankFunc[gActiveBank] = sub_8037D64;
    }
}

void sub_8037EF0(void)
{
    if (gReceivedRemoteLinkPlayers == 0)
    {
        m4aSongNumStop(SE_HINSI);
        gMain.inBattle = 0;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(c2_8011A1C);
    }
}

void sub_8037F34(void)
{
    if (!gPaletteFade.active)
    {
        if (gBattleTypeFlags & 0x0002)
        {
            sub_800832C();
            gBattleBankFunc[gActiveBank] = sub_8037EF0;
        }
        else
        {
            m4aSongNumStop(SE_HINSI);
            gMain.inBattle = 0;
            gMain.callback1 = gPreBattleCallback1;
            SetMainCallback2(gMain.savedCallback);
        }
    }
}

void sub_8037FAC(void)
{
    if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_4)
        LinkOpponentBufferExecCompleted();
}

void sub_8037FD8(void)
{
    if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_5)
        LinkOpponentBufferExecCompleted();
}

void LinkOpponentBufferExecCompleted(void)
{
    gBattleBankFunc[gActiveBank] = sub_803752C;
    if (gBattleTypeFlags & 0x0002)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(2, 4, &playerId);
        gBattleBufferA[gActiveBank][0] = 0x38;
    }
    else
    {
        gBattleExecBuffer &= ~gBitTable[gActiveBank];
    }
}

void LinkOpponentHandleGetAttributes(void)
{
    u8 buffer[0x100];
    u32 r6 = 0;
    u8 r4;
    s32 i;

    if (gBattleBufferA[gActiveBank][2] == 0)
    {
        r6 = dp01_getattr_by_ch1_for_player_pokemon__(gBattlePartyID[gActiveBank], buffer);
    }
    else
    {
        r4 = gBattleBufferA[gActiveBank][2];
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                r6 += dp01_getattr_by_ch1_for_player_pokemon__(i, buffer + r6);
            r4 >>= 1;
        }
    }
    Emitcmd29(1, r6, buffer);
    LinkOpponentBufferExecCompleted();
}

u32 dp01_getattr_by_ch1_for_player_pokemon__(u8 a, u8 *buffer)
{
    struct BattlePokemon battlePokemon;
    struct UnknownStruct3 moveData;
    u8 nickname[20];
    u8 *src;
    s16 data16;
    u32 data32;
    s32 size = 0;

    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        battlePokemon.species = GetMonData(&gEnemyParty[a], 11);
        battlePokemon.item = GetMonData(&gEnemyParty[a], 12);
        for (size = 0; size < 4; size++)
        {
            battlePokemon.moves[size] = GetMonData(&gEnemyParty[a], 13 + size);
            battlePokemon.pp[size] = GetMonData(&gEnemyParty[a], 17 + size);
        }
        battlePokemon.ppBonuses = GetMonData(&gEnemyParty[a], 21);
        battlePokemon.friendship = GetMonData(&gEnemyParty[a], 32);
        battlePokemon.experience = GetMonData(&gEnemyParty[a], 25);
        battlePokemon.hpIV = GetMonData(&gEnemyParty[a], 39);
        battlePokemon.attackIV = GetMonData(&gEnemyParty[a], 40);
        battlePokemon.defenseIV = GetMonData(&gEnemyParty[a], 41);
        battlePokemon.speedIV = GetMonData(&gEnemyParty[a], 42);
        battlePokemon.spAttackIV = GetMonData(&gEnemyParty[a], 43);
        battlePokemon.spDefenseIV = GetMonData(&gEnemyParty[a], 44);
        battlePokemon.personality = GetMonData(&gEnemyParty[a], 0);
        battlePokemon.status1 = GetMonData(&gEnemyParty[a], 55);
        battlePokemon.level = GetMonData(&gEnemyParty[a], 56);
        battlePokemon.hp = GetMonData(&gEnemyParty[a], 57);
        battlePokemon.maxHP = GetMonData(&gEnemyParty[a], 58);
        battlePokemon.attack = GetMonData(&gEnemyParty[a], 59);
        battlePokemon.defense = GetMonData(&gEnemyParty[a], 60);
        battlePokemon.speed = GetMonData(&gEnemyParty[a], 61);
        battlePokemon.spAttack = GetMonData(&gEnemyParty[a], 62);
        battlePokemon.spDefense = GetMonData(&gEnemyParty[a], 63);
        battlePokemon.isEgg = GetMonData(&gEnemyParty[a], 45);
        battlePokemon.altAbility = GetMonData(&gEnemyParty[a], 46);
        battlePokemon.otId = GetMonData(&gEnemyParty[a], 1);
        GetMonData(&gEnemyParty[a], 2, nickname);
        StringCopy10(battlePokemon.nickname, nickname);
        GetMonData(&gEnemyParty[a], 7, battlePokemon.otName);

        { src = (u8 *)&battlePokemon; for(size = 0; size < (u32)sizeof(battlePokemon); size++) buffer[size] = src[size]; };
        break;
    case 1:
        data16 = GetMonData(&gEnemyParty[a], 11);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 2:
        data16 = GetMonData(&gEnemyParty[a], 12);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 3:
        for (size = 0; size < 4; size++)
        {
            moveData.moves[size] = GetMonData(&gEnemyParty[a], 13 + size);
            moveData.pp[size] = GetMonData(&gEnemyParty[a], 17 + size);
        }
        moveData.ppBonuses = GetMonData(&gEnemyParty[a], 21);
        { src = (u8 *)&moveData; for(size = 0; size < (u32)sizeof(moveData); size++) buffer[size] = src[size]; };
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        data16 = GetMonData(&gEnemyParty[a], 13 + gBattleBufferA[gActiveBank][1] - 4);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 8:
        for (size = 0; size < 4; size++)
            buffer[size] = GetMonData(&gEnemyParty[a], 17 + size);
        buffer[size] = GetMonData(&gEnemyParty[a], 21);
        size++;
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        buffer[0] = GetMonData(&gEnemyParty[a], 17 + gBattleBufferA[gActiveBank][1] - 9);
        size = 1;
        break;
    case 17:
        data32 = GetMonData(&gEnemyParty[a], 1);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case 18:
        data32 = GetMonData(&gEnemyParty[a], 25);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case 19:
        buffer[0] = GetMonData(&gEnemyParty[a], 26);
        size = 1;
        break;
    case 20:
        buffer[0] = GetMonData(&gEnemyParty[a], 27);
        size = 1;
        break;
    case 21:
        buffer[0] = GetMonData(&gEnemyParty[a], 28);
        size = 1;
        break;
    case 22:
        buffer[0] = GetMonData(&gEnemyParty[a], 29);
        size = 1;
        break;
    case 23:
        buffer[0] = GetMonData(&gEnemyParty[a], 30);
        size = 1;
        break;
    case 24:
        buffer[0] = GetMonData(&gEnemyParty[a], 31);
        size = 1;
        break;
    case 25:
        buffer[0] = GetMonData(&gEnemyParty[a], 32);
        size = 1;
        break;
    case 26:
        buffer[0] = GetMonData(&gEnemyParty[a], 34);
        size = 1;
        break;
    case 27:
        buffer[0] = GetMonData(&gEnemyParty[a], 35);
        size = 1;
        break;
    case 28:
        buffer[0] = GetMonData(&gEnemyParty[a], 36);
        size = 1;
        break;
    case 29:
        buffer[0] = GetMonData(&gEnemyParty[a], 37);
        size = 1;
        break;
    case 30:
        buffer[0] = GetMonData(&gEnemyParty[a], 38);
        size = 1;
        break;
    case 31:
        buffer[0] = GetMonData(&gEnemyParty[a], 39);
        buffer[1] = GetMonData(&gEnemyParty[a], 40);
        buffer[2] = GetMonData(&gEnemyParty[a], 41);
        buffer[3] = GetMonData(&gEnemyParty[a], 42);
        buffer[4] = GetMonData(&gEnemyParty[a], 43);
        buffer[5] = GetMonData(&gEnemyParty[a], 44);
        size = 6;
        break;
    case 32:
        buffer[0] = GetMonData(&gEnemyParty[a], 39);
        size = 1;
        break;
    case 33:
        buffer[0] = GetMonData(&gEnemyParty[a], 40);
        size = 1;
        break;
    case 34:
        buffer[0] = GetMonData(&gEnemyParty[a], 41);
        size = 1;
        break;
    case 35:
        buffer[0] = GetMonData(&gEnemyParty[a], 42);
        size = 1;
        break;
    case 36:
        buffer[0] = GetMonData(&gEnemyParty[a], 43);
        size = 1;
        break;
    case 37:
        buffer[0] = GetMonData(&gEnemyParty[a], 44);
        size = 1;
        break;
    case 38:
        data32 = GetMonData(&gEnemyParty[a], 0);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        buffer[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case 39:
        data16 = GetMonData(&gEnemyParty[a], 9);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 40:
        data32 = GetMonData(&gEnemyParty[a], 55);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        buffer[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case 41:
        buffer[0] = GetMonData(&gEnemyParty[a], 56);
        size = 1;
        break;
    case 42:
        data16 = GetMonData(&gEnemyParty[a], 57);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 43:
        data16 = GetMonData(&gEnemyParty[a], 58);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 44:
        data16 = GetMonData(&gEnemyParty[a], 59);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 45:
        data16 = GetMonData(&gEnemyParty[a], 60);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 46:
        data16 = GetMonData(&gEnemyParty[a], 61);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 47:
        data16 = GetMonData(&gEnemyParty[a], 62);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 48:
        data16 = GetMonData(&gEnemyParty[a], 63);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 49:
        buffer[0] = GetMonData(&gEnemyParty[a], 22);
        size = 1;
        break;
    case 50:
        buffer[0] = GetMonData(&gEnemyParty[a], 23);
        size = 1;
        break;
    case 51:
        buffer[0] = GetMonData(&gEnemyParty[a], 24);
        size = 1;
        break;
    case 52:
        buffer[0] = GetMonData(&gEnemyParty[a], 33);
        size = 1;
        break;
    case 53:
        buffer[0] = GetMonData(&gEnemyParty[a], 47);
        size = 1;
        break;
    case 54:
        buffer[0] = GetMonData(&gEnemyParty[a], 48);
        size = 1;
        break;
    case 55:
        buffer[0] = GetMonData(&gEnemyParty[a], 50);
        size = 1;
        break;
    case 56:
        buffer[0] = GetMonData(&gEnemyParty[a], 51);
        size = 1;
        break;
    case 57:
        buffer[0] = GetMonData(&gEnemyParty[a], 52);
        size = 1;
        break;
    case 58:
        buffer[0] = GetMonData(&gEnemyParty[a], 53);
        size = 1;
        break;
    case 59:
        buffer[0] = GetMonData(&gEnemyParty[a], 54);
        size = 1;
        break;
    }
    return size;
}

void LinkOpponentHandlecmd1(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleSetAttributes(void)
{
    u8 i;
    u8 r4;

    if (gBattleBufferA[gActiveBank][2] == 0)
    {
        sub_8038900(gBattlePartyID[gActiveBank]);
    }
    else
    {
        r4 = gBattleBufferA[gActiveBank][2];
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                sub_8038900(i);
            r4 >>= 1;
        }
    }
    LinkOpponentBufferExecCompleted();
}

void sub_8038900(u8 a)
{
    struct BattlePokemon *battlePokemon = (struct BattlePokemon *)&gBattleBufferA[gActiveBank][3];
    struct UnknownStruct3 *moveData = (struct UnknownStruct3 *)&gBattleBufferA[gActiveBank][3];
    s32 i;

    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        {
            u8 iv;

            SetMonData(&gEnemyParty[a], 11, &battlePokemon->species);
            SetMonData(&gEnemyParty[a], 12, &battlePokemon->item);
            for (i = 0; i < 4; i++)
            {
                SetMonData(&gEnemyParty[a], 13 + i, &battlePokemon->moves[i]);
                SetMonData(&gEnemyParty[a], 17 + i, &battlePokemon->pp[i]);
            }
            SetMonData(&gEnemyParty[a], 21, &battlePokemon->ppBonuses);
            SetMonData(&gEnemyParty[a], 32, &battlePokemon->friendship);
            SetMonData(&gEnemyParty[a], 25, &battlePokemon->experience);
            iv = battlePokemon->hpIV;
            SetMonData(&gEnemyParty[a], 39, &iv);
            iv = battlePokemon->attackIV;
            SetMonData(&gEnemyParty[a], 40, &iv);
            iv = battlePokemon->defenseIV;
            SetMonData(&gEnemyParty[a], 41, &iv);
            iv = battlePokemon->speedIV;
            SetMonData(&gEnemyParty[a], 42, &iv);
            iv = battlePokemon->spAttackIV;
            SetMonData(&gEnemyParty[a], 43, &iv);
            iv = battlePokemon->spDefenseIV;
            SetMonData(&gEnemyParty[a], 44, &iv);
            SetMonData(&gEnemyParty[a], 0, &battlePokemon->personality);
            SetMonData(&gEnemyParty[a], 55, &battlePokemon->status1);
            SetMonData(&gEnemyParty[a], 56, &battlePokemon->level);
            SetMonData(&gEnemyParty[a], 57, &battlePokemon->hp);
            SetMonData(&gEnemyParty[a], 58, &battlePokemon->maxHP);
            SetMonData(&gEnemyParty[a], 59, &battlePokemon->attack);
            SetMonData(&gEnemyParty[a], 60, &battlePokemon->defense);
            SetMonData(&gEnemyParty[a], 61, &battlePokemon->speed);
            SetMonData(&gEnemyParty[a], 62, &battlePokemon->spAttack);
            SetMonData(&gEnemyParty[a], 63, &battlePokemon->spDefense);
        }
        break;
    case 1:
        SetMonData(&gEnemyParty[a], 11, &gBattleBufferA[gActiveBank][3]);
        break;
    case 2:
        SetMonData(&gEnemyParty[a], 12, &gBattleBufferA[gActiveBank][3]);
        break;
    case 3:
        for (i = 0; i < 4; i++)
        {
            SetMonData(&gEnemyParty[a], 13 + i, &moveData->moves[i]);
            SetMonData(&gEnemyParty[a], 17 + i, &moveData->pp[i]);
        }
        SetMonData(&gEnemyParty[a], 21, &moveData->ppBonuses);
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        SetMonData(&gEnemyParty[a], 13 + gBattleBufferA[gActiveBank][1] - 4, &gBattleBufferA[gActiveBank][3]);
        break;
    case 8:
        SetMonData(&gEnemyParty[a], 17, &gBattleBufferA[gActiveBank][3]);
        SetMonData(&gEnemyParty[a], 18, &gBattleBufferA[gActiveBank][4]);
        SetMonData(&gEnemyParty[a], 19, &gBattleBufferA[gActiveBank][5]);
        SetMonData(&gEnemyParty[a], 20, &gBattleBufferA[gActiveBank][6]);
        SetMonData(&gEnemyParty[a], 21, &gBattleBufferA[gActiveBank][7]);
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        SetMonData(&gEnemyParty[a], 17 + gBattleBufferA[gActiveBank][1] - 9, &gBattleBufferA[gActiveBank][3]);
        break;
    case 17:
        SetMonData(&gEnemyParty[a], 1, &gBattleBufferA[gActiveBank][3]);
        break;
    case 18:
        SetMonData(&gEnemyParty[a], 25, &gBattleBufferA[gActiveBank][3]);
        break;
    case 19:
        SetMonData(&gEnemyParty[a], 26, &gBattleBufferA[gActiveBank][3]);
        break;
    case 20:
        SetMonData(&gEnemyParty[a], 27, &gBattleBufferA[gActiveBank][3]);
        break;
    case 21:
        SetMonData(&gEnemyParty[a], 28, &gBattleBufferA[gActiveBank][3]);
        break;
    case 22:
        SetMonData(&gEnemyParty[a], 29, &gBattleBufferA[gActiveBank][3]);
        break;
    case 23:
        SetMonData(&gEnemyParty[a], 30, &gBattleBufferA[gActiveBank][3]);
        break;
    case 24:
        SetMonData(&gEnemyParty[a], 31, &gBattleBufferA[gActiveBank][3]);
        break;
    case 25:
        SetMonData(&gEnemyParty[a], 32, &gBattleBufferA[gActiveBank][3]);
        break;
    case 26:
        SetMonData(&gEnemyParty[a], 34, &gBattleBufferA[gActiveBank][3]);
        break;
    case 27:
        SetMonData(&gEnemyParty[a], 35, &gBattleBufferA[gActiveBank][3]);
        break;
    case 28:
        SetMonData(&gEnemyParty[a], 36, &gBattleBufferA[gActiveBank][3]);
        break;
    case 29:
        SetMonData(&gEnemyParty[a], 37, &gBattleBufferA[gActiveBank][3]);
        break;
    case 30:
        SetMonData(&gEnemyParty[a], 38, &gBattleBufferA[gActiveBank][3]);
        break;
    case 31:
        SetMonData(&gEnemyParty[a], 39, &gBattleBufferA[gActiveBank][3]);
        SetMonData(&gEnemyParty[a], 40, &gBattleBufferA[gActiveBank][4]);
        SetMonData(&gEnemyParty[a], 41, &gBattleBufferA[gActiveBank][5]);
        SetMonData(&gEnemyParty[a], 42, &gBattleBufferA[gActiveBank][6]);
        SetMonData(&gEnemyParty[a], 43, &gBattleBufferA[gActiveBank][7]);
        SetMonData(&gEnemyParty[a], 44, &gBattleBufferA[gActiveBank][8]);
        break;
    case 32:
        SetMonData(&gEnemyParty[a], 39, &gBattleBufferA[gActiveBank][3]);
        break;
    case 33:
        SetMonData(&gEnemyParty[a], 40, &gBattleBufferA[gActiveBank][3]);
        break;
    case 34:
        SetMonData(&gEnemyParty[a], 41, &gBattleBufferA[gActiveBank][3]);
        break;
    case 35:
        SetMonData(&gEnemyParty[a], 42, &gBattleBufferA[gActiveBank][3]);
        break;
    case 36:
        SetMonData(&gEnemyParty[a], 43, &gBattleBufferA[gActiveBank][3]);
        break;
    case 37:
        SetMonData(&gEnemyParty[a], 44, &gBattleBufferA[gActiveBank][3]);
        break;
    case 38:
        SetMonData(&gEnemyParty[a], 0, &gBattleBufferA[gActiveBank][3]);
        break;
    case 39:
        SetMonData(&gEnemyParty[a], 9, &gBattleBufferA[gActiveBank][3]);
        break;
    case 40:
        SetMonData(&gEnemyParty[a], 55, &gBattleBufferA[gActiveBank][3]);
        break;
    case 41:
        SetMonData(&gEnemyParty[a], 56, &gBattleBufferA[gActiveBank][3]);
        break;
    case 42:
        SetMonData(&gEnemyParty[a], 57, &gBattleBufferA[gActiveBank][3]);
        break;
    case 43:
        SetMonData(&gEnemyParty[a], 58, &gBattleBufferA[gActiveBank][3]);
        break;
    case 44:
        SetMonData(&gEnemyParty[a], 59, &gBattleBufferA[gActiveBank][3]);
        break;
    case 45:
        SetMonData(&gEnemyParty[a], 60, &gBattleBufferA[gActiveBank][3]);
        break;
    case 46:
        SetMonData(&gEnemyParty[a], 61, &gBattleBufferA[gActiveBank][3]);
        break;
    case 47:
        SetMonData(&gEnemyParty[a], 62, &gBattleBufferA[gActiveBank][3]);
        break;
    case 48:
        SetMonData(&gEnemyParty[a], 63, &gBattleBufferA[gActiveBank][3]);
        break;
    case 49:
        SetMonData(&gEnemyParty[a], 22, &gBattleBufferA[gActiveBank][3]);
        break;
    case 50:
        SetMonData(&gEnemyParty[a], 23, &gBattleBufferA[gActiveBank][3]);
        break;
    case 51:
        SetMonData(&gEnemyParty[a], 24, &gBattleBufferA[gActiveBank][3]);
        break;
    case 52:
        SetMonData(&gEnemyParty[a], 33, &gBattleBufferA[gActiveBank][3]);
        break;
    case 53:
        SetMonData(&gEnemyParty[a], 47, &gBattleBufferA[gActiveBank][3]);
        break;
    case 54:
        SetMonData(&gEnemyParty[a], 48, &gBattleBufferA[gActiveBank][3]);
        break;
    case 55:
        SetMonData(&gEnemyParty[a], 50, &gBattleBufferA[gActiveBank][3]);
        break;
    case 56:
        SetMonData(&gEnemyParty[a], 51, &gBattleBufferA[gActiveBank][3]);
        break;
    case 57:
        SetMonData(&gEnemyParty[a], 52, &gBattleBufferA[gActiveBank][3]);
        break;
    case 58:
        SetMonData(&gEnemyParty[a], 53, &gBattleBufferA[gActiveBank][3]);
        break;
    case 59:
        SetMonData(&gEnemyParty[a], 54, &gBattleBufferA[gActiveBank][3]);
        break;
    }
}

void LinkOpponentHandlecmd3(void)
{
    u8 *dst;
    u8 i;

    { dst = (u8 *)&gEnemyParty[gBattlePartyID[gActiveBank]] + gBattleBufferA[gActiveBank][1]; for(i = 0; i < (u32)gBattleBufferA[gActiveBank][2]; i++) dst[i] = gBattleBufferA[gActiveBank][3 + i]; }
                                                                                   ;

    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleLoadPokeSprite(void)
{
    u16 species = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], 11);

    BattleLoadOpponentMonSprite(&gEnemyParty[gBattlePartyID[gActiveBank]], gActiveBank);
    GetMonSpriteTemplate_803C56C(species, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      sub_8077ABC(gActiveBank, 2),
      sub_8077F68(gActiveBank),
      sub_8079E90(gActiveBank));
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = -240;
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = gActiveBank;
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = gActiveBank;
    StartSpriteAnim(&gSprites[gObjectBankIDs[gActiveBank]], gBattleMonForms[gActiveBank]);
    sub_8032984(gActiveBank, GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], 11));
    gBattleBankFunc[gActiveBank] = sub_8037A74;
}

void LinkOpponentHandleSendOutPoke(void)
{
    gBattlePartyID[gActiveBank] = gBattleBufferA[gActiveBank][1];
    sub_8039430(gActiveBank, gBattleBufferA[gActiveBank][2]);
    gBattleBankFunc[gActiveBank] = sub_8037E30;
}

void sub_8039430(u8 a, u8 b)
{
    u16 species;

    sub_8032AA8(a, b);
    gBattlePartyID[a] = gBattleBufferA[a][1];
    species = GetMonData(&gEnemyParty[gBattlePartyID[a]], 11);
    gUnknown_0300434C[a] = CreateInvisibleSpriteWithCallback(sub_80312F0);
    BattleLoadOpponentMonSprite(&gEnemyParty[gBattlePartyID[a]], a);
    GetMonSpriteTemplate_803C56C(species, GetBankIdentity(a));
    gObjectBankIDs[a] = CreateSprite(
      &gUnknown_02024E8C,
      sub_8077ABC(a, 2),
      sub_8077F68(a),
      sub_8079E90(a));
    gSprites[gUnknown_0300434C[a]].data[1] = gObjectBankIDs[a];
    gSprites[gObjectBankIDs[a]].data[0] = a;
    gSprites[gObjectBankIDs[a]].data[2] = species;
    gSprites[gObjectBankIDs[a]].oam.paletteNum = a;
    StartSpriteAnim(&gSprites[gObjectBankIDs[a]], gBattleMonForms[a]);
    gSprites[gObjectBankIDs[a]].invisible = 1;
    gSprites[gObjectBankIDs[a]].callback = SpriteCallbackDummy;
    gSprites[gUnknown_0300434C[a]].data[0] = sub_8046400(0, 0xFE);
}

void LinkOpponentHandleReturnPokeToBall(void)
{
    if (gBattleBufferA[gActiveBank][1] == 0)
    {
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4 = 0;
        gBattleBankFunc[gActiveBank] = sub_8039648;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        sub_8032A08(gActiveBank);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8039648(void)
{
    switch (((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4)
    {
    case 0:
        if (((struct Struct2017800 *) (gSharedMem + 0x17800))[gActiveBank].substituteSprite)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4 = 1;
        break;
    case 1:
        if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_6)
        {
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4 = 0;
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 2);
            gBattleBankFunc[gActiveBank] = sub_8037BBC;
        }
        break;
    }
}

void LinkOpponentHandleTrainerThrow(void)
{
    s16 xOffset;
    u32 gender;

    if (gBattleTypeFlags & 0x0040)
    {
        if (GetBankIdentity(gActiveBank) & 2)
            xOffset = -16;
        else
            xOffset = 16;
        gender = gLinkPlayers[sub_803FC34(gActiveBank)].gender;
    }
    else
    {
        xOffset = 0;
        gender = gLinkPlayers[GetMultiplayerId() ^ 1].gender;
    }
    sub_8031A6C(gender, gActiveBank);
    GetMonSpriteTemplate_803C5A0(gender, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      176 + xOffset, 40 + 4 * (8 - gTrainerFrontPicCoords[gender].coords),
      sub_8079E90(gActiveBank));
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = -240;
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = 2;
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = IndexOfSpritePaletteTag(gTrainerFrontPicPaletteTable[gender].tag);
    gSprites[gObjectBankIDs[gActiveBank]].data[5] = gSprites[gObjectBankIDs[gActiveBank]].oam.tileNum;
    gSprites[gObjectBankIDs[gActiveBank]].oam.tileNum = GetSpriteTileStartByTag(gTrainerFrontPicTable[gender].tag);
    gSprites[gObjectBankIDs[gActiveBank]].oam.affineParam = gender;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBank] = sub_803757C;
}

void LinkOpponentHandleTrainerSlide(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleTrainerSlideBack(void)
{
    oamt_add_pos2_onto_pos1(&gSprites[gObjectBankIDs[gActiveBank]]);
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = 35;
    gSprites[gObjectBankIDs[gActiveBank]].data[2] = 280;
    gSprites[gObjectBankIDs[gActiveBank]].data[4] = gSprites[gObjectBankIDs[gActiveBank]].pos1.y;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8078B34;
    StoreSpriteCallbackInData(&gSprites[gObjectBankIDs[gActiveBank]], SpriteCallbackDummy);
    gBattleBankFunc[gActiveBank] = sub_80375B4;
}

void LinkOpponentHandlecmd10(void)
{
    if (((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4 == 0)
    {
        if (((struct Struct2017800 *) (gSharedMem + 0x17800))[gActiveBank].substituteSprite)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4++;
    }
    else if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_6)
    {
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4 = 0;
        PlaySE12WithPanning(SE_POKE_DEAD, 63);
        gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8010384;
        gBattleBankFunc[gActiveBank] = sub_8037B78;
    }
}

void LinkOpponentHandlecmd11(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd12(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleBallThrow(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlePuase(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleMoveAnimation(void)
{
    if (!mplay_80342A4(gActiveBank))
    {
        u32 r0 = gBattleBufferA[gActiveBank][1]
               | (gBattleBufferA[gActiveBank][2] << 8);

        gUnknown_0202F7C4 = gBattleBufferA[gActiveBank][3];
        gMovePowerMoveAnim = gBattleBufferA[gActiveBank][4]
                          | (gBattleBufferA[gActiveBank][5] << 8);
        gMoveDmgMoveAnim = gBattleBufferA[gActiveBank][6]
                          | (gBattleBufferA[gActiveBank][7] << 8)
                          | (gBattleBufferA[gActiveBank][8] << 16)
                          | (gBattleBufferA[gActiveBank][9] << 24);
        gHappinessMoveAnim = gBattleBufferA[gActiveBank][10];
        gWeatherMoveAnim = gBattleBufferA[gActiveBank][12]
                          | (gBattleBufferA[gActiveBank][13] << 8);
        gDisableStructMoveAnim = (u32 *)&gBattleBufferA[gActiveBank][16];
        gPID_perBank[gActiveBank] = *gDisableStructMoveAnim;


        if (sub_8031720(r0, gUnknown_0202F7C4) != 0)
        {
            LinkOpponentBufferExecCompleted();
        }
        else
        {
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4 = 0;
            gBattleBankFunc[gActiveBank] = sub_8039B64;
        }
    }
}

void sub_8039B64(void)
{
    u16 r4 = gBattleBufferA[gActiveBank][1]
           | (gBattleBufferA[gActiveBank][2] << 8);
    u8 r7 = gBattleBufferA[gActiveBank][11];

    switch (((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4)
    {
    case 0:
        if (((struct Struct2017800 *) (gSharedMem + 0x17800))[gActiveBank].substituteSprite && !((struct Struct2017800 *) (gSharedMem + 0x17800))[gActiveBank].unk0_3)
        {
            ((struct Struct2017800 *) (gSharedMem + 0x17800))[gActiveBank].unk0_3 = 1;
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        }
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4 = 1;
        break;
    case 1:
        if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_6)
        {
            sub_80326EC(0);
            ExecuteMoveAnim(r4);
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4 = 2;
        }
        break;
    case 2:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            sub_80326EC(1);
            if ((((struct Struct2017800 *) (gSharedMem + 0x17800))[gActiveBank].substituteSprite) && r7 <= 1)
            {
                move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 6);
                ((struct Struct2017800 *) (gSharedMem + 0x17800))[gActiveBank].unk0_3 = 0;
            }
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4 = 3;
        }
        break;
    case 3:
        if (!((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_6)
        {
            sub_8031F24();
            sub_80324BC(
              gActiveBank,
              gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk4 = 0;
            LinkOpponentBufferExecCompleted();
        }
        break;
    }
}

void LinkOpponentHandlePrintString(void)
{
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    BufferStringBattle(*(u16 *)&gBattleBufferA[gActiveBank][2]);
    sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
    gBattleBankFunc[gActiveBank] = sub_8037C2C;
}

void LinkOpponentHandlePrintStringPlayerOnly(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd18(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd19(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd20(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleOpenBag(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd22(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd23(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleHealthBarUpdate(void)
{
    s16 r7;

    load_gfxc_health_bar(0);
    r7 = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);
    if (r7 != 0x7FFF)
    {
        u32 maxHP = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], 58);
        u32 hp = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], 57);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, hp, r7);
    }
    else
    {
        u32 maxHP = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], 58);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, 0, r7);
    }
    gBattleBankFunc[gActiveBank] = sub_8037B24;
}

void LinkOpponentHandleExpBarUpdate(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleStatusIconUpdate(void)
{
    if (mplay_80342A4(gActiveBank) == 0)
    {
        sub_8045A5C(gHealthboxIDs[gActiveBank], &gEnemyParty[gBattlePartyID[gActiveBank]], 9);
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_4 = 0;
        gBattleBankFunc[gActiveBank] = sub_8037FAC;
    }
}

void LinkOpponentHandleStatusAnimation(void)
{
    if (mplay_80342A4(gActiveBank) == 0)
    {
        move_anim_start_t2_for_situation(
          gBattleBufferA[gActiveBank][1],
          gBattleBufferA[gActiveBank][2]
          | (gBattleBufferA[gActiveBank][3] << 8)
          | (gBattleBufferA[gActiveBank][4] << 16)
          | (gBattleBufferA[gActiveBank][5] << 24));
        gBattleBankFunc[gActiveBank] = sub_8037FAC;
    }
}

void LinkOpponentHandleStatusXor(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd29(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleDMATransfer(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd31(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd32(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd33(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd34(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd35(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd36(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd37(void)
{
    gUnknown_020238C8.unk0_0 = 0;
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd38(void)
{
    gUnknown_020238C8.unk0_0 = gBattleBufferA[gActiveBank][1];
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd39(void)
{
    gUnknown_020238C8.unk0_7 = 0;
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd40(void)
{
    gUnknown_020238C8.unk0_7 ^= 1;
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleHitAnimation(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].invisible == 1)
    {
        LinkOpponentBufferExecCompleted();
    }
    else
    {
        gDoingBattleAnim = 1;
        gSprites[gObjectBankIDs[gActiveBank]].data[1] = 0;
        sub_8047858(gActiveBank);
        gBattleBankFunc[gActiveBank] = dp01t_0F_4_move_anim;
    }
}

void LinkOpponentHandlecmd42(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleEffectivenessSound(void)
{
    s8 pan;

    if (GetBankSide(gActiveBank) == 0)
        pan = -64;
    else
        pan = 63;
    PlaySE12WithPanning(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8), pan);
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd44(void)
{
    PlayFanfare(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleFaintingCry(void)
{
    PlayCry3(
      GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], 11),
      25, 5);
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleIntroSlide(void)
{
    sub_80E43C0(gBattleBufferA[gActiveBank][1]);
    gUnknown_02024DE8 |= 1;
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleTrainerBallThrow(void)
{
    u8 taskId;

    oamt_add_pos2_onto_pos1(&gSprites[gObjectBankIDs[gActiveBank]]);
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = 35;
    gSprites[gObjectBankIDs[gActiveBank]].data[2] = 280;
    gSprites[gObjectBankIDs[gActiveBank]].data[4] = gSprites[gObjectBankIDs[gActiveBank]].pos1.y;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8078B34;
    StoreSpriteCallbackInData(&gSprites[gObjectBankIDs[gActiveBank]], sub_803A3A8);
    taskId = CreateTask(sub_803A2C4, 5);
    gTasks[taskId].data[0] = gActiveBank;
    if (((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    (*(struct Struct2017840 *) (gSharedMem + 0x17840)).unk9_0 = 1;
    gBattleBankFunc[gActiveBank] = nullsub_47;
}

void sub_803A2C4(u8 taskId)
{
    u8 r9;

    r9 = gActiveBank;
    gActiveBank = gTasks[taskId].data[0];
    if (!IsDoubleBattle() || (gBattleTypeFlags & 0x0040))
    {
        gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
        sub_8039430(gActiveBank, 0);
    }
    else
    {
        gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
        sub_8039430(gActiveBank, 0);
        gActiveBank ^= 2;
        gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
        sub_8039430(gActiveBank, 0);
        gActiveBank ^= 2;
    }
    gBattleBankFunc[gActiveBank] = sub_8037840;
    gActiveBank = r9;
    DestroyTask(taskId);
}

void sub_803A3A8(struct Sprite *sprite)
{
    sub_8031B74(sprite->oam.affineParam);
    sprite->oam.tileNum = sprite->data[5];
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
}

void LinkOpponentHandlecmd48(void)
{
    if (gBattleBufferA[gActiveBank][1] != 0 && GetBankSide(gActiveBank) == 0)
    {
        LinkOpponentBufferExecCompleted();
        return;
    }

    ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_0 = 1;
    if (gBattleBufferA[gActiveBank][2] != 0)
    {
        if (((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk1_1 < 2)
        {
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk1_1++;
            return;
        }
        else
        {
            ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk1_1 = 0;
        }
    }
    gUnknown_02024E68[gActiveBank] = sub_8044804(
      gActiveBank,
      (struct BattleInterfaceStruct2 *)&gBattleBufferA[gActiveBank][4],
      gBattleBufferA[gActiveBank][1],
      gBattleBufferA[gActiveBank][2]);
    ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk5 = 0;
    if (gBattleBufferA[gActiveBank][2] != 0)
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk5 = 0x5D;
    gBattleBankFunc[gActiveBank] = sub_803A4E0;
}

void sub_803A4E0(void)
{
    if (((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk5++ >= 93)
    {
        ((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk5 = 0;
        LinkOpponentBufferExecCompleted();
    }
}

void LinkOpponentHandlecmd49(void)
{
    if (((struct Struct2017810 *) (gSharedMem + 0x17810))[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd50(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleSpriteInvisibility(void)
{
    if (AnimBankSpriteExists(gActiveBank) != 0)
    {
        gSprites[gObjectBankIDs[gActiveBank]].invisible = gBattleBufferA[gActiveBank][1];
        sub_8031F88(gActiveBank);
    }
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleBattleAnimation(void)
{
    if (mplay_80342A4(gActiveBank) == 0)
    {
        u8 r3 = gBattleBufferA[gActiveBank][1];
        u16 r4 = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);

        if (move_anim_start_t3(gActiveBank, gActiveBank, gActiveBank, r3, r4) != 0)
            LinkOpponentBufferExecCompleted();
        else
            gBattleBankFunc[gActiveBank] = sub_8037FD8;
    }
}

void LinkOpponentHandleLinkStandbyMsg(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleResetActionMoveSelection(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd55(void)
{
    if (gBattleBufferA[gActiveBank][1] == 3)
        gBattleOutcome = gBattleBufferA[gActiveBank][1];
    else
        gBattleOutcome = gBattleBufferA[gActiveBank][1] ^ 3;
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    LinkOpponentBufferExecCompleted();
    gBattleBankFunc[gActiveBank] = sub_8037F34;
}

void LinkOpponentHandlecmd56(void)
{
}