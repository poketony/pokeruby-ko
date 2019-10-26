# 1 "src/engine/naming_screen.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/engine/naming_screen.c"
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
# 2 "src/engine/naming_screen.c" 2
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
# 3 "src/engine/naming_screen.c" 2
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
# 4 "src/engine/naming_screen.c" 2
# 1 "include/field_effect.h" 1




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
# 6 "include/field_effect.h" 2

enum FieldEffectScriptIdx
{
    FLDEFF_EXCLAMATION_MARK_ICON_1,
    FLDEFF_USE_CUT_ON_GRASS,
    FLDEFF_USE_CUT_ON_TREE,
    FLDEFF_SHADOW,
    FLDEFF_TALL_GRASS,
    FLDEFF_RIPPLE,
    FLDEFF_FIELD_MOVE_SHOW_MON,
    FLDEFF_ASH,
    FLDEFF_SURF_BLOB,
    FLDEFF_USE_SURF,
    FLDEFF_DUST,
    FLDEFF_USE_SECRET_POWER_CAVE,
    FLDEFF_JUMP_TALL_GRASS,
    FLDEFF_SAND_FOOTPRINTS,
    FLDEFF_JUMP_BIG_SPLASH,
    FLDEFF_SPLASH,
    FLDEFF_JUMP_SMALL_SPLASH,
    FLDEFF_LONG_GRASS,
    FLDEFF_JUMP_LONG_GRASS,
    FLDEFF_UNKNOWN_19,
    FLDEFF_UNKNOWN_20,
    FLDEFF_UNKNOWN_21,
    FLDEFF_UNKNOWN_22,
    FLDEFF_BERRY_TREE_GROWTH_SPARKLE,
    FLDEFF_DEEP_SAND_FOOTPRINTS,
    FLDEFF_POKECENTER_HEAL,
    FLDEFF_USE_SECRET_POWER_TREE,
    FLDEFF_USE_SECRET_POWER_SHRUB,
    FLDEFF_TREE_DISGUISE,
    FLDEFF_MOUNTAIN_DISGUISE,
    FLDEFF_NPCFLY_OUT,
    FLDEFF_USE_FLY,
    FLDEFF_FLY_IN,
    FLDEFF_EXCLAMATION_MARK_ICON_2,
    FLDEFF_FEET_IN_FLOWING_WATER,
    FLDEFF_BIKE_TIRE_TRACKS,
    FLDEFF_SAND_DISGUISE,
    FLDEFF_USE_ROCK_SMASH,
    FLDEFF_USE_DIG,
    FLDEFF_SAND_PILE,
    FLDEFF_USE_STRENGTH,
    FLDEFF_SHORT_GRASS,
    FLDEFF_HOT_SPRINGS_WATER,
    FLDEFF_USE_WATERFALL,
    FLDEFF_USE_DIVE,
    FLDEFF_POKEBALL,
    FLDEFF_HEART_ICON,
    FLDEFF_NOP_47,
    FLDEFF_NOP_48,
    FLDEFF_POP_OUT_OF_ASH,
    FLDEFF_LAVARIDGE_GYM_WARP,
    FLDEFF_SWEET_SCENT,
    FLDEFF_SAND_PILLAR,
    FLDEFF_BUBBLES,
    FLDEFF_SPARKLE,
    FLDEFF_SECRET_POWER_CAVE,
    FLDEFF_SECRET_POWER_TREE,
    FLDEFF_SECRET_POWER_SHRUB,
    FLDEFF_CUT_GRASS,
    FLDEFF_FIELD_MOVE_SHOW_MON_INIT,
    FLDEFF_USE_FLY_ANCIENT_TOMB,
    FLDEFF_SECRET_BASE_PC_TURN_ON,
    FLDEFF_HALL_OF_FAME_RECORD,
    FLDEFF_USE_TELEPORT
};

extern const struct CompressedSpritePalette gTrainerFrontPicPaletteTable[2];
extern const struct SpritePalette gUnknown_0839F114;
extern const struct CompressedSpriteSheet gTrainerFrontPicTable[2];
extern const struct SpriteTemplate gSpriteTemplate_839F128;
extern const struct OamData gOamData_839F0F4;
extern struct SpriteTemplate gUnknown_02024E8C;

extern u8 gLastFieldPokeMenuOpened;

u32 FieldEffectStart(u8 id);
bool8 FieldEffectCmd_loadtiles(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadfadedpal(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadpal(u8 **script, u32 *val);
bool8 FieldEffectCmd_callnative(u8 **script, u32 *val);
bool8 FieldEffectCmd_end(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadgfx_callnative(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadtiles_callnative(u8 **script, u32 *val);
bool8 FieldEffectCmd_loadfadedpal_callnative(u8 **script, u32 *val);
u32 FieldEffectScript_ReadWord(u8 **script);
void FieldEffectScript_LoadTiles(u8 **script);
void FieldEffectScript_LoadFadedPalette(u8 **script);
void FieldEffectScript_LoadPalette(u8 **script);
void FieldEffectScript_CallNative(u8 **script, u32 *val);
void FieldEffectFreeGraphicsResources(struct Sprite *sprite);
void FieldEffectStop(struct Sprite *sprite, u8 id);
void FieldEffectFreeTilesIfUnused(u16 tileStart);
void FieldEffectFreePaletteIfUnused(u8 paletteNum);
void FieldEffectActiveListClear(void);
void FieldEffectActiveListAdd(u8 id);
void FieldEffectActiveListRemove(u8 id);
bool8 FieldEffectActiveListContains(u8 id);
void sub_807DE38(u8 index);

void SpriteCB_PokeballGlow(struct Sprite *);
void SpriteCB_PokecenterMonitor(struct Sprite *);
void SpriteCB_HallOfFameMonitor(struct Sprite *);

void sub_80865BC(void);

void PokecenterHealEffect_0(struct Task *);
void PokecenterHealEffect_1(struct Task *);
void PokecenterHealEffect_2(struct Task *);
void PokecenterHealEffect_3(struct Task *);

void HallOfFameRecordEffect_0(struct Task *);
void HallOfFameRecordEffect_1(struct Task *);
void HallOfFameRecordEffect_2(struct Task *);
void HallOfFameRecordEffect_3(struct Task *);

void PokeballGlowEffect_0(struct Sprite *);
void PokeballGlowEffect_1(struct Sprite *);
void PokeballGlowEffect_2(struct Sprite *);
void PokeballGlowEffect_3(struct Sprite *);
void PokeballGlowEffect_4(struct Sprite *);
void PokeballGlowEffect_5(struct Sprite *);
void PokeballGlowEffect_6(struct Sprite *);
void PokeballGlowEffect_7(struct Sprite *);

void sub_8086748(void);

bool8 sub_80867AC(struct Task *);
bool8 sub_8086854(struct Task *);
bool8 sub_8086870(struct Task *);
bool8 sub_80868E4(struct Task *);
bool8 sub_808699C(struct Task *);
bool8 sub_80869B8(struct Task *);
bool8 sub_80869F8(struct Task *);

void sub_8086A2C(u8, u8);

bool8 sub_8086AA0(struct Task *);
bool8 sub_8086AC0(struct Task *);
bool8 sub_8086B30(struct Task *);
bool8 sub_8086B54(struct Task *);
bool8 sub_8086B64(struct Task *);
bool8 sub_8086B88(struct Task *);

bool8 sub_8086CF4(struct Task *);
bool8 sub_8086D70(struct Task *);
bool8 sub_8086DB0(struct Task *);
bool8 sub_8086E10(struct Task *);
bool8 sub_8086E50(struct Task *);
bool8 sub_8086EB0(struct Task *);
bool8 sub_8086ED4(struct Task *);

bool8 sub_8086FB0(struct Task *, struct MapObject *);
bool8 waterfall_1_do_anim_probably(struct Task *, struct MapObject *);
bool8 waterfall_2_wait_anim_finish_probably(struct Task *, struct MapObject *);
bool8 sub_8087030(struct Task *, struct MapObject *);
bool8 sub_8087058(struct Task *, struct MapObject *);

bool8 sub_8087124(struct Task *);
bool8 dive_2_unknown(struct Task *);
bool8 dive_3_unknown(struct Task *);

void sub_80871B8(u8);

bool8 sub_808722C(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_8087264(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_8087298(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80872E4(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80873D8(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80873F4(struct Task *, struct MapObject *, struct Sprite *);

bool8 sub_80874CC(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80874FC(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_8087548(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_808759C(struct Task *, struct MapObject *, struct Sprite *);

void sub_8087654(u8);

bool8 sub_80876C8(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80876F8(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_8087774(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80877AC(struct Task *, struct MapObject *, struct Sprite *);
bool8 sub_80877D4(struct Task *, struct MapObject *, struct Sprite *);

void sub_80878F4(struct Task *);
void sub_8087914(struct Task *);

void sub_8087AA4(struct Task *);
void sub_8087AC8(struct Task *);

void sub_8087BEC(struct Task *);
void sub_8087C14(struct Task *);
void sub_8087CA4(struct Task *);
void sub_8087D78(struct Task *);

void sub_8087E4C(struct Task *);
void sub_8087ED8(struct Task *);
void sub_8087FDC(struct Task *);

void sub_8088150(struct Task *);
void sub_80881C0(struct Task *);
void sub_8088228(struct Task *);
void sub_80882B4(struct Task *);
void sub_80882E4(struct Task *);
void sub_8088338(struct Task *);
void sub_8088380(struct Task *);

void sub_80884AC(struct Task *);
void sub_80884E8(struct Task *);
void sub_8088554(struct Task *);
void sub_80885A8(struct Task *);
void sub_80885D8(struct Task *);
void sub_808860C(struct Task *);
void sub_808862C(struct Task *);

void sub_8088984(struct Task *);
void sub_80889E4(struct Task *);
void sub_8088A30(struct Task *);
void sub_8088A78(struct Task *);
void sub_8088AF4(struct Task *);

void sub_8088CA0(struct Task *);
void sub_8088CF8(struct Task *);
void sub_8088D3C(struct Task *);
void sub_8088D94(struct Task *);
void sub_8088DD8(struct Task *);
void sub_8088E2C(struct Task *);
void sub_8088EB4(struct Task *);
void sub_8088F10(struct Task *);
void sub_8088F30(struct Task *);

void sub_80892A0(struct Task *);
void sub_8089354(struct Task *);
void sub_80893C0(struct Task *);
void sub_8089414(struct Task *);
void sub_808948C(struct Task *);
void sub_80894C4(struct Task *);
void fishE(struct Task *);

u8 CreateTrainerSprite(u8 trainerSpriteID, s16 x, s16 y, u8 subpriority, u8 *buffer);
void LoadTrainerGfx_TrainerCard(u8 gender, u16 palOffset, u8 *dest);
u8 CreateBirchSprite(s16 x, s16 y, u8 subpriority);
u8 CreateMonSprite_PicBox(u16, s16, s16, u8);
void FreeResourcesAndDestroySprite(struct Sprite *sprite);
void MultiplyInvertedPaletteRGBComponents(u16, u8, u8, u8);
void sub_80878A8(void);
void sub_8087BA8(void);

extern s32 gFieldEffectArguments[8];
# 5 "src/engine/naming_screen.c" 2
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
# 6 "src/engine/naming_screen.c" 2
# 1 "include/field_player_avatar.h" 1






void player_step(u8 a, u16 b, u16 c);
u8 ForcedMovement_None(void);
u8 ForcedMovement_Slip(void);
u8 sub_8058AAC(void);
u8 sub_8058AC4(void);
u8 sub_8058ADC(void);
u8 sub_8058AF4(void);
u8 sub_8058B0C(void);
u8 sub_8058B24(void);
u8 sub_8058B3C(void);
u8 sub_8058B54(void);
u8 ForcedMovement_SlideSouth(void);
u8 ForcedMovement_SlideNorth(void);
u8 ForcedMovement_SlideWest(void);
u8 ForcedMovement_SlideEast(void);
u8 ForcedMovement_MatJump(void);
u8 sub_8058C10(void);
u8 ForcedMovement_MuddySlope(void);
void PlayerNotOnBikeNotMoving(u8 direction, u16 heldKeys);
void PlayerNotOnBikeTurningInPlace(u8 direction, u16 heldKeys);
void sub_8058D0C(u8 direction, u16 heldKeys);
u8 CheckForFieldObjectCollision(struct MapObject *a, s16 b, s16 c, u8 d, u8 e);
void SetPlayerAvatarTransitionFlags(u16 a);
void nullsub_49(struct MapObject *a);
void PlayerAvatarTransition_Normal(struct MapObject *a);
void PlayerAvatarTransition_MachBike(struct MapObject *a);
void PlayerAvatarTransition_AcroBike(struct MapObject *a);
void PlayerAvatarTransition_Surfing(struct MapObject *a);
void PlayerAvatarTransition_Underwater(struct MapObject *a);
void sub_80591F4(struct MapObject *a);
void sub_8059204(void);
u8 player_get_x22(void);
void PlayerSetAnimId(u8 a, u8 b);
void PlayerGoSpeed1(u8 a);
void PlayerGoSpeed2(u8 a);
void npc_use_some_d2s(u8 a);
void PlayerGoSpeed4(u8 a);
void sub_805940C(u8 a);
void PlayerOnBikeCollide(u8);
void PlayerFaceDirection(u8 a);
void PlayerTurnInPlace(u8 a);
void PlayerJumpLedge(u8 a);
void sub_80594C0(void);
void PlayerIdleWheelie(u8 a);
void PlayerStartWheelie(u8 a);
void PlayerEndWheelie(u8 a);
void PlayerStandingHoppingWheelie(u8 a);
void PlayerMovingHoppingWheelie(u8 a);
void PlayerLedgeHoppingWheelie(u8 a);
void PlayerAcroTurnJump(u8 a);
void sub_80595DC(u8 a);
void sub_8059600(u8 a);
void sub_8059618(u8 a);
void sub_8059630(u8 a);
void GetXYCoordsOneStepInFrontOfPlayer(s16 *x, s16 *y);
void PlayerGetDestCoords(s16 *, s16 *);
u8 player_get_direction_lower_nybble(void);
u8 player_get_direction_upper_nybble(void);
u8 PlayerGetZCoord(void);
u8 TestPlayerAvatarFlags(u8);
u8 sub_80597D0(void);
u8 GetPlayerAvatarObjectId(void);
void sub_80597E8(void);
void sub_80597F4(void);
u8 GetRivalAvatarGraphicsIdByStateIdAndGender(u8 a, u8 b);
u8 GetPlayerAvatarGraphicsIdByStateId(u8 a);
u8 GetPlayerAvatarGenderByGraphicsId(u8 gfxId);
bool8 PartyHasMonWithSurf(void);
bool8 IsPlayerSurfingNorth(void);
bool8 IsPlayerFacingSurfableFishableWater(void);
void ClearPlayerAvatarInfo(void);
void SetPlayerAvatarStateMask(u8 a);
u8 GetPlayerAvatarGraphicsIdByCurrentState(void);
void SetPlayerAvatarExtraStateTransition(u8 a, u8 b);
void InitPlayerAvatar(s16 a, s16 b, u8 c, u8 d);
void sub_8059B88(u8);
void sub_8059BF4(void);

void sub_8059C94(u8);
void sub_8059D08(u8);
u8 sub_8059E84(struct Task *task, struct MapObject *b, struct MapObject *c);
u8 sub_8059EA4(struct Task *task, struct MapObject *b, struct MapObject *c);
u8 sub_8059F40(struct Task *task, struct MapObject *b, struct MapObject *c);
u8 PlayerAvatar_DoSecretBaseMatJump(struct Task *task, struct MapObject *mapObject);
u8 sub_805A0D8(struct Task *task, struct MapObject *mapObject);
u8 sub_805A100(struct Task *task, struct MapObject *mapObject);
u8 sub_805A178(struct Task *task, struct MapObject *mapObject);
u8 sub_805A1B8(struct Task *task, struct MapObject *mapObject);
void sub_805A20C(u8 a);
void StartFishing(u8 a);
u8 Fishing1(struct Task *task);
u8 Fishing2(struct Task *task);
u8 Fishing3(struct Task *task);
u8 Fishing4(struct Task *task);
u8 Fishing5(struct Task *task);
u8 Fishing6(struct Task *task);
u8 Fishing7(struct Task *task);
u8 Fishing8(struct Task *task);
u8 Fishing9(struct Task *task);
u8 Fishing10(struct Task *task);
u8 Fishing11(struct Task *task);
u8 Fishing12(struct Task *task);
u8 Fishing13(struct Task *task);
u8 Fishing14(struct Task *task);
u8 Fishing15(struct Task *task);
u8 Fishing16(struct Task *task);
# 7 "src/engine/naming_screen.c" 2
# 1 "include/main.h" 1
# 8 "src/engine/naming_screen.c" 2
# 1 "include/menu.h" 1




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
# 9 "src/engine/naming_screen.c" 2
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
# 10 "src/engine/naming_screen.c" 2
# 1 "include/pokemon_icon.h" 1



u8 CreateMonIcon(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority, u32 personality);
u8 UpdateMonIconFrame(struct Sprite *sprite);
u8 sub_809D3A4(u16 arg0, void (*)(struct Sprite *), int, u8 arg3, u32 arg4);
u16 GetUnownLetterByPersonality(u32);
u16 sub_809D4A8(u16);
void sub_809D510(struct Sprite *);
void sub_809D51C(void);
void sub_809D580(u16);
void sub_809D608(u16);
void sub_809D62C(struct Sprite *sprite);
void sub_809D824(struct Sprite *sprite, u8 animNum);
# 11 "src/engine/naming_screen.c" 2
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
# 12 "src/engine/naming_screen.c" 2
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
# 13 "src/engine/naming_screen.c" 2
# 1 "include/sprite.h" 1
# 14 "src/engine/naming_screen.c" 2
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
# 15 "src/engine/naming_screen.c" 2
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
# 16 "src/engine/naming_screen.c" 2
# 1 "include/task.h" 1
# 17 "src/engine/naming_screen.c" 2
# 1 "include/text.h" 1
# 18 "src/engine/naming_screen.c" 2
# 1 "include/trig.h" 1



extern const s16 gSineTable[];

s16 Sin(s16 index, s16 amplitude);
s16 Cos(s16 index, s16 amplitude);
s16 Sin2(u16 angle);
s16 Cos2(u16 angle);
# 19 "src/engine/naming_screen.c" 2
# 1 "include/util.h" 1





extern const u8 gMiscBlank_Gfx[];
extern const u32 gBitTable[];

u8 CreateInvisibleSpriteWithCallback(void (*)(struct Sprite *));
void StoreWordInTwoHalfwords(u16 *, u32);
void LoadWordFromTwoHalfwords(u16 *, u32 *);
u16 CalcCRC16(u8 *data, int length);
void DoBgAffineSet(struct BgAffineDstData *dest, u32 texX, u32 texY, s16 scrX, s16 scrY, s16 sx, s16 sy, u16 alpha);
# 20 "src/engine/naming_screen.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 21 "src/engine/naming_screen.c" 2
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
# 22 "src/engine/naming_screen.c" 2



extern u16 gKeyRepeatStartDelay;

extern u8 CreateMonIcon(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority, u32 personality);

const u32 gSpriteImage_83CE094[] = INCBIN_U32("graphics/naming_screen/pc_icon/0.4bpp");
const u32 gSpriteImage_83CE154[] = INCBIN_U32("graphics/naming_screen/pc_icon/1.4bpp");


asm(".section .rodata\n@ XXX: what is this?\n    .align 2\n    .4byte 0x2000000\n");




extern u16 *const gUnknown_083CE28C[];
extern const struct SubspriteTable gSubspriteTables_83CE558[];
extern const struct SubspriteTable gSubspriteTables_83CE560[];
extern const struct SubspriteTable gSubspriteTables_83CE578[];
extern const struct SubspriteTable gSubspriteTables_83CE580[];
extern const struct SpriteTemplate gSpriteTemplate_83CE5C8;
extern const struct SpriteTemplate gSpriteTemplate_83CE5E0;
extern const struct SpriteTemplate gSpriteTemplate_83CE5F8;
extern const struct SpriteTemplate gSpriteTemplate_83CE610;
extern const struct SpriteTemplate gSpriteTemplate_83CE628;
extern const struct SpriteTemplate gSpriteTemplate_83CE640;
extern const struct SpriteTemplate gSpriteTemplate_83CE658;
extern const struct SpriteTemplate gSpriteTemplate_83CE670;
extern const struct SpriteTemplate gSpriteTemplate_83CE688;
extern const struct SpriteSheet gUnknown_083CE6A0[];
extern const struct SpritePalette gUnknown_083CE708[];
extern const u8 gNamingScreenMenu_Gfx[];
extern const u16 gNamingScreenPalettes[];
extern const u16 gUnknown_083CE748[];
extern const u16 gUnknown_083CEBF8[];
extern const u16 gUnknown_083CF0A8[];
extern const u16 gUnknown_08E86258[];

static void C2_NamingScreen(void);
static void sub_80B5AA0(void);
static void StoreNamingScreenParameters(u8, u8 *, u16, u16, u32, MainCallback);
static void NamingScreen_TurnOffScreen(void);
static void NamingScreen_Init(void);
static void NamingScreen_ClearVram(void);
static void NamingScreen_ClearOam(void);
static void NamingScreen_SetUpVideoRegs(void);
static void NamingScreen_SetUpWindow(void);
static void NamingScreen_ResetObjects(void);
static void sub_80B5DFC(void);
static void sub_80B5E20(void);
static void sub_80B5E3C(void);
static void NamingScreen_InitDisplayMode(void);
static void Task_DoNothing(u8);
static void sub_80B7558(void);
static void sub_80B753C(void);
static void sub_80B7680(void);
static void sub_80B75C4(void);
static void sub_80B7794(void);
static void sub_80B78A8(void);
static void sub_80B7960(void);
static void CursorInit(void);
static void sub_80B6A80(void);
static void sub_80B6CA8(void);
static void sub_80B6D04(void);
static void sub_80B6E44(void);
static void InputInit(void);
static void sub_80B6438(void);
static void sub_80B5E50(void);
static void Task_NamingScreenMain(u8);
static void SetInputState(u8);
static void sub_80B68D8(u8);
static bool8 HandleKeyboardEvent(void);
static bool8 IsCursorAnimFinished(void);
static void MoveCursorToOKButton(void);
static void sub_80B6B14(void);
static void StartPageSwapAnim(void);
static void sub_80B6888(u8);
static void sub_80B6460(u8, u8, u8);
static bool8 IsPageSwapAnimNotInProgress(void);
static void sub_80B7614(void);
static void GetCursorPos(s16 *, s16 *);
static void SetCursorPos(s16, s16);
static void sub_80B77F8(void);
static void sub_80B74B0(void);
static void DisplaySentToPCMessage(void);
static u8 GetKeyRoleAtCursorPos(void);
static u8 sub_80B61C8(void);
static void DeleteTextCharacter(void);
static void sub_80B7090(void);
static u8 GetInputEvent(void);
static bool8 sub_80B7004(void);
static void sub_80B6914(void);
static void Task_HandlePageSwapAnim(u8);
static void sub_80B6C48(u8, struct Sprite *, struct Sprite *);
static u8 GetTextCaretPosition(void);
static u8 GetCursorPosition(void);
static u8 GetCharAtKeyboardPos(s16, s16);
static bool8 sub_80B7104(void);
static bool8 sub_80B713C(void);
static void AddTextCharacter(u8);
static bool8 sub_80B7198(u8);
static bool8 sub_80B7264(u8);
static void sub_80B7370(u8, u8);
static void sub_80B73CC(u8, u8);
static bool8 sub_80B71E4(u8);
static void sub_80B7474(u8, u8);
static void sub_80B72A4(u8, u8);
static bool8 sub_80B720C(u8);
static void sub_80B7568(void);
static void sub_80B75B0(void);
static void sub_80B7698(u16 *, const u16 *);
static void sub_80B76E0();
static void nullsub_20(u8, u8);
static void PrintKeyboardCharacters(u8);

void DoNamingScreen(u8 templateNum, u8 *destBuffer, u16 c, u16 d, u32 e, MainCallback returnCallback)
{
    StoreNamingScreenParameters(templateNum, destBuffer, c, d, e, returnCallback);
    SetMainCallback2(C2_NamingScreen);
}

static void C2_NamingScreen(void)
{
    switch (gMain.state)
    {
    case 0:
        NamingScreen_TurnOffScreen();
        NamingScreen_Init();
        gMain.state++;
        break;
    case 1:
        NamingScreen_ClearVram();
        gMain.state++;
        break;
    case 2:
        NamingScreen_ClearOam();
        gMain.state++;
        break;
    case 3:
        NamingScreen_SetUpVideoRegs();
        gMain.state++;
        break;
    case 4:
        NamingScreen_SetUpWindow();
        gMain.state++;
        break;
    case 5:
        NamingScreen_ResetObjects();
        gMain.state++;
        break;
    case 6:
        sub_80B5DFC();
        gMain.state++;
        break;
    case 7:
        sub_80B5E20();
        sub_80B5E3C();
        NamingScreen_InitDisplayMode();
        SetMainCallback2(sub_80B5AA0);
        break;
    }
}

static void sub_80B5AA0(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB_NamingScreen(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    (*(vu16 *)(0x4000000 + 0x16)) = (*(struct NamingScreenData *)(gSharedMem + 0x0)).bg1vOffset;
    (*(vu16 *)(0x4000000 + 0x1a)) = (*(struct NamingScreenData *)(gSharedMem + 0x0)).bg2vOffset;
    (*(vu16 *)(0x4000000 + 0xa)) &= 0xFFFC;
    (*(vu16 *)(0x4000000 + 0xa)) |= (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk8;
    (*(vu16 *)(0x4000000 + 0xc)) &= 0xFFFC;
    (*(vu16 *)(0x4000000 + 0xc)) |= (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkA;
}

static void StoreNamingScreenParameters(u8 templateNum, u8 *destBuffer, u16 c, u16 d, u32 e, MainCallback returnCallback)
{
    struct Task *task;


    task = &gTasks[CreateTask(Task_DoNothing, 0xFF)];
    task->data[0] = templateNum;
    task->data[1] = c;
    task->data[2] = d;
    task->data[3] = e >> 16;
    task->data[4] = e;
    StoreWordInTwoHalfwords(&task->data[5], (u32)destBuffer);
    StoreWordInTwoHalfwords(&task->data[7], (u32)returnCallback);
}

static void GetNamingScreenParameters(void)
{
    u8 taskId;
    struct Task *task;

    taskId = FindTaskIdByFunc(Task_DoNothing);
    task = &gTasks[taskId];
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).templateNum = task->data[0];
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk3E = task->data[1];
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk40 = task->data[2];
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk42 = (task->data[3] << 16) | (u16)task->data[4];
    LoadWordFromTwoHalfwords(&task->data[5], (u32 *)&(*(struct NamingScreenData *)(gSharedMem + 0x0)).destBuffer);
    LoadWordFromTwoHalfwords(&task->data[7], (u32 *)&(*(struct NamingScreenData *)(gSharedMem + 0x0)).returnCallback);
    DestroyTask(taskId);
}

static void Task_DoNothing(u8 taskId)
{
}

static void NamingScreen_TurnOffScreen(void)
{
    SetVBlankCallback(((void *)0));
    SetHBlankCallback(((void *)0));
    (*(vu16 *)(0x4000000 + 0x0)) = 0;
}

static void NamingScreen_InitDisplayMode(void)
{
    u16 savedIme;

    SetVBlankCallback(VBlankCB_NamingScreen);
    savedIme = (*(vu16 *)(0x4000000 + 0x208));
    (*(vu16 *)(0x4000000 + 0x208)) = 0;
    (*(vu16 *)(0x4000000 + 0x200)) |= (1 << 0);
    (*(vu16 *)(0x4000000 + 0x208)) = savedIme;
    (*(vu16 *)(0x4000000 + 0x4)) |= 0x0008;
    (*(vu16 *)(0x4000000 + 0x0)) = 0x0000 | 0x0040 | 0x0F00 | 0x1000;
}

static void NamingScreen_ClearVram(void)
{
    u8 *addr = (void *)0x6000000;
    u32 size = 0x10000;

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
}

static void NamingScreen_ClearOam(void)
{
    { vu16 *_dest = (vu16 *)((void *)0x7000000); u32 _size = 0x400; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };
}

static void NamingScreen_SetUpVideoRegs(void)
{
    (*(vu16 *)(0x4000000 + 0x8)) = 0;
    (*(vu16 *)(0x4000000 + 0xa)) = 0;
    (*(vu16 *)(0x4000000 + 0xc)) = 0;
    (*(vu16 *)(0x4000000 + 0xe)) = 0;
    (*(vu16 *)(0x4000000 + 0x10)) = 0;
    (*(vu16 *)(0x4000000 + 0x12)) = 0;
    (*(vu16 *)(0x4000000 + 0x14)) = 0;
    (*(vu16 *)(0x4000000 + 0x16)) = 0;
    (*(vu16 *)(0x4000000 + 0x18)) = 0;
    (*(vu16 *)(0x4000000 + 0x1a)) = 0;
    (*(vu16 *)(0x4000000 + 0x1c)) = 0;
    (*(vu16 *)(0x4000000 + 0x1e)) = 0;
    (*(vu16 *)(0x4000000 + 0x8)) = (0) | ((0) << 2) | ((31) << 8) | 0x0000 | 0x0000;
    (*(vu16 *)(0x4000000 + 0xa)) = (1) | ((0) << 2) | ((28) << 8) | 0x0000 | 0x0000;
    (*(vu16 *)(0x4000000 + 0xc)) = (2) | ((2) << 2) | ((29) << 8) | 0x0000 | 0x0000;
    (*(vu16 *)(0x4000000 + 0xe)) = (3) | ((0) << 2) | ((30) << 8) | 0x0000 | 0x0000;
    (*(vu16 *)(0x4000000 + 0x50)) = 0x640;
    (*(vu16 *)(0x4000000 + 0x52)) = 0x80C;
}

static const struct NamingScreenTemplate *const sNamingScreenTemplates[];

static void NamingScreen_Init(void)
{
    GetNamingScreenParameters();
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).koreanState = 0;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).state = 0;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).bg1vOffset = 0;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).bg2vOffset = 0;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk8 = 1;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkA = 2;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkC = 0;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkD = 1;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).template = sNamingScreenTemplates[(*(struct NamingScreenData *)(gSharedMem + 0x0)).templateNum];
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage = (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->unk4;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk2 = 14 - (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars / 2;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk3C = gKeyRepeatStartDelay;
    memset((*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer, 0xFF, sizeof((*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer));
    if ((*(struct NamingScreenData *)(gSharedMem + 0x0)).template->unk0 != 0)
        StringCopy((*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer, (*(struct NamingScreenData *)(gSharedMem + 0x0)).destBuffer);
    StringCopy((*(struct NamingScreenData *)(gSharedMem + 0x0)).backupBuffer, (*(struct NamingScreenData *)(gSharedMem + 0x0)).destBuffer);
    gKeyRepeatStartDelay = 16;
}

static void NamingScreen_SetUpWindow(void)
{
    SetUpWindowConfig(&gWindowConfig_81E6E88);
    InitMenuWindow(&gWindowConfig_81E6E88);
}

static void NamingScreen_ResetObjects(void)
{
    ResetPaletteFade();
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
}

static void sub_80B5DFC(void)
{
    sub_80B7558();
    sub_80B753C();
    sub_80B7680();
    sub_80B75C4();
    sub_80B7794();
    sub_80B78A8();
    sub_80B7960();
}

static void sub_80B5E20(void)
{
    CursorInit();
    sub_80B6A80();
    sub_80B6CA8();
    sub_80B6D04();
    sub_80B6E44();
}

static void sub_80B5E3C(void)
{
    InputInit();
    sub_80B6438();
    sub_80B5E50();
}





static bool8 MainState_BeginFadeIn(struct Task *);
static bool8 MainState_WaitFadeIn(struct Task *);
static bool8 MainState_HandleInput(struct Task *);
static bool8 MainState_MoveToOKButton(struct Task *);
static bool8 MainState_StartPageSwap(struct Task *);
static bool8 MainState_WaitPageSwap(struct Task *);
static bool8 MainState_6(struct Task *);
static bool8 MainState_UpdateSentToPCMessage(struct Task *);
static bool8 MainState_BeginFadeInOut(struct Task *);
static bool8 MainState_WaitFadeOutAndExit(struct Task *);

static bool8 (*const sMainStateFuncs[])(struct Task *) =
{
    MainState_BeginFadeIn,
    MainState_WaitFadeIn,
    MainState_HandleInput,
    MainState_MoveToOKButton,
    MainState_StartPageSwap,
    MainState_WaitPageSwap,
    MainState_6,
    MainState_UpdateSentToPCMessage,
    MainState_BeginFadeInOut,
    MainState_WaitFadeOutAndExit,
};

static void sub_80B5E50(void)
{
    u8 taskId;

    taskId = CreateTask(Task_NamingScreenMain, 2);
    Task_NamingScreenMain(taskId);
}

static void Task_NamingScreenMain(u8 taskId)
{
    while (sMainStateFuncs[(*(struct NamingScreenData *)(gSharedMem + 0x0)).state](&gTasks[taskId]) != 0)
        ;
}

static bool8 MainState_BeginFadeIn(struct Task *task)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).state++;
    return 0;
}

static bool8 MainState_WaitFadeIn(struct Task *task)
{
    if (!gPaletteFade.active)
    {
        SetInputState(INPUT_STATE_ENABLED);
        sub_80B68D8(1);
        (*(struct NamingScreenData *)(gSharedMem + 0x0)).state++;
    }
    return 0;
}

static bool8 MainState_HandleInput(struct Task *task)
{
    return HandleKeyboardEvent();
}

static bool8 MainState_MoveToOKButton(struct Task *task)
{
    if (IsCursorAnimFinished())
    {
        SetInputState(INPUT_STATE_ENABLED);
        MoveCursorToOKButton();
        (*(struct NamingScreenData *)(gSharedMem + 0x0)).state = MAIN_STATE_HANDLE_INPUT;
    }
    return 0;
}

static bool8 MainState_StartPageSwap(struct Task *task)
{
    SetInputState(INPUT_STATE_DISABLED);
    sub_80B6B14();
    StartPageSwapAnim();
    sub_80B6888(1);
    sub_80B6460(0, 0, 1);
    PlaySE(SE_WIN_OPEN);
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).state = MAIN_STATE_WAIT_PAGE_SWAP;
    return 0;
}

static bool8 MainState_WaitPageSwap(struct Task *task)
{
    s16 cursorX;
    s16 cursorY;

    if (IsPageSwapAnimNotInProgress())
    {
        (*(struct NamingScreenData *)(gSharedMem + 0x0)).state = MAIN_STATE_HANDLE_INPUT;
        (*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage++;
        (*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage %= 3;
        sub_80B7614();
        sub_80B77F8();
        SetInputState(INPUT_STATE_ENABLED);
        GetCursorPos(&cursorX, &cursorY);
        SetCursorPos(cursorX, cursorY);
        sub_80B6888(0);
    }
    return 0;
}

static bool8 MainState_6(struct Task *task)
{
    sub_80B74B0();
    SetInputState(INPUT_STATE_DISABLED);
    sub_80B68D8(0);
    sub_80B6460(3, 0, 1);
    gKeyRepeatStartDelay = (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk3C;
    if ((*(struct NamingScreenData *)(gSharedMem + 0x0)).templateNum == NAMING_SCREEN_TEMPLATE_MON_NAME
     && CalculatePlayerPartyCount() >= 6)
    {
        DisplaySentToPCMessage();
        (*(struct NamingScreenData *)(gSharedMem + 0x0)).state = MAIN_STATE_UPDATE_SENT_TO_PC_MESSAGE;
        return 0;
    }
    else
    {
        (*(struct NamingScreenData *)(gSharedMem + 0x0)).state = MAIN_STATE_BEGIN_FADE_OUT;
        return 1;
    }
}

static bool8 MainState_UpdateSentToPCMessage(struct Task *task)
{
    if (MenuUpdateWindowText())
        (*(struct NamingScreenData *)(gSharedMem + 0x0)).state++;
    return 0;
}

static bool8 MainState_BeginFadeInOut(struct Task *task)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).state++;
    return 0;
}

static bool8 MainState_WaitFadeOutAndExit(struct Task *task)
{
    if (!gPaletteFade.active)
        SetMainCallback2((*(struct NamingScreenData *)(gSharedMem + 0x0)).returnCallback);
    return 0;
}





enum
{
    KEY_ROLE_CHAR,
    KEY_ROLE_PAGE,
    KEY_ROLE_BACKSPACE,
    KEY_ROLE_OK,
};


static bool8 KeyboardKeyHandler_Character(u8);
static bool8 KeyboardKeyHandler_Page(u8);
static bool8 KeyboardKeyHandler_Backspace(u8);
static bool8 KeyboardKeyHandler_OK(u8);

static bool8 (*const sKeyboardKeyHandlers[])(u8) =
{
    KeyboardKeyHandler_Character,
    KeyboardKeyHandler_Page,
    KeyboardKeyHandler_Backspace,
    KeyboardKeyHandler_OK,
};

static bool8 HandleKeyboardEvent(void)
{
    u8 event = GetInputEvent();
    u8 keyRole = GetKeyRoleAtCursorPos();

    if (event == 8)
        return sub_80B61C8();
    else if (event == 6)
    {
        DeleteTextCharacter();
        return 0;
    }
    else if (event == 7)
    {
        sub_80B7090();
        return 0;
    }
    return sKeyboardKeyHandlers[keyRole](event);
}

static bool8 KeyboardKeyHandler_Character(u8 event)
{
    sub_80B6460(3, 0, 0);
    if (event == 5)
    {
        u8 var = sub_80B7004();

        sub_80B6914();
        if (var)
        {
            SetInputState(INPUT_STATE_DISABLED);
            (*(struct NamingScreenData *)(gSharedMem + 0x0)).state = MAIN_STATE_MOVE_TO_OK_BUTTON;
        }
    }
    return 0;
}

static bool8 KeyboardKeyHandler_Page(u8 event)
{
    sub_80B6460(0, 1, 0);
    if (event == 5)
        return sub_80B61C8();
    else
        return 0;
}

static bool8 KeyboardKeyHandler_Backspace(u8 event)
{
    sub_80B6460(1, 1, 0);
    if (event == 5)
        DeleteTextCharacter();
    return 0;
}

static bool8 KeyboardKeyHandler_OK(u8 event)
{
    sub_80B6460(2, 1, 0);
    if (event == 5)
    {
        PlaySE(SE_SELECT);
        (*(struct NamingScreenData *)(gSharedMem + 0x0)).state = MAIN_STATE_6;
        return 1;
    }
    else
        return 0;
}

static bool8 sub_80B61C8(void)
{
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).state = MAIN_STATE_START_PAGE_SWAP;
    return 1;
}





enum
{
    FNKEY_CASE,
    FNKEY_BACK,
    FNKEY_OK,
};





static void InputState_Disabled(struct Task *);
static void InputState_Enabled(struct Task *);

static void (*const sInputStateFuncs[])(struct Task *) =
{
    InputState_Disabled,
    InputState_Enabled,
};

static void Task_HandleInput(u8);
static void HandleDpadMovement(struct Task *);

static void InputInit(void)
{
    CreateTask(Task_HandleInput, 1);
}

static u8 GetInputEvent(void)
{
    u8 taskId = FindTaskIdByFunc(Task_HandleInput);

    return gTasks[taskId].data[1];
}

static void SetInputState(u8 state)
{
    u8 taskId = FindTaskIdByFunc(Task_HandleInput);

    gTasks[taskId].data[0] = state;
}

static void Task_HandleInput(u8 taskId)
{
    sInputStateFuncs[gTasks[taskId].data[0]](&gTasks[taskId]);
}

static void InputState_Disabled(struct Task *task)
{
    task->data[1] = 0;
}

static void InputState_Enabled(struct Task *task)
{
    task->data[1] = 0;
    if (gMain.newKeys & 0x0001)
    {
        task->data[1] = 5;
        return;
    }
    if (gMain.newKeys & 0x0002)
    {
        task->data[1] = 6;
        return;
    }
    if (gMain.newKeys & 0x0004)
    {
        task->data[1] = 8;
        return;
    }
    if (gMain.newKeys & 0x0008)
    {
        task->data[1] = 9;
        MoveCursorToOKButton();
        return;
    }
    HandleDpadMovement(task);
}

static const s16 sDpadDeltaX[] =
{
    0,
    0,
    0,
    -1,
    1
};

static const s16 sDpadDeltaY[] =
{
    0,
    -1,
    1,
    0,
    0
};

static const s16 s4RowTo3RowTableY[] = {0, 1, 1, 2};
static const s16 gUnknown_083CE274[] = {0, 0, 3, 0};

static void HandleDpadMovement(struct Task *task)
{
    s16 cursorX;
    s16 cursorY;
    u16 dpadDir;
    s16 prevCursorX;

    GetCursorPos(&cursorX, &cursorY);
    dpadDir = 0;
    if (gMain.newAndRepeatedKeys & 0x0040)
        dpadDir = 1;
    if (gMain.newAndRepeatedKeys & 0x0080)
        dpadDir = 2;
    if (gMain.newAndRepeatedKeys & 0x0020)
        dpadDir = 3;
    if (gMain.newAndRepeatedKeys & 0x0010)
        dpadDir = 4;


    prevCursorX = cursorX;
    cursorX += sDpadDeltaX[dpadDir];
    cursorY += sDpadDeltaY[dpadDir];


    if (cursorX < 0)
        cursorX = 11 - 1;
    if (cursorX > 11 - 1)
        cursorX = 0;


    if (sDpadDeltaX[dpadDir] != 0)
    {
        if (cursorX == 11 - 1)
        {

            task->data[2] = cursorY;
            cursorY = s4RowTo3RowTableY[cursorY];
        }
        else if (prevCursorX == 11 - 1)
        {
            if (cursorY == 1)
                cursorY = task->data[2];
            else
                cursorY = gUnknown_083CE274[cursorY];
        }
    }

    if (cursorX == 11 - 1)
    {


        if (cursorY < 0)
            cursorY = 2;
        if (cursorY > 2)
            cursorY = 0;
        if (cursorY == 0)
            task->data[2] = FNKEY_BACK;
        else if (cursorY == 2)
            task->data[2] = FNKEY_OK;
    }
    else
    {
        if (cursorY < 0)
            cursorY = 3;
        if (cursorY > 3)
            cursorY = 0;
    }
    SetCursorPos(cursorX, cursorY);
}
# 804 "src/engine/naming_screen.c"
static void Task_80B64D4(u8);
static u16 sub_80B654C(u8);
static void sub_80B65AC(u8);
static void sub_80B65D4(struct Task *, u8, u8);

static void sub_80B6438(void)
{
    u8 taskId;

    taskId = CreateTask(Task_80B64D4, 3);
    gTasks[taskId].data[0] = 3;
}

static void sub_80B6460(u8 a, u8 b, u8 c)
{
    struct Task *task = &gTasks[FindTaskIdByFunc(Task_80B64D4)];

    if (a == task->data[0] && c == 0)
    {
        task->data[1] = b;
        task->data[2] = 1;
        return;
    }
    if (a == 3 && task->data[1] == 0 && c == 0)
        return;
    if (task->data[0] != 3)
        sub_80B65AC(task->data[0]);
    sub_80B65D4(task, a, b);
}

static void Task_80B64D4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (task->data[0] == 3 || task->data[2] == 0)
        return;
    MultiplyInvertedPaletteRGBComponents(sub_80B654C(task->data[0]), task->data[3], task->data[3], task->data[3]);
    if (task->data[5] != 0)
    {
        task->data[5]--;
        if (task->data[5] != 0)
            return;
    }
    task->data[5] = 2;
    task->data[3] += task->data[4];
    if (task->data[3] == 16)
        task->data[4] = -task->data[4];
    else if (task->data[3] == 0)
    {
        task->data[2] = task->data[1];
        task->data[4] = -task->data[4];
    }
}

static u16 sub_80B654C(u8 a)
{
    const u16 arr[] =
    {
        IndexOfSpritePaletteTag(4) * 16 + 0x10E,
        IndexOfSpritePaletteTag(6) * 16 + 0x10C,
        IndexOfSpritePaletteTag(6) * 16 + 0x10E,
    };

    return arr[a];
}

static void sub_80B65AC(u8 a)
{
    u16 index = sub_80B654C(a);

    gPlttBufferFaded[index] = gPlttBufferUnfaded[index];
}

static void sub_80B65D4(struct Task *task, u8 b, u8 c)
{
    task->data[0] = b;
    task->data[1] = c;
    task->data[2] = 1;
    task->data[3] = 15;
    task->data[4] = 1;
    task->data[5] = 0;
}
# 894 "src/engine/naming_screen.c"
static bool8 PageSwapAnimState_Init(struct Task *);
static bool8 PageSwapAnimState_1(struct Task *);
static bool8 PageSwapAnimState_2(struct Task *);
static bool8 PageSwapAnimState_Done(struct Task *);

static bool8 (*const sPageSwapAnimStateFuncs[])(struct Task *) =
{
    PageSwapAnimState_Init,
    PageSwapAnimState_1,
    PageSwapAnimState_2,
    PageSwapAnimState_Done,
};

static void StartPageSwapAnim(void)
{
    u8 taskId;

    taskId = CreateTask(Task_HandlePageSwapAnim, 0);
    Task_HandlePageSwapAnim(taskId);
}

static bool8 IsPageSwapAnimNotInProgress(void)
{
    if (FindTaskIdByFunc(Task_HandlePageSwapAnim) == 0xFF)
        return 1;
    else
        return 0;
}

static void Task_HandlePageSwapAnim(u8 taskId)
{
    while (sPageSwapAnimStateFuncs[gTasks[taskId].data[0]](&gTasks[taskId]) != 0)
        ;
}

static bool8 PageSwapAnimState_Init(struct Task *task)
{
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).bg1vOffset = 0;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).bg2vOffset = 0;
    task->data[0]++;
    return 0;
}

static bool8 PageSwapAnimState_1(struct Task *task)
{
    u16 *const arr[] =
    {
        &(*(struct NamingScreenData *)(gSharedMem + 0x0)).bg2vOffset,
        &(*(struct NamingScreenData *)(gSharedMem + 0x0)).bg1vOffset
    };

    task->data[1] += 4;
    *arr[(*(struct NamingScreenData *)(gSharedMem + 0x0)).unkC] = Sin(task->data[1], 40);
    *arr[(*(struct NamingScreenData *)(gSharedMem + 0x0)).unkD] = Sin((task->data[1] + 128) & 0xFF, 40);
    if (task->data[1] >= 64)
    {
        u8 temp = (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk8;

        (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk8 = (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkA;
        (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkA = temp;
        task->data[0]++;
    }
    return 0;
}

static bool8 PageSwapAnimState_2(struct Task *task)
{
    u16 *const arr[] = {&(*(struct NamingScreenData *)(gSharedMem + 0x0)).bg2vOffset, &(*(struct NamingScreenData *)(gSharedMem + 0x0)).bg1vOffset};

    task->data[1] += 4;
    *arr[(*(struct NamingScreenData *)(gSharedMem + 0x0)).unkC] = Sin(task->data[1], 40);
    *arr[(*(struct NamingScreenData *)(gSharedMem + 0x0)).unkD] = Sin((task->data[1] + 128) & 0xFF, 40);
    if (task->data[1] >= 128)
    {
        u8 temp = (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkC;

        (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkC = (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkD;
        (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkD = temp;
        task->data[0]++;
    }
    return 0;
}

static bool8 PageSwapAnimState_Done(struct Task *task)
{
    DestroyTask(FindTaskIdByFunc(Task_HandlePageSwapAnim));
    return 0;
}
# 990 "src/engine/naming_screen.c"
static void CursorInit(void)
{
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId = CreateSprite(&gSpriteTemplate_83CE640, 0, 0, 0);
    gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId].oam.priority = 1;
    gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId].oam.objMode = 1;
    gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId].data[6] = 1;
    gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId].data[6] = 2;
    SetCursorPos(0, 0);
}

static const u8 sKeyboardSymbolPositions[][11] = {
    {0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20},
    {0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20},
    {0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20},
};

static u8 CursorColToKeyboardCol(s16 x)
{
    return sKeyboardSymbolPositions[(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage][x];
}

static void SetCursorPos(s16 x, s16 y)
{
    struct Sprite *cursorSprite = &gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId];

    cursorSprite->pos1.x = CursorColToKeyboardCol(x) * 8 + 27;
    cursorSprite->pos1.y = y * 16 + 80;
    cursorSprite->data[2] = cursorSprite->data[0];
    cursorSprite->data[3] = cursorSprite->data[1];
    cursorSprite->data[0] = x;
    cursorSprite->data[1] = y;
}

static void GetCursorPos(s16 *x, s16 *y)
{
    struct Sprite *cursorSprite = &gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId];

    *x = cursorSprite->data[0];
    *y = cursorSprite->data[1];
}

static void MoveCursorToOKButton(void)
{
    SetCursorPos(11 - 1, 2);
}

static void sub_80B6888(u8 a)
{
    gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId].data[4] &= -256;
    gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId].data[4] |= a;
    StartSpriteAnim(&gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId], 0);
}

static void sub_80B68D8(u8 a)
{
    gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId].data[4] &= 0xFF;
    gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId].data[4] |= a << 8;
}

static void sub_80B6914(void)
{
    StartSpriteAnim(&gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId], 1);
}

static bool8 IsCursorAnimFinished(void)
{
    return gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).cursorSpriteId].animEnded;
}

static u8 GetKeyRoleAtCursorPos(void)
{
    const u8 keyRoles[] = {KEY_ROLE_PAGE, KEY_ROLE_BACKSPACE, KEY_ROLE_OK};
    s16 cursorX;
    s16 cursorY;

    GetCursorPos(&cursorX, &cursorY);
    if (cursorX < 11 - 1)
        return KEY_ROLE_CHAR;
    else
        return keyRoles[cursorY];
}

void sub_80B6998(struct Sprite *sprite)
{
    if (sprite->animEnded)
        StartSpriteAnim(sprite, 0);
    sprite->invisible = (sprite->data[4] & 0xFF);
    if (sprite->data[0] == 11 - 1)
        sprite->invisible = 1;
    if (sprite->invisible || (sprite->data[4] & 0xFF00) == 0
     || sprite->data[0] != sprite->data[2] || sprite->data[1] != sprite->data[3])
    {
        sprite->data[5] = 0;
        sprite->data[6] = 1;
        sprite->data[7] = 2;
    }
    sprite->data[7]--;
    if (sprite->data[7] == 0)
    {
        sprite->data[5] += sprite->data[6];
        if (sprite->data[5] == 16 || sprite->data[5] == 0)
            sprite->data[6] = -sprite->data[6];
        sprite->data[7] = 2;
    }
    if ((sprite->data[4] & 0xFF00) != 0)
    {
        s8 gb = sprite->data[5];
        s8 r = sprite->data[5] >> 1;
        u16 index = IndexOfSpritePaletteTag(5) * 16 + 0x0101;

        MultiplyInvertedPaletteRGBComponents(index, r, gb, gb);
    }
}

static void sub_80B6A80(void)
{
    u8 spriteId1;
    u8 spriteId2;
    u8 spriteId3;

    spriteId1 = CreateSprite(&gSpriteTemplate_83CE5C8, 0xCC, 0x50, 0);
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk10 = spriteId1;
    SetSubspriteTables(&gSprites[spriteId1], gSubspriteTables_83CE558);

    spriteId2 = CreateSprite(&gSpriteTemplate_83CE5F8, 0xCC, 0x4C, 1);
    gSprites[spriteId1].data[6] = spriteId2;
    SetSubspriteTables(&gSprites[spriteId2], gSubspriteTables_83CE560);

    spriteId3 = CreateSprite(&gSpriteTemplate_83CE5E0, 0xCC, 0x4B, 2);
    gSprites[spriteId3].oam.priority = 1;
    gSprites[spriteId1].data[7] = spriteId3;
}

static void sub_80B6B14(void)
{
    struct Sprite *sprite = &gSprites[(*(struct NamingScreenData *)(gSharedMem + 0x0)).unk10];

    sprite->data[0] = 2;
    sprite->data[1] = (*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage;
}

static u8 sub_80B6B5C(struct Sprite *);
static u8 sub_80B6B98(struct Sprite *);
static u8 sub_80B6B9C(struct Sprite *);
static u8 sub_80B6C08(struct Sprite *);

static u8 (*const gUnknown_083CE2B4[])(struct Sprite *) =
{
    sub_80B6B5C,
    sub_80B6B98,
    sub_80B6B9C,
    sub_80B6C08,
};

void sub_80B6B34(struct Sprite *sprite)
{
    while (gUnknown_083CE2B4[sprite->data[0]](sprite) != 0)
        ;
}

static u8 sub_80B6B5C(struct Sprite *sprite)
{
    struct Sprite *sprite1 = &gSprites[sprite->data[6]];
    struct Sprite *sprite2 = &gSprites[sprite->data[7]];

    sub_80B6C48((*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage, sprite1, sprite2);
    sprite->data[0]++;
    return 0;
}

static u8 sub_80B6B98(struct Sprite *sprite)
{
    return 0;
}

static u8 sub_80B6B9C(struct Sprite *sprite)
{
    struct Sprite *r4 = &gSprites[sprite->data[6]];
    struct Sprite *r5 = &gSprites[sprite->data[7]];

    r4->pos2.y++;
    if (r4->pos2.y > 7)
    {
        sprite->data[0]++;
        r4->pos2.y = -4;
        r4->invisible = 1;
        sub_80B6C48(((u8)sprite->data[1] + 1) % 3, r4, r5);
    }
    return 0;
}

static u8 sub_80B6C08(struct Sprite *sprite)
{
    struct Sprite *r2 = &gSprites[sprite->data[6]];

    r2->invisible = 0;
    r2->pos2.y++;
    if (r2->pos2.y >= 0)
    {
        r2->pos2.y = 0;
        sprite->data[0] = 1;
    }
    return 0;
}

static const u16 gUnknown_083CE2C4[] = {1, 3, 2};
static const u16 gUnknown_083CE2CA[] = {4, 6, 5};

static void sub_80B6C48(u8 a, struct Sprite *b, struct Sprite *c)
{
    c->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_083CE2C4[a]);
    b->sheetTileStart = GetSpriteTileStartByTag(gUnknown_083CE2CA[a]);
    b->subspriteTableNum = a;
}



static void sub_80B6CA8(void)
{
    u8 spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_83CE610, 0xCC, 0x6C, 0);
    SetSubspriteTables(&gSprites[spriteId], gSubspriteTables_83CE578);

    spriteId = CreateSprite(&gSpriteTemplate_83CE628, 0xCC, 0x84, 0);
    SetSubspriteTables(&gSprites[spriteId], gSubspriteTables_83CE578);
}

static void sub_80B6D04(void)
{
    u8 spriteId;
    s16 r1;
    u8 i;

    r1 = ((*(struct NamingScreenData *)(gSharedMem + 0x0)).unk2 - 1) * 8 + 4;
    spriteId = CreateSprite(&gSpriteTemplate_83CE658, r1, 0x28, 0);
    gSprites[spriteId].oam.priority = 3;
    r1 = (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk2 * 8 + 4;
    for (i = 0; i < (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars; i++, r1 += 8)
    {
        spriteId = CreateSprite(&gSpriteTemplate_83CE670, r1, 0x2C, 0);
        gSprites[spriteId].oam.priority = 3;
        gSprites[spriteId].data[0] = i;
    }
}

void sub_80B6D9C(struct Sprite *sprite)
{
    const s16 arr[] = {0, -4, -2, -1};

    if (sprite->data[0] == 0 || --sprite->data[0] == 0)
    {
        sprite->data[0] = 8;
        sprite->data[1] = (sprite->data[1] + 1) & 3;
    }
    sprite->pos2.x = arr[sprite->data[1]];
}

void sub_80B6DE8(struct Sprite *sprite)
{
    const s16 arr[] = {2, 3, 2, 1};
    u8 var;

    var = GetCursorPosition();
    if (var != (u8)sprite->data[0])
    {
        sprite->pos2.y = 0;
        sprite->data[1] = 0;
        sprite->data[2] = 0;
    }
    else
    {
        sprite->pos2.y = arr[sprite->data[1]];
        sprite->data[2]++;
        if (sprite->data[2] > 8)
        {
            sprite->data[1] = (sprite->data[1] + 1) & 3;
            sprite->data[2] = 0;
        }
    }
}



static void nullsub_40(void);
static void sub_80B6E68(void);
static void sub_80B6EBC(void);
static void sub_80B6EFC(void);

static void (*const gUnknown_083CE2E0[])(void) =
{
    nullsub_40,
    sub_80B6E68,
    sub_80B6EBC,
    sub_80B6EFC,
};

static void sub_80B6E44(void)
{
    gUnknown_083CE2E0[(*(struct NamingScreenData *)(gSharedMem + 0x0)).template->unk2]();
}

static void nullsub_40(void)
{
}

static void sub_80B6E68(void)
{
    u8 rivalGfxId;
    u8 spriteId;

    rivalGfxId = GetRivalAvatarGraphicsIdByStateIdAndGender(0, (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk3E);
    spriteId = AddPseudoFieldObject(rivalGfxId, SpriteCallbackDummy, 0x38, 0x18, 0);
    gSprites[spriteId].oam.priority = 3;
    StartSpriteAnim(&gSprites[spriteId], 4);
}

static void sub_80B6EBC(void)
{
    u8 spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_83CE688, 0x34, 0x18, 0);
    SetSubspriteTables(&gSprites[spriteId], gSubspriteTables_83CE580);
    gSprites[spriteId].oam.priority = 3;
}

static void sub_80B6EFC(void)
{
    u8 spriteId;

    sub_809D51C();
    spriteId = CreateMonIcon((*(struct NamingScreenData *)(gSharedMem + 0x0)).unk3E, SpriteCallbackDummy, 0x34, 0x18, 0, (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk42);
    gSprites[spriteId].oam.priority = 3;
}

static u8 GetTextCaretPosition(void)
{
    u8 i;

    for (i = 0; i < (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars; i++)
    {
        if ((*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i * 2] == 0xFF)
            return i * 2;
    }
    return (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2;
}

static u8 GetCursorPosition(void)
{
    u8 i;

    for (i = 0; i < (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars; i++)
    {
        if ((*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i * 2] == 0xFF)
            return i;
    }
    return (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars - 1;
}

static u8 GetPreviousTextCaretPosition(void)
{
    s8 i;

    for (i = (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars - 1; i > 0; i--)
    {
        if ((*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i * 2] != 0xFF)
            return i * 2;
    }
    return 0;
}

static void DeleteTextCharacter(void)
{
    u8 index;
    u8 var2, ch;
 u8 state;
 u16 korean;

 state = (*(struct NamingScreenData *)(gSharedMem + 0x0)).koreanState;


    index = GetPreviousTextCaretPosition();
 korean = ((*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] << 8) + (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index + 1];

 switch (state)
 {


 case 0:
 case 1:
  (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0xFF;
  (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index + 1] = 0xFF;
  break;

 case 2:
 case 3:
  state = 1;
  (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
  (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index + 1] = getCho(korean);
  break;

 case 4:
 case 5:
  ch = getJung(korean);
  if (ch == 0x1C || ch == 0x21 || ch == 0x26)
   state = 2;
  else
   state = 3;
  korean = MakeKorean(MakeCho(getCho(korean)), MakeJung(getJung(korean)), 0);
  (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
  (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index + 1] = korean & 0x00FF;
  break;

 case 6:
  state = 4;
  korean = MakeKorean(MakeCho(getCho(korean)), MakeJung(getJung(korean)), SplitJong(isHavingJong(korean), 0));
  (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
  (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index + 1] = korean & 0x00FF;
  break;
 }

 (*(struct NamingScreenData *)(gSharedMem + 0x0)).koreanState = state;
    sub_80B7960();
    var2 = GetKeyRoleAtCursorPos();
    if (var2 == 0 || var2 == 2)
        sub_80B6460(1, 0, 1);
    PlaySE(SE_BOWA);
}

static bool8 sub_80B7004(void)
{
    s16 x;
    s16 y;
    u8 ch;
    bool8 r4;

    GetCursorPos(&x, &y);
    x = CursorColToKeyboardCol(x);
    ch = GetCharAtKeyboardPos(x, y);
    r4 = 1;
    if (ch == 0xFF)
        r4 = sub_80B7104();
    else if (ch == 0xFE)
        r4 = sub_80B713C();
    else
        AddTextCharacter(ch);
    sub_80B7960();
    PlaySE(SE_SELECT);
    return 0;
}

static void sub_80B7090(void)
{
    u8 r5;
    u8 r4;

    r5 = GetPreviousTextCaretPosition();
    r4 = (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[r5];
    if (sub_80B7198(r4))
    {
        if (sub_80B7264(r4))
            sub_80B7370(r4, r5);
        else
            sub_80B73CC(r4, r5);
    }
    else
    {
        if (sub_80B71E4(r4))
            sub_80B7474(r4, r5);
        else
            sub_80B72A4(r4, r5);
    }
    sub_80B7960();
    PlaySE(SE_SELECT);
}

static bool8 sub_80B7104(void)
{
    u8 r5;
    u8 r4;

    r5 = GetPreviousTextCaretPosition();
    r4 = (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[r5];
    if (sub_80B720C(r4))
    {
        sub_80B72A4(r4, r5);
        return 1;
    }
    return 0;
}

static bool8 sub_80B713C(void)
{
    u8 r5;
    u8 r4;

    r5 = GetPreviousTextCaretPosition();
    r4 = (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[r5];
    if (sub_80B7264(r4))
    {
        sub_80B7370(r4, r5);
        return 1;
    }
    return 0;
}

static void AddTextCharacter(u8 ch)
{
    u8 index = GetTextCaretPosition();
 u8 state = (*(struct NamingScreenData *)(gSharedMem + 0x0)).koreanState;
 u8 prevHigh, prevLow;
 u16 korean, prevKorean;


 if (index >= 2)
 {
  prevHigh = (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index - 2];
  prevLow = (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index - 1];
  prevKorean = (prevHigh << 8) + prevLow;
 }

 if (ch >= 0xA1 || ch == 0x00)
 {
  if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
   return;
  (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0;
  index++;
  (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
  state = 0;
 } else
 {
  switch (state)
  {

  case 0:
   if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
    return;
   (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
   index++;
   (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
   if (distJamo(ch) == 0)
    state = 1;
   break;


  case 1:
   if (distJamo(ch) == 1)
   {
    korean = MakeKorean(MakeCho(prevLow), MakeJung(ch), 0);

    if (korean == 0xFFFF)
    {
     state = 0;
     if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
      return;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
    } else
    {
     index -= 2;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0x00FF);


     if (ch == 0x1C || ch == 0x21 || ch == 0x26)
      state = 2;
     else
      state = 3;
    }
   } else
   {
    if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
     return;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
    index++;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
   }
   break;


  case 2:
   if (distJamo(ch) == 1)
   {

    if (DoubleJung(getJung(prevKorean), ch) == 0)
    {
     state = 0;
     if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
      return;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
    } else
    {
     korean = MakeKorean(MakeCho(getCho(prevKorean)), MakeJung(DoubleJung(getJung(prevKorean), ch)), 0);

     if (korean == 0xFFFF)
     {
      state = 0;
      if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
       return;
      (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
      index++;
      (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
     } else
     {
      index -= 2;
      (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
      index++;
      (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0x00FF);
      state = 3;
     }
    }
   } else
   {
    korean = MakeKorean(MakeCho(getCho(prevKorean)), MakeJung(getJung(prevKorean)), MakeJong(ch));

    if (korean == 0xFFFF || MakeJong(ch) == 0xFF)
    {
     state = 1;
     if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
      return;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
    } else
    {
     index -= 2;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0x00FF);
     state = 5;
    }
   }
   break;


  case 3:
   if (distJamo(ch) == 1)
   {
    if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
     return;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
    index++;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
   } else
   {
    korean = MakeKorean(MakeCho(getCho(prevKorean)), MakeJung(getJung(prevKorean)), MakeJong(ch));

    if (korean == 0xFFFF || MakeJong(ch) == 0xFF)
    {
     state = 1;
     if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
      return;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
    } else
    {
     index -= 2;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0x00FF);


     if (ch == 0x01 || ch == 0x03 || ch == 0x06 || ch == 0x08)
      state = 4;
     else
      state = 5;
    }
   }
   break;


  case 4:
   if (distJamo(ch) == 0)
   {

    if (DoubleJong(getJong(prevKorean), ch) == 0)
    {
     state = 1;
     if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
      return;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
    } else
    {
     korean = MakeKorean(MakeCho(getCho(prevKorean)), MakeJung(getJung(prevKorean)), DoubleJong(getJong(prevKorean), ch));

     if (korean == 0xFFFF)
     {
      state = 0;
      if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
       return;
      (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
      index++;
      (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
     } else
     {
      index -= 2;
      (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
      index++;
      (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0x00FF);
      state = 6;
     }
    }
   } else
   {
    if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
     return;


    korean = MakeKorean(MakeCho(getCho(prevKorean)), MakeJung(getJung(prevKorean)), 0);
    index -= 2;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
    index++;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0x00FF);
    index++;


    korean = MakeKorean(MakeCho(getJong(prevKorean)), MakeJung(ch), 0);

    if (korean == 0xFFFF)
    {
     state = 0;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
    } else
    {
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0x00FF);

     if (ch == 0x1C || ch == 0x21 || ch == 0x26)
      state = 2;
     else
      state = 3;
    }
   }
   break;


  case 5:
   if (distJamo(ch) == 0)
   {
    state = 1;
    if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
     return;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
    index++;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
   } else
   {
    if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
     return;


    korean = MakeKorean(MakeCho(getCho(prevKorean)), MakeJung(getJung(prevKorean)), 0);
    index -= 2;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
    index++;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0x00FF);
    index++;


    korean = MakeKorean(MakeCho(getJong(prevKorean)), MakeJung(ch), 0);

    if (korean == 0xFFFF)
    {
     state = 0;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
    } else
    {
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0x00FF);

     if (ch == 0x1C || ch == 0x21 || ch == 0x26)
      state = 2;
     else
      state = 3;
    }
   }
   break;

  case 6:
   if (distJamo(ch) == 0)
   {
    state = 1;
    if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
     return;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
    index++;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
   } else
   {
    if (index == (*(struct NamingScreenData *)(gSharedMem + 0x0)).template->maxChars * 2)
     return;


    korean = MakeKorean(MakeCho(getCho(prevKorean)), MakeJung(getJung(prevKorean)), SplitJong(isHavingJong(prevKorean), 0));
    index -= 2;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
    index++;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0x00FF);
    index++;


    korean = MakeKorean(MakeCho(JongToCho(SplitJong(isHavingJong(prevKorean), 1))), MakeJung(ch), 0);

    if (korean == 0xFFFF)
    {
     state = 0;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = 0x41;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = ch;
    } else
    {
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0xFF00) >> 8;
     index++;
     (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[index] = (korean & 0x00FF);

     if (ch == 0x1C || ch == 0x21 || ch == 0x26)
      state = 2;
     else
      state = 3;
    }
   }
   break;
  }
 }

 (*(struct NamingScreenData *)(gSharedMem + 0x0)).koreanState = state;
}

static bool8 sub_80B7198(u8 a)
{
    if ((a >= 55 && a <= 74)
     || (a >= 135 && a <= 139)
     || (a >= 140 && a <= 144)
     || (a >= 145 && a <= 149)
     || (a >= 150 && a <= 154))
        return 1;
    else
        return 0;
}

static bool8 sub_80B71E4(u8 a)
{
    if ((a >= 75 && a <= 79)
     || (a >= 155 && a <= 159))
        return 1;
    else
        return 0;
}

static bool8 sub_80B720C(u8 a)
{
    if ((a >= 6 && a <= 20)
     || (a >= 26 && a <= 30)
     || (a >= 75 && a <= 79)
     || (a >= 86 && a <= 100)
     || (a >= 106 && a <= 110)
     || (a >= 155 && a <= 159))
        return 1;
    else
        return 0;
}

static bool8 sub_80B7264(u8 a)
{
    if ((a >= 26 && a <= 30)
     || (a >= 70 && a <= 74)
     || (a >= 106 && a <= 110)
     || (a >= 150 && a <= 154))
        return 1;
    else
        return 0;
}

static void sub_80B72A4(u8 a, u8 b)
{
    u8 chr = a;

    if (a >= 6 && a <= 10)
        chr = a + 0x31;
    else if (a >= 11 && a <= 15)
        chr = a + 0x31;
    else if (a >= 16 && a <= 20)
        chr = a + 0x31;
    else if (a >= 26 && a <= 30)
        chr = a + 0x2C;
    else if (a >= 75 && a <= 79)
        chr = a + 0xFB;
    else if (a >= 86 && a <= 90)
        chr = a + 0x31;
    else if (a >= 91 && a <= 95)
        chr = a + 0x31;
    else if (a >= 96 && a <= 100)
        chr = a + 0x31;
    else if (a >= 106 && a <= 110)
        chr = a + 0x2C;
    else if (a >= 155 && a <= 159)
        chr = a + 0xFB;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[b] = chr;
}

static void sub_80B7370(u8 a, u8 b)
{
    u8 chr = a;

    if (a >= 26 && a <= 30)
        chr = a + 0x31;
    else if (a >= 70 && a <= 74)
        chr = a + 5;
    else if (a >= 106 && a <= 110)
        chr = a + 0x31;
    else if (a >= 150 && a <= 154)
        chr = a + 5;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[b] = chr;
}

static void sub_80B73CC(u8 a, u8 b)
{
    u8 chr = a;

    if (a >= 55 && a <= 59)
        chr = a + 0xCF;
    else if (a >= 60 && a <= 64)
        chr = a + 0xCF;
    else if (a >= 65 && a <= 69)
        chr = a + 0xCF;
    else if (a >= 70 && a <= 74)
        chr = a + 0xD4;
    else if (a >= 135 && a <= 139)
        chr = a + 0xCF;
    else if (a >= 140 && a <= 144)
        chr = a + 0xCF;
    else if (a >= 145 && a <= 149)
        chr = a + 0xCF;
    else if (a >= 150 && a <= 154)
        chr = a + 0xD4;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[b] = chr;
}

static void sub_80B7474(u8 a, u8 b)
{
    u8 chr = a;

    if (a >= 75 && a <= 79)
        chr = a + 0xCF;
    else if (a >= 155 && a <= 159)
        chr = a + 0xCF;
    (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[b] = chr;
}

static void sub_80B74B0(void)
{
    u8 i, j;

 for (i = 0, j = 0; (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i] != 0xFF; i += 2)
 {
  if ((*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i] == 0)
  {
   (*(struct NamingScreenData *)(gSharedMem + 0x0)).destBuffer[j] = (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i + 1];
   j++;
  } else
  {
   (*(struct NamingScreenData *)(gSharedMem + 0x0)).destBuffer[j++] = (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i];
   (*(struct NamingScreenData *)(gSharedMem + 0x0)).destBuffer[j++] = (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i + 1];
  }
 }
 (*(struct NamingScreenData *)(gSharedMem + 0x0)).destBuffer[j] = 0xFF;


 for (i = 0; (*(struct NamingScreenData *)(gSharedMem + 0x0)).destBuffer[i] != 0xFF; i++)
 {
  if ((*(struct NamingScreenData *)(gSharedMem + 0x0)).destBuffer[i] != 0xFF)
   j++;
 }

 if (j == 0)
 {
  StringCopy((*(struct NamingScreenData *)(gSharedMem + 0x0)).destBuffer, (*(struct NamingScreenData *)(gSharedMem + 0x0)).backupBuffer);
 }
}

static void DisplaySentToPCMessage(void)
{
    StringCopy(gStringVar1, (*(struct NamingScreenData *)(gSharedMem + 0x0)).destBuffer);
    StringExpandPlaceholders(gStringVar4, gOtherText_SentToPC);
    BasicInitMenuWindow(&gWindowConfig_81E6E88);
    MenuDisplayMessageBox();
    MenuPrintMessageDefaultCoords(gStringVar4);
}

static void sub_80B753C(void)
{
    LoadSpriteSheets(gUnknown_083CE6A0);
    LoadSpritePalettes(gUnknown_083CE708);
}

static void sub_80B7558(void)
{
    sub_80B7568();
    sub_80B75B0();
}

static void sub_80B7568(void)
{
    const void *src;
    void *dst;

    src = gNamingScreenMenu_Gfx;
    dst = (void *)(0x6000000 + gMenuMessageBoxContentTileOffset * 32);
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(src); dmaRegs[1] = (vu32)(dst); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((0x800)/(16/8))); dmaRegs[2]; };

    src = gNamingScreenMenu_Gfx;
    dst = (void *)(0x6000000 + 0x8000 + gMenuMessageBoxContentTileOffset * 32);
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(src); dmaRegs[1] = (vu32)(dst); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((0x800)/(16/8))); dmaRegs[2]; };
}

static void sub_80B75B0(void)
{
    LoadPalette(gNamingScreenPalettes, 0, 0x80);
}

static void sub_80B7650(u16 *);
static void sub_80B7660(u16 *);
static void sub_80B7670(u16 *);

static void (*const gUnknown_083CE2F0[][2])(u16 *) =
{
    {sub_80B7660, sub_80B7650},
    {sub_80B7650, sub_80B7670},
    {sub_80B7670, sub_80B7660},
};

static void sub_80B75C4(void)
{
    u16 *const arr[] =
    {
        (u16 *)(0x6000000 + 0xE000),
        (u16 *)(0x6000000 + 0xE800),
    };

    gUnknown_083CE2F0[(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage][0](arr[(*(struct NamingScreenData *)(gSharedMem + 0x0)).unkC]);
    gUnknown_083CE2F0[(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage][1](arr[(*(struct NamingScreenData *)(gSharedMem + 0x0)).unkD]);
}

static void sub_80B7614(void)
{
    u16 *const arr[] =
    {
        (u16 *)(0x6000000 + 0xE000),
        (u16 *)(0x6000000 + 0xE800),
    };

    gUnknown_083CE2F0[(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage][1](arr[(*(struct NamingScreenData *)(gSharedMem + 0x0)).unkD]);
}

static void sub_80B7650(u16 *vramBuffer)
{
    sub_80B7698(vramBuffer, gUnknown_083CE748);
}

static void sub_80B7660(u16 *vramBuffer)
{
    sub_80B7698(vramBuffer, gUnknown_083CEBF8);
}

static void sub_80B7670(u16 *vramBuffer)
{
    sub_80B7698(vramBuffer, gUnknown_083CF0A8);
}

static void sub_80B7680(void)
{
    sub_80B76E0(0x6000000 + 0xF000, gUnknown_08E86258);
}

static void sub_80B7698(u16 *vramBuffer, const u16 *src)
{
    s16 i;
    s16 j;

    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 30; j++, src++)
        {
            vramBuffer[i * 32 + j] = *src + gMenuMessageBoxContentTileOffset;
        }
    }
}

static void sub_80B76E0(u16 *vramBuffer, const u16 *src)
{
    s16 i;
    s16 j;

    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 30; j++, src++)
        {
            vramBuffer[i * 32 + j] = *src + gMenuMessageBoxContentTileOffset;
        }
        src += 2;
    }
}

static void sub_80B772C(void)
{
    nullsub_20((*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage, (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkC);
}

static void sub_80B7740(void)
{
    nullsub_20(((*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage + 1) % 3, (*(struct NamingScreenData *)(gSharedMem + 0x0)).unkD);
}

static void nullsub_20(u8 a, u8 b)
{
}

static void sub_80B7838(void);
static void sub_80B7844(void);
static void sub_80B7850(void);

static void (*const gUnknown_083CE310[][2])(void) =
{
    sub_80B7844,
    sub_80B7838,
    sub_80B7838,
    sub_80B7850,
    sub_80B7850,
    sub_80B7844,
};

static const struct WindowConfig *const gUnknown_083CE328[][2][2] =
{
    {
        {&gWindowConfig_81E6EDC, &gWindowConfig_81E6EF8},
        {&gWindowConfig_81E6EA4, &gWindowConfig_81E6EC0},
    },
    {
        {&gWindowConfig_81E6EA4, &gWindowConfig_81E6EC0},
        {&gWindowConfig_81E6F14, &gWindowConfig_81E6F30},
    },
    {
        {&gWindowConfig_81E6F14, &gWindowConfig_81E6F30},
        {&gWindowConfig_81E6EDC, &gWindowConfig_81E6EF8},
    },
};

static void nullsub_61(void);
static void sub_80B78F8(void);

static void (*const gUnknown_083CE358[])(void) =
{
    nullsub_61,
    nullsub_61,
    sub_80B78F8,
    sub_80B78F8,
};

static void nullsub_62(void);
static void sub_80B7924(void);

static void (*const gUnknown_083CE368[])(void) =
{
    nullsub_62,
    sub_80B7924,
};

static const u8 sKoreanCharacters[][20];
static const u8 sKeyboardCharacters[][4][40];

static u8 GetCharAtKeyboardPos(s16 a, s16 b)
{
 if (!(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage)
  return sKoreanCharacters[b][a];
 else
  return sKeyboardCharacters[(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage][b][a];
}

static void sub_80B7794(void)
{
    BasicInitMenuWindow(gUnknown_083CE328[(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage][0][(*(struct NamingScreenData *)(gSharedMem + 0x0)).unkC]);
    gUnknown_083CE310[(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage][0]();
    BasicInitMenuWindow(gUnknown_083CE328[(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage][1][(*(struct NamingScreenData *)(gSharedMem + 0x0)).unkD]);
    gUnknown_083CE310[(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage][1]();
    sub_80B772C();
    sub_80B7740();
}

static void sub_80B77F8(void)
{
    BasicInitMenuWindow(gUnknown_083CE328[(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage][1][(*(struct NamingScreenData *)(gSharedMem + 0x0)).unkD]);
    gUnknown_083CE310[(*(struct NamingScreenData *)(gSharedMem + 0x0)).currentPage][1]();
    sub_80B7740();
}

static void sub_80B7838(void)
{
    PrintKeyboardCharacters(1);
}

static void sub_80B7844(void)
{
    PrintKeyboardCharacters(0);
}

static void sub_80B7850(void)
{
    PrintKeyboardCharacters(2);
}

static void PrintKeyboardCharacters(u8 page)
{
    s16 i;
    s16 r5;

 SetCustomFont(1);

    for (i = 0, r5 = 9; i < 4; i++, r5 += 2)
        MenuPrint(sKeyboardCharacters[page][i], 3, r5);

 SetCustomFont(0);
}

static void sub_80B78A8(void)
{
    BasicInitMenuWindow(&gWindowConfig_81E6F4C);
    gUnknown_083CE358[(*(struct NamingScreenData *)(gSharedMem + 0x0)).templateNum]();
    gUnknown_083CE368[(*(struct NamingScreenData *)(gSharedMem + 0x0)).template->unk3]();
    MenuPrint((*(struct NamingScreenData *)(gSharedMem + 0x0)).template->title, 9, 2);
}

static void nullsub_61(void)
{
}

static void sub_80B78F8(void)
{
    StringCopy(gStringVar1, gSpeciesNames[(s16)(*(struct NamingScreenData *)(gSharedMem + 0x0)).unk3E]);
}

static void nullsub_62(void)
{
}

static void sub_80B7924(void)
{
    u8 genderSymbol[2] = _("♂");

    if ((s16)(*(struct NamingScreenData *)(gSharedMem + 0x0)).unk40 != 0xFF)
    {
        if ((s16)(*(struct NamingScreenData *)(gSharedMem + 0x0)).unk40 == 0xFE)
            genderSymbol[0] = 0xB6;
        MenuPrint(genderSymbol, 0x14, 4);
    }
}

static void sub_80B7960(void)
{
    u8 *string = gStringVar1;
 u8 i, j, buffer[20];


    for (j = 0; j < 2; j++)
 {
  for (i = 0; i < 26; i++)
   *(u16 *)(0x0600F10A + i + j * 0x40) = 2;
 }

 memset(buffer, 0xFF, 20);

    string[0] = 0xFC;
    string[1] = 0x14;
    string[2] = 8;
    string[3] = 0xFC;
    string[4] = 0x11;
    string[5] = 1;
    string += 6;

 for (i = 0, j = 0; i < sizeof((*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer); i += 2)
 {
  if ((*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i] == 0)
  {
   buffer[j] = (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i + 1];
   j++;
  } else
  {
   buffer[j++] = (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i];
   buffer[j++] = (*(struct NamingScreenData *)(gSharedMem + 0x0)).textBuffer[i + 1];
  }
 }

    StringCopy(string, buffer);
    BasicInitMenuWindow(&gWindowConfig_81E6F4C);
 SetCustomFont(1);
    MenuPrint(gStringVar1, (*(struct NamingScreenData *)(gSharedMem + 0x0)).unk2, 4);
 SetCustomFont(0);
}





static const struct NamingScreenTemplate playerNamingScreenTemplate =
{
    .unk0 = 0,
    .maxChars = 3,
    .unk2 = 1,
    .unk3 = 0,
    .unk4 = 0,
    .unk5 = 0,
    .unk6 = 0,
    .unk7 = 0,
    .title = OtherText_YourName,
};

static const struct NamingScreenTemplate pcBoxNamingTemplate =
{
    .unk0 = 0,
    .maxChars = 8,
    .unk2 = 2,
    .unk3 = 0,
    .unk4 = 0,
    .unk5 = 0,
    .unk6 = 0,
    .unk7 = 0,
    .title = OtherText_BoxName,
};

static const struct NamingScreenTemplate monNamingScreenTemplate =
{
    .unk0 = 0,
    .maxChars = 5,
    .unk2 = 3,
    .unk3 = 1,
    .unk4 = 0,
    .unk5 = 0,
    .unk6 = 0,
    .unk7 = 0,
    .title = OtherText_PokeName,
};

static const struct NamingScreenTemplate *const sNamingScreenTemplates[] =
{
    &playerNamingScreenTemplate,
    &pcBoxNamingTemplate,
    &monNamingScreenTemplate,
    &monNamingScreenTemplate,
};

static const u8 sKoreanCharacters[][20] =
{
 {0x09, 0x00, 0x0E, 0x00, 0x05, 0x00, 0x02, 0x00, 0x0B, 0x00, 0xAB, 0x00, 0xAC, 0x00, 0xAE, 0x00, 0x17, 0x00, 0x1B },
 {0x08, 0x00, 0x0D, 0x00, 0x04, 0x00, 0x01, 0x00, 0x0A, 0x00, 0x20, 0x00, 0x1A, 0x00, 0x16, 0x00, 0x15, 0x00, 0x19 },
 {0x07, 0x00, 0x03, 0x00, 0x0C, 0x00, 0x06, 0x00, 0x13, 0x00, 0x1C, 0x00, 0x18, 0x00, 0x14, 0x00, 0x28, 0x00, 0xBA },
 {0x10, 0x00, 0x11, 0x00, 0x0F, 0x00, 0x12, 0x00, 0x00, 0x00, 0x25, 0x00, 0x21, 0x00, 0x26, 0x00, 0xB8, 0x00, 0xAD },
};

static const u8 sKeyboardCharacters[][4][40] =
{
    {
        _("ㅃ ㅉ ㄸ ㄲ ㅆ ! ? - ㅒ ㅖ"),
        _("ㅂ ㅈ ㄷ ㄱ ㅅ ㅛ ㅕ ㅑ ㅐ ㅔ"),
        _("ㅁ ㄴ ㅇ ㄹ ㅎ ㅗ ㅓ ㅏ ㅣ /"),
        _("ㅋ ㅌ ㅊ ㅍ   ㅠ ㅜ ㅡ , ."),
    },
    {
        _("1 2 3 4 5 6 7 8 9 0"),
        _("A B C D E F G H I J"),
        _("K L M N O P Q R S T"),
        _("U V W X Y Z ‘ ’ “ ”"),
    },
    {
        _("1 2 3 4 5 6 7 8 9 0"),
        _("a b c d e f g h i j"),
        _("k l m n o p q r s t"),
        _("u v w x y z ♂ ♀ - ·"),
 },
};

const struct OamData gOamData_83CE498 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const struct OamData gOamData_83CE4A0 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const struct OamData gOamData_83CE4A8 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};
