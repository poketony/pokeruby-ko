# 1 "src/pokenav_before.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/pokenav_before.c"
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
# 2 "src/pokenav_before.c" 2
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
# 3 "src/pokenav_before.c" 2
# 1 "include/pokenav.h" 1



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
# 5 "include/pokenav.h" 2

struct UnkPokenavStruct_Sub {
            u16 unk0;
            u8 filler2[6];
};

struct UnkPokenavStruct_Sub1 {
             void (*unk0)(void);
             MainCallback callback;
             struct Pokeblock *pokeblock;
             struct Pokemon *pokemon;
             u8 stringBuffer[0x40];
             u8 unk50;
             u8 unk51;
             u8 unk52;
             u8 unk53;
             u8 unk54;
             u8 unk55;
             u8 unk56;
             u8 unk57[5];
             u8 unk5c[5];
             u8 unk61[5];
             s16 unk66[5];
};

struct UnkPokenavStruct_Sub2 {
             u8 filler_00[0x26];
             u16 unk26;
};

struct UnkPokenavStruct_Sub3 {
            s16 unk0;
};

struct UnkUsePokeblockSub {
          u8 fil0[2];
          u8 partyIdx:5;
          u16 unk2:9;
};

struct UnkPokenavStruct {
               u8 filler0000[0x306];
               u16 unk306;
               u8 filler0308[0x4];
               union {
        u16 val;
        struct UnkPokenavStruct_Sub3 unk030C;
    } unk030C;
               u8 filler030E[0x6a90];
               u16 unk6DA0;
               u16 unk6DA2;
               u16 taskId6DA4;
               u8 filler6DA6[0x6];
               u8 unk6DAC;
               u8 filler6DAD[0x6B];
               struct RegionMap regionMap;
               u16 unk7698;
               u16 unk769A;
               u8 unk769C;
               u8 unk769D;
               u8 unk769E;
               u8 filler769F[0xB];
               u8 unk76AA;
               u8 filler76AB[0x10bd];
               struct UnkPokenavStruct_Sub2 *unk8768;
               u8 filler876C[0x2];
               u8 unk876E;
               u8 filler876F[0x7];
               u16 unk8776;
               u16 unk8778;
               u8 filler877A[0xE];
               u8 unk8788[0x40];
               u8 unk87C8;
               u8 filler87C9;
               u8 unk87CA;
               u8 filler87CB[0xF];
               s16 unk87DA;
               s16 unk87DC;
               s16 unk87DE;
               void *unk87E0;
               u8 filler87E4[0x44];
               u8 unk8828;
               u8 unk8829[3][64];
               u8 unk88E9[3][24];
               u8 unk8931[11];
               struct UnkUsePokeblockSub unk893c[0x1ab];
               u8 fil8fe8[1];
               s8 unk8fe9;
               u8 fil8fea[6];
               u8 unk8ff0;
               u8 filler8ff1[0x13];
               u8 unk9004[3][20];
               u8 unk9040[0x304];
               u8 unk9344;
               u8 filler9345[0x2955];
               u8 unkBC9A;
               u8 unkBC9B;
               u8 unkBC9C[22][200];
               const u8 *unkCDCC[16][2];
               u16 unkCE4C;
               u16 unkCE4E;
               u16 unkCE50;
               u16 palettesCE52[30];
               u16 palettesCE8E[0x2D];
               struct UnkPokenavStruct_Sub unkCEE8[78];
               u16 unkD158;
               u8 fillerD15A[6];
               u16 unkD160;
               u8 unkD162[2];
               struct UnkPokenavStruct_Sub1 unkD164;
};

extern struct UnkPokenavStruct *const gUnknown_083DFEC4;

bool8 sub_80F170C(void);
bool8 sub_80F1778(void);
void sub_80F1934(void);
void sub_80F2C80(u8);
void sub_80F2688(void);
bool8 sub_80F26BC(void);
bool8 sub_80F2CBC(u8);
void sub_80F2E18(u8);
void sub_80F33A8(void);
void sub_80F3C94(void);
void sub_80F3D00(void);
void sub_80F4BD0(void);
void sub_80F556C(void *);
void sub_80F567C(void *, void *);
void sub_80F5B38(void);
bool8 sub_80F5B50(void);
void sub_80F5CDC(u8);
void sub_80EBA5C(void);
void sub_80F5060(bool8);
void move_anim_execute(void);
bool8 gpu_sync_bg_show(void);
void sub_80F5550(void *, void *);
bool8 sub_80F555C(void);
void sub_80F7224(u8);
void sub_80F5BDC(void);
# 4 "src/pokenav_before.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 5 "src/pokenav_before.c" 2
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
# 6 "src/pokenav_before.c" 2
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
# 7 "src/pokenav_before.c" 2
# 1 "include/flags.h" 1
# 94 "include/flags.h"
bool8 FlagGet(u16 flag);
# 8 "src/pokenav_before.c" 2
# 1 "include/landmark.h" 1



u8 *GetLandmarkName(u8 mapSection, u8 id, u8 count);
# 9 "src/pokenav_before.c" 2
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
# 10 "src/pokenav_before.c" 2
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
# 11 "src/pokenav_before.c" 2
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
# 12 "src/pokenav_before.c" 2
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
# 13 "src/pokenav_before.c" 2
# 1 "include/region_map.h" 1
# 14 "src/pokenav_before.c" 2
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
# 15 "src/pokenav_before.c" 2
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
# 16 "src/pokenav_before.c" 2
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
# 17 "src/pokenav_before.c" 2
# 1 "include/task.h" 1
# 18 "src/pokenav_before.c" 2
# 1 "include/text.h" 1
# 19 "src/pokenav_before.c" 2
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
# 20 "src/pokenav_before.c" 2

extern u8 ewram[];

struct UnknownPokenav0 {
              u8 var0[0x0300];
              void (*var300)(void);
              u16 var304;
              u16 var306;
              u32 var308;
              u8 fill030C[0x6a9f];
              u8 var6dab;
              u8 var6dac;
              u8 var6dad;
              u8 var6dae;
              u8 fill6daf[0x3];
              u8 var6db2[5];
              u8 fill6db7[0x25];
              s8 var6ddc;
              u8 fill6ddd[0x13];
              s8 var6df0;
              u8 fill6df1[0xB];
              u8 var6dfc;
              u8 fill6dfd[0x17];
              u8 var6e14;
              u8 var6e15;
              u8 var6e16;
              u8 var6e17;
              u8 fill6e18[0x78];
              u8 var6e90;
              u8 fill6e91[0x4];
              u8 var6e95;
              u8 var6e96[0x814];
              u8 var76aa;
              u8 fill76AB[0x10BD];
              u32 var8768;
              u8 fill876C[0x2];
              u8 var876E;
              u8 fill876F[0x5];
              s16 var8774;
              u8 fill8776[0x55];
              u8 var87CB;
              u8 fill87CC[0xC];
              u8 var87D8;
              u8 fill87D9[0x1];
              s16 var87DA;
              s16 var87DC;
              u8 fill87DE[0x4a];
              u8 playerPartyCount;
              u8 fill8829[0x07bf];
              s8 var8fe8;
              u8 fill8FE9[0x16];
              u8 var8fff[5];
              u8 fill9004[0x340];
              u8 var9344;
              u8 fill9345[0x3b8b];
              u32 varCED0;
              u8 fillCED4[0x284];
              u16 varD158;
              u8 fillD15A[0x8];
              u8 varD162;
};

struct UnknownPokenav0_1 {
 u8 fill6dad[0x6dad];
 s8 var6dad;
 s8 var6dae;
};

__attribute__((section("iwram_data"))) void (*gUnknown_03000744)(void);

extern const u8 gUnknown_083E0314[];
extern const u16 gUnknown_08E9F9E8[];
extern const u16 gUnknown_083E0274[];
extern const u8 gUnknown_08E9FC64[];
extern const u8 gUnknown_083E0354[];
extern const u8 gUnknown_08E9FD64[];
extern const u8 gUnknown_08E9FE54[];
extern const u8 gUnknown_08E9FD1C[];
extern const u16 gPokenavConditionSearch2_Pal[];
extern const u8 gUnknown_083E0334[];
extern const u16 gUnknown_083E02B4[];
extern const u8 gPokenavConditionSearch2_Gfx[];
extern const u8 gUnknownPalette_81E6692[];
extern const u8 gUnknown_083E0254[];
extern const u8 gUnknown_08E9FEB4[];
extern const u8 gUnknown_083E01AC[];
extern const u8 gUnknown_08E9AC4C[];
extern const u8 gPokenavConditionMenu2_Pal[];
extern const u8 gPokenavConditionView_Gfx[];
extern const u8 gUnknown_08E9ABB4[];
extern const u8 gUnknown_08E9AC2C[];
extern const u8 *const gPokenavCityMaps[][2];
extern const u8 gPokenavHoennMapSquares_Pal[];
extern const u8 gPokenavHoennMapSquares_Gfx[];
extern const u16 gUnknown_083E003C[];
extern const u8 *const gUnknown_083E31B0[];
extern const u8 *const gUnknown_083E31CC[];
extern const u8 *const gUnknown_083E31D8[];
extern u8 *gUnknown_083DFEC8;
extern const u8 gUnknown_083DFEEC[];
extern const u8 gUnknown_083E005C[];
extern const u8 gUnknown_083E007C[];
extern const u8 gPokenavOutlineTilemap[];
extern const u8 gPokenavOutlineTiles[];
extern const u8 gPokenavOutlinePalette[];
extern const u8 gUnknown_083DFECC[];
extern const u8 gUnknown_083DFF8C[];
extern const u8 gPokenavHoennMapMisc_Gfx[];
extern const u8 gUnknown_08E99FB0[];
extern const u8 gUnknown_08E9A100[];
extern const u16 gPokenavHoennMap1_Pal[];

static void sub_80EBCA8();
static void sub_80EEE20();
static bool8 sub_80EEE54();
static void sub_80EEE08();
static void sub_80EED2C(u8);
static void sub_80EC268();
static void sub_80EED1C();
static void sub_80EE9C0(u8, u8, u8);
static bool8 sub_80EEA0C();
static bool8 sub_80EEC10();
static void sub_80EED9C();
static void sub_80EDB88();
static void sub_80EC4A0();
static void sub_80EC81C();
static void sub_80EE96C();
static void sub_80EE3D8();
static bool8 sub_80EEF34();
static void sub_80EED0C();
static void sub_80EC67C();
static void sub_80EC86C();
static bool8 sub_80EEC90();
static void sub_80ED620();
static void sub_80EC960();
static void sub_80ED01C();
static void sub_80ECC08();
static void sub_80ED31C();
static void sub_80ED4D8();
static void sub_80ED858();
static void sub_80EDDBC();
static void sub_80EDE70();
static void sub_80EDEE4();
static void sub_80EE06C();
static void sub_80EE294();
static void sub_80EE58C();
static void sub_80EE658();
static void sub_80EE8F4();
static void sub_80EEDC4();

extern bool8 sub_80F0944(void);
extern void sub_80F081C();
extern void sub_80F0900(void);
extern void sub_80F443C(u8 *, u16);
extern bool8 sub_80F162C(u8);
extern void sub_80F01E0(u16);
extern void sub_80F01A4(void);
extern void sub_80F1614(void);
extern void sub_80EFD3C(void);
extern void sub_8095C8C();
extern void sub_80EFDA0(void);
extern void sub_80EFD74(void);
extern void sub_80F1A80(void);
extern bool8 sub_80EFC64(void);
extern void sub_80EFC3C(void);
extern void sub_80EF624(const u16 *, const u16 *, u8, u8, u16 *);
extern void sub_80EF7D4(void);
extern void sub_80EF54C(u8);
extern void sub_809D104(u16 *, u16, u16, const u8 *, u16, u16, u16, u16);
extern void sub_80EF58C(u8);
extern void sub_80F6FFC();
extern void sub_80F3294();
extern void sub_80F0B24();
extern bool8 sub_80F0B44();
extern void sub_80F0F64();
extern bool8 sub_80F0FEC();
extern void sub_80F6FB8();
extern void sub_80F6DB8();
extern void sub_80F0CD8();
extern bool8 sub_80F6E9C();
extern bool8 sub_80F0D5C();
extern bool8 sub_80F6ED4();
extern bool8 sub_80F0EF4();
extern void sub_80F2FB0();
extern void sub_80F0FA0();
extern void sub_80F0C28();
extern bool8 sub_80F0C48();
extern bool8 sub_80F70FC();
extern void sub_80F708C(u32);
extern void sub_80F4394();
extern void sub_80F0EC0();
extern void sub_80F700C();
extern void sub_80F42C4();
extern void sub_80F0FFC();
extern void sub_80F6F10();
extern void sub_80F3C2C();
extern void sub_80F15A8();
extern void sub_80F6A4C();
extern bool8 sub_80F6AF0();
extern void sub_80F3B00();
extern bool8 sub_80F3B58();
extern void sub_80F1494();
extern u8 sub_80F68E8();
extern void sub_80F3B94();
extern bool8 sub_80F3BD4();
extern void sub_80F66E0();
extern bool8 sub_80F1080();
extern void sub_80F38B8();
extern bool8 sub_80F38EC();
extern void sub_80F638C();
extern bool8 sub_80F63D0();
extern void sub_80F4CF0();
extern void sub_80EFF34();
extern bool8 sub_80EFF68();
extern void sub_80F35B4();
extern void sub_80F6134();
extern u8 sub_80F5DD4();
extern void ShowMapNamePopUpWindow();
extern bool8 sub_80F0718();
extern bool8 sub_80F3264();
extern void sub_80F4D44();
extern bool8 sub_80F4D88();
extern void sub_80F0264(u8);
extern bool8 sub_80F02A0();
extern void sub_80F3008();
extern void sub_80F3130();
extern void sub_80F2D6C(u32);
extern bool8 sub_80F1E6C();
extern void sub_80EF9F8(void);
extern bool8 sub_80EFBDC(bool8);
extern void sub_80EFBB0(void);
extern void sub_80F2DF4();
extern void sub_80F1E84();
extern bool8 sub_80F1F10();
extern void sub_80EEFBC(u8);
extern void sub_80F2620();
extern void sub_80EF814(void);
extern void sub_80EF840(void);
extern bool8 sub_80EF874(void);
extern void sub_80F2DD8();
extern bool8 sub_80F6250();
extern void sub_80F6208();
extern void sub_80F208C();
extern void sub_80F6C20();
extern void sub_80F3FF0();
extern bool8 sub_80F4024();
extern void sub_80F2598();
extern void sub_80EF248(u8);
extern bool8 sub_80EF284(u8);
extern void sub_80F1B8C();
extern bool8 sub_80F1BC8(u32 unk);
extern void sub_80F1DF0();
extern bool8 sub_80F1E50();
extern void sub_80EF428(u8, u8);
extern bool8 sub_80EEF78();
extern void sub_80F1A90();
extern void sub_80F2D04(u32);
extern bool8 sub_80F1AC4();
extern void sub_80F36F0();
extern bool8 sub_80F3724();
extern void sub_80EBC10();
extern void sub_80EBDBC(void (*func)(void));
extern void sub_80EBBE8();
extern bool8 sub_80F26BC(void);
extern void sub_80EBDD8();
extern void sub_80EBD90();
extern void sub_80EBD18();
extern void sub_80F1A74();
extern void sub_80F1FF0();
extern void sub_80FB260();
extern void sub_80EFE7C(void);
extern void sub_80F5BF0();
extern void sub_80F6F64();
extern void sub_80F19FC();

extern u16 gKeyRepeatStartDelay;


void sub_80EBA5C() {
 switch (gMain.state) {
  default:
   gMain.state = 0;
  case 0:
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dac = is_c1_link_related_active();
   if (!(*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dac) {
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dab = 0;
    gMain.state++;
    SetMainCallback2(&sub_80EBBE8);
    break;
   }
   break;
  case 1:
   SetVBlankCallback(((void *)0));
   break;
  case 2:
   ResetPaletteFade();
   break;
  case 3:
   ResetSpriteData();
   break;
  case 4:
   FreeAllSpritePalettes();
   break;
  case 5:
   ResetTasks();
   break;
  case 6:
   remove_some_task();
   break;
  case 7:
   sub_80F1A90();
   gMain.state++;
  case 8:
   if (sub_80F1AC4()) return;
   break;
  case 9:
   sub_80F2688();
   gMain.state++;

  case 10:
   if (sub_80F26BC()) return;
   break;
  case 11:
   sub_80F36F0();
   gMain.state++;
  case 12:
   if (sub_80F3724()) return;
   break;
  case 13:
   sub_80EBC10();
   sub_80EBDBC(&sub_80EBDD8);
   break;
  case 14:
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dab = 1;
   PlaySE(SE_PN_ON);
   SetMainCallback2(&sub_80EBD90);
   SetVBlankCallback(&sub_80EBD18);
   sub_80F1A74();
   break;
 }

 gMain.state++;
}

void sub_80EBBE8() {
 u8 var1;
 if (!(*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dab) {
  var1 = (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dab;
  do {
   sub_80EBA5C();
   var1 = (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dab;
  } while (!var1);
 }
}

void sub_80EBC10() {
 u16 i;
 u16 *var1;

 gKeyRepeatStartDelay = 0x14;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).playerPartyCount = CalculatePlayerPartyCount();
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6ddc = 0;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var9344 = 0;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var8768 = 0;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).varCED0 = 0;

 for (i = 0; i < 5; ++i) {
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var8fff[i] = 0;
  var1 = (u16 *)(*(struct UnknownPokenav0*)(gSharedMem + 0)).var0;
  var1[i*2 + 0x4820] = 0x9B;
  var1[i*2 + 0x4821] = 0x5B;
 }

 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6e95 = 0;
 sub_80EBCA8();
}

void sub_80EBCA8() {
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6db2[0] = 1;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6db2[1] = 2;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6db2[2] = 3;

 if (FlagGet(0x83B)) {
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6db2[3] = 4;
 }
 else {
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6db2[3] = 0;
 }

 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6db2[4] = 5;
}

void sub_80EBD18() {
 LoadOam();
 ProcessSpriteCopyRequests();
 TransferPlttBuffer();
 sub_80F1FF0();
}

void sub_80EBD30() {
 LoadOam();
 ProcessSpriteCopyRequests();
 TransferPlttBuffer();
 UpdateRegionMapVideoRegs();
 sub_80EFE7C();
}

void sub_80EBD4C() {
 LoadOam();
 ProcessSpriteCopyRequests();
 TransferPlttBuffer();
 sub_80F5BF0();
 sub_8089668();
}

void sub_80EBD68() {
 LoadOam();
 ProcessSpriteCopyRequests();
 TransferPlttBuffer();
 sub_80F6F64();
}

void sub_80EBD80() {
 LoadOam();
 ProcessSpriteCopyRequests();
}

void sub_80EBD90() {
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var300();
 AnimateSprites();
 BuildOamBuffer();
 RunTasks();
 UpdatePaletteFade();
 sub_80F19FC();
}

void sub_80EBDBC(void (*func)(void)) {
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var300 = func;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0;
}

void sub_80EBDD8() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  SetVBlankCallback(((void *)0));
  (*(vu16 *)(0x4000000 + 0x0)) = 0;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad = (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6ddc;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dae = 5;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  sub_80F3FF0();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 2:
  if (sub_80F4024()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 3:
  sub_80F2598();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  sub_80EEE20();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 5:
  if (sub_80EEE54()) return;
  sub_80EEE08();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  return;
 case 6:
  sub_80EF248(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 7:
  if (sub_80EF284(0)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 8:
  sub_80F1B8C(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 9:
  if (sub_80F1BC8(0)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 10:
  SetVBlankCallback(&sub_80EBD18);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 11:
  BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  return;
 case 12:
  sub_80EED2C(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  return;
 case 13:
  if (gPaletteFade.active) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  return;
 case 14:
  sub_80F2C80(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 15:
  if (sub_80F2CBC(0)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 16:
  sub_80F1DF0();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  return;
 case 17:
  if (!sub_80F1E50()) {
   sub_80EF428(0, 0);
   sub_80EBDBC(&sub_80EC268);
  }
  return;

 }

}

void sub_80EC00C() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  if (!sub_80EEF78()) {
   SetVBlankCallback(&sub_80EBD80);
   sub_80EED1C();
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad = (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6ddc;
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dae = 5;
   sub_80EEE08();
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  }
  break;
 case 1:
  sub_80EF248(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 2:
  if (sub_80EF284(0)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 3:
  sub_80F1B8C(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 4:
  if (sub_80F1BC8(0)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 6:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
         SetVBlankCallback(&sub_80EBD18);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 7:
  sub_80EED2C(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 8:
  if (gPaletteFade.active) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  return;
 case 9:
  sub_80F2598();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 10:
  sub_80F2C80(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 11:
  if (sub_80F2CBC(0)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  return;
 case 12:
  sub_80F1DF0();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  return;
        case 13:
  if (sub_80F1E50()) return;
                sub_80EF428(0, (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad);
  sub_80EBDBC(&sub_80EC268);
 }
}

void sub_80EC210() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  sub_80F2D04(1);
  sub_80EE9C0(0, (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6ddc, 0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (sub_80EEA0C()) return;
  sub_80EBDBC(&sub_80EC268);
 }
}

void sub_80EC268() {
 u8 var1;
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  if (sub_80EEC10() != 0) {
   PlaySE(0x5);
   sub_80EF428(0, (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad);
   sub_80EED9C();
   break;
  }
  else {
   if (gMain.newKeys & 0x0001) {
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6ddc = (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad;
    switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var6db2[(*(struct UnknownPokenav0*)(gSharedMem + 0)).var6ddc] - 1) {
    case 0:
     PlaySE(5);
     sub_80EBDBC(&sub_80EC4A0);
     break;
    case 1:
     PlaySE(5);
     sub_80EBDBC(&sub_80EC81C);
     break;
    case 4:
     (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 1;
     break;
    case 3:
     (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 2;
     break;
    case 2:
     (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 6;
     break;
    }
   }
   else if (gMain.newKeys & 0x0002) {
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 1;
   }
   break;
  }
 case 1:
  sub_80F208C();
  sub_80EBDBC(&sub_80EE96C);
  break;
 case 2:
  sub_80F6208();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 3:
  if (sub_80F6250()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  if (sub_8055870()) return;
  if ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var8fe8 != 0) {
   PlaySE(0x5);
   sub_80EBDBC(&sub_80EDB88);
   break;
  }
  else {
   PlaySE(0x20);
   sub_80EF428(0, 5);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0xFF;
   break;
  }
 case 6:
  sub_80F6C20();
  if ((*(struct UnknownPokenav0*)(gSharedMem + 0)).varD158 != 0) {
   PlaySE(0x5);
   sub_80EBDBC(&sub_80EE3D8);
   break;
  }
  else {
   PlaySE(0x20);
   sub_80EF428(0, 6);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0xFF;
   break;
  }
 case 0xFF:
  if ((var1 = sub_80EEC10()) != 0) {
   PlaySE(0x5);
   sub_80EF428(0, (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0;
   sub_80EED9C();
  }
  else {
   if (!(gMain.newKeys & (0x0001 | 0x0002))) return;
   sub_80EF428(0, (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = var1;
   break;
  }
 }
}

void sub_80EC4A0() {
 u32 var1;
 u32 var2;
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  sub_80F1E84();
  sub_80F2D04(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (!sub_80F1F10()) {
   if (gSaveBlock2.regionMapZoom) {
    var1 = 0x7;
   }
   else var1 = 0x8;
   sub_80EEFBC(var1);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  }
  break;
 case 2:
  if (!(var2 = sub_80EEF34())) {
   BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x0, 0x10, var2);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  }
  break;
 case 3:
  if (gPaletteFade.active) return;
  SetVBlankCallback(((void *)0));
  sub_80EED0C();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  sub_80F2620();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  sub_80EF814();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 6:
  sub_80EF840();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 7:
  if (sub_80EF874()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 8:
  sub_80F2C80(0x4);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 9:
  if (sub_80F2CBC(0x4)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 0xA:
  sub_80F2DD8();
  SetVBlankCallback(&sub_80EBD30);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 0xB:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 0xC:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
        case 0xD:
  sub_80EED2C(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 0xE:
  if (gPaletteFade.active) return;
  sub_80EBDBC(&sub_80EC67C);
 }
}

void sub_80EC67C() {
 u32 var1;
 u32 var2;
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  switch (sub_80FAB60()) {
  case 1:
   sub_80EED9C();
   break;
  case 3:
   sub_80EF9F8();
   break;
  case 4:
   PlaySE(0x5);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 1;
   break;
  case 5:
   PlaySE(0x5);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 4;
   break;
  }
  break;
 case 1:
  if (!(*(struct UnknownPokenav0*)(gSharedMem + 0)).var6e90) {
   sub_80FAEC4();
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
   break;
  }
  if (sub_80EFBDC(1)) return;
  sub_80FAEC4();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  if ((var2 = sub_80FAFC0())) return;
  if (!(*(struct UnknownPokenav0*)(gSharedMem + 0)).var6e90) {
   sub_80EFBB0();
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = var2;
   break;
  }
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 3:
  if ((var1 = sub_80EFBDC(0))) return;
  sub_80EFBB0();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = var1;
  break;
 case 4:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0, 0x10, 0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  if (gPaletteFade.active) return;
  sub_80F2DF4();
  sub_80F2D04(0x4);
  gSaveBlock2.regionMapZoom = ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var6e90 == 1) ? 1 : 0;
  sub_80EBDBC(&sub_80EC00C);
 }
}

void sub_80EC81C() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  sub_80F2D04(0);
  sub_80EE9C0(1, 0, 1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (sub_80EEA0C()) return;
  sub_80EBDBC(&sub_80EC86C);
 }
}

void sub_80EC86C() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  if (sub_80EEC90()) {
   PlaySE(0x5);
   sub_80EF428(1, (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad);
   sub_80EED9C();
   break;
  }
  if (gMain.newKeys & 0x0001) {
   PlaySE(0x5);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6df0 = (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad;
   switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var6df0) {
   case 0:
    sub_80EBDBC(&sub_80ED620);
    break;
   case 1:
    sub_80EBDBC(&sub_80EC960);
    break;
   case 2:
    sub_80EBDBC(&sub_80EC210);
    break;
   }
   break;
  }
  else if (gMain.newKeys & 0x0002) {
   PlaySE(0x5);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6df0 = 0x2;
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad = 0x2;
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
   break;
  }
  break;
 case 1:
  if (sub_80F1E6C()) return;
  sub_80EBDBC(&sub_80EC210);
 }
}

void sub_80EC960() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  sub_80EE9C0(2, 0, 5);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (sub_80EEA0C()) return;
  sub_80EBDBC(&sub_80ECC08);
 }
}

void sub_80EC9A8() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  sub_80F2D04(5);
  sub_80EE9C0(1, (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6df0, 0xC);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (sub_80EEA0C()) return;
  sub_80EBDBC(&sub_80EC86C);
  sub_80EF428(1, (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad);
 }
}

void sub_80ECA10() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  if (sub_80EEF78()) return;
  SetVBlankCallback(&sub_80EBD80);
  sub_80EED1C();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad = (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6df0;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dae = 0x3;
  sub_80EEE08();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  sub_80EF248(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 2:
  if (sub_80EF284(0x1)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 3:
  sub_80F1B8C(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 4:
  if (sub_80F1BC8(0x1)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 6:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
  SetVBlankCallback(&sub_80EBD18);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 7:
  sub_80EED2C(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 8:
  sub_80F2598();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 9:
  if (gPaletteFade.active) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 0xA:
  sub_80F2C80(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;

 case 0xB:
  if (sub_80F2CBC(0x1)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 0xC:
  sub_80F1DF0();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 0xD:
  if (sub_80F1E50()) return;
  sub_80EF428(1, (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad);
  sub_80EBDBC(&sub_80EC86C);
 }
}

void sub_80ECC08() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  if (sub_80EEC90()) {
   PlaySE(0x5);
   sub_80EF428(2, (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad);
   sub_80EED9C();
   break;
  }

  if (gMain.newKeys & 0x0001) {
   PlaySE(0x5);
   switch ((s8)(*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad) {
   case 0:
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var87D8 = 22;
    break;
   case 1:
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var87D8 = 23;
    break;
   case 2:
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var87D8 = 24;
    break;
   case 3:
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var87D8 = 33;
    break;
   case 4:
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var87D8 = 47;
    break;
   case 5:
    sub_80EBDBC(&sub_80EC9A8);
    return;
   }

   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dfc = (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad;
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var76aa = 1;
   sub_80EBDBC(&sub_80ED01C);
  }
  else if (gMain.newKeys & 0x0002) {
   PlaySE(0x5);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad = 0x5;
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  }
  break;
 case 1:
  if (sub_80F1E6C()) return;;
  sub_80EBDBC(&sub_80EC9A8);
  break;
 }
}

void sub_80ECD80() {
 u16 var1;
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0, 0x10, 0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (gPaletteFade.active) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  if (sub_80EEF78()) return;
  SetVBlankCallback(&sub_80EBD80);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 3:
  sub_80EED1C();
  sub_80F3130();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  sub_80F2D6C(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  sub_80F2D6C(0x5);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 6:
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad = (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dfc;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dae = 0x6;
  sub_80EEE08();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 7:
  sub_80EF248(0x2);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 8:
  if (sub_80EF284(0x2)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 9:
  sub_80F1B8C(0x2);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 10:
  if (sub_80F1BC8(0x2)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 11:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 12:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
  SetVBlankCallback(&sub_80EBD18);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 13:
  sub_80EED2C(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 14:
  sub_80F2598();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 15:
  if (gPaletteFade.active) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 16:
  sub_80F2C80(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 17:
  if ((var1 = sub_80F2CBC(0x1))) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var306 = var1;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 18:
  sub_80F2C80(0x5);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 19:
  if (sub_80F2CBC(0x5)) return;
  sub_80F1DF0();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 20:
  if (sub_80F1E50()) return;
  sub_80EF428(2, (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dad);
  sub_80EBDBC(&sub_80ECC08);
 }
}

void sub_80ED01C() {
 u16 var1;
 u16 var3;
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  sub_80F1E84();
  sub_80F2D04(0x1);
  sub_80F2D04(0x5);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (sub_80F1F10()) return;
  sub_80EEFBC(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  if ((var1 = sub_80EEF34())) return;
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x0, 0x10, var1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 3:
  if (gPaletteFade.active) return;
  SetVBlankCallback(((void *)0));
  sub_80EED0C();
  sub_80EF814();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  sub_80F2620();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  sub_80F4D44();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 6:
  if (!sub_80F4D88()) {
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 += 2;
   break;
  }
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 7:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304--;
  break;
 case 8:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 9:
  sub_80F0264(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 10:
  if (sub_80F02A0()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 11:
  sub_80F3008(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 12:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 13:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
  SetVBlankCallback(&sub_80EBD18);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 14:
  sub_80EED2C(0x4);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 15:
  if (gPaletteFade.active) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var306 = (u8)(gPaletteFade.active << 24);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 16:
  sub_80F2C80(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 17:
  if ((var3 = sub_80F2CBC(0x1))) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var306 = var3;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 18:
  sub_80F2C80((*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dfc + 7);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 19:
  if (sub_80F2CBC((*(struct UnknownPokenav0*)(gSharedMem + 0)).var6dfc + 7)) return;
  sub_80EBDBC(&sub_80ED31C);
  break;
 }
}

void sub_80ED31C() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  switch (sub_80F5DD4()) {
  case 1:
   PlaySE(0x5);
   ShowMapNamePopUpWindow();
   break;
  case 2:
   PlaySE(0x5);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
   break;
  default:
   if (gMain.newKeys & 0x0001) {
    PlaySE(0x5);
    sub_80EBDBC(&sub_80ED4D8);
   }
   else if (gMain.newKeys & 0x0002) {
    PlaySE(0x5);
    sub_80EBDBC(&sub_80ECD80);
   }
   break;
  }
  break;
 case 1:
  if (sub_80F0718()) return;
  ShowMapNamePopUpWindow();
  sub_80F3264();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0;
  break;
 }
}

void sub_80ED3D0() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  SetVBlankCallback(((void *)0));
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  sub_80EED0C();
  sub_80F6134();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  sub_80EEFBC(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 3:
  sub_80F0264(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 4:
  if (sub_80F02A0()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 6:
  sub_80F3008(0);
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
  SetVBlankCallback(&sub_80EBD18);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 7:
  sub_80EED2C(0x4);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 8:
  if (gPaletteFade.active) return;
  sub_80EBDBC(&sub_80ED31C);
 }
}

void sub_80ED4D8() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0, 0x10, 0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (gPaletteFade.active) return;
  SetVBlankCallback(((void *)0));
  sub_80EED0C();
  sub_80F3130();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 3:
  sub_80F4CF0();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  sub_80EFF34();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 5:
  if (sub_80EFF68()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 6:
  sub_80F35B4();
  sub_80EEFBC(0x2);
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
  SetVBlankCallback(sub_80EBD4C);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 7:
  sub_80EED2C(0x2);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 8:
  if (gPaletteFade.active) return;
  sub_80EBDBC(&sub_80ED858);
  break;
 }
}

void sub_80ED620() {
 u8 var1;
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  sub_80F1E84();
  sub_80F2D04(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (sub_80F1F10()) return;
  sub_80EEFBC(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  if (!(var1 = sub_80EEF34())) {
   BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x0, 0x10, var1);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  }
  break;
 case 3:
  if (gPaletteFade.active) return;
  SetVBlankCallback(((void *)0));
  sub_80EED0C();
  sub_80EF814();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var76aa = (u8)(gPaletteFade.active << 24);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  sub_80F2620();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).varD162 = 0x2;
  sub_80F4BD0();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 6:
  sub_80EFF34();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 7:
  if (sub_80EFF68()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 8:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 9:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 10:
  sub_80F33A8();
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
  SetVBlankCallback(&sub_80EBD4C);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 11:
  sub_80EED2C(0x2);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 12:
  if (gPaletteFade.active) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 13:
  sub_80F2C80(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 14:
  if (sub_80F2CBC(0x1)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 15:
  sub_80F2C80(0x6);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 16:
  if (sub_80F2CBC(0x6)) return;
  sub_80EBDBC(&sub_80ED858);
  break;
 }
}
# 1602 "src/pokenav_before.c"
__attribute__((naked))
void sub_80ED858() {
 asm(".syntax unified\n" "push {r4,r5,lr}\n	sub sp, 0x4\n	ldr r1, _080ED878 @ =gSharedMem\n	movs r2, 0xC1\n	lsls r2, 2\n	adds r0, r1, r2\n	ldrh r0, [r0]\n	adds r5, r1, 0\n	cmp r0, 0xB\n	bls _080ED86E\n	b _080EDB7A\n_080ED86E:\n	lsls r0, 2\n	ldr r1, _080ED87C @ =_080ED880\n	adds r0, r1\n	ldr r0, [r0]\n	mov pc, r0\n	.align 2, 0\n_080ED878: .4byte gSharedMem\n_080ED87C: .4byte _080ED880\n	.align 2, 0\n_080ED880:\n	.4byte _080ED8B0\n	.4byte _080ED8CC\n	.4byte _080ED8EC\n	.4byte _080ED904\n	.4byte _080ED91A\n	.4byte _080EDA68\n	.4byte _080EDA8C\n	.4byte _080EDAA4\n	.4byte _080EDAC0\n	.4byte _080EDAE8\n	.4byte _080EDB7A\n	.4byte _080EDB28\n_080ED8B0:\n	bl sub_80F4F78\n	bl sub_80F5B38\n	ldr r0, _080ED8C8 @ =gSharedMem\n	movs r4, 0xC1\n	lsls r4, 2\n	adds r0, r4\n	movs r1, 0x1\n	strh r1, [r0]\n	b _080EDB7A\n	.align 2, 0\n_080ED8C8: .4byte gSharedMem\n_080ED8CC:\n	bl sub_80F5B50\n	lsls r0, 24\n	cmp r0, 0\n	beq _080ED8D8\n	b _080EDB7A\n_080ED8D8:\n	ldr r0, _080ED8E8 @ =gSharedMem\n	movs r1, 0xC1\n	lsls r1, 2\n	adds r0, r1\n	movs r1, 0x2\n	strh r1, [r0]\n	b _080EDB7A\n	.align 2, 0\n_080ED8E8: .4byte gSharedMem\n_080ED8EC:\n	movs r0, 0x1\n	bl sub_80F0174\n	ldr r0, _080ED900 @ =gSharedMem\n	movs r2, 0xC1\n	lsls r2, 2\n	adds r0, r2\n	movs r1, 0x3\n	strh r1, [r0]\n	b _080EDB7A\n	.align 2, 0\n_080ED900: .4byte gSharedMem\n_080ED904:\n	bl sub_80F4FB4\n	lsls r0, 24\n	cmp r0, 0\n	beq _080ED910\n	b _080EDB7A\n_080ED910:\n	bl sub_80F3C94\n	bl sub_80F3D00\n	b _080EDAD4\n_080ED91A:\n	ldr r2, _080ED960 @ =gMain\n	ldrh r1, [r2, 0x2C]\n	movs r0, 0x40\n	ands r0, r1\n	adds r3, r2, 0\n	cmp r0, 0\n	beq _080ED970\n	ldr r1, _080ED964 @ =0x000087cb\n	adds r0, r5, r1\n	ldrb r0, [r0]\n	cmp r0, 0\n	beq _080ED970\n	ldr r2, _080ED968 @ =0x000076aa\n	adds r0, r5, r2\n	ldrb r0, [r0]\n	cmp r0, 0\n	beq _080ED948\n	ldr r4, _080ED96C @ =0x000087dc\n	adds r0, r5, r4\n	movs r1, 0\n	ldrsh r0, [r0, r1]\n	cmp r0, 0\n	beq _080ED970\n_080ED948:\n	movs r0, 0x5\n	bl PlaySE\n	movs r0, 0x1\n	bl sub_80F5060\n	bl move_anim_execute\n	movs r2, 0xC1\n	lsls r2, 2\n	adds r1, r5, r2\n	b _080ED9B8\n	.align 2, 0\n_080ED960: .4byte gMain\n_080ED964: .4byte 0x000087cb\n_080ED968: .4byte 0x000076aa\n_080ED96C: .4byte 0x000087dc\n_080ED970:\n	ldrh r1, [r3, 0x2C]\n	movs r0, 0x80\n	ands r0, r1\n	cmp r0, 0\n	beq _080ED9CC\n	ldr r4, _080ED9C0 @ =0x000087cb\n	adds r0, r5, r4\n	ldrb r0, [r0]\n	cmp r0, 0\n	beq _080ED9CC\n	ldr r1, _080ED9C4 @ =0x000076aa\n	adds r0, r5, r1\n	ldrb r0, [r0]\n	cmp r0, 0\n	beq _080ED9A2\n	ldr r2, _080ED9C8 @ =0x000087dc\n	adds r0, r5, r2\n	subs r4, 0x57\n	adds r1, r5, r4\n	movs r4, 0\n	ldrsh r2, [r0, r4]\n	movs r4, 0\n	ldrsh r0, [r1, r4]\n	cmp r2, r0\n	bge _080ED9CC\n_080ED9A2:\n	movs r0, 0x5\n	bl PlaySE\n	movs r0, 0\n	bl sub_80F5060\n	bl move_anim_execute\n	movs r0, 0xC1\n	lsls r0, 2\n	adds r1, r5, r0\n_080ED9B8:\n	movs r0, 0x5\n	strh r0, [r1]\n	b _080EDB7A\n	.align 2, 0\n_080ED9C0: .4byte 0x000087cb\n_080ED9C4: .4byte 0x000076aa\n_080ED9C8: .4byte 0x000087dc\n_080ED9CC:\n	ldrh r2, [r3, 0x2E]\n	movs r0, 0x2\n	ands r0, r2\n	cmp r0, 0\n	beq _080ED9F8\n	movs r0, 0x5\n	bl PlaySE\n	bl sub_80F4FDC\n	bl move_anim_execute\n	ldr r0, _080ED9F4 @ =gSharedMem\n	movs r1, 0xC1\n	lsls r1, 2\n	adds r0, r1\n	movs r1, 0x9\n	strh r1, [r0]\n	b _080EDB7A\n	.align 2, 0\n_080ED9F4: .4byte gSharedMem\n_080ED9F8:\n	movs r0, 0x1\n	ands r0, r2\n	cmp r0, 0\n	bne _080EDA02\n	b _080EDB7A\n_080EDA02:\n	adds r4, r5, 0\n	ldr r2, _080EDA38 @ =0x000076aa\n	adds r0, r4, r2\n	ldrb r0, [r0]\n	cmp r0, 0\n	bne _080EDA44\n	ldr r1, _080EDA3C @ =0x000087dc\n	adds r0, r4, r1\n	movs r2, 0\n	ldrsh r1, [r0, r2]\n	ldr r2, _080EDA40 @ =0x000087da\n	adds r0, r4, r2\n	movs r2, 0\n	ldrsh r0, [r0, r2]\n	subs r0, 0x1\n	cmp r1, r0\n	beq _080EDA26\n	b _080EDB7A\n_080EDA26:\n	movs r0, 0x5\n	bl PlaySE\n	movs r0, 0xC1\n	lsls r0, 2\n	adds r1, r4, r0\n	movs r0, 0x9\n	strh r0, [r1]\n	b _080EDB7A\n	.align 2, 0\n_080EDA38: .4byte 0x000076aa\n_080EDA3C: .4byte 0x000087dc\n_080EDA40: .4byte 0x000087da\n_080EDA44:\n	ldr r1, _080EDA64 @ =0x00006dac\n	adds r0, r5, r1\n	ldrb r0, [r0]\n	cmp r0, 0\n	beq _080EDA50\n	b _080EDB7A\n_080EDA50:\n	movs r0, 0x5\n	bl PlaySE\n	movs r2, 0xC1\n	lsls r2, 2\n	adds r1, r5, r2\n	movs r0, 0x7\n	strh r0, [r1]\n	b _080EDB7A\n	.align 2, 0\n_080EDA64: .4byte 0x00006dac\n_080EDA68:\n	bl gpu_sync_bg_show\n	lsls r0, 24\n	cmp r0, 0\n	beq _080EDA74\n	b _080EDB7A\n_080EDA74:\n	bl sub_80F3D00\n	ldr r0, _080EDA88 @ =gSharedMem\n	movs r4, 0xC1\n	lsls r4, 2\n	adds r0, r4\n	movs r1, 0x6\n	strh r1, [r0]\n	b _080EDB7A\n	.align 2, 0\n_080EDA88: .4byte gSharedMem\n_080EDA8C:\n	bl sub_8055870\n	cmp r0, 0\n	bne _080EDB7A\n	ldr r0, _080EDAA0 @ =gSharedMem\n	movs r1, 0xC1\n	lsls r1, 2\n	adds r0, r1\n	b _080EDADC\n	.align 2, 0\n_080EDAA0: .4byte gSharedMem\n_080EDAA4:\n	movs r0, 0x3\n	bl sub_80EEFBC\n	bl sub_80F3668\n	ldr r0, _080EDABC @ =gSharedMem\n	movs r2, 0xC1\n	lsls r2, 2\n	adds r0, r2\n	movs r1, 0x8\n	strh r1, [r0]\n	b _080EDB7A\n	.align 2, 0\n_080EDABC: .4byte gSharedMem\n_080EDAC0:\n	bl sub_80F7500\n	lsls r0, 24\n	cmp r0, 0\n	bne _080EDB7A\n	movs r0, 0x2\n	bl sub_80EEFBC\n	bl sub_80F3698\n_080EDAD4:\n	ldr r0, _080EDAE4 @ =gSharedMem\n	movs r4, 0xC1\n	lsls r4, 2\n	adds r0, r4\n_080EDADC:\n	movs r1, 0x4\n	strh r1, [r0]\n	b _080EDB7A\n	.align 2, 0\n_080EDAE4: .4byte gSharedMem\n_080EDAE8:\n	bl sub_80F5038\n	lsls r0, 24\n	lsrs r4, r0, 24\n	cmp r4, 0\n	bne _080EDB7A\n	movs r0, 0\n	bl sub_80F0174\n	bl sub_80F2F48\n	ldr r5, _080EDB24 @ =gSharedMem\n	movs r1, 0xC2\n	lsls r1, 2\n	adds r0, r5, r1\n	ldr r0, [r0]\n	movs r1, 0x1\n	negs r1, r1\n	str r4, [sp]\n	movs r2, 0\n	movs r3, 0x10\n	bl BeginNormalPaletteFade\n	movs r2, 0xC1\n	lsls r2, 2\n	adds r1, r5, r2\n	movs r0, 0xB\n	strh r0, [r1]\n	b _080EDB7A\n	.align 2, 0\n_080EDB24: .4byte gSharedMem\n_080EDB28:\n	ldr r0, _080EDB60 @ =gPaletteFade\n	ldrb r1, [r0, 0x7]\n	movs r0, 0x80\n	ands r0, r1\n	cmp r0, 0\n	bne _080EDB7A\n	bl sub_80F3CE8\n	bl sub_80F5BDC\n	ldr r0, _080EDB64 @ =gSharedMem\n	ldr r4, _080EDB68 @ =0x000076aa\n	adds r0, r4\n	ldrb r0, [r0]\n	cmp r0, 0\n	bne _080EDB70\n	bl sub_80F357C\n	movs r0, 0x1\n	bl sub_80F2D6C\n	movs r0, 0x6\n	bl sub_80F2D6C\n	ldr r0, _080EDB6C @ =sub_80ECA10\n	bl sub_80EBDBC\n	b _080EDB7A\n	.align 2, 0\n_080EDB60: .4byte gPaletteFade\n_080EDB64: .4byte gSharedMem\n_080EDB68: .4byte 0x000076aa\n_080EDB6C: .4byte sub_80ECA10\n_080EDB70:\n	bl sub_80F3614\n	ldr r0, _080EDB84 @ =sub_80ED3D0\n	bl sub_80EBDBC\n_080EDB7A:\n	add sp, 0x4\n	pop {r4,r5}\n	pop {r0}\n	bx r0\n	.align 2, 0\n_080EDB84: .4byte sub_80ED3D0\n" "\n.syntax divided\n")
# 1971 "src/pokenav_before.c"
                                 ;
}


void sub_80EDB88() {
 u8 var1;
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  sub_80F1E84();
  sub_80F2D04(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (sub_80F1F10()) return;
  sub_80EEFBC(0x4);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  if (!(var1 = sub_80EEF34())) {
   BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x0, 0x10, var1);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  }
  break;
 case 3:
  if (gPaletteFade.active) return;
  SetVBlankCallback(0);
  sub_80EED0C();
  sub_80EF814();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  sub_80F2620();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  sub_80F638C();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 6:
  if (!sub_80F63D0()) {
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 += 0x2;
   break;
  }
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 7:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304--;
  break;
 case 8:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 9:
  sub_80F0264(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 10:
  if (sub_80F02A0()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 11:
  sub_80F2C80(0x2);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 12:
  if (sub_80F2CBC(0x2)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 13:
  sub_80F3008(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 14:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 15:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
  SetVBlankCallback(&sub_80EBD18);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 16:
  sub_80EED2C(0x4);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 17:
  if (gPaletteFade.active) return;
  sub_80EBDBC(&sub_80EDDBC);
  break;
 }
}

void sub_80EDDBC() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  switch (sub_80F5DD4()) {
  case 1:
   PlaySE(0x5);
   ShowMapNamePopUpWindow();
   break;
  case 2:
   PlaySE(0x5);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
   break;
  default:
   if (gMain.newKeys & 0x0001) {
    PlaySE(0x5);
    sub_80EBDBC(&sub_80EDEE4);
   }
   else if (gMain.newKeys & 0x0002) {
    PlaySE(0x5);
    sub_80EBDBC(&sub_80EDE70);
   }
   break;
  }
  break;
 case 1:
  if (sub_80F0718()) return;
  ShowMapNamePopUpWindow();
  sub_80F3264();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0;
  break;

 }
}

void sub_80EDE70() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0, 0x10, 0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (gPaletteFade.active) return;
  sub_80F3130();
  sub_80F2D6C(0x2);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  sub_80EBDBC(&sub_80EC00C);
  break;
 }

}

void sub_80EDEE4() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0, 0x10, 0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (gPaletteFade.active) return;
  SetVBlankCallback(((void *)0));
  sub_80EED0C();
  sub_80F3130();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  sub_80F66E0();
  sub_80EEE08();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 3:
  if (sub_80F1080()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  sub_80EEFBC(0x5);
  sub_80F38B8();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 5:
  if (sub_80F38EC()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 6:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 7:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
  SetVBlankCallback(&sub_80EBD18);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 8:
  sub_80EED2C(0x3);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 9:
  if (gPaletteFade.active) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 10:
  if (sub_80F170C()) return;
  sub_80EBDBC(&sub_80EE06C);
  break;
 }
}

void sub_80EE06C() {
 u32 var1;
 u16 var2;
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  sub_80F15A8();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (gMain.newAndRepeatedKeys & 0x40) {
   if ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var87DC) {
    PlaySE(0x5);
    sub_80F6A4C(-1);
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
   }
   else goto label1;
  }
  else goto label1;
  break;
label1:
  if (gMain.newAndRepeatedKeys & 0x80) {
   if ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var87DC < (*(struct UnknownPokenav0*)(gSharedMem + 0)).var8774) {
    PlaySE(0x5);
    sub_80F6A4C(1);
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
   }
   else goto label2;
  }
  else goto label2;
  break;
label2:
  if (gMain.newKeys & 0x0001) {
   PlaySE(0x5);
   sub_80EEFBC(0xB);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0x4;
  }
  else if (gMain.newKeys & 0x0002) {
   PlaySE(0x5);
   sub_80EBDBC(&sub_80EE294);
  }
  break;
 case 2:
  if (sub_80F6AF0()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 3:
  var1 = sub_8055870();
  if (var1) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = var1;
  break;
 case 4:
  sub_80F3B00();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  if (sub_80F3B58()) return;
  sub_80F1494();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  sub_80EED9C();
  break;
 case 6:
  switch (sub_80F68E8()) {
  case 1:
   PlaySE(0x5);
   sub_80F3B94();
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0x7;
   break;
  default:
  case 0:
   if (gMain.newKeys & 0x0002) {
    PlaySE(0x5);
    sub_80F3B94();
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0x8;
   }
   break;
  }
  break;
 case 7:
  if (sub_80F3BD4()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0x4;
  break;
 case 8:
  var2 = sub_80F3BD4();
  if (var2) return;
  sub_80EEFBC(0x5);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = var2;
  break;
 }
}

void sub_80EE294() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0, 0x10, 0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (gPaletteFade.active) return;
  SetVBlankCallback(((void *)0));
  sub_80EED0C();
  sub_80F3C2C();
  sub_80EEE08();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  sub_80F6134();
  sub_80F0264(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 3:
  if (sub_80F02A0()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  sub_80EEFBC(0x4);
  sub_80F3008(0x1);
  SetVBlankCallback(&sub_80EBD18);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 6:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 7:
  sub_80EED2C(0x4);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 8:
  if (gPaletteFade.active) return;
  sub_80EBDBC(&sub_80EDDBC);
  break;
 }
}

void sub_80EE3D8() {
 u8 var1;
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  sub_80F1E84();
  sub_80F2D04(0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (sub_80F1F10()) return;
  sub_80EEFBC(0x9);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  if (!(var1 = sub_80EEF34())) {
   BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x0, 0x10, var1);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  }
  break;
 case 3:
  if (gPaletteFade.active) return;
  SetVBlankCallback(((void *)0));
  sub_80EED0C();
  sub_80EF814();
  sub_80EEE08();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  sub_80F2620();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  sub_80F0264(0x2);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 6:
  if (sub_80F02A0()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 7:
  sub_80F2C80(0x3);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 8:
  if (sub_80F2CBC(0x3)) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 9:
  sub_80F3008(0x2);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 10:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 11:
  sub_80F6F10();
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0x10, 0, 0);
  SetVBlankCallback(&sub_80EBD68);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 12:
  sub_80EED2C(0x5);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 13:
  if (gPaletteFade.active) return;
  sub_80EBDBC(&sub_80EE58C);
  break;
 }
}

void sub_80EE58C() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  switch (sub_80F5DD4()) {
  case 1:
   PlaySE(0x5);
   sub_80F0FFC((*(struct UnknownPokenav0*)(gSharedMem + 0)).var876E);
   break;
  case 2:
   PlaySE(0x5);
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
   break;
  default:
   if (gMain.newKeys & 0x0001) {
    PlaySE(0x5);
    sub_80EBDBC(&sub_80EE658);
   }
   else if (gMain.newKeys & 0x0002) {
    PlaySE(0x5);
    sub_80EBDBC(&sub_80EE8F4);
   }
   break;
  }
  break;
 case 1:
  if (sub_80F0718()) return;
  sub_80F0FFC((*(struct UnknownPokenav0*)(gSharedMem + 0)).var876E);
  sub_80F3264();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0;
  break;
 }
}

void sub_80EE658() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  sub_80F3294(0x1);
  sub_80EEFBC(0xA);
  sub_80F0B24();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (sub_80F0B44()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  sub_80F0F64();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 3:
  if (sub_80F0FEC()) return;
  sub_80F6FB8(0x1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 4:
  sub_80F6DB8();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 5:
  sub_80F700C((u8 *)(gSharedMem + 0x8788), *(u16 *)(gSharedMem + 0x8788 - 0x1A));
  sub_80F42C4((u8 *)(gSharedMem + 0x8788));
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 6:
  sub_80F0CD8();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 case 7:
  if (sub_80F6E9C()) return;
  if (sub_80F0D5C()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 8:
  if (gMain.heldKeys & 0x40) {
   if ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var87DC) {
    PlaySE(0x5);
    sub_80F708C(-1);
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0x10;
   }
   else goto label1;
  }
  else goto label1;
  break;
label1:
  if (gMain.heldKeys & 0x80) {
   if ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var87DC < (*(struct UnknownPokenav0*)(gSharedMem + 0)).var8774) {
    PlaySE(0x5);
    sub_80F708C(1);
    (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0x10;
   }
   else goto label2;
  }
  else goto label2;
  break;
label2:
  if (gMain.newKeys & 0x0002) {
   PlaySE(0x5);
   sub_80F4394();
   sub_80F0EC0();
   (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  }
  break;
 case 9:
  if (sub_80F6ED4()) return;
  if (sub_80F0EF4()) return;
  sub_80F6FB8(0);
  sub_80F2FB0();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 10:
  sub_80F6134();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 11:
  sub_80F0FA0();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 12:
  if (sub_80F0FEC()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 13:
  sub_80F0C28();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 14:
  if (sub_80F0C48()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 15:
  sub_80EEFBC(0x9);
  sub_80F3294(0);
  sub_80EBDBC(&sub_80EE58C);
  sub_80EED9C();
  break;
 case 16:
  if (sub_80F70FC()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 17:
  if (sub_8055870()) return;
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304 = 0x8;
  break;
 }
}

void sub_80EE8F4() {
 switch ((*(struct UnknownPokenav0*)(gSharedMem + 0)).var304) {
 case 0:
  BeginNormalPaletteFade((*(struct UnknownPokenav0*)(gSharedMem + 0)).var308, -1, 0, 0x10, 0);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 1:
  if (gPaletteFade.active) return;
  sub_80F3130();
  sub_80F2D6C(0x2);
  sub_80F6FFC();
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
  break;
 case 2:
  sub_80EBDBC(&sub_80EC00C);
  break;
 }
}

void sub_80EE96C() {
 u16 var1 = (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304;
 if (!var1) {
  PlaySE(0x6F);
  BeginNormalPaletteFade(-1, 0, 0, 0x10, var1);
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var304++;
 }
 else {
  if (gPaletteFade.active) return;
  sub_80F5BDC();
  sub_805469C();
 }
}

void sub_80EE9C0(u8 param1, u8 param2, u8 param3) {
 sub_80F1E84();
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6e14 = param1;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6e15 = param2;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6e16 = 0;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var6e17 = param3;
}
# 2593 "src/pokenav_before.c"
__attribute__((naked))
bool8 sub_80EEA0C() {
 asm(".syntax unified\n" "push {r4,lr}\n	ldr r1, _080EEA28 @ =gSharedMem\n	ldr r2, _080EEA2C @ =0x00006e16\n	adds r0, r1, r2\n	ldrb r0, [r0]\n	adds r3, r1, 0\n	cmp r0, 0x8\n	bls _080EEA1E\n	b _080EEBFA\n_080EEA1E:\n	lsls r0, 2\n	ldr r1, _080EEA30 @ =_080EEA34\n	adds r0, r1\n	ldr r0, [r0]\n	mov pc, r0\n	.align 2, 0\n_080EEA28: .4byte gSharedMem\n_080EEA2C: .4byte 0x00006e16\n_080EEA30: .4byte _080EEA34\n	.align 2, 0\n_080EEA34:\n	.4byte _080EEA58\n	.4byte _080EEA98\n	.4byte _080EEAAE\n	.4byte _080EEAD4\n	.4byte _080EEB3E\n	.4byte _080EEB68\n	.4byte _080EEB88\n	.4byte _080EEBAC\n	.4byte _080EEBE4\n_080EEA58:\n	bl sub_80F1F10\n	lsls r0, 24\n	cmp r0, 0\n	beq _080EEA64\n	b _080EEC08\n_080EEA64:\n	ldr r1, _080EEA7C @ =gSharedMem\n	ldr r4, _080EEA80 @ =0x00006e17\n	adds r0, r1, r4\n	ldrb r0, [r0]\n	cmp r0, 0xC\n	beq _080EEA88\n	ldr r0, _080EEA84 @ =0x00006e16\n	adds r1, r0\n	movs r0, 0x1\n	strb r0, [r1]\n	b _080EEC08\n	.align 2, 0\n_080EEA7C: .4byte gSharedMem\n_080EEA80: .4byte 0x00006e17\n_080EEA84: .4byte 0x00006e16\n_080EEA88:\n	ldr r2, _080EEA94 @ =0x00006e16\n	adds r1, r2\n	movs r0, 0x3\n	strb r0, [r1]\n	b _080EEC08\n	.align 2, 0\n_080EEA94: .4byte 0x00006e16\n_080EEA98:\n	ldr r4, _080EEAC8 @ =gSharedMem\n	ldr r1, _080EEACC @ =0x00006e17\n	adds r0, r4, r1\n	ldrb r0, [r0]\n	bl sub_80F2C80\n	ldr r2, _080EEAD0 @ =0x00006e16\n	adds r4, r2\n	ldrb r0, [r4]\n	adds r0, 0x1\n	strb r0, [r4]\n_080EEAAE:\n	ldr r4, _080EEAC8 @ =gSharedMem\n	ldr r1, _080EEACC @ =0x00006e17\n	adds r0, r4, r1\n	ldrb r0, [r0]\n	bl sub_80F2CBC\n	lsls r0, 24\n	cmp r0, 0\n	beq _080EEAC2\n	b _080EEC08\n_080EEAC2:\n	ldr r2, _080EEAD0 @ =0x00006e16\n	adds r1, r4, r2\n	b _080EEB76\n	.align 2, 0\n_080EEAC8: .4byte gSharedMem\n_080EEACC: .4byte 0x00006e17\n_080EEAD0: .4byte 0x00006e16\n_080EEAD4:\n	adds r2, r3, 0\n	ldr r4, _080EEAF8 @ =0x00006e15\n	adds r0, r2, r4\n	ldrb r1, [r0]\n	subs r4, 0x68\n	adds r0, r2, r4\n	strb r1, [r0]\n	ldr r1, _080EEAFC @ =0x00006e14\n	adds r0, r2, r1\n	ldrb r0, [r0]\n	cmp r0, 0x1\n	beq _080EEB14\n	cmp r0, 0x1\n	bgt _080EEB00\n	cmp r0, 0\n	beq _080EEB06\n	b _080EEB28\n	.align 2, 0\n_080EEAF8: .4byte 0x00006e15\n_080EEAFC: .4byte 0x00006e14\n_080EEB00:\n	cmp r0, 0x2\n	beq _080EEB20\n	b _080EEB28\n_080EEB06:\n	ldr r4, _080EEB10 @ =0x00006dae\n	adds r1, r2, r4\n	movs r0, 0x5\n	b _080EEB26\n	.align 2, 0\n_080EEB10: .4byte 0x00006dae\n_080EEB14:\n	ldr r0, _080EEB1C @ =0x00006dae\n	adds r1, r2, r0\n	movs r0, 0x3\n	b _080EEB26\n	.align 2, 0\n_080EEB1C: .4byte 0x00006dae\n_080EEB20:\n	ldr r2, _080EEB58 @ =0x00006dae\n	adds r1, r3, r2\n	movs r0, 0x6\n_080EEB26:\n	strb r0, [r1]\n_080EEB28:\n	ldr r4, _080EEB5C @ =gSharedMem\n	ldr r1, _080EEB60 @ =0x00006e14\n	adds r0, r4, r1\n	ldrb r0, [r0]\n	bl sub_80F1B8C\n	ldr r2, _080EEB64 @ =0x00006e16\n	adds r4, r2\n	ldrb r0, [r4]\n	adds r0, 0x1\n	strb r0, [r4]\n_080EEB3E:\n	ldr r4, _080EEB5C @ =gSharedMem\n	ldr r1, _080EEB60 @ =0x00006e14\n	adds r0, r4, r1\n	ldrb r0, [r0]\n	bl sub_80F1BC8\n	lsls r0, 24\n	cmp r0, 0\n	bne _080EEC08\n	ldr r2, _080EEB64 @ =0x00006e16\n	adds r1, r4, r2\n	b _080EEB76\n	.align 2, 0\n_080EEB58: .4byte 0x00006dae\n_080EEB5C: .4byte gSharedMem\n_080EEB60: .4byte 0x00006e14\n_080EEB64: .4byte 0x00006e16\n_080EEB68:\n	bl sub_8055870\n	cmp r0, 0\n	bne _080EEC08\n	ldr r1, _080EEB80 @ =gSharedMem\n	ldr r4, _080EEB84 @ =0x00006e16\n	adds r1, r4\n_080EEB76:\n	ldrb r0, [r1]\n	adds r0, 0x1\n	strb r0, [r1]\n	b _080EEC08\n	.align 2, 0\n_080EEB80: .4byte gSharedMem\n_080EEB84: .4byte 0x00006e16\n_080EEB88:\n	bl sub_80F1DF0\n	ldr r4, _080EEBA0 @ =gSharedMem\n	ldr r1, _080EEBA4 @ =0x00006e14\n	adds r0, r4, r1\n	ldrb r0, [r0]\n	bl sub_80EF490\n	ldr r2, _080EEBA8 @ =0x00006e16\n	adds r4, r2\n	b _080EEBCC\n	.align 2, 0\n_080EEBA0: .4byte gSharedMem\n_080EEBA4: .4byte 0x00006e14\n_080EEBA8: .4byte 0x00006e16\n_080EEBAC:\n	bl sub_80F1E50\n	lsls r0, 24\n	cmp r0, 0\n	bne _080EEC08\n	ldr r4, _080EEBD4 @ =gSharedMem\n	ldr r1, _080EEBD8 @ =0x00006e14\n	adds r0, r4, r1\n	ldrb r0, [r0]\n	ldr r2, _080EEBDC @ =0x00006dad\n	adds r1, r4, r2\n	ldrb r1, [r1]\n	bl sub_80EF428\n	ldr r0, _080EEBE0 @ =0x00006e16\n	adds r4, r0\n_080EEBCC:\n	ldrb r0, [r4]\n	adds r0, 0x1\n	strb r0, [r4]\n	b _080EEC08\n	.align 2, 0\n_080EEBD4: .4byte gSharedMem\n_080EEBD8: .4byte 0x00006e14\n_080EEBDC: .4byte 0x00006dad\n_080EEBE0: .4byte 0x00006e16\n_080EEBE4:\n	bl sub_80EF4F8\n	lsls r0, 24\n	cmp r0, 0\n	bne _080EEC08\n	ldr r1, _080EEC00 @ =gSharedMem\n	ldr r2, _080EEC04 @ =0x00006e16\n	adds r1, r2\n	ldrb r0, [r1]\n	adds r0, 0x1\n	strb r0, [r1]\n_080EEBFA:\n	movs r0, 0\n	b _080EEC0A\n	.align 2, 0\n_080EEC00: .4byte gSharedMem\n_080EEC04: .4byte 0x00006e16\n_080EEC08:\n	movs r0, 0x1\n_080EEC0A:\n	pop {r4}\n	pop {r1}\n	bx r1\n" "\n.syntax divided\n")
# 2836 "src/pokenav_before.c"
  ;
}



bool8 sub_80EEC10() {
 if (gMain.newKeys & 0x40) {
  do {
   if (--(*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dad < 0) {
    (*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dad = (*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dae - 1;
   }

  } while (!(*(struct UnknownPokenav0*)(gSharedMem + 0)).var6db2[(*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dad]);
  return 1;
 }
 if (gMain.newKeys & 0x80) {
  do {
   if (++(*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dad >= (*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dae) {
    (*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dad = 0;
   }
  } while (!(*(struct UnknownPokenav0*)(gSharedMem + 0)).var6db2[(*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dad]);
  return 1;
 }
 return 0;
}

bool8 sub_80EEC90() {
 if (gMain.newKeys & 0x40) {
  if (--(*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dad < 0) {
   (*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dad = (*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dae - 1;
  }
  return 1;
 }
 if (gMain.newKeys & 0x80) {
  if (++(*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dad >= (*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dae) {
   (*(struct UnknownPokenav0_1*)(gSharedMem + 0)).var6dad = 0;
  }
  return 1;
 }
 return 0;
}

void sub_80EED0C() {
 (*(vu16 *)(0x4000000 + 0x0)) = 512;
}

void sub_80EED1C() {
 (*(vu16 *)(0x4000000 + 0x0)) = 0x92 << 5;
}

void sub_80EED2C(u8 param1) {
 switch (param1) {
 case 0:
  (*(vu16 *)(0x4000000 + 0x0)) = 0xFA << 5;
  break;
 case 1:
  (*(vu16 *)(0x4000000 + 0x0)) = 0x1741;
  break;
 case 3:
 case 4:
  (*(vu16 *)(0x4000000 + 0x0)) = 0xFA << 5;
  break;
 case 2:
  (*(vu16 *)(0x4000000 + 0x0)) = 0x7b40;
  break;
 case 5:
  (*(vu16 *)(0x4000000 + 0x0)) = 0xFD << 6;
  break;
 }
}

void sub_80EED9C(void) {
 gUnknown_03000744 = (*(struct UnknownPokenav0*)(gSharedMem + 0)).var300;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var300 = &sub_80EEDC4;
 (*(struct UnknownPokenav0*)(gSharedMem + 0)).var300();
}

void sub_80EEDC4(void) {
 if (sub_8055870() != 0x1) {
  (*(struct UnknownPokenav0*)(gSharedMem + 0)).var300 = gUnknown_03000744;
 }
}

void sub_80EEDE8(void) {
 (*(vu16 *)(0x4000000 + 0x10)) = 0;
 (*(vu16 *)(0x4000000 + 0x12)) = 0;
 (*(vu16 *)(0x4000000 + 0x1a)) = 0;
 (*(vu16 *)(0x4000000 + 0x18)) = 0;
 (*(vu16 *)(0x4000000 + 0x1c)) = 0;
 (*(vu16 *)(0x4000000 + 0x1e)) = 0;
}

void sub_80EEE08(void) {
 gUnknown_083DFEC4->unkD160 = 0;
}

void sub_80EEE20(void) {
 gUnknown_083DFEC4->unkD160 = 0;
 if (!gUnknown_083DFEC4->unk6DAC) {
  while (sub_80EEE54());
 }
}

bool8 sub_80EEE54(void) {
 switch (gUnknown_083DFEC4->unkD160) {
 case 0:
  LZ77UnCompVram(gPokenavHoennMapMisc_Gfx, (void *)0x6000000 + 0xC000);
  break;
 case 1:
  LZ77UnCompVram(gUnknown_08E99FB0, (void *)0x6000000 + 0xD800);
  break;
 case 2:
  LoadPalette(gPokenavHoennMap1_Pal, 0x10, 0x20);
  break;
 case 3:
  sub_80EF58C(0);
  sub_80EF58C(1);
  sub_80EF58C(2);
  break;
 case 4:
  gUnknown_083DFEC4->unk030C.unk030C.unk0 = 0;
  (*(vu16 *)(0x4000000 + 0x14)) = 0;
  (*(vu16 *)(0x4000000 + 0x16)) = 0;
  (*(vu16 *)(0x4000000 + 0xa)) = 0x1B0C;
  gUnknown_083DFEC4->unkD160++;
 default:
  return 0;
 }
 gUnknown_083DFEC4->unkD160++;
 return 1;
}

bool8 sub_80EEF34(void) {
 bool8 retVal = 1;

 if (gUnknown_083DFEC4->unk030C.unk030C.unk0 == 32)
 {
  return 0;
 }

 gUnknown_083DFEC4->unk030C.unk030C.unk0 += 2;
 if (gUnknown_083DFEC4->unk030C.unk030C.unk0 > 31)
 {
  gUnknown_083DFEC4->unk030C.unk030C.unk0 = 32;
  retVal = 0;
 }

 (*(vu16 *)(0x4000000 + 0x16)) = gUnknown_083DFEC4->unk030C.unk030C.unk0;
 return retVal;
}

bool8 sub_80EEF78(void)
{
 bool8 retVal = 1;

 if (gUnknown_083DFEC4->unk030C.unk030C.unk0 == 0)
 {
  return 0;
 }

 gUnknown_083DFEC4->unk030C.unk030C.unk0 -= 2;
 if (gUnknown_083DFEC4->unk030C.unk030C.unk0 <= 0)
 {
  gUnknown_083DFEC4->unk030C.unk030C.unk0 = 0;
  retVal = 0;
 }

 (*(vu16 *)(0x4000000 + 0x16)) = gUnknown_083DFEC4->unk030C.unk030C.unk0;
 return retVal;
}

void sub_80EEFBC(u8 a)
{
 u8 var1;

 sub_809D104((void *)0x6000000 + 0xD800, 0, 22, gUnknown_08E9A100, 0, 0, 17, 2);

 switch (a)
 {
 case 0:
  sub_809D104((void *)0x6000000 + 0xD800, 0, 22, gUnknown_08E9A100, 17, 0, 10, 2);
  sub_809D104((void *)0x6000000 + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
  break;
 case 11:
  sub_809D104((void *)0x6000000 + 0xD800, 8, 22, gUnknown_08E9A100, 0, 6, 7, 2);
  break;
 case 2:
  var1 = gUnknown_083DFEC4->unk6DAC;
  if (!var1)
  {
   sub_809D104((void *)0x6000000 + 0xD800, 0, 22, gUnknown_08E9A100, 10, 2, 10, 2);
   sub_809D104((void *)0x6000000 + 0xD800, 10, 22, gUnknown_08E9A100, var1, 6, 7, 2);
  }
  else
  {
   sub_809D104((void *)0x6000000 + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
  }
  break;
 case 3:
  sub_809D104((void *)0x6000000 + 0xD800, 0, 22, gUnknown_08E9A100, 0, 4, 10, 2);
  sub_809D104((void *)0x6000000 + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
  break;
 case 4:
  sub_809D104((void *)0x6000000 + 0xD800, 0, 22, gUnknown_08E9A100, 20, 2, 10, 2);
  sub_809D104((void *)0x6000000 + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
  break;
 case 7:
  sub_809D104((void *)0x6000000 + 0xD800, 0, 22, gUnknown_08E9A100, 10, 4, 10, 2);
  sub_809D104((void *)0x6000000 + 0xD800, 7, 22, gUnknown_08E9A100, 0, 6, 7, 2);
  break;
 case 8:
  sub_809D104((void *)0x6000000 + 0xD800, 0, 22, gUnknown_08E9A100, 20, 4, 10, 2);
  sub_809D104((void *)0x6000000 + 0xD800, 7, 22, gUnknown_08E9A100, 0, 6, 7, 2);
  break;
 case 5:
 case 9:
  sub_809D104((void *)0x6000000 + 0xD800, 0, 22, gUnknown_08E9A100, 0, 2, 10, 2);
  sub_809D104((void *)0x6000000 + 0xD800, 8, 22, gUnknown_08E9A100, 0, 6, 7, 2);
  break;
 case 10:
  sub_809D104((void *)0x6000000 + 0xD800, 8, 22, gUnknown_08E9A100, 0, 6, 7, 2);
  break;
 }
}

void sub_80EF248(u8 a)
{
 gUnknown_083DFEC4->unkD160 = 0;

 if (!gUnknown_083DFEC4->unk6DAC)
 {
  while (sub_80EF284(a));
 }
}

bool8 sub_80EF284(u8 a)
{
 switch (gUnknown_083DFEC4->unkD160)
 {
 case 0:
  sub_80EEDE8();
  break;
 case 1:
  SetUpWindowConfig(&gWindowConfig_81E7224);
  break;
 case 2:
  MultistepInitMenuWindowBegin(&gWindowConfig_81E7224);
  break;
 case 3:
  if (!MultistepInitMenuWindowContinue())
  {
   return 1;
  }
  break;
 case 4:
  { const void *_src = gUnknown_083DFEEC; void *_dest = (void *)0x6000000 + 0x5000; u32 _size = 0xA0; { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; };
  break;
 case 5:
  LZ77UnCompVram(gUnknown_083DFF8C, (void *)0x6000000 + 0xF800);
  break;
 case 6:
  { const void *_src = gUnknown_083E005C; void *_dest = (void *)0x6000000 + 0x8000; u32 _size = 0x20; { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(_src); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; };
  break;
 case 7:
  LZ77UnCompVram(gUnknown_083E007C, (void *)0x6000000 + 0xE000);
  break;
 case 8:
  LZ77UnCompVram(gPokenavOutlineTilemap, (void *)0x6000000 + 0xE800);
  break;
 case 9:
  LZ77UnCompVram(gPokenavOutlineTiles, (void *)0x6000000 + 0x8020);
  break;
 case 10:
  sub_80EF54C(a);
  LoadPalette(gUnknown_083DFECC, 0xF0, 0x20);
  LoadPalette(gPokenavOutlinePalette, 0x40, 0x20);
  sub_80EF7D4();
  break;
 case 11:
  (*(vu16 *)(0x4000000 + 0x8)) = 0x1F01;
  (*(vu16 *)(0x4000000 + 0xc)) = 0x1D0A;
  (*(vu16 *)(0x4000000 + 0xe)) = 0x1C0B;
  (*(vu16 *)(0x4000000 + 0x50)) = 0;

  gUnknown_083DFEC4->unkD160++;
  return 0;
 default:
  return 0;
 }

 gUnknown_083DFEC4->unkD160++;
 return 1;
}

void sub_80EF428(u8 a, u8 b)
{
 u8 *tileBuffer;
 const u8 *pcText = 0;

 switch (a)
 {
 case 0:
  pcText = gUnknown_083E31B0[b];
  break;
 case 1:
  pcText = gUnknown_083E31CC[b];
  break;
 case 2:
  pcText = gUnknown_083E31D8[b];
  break;
 }

 tileBuffer = gUnknown_083DFEC8;
 sub_8072C74(&tileBuffer[0x800], pcText, 0xC0, 2);
 MenuPrint(&tileBuffer[0x800], 3, 17);
}

void sub_80EF490(u8 a)
{
 u16 var1, var2;

 if (a == 2)
 {
  a = 1;
 }

 gUnknown_083DFEC4->unkCE4E = a * 30;
 var1 = gUnknown_083DFEC4->unkCE4C;
 var2 = a * 30;
 if (var1 < var2)
 {
  gUnknown_083DFEC4->unkCE50 = 2;
 }
 else if (var1 > var2)
 {
  gUnknown_083DFEC4->unkCE50 = -2;
 }
 else
 {
  gUnknown_083DFEC4->unkCE50 = 0;
 }
}

bool8 sub_80EF4F8(void)
{
 u16 *palettes;

 if (gUnknown_083DFEC4->unkCE4C == gUnknown_083DFEC4->unkCE4E)
 {
  return 0;
 }
 else
 {
  gUnknown_083DFEC4->unkCE4C = gUnknown_083DFEC4->unkCE50 + gUnknown_083DFEC4->unkCE4C;

  palettes = gUnknown_083DFEC4->palettesCE52;
  LoadPalette(&palettes[gUnknown_083DFEC4->unkCE4C], 0x31, 4);
  return 1;
 }

}

void sub_80EF54C(u8 a)
{
 if (a == 2)
 {
  a = 1;
 }

 gUnknown_083DFEC4->unkCE4C = a * 30;
 LoadPalette(&gUnknown_083DFEC4->palettesCE52[gUnknown_083DFEC4->unkCE4C], 0x31, 4);
}

void sub_80EF58C(u8 a)
{
 u16 i;
 u16 * palettes;
 const u16 *var1;

 switch (a)
 {
 case 0:
  for (i = 0; i < 62; i++)
  {
   gUnknown_083DFEC4->palettesCE52[i] = 0;
  }
  break;
 case 1:
  palettes = gUnknown_083DFEC4->palettesCE52;
  var1 = gUnknown_083E003C;
  sub_80EF624(&var1[1], &var1[3], 16, 2, palettes);
  break;
 case 2:
  palettes = gUnknown_083DFEC4->palettesCE8E;
  var1 = gUnknown_083E003C;
  sub_80EF624(&var1[3], &var1[7], 16, 2, palettes);
  break;
 }
}
# 3279 "src/pokenav_before.c"
__attribute__((naked))
void sub_80EF624(const u16 *a, const u16 *b, u8 c, u8 d, u16 *palettes)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r10\n    mov r6, r9\n    mov r5, r8\n    push {r5-r7}\n    sub sp, 0x38\n    str r0, [sp]\n    str r1, [sp, 0x4]\n    ldr r4, [sp, 0x58]\n    lsls r2, 24\n    lsrs r2, 24\n    str r2, [sp, 0x8]\n    lsls r3, 24\n    lsrs r3, 24\n    str r3, [sp, 0xC]\n    movs r0, 0\n    str r0, [sp, 0x10]\n    lsls r0, r3, 16\n    ldr r1, [sp, 0x10]\n    cmp r1, r3\n    bcs _080EF72E\n    subs r2, 0x1\n    str r2, [sp, 0x20]\n    str r0, [sp, 0x2C]\n_080EF654:\n    ldr r2, [sp]\n    ldrh r1, [r2]\n    movs r0, 0x1F\n    ands r0, r1\n    lsls r7, r0, 8\n    lsls r1, 16\n    lsrs r0, r1, 21\n    movs r2, 0x1F\n    ands r0, r2\n    lsls r6, r0, 8\n    lsrs r1, 26\n    ands r1, r2\n    lsls r5, r1, 8\n    ldr r0, [sp, 0x4]\n    ldrh r1, [r0]\n    movs r0, 0x1F\n    ands r0, r1\n    lsls r0, 8\n    str r0, [sp, 0x14]\n    lsls r1, 16\n    lsrs r0, r1, 21\n    ands r0, r2\n    lsls r0, 8\n    str r0, [sp, 0x18]\n    lsrs r1, 26\n    ands r1, r2\n    lsls r1, 8\n    str r1, [sp, 0x1C]\n    ldr r1, [sp, 0x14]\n    subs r0, r1, r7\n    ldr r1, [sp, 0x8]\n    bl __divsi3\n    mov r10, r0\n    ldr r2, [sp, 0x18]\n    subs r0, r2, r6\n    ldr r1, [sp, 0x8]\n    bl __divsi3\n    mov r9, r0\n    ldr r1, [sp, 0x1C]\n    subs r0, r1, r5\n    ldr r1, [sp, 0x8]\n    bl __divsi3\n    mov r8, r0\n    adds r3, r4, 0\n    movs r4, 0\n    ldr r2, [sp]\n    adds r2, 0x2\n    str r2, [sp, 0x30]\n    ldr r0, [sp, 0x4]\n    adds r0, 0x2\n    str r0, [sp, 0x34]\n    adds r1, r3, 0x2\n    str r1, [sp, 0x24]\n    ldr r2, [sp, 0x10]\n    adds r2, 0x1\n    str r2, [sp, 0x28]\n    ldr r0, [sp, 0x20]\n    cmp r4, r0\n    bge _080EF700\n    ldr r1, [sp, 0xC]\n    lsls r1, 1\n    mov r12, r1\n_080EF6D6:\n    lsls r0, r7, 8\n    lsrs r2, r0, 16\n    lsls r0, r6, 8\n    lsrs r1, r0, 16\n    lsls r0, r5, 8\n    lsrs r0, 16\n    lsls r0, 10\n    lsls r1, 5\n    orrs r0, r1\n    orrs r2, r0\n    strh r2, [r3]\n    add r3, r12\n    add r7, r10\n    add r6, r9\n    add r5, r8\n    adds r0, r4, 0x1\n    lsls r0, 16\n    lsrs r4, r0, 16\n    ldr r2, [sp, 0x20]\n    cmp r4, r2\n    blt _080EF6D6\n_080EF700:\n    ldr r4, [sp, 0x14]\n    lsrs r2, r4, 8\n    ldr r1, [sp, 0x1C]\n    lsls r0, r1, 2\n    ldr r4, [sp, 0x18]\n    lsrs r1, r4, 3\n    orrs r0, r1\n    orrs r2, r0\n    strh r2, [r3]\n    ldr r0, [sp, 0x30]\n    str r0, [sp]\n    ldr r1, [sp, 0x34]\n    str r1, [sp, 0x4]\n    ldr r4, [sp, 0x24]\n    ldr r2, [sp, 0x28]\n    lsls r0, r2, 16\n    lsrs r0, 16\n    str r0, [sp, 0x10]\n    ldr r1, [sp, 0x2C]\n    lsrs r0, r1, 16\n    ldr r2, [sp, 0x10]\n    cmp r2, r0\n    bcc _080EF654\n_080EF72E:\n    add sp, 0x38\n    pop {r3-r5}\n    mov r8, r3\n    mov r9, r4\n    mov r10, r5\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .syntax divided\n");
# 3426 "src/pokenav_before.c"
}


void sub_80EF740(void)
{
 gUnknown_083DFEC4->unk6DA0 = (gUnknown_083DFEC4->unk6DA0 + 1) & 1;
 if (gUnknown_083DFEC4->unk6DA0)
 {
  gUnknown_083DFEC4->unk6DA2++;
 }

 (*(vu16 *)(0x4000000 + 0x1c)) = gUnknown_083DFEC4->unk6DA2;
}

void sub_80EF780(u8 taskId)
{
 if (gTasks[taskId].data[0] == 0 || (gUnknown_083DFEC4->unk6DA2 & 0x7) != 0)
 {
  sub_80EF740();
 }
 else
 {
  u16 value = gUnknown_083DFEC4->unk6DA2 & 0x7;
  gUnknown_083DFEC4->unk6DA2 = value;
  gUnknown_083DFEC4->unk6DA0 = value;
  (*(vu16 *)(0x4000000 + 0x1c)) = value;
 }
}

void sub_80EF7D4(void)
{
 gUnknown_083DFEC4->unk6DA2 = 0;
 gUnknown_083DFEC4->unk6DA0 = 0;
 gUnknown_083DFEC4->taskId6DA4 = CreateTask(sub_80EF780, 80);
}

void sub_80EF814(void)
{
 if (FuncIsActiveTask(sub_80EF780))
 {
  DestroyTask(gUnknown_083DFEC4->taskId6DA4);
 }
}

void sub_80EF840(void)
{
 gUnknown_083DFEC4->unkD160 = 0;

 if (gUnknown_083DFEC4->unk6DAC == 0)
 {
  while (sub_80EF874() != 0);
 }
}
# 3554 "src/pokenav_before.c"
asm(".include \"constants/gba_constants.inc\"\n");

__attribute__((naked))
bool8 sub_80EF874(void)
{
    asm(".syntax unified\n	push {lr}\n	ldr r0, _080EF890 @ =gUnknown_083DFEC4\n	ldr r0, [r0]\n	ldr r1, _080EF894 @ =0x0000d160\n	adds r0, r1\n	ldrh r0, [r0]\n	cmp r0, 0xB\n	bls _080EF886\n	b _080EF9D8\n_080EF886:\n	lsls r0, 2\n	ldr r1, _080EF898 @ =_080EF89C\n	adds r0, r1\n	ldr r0, [r0]\n	mov pc, r0\n	.align 2, 0\n_080EF890: .4byte gUnknown_083DFEC4\n_080EF894: .4byte 0x0000d160\n_080EF898: .4byte _080EF89C\n	.align 2, 0\n_080EF89C:\n	.4byte _080EF8CC\n	.4byte _080EF8D2\n	.4byte _080EF8E0\n	.4byte _080EF8EC\n	.4byte _080EF8F6\n	.4byte _080EF8FC\n	.4byte _080EF920\n	.4byte _080EF92C\n	.4byte _080EF940\n	.4byte _080EF954\n	.4byte _080EF960\n	.4byte _080EF972\n_080EF8CC:\n	bl sub_80EEDE8\n	b _080EF9DC\n_080EF8D2:\n	ldr r0, _080EF8DC @ =gWindowConfig_81E7224\n	bl SetUpWindowConfig\n	b _080EF9DC\n	.align 2, 0\n_080EF8DC: .4byte gWindowConfig_81E7224\n_080EF8E0:\n	ldr r0, _080EF8E8 @ =gWindowConfig_81E7224\n	bl MultistepInitMenuWindowBegin\n	b _080EF9DC\n	.align 2, 0\n_080EF8E8: .4byte gWindowConfig_81E7224\n_080EF8EC:\n	bl MultistepInitMenuWindowContinue\n	cmp r0, 0\n	bne _080EF9DC\n	b _080EF9EA\n_080EF8F6:\n	bl MenuZeroFillScreen\n	b _080EF9DC\n_080EF8FC:\n	ldr r0, _080EF914 @ =gUnknown_083DFEC4\n	ldr r0, [r0]\n	ldr r2, _080EF918 @ =0x00006e18\n	adds r0, r2\n	ldr r1, _080EF91C @ =gSaveBlock2\n	ldrb r1, [r1, 0x15]\n	lsrs r1, 3\n	movs r2, 0x1\n	ands r1, r2\n	bl sub_80FA904\n	b _080EF9DC\n	.align 2, 0\n_080EF914: .4byte gUnknown_083DFEC4\n_080EF918: .4byte 0x00006e18\n_080EF91C: .4byte gSaveBlock2\n_080EF920:\n	bl sub_80FA940\n	lsls r0, 24\n	cmp r0, 0\n	beq _080EF9DC\n	b _080EF9EA\n_080EF92C:\n	ldr r0, _080EF938 @ =gPokenavHoennMapSquares_Gfx\n	ldr r1, _080EF93C @ =0x06005000\n	bl LZ77UnCompVram\n	b _080EF9DC\n	.align 2, 0\n_080EF938: .4byte gPokenavHoennMapSquares_Gfx\n_080EF93C: .4byte 0x06005000\n_080EF940:\n	ldr r0, _080EF950 @ =gPokenavHoennMapSquares_Pal\n	movs r1, 0x30\n	movs r2, 0x20\n	bl LoadPalette\n	bl sub_80EFC3C\n	b _080EF9DC\n	.align 2, 0\n_080EF950: .4byte gPokenavHoennMapSquares_Pal\n_080EF954:\n	bl sub_80EFC64\n	lsls r0, 24\n	cmp r0, 0\n	beq _080EF9DC\n	b _080EF9EA\n_080EF960:\n	movs r0, 0x10\n	movs r1, 0x3\n	movs r2, 0x1D\n	movs r3, 0x11\n	bl MenuDrawTextWindow\n	bl sub_80EF9F8\n	b _080EF9DC\n_080EF972:\n	ldr r0, _080EF990 @ =gUnknown_083DFEC4\n	ldr r1, [r0]\n	ldr r2, _080EF994 @ =0x00006e90\n	adds r0, r1, r2\n	ldrb r0, [r0]\n	cmp r0, 0\n	bne _080EF9A0\n	ldr r2, _080EF998 @ =0x00007698\n	adds r0, r1, r2\n	movs r1, 0xA0\n	strh r1, [r0]\n	ldr r0, _080EF99C @ =REG_BG0VOFS\n	strh r1, [r0]\n	b _080EF9B0\n	.align 2, 0\n_080EF990: .4byte gUnknown_083DFEC4\n_080EF994: .4byte 0x00006e90\n_080EF998: .4byte 0x00007698\n_080EF99C: .4byte REG_BG0VOFS\n_080EF9A0:\n	ldr r0, _080EF9C8 @ =0x00007698\n	adds r1, r0\n	movs r2, 0\n	movs r0, 0x80\n	lsls r0, 1\n	strh r0, [r1]\n	ldr r0, _080EF9CC @ =REG_BG0VOFS\n	strh r2, [r0]\n_080EF9B0:\n	ldr r2, _080EF9D0 @ =REG_BG0CNT\n	ldrh r0, [r2]\n	strh r0, [r2]\n	ldrh r0, [r2]\n	movs r1, 0x1\n	orrs r0, r1\n	strh r0, [r2]\n	ldr r1, _080EF9D4 @ =REG_BLDCNT\n	movs r0, 0\n	strh r0, [r1]\n	b _080EF9DC\n	.align 2, 0\n_080EF9C8: .4byte 0x00007698\n_080EF9CC: .4byte REG_BG0VOFS\n_080EF9D0: .4byte REG_BG0CNT\n_080EF9D4: .4byte REG_BLDCNT\n_080EF9D8:\n	movs r0, 0\n	b _080EF9EC\n_080EF9DC:\n	ldr r0, _080EF9F0 @ =gUnknown_083DFEC4\n	ldr r1, [r0]\n	ldr r2, _080EF9F4 @ =0x0000d160\n	adds r1, r2\n	ldrh r0, [r1]\n	adds r0, 0x1\n	strh r0, [r1]\n_080EF9EA:\n	movs r0, 0x1\n_080EF9EC:\n	pop {r1}\n	bx r1\n	.align 2, 0\n_080EF9F0: .4byte gUnknown_083DFEC4\n_080EF9F4: .4byte 0x0000d160\n    .syntax divided\n");
# 3735 "src/pokenav_before.c"
}
# 3837 "src/pokenav_before.c"
__attribute__((naked))
void sub_80EF9F8(void)
{
    asm(".syntax unified\n    push {r4-r6,lr}\n    sub sp, 0x14\n    movs r5, 0x4\n    ldr r0, _080EFA18 @ =gUnknown_083DFEC4\n    ldr r0, [r0]\n    ldr r1, _080EFA1C @ =0x00006e2e\n    adds r0, r1\n    ldrb r0, [r0]\n    cmp r0, 0x4\n    bls _080EFA0E\n    b _080EFB6A\n_080EFA0E:\n    lsls r0, 2\n    ldr r1, _080EFA20 @ =_080EFA24\n    adds r0, r1\n    ldr r0, [r0]\n    mov pc, r0\n    .align 2, 0\n_080EFA18: .4byte gUnknown_083DFEC4\n_080EFA1C: .4byte 0x00006e2e\n_080EFA20: .4byte _080EFA24\n    .align 2, 0\n_080EFA24:\n    .4byte _080EFB6A\n    .4byte _080EFA38\n    .4byte _080EFAC0\n    .4byte _080EFB4C\n    .4byte _080EFA38\n_080EFA38:\n    ldr r0, _080EFA64 @ =gUnknown_083DFEC4\n    ldr r0, [r0]\n    ldr r2, _080EFA68 @ =0x00006e18\n    adds r0, r2\n    lsls r2, r5, 19\n    lsrs r2, 16\n    movs r1, 0x1\n    str r1, [sp]\n    movs r1, 0x88\n    movs r3, 0x78\n    bl sub_8072A18\n    adds r0, r5, 0x2\n    lsls r0, 16\n    lsrs r5, r0, 16\n    ldr r0, _080EFA6C @ =gLinkOpen\n    ldrb r0, [r0]\n    cmp r0, 0x1\n    bne _080EFA70\n    bl sub_80F1A80\n    b _080EFB82\n    .align 2, 0\n_080EFA64: .4byte gUnknown_083DFEC4\n_080EFA68: .4byte 0x00006e18\n_080EFA6C: .4byte gLinkOpen\n_080EFA70:\n    movs r4, 0\n    b _080EFA92\n_080EFA74:\n    lsls r2, r5, 19\n    lsrs r2, 16\n    movs r0, 0x1\n    str r0, [sp]\n    adds r0, r1, 0\n    movs r1, 0x88\n    movs r3, 0x78\n    bl sub_8072A18\n    adds r0, r5, 0x2\n    lsls r0, 16\n    lsrs r5, r0, 16\n    adds r0, r4, 0x1\n    lsls r0, 16\n    lsrs r4, r0, 16\n_080EFA92:\n    cmp r4, 0x3\n    bhi _080EFB6A\n    ldr r0, _080EFAB8 @ =gUnknown_083DFEC4\n    ldr r1, [r0]\n    ldr r2, _080EFABC @ =0x00006e2c\n    adds r0, r1, r2\n    ldrb r0, [r0]\n    adds r2, 0x3\n    adds r1, r2\n    ldrb r1, [r1]\n    lsls r2, r4, 24\n    lsrs r2, 24\n    bl GetLandmarkName\n    adds r1, r0, 0\n    cmp r1, 0\n    bne _080EFA74\n    b _080EFB6A\n    .align 2, 0\n_080EFAB8: .4byte gUnknown_083DFEC4\n_080EFABC: .4byte 0x00006e2c\n_080EFAC0:\n    ldr r0, _080EFB38 @ =gUnknown_083DFEC4\n    ldr r4, [r0]\n    ldr r1, _080EFB3C @ =0x00006e18\n    adds r0, r4, r1\n    lsls r2, r5, 19\n    lsrs r2, 16\n    movs r1, 0x1\n    str r1, [sp]\n    movs r1, 0x88\n    movs r3, 0x78\n    bl sub_8072A18\n    adds r0, r5, 0x2\n    lsls r0, 16\n    lsrs r5, r0, 16\n    ldr r2, _080EFB40 @ =0x00006e2c\n    adds r0, r4, r2\n    ldrh r1, [r0]\n    adds r2, 0x3\n    adds r0, r4, r2\n    ldrb r0, [r0]\n    lsls r0, 2\n    lsls r1, 3\n    adds r0, r1\n    ldr r1, _080EFB44 @ =0x0000cdcc\n    adds r4, r1\n    adds r6, r4, r0\n    ldr r0, [r6]\n    cmp r0, 0\n    beq _080EFB6A\n    lsls r4, r5, 24\n    lsrs r4, 24\n    movs r0, 0x11\n    adds r1, r4, 0\n    movs r2, 0x1C\n    movs r3, 0xF\n    bl MenuFillWindowRectWithBlankTile\n    movs r0, 0x1A\n    adds r1, r4, 0\n    movs r2, 0x1C\n    movs r3, 0xF\n    bl MenuFillWindowRectWithBlankTile\n    ldr r0, _080EFB48 @ =0x0600f800\n    ldr r3, [r6]\n    movs r1, 0\n    str r1, [sp]\n    str r1, [sp, 0x4]\n    movs r1, 0xA\n    str r1, [sp, 0x8]\n    str r1, [sp, 0xC]\n    str r1, [sp, 0x10]\n    movs r1, 0x12\n    movs r2, 0x6\n    bl sub_8095C8C\n    adds r0, r5, 0\n    adds r0, 0xB\n    b _080EFB66\n    .align 2, 0\n_080EFB38: .4byte gUnknown_083DFEC4\n_080EFB3C: .4byte 0x00006e18\n_080EFB40: .4byte 0x00006e2c\n_080EFB44: .4byte 0x0000cdcc\n_080EFB48: .4byte 0x0600f800\n_080EFB4C:\n    ldr r0, _080EFB98 @ =gUnknown_083DFEC4\n    ldr r0, [r0]\n    ldr r2, _080EFB9C @ =0x00006e18\n    adds r0, r2\n    lsls r2, r5, 19\n    lsrs r2, 16\n    movs r1, 0x1\n    str r1, [sp]\n    movs r1, 0x88\n    movs r3, 0x78\n    bl sub_8072A18\n    adds r0, r5, 0x2\n_080EFB66:\n    lsls r0, 16\n    lsrs r5, r0, 16\n_080EFB6A:\n    movs r0, 0\n    cmp r0, 0\n    bne _080EFB82\n    cmp r5, 0xF\n    bhi _080EFB82\n    lsls r1, r5, 24\n    lsrs r1, 24\n    movs r0, 0x11\n    movs r2, 0x1C\n    movs r3, 0xF\n    bl MenuFillWindowRectWithBlankTile\n_080EFB82:\n    ldr r0, _080EFB98 @ =gUnknown_083DFEC4\n    ldr r0, [r0]\n    ldr r1, _080EFBA0 @ =0x00006e2e\n    adds r0, r1\n    ldrb r0, [r0]\n    cmp r0, 0x2\n    bne _080EFBA4\n    bl sub_80EFD74\n    b _080EFBA8\n    .align 2, 0\n_080EFB98: .4byte gUnknown_083DFEC4\n_080EFB9C: .4byte 0x00006e18\n_080EFBA0: .4byte 0x00006e2e\n_080EFBA4:\n    bl sub_80EFDA0\n_080EFBA8:\n    add sp, 0x14\n    pop {r4-r6}\n    pop {r0}\n    bx r0\n    .syntax divided\n");
# 4046 "src/pokenav_before.c"
}


void sub_80EFBB0(void)
{
 if (!gUnknown_083DFEC4->regionMap.zoomed)
 {
  sub_80EEFBC(8);
 }
 else
 {
  sub_80EEFBC(7);
 }
}

bool8 sub_80EFBDC(bool8 a)
{
 bool8 retVal = 1;
 u16 var1 = gUnknown_083DFEC4->unk7698;

 if (a)
 {
  if (var1 > 168)
  {
   var1 = var1 - 8;
  }
  else
  {
   var1 = 160;
   retVal = 0;
  }
 }
 else
 {
  if (var1 < 248)
  {
   var1 = var1 + 8;
  }
  else
  {
   var1 = 256;
   retVal = 0;
  }
 }

 gUnknown_083DFEC4->unk7698 = var1;
 (*(vu16 *)(0x4000000 + 0x12)) = var1 & 0xFF;

 return retVal;
}

void sub_80EFC3C(void)
{
 gUnknown_083DFEC4->unkBC9A = 0;
 gUnknown_083DFEC4->unkBC9B = 0;
 sub_80EFD3C();
}
# 4140 "src/pokenav_before.c"
__attribute__((naked))
bool8 sub_80EFC64(void)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r9\n    mov r6, r8\n    push {r6,r7}\n    sub sp, 0x8\n    ldr r4, _080EFCD0 @ =gUnknown_083DFEC4\n    ldr r2, [r4]\n    ldr r0, _080EFCD4 @ =0x0000bc9a\n    adds r1, r2, r0\n    ldrb r0, [r1]\n    cmp r0, 0xF\n    bhi _080EFD2C\n    ldrb r1, [r1]\n    mov r8, r1\n    ldr r1, _080EFCD8 @ =0x0000bc9b\n    adds r0, r2, r1\n    ldrb r7, [r0]\n    movs r2, 0\n    ldr r0, _080EFCDC @ =gPokenavCityMaps\n    mov r9, r0\n    adds r3, r4, 0\n_080EFC8E:\n    lsls r0, r2, 2\n    mov r4, r8\n    lsls r1, r4, 3\n    adds r6, r0, r1\n    mov r1, r9\n    adds r0, r6, r1\n    ldr r1, [r0]\n    cmp r1, 0\n    beq _080EFCE8\n    movs r0, 0xC8\n    adds r5, r7, 0\n    muls r5, r0\n    ldr r4, _080EFCE0 @ =0x0000bc9c\n    adds r5, r4\n    ldr r4, [r3]\n    adds r5, r4, r5\n    adds r0, r1, 0\n    adds r1, r5, 0\n    str r2, [sp]\n    str r3, [sp, 0x4]\n    bl LZ77UnCompVram\n    ldr r0, _080EFCE4 @ =0x0000cdcc\n    adds r4, r0\n    adds r4, r6\n    str r5, [r4]\n    adds r0, r7, 0x1\n    lsls r0, 16\n    lsrs r7, r0, 16\n    ldr r2, [sp]\n    ldr r3, [sp, 0x4]\n    b _080EFCF2\n    .align 2, 0\n_080EFCD0: .4byte gUnknown_083DFEC4\n_080EFCD4: .4byte 0x0000bc9a\n_080EFCD8: .4byte 0x0000bc9b\n_080EFCDC: .4byte gPokenavCityMaps\n_080EFCE0: .4byte 0x0000bc9c\n_080EFCE4: .4byte 0x0000cdcc\n_080EFCE8:\n    ldr r0, [r3]\n    ldr r4, _080EFD1C @ =0x0000cdcc\n    adds r0, r4\n    adds r0, r6\n    str r1, [r0]\n_080EFCF2:\n    adds r0, r2, 0x1\n    lsls r0, 16\n    lsrs r2, r0, 16\n    cmp r2, 0x1\n    bls _080EFC8E\n    ldr r0, _080EFD20 @ =gUnknown_083DFEC4\n    ldr r2, [r0]\n    ldr r0, _080EFD24 @ =0x0000bc9a\n    adds r1, r2, r0\n    ldrb r0, [r1]\n    adds r0, 0x1\n    strb r0, [r1]\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0xF\n    bhi _080EFD2C\n    ldr r1, _080EFD28 @ =0x0000bc9b\n    adds r0, r2, r1\n    strb r7, [r0]\n    movs r0, 0x1\n    b _080EFD2E\n    .align 2, 0\n_080EFD1C: .4byte 0x0000cdcc\n_080EFD20: .4byte gUnknown_083DFEC4\n_080EFD24: .4byte 0x0000bc9a\n_080EFD28: .4byte 0x0000bc9b\n_080EFD2C:\n    movs r0, 0\n_080EFD2E:\n    add sp, 0x8\n    pop {r3,r4}\n    mov r8, r3\n    mov r9, r4\n    pop {r4-r7}\n    pop {r1}\n    bx r1\n    .syntax divided\n");
# 4248 "src/pokenav_before.c"
}


void sub_80EFD3C(void)
{
 gUnknown_083DFEC4->unk769E = 0;
 gUnknown_083DFEC4->unk769C = 47;
 gUnknown_083DFEC4->unk769D = 0;
 gUnknown_083DFEC4->unk769A = 0;
}

void sub_80EFD74(void)
{
 gUnknown_083DFEC4->unk769E = 1;

 if (gUnknown_083DFEC4->unk769D == 1)
 {
  gUnknown_083DFEC4->unk769D = 2;
 }
}

void sub_80EFDA0(void)
{
 sub_8095C8C((void *)0x6000000 + 0xF800, 17, 16, gUnknown_08E9AC2C, 0, 0, 12, 1, 15);
 gUnknown_083DFEC4->unk769E = 0;
}

void sub_80EFDE4(u8 param0)
{
 u16 var1 = 60 - gUnknown_083DFEC4->unk769C;

 if (var1 > 12)
 {
  var1 = 12;
 }

 if (gUnknown_083DFEC4->unk769E != 0)
 {
  sub_8095C8C((void *)0x6000000 + 0xF800, 17, 16, gUnknown_08E9ABB4, gUnknown_083DFEC4->unk769C, 0, var1, 1, 60);

  if (var1 < 12)
  {
   u16 var2 = var1 + 17;

   sub_8095C8C((void *)0x6000000 + 0xF800, var2, 16, gUnknown_08E9ABB4, 0, 0, (u16)(12 - var1), 1, 60);
  }
 }
}

void sub_80EFE7C(void)
{
 u16 var1;
 u8 var2 = gUnknown_083DFEC4->unk769D;

 switch (var2)
 {
 case 0:
  var1 = ++gUnknown_083DFEC4->unk769C;

  if (var1 > 59)
  {
   gUnknown_083DFEC4->unk769C = var2;
  }

  sub_80EFDE4(gUnknown_083DFEC4->unk769E);

  switch (gUnknown_083DFEC4->unk769C)
  {
  case 0:
  case 15:
  case 30:
  case 45:
   gUnknown_083DFEC4->unk769D = 1;
   gUnknown_083DFEC4->unk769A = 0;
   break;
  }
  break;
 case 1:
  var1 = ++gUnknown_083DFEC4->unk769A;
  if (var1 > 120)
  {
   gUnknown_083DFEC4->unk769A = 0;
   gUnknown_083DFEC4->unk769D = 0;
  }
  break;
 case 2:
  sub_80EFDE4(1);
  gUnknown_083DFEC4->unk769D = 1;
  break;
 }
}

void sub_80EFF34(void)
{
 gUnknown_083DFEC4->unkD160 = 0;

 if (gUnknown_083DFEC4->unk6DAC == 0)
 {
  while (sub_80EFF68());
 }
}

bool8 sub_80EFF68(void)
{
 switch (gUnknown_083DFEC4->unkD160)
 {
 case 0:
  sub_80EEDE8();
  gUnknown_083DFEC4->unkD162[0] = 11;
  break;
 case 1:
  SetUpWindowConfig(&gWindowConfig_81E7080);
  break;
 case 2:
  MultistepInitMenuWindowBegin(&gWindowConfig_81E7080);
  break;
 case 3:
  if (!MultistepInitMenuWindowContinue())
  {
   return 1;
  }
  break;
 case 4:
  MenuZeroFillScreen();
  break;
 case 5:
  sub_80F1614();
  break;
 case 6:
  if (sub_80F162C(0))
  {
   return 1;
  }
  break;
 case 7:
  LZ77UnCompVram(gPokenavConditionView_Gfx, (void *)0x6000000 + 0x5000);
  break;
 case 8:
  LZ77UnCompVram(gUnknown_08E9AC4C, (void *)0x6000000 + 0xF000);
  LoadPalette(gPokenavConditionMenu2_Pal, 0x20, 0x20);
  break;
 case 9:
  if (gUnknown_083DFEC4->unk76AA == 1)
  {
   sub_8095C8C((void *)0x6000000 + 0xF800, 0, 5, gUnknown_083E01AC, 0, 0, 9, 4, 9);
  }
  break;
 case 10:
  LZ77UnCompVram(gUnknown_08E9FEB4, (void *)0x6000000 + 0xB800);
  break;
 case 11:
  LoadPalette(gUnknown_083E0254, 0x30, 0x20);
  LoadPalette(gUnknownPalette_81E6692, 0xB0, 0x20);
  LoadPalette(&gPokenavConditionMenu2_Pal[2], 0xB1, 0x2);
  LoadPalette(&gPokenavConditionMenu2_Pal[16], 0xB5, 0x2);
  LoadPalette(&gPokenavConditionMenu2_Pal[30], 0xBF, 0x2);
  sub_80F01A4();
  break;
 case 12:
  sub_80F01E0((u16)gUnknown_083DFEC4->unk8fe9);
  break;
 case 13:
  (*(vu16 *)(0x4000000 + 0xe)) = 0x1E03;
  (*(vu16 *)(0x4000000 + 0xc)) = 0x1702;
  (*(vu16 *)(0x4000000 + 0x50)) = 0x844;
  (*(vu16 *)(0x4000000 + 0x52)) = 0x40B;
  break;
 default:
  return 0;
 }

 gUnknown_083DFEC4->unkD160++;
 return 1;
}

void sub_80F0174(bool8 a)
{
 if (a)
 {
  (*(vu16 *)(0x4000000 + 0x0)) |= 0x0400;
 }
 else
 {
  (*(vu16 *)(0x4000000 + 0x0)) &= ~0x0400;
 }
}

void sub_80F01A4(void)
{
 (*(vu16 *)(0x4000000 + 0x40)) = (((0) << 8) | (240));
 (*(vu16 *)(0x4000000 + 0x42)) = (((0) << 8) | (155));
 (*(vu16 *)(0x4000000 + 0x44)) = (((56) << 8) | (121));
 (*(vu16 *)(0x4000000 + 0x46)) = (((56) << 8) | (121));
 (*(vu16 *)(0x4000000 + 0x48)) = 0x3F3F;
 (*(vu16 *)(0x4000000 + 0x4a)) = 0x001B;
}

void sub_80F01E0(u16 a)
{
 MenuPrint(gUnknown_083DFEC4->unk8829[a], 13, 1);

 if (gUnknown_083DFEC4->unk76AA == 1)
 {
  MenuPrint(gUnknown_083DFEC4->unk88E9[a], 13, 3);
  sub_80F443C(gUnknown_083DFEC4->unk8788, gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].unk2);
  MenuPrint(gUnknown_083DFEC4->unk8788, 1, 6);
 }
}

void sub_80F0264(u8 a)
{
 gUnknown_083DFEC4->unk306 = 0;
 gUnknown_083DFEC4->unk87CA = a;

 if (gUnknown_083DFEC4->unk6DAC == 0)
 {
  while (sub_80F02A0());
 }
}
# 4594 "src/pokenav_before.c"
__attribute__((naked))
bool8 sub_80F02A0(void)
{
    asm(".syntax unified\n    push {r4-r6,lr}\n    mov r6, r8\n    push {r6}\n    sub sp, 0x18\n    ldr r1, _080F02C4 @ =gUnknown_083DFEC4\n    ldr r0, [r1]\n    ldr r2, _080F02C8 @ =0x00000306\n    adds r0, r2\n    ldrh r0, [r0]\n    adds r2, r1, 0\n    cmp r0, 0xE\n    bls _080F02BA\n    b _080F05FA\n_080F02BA:\n    lsls r0, 2\n    ldr r1, _080F02CC @ =_080F02D0\n    adds r0, r1\n    ldr r0, [r0]\n    mov pc, r0\n    .align 2, 0\n_080F02C4: .4byte gUnknown_083DFEC4\n_080F02C8: .4byte 0x00000306\n_080F02CC: .4byte _080F02D0\n    .align 2, 0\n_080F02D0:\n    .4byte _080F030C\n    .4byte _080F0344\n    .4byte _080F0350\n    .4byte _080F035C\n    .4byte _080F0368\n    .4byte _080F036E\n    .4byte _080F0380\n    .4byte _080F0394\n    .4byte _080F04BC\n    .4byte _080F053C\n    .4byte _080F0550\n    .4byte _080F0574\n    .4byte _080F057A\n    .4byte _080F0586\n    .4byte _080F05BC\n_080F030C:\n    bl sub_80EEDE8\n    ldr r0, _080F0334 @ =gUnknown_083DFEC4\n    ldr r1, [r0]\n    movs r2, 0\n    ldr r3, _080F0338 @ =0x000087ca\n    adds r0, r1, r3\n    ldrb r0, [r0]\n    cmp r0, 0x1\n    bne _080F0322\n    movs r2, 0x1\n_080F0322:\n    ldr r3, _080F033C @ =0x000087c8\n    adds r0, r1, r3\n    strb r2, [r0]\n    ldr r0, _080F0340 @ =0x0000d162\n    adds r1, r0\n    movs r0, 0xB\n    strb r0, [r1]\n    b _080F0618\n    .align 2, 0\n_080F0334: .4byte gUnknown_083DFEC4\n_080F0338: .4byte 0x000087ca\n_080F033C: .4byte 0x000087c8\n_080F0340: .4byte 0x0000d162\n_080F0344:\n    ldr r0, _080F034C @ =gWindowConfig_81E70D4\n    bl SetUpWindowConfig\n    b _080F0618\n    .align 2, 0\n_080F034C: .4byte gWindowConfig_81E70D4\n_080F0350:\n    ldr r0, _080F0358 @ =gWindowConfig_81E70D4\n    bl MultistepInitMenuWindowBegin\n    b _080F0618\n    .align 2, 0\n_080F0358: .4byte gWindowConfig_81E70D4\n_080F035C:\n    bl MultistepInitMenuWindowContinue\n    cmp r0, 0\n    beq _080F0366\n    b _080F0618\n_080F0366:\n    b _080F0626\n_080F0368:\n    bl MenuZeroFillScreen\n    b _080F0618\n_080F036E:\n    ldr r0, _080F0378 @ =gUnknown_08E9FC64\n    ldr r1, _080F037C @ =0x0600e800\n    bl LZ77UnCompVram\n    b _080F0618\n    .align 2, 0\n_080F0378: .4byte gUnknown_08E9FC64\n_080F037C: .4byte 0x0600e800\n_080F0380:\n    ldr r0, _080F038C @ =gPokenavConditionSearch2_Gfx\n    ldr r1, _080F0390 @ =0x06008000\n    bl LZ77UnCompVram\n    b _080F0618\n    .align 2, 0\n_080F038C: .4byte gPokenavConditionSearch2_Gfx\n_080F0390: .4byte 0x06008000\n_080F0394:\n    ldr r6, _080F03FC @ =gUnknown_083E02B4\n    adds r0, r6, 0\n    movs r1, 0xB0\n    movs r2, 0x20\n    bl LoadPalette\n    adds r0, r6, 0\n    movs r1, 0xF0\n    movs r2, 0x20\n    bl LoadPalette\n    ldr r0, _080F0400 @ =gUnknown_083E0334\n    movs r1, 0x40\n    movs r2, 0x20\n    bl LoadPalette\n    ldr r0, _080F0404 @ =gUnknown_083DFEC4\n    ldr r0, [r0]\n    ldr r1, _080F0408 @ =0x000087ca\n    adds r0, r1\n    ldrb r0, [r0]\n    cmp r0, 0\n    bne _080F0418\n    ldr r4, _080F040C @ =gPokenavConditionSearch2_Pal\n    adds r0, r4, 0\n    movs r1, 0x30\n    movs r2, 0x20\n    bl LoadPalette\n    ldr r1, _080F0410 @ =gPlttBufferUnfaded\n    ldrh r0, [r4, 0xA]\n    strh r0, [r1]\n    ldr r0, _080F0414 @ =gUnknownPalette_81E6692\n    movs r1, 0xB0\n    movs r2, 0x20\n    bl LoadPalette\n    adds r0, r6, 0x2\n    movs r1, 0xB1\n    movs r2, 0x2\n    bl LoadPalette\n    adds r0, r6, 0\n    adds r0, 0x10\n    movs r1, 0xB5\n    movs r2, 0x2\n    bl LoadPalette\n    adds r4, 0xA\n    adds r0, r4, 0\n    movs r1, 0xBF\n    b _080F04A8\n    .align 2, 0\n_080F03FC: .4byte gUnknown_083E02B4\n_080F0400: .4byte gUnknown_083E0334\n_080F0404: .4byte gUnknown_083DFEC4\n_080F0408: .4byte 0x000087ca\n_080F040C: .4byte gPokenavConditionSearch2_Pal\n_080F0410: .4byte gPlttBufferUnfaded\n_080F0414: .4byte gUnknownPalette_81E6692\n_080F0418:\n    cmp r0, 0x1\n    bne _080F0464\n    ldr r4, _080F0458 @ =gUnknown_083E0274\n    adds r0, r4, 0\n    movs r1, 0x30\n    movs r2, 0x20\n    bl LoadPalette\n    ldr r1, _080F045C @ =gPlttBufferUnfaded\n    ldrh r0, [r4, 0xA]\n    strh r0, [r1]\n    ldr r0, _080F0460 @ =gUnknownPalette_81E6692\n    movs r1, 0xB0\n    movs r2, 0x20\n    bl LoadPalette\n    adds r0, r6, 0x2\n    movs r1, 0xB1\n    movs r2, 0x2\n    bl LoadPalette\n    adds r0, r6, 0\n    adds r0, 0x10\n    movs r1, 0xB5\n    movs r2, 0x2\n    bl LoadPalette\n    adds r4, 0xA\n    adds r0, r4, 0\n    movs r1, 0xBF\n    b _080F04A8\n    .align 2, 0\n_080F0458: .4byte gUnknown_083E0274\n_080F045C: .4byte gPlttBufferUnfaded\n_080F0460: .4byte gUnknownPalette_81E6692\n_080F0464:\n    ldr r4, _080F04B0 @ =gUnknown_08E9F9E8\n    adds r0, r4, 0\n    movs r1, 0x30\n    movs r2, 0x20\n    bl LoadPalette\n    ldr r1, _080F04B4 @ =gPlttBufferUnfaded\n    adds r5, r4, 0\n    adds r5, 0xA\n    ldrh r0, [r4, 0xA]\n    strh r0, [r1]\n    ldr r0, _080F04B8 @ =gUnknown_083E0314\n    movs r1, 0x50\n    movs r2, 0x20\n    bl LoadPalette\n    adds r0, r6, 0x2\n    movs r1, 0xB1\n    movs r2, 0x2\n    bl LoadPalette\n    adds r0, r6, 0\n    adds r0, 0x10\n    movs r1, 0xB5\n    movs r2, 0x2\n    bl LoadPalette\n    adds r0, r5, 0\n    movs r1, 0xBF\n    movs r2, 0x2\n    bl LoadPalette\n    adds r0, r5, 0\n    movs r1, 0x5F\n_080F04A8:\n    movs r2, 0x2\n    bl LoadPalette\n    b _080F0618\n    .align 2, 0\n_080F04B0: .4byte gUnknown_08E9F9E8\n_080F04B4: .4byte gPlttBufferUnfaded\n_080F04B8: .4byte gUnknown_083E0314\n_080F04BC:\n    ldr r0, _080F04E8 @ =gUnknown_083DFEC4\n    ldr r0, [r0]\n    ldr r2, _080F04EC @ =0x000087ca\n    adds r0, r2\n    ldrb r0, [r0]\n    cmp r0, 0x2\n    beq _080F04F8\n    ldr r0, _080F04F0 @ =0x0600e800\n    ldr r3, _080F04F4 @ =gUnknown_08E9FD1C\n    movs r1, 0\n    str r1, [sp]\n    str r1, [sp, 0x4]\n    movs r2, 0x9\n    str r2, [sp, 0x8]\n    movs r1, 0x4\n    str r1, [sp, 0xC]\n    str r2, [sp, 0x10]\n    movs r1, 0\n    movs r2, 0x5\n    bl sub_8095C8C\n    b _080F0618\n    .align 2, 0\n_080F04E8: .4byte gUnknown_083DFEC4\n_080F04EC: .4byte 0x000087ca\n_080F04F0: .4byte 0x0600e800\n_080F04F4: .4byte gUnknown_08E9FD1C\n_080F04F8:\n    ldr r3, _080F0530 @ =0x0600e800\n    mov r8, r3\n    ldr r3, _080F0534 @ =gUnknown_08E9FE54\n    movs r4, 0\n    str r4, [sp]\n    str r4, [sp, 0x4]\n    movs r5, 0xC\n    str r5, [sp, 0x8]\n    movs r6, 0xA\n    str r6, [sp, 0xC]\n    str r5, [sp, 0x10]\n    mov r0, r8\n    movs r1, 0\n    movs r2, 0x4\n    bl sub_8095C8C\n    ldr r3, _080F0538 @ =gUnknown_08E9FD64\n    str r4, [sp]\n    str r4, [sp, 0x4]\n    str r5, [sp, 0x8]\n    str r6, [sp, 0xC]\n    str r5, [sp, 0x10]\n    mov r0, r8\n    movs r1, 0\n    movs r2, 0x8\n    bl sub_8095C8C\n    b _080F0618\n    .align 2, 0\n_080F0530: .4byte 0x0600e800\n_080F0534: .4byte gUnknown_08E9FE54\n_080F0538: .4byte gUnknown_08E9FD64\n_080F053C:\n    ldr r0, _080F0548 @ =gUnknown_083E0354\n    ldr r1, _080F054C @ =0x06005000\n    bl LZ77UnCompVram\n    b _080F0618\n    .align 2, 0\n_080F0548: .4byte gUnknown_083E0354\n_080F054C: .4byte 0x06005000\n_080F0550:\n    ldr r2, _080F0568 @ =0x0600f800\n    add r1, sp, 0x14\n    movs r0, 0\n    strh r0, [r1]\n    ldr r0, _080F056C @ =0x040000d4\n    str r1, [r0]\n    str r2, [r0, 0x4]\n    ldr r1, _080F0570 @ =0x81000400\n    str r1, [r0, 0x8]\n    ldr r0, [r0, 0x8]\n    b _080F0618\n    .align 2, 0\n_080F0568: .4byte 0x0600f800\n_080F056C: .4byte 0x040000d4\n_080F0570: .4byte 0x81000400\n_080F0574:\n    bl sub_80F0900\n    b _080F0618\n_080F057A:\n    bl sub_80F0944\n    lsls r0, 24\n    cmp r0, 0\n    beq _080F0618\n    b _080F0626\n_080F0586:\n    ldr r0, _080F059C @ =gUnknown_083DFEC4\n    ldr r4, [r0]\n    ldr r1, _080F05A0 @ =0x000087ca\n    adds r0, r4, r1\n    ldrb r0, [r0]\n    cmp r0, 0x2\n    beq _080F05A4\n    bl ShowMapNamePopUpWindow\n    b _080F0618\n    .align 2, 0\n_080F059C: .4byte gUnknown_083DFEC4\n_080F05A0: .4byte 0x000087ca\n_080F05A4:\n    movs r0, 0\n    bl sub_80F081C\n    ldr r2, _080F05B8 @ =0x0000876e\n    adds r0, r4, r2\n    ldrb r0, [r0]\n    bl sub_80F0FFC\n    b _080F0618\n    .align 2, 0\n_080F05B8: .4byte 0x0000876e\n_080F05BC:\n    ldr r1, _080F0600 @ =REG_BG2CNT\n    ldr r3, _080F0604 @ =0x00001d0a\n    adds r0, r3, 0\n    strh r0, [r1]\n    adds r1, 0x2\n    adds r3, 0xF9\n    adds r0, r3, 0\n    strh r0, [r1]\n    subs r1, 0x6\n    adds r3, 0xFE\n    adds r0, r3, 0\n    strh r0, [r1]\n    adds r1, 0x16\n    movs r0, 0xF8\n    strh r0, [r1]\n    ldr r1, [r2]\n    ldr r0, _080F0608 @ =0x00008776\n    adds r2, r1, r0\n    movs r3, 0\n    movs r0, 0xF8\n    strh r0, [r2]\n    ldr r2, _080F060C @ =0x00008778\n    adds r0, r1, r2\n    strh r3, [r0]\n    ldr r0, _080F0610 @ =REG_BLDCNT\n    strh r3, [r0]\n    ldr r3, _080F0614 @ =0x0000d160\n    adds r1, r3\n    ldrh r0, [r1]\n    adds r0, 0x1\n    strh r0, [r1]\n_080F05FA:\n    movs r0, 0\n    b _080F0628\n    .align 2, 0\n_080F0600: .4byte REG_BG2CNT\n_080F0604: .4byte 0x00001d0a\n_080F0608: .4byte 0x00008776\n_080F060C: .4byte 0x00008778\n_080F0610: .4byte REG_BLDCNT\n_080F0614: .4byte 0x0000d160\n_080F0618:\n    ldr r0, _080F0634 @ =gUnknown_083DFEC4\n    ldr r1, [r0]\n    ldr r0, _080F0638 @ =0x00000306\n    adds r1, r0\n    ldrh r0, [r1]\n    adds r0, 0x1\n    strh r0, [r1]\n_080F0626:\n    movs r0, 0x1\n_080F0628:\n    add sp, 0x18\n    pop {r3}\n    mov r8, r3\n    pop {r4-r6}\n    pop {r1}\n    bx r1\n    .align 2, 0\n_080F0634: .4byte gUnknown_083DFEC4\n_080F0638: .4byte 0x00000306\n    .syntax divided\n");
# 5002 "src/pokenav_before.c"
}
