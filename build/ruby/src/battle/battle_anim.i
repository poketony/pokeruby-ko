# 1 "src/battle/battle_anim.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/battle/battle_anim.c"
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
# 2 "src/battle/battle_anim.c" 2
# 1 "include/battle_anim.h" 1
# 10 "include/battle_anim.h"
struct BGCntrlBitfield
{
    volatile u16 priority:2;
    volatile u16 charBaseBlock:2;
    volatile u16 field_0_2:4;
    volatile u16 field_1_0:5;
    volatile u16 areaOverflowMode:1;
    volatile u16 screenSize:2;
};

struct BattleAnimBackground
{
    void *image;
    void *palette;
    void *tilemap;
};

struct UnknownStruct1
{
    u8 unk0;
};

struct UnknownStruct2
{
    void *unk0;
    u16 *unk4;
    u8 unk8;
};

struct UnknownStruct3
{
    u8 unk0;
    u8 filler1[0xB];
};

void DoMoveAnim(const u8 *const moveAnims[], u16 b, u8 c);
bool8 IsAnimBankSpriteVisible(u8 a);
void sub_8076034(u8, u8);
bool8 NotInBattle(void);
void battle_anim_clear_some_data(void);
void move_anim_8072740(struct Sprite *sprite);
void DestroyAnimVisualTask(u8 task);
void DestroyAnimVisualTask(u8 task);
bool8 IsAnimBankSpriteVisible(u8);
s8 sub_8076F98(s8 a);
void sub_80763FC(u16 a, u16 *b, u32 c, u8 d);
# 3 "src/battle/battle_anim.c" 2
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
# 4 "src/battle/battle_anim.c" 2
# 1 "include/battle_anim_80CA710.h" 1



void sub_80E4EF8(int, int, int, int, u16, u8, int);
s16 sub_81174E0(s16 a);
s16 sub_81174C4(s16 a, s16 b);
# 5 "src/battle/battle_anim.c" 2
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
# 6 "src/battle/battle_anim.c" 2
# 1 "include/contest.h" 1



struct ContestPokemon
{
            u16 species;
            u8 nickname[10];
            u8 trainerName[8];
            u8 unk15;
            u8 unk16;
            u8 filler17[7];
            u16 moves[4];
            u8 cool;
            u8 beauty;
            u8 cute;
            u8 smart;
            u8 tough;
            u8 sheen;
            u8 filler2C[12];
            u32 unk38;
            u32 unk3C;
};

extern struct ContestPokemon gContestMons[];
void ResetLinkContestBoolean(void);
void sub_80AB2AC(void);
void sub_80AB47C(void);
void sub_80AE098(u8);
void sub_80AE398(u8, u8);
u8 sub_80AE47C(struct Pokemon *party);
u32 sub_80AE770(u8, u8);
void sub_80AE82C(u8);
u8 sub_80AEB1C();
void sub_80AF668(void);
void sub_80B0F28(u8);
int sub_80B2A7C(u8);
u8 sub_80B2C4C(u8, u8);
void sub_80B2D1C(void);
# 7 "src/battle/battle_anim.c" 2
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
# 8 "src/battle/battle_anim.c" 2
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
# 9 "src/battle/battle_anim.c" 2
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
# 10 "src/battle/battle_anim.c" 2
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
# 11 "src/battle/battle_anim.c" 2
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
# 12 "src/battle/battle_anim.c" 2
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
# 13 "src/battle/battle_anim.c" 2
# 1 "include/sprite.h" 1
# 14 "src/battle/battle_anim.c" 2
# 1 "include/task.h" 1
# 15 "src/battle/battle_anim.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 16 "src/battle/battle_anim.c" 2




extern u16 gBattlePartyID[4];
extern u8 gObjectBankIDs[];
extern u8 gBankAttacker;
extern u8 gBankTarget;
__attribute__((section("ewram_data"))) const u8 *gBattleAnimScriptPtr = ((void *)0);
__attribute__((section("ewram_data"))) const u8 *gBattleAnimScriptRetAddr = ((void *)0);
__attribute__((section("ewram_data"))) void (*gAnimScriptCallback)(void) = ((void *)0);
__attribute__((section("ewram_data"))) s8 gAnimFramesToWait = 0;
__attribute__((section("ewram_data"))) u8 gAnimScriptActive = 0;
__attribute__((section("ewram_data"))) u8 gAnimVisualTaskCount = 0;
__attribute__((section("ewram_data"))) u8 gAnimSoundTaskCount = 0;
__attribute__((section("ewram_data"))) u32 gDisableStructMoveAnim = 0;
__attribute__((section("ewram_data"))) u32 gMoveDmgMoveAnim = 0;
__attribute__((section("ewram_data"))) u16 gMovePowerMoveAnim = 0;
__attribute__((section("ewram_data"))) u8 gHappinessMoveAnim = 0;
__attribute__((section("ewram_data"))) u16 gWeatherMoveAnim = 0;
__attribute__((section("ewram_data"))) u8 gMonAnimTaskIdArray[2] = {0};
__attribute__((section("ewram_data"))) u8 gUnknown_0202F7C4 = 0;
__attribute__((section("ewram_data"))) u8 gUnknown_0202F7C5 = 0;
__attribute__((section("ewram_data"))) u16 gAnimMoveIndex = 0;
__attribute__((section("ewram_data"))) u8 gBattleAnimBankAttacker = 0;
__attribute__((section("ewram_data"))) u8 gBattleAnimBankTarget = 0;
__attribute__((section("ewram_data"))) u16 gUnknown_0202F7CA[4] = {0};
__attribute__((section("ewram_data"))) u8 gUnknown_0202F7D2 = 0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_03004200;
extern u16 gUnknown_03004240;
extern u16 gUnknown_03004244;
extern u16 gUnknown_03004280;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030042C4;

u16 gSoundAnimFramesToWait;
s16 gBattleAnimArgs[8];
u16 gAnimSpriteIndexArray[8];

extern struct MusicPlayerInfo gMPlay_BGM;
extern struct MusicPlayerInfo gMPlay_SE1;
extern struct MusicPlayerInfo gMPlay_SE2;

extern const u16 gUnknown_081C7160[];
extern const u8 *const gBattleAnims_Moves[];
extern const struct CompressedSpriteSheet gBattleAnimPicTable[];
extern const struct CompressedSpritePalette gBattleAnimPaletteTable[];
extern const struct BattleAnimBackground gBattleAnimBackgroundTable[];

static void RunAnimScriptCommand(void);
static void ScriptCmd_loadsprite(void);
static void ScriptCmd_unloadsprite(void);
static void ScriptCmd_sprite(void);
static void ScriptCmd_createtask(void);
static void ScriptCmd_delay(void);
static void ScriptCmd_waitforvisualfinish(void);
static void ScriptCmd_hang1(void);
static void ScriptCmd_hang2(void);
static void ScriptCmd_end(void);
static void ScriptCmd_playse(void);
static void ScriptCmd_monbg(void);
static void sub_8076380(void);
static void task_pA_ma0A_obj_to_bg_pal(u8);
static void ScriptCmd_clearmonbg(void);
static void sub_807672C(u8);
static void ScriptCmd_monbg_22(void);
static void ScriptCmd_clearmonbg_23(void);
static void sub_80769A4(u8);
static void ScriptCmd_setalpha(void);
static void ScriptCmd_setbldcnt(void);
static void ScriptCmd_blendoff(void);
static void ScriptCmd_call(void);
static void ScriptCmd_return(void);
static void ScriptCmd_setvar(void);
static void ScriptCmd_ifelse(void);
static void ScriptCmd_jumpif(void);
static void ScriptCmd_jump(void);
static void ScriptCmd_fadetobg(void);
static void ScriptCmd_fadetobg_25(void);
static void task_p5_load_battle_screen_elements(u8);
static void sub_8076DB8(u16);
static void dp01t_11_3_message_for_player_only(void);
static void ScriptCmd_restorebg(void);
static void ScriptCmd_waitbgfadeout(void);
static void ScriptCmd_waitbgfadein(void);
static void ScriptCmd_changebg(void);
static void ScriptCmd_panse_19(void);
static void ScriptCmd_setpan(void);
static void ScriptCmd_panse_1B(void);
static void c3_08073CEC(u8);
static void ScriptCmd_panse_26(void);
static void ScriptCmd_panse_27(void);
static void ScriptCmd_panse_1C(void);
static void sub_80774FC(u8);
static void ScriptCmd_panse_1D(void);
static void sub_80775CC(u8);
static void ScriptCmd_createtask_1F(void);
static void ScriptCmd_waitsound(void);
static void ScriptCmd_jumpvareq(void);
static void ScriptCmd_jumpunkcond(void);
static void ScriptCmd_monbgprio_28(void);
static void ScriptCmd_monbgprio_29(void);
static void ScriptCmd_monbgprio_2A(void);
static void ScriptCmd_invisible(void);
static void ScriptCmd_visible(void);
static void ScriptCmd_doublebattle_2D(void);
static void ScriptCmd_doublebattle_2E(void);
static void ScriptCmd_stopsound(void);

static void (*const sScriptCmdTable[])(void) = {
    ScriptCmd_loadsprite,
    ScriptCmd_unloadsprite,
    ScriptCmd_sprite,
    ScriptCmd_createtask,
    ScriptCmd_delay,
    ScriptCmd_waitforvisualfinish,
    ScriptCmd_hang1,
    ScriptCmd_hang2,
    ScriptCmd_end,
    ScriptCmd_playse,
    ScriptCmd_monbg,
    ScriptCmd_clearmonbg,
    ScriptCmd_setalpha,
    ScriptCmd_blendoff,
    ScriptCmd_call,
    ScriptCmd_return,
    ScriptCmd_setvar,
    ScriptCmd_ifelse,
    ScriptCmd_jumpif,
    ScriptCmd_jump,
    ScriptCmd_fadetobg,
    ScriptCmd_restorebg,
    ScriptCmd_waitbgfadeout,
    ScriptCmd_waitbgfadein,
    ScriptCmd_changebg,
    ScriptCmd_panse_19,
    ScriptCmd_setpan,
    ScriptCmd_panse_1B,
    ScriptCmd_panse_1C,
    ScriptCmd_panse_1D,
    ScriptCmd_setbldcnt,
    ScriptCmd_createtask_1F,
    ScriptCmd_waitsound,
    ScriptCmd_jumpvareq,
    ScriptCmd_monbg_22,
    ScriptCmd_clearmonbg_23,
    ScriptCmd_jumpunkcond,
    ScriptCmd_fadetobg_25,
    ScriptCmd_panse_26,
    ScriptCmd_panse_27,
    ScriptCmd_monbgprio_28,
    ScriptCmd_monbgprio_29,
    ScriptCmd_monbgprio_2A,
    ScriptCmd_invisible,
    ScriptCmd_visible,
    ScriptCmd_doublebattle_2D,
    ScriptCmd_doublebattle_2E,
    ScriptCmd_stopsound,
};

void battle_anim_clear_some_data(void)
{
    s32 i;

    gAnimFramesToWait = 0;
    gAnimScriptActive = 0;
    gAnimVisualTaskCount = 0;
    gAnimSoundTaskCount = 0;
    gDisableStructMoveAnim = 0;
    gMoveDmgMoveAnim = 0;
    gMovePowerMoveAnim = 0;
    gHappinessMoveAnim = 0;


    for (i = 0; i < 8; i++)
        gAnimSpriteIndexArray[i] |= 0xFFFF;


    for (i = 0; i < 8; i++)
        gBattleAnimArgs[i] = 0;

    gMonAnimTaskIdArray[0] = 0xFF;
    gMonAnimTaskIdArray[1] = 0xFF;
    gUnknown_0202F7C4 = 0;
    gUnknown_0202F7C5 = 0;
    gAnimMoveIndex = 0;
    gBattleAnimBankAttacker = 0;
    gBattleAnimBankTarget = 0;
    gUnknown_0202F7D2 = 0;
}

void ExecuteMoveAnim(u16 move)
{
    gBattleAnimBankAttacker = gBankAttacker;
    gBattleAnimBankTarget = gBankTarget;
    DoMoveAnim(gBattleAnims_Moves, move, 1);
}

void DoMoveAnim(const u8 *const moveAnims[], u16 move, u8 c)
{
    s32 i;

    if (NotInBattle() == 0)
    {
        sub_8079E24();
        sub_8043EB4(0);
        for (i = 0; i < 4; i++)
        {
            if (GetBankSide(i) != 0)
                gUnknown_0202F7CA[i] = GetMonData(&gEnemyParty[gBattlePartyID[i]], 11);
            else
                gUnknown_0202F7CA[i] = GetMonData(&gPlayerParty[gBattlePartyID[i]], 11);
        }
    }
    else
    {
        for (i = 0; i < 4; i++)
            gUnknown_0202F7CA[i] = (*(u16 *)(gSharedMem + 0x19348));
    }

    if (c == 0)
        gAnimMoveIndex = 0;
    else
        gAnimMoveIndex = move;

    for (i = 0; i < 8; i++)
        gBattleAnimArgs[i] = 0;

    gMonAnimTaskIdArray[0] = 0xFF;
    gMonAnimTaskIdArray[1] = 0xFF;
    gBattleAnimScriptPtr = moveAnims[move];
    gAnimScriptActive = 1;
    gAnimFramesToWait = 0;
    gAnimScriptCallback = RunAnimScriptCommand;

    for (i = 0; i < 8; i++)
        gAnimSpriteIndexArray[i] |= 0xFFFF;

    if (c != 0)
    {
        for (i = 0; gUnknown_081C7160[i] != 0xFFFF; i++)
        {
            if (move == gUnknown_081C7160[i])
            {
                m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 128);
                break;
            }
        }
    }

    gUnknown_030042C4 = 0;
    gUnknown_03004240 = 0;
    gUnknown_03004200 = 0;
    gUnknown_03004244 = 0;
}

void move_anim_8072740(struct Sprite *sprite)
{
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
    gAnimVisualTaskCount--;
}

void DestroyAnimVisualTask(u8 taskId)
{
    DestroyTask(taskId);
    gAnimVisualTaskCount--;
}

void DestroyAnimSoundTask(u8 taskId)
{
    DestroyTask(taskId);
    gAnimSoundTaskCount--;
}

static void AddSpriteIndex(u16 index)
{
    s32 i;

    for (i = 0; i < 8; i++)
    {
        if (gAnimSpriteIndexArray[i] == 0xFFFF)
        {
            gAnimSpriteIndexArray[i] = index;
            return;
        }
    }
}

static void ClearSpriteIndex(u16 index)
{
    s32 i;

    for (i = 0; i < 8; i++)
    {
        if (gAnimSpriteIndexArray[i] == index)
        {
            gAnimSpriteIndexArray[i] |= 0xFFFF;
            return;
        }
    }
}

static void WaitAnimFrameCount(void)
{
    if (gAnimFramesToWait <= 0)
    {
        gAnimScriptCallback = RunAnimScriptCommand;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait--;
    }
}

static void RunAnimScriptCommand(void)
{
    do
    {
        sScriptCmdTable[((gBattleAnimScriptPtr)[0])]();
    } while (gAnimFramesToWait == 0 && gAnimScriptActive != 0);
}

static void ScriptCmd_loadsprite(void)
{
    u16 index;

    gBattleAnimScriptPtr++;
    index = ((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8));
    LoadCompressedObjectPic(&gBattleAnimPicTable[(index - 10000)]);
    LoadCompressedObjectPalette(&gBattleAnimPaletteTable[(index - 10000)]);
    gBattleAnimScriptPtr += 2;
    AddSpriteIndex((index - 10000));
    gAnimFramesToWait = 1;
    gAnimScriptCallback = WaitAnimFrameCount;
}

static void ScriptCmd_unloadsprite(void)
{
    u16 index;

    gBattleAnimScriptPtr++;
    index = ((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8));
    FreeSpriteTilesByTag(gBattleAnimPicTable[(index - 10000)].tag);
    FreeSpritePaletteByTag(gBattleAnimPicTable[(index - 10000)].tag);
    gBattleAnimScriptPtr += 2;
    ClearSpriteIndex((index - 10000));
}
# 423 "src/battle/battle_anim.c"
__attribute__((naked))
static void ScriptCmd_sprite(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    ldr r5, _08075B2C @ =gBattleAnimScriptPtr\n    ldr r1, [r5]\n    adds r3, r1, 0x1\n    str r3, [r5]\n    ldrb r2, [r1, 0x1]\n    ldrb r0, [r3, 0x1]\n    lsls r0, 8\n    adds r2, r0\n    ldrb r0, [r3, 0x2]\n    lsls r0, 16\n    adds r2, r0\n    ldrb r0, [r3, 0x3]\n    lsls r0, 24\n    adds r7, r2, r0\n    adds r0, r1, 0x5\n    str r0, [r5]\n    ldrb r4, [r1, 0x5]\n    adds r0, r1, 0x6\n    str r0, [r5]\n    ldrb r0, [r1, 0x6]\n    adds r1, 0x7\n    str r1, [r5]\n    cmp r0, 0\n    beq _08075B14\n    adds r6, r5, 0\n    ldr r5, _08075B30 @ =gBattleAnimArgs\n    adds r3, r0, 0\n_08075AFC:\n    ldr r2, [r6]\n    ldrb r1, [r2]\n    ldrb r0, [r2, 0x1]\n    lsls r0, 8\n    orrs r1, r0\n    strh r1, [r5]\n    adds r2, 0x2\n    str r2, [r6]\n    adds r5, 0x2\n    subs r3, 0x1\n    cmp r3, 0\n    bne _08075AFC\n_08075B14:\n    movs r0, 0x80\n    ands r0, r4\n    cmp r0, 0\n    beq _08075B44\n    movs r0, 0x80\n    eors r4, r0\n    cmp r4, 0x3F\n    bls _08075B34\n    adds r0, r4, 0\n    subs r0, 0x40\n    b _08075B36\n    .align 2, 0\n_08075B2C: .4byte gBattleAnimScriptPtr\n_08075B30: .4byte gBattleAnimArgs\n_08075B34:\n    negs r0, r4\n_08075B36:\n    lsls r0, 24\n    lsrs r4, r0, 24\n    ldr r0, _08075B40 @ =gBattleAnimBankTarget\n    b _08075B56\n    .align 2, 0\n_08075B40: .4byte gBattleAnimBankTarget\n_08075B44:\n    cmp r4, 0x3F\n    bls _08075B4E\n    adds r0, r4, 0\n    subs r0, 0x40\n    b _08075B50\n_08075B4E:\n    negs r0, r4\n_08075B50:\n    lsls r0, 24\n    lsrs r4, r0, 24\n    ldr r0, _08075BAC @ =gBattleAnimBankAttacker\n_08075B56:\n    ldrb r0, [r0]\n    bl sub_8079E90\n    lsls r0, 24\n    lsrs r0, 24\n    lsls r1, r4, 24\n    asrs r1, 24\n    adds r0, r1\n    lsls r0, 16\n    lsrs r6, r0, 16\n    lsls r0, r6, 16\n    asrs r0, 16\n    cmp r0, 0x2\n    bgt _08075B74\n    movs r6, 0x3\n_08075B74:\n    ldr r5, _08075BB0 @ =gBattleAnimBankTarget\n    ldrb r0, [r5]\n    movs r1, 0x2\n    bl sub_8077ABC\n    adds r4, r0, 0\n    lsls r4, 24\n    lsrs r4, 24\n    ldrb r0, [r5]\n    movs r1, 0x3\n    bl sub_8077ABC\n    adds r2, r0, 0\n    lsls r2, 24\n    lsrs r2, 24\n    lsls r3, r6, 24\n    lsrs r3, 24\n    adds r0, r7, 0\n    adds r1, r4, 0\n    bl CreateSpriteAndAnimate\n    ldr r1, _08075BB4 @ =gAnimVisualTaskCount\n    ldrb r0, [r1]\n    adds r0, 0x1\n    strb r0, [r1]\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_08075BAC: .4byte gBattleAnimBankAttacker\n_08075BB0: .4byte gBattleAnimBankTarget\n_08075BB4: .4byte gAnimVisualTaskCount\n    .syntax divided\n");
# 550 "src/battle/battle_anim.c"
}


static void ScriptCmd_createtask(void)
{
    TaskFunc taskFunc;
    u8 taskPriority;
    u8 taskId;
    u8 numArgs;
    s32 i;

    gBattleAnimScriptPtr++;
    taskFunc = (TaskFunc)((gBattleAnimScriptPtr)[0] + ((gBattleAnimScriptPtr)[1] << 8) + ((gBattleAnimScriptPtr)[2] << 16) + ((gBattleAnimScriptPtr)[3] << 24));
    gBattleAnimScriptPtr += 4;
    taskPriority = ((gBattleAnimScriptPtr)[0]);
    gBattleAnimScriptPtr++;
    numArgs = ((gBattleAnimScriptPtr)[0]);
    gBattleAnimScriptPtr++;

    for (i = 0; i < numArgs; i++)
    {
        gBattleAnimArgs[i] = ((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8));
        gBattleAnimScriptPtr += 2;
    }

    taskId = CreateTask(taskFunc, taskPriority);
    taskFunc(taskId);
    gAnimVisualTaskCount++;
}

static void ScriptCmd_delay(void)
{
    gBattleAnimScriptPtr++;
    gAnimFramesToWait = ((gBattleAnimScriptPtr)[0]);
    if (gAnimFramesToWait == 0)
        gAnimFramesToWait = -1;
    gBattleAnimScriptPtr++;
    gAnimScriptCallback = WaitAnimFrameCount;
}


static void ScriptCmd_waitforvisualfinish(void)
{
    if (gAnimVisualTaskCount == 0)
    {
        gBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_hang1(void)
{
}

static void ScriptCmd_hang2(void)
{
}

static void ScriptCmd_end(void)
{
    s32 i;
    bool32 continuousAnim = 0;


    if (gAnimVisualTaskCount != 0 || gAnimSoundTaskCount != 0
     || gMonAnimTaskIdArray[0] != 0xFF || gMonAnimTaskIdArray[1] != 0xFF)
    {
        gSoundAnimFramesToWait = 0;
        gAnimFramesToWait = 1;
        return;
    }


    if (IsSEPlaying())
    {
        if (++gSoundAnimFramesToWait <= 90)
        {
            gAnimFramesToWait = 1;
            return;
        }
        else
        {
            m4aMPlayStop(&gMPlay_SE1);
            m4aMPlayStop(&gMPlay_SE2);
        }
    }


    gSoundAnimFramesToWait = 0;

    for (i = 0; i < 8; i++)
    {
        if (gAnimSpriteIndexArray[i] != 0xFFFF)
        {
            FreeSpriteTilesByTag(gBattleAnimPicTable[gAnimSpriteIndexArray[i]].tag);
            FreeSpritePaletteByTag(gBattleAnimPicTable[gAnimSpriteIndexArray[i]].tag);
            gAnimSpriteIndexArray[i] |= 0xFFFF;
        }
    }

    if (continuousAnim == 0)
    {
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 256);
        if (NotInBattle() == 0)
        {
            sub_8079E24();
            sub_8043EB4(1);
        }
        gAnimScriptActive = 0;
    }
}

static void ScriptCmd_playse(void)
{
    gBattleAnimScriptPtr++;
    PlaySE(((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8)));
    gBattleAnimScriptPtr += 2;
}

static void ScriptCmd_monbg(void)
{
    u8 r6;
    u8 r5;
    u8 r0;
    u8 r7;
    u16 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r6 = ((gBattleAnimScriptPtr)[0]);
    if (r6 == 0)
        r6 = 2;
    else if (r6 == 1)
        r6 = 3;
    if (r6 == 0 || r6 == 2)
        r5 = gBattleAnimBankAttacker;
    else
        r5 = gBattleAnimBankTarget;
    if (IsAnimBankSpriteVisible(r5))
    {
        r0 = GetBankIdentity(r5);
        r0 += 0xFF;
        if (r0 <= 1 || NotInBattle() != 0)
            r7 = 0;
        else
            r7 = 1;
        sub_8076034(r5, r7);
        r4 = gObjectBankIDs[r5];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = r4;
        gTasks[taskId].data[1] = gSprites[r4].pos1.x + gSprites[r4].pos2.x;
        gTasks[taskId].data[2] = gSprites[r4].pos1.y + gSprites[r4].pos2.y;
        if (r7 == 0)
        {
            gTasks[taskId].data[3] = gUnknown_030042C0;
            gTasks[taskId].data[4] = gUnknown_030041B4;
        }
        else
        {
            gTasks[taskId].data[3] = gUnknown_03004288;
            gTasks[taskId].data[4] = gUnknown_03004280;
        }
        gTasks[taskId].data[5] = r7;
        gTasks[taskId].data[6] = r5;
        gMonAnimTaskIdArray[0] = taskId;

    }
    r5 ^= 2;
    if (r6 > 1 && IsAnimBankSpriteVisible(r5))
    {
        r0 = GetBankIdentity(r5);
        r0 += 0xFF;
        if (r0 <= 1 || NotInBattle() != 0)
            r7 = 0;
        else
            r7 = 1;
        sub_8076034(r5, r7);
        r4 = gObjectBankIDs[r5];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = r4;
        gTasks[taskId].data[1] = gSprites[r4].pos1.x + gSprites[r4].pos2.x;
        gTasks[taskId].data[2] = gSprites[r4].pos1.y + gSprites[r4].pos2.y;
        if (r7 == 0)
        {
            gTasks[taskId].data[3] = gUnknown_030042C0;
            gTasks[taskId].data[4] = gUnknown_030041B4;
        }
        else
        {
            gTasks[taskId].data[3] = gUnknown_03004288;
            gTasks[taskId].data[4] = gUnknown_03004280;
        }
        gTasks[taskId].data[5] = r7;
        gTasks[taskId].data[6] = r5;
        gMonAnimTaskIdArray[1] = taskId;
    }
    gBattleAnimScriptPtr++;
}
# 774 "src/battle/battle_anim.c"
__attribute__((naked))
bool8 IsAnimBankSpriteVisible(u8 a)
{
    asm(".syntax unified\n    push {r4,r5,lr}\n    lsls r0, 24\n    lsrs r4, r0, 24\n    adds r5, r4, 0\n    bl NotInBattle\n    lsls r0, 24\n    cmp r0, 0\n    beq _08075FDC\n    ldr r0, _08075FD8 @ =gBattleAnimBankAttacker\n    ldrb r0, [r0]\n    cmp r4, r0\n    beq _0807601C\n    b _0807602C\n    .align 2, 0\n_08075FD8: .4byte gBattleAnimBankAttacker\n_08075FDC:\n    adds r0, r4, 0\n    bl AnimBankSpriteExists\n    lsls r0, 24\n    cmp r0, 0\n    beq _0807602C\n    bl NotInBattle\n    lsls r0, 24\n    cmp r0, 0\n    bne _0807601C\n    lsls r0, r5, 2\n    ldr r1, _08076020 @ =gSharedMem + 0x17800\n    adds r0, r1\n    ldrb r1, [r0]\n    movs r0, 0x1\n    ands r0, r1\n    cmp r0, 0\n    beq _0807601C\n    ldr r2, _08076024 @ =gSprites\n    ldr r0, _08076028 @ =gObjectBankIDs\n    adds r0, r5, r0\n    ldrb r1, [r0]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r2\n    adds r0, 0x3E\n    ldrb r0, [r0]\n    lsls r0, 29\n    cmp r0, 0\n    blt _0807602C\n_0807601C:\n    movs r0, 0x1\n    b _0807602E\n    .align 2, 0\n_08076020: .4byte gSharedMem + 0x17800\n_08076024: .4byte gSprites\n_08076028: .4byte gObjectBankIDs\n_0807602C:\n    movs r0, 0\n_0807602E:\n    pop {r4,r5}\n    pop {r1}\n    bx r1\n    .syntax divided\n");
# 838 "src/battle/battle_anim.c"
}


void sub_8076034(u8 a, u8 b)
{
    volatile u8 pointlessZero;
    u16 *addr2;
    u8 spriteId;

    if (b == 0)
    {
        struct UnknownStruct2 s;
        u8 *addr;
        u32 size;
        u8 r2;
        u16 *addr3;

        sub_8078914(&s);
        addr = s.unk0;
        size = 0x2000;
        while (1)
        {
            { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x1000)/(32/8))); dmaRegs[2]; }; };
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((size)/(32/8))); dmaRegs[2]; }; };
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = (void *)s.unk4;
        { vu16 tmp = (vu16)(0xFF); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr2); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((0x1000)/(16/8))); dmaRegs[2]; }; };

        (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).priority = 2;
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).screenSize = 1;
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).areaOverflowMode = 0;

        spriteId = gObjectBankIDs[a];
        gUnknown_030042C0 = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        if (NotInBattle() != 0 && sub_80AEB1C((*(u16 *)(gSharedMem + 0x19348))) != 0)
            gUnknown_030042C0--;
        gUnknown_030041B4 = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gObjectBankIDs[a]].invisible = 1;

        (*(vu16 *)(0x4000000 + 0x14)) = gUnknown_030042C0;
        (*(vu16 *)(0x4000000 + 0x16)) = gUnknown_030041B4;

        LoadPalette(gPlttBufferUnfaded + 0x100 + a * 16, s.unk8 * 16, 32);
        addr3 = (u16 *)0x5000000 + s.unk8 * 16;
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gPlttBufferUnfaded + 0x100 + a * 16); dmaRegs[1] = (vu32)(addr3); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0000 | 0x0000) << 16 | ((32)/(32/8))); dmaRegs[2]; };

        if (NotInBattle() != 0)
            r2 = 0;
        else
            r2 = GetBankIdentity(a);
        sub_80E4EF8(0, 0, r2, s.unk8, (u32)s.unk0, (((s32)s.unk4 - 0x6000000) / 2048), (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).charBaseBlock);
        if (NotInBattle() != 0)
            sub_8076380();
    }
    else
    {
        u8 *addr;
        u32 size;
        u16 *addr3;

        addr = (void *)(0x6000000 + 0x6000);
        size = 0x2000;
        while (1)
        {
            { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x1000)/(32/8))); dmaRegs[2]; }; };
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((size)/(32/8))); dmaRegs[2]; }; };
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = (void *)(0x6000000 + 0xF000);
        { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr2); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x800)/(32/8))); dmaRegs[2]; }; };

        (*(struct BGCntrlBitfield *)(0x4000000 + 0xc)).priority = 2;
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xc)).screenSize = 1;
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xc)).areaOverflowMode = 0;

        spriteId = gObjectBankIDs[a];
        gUnknown_03004288 = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        gUnknown_03004280 = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gObjectBankIDs[a]].invisible = 1;

        (*(vu16 *)(0x4000000 + 0x18)) = gUnknown_03004288;
        (*(vu16 *)(0x4000000 + 0x1a)) = gUnknown_03004280;

        LoadPalette(gPlttBufferUnfaded + 0x100 + a * 16, 0x90, 32);
        addr3 = (void *)(0x5000000 + 0x120);
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(gPlttBufferUnfaded + 0x100 + a * 16); dmaRegs[1] = (vu32)(addr3); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0000 | 0x0000) << 16 | ((32)/(32/8))); dmaRegs[2]; };

        sub_80E4EF8(0, 0, GetBankIdentity(a), 9, 0x6000, 0x1E, (*(struct BGCntrlBitfield *)(0x4000000 + 0xc)).charBaseBlock);
    }
}

static void sub_8076380(void)
{
    int i;
    int j;
    struct UnknownStruct2 s;
    u16 *ptr;

    if (sub_80AEB1C((*(u16 *)(gSharedMem + 0x19348))) != 0)
    {
        sub_8078914(&s);
        ptr = s.unk4;
        for (i = 0; i < 8; i++)
        {
            for (j = 0; j < 4; j++)
            {
                u16 temp = ptr[j + i * 32];

                ptr[j + i * 32] = ptr[7 - j + i * 32];
                ptr[7 - j + i * 32] = temp;
            }
        }
        for (i = 0; i < 8; i++)
        {
            for (j = 0; j < 8; j++)
                ptr[j + i * 32] ^= 0x400;
        }
    }
}

void sub_80763FC(u16 a, u16 *b, u32 c, u8 d)
{
    u8 i;
    u8 j;
    u32 r9;

    if (d == 0)
        r9 = 32;
    else
        r9 = 64;
    a <<= 12;
    for (i = 0; i < r9; i++)
    {
        for (j = 0; j < 32; j++)
            b[j + i * 32] = ((b[j + i * 32] & 0xFFF) | a) + c;
    }
}

void sub_8076464(u8 a)
{
    u8 *addr;
    u32 size;
    volatile u8 pointlessZero;
    struct UnknownStruct2 s;

    sub_8078914(&s);
    if (a == 0 || NotInBattle() != 0)
    {
        u16 *addr2;

        addr = s.unk0;
        size = 0x2000;
        while (1)
        {
            { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x1000)/(32/8))); dmaRegs[2]; }; };
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((size)/(32/8))); dmaRegs[2]; }; };
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = s.unk4;
        { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr2); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x800)/(32/8))); dmaRegs[2]; }; };
        gUnknown_030042C0 = 0;
        gUnknown_030041B4 = 0;
    }
    else
    {
        u16 *addr2;

        addr = (void *)(0x6000000 + 0x6000);
        size = 0x2000;
        while (1)
        {
            { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x1000)/(32/8))); dmaRegs[2]; }; };
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((size)/(32/8))); dmaRegs[2]; }; };
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = (void *)(0x6000000 + 0xF000);
        { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(addr2); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x800)/(32/8))); dmaRegs[2]; }; };
        gUnknown_03004288 = 0;
        gUnknown_03004280 = 0;
    }
}

static void task_pA_ma0A_obj_to_bg_pal(u8 taskId)
{
    u8 r4;
    u8 r6;
    s16 r3;
    s16 r2;
    struct UnknownStruct2 s;

    r4 = gTasks[taskId].data[0];
    r6 = gTasks[taskId].data[6];
    sub_8078914(&s);
    r3 = gTasks[taskId].data[1] - (gSprites[r4].pos1.x + gSprites[r4].pos2.x);
    r2 = gTasks[taskId].data[2] - (gSprites[r4].pos1.y + gSprites[r4].pos2.y);
    if (gTasks[taskId].data[5] == 0)
    {
        u16 *src;
        u16 *dst;

        gUnknown_030042C0 = r3 + gTasks[taskId].data[3];
        gUnknown_030041B4 = r2 + gTasks[taskId].data[4];
        src = gPlttBufferFaded + 0x100 + r6 * 16;
        dst = gPlttBufferFaded + 0x100 + s.unk8 * 16 - 256;
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(src); dmaRegs[1] = (vu32)(dst); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0000 | 0x0000) << 16 | ((32)/(32/8))); dmaRegs[2]; };
    }
    else
    {
        u16 *src;
        u16 *dst;

        gUnknown_03004288 = r3 + gTasks[taskId].data[3];
        gUnknown_03004280 = r2 + gTasks[taskId].data[4];
        src = gPlttBufferFaded + 0x100 + r6 * 16;
        dst = gPlttBufferFaded + 0x100 - 112;
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(src); dmaRegs[1] = (vu32)(dst); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0000 | 0x0000) << 16 | ((32)/(32/8))); dmaRegs[2]; };
    }
}

static void ScriptCmd_clearmonbg(void)
{
    u8 r4;
    u8 r5;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r4 = ((gBattleAnimScriptPtr)[0]);
    if (r4 == 0)
        r4 = 2;
    else if (r4 == 1)
        r4 = 3;
    if (r4 == 0 || r4 == 2)
        r5 = gBattleAnimBankAttacker;
    else
        r5 = gBattleAnimBankTarget;
    if (gMonAnimTaskIdArray[0] != 0xFF)
        gSprites[gObjectBankIDs[r5]].invisible = 0;
    if (r4 > 1 && gMonAnimTaskIdArray[1] != 0xFF)
        gSprites[gObjectBankIDs[r5 ^ 2]].invisible = 0;
    else
        r4 = 0;
    taskId = CreateTask(sub_807672C, 5);
    gTasks[taskId].data[0] = r4;
    gTasks[taskId].data[2] = r5;
    gBattleAnimScriptPtr++;
}

static void sub_807672C(u8 taskId)
{
    u8 var;
    u8 r4;

    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] != 1)
    {
        var = GetBankIdentity(gTasks[taskId].data[2]);
        var += 0xFF;
        if (var <= 1 || NotInBattle() != 0)
            r4 = 0;
        else
            r4 = 1;
        if (gMonAnimTaskIdArray[0] != 0xFF)
        {
            sub_8076464(r4);
            DestroyTask(gMonAnimTaskIdArray[0]);
            gMonAnimTaskIdArray[0] = 0xFF;
        }
        if (gTasks[taskId].data[0] > 1)
        {
            sub_8076464(r4 ^ 1);
            DestroyTask(gMonAnimTaskIdArray[1]);
            gMonAnimTaskIdArray[1] = 0xFF;
        }
        DestroyTask(taskId);
    }
}

static void ScriptCmd_monbg_22(void)
{
    u8 r5;
    u8 r4;
    u8 r0;
    u8 r1;

    gBattleAnimScriptPtr++;
    r5 = ((gBattleAnimScriptPtr)[0]);
    if (r5 == 0)
        r5 = 2;
    else if (r5 == 1)
        r5 = 3;
    if (r5 == 0 || r5 == 2)
        r4 = gBattleAnimBankAttacker;
    else
        r4 = gBattleAnimBankTarget;
    if (IsAnimBankSpriteVisible(r4))
    {
        r0 = GetBankIdentity(r4);
        r0 += 0xFF;
        if (r0 <= 1 || NotInBattle() != 0)
            r1 = 0;
        else
            r1 = 1;
        sub_8076034(r4, r1);
        gSprites[gObjectBankIDs[r4]].invisible = 0;
    }
    r4 ^= 2;
    if (r5 > 1 && IsAnimBankSpriteVisible(r4))
    {
        r0 = GetBankIdentity(r4);
        r0 += 0xFF;
        if (r0 <= 1 || NotInBattle() != 0)
            r1 = 0;
        else
            r1 = 1;
        sub_8076034(r4, r1);
        gSprites[gObjectBankIDs[r4]].invisible = 0;
    }
    gBattleAnimScriptPtr++;
}

static void ScriptCmd_clearmonbg_23(void)
{
    u8 r5;
    u8 r6;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r5 = ((gBattleAnimScriptPtr)[0]);
    if (r5 == 0)
        r5 = 2;
    else if (r5 == 1)
        r5 = 3;
    if (r5 == 0 || r5 == 2)
        r6 = gBattleAnimBankAttacker;
    else
        r6 = gBattleAnimBankTarget;
    if (IsAnimBankSpriteVisible(r6))
        gSprites[gObjectBankIDs[r6]].invisible = 0;
    if (r5 > 1 && IsAnimBankSpriteVisible(r6 ^ 2))
        gSprites[gObjectBankIDs[r6 ^ 2]].invisible = 0;
    else
        r5 = 0;
    taskId = CreateTask(sub_80769A4, 5);
    gTasks[taskId].data[0] = r5;
    gTasks[taskId].data[2] = r6;
    gBattleAnimScriptPtr++;
}

static void sub_80769A4(u8 taskId)
{
    u8 r0;
    u8 r4;
    u8 r5;

    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] != 1)
    {
        r4 = gTasks[taskId].data[2];
        r0 = GetBankIdentity(r4);
        r0 += 0xFF;
        if (r0 <= 1 || NotInBattle() != 0)
            r5 = 0;
        else
            r5 = 1;
        if (IsAnimBankSpriteVisible(r4))
            sub_8076464(r5);
        if (gTasks[taskId].data[0] > 1 && IsAnimBankSpriteVisible(r4 ^ 2))
            sub_8076464(r5 ^ 1);
        DestroyTask(taskId);
    }
}

static void ScriptCmd_setalpha(void)
{
    u16 r3;
    u16 r1;

    gBattleAnimScriptPtr++;
    r3 = *(gBattleAnimScriptPtr++);
    r1 = *(gBattleAnimScriptPtr++) << 8;
    (*(vu16 *)(0x4000000 + 0x50)) = 0x3F40;
    (*(vu16 *)(0x4000000 + 0x52)) = r3 | r1;
}

static void ScriptCmd_setbldcnt(void)
{
    u16 r3;
    u16 r1;

    gBattleAnimScriptPtr++;
    r3 = *(gBattleAnimScriptPtr++);
    r1 = *(gBattleAnimScriptPtr++) << 8;
    (*(vu16 *)(0x4000000 + 0x50)) = r3 | r1;
}

static void ScriptCmd_blendoff(void)
{
    gBattleAnimScriptPtr++;
    (*(vu16 *)(0x4000000 + 0x50)) = 0;
    (*(vu16 *)(0x4000000 + 0x52)) = 0;
}

static void ScriptCmd_call(void)
{
    gBattleAnimScriptPtr++;
    gBattleAnimScriptRetAddr = gBattleAnimScriptPtr + 4;
    gBattleAnimScriptPtr = (void*) ((gBattleAnimScriptPtr)[0] + ((gBattleAnimScriptPtr)[1] << 8) + ((gBattleAnimScriptPtr)[2] << 16) + ((gBattleAnimScriptPtr)[3] << 24));
}

static void ScriptCmd_return(void)
{
    gBattleAnimScriptPtr = gBattleAnimScriptRetAddr;
}

static void ScriptCmd_setvar(void)
{
    const u8 *addr = gBattleAnimScriptPtr;
    u16 r4;
    u8 r2;

    gBattleAnimScriptPtr++;
    r2 = ((gBattleAnimScriptPtr)[0]);
    gBattleAnimScriptPtr++;
    r4 = ((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8));
    gBattleAnimScriptPtr = addr + 4;
    gBattleAnimArgs[r2] = r4;
}

static void ScriptCmd_ifelse(void)
{
    gBattleAnimScriptPtr++;
    if (gUnknown_0202F7C4 & 1)
        gBattleAnimScriptPtr += 4;
    gBattleAnimScriptPtr = (void*) ((gBattleAnimScriptPtr)[0] + ((gBattleAnimScriptPtr)[1] << 8) + ((gBattleAnimScriptPtr)[2] << 16) + ((gBattleAnimScriptPtr)[3] << 24));
}

static void ScriptCmd_jumpif(void)
{
    u8 r1;

    gBattleAnimScriptPtr++;
    r1 = ((gBattleAnimScriptPtr)[0]);
    gBattleAnimScriptPtr++;
    if (r1 == gUnknown_0202F7C4)
    {
        gBattleAnimScriptPtr = (void*) ((gBattleAnimScriptPtr)[0] + ((gBattleAnimScriptPtr)[1] << 8) + ((gBattleAnimScriptPtr)[2] << 16) + ((gBattleAnimScriptPtr)[3] << 24));
    }
    else
    {
        gBattleAnimScriptPtr += 4;
    }
}

static void ScriptCmd_jump(void)
{
    gBattleAnimScriptPtr++;
    gBattleAnimScriptPtr = (void*) ((gBattleAnimScriptPtr)[0] + ((gBattleAnimScriptPtr)[1] << 8) + ((gBattleAnimScriptPtr)[2] << 16) + ((gBattleAnimScriptPtr)[3] << 24));
}

bool8 NotInBattle(void)
{
    if (!gMain.inBattle)
        return 1;
    else
        return 0;
}

static void ScriptCmd_fadetobg(void)
{
    u8 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r4 = ((gBattleAnimScriptPtr)[0]);
    gBattleAnimScriptPtr++;
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    gTasks[taskId].data[0] = r4;
    gUnknown_0202F7C5 = 1;
}

static void ScriptCmd_fadetobg_25(void)
{
    u8 r8;
    u8 r7;
    u8 r6;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r8 = gBattleAnimScriptPtr[0];
    r7 = gBattleAnimScriptPtr[1];
    r6 = gBattleAnimScriptPtr[2];
    gBattleAnimScriptPtr += 3;
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    if (NotInBattle() != 0)
        gTasks[taskId].data[0] = r6;
    else if (GetBankSide(gBattleAnimBankTarget) == 0)
        gTasks[taskId].data[0] = r7;
    else
        gTasks[taskId].data[0] = r8;
    gUnknown_0202F7C5 = 1;
}

static void task_p5_load_battle_screen_elements(u8 taskId)
{
    if (gTasks[taskId].data[10] == 0)
    {
        BeginHardwarePaletteFade(0xE8, 0, 0, 16, 0);
        gTasks[taskId].data[10]++;
        return;
    }
    if (gPaletteFade.active)
        return;
    if (gTasks[taskId].data[10] == 1)
    {
        gTasks[taskId].data[10]++;
        gUnknown_0202F7C5 = 2;
    }
    else if (gTasks[taskId].data[10] == 2)
    {
        s16 data0 = (u16)gTasks[taskId].data[0];

        if (data0 == -1)
            dp01t_11_3_message_for_player_only();
        else
            sub_8076DB8(data0);
        BeginHardwarePaletteFade(0xE8, 0, 16, 0, 1);
        gTasks[taskId].data[10]++;
        return;
    }
    if (gPaletteFade.active)
        return;
    if (gTasks[taskId].data[10] == 3)
    {
        DestroyTask(taskId);
        gUnknown_0202F7C5 = 0;
    }
}

static void sub_8076DB8(u16 a)
{
    if (NotInBattle())
    {
        void *tilemap = gBattleAnimBackgroundTable[a].tilemap;
        void *dmaSrc;
        void *dmaDest;

        LZDecompressWram(tilemap, NotInBattle() ? ((u16 *)(gSharedMem + 0x14800)) : ((u16 *)(gSharedMem + 0x18000)));
        sub_80763FC(sub_80789BC(), NotInBattle() ? ((u16 *)(gSharedMem + 0x14800)) : ((u16 *)(gSharedMem + 0x18000)), 0x100, 0);
        dmaSrc = NotInBattle() ? ((u16 *)(gSharedMem + 0x14800)) : ((u16 *)(gSharedMem + 0x18000));
        dmaDest = (void *)(0x6000000 + 0xD000);
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(dmaSrc); dmaRegs[1] = (vu32)(dmaDest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0000 | 0x0000) << 16 | ((0x800)/(32/8))); dmaRegs[2]; };
        LZDecompressVram(gBattleAnimBackgroundTable[a].image, (void *)(0x6000000 + 0x2000));
        LoadCompressedPalette(gBattleAnimBackgroundTable[a].palette, sub_80789BC() * 16, 32);
    }
    else
    {
        LZDecompressVram(gBattleAnimBackgroundTable[a].tilemap, (void *)(0x6000000 + 0xD000));
        LZDecompressVram(gBattleAnimBackgroundTable[a].image, (void *)(0x6000000 + 0x8000));
        LoadCompressedPalette(gBattleAnimBackgroundTable[a].palette, 32, 32);
    }
}

static void dp01t_11_3_message_for_player_only(void)
{
    if (NotInBattle())
        sub_80AB2AC();
    else
        sub_800D7B8();
}

static void ScriptCmd_restorebg(void)
{
    u8 taskId;

    gBattleAnimScriptPtr++;
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    gTasks[taskId].data[0] = 0xFFFF;
    gUnknown_0202F7C5 = 1;
}

static void ScriptCmd_waitbgfadeout(void)
{
    if (gUnknown_0202F7C5 == 2)
    {
        gBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_waitbgfadein(void)
{
    if (gUnknown_0202F7C5 == 0)
    {
        gBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_changebg(void)
{
    gBattleAnimScriptPtr++;
    sub_8076DB8(((gBattleAnimScriptPtr)[0]));
    gBattleAnimScriptPtr++;
}
# 1520 "src/battle/battle_anim.c"
__attribute__((naked))
s8 sub_8076F98(s8 a)
{
    asm(".syntax unified\n    push {r4,lr}\n    lsls r0, 24\n    lsrs r4, r0, 24\n    bl NotInBattle\n    lsls r0, 24\n    cmp r0, 0\n    bne _08076FDC\n    ldr r0, _08076FD4 @ =gBattleAnimBankAttacker\n    ldrb r2, [r0]\n    lsls r0, r2, 1\n    adds r0, r2\n    lsls r0, 2\n    ldr r1, _08076FD8 @ =gSharedMem + 0x17810\n    adds r0, r1\n    ldrb r1, [r0]\n    movs r0, 0x10\n    ands r0, r1\n    cmp r0, 0\n    beq _08076FDC\n    adds r0, r2, 0\n    bl GetBankSide\n    lsls r0, 24\n    movs r4, 0xC0\n    cmp r0, 0\n    beq _0807706E\n    movs r4, 0x3F\n    b _0807706E\n    .align 2, 0\n_08076FD4: .4byte gBattleAnimBankAttacker\n_08076FD8: .4byte gSharedMem + 0x17810\n_08076FDC:\n    bl NotInBattle\n    lsls r0, 24\n    cmp r0, 0\n    beq _08077004\n    ldr r0, _08076FFC @ =gBattleAnimBankAttacker\n    ldr r1, _08077000 @ =gBattleAnimBankTarget\n    ldrb r0, [r0]\n    ldrb r1, [r1]\n    cmp r0, r1\n    bne _08077068\n    cmp r0, 0x2\n    bne _08077068\n    cmp r4, 0x3F\n    beq _0807707A\n    b _08077068\n    .align 2, 0\n_08076FFC: .4byte gBattleAnimBankAttacker\n_08077000: .4byte gBattleAnimBankTarget\n_08077004:\n    ldr r0, _0807702C @ =gBattleAnimBankAttacker\n    ldrb r0, [r0]\n    bl GetBankSide\n    lsls r0, 24\n    cmp r0, 0\n    bne _08077042\n    ldr r0, _08077030 @ =gBattleAnimBankTarget\n    ldrb r0, [r0]\n    bl GetBankSide\n    lsls r0, 24\n    cmp r0, 0\n    bne _0807706E\n    lsls r0, r4, 24\n    asrs r1, r0, 24\n    cmp r1, 0x3F\n    bne _08077034\n    movs r4, 0xC0\n    b _0807706E\n    .align 2, 0\n_0807702C: .4byte gBattleAnimBankAttacker\n_08077030: .4byte gBattleAnimBankTarget\n_08077034:\n    movs r0, 0x40\n    negs r0, r0\n    cmp r1, r0\n    beq _0807706E\n    negs r0, r1\n    lsls r0, 24\n    b _0807706C\n_08077042:\n    ldr r0, _08077064 @ =gBattleAnimBankTarget\n    ldrb r0, [r0]\n    bl GetBankSide\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x1\n    bne _08077068\n    lsls r0, r4, 24\n    asrs r0, 24\n    movs r1, 0x40\n    negs r1, r1\n    cmp r0, r1\n    bne _0807706E\n    movs r4, 0x3F\n    b _0807706E\n    .align 2, 0\n_08077064: .4byte gBattleAnimBankTarget\n_08077068:\n    lsls r0, r4, 24\n    negs r0, r0\n_0807706C:\n    lsrs r4, r0, 24\n_0807706E:\n    lsls r0, r4, 24\n    asrs r0, 24\n    cmp r0, 0x3F\n    ble _0807707A\n    movs r4, 0x3F\n    b _08077088\n_0807707A:\n    lsls r0, r4, 24\n    asrs r0, 24\n    movs r1, 0x40\n    negs r1, r1\n    cmp r0, r1\n    bge _08077088\n    movs r4, 0xC0\n_08077088:\n    lsls r0, r4, 24\n    asrs r0, 24\n    pop {r4}\n    pop {r1}\n    bx r1\n    .syntax divided\n");
# 1648 "src/battle/battle_anim.c"
}

s8 sub_8077094(s8 a)
{
    if (!NotInBattle() && (((struct UnknownStruct3 *)(gSharedMem + 0x17810))[gBattleAnimBankAttacker].unk0 & 0x10))
    {
        if (GetBankSide(gBattleAnimBankAttacker) != 0)
            a = 0x3F;
        else
            a = 0xC0;
    }
    else
    {
        if (GetBankSide(gBattleAnimBankAttacker) != 0 || NotInBattle() != 0)
            a = -a;
    }
    return a;
}

s16 sub_8077104(s16 a)
{
    s16 var = a;

    if (var > 63)
        var = 63;
    else if (var < -64)
        var = -64;
    return var;
}

s16 sub_807712C(s16 a, s16 b, s16 c)
{
    u16 var;

    if (a < b)
        var = ((c < 0) ? -c : c);
    else if (a > b)
        var = -((c < 0) ? -c : c);
    else
        var = 0;
    return var;
}

static void ScriptCmd_panse_19(void)
{
    u16 r4;
    s8 r0;

    gBattleAnimScriptPtr++;
    r4 = ((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8));
    r0 = ((gBattleAnimScriptPtr + 2)[0]);
    PlaySE12WithPanning(r4, sub_8076F98(r0));
    gBattleAnimScriptPtr += 3;
}

static void ScriptCmd_setpan(void)
{
    s8 r0;

    gBattleAnimScriptPtr++;
    r0 = ((gBattleAnimScriptPtr)[0]);
    SE12PanpotControl(sub_8076F98(r0));
    gBattleAnimScriptPtr++;
}

static void ScriptCmd_panse_1B(void)
{
    u16 songNum;
    s8 r0;
    s8 r4;
    s8 r6;
    u8 r7;
    s8 panning;
    s8 r8;
    u8 taskId;

    gBattleAnimScriptPtr++;
    songNum = ((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8));
    r0 = ((gBattleAnimScriptPtr + 2)[0]);
    r4 = ((gBattleAnimScriptPtr + 3)[0]);
    r6 = ((gBattleAnimScriptPtr + 4)[0]);
    r7 = ((gBattleAnimScriptPtr + 5)[0]);
    panning = sub_8076F98(r0);
    r8 = sub_8076F98(r4);
    r4 = sub_807712C(panning, r8, r6);
    taskId = CreateTask(c3_08073CEC, 1);
    gTasks[taskId].data[0] = panning;
    gTasks[taskId].data[1] = r8;
    gTasks[taskId].data[2] = r4;
    gTasks[taskId].data[3] = r7;
    gTasks[taskId].data[4] = panning;
    PlaySE12WithPanning(songNum, panning);
    gAnimSoundTaskCount++;
    gBattleAnimScriptPtr += 6;
}
# 1798 "src/battle/battle_anim.c"
__attribute__((naked))
static void c3_08073CEC(u8 taskId)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    lsls r0, 24\n    lsrs r5, r0, 24\n    movs r7, 0\n    ldr r1, _080772D4 @ =gTasks\n    lsls r0, r5, 2\n    adds r0, r5\n    lsls r0, 3\n    adds r2, r0, r1\n    ldrh r0, [r2, 0x18]\n    adds r1, r0, 0x1\n    strh r1, [r2, 0x18]\n    lsls r0, 16\n    asrs r0, 16\n    movs r3, 0xE\n    ldrsh r1, [r2, r3]\n    cmp r0, r1\n    blt _08077314\n    strh r7, [r2, 0x18]\n    ldrh r6, [r2, 0x8]\n    ldrh r3, [r2, 0xA]\n    movs r4, 0x10\n    ldrsh r0, [r2, r4]\n    movs r4, 0xC\n    ldrsh r1, [r2, r4]\n    adds r0, r1\n    lsls r0, 16\n    lsrs r4, r0, 16\n    strh r4, [r2, 0x10]\n    cmp r1, 0\n    bne _080772D8\n    lsls r2, r3, 16\n    b _080772FC\n    .align 2, 0\n_080772D4: .4byte gTasks\n_080772D8:\n    lsls r1, r6, 16\n    lsls r0, r3, 16\n    asrs r3, r0, 16\n    adds r2, r0, 0\n    cmp r1, r2\n    bge _080772EE\n    lsls r0, r4, 16\n    asrs r0, 16\n    cmp r0, r3\n    blt _080772F8\n    b _080772FC\n_080772EE:\n    lsls r0, r4, 16\n    asrs r0, 16\n    cmp r0, r3\n    bgt _080772F8\n    movs r7, 0x1\n_080772F8:\n    cmp r7, 0\n    beq _0807730C\n_080772FC:\n    lsrs r4, r2, 16\n    adds r0, r5, 0\n    bl DestroyTask\n    ldr r1, _0807731C @ =gAnimSoundTaskCount\n    ldrb r0, [r1]\n    subs r0, 0x1\n    strb r0, [r1]\n_0807730C:\n    lsls r0, r4, 24\n    asrs r0, 24\n    bl SE12PanpotControl\n_08077314:\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0807731C: .4byte gAnimSoundTaskCount\n    .syntax divided\n");
# 1877 "src/battle/battle_anim.c"
}


static void ScriptCmd_panse_26(void)
{
    u16 r8;
    s8 r4;
    s8 r5;
    s8 r6;
    u8 r10;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r8 = ((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8));
    r4 = ((gBattleAnimScriptPtr + 2)[0]);
    r5 = ((gBattleAnimScriptPtr + 3)[0]);
    r6 = ((gBattleAnimScriptPtr + 4)[0]);
    r10 = ((gBattleAnimScriptPtr + 5)[0]);
    taskId = CreateTask(c3_08073CEC, 1);
    gTasks[taskId].data[0] = r4;
    gTasks[taskId].data[1] = r5;
    gTasks[taskId].data[2] = r6;
    gTasks[taskId].data[3] = r10;
    gTasks[taskId].data[4] = r4;
    PlaySE12WithPanning(r8, r4);
    gAnimSoundTaskCount++;
    gBattleAnimScriptPtr += 6;
}

static void ScriptCmd_panse_27(void)
{
    u16 r9;
    u8 r4;
    u8 r8;
    u8 r7;
    u8 r0;
    s8 r6;
    s8 r5;
    s8 r4_2;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r9 = ((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8));
    r0 = ((gBattleAnimScriptPtr + 2)[0]);
    r4 = ((gBattleAnimScriptPtr + 3)[0]);
    r8 = ((gBattleAnimScriptPtr + 4)[0]);
    r7 = ((gBattleAnimScriptPtr + 5)[0]);
    r6 = sub_8077094(r0);
    r5 = sub_8077094(r4);
    r4_2 = sub_8077094(r8);
    taskId = CreateTask(c3_08073CEC, 1);
    gTasks[taskId].data[0] = r6;
    gTasks[taskId].data[1] = r5;
    gTasks[taskId].data[2] = r4_2;
    gTasks[taskId].data[3] = r7;
    gTasks[taskId].data[4] = r6;
    PlaySE12WithPanning(r9, r6);
    gAnimSoundTaskCount++;
    gBattleAnimScriptPtr += 6;
}

static void ScriptCmd_panse_1C(void)
{
    u16 r5;
    u8 r0;
    u8 r8;
    u8 r9;
    s8 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r5 = ((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8));
    r0 = ((gBattleAnimScriptPtr + 2)[0]);
    r8 = ((gBattleAnimScriptPtr + 3)[0]);
    r9 = ((gBattleAnimScriptPtr + 4)[0]);
    r4 = sub_8076F98(r0);
    taskId = CreateTask(sub_80774FC, 1);
    gTasks[taskId].data[0] = r5;
    gTasks[taskId].data[1] = r4;
    gTasks[taskId].data[2] = r8;
    gTasks[taskId].data[3] = r9;
    gTasks[taskId].data[8] = r8;
    gTasks[taskId].func(taskId);
    gAnimSoundTaskCount++;
    gBattleAnimScriptPtr += 5;
}

static void sub_80774FC(u8 taskId)
{
    s16 data8;
    u16 r0;
    s8 r1;
    u8 r4;

    data8 = gTasks[taskId].data[8];
    gTasks[taskId].data[8]++;
    if (data8 >= gTasks[taskId].data[2])
    {
        gTasks[taskId].data[8] = 0;
        r0 = gTasks[taskId].data[0];
        r1 = gTasks[taskId].data[1];
        gTasks[taskId].data[3]--;
        r4 = gTasks[taskId].data[3];
        PlaySE12WithPanning(r0, r1);
        if (r4 == 0)
        {
            DestroyTask(taskId);
            gAnimSoundTaskCount--;
        }
    }
}

static void ScriptCmd_panse_1D(void)
{
    u16 r5;
    u8 r0;
    u8 r8;
    s8 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r5 = ((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8));
    r0 = ((gBattleAnimScriptPtr + 2)[0]);
    r8 = ((gBattleAnimScriptPtr + 3)[0]);
    r4 = sub_8076F98(r0);
    taskId = CreateTask(sub_80775CC, 1);
    gTasks[taskId].data[0] = r5;
    gTasks[taskId].data[1] = r4;
    gTasks[taskId].data[2] = r8;
    gAnimSoundTaskCount++;
    gBattleAnimScriptPtr += 4;
}

static void sub_80775CC(u8 taskId)
{
    s16 r0;

    r0 = gTasks[taskId].data[2];
    gTasks[taskId].data[2]--;
    if (r0 <= 0)
    {
        PlaySE12WithPanning(gTasks[taskId].data[0], gTasks[taskId].data[1]);
        DestroyTask(taskId);
        gAnimSoundTaskCount--;
    }
}

static void ScriptCmd_createtask_1F(void)
{
    TaskFunc func;
    u8 numArgs;
    int i;
    u8 taskId;

    gBattleAnimScriptPtr++;
    func = (TaskFunc)((gBattleAnimScriptPtr)[0] + ((gBattleAnimScriptPtr)[1] << 8) + ((gBattleAnimScriptPtr)[2] << 16) + ((gBattleAnimScriptPtr)[3] << 24));
    gBattleAnimScriptPtr += 4;
    numArgs = ((gBattleAnimScriptPtr)[0]);
    gBattleAnimScriptPtr++;
    for (i = 0; i < numArgs; i++)
    {
        gBattleAnimArgs[i] = ((gBattleAnimScriptPtr)[0] | ((gBattleAnimScriptPtr)[1] << 8));
        gBattleAnimScriptPtr += 2;
    }
    taskId = CreateTask(func, 1);
    func(taskId);
    gAnimSoundTaskCount++;
}

static void ScriptCmd_waitsound(void)
{
    if (gAnimSoundTaskCount != 0)
    {
        gSoundAnimFramesToWait = 0;
        gAnimFramesToWait = 1;
    }
    else if (IsSEPlaying())
    {
        if (++gSoundAnimFramesToWait > 90)
        {
            m4aMPlayStop(&gMPlay_SE1);
            m4aMPlayStop(&gMPlay_SE2);
            gSoundAnimFramesToWait = 0;
        }
        else
        {
            gAnimFramesToWait = 1;
        }
    }
    else
    {
        gSoundAnimFramesToWait = 0;
        gBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
}

static void ScriptCmd_jumpvareq(void)
{
    u8 r2;
    s16 r1;
    u8 *addr;

    gBattleAnimScriptPtr++;
    r2 = ((gBattleAnimScriptPtr)[0]);
    r1 = ((gBattleAnimScriptPtr + 1)[0] | ((gBattleAnimScriptPtr + 1)[1] << 8));
    if (r1 == gBattleAnimArgs[r2])
    {
        addr = (void*) ((gBattleAnimScriptPtr + 3)[0] + ((gBattleAnimScriptPtr + 3)[1] << 8) + ((gBattleAnimScriptPtr + 3)[2] << 16) + ((gBattleAnimScriptPtr + 3)[3] << 24));
        gBattleAnimScriptPtr = addr;
    }
    else
    {
        gBattleAnimScriptPtr += 7;
    }
}

static void ScriptCmd_jumpunkcond(void)
{
    u8 *addr;

    gBattleAnimScriptPtr++;
    if (NotInBattle())
    {
        addr = (void*) ((gBattleAnimScriptPtr)[0] + ((gBattleAnimScriptPtr)[1] << 8) + ((gBattleAnimScriptPtr)[2] << 16) + ((gBattleAnimScriptPtr)[3] << 24));
        gBattleAnimScriptPtr = addr;
    }
    else
    {
        gBattleAnimScriptPtr += 4;
    }
}

static void ScriptCmd_monbgprio_28(void)
{
    u8 r2;
    u8 r0;
    u8 r4;

    r2 = ((gBattleAnimScriptPtr + 1)[0]);
    gBattleAnimScriptPtr += 2;
    if (r2 != 0)
        r0 = gBattleAnimBankTarget;
    else
        r0 = gBattleAnimBankAttacker;
    r4 = GetBankIdentity(r0);
    if (!NotInBattle() && (r4 == 0 || r4 == 3))
    {
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).priority = 1;
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xc)).priority = 2;
    }
}

static void ScriptCmd_monbgprio_29(void)
{
    gBattleAnimScriptPtr++;
    if (!NotInBattle())
    {
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).priority = 1;
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xc)).priority = 2;
    }
}

static void ScriptCmd_monbgprio_2A(void)
{
    u8 r6;
    u8 r4;
    u8 r0;

    r6 = ((gBattleAnimScriptPtr + 1)[0]);
    gBattleAnimScriptPtr += 2;
    if (GetBankSide(gBattleAnimBankAttacker) != GetBankSide(gBattleAnimBankTarget))
    {
        if (r6 != 0)
            r0 = gBattleAnimBankTarget;
        else
            r0 = gBattleAnimBankAttacker;
        r4 = GetBankIdentity(r0);
        if (!NotInBattle() && (r4 == 0 || r4 == 3))
        {
            (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).priority = 1;
            (*(struct BGCntrlBitfield *)(0x4000000 + 0xc)).priority = 2;
        }
    }
}

static void ScriptCmd_invisible(void)
{
    u8 r0;
    u8 spriteId;

    r0 = ((gBattleAnimScriptPtr + 1)[0]);
    spriteId = GetAnimBankSpriteId(r0);
    if (spriteId != 0xFF)
    {
        gSprites[spriteId].invisible = 1;
    }
    gBattleAnimScriptPtr += 2;
}

static void ScriptCmd_visible(void)
{
    u8 r0;
    u8 spriteId;

    r0 = ((gBattleAnimScriptPtr + 1)[0]);
    spriteId = GetAnimBankSpriteId(r0);
    if (spriteId != 0xFF)
    {
        gSprites[spriteId].invisible = 0;
    }
    gBattleAnimScriptPtr += 2;
}

static void ScriptCmd_doublebattle_2D(void)
{
    u8 r7;
    u8 r4;
    u8 spriteId;

    r7 = ((gBattleAnimScriptPtr + 1)[0]);
    gBattleAnimScriptPtr += 2;
    if (!NotInBattle() && IsDoubleBattle()
     && GetBankSide(gBattleAnimBankAttacker) == GetBankSide(gBattleAnimBankTarget))
    {
        if (r7 == 0)
        {
            r4 = GetBankIdentity_permutated(gBattleAnimBankAttacker);
            spriteId = GetAnimBankSpriteId(0);
        }
        else
        {
            r4 = GetBankIdentity_permutated(gBattleAnimBankTarget);
            spriteId = GetAnimBankSpriteId(1);
        }
        if (spriteId != 0xFF)
        {
            gSprites[spriteId].invisible = 0;
            if (r4 == 2)
                gSprites[spriteId].oam.priority = 3;
            if (r4 == 1)
                sub_8076464(0);
            else
                sub_8076464(1);
        }
    }
}

static void ScriptCmd_doublebattle_2E(void)
{
    u8 r7;
    u8 r4;
    u8 spriteId;

    r7 = ((gBattleAnimScriptPtr + 1)[0]);
    gBattleAnimScriptPtr += 2;
    if (!NotInBattle() && IsDoubleBattle()
     && GetBankSide(gBattleAnimBankAttacker) == GetBankSide(gBattleAnimBankTarget))
    {
        if (r7 == 0)
        {
            r4 = GetBankIdentity_permutated(gBattleAnimBankAttacker);
            spriteId = GetAnimBankSpriteId(0);
        }
        else
        {
            r4 = GetBankIdentity_permutated(gBattleAnimBankTarget);
            spriteId = GetAnimBankSpriteId(1);
        }
        if (spriteId != 0xFF && r4 == 2)
        {
            gSprites[spriteId].oam.priority = 2;
        }
    }
}

static void ScriptCmd_stopsound(void)
{
    m4aMPlayStop(&gMPlay_SE1);
    m4aMPlayStop(&gMPlay_SE2);
    gBattleAnimScriptPtr++;
}
