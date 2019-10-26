# 1 "src/battle/battle_interface.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/battle/battle_interface.c"
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
# 2 "src/battle/battle_interface.c" 2
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
# 3 "src/battle/battle_interface.c" 2
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
# 4 "src/battle/battle_interface.c" 2
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
# 5 "src/battle/battle_interface.c" 2
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
# 6 "src/battle/battle_interface.c" 2
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
# 7 "src/battle/battle_interface.c" 2
# 1 "include/pokemon.h" 1
# 8 "src/battle/battle_interface.c" 2
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
# 9 "src/battle/battle_interface.c" 2
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
# 10 "src/battle/battle_interface.c" 2
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
# 11 "src/battle/battle_interface.c" 2
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
# 12 "src/battle/battle_interface.c" 2
# 1 "include/sprite.h" 1
# 13 "src/battle/battle_interface.c" 2
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
# 14 "src/battle/battle_interface.c" 2
# 1 "include/task.h" 1
# 15 "src/battle/battle_interface.c" 2
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
# 16 "src/battle/battle_interface.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 17 "src/battle/battle_interface.c" 2

struct UnknownStruct5
{
    u8 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
};

struct UnknownStruct7
{
    u8 filler0[0x180];
};

extern u8 gDisplayedStringBattle[];
extern u8 gNoOfAllBanks;
extern u16 gBattlePartyID[];
extern u8 gBanksBySide[];
extern u8 gHealthboxIDs[];

extern u16 gBattleTypeFlags;

extern const struct SpriteTemplate gSpriteTemplate_820A4EC[];
extern const struct SpriteTemplate gSpriteTemplate_820A51C[];
extern const struct SpriteTemplate gSpriteTemplate_820A54C;
extern const struct SpriteTemplate gSpriteTemplate_820A56C[];
extern const struct SubspriteTable gSubspriteTables_820A684[];
extern const struct SubspriteTable gSubspriteTables_820A6E4[];
extern const struct SubspriteTable gSubspriteTables_820A6EC[];
extern const struct SpriteSheet gUnknown_0820A754[];
extern const struct SpritePalette gUnknown_0820A764[];
extern const struct SpritePalette gUnknown_0820A774[];
extern const struct SpriteSheet gUnknown_0820A784[];
extern const struct SpriteTemplate gSpriteTemplate_820A7A4[];
extern const struct SpriteTemplate gSpriteTemplate_820A7D4[];
extern void *const gUnknown_0820A804[];
extern void *const gUnknown_0820A80C[];
extern void *const gUnknown_0820A814[];
extern void *const gUnknown_0820A83C[];
extern void *const gUnknown_0820A848[];
extern void *const gUnknown_0820A854[];
extern void *const gUnknown_0820A85C[];
extern void *const gUnknown_0820A87C[];
extern void *const gUnknown_0820A894[];
extern void *const gUnknown_0820A8B4[];
extern void *const gUnknown_0820A8DC[];
extern void *const gUnknown_0820A904[];
extern const u8 gUnknown_0820A81C[];
extern const u8 gUnknown_0820A864[];
extern const u8 gUnknown_0820A89C[];
extern const u8 gUnknown_0820A8B0[];
extern const u8 BattleText_SafariBalls[];
extern const u8 BattleText_SafariBallsLeft[];
extern const u8 BattleText_HighlightRed[];
extern const u8 gUnknown_08D1216C[][32];

extern const u16 gBattleInterfaceStatusIcons_DynPal[];





static void sub_8043D5C(struct Sprite *);
static const void *sub_8043CDC(u8);
static void sub_8044210(u8, s16, u8);
static void draw_status_ailment_maybe(u8);
extern void sub_8045180(struct Sprite *);
static void sub_8045110(struct Sprite *);
static void sub_8045048(struct Sprite *);
static void sub_8044F70(u8 taskId);
static void sub_8044E74(u8 taskId);
static void sub_8044ECC(u8 taskId);
static u8 sub_80457E8(u8, u8);
static int sub_8045F58(s32, s32, int, int *, u8, u16);
static u8 GetScaledExpFraction(int, int, int, u8);
static void sub_8045D58(u8, u8);
static u8 sub_804602C(int, int, int, int *, u8 *, u8);
static void sub_8046128(struct BattleInterfaceStruct1 *a, int *b, u16 *c);

static int do_nothing(s16 unused1, s16 unused2, int unused3)
{
    return 9;
}
# 178 "src/battle/battle_interface.c"
__attribute__((naked))
void sub_8043740(s16 a, u16 *b, u8 c)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x4\n    adds r7, r1, 0\n    lsls r0, 16\n    lsrs r5, r0, 16\n    lsls r2, 24\n    lsrs r2, 24\n    mov r10, r2\n    movs r3, 0\n    movs r2, 0\n_0804375C:\n    lsls r0, r3, 24\n    asrs r0, 24\n    mov r3, sp\n    adds r1, r3, r0\n    strb r2, [r1]\n    adds r0, 0x1\n    lsls r0, 24\n    lsrs r3, r0, 24\n    asrs r0, 24\n    cmp r0, 0x3\n    ble _0804375C\n    movs r3, 0x3\n    movs r0, 0x1\n    negs r0, r0\n    mov r9, r0\n    mov r8, sp\n_0804377C:\n    lsls r0, r5, 16\n    asrs r6, r0, 16\n    cmp r6, 0\n    ble _080437AA\n    lsls r4, r3, 24\n    asrs r4, 24\n    mov r1, sp\n    adds r5, r1, r4\n    adds r0, r6, 0\n    movs r1, 0xA\n    bl __modsi3\n    strb r0, [r5]\n    adds r0, r6, 0\n    movs r1, 0xA\n    bl __divsi3\n    lsls r0, 16\n    lsrs r5, r0, 16\n    subs r4, 0x1\n    lsls r4, 24\n    lsrs r3, r4, 24\n    b _0804377C\n_080437AA:\n    lsls r1, r3, 24\n    asrs r0, r1, 24\n    cmp r0, r9\n    ble _080437CE\n    movs r4, 0xFF\n    movs r3, 0x1\n    negs r3, r3\n_080437B8:\n    asrs r2, r1, 24\n    mov r5, sp\n    adds r1, r5, r2\n    ldrb r0, [r1]\n    orrs r0, r4\n    strb r0, [r1]\n    subs r2, 0x1\n    lsls r1, r2, 24\n    asrs r0, r1, 24\n    cmp r0, r3\n    bgt _080437B8\n_080437CE:\n    mov r1, r8\n    ldrb r0, [r1, 0x3]\n    cmp r0, 0xFF\n    bne _080437DA\n    movs r0, 0\n    strb r0, [r1, 0x3]\n_080437DA:\n    mov r2, r10\n    cmp r2, 0\n    bne _0804386A\n    movs r3, 0\n    movs r1, 0\n    movs r6, 0xFC\n    lsls r6, 8\n    movs r5, 0x1E\n    mov r12, r5\n_080437EC:\n    lsls r1, 24\n    asrs r2, r1, 24\n    mov r0, sp\n    adds r5, r0, r2\n    ldrb r0, [r5]\n    mov r8, r1\n    cmp r0, 0xFF\n    bne _08043822\n    lsls r1, r2, 1\n    adds r1, r7\n    ldrh r2, [r1]\n    adds r0, r6, 0\n    ands r0, r2\n    mov r2, r12\n    orrs r0, r2\n    strh r0, [r1]\n    lsls r3, 24\n    asrs r1, r3, 23\n    adds r1, r7\n    adds r1, 0x40\n    ldrh r2, [r1]\n    adds r0, r6, 0\n    ands r0, r2\n    mov r5, r12\n    orrs r0, r5\n    strh r0, [r1]\n    b _08043852\n_08043822:\n    lsls r2, 1\n    adds r2, r7\n    ldrh r0, [r2]\n    adds r1, r6, 0\n    ands r1, r0\n    ldrb r0, [r5]\n    adds r0, 0x14\n    orrs r1, r0\n    strh r1, [r2]\n    lsls r4, r3, 24\n    asrs r3, r4, 24\n    lsls r2, r3, 1\n    adds r2, r7\n    adds r2, 0x40\n    ldrh r0, [r2]\n    adds r1, r6, 0\n    ands r1, r0\n    mov r5, sp\n    adds r0, r5, r3\n    ldrb r0, [r0]\n    adds r0, 0x34\n    orrs r1, r0\n    strh r1, [r2]\n    adds r3, r4, 0\n_08043852:\n    movs r0, 0x80\n    lsls r0, 17\n    add r0, r8\n    lsrs r1, r0, 24\n    movs r2, 0x80\n    lsls r2, 17\n    adds r0, r3, r2\n    lsrs r3, r0, 24\n    asrs r0, 24\n    cmp r0, 0x3\n    ble _080437EC\n    b _080438CE\n_0804386A:\n    movs r3, 0\n    movs r4, 0xFC\n    lsls r4, 8\n    movs r6, 0x1E\n_08043872:\n    lsls r1, r3, 24\n    asrs r2, r1, 24\n    mov r3, sp\n    adds r5, r3, r2\n    ldrb r0, [r5]\n    adds r3, r1, 0\n    cmp r0, 0xFF\n    bne _0804389E\n    lsls r1, r2, 1\n    adds r1, r7\n    ldrh r2, [r1]\n    adds r0, r4, 0\n    ands r0, r2\n    orrs r0, r6\n    strh r0, [r1]\n    adds r1, 0x40\n    ldrh r2, [r1]\n    adds r0, r4, 0\n    ands r0, r2\n    orrs r0, r6\n    strh r0, [r1]\n    b _080438C0\n_0804389E:\n    lsls r2, 1\n    adds r2, r7\n    ldrh r0, [r2]\n    adds r1, r4, 0\n    ands r1, r0\n    ldrb r0, [r5]\n    adds r0, 0x14\n    orrs r1, r0\n    strh r1, [r2]\n    adds r2, 0x40\n    ldrh r0, [r2]\n    adds r1, r4, 0\n    ands r1, r0\n    ldrb r0, [r5]\n    adds r0, 0x34\n    orrs r1, r0\n    strh r1, [r2]\n_080438C0:\n    movs r5, 0x80\n    lsls r5, 17\n    adds r0, r3, r5\n    lsrs r3, r0, 24\n    asrs r0, 24\n    cmp r0, 0x3\n    ble _08043872\n_080438CE:\n    add sp, 0x4\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .syntax divided\n");
# 402 "src/battle/battle_interface.c"
}


void unref_sub_80438E0(s16 a, s16 b, u16 *c)
{
    c[4] = 0x1E;
    sub_8043740(b, c, 0);
    sub_8043740(a, c + 5, 1);
}

u8 battle_make_oam_normal_battle(u8 a)
{
    int sp0 = 0;
    u8 spriteId1;
    u8 spriteId2;
    u8 spriteId3;
    struct Sprite *sprite;

    if (!IsDoubleBattle())
    {
        if (GetBankSide(a) == 0)
        {
            spriteId1 = CreateSprite(&gSpriteTemplate_820A4EC[0], 240, 160, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplate_820A4EC[0], 240, 160, 1);

            gSprites[spriteId1].oam.shape = 0;
            gSprites[spriteId2].oam.shape = 0;
            gSprites[spriteId2].oam.tileNum += 64;
        }
        else
        {
            spriteId1 = CreateSprite(&gSpriteTemplate_820A51C[0], 240, 160, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplate_820A51C[0], 240, 160, 1);

            gSprites[spriteId2].oam.tileNum += 32;
            sp0 = 2;
        }


        gSprites[spriteId1].oam.affineParam = spriteId2;
        gSprites[spriteId2].data[5] = spriteId1;
        gSprites[spriteId2].callback = sub_8043D5C;
    }

    else
    {
        if (GetBankSide(a) == 0)
        {
            spriteId1 = CreateSprite(&gSpriteTemplate_820A4EC[GetBankIdentity(a) / 2], 240, 160, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplate_820A4EC[GetBankIdentity(a) / 2], 240, 160, 1);

            gSprites[spriteId1].oam.affineParam = spriteId2;
            gSprites[spriteId2].data[5] = spriteId1;
            gSprites[spriteId2].oam.tileNum += 32;
            gSprites[spriteId2].callback = sub_8043D5C;
            sp0 = 1;
        }

        else
        {
            spriteId1 = CreateSprite(&gSpriteTemplate_820A51C[GetBankIdentity(a) / 2], 240, 160, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplate_820A51C[GetBankIdentity(a) / 2], 240, 160, 1);

            gSprites[spriteId1].oam.affineParam = spriteId2;
            gSprites[spriteId2].data[5] = spriteId1;
            gSprites[spriteId2].oam.tileNum += 32;
            gSprites[spriteId2].callback = sub_8043D5C;
            sp0 = 2;
        }

    }


    spriteId3 = CreateSpriteAtEnd(&gSpriteTemplate_820A56C[gBanksBySide[a]], 140, 60, 0);
    sprite = &gSprites[spriteId3];
    SetSubspriteTables(sprite, &gSubspriteTables_820A684[GetBankSide(a)]);
    sprite->subspriteMode = 2;
    sprite->oam.priority = 1;
    CpuSet(sub_8043CDC(1), (void *)(0x6000000 + 0x10000) + sprite->oam.tileNum * 32, 0x04000000 | ((64)/(32/8) & 0x1FFFFF));

    gSprites[spriteId1].data[5] = spriteId3;
    gSprites[spriteId1].data[6] = a;
    gSprites[spriteId1].invisible = 1;
    gSprites[spriteId2].invisible = 1;
    sprite->data[5] = spriteId1;
    sprite->data[6] = sp0;
    sprite->invisible = 1;

    return spriteId1;
}

u8 battle_make_oam_safari_battle(void)
{
    u8 spriteId1 = CreateSprite(&gSpriteTemplate_820A54C, 240, 160, 1);
    u8 spriteId2 = CreateSpriteAtEnd(&gSpriteTemplate_820A54C, 240, 160, 1);

    gSprites[spriteId1].oam.shape = 0;
    gSprites[spriteId2].oam.shape = 0;
    gSprites[spriteId2].oam.tileNum += 0x40;
    gSprites[spriteId1].oam.affineParam = spriteId2;
    gSprites[spriteId2].data[5] = spriteId1;
    gSprites[spriteId2].callback = sub_8043D5C;
    return spriteId1;
}

static const void *sub_8043CDC(u8 a)
{
    return gUnknown_08D1216C[a];
}

void sub_8043CEC(struct Sprite *sprite)
{
    u8 r5 = sprite->data[5];

    switch (sprite->data[6])
    {
    case 0:
        sprite->pos1.x = gSprites[r5].pos1.x + 16;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    case 1:
        sprite->pos1.x = gSprites[r5].pos1.x + 16;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    default:
    case 2:
        sprite->pos1.x = gSprites[r5].pos1.x + 8;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    }
    sprite->pos2.x = gSprites[r5].pos2.x;
    sprite->pos2.y = gSprites[r5].pos2.y;
}

static void sub_8043D5C(struct Sprite *sprite)
{
    u8 data5 = sprite->data[5];

    sprite->pos1.x = gSprites[data5].pos1.x + 64;
    sprite->pos1.y = gSprites[data5].pos1.y;
    sprite->pos2.x = gSprites[data5].pos2.x;
    sprite->pos2.y = gSprites[data5].pos2.y;
}

void sub_8043D84(u8 a, u8 b, u32 c, u32 d, u32 e)
{
    ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk0 = b;
    ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk4 = c;
    ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk8 = d;
    ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unkC = e;
    ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk10 = 0xFFFF8000;
}

void sub_8043DB0(u8 a)
{
    gSprites[a].invisible = 1;
    gSprites[gSprites[a].data[5]].invisible = 1;
    gSprites[gSprites[a].oam.affineParam].invisible = 1;
}

void sub_8043DFC(u8 a)
{
    gSprites[a].invisible = 0;
    gSprites[gSprites[a].data[5]].invisible = 0;
    gSprites[gSprites[a].oam.affineParam].invisible = 0;
}

static void sub_8043E50(u8 spriteId, s16 x, s16 y)
{
    gSprites[spriteId].pos1.x = x;
    gSprites[spriteId].pos1.y = y;
}

void unref_sub_8043E70(u8 a)
{
    DestroySprite(&gSprites[gSprites[a].oam.affineParam]);
    DestroySprite(&gSprites[gSprites[a].data[5]]);
    DestroySprite(&gSprites[a]);
}

void nullsub_11()
{
}

void sub_8043EB4(u8 priority)
{
    s32 i;

    for (i = 0; i < gNoOfAllBanks; i++)
    {
        u8 spriteId1;
        u8 spriteId2;
        u8 spriteId3;

        spriteId1 = gHealthboxIDs[i];
        spriteId2 = gSprites[spriteId1].oam.affineParam;
        spriteId3 = gSprites[spriteId1].data[5];
        gSprites[spriteId1].oam.priority = priority;
        gSprites[spriteId2].oam.priority = priority;
        gSprites[spriteId3].oam.priority = priority;
    }
}

void sub_8043F44(u8 a)
{
    s16 x = 0;
    s16 y = 0;

    if (!IsDoubleBattle())
    {
        if (GetBankSide(a) != 0)
        {
            x = 44;
            y = 30;
        }
        else
        {
            x = 158;
            y = 88;
        }
    }
    else
    {
        switch (GetBankIdentity(a))
        {
        case 0:
            x = 159;
            y = 77;
            break;
        case 2:
            x = 171;
            y = 102;
            break;
        case 1:
            x = 44;
            y = 19;
            break;
        case 3:
            x = 32;
            y = 44;
            break;
        }
    }
    sub_8043E50(gHealthboxIDs[a], x, y);
}



static void sub_8043FC0(u8 a, u8 b)
{
    u8 str[30];
    void *const *r7;
    u8 *ptr;
    s32 i;
    s32 two;


    memcpy(str, gUnknown_0820A81C, sizeof(str));
    if (!IsDoubleBattle())
    {
        if (GetBankSide(gSprites[a].data[6]) == 0)
            r7 = gUnknown_0820A804;
        else
            r7 = gUnknown_0820A80C;
    }
    else
    {
        if (GetBankSide(gSprites[a].data[6]) == 0)
            r7 = gUnknown_0820A814;
        else
            r7 = gUnknown_0820A80C;
    }

    ptr = str + 6;
    if (b == 100)
    {
        ptr = ConvertIntToDecimalStringN(ptr, 100, 0, 3);
    }
    else
    {
        ptr = ConvertIntToDecimalStringN(ptr, b, 0, 2);
    }

 *(ptr++) = 0xFC;
 *(ptr++) = 0x13;
 *(ptr++) = 0xF;
    *(ptr++) = 0xFF;
    sub_80034D4((u8 *)(0x02000000 + (0 * 0x20)), str);

 if (b == 100)
 {
  two = 3;
  for (i = 0; i < two; i++)
   CpuSet((void *)((u8 *)(0x02000000 + (1 * 0x20)) + i * 64), r7[i] - 0x20 + gSprites[a].oam.tileNum * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
 } else
 {
  two = 2;
  for (i = 0; i < two; i++)
   CpuSet((void *)((u8 *)(0x02000000 + (1 * 0x20)) + i * 64), r7[i] + gSprites[a].oam.tileNum * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
 }
}
# 755 "src/battle/battle_interface.c"
__attribute__((naked))
void sub_80440EC(u8 a, s16 b, u8 c)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r8\n    push {r7}\n    sub sp, 0x14\n    lsls r0, 24\n    lsrs r7, r0, 24\n    lsls r1, 16\n    lsrs r6, r1, 16\n    lsls r2, 24\n    lsrs r2, 24\n    mov r8, r2\n    ldr r1, _08044144 @ =gUnknown_0820A864\n    mov r0, sp\n    movs r2, 0x14\n    bl memcpy\n    ldr r1, _08044148 @ =gSprites\n    lsls r0, r7, 4\n    adds r0, r7\n    lsls r0, 2\n    adds r4, r0, r1\n    movs r0, 0x3A\n    ldrsh r5, [r4, r0]\n    bl IsDoubleBattle\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x1\n    beq _08044136\n    lsls r0, r5, 24\n    lsrs r0, 24\n    bl GetBankSide\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x1\n    bne _0804414C\n_08044136:\n    lsls r1, r6, 16\n    asrs r1, 16\n    adds r0, r7, 0\n    mov r2, r8\n    bl sub_8044210\n    b _080441F0\n    .align 2, 0\n_08044144: .4byte gUnknown_0820A864\n_08044148: .4byte gSprites\n_0804414C:\n    mov r5, sp\n    adds r5, 0x6\n    mov r0, r8\n    cmp r0, 0\n    bne _08044190\n    ldrh r0, [r4, 0x3A]\n    lsls r0, 24\n    lsrs r0, 24\n    bl GetBankSide\n    lsls r0, 24\n    ldr r4, _08044188 @ =gUnknown_0820A848\n    cmp r0, 0\n    bne _0804416A\n    ldr r4, _0804418C @ =gUnknown_0820A83C\n_0804416A:\n    movs r0, 0x4\n    mov r8, r0\n    lsls r1, r6, 16\n    asrs r1, 16\n    adds r0, r5, 0\n    movs r2, 0x18\n    movs r3, 0x1\n    bl sub_8003504\n    adds r5, r0, 0\n    movs r0, 0xBA\n    strb r0, [r5]\n    movs r0, 0xFF\n    strb r0, [r5, 0x1]\n    b _080441B6\n    .align 2, 0\n_08044188: .4byte gUnknown_0820A848\n_0804418C: .4byte gUnknown_0820A83C\n_08044190:\n    ldrh r0, [r4, 0x3A]\n    lsls r0, 24\n    lsrs r0, 24\n    bl GetBankSide\n    lsls r0, 24\n    ldr r4, _080441FC @ =gUnknown_0820A85C\n    cmp r0, 0\n    bne _080441A4\n    ldr r4, _08044200 @ =gUnknown_0820A854\n_080441A4:\n    movs r0, 0x3\n    mov r8, r0\n    lsls r1, r6, 16\n    asrs r1, 16\n    adds r0, r5, 0\n    movs r2, 0x18\n    movs r3, 0x1\n    bl sub_8003504\n_080441B6:\n    movs r0, 0x80\n    lsls r0, 18\n    mov r1, sp\n    bl sub_80034D4\n    mov r0, r8\n    cmp r0, 0\n    beq _080441F0\n    ldr r1, _08044204 @ =gSprites\n    lsls r0, r7, 4\n    adds r0, r7\n    lsls r0, 2\n    adds r6, r0, r1\n    adds r7, r4, 0\n    ldr r5, _08044208 @ =gSharedMem + 0x20\n    mov r4, r8\n_080441D6:\n    ldrh r0, [r6, 0x4]\n    lsls r0, 22\n    lsrs r0, 17\n    ldm r7!, {r1}\n    adds r1, r0\n    adds r0, r5, 0\n    ldr r2, _0804420C @ =REG_BG0CNT\n    bl CpuSet\n    adds r5, 0x40\n    subs r4, 0x1\n    cmp r4, 0\n    bne _080441D6\n_080441F0:\n    add sp, 0x14\n    pop {r3}\n    mov r8, r3\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_080441FC: .4byte gUnknown_0820A85C\n_08044200: .4byte gUnknown_0820A854\n_08044204: .4byte gSprites\n_08044208: .4byte gSharedMem + 0x20\n_0804420C: .4byte 0x04000008\n    .syntax divided\n");
# 898 "src/battle/battle_interface.c"
}


static void sub_8044210(u8 a, s16 b, u8 c)
{
    u8 str[0x14];
    u8 *ptr;
    void *const *r7;
    int r10;
    int r4;
    int i;


    memcpy(str, gUnknown_0820A89C, sizeof(str));
    r4 = gSprites[a].data[6];
    if ((((struct Struct2017800 *) (gSharedMem + 0x17800))[r4].unk0_4) == 0)
        return;
    ptr = str + 6;
    if (c == 0)
    {
        r7 = gUnknown_0820A87C;
        r10 = 6;
        ptr = sub_8003504(ptr, b, 0x2B, 1);
        *(ptr++) = 0xBA;
        *(ptr++) = 0xFF;
    }
    else
    {
        r7 = gUnknown_0820A894;
        r10 = 2;
        sub_8003504(ptr, b, 0xF, 1);
        if (GetBankSide(r4) == 0)
        {
            CpuSet(sub_8043CDC(0x74), (void *)(0x6000000 + 0x10000) + (gSprites[a].oam.tileNum + 0x34) * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
        }
    }
    r4 = gSprites[a].data[5];
    sub_80034D4((u8 *)(0x02000000 + (0 * 0x20)), str);
    for (i = 0; i < r10; i++)
    {
        CpuSet((void *)((u8 *)(0x02000000 + (1 * 0x20)) + i * 0x40), r7[i] + gSprites[r4].oam.tileNum * 32, 0x04000000 | ((0x20)/(32/8) & 0x1FFFFF));
    }
}
# 1012 "src/battle/battle_interface.c"
__attribute__((naked))
void sub_8044338(u8 a, struct Pokemon *pkmn)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x20\n    adds r4, r1, 0\n    lsls r0, 24\n    lsrs r0, 24\n    str r0, [sp, 0x14]\n    ldr r1, _080443CC @ =gUnknown_0820A864\n    mov r0, sp\n    movs r2, 0x14\n    bl memcpy\n    ldr r1, _080443D0 @ =gSprites\n    ldr r2, [sp, 0x14]\n    lsls r0, r2, 4\n    adds r0, r2\n    lsls r0, 2\n    adds r0, r1\n    ldrh r0, [r0, 0x3A]\n    lsls r0, 24\n    lsrs r0, 24\n    bl GetBankIdentity\n    lsls r0, 24\n    lsrs r0, 24\n    lsls r1, r0, 1\n    adds r1, r0\n    lsls r1, 7\n    ldr r3, _080443D4 @ =gSharedMem + 0x520\n    adds r6, r1, r3\n    movs r0, 0x5\n    mov r8, r0\n    adds r0, r4, 0\n    bl GetNature\n    lsls r0, 24\n    mov r4, sp\n    adds r4, 0x6\n    ldr r1, _080443D8 @ =gNatureNames\n    lsrs r0, 22\n    adds r0, r1\n    ldr r1, [r0]\n    adds r0, r4, 0\n    bl StringCopy\n    adds r0, r6, 0\n    mov r1, sp\n    bl sub_80034D4\n    movs r7, 0x6\n    movs r5, 0\n    mov r1, sp\n    adds r1, 0x9\n    str r1, [sp, 0x1C]\n_080443AA:\n    mov r2, sp\n    adds r0, r2, r7\n    ldrb r1, [r0]\n    adds r0, r1, 0\n    subs r0, 0x37\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x13\n    bls _080443C8\n    adds r0, r1, 0\n    adds r0, 0x79\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x13\n    bhi _080443DC\n_080443C8:\n    movs r0, 0x2C\n    b _080443FA\n    .align 2, 0\n_080443CC: .4byte gUnknown_0820A864\n_080443D0: .4byte gSprites\n_080443D4: .4byte gSharedMem + 0x520\n_080443D8: .4byte gNatureNames\n_080443DC:\n    adds r0, r1, 0\n    subs r0, 0x4B\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x4\n    bls _080443F4\n    adds r0, r1, 0\n    adds r0, 0x65\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x4\n    bhi _080443F8\n_080443F4:\n    movs r0, 0x2D\n    b _080443FA\n_080443F8:\n    movs r0, 0x2B\n_080443FA:\n    bl sub_8043CDC\n    lsls r1, r5, 6\n    adds r1, r6, r1\n    ldr r2, _080444F8 @ =REG_BG0CNT\n    bl CpuSet\n    adds r0, r5, 0x1\n    lsls r0, 24\n    lsrs r5, r0, 24\n    adds r7, 0x1\n    cmp r5, r8\n    bcc _080443AA\n    movs r7, 0x1\n    ldr r3, [sp, 0x14]\n    lsls r3, 4\n    str r3, [sp, 0x18]\n    movs r0, 0x1\n    add r0, r8\n    mov r9, r0\n    cmp r7, r9\n    bge _08044486\n    ldr r1, _080444FC @ =gSprites\n    ldr r2, _080444F8 @ =REG_BG0CNT\n    mov r10, r2\n    ldr r2, [sp, 0x14]\n    adds r0, r3, r2\n    lsls r0, 2\n    adds r0, r1\n    mov r8, r0\n_08044436:\n    mov r3, r8\n    ldrh r0, [r3, 0x4]\n    lsls r0, 22\n    lsrs r0, 22\n    adds r5, r7, 0\n    cmp r7, 0\n    bge _08044446\n    adds r5, r7, 0x7\n_08044446:\n    asrs r5, 3\n    lsls r4, r5, 3\n    subs r4, r7, r4\n    adds r0, r4\n    lsls r5, 6\n    adds r0, r5\n    lsls r0, 5\n    ldr r2, _08044500 @ =0x06010000\n    adds r1, r0, r2\n    adds r0, r6, 0\n    mov r2, r10\n    bl CpuSet\n    adds r6, 0x20\n    mov r3, r8\n    ldrh r0, [r3, 0x4]\n    lsls r0, 22\n    lsrs r0, 22\n    adds r4, 0x8\n    adds r0, r4\n    adds r0, r5\n    lsls r0, 5\n    ldr r2, _08044500 @ =0x06010000\n    adds r1, r0, r2\n    adds r0, r6, 0\n    mov r2, r10\n    bl CpuSet\n    adds r6, 0x20\n    adds r7, 0x1\n    cmp r7, r9\n    blt _08044436\n_08044486:\n    ldr r6, _080444FC @ =gSprites\n    ldr r3, [sp, 0x18]\n    ldr r1, [sp, 0x14]\n    adds r0, r3, r1\n    lsls r0, 2\n    adds r0, r6\n    ldrh r5, [r0, 0x38]\n    lsls r5, 24\n    lsrs r5, 24\n    ldr r4, _08044504 @ =gSharedMem\n    ldr r2, _08044508 @ =0x00016089\n    adds r0, r4, r2\n    ldrb r1, [r0]\n    mov r0, sp\n    adds r0, 0x6\n    movs r2, 0x1\n    movs r3, 0x2\n    bl ConvertIntToDecimalStringN\n    ldr r3, _0804450C @ =0x00016088\n    adds r4, r3\n    ldrb r1, [r4]\n    ldr r0, [sp, 0x1C]\n    movs r2, 0x1\n    movs r3, 0x2\n    bl ConvertIntToDecimalStringN\n    mov r1, sp\n    movs r0, 0\n    strb r0, [r1, 0x5]\n    movs r0, 0xBA\n    strb r0, [r1, 0x8]\n    movs r0, 0x80\n    lsls r0, 18\n    bl sub_80034D4\n    movs r7, 0\n    lsls r0, r5, 4\n    adds r0, r5\n    lsls r0, 2\n    adds r5, r0, r6\n    ldr r4, _08044510 @ =gSharedMem + 0x20\n_080444DA:\n    cmp r7, 0x1\n    bgt _08044514\n    ldrh r1, [r5, 0x4]\n    lsls r1, 22\n    lsrs r1, 22\n    adds r0, r7, 0x2\n    adds r1, r0\n    lsls r1, 5\n    ldr r0, _08044500 @ =0x06010000\n    adds r1, r0\n    adds r0, r4, 0\n    ldr r2, _080444F8 @ =REG_BG0CNT\n    bl CpuSet\n    b _0804452A\n    .align 2, 0\n_080444F8: .4byte 0x04000008\n_080444FC: .4byte gSprites\n_08044500: .4byte 0x06010000\n_08044504: .4byte gSharedMem\n_08044508: .4byte 0x00016089\n_0804450C: .4byte 0x00016088\n_08044510: .4byte gSharedMem + 0x20\n_08044514:\n    ldrh r1, [r5, 0x4]\n    lsls r1, 22\n    lsrs r1, 22\n    adds r1, r7, r1\n    lsls r1, 5\n    ldr r2, _08044544 @ =0x060100c0\n    adds r1, r2\n    adds r0, r4, 0\n    ldr r2, _08044548 @ =REG_BG0CNT\n    bl CpuSet\n_0804452A:\n    adds r4, 0x40\n    adds r7, 0x1\n    cmp r7, 0x4\n    ble _080444DA\n    add sp, 0x20\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08044544: .4byte 0x060100c0\n_08044548: .4byte 0x04000008\n    .syntax divided\n");
# 1270 "src/battle/battle_interface.c"
}


void sub_804454C(void)
{
    s32 i;
    u8 spriteId;

    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (gSprites[gHealthboxIDs[i]].callback == SpriteCallbackDummy
         && GetBankSide(i) != 1
         && (IsDoubleBattle() || GetBankSide(i) != 0))
        {
            u8 r6;

            ((struct Struct2017800 *) (gSharedMem + 0x17800))[i].unk0_4 ^= 1;
            r6 = ((struct Struct2017800 *) (gSharedMem + 0x17800))[i].unk0_4;
            if (GetBankSide(i) == 0)
            {

                if (!IsDoubleBattle())
                    continue;
                if (gBattleTypeFlags & 0x0080)
                    continue;

                if (r6 == 1)
                {
                    spriteId = gSprites[gHealthboxIDs[i]].data[5];

                    { vu32 tmp = (vu32)(0); CpuSet((void *)&tmp, (void *)(0x6000000 + 0x10000) + gSprites[spriteId].oam.tileNum * 32, 0x04000000 | 0x01000000 | ((0x100)/(32/8) & 0x1FFFFF)); };
                    sub_8044210(gHealthboxIDs[i], GetMonData(&gPlayerParty[gBattlePartyID[i]], 57), 0);
                    sub_8044210(gHealthboxIDs[i], GetMonData(&gPlayerParty[gBattlePartyID[i]], 58), 1);
                }
                else
                {
                    draw_status_ailment_maybe(gHealthboxIDs[i]);
                    sub_8045A5C(gHealthboxIDs[i], &gPlayerParty[gBattlePartyID[i]], 5);
                    CpuSet(sub_8043CDC(0x75), (void *)(0x6000000 + 0x10000) + 0x680 + gSprites[gHealthboxIDs[i]].oam.tileNum * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
                }
            }
            else
            {
                if (r6 == 1)
                {
                    if (gBattleTypeFlags & 0x0080)
                    {
                        sub_8044338(gHealthboxIDs[i], &gEnemyParty[gBattlePartyID[i]]);
                    }
                    else
                    {
                        spriteId = gSprites[gHealthboxIDs[i]].data[5];

                        { vu32 tmp = (vu32)(0); CpuSet((void *)&tmp, (void *)(0x6000000 + 0x10000) + gSprites[spriteId].oam.tileNum * 32, 0x04000000 | 0x01000000 | ((0x100)/(32/8) & 0x1FFFFF)); };
                        sub_8044210(gHealthboxIDs[i], GetMonData(&gEnemyParty[gBattlePartyID[i]], 57), 0);
                        sub_8044210(gHealthboxIDs[i], GetMonData(&gEnemyParty[gBattlePartyID[i]], 58), 1);
                    }
                }
                else
                {
                    draw_status_ailment_maybe(gHealthboxIDs[i]);
                    sub_8045A5C(gHealthboxIDs[i], &gEnemyParty[gBattlePartyID[i]], 5);
                    if (gBattleTypeFlags & 0x0080)
                        sub_8045A5C(gHealthboxIDs[i], &gEnemyParty[gBattlePartyID[i]], 4);
                }
            }
            gSprites[gHealthboxIDs[i]].data[7] ^= 1;
        }
    }
}
# 1551 "src/battle/battle_interface.c"
__attribute__((naked))
u8 sub_8044804(u8 a, const struct BattleInterfaceStruct2 *b, u8 c, u8 d)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x28\n    str r1, [sp, 0xC]\n    lsls r0, 24\n    lsrs r0, 24\n    str r0, [sp, 0x8]\n    lsls r2, 24\n    lsrs r2, 24\n    adds r4, r2, 0\n    lsls r3, 24\n    lsrs r3, 24\n    str r3, [sp, 0x10]\n    cmp r4, 0\n    beq _08044834\n    bl GetBankIdentity\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x3\n    beq _08044878\n_08044834:\n    ldr r0, [sp, 0x8]\n    bl GetBankSide\n    lsls r0, 24\n    cmp r0, 0\n    bne _08044854\n    movs r7, 0\n    movs r1, 0x88\n    movs r2, 0x60\n    movs r0, 0x64\n    mov r8, r0\n    ldr r5, _08044850 @ =0x0000fffb\n    b _08044884\n    .align 2, 0\n_08044850: .4byte 0x0000fffb\n_08044854:\n    movs r7, 0x1\n    cmp r4, 0\n    beq _08044864\n    bl IsDoubleBattle\n    lsls r0, 24\n    cmp r0, 0\n    bne _0804486A\n_08044864:\n    movs r1, 0x68\n    movs r2, 0x28\n    b _0804486E\n_0804486A:\n    movs r1, 0x68\n    movs r2, 0x10\n_0804486E:\n    ldr r3, _08044874 @ =0x0000ff9c\n    mov r8, r3\n    b _08044882\n    .align 2, 0\n_08044874: .4byte 0x0000ff9c\n_08044878:\n    movs r7, 0x1\n    movs r1, 0x68\n    movs r2, 0x28\n    ldr r5, _08044930 @ =0x0000ff9c\n    mov r8, r5\n_08044882:\n    movs r5, 0x5\n_08044884:\n    movs r6, 0\n    str r6, [sp, 0x14]\n    lsls r4, r7, 3\n    ldr r0, _08044934 @ =gUnknown_0820A754\n    mov r10, r0\n    lsls r3, r7, 1\n    mov r9, r3\n    lsls r1, 16\n    str r1, [sp, 0x20]\n    lsls r2, 16\n    str r2, [sp, 0x24]\n    ldr r2, _08044938 @ =0x0000ffff\n    ldr r1, [sp, 0xC]\n    movs r6, 0x5\n_080448A0:\n    ldrh r0, [r1]\n    cmp r0, r2\n    beq _080448B4\n    ldr r3, [sp, 0x14]\n    lsls r0, r3, 24\n    movs r3, 0x80\n    lsls r3, 17\n    adds r0, r3\n    lsrs r0, 24\n    str r0, [sp, 0x14]\n_080448B4:\n    adds r1, 0x8\n    subs r6, 0x1\n    cmp r6, 0\n    bge _080448A0\n    mov r6, r10\n    adds r0, r4, r6\n    bl LoadCompressedObjectPic\n    ldr r0, _0804493C @ =gUnknown_0820A784\n    adds r0, r4, r0\n    bl LoadSpriteSheet\n    ldr r0, _08044940 @ =gUnknown_0820A764\n    adds r0, r4, r0\n    bl LoadSpritePalette\n    ldr r0, _08044944 @ =gUnknown_0820A774\n    adds r0, r4, r0\n    bl LoadSpritePalette\n    mov r1, r9\n    adds r0, r1, r7\n    lsls r0, 3\n    ldr r1, _08044948 @ =gSpriteTemplate_820A7A4\n    adds r0, r1\n    ldr r2, [sp, 0x20]\n    asrs r1, r2, 16\n    ldr r3, [sp, 0x24]\n    asrs r2, r3, 16\n    movs r3, 0xA\n    bl CreateSprite\n    lsls r0, 24\n    lsrs r0, 24\n    str r0, [sp, 0x18]\n    lsls r0, 4\n    ldr r6, [sp, 0x18]\n    adds r0, r6\n    lsls r0, 2\n    ldr r1, _0804494C @ =gSprites\n    adds r4, r0, r1\n    ldr r1, _08044950 @ =gSubspriteTables_820A6E4\n    adds r0, r4, 0\n    bl SetSubspriteTables\n    mov r0, r8\n    strh r0, [r4, 0x24]\n    strh r5, [r4, 0x2E]\n    cmp r7, 0\n    beq _08044954\n    ldrh r0, [r4, 0x20]\n    subs r0, 0x60\n    strh r0, [r4, 0x20]\n    ldrb r1, [r4, 0x3]\n    movs r0, 0x3F\n    negs r0, r0\n    ands r0, r1\n    movs r1, 0x10\n    orrs r0, r1\n    strb r0, [r4, 0x3]\n    b _0804495A\n    .align 2, 0\n_08044930: .4byte 0x0000ff9c\n_08044934: .4byte gUnknown_0820A754\n_08044938: .4byte 0x0000ffff\n_0804493C: .4byte gUnknown_0820A784\n_08044940: .4byte gUnknown_0820A764\n_08044944: .4byte gUnknown_0820A774\n_08044948: .4byte gSpriteTemplate_820A7A4\n_0804494C: .4byte gSprites\n_08044950: .4byte gSubspriteTables_820A6E4\n_08044954:\n    ldrh r0, [r4, 0x20]\n    adds r0, 0x60\n    strh r0, [r4, 0x20]\n_0804495A:\n    movs r6, 0\n    ldr r1, _08044A04 @ =gSprites\n    mov r10, r1\n    mov r4, sp\n    mov r2, r9\n    adds r0, r2, r7\n    lsls r0, 3\n    str r0, [sp, 0x1C]\n    movs r3, 0xA\n    mov r9, r3\n    mov r8, r6\n_08044970:\n    ldr r0, _08044A08 @ =gSpriteTemplate_820A7D4\n    ldr r5, [sp, 0x24]\n    ldr r1, _08044A0C @ =0xfffc0000\n    adds r2, r5, r1\n    ldr r3, [sp, 0x1C]\n    adds r0, r3, r0\n    ldr r5, [sp, 0x20]\n    asrs r1, r5, 16\n    asrs r2, 16\n    movs r3, 0x9\n    bl CreateSpriteAtEnd\n    strb r0, [r4]\n    ldr r0, [sp, 0x10]\n    cmp r0, 0\n    bne _080449A0\n    ldrb r0, [r4]\n    lsls r1, r0, 4\n    adds r1, r0\n    lsls r1, 2\n    ldr r2, _08044A10 @ =gSprites + 0x1C\n    adds r1, r2\n    ldr r0, _08044A14 @ =sub_8045180\n    str r0, [r1]\n_080449A0:\n    ldr r5, _08044A04 @ =gSprites\n    cmp r7, 0\n    bne _080449BE\n    ldrb r1, [r4]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    add r0, r10\n    strh r7, [r0, 0x24]\n    ldrb r1, [r4]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    add r0, r10\n    strh r7, [r0, 0x26]\n_080449BE:\n    ldrb r1, [r4]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r5\n    movs r1, 0\n    mov r3, sp\n    ldrh r3, [r3, 0x18]\n    strh r3, [r0, 0x2E]\n    cmp r7, 0\n    bne _08044A18\n    ldrb r0, [r4]\n    lsls r1, r0, 4\n    adds r1, r0\n    lsls r1, 2\n    adds r1, r5\n    ldrh r0, [r1, 0x20]\n    adds r0, 0x18\n    add r0, r8\n    strh r0, [r1, 0x20]\n    ldrb r1, [r4]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r5\n    mov r1, r9\n    strh r1, [r0, 0x30]\n    ldrb r1, [r4]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r5\n    movs r1, 0x78\n    b _08044A56\n    .align 2, 0\n_08044A04: .4byte gSprites\n_08044A08: .4byte gSpriteTemplate_820A7D4\n_08044A0C: .4byte 0xfffc0000\n_08044A10: .4byte gSprites + 0x1C\n_08044A14: .4byte sub_8045180\n_08044A18:\n    ldrb r0, [r4]\n    lsls r2, r0, 4\n    adds r2, r0\n    lsls r2, 2\n    adds r2, r5\n    ldrh r3, [r2, 0x20]\n    subs r3, 0x18\n    movs r1, 0x5\n    subs r1, r6\n    lsls r0, r1, 2\n    adds r0, r1\n    lsls r0, 1\n    subs r3, r0\n    strh r3, [r2, 0x20]\n    ldrb r0, [r4]\n    lsls r2, r0, 4\n    adds r2, r0\n    lsls r2, 2\n    adds r2, r5\n    movs r1, 0x6\n    subs r1, r6\n    lsls r0, r1, 3\n    subs r0, r1\n    adds r0, 0xA\n    strh r0, [r2, 0x30]\n    ldrb r1, [r4]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r5\n    ldr r1, _08044AC4 @ =0x0000ff88\n_08044A56:\n    strh r1, [r0, 0x24]\n    ldrb r1, [r4]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r5\n    strh r7, [r0, 0x32]\n    adds r4, 0x1\n    movs r2, 0x7\n    add r9, r2\n    movs r3, 0xA\n    add r8, r3\n    adds r6, 0x1\n    cmp r6, 0x5\n    bgt _08044A76\n    b _08044970\n_08044A76:\n    ldr r0, [sp, 0x8]\n    bl GetBankSide\n    lsls r0, 24\n    cmp r0, 0\n    bne _08044B5E\n    movs r6, 0\n    ldr r5, _08044AC8 @ =gBattleTypeFlags\n    mov r10, r5\n    ldr r0, _08044ACC @ =0x0000ffff\n    mov r9, r0\n    ldr r7, _08044AD0 @ =gSprites\n    ldr r1, _08044AD4 @ =0x000003ff\n    mov r12, r1\n    ldr r2, _08044AD8 @ =0xfffffc00\n    mov r8, r2\n    mov r4, sp\n    ldr r5, [sp, 0xC]\n_08044A9A:\n    mov r3, r10\n    ldrh r1, [r3]\n    movs r0, 0x40\n    ands r0, r1\n    cmp r0, 0\n    beq _08044ADC\n    ldrh r0, [r5]\n    cmp r0, r9\n    beq _08044AE6\n    cmp r0, 0\n    bne _08044B2E\n    ldrb r0, [r4]\n    lsls r2, r0, 4\n    adds r2, r0\n    lsls r2, 2\n    adds r2, r7\n    ldrh r3, [r2, 0x4]\n    lsls r1, r3, 22\n    lsrs r1, 22\n    adds r1, 0x3\n    b _08044B46\n    .align 2, 0\n_08044AC4: .4byte 0x0000ff88\n_08044AC8: .4byte gBattleTypeFlags\n_08044ACC: .4byte 0x0000ffff\n_08044AD0: .4byte gSprites\n_08044AD4: .4byte 0x000003ff\n_08044AD8: .4byte 0xfffffc00\n_08044ADC:\n    ldr r1, [sp, 0x14]\n    lsls r0, r1, 24\n    asrs r0, 24\n    cmp r6, r0\n    blt _08044B14\n_08044AE6:\n    ldrb r0, [r4]\n    lsls r2, r0, 4\n    adds r2, r0\n    lsls r2, 2\n    adds r2, r7\n    ldrh r3, [r2, 0x4]\n    lsls r1, r3, 22\n    lsrs r1, 22\n    adds r1, 0x1\n    mov r0, r12\n    ands r1, r0\n    mov r0, r8\n    ands r0, r3\n    orrs r0, r1\n    strh r0, [r2, 0x4]\n    ldrb r1, [r4]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r7\n    movs r1, 0x1\n    strh r1, [r0, 0x3C]\n    b _08044B52\n_08044B14:\n    ldrh r0, [r5]\n    cmp r0, 0\n    bne _08044B2E\n    ldrb r0, [r4]\n    lsls r2, r0, 4\n    adds r2, r0\n    lsls r2, 2\n    adds r2, r7\n    ldrh r3, [r2, 0x4]\n    lsls r1, r3, 22\n    lsrs r1, 22\n    adds r1, 0x3\n    b _08044B46\n_08044B2E:\n    ldr r0, [r5, 0x4]\n    cmp r0, 0\n    beq _08044B52\n    ldrb r0, [r4]\n    lsls r2, r0, 4\n    adds r2, r0\n    lsls r2, 2\n    adds r2, r7\n    ldrh r3, [r2, 0x4]\n    lsls r1, r3, 22\n    lsrs r1, 22\n    adds r1, 0x2\n_08044B46:\n    mov r0, r12\n    ands r1, r0\n    mov r0, r8\n    ands r0, r3\n    orrs r0, r1\n    strh r0, [r2, 0x4]\n_08044B52:\n    adds r4, 0x1\n    adds r5, 0x8\n    adds r6, 0x1\n    cmp r6, 0x5\n    ble _08044A9A\n    b _08044C38\n_08044B5E:\n    movs r6, 0\n    ldr r1, _08044BA4 @ =gBattleTypeFlags\n    mov r10, r1\n    ldr r2, _08044BA8 @ =0x0000ffff\n    mov r9, r2\n    ldr r7, _08044BAC @ =gSprites\n    ldr r3, _08044BB0 @ =0x000003ff\n    mov r12, r3\n    ldr r5, _08044BB4 @ =0xfffffc00\n    mov r8, r5\n    ldr r5, [sp, 0xC]\n    mov r4, sp\n    adds r4, 0x5\n_08044B78:\n    mov r0, r10\n    ldrh r1, [r0]\n    movs r0, 0x40\n    ands r0, r1\n    cmp r0, 0\n    beq _08044BB8\n    ldrh r0, [r5]\n    cmp r0, r9\n    beq _08044BC2\n    cmp r0, 0\n    bne _08044C0A\n    ldrb r0, [r4]\n    lsls r2, r0, 4\n    adds r2, r0\n    lsls r2, 2\n    adds r2, r7\n    ldrh r3, [r2, 0x4]\n    lsls r1, r3, 22\n    lsrs r1, 22\n    adds r1, 0x3\n    b _08044C22\n    .align 2, 0\n_08044BA4: .4byte gBattleTypeFlags\n_08044BA8: .4byte 0x0000ffff\n_08044BAC: .4byte gSprites\n_08044BB0: .4byte 0x000003ff\n_08044BB4: .4byte 0xfffffc00\n_08044BB8:\n    ldr r1, [sp, 0x14]\n    lsls r0, r1, 24\n    asrs r0, 24\n    cmp r6, r0\n    blt _08044BF0\n_08044BC2:\n    ldrb r0, [r4]\n    lsls r2, r0, 4\n    adds r2, r0\n    lsls r2, 2\n    adds r2, r7\n    ldrh r3, [r2, 0x4]\n    lsls r1, r3, 22\n    lsrs r1, 22\n    adds r1, 0x1\n    mov r0, r12\n    ands r1, r0\n    mov r0, r8\n    ands r0, r3\n    orrs r0, r1\n    strh r0, [r2, 0x4]\n    ldrb r1, [r4]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r7\n    movs r1, 0x1\n    strh r1, [r0, 0x3C]\n    b _08044C2E\n_08044BF0:\n    ldrh r0, [r5]\n    cmp r0, 0\n    bne _08044C0A\n    ldrb r0, [r4]\n    lsls r2, r0, 4\n    adds r2, r0\n    lsls r2, 2\n    adds r2, r7\n    ldrh r3, [r2, 0x4]\n    lsls r1, r3, 22\n    lsrs r1, 22\n    adds r1, 0x3\n    b _08044C22\n_08044C0A:\n    ldr r0, [r5, 0x4]\n    cmp r0, 0\n    beq _08044C2E\n    ldrb r0, [r4]\n    lsls r2, r0, 4\n    adds r2, r0\n    lsls r2, 2\n    adds r2, r7\n    ldrh r3, [r2, 0x4]\n    lsls r1, r3, 22\n    lsrs r1, 22\n    adds r1, 0x2\n_08044C22:\n    mov r0, r12\n    ands r1, r0\n    mov r0, r8\n    ands r0, r3\n    orrs r0, r1\n    strh r0, [r2, 0x4]\n_08044C2E:\n    subs r4, 0x1\n    adds r5, 0x8\n    adds r6, 0x1\n    cmp r6, 0x5\n    ble _08044B78\n_08044C38:\n    ldr r0, _08044C98 @ =TaskDummy\n    movs r1, 0x5\n    bl CreateTask\n    lsls r0, 24\n    lsrs r4, r0, 24\n    ldr r2, _08044C9C @ =gTasks\n    lsls r3, r4, 2\n    adds r1, r3, r4\n    lsls r1, 3\n    adds r0, r1, r2\n    mov r5, sp\n    ldrh r5, [r5, 0x8]\n    strh r5, [r0, 0x8]\n    mov r6, sp\n    ldrh r6, [r6, 0x18]\n    strh r6, [r0, 0xA]\n    movs r6, 0\n    adds r0, r2, 0\n    adds r0, 0xE\n    adds r1, r0\n_08044C62:\n    mov r5, sp\n    adds r0, r5, r6\n    ldrb r0, [r0]\n    strh r0, [r1]\n    adds r1, 0x2\n    adds r6, 0x1\n    cmp r6, 0x5\n    ble _08044C62\n    adds r0, r3, r4\n    lsls r0, 3\n    adds r0, r2\n    ldrh r6, [r5, 0x10]\n    strh r6, [r0, 0x1C]\n    movs r0, 0x72\n    movs r1, 0\n    bl PlaySE12WithPanning\n    adds r0, r4, 0\n    add sp, 0x28\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r1}\n    bx r1\n    .align 2, 0\n_08044C98: .4byte TaskDummy\n_08044C9C: .4byte gTasks\n    .syntax divided\n");
# 2141 "src/battle/battle_interface.c"
}


void sub_8044CA0(u8 taskId)
{
    u8 sp[6];
    u8 r9;
    u8 r10;
    u8 sp8;
    s32 i;

    r9 = gTasks[taskId].data[10];
    r10 = gTasks[taskId].data[1];
    sp8 = gTasks[taskId].data[0];
    for (i = 0; i < 6; i++)
        sp[i] = gTasks[taskId].data[3 + i];

    (*(vu16 *)(0x4000000 + 0x50)) = 0x3F40;
    (*(vu16 *)(0x4000000 + 0x52)) = 0x10;
    gTasks[taskId].data[15] = 16;
    for (i = 0; i < 6; i++)
        gSprites[sp[i]].oam.objMode = 1;
    gSprites[r10].oam.objMode = 1;
    if (r9 != 0)
    {
        for (i = 0; i < 6; i++)
        {
            if (GetBankSide(sp8) != 0)
            {
                gSprites[sp[5 - i]].data[1] = 7 * i;
                gSprites[sp[5 - i]].data[3] = 0;
                gSprites[sp[5 - i]].data[4] = 0;
                gSprites[sp[5 - i]].callback = sub_8045110;
            }
            else
            {
                gSprites[sp[i]].data[1] = 7 * i;
                gSprites[sp[i]].data[3] = 0;
                gSprites[sp[i]].data[4] = 0;
                gSprites[sp[i]].callback = sub_8045110;
            }
        }
        gSprites[r10].data[0] /= 2;
        gSprites[r10].data[1] = 0;
        gSprites[r10].callback = sub_8045048;
        SetSubspriteTables(&gSprites[r10], gSubspriteTables_820A6EC);
        gTasks[taskId].func = sub_8044E74;
    }
    else
    {
        gTasks[taskId].func = sub_8044F70;
    }
}

static void sub_8044E74(u8 taskId)
{
    u16 temp = gTasks[taskId].data[11]++;

    if ((temp & 1) == 0)
    {
        gTasks[taskId].data[15]--;
        if (gTasks[taskId].data[15] < 0)
            return;
        (*(vu16 *)(0x4000000 + 0x52)) = (gTasks[taskId].data[15]) | ((16 - gTasks[taskId].data[15]) << 8);
    }
    if (gTasks[taskId].data[15] == 0)
        gTasks[taskId].func = sub_8044ECC;
}

static void sub_8044ECC(u8 taskId)
{
    u8 sp[6];
    s32 i;

    gTasks[taskId].data[15]--;
    if (gTasks[taskId].data[15] == -1)
    {
        u8 var = gTasks[taskId].data[1];

        for (i = 0; i < 6; i++)
            sp[i] = gTasks[taskId].data[3 + i];
        DestroySpriteAndFreeResources(&gSprites[var]);
        DestroySpriteAndFreeResources(&gSprites[sp[0]]);
        for (i = 1; i < 6; i++)
            DestroySprite(&gSprites[sp[i]]);
    }
    else if (gTasks[taskId].data[15] == -3)
    {
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x52)) = 0;
        DestroyTask(taskId);
    }
}

static void sub_8044F70(u8 taskId)
{
    u8 sp[6];
    s32 i;

    gTasks[taskId].data[15]--;

    if (gTasks[taskId].data[15] >= 0)
    {
        (*(vu16 *)(0x4000000 + 0x52)) = (gTasks[taskId].data[15]) | ((16 - gTasks[taskId].data[15]) << 8);
    }
    else if (gTasks[taskId].data[15] == -1)
    {
        u8 var = gTasks[taskId].data[1];

        for (i = 0; i < 6; i++)
            sp[i] = gTasks[taskId].data[3 + i];
        DestroySpriteAndFreeResources(&gSprites[var]);
        DestroySpriteAndFreeResources(&gSprites[sp[0]]);
        for (i = 1; i < 6; i++)
            DestroySprite(&gSprites[sp[i]]);
    }
    else if (gTasks[taskId].data[15] == -3)
    {
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x52)) = 0;
        DestroyTask(taskId);
    }
}

void sub_8045030(struct Sprite *sprite)
{
    if (sprite->pos2.x != 0)
        sprite->pos2.x += sprite->data[0];
}

static void sub_8045048(struct Sprite *sprite)
{
    sprite->data[1] += 32;
    if (sprite->data[0] > 0)
        sprite->pos2.x += sprite->data[1] >> 4;
    else
        sprite->pos2.x -= sprite->data[1] >> 4;
    sprite->data[1] &= 0xF;
}

void sub_804507C(struct Sprite *sprite)
{
    u8 r3;
    u16 r2;
    s8 pan;

    if (sprite->data[1] > 0)
    {
        sprite->data[1]--;
        return;
    }
    r3 = sprite->data[2];
    r2 = sprite->data[3];
    r2 += 56;
    sprite->data[3] = r2 & 0xFFF0;
    if (r3 != 0)
    {
        sprite->pos2.x += r2 >> 4;
        if (sprite->pos2.x > 0)
            sprite->pos2.x = 0;
    }
    else
    {
        sprite->pos2.x -= r2 >> 4;
        if (sprite->pos2.x < 0)
            sprite->pos2.x = 0;
    }
    if (sprite->pos2.x == 0)
    {
        pan = 63;
        if (r3 != 0)
            pan = -64;
        if (sprite->data[7] != 0)
            PlaySE2WithPanning(SE_TB_KARA, pan);
        else
            PlaySE1WithPanning(SE_TB_KON, pan);
        sprite->callback = SpriteCallbackDummy;
    }
}

static void sub_8045110(struct Sprite *sprite)
{
    u8 r0;
    u16 r2;

    if (sprite->data[1] > 0)
    {
        sprite->data[1]--;
        return;
    }
    r0 = sprite->data[2];
    r2 = sprite->data[3];
    r2 += 56;
    sprite->data[3] = r2 & 0xFFF0;
    if (r0 != 0)
        sprite->pos2.x += r2 >> 4;
    else
        sprite->pos2.x -= r2 >> 4;
    if (sprite->pos2.x + sprite->pos1.x > 248
     || sprite->pos2.x + sprite->pos1.x < -8)
    {
        sprite->invisible = 1;
        sprite->callback = SpriteCallbackDummy;
    }
}

void sub_8045180(struct Sprite *sprite)
{
    u8 spriteId = sprite->data[0];

    sprite->pos2.x = gSprites[spriteId].pos2.x;
    sprite->pos2.y = gSprites[spriteId].pos2.y;
}

static void sub_80451A0(u8 a, struct Pokemon *pkmn)
{
    u8 nickname[10];
    u8 gender;
    u16 species;
    u8 language;
    u8 *ptr;
    s32 i;
    s32 _7;
    u8 *const *r1;

    StringCopy(gDisplayedStringBattle, gUnknown_0820A8B0);
    GetMonData(pkmn, 2, nickname);
    StringGetEnd10(nickname);
    ptr = StringCopy(gDisplayedStringBattle + 3, nickname);
    ptr[0] = 0xFC;
    ptr[1] = 3;
    ptr[2] = 3;
    ptr[3] = 0xFC;
    ptr[4] = 1;
    ptr += 5;
    gender = GetMonGender(pkmn);
    species = GetMonData(pkmn, 11);
    language = GetMonData(pkmn, 3);
    if (ShouldHideGenderIconForLanguage(species, nickname, language))
        gender = 100;
    switch (gender)
    {
    default:
        ptr[0] = 0xB;
        ptr[1] = 0xFF;
        ptr += 1;
        break;
    case 0x00:
        ptr[0] = 0xB;
        ptr[1] = 0xB5;
        ptr[2] = 0xFF;
        ptr += 2;
        break;
    case 0xFE:
        ptr[0] = 0xA;
        ptr[1] = 0xB6;
        ptr[2] = 0xFF;
        ptr += 2;
        break;
    }
    ptr[0] = 0xFC;
    ptr[1] = 0x13;
    ptr[2] = 0x37;
    ptr[3] = 0xFF;
    ptr = (u8 *)(0x02000000 + 0x520) + GetBankIdentity(gSprites[a].data[6]) * 0x180;
    sub_80034D4(ptr, gDisplayedStringBattle);

    i = 0;
    _7 = 6;
    if (GetMonData(pkmn, 3) == 1
     && GetMonData(pkmn, 45) == 0)
    {
        u8 *p = gDisplayedStringBattle;

        while (*p != 0xFF)
        {
            if (*p == 0xFC)
            {
                p += GetExtCtrlCodeLength(p[1]) + 1;
            }
            else
            {
                u8 r0;

                if ((*p >= 0x37 && *p <= 0x4A) || (*p >= 0x87 && *p <= 0x9A))
                    r0 = 0x2C;
                else if ((*p >= 0x4B && *p <= 0x4F) || (*p >= 0x9B && *p <= 0x9F))
                    r0 = 0x2D;
                else
                    r0 = 0x2B;

                CpuSet(sub_8043CDC(r0), ptr + 0x40 * i, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
                i++;
                p++;
            }
        }
    }

    for (; i < _7; i++)
        CpuSet(sub_8043CDC(0x2B), ptr + 64 * i, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));

    if (GetBankSide(gSprites[a].data[6]) == 0 && !IsDoubleBattle())
    {
        r1 = (u8 *const *)gUnknown_0820A8B4;
        for (i = 0; i < _7; i++)
        {
            u8 *r4 = r1[i];

            r4 += gSprites[a].oam.tileNum * 32;
            CpuSet(ptr, r4, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
            ptr += 32;

            r4 += 0x100;
            CpuSet(ptr, r4, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
            ptr += 32;
        }
    }
    else
    {
        if (GetBankSide(gSprites[a].data[6]) == 0)
            r1 = (u8 *const *)gUnknown_0820A904;
        else
            r1 = (u8 *const *)gUnknown_0820A8DC;
        for (i = 0; i < _7; i++)
        {
            u8 *r4 = r1[i];

            r4 += gSprites[a].oam.tileNum * 32;
            CpuSet(ptr, r4, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
            ptr += 32;

            r4 += 0x100;
            CpuSet(ptr, r4, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
            ptr += 32;
        }
    }
}

static void sub_8045458(u8 a, u8 b)
{
    u8 r4;

    if (gBattleTypeFlags & 0x200)
        return;
    if (gBattleTypeFlags & 8)
        return;

    r4 = gSprites[a].data[6];
    if (GetBankSide(r4) != 0)
    {
        u16 species = GetMonData(&gEnemyParty[gBattlePartyID[r4]], 11);
        if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), 1) != 0)
        {
            r4 = gSprites[a].data[5];
            if (b != 0)
                CpuSet(sub_8043CDC(0x46), (void *)(0x6000000 + 0x10000) + (gSprites[r4].oam.tileNum + 8) * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
            else
                { vu32 tmp = (vu32)(0); CpuSet((void *)&tmp, (void *)(0x6000000 + 0x10000) + (gSprites[r4].oam.tileNum + 8) * 32, 0x04000000 | 0x01000000 | ((32)/(32/8) & 0x1FFFFF)); };
        }
    }
}

static void draw_status_ailment_maybe(u8 a)
{
    s32 r4;
    s32 r4_2;
    u8 r7;
    u8 r10;
    s16 r8;
    const u8 *r6;
    u8 r0;
    s32 i;

    r7 = gSprites[a].data[6];
    r10 = gSprites[a].data[5];
    if (GetBankSide(r7) == 0)
    {
        r4 = GetMonData(&gPlayerParty[gBattlePartyID[r7]], 55);
        if (!IsDoubleBattle())
            r8 = 0x1A;
        else
            r8 = 0x12;
    }
    else
    {
        r4 = GetMonData(&gEnemyParty[gBattlePartyID[r7]], 55);
        r8 = 0x11;
    }
    if (r4 & 7)
    {
        r6 = sub_8043CDC(sub_80457E8(0x1B, r7));
        r0 = 2;
    }
    else if (r4 & 0x88)
    {
        r6 = sub_8043CDC(sub_80457E8(0x15, r7));
        r0 = 0;
    }
    else if (r4 & 0x10)
    {
        r6 = sub_8043CDC(sub_80457E8(0x21, r7));
        r0 = 4;
    }
    else if (r4 & 0x20)
    {
        r6 = sub_8043CDC(sub_80457E8(0x1E, r7));
        r0 = 3;
    }
    else if (r4 & 0x40)
    {
        r6 = sub_8043CDC(sub_80457E8(0x18, r7));
        r0 = 1;
    }
    else
    {
        r6 = sub_8043CDC(0x27);

        for (i = 0; i < 3; i++)
            CpuSet(r6, (void *)(0x6000000 + 0x10000) + (gSprites[a].oam.tileNum + r8 + i) * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));

        if (!((struct Struct2017800 *) (gSharedMem + 0x17800))[r7].unk0_4)
            CpuSet(sub_8043CDC(1), (void *)(0x6000000 + 0x10000) + gSprites[r10].oam.tileNum * 32, 0x04000000 | ((64)/(32/8) & 0x1FFFFF));

        sub_8045458(a, 1);
        return;
    }

    r4_2 = gSprites[a].oam.paletteNum * 16;
    r4_2 += r7 + 12;

    FillPalette(r0[gBattleInterfaceStatusIcons_DynPal], r4_2 + 0x100, 2);
    CpuSet(gPlttBufferUnfaded + 0x100 + r4_2, (void *)((0x5000000 + 0x200) + r4_2 * 2), 0x00000000 | ((2)/(16/8) & 0x1FFFFF));
    CpuSet(r6, (void *)(0x6000000 + 0x10000) + (gSprites[a].oam.tileNum + r8) * 32, 0x04000000 | ((96)/(32/8) & 0x1FFFFF));
    if (IsDoubleBattle() == 1 || GetBankSide(r7) == 1)
    {
        if (!((struct Struct2017800 *) (gSharedMem + 0x17800))[r7].unk0_4)
        {
            CpuSet(sub_8043CDC(0), (void *)(0x6000000 + 0x10000) + gSprites[r10].oam.tileNum * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
            CpuSet(sub_8043CDC(0x41), (void *)(0x6000000 + 0x10000) + (gSprites[r10].oam.tileNum + 1) * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
        }
    }
    sub_8045458(a, 0);
}

static u8 sub_80457E8(u8 a, u8 b)
{
    u8 ret = a;

    switch (a)
    {
    case 21:
        if (b == 0)
            ret = 21;
        else if (b == 1)
            ret = 71;
        else if (b == 2)
            ret = 86;
        else
            ret = 101;
        break;
    case 24:
        if (b == 0)
            ret = 24;
        else if (b == 1)
            ret = 74;
        else if (b == 2)
            ret = 89;
        else
            ret = 104;
        break;
    case 27:
        if (b == 0)
            ret = 27;
        else if (b == 1)
            ret = 77;
        else if (b == 2)
            ret = 92;
        else
            ret = 107;
        break;
    case 30:
        if (b == 0)
            ret = 30;
        else if (b == 1)
            ret = 80;
        else if (b == 2)
            ret = 95;
        else
            ret = 110;
        break;
    case 33:
        if (b == 0)
            ret = 33;
        else if (b == 1)
            ret = 83;
        else if (b == 2)
            ret = 98;
        else
            ret = 113;
        break;
    }
    return ret;
}

static void sub_80458B0(u8 a)
{
    u8 *r6;
    u8 r8;
    u8 i;
    s32 r7;
    u8 *addr;

    r6 = (u8 *)(0x02000000 + 0x520) + GetBankIdentity(gSprites[a].data[6]) * 0x180;
    r8 = 7;
    sub_80034D4(r6, BattleText_SafariBalls);
    for (i = 0; i < r8; i++)
        CpuSet(sub_8043CDC(0x2B), r6 + i * 64, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
    for (r7 = 3; r7 < 3 + r8; r7++)
    {
        addr = (void *)(0x6000000 + 0x10000) + (gSprites[a].oam.tileNum + ((r7) - (r7) / 8 * 8) + 64 * ((r7) / 8)) * 32;
        CpuSet(r6, addr, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
        r6 += 32;

        addr = (void *)(0x6000000 + 0x10000) + (8 + gSprites[a].oam.tileNum + ((r7) - (r7) / 8 * 8) + 64 * ((r7) / 8)) * 32;
        CpuSet(r6, addr, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
        r6 += 32;
    }

}

static void sub_8045998(u8 a)
{
    u8 *r7;
    u8 status;
    s32 r6;
    s32 i;

    r7 = StringCopy(gDisplayedStringBattle, BattleText_SafariBallsLeft);
    r7 = sub_8003504(r7, gNumSafariBalls, 10, 1);
    StringAppend(r7, BattleText_HighlightRed);
    status = GetBankIdentity(gSprites[a].data[6]);
    r7 = (u8 *)(0x02000000 + 0x520) + status * 0x180;
    r6 = 5;
    sub_80034D4(r7, gDisplayedStringBattle);
    r7 = (u8 *)(0x02000000 + 0x520) + status * 0x180 + 32;
    for (i = 6; i < 6 + r6; i++)
    {
        CpuSet(r7, (void *)(0x6000000 + 0x10000) + (gSprites[a].oam.tileNum + 0x18 + ((i) - (i) / 8 * 8) + 64 * ((i) / 8)) * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
        r7 += 64;
    }
}

void sub_8045A5C(u8 a, struct Pokemon *pkmn, u8 c)
{
    u8 r10;
    u32 maxhp;
    u32 currhp;

    r10 = gSprites[a].data[6];
    if (GetBankSide(r10) == 0)
    {
        if (c == 3 || c == 0)
            sub_8043FC0(a, GetMonData(pkmn, 56));
        if (c == 1 || c == 0)
            sub_80440EC(a, GetMonData(pkmn, 57), 0);
        if (c == 2 || c == 0)
            sub_80440EC(a, GetMonData(pkmn, 58), 1);
        if (c == 5 || c == 0)
        {
            load_gfxc_health_bar(0);
            maxhp = GetMonData(pkmn, 58);
            currhp = GetMonData(pkmn, 57);
            sub_8043D84(r10, a, maxhp, currhp, 0);
            sub_8045C78(r10, a, 0, 0);
        }
        if (!IsDoubleBattle() && (c == 6 || c == 0))
        {
            u16 species;
            u8 level;
            u32 exp;
            u32 var1;
            u32 var2;
            u32 currLevelExp;

            load_gfxc_health_bar(3);
            species = GetMonData(pkmn, 11);
            level = GetMonData(pkmn, 56);
            exp = GetMonData(pkmn, 25);
            currLevelExp = gExperienceTables[gBaseStats[species].growthRate][level];
            var1 = exp - currLevelExp;
            var2 = gExperienceTables[gBaseStats[species].growthRate][level + 1] - currLevelExp;
            sub_8043D84(r10, a, var2, var1, 0);
            sub_8045C78(r10, a, 1, 0);
        }
        if (c == 4 || c == 0)
            sub_80451A0(a, pkmn);
        if (c == 9 || c == 0)
            draw_status_ailment_maybe(a);
        if (c == 10)
            sub_80458B0(a);
        if (c == 10 || c == 11)
            sub_8045998(a);
    }
    else
    {
        if (c == 3 || c == 0)
            sub_8043FC0(a, GetMonData(pkmn, 56));
        if (c == 5 || c == 0)
        {
            load_gfxc_health_bar(0);
            maxhp = GetMonData(pkmn, 58);
            currhp = GetMonData(pkmn, 57);
            sub_8043D84(r10, a, maxhp, currhp, 0);
            sub_8045C78(r10, a, 0, 0);
        }
        if (c == 4 || c == 0)
            sub_80451A0(a, pkmn);
        if (c == 9 || c == 0)
            draw_status_ailment_maybe(a);
    }
}

s32 sub_8045C78(u8 a, u8 unused1, u8 c, u8 unused2)
{
    s32 r6;

    if (c == 0)
    {
        r6 = sub_8045F58(((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk4, ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk8, ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unkC, &((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk10, 6, 1);
    }
    else
    {
        u16 r5;
        s32 r8;

        r5 = GetScaledExpFraction(((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk8, ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unkC, ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk4, 8);
        if (r5 == 0)
            r5 = 1;
        r8 = ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unkC;
        r5 = ((r8 / r5) >= 0 ? (r8 / r5) : -(r8 / r5));
        r6 = sub_8045F58(((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk4, ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk8, r8, &((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk10, 8, r5);
    }
    if (c == 1 || (c == 0 && (!((struct Struct2017800 *) (gSharedMem + 0x17800))[a].unk0_4)))
        sub_8045D58(a, c);
    if (r6 == -1)
        ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk10 = 0;
    return r6;
}

static void sub_8045D58(u8 a, u8 b)
{
    u8 sp8[7];
    u8 r0;
    u8 r8;
    u8 i;

    switch (b)
    {
    case 0:
        r0 = sub_804602C(((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk4, ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk8, ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unkC, &((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk10, sp8, 6);
        r8 = 3;
        if (r0 <= 0x18)
        {
            r8 = 0x38;
            if (r0 > 9)
                r8 = 0x2F;
        }
        for (i = 0; i < 6; i++)
        {
            u8 r4 = gSprites[((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk0].data[5];
            if (i < 2)
                CpuSet(sub_8043CDC(r8) + sp8[i] * 32, (void *)(0x6000000 + 0x10000) + (gSprites[r4].oam.tileNum + 2 + i) * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
            else
                CpuSet(sub_8043CDC(r8) + sp8[i] * 32, (void *)(0x6000000 + 0x10000) + 64 + (i + gSprites[r4].oam.tileNum) * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
        }
        break;
    case 1:
        sub_804602C(((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk4, ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk8, ((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unkC, &((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk10, sp8, 8);
        r0 = GetMonData(&gPlayerParty[gBattlePartyID[a]], 56);
        if (r0 == 100)
        {
            for (i = 0; i < 8; i++)
                sp8[i] = 0;
        }
        for (i = 0; i < 8; i++)
        {
            if (i < 4)
                CpuSet(sub_8043CDC(0xC) + sp8[i] * 32, (void *)(0x6000000 + 0x10000) + (gSprites[((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk0].oam.tileNum + 0x24 + i) * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
            else
                CpuSet(sub_8043CDC(0xC) + sp8[i] * 32, (void *)(0x6000000 + 0x10000) + 0xB80 + (i + gSprites[((struct UnknownStruct5 *)(gSharedMem + 0x17850))[a].unk0].oam.tileNum) * 32, 0x04000000 | ((32)/(32/8) & 0x1FFFFF));
        }
        break;
    }
}

static int sub_8045F58(s32 a, s32 b, int c, int *d, u8 e, u16 f)
{
    u8 r2 = e << 3;
    int r6;
    int ret;

    if (*d == -32768)
    {
        if (a < r2)
            *d = b << 8;
        else
            *d = b;
    }

    b -= c;
    if (b < 0)
        b = 0;
    else if (b > a)
        b = a;
    if (a < r2)
    {
        int var = *d >> 8;

        r6 = *d;
        if (b == var && (r6 & 0xFF) == 0)
            return -1;
    }
    else
    {
        r6 = *d;
        if (b == r6)
            return -1;
    }

    if (a < r2)
    {
        int r0 = (a << 8) / r2;

        if (c < 0)
        {
            *d = r6 + r0;
            ret = *d >> 8;
            if (ret >= b)
            {
                *d = b << 8;
                ret = b;
            }
        }

        else
        {
            *d = r6 - r0;
            ret = *d >> 8;
            if ((*d & 0xFF) > 0)
                ret++;
            if (ret <= b)
            {
                *d = b << 8;
                ret = b;
            }
        }
    }
    else
    {

        if (c < 0)
        {
            *d += f;
            if (*d > b)
                *d = b;
            ret = *d;
        }

        else
        {
            *d -= f;
            if (*d < b)
                *d = b;
            ret = *d;
        }
    }
    return ret;
}

static u8 sub_804602C(int a, int b, int c, int *d, u8 *e, u8 f)
{
    s32 r5 = b - c;
    u8 r3;
    u8 i;
    u8 r2;

    if (r5 < 0)
        r5 = 0;
    else if (r5 > a)
        r5 = a;
    r3 = f << 3;
    for (i = 0; i < f; i++)
        e[i] = 0;
    if (a < r3)
        r2 = *d * r3 / a >> 8;
    else
        r2 = *d * r3 / a;
    r3 = r2;
    if (r3 == 0 && r5 > 0)
    {
        e[0] = 1;
        r3 = 1;
    }
    else
    {
        for (i = 0; i < f; i++)
        {
            if (r2 >= 8)
            {
                e[i] = 8;
            }
            else
            {
                e[i] = r2;
                break;
            }
            r2 -= 8;
        }
    }
    return r3;
}

s16 sub_80460C8(struct BattleInterfaceStruct1 *a, int *b, u16 *c, int d)
{
    u16 r7;
    s16 r1;

    r7 = sub_8045F58(a->unk0, a->unk4, a->unk8, b, 6, 1);
    sub_8046128(a, b, c);
    if (a->unk0 < 0x30)
        r1 = *b >> 8;
    else
        r1 = *b;
    do_nothing(a->unk0, r1, d);
    return r7;
}

static void sub_8046128(struct BattleInterfaceStruct1 *a, int *b, u16 *c)
{
    u8 sp8[6];
    u16 sp10[6];
    u8 i;

    sub_804602C(a->unk0, a->unk4, a->unk8, b, (u8 *)sp8, 6);
    for (i = 0; i < 6; i++)
        sp10[i] = (a->unkC_0 << 12) | (a->unk10 + sp8[i]);
    CpuSet(sp10, c, 0x00000000 | ((sizeof(sp10))/(16/8) & 0x1FFFFF));
}

static u8 GetScaledExpFraction(int a, int b, int c, u8 d)
{
    u8 r7 = d * 8;
    int r5 = a - b;
    s8 r4;
    s8 r0;
    s32 result;

    if (r5 < 0)
        r5 = 0;
    else if (r5 > c)
        r5 = c;

    r4 = a * r7 / c;
    r0 = r5 * r7 / c;
    result = r4 - r0;
    return ((result) >= 0 ? (result) : -(result));
}

u8 GetScaledHPFraction(s16 hp, s16 maxhp, u8 scale)
{
    u8 result = hp * scale / maxhp;

    if (result == 0 && hp > 0)
        return 1;
    return result;
}

u8 GetHPBarLevel(s16 hp, s16 maxhp)
{
    int result;

    if (hp == maxhp)
        result = 4;
    else
    {
        u8 fraction = GetScaledHPFraction(hp, maxhp, 48);
        if (fraction > 24)
            result = 3;
        else if (fraction > 9)
            result = 2;
        else if (fraction > 0)
            result = 1;
        else
            result = 0;
    }
    return result;
}
