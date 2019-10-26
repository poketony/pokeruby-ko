# 1 "src/pokemon/pokemon_data.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/pokemon/pokemon_data.c"
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
# 2 "src/pokemon/pokemon_data.c" 2
# 1 "include/pokemon.h" 1
# 3 "src/pokemon/pokemon_data.c" 2
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
# 4 "src/pokemon/pokemon_data.c" 2
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
# 5 "src/pokemon/pokemon_data.c" 2
# 1 "include/abilities.h" 1



enum
{
    ABILITY_NONE,
    ABILITY_STENCH,
    ABILITY_DRIZZLE,
    ABILITY_SPEED_BOOST,
    ABILITY_BATTLE_ARMOR,
    ABILITY_STURDY,
    ABILITY_DAMP,
    ABILITY_LIMBER,
    ABILITY_SAND_VEIL,
    ABILITY_STATIC,
    ABILITY_VOLT_ABSORB,
    ABILITY_WATER_ABSORB,
    ABILITY_OBLIVIOUS,
    ABILITY_CLOUD_NINE,
    ABILITY_COMPOUND_EYES,
    ABILITY_INSOMNIA,
    ABILITY_COLOR_CHANGE,
    ABILITY_IMMUNITY,
    ABILITY_FLASH_FIRE,
    ABILITY_SHIELD_DUST,
    ABILITY_OWN_TEMPO,
    ABILITY_SUCTION_CUPS,
    ABILITY_INTIMIDATE,
    ABILITY_SHADOW_TAG,
    ABILITY_ROUGH_SKIN,
    ABILITY_WONDER_GUARD,
    ABILITY_LEVITATE,
    ABILITY_EFFECT_SPORE,
    ABILITY_SYNCHRONIZE,
    ABILITY_CLEAR_BODY,
    ABILITY_NATURAL_CURE,
    ABILITY_LIGHTNING_ROD,
    ABILITY_SERENE_GRACE,
    ABILITY_SWIFT_SWIM,
    ABILITY_CHLOROPHYLL,
    ABILITY_ILLUMINATE,
    ABILITY_TRACE,
    ABILITY_HUGE_POWER,
    ABILITY_POISON_POINT,
    ABILITY_INNER_FOCUS,
    ABILITY_MAGMA_ARMOR,
    ABILITY_WATER_VEIL,
    ABILITY_MAGNET_PULL,
    ABILITY_SOUNDPROOF,
    ABILITY_RAIN_DISH,
    ABILITY_SAND_STREAM,
    ABILITY_PRESSURE,
    ABILITY_THICK_FAT,
    ABILITY_EARLY_BIRD,
    ABILITY_FLAME_BODY,
    ABILITY_RUN_AWAY,
    ABILITY_KEEN_EYE,
    ABILITY_HYPER_CUTTER,
    ABILITY_PICKUP,
    ABILITY_TRUANT,
    ABILITY_HUSTLE,
    ABILITY_CUTE_CHARM,
    ABILITY_PLUS,
    ABILITY_MINUS,
    ABILITY_FORECAST,
    ABILITY_STICKY_HOLD,
    ABILITY_SHED_SKIN,
    ABILITY_GUTS,
    ABILITY_MARVEL_SCALE,
    ABILITY_LIQUID_OOZE,
    ABILITY_OVERGROW,
    ABILITY_BLAZE,
    ABILITY_TORRENT,
    ABILITY_SWARM,
    ABILITY_ROCK_HEAD,
    ABILITY_DROUGHT,
    ABILITY_ARENA_TRAP,
    ABILITY_VITAL_SPIRIT,
    ABILITY_WHITE_SMOKE,
    ABILITY_PURE_POWER,
    ABILITY_SHELL_ARMOR,
    ABILITY_CACOPHONY,
    ABILITY_AIR_LOCK
};
# 6 "src/pokemon/pokemon_data.c" 2
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
# 7 "src/pokemon/pokemon_data.c" 2
# 1 "include/hold_effects.h" 1
# 8 "src/pokemon/pokemon_data.c" 2
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
# 9 "src/pokemon/pokemon_data.c" 2
# 1 "include/sprite.h" 1
# 10 "src/pokemon/pokemon_data.c" 2
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
# 11 "src/pokemon/pokemon_data.c" 2

# 1 "src/pokemon/../data/pokemon/dex_order.h" 1







const u16 gSpeciesToHoennPokedexNum[] = {203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 156, 157, 112, 113, 227, 228, 229, 230, 231, 232, 233, 234, 153, 154, 138, 139, 63, 64, 88, 89, 90, 235, 236, 237, 238, 239, 240, 241, 242, 158, 159, 243, 244, 245, 246, 247, 248, 249, 39, 40, 41, 73, 74, 75, 250, 251, 252, 66, 67, 57, 58, 59, 253, 254, 255, 256, 82, 83, 257, 92, 93, 258, 259, 106, 107, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 84, 85, 270, 271, 272, 273, 274, 275, 276, 108, 109, 169, 170, 277, 278, 279, 184, 185, 50, 51, 143, 144, 280, 281, 282, 283, 284, 167, 285, 52, 53, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 65, 181, 182, 155, 324, 137, 325, 326, 162, 163, 327, 328, 329, 91, 55, 56, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 161, 164, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 168, 357, 358, 359, 103, 104, 360, 361, 180, 362, 363, 364, 365, 115, 366, 367, 186, 165, 166, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 42, 43, 44, 25, 26, 34, 35, 114, 27, 28, 32, 33, 99, 100, 61, 62, 145, 131, 132, 60, 105, 68, 127, 128, 183, 129, 130, 140, 141, 97, 98, 116, 117, 118, 48, 49, 78, 79, 101, 102, 173, 174, 175, 119, 120, 171, 172, 125, 126, 54, 110, 111, 80, 81, 69, 76, 77, 121, 122, 160, 148, 149, 94, 36, 37, 38, 95, 96, 150, 45, 46, 47, 176, 177, 178, 152, 146, 147, 124, 123, 179, 70, 71, 72, 142, 86, 87, 133, 134, 135, 136, 29, 30, 31, 187, 188, 189, 190, 191, 192, 193, 194, 195, 198, 199, 200, 196, 197, 201, 202, 151
};

const u16 gSpeciesToNationalPokedexNum[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 290, 291, 292, 276, 277, 285, 286, 327, 278, 279, 283, 284, 320, 321, 300, 301, 352, 343, 344, 299, 324, 302, 339, 340, 370, 341, 342, 349, 350, 318, 319, 328, 329, 330, 296, 297, 309, 310, 322, 323, 363, 364, 365, 331, 332, 361, 362, 337, 338, 298, 325, 326, 311, 312, 303, 307, 308, 333, 334, 360, 355, 356, 315, 287, 288, 289, 316, 317, 357, 293, 294, 295, 366, 367, 368, 359, 353, 354, 336, 335, 369, 304, 305, 306, 351, 313, 314, 345, 346, 347, 348, 280, 281, 282, 371, 372, 373, 374, 375, 376, 377, 378, 379, 382, 383, 384, 380, 381, 385, 386, 358};

const u16 gHoennToNationalOrder[] = {252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 63, 64, 65, 290, 291, 292, 293, 294, 295, 296, 297, 118, 119, 129, 130, 298, 183, 184, 74, 75, 76, 299, 300, 301, 41, 42, 169, 72, 73, 302, 303, 304, 305, 306, 66, 67, 68, 307, 308, 309, 310, 311, 312, 81, 82, 100, 101, 313, 314, 43, 44, 45, 182, 84, 85, 315, 316, 317, 318, 319, 320, 321, 322, 323, 218, 219, 324, 88, 89, 109, 110, 325, 326, 27, 28, 327, 227, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 174, 39, 40, 349, 350, 351, 120, 121, 352, 353, 354, 355, 356, 357, 358, 359, 37, 38, 172, 25, 26, 54, 55, 360, 202, 177, 178, 203, 231, 232, 127, 214, 111, 112, 361, 362, 363, 364, 365, 366, 367, 368, 369, 222, 170, 171, 370, 116, 117, 230, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 29, 30, 31, 32, 33, 34, 35, 36, 46, 47, 48, 49, 50, 51, 52, 53, 56, 57, 58, 59, 60, 61, 62, 69, 70, 71, 77, 78, 79, 80, 83, 86, 87, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 102, 103, 104, 105, 106, 107, 108, 113, 114, 115, 122, 123, 124, 125, 126, 128, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 173, 175, 176, 179, 180, 181, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 215, 216, 217, 220, 221, 223, 224, 225, 226, 228, 229, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411};
# 13 "src/pokemon/pokemon_data.c" 2
# 1 "src/pokemon/../data/pokemon/spinda_spots.h" 1







const struct SpindaSpot gSpindaSpotGraphics[] = {
    {16, 14, INCBIN_U16("graphics/spinda_spots/spot_0.bin")},
    {40, 15, INCBIN_U16("graphics/spinda_spots/spot_1.bin")},
    {22, 32, INCBIN_U16("graphics/spinda_spots/spot_2.bin")},
    {34, 33, INCBIN_U16("graphics/spinda_spots/spot_3.bin")}
};
# 14 "src/pokemon/pokemon_data.c" 2
# 1 "src/pokemon/../data/pokemon/item_effects.h" 1







const u8 gItemEffect_Potion[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    20
};

const u8 gItemEffect_Antidote[] = {
    0x00,
    0x00,
    0x00,
    0x10,
    0x00,
    0x00
};

const u8 gItemEffect_BurnHeal[] = {
    0x00,
    0x00,
    0x00,
    0x08,
    0x00,
    0x00
};

const u8 gItemEffect_IceHeal[] = {
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    0x00
};

const u8 gItemEffect_Awakening[] = {
    0x00,
    0x00,
    0x00,
    0x20,
    0x00,
    0x00
};

const u8 gItemEffect_ParalyzeHeal[] = {
    0x00,
    0x00,
    0x00,
    0x02,
    0x00,
    0x00
};

const u8 gItemEffect_FullRestore[] = {
    0x00,
    0x00,
    0x00,
    0x3f,
    0x04,
    0x00,
    0xff
};

const u8 gItemEffect_MaxPotion[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    0xff
};

const u8 gItemEffect_HyperPotion[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    200
};

const u8 gItemEffect_SuperPotion[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    50
};

const u8 gItemEffect_FullHeal[] = {
    0x00,
    0x00,
    0x00,
    0x3f,
    0x00,
    0x00
};

const u8 gItemEffect_Revive[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x44,
    0x00,
    0xfe
};

const u8 gItemEffect_MaxRevive[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x44,
    0x00,
    0xff
};

const u8 gItemEffect_FreshWater[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    50
};

const u8 gItemEffect_SodaPop[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    60
};

const u8 gItemEffect_Lemonade[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    80
};

const u8 gItemEffect_MoomooMilk[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    100
};

const u8 gItemEffect_EnergyPowder[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0xe0,
    50,
    0xfb,
    0xfb,
    0xf6
};

const u8 gItemEffect_EnergyRoot[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0xe0,
    200,
    0xf6,
    0xf6,
    0xf1
};

const u8 gItemEffect_HealPowder[] = {
    0x00,
    0x00,
    0x00,
    0x3f,
    0x00,
    0xe0,
    0xfb,
    0xfb,
    0xf6
};

const u8 gItemEffect_RevivalHerb[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x44,
    0xe0,
    0xfe,
    0xf1,
    0xf1,
    0xec
};

const u8 gItemEffect_Ether[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x18,
    0x00,
    0x0a
};

const u8 gItemEffect_MaxEther[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x18,
    0x00,
    0x7f
};

const u8 gItemEffect_Elixir[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x08,
    0x00,
    0x0a
};

const u8 gItemEffect_MaxElixir[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x08,
    0x00,
    0x7f
};

const u8 gItemEffect_LavaCookie[] = {
    0x00,
    0x00,
    0x00,
    0x3f,
    0x00,
    0x00
};

const u8 gItemEffect_BlueFlute[] = {
    0x00,
    0x00,
    0x00,
    0x20,
    0x00,
    0x00
};

const u8 gItemEffect_YellowFlute[] = {
    0x00,
    0x00,
    0x00,
    0x01,
    0x00,
    0x00
};

const u8 gItemEffect_RedFlute[] = {
    0x80,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00
};

const u8 gItemEffect_BerryJuice[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    20
};

const u8 gItemEffect_SacredAsh[] = {
    0x40,
    0x00,
    0x00,
    0x00,
    0x44,
    0x00,
    0xff
};

const u8 gItemEffect_HPUp[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x01,
    0xe0,
    0x0a,
    0x05,
    0x03,
    0x02
};

const u8 gItemEffect_Protein[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x02,
    0xe0,
    0x0a,
    0x05,
    0x03,
    0x02
};

const u8 gItemEffect_Iron[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0xe1,
    0x0a,
    0x05,
    0x03,
    0x02
};

const u8 gItemEffect_Carbos[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0xe2,
    0x0a,
    0x05,
    0x03,
    0x02
};

const u8 gItemEffect_Calcium[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0xe8,
    0x0a,
    0x05,
    0x03,
    0x02
};

const u8 gItemEffect_RareCandy[] = {
    0x00,
    0x00,
    0x00,
    0x40,
    0x44,
    0xe0,
    253,
    0x05,
    0x03,
    0x02
};

const u8 gItemEffect_PPUp[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x20,
    0xe0,
    0x05,
    0x03,
    0x02
};

const u8 gItemEffect_Zinc[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0xe4,
    0x0a,
    0x05,
    0x03,
    0x02
};

const u8 gItemEffect_PPMax[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0xf0,
    0x05,
    0x03,
    0x02
};

const u8 gItemEffect_GuardSpec[] = {
    0x00,
    0x00,
    0x00,
    0x80,
    0x00,
    0x60,
    0x01,
    0x01
};

const u8 gItemEffect_DireHit[] = {
    0x20,
    0x00,
    0x00,
    0x00,
    0x00,
    0x60,
    0x01,
    0x01
};

const u8 gItemEffect_XAttack[] = {
    0x01,
    0x00,
    0x00,
    0x00,
    0x00,
    0x60,
    0x01,
    0x01
};

const u8 gItemEffect_XDefend[] = {
    0x00,
    0x10,
    0x00,
    0x00,
    0x00,
    0x60,
    0x01,
    0x01
};

const u8 gItemEffect_XSpeed[] = {
    0x00,
    0x01,
    0x00,
    0x00,
    0x00,
    0x60,
    0x01,
    0x01
};

const u8 gItemEffect_XAccuracy[] = {
    0x00,
    0x00,
    0x10,
    0x00,
    0x00,
    0x60,
    0x01,
    0x01
};

const u8 gItemEffect_XSpecial[] = {
    0x00,
    0x00,
    0x01,
    0x00,
    0x00,
    0x60,
    0x01,
    0x01
};

const u8 gItemEffect_SunStone[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x80,
    0x00
};

const u8 gItemEffect_MoonStone[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x80,
    0x00
};

const u8 gItemEffect_FireStone[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x80,
    0x00
};

const u8 gItemEffect_ThunderStone[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x80,
    0x00
};

const u8 gItemEffect_WaterStone[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x80,
    0x00
};

const u8 gItemEffect_LeafStone[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x80,
    0x00
};

const u8 gItemEffect_CheriBerry[] = {
    0x00,
    0x00,
    0x00,
    0x02,
    0x00,
    0x00
};

const u8 gItemEffect_ChestoBerry[] = {
    0x00,
    0x00,
    0x00,
    0x20,
    0x00,
    0x00
};

const u8 gItemEffect_PechaBerry[] = {
    0x00,
    0x00,
    0x00,
    0x10,
    0x00,
    0x00
};

const u8 gItemEffect_RawstBerry[] = {
    0x00,
    0x00,
    0x00,
    0x08,
    0x00,
    0x00
};

const u8 gItemEffect_AspearBerry[] = {
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    0x00
};

const u8 gItemEffect_LeppaBerry[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x18,
    0x00,
    0x0a
};

const u8 gItemEffect_OranBerry[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    10
};

const u8 gItemEffect_PersimBerry[] = {
    0x00,
    0x00,
    0x00,
    0x01,
    0x00,
    0x00
};

const u8 gItemEffect_LumBerry[] = {
    0x00,
    0x00,
    0x00,
    0x3f,
    0x00,
    0x00
};

const u8 gItemEffect_SitrusBerry[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x04,
    0x00,
    30
};

const u8 *const gItemEffectTable[] = {
    gItemEffect_Potion,
    gItemEffect_Antidote,
    gItemEffect_BurnHeal,
    gItemEffect_IceHeal,
    gItemEffect_Awakening,
    gItemEffect_ParalyzeHeal,
    gItemEffect_FullRestore,
    gItemEffect_MaxPotion,
    gItemEffect_HyperPotion,
    gItemEffect_SuperPotion,
    gItemEffect_FullHeal,
    gItemEffect_Revive,
    gItemEffect_MaxRevive,
    gItemEffect_FreshWater,
    gItemEffect_SodaPop,
    gItemEffect_Lemonade,
    gItemEffect_MoomooMilk,
    gItemEffect_EnergyPowder,
    gItemEffect_EnergyRoot,
    gItemEffect_HealPowder,
    gItemEffect_RevivalHerb,
    gItemEffect_Ether,
    gItemEffect_MaxEther,
    gItemEffect_Elixir,
    gItemEffect_MaxElixir,
    gItemEffect_LavaCookie,
    gItemEffect_BlueFlute,
    gItemEffect_YellowFlute,
    gItemEffect_RedFlute,
    ((void *)0),
    ((void *)0),
    gItemEffect_BerryJuice,
    gItemEffect_SacredAsh,
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    gItemEffect_HPUp,
    gItemEffect_Protein,
    gItemEffect_Iron,
    gItemEffect_Carbos,
    gItemEffect_Calcium,
    gItemEffect_RareCandy,
    gItemEffect_PPUp,
    gItemEffect_Zinc,
    gItemEffect_PPMax,
    ((void *)0),
    gItemEffect_GuardSpec,
    gItemEffect_DireHit,
    gItemEffect_XAttack,
    gItemEffect_XDefend,
    gItemEffect_XSpeed,
    gItemEffect_XAccuracy,
    gItemEffect_XSpecial,
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    gItemEffect_SunStone,
    gItemEffect_MoonStone,
    gItemEffect_FireStone,
    gItemEffect_ThunderStone,
    gItemEffect_WaterStone,
    gItemEffect_LeafStone,
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    gItemEffect_CheriBerry,
    gItemEffect_ChestoBerry,
    gItemEffect_PechaBerry,
    gItemEffect_RawstBerry,
    gItemEffect_AspearBerry,
    gItemEffect_LeppaBerry,
    gItemEffect_OranBerry,
    gItemEffect_PersimBerry,
    gItemEffect_LumBerry,
    gItemEffect_SitrusBerry,
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0),
    ((void *)0)
};
# 15 "src/pokemon/pokemon_data.c" 2
# 1 "src/pokemon/../data/pokemon/nature_stats.h" 1







const s8 gNatureStatTable[][5] = {

    { 0, 0, 0, 0, 0},
    { 1, -1, 0, 0, 0},
    { 1, 0, -1, 0, 0},
    { 1, 0, 0, -1, 0},
    { 1, 0, 0, 0, -1},
    { -1, 1, 0, 0, 0},
    { 0, 0, 0, 0, 0},
    { 0, 1, -1, 0, 0},
    { 0, 1, 0, -1, 0},
    { 0, 1, 0, 0, -1},
    { -1, 0, 1, 0, 0},
    { 0, -1, 1, 0, 0},
    { 0, 0, 0, 0, 0},
    { 0, 0, 1, -1, 0},
    { 0, 0, 1, 0, -1},
    { -1, 0, 0, 1, 0},
    { 0, -1, 0, 1, 0},
    { 0, 0, -1, 1, 0},
    { 0, 0, 0, 0, 0},
    { 0, 0, 0, 1, -1},
    { -1, 0, 0, 0, 1},
    { 0, -1, 0, 0, 1},
    { 0, 0, -1, 0, 1},
    { 0, 0, 0, -1, 1},
    { 0, 0, 0, 0, 0}
};
# 16 "src/pokemon/pokemon_data.c" 2
# 1 "src/pokemon/../data/pokemon/tmhm_learnsets.h" 1
# 12 "src/pokemon/../data/pokemon/tmhm_learnsets.h"
asm(
    ".align 2\n"
    ".global gTMHMLearnsets\n"
    "gTMHMLearnsets:\n"

    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0011100100000111100000100010000100001101010000011100100000\n"
    ".8byte 0b0011100100000111100000100010000100001101010000011100100000\n"
    ".8byte 0b0011100100000111100000100010000110001101010100011100110000\n"
    ".8byte 0b0010100110000111101010010011001100010100010000011000100011\n"
    ".8byte 0b0010100110000111101010010011001100010100010000011000100011\n"
    ".8byte 0b0010101110010111101010010011001110010100010100011000110011\n"
    ".8byte 0b1110110000000111100000000011001100010100110011001001100101\n"
    ".8byte 0b1110110000000111100000000011001100010100110011001001100101\n"
    ".8byte 0b1110110000000111100000000011001110010100110111001001110101\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0001000000101111101000000010110100001111110100011000100000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0010000100001111101000100011000100001101010100011000100000\n"
    ".8byte 0b0000001000011111101000000010000100000100110000011000100000\n"
    ".8byte 0b0000001000011111101000000010000100000100110000011000100000\n"
    ".8byte 0b0000001000011111101000000010000100000100110100011000100000\n"
    ".8byte 0b0010000100001111100000001010101101110100110011111000100000\n"
    ".8byte 0b0010100100001111100000001010101101110100110111111000110000\n"
    ".8byte 0b0000001000011111101000000010000100000100110000011000100000\n"
    ".8byte 0b0000001000011111101000000010000100000100110100011000100000\n"
    ".8byte 0b0000100001001111110000100010001110010101110000011000100000\n"
    ".8byte 0b0000100001001111110000100010001110010101110100011000100000\n"
    ".8byte 0b0011100000000111100000001011001101110100111000001000100001\n"
    ".8byte 0b0011100000001111100000001011001101110100111100001000100001\n"
    ".8byte 0b0010100100001111101101000011001110010100010000011000100001\n"
    ".8byte 0b0010100100001111101101000011001110010100010100011000100001\n"
    ".8byte 0b0010100100001111101000101010001101110100110011011000100100\n"
    ".8byte 0b0010100100001111101000101010001101110100110011011000100100\n"
    ".8byte 0b0010110100001111111111111011101111110100110111111000110101\n"
    ".8byte 0b0010100100001111100000101010001101110100110011011000100100\n"
    ".8byte 0b0010100100001111100000101010001101110100110011011000100100\n"
    ".8byte 0b0010110100001111110111111011101111110100110111111000110101\n"
    ".8byte 0b0001100001000111100010011111111101111110111011011000101101\n"
    ".8byte 0b0001100001000111100010011111111101111110111111011000101101\n"
    ".8byte 0b0000000010000111100010010010001100010110010000011000110000\n"
    ".8byte 0b0000000010000111100010010010001100010110010100011000110000\n"
    ".8byte 0b0001100001000111100010011111111101101110111011011000100101\n"
    ".8byte 0b0001100001000111100010011111111101101110111111011000100101\n"
    ".8byte 0b0000000001011111111000100010100100000101110000111000100000\n"
    ".8byte 0b0000000001011111111000100010100100000101110100111000100000\n"
    ".8byte 0b0001000100000111100000100010000100001101010000011100100000\n"
    ".8byte 0b0001000100000111100000100010000100001101010000011100100000\n"
    ".8byte 0b0001000100000111100000100010000100001101010100011100100000\n"
    ".8byte 0b0011000100001111101000100010001100001101010000011100100000\n"
    ".8byte 0b0011000100001111101000100010001100001101010100011100100000\n"
    ".8byte 0b0001000000101111100000100010010100001101010000011000100000\n"
    ".8byte 0b0001000000101111101000100010010100001101010100011000100000\n"
    ".8byte 0b0010000100001111101100100010001110000100010000011000100000\n"
    ".8byte 0b0010000100001111101100100010001110000100010100011000100000\n"
    ".8byte 0b0001000101001111111000001010101101110100110000111000100100\n"
    ".8byte 0b0001000101001111111000001010101101110100110100111000110100\n"
    ".8byte 0b1111110000000111101000000011001100010100110011001001101101\n"
    ".8byte 0b1111110000000111101000000011001100010100110111001001101101\n"
    ".8byte 0b0010100010001111101100000011001111110100110000111010100001\n"
    ".8byte 0b0010100010001111101100000011001111110100110100111010100001\n"
    ".8byte 0b0010100010001111101010010010001100010100010000011000110000\n"
    ".8byte 0b0010100010001111101010010010001100010100010100011000110000\n"
    ".8byte 0b1100010000001111100000000010011100000100110011001001100100\n"
    ".8byte 0b1110110000001111100000000011011110000100110011001001100101\n"
    ".8byte 0b1110110000001111100100000011011110000100110111001011100101\n"
    ".8byte 0b0001000001101111110000001110110100010110111000111000101001\n"
    ".8byte 0b0001000001101111110000001110110100010110111000111000101001\n"
    ".8byte 0b0001000001101111110000001110110100010110111100111000101001\n"
    ".8byte 0b0010100000001111100110010011001110000100110000011010100001\n"
    ".8byte 0b0010100000001111100110010011001110000100110000011010100001\n"
    ".8byte 0b0010100000001111100110010011001110000100110100011010100001\n"
    ".8byte 0b0001000100001111100000100010000100001101010000011100100000\n"
    ".8byte 0b0001000100001111100000100010000100001101010000011100100000\n"
    ".8byte 0b0001000100001111100000100010000100001101010100011100100000\n"
    ".8byte 0b1100010100001111100000100010000100000101110011001001100100\n"
    ".8byte 0b1100010100001111100000100010000100000101110111001001100100\n"
    ".8byte 0b0010100000000111100111010011001110000100010000011000100001\n"
    ".8byte 0b0010100000000111100111010011001110000100010000011000100001\n"
    ".8byte 0b0010100000000111100111010011001110000100010100011000110001\n"
    ".8byte 0b0000100010000111100010010010000100011100010000011000100000\n"
    ".8byte 0b0000100010000111100010010010000100011100010100011000100000\n"
    ".8byte 0b1001110000100111100010010010111110010110110011011001101100\n"
    ".8byte 0b1011110000100111100010010011111110010110110111011001101101\n"
    ".8byte 0b0001000000000011100000001110000101100100110000011000100000\n"
    ".8byte 0b0001000000000011100000001110000101100100110100011000100000\n"
    ".8byte 0b0000001100011111101000000010000100010100010000011000100000\n"
    ".8byte 0b0000001000011111101000000010000100000100010000011000100000\n"
    ".8byte 0b0000001000011111111000000010000100000100010100111000100000\n"
    ".8byte 0b1100010000001111100000000010000100000110110011001001100100\n"
    ".8byte 0b1100010000001111100000000010000100000110110111001001100100\n"
    ".8byte 0b0000000000001111110110111010001101100101110000111000100000\n"
    ".8byte 0b0010100000001111110110111011001101100101110100111000100001\n"
    ".8byte 0b1000010000000111100000000010000100000100110011001001100100\n"
    ".8byte 0b1000010000000111110000000010000100000100110111001001100100\n"
    ".8byte 0b0000000001101111110000100010110100100101110000111000100000\n"
    ".8byte 0b0000000001101111110000100010110100100101110000111000100000\n"
    ".8byte 0b0010100001101111110000100011110101100101110100111000100001\n"
    ".8byte 0b0010100000000111110101000010001110010100010000111000110000\n"
    ".8byte 0b0001000001101111110000000111110100000110111000111000101001\n"
    ".8byte 0b0001000001101111110000000111110100000110111100111000101001\n"
    ".8byte 0b1010110100001111100100000010001100000100110011001001100100\n"
    ".8byte 0b1010110100001111100100000010001100000100110111001001100100\n"
    ".8byte 0b0001000000001011110000001010000101100100111000101000100000\n"
    ".8byte 0b0001000000001011110000001010000101100100111100101000100000\n"
    ".8byte 0b0001100000101111100000100110010100001101011000011100100000\n"
    ".8byte 0b0001100000101111100000100110010100001101011100011100100000\n"
    ".8byte 0b0010100000001111101111010011001110010100010011011000100001\n"
    ".8byte 0b0010100000001111101111010011001110010100010111011000100001\n"
    ".8byte 0b0010100000001111100100000011000110000100110000011010100001\n"
    ".8byte 0b0010100000001111100100000011000110000100110000011010100001\n"
    ".8byte 0b0010110100001111100111011011101111111100110111011000100101\n"
    ".8byte 0b0001000000001111110010111010100101100100110000111000100000\n"
    ".8byte 0b0001000000001111110010111010100101100100110100111000100000\n"
    ".8byte 0b0010100000001111100111011010001111110100110011011000110000\n"
    ".8byte 0b0010110100001111100111011011001111110100110111011000110001\n"
    ".8byte 0b0011100001100111100111011011110111111110111111011001101101\n"
    ".8byte 0b0011000100001111100000100010000100001101010100011100100000\n"
    ".8byte 0b0010110100001111101111011011101111111100110111011001110101\n"
    ".8byte 0b1100010000000111100000000010000100000100110011001001100100\n"
    ".8byte 0b1100010000000111100000000010000100000100110111001001100100\n"
    ".8byte 0b1100010000000111100000000010000100000100110011001001100100\n"
    ".8byte 0b1100010000000111100000000010000100000100110111001001100100\n"
    ".8byte 0b1101010000000011100000000110010101100100111011001001100100\n"
    ".8byte 0b1101010000100011100000000110010101100100111111001001100100\n"
    ".8byte 0b0001000001101111110000001111110101101110111100111000101001\n"
    ".8byte 0b0010000100011111101000000010000100000100110100011000100000\n"
    ".8byte 0b0001000000101111110000000111110100000100111111101001101101\n"
    ".8byte 0b0011100000001111100000001011010101110100111100001000100001\n"
    ".8byte 0b0010100000001111100010010011010100010100010100011000100001\n"
    ".8byte 0b0010100100001111100100000011001110000100110100011010100001\n"
    ".8byte 0b0010110000000111100111011010000111111100110111011000100100\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b1110110000000111110011010010000111100100110111101001110100\n"
    ".8byte 0b1110110000000111100000001010010101110110110111001001110100\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000111100000000010101100010100110000011000100000\n"
    ".8byte 0b1100010000000111100000000010101100010100110111011001110100\n"
    ".8byte 0b0001000000000111100000001010101101110100110100011000110000\n"
    ".8byte 0b0000000010000111100010010010101100010100110100011000110000\n"
    ".8byte 0b0001000000001011101000001010110101111100110111011000100000\n"
    ".8byte 0b1110010000001111100101000010000100000100110011001001100100\n"
    ".8byte 0b1110010000001111100101000010000100000100110111001001100100\n"
    ".8byte 0b0110010000001111101101000010001100000101110011001001100100\n"
    ".8byte 0b1110010100001111101101000011001100000101110111001001100100\n"
    ".8byte 0b0010101000011111111111010010000110010100110100111000110010\n"
    ".8byte 0b0000110000000111100111011011110111101100110111011000100101\n"
    ".8byte 0b0010001000010011101001000110000100000100110111011001110100\n"
    ".8byte 0b0011001000010011101001001010000101100100111100011000110000\n"
    ".8byte 0b0010001010010011101011010010000100000110110100011000110000\n"
    ".8byte 0b0100010000000111100010011010000101110110110111011001100100\n"
    ".8byte 0b0100010000000111100010011010000101110110110111011001100100\n"
    ".8byte 0b1110111100010111101111011011000111110110110111011001110111\n"
    ".8byte 0b0011100001100011111111011111110111111110111111111011101101\n"
    ".8byte 0b1111111111111111111111111111111111111111111111111111111111\n"
    ".8byte 0b0001000100000111100000000110000100011111011000011100100000\n"
    ".8byte 0b0011100100000111100000000110000100011111011000011100100000\n"
    ".8byte 0b0011100100000111100000000110000110011111011100011100100000\n"
    ".8byte 0b0000000110000111101010010010001100000100010000011000100000\n"
    ".8byte 0b0010100110000111101010010011001100000100010000011000110001\n"
    ".8byte 0b0010100110000111101010010011001110000100010100011000110001\n"
    ".8byte 0b1100010100000111101000000011001100010100110011001001100101\n"
    ".8byte 0b1110110100000111101000000011001100010100110011001001110101\n"
    ".8byte 0b1110110100000111101000000011001110010100110111001001110111\n"
    ".8byte 0b0000010100001111100000011011101100111100110001011000100101\n"
    ".8byte 0b0010110100001111100000011011101101111100110111011000100101\n"
    ".8byte 0b0001001000011111101000000110110100000100110000011000100000\n"
    ".8byte 0b0001001000011111101000000110110100000100110100011000100000\n"
    ".8byte 0b0001000000001111101000000111001100001111011000011000100001\n"
    ".8byte 0b0001000000001111101000000111001100001111011100011000100001\n"
    ".8byte 0b0001000000001111100000100010011100001101010000011000100000\n"
    ".8byte 0b0001000000001111100000100010011100001101010100011000100000\n"
    ".8byte 0b0000001001011111111000100010100100000101110100111000100000\n"
    ".8byte 0b1101010000000111100000001010000101100100110011001001100100\n"
    ".8byte 0b1101010000000111100000001010000101100100110111001001100100\n"
    ".8byte 0b0001000000000111100000001010000101110100111000001000100000\n"
    ".8byte 0b0001000000000111100010011110111100011110111000011000100100\n"
    ".8byte 0b0001000000000111100010011110111100001110111000011000100100\n"
    ".8byte 0b0011000000000111100010011110110100001110111000011000100100\n"
    ".8byte 0b0011001000010111101010011111110100001110111100011000100101\n"
    ".8byte 0b0001000000111111101000000110110100001101111000011000101000\n"
    ".8byte 0b0001001000111111101000000110110100001101111100011000101000\n"
    ".8byte 0b0001000000000111100000001010000101110100111000001000100000\n"
    ".8byte 0b0011100000000111100000001011000101110100111000001000100001\n"
    ".8byte 0b0011100000000111100000001011000101110100111100001000100001\n"
    ".8byte 0b0001000100000111100000100010000100001111010100011100100000\n"
    ".8byte 0b1110110000000111100000000011001100010100110011001001100101\n"
    ".8byte 0b1110110000000111100000000011001100010100110111001001100101\n"
    ".8byte 0b0010100000001111100101000011001110000100010000111000101001\n"
    ".8byte 0b1110110000001111100000000011011110000100110111001001100101\n"
    ".8byte 0b0001000000000111101000000010000100001101010000011100100000\n"
    ".8byte 0b0001000000000111101000000010000100001101010000011100100000\n"
    ".8byte 0b0001000000000111101000000010000100001101010100011100100000\n"
    ".8byte 0b0010100101001111101000001011101101111100110000111000100101\n"
    ".8byte 0b0001000100000111100000100010000100001111011000011100100000\n"
    ".8byte 0b0001000100000111100000100010000100001111011100011100100000\n"
    ".8byte 0b0001000000011111101000000010110100001101010000011000100000\n"
    ".8byte 0b1111010000000111100001100010001110010100110011001001100100\n"
    ".8byte 0b1111110000000111100101100011001110010100110111001001100101\n"
    ".8byte 0b0001000100100111100000000110111100010100111100011000101000\n"
    ".8byte 0b0001000101000111110000000010111100010100110100111000100000\n"
    ".8byte 0b0000001001011111111000000010100100000100110000111000101000\n"
    ".8byte 0b1011110000100111100010010011111110010110110111011001101101\n"
    ".8byte 0b0001000001101111111000001010110101100100110000111000101000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0011100000101111100000001110110111110100111000011000101000\n"
    ".8byte 0b0010100000000111100001000110001110001101011000011000100000\n"
    ".8byte 0b0010100000000111100001000110001110001101011100011000100000\n"
    ".8byte 0b0010100000001111100110011010101111111100110011011000101100\n"
    ".8byte 0b0010100100011111101101100010001110010100110000011000100000\n"
    ".8byte 0b0010100100000111110101000010001110010100010100111000110000\n"
    ".8byte 0b0010100010001111110010111011101111101100110000111010110101\n"
    ".8byte 0b0010100010001111110110111011101111111100110100111010110101\n"
    ".8byte 0b1100010000000111100000101010100100000100110011001001100100\n"
    ".8byte 0b0010100100011111101001000010000100000100110100011000100000\n"
    ".8byte 0b0011100000000111100101100010001110000110010000011000100000\n"
    ".8byte 0b0010100100001111100100000011001110000100110100011010100001\n"
    ".8byte 0b0010110101001111111000000011101100010100110011111001101001\n"
    ".8byte 0b0010100100001111111000000011001110000100110000111010110001\n"
    ".8byte 0b0010100100001111111100000011001110000100110100111010110001\n"
    ".8byte 0b0010000010000111100010010110000100000100011000011000100000\n"
    ".8byte 0b0010100010000111100111010110000110000100011100011000100000\n"
    ".8byte 0b0010100000000111100101000110001110000100111011001001110000\n"
    ".8byte 0b0010100000000111100101000110001110000100111111001001110000\n"
    ".8byte 0b0010110000000111100101000110111110000110111011011001101100\n"
    ".8byte 0b1100010000001111100010010010010100000100110111011000100100\n"
    ".8byte 0b1100010000001111100010110010010100000100110111011100100100\n"
    ".8byte 0b0000001000001111101000000010000100000100110011001001100101\n"
    ".8byte 0b1100010000000111101000000010000110000100110011001001100100\n"
    ".8byte 0b0010001100011111111001000010000100000100010000111000110000\n"
    ".8byte 0b0010000011001111110010110010100100011100010000111000110000\n"
    ".8byte 0b0010100011001111110010110010100100011100010100111000110000\n"
    ".8byte 0b1100010000000111100000000010000100000100110111001001100100\n"
    ".8byte 0b0010100000000111100101000010000110010100010000011000110000\n"
    ".8byte 0b0010100000000111100101000010000110010100010100011000110000\n"
    ".8byte 0b0001000000001011101000001010110101111100110111011000100000\n"
    ".8byte 0b0001000000101111100000001110110111111100111000011000111000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0010100000001111100000000011000110000100110000011010100000\n"
    ".8byte 0b0010100000001111100001000011001110000100110000011010100000\n"
    ".8byte 0b0001000000101111100000000110110100000100111011001001101100\n"
    ".8byte 0b0011000000001111100000001011010101100100111000001000100001\n"
    ".8byte 0b0010000000001111100010010011010100010100010000011000100001\n"
    ".8byte 0b0010110000000111100101001011100111111100110111011000100101\n"
    ".8byte 0b0011100001100111100111011011110111111110111111011001101101\n"
    ".8byte 0b0011100100000011100001001110001101110100110100011000111000\n"
    ".8byte 0b0011100100000011100011010110001100011100110100011000111000\n"
    ".8byte 0b1110010100000011100001000110001100010100110111011001111100\n"
    ".8byte 0b0010000000000111110001000011001110000100110100111000100000\n"
    ".8byte 0b0010000000000111110001000011001110000100110100111000100000\n"
    ".8byte 0b0010110100000111111111011011001111110100110111111000110111\n"
    ".8byte 0b1110111000110011101001001110110111110111111111011001111100\n"
    ".8byte 0b0011101010010011101011011110110111101111111100011000111000\n"
    ".8byte 0b0001000100100011101001001110110100001111111100011000101100\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0011100100000111101100000011001100011111010000011100100001\n"
    ".8byte 0b0011100100000111101100000011001100011111010000011100100001\n"
    ".8byte 0b0011100100000111101100000011001110011111010100011100110011\n"
    ".8byte 0b0010100110000111101110010010001100000100010000011000100000\n"
    ".8byte 0b0010100110000111101110010011001100000100010000011010100001\n"
    ".8byte 0b0010100110000111101110010011001110000100010100011010110001\n"
    ".8byte 0b1110110000000111100100000010001100010100110011001001100100\n"
    ".8byte 0b1110110000000111100100000010001110010100110011001001100100\n"
    ".8byte 0b1110110000000111100100000011001110010100110111001001110101\n"
    ".8byte 0b0010000001001111110000000010101100010100110000111000110000\n"
    ".8byte 0b0010100001001111110000000010101100010100110100111000110000\n"
    ".8byte 0b0010010100001111100000001010101101110100110011011000100100\n"
    ".8byte 0b0010110100001111100000001010101101110100110111011000110100\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0001000000001111101000000010110100001111010100011000100000\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0001000000001111101000100010110100001101011100011000100000\n"
    ".8byte 0b0001010000001111100000000010000100001101110011011101100100\n"
    ".8byte 0b1111110000001111100000000011000100001101110011011101100100\n"
    ".8byte 0b1111110000001111100000000011000100001101110111011101100101\n"
    ".8byte 0b0011000000000111100000000010101100001101010000011100100000\n"
    ".8byte 0b0011100100001111110100000011101100001101010100011100100000\n"
    ".8byte 0b0011100100001111111100000011101100001101010100011100100000\n"
    ".8byte 0b0001000100000011101001000010101100001101010000011000100000\n"
    ".8byte 0b0001000100001111101001000010101100001101010100011000100000\n"
    ".8byte 0b0001000100001011101001000010101100001101010100011000100000\n"
    ".8byte 0b0000001000011111101000000010000100000100110000011000100000\n"
    ".8byte 0b0000001000011111101000000010000100000100110100011000100000\n"
    ".8byte 0b0001000001000111100000100010000100001111010000011100100000\n"
    ".8byte 0b0011100101000111100000100011000100011111010100011110100001\n"
    ".8byte 0b0011100001101111100100001011111100000110110000011000101101\n"
    ".8byte 0b0000001000011111101000001010000100000100110011001001100100\n"
    ".8byte 0b0000011000011111101000001010000100000100110111001001100100\n"
    ".8byte 0b0001000000001111100000000010100100001101110011011000100100\n"
    ".8byte 0b0001000000001111101000000010100100001101110111011000100100\n"
    ".8byte 0b1110110000000111100100000010000110000100110011001001110100\n"
    ".8byte 0b1110110000000111100100000010000110000100110111001001110100\n"
    ".8byte 0b0001000000000111100000001010101101111110110011011000101100\n"
    ".8byte 0b0011100000000111100000001010101101111110110111011000101100\n"
    ".8byte 0b0011100101101111101110011011101101111100110011011000100101\n"
    ".8byte 0b0001000000100011100101000110111110001100111001011000100000\n"
    ".8byte 0b0011100000100011100101000110111110001100111101011000100000\n"
    ".8byte 0b0010100000000111110101001010000111100100010000111000100000\n"
    ".8byte 0b0010100010000111100010110010000100010100010000011000100000\n"
    ".8byte 0b0011000101001111111100001011111100000100110000111000101101\n"
    ".8byte 0b1100010000000111100101000010000110000100110011001001100100\n"
    ".8byte 0b1110110000000111100101000010000110000100110111001001100100\n"
    ".8byte 0b1100010000000111100000000010000100000110110011001001100100\n"
    ".8byte 0b0110110100000111101100100011001100000100110011101001100100\n"
    ".8byte 0b1110110100000111101100100011001100000100110111101001100100\n"
    ".8byte 0b1100010000000111100000000010000100000100110011001001100100\n"
    ".8byte 0b1100010000000111100000000010000100010110110111001001100100\n"
    ".8byte 0b1100010000001111110000000010000100000100110011101001100100\n"
    ".8byte 0b1110110000001111110100000010000110000100110111101001110100\n"
    ".8byte 0b0010100000000111100101000010001110001101010100011000100000\n"
    ".8byte 0b0010101000010111100101000010001110001101010100011000100000\n"
    ".8byte 0b0010101000010111100111010010001110011101010100011000100010\n"
    ".8byte 0b0010110000000111100100000011001110000100110000011010100001\n"
    ".8byte 0b0010110000000111100100000011001110000100110100011010100001\n"
    ".8byte 0b0001100000001111100000001010000101110100110000001000110000\n"
    ".8byte 0b0001100000001111100000001010000101110100110100001000110000\n"
    ".8byte 0b0010100010000111100111010010001110000100010000011000100000\n"
    ".8byte 0b0010100010000111100111010010001110000100010100011000110000\n"
    ".8byte 0b1110110000000111100100000010000110010100110011001001100100\n"
    ".8byte 0b1110110000000111100100000010000110010100110011001001110100\n"
    ".8byte 0b1110110000000111100100000010000110010100110111001001110100\n"
    ".8byte 0b0001000100000111100001000010000100001101010000011100100001\n"
    ".8byte 0b0001100100000111100001000010000100001101010100011100100001\n"
    ".8byte 0b0001000000000111100000000010100100000110111011001001100100\n"
    ".8byte 0b0001000000000111110000000010100110000110111111101001100100\n"
    ".8byte 0b0001000000100011100101000110110110000110111101001000101000\n"
    ".8byte 0b0001000010100011100111010110110110001110011100011000101000\n"
    ".8byte 0b0100010000000111100000000010000100010100110011001001100100\n"
    ".8byte 0b0001000001101111110000001110110100010100111000111000101000\n"
    ".8byte 0b0001000001101111110000001110110100010100111100111000101001\n"
    ".8byte 0b0001000000000111100000001010000101110100111000001000100000\n"
    ".8byte 0b0001000000000111100000001010000101110100111000001000100000\n"
    ".8byte 0b0010100000000111110111110011000100001100110101111000100001\n"
    ".8byte 0b0011100000000111100100000111110100000100111000011010101001\n"
    ".8byte 0b0011100000000111100100000111110100000100111100011010101001\n"
    ".8byte 0b0000001000011111101000000010000100001110110001011000100000\n"
    ".8byte 0b0010001000011111101010010010000110011110110101011000110010\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0001000001101111110000000010110100000100110011111000101000\n"
    ".8byte 0b0011100001101111110100000010110110000100110111111000101001\n"
    ".8byte 0b0001000100000111100000100010100100001101010000011100100000\n"
    ".8byte 0b0010100100000111101010011011100101101100110011011010100101\n"
    ".8byte 0b0010100100000111101010011011100111101100110011111010110101\n"
    ".8byte 0b0010100100000111101010011011100111101100110111111010110101\n"
    ".8byte 0b0010100001000111100000101010100100001101110001011100100100\n"
    ".8byte 0b0010100001000111100000101010100100001101110101011100100100\n"
    ".8byte 0b0011101100010111101000000010000110001111010100011100110000\n"
    ".8byte 0b0000000000000111100010011010100100001100110011011000110100\n"
    ".8byte 0b0010100010000111110010011011100110001100110011111000110100\n"
    ".8byte 0b0010100010000111110010011011100110001100110111111000110100\n"
    ".8byte 0b1100010000000111100000000010000100000100110011001001100100\n"
    ".8byte 0b1100010001000111100100000010000100000100110111001001100100\n"
    ".8byte 0b1100010000000111100000000010110100000110110111001001100100\n"
    ".8byte 0b0011100101001111111011011010100101110100110111111001101100\n"
    ".8byte 0b0001000001101111110000001010110101100100110000111000101000\n"
    ".8byte 0b0001000001101111110000001010110101100100110100111000101000\n"
    ".8byte 0b0010100001001111100000110010001110010101110000111000100000\n"
    ".8byte 0b0010100000001111101010011011101101111101110011111000110101\n"
    ".8byte 0b1110010000000111100101000010000110000110110111001001101100\n"
    ".8byte 0b0010100100000111101101001010001110010100110000011000110100\n"
    ".8byte 0b0010100100000111101101001010001110010100110000011000110100\n"
    ".8byte 0b0010110100000111101111011011001111111100110111111000110111\n"
    ".8byte 0b0001000000001111100011011010100101101100110011011001100100\n"
    ".8byte 0b0001000000001111101000001011100101101101111000011000100101\n"
    ".8byte 0b0001000000001111101000001011100101101101111000011000100101\n"
    ".8byte 0b0000000000000111100001100010000100001101010000011100100000\n"
    ".8byte 0b0010100000000111100101100010000110001101010100011100100000\n"
    ".8byte 0b0010000100000111101101000011001100000100010000011000100100\n"
    ".8byte 0b0010100100000111101101000011001110010100010100011000100100\n"
    ".8byte 0b0001000001101111110000001110110100100110111000111000101000\n"
    ".8byte 0b0001000001101111110000001110110100100110111000111000101000\n"
    ".8byte 0b0001000001101111110000001110110100100110111100111000101000\n"
    ".8byte 0b0010100100000111101110010011000100000100110000011000110010\n"
    ".8byte 0b0010100100000111101110010011000100000100110000011000110010\n"
    ".8byte 0b0010101100010111101110010011000110010100110100011000110010\n"
    ".8byte 0b0000000000000000000000000000000000000000000000000000000000\n"
    ".8byte 0b0011100100000011101101100111110110000100111100011000100000\n"
    ".8byte 0b0011100100000011101101100111110110000100111100011000100000\n"
    ".8byte 0b0010100000000011100101001011001111100110010100011000100001\n"
    ".8byte 0b0010100000000011100000001011000111100110110111001001100001\n"
    ".8byte 0b0010100000000011101101001011000111100110110100011000100001\n"
    ".8byte 0b1110110000000011100100001011000111100110110111001001111100\n"
    ".8byte 0b0010100110000011101111011011001111111110010100011010110010\n"
    ".8byte 0b1110111010000011101011011011000111111100110111011010110110\n"
    ".8byte 0b1101011100010111101001001110110111101110111101011000111110\n"
    ".8byte 0b1101011100010111101001001110110111101110111101011000111110\n"
    ".8byte 0b0001000000100011101001001110110101100110111100011000101100\n"
    ".8byte 0b0011100101100011111100001111110101101110111101111000101101\n"
    ".8byte 0b0001000001100111110000001110110100000110111000111000101000\n"
);
# 17 "src/pokemon/pokemon_data.c" 2
# 1 "src/pokemon/../data/pokemon/trainer_class_lookups.h" 1







const u8 gTrainerClassToPicIndex[] = {
    TRAINER_PIC_ARCHIE,
    TRAINER_PIC_AQUA_GRUNT_M,
    TRAINER_PIC_AQUA_GRUNT_F,
    TRAINER_PIC_AROMA_LADY,
    TRAINER_PIC_RUIN_MANIAC,
    TRAINER_PIC_INTERVIEWER,
    TRAINER_PIC_TUBER_F,
    TRAINER_PIC_TUBER_M,
    TRAINER_PIC_COOL_TRAINER_M,
    TRAINER_PIC_COOL_TRAINER_F,
    TRAINER_PIC_HEX_MANIAC,
    TRAINER_PIC_LADY,
    TRAINER_PIC_BEAUTY,
    TRAINER_PIC_RICH_BOY,
    TRAINER_PIC_POKEMANIAC,
    TRAINER_PIC_SWIMMER_M,
    TRAINER_PIC_BLACK_BELT,
    TRAINER_PIC_GUITARIST,
    TRAINER_PIC_KINDLER,
    TRAINER_PIC_CAMPER,
    TRAINER_PIC_BUG_MANIAC,
    TRAINER_PIC_PSYCHIC_M,
    TRAINER_PIC_PSYCHIC_F,
    TRAINER_PIC_GENTLEMAN,
    TRAINER_PIC_SIDNEY,
    TRAINER_PIC_PHOEBE,
    TRAINER_PIC_ROXANNE,
    TRAINER_PIC_BRAWLY,
    TRAINER_PIC_TATE_AND_LIZA,
    TRAINER_PIC_SCHOOL_KID_M,
    TRAINER_PIC_SCHOOL_KID_F,
    TRAINER_PIC_SR_AND_JR,
    TRAINER_PIC_POKEFAN_M,
    TRAINER_PIC_POKEFAN_F,
    TRAINER_PIC_EXPERT_M,
    TRAINER_PIC_EXPERT_F,
    TRAINER_PIC_YOUNGSTER,
    TRAINER_PIC_STEVEN,
    TRAINER_PIC_FISHERMAN,
    TRAINER_PIC_CYCLING_TRIATHLETE_M,
    TRAINER_PIC_CYCLING_TRIATHLETE_F,
    TRAINER_PIC_RUNNING_TRIATHLETE_M,
    TRAINER_PIC_RUNNING_TRIATHLETE_F,
    TRAINER_PIC_SWIMMING_TRIATHLETE_M,
    TRAINER_PIC_SWIMMING_TRIATHLETE_F,
    TRAINER_PIC_DRAGON_TAMER,
    TRAINER_PIC_BIRD_KEEPER,
    TRAINER_PIC_NINJA_BOY,
    TRAINER_PIC_BATTLE_GIRL,
    TRAINER_PIC_PARASOL_LADY,
    TRAINER_PIC_SWIMMER_F,
    TRAINER_PIC_PICNICKER,
    TRAINER_PIC_TWINS,
    TRAINER_PIC_SAILOR,
    TRAINER_PIC_YOUNGSTER,
    TRAINER_PIC_YOUNGSTER,
    TRAINER_PIC_COLLECTOR,
    TRAINER_PIC_WALLY,
    TRAINER_PIC_BRENDAN,
    TRAINER_PIC_BRENDAN,
    TRAINER_PIC_BRENDAN,
    TRAINER_PIC_MAY,
    TRAINER_PIC_MAY,
    TRAINER_PIC_MAY,
    TRAINER_PIC_POKEMON_BREEDER_M,
    TRAINER_PIC_POKEMON_BREEDER_F,
    TRAINER_PIC_POKEMON_RANGER_M,
    TRAINER_PIC_POKEMON_RANGER_F,
    TRAINER_PIC_MAXIE,
    TRAINER_PIC_MAGMA_GRUNT_M,
    TRAINER_PIC_MAGMA_GRUNT_F,
    TRAINER_PIC_LASS,
    TRAINER_PIC_BUG_CATCHER,
    TRAINER_PIC_HIKER,
    TRAINER_PIC_YOUNG_COUPLE,
    TRAINER_PIC_OLD_COUPLE,
    TRAINER_PIC_SIS_AND_BRO
};

const u8 gTrainerClassToNameIndex[] = {
    TRAINER_CLASS_NAME_AQUA_LEADER,
    TRAINER_CLASS_NAME_TEAM_AQUA,
    TRAINER_CLASS_NAME_TEAM_AQUA,
    TRAINER_CLASS_NAME_AROMA_LADY,
    TRAINER_CLASS_NAME_RUIN_MANIAC,
    TRAINER_CLASS_NAME_INTERVIEWER,
    TRAINER_CLASS_NAME_TUBER_F,
    TRAINER_CLASS_NAME_TUBER_M,
    TRAINER_CLASS_NAME_COOL_TRAINER,
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
    TRAINER_CLASS_NAME_PSYCHIC,
    TRAINER_CLASS_NAME_GENTLEMAN,
    TRAINER_CLASS_NAME_ELITE_FOUR,
    TRAINER_CLASS_NAME_ELITE_FOUR,
    TRAINER_CLASS_NAME_LEADER,
    TRAINER_CLASS_NAME_LEADER,
    TRAINER_CLASS_NAME_LEADER,
    TRAINER_CLASS_NAME_SCHOOL_KID,
    TRAINER_CLASS_NAME_SCHOOL_KID,
    TRAINER_CLASS_NAME_SR_AND_JR,
    TRAINER_CLASS_NAME_POKEFAN,
    TRAINER_CLASS_NAME_POKEFAN,
    TRAINER_CLASS_NAME_EXPERT,
    TRAINER_CLASS_NAME_EXPERT,
    TRAINER_CLASS_NAME_YOUNGSTER,
    TRAINER_CLASS_NAME_CHAMPION,
    TRAINER_CLASS_NAME_FISHERMAN,
    TRAINER_CLASS_NAME_TRIATHLETE,
    TRAINER_CLASS_NAME_TRIATHLETE,
    TRAINER_CLASS_NAME_TRIATHLETE,
    TRAINER_CLASS_NAME_TRIATHLETE,
    TRAINER_CLASS_NAME_TRIATHLETE,
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
    TRAINER_CLASS_NAME_BOARDER,
    TRAINER_CLASS_NAME_COLLECTOR,
    TRAINER_CLASS_NAME_POKEMON_TRAINER_3,
    TRAINER_CLASS_NAME_POKEMON_TRAINER_3,
    TRAINER_CLASS_NAME_POKEMON_TRAINER_3,
    TRAINER_CLASS_NAME_POKEMON_TRAINER_3,
    TRAINER_CLASS_NAME_POKEMON_TRAINER_3,
    TRAINER_CLASS_NAME_POKEMON_TRAINER_3,
    TRAINER_CLASS_NAME_POKEMON_TRAINER_3,
    TRAINER_CLASS_NAME_POKEMON_BREEDER,
    TRAINER_CLASS_NAME_POKEMON_BREEDER,
    TRAINER_CLASS_NAME_POKEMON_RANGER,
    TRAINER_CLASS_NAME_POKEMON_RANGER,
    TRAINER_CLASS_NAME_MAGMA_LEADER,
    TRAINER_CLASS_NAME_TEAM_MAGMA,
    TRAINER_CLASS_NAME_TEAM_MAGMA,
    TRAINER_CLASS_NAME_LASS,
    TRAINER_CLASS_NAME_BUG_CATCHER,
    TRAINER_CLASS_NAME_HIKER,
    TRAINER_CLASS_NAME_YOUNG_COUPLE,
    TRAINER_CLASS_NAME_OLD_COUPLE,
    TRAINER_CLASS_NAME_SIS_AND_BRO
};
# 18 "src/pokemon/pokemon_data.c" 2
# 1 "src/pokemon/../data/pokemon/cry_ids.h" 1







const u16 gSpeciesIdToCryId[] = {
    273,
    274,
    275,
    270,
    271,
    272,
    276,
    277,
    278,
    359,
    360,
    378,
    375,
    290,
    291,
    292,
    293,
    294,
    283,
    284,
    285,
    286,
    287,
    288,
    301,
    302,
    303,
    266,
    267,
    374,
    373,
    269,
    280,
    279,
    310,
    311,
    377,
    381,
    312,
    313,
    251,
    329,
    330,
    306,
    253,
    362,
    318,
    319,
    368,
    320,
    321,
    333,
    334,
    289,
    260,
    324,
    325,
    326,
    304,
    305,
    254,
    255,
    316,
    317,
    338,
    339,
    340,
    327,
    328,
    383,
    307,
    331,
    332,
    262,
    322,
    323,
    308,
    309,
    363,
    336,
    337,
    263,
    264,
    258,
    256,
    361,
    252,
    298,
    299,
    300,
    314,
    315,
    376,
    382,
    380,
    379,
    341,
    342,
    343,
    335,
    282,
    281,
    259,
    261,
    367,
    364,
    365,
    366,
    356,
    357,
    358,
    344,
    345,
    346,
    347,
    295,
    296,
    297,
    351,
    352,
    372,
    348,
    349,
    350,
    353,
    354,
    355,
    370,
    369,
    371,
    257,
    384,
    385,
    386,
    387
};
# 19 "src/pokemon/pokemon_data.c" 2
# 1 "src/pokemon/../data/pokemon/experience_tables.h" 1







const u32 gExperienceTables[][101] = {
    {
        0,
        1,
        8,
        27,
        64,
        125,
        216,
        343,
        512,
        729,
        1000,
        1331,
        1728,
        2197,
        2744,
        3375,
        4096,
        4913,
        5832,
        6859,
        8000,
        9261,
        10648,
        12167,
        13824,
        15625,
        17576,
        19683,
        21952,
        24389,
        27000,
        29791,
        32768,
        35937,
        39304,
        42875,
        46656,
        50653,
        54872,
        59319,
        64000,
        68921,
        74088,
        79507,
        85184,
        91125,
        97336,
        103823,
        110592,
        117649,
        125000,
        132651,
        140608,
        148877,
        157464,
        166375,
        175616,
        185193,
        195112,
        205379,
        216000,
        226981,
        238328,
        250047,
        262144,
        274625,
        287496,
        300763,
        314432,
        328509,
        343000,
        357911,
        373248,
        389017,
        405224,
        421875,
        438976,
        456533,
        474552,
        493039,
        512000,
        531441,
        551368,
        571787,
        592704,
        614125,
        636056,
        658503,
        681472,
        704969,
        729000,
        753571,
        778688,
        804357,
        830584,
        857375,
        884736,
        912673,
        941192,
        970299,
        1000000
    }, {
        0,
        1,
        15,
        52,
        122,
        237,
        406,
        637,
        942,
        1326,
        1800,
        2369,
        3041,
        3822,
        4719,
        5737,
        6881,
        8155,
        9564,
        11111,
        12800,
        14632,
        16610,
        18737,
        21012,
        23437,
        26012,
        28737,
        31610,
        34632,
        37800,
        41111,
        44564,
        48155,
        51881,
        55737,
        59719,
        63822,
        68041,
        72369,
        76800,
        81326,
        85942,
        90637,
        95406,
        100237,
        105122,
        110052,
        115015,
        120001,
        125000,
        131324,
        137795,
        144410,
        151165,
        158056,
        165079,
        172229,
        179503,
        186894,
        194400,
        202013,
        209728,
        217540,
        225443,
        233431,
        241496,
        249633,
        257834,
        267406,
        276458,
        286328,
        296358,
        305767,
        316074,
        326531,
        336255,
        346965,
        357812,
        367807,
        378880,
        390077,
        400293,
        411686,
        423190,
        433572,
        445239,
        457001,
        467489,
        479378,
        491346,
        501878,
        513934,
        526049,
        536557,
        548720,
        560922,
        571333,
        583539,
        591882,
        600000
    }, {
        0,
        1,
        4,
        13,
        32,
        65,
        112,
        178,
        276,
        393,
        540,
        745,
        967,
        1230,
        1591,
        1957,
        2457,
        3046,
        3732,
        4526,
        5440,
        6482,
        7666,
        9003,
        10506,
        12187,
        14060,
        16140,
        18439,
        20974,
        23760,
        26811,
        30146,
        33780,
        37731,
        42017,
        46656,
        50653,
        55969,
        60505,
        66560,
        71677,
        78533,
        84277,
        91998,
        98415,
        107069,
        114205,
        123863,
        131766,
        142500,
        151222,
        163105,
        172697,
        185807,
        196322,
        210739,
        222231,
        238036,
        250562,
        267840,
        281456,
        300293,
        315059,
        335544,
        351520,
        373744,
        390991,
        415050,
        433631,
        459620,
        479600,
        507617,
        529063,
        559209,
        582187,
        614566,
        639146,
        673863,
        700115,
        737280,
        765275,
        804997,
        834809,
        877201,
        908905,
        954084,
        987754,
        1035837,
        1071552,
        1122660,
        1160499,
        1214753,
        1254796,
        1312322,
        1354652,
        1415577,
        1460276,
        1524731,
        1571884,
        1640000
    }, {
        0,
        1,
        9,
        57,
        96,
        135,
        179,
        236,
        314,
        419,
        560,
        742,
        973,
        1261,
        1612,
        2035,
        2535,
        3120,
        3798,
        4575,
        5460,
        6458,
        7577,
        8825,
        10208,
        11735,
        13411,
        15244,
        17242,
        19411,
        21760,
        24294,
        27021,
        29949,
        33084,
        36435,
        40007,
        43808,
        47846,
        52127,
        56660,
        61450,
        66505,
        71833,
        77440,
        83335,
        89523,
        96012,
        102810,
        109923,
        117360,
        125126,
        133229,
        141677,
        150476,
        159635,
        169159,
        179056,
        189334,
        199999,
        211060,
        222522,
        234393,
        246681,
        259392,
        272535,
        286115,
        300140,
        314618,
        329555,
        344960,
        360838,
        377197,
        394045,
        411388,
        429235,
        447591,
        466464,
        485862,
        505791,
        526260,
        547274,
        568841,
        590969,
        613664,
        636935,
        660787,
        685228,
        710266,
        735907,
        762160,
        789030,
        816525,
        844653,
        873420,
        902835,
        932903,
        963632,
        995030,
        1027103,
        1059860
    }, {
        0,
        1,
        6,
        21,
        51,
        100,
        172,
        274,
        409,
        583,
        800,
        1064,
        1382,
        1757,
        2195,
        2700,
        3276,
        3930,
        4665,
        5487,
        6400,
        7408,
        8518,
        9733,
        11059,
        12500,
        14060,
        15746,
        17561,
        19511,
        21600,
        23832,
        26214,
        28749,
        31443,
        34300,
        37324,
        40522,
        43897,
        47455,
        51200,
        55136,
        59270,
        63605,
        68147,
        72900,
        77868,
        83058,
        88473,
        94119,
        100000,
        106120,
        112486,
        119101,
        125971,
        133100,
        140492,
        148154,
        156089,
        164303,
        172800,
        181584,
        190662,
        200037,
        209715,
        219700,
        229996,
        240610,
        251545,
        262807,
        274400,
        286328,
        298598,
        311213,
        324179,
        337500,
        351180,
        365226,
        379641,
        394431,
        409600,
        425152,
        441094,
        457429,
        474163,
        491300,
        508844,
        526802,
        545177,
        563975,
        583200,
        602856,
        622950,
        643485,
        664467,
        685900,
        707788,
        730138,
        752953,
        776239,
        800000
    }, {
        0,
        1,
        10,
        33,
        80,
        156,
        270,
        428,
        640,
        911,
        1250,
        1663,
        2160,
        2746,
        3430,
        4218,
        5120,
        6141,
        7290,
        8573,
        10000,
        11576,
        13310,
        15208,
        17280,
        19531,
        21970,
        24603,
        27440,
        30486,
        33750,
        37238,
        40960,
        44921,
        49130,
        53593,
        58320,
        63316,
        68590,
        74148,
        80000,
        86151,
        92610,
        99383,
        106480,
        113906,
        121670,
        129778,
        138240,
        147061,
        156250,
        165813,
        175760,
        186096,
        196830,
        207968,
        219520,
        231491,
        243890,
        256723,
        270000,
        283726,
        297910,
        312558,
        327680,
        343281,
        359370,
        375953,
        393040,
        410636,
        428750,
        447388,
        466560,
        486271,
        506530,
        527343,
        548720,
        570666,
        593190,
        616298,
        640000,
        664301,
        689210,
        714733,
        740880,
        767656,
        795070,
        823128,
        851840,
        881211,
        911250,
        941963,
        973360,
        1005446,
        1038230,
        1071718,
        1105920,
        1140841,
        1176490,
        1212873,
        1250000
    }, {
        0,
        1,
        8,
        27,
        64,
        125,
        216,
        343,
        512,
        729,
        1000,
        1331,
        1728,
        2197,
        2744,
        3375,
        4096,
        4913,
        5832,
        6859,
        8000,
        9261,
        10648,
        12167,
        13824,
        15625,
        17576,
        19683,
        21952,
        24389,
        27000,
        29791,
        32768,
        35937,
        39304,
        42875,
        46656,
        50653,
        54872,
        59319,
        64000,
        68921,
        74088,
        79507,
        85184,
        91125,
        97336,
        103823,
        110592,
        117649,
        125000,
        132651,
        140608,
        148877,
        157464,
        166375,
        175616,
        185193,
        195112,
        205379,
        216000,
        226981,
        238328,
        250047,
        262144,
        274625,
        287496,
        300763,
        314432,
        328509,
        343000,
        357911,
        373248,
        389017,
        405224,
        421875,
        438976,
        456533,
        474552,
        493039,
        512000,
        531441,
        551368,
        571787,
        592704,
        614125,
        636056,
        658503,
        681472,
        704969,
        729000,
        753571,
        778688,
        804357,
        830584,
        857375,
        884736,
        912673,
        941192,
        970299,
        1000000
    }, {
        0,
        1,
        8,
        27,
        64,
        125,
        216,
        343,
        512,
        729,
        1000,
        1331,
        1728,
        2197,
        2744,
        3375,
        4096,
        4913,
        5832,
        6859,
        8000,
        9261,
        10648,
        12167,
        13824,
        15625,
        17576,
        19683,
        21952,
        24389,
        27000,
        29791,
        32768,
        35937,
        39304,
        42875,
        46656,
        50653,
        54872,
        59319,
        64000,
        68921,
        74088,
        79507,
        85184,
        91125,
        97336,
        103823,
        110592,
        117649,
        125000,
        132651,
        140608,
        148877,
        157464,
        166375,
        175616,
        185193,
        195112,
        205379,
        216000,
        226981,
        238328,
        250047,
        262144,
        274625,
        287496,
        300763,
        314432,
        328509,
        343000,
        357911,
        373248,
        389017,
        405224,
        421875,
        438976,
        456533,
        474552,
        493039,
        512000,
        531441,
        551368,
        571787,
        592704,
        614125,
        636056,
        658503,
        681472,
        704969,
        729000,
        753571,
        778688,
        804357,
        830584,
        857375,
        884736,
        912673,
        941192,
        970299,
        1000000
    }
};
# 20 "src/pokemon/pokemon_data.c" 2
# 1 "src/pokemon/../data/pokemon/base_stats.h" 1







const struct BaseStats gBaseStats[] = {
    {
    }, {

        45, 49, 49, 45, 65, 65,
        0x0c,
        0x03,
        45,
        64,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        60, 62, 63, 60, 80, 80,
        0x0c,
        0x03,
        45,
        141,
        0, 0, 0, 0, 1, 1,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        80, 82, 83, 80, 100, 100,
        0x0c,
        0x03,
        45,
        208,
        0, 0, 0, 0, 2, 1,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        39, 52, 43, 65, 60, 50,
        0x0a,
        0x0a,
        45,
        65,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        58, 64, 58, 80, 80, 65,
        0x0a,
        0x0a,
        45,
        142,
        0, 0, 0, 1, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        78, 84, 78, 100, 109, 85,
        0x0a,
        0x02,
        45,
        209,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        44, 48, 65, 43, 50, 64,
        0x0b,
        0x0b,
        45,
        66,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        59, 63, 80, 58, 65, 80,
        0x0b,
        0x0b,
        45,
        143,
        0, 0, 1, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        79, 83, 100, 78, 85, 105,
        0x0b,
        0x0b,
        45,
        210,
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        45, 30, 35, 45, 20, 20,
        0x06,
        0x06,
        255,
        53,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHIELD_DUST,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        50, 20, 55, 30, 25, 25,
        0x06,
        0x06,
        120,
        72,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        60, 45, 50, 70, 80, 80,
        0x06,
        0x02,
        45,
        160,
        0, 0, 0, 0, 2, 1,
        ITEM_NONE,
        ITEM_SILVER_POWDER,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_COMPOUND_EYES,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        40, 35, 30, 50, 20, 20,
        0x06,
        0x03,
        255,
        52,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHIELD_DUST,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        45, 25, 50, 35, 25, 25,
        0x06,
        0x03,
        120,
        71,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        65, 80, 40, 75, 45, 80,
        0x06,
        0x03,
        45,
        159,
        0, 2, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_POISON_BARB,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        40, 45, 40, 56, 35, 35,
        0x00,
        0x02,
        255,
        55,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        63, 60, 55, 71, 50, 50,
        0x00,
        0x02,
        120,
        113,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        83, 80, 75, 91, 70, 70,
        0x00,
        0x02,
        45,
        172,
        0, 0, 0, 3, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        30, 56, 35, 72, 25, 35,
        0x00,
        0x00,
        255,
        57,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_GUTS,
        0,
        BODY_COLOR_PURPLE
    }, {
        55, 81, 60, 97, 50, 70,
        0x00,
        0x00,
        127,
        116,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_GUTS,
        0,
        BODY_COLOR_BROWN
    }, {
        40, 60, 30, 70, 31, 31,
        0x00,
        0x02,
        255,
        58,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        65, 90, 65, 100, 61, 61,
        0x00,
        0x02,
        90,
        162,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_SHARP_BEAK,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        35, 60, 44, 55, 40, 54,
        0x03,
        0x03,
        255,
        62,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_DRAGON,
        ABILITY_INTIMIDATE,
        ABILITY_SHED_SKIN,
        0,
        BODY_COLOR_PURPLE
    }, {
        60, 85, 69, 80, 65, 79,
        0x03,
        0x03,
        90,
        147,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_DRAGON,
        ABILITY_INTIMIDATE,
        ABILITY_SHED_SKIN,
        0,
        BODY_COLOR_PURPLE
    }, {
        35, 55, 30, 90, 50, 40,
        0x0d,
        0x0d,
        190,
        82,
        0, 0, 0, 2, 0, 0,
        ITEM_ORAN_BERRY,
        ITEM_LIGHT_BALL,
        127,
        10,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_STATIC,
        ABILITY_NONE,
        6,
        BODY_COLOR_YELLOW
    }, {
        60, 90, 55, 100, 90, 80,
        0x0d,
        0x0d,
        75,
        122,
        0, 0, 0, 3, 0, 0,
        ITEM_NONE,
        ITEM_ORAN_BERRY,
        127,
        10,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_STATIC,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        50, 75, 85, 40, 20, 30,
        0x04,
        0x04,
        255,
        93,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_QUICK_CLAW,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SAND_VEIL,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        75, 100, 110, 65, 45, 55,
        0x04,
        0x04,
        90,
        163,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_QUICK_CLAW,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SAND_VEIL,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        55, 47, 52, 41, 40, 40,
        0x03,
        0x03,
        235,
        59,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        254,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        70, 62, 67, 56, 55, 55,
        0x03,
        0x03,
        120,
        117,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        254,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        90, 82, 87, 76, 75, 85,
        0x03,
        0x04,
        45,
        194,
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        254,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        46, 57, 40, 50, 40, 40,
        0x03,
        0x03,
        235,
        60,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        61, 72, 57, 65, 55, 55,
        0x03,
        0x03,
        120,
        118,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        81, 92, 77, 85, 85, 75,
        0x03,
        0x04,
        45,
        195,
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        70, 45, 48, 35, 60, 65,
        0x00,
        0x00,
        150,
        68,
        2, 0, 0, 0, 0, 0,
        ITEM_LEPPA_BERRY,
        ITEM_MOON_STONE,
        191,
        10,
        140,
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        95, 70, 73, 60, 85, 90,
        0x00,
        0x00,
        25,
        129,
        3, 0, 0, 0, 0, 0,
        ITEM_LEPPA_BERRY,
        ITEM_MOON_STONE,
        191,
        10,
        140,
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        38, 41, 40, 65, 50, 65,
        0x0a,
        0x0a,
        190,
        63,
        0, 0, 0, 1, 0, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        191,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_FLASH_FIRE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        73, 76, 75, 100, 81, 100,
        0x0a,
        0x0a,
        75,
        178,
        0, 0, 0, 1, 0, 1,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        191,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_FLASH_FIRE,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        115, 45, 20, 20, 45, 25,
        0x00,
        0x00,
        170,
        76,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191,
        10,
        70,
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        140, 70, 45, 45, 75, 50,
        0x00,
        0x00,
        50,
        109,
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191,
        10,
        70,
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        40, 45, 35, 55, 30, 40,
        0x03,
        0x02,
        255,
        54,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        75, 80, 70, 90, 65, 75,
        0x03,
        0x02,
        90,
        171,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        45, 50, 55, 30, 75, 65,
        0x0c,
        0x03,
        255,
        78,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        4,
        BODY_COLOR_BLUE
    }, {
        60, 65, 70, 40, 85, 75,
        0x0c,
        0x03,
        120,
        132,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        6,
        BODY_COLOR_BLUE
    }, {
        75, 80, 85, 50, 100, 90,
        0x0c,
        0x03,
        45,
        184,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        35, 70, 55, 25, 45, 55,
        0x06,
        0x0c,
        190,
        70,
        0, 1, 0, 0, 0, 0,
        ITEM_TINY_MUSHROOM,
        ITEM_BIG_MUSHROOM,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_GRASS,
        ABILITY_EFFECT_SPORE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        60, 95, 80, 30, 60, 80,
        0x06,
        0x0c,
        75,
        128,
        0, 2, 1, 0, 0, 0,
        ITEM_TINY_MUSHROOM,
        ITEM_BIG_MUSHROOM,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_GRASS,
        ABILITY_EFFECT_SPORE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        60, 55, 50, 45, 40, 55,
        0x06,
        0x03,
        190,
        75,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_COMPOUND_EYES,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        70, 65, 60, 90, 90, 75,
        0x06,
        0x03,
        75,
        138,
        0, 0, 0, 1, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHIELD_DUST,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        10, 55, 25, 95, 35, 45,
        0x04,
        0x04,
        255,
        81,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SAND_VEIL,
        ABILITY_ARENA_TRAP,
        0,
        BODY_COLOR_BROWN
    }, {
        35, 80, 50, 120, 50, 70,
        0x04,
        0x04,
        50,
        153,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SAND_VEIL,
        ABILITY_ARENA_TRAP,
        0,
        BODY_COLOR_BROWN
    }, {
        40, 45, 35, 90, 40, 40,
        0x00,
        0x00,
        255,
        69,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PICKUP,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        65, 70, 60, 115, 65, 65,
        0x00,
        0x00,
        90,
        148,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_LIMBER,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        50, 52, 48, 55, 65, 50,
        0x0b,
        0x0b,
        190,
        80,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_DAMP,
        ABILITY_CLOUD_NINE,
        6,
        BODY_COLOR_YELLOW
    }, {
        80, 82, 78, 85, 95, 80,
        0x0b,
        0x0b,
        75,
        174,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_DAMP,
        ABILITY_CLOUD_NINE,
        8,
        BODY_COLOR_BLUE
    }, {
        40, 80, 35, 70, 35, 45,
        0x01,
        0x01,
        190,
        74,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_VITAL_SPIRIT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        65, 105, 60, 95, 60, 70,
        0x01,
        0x01,
        75,
        149,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_VITAL_SPIRIT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        55, 70, 45, 60, 70, 50,
        0x0a,
        0x0a,
        190,
        91,
        0, 1, 0, 0, 0, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        63,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INTIMIDATE,
        ABILITY_FLASH_FIRE,
        0,
        BODY_COLOR_BROWN
    }, {
        90, 110, 80, 95, 100, 80,
        0x0a,
        0x0a,
        75,
        213,
        0, 2, 0, 0, 0, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        63,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INTIMIDATE,
        ABILITY_FLASH_FIRE,
        0,
        BODY_COLOR_BROWN
    }, {
        40, 50, 40, 90, 40, 40,
        0x0b,
        0x0b,
        255,
        77,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_WATER_ABSORB,
        ABILITY_DAMP,
        0,
        BODY_COLOR_BLUE, 1
    }, {
        65, 65, 65, 90, 50, 50,
        0x0b,
        0x0b,
        120,
        131,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_WATER_ABSORB,
        ABILITY_DAMP,
        0,
        BODY_COLOR_BLUE, 1
    }, {
        90, 85, 95, 70, 70, 90,
        0x0b,
        0x01,
        45,
        185,
        0, 0, 3, 0, 0, 0,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_WATER_ABSORB,
        ABILITY_DAMP,
        0,
        BODY_COLOR_BLUE, 1
    }, {
        25, 20, 15, 90, 105, 55,
        0x0e,
        0x0e,
        200,
        73,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_TWISTED_SPOON,
        63,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SYNCHRONIZE,
        ABILITY_INNER_FOCUS,
        0,
        BODY_COLOR_BROWN
    }, {
        40, 35, 30, 105, 120, 70,
        0x0e,
        0x0e,
        100,
        145,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_TWISTED_SPOON,
        63,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SYNCHRONIZE,
        ABILITY_INNER_FOCUS,
        0,
        BODY_COLOR_BROWN
    }, {
        55, 50, 45, 120, 135, 85,
        0x0e,
        0x0e,
        50,
        186,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_TWISTED_SPOON,
        63,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SYNCHRONIZE,
        ABILITY_INNER_FOCUS,
        0,
        BODY_COLOR_BROWN
    }, {
        70, 80, 50, 35, 35, 35,
        0x01,
        0x01,
        180,
        88,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_GUTS,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        80, 100, 70, 45, 50, 60,
        0x01,
        0x01,
        90,
        146,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_GUTS,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        90, 130, 80, 55, 65, 85,
        0x01,
        0x01,
        45,
        193,
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_GUTS,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        50, 75, 35, 40, 70, 30,
        0x0c,
        0x03,
        255,
        84,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        65, 90, 50, 55, 85, 45,
        0x0c,
        0x03,
        120,
        151,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        80, 105, 65, 70, 100, 60,
        0x0c,
        0x03,
        45,
        191,
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        40, 40, 35, 70, 50, 100,
        0x0b,
        0x03,
        190,
        105,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_CLEAR_BODY,
        ABILITY_LIQUID_OOZE,
        0,
        BODY_COLOR_BLUE
    }, {
        80, 70, 65, 100, 80, 120,
        0x0b,
        0x03,
        60,
        205,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_CLEAR_BODY,
        ABILITY_LIQUID_OOZE,
        0,
        BODY_COLOR_BLUE
    }, {
        40, 80, 100, 20, 30, 30,
        0x05,
        0x04,
        255,
        86,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_EVERSTONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_ROCK_HEAD,
        ABILITY_STURDY,
        4,
        BODY_COLOR_BROWN
    }, {
        55, 95, 115, 35, 45, 45,
        0x05,
        0x04,
        120,
        134,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_EVERSTONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_ROCK_HEAD,
        ABILITY_STURDY,
        0,
        BODY_COLOR_BROWN
    }, {
        80, 110, 130, 45, 55, 65,
        0x05,
        0x04,
        45,
        177,
        0, 0, 3, 0, 0, 0,
        ITEM_NONE,
        ITEM_EVERSTONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_ROCK_HEAD,
        ABILITY_STURDY,
        0,
        BODY_COLOR_BROWN
    }, {
        50, 85, 55, 90, 65, 65,
        0x0a,
        0x0a,
        190,
        152,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_FLASH_FIRE,
        0,
        BODY_COLOR_YELLOW
    }, {
        65, 100, 70, 105, 80, 80,
        0x0a,
        0x0a,
        60,
        192,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_FLASH_FIRE,
        0,
        BODY_COLOR_YELLOW
    }, {
        90, 65, 65, 15, 40, 40,
        0x0b,
        0x0e,
        190,
        99,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_OBLIVIOUS,
        ABILITY_OWN_TEMPO,
        0,
        BODY_COLOR_PINK
    }, {
        95, 75, 110, 30, 100, 80,
        0x0b,
        0x0e,
        75,
        164,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_OBLIVIOUS,
        ABILITY_OWN_TEMPO,
        0,
        BODY_COLOR_PINK
    }, {
        25, 35, 70, 45, 95, 55,
        0x0d,
        0x08,
        190,
        89,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        255,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_MAGNET_PULL,
        ABILITY_STURDY,
        0,
        BODY_COLOR_GRAY
    }, {
        50, 60, 95, 70, 120, 70,
        0x0d,
        0x08,
        60,
        161,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        255,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_MAGNET_PULL,
        ABILITY_STURDY,
        0,
        BODY_COLOR_GRAY
    }, {
        52, 65, 55, 60, 58, 62,
        0x00,
        0x02,
        45,
        94,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_STICK,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FIELD,
        ABILITY_KEEN_EYE,
        ABILITY_INNER_FOCUS,
        0,
        BODY_COLOR_BROWN
    }, {
        35, 85, 45, 75, 35, 35,
        0x00,
        0x02,
        190,
        96,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SHARP_BEAK,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_RUN_AWAY,
        ABILITY_EARLY_BIRD,
        8,
        BODY_COLOR_BROWN
    }, {
        60, 110, 70, 100, 60, 60,
        0x00,
        0x02,
        45,
        158,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SHARP_BEAK,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_RUN_AWAY,
        ABILITY_EARLY_BIRD,
        10,
        BODY_COLOR_BROWN
    }, {
        65, 45, 55, 45, 45, 70,
        0x0b,
        0x0b,
        190,
        100,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        90, 70, 80, 70, 70, 95,
        0x0b,
        0x0f,
        75,
        176,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        80, 80, 50, 25, 40, 50,
        0x03,
        0x03,
        190,
        90,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NUGGET,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_STENCH,
        ABILITY_STICKY_HOLD,
        0,
        BODY_COLOR_PURPLE
    }, {
        105, 105, 75, 50, 65, 100,
        0x03,
        0x03,
        75,
        157,
        1, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NUGGET,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_STENCH,
        ABILITY_STICKY_HOLD,
        0,
        BODY_COLOR_PURPLE
    }, {
        30, 65, 100, 40, 45, 25,
        0x0b,
        0x0b,
        190,
        97,
        0, 0, 1, 0, 0, 0,
        ITEM_PEARL,
        ITEM_BIG_PEARL,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_SHELL_ARMOR,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        50, 95, 180, 70, 85, 45,
        0x0b,
        0x0f,
        60,
        203,
        0, 0, 2, 0, 0, 0,
        ITEM_PEARL,
        ITEM_BIG_PEARL,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_SHELL_ARMOR,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        30, 35, 30, 80, 100, 35,
        0x07,
        0x03,
        190,
        95,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        45, 50, 45, 95, 115, 55,
        0x07,
        0x03,
        90,
        126,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        60, 65, 60, 110, 130, 75,
        0x07,
        0x03,
        45,
        190,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        35, 45, 160, 70, 30, 45,
        0x05,
        0x04,
        45,
        108,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_ROCK_HEAD,
        ABILITY_STURDY,
        0,
        BODY_COLOR_GRAY
    }, {
        60, 48, 45, 42, 43, 90,
        0x0e,
        0x0e,
        190,
        102,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_INSOMNIA,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        85, 73, 70, 67, 73, 115,
        0x0e,
        0x0e,
        75,
        165,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_INSOMNIA,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        30, 105, 90, 50, 25, 25,
        0x0b,
        0x0b,
        225,
        115,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_HYPER_CUTTER,
        ABILITY_SHELL_ARMOR,
        0,
        BODY_COLOR_RED
    }, {
        55, 130, 115, 75, 50, 50,
        0x0b,
        0x0b,
        60,
        206,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_HYPER_CUTTER,
        ABILITY_SHELL_ARMOR,
        0,
        BODY_COLOR_RED, 1
    }, {
        40, 30, 50, 100, 55, 55,
        0x0d,
        0x0d,
        190,
        103,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_SOUNDPROOF,
        ABILITY_STATIC,
        0,
        BODY_COLOR_RED
    }, {
        60, 50, 70, 140, 80, 80,
        0x0d,
        0x0d,
        60,
        150,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_SOUNDPROOF,
        ABILITY_STATIC,
        0,
        BODY_COLOR_RED
    }, {
        60, 40, 80, 40, 60, 45,
        0x0c,
        0x0e,
        90,
        98,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        95, 95, 85, 55, 125, 65,
        0x0c,
        0x0e,
        45,
        212,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        50, 50, 95, 35, 40, 50,
        0x04,
        0x04,
        190,
        87,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_THICK_CLUB,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_ROCK_HEAD,
        ABILITY_LIGHTNING_ROD,
        0,
        BODY_COLOR_BROWN
    }, {
        60, 80, 110, 45, 50, 80,
        0x04,
        0x04,
        75,
        124,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_THICK_CLUB,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_ROCK_HEAD,
        ABILITY_LIGHTNING_ROD,
        0,
        BODY_COLOR_BROWN
    }, {
        50, 120, 53, 87, 35, 110,
        0x01,
        0x01,
        45,
        139,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_LIMBER,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        50, 105, 79, 76, 35, 110,
        0x01,
        0x01,
        45,
        140,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        0,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        90, 55, 75, 30, 60, 75,
        0x00,
        0x00,
        45,
        127,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_OWN_TEMPO,
        ABILITY_OBLIVIOUS,
        0,
        BODY_COLOR_PINK
    }, {
        40, 65, 95, 35, 60, 45,
        0x03,
        0x03,
        190,
        114,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_SMOKE_BALL,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        65, 90, 120, 60, 85, 70,
        0x03,
        0x03,
        60,
        173,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_SMOKE_BALL,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        80, 85, 95, 25, 30, 30,
        0x04,
        0x05,
        120,
        135,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_LIGHTNING_ROD,
        ABILITY_ROCK_HEAD,
        4,
        BODY_COLOR_GRAY
    }, {
        105, 130, 120, 40, 45, 45,
        0x04,
        0x05,
        60,
        204,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_LIGHTNING_ROD,
        ABILITY_ROCK_HEAD,
        0,
        BODY_COLOR_GRAY
    }, {
        250, 5, 5, 50, 35, 105,
        0x00,
        0x00,
        30,
        255,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_LUCKY_EGG,
        254,
        40,
        140,
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_NATURAL_CURE,
        ABILITY_SERENE_GRACE,
        0,
        BODY_COLOR_PINK
    }, {
        65, 55, 115, 60, 100, 40,
        0x0c,
        0x0c,
        45,
        166,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        105, 95, 80, 90, 40, 80,
        0x00,
        0x00,
        45,
        175,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        254,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_EARLY_BIRD,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        30, 40, 70, 60, 70, 25,
        0x0b,
        0x0b,
        225,
        83,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        55, 65, 95, 85, 95, 45,
        0x0b,
        0x0b,
        75,
        155,
        0, 0, 1, 0, 1, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_POISON_POINT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        45, 67, 60, 63, 35, 50,
        0x0b,
        0x0b,
        225,
        111,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_SWIFT_SWIM,
        ABILITY_WATER_VEIL,
        4,
        BODY_COLOR_RED
    }, {
        80, 92, 65, 68, 65, 80,
        0x0b,
        0x0b,
        60,
        170,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_SWIFT_SWIM,
        ABILITY_WATER_VEIL,
        6,
        BODY_COLOR_RED
    }, {
        30, 45, 55, 85, 70, 55,
        0x0b,
        0x0b,
        225,
        106,
        0, 0, 0, 1, 0, 0,
        ITEM_STARDUST,
        ITEM_STAR_PIECE,
        255,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_ILLUMINATE,
        ABILITY_NATURAL_CURE,
        0,
        BODY_COLOR_BROWN
    }, {
        60, 75, 85, 115, 100, 85,
        0x0b,
        0x0e,
        60,
        207,
        0, 0, 0, 2, 0, 0,
        ITEM_STARDUST,
        ITEM_STAR_PIECE,
        255,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_ILLUMINATE,
        ABILITY_NATURAL_CURE,
        0,
        BODY_COLOR_PURPLE
    }, {
        40, 45, 65, 90, 100, 120,
        0x0e,
        0x0e,
        45,
        136,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_LEPPA_BERRY,
        127,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SOUNDPROOF,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        70, 110, 80, 105, 55, 80,
        0x06,
        0x02,
        45,
        187,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        65, 50, 35, 95, 115, 95,
        0x0f,
        0x0e,
        45,
        137,
        0, 0, 0, 0, 2, 0,
        ITEM_ASPEAR_BERRY,
        ITEM_ASPEAR_BERRY,
        254,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        65, 83, 57, 105, 95, 85,
        0x0d,
        0x0d,
        45,
        156,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_STATIC,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW, 1
    }, {
        65, 95, 57, 93, 100, 85,
        0x0a,
        0x0a,
        45,
        167,
        0, 0, 0, 0, 2, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        63,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_FLAME_BODY,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        65, 125, 100, 85, 55, 70,
        0x06,
        0x06,
        45,
        200,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        25,
        70,
        GROWTH_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_HYPER_CUTTER,
        ABILITY_NONE,
        8,
        BODY_COLOR_BROWN
    }, {
        75, 100, 95, 110, 40, 70,
        0x00,
        0x00,
        45,
        211,
        0, 1, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        20, 10, 55, 80, 15, 20,
        0x0b,
        0x0b,
        255,
        20,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        5,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_DRAGON,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        4,
        BODY_COLOR_RED
    }, {
        95, 125, 79, 81, 60, 100,
        0x0b,
        0x02,
        45,
        214,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        5,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_DRAGON,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        130, 85, 80, 60, 85, 95,
        0x0b,
        0x0f,
        45,
        219,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        40,
        70,
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_WATER_ABSORB,
        ABILITY_SHELL_ARMOR,
        0,
        BODY_COLOR_BLUE
    }, {
        48, 48, 48, 48, 48, 48,
        0x00,
        0x00,
        35,
        61,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_METAL_POWDER,
        255,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_DITTO,
        EGG_GROUP_DITTO,
        ABILITY_LIMBER,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        55, 55, 50, 55, 45, 65,
        0x00,
        0x00,
        45,
        92,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31,
        35,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        130, 65, 60, 65, 110, 95,
        0x0b,
        0x0b,
        45,
        196,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        35,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_WATER_ABSORB,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        65, 65, 60, 130, 110, 95,
        0x0d,
        0x0d,
        45,
        197,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        35,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_VOLT_ABSORB,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        65, 130, 60, 65, 95, 110,
        0x0a,
        0x0a,
        45,
        198,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        35,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_FLASH_FIRE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        65, 60, 70, 40, 85, 75,
        0x00,
        0x00,
        45,
        130,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_TRACE,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        35, 40, 100, 35, 90, 55,
        0x05,
        0x0b,
        45,
        120,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        30,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_SWIFT_SWIM,
        ABILITY_SHELL_ARMOR,
        0,
        BODY_COLOR_BLUE
    }, {
        70, 60, 125, 55, 115, 70,
        0x05,
        0x0b,
        45,
        199,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        30,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_SWIFT_SWIM,
        ABILITY_SHELL_ARMOR,
        0,
        BODY_COLOR_BLUE
    }, {
        30, 80, 90, 55, 55, 45,
        0x05,
        0x0b,
        45,
        119,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        30,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_SWIFT_SWIM,
        ABILITY_BATTLE_ARMOR,
        0,
        BODY_COLOR_BROWN
    }, {
        60, 115, 105, 80, 65, 70,
        0x05,
        0x0b,
        45,
        201,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        30,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_SWIFT_SWIM,
        ABILITY_BATTLE_ARMOR,
        0,
        BODY_COLOR_BROWN
    }, {
        80, 105, 65, 130, 60, 75,
        0x05,
        0x02,
        45,
        202,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        35,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_ROCK_HEAD,
        ABILITY_PRESSURE,
        0,
        BODY_COLOR_PURPLE
    }, {
        160, 110, 65, 30, 65, 110,
        0x00,
        0x00,
        25,
        154,
        2, 0, 0, 0, 0, 0,
        ITEM_LEFTOVERS,
        ITEM_LEFTOVERS,
        31,
        40,
        70,
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_IMMUNITY,
        ABILITY_THICK_FAT,
        0,
        BODY_COLOR_BLACK
    }, {
        90, 85, 100, 85, 95, 125,
        0x0f,
        0x02,
        3,
        215,
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        255,
        80,
        35,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        90, 90, 85, 100, 125, 90,
        0x0d,
        0x02,
        3,
        216,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        80,
        35,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        90, 100, 90, 90, 125, 85,
        0x0a,
        0x02,
        3,
        217,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        80,
        35,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        41, 64, 45, 50, 50, 50,
        0x10,
        0x10,
        45,
        67,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        61, 84, 65, 70, 70, 70,
        0x10,
        0x10,
        45,
        144,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        91, 134, 95, 80, 100, 100,
        0x10,
        0x02,
        45,
        218,
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        106, 110, 90, 130, 154, 90,
        0x0e,
        0x0e,
        3,
        220,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        100, 100, 100, 100, 100, 100,
        0x0e,
        0x0e,
        45,
        64,
        3, 0, 0, 0, 0, 0,
        ITEM_LUM_BERRY,
        ITEM_LUM_BERRY,
        255,
        120,
        100,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_SYNCHRONIZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        45, 49, 65, 45, 49, 65,
        0x0c,
        0x0c,
        45,
        64,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        60, 62, 80, 60, 63, 80,
        0x0c,
        0x0c,
        45,
        141,
        0, 0, 1, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        80, 82, 100, 80, 83, 100,
        0x0c,
        0x0c,
        45,
        208,
        0, 0, 1, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        39, 52, 43, 65, 60, 50,
        0x0a,
        0x0a,
        45,
        65,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        58, 64, 58, 80, 80, 65,
        0x0a,
        0x0a,
        45,
        142,
        0, 0, 0, 1, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        78, 84, 78, 100, 109, 85,
        0x0a,
        0x0a,
        45,
        209,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        50, 65, 64, 43, 44, 48,
        0x0b,
        0x0b,
        45,
        66,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        65, 80, 80, 58, 59, 63,
        0x0b,
        0x0b,
        45,
        143,
        0, 1, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE, 1
    }, {
        85, 105, 100, 78, 79, 83,
        0x0b,
        0x0b,
        45,
        210,
        0, 2, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        35, 46, 34, 20, 35, 45,
        0x00,
        0x00,
        255,
        57,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_ORAN_BERRY,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_KEEN_EYE,
        0,
        BODY_COLOR_BROWN
    }, {
        85, 76, 64, 90, 45, 55,
        0x00,
        0x00,
        90,
        116,
        0, 0, 0, 2, 0, 0,
        ITEM_ORAN_BERRY,
        ITEM_SITRUS_BERRY,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_KEEN_EYE,
        0,
        BODY_COLOR_BROWN
    }, {
        60, 30, 30, 50, 36, 56,
        0x00,
        0x02,
        255,
        58,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INSOMNIA,
        ABILITY_KEEN_EYE,
        0,
        BODY_COLOR_BROWN
    }, {
        100, 50, 50, 70, 76, 96,
        0x00,
        0x02,
        90,
        162,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INSOMNIA,
        ABILITY_KEEN_EYE,
        0,
        BODY_COLOR_BROWN
    }, {
        40, 20, 30, 55, 40, 80,
        0x06,
        0x02,
        255,
        54,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_EARLY_BIRD,
        0,
        BODY_COLOR_RED
    }, {
        55, 35, 50, 85, 55, 110,
        0x06,
        0x02,
        90,
        134,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_EARLY_BIRD,
        0,
        BODY_COLOR_RED
    }, {
        40, 60, 40, 30, 40, 40,
        0x06,
        0x03,
        255,
        54,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_INSOMNIA,
        0,
        BODY_COLOR_GREEN
    }, {
        70, 90, 70, 40, 60, 60,
        0x06,
        0x03,
        90,
        134,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_INSOMNIA,
        0,
        BODY_COLOR_RED
    }, {
        85, 90, 80, 130, 70, 80,
        0x03,
        0x02,
        90,
        204,
        0, 0, 0, 3, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        75, 38, 38, 67, 56, 56,
        0x0b,
        0x0d,
        190,
        90,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_YELLOW_SHARD,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_VOLT_ABSORB,
        ABILITY_ILLUMINATE,
        0,
        BODY_COLOR_BLUE
    }, {
        125, 58, 58, 67, 76, 76,
        0x0b,
        0x0d,
        75,
        156,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_YELLOW_SHARD,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_VOLT_ABSORB,
        ABILITY_ILLUMINATE,
        0,
        BODY_COLOR_BLUE
    }, {
        20, 40, 15, 60, 35, 35,
        0x0d,
        0x0d,
        190,
        42,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_ORAN_BERRY,
        127,
        10,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_STATIC,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        50, 25, 28, 15, 45, 55,
        0x00,
        0x00,
        150,
        37,
        0, 0, 0, 0, 0, 1,
        ITEM_LEPPA_BERRY,
        ITEM_MOON_STONE,
        191,
        10,
        140,
        GROWTH_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        90, 30, 15, 15, 40, 20,
        0x00,
        0x00,
        170,
        39,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191,
        10,
        70,
        GROWTH_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK, 1
    }, {
        35, 20, 65, 20, 40, 65,
        0x00,
        0x00,
        190,
        74,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31,
        10,
        70,
        GROWTH_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_HUSTLE,
        ABILITY_SERENE_GRACE,
        0,
        BODY_COLOR_WHITE
    }, {
        55, 40, 85, 40, 80, 105,
        0x00,
        0x02,
        75,
        114,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        31,
        10,
        70,
        GROWTH_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FAIRY,
        ABILITY_HUSTLE,
        ABILITY_SERENE_GRACE,
        0,
        BODY_COLOR_WHITE
    }, {
        40, 50, 45, 70, 70, 45,
        0x0e,
        0x02,
        190,
        73,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_SYNCHRONIZE,
        ABILITY_EARLY_BIRD,
        6,
        BODY_COLOR_GREEN
    }, {
        65, 75, 70, 95, 95, 70,
        0x0e,
        0x02,
        75,
        171,
        0, 0, 0, 1, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_SYNCHRONIZE,
        ABILITY_EARLY_BIRD,
        8,
        BODY_COLOR_GREEN
    }, {
        55, 40, 40, 35, 65, 45,
        0x0d,
        0x0d,
        235,
        59,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_STATIC,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        70, 55, 55, 45, 80, 60,
        0x0d,
        0x0d,
        120,
        117,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_STATIC,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        90, 75, 75, 55, 115, 90,
        0x0d,
        0x0d,
        45,
        194,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_STATIC,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        75, 80, 85, 50, 90, 100,
        0x0c,
        0x0c,
        45,
        184,
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        70, 20, 50, 40, 20, 50,
        0x0b,
        0x0b,
        190,
        58,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        10,
        70,
        GROWTH_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FAIRY,
        ABILITY_THICK_FAT,
        ABILITY_HUGE_POWER,
        0,
        BODY_COLOR_BLUE
    }, {
        100, 50, 80, 50, 50, 80,
        0x0b,
        0x0b,
        75,
        153,
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        10,
        70,
        GROWTH_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FAIRY,
        ABILITY_THICK_FAT,
        ABILITY_HUGE_POWER,
        0,
        BODY_COLOR_BLUE
    }, {
        70, 100, 115, 30, 30, 65,
        0x05,
        0x05,
        65,
        135,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_STURDY,
        ABILITY_ROCK_HEAD,
        0,
        BODY_COLOR_BROWN
    }, {
        90, 75, 75, 70, 90, 100,
        0x0b,
        0x0b,
        45,
        185,
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_WATER_ABSORB,
        ABILITY_DAMP,
        0,
        BODY_COLOR_GREEN, 1
    }, {
        35, 35, 40, 50, 35, 55,
        0x0c,
        0x02,
        255,
        74,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        55, 45, 50, 80, 45, 65,
        0x0c,
        0x02,
        120,
        136,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        75, 55, 70, 110, 55, 85,
        0x0c,
        0x02,
        45,
        176,
        0, 0, 0, 3, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        55, 70, 55, 85, 40, 55,
        0x00,
        0x00,
        45,
        94,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_PICKUP,
        0,
        BODY_COLOR_PURPLE
    }, {
        30, 30, 30, 30, 30, 30,
        0x0c,
        0x0c,
        235,
        52,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        75, 75, 55, 30, 105, 85,
        0x0c,
        0x0c,
        120,
        146,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        65, 65, 45, 95, 75, 45,
        0x06,
        0x02,
        75,
        147,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SPEED_BOOST,
        ABILITY_COMPOUND_EYES,
        0,
        BODY_COLOR_RED
    }, {
        55, 45, 45, 15, 25, 25,
        0x0b,
        0x04,
        255,
        52,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_DAMP,
        ABILITY_WATER_ABSORB,
        0,
        BODY_COLOR_BLUE
    }, {
        95, 85, 85, 35, 65, 65,
        0x0b,
        0x04,
        90,
        137,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_DAMP,
        ABILITY_WATER_ABSORB,
        0,
        BODY_COLOR_BLUE
    }, {
        65, 65, 60, 110, 130, 95,
        0x0e,
        0x0e,
        45,
        197,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        35,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SYNCHRONIZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        95, 65, 110, 65, 60, 130,
        0x11,
        0x11,
        45,
        197,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        31,
        35,
        35,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SYNCHRONIZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        60, 85, 42, 91, 85, 42,
        0x11,
        0x02,
        30,
        107,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        35,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_INSOMNIA,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        95, 75, 80, 30, 100, 110,
        0x0b,
        0x0e,
        70,
        164,
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_OBLIVIOUS,
        ABILITY_OWN_TEMPO,
        0,
        BODY_COLOR_PINK
    }, {
        60, 60, 60, 85, 85, 85,
        0x07,
        0x07,
        45,
        147,
        0, 0, 0, 0, 1, 1,
        ITEM_NONE,
        ITEM_SPELL_TAG,
        127,
        25,
        35,
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        48, 72, 48, 48, 72, 48,
        0x0e,
        0x0e,
        225,
        61,
        0, 1, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        40,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK, 1
    }, {
        190, 33, 58, 33, 33, 58,
        0x0e,
        0x0e,
        45,
        177,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_SHADOW_TAG,
        ABILITY_NONE,
        4,
        BODY_COLOR_BLUE
    }, {
        70, 80, 65, 85, 90, 65,
        0x00,
        0x0e,
        60,
        149,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_PERSIM_BERRY,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INNER_FOCUS,
        ABILITY_EARLY_BIRD,
        4,
        BODY_COLOR_YELLOW
    }, {
        50, 65, 90, 15, 35, 35,
        0x06,
        0x06,
        190,
        60,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_STURDY,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        75, 90, 140, 40, 60, 60,
        0x06,
        0x08,
        75,
        118,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_STURDY,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        100, 70, 70, 45, 65, 65,
        0x00,
        0x00,
        190,
        75,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_SERENE_GRACE,
        ABILITY_RUN_AWAY,
        0,
        BODY_COLOR_YELLOW
    }, {
        65, 75, 105, 85, 35, 65,
        0x04,
        0x02,
        60,
        108,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_HYPER_CUTTER,
        ABILITY_SAND_VEIL,
        0,
        BODY_COLOR_PURPLE
    }, {
        75, 85, 200, 30, 55, 65,
        0x08,
        0x04,
        25,
        196,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        127,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_ROCK_HEAD,
        ABILITY_STURDY,
        0,
        BODY_COLOR_GRAY
    }, {
        60, 80, 50, 30, 40, 40,
        0x00,
        0x00,
        190,
        63,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191,
        20,
        70,
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_INTIMIDATE,
        ABILITY_RUN_AWAY,
        0,
        BODY_COLOR_PINK
    }, {
        90, 120, 75, 45, 60, 60,
        0x00,
        0x00,
        75,
        178,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191,
        20,
        70,
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_INTIMIDATE,
        ABILITY_INTIMIDATE,
        0,
        BODY_COLOR_PURPLE
    }, {
        65, 95, 75, 85, 55, 55,
        0x0b,
        0x03,
        45,
        100,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_POISON_POINT,
        ABILITY_SWIFT_SWIM,
        0,
        BODY_COLOR_GRAY
    }, {
        70, 130, 100, 65, 55, 80,
        0x06,
        0x08,
        25,
        200,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        20, 10, 230, 5, 10, 230,
        0x06,
        0x05,
        190,
        80,
        0, 0, 1, 0, 0, 1,
        ITEM_ORAN_BERRY,
        ITEM_ORAN_BERRY,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_STURDY,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        80, 125, 75, 85, 40, 95,
        0x06,
        0x01,
        45,
        200,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        25,
        70,
        GROWTH_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_GUTS,
        8,
        BODY_COLOR_BLUE
    }, {
        55, 95, 55, 115, 35, 75,
        0x11,
        0x0f,
        60,
        132,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_QUICK_CLAW,
        127,
        20,
        35,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INNER_FOCUS,
        ABILITY_KEEN_EYE,
        0,
        BODY_COLOR_BLACK, 1
    }, {
        60, 80, 50, 40, 50, 50,
        0x00,
        0x00,
        120,
        124,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PICKUP,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN, 1
    }, {
        90, 130, 75, 55, 75, 75,
        0x00,
        0x00,
        60,
        189,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_GUTS,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        40, 40, 40, 20, 70, 40,
        0x0a,
        0x0a,
        190,
        78,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_MAGMA_ARMOR,
        ABILITY_FLAME_BODY,
        0,
        BODY_COLOR_RED
    }, {
        50, 50, 120, 30, 80, 80,
        0x0a,
        0x05,
        75,
        154,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_MAGMA_ARMOR,
        ABILITY_FLAME_BODY,
        0,
        BODY_COLOR_RED
    }, {
        50, 50, 40, 50, 30, 30,
        0x0f,
        0x04,
        225,
        78,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        100, 100, 80, 50, 60, 60,
        0x0f,
        0x04,
        75,
        160,
        1, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        55, 55, 85, 35, 65, 85,
        0x0b,
        0x05,
        60,
        113,
        0, 0, 1, 0, 0, 1,
        ITEM_NONE,
        ITEM_RED_SHARD,
        191,
        20,
        70,
        GROWTH_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_HUSTLE,
        ABILITY_NATURAL_CURE,
        0,
        BODY_COLOR_PINK
    }, {
        35, 65, 35, 65, 65, 35,
        0x0b,
        0x0b,
        190,
        78,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_2,
        ABILITY_HUSTLE,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        75, 105, 75, 45, 105, 75,
        0x0b,
        0x0b,
        75,
        164,
        0, 1, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_2,
        ABILITY_SUCTION_CUPS,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        45, 55, 45, 75, 65, 45,
        0x0f,
        0x02,
        45,
        183,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_VITAL_SPIRIT,
        ABILITY_HUSTLE,
        0,
        BODY_COLOR_RED
    }, {
        65, 40, 70, 70, 80, 140,
        0x0b,
        0x02,
        25,
        168,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127,
        25,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_SWIFT_SWIM,
        ABILITY_WATER_ABSORB,
        0,
        BODY_COLOR_PURPLE
    }, {
        65, 80, 140, 70, 40, 70,
        0x08,
        0x02,
        25,
        168,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        25,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_STURDY,
        0,
        BODY_COLOR_GRAY
    }, {
        45, 60, 30, 65, 80, 50,
        0x11,
        0x0a,
        120,
        114,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        35,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_EARLY_BIRD,
        ABILITY_FLASH_FIRE,
        0,
        BODY_COLOR_BLACK
    }, {
        75, 90, 50, 95, 110, 80,
        0x11,
        0x0a,
        45,
        204,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        35,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_EARLY_BIRD,
        ABILITY_FLASH_FIRE,
        0,
        BODY_COLOR_BLACK
    }, {
        75, 95, 95, 85, 95, 95,
        0x0b,
        0x10,
        45,
        207,
        0, 1, 0, 0, 1, 1,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        90, 60, 60, 40, 40, 40,
        0x04,
        0x04,
        120,
        124,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PICKUP,
        ABILITY_NONE,
        10,
        BODY_COLOR_BLUE
    }, {
        90, 120, 120, 50, 60, 60,
        0x04,
        0x04,
        60,
        189,
        0, 1, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_STURDY,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        85, 80, 90, 60, 105, 95,
        0x00,
        0x00,
        45,
        180,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_TRACE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        73, 95, 62, 85, 85, 65,
        0x00,
        0x00,
        45,
        165,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        55, 20, 35, 75, 20, 45,
        0x00,
        0x00,
        45,
        106,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_OWN_TEMPO,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        35, 35, 35, 35, 35, 35,
        0x01,
        0x01,
        75,
        91,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_GUTS,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        50, 95, 95, 70, 35, 110,
        0x01,
        0x01,
        45,
        138,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        0,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        45, 30, 15, 65, 85, 65,
        0x0f,
        0x0e,
        45,
        87,
        0, 0, 0, 0, 1, 0,
        ITEM_ASPEAR_BERRY,
        ITEM_ASPEAR_BERRY,
        254,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        45, 63, 37, 95, 65, 55,
        0x0d,
        0x0d,
        45,
        106,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_STATIC,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW, 1
    }, {
        45, 75, 37, 83, 70, 55,
        0x0a,
        0x0a,
        45,
        117,
        0, 0, 0, 1, 0, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        63,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_FLAME_BODY,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        95, 80, 105, 100, 40, 70,
        0x00,
        0x00,
        45,
        200,
        0, 0, 2, 0, 0, 0,
        ITEM_MOOMOO_MILK,
        ITEM_MOOMOO_MILK,
        254,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        255, 10, 10, 55, 75, 135,
        0x00,
        0x00,
        30,
        255,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_LUCKY_EGG,
        254,
        40,
        140,
        GROWTH_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_NATURAL_CURE,
        ABILITY_SERENE_GRACE,
        0,
        BODY_COLOR_PINK
    }, {
        90, 85, 75, 115, 115, 100,
        0x0d,
        0x0d,
        3,
        216,
        0, 0, 0, 2, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        80,
        35,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        115, 115, 85, 100, 90, 75,
        0x0a,
        0x0a,
        3,
        217,
        1, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        80,
        35,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        100, 75, 115, 85, 90, 115,
        0x0b,
        0x0b,
        3,
        215,
        0, 0, 1, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        80,
        35,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        50, 64, 50, 41, 45, 50,
        0x05,
        0x04,
        45,
        67,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_GUTS,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        70, 84, 70, 51, 65, 70,
        0x05,
        0x04,
        45,
        144,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        100, 134, 110, 61, 95, 100,
        0x05,
        0x11,
        45,
        218,
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_SAND_STREAM,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        106, 90, 130, 110, 90, 154,
        0x0e,
        0x02,
        3,
        220,
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        106, 130, 90, 90, 110, 154,
        0x0a,
        0x02,
        3,
        220,
        0, 0, 0, 0, 0, 3,
        ITEM_SACRED_ASH,
        ITEM_SACRED_ASH,
        255,
        120,
        0,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        100, 100, 100, 100, 100, 100,
        0x0e,
        0x0c,
        45,
        64,
        3, 0, 0, 0, 0, 0,
        ITEM_LUM_BERRY,
        ITEM_LUM_BERRY,
        255,
        120,
        100,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NATURAL_CURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 150, 50, 150, 150, 50,
        0x00,
        0x00,
        3,
        1,
        2, 2, 2, 2, 2, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_NONE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        40, 45, 35, 70, 65, 55,
        0x0c,
        0x0c,
        45,
        65,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        50, 65, 45, 95, 85, 65,
        0x0c,
        0x0c,
        45,
        141,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        70, 85, 65, 120, 105, 85,
        0x0c,
        0x0c,
        45,
        208,
        0, 0, 0, 3, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_DRAGON,
        ABILITY_OVERGROW,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        45, 60, 40, 45, 70, 50,
        0x0a,
        0x0a,
        45,
        65,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        60, 85, 60, 55, 85, 60,
        0x0a,
        0x01,
        45,
        142,
        0, 1, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        80, 120, 70, 80, 110, 70,
        0x0a,
        0x01,
        45,
        209,
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_BLAZE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        50, 70, 50, 40, 50, 50,
        0x0b,
        0x0b,
        45,
        65,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        70, 85, 70, 50, 60, 70,
        0x0b,
        0x04,
        45,
        143,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        100, 110, 90, 60, 85, 90,
        0x0b,
        0x04,
        45,
        210,
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_WATER_1,
        ABILITY_TORRENT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        35, 55, 35, 35, 30, 30,
        0x11,
        0x11,
        255,
        55,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_PECHA_BERRY,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_RUN_AWAY,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        70, 90, 70, 70, 60, 60,
        0x11,
        0x11,
        127,
        128,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_PECHA_BERRY,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        38, 30, 41, 60, 30, 41,
        0x00,
        0x00,
        255,
        60,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_ORAN_BERRY,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PICKUP,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        78, 70, 61, 100, 50, 61,
        0x00,
        0x00,
        90,
        128,
        0, 0, 0, 2, 0, 0,
        ITEM_ORAN_BERRY,
        ITEM_SITRUS_BERRY,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PICKUP,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        45, 45, 35, 20, 20, 30,
        0x06,
        0x06,
        255,
        54,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHIELD_DUST,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        50, 35, 55, 15, 25, 25,
        0x06,
        0x06,
        120,
        71,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        60, 70, 50, 65, 90, 50,
        0x06,
        0x02,
        45,
        161,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_SILVER_POWDER,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SWARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        50, 35, 55, 15, 25, 25,
        0x06,
        0x06,
        120,
        72,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        60, 50, 70, 65, 50, 90,
        0x06,
        0x03,
        45,
        160,
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_SILVER_POWDER,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SHIELD_DUST,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        40, 30, 30, 30, 40, 50,
        0x0b,
        0x0c,
        255,
        74,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_GRASS,
        ABILITY_SWIFT_SWIM,
        ABILITY_RAIN_DISH,
        0,
        BODY_COLOR_GREEN
    }, {
        60, 50, 50, 50, 60, 70,
        0x0b,
        0x0c,
        120,
        141,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_GRASS,
        ABILITY_SWIFT_SWIM,
        ABILITY_RAIN_DISH,
        0,
        BODY_COLOR_GREEN
    }, {
        80, 70, 70, 70, 90, 100,
        0x0b,
        0x0c,
        45,
        181,
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_GRASS,
        ABILITY_SWIFT_SWIM,
        ABILITY_RAIN_DISH,
        0,
        BODY_COLOR_GREEN
    }, {
        40, 40, 50, 30, 30, 30,
        0x0c,
        0x0c,
        255,
        74,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_EARLY_BIRD,
        0,
        BODY_COLOR_BROWN
    }, {
        70, 70, 40, 60, 60, 40,
        0x0c,
        0x11,
        120,
        141,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_EARLY_BIRD,
        0,
        BODY_COLOR_BROWN
    }, {
        90, 100, 60, 80, 90, 60,
        0x0c,
        0x11,
        45,
        181,
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_EARLY_BIRD,
        0,
        BODY_COLOR_BROWN
    }, {
        31, 45, 90, 40, 30, 30,
        0x06,
        0x04,
        255,
        65,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_COMPOUND_EYES,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        61, 90, 45, 160, 50, 50,
        0x06,
        0x02,
        120,
        155,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_SPEED_BOOST,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        1, 90, 45, 40, 30, 30,
        0x06,
        0x07,
        45,
        95,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        15,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_WONDER_GUARD,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        40, 55, 30, 85, 30, 30,
        0x00,
        0x02,
        200,
        59,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_GUTS,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        60, 85, 60, 125, 50, 50,
        0x00,
        0x02,
        45,
        162,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FLYING,
        EGG_GROUP_FLYING,
        ABILITY_GUTS,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        60, 40, 60, 35, 40, 60,
        0x0c,
        0x0c,
        255,
        65,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_EFFECT_SPORE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        60, 130, 80, 70, 60, 60,
        0x0c,
        0x01,
        90,
        165,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_EFFECT_SPORE,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        60, 60, 60, 60, 60, 60,
        0x00,
        0x00,
        255,
        85,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_CHESTO_BERRY,
        127,
        15,
        70,
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_OWN_TEMPO,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN, 1
    }, {
        40, 30, 30, 85, 55, 30,
        0x0b,
        0x02,
        190,
        64,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        60, 50, 100, 65, 85, 70,
        0x0b,
        0x02,
        45,
        164,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FLYING,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        40, 30, 32, 65, 50, 52,
        0x06,
        0x0b,
        200,
        63,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_BUG,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        70, 60, 62, 60, 80, 82,
        0x06,
        0x02,
        75,
        128,
        0, 0, 0, 0, 1, 1,
        ITEM_NONE,
        ITEM_SILVER_POWDER,
        127,
        15,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_1,
        EGG_GROUP_BUG,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        130, 70, 35, 60, 70, 35,
        0x0b,
        0x0b,
        125,
        137,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        40,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_FIELD,
        EGG_GROUP_WATER_2,
        ABILITY_WATER_VEIL,
        ABILITY_OBLIVIOUS,
        0,
        BODY_COLOR_BLUE
    }, {
        170, 90, 45, 60, 90, 45,
        0x0b,
        0x0b,
        60,
        206,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        40,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_FIELD,
        EGG_GROUP_WATER_2,
        ABILITY_WATER_VEIL,
        ABILITY_OBLIVIOUS,
        0,
        BODY_COLOR_BLUE
    }, {
        50, 45, 45, 50, 35, 35,
        0x00,
        0x00,
        255,
        65,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_LEPPA_BERRY,
        191,
        15,
        70,
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        70, 65, 65, 70, 55, 55,
        0x00,
        0x00,
        60,
        138,
        1, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_LEPPA_BERRY,
        191,
        15,
        70,
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_CUTE_CHARM,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        60, 90, 70, 40, 60, 120,
        0x00,
        0x00,
        200,
        132,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_PERSIM_BERRY,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_COLOR_CHANGE,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        40, 40, 55, 55, 40, 70,
        0x04,
        0x0e,
        255,
        58,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        255,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        60, 70, 105, 75, 70, 120,
        0x04,
        0x0e,
        90,
        189,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        255,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        30, 45, 135, 30, 45, 90,
        0x05,
        0x05,
        255,
        108,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_STURDY,
        ABILITY_MAGNET_PULL,
        0,
        BODY_COLOR_GRAY
    }, {
        70, 85, 140, 20, 85, 70,
        0x0a,
        0x0a,
        90,
        161,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_WHITE_SMOKE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        50, 75, 75, 50, 65, 65,
        0x11,
        0x07,
        45,
        98,
        0, 1, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        25,
        35,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_KEEN_EYE,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        50, 48, 43, 60, 46, 41,
        0x0b,
        0x04,
        190,
        92,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        110, 78, 73, 60, 76, 71,
        0x0b,
        0x04,
        75,
        158,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        43, 30, 55, 97, 40, 65,
        0x0b,
        0x0b,
        225,
        110,
        0, 0, 0, 1, 0, 0,
        ITEM_HEART_SCALE,
        ITEM_NONE,
        191,
        20,
        70,
        GROWTH_FAST,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        43, 80, 65, 35, 50, 35,
        0x0b,
        0x0b,
        205,
        111,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_HYPER_CUTTER,
        ABILITY_SHELL_ARMOR,
        0,
        BODY_COLOR_RED
    }, {
        63, 120, 85, 55, 90, 55,
        0x0b,
        0x11,
        155,
        161,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_3,
        ABILITY_HYPER_CUTTER,
        ABILITY_SHELL_ARMOR,
        0,
        BODY_COLOR_RED
    }, {
        20, 15, 20, 80, 10, 55,
        0x0b,
        0x0b,
        255,
        61,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        95, 60, 79, 81, 100, 125,
        0x0b,
        0x0b,
        60,
        213,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_1,
        EGG_GROUP_DRAGON,
        ABILITY_MARVEL_SCALE,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        45, 90, 20, 65, 65, 20,
        0x0b,
        0x11,
        225,
        88,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        35,
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_ROUGH_SKIN,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        70, 120, 40, 95, 95, 40,
        0x0b,
        0x11,
        60,
        175,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        35,
        GROWTH_SLOW,
        EGG_GROUP_WATER_2,
        EGG_GROUP_WATER_2,
        ABILITY_ROUGH_SKIN,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        45, 100, 45, 10, 45, 45,
        0x04,
        0x04,
        255,
        73,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SOFT_SAND,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_HYPER_CUTTER,
        ABILITY_ARENA_TRAP,
        0,
        BODY_COLOR_BROWN
    }, {
        50, 70, 50, 70, 50, 50,
        0x04,
        0x10,
        120,
        126,
        0, 1, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_LEVITATE,
        ABILITY_LEVITATE,
        0,
        BODY_COLOR_GREEN
    }, {
        80, 100, 80, 100, 80, 80,
        0x04,
        0x10,
        45,
        197,
        0, 1, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_BUG,
        EGG_GROUP_BUG,
        ABILITY_LEVITATE,
        ABILITY_LEVITATE,
        0,
        BODY_COLOR_GREEN
    }, {
        72, 60, 30, 25, 20, 30,
        0x01,
        0x01,
        180,
        87,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        63,
        20,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_THICK_FAT,
        ABILITY_GUTS,
        0,
        BODY_COLOR_YELLOW
    }, {
        144, 120, 60, 50, 40, 60,
        0x01,
        0x01,
        200,
        184,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_KINGS_ROCK,
        63,
        20,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_THICK_FAT,
        ABILITY_GUTS,
        0,
        BODY_COLOR_BROWN
    }, {
        40, 45, 40, 65, 65, 40,
        0x0d,
        0x0d,
        120,
        104,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_STATIC,
        ABILITY_LIGHTNING_ROD,
        0,
        BODY_COLOR_GREEN
    }, {
        70, 75, 60, 105, 105, 60,
        0x0d,
        0x0d,
        45,
        168,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_STATIC,
        ABILITY_LIGHTNING_ROD,
        0,
        BODY_COLOR_YELLOW
    }, {
        60, 60, 40, 35, 65, 45,
        0x0a,
        0x04,
        255,
        88,
        0, 0, 0, 0, 1, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        70, 100, 70, 40, 105, 75,
        0x0a,
        0x04,
        150,
        175,
        0, 1, 0, 0, 1, 0,
        ITEM_RAWST_BERRY,
        ITEM_RAWST_BERRY,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_MAGMA_ARMOR,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        70, 40, 50, 25, 55, 50,
        0x0f,
        0x0b,
        255,
        75,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        90, 60, 70, 45, 75, 70,
        0x0f,
        0x0b,
        120,
        128,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        110, 80, 90, 65, 95, 90,
        0x0f,
        0x0b,
        45,
        192,
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        50, 85, 40, 35, 85, 40,
        0x0c,
        0x0c,
        190,
        97,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_POISON_BARB,
        127,
        20,
        35,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SAND_VEIL,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        70, 115, 60, 55, 115, 60,
        0x0c,
        0x11,
        60,
        177,
        0, 1, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_POISON_BARB,
        127,
        20,
        35,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_GRASS,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_SAND_VEIL,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        50, 50, 50, 50, 50, 50,
        0x0f,
        0x0f,
        190,
        74,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_MINERAL,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        80, 80, 80, 80, 80, 80,
        0x0f,
        0x0f,
        75,
        187,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NEVER_MELT_ICE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_MINERAL,
        ABILITY_INNER_FOCUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        70, 55, 65, 70, 95, 85,
        0x05,
        0x0e,
        45,
        150,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_MOON_STONE,
        255,
        25,
        70,
        GROWTH_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        70, 95, 85, 70, 55, 65,
        0x05,
        0x0e,
        45,
        150,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SUN_STONE,
        255,
        25,
        70,
        GROWTH_FAST,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        50, 20, 40, 20, 20, 40,
        0x00,
        0x00,
        150,
        33,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        191,
        10,
        70,
        GROWTH_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_THICK_FAT,
        ABILITY_HUGE_POWER,
        0,
        BODY_COLOR_BLUE
    }, {
        60, 25, 35, 60, 70, 80,
        0x0e,
        0x0e,
        255,
        89,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_OWN_TEMPO,
        0,
        BODY_COLOR_BLACK
    }, {
        80, 45, 65, 80, 90, 110,
        0x0e,
        0x0e,
        60,
        164,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_THICK_FAT,
        ABILITY_OWN_TEMPO,
        0,
        BODY_COLOR_PURPLE
    }, {
        60, 50, 40, 95, 85, 75,
        0x0d,
        0x0d,
        200,
        120,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_PLUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        60, 40, 50, 95, 75, 85,
        0x0d,
        0x0d,
        200,
        120,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_FAIRY,
        ABILITY_MINUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        50, 85, 85, 50, 55, 55,
        0x08,
        0x08,
        45,
        98,
        0, 1, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_FAST,
        EGG_GROUP_FIELD,
        EGG_GROUP_FAIRY,
        ABILITY_HYPER_CUTTER,
        ABILITY_INTIMIDATE,
        0,
        BODY_COLOR_BLACK
    }, {
        30, 40, 55, 60, 40, 55,
        0x01,
        0x0e,
        180,
        91,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_PURE_POWER,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        60, 60, 75, 80, 60, 75,
        0x01,
        0x0e,
        90,
        153,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_HUMAN_LIKE,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_PURE_POWER,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        45, 40, 60, 50, 40, 75,
        0x00,
        0x02,
        255,
        74,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_FLYING,
        EGG_GROUP_DRAGON,
        ABILITY_NATURAL_CURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        75, 70, 90, 80, 70, 105,
        0x10,
        0x02,
        45,
        188,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_FLYING,
        EGG_GROUP_DRAGON,
        ABILITY_NATURAL_CURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        95, 23, 48, 23, 23, 48,
        0x0e,
        0x0e,
        125,
        44,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_SHADOW_TAG,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        20, 40, 90, 25, 30, 90,
        0x07,
        0x07,
        190,
        97,
        0, 0, 1, 0, 0, 1,
        ITEM_NONE,
        ITEM_SPELL_TAG,
        127,
        25,
        35,
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        40, 70, 130, 25, 60, 130,
        0x07,
        0x07,
        90,
        179,
        0, 0, 1, 0, 0, 2,
        ITEM_NONE,
        ITEM_SPELL_TAG,
        127,
        25,
        35,
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        50, 60, 45, 65, 100, 80,
        0x0c,
        0x03,
        150,
        152,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_POISON_BARB,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FAIRY,
        EGG_GROUP_GRASS,
        ABILITY_NATURAL_CURE,
        ABILITY_POISON_POINT,
        0,
        BODY_COLOR_GREEN, 1
    }, {
        60, 60, 60, 30, 35, 35,
        0x00,
        0x00,
        255,
        83,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_TRUANT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        80, 80, 80, 90, 55, 55,
        0x00,
        0x00,
        120,
        126,
        0, 0, 0, 2, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_VITAL_SPIRIT,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        150, 160, 100, 100, 95, 65,
        0x00,
        0x00,
        45,
        210,
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        15,
        70,
        GROWTH_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_TRUANT,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        70, 43, 53, 40, 43, 53,
        0x03,
        0x03,
        225,
        75,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_BIG_PEARL,
        127,
        20,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LIQUID_OOZE,
        ABILITY_STICKY_HOLD,
        0,
        BODY_COLOR_GREEN
    }, {
        100, 73, 83, 55, 73, 83,
        0x03,
        0x03,
        75,
        168,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_BIG_PEARL,
        127,
        20,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LIQUID_OOZE,
        ABILITY_STICKY_HOLD,
        0,
        BODY_COLOR_PURPLE
    }, {
        99, 68, 83, 51, 72, 87,
        0x0c,
        0x02,
        200,
        169,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        25,
        70,
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_GRASS,
        ABILITY_CHLOROPHYLL,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        64, 51, 23, 28, 51, 23,
        0x00,
        0x00,
        190,
        68,
        1, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_CHESTO_BERRY,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_SOUNDPROOF,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        84, 71, 43, 48, 71, 43,
        0x00,
        0x00,
        120,
        126,
        2, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_CHESTO_BERRY,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_SOUNDPROOF,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        104, 91, 63, 68, 91, 63,
        0x00,
        0x00,
        45,
        184,
        3, 0, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_CHESTO_BERRY,
        127,
        20,
        70,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_FIELD,
        ABILITY_SOUNDPROOF,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        35, 64, 85, 32, 74, 55,
        0x0b,
        0x0b,
        255,
        142,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_BLUE_SHARD,
        127,
        20,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_SHELL_ARMOR,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        55, 104, 105, 52, 94, 75,
        0x0b,
        0x0b,
        60,
        178,
        0, 1, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        55, 84, 105, 52, 114, 75,
        0x0b,
        0x0b,
        60,
        178,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_1,
        ABILITY_SWIFT_SWIM,
        ABILITY_NONE,
        0,
        BODY_COLOR_PINK
    }, {
        65, 130, 60, 75, 75, 60,
        0x11,
        0x11,
        30,
        174,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        25,
        35,
        GROWTH_MEDIUM_SLOW,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE, 1
    }, {
        44, 75, 35, 45, 63, 33,
        0x07,
        0x07,
        225,
        97,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SPELL_TAG,
        127,
        25,
        35,
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_INSOMNIA,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        64, 115, 65, 65, 83, 63,
        0x07,
        0x07,
        45,
        179,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_SPELL_TAG,
        127,
        25,
        35,
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_INSOMNIA,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK
    }, {
        73, 100, 60, 65, 100, 60,
        0x03,
        0x03,
        90,
        165,
        0, 1, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_FIELD,
        EGG_GROUP_DRAGON,
        ABILITY_SHED_SKIN,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLACK, 1
    }, {
        73, 115, 60, 90, 60, 60,
        0x00,
        0x00,
        90,
        165,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_FIELD,
        EGG_GROUP_FIELD,
        ABILITY_IMMUNITY,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE, 1
    }, {
        100, 90, 130, 55, 45, 65,
        0x0b,
        0x05,
        25,
        198,
        1, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_GREEN_SHARD,
        31,
        40,
        70,
        GROWTH_SLOW,
        EGG_GROUP_WATER_1,
        EGG_GROUP_WATER_2,
        ABILITY_SWIFT_SWIM,
        ABILITY_ROCK_HEAD,
        0,
        BODY_COLOR_GRAY
    }, {
        50, 70, 100, 30, 40, 40,
        0x08,
        0x05,
        180,
        96,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_HARD_STONE,
        127,
        35,
        35,
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_STURDY,
        ABILITY_ROCK_HEAD,
        0,
        BODY_COLOR_GRAY
    }, {
        60, 90, 140, 40, 50, 50,
        0x08,
        0x05,
        90,
        152,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_HARD_STONE,
        127,
        35,
        35,
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_STURDY,
        ABILITY_ROCK_HEAD,
        0,
        BODY_COLOR_GRAY
    }, {
        70, 110, 180, 50, 60, 60,
        0x08,
        0x05,
        45,
        205,
        0, 0, 3, 0, 0, 0,
        ITEM_NONE,
        ITEM_HARD_STONE,
        127,
        35,
        35,
        GROWTH_SLOW,
        EGG_GROUP_MONSTER,
        EGG_GROUP_MONSTER,
        ABILITY_STURDY,
        ABILITY_ROCK_HEAD,
        0,
        BODY_COLOR_GRAY
    }, {
        70, 70, 70, 70, 70, 70,
        0x00,
        0x00,
        45,
        145,
        1, 0, 0, 0, 0, 0,
        ITEM_MYSTIC_WATER,
        ITEM_MYSTIC_WATER,
        127,
        25,
        70,
        GROWTH_MEDIUM_FAST,
        EGG_GROUP_FAIRY,
        EGG_GROUP_AMORPHOUS,
        ABILITY_FORECAST,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        65, 73, 55, 85, 47, 75,
        0x06,
        0x06,
        150,
        146,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        0,
        15,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_BUG,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_ILLUMINATE,
        ABILITY_SWARM,
        0,
        BODY_COLOR_GRAY
    }, {
        65, 47, 55, 85, 73, 75,
        0x06,
        0x06,
        150,
        146,
        0, 0, 0, 1, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        254,
        15,
        70,
        GROWTH_FLUCTUATING,
        EGG_GROUP_BUG,
        EGG_GROUP_HUMAN_LIKE,
        ABILITY_OBLIVIOUS,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        66, 41, 77, 23, 61, 87,
        0x05,
        0x0c,
        45,
        121,
        0, 0, 0, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        31,
        30,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_SUCTION_CUPS,
        ABILITY_NONE,
        0,
        BODY_COLOR_PURPLE
    }, {
        86, 81, 97, 43, 81, 107,
        0x05,
        0x0c,
        45,
        201,
        0, 0, 0, 0, 0, 2,
        ITEM_NONE,
        ITEM_NONE,
        31,
        30,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_SUCTION_CUPS,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        45, 95, 50, 75, 40, 50,
        0x05,
        0x06,
        45,
        119,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        30,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_BATTLE_ARMOR,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        75, 125, 100, 45, 70, 80,
        0x05,
        0x06,
        45,
        200,
        0, 2, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        31,
        30,
        70,
        GROWTH_ERRATIC,
        EGG_GROUP_WATER_3,
        EGG_GROUP_WATER_3,
        ABILITY_BATTLE_ARMOR,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        28, 25, 25, 40, 45, 35,
        0x0e,
        0x0e,
        235,
        70,
        0, 0, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        35,
        GROWTH_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_SYNCHRONIZE,
        ABILITY_TRACE,
        0,
        BODY_COLOR_WHITE
    }, {
        38, 35, 35, 50, 65, 55,
        0x0e,
        0x0e,
        120,
        140,
        0, 0, 0, 0, 2, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        35,
        GROWTH_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_SYNCHRONIZE,
        ABILITY_TRACE,
        0,
        BODY_COLOR_WHITE
    }, {
        68, 65, 65, 80, 125, 115,
        0x0e,
        0x0e,
        45,
        208,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        127,
        20,
        35,
        GROWTH_SLOW,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_SYNCHRONIZE,
        ABILITY_TRACE,
        0,
        BODY_COLOR_WHITE
    }, {
        45, 75, 60, 50, 40, 30,
        0x10,
        0x10,
        45,
        89,
        0, 1, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_DRAGON,
        EGG_GROUP_DRAGON,
        ABILITY_ROCK_HEAD,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        65, 95, 100, 50, 60, 50,
        0x10,
        0x10,
        45,
        144,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_DRAGON,
        EGG_GROUP_DRAGON,
        ABILITY_ROCK_HEAD,
        ABILITY_NONE,
        0,
        BODY_COLOR_WHITE
    }, {
        95, 135, 80, 100, 110, 80,
        0x10,
        0x02,
        45,
        218,
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_DRAGON_SCALE,
        127,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_DRAGON,
        EGG_GROUP_DRAGON,
        ABILITY_INTIMIDATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        40, 55, 80, 30, 35, 60,
        0x08,
        0x0e,
        3,
        103,
        0, 0, 1, 0, 0, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        255,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        60, 75, 100, 50, 55, 80,
        0x08,
        0x0e,
        3,
        153,
        0, 0, 2, 0, 0, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        255,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        80, 135, 130, 70, 95, 90,
        0x08,
        0x0e,
        3,
        210,
        0, 0, 3, 0, 0, 0,
        ITEM_NONE,
        ITEM_METAL_COAT,
        255,
        40,
        35,
        GROWTH_SLOW,
        EGG_GROUP_MINERAL,
        EGG_GROUP_MINERAL,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        80, 100, 200, 50, 50, 100,
        0x05,
        0x05,
        3,
        217,
        0, 0, 3, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        80,
        35,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0,
        BODY_COLOR_BROWN
    }, {
        80, 50, 100, 50, 100, 200,
        0x0f,
        0x0f,
        3,
        216,
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        255,
        80,
        35,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        80, 75, 150, 50, 75, 150,
        0x08,
        0x08,
        3,
        215,
        0, 0, 2, 0, 0, 1,
        ITEM_NONE,
        ITEM_NONE,
        255,
        80,
        35,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_CLEAR_BODY,
        ABILITY_NONE,
        0,
        BODY_COLOR_GRAY
    }, {
        100, 100, 90, 90, 150, 140,
        0x0b,
        0x0b,
        5,
        218,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_DRIZZLE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        100, 150, 140, 90, 100, 90,
        0x04,
        0x04,
        5,
        218,
        0, 3, 0, 0, 0, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_DROUGHT,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        105, 150, 90, 95, 150, 90,
        0x10,
        0x02,
        3,
        220,
        0, 2, 0, 0, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_AIR_LOCK,
        ABILITY_NONE,
        0,
        BODY_COLOR_GREEN
    }, {
        80, 80, 90, 110, 110, 130,
        0x10,
        0x0e,
        3,
        211,
        0, 0, 0, 0, 0, 3,
        ITEM_NONE,
        ITEM_NONE,
        254,
        120,
        90,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED
    }, {
        80, 90, 80, 110, 130, 110,
        0x10,
        0x0e,
        3,
        211,
        0, 0, 0, 0, 3, 0,
        ITEM_NONE,
        ITEM_NONE,
        0,
        120,
        90,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }, {
        100, 100, 100, 100, 100, 100,
        0x08,
        0x0e,
        3,
        215,
        3, 0, 0, 0, 0, 0,
        ITEM_STAR_PIECE,
        ITEM_STAR_PIECE,
        255,
        120,
        100,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_SERENE_GRACE,
        ABILITY_NONE,
        0,
        BODY_COLOR_YELLOW
    }, {
        50, 150, 50, 150, 150, 50,
        0x0e,
        0x0e,
        3,
        215,
        0, 1, 0, 1, 1, 0,
        ITEM_NONE,
        ITEM_NONE,
        255,
        120,
        0,
        GROWTH_SLOW,
        EGG_GROUP_UNDISCOVERED,
        EGG_GROUP_UNDISCOVERED,
        ABILITY_PRESSURE,
        ABILITY_NONE,
        0,
        BODY_COLOR_RED, 1
    }, {
        65, 50, 70, 65, 95, 80,
        0x0e,
        0x0e,
        45,
        147,
        0, 0, 0, 0, 1, 1,
        ITEM_NONE,
        ITEM_NONE,
        127,
        25,
        70,
        GROWTH_FAST,
        EGG_GROUP_AMORPHOUS,
        EGG_GROUP_AMORPHOUS,
        ABILITY_LEVITATE,
        ABILITY_NONE,
        0,
        BODY_COLOR_BLUE
    }
};
# 21 "src/pokemon/pokemon_data.c" 2
# 1 "src/pokemon/../data/pokemon/level_up_learnsets.h" 1
# 11 "src/pokemon/../data/pokemon/level_up_learnsets.h"
const u16 gBulbasaurLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((4 << 9) | MOVE_GROWL),
    ((7 << 9) | MOVE_LEECH_SEED),
    ((10 << 9) | MOVE_VINE_WHIP),
    ((15 << 9) | MOVE_POISON_POWDER),
    ((15 << 9) | MOVE_SLEEP_POWDER),
    ((20 << 9) | MOVE_RAZOR_LEAF),
    ((25 << 9) | MOVE_SWEET_SCENT),
    ((32 << 9) | MOVE_GROWTH),
    ((39 << 9) | MOVE_SYNTHESIS),
    ((46 << 9) | MOVE_SOLAR_BEAM),
    0xffff
};

const u16 gIvysaurLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_LEECH_SEED),
    ((4 << 9) | MOVE_GROWL),
    ((7 << 9) | MOVE_LEECH_SEED),
    ((10 << 9) | MOVE_VINE_WHIP),
    ((15 << 9) | MOVE_POISON_POWDER),
    ((15 << 9) | MOVE_SLEEP_POWDER),
    ((22 << 9) | MOVE_RAZOR_LEAF),
    ((29 << 9) | MOVE_SWEET_SCENT),
    ((38 << 9) | MOVE_GROWTH),
    ((47 << 9) | MOVE_SYNTHESIS),
    ((56 << 9) | MOVE_SOLAR_BEAM),
    0xffff
};

const u16 gVenusaurLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_LEECH_SEED),
    ((1 << 9) | MOVE_VINE_WHIP),
    ((4 << 9) | MOVE_GROWL),
    ((7 << 9) | MOVE_LEECH_SEED),
    ((10 << 9) | MOVE_VINE_WHIP),
    ((15 << 9) | MOVE_POISON_POWDER),
    ((15 << 9) | MOVE_SLEEP_POWDER),
    ((22 << 9) | MOVE_RAZOR_LEAF),
    ((29 << 9) | MOVE_SWEET_SCENT),
    ((41 << 9) | MOVE_GROWTH),
    ((53 << 9) | MOVE_SYNTHESIS),
    ((65 << 9) | MOVE_SOLAR_BEAM),
    0xffff
};

const u16 gCharmanderLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_GROWL),
    ((7 << 9) | MOVE_EMBER),
    ((13 << 9) | MOVE_SMOKESCREEN),
    ((19 << 9) | MOVE_RAGE),
    ((25 << 9) | MOVE_SCARY_FACE),
    ((31 << 9) | MOVE_FLAMETHROWER),
    ((37 << 9) | MOVE_SLASH),
    ((43 << 9) | MOVE_DRAGON_RAGE),
    ((49 << 9) | MOVE_FIRE_SPIN),
    0xffff
};

const u16 gCharmeleonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_EMBER),
    ((7 << 9) | MOVE_EMBER),
    ((13 << 9) | MOVE_SMOKESCREEN),
    ((20 << 9) | MOVE_RAGE),
    ((27 << 9) | MOVE_SCARY_FACE),
    ((34 << 9) | MOVE_FLAMETHROWER),
    ((41 << 9) | MOVE_SLASH),
    ((48 << 9) | MOVE_DRAGON_RAGE),
    ((55 << 9) | MOVE_FIRE_SPIN),
    0xffff
};

const u16 gCharizardLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_EMBER),
    ((1 << 9) | MOVE_SMOKESCREEN),
    ((7 << 9) | MOVE_EMBER),
    ((13 << 9) | MOVE_SMOKESCREEN),
    ((20 << 9) | MOVE_RAGE),
    ((27 << 9) | MOVE_SCARY_FACE),
    ((34 << 9) | MOVE_FLAMETHROWER),
    ((36 << 9) | MOVE_WING_ATTACK),
    ((44 << 9) | MOVE_SLASH),
    ((54 << 9) | MOVE_DRAGON_RAGE),
    ((64 << 9) | MOVE_FIRE_SPIN),
    0xffff
};

const u16 gSquirtleLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((4 << 9) | MOVE_TAIL_WHIP),
    ((7 << 9) | MOVE_BUBBLE),
    ((10 << 9) | MOVE_WITHDRAW),
    ((13 << 9) | MOVE_WATER_GUN),
    ((18 << 9) | MOVE_BITE),
    ((23 << 9) | MOVE_RAPID_SPIN),
    ((28 << 9) | MOVE_PROTECT),
    ((33 << 9) | MOVE_RAIN_DANCE),
    ((40 << 9) | MOVE_SKULL_BASH),
    ((47 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gWartortleLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_BUBBLE),
    ((4 << 9) | MOVE_TAIL_WHIP),
    ((7 << 9) | MOVE_BUBBLE),
    ((10 << 9) | MOVE_WITHDRAW),
    ((13 << 9) | MOVE_WATER_GUN),
    ((19 << 9) | MOVE_BITE),
    ((25 << 9) | MOVE_RAPID_SPIN),
    ((31 << 9) | MOVE_PROTECT),
    ((37 << 9) | MOVE_RAIN_DANCE),
    ((45 << 9) | MOVE_SKULL_BASH),
    ((53 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gBlastoiseLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_BUBBLE),
    ((1 << 9) | MOVE_WITHDRAW),
    ((4 << 9) | MOVE_TAIL_WHIP),
    ((7 << 9) | MOVE_BUBBLE),
    ((10 << 9) | MOVE_WITHDRAW),
    ((13 << 9) | MOVE_WATER_GUN),
    ((19 << 9) | MOVE_BITE),
    ((25 << 9) | MOVE_RAPID_SPIN),
    ((31 << 9) | MOVE_PROTECT),
    ((42 << 9) | MOVE_RAIN_DANCE),
    ((55 << 9) | MOVE_SKULL_BASH),
    ((68 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gCaterpieLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_STRING_SHOT),
    0xffff
};

const u16 gMetapodLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HARDEN),
    ((7 << 9) | MOVE_HARDEN),
    0xffff
};

const u16 gButterfreeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CONFUSION),
    ((10 << 9) | MOVE_CONFUSION),
    ((13 << 9) | MOVE_POISON_POWDER),
    ((14 << 9) | MOVE_STUN_SPORE),
    ((15 << 9) | MOVE_SLEEP_POWDER),
    ((18 << 9) | MOVE_SUPERSONIC),
    ((23 << 9) | MOVE_WHIRLWIND),
    ((28 << 9) | MOVE_GUST),
    ((34 << 9) | MOVE_PSYBEAM),
    ((40 << 9) | MOVE_SAFEGUARD),
    ((47 << 9) | MOVE_SILVER_WIND),
    0xffff
};

const u16 gWeedleLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_STING),
    ((1 << 9) | MOVE_STRING_SHOT),
    0xffff
};

const u16 gKakunaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HARDEN),
    ((7 << 9) | MOVE_HARDEN),
    0xffff
};

const u16 gBeedrillLevelUpLearnset[] = {
    ((1 << 9) | MOVE_FURY_ATTACK),
    ((10 << 9) | MOVE_FURY_ATTACK),
    ((15 << 9) | MOVE_FOCUS_ENERGY),
    ((20 << 9) | MOVE_TWINEEDLE),
    ((25 << 9) | MOVE_RAGE),
    ((30 << 9) | MOVE_PURSUIT),
    ((35 << 9) | MOVE_PIN_MISSILE),
    ((40 << 9) | MOVE_AGILITY),
    ((45 << 9) | MOVE_ENDEAVOR),
    0xffff
};

const u16 gPidgeyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((5 << 9) | MOVE_SAND_ATTACK),
    ((9 << 9) | MOVE_GUST),
    ((13 << 9) | MOVE_QUICK_ATTACK),
    ((19 << 9) | MOVE_WHIRLWIND),
    ((25 << 9) | MOVE_WING_ATTACK),
    ((31 << 9) | MOVE_FEATHER_DANCE),
    ((39 << 9) | MOVE_AGILITY),
    ((47 << 9) | MOVE_MIRROR_MOVE),
    0xffff
};

const u16 gPidgeottoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_SAND_ATTACK),
    ((1 << 9) | MOVE_GUST),
    ((5 << 9) | MOVE_SAND_ATTACK),
    ((9 << 9) | MOVE_GUST),
    ((13 << 9) | MOVE_QUICK_ATTACK),
    ((20 << 9) | MOVE_WHIRLWIND),
    ((27 << 9) | MOVE_WING_ATTACK),
    ((34 << 9) | MOVE_FEATHER_DANCE),
    ((43 << 9) | MOVE_AGILITY),
    ((52 << 9) | MOVE_MIRROR_MOVE),
    0xffff
};

const u16 gPidgeotLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_SAND_ATTACK),
    ((1 << 9) | MOVE_GUST),
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((5 << 9) | MOVE_SAND_ATTACK),
    ((9 << 9) | MOVE_GUST),
    ((13 << 9) | MOVE_QUICK_ATTACK),
    ((20 << 9) | MOVE_WHIRLWIND),
    ((27 << 9) | MOVE_WING_ATTACK),
    ((34 << 9) | MOVE_FEATHER_DANCE),
    ((48 << 9) | MOVE_AGILITY),
    ((62 << 9) | MOVE_MIRROR_MOVE),
    0xffff
};

const u16 gRattataLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((7 << 9) | MOVE_QUICK_ATTACK),
    ((13 << 9) | MOVE_HYPER_FANG),
    ((20 << 9) | MOVE_FOCUS_ENERGY),
    ((27 << 9) | MOVE_PURSUIT),
    ((34 << 9) | MOVE_SUPER_FANG),
    ((41 << 9) | MOVE_ENDEAVOR),
    0xffff
};

const u16 gRaticateLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((7 << 9) | MOVE_QUICK_ATTACK),
    ((13 << 9) | MOVE_HYPER_FANG),
    ((20 << 9) | MOVE_SCARY_FACE),
    ((30 << 9) | MOVE_PURSUIT),
    ((40 << 9) | MOVE_SUPER_FANG),
    ((50 << 9) | MOVE_ENDEAVOR),
    0xffff
};

const u16 gSpearowLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_GROWL),
    ((7 << 9) | MOVE_LEER),
    ((13 << 9) | MOVE_FURY_ATTACK),
    ((19 << 9) | MOVE_PURSUIT),
    ((25 << 9) | MOVE_AERIAL_ACE),
    ((31 << 9) | MOVE_MIRROR_MOVE),
    ((37 << 9) | MOVE_DRILL_PECK),
    ((43 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gFearowLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_FURY_ATTACK),
    ((7 << 9) | MOVE_LEER),
    ((13 << 9) | MOVE_FURY_ATTACK),
    ((26 << 9) | MOVE_PURSUIT),
    ((32 << 9) | MOVE_MIRROR_MOVE),
    ((40 << 9) | MOVE_DRILL_PECK),
    ((47 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gEkansLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WRAP),
    ((1 << 9) | MOVE_LEER),
    ((8 << 9) | MOVE_POISON_STING),
    ((13 << 9) | MOVE_BITE),
    ((20 << 9) | MOVE_GLARE),
    ((25 << 9) | MOVE_SCREECH),
    ((32 << 9) | MOVE_ACID),
    ((37 << 9) | MOVE_STOCKPILE),
    ((37 << 9) | MOVE_SWALLOW),
    ((37 << 9) | MOVE_SPIT_UP),
    ((44 << 9) | MOVE_HAZE),
    0xffff
};

const u16 gArbokLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WRAP),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_POISON_STING),
    ((1 << 9) | MOVE_BITE),
    ((8 << 9) | MOVE_POISON_STING),
    ((13 << 9) | MOVE_BITE),
    ((20 << 9) | MOVE_GLARE),
    ((28 << 9) | MOVE_SCREECH),
    ((38 << 9) | MOVE_ACID),
    ((46 << 9) | MOVE_STOCKPILE),
    ((46 << 9) | MOVE_SWALLOW),
    ((46 << 9) | MOVE_SPIT_UP),
    ((56 << 9) | MOVE_HAZE),
    0xffff
};

const u16 gPikachuLevelUpLearnset[] = {
    ((1 << 9) | MOVE_THUNDER_SHOCK),
    ((1 << 9) | MOVE_GROWL),
    ((6 << 9) | MOVE_TAIL_WHIP),
    ((8 << 9) | MOVE_THUNDER_WAVE),
    ((11 << 9) | MOVE_QUICK_ATTACK),
    ((15 << 9) | MOVE_DOUBLE_TEAM),
    ((20 << 9) | MOVE_SLAM),
    ((26 << 9) | MOVE_THUNDERBOLT),
    ((33 << 9) | MOVE_AGILITY),
    ((41 << 9) | MOVE_THUNDER),
    ((50 << 9) | MOVE_LIGHT_SCREEN),
    0xffff
};

const u16 gRaichuLevelUpLearnset[] = {
    ((1 << 9) | MOVE_THUNDER_SHOCK),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((1 << 9) | MOVE_THUNDERBOLT),
    0xffff
};

const u16 gSandshrewLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((6 << 9) | MOVE_DEFENSE_CURL),
    ((11 << 9) | MOVE_SAND_ATTACK),
    ((17 << 9) | MOVE_POISON_STING),
    ((23 << 9) | MOVE_SLASH),
    ((30 << 9) | MOVE_SWIFT),
    ((37 << 9) | MOVE_FURY_SWIPES),
    ((45 << 9) | MOVE_SAND_TOMB),
    ((53 << 9) | MOVE_SANDSTORM),
    0xffff
};

const u16 gSandslashLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_DEFENSE_CURL),
    ((1 << 9) | MOVE_SAND_ATTACK),
    ((6 << 9) | MOVE_DEFENSE_CURL),
    ((11 << 9) | MOVE_SAND_ATTACK),
    ((17 << 9) | MOVE_POISON_STING),
    ((24 << 9) | MOVE_SLASH),
    ((33 << 9) | MOVE_SWIFT),
    ((42 << 9) | MOVE_FURY_SWIPES),
    ((52 << 9) | MOVE_SAND_TOMB),
    ((62 << 9) | MOVE_SANDSTORM),
    0xffff
};

const u16 gNidoranFLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_SCRATCH),
    ((8 << 9) | MOVE_TAIL_WHIP),
    ((12 << 9) | MOVE_DOUBLE_KICK),
    ((17 << 9) | MOVE_POISON_STING),
    ((20 << 9) | MOVE_BITE),
    ((23 << 9) | MOVE_HELPING_HAND),
    ((30 << 9) | MOVE_FURY_SWIPES),
    ((38 << 9) | MOVE_FLATTER),
    ((47 << 9) | MOVE_CRUNCH),
    0xffff
};

const u16 gNidorinaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_SCRATCH),
    ((8 << 9) | MOVE_TAIL_WHIP),
    ((12 << 9) | MOVE_DOUBLE_KICK),
    ((18 << 9) | MOVE_POISON_STING),
    ((22 << 9) | MOVE_BITE),
    ((26 << 9) | MOVE_HELPING_HAND),
    ((34 << 9) | MOVE_FURY_SWIPES),
    ((43 << 9) | MOVE_FLATTER),
    ((53 << 9) | MOVE_CRUNCH),
    0xffff
};

const u16 gNidoqueenLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_DOUBLE_KICK),
    ((1 << 9) | MOVE_POISON_STING),
    ((23 << 9) | MOVE_BODY_SLAM),
    0xffff
};

const u16 gNidoranMLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_PECK),
    ((8 << 9) | MOVE_FOCUS_ENERGY),
    ((12 << 9) | MOVE_DOUBLE_KICK),
    ((17 << 9) | MOVE_POISON_STING),
    ((20 << 9) | MOVE_HORN_ATTACK),
    ((23 << 9) | MOVE_HELPING_HAND),
    ((30 << 9) | MOVE_FURY_ATTACK),
    ((38 << 9) | MOVE_FLATTER),
    ((47 << 9) | MOVE_HORN_DRILL),
    0xffff
};

const u16 gNidorinoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_PECK),
    ((8 << 9) | MOVE_FOCUS_ENERGY),
    ((12 << 9) | MOVE_DOUBLE_KICK),
    ((18 << 9) | MOVE_POISON_STING),
    ((22 << 9) | MOVE_HORN_ATTACK),
    ((26 << 9) | MOVE_HELPING_HAND),
    ((34 << 9) | MOVE_FURY_ATTACK),
    ((43 << 9) | MOVE_FLATTER),
    ((53 << 9) | MOVE_HORN_DRILL),
    0xffff
};

const u16 gNidokingLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_FOCUS_ENERGY),
    ((1 << 9) | MOVE_DOUBLE_KICK),
    ((1 << 9) | MOVE_POISON_STING),
    ((23 << 9) | MOVE_THRASH),
    0xffff
};

const u16 gClefairyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_GROWL),
    ((5 << 9) | MOVE_ENCORE),
    ((9 << 9) | MOVE_SING),
    ((13 << 9) | MOVE_DOUBLE_SLAP),
    ((17 << 9) | MOVE_FOLLOW_ME),
    ((21 << 9) | MOVE_MINIMIZE),
    ((25 << 9) | MOVE_DEFENSE_CURL),
    ((29 << 9) | MOVE_METRONOME),
    ((33 << 9) | MOVE_COSMIC_POWER),
    ((37 << 9) | MOVE_MOONLIGHT),
    ((41 << 9) | MOVE_LIGHT_SCREEN),
    ((45 << 9) | MOVE_METEOR_MASH),
    0xffff
};

const u16 gClefableLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SING),
    ((1 << 9) | MOVE_DOUBLE_SLAP),
    ((1 << 9) | MOVE_MINIMIZE),
    ((1 << 9) | MOVE_METRONOME),
    0xffff
};

const u16 gVulpixLevelUpLearnset[] = {
    ((1 << 9) | MOVE_EMBER),
    ((5 << 9) | MOVE_TAIL_WHIP),
    ((9 << 9) | MOVE_ROAR),
    ((13 << 9) | MOVE_QUICK_ATTACK),
    ((17 << 9) | MOVE_WILL_O_WISP),
    ((21 << 9) | MOVE_CONFUSE_RAY),
    ((25 << 9) | MOVE_IMPRISON),
    ((29 << 9) | MOVE_FLAMETHROWER),
    ((33 << 9) | MOVE_SAFEGUARD),
    ((37 << 9) | MOVE_GRUDGE),
    ((41 << 9) | MOVE_FIRE_SPIN),
    0xffff
};

const u16 gNinetalesLevelUpLearnset[] = {
    ((1 << 9) | MOVE_EMBER),
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((1 << 9) | MOVE_CONFUSE_RAY),
    ((1 << 9) | MOVE_SAFEGUARD),
    ((45 << 9) | MOVE_FIRE_SPIN),
    0xffff
};

const u16 gJigglypuffLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SING),
    ((4 << 9) | MOVE_DEFENSE_CURL),
    ((9 << 9) | MOVE_POUND),
    ((14 << 9) | MOVE_DISABLE),
    ((19 << 9) | MOVE_ROLLOUT),
    ((24 << 9) | MOVE_DOUBLE_SLAP),
    ((29 << 9) | MOVE_REST),
    ((34 << 9) | MOVE_BODY_SLAM),
    ((39 << 9) | MOVE_MIMIC),
    ((44 << 9) | MOVE_HYPER_VOICE),
    ((49 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gWigglytuffLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SING),
    ((1 << 9) | MOVE_DISABLE),
    ((1 << 9) | MOVE_DEFENSE_CURL),
    ((1 << 9) | MOVE_DOUBLE_SLAP),
    0xffff
};

const u16 gZubatLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEECH_LIFE),
    ((6 << 9) | MOVE_SUPERSONIC),
    ((11 << 9) | MOVE_ASTONISH),
    ((16 << 9) | MOVE_BITE),
    ((21 << 9) | MOVE_WING_ATTACK),
    ((26 << 9) | MOVE_CONFUSE_RAY),
    ((31 << 9) | MOVE_AIR_CUTTER),
    ((36 << 9) | MOVE_MEAN_LOOK),
    ((41 << 9) | MOVE_POISON_FANG),
    ((46 << 9) | MOVE_HAZE),
    0xffff
};

const u16 gGolbatLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCREECH),
    ((1 << 9) | MOVE_LEECH_LIFE),
    ((1 << 9) | MOVE_SUPERSONIC),
    ((1 << 9) | MOVE_ASTONISH),
    ((6 << 9) | MOVE_SUPERSONIC),
    ((11 << 9) | MOVE_ASTONISH),
    ((16 << 9) | MOVE_BITE),
    ((21 << 9) | MOVE_WING_ATTACK),
    ((28 << 9) | MOVE_CONFUSE_RAY),
    ((35 << 9) | MOVE_AIR_CUTTER),
    ((42 << 9) | MOVE_MEAN_LOOK),
    ((49 << 9) | MOVE_POISON_FANG),
    ((56 << 9) | MOVE_HAZE),
    0xffff
};

const u16 gOddishLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ABSORB),
    ((7 << 9) | MOVE_SWEET_SCENT),
    ((14 << 9) | MOVE_POISON_POWDER),
    ((16 << 9) | MOVE_STUN_SPORE),
    ((18 << 9) | MOVE_SLEEP_POWDER),
    ((23 << 9) | MOVE_ACID),
    ((32 << 9) | MOVE_MOONLIGHT),
    ((39 << 9) | MOVE_PETAL_DANCE),
    0xffff
};

const u16 gGloomLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ABSORB),
    ((1 << 9) | MOVE_SWEET_SCENT),
    ((1 << 9) | MOVE_POISON_POWDER),
    ((7 << 9) | MOVE_SWEET_SCENT),
    ((14 << 9) | MOVE_POISON_POWDER),
    ((16 << 9) | MOVE_STUN_SPORE),
    ((18 << 9) | MOVE_SLEEP_POWDER),
    ((24 << 9) | MOVE_ACID),
    ((35 << 9) | MOVE_MOONLIGHT),
    ((44 << 9) | MOVE_PETAL_DANCE),
    0xffff
};

const u16 gVileplumeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ABSORB),
    ((1 << 9) | MOVE_AROMATHERAPY),
    ((1 << 9) | MOVE_STUN_SPORE),
    ((1 << 9) | MOVE_MEGA_DRAIN),
    ((44 << 9) | MOVE_PETAL_DANCE),
    0xffff
};

const u16 gParasLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((7 << 9) | MOVE_STUN_SPORE),
    ((13 << 9) | MOVE_POISON_POWDER),
    ((19 << 9) | MOVE_LEECH_LIFE),
    ((25 << 9) | MOVE_SPORE),
    ((31 << 9) | MOVE_SLASH),
    ((37 << 9) | MOVE_GROWTH),
    ((43 << 9) | MOVE_GIGA_DRAIN),
    ((49 << 9) | MOVE_AROMATHERAPY),
    0xffff
};

const u16 gParasectLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_STUN_SPORE),
    ((1 << 9) | MOVE_POISON_POWDER),
    ((7 << 9) | MOVE_STUN_SPORE),
    ((13 << 9) | MOVE_POISON_POWDER),
    ((19 << 9) | MOVE_LEECH_LIFE),
    ((27 << 9) | MOVE_SPORE),
    ((35 << 9) | MOVE_SLASH),
    ((43 << 9) | MOVE_GROWTH),
    ((51 << 9) | MOVE_GIGA_DRAIN),
    ((59 << 9) | MOVE_AROMATHERAPY),
    0xffff
};

const u16 gVenonatLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_DISABLE),
    ((1 << 9) | MOVE_FORESIGHT),
    ((9 << 9) | MOVE_SUPERSONIC),
    ((17 << 9) | MOVE_CONFUSION),
    ((20 << 9) | MOVE_POISON_POWDER),
    ((25 << 9) | MOVE_LEECH_LIFE),
    ((28 << 9) | MOVE_STUN_SPORE),
    ((33 << 9) | MOVE_PSYBEAM),
    ((36 << 9) | MOVE_SLEEP_POWDER),
    ((41 << 9) | MOVE_PSYCHIC),
    0xffff
};

const u16 gVenomothLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SILVER_WIND),
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_DISABLE),
    ((1 << 9) | MOVE_FORESIGHT),
    ((1 << 9) | MOVE_SUPERSONIC),
    ((9 << 9) | MOVE_SUPERSONIC),
    ((17 << 9) | MOVE_CONFUSION),
    ((20 << 9) | MOVE_POISON_POWDER),
    ((25 << 9) | MOVE_LEECH_LIFE),
    ((28 << 9) | MOVE_STUN_SPORE),
    ((31 << 9) | MOVE_GUST),
    ((36 << 9) | MOVE_PSYBEAM),
    ((42 << 9) | MOVE_SLEEP_POWDER),
    ((52 << 9) | MOVE_PSYCHIC),
    0xffff
};

const u16 gDiglettLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_SAND_ATTACK),
    ((5 << 9) | MOVE_GROWL),
    ((9 << 9) | MOVE_MAGNITUDE),
    ((17 << 9) | MOVE_DIG),
    ((25 << 9) | MOVE_MUD_SLAP),
    ((33 << 9) | MOVE_SLASH),
    ((41 << 9) | MOVE_EARTHQUAKE),
    ((49 << 9) | MOVE_FISSURE),
    0xffff
};

const u16 gDugtrioLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TRI_ATTACK),
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_SAND_ATTACK),
    ((1 << 9) | MOVE_GROWL),
    ((5 << 9) | MOVE_GROWL),
    ((9 << 9) | MOVE_MAGNITUDE),
    ((17 << 9) | MOVE_DIG),
    ((25 << 9) | MOVE_MUD_SLAP),
    ((26 << 9) | MOVE_SAND_TOMB),
    ((38 << 9) | MOVE_SLASH),
    ((51 << 9) | MOVE_EARTHQUAKE),
    ((64 << 9) | MOVE_FISSURE),
    0xffff
};

const u16 gMeowthLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_GROWL),
    ((11 << 9) | MOVE_BITE),
    ((20 << 9) | MOVE_PAY_DAY),
    ((28 << 9) | MOVE_FAINT_ATTACK),
    ((35 << 9) | MOVE_SCREECH),
    ((41 << 9) | MOVE_FURY_SWIPES),
    ((46 << 9) | MOVE_SLASH),
    ((50 << 9) | MOVE_FAKE_OUT),
    0xffff
};

const u16 gPersianLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_BITE),
    ((11 << 9) | MOVE_BITE),
    ((20 << 9) | MOVE_PAY_DAY),
    ((29 << 9) | MOVE_FAINT_ATTACK),
    ((38 << 9) | MOVE_SCREECH),
    ((46 << 9) | MOVE_FURY_SWIPES),
    ((53 << 9) | MOVE_SLASH),
    ((59 << 9) | MOVE_FAKE_OUT),
    0xffff
};

const u16 gPsyduckLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_SPORT),
    ((1 << 9) | MOVE_SCRATCH),
    ((5 << 9) | MOVE_TAIL_WHIP),
    ((10 << 9) | MOVE_DISABLE),
    ((16 << 9) | MOVE_CONFUSION),
    ((23 << 9) | MOVE_SCREECH),
    ((31 << 9) | MOVE_PSYCH_UP),
    ((40 << 9) | MOVE_FURY_SWIPES),
    ((50 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gGolduckLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_SPORT),
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_DISABLE),
    ((5 << 9) | MOVE_TAIL_WHIP),
    ((10 << 9) | MOVE_DISABLE),
    ((16 << 9) | MOVE_CONFUSION),
    ((23 << 9) | MOVE_SCREECH),
    ((31 << 9) | MOVE_PSYCH_UP),
    ((44 << 9) | MOVE_FURY_SWIPES),
    ((58 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gMankeyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_LEER),
    ((9 << 9) | MOVE_LOW_KICK),
    ((15 << 9) | MOVE_KARATE_CHOP),
    ((21 << 9) | MOVE_FURY_SWIPES),
    ((27 << 9) | MOVE_FOCUS_ENERGY),
    ((33 << 9) | MOVE_SEISMIC_TOSS),
    ((39 << 9) | MOVE_CROSS_CHOP),
    ((45 << 9) | MOVE_SCREECH),
    ((51 << 9) | MOVE_THRASH),
    0xffff
};

const u16 gPrimeapeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_LOW_KICK),
    ((1 << 9) | MOVE_RAGE),
    ((9 << 9) | MOVE_LOW_KICK),
    ((15 << 9) | MOVE_KARATE_CHOP),
    ((21 << 9) | MOVE_FURY_SWIPES),
    ((27 << 9) | MOVE_FOCUS_ENERGY),
    ((28 << 9) | MOVE_RAGE),
    ((36 << 9) | MOVE_SEISMIC_TOSS),
    ((45 << 9) | MOVE_CROSS_CHOP),
    ((54 << 9) | MOVE_SCREECH),
    ((63 << 9) | MOVE_THRASH),
    0xffff
};

const u16 gGrowlitheLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_ROAR),
    ((7 << 9) | MOVE_EMBER),
    ((13 << 9) | MOVE_LEER),
    ((19 << 9) | MOVE_ODOR_SLEUTH),
    ((25 << 9) | MOVE_TAKE_DOWN),
    ((31 << 9) | MOVE_FLAME_WHEEL),
    ((37 << 9) | MOVE_HELPING_HAND),
    ((43 << 9) | MOVE_AGILITY),
    ((49 << 9) | MOVE_FLAMETHROWER),
    0xffff
};

const u16 gArcanineLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_ROAR),
    ((1 << 9) | MOVE_EMBER),
    ((1 << 9) | MOVE_ODOR_SLEUTH),
    ((49 << 9) | MOVE_EXTREME_SPEED),
    0xffff
};

const u16 gPoliwagLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((7 << 9) | MOVE_HYPNOSIS),
    ((13 << 9) | MOVE_WATER_GUN),
    ((19 << 9) | MOVE_DOUBLE_SLAP),
    ((25 << 9) | MOVE_RAIN_DANCE),
    ((31 << 9) | MOVE_BODY_SLAM),
    ((37 << 9) | MOVE_BELLY_DRUM),
    ((43 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gPoliwhirlLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((1 << 9) | MOVE_HYPNOSIS),
    ((1 << 9) | MOVE_WATER_GUN),
    ((7 << 9) | MOVE_HYPNOSIS),
    ((13 << 9) | MOVE_WATER_GUN),
    ((19 << 9) | MOVE_DOUBLE_SLAP),
    ((27 << 9) | MOVE_RAIN_DANCE),
    ((35 << 9) | MOVE_BODY_SLAM),
    ((43 << 9) | MOVE_BELLY_DRUM),
    ((51 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gPoliwrathLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_GUN),
    ((1 << 9) | MOVE_HYPNOSIS),
    ((1 << 9) | MOVE_DOUBLE_SLAP),
    ((1 << 9) | MOVE_SUBMISSION),
    ((35 << 9) | MOVE_SUBMISSION),
    ((51 << 9) | MOVE_MIND_READER),
    0xffff
};

const u16 gAbraLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TELEPORT),
    0xffff
};

const u16 gKadabraLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TELEPORT),
    ((1 << 9) | MOVE_KINESIS),
    ((1 << 9) | MOVE_CONFUSION),
    ((16 << 9) | MOVE_CONFUSION),
    ((18 << 9) | MOVE_DISABLE),
    ((21 << 9) | MOVE_PSYBEAM),
    ((23 << 9) | MOVE_REFLECT),
    ((25 << 9) | MOVE_RECOVER),
    ((30 << 9) | MOVE_FUTURE_SIGHT),
    ((33 << 9) | MOVE_ROLE_PLAY),
    ((36 << 9) | MOVE_PSYCHIC),
    ((43 << 9) | MOVE_TRICK),
    0xffff
};

const u16 gAlakazamLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TELEPORT),
    ((1 << 9) | MOVE_KINESIS),
    ((1 << 9) | MOVE_CONFUSION),
    ((16 << 9) | MOVE_CONFUSION),
    ((18 << 9) | MOVE_DISABLE),
    ((21 << 9) | MOVE_PSYBEAM),
    ((23 << 9) | MOVE_REFLECT),
    ((25 << 9) | MOVE_RECOVER),
    ((30 << 9) | MOVE_FUTURE_SIGHT),
    ((33 << 9) | MOVE_CALM_MIND),
    ((36 << 9) | MOVE_PSYCHIC),
    ((43 << 9) | MOVE_TRICK),
    0xffff
};

const u16 gMachopLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LOW_KICK),
    ((1 << 9) | MOVE_LEER),
    ((7 << 9) | MOVE_FOCUS_ENERGY),
    ((13 << 9) | MOVE_KARATE_CHOP),
    ((19 << 9) | MOVE_SEISMIC_TOSS),
    ((22 << 9) | MOVE_FORESIGHT),
    ((25 << 9) | MOVE_REVENGE),
    ((31 << 9) | MOVE_VITAL_THROW),
    ((37 << 9) | MOVE_SUBMISSION),
    ((40 << 9) | MOVE_CROSS_CHOP),
    ((43 << 9) | MOVE_SCARY_FACE),
    ((49 << 9) | MOVE_DYNAMIC_PUNCH),
    0xffff
};

const u16 gMachokeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LOW_KICK),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_FOCUS_ENERGY),
    ((7 << 9) | MOVE_FOCUS_ENERGY),
    ((13 << 9) | MOVE_KARATE_CHOP),
    ((19 << 9) | MOVE_SEISMIC_TOSS),
    ((22 << 9) | MOVE_FORESIGHT),
    ((25 << 9) | MOVE_REVENGE),
    ((33 << 9) | MOVE_VITAL_THROW),
    ((41 << 9) | MOVE_SUBMISSION),
    ((46 << 9) | MOVE_CROSS_CHOP),
    ((51 << 9) | MOVE_SCARY_FACE),
    ((59 << 9) | MOVE_DYNAMIC_PUNCH),
    0xffff
};

const u16 gMachampLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LOW_KICK),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_FOCUS_ENERGY),
    ((7 << 9) | MOVE_FOCUS_ENERGY),
    ((13 << 9) | MOVE_KARATE_CHOP),
    ((19 << 9) | MOVE_SEISMIC_TOSS),
    ((22 << 9) | MOVE_FORESIGHT),
    ((25 << 9) | MOVE_REVENGE),
    ((33 << 9) | MOVE_VITAL_THROW),
    ((41 << 9) | MOVE_SUBMISSION),
    ((46 << 9) | MOVE_CROSS_CHOP),
    ((51 << 9) | MOVE_SCARY_FACE),
    ((59 << 9) | MOVE_DYNAMIC_PUNCH),
    0xffff
};

const u16 gBellsproutLevelUpLearnset[] = {
    ((1 << 9) | MOVE_VINE_WHIP),
    ((6 << 9) | MOVE_GROWTH),
    ((11 << 9) | MOVE_WRAP),
    ((15 << 9) | MOVE_SLEEP_POWDER),
    ((17 << 9) | MOVE_POISON_POWDER),
    ((19 << 9) | MOVE_STUN_SPORE),
    ((23 << 9) | MOVE_ACID),
    ((30 << 9) | MOVE_SWEET_SCENT),
    ((37 << 9) | MOVE_RAZOR_LEAF),
    ((45 << 9) | MOVE_SLAM),
    0xffff
};

const u16 gWeepinbellLevelUpLearnset[] = {
    ((1 << 9) | MOVE_VINE_WHIP),
    ((1 << 9) | MOVE_GROWTH),
    ((1 << 9) | MOVE_WRAP),
    ((6 << 9) | MOVE_GROWTH),
    ((11 << 9) | MOVE_WRAP),
    ((15 << 9) | MOVE_SLEEP_POWDER),
    ((17 << 9) | MOVE_POISON_POWDER),
    ((19 << 9) | MOVE_STUN_SPORE),
    ((24 << 9) | MOVE_ACID),
    ((33 << 9) | MOVE_SWEET_SCENT),
    ((42 << 9) | MOVE_RAZOR_LEAF),
    ((54 << 9) | MOVE_SLAM),
    0xffff
};

const u16 gVictreebelLevelUpLearnset[] = {
    ((1 << 9) | MOVE_VINE_WHIP),
    ((1 << 9) | MOVE_SLEEP_POWDER),
    ((1 << 9) | MOVE_SWEET_SCENT),
    ((1 << 9) | MOVE_RAZOR_LEAF),
    0xffff
};

const u16 gTentacoolLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_STING),
    ((6 << 9) | MOVE_SUPERSONIC),
    ((12 << 9) | MOVE_CONSTRICT),
    ((19 << 9) | MOVE_ACID),
    ((25 << 9) | MOVE_BUBBLE_BEAM),
    ((30 << 9) | MOVE_WRAP),
    ((36 << 9) | MOVE_BARRIER),
    ((43 << 9) | MOVE_SCREECH),
    ((49 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gTentacruelLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_STING),
    ((1 << 9) | MOVE_SUPERSONIC),
    ((1 << 9) | MOVE_CONSTRICT),
    ((6 << 9) | MOVE_SUPERSONIC),
    ((12 << 9) | MOVE_CONSTRICT),
    ((19 << 9) | MOVE_ACID),
    ((25 << 9) | MOVE_BUBBLE_BEAM),
    ((30 << 9) | MOVE_WRAP),
    ((38 << 9) | MOVE_BARRIER),
    ((47 << 9) | MOVE_SCREECH),
    ((55 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gGeodudeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_DEFENSE_CURL),
    ((6 << 9) | MOVE_MUD_SPORT),
    ((11 << 9) | MOVE_ROCK_THROW),
    ((16 << 9) | MOVE_MAGNITUDE),
    ((21 << 9) | MOVE_SELF_DESTRUCT),
    ((26 << 9) | MOVE_ROLLOUT),
    ((31 << 9) | MOVE_ROCK_BLAST),
    ((36 << 9) | MOVE_EARTHQUAKE),
    ((41 << 9) | MOVE_EXPLOSION),
    ((46 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gGravelerLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_DEFENSE_CURL),
    ((1 << 9) | MOVE_MUD_SPORT),
    ((1 << 9) | MOVE_ROCK_THROW),
    ((6 << 9) | MOVE_MUD_SPORT),
    ((11 << 9) | MOVE_ROCK_THROW),
    ((16 << 9) | MOVE_MAGNITUDE),
    ((21 << 9) | MOVE_SELF_DESTRUCT),
    ((29 << 9) | MOVE_ROLLOUT),
    ((37 << 9) | MOVE_ROCK_BLAST),
    ((45 << 9) | MOVE_EARTHQUAKE),
    ((53 << 9) | MOVE_EXPLOSION),
    ((62 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gGolemLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_DEFENSE_CURL),
    ((1 << 9) | MOVE_MUD_SPORT),
    ((1 << 9) | MOVE_ROCK_THROW),
    ((6 << 9) | MOVE_MUD_SPORT),
    ((11 << 9) | MOVE_ROCK_THROW),
    ((16 << 9) | MOVE_MAGNITUDE),
    ((21 << 9) | MOVE_SELF_DESTRUCT),
    ((29 << 9) | MOVE_ROLLOUT),
    ((37 << 9) | MOVE_ROCK_BLAST),
    ((45 << 9) | MOVE_EARTHQUAKE),
    ((53 << 9) | MOVE_EXPLOSION),
    ((62 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gPonytaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((5 << 9) | MOVE_GROWL),
    ((9 << 9) | MOVE_TAIL_WHIP),
    ((14 << 9) | MOVE_EMBER),
    ((19 << 9) | MOVE_STOMP),
    ((25 << 9) | MOVE_FIRE_SPIN),
    ((31 << 9) | MOVE_TAKE_DOWN),
    ((38 << 9) | MOVE_AGILITY),
    ((45 << 9) | MOVE_BOUNCE),
    ((53 << 9) | MOVE_FIRE_BLAST),
    0xffff
};

const u16 gRapidashLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_EMBER),
    ((5 << 9) | MOVE_GROWL),
    ((9 << 9) | MOVE_TAIL_WHIP),
    ((14 << 9) | MOVE_EMBER),
    ((19 << 9) | MOVE_STOMP),
    ((25 << 9) | MOVE_FIRE_SPIN),
    ((31 << 9) | MOVE_TAKE_DOWN),
    ((38 << 9) | MOVE_AGILITY),
    ((40 << 9) | MOVE_FURY_ATTACK),
    ((50 << 9) | MOVE_BOUNCE),
    ((63 << 9) | MOVE_FIRE_BLAST),
    0xffff
};

const u16 gSlowpokeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CURSE),
    ((1 << 9) | MOVE_YAWN),
    ((1 << 9) | MOVE_TACKLE),
    ((6 << 9) | MOVE_GROWL),
    ((15 << 9) | MOVE_WATER_GUN),
    ((20 << 9) | MOVE_CONFUSION),
    ((29 << 9) | MOVE_DISABLE),
    ((34 << 9) | MOVE_HEADBUTT),
    ((43 << 9) | MOVE_AMNESIA),
    ((48 << 9) | MOVE_PSYCHIC),
    0xffff
};

const u16 gSlowbroLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CURSE),
    ((1 << 9) | MOVE_YAWN),
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((6 << 9) | MOVE_GROWL),
    ((15 << 9) | MOVE_WATER_GUN),
    ((20 << 9) | MOVE_CONFUSION),
    ((29 << 9) | MOVE_DISABLE),
    ((34 << 9) | MOVE_HEADBUTT),
    ((37 << 9) | MOVE_WITHDRAW),
    ((46 << 9) | MOVE_AMNESIA),
    ((54 << 9) | MOVE_PSYCHIC),
    0xffff
};

const u16 gMagnemiteLevelUpLearnset[] = {
    ((1 << 9) | MOVE_METAL_SOUND),
    ((1 << 9) | MOVE_TACKLE),
    ((6 << 9) | MOVE_THUNDER_SHOCK),
    ((11 << 9) | MOVE_SUPERSONIC),
    ((16 << 9) | MOVE_SONIC_BOOM),
    ((21 << 9) | MOVE_THUNDER_WAVE),
    ((26 << 9) | MOVE_SPARK),
    ((32 << 9) | MOVE_LOCK_ON),
    ((38 << 9) | MOVE_SWIFT),
    ((44 << 9) | MOVE_SCREECH),
    ((50 << 9) | MOVE_ZAP_CANNON),
    0xffff
};

const u16 gMagnetonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_METAL_SOUND),
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_THUNDER_SHOCK),
    ((1 << 9) | MOVE_SUPERSONIC),
    ((6 << 9) | MOVE_THUNDER_SHOCK),
    ((11 << 9) | MOVE_SUPERSONIC),
    ((16 << 9) | MOVE_SONIC_BOOM),
    ((21 << 9) | MOVE_THUNDER_WAVE),
    ((26 << 9) | MOVE_SPARK),
    ((35 << 9) | MOVE_LOCK_ON),
    ((44 << 9) | MOVE_TRI_ATTACK),
    ((53 << 9) | MOVE_SCREECH),
    ((62 << 9) | MOVE_ZAP_CANNON),
    0xffff
};

const u16 gFarfetchdLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((6 << 9) | MOVE_SAND_ATTACK),
    ((11 << 9) | MOVE_LEER),
    ((16 << 9) | MOVE_FURY_ATTACK),
    ((21 << 9) | MOVE_KNOCK_OFF),
    ((26 << 9) | MOVE_FURY_CUTTER),
    ((31 << 9) | MOVE_SWORDS_DANCE),
    ((36 << 9) | MOVE_AGILITY),
    ((41 << 9) | MOVE_SLASH),
    ((46 << 9) | MOVE_FALSE_SWIPE),
    0xffff
};

const u16 gDoduoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_GROWL),
    ((9 << 9) | MOVE_PURSUIT),
    ((13 << 9) | MOVE_FURY_ATTACK),
    ((21 << 9) | MOVE_TRI_ATTACK),
    ((25 << 9) | MOVE_RAGE),
    ((33 << 9) | MOVE_UPROAR),
    ((37 << 9) | MOVE_DRILL_PECK),
    ((45 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gDodrioLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_PURSUIT),
    ((1 << 9) | MOVE_FURY_ATTACK),
    ((9 << 9) | MOVE_PURSUIT),
    ((13 << 9) | MOVE_FURY_ATTACK),
    ((21 << 9) | MOVE_TRI_ATTACK),
    ((25 << 9) | MOVE_RAGE),
    ((38 << 9) | MOVE_UPROAR),
    ((47 << 9) | MOVE_DRILL_PECK),
    ((60 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gSeelLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HEADBUTT),
    ((9 << 9) | MOVE_GROWL),
    ((17 << 9) | MOVE_ICY_WIND),
    ((21 << 9) | MOVE_AURORA_BEAM),
    ((29 << 9) | MOVE_REST),
    ((37 << 9) | MOVE_TAKE_DOWN),
    ((41 << 9) | MOVE_ICE_BEAM),
    ((49 << 9) | MOVE_SAFEGUARD),
    0xffff
};

const u16 gDewgongLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HEADBUTT),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_ICY_WIND),
    ((1 << 9) | MOVE_AURORA_BEAM),
    ((9 << 9) | MOVE_GROWL),
    ((17 << 9) | MOVE_ICY_WIND),
    ((21 << 9) | MOVE_AURORA_BEAM),
    ((29 << 9) | MOVE_REST),
    ((34 << 9) | MOVE_SHEER_COLD),
    ((42 << 9) | MOVE_TAKE_DOWN),
    ((51 << 9) | MOVE_ICE_BEAM),
    ((64 << 9) | MOVE_SAFEGUARD),
    0xffff
};

const u16 gGrimerLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_GAS),
    ((1 << 9) | MOVE_POUND),
    ((4 << 9) | MOVE_HARDEN),
    ((8 << 9) | MOVE_DISABLE),
    ((13 << 9) | MOVE_SLUDGE),
    ((19 << 9) | MOVE_MINIMIZE),
    ((26 << 9) | MOVE_SCREECH),
    ((34 << 9) | MOVE_ACID_ARMOR),
    ((43 << 9) | MOVE_SLUDGE_BOMB),
    ((53 << 9) | MOVE_MEMENTO),
    0xffff
};

const u16 gMukLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_GAS),
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_HARDEN),
    ((4 << 9) | MOVE_HARDEN),
    ((8 << 9) | MOVE_DISABLE),
    ((13 << 9) | MOVE_SLUDGE),
    ((19 << 9) | MOVE_MINIMIZE),
    ((26 << 9) | MOVE_SCREECH),
    ((34 << 9) | MOVE_ACID_ARMOR),
    ((47 << 9) | MOVE_SLUDGE_BOMB),
    ((61 << 9) | MOVE_MEMENTO),
    0xffff
};

const u16 gShellderLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_WITHDRAW),
    ((9 << 9) | MOVE_SUPERSONIC),
    ((17 << 9) | MOVE_AURORA_BEAM),
    ((25 << 9) | MOVE_PROTECT),
    ((33 << 9) | MOVE_LEER),
    ((41 << 9) | MOVE_CLAMP),
    ((49 << 9) | MOVE_ICE_BEAM),
    0xffff
};

const u16 gCloysterLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WITHDRAW),
    ((1 << 9) | MOVE_SUPERSONIC),
    ((1 << 9) | MOVE_AURORA_BEAM),
    ((1 << 9) | MOVE_PROTECT),
    ((33 << 9) | MOVE_SPIKES),
    ((41 << 9) | MOVE_SPIKE_CANNON),
    0xffff
};

const u16 gGastlyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HYPNOSIS),
    ((1 << 9) | MOVE_LICK),
    ((8 << 9) | MOVE_SPITE),
    ((13 << 9) | MOVE_MEAN_LOOK),
    ((16 << 9) | MOVE_CURSE),
    ((21 << 9) | MOVE_NIGHT_SHADE),
    ((28 << 9) | MOVE_CONFUSE_RAY),
    ((33 << 9) | MOVE_DREAM_EATER),
    ((36 << 9) | MOVE_DESTINY_BOND),
    0xffff
};

const u16 gHaunterLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HYPNOSIS),
    ((1 << 9) | MOVE_LICK),
    ((1 << 9) | MOVE_SPITE),
    ((8 << 9) | MOVE_SPITE),
    ((13 << 9) | MOVE_MEAN_LOOK),
    ((16 << 9) | MOVE_CURSE),
    ((21 << 9) | MOVE_NIGHT_SHADE),
    ((25 << 9) | MOVE_SHADOW_PUNCH),
    ((31 << 9) | MOVE_CONFUSE_RAY),
    ((39 << 9) | MOVE_DREAM_EATER),
    ((48 << 9) | MOVE_DESTINY_BOND),
    0xffff
};

const u16 gGengarLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HYPNOSIS),
    ((1 << 9) | MOVE_LICK),
    ((1 << 9) | MOVE_SPITE),
    ((8 << 9) | MOVE_SPITE),
    ((13 << 9) | MOVE_MEAN_LOOK),
    ((16 << 9) | MOVE_CURSE),
    ((21 << 9) | MOVE_NIGHT_SHADE),
    ((25 << 9) | MOVE_SHADOW_PUNCH),
    ((31 << 9) | MOVE_CONFUSE_RAY),
    ((39 << 9) | MOVE_DREAM_EATER),
    ((48 << 9) | MOVE_DESTINY_BOND),
    0xffff
};

const u16 gOnixLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_SCREECH),
    ((9 << 9) | MOVE_BIND),
    ((13 << 9) | MOVE_ROCK_THROW),
    ((21 << 9) | MOVE_HARDEN),
    ((25 << 9) | MOVE_RAGE),
    ((33 << 9) | MOVE_SANDSTORM),
    ((37 << 9) | MOVE_SLAM),
    ((45 << 9) | MOVE_IRON_TAIL),
    ((49 << 9) | MOVE_SAND_TOMB),
    ((57 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gDrowzeeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_HYPNOSIS),
    ((10 << 9) | MOVE_DISABLE),
    ((18 << 9) | MOVE_CONFUSION),
    ((25 << 9) | MOVE_HEADBUTT),
    ((31 << 9) | MOVE_POISON_GAS),
    ((36 << 9) | MOVE_MEDITATE),
    ((40 << 9) | MOVE_PSYCHIC),
    ((43 << 9) | MOVE_PSYCH_UP),
    ((45 << 9) | MOVE_FUTURE_SIGHT),
    0xffff
};

const u16 gHypnoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_HYPNOSIS),
    ((1 << 9) | MOVE_DISABLE),
    ((1 << 9) | MOVE_CONFUSION),
    ((10 << 9) | MOVE_DISABLE),
    ((18 << 9) | MOVE_CONFUSION),
    ((25 << 9) | MOVE_HEADBUTT),
    ((33 << 9) | MOVE_POISON_GAS),
    ((40 << 9) | MOVE_MEDITATE),
    ((49 << 9) | MOVE_PSYCHIC),
    ((55 << 9) | MOVE_PSYCH_UP),
    ((60 << 9) | MOVE_FUTURE_SIGHT),
    0xffff
};

const u16 gKrabbyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((5 << 9) | MOVE_LEER),
    ((12 << 9) | MOVE_VICE_GRIP),
    ((16 << 9) | MOVE_HARDEN),
    ((23 << 9) | MOVE_MUD_SHOT),
    ((27 << 9) | MOVE_STOMP),
    ((34 << 9) | MOVE_GUILLOTINE),
    ((41 << 9) | MOVE_PROTECT),
    ((45 << 9) | MOVE_CRABHAMMER),
    0xffff
};

const u16 gKinglerLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_VICE_GRIP),
    ((5 << 9) | MOVE_LEER),
    ((12 << 9) | MOVE_VICE_GRIP),
    ((16 << 9) | MOVE_HARDEN),
    ((23 << 9) | MOVE_MUD_SHOT),
    ((27 << 9) | MOVE_STOMP),
    ((38 << 9) | MOVE_GUILLOTINE),
    ((49 << 9) | MOVE_PROTECT),
    ((57 << 9) | MOVE_CRABHAMMER),
    0xffff
};

const u16 gVoltorbLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CHARGE),
    ((1 << 9) | MOVE_TACKLE),
    ((8 << 9) | MOVE_SCREECH),
    ((15 << 9) | MOVE_SONIC_BOOM),
    ((21 << 9) | MOVE_SPARK),
    ((27 << 9) | MOVE_SELF_DESTRUCT),
    ((32 << 9) | MOVE_ROLLOUT),
    ((37 << 9) | MOVE_LIGHT_SCREEN),
    ((42 << 9) | MOVE_SWIFT),
    ((46 << 9) | MOVE_EXPLOSION),
    ((49 << 9) | MOVE_MIRROR_COAT),
    0xffff
};

const u16 gElectrodeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CHARGE),
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_SCREECH),
    ((1 << 9) | MOVE_SONIC_BOOM),
    ((8 << 9) | MOVE_SCREECH),
    ((15 << 9) | MOVE_SONIC_BOOM),
    ((21 << 9) | MOVE_SPARK),
    ((27 << 9) | MOVE_SELF_DESTRUCT),
    ((34 << 9) | MOVE_ROLLOUT),
    ((41 << 9) | MOVE_LIGHT_SCREEN),
    ((48 << 9) | MOVE_SWIFT),
    ((54 << 9) | MOVE_EXPLOSION),
    ((59 << 9) | MOVE_MIRROR_COAT),
    0xffff
};

const u16 gExeggcuteLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BARRAGE),
    ((1 << 9) | MOVE_UPROAR),
    ((1 << 9) | MOVE_HYPNOSIS),
    ((7 << 9) | MOVE_REFLECT),
    ((13 << 9) | MOVE_LEECH_SEED),
    ((19 << 9) | MOVE_CONFUSION),
    ((25 << 9) | MOVE_STUN_SPORE),
    ((31 << 9) | MOVE_POISON_POWDER),
    ((37 << 9) | MOVE_SLEEP_POWDER),
    ((43 << 9) | MOVE_SOLAR_BEAM),
    0xffff
};

const u16 gExeggutorLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BARRAGE),
    ((1 << 9) | MOVE_HYPNOSIS),
    ((1 << 9) | MOVE_CONFUSION),
    ((19 << 9) | MOVE_STOMP),
    ((31 << 9) | MOVE_EGG_BOMB),
    0xffff
};

const u16 gCuboneLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((5 << 9) | MOVE_TAIL_WHIP),
    ((9 << 9) | MOVE_BONE_CLUB),
    ((13 << 9) | MOVE_HEADBUTT),
    ((17 << 9) | MOVE_LEER),
    ((21 << 9) | MOVE_FOCUS_ENERGY),
    ((25 << 9) | MOVE_BONEMERANG),
    ((29 << 9) | MOVE_RAGE),
    ((33 << 9) | MOVE_FALSE_SWIPE),
    ((37 << 9) | MOVE_THRASH),
    ((41 << 9) | MOVE_BONE_RUSH),
    ((45 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gMarowakLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_BONE_CLUB),
    ((1 << 9) | MOVE_HEADBUTT),
    ((5 << 9) | MOVE_TAIL_WHIP),
    ((9 << 9) | MOVE_BONE_CLUB),
    ((13 << 9) | MOVE_HEADBUTT),
    ((17 << 9) | MOVE_LEER),
    ((21 << 9) | MOVE_FOCUS_ENERGY),
    ((25 << 9) | MOVE_BONEMERANG),
    ((32 << 9) | MOVE_RAGE),
    ((39 << 9) | MOVE_FALSE_SWIPE),
    ((46 << 9) | MOVE_THRASH),
    ((53 << 9) | MOVE_BONE_RUSH),
    ((61 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gHitmonleeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_REVENGE),
    ((1 << 9) | MOVE_DOUBLE_KICK),
    ((6 << 9) | MOVE_MEDITATE),
    ((11 << 9) | MOVE_ROLLING_KICK),
    ((16 << 9) | MOVE_JUMP_KICK),
    ((20 << 9) | MOVE_BRICK_BREAK),
    ((21 << 9) | MOVE_FOCUS_ENERGY),
    ((26 << 9) | MOVE_HI_JUMP_KICK),
    ((31 << 9) | MOVE_MIND_READER),
    ((36 << 9) | MOVE_FORESIGHT),
    ((41 << 9) | MOVE_ENDURE),
    ((46 << 9) | MOVE_MEGA_KICK),
    ((51 << 9) | MOVE_REVERSAL),
    0xffff
};

const u16 gHitmonchanLevelUpLearnset[] = {
    ((1 << 9) | MOVE_REVENGE),
    ((1 << 9) | MOVE_COMET_PUNCH),
    ((7 << 9) | MOVE_AGILITY),
    ((13 << 9) | MOVE_PURSUIT),
    ((20 << 9) | MOVE_MACH_PUNCH),
    ((26 << 9) | MOVE_THUNDER_PUNCH),
    ((26 << 9) | MOVE_ICE_PUNCH),
    ((26 << 9) | MOVE_FIRE_PUNCH),
    ((32 << 9) | MOVE_SKY_UPPERCUT),
    ((38 << 9) | MOVE_MEGA_PUNCH),
    ((44 << 9) | MOVE_DETECT),
    ((50 << 9) | MOVE_COUNTER),
    0xffff
};

const u16 gLickitungLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LICK),
    ((7 << 9) | MOVE_SUPERSONIC),
    ((12 << 9) | MOVE_DEFENSE_CURL),
    ((18 << 9) | MOVE_KNOCK_OFF),
    ((23 << 9) | MOVE_STOMP),
    ((29 << 9) | MOVE_WRAP),
    ((34 << 9) | MOVE_DISABLE),
    ((40 << 9) | MOVE_SLAM),
    ((45 << 9) | MOVE_SCREECH),
    ((51 << 9) | MOVE_REFRESH),
    0xffff
};

const u16 gKoffingLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_GAS),
    ((1 << 9) | MOVE_TACKLE),
    ((9 << 9) | MOVE_SMOG),
    ((17 << 9) | MOVE_SELF_DESTRUCT),
    ((21 << 9) | MOVE_SLUDGE),
    ((25 << 9) | MOVE_SMOKESCREEN),
    ((33 << 9) | MOVE_HAZE),
    ((41 << 9) | MOVE_EXPLOSION),
    ((45 << 9) | MOVE_DESTINY_BOND),
    ((49 << 9) | MOVE_MEMENTO),
    0xffff
};

const u16 gWeezingLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_GAS),
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_SMOG),
    ((1 << 9) | MOVE_SELF_DESTRUCT),
    ((9 << 9) | MOVE_SMOG),
    ((17 << 9) | MOVE_SELF_DESTRUCT),
    ((21 << 9) | MOVE_SLUDGE),
    ((25 << 9) | MOVE_SMOKESCREEN),
    ((33 << 9) | MOVE_HAZE),
    ((44 << 9) | MOVE_EXPLOSION),
    ((51 << 9) | MOVE_DESTINY_BOND),
    ((58 << 9) | MOVE_MEMENTO),
    0xffff
};

const u16 gRhyhornLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HORN_ATTACK),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((10 << 9) | MOVE_STOMP),
    ((15 << 9) | MOVE_FURY_ATTACK),
    ((24 << 9) | MOVE_SCARY_FACE),
    ((29 << 9) | MOVE_ROCK_BLAST),
    ((38 << 9) | MOVE_HORN_DRILL),
    ((43 << 9) | MOVE_TAKE_DOWN),
    ((52 << 9) | MOVE_EARTHQUAKE),
    ((57 << 9) | MOVE_MEGAHORN),
    0xffff
};

const u16 gRhydonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HORN_ATTACK),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_STOMP),
    ((1 << 9) | MOVE_FURY_ATTACK),
    ((10 << 9) | MOVE_STOMP),
    ((15 << 9) | MOVE_FURY_ATTACK),
    ((24 << 9) | MOVE_SCARY_FACE),
    ((29 << 9) | MOVE_ROCK_BLAST),
    ((38 << 9) | MOVE_HORN_DRILL),
    ((46 << 9) | MOVE_TAKE_DOWN),
    ((58 << 9) | MOVE_EARTHQUAKE),
    ((66 << 9) | MOVE_MEGAHORN),
    0xffff
};

const u16 gChanseyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_GROWL),
    ((5 << 9) | MOVE_TAIL_WHIP),
    ((9 << 9) | MOVE_REFRESH),
    ((13 << 9) | MOVE_SOFT_BOILED),
    ((17 << 9) | MOVE_DOUBLE_SLAP),
    ((23 << 9) | MOVE_MINIMIZE),
    ((29 << 9) | MOVE_SING),
    ((35 << 9) | MOVE_EGG_BOMB),
    ((41 << 9) | MOVE_DEFENSE_CURL),
    ((49 << 9) | MOVE_LIGHT_SCREEN),
    ((57 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gTangelaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_INGRAIN),
    ((1 << 9) | MOVE_CONSTRICT),
    ((4 << 9) | MOVE_SLEEP_POWDER),
    ((10 << 9) | MOVE_ABSORB),
    ((13 << 9) | MOVE_GROWTH),
    ((19 << 9) | MOVE_POISON_POWDER),
    ((22 << 9) | MOVE_VINE_WHIP),
    ((28 << 9) | MOVE_BIND),
    ((31 << 9) | MOVE_MEGA_DRAIN),
    ((37 << 9) | MOVE_STUN_SPORE),
    ((40 << 9) | MOVE_SLAM),
    ((46 << 9) | MOVE_TICKLE),
    0xffff
};

const u16 gKangaskhanLevelUpLearnset[] = {
    ((1 << 9) | MOVE_COMET_PUNCH),
    ((1 << 9) | MOVE_LEER),
    ((7 << 9) | MOVE_BITE),
    ((13 << 9) | MOVE_TAIL_WHIP),
    ((19 << 9) | MOVE_FAKE_OUT),
    ((25 << 9) | MOVE_MEGA_PUNCH),
    ((31 << 9) | MOVE_RAGE),
    ((37 << 9) | MOVE_ENDURE),
    ((43 << 9) | MOVE_DIZZY_PUNCH),
    ((49 << 9) | MOVE_REVERSAL),
    0xffff
};

const u16 gHorseaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((8 << 9) | MOVE_SMOKESCREEN),
    ((15 << 9) | MOVE_LEER),
    ((22 << 9) | MOVE_WATER_GUN),
    ((29 << 9) | MOVE_TWISTER),
    ((36 << 9) | MOVE_AGILITY),
    ((43 << 9) | MOVE_HYDRO_PUMP),
    ((50 << 9) | MOVE_DRAGON_DANCE),
    0xffff
};

const u16 gSeadraLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((1 << 9) | MOVE_SMOKESCREEN),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_WATER_GUN),
    ((8 << 9) | MOVE_SMOKESCREEN),
    ((15 << 9) | MOVE_LEER),
    ((22 << 9) | MOVE_WATER_GUN),
    ((29 << 9) | MOVE_TWISTER),
    ((40 << 9) | MOVE_AGILITY),
    ((51 << 9) | MOVE_HYDRO_PUMP),
    ((62 << 9) | MOVE_DRAGON_DANCE),
    0xffff
};

const u16 gGoldeenLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_WATER_SPORT),
    ((10 << 9) | MOVE_SUPERSONIC),
    ((15 << 9) | MOVE_HORN_ATTACK),
    ((24 << 9) | MOVE_FLAIL),
    ((29 << 9) | MOVE_FURY_ATTACK),
    ((38 << 9) | MOVE_WATERFALL),
    ((43 << 9) | MOVE_HORN_DRILL),
    ((52 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gSeakingLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_WATER_SPORT),
    ((1 << 9) | MOVE_SUPERSONIC),
    ((10 << 9) | MOVE_SUPERSONIC),
    ((15 << 9) | MOVE_HORN_ATTACK),
    ((24 << 9) | MOVE_FLAIL),
    ((29 << 9) | MOVE_FURY_ATTACK),
    ((41 << 9) | MOVE_WATERFALL),
    ((49 << 9) | MOVE_HORN_DRILL),
    ((61 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gStaryuLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_HARDEN),
    ((6 << 9) | MOVE_WATER_GUN),
    ((10 << 9) | MOVE_RAPID_SPIN),
    ((15 << 9) | MOVE_RECOVER),
    ((19 << 9) | MOVE_CAMOUFLAGE),
    ((24 << 9) | MOVE_SWIFT),
    ((28 << 9) | MOVE_BUBBLE_BEAM),
    ((33 << 9) | MOVE_MINIMIZE),
    ((37 << 9) | MOVE_LIGHT_SCREEN),
    ((42 << 9) | MOVE_COSMIC_POWER),
    ((46 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gStarmieLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_GUN),
    ((1 << 9) | MOVE_RAPID_SPIN),
    ((1 << 9) | MOVE_RECOVER),
    ((1 << 9) | MOVE_SWIFT),
    ((33 << 9) | MOVE_CONFUSE_RAY),
    0xffff
};

const u16 gMrmimeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BARRIER),
    ((5 << 9) | MOVE_CONFUSION),
    ((9 << 9) | MOVE_SUBSTITUTE),
    ((13 << 9) | MOVE_MEDITATE),
    ((17 << 9) | MOVE_DOUBLE_SLAP),
    ((21 << 9) | MOVE_LIGHT_SCREEN),
    ((21 << 9) | MOVE_REFLECT),
    ((25 << 9) | MOVE_ENCORE),
    ((29 << 9) | MOVE_PSYBEAM),
    ((33 << 9) | MOVE_RECYCLE),
    ((37 << 9) | MOVE_TRICK),
    ((41 << 9) | MOVE_ROLE_PLAY),
    ((45 << 9) | MOVE_PSYCHIC),
    ((49 << 9) | MOVE_BATON_PASS),
    ((53 << 9) | MOVE_SAFEGUARD),
    0xffff
};

const u16 gScytherLevelUpLearnset[] = {
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((1 << 9) | MOVE_LEER),
    ((6 << 9) | MOVE_FOCUS_ENERGY),
    ((11 << 9) | MOVE_PURSUIT),
    ((16 << 9) | MOVE_FALSE_SWIPE),
    ((21 << 9) | MOVE_AGILITY),
    ((26 << 9) | MOVE_WING_ATTACK),
    ((31 << 9) | MOVE_SLASH),
    ((36 << 9) | MOVE_SWORDS_DANCE),
    ((41 << 9) | MOVE_DOUBLE_TEAM),
    ((46 << 9) | MOVE_FURY_CUTTER),
    0xffff
};

const u16 gJynxLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_LICK),
    ((1 << 9) | MOVE_LOVELY_KISS),
    ((1 << 9) | MOVE_POWDER_SNOW),
    ((9 << 9) | MOVE_LOVELY_KISS),
    ((13 << 9) | MOVE_POWDER_SNOW),
    ((21 << 9) | MOVE_DOUBLE_SLAP),
    ((25 << 9) | MOVE_ICE_PUNCH),
    ((35 << 9) | MOVE_MEAN_LOOK),
    ((41 << 9) | MOVE_FAKE_TEARS),
    ((51 << 9) | MOVE_BODY_SLAM),
    ((57 << 9) | MOVE_PERISH_SONG),
    ((67 << 9) | MOVE_BLIZZARD),
    0xffff
};

const u16 gElectabuzzLevelUpLearnset[] = {
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_THUNDER_PUNCH),
    ((9 << 9) | MOVE_THUNDER_PUNCH),
    ((17 << 9) | MOVE_LIGHT_SCREEN),
    ((25 << 9) | MOVE_SWIFT),
    ((36 << 9) | MOVE_SCREECH),
    ((47 << 9) | MOVE_THUNDERBOLT),
    ((58 << 9) | MOVE_THUNDER),
    0xffff
};

const u16 gMagmarLevelUpLearnset[] = {
    ((1 << 9) | MOVE_EMBER),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_SMOG),
    ((1 << 9) | MOVE_FIRE_PUNCH),
    ((7 << 9) | MOVE_LEER),
    ((13 << 9) | MOVE_SMOG),
    ((19 << 9) | MOVE_FIRE_PUNCH),
    ((25 << 9) | MOVE_SMOKESCREEN),
    ((33 << 9) | MOVE_SUNNY_DAY),
    ((41 << 9) | MOVE_FLAMETHROWER),
    ((49 << 9) | MOVE_CONFUSE_RAY),
    ((57 << 9) | MOVE_FIRE_BLAST),
    0xffff
};

const u16 gPinsirLevelUpLearnset[] = {
    ((1 << 9) | MOVE_VICE_GRIP),
    ((1 << 9) | MOVE_FOCUS_ENERGY),
    ((7 << 9) | MOVE_BIND),
    ((13 << 9) | MOVE_SEISMIC_TOSS),
    ((19 << 9) | MOVE_HARDEN),
    ((25 << 9) | MOVE_REVENGE),
    ((31 << 9) | MOVE_BRICK_BREAK),
    ((37 << 9) | MOVE_GUILLOTINE),
    ((43 << 9) | MOVE_SUBMISSION),
    ((49 << 9) | MOVE_SWORDS_DANCE),
    0xffff
};

const u16 gTaurosLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((4 << 9) | MOVE_TAIL_WHIP),
    ((8 << 9) | MOVE_RAGE),
    ((13 << 9) | MOVE_HORN_ATTACK),
    ((19 << 9) | MOVE_SCARY_FACE),
    ((26 << 9) | MOVE_PURSUIT),
    ((34 << 9) | MOVE_REST),
    ((43 << 9) | MOVE_THRASH),
    ((53 << 9) | MOVE_TAKE_DOWN),
    0xffff
};

const u16 gMagikarpLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPLASH),
    ((15 << 9) | MOVE_TACKLE),
    ((30 << 9) | MOVE_FLAIL),
    0xffff
};

const u16 gGyaradosLevelUpLearnset[] = {
    ((1 << 9) | MOVE_THRASH),
    ((20 << 9) | MOVE_BITE),
    ((25 << 9) | MOVE_DRAGON_RAGE),
    ((30 << 9) | MOVE_LEER),
    ((35 << 9) | MOVE_TWISTER),
    ((40 << 9) | MOVE_HYDRO_PUMP),
    ((45 << 9) | MOVE_RAIN_DANCE),
    ((50 << 9) | MOVE_DRAGON_DANCE),
    ((55 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gLaprasLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_GUN),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_SING),
    ((7 << 9) | MOVE_MIST),
    ((13 << 9) | MOVE_BODY_SLAM),
    ((19 << 9) | MOVE_CONFUSE_RAY),
    ((25 << 9) | MOVE_PERISH_SONG),
    ((31 << 9) | MOVE_ICE_BEAM),
    ((37 << 9) | MOVE_RAIN_DANCE),
    ((43 << 9) | MOVE_SAFEGUARD),
    ((49 << 9) | MOVE_HYDRO_PUMP),
    ((55 << 9) | MOVE_SHEER_COLD),
    0xffff
};

const u16 gDittoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TRANSFORM),
    0xffff
};

const u16 gEeveeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_HELPING_HAND),
    ((8 << 9) | MOVE_SAND_ATTACK),
    ((16 << 9) | MOVE_GROWL),
    ((23 << 9) | MOVE_QUICK_ATTACK),
    ((30 << 9) | MOVE_BITE),
    ((36 << 9) | MOVE_BATON_PASS),
    ((42 << 9) | MOVE_TAKE_DOWN),
    0xffff
};

const u16 gVaporeonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_HELPING_HAND),
    ((8 << 9) | MOVE_SAND_ATTACK),
    ((16 << 9) | MOVE_WATER_GUN),
    ((23 << 9) | MOVE_QUICK_ATTACK),
    ((30 << 9) | MOVE_BITE),
    ((36 << 9) | MOVE_AURORA_BEAM),
    ((42 << 9) | MOVE_HAZE),
    ((47 << 9) | MOVE_ACID_ARMOR),
    ((52 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gJolteonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_HELPING_HAND),
    ((8 << 9) | MOVE_SAND_ATTACK),
    ((16 << 9) | MOVE_THUNDER_SHOCK),
    ((23 << 9) | MOVE_QUICK_ATTACK),
    ((30 << 9) | MOVE_DOUBLE_KICK),
    ((36 << 9) | MOVE_PIN_MISSILE),
    ((42 << 9) | MOVE_THUNDER_WAVE),
    ((47 << 9) | MOVE_AGILITY),
    ((52 << 9) | MOVE_THUNDER),
    0xffff
};

const u16 gFlareonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_HELPING_HAND),
    ((8 << 9) | MOVE_SAND_ATTACK),
    ((16 << 9) | MOVE_EMBER),
    ((23 << 9) | MOVE_QUICK_ATTACK),
    ((30 << 9) | MOVE_BITE),
    ((36 << 9) | MOVE_FIRE_SPIN),
    ((42 << 9) | MOVE_SMOG),
    ((47 << 9) | MOVE_LEER),
    ((52 << 9) | MOVE_FLAMETHROWER),
    0xffff
};

const u16 gPorygonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CONVERSION_2),
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_CONVERSION),
    ((9 << 9) | MOVE_AGILITY),
    ((12 << 9) | MOVE_PSYBEAM),
    ((20 << 9) | MOVE_RECOVER),
    ((24 << 9) | MOVE_SHARPEN),
    ((32 << 9) | MOVE_LOCK_ON),
    ((36 << 9) | MOVE_TRI_ATTACK),
    ((44 << 9) | MOVE_RECYCLE),
    ((48 << 9) | MOVE_ZAP_CANNON),
    0xffff
};

const u16 gOmanyteLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CONSTRICT),
    ((1 << 9) | MOVE_WITHDRAW),
    ((13 << 9) | MOVE_BITE),
    ((19 << 9) | MOVE_WATER_GUN),
    ((25 << 9) | MOVE_MUD_SHOT),
    ((31 << 9) | MOVE_LEER),
    ((37 << 9) | MOVE_PROTECT),
    ((43 << 9) | MOVE_TICKLE),
    ((49 << 9) | MOVE_ANCIENT_POWER),
    ((55 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gOmastarLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CONSTRICT),
    ((1 << 9) | MOVE_WITHDRAW),
    ((1 << 9) | MOVE_BITE),
    ((13 << 9) | MOVE_BITE),
    ((19 << 9) | MOVE_WATER_GUN),
    ((25 << 9) | MOVE_MUD_SHOT),
    ((31 << 9) | MOVE_LEER),
    ((37 << 9) | MOVE_PROTECT),
    ((40 << 9) | MOVE_SPIKE_CANNON),
    ((46 << 9) | MOVE_TICKLE),
    ((55 << 9) | MOVE_ANCIENT_POWER),
    ((65 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gKabutoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_HARDEN),
    ((13 << 9) | MOVE_ABSORB),
    ((19 << 9) | MOVE_LEER),
    ((25 << 9) | MOVE_MUD_SHOT),
    ((31 << 9) | MOVE_SAND_ATTACK),
    ((37 << 9) | MOVE_ENDURE),
    ((43 << 9) | MOVE_METAL_SOUND),
    ((49 << 9) | MOVE_MEGA_DRAIN),
    ((55 << 9) | MOVE_ANCIENT_POWER),
    0xffff
};

const u16 gKabutopsLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_HARDEN),
    ((1 << 9) | MOVE_ABSORB),
    ((13 << 9) | MOVE_ABSORB),
    ((19 << 9) | MOVE_LEER),
    ((25 << 9) | MOVE_MUD_SHOT),
    ((31 << 9) | MOVE_SAND_ATTACK),
    ((37 << 9) | MOVE_ENDURE),
    ((40 << 9) | MOVE_SLASH),
    ((46 << 9) | MOVE_METAL_SOUND),
    ((55 << 9) | MOVE_MEGA_DRAIN),
    ((65 << 9) | MOVE_ANCIENT_POWER),
    0xffff
};

const u16 gAerodactylLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WING_ATTACK),
    ((8 << 9) | MOVE_AGILITY),
    ((15 << 9) | MOVE_BITE),
    ((22 << 9) | MOVE_SUPERSONIC),
    ((29 << 9) | MOVE_ANCIENT_POWER),
    ((36 << 9) | MOVE_SCARY_FACE),
    ((43 << 9) | MOVE_TAKE_DOWN),
    ((50 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gSnorlaxLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((6 << 9) | MOVE_AMNESIA),
    ((10 << 9) | MOVE_DEFENSE_CURL),
    ((15 << 9) | MOVE_BELLY_DRUM),
    ((19 << 9) | MOVE_HEADBUTT),
    ((24 << 9) | MOVE_YAWN),
    ((28 << 9) | MOVE_REST),
    ((28 << 9) | MOVE_SNORE),
    ((33 << 9) | MOVE_BODY_SLAM),
    ((37 << 9) | MOVE_BLOCK),
    ((42 << 9) | MOVE_COVET),
    ((46 << 9) | MOVE_ROLLOUT),
    ((51 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gArticunoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GUST),
    ((1 << 9) | MOVE_POWDER_SNOW),
    ((13 << 9) | MOVE_MIST),
    ((25 << 9) | MOVE_AGILITY),
    ((37 << 9) | MOVE_MIND_READER),
    ((49 << 9) | MOVE_ICE_BEAM),
    ((61 << 9) | MOVE_REFLECT),
    ((73 << 9) | MOVE_BLIZZARD),
    ((85 << 9) | MOVE_SHEER_COLD),
    0xffff
};

const u16 gZapdosLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_THUNDER_SHOCK),
    ((13 << 9) | MOVE_THUNDER_WAVE),
    ((25 << 9) | MOVE_AGILITY),
    ((37 << 9) | MOVE_DETECT),
    ((49 << 9) | MOVE_DRILL_PECK),
    ((61 << 9) | MOVE_CHARGE),
    ((73 << 9) | MOVE_LIGHT_SCREEN),
    ((85 << 9) | MOVE_THUNDER),
    0xffff
};

const u16 gMoltresLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WING_ATTACK),
    ((1 << 9) | MOVE_EMBER),
    ((13 << 9) | MOVE_FIRE_SPIN),
    ((25 << 9) | MOVE_AGILITY),
    ((37 << 9) | MOVE_ENDURE),
    ((49 << 9) | MOVE_FLAMETHROWER),
    ((61 << 9) | MOVE_SAFEGUARD),
    ((73 << 9) | MOVE_HEAT_WAVE),
    ((85 << 9) | MOVE_SKY_ATTACK),
    0xffff
};

const u16 gDratiniLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WRAP),
    ((1 << 9) | MOVE_LEER),
    ((8 << 9) | MOVE_THUNDER_WAVE),
    ((15 << 9) | MOVE_TWISTER),
    ((22 << 9) | MOVE_DRAGON_RAGE),
    ((29 << 9) | MOVE_SLAM),
    ((36 << 9) | MOVE_AGILITY),
    ((43 << 9) | MOVE_SAFEGUARD),
    ((50 << 9) | MOVE_OUTRAGE),
    ((57 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gDragonairLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WRAP),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_THUNDER_WAVE),
    ((1 << 9) | MOVE_TWISTER),
    ((8 << 9) | MOVE_THUNDER_WAVE),
    ((15 << 9) | MOVE_TWISTER),
    ((22 << 9) | MOVE_DRAGON_RAGE),
    ((29 << 9) | MOVE_SLAM),
    ((38 << 9) | MOVE_AGILITY),
    ((47 << 9) | MOVE_SAFEGUARD),
    ((56 << 9) | MOVE_OUTRAGE),
    ((65 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gDragoniteLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WRAP),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_THUNDER_WAVE),
    ((1 << 9) | MOVE_TWISTER),
    ((8 << 9) | MOVE_THUNDER_WAVE),
    ((15 << 9) | MOVE_TWISTER),
    ((22 << 9) | MOVE_DRAGON_RAGE),
    ((29 << 9) | MOVE_SLAM),
    ((38 << 9) | MOVE_AGILITY),
    ((47 << 9) | MOVE_SAFEGUARD),
    ((55 << 9) | MOVE_WING_ATTACK),
    ((61 << 9) | MOVE_OUTRAGE),
    ((75 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gMewtwoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CONFUSION),
    ((1 << 9) | MOVE_DISABLE),
    ((11 << 9) | MOVE_BARRIER),
    ((22 << 9) | MOVE_SWIFT),
    ((33 << 9) | MOVE_PSYCH_UP),
    ((44 << 9) | MOVE_FUTURE_SIGHT),
    ((55 << 9) | MOVE_MIST),
    ((66 << 9) | MOVE_PSYCHIC),
    ((77 << 9) | MOVE_AMNESIA),
    ((88 << 9) | MOVE_RECOVER),
    ((99 << 9) | MOVE_SAFEGUARD),
    0xffff
};

const u16 gMewLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((10 << 9) | MOVE_TRANSFORM),
    ((20 << 9) | MOVE_MEGA_PUNCH),
    ((30 << 9) | MOVE_METRONOME),
    ((40 << 9) | MOVE_PSYCHIC),
    ((50 << 9) | MOVE_ANCIENT_POWER),
    0xffff
};

const u16 gChikoritaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((8 << 9) | MOVE_RAZOR_LEAF),
    ((12 << 9) | MOVE_REFLECT),
    ((15 << 9) | MOVE_POISON_POWDER),
    ((22 << 9) | MOVE_SYNTHESIS),
    ((29 << 9) | MOVE_BODY_SLAM),
    ((36 << 9) | MOVE_LIGHT_SCREEN),
    ((43 << 9) | MOVE_SAFEGUARD),
    ((50 << 9) | MOVE_SOLAR_BEAM),
    0xffff
};

const u16 gBayleefLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_RAZOR_LEAF),
    ((1 << 9) | MOVE_REFLECT),
    ((8 << 9) | MOVE_RAZOR_LEAF),
    ((12 << 9) | MOVE_REFLECT),
    ((15 << 9) | MOVE_POISON_POWDER),
    ((23 << 9) | MOVE_SYNTHESIS),
    ((31 << 9) | MOVE_BODY_SLAM),
    ((39 << 9) | MOVE_LIGHT_SCREEN),
    ((47 << 9) | MOVE_SAFEGUARD),
    ((55 << 9) | MOVE_SOLAR_BEAM),
    0xffff
};

const u16 gMeganiumLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_RAZOR_LEAF),
    ((1 << 9) | MOVE_REFLECT),
    ((8 << 9) | MOVE_RAZOR_LEAF),
    ((12 << 9) | MOVE_REFLECT),
    ((15 << 9) | MOVE_POISON_POWDER),
    ((23 << 9) | MOVE_SYNTHESIS),
    ((31 << 9) | MOVE_BODY_SLAM),
    ((41 << 9) | MOVE_LIGHT_SCREEN),
    ((51 << 9) | MOVE_SAFEGUARD),
    ((61 << 9) | MOVE_SOLAR_BEAM),
    0xffff
};

const u16 gCyndaquilLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_LEER),
    ((6 << 9) | MOVE_SMOKESCREEN),
    ((12 << 9) | MOVE_EMBER),
    ((19 << 9) | MOVE_QUICK_ATTACK),
    ((27 << 9) | MOVE_FLAME_WHEEL),
    ((36 << 9) | MOVE_SWIFT),
    ((46 << 9) | MOVE_FLAMETHROWER),
    0xffff
};

const u16 gQuilavaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_SMOKESCREEN),
    ((6 << 9) | MOVE_SMOKESCREEN),
    ((12 << 9) | MOVE_EMBER),
    ((21 << 9) | MOVE_QUICK_ATTACK),
    ((31 << 9) | MOVE_FLAME_WHEEL),
    ((42 << 9) | MOVE_SWIFT),
    ((54 << 9) | MOVE_FLAMETHROWER),
    0xffff
};

const u16 gTyphlosionLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_SMOKESCREEN),
    ((1 << 9) | MOVE_EMBER),
    ((6 << 9) | MOVE_SMOKESCREEN),
    ((12 << 9) | MOVE_EMBER),
    ((21 << 9) | MOVE_QUICK_ATTACK),
    ((31 << 9) | MOVE_FLAME_WHEEL),
    ((45 << 9) | MOVE_SWIFT),
    ((60 << 9) | MOVE_FLAMETHROWER),
    0xffff
};

const u16 gTotodileLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_LEER),
    ((7 << 9) | MOVE_RAGE),
    ((13 << 9) | MOVE_WATER_GUN),
    ((20 << 9) | MOVE_BITE),
    ((27 << 9) | MOVE_SCARY_FACE),
    ((35 << 9) | MOVE_SLASH),
    ((43 << 9) | MOVE_SCREECH),
    ((52 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gCroconawLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_RAGE),
    ((7 << 9) | MOVE_RAGE),
    ((13 << 9) | MOVE_WATER_GUN),
    ((21 << 9) | MOVE_BITE),
    ((28 << 9) | MOVE_SCARY_FACE),
    ((37 << 9) | MOVE_SLASH),
    ((45 << 9) | MOVE_SCREECH),
    ((55 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gFeraligatrLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_RAGE),
    ((1 << 9) | MOVE_WATER_GUN),
    ((7 << 9) | MOVE_RAGE),
    ((13 << 9) | MOVE_WATER_GUN),
    ((21 << 9) | MOVE_BITE),
    ((28 << 9) | MOVE_SCARY_FACE),
    ((38 << 9) | MOVE_SLASH),
    ((47 << 9) | MOVE_SCREECH),
    ((58 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gSentretLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((4 << 9) | MOVE_DEFENSE_CURL),
    ((7 << 9) | MOVE_QUICK_ATTACK),
    ((12 << 9) | MOVE_FURY_SWIPES),
    ((17 << 9) | MOVE_HELPING_HAND),
    ((24 << 9) | MOVE_SLAM),
    ((31 << 9) | MOVE_FOLLOW_ME),
    ((40 << 9) | MOVE_REST),
    ((49 << 9) | MOVE_AMNESIA),
    0xffff
};

const u16 gFurretLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_DEFENSE_CURL),
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((4 << 9) | MOVE_DEFENSE_CURL),
    ((7 << 9) | MOVE_QUICK_ATTACK),
    ((12 << 9) | MOVE_FURY_SWIPES),
    ((19 << 9) | MOVE_HELPING_HAND),
    ((28 << 9) | MOVE_SLAM),
    ((37 << 9) | MOVE_FOLLOW_ME),
    ((48 << 9) | MOVE_REST),
    ((59 << 9) | MOVE_AMNESIA),
    0xffff
};

const u16 gHoothootLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((6 << 9) | MOVE_FORESIGHT),
    ((11 << 9) | MOVE_PECK),
    ((16 << 9) | MOVE_HYPNOSIS),
    ((22 << 9) | MOVE_REFLECT),
    ((28 << 9) | MOVE_TAKE_DOWN),
    ((34 << 9) | MOVE_CONFUSION),
    ((48 << 9) | MOVE_DREAM_EATER),
    0xffff
};

const u16 gNoctowlLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_FORESIGHT),
    ((1 << 9) | MOVE_PECK),
    ((6 << 9) | MOVE_FORESIGHT),
    ((11 << 9) | MOVE_PECK),
    ((16 << 9) | MOVE_HYPNOSIS),
    ((25 << 9) | MOVE_REFLECT),
    ((33 << 9) | MOVE_TAKE_DOWN),
    ((41 << 9) | MOVE_CONFUSION),
    ((57 << 9) | MOVE_DREAM_EATER),
    0xffff
};

const u16 gLedybaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((8 << 9) | MOVE_SUPERSONIC),
    ((15 << 9) | MOVE_COMET_PUNCH),
    ((22 << 9) | MOVE_LIGHT_SCREEN),
    ((22 << 9) | MOVE_REFLECT),
    ((22 << 9) | MOVE_SAFEGUARD),
    ((29 << 9) | MOVE_BATON_PASS),
    ((36 << 9) | MOVE_SWIFT),
    ((43 << 9) | MOVE_AGILITY),
    ((50 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gLedianLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_SUPERSONIC),
    ((8 << 9) | MOVE_SUPERSONIC),
    ((15 << 9) | MOVE_COMET_PUNCH),
    ((24 << 9) | MOVE_LIGHT_SCREEN),
    ((24 << 9) | MOVE_REFLECT),
    ((24 << 9) | MOVE_SAFEGUARD),
    ((33 << 9) | MOVE_BATON_PASS),
    ((42 << 9) | MOVE_SWIFT),
    ((51 << 9) | MOVE_AGILITY),
    ((60 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gSpinarakLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_STING),
    ((1 << 9) | MOVE_STRING_SHOT),
    ((6 << 9) | MOVE_SCARY_FACE),
    ((11 << 9) | MOVE_CONSTRICT),
    ((17 << 9) | MOVE_NIGHT_SHADE),
    ((23 << 9) | MOVE_LEECH_LIFE),
    ((30 << 9) | MOVE_FURY_SWIPES),
    ((37 << 9) | MOVE_SPIDER_WEB),
    ((45 << 9) | MOVE_AGILITY),
    ((53 << 9) | MOVE_PSYCHIC),
    0xffff
};

const u16 gAriadosLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_STING),
    ((1 << 9) | MOVE_STRING_SHOT),
    ((1 << 9) | MOVE_SCARY_FACE),
    ((1 << 9) | MOVE_CONSTRICT),
    ((6 << 9) | MOVE_SCARY_FACE),
    ((11 << 9) | MOVE_CONSTRICT),
    ((17 << 9) | MOVE_NIGHT_SHADE),
    ((25 << 9) | MOVE_LEECH_LIFE),
    ((34 << 9) | MOVE_FURY_SWIPES),
    ((43 << 9) | MOVE_SPIDER_WEB),
    ((53 << 9) | MOVE_AGILITY),
    ((63 << 9) | MOVE_PSYCHIC),
    0xffff
};

const u16 gCrobatLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCREECH),
    ((1 << 9) | MOVE_LEECH_LIFE),
    ((1 << 9) | MOVE_SUPERSONIC),
    ((1 << 9) | MOVE_ASTONISH),
    ((6 << 9) | MOVE_SUPERSONIC),
    ((11 << 9) | MOVE_ASTONISH),
    ((16 << 9) | MOVE_BITE),
    ((21 << 9) | MOVE_WING_ATTACK),
    ((28 << 9) | MOVE_CONFUSE_RAY),
    ((35 << 9) | MOVE_AIR_CUTTER),
    ((42 << 9) | MOVE_MEAN_LOOK),
    ((49 << 9) | MOVE_POISON_FANG),
    ((56 << 9) | MOVE_HAZE),
    0xffff
};

const u16 gChinchouLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((1 << 9) | MOVE_THUNDER_WAVE),
    ((5 << 9) | MOVE_SUPERSONIC),
    ((13 << 9) | MOVE_FLAIL),
    ((17 << 9) | MOVE_WATER_GUN),
    ((25 << 9) | MOVE_SPARK),
    ((29 << 9) | MOVE_CONFUSE_RAY),
    ((37 << 9) | MOVE_TAKE_DOWN),
    ((41 << 9) | MOVE_HYDRO_PUMP),
    ((49 << 9) | MOVE_CHARGE),
    0xffff
};

const u16 gLanturnLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((1 << 9) | MOVE_THUNDER_WAVE),
    ((1 << 9) | MOVE_SUPERSONIC),
    ((5 << 9) | MOVE_SUPERSONIC),
    ((13 << 9) | MOVE_FLAIL),
    ((17 << 9) | MOVE_WATER_GUN),
    ((25 << 9) | MOVE_SPARK),
    ((32 << 9) | MOVE_CONFUSE_RAY),
    ((43 << 9) | MOVE_TAKE_DOWN),
    ((50 << 9) | MOVE_HYDRO_PUMP),
    ((61 << 9) | MOVE_CHARGE),
    0xffff
};

const u16 gPichuLevelUpLearnset[] = {
    ((1 << 9) | MOVE_THUNDER_SHOCK),
    ((1 << 9) | MOVE_CHARM),
    ((6 << 9) | MOVE_TAIL_WHIP),
    ((8 << 9) | MOVE_THUNDER_WAVE),
    ((11 << 9) | MOVE_SWEET_KISS),
    0xffff
};

const u16 gCleffaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_CHARM),
    ((4 << 9) | MOVE_ENCORE),
    ((8 << 9) | MOVE_SING),
    ((13 << 9) | MOVE_SWEET_KISS),
    0xffff
};

const u16 gIgglybuffLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SING),
    ((1 << 9) | MOVE_CHARM),
    ((4 << 9) | MOVE_DEFENSE_CURL),
    ((9 << 9) | MOVE_POUND),
    ((14 << 9) | MOVE_SWEET_KISS),
    0xffff
};

const u16 gTogepiLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_CHARM),
    ((6 << 9) | MOVE_METRONOME),
    ((11 << 9) | MOVE_SWEET_KISS),
    ((16 << 9) | MOVE_YAWN),
    ((21 << 9) | MOVE_ENCORE),
    ((26 << 9) | MOVE_FOLLOW_ME),
    ((31 << 9) | MOVE_WISH),
    ((36 << 9) | MOVE_SAFEGUARD),
    ((41 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gTogeticLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_CHARM),
    ((6 << 9) | MOVE_METRONOME),
    ((11 << 9) | MOVE_SWEET_KISS),
    ((16 << 9) | MOVE_YAWN),
    ((21 << 9) | MOVE_ENCORE),
    ((26 << 9) | MOVE_FOLLOW_ME),
    ((31 << 9) | MOVE_WISH),
    ((36 << 9) | MOVE_SAFEGUARD),
    ((41 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gNatuLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_LEER),
    ((10 << 9) | MOVE_NIGHT_SHADE),
    ((20 << 9) | MOVE_TELEPORT),
    ((30 << 9) | MOVE_WISH),
    ((30 << 9) | MOVE_FUTURE_SIGHT),
    ((40 << 9) | MOVE_CONFUSE_RAY),
    ((50 << 9) | MOVE_PSYCHIC),
    0xffff
};

const u16 gXatuLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_LEER),
    ((10 << 9) | MOVE_NIGHT_SHADE),
    ((20 << 9) | MOVE_TELEPORT),
    ((35 << 9) | MOVE_WISH),
    ((35 << 9) | MOVE_FUTURE_SIGHT),
    ((50 << 9) | MOVE_CONFUSE_RAY),
    ((65 << 9) | MOVE_PSYCHIC),
    0xffff
};

const u16 gMareepLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((9 << 9) | MOVE_THUNDER_SHOCK),
    ((16 << 9) | MOVE_THUNDER_WAVE),
    ((23 << 9) | MOVE_COTTON_SPORE),
    ((30 << 9) | MOVE_LIGHT_SCREEN),
    ((37 << 9) | MOVE_THUNDER),
    0xffff
};

const u16 gFlaaffyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_THUNDER_SHOCK),
    ((9 << 9) | MOVE_THUNDER_SHOCK),
    ((18 << 9) | MOVE_THUNDER_WAVE),
    ((27 << 9) | MOVE_COTTON_SPORE),
    ((36 << 9) | MOVE_LIGHT_SCREEN),
    ((45 << 9) | MOVE_THUNDER),
    0xffff
};

const u16 gAmpharosLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_THUNDER_SHOCK),
    ((1 << 9) | MOVE_THUNDER_WAVE),
    ((9 << 9) | MOVE_THUNDER_SHOCK),
    ((18 << 9) | MOVE_THUNDER_WAVE),
    ((27 << 9) | MOVE_COTTON_SPORE),
    ((30 << 9) | MOVE_THUNDER_PUNCH),
    ((42 << 9) | MOVE_LIGHT_SCREEN),
    ((57 << 9) | MOVE_THUNDER),
    0xffff
};

const u16 gBellossomLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ABSORB),
    ((1 << 9) | MOVE_SWEET_SCENT),
    ((1 << 9) | MOVE_STUN_SPORE),
    ((1 << 9) | MOVE_MAGICAL_LEAF),
    ((44 << 9) | MOVE_PETAL_DANCE),
    ((55 << 9) | MOVE_SOLAR_BEAM),
    0xffff
};

const u16 gMarillLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((3 << 9) | MOVE_DEFENSE_CURL),
    ((6 << 9) | MOVE_TAIL_WHIP),
    ((10 << 9) | MOVE_WATER_GUN),
    ((15 << 9) | MOVE_ROLLOUT),
    ((21 << 9) | MOVE_BUBBLE_BEAM),
    ((28 << 9) | MOVE_DOUBLE_EDGE),
    ((36 << 9) | MOVE_RAIN_DANCE),
    ((45 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gAzumarillLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_DEFENSE_CURL),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_WATER_GUN),
    ((3 << 9) | MOVE_DEFENSE_CURL),
    ((6 << 9) | MOVE_TAIL_WHIP),
    ((10 << 9) | MOVE_WATER_GUN),
    ((15 << 9) | MOVE_ROLLOUT),
    ((24 << 9) | MOVE_BUBBLE_BEAM),
    ((34 << 9) | MOVE_DOUBLE_EDGE),
    ((45 << 9) | MOVE_RAIN_DANCE),
    ((57 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gSudowoodoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ROCK_THROW),
    ((1 << 9) | MOVE_MIMIC),
    ((9 << 9) | MOVE_FLAIL),
    ((17 << 9) | MOVE_LOW_KICK),
    ((25 << 9) | MOVE_ROCK_SLIDE),
    ((33 << 9) | MOVE_BLOCK),
    ((41 << 9) | MOVE_FAINT_ATTACK),
    ((49 << 9) | MOVE_SLAM),
    ((57 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gPolitoedLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_GUN),
    ((1 << 9) | MOVE_HYPNOSIS),
    ((1 << 9) | MOVE_DOUBLE_SLAP),
    ((1 << 9) | MOVE_PERISH_SONG),
    ((35 << 9) | MOVE_PERISH_SONG),
    ((51 << 9) | MOVE_SWAGGER),
    0xffff
};

const u16 gHoppipLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPLASH),
    ((5 << 9) | MOVE_SYNTHESIS),
    ((5 << 9) | MOVE_TAIL_WHIP),
    ((10 << 9) | MOVE_TACKLE),
    ((13 << 9) | MOVE_POISON_POWDER),
    ((15 << 9) | MOVE_STUN_SPORE),
    ((17 << 9) | MOVE_SLEEP_POWDER),
    ((20 << 9) | MOVE_LEECH_SEED),
    ((25 << 9) | MOVE_COTTON_SPORE),
    ((30 << 9) | MOVE_MEGA_DRAIN),
    0xffff
};

const u16 gSkiploomLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPLASH),
    ((1 << 9) | MOVE_SYNTHESIS),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_TACKLE),
    ((5 << 9) | MOVE_SYNTHESIS),
    ((5 << 9) | MOVE_TAIL_WHIP),
    ((10 << 9) | MOVE_TACKLE),
    ((13 << 9) | MOVE_POISON_POWDER),
    ((15 << 9) | MOVE_STUN_SPORE),
    ((17 << 9) | MOVE_SLEEP_POWDER),
    ((22 << 9) | MOVE_LEECH_SEED),
    ((29 << 9) | MOVE_COTTON_SPORE),
    ((36 << 9) | MOVE_MEGA_DRAIN),
    0xffff
};

const u16 gJumpluffLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPLASH),
    ((1 << 9) | MOVE_SYNTHESIS),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_TACKLE),
    ((5 << 9) | MOVE_SYNTHESIS),
    ((5 << 9) | MOVE_TAIL_WHIP),
    ((10 << 9) | MOVE_TACKLE),
    ((13 << 9) | MOVE_POISON_POWDER),
    ((15 << 9) | MOVE_STUN_SPORE),
    ((17 << 9) | MOVE_SLEEP_POWDER),
    ((22 << 9) | MOVE_LEECH_SEED),
    ((33 << 9) | MOVE_COTTON_SPORE),
    ((44 << 9) | MOVE_MEGA_DRAIN),
    0xffff
};

const u16 gAipomLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((6 << 9) | MOVE_SAND_ATTACK),
    ((13 << 9) | MOVE_ASTONISH),
    ((18 << 9) | MOVE_BATON_PASS),
    ((25 << 9) | MOVE_TICKLE),
    ((31 << 9) | MOVE_FURY_SWIPES),
    ((38 << 9) | MOVE_SWIFT),
    ((43 << 9) | MOVE_SCREECH),
    ((50 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gSunkernLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ABSORB),
    ((6 << 9) | MOVE_GROWTH),
    ((13 << 9) | MOVE_MEGA_DRAIN),
    ((18 << 9) | MOVE_INGRAIN),
    ((25 << 9) | MOVE_ENDEAVOR),
    ((30 << 9) | MOVE_SUNNY_DAY),
    ((37 << 9) | MOVE_SYNTHESIS),
    ((42 << 9) | MOVE_GIGA_DRAIN),
    0xffff
};

const u16 gSunfloraLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ABSORB),
    ((1 << 9) | MOVE_POUND),
    ((6 << 9) | MOVE_GROWTH),
    ((13 << 9) | MOVE_RAZOR_LEAF),
    ((18 << 9) | MOVE_INGRAIN),
    ((25 << 9) | MOVE_BULLET_SEED),
    ((30 << 9) | MOVE_SUNNY_DAY),
    ((37 << 9) | MOVE_PETAL_DANCE),
    ((42 << 9) | MOVE_SOLAR_BEAM),
    0xffff
};

const u16 gYanmaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_FORESIGHT),
    ((7 << 9) | MOVE_QUICK_ATTACK),
    ((13 << 9) | MOVE_DOUBLE_TEAM),
    ((19 << 9) | MOVE_SONIC_BOOM),
    ((25 << 9) | MOVE_DETECT),
    ((31 << 9) | MOVE_SUPERSONIC),
    ((37 << 9) | MOVE_UPROAR),
    ((43 << 9) | MOVE_WING_ATTACK),
    ((49 << 9) | MOVE_SCREECH),
    0xffff
};

const u16 gWooperLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_GUN),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((11 << 9) | MOVE_SLAM),
    ((16 << 9) | MOVE_MUD_SHOT),
    ((21 << 9) | MOVE_AMNESIA),
    ((31 << 9) | MOVE_YAWN),
    ((36 << 9) | MOVE_EARTHQUAKE),
    ((41 << 9) | MOVE_RAIN_DANCE),
    ((51 << 9) | MOVE_MIST),
    ((51 << 9) | MOVE_HAZE),
    0xffff
};

const u16 gQuagsireLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_GUN),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((11 << 9) | MOVE_SLAM),
    ((16 << 9) | MOVE_MUD_SHOT),
    ((23 << 9) | MOVE_AMNESIA),
    ((35 << 9) | MOVE_YAWN),
    ((42 << 9) | MOVE_EARTHQUAKE),
    ((49 << 9) | MOVE_RAIN_DANCE),
    ((61 << 9) | MOVE_MIST),
    ((61 << 9) | MOVE_HAZE),
    0xffff
};

const u16 gEspeonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_HELPING_HAND),
    ((8 << 9) | MOVE_SAND_ATTACK),
    ((16 << 9) | MOVE_CONFUSION),
    ((23 << 9) | MOVE_QUICK_ATTACK),
    ((30 << 9) | MOVE_SWIFT),
    ((36 << 9) | MOVE_PSYBEAM),
    ((42 << 9) | MOVE_PSYCH_UP),
    ((47 << 9) | MOVE_PSYCHIC),
    ((52 << 9) | MOVE_MORNING_SUN),
    0xffff
};

const u16 gUmbreonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_HELPING_HAND),
    ((8 << 9) | MOVE_SAND_ATTACK),
    ((16 << 9) | MOVE_PURSUIT),
    ((23 << 9) | MOVE_QUICK_ATTACK),
    ((30 << 9) | MOVE_CONFUSE_RAY),
    ((36 << 9) | MOVE_FAINT_ATTACK),
    ((42 << 9) | MOVE_MEAN_LOOK),
    ((47 << 9) | MOVE_SCREECH),
    ((52 << 9) | MOVE_MOONLIGHT),
    0xffff
};

const u16 gMurkrowLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((9 << 9) | MOVE_ASTONISH),
    ((14 << 9) | MOVE_PURSUIT),
    ((22 << 9) | MOVE_HAZE),
    ((27 << 9) | MOVE_NIGHT_SHADE),
    ((35 << 9) | MOVE_FAINT_ATTACK),
    ((40 << 9) | MOVE_TAUNT),
    ((48 << 9) | MOVE_MEAN_LOOK),
    0xffff
};

const u16 gSlowkingLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CURSE),
    ((1 << 9) | MOVE_YAWN),
    ((1 << 9) | MOVE_TACKLE),
    ((6 << 9) | MOVE_GROWL),
    ((15 << 9) | MOVE_WATER_GUN),
    ((20 << 9) | MOVE_CONFUSION),
    ((29 << 9) | MOVE_DISABLE),
    ((34 << 9) | MOVE_HEADBUTT),
    ((43 << 9) | MOVE_SWAGGER),
    ((48 << 9) | MOVE_PSYCHIC),
    0xffff
};

const u16 gMisdreavusLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_PSYWAVE),
    ((6 << 9) | MOVE_SPITE),
    ((11 << 9) | MOVE_ASTONISH),
    ((17 << 9) | MOVE_CONFUSE_RAY),
    ((23 << 9) | MOVE_MEAN_LOOK),
    ((30 << 9) | MOVE_PSYBEAM),
    ((37 << 9) | MOVE_PAIN_SPLIT),
    ((45 << 9) | MOVE_PERISH_SONG),
    ((53 << 9) | MOVE_GRUDGE),
    0xffff
};

const u16 gUnownLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HIDDEN_POWER),
    0xffff
};

const u16 gWobbuffetLevelUpLearnset[] = {
    ((1 << 9) | MOVE_COUNTER),
    ((1 << 9) | MOVE_MIRROR_COAT),
    ((1 << 9) | MOVE_SAFEGUARD),
    ((1 << 9) | MOVE_DESTINY_BOND),
    0xffff
};

const u16 gGirafarigLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((7 << 9) | MOVE_ASTONISH),
    ((13 << 9) | MOVE_CONFUSION),
    ((19 << 9) | MOVE_STOMP),
    ((25 << 9) | MOVE_ODOR_SLEUTH),
    ((31 << 9) | MOVE_AGILITY),
    ((37 << 9) | MOVE_BATON_PASS),
    ((43 << 9) | MOVE_PSYBEAM),
    ((49 << 9) | MOVE_CRUNCH),
    0xffff
};

const u16 gPinecoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_PROTECT),
    ((8 << 9) | MOVE_SELF_DESTRUCT),
    ((15 << 9) | MOVE_TAKE_DOWN),
    ((22 << 9) | MOVE_RAPID_SPIN),
    ((29 << 9) | MOVE_BIDE),
    ((36 << 9) | MOVE_EXPLOSION),
    ((43 << 9) | MOVE_SPIKES),
    ((50 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gForretressLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_PROTECT),
    ((1 << 9) | MOVE_SELF_DESTRUCT),
    ((8 << 9) | MOVE_SELF_DESTRUCT),
    ((15 << 9) | MOVE_TAKE_DOWN),
    ((22 << 9) | MOVE_RAPID_SPIN),
    ((29 << 9) | MOVE_BIDE),
    ((39 << 9) | MOVE_EXPLOSION),
    ((49 << 9) | MOVE_SPIKES),
    ((59 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gDunsparceLevelUpLearnset[] = {
    ((1 << 9) | MOVE_RAGE),
    ((4 << 9) | MOVE_DEFENSE_CURL),
    ((11 << 9) | MOVE_YAWN),
    ((14 << 9) | MOVE_GLARE),
    ((21 << 9) | MOVE_SPITE),
    ((24 << 9) | MOVE_PURSUIT),
    ((31 << 9) | MOVE_SCREECH),
    ((34 << 9) | MOVE_TAKE_DOWN),
    ((41 << 9) | MOVE_ENDEAVOR),
    0xffff
};

const u16 gGligarLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_STING),
    ((6 << 9) | MOVE_SAND_ATTACK),
    ((13 << 9) | MOVE_HARDEN),
    ((20 << 9) | MOVE_QUICK_ATTACK),
    ((28 << 9) | MOVE_FAINT_ATTACK),
    ((36 << 9) | MOVE_SLASH),
    ((44 << 9) | MOVE_SCREECH),
    ((52 << 9) | MOVE_GUILLOTINE),
    0xffff
};

const u16 gSteelixLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_SCREECH),
    ((9 << 9) | MOVE_BIND),
    ((13 << 9) | MOVE_ROCK_THROW),
    ((21 << 9) | MOVE_HARDEN),
    ((25 << 9) | MOVE_RAGE),
    ((33 << 9) | MOVE_SANDSTORM),
    ((37 << 9) | MOVE_SLAM),
    ((45 << 9) | MOVE_IRON_TAIL),
    ((49 << 9) | MOVE_CRUNCH),
    ((57 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gSnubbullLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_SCARY_FACE),
    ((4 << 9) | MOVE_TAIL_WHIP),
    ((8 << 9) | MOVE_CHARM),
    ((13 << 9) | MOVE_BITE),
    ((19 << 9) | MOVE_LICK),
    ((26 << 9) | MOVE_ROAR),
    ((34 << 9) | MOVE_RAGE),
    ((43 << 9) | MOVE_TAKE_DOWN),
    ((53 << 9) | MOVE_CRUNCH),
    0xffff
};

const u16 gGranbullLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_SCARY_FACE),
    ((4 << 9) | MOVE_TAIL_WHIP),
    ((8 << 9) | MOVE_CHARM),
    ((13 << 9) | MOVE_BITE),
    ((19 << 9) | MOVE_LICK),
    ((28 << 9) | MOVE_ROAR),
    ((38 << 9) | MOVE_RAGE),
    ((49 << 9) | MOVE_TAKE_DOWN),
    ((61 << 9) | MOVE_CRUNCH),
    0xffff
};

const u16 gQwilfishLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPIKES),
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_POISON_STING),
    ((10 << 9) | MOVE_HARDEN),
    ((10 << 9) | MOVE_MINIMIZE),
    ((19 << 9) | MOVE_WATER_GUN),
    ((28 << 9) | MOVE_PIN_MISSILE),
    ((37 << 9) | MOVE_TAKE_DOWN),
    ((46 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gScizorLevelUpLearnset[] = {
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((1 << 9) | MOVE_LEER),
    ((6 << 9) | MOVE_FOCUS_ENERGY),
    ((11 << 9) | MOVE_PURSUIT),
    ((16 << 9) | MOVE_FALSE_SWIPE),
    ((21 << 9) | MOVE_AGILITY),
    ((26 << 9) | MOVE_METAL_CLAW),
    ((31 << 9) | MOVE_SLASH),
    ((36 << 9) | MOVE_SWORDS_DANCE),
    ((41 << 9) | MOVE_DOUBLE_TEAM),
    ((46 << 9) | MOVE_FURY_CUTTER),
    0xffff
};

const u16 gShuckleLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CONSTRICT),
    ((1 << 9) | MOVE_WITHDRAW),
    ((9 << 9) | MOVE_WRAP),
    ((14 << 9) | MOVE_ENCORE),
    ((23 << 9) | MOVE_SAFEGUARD),
    ((28 << 9) | MOVE_BIDE),
    ((37 << 9) | MOVE_REST),
    0xffff
};

const u16 gHeracrossLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_LEER),
    ((6 << 9) | MOVE_HORN_ATTACK),
    ((11 << 9) | MOVE_ENDURE),
    ((17 << 9) | MOVE_FURY_ATTACK),
    ((23 << 9) | MOVE_BRICK_BREAK),
    ((30 << 9) | MOVE_COUNTER),
    ((37 << 9) | MOVE_TAKE_DOWN),
    ((45 << 9) | MOVE_REVERSAL),
    ((53 << 9) | MOVE_MEGAHORN),
    0xffff
};

const u16 gSneaselLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_TAUNT),
    ((8 << 9) | MOVE_QUICK_ATTACK),
    ((15 << 9) | MOVE_SCREECH),
    ((22 << 9) | MOVE_FAINT_ATTACK),
    ((29 << 9) | MOVE_FURY_SWIPES),
    ((36 << 9) | MOVE_AGILITY),
    ((43 << 9) | MOVE_ICY_WIND),
    ((50 << 9) | MOVE_SLASH),
    ((57 << 9) | MOVE_BEAT_UP),
    ((64 << 9) | MOVE_METAL_CLAW),
    0xffff
};

const u16 gTeddiursaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_LEER),
    ((7 << 9) | MOVE_LICK),
    ((13 << 9) | MOVE_FURY_SWIPES),
    ((19 << 9) | MOVE_FAKE_TEARS),
    ((25 << 9) | MOVE_FAINT_ATTACK),
    ((31 << 9) | MOVE_REST),
    ((37 << 9) | MOVE_SLASH),
    ((43 << 9) | MOVE_SNORE),
    ((49 << 9) | MOVE_THRASH),
    0xffff
};

const u16 gUrsaringLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_LICK),
    ((1 << 9) | MOVE_FURY_SWIPES),
    ((7 << 9) | MOVE_LICK),
    ((13 << 9) | MOVE_FURY_SWIPES),
    ((19 << 9) | MOVE_FAKE_TEARS),
    ((25 << 9) | MOVE_FAINT_ATTACK),
    ((31 << 9) | MOVE_REST),
    ((37 << 9) | MOVE_SLASH),
    ((43 << 9) | MOVE_SNORE),
    ((49 << 9) | MOVE_THRASH),
    0xffff
};

const u16 gSlugmaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_YAWN),
    ((1 << 9) | MOVE_SMOG),
    ((8 << 9) | MOVE_EMBER),
    ((15 << 9) | MOVE_ROCK_THROW),
    ((22 << 9) | MOVE_HARDEN),
    ((29 << 9) | MOVE_AMNESIA),
    ((36 << 9) | MOVE_FLAMETHROWER),
    ((43 << 9) | MOVE_ROCK_SLIDE),
    ((50 << 9) | MOVE_BODY_SLAM),
    0xffff
};

const u16 gMagcargoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_YAWN),
    ((1 << 9) | MOVE_SMOG),
    ((1 << 9) | MOVE_EMBER),
    ((1 << 9) | MOVE_ROCK_THROW),
    ((8 << 9) | MOVE_EMBER),
    ((15 << 9) | MOVE_ROCK_THROW),
    ((22 << 9) | MOVE_HARDEN),
    ((29 << 9) | MOVE_AMNESIA),
    ((36 << 9) | MOVE_FLAMETHROWER),
    ((48 << 9) | MOVE_ROCK_SLIDE),
    ((60 << 9) | MOVE_BODY_SLAM),
    0xffff
};

const u16 gSwinubLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_ODOR_SLEUTH),
    ((10 << 9) | MOVE_POWDER_SNOW),
    ((19 << 9) | MOVE_ENDURE),
    ((28 << 9) | MOVE_TAKE_DOWN),
    ((37 << 9) | MOVE_MIST),
    ((46 << 9) | MOVE_BLIZZARD),
    ((55 << 9) | MOVE_AMNESIA),
    0xffff
};

const u16 gPiloswineLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HORN_ATTACK),
    ((1 << 9) | MOVE_ODOR_SLEUTH),
    ((1 << 9) | MOVE_POWDER_SNOW),
    ((1 << 9) | MOVE_ENDURE),
    ((10 << 9) | MOVE_POWDER_SNOW),
    ((19 << 9) | MOVE_ENDURE),
    ((28 << 9) | MOVE_TAKE_DOWN),
    ((33 << 9) | MOVE_FURY_ATTACK),
    ((42 << 9) | MOVE_MIST),
    ((56 << 9) | MOVE_BLIZZARD),
    ((70 << 9) | MOVE_AMNESIA),
    0xffff
};

const u16 gCorsolaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((6 << 9) | MOVE_HARDEN),
    ((12 << 9) | MOVE_BUBBLE),
    ((17 << 9) | MOVE_RECOVER),
    ((17 << 9) | MOVE_REFRESH),
    ((23 << 9) | MOVE_BUBBLE_BEAM),
    ((28 << 9) | MOVE_SPIKE_CANNON),
    ((34 << 9) | MOVE_ROCK_BLAST),
    ((39 << 9) | MOVE_MIRROR_COAT),
    ((45 << 9) | MOVE_ANCIENT_POWER),
    0xffff
};

const u16 gRemoraidLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_GUN),
    ((11 << 9) | MOVE_LOCK_ON),
    ((22 << 9) | MOVE_PSYBEAM),
    ((22 << 9) | MOVE_AURORA_BEAM),
    ((22 << 9) | MOVE_BUBBLE_BEAM),
    ((33 << 9) | MOVE_FOCUS_ENERGY),
    ((44 << 9) | MOVE_ICE_BEAM),
    ((55 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gOctilleryLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_GUN),
    ((11 << 9) | MOVE_CONSTRICT),
    ((22 << 9) | MOVE_PSYBEAM),
    ((22 << 9) | MOVE_AURORA_BEAM),
    ((22 << 9) | MOVE_BUBBLE_BEAM),
    ((25 << 9) | MOVE_OCTAZOOKA),
    ((38 << 9) | MOVE_FOCUS_ENERGY),
    ((54 << 9) | MOVE_ICE_BEAM),
    ((70 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gDelibirdLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PRESENT),
    0xffff
};

const u16 gMantineLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_BUBBLE),
    ((8 << 9) | MOVE_SUPERSONIC),
    ((15 << 9) | MOVE_BUBBLE_BEAM),
    ((22 << 9) | MOVE_TAKE_DOWN),
    ((29 << 9) | MOVE_AGILITY),
    ((36 << 9) | MOVE_WING_ATTACK),
    ((43 << 9) | MOVE_WATER_PULSE),
    ((50 << 9) | MOVE_CONFUSE_RAY),
    0xffff
};

const u16 gSkarmoryLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_PECK),
    ((10 << 9) | MOVE_SAND_ATTACK),
    ((13 << 9) | MOVE_SWIFT),
    ((16 << 9) | MOVE_AGILITY),
    ((26 << 9) | MOVE_FURY_ATTACK),
    ((29 << 9) | MOVE_AIR_CUTTER),
    ((32 << 9) | MOVE_STEEL_WING),
    ((42 << 9) | MOVE_SPIKES),
    ((45 << 9) | MOVE_METAL_SOUND),
    0xffff
};

const u16 gHoundourLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_EMBER),
    ((7 << 9) | MOVE_HOWL),
    ((13 << 9) | MOVE_SMOG),
    ((19 << 9) | MOVE_ROAR),
    ((25 << 9) | MOVE_BITE),
    ((31 << 9) | MOVE_ODOR_SLEUTH),
    ((37 << 9) | MOVE_FAINT_ATTACK),
    ((43 << 9) | MOVE_FLAMETHROWER),
    ((49 << 9) | MOVE_CRUNCH),
    0xffff
};

const u16 gHoundoomLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_EMBER),
    ((1 << 9) | MOVE_HOWL),
    ((7 << 9) | MOVE_HOWL),
    ((13 << 9) | MOVE_SMOG),
    ((19 << 9) | MOVE_ROAR),
    ((27 << 9) | MOVE_BITE),
    ((35 << 9) | MOVE_ODOR_SLEUTH),
    ((43 << 9) | MOVE_FAINT_ATTACK),
    ((51 << 9) | MOVE_FLAMETHROWER),
    ((59 << 9) | MOVE_CRUNCH),
    0xffff
};

const u16 gKingdraLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((1 << 9) | MOVE_SMOKESCREEN),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_WATER_GUN),
    ((8 << 9) | MOVE_SMOKESCREEN),
    ((15 << 9) | MOVE_LEER),
    ((22 << 9) | MOVE_WATER_GUN),
    ((29 << 9) | MOVE_TWISTER),
    ((40 << 9) | MOVE_AGILITY),
    ((51 << 9) | MOVE_HYDRO_PUMP),
    ((62 << 9) | MOVE_DRAGON_DANCE),
    0xffff
};

const u16 gPhanpyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ODOR_SLEUTH),
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((9 << 9) | MOVE_DEFENSE_CURL),
    ((17 << 9) | MOVE_FLAIL),
    ((25 << 9) | MOVE_TAKE_DOWN),
    ((33 << 9) | MOVE_ROLLOUT),
    ((41 << 9) | MOVE_ENDURE),
    ((49 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gDonphanLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ODOR_SLEUTH),
    ((1 << 9) | MOVE_HORN_ATTACK),
    ((1 << 9) | MOVE_GROWL),
    ((9 << 9) | MOVE_DEFENSE_CURL),
    ((17 << 9) | MOVE_FLAIL),
    ((25 << 9) | MOVE_FURY_ATTACK),
    ((33 << 9) | MOVE_ROLLOUT),
    ((41 << 9) | MOVE_RAPID_SPIN),
    ((49 << 9) | MOVE_EARTHQUAKE),
    0xffff
};

const u16 gPorygon2LevelUpLearnset[] = {
    ((1 << 9) | MOVE_CONVERSION_2),
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_CONVERSION),
    ((9 << 9) | MOVE_AGILITY),
    ((12 << 9) | MOVE_PSYBEAM),
    ((20 << 9) | MOVE_RECOVER),
    ((24 << 9) | MOVE_DEFENSE_CURL),
    ((32 << 9) | MOVE_LOCK_ON),
    ((36 << 9) | MOVE_TRI_ATTACK),
    ((44 << 9) | MOVE_RECYCLE),
    ((48 << 9) | MOVE_ZAP_CANNON),
    0xffff
};

const u16 gStantlerLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((7 << 9) | MOVE_LEER),
    ((13 << 9) | MOVE_ASTONISH),
    ((19 << 9) | MOVE_HYPNOSIS),
    ((25 << 9) | MOVE_STOMP),
    ((31 << 9) | MOVE_SAND_ATTACK),
    ((37 << 9) | MOVE_TAKE_DOWN),
    ((43 << 9) | MOVE_CONFUSE_RAY),
    ((49 << 9) | MOVE_CALM_MIND),
    0xffff
};

const u16 gSmeargleLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SKETCH),
    ((11 << 9) | MOVE_SKETCH),
    ((21 << 9) | MOVE_SKETCH),
    ((31 << 9) | MOVE_SKETCH),
    ((41 << 9) | MOVE_SKETCH),
    ((51 << 9) | MOVE_SKETCH),
    ((61 << 9) | MOVE_SKETCH),
    ((71 << 9) | MOVE_SKETCH),
    ((81 << 9) | MOVE_SKETCH),
    ((91 << 9) | MOVE_SKETCH),
    0xffff
};

const u16 gTyrogueLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gHitmontopLevelUpLearnset[] = {
    ((1 << 9) | MOVE_REVENGE),
    ((1 << 9) | MOVE_ROLLING_KICK),
    ((7 << 9) | MOVE_FOCUS_ENERGY),
    ((13 << 9) | MOVE_PURSUIT),
    ((19 << 9) | MOVE_QUICK_ATTACK),
    ((20 << 9) | MOVE_TRIPLE_KICK),
    ((25 << 9) | MOVE_RAPID_SPIN),
    ((31 << 9) | MOVE_COUNTER),
    ((37 << 9) | MOVE_AGILITY),
    ((43 << 9) | MOVE_DETECT),
    ((49 << 9) | MOVE_ENDEAVOR),
    0xffff
};

const u16 gSmoochumLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_LICK),
    ((9 << 9) | MOVE_SWEET_KISS),
    ((13 << 9) | MOVE_POWDER_SNOW),
    ((21 << 9) | MOVE_CONFUSION),
    ((25 << 9) | MOVE_SING),
    ((33 << 9) | MOVE_MEAN_LOOK),
    ((37 << 9) | MOVE_FAKE_TEARS),
    ((45 << 9) | MOVE_PSYCHIC),
    ((49 << 9) | MOVE_PERISH_SONG),
    ((57 << 9) | MOVE_BLIZZARD),
    0xffff
};

const u16 gElekidLevelUpLearnset[] = {
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((1 << 9) | MOVE_LEER),
    ((9 << 9) | MOVE_THUNDER_PUNCH),
    ((17 << 9) | MOVE_LIGHT_SCREEN),
    ((25 << 9) | MOVE_SWIFT),
    ((33 << 9) | MOVE_SCREECH),
    ((41 << 9) | MOVE_THUNDERBOLT),
    ((49 << 9) | MOVE_THUNDER),
    0xffff
};

const u16 gMagbyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_EMBER),
    ((7 << 9) | MOVE_LEER),
    ((13 << 9) | MOVE_SMOG),
    ((19 << 9) | MOVE_FIRE_PUNCH),
    ((25 << 9) | MOVE_SMOKESCREEN),
    ((31 << 9) | MOVE_SUNNY_DAY),
    ((37 << 9) | MOVE_FLAMETHROWER),
    ((43 << 9) | MOVE_CONFUSE_RAY),
    ((49 << 9) | MOVE_FIRE_BLAST),
    0xffff
};

const u16 gMiltankLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((4 << 9) | MOVE_GROWL),
    ((8 << 9) | MOVE_DEFENSE_CURL),
    ((13 << 9) | MOVE_STOMP),
    ((19 << 9) | MOVE_MILK_DRINK),
    ((26 << 9) | MOVE_BIDE),
    ((34 << 9) | MOVE_ROLLOUT),
    ((43 << 9) | MOVE_BODY_SLAM),
    ((53 << 9) | MOVE_HEAL_BELL),
    0xffff
};

const u16 gBlisseyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_GROWL),
    ((4 << 9) | MOVE_TAIL_WHIP),
    ((7 << 9) | MOVE_REFRESH),
    ((10 << 9) | MOVE_SOFT_BOILED),
    ((13 << 9) | MOVE_DOUBLE_SLAP),
    ((18 << 9) | MOVE_MINIMIZE),
    ((23 << 9) | MOVE_SING),
    ((28 << 9) | MOVE_EGG_BOMB),
    ((33 << 9) | MOVE_DEFENSE_CURL),
    ((40 << 9) | MOVE_LIGHT_SCREEN),
    ((47 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gRaikouLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_LEER),
    ((11 << 9) | MOVE_THUNDER_SHOCK),
    ((21 << 9) | MOVE_ROAR),
    ((31 << 9) | MOVE_QUICK_ATTACK),
    ((41 << 9) | MOVE_SPARK),
    ((51 << 9) | MOVE_REFLECT),
    ((61 << 9) | MOVE_CRUNCH),
    ((71 << 9) | MOVE_THUNDER),
    ((81 << 9) | MOVE_CALM_MIND),
    0xffff
};

const u16 gEnteiLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_LEER),
    ((11 << 9) | MOVE_EMBER),
    ((21 << 9) | MOVE_ROAR),
    ((31 << 9) | MOVE_FIRE_SPIN),
    ((41 << 9) | MOVE_STOMP),
    ((51 << 9) | MOVE_FLAMETHROWER),
    ((61 << 9) | MOVE_SWAGGER),
    ((71 << 9) | MOVE_FIRE_BLAST),
    ((81 << 9) | MOVE_CALM_MIND),
    0xffff
};

const u16 gSuicuneLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_LEER),
    ((11 << 9) | MOVE_BUBBLE_BEAM),
    ((21 << 9) | MOVE_RAIN_DANCE),
    ((31 << 9) | MOVE_GUST),
    ((41 << 9) | MOVE_AURORA_BEAM),
    ((51 << 9) | MOVE_MIST),
    ((61 << 9) | MOVE_MIRROR_COAT),
    ((71 << 9) | MOVE_HYDRO_PUMP),
    ((81 << 9) | MOVE_CALM_MIND),
    0xffff
};

const u16 gLarvitarLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_LEER),
    ((8 << 9) | MOVE_SANDSTORM),
    ((15 << 9) | MOVE_SCREECH),
    ((22 << 9) | MOVE_ROCK_SLIDE),
    ((29 << 9) | MOVE_THRASH),
    ((36 << 9) | MOVE_SCARY_FACE),
    ((43 << 9) | MOVE_CRUNCH),
    ((50 << 9) | MOVE_EARTHQUAKE),
    ((57 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gPupitarLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_SANDSTORM),
    ((1 << 9) | MOVE_SCREECH),
    ((8 << 9) | MOVE_SANDSTORM),
    ((15 << 9) | MOVE_SCREECH),
    ((22 << 9) | MOVE_ROCK_SLIDE),
    ((29 << 9) | MOVE_THRASH),
    ((38 << 9) | MOVE_SCARY_FACE),
    ((47 << 9) | MOVE_CRUNCH),
    ((56 << 9) | MOVE_EARTHQUAKE),
    ((65 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gTyranitarLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_SANDSTORM),
    ((1 << 9) | MOVE_SCREECH),
    ((8 << 9) | MOVE_SANDSTORM),
    ((15 << 9) | MOVE_SCREECH),
    ((22 << 9) | MOVE_ROCK_SLIDE),
    ((29 << 9) | MOVE_THRASH),
    ((38 << 9) | MOVE_SCARY_FACE),
    ((47 << 9) | MOVE_CRUNCH),
    ((61 << 9) | MOVE_EARTHQUAKE),
    ((75 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gLugiaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WHIRLWIND),
    ((11 << 9) | MOVE_SAFEGUARD),
    ((22 << 9) | MOVE_GUST),
    ((33 << 9) | MOVE_RECOVER),
    ((44 << 9) | MOVE_HYDRO_PUMP),
    ((55 << 9) | MOVE_RAIN_DANCE),
    ((66 << 9) | MOVE_SWIFT),
    ((77 << 9) | MOVE_AEROBLAST),
    ((88 << 9) | MOVE_ANCIENT_POWER),
    ((99 << 9) | MOVE_FUTURE_SIGHT),
    0xffff
};

const u16 gHoOhLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WHIRLWIND),
    ((11 << 9) | MOVE_SAFEGUARD),
    ((22 << 9) | MOVE_GUST),
    ((33 << 9) | MOVE_RECOVER),
    ((44 << 9) | MOVE_FIRE_BLAST),
    ((55 << 9) | MOVE_SUNNY_DAY),
    ((66 << 9) | MOVE_SWIFT),
    ((77 << 9) | MOVE_SACRED_FIRE),
    ((88 << 9) | MOVE_ANCIENT_POWER),
    ((99 << 9) | MOVE_FUTURE_SIGHT),
    0xffff
};

const u16 gCelebiLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEECH_SEED),
    ((1 << 9) | MOVE_CONFUSION),
    ((1 << 9) | MOVE_RECOVER),
    ((1 << 9) | MOVE_HEAL_BELL),
    ((10 << 9) | MOVE_SAFEGUARD),
    ((20 << 9) | MOVE_ANCIENT_POWER),
    ((30 << 9) | MOVE_FUTURE_SIGHT),
    ((40 << 9) | MOVE_BATON_PASS),
    ((50 << 9) | MOVE_PERISH_SONG),
    0xffff
};

const u16 gSpecies252LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies253LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies254LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies255LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies256LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies257LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies258LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies259LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies260LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies261LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies262LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies263LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies264LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies265LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies266LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies267LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies268LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies269LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies270LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies271LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies272LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies273LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies274LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies275LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gSpecies276LevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    0xffff
};

const u16 gTreeckoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_LEER),
    ((6 << 9) | MOVE_ABSORB),
    ((11 << 9) | MOVE_QUICK_ATTACK),
    ((16 << 9) | MOVE_PURSUIT),
    ((21 << 9) | MOVE_SCREECH),
    ((26 << 9) | MOVE_MEGA_DRAIN),
    ((31 << 9) | MOVE_AGILITY),
    ((36 << 9) | MOVE_SLAM),
    ((41 << 9) | MOVE_DETECT),
    ((46 << 9) | MOVE_GIGA_DRAIN),
    0xffff
};

const u16 gGrovyleLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_ABSORB),
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((6 << 9) | MOVE_ABSORB),
    ((11 << 9) | MOVE_QUICK_ATTACK),
    ((16 << 9) | MOVE_FURY_CUTTER),
    ((17 << 9) | MOVE_PURSUIT),
    ((23 << 9) | MOVE_SCREECH),
    ((29 << 9) | MOVE_LEAF_BLADE),
    ((35 << 9) | MOVE_AGILITY),
    ((41 << 9) | MOVE_SLAM),
    ((47 << 9) | MOVE_DETECT),
    ((53 << 9) | MOVE_FALSE_SWIPE),
    0xffff
};

const u16 gSceptileLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_ABSORB),
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((6 << 9) | MOVE_ABSORB),
    ((11 << 9) | MOVE_QUICK_ATTACK),
    ((16 << 9) | MOVE_FURY_CUTTER),
    ((17 << 9) | MOVE_PURSUIT),
    ((23 << 9) | MOVE_SCREECH),
    ((29 << 9) | MOVE_LEAF_BLADE),
    ((35 << 9) | MOVE_AGILITY),
    ((43 << 9) | MOVE_SLAM),
    ((51 << 9) | MOVE_DETECT),
    ((59 << 9) | MOVE_FALSE_SWIPE),
    0xffff
};

const u16 gTorchicLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_GROWL),
    ((7 << 9) | MOVE_FOCUS_ENERGY),
    ((10 << 9) | MOVE_EMBER),
    ((16 << 9) | MOVE_PECK),
    ((19 << 9) | MOVE_SAND_ATTACK),
    ((25 << 9) | MOVE_FIRE_SPIN),
    ((28 << 9) | MOVE_QUICK_ATTACK),
    ((34 << 9) | MOVE_SLASH),
    ((37 << 9) | MOVE_MIRROR_MOVE),
    ((43 << 9) | MOVE_FLAMETHROWER),
    0xffff
};

const u16 gCombuskenLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_FOCUS_ENERGY),
    ((1 << 9) | MOVE_EMBER),
    ((7 << 9) | MOVE_FOCUS_ENERGY),
    ((13 << 9) | MOVE_EMBER),
    ((16 << 9) | MOVE_DOUBLE_KICK),
    ((17 << 9) | MOVE_PECK),
    ((21 << 9) | MOVE_SAND_ATTACK),
    ((28 << 9) | MOVE_BULK_UP),
    ((32 << 9) | MOVE_QUICK_ATTACK),
    ((39 << 9) | MOVE_SLASH),
    ((43 << 9) | MOVE_MIRROR_MOVE),
    ((50 << 9) | MOVE_SKY_UPPERCUT),
    0xffff
};

const u16 gBlazikenLevelUpLearnset[] = {
    ((1 << 9) | MOVE_FIRE_PUNCH),
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_FOCUS_ENERGY),
    ((1 << 9) | MOVE_EMBER),
    ((7 << 9) | MOVE_FOCUS_ENERGY),
    ((13 << 9) | MOVE_EMBER),
    ((16 << 9) | MOVE_DOUBLE_KICK),
    ((17 << 9) | MOVE_PECK),
    ((21 << 9) | MOVE_SAND_ATTACK),
    ((28 << 9) | MOVE_BULK_UP),
    ((32 << 9) | MOVE_QUICK_ATTACK),
    ((36 << 9) | MOVE_BLAZE_KICK),
    ((42 << 9) | MOVE_SLASH),
    ((49 << 9) | MOVE_MIRROR_MOVE),
    ((59 << 9) | MOVE_SKY_UPPERCUT),
    0xffff
};

const u16 gMudkipLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((6 << 9) | MOVE_MUD_SLAP),
    ((10 << 9) | MOVE_WATER_GUN),
    ((15 << 9) | MOVE_BIDE),
    ((19 << 9) | MOVE_FORESIGHT),
    ((24 << 9) | MOVE_MUD_SPORT),
    ((28 << 9) | MOVE_TAKE_DOWN),
    ((33 << 9) | MOVE_WHIRLPOOL),
    ((37 << 9) | MOVE_PROTECT),
    ((42 << 9) | MOVE_HYDRO_PUMP),
    ((46 << 9) | MOVE_ENDEAVOR),
    0xffff
};

const u16 gMarshtompLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_MUD_SLAP),
    ((1 << 9) | MOVE_WATER_GUN),
    ((6 << 9) | MOVE_MUD_SLAP),
    ((10 << 9) | MOVE_WATER_GUN),
    ((15 << 9) | MOVE_BIDE),
    ((16 << 9) | MOVE_MUD_SHOT),
    ((20 << 9) | MOVE_FORESIGHT),
    ((25 << 9) | MOVE_MUD_SPORT),
    ((31 << 9) | MOVE_TAKE_DOWN),
    ((37 << 9) | MOVE_MUDDY_WATER),
    ((42 << 9) | MOVE_PROTECT),
    ((46 << 9) | MOVE_EARTHQUAKE),
    ((53 << 9) | MOVE_ENDEAVOR),
    0xffff
};

const u16 gSwampertLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_MUD_SLAP),
    ((1 << 9) | MOVE_WATER_GUN),
    ((6 << 9) | MOVE_MUD_SLAP),
    ((10 << 9) | MOVE_WATER_GUN),
    ((15 << 9) | MOVE_BIDE),
    ((16 << 9) | MOVE_MUD_SHOT),
    ((20 << 9) | MOVE_FORESIGHT),
    ((25 << 9) | MOVE_MUD_SPORT),
    ((31 << 9) | MOVE_TAKE_DOWN),
    ((39 << 9) | MOVE_MUDDY_WATER),
    ((46 << 9) | MOVE_PROTECT),
    ((52 << 9) | MOVE_EARTHQUAKE),
    ((61 << 9) | MOVE_ENDEAVOR),
    0xffff
};

const u16 gPoochyenaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((5 << 9) | MOVE_HOWL),
    ((9 << 9) | MOVE_SAND_ATTACK),
    ((13 << 9) | MOVE_BITE),
    ((17 << 9) | MOVE_ODOR_SLEUTH),
    ((21 << 9) | MOVE_ROAR),
    ((25 << 9) | MOVE_SWAGGER),
    ((29 << 9) | MOVE_SCARY_FACE),
    ((33 << 9) | MOVE_TAKE_DOWN),
    ((37 << 9) | MOVE_TAUNT),
    ((41 << 9) | MOVE_CRUNCH),
    ((45 << 9) | MOVE_THIEF),
    0xffff
};

const u16 gMightyenaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_HOWL),
    ((1 << 9) | MOVE_SAND_ATTACK),
    ((1 << 9) | MOVE_BITE),
    ((5 << 9) | MOVE_HOWL),
    ((9 << 9) | MOVE_SAND_ATTACK),
    ((13 << 9) | MOVE_BITE),
    ((17 << 9) | MOVE_ODOR_SLEUTH),
    ((22 << 9) | MOVE_ROAR),
    ((27 << 9) | MOVE_SWAGGER),
    ((32 << 9) | MOVE_SCARY_FACE),
    ((37 << 9) | MOVE_TAKE_DOWN),
    ((42 << 9) | MOVE_TAUNT),
    ((47 << 9) | MOVE_CRUNCH),
    ((52 << 9) | MOVE_THIEF),
    0xffff
};

const u16 gZigzagoonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((5 << 9) | MOVE_TAIL_WHIP),
    ((9 << 9) | MOVE_HEADBUTT),
    ((13 << 9) | MOVE_SAND_ATTACK),
    ((17 << 9) | MOVE_ODOR_SLEUTH),
    ((21 << 9) | MOVE_MUD_SPORT),
    ((25 << 9) | MOVE_PIN_MISSILE),
    ((29 << 9) | MOVE_COVET),
    ((33 << 9) | MOVE_FLAIL),
    ((37 << 9) | MOVE_REST),
    ((41 << 9) | MOVE_BELLY_DRUM),
    0xffff
};

const u16 gLinooneLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_HEADBUTT),
    ((5 << 9) | MOVE_TAIL_WHIP),
    ((9 << 9) | MOVE_HEADBUTT),
    ((13 << 9) | MOVE_SAND_ATTACK),
    ((17 << 9) | MOVE_ODOR_SLEUTH),
    ((23 << 9) | MOVE_MUD_SPORT),
    ((29 << 9) | MOVE_FURY_SWIPES),
    ((35 << 9) | MOVE_COVET),
    ((41 << 9) | MOVE_SLASH),
    ((47 << 9) | MOVE_REST),
    ((53 << 9) | MOVE_BELLY_DRUM),
    0xffff
};

const u16 gWurmpleLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_STRING_SHOT),
    ((5 << 9) | MOVE_POISON_STING),
    0xffff
};

const u16 gSilcoonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HARDEN),
    ((7 << 9) | MOVE_HARDEN),
    0xffff
};

const u16 gBeautiflyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ABSORB),
    ((10 << 9) | MOVE_ABSORB),
    ((13 << 9) | MOVE_GUST),
    ((17 << 9) | MOVE_STUN_SPORE),
    ((20 << 9) | MOVE_MORNING_SUN),
    ((24 << 9) | MOVE_MEGA_DRAIN),
    ((27 << 9) | MOVE_WHIRLWIND),
    ((31 << 9) | MOVE_ATTRACT),
    ((34 << 9) | MOVE_SILVER_WIND),
    ((38 << 9) | MOVE_GIGA_DRAIN),
    0xffff
};

const u16 gCascoonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_HARDEN),
    ((7 << 9) | MOVE_HARDEN),
    0xffff
};

const u16 gDustoxLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CONFUSION),
    ((10 << 9) | MOVE_CONFUSION),
    ((13 << 9) | MOVE_GUST),
    ((17 << 9) | MOVE_PROTECT),
    ((20 << 9) | MOVE_MOONLIGHT),
    ((24 << 9) | MOVE_PSYBEAM),
    ((27 << 9) | MOVE_WHIRLWIND),
    ((31 << 9) | MOVE_LIGHT_SCREEN),
    ((34 << 9) | MOVE_SILVER_WIND),
    ((38 << 9) | MOVE_TOXIC),
    0xffff
};

const u16 gLotadLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ASTONISH),
    ((3 << 9) | MOVE_GROWL),
    ((7 << 9) | MOVE_ABSORB),
    ((13 << 9) | MOVE_NATURE_POWER),
    ((21 << 9) | MOVE_MIST),
    ((31 << 9) | MOVE_RAIN_DANCE),
    ((43 << 9) | MOVE_MEGA_DRAIN),
    0xffff
};

const u16 gLombreLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ASTONISH),
    ((3 << 9) | MOVE_GROWL),
    ((7 << 9) | MOVE_ABSORB),
    ((13 << 9) | MOVE_NATURE_POWER),
    ((19 << 9) | MOVE_FAKE_OUT),
    ((25 << 9) | MOVE_FURY_SWIPES),
    ((31 << 9) | MOVE_WATER_SPORT),
    ((37 << 9) | MOVE_THIEF),
    ((43 << 9) | MOVE_UPROAR),
    ((49 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gLudicoloLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ASTONISH),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_ABSORB),
    ((1 << 9) | MOVE_NATURE_POWER),
    0xffff
};

const u16 gSeedotLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BIDE),
    ((3 << 9) | MOVE_HARDEN),
    ((7 << 9) | MOVE_GROWTH),
    ((13 << 9) | MOVE_NATURE_POWER),
    ((21 << 9) | MOVE_SYNTHESIS),
    ((31 << 9) | MOVE_SUNNY_DAY),
    ((43 << 9) | MOVE_EXPLOSION),
    0xffff
};

const u16 gNuzleafLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((3 << 9) | MOVE_HARDEN),
    ((7 << 9) | MOVE_GROWTH),
    ((13 << 9) | MOVE_NATURE_POWER),
    ((19 << 9) | MOVE_FAKE_OUT),
    ((25 << 9) | MOVE_TORMENT),
    ((31 << 9) | MOVE_FAINT_ATTACK),
    ((37 << 9) | MOVE_RAZOR_WIND),
    ((43 << 9) | MOVE_SWAGGER),
    ((49 << 9) | MOVE_EXTRASENSORY),
    0xffff
};

const u16 gShiftryLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_HARDEN),
    ((1 << 9) | MOVE_GROWTH),
    ((1 << 9) | MOVE_NATURE_POWER),
    0xffff
};

const u16 gNincadaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_HARDEN),
    ((5 << 9) | MOVE_LEECH_LIFE),
    ((9 << 9) | MOVE_SAND_ATTACK),
    ((14 << 9) | MOVE_FURY_SWIPES),
    ((19 << 9) | MOVE_MIND_READER),
    ((25 << 9) | MOVE_FALSE_SWIPE),
    ((31 << 9) | MOVE_MUD_SLAP),
    ((38 << 9) | MOVE_METAL_CLAW),
    ((45 << 9) | MOVE_DIG),
    0xffff
};

const u16 gNinjaskLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_HARDEN),
    ((1 << 9) | MOVE_LEECH_LIFE),
    ((1 << 9) | MOVE_SAND_ATTACK),
    ((5 << 9) | MOVE_LEECH_LIFE),
    ((9 << 9) | MOVE_SAND_ATTACK),
    ((14 << 9) | MOVE_FURY_SWIPES),
    ((19 << 9) | MOVE_MIND_READER),
    ((20 << 9) | MOVE_DOUBLE_TEAM),
    ((20 << 9) | MOVE_FURY_CUTTER),
    ((20 << 9) | MOVE_SCREECH),
    ((25 << 9) | MOVE_SWORDS_DANCE),
    ((31 << 9) | MOVE_SLASH),
    ((38 << 9) | MOVE_AGILITY),
    ((45 << 9) | MOVE_BATON_PASS),
    0xffff
};

const u16 gShedinjaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_HARDEN),
    ((5 << 9) | MOVE_LEECH_LIFE),
    ((9 << 9) | MOVE_SAND_ATTACK),
    ((14 << 9) | MOVE_FURY_SWIPES),
    ((19 << 9) | MOVE_MIND_READER),
    ((25 << 9) | MOVE_SPITE),
    ((31 << 9) | MOVE_CONFUSE_RAY),
    ((38 << 9) | MOVE_SHADOW_BALL),
    ((45 << 9) | MOVE_GRUDGE),
    0xffff
};

const u16 gTaillowLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_GROWL),
    ((4 << 9) | MOVE_FOCUS_ENERGY),
    ((8 << 9) | MOVE_QUICK_ATTACK),
    ((13 << 9) | MOVE_WING_ATTACK),
    ((19 << 9) | MOVE_DOUBLE_TEAM),
    ((26 << 9) | MOVE_ENDEAVOR),
    ((34 << 9) | MOVE_AERIAL_ACE),
    ((43 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gSwellowLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_FOCUS_ENERGY),
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((4 << 9) | MOVE_FOCUS_ENERGY),
    ((8 << 9) | MOVE_QUICK_ATTACK),
    ((13 << 9) | MOVE_WING_ATTACK),
    ((19 << 9) | MOVE_DOUBLE_TEAM),
    ((28 << 9) | MOVE_ENDEAVOR),
    ((38 << 9) | MOVE_AERIAL_ACE),
    ((49 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gShroomishLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ABSORB),
    ((4 << 9) | MOVE_TACKLE),
    ((7 << 9) | MOVE_STUN_SPORE),
    ((10 << 9) | MOVE_LEECH_SEED),
    ((16 << 9) | MOVE_MEGA_DRAIN),
    ((22 << 9) | MOVE_HEADBUTT),
    ((28 << 9) | MOVE_POISON_POWDER),
    ((36 << 9) | MOVE_GROWTH),
    ((45 << 9) | MOVE_GIGA_DRAIN),
    ((54 << 9) | MOVE_SPORE),
    0xffff
};

const u16 gBreloomLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ABSORB),
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_STUN_SPORE),
    ((1 << 9) | MOVE_LEECH_SEED),
    ((4 << 9) | MOVE_TACKLE),
    ((7 << 9) | MOVE_STUN_SPORE),
    ((10 << 9) | MOVE_LEECH_SEED),
    ((16 << 9) | MOVE_MEGA_DRAIN),
    ((22 << 9) | MOVE_HEADBUTT),
    ((23 << 9) | MOVE_MACH_PUNCH),
    ((28 << 9) | MOVE_COUNTER),
    ((36 << 9) | MOVE_SKY_UPPERCUT),
    ((45 << 9) | MOVE_MIND_READER),
    ((54 << 9) | MOVE_DYNAMIC_PUNCH),
    0xffff
};

const u16 gSpindaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((5 << 9) | MOVE_UPROAR),
    ((12 << 9) | MOVE_FAINT_ATTACK),
    ((16 << 9) | MOVE_PSYBEAM),
    ((23 << 9) | MOVE_HYPNOSIS),
    ((27 << 9) | MOVE_DIZZY_PUNCH),
    ((34 << 9) | MOVE_TEETER_DANCE),
    ((38 << 9) | MOVE_PSYCH_UP),
    ((45 << 9) | MOVE_DOUBLE_EDGE),
    ((49 << 9) | MOVE_FLAIL),
    ((56 << 9) | MOVE_THRASH),
    0xffff
};

const u16 gWingullLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_WATER_GUN),
    ((7 << 9) | MOVE_SUPERSONIC),
    ((13 << 9) | MOVE_WING_ATTACK),
    ((21 << 9) | MOVE_MIST),
    ((31 << 9) | MOVE_QUICK_ATTACK),
    ((43 << 9) | MOVE_PURSUIT),
    ((55 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gPelipperLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_WATER_GUN),
    ((1 << 9) | MOVE_WATER_SPORT),
    ((1 << 9) | MOVE_WING_ATTACK),
    ((3 << 9) | MOVE_WATER_GUN),
    ((7 << 9) | MOVE_SUPERSONIC),
    ((13 << 9) | MOVE_WING_ATTACK),
    ((21 << 9) | MOVE_MIST),
    ((25 << 9) | MOVE_PROTECT),
    ((33 << 9) | MOVE_STOCKPILE),
    ((33 << 9) | MOVE_SWALLOW),
    ((47 << 9) | MOVE_SPIT_UP),
    ((61 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gSurskitLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((7 << 9) | MOVE_QUICK_ATTACK),
    ((13 << 9) | MOVE_SWEET_SCENT),
    ((19 << 9) | MOVE_WATER_SPORT),
    ((25 << 9) | MOVE_BUBBLE_BEAM),
    ((31 << 9) | MOVE_AGILITY),
    ((37 << 9) | MOVE_MIST),
    ((37 << 9) | MOVE_HAZE),
    0xffff
};

const u16 gMasquerainLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((1 << 9) | MOVE_QUICK_ATTACK),
    ((1 << 9) | MOVE_SWEET_SCENT),
    ((1 << 9) | MOVE_WATER_SPORT),
    ((7 << 9) | MOVE_QUICK_ATTACK),
    ((13 << 9) | MOVE_SWEET_SCENT),
    ((19 << 9) | MOVE_WATER_SPORT),
    ((26 << 9) | MOVE_GUST),
    ((33 << 9) | MOVE_SCARY_FACE),
    ((40 << 9) | MOVE_STUN_SPORE),
    ((47 << 9) | MOVE_SILVER_WIND),
    ((53 << 9) | MOVE_WHIRLWIND),
    0xffff
};

const u16 gWailmerLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPLASH),
    ((5 << 9) | MOVE_GROWL),
    ((10 << 9) | MOVE_WATER_GUN),
    ((14 << 9) | MOVE_ROLLOUT),
    ((19 << 9) | MOVE_WHIRLPOOL),
    ((23 << 9) | MOVE_ASTONISH),
    ((28 << 9) | MOVE_WATER_PULSE),
    ((32 << 9) | MOVE_MIST),
    ((37 << 9) | MOVE_REST),
    ((41 << 9) | MOVE_WATER_SPOUT),
    ((46 << 9) | MOVE_AMNESIA),
    ((50 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gWailordLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPLASH),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_WATER_GUN),
    ((1 << 9) | MOVE_ROLLOUT),
    ((5 << 9) | MOVE_GROWL),
    ((10 << 9) | MOVE_WATER_GUN),
    ((14 << 9) | MOVE_ROLLOUT),
    ((19 << 9) | MOVE_WHIRLPOOL),
    ((23 << 9) | MOVE_ASTONISH),
    ((28 << 9) | MOVE_WATER_PULSE),
    ((32 << 9) | MOVE_MIST),
    ((37 << 9) | MOVE_REST),
    ((44 << 9) | MOVE_WATER_SPOUT),
    ((52 << 9) | MOVE_AMNESIA),
    ((59 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gSkittyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_TACKLE),
    ((3 << 9) | MOVE_TAIL_WHIP),
    ((7 << 9) | MOVE_ATTRACT),
    ((13 << 9) | MOVE_SING),
    ((15 << 9) | MOVE_DOUBLE_SLAP),
    ((19 << 9) | MOVE_ASSIST),
    ((25 << 9) | MOVE_CHARM),
    ((27 << 9) | MOVE_FAINT_ATTACK),
    ((31 << 9) | MOVE_COVET),
    ((37 << 9) | MOVE_HEAL_BELL),
    ((39 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gDelcattyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_ATTRACT),
    ((1 << 9) | MOVE_SING),
    ((1 << 9) | MOVE_DOUBLE_SLAP),
    0xffff
};

const u16 gKecleonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_THIEF),
    ((1 << 9) | MOVE_TAIL_WHIP),
    ((1 << 9) | MOVE_ASTONISH),
    ((1 << 9) | MOVE_LICK),
    ((1 << 9) | MOVE_SCRATCH),
    ((4 << 9) | MOVE_BIND),
    ((7 << 9) | MOVE_FAINT_ATTACK),
    ((12 << 9) | MOVE_FURY_SWIPES),
    ((17 << 9) | MOVE_PSYBEAM),
    ((24 << 9) | MOVE_SCREECH),
    ((31 << 9) | MOVE_SLASH),
    ((40 << 9) | MOVE_SUBSTITUTE),
    ((49 << 9) | MOVE_ANCIENT_POWER),
    0xffff
};

const u16 gBaltoyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CONFUSION),
    ((3 << 9) | MOVE_HARDEN),
    ((5 << 9) | MOVE_RAPID_SPIN),
    ((7 << 9) | MOVE_MUD_SLAP),
    ((11 << 9) | MOVE_PSYBEAM),
    ((15 << 9) | MOVE_ROCK_TOMB),
    ((19 << 9) | MOVE_SELF_DESTRUCT),
    ((25 << 9) | MOVE_ANCIENT_POWER),
    ((31 << 9) | MOVE_SANDSTORM),
    ((37 << 9) | MOVE_COSMIC_POWER),
    ((45 << 9) | MOVE_EXPLOSION),
    0xffff
};

const u16 gClaydolLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TELEPORT),
    ((1 << 9) | MOVE_CONFUSION),
    ((1 << 9) | MOVE_HARDEN),
    ((1 << 9) | MOVE_RAPID_SPIN),
    ((3 << 9) | MOVE_HARDEN),
    ((5 << 9) | MOVE_RAPID_SPIN),
    ((7 << 9) | MOVE_MUD_SLAP),
    ((11 << 9) | MOVE_PSYBEAM),
    ((15 << 9) | MOVE_ROCK_TOMB),
    ((19 << 9) | MOVE_SELF_DESTRUCT),
    ((25 << 9) | MOVE_ANCIENT_POWER),
    ((31 << 9) | MOVE_SANDSTORM),
    ((36 << 9) | MOVE_HYPER_BEAM),
    ((42 << 9) | MOVE_COSMIC_POWER),
    ((55 << 9) | MOVE_EXPLOSION),
    0xffff
};

const u16 gNosepassLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((7 << 9) | MOVE_HARDEN),
    ((13 << 9) | MOVE_ROCK_THROW),
    ((16 << 9) | MOVE_BLOCK),
    ((22 << 9) | MOVE_THUNDER_WAVE),
    ((28 << 9) | MOVE_ROCK_SLIDE),
    ((31 << 9) | MOVE_SANDSTORM),
    ((37 << 9) | MOVE_REST),
    ((43 << 9) | MOVE_ZAP_CANNON),
    ((46 << 9) | MOVE_LOCK_ON),
    0xffff
};

const u16 gTorkoalLevelUpLearnset[] = {
    ((1 << 9) | MOVE_EMBER),
    ((4 << 9) | MOVE_SMOG),
    ((7 << 9) | MOVE_CURSE),
    ((14 << 9) | MOVE_SMOKESCREEN),
    ((17 << 9) | MOVE_FIRE_SPIN),
    ((20 << 9) | MOVE_BODY_SLAM),
    ((27 << 9) | MOVE_PROTECT),
    ((30 << 9) | MOVE_FLAMETHROWER),
    ((33 << 9) | MOVE_IRON_DEFENSE),
    ((40 << 9) | MOVE_AMNESIA),
    ((43 << 9) | MOVE_FLAIL),
    ((46 << 9) | MOVE_HEAT_WAVE),
    0xffff
};

const u16 gSableyeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_SCRATCH),
    ((5 << 9) | MOVE_FORESIGHT),
    ((9 << 9) | MOVE_NIGHT_SHADE),
    ((13 << 9) | MOVE_ASTONISH),
    ((17 << 9) | MOVE_FURY_SWIPES),
    ((21 << 9) | MOVE_FAKE_OUT),
    ((25 << 9) | MOVE_DETECT),
    ((29 << 9) | MOVE_FAINT_ATTACK),
    ((33 << 9) | MOVE_KNOCK_OFF),
    ((37 << 9) | MOVE_CONFUSE_RAY),
    ((41 << 9) | MOVE_SHADOW_BALL),
    ((45 << 9) | MOVE_MEAN_LOOK),
    0xffff
};

const u16 gBarboachLevelUpLearnset[] = {
    ((1 << 9) | MOVE_MUD_SLAP),
    ((6 << 9) | MOVE_MUD_SPORT),
    ((6 << 9) | MOVE_WATER_SPORT),
    ((11 << 9) | MOVE_WATER_GUN),
    ((16 << 9) | MOVE_MAGNITUDE),
    ((21 << 9) | MOVE_AMNESIA),
    ((26 << 9) | MOVE_REST),
    ((26 << 9) | MOVE_SNORE),
    ((31 << 9) | MOVE_EARTHQUAKE),
    ((36 << 9) | MOVE_FUTURE_SIGHT),
    ((41 << 9) | MOVE_FISSURE),
    0xffff
};

const u16 gWhiscashLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TICKLE),
    ((1 << 9) | MOVE_MUD_SLAP),
    ((1 << 9) | MOVE_MUD_SPORT),
    ((1 << 9) | MOVE_WATER_SPORT),
    ((6 << 9) | MOVE_MUD_SPORT),
    ((6 << 9) | MOVE_WATER_SPORT),
    ((11 << 9) | MOVE_WATER_GUN),
    ((16 << 9) | MOVE_MAGNITUDE),
    ((21 << 9) | MOVE_AMNESIA),
    ((26 << 9) | MOVE_REST),
    ((26 << 9) | MOVE_SNORE),
    ((36 << 9) | MOVE_EARTHQUAKE),
    ((46 << 9) | MOVE_FUTURE_SIGHT),
    ((56 << 9) | MOVE_FISSURE),
    0xffff
};

const u16 gLuvdiscLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((4 << 9) | MOVE_CHARM),
    ((12 << 9) | MOVE_WATER_GUN),
    ((16 << 9) | MOVE_AGILITY),
    ((24 << 9) | MOVE_TAKE_DOWN),
    ((28 << 9) | MOVE_ATTRACT),
    ((36 << 9) | MOVE_SWEET_KISS),
    ((40 << 9) | MOVE_FLAIL),
    ((48 << 9) | MOVE_SAFEGUARD),
    0xffff
};

const u16 gCorphishLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((7 << 9) | MOVE_HARDEN),
    ((10 << 9) | MOVE_VICE_GRIP),
    ((13 << 9) | MOVE_LEER),
    ((20 << 9) | MOVE_BUBBLE_BEAM),
    ((23 << 9) | MOVE_PROTECT),
    ((26 << 9) | MOVE_KNOCK_OFF),
    ((32 << 9) | MOVE_TAUNT),
    ((35 << 9) | MOVE_CRABHAMMER),
    ((38 << 9) | MOVE_SWORDS_DANCE),
    ((44 << 9) | MOVE_GUILLOTINE),
    0xffff
};

const u16 gCrawdauntLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BUBBLE),
    ((1 << 9) | MOVE_HARDEN),
    ((1 << 9) | MOVE_VICE_GRIP),
    ((1 << 9) | MOVE_LEER),
    ((7 << 9) | MOVE_HARDEN),
    ((10 << 9) | MOVE_VICE_GRIP),
    ((13 << 9) | MOVE_LEER),
    ((20 << 9) | MOVE_BUBBLE_BEAM),
    ((23 << 9) | MOVE_PROTECT),
    ((26 << 9) | MOVE_KNOCK_OFF),
    ((34 << 9) | MOVE_TAUNT),
    ((39 << 9) | MOVE_CRABHAMMER),
    ((44 << 9) | MOVE_SWORDS_DANCE),
    ((52 << 9) | MOVE_GUILLOTINE),
    0xffff
};

const u16 gFeebasLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPLASH),
    ((15 << 9) | MOVE_TACKLE),
    ((30 << 9) | MOVE_FLAIL),
    0xffff
};

const u16 gMiloticLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_GUN),
    ((5 << 9) | MOVE_WRAP),
    ((10 << 9) | MOVE_WATER_SPORT),
    ((15 << 9) | MOVE_REFRESH),
    ((20 << 9) | MOVE_WATER_PULSE),
    ((25 << 9) | MOVE_TWISTER),
    ((30 << 9) | MOVE_RECOVER),
    ((35 << 9) | MOVE_RAIN_DANCE),
    ((40 << 9) | MOVE_HYDRO_PUMP),
    ((45 << 9) | MOVE_ATTRACT),
    ((50 << 9) | MOVE_SAFEGUARD),
    0xffff
};

const u16 gCarvanhaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_BITE),
    ((7 << 9) | MOVE_RAGE),
    ((13 << 9) | MOVE_FOCUS_ENERGY),
    ((16 << 9) | MOVE_SCARY_FACE),
    ((22 << 9) | MOVE_CRUNCH),
    ((28 << 9) | MOVE_SCREECH),
    ((31 << 9) | MOVE_TAKE_DOWN),
    ((37 << 9) | MOVE_SWAGGER),
    ((43 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gSharpedoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_RAGE),
    ((1 << 9) | MOVE_FOCUS_ENERGY),
    ((7 << 9) | MOVE_RAGE),
    ((13 << 9) | MOVE_FOCUS_ENERGY),
    ((16 << 9) | MOVE_SCARY_FACE),
    ((22 << 9) | MOVE_CRUNCH),
    ((28 << 9) | MOVE_SCREECH),
    ((33 << 9) | MOVE_SLASH),
    ((38 << 9) | MOVE_TAUNT),
    ((43 << 9) | MOVE_SWAGGER),
    ((48 << 9) | MOVE_SKULL_BASH),
    ((53 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gTrapinchLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BITE),
    ((9 << 9) | MOVE_SAND_ATTACK),
    ((17 << 9) | MOVE_FAINT_ATTACK),
    ((25 << 9) | MOVE_SAND_TOMB),
    ((33 << 9) | MOVE_CRUNCH),
    ((41 << 9) | MOVE_DIG),
    ((49 << 9) | MOVE_SANDSTORM),
    ((57 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gVibravaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_SAND_ATTACK),
    ((1 << 9) | MOVE_FAINT_ATTACK),
    ((1 << 9) | MOVE_SAND_TOMB),
    ((9 << 9) | MOVE_SAND_ATTACK),
    ((17 << 9) | MOVE_FAINT_ATTACK),
    ((25 << 9) | MOVE_SAND_TOMB),
    ((33 << 9) | MOVE_CRUNCH),
    ((35 << 9) | MOVE_DRAGON_BREATH),
    ((41 << 9) | MOVE_SCREECH),
    ((49 << 9) | MOVE_SANDSTORM),
    ((57 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gFlygonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_SAND_ATTACK),
    ((1 << 9) | MOVE_FAINT_ATTACK),
    ((1 << 9) | MOVE_SAND_TOMB),
    ((9 << 9) | MOVE_SAND_ATTACK),
    ((17 << 9) | MOVE_FAINT_ATTACK),
    ((25 << 9) | MOVE_SAND_TOMB),
    ((33 << 9) | MOVE_CRUNCH),
    ((35 << 9) | MOVE_DRAGON_BREATH),
    ((41 << 9) | MOVE_SCREECH),
    ((53 << 9) | MOVE_SANDSTORM),
    ((65 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gMakuhitaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_FOCUS_ENERGY),
    ((4 << 9) | MOVE_SAND_ATTACK),
    ((10 << 9) | MOVE_ARM_THRUST),
    ((13 << 9) | MOVE_VITAL_THROW),
    ((19 << 9) | MOVE_FAKE_OUT),
    ((22 << 9) | MOVE_WHIRLWIND),
    ((28 << 9) | MOVE_KNOCK_OFF),
    ((31 << 9) | MOVE_SMELLING_SALT),
    ((37 << 9) | MOVE_BELLY_DRUM),
    ((40 << 9) | MOVE_ENDURE),
    ((46 << 9) | MOVE_SEISMIC_TOSS),
    ((49 << 9) | MOVE_REVERSAL),
    0xffff
};

const u16 gHariyamaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_FOCUS_ENERGY),
    ((1 << 9) | MOVE_SAND_ATTACK),
    ((1 << 9) | MOVE_ARM_THRUST),
    ((4 << 9) | MOVE_SAND_ATTACK),
    ((10 << 9) | MOVE_ARM_THRUST),
    ((13 << 9) | MOVE_VITAL_THROW),
    ((19 << 9) | MOVE_FAKE_OUT),
    ((22 << 9) | MOVE_WHIRLWIND),
    ((29 << 9) | MOVE_KNOCK_OFF),
    ((33 << 9) | MOVE_SMELLING_SALT),
    ((40 << 9) | MOVE_BELLY_DRUM),
    ((44 << 9) | MOVE_ENDURE),
    ((51 << 9) | MOVE_SEISMIC_TOSS),
    ((55 << 9) | MOVE_REVERSAL),
    0xffff
};

const u16 gElectrikeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((4 << 9) | MOVE_THUNDER_WAVE),
    ((9 << 9) | MOVE_LEER),
    ((12 << 9) | MOVE_HOWL),
    ((17 << 9) | MOVE_QUICK_ATTACK),
    ((20 << 9) | MOVE_SPARK),
    ((25 << 9) | MOVE_ODOR_SLEUTH),
    ((28 << 9) | MOVE_ROAR),
    ((33 << 9) | MOVE_BITE),
    ((36 << 9) | MOVE_THUNDER),
    ((41 << 9) | MOVE_CHARGE),
    0xffff
};

const u16 gManectricLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_THUNDER_WAVE),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_HOWL),
    ((4 << 9) | MOVE_THUNDER_WAVE),
    ((9 << 9) | MOVE_LEER),
    ((12 << 9) | MOVE_HOWL),
    ((17 << 9) | MOVE_QUICK_ATTACK),
    ((20 << 9) | MOVE_SPARK),
    ((25 << 9) | MOVE_ODOR_SLEUTH),
    ((31 << 9) | MOVE_ROAR),
    ((39 << 9) | MOVE_BITE),
    ((45 << 9) | MOVE_THUNDER),
    ((53 << 9) | MOVE_CHARGE),
    0xffff
};

const u16 gNumelLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_TACKLE),
    ((11 << 9) | MOVE_EMBER),
    ((19 << 9) | MOVE_MAGNITUDE),
    ((25 << 9) | MOVE_FOCUS_ENERGY),
    ((29 << 9) | MOVE_TAKE_DOWN),
    ((31 << 9) | MOVE_AMNESIA),
    ((35 << 9) | MOVE_EARTHQUAKE),
    ((41 << 9) | MOVE_FLAMETHROWER),
    ((49 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gCameruptLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_EMBER),
    ((1 << 9) | MOVE_MAGNITUDE),
    ((11 << 9) | MOVE_EMBER),
    ((19 << 9) | MOVE_MAGNITUDE),
    ((25 << 9) | MOVE_FOCUS_ENERGY),
    ((29 << 9) | MOVE_TAKE_DOWN),
    ((31 << 9) | MOVE_AMNESIA),
    ((33 << 9) | MOVE_ROCK_SLIDE),
    ((37 << 9) | MOVE_EARTHQUAKE),
    ((45 << 9) | MOVE_ERUPTION),
    ((55 << 9) | MOVE_FISSURE),
    0xffff
};

const u16 gSphealLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POWDER_SNOW),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_WATER_GUN),
    ((7 << 9) | MOVE_ENCORE),
    ((13 << 9) | MOVE_ICE_BALL),
    ((19 << 9) | MOVE_BODY_SLAM),
    ((25 << 9) | MOVE_AURORA_BEAM),
    ((31 << 9) | MOVE_HAIL),
    ((37 << 9) | MOVE_REST),
    ((37 << 9) | MOVE_SNORE),
    ((43 << 9) | MOVE_BLIZZARD),
    ((49 << 9) | MOVE_SHEER_COLD),
    0xffff
};

const u16 gSealeoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POWDER_SNOW),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_WATER_GUN),
    ((1 << 9) | MOVE_ENCORE),
    ((7 << 9) | MOVE_ENCORE),
    ((13 << 9) | MOVE_ICE_BALL),
    ((19 << 9) | MOVE_BODY_SLAM),
    ((25 << 9) | MOVE_AURORA_BEAM),
    ((31 << 9) | MOVE_HAIL),
    ((39 << 9) | MOVE_REST),
    ((39 << 9) | MOVE_SNORE),
    ((47 << 9) | MOVE_BLIZZARD),
    ((55 << 9) | MOVE_SHEER_COLD),
    0xffff
};

const u16 gWalreinLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POWDER_SNOW),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_WATER_GUN),
    ((1 << 9) | MOVE_ENCORE),
    ((7 << 9) | MOVE_ENCORE),
    ((13 << 9) | MOVE_ICE_BALL),
    ((19 << 9) | MOVE_BODY_SLAM),
    ((25 << 9) | MOVE_AURORA_BEAM),
    ((31 << 9) | MOVE_HAIL),
    ((39 << 9) | MOVE_REST),
    ((39 << 9) | MOVE_SNORE),
    ((50 << 9) | MOVE_BLIZZARD),
    ((61 << 9) | MOVE_SHEER_COLD),
    0xffff
};

const u16 gCacneaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_STING),
    ((1 << 9) | MOVE_LEER),
    ((5 << 9) | MOVE_ABSORB),
    ((9 << 9) | MOVE_GROWTH),
    ((13 << 9) | MOVE_LEECH_SEED),
    ((17 << 9) | MOVE_SAND_ATTACK),
    ((21 << 9) | MOVE_PIN_MISSILE),
    ((25 << 9) | MOVE_INGRAIN),
    ((29 << 9) | MOVE_FAINT_ATTACK),
    ((33 << 9) | MOVE_SPIKES),
    ((37 << 9) | MOVE_NEEDLE_ARM),
    ((41 << 9) | MOVE_COTTON_SPORE),
    ((45 << 9) | MOVE_SANDSTORM),
    0xffff
};

const u16 gCacturneLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POISON_STING),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_ABSORB),
    ((1 << 9) | MOVE_GROWTH),
    ((5 << 9) | MOVE_ABSORB),
    ((9 << 9) | MOVE_GROWTH),
    ((13 << 9) | MOVE_LEECH_SEED),
    ((17 << 9) | MOVE_SAND_ATTACK),
    ((21 << 9) | MOVE_PIN_MISSILE),
    ((25 << 9) | MOVE_INGRAIN),
    ((29 << 9) | MOVE_FAINT_ATTACK),
    ((35 << 9) | MOVE_SPIKES),
    ((41 << 9) | MOVE_NEEDLE_ARM),
    ((47 << 9) | MOVE_COTTON_SPORE),
    ((53 << 9) | MOVE_SANDSTORM),
    0xffff
};

const u16 gSnoruntLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POWDER_SNOW),
    ((1 << 9) | MOVE_LEER),
    ((7 << 9) | MOVE_DOUBLE_TEAM),
    ((10 << 9) | MOVE_BITE),
    ((16 << 9) | MOVE_ICY_WIND),
    ((19 << 9) | MOVE_HEADBUTT),
    ((25 << 9) | MOVE_PROTECT),
    ((28 << 9) | MOVE_CRUNCH),
    ((34 << 9) | MOVE_ICE_BEAM),
    ((37 << 9) | MOVE_HAIL),
    ((43 << 9) | MOVE_BLIZZARD),
    0xffff
};

const u16 gGlalieLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POWDER_SNOW),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_DOUBLE_TEAM),
    ((1 << 9) | MOVE_BITE),
    ((7 << 9) | MOVE_DOUBLE_TEAM),
    ((10 << 9) | MOVE_BITE),
    ((16 << 9) | MOVE_ICY_WIND),
    ((19 << 9) | MOVE_HEADBUTT),
    ((25 << 9) | MOVE_PROTECT),
    ((28 << 9) | MOVE_CRUNCH),
    ((34 << 9) | MOVE_ICE_BEAM),
    ((42 << 9) | MOVE_HAIL),
    ((53 << 9) | MOVE_BLIZZARD),
    ((61 << 9) | MOVE_SHEER_COLD),
    0xffff
};

const u16 gLunatoneLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_HARDEN),
    ((7 << 9) | MOVE_CONFUSION),
    ((13 << 9) | MOVE_ROCK_THROW),
    ((19 << 9) | MOVE_HYPNOSIS),
    ((25 << 9) | MOVE_PSYWAVE),
    ((31 << 9) | MOVE_COSMIC_POWER),
    ((37 << 9) | MOVE_PSYCHIC),
    ((43 << 9) | MOVE_FUTURE_SIGHT),
    ((49 << 9) | MOVE_EXPLOSION),
    0xffff
};

const u16 gSolrockLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_HARDEN),
    ((7 << 9) | MOVE_CONFUSION),
    ((13 << 9) | MOVE_ROCK_THROW),
    ((19 << 9) | MOVE_FIRE_SPIN),
    ((25 << 9) | MOVE_PSYWAVE),
    ((31 << 9) | MOVE_COSMIC_POWER),
    ((37 << 9) | MOVE_ROCK_SLIDE),
    ((43 << 9) | MOVE_SOLAR_BEAM),
    ((49 << 9) | MOVE_EXPLOSION),
    0xffff
};

const u16 gAzurillLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPLASH),
    ((3 << 9) | MOVE_CHARM),
    ((6 << 9) | MOVE_TAIL_WHIP),
    ((10 << 9) | MOVE_BUBBLE),
    ((15 << 9) | MOVE_SLAM),
    ((21 << 9) | MOVE_WATER_GUN),
    0xffff
};

const u16 gSpoinkLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPLASH),
    ((7 << 9) | MOVE_PSYWAVE),
    ((10 << 9) | MOVE_ODOR_SLEUTH),
    ((16 << 9) | MOVE_PSYBEAM),
    ((19 << 9) | MOVE_PSYCH_UP),
    ((25 << 9) | MOVE_CONFUSE_RAY),
    ((28 << 9) | MOVE_MAGIC_COAT),
    ((34 << 9) | MOVE_PSYCHIC),
    ((37 << 9) | MOVE_REST),
    ((37 << 9) | MOVE_SNORE),
    ((43 << 9) | MOVE_BOUNCE),
    0xffff
};

const u16 gGrumpigLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPLASH),
    ((1 << 9) | MOVE_PSYWAVE),
    ((1 << 9) | MOVE_ODOR_SLEUTH),
    ((1 << 9) | MOVE_PSYBEAM),
    ((7 << 9) | MOVE_PSYWAVE),
    ((10 << 9) | MOVE_ODOR_SLEUTH),
    ((16 << 9) | MOVE_PSYBEAM),
    ((19 << 9) | MOVE_PSYCH_UP),
    ((25 << 9) | MOVE_CONFUSE_RAY),
    ((28 << 9) | MOVE_MAGIC_COAT),
    ((37 << 9) | MOVE_PSYCHIC),
    ((43 << 9) | MOVE_REST),
    ((43 << 9) | MOVE_SNORE),
    ((55 << 9) | MOVE_BOUNCE),
    0xffff
};

const u16 gPlusleLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((4 << 9) | MOVE_THUNDER_WAVE),
    ((10 << 9) | MOVE_QUICK_ATTACK),
    ((13 << 9) | MOVE_HELPING_HAND),
    ((19 << 9) | MOVE_SPARK),
    ((22 << 9) | MOVE_ENCORE),
    ((28 << 9) | MOVE_FAKE_TEARS),
    ((31 << 9) | MOVE_CHARGE),
    ((37 << 9) | MOVE_THUNDER),
    ((40 << 9) | MOVE_BATON_PASS),
    ((47 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gMinunLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((4 << 9) | MOVE_THUNDER_WAVE),
    ((10 << 9) | MOVE_QUICK_ATTACK),
    ((13 << 9) | MOVE_HELPING_HAND),
    ((19 << 9) | MOVE_SPARK),
    ((22 << 9) | MOVE_ENCORE),
    ((28 << 9) | MOVE_CHARM),
    ((31 << 9) | MOVE_CHARGE),
    ((37 << 9) | MOVE_THUNDER),
    ((40 << 9) | MOVE_BATON_PASS),
    ((47 << 9) | MOVE_AGILITY),
    0xffff
};

const u16 gMawileLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ASTONISH),
    ((6 << 9) | MOVE_FAKE_TEARS),
    ((11 << 9) | MOVE_BITE),
    ((16 << 9) | MOVE_SWEET_SCENT),
    ((21 << 9) | MOVE_VICE_GRIP),
    ((26 << 9) | MOVE_FAINT_ATTACK),
    ((31 << 9) | MOVE_BATON_PASS),
    ((36 << 9) | MOVE_CRUNCH),
    ((41 << 9) | MOVE_IRON_DEFENSE),
    ((46 << 9) | MOVE_STOCKPILE),
    ((46 << 9) | MOVE_SWALLOW),
    ((46 << 9) | MOVE_SPIT_UP),
    0xffff
};

const u16 gMedititeLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BIDE),
    ((4 << 9) | MOVE_MEDITATE),
    ((9 << 9) | MOVE_CONFUSION),
    ((12 << 9) | MOVE_DETECT),
    ((18 << 9) | MOVE_HIDDEN_POWER),
    ((22 << 9) | MOVE_MIND_READER),
    ((28 << 9) | MOVE_CALM_MIND),
    ((32 << 9) | MOVE_HI_JUMP_KICK),
    ((38 << 9) | MOVE_PSYCH_UP),
    ((42 << 9) | MOVE_REVERSAL),
    ((48 << 9) | MOVE_RECOVER),
    0xffff
};

const u16 gMedichamLevelUpLearnset[] = {
    ((1 << 9) | MOVE_FIRE_PUNCH),
    ((1 << 9) | MOVE_THUNDER_PUNCH),
    ((1 << 9) | MOVE_ICE_PUNCH),
    ((1 << 9) | MOVE_BIDE),
    ((1 << 9) | MOVE_MEDITATE),
    ((1 << 9) | MOVE_CONFUSION),
    ((1 << 9) | MOVE_DETECT),
    ((4 << 9) | MOVE_MEDITATE),
    ((9 << 9) | MOVE_CONFUSION),
    ((12 << 9) | MOVE_DETECT),
    ((18 << 9) | MOVE_HIDDEN_POWER),
    ((22 << 9) | MOVE_MIND_READER),
    ((28 << 9) | MOVE_CALM_MIND),
    ((32 << 9) | MOVE_HI_JUMP_KICK),
    ((40 << 9) | MOVE_PSYCH_UP),
    ((46 << 9) | MOVE_REVERSAL),
    ((54 << 9) | MOVE_RECOVER),
    0xffff
};

const u16 gSwabluLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_GROWL),
    ((8 << 9) | MOVE_ASTONISH),
    ((11 << 9) | MOVE_SING),
    ((18 << 9) | MOVE_FURY_ATTACK),
    ((21 << 9) | MOVE_SAFEGUARD),
    ((28 << 9) | MOVE_MIST),
    ((31 << 9) | MOVE_TAKE_DOWN),
    ((38 << 9) | MOVE_MIRROR_MOVE),
    ((41 << 9) | MOVE_REFRESH),
    ((48 << 9) | MOVE_PERISH_SONG),
    0xffff
};

const u16 gAltariaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PECK),
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_ASTONISH),
    ((1 << 9) | MOVE_SING),
    ((8 << 9) | MOVE_ASTONISH),
    ((11 << 9) | MOVE_SING),
    ((18 << 9) | MOVE_FURY_ATTACK),
    ((21 << 9) | MOVE_SAFEGUARD),
    ((28 << 9) | MOVE_MIST),
    ((31 << 9) | MOVE_TAKE_DOWN),
    ((35 << 9) | MOVE_DRAGON_BREATH),
    ((40 << 9) | MOVE_DRAGON_DANCE),
    ((45 << 9) | MOVE_REFRESH),
    ((54 << 9) | MOVE_PERISH_SONG),
    ((59 << 9) | MOVE_SKY_ATTACK),
    0xffff
};

const u16 gWynautLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SPLASH),
    ((1 << 9) | MOVE_CHARM),
    ((1 << 9) | MOVE_ENCORE),
    ((15 << 9) | MOVE_COUNTER),
    ((15 << 9) | MOVE_MIRROR_COAT),
    ((15 << 9) | MOVE_SAFEGUARD),
    ((15 << 9) | MOVE_DESTINY_BOND),
    0xffff
};

const u16 gDuskullLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_NIGHT_SHADE),
    ((5 << 9) | MOVE_DISABLE),
    ((12 << 9) | MOVE_FORESIGHT),
    ((16 << 9) | MOVE_ASTONISH),
    ((23 << 9) | MOVE_CONFUSE_RAY),
    ((27 << 9) | MOVE_PURSUIT),
    ((34 << 9) | MOVE_CURSE),
    ((38 << 9) | MOVE_WILL_O_WISP),
    ((45 << 9) | MOVE_MEAN_LOOK),
    ((49 << 9) | MOVE_FUTURE_SIGHT),
    0xffff
};

const u16 gDusclopsLevelUpLearnset[] = {
    ((1 << 9) | MOVE_BIND),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_NIGHT_SHADE),
    ((1 << 9) | MOVE_DISABLE),
    ((5 << 9) | MOVE_DISABLE),
    ((12 << 9) | MOVE_FORESIGHT),
    ((16 << 9) | MOVE_ASTONISH),
    ((23 << 9) | MOVE_CONFUSE_RAY),
    ((27 << 9) | MOVE_PURSUIT),
    ((34 << 9) | MOVE_CURSE),
    ((37 << 9) | MOVE_SHADOW_PUNCH),
    ((41 << 9) | MOVE_WILL_O_WISP),
    ((51 << 9) | MOVE_MEAN_LOOK),
    ((58 << 9) | MOVE_FUTURE_SIGHT),
    0xffff
};

const u16 gRoseliaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ABSORB),
    ((5 << 9) | MOVE_GROWTH),
    ((9 << 9) | MOVE_POISON_STING),
    ((13 << 9) | MOVE_STUN_SPORE),
    ((17 << 9) | MOVE_MEGA_DRAIN),
    ((21 << 9) | MOVE_LEECH_SEED),
    ((25 << 9) | MOVE_MAGICAL_LEAF),
    ((29 << 9) | MOVE_GRASS_WHISTLE),
    ((33 << 9) | MOVE_GIGA_DRAIN),
    ((37 << 9) | MOVE_SWEET_SCENT),
    ((41 << 9) | MOVE_INGRAIN),
    ((45 << 9) | MOVE_TOXIC),
    ((49 << 9) | MOVE_PETAL_DANCE),
    ((53 << 9) | MOVE_AROMATHERAPY),
    ((57 << 9) | MOVE_SYNTHESIS),
    0xffff
};

const u16 gSlakothLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_YAWN),
    ((7 << 9) | MOVE_ENCORE),
    ((13 << 9) | MOVE_SLACK_OFF),
    ((19 << 9) | MOVE_FAINT_ATTACK),
    ((25 << 9) | MOVE_AMNESIA),
    ((31 << 9) | MOVE_COVET),
    ((37 << 9) | MOVE_COUNTER),
    ((43 << 9) | MOVE_FLAIL),
    0xffff
};

const u16 gVigorothLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_FOCUS_ENERGY),
    ((1 << 9) | MOVE_ENCORE),
    ((1 << 9) | MOVE_UPROAR),
    ((7 << 9) | MOVE_ENCORE),
    ((13 << 9) | MOVE_UPROAR),
    ((19 << 9) | MOVE_FURY_SWIPES),
    ((25 << 9) | MOVE_ENDURE),
    ((31 << 9) | MOVE_SLASH),
    ((37 << 9) | MOVE_COUNTER),
    ((43 << 9) | MOVE_FOCUS_PUNCH),
    ((49 << 9) | MOVE_REVERSAL),
    0xffff
};

const u16 gSlakingLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_YAWN),
    ((1 << 9) | MOVE_ENCORE),
    ((1 << 9) | MOVE_SLACK_OFF),
    ((7 << 9) | MOVE_ENCORE),
    ((13 << 9) | MOVE_SLACK_OFF),
    ((19 << 9) | MOVE_FAINT_ATTACK),
    ((25 << 9) | MOVE_AMNESIA),
    ((31 << 9) | MOVE_COVET),
    ((36 << 9) | MOVE_SWAGGER),
    ((37 << 9) | MOVE_COUNTER),
    ((43 << 9) | MOVE_FLAIL),
    0xffff
};

const u16 gGulpinLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((6 << 9) | MOVE_YAWN),
    ((9 << 9) | MOVE_POISON_GAS),
    ((14 << 9) | MOVE_SLUDGE),
    ((17 << 9) | MOVE_AMNESIA),
    ((23 << 9) | MOVE_ENCORE),
    ((28 << 9) | MOVE_TOXIC),
    ((34 << 9) | MOVE_STOCKPILE),
    ((34 << 9) | MOVE_SPIT_UP),
    ((34 << 9) | MOVE_SWALLOW),
    ((39 << 9) | MOVE_SLUDGE_BOMB),
    0xffff
};

const u16 gSwalotLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_YAWN),
    ((1 << 9) | MOVE_POISON_GAS),
    ((1 << 9) | MOVE_SLUDGE),
    ((6 << 9) | MOVE_YAWN),
    ((9 << 9) | MOVE_POISON_GAS),
    ((14 << 9) | MOVE_SLUDGE),
    ((17 << 9) | MOVE_AMNESIA),
    ((23 << 9) | MOVE_ENCORE),
    ((26 << 9) | MOVE_BODY_SLAM),
    ((31 << 9) | MOVE_TOXIC),
    ((40 << 9) | MOVE_STOCKPILE),
    ((40 << 9) | MOVE_SPIT_UP),
    ((40 << 9) | MOVE_SWALLOW),
    ((48 << 9) | MOVE_SLUDGE_BOMB),
    0xffff
};

const u16 gTropiusLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_GUST),
    ((7 << 9) | MOVE_GROWTH),
    ((11 << 9) | MOVE_RAZOR_LEAF),
    ((17 << 9) | MOVE_STOMP),
    ((21 << 9) | MOVE_SWEET_SCENT),
    ((27 << 9) | MOVE_WHIRLWIND),
    ((31 << 9) | MOVE_MAGICAL_LEAF),
    ((37 << 9) | MOVE_BODY_SLAM),
    ((41 << 9) | MOVE_SOLAR_BEAM),
    ((47 << 9) | MOVE_SYNTHESIS),
    0xffff
};

const u16 gWhismurLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((5 << 9) | MOVE_UPROAR),
    ((11 << 9) | MOVE_ASTONISH),
    ((15 << 9) | MOVE_HOWL),
    ((21 << 9) | MOVE_SUPERSONIC),
    ((25 << 9) | MOVE_STOMP),
    ((31 << 9) | MOVE_SCREECH),
    ((35 << 9) | MOVE_ROAR),
    ((41 << 9) | MOVE_REST),
    ((41 << 9) | MOVE_SLEEP_TALK),
    ((45 << 9) | MOVE_HYPER_VOICE),
    0xffff
};

const u16 gLoudredLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_UPROAR),
    ((1 << 9) | MOVE_ASTONISH),
    ((1 << 9) | MOVE_HOWL),
    ((5 << 9) | MOVE_UPROAR),
    ((11 << 9) | MOVE_ASTONISH),
    ((15 << 9) | MOVE_HOWL),
    ((23 << 9) | MOVE_SUPERSONIC),
    ((29 << 9) | MOVE_STOMP),
    ((37 << 9) | MOVE_SCREECH),
    ((43 << 9) | MOVE_ROAR),
    ((51 << 9) | MOVE_REST),
    ((51 << 9) | MOVE_SLEEP_TALK),
    ((57 << 9) | MOVE_HYPER_VOICE),
    0xffff
};

const u16 gExploudLevelUpLearnset[] = {
    ((1 << 9) | MOVE_POUND),
    ((1 << 9) | MOVE_UPROAR),
    ((1 << 9) | MOVE_ASTONISH),
    ((1 << 9) | MOVE_HOWL),
    ((5 << 9) | MOVE_UPROAR),
    ((11 << 9) | MOVE_ASTONISH),
    ((15 << 9) | MOVE_HOWL),
    ((23 << 9) | MOVE_SUPERSONIC),
    ((29 << 9) | MOVE_STOMP),
    ((37 << 9) | MOVE_SCREECH),
    ((40 << 9) | MOVE_HYPER_BEAM),
    ((45 << 9) | MOVE_ROAR),
    ((55 << 9) | MOVE_REST),
    ((55 << 9) | MOVE_SLEEP_TALK),
    ((63 << 9) | MOVE_HYPER_VOICE),
    0xffff
};

const u16 gClamperlLevelUpLearnset[] = {
    ((1 << 9) | MOVE_CLAMP),
    ((1 << 9) | MOVE_WATER_GUN),
    ((1 << 9) | MOVE_WHIRLPOOL),
    ((1 << 9) | MOVE_IRON_DEFENSE),
    0xffff
};

const u16 gHuntailLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WHIRLPOOL),
    ((8 << 9) | MOVE_BITE),
    ((15 << 9) | MOVE_SCREECH),
    ((22 << 9) | MOVE_WATER_PULSE),
    ((29 << 9) | MOVE_SCARY_FACE),
    ((36 << 9) | MOVE_CRUNCH),
    ((43 << 9) | MOVE_BATON_PASS),
    ((50 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gGorebyssLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WHIRLPOOL),
    ((8 << 9) | MOVE_CONFUSION),
    ((15 << 9) | MOVE_AGILITY),
    ((22 << 9) | MOVE_WATER_PULSE),
    ((29 << 9) | MOVE_AMNESIA),
    ((36 << 9) | MOVE_PSYCHIC),
    ((43 << 9) | MOVE_BATON_PASS),
    ((50 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gAbsolLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((5 << 9) | MOVE_LEER),
    ((9 << 9) | MOVE_TAUNT),
    ((13 << 9) | MOVE_QUICK_ATTACK),
    ((17 << 9) | MOVE_RAZOR_WIND),
    ((21 << 9) | MOVE_BITE),
    ((26 << 9) | MOVE_SWORDS_DANCE),
    ((31 << 9) | MOVE_DOUBLE_TEAM),
    ((36 << 9) | MOVE_SLASH),
    ((41 << 9) | MOVE_FUTURE_SIGHT),
    ((46 << 9) | MOVE_PERISH_SONG),
    0xffff
};

const u16 gShuppetLevelUpLearnset[] = {
    ((1 << 9) | MOVE_KNOCK_OFF),
    ((8 << 9) | MOVE_SCREECH),
    ((13 << 9) | MOVE_NIGHT_SHADE),
    ((20 << 9) | MOVE_CURSE),
    ((25 << 9) | MOVE_SPITE),
    ((32 << 9) | MOVE_WILL_O_WISP),
    ((37 << 9) | MOVE_FAINT_ATTACK),
    ((44 << 9) | MOVE_SHADOW_BALL),
    ((49 << 9) | MOVE_SNATCH),
    ((56 << 9) | MOVE_GRUDGE),
    0xffff
};

const u16 gBanetteLevelUpLearnset[] = {
    ((1 << 9) | MOVE_KNOCK_OFF),
    ((1 << 9) | MOVE_SCREECH),
    ((1 << 9) | MOVE_NIGHT_SHADE),
    ((1 << 9) | MOVE_CURSE),
    ((8 << 9) | MOVE_SCREECH),
    ((13 << 9) | MOVE_NIGHT_SHADE),
    ((20 << 9) | MOVE_CURSE),
    ((25 << 9) | MOVE_SPITE),
    ((32 << 9) | MOVE_WILL_O_WISP),
    ((39 << 9) | MOVE_FAINT_ATTACK),
    ((48 << 9) | MOVE_SHADOW_BALL),
    ((55 << 9) | MOVE_SNATCH),
    ((64 << 9) | MOVE_GRUDGE),
    0xffff
};

const u16 gSeviperLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WRAP),
    ((7 << 9) | MOVE_LICK),
    ((10 << 9) | MOVE_BITE),
    ((16 << 9) | MOVE_POISON_TAIL),
    ((19 << 9) | MOVE_SCREECH),
    ((25 << 9) | MOVE_GLARE),
    ((28 << 9) | MOVE_CRUNCH),
    ((34 << 9) | MOVE_POISON_FANG),
    ((37 << 9) | MOVE_SWAGGER),
    ((43 << 9) | MOVE_HAZE),
    0xffff
};

const u16 gZangooseLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((4 << 9) | MOVE_LEER),
    ((7 << 9) | MOVE_QUICK_ATTACK),
    ((10 << 9) | MOVE_SWORDS_DANCE),
    ((13 << 9) | MOVE_FURY_CUTTER),
    ((19 << 9) | MOVE_SLASH),
    ((25 << 9) | MOVE_PURSUIT),
    ((31 << 9) | MOVE_CRUSH_CLAW),
    ((37 << 9) | MOVE_TAUNT),
    ((46 << 9) | MOVE_DETECT),
    ((55 << 9) | MOVE_FALSE_SWIPE),
    0xffff
};

const u16 gRelicanthLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_HARDEN),
    ((8 << 9) | MOVE_WATER_GUN),
    ((15 << 9) | MOVE_ROCK_TOMB),
    ((22 << 9) | MOVE_YAWN),
    ((29 << 9) | MOVE_TAKE_DOWN),
    ((36 << 9) | MOVE_MUD_SPORT),
    ((43 << 9) | MOVE_ANCIENT_POWER),
    ((50 << 9) | MOVE_REST),
    ((57 << 9) | MOVE_DOUBLE_EDGE),
    ((64 << 9) | MOVE_HYDRO_PUMP),
    0xffff
};

const u16 gAronLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((4 << 9) | MOVE_HARDEN),
    ((7 << 9) | MOVE_MUD_SLAP),
    ((10 << 9) | MOVE_HEADBUTT),
    ((13 << 9) | MOVE_METAL_CLAW),
    ((17 << 9) | MOVE_IRON_DEFENSE),
    ((21 << 9) | MOVE_ROAR),
    ((25 << 9) | MOVE_TAKE_DOWN),
    ((29 << 9) | MOVE_IRON_TAIL),
    ((34 << 9) | MOVE_PROTECT),
    ((39 << 9) | MOVE_METAL_SOUND),
    ((44 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gLaironLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_HARDEN),
    ((1 << 9) | MOVE_MUD_SLAP),
    ((1 << 9) | MOVE_HEADBUTT),
    ((4 << 9) | MOVE_HARDEN),
    ((7 << 9) | MOVE_MUD_SLAP),
    ((10 << 9) | MOVE_HEADBUTT),
    ((13 << 9) | MOVE_METAL_CLAW),
    ((17 << 9) | MOVE_IRON_DEFENSE),
    ((21 << 9) | MOVE_ROAR),
    ((25 << 9) | MOVE_TAKE_DOWN),
    ((29 << 9) | MOVE_IRON_TAIL),
    ((37 << 9) | MOVE_PROTECT),
    ((45 << 9) | MOVE_METAL_SOUND),
    ((53 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gAggronLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((1 << 9) | MOVE_HARDEN),
    ((1 << 9) | MOVE_MUD_SLAP),
    ((1 << 9) | MOVE_HEADBUTT),
    ((4 << 9) | MOVE_HARDEN),
    ((7 << 9) | MOVE_MUD_SLAP),
    ((10 << 9) | MOVE_HEADBUTT),
    ((13 << 9) | MOVE_METAL_CLAW),
    ((17 << 9) | MOVE_IRON_DEFENSE),
    ((21 << 9) | MOVE_ROAR),
    ((25 << 9) | MOVE_TAKE_DOWN),
    ((29 << 9) | MOVE_IRON_TAIL),
    ((37 << 9) | MOVE_PROTECT),
    ((50 << 9) | MOVE_METAL_SOUND),
    ((63 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gCastformLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((10 << 9) | MOVE_WATER_GUN),
    ((10 << 9) | MOVE_EMBER),
    ((10 << 9) | MOVE_POWDER_SNOW),
    ((20 << 9) | MOVE_RAIN_DANCE),
    ((20 << 9) | MOVE_SUNNY_DAY),
    ((20 << 9) | MOVE_HAIL),
    ((30 << 9) | MOVE_WEATHER_BALL),
    0xffff
};

const u16 gVolbeatLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((5 << 9) | MOVE_CONFUSE_RAY),
    ((9 << 9) | MOVE_DOUBLE_TEAM),
    ((13 << 9) | MOVE_MOONLIGHT),
    ((17 << 9) | MOVE_QUICK_ATTACK),
    ((21 << 9) | MOVE_TAIL_GLOW),
    ((25 << 9) | MOVE_SIGNAL_BEAM),
    ((29 << 9) | MOVE_PROTECT),
    ((33 << 9) | MOVE_HELPING_HAND),
    ((37 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gIllumiseLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TACKLE),
    ((5 << 9) | MOVE_SWEET_SCENT),
    ((9 << 9) | MOVE_CHARM),
    ((13 << 9) | MOVE_MOONLIGHT),
    ((17 << 9) | MOVE_QUICK_ATTACK),
    ((21 << 9) | MOVE_WISH),
    ((25 << 9) | MOVE_ENCORE),
    ((29 << 9) | MOVE_FLATTER),
    ((33 << 9) | MOVE_HELPING_HAND),
    ((37 << 9) | MOVE_COVET),
    0xffff
};

const u16 gLileepLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ASTONISH),
    ((8 << 9) | MOVE_CONSTRICT),
    ((15 << 9) | MOVE_ACID),
    ((22 << 9) | MOVE_INGRAIN),
    ((29 << 9) | MOVE_CONFUSE_RAY),
    ((36 << 9) | MOVE_AMNESIA),
    ((43 << 9) | MOVE_ANCIENT_POWER),
    ((50 << 9) | MOVE_STOCKPILE),
    ((50 << 9) | MOVE_SPIT_UP),
    ((50 << 9) | MOVE_SWALLOW),
    0xffff
};

const u16 gCradilyLevelUpLearnset[] = {
    ((1 << 9) | MOVE_ASTONISH),
    ((1 << 9) | MOVE_CONSTRICT),
    ((1 << 9) | MOVE_ACID),
    ((1 << 9) | MOVE_INGRAIN),
    ((8 << 9) | MOVE_CONSTRICT),
    ((15 << 9) | MOVE_ACID),
    ((22 << 9) | MOVE_INGRAIN),
    ((29 << 9) | MOVE_CONFUSE_RAY),
    ((36 << 9) | MOVE_AMNESIA),
    ((48 << 9) | MOVE_ANCIENT_POWER),
    ((60 << 9) | MOVE_STOCKPILE),
    ((60 << 9) | MOVE_SPIT_UP),
    ((60 << 9) | MOVE_SWALLOW),
    0xffff
};

const u16 gAnorithLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((7 << 9) | MOVE_HARDEN),
    ((13 << 9) | MOVE_MUD_SPORT),
    ((19 << 9) | MOVE_WATER_GUN),
    ((25 << 9) | MOVE_METAL_CLAW),
    ((31 << 9) | MOVE_PROTECT),
    ((37 << 9) | MOVE_ANCIENT_POWER),
    ((43 << 9) | MOVE_FURY_CUTTER),
    ((49 << 9) | MOVE_SLASH),
    ((55 << 9) | MOVE_ROCK_BLAST),
    0xffff
};

const u16 gArmaldoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_SCRATCH),
    ((1 << 9) | MOVE_HARDEN),
    ((1 << 9) | MOVE_MUD_SPORT),
    ((1 << 9) | MOVE_WATER_GUN),
    ((7 << 9) | MOVE_HARDEN),
    ((13 << 9) | MOVE_MUD_SPORT),
    ((19 << 9) | MOVE_WATER_GUN),
    ((25 << 9) | MOVE_METAL_CLAW),
    ((31 << 9) | MOVE_PROTECT),
    ((37 << 9) | MOVE_ANCIENT_POWER),
    ((46 << 9) | MOVE_FURY_CUTTER),
    ((55 << 9) | MOVE_SLASH),
    ((64 << 9) | MOVE_ROCK_BLAST),
    0xffff
};

const u16 gRaltsLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((6 << 9) | MOVE_CONFUSION),
    ((11 << 9) | MOVE_DOUBLE_TEAM),
    ((16 << 9) | MOVE_TELEPORT),
    ((21 << 9) | MOVE_CALM_MIND),
    ((26 << 9) | MOVE_PSYCHIC),
    ((31 << 9) | MOVE_IMPRISON),
    ((36 << 9) | MOVE_FUTURE_SIGHT),
    ((41 << 9) | MOVE_HYPNOSIS),
    ((46 << 9) | MOVE_DREAM_EATER),
    0xffff
};

const u16 gKirliaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_CONFUSION),
    ((1 << 9) | MOVE_DOUBLE_TEAM),
    ((1 << 9) | MOVE_TELEPORT),
    ((6 << 9) | MOVE_CONFUSION),
    ((11 << 9) | MOVE_DOUBLE_TEAM),
    ((16 << 9) | MOVE_TELEPORT),
    ((21 << 9) | MOVE_CALM_MIND),
    ((26 << 9) | MOVE_PSYCHIC),
    ((33 << 9) | MOVE_IMPRISON),
    ((40 << 9) | MOVE_FUTURE_SIGHT),
    ((47 << 9) | MOVE_HYPNOSIS),
    ((54 << 9) | MOVE_DREAM_EATER),
    0xffff
};

const u16 gGardevoirLevelUpLearnset[] = {
    ((1 << 9) | MOVE_GROWL),
    ((1 << 9) | MOVE_CONFUSION),
    ((1 << 9) | MOVE_DOUBLE_TEAM),
    ((1 << 9) | MOVE_TELEPORT),
    ((6 << 9) | MOVE_CONFUSION),
    ((11 << 9) | MOVE_DOUBLE_TEAM),
    ((16 << 9) | MOVE_TELEPORT),
    ((21 << 9) | MOVE_CALM_MIND),
    ((26 << 9) | MOVE_PSYCHIC),
    ((33 << 9) | MOVE_IMPRISON),
    ((42 << 9) | MOVE_FUTURE_SIGHT),
    ((51 << 9) | MOVE_HYPNOSIS),
    ((60 << 9) | MOVE_DREAM_EATER),
    0xffff
};

const u16 gBagonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_RAGE),
    ((5 << 9) | MOVE_BITE),
    ((9 << 9) | MOVE_LEER),
    ((17 << 9) | MOVE_HEADBUTT),
    ((21 << 9) | MOVE_FOCUS_ENERGY),
    ((25 << 9) | MOVE_EMBER),
    ((33 << 9) | MOVE_DRAGON_BREATH),
    ((37 << 9) | MOVE_SCARY_FACE),
    ((41 << 9) | MOVE_CRUNCH),
    ((49 << 9) | MOVE_DRAGON_CLAW),
    ((53 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gShelgonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_RAGE),
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_HEADBUTT),
    ((5 << 9) | MOVE_BITE),
    ((9 << 9) | MOVE_LEER),
    ((17 << 9) | MOVE_HEADBUTT),
    ((21 << 9) | MOVE_FOCUS_ENERGY),
    ((25 << 9) | MOVE_EMBER),
    ((30 << 9) | MOVE_PROTECT),
    ((38 << 9) | MOVE_DRAGON_BREATH),
    ((47 << 9) | MOVE_SCARY_FACE),
    ((56 << 9) | MOVE_CRUNCH),
    ((69 << 9) | MOVE_DRAGON_CLAW),
    ((78 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gSalamenceLevelUpLearnset[] = {
    ((1 << 9) | MOVE_RAGE),
    ((1 << 9) | MOVE_BITE),
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_HEADBUTT),
    ((5 << 9) | MOVE_BITE),
    ((9 << 9) | MOVE_LEER),
    ((17 << 9) | MOVE_HEADBUTT),
    ((21 << 9) | MOVE_FOCUS_ENERGY),
    ((25 << 9) | MOVE_EMBER),
    ((30 << 9) | MOVE_PROTECT),
    ((38 << 9) | MOVE_DRAGON_BREATH),
    ((47 << 9) | MOVE_SCARY_FACE),
    ((50 << 9) | MOVE_FLY),
    ((61 << 9) | MOVE_CRUNCH),
    ((79 << 9) | MOVE_DRAGON_CLAW),
    ((93 << 9) | MOVE_DOUBLE_EDGE),
    0xffff
};

const u16 gBeldumLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TAKE_DOWN),
    0xffff
};

const u16 gMetangLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TAKE_DOWN),
    ((20 << 9) | MOVE_CONFUSION),
    ((20 << 9) | MOVE_METAL_CLAW),
    ((26 << 9) | MOVE_SCARY_FACE),
    ((32 << 9) | MOVE_PURSUIT),
    ((38 << 9) | MOVE_PSYCHIC),
    ((44 << 9) | MOVE_IRON_DEFENSE),
    ((50 << 9) | MOVE_METEOR_MASH),
    ((56 << 9) | MOVE_AGILITY),
    ((62 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gMetagrossLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TAKE_DOWN),
    ((1 << 9) | MOVE_CONFUSION),
    ((1 << 9) | MOVE_METAL_CLAW),
    ((1 << 9) | MOVE_SCARY_FACE),
    ((20 << 9) | MOVE_CONFUSION),
    ((20 << 9) | MOVE_METAL_CLAW),
    ((26 << 9) | MOVE_SCARY_FACE),
    ((32 << 9) | MOVE_PURSUIT),
    ((38 << 9) | MOVE_PSYCHIC),
    ((44 << 9) | MOVE_IRON_DEFENSE),
    ((55 << 9) | MOVE_METEOR_MASH),
    ((66 << 9) | MOVE_AGILITY),
    ((77 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gRegirockLevelUpLearnset[] = {
    ((1 << 9) | MOVE_EXPLOSION),
    ((9 << 9) | MOVE_ROCK_THROW),
    ((17 << 9) | MOVE_CURSE),
    ((25 << 9) | MOVE_SUPERPOWER),
    ((33 << 9) | MOVE_ANCIENT_POWER),
    ((41 << 9) | MOVE_IRON_DEFENSE),
    ((49 << 9) | MOVE_ZAP_CANNON),
    ((57 << 9) | MOVE_LOCK_ON),
    ((65 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gRegiceLevelUpLearnset[] = {
    ((1 << 9) | MOVE_EXPLOSION),
    ((9 << 9) | MOVE_ICY_WIND),
    ((17 << 9) | MOVE_CURSE),
    ((25 << 9) | MOVE_SUPERPOWER),
    ((33 << 9) | MOVE_ANCIENT_POWER),
    ((41 << 9) | MOVE_AMNESIA),
    ((49 << 9) | MOVE_ZAP_CANNON),
    ((57 << 9) | MOVE_LOCK_ON),
    ((65 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gRegisteelLevelUpLearnset[] = {
    ((1 << 9) | MOVE_EXPLOSION),
    ((9 << 9) | MOVE_METAL_CLAW),
    ((17 << 9) | MOVE_CURSE),
    ((25 << 9) | MOVE_SUPERPOWER),
    ((33 << 9) | MOVE_ANCIENT_POWER),
    ((41 << 9) | MOVE_IRON_DEFENSE),
    ((41 << 9) | MOVE_AMNESIA),
    ((49 << 9) | MOVE_ZAP_CANNON),
    ((57 << 9) | MOVE_LOCK_ON),
    ((65 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gKyogreLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WATER_PULSE),
    ((5 << 9) | MOVE_SCARY_FACE),
    ((15 << 9) | MOVE_ANCIENT_POWER),
    ((20 << 9) | MOVE_BODY_SLAM),
    ((30 << 9) | MOVE_CALM_MIND),
    ((35 << 9) | MOVE_ICE_BEAM),
    ((45 << 9) | MOVE_HYDRO_PUMP),
    ((50 << 9) | MOVE_REST),
    ((60 << 9) | MOVE_SHEER_COLD),
    ((65 << 9) | MOVE_DOUBLE_EDGE),
    ((75 << 9) | MOVE_WATER_SPOUT),
    0xffff
};

const u16 gGroudonLevelUpLearnset[] = {
    ((1 << 9) | MOVE_MUD_SHOT),
    ((5 << 9) | MOVE_SCARY_FACE),
    ((15 << 9) | MOVE_ANCIENT_POWER),
    ((20 << 9) | MOVE_SLASH),
    ((30 << 9) | MOVE_BULK_UP),
    ((35 << 9) | MOVE_EARTHQUAKE),
    ((45 << 9) | MOVE_FIRE_BLAST),
    ((50 << 9) | MOVE_REST),
    ((60 << 9) | MOVE_FISSURE),
    ((65 << 9) | MOVE_SOLAR_BEAM),
    ((75 << 9) | MOVE_ERUPTION),
    0xffff
};

const u16 gRayquazaLevelUpLearnset[] = {
    ((1 << 9) | MOVE_TWISTER),
    ((5 << 9) | MOVE_SCARY_FACE),
    ((15 << 9) | MOVE_ANCIENT_POWER),
    ((20 << 9) | MOVE_DRAGON_CLAW),
    ((30 << 9) | MOVE_DRAGON_DANCE),
    ((35 << 9) | MOVE_CRUNCH),
    ((45 << 9) | MOVE_FLY),
    ((50 << 9) | MOVE_REST),
    ((60 << 9) | MOVE_EXTREME_SPEED),
    ((65 << 9) | MOVE_OUTRAGE),
    ((75 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gLatiasLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PSYWAVE),
    ((5 << 9) | MOVE_WISH),
    ((10 << 9) | MOVE_HELPING_HAND),
    ((15 << 9) | MOVE_SAFEGUARD),
    ((20 << 9) | MOVE_DRAGON_BREATH),
    ((25 << 9) | MOVE_WATER_SPORT),
    ((30 << 9) | MOVE_REFRESH),
    ((35 << 9) | MOVE_MIST_BALL),
    ((40 << 9) | MOVE_PSYCHIC),
    ((45 << 9) | MOVE_RECOVER),
    ((50 << 9) | MOVE_CHARM),
    0xffff
};

const u16 gLatiosLevelUpLearnset[] = {
    ((1 << 9) | MOVE_PSYWAVE),
    ((5 << 9) | MOVE_MEMENTO),
    ((10 << 9) | MOVE_HELPING_HAND),
    ((15 << 9) | MOVE_SAFEGUARD),
    ((20 << 9) | MOVE_DRAGON_BREATH),
    ((25 << 9) | MOVE_PROTECT),
    ((30 << 9) | MOVE_REFRESH),
    ((35 << 9) | MOVE_LUSTER_PURGE),
    ((40 << 9) | MOVE_PSYCHIC),
    ((45 << 9) | MOVE_RECOVER),
    ((50 << 9) | MOVE_DRAGON_DANCE),
    0xffff
};

const u16 gJirachiLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WISH),
    ((1 << 9) | MOVE_CONFUSION),
    ((5 << 9) | MOVE_REST),
    ((10 << 9) | MOVE_SWIFT),
    ((15 << 9) | MOVE_HELPING_HAND),
    ((20 << 9) | MOVE_PSYCHIC),
    ((25 << 9) | MOVE_REFRESH),
    ((30 << 9) | MOVE_REST),
    ((35 << 9) | MOVE_DOUBLE_EDGE),
    ((40 << 9) | MOVE_FUTURE_SIGHT),
    ((45 << 9) | MOVE_COSMIC_POWER),
    ((50 << 9) | MOVE_DOOM_DESIRE),
    0xffff
};

const u16 gDeoxysLevelUpLearnset[] = {
    ((1 << 9) | MOVE_LEER),
    ((1 << 9) | MOVE_WRAP),
    ((5 << 9) | MOVE_NIGHT_SHADE),
    ((10 << 9) | MOVE_TELEPORT),
    ((15 << 9) | MOVE_KNOCK_OFF),
    ((20 << 9) | MOVE_PURSUIT),
    ((25 << 9) | MOVE_PSYCHIC),
    ((30 << 9) | MOVE_SNATCH),
    ((35 << 9) | MOVE_COSMIC_POWER),
    ((40 << 9) | MOVE_RECOVER),
    ((45 << 9) | MOVE_PSYCHO_BOOST),
    ((50 << 9) | MOVE_HYPER_BEAM),
    0xffff
};

const u16 gChimechoLevelUpLearnset[] = {
    ((1 << 9) | MOVE_WRAP),
    ((6 << 9) | MOVE_GROWL),
    ((9 << 9) | MOVE_ASTONISH),
    ((14 << 9) | MOVE_CONFUSION),
    ((17 << 9) | MOVE_TAKE_DOWN),
    ((22 << 9) | MOVE_UPROAR),
    ((25 << 9) | MOVE_YAWN),
    ((30 << 9) | MOVE_PSYWAVE),
    ((33 << 9) | MOVE_DOUBLE_EDGE),
    ((38 << 9) | MOVE_HEAL_BELL),
    ((41 << 9) | MOVE_SAFEGUARD),
    ((46 << 9) | MOVE_PSYCHIC),
    0xffff
};
# 22 "src/pokemon/pokemon_data.c" 2
# 1 "src/pokemon/../data/pokemon/evolution.h" 1







const struct EvolutionData gEvolutionTable[] = {
    {{
    }}, {{
        {0x0004, 16, SPECIES_IVYSAUR},
    }}, {{
        {0x0004, 32, SPECIES_VENUSAUR},
    }}, {{
    }}, {{
        {0x0004, 16, SPECIES_CHARMELEON},
    }}, {{
        {0x0004, 36, SPECIES_CHARIZARD},
    }}, {{
    }}, {{
        {0x0004, 16, SPECIES_WARTORTLE},
    }}, {{
        {0x0004, 36, SPECIES_BLASTOISE},
    }}, {{
    }}, {{
        {0x0004, 7, SPECIES_METAPOD},
    }}, {{
        {0x0004, 10, SPECIES_BUTTERFREE},
    }}, {{
    }}, {{
        {0x0004, 7, SPECIES_KAKUNA},
    }}, {{
        {0x0004, 10, SPECIES_BEEDRILL},
    }}, {{
    }}, {{
        {0x0004, 18, SPECIES_PIDGEOTTO},
    }}, {{
        {0x0004, 36, SPECIES_PIDGEOT},
    }}, {{
    }}, {{
        {0x0004, 20, SPECIES_RATICATE},
    }}, {{
    }}, {{
        {0x0004, 20, SPECIES_FEAROW},
    }}, {{
    }}, {{
        {0x0004, 22, SPECIES_ARBOK},
    }}, {{
    }}, {{
        {0x0007, ITEM_THUNDER_STONE, SPECIES_RAICHU},
    }}, {{
    }}, {{
        {0x0004, 22, SPECIES_SANDSLASH},
    }}, {{
    }}, {{
        {0x0004, 16, SPECIES_NIDORINA},
    }}, {{
        {0x0007, ITEM_MOON_STONE, SPECIES_NIDOQUEEN},
    }}, {{
    }}, {{
        {0x0004, 16, SPECIES_NIDORINO},
    }}, {{
        {0x0007, ITEM_MOON_STONE, SPECIES_NIDOKING},
    }}, {{
    }}, {{
        {0x0007, ITEM_MOON_STONE, SPECIES_CLEFABLE},
    }}, {{
    }}, {{
        {0x0007, ITEM_FIRE_STONE, SPECIES_NINETALES},
    }}, {{
    }}, {{
        {0x0007, ITEM_MOON_STONE, SPECIES_WIGGLYTUFF},
    }}, {{
    }}, {{
        {0x0004, 22, SPECIES_GOLBAT},
    }}, {{
        {0x0001, 0, SPECIES_CROBAT},
    }}, {{
        {0x0004, 21, SPECIES_GLOOM},
    }}, {{
        {0x0007, ITEM_LEAF_STONE, SPECIES_VILEPLUME},
        {0x0007, ITEM_SUN_STONE, SPECIES_BELLOSSOM},
    }}, {{
    }}, {{
        {0x0004, 24, SPECIES_PARASECT},
    }}, {{
    }}, {{
        {0x0004, 31, SPECIES_VENOMOTH},
    }}, {{
    }}, {{
        {0x0004, 26, SPECIES_DUGTRIO},
    }}, {{
    }}, {{
        {0x0004, 28, SPECIES_PERSIAN},
    }}, {{
    }}, {{
        {0x0004, 33, SPECIES_GOLDUCK},
    }}, {{
    }}, {{
        {0x0004, 28, SPECIES_PRIMEAPE},
    }}, {{
    }}, {{
        {0x0007, ITEM_FIRE_STONE, SPECIES_ARCANINE},
    }}, {{
    }}, {{
        {0x0004, 25, SPECIES_POLIWHIRL},
    }}, {{
        {0x0007, ITEM_WATER_STONE, SPECIES_POLIWRATH},
        {0x0006, ITEM_KINGS_ROCK, SPECIES_POLITOED},
    }}, {{
    }}, {{
        {0x0004, 16, SPECIES_KADABRA},
    }}, {{
        {0x0005, 0, SPECIES_ALAKAZAM},
    }}, {{
    }}, {{
        {0x0004, 28, SPECIES_MACHOKE},
    }}, {{
        {0x0005, 0, SPECIES_MACHAMP},
    }}, {{
    }}, {{
        {0x0004, 21, SPECIES_WEEPINBELL},
    }}, {{
        {0x0007, ITEM_LEAF_STONE, SPECIES_VICTREEBEL},
    }}, {{
    }}, {{
        {0x0004, 30, SPECIES_TENTACRUEL},
    }}, {{
    }}, {{
        {0x0004, 25, SPECIES_GRAVELER},
    }}, {{
        {0x0005, 0, SPECIES_GOLEM},
    }}, {{
    }}, {{
        {0x0004, 40, SPECIES_RAPIDASH},
    }}, {{
    }}, {{
        {0x0004, 37, SPECIES_SLOWBRO},
        {0x0006, ITEM_KINGS_ROCK, SPECIES_SLOWKING},
    }}, {{
    }}, {{
        {0x0004, 30, SPECIES_MAGNETON},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 31, SPECIES_DODRIO},
    }}, {{
    }}, {{
        {0x0004, 34, SPECIES_DEWGONG},
    }}, {{
    }}, {{
        {0x0004, 38, SPECIES_MUK},
    }}, {{
    }}, {{
        {0x0007, ITEM_WATER_STONE, SPECIES_CLOYSTER},
    }}, {{
    }}, {{
        {0x0004, 25, SPECIES_HAUNTER},
    }}, {{
        {0x0005, 0, SPECIES_GENGAR},
    }}, {{
    }}, {{
        {0x0006, ITEM_METAL_COAT, SPECIES_STEELIX},
    }}, {{
        {0x0004, 26, SPECIES_HYPNO},
    }}, {{
    }}, {{
        {0x0004, 28, SPECIES_KINGLER},
    }}, {{
    }}, {{
        {0x0004, 30, SPECIES_ELECTRODE},
    }}, {{
    }}, {{
        {0x0007, ITEM_LEAF_STONE, SPECIES_EXEGGUTOR},
    }}, {{
    }}, {{
        {0x0004, 28, SPECIES_MAROWAK},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 35, SPECIES_WEEZING},
    }}, {{
    }}, {{
        {0x0004, 42, SPECIES_RHYDON},
    }}, {{
    }}, {{
        {0x0001, 0, SPECIES_BLISSEY},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 32, SPECIES_SEADRA},
    }}, {{
        {0x0006, ITEM_DRAGON_SCALE, SPECIES_KINGDRA},
    }}, {{
        {0x0004, 33, SPECIES_SEAKING},
    }}, {{
    }}, {{
        {0x0007, ITEM_WATER_STONE, SPECIES_STARMIE},
    }}, {{
    }}, {{
    }}, {{
        {0x0006, ITEM_METAL_COAT, SPECIES_SCIZOR},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 20, SPECIES_GYARADOS},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0007, ITEM_THUNDER_STONE, SPECIES_JOLTEON},
        {0x0007, ITEM_WATER_STONE, SPECIES_VAPOREON},
        {0x0007, ITEM_FIRE_STONE, SPECIES_FLAREON},
        {0x0002, 0, SPECIES_ESPEON},
        {0x0003, 0, SPECIES_UMBREON},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0006, ITEM_UP_GRADE, SPECIES_PORYGON2},
    }}, {{
        {0x0004, 40, SPECIES_OMASTAR},
    }}, {{
    }}, {{
        {0x0004, 40, SPECIES_KABUTOPS},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 30, SPECIES_DRAGONAIR},
    }}, {{
        {0x0004, 55, SPECIES_DRAGONITE},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 16, SPECIES_BAYLEEF},
    }}, {{
        {0x0004, 32, SPECIES_MEGANIUM},
    }}, {{
    }}, {{
        {0x0004, 14, SPECIES_QUILAVA},
    }}, {{
        {0x0004, 36, SPECIES_TYPHLOSION},
    }}, {{
    }}, {{
        {0x0004, 18, SPECIES_CROCONAW},
    }}, {{
        {0x0004, 30, SPECIES_FERALIGATR},
    }}, {{
    }}, {{
        {0x0004, 15, SPECIES_FURRET},
    }}, {{
    }}, {{
        {0x0004, 20, SPECIES_NOCTOWL},
    }}, {{
    }}, {{
        {0x0004, 18, SPECIES_LEDIAN},
    }}, {{
    }}, {{
        {0x0004, 22, SPECIES_ARIADOS},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 27, SPECIES_LANTURN},
    }}, {{
    }}, {{
        {0x0001, 0, SPECIES_PIKACHU},
    }}, {{
        {0x0001, 0, SPECIES_CLEFAIRY},
    }}, {{
        {0x0001, 0, SPECIES_JIGGLYPUFF},
    }}, {{
        {0x0001, 0, SPECIES_TOGETIC},
    }}, {{
    }}, {{
        {0x0004, 25, SPECIES_XATU},
    }}, {{
    }}, {{
        {0x0004, 15, SPECIES_FLAAFFY},
    }}, {{
        {0x0004, 30, SPECIES_AMPHAROS},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 18, SPECIES_AZUMARILL},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 18, SPECIES_SKIPLOOM},
    }}, {{
        {0x0004, 27, SPECIES_JUMPLUFF},
    }}, {{
    }}, {{
    }}, {{
        {0x0007, ITEM_SUN_STONE, SPECIES_SUNFLORA},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 20, SPECIES_QUAGSIRE},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 31, SPECIES_FORRETRESS},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 23, SPECIES_GRANBULL},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 30, SPECIES_URSARING},
    }}, {{
    }}, {{
        {0x0004, 38, SPECIES_MAGCARGO},
    }}, {{
    }}, {{
        {0x0004, 33, SPECIES_PILOSWINE},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 25, SPECIES_OCTILLERY},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 24, SPECIES_HOUNDOOM},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 25, SPECIES_DONPHAN},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x000a, 20, SPECIES_HITMONCHAN},
        {0x0008, 20, SPECIES_HITMONLEE},
        {0x0009, 20, SPECIES_HITMONTOP},
    }}, {{
    }}, {{
        {0x0004, 30, SPECIES_JYNX},
    }}, {{
        {0x0004, 30, SPECIES_ELECTABUZZ},
    }}, {{
        {0x0004, 30, SPECIES_MAGMAR},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 30, SPECIES_PUPITAR},
    }}, {{
        {0x0004, 55, SPECIES_TYRANITAR},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 16, SPECIES_GROVYLE},
    }}, {{
        {0x0004, 36, SPECIES_SCEPTILE},
    }}, {{
    }}, {{
        {0x0004, 16, SPECIES_COMBUSKEN},
    }}, {{
        {0x0004, 36, SPECIES_BLAZIKEN},
    }}, {{
    }}, {{
        {0x0004, 16, SPECIES_MARSHTOMP},
    }}, {{
        {0x0004, 36, SPECIES_SWAMPERT},
    }}, {{
    }}, {{
        {0x0004, 18, SPECIES_MIGHTYENA},
    }}, {{
    }}, {{
        {0x0004, 20, SPECIES_LINOONE},
    }}, {{
    }}, {{
        {0x000b, 7, SPECIES_SILCOON},
        {0x000c, 7, SPECIES_CASCOON},
    }}, {{
        {0x0004, 10, SPECIES_BEAUTIFLY},
    }}, {{
    }}, {{
        {0x0004, 10, SPECIES_DUSTOX},
    }}, {{
    }}, {{
        {0x0004, 14, SPECIES_LOMBRE},
    }}, {{
        {0x0007, ITEM_WATER_STONE, SPECIES_LUDICOLO},
    }}, {{
    }}, {{
        {0x0004, 14, SPECIES_NUZLEAF},
    }}, {{
        {0x0007, ITEM_LEAF_STONE, SPECIES_SHIFTRY},
    }}, {{
    }}, {{
        {0x000d, 20, SPECIES_NINJASK},
        {0x000e, 20, SPECIES_SHEDINJA},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 22, SPECIES_SWELLOW},
    }}, {{
    }}, {{
        {0x0004, 23, SPECIES_BRELOOM},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 25, SPECIES_PELIPPER},
    }}, {{
    }}, {{
        {0x0004, 22, SPECIES_MASQUERAIN},
    }}, {{
    }}, {{
        {0x0004, 40, SPECIES_WAILORD},
    }}, {{
    }}, {{
        {0x0007, ITEM_MOON_STONE, SPECIES_DELCATTY},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 36, SPECIES_CLAYDOL},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 30, SPECIES_WHISCASH},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 30, SPECIES_CRAWDAUNT},
    }}, {{
    }}, {{
        {0x000f, 170, SPECIES_MILOTIC},
    }}, {{
    }}, {{
        {0x0004, 30, SPECIES_SHARPEDO},
    }}, {{
    }}, {{
        {0x0004, 35, SPECIES_VIBRAVA},
    }}, {{
        {0x0004, 45, SPECIES_FLYGON},
    }}, {{
    }}, {{
        {0x0004, 24, SPECIES_HARIYAMA},
    }}, {{
    }}, {{
        {0x0004, 26, SPECIES_MANECTRIC},
    }}, {{
    }}, {{
        {0x0004, 33, SPECIES_CAMERUPT},
    }}, {{
    }}, {{
        {0x0004, 32, SPECIES_SEALEO},
    }}, {{
        {0x0004, 44, SPECIES_WALREIN},
    }}, {{
    }}, {{
        {0x0004, 32, SPECIES_CACTURNE},
    }}, {{
    }}, {{
        {0x0004, 42, SPECIES_GLALIE},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0001, 0, SPECIES_MARILL},
    }}, {{
        {0x0004, 32, SPECIES_GRUMPIG},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 37, SPECIES_MEDICHAM},
    }}, {{
    }}, {{
        {0x0004, 35, SPECIES_ALTARIA},
    }}, {{
    }}, {{
        {0x0004, 15, SPECIES_WOBBUFFET},
    }}, {{
        {0x0004, 37, SPECIES_DUSCLOPS},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 18, SPECIES_VIGOROTH},
    }}, {{
        {0x0004, 36, SPECIES_SLAKING},
    }}, {{
    }}, {{
        {0x0004, 26, SPECIES_SWALOT},
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 20, SPECIES_LOUDRED},
    }}, {{
        {0x0004, 40, SPECIES_EXPLOUD},
    }}, {{
    }}, {{
        {0x0006, ITEM_DEEP_SEA_TOOTH, SPECIES_HUNTAIL},
        {0x0006, ITEM_DEEP_SEA_SCALE, SPECIES_GOREBYSS},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 37, SPECIES_BANETTE},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 32, SPECIES_LAIRON},
    }}, {{
        {0x0004, 42, SPECIES_AGGRON},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
        {0x0004, 40, SPECIES_CRADILY},
    }}, {{
    }}, {{
        {0x0004, 40, SPECIES_ARMALDO},
    }}, {{
    }}, {{
        {0x0004, 20, SPECIES_KIRLIA},
    }}, {{
        {0x0004, 30, SPECIES_GARDEVOIR},
    }}, {{
    }}, {{
        {0x0004, 30, SPECIES_SHELGON},
    }}, {{
        {0x0004, 50, SPECIES_SALAMENCE},
    }}, {{
    }}, {{
        {0x0004, 20, SPECIES_METANG},
    }}, {{
        {0x0004, 45, SPECIES_METAGROSS},
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}, {{
    }}
};
# 23 "src/pokemon/pokemon_data.c" 2
# 1 "src/pokemon/../data/pokemon/level_up_learnset_pointers.h" 1







const u16 *const gLevelUpLearnsets[] = {
    gBulbasaurLevelUpLearnset,
    gBulbasaurLevelUpLearnset,
    gIvysaurLevelUpLearnset,
    gVenusaurLevelUpLearnset,
    gCharmanderLevelUpLearnset,
    gCharmeleonLevelUpLearnset,
    gCharizardLevelUpLearnset,
    gSquirtleLevelUpLearnset,
    gWartortleLevelUpLearnset,
    gBlastoiseLevelUpLearnset,
    gCaterpieLevelUpLearnset,
    gMetapodLevelUpLearnset,
    gButterfreeLevelUpLearnset,
    gWeedleLevelUpLearnset,
    gKakunaLevelUpLearnset,
    gBeedrillLevelUpLearnset,
    gPidgeyLevelUpLearnset,
    gPidgeottoLevelUpLearnset,
    gPidgeotLevelUpLearnset,
    gRattataLevelUpLearnset,
    gRaticateLevelUpLearnset,
    gSpearowLevelUpLearnset,
    gFearowLevelUpLearnset,
    gEkansLevelUpLearnset,
    gArbokLevelUpLearnset,
    gPikachuLevelUpLearnset,
    gRaichuLevelUpLearnset,
    gSandshrewLevelUpLearnset,
    gSandslashLevelUpLearnset,
    gNidoranFLevelUpLearnset,
    gNidorinaLevelUpLearnset,
    gNidoqueenLevelUpLearnset,
    gNidoranMLevelUpLearnset,
    gNidorinoLevelUpLearnset,
    gNidokingLevelUpLearnset,
    gClefairyLevelUpLearnset,
    gClefableLevelUpLearnset,
    gVulpixLevelUpLearnset,
    gNinetalesLevelUpLearnset,
    gJigglypuffLevelUpLearnset,
    gWigglytuffLevelUpLearnset,
    gZubatLevelUpLearnset,
    gGolbatLevelUpLearnset,
    gOddishLevelUpLearnset,
    gGloomLevelUpLearnset,
    gVileplumeLevelUpLearnset,
    gParasLevelUpLearnset,
    gParasectLevelUpLearnset,
    gVenonatLevelUpLearnset,
    gVenomothLevelUpLearnset,
    gDiglettLevelUpLearnset,
    gDugtrioLevelUpLearnset,
    gMeowthLevelUpLearnset,
    gPersianLevelUpLearnset,
    gPsyduckLevelUpLearnset,
    gGolduckLevelUpLearnset,
    gMankeyLevelUpLearnset,
    gPrimeapeLevelUpLearnset,
    gGrowlitheLevelUpLearnset,
    gArcanineLevelUpLearnset,
    gPoliwagLevelUpLearnset,
    gPoliwhirlLevelUpLearnset,
    gPoliwrathLevelUpLearnset,
    gAbraLevelUpLearnset,
    gKadabraLevelUpLearnset,
    gAlakazamLevelUpLearnset,
    gMachopLevelUpLearnset,
    gMachokeLevelUpLearnset,
    gMachampLevelUpLearnset,
    gBellsproutLevelUpLearnset,
    gWeepinbellLevelUpLearnset,
    gVictreebelLevelUpLearnset,
    gTentacoolLevelUpLearnset,
    gTentacruelLevelUpLearnset,
    gGeodudeLevelUpLearnset,
    gGravelerLevelUpLearnset,
    gGolemLevelUpLearnset,
    gPonytaLevelUpLearnset,
    gRapidashLevelUpLearnset,
    gSlowpokeLevelUpLearnset,
    gSlowbroLevelUpLearnset,
    gMagnemiteLevelUpLearnset,
    gMagnetonLevelUpLearnset,
    gFarfetchdLevelUpLearnset,
    gDoduoLevelUpLearnset,
    gDodrioLevelUpLearnset,
    gSeelLevelUpLearnset,
    gDewgongLevelUpLearnset,
    gGrimerLevelUpLearnset,
    gMukLevelUpLearnset,
    gShellderLevelUpLearnset,
    gCloysterLevelUpLearnset,
    gGastlyLevelUpLearnset,
    gHaunterLevelUpLearnset,
    gGengarLevelUpLearnset,
    gOnixLevelUpLearnset,
    gDrowzeeLevelUpLearnset,
    gHypnoLevelUpLearnset,
    gKrabbyLevelUpLearnset,
    gKinglerLevelUpLearnset,
    gVoltorbLevelUpLearnset,
    gElectrodeLevelUpLearnset,
    gExeggcuteLevelUpLearnset,
    gExeggutorLevelUpLearnset,
    gCuboneLevelUpLearnset,
    gMarowakLevelUpLearnset,
    gHitmonleeLevelUpLearnset,
    gHitmonchanLevelUpLearnset,
    gLickitungLevelUpLearnset,
    gKoffingLevelUpLearnset,
    gWeezingLevelUpLearnset,
    gRhyhornLevelUpLearnset,
    gRhydonLevelUpLearnset,
    gChanseyLevelUpLearnset,
    gTangelaLevelUpLearnset,
    gKangaskhanLevelUpLearnset,
    gHorseaLevelUpLearnset,
    gSeadraLevelUpLearnset,
    gGoldeenLevelUpLearnset,
    gSeakingLevelUpLearnset,
    gStaryuLevelUpLearnset,
    gStarmieLevelUpLearnset,
    gMrmimeLevelUpLearnset,
    gScytherLevelUpLearnset,
    gJynxLevelUpLearnset,
    gElectabuzzLevelUpLearnset,
    gMagmarLevelUpLearnset,
    gPinsirLevelUpLearnset,
    gTaurosLevelUpLearnset,
    gMagikarpLevelUpLearnset,
    gGyaradosLevelUpLearnset,
    gLaprasLevelUpLearnset,
    gDittoLevelUpLearnset,
    gEeveeLevelUpLearnset,
    gVaporeonLevelUpLearnset,
    gJolteonLevelUpLearnset,
    gFlareonLevelUpLearnset,
    gPorygonLevelUpLearnset,
    gOmanyteLevelUpLearnset,
    gOmastarLevelUpLearnset,
    gKabutoLevelUpLearnset,
    gKabutopsLevelUpLearnset,
    gAerodactylLevelUpLearnset,
    gSnorlaxLevelUpLearnset,
    gArticunoLevelUpLearnset,
    gZapdosLevelUpLearnset,
    gMoltresLevelUpLearnset,
    gDratiniLevelUpLearnset,
    gDragonairLevelUpLearnset,
    gDragoniteLevelUpLearnset,
    gMewtwoLevelUpLearnset,
    gMewLevelUpLearnset,
    gChikoritaLevelUpLearnset,
    gBayleefLevelUpLearnset,
    gMeganiumLevelUpLearnset,
    gCyndaquilLevelUpLearnset,
    gQuilavaLevelUpLearnset,
    gTyphlosionLevelUpLearnset,
    gTotodileLevelUpLearnset,
    gCroconawLevelUpLearnset,
    gFeraligatrLevelUpLearnset,
    gSentretLevelUpLearnset,
    gFurretLevelUpLearnset,
    gHoothootLevelUpLearnset,
    gNoctowlLevelUpLearnset,
    gLedybaLevelUpLearnset,
    gLedianLevelUpLearnset,
    gSpinarakLevelUpLearnset,
    gAriadosLevelUpLearnset,
    gCrobatLevelUpLearnset,
    gChinchouLevelUpLearnset,
    gLanturnLevelUpLearnset,
    gPichuLevelUpLearnset,
    gCleffaLevelUpLearnset,
    gIgglybuffLevelUpLearnset,
    gTogepiLevelUpLearnset,
    gTogeticLevelUpLearnset,
    gNatuLevelUpLearnset,
    gXatuLevelUpLearnset,
    gMareepLevelUpLearnset,
    gFlaaffyLevelUpLearnset,
    gAmpharosLevelUpLearnset,
    gBellossomLevelUpLearnset,
    gMarillLevelUpLearnset,
    gAzumarillLevelUpLearnset,
    gSudowoodoLevelUpLearnset,
    gPolitoedLevelUpLearnset,
    gHoppipLevelUpLearnset,
    gSkiploomLevelUpLearnset,
    gJumpluffLevelUpLearnset,
    gAipomLevelUpLearnset,
    gSunkernLevelUpLearnset,
    gSunfloraLevelUpLearnset,
    gYanmaLevelUpLearnset,
    gWooperLevelUpLearnset,
    gQuagsireLevelUpLearnset,
    gEspeonLevelUpLearnset,
    gUmbreonLevelUpLearnset,
    gMurkrowLevelUpLearnset,
    gSlowkingLevelUpLearnset,
    gMisdreavusLevelUpLearnset,
    gUnownLevelUpLearnset,
    gWobbuffetLevelUpLearnset,
    gGirafarigLevelUpLearnset,
    gPinecoLevelUpLearnset,
    gForretressLevelUpLearnset,
    gDunsparceLevelUpLearnset,
    gGligarLevelUpLearnset,
    gSteelixLevelUpLearnset,
    gSnubbullLevelUpLearnset,
    gGranbullLevelUpLearnset,
    gQwilfishLevelUpLearnset,
    gScizorLevelUpLearnset,
    gShuckleLevelUpLearnset,
    gHeracrossLevelUpLearnset,
    gSneaselLevelUpLearnset,
    gTeddiursaLevelUpLearnset,
    gUrsaringLevelUpLearnset,
    gSlugmaLevelUpLearnset,
    gMagcargoLevelUpLearnset,
    gSwinubLevelUpLearnset,
    gPiloswineLevelUpLearnset,
    gCorsolaLevelUpLearnset,
    gRemoraidLevelUpLearnset,
    gOctilleryLevelUpLearnset,
    gDelibirdLevelUpLearnset,
    gMantineLevelUpLearnset,
    gSkarmoryLevelUpLearnset,
    gHoundourLevelUpLearnset,
    gHoundoomLevelUpLearnset,
    gKingdraLevelUpLearnset,
    gPhanpyLevelUpLearnset,
    gDonphanLevelUpLearnset,
    gPorygon2LevelUpLearnset,
    gStantlerLevelUpLearnset,
    gSmeargleLevelUpLearnset,
    gTyrogueLevelUpLearnset,
    gHitmontopLevelUpLearnset,
    gSmoochumLevelUpLearnset,
    gElekidLevelUpLearnset,
    gMagbyLevelUpLearnset,
    gMiltankLevelUpLearnset,
    gBlisseyLevelUpLearnset,
    gRaikouLevelUpLearnset,
    gEnteiLevelUpLearnset,
    gSuicuneLevelUpLearnset,
    gLarvitarLevelUpLearnset,
    gPupitarLevelUpLearnset,
    gTyranitarLevelUpLearnset,
    gLugiaLevelUpLearnset,
    gHoOhLevelUpLearnset,
    gCelebiLevelUpLearnset,
    gSpecies252LevelUpLearnset,
    gSpecies253LevelUpLearnset,
    gSpecies254LevelUpLearnset,
    gSpecies255LevelUpLearnset,
    gSpecies256LevelUpLearnset,
    gSpecies257LevelUpLearnset,
    gSpecies258LevelUpLearnset,
    gSpecies259LevelUpLearnset,
    gSpecies260LevelUpLearnset,
    gSpecies261LevelUpLearnset,
    gSpecies262LevelUpLearnset,
    gSpecies263LevelUpLearnset,
    gSpecies264LevelUpLearnset,
    gSpecies265LevelUpLearnset,
    gSpecies266LevelUpLearnset,
    gSpecies267LevelUpLearnset,
    gSpecies268LevelUpLearnset,
    gSpecies269LevelUpLearnset,
    gSpecies270LevelUpLearnset,
    gSpecies271LevelUpLearnset,
    gSpecies272LevelUpLearnset,
    gSpecies273LevelUpLearnset,
    gSpecies274LevelUpLearnset,
    gSpecies275LevelUpLearnset,
    gSpecies276LevelUpLearnset,
    gTreeckoLevelUpLearnset,
    gGrovyleLevelUpLearnset,
    gSceptileLevelUpLearnset,
    gTorchicLevelUpLearnset,
    gCombuskenLevelUpLearnset,
    gBlazikenLevelUpLearnset,
    gMudkipLevelUpLearnset,
    gMarshtompLevelUpLearnset,
    gSwampertLevelUpLearnset,
    gPoochyenaLevelUpLearnset,
    gMightyenaLevelUpLearnset,
    gZigzagoonLevelUpLearnset,
    gLinooneLevelUpLearnset,
    gWurmpleLevelUpLearnset,
    gSilcoonLevelUpLearnset,
    gBeautiflyLevelUpLearnset,
    gCascoonLevelUpLearnset,
    gDustoxLevelUpLearnset,
    gLotadLevelUpLearnset,
    gLombreLevelUpLearnset,
    gLudicoloLevelUpLearnset,
    gSeedotLevelUpLearnset,
    gNuzleafLevelUpLearnset,
    gShiftryLevelUpLearnset,
    gNincadaLevelUpLearnset,
    gNinjaskLevelUpLearnset,
    gShedinjaLevelUpLearnset,
    gTaillowLevelUpLearnset,
    gSwellowLevelUpLearnset,
    gShroomishLevelUpLearnset,
    gBreloomLevelUpLearnset,
    gSpindaLevelUpLearnset,
    gWingullLevelUpLearnset,
    gPelipperLevelUpLearnset,
    gSurskitLevelUpLearnset,
    gMasquerainLevelUpLearnset,
    gWailmerLevelUpLearnset,
    gWailordLevelUpLearnset,
    gSkittyLevelUpLearnset,
    gDelcattyLevelUpLearnset,
    gKecleonLevelUpLearnset,
    gBaltoyLevelUpLearnset,
    gClaydolLevelUpLearnset,
    gNosepassLevelUpLearnset,
    gTorkoalLevelUpLearnset,
    gSableyeLevelUpLearnset,
    gBarboachLevelUpLearnset,
    gWhiscashLevelUpLearnset,
    gLuvdiscLevelUpLearnset,
    gCorphishLevelUpLearnset,
    gCrawdauntLevelUpLearnset,
    gFeebasLevelUpLearnset,
    gMiloticLevelUpLearnset,
    gCarvanhaLevelUpLearnset,
    gSharpedoLevelUpLearnset,
    gTrapinchLevelUpLearnset,
    gVibravaLevelUpLearnset,
    gFlygonLevelUpLearnset,
    gMakuhitaLevelUpLearnset,
    gHariyamaLevelUpLearnset,
    gElectrikeLevelUpLearnset,
    gManectricLevelUpLearnset,
    gNumelLevelUpLearnset,
    gCameruptLevelUpLearnset,
    gSphealLevelUpLearnset,
    gSealeoLevelUpLearnset,
    gWalreinLevelUpLearnset,
    gCacneaLevelUpLearnset,
    gCacturneLevelUpLearnset,
    gSnoruntLevelUpLearnset,
    gGlalieLevelUpLearnset,
    gLunatoneLevelUpLearnset,
    gSolrockLevelUpLearnset,
    gAzurillLevelUpLearnset,
    gSpoinkLevelUpLearnset,
    gGrumpigLevelUpLearnset,
    gPlusleLevelUpLearnset,
    gMinunLevelUpLearnset,
    gMawileLevelUpLearnset,
    gMedititeLevelUpLearnset,
    gMedichamLevelUpLearnset,
    gSwabluLevelUpLearnset,
    gAltariaLevelUpLearnset,
    gWynautLevelUpLearnset,
    gDuskullLevelUpLearnset,
    gDusclopsLevelUpLearnset,
    gRoseliaLevelUpLearnset,
    gSlakothLevelUpLearnset,
    gVigorothLevelUpLearnset,
    gSlakingLevelUpLearnset,
    gGulpinLevelUpLearnset,
    gSwalotLevelUpLearnset,
    gTropiusLevelUpLearnset,
    gWhismurLevelUpLearnset,
    gLoudredLevelUpLearnset,
    gExploudLevelUpLearnset,
    gClamperlLevelUpLearnset,
    gHuntailLevelUpLearnset,
    gGorebyssLevelUpLearnset,
    gAbsolLevelUpLearnset,
    gShuppetLevelUpLearnset,
    gBanetteLevelUpLearnset,
    gSeviperLevelUpLearnset,
    gZangooseLevelUpLearnset,
    gRelicanthLevelUpLearnset,
    gAronLevelUpLearnset,
    gLaironLevelUpLearnset,
    gAggronLevelUpLearnset,
    gCastformLevelUpLearnset,
    gVolbeatLevelUpLearnset,
    gIllumiseLevelUpLearnset,
    gLileepLevelUpLearnset,
    gCradilyLevelUpLearnset,
    gAnorithLevelUpLearnset,
    gArmaldoLevelUpLearnset,
    gRaltsLevelUpLearnset,
    gKirliaLevelUpLearnset,
    gGardevoirLevelUpLearnset,
    gBagonLevelUpLearnset,
    gShelgonLevelUpLearnset,
    gSalamenceLevelUpLearnset,
    gBeldumLevelUpLearnset,
    gMetangLevelUpLearnset,
    gMetagrossLevelUpLearnset,
    gRegirockLevelUpLearnset,
    gRegiceLevelUpLearnset,
    gRegisteelLevelUpLearnset,
    gKyogreLevelUpLearnset,
    gGroudonLevelUpLearnset,
    gRayquazaLevelUpLearnset,
    gLatiasLevelUpLearnset,
    gLatiosLevelUpLearnset,
    gJirachiLevelUpLearnset,
    gDeoxysLevelUpLearnset,
    gChimechoLevelUpLearnset
};
# 24 "src/pokemon/pokemon_data.c" 2

const u8 gUnknown_08208238[] = {
    0x03, 0x0c, 0x30, 0xc0
};

const u8 gUnknown_0820823C[] = {
    0xFC, 0xF3, 0xCF, 0x3F
};

const u8 gUnknown_08208240[] = {
    0x01, 0x04, 0x10, 0x40
};

const u8 gStatStageRatios[][2] = {
    {10, 40},
    {10, 35},
    {10, 30},
    {10, 25},
    {10, 20},
    {10, 15},
    {10, 10},
    {15, 10},
    {20, 10},
    {25, 10},
    {30, 10},
    {35, 10},
    {40, 10}
};

const u8 unknownGameFreakAbbrev_820825E[] = _("ゲーフリ");

const u8 gHoldEffectToType[][2] = {
    {31, 0x06},
    {42, 0x08},
    {46, 0x04},
    {47, 0x05},
    {48, 0x0c},
    {49, 0x11},
    {50, 0x01},
    {51, 0x0d},
    {52, 0x0b},
    {53, 0x02},
    {54, 0x03},
    {55, 0x0f},
    {56, 0x07},
    {57, 0x0e},
    {58, 0x0a},
    {59, 0x10},
    {60, 0x00}
};

extern void sub_80105A0(struct Sprite *);
extern void oac_poke_opponent(struct Sprite *);

const struct SpriteTemplate gSpriteTemplate_8208288[] = {
    {0xFFFF, 0, &gOamData_81F96F0, ((void *)0), gSpriteImageTable_81E7A10, gSpriteAffineAnimTable_81E7B70, sub_80105A0},
    {0xFFFF, 0, &gOamData_81F96E8, ((void *)0), gSpriteImageTable_81E7A30, gSpriteAffineAnimTable_81E7BEC, oac_poke_opponent},
    {0xFFFF, 0, &gOamData_81F96F0, ((void *)0), gSpriteImageTable_81E7A50, gSpriteAffineAnimTable_81E7B70, sub_80105A0},
    {0xFFFF, 0, &gOamData_81F96E8, ((void *)0), gSpriteImageTable_81E7A70, gSpriteAffineAnimTable_81E7BEC, oac_poke_opponent},
};

const u8 gSecretBaseTrainerClasses[][5] = {

    {TRAINER_CLASS_YOUNGSTER, TRAINER_CLASS_BUG_CATCHER, TRAINER_CLASS_RICH_BOY, TRAINER_CLASS_CAMPER, TRAINER_CLASS_COOL_TRAINER_M},

    {TRAINER_CLASS_LASS, TRAINER_CLASS_SCHOOL_KID_F, TRAINER_CLASS_LADY, TRAINER_CLASS_PICNICKER, TRAINER_CLASS_COOL_TRAINER_F}
};

const u8 gUnknown_082082F2[] = {
    26,
    27,
    28,
    29,
    31,
    30
};

const u8 gUnknown_082082F8[] = {1, 1, 3, 2, 4, 6};

const s8 gUnknown_082082FE[][3] = {

    { 5, 3, 2},
    { 5, 3, 2},
    { 1, 1, 0},
    { 3, 2, 1},
    { 1, 1, 0},
    { 1, 1, 1},
    {-1, -1, -1},
    {-5, -5, -10},
    {-5, -5, -10}
};

const u16 gHMMoves[] = {
    MOVE_CUT,
    MOVE_FLY,
    MOVE_SURF,
    MOVE_STRENGTH,
    MOVE_FLASH,
    MOVE_ROCK_SMASH,
    MOVE_WATERFALL,
    MOVE_DIVE,
    0xffff
};

const u8 gJapaneseNidoranNames[][11] = {_("ニドラン♂"), _("ニドラン♀")};
