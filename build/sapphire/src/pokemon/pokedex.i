# 1 "src/pokemon/pokedex.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/pokemon/pokedex.c"
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
# 2 "src/pokemon/pokedex.c" 2
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
# 3 "src/pokemon/pokedex.c" 2
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
# 4 "src/pokemon/pokedex.c" 2
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
# 5 "src/pokemon/pokedex.c" 2
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
# 6 "src/pokemon/pokedex.c" 2
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
# 7 "src/pokemon/pokedex.c" 2
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
# 8 "src/pokemon/pokedex.c" 2
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
# 9 "src/pokemon/pokedex.c" 2
# 1 "include/m4a.h" 1



# 1 "include/gba/m4a_internal.h" 1
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
# 10 "src/pokemon/pokedex.c" 2
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
# 11 "src/pokemon/pokedex.c" 2
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
# 12 "src/pokemon/pokedex.c" 2
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
# 13 "src/pokemon/pokedex.c" 2
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
# 14 "src/pokemon/pokedex.c" 2
# 1 "include/pokedex_area_screen.h" 1



void ShowPokedexAreaScreen(u16 species, u8 *string);
# 15 "src/pokemon/pokedex.c" 2
# 1 "include/pokedex_cry_screen.h" 1



struct CryRelatedStruct
{
    u16 unk0;
    u8 unk2;
    u8 paletteNo;
    u8 xPos;
    u8 yPos;
};

u8 ShowPokedexCryScreen(struct CryRelatedStruct *, u8);
u8 sub_8119E3C(struct CryRelatedStruct *, u8);
void sub_8119F88(u8 a);
void sub_811A050(u16 species);
void DestroyCryMeterNeedleSprite();
# 16 "src/pokemon/pokedex.c" 2
# 1 "include/pokemon.h" 1
# 17 "src/pokemon/pokedex.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 18 "src/pokemon/pokedex.c" 2
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
# 19 "src/pokemon/pokedex.c" 2
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
# 20 "src/pokemon/pokedex.c" 2
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
# 21 "src/pokemon/pokedex.c" 2
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
# 22 "src/pokemon/pokedex.c" 2
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
# 23 "src/pokemon/pokedex.c" 2
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
# 24 "src/pokemon/pokedex.c" 2
# 1 "include/task.h" 1
# 25 "src/pokemon/pokedex.c" 2
# 1 "include/trig.h" 1



extern const s16 gSineTable[];

s16 Sin(s16 index, s16 amplitude);
s16 Cos(s16 index, s16 amplitude);
s16 Sin2(u16 angle);
s16 Cos2(u16 angle);
# 26 "src/pokemon/pokedex.c" 2
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
# 27 "src/pokemon/pokedex.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 28 "src/pokemon/pokedex.c" 2
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
# 29 "src/pokemon/pokedex.c" 2



struct PokedexListItem
{
    u16 dexNum;
    u16 seen:1;
    u16 owned:1;
};

struct PokedexView
{
    struct PokedexListItem unk0[386];
    u16 unk608;
    u8 unk60A_1:1;
    u8 unk60A_2:1;
    u8 unk60B;
    u16 pokemonListCount;
    u16 selectedPokemon;
    u16 unk610;
    u16 dexMode;
    u16 unk614;
    u16 dexOrder;
    u16 unk618;
    u16 unk61A;
    u16 unk61C;
    u16 unk61E[4];
    u16 selectedMonSpriteId;
    u16 unk628;
    u16 unk62A;
    u8 unk62C;
    u8 unk62D;
    u8 unk62E;
    u8 unk62F;
    s16 unk630;
    s16 unk632;
    u16 unk634;
    u16 unk636;
    u16 unk638;
    u16 unk63A[4];
    u8 filler642[8];
    u8 unk64A;
    u8 unk64B;
    u8 unk64C_1:1;
    u8 selectedScreen;
    u8 descriptionPageNum;
    u8 unk64F;
    u8 menuIsOpen;
    u8 unk651;
    u16 menuCursorPos;
    s16 menuY;
    u8 unk656[8];
    u8 unk65E[8];
};

enum
{
    DEX_MODE_HOENN,
    DEX_MODE_NATIONAL
};

enum
{
    AREA_SCREEN,
    CRY_SCREEN,
    SIZE_SCREEN,
    BACK_SCREEN
};

struct PokedexEntry
{
             u8 categoryName[14];
             u16 height;
             u16 weight;
             const u8 *descriptionPage1;
             const u8 *descriptionPage2;
             u16 unused;
             u16 pokemonScale;
             u16 pokemonOffset;
             u16 trainerScale;
             u16 trainerOffset;
};

struct UnknownStruct2
{
    const u8 *text1;
    const u8 *text2;
};

struct UnknownStruct1
{
    const struct UnknownStruct2 *unk0;
    u8 unk4;
    u8 unk5;
    u16 unk6;
};

struct UnknownStruct3
{
    const u8 *text;
    u8 unk4;
    u8 unk5;
    u8 unk6;
};

struct UnknownStruct4
{
    const u8 *text;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
};

extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gReservedSpritePaletteCount;
extern struct SpriteTemplate gUnknown_02024E8C;
extern u8 gUnknown_03005E98;
extern const u8 gPokedexMenu_Gfx[];
extern const u8 gUnknown_08E96738[];
extern const u8 gUnknown_08E96888[];
extern const u8 gUnknown_08E96994[];
extern const u8 gUnknown_08E9C6DC[];
extern const u8 gUnknown_08E96BD4[];
extern const u8 gUnknown_08E96ACC[];
extern const u8 gUnknown_08E96B58[];
extern const u16 gPokedexMenu_Pal[];
extern const u16 gPokedexMenu2_Pal[];
extern const struct CompressedSpriteSheet gTrainerFrontPicTable[];
extern const struct MonCoords gTrainerFrontPicCoords[];
extern const struct PokedexEntry gPokedexEntries[];
extern const u8 gPokedexMenuSearch_Gfx[];
extern const u8 gUnknown_08E96D2C[];
extern const u16 gPokedexMenuSearch_Pal[];
extern const u8 gTypeNames[][7];
extern const u8 gPokedexMenu2_Gfx[];

static __attribute__((section("ewram_data"))) struct PokedexView *gPokedexView = ((void *)0);
static __attribute__((section("ewram_data"))) u16 gUnknown_0202FFB8 = 0;
static __attribute__((section("ewram_data"))) u8 gUnknown_0202FFBA = 0;
static __attribute__((section("ewram_data"))) struct PokedexListItem *gUnknown_0202FFBC = ((void *)0);

u8 gUnknown_03005CE8;
IntrCallback gUnknown_03005CEC;

static u8 sub_8091E3C(void);

static const u16 sPokedexSearchPalette[] = INCBIN_U16("graphics/pokedex/search.gbapal");
static const u16 sNationalPokedexPalette[] = INCBIN_U16("graphics/pokedex/national.gbapal");
const u8 gEmptySpacce_839F7FC[0xA4] = {0};
static const u8 gUnknown_0839F8A0[] = INCBIN_U8("graphics/pokedex/pokedex_cry_layout.bin.lz");
static const u8 gUnknown_0839F988[] = INCBIN_U8("graphics/pokedex/pokedex_size_layout.bin.lz");
static const u8 gUnknown_0839FA7C[] = INCBIN_U8("graphics/pokedex/noball.4bpp.lz");

# 1 "src/pokemon/../data/pokedex_orders.h" 1
static const u16 gPokedexOrder_Alphabetical[] =
{
    387,
    388,
    389,
    390,
    391,
    392,
    393,
    394,
    395,
    396,
    397,
    398,
    399,
    400,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    408,
    409,
    410,
    411,
     58,
    282,
    304,
    382,
    341,
    342,
    278,
     62,
    208,
    265,
    305,
    130,
      9,
    287,
    289,
     54,
    321,
    320,
     92,
     93,
     28,
     55,
     42,
     68,
     16,
    262,
    383,
    210,
     67,
    207,
    302,
    216,
     22,
     21,
    292,
     19,
    161,
     74,
      7,
    185,
    316,
    220,
    317,
    253,
    252,
    254,
    103,
     52,
     38,
     78,
    108,
     44,
    314,
    177,
    178,
    206,
    294,
    234,
    195,
    361,
    259,
     29,
     32,
     30,
     33,
     31,
     34,
    198,
    162,
    354,
    275,
     51,
    213,
     11,
    363,
    260,
    224,
    114,
     75,
    247,
    228,
    301,
     49,
    273,
     15,
    269,
     73,
     84,
    188,
     85,
    322,
     50,
    225,
     76,
     14,
    109,
    110,
     43,
     26,
    243,
    380,
    381,
    131,
     45,
    280,
    171,
    113,
    165,
    166,
     82,
    377,
    379,
    378,
    384,
     20,
    315,
    271,
    272,
     95,
    249,
    337,
    298,
    235,
    124,
    158,
      5,
      6,
    346,
    345,
    217,
    126,
    218,
    240,
    219,
    156,
    248,
    183,
    184,
    312,
    122,
    360,
    202,
    296,
    226,
    149,
     56,
    154,
    340,
    221,
    179,
    376,
    132,
    374,
    375,
     69,
     27,
    200,
    227,
    258,
    151,
    150,
    339,
    147,
    356,
    350,
    241,
    288,
     60,
    332,
    236,
    285,
    286,
     12,
    257,
    153,
    120,
    373,
    180,
    306,
    313,
    136,
    163,
    368,
    101,
    267,
    155,
    197,
    157,
    209,
    283,
    284,
    329,
    349,
    238,
     13,
    111,
    127,
    173,
     35,
    370,
    134,
    319,
    318,
    331,
     57,
    251,
    336,
     90,
    293,
    338,
    189,
    372,
     61,
    123,
    277,
    245,
     97,
     96,
    117,
    106,
    369,
     37,
    148,
    266,
    145,
    309,
    310,
    116,
    205,
    364,
    365,
    371,
    347,
    102,
    182,
    168,
    348,
     23,
     24,
    291,
    255,
    121,
    201,
     66,
    138,
    139,
    246,
    244,
    359,
     80,
    199,
     79,
    164,
      8,
    353,
    327,
    362,
    300,
    125,
    239,
    196,
    190,
    159,
    270,
    256,
    343,
    186,
     72,
    193,
    119,
    307,
    308,
     70,
     71,
    194,
     59,
     64,
    133,
      3,
      1,
      2,
    303,
    129,
    274,
    143,
    160,
    335,
    181,
    344,
     41,
     87,
     86,
    135,
    263,
    385,
    264,
    366,
     89,
     88,
    100,
    170,
    223,
    358,
    152,
    250,
    211,
    268,
    237,
    351,
     63,
     10,
    115,
    128,
    352,
    232,
    112,
    222,
     81,
    231,
    299,
    324,
    118,
     48,
     98,
    169,
    203,
    281,
    230,
     99,
    104,
    105,
    386,
    276,
    176,
    175,
    290,
    328,
    187,
    140,
    141,
    357,
     47,
     46,
     91,
    333,
    334,
     83,
      4,
    146,
    279,
     94,
     53,
    167,
     77,
    261,
    215,
    295,
    323,
    137,
    233,
     39,
     40,
    174,
    144,
    142,
    330,
    311,
    325,
    326,
     17,
     18,
    172,
     25,
    204,
     36,
    297,
    212,
    355,
    191,
    192,
    242,
    367,
    214,
    229,
    107,
     65,
};

static const u16 gPokedexOrder_Weight[] =
{
     92,
     93,
    187,
     50,
    351,
    109,
    174,
    200,
    358,
    188,
    385,
    333,
    292,
    175,
    283,
     16,
    191,
    339,
    172,
    298,
    315,
    177,
     21,
    198,
    353,
    276,
    102,
    255,
    270,
     10,
    189,
    173,
     13,
    176,
    147,
     19,
    284,
    265,
    211,
    151,
     90,
    273,
    132,
     69,
    311,
     52,
    312,
    285,
    251,
    222,
    252,
    327,
    201,
     46,
     43,
     39,
    290,
    182,
     81,
     25,
    238,
    161,
     70,
    152,
    220,
    133,
     98,
    104,
    280,
      1,
     23,
     29,
    204,
    349,
    138,
     41,
     35,
    258,
    209,
    179,
    155,
    116,
      4,
    192,
    183,
    194,
    167,
     44,
    370,
    216,
     32,
      7,
    278,
    158,
    110,
     37,
     11,
    266,
    129,
     14,
    316,
    100,
    165,
    228,
    300,
    302,
    307,
    341,
    190,
    268,
    303,
    140,
     40,
     27,
    223,
    291,
    170,
     60,
    347,
     49,
    354,
      2,
    180,
    261,
    360,
    206,
    178,
    355,
     83,
    328,
    118,
    309,
    329,
     71,
    153,
    225,
    293,
    148,
    361,
    263,
    314,
    313,
     20,
     45,
    156,
      5,
     58,
    256,
     66,
     63,
     33,
     54,
    277,
     38,
     30,
     61,
     74,
    281,
    213,
    334,
    318,
    236,
    163,
    240,
    343,
    253,
    352,
    171,
      8,
    368,
    369,
    239,
    340,
    345,
    322,
    287,
    135,
    159,
    136,
    117,
    196,
    367,
    197,
    259,
    274,
    215,
     56,
    279,
    267,
    224,
    184,
    202,
    134,
     28,
     47,
     15,
     89,
     17,
     88,
     26,
     77,
    125,
     48,
    325,
    356,
    308,
    269,
     53,
     12,
     57,
     96,
    162,
    233,
    271,
    264,
    301,
    342,
     51,
    168,
    231,
    186,
    120,
    113,
    139,
    114,
    218,
    229,
    166,
     79,
    137,
    262,
    193,
     22,
    185,
    119,
    286,
     84,
     18,
    363,
     36,
    380,
    310,
    335,
    141,
     94,
    294,
    124,
    164,
    203,
    371,
    126,
    105,
     72,
    288,
    242,
    359,
     65,
    237,
    282,
    210,
    106,
    107,
    227,
    331,
    257,
    254,
    336,
    366,
    145,
    214,
     62,
    122,
    127,
    272,
     73,
     42,
    219,
    144,
    221,
    123,
     64,
    235,
    142,
    275,
     99,
     31,
     82,
    304,
    381,
    146,
    346,
    386,
    181,
     34,
    207,
     24,
    108,
    101,
    348,
     67,
    234,
    326,
    246,
    169,
    195,
    241,
     97,
     55,
    332,
     80,
    157,
    199,
    115,
    121,
    317,
    324,
    260,
    330,
    295,
     85,
      9,
    296,
    364,
    128,
    319,
    160,
     86,
      6,
     78,
    374,
    299,
      3,
    357,
    154,
    373,
     75,
    344,
    372,
    111,
    212,
     87,
    112,
    232,
    103,
    305,
    150,
    217,
    205,
     68,
    320,
    289,
     91,
    365,
    247,
    230,
    338,
     59,
    350,
    337,
    378,
    243,
    245,
    244,
    250,
    248,
    375,
    379,
    384,
     95,
    149,
    249,
    131,
    323,
    226,
    377,
    130,
    297,
    362,
     76,
    382,
    306,
    321,
    208,
    143,
    376,
    383,
};
static const u16 gPokedexOrder_Height[] =
{
     50,
    298,
    177,
     13,
    172,
    173,
    175,
    351,
    174,
     10,
    276,
    132,
    133,
    315,
     21,
     16,
    191,
     90,
     19,
     81,
     46,
    265,
    385,
    104,
    258,
    194,
    116,
     52,
     29,
    220,
    151,
    333,
    304,
    311,
    312,
    102,
     25,
    182,
    316,
    263,
    285,
    138,
    331,
     98,
    280,
    187,
    255,
    366,
     74,
    183,
    339,
    238,
    100,
    290,
    302,
    198,
    211,
      7,
    252,
    343,
     43,
    270,
     39,
    283,
    155,
    140,
    264,
    324,
     32,
    167,
     56,
    273,
    261,
    231,
    201,
    170,
    233,
     60,
    371,
    349,
    353,
    158,
    251,
    360,
     27,
    358,
    370,
    228,
    266,
    309,
      4,
    307,
    278,
    223,
    341,
    222,
    314,
    209,
     37,
    246,
    374,
    293,
    204,
    239,
     35,
    213,
    216,
     14,
    300,
    176,
    118,
    303,
    179,
    188,
    109,
     51,
    268,
    322,
    347,
    313,
    163,
    328,
    325,
     11,
     69,
    361,
     20,
    259,
    277,
    240,
     58,
    200,
      1,
    236,
    218,
    287,
    281,
    190,
    135,
     30,
    184,
    292,
     66,
    291,
    284,
    355,
    192,
    189,
    120,
    180,
    363,
     54,
    219,
     83,
     41,
    137,
    161,
    318,
     44,
     26,
    129,
    215,
    305,
    256,
    224,
     33,
    136,
    225,
     72,
     63,
    253,
    340,
    156,
    196,
     88,
    152,
    326,
    299,
     53,
    262,
     48,
     82,
     77,
    296,
    337,
     28,
     96,
    114,
     57,
    165,
     40,
     47,
    139,
    294,
      8,
     75,
    197,
    345,
     61,
    134,
     15,
    105,
     70,
    369,
    111,
      2,
    352,
    274,
    267,
     17,
    168,
     86,
    186,
    159,
    113,
    354,
    232,
    121,
      5,
    221,
     12,
    329,
    125,
    342,
    301,
    334,
    372,
     38,
    207,
    364,
    327,
    247,
     79,
    338,
    241,
     22,
     45,
     89,
    205,
    185,
    359,
    193,
    269,
    108,
    235,
    171,
    101,
    271,
    286,
    153,
    117,
    110,
    279,
    375,
     31,
    332,
    275,
    308,
    335,
    141,
     99,
     64,
    119,
     36,
    126,
    202,
     92,
    122,
     62,
    128,
    380,
    181,
    288,
    166,
     76,
    365,
     84,
    229,
     34,
    124,
    107,
    234,
    210,
    237,
    195,
    344,
    260,
    242,
    272,
    295,
    206,
    127,
     91,
     67,
    203,
     18,
    178,
    346,
    106,
     49,
     94,
    214,
    362,
    123,
    373,
    310,
    348,
     65,
     97,
    164,
     73,
    356,
    145,
     42,
    376,
    282,
      9,
     80,
     93,
     68,
    377,
    317,
    254,
    227,
     55,
    386,
     71,
     78,
      6,
    367,
     87,
    144,
    157,
    142,
    368,
    217,
    154,
    378,
    212,
    230,
    147,
     85,
    319,
    169,
    162,
     59,
    243,
    257,
    323,
    112,
    379,
     23,
    330,
    357,
    381,
    245,
    146,
      3,
    103,
    199,
    248,
    289,
    320,
    150,
    306,
    143,
    226,
    244,
    149,
    115,
    297,
    160,
    131,
    336,
     24,
    383,
    250,
    148,
    382,
    249,
    350,
    130,
    384,
     95,
    208,
    321,
};
# 186 "src/pokemon/pokedex.c" 2
static const struct OamData gOamData_83A0404 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_83A040C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_83A0414 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_83A041C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 2,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_83A0424 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_83A042C =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 2,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
static const union AnimCmd gSpriteAnim_83A0434[] =
{
    {.frame = {3, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A043C[] =
{
    {.frame = {1, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A0444[] =
{
    {.frame = {16, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A044C[] =
{
    {.frame = {32, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A0454[] =
{
    {.frame = {64, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A045C[] =
{
    {.frame = {96, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A0464[] =
{
    {.frame = {128, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A046C[] =
{
    {.frame = {160, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A0474[] =
{
    {.frame = {192, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A047C[] =
{
    {.frame = {224, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A0484[] =
{
    {.frame = {226, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A048C[] =
{
    {.frame = {228, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A0494[] =
{
    {.frame = {230, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A049C[] =
{
    {.frame = {232, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A04A4[] =
{
    {.frame = {234, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A04AC[] =
{
    {.frame = {236, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A04B4[] =
{
    {.frame = {238, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A04BC[] =
{
    {.frame = {240, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A04C4[] =
{
    {.frame = {242, 30}},
    {.type = -1},
};
static const union AnimCmd gSpriteAnim_83A04CC[] =
{
    {.frame = {4, 30}},
    {.type = -1},
};
static const union AnimCmd *const gSpriteAnimTable_83A04D4[] =
{
    gSpriteAnim_83A0434,
};
static const union AnimCmd *const gSpriteAnimTable_83A04D8[] =
{
    gSpriteAnim_83A043C,
};
static const union AnimCmd *const gSpriteAnimTable_83A04DC[] =
{
    gSpriteAnim_83A0444,
};
static const union AnimCmd *const gSpriteAnimTable_83A04E0[] =
{
    gSpriteAnim_83A044C,
    gSpriteAnim_83A0454,
    gSpriteAnim_83A045C,
    gSpriteAnim_83A0464,
};
static const union AnimCmd *const gSpriteAnimTable_83A04F0[] =
{
    gSpriteAnim_83A046C,
    gSpriteAnim_83A0474,
};
static const union AnimCmd *const gSpriteAnimTable_83A04F8[] =
{
    gSpriteAnim_83A047C,
    gSpriteAnim_83A0484,
    gSpriteAnim_83A048C,
    gSpriteAnim_83A0494,
    gSpriteAnim_83A049C,
    gSpriteAnim_83A04A4,
    gSpriteAnim_83A04AC,
    gSpriteAnim_83A04B4,
    gSpriteAnim_83A04BC,
    gSpriteAnim_83A04C4,
};
static const union AnimCmd *const gSpriteAnimTable_83A0520[] =
{
    gSpriteAnim_83A04CC,
};
static void sub_808EF38(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83A0524 =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A0404,
    .anims = gSpriteAnimTable_83A04D4,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_808EF38,
};
static void sub_808EF8C(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83A053C =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A040C,
    .anims = gSpriteAnimTable_83A04D8,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_808EF8C,
};
static void sub_808F08C(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83A0554 =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A0414,
    .anims = gSpriteAnimTable_83A04E0,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_808F08C,
};
static void sub_808F0B4(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83A056C =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A041C,
    .anims = gSpriteAnimTable_83A04DC,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_808F0B4,
};
static void sub_808ED94(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83A0584 =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A0424,
    .anims = gSpriteAnimTable_83A04F0,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_808ED94,
};
static const struct SpriteTemplate gSpriteTemplate_83A059C =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A042C,
    .anims = gSpriteAnimTable_83A04F8,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_808ED94,
};
static void sub_808F168(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_83A05B4 =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83A042C,
    .anims = gSpriteAnimTable_83A0520,
    .images = ((void *)0),
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_808F168,
};
static const struct CompressedSpriteSheet gUnknown_083A05CC[] =
{
    {gPokedexMenu2_Gfx, 0x1F00, 0x1000},
    {((void *)0), 0, 0},
};
static const struct SpritePalette gUnknown_083A05DC[] =
{
    {gPokedexMenu_Pal, 0x1000},
    {((void *)0), 0},
};
static const u8 gUnknown_083A05EC[] = {2, 4, 8, 16, 32};
static const u8 gUnknown_083A05F1[] = {16, 8, 4, 2, 1};
const u8 gEmptySpacce_83A05F6[] = {0, 0};
static const u8 gUnknown_083A05F8[] = _("");

# 1 "src/pokemon/../data/pokedex_entries.h" 1
static const u8 DexDescription_Dummy[] = _(
    "-");

static const u8 DexDescription_Bulbasaur[] = _(
    "양지에서 낮잠 자는 모습을 볼 수 있다.\n"
    "태양의 빛을 많이 받으면\n"
    "등의 씨앗이 크게 자란다.");

static const u8 DexDescription_Ivysaur[] = _(
    "꽃봉오리를 지탱하기 위해 하반신이 강해진다.\n"
    "양지에서 가만히 있는 시간이\n"
    "길어지면 드디어 커다란 꽃이 필 때다.");

static const u8 DexDescription_Venusaur[] = _(
    "충분한 영양분과 태양의 빛이\n"
    "꽃의 색을 선명하게 만든다고 한다.\n"
    "꽃의 향기는 사람의 마음을 치유한다.");

static const u8 DexDescription_Charmander[] = _(
    "꼬리의 불꽃은 기분을 표현한다.\n"
    "즐거울 때는 흔들흔들 불꽃이 흔들리고\n"
    "화가 났을 때는 활활 맹렬히 불타오른다.");

static const u8 DexDescription_Charmeleon[] = _(
    "날카로운 발톱으로 봐주지 않고 때려눕힌다.\n"
    "강한 적을 만나면 기분이 고양되며\n"
    "꼬리의 불꽃이 푸르스름하게 불타오른다.");

static const u8 DexDescription_Charizard[] = _(
    "강한 상대를 찾아 하늘을 날아다닌다.\n"
    "무엇이든 다 녹여버리는 고열의 불꽃을\n"
    "자신보다 약한 자에게 들이대지 않는다.");

static const u8 DexDescription_Squirtle[] = _(
    "등껍질의 역할은 몸을 지키는 것뿐만이 아니다.\n"
    "둥그런 모양과 표면의 홈이 물의\n"
    "저항을 줄여서 빠르게 헤엄칠 수 있다.");

static const u8 DexDescription_Wartortle[] = _(
    "푹신한 털로 덮인 큰 꼬리는\n"
    "오래 살수록 깊은 색으로 변한다.\n"
    "등껍질의 상처는 강자임을 증명한다.");

static const u8 DexDescription_Blastoise[] = _(
    "등껍질의 분사구로 하는 조준은 정확하다.\n"
    "물 탄환으로 50m 떨어진\n"
    "빈 캔을 명중시킬 수 있다.");

static const u8 DexDescription_Caterpie[] = _(
    "몸보다 커다란 잎사귀를 순식간에\n"
    "먹어치울 정도의 식욕을 지녔다.\n"
    "더듬이로 강렬한 냄새를 피운다.");

static const u8 DexDescription_Metapod[] = _(
    "몸의 껍질은 철판처럼 단단하다.\n"
    "움직임이 적은 것은 껍질 안에서 부드러운\n"
    "몸이 진화 준비를 하고 있어서다.");

static const u8 DexDescription_Butterfree[] = _(
    "맛있는 꽃의 꿀을 찾는 능력이\n"
    "뛰어나서 사는 곳에서 10km 떨어진 장소에\n"
    "핀 꽃에서 꿀을 모아 옮긴다.");

static const u8 DexDescription_Weedle[] = _(
    "굉장히 예민한 후각을 지니고 있다.\n"
    "좋아하는 잎사귀인지 싫어하는 잎사귀인지\n"
    "크고 빨간 코로 냄새 맡아 구별한다.");

static const u8 DexDescription_Kakuna[] = _(
    "거의 움직이지 않고 나무에 매달려 있지만\n"
    "내부는 진화 준비로 굉장히 바쁜 상태다.\n"
    "그 증거로 몸이 뜨거워져 있다.");

static const u8 DexDescription_Beedrill[] = _(
    "영역에 대한 집착이 매우 강해서 독침붕이\n"
    "사는 곳에는 가까이 가지 않는 것이 신상에 좋다.\n"
    "화나면 집단으로 습격해 온다.");

static const u8 DexDescription_Pidgey[] = _(
    "방향 감각이 매우 뛰어나서\n"
    "아무리 멀리 떨어진 곳에서도 헤매지 않고\n"
    "자신의 둥지까지 찾아 돌아올 수 있다.");

static const u8 DexDescription_Pidgeotto[] = _(
    "넓은 영역을 날며 순찰한다.\n"
    "영역을 침범하는 상대는 용서하지 않는다.\n"
    "날카로운 발톱으로 철저히 혼내준다.");

static const u8 DexDescription_Pidgeot[] = _(
    "아름답게 윤이 나는 깃털을 가진 포켓몬이다.\n"
    "머리 깃털의 아름다움에 마음을 빼앗겨\n"
    "피죤투를 기르는 트레이너도 많다.");

static const u8 DexDescription_Rattata[] = _(
    "경계심이 매우 강해서 자고 있을 때도\n"
    "귀를 움직여 주변의 소리를 듣고 있다.\n"
    "어디에든 자리를 잡고 둥지를 만든다.");

static const u8 DexDescription_Raticate[] = _(
    "튼튼한 이빨은 계속 자라기 때문에\n"
    "바위나 큰 나무를 갉아서 갈아낸다.\n"
    "집의 벽을 갉아 놓기도 한다.");

static const u8 DexDescription_Spearow[] = _(
    "큰 울음소리는 1km 밖까지 도달한다.\n"
    "여기저기에서 높은 울음소리가 들릴 때는\n"
    "동료에게 위험을 알리고 있는 신호다.");

static const u8 DexDescription_Fearow[] = _(
    "긴 목과 부리는 땅이나 물 안에\n"
    "있는 먹이를 잡기 편리하다.\n"
    "가늘고 긴 부리로 능숙히 집는다.");

static const u8 DexDescription_Ekans[] = _(
    "빙빙 몸을 말고 쉬고 있는 것은\n"
    "어떤 방향에서 적이 습격해 와도 빠르게\n"
    "머리를 틀어 위협할 수 있기 때문이다.");

static const u8 DexDescription_Arbok[] = _(
    "조이는 힘이 매우 강력하다.\n"
    "드럼통도 납작하게 짜부라트린다.\n"
    "휘감기면 도망가는 것이 불가능하다.");


static const u8 DexDescription_Pikachu[] = _(
    "뺨의 전기 주머니에 있는 전기는 한밤중\n"
    "자는 동안 축적되는 것 같다.\n"
    "잠이 덜 깨서 방전하기도 한다.");
# 137 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Raichu[] = _(
    "약한 전기를 온몸에서 발산하고 있기 때문에\n"
    "어두운 곳에서는 희미하게 빛난다.\n"
    "꼬리를 땅에 박고 전기를 흘려보낸다.");
# 149 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Sandshrew[] = _(
    "바싹바싹 마른 피부는 매우 단단해서\n"
    "몸을 둥글게 말면 어떤 공격도 튕겨낸다.\n"
    "밤에는 사막의 모래에 들어가 잠잔다.");
# 161 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Sandslash[] = _(
    "등을 둥그렇게 말면 뾰족뾰족한 공 같다.\n"
    "가시에 찔려 풀죽은 상대에게 덤벼들어\n"
    "날카로운 발톱으로 박박 할퀴어 놓는다.");







static const u8 DexDescription_NidoranF[] = _(
    "작은 몸을 지키기 위해 강력한\n"
    "독침이 발달한 것이라 여겨진다.\n"
    "화가 나면 뿔 끝에서 맹독이 나온다.");

static const u8 DexDescription_Nidorina[] = _(
    "동료나 가족과 함께일 때는 서로\n"
    "상처 입히지 않도록 가시를 세우지 않는다.\n"
    "동료와 떨어지면 불안해하는 것 같다.");

static const u8 DexDescription_Nidoqueen[] = _(
    "단단한 비늘로 뒤덮인 몸을 부딪쳐서\n"
    "상대를 튕겨내는 공격이 특기다.\n"
    "자식을 지킬 때 가장 강하다.");

static const u8 DexDescription_NidoranM[] = _(
    "귀를 움직이는 근육이 발달되어 있어서\n"
    "어떤 방향으로든 자유로이 귀를 움직일 수 있다.\n"
    "희미한 소리도 빠트리지 않고 듣는 포켓몬이다.");

static const u8 DexDescription_Nidorino[] = _(
    "다이아몬드보다 단단한 뿔을 지녔다.\n"
    "적의 기척을 느끼면 등에 달린 가시를\n"
    "일제히 세우고 전력을 다해 맞선다.");

static const u8 DexDescription_Nidoking[] = _(
    "두꺼운 꼬리는 한 번 휘두르면 튼튼한\n"
    "철탑도 꺾어 버리는 엄청난 파괴력을 지녔다.\n"
    "한 번 날뛰기 시작하면 손쓸 수 없다.");

static const u8 DexDescription_Clefairy[] = _(
    "보름달 밤에는 기운차게 논다.\n"
    "동틀 녘에 지친 삐삐들은 조용한\n"
    "산속에서 동료와 바짝 붙어 잠잔다.");

static const u8 DexDescription_Clefable[] = _(
    "날개를 사용하여 날아가듯 뛰어간다.\n"
    "물 위를 걷는 것도 할 수 있다.\n"
    "조용한 달밤에 호수를 걷는다.");


static const u8 DexDescription_Vulpix[] = _(
    "몸 안에서 항상 불꽃이 타고 있다.\n"
    "낮에 기온이 올라가면 체온도 올라가기\n"
    "때문에 입으로 불꽃을 빼낸다.");
# 225 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Ninetales[] = _(
    "성스러운 힘을 지닌 9명의 신선이\n"
    "합체하여 태어났다는 전설이 있다.\n"
    "지능이 높아서 사람의 말을 이해한다.");
# 237 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Jigglypuff[] = _(
    "노래할 때는 한 번도 숨을 쉬지 않는다.\n"
    "어지간히 잠들지 않는 상대와 맞설 때는\n"
    "숨을 쉴 수 없기에 푸린도 필사적이다.");
# 249 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Wigglytuff[] = _(
    "탄력이 뛰어난 몸은 크게\n"
    "숨을 들이마시면 한없이 부푼다.\n"
    "부푼 푸크린은 두둥실 떠오른다.");
# 261 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Zubat[] = _(
    "태양의 빛을 받으면 몸 상태가\n"
    "나빠지기 때문에 낮에는 동굴이나 오래된\n"
    "집의 처마 밑에 매달려 자고 있다.");
# 273 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Golbat[] = _(
    "4개의 이빨로 물어 혈액을 마신다.\n"
    "달이 뜨지 않은 캄캄한 밤에는 활발하게\n"
    "날아다니며 사람이나 포켓몬을 습격한다.");
# 285 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Oddish[] = _(
    "영양 만점인 흙을 찾아 몸을 묻는다.\n"
    "낮 동안 땅에 묻혀 있을 때는 다리가\n"
    "나무뿌리 같은 형태를 띠고 있는 듯하다.");
# 297 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Gloom[] = _(
    "아무래도 냄새꼬는 입에서 나는\n"
    "맹렬한 악취를 매우 좋아하는 것 같다.\n"
    "냄새를 맡으면 더욱 꿀이 넘쳐난다.");
# 309 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Vileplume[] = _(
    "세계에서 제일 큰 꽃잎으로 먹이를\n"
    "유인하여 독 꽃가루를 끼얹는다.\n"
    "움직이지 못하게 된 먹이를 잡아먹는다.");







static const u8 DexDescription_Paras[] = _(
    "파라스로부터 양분을 빨아들여 자란\n"
    "버섯은 동충하초라고 불리고 있다.\n"
    "장수의 약이 되는 귀중한 버섯이다.");

static const u8 DexDescription_Parasect[] = _(
    "파라섹트는 집단으로 큰 나무의 밑동에\n"
    "붙어 영양을 빨아들인다.\n"
    "말라버리면 일제히 다른 나무로 이동한다.");

static const u8 DexDescription_Venonat[] = _(
    "몸을 지키기 위해 가늘고 딱딱한 털이\n"
    "전신을 둘러싸게 됐다고 전해진다.\n"
    "작은 먹잇감도 놓치지 않는 눈을 가졌다.");

static const u8 DexDescription_Venomoth[] = _(
    "야행성으로 밤에 활동을 시작한다.\n"
    "가로등 빛에 이끌려 모여든\n"
    "작은 벌레를 즐겨 먹는다.");

static const u8 DexDescription_Diglett[] = _(
    "농가 대부분이 디그다를 기르고 있다.\n"
    "디그다가 구멍을 판 땅은 적당히\n"
    "일궈져 있어 맛있는 채소가 재배되기 때문이다.");

static const u8 DexDescription_Dugtrio[] = _(
    "본래 하나의 몸에서 세쌍둥이가\n"
    "된 것이라 모두 생각하는 것이 같다.\n"
    "힘을 모아 끝없이 파나간다.");

static const u8 DexDescription_Meowth[] = _(
    "날카로운 발톱을 집어넣고 살금살금\n"
    "발소리를 내지 않고 걸을 수 있다. 반짝반짝\n"
    "빛나는 동전을 왠지 모르지만 매우 좋아한다.");

static const u8 DexDescription_Persian[] = _(
    "튼튼한 6가닥의 수염은 공기의 움직임으로\n"
    "주변의 상태를 파악하는 역할을 한다.\n"
    "수염을 잡히면 얌전해진다.");


static const u8 DexDescription_Psyduck[] = _(
    "이상한 힘을 썼던 기억이 없는 것은\n"
    "힘을 발휘할 때가 숙면 중일 때와\n"
    "같은 상태이기 때문인 것 같다.");
# 373 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Golduck[] = _(
    "헤엄치는 스피드는 포켓몬 중 제일이다.\n"
    "태풍으로 거칠어진 바다라도 문제없다.\n"
    "난파선에서 사람을 구해내는 일도 있다.");







static const u8 DexDescription_Mankey[] = _(
    "몸이 떨리며 콧김이 거칠어지면\n"
    "화를 낼 조짐이지만 순식간에 격렬하게\n"
    "화를 내기 때문에 도망갈 틈이 없다.");

static const u8 DexDescription_Primeape[] = _(
    "격렬하게 화를 내면 혈액순환이\n"
    "좋아져 근육의 힘을 강하게 만든다.\n"
    "단 머리 회전은 느려진다.");

static const u8 DexDescription_Growlithe[] = _(
    "후각이 뛰어나서 한 번 맡은 냄새는\n"
    "무슨 일이 있어도 절대 잊지 않는다.\n"
    "상대의 기분을 냄새로 감지한다.");

static const u8 DexDescription_Arcanine[] = _(
    "10000km 거리를 하루 만에 달려간다고\n"
    "전해지는 매우 빠른 포켓몬이다.\n"
    "체내에서 불타오르는 불꽃이 파워가 된다.");

static const u8 DexDescription_Poliwag[] = _(
    "소용돌이 모양인 내장이 비칠 정도로\n"
    "얇은 피부이지만 날카로운 이빨을\n"
    "튕겨내는 탄력을 지니고 있다.");

static const u8 DexDescription_Poliwhirl[] = _(
    "항상 몸의 표면이 액체로 미끈미끈하게\n"
    "젖어 있어서 적에게 붙잡혀도\n"
    "미끄덩 빠져나와 도망갈 수 있다.");

static const u8 DexDescription_Poliwrath[] = _(
    "강인하게 발달한 근육은 아무리\n"
    "운동해도 지치는 일이 없다.\n"
    "태평양도 가볍게 횡단할 수 있을 정도다.");


static const u8 DexDescription_Abra[] = _(
    "매일 18시간을 자지 않으면 수면 부족으로\n"
    "초능력을 사용할 수 없게 된다.\n"
    "습격당하면 잠든 채로 순간이동하여 도망간다.");
# 432 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Kadabra[] = _(
    "은 숟가락은 알파파를 높여준다.\n"
    "숟가락이 없으면 평상시의 반밖에\n"
    "초능력을 사용할 수 없게 된다고 한다.");
# 444 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Alakazam[] = _(
    "무한히 늘어나는 뇌세포가 지능지수\n"
    "5000의 슈퍼 두뇌를 만들어냈다.\n"
    "전 세계에서 일어난 일을 모두 기억하고 있다.");
# 456 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Machop[] = _(
    "데구리를 들어 올려 몸을 단련한다.\n"
    "모든 격투기를 마스터하기 위해\n"
    "전 세계를 여행하는 알통몬도 있다.");
# 468 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Machoke[] = _(
    "힘이 많이 드는 인간의 일을 도와주며\n"
    "매일 몸을 단련하는 포켓몬이다.\n"
    "쉬는 날에는 산야에서 몸을 단련한다.");
# 480 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Machamp[] = _(
    "모든 격투기를 마스터한 포켓몬이다.\n"
    "4개의 팔에 잡히면 그대로 끝이다.\n"
    "지평선 너머까지 집어 던져 버린다.");







static const u8 DexDescription_Bellsprout[] = _(
    "가늘고 유연한 몸은 아무리 강한\n"
    "공격이라도 휘어져 피할 수 있다.\n"
    "입에서 철도 녹일 수 있는 액체를 뿜는다.");

static const u8 DexDescription_Weepinbell[] = _(
    "밤이 되면 엉덩이의 갈고리를 나뭇가지에\n"
    "걸고 매달려서 잠든다.\n"
    "잠버릇이 나쁘면 아침에 떨어져 있다.");

static const u8 DexDescription_Victreebel[] = _(
    "머리에 달린 긴 덩굴을 작은\n"
    "생물처럼 움직여서 먹이를 유인한다.\n"
    "가까이 왔을 때 덥석 한 번에 삼킨다.");


static const u8 DexDescription_Tentacool[] = _(
    "태양 광선을 몸 안의 수분으로\n"
    "굴절시켜서 빔 에너지로 바꾼다.\n"
    "수정 같은 눈알에서 발사된다.");
# 519 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Tentacruel[] = _(
    "자유롭게 늘었다 줄었다 하는 촉수로 먹이를\n"
    "휘감아 맹독을 주입해 약하게 만든다.\n"
    "한 번에 80마리의 먹이를 잡는다.");
# 531 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Geodude[] = _(
    "땅에 반쯤 박혀서 푹 잠잔다.\n"
    "등산 중인 사람에게 밟혀도 전혀 깨지 않는다.\n"
    "아침에 먹이를 찾아 언덕을 굴러 내려온다.");
# 543 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Graveler[] = _(
    "산기슭부터 산 정상까지 올라가는\n"
    "동안 매우 좋아하는 바위를 으득으득 먹는다.\n"
    "정상에 도달하면 다시 굴러 내려온다.");
# 555 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Golem[] = _(
    "산의 경사면에 파놓은 홈은 굴러\n"
    "내려오는 딱구리가 민가에 부딪히지\n"
    "않게 하기 위한 코스로 되어 있다.");







static const u8 DexDescription_Ponyta[] = _(
    "막 태어나서는 겨우 설 수 있는 정도지만\n"
    "넘어지면서 부모의 뒤를 쫓아다니는\n"
    "동안 하반신이 튼튼하게 자라난다.");

static const u8 DexDescription_Rapidash[] = _(
    "평상시는 느긋하게 들판을 뛰어다니지만\n"
    "한 번 마음먹으면 갈기의 불꽃을\n"
    "불태우며 시속 240km로 달린다.");

static const u8 DexDescription_Slowpoke[] = _(
    "꼬리를 강에 넣고 먹이를 낚지만\n"
    "이윽고 무엇을 하고 있었는지 잊고\n"
    "강변에 엎드려 누운 채로 하루를 보낸다.");

static const u8 DexDescription_Slowbro[] = _(
    "셀러가 물고 있어서 꼬리로 먹이를\n"
    "낚을 수 없게 된 야도란은 마지못해\n"
    "물속을 헤엄쳐 먹이를 잡고 있다.");


static const u8 DexDescription_Magnemite[] = _(
    "좌우의 유닛에서 전자파를 내어\n"
    "중력을 차단하여 공중에 뜬다.\n"
    "체내의 전기가 없어지면 날지 못하게 된다.");
# 599 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Magneton[] = _(
    "강력한 자기장이 정밀 기계를\n"
    "망가트리기 때문에 몬스터볼에 넣어\n"
    "두지 않으면 주의를 받는 마을도 있다고 한다.");







static const u8 DexDescription_Farfetchd[] = _(
    "가지고 있는 식물의 줄기에도 좋은 것과\n"
    "그렇지 않은 것이 있는 듯하여 파오리들이\n"
    "줄기를 둘러싸고 싸우는 일도 있다.");


static const u8 DexDescription_Doduo[] = _(
    "두 개의 머리는 같은 뇌를 지녔다.\n"
    "드물게 각각의 뇌를 지닌 두두가\n"
    "태어난다는 연구 결과도 보고되었다.");
# 628 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Dodrio[] = _(
    "3개 있는 것은 머리뿐이 아닌 것 같다.\n"
    "심장과 폐도 3개라서 숨이 가빠지지\n"
    "않으며 먼 거리를 달릴 수 있다.");







static const u8 DexDescription_Seel[] = _(
    "얼음으로 뒤덮인 바다에서 먹이를 잡는다.\n"
    "숨을 쉴 때는 머리의 돌출된 부분으로\n"
    "얼음을 깨고 바다 밖으로 얼굴을 내민다.");

static const u8 DexDescription_Dewgong[] = _(
    "차가운 얼음 위에서 자는 것을 매우 좋아한다.\n"
    "옛날에 빙산에서 자는 모습을 본\n"
    "뱃사람이 인어로 착각했다.");


static const u8 DexDescription_Grimer[] = _(
    "오염된 해저의 진흙에서 태어났다.\n"
    "더러운 것을 매우 좋아해서 몸 전체에서\n"
    "세균 범벅인 액체가 흘러나오고 있다.");
# 662 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Muk[] = _(
    "더러운 것을 매우 좋아해서 쓰레기를\n"
    "길가에 버릴 것 같은 사람이 사는\n"
    "마을에는 질뻐기가 모여든다.");







static const u8 DexDescription_Shellder[] = _(
    "밤이 되면 큰 혀로 해저의\n"
    "모래에 구멍을 뚫고 그 안에서 잔다.\n"
    "혀를 내민 채로 껍질을 닫고 잠든다.");

static const u8 DexDescription_Cloyster[] = _(
    "들이마신 바닷물을 뒤쪽으로 기운차게\n"
    "뿜어내서 바닷속을 헤엄친다.\n"
    "같은 방법으로 가시도 발사한다.");

static const u8 DexDescription_Gastly[] = _(
    "강풍을 맞으면 가스로 된 몸은\n"
    "금세 날려져서 작아진다.\n"
    "바람을 피해 고오스가 처마 밑에 모인다.");

static const u8 DexDescription_Haunter[] = _(
    "어둠 속에서 나타나는 고우스트가 손짓으로\n"
    "불러도 절대 가까이 가면 안 된다.\n"
    "날름 핥아져 생명을 빨린다.");

static const u8 DexDescription_Gengar[] = _(
    "한밤중 가로등 빛에 생겨난 그림자가\n"
    "자신을 앞질러 가는 것은 팬텀이\n"
    "그림자인 척하며 뛰어가기 때문이다.");

static const u8 DexDescription_Onix[] = _(
    "뇌에 자석이 있어서 땅속을\n"
    "파고 나가도 방향을 틀리지 않는다.\n"
    "나이를 먹을수록 몸이 둥그스름해진다.");

static const u8 DexDescription_Drowzee[] = _(
    "잠들었을 때 너의 코가 근질근질하다면\n"
    "슬리프가 머리맡에 서서 콧구멍을\n"
    "통해 꿈을 먹으려고 하는 신호다.");

static const u8 DexDescription_Hypno[] = _(
    "손에 쥐고 있는 추의 움직임과 반짝임이\n"
    "상대를 깊은 최면 상태에 빠트린다.\n"
    "먹이를 찾으며 추를 손질하고 있다.");

static const u8 DexDescription_Krabby[] = _(
    "모래 해변에 구멍을 뚫고 거기서 살고 있다.\n"
    "먹이가 적은 모래 해변에서는 자리 확보를\n"
    "위해 다투는 크랩들을 볼 수 있다.");

static const u8 DexDescription_Kingler[] = _(
    "킹크랩은 거대한 집게를 휘둘러\n"
    "동료 간에 신호를 보내지만\n"
    "집게가 무거워서 곧 지쳐버린다.");


static const u8 DexDescription_Voltorb[] = _(
    "작은 충격에도 바로 폭발한다.\n"
    "몬스터볼에 강력한 전류를\n"
    "가했을 때 태어났다는 소문이 돌고 있다.");
# 736 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Electrode[] = _(
    "전기에 끌리는 성질을 지녔다.\n"
    "주로 발전소에 모여서 막 만들어진\n"
    "전기를 먹어버리는 말썽꾼이다.");







static const u8 DexDescription_Exeggcute[] = _(
    "동료애가 강한 여섯 알은 서로\n"
    "끌어당기며 빙글빙글 회전하고 있다.\n"
    "껍질의 금이 늘어나면 진화가 가까워진 것.");

static const u8 DexDescription_Exeggutor[] = _(
    "남쪽 나라 태생인 나시의 머리는 강한\n"
    "햇빛을 잔뜩 받고 점점 자라\n"
    "땅에 떨어지면 아라리가 된다고 한다.");

static const u8 DexDescription_Cubone[] = _(
    "두 번 다시 만나지 못하는 어미의 모습을\n"
    "보름달에서 발견하고 울음소리를 낸다.\n"
    "뒤집어쓰고 있는 뼈의 얼룩은 눈물 자국이다.");

static const u8 DexDescription_Marowak[] = _(
    "어미를 만날 수 없는 슬픔을 극복한\n"
    "탕구리가 늠름하게 진화한 모습이다.\n"
    "단련된 마음은 간단히 꺾이지 않는다.");

static const u8 DexDescription_Hitmonlee[] = _(
    "자유롭게 신축되는 다리로 강렬한\n"
    "킥을 날려 상대를 발로 차 쓰러트린다.\n"
    "싸운 뒤에 지친 다리를 주물러 풀어준다.");

static const u8 DexDescription_Hitmonchan[] = _(
    "세계 챔피언을 목표했던 복서의\n"
    "혼이 깃들었다고 하는 홍수몬은\n"
    "불굴의 정신으로 절대 지쳐 쓰러지지 않는다.");

static const u8 DexDescription_Lickitung[] = _(
    "처음 본 것은 반드시 핥아본다.\n"
    "혀의 감촉과 맛으로 기억해두는 것이다.\n"
    "하지만 시큼한 것을 핥는 것은 조금 꺼린다.");


static const u8 DexDescription_Koffing[] = _(
    "음식물 쓰레기와 몸의 독소를 화학반응시켜\n"
    "맹독 가스를 만들어 낸다.\n"
    "기온이 높을수록 가스가 많이 만들어진다.");
# 795 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Weezing[] = _(
    "똑같이 생긴 몸을 교대로 오그라트리고\n"
    "부풀리면서 독가스를 섞고 있다.\n"
    "섞을수록 독소가 강해져 악취가 난다.");
# 807 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Rhyhorn[] = _(
    "달리고 있다가 목적을 잊을 정도로\n"
    "뇌가 작고 머리가 나쁘다.\n"
    "뭔가를 부수면 가끔 기억해내는 것 같다.");
# 819 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Rhydon[] = _(
    "드릴처럼 쓰는 뿔로 암석을 파괴한다.\n"
    "마그마가 뿜어져 나오기도 하지만\n"
    "갑옷 같은 피부는 뜨거움을 느끼지 않는다.");







static const u8 DexDescription_Chansey[] = _(
    "영양 만점인 알을 매일 낳는다.\n"
    "식욕을 잃은 사람도 한 번에\n"
    "먹어치울 정도로 맛있는 알이다.");

static const u8 DexDescription_Tangela[] = _(
    "적에게 붙잡히면 덩굴이 뚝 하고 끊긴다.\n"
    "전혀 아프지 않기 때문에 그 틈에 도망간다.\n"
    "다음 날에는 새로운 덩굴이 자란다.");

static const u8 DexDescription_Kangaskhan[] = _(
    "캥카의 새끼가 혼자서 놀고 있어도\n"
    "절대로 잡으려 하면 안 된다.\n"
    "가까이 있는 부모가 격렬히 화낸다.");


static const u8 DexDescription_Horsea[] = _(
    "위험을 감지하면 반사적으로 입에서\n"
    "새까만 먹물을 뿜어내고 도망간다.\n"
    "등지느러미를 능숙히 움직여 헤엄친다.");
# 858 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Seadra[] = _(
    "몸을 회전시켜 소용돌이를 만든다.\n"
    "어선도 집어삼킬 만한 격류로\n"
    "먹이를 약하게 만들고 통째로 삼킨다.");
# 870 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Goldeen[] = _(
    "강이나 연못을 헤엄치는 것을 매우 좋아해서\n"
    "수조 같은 곳에 넣어 두면 두꺼운\n"
    "유리도 뿔의 일격으로 깨고 도망간다.");
# 882 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Seaking[] = _(
    "알을 지키기 위해서 수컷과 암컷은 교대로\n"
    "서식지 주변을 헤엄쳐 다니며 순찰한다.\n"
    "알이 부화할 때까지 한 달 이상 계속된다.");
# 894 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Staryu[] = _(
    "가운데에 있는 빨간 코어를 점멸시켜\n"
    "밤하늘의 별과 교신하는 것 같다.\n"
    "몸은 찢겨 나가더라도 스스로 재생한다.");
# 906 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Starmie[] = _(
    "별 모양인 몸을 스크루처럼\n"
    "회전시켜 물속을 헤엄쳐 다닌다.\n"
    "중앙에 있는 코어가 일곱 빛깔로 빛난다.");







static const u8 DexDescription_Mrmime[] = _(
    "몸짓으로 눈에 보이지 않는 것이 그곳에\n"
    "있다고 믿게 만드는 팬터마임의 달인이다.\n"
    "있다고 믿게 만든 것은 정말로 나타난다.");

static const u8 DexDescription_Scyther[] = _(
    "눈에 보이지 않는 빠른 스피드가 양팔에\n"
    "달린 낫의 날카로움을 한층 높여준다.\n"
    "한 번 휘두르면 큰 나무도 두 동강 난다.");

static const u8 DexDescription_Jynx[] = _(
    "춤추는 듯한 자세로 리드미컬하게 걷는다.\n"
    "그 움직임은 보고 있는 사람마저 얼떨결에\n"
    "허리를 흔들 정도로 경쾌하다.");

static const u8 DexDescription_Electabuzz[] = _(
    "폭풍이 오면 나무 위처럼 벼락이\n"
    "떨어질 만한 높은 장소로 앞다투어 올라간다.\n"
    "피뢰침 대용으로 삼는 마을도 있다.");

static const u8 DexDescription_Magmar[] = _(
    "싸우게 되면 몸에서 작열하는\n"
    "불꽃을 뿜어내 상대를 위협한다.\n"
    "그 열풍으로 주변의 초목도 불태운다.");


static const u8 DexDescription_Pinsir[] = _(
    "늠름한 2개의 뿔 표면에 있는\n"
    "가시가 상대의 몸에 깊숙이 파고들어서\n"
    "집히면 쉽게 벗어날 수 없다.");







static const u8 DexDescription_Tauros[] = _(
    "항상 날뛰지 않으면 성에 차지 않는다.\n"
    "싸울 상대가 없을 때는 큰 나무를\n"
    "들이받아 쓰러트리고 맘을 가라앉힌다.");


static const u8 DexDescription_Magikarp[] = _(
    "튀어오르기만으로는 만족스럽게 싸울 수 없어서\n"
    "약하다고 여겨지고 있지만 아무리 더러워진\n"
    "물에서라도 살 수 있는 끈질긴 포켓몬이다.");
# 972 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Gyarados[] = _(
    "한 번 날뛰기 시작하면 모든 것을\n"
    "불태워야 난폭한 피가 가라앉는다.\n"
    "한 달간을 날뛴 기록이 남아 있다.");







static const u8 DexDescription_Lapras[] = _(
    "사람이 멸종의 위기로 몰아갔다.\n"
    "석양이 내리면 수가 줄어든 동료를\n"
    "찾아 슬픈 목소리로 노래한다고 한다.");

static const u8 DexDescription_Ditto[] = _(
    "몸의 세포를 재구성하여 변신한다.\n"
    "전에 봤던 것을 기억해내면서 바뀌면\n"
    "조금 다른 형태가 되어버린다.");

static const u8 DexDescription_Eevee[] = _(
    "사는 환경에 따라 돌연변이하는\n"
    "불안정한 유전자를 지닌 포켓몬이다.\n"
    "돌의 방사선이 진화를 일으킨다.");

static const u8 DexDescription_Vaporeon[] = _(
    "돌연변이로 인해 물속에서 생활할 수\n"
    "있도록 지느러미와 아가미가 생겨났다.\n"
    "물을 자유로이 조종하는 힘을 지녔다.");

static const u8 DexDescription_Jolteon[] = _(
    "세포에서 나오는 약한 전기를 털의\n"
    "정전기로 증폭시켜 번개를 떨어트린다.\n"
    "곤두세운 털은 전기를 띤 바늘이다.");

static const u8 DexDescription_Flareon[] = _(
    "푹신한 털은 높이 오른 체온을\n"
    "공기 중으로 발산하여 낮추는 기능을 지녔다.\n"
    "체온은 최고 900도까지 올라간다.");

static const u8 DexDescription_Porygon[] = _(
    "전신을 프로그램 데이터로 되돌려\n"
    "전자 공간에 들어갈 수 있다.\n"
    "복사 방지가 되어 있어 복사할 수 없다.");

static const u8 DexDescription_Omanyte[] = _(
    "오랜 옛날에 멸종됐지만 인간의 손으로\n"
    "화석에서 부활시킨 포켓몬 중 하나다.\n"
    "적에게 습격당하면 단단한 껍질 속에 숨는다.");

static const u8 DexDescription_Omastar[] = _(
    "촉수를 이용하여 먹이를 잡는다.\n"
    "껍질이 너무 커진 탓에 움직임이\n"
    "둔해져서 멸종했다고 여겨지고 있다.");

static const u8 DexDescription_Kabuto[] = _(
    "화석에서 부활한 포켓몬이지만 드물게\n"
    "살아 있는 투구를 발견할 수 있다.\n"
    "그 모습은 3억 년 동안 변치 않았다.");

static const u8 DexDescription_Kabutops[] = _(
    "물속을 헤엄쳐 먹이를 잡았었다.\n"
    "물에서의 생활을 지나 땅에서 살 수 있도록\n"
    "아가미나 다리 등이 변화되기 시작했다.");

static const u8 DexDescription_Aerodactyl[] = _(
    "호박에서 추출한 유전자를 재생하여\n"
    "부활한 공룡시대의 포켓몬이다.\n"
    "하늘의 왕이었다고 상상된다.");

static const u8 DexDescription_Snorlax[] = _(
    "먹고 자는 것을 반복하다 하루가 끝난다.\n"
    "큰 배 위를 놀이터로 삼은 아이들이\n"
    "있을 정도로 얌전한 포켓몬이다.");

static const u8 DexDescription_Articuno[] = _(
    "얼음을 조종하는 전설의 새포켓몬이다.\n"
    "날갯짓하면 공기가 차갑게 식기 때문에\n"
    "프리져가 날면 눈이 온다고 전해진다.");

static const u8 DexDescription_Zapdos[] = _(
    "전기를 조종하는 전설의 새포켓몬이다.\n"
    "평상시는 번개 구름 속에서 지낸다.\n"
    "번개를 맞으면 힘이 솟아난다.");

static const u8 DexDescription_Moltres[] = _(
    "불꽃을 조종하는 전설의 새포켓몬이다.\n"
    "몸이 상처 입으면 분화구의 마그마에 들어가\n"
    "전신을 불태워 상처를 치료한다고 한다.");

static const u8 DexDescription_Dratini[] = _(
    "미뇽이 탈피를 반복하는 것은\n"
    "몸속에서 생명 에너지가 점점 부풀어\n"
    "올라 억제할 수 없게 되기 때문이다.");

static const u8 DexDescription_Dragonair[] = _(
    "큰 에너지를 몸에 모으고 있다.\n"
    "목과 꼬리의 수정에서 에너지를\n"
    "발산하여 주변 날씨를 바꾼다고 한다.");

static const u8 DexDescription_Dragonite[] = _(
    "16시간 만에 지구를 한 바퀴 돌 수 있다.\n"
    "폭풍으로 난파 직전인 배를 발견하면\n"
    "육지까지 유도하는 상냥한 포켓몬이다.");

static const u8 DexDescription_Mewtwo[] = _(
    "유전자조작을 통해 만들어진 포켓몬이다.\n"
    "인간은 과학의 힘으로 몸은 만들었지만\n"
    "상냥한 마음을 만들 수는 없었다.");

static const u8 DexDescription_Mew[] = _(
    "모든 포켓몬의 유전자를 가졌다고 한다.\n"
    "자유자재로 모습을 숨길 수 있어서\n"
    "사람에게 가까이 다가가도 절대 들키지 않는다.");

static const u8 DexDescription_Chikorita[] = _(
    "잎사귀를 휘둘러 상대를 위협하지만\n"
    "잎사귀에서 달콤한 향기가 풍겨 나와\n"
    "서로 온화한 분위기가 된다.");

static const u8 DexDescription_Bayleef[] = _(
    "목 주변의 둥그렇게 말린 잎사귀\n"
    "안에는 작은 새싹 한 개가 나 있다.\n"
    "그 향기는 사람을 기운 나게 한다.");

static const u8 DexDescription_Meganium[] = _(
    "꽃의 향기는 기분을 평안하게 만든다.\n"
    "싸울 때는 향기를 발산하여\n"
    "상대의 전의를 떨어뜨린다.");

static const u8 DexDescription_Cyndaquil[] = _(
    "등에서 불꽃을 내뿜어 몸을 지킨다.\n"
    "화났을 때의 불꽃은 기운차지만\n"
    "지쳤을 때는 불완전연소한다.");

static const u8 DexDescription_Quilava[] = _(
    "불꽃의 기세와 열풍으로 위협한다.\n"
    "재빠른 몸동작으로 상대의 공격을\n"
    "피하면서 동시에 불꽃으로 태운다.");

static const u8 DexDescription_Typhlosion[] = _(
    "작열하는 불꽃으로 주변에 아지랑이를\n"
    "만들어내서 모습을 숨길 수 있다.\n"
    "불타오르며 폭발하는 바람은 모든 것을 태운다.");

static const u8 DexDescription_Totodile[] = _(
    "몸은 작지만 턱의 힘은 강하다.\n"
    "리아코 나름은 살포시 물려고 하지만\n"
    "큰 상처를 입힐 정도의 힘이 있다.");

static const u8 DexDescription_Croconaw[] = _(
    "한 번 물고 늘어지면 절대로 놓지 않는다.\n"
    "이빨 끝이 낚싯바늘처럼 휘어져\n"
    "있어서 한 번 들어가면 빠지지 않는다.");

static const u8 DexDescription_Feraligatr[] = _(
    "큰 입을 열고 상대를 위협한다.\n"
    "강인한 뒷다리로 땅을 차고\n"
    "굉장한 스피드로 돌진해온다.");

static const u8 DexDescription_Sentret[] = _(
    "잠잘 때는 교대로 망을 본다.\n"
    "위험을 탐지하면 동료를 깨운다.\n"
    "무리에서 떨어지면 무서워서 자지 못한다.");

static const u8 DexDescription_Furret[] = _(
    "적에게 습격당해도 좁은 틈으로\n"
    "쑥 들어가서 도망갈 수 있다.\n"
    "팔다리는 짧지만 매우 날쌔다.");

static const u8 DexDescription_Hoothoot[] = _(
    "몸 안에 지구의 자전을\n"
    "감지해내는 기관을 지니고 있어서 매일\n"
    "같은 시간이 되면 울음소리를 낸다.");

static const u8 DexDescription_Noctowl[] = _(
    "약간의 빛만으로도 볼 수 있는 우수한 눈과\n"
    "날갯소리를 내지 않는 부드러운 깃털 덕분에\n"
    "어둠 속에서 먹이를 절대 놓치지 않는다.");

static const u8 DexDescription_Ledyba[] = _(
    "몸통과 다리의 연결 부위에서 나는 액체의 냄새로\n"
    "동료와 커뮤니케이션을 취하고 있다.\n"
    "냄새의 차이로 기분을 전한다고 한다.");

static const u8 DexDescription_Ledian[] = _(
    "별이 많이 보이는 공기가 깨끗한\n"
    "장소에는 레디안이 많이 산다고 한다.\n"
    "별빛을 에너지로 삼기 때문이다.");

static const u8 DexDescription_Spinarak[] = _(
    "실로 만든 함정은 제2의 신경이다.\n"
    "실에 전해지는 약간의 진동만으로\n"
    "먹이의 종류를 알 수 있다고 전해진다.");

static const u8 DexDescription_Ariados[] = _(
    "발끝에는 작은 갈고리발톱이 있어서\n"
    "천장이나 수직인 벽도 걸을 수 있다.\n"
    "가늘고 튼튼한 실로 적을 조른다.");


static const u8 DexDescription_Crobat[] = _(
    "귀를 기울이지 않으면 들리지 않을 정도로 작은\n"
    "날갯소리로 노린 먹이에게 살며시 다가간다.\n"
    "뒷다리의 날개로 가지를 붙잡고 쉰다.");
# 1186 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Chinchou[] = _(
    "강한 전기를 발생시키는 세포가\n"
    "2개의 촉수 안에 채워져 있다.\n"
    "자신도 조금은 찌릿하고 마비된다고 한다.");
# 1198 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Lanturn[] = _(
    "밤중에 배에서 어두운 바다를 들여다보면\n"
    "심해를 헤엄치는 랜턴의 빛이\n"
    "별이 총총한 하늘처럼 보이는 일이 있다.");
# 1210 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Pichu[] = _(
    "동료와 놀고 있을 때 서로의 전기가\n"
    "합선되어 불꽃이 일어나는 일이 있다.\n"
    "불꽃에 깜짝 놀라면 울기 시작한다.");







static const u8 DexDescription_Cleffa[] = _(
    "별똥별이 많은 밤에는 둥글게 모여\n"
    "춤추는 삐의 모습을 볼 수 있다.\n"
    "일출 때까지 춤추며 밤이슬로 목을 축인다.");


static const u8 DexDescription_Igglybuff[] = _(
    "마시멜로 같은 촉감의 몸에서\n"
    "은은하게 달콤한 냄새가 풍겨온다.\n"
    "냄새는 적의 기분을 차분하게 만든다.");







static const u8 DexDescription_Togepi[] = _(
    "사람이나 포켓몬이 발산하는 상냥함이나\n"
    "즐거운 마음을 에너지로 삼는다.\n"
    "껍질 안에 모은 행복을 나눈다.");

static const u8 DexDescription_Togetic[] = _(
    "행운을 가져다주는 포켓몬이라고 전해진다.\n"
    "순수한 마음을 지닌 자를 발견하면\n"
    "모습을 드러내고 행복을 나누어준다.");


static const u8 DexDescription_Natu[] = _(
    "점프력이 발달한 포켓몬이다.\n"
    "어른 키 이상의 높이인 가지에\n"
    "훌쩍 날아 앉아 나무순을 쪼아 먹는다.");
# 1261 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Xatu[] = _(
    "온종일 태양을 바라보며 움직이지 않는다.\n"
    "미래를 내다보는 힘을 지녔다고 여겨져\n"
    "성스러운 포켓몬으로 모시는 사람도 있다.");







static const u8 DexDescription_Mareep[] = _(
    "털의 마찰로 정전기가 모인다.\n"
    "전력이 많이 모일수록 꼬리\n"
    "끝에 붙은 전구가 밝게 빛난다.");

static const u8 DexDescription_Flaaffy[] = _(
    "털의 성질이 변화하기 때문에 적은\n"
    "양으로도 많은 전기를 만들어낸다.\n"
    "전기를 차단하는 반질반질한 피부를 가졌다.");

static const u8 DexDescription_Ampharos[] = _(
    "전룡의 빛은 우주에서도 보인다.\n"
    "옛날 사람은 전룡의 빛을 써서\n"
    "멀리 있는 동료와 신호를 주고받았다.");


static const u8 DexDescription_Bellossom[] = _(
    "좀 더 악취를 풍기는 냄새꼬 쪽이\n"
    "진화하면 아름다운 꽃을 피운 아르코가 된다.\n"
    "밤이 되면 꽃잎을 오므리고 잔다.");
# 1300 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Marill[] = _(
    "흐름이 빠른 강에서 먹이를 잡을 때는\n"
    "꼬리를 강가의 나무줄기에 휘감는다.\n"
    "꼬리는 탄력이 있어서 늘어나는 구조다.");
# 1312 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Azumarill[] = _(
    "공기로 풍선을 만들 수 있다.\n"
    "포켓몬이 물에 빠져 있으면 공기 방울을\n"
    "만들어내 호흡을 할 수 있게 해준다.");







static const u8 DexDescription_Sudowoodo[] = _(
    "적에게 습격당하지 않으려 나무인 척한다.\n"
    "양손이 일 년 내내 초록빛이라\n"
    "겨울에는 가짜임이 바로 들통 난다.");

static const u8 DexDescription_Politoed[] = _(
    "머리의 말린 머리칼은 왕의 징표이다.\n"
    "길고 아름답게 말린 왕구리일수록\n"
    "동료에게 존경받는다고 전해진다.");

static const u8 DexDescription_Hoppip[] = _(
    "바람을 타고 둥둥 떠다니는 포켓몬이다.\n"
    "강풍의 기척을 느끼면 동료끼리\n"
    "잎사귀를 휘감아 날아가지 않도록 준비한다.");

static const u8 DexDescription_Skiploom[] = _(
    "기온이 18도를 넘으면 꽃이 핀다.\n"
    "온도에 따라 꽃이 피는 모습이 바뀌어서\n"
    "온도계 대신 쓰기도 한다.");

static const u8 DexDescription_Jumpluff[] = _(
    "따뜻한 남풍을 타고 바다를 건너\n"
    "외국까지 날아가는 포켓몬이다.\n"
    "차가운 공기에 닿으면 땅에 내려온다.");

static const u8 DexDescription_Aipom[] = _(
    "능숙하게 움직이는 꼬리 끝을 손바닥\n"
    "대신 사용하다 보니 반대로 양손이\n"
    "둔해져 버린 포켓몬이다.");

static const u8 DexDescription_Sunkern[] = _(
    "몸에 모은 영양을 진화할 때까지\n"
    "간직하기 위해 거의 움직이려 하지 않는다.\n"
    "아무것도 먹지 않고 아침 이슬만 마시고 있다.");

static const u8 DexDescription_Sunflora[] = _(
    "태양 에너지에서 영양을 만들어낸다.\n"
    "기온이 높은 낮에는 활발하게 움직이고\n"
    "태양이 지면 뚝 하니 움직이지 않게 된다.");

static const u8 DexDescription_Yanma[] = _(
    "눈알을 움직이지 않고 360도를 볼 수 있다.\n"
    "급브레이크나 방향 전환이 특기다.\n"
    "노린 먹이를 빠르게 몰아넣는다.");

static const u8 DexDescription_Wooper[] = _(
    "평상시엔 물속에서 지내지만 먹이를\n"
    "찾거나 할 때는 가끔 지상에 나온다.\n"
    "땅에서는 독 점액으로 몸을 둘러싼다.");

static const u8 DexDescription_Quagsire[] = _(
    "물속에서 입을 열고 우연히 먹이가\n"
    "뛰어들기를 그저 기다리고 있다.\n"
    "움직이지 않기에 별로 배가 안 고프다.");

static const u8 DexDescription_Espeon[] = _(
    "인정한 트레이너에게는 극히 충실하다.\n"
    "트레이너를 위험에서 지키기 위해\n"
    "예지능력이 발달했다고 전해진다.");

static const u8 DexDescription_Umbreon[] = _(
    "달의 파동을 받아 진화한 포켓몬이다.\n"
    "어둠 속에 가만히 숨어 상대를 살핀다.\n"
    "습격할 때 몸의 둥근 무늬가 빛난다.");

static const u8 DexDescription_Murkrow[] = _(
    "불행을 가져온다고 하여 두려움의 대상이었다.\n"
    "반짝반짝 빛나는 것에 흥미를 보이며\n"
    "여성의 반지를 가져가려 한다.");

static const u8 DexDescription_Slowking[] = _(
    "세계의 불가사의를 밝혀내기 위해 매일\n"
    "연구하고 있지만 머리에 있는 셀러가\n"
    "벗겨지면 전부 잊어버리는 것 같다.");

static const u8 DexDescription_Misdreavus[] = _(
    "흐느껴 우는 듯한 울음소리로 겁을 준다.\n"
    "상대의 두려워하는 마음을 빨간 구슬로\n"
    "흡수하여 영양분으로 삼는 것 같다.");

static const u8 DexDescription_Unown[] = _(
    "고대 문자를 닮은 모습의 포켓몬이다.\n"
    "먼저 생겨난 것은 문자인가 안농인가.\n"
    "연구 중이지만 아직도 수수께끼다.");


static const u8 DexDescription_Wobbuffet[] = _(
    "한결같이 참는 포켓몬이지만 꼬리를\n"
    "공격당하는 것만은 참지 못한다.\n"
    "상대를 길동무로 만들 기회를 살핀다.");
# 1421 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Girafarig[] = _(
    "꼬리의 뇌는 생각을 할 수 없을 정도로\n"
    "작지만 자지 않아도 괜찮아서\n"
    "24시간 주변을 계속 망보고 있다.");







static const u8 DexDescription_Pineco[] = _(
    "나뭇가지에 매달려 먹이를 기다린다.\n"
    "나무가 흔들려 식사를 방해받으면\n"
    "땅으로 떨어진 후 느닷없이 폭발한다.");

static const u8 DexDescription_Forretress[] = _(
    "강철 껍질 안에 본체가 있다.\n"
    "먹이를 잡을 때 껍질이 열리지만\n"
    "너무 빨라서 안이 보이진 않는다.");

static const u8 DexDescription_Dunsparce[] = _(
    "드릴 꼬리를 사용해서 뒤쪽을 향해\n"
    "땅을 파고 들어가 복잡한 형태의\n"
    "둥지를 땅속 깊이 만드는 포켓몬이다.");

static const u8 DexDescription_Gligar[] = _(
    "소리 내지 않고 미끄러지듯 활공한다.\n"
    "양손의 커다란 손톱과 발의 발톱으로\n"
    "먹이의 얼굴에 달라붙어 독침을 찌른다.");

static const u8 DexDescription_Steelix[] = _(
    "롱스톤보다 깊은 땅속에 살고 있다.\n"
    "지구의 중심을 향해 파고들어 가서\n"
    "깊이가 1km에 달하기도 한다.");

static const u8 DexDescription_Snubbull[] = _(
    "이빨을 드러내고 무서운 얼굴을 하면\n"
    "작은 포켓몬은 겁을 먹고 도망친다.\n"
    "남겨진 블루는 조금 외로워 보인다.");

static const u8 DexDescription_Granbull[] = _(
    "아래턱이 매우 발달한 포켓몬이다.\n"
    "이빨이 무거워서 목을 기울이고 있다.\n"
    "놀라게 하지 않으면 무턱대고 물지 않는다.");

static const u8 DexDescription_Qwilfish[] = _(
    "들이마신 물의 힘을 이용하여\n"
    "전신의 독침을 일제히 쏘아댄다.\n"
    "헤엄치는 것이 조금 서툰 포켓몬이다.");

static const u8 DexDescription_Scizor[] = _(
    "강철의 강도를 지닌 몸은 어지간한\n"
    "공격으로는 꿈쩍도 하지 않는다.\n"
    "날갯짓으로 체온을 조절한다.");

static const u8 DexDescription_Shuckle[] = _(
    "바위 밑에서 껍질 안에 비축해둔\n"
    "나무열매를 먹으면서 몸을 숨기고 있다.\n"
    "나무열매는 체액과 섞여 주스가 된다.");


static const u8 DexDescription_Heracross[] = _(
    "손발의 날카로운 손발톱이 땅이나 나무에\n"
    "깊숙이 박히기 때문에 자랑스런 뿔로 상대를\n"
    "내던질 때 단단히 버틸 수 있다.");







static const u8 DexDescription_Sneasel[] = _(
    "손발의 갈고리 손발톱을 꽂아 나무를 오른다.\n"
    "부모가 없는 틈을 노려 나무 위에\n"
    "있는 둥지에서 알을 훔쳐 먹는다.");

static const u8 DexDescription_Teddiursa[] = _(
    "꿀이 밴 손바닥을 핥고 있다.\n"
    "깜지곰의 꿀은 과일과 독침붕이\n"
    "모은 꽃가루가 혼합되어 만들어진다.");

static const u8 DexDescription_Ursaring[] = _(
    "숲 속에는 링곰이 먹이를 수집하는\n"
    "큰 나무나 시냇가가 여기저기에 있다고 한다.\n"
    "매일 먹이를 모으며 숲을 걷는다.");


static const u8 DexDescription_Slugma[] = _(
    "몸 안에는 혈액 대신\n"
    "필요한 영양과 산소를 운반하기 위해\n"
    "작열하는 마그마가 순환되고 있다.");
# 1522 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Magcargo[] = _(
    "체온이 약 1만 도나 돼서 빗방울이\n"
    "몸에 닿으면 수증기가 자욱하게 피어나\n"
    "주변이 깊은 안개에 둘러싸인다고 한다.");







static const u8 DexDescription_Swinub[] = _(
    "땅에 코를 비비며 먹이를 찾는다.\n"
    "마른 풀 밑에 난 버섯을 좋아한다.\n"
    "가끔 온천을 파내기도 한다.");

static const u8 DexDescription_Piloswine[] = _(
    "얼어붙는 추위에도 버틸 수 있도록\n"
    "두껍고 긴 털가죽에 덮여 있다.\n"
    "얼음에 묻힌 먹이를 이빨로 파낸다.");


static const u8 DexDescription_Corsola[] = _(
    "따뜻한 바다에 모인 코산호는\n"
    "작은 포켓몬들의 은신처가 된다.\n"
    "수온이 낮아지면 남쪽으로 이동한다.");







static const u8 DexDescription_Remoraid[] = _(
    "복근을 이용하여 마신 물을 힘차게\n"
    "뿜어내서 하늘을 나는 먹이를 잡는다.\n"
    "진화가 가까워지면 강을 따라 내려간다.");

static const u8 DexDescription_Octillery[] = _(
    "흡반이 달린 팔로 상대를 휘감는다.\n"
    "움직이지 못하게 되면 쓰러트린다.\n"
    "버거울 때는 먹물을 뿜고 도망간다.");

static const u8 DexDescription_Delibird[] = _(
    "꼬리로 먹이를 둘러싸서 나르는 포켓몬이다.\n"
    "딜리버드가 나눠준 먹이 덕분에\n"
    "에베레스트 산을 등정한 모험가가 있었다.");

static const u8 DexDescription_Mantine[] = _(
    "맑은 날에는 바다 위를 우아하게 뛰어오르는\n"
    "만타인 무리를 볼 수 있다.\n"
    "총어가 들러붙어 있어도 신경 쓰지 않는다.");


static const u8 DexDescription_Skarmory[] = _(
    "싸움을 반복하여 너덜너덜해진\n"
    "강철의 날개는 1년에 1회 다시 돋아나\n"
    "원래의 날카로움을 되찾는다.");







static const u8 DexDescription_Houndour[] = _(
    "여러 가지 울음소리를 사용하여 동료와\n"
    "연락을 주고받아 먹이를 몰아간다.\n"
    "팀워크는 포켓몬 중 제일이다.");

static const u8 DexDescription_Houndoom[] = _(
    "머리의 뿔이 크게 뒤로 꺾여 있는\n"
    "헬가가 그룹의 리더 격인 존재다.\n"
    "동료 간에 경쟁하여 리더가 결정된다.");


static const u8 DexDescription_Kingdra[] = _(
    "생물이 살지 않는 해저에서 자고 있다.\n"
    "태풍이 오면 눈을 뜨고\n"
    "먹이를 찾으러 돌아다닌다고 전해진다.");
# 1610 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Phanpy[] = _(
    "긴 코를 써서 물을 끼얹는다.\n"
    "동료가 모여들면 서로 물을 끼얹는다.\n"
    "흠뻑 젖은 몸을 물가에서 말린다.");
# 1622 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Donphan[] = _(
    "단단한 몸으로 부딪치면 집도 부서진다.\n"
    "그 힘을 이용해 산길을 막고 있는\n"
    "토사를 치우는 일을 돕는다.");







static const u8 DexDescription_Porygon2[] = _(
    "인간이 과학의 힘으로 만들어냈다.\n"
    "인공 지능을 지니고 있어서 새로운\n"
    "동작이나 감정을 혼자서 익혀간다.");

static const u8 DexDescription_Stantler[] = _(
    "멋지게 생긴 뿔은 미술품으로\n"
    "비싸게 팔리기 때문에 멸종 직전까지\n"
    "남획됐었던 포켓몬이다.");

static const u8 DexDescription_Smeargle[] = _(
    "꼬리 끝에서 배어 나오는 체액으로\n"
    "영역 주변에 자신의 마크를 그린다.\n"
    "5000종의 마크가 발견됐다.");

static const u8 DexDescription_Tyrogue[] = _(
    "매일 트레이닝하지 않으면 스트레스가\n"
    "쌓이기 때문에 트레이너는 키울 때\n"
    "스케줄 관리에 여러모로 고민해야 한다.");

static const u8 DexDescription_Hitmontop[] = _(
    "고속 회전하며 날리는 킥은\n"
    "공격과 방어를 겸비한 훌륭한 기술이다.\n"
    "걷는 것보다 회전하는 편이 빠르다.");

static const u8 DexDescription_Smoochum[] = _(
    "기운차게 돌아다니지만 자주 넘어진다.\n"
    "벌떡 일어나서는 호수의 수면에 얼굴을\n"
    "비추고 더러워지지 않았는지 살핀다.");

static const u8 DexDescription_Elekid[] = _(
    "금속을 만져서 몸에 모은 전기가\n"
    "방전돼버리면 양손을 빙글빙글\n"
    "돌려서 다시 전기를 모은다.");

static const u8 DexDescription_Magby[] = _(
    "노란색 불꽃이 입에서 뿜어져 나오는 것은\n"
    "건강하다는 증거이지만 지쳐 있을 때는\n"
    "검은 연기가 섞이게 된다.");

static const u8 DexDescription_Miltank[] = _(
    "매일 20리터의 우유가 나온다.\n"
    "달콤한 우유는 어른도 아이도 매우 좋아한다.\n"
    "싫어하는 사람은 요구르트로 만들어 먹는다.");

static const u8 DexDescription_Blissey[] = _(
    "푹신푹신한 털로 슬퍼하는 마음을\n"
    "감지하면 아무리 멀어도 바로 달려가서\n"
    "미소 짓게 되는 행복의알을 나눠준다.");

static const u8 DexDescription_Raikou[] = _(
    "번개의 스피드가 깃들어 있는 포켓몬이다.\n"
    "그 울음소리는 번개가 내리쳤을 때처럼\n"
    "공기를 떨리게 하며 대지를 흔든다.");

static const u8 DexDescription_Entei[] = _(
    "마그마의 정열이 깃들어 있는 포켓몬이다.\n"
    "화산 분화 속에서 태어났다고 여겨지며\n"
    "모든 것을 태워버리는 불꽃을 뿜어 올린다.");

static const u8 DexDescription_Suicune[] = _(
    "솟아나는 물의 부드러움이 깃들어 있는\n"
    "포켓몬이다. 흐르는 듯한 몸놀림으로 대지를 달려\n"
    "탁해진 물을 맑게 하는 힘을 지녔다.");

static const u8 DexDescription_Larvitar[] = _(
    "땅속 깊은 곳에서 태어나는 애버라스는\n"
    "흙을 먹어치우고 지상에 나오지 않으면\n"
    "부모의 얼굴을 볼 수가 없다.");

static const u8 DexDescription_Pupitar[] = _(
    "체내에서 만들어낸 가스를 압축하여\n"
    "기운차게 분사해서 날아간다.\n"
    "강철에 부딪혀도 멀쩡한 몸이다.");

static const u8 DexDescription_Tyranitar[] = _(
    "자신의 거처를 만들기 위해 산 하나를\n"
    "부숴버릴 정도로 강한 파워를 지녔다.\n"
    "싸울 상대를 찾아 산을 떠돈다.");

static const u8 DexDescription_Lugia[] = _(
    "가벼운 날갯짓만으로도 민가를\n"
    "날려버릴 만한 파괴력을 지니고 있어서\n"
    "해저에서 사람들 몰래 살게 됐다.");

static const u8 DexDescription_HoOh[] = _(
    "빛이 닿는 각도에 따라 일곱 빛깔로\n"
    "반짝이는 깃털은 행복을 가져다준다고 한다.\n"
    "무지개 끝에 산다고 전해진다.");

static const u8 DexDescription_Celebi[] = _(
    "시간을 넘어 미래에서 찾아온 포켓몬이다.\n"
    "세레비가 모습을 나타내는 한 밝은\n"
    "미래가 기다린다고 여겨지고 있다.");


static const u8 DexDescription_Treecko[] = _(
    "침착 냉정 어떤 일에도 동요하지 않는다.\n"
 "체격이 큰 포켓몬이 노려봐도\n"
 "한 발짝도 물러서지 않고 같이 노려본다.");
# 1741 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Grovyle[] = _(
    "가지에서 가지로 가볍게 뛰어다닌다.\n"
    "아무리 빠른 포켓몬도 숲 속에서\n"
    "나무돌이를 잡기란 불가능하다.");
# 1753 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Sceptile[] = _(
    "등의 씨앗에는 나무를 건강하게 만드는\n"
    "영양이 많이 채워져 있다고 전해진다.\n"
    "숲의 나무를 소중히 키우고 있는 포켓몬이다.");
# 1765 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Torchic[] = _(
    "체내에 불꽃을 태우는 곳이 있어서\n"
    "껴안으면 따끈따끈 정말 따뜻하다.\n"
    "전신이 푹신푹신한 깃털로 덮여 있다.");
# 1777 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Combusken[] = _(
    "부리에서 토해 내는 작열하는 불꽃과\n"
    "뛰어난 파괴력의 킥으로 싸운다.\n"
    "울음소리가 커서 무척 시끄럽다.");
# 1789 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Blaziken[] = _(
    "강인한 하반신을 지녀 30층짜리\n"
    "빌딩도 가볍게 뛰어넘을 수 있다.\n"
    "불꽃의 펀치로 상대를 새까맣게 태운다.");
# 1801 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Mudkip[] = _(
    "물속에서는 뺨의 아가미로 호흡한다.\n"
    "위급해지면 몸보다 큰 바위를\n"
    "산산이 부숴버리는 파워를 발휘한다.");
# 1813 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Marshtomp[] = _(
    "물속을 헤엄치는 것보다 진흙 속에서\n"
    "이동하는 편이 훨씬 빠르게 이동할 수 있다.\n"
    "하반신이 발달하여 두 다리로 걷는다.");
# 1825 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Swampert[] = _(
    "대짱이는 파도 소리나 바닷바람의 아주 작은\n"
    "차이를 지느러미로 감지해 태풍을 예감한다.\n"
    "태풍이 불면 바위를 쌓아서 둥지를 지킨다.");
# 1837 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Poochyena[] = _(
    "무엇이든 먹는 잡식성인 포켓몬이다.\n"
    "몸에 비해 큰 이빨이 특징이다.\n"
    "꼬리의 털을 세우고 적을 위협한다.");
# 1849 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Mightyena[] = _(
    "그룹으로 행동하던 야생의 피가\n"
    "남아 있어서 우수한 트레이너만을\n"
    "리더로서 인정하고 명령을 따른다.");
# 1861 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Zigzagoon[] = _(
    "등의 뻣뻣한 털을 나무에 문질러서\n"
    "자신의 영역이란 표시를 해둔다.\n"
    "죽은 척하며 적의 눈을 속인다.");
# 1873 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Linoone[] = _(
    "먹이를 쫓아 일직선으로 질주한다.\n"
    "시속 100km를 넘는 스피드를 내지만\n"
    "한 번 급정지하지 않으면 꺾을 수 없다.");
# 1885 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Wurmple[] = _(
    "먹이로 삼으려고 다가온 스왈로에게\n"
    "엉덩이의 가시를 들이밀고 저항한다.\n"
    "배어 나온 독으로 상대를 약하게 만든다.");
# 1897 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Silcoon[] = _(
    "진화할 때까지 아무것도 먹지 않고 참는 것\n"
    "으로 여겨져 왔으나 아무래도 실에 맺힌\n"
    "빗방울로 갈증을 푸는 것 같다.");
# 1909 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Beautifly[] = _(
    "둥글게 말린 바늘같이 생긴 긴 입은\n"
    "꽃가루를 모을 때 매우 편리하다.\n"
    "봄바람을 타고 꽃가루를 모으러 돌아다닌다.");
# 1921 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Cascoon[] = _(
    "움직이면 튼튼한 몸으로 진화할 수 없어서\n"
    "아무리 괴롭혀도 가만히 있는다.\n"
    "그때 느낀 아픔을 계속 잊지 않는다.");
# 1933 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Dustox[] = _(
    "날갯짓하면 미세한 가루가 날린다.\n"
    "들이마시면 프로레슬러도 잠드는 맹독이다.\n"
    "더듬이의 레이더로 먹이를 찾는다.");
# 1945 "src/pokemon/../data/pokedex_entries.h"
 static const u8 DexDescription_Lotad[] = _(
    "원래는 지상에서 생활했으나\n"
    "머리의 잎사귀가 무거워져서 물에\n"
    "떠서 생활하게 됐다고 전해진다.");
# 1957 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Lombre[] = _(
    "몸 전체가 미끈미끈한 점액으로 덮여 있어\n"
    "서 그 손에 닿으면 매우 기분 나쁘다.\n"
    "곧잘 인간의 아이로 오인된다.");
# 1969 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Ludicolo[] = _(
    "명랑한 리듬을 들으면 몸의 세포가\n"
    "활발하게 활동하기 시작하는 체질이다.\n"
    "싸움에서도 굉장한 파워를 발휘한다.");
# 1981 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Seedot[] = _(
    "가지에 매달린 모습이 나무열매 같다.\n"
    "갑자기 움직여서 포켓몬을 놀라게 한다.\n"
    "하루에 한 번 잎사귀로 몸을 닦는다.");
# 1993 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Nuzleaf[] = _(
    "머리의 잎사귀를 뽑아 풀피리를 만든다.\n"
    "잎새코가 연주하는 풀피리의 음색은\n"
    "숲에서 길을 잃은 사람을 불안하게 한다.");
# 2005 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Shiftry[] = _(
    "큰 부채는 풍속 30m의 강풍을\n"
    "일으켜 무엇이든 날려버린다. 숲 속\n"
    "깊은 곳에서 조용히 사는 포켓몬이다.");
# 2017 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Taillow[] = _(
    "둥지를 떠난 지 얼마 안 돼서 밤이 되면\n"
    "쓸쓸함에 우는 일도 있다.\n"
    "숲에 사는 개무소를 잡아먹는다.");
# 2029 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Swellow[] = _(
    "윤이 나는 깃털의 손질을 게을리하지 않는다.\n"
    "스왈로 두 마리가 모이면 반드시\n"
    "서로의 깃털을 깨끗이 손질한다.");
# 2041 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Wingull[] = _(
    "바다에서 불어오는 상승기류를 타고\n"
    "가늘고 긴 날개를 펼쳐 활공한다.\n"
    "긴 부리는 먹이를 잡을 때 편리하다.");
# 2053 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Pelipper[] = _(
    "해수면을 스칠 듯이 날며 먹이를 찾는다.\n"
    "큰 부리를 바닷속에 넣고\n"
    "먹이를 퍼 올려 한입에 먹는다.");
# 2065 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Ralts[] = _(
    "사람의 감정을 감지하는 힘을 지녀서\n"
    "트레이너가 밝은 감정일 때는\n"
    "함께하며 기뻐하는 포켓몬이다.");
# 2077 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Kirlia[] = _(
    "머리의 뿔로 증폭된 사이코 파워를\n"
    "사용할 때 주변의 공간이 비틀어져\n"
    "현실에는 없는 풍경이 보인다고 한다.");
# 2089 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Gardevoir[] = _(
    "사이코 파워로 공간을 비틀어 작은\n"
    "블랙홀을 만들어내는 힘을 지녔다.\n"
    "목숨을 걸고 트레이너를 지키는 포켓몬이다.");
# 2101 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Surskit[] = _(
    "위험을 감지하면 머리끝에서\n"
    "물엿같이 달콤한 액체가 나온다.\n"
    "이것을 좋아하는 포켓몬도 있다.");
# 2113 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Masquerain[] = _(
    "화난 표정의 눈알 무늬가\n"
    "슬픈 듯이 처져 있을 때는\n"
    "소나기가 내릴 전조라고 전해진다.");
# 2125 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Shroomish[] = _(
    "위험을 느끼면 몸을 흔들어\n"
    "머리의 정수리에서 포자를 뿌린다.\n"
    "풀과 나무가 시들 정도의 맹독이다.");
# 2137 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Breloom[] = _(
    "꼬리의 씨앗은 독 포자가 굳어져\n"
    "생긴 것이라 먹으면 큰일 난다. 한 입만\n"
    "먹어도 배 속에서 부글부글 소리가 난다.");
# 2149 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Slakoth[] = _(
    "심장의 고동이 1분에 1번 뛴다.\n"
    "아무튼 가만히 누워 있는 포켓몬으로\n"
    "움직이는 모습을 거의 볼 수가 없다.");
# 2161 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Vigoroth[] = _(
    "가만히 있질 못하는 포켓몬이다.\n"
    "자려고 해도 몸의 피가 끓어올라서\n"
    "숲 속을 뛰어다니지 않으면 가라앉지 않는다.");
# 2173 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Slaking[] = _(
    "초원에 새겨진 반경 1m의\n"
    "둥근 띠 모양은 게을킹이 누운 채로\n"
    "주변의 풀을 먹어치워 생긴 것이다.");
# 2185 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Nincada[] = _(
    "날카로운 발톱으로 나무뿌리를 깎아내어\n"
    "수분이나 영양을 흡수한다.\n"
    "태양의 빛은 눈이 부셔서 싫어한다.");
# 2197 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Ninjask[] = _(
    "잘 키우지 않으면 말을 듣지 않고\n"
    "큰 소리로 계속 울어대기 때문에 트레이너의\n"
    "실력이 시험되는 포켓몬이라고 전해진다.");
# 2209 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Shedinja[] = _(
    "토중몬이 진화했을 때 어찌 된 영문인지 제멋대로\n"
    "몬스터볼에 들어 있는 포켓몬이다.\n"
    "몸을 전혀 움직이지 않으며 숨도 쉬지 않는다.");
# 2221 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Whismur[] = _(
    "한 번 큰 소리로 울기 시작하면 자신의\n"
    "목소리에 놀라 한층 더 심하게 운다.\n"
    "울음을 그치면 지쳐서 잠들어버린다.");
# 2233 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Loudred[] = _(
    "발을 동동 구르면서 큰 소리를 낸다.\n"
    "큰 소리를 낸 후에는 잠시 동안\n"
    "아무것도 듣지 못하게 되는 것이 약점이다.");
# 2245 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Exploud[] = _(
    "몸의 구멍에서 피리 같은 소리를\n"
    "내서 동료에게 기분을 전달하고 있다.\n"
    "큰 소리는 싸울 때만 낸다.");
# 2257 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Makuhita[] = _(
    "절대 포기하지 않는 근성을 지녔다.\n"
    "많이 먹고 잘 자고 운동하여\n"
    "몸 안에 에너지가 충만하다.");
# 2269 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Hariyama[] = _(
    "살이 찐 몸은 근육 덩어리다.\n"
    "힘껏 전신에 힘을 집중하면\n"
    "근육은 바위만큼 단단해진다.");
# 2281 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Azurill[] = _(
    "꼬리에는 성장을 위해 필요한\n"
    "영양이 가득 채워져 있다.\n"
    "탄력 있는 꼬리에 올라가 논다.");
# 2293 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Nosepass[] = _(
    "자석인 코를 북쪽으로 향한 채 전혀\n"
    "움직이지 않는다고 전해졌지만 1년에 1cm\n"
    "이동하는 것이 관측되었다.");
# 2305 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Skitty[] = _(
    "자신의 꼬리를 쫓아다니는 포켓몬이다.\n"
    "야생에서는 숲의 나무 구멍에서 산다.\n"
    "귀염성 있는 얼굴 때문에 애완동물로 인기가 높다.");
# 2317 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Delcatty[] = _(
    "자기 방식대로 자유로운 삶을 즐긴다.\n"
    "마음 내키는 대로 먹이를 먹고 잠을 자기\n"
    "때문에 하루의 리듬이 제각각이다.");
# 2329 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Sableye[] = _(
    "날카로운 발톱으로 땅을 파고 돌을 먹는다.\n"
    "돌에 포함된 성분은 결정이 되어\n"
    "몸의 표면에 나타난다.");
# 2341 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Mawile[] = _(
    "상대를 방심하게 하고 큰 턱으로 덥석 문다.\n"
    "귀여운 얼굴에 속아 넘어가면 위험하다.\n"
    "강철의 턱은 뿔이 변형된 것이다.");
# 2353 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Aron[] = _(
    "강철의 몸으로 힘껏 부딪치면\n"
    "큰 덤프트럭도 한 방에 엉망이 된다.\n"
    "부서진 덤프트럭을 우적우적 먹는다.");
# 2365 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Lairon[] = _(
    "돌이나 물에 포함된 철 성분을 먹는다.\n"
    "철광석이 묻힌 산에 둥지를 만들지만\n"
    "철을 캐러 오는 인간과 다투게 된다.");
# 2377 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Aggron[] = _(
    "산사태나 산불로 산이 황폐해지면\n"
    "열심히 흙을 나르고 나무 모종을 심어\n"
    "자신의 영역을 깨끗히 청소한다.");
# 2389 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Meditite[] = _(
    "명상으로 정신 에너지를 높이고 있다.\n"
    "하루에 나무열매를 한 개만 먹는다.\n"
    "별로 먹지 않는 것도 수행의 하나다.");
# 2401 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Medicham[] = _(
    "요가의 힘으로 제6의 감각이 발달하여\n"
    "사이코 파워를 다룰 수 있게 되었다.\n"
    "1개월간 아무것도 먹지 않고 명상한다.");
# 2413 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Electrike[] = _(
    "눈에 안 보이는 스피드로 달리는 포켓몬이다.\n"
    "공기의 마찰로 전기를 발생시켜\n"
    "전신의 털에 비축하고 있다.");
# 2425 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Manectric[] = _(
    "갈기에서 강한 전기를 발산하고 있다.\n"
    "공기 중의 전기를 갈기에 모아\n"
    "머리 위에 번개 구름을 만들어낸다.");
# 2437 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Plusle[] = _(
    "동료를 응원할 때는 온몸에서\n"
    "전기 불꽃을 내 타다닥 빛난다.\n"
    "동료가 지면 큰 소리로 운다. ");
# 2449 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Minun[] = _(
    "동료를 응원하는 것을 매우 좋아하는 포켓몬이다.\n"
    "동료가 질 것 같으면 몸에서 나오는\n"
    "불꽃의 수가 점점 늘어난다.");
# 2461 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Volbeat[] = _(
    "꼬리의 불빛을 사용하여 단체로\n"
    "밤하늘에 기하학적인 도형을 그린다.\n"
    "네오비트가 내는 달콤한 향기를 매우 좋아한다.");
# 2473 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Illumise[] = _(
    "볼비트를 유도하여 사인을 그린다.\n"
    "복잡한 사인을 그리는 네오비트일수록\n"
    "동료에게 존경받는다고 전해진다.");
# 2485 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Roselia[] = _(
    "아주 드물게 희귀한 색의 꽃을\n"
    "피우는 로젤리아가 있다고 전해진다.\n"
    "머리의 가시는 맹독을 지니고 있다.");
# 2497 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Gulpin[] = _(
    "몸 대부분이 위로 되어 있어\n"
    "심장이나 뇌는 매우 작다.\n"
    "무엇이든 녹이는 특수한 위액을 지녔다.");
# 2509 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Swalot[] = _(
    "이빨이 하나도 없어서 무엇이든 통째로 삼킨다.\n"
    "최대한 벌린 입은 정말 커서\n"
    "자동차 타이어마저도 쑥 들어간다.");
# 2521 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Carvanha[] = _(
    "영역을 침범하는 자는 집단으로\n"
    "덤벼들어 뾰족한 이빨로 갈가리 찢는다.\n"
    "혼자가 되면 바로 소극적인 모습을 보인다.");
# 2533 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Sharpedo[] = _(
    "바닷물을 엉덩이의 구멍으로 뿜어내서\n"
    "시속 120km로 헤엄칠 수 있다.\n"
    "장거리를 헤엄칠 수 없는 것이 약점이다.");
# 2545 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Wailmer[] = _(
    "몸에 바닷물을 저장하면 공처럼\n"
    "땅에서 튀어 오를 수 있게 된다.\n"
    "많이 저장하면 더 높이 점프할 수 있다.");
# 2557 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Wailord[] = _(
    "먹이를 몰아가기 위해서 물속부터\n"
    "점프하여 큰 물보라를 일으킨다.\n"
    "무리로 점프하는 모습은 박력이 넘친다.");
# 2569 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Numel[] = _(
    "1200도의 마그마를 몸에 저장하고 있다.\n"
    "물에 젖으면 마그마가 식어서 덩어리져\n"
    "무거워지므로 움직임이 둔해진다.");
# 2581 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Camerupt[] = _(
    "등의 혹은 뼈가 변형된 것이다.\n"
    "펄펄 끓는 마그마를 가끔 뿜어 올린다.\n"
    "화났을 때 자주 분화하는 것 같다.");
# 2593 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Torkoal[] = _(
    "석탄을 태워서 에너지를 만들어낸다.\n"
    "불의 기세가 약해지면 기운이 없어져\n"
    "싸울 때는 석탄을 많이 태운다.");
# 2605 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Spoink[] = _(
    "머리에 얹은 진주가 피그점프의\n"
    "사이코 파워를 높여주는 역할을 한다.\n"
    "항상 큰 진주를 찾고 있다.");
# 2617 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Grumpig[] = _(
    "흑진주를 이용하여 이상한 힘을\n"
    "사용할 때 기묘한 스텝으로 춤을 춘다.\n"
    "흑진주는 미술품으로서의 가치를 지녔다.");
# 2629 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Spinda[] = _(
    "똑같은 얼룩무늬는 없다고 전해진다. 항상\n"
    "어지러운 것처럼 비틀거리며 움직이는데\n"
    "이에는 상대를 혼란시키는 효과가 있다.");
# 2641 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Trapinch[] = _(
    "탈출 불가능한 구멍을 사막에 만들어\n"
    "먹이가 오는 것을 한결같이 기다리고 있다.\n"
    "물이 없어도 1주일 동안 문제없다.");
# 2653 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Vibrava[] = _(
    "비브라바의 날개는 아직 성장 중이다.\n"
    "장거리를 나는 것보다 진동시켜\n"
    "초음파를 내는 것이 특기다.");
# 2665 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Flygon[] = _(
    "날갯짓으로 일으키는 모래바람 속에서\n"
    "노랫소리 같은 날갯소리만이 들리기 때문에\n"
    "플라이곤은 사막의 정령이라고 전해졌다.");
# 2677 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Cacnea[] = _(
    "비가 적은 척박한 환경일수록\n"
    "아름답고 향기가 강한 꽃을 피운다.\n"
    "가시가 달린 팔을 휘두르며 싸운다.");
# 2689 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Cacturne[] = _(
    "한밤중에 사막을 걷는 여행자의 뒤를\n"
    "단체로 줄줄 달라붙어 걷는다.\n"
    "지쳐 움직이지 못하게 되기를 기다리고 있다.");
# 2701 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Swablu[] = _(
    "지저분한 것을 보면 솜 같은 날개로\n"
    "부지런히 닦아내는 깔끔쟁이 포켓몬이다.\n"
    "날개가 지저분해지면 강에서 물로 씻는다.");
# 2713 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Altaria[] = _(
    "아름다운 소프라노 음색으로 노래하는 포켓몬이다.\n"
    "솜구름 같은 날개로 상승기류를\n"
    "타고 넓은 하늘로 날아오른다.");
# 2725 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Zangoose[] = _(
    "평소에는 4개의 다리로 행동하지만 화나면\n"
    "뒷다리로 서서 앞발의 발톱을 내보인다.\n"
    "세비퍼와는 선조 대대로 라이벌이다.");
# 2737 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Seviper[] = _(
    "칼과 같은 꼬리는 적을 베어 가르는\n"
    "동시에 스며 나온 맹독을 끼얹는다.\n"
    "숙적인 쟝고와 계속하여 싸운다.");
# 2749 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Lunatone[] = _(
    "보름달일 때 활발해지는 습성이 있다.\n"
    "공중에 떠서 이동하며 빨간 눈동자는\n"
    "그것을 본 자를 움츠러들게 하는 박력을 지녔다.");
# 2761 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Solrock[] = _(
    "태양 광선이 파워의 원천이다.\n"
    "상대의 마음을 읽어낸다고 전해지고 있다.\n"
    "몸을 회전시켜 고열을 발산한다.");
# 2773 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Barboach[] = _(
    "몸이 미끈미끈한 막으로 덮여 있어서\n"
    "적에게 붙잡혀도 매끄럽게 도망칠 수 있다.\n"
    "미끈미끈한 막이 마르면 몸이 약해진다.");
# 2785 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Whiscash[] = _(
    "크게 난동 부리면 늪 주변 5km\n"
    "범위에 지진처럼 흔들림이 일어난다.\n"
    "진짜 지진을 예지하는 힘도 지녔다.");
# 2797 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Corphish[] = _(
    "날카로운 집게로 먹이를 잡는다.\n"
    "편식하지 않아서 뭐든지 먹는다.\n"
    "더러운 물에서도 아무렇지 않은 포켓몬이다.");
# 2809 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Crawdaunt[] = _(
    "탈피한 직후에는 껍질이 부드럽다.\n"
    "껍질이 단단해질 때까지 적의 공격을\n"
    "피하고자 강바닥의 구멍에 숨어 있다.");
# 2821 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Baltoy[] = _(
    "동료를 발견하면 바로 모여들어\n"
    "일제히 울음소리를 내기 때문에 시끄럽다.\n"
    "외다리로 능숙하게 선 채로 잔다.");
# 2833 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Claydol[] = _(
    "2만 년 전에 번창한 고대 문명의\n"
    "진흙 인형에서 태어난 수수께끼의 포켓몬이다.\n"
    "양손에서 빔을 발사한다.");
# 2845 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Lileep[] = _(
    "화석에서 재생된 고대의 포켓몬이다.\n"
    "바위에 딱 붙어 있어서 걸을 수 없다.\n"
    "두 개의 눈으로 가만히 먹이를 찾고 있다.");
# 2857 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Cradily[] = _(
    "몸이 추와 같은 역할을 해서\n"
    "바다가 거칠어져도 떠내려가는 일이 없다.\n"
    "촉수에서 강한 소화액이 나온다.");
# 2869 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Anorith[] = _(
    "포켓몬의 조상 중 하나라고 전해지고 있다.\n"
    "몸의 측면에 붙어 있는 8개의 날개를\n"
    "구부려 태고의 바다를 헤엄쳤다.");
# 2881 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Armaldo[] = _(
    "오랜 옛날 멸종된 포켓몬의 한 종류다.\n"
    "땅 위에서 살 때 편리하도록\n"
    "2개의 다리로 걸을 수 있게 됐다고 한다.");
# 2893 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Feebas[] = _(
    "몸은 엉망이지만 어디에서든 살아갈 수 있는\n"
    "끈질긴 생명력을 지닌 포켓몬이다.\n"
    "하지만 아둔해서 금방 붙잡힌다.");
# 2905 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Milotic[] = _(
    "큰 호수의 밑바닥에 살고 있다.\n"
    "몸이 선명한 핑크빛으로 반짝일 때\n"
    "피폐해진 마음을 치유하는 파동을 발산한다.");
# 2917 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Castform[] = _(
    "자연의 힘을 받아 태양과 빗방울\n"
    "그리고 설운으로 모습을 바꾸는 포켓몬이다.\n"
    "날씨가 바뀌면 기질도 바뀐다.");
# 2929 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Kecleon[] = _(
    "몸을 경치와 같은 색으로 바꿔\n"
    "먹이에게 들키지 않고 살며시 다가간다.\n"
    "길게 늘어나는 혓바닥으로 빠르게 잡는다.");
# 2941 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Shuppet[] = _(
    "사람의 마음속에 있는 원한과 질투 같은\n"
    "감정을 먹고 성장하는 포켓몬이다.\n"
    "원망하는 마음을 찾아 마을을 헤맨다.");
# 2953 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Banette[] = _(
    "버려진 인형의 솜에 저주\n"
    "에너지가 스며들어 포켓몬이 되었다.\n"
    "입을 열면 에너지가 빠져나간다.");
# 2965 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Duskull[] = _(
    "한밤중 어둠에 섞여 떠돌고 있다.\n"
    "엄마에게 꾸중을 듣는 나쁜 아이는\n"
    "해골몽이 잡아간다는 전설이 남아 있다.");
# 2977 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Dusclops[] = _(
    "아무리 큰 것도 빨아들인다.\n"
    "괴상한 손의 움직임과 외눈의 힘으로\n"
    "상대를 최면 상태로 만들어 조종한다.");
# 2989 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Tropius[] = _(
    "남쪽 나라의 아이들은 트로피우스의 목에\n"
    "난 과일 송이를 간식으로 먹는다.\n"
    "등의 잎사귀를 펄럭거려 하늘을 난다.");
# 3001 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Chimecho[] = _(
    "바람이 강해지면 나뭇가지나 처마 끝에\n"
    "머리의 흡반으로 매달려 울기 시작한다.\n"
    "긴 꼬리로 나무열매를 집어서 먹는다.");
# 3013 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Absol[] = _(
    "자연재해를 감지하는 힘을 지녔다.\n"
    "험한 산악 지대에 서식하며\n"
    "좀처럼 산기슭에는 내려오지 않는다.");
# 3025 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Wynaut[] = _(
    "달밤에 동료들과 밀어내기 놀이를 한다.\n"
    "이리저리 밀리면 인내심이 강해진다.\n"
    "강렬한 카운터를 쓰는 훈련이다.");
# 3037 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Snorunt[] = _(
    "눈이나 얼음만 먹고 생활하고 있다.\n"
    "눈꼬마가 찾아간 집은 대대로\n"
    "번창한다는 전설이 남아 있다.");
# 3049 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Glalie[] = _(
    "얼음을 자유롭게 사용하는 힘을 지녔다.\n"
    "먹이를 한순간에 얼려 움직이지\n"
    "못하게 하고 맛있게 먹는다.");
# 3061 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Spheal[] = _(
    "항상 굴러서 이동하는 포켓몬이다.\n"
    "얼음이 떠다니는 계절에는 얼음 위를\n"
    "굴러 바다를 건너는 모습을 볼 수 있다.");
# 3073 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Sealeo[] = _(
    "늘 코로 무언가를 돌리고 있다.\n"
    "돌리면서 냄새나 감촉을 확인하여\n"
    "좋아하는 것과 싫어하는 것을 구별한다.");
# 3085 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Walrein[] = _(
    "큰 이빨로 빙산을 깨트리며\n"
    "영하의 바다를 헤엄쳐 다닌다.\n"
    "두꺼운 지방이 공격을 튕겨낸다.");
# 3097 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Clamperl[] = _(
    "단단한 껍데기에 보호받으며 성장한다.\n"
    "몸이 껍데기보다 커져 버리면\n"
    "진화의 순간이 가까워진 증거다.");
# 3109 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Huntail[] = _(
    "물고기 모양 꼬리로 유인하여\n"
    "큰 입으로 먹이를 통째로 삼킨다.\n"
    "뱀처럼 몸을 구부리며 헤엄친다.");
# 3121 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Gorebyss[] = _(
    "헤엄치는 모습은 우아하고 매우 아름답지만\n"
    "먹이를 발견하면 가는 입을 몸에\n"
    "박아 넣고 체액을 후루룩 마신다.");
# 3133 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Relicanth[] = _(
    "심해 조사로 발견된 희귀종이다.\n"
    "울퉁불퉁한 바위 같은 비늘에 덮여\n"
    "해저의 수압을 견뎌내는 몸을 지녔다.");
# 3145 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Luvdisc[] = _(
    "하트 모양의 몸은 애정의 상징이다.\n"
    "사랑동이를 만난 커플에게는 영원한\n"
    "사랑이 약속된다고 전해진다.");
# 3157 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Bagon[] = _(
    "넓은 하늘을 나는 것을 꿈꾸는 포켓몬이다.\n"
    "날지 못하는 분함을 떨치기 위한 것인 양\n"
    "큰 바위에 돌머리를 부딪친다.");
# 3169 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Shelgon[] = _(
    "몸을 감싸고 있는 것은 뼈와 같은 것이다.\n"
    "매우 단단해서 적의 공격을 튕겨낸다.\n"
    "동굴에서 몸을 숨기고 진화를 기다리고 있다.");
# 3181 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Salamence[] = _(
    "꿈에 그리던 날개가 드디어 생겨났다.\n"
    "기쁜 마음을 표현하기 위해 넓은 하늘을\n"
    "날아다니며 불꽃을 내뿜으며 기뻐한다.");
# 3193 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Beldum[] = _(
    "몸에서 나오는 자력과 지구의\n"
    "자력을 반발시켜 공중에 뜬다.\n"
    "엉덩이의 발톱을 절벽에 박고 잔다.");
# 3205 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Metang[] = _(
    "두 마리의 메탕이 합체했을 때 두 개의\n"
    "뇌가 자력 신경에 의해 이어진다.\n"
    "팔을 뒤로 돌리고 고속으로 이동한다.");
# 3217 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Metagross[] = _(
    "두 마리의 메탕구가 합체한 모습이다.\n"
    "거대한 체구로 먹이를 억누르며\n"
    "배에 있는 큰 입으로 먹는다.");
# 3229 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Regirock[] = _(
    "몸을 이루고 있는 암석은 모두\n"
    "다른 땅에서 파내진 것들이라고\n"
    "최근 연구를 통해 판명됐다.");
# 3241 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Regice[] = _(
    "영하 200도의 냉기가 몸을 감쌌다.\n"
    "가까이 다가가기만 해도 얼어붙는다.\n"
    "마그마에도 녹지 않는 얼음의 몸을 지녔다.");
# 3253 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Registeel[] = _(
    "오래전 사람에게 봉인된 포켓몬이다.\n"
    "몸을 이루고 있는 금속은 지구 상에\n"
    "존재하지 않는 물질이라고 여겨진다.");
# 3265 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Latias[] = _(
    "지능이 높아 사람의 말을 이해한다.\n"
    "몸을 감싼 유리 같은 깃털로\n"
    "빛을 굴절시켜 모습을 바꾼다.");
# 3277 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Latios[] = _(
    "상냥한 마음씨를 가진 자만을 따른다.\n"
    "팔을 접으면 공기저항이 줄어\n"
    "제트기보다 빠르게 하늘을 난다.");
# 3289 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Kyogre[] = _(
    "큰 비와 큰 파도로 대지에 큰 바다를 넓힌\n"
    "포켓몬이라고 신화로 전해진다.\n"
    "그란돈과 사투 끝에 잠들었다.");
# 3301 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Groudon[] = _(
    "비바람을 날려버리는 빛과 열로\n"
 "수분을 증발시키는 힘을 가진 포켓몬.\n"
 "홍수로 고통받는 사람들을 구원했다.");
# 3313 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Rayquaza[] = _(
    "몇억 년 동안 죽지 않고 살아있다고 한다.\n"
    "구름 위에 퍼져있는 오존층 속을\n"
    "날아다녀서 아무도 발견하지 못했다.");
# 3325 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Jirachi[] = _(
    "밝고 맑은 목소리로 노래를 들려주면\n"
    "1000년의 잠에서 깨어난다.\n"
    "사람의 소원을 무엇이든 들어준다고 한다.");
# 3337 "src/pokemon/../data/pokedex_entries.h"
static const u8 DexDescription_Deoxys[] = _(
    "우주 바이러스에서 태어난 포켓몬이다.\n"
    "지능이 높고 초능력을 쓸 수 있다.\n"
    "가슴의 수정체에서 레이저를 쏜다.");







static const struct PokedexEntry gPokedexEntries[] =
{
    {
        .categoryName = _("?????"),
        .height = 0,
        .weight = 0,
        .descriptionPage1 = DexDescription_Dummy,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("씨앗"),
        .height = 7,
        .weight = 69,
        .descriptionPage1 = DexDescription_Bulbasaur,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 356,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("씨앗"),
        .height = 10,
        .weight = 130,
        .descriptionPage1 = DexDescription_Ivysaur,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 335,
        .pokemonOffset = 13,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("씨앗"),
        .height = 20,
        .weight = 1000,
        .descriptionPage1 = DexDescription_Venusaur,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 388,
        .trainerOffset = 6,
    },
    {
        .categoryName = _("도롱뇽"),
        .height = 6,
        .weight = 85,
        .descriptionPage1 = DexDescription_Charmander,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 444,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("화염"),
        .height = 11,
        .weight = 190,
        .descriptionPage1 = DexDescription_Charmeleon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 302,
        .pokemonOffset = 9,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("화염"),
        .height = 17,
        .weight = 905,
        .descriptionPage1 = DexDescription_Charizard,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 1,
        .trainerScale = 302,
        .trainerOffset = 3,
    },
    {
        .categoryName = _("꼬마거북"),
        .height = 5,
        .weight = 90,
        .descriptionPage1 = DexDescription_Squirtle,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 412,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("거북"),
        .height = 10,
        .weight = 225,
        .descriptionPage1 = DexDescription_Wartortle,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 332,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("껍질"),
        .height = 16,
        .weight = 855,
        .descriptionPage1 = DexDescription_Blastoise,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = -1,
        .trainerScale = 293,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("애벌레"),
        .height = 3,
        .weight = 29,
        .descriptionPage1 = DexDescription_Caterpie,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 549,
        .pokemonOffset = 22,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("번데기"),
        .height = 7,
        .weight = 99,
        .descriptionPage1 = DexDescription_Metapod,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 350,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("나비"),
        .height = 11,
        .weight = 320,
        .descriptionPage1 = DexDescription_Butterfree,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 312,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("송충이"),
        .height = 3,
        .weight = 32,
        .descriptionPage1 = DexDescription_Weedle,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 455,
        .pokemonOffset = 22,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("번데기"),
        .height = 6,
        .weight = 100,
        .descriptionPage1 = DexDescription_Kakuna,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 424,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("독벌"),
        .height = 10,
        .weight = 295,
        .descriptionPage1 = DexDescription_Beedrill,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 366,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("아기새"),
        .height = 3,
        .weight = 18,
        .descriptionPage1 = DexDescription_Pidgey,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 508,
        .pokemonOffset = -3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("새"),
        .height = 11,
        .weight = 300,
        .descriptionPage1 = DexDescription_Pidgeotto,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 331,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("새"),
        .height = 15,
        .weight = 395,
        .descriptionPage1 = DexDescription_Pidgeot,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 269,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("쥐"),
        .height = 3,
        .weight = 35,
        .descriptionPage1 = DexDescription_Rattata,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 481,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("쥐"),
        .height = 7,
        .weight = 185,
        .descriptionPage1 = DexDescription_Raticate,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 459,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("아기새"),
        .height = 3,
        .weight = 20,
        .descriptionPage1 = DexDescription_Spearow,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 571,
        .pokemonOffset = 22,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("부리"),
        .height = 12,
        .weight = 380,
        .descriptionPage1 = DexDescription_Fearow,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 278,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("뱀"),
        .height = 20,
        .weight = 69,
        .descriptionPage1 = DexDescription_Ekans,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 298,
        .pokemonOffset = 12,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("코브라"),
        .height = 35,
        .weight = 650,
        .descriptionPage1 = DexDescription_Arbok,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 296,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("쥐"),
        .height = 4,
        .weight = 60,
        .descriptionPage1 = DexDescription_Pikachu,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 479,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("쥐"),
        .height = 8,
        .weight = 300,
        .descriptionPage1 = DexDescription_Raichu,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 426,
        .pokemonOffset = 13,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("쥐"),
        .height = 6,
        .weight = 120,
        .descriptionPage1 = DexDescription_Sandshrew,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 365,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("쥐"),
        .height = 10,
        .weight = 295,
        .descriptionPage1 = DexDescription_Sandslash,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 341,
        .pokemonOffset = 11,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("독침"),
        .height = 4,
        .weight = 70,
        .descriptionPage1 = DexDescription_NidoranF,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 488,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("독침"),
        .height = 8,
        .weight = 200,
        .descriptionPage1 = DexDescription_Nidorina,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 381,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("드릴"),
        .height = 13,
        .weight = 600,
        .descriptionPage1 = DexDescription_Nidoqueen,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 293,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("독침"),
        .height = 5,
        .weight = 90,
        .descriptionPage1 = DexDescription_NidoranM,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 511,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("독침"),
        .height = 9,
        .weight = 195,
        .descriptionPage1 = DexDescription_Nidorino,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 408,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("드릴"),
        .height = 14,
        .weight = 620,
        .descriptionPage1 = DexDescription_Nidoking,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("요정"),
        .height = 6,
        .weight = 75,
        .descriptionPage1 = DexDescription_Clefairy,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 441,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("요정"),
        .height = 13,
        .weight = 400,
        .descriptionPage1 = DexDescription_Clefable,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("여우"),
        .height = 6,
        .weight = 99,
        .descriptionPage1 = DexDescription_Vulpix,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 542,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("여우"),
        .height = 11,
        .weight = 199,
        .descriptionPage1 = DexDescription_Ninetales,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 339,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("풍선"),
        .height = 5,
        .weight = 55,
        .descriptionPage1 = DexDescription_Jigglypuff,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 433,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("풍선"),
        .height = 10,
        .weight = 120,
        .descriptionPage1 = DexDescription_Wigglytuff,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 328,
        .pokemonOffset = 11,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("박쥐"),
        .height = 8,
        .weight = 75,
        .descriptionPage1 = DexDescription_Zubat,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 362,
        .pokemonOffset = -5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("박쥐"),
        .height = 16,
        .weight = 550,
        .descriptionPage1 = DexDescription_Golbat,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("잡초"),
        .height = 5,
        .weight = 54,
        .descriptionPage1 = DexDescription_Oddish,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 423,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("잡초"),
        .height = 8,
        .weight = 86,
        .descriptionPage1 = DexDescription_Gloom,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 329,
        .pokemonOffset = 13,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("꽃"),
        .height = 12,
        .weight = 186,
        .descriptionPage1 = DexDescription_Vileplume,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("버섯"),
        .height = 3,
        .weight = 54,
        .descriptionPage1 = DexDescription_Paras,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 593,
        .pokemonOffset = 22,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("버섯"),
        .height = 10,
        .weight = 295,
        .descriptionPage1 = DexDescription_Parasect,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 307,
        .pokemonOffset = 8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("곤충"),
        .height = 10,
        .weight = 300,
        .descriptionPage1 = DexDescription_Venonat,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 360,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = -1,
    },
    {
        .categoryName = _("독나방"),
        .height = 15,
        .weight = 125,
        .descriptionPage1 = DexDescription_Venomoth,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 285,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("두더지"),
        .height = 2,
        .weight = 8,
        .descriptionPage1 = DexDescription_Diglett,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 833,
        .pokemonOffset = 25,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("두더지"),
        .height = 7,
        .weight = 333,
        .descriptionPage1 = DexDescription_Dugtrio,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 406,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("요괴고양이"),
        .height = 4,
        .weight = 42,
        .descriptionPage1 = DexDescription_Meowth,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 480,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("샴고양이"),
        .height = 10,
        .weight = 320,
        .descriptionPage1 = DexDescription_Persian,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 320,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("오리"),
        .height = 8,
        .weight = 196,
        .descriptionPage1 = DexDescription_Psyduck,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 369,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("오리"),
        .height = 17,
        .weight = 766,
        .descriptionPage1 = DexDescription_Golduck,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 1,
        .trainerScale = 273,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("돈숭이"),
        .height = 5,
        .weight = 280,
        .descriptionPage1 = DexDescription_Mankey,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 404,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("돈숭이"),
        .height = 10,
        .weight = 320,
        .descriptionPage1 = DexDescription_Primeape,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 326,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("강아지"),
        .height = 7,
        .weight = 190,
        .descriptionPage1 = DexDescription_Growlithe,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 346,
        .pokemonOffset = 14,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("전설"),
        .height = 19,
        .weight = 1550,
        .descriptionPage1 = DexDescription_Arcanine,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 1,
        .trainerScale = 312,
        .trainerOffset = 4,
    },
    {
        .categoryName = _("올챙이"),
        .height = 6,
        .weight = 124,
        .descriptionPage1 = DexDescription_Poliwag,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 369,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("올챙이"),
        .height = 10,
        .weight = 200,
        .descriptionPage1 = DexDescription_Poliwhirl,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 288,
        .pokemonOffset = 11,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("올챙이"),
        .height = 13,
        .weight = 540,
        .descriptionPage1 = DexDescription_Poliwrath,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 6,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("초능력"),
        .height = 9,
        .weight = 195,
        .descriptionPage1 = DexDescription_Abra,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 363,
        .pokemonOffset = 14,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("초능력"),
        .height = 13,
        .weight = 565,
        .descriptionPage1 = DexDescription_Kadabra,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("초능력"),
        .height = 15,
        .weight = 480,
        .descriptionPage1 = DexDescription_Alakazam,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("괴력"),
        .height = 8,
        .weight = 195,
        .descriptionPage1 = DexDescription_Machop,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 342,
        .pokemonOffset = 14,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("괴력"),
        .height = 15,
        .weight = 705,
        .descriptionPage1 = DexDescription_Machoke,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 323,
        .pokemonOffset = 9,
        .trainerScale = 257,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("괴력"),
        .height = 16,
        .weight = 1300,
        .descriptionPage1 = DexDescription_Machamp,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 280,
        .pokemonOffset = 1,
        .trainerScale = 269,
        .trainerOffset = -1,
    },
    {
        .categoryName = _("꽃"),
        .height = 7,
        .weight = 40,
        .descriptionPage1 = DexDescription_Bellsprout,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 354,
        .pokemonOffset = 16,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("파리잡이"),
        .height = 10,
        .weight = 64,
        .descriptionPage1 = DexDescription_Weepinbell,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("파리잡이"),
        .height = 17,
        .weight = 155,
        .descriptionPage1 = DexDescription_Victreebel,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 1,
        .trainerScale = 312,
        .trainerOffset = 3,
    },
    {
        .categoryName = _("해파리"),
        .height = 9,
        .weight = 455,
        .descriptionPage1 = DexDescription_Tentacool,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("해파리"),
        .height = 16,
        .weight = 550,
        .descriptionPage1 = DexDescription_Tentacruel,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 312,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("암석"),
        .height = 4,
        .weight = 200,
        .descriptionPage1 = DexDescription_Geodude,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 347,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("암석"),
        .height = 10,
        .weight = 1050,
        .descriptionPage1 = DexDescription_Graveler,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("메가톤"),
        .height = 14,
        .weight = 3000,
        .descriptionPage1 = DexDescription_Golem,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 296,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("불의말"),
        .height = 10,
        .weight = 300,
        .descriptionPage1 = DexDescription_Ponyta,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 283,
        .pokemonOffset = 8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("불의말"),
        .height = 17,
        .weight = 950,
        .descriptionPage1 = DexDescription_Rapidash,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 289,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("얼간이"),
        .height = 12,
        .weight = 360,
        .descriptionPage1 = DexDescription_Slowpoke,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("기생"),
        .height = 16,
        .weight = 785,
        .descriptionPage1 = DexDescription_Slowbro,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 6,
        .trainerScale = 296,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("자석"),
        .height = 3,
        .weight = 60,
        .descriptionPage1 = DexDescription_Magnemite,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 288,
        .pokemonOffset = -9,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("자석"),
        .height = 10,
        .weight = 600,
        .descriptionPage1 = DexDescription_Magneton,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 292,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("천둥오리"),
        .height = 8,
        .weight = 150,
        .descriptionPage1 = DexDescription_Farfetchd,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 330,
        .pokemonOffset = 2,
        .trainerScale = 293,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("쌍둥이새"),
        .height = 14,
        .weight = 392,
        .descriptionPage1 = DexDescription_Doduo,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 257,
        .trainerOffset = -1,
    },
    {
        .categoryName = _("세쌍둥이새"),
        .height = 18,
        .weight = 852,
        .descriptionPage1 = DexDescription_Dodrio,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 268,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("강치"),
        .height = 11,
        .weight = 900,
        .descriptionPage1 = DexDescription_Seel,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 297,
        .pokemonOffset = 8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("강치"),
        .height = 17,
        .weight = 1200,
        .descriptionPage1 = DexDescription_Dewgong,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 275,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("진흙"),
        .height = 9,
        .weight = 300,
        .descriptionPage1 = DexDescription_Grimer,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 258,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("진흙"),
        .height = 12,
        .weight = 300,
        .descriptionPage1 = DexDescription_Muk,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("두조개"),
        .height = 3,
        .weight = 40,
        .descriptionPage1 = DexDescription_Shellder,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 675,
        .pokemonOffset = 24,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("두조개"),
        .height = 15,
        .weight = 1325,
        .descriptionPage1 = DexDescription_Cloyster,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 269,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("가스"),
        .height = 13,
        .weight = 1,
        .descriptionPage1 = DexDescription_Gastly,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("가스"),
        .height = 16,
        .weight = 1,
        .descriptionPage1 = DexDescription_Haunter,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 293,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("그림자"),
        .height = 15,
        .weight = 405,
        .descriptionPage1 = DexDescription_Gengar,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 302,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("돌뱀"),
        .height = 88,
        .weight = 2100,
        .descriptionPage1 = DexDescription_Onix,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 1,
        .trainerScale = 515,
        .trainerOffset = 14,
    },
    {
        .categoryName = _("최면"),
        .height = 10,
        .weight = 324,
        .descriptionPage1 = DexDescription_Drowzee,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 274,
        .pokemonOffset = 6,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("최면"),
        .height = 16,
        .weight = 756,
        .descriptionPage1 = DexDescription_Hypno,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 257,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("게"),
        .height = 4,
        .weight = 65,
        .descriptionPage1 = DexDescription_Krabby,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 469,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("집게"),
        .height = 13,
        .weight = 600,
        .descriptionPage1 = DexDescription_Kingler,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("볼"),
        .height = 5,
        .weight = 104,
        .descriptionPage1 = DexDescription_Voltorb,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 364,
        .pokemonOffset = -8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("볼"),
        .height = 12,
        .weight = 666,
        .descriptionPage1 = DexDescription_Electrode,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("알"),
        .height = 4,
        .weight = 25,
        .descriptionPage1 = DexDescription_Exeggcute,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 489,
        .pokemonOffset = -4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("야자열매"),
        .height = 20,
        .weight = 1200,
        .descriptionPage1 = DexDescription_Exeggutor,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 309,
        .trainerOffset = 5,
    },
    {
        .categoryName = _("고독"),
        .height = 4,
        .weight = 65,
        .descriptionPage1 = DexDescription_Cubone,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 545,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("뼈다귀"),
        .height = 10,
        .weight = 450,
        .descriptionPage1 = DexDescription_Marowak,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 293,
        .pokemonOffset = 12,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("킥"),
        .height = 15,
        .weight = 498,
        .descriptionPage1 = DexDescription_Hitmonlee,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 259,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("펀치"),
        .height = 14,
        .weight = 502,
        .descriptionPage1 = DexDescription_Hitmonchan,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 277,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("핥기"),
        .height = 12,
        .weight = 655,
        .descriptionPage1 = DexDescription_Lickitung,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("독가스"),
        .height = 6,
        .weight = 10,
        .descriptionPage1 = DexDescription_Koffing,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 369,
        .pokemonOffset = -1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("독가스"),
        .height = 12,
        .weight = 95,
        .descriptionPage1 = DexDescription_Weezing,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 305,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("뿔"),
        .height = 10,
        .weight = 1150,
        .descriptionPage1 = DexDescription_Rhyhorn,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 267,
        .pokemonOffset = 6,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("드릴"),
        .height = 19,
        .weight = 1200,
        .descriptionPage1 = DexDescription_Rhydon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 1,
        .trainerScale = 299,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("알"),
        .height = 11,
        .weight = 346,
        .descriptionPage1 = DexDescription_Chansey,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 257,
        .pokemonOffset = 7,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("넝쿨"),
        .height = 10,
        .weight = 350,
        .descriptionPage1 = DexDescription_Tangela,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 304,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("가족"),
        .height = 22,
        .weight = 800,
        .descriptionPage1 = DexDescription_Kangaskhan,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 387,
        .trainerOffset = 8,
    },
    {
        .categoryName = _("드래곤"),
        .height = 4,
        .weight = 80,
        .descriptionPage1 = DexDescription_Horsea,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 399,
        .pokemonOffset = -1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("드래곤"),
        .height = 12,
        .weight = 250,
        .descriptionPage1 = DexDescription_Seadra,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 299,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("금붕어"),
        .height = 6,
        .weight = 150,
        .descriptionPage1 = DexDescription_Goldeen,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 379,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("금붕어"),
        .height = 13,
        .weight = 390,
        .descriptionPage1 = DexDescription_Seaking,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("별"),
        .height = 8,
        .weight = 345,
        .descriptionPage1 = DexDescription_Staryu,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 326,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("수수께끼"),
        .height = 11,
        .weight = 800,
        .descriptionPage1 = DexDescription_Starmie,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 301,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("배리어"),
        .height = 13,
        .weight = 545,
        .descriptionPage1 = DexDescription_Mrmime,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 258,
        .pokemonOffset = 6,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("버마재비"),
        .height = 15,
        .weight = 560,
        .descriptionPage1 = DexDescription_Scyther,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 1,
        .trainerScale = 293,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("인간형태"),
        .height = 14,
        .weight = 406,
        .descriptionPage1 = DexDescription_Jynx,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 300,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("전기"),
        .height = 11,
        .weight = 300,
        .descriptionPage1 = DexDescription_Electabuzz,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 351,
        .pokemonOffset = 8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("불뿜기"),
        .height = 13,
        .weight = 445,
        .descriptionPage1 = DexDescription_Magmar,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 277,
        .pokemonOffset = 5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("뿔집게"),
        .height = 15,
        .weight = 550,
        .descriptionPage1 = DexDescription_Pinsir,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 257,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("성난소"),
        .height = 14,
        .weight = 884,
        .descriptionPage1 = DexDescription_Tauros,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("물고기"),
        .height = 9,
        .weight = 100,
        .descriptionPage1 = DexDescription_Magikarp,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 310,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("흉악"),
        .height = 65,
        .weight = 2350,
        .descriptionPage1 = DexDescription_Gyarados,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 6,
        .trainerScale = 481,
        .trainerOffset = 13,
    },
    {
        .categoryName = _("탈것"),
        .height = 25,
        .weight = 2200,
        .descriptionPage1 = DexDescription_Lapras,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 257,
        .pokemonOffset = 10,
        .trainerScale = 423,
        .trainerOffset = 8,
    },
    {
        .categoryName = _("변신"),
        .height = 3,
        .weight = 40,
        .descriptionPage1 = DexDescription_Ditto,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 633,
        .pokemonOffset = 23,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("진화"),
        .height = 3,
        .weight = 65,
        .descriptionPage1 = DexDescription_Eevee,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 476,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("거품뿜기"),
        .height = 10,
        .weight = 290,
        .descriptionPage1 = DexDescription_Vaporeon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 316,
        .pokemonOffset = 8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("번개"),
        .height = 8,
        .weight = 245,
        .descriptionPage1 = DexDescription_Jolteon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 283,
        .pokemonOffset = 8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("불꽃"),
        .height = 9,
        .weight = 250,
        .descriptionPage1 = DexDescription_Flareon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 306,
        .pokemonOffset = 12,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("가상"),
        .height = 8,
        .weight = 365,
        .descriptionPage1 = DexDescription_Porygon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 328,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("소용돌이"),
        .height = 4,
        .weight = 75,
        .descriptionPage1 = DexDescription_Omanyte,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 521,
        .pokemonOffset = 22,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("소용돌이"),
        .height = 10,
        .weight = 350,
        .descriptionPage1 = DexDescription_Omastar,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 307,
        .pokemonOffset = 7,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("껍질"),
        .height = 5,
        .weight = 115,
        .descriptionPage1 = DexDescription_Kabuto,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 454,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("껍질"),
        .height = 13,
        .weight = 405,
        .descriptionPage1 = DexDescription_Kabutops,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 271,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("화석"),
        .height = 18,
        .weight = 590,
        .descriptionPage1 = DexDescription_Aerodactyl,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 302,
        .trainerOffset = 4,
    },
    {
        .categoryName = _("졸음"),
        .height = 21,
        .weight = 4600,
        .descriptionPage1 = DexDescription_Snorlax,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 4,
        .trainerScale = 423,
        .trainerOffset = 11,
    },
    {
        .categoryName = _("냉동"),
        .height = 17,
        .weight = 554,
        .descriptionPage1 = DexDescription_Articuno,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 309,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("전기"),
        .height = 16,
        .weight = 526,
        .descriptionPage1 = DexDescription_Zapdos,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 318,
        .trainerOffset = 3,
    },
    {
        .categoryName = _("화염"),
        .height = 20,
        .weight = 600,
        .descriptionPage1 = DexDescription_Moltres,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 270,
        .pokemonOffset = 0,
        .trainerScale = 387,
        .trainerOffset = 8,
    },
    {
        .categoryName = _("드래곤"),
        .height = 18,
        .weight = 33,
        .descriptionPage1 = DexDescription_Dratini,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 8,
        .trainerScale = 386,
        .trainerOffset = 6,
    },
    {
        .categoryName = _("드래곤"),
        .height = 40,
        .weight = 165,
        .descriptionPage1 = DexDescription_Dragonair,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 411,
        .trainerOffset = 5,
    },
    {
        .categoryName = _("드래곤"),
        .height = 22,
        .weight = 2100,
        .descriptionPage1 = DexDescription_Dragonite,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 309,
        .trainerOffset = 4,
    },
    {
        .categoryName = _("유전"),
        .height = 20,
        .weight = 1220,
        .descriptionPage1 = DexDescription_Mewtwo,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 309,
        .trainerOffset = 4,
    },
    {
        .categoryName = _("신종"),
        .height = 4,
        .weight = 40,
        .descriptionPage1 = DexDescription_Mew,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 457,
        .pokemonOffset = -2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("잎사귀"),
        .height = 9,
        .weight = 64,
        .descriptionPage1 = DexDescription_Chikorita,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 512,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("잎사귀"),
        .height = 12,
        .weight = 158,
        .descriptionPage1 = DexDescription_Bayleef,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 296,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("허브"),
        .height = 18,
        .weight = 1005,
        .descriptionPage1 = DexDescription_Meganium,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 277,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("불쥐"),
        .height = 5,
        .weight = 79,
        .descriptionPage1 = DexDescription_Cyndaquil,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 539,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("화산"),
        .height = 9,
        .weight = 190,
        .descriptionPage1 = DexDescription_Quilava,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 329,
        .pokemonOffset = 11,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("화산"),
        .height = 17,
        .weight = 795,
        .descriptionPage1 = DexDescription_Typhlosion,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 268,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("큰턱"),
        .height = 6,
        .weight = 95,
        .descriptionPage1 = DexDescription_Totodile,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 487,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("큰턱"),
        .height = 11,
        .weight = 250,
        .descriptionPage1 = DexDescription_Croconaw,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 378,
        .pokemonOffset = 13,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("큰턱"),
        .height = 23,
        .weight = 888,
        .descriptionPage1 = DexDescription_Feraligatr,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 342,
        .trainerOffset = 7,
    },
    {
        .categoryName = _("망보기"),
        .height = 8,
        .weight = 60,
        .descriptionPage1 = DexDescription_Sentret,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 439,
        .pokemonOffset = 12,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("긴몸통"),
        .height = 18,
        .weight = 325,
        .descriptionPage1 = DexDescription_Furret,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 346,
        .pokemonOffset = 11,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("부엉이"),
        .height = 7,
        .weight = 212,
        .descriptionPage1 = DexDescription_Hoothoot,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 380,
        .pokemonOffset = -2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("부엉이"),
        .height = 16,
        .weight = 408,
        .descriptionPage1 = DexDescription_Noctowl,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 278,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("별다섯"),
        .height = 10,
        .weight = 108,
        .descriptionPage1 = DexDescription_Ledyba,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("별다섯"),
        .height = 14,
        .weight = 356,
        .descriptionPage1 = DexDescription_Ledian,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("실뿜기"),
        .height = 5,
        .weight = 85,
        .descriptionPage1 = DexDescription_Spinarak,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 414,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("롱다리"),
        .height = 11,
        .weight = 335,
        .descriptionPage1 = DexDescription_Ariados,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 316,
        .pokemonOffset = 8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("박쥐"),
        .height = 18,
        .weight = 750,
        .descriptionPage1 = DexDescription_Crobat,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 281,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("아귀"),
        .height = 5,
        .weight = 120,
        .descriptionPage1 = DexDescription_Chinchou,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 424,
        .pokemonOffset = -2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("라이트"),
        .height = 12,
        .weight = 225,
        .descriptionPage1 = DexDescription_Lanturn,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 269,
        .pokemonOffset = 6,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("아기쥐"),
        .height = 3,
        .weight = 20,
        .descriptionPage1 = DexDescription_Pichu,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 508,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("별"),
        .height = 3,
        .weight = 30,
        .descriptionPage1 = DexDescription_Cleffa,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 462,
        .pokemonOffset = 23,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("풍선"),
        .height = 3,
        .weight = 10,
        .descriptionPage1 = DexDescription_Igglybuff,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 457,
        .pokemonOffset = -1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("바늘알"),
        .height = 3,
        .weight = 15,
        .descriptionPage1 = DexDescription_Togepi,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 507,
        .pokemonOffset = 23,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("행복"),
        .height = 6,
        .weight = 32,
        .descriptionPage1 = DexDescription_Togetic,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 424,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("아기새"),
        .height = 2,
        .weight = 20,
        .descriptionPage1 = DexDescription_Natu,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 610,
        .pokemonOffset = 25,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("정령"),
        .height = 15,
        .weight = 150,
        .descriptionPage1 = DexDescription_Xatu,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 6,
        .trainerScale = 318,
        .trainerOffset = 4,
    },
    {
        .categoryName = _("솜털"),
        .height = 6,
        .weight = 78,
        .descriptionPage1 = DexDescription_Mareep,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 379,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("솜털"),
        .height = 8,
        .weight = 133,
        .descriptionPage1 = DexDescription_Flaaffy,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 372,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("라이트"),
        .height = 14,
        .weight = 615,
        .descriptionPage1 = DexDescription_Ampharos,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("꽃"),
        .height = 4,
        .weight = 58,
        .descriptionPage1 = DexDescription_Bellossom,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 472,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("물쥐"),
        .height = 4,
        .weight = 85,
        .descriptionPage1 = DexDescription_Marill,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 476,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("물토끼"),
        .height = 8,
        .weight = 285,
        .descriptionPage1 = DexDescription_Azumarill,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 448,
        .pokemonOffset = 16,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("흉내"),
        .height = 12,
        .weight = 380,
        .descriptionPage1 = DexDescription_Sudowoodo,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 305,
        .pokemonOffset = 8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("개구리"),
        .height = 11,
        .weight = 339,
        .descriptionPage1 = DexDescription_Politoed,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 289,
        .pokemonOffset = 6,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("솜풀"),
        .height = 4,
        .weight = 5,
        .descriptionPage1 = DexDescription_Hoppip,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 562,
        .pokemonOffset = -7,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("솜풀"),
        .height = 6,
        .weight = 10,
        .descriptionPage1 = DexDescription_Skiploom,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 387,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("솜풀"),
        .height = 8,
        .weight = 30,
        .descriptionPage1 = DexDescription_Jumpluff,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 418,
        .pokemonOffset = -4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("긴꼬리"),
        .height = 8,
        .weight = 115,
        .descriptionPage1 = DexDescription_Aipom,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 363,
        .pokemonOffset = 6,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("씨앗"),
        .height = 3,
        .weight = 18,
        .descriptionPage1 = DexDescription_Sunkern,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 541,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("태양"),
        .height = 8,
        .weight = 85,
        .descriptionPage1 = DexDescription_Sunflora,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 444,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("얇은날개"),
        .height = 12,
        .weight = 380,
        .descriptionPage1 = DexDescription_Yanma,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 274,
        .pokemonOffset = -1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("수어"),
        .height = 4,
        .weight = 85,
        .descriptionPage1 = DexDescription_Wooper,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 479,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("수어"),
        .height = 14,
        .weight = 750,
        .descriptionPage1 = DexDescription_Quagsire,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("태양"),
        .height = 9,
        .weight = 265,
        .descriptionPage1 = DexDescription_Espeon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 363,
        .pokemonOffset = 14,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("달빛"),
        .height = 10,
        .weight = 270,
        .descriptionPage1 = DexDescription_Umbreon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 317,
        .pokemonOffset = 11,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("어둠"),
        .height = 5,
        .weight = 21,
        .descriptionPage1 = DexDescription_Murkrow,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 401,
        .pokemonOffset = -8,
        .trainerScale = 256,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("임금"),
        .height = 20,
        .weight = 795,
        .descriptionPage1 = DexDescription_Slowking,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 309,
        .trainerOffset = 5,
    },
    {
        .categoryName = _("야명"),
        .height = 7,
        .weight = 10,
        .descriptionPage1 = DexDescription_Misdreavus,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 407,
        .pokemonOffset = -8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("심볼"),
        .height = 5,
        .weight = 50,
        .descriptionPage1 = DexDescription_Unown,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 411,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("참기"),
        .height = 13,
        .weight = 285,
        .descriptionPage1 = DexDescription_Wobbuffet,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 274,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("긴목"),
        .height = 15,
        .weight = 415,
        .descriptionPage1 = DexDescription_Girafarig,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 281,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("도롱이벌레"),
        .height = 6,
        .weight = 72,
        .descriptionPage1 = DexDescription_Pineco,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 445,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("도롱이벌레"),
        .height = 12,
        .weight = 1258,
        .descriptionPage1 = DexDescription_Forretress,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 293,
        .pokemonOffset = 5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("땅뱀"),
        .height = 15,
        .weight = 140,
        .descriptionPage1 = DexDescription_Dunsparce,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 316,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("날전갈"),
        .height = 11,
        .weight = 648,
        .descriptionPage1 = DexDescription_Gligar,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 350,
        .pokemonOffset = -1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("철뱀"),
        .height = 92,
        .weight = 4000,
        .descriptionPage1 = DexDescription_Steelix,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 516,
        .trainerOffset = 13,
    },
    {
        .categoryName = _("요정"),
        .height = 6,
        .weight = 78,
        .descriptionPage1 = DexDescription_Snubbull,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 465,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("요정"),
        .height = 14,
        .weight = 487,
        .descriptionPage1 = DexDescription_Granbull,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("풍선"),
        .height = 5,
        .weight = 39,
        .descriptionPage1 = DexDescription_Qwilfish,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 430,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("집게"),
        .height = 18,
        .weight = 1180,
        .descriptionPage1 = DexDescription_Scizor,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 278,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("발효"),
        .height = 6,
        .weight = 205,
        .descriptionPage1 = DexDescription_Shuckle,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 485,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("외뿔"),
        .height = 15,
        .weight = 540,
        .descriptionPage1 = DexDescription_Heracross,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("갈고리손톱"),
        .height = 9,
        .weight = 280,
        .descriptionPage1 = DexDescription_Sneasel,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 413,
        .pokemonOffset = -3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("아기곰"),
        .height = 6,
        .weight = 88,
        .descriptionPage1 = DexDescription_Teddiursa,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 455,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("동면"),
        .height = 18,
        .weight = 1258,
        .descriptionPage1 = DexDescription_Ursaring,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("용암"),
        .height = 7,
        .weight = 350,
        .descriptionPage1 = DexDescription_Slugma,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 329,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("용암"),
        .height = 8,
        .weight = 550,
        .descriptionPage1 = DexDescription_Magcargo,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 332,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("산돼지"),
        .height = 4,
        .weight = 65,
        .descriptionPage1 = DexDescription_Swinub,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 324,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("멧돼지"),
        .height = 11,
        .weight = 558,
        .descriptionPage1 = DexDescription_Piloswine,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 306,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("산호"),
        .height = 6,
        .weight = 50,
        .descriptionPage1 = DexDescription_Corsola,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 410,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("분사"),
        .height = 6,
        .weight = 120,
        .descriptionPage1 = DexDescription_Remoraid,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 316,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("분사"),
        .height = 9,
        .weight = 285,
        .descriptionPage1 = DexDescription_Octillery,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 296,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("배달"),
        .height = 9,
        .weight = 160,
        .descriptionPage1 = DexDescription_Delibird,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 293,
        .pokemonOffset = 11,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("연"),
        .height = 21,
        .weight = 2200,
        .descriptionPage1 = DexDescription_Mantine,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 342,
        .trainerOffset = 7,
    },
    {
        .categoryName = _("갑옷새"),
        .height = 17,
        .weight = 505,
        .descriptionPage1 = DexDescription_Skarmory,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 271,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("다크"),
        .height = 6,
        .weight = 108,
        .descriptionPage1 = DexDescription_Houndour,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 393,
        .pokemonOffset = 16,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("다크"),
        .height = 14,
        .weight = 350,
        .descriptionPage1 = DexDescription_Houndoom,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("드래곤"),
        .height = 18,
        .weight = 1520,
        .descriptionPage1 = DexDescription_Kingdra,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 287,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("긴코"),
        .height = 5,
        .weight = 335,
        .descriptionPage1 = DexDescription_Phanpy,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 465,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("갑옷"),
        .height = 11,
        .weight = 1200,
        .descriptionPage1 = DexDescription_Donphan,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 313,
        .pokemonOffset = 9,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("가상"),
        .height = 6,
        .weight = 325,
        .descriptionPage1 = DexDescription_Porygon2,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 320,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("큰뿔"),
        .height = 14,
        .weight = 712,
        .descriptionPage1 = DexDescription_Stantler,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("그림장이"),
        .height = 12,
        .weight = 580,
        .descriptionPage1 = DexDescription_Smeargle,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 287,
        .pokemonOffset = 5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("싸움"),
        .height = 7,
        .weight = 210,
        .descriptionPage1 = DexDescription_Tyrogue,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 292,
        .pokemonOffset = 9,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("물구나무"),
        .height = 14,
        .weight = 480,
        .descriptionPage1 = DexDescription_Hitmontop,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 257,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("뽀뽀"),
        .height = 4,
        .weight = 60,
        .descriptionPage1 = DexDescription_Smoochum,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 440,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("전류"),
        .height = 6,
        .weight = 235,
        .descriptionPage1 = DexDescription_Elekid,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 363,
        .pokemonOffset = 14,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("불씨"),
        .height = 7,
        .weight = 214,
        .descriptionPage1 = DexDescription_Magby,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 284,
        .pokemonOffset = 13,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("젖소"),
        .height = 12,
        .weight = 755,
        .descriptionPage1 = DexDescription_Miltank,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 280,
        .pokemonOffset = 5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("행복"),
        .height = 15,
        .weight = 468,
        .descriptionPage1 = DexDescription_Blissey,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 4,
        .trainerScale = 310,
        .trainerOffset = 3,
    },
    {
        .categoryName = _("우뢰"),
        .height = 19,
        .weight = 1780,
        .descriptionPage1 = DexDescription_Raikou,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 345,
        .trainerOffset = 7,
    },
    {
        .categoryName = _("화산"),
        .height = 21,
        .weight = 1980,
        .descriptionPage1 = DexDescription_Entei,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 259,
        .pokemonOffset = 0,
        .trainerScale = 345,
        .trainerOffset = 7,
    },
    {
        .categoryName = _("오로라"),
        .height = 20,
        .weight = 1870,
        .descriptionPage1 = DexDescription_Suicune,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 269,
        .pokemonOffset = 0,
        .trainerScale = 345,
        .trainerOffset = 7,
    },
    {
        .categoryName = _("바위표면"),
        .height = 6,
        .weight = 720,
        .descriptionPage1 = DexDescription_Larvitar,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 472,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("탄환"),
        .height = 12,
        .weight = 1520,
        .descriptionPage1 = DexDescription_Pupitar,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 292,
        .pokemonOffset = 8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("갑옷"),
        .height = 20,
        .weight = 2020,
        .descriptionPage1 = DexDescription_Tyranitar,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 345,
        .trainerOffset = 7,
    },
    {
        .categoryName = _("잠수"),
        .height = 52,
        .weight = 2160,
        .descriptionPage1 = DexDescription_Lugia,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 721,
        .trainerOffset = 19,
    },
    {
        .categoryName = _("무지개색"),
        .height = 38,
        .weight = 1990,
        .descriptionPage1 = DexDescription_HoOh,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 610,
        .trainerOffset = 17,
    },
    {
        .categoryName = _("시간이동"),
        .height = 6,
        .weight = 50,
        .descriptionPage1 = DexDescription_Celebi,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 393,
        .pokemonOffset = -10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("숲도마뱀"),
        .height = 5,
        .weight = 50,
        .descriptionPage1 = DexDescription_Treecko,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 541,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("숲도마뱀"),
        .height = 9,
        .weight = 216,
        .descriptionPage1 = DexDescription_Grovyle,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 360,
        .pokemonOffset = 5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("밀림"),
        .height = 17,
        .weight = 522,
        .descriptionPage1 = DexDescription_Sceptile,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = -1,
        .trainerScale = 275,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("풋내기"),
        .height = 4,
        .weight = 25,
        .descriptionPage1 = DexDescription_Torchic,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 566,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("꼬마닭"),
        .height = 9,
        .weight = 195,
        .descriptionPage1 = DexDescription_Combusken,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 343,
        .pokemonOffset = 5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("맹화"),
        .height = 19,
        .weight = 520,
        .descriptionPage1 = DexDescription_Blaziken,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 301,
        .trainerOffset = 4,
    },
    {
        .categoryName = _("늪물고기"),
        .height = 4,
        .weight = 76,
        .descriptionPage1 = DexDescription_Mudkip,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 535,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("늪물고기"),
        .height = 7,
        .weight = 280,
        .descriptionPage1 = DexDescription_Marshtomp,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 340,
        .pokemonOffset = 7,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("늪물고기"),
        .height = 15,
        .weight = 819,
        .descriptionPage1 = DexDescription_Swampert,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("물어뜯기"),
        .height = 5,
        .weight = 136,
        .descriptionPage1 = DexDescription_Poochyena,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 481,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("물어뜯기"),
        .height = 10,
        .weight = 370,
        .descriptionPage1 = DexDescription_Mightyena,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 362,
        .pokemonOffset = 9,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("앙증너구리"),
        .height = 4,
        .weight = 175,
        .descriptionPage1 = DexDescription_Zigzagoon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 560,
        .pokemonOffset = 22,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("돌진"),
        .height = 5,
        .weight = 325,
        .descriptionPage1 = DexDescription_Linoone,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 321,
        .pokemonOffset = 7,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("애벌레"),
        .height = 3,
        .weight = 36,
        .descriptionPage1 = DexDescription_Wurmple,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 711,
        .pokemonOffset = 24,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("번데기"),
        .height = 6,
        .weight = 100,
        .descriptionPage1 = DexDescription_Silcoon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 431,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("나비"),
        .height = 10,
        .weight = 284,
        .descriptionPage1 = DexDescription_Beautifly,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 298,
        .pokemonOffset = -1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("번데기"),
        .height = 7,
        .weight = 115,
        .descriptionPage1 = DexDescription_Cascoon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 391,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("독나방"),
        .height = 12,
        .weight = 316,
        .descriptionPage1 = DexDescription_Dustox,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 269,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("개구리밥"),
        .height = 5,
        .weight = 26,
        .descriptionPage1 = DexDescription_Lotad,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 406,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("명랑함"),
        .height = 12,
        .weight = 325,
        .descriptionPage1 = DexDescription_Lombre,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 277,
        .pokemonOffset = 9,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("행복하기"),
        .height = 15,
        .weight = 550,
        .descriptionPage1 = DexDescription_Ludicolo,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 268,
        .trainerOffset = -1,
    },
    {
        .categoryName = _("도토리"),
        .height = 5,
        .weight = 40,
        .descriptionPage1 = DexDescription_Seedot,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 472,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("꾀부리기"),
        .height = 10,
        .weight = 280,
        .descriptionPage1 = DexDescription_Nuzleaf,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 299,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("부정하기"),
        .height = 13,
        .weight = 596,
        .descriptionPage1 = DexDescription_Shiftry,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 290,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("아기제비"),
        .height = 3,
        .weight = 23,
        .descriptionPage1 = DexDescription_Taillow,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 465,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("제비"),
        .height = 7,
        .weight = 198,
        .descriptionPage1 = DexDescription_Swellow,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 428,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("괭이갈매기"),
        .height = 6,
        .weight = 95,
        .descriptionPage1 = DexDescription_Wingull,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 295,
        .pokemonOffset = -2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("물새"),
        .height = 12,
        .weight = 280,
        .descriptionPage1 = DexDescription_Pelipper,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 288,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("느낌"),
        .height = 4,
        .weight = 66,
        .descriptionPage1 = DexDescription_Ralts,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 457,
        .pokemonOffset = -3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("감정"),
        .height = 8,
        .weight = 202,
        .descriptionPage1 = DexDescription_Kirlia,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 354,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("포용"),
        .height = 16,
        .weight = 484,
        .descriptionPage1 = DexDescription_Gardevoir,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("소금쟁이"),
        .height = 5,
        .weight = 17,
        .descriptionPage1 = DexDescription_Surskit,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 375,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("안구"),
        .height = 8,
        .weight = 36,
        .descriptionPage1 = DexDescription_Masquerain,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 378,
        .pokemonOffset = 8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("버섯"),
        .height = 4,
        .weight = 45,
        .descriptionPage1 = DexDescription_Shroomish,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 513,
        .pokemonOffset = 22,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("버섯"),
        .height = 12,
        .weight = 392,
        .descriptionPage1 = DexDescription_Breloom,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 324,
        .pokemonOffset = 6,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("게으름뱅이"),
        .height = 8,
        .weight = 240,
        .descriptionPage1 = DexDescription_Slakoth,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 291,
        .pokemonOffset = 16,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("성난원숭이"),
        .height = 14,
        .weight = 465,
        .descriptionPage1 = DexDescription_Vigoroth,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 301,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("나태함"),
        .height = 20,
        .weight = 1305,
        .descriptionPage1 = DexDescription_Slaking,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 300,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("신참"),
        .height = 5,
        .weight = 55,
        .descriptionPage1 = DexDescription_Nincada,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 405,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("시노비"),
        .height = 8,
        .weight = 120,
        .descriptionPage1 = DexDescription_Ninjask,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 383,
        .pokemonOffset = -9,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("허물"),
        .height = 8,
        .weight = 12,
        .descriptionPage1 = DexDescription_Shedinja,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 372,
        .pokemonOffset = -8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("속삭임"),
        .height = 6,
        .weight = 163,
        .descriptionPage1 = DexDescription_Whismur,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 373,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("큰목소리"),
        .height = 10,
        .weight = 405,
        .descriptionPage1 = DexDescription_Loudred,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 356,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("소음"),
        .height = 15,
        .weight = 840,
        .descriptionPage1 = DexDescription_Exploud,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 284,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("근성"),
        .height = 10,
        .weight = 864,
        .descriptionPage1 = DexDescription_Makuhita,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("손바닥치기"),
        .height = 23,
        .weight = 2538,
        .descriptionPage1 = DexDescription_Hariyama,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 343,
        .trainerOffset = 7,
    },
    {
        .categoryName = _("물방울"),
        .height = 2,
        .weight = 20,
        .descriptionPage1 = DexDescription_Azurill,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 603,
        .pokemonOffset = 23,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("콤파스"),
        .height = 10,
        .weight = 970,
        .descriptionPage1 = DexDescription_Nosepass,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 9,
        .trainerScale = 289,
        .trainerOffset = 3,
    },
    {
        .categoryName = _("작은고양이"),
        .height = 6,
        .weight = 110,
        .descriptionPage1 = DexDescription_Skitty,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 492,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("새침떼기"),
        .height = 11,
        .weight = 326,
        .descriptionPage1 = DexDescription_Delcatty,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 322,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("어둠"),
        .height = 5,
        .weight = 110,
        .descriptionPage1 = DexDescription_Sableye,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 451,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("배반"),
        .height = 6,
        .weight = 115,
        .descriptionPage1 = DexDescription_Mawile,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 466,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("철갑옷"),
        .height = 4,
        .weight = 600,
        .descriptionPage1 = DexDescription_Aron,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 419,
        .pokemonOffset = 23,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("철갑옷"),
        .height = 9,
        .weight = 1200,
        .descriptionPage1 = DexDescription_Lairon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 275,
        .pokemonOffset = 12,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("철갑옷"),
        .height = 21,
        .weight = 3600,
        .descriptionPage1 = DexDescription_Aggron,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = -1,
        .trainerScale = 350,
        .trainerOffset = 6,
    },
    {
        .categoryName = _("명상"),
        .height = 6,
        .weight = 112,
        .descriptionPage1 = DexDescription_Meditite,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 465,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("명상"),
        .height = 13,
        .weight = 315,
        .descriptionPage1 = DexDescription_Medicham,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 298,
        .pokemonOffset = 5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("천둥번개"),
        .height = 6,
        .weight = 152,
        .descriptionPage1 = DexDescription_Electrike,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 290,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("방전"),
        .height = 15,
        .weight = 402,
        .descriptionPage1 = DexDescription_Manectric,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 257,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("응원"),
        .height = 4,
        .weight = 42,
        .descriptionPage1 = DexDescription_Plusle,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 515,
        .pokemonOffset = -9,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("응원"),
        .height = 4,
        .weight = 42,
        .descriptionPage1 = DexDescription_Minun,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 512,
        .pokemonOffset = -7,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("반딧불"),
        .height = 7,
        .weight = 177,
        .descriptionPage1 = DexDescription_Volbeat,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 442,
        .pokemonOffset = 16,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("반딧불"),
        .height = 6,
        .weight = 177,
        .descriptionPage1 = DexDescription_Illumise,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 572,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("가시"),
        .height = 3,
        .weight = 20,
        .descriptionPage1 = DexDescription_Roselia,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 677,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("밥통"),
        .height = 4,
        .weight = 103,
        .descriptionPage1 = DexDescription_Gulpin,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 593,
        .pokemonOffset = 23,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("독봉지"),
        .height = 17,
        .weight = 800,
        .descriptionPage1 = DexDescription_Swalot,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 6,
        .trainerScale = 345,
        .trainerOffset = 3,
    },
    {
        .categoryName = _("사나움"),
        .height = 8,
        .weight = 208,
        .descriptionPage1 = DexDescription_Carvanha,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 362,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("난폭"),
        .height = 18,
        .weight = 888,
        .descriptionPage1 = DexDescription_Sharpedo,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 317,
        .trainerOffset = 3,
    },
    {
        .categoryName = _("둥근고래"),
        .height = 20,
        .weight = 1300,
        .descriptionPage1 = DexDescription_Wailmer,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 493,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("뜸고래"),
        .height = 145,
        .weight = 3980,
        .descriptionPage1 = DexDescription_Wailord,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 1352,
        .trainerOffset = 18,
    },
    {
        .categoryName = _("둔감"),
        .height = 7,
        .weight = 240,
        .descriptionPage1 = DexDescription_Numel,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 342,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("분화"),
        .height = 19,
        .weight = 2200,
        .descriptionPage1 = DexDescription_Camerupt,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 7,
        .trainerScale = 345,
        .trainerOffset = 6,
    },
    {
        .categoryName = _("석탄"),
        .height = 5,
        .weight = 804,
        .descriptionPage1 = DexDescription_Torkoal,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 390,
        .pokemonOffset = 9,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("튀다"),
        .height = 7,
        .weight = 306,
        .descriptionPage1 = DexDescription_Spoink,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 423,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("조작"),
        .height = 9,
        .weight = 715,
        .descriptionPage1 = DexDescription_Grumpig,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 358,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("얼룩팬더"),
        .height = 11,
        .weight = 50,
        .descriptionPage1 = DexDescription_Spinda,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 321,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("개미지옥"),
        .height = 7,
        .weight = 150,
        .descriptionPage1 = DexDescription_Trapinch,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 298,
        .pokemonOffset = 17,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("진동"),
        .height = 11,
        .weight = 153,
        .descriptionPage1 = DexDescription_Vibrava,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 370,
        .pokemonOffset = 11,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("혼령"),
        .height = 20,
        .weight = 820,
        .descriptionPage1 = DexDescription_Flygon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 268,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("선인장"),
        .height = 4,
        .weight = 513,
        .descriptionPage1 = DexDescription_Cacnea,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 455,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("허수아비"),
        .height = 13,
        .weight = 774,
        .descriptionPage1 = DexDescription_Cacturne,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 327,
        .pokemonOffset = 5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("솜새"),
        .height = 4,
        .weight = 12,
        .descriptionPage1 = DexDescription_Swablu,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 422,
        .pokemonOffset = -8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("허밍"),
        .height = 11,
        .weight = 206,
        .descriptionPage1 = DexDescription_Altaria,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 327,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("고양이족제비"),
        .height = 13,
        .weight = 403,
        .descriptionPage1 = DexDescription_Zangoose,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("송곳뱀"),
        .height = 27,
        .weight = 525,
        .descriptionPage1 = DexDescription_Seviper,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 275,
        .pokemonOffset = 7,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("별똥별"),
        .height = 10,
        .weight = 1680,
        .descriptionPage1 = DexDescription_Lunatone,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 300,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("별똥별"),
        .height = 12,
        .weight = 1540,
        .descriptionPage1 = DexDescription_Solrock,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 328,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("수염물고기"),
        .height = 4,
        .weight = 19,
        .descriptionPage1 = DexDescription_Barboach,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 581,
        .pokemonOffset = -3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("수염물고기"),
        .height = 9,
        .weight = 236,
        .descriptionPage1 = DexDescription_Whiscash,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 317,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("건달"),
        .height = 6,
        .weight = 115,
        .descriptionPage1 = DexDescription_Corphish,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 484,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("불량배"),
        .height = 11,
        .weight = 328,
        .descriptionPage1 = DexDescription_Crawdaunt,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 365,
        .pokemonOffset = 9,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("토우"),
        .height = 5,
        .weight = 215,
        .descriptionPage1 = DexDescription_Baltoy,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 457,
        .pokemonOffset = 21,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("토우"),
        .height = 15,
        .weight = 1080,
        .descriptionPage1 = DexDescription_Claydol,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 280,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("바다나리"),
        .height = 10,
        .weight = 238,
        .descriptionPage1 = DexDescription_Lileep,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 305,
        .pokemonOffset = 8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("바위단지"),
        .height = 15,
        .weight = 604,
        .descriptionPage1 = DexDescription_Cradily,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 267,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("고대새우"),
        .height = 7,
        .weight = 125,
        .descriptionPage1 = DexDescription_Anorith,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 296,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("갑주"),
        .height = 15,
        .weight = 682,
        .descriptionPage1 = DexDescription_Armaldo,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 312,
        .pokemonOffset = 3,
        .trainerScale = 271,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("물고기"),
        .height = 6,
        .weight = 74,
        .descriptionPage1 = DexDescription_Feebas,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 423,
        .pokemonOffset = -4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("사랑"),
        .height = 62,
        .weight = 1620,
        .descriptionPage1 = DexDescription_Milotic,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 360,
        .trainerOffset = 7,
    },
    {
        .categoryName = _("날씨"),
        .height = 3,
        .weight = 8,
        .descriptionPage1 = DexDescription_Castform,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 435,
        .pokemonOffset = -5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("색변화"),
        .height = 10,
        .weight = 220,
        .descriptionPage1 = DexDescription_Kecleon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 316,
        .pokemonOffset = 10,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("인형"),
        .height = 6,
        .weight = 23,
        .descriptionPage1 = DexDescription_Shuppet,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 440,
        .pokemonOffset = 20,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("봉제인형"),
        .height = 11,
        .weight = 125,
        .descriptionPage1 = DexDescription_Banette,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 262,
        .pokemonOffset = 9,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("마중"),
        .height = 8,
        .weight = 150,
        .descriptionPage1 = DexDescription_Duskull,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 406,
        .pokemonOffset = -4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("손짓"),
        .height = 16,
        .weight = 306,
        .descriptionPage1 = DexDescription_Dusclops,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 299,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("후르츠"),
        .height = 20,
        .weight = 1000,
        .descriptionPage1 = DexDescription_Tropius,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 344,
        .trainerOffset = 7,
    },
    {
        .categoryName = _("풍경"),
        .height = 6,
        .weight = 10,
        .descriptionPage1 = DexDescription_Chimecho,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 505,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("재난"),
        .height = 12,
        .weight = 470,
        .descriptionPage1 = DexDescription_Absol,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 301,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("명랑"),
        .height = 6,
        .weight = 140,
        .descriptionPage1 = DexDescription_Wynaut,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 484,
        .pokemonOffset = 19,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("눈우산"),
        .height = 7,
        .weight = 168,
        .descriptionPage1 = DexDescription_Snorunt,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 380,
        .pokemonOffset = 15,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("얼굴"),
        .height = 15,
        .weight = 2565,
        .descriptionPage1 = DexDescription_Glalie,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 3,
        .trainerScale = 344,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("손뼉"),
        .height = 8,
        .weight = 395,
        .descriptionPage1 = DexDescription_Spheal,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 315,
        .pokemonOffset = 16,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("공돌리기"),
        .height = 11,
        .weight = 876,
        .descriptionPage1 = DexDescription_Sealeo,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 338,
        .pokemonOffset = 13,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("얼음깨기"),
        .height = 14,
        .weight = 1506,
        .descriptionPage1 = DexDescription_Walrein,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 316,
        .pokemonOffset = 4,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("두조개"),
        .height = 4,
        .weight = 525,
        .descriptionPage1 = DexDescription_Clamperl,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 691,
        .pokemonOffset = 22,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("깊은바다"),
        .height = 17,
        .weight = 270,
        .descriptionPage1 = DexDescription_Huntail,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 307,
        .pokemonOffset = 1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("남해"),
        .height = 18,
        .weight = 226,
        .descriptionPage1 = DexDescription_Gorebyss,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 278,
        .pokemonOffset = 5,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("장수"),
        .height = 10,
        .weight = 234,
        .descriptionPage1 = DexDescription_Relicanth,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 316,
        .pokemonOffset = 7,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("랑데부"),
        .height = 6,
        .weight = 87,
        .descriptionPage1 = DexDescription_Luvdisc,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 371,
        .pokemonOffset = 2,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("돌머리"),
        .height = 6,
        .weight = 421,
        .descriptionPage1 = DexDescription_Bagon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 448,
        .pokemonOffset = 18,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("인내"),
        .height = 11,
        .weight = 1105,
        .descriptionPage1 = DexDescription_Shelgon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 311,
        .pokemonOffset = 12,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("드래곤"),
        .height = 15,
        .weight = 1026,
        .descriptionPage1 = DexDescription_Salamence,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("철공"),
        .height = 6,
        .weight = 952,
        .descriptionPage1 = DexDescription_Beldum,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 414,
        .pokemonOffset = -1,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("철발톱"),
        .height = 12,
        .weight = 2025,
        .descriptionPage1 = DexDescription_Metang,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 6,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("무쇠다리"),
        .height = 16,
        .weight = 5500,
        .descriptionPage1 = DexDescription_Metagross,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 4,
        .trainerScale = 447,
        .trainerOffset = 9,
    },
    {
        .categoryName = _("바위산"),
        .height = 17,
        .weight = 2300,
        .descriptionPage1 = DexDescription_Regirock,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 2,
        .trainerScale = 309,
        .trainerOffset = 1,
    },
    {
        .categoryName = _("빙산"),
        .height = 18,
        .weight = 1750,
        .descriptionPage1 = DexDescription_Regice,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 301,
        .trainerOffset = 2,
    },
    {
        .categoryName = _("쇠철"),
        .height = 19,
        .weight = 2050,
        .descriptionPage1 = DexDescription_Registeel,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 359,
        .trainerOffset = 6,
    },
    {
        .categoryName = _("무한"),
        .height = 14,
        .weight = 400,
        .descriptionPage1 = DexDescription_Latias,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 304,
        .pokemonOffset = 3,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("무한"),
        .height = 20,
        .weight = 600,
        .descriptionPage1 = DexDescription_Latios,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 294,
        .trainerOffset = 3,
    },
    {
        .categoryName = _("해저"),
        .height = 45,
        .weight = 3520,
        .descriptionPage1 = DexDescription_Kyogre,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 614,
        .trainerOffset = 13,
    },
    {
        .categoryName = _("대륙"),
        .height = 35,
        .weight = 9500,
        .descriptionPage1 = DexDescription_Groudon,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 515,
        .trainerOffset = 14,
    },
    {
        .categoryName = _("천공"),
        .height = 70,
        .weight = 2065,
        .descriptionPage1 = DexDescription_Rayquaza,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 448,
        .trainerOffset = 12,
    },
    {
        .categoryName = _("희망사항"),
        .height = 3,
        .weight = 11,
        .descriptionPage1 = DexDescription_Jirachi,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 608,
        .pokemonOffset = -8,
        .trainerScale = 256,
        .trainerOffset = 0,
    },
    {
        .categoryName = _("DNA"),
        .height = 17,
        .weight = 608,
        .descriptionPage1 = DexDescription_Deoxys,
        .descriptionPage2 = DexDescription_Dummy,
        .pokemonScale = 256,
        .pokemonOffset = 0,
        .trainerScale = 290,
        .trainerOffset = 2,
    },
};
# 515 "src/pokemon/pokedex.c" 2

static const u16 gUnknown_083B4EC4[16] = {0};
static const u8 *const sMonFootprintTable[] =
{
    gMonFootprint_Bulbasaur,
    gMonFootprint_Bulbasaur,
    gMonFootprint_Ivysaur,
    gMonFootprint_Venusaur,
    gMonFootprint_Charmander,
    gMonFootprint_Charmeleon,
    gMonFootprint_Charizard,
    gMonFootprint_Squirtle,
    gMonFootprint_Wartortle,
    gMonFootprint_Blastoise,
    gMonFootprint_Caterpie,
    gMonFootprint_Metapod,
    gMonFootprint_Butterfree,
    gMonFootprint_Weedle,
    gMonFootprint_Kakuna,
    gMonFootprint_Beedrill,
    gMonFootprint_Pidgey,
    gMonFootprint_Pidgeotto,
    gMonFootprint_Pidgeot,
    gMonFootprint_Rattata,
    gMonFootprint_Raticate,
    gMonFootprint_Spearow,
    gMonFootprint_Fearow,
    gMonFootprint_Ekans,
    gMonFootprint_Arbok,
    gMonFootprint_Pikachu,
    gMonFootprint_Raichu,
    gMonFootprint_Sandshrew,
    gMonFootprint_Sandslash,
    gMonFootprint_NidoranF,
    gMonFootprint_Nidorina,
    gMonFootprint_Nidoqueen,
    gMonFootprint_NidoranM,
    gMonFootprint_Nidorino,
    gMonFootprint_Nidoking,
    gMonFootprint_Clefairy,
    gMonFootprint_Clefable,
    gMonFootprint_Vulpix,
    gMonFootprint_Ninetales,
    gMonFootprint_Jigglypuff,
    gMonFootprint_Wigglytuff,
    gMonFootprint_Zubat,
    gMonFootprint_Golbat,
    gMonFootprint_Oddish,
    gMonFootprint_Gloom,
    gMonFootprint_Vileplume,
    gMonFootprint_Paras,
    gMonFootprint_Parasect,
    gMonFootprint_Venonat,
    gMonFootprint_Venomoth,
    gMonFootprint_Diglett,
    gMonFootprint_Dugtrio,
    gMonFootprint_Meowth,
    gMonFootprint_Persian,
    gMonFootprint_Psyduck,
    gMonFootprint_Golduck,
    gMonFootprint_Mankey,
    gMonFootprint_Primeape,
    gMonFootprint_Growlithe,
    gMonFootprint_Arcanine,
    gMonFootprint_Poliwag,
    gMonFootprint_Poliwhirl,
    gMonFootprint_Poliwrath,
    gMonFootprint_Abra,
    gMonFootprint_Kadabra,
    gMonFootprint_Alakazam,
    gMonFootprint_Machop,
    gMonFootprint_Machoke,
    gMonFootprint_Machamp,
    gMonFootprint_Bellsprout,
    gMonFootprint_Weepinbell,
    gMonFootprint_Victreebel,
    gMonFootprint_Tentacool,
    gMonFootprint_Tentacruel,
    gMonFootprint_Geodude,
    gMonFootprint_Graveler,
    gMonFootprint_Golem,
    gMonFootprint_Ponyta,
    gMonFootprint_Rapidash,
    gMonFootprint_Slowpoke,
    gMonFootprint_Slowbro,
    gMonFootprint_Magnemite,
    gMonFootprint_Magneton,
    gMonFootprint_Farfetchd,
    gMonFootprint_Doduo,
    gMonFootprint_Dodrio,
    gMonFootprint_Seel,
    gMonFootprint_Dewgong,
    gMonFootprint_Grimer,
    gMonFootprint_Muk,
    gMonFootprint_Shellder,
    gMonFootprint_Cloyster,
    gMonFootprint_Gastly,
    gMonFootprint_Haunter,
    gMonFootprint_Gengar,
    gMonFootprint_Onix,
    gMonFootprint_Drowzee,
    gMonFootprint_Hypno,
    gMonFootprint_Krabby,
    gMonFootprint_Kingler,
    gMonFootprint_Voltorb,
    gMonFootprint_Electrode,
    gMonFootprint_Exeggcute,
    gMonFootprint_Exeggutor,
    gMonFootprint_Cubone,
    gMonFootprint_Marowak,
    gMonFootprint_Hitmonlee,
    gMonFootprint_Hitmonchan,
    gMonFootprint_Lickitung,
    gMonFootprint_Koffing,
    gMonFootprint_Weezing,
    gMonFootprint_Rhyhorn,
    gMonFootprint_Rhydon,
    gMonFootprint_Chansey,
    gMonFootprint_Tangela,
    gMonFootprint_Kangaskhan,
    gMonFootprint_Horsea,
    gMonFootprint_Seadra,
    gMonFootprint_Goldeen,
    gMonFootprint_Seaking,
    gMonFootprint_Staryu,
    gMonFootprint_Starmie,
    gMonFootprint_Mrmime,
    gMonFootprint_Scyther,
    gMonFootprint_Jynx,
    gMonFootprint_Electabuzz,
    gMonFootprint_Magmar,
    gMonFootprint_Pinsir,
    gMonFootprint_Tauros,
    gMonFootprint_Magikarp,
    gMonFootprint_Gyarados,
    gMonFootprint_Lapras,
    gMonFootprint_Ditto,
    gMonFootprint_Eevee,
    gMonFootprint_Vaporeon,
    gMonFootprint_Jolteon,
    gMonFootprint_Flareon,
    gMonFootprint_Porygon,
    gMonFootprint_Omanyte,
    gMonFootprint_Omastar,
    gMonFootprint_Kabuto,
    gMonFootprint_Kabutops,
    gMonFootprint_Aerodactyl,
    gMonFootprint_Snorlax,
    gMonFootprint_Articuno,
    gMonFootprint_Zapdos,
    gMonFootprint_Moltres,
    gMonFootprint_Dratini,
    gMonFootprint_Dragonair,
    gMonFootprint_Dragonite,
    gMonFootprint_Mewtwo,
    gMonFootprint_Mew,
    gMonFootprint_Chikorita,
    gMonFootprint_Bayleef,
    gMonFootprint_Meganium,
    gMonFootprint_Cyndaquil,
    gMonFootprint_Quilava,
    gMonFootprint_Typhlosion,
    gMonFootprint_Totodile,
    gMonFootprint_Croconaw,
    gMonFootprint_Feraligatr,
    gMonFootprint_Sentret,
    gMonFootprint_Furret,
    gMonFootprint_Hoothoot,
    gMonFootprint_Noctowl,
    gMonFootprint_Ledyba,
    gMonFootprint_Ledian,
    gMonFootprint_Spinarak,
    gMonFootprint_Ariados,
    gMonFootprint_Crobat,
    gMonFootprint_Chinchou,
    gMonFootprint_Lanturn,
    gMonFootprint_Pichu,
    gMonFootprint_Cleffa,
    gMonFootprint_Igglybuff,
    gMonFootprint_Togepi,
    gMonFootprint_Togetic,
    gMonFootprint_Natu,
    gMonFootprint_Xatu,
    gMonFootprint_Mareep,
    gMonFootprint_Flaaffy,
    gMonFootprint_Ampharos,
    gMonFootprint_Bellossom,
    gMonFootprint_Marill,
    gMonFootprint_Azumarill,
    gMonFootprint_Sudowoodo,
    gMonFootprint_Politoed,
    gMonFootprint_Hoppip,
    gMonFootprint_Skiploom,
    gMonFootprint_Jumpluff,
    gMonFootprint_Aipom,
    gMonFootprint_Sunkern,
    gMonFootprint_Sunflora,
    gMonFootprint_Yanma,
    gMonFootprint_Wooper,
    gMonFootprint_Quagsire,
    gMonFootprint_Espeon,
    gMonFootprint_Umbreon,
    gMonFootprint_Murkrow,
    gMonFootprint_Slowking,
    gMonFootprint_Misdreavus,
    gMonFootprint_Unown,
    gMonFootprint_Wobbuffet,
    gMonFootprint_Girafarig,
    gMonFootprint_Pineco,
    gMonFootprint_Forretress,
    gMonFootprint_Dunsparce,
    gMonFootprint_Gligar,
    gMonFootprint_Steelix,
    gMonFootprint_Snubbull,
    gMonFootprint_Granbull,
    gMonFootprint_Qwilfish,
    gMonFootprint_Scizor,
    gMonFootprint_Shuckle,
    gMonFootprint_Heracross,
    gMonFootprint_Sneasel,
    gMonFootprint_Teddiursa,
    gMonFootprint_Ursaring,
    gMonFootprint_Slugma,
    gMonFootprint_Magcargo,
    gMonFootprint_Swinub,
    gMonFootprint_Piloswine,
    gMonFootprint_Corsola,
    gMonFootprint_Remoraid,
    gMonFootprint_Octillery,
    gMonFootprint_Delibird,
    gMonFootprint_Mantine,
    gMonFootprint_Skarmory,
    gMonFootprint_Houndour,
    gMonFootprint_Houndoom,
    gMonFootprint_Kingdra,
    gMonFootprint_Phanpy,
    gMonFootprint_Donphan,
    gMonFootprint_Porygon2,
    gMonFootprint_Stantler,
    gMonFootprint_Smeargle,
    gMonFootprint_Tyrogue,
    gMonFootprint_Hitmontop,
    gMonFootprint_Smoochum,
    gMonFootprint_Elekid,
    gMonFootprint_Magby,
    gMonFootprint_Miltank,
    gMonFootprint_Blissey,
    gMonFootprint_Raikou,
    gMonFootprint_Entei,
    gMonFootprint_Suicune,
    gMonFootprint_Larvitar,
    gMonFootprint_Pupitar,
    gMonFootprint_Tyranitar,
    gMonFootprint_Lugia,
    gMonFootprint_HoOh,
    gMonFootprint_Celebi,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_QuestionMark,
    gMonFootprint_Treecko,
    gMonFootprint_Grovyle,
    gMonFootprint_Sceptile,
    gMonFootprint_Torchic,
    gMonFootprint_Combusken,
    gMonFootprint_Blaziken,
    gMonFootprint_Mudkip,
    gMonFootprint_Marshtomp,
    gMonFootprint_Swampert,
    gMonFootprint_Poochyena,
    gMonFootprint_Mightyena,
    gMonFootprint_Zigzagoon,
    gMonFootprint_Linoone,
    gMonFootprint_Wurmple,
    gMonFootprint_Silcoon,
    gMonFootprint_Beautifly,
    gMonFootprint_Cascoon,
    gMonFootprint_Dustox,
    gMonFootprint_Lotad,
    gMonFootprint_Lombre,
    gMonFootprint_Ludicolo,
    gMonFootprint_Seedot,
    gMonFootprint_Nuzleaf,
    gMonFootprint_Shiftry,
    gMonFootprint_Nincada,
    gMonFootprint_Ninjask,
    gMonFootprint_Shedinja,
    gMonFootprint_Taillow,
    gMonFootprint_Swellow,
    gMonFootprint_Shroomish,
    gMonFootprint_Breloom,
    gMonFootprint_Spinda,
    gMonFootprint_Wingull,
    gMonFootprint_Pelipper,
    gMonFootprint_Surskit,
    gMonFootprint_Masquerain,
    gMonFootprint_Wailmer,
    gMonFootprint_Wailord,
    gMonFootprint_Skitty,
    gMonFootprint_Delcatty,
    gMonFootprint_Kecleon,
    gMonFootprint_Baltoy,
    gMonFootprint_Claydol,
    gMonFootprint_Nosepass,
    gMonFootprint_Torkoal,
    gMonFootprint_Sableye,
    gMonFootprint_Barboach,
    gMonFootprint_Whiscash,
    gMonFootprint_Luvdisc,
    gMonFootprint_Corphish,
    gMonFootprint_Crawdaunt,
    gMonFootprint_Feebas,
    gMonFootprint_Milotic,
    gMonFootprint_Carvanha,
    gMonFootprint_Sharpedo,
    gMonFootprint_Trapinch,
    gMonFootprint_Vibrava,
    gMonFootprint_Flygon,
    gMonFootprint_Makuhita,
    gMonFootprint_Hariyama,
    gMonFootprint_Electrike,
    gMonFootprint_Manectric,
    gMonFootprint_Numel,
    gMonFootprint_Camerupt,
    gMonFootprint_Spheal,
    gMonFootprint_Sealeo,
    gMonFootprint_Walrein,
    gMonFootprint_Cacnea,
    gMonFootprint_Cacturne,
    gMonFootprint_Snorunt,
    gMonFootprint_Glalie,
    gMonFootprint_Lunatone,
    gMonFootprint_Solrock,
    gMonFootprint_Azurill,
    gMonFootprint_Spoink,
    gMonFootprint_Grumpig,
    gMonFootprint_Plusle,
    gMonFootprint_Minun,
    gMonFootprint_Mawile,
    gMonFootprint_Meditite,
    gMonFootprint_Medicham,
    gMonFootprint_Swablu,
    gMonFootprint_Altaria,
    gMonFootprint_Wynaut,
    gMonFootprint_Duskull,
    gMonFootprint_Dusclops,
    gMonFootprint_Roselia,
    gMonFootprint_Slakoth,
    gMonFootprint_Vigoroth,
    gMonFootprint_Slaking,
    gMonFootprint_Gulpin,
    gMonFootprint_Swalot,
    gMonFootprint_Tropius,
    gMonFootprint_Whismur,
    gMonFootprint_Loudred,
    gMonFootprint_Exploud,
    gMonFootprint_Clamperl,
    gMonFootprint_Huntail,
    gMonFootprint_Gorebyss,
    gMonFootprint_Absol,
    gMonFootprint_Shuppet,
    gMonFootprint_Banette,
    gMonFootprint_Seviper,
    gMonFootprint_Zangoose,
    gMonFootprint_Relicanth,
    gMonFootprint_Aron,
    gMonFootprint_Lairon,
    gMonFootprint_Aggron,
    gMonFootprint_Castform,
    gMonFootprint_Volbeat,
    gMonFootprint_Illumise,
    gMonFootprint_Lileep,
    gMonFootprint_Cradily,
    gMonFootprint_Anorith,
    gMonFootprint_Armaldo,
    gMonFootprint_Ralts,
    gMonFootprint_Kirlia,
    gMonFootprint_Gardevoir,
    gMonFootprint_Bagon,
    gMonFootprint_Shelgon,
    gMonFootprint_Salamence,
    gMonFootprint_Beldum,
    gMonFootprint_Metang,
    gMonFootprint_Metagross,
    gMonFootprint_Regirock,
    gMonFootprint_Regice,
    gMonFootprint_Registeel,
    gMonFootprint_Kyogre,
    gMonFootprint_Groudon,
    gMonFootprint_Rayquaza,
    gMonFootprint_Latias,
    gMonFootprint_Latios,
    gMonFootprint_Jirachi,
    gMonFootprint_Deoxys,
    gMonFootprint_Chimecho,
    gMonFootprint_Bulbasaur,
};
static const u8 gUnknown_083B5558[] = _("{CLEAR_TO 0}");
const u8 gUnknown_083B555C[] = INCBIN_U8("graphics/unknown/unknown_3B555C.bin");
static const struct OamData gOamData_83B557C =
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
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static void *const gUnknown_083B5584[] =
{
    (void *)(gSharedMem + 0x8000),
    (void *)(gSharedMem + 0xC000),
    (void *)(gSharedMem + 0x10000),
    (void *)(gSharedMem + 0x14000),
};
static const struct SpriteFrameImage gSpriteImageTable_83B5594[] =
{
    {(&gSharedMem[0x8000]), 0x800},
    {(&gSharedMem[0x8800]), 0x800},
    {(&gSharedMem[0x9000]), 0x800},
    {(&gSharedMem[0x9800]), 0x800},
    {(&gSharedMem[0xA000]), 0x800},
    {(&gSharedMem[0xA800]), 0x800},
    {(&gSharedMem[0xB000]), 0x800},
    {(&gSharedMem[0xB800]), 0x800},
    {(&gSharedMem[0xC000]), 0x800},
    {(&gSharedMem[0xC800]), 0x800},
    {(&gSharedMem[0xD000]), 0x800},
    {(&gSharedMem[0xD800]), 0x800},
    {(&gSharedMem[0xE000]), 0x800},
    {(&gSharedMem[0xE800]), 0x800},
    {(&gSharedMem[0xF000]), 0x800},
    {(&gSharedMem[0xF800]), 0x800},
};
static const struct SpriteFrameImage gSpriteImageTable_83B5614[] =
{
    {(&gSharedMem[0xC000]), 0x800},
    {(&gSharedMem[0xC800]), 0x800},
    {(&gSharedMem[0xD000]), 0x800},
    {(&gSharedMem[0xD800]), 0x800},
    {(&gSharedMem[0xE000]), 0x800},
    {(&gSharedMem[0xE800]), 0x800},
    {(&gSharedMem[0xF000]), 0x800},
    {(&gSharedMem[0xF800]), 0x800},
    {(&gSharedMem[0x10000]), 0x800},
    {(&gSharedMem[0x10800]), 0x800},
    {(&gSharedMem[0x11000]), 0x800},
    {(&gSharedMem[0x11800]), 0x800},
    {(&gSharedMem[0x12000]), 0x800},
    {(&gSharedMem[0x12800]), 0x800},
    {(&gSharedMem[0x13000]), 0x800},
    {(&gSharedMem[0x13800]), 0x800},
};
static const struct SpriteFrameImage gSpriteImageTable_83B5694[] =
{
    {(&gSharedMem[0x10000]), 0x800},
    {(&gSharedMem[0x10800]), 0x800},
    {(&gSharedMem[0x11000]), 0x800},
    {(&gSharedMem[0x11800]), 0x800},
    {(&gSharedMem[0x12000]), 0x800},
    {(&gSharedMem[0x12800]), 0x800},
    {(&gSharedMem[0x13000]), 0x800},
    {(&gSharedMem[0x13800]), 0x800},
    {(&gSharedMem[0x14000]), 0x800},
    {(&gSharedMem[0x14800]), 0x800},
    {(&gSharedMem[0x15000]), 0x800},
    {(&gSharedMem[0x15800]), 0x800},
    {(&gSharedMem[0x16000]), 0x800},
    {(&gSharedMem[0x16800]), 0x800},
    {(&gSharedMem[0x17000]), 0x800},
    {(&gSharedMem[0x17800]), 0x800},
};
static const struct SpriteFrameImage gSpriteImageTable_83B5714[] =
{
    {(&gSharedMem[0x14000]), 0x800},
    {(&gSharedMem[0x14800]), 0x800},
    {(&gSharedMem[0x15000]), 0x800},
    {(&gSharedMem[0x15800]), 0x800},
    {(&gSharedMem[0x16000]), 0x800},
    {(&gSharedMem[0x16800]), 0x800},
    {(&gSharedMem[0x17000]), 0x800},
    {(&gSharedMem[0x17800]), 0x800},
    {(&gSharedMem[0x18000]), 0x800},
    {(&gSharedMem[0x18800]), 0x800},
    {(&gSharedMem[0x19000]), 0x800},
    {(&gSharedMem[0x19800]), 0x800},
    {(&gSharedMem[0x1A000]), 0x800},
    {(&gSharedMem[0x1A800]), 0x800},
    {(&gSharedMem[0x1B000]), 0x800},
    {(&gSharedMem[0x1B800]), 0x800},
};
static const struct SpriteFrameImage *const gUnknown_083B5794[] =
{
    gSpriteImageTable_83B5594,
    gSpriteImageTable_83B5614,
    gSpriteImageTable_83B5694,
    gSpriteImageTable_83B5714,
};
static void nullsub_59(struct Sprite *);
static const struct SpriteTemplate gUnknown_083B57A4 =
{
    .tileTag = 0xFFFF,
    .paletteTag = 0,
    .oam = &gOamData_83B557C,
    .anims = ((void *)0),
    .images = gSpriteImageTable_83B5594,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = nullsub_59,
};
static const u8 gUnknown_083B57BC[][4] =
{
    {0, 0, 0, 0},
    {0xBB, 3, 0xD5, 3},
    {0xBE, 3, 0xD8, 3},
    {0xC1, 3, 0xDB, 3},
    {0xC4, 3, 0xDE, 3},
    {0xC7, 3, 0xE1, 3},
    {0xCA, 3, 0xE4, 3},
    {0xCD, 3, 0xE7, 3},
    {0xD0, 3, 0xEA, 3},
    {0xD3, 2, 0xED, 2},
};
static const u8 gChoTable[][4] =
{
 { 0x00, 0x00, 0x00, 0x00 },
 { 0x01, 0x02, 0x03, 0x00 },
 { 0x04, 0x05, 0x06, 0x00 },
 { 0x07, 0x08, 0x09, 0x00 },
 { 0x0a, 0x0b, 0x0c, 0x00 },
 { 0x0d, 0x0e, 0x0f, 0x00 },
 { 0x10, 0x11, 0x00, 0x00 },
 { 0x12, 0x13, 0x00, 0x00 },
};
static const struct UnknownStruct3 gUnknown_083B57E4[] =
{
    {DexText_SearchForPoke, 0, 0, 5},
    {DexText_SwitchDex, 6, 0, 5},
    {DexText_ReturnToDex, 12, 0, 5},
};
static const struct UnknownStruct4 gUnknown_083B57FC[] =
{
    {DexText_ListByABC, 0, 2, 5, 5, 2, 12},
    {DexText_ListByColor, 0, 4, 5, 5, 4, 12},
    {DexText_ListByType, 0, 6, 5, 5, 6, 6},
    {DexText_ListByType, 0, 6, 5, 11, 6, 6},
    {DexText_SelectDexList, 0, 8, 5, 5, 8, 12},
    {DexText_SelectDexMode, 0, 10, 5, 5, 10, 12},
    {DexText_ExecuteSearchSwitch, 0, 12, 5, 0, 0, 0},
};
static const u8 gUnknown_083B5850[][4] =
{
    {0xFF, 0xFF, 0xFF, 1},
    {0xFF, 0xFF, 0, 2},
    {0xFF, 3, 1, 4},
    { 2, 0xFF, 1, 4},
    {0xFF, 0xFF, 2, 5},
    {0xFF, 0xFF, 4, 6},
    {0xFF, 0xFF, 5, 0xFF},
};
static const u8 gUnknown_083B586C[][4] =
{
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 5},
    {0xFF, 0xFF, 4, 6},
    {0xFF, 0xFF, 5, 0xFF},
};
static const u8 gUnknown_083B5888[][4] =
{
    {0xFF, 0xFF, 0xFF, 1},
    {0xFF, 0xFF, 0, 2},
    {0xFF, 3, 1, 4},
    { 2, 0xFF, 1, 4},
    {0xFF, 0xFF, 2, 6},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 4, 0xFF},
};
static const u8 gUnknown_083B58A4[][4] =
{
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 0xFF, 6},
    {0xFF, 0xFF, 0xFF, 0xFF},
    {0xFF, 0xFF, 4, 0xFF},
};
static const struct UnknownStruct2 gUnknown_083B58C0[] =
{
    {DexText_HoennDex2, DexText_HoennDex},
    {DexText_NationalDex2, DexText_NationalDex},
    {((void *)0), ((void *)0)},
};
static const struct UnknownStruct2 gUnknown_083B58D8[] =
{
    {DexText_ListByNumber, DexText_NumericalMode},
    {DexText_ListByABC2, DexText_ABCMode},
    {DexText_ListByHeavyToLightest, DexText_HeaviestMode},
    {DexText_ListByLightToHeaviest, DexText_LightestMode},
    {DexText_ListByTallToSmallest, DexText_TallestMode},
    {DexText_ListBySmallToTallest, DexText_SmallestMode},
    {((void *)0), ((void *)0)},
};
static const struct UnknownStruct2 gUnknown_083B5910[] =
{
    {DexText_Terminator5, DexText_DontSpecify},
    {DexText_Terminator5, DexText_ABC},
    {DexText_Terminator5, DexText_DEF},
    {DexText_Terminator5, DexText_GHI},
    {DexText_Terminator5, DexText_JKL},
    {DexText_Terminator5, DexText_MNO},
    {DexText_Terminator5, DexText_PQR},
    {DexText_Terminator5, DexText_STU},
    {((void *)0), ((void *)0)},
};
static const struct UnknownStruct2 gUnknown_083B5968[] =
{
    {DexText_Terminator5, DexText_DontSpecify},
    {DexText_Terminator5, DexText_Red},
    {DexText_Terminator5, DexText_Blue},
    {DexText_Terminator5, DexText_Yellow},
    {DexText_Terminator5, DexText_Green},
    {DexText_Terminator5, DexText_Black},
    {DexText_Terminator5, DexText_Brown},
    {DexText_Terminator5, DexText_Purple},
    {DexText_Terminator5, DexText_Gray},
    {DexText_Terminator5, DexText_White},
    {DexText_Terminator5, DexText_Pink},
    {((void *)0), ((void *)0)},
};
static const struct UnknownStruct2 gUnknown_083B59C8[] =
{
    {DexText_Terminator5, DexText_None},
    {DexText_Terminator5, gTypeNames[0x00]},
    {DexText_Terminator5, gTypeNames[0x01]},
    {DexText_Terminator5, gTypeNames[0x02]},
    {DexText_Terminator5, gTypeNames[0x03]},
    {DexText_Terminator5, gTypeNames[0x04]},
    {DexText_Terminator5, gTypeNames[0x05]},
    {DexText_Terminator5, gTypeNames[0x06]},
    {DexText_Terminator5, gTypeNames[0x07]},
    {DexText_Terminator5, gTypeNames[0x08]},
    {DexText_Terminator5, gTypeNames[0x0a]},
    {DexText_Terminator5, gTypeNames[0x0b]},
    {DexText_Terminator5, gTypeNames[0x0c]},
    {DexText_Terminator5, gTypeNames[0x0d]},
    {DexText_Terminator5, gTypeNames[0x0e]},
    {DexText_Terminator5, gTypeNames[0x0f]},
    {DexText_Terminator5, gTypeNames[0x10]},
    {DexText_Terminator5, gTypeNames[0x11]},
    {((void *)0), ((void *)0)},
};
static const u8 gUnknown_083B5A60[] = {0, 1};
static const u8 gUnknown_083B5A62[] = {0, 1, 2, 3, 4, 5};
static const u8 gUnknown_083B5A68[] = {0xFF, 0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17};
static const struct UnknownStruct1 gUnknown_083B5A7C[] =
{
    {gUnknown_083B5910, 6, 7, 8},
    {gUnknown_083B5968, 8, 9, 11},
    {gUnknown_083B59C8, 10, 11, 18},
    {gUnknown_083B59C8, 12, 13, 18},
    {gUnknown_083B58D8, 4, 5, 6},
    {gUnknown_083B58C0, 2, 3, 2},
};
static const u8 gUnknown_083B5AAC[] = _("{STR_VAR_1}{CLEAR_TO 43}");
static const u8 gUnknown_083B5AB2[] = _("{STR_VAR_1}{CLEAR_TO 96}");

static void MainCB(void);
static void Task_PokedexShowMainScreen(u8 taskId);
static void Task_PokedexMainScreen(u8 taskId);
static void sub_808C898(u8 taskId);
static void Task_PokedexMainScreenMenu(u8 taskId);
static void sub_808CA64(u8 taskId);
static void sub_808CAE4(u8 taskId);
static void sub_808CB8C(u8 taskId);
static void Task_ClosePokedex(u8 taskId);
static void sub_808CCC4(u8 taskId);
static void Task_PokedexResultsScreen(u8 taskId);
static void sub_808CEF8(u8 taskId);
static void Task_PokedexResultsScreenMenu(u8 taskId);
static void sub_808D118(u8 taskId);
static void sub_808D198(u8 taskId);
static void Task_PokedexResultsScreenReturnToMainScreen(u8 taskId);
static void Task_PokedexResultsScreenExitPokedex(u8 taskId);
static bool8 sub_808D344(u8 a);
static void sub_808D640(void);
static void SortPokedex(u8 dexMode, u8 sortMode);
static void sub_808DEB0(u16 a, u8 b, u8 c, u16 d);
static void sub_808DF88(u16 a, u8 b, u8 c, u16 d);
static u8 sub_808DFE4(u16 num, u8 b, u8 c);
static void sub_808E090(u8 a, u8 b, u16 c);
static void sub_808E0CC(u16 a, u16 b);
static bool8 sub_808E208(u8 a, u8 b, u8 c);
static u16 sub_808E48C(u16 a, u16 b);
static void sub_808E6BC(void);
static u8 sub_808E71C(void);
static u8 sub_808E82C(void);
static u16 sub_808E888(u16 a1);
static u32 sub_808E8C8(u16 a, s16 b, s16 c);
static void sub_808E978(u8 a);
static void sub_808EDB8(struct Sprite *sprite);
static void sub_808EE28(struct Sprite *sprite);
static u8 sub_808F210(struct PokedexListItem *, u8);
static bool8 sub_808F250(u8 taskId);
static u8 sub_808F284(struct PokedexListItem *, u8);
static void Task_InitPageScreenMultistep(u8 taskId);
static void Task_PageScreenProcessInput(u8 taskId);
static void sub_808F888(u8 taskId);
static void Task_ClosePageScreen(u8 taskId);
static void Task_InitAreaScreenMultistep(u8 taskId);
static void Task_AreaScreenProcessInput(u8 taskId);
static void sub_808FA00(u8 taskId);
static void Task_InitCryScreenMultistep(u8 taskId);
static void Task_CryScreenProcessInput(u8 taskId);
static void sub_808FFBC(u8 taskId);
static void sub_8090040(u8 a);
static void Task_InitSizeScreenMultistep(u8 taskId);
static void Task_SizeScreenProcessInput(u8 taskId);
static void sub_8090498(u8 taskId);
static void sub_80904FC(u16 a);
static void sub_8090540(u16 a);
static void sub_8090584(u8 a, u16 b);
static void sub_8090644(u8 a, u16 b);
static void sub_8090750(u8);
static void sub_8090A3C(u8);
static void sub_8090B8C(u8);
static void sub_8090C28(struct Sprite *);

static void sub_8091060(u16);
static void sub_8091154(u16 order, u8, u8);
static u8 sub_80911C8(u16 num, u8, u8);
static u8 sub_8091260(u16 num, u8, u8, u8);
static void sub_8091304(const u8 *name, u8, u8);
static void sub_8091458(u16 height, u8 i, u8 i1);
static void sub_8091564(u16 weight, u8 i, u8 i1);
static void sub_8091738(u16, u16, u16);
static void sub_80917CC(u16 i, u16 i1);
static u16 sub_8091818(u8, u16, u16, u16);
u16 sub_80918EC(u16 a, s16 b, s16 c, u16 d);
u8 sub_8091A4C(u16 gender, s16, s16, u16);
static void sub_8091E54(u8);
static void sub_809204C(u8);
static void sub_809207C(u8);
static void sub_809217C(u8);
static void sub_80921B0(u8);
static void sub_80923FC(u8);
static void sub_80924A4(u8);
static void sub_8092508(u8);
static void sub_80925CC(u8);
static void sub_8092644(u8);
static void sub_80927B8(u8);
static void sub_80927F0(u8);
static void sub_8092AB0(u8);
static void sub_8092AD4(u8, u8);
static void sub_8092B68(u8);
static void sub_8092C8C(u8);
static void sub_8092D78(u8);
static u8 sub_8092E10(u8, u8);
static void sub_8092EB0(u8);
static void sub_809308C(u8);


void ResetPokedex(void)
{
    u16 i;

    gUnknown_0202FFB8 = 0;
    gUnknown_0202FFBA = 0x40;
    gUnknown_03005CE8 = 0;
    gSaveBlock2.pokedex.unknown1 = 0;
    gSaveBlock2.pokedex.order = 0;
    gSaveBlock2.pokedex.nationalMagic = 0;
    gSaveBlock2.pokedex.unknown2 = 0;
    gSaveBlock2.pokedex.unownPersonality = 0;
    gSaveBlock2.pokedex.spindaPersonality = 0;
    gSaveBlock2.pokedex.unknown3 = 0;
    DisableNationalPokedex();
    for (i = 0; i <= 51; i++)
    {
        gSaveBlock2.pokedex.owned[i] = 0;
        gSaveBlock2.pokedex.seen[i] = 0;
        gSaveBlock1.dexSeen2[i] = 0;
        gSaveBlock1.dexSeen3[i] = 0;
    }
}

void sub_808C0A0(void)
{
    gUnknown_0202FFB8 = 0;
    gUnknown_0202FFBA = 0x40;
}

static void sub_808C0B8(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void ClearPokedexView(struct PokedexView *pokedexView)
{
    u16 i;

    for (i = 0; i < 386; i++)
    {
        pokedexView->unk0[i].dexNum |= 0xFFFF;
        pokedexView->unk0[i].seen = 0;
        pokedexView->unk0[i].owned = 0;
    }
    pokedexView->unk608 = 0;
    pokedexView->unk60A_1 = 0;
    pokedexView->unk60A_2 = 0;
    pokedexView->pokemonListCount = 0;
    pokedexView->selectedPokemon = 0;
    pokedexView->unk610 = 0;
    pokedexView->dexMode = 0;
    pokedexView->unk614 = 0;
    pokedexView->dexOrder = 0;
    pokedexView->unk618 = 0;
    pokedexView->unk61A = 0;
    pokedexView->unk61C = 0;
    for (i = 0; i <= 3; i++)
        pokedexView->unk61E[i] |= 0xFFFF;
    pokedexView->unk628 = 0;
    pokedexView->unk62A = 0;
    pokedexView->unk62C = 0;
    pokedexView->unk62D = 0;
    pokedexView->unk62E = 0;
    pokedexView->unk62F = 0;
    pokedexView->unk630 = 0;
    pokedexView->unk632 = 0;
    pokedexView->unk634 = 0;
    pokedexView->unk636 = 0;
    pokedexView->unk638 = 0;
    for (i = 0; i <= 3; i++)
        pokedexView->unk63A[i] = 0;
    pokedexView->unk64A = 0;
    pokedexView->unk64B = 0;
    pokedexView->unk64C_1 = 0;
    pokedexView->selectedScreen = 0;
    pokedexView->unk64F = 0;
    pokedexView->menuIsOpen = 0;
    pokedexView->menuCursorPos = 0;
    pokedexView->menuY = 0;
    for (i = 0; i <= 7; i++)
        pokedexView->unk656[i] = 0;
    for (i = 0; i <= 7; i++)
        pokedexView->unk65E[i] = 0;
}

void CB2_InitPokedex(void)
{
    switch (gMain.state)
    {
    case 0:
    default:
        {
            u8 *addr;
            u32 size;

            SetVBlankCallback(((void *)0));
            sub_8091060(0);
            addr = (u8 *)0x6000000;
            size = 0x18000;
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
            { vu32 *_dest = (vu32 *)(0x7000000); u32 _size = 0x400; { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((_size)/(32/8))); dmaRegs[2]; }; }; };
            { vu16 *_dest = (vu16 *)(0x5000000); u32 _size = 0x400; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };
            gMain.state = 1;
        }
        break;
    case 1:
        remove_some_task();
        ResetTasks();
        ResetSpriteData();
        ResetPaletteFade();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 8;
        SetUpWindowConfig(&gWindowConfig_81E7048);
        InitMenuWindow(&gWindowConfig_81E7048);
        gMain.state++;
        break;
    case 2:
        switch (Random() & 3)
        {
        case 0:
        default:
            gPokedexView = (struct PokedexView *)(gSharedMem + 0x18000);
            break;
        case 1:
            gPokedexView = (struct PokedexView *)(gSharedMem + 0x18800);
            break;
        case 2:
            gPokedexView = (struct PokedexView *)(gSharedMem + 0x19000);
            break;
        case 3:
            gPokedexView = (struct PokedexView *)(gSharedMem + 0x19800);
            break;
        }
        ClearPokedexView(gPokedexView);
        CreateTask(Task_PokedexShowMainScreen, 0);
        gPokedexView->dexMode = gSaveBlock2.pokedex.unknown1;
        if (!IsNationalPokedexEnabled())
            gPokedexView->dexMode = DEX_MODE_HOENN;
        gPokedexView->dexOrder = gSaveBlock2.pokedex.order;
        gPokedexView->selectedPokemon = gUnknown_0202FFB8;
        gPokedexView->unk62C = gUnknown_0202FFBA;
        gPokedexView->selectedScreen = AREA_SCREEN;
        gPokedexView->descriptionPageNum = 0;
        if (!IsNationalPokedexEnabled())
        {
            gPokedexView->unk61A = GetHoennPokedexCount(0);
            gPokedexView->unk61C = GetHoennPokedexCount(1);
        }
        else
        {
            gPokedexView->unk61A = GetNationalPokedexCount(0);
            gPokedexView->unk61C = GetNationalPokedexCount(1);
        }
        gPokedexView->unk62D = 8;
        gMain.state++;
        break;
    case 3:
        {
            u16 savedIme;

            savedIme = (*(vu16 *)(0x4000000 + 0x208));
            (*(vu16 *)(0x4000000 + 0x208)) = 0;
            (*(vu16 *)(0x4000000 + 0x200)) |= 1;
            (*(vu16 *)(0x4000000 + 0x208)) = savedIme;
            (*(vu16 *)(0x4000000 + 0x4)) |= 8;
            SetVBlankCallback(sub_808C0B8);
            SetMainCallback2(MainCB);
            SortPokedex(gPokedexView->dexMode, gPokedexView->dexOrder);
            m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x80);
        }
        break;
    }
}

u8 unref_sub_808C540(void (*func)(u8))
{
    u16 savedIme;
    u8 taskId;

    SetVBlankCallback(((void *)0));
    sub_8091060(0x200);
    remove_some_task();
    ResetTasks();
    ResetPaletteFade();
    savedIme = (*(vu16 *)(0x4000000 + 0x208));
    (*(vu16 *)(0x4000000 + 0x208)) = 0;
    (*(vu16 *)(0x4000000 + 0x200)) |= 1;
    (*(vu16 *)(0x4000000 + 0x208)) = savedIme;
    (*(vu16 *)(0x4000000 + 0x4)) |= 0x8;
    SetVBlankCallback(sub_808C0B8);
    SetMainCallback2(MainCB);
    if (!gPokedexView->unk64B)
        taskId = CreateTask(sub_808CAE4, 0);
    else
        taskId = CreateTask(sub_808D198, 0);
    gTasks[taskId].data[0] = CreateTask(func, 0);
    return gTasks[taskId].data[0];
}

static void MainCB(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void Task_PokedexShowMainScreen(u8 taskId)
{
    gPokedexView->unk64C_1 = 0;
    if (sub_808D344(0))
        gTasks[taskId].func = Task_PokedexMainScreen;
}


void Task_PokedexMainScreen(u8 taskId)
{
    (*(vu16 *)(0x4000000 + 0x12)) = gPokedexView->menuY;


    if (gPokedexView->menuY)
        gPokedexView->menuY -= 8;
    else
    {
        if ((gMain.newKeys & 0x0001) && gPokedexView->unk0[gPokedexView->selectedPokemon].seen)
        {
            sub_808E6BC();
            BeginNormalPaletteFade(
              ~(1 << (gSprites[gPokedexView->selectedMonSpriteId].oam.paletteNum + 16)),
              0, 0, 0x10, 0);
            gSprites[gPokedexView->selectedMonSpriteId].callback = sub_808EDB8;
            gTasks[taskId].func = sub_808CA64;
            PlaySE(SE_PIN);
        }
        else if (gMain.newKeys & 0x0008)
        {

            gPokedexView->menuY = 0;
            gPokedexView->menuIsOpen = 1;
            gPokedexView->menuCursorPos = 0;
            gTasks[taskId].func = Task_PokedexMainScreenMenu;
            PlaySE(SE_SELECT);
        }
        else if (gMain.newKeys & 0x0004)
        {
            PlaySE(SE_SELECT);
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].data[0] = sub_8091E3C();
            gPokedexView->unk64F = 0;
            gPokedexView->unk62A = gPokedexView->unk62C;
            gPokedexView->unk610 = gPokedexView->selectedPokemon;
            gPokedexView->unk614 = gPokedexView->dexMode;
            gPokedexView->unk618 = gPokedexView->dexOrder;
            gTasks[taskId].func = sub_808CB8C;
            PlaySE(SE_PC_LOGON);
        }
        else if (gMain.newKeys & 0x0002)
        {
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].func = Task_ClosePokedex;
            PlaySE(SE_PC_OFF);
        }
        else
        {

            gPokedexView->selectedPokemon = sub_808E48C(gPokedexView->selectedPokemon, 0xE);
            if (gPokedexView->unk62E)
                gTasks[taskId].func = sub_808C898;
        }
    }
}

static void sub_808C898(u8 taskId)
{
    if (sub_808E208(gPokedexView->unk62F, gPokedexView->unk634, gPokedexView->unk636))
        gTasks[taskId].func = Task_PokedexMainScreen;
}


static void Task_PokedexMainScreenMenu(u8 taskId)
{
    (*(vu16 *)(0x4000000 + 0x12)) = gPokedexView->menuY;


    if (gPokedexView->menuY != 80)
        gPokedexView->menuY += 8;
    else
    {
        if (gMain.newKeys & 0x0001)
        {
            switch (gPokedexView->menuCursorPos)
            {
            case 0:
            default:
                gMain.newKeys |= 0x0008;
                break;
            case 1:
                gPokedexView->selectedPokemon = 0;
                gPokedexView->unk62C = 0x40;
                sub_808E82C();
                sub_808E0CC(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= 0x0008;
                break;
            case 2:
                gPokedexView->selectedPokemon = gPokedexView->pokemonListCount - 1;
                gPokedexView->unk62C = gPokedexView->pokemonListCount * 16 + 0x30;
                sub_808E82C();
                sub_808E0CC(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= 0x0008;
                break;
            case 3:
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                gTasks[taskId].func = Task_ClosePokedex;
                PlaySE(SE_PC_OFF);
                break;
            }
        }


        if (gMain.newKeys & (0x0008 | 0x0002))
        {
            gPokedexView->menuIsOpen = 0;
            gTasks[taskId].func = Task_PokedexMainScreen;
            PlaySE(SE_SELECT);
        }
        else if ((gMain.newAndRepeatedKeys & 0x0040) && gPokedexView->menuCursorPos != 0)
        {
            gPokedexView->menuCursorPos--;
            PlaySE(SE_SELECT);
        }
        else if ((gMain.newAndRepeatedKeys & 0x0080) && gPokedexView->menuCursorPos <= 2)
        {
            gPokedexView->menuCursorPos++;
            PlaySE(SE_SELECT);
        }
    }
}

static void sub_808CA64(u8 taskId)
{
    if (gSprites[gPokedexView->selectedMonSpriteId].pos1.x == 48
     && gSprites[gPokedexView->selectedMonSpriteId].pos1.y == 56)
    {
        gPokedexView->unk64B = gPokedexView->unk64A;
        gTasks[taskId].data[0] = sub_808F210(&gPokedexView->unk0[gPokedexView->selectedPokemon], gPokedexView->selectedMonSpriteId);
        gTasks[taskId].func = sub_808CAE4;
    }
}

static void sub_808CAE4(u8 taskId)
{
    if (gTasks[gTasks[taskId].data[0]].isActive)
    {
        if (gPokedexView->unk64A == 1 && !sub_808F250(gTasks[taskId].data[0]) && sub_808E71C())
            sub_808F284(&gPokedexView->unk0[gPokedexView->selectedPokemon], gTasks[taskId].data[0]);
    }
    else
    {
        gUnknown_0202FFB8 = gPokedexView->selectedPokemon;
        gUnknown_0202FFBA = gPokedexView->unk62C;
        gTasks[taskId].func = Task_PokedexShowMainScreen;
    }
}

static void sub_808CB8C(u8 taskId)
{
    bool8 isActive = gTasks[gTasks[taskId].data[0]].isActive;

    if (!isActive)
    {
        if (gPokedexView->unk64F != 0)
        {
            gPokedexView->selectedPokemon = isActive;
            gPokedexView->unk62C = 0x40;
            gTasks[taskId].func = sub_808CCC4;
        }
        else
        {
            gPokedexView->unk62C = gPokedexView->unk62A;
            gPokedexView->selectedPokemon = gPokedexView->unk610;
            gPokedexView->dexMode = gPokedexView->unk614;
            if (!IsNationalPokedexEnabled())
                gPokedexView->dexMode = DEX_MODE_HOENN;
            gPokedexView->dexOrder = gPokedexView->unk618;
            gTasks[taskId].func = Task_PokedexShowMainScreen;
        }
    }
}

static void Task_ClosePokedex(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gSaveBlock2.pokedex.unknown1 = gPokedexView->dexMode;
        if (!IsNationalPokedexEnabled())
            gSaveBlock2.pokedex.unknown1 = 0;
        gSaveBlock2.pokedex.order = gPokedexView->dexOrder;
        DestroyTask(taskId);
        SetMainCallback2(sub_805469C);
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x100);
    }
}

static void sub_808CCC4(u8 taskId)
{
    gPokedexView->unk64C_1 = 1;
    if (sub_808D344(3))
        gTasks[taskId].func = Task_PokedexResultsScreen;
}

static void Task_PokedexResultsScreen(u8 taskId)
{
    (*(vu16 *)(0x4000000 + 0x12)) = gPokedexView->menuY;

    if (gPokedexView->menuY)
    {
        gPokedexView->menuY -= 8;
    }
    else
    {
        if ((gMain.newKeys & 0x0001) && gPokedexView->unk0[gPokedexView->selectedPokemon].seen)
        {
            u32 a;

            sub_808E6BC();
            a = (1 << (gSprites[gPokedexView->selectedMonSpriteId].oam.paletteNum + 16));
            gSprites[gPokedexView->selectedMonSpriteId].callback = sub_808EDB8;
            BeginNormalPaletteFade(~a, 0, 0, 0x10, 0);
            gTasks[taskId].func = sub_808D118;
            PlaySE(SE_PIN);
        }
        else if (gMain.newKeys & 0x0008)
        {
            gPokedexView->menuY = 0;
            gPokedexView->menuIsOpen = 1;
            gPokedexView->menuCursorPos = 0;
            gTasks[taskId].func = Task_PokedexResultsScreenMenu;
            PlaySE(SE_SELECT);
        }
        else if (gMain.newKeys & 0x0004)
        {
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].data[0] = sub_8091E3C();
            gPokedexView->unk64F = 0;
            gTasks[taskId].func = sub_808CB8C;
            PlaySE(SE_PC_LOGON);
        }
        else if (gMain.newKeys & 0x0002)
        {
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            gTasks[taskId].func = Task_PokedexResultsScreenReturnToMainScreen;
            PlaySE(SE_PC_OFF);
        }
        else
        {

            gPokedexView->selectedPokemon = sub_808E48C(gPokedexView->selectedPokemon, 0xE);
            if (gPokedexView->unk62E)
                gTasks[taskId].func = sub_808CEF8;
        }
    }
}

static void sub_808CEF8(u8 taskId)
{
    if (sub_808E208(gPokedexView->unk62F, gPokedexView->unk634, gPokedexView->unk636))
        gTasks[taskId].func = Task_PokedexResultsScreen;
}

static void Task_PokedexResultsScreenMenu(u8 taskId)
{
    (*(vu16 *)(0x4000000 + 0x12)) = gPokedexView->menuY;

    if (gPokedexView->menuY != 96)
    {
        gPokedexView->menuY += 8;
    }
    else
    {
        if (gMain.newKeys & 0x0001)
        {
            switch (gPokedexView->menuCursorPos)
            {
            case 0:
            default:
                gMain.newKeys |= 0x0008;
                break;
            case 1:
                gPokedexView->selectedPokemon = 0;
                gPokedexView->unk62C = 0x40;
                sub_808E82C();
                sub_808E0CC(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= 0x0008;
                break;
            case 2:
                gPokedexView->selectedPokemon = gPokedexView->pokemonListCount - 1;
                gPokedexView->unk62C = gPokedexView->pokemonListCount * 16 + 0x30;
                sub_808E82C();
                sub_808E0CC(gPokedexView->selectedPokemon, 0xE);
                gMain.newKeys |= 0x0008;
                break;
            case 3:
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                gTasks[taskId].func = Task_PokedexResultsScreenReturnToMainScreen;
                PlaySE(SE_TRACK_DOOR);
                break;
            case 4:
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                gTasks[taskId].func = Task_PokedexResultsScreenExitPokedex;
                PlaySE(SE_PC_OFF);
                break;
            }
        }


        if (gMain.newKeys & (0x0008 | 0x0002))
        {
            gPokedexView->menuIsOpen = 0;
            gTasks[taskId].func = Task_PokedexResultsScreen;
            PlaySE(SE_SELECT);
        }
        else if ((gMain.newAndRepeatedKeys & 0x0040) && gPokedexView->menuCursorPos)
        {
            gPokedexView->menuCursorPos--;
            PlaySE(SE_SELECT);
        }
        else if ((gMain.newAndRepeatedKeys & 0x0080) && gPokedexView->menuCursorPos <= 3)
        {
            gPokedexView->menuCursorPos++;
            PlaySE(SE_SELECT);
        }
    }
}

static void sub_808D118(u8 taskId)
{
    if (gSprites[gPokedexView->selectedMonSpriteId].pos1.x == 48
     && gSprites[gPokedexView->selectedMonSpriteId].pos1.y == 56)
    {
        gPokedexView->unk64B = gPokedexView->unk64A;
        gTasks[taskId].data[0] = sub_808F210(&gPokedexView->unk0[gPokedexView->selectedPokemon], gPokedexView->selectedMonSpriteId);
        gTasks[taskId].func = sub_808D198;
    }
}

static void sub_808D198(u8 taskId)
{
    if (gTasks[gTasks[taskId].data[0]].isActive)
    {
        if (gPokedexView->unk64A == 1 && !sub_808F250(gTasks[taskId].data[0]) && sub_808E71C())
            sub_808F284(&gPokedexView->unk0[gPokedexView->selectedPokemon], gTasks[taskId].data[0]);
    }
    else
    {
        gTasks[taskId].func = sub_808CCC4;
    }
}

static void Task_PokedexResultsScreenReturnToMainScreen(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gPokedexView->unk62C = gPokedexView->unk62A;
        gPokedexView->selectedPokemon = gPokedexView->unk610;
        gPokedexView->dexMode = gPokedexView->unk614;
        if (!IsNationalPokedexEnabled())
            gPokedexView->dexMode = DEX_MODE_HOENN;
        gPokedexView->dexOrder = gPokedexView->unk618;
        gTasks[taskId].func = Task_PokedexShowMainScreen;
    }
}

static void Task_PokedexResultsScreenExitPokedex(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gPokedexView->unk62C = gPokedexView->unk62A;
        gPokedexView->selectedPokemon = gPokedexView->unk610;
        gPokedexView->dexMode = gPokedexView->unk614;
        if (!IsNationalPokedexEnabled())
            gPokedexView->dexMode = DEX_MODE_HOENN;
        gPokedexView->dexOrder = gPokedexView->unk618;
        gTasks[taskId].func = Task_ClosePokedex;
    }
}

static bool8 sub_808D344(u8 a)
{
    switch (gMain.state)
    {
    case 0:
    default:
        if (gPaletteFade.active)
            return 0;
        SetVBlankCallback(((void *)0));
        gPokedexView->unk64A = a;
        sub_8091060(0);
        (*(vu16 *)(0x4000000 + 0x1a)) = gPokedexView->unk62D;
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)(0x6000000));
        LZ77UnCompVram(gUnknown_08E96738, (void *)(0x6000000 + 0x6800));
        LZ77UnCompVram(gUnknown_08E9C6DC, (void *)(0x6000000 + 0x7800));
        { vu16 *_dest = (vu16 *)(0x6000000 + 0x6000); u32 _size = 0x500; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };
        if (a == 0)
            LZ77UnCompVram(gUnknown_08E96888, (void *)(0x6000000 + 0x6500));
        else
            LZ77UnCompVram(gUnknown_08E96994, (void *)(0x6000000 + 0x6500));
        ResetPaletteFade();
        if (a == 0)
            gPokedexView->unk64C_1 = 0;
        else
            gPokedexView->unk64C_1 = 1;
        sub_808D640();
        gMain.state = 1;
        break;
    case 1:
        ResetSpriteData();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 8;
        LoadCompressedObjectPic(&gUnknown_083A05CC[0]);
        LoadSpritePalettes(gUnknown_083A05DC);
        sub_808E978(a);
        gMain.state++;
        break;
    case 2:
        SetUpWindowConfig(&gWindowConfig_81E7048);
        InitMenuWindow(&gWindowConfig_81E7048);
        LZ77UnCompVram(gUnknown_0839FA7C, (void *)(0x6000000 + 0xFF80));
        gMain.state++;
        break;
    case 3:
        if (a == 0)
            SortPokedex(gPokedexView->dexMode, gPokedexView->dexOrder);
        sub_808E0CC(gPokedexView->selectedPokemon, 0xE);
        gPokedexView->menuIsOpen = 0;
        gPokedexView->menuY = 0;
        gMain.state++;
        break;
    case 4:
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        SetVBlankCallback(sub_808C0B8);
        gMain.state++;
        break;
    case 5:
        (*(vu16 *)(0x4000000 + 0x48)) = 0x3F3F;
        (*(vu16 *)(0x4000000 + 0x4a)) = 0x1D3F;
        (*(vu16 *)(0x4000000 + 0x40)) = 0;
        (*(vu16 *)(0x4000000 + 0x44)) = 0;
        (*(vu16 *)(0x4000000 + 0x42)) = 0;
        (*(vu16 *)(0x4000000 + 0x46)) = 0;
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x52)) = 0;
        (*(vu16 *)(0x4000000 + 0x54)) = 0;
        (*(vu16 *)(0x4000000 + 0xe)) = (3) | ((0) << 2) | ((15) << 8) | 0x0000 | 0x0000;
        (*(vu16 *)(0x4000000 + 0xa)) = (1) | ((0) << 2) | ((13) << 8) | 0x0000 | 0x0000;
        (*(vu16 *)(0x4000000 + 0x8)) = (0) | ((0) << 2) | ((12) << 8) | 0x0000 | 0x0000;
        (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0F00 | 0x1000 | 0x8000;
        gMain.state++;
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            gMain.state = 0;
            return 1;
        }
        break;
    }
    return 0;
}

static void sub_808D640(void)
{
    if (gPokedexView->unk64C_1)
        LoadPalette(sPokedexSearchPalette + 1, 1, sizeof(sPokedexSearchPalette) - sizeof(u16));
    else if (!IsNationalPokedexEnabled())
        LoadPalette(gPokedexMenu_Pal + 1, 1, 0xBE);
    else
        LoadPalette(sNationalPokedexPalette + 1, 1, sizeof(sNationalPokedexPalette) - sizeof(u16));
}

static void SortPokedex(u8 dexMode, u8 sortMode)
{
    u16 vars[3];
    s16 i;

    gPokedexView->pokemonListCount = 0;

    switch (dexMode)
    {
    default:
    case DEX_MODE_HOENN:
        vars[0] = 202;
        vars[1] = 1;
        break;
    case DEX_MODE_NATIONAL:
        if (IsNationalPokedexEnabled())
        {
            vars[0] = 386;
            vars[1] = 0;
        }
        else
        {
            vars[0] = 202;
            vars[1] = 1;
        }
        break;
    }

    switch (sortMode)
    {
    case 0:
        if (vars[1])
        {
            for (i = 0; i < vars[0]; i++)
            {
                vars[2] = HoennToNationalOrder(i + 1);
                gPokedexView->unk0[i].dexNum = vars[2];
                gPokedexView->unk0[i].seen = GetSetPokedexFlag(vars[2], 0);
                gPokedexView->unk0[i].owned = GetSetPokedexFlag(vars[2], 1);
                if (gPokedexView->unk0[i].seen)
                    gPokedexView->pokemonListCount = i + 1;
            }
        }
        else
        {
            bool32 r10;
            s16 r5;

            r10 = r5 = i = 0;
            for (i = 0; i < vars[0]; i++)
            {
                vars[2] = i + 1;
                if (GetSetPokedexFlag(vars[2], 0))
                    r10 = 1;
                if (r10)
                {
                    asm("");
                    gPokedexView->unk0[r5].dexNum = vars[2];
                    gPokedexView->unk0[r5].seen = GetSetPokedexFlag(vars[2], 0);
                    gPokedexView->unk0[r5].owned = GetSetPokedexFlag(vars[2], 1);
                    if (gPokedexView->unk0[r5].seen)
                        gPokedexView->pokemonListCount = r5 + 1;
                    r5++;
                }
            }
        }
        break;
    case 1:
        for (i = 0; i < 411; i++)
        {
            vars[2] = gPokedexOrder_Alphabetical[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && GetSetPokedexFlag(vars[2], 0))
            {
                gPokedexView->unk0[gPokedexView->pokemonListCount].dexNum = vars[2];
                gPokedexView->unk0[gPokedexView->pokemonListCount].seen = 1;
                gPokedexView->unk0[gPokedexView->pokemonListCount].owned = GetSetPokedexFlag(vars[2], 1);
                gPokedexView->pokemonListCount++;
            }
        }
        break;
    case 2:
        for (i = 386 - 1; i >= 0; i--)
        {
            vars[2] = gPokedexOrder_Weight[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && GetSetPokedexFlag(vars[2], 1))
            {
                gPokedexView->unk0[gPokedexView->pokemonListCount].dexNum = vars[2];
                gPokedexView->unk0[gPokedexView->pokemonListCount].seen = 1;
                gPokedexView->unk0[gPokedexView->pokemonListCount].owned = 1;
                gPokedexView->pokemonListCount++;
            }
        }
        break;
    case 3:
        for (i = 0; i < 386; i++)
        {
            vars[2] = gPokedexOrder_Weight[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && GetSetPokedexFlag(vars[2], 1))
            {
                gPokedexView->unk0[gPokedexView->pokemonListCount].dexNum = vars[2];
                gPokedexView->unk0[gPokedexView->pokemonListCount].seen = 1;
                gPokedexView->unk0[gPokedexView->pokemonListCount].owned = 1;
                gPokedexView->pokemonListCount++;
            }
        }
        break;
    case 4:
        for (i = 386 - 1; i >=0; i--)
        {
            vars[2] = gPokedexOrder_Height[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && GetSetPokedexFlag(vars[2], 1))
            {
                gPokedexView->unk0[gPokedexView->pokemonListCount].dexNum = vars[2];
                gPokedexView->unk0[gPokedexView->pokemonListCount].seen = 1;
                gPokedexView->unk0[gPokedexView->pokemonListCount].owned = 1;
                gPokedexView->pokemonListCount++;
            }
        }
        break;
    case 5:
        for (i = 0; i < 386; i++)
        {
            vars[2] = gPokedexOrder_Height[i];

            if (NationalToHoennOrder(vars[2]) <= vars[0] && GetSetPokedexFlag(vars[2], 1))
            {
                gPokedexView->unk0[gPokedexView->pokemonListCount].dexNum = vars[2];
                gPokedexView->unk0[gPokedexView->pokemonListCount].seen = 1;
                gPokedexView->unk0[gPokedexView->pokemonListCount].owned = 1;
                gPokedexView->pokemonListCount++;
            }
        }
        break;
    }

    for (i = gPokedexView->pokemonListCount; i < 386; i++)
    {
        gPokedexView->unk0[i].dexNum |= 0xFFFF;
        gPokedexView->unk0[i].seen = 0;
        gPokedexView->unk0[i].owned = 0;
    }
}

static void sub_808DBE8(u8 a, u16 b, u16 c)
{
    s16 _b;
    u16 i;
    u16 r2;

    switch (a)
    {
    case 0:
    default:
        _b = b - 5;
        for (i = 0; i <= 10; i++)
        {
            if (_b < 0 || _b >= 386 || gPokedexView->unk0[_b].dexNum == 0xFFFF)
            {
                sub_808E090(0x11, i * 2, c);
            }
            else
            {
                sub_808E090(0x11, i * 2, c);
                if (gPokedexView->unk0[_b].seen)
                {
                    sub_808DEB0(_b, 0x12, i * 2, c);
                    sub_808DF88(gPokedexView->unk0[_b].owned, 0x11, i * 2, c);
                    sub_808DFE4(gPokedexView->unk0[_b].dexNum, 0x17, i * 2);
                }
                else
                {
                    sub_808DEB0(_b, 0x12, i * 2, c);
                    sub_808DF88(0, 0x11, i * 2, c);
                    sub_808DFE4(0, 0x17, i * 2);
                }
            }
            _b++;
        }
        break;
    case 1:
        _b = b - 5;
        if (_b < 0 || _b >= 386 || gPokedexView->unk0[_b].dexNum == 0xFFFF)
        {
            sub_808E090(0x11, gPokedexView->unk630 * 2, c);
        }
        else
        {
            sub_808E090(0x11, gPokedexView->unk630 * 2, c);
            if (gPokedexView->unk0[_b].seen)
            {
                sub_808DEB0(_b, 0x12, gPokedexView->unk630 * 2, c);
                sub_808DF88(gPokedexView->unk0[_b].owned, 0x11, gPokedexView->unk630 * 2, c);
                sub_808DFE4(gPokedexView->unk0[_b].dexNum, 0x17, gPokedexView->unk630 * 2);
            }
            else
            {
                sub_808DEB0(_b, 0x12, gPokedexView->unk630 * 2, c);
                sub_808DF88(0, 0x11, gPokedexView->unk630 * 2, c);
                sub_808DFE4(0, 0x17, gPokedexView->unk630 * 2);
            }
        }
        break;
    case 2:
        _b = b + 5;
        r2 = gPokedexView->unk630 + 10;
        if (r2 > 15)
            r2 -= 16;
        if (_b < 0 || _b >= 386 || gPokedexView->unk0[_b].dexNum == 0xFFFF)
            sub_808E090(0x11, r2 * 2, c);
        else
        {
            sub_808E090(0x11, r2 * 2, c);
            if (gPokedexView->unk0[_b].seen)
            {
                sub_808DEB0(_b, 0x12, r2 * 2, c);
                sub_808DF88(gPokedexView->unk0[_b].owned, 0x11, r2 * 2, c);
                sub_808DFE4(gPokedexView->unk0[_b].dexNum, 0x17, r2 * 2);
            }
            else
            {
                sub_808DEB0(_b, 0x12, r2 * 2, c);
                sub_808DF88(0, 0x11, r2 * 2, c);
                sub_808DFE4(0, 0x17, r2 * 2);
            }
        }
        break;
    }
}

static void sub_808DEB0(u16 a, u8 b, u8 c, u16 d)
{
    u8 text[4];
    u16 unk[2];
    u16 r7 = gPokedexView->unk0[a].dexNum;

    if (gPokedexView->dexMode == DEX_MODE_HOENN)
        r7 = NationalToHoennOrder(r7);
    unk[0] = 0x3FC;
    unk[1] = 0x3FD;
    text[0] = 0xA1 + r7 / 100;
    text[1] = 0xA1 + (r7 % 100) / 10;
    text[2] = 0xA1 + (r7 % 100) % 10;
    text[3] = 0xFF;
    *(u16 *)(0x6000000 + d * 0x800 + c * 0x40 + b * 2) = unk[0];
    *(u16 *)(0x6000000 + d * 0x800 + (c + 1) * 0x40 + b * 2) = unk[1];
    MenuPrint(text, b - 15, c);
}

static void sub_808DF88(u16 a, u8 b, u8 c, u16 d)
{
    u16 unk[2];

    if (a)
    {
        unk[0] = 0x3FE;
        unk[1] = 0x3FF;
    }
    else
    {
        unk[0] = 0;
        unk[1] = 0;
    }
    *(u16 *)(0x6000000 + d * 0x800 + c * 0x40 + b * 2) = unk[0];
    *(u16 *)(0x6000000 + d * 0x800 + (c + 1) * 0x40 + b * 2) = unk[1];
}

static u8 sub_808DFE4(u16 num, u8 b, u8 c)
{
    u8 text[10];
    u8 i;

    for (i = 0; i < 10; i++)
        text[i] = 0x00;
    text[i] = 0xFF;

    num = NationalPokedexNumToSpecies(num);
    switch (num)
    {
    default:
        for (i = 0; gSpeciesNames[num][i] != 0xFF && i < 10; i++)
            text[i] = gSpeciesNames[num][i];
        break;
    case 0:
        for (i = 0; i < 10; i++)
            text[i] = 0xAE;
        break;
    }
    MenuPrint_PixelCoords(text, 48, c * 8, 0);
    return i;
}

static void sub_808E090(u8 a, u8 b, u16 c)
{
    u8 i;

    for (i = 0; i < 12; i++)
    {
        *(u16 *)(0x6000000 + c * 0x800 + b * 64 + (a + i) * 2) = 0;
        *(u16 *)(0x6000000 + c * 0x800 + (b + 1) * 64 + (a + i) * 2) = 0;
    }
}

static void sub_808E0CC(u16 a, u16 b)
{
    u8 i;
    u16 unk;
    u8 spriteId;

    for (i = 0; i < 4; i++)
        gPokedexView->unk61E[i] = 0xFFFF;
    gPokedexView->selectedMonSpriteId = 0xFFFF;
    sub_808DBE8(0, a, b);
    (*(vu16 *)(0x4000000 + 0x1a)) = gPokedexView->unk62D;

    unk = sub_808E888(a - 1);
    if (unk != 0xFFFF)
    {
        spriteId = sub_808E8C8(unk, 0x60, 0x50);
        gSprites[spriteId].callback = sub_808EE28;
        gSprites[spriteId].data[5] = -32;
    }

    unk = sub_808E888(a);
    if (unk != 0xFFFF)
    {
        spriteId = sub_808E8C8(unk, 0x60, 0x50);
        gSprites[spriteId].callback = sub_808EE28;
        gSprites[spriteId].data[5] = 0;
    }

    unk = sub_808E888(a + 1);
    if (unk != 0xFFFF)
    {
        spriteId = sub_808E8C8(unk, 0x60, 0x50);
        gSprites[spriteId].callback = sub_808EE28;
        gSprites[spriteId].data[5] = 32;
    }

    gPokedexView->unk630 = 0;
    gPokedexView->unk632 = 0;
}

static bool8 sub_808E208(u8 a, u8 b, u8 c)
{
    u16 i;
    u8 foo;

    if (gPokedexView->unk62E)
    {
        gPokedexView->unk62E--;
        switch (a)
        {
        case 1:
            for (i = 0; i < 4; i++)
            {
                if (gPokedexView->unk61E[i] != 0xFFFF)
                    gSprites[gPokedexView->unk61E[i]].data[5] += b;
            }
            foo = 16 * (c - gPokedexView->unk62E) / c;
            (*(vu16 *)(0x4000000 + 0x1a)) = gPokedexView->unk62D + gPokedexView->unk632 * 16 - foo;
            gPokedexView->unk62C -= gPokedexView->unk628;
            break;
        case 2:
            for (i = 0; i < 4; i++)
            {
                if (gPokedexView->unk61E[i] != 0xFFFF)
                    gSprites[gPokedexView->unk61E[i]].data[5] -= b;
            }
            foo = 16 * (c - gPokedexView->unk62E) / c;
            (*(vu16 *)(0x4000000 + 0x1a)) = gPokedexView->unk62D + gPokedexView->unk632 * 16 + foo;
            gPokedexView->unk62C += gPokedexView->unk628;
            break;
        }
        return 0;
    }
    else
    {
        (*(vu16 *)(0x4000000 + 0x1a)) = gPokedexView->unk62D + gPokedexView->unk630 * 16;
        return 1;
    }
}

static void sub_808E398(u8 a, u16 b)
{
    u16 unk;
    u8 spriteId;

    gPokedexView->unk632 = gPokedexView->unk630;
    switch (a)
    {
    case 1:
        unk = sub_808E888(b - 1);
        if (unk != 0xFFFF)
        {
            spriteId = sub_808E8C8(unk, 0x60, 0x50);
            gSprites[spriteId].callback = sub_808EE28;
            gSprites[spriteId].data[5] = -64;
        }
        if (gPokedexView->unk630 > 0)
            gPokedexView->unk630--;
        else
            gPokedexView->unk630 = 15;
        break;
    case 2:
        unk = sub_808E888(b + 1);
        if (unk != 0xFFFF)
        {
            spriteId = sub_808E8C8(unk, 0x60, 0x50);
            gSprites[spriteId].callback = sub_808EE28;
            gSprites[spriteId].data[5] = 0x40;
        }
        if (gPokedexView->unk630 <= 0xE)
            gPokedexView->unk630++;
        else
            gPokedexView->unk630 = 0;
        break;
    }
}


static u16 sub_808E48C(u16 a, u16 b)
{
    u8 r3;
    u8 r5;
    u8 i;
    u16 r6;
    u8 r10 = 0;

    if (!((gMain.heldKeys & 0x40) && (a > 0)))
    {

        if (!((gMain.heldKeys & 0x80) && (a < gPokedexView->pokemonListCount - 1)))

        {
            if ((gMain.newKeys & 0x20) && (a > 0))
            {
                r6 = a;

                for (i = 0; i < 7; i++)
                    a = sub_8091818(1, a, 0, gPokedexView->pokemonListCount - 1);
                gPokedexView->unk62C += 16 * (a - r6);
                sub_808E82C();
                sub_808E0CC(a, 0xE);
                PlaySE(0x6D);
            }

            else if ((gMain.newKeys & 0x10) && (a < gPokedexView->pokemonListCount - 1))
            {
                r6 = a;
                for (i = 0; i < 7; i++)
                    a = sub_8091818(0, a, 0, gPokedexView->pokemonListCount - 1);
                gPokedexView->unk62C += (a - r6) * 16;
                sub_808E82C();
                sub_808E0CC(a, 0xE);
                PlaySE(0x6D);
            }
          _0808E5A2:
            if (r10 == 0)
            {
                gPokedexView->unk638 = 0;
                return a;
            }
        }
        else
        {

            r10 = 2;
            a = sub_8091818(0, a, 0, gPokedexView->pokemonListCount - 1);
            sub_808E398(2, a);

            sub_808DBE8(2, a, b);
            PlaySE(0x6C);
            goto _0808E5A2;
        }
    }
    else
    {

        r10 = 1;
        a = sub_8091818(1, a, 0, gPokedexView->pokemonListCount - 1);
        sub_808E398(1, a);

        sub_808DBE8(1, a, b);
        PlaySE(0x6C);
        goto _0808E5A2;
    }

    r5 = gUnknown_083A05EC[gPokedexView->unk638 / 4];
    r3 = gUnknown_083A05F1[gPokedexView->unk638 / 4];
    gPokedexView->unk62E = r3;
    gPokedexView->unk636 = r3;
    gPokedexView->unk634 = r5;
    gPokedexView->unk62F = r10;
    gPokedexView->unk628 = r5 / 2;
    sub_808E208(gPokedexView->unk62F, gPokedexView->unk634, gPokedexView->unk636);
    if (gPokedexView->unk638 <= 0xB)
        gPokedexView->unk638++;
    return a;
}

static void sub_808E6BC(void)
{
    u16 i;

    for (i = 0; i < 4; i++)
    {
        u16 spriteId = gPokedexView->unk61E[i];

        if (gSprites[spriteId].pos2.x == 0 && gSprites[spriteId].pos2.y == 0 && spriteId != 0xFFFF)
            gPokedexView->selectedMonSpriteId = spriteId;
    }
}

static u8 sub_808E71C(void)
{
    u16 r2;
    u16 r4 = gPokedexView->selectedPokemon;

    if ((gMain.newKeys & 0x0040) && r4)
    {
        r2 = r4;
        while (r2 != 0)
        {
            r2 = sub_8091818(1, r2, 0, gPokedexView->pokemonListCount - 1);

            if (gPokedexView->unk0[r2].seen)
            {
                r4 = r2;
                break;
            }
        }

        if (gPokedexView->selectedPokemon == r4)
            return 0;
        else
        {
            gPokedexView->selectedPokemon = r4;
            gPokedexView->unk62C -= 16;
            return 1;
        }
    }
    else if ((gMain.newKeys & 0x0080) && r4 < gPokedexView->pokemonListCount - 1)
    {
        r2 = r4;
        while (r2 < gPokedexView->pokemonListCount - 1)
        {
            r2 = sub_8091818(0, r2, 0, gPokedexView->pokemonListCount - 1);

            if (gPokedexView->unk0[r2].seen)
            {
                r4 = r2;
                break;
            }
        }

        if (gPokedexView->selectedPokemon == r4)
            return 0;
        else
        {
            gPokedexView->selectedPokemon = r4;
            gPokedexView->unk62C += 16;
            return 1;
        }
    }
    return 0;
}

static u8 sub_808E82C(void)
{
    u16 i;

    for (i = 0; i < 4; i++)
    {
        if (gPokedexView->unk61E[i] != 0xFFFF)
        {
            DestroySprite(&gSprites[gPokedexView->unk61E[i]]);
            gPokedexView->unk61E[i] |= 0xFFFF;
        }
    }
    return 0;
}

static u16 sub_808E888(u16 a1)
{
    if (a1 >= 386 || gPokedexView->unk0[a1].dexNum == 0xFFFF)
        return 0xFFFF;
    else if (gPokedexView->unk0[a1].seen)
        return gPokedexView->unk0[a1].dexNum;
    else
        return 0;
}

static u32 sub_808E8C8(u16 a, s16 b, s16 c)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (gPokedexView->unk61E[i] == 0xFFFF)
        {
            u8 spriteId = sub_80918EC(a, b, c, i);

            gSprites[spriteId].oam.affineMode = 1;
            gSprites[spriteId].oam.priority = 3;
            gSprites[spriteId].data[0] = 0;
            gSprites[spriteId].data[1] = i;
            gSprites[spriteId].data[2] = NationalPokedexNumToSpecies(a);
            gPokedexView->unk61E[i] = spriteId;
            return spriteId;
        }
    }
    return 0xFFFF;
}

static void sub_808E978(u8 a)
{
    u8 spriteId;
    u16 r5;

    spriteId = CreateSprite(&gSpriteTemplate_83A053C, 184, 4, 0);
    gSprites[spriteId].data[1] = 0;

    spriteId = CreateSprite(&gSpriteTemplate_83A053C, 184, 156, 0);
    gSprites[spriteId].data[1] = 1;
    gSprites[spriteId].vFlip = 1;

    CreateSprite(&gSpriteTemplate_83A0524, 234, 20, 0);
    CreateSprite(&gSpriteTemplate_83A0554, 16, 138, 0);

    spriteId = CreateSprite(&gSpriteTemplate_83A0554, 48, 138, 0);
    StartSpriteAnim(&gSprites[spriteId], 3);

    spriteId = CreateSprite(&gSpriteTemplate_83A0554, 16, 158, 0);
    StartSpriteAnim(&gSprites[spriteId], 2);
    gSprites[spriteId].data[2] = 0x80;

    spriteId = CreateSprite(&gSpriteTemplate_83A0554, 48, 158, 0);
    StartSpriteAnim(&gSprites[spriteId], 1);

    spriteId = CreateSprite(&gSpriteTemplate_83A056C, 0, 80, 2);
    gSprites[spriteId].oam.affineMode = 1;
    gSprites[spriteId].oam.matrixNum = 30;
    gSprites[spriteId].data[0] = 0x1E;
    gSprites[spriteId].data[1] = 0;

    spriteId = CreateSprite(&gSpriteTemplate_83A056C, 0, 80, 2);
    gSprites[spriteId].oam.affineMode = 1;
    gSprites[spriteId].oam.matrixNum = 31;
    gSprites[spriteId].data[0] = 0x1F;
    gSprites[spriteId].data[1] = 0x80;

    if (a == 0)
    {
        u32 _a;

        CreateSprite(&gSpriteTemplate_83A0584, 32, 40, 1);

        spriteId = CreateSprite(&gSpriteTemplate_83A0584, 32, 72, 1);
        StartSpriteAnim(&gSprites[spriteId], 1);
        _a = 0;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 28, 48, 1);
        r5 = gPokedexView->unk61A / 100;
        StartSpriteAnim(&gSprites[spriteId], r5);
        if (r5 != 0)
            _a = 1;
        else
            gSprites[spriteId].invisible = 1;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 34, 48, 1);
        r5 = (gPokedexView->unk61A % 100) / 10;
        if (r5 != 0 || _a != 0)
            StartSpriteAnim(&gSprites[spriteId], r5);
        else
            gSprites[spriteId].invisible = 1;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 40, 48, 1);
        r5 = (gPokedexView->unk61A % 100) % 10;
        StartSpriteAnim(&gSprites[spriteId], r5);
        _a = 0;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 28, 80, 1);
        r5 = gPokedexView->unk61C / 100;
        StartSpriteAnim(&gSprites[spriteId], r5);
        if (r5 != 0)
            _a = 1;
        else
            gSprites[spriteId].invisible = 1;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 34, 80, 1);
        r5 = (gPokedexView->unk61C % 100) / 10;
        if (r5 != 0 || _a != 0)
            StartSpriteAnim(&gSprites[spriteId], r5);
        else
            gSprites[spriteId].invisible = 1;

        spriteId = CreateSprite(&gSpriteTemplate_83A059C, 40, 80, 1);
        r5 = (gPokedexView->unk61C % 100) % 10;
        StartSpriteAnim(&gSprites[spriteId], r5);

        spriteId = CreateSprite(&gSpriteTemplate_83A05B4, 140, 96, 1);
        gSprites[spriteId].invisible = 1;
    }
    else
    {
        spriteId = CreateSprite(&gSpriteTemplate_83A05B4, 140, 80, 1);
        gSprites[spriteId].invisible = 1;
    }
}

static void nullsub_58(struct Sprite *sprite)
{
}

static void sub_808ED94(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0)
        DestroySprite(sprite);
}


static void sub_808EDB8(struct Sprite *sprite)
{
    sprite->oam.priority = 0;
    sprite->oam.affineMode = 0;
    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
    if (sprite->pos1.x != 48 || sprite->pos1.y != 56)
    {
        if (sprite->pos1.x > 48)
            sprite->pos1.x--;
        if (sprite->pos1.x < 48)
            sprite->pos1.x++;

        if (sprite->pos1.y > 56)
            sprite->pos1.y--;
        if (sprite->pos1.y < 56)
            sprite->pos1.y++;
    }
    else
    {
        sprite->callback = nullsub_58;
    }
}

static void sub_808EE28(struct Sprite *sprite)
{
    u8 data1 = sprite->data[1];

    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
    {
        DestroySprite(sprite);
        gPokedexView->unk61E[data1] = 0xFFFF;
    }
    else
    {
        u32 var;

        sprite->pos2.y = gSineTable[(u8)sprite->data[5]] * 76 / 256;
        var = 0x10000 / gSineTable[sprite->data[5] + 0x40];
        if (var > 0xFFFF)
            var = 0xFFFF;
        SetOamMatrix(sprite->data[1] + 1, 0x100, 0, 0, var);
        sprite->oam.matrixNum = data1 + 1;

        if (sprite->data[5] > -64 && sprite->data[5] < 64)
        {
            sprite->invisible = 0;
            sprite->data[0] = 1;
        }
        else
        {
            sprite->invisible = 1;
        }

        if ((sprite->data[5] <= -64 || sprite->data[5] >= 64) && sprite->data[0] != 0)
        {
            DestroySprite(sprite);
            gPokedexView->unk61E[data1] = 0xFFFF;
        }
    }
}

static void sub_808EF38(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
        DestroySprite(sprite);
    else
        sprite->pos2.y = gPokedexView->selectedPokemon * 120 / (gPokedexView->pokemonListCount - 1);
}

static void sub_808EF8C(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
    {
        DestroySprite(sprite);
    }
    else
    {
        u8 r0;

        if (sprite->data[1] != 0)
        {
            if (gPokedexView->selectedPokemon == gPokedexView->pokemonListCount - 1)
                sprite->invisible = 1;
            else
                sprite->invisible = 0;
            r0 = sprite->data[2];
        }
        else
        {
            if (gPokedexView->selectedPokemon == 0)
                sprite->invisible = 1;
            else
                sprite->invisible = 0;
            r0 = sprite->data[2] - 128;
        }
        sprite->pos2.y = gSineTable[r0] / 64;
        sprite->data[2] = sprite->data[2] + 8;
        if (gPokedexView->menuIsOpen == 0 && gPokedexView->menuY == 0 && sprite->invisible == 0)
            sprite->invisible = 0;
        else
            sprite->invisible = 1;
    }
}

static void sub_808F08C(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
        DestroySprite(sprite);
}

static void sub_808F0B4(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
    {
        DestroySprite(sprite);
    }
    else
    {
        u8 val;
        s16 r3;
        s16 r0;

        val = gPokedexView->unk62C + sprite->data[1];
        r3 = gSineTable[val];
        r0 = gSineTable[val + 0x40];
        SetOamMatrix(sprite->data[0], r0, r3, -r3, r0);

        val = gPokedexView->unk62C + (sprite->data[1] + 0x40);
        r3 = gSineTable[val];
        r0 = gSineTable[val + 0x40];
        sprite->pos2.x = r0 * 40 / 256;
        sprite->pos2.y = r3 * 40 / 256;
    }
}

static void sub_808F168(struct Sprite *sprite)
{
    if (gPokedexView->unk64A != 0 && gPokedexView->unk64A != 3)
    {
        DestroySprite(sprite);
    }
    else
    {
        u16 r1 = gPokedexView->unk64A == 0 ? 80 : 96;

        if (gPokedexView->menuIsOpen != 0 && gPokedexView->menuY == r1)
        {
            sprite->invisible = 0;
            sprite->pos2.y = gPokedexView->menuCursorPos * 16;
            sprite->pos2.x = gSineTable[(u8)sprite->data[2]] / 64;
            sprite->data[2] += 8;
        }
        else
        {
            sprite->invisible = 1;
        }
    }
}

static u8 sub_808F210(struct PokedexListItem *item, u8 b)
{
    u8 taskId;

    gUnknown_0202FFBC = item;
    taskId = CreateTask(Task_InitPageScreenMultistep, 0);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 1;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    gTasks[taskId].data[4] = b;
    return taskId;
}

static bool8 sub_808F250(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0 && gTasks[taskId].func == Task_PageScreenProcessInput)
        return 0;
    else
        return 1;
}

static u8 sub_808F284(struct PokedexListItem *item, u8 b)
{
    gUnknown_0202FFBC = item;
    gTasks[b].data[0] = 1;
    gTasks[b].data[1] = 0;
    gTasks[b].data[2] = 0;
    gTasks[b].data[3] = 0;
    return b;
}



static void Task_InitPageScreenMultistep(u8 taskId)
{
 u8 TextHeight[] = _("키");
 u8 TextWeight[] = _("몸무게");

    switch (gMain.state)
    {
    case 0:
    default:
        if (!gPaletteFade.active)
        {
            u16 r2;

            gPokedexView->unk64A = 1;
            gPokedexView->descriptionPageNum = 0;
            gUnknown_03005CEC = gMain.vblankCallback;
            SetVBlankCallback(((void *)0));
            r2 = 0;
            if (gTasks[taskId].data[1] != 0)
                r2 += 0x1000;
            if (gTasks[taskId].data[2] != 0)
                r2 |= 0x200;
            sub_8091060(r2);
            gMain.state = 1;
        }
        break;
    case 1:
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)0x6000000);
        LZ77UnCompVram(gUnknown_08E96BD4, (void *)(0x6000000 + 0x7800));
        sub_8091738(gUnknown_0202FFBC->dexNum, 2, 0x3FC);
        gMain.state++;
        break;
    case 2:
        sub_80904FC(0xD);
        sub_8090584(gPokedexView->selectedScreen, 0xD);
        sub_808D640();
        gMain.state++;
        break;
    case 3:
        SetUpWindowConfig(&gWindowConfig_81E7064);
        InitMenuWindow(&gWindowConfig_81E7064);
        gMain.state++;
        break;
    case 4:
        if (gPokedexView->dexMode == DEX_MODE_HOENN)
            sub_8091154(NationalToHoennOrder(gUnknown_0202FFBC->dexNum), 0xD, 3);
        else
            sub_8091154(gUnknown_0202FFBC->dexNum, 0xD, 3);
        sub_80911C8(gUnknown_0202FFBC->dexNum, 0x10, 3);
        MenuPrint(gDexText_UnknownPoke, (11), 5);
        MenuPrint(TextHeight, 12, 7);
        MenuPrint(TextWeight, 12, 9);
        MenuPrint(gDexText_UnknownHeight, 17, 7);
        MenuPrint(gDexText_UnknownWeight, 17, 9);
        if (gUnknown_0202FFBC->owned)
        {
            sub_8091304(gPokedexEntries[gUnknown_0202FFBC->dexNum].categoryName, (11), 5);
            sub_8091458(gPokedexEntries[gUnknown_0202FFBC->dexNum].height, 21, 7);
            sub_8091564(gPokedexEntries[gUnknown_0202FFBC->dexNum].weight, 21, 9);
            SetCustomFont(2);
   MenuPrint(gPokedexEntries[gUnknown_0202FFBC->dexNum].descriptionPage1, 3, 13);
            SetCustomFont(0);
   sub_80917CC(14, 0x3FC);
        }
        else
        {
            MenuPrint(gUnknown_083A05F8, 2, 13);
            LoadPalette(gPlttBufferUnfaded + 1, 0x31, 0x1E);
        }
        gMain.state++;
        break;
    case 5:
        if (gTasks[taskId].data[1] == 0)
        {
            gTasks[taskId].data[4] = (u16)sub_80918EC(gUnknown_0202FFBC->dexNum, 0x30, 0x38, 0);
            gSprites[gTasks[taskId].data[4]].oam.priority = 0;
        }
        gMain.state++;
        break;
    case 6:
        {
            u32 r3 = 0;

            if (gTasks[taskId].data[2] != 0)
                r3 = 0x14;
            if (gTasks[taskId].data[1] != 0)
                r3 |= (1 << (gSprites[gTasks[taskId].data[4]].oam.paletteNum + 16));
            BeginNormalPaletteFade(~r3, 0, 16, 0, 0);
            SetVBlankCallback(gUnknown_03005CEC);
            gMain.state++;
        }
        break;
    case 7:
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x52)) = 0;
        (*(vu16 *)(0x4000000 + 0x54)) = 0;
        (*(vu16 *)(0x4000000 + 0xe)) = (3) | ((0) << 2) | ((15) << 8) | 0x0000 | 0x0000;
        (*(vu16 *)(0x4000000 + 0xa)) = (0) | ((0) << 2) | ((13) << 8) | 0x0000 | 0x0000;
        (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0200 | 0x0400 | 0x0800 | 0x1000;
        gMain.state++;
        break;
    case 8:
        if (!gPaletteFade.active)
        {
            gMain.state++;
            if (gTasks[taskId].data[3] == 0)
            {
                StopCryAndClearCrySongs();
                PlayCry2(NationalPokedexNumToSpecies(gUnknown_0202FFBC->dexNum), 0, 0x7D, 0xA);
            }
            else
            {
                gMain.state++;
            }
        }
        break;
    case 9:
        if (!IsCryPlayingOrClearCrySongs())
            gMain.state++;
        break;
    case 10:
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 1;
        gTasks[taskId].data[3] = 1;
        gTasks[taskId].func = Task_PageScreenProcessInput;
        gMain.state = 0;
        break;
    }
}

static void Task_PageScreenProcessInput(u8 taskId)
{
    if (gTasks[taskId].data[0] != 0)
    {
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        gTasks[taskId].func = sub_808F888;
        PlaySE(SE_Z_SCROLL);
        return;
    }
    if (gMain.newKeys & 0x0002)
    {
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        gTasks[taskId].func = Task_ClosePageScreen;
        PlaySE(SE_PC_OFF);
        return;
    }
    if (gMain.newKeys & 0x0001)
    {
        switch (gPokedexView->selectedScreen)
        {
        case AREA_SCREEN:
            BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
            gTasks[taskId].func = Task_InitAreaScreenMultistep;
            PlaySE(SE_PIN);
            break;
        case CRY_SCREEN:
            BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
            gTasks[taskId].func = Task_InitCryScreenMultistep;
            PlaySE(SE_PIN);
            break;
        case SIZE_SCREEN:
            if (!gUnknown_0202FFBC->owned)
            {
                PlaySE(SE_HAZURE);
            }
            else
            {
                BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
                gTasks[taskId].func = Task_InitSizeScreenMultistep;
                PlaySE(SE_PIN);
            }
            break;
        case BACK_SCREEN:
   BeginNormalPaletteFade(-1, 0, 0, 16, 0);
   gTasks[taskId].func = Task_ClosePageScreen;
   PlaySE(SE_PC_OFF);
            break;
        }
        return;
    }
    if (((gMain.newKeys & 0x0020)
     || ((gMain.newKeys & 0x0200) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
     && gPokedexView->selectedScreen > 0)
    {
        gPokedexView->selectedScreen--;
        sub_8090584(gPokedexView->selectedScreen, 0xD);
        PlaySE(SE_Z_PAGE);
        return;
    }
    if (((gMain.newKeys & 0x0010)
     || ((gMain.newKeys & 0x0100) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
     && gPokedexView->selectedScreen < 3)
    {
        gPokedexView->selectedScreen++;
        sub_8090584(gPokedexView->selectedScreen, 0xD);
        PlaySE(SE_Z_PAGE);
        return;
    }
}

static void sub_808F888(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = Task_InitPageScreenMultistep;
}

static void Task_ClosePageScreen(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}

static void Task_InitAreaScreenMultistep(u8 taskId)
{
    switch (gMain.state)
    {
    case 0:
    default:
        if (!gPaletteFade.active)
        {
            gPokedexView->unk64A = 5;
            gUnknown_03005CEC = gMain.vblankCallback;
            SetVBlankCallback(((void *)0));
            sub_8091060(0x200);
            gPokedexView->selectedScreen = AREA_SCREEN;
            gMain.state = 1;
        }
        break;
    case 1:
        sub_8090540(0xD);
        sub_8090644(0, 0xD);
        sub_808D640();
        (*(vu16 *)(0x4000000 + 0xa)) = (0) | ((0) << 2) | ((13) << 8) | 0x0000 | 0x0000;
        gMain.state++;
        break;
    case 2:
        ShowPokedexAreaScreen(NationalPokedexNumToSpecies(gUnknown_0202FFBC->dexNum), &gPokedexView->unk64F);
        SetVBlankCallback(gUnknown_03005CEC);
        gPokedexView->unk64F = 0;
        gMain.state = 0;
        gTasks[taskId].func = Task_AreaScreenProcessInput;
        break;
    }
}

static void Task_AreaScreenProcessInput(u8 taskId)
{
    if (gPokedexView->unk64F != 0)
        gTasks[taskId].func = sub_808FA00;
}

static void sub_808FA00(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        switch (gPokedexView->unk64F)
        {
        case 1:
        default:
            gTasks[taskId].func = Task_InitPageScreenMultistep;
            break;
        case 2:
            gTasks[taskId].func = Task_InitCryScreenMultistep;
            break;
        }
    }
}

static void Task_InitCryScreenMultistep(u8 taskId)
{
    switch (gMain.state)
    {
    case 0:
    default:
        if (!gPaletteFade.active)
        {
            m4aMPlayStop(&gMPlay_BGM);
            gPokedexView->unk64A = 6;
            gUnknown_03005CEC = gMain.vblankCallback;
            SetVBlankCallback(((void *)0));
            sub_8091060(0x200);
            gPokedexView->selectedScreen = CRY_SCREEN;
            gMain.state = 1;
        }
        break;
    case 1:
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)0x6000000);
        LZ77UnCompVram(gUnknown_0839F8A0, (void *)(0x6000000 + 0x7000));
        gMain.state++;
        break;
    case 2:
        sub_8090540(0xD);
        sub_8090644(1, 0xD);
        sub_808D640();
        { vu16 *_dest = (vu16 *)((void *)(0x6000000 + 0xF800)); u32 _size = 0x500; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };
        gMain.state++;
        break;
    case 3:
        SetUpWindowConfig(&gWindowConfig_81E702C);
        InitMenuWindow(&gWindowConfig_81E702C);
        ResetPaletteFade();
        gMain.state++;
        break;
    case 4:
  SetCustomFont(2);
        sub_8091260(gUnknown_0202FFBC->dexNum, 10, 4, 2);
        MenuPrint(gDexText_CryOf, 10, 6);
  SetCustomFont(0);
        gMain.state++;
        break;
    case 5:
        gTasks[taskId].data[4] = sub_80918EC(gUnknown_0202FFBC->dexNum, 0x30, 0x38, 0);
        gSprites[gTasks[taskId].data[4]].oam.priority = 0;
        gUnknown_03005E98 = 0;
        gMain.state++;
        break;
    case 6:
        {
            struct CryRelatedStruct sp8;

            sp8.unk0 = 0x4020;
            sp8.unk2 = 0x1F;
            sp8.paletteNo = 8;
            sp8.yPos = 0x1E;
            sp8.xPos = 0xC;
            if (sub_8119E3C(&sp8, 0) != 0)
            {
                gMain.state++;
                gUnknown_03005E98 = 0;
            }
        }
        break;
    case 7:
        {
            struct CryRelatedStruct sp10;

            sp10.unk0 = 0x3000;
            sp10.unk2 = 0xE;
            sp10.paletteNo = 9;
            sp10.xPos = 0x12;
            sp10.yPos = 3;
            if (ShowPokedexCryScreen(&sp10, 1) != 0)
                gMain.state++;
        }
        break;
    case 8:
        BeginNormalPaletteFade(-0x15, 0, 0x10, 0, 0);
        SetVBlankCallback(gUnknown_03005CEC);
        gMain.state++;
        break;
    case 9:
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x52)) = 0;
        (*(vu16 *)(0x4000000 + 0x54)) = 0;
        (*(vu16 *)(0x4000000 + 0xc)) = (2) | ((0) << 2) | ((14) << 8) | 0x0000 | 0x0000;
        (*(vu16 *)(0x4000000 + 0x8)) = (3) | ((1) << 2) | ((31) << 8) | 0x0000 | 0x0000;
        (*(vu16 *)(0x4000000 + 0xa)) = (0) | ((0) << 2) | ((13) << 8) | 0x0000 | 0x0000;
        (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0F00 | 0x1000;
        gMain.state++;
        break;
    case 10:
        gPokedexView->unk64F = 0;
        gMain.state = 0;
        gTasks[taskId].func = Task_CryScreenProcessInput;
        break;
    }
}

static void Task_CryScreenProcessInput(u8 taskId)
{
    sub_8119F88(0);

    if (IsCryPlaying())
        sub_8090040(1);
    else
        sub_8090040(0);

    if (gMain.newKeys & 0x0001)
    {
        sub_8090040(1);
        sub_811A050(NationalPokedexNumToSpecies(gUnknown_0202FFBC->dexNum));
        return;
    }
    else if (!gPaletteFade.active)
    {
        if (gMain.newKeys & 0x0002)
        {
            BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
            m4aMPlayContinue(&gMPlay_BGM);
            gPokedexView->unk64F = 1;
            gTasks[taskId].func = sub_808FFBC;
            PlaySE(SE_PC_OFF);
            return;
        }
        if ((gMain.newKeys & 0x0020)
         || ((gMain.newKeys & 0x0200) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
        {
            BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
            m4aMPlayContinue(&gMPlay_BGM);
            gPokedexView->unk64F = 2;
            gTasks[taskId].func = sub_808FFBC;
            PlaySE(SE_Z_PAGE);
            return;
        }
        if ((gMain.newKeys & 0x0010)
         || ((gMain.newKeys & 0x0100) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
        {
            if (!gUnknown_0202FFBC->owned)
            {
                PlaySE(SE_HAZURE);
            }
            else
            {
                BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
                m4aMPlayContinue(&gMPlay_BGM);
                gPokedexView->unk64F = 3;
                gTasks[taskId].func = sub_808FFBC;
                PlaySE(SE_Z_PAGE);
            }
            return;
        }
    }
}

static void sub_808FFBC(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyCryMeterNeedleSprite();
        switch (gPokedexView->unk64F)
        {
        default:
        case 1:
            gTasks[taskId].func = Task_InitPageScreenMultistep;
            break;
        case 2:
            gTasks[taskId].func = Task_InitAreaScreenMultistep;
            break;
        case 3:
            gTasks[taskId].func = Task_InitSizeScreenMultistep;
            break;
        }
    }
}

static void sub_8090040(u8 a)
{
    u16 unk;

    if (a != 0)
        unk = 0x392;
    else
        unk = 0x2AF;
    LoadPalette(&unk, 0x5D, 2);
}

static void Task_InitSizeScreenMultistep(u8 taskId)
{
    u8 spriteId;

    switch (gMain.state)
    {
    default:
    case 0:
        if (!gPaletteFade.active)
        {
            gPokedexView->unk64A = 7;
            gUnknown_03005CEC = gMain.vblankCallback;
            SetVBlankCallback(((void *)0));
            sub_8091060(0x200);
            gPokedexView->selectedScreen = SIZE_SCREEN;
            gMain.state = 1;
        }
        break;
    case 1:
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)0x6000000);
        LZ77UnCompVram(gUnknown_0839F988, (void *)(0x6000000 + 0x7000));
        gMain.state++;
        break;
    case 2:
        sub_8090540(0xD);
        sub_8090644(2, 0xD);
        sub_808D640();
        gMain.state++;
        break;
    case 3:
        {
            u8 string[40];

            SetUpWindowConfig(&gWindowConfig_81E702C);
            InitMenuWindow(&gWindowConfig_81E702C);
            string[0] = 0xFF;
            StringAppend(string, gSpeciesNames[NationalPokedexNumToSpecies(gUnknown_0202FFBC->dexNum)]);
            StringAppend(string, gDexText_SizeComparedTo);
            sub_8072BD8(string, 3, 15, 0xC0);
            gMain.state++;
        }
        break;
    case 4:
        ResetPaletteFade();
        gMain.state++;
        break;
    case 5:
        spriteId = sub_8091A4C(gSaveBlock2.playerGender, 152, 56, 0);
        gSprites[spriteId].oam.affineMode = 1;
        gSprites[spriteId].oam.matrixNum = 1;
        gSprites[spriteId].oam.priority = 0;
        gSprites[spriteId].pos2.y = gPokedexEntries[gUnknown_0202FFBC->dexNum].trainerOffset;
        SetOamMatrix(1, gPokedexEntries[gUnknown_0202FFBC->dexNum].trainerScale, 0, 0, gPokedexEntries[gUnknown_0202FFBC->dexNum].trainerScale);
        LoadPalette(gUnknown_083B4EC4, (gSprites[spriteId].oam.paletteNum + 16) * 16, sizeof(gUnknown_083B4EC4));
        gMain.state++;
        break;
    case 6:
        spriteId = sub_80918EC(gUnknown_0202FFBC->dexNum, 88, 56, 1);
        gSprites[spriteId].oam.affineMode = 1;
        gSprites[spriteId].oam.matrixNum = 2;
        gSprites[spriteId].oam.priority = 0;
        gSprites[spriteId].pos2.y = gPokedexEntries[gUnknown_0202FFBC->dexNum].pokemonOffset;
        SetOamMatrix(2, gPokedexEntries[gUnknown_0202FFBC->dexNum].pokemonScale, 0, 0, gPokedexEntries[gUnknown_0202FFBC->dexNum].pokemonScale);
        LoadPalette(gUnknown_083B4EC4, (gSprites[spriteId].oam.paletteNum + 16) * 16, sizeof(gUnknown_083B4EC4));
        gMain.state++;
        break;
    case 7:
        BeginNormalPaletteFade(-0x15, 0, 0x10, 0, 0);
        SetVBlankCallback(gUnknown_03005CEC);
        gMain.state++;
        break;
    case 8:
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x52)) = 0;
        (*(vu16 *)(0x4000000 + 0x54)) = 0;
        (*(vu16 *)(0x4000000 + 0xc)) = (3) | ((0) << 2) | ((14) << 8) | 0x0000 | 0x0000;
        (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0200 | 0x0400 | 0x0800 | 0x1000;
        gMain.state++;
        break;
    case 9:
        if (!gPaletteFade.active)
        {
            gPokedexView->unk64F = 0;
            gMain.state = 0;
            gTasks[taskId].func = Task_SizeScreenProcessInput;
        }
        break;
    }
}

static void Task_SizeScreenProcessInput(u8 taskId)
{
    if (gMain.newKeys & 0x0002)
    {
        BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
        gPokedexView->unk64F = 1;
        gTasks[taskId].func = sub_8090498;
        PlaySE(SE_PC_OFF);
    }
    else if ((gMain.newKeys & 0x0020)
     || ((gMain.newKeys & 0x0200) && gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_LR))
    {
        BeginNormalPaletteFade(-0x15, 0, 0, 0x10, 0);
        gPokedexView->unk64F = 2;
        gTasks[taskId].func = sub_8090498;
        PlaySE(SE_Z_PAGE);
    }
}

static void sub_8090498(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        switch (gPokedexView->unk64F)
        {
        default:
        case 1:
            gTasks[taskId].func = Task_InitPageScreenMultistep;
            break;
        case 2:
            gTasks[taskId].func = Task_InitCryScreenMultistep;
            break;
        }
    }
}

static void sub_80904FC(u16 a)
{
    LZ77UnCompVram(gUnknown_08E96ACC, (void *)(0x6000000 + a * 0x800));
    { vu16 *_dest = (vu16 *)((void *)(0x6000000 + a * 0x800 + 0xC0)); u32 _size = 0x440; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };
}

static void sub_8090540(u16 a)
{
    LZ77UnCompVram(gUnknown_08E96B58, (void *)(0x6000000 + a * 0x800));
    { vu16 *_dest = (vu16 *)((void *)(0x6000000 + a * 0x800 + 0xC0)); u32 _size = 0x440; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };
}





static void sub_8090584(u8 a, u16 b)
{
 u8 i, j;
 u16 *ptr, pal;

 for (i = 0; i < 4; i++)
 {
  if (i == a)
            pal = 0x2000;
        else
            pal = 0x4000;

  for (j = 0; j < 14; j++)
  {
   if (j < 7)
    ptr = (u16 *)(0x6006802 + i * 0xE + j * 2);
   else
    ptr = (u16 *)(0x6006842 + i * 0xE + (j - 7) * 2);

   *ptr = (*ptr & 0x0FFF) | pal;
  }
 }
}

static void sub_8090644(u8 a, u16 b)
{
 u8 i, j;
 u16 *ptr, pal;

 for (i = 0; i < 4; i++)
 {
  if (i == a || i == 3)
            pal = 0x2000;
        else
            pal = 0x4000;

  for (j = 0; j < 14; j++)
  {
   if (j < 7)
    ptr = (u16 *)(0x6006802 + i * 0xE + j * 2);
   else
    ptr = (u16 *)(0x6006842 + i * 0xE + (j - 7) * 2);

   *ptr = (*ptr & 0x0FFF) | pal;
  }
 }
}

u8 sub_809070C(u16 dexNum, u32 b, u32 c)
{
    u8 taskId = CreateTask(sub_8090750, 0);

    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = dexNum;
    gTasks[taskId].data[12] = b;
    gTasks[taskId].data[13] = b >> 16;
    gTasks[taskId].data[14] = c;
    gTasks[taskId].data[15] = c >> 16;
    return taskId;
}

static void sub_8090750(u8 taskId)
{
    u8 spriteId;
    u16 dexNum = gTasks[taskId].data[1];
    u16 i;
 u8 TextHeight[] = _("키");
 u8 TextWeight[] = _("몸무게");

    switch (gTasks[taskId].data[0])
    {
    case 0:
    default:
        if (!gPaletteFade.active)
        {
            gUnknown_03005CEC = gMain.vblankCallback;
            SetVBlankCallback(((void *)0));
            sub_8091060(0x100);
            gTasks[taskId].data[0] = 1;
        }
        break;
    case 1:
        LZ77UnCompVram(gPokedexMenu_Gfx, (void *)(0x6000000 + 0x4000));
        LZ77UnCompVram(gUnknown_08E96BD4, (void *)(0x6000000 + 0x7800));
        for (i = 0; i < 0x280; i++)
        {

            asm("");

            *(u16 *)(0x6000000 + 0x7800 + 2 * i) += 0x2000;
        }
        sub_8091738(gTasks[taskId].data[1], 2, 0x3FC);
        ResetPaletteFade();
        LoadPalette(gPokedexMenu_Pal + 1, 0x21, 0x9E);
        gTasks[taskId].data[0]++;
        break;
    case 2:
        SetUpWindowConfig(&gWindowConfig_81E7064);
        InitMenuWindow(&gWindowConfig_81E7064);
        { vu16 *_dest = (vu16 *)((void *)(0x6000000 + 0xC000)); u32 _size = 0x200; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };
        gTasks[taskId].data[0]++;
        break;
    case 3:
        sub_8072BD8(gDexText_RegisterComplete, 2, 0, 0xD0);
        if (!IsNationalPokedexEnabled())
            sub_8091154(NationalToHoennOrder(dexNum), 13, 3);
        else
            sub_8091154(dexNum, 13, 3);
        sub_80911C8(dexNum, 16, 3);
        MenuPrint(gDexText_UnknownPoke, (11), 5);
        MenuPrint(TextHeight, 12, 7);
        MenuPrint(TextWeight, 12, 9);
        MenuPrint(gDexText_UnknownHeight, 17, 7);
        MenuPrint(gDexText_UnknownWeight, 17, 9);
        sub_8091304(gPokedexEntries[dexNum].categoryName, (11), 5);
        sub_8091458(gPokedexEntries[dexNum].height, 21, 7);
        sub_8091564(gPokedexEntries[dexNum].weight, 21, 9);
        SetCustomFont(2);
  MenuPrint(gPokedexEntries[dexNum].descriptionPage1, 3, 13);
        SetCustomFont(0);
  sub_80917CC(14, 0x3FC);
        gTasks[taskId].data[0]++;
        break;
    case 4:
        spriteId = sub_80918EC(dexNum, 0x30, 0x38, 0);
        gSprites[spriteId].oam.priority = 0;
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        SetVBlankCallback(gUnknown_03005CEC);
        gTasks[taskId].data[3] = spriteId;
        gTasks[taskId].data[0]++;
        break;
    case 5:
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x52)) = 0;
        (*(vu16 *)(0x4000000 + 0x54)) = 0;
        (*(vu16 *)(0x4000000 + 0xe)) = (3) | ((1) << 2) | ((15) << 8) | 0x0000 | 0x0000;
        (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0400 | 0x0800 | 0x1000;
        gTasks[taskId].data[0]++;
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            PlayCry1(NationalPokedexNumToSpecies(dexNum), 0);
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].data[4] = 0;
            gTasks[taskId].func = sub_8090A3C;
        }
        break;
    }
}

static void sub_8090A3C(u8 taskId)
{
    if (gMain.newKeys & (0x0002 | 0x0001))
    {
        BeginNormalPaletteFade(0x0000FFFC, 0, 0, 16, 0);
        gSprites[gTasks[taskId].data[3]].callback = sub_8090C28;
        gTasks[taskId].func = sub_8090B8C;
        return;
    }

    gTasks[taskId].data[2]++;
    if (gTasks[taskId].data[2] & 0x10)
        LoadPalette(gPokedexMenu_Pal + 1, 0x51, 14);
    else
        LoadPalette(gPokedexMenu2_Pal + 1, 0x51, 14);
}

static void sub_8090B8C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u16 species;
        u32 otId;
        u32 personality;
        u8 paletteNum;
        const u8 *lzPaletteData;

        (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0100 | 0x0800 | 0x1000;
        CpuSet(gUnknown_08D00524, (void *)(0x6000000 + 0xC000), 0x00000000 | ((0x1000)/(16/8) & 0x1FFFFF));
        sub_800D74C();
        species = NationalPokedexNumToSpecies(gTasks[taskId].data[1]);
        otId = ((u16)gTasks[taskId].data[13] << 16) | (u16)gTasks[taskId].data[12];
        personality = ((u16)gTasks[taskId].data[15] << 16) | (u16)gTasks[taskId].data[14];
        paletteNum = gSprites[gTasks[taskId].data[3]].oam.paletteNum;
        lzPaletteData = GetMonSpritePalFromOtIdPersonality(species, otId, personality);
        LoadCompressedPalette(lzPaletteData, 0x100 | paletteNum * 16, 32);
        DestroyTask(taskId);
    }
}

static void sub_8090C28(struct Sprite *sprite)
{
    if (sprite->pos1.x < 0x78)
        sprite->pos1.x += 2;
    if (sprite->pos1.x > 0x78)
        sprite->pos1.x -= 2;

    if (sprite->pos1.y < 0x50)
        sprite->pos1.y += 1;
    if (sprite->pos1.y > 0x50)
        sprite->pos1.y -= 1;
}
# 3746 "src/pokemon/pokedex.c"
const u8 *GetPokemonCategory(u16 dexNum)
{
    return gPokedexEntries[dexNum].categoryName;
}

u16 GetPokedexHeightWeight(u16 dexNum, u8 data)
{
    switch (data)
    {
    case 0:
        return gPokedexEntries[dexNum].height;
    case 1:
        return gPokedexEntries[dexNum].weight;
    default:
        return 1;
    }
}

s8 GetSetPokedexFlag(u16 nationalDexNo, u8 caseID)
{
    u8 index;
    u8 bit;
    u8 mask;
    s8 retVal;

    nationalDexNo--;
    index = nationalDexNo / 8;
    bit = nationalDexNo % 8;
    mask = 1 << bit;
    retVal = 0;
    switch (caseID)
    {
    case FLAG_GET_SEEN:
        if (gSaveBlock2.pokedex.seen[index] & mask)
        {
            if ((gSaveBlock2.pokedex.seen[index] & mask) == (gSaveBlock1.dexSeen2[index] & mask)
             && (gSaveBlock2.pokedex.seen[index] & mask) == (gSaveBlock1.dexSeen3[index] & mask))
                retVal = 1;
            else
            {
                gSaveBlock2.pokedex.seen[index] &= ~mask;
                gSaveBlock1.dexSeen2[index] &= ~mask;
                gSaveBlock1.dexSeen3[index] &= ~mask;
                retVal = 0;
            }
        }
        break;
    case FLAG_GET_CAUGHT:
        if (gSaveBlock2.pokedex.owned[index] & mask)
        {
            if ((gSaveBlock2.pokedex.owned[index] & mask) == (gSaveBlock2.pokedex.seen[index] & mask)
             && (gSaveBlock2.pokedex.owned[index] & mask) == (gSaveBlock1.dexSeen2[index] & mask)
             && (gSaveBlock2.pokedex.owned[index] & mask) == (gSaveBlock1.dexSeen3[index] & mask))
                retVal = 1;
            else
            {
                gSaveBlock2.pokedex.owned[index] &= ~mask;
                gSaveBlock2.pokedex.seen[index] &= ~mask;
                gSaveBlock1.dexSeen2[index] &= ~mask;
                gSaveBlock1.dexSeen3[index] &= ~mask;
                retVal = 0;
            }
        }
        break;
    case FLAG_SET_SEEN:
        gSaveBlock2.pokedex.seen[index] |= mask;
        gSaveBlock1.dexSeen2[index] |= mask;
        gSaveBlock1.dexSeen3[index] |= mask;
        break;
    case FLAG_SET_CAUGHT:
        gSaveBlock2.pokedex.owned[index] |= mask;
        break;
    }
    return retVal;
}

u16 GetNationalPokedexCount(u8 caseID)
{
    u16 count = 0;
    u16 i;

    for (i = 0; i < 386; i++)
    {
        switch (caseID)
        {
        case FLAG_GET_SEEN:
            if (GetSetPokedexFlag(i + 1, FLAG_GET_SEEN))
                count++;
            break;
        case FLAG_GET_CAUGHT:
            if (GetSetPokedexFlag(i + 1, FLAG_GET_CAUGHT))
                count++;
            break;
        }
    }
    return count;
}

u16 GetHoennPokedexCount(u8 caseID)
{
    u16 count = 0;
    u16 i;

    for (i = 0; i < 202; i++)
    {
        switch (caseID)
        {
        case FLAG_GET_SEEN:
            if (GetSetPokedexFlag(HoennToNationalOrder(i + 1), FLAG_GET_SEEN))
                count++;
            break;
        case FLAG_GET_CAUGHT:
            if (GetSetPokedexFlag(HoennToNationalOrder(i + 1), FLAG_GET_CAUGHT))
                count++;
            break;
        }
    }
    return count;
}

bool8 sub_8090FC0(void)
{
    u16 i;

    for (i = 0; i < 200; i++)
    {
        if (!GetSetPokedexFlag(HoennToNationalOrder(i + 1), FLAG_GET_CAUGHT))
            return 0;
    }
    return 1;
}

u16 sub_8090FF4(void)
{
    u16 i;

    for (i = 0; i < 150; i++)
    {
        if (GetSetPokedexFlag(i + 1, 1) == 0)
            return 0;
    }
    for (i = 152; i < 250; i++)
    {
        if (GetSetPokedexFlag(i + 1, 1) == 0)
            return 0;
    }
    for (i = 252; i < 384; i++)
    {
        if (GetSetPokedexFlag(i + 1, 1) == 0)
            return 0;
    }
    return 1;
}

static void sub_8091060(u16 a)
{
    if (!(a & 0x100))
    {
        (*(vu16 *)(0x4000000 + 0x0)) &= 0xFEFF;
        (*(vu16 *)(0x4000000 + 0x8)) = 0;
        (*(vu16 *)(0x4000000 + 0x10)) = 0;
        (*(vu16 *)(0x4000000 + 0x12)) = 0;
    }
    if (!(a & 0x200))
    {
        (*(vu16 *)(0x4000000 + 0x0)) &= 0xFDFF;
        (*(vu16 *)(0x4000000 + 0xa)) = 0;
        (*(vu16 *)(0x4000000 + 0x14)) = 0;
        (*(vu16 *)(0x4000000 + 0x16)) = 0;
    }
    if (!(a & 0x400))
    {
        (*(vu16 *)(0x4000000 + 0x0)) &= 0xFBFF;
        (*(vu16 *)(0x4000000 + 0xc)) = 0;
        (*(vu16 *)(0x4000000 + 0x18)) = 0;
        (*(vu16 *)(0x4000000 + 0x1a)) = 0;
    }
    if (!(a & 0x800))
    {
        (*(vu16 *)(0x4000000 + 0x0)) &= 0xF7FF;
        (*(vu16 *)(0x4000000 + 0xe)) = 0;
        (*(vu16 *)(0x4000000 + 0x1c)) = 0;
        (*(vu16 *)(0x4000000 + 0x1e)) = 0;
    }
    if (!(a & 0x1000))
    {
        (*(vu16 *)(0x4000000 + 0x0)) &= 0xEFFF;
        ResetSpriteData();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 8;
    }
}

static void sub_8091154(u16 order, u8 b, u8 c)
{
    u8 str[4];

    str[0] = 0xA1 + order / 100;
    str[1] = 0xA1 + (order % 100) / 10;
    str[2] = 0xA1 + (order % 100) % 10;
    str[3] = 0xFF;
    MenuPrint(str, b, c);
}

static u8 sub_80911C8(u16 num, u8 b, u8 c)
{
    u8 str[11];
    u8 i;

    for (i = 0; i < 11; i++)
        str[i] = 0xFF;
    num = NationalPokedexNumToSpecies(num);
    switch (num)
    {
    default:
        for (i = 0; gSpeciesNames[num][i] != 0xFF && i < 10; i++)
            str[i] = gSpeciesNames[num][i];
        break;
    case 0:
        for (i = 0; i < 10; i++)
            str[i] = 0xAE;
        break;
    }
    MenuPrint(str, b, c);
    return i;
}

static u8 sub_8091260(u16 num, u8 b, u8 c, u8 d)
{
    u8 str[40];
 u8 str2[] = _("의");
    u8 *end;
    u8 i;

    end = StringCopy(str, gUnknown_083B5558);
    str[2] = d;
    num = NationalPokedexNumToSpecies(num);
    switch (num)
    {
    default:
        for (i = 0; gSpeciesNames[num][i] != 0xFF && i < 10; i++)
            end[i] = gSpeciesNames[num][i];
        break;
    case 0:
        for (i = 0; i < 10; i++)
            end[i] = 0xAE;
        break;
    }
    end[i] = 0xFF;

 StringAppend(str, str2);

    MenuPrint(str, b, c);
    return i;
}

static void sub_8091304(const u8 *name, u8 left, u8 top)
{
    u8 str[32];
    u8 i;
    u8 j;

    for (i = 0; name[i] != 0xFF && i < 13; i++)
        str[i] = name[i];

    for (j = 0; gDexText_UnknownPoke[j] == 0xAC || gDexText_UnknownPoke[j] == 0; j++)
        ;

    while (gDexText_UnknownPoke[j] != 0xFF)
        str[i++] = gDexText_UnknownPoke[j++];
    str[i] = 0xFF;
    sub_8072B80(str, left, top, gDexText_UnknownPoke);
}

void unref_sub_80913A4(u16 a, u8 left, u8 top)
{
    u8 str[6];
    bool8 outputted = 0;
    u8 result;

    str[0] = 0x00;

    result = a / 1000;
    if (result == 0)
    {
        str[1] = 0x00;
        outputted = 0;
    }
    else
    {
        str[1] = 0xA1 + result;
        outputted = 1;
    }

    result = (a % 1000) / 100;
    if (result == 0 && !outputted)
    {
        str[2] = 0x00;
        outputted = 0;
    }
    else
    {
        str[2] = 0xA1 + result;
        outputted = 1;
    }

    str[3] = 0xA1 + ((a % 1000) % 100) / 10;
    str[4] = 0xAD;
    str[5] = 0xA1 + ((a % 1000) % 100) % 10;
    str[6] = 0xFF;
    MenuPrint_RightAligned(str, left, top);
}
# 4095 "src/pokemon/pokedex.c"
static void sub_8091458(u16 height, u8 left, u8 top)
{
    unref_sub_80913A4(height, left, top);
}
# 4165 "src/pokemon/pokedex.c"
static void sub_8091564(u16 arg0, u8 left, u8 top)
{
    unref_sub_80913A4(arg0, left, top);
}


static void sub_8091738(u16 num, u16 b, u16 c)
{
    u8 arr[0x80];
    u16 i;
    u16 j;
    const u8 *r12;
    u16 r7;
    u8 r3;

    r12 = sMonFootprintTable[NationalPokedexNumToSpecies(num)];
    for (r7 = 0, i = 0; i < 32; i++)
    {
        r3 = r12[i];
        for (j = 0; j < 4; j++)
        {
            u32 r1 = j * 2;
            s32 r2 = (r3 >> r1) & 1;

            if (r3 & (2 << r1))
                r2 |= 0x10;



            asm("");asm("");asm("");asm("");asm("");


            arr[r7] = r2;
            r7++;
        }
    }
    CpuSet(arr, (u16 *)(0x6000000 + b * 0x4000 + c * 0x20), 0x00000000 | ((0x80)/(16/8) & 0x1FFFFF));
}

static void sub_80917CC(u16 a, u16 b)
{
    *(u16 *)(0x6000000 + a * 0x800 + 0x232) = 0xF000 + b + 0;
    *(u16 *)(0x6000000 + a * 0x800 + 0x234) = 0xF000 + b + 1;
    *(u16 *)(0x6000000 + a * 0x800 + 0x272) = 0xF000 + b + 2;
    *(u16 *)(0x6000000 + a * 0x800 + 0x274) = 0xF000 + b + 3;
}

static u16 sub_8091818(u8 a, u16 b, u16 c, u16 d)
{
    switch (a)
    {
    case 1:
        if (b > c)
            b--;
        break;
    case 0:
        if (b < d)
            b++;
        break;
    case 3:
        if (b > c)
            b--;
        else
            b = d;
        break;
    case 2:
        if (b < d)
            b++;
        else
            b = c;
        break;
    }
    return b;
}

static void nullsub_59(struct Sprite *sprite)
{
}

static void sub_8091878(u16 a, u8 b)
{
    gUnknown_02024E8C = gUnknown_083B57A4;
    gUnknown_02024E8C.paletteTag = a;
    gUnknown_02024E8C.images = gUnknown_083B5794[b];
    gUnknown_02024E8C.anims = gSpriteAnimTable_81E7C64;
}

static void sub_80918B0(u16 a, u8 b)
{
    gUnknown_02024E8C = gUnknown_083B57A4;
    gUnknown_02024E8C.paletteTag = a;
    gUnknown_02024E8C.images = gUnknown_083B5794[b];
    gUnknown_02024E8C.anims = gUnknown_081EC2A4[0];
}

u16 sub_80918EC(u16 num, s16 x, s16 y, u16 paletteNum)
{
    u8 spriteId;

    num = NationalPokedexNumToSpecies(num);
    switch (num)
    {
    default:
        DecompressPicFromTable_2(
          &gMonFrontPicTable[num],
          gMonFrontPicCoords[num].coords,
          gMonFrontPicCoords[num].y_offset,
          (void*)0x02000000,
          gUnknown_083B5584[paletteNum],
          num);
        break;
    case SPECIES_SPINDA:
        LoadSpecialPokePic(
          &gMonFrontPicTable[num],
          gMonFrontPicCoords[num].coords,
          gMonFrontPicCoords[num].y_offset,
          0x02000000,
          gUnknown_083B5584[paletteNum],
          num,
          gSaveBlock2.pokedex.spindaPersonality,
          1);
        break;
    case SPECIES_UNOWN:
        LoadSpecialPokePic(
          &gMonFrontPicTable[num],
          gMonFrontPicCoords[num].coords,
          gMonFrontPicCoords[num].y_offset,
          0x02000000,
          gUnknown_083B5584[paletteNum],
          num,
          gSaveBlock2.pokedex.unownPersonality,
          1);
        break;
    }
    LoadCompressedPalette(gMonPaletteTable[num].data, 0x100 + paletteNum * 16, 32);
    sub_8091878(paletteNum, paletteNum);
    spriteId = CreateSprite(&gUnknown_02024E8C, x, y, 0);
    gSprites[spriteId].oam.paletteNum = paletteNum;
    return spriteId;
}

u8 sub_8091A4C(u16 gender, s16 x, s16 y, u16 paletteNum)
{
    u8 spriteId;

    DecompressPicFromTable_2(
      &gTrainerFrontPicTable[gender],
      gTrainerFrontPicCoords[gender].coords,
      gTrainerFrontPicCoords[gender].y_offset,
      (void*)0x02000000,
      gUnknown_083B5584[0],
      gender);
    sub_80918B0(gender, 0);
    spriteId = CreateSprite(&gUnknown_02024E8C, x, y, 0);
    gSprites[spriteId].oam.paletteNum = paletteNum;
    return spriteId;
}

int sub_8091AF8(u8 a, u8 b, u8 abcGroup, u8 bodyColor, u8 type1, u8 type2)
{
    u16 species;
    u16 i;
    u16 resultsCount;
    u8 types[2];

    SortPokedex(a, b);

    for (i = 0, resultsCount = 0; i < 386; i++)
    {
        if (gPokedexView->unk0[i].seen)
        {
            gPokedexView->unk0[resultsCount] = gPokedexView->unk0[i];
            resultsCount++;
        }
    }
    gPokedexView->pokemonListCount = resultsCount;


    if (abcGroup != 0xFF)
    {
        for (i = 0, resultsCount = 0; i < gPokedexView->pokemonListCount; i++)
        {
            u16 FirstName;
   u8 chCho;

            species = NationalPokedexNumToSpecies(gPokedexView->unk0[i].dexNum);
   FirstName = (gSpeciesNames[species][0] << 8) | gSpeciesNames[species][1];
   chCho = getCho(FirstName);

   if (chCho == gChoTable[abcGroup][0] || chCho == gChoTable[abcGroup][1] ||
    chCho == gChoTable[abcGroup][2] || chCho == gChoTable[abcGroup][3])
   {
                gPokedexView->unk0[resultsCount] = gPokedexView->unk0[i];
                resultsCount++;
   }
        }
        gPokedexView->pokemonListCount = resultsCount;
    }


    if (bodyColor != 0xFF)
    {
        for (i = 0, resultsCount = 0; i < gPokedexView->pokemonListCount; i++)
        {
            species = NationalPokedexNumToSpecies(gPokedexView->unk0[i].dexNum);

            if (bodyColor == gBaseStats[species].bodyColor)
            {
                gPokedexView->unk0[resultsCount] = gPokedexView->unk0[i];
                resultsCount++;
            }
        }
        gPokedexView->pokemonListCount = resultsCount;
    }


    if (type1 != 0xFF || type2 != 0xFF)
    {
        if (type1 == 0xFF)
        {
            type1 = type2;
            type2 = 0xFF;
        }

        if (type2 == 0xFF)
        {
            for (i = 0, resultsCount = 0; i < gPokedexView->pokemonListCount; i++)
            {
                if (gPokedexView->unk0[i].owned)
                {
                    species = NationalPokedexNumToSpecies(gPokedexView->unk0[i].dexNum);

                    types[0] = gBaseStats[species].type1;
                    types[1] = gBaseStats[species].type2;
                    if (types[0] == type1 || types[1] == type1)
                    {
                        gPokedexView->unk0[resultsCount] = gPokedexView->unk0[i];
                        resultsCount++;
                    }
                }
            }
        }
        else
        {
            for (i = 0, resultsCount = 0; i < gPokedexView->pokemonListCount; i++)
            {
                if (gPokedexView->unk0[i].owned)
                {
                    species = NationalPokedexNumToSpecies(gPokedexView->unk0[i].dexNum);

                    types[0] = gBaseStats[species].type1;
                    types[1] = gBaseStats[species].type2;
                    if ((types[0] == type1 && types[1] == type2) || (types[0] == type2 && types[1] == type1))
                    {
                        gPokedexView->unk0[resultsCount] = gPokedexView->unk0[i];
                        resultsCount++;
                    }
                }
            }
        }
        gPokedexView->pokemonListCount = resultsCount;
    }

    if (gPokedexView->pokemonListCount != 0)
    {
        for (i = gPokedexView->pokemonListCount; i < 386; i++)
        {
            gPokedexView->unk0[i].dexNum = 0xFFFF;
            gPokedexView->unk0[i].seen = 0;
            gPokedexView->unk0[i].owned = 0;

        }
    }

    return resultsCount;
}



void sub_8091E20(const u8 *str)
{
    sub_8072AB0(str, 9, 120, (208), 32, 1);
}

u8 sub_8091E3C(void)
{
    return CreateTask(sub_8091E54, 0);
}

static void sub_8091E54(u8 taskId)
{
    u16 i;

    switch (gMain.state)
    {
    default:
    case 0:
        if (!gPaletteFade.active)
        {
            gPokedexView->unk64A = 2;
            sub_8091060(0);
            LZ77UnCompVram(gPokedexMenuSearch_Gfx, (void *)0x6000000);
            LZ77UnCompVram(gUnknown_08E96D2C, (void *)(0x6000000 + 0x7800));
            LoadPalette(gPokedexMenuSearch_Pal + 1, 1, 0x7E);
            if (!IsNationalPokedexEnabled())
            {
                for (i = 0; i < 17; i++)
                {
                    ((u16 *)(0x6000000 + 0x7A80))[i] = ((u16 *)(0x6000000 + 0x7B00))[i];
                    ((u16 *)(0x6000000 + 0x7AC0))[i] = ((u16 *)(0x6000000 + 0x7B40))[i];
                    ((u16 *)(0x6000000 + 0x7B00))[i] = 1;
                    ((u16 *)(0x6000000 + 0x7B40))[i] = 1;
                }
            }
            gMain.state = 1;
        }
        break;
    case 1:
        SetUpWindowConfig(&gWindowConfig_81E7064);
        InitMenuWindow(&gWindowConfig_81E7064);
        LoadCompressedObjectPic(&gUnknown_083A05CC[0]);
        LoadSpritePalettes(gUnknown_083A05DC);
        sub_809308C(taskId);
        for (i = 0; i < 16; i++)
            gTasks[taskId].data[i] = 0;
        sub_8092EB0(taskId);
        sub_8092AB0(0);
        sub_8092B68(taskId);
        gMain.state++;
        break;
    case 2:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        gMain.state++;
        break;
    case 3:
        (*(vu16 *)(0x4000000 + 0xe)) = 0x0F03;
        (*(vu16 *)(0x4000000 + 0x0)) = 0x1C40;
        gMain.state++;
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            gTasks[taskId].func = sub_809204C;
            gMain.state = 0;
        }
        break;
    }
}

static void sub_809204C(u8 taskId)
{
    sub_8092AB0(gTasks[taskId].data[0]);
    sub_8092B68(taskId);
    gTasks[taskId].func = sub_809207C;
}

static void sub_809207C(u8 taskId)
{
    if (gMain.newKeys & 0x0002)
    {
        PlaySE(SE_PC_OFF);
        gTasks[taskId].func = sub_80927B8;
        return;
    }
    if (gMain.newKeys & 0x0001)
    {
        switch (gTasks[taskId].data[0])
        {
        case 0:
            PlaySE(SE_PIN);
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].func = sub_809217C;
            break;
        case 1:
            PlaySE(SE_PIN);
            gTasks[taskId].data[1] = 4;
            gTasks[taskId].func = sub_809217C;
            break;
        case 2:
            PlaySE(SE_PC_OFF);
            gTasks[taskId].func = sub_80927B8;
            break;
        }
        return;
    }
    if ((gMain.newKeys & 0x0020) && gTasks[taskId].data[0] > 0)
    {
        PlaySE(SE_Z_PAGE);
        gTasks[taskId].data[0]--;
        sub_8092AB0(gTasks[taskId].data[0]);
    }
    if ((gMain.newKeys & 0x0010) && gTasks[taskId].data[0] < 2)
    {
        PlaySE(SE_Z_PAGE);
        gTasks[taskId].data[0]++;
        sub_8092AB0(gTasks[taskId].data[0]);
    }
}

static void sub_809217C(u8 taskId)
{
    sub_8092AD4(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    sub_8092B68(taskId);
    gTasks[taskId].func = sub_80921B0;
}

static void sub_80921B0(u8 taskId)
{
    const u8 (*r6)[4];

    if (gTasks[taskId].data[0] != 0)
    {
        if (!IsNationalPokedexEnabled())
            r6 = gUnknown_083B58A4;
        else
            r6 = gUnknown_083B586C;
    }
    else
    {
        if (!IsNationalPokedexEnabled())
            r6 = gUnknown_083B5888;
        else
            r6 = gUnknown_083B5850;
    }

    if (gMain.newKeys & 0x0002)
    {
        PlaySE(SE_BOWA);
        sub_8092EB0(taskId);
        gTasks[taskId].func = sub_809204C;
        return;
    }
    if (gMain.newKeys & 0x0001)
    {
        if (gTasks[taskId].data[1] == 6)
        {
            if (gTasks[taskId].data[0] != 0)
            {
                gUnknown_0202FFBA = 0x40;
                gPokedexView->unk62A = 0x40;
                gUnknown_0202FFB8 = 0;
                gPokedexView->unk610 = 0;
                gSaveBlock2.pokedex.unknown1 = sub_8092E10(taskId, 5);
                if (!IsNationalPokedexEnabled())
                    gSaveBlock2.pokedex.unknown1 = 0;
                gPokedexView->unk614 = gSaveBlock2.pokedex.unknown1;
                gSaveBlock2.pokedex.order = sub_8092E10(taskId, 4);
                gPokedexView->unk618 = gSaveBlock2.pokedex.order;
                PlaySE(SE_PC_OFF);
                gTasks[taskId].func = sub_80927B8;
            }
            else
            {
                sub_8091E20(gDexText_Searching);
                gTasks[taskId].func = sub_80923FC;
                PlaySE(SE_Z_SEARCH);
            }
        }
        else
        {
            PlaySE(SE_PIN);
            gTasks[taskId].func = sub_80925CC;
        }
        return;
    }

    if ((gMain.newKeys & 0x0020) && r6[gTasks[taskId].data[1]][0] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][0];
        sub_8092AD4(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
    if ((gMain.newKeys & 0x0010) && r6[gTasks[taskId].data[1]][1] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][1];
        sub_8092AD4(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
    if ((gMain.newKeys & 0x0040) && r6[gTasks[taskId].data[1]][2] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][2];
        sub_8092AD4(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
    if ((gMain.newKeys & 0x0080) && r6[gTasks[taskId].data[1]][3] != 0xFF)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[1] = r6[gTasks[taskId].data[1]][3];
        sub_8092AD4(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    }
}

static void sub_80923FC(u8 taskId)
{
    u8 r10 = sub_8092E10(taskId, 5);
    u8 r9 = sub_8092E10(taskId, 4);
    u8 r8 = sub_8092E10(taskId, 0);
    u8 r6 = sub_8092E10(taskId, 1);
    u8 r4 = sub_8092E10(taskId, 2);
    u8 r0 = sub_8092E10(taskId, 3);

    sub_8091AF8(r10, r9, r8, r6, r4, r0);
    gTasks[taskId].func = sub_80924A4;
}

static void sub_80924A4(u8 taskId)
{
    if (!IsSEPlaying())
    {
        if (gPokedexView->pokemonListCount != 0)
        {
            PlaySE(SE_SEIKAI);
            sub_8091E20(gDexText_SearchComplete);
        }
        else
        {
            PlaySE(SE_HAZURE);
            sub_8091E20(gDexText_NoMatching);
        }
        gTasks[taskId].func = sub_8092508;
    }
}

static void sub_8092508(u8 taskId)
{
    if (gMain.newKeys & 0x0001)
    {
        if (gPokedexView->pokemonListCount != 0)
        {
            gPokedexView->unk64F = 1;
            gPokedexView->dexMode = sub_8092E10(taskId, 5);
            gPokedexView->dexOrder = sub_8092E10(taskId, 4);
            gTasks[taskId].func = sub_80927B8;
            PlaySE(SE_PC_OFF);
        }
        else
        {
            gTasks[taskId].func = sub_809217C;
            PlaySE(SE_BOWA);
        }
    }
}

static void sub_80925B4(u16 a, int unused)
{
    sub_814AD7C(0x90, (a * 2 + 1) * 8);
}

static void sub_80925CC(u8 taskId)
{
    u8 r0;
    u16 *p1;
    u16 *p2;

    sub_8092C8C(0);
    r0 = gTasks[taskId].data[1];
    p1 = &gTasks[taskId].data[gUnknown_083B5A7C[r0].unk4];
    p2 = &gTasks[taskId].data[gUnknown_083B5A7C[r0].unk5];
    gTasks[taskId].data[14] = *p1;
    gTasks[taskId].data[15] = *p2;
    sub_8092D78(taskId);
    CreateBlendedOutlineCursor(16, 0xFFFF, 12, 0x2D9F, 11);
    sub_80925B4(*p1, 1);
    gTasks[taskId].func = sub_8092644;
}

static void sub_8092644(u8 taskId)
{
    u8 r1;
    const struct UnknownStruct2 *r8;
    u16 *p1;
    u16 *p2;
    u16 r2;
    bool8 r3;

    r1 = gTasks[taskId].data[1];
    r8 = gUnknown_083B5A7C[r1].unk0;
    p1 = &gTasks[taskId].data[gUnknown_083B5A7C[r1].unk4];
    p2 = &gTasks[taskId].data[gUnknown_083B5A7C[r1].unk5];
    r2 = gUnknown_083B5A7C[r1].unk6 - 1;
    if (gMain.newKeys & 0x0001)
    {
        sub_814ADC8();
        PlaySE(SE_PIN);
        MenuZeroFillWindowRect(18, 1, 28, 12);
        sub_8092C8C(1);
        gTasks[taskId].func = sub_809217C;
        return;
    }
    if (gMain.newKeys & 0x0002)
    {
        sub_814ADC8();
        PlaySE(SE_BOWA);
        MenuZeroFillWindowRect(18, 1, 28, 12);
        sub_8092C8C(1);
        *p1 = gTasks[taskId].data[14];
        *p2 = gTasks[taskId].data[15];
        gTasks[taskId].func = sub_809217C;
        return;
    }
    r3 = 0;
    if (gMain.newAndRepeatedKeys & 0x0040)
    {
        if (*p1 != 0)
        {
            sub_80925B4(*p1, 0);
            (*p1)--;
            sub_80925B4(*p1, 1);
            r3 = 1;
        }
        else if (*p2 != 0)
        {
            (*p2)--;
            sub_8092D78(taskId);
            sub_80925B4(*p1, 1);
            r3 = 1;
        }
        if (r3)
        {
            PlaySE(SE_SELECT);
            sub_8091E20(r8[*p1 + *p2].text1);
        }
        return;
    }
    if (gMain.newAndRepeatedKeys & 0x0080)
    {
        if (*p1 < 5 && *p1 < r2)
        {
            sub_80925B4(*p1, 0);
            (*p1)++;
            sub_80925B4(*p1, 1);
            r3 = 1;
        }
        else if (r2 > 5 && *p2 < r2 - 5)
        {
            (*p2)++;
            sub_8092D78(taskId);
            sub_80925B4(5, 1);
            r3 = 1;
        }
        if (r3)
        {
            PlaySE(SE_SELECT);
            sub_8091E20(r8[*p1 + *p2].text1);
        }
        return;
    }
}

static void sub_80927B8(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[taskId].func = sub_80927F0;
}

static void sub_80927F0(u8 taskId)
{
    if (!gPaletteFade.active)
        DestroyTask(taskId);
}
# 4841 "src/pokemon/pokedex.c"
__attribute__((naked))
void sub_8092810(u8 a, u8 b, u8 c, u8 d)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    lsls r0, 24\n    lsrs r0, 24\n    lsls r1, 24\n    lsrs r1, 24\n    mov r12, r1\n    lsls r2, 24\n    lsrs r1, r2, 24\n    lsls r3, 24\n    lsrs r5, r3, 8\n    movs r3, 0\n    cmp r5, 0\n    beq _0809285A\n    lsls r7, r1, 6\n    ldr r6, _08092860 @ =0x00000fff\n    lsls r4, r0, 12\n_08092830:\n    mov r0, r12\n    adds r1, r0, r3\n    lsls r1, 1\n    adds r1, r7, r1\n    ldr r0, _08092864 @ =0x06007800\n    adds r2, r1, r0\n    ldrh r0, [r2]\n    ands r0, r6\n    orrs r0, r4\n    strh r0, [r2]\n    ldr r0, _08092868 @ =0x06007840\n    adds r1, r0\n    ldrh r0, [r1]\n    ands r0, r6\n    orrs r0, r4\n    strh r0, [r1]\n    adds r0, r3, 0x1\n    lsls r0, 16\n    lsrs r3, r0, 16\n    cmp r0, r5\n    bcc _08092830\n_0809285A:\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08092860: .4byte 0x00000fff\n_08092864: .4byte 0x06007800\n_08092868: .4byte 0x06007840\n    .syntax divided\n");
# 4892 "src/pokemon/pokedex.c"
}


static void sub_809286C(u8 a, u8 b, u8 c)
{
    u8 r5 = (b & 1) | ((c & 1) << 1);

    switch (a)
    {
    case 0:
    case 1:
    case 2:
        sub_8092810(r5, gUnknown_083B57E4[a].unk4, gUnknown_083B57E4[a].unk5, gUnknown_083B57E4[a].unk6);
        break;
    case 3:
    case 4:
    case 7:
    case 8:
        sub_8092810(r5, gUnknown_083B57FC[a - 3].unk4, gUnknown_083B57FC[a - 3].unk5, gUnknown_083B57FC[a - 3].unk6);

    case 5:
    case 6:
        sub_8092810(r5, gUnknown_083B57FC[a - 3].unk7, gUnknown_083B57FC[a - 3].unk8, gUnknown_083B57FC[a - 3].unk9);
        break;
    case 10:
        sub_8092810(r5, gUnknown_083B57FC[2].unk4, gUnknown_083B57FC[2].unk5, gUnknown_083B57FC[2].unk6);
        break;
    case 9:
        if (!IsNationalPokedexEnabled())
            sub_8092810(r5, gUnknown_083B57FC[a - 3].unk4, gUnknown_083B57FC[a - 3].unk5 - 2, gUnknown_083B57FC[a - 3].unk6);
        else
            sub_8092810(r5, gUnknown_083B57FC[a - 3].unk4, gUnknown_083B57FC[a - 3].unk5, gUnknown_083B57FC[a - 3].unk6);
        break;
    }
}

static void sub_8092964(u8 a)
{
    switch (a)
    {
    case 0:
        sub_809286C(0, 0, 0);
        sub_809286C(1, 1, 0);
        sub_809286C(2, 1, 0);
        sub_809286C(3, 1, 0);
        sub_809286C(4, 1, 0);
        sub_809286C(10, 1, 0);
        sub_809286C(5, 1, 0);
        sub_809286C(6, 1, 0);
        sub_809286C(7, 1, 0);
        sub_809286C(8, 1, 0);
        sub_809286C(9, 1, 0);
        break;
    case 1:
        sub_809286C(0, 1, 0);
        sub_809286C(1, 0, 0);
        sub_809286C(2, 1, 0);
        sub_809286C(3, 1, 1);
        sub_809286C(4, 1, 1);
        sub_809286C(10, 1, 1);
        sub_809286C(5, 1, 1);
        sub_809286C(6, 1, 1);
        sub_809286C(7, 1, 0);
        sub_809286C(8, 1, 0);
        sub_809286C(9, 1, 0);
        break;
    case 2:
        sub_809286C(0, 1, 0);
        sub_809286C(1, 1, 0);
        sub_809286C(2, 0, 0);
        sub_809286C(3, 1, 1);
        sub_809286C(4, 1, 1);
        sub_809286C(10, 1, 1);
        sub_809286C(5, 1, 1);
        sub_809286C(6, 1, 1);
        sub_809286C(7, 1, 1);
        sub_809286C(8, 1, 1);
        sub_809286C(9, 1, 1);
        break;
    }
}

static void sub_8092AB0(u8 a)
{
    sub_8092964(a);
    sub_8091E20(gUnknown_083B57E4[a].text);
}

static void sub_8092AD4(u8 a, u8 b)
{
    sub_8092964(a);
    switch (b)
    {
    case 0:
        sub_809286C(3, 0, 0);
        break;
    case 1:
        sub_809286C(4, 0, 0);
        break;
    case 2:
        sub_809286C(10, 0, 0);
        sub_809286C(5, 0, 0);
        break;
    case 3:
        sub_809286C(10, 0, 0);
        sub_809286C(6, 0, 0);
        break;
    case 4:
        sub_809286C(7, 0, 0);
        break;
    case 5:
        sub_809286C(8, 0, 0);
        break;
    case 6:
        sub_809286C(9, 0, 0);
        break;
    }
    sub_8091E20(gUnknown_083B57FC[b].text);
}

static void sub_8092B68(u8 taskId)
{
    u16 var;

    var = gTasks[taskId].data[6] + gTasks[taskId].data[7];
    StringCopy(gStringVar1, gUnknown_083B5910[var].text2);
    MenuPrint_PixelCoords(gUnknown_083B5AB2, 45, 16, 1);

    var = gTasks[taskId].data[8] + gTasks[taskId].data[9];
    StringCopy(gStringVar1, gUnknown_083B5968[var].text2);
    MenuPrint_PixelCoords(gUnknown_083B5AB2, 45, 32, 1);

    var = gTasks[taskId].data[10] + gTasks[taskId].data[11];
    StringCopy(gStringVar1, gUnknown_083B59C8[var].text2);
    MenuPrint_PixelCoords(gUnknown_083B5AAC, 45, 48, 1);

    var = gTasks[taskId].data[12] + gTasks[taskId].data[13];
    StringCopy(gStringVar1, gUnknown_083B59C8[var].text2);
    MenuPrint_PixelCoords(gUnknown_083B5AAC, 93, 48, 1);

    var = gTasks[taskId].data[4] + gTasks[taskId].data[5];
    StringCopy(gStringVar1, gUnknown_083B58D8[var].text2);
    MenuPrint_PixelCoords(gUnknown_083B5AB2, 45, 64, 1);

    if (IsNationalPokedexEnabled())
    {
        var = gTasks[taskId].data[2] + gTasks[taskId].data[3];
        StringCopy(gStringVar1, gUnknown_083B58C0[var].text2);
        MenuPrint_PixelCoords(gUnknown_083B5AB2, 45, 80, 1);
    }
}

static void sub_8092C8C(u8 a)
{
    u16 i;
    u16 j;

    if (a == 0)
    {
        *((u16 *)(0x6000000 + 0x7800 + 0x22)) = 0xC0B;
        for (i = 0x12; i < 0x1D; i++)
            *((u16 *)(0x6000000 + 0x7800 + i * 2)) = 0x80D;
        *((u16 *)(0x6000000 + 0x7800 + 0x3A)) = 0x80B;
        for (j = 1; j < 13; j++)
        {
            *((u16 *)(0x6000000 + 0x7800 + 0x22 + j * 64)) = 0x40A;
            for (i = 0x12; i < 0x1D; i++)
                *((u16 *)(0x6000000 + 0x7800 + j * 64 + i * 2)) = 2;
            *((u16 *)(0x6000000 + 0x7800 + 0x3A + j * 64)) = 0xA;
        }
        *((u16 *)(0x6000000 + 0x7800 + 0x362)) = 0x40B;
        for (i = 0x12; i < 0x1D; i++)
            *((u16 *)(0x6000000 + 0x7800 + 0x340 + i * 2)) = 0xD;
        *((u16 *)(0x6000000 + 0x7800 + 0x37A)) = 0xB;
    }
    else
    {
        for (j = 0; j < 14; j++)
        {
            for (i = 0x11; i < 0x1E; i++)
            {
                *((u16 *)(0x6000000 + 0x7800 + j * 64 + i * 2)) = 0x4F;
            }
        }
    }
}

static void sub_8092D78(u8 taskId)
{
    const struct UnknownStruct2 *r6 = gUnknown_083B5A7C[gTasks[taskId].data[1]].unk0;
    const u16 *r8 = &gTasks[taskId].data[gUnknown_083B5A7C[gTasks[taskId].data[1]].unk4];
    const u16 *r7 = &gTasks[taskId].data[gUnknown_083B5A7C[gTasks[taskId].data[1]].unk5];
    u16 i;
    u16 j;

    MenuZeroFillWindowRect(18, 1, 28, 12);
    for (i = 0, j = *r7; i < 6 && r6[j].text2 != ((void *)0); i++, j++)
    {

        j += 0;

        MenuPrint(r6[j].text2, 18, i * 2 + 1);
    }
    sub_8091E20(r6[*r8 + *r7].text1);
}

static u8 sub_8092E10(u8 taskId, u8 b)
{
    const u16 *ptr1 = &gTasks[taskId].data[gUnknown_083B5A7C[b].unk4];
    const u16 *ptr2 = &gTasks[taskId].data[gUnknown_083B5A7C[b].unk5];
    u16 r2 = *ptr1 + *ptr2;

    switch (b)
    {
    default:
        return 0;
    case 5:
        return gUnknown_083B5A60[r2];
    case 4:
        return gUnknown_083B5A62[r2];
    case 0:
        if (r2 == 0)
            return 0xFF;
        else
            return r2;
    case 1:
        if (r2 == 0)
            return 0xFF;
        else
            return r2 - 1;
    case 2:
    case 3:
        return gUnknown_083B5A68[r2];
    }
}

static void sub_8092EB0(u8 taskId)
{
    u16 r3;

    switch (gPokedexView->unk614)
    {
    default:
    case 0:
        r3 = 0;
        break;
    case 1:
        r3 = 1;
        break;
    }
    gTasks[taskId].data[2] = r3;

    switch (gPokedexView->unk618)
    {
    default:
    case 0:
        r3 = 0;
        break;
    case 1:
        r3 = 1;
        break;
    case 2:
        r3 = 2;
        break;
    case 3:
        r3 = 3;
        break;
    case 4:
        r3 = 4;
        break;
    case 5:
        r3 = 5;
        break;
    }
    gTasks[taskId].data[4] = r3;
}

static bool8 sub_8092F44(u8 taskId)
{
    u8 val1 = gTasks[taskId].data[1];
    const u16 *ptr = &gTasks[taskId].data[gUnknown_083B5A7C[val1].unk5];
    u16 val2 = gUnknown_083B5A7C[val1].unk6 - 1;

    if (val2 > 5 && *ptr != 0)
        return 0;
    else
        return 1;
}

static bool8 sub_8092F8C(u8 taskId)
{
    u8 val1 = gTasks[taskId].data[1];
    const u16 *ptr = &gTasks[taskId].data[gUnknown_083B5A7C[val1].unk5];
    u16 val2 = gUnknown_083B5A7C[val1].unk6 - 1;

    if (val2 > 5 && *ptr < val2 - 5)
        return 0;
    else
        return 1;
}

static void sub_8092FD8(struct Sprite *sprite)
{
    if (gTasks[sprite->data[0]].func == sub_8092644)
    {
        u8 val;

        if (sprite->data[1] != 0)
        {
            if (sub_8092F8C(sprite->data[0]))
                sprite->invisible = 1;
            else
                sprite->invisible = 0;
        }
        else
        {
            if (sub_8092F44(sprite->data[0]))
                sprite->invisible = 1;
            else
                sprite->invisible = 0;
        }
        val = sprite->data[2] + sprite->data[1] * 128;
        sprite->pos2.y = gSineTable[val] / 128;
        sprite->data[2] += 8;
    }
    else
    {
        sprite->invisible = 1;
    }
}

static void sub_809308C(u8 taskId)
{
    u8 spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_83A053C, 184, 4, 0);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = 0;
    gSprites[spriteId].callback = sub_8092FD8;

    spriteId = CreateSprite(&gSpriteTemplate_83A053C, 184, 108, 0);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = 1;
    gSprites[spriteId].vFlip = 1;
    gSprites[spriteId].callback = sub_8092FD8;
}
