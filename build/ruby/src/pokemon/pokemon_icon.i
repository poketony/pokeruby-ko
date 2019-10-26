# 1 "src/pokemon/pokemon_icon.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/pokemon/pokemon_icon.c"
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
# 2 "src/pokemon/pokemon_icon.c" 2
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
# 3 "src/pokemon/pokemon_icon.c" 2
# 1 "include/mail_data.h" 1



void ClearMailData(void);
void ClearMailStruct(struct MailStruct *);
void ClearMailStruct(struct MailStruct *);
u8 GiveMailToMon(struct Pokemon *, u16);
u16 SpeciesToMailSpecies(u16, u32);
u16 MailSpeciesToSpecies(u16, u16 *);
u8 GiveMailToMon2(struct Pokemon *, struct MailStruct *);
void TakeMailFromMon(struct Pokemon *);
u8 TakeMailFromMon2(struct Pokemon *);
bool8 ItemIsMail(u16);
bool8 MonHasMail(struct Pokemon *);
# 4 "src/pokemon/pokemon_icon.c" 2
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
# 5 "src/pokemon/pokemon_icon.c" 2
# 1 "include/sprite.h" 1
# 6 "src/pokemon/pokemon_icon.c" 2



struct MonIconSpriteTemplate
{
    const struct OamData *oam;
    const u8 *image;
    const union AnimCmd *const *anims;
    const union AffineAnimCmd *const *affineAnims;
    void (*callback)(struct Sprite *);
    u16 paletteTag;
};

const u8 * const gMonIconTable[] =
{
    gMonIcon_Bulbasaur,
    gMonIcon_Bulbasaur,
    gMonIcon_Ivysaur,
    gMonIcon_Venusaur,
    gMonIcon_Charmander,
    gMonIcon_Charmeleon,
    gMonIcon_Charizard,
    gMonIcon_Squirtle,
    gMonIcon_Wartortle,
    gMonIcon_Blastoise,
    gMonIcon_Caterpie,
    gMonIcon_Metapod,
    gMonIcon_Butterfree,
    gMonIcon_Weedle,
    gMonIcon_Kakuna,
    gMonIcon_Beedrill,
    gMonIcon_Pidgey,
    gMonIcon_Pidgeotto,
    gMonIcon_Pidgeot,
    gMonIcon_Rattata,
    gMonIcon_Raticate,
    gMonIcon_Spearow,
    gMonIcon_Fearow,
    gMonIcon_Ekans,
    gMonIcon_Arbok,
    gMonIcon_Pikachu,
    gMonIcon_Raichu,
    gMonIcon_Sandshrew,
    gMonIcon_Sandslash,
    gMonIcon_NidoranF,
    gMonIcon_Nidorina,
    gMonIcon_Nidoqueen,
    gMonIcon_NidoranM,
    gMonIcon_Nidorino,
    gMonIcon_Nidoking,
    gMonIcon_Clefairy,
    gMonIcon_Clefable,
    gMonIcon_Vulpix,
    gMonIcon_Ninetales,
    gMonIcon_Jigglypuff,
    gMonIcon_Wigglytuff,
    gMonIcon_Zubat,
    gMonIcon_Golbat,
    gMonIcon_Oddish,
    gMonIcon_Gloom,
    gMonIcon_Vileplume,
    gMonIcon_Paras,
    gMonIcon_Parasect,
    gMonIcon_Venonat,
    gMonIcon_Venomoth,
    gMonIcon_Diglett,
    gMonIcon_Dugtrio,
    gMonIcon_Meowth,
    gMonIcon_Persian,
    gMonIcon_Psyduck,
    gMonIcon_Golduck,
    gMonIcon_Mankey,
    gMonIcon_Primeape,
    gMonIcon_Growlithe,
    gMonIcon_Arcanine,
    gMonIcon_Poliwag,
    gMonIcon_Poliwhirl,
    gMonIcon_Poliwrath,
    gMonIcon_Abra,
    gMonIcon_Kadabra,
    gMonIcon_Alakazam,
    gMonIcon_Machop,
    gMonIcon_Machoke,
    gMonIcon_Machamp,
    gMonIcon_Bellsprout,
    gMonIcon_Weepinbell,
    gMonIcon_Victreebel,
    gMonIcon_Tentacool,
    gMonIcon_Tentacruel,
    gMonIcon_Geodude,
    gMonIcon_Graveler,
    gMonIcon_Golem,
    gMonIcon_Ponyta,
    gMonIcon_Rapidash,
    gMonIcon_Slowpoke,
    gMonIcon_Slowbro,
    gMonIcon_Magnemite,
    gMonIcon_Magneton,
    gMonIcon_Farfetchd,
    gMonIcon_Doduo,
    gMonIcon_Dodrio,
    gMonIcon_Seel,
    gMonIcon_Dewgong,
    gMonIcon_Grimer,
    gMonIcon_Muk,
    gMonIcon_Shellder,
    gMonIcon_Cloyster,
    gMonIcon_Gastly,
    gMonIcon_Haunter,
    gMonIcon_Gengar,
    gMonIcon_Onix,
    gMonIcon_Drowzee,
    gMonIcon_Hypno,
    gMonIcon_Krabby,
    gMonIcon_Kingler,
    gMonIcon_Voltorb,
    gMonIcon_Electrode,
    gMonIcon_Exeggcute,
    gMonIcon_Exeggutor,
    gMonIcon_Cubone,
    gMonIcon_Marowak,
    gMonIcon_Hitmonlee,
    gMonIcon_Hitmonchan,
    gMonIcon_Lickitung,
    gMonIcon_Koffing,
    gMonIcon_Weezing,
    gMonIcon_Rhyhorn,
    gMonIcon_Rhydon,
    gMonIcon_Chansey,
    gMonIcon_Tangela,
    gMonIcon_Kangaskhan,
    gMonIcon_Horsea,
    gMonIcon_Seadra,
    gMonIcon_Goldeen,
    gMonIcon_Seaking,
    gMonIcon_Staryu,
    gMonIcon_Starmie,
    gMonIcon_Mrmime,
    gMonIcon_Scyther,
    gMonIcon_Jynx,
    gMonIcon_Electabuzz,
    gMonIcon_Magmar,
    gMonIcon_Pinsir,
    gMonIcon_Tauros,
    gMonIcon_Magikarp,
    gMonIcon_Gyarados,
    gMonIcon_Lapras,
    gMonIcon_Ditto,
    gMonIcon_Eevee,
    gMonIcon_Vaporeon,
    gMonIcon_Jolteon,
    gMonIcon_Flareon,
    gMonIcon_Porygon,
    gMonIcon_Omanyte,
    gMonIcon_Omastar,
    gMonIcon_Kabuto,
    gMonIcon_Kabutops,
    gMonIcon_Aerodactyl,
    gMonIcon_Snorlax,
    gMonIcon_Articuno,
    gMonIcon_Zapdos,
    gMonIcon_Moltres,
    gMonIcon_Dratini,
    gMonIcon_Dragonair,
    gMonIcon_Dragonite,
    gMonIcon_Mewtwo,
    gMonIcon_Mew,
    gMonIcon_Chikorita,
    gMonIcon_Bayleef,
    gMonIcon_Meganium,
    gMonIcon_Cyndaquil,
    gMonIcon_Quilava,
    gMonIcon_Typhlosion,
    gMonIcon_Totodile,
    gMonIcon_Croconaw,
    gMonIcon_Feraligatr,
    gMonIcon_Sentret,
    gMonIcon_Furret,
    gMonIcon_Hoothoot,
    gMonIcon_Noctowl,
    gMonIcon_Ledyba,
    gMonIcon_Ledian,
    gMonIcon_Spinarak,
    gMonIcon_Ariados,
    gMonIcon_Crobat,
    gMonIcon_Chinchou,
    gMonIcon_Lanturn,
    gMonIcon_Pichu,
    gMonIcon_Cleffa,
    gMonIcon_Igglybuff,
    gMonIcon_Togepi,
    gMonIcon_Togetic,
    gMonIcon_Natu,
    gMonIcon_Xatu,
    gMonIcon_Mareep,
    gMonIcon_Flaaffy,
    gMonIcon_Ampharos,
    gMonIcon_Bellossom,
    gMonIcon_Marill,
    gMonIcon_Azumarill,
    gMonIcon_Sudowoodo,
    gMonIcon_Politoed,
    gMonIcon_Hoppip,
    gMonIcon_Skiploom,
    gMonIcon_Jumpluff,
    gMonIcon_Aipom,
    gMonIcon_Sunkern,
    gMonIcon_Sunflora,
    gMonIcon_Yanma,
    gMonIcon_Wooper,
    gMonIcon_Quagsire,
    gMonIcon_Espeon,
    gMonIcon_Umbreon,
    gMonIcon_Murkrow,
    gMonIcon_Slowking,
    gMonIcon_Misdreavus,
    gMonIcon_UnownA,
    gMonIcon_Wobbuffet,
    gMonIcon_Girafarig,
    gMonIcon_Pineco,
    gMonIcon_Forretress,
    gMonIcon_Dunsparce,
    gMonIcon_Gligar,
    gMonIcon_Steelix,
    gMonIcon_Snubbull,
    gMonIcon_Granbull,
    gMonIcon_Qwilfish,
    gMonIcon_Scizor,
    gMonIcon_Shuckle,
    gMonIcon_Heracross,
    gMonIcon_Sneasel,
    gMonIcon_Teddiursa,
    gMonIcon_Ursaring,
    gMonIcon_Slugma,
    gMonIcon_Magcargo,
    gMonIcon_Swinub,
    gMonIcon_Piloswine,
    gMonIcon_Corsola,
    gMonIcon_Remoraid,
    gMonIcon_Octillery,
    gMonIcon_Delibird,
    gMonIcon_Mantine,
    gMonIcon_Skarmory,
    gMonIcon_Houndour,
    gMonIcon_Houndoom,
    gMonIcon_Kingdra,
    gMonIcon_Phanpy,
    gMonIcon_Donphan,
    gMonIcon_Porygon2,
    gMonIcon_Stantler,
    gMonIcon_Smeargle,
    gMonIcon_Tyrogue,
    gMonIcon_Hitmontop,
    gMonIcon_Smoochum,
    gMonIcon_Elekid,
    gMonIcon_Magby,
    gMonIcon_Miltank,
    gMonIcon_Blissey,
    gMonIcon_Raikou,
    gMonIcon_Entei,
    gMonIcon_Suicune,
    gMonIcon_Larvitar,
    gMonIcon_Pupitar,
    gMonIcon_Tyranitar,
    gMonIcon_Lugia,
    gMonIcon_HoOh,
    gMonIcon_Celebi,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_QuestionMark,
    gMonIcon_Treecko,
    gMonIcon_Grovyle,
    gMonIcon_Sceptile,
    gMonIcon_Torchic,
    gMonIcon_Combusken,
    gMonIcon_Blaziken,
    gMonIcon_Mudkip,
    gMonIcon_Marshtomp,
    gMonIcon_Swampert,
    gMonIcon_Poochyena,
    gMonIcon_Mightyena,
    gMonIcon_Zigzagoon,
    gMonIcon_Linoone,
    gMonIcon_Wurmple,
    gMonIcon_Silcoon,
    gMonIcon_Beautifly,
    gMonIcon_Cascoon,
    gMonIcon_Dustox,
    gMonIcon_Lotad,
    gMonIcon_Lombre,
    gMonIcon_Ludicolo,
    gMonIcon_Seedot,
    gMonIcon_Nuzleaf,
    gMonIcon_Shiftry,
    gMonIcon_Nincada,
    gMonIcon_Ninjask,
    gMonIcon_Shedinja,
    gMonIcon_Taillow,
    gMonIcon_Swellow,
    gMonIcon_Shroomish,
    gMonIcon_Breloom,
    gMonIcon_Spinda,
    gMonIcon_Wingull,
    gMonIcon_Pelipper,
    gMonIcon_Surskit,
    gMonIcon_Masquerain,
    gMonIcon_Wailmer,
    gMonIcon_Wailord,
    gMonIcon_Skitty,
    gMonIcon_Delcatty,
    gMonIcon_Kecleon,
    gMonIcon_Baltoy,
    gMonIcon_Claydol,
    gMonIcon_Nosepass,
    gMonIcon_Torkoal,
    gMonIcon_Sableye,
    gMonIcon_Barboach,
    gMonIcon_Whiscash,
    gMonIcon_Luvdisc,
    gMonIcon_Corphish,
    gMonIcon_Crawdaunt,
    gMonIcon_Feebas,
    gMonIcon_Milotic,
    gMonIcon_Carvanha,
    gMonIcon_Sharpedo,
    gMonIcon_Trapinch,
    gMonIcon_Vibrava,
    gMonIcon_Flygon,
    gMonIcon_Makuhita,
    gMonIcon_Hariyama,
    gMonIcon_Electrike,
    gMonIcon_Manectric,
    gMonIcon_Numel,
    gMonIcon_Camerupt,
    gMonIcon_Spheal,
    gMonIcon_Sealeo,
    gMonIcon_Walrein,
    gMonIcon_Cacnea,
    gMonIcon_Cacturne,
    gMonIcon_Snorunt,
    gMonIcon_Glalie,
    gMonIcon_Lunatone,
    gMonIcon_Solrock,
    gMonIcon_Azurill,
    gMonIcon_Spoink,
    gMonIcon_Grumpig,
    gMonIcon_Plusle,
    gMonIcon_Minun,
    gMonIcon_Mawile,
    gMonIcon_Meditite,
    gMonIcon_Medicham,
    gMonIcon_Swablu,
    gMonIcon_Altaria,
    gMonIcon_Wynaut,
    gMonIcon_Duskull,
    gMonIcon_Dusclops,
    gMonIcon_Roselia,
    gMonIcon_Slakoth,
    gMonIcon_Vigoroth,
    gMonIcon_Slaking,
    gMonIcon_Gulpin,
    gMonIcon_Swalot,
    gMonIcon_Tropius,
    gMonIcon_Whismur,
    gMonIcon_Loudred,
    gMonIcon_Exploud,
    gMonIcon_Clamperl,
    gMonIcon_Huntail,
    gMonIcon_Gorebyss,
    gMonIcon_Absol,
    gMonIcon_Shuppet,
    gMonIcon_Banette,
    gMonIcon_Seviper,
    gMonIcon_Zangoose,
    gMonIcon_Relicanth,
    gMonIcon_Aron,
    gMonIcon_Lairon,
    gMonIcon_Aggron,
    gMonIcon_Castform,
    gMonIcon_Volbeat,
    gMonIcon_Illumise,
    gMonIcon_Lileep,
    gMonIcon_Cradily,
    gMonIcon_Anorith,
    gMonIcon_Armaldo,
    gMonIcon_Ralts,
    gMonIcon_Kirlia,
    gMonIcon_Gardevoir,
    gMonIcon_Bagon,
    gMonIcon_Shelgon,
    gMonIcon_Salamence,
    gMonIcon_Beldum,
    gMonIcon_Metang,
    gMonIcon_Metagross,
    gMonIcon_Regirock,
    gMonIcon_Regice,
    gMonIcon_Registeel,
    gMonIcon_Kyogre,
    gMonIcon_Groudon,
    gMonIcon_Rayquaza,
    gMonIcon_Latias,
    gMonIcon_Latios,
    gMonIcon_Jirachi,
    gMonIcon_Deoxys,
    gMonIcon_Chimecho,
    gMonIcon_Egg,
    gMonIcon_UnownB,
    gMonIcon_UnownC,
    gMonIcon_UnownD,
    gMonIcon_UnownE,
    gMonIcon_UnownF,
    gMonIcon_UnownG,
    gMonIcon_UnownH,
    gMonIcon_UnownI,
    gMonIcon_UnownJ,
    gMonIcon_UnownK,
    gMonIcon_UnownL,
    gMonIcon_UnownM,
    gMonIcon_UnownN,
    gMonIcon_UnownO,
    gMonIcon_UnownP,
    gMonIcon_UnownQ,
    gMonIcon_UnownR,
    gMonIcon_UnownS,
    gMonIcon_UnownT,
    gMonIcon_UnownU,
    gMonIcon_UnownV,
    gMonIcon_UnownW,
    gMonIcon_UnownX,
    gMonIcon_UnownY,
    gMonIcon_UnownZ,
    gMonIcon_UnownExclamationMark,
    gMonIcon_UnownQuestionMark,
};

const u8 gMonIconPaletteIndices[] =
{
    0,
    1,
    1,
    1,
    0,
    0,
    0,
    0,
    2,
    2,
    1,
    1,
    0,
    1,
    2,
    2,
    0,
    0,
    0,
    2,
    1,
    0,
    0,
    2,
    2,
    2,
    0,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    0,
    0,
    2,
    1,
    0,
    0,
    2,
    2,
    1,
    0,
    0,
    0,
    0,
    0,
    2,
    2,
    2,
    1,
    1,
    1,
    2,
    1,
    2,
    0,
    0,
    0,
    0,
    0,
    2,
    2,
    2,
    0,
    2,
    0,
    1,
    1,
    1,
    2,
    2,
    1,
    1,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    1,
    2,
    2,
    0,
    0,
    0,
    1,
    1,
    1,
    2,
    2,
    1,
    2,
    2,
    1,
    1,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    2,
    2,
    0,
    1,
    2,
    1,
    0,
    2,
    2,
    0,
    0,
    2,
    2,
    2,
    0,
    0,
    0,
    0,
    0,
    0,
    2,
    2,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    2,
    2,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    0,
    0,
    1,
    0,
    2,
    2,
    0,
    0,
    0,
    1,
    2,
    2,
    0,
    0,
    2,
    0,
    0,
    1,
    2,
    2,
    1,
    1,
    1,
    1,
    2,
    2,
    1,
    1,
    1,
    0,
    0,
    2,
    2,
    2,
    0,
    0,
    0,
    0,
    1,
    0,
    2,
    2,
    2,
    0,
    0,
    2,
    0,
    0,
    1,
    2,
    0,
    0,
    2,
    0,
    0,
    2,
    2,
    0,
    0,
    0,
    0,
    2,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    2,
    1,
    2,
    2,
    1,
    1,
    1,
    1,
    1,
    0,
    2,
    0,
    1,
    0,
    1,
    0,
    1,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    2,
    2,
    2,
    2,
    0,
    2,
    0,
    2,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    1,
    1,
    1,
    2,
    2,
    1,
    1,
    1,
    0,
    0,
    2,
    0,
    2,
    0,
    0,
    2,
    1,
    1,
    0,
    0,
    1,
    2,
    0,
    0,
    0,
    0,
    0,
    2,
    0,
    0,
    0,
    1,
    1,
    1,
    2,
    1,
    1,
    0,
    1,
    0,
    2,
    2,
    0,
    1,
    1,
    2,
    0,
    1,
    0,
    2,
    0,
    2,
    0,
    0,
    2,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    2,
    2,
    1,
    1,
    2,
    1,
    0,
    2,
    2,
    0,
    0,
    0,
    0,
    0,
    0,
    2,
    0,
    1,
    2,
    2,
    2,
    0,
    0,
    2,
    2,
    0,
    0,
    0,
    1,
    1,
    1,
    2,
    2,
    0,
    0,
    0,
    0,
    2,
    2,
    2,
    2,
    0,
    1,
    0,
    2,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};

const struct SpritePalette gMonIconPaletteTable[] =
{
    { gMonIconPalettes[0], 56000 + 0 },
    { gMonIconPalettes[1], 56000 + 1 },
    { gMonIconPalettes[2], 56000 + 2 },



    { gMonIconPalettes[3], 56000 + 3 },
    { gMonIconPalettes[4], 56000 + 4 },
    { gMonIconPalettes[5], 56000 + 5 },
};

static const struct OamData sMonIconOamData =
{
    .size = 2,
    .priority = 1,
};



static const union AnimCmd sAnim_0[] =
{
    {.frame = {0, 6}},
    {.frame = {1, 6}},
    {.jump = {.type = -2, .target = 0}},
};

static const union AnimCmd sAnim_1[] =
{
    {.frame = {0, 8}},
    {.frame = {1, 8}},
    {.jump = {.type = -2, .target = 0}},
};

static const union AnimCmd sAnim_2[] =
{
    {.frame = {0, 14}},
    {.frame = {1, 14}},
    {.jump = {.type = -2, .target = 0}},
};

static const union AnimCmd sAnim_3[] =
{
    {.frame = {0, 22}},
    {.frame = {1, 22}},
    {.jump = {.type = -2, .target = 0}},
};

static const union AnimCmd sAnim_4[] =
{
    {.frame = {0, 29}},
    {.frame = {0, 29}},
    {.jump = {.type = -2, .target = 0}},
};

static const union AnimCmd *const sMonIconAnims[] =
{
    sAnim_0,
    sAnim_1,
    sAnim_2,
    sAnim_3,
    sAnim_4,
};

static const union AffineAnimCmd sAffineAnim_0[] =
{
    {.frame = {.xScale = 0, .yScale = 0, .rotation = 0, .duration = 10}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd sAffineAnim_1[] =
{
    {.frame = {.xScale = -2, .yScale = -2, .rotation = 0, .duration = 122}},
    {.type = 0x7FFF},
};

static const union AffineAnimCmd *const sMonIconAffineAnims[] =
{
    sAffineAnim_0,
    sAffineAnim_1,
};

const u16 sSpriteImageSizes[3][4] =
{

    {
         0x20,
         0x80,
        0x200,
        0x800,
    },


    {
         0x40,
         0x80,
        0x100,
        0x400,
    },


    {
         0x40,
         0x80,
        0x100,
        0x400,
    },
};

u16 GetUnownLetterByPersonality(u32);
const u8 *GetMonIconPtr(u16, u32 personality);
u8 UpdateMonIconFrame(struct Sprite *);
u8 CreateMonIconSprite(struct MonIconSpriteTemplate *, s16, s16, u8);
void sub_809D7E8(struct Sprite *);


u8 unref_sub_809D26C(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority)
{
    u8 spriteId;
    struct MonIconSpriteTemplate iconTemplate =
    {
        .oam = &sMonIconOamData,
        .image = gMonIconTable[species],
        .anims = sMonIconAnims,
        .affineAnims = sMonIconAffineAnims,
        .callback = callback,
        .paletteTag = 56000 + gMonIconPaletteIndices[species],
    };

    spriteId = CreateMonIconSprite(&iconTemplate, x, y, subpriority);

    UpdateMonIconFrame(&gSprites[spriteId]);

    return spriteId;
}

u8 CreateMonIcon(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority, u32 personality)
{
    u8 spriteId;
    struct MonIconSpriteTemplate iconTemplate =
    {
        .oam = &sMonIconOamData,
        .image = GetMonIconPtr(species, personality),
        .anims = sMonIconAnims,
        .affineAnims = sMonIconAffineAnims,
        .callback = callback,
        .paletteTag = 56000 + gMonIconPaletteIndices[species],
    };

    if (species > SPECIES_EGG)
        iconTemplate.paletteTag = 56000;

    spriteId = CreateMonIconSprite(&iconTemplate, x, y, subpriority);

    UpdateMonIconFrame(&gSprites[spriteId]);

    return spriteId;
}

u8 sub_809D3A4(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority)
{
    u8 spriteId;
    struct MonIconSpriteTemplate iconTemplate =
    {
        .oam = &sMonIconOamData,
        .image = gMonIconTable[species],
        .anims = sMonIconAnims,
        .affineAnims = sMonIconAffineAnims,
        .callback = callback,
        .paletteTag = 56000 + gMonIconPaletteIndices[species],
    };

    spriteId = CreateMonIconSprite(&iconTemplate, x, y, subpriority);

    UpdateMonIconFrame(&gSprites[spriteId]);

    return spriteId;
}

u16 mon_icon_convert_unown_species_id(u16 species, u32 personality)
{
    u16 result;

    if (species == SPECIES_UNOWN)
    {
        u16 letter = GetUnownLetterByPersonality(personality);
        if (letter == 0)
            letter = SPECIES_UNOWN;
        else
            letter += (SPECIES_UNOWN_B - 1);
        result = letter;
    }
    else
    {
        if (species > SPECIES_EGG)
            result = 260;
        else
            result = species;
    }

    return result;
}

u16 GetUnownLetterByPersonality(u32 personality)
{
    return (((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 0x3)) % 0x1C;
}

u16 sub_809D4A8(u16 species)
{
    u16 value;

    if (MailSpeciesToSpecies(species, &value) == SPECIES_UNOWN)
    {
        if (value == 0)
            value += SPECIES_UNOWN;
        else
            value += (SPECIES_UNOWN_B - 1);
        return value;
    }
    else
    {
        return mon_icon_convert_unown_species_id(species, 0);
    }
}

const u8 *GetMonIconPtr(u16 species, u32 personality)
{
    u16 convertedSpecies = mon_icon_convert_unown_species_id(species, personality);
    return gMonIconTable[convertedSpecies];
}

void sub_809D510(struct Sprite *sprite)
{
    sub_809D7E8(sprite);
}

void sub_809D51C(void)
{
    u8 i;
    for (i = 0; i < 6; i++)
        LoadSpritePalette(&gMonIconPaletteTable[i]);
}


void SafeLoadMonIconPalette(u16 species)
{
    u8 palIndex;
    if (species > SPECIES_EGG)
        species = 260;
    palIndex = gMonIconPaletteIndices[species];
    if (IndexOfSpritePaletteTag(gMonIconPaletteTable[palIndex].tag) == 0xFF)
        LoadSpritePalette(&gMonIconPaletteTable[palIndex]);
}

void sub_809D580(u16 species)
{
    u8 palIndex = gMonIconPaletteIndices[species];
    if (IndexOfSpritePaletteTag(gMonIconPaletteTable[palIndex].tag) == 0xFF)
        LoadSpritePalette(&gMonIconPaletteTable[palIndex]);
}


void FreeMonIconPalettes(void)
{
    u8 i;
    for (i = 0; i < 6; i++)
        FreeSpritePaletteByTag(gMonIconPaletteTable[i].tag);
}


void SafeFreeMonIconPalette(u16 species)
{
    u8 palIndex;
    if (species > SPECIES_EGG)
        species = 260;
    palIndex = gMonIconPaletteIndices[species];
    FreeSpritePaletteByTag(gMonIconPaletteTable[palIndex].tag);
}

void sub_809D608(u16 species)
{
    u8 palIndex;
    palIndex = gMonIconPaletteIndices[species];
    FreeSpritePaletteByTag(gMonIconPaletteTable[palIndex].tag);
}

void sub_809D62C(struct Sprite *sprite)
{
    UpdateMonIconFrame(sprite);
}


u8 UpdateMonIconFrame(struct Sprite *sprite)
{
    u8 result = 0;

    if (sprite->animDelayCounter == 0)
    {
        s16 frame = sprite->anims[sprite->animNum][sprite->animCmdIndex].frame.imageValue;

        switch (frame)
        {
        case -1:
            break;
        case -2:
            sprite->animCmdIndex = 0;
            break;
        default:
            RequestSpriteCopy(



                (u8 *)sprite->images + (sSpriteImageSizes[sprite->oam.shape][sprite->oam.size] * frame),
                (void *)(0x6000000 + 0x10000) + sprite->oam.tileNum * 32,
                sSpriteImageSizes[sprite->oam.shape][sprite->oam.size]);
            {
                register u8 duration asm("r0") = sprite->anims[sprite->animNum][sprite->animCmdIndex].frame.duration;
                sprite->animDelayCounter = duration;
            }
            sprite->animCmdIndex++;
            result = sprite->animCmdIndex;
            break;
        }
    }
    else
    {
        sprite->animDelayCounter--;
    }
    return result;
}

u8 CreateMonIconSprite(struct MonIconSpriteTemplate *iconTemplate, s16 x, s16 y, u8 subpriority)
{
    u8 spriteId;

    struct SpriteFrameImage image = { ((void *)0), sSpriteImageSizes[iconTemplate->oam->shape][iconTemplate->oam->size] };

    struct SpriteTemplate spriteTemplate =
    {
        .tileTag = 0xFFFF,
        .paletteTag = iconTemplate->paletteTag,
        .oam = iconTemplate->oam,
        .anims = iconTemplate->anims,
        .images = &image,
        .affineAnims = iconTemplate->affineAnims,
        .callback = iconTemplate->callback,
    };

    spriteId = CreateSprite(&spriteTemplate, x, y, subpriority);
    gSprites[spriteId].animPaused = 1;
    gSprites[spriteId].animBeginning = 0;
    gSprites[spriteId].images = (const struct SpriteFrameImage *)iconTemplate->image;
    return spriteId;
}

void sub_809D7E8(struct Sprite *sprite)
{
    struct SpriteFrameImage image = { ((void *)0), sSpriteImageSizes[sprite->oam.shape][sprite->oam.size] };
    sprite->images = &image;
    DestroySprite(sprite);
}

void sub_809D824(struct Sprite *sprite, u8 animNum)
{
    sprite->animNum = animNum;
    sprite->animDelayCounter = 0;
    sprite->animCmdIndex = 0;
}
