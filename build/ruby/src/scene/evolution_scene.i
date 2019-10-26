# 1 "src/scene/evolution_scene.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/scene/evolution_scene.c"
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
# 2 "src/scene/evolution_scene.c" 2
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
# 3 "src/scene/evolution_scene.c" 2
# 1 "include/evolution_scene.h" 1



void EvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, bool8 canStopEvo, u8 partyID);
void BeginEvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, bool8 canStopEvo, u8 partyID);
void TradeEvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, u8 preEvoSpriteID, u8 partyID);

extern void (*gCB2_AfterEvolution)(void);
# 4 "src/scene/evolution_scene.c" 2
# 1 "include/evolution_graphics.h" 1



void LoadEvoSparkleSpriteAndPal(void);

u8 LaunchTask_PreEvoSparklesSet1(u16 arg0);
u8 LaunchTask_PreEvoSparklesSet2(void);
u8 LaunchTask_PostEvoSparklesSet1(void);
u8 LaunchTask_PostEvoSparklesSet2AndFlash(u16 species);
u8 LaunchTask_PostEvoSparklesSet2AndFlash_Trade(u16 species);
u8 sub_8149E7C(u8 preEvoSpriteID, u8 postEvoSpriteID);
# 5 "src/scene/evolution_scene.c" 2
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
# 6 "src/scene/evolution_scene.c" 2
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
# 7 "src/scene/evolution_scene.c" 2
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
# 8 "src/scene/evolution_scene.c" 2
# 1 "include/text_window.h" 1



# 1 "include/text.h" 1
# 5 "include/text_window.h" 2

struct FrameGraphics
{
    const u8 *tiles;
    const u16 *palette;
};

u16 SetTextWindowBaseTileNum(u16 baseTileNum);
void LoadTextWindowGraphics(struct Window *win);
void LoadTextWindowGraphics_OverridePalSlot(struct Window *win, u8 palSlot);
void LoadTextWindowGraphics_OverrideFrameType(struct Window *win, u8 frameType);
void DrawTextWindow(struct Window *win, u8 left, u8 top, u8 right, u8 bottom);
const struct FrameGraphics *GetTextWindowFrameGraphics(u8 frameType);
u16 SetMessageBoxBaseTileNum(u16 baseTileNum);
void unref_sub_80651DC(struct Window *, u8 *);
void DisplayMessageBox(struct Window *);
void DrawStandardMessageBox(struct Window *win);
void LoadMessageBoxTiles(struct Window *win);
void ClearStandardMessageBox(struct Window *win);
# 9 "src/scene/evolution_scene.c" 2
# 1 "include/pokemon.h" 1
# 10 "src/scene/evolution_scene.c" 2
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
# 11 "src/scene/evolution_scene.c" 2
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
# 12 "src/scene/evolution_scene.c" 2
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
# 13 "src/scene/evolution_scene.c" 2
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
# 14 "src/scene/evolution_scene.c" 2
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
# 15 "src/scene/evolution_scene.c" 2
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
# 16 "src/scene/evolution_scene.c" 2
# 1 "include/trade.h" 1




struct TradeEwramSubstruct2 {
               u8 filler_0000;
               struct Window window;
               u8 textWindowBaseTileNum;
               struct Pokemon pokemon;
               u8 unk_009c;
               u8 unk_009d;
               u16 linkData[10];
               u8 unk_00b2;
               u8 unk_00b3;
               u16 unk_00b4;
               u16 unk_00b6;

               u8 pokePicSpriteIdxs[2];
               u8 unk_00ba;
               u8 unk_00bb;
               u8 unk_00bc;
               u8 unk_00bd;

               u32 unk_00c0;

               u16 unk_00c4;
               u8 filler_00c6[0x3c];
               u8 unk_0102;
               u8 unk_0103;
               u16 unk_0104;
               u16 unk_0106;
               u16 unk_0108;
               u16 unk_010a;
               u16 unk_010c;
               s16 unk_010e;
               s16 bg1vofs;
               s16 bg1hofs;
               s16 bg2vofs;
               s16 bg2hofs;
               u16 unk_0118;
               u16 unk_011a;
               u16 unk_011c;
               u8 isLinkTrade;
               u16 tradeSpecies[2];
               u16 unk_0124;
};

extern struct TradeEwramSubstruct2 *gUnknown_03004828;
extern const u16 gUnknown_0820C9F8[][16];
extern const u32 gUnknown_0820CA98[];
extern const u16 gUnknown_0820F798[];

void sub_8047CD8(void);
u16 sub_804DB2C(void);
void sub_804DB68(void);
void sub_804E174(void);
extern const u8 gOtherText_MaleSymbol3[2];
extern const u8 gOtherText_FemaleSymbol3[2];
extern const u8 gOtherText_GenderlessSymbol[2];

void sub_804E22C(void);
u16 sub_804D89C(void);
# 17 "src/scene/evolution_scene.c" 2
# 1 "include/menu.h" 1



# 1 "include/task.h" 1
# 5 "include/menu.h" 2


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
# 18 "src/scene/evolution_scene.c" 2
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
# 19 "src/scene/evolution_scene.c" 2
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
# 20 "src/scene/evolution_scene.c" 2
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
# 21 "src/scene/evolution_scene.c" 2
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
# 22 "src/scene/evolution_scene.c" 2
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
# 23 "src/scene/evolution_scene.c" 2
# 1 "include/battle_message.h" 1



struct StringInfoBattle
{
    u16 currentMove;
    u16 lastMove;
    u16 lastItem;
    u8 lastAbility;
    u8 scrActive;
    u8 unk1605E;
    u8 hpScale;
    u8 StringBank;
    u8 moveType;
    u8 abilities[4];
    u8 textBuffs[3][0x10];
};

void BufferStringBattle(u16 stringID);
u32 StrCpyDecodeToDisplayedStringBattle(const u8* src);
u32 StrCpyDecodeBattle(const u8* src, u8* dst);
# 24 "src/scene/evolution_scene.c" 2
# 1 "include/pokemon_summary_screen.h" 1



extern const u8 *const gNatureNames[];

void ShowPokemonSummaryScreen(struct Pokemon *, u8, u8, void (*)(void), int);
void sub_809D9F0(struct Pokemon *party, u8, u8, void *, u32);
void sub_809D9F0(struct Pokemon *, u8, u8, void *, u32);
u8 sub_809FA30(void);
u8 pokemon_ailments_get_primary(u32);
u8 GetMonStatusAndPokerus();
u8 *sub_80A1E9C(u8 *dest, const u8 *src, u8);
u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level);
u8 PokemonSummaryScreen_CheckOT(struct Pokemon *pokemon);
bool8 CheckPartyPokerus(struct Pokemon *, u8);
# 25 "src/scene/evolution_scene.c" 2
# 1 "include/menu_cursor.h" 1





void sub_814A590(void);
u8 sub_814A5C0(u8 a1, u16 a2, u8 a3, u16 a4, u8 a5);
u8 sub_814A758(u8 a1, u8 a2, u8 a3, u8 a4);
u8 unref_sub_814A7AC(u8 a1, u16 a2, u8 a3);
void DestroyMenuCursor(void);
void sub_814A880(u8 a1, u8 a2);
void sub_814A904(void);
void sub_814A958(u8 a1);
void sub_814AABC(void (*callback)(struct Sprite *));
void sub_814AAF8(u16 a1);
void sub_814AB84(void);
void unref_sub_814ABE4(int a1);
u8 CreateBlendedOutlineCursor(u8 a1, u16 a2, u8 a3, u16 a4, u8 a5);
void sub_814AD44(void);
void sub_814AD7C(u8 a1, u8 a2);
void sub_814ADC8(void);
void sub_814ADF4(u8 a1);
# 26 "src/scene/evolution_scene.c" 2
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
# 27 "src/scene/evolution_scene.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 28 "src/scene/evolution_scene.c" 2

struct EvoInfo
{
    u8 preEvoSpriteID;
    u8 postEvoSpriteID;
    u8 evoTaskID;
    u8 field_3;

    u8 unk4[0x40];
    u8 unk44[0x40];
    u8 unk84[0x40];

    u8 unkC4[0x40][0x20];
    u8 unk8C4[0x40][0x20];
    u8 unk10C4[0x40][0x20];
    u8 unk18C4[0x40][0x20];
    u8 unk20C4[0x40][0x20];
    u8 unk28C4[0x40][0x20];
    u8 unk30C4[0x40][0x20];
    u8 unk38C4[0x40][0x20];

    u8 *unk40C4[0x40][0x20];

    u16 unk60C4[0x40][0x20];
    u16 unk70C4[0x40][0x20];
    u16 unk80C4[0x40][0x20];
    u16 unk90C4[0x40][0x20];

    u8 unkA0C4;
};

void EvolutionRenameMon(struct Pokemon *mon, u16 oldSpecies, u16 newSpecies);
void sub_8024CEC(void);
void sub_8023A80(void);
void sub_802BC6C(void);
void sub_8023AD8(void);
void nullsub_6(void);
bool32 IsHMMove2(u16 move);

extern struct Window gUnknown_03004210;
extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_03004288;
extern u16 gUnknown_03004280;
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B8;
extern u8 gBattleTerrain;
extern u8 gReservedSpritePaletteCount;
extern u16 gMoveToLearn;
extern struct SpriteTemplate gUnknown_02024E8C;
extern bool8 gAffineAnimsDisabled;
extern u8 gDisplayedStringBattle[];
extern u8 gBattleTextBuff2[];

extern u8 gBattleCommunication[];



extern const u8 BattleText_StartEvo[];
extern const u8 BattleText_FinishEvo[];
extern const u8 BattleText_StopEvo[];
extern void * const gUnknown_081FAF4C[];
extern const u8* const gBattleStringsTable[];


static void Task_EvolutionScene(u8 taskID);
static void Task_TradeEvolutionScene(u8 taskID);
static void CB2_EvolutionSceneUpdate(void);
static void CB2_TradeEvolutionSceneUpdate(void);
static void EvoDummyFunc(void);
static void EvoDummyFunc2(void);
static void VBlankCB_EvolutionScene(void);
static void VBlankCB_TradeEvolutionScene(void);
static void sub_81150D8(void);


MainCallback gCB2_AfterEvolution;


static const u8 sUnknownShedinjaJpnString[] = _("ヌケニン");
static const u8 sUnusedString0[] = _("{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}");
static const u8 sUnusedString1[] = _("▶\n ");
static const u8 sUnusedString2[] = _("       \n▶");
static const u8 sUnusedString3[] = _("       \n ");
static const u8 sPadding[9] = {0};



static void CB2_BeginEvolutionScene(void)
{
    UpdatePaletteFade();
    RunTasks();
}
# 141 "src/scene/evolution_scene.c"
static void Task_BeginEvolutionScene(u8 taskID)
{
    struct Pokemon* mon = ((void *)0);
    switch (gTasks[taskID].data[0])
    {
    case 0:
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
        gTasks[taskID].data[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            u16 speciesToEvolve;
            bool8 canStopEvo;
            u8 partyID;

            mon = (struct Pokemon*)(gTasks[taskID].data[1] | (gTasks[taskID].data[2] << 0x10));
            speciesToEvolve = gTasks[taskID].data[4];
            canStopEvo = gTasks[taskID].data[5];
            partyID = gTasks[taskID].data[12];

            DestroyTask(taskID);
            EvolutionScene(mon, speciesToEvolve, canStopEvo, partyID);
        }
        break;
    }
}

void BeginEvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, bool8 canStopEvo, u8 partyID)
{
    u8 taskID = CreateTask(Task_BeginEvolutionScene, 0);
    gTasks[taskID].data[0] = 0;
    gTasks[taskID].data[1] = (u32)(mon);
    gTasks[taskID].data[2] = (u32)(mon) >> 0x10;
    gTasks[taskID].data[4] = speciesToEvolve;
    gTasks[taskID].data[5] = canStopEvo;
    gTasks[taskID].data[12] = partyID;
    SetMainCallback2(CB2_BeginEvolutionScene);
}

void EvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, bool8 canStopEvo, u8 partyID)
{
    u8 name[20];
    u16 currSpecies;
    u32 TiD, PiD;
    const struct CompressedSpritePalette** pokePal;
    u8 ID;
    SetHBlankCallback(((void *)0));
    SetVBlankCallback(((void *)0));
    { vu32 tmp = (vu32)(0); CpuSet((void *)&tmp, (void*)(0x6000000), 0x04000000 | 0x01000000 | ((0x18000)/(32/8) & 0x1FFFFF)); };

    (*(vu16 *)(0x4000000 + 0x4c)) = 0;
    (*(vu16 *)(0x4000000 + 0x40)) = 0;
    (*(vu16 *)(0x4000000 + 0x44)) = 0;
    (*(vu16 *)(0x4000000 + 0x42)) = 0;
    (*(vu16 *)(0x4000000 + 0x46)) = 0;
    (*(vu16 *)(0x4000000 + 0x48)) = 0;
    (*(vu16 *)(0x4000000 + 0x4a)) = 0;

    SetUpWindowConfig(&gWindowConfig_81E6C58);
    ResetPaletteFade();

    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    gUnknown_03004288 = 0;
    gUnknown_03004280 = 0;
    gUnknown_030041B0 = 256;
    gUnknown_030041B8 = 0;

    InitWindowFromConfig(&gUnknown_03004210, &gWindowConfig_81E6C58);
    gBattleTerrain = BATTLE_TERRAIN_PLAIN;

    sub_800D6D4();
    sub_800DAB8();
    ResetSpriteData();
    remove_some_task();
    ResetTasks();
    FreeAllSpritePalettes();

    gReservedSpritePaletteCount = 4;

    GetMonData(mon, 2, name);
    StringCopy10(gStringVar1, name);
    StringCopy(gStringVar2, gSpeciesNames[speciesToEvolve]);


    currSpecies = GetMonData(mon, 11);
    TiD = GetMonData(mon, 1);
    PiD = GetMonData(mon, 0);
    DecompressPicFromTable_2(&gMonFrontPicTable[currSpecies],
                             gMonFrontPicCoords[currSpecies].coords,
                             gMonFrontPicCoords[currSpecies].y_offset,
                             (void*)(0x2000000),
                             gUnknown_081FAF4C[1], currSpecies);
    pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(currSpecies, TiD, PiD);
    LoadCompressedPalette(*pokePal, 0x110, 0x20);

    GetMonSpriteTemplate_803C56C(currSpecies, 1);
    gUnknown_02024E8C.affineAnims = gDummySpriteAffineAnimTable;
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).preEvoSpriteID = ID = CreateSprite(&gUnknown_02024E8C, 120, 64, 30);

    gSprites[ID].callback = nullsub_37;
    gSprites[ID].oam.paletteNum = 1;
    gSprites[ID].invisible = 1;


    DecompressPicFromTable_2(&gMonFrontPicTable[speciesToEvolve],
                             gMonFrontPicCoords[speciesToEvolve].coords,
                             gMonFrontPicCoords[speciesToEvolve].y_offset,
                             (void*)(0x2000000),
                             gUnknown_081FAF4C[3], speciesToEvolve);
    pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(speciesToEvolve, TiD, PiD);
    LoadCompressedPalette(*pokePal, 0x120, 0x20);

    GetMonSpriteTemplate_803C56C(speciesToEvolve, 3);
    gUnknown_02024E8C.affineAnims = gDummySpriteAffineAnimTable;
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).postEvoSpriteID = ID = CreateSprite(&gUnknown_02024E8C, 120, 64, 30);
    gSprites[ID].callback = nullsub_37;
    gSprites[ID].oam.paletteNum = 2;
    gSprites[ID].invisible = 1;

    LoadEvoSparkleSpriteAndPal();

    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).evoTaskID = ID = CreateTask(Task_EvolutionScene, 0);
    gTasks[ID].data[0] = 0;
    gTasks[ID].data[3] = currSpecies;
    gTasks[ID].data[4] = speciesToEvolve;
    gTasks[ID].data[1] = (u32)(mon);
    gTasks[ID].data[2] = (u32)(mon) >> 0x10;
    gTasks[ID].data[5] = canStopEvo;
    gTasks[ID].data[6] = 1;
    gTasks[ID].data[11] = 0;
    gTasks[ID].data[12] = partyID;

    memcpy((void *)(0x02000000 + 0x9000), &gPlttBufferUnfaded[0x20], 0x60);

    (*(vu16 *)(0x4000000 + 0x0)) = 0x1000 | 0x0F00 | 0x0040;
    SetHBlankCallback(EvoDummyFunc);
    SetVBlankCallback(VBlankCB_EvolutionScene);
    m4aMPlayAllStop();
    SetMainCallback2(CB2_EvolutionSceneUpdate);
}

static void CB2_EvolutionSceneLoadGraphics(void)
{
    u8 ID;
    const struct CompressedSpritePalette** pokePal;
    u16 postEvoSpecies;
    u32 TiD, PiD;
    struct Pokemon* Mon = &gPlayerParty[gTasks[((*(struct EvoInfo*)(gSharedMem + 0x14800))).evoTaskID].data[12]];

    postEvoSpecies = gTasks[((*(struct EvoInfo*)(gSharedMem + 0x14800))).evoTaskID].data[4];
    TiD = GetMonData(Mon, 1);
    PiD = GetMonData(Mon, 0);

    SetHBlankCallback(((void *)0));
    SetVBlankCallback(((void *)0));
    { vu32 tmp = (vu32)(0); CpuSet((void *)&tmp, (void*)(0x6000000), 0x04000000 | 0x01000000 | ((0x18000)/(32/8) & 0x1FFFFF)); };

    (*(vu16 *)(0x4000000 + 0x4c)) = 0;
    (*(vu16 *)(0x4000000 + 0x40)) = 0;
    (*(vu16 *)(0x4000000 + 0x44)) = 0;
    (*(vu16 *)(0x4000000 + 0x42)) = 0;
    (*(vu16 *)(0x4000000 + 0x46)) = 0;
    (*(vu16 *)(0x4000000 + 0x48)) = 0;
    (*(vu16 *)(0x4000000 + 0x4a)) = 0;
    SetUpWindowConfig(&gWindowConfig_81E6C58);
    ResetPaletteFade();
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    gUnknown_03004288 = 0;
    gUnknown_03004280 = 0;
    gUnknown_030041B0 = 256;
    gUnknown_030041B8 = 0;

    InitWindowFromConfig(&gUnknown_03004210, &gWindowConfig_81E6C58);
    gBattleTerrain = BATTLE_TERRAIN_PLAIN;

    sub_800D6D4();
    sub_800DAB8();
    ResetSpriteData();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 4;

    DecompressPicFromTable_2(&gMonFrontPicTable[postEvoSpecies],
                             gMonFrontPicCoords[postEvoSpecies].coords,
                             gMonFrontPicCoords[postEvoSpecies].y_offset,
                             (void*)(0x2000000),
                             gUnknown_081FAF4C[3], postEvoSpecies);
    pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(postEvoSpecies, TiD, PiD);
    LoadCompressedPalette(*pokePal, 0x120, 0x20);

    GetMonSpriteTemplate_803C56C(postEvoSpecies, 3);
    gUnknown_02024E8C.affineAnims = gDummySpriteAffineAnimTable;
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).postEvoSpriteID = ID = CreateSprite(&gUnknown_02024E8C, 120, 64, 30);

    gSprites[ID].callback = nullsub_37;
    gSprites[ID].oam.paletteNum = 2;

    (*(vu16 *)(0x4000000 + 0x0)) = 0x1000 | 0x0F00 | 0x0040;
    SetHBlankCallback(EvoDummyFunc);
    SetVBlankCallback(VBlankCB_EvolutionScene);
    SetMainCallback2(CB2_EvolutionSceneUpdate);
    BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
}

static void CB2_TradeEvolutionSceneLoadGraphics(void)
{
    struct Pokemon* Mon = &gPlayerParty[gTasks[((*(struct EvoInfo*)(gSharedMem + 0x14800))).evoTaskID].data[12]];
    u16 postEvoSpecies = gTasks[((*(struct EvoInfo*)(gSharedMem + 0x14800))).evoTaskID].data[4];

    switch (gMain.state)
    {
    case 0:
        (*(vu16 *)(0x4000000 + 0x0)) = 0;
        SetHBlankCallback(((void *)0));
        SetVBlankCallback(((void *)0));
        ResetSpriteData();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 4;
        gUnknown_030042A4 = 0;
        gUnknown_030042A0 = 0;
        gUnknown_030042C0 = 0;
        gUnknown_030041B4 = 0;
        gUnknown_03004288 = 0;
        gUnknown_03004280 = 0;
        gUnknown_030041B0 = 256;
        gUnknown_030041B8 = 0;
        gMain.state++;
        break;
    case 1:
        SetUpWindowConfig(&gWindowConfig_81E6F84);
        InitWindowFromConfig(&gUnknown_03004828->window, &gWindowConfig_81E6F84);
        gMain.state++;
        break;
    case 2:
        LoadTextWindowGraphics(&gUnknown_03004828->window);
        gUnknown_03004828->textWindowBaseTileNum = SetTextWindowBaseTileNum(2);
        LoadTextWindowGraphics(&gUnknown_03004828->window);
        MenuZeroFillScreen();
        ResetPaletteFade();
        gMain.state++;
        SetHBlankCallback(EvoDummyFunc);
        SetVBlankCallback(VBlankCB_TradeEvolutionScene);
        break;
    case 3:
        sub_804E22C();
        gMain.state++;
        break;
    case 4:
        {
            const struct CompressedSpritePalette** pokePal;
            u32 TiD = GetMonData(Mon, 1);
            u32 PiD = GetMonData(Mon, 0);
            DecompressPicFromTable_2(&gMonFrontPicTable[postEvoSpecies],
                                     gMonFrontPicCoords[postEvoSpecies].coords,
                                     gMonFrontPicCoords[postEvoSpecies].y_offset,
                                     (void*)(0x2000000),
                                     gUnknown_081FAF4C[3], postEvoSpecies);
            pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(postEvoSpecies, TiD, PiD);
            LoadCompressedPalette(*pokePal, 0x120, 0x20);
            gMain.state++;
        }
        break;
    case 5:
        {
            u8 ID;

            GetMonSpriteTemplate_803C56C(postEvoSpecies, 3);
            gUnknown_02024E8C.affineAnims = gDummySpriteAffineAnimTable;
            ((*(struct EvoInfo*)(gSharedMem + 0x14800))).postEvoSpriteID = ID = CreateSprite(&gUnknown_02024E8C, 120, 64, 30);

            gSprites[ID].callback = nullsub_37;
            gSprites[ID].oam.paletteNum = 2;
            gMain.state++;
        }
        break;
    case 6:
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        SetMainCallback2(CB2_TradeEvolutionSceneUpdate);
        (*(vu16 *)(0x4000000 + 0x0)) = 0x1000 | 0x0100 | 0x0200 | 0x0040;
        break;
    }
}

void TradeEvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, u8 preEvoSpriteID, u8 partyID)
{
    u8 name[20];
    u16 currSpecies;
    u32 TiD, PiD;
    const struct CompressedSpritePalette** pokePal;
    u8 ID;

    GetMonData(mon, 2, name);
    StringCopy10(gStringVar1, name);
    StringCopy(gStringVar2, gSpeciesNames[speciesToEvolve]);

    gAffineAnimsDisabled = 1;


    currSpecies = GetMonData(mon, 11);
    PiD = GetMonData(mon, 0);
    TiD = GetMonData(mon, 1);
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).preEvoSpriteID = preEvoSpriteID;
    DecompressPicFromTable_2(&gMonFrontPicTable[speciesToEvolve],
                             gMonFrontPicCoords[speciesToEvolve].coords,
                             gMonFrontPicCoords[speciesToEvolve].y_offset,
                             (void*)(0x2000000),
                             gUnknown_081FAF4C[1], speciesToEvolve);
    pokePal = (void*) GetMonSpritePalStructFromOtIdPersonality(speciesToEvolve, TiD, PiD);
    LoadCompressedPalette(*pokePal, 0x120, 0x20);

    GetMonSpriteTemplate_803C56C(speciesToEvolve, 1);
    gUnknown_02024E8C.affineAnims = gDummySpriteAffineAnimTable;
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).postEvoSpriteID = ID = CreateSprite(&gUnknown_02024E8C, 120, 64, 30);

    gSprites[ID].callback = nullsub_37;
    gSprites[ID].oam.paletteNum = 2;
    gSprites[ID].invisible = 1;

    LoadEvoSparkleSpriteAndPal();

    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).evoTaskID = ID = CreateTask(Task_TradeEvolutionScene, 0);
    gTasks[ID].data[0] = 0;
    gTasks[ID].data[3] = currSpecies;
    gTasks[ID].data[4] = speciesToEvolve;
    gTasks[ID].data[1] = (u32)(mon);
    gTasks[ID].data[2] = (u32)(mon) >> 0x10;
    gTasks[ID].data[6] = 1;
    gTasks[ID].data[11] = 0;
    gTasks[ID].data[12] = partyID;

    SetMainCallback2(CB2_TradeEvolutionSceneUpdate);
}

static void CB2_EvolutionSceneUpdate(void)
{
    AnimateSprites();
    BuildOamBuffer();
    sub_800374C(&gUnknown_03004210);
    UpdatePaletteFade();
    RunTasks();
}

static void CB2_TradeEvolutionSceneUpdate(void)
{
    AnimateSprites();
    BuildOamBuffer();
    sub_80035AC(&gUnknown_03004828->window);
    UpdatePaletteFade();
    RunTasks();
}

static void CreateShedinja(u16 preEvoSpecies, struct Pokemon* mon)
{
    u32 data = 0;
    if (gEvolutionTable[preEvoSpecies].evolutions[0].method == 0x000d && gPlayerPartyCount < 6)
    {
        s32 i;
        struct Pokemon* Shedinja = &gPlayerParty[gPlayerPartyCount];
        const struct EvolutionData* EvoTable;
        const struct EvolutionData* Evos;

        CopyMon(Shedinja, mon, sizeof(struct Pokemon));
        SetMonData(Shedinja, 11, (void*)(&gEvolutionTable[preEvoSpecies].evolutions[1].targetSpecies));
        SetMonData(Shedinja, 2, (void*)(gSpeciesNames[gEvolutionTable[preEvoSpecies].evolutions[1].targetSpecies]));
        SetMonData(Shedinja, 12, (void*)(&data));
        SetMonData(Shedinja, 8, (void*)(&data));
        SetMonData(Shedinja, 10, (void*)(&data));
        for (i = 50; i < 50 + 5; i++)
            SetMonData(Shedinja, i, (void*)(&data));
        for (i = 67; i <= 79; i++)
            SetMonData(Shedinja, i, (void*)(&data));
        SetMonData(Shedinja, 55, (void*)(&data));
        data = 0xFF;
        SetMonData(Shedinja, 64, (void*)(&data));

        CalculateMonStats(Shedinja);
        CalculatePlayerPartyCount();


        EvoTable = gEvolutionTable;
        Evos = EvoTable + preEvoSpecies;
        GetSetPokedexFlag(SpeciesToNationalPokedexNum(Evos->evolutions[1].targetSpecies), 2);
        GetSetPokedexFlag(SpeciesToNationalPokedexNum(Evos->evolutions[1].targetSpecies), 3);

        if (GetMonData(Shedinja, 11) == SPECIES_SHEDINJA
            && GetMonData(Shedinja, 3) == LANGUAGE_JAPANESE
            && GetMonData(mon, 11) == SPECIES_NINJASK)
                SetMonData(Shedinja, 2, sUnknownShedinjaJpnString);
    }
}

static void Task_EvolutionScene(u8 taskID)
{
    u32 var;
    struct Pokemon* mon = (struct Pokemon*)(gTasks[taskID].data[1] | (gTasks[taskID].data[2] << 0x10));


    if (gMain.heldKeys == 0x0002 && gTasks[taskID].data[0] == 8 && gTasks[taskID].data[5] & 0x1)
    {
        gTasks[taskID].data[0] = 16;
        if (gTasks[gBattleCommunication[2]].isActive)
            gTasks[gBattleCommunication[2]].data[8] = 1;
    }
    switch (gTasks[taskID].data[0])
    {
    case 0:
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        gSprites[((*(struct EvoInfo*)(gSharedMem + 0x14800))).preEvoSpriteID].invisible = 0;
        gTasks[taskID].data[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            StringExpandPlaceholders(gStringVar4, BattleText_StartEvo);
            sub_8002EB0(&gUnknown_03004210, gStringVar4, 144, 2, 15);
            gTasks[taskID].data[0]++;
        }
        break;
    case 2:
        if (gUnknown_03004210.state == 0)
        {
            PlayCry1(gTasks[taskID].data[3], 0);
            gTasks[taskID].data[0]++;
        }
        break;
    case 3:
        if (IsCryFinished())
        {
            PlaySE(BGM_ME_SHINKA);
            gTasks[taskID].data[0]++;
        }
        break;
    case 4:
        if (!IsSEPlaying())
        {
            PlayNewMapMusic(BGM_SHINKA);
            gTasks[taskID].data[0]++;
            BeginNormalPaletteFade(0x1C, 4, 0, 0x10, 0);
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            gBattleCommunication[2] = LaunchTask_PreEvoSparklesSet1(17);
            gTasks[taskID].data[0]++;
        }
        break;
    case 6:
        if (!gTasks[gBattleCommunication[2]].isActive)
        {
            gTasks[taskID].data[0]++;
            ((*(struct EvoInfo*)(gSharedMem + 0x14800))).field_3 = 1;
            gBattleCommunication[2] = LaunchTask_PreEvoSparklesSet2();
        }
        break;
    case 7:
        if (!gTasks[gBattleCommunication[2]].isActive)
        {
            gBattleCommunication[2] = sub_8149E7C(((*(struct EvoInfo*)(gSharedMem + 0x14800))).preEvoSpriteID, ((*(struct EvoInfo*)(gSharedMem + 0x14800))).postEvoSpriteID);
            gTasks[taskID].data[0]++;
        }
        break;
    case 8:
        if (--((*(struct EvoInfo*)(gSharedMem + 0x14800))).field_3 == 0)
        {
            ((*(struct EvoInfo*)(gSharedMem + 0x14800))).field_3 = 3;
            if (!gTasks[gBattleCommunication[2]].isActive)
                gTasks[taskID].data[0]++;
        }
        break;
    case 9:
        gBattleCommunication[2] = LaunchTask_PostEvoSparklesSet1();
        gTasks[taskID].data[0]++;
        break;
    case 10:
        if (!gTasks[gBattleCommunication[2]].isActive)
        {
            gBattleCommunication[2] = LaunchTask_PostEvoSparklesSet2AndFlash(gTasks[taskID].data[4]);
            gTasks[taskID].data[0]++;
        }
        break;
    case 11:
        if (!gTasks[gBattleCommunication[2]].isActive)
        {
            PlaySE(SE_EXP);
            gTasks[taskID].data[0]++;
        }
        break;
    case 12:
        if (IsSEPlaying())
        {
            m4aMPlayAllStop();
            PlayCry1(gTasks[taskID].data[4], 0);
            memcpy(&gPlttBufferUnfaded[0x20], (void *)(0x02000000 + 0x9000), 0x60);
            BeginNormalPaletteFade(0x1C, 0, 0x10, 0, 0);
            gTasks[taskID].data[0]++;
        }
        break;
    case 13:
        if (IsCryFinished() && !gPaletteFade.active)
        {
            StringExpandPlaceholders(gStringVar4, BattleText_FinishEvo);
            sub_8002EB0(&gUnknown_03004210, gStringVar4, 144, 2, 15);
            PlayBGM(BGM_FANFA5);
            gTasks[taskID].data[0]++;
            SetMonData(mon, 11, (void*)(&gTasks[taskID].data[4]));
            CalculateMonStats(mon);
            EvolutionRenameMon(mon, gTasks[taskID].data[3], gTasks[taskID].data[4]);
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(gTasks[taskID].data[4]), 2);
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(gTasks[taskID].data[4]), 3);
            IncrementGameStat(14);
        }
        break;
    case 14:
        if (gUnknown_03004210.state == 0)
        {
            var = MonTryLearningNewMove(mon, gTasks[taskID].data[6]);
            if (var != 0 && !gTasks[taskID].data[11])
            {
                u8 text[20];

                Overworld_PlaySpecialMapMusic();
                gTasks[taskID].data[5] |= 0x80;
                gTasks[taskID].data[6] = 0;
                gTasks[taskID].data[8] = 0;
                GetMonData(mon, 2, text);
                StringCopy10(gBattleTextBuff1, text);
                if (var == 0xFFFF)
                    gTasks[taskID].data[0] = 21;
                else if (var == 0xFFFE)
                    break;
                else
                    gTasks[taskID].data[0] = 19;
            }
            else
            {
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                gTasks[taskID].data[0]++;
            }
        }
        break;
    case 15:
        if (!gPaletteFade.active)
        {
            if (!(gTasks[taskID].data[5] & 0x80))
                Overworld_PlaySpecialMapMusic();
            if (!gTasks[taskID].data[11])
                CreateShedinja(gTasks[taskID].data[3], mon);
            DestroyTask(taskID);
            SetMainCallback2(gCB2_AfterEvolution);
        }
        break;
    case 16:
        if (!gTasks[gBattleCommunication[2]].isActive)
        {
            m4aMPlayAllStop();
            BeginNormalPaletteFade(0x6001C, 0, 0x10, 0, 0x7FFF);
            gTasks[taskID].data[0]++;
        }
        break;
    case 17:
        if (!gPaletteFade.active)
        {
            PlayCry1(gTasks[taskID].data[3], 0);
            gTasks[taskID].data[0]++;
        }
        break;
    case 18:
        if (IsCryFinished())
        {
            StringExpandPlaceholders(gStringVar4, BattleText_StopEvo);
            sub_8002EB0(&gUnknown_03004210, gStringVar4, 144, 2, 15);
            gTasks[taskID].data[11] = 1;
            gTasks[taskID].data[0] = 14;
        }
        break;
    case 19:
        if (gUnknown_03004210.state == 0 && !IsSEPlaying())
        {
            sub_8024CEC();
            PlayFanfare(BGM_FANFA1);
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[3]);
            sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
            gTasks[taskID].data[6] = 0x40;
            gTasks[taskID].data[0]++;
        }
        break;
    case 20:
        if (gUnknown_03004210.state == 0 && !IsSEPlaying() && --gTasks[taskID].data[6] == 0)
            gTasks[taskID].data[0] = 14;
        break;
    case 21:
        switch (gTasks[taskID].data[8])
        {
        case 0:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
            {
                sub_8024CEC();
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[4]);
                sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].data[8]++;
            }
            break;
        case 1:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[5]);
                sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].data[8]++;
            }
            break;
        case 2:
            if (gUnknown_03004210.state != 0)
                break;
            if (!IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[6]);
                sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].data[9] = 5;
                gTasks[taskID].data[10] = 9;
                gTasks[taskID].data[8]++;
            }
        case 3:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
            {
                sub_8023A80();
                gTasks[taskID].data[8]++;
                gBattleCommunication[1] = 0;
                sub_802BC6C();
            }
            break;
        case 4:
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
                sub_8023AD8();
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[292]);
                sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                PlaySE(SE_SELECT);
                if (gBattleCommunication[1] != 0)
                    gTasks[taskID].data[8] = gTasks[taskID].data[10];
                else
                {
                    gTasks[taskID].data[8] = gTasks[taskID].data[9];
                    if (gTasks[taskID].data[8] == 5)
                        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                }
            }
            if (gMain.newKeys & 0x0002)
            {
                sub_8023AD8();
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[292]);
                sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                PlaySE(SE_SELECT);
                gTasks[taskID].data[8] = gTasks[taskID].data[10];
            }
            break;
        case 5:
            if (!gPaletteFade.active)
            {
                sub_809D9F0(gPlayerParty, gTasks[taskID].data[12],
                            gPlayerPartyCount - 1, CB2_EvolutionSceneLoadGraphics,
                            gMoveToLearn);
                gTasks[taskID].data[8]++;
            }
            break;
        case 6:
            if (!gPaletteFade.active && gMain.callback2 == CB2_EvolutionSceneUpdate)
            {
                var = sub_809FA30();
                if (var == 4)
                    gTasks[taskID].data[8] = 9;
                else
                {
                    u16 move = GetMonData(mon, var + 13);
                    if (IsHMMove2(move))
                    {
                        StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[307]);
                        sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                        gTasks[taskID].data[8] = 11;
                    }
                    else
                    {
                        gBattleTextBuff2[0] = 0xFD;
                        gBattleTextBuff2[1] = 2;
                        gBattleTextBuff2[2] = move;
                        gBattleTextBuff2[3] = (move & 0xFF00) >> 8;
                        gBattleTextBuff2[4] = 0xFF;
                        RemoveMonPPBonus(mon, var);
                        SetMonMoveSlot(mon, gMoveToLearn, var);
                        StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[207]);
                        sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                        gTasks[taskID].data[8]++;
                    }
                }
            }
            break;
        case 7:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[7]);
                sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].data[8]++;
            }
            break;
        case 8:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[208]);
                sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
                gTasks[taskID].data[0] = 19;
            }
            break;
        case 9:
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[8]);
            sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
            gTasks[taskID].data[9] = 10;
            gTasks[taskID].data[10] = 0;
            gTasks[taskID].data[8] = 3;
            break;
        case 10:
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[9]);
            sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
            gTasks[taskID].data[0] = 14;
            break;
        case 11:
            if (gUnknown_03004210.state == 0 && !IsSEPlaying())
                gTasks[taskID].data[8] = 5;
            break;
        }
        break;
    }
}

static void Task_TradeEvolutionScene(u8 taskID)
{
    u32 var;
    struct Pokemon* mon = (struct Pokemon*)(gTasks[taskID].data[1] | (gTasks[taskID].data[2] << 0x10));

    switch (gTasks[taskID].data[0])
    {
    case 0:
        StringExpandPlaceholders(gStringVar4, BattleText_StartEvo);
        sub_8002EB0(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
        gTasks[taskID].data[0]++;
        break;
    case 1:
        if (gUnknown_03004828->window.state == 0)
        {
            PlayCry1(gTasks[taskID].data[3], 0);
            gTasks[taskID].data[0]++;
        }
        break;
    case 2:
        if (IsCryFinished())
        {
            m4aSongNumStop(BGM_SHINKA);
            PlaySE(BGM_ME_SHINKA);
            gTasks[taskID].data[0]++;
        }
        break;
    case 3:
        if (!IsSEPlaying())
        {
            PlayBGM(BGM_SHINKA);
            gTasks[taskID].data[0]++;
            BeginNormalPaletteFade(0x1C, 4, 0, 0x10, 0);
        }
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            (*(vu16 *)(0x4000000 + 0x0)) = 0x1000 | 0x0100 | 0x0200 | 0x0040;
            gBattleCommunication[2] = LaunchTask_PreEvoSparklesSet1(17);
            gTasks[taskID].data[0]++;
        }
        break;
    case 5:
        if (!gTasks[gBattleCommunication[2]].isActive)
        {
            gTasks[taskID].data[0]++;
            ((*(struct EvoInfo*)(gSharedMem + 0x14800))).field_3 = 1;
            gBattleCommunication[2] = LaunchTask_PreEvoSparklesSet2();
        }
        break;
    case 6:
        if (!gTasks[gBattleCommunication[2]].isActive)
        {
            gBattleCommunication[2] = sub_8149E7C(((*(struct EvoInfo*)(gSharedMem + 0x14800))).preEvoSpriteID, ((*(struct EvoInfo*)(gSharedMem + 0x14800))).postEvoSpriteID);
            gTasks[taskID].data[0]++;
        }
        break;
    case 7:
        if (--((*(struct EvoInfo*)(gSharedMem + 0x14800))).field_3 == 0)
        {
            ((*(struct EvoInfo*)(gSharedMem + 0x14800))).field_3 = 3;
            if (!gTasks[gBattleCommunication[2]].isActive)
                gTasks[taskID].data[0]++;
        }
        break;
    case 8:
        gBattleCommunication[2] = LaunchTask_PostEvoSparklesSet1();
        gTasks[taskID].data[0]++;
        break;
    case 9:
        if (!gTasks[gBattleCommunication[2]].isActive)
        {
            gBattleCommunication[2] = LaunchTask_PostEvoSparklesSet2AndFlash_Trade(gTasks[taskID].data[4]);
            gTasks[taskID].data[0]++;
        }
        break;
    case 10:
        if (!gTasks[gBattleCommunication[2]].isActive)
        {
            PlaySE(SE_EXP);
            gTasks[taskID].data[0]++;
        }
        break;
    case 11:
        if (IsSEPlaying())
        {
            PlayCry1(gTasks[taskID].data[4], 0);
            memcpy(&gPlttBufferUnfaded[0x20], (void *)(0x02000000 + 0x9000), 0x60);
            BeginNormalPaletteFade(1, 0, 0x10, 0, 0);
            gTasks[taskID].data[0]++;
        }
        break;
    case 12:
        if (IsCryFinished() && !gPaletteFade.active)
        {
            StringExpandPlaceholders(gStringVar4, BattleText_FinishEvo);
            sub_8002EB0(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            PlayFanfare(BGM_FANFA5);
            gTasks[taskID].data[0]++;
            SetMonData(mon, 11, (void*)(&gTasks[taskID].data[4]));
            CalculateMonStats(mon);
            EvolutionRenameMon(mon, gTasks[taskID].data[3], gTasks[taskID].data[4]);
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(gTasks[taskID].data[4]), 2);
            GetSetPokedexFlag(SpeciesToNationalPokedexNum(gTasks[taskID].data[4]), 3);
            IncrementGameStat(14);
        }
        break;
    case 13:
        if (gUnknown_03004828->window.state == 0 && IsFanfareTaskInactive() == 1)
        {
            var = MonTryLearningNewMove(mon, gTasks[taskID].data[6]);
            if (var != 0 && !gTasks[taskID].data[11])
            {
                u8 text[20];

                gTasks[taskID].data[5] |= 0x80;
                gTasks[taskID].data[6] = 0;
                gTasks[taskID].data[8] = 0;
                GetMonData(mon, 2, text);
                StringCopy10(gBattleTextBuff1, text);
                if (var == 0xFFFF)
                    gTasks[taskID].data[0] = 17;
                else if (var == 0xFFFE)
                    break;
                else
                    gTasks[taskID].data[0] = 15;
            }
            else
            {
                PlayBGM(BGM_SHINKA);
                sub_8002EB0(&gUnknown_03004828->window, gOtherText_LinkStandby2, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gTasks[taskID].data[0]++;
            }
        }
        break;
    case 14:
        if (gUnknown_03004828->window.state == 0)
        {
            DestroyTask(taskID);
            SetMainCallback2(gCB2_AfterEvolution);
        }
        break;
    case 15:
        if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
        {
            sub_8024CEC();
            PlayFanfare(BGM_FANFA1);
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[3]);
            sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            gTasks[taskID].data[6] = 0x40;
            gTasks[taskID].data[0]++;
        }
        break;
    case 16:
        if (gUnknown_03004828->window.state == 0 && IsFanfareTaskInactive() == 1 && --gTasks[taskID].data[6] == 0)
            gTasks[taskID].data[0] = 13;
        break;
    case 17:
        switch (gTasks[taskID].data[8])
        {
        case 0:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                sub_8024CEC();
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[4]);
                sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gTasks[taskID].data[8]++;
            }
            break;
        case 1:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[5]);
                sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gTasks[taskID].data[8]++;
            }
            break;
        case 2:
            if (gUnknown_03004828->window.state != 0)
                break;
            if (!IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[6]);
                sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gTasks[taskID].data[9] = 5;
                gTasks[taskID].data[10] = 9;
                gTasks[taskID].data[8]++;
            }
        case 3:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                DrawTextWindow(&gUnknown_03004828->window, 24, 8, 29, 13);
                gBattleCommunication[1] = 0;
                InitWindow(&gUnknown_03004828->window, gOtherText_YesNoAndPlayer, gUnknown_03004828->textWindowBaseTileNum + 128, 25, 9);
                sub_8002F44(&gUnknown_03004828->window);
                sub_814A5C0(0, 0xFFFF, 0xC, 0x2D9F, 0x20);
                sub_81150D8();
                gTasks[taskID].data[8]++;
                gBattleCommunication[1] = 0;
            }
            break;
        case 4:
            if (gMain.newKeys & 0x0040 && gBattleCommunication[1] != 0)
            {
                PlaySE(SE_SELECT);
                EvoDummyFunc2();
                gBattleCommunication[1] = 0;
                sub_81150D8();
            }
            if (gMain.newKeys & 0x0080 && gBattleCommunication[1] == 0)
            {
                PlaySE(SE_SELECT);
                EvoDummyFunc2();
                gBattleCommunication[1] = 1;
                sub_81150D8();
            }
            if (gMain.newKeys & 0x0001)
            {
                ZeroFillWindowRect(&gUnknown_03004828->window, 0x18, 8, 0x1D, 0xD);
                DestroyMenuCursor();
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[292]);
                sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                PlaySE(SE_SELECT);
                if (gBattleCommunication[1] != 0)
                    gTasks[taskID].data[8] = gTasks[taskID].data[10];
                else
                {
                    gTasks[taskID].data[8] = gTasks[taskID].data[9];
                    if (gTasks[taskID].data[8] == 5)
                        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                }
            }
            if (gMain.newKeys & 0x0002)
            {
                ZeroFillWindowRect(&gUnknown_03004828->window, 0x18, 8, 0x1D, 0xD);
                DestroyMenuCursor();
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[292]);
                sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                PlaySE(SE_SELECT);
                gTasks[taskID].data[8] = gTasks[taskID].data[10];
            }
            break;
        case 5:
            if (!gPaletteFade.active)
            {
                sub_809D9F0(gPlayerParty, gTasks[taskID].data[12],
                            gPlayerPartyCount - 1, CB2_TradeEvolutionSceneLoadGraphics,
                            gMoveToLearn);
                gTasks[taskID].data[8]++;
            }
            break;
        case 6:
            if (!gPaletteFade.active && gMain.callback2 == CB2_TradeEvolutionSceneUpdate)
            {
                var = sub_809FA30();
                if (var == 4)
                    gTasks[taskID].data[8] = 9;
                else
                {
                    u16 move = GetMonData(mon, var + 13);
                    if (IsHMMove2(move))
                    {
                        StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[307]);
                        sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                        gTasks[taskID].data[8] = 11;
                    }
                    else
                    {
                        gBattleTextBuff2[0] = 0xFD;
                        gBattleTextBuff2[1] = 2;
                        gBattleTextBuff2[2] = move;
                        gBattleTextBuff2[3] = (move & 0xFF00) >> 8;
                        gBattleTextBuff2[4] = 0xFF;
                        RemoveMonPPBonus(mon, var);
                        SetMonMoveSlot(mon, gMoveToLearn, var);
                        StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[207]);
                        sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                        gTasks[taskID].data[8]++;
                    }
                }
            }
            break;
        case 7:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[7]);
                sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gTasks[taskID].data[8]++;
            }
            break;
        case 8:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
            {
                StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[208]);
                sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gTasks[taskID].data[0] = 15;
            }
            break;
        case 9:
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[8]);
            sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            gTasks[taskID].data[9] = 10;
            gTasks[taskID].data[10] = 0;
            gTasks[taskID].data[8] = 3;
            break;
        case 10:
            StrCpyDecodeToDisplayedStringBattle(gBattleStringsTable[9]);
            sub_8002EB0(&gUnknown_03004828->window, gDisplayedStringBattle, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            gTasks[taskID].data[0] = 13;
            break;
        case 11:
            if (gUnknown_03004828->window.state == 0 && !IsSEPlaying())
                gTasks[taskID].data[8] = 5;
            break;
        }
        break;
    }
}
# 1519 "src/scene/evolution_scene.c"
__attribute__((naked))
void unref_sub_8113B50()
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x3C\n    str r0, [sp]\n    str r1, [sp, 0x4]\n    movs r0, 0\n    str r0, [sp, 0xC]\n    movs r1, 0\n    str r1, [sp, 0x10]\n    movs r2, 0\n    str r2, [sp, 0x8]\n    ldr r3, _08113C60 @ =gSharedMem + 0x14800\n    mov r12, r3\n    ldr r4, _08113C64 @ =0x000018c4\n    add r4, r12\n    mov r10, r4\n    ldr r5, _08113C68 @ =0x000020c4\n    add r5, r12\n    mov r8, r5\n_08113B7C:\n    adds r0, r3, 0\n    adds r0, 0x84\n    ldr r1, [sp, 0x8]\n    adds r0, r1, r0\n    strb r2, [r0]\n    adds r0, r3, 0x4\n    adds r0, r1, r0\n    strb r2, [r0]\n    ldr r4, _08113C6C @ =gSharedMem + 0x14844\n    adds r0, r1, r4\n    strb r2, [r0]\n    movs r6, 0\n    lsls r1, 5\n    mov r9, r1\n    ldr r5, [sp, 0x8]\n    lsls r4, r5, 6\n_08113B9C:\n    mov r0, r9\n    adds r1, r6, r0\n    ldr r5, _08113C70 @ =gSharedMem + 0x158C4\n    adds r0, r1, r5\n    strb r2, [r0]\n    mov r5, r10\n    adds r0, r1, r5\n    strb r2, [r0]\n    mov r5, r8\n    adds r0, r1, r5\n    strb r2, [r0]\n    ldr r5, _08113C74 @ =gSharedMem + 0x170C4\n    adds r0, r1, r5\n    strb r2, [r0]\n    adds r7, r3, 0\n    adds r7, 0xC4\n    adds r0, r1, r7\n    strb r2, [r0]\n    ldr r5, _08113C78 @ =0x000008c4\n    adds r0, r3, r5\n    adds r0, r1, r0\n    strb r2, [r0]\n    ldr r5, _08113C7C @ =0x000030c4\n    adds r0, r3, r5\n    adds r0, r1, r0\n    strb r2, [r0]\n    ldr r5, _08113C80 @ =0x000038c4\n    adds r0, r3, r5\n    adds r1, r0\n    strb r2, [r1]\n    lsls r1, r6, 1\n    adds r1, r4\n    ldr r5, _08113C84 @ =0x000060c4\n    adds r0, r3, r5\n    adds r0, r1, r0\n    strh r2, [r0]\n    ldr r5, _08113C88 @ =0x000070c4\n    adds r0, r3, r5\n    adds r0, r1, r0\n    strh r2, [r0]\n    ldr r5, _08113C8C @ =0x000080c4\n    adds r0, r3, r5\n    adds r0, r1, r0\n    strh r2, [r0]\n    ldr r5, _08113C90 @ =0x000090c4\n    adds r0, r3, r5\n    adds r1, r0\n    strh r2, [r1]\n    adds r6, 0x1\n    cmp r6, 0x1F\n    ble _08113B9C\n    ldr r0, [sp, 0x8]\n    adds r0, 0x1\n    str r0, [sp, 0x8]\n    cmp r0, 0x3F\n    ble _08113B7C\n    ldr r1, _08113C94 @ =0x0000a0c4\n    add r1, r12\n    movs r0, 0x40\n    strb r0, [r1]\n    movs r1, 0\n    mov r8, r1\n    movs r2, 0\n    str r2, [sp, 0x8]\n    movs r3, 0x80\n    lsls r3, 5\n    adds r3, r7\n    mov r12, r3\n    movs r4, 0xC0\n    lsls r4, 5\n    adds r4, r7\n    mov r9, r4\n    movs r5, 0\n    adds r4, r7, 0\n    subs r4, 0xC0\n_08113C32:\n    movs r3, 0\n    ldr r2, [sp]\n    add r2, r8\n    movs r6, 0\n    ldr r0, [sp, 0x8]\n    adds r0, 0x1\n    str r0, [sp, 0x30]\n    ldr r1, [sp, 0x8]\n    lsls r1, 7\n    mov r10, r1\n    movs r7, 0x1\n    negs r7, r7\n_08113C4A:\n    asrs r0, r6, 1\n    lsls r0, 2\n    add r0, r10\n    ldr r1, _08113C98 @ =gSharedMem + 0x188C4\n    adds r0, r1\n    str r2, [r0]\n    cmp r3, 0\n    beq _08113C9C\n    cmp r3, 0x1\n    beq _08113CC6\n    b _08113CF4\n    .align 2, 0\n_08113C60: .4byte gSharedMem + 0x14800\n_08113C64: .4byte 0x000018c4\n_08113C68: .4byte 0x000020c4\n_08113C6C: .4byte gSharedMem + 0x14844\n_08113C70: .4byte gSharedMem + 0x158C4\n_08113C74: .4byte gSharedMem + 0x170C4\n_08113C78: .4byte 0x000008c4\n_08113C7C: .4byte 0x000030c4\n_08113C80: .4byte 0x000038c4\n_08113C84: .4byte 0x000060c4\n_08113C88: .4byte 0x000070c4\n_08113C8C: .4byte 0x000080c4\n_08113C90: .4byte 0x000090c4\n_08113C94: .4byte 0x0000a0c4\n_08113C98: .4byte gSharedMem + 0x188C4\n_08113C9C:\n    movs r0, 0x1\n    ands r0, r6\n    cmp r0, 0\n    beq _08113CAA\n    cmp r0, 0x1\n    beq _08113CB0\n    b _08113CF4\n_08113CAA:\n    ldrb r1, [r2]\n    movs r0, 0xF\n    b _08113CB4\n_08113CB0:\n    ldrb r1, [r2]\n    movs r0, 0xF0\n_08113CB4:\n    ands r0, r1\n    cmp r0, 0\n    beq _08113CF4\n    ldrb r0, [r4]\n    adds r0, r5\n    add r0, r12\n    strb r6, [r0]\n    movs r3, 0x1\n    b _08113CF4\n_08113CC6:\n    adds r0, r6, 0\n    ands r0, r3\n    cmp r0, 0\n    beq _08113CD4\n    cmp r0, 0x1\n    beq _08113CDA\n    b _08113CF4\n_08113CD4:\n    ldrb r1, [r2]\n    movs r0, 0xF\n    b _08113CDE\n_08113CDA:\n    ldrb r1, [r2]\n    movs r0, 0xF0\n_08113CDE:\n    ands r0, r1\n    cmp r0, 0\n    bne _08113CF4\n    ldrb r0, [r4]\n    adds r0, r5\n    add r0, r9\n    strb r7, [r0]\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n    movs r3, 0\n_08113CF4:\n    adds r0, r6, 0x1\n    movs r1, 0x7\n    ands r0, r1\n    cmp r0, 0\n    bne _08113D02\n    adds r2, 0x1D\n    b _08113D0C\n_08113D02:\n    movs r0, 0x1\n    ands r0, r6\n    cmp r0, 0\n    beq _08113D0C\n    adds r2, 0x1\n_08113D0C:\n    adds r7, 0x1\n    adds r6, 0x1\n    cmp r6, 0x3F\n    ble _08113C4A\n    cmp r3, 0\n    beq _08113D26\n    ldrb r0, [r4]\n    adds r0, r5\n    add r0, r9\n    strb r6, [r0]\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n_08113D26:\n    movs r0, 0x7\n    ldr r2, [sp, 0x30]\n    ands r2, r0\n    cmp r2, 0\n    bne _08113D36\n    movs r3, 0xE4\n    add r8, r3\n    b _08113D3A\n_08113D36:\n    movs r0, 0x4\n    add r8, r0\n_08113D3A:\n    adds r5, 0x20\n    adds r4, 0x1\n    ldr r1, [sp, 0x8]\n    adds r1, 0x1\n    str r1, [sp, 0x8]\n    cmp r1, 0x3F\n    bgt _08113D4A\n    b _08113C32\n_08113D4A:\n    movs r2, 0\n    mov r8, r2\n    movs r3, 0\n    str r3, [sp, 0x8]\n    ldr r0, _08113D84 @ =gSharedMem + 0x14844\n    movs r4, 0x82\n    lsls r4, 6\n    adds r4, r0\n    mov r10, r4\n    movs r5, 0xA2\n    lsls r5, 6\n    adds r7, r0, r5\n    movs r5, 0\n    adds r4, r0, 0\n    movs r0, 0x1\n    mov r9, r0\n_08113D6A:\n    movs r3, 0\n    ldr r2, [sp, 0x4]\n    add r2, r8\n    movs r6, 0\n    ldr r1, [sp, 0x8]\n    adds r1, 0x1\n    str r1, [sp, 0x30]\n_08113D78:\n    cmp r3, 0\n    beq _08113D88\n    cmp r3, 0x1\n    beq _08113DB4\n    b _08113DE4\n    .align 2, 0\n_08113D84: .4byte gSharedMem + 0x14844\n_08113D88:\n    adds r0, r6, 0\n    mov r1, r9\n    ands r0, r1\n    cmp r0, 0\n    beq _08113D98\n    cmp r0, 0x1\n    beq _08113D9E\n    b _08113DE4\n_08113D98:\n    ldrb r1, [r2]\n    movs r0, 0xF\n    b _08113DA2\n_08113D9E:\n    ldrb r1, [r2]\n    movs r0, 0xF0\n_08113DA2:\n    ands r0, r1\n    cmp r0, 0\n    beq _08113DE4\n    ldrb r0, [r4]\n    adds r0, r5\n    add r0, r10\n    strb r6, [r0]\n    movs r3, 0x1\n    b _08113DE4\n_08113DB4:\n    adds r0, r6, 0\n    ands r0, r3\n    cmp r0, 0\n    beq _08113DC2\n    cmp r0, 0x1\n    beq _08113DC8\n    b _08113DE4\n_08113DC2:\n    ldrb r1, [r2]\n    movs r0, 0xF\n    b _08113DCC\n_08113DC8:\n    ldrb r1, [r2]\n    movs r0, 0xF0\n_08113DCC:\n    ands r0, r1\n    cmp r0, 0\n    bne _08113DE4\n    ldrb r0, [r4]\n    adds r0, r5\n    adds r0, r7\n    subs r1, r6, 0x1\n    strb r1, [r0]\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n    movs r3, 0\n_08113DE4:\n    adds r1, r6, 0x1\n    movs r0, 0x7\n    ands r0, r1\n    cmp r0, 0\n    bne _08113DF2\n    adds r2, 0x1D\n    b _08113DFC\n_08113DF2:\n    mov r0, r9\n    ands r6, r0\n    cmp r6, 0\n    beq _08113DFC\n    adds r2, 0x1\n_08113DFC:\n    adds r6, r1, 0\n    cmp r6, 0x3F\n    ble _08113D78\n    cmp r3, 0\n    beq _08113E14\n    ldrb r0, [r4]\n    adds r0, r5\n    adds r0, r7\n    strb r6, [r0]\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n_08113E14:\n    movs r0, 0x7\n    ldr r1, [sp, 0x30]\n    ands r1, r0\n    cmp r1, 0\n    bne _08113E24\n    movs r2, 0xE4\n    add r8, r2\n    b _08113E28\n_08113E24:\n    movs r3, 0x4\n    add r8, r3\n_08113E28:\n    adds r5, 0x20\n    adds r4, 0x1\n    ldr r0, [sp, 0x8]\n    adds r0, 0x1\n    str r0, [sp, 0x8]\n    cmp r0, 0x3F\n    ble _08113D6A\n    movs r1, 0\n    str r1, [sp, 0x8]\n_08113E3A:\n    ldr r3, [sp, 0x8]\n    ldr r4, _08113EBC @ =gSharedMem + 0x14804\n    adds r2, r3, r4\n    ldr r5, _08113EC0 @ =gSharedMem + 0x14844\n    adds r1, r3, r5\n    ldrb r0, [r2]\n    adds r3, 0x1\n    str r3, [sp, 0x30]\n    ldrb r1, [r1]\n    cmp r0, r1\n    bcc _08113E52\n    b _08113F9E\n_08113E52:\n    movs r0, 0\n    str r0, [sp, 0xC]\n    ldrb r2, [r2]\n    cmp r0, r2\n    bge _08113F54\n    ldr r0, _08113EC4 @ =gSharedMem + 0x14800\n    adds r0, 0x4\n    ldr r1, [sp, 0x8]\n    adds r0, r1, r0\n    str r0, [sp, 0x18]\n_08113E66:\n    movs r2, 0x80\n    lsls r2, 1\n    str r2, [sp, 0x14]\n    movs r6, 0\n    ldr r3, [sp, 0x8]\n    ldr r4, _08113EC0 @ =gSharedMem + 0x14844\n    adds r0, r3, r4\n    ldr r5, [sp, 0xC]\n    adds r5, 0x1\n    str r5, [sp, 0x34]\n    ldrb r0, [r0]\n    cmp r6, r0\n    bge _08113F3E\n    ldr r0, _08113EC4 @ =gSharedMem + 0x14800\n    mov r10, r0\n    lsls r0, r3, 5\n    ldr r2, [sp, 0xC]\n    adds r1, r2, r0\n    mov r9, r0\n    ldr r0, _08113EC4 @ =gSharedMem + 0x14800\n    adds r0, 0xC4\n    mov r3, r9\n    adds r7, r3, r0\n    mov r5, r9\n    ldr r4, _08113EC4 @ =gSharedMem + 0x14800\n    ldr r2, _08113EC8 @ =0x000010c4\n    adds r0, r4, r2\n    adds r1, r0\n    mov r8, r1\n    ldrb r3, [r1]\n    str r3, [sp, 0x1C]\n_08113EA4:\n    ldr r0, _08113ECC @ =0x000020c4\n    add r0, r10\n    adds r0, r5, r0\n    ldr r4, [sp, 0x1C]\n    ldrb r1, [r0]\n    cmp r4, r1\n    bls _08113ED0\n    mov r2, r8\n    ldrb r1, [r2]\n    ldrb r0, [r0]\n    b _08113ED6\n    .align 2, 0\n_08113EBC: .4byte gSharedMem + 0x14804\n_08113EC0: .4byte gSharedMem + 0x14844\n_08113EC4: .4byte gSharedMem + 0x14800\n_08113EC8: .4byte 0x000010c4\n_08113ECC: .4byte 0x000020c4\n_08113ED0:\n    ldrb r1, [r0]\n    mov r3, r8\n    ldrb r0, [r3]\n_08113ED6:\n    subs r3, r1, r0\n    ldr r1, [sp, 0xC]\n    add r1, r9\n    ldr r0, _08113EFC @ =0x000018c4\n    add r0, r10\n    adds r4, r1, r0\n    ldr r0, _08113F00 @ =0x000028c4\n    add r0, r10\n    adds r2, r5, r0\n    ldrb r0, [r4]\n    ldr r1, _08113F04 @ =gSharedMem + 0x14800\n    mov r12, r1\n    ldrb r1, [r2]\n    cmp r0, r1\n    bls _08113F08\n    adds r1, r0, 0\n    ldrb r0, [r2]\n    b _08113F0C\n    .align 2, 0\n_08113EFC: .4byte 0x000018c4\n_08113F00: .4byte 0x000028c4\n_08113F04: .4byte gSharedMem + 0x14800\n_08113F08:\n    ldrb r1, [r2]\n    ldrb r0, [r4]\n_08113F0C:\n    subs r1, r0\n    adds r3, r1\n    ldr r2, [sp, 0x14]\n    cmp r2, r3\n    ble _08113F2C\n    ldrb r0, [r7]\n    cmp r0, 0\n    bne _08113F2C\n    ldr r0, _08114050 @ =0x000008c4\n    add r0, r12\n    adds r0, r5, r0\n    ldrb r0, [r0]\n    cmp r0, 0\n    bne _08113F2C\n    str r6, [sp, 0x10]\n    str r3, [sp, 0x14]\n_08113F2C:\n    adds r7, 0x1\n    adds r5, 0x1\n    adds r6, 0x1\n    ldr r3, [sp, 0x8]\n    ldr r4, _08114054 @ =gSharedMem + 0x14844\n    adds r0, r3, r4\n    ldrb r0, [r0]\n    cmp r6, r0\n    blt _08113EA4\n_08113F3E:\n    ldr r0, [sp, 0xC]\n    ldr r1, [sp, 0x10]\n    ldr r2, [sp, 0x8]\n    bl sub_81141F0\n    ldr r5, [sp, 0x34]\n    str r5, [sp, 0xC]\n    ldr r0, [sp, 0x18]\n    ldrb r0, [r0]\n    cmp r5, r0\n    blt _08113E66\n_08113F54:\n    movs r6, 0\n    ldr r2, _08114058 @ =gSharedMem + 0x14800\n    ldr r1, [sp, 0x8]\n    ldr r3, _08114054 @ =gSharedMem + 0x14844\n    adds r0, r1, r3\n    adds r4, r2, 0\n    mov r12, r4\n    ldrb r0, [r0]\n    cmp r6, r0\n    bge _08113F9E\n    mov r0, r12\n    adds r0, 0x44\n    adds r4, r1, r0\n_08113F6E:\n    ldr r5, [sp, 0x8]\n    lsls r0, r5, 5\n    adds r1, r6, r0\n    adds r0, r2, 0\n    adds r0, 0xC4\n    adds r0, r1, r0\n    ldrb r0, [r0]\n    cmp r0, 0\n    bne _08113F94\n    ldr r3, _08114050 @ =0x000008c4\n    adds r0, r2, r3\n    adds r0, r1, r0\n    ldrb r0, [r0]\n    cmp r0, 0\n    bne _08113F94\n    adds r0, r6, 0\n    adds r1, r5, 0\n    bl sub_811430C\n_08113F94:\n    adds r6, 0x1\n    ldr r2, _08114058 @ =gSharedMem + 0x14800\n    ldrb r5, [r4]\n    cmp r6, r5\n    blt _08113F6E\n_08113F9E:\n    ldr r0, [sp, 0x8]\n    ldr r1, _0811405C @ =gSharedMem + 0x14804\n    adds r2, r0, r1\n    ldr r3, _08114054 @ =gSharedMem + 0x14844\n    adds r1, r0, r3\n    ldrb r0, [r2]\n    ldrb r1, [r1]\n    cmp r0, r1\n    bne _08113FCC\n    movs r6, 0\n    ldrb r4, [r2]\n    cmp r6, r4\n    bge _08113FCC\n    adds r4, r2, 0\n_08113FBA:\n    adds r0, r6, 0\n    adds r1, r6, 0\n    ldr r2, [sp, 0x8]\n    bl sub_81141F0\n    adds r6, 0x1\n    ldrb r5, [r4]\n    cmp r6, r5\n    blt _08113FBA\n_08113FCC:\n    ldr r0, [sp, 0x8]\n    ldr r1, _0811405C @ =gSharedMem + 0x14804\n    adds r2, r0, r1\n    ldr r3, _08114054 @ =gSharedMem + 0x14844\n    adds r1, r0, r3\n    ldrb r0, [r2]\n    ldr r4, _08114058 @ =gSharedMem + 0x14800\n    ldrb r5, [r1]\n    cmp r0, r5\n    bhi _08113FE2\n    b _081141C4\n_08113FE2:\n    movs r0, 0\n    str r0, [sp, 0x10]\n    ldrb r1, [r1]\n    cmp r0, r1\n    blt _08113FEE\n    b _08114104\n_08113FEE:\n    str r2, [sp, 0x2C]\n    ldr r1, [sp, 0x8]\n    lsls r1, 5\n    mov r9, r1\n    adds r0, r4, 0\n    adds r0, 0x44\n    ldr r2, [sp, 0x8]\n    adds r0, r2, r0\n    str r0, [sp, 0x20]\n    mov r3, r9\n    str r3, [sp, 0x24]\n_08114004:\n    movs r4, 0x80\n    lsls r4, 1\n    str r4, [sp, 0x14]\n    movs r6, 0\n    ldr r5, [sp, 0x10]\n    adds r5, 0x1\n    str r5, [sp, 0x38]\n    ldr r0, [sp, 0x2C]\n    ldrb r0, [r0]\n    cmp r6, r0\n    bge _081140C4\n    ldr r1, [sp, 0x10]\n    ldr r2, [sp, 0x24]\n    adds r1, r2\n    mov r10, r1\n    ldr r0, _08114058 @ =gSharedMem + 0x14800\n    adds r0, 0xC4\n    adds r2, r0\n    mov r8, r2\n    ldr r7, [sp, 0x24]\n    ldr r3, _08114058 @ =gSharedMem + 0x14800\n    ldr r4, _08114060 @ =0x000010c4\n    adds r0, r3, r4\n    adds r5, r7, r0\n    ldr r0, _08114064 @ =gSharedMem + 0x168C4\n    add r0, r10\n    mov r12, r0\n    ldrb r1, [r0]\n    str r1, [sp, 0x28]\n_0811403E:\n    ldrb r0, [r5]\n    ldr r2, [sp, 0x28]\n    cmp r0, r2\n    bls _08114068\n    adds r1, r0, 0\n    mov r3, r12\n    ldrb r0, [r3]\n    b _0811406E\n    .align 2, 0\n_08114050: .4byte 0x000008c4\n_08114054: .4byte gSharedMem + 0x14844\n_08114058: .4byte gSharedMem + 0x14800\n_0811405C: .4byte gSharedMem + 0x14804\n_08114060: .4byte 0x000010c4\n_08114064: .4byte gSharedMem + 0x168C4\n_08114068:\n    mov r4, r12\n    ldrb r1, [r4]\n    ldrb r0, [r5]\n_0811406E:\n    subs r3, r1, r0\n    ldr r1, _0811408C @ =gSharedMem + 0x14800\n    ldr r2, _08114090 @ =0x000018c4\n    adds r0, r1, r2\n    adds r4, r7, r0\n    ldr r2, _08114094 @ =gSharedMem + 0x170C4\n    add r2, r10\n    ldrb r0, [r4]\n    ldrb r1, [r2]\n    cmp r0, r1\n    bls _08114098\n    adds r1, r0, 0\n    ldrb r0, [r2]\n    b _0811409C\n    .align 2, 0\n_0811408C: .4byte gSharedMem + 0x14800\n_08114090: .4byte 0x000018c4\n_08114094: .4byte gSharedMem + 0x170C4\n_08114098:\n    ldrb r1, [r2]\n    ldrb r0, [r4]\n_0811409C:\n    subs r1, r0\n    adds r3, r1\n    ldr r2, [sp, 0x14]\n    cmp r2, r3\n    ble _081140B2\n    mov r4, r8\n    ldrb r0, [r4]\n    cmp r0, 0\n    bne _081140B2\n    str r6, [sp, 0xC]\n    str r3, [sp, 0x14]\n_081140B2:\n    movs r0, 0x1\n    add r8, r0\n    adds r7, 0x1\n    adds r5, 0x1\n    adds r6, 0x1\n    ldr r1, [sp, 0x2C]\n    ldrb r1, [r1]\n    cmp r6, r1\n    blt _0811403E\n_081140C4:\n    ldr r3, [sp, 0xC]\n    add r3, r9\n    ldr r2, _08114164 @ =gSharedMem + 0x14800\n    ldr r4, _08114168 @ =0x000030c4\n    adds r1, r2, r4\n    adds r1, r3, r1\n    ldr r2, [sp, 0x10]\n    add r2, r9\n    ldr r5, _0811416C @ =gSharedMem + 0x168C4\n    adds r0, r2, r5\n    ldrb r0, [r0]\n    strb r0, [r1]\n    ldr r0, _08114164 @ =gSharedMem + 0x14800\n    ldr r4, _08114170 @ =0x000038c4\n    adds r1, r0, r4\n    adds r1, r3, r1\n    ldr r5, _08114174 @ =gSharedMem + 0x170C4\n    adds r2, r5\n    ldrb r0, [r2]\n    strb r0, [r1]\n    ldr r0, _08114164 @ =gSharedMem + 0x14800\n    adds r0, 0xC4\n    adds r3, r0\n    movs r0, 0x1\n    strb r0, [r3]\n    ldr r0, [sp, 0x38]\n    str r0, [sp, 0x10]\n    ldr r1, [sp, 0x20]\n    ldrb r1, [r1]\n    cmp r0, r1\n    bge _08114104\n    b _08114004\n_08114104:\n    movs r6, 0\n    ldr r4, _08114164 @ =gSharedMem + 0x14800\n    ldr r2, [sp, 0x8]\n    ldr r3, _08114178 @ =gSharedMem + 0x14804\n    adds r0, r2, r3\n    ldrb r0, [r0]\n    cmp r6, r0\n    bge _081141C4\n    adds r7, r4, 0\n    mov r9, r6\n    movs r5, 0xC4\n    adds r5, r7\n    mov r8, r5\n_0811411E:\n    ldr r1, [sp, 0x8]\n    lsls r0, r1, 5\n    adds r2, r6, r0\n    ldr r3, _0811417C @ =0x000020c4\n    adds r0, r7, r3\n    adds r0, r2\n    mov r10, r0\n    ldr r5, _08114168 @ =0x000030c4\n    adds r0, r7, r5\n    adds r0, r2, r0\n    ldrb r0, [r0]\n    mov r1, r10\n    strb r0, [r1]\n    ldr r3, _08114180 @ =0x000028c4\n    adds r0, r7, r3\n    adds r3, r2, r0\n    ldr r5, _08114170 @ =0x000038c4\n    adds r0, r7, r5\n    adds r0, r2, r0\n    ldrb r0, [r0]\n    strb r0, [r3]\n    mov r0, r8\n    adds r1, r2, r0\n    ldrb r0, [r1]\n    cmp r0, 0\n    beq _08114184\n    mov r2, r9\n    strb r2, [r1]\n    adds r0, r6, 0\n    adds r1, r6, 0\n    ldr r2, [sp, 0x8]\n    bl sub_81141F0\n    b _081141B4\n    .align 2, 0\n_08114164: .4byte gSharedMem + 0x14800\n_08114168: .4byte 0x000030c4\n_0811416C: .4byte gSharedMem + 0x168C4\n_08114170: .4byte 0x000038c4\n_08114174: .4byte gSharedMem + 0x170C4\n_08114178: .4byte gSharedMem + 0x14804\n_0811417C: .4byte 0x000020c4\n_08114180: .4byte 0x000028c4\n_08114184:\n    ldr r5, _081141E0 @ =0x000010c4\n    adds r1, r4, r5\n    adds r1, r2, r1\n    ldr r5, _081141E4 @ =0x000018c4\n    adds r0, r4, r5\n    adds r0, r2, r0\n    ldrb r0, [r0]\n    ldrb r2, [r1]\n    subs r0, r2\n    lsrs r1, r0, 31\n    adds r0, r1\n    asrs r0, 1\n    adds r2, r0\n    strb r2, [r3]\n    mov r0, r10\n    strb r2, [r0]\n    ldrb r0, [r3]\n    subs r0, 0x1\n    strb r0, [r3]\n    adds r0, r6, 0\n    adds r1, r6, 0\n    ldr r2, [sp, 0x8]\n    bl sub_81141F0\n_081141B4:\n    adds r6, 0x1\n    ldr r4, _081141E8 @ =gSharedMem + 0x14800\n    ldr r1, [sp, 0x8]\n    ldr r2, _081141EC @ =gSharedMem + 0x14804\n    adds r0, r1, r2\n    ldrb r0, [r0]\n    cmp r6, r0\n    blt _0811411E\n_081141C4:\n    ldr r3, [sp, 0x30]\n    str r3, [sp, 0x8]\n    cmp r3, 0x3F\n    bgt _081141CE\n    b _08113E3A\n_081141CE:\n    add sp, 0x3C\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_081141E0: .4byte 0x000010c4\n_081141E4: .4byte 0x000018c4\n_081141E8: .4byte gSharedMem + 0x14800\n_081141EC: .4byte gSharedMem + 0x14804\n        .syntax divided");
# 2390 "src/scene/evolution_scene.c"
}

void sub_81141F0(s32 a, s32 b, s32 c)
{
    u32 r7;

    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk30C4[c][b] = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk10C4[c][a];
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk38C4[c][b] = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk18C4[c][a];

    r7 = 0;
    if (((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk10C4[c][a] < ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk20C4[c][b])
    {
        ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unkC4[c][b] = 4;
        r7 = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk20C4[c][b] - ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk10C4[c][a];
    }
    else if (((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk10C4[c][a] > ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk20C4[c][b])
    {
        ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unkC4[c][b] = 1;
        r7 = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk10C4[c][a] - ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk20C4[c][b];
    }
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk80C4[c][b] = r7 * 16;

    r7 = 0;
    if (((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk18C4[c][a] < ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk28C4[c][b])
    {
        ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk8C4[c][b] = 3;
        r7 = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk28C4[c][b] - ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk18C4[c][a];
    }
    else if (((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk18C4[c][a] > ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk28C4[c][b])
    {
        ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk8C4[c][b] = 2;
        r7 = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk18C4[c][a] - ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk28C4[c][b];
    }
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk90C4[c][b] = r7 * 16;

    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk84[c]++;
}

void sub_811430C(u32 a, u32 b)
{
    u8 r2 = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk28C4[b][a];
    u8 r3 = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk20C4[b][a];
    s32 r7 = r2 - r3;

    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk30C4[b][a] = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk38C4[b][a] = r3 + r7 / 2;
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unkC4[b][a] = 5;
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk8C4[b][a] = 7;
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk84[b]++;
    r7 = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk30C4[b][a] - ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk20C4[b][a];
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk80C4[b][a] = r7 * 16;
    r7 = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk28C4[b][a] - ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk38C4[b][a];
    ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk90C4[b][a] = r7 * 16;
}

__attribute__((naked))
void unref_sub_81143CC()
{
    asm(".syntax unified\n            push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x14\n    movs r0, 0x1\n    str r0, [sp, 0x4]\n    ldr r0, _08114408 @ =gSharedMem + 0x14800\n    ldr r2, _0811440C @ =0x0000a0c4\n    adds r1, r0, r2\n    ldrb r3, [r1]\n    adds r4, r0, 0\n    cmp r3, 0\n    beq _081143EE\n    subs r0, r3, 0x1\n    strb r0, [r1]\n_081143EE:\n    movs r5, 0\n    str r5, [sp]\n_081143F2:\n    movs r3, 0\n    adds r2, r4, 0\n    adds r0, r4, 0\n    adds r0, 0x84\n    ldr r1, [sp]\n    adds r0, r1, r0\n    adds r1, 0x1\n    str r1, [sp, 0x8]\n    bl _08114D84\n    .align 2, 0\n_08114408: .4byte gSharedMem + 0x14800\n_0811440C: .4byte 0x0000a0c4\n_08114410:\n    ldr r5, [sp]\n    lsls r0, r5, 5\n    adds r1, r3, r0\n    adds r2, 0xC4\n    adds r1, r2\n    ldrb r2, [r1]\n    mov r8, r0\n    adds r0, r3, 0x1\n    mov r10, r0\n    cmp r2, 0xC\n    bls _08114428\n    b _081148D2\n_08114428:\n    lsls r0, r2, 2\n    ldr r1, _08114434 @ =_08114438\n    adds r0, r1\n    ldr r0, [r0]\n    mov pc, r0\n    .align 2, 0\n_08114434: .4byte _08114438\n    .align 2, 0\n_08114438:\n    .4byte _081148D2\n    .4byte _0811446C\n    .4byte _081144F0\n    .4byte _0811457C\n    .4byte _08114600\n    .4byte _0811468C\n    .4byte _081146C8\n    .4byte _08114704\n    .4byte _08114740\n    .4byte _0811477C\n    .4byte _081147D0\n    .4byte _08114810\n    .4byte _08114858\n_0811446C:\n    movs r1, 0\n    str r1, [sp, 0x4]\n    lsls r0, r3, 1\n    ldr r2, [sp]\n    lsls r1, r2, 6\n    adds r0, r1\n    ldr r5, _081144E0 @ =0x000060c4\n    adds r2, r4, r5\n    adds r2, r0, r2\n    ldr r5, _081144E4 @ =0x000080c4\n    adds r1, r4, r5\n    adds r0, r1\n    ldrh r1, [r0]\n    ldrh r0, [r2]\n    adds r1, r0\n    movs r0, 0xFF\n    lsls r0, 8\n    ands r0, r1\n    lsrs r5, r0, 8\n    movs r0, 0xFF\n    ands r1, r0\n    strh r1, [r2]\n    movs r6, 0\n    adds r1, r3, 0x1\n    mov r10, r1\n    ldr r2, [sp, 0x4]\n    cmp r2, r5\n    blt _081144A6\n    b _081148D2\n_081144A6:\n    mov r9, r4\n    mov r4, r8\n    adds r7, r3, r4\n    ldr r0, _081144E8 @ =0x000030c4\n    add r0, r9\n    adds r4, r7, r0\n    ldr r0, _081144EC @ =0x000020c4\n    add r0, r9\n    adds r2, r7, r0\n_081144B8:\n    ldrb r0, [r4]\n    subs r0, 0x1\n    strb r0, [r4]\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    str r2, [sp, 0xC]\n    str r3, [sp, 0x10]\n    bl sub_8114DB4\n    ldrb r0, [r4]\n    ldr r2, [sp, 0xC]\n    ldr r3, [sp, 0x10]\n    ldrb r1, [r2]\n    cmp r0, r1\n    bne _081144D8\n    b _081148A0\n_081144D8:\n    adds r6, 0x1\n    cmp r6, r5\n    blt _081144B8\n    b _081148D2\n    .align 2, 0\n_081144E0: .4byte 0x000060c4\n_081144E4: .4byte 0x000080c4\n_081144E8: .4byte 0x000030c4\n_081144EC: .4byte 0x000020c4\n_081144F0:\n    movs r2, 0\n    str r2, [sp, 0x4]\n    ldr r4, _08114568 @ =gSharedMem + 0x14800\n    lsls r0, r3, 1\n    ldr r5, [sp]\n    lsls r1, r5, 6\n    adds r0, r1\n    ldr r1, _0811456C @ =0x000060c4\n    adds r2, r4, r1\n    adds r2, r0, r2\n    ldr r5, _08114570 @ =0x000080c4\n    adds r1, r4, r5\n    adds r0, r1\n    ldrh r1, [r0]\n    ldrh r0, [r2]\n    adds r1, r0\n    movs r0, 0xFF\n    lsls r0, 8\n    ands r0, r1\n    lsrs r5, r0, 8\n    movs r0, 0xFF\n    ands r1, r0\n    strh r1, [r2]\n    movs r6, 0\n    adds r1, r3, 0x1\n    mov r10, r1\n    ldr r2, [sp, 0x4]\n    cmp r2, r5\n    blt _0811452C\n    b _081148D2\n_0811452C:\n    mov r9, r4\n    mov r4, r8\n    adds r7, r3, r4\n    ldr r0, _08114574 @ =0x000030c4\n    add r0, r9\n    adds r4, r7, r0\n    ldr r0, _08114578 @ =0x000020c4\n    add r0, r9\n    adds r2, r7, r0\n_0811453E:\n    ldrb r0, [r4]\n    ldrb r1, [r2]\n    cmp r0, r1\n    bne _08114548\n    b _081148B8\n_08114548:\n    adds r1, r0, 0\n    ldr r0, [sp]\n    str r2, [sp, 0xC]\n    str r3, [sp, 0x10]\n    bl sub_8114DF0\n    ldrb r0, [r4]\n    subs r0, 0x1\n    strb r0, [r4]\n    adds r6, 0x1\n    ldr r2, [sp, 0xC]\n    ldr r3, [sp, 0x10]\n    cmp r6, r5\n    blt _0811453E\n    b _081148D2\n    .align 2, 0\n_08114568: .4byte gSharedMem + 0x14800\n_0811456C: .4byte 0x000060c4\n_08114570: .4byte 0x000080c4\n_08114574: .4byte 0x000030c4\n_08114578: .4byte 0x000020c4\n_0811457C:\n    movs r2, 0\n    str r2, [sp, 0x4]\n    lsls r0, r3, 1\n    ldr r5, [sp]\n    lsls r1, r5, 6\n    adds r0, r1\n    ldr r1, _081145F0 @ =0x000060c4\n    adds r2, r4, r1\n    adds r2, r0, r2\n    ldr r5, _081145F4 @ =0x000080c4\n    adds r1, r4, r5\n    adds r0, r1\n    ldrh r1, [r0]\n    ldrh r0, [r2]\n    adds r1, r0\n    movs r0, 0xFF\n    lsls r0, 8\n    ands r0, r1\n    lsrs r5, r0, 8\n    movs r0, 0xFF\n    ands r1, r0\n    strh r1, [r2]\n    movs r6, 0\n    adds r1, r3, 0x1\n    mov r10, r1\n    ldr r2, [sp, 0x4]\n    cmp r2, r5\n    blt _081145B6\n    b _081148D2\n_081145B6:\n    mov r9, r4\n    mov r4, r8\n    adds r7, r3, r4\n    ldr r0, _081145F8 @ =0x000030c4\n    add r0, r9\n    adds r4, r7, r0\n    ldr r0, _081145FC @ =0x000020c4\n    add r0, r9\n    adds r2, r7, r0\n_081145C8:\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    str r2, [sp, 0xC]\n    str r3, [sp, 0x10]\n    bl sub_8114DB4\n    ldrb r0, [r4]\n    ldr r2, [sp, 0xC]\n    ldr r3, [sp, 0x10]\n    ldrb r1, [r2]\n    cmp r0, r1\n    bne _081145E8\n    b _081148AC\n_081145E8:\n    adds r6, 0x1\n    cmp r6, r5\n    blt _081145C8\n    b _081148D2\n    .align 2, 0\n_081145F0: .4byte 0x000060c4\n_081145F4: .4byte 0x000080c4\n_081145F8: .4byte 0x000030c4\n_081145FC: .4byte 0x000020c4\n_08114600:\n    movs r2, 0\n    str r2, [sp, 0x4]\n    ldr r4, _08114678 @ =gSharedMem + 0x14800\n    lsls r0, r3, 1\n    ldr r5, [sp]\n    lsls r1, r5, 6\n    adds r0, r1\n    ldr r1, _0811467C @ =0x000060c4\n    adds r2, r4, r1\n    adds r2, r0, r2\n    ldr r5, _08114680 @ =0x000080c4\n    adds r1, r4, r5\n    adds r0, r1\n    ldrh r1, [r0]\n    ldrh r0, [r2]\n    adds r1, r0\n    movs r0, 0xFF\n    lsls r0, 8\n    ands r0, r1\n    lsrs r5, r0, 8\n    movs r0, 0xFF\n    ands r1, r0\n    strh r1, [r2]\n    movs r6, 0\n    adds r1, r3, 0x1\n    mov r10, r1\n    ldr r2, [sp, 0x4]\n    cmp r2, r5\n    blt _0811463C\n    b _081148D2\n_0811463C:\n    mov r9, r4\n    mov r4, r8\n    adds r7, r3, r4\n    ldr r0, _08114684 @ =0x000030c4\n    add r0, r9\n    adds r4, r7, r0\n    ldr r0, _08114688 @ =0x000020c4\n    add r0, r9\n    adds r2, r7, r0\n_0811464E:\n    ldrb r0, [r4]\n    ldrb r1, [r2]\n    cmp r0, r1\n    bne _08114658\n    b _081148B8\n_08114658:\n    adds r1, r0, 0\n    ldr r0, [sp]\n    str r2, [sp, 0xC]\n    str r3, [sp, 0x10]\n    bl sub_8114DF0\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n    adds r6, 0x1\n    ldr r2, [sp, 0xC]\n    ldr r3, [sp, 0x10]\n    cmp r6, r5\n    blt _0811464E\n    b _081148D2\n    .align 2, 0\n_08114678: .4byte gSharedMem + 0x14800\n_0811467C: .4byte 0x000060c4\n_08114680: .4byte 0x000080c4\n_08114684: .4byte 0x000030c4\n_08114688: .4byte 0x000020c4\n_0811468C:\n    movs r2, 0\n    str r2, [sp, 0x4]\n    ldr r5, _081146C0 @ =gSharedMem + 0x14800\n    mov r0, r8\n    adds r4, r3, r0\n    ldr r1, _081146C4 @ =0x000030c4\n    adds r0, r5, r1\n    adds r0, r4, r0\n    ldrb r1, [r0]\n    ldr r0, [sp]\n    str r3, [sp, 0x10]\n    bl sub_8114E48\n    lsls r0, 24\n    ldr r3, [sp, 0x10]\n    adds r2, r3, 0x1\n    mov r10, r2\n    cmp r0, 0\n    bne _081146B4\n    b _081148D2\n_081146B4:\n    adds r0, r5, 0\n    adds r0, 0xC4\n    adds r0, r4, r0\n    movs r1, 0x9\n    strb r1, [r0]\n    b _081148D2\n    .align 2, 0\n_081146C0: .4byte gSharedMem + 0x14800\n_081146C4: .4byte 0x000030c4\n_081146C8:\n    movs r4, 0\n    str r4, [sp, 0x4]\n    ldr r5, _081146FC @ =gSharedMem + 0x14800\n    mov r0, r8\n    adds r4, r3, r0\n    ldr r1, _08114700 @ =0x000030c4\n    adds r0, r5, r1\n    adds r0, r4, r0\n    ldrb r1, [r0]\n    ldr r0, [sp]\n    str r3, [sp, 0x10]\n    bl sub_8114E48\n    lsls r0, 24\n    ldr r3, [sp, 0x10]\n    adds r2, r3, 0x1\n    mov r10, r2\n    cmp r0, 0\n    bne _081146F0\n    b _081148D2\n_081146F0:\n    adds r0, r5, 0\n    adds r0, 0xC4\n    adds r0, r4, r0\n    movs r1, 0xA\n    strb r1, [r0]\n    b _081148D2\n    .align 2, 0\n_081146FC: .4byte gSharedMem + 0x14800\n_08114700: .4byte 0x000030c4\n_08114704:\n    movs r4, 0\n    str r4, [sp, 0x4]\n    ldr r5, _08114738 @ =gSharedMem + 0x14800\n    mov r0, r8\n    adds r4, r3, r0\n    ldr r1, _0811473C @ =0x000030c4\n    adds r0, r5, r1\n    adds r0, r4, r0\n    ldrb r1, [r0]\n    ldr r0, [sp]\n    str r3, [sp, 0x10]\n    bl sub_8114E48\n    lsls r0, 24\n    ldr r3, [sp, 0x10]\n    adds r2, r3, 0x1\n    mov r10, r2\n    cmp r0, 0\n    bne _0811472C\n    b _081148D2\n_0811472C:\n    adds r0, r5, 0\n    adds r0, 0xC4\n    adds r0, r4, r0\n    movs r1, 0xB\n    strb r1, [r0]\n    b _081148D2\n    .align 2, 0\n_08114738: .4byte gSharedMem + 0x14800\n_0811473C: .4byte 0x000030c4\n_08114740:\n    movs r4, 0\n    str r4, [sp, 0x4]\n    ldr r5, _08114774 @ =gSharedMem + 0x14800\n    mov r0, r8\n    adds r4, r3, r0\n    ldr r1, _08114778 @ =0x000030c4\n    adds r0, r5, r1\n    adds r0, r4, r0\n    ldrb r1, [r0]\n    ldr r0, [sp]\n    str r3, [sp, 0x10]\n    bl sub_8114E48\n    lsls r0, 24\n    ldr r3, [sp, 0x10]\n    adds r2, r3, 0x1\n    mov r10, r2\n    cmp r0, 0\n    bne _08114768\n    b _081148D2\n_08114768:\n    adds r0, r5, 0\n    adds r0, 0xC4\n    adds r0, r4, r0\n    movs r1, 0xC\n    strb r1, [r0]\n    b _081148D2\n    .align 2, 0\n_08114774: .4byte gSharedMem + 0x14800\n_08114778: .4byte 0x000030c4\n_0811477C:\n    movs r4, 0\n    str r4, [sp, 0x4]\n    ldr r6, _081147B4 @ =gSharedMem + 0x14800\n    mov r0, r8\n    adds r5, r3, r0\n    ldr r1, _081147B8 @ =0x000030c4\n    adds r4, r6, r1\n    adds r4, r5, r4\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    str r3, [sp, 0x10]\n    bl sub_8114DB4\n    ldr r2, _081147BC @ =0x000020c4\n    adds r0, r6, r2\n    adds r0, r5, r0\n    ldrb r1, [r4]\n    ldr r3, [sp, 0x10]\n    ldrb r0, [r0]\n    cmp r1, r0\n    bne _081147C0\n    adds r0, r6, 0\n    adds r0, 0xC4\n    adds r0, r5, r0\n    mov r4, sp\n    ldrb r4, [r4, 0x4]\n    strb r4, [r0]\n    b _08114844\n    .align 2, 0\n_081147B4: .4byte gSharedMem + 0x14800\n_081147B8: .4byte 0x000030c4\n_081147BC: .4byte 0x000020c4\n_081147C0:\n    adds r0, r6, 0\n    adds r0, 0xC4\n    adds r0, r5, r0\n    movs r1, 0x1\n    strb r1, [r0]\n    adds r0, r3, 0x1\n    mov r10, r0\n    b _081148D2\n_081147D0:\n    movs r1, 0\n    str r1, [sp, 0x4]\n    ldr r6, _08114804 @ =gSharedMem + 0x14800\n    mov r2, r8\n    adds r5, r3, r2\n    ldr r0, _08114808 @ =0x000030c4\n    adds r4, r6, r0\n    adds r4, r5, r4\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    str r3, [sp, 0x10]\n    bl sub_8114DF0\n    ldr r1, _0811480C @ =0x000020c4\n    adds r0, r6, r1\n    adds r0, r5, r0\n    ldrb r1, [r4]\n    ldr r3, [sp, 0x10]\n    ldrb r0, [r0]\n    cmp r1, r0\n    beq _08114882\n    adds r0, r6, 0\n    adds r0, 0xC4\n    adds r0, r5, r0\n    movs r1, 0x2\n    b _08114842\n    .align 2, 0\n_08114804: .4byte gSharedMem + 0x14800\n_08114808: .4byte 0x000030c4\n_0811480C: .4byte 0x000020c4\n_08114810:\n    movs r0, 0\n    str r0, [sp, 0x4]\n    ldr r6, _0811484C @ =gSharedMem + 0x14800\n    mov r1, r8\n    adds r5, r3, r1\n    ldr r2, _08114850 @ =0x000030c4\n    adds r4, r6, r2\n    adds r4, r5, r4\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    str r3, [sp, 0x10]\n    bl sub_8114DB4\n    ldr r1, _08114854 @ =0x000020c4\n    adds r0, r6, r1\n    adds r0, r5, r0\n    ldrb r1, [r4]\n    ldr r3, [sp, 0x10]\n    ldrb r0, [r0]\n    cmp r1, r0\n    beq _08114882\n    adds r0, r6, 0\n    adds r0, 0xC4\n    adds r0, r5, r0\n    movs r1, 0x3\n_08114842:\n    strb r1, [r0]\n_08114844:\n    adds r5, r3, 0x1\n    mov r10, r5\n    b _081148D2\n    .align 2, 0\n_0811484C: .4byte gSharedMem + 0x14800\n_08114850: .4byte 0x000030c4\n_08114854: .4byte 0x000020c4\n_08114858:\n    movs r0, 0\n    str r0, [sp, 0x4]\n    ldr r6, _08114894 @ =gSharedMem + 0x14800\n    mov r1, r8\n    adds r5, r3, r1\n    ldr r2, _08114898 @ =0x000030c4\n    adds r4, r6, r2\n    adds r4, r5, r4\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    str r3, [sp, 0x10]\n    bl sub_8114DF0\n    ldr r1, _0811489C @ =0x000020c4\n    adds r0, r6, r1\n    adds r0, r5, r0\n    ldrb r1, [r4]\n    ldr r3, [sp, 0x10]\n    ldrb r0, [r0]\n    cmp r1, r0\n    bne _081148C4\n_08114882:\n    adds r0, r6, 0\n    adds r0, 0xC4\n    adds r0, r5, r0\n    mov r2, sp\n    ldrb r2, [r2, 0x4]\n    strb r2, [r0]\n    adds r4, r3, 0x1\n    mov r10, r4\n    b _081148D2\n    .align 2, 0\n_08114894: .4byte gSharedMem + 0x14800\n_08114898: .4byte 0x000030c4\n_0811489C: .4byte 0x000020c4\n_081148A0:\n    mov r0, r9\n    adds r0, 0xC4\n    adds r0, r7, r0\n    movs r5, 0\n    strb r5, [r0]\n    b _081148D2\n_081148AC:\n    mov r0, r9\n    adds r0, 0xC4\n    adds r0, r7, r0\n    movs r1, 0\n    strb r1, [r0]\n    b _081148D2\n_081148B8:\n    mov r0, r9\n    adds r0, 0xC4\n    adds r0, r7, r0\n    movs r1, 0\n    strb r1, [r0]\n    b _081148D2\n_081148C4:\n    adds r0, r6, 0\n    adds r0, 0xC4\n    adds r0, r5, r0\n    movs r1, 0x4\n    strb r1, [r0]\n    adds r2, r3, 0x1\n    mov r10, r2\n_081148D2:\n    ldr r0, _081148F4 @ =gSharedMem + 0x14800\n    mov r4, r8\n    adds r1, r3, r4\n    ldr r5, _081148F8 @ =0x000008c4\n    adds r2, r0, r5\n    adds r1, r2\n    ldrb r1, [r1]\n    adds r4, r0, 0\n    cmp r1, 0xC\n    bls _081148E8\n    b _08114D76\n_081148E8:\n    lsls r0, r1, 2\n    ldr r1, _081148FC @ =_08114900\n    adds r0, r1\n    ldr r0, [r0]\n    mov pc, r0\n    .align 2, 0\n_081148F4: .4byte gSharedMem + 0x14800\n_081148F8: .4byte 0x000008c4\n_081148FC: .4byte _08114900\n    .align 2, 0\n_08114900:\n    .4byte _08114D76\n    .4byte _08114934\n    .4byte _081149B8\n    .4byte _08114A3C\n    .4byte _08114AC0\n    .4byte _08114B44\n    .4byte _08114B7C\n    .4byte _08114BB4\n    .4byte _08114BEC\n    .4byte _08114C24\n    .4byte _08114C78\n    .4byte _08114CB8\n    .4byte _08114CF8\n_08114934:\n    movs r0, 0\n    str r0, [sp, 0x4]\n    lsls r0, r3, 1\n    ldr r2, [sp]\n    lsls r1, r2, 6\n    adds r0, r1\n    ldr r5, _081149A8 @ =0x000070c4\n    adds r2, r4, r5\n    adds r2, r0, r2\n    ldr r5, _081149AC @ =0x000090c4\n    adds r1, r4, r5\n    adds r0, r1\n    ldrh r1, [r0]\n    ldrh r0, [r2]\n    adds r1, r0\n    movs r0, 0xFF\n    lsls r0, 8\n    ands r0, r1\n    lsrs r5, r0, 8\n    movs r0, 0xFF\n    ands r1, r0\n    strh r1, [r2]\n    movs r6, 0\n    ldr r1, [sp, 0x4]\n    cmp r1, r5\n    blt _0811496A\n    b _08114D76\n_0811496A:\n    mov r9, r4\n    mov r2, r8\n    adds r7, r3, r2\n    ldr r0, _081149B0 @ =0x000038c4\n    add r0, r9\n    adds r4, r7, r0\n    movs r3, 0\n    ldr r0, _081149B4 @ =0x000028c4\n    add r0, r9\n    adds r2, r7, r0\n_0811497E:\n    ldrb r0, [r4]\n    subs r0, 0x1\n    strb r0, [r4]\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    str r2, [sp, 0xC]\n    str r3, [sp, 0x10]\n    bl sub_8114DB4\n    ldrb r0, [r4]\n    ldr r2, [sp, 0xC]\n    ldr r3, [sp, 0x10]\n    ldrb r1, [r2]\n    cmp r0, r1\n    bne _0811499E\n    b _08114D4C\n_0811499E:\n    adds r6, 0x1\n    cmp r6, r5\n    blt _0811497E\n    b _08114D76\n    .align 2, 0\n_081149A8: .4byte 0x000070c4\n_081149AC: .4byte 0x000090c4\n_081149B0: .4byte 0x000038c4\n_081149B4: .4byte 0x000028c4\n_081149B8:\n    movs r2, 0\n    str r2, [sp, 0x4]\n    ldr r4, _08114A28 @ =gSharedMem + 0x14800\n    lsls r0, r3, 1\n    ldr r5, [sp]\n    lsls r1, r5, 6\n    adds r0, r1\n    ldr r1, _08114A2C @ =0x000070c4\n    adds r2, r4, r1\n    adds r2, r0, r2\n    ldr r5, _08114A30 @ =0x000090c4\n    adds r1, r4, r5\n    adds r0, r1\n    ldrh r1, [r0]\n    ldrh r0, [r2]\n    adds r1, r0\n    movs r0, 0xFF\n    lsls r0, 8\n    ands r0, r1\n    lsrs r5, r0, 8\n    movs r0, 0xFF\n    ands r1, r0\n    strh r1, [r2]\n    movs r6, 0\n    ldr r1, [sp, 0x4]\n    cmp r1, r5\n    blt _081149F0\n    b _08114D76\n_081149F0:\n    mov r9, r4\n    mov r2, r8\n    adds r7, r3, r2\n    ldr r0, _08114A34 @ =0x000038c4\n    add r0, r9\n    adds r4, r7, r0\n    ldr r0, _08114A38 @ =0x000028c4\n    add r0, r9\n    adds r2, r7, r0\n_08114A02:\n    ldrb r0, [r4]\n    ldrb r1, [r2]\n    cmp r0, r1\n    bne _08114A0C\n    b _08114D3C\n_08114A0C:\n    adds r1, r0, 0\n    ldr r0, [sp]\n    str r2, [sp, 0xC]\n    bl sub_8114DF0\n    ldrb r0, [r4]\n    subs r0, 0x1\n    strb r0, [r4]\n    adds r6, 0x1\n    ldr r2, [sp, 0xC]\n    cmp r6, r5\n    blt _08114A02\n    b _08114D76\n    .align 2, 0\n_08114A28: .4byte gSharedMem + 0x14800\n_08114A2C: .4byte 0x000070c4\n_08114A30: .4byte 0x000090c4\n_08114A34: .4byte 0x000038c4\n_08114A38: .4byte 0x000028c4\n_08114A3C:\n    movs r2, 0\n    str r2, [sp, 0x4]\n    lsls r0, r3, 1\n    ldr r5, [sp]\n    lsls r1, r5, 6\n    adds r0, r1\n    ldr r1, _08114AB0 @ =0x000070c4\n    adds r2, r4, r1\n    adds r2, r0, r2\n    ldr r5, _08114AB4 @ =0x000090c4\n    adds r1, r4, r5\n    adds r0, r1\n    ldrh r1, [r0]\n    ldrh r0, [r2]\n    adds r1, r0\n    movs r0, 0xFF\n    lsls r0, 8\n    ands r0, r1\n    lsrs r5, r0, 8\n    movs r0, 0xFF\n    ands r1, r0\n    strh r1, [r2]\n    movs r6, 0\n    ldr r1, [sp, 0x4]\n    cmp r1, r5\n    blt _08114A72\n    b _08114D76\n_08114A72:\n    mov r9, r4\n    mov r2, r8\n    adds r7, r3, r2\n    ldr r0, _08114AB8 @ =0x000038c4\n    add r0, r9\n    adds r4, r7, r0\n    movs r3, 0\n    ldr r0, _08114ABC @ =0x000028c4\n    add r0, r9\n    adds r2, r7, r0\n_08114A86:\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    str r2, [sp, 0xC]\n    str r3, [sp, 0x10]\n    bl sub_8114DB4\n    ldrb r0, [r4]\n    ldr r2, [sp, 0xC]\n    ldr r3, [sp, 0x10]\n    ldrb r1, [r2]\n    cmp r0, r1\n    bne _08114AA6\n    b _08114D4C\n_08114AA6:\n    adds r6, 0x1\n    cmp r6, r5\n    blt _08114A86\n    b _08114D76\n    .align 2, 0\n_08114AB0: .4byte 0x000070c4\n_08114AB4: .4byte 0x000090c4\n_08114AB8: .4byte 0x000038c4\n_08114ABC: .4byte 0x000028c4\n_08114AC0:\n    movs r2, 0\n    str r2, [sp, 0x4]\n    ldr r4, _08114B30 @ =gSharedMem + 0x14800\n    lsls r0, r3, 1\n    ldr r5, [sp]\n    lsls r1, r5, 6\n    adds r0, r1\n    ldr r1, _08114B34 @ =0x000070c4\n    adds r2, r4, r1\n    adds r2, r0, r2\n    ldr r5, _08114B38 @ =0x000090c4\n    adds r1, r4, r5\n    adds r0, r1\n    ldrh r1, [r0]\n    ldrh r0, [r2]\n    adds r1, r0\n    movs r0, 0xFF\n    lsls r0, 8\n    ands r0, r1\n    lsrs r5, r0, 8\n    movs r0, 0xFF\n    ands r1, r0\n    strh r1, [r2]\n    movs r6, 0\n    ldr r1, [sp, 0x4]\n    cmp r1, r5\n    blt _08114AF8\n    b _08114D76\n_08114AF8:\n    mov r9, r4\n    mov r2, r8\n    adds r7, r3, r2\n    ldr r0, _08114B3C @ =0x000038c4\n    add r0, r9\n    adds r4, r7, r0\n    ldr r0, _08114B40 @ =0x000028c4\n    add r0, r9\n    adds r2, r7, r0\n_08114B0A:\n    ldrb r0, [r4]\n    ldrb r1, [r2]\n    cmp r0, r1\n    bne _08114B14\n    b _08114D5C\n_08114B14:\n    adds r1, r0, 0\n    ldr r0, [sp]\n    str r2, [sp, 0xC]\n    bl sub_8114DF0\n    ldrb r0, [r4]\n    adds r0, 0x1\n    strb r0, [r4]\n    adds r6, 0x1\n    ldr r2, [sp, 0xC]\n    cmp r6, r5\n    blt _08114B0A\n    b _08114D76\n    .align 2, 0\n_08114B30: .4byte gSharedMem + 0x14800\n_08114B34: .4byte 0x000070c4\n_08114B38: .4byte 0x000090c4\n_08114B3C: .4byte 0x000038c4\n_08114B40: .4byte 0x000028c4\n_08114B44:\n    movs r2, 0\n    str r2, [sp, 0x4]\n    ldr r5, _08114B70 @ =gSharedMem + 0x14800\n    mov r0, r8\n    adds r4, r3, r0\n    ldr r1, _08114B74 @ =0x000038c4\n    adds r0, r5, r1\n    adds r0, r4, r0\n    ldrb r1, [r0]\n    ldr r0, [sp]\n    bl sub_8114E48\n    lsls r0, 24\n    cmp r0, 0\n    bne _08114B64\n    b _08114D76\n_08114B64:\n    ldr r2, _08114B78 @ =0x000008c4\n    adds r0, r5, r2\n    adds r0, r4, r0\n    movs r1, 0x9\n    b _08114D74\n    .align 2, 0\n_08114B70: .4byte gSharedMem + 0x14800\n_08114B74: .4byte 0x000038c4\n_08114B78: .4byte 0x000008c4\n_08114B7C:\n    movs r4, 0\n    str r4, [sp, 0x4]\n    ldr r5, _08114BA8 @ =gSharedMem + 0x14800\n    mov r0, r8\n    adds r4, r3, r0\n    ldr r1, _08114BAC @ =0x000038c4\n    adds r0, r5, r1\n    adds r0, r4, r0\n    ldrb r1, [r0]\n    ldr r0, [sp]\n    bl sub_8114E48\n    lsls r0, 24\n    cmp r0, 0\n    bne _08114B9C\n    b _08114D76\n_08114B9C:\n    ldr r2, _08114BB0 @ =0x000008c4\n    adds r0, r5, r2\n    adds r0, r4, r0\n    movs r1, 0xA\n    b _08114D74\n    .align 2, 0\n_08114BA8: .4byte gSharedMem + 0x14800\n_08114BAC: .4byte 0x000038c4\n_08114BB0: .4byte 0x000008c4\n_08114BB4:\n    movs r4, 0\n    str r4, [sp, 0x4]\n    ldr r5, _08114BE0 @ =gSharedMem + 0x14800\n    mov r0, r8\n    adds r4, r3, r0\n    ldr r1, _08114BE4 @ =0x000038c4\n    adds r0, r5, r1\n    adds r0, r4, r0\n    ldrb r1, [r0]\n    ldr r0, [sp]\n    bl sub_8114E48\n    lsls r0, 24\n    cmp r0, 0\n    bne _08114BD4\n    b _08114D76\n_08114BD4:\n    ldr r2, _08114BE8 @ =0x000008c4\n    adds r0, r5, r2\n    adds r0, r4, r0\n    movs r1, 0xB\n    b _08114D74\n    .align 2, 0\n_08114BE0: .4byte gSharedMem + 0x14800\n_08114BE4: .4byte 0x000038c4\n_08114BE8: .4byte 0x000008c4\n_08114BEC:\n    movs r4, 0\n    str r4, [sp, 0x4]\n    ldr r5, _08114C18 @ =gSharedMem + 0x14800\n    mov r0, r8\n    adds r4, r3, r0\n    ldr r1, _08114C1C @ =0x000038c4\n    adds r0, r5, r1\n    adds r0, r4, r0\n    ldrb r1, [r0]\n    ldr r0, [sp]\n    bl sub_8114E48\n    lsls r0, 24\n    cmp r0, 0\n    bne _08114C0C\n    b _08114D76\n_08114C0C:\n    ldr r2, _08114C20 @ =0x000008c4\n    adds r0, r5, r2\n    adds r0, r4, r0\n    movs r1, 0xC\n    b _08114D74\n    .align 2, 0\n_08114C18: .4byte gSharedMem + 0x14800\n_08114C1C: .4byte 0x000038c4\n_08114C20: .4byte 0x000008c4\n_08114C24:\n    movs r4, 0\n    str r4, [sp, 0x4]\n    ldr r6, _08114C58 @ =gSharedMem + 0x14800\n    mov r0, r8\n    adds r5, r3, r0\n    ldr r1, _08114C5C @ =0x000038c4\n    adds r4, r6, r1\n    adds r4, r5, r4\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    bl sub_8114DB4\n    ldr r2, _08114C60 @ =0x000028c4\n    adds r0, r6, r2\n    adds r0, r5, r0\n    ldrb r1, [r4]\n    ldrb r0, [r0]\n    cmp r1, r0\n    bne _08114C68\n    ldr r4, _08114C64 @ =0x000008c4\n    adds r0, r6, r4\n    adds r0, r5, r0\n    mov r5, sp\n    ldrb r5, [r5, 0x4]\n    strb r5, [r0]\n    b _08114D76\n    .align 2, 0\n_08114C58: .4byte gSharedMem + 0x14800\n_08114C5C: .4byte 0x000038c4\n_08114C60: .4byte 0x000028c4\n_08114C64: .4byte 0x000008c4\n_08114C68:\n    ldr r1, _08114C74 @ =0x000008c4\n    adds r0, r6, r1\n    adds r0, r5, r0\n    movs r1, 0x1\n    b _08114D74\n    .align 2, 0\n_08114C74: .4byte 0x000008c4\n_08114C78:\n    movs r2, 0\n    str r2, [sp, 0x4]\n    ldr r6, _08114CA8 @ =gSharedMem + 0x14800\n    mov r4, r8\n    adds r5, r3, r4\n    ldr r0, _08114CAC @ =0x000038c4\n    adds r4, r6, r0\n    adds r4, r5, r4\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    bl sub_8114DF0\n    ldr r1, _08114CB0 @ =0x000028c4\n    adds r0, r6, r1\n    adds r0, r5, r0\n    ldrb r1, [r4]\n    ldrb r0, [r0]\n    cmp r1, r0\n    beq _08114D1E\n    ldr r1, _08114CB4 @ =0x000008c4\n    adds r0, r6, r1\n    adds r0, r5, r0\n    movs r1, 0x2\n    b _08114D74\n    .align 2, 0\n_08114CA8: .4byte gSharedMem + 0x14800\n_08114CAC: .4byte 0x000038c4\n_08114CB0: .4byte 0x000028c4\n_08114CB4: .4byte 0x000008c4\n_08114CB8:\n    movs r2, 0\n    str r2, [sp, 0x4]\n    ldr r6, _08114CE8 @ =gSharedMem + 0x14800\n    mov r4, r8\n    adds r5, r3, r4\n    ldr r0, _08114CEC @ =0x000038c4\n    adds r4, r6, r0\n    adds r4, r5, r4\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    bl sub_8114DB4\n    ldr r1, _08114CF0 @ =0x000028c4\n    adds r0, r6, r1\n    adds r0, r5, r0\n    ldrb r1, [r4]\n    ldrb r0, [r0]\n    cmp r1, r0\n    beq _08114D1E\n    ldr r1, _08114CF4 @ =0x000008c4\n    adds r0, r6, r1\n    adds r0, r5, r0\n    movs r1, 0x3\n    b _08114D74\n    .align 2, 0\n_08114CE8: .4byte gSharedMem + 0x14800\n_08114CEC: .4byte 0x000038c4\n_08114CF0: .4byte 0x000028c4\n_08114CF4: .4byte 0x000008c4\n_08114CF8:\n    movs r2, 0\n    str r2, [sp, 0x4]\n    ldr r6, _08114D2C @ =gSharedMem + 0x14800\n    mov r4, r8\n    adds r5, r3, r4\n    ldr r0, _08114D30 @ =0x000038c4\n    adds r4, r6, r0\n    adds r4, r5, r4\n    ldrb r1, [r4]\n    ldr r0, [sp]\n    bl sub_8114DF0\n    ldr r1, _08114D34 @ =0x000028c4\n    adds r0, r6, r1\n    adds r0, r5, r0\n    ldrb r1, [r4]\n    ldrb r0, [r0]\n    cmp r1, r0\n    bne _08114D6C\n_08114D1E:\n    ldr r2, _08114D38 @ =0x000008c4\n    adds r0, r6, r2\n    adds r0, r5, r0\n    mov r4, sp\n    ldrb r4, [r4, 0x4]\n    strb r4, [r0]\n    b _08114D76\n    .align 2, 0\n_08114D2C: .4byte gSharedMem + 0x14800\n_08114D30: .4byte 0x000038c4\n_08114D34: .4byte 0x000028c4\n_08114D38: .4byte 0x000008c4\n_08114D3C:\n    ldr r0, _08114D48 @ =0x000008c4\n    add r0, r9\n    adds r0, r7, r0\n    movs r1, 0\n    b _08114D74\n    .align 2, 0\n_08114D48: .4byte 0x000008c4\n_08114D4C:\n    ldr r0, _08114D58 @ =0x000008c4\n    add r0, r9\n    adds r0, r7, r0\n    strb r3, [r0]\n    b _08114D76\n    .align 2, 0\n_08114D58: .4byte 0x000008c4\n_08114D5C:\n    ldr r0, _08114D68 @ =0x000008c4\n    add r0, r9\n    adds r0, r7, r0\n    movs r1, 0\n    b _08114D74\n    .align 2, 0\n_08114D68: .4byte 0x000008c4\n_08114D6C:\n    ldr r1, _08114DAC @ =0x000008c4\n    adds r0, r6, r1\n    adds r0, r5, r0\n    movs r1, 0x4\n_08114D74:\n    strb r1, [r0]\n_08114D76:\n    mov r3, r10\n    ldr r2, _08114DB0 @ =gSharedMem + 0x14800\n    adds r0, r2, 0\n    adds r0, 0x84\n    ldr r4, [sp]\n    adds r0, r4, r0\n    adds r4, r2, 0\n_08114D84:\n    ldrb r0, [r0]\n    cmp r3, r0\n    bge _08114D8E\n    bl _08114410\n_08114D8E:\n    ldr r5, [sp, 0x8]\n    str r5, [sp]\n    cmp r5, 0x3F\n    bgt _08114D9A\n    bl _081143F2\n_08114D9A:\n    ldr r0, [sp, 0x4]\n    add sp, 0x14\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r1}\n    bx r1\n    .align 2, 0\n_08114DAC: .4byte 0x000008c4\n_08114DB0: .4byte gSharedMem + 0x14800\n        .syntax divided");
# 3667 "src/scene/evolution_scene.c"
}

void sub_8114DB4(u32 a, u8 b)
{
    u8 *r2 = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk40C4[a][b / 2];

    if (b % 2 != 0)
        *r2 |= 0xF0;
    else
        *r2 |= 0x0F;
}

void sub_8114DF0(u32 a, u8 b)
{
    u8 *r2 = ((*(struct EvoInfo*)(gSharedMem + 0x14800))).unk40C4[a][b / 2];
    u8 *r1 = r2 + 0x6000;

    if (b % 2 != 0)
    {
        if (!(*r1 & 0xF0))
            *r2 &= 0x0F;
    }
    else
    {
        if (!(*r1 & 0x0F))
            *r2 &= 0xF0;
    }
}

__attribute__((naked))
void sub_8114E48()
{
    asm(".syntax unified\n        push {r4-r7,lr}\n    adds r4, r0, 0\n    lsls r1, 24\n    lsrs r6, r1, 24\n    ldr r1, _08114E6C @ =gSharedMem + 0x14800\n    ldr r2, _08114E70 @ =0x0000a0c4\n    adds r0, r1, r2\n    ldrb r0, [r0]\n    adds r5, r1, 0\n    cmp r0, 0\n    bne _08114E60\n    b _08114F5E\n_08114E60:\n    movs r1, 0\n    movs r3, 0\n    cmp r4, 0\n    bne _08114E74\n    movs r1, 0x1\n    b _08114EA6\n    .align 2, 0\n_08114E6C: .4byte gSharedMem + 0x14800\n_08114E70: .4byte 0x0000a0c4\n_08114E74:\n    subs r0, r4, 0x1\n    lsls r0, 5\n    adds r2, r3, r0\n    adds r0, r5, 0\n    adds r0, 0xC4\n    adds r0, r2, r0\n    ldrb r0, [r0]\n    cmp r0, 0\n    bne _08114EA6\n    ldr r7, _08114EC4 @ =0x000008c4\n    adds r0, r5, r7\n    adds r0, r2, r0\n    ldrb r0, [r0]\n    cmp r0, 0\n    bne _08114EA6\n    adds r3, 0x1\n    cmp r3, 0x1F\n    bgt _08114EA6\n    cmp r4, 0\n    bne _08114E74\n    lsls r0, r1, 24\n    movs r1, 0x80\n    lsls r1, 17\n    adds r0, r1\n    lsrs r1, r0, 24\n_08114EA6:\n    cmp r3, 0x20\n    bne _08114EB4\n    lsls r0, r1, 24\n    movs r2, 0x80\n    lsls r2, 17\n    adds r0, r2\n    lsrs r1, r0, 24\n_08114EB4:\n    movs r3, 0\n    cmp r4, 0x3F\n    bne _08114EC8\n    lsls r0, r1, 24\n    movs r7, 0x80\n    lsls r7, 17\n    adds r0, r7\n    b _08114EF8\n    .align 2, 0\n_08114EC4: .4byte 0x000008c4\n_08114EC8:\n    adds r0, r4, 0x1\n    lsls r0, 5\n    adds r2, r3, r0\n    adds r0, r5, 0\n    adds r0, 0xC4\n    adds r0, r2, r0\n    ldrb r0, [r0]\n    cmp r0, 0\n    bne _08114EFA\n    ldr r7, _08114F64 @ =0x000008c4\n    adds r0, r5, r7\n    adds r0, r2, r0\n    ldrb r0, [r0]\n    cmp r0, 0\n    bne _08114EFA\n    adds r3, 0x1\n    cmp r3, 0x1F\n    bgt _08114EFA\n    cmp r4, 0x3F\n    bne _08114EC8\n    lsls r0, r1, 24\n    movs r1, 0x80\n    lsls r1, 17\n    adds r0, r1\n_08114EF8:\n    lsrs r1, r0, 24\n_08114EFA:\n    cmp r3, 0x20\n    bne _08114F08\n    lsls r0, r1, 24\n    movs r2, 0x80\n    lsls r2, 17\n    adds r0, r2\n    lsrs r1, r0, 24\n_08114F08:\n    cmp r1, 0x2\n    beq _08114F5E\n    subs r0, r6, 0x2\n    lsls r0, 24\n    lsrs r1, r0, 24\n    cmp r0, 0\n    bge _08114F18\n    movs r1, 0\n_08114F18:\n    adds r0, r6, 0x2\n    lsls r0, 24\n    lsrs r2, r0, 24\n    asrs r0, 24\n    cmp r0, 0x3F\n    ble _08114F26\n    movs r2, 0x3F\n_08114F26:\n    lsls r1, 24\n    asrs r3, r1, 24\n    lsls r0, r2, 24\n    asrs r2, r0, 24\n    adds r6, r1, 0\n    adds r7, r0, 0\n    cmp r3, r2\n    bge _08114F7C\n    cmp r4, 0\n    beq _08114F7C\n    subs r0, r4, 0x1\n    lsls r5, r0, 7\n    ldr r0, _08114F68 @ =gSharedMem + 0x188C4\n    mov r12, r0\n_08114F42:\n    asrs r0, r3, 1\n    lsls r0, 2\n    adds r0, r5\n    add r0, r12\n    ldr r1, [r0]\n    movs r0, 0x1\n    ands r0, r3\n    cmp r0, 0\n    beq _08114F6C\n    ldrb r1, [r1]\n    movs r0, 0xF0\n_08114F58:\n    ands r0, r1\n    cmp r0, 0\n    beq _08114F72\n_08114F5E:\n    movs r0, 0x1\n    b _08114FCA\n    .align 2, 0\n_08114F64: .4byte 0x000008c4\n_08114F68: .4byte gSharedMem + 0x188C4\n_08114F6C:\n    ldrb r1, [r1]\n    movs r0, 0xF\n    b _08114F58\n_08114F72:\n    adds r3, 0x1\n    cmp r3, r2\n    bge _08114F7C\n    cmp r4, 0\n    bne _08114F42\n_08114F7C:\n    asrs r3, r6, 24\n    asrs r1, r7, 24\n    cmp r3, r1\n    bge _08114FC8\n    cmp r4, 0x3F\n    beq _08114FC8\n    adds r0, r4, 0x1\n    lsls r5, r0, 7\n    ldr r6, _08114FB0 @ =gSharedMem + 0x188C4\n    adds r2, r1, 0\n_08114F90:\n    asrs r0, r3, 1\n    lsls r0, 2\n    adds r0, r5\n    adds r0, r6\n    ldr r1, [r0]\n    movs r0, 0x1\n    ands r0, r3\n    cmp r0, 0\n    beq _08114FB4\n    ldrb r1, [r1]\n    movs r0, 0xF0\n    ands r0, r1\n    cmp r0, 0\n    beq _08114FBE\n    b _08114F5E\n    .align 2, 0\n_08114FB0: .4byte gSharedMem + 0x188C4\n_08114FB4:\n    ldrb r1, [r1]\n    movs r0, 0xF\n    ands r0, r1\n    cmp r0, 0\n    bne _08114F5E\n_08114FBE:\n    adds r3, 0x1\n    cmp r3, r2\n    bge _08114FC8\n    cmp r4, 0x3F\n    bne _08114F90\n_08114FC8:\n    movs r0, 0\n_08114FCA:\n    pop {r4-r7}\n    pop {r1}\n    bx r1\n        .syntax divided");
# 3914 "src/scene/evolution_scene.c"
}



static void EvoDummyFunc(void)
{

}

static void VBlankCB_EvolutionScene(void)
{
    (*(vu16 *)(0x4000000 + 0x8)) = ((24) << 8) | 0x0000 | 0x0000 | 0x8000 | (3);
    (*(vu16 *)(0x4000000 + 0x10)) = gUnknown_030042A4;
    (*(vu16 *)(0x4000000 + 0x12)) = gUnknown_030042A0;
    (*(vu16 *)(0x4000000 + 0x14)) = gUnknown_030042C0;
    (*(vu16 *)(0x4000000 + 0x16)) = gUnknown_030041B4;
    (*(vu16 *)(0x4000000 + 0x18)) = gUnknown_03004288;
    (*(vu16 *)(0x4000000 + 0x1a)) = gUnknown_03004280;
    (*(vu16 *)(0x4000000 + 0x1c)) = gUnknown_030041B0;
    (*(vu16 *)(0x4000000 + 0x1e)) = gUnknown_030041B8;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_8089668();
}

static void VBlankCB_TradeEvolutionScene(void)
{
    (*(vu16 *)(0x4000000 + 0x10)) = gUnknown_030042A4;
    (*(vu16 *)(0x4000000 + 0x12)) = gUnknown_030042A0;
    (*(vu16 *)(0x4000000 + 0x14)) = gUnknown_030042C0;
    (*(vu16 *)(0x4000000 + 0x16)) = gUnknown_030041B4;
    (*(vu16 *)(0x4000000 + 0x18)) = gUnknown_03004288;
    (*(vu16 *)(0x4000000 + 0x1a)) = gUnknown_03004280;
    (*(vu16 *)(0x4000000 + 0x1c)) = gUnknown_030041B0;
    (*(vu16 *)(0x4000000 + 0x1e)) = gUnknown_030041B8;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_8089668();
}

static void sub_81150D8(void)
{
    sub_814A880(200, 72 + (gBattleCommunication[1] * 16));
}

static void EvoDummyFunc2(void)
{

}
