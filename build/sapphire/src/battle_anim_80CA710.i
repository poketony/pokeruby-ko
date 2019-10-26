# 1 "src/battle_anim_80CA710.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/battle_anim_80CA710.c"
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
# 2 "src/battle_anim_80CA710.c" 2
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
# 3 "src/battle_anim_80CA710.c" 2
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
# 4 "src/battle_anim_80CA710.c" 2
# 1 "include/battle_anim_80CA710.h" 1



void sub_80E4EF8(int, int, int, int, u16, u8, int);
s16 sub_81174E0(s16 a);
s16 sub_81174C4(s16 a, s16 b);
# 5 "src/battle_anim_80CA710.c" 2
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
# 6 "src/battle_anim_80CA710.c" 2
# 1 "include/blend_palette.h" 1



void BlendPalette(u16 palOffset, u16 numEntries, u8 coeff, u16 blendColor);
# 7 "src/battle_anim_80CA710.c" 2
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
# 8 "src/battle_anim_80CA710.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 9 "src/battle_anim_80CA710.c" 2
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
# 10 "src/battle_anim_80CA710.c" 2
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
# 11 "src/battle_anim_80CA710.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 12 "src/battle_anim_80CA710.c" 2
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
# 13 "src/battle_anim_80CA710.c" 2
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
# 14 "src/battle_anim_80CA710.c" 2
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
# 15 "src/battle_anim_80CA710.c" 2
# 1 "include/sprite.h" 1
# 16 "src/battle_anim_80CA710.c" 2
# 1 "include/task.h" 1
# 17 "src/battle_anim_80CA710.c" 2
# 1 "include/trig.h" 1



extern const s16 gSineTable[];

s16 Sin(s16 index, s16 amplitude);
s16 Cos(s16 index, s16 amplitude);
s16 Sin2(u16 angle);
s16 Cos2(u16 angle);
# 18 "src/battle_anim_80CA710.c" 2
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
# 19 "src/battle_anim_80CA710.c" 2

struct Struct_sub_8078914
{
    u8 *field_0;
    u8 *field_4;
    u8 field_8;
};

extern u8 gBanksBySide[];
extern s16 gBattleAnimArgs[8];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;
extern struct SpriteTemplate gSpriteTemplate_83D631C;
extern struct SpriteTemplate gSpriteTemplate_83D6884;
extern struct SpriteTemplate gSpriteTemplate_83D74BC;
extern struct SpriteTemplate gSpriteTemplate_83D75AC;
extern struct SpriteTemplate gSpriteTemplate_83D79E8;
extern struct SpriteTemplate gBattleAnimSpriteTemplate_83D6FC8;
extern struct SpriteTemplate gBattleAnimSpriteTemplate_83D6FF8;
extern struct AffineAnimFrameCmd gUnknown_083D76F4;
extern struct AffineAnimFrameCmd gUnknown_083D7714;
extern struct AffineAnimFrameCmd gUnknown_083D77B0;
extern struct AffineAnimFrameCmd gUnknown_083D79BC;
extern struct AffineAnimFrameCmd gUnknown_083D7A98;
extern struct INCBIN_U8 gBattleAnimSpritePalette_206;
extern struct INCBIN_U8 gAttractTilemap;
extern struct INCBIN_U8 gAttractGfx;
extern struct INCBIN_U8 gAttractPal;
extern struct INCBIN_U8 gBattleAnimBackgroundTilemap_ScaryFaceContest;
extern struct INCBIN_U8 gBattleAnimBackgroundTilemap_ScaryFacePlayer;
extern struct INCBIN_U8 gBattleAnimBackgroundTilemap_ScaryFaceOpponent;
extern struct INCBIN_U8 gBattleAnimBackgroundImage_ScaryFace;
extern struct INCBIN_U8 gBattleAnimBackgroundPalette_ScaryFace;
extern s16 gUnknown_03000728[];
extern s8 gUnknown_083D680C[11][3];
extern u16 gUnknown_083D6984[];
extern s8 gUnknown_083D6DDC[4][2];
extern u8 gObjectBankIDs[];
extern u8 gNoOfAllBanks;
extern u8 gHealthboxIDs[];
extern u16 gUnknown_083D712C[4][6];
extern u16 gBattleTypeFlags;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042C4;
extern u16 gUnknown_03004240;
extern u16 gUnknown_030041B4;
extern s8 gUnknown_083D7A00[4][2];
extern u16 gUnknown_083D7A5C[5];

static void sub_80CA768(struct Sprite* sprite);
static void sub_80CA8B4(struct Sprite* sprite);
static void sub_80CA9F8(struct Sprite* sprite);
static void sub_80CAACC(struct Sprite* sprite);
static void sub_80CAB88(struct Sprite* sprite);
static void sub_80CABC0(struct Sprite* sprite);
static void sub_80CAC44(struct Sprite* sprite);
static void sub_80CADA8(struct Sprite* sprite);
static void sub_80CAE74(struct Sprite* sprite);
static void sub_80CAF20(struct Sprite* sprite);
static void sub_80CAF6C(struct Sprite* sprite);
static void sub_80CB09C(struct Sprite* sprite);
static void sub_80CB1A4(struct Sprite* sprite);
static void sub_80CB298(struct Sprite* sprite);
static void sub_80CB2D4(struct Sprite* sprite);
static void sub_80CB710(struct Sprite* sprite);
static void sub_80CBB60(struct Sprite* sprite);
static void sub_80CBC8C(struct Sprite* sprite);
static void sub_80CBCF8(struct Sprite* sprite);
static void sub_80CBDB0(struct Sprite* sprite);
static void sub_80CC408(struct Sprite* sprite);
static void sub_80CC580(struct Sprite* sprite);
static void sub_80CC7D4(struct Sprite* sprite);
static void sub_80CCB00(struct Sprite* sprite);
static void sub_80CCCB4(struct Sprite* sprite);
static void sub_80CCE0C(struct Sprite* sprite);
static void sub_80CCF70(struct Sprite* sprite);
static void sub_80CD0CC(struct Sprite* sprite, int unk1, int unk2);
static void sub_80CD2D4(struct Sprite* sprite);
static void sub_80CD394(struct Sprite* sprite);
static void sub_80CD408(struct Sprite* sprite);
static void sub_80CD4B8(struct Sprite* sprite);
static void sub_80CD4EC(struct Sprite* sprite);
static void sub_80CD5A8(struct Sprite* sprite);
static void sub_80CD654(struct Sprite* sprite);
static void sub_80CD67C(struct Sprite* sprite);
static void sub_80CD7CC(struct Sprite* sprite);
static void sub_80CD81C(struct Sprite* sprite);
static void sub_80CD8A8(struct Sprite* sprite);
static void sub_80CD8F8(struct Sprite* sprite);
static void sub_80CD91C(struct Sprite* sprite);
static void sub_80CD9B8(struct Sprite* sprite);
static void sub_80CD9D4(struct Sprite* sprite);
static void sub_80CDE78(struct Sprite* sprite);
static void sub_80CDEB0(struct Sprite* sprite);
static void sub_80CDEC0(struct Sprite* sprite);
static void sub_80CDF70(struct Sprite* sprite);
static void sub_80CE000(struct Sprite* sprite);
static void sub_80CE1AC(struct Sprite* sprite);
static void sub_80CE354(struct Sprite* sprite);
static void sub_80CE3B0(struct Sprite* sprite);
static void sub_80CE798(struct Sprite* sprite);
static void sub_80CE974(struct Sprite* sprite);
static void sub_80CEC1C(struct Sprite* sprite);
static void sub_80CED78(struct Sprite* sprite);
static void sub_80CEEE8(struct Sprite* sprite);
static void sub_80CF008(struct Sprite* sprite);
static void sub_80CF088(struct Sprite* sprite);
static void sub_80CF138(struct Sprite* sprite);
static void sub_80CF158(struct Sprite* sprite);
static void sub_80CF228(struct Sprite* sprite);
static void sub_80CF264(struct Sprite* sprite);
static void sub_80CF310(struct Sprite* sprite);
static void sub_80CF490(struct Sprite* sprite);
static void sub_80CF4B8(struct Sprite* sprite);
static void sub_80CF6B4(struct Sprite* sprite);
static void sub_80CFE2C(struct Sprite* sprite);
static void sub_80CFF68(struct Sprite* sprite);
static void sub_80D0030(struct Sprite* sprite);
static void sub_80D00B4(struct Sprite* sprite);
static void sub_80D020C(struct Sprite* sprite);
static void sub_80D02D0(struct Sprite* sprite);
static void sub_80D0344(struct Sprite* sprite);
static void sub_80D03A8(struct Sprite* sprite);
extern void sub_80D0704(struct Sprite* sprite);
static void sub_80D0E8C(struct Sprite* sprite);
static void sub_80D1098(struct Sprite* sprite);
static void sub_80D13AC(struct Sprite* sprite);
static void sub_80D1424(struct Sprite* sprite);
static void sub_80D144C(struct Sprite* sprite);
static void sub_80D14C4(struct Sprite* sprite);
static void sub_80D1504(struct Sprite* sprite);
static void sub_80D154C(struct Sprite* sprite);
static void sub_80D158C(struct Sprite* sprite);
static void sub_80D1FA4(struct Sprite* sprite);
static void sub_80D2094(struct Sprite* sprite);
static void sub_80D2704(struct Sprite* sprite);
static void sub_80D2834(struct Sprite* sprite);
static s16 sub_80CC338(struct Sprite* sprite);
static void sub_80CB3A8(u8 taskId);
static void sub_80CB438(u8 taskId);
static void sub_80CBF5C(u8 taskId);
static void sub_80CDB60(u8 taskId);
static void sub_80CDD20(u8 taskId);
static void sub_80CE4D4(u8 taskId);
static void sub_80CE910(u8 taskId);
static void sub_80CF514(u8 taskId);
static void sub_80D0428(u8 taskId);
static void sub_80D04E0(u8 taskId);
static void sub_80D07AC(u8 taskId);
static void sub_80D0904(u8 taskId);
static void sub_80D0A8C(u8 taskId);
static void sub_80D0B3C(u8 taskId);
static void sub_80D0D68(u8 taskId);
static void sub_80D15E0(u8 taskId);
static void sub_80D16A0(u8 taskId);
static void sub_80D1808(u8 taskId);
static void sub_80D1930(u8 taskId);
static void sub_80D1D48(u8 taskId);
static void sub_80D1D9C(u8 taskId);
static void sub_80D21F0(u8 taskId);
static void sub_80D24E0(u8 taskId);
static void sub_80CC358(struct Task* task, u8 taskId);
extern void sub_80D0614(struct Task* task, u8 taskId);
static void sub_80CEBC4(s16 a, s16 b, s16* c, s16* d, s8 e);


void sub_80CA710(struct Sprite* sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];

    if (GetBankSide(gBattleAnimBankAttacker))
    {
        sprite->data[3] = -gBattleAnimArgs[4];
    }
    else
    {
        sprite->data[3] = gBattleAnimArgs[4];
    }

    sprite->data[4] = gBattleAnimArgs[5];
    sprite->callback = sub_80CA768;
}

void sub_80CA768(struct Sprite* sprite)
{
    if (sprite->data[0] > 0)
    {
        sprite->data[0]--;
        sprite->pos2.y = sprite->data[2] >> 8;
        sprite->data[2] += sprite->data[1];
        sprite->pos2.x = Sin(sprite->data[5], sprite->data[3]);
        sprite->data[5] = (sprite->data[5] + sprite->data[4]) & 0xFF;
    }
    else
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CA7B0(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
}

void sub_80CA800(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    StartSpriteAnim(sprite, gBattleAnimArgs[3]);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CA858(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80CA8B4;
    sub_80CA8B4(sprite);
}

void sub_80CA8B4(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite))
    {
        DestroySprite(sprite);
    }
    else
    {
        if (sprite->data[5] > 0x7F)
        {
            sprite->subpriority = sub_8079E90(gBattleAnimBankTarget) + 1;
        }
        else
        {
            sprite->subpriority = sub_8079E90(gBattleAnimBankTarget) + 6;
        }
        sprite->pos2.x += Sin(sprite->data[5], 5);
        sprite->pos2.y += Cos(sprite->data[5], 14);
        sprite->data[5] = (sprite->data[5] + 15) & 0xFF;
    }
}

void sub_80CA928(u8 taskId)
{
    gTasks[taskId].data[0]--;
    if (gTasks[taskId].data[0] == -1)
    {
        gTasks[taskId].data[1]++;
        gTasks[taskId].data[0] = 6;
        gBattleAnimArgs[0] = 15;
        gBattleAnimArgs[1] = 0;
        gBattleAnimArgs[2] = 80;
        gBattleAnimArgs[3] = 0;
        CreateSpriteAndAnimate(&gSpriteTemplate_83D631C, 0, 0, sub_8079E90(gBattleAnimBankTarget) + 1);
    }

    if (gTasks[taskId].data[1] == 15)
        DestroyAnimVisualTask(taskId);
}

void sub_80CA9A8(struct Sprite* sprite)
{
    sub_8078764(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->data[5] = gBattleAnimArgs[2];
    sub_80786EC(sprite);
    sprite->callback = sub_80CA9F8;
}

void sub_80CA9F8(struct Sprite* sprite)
{
    if (sub_8078718(sprite))
        move_anim_8072740(sprite);
}

void sub_80CAA14(struct Sprite* sprite)
{
    u16 a = Random();
    u16 b;

    StartSpriteAnim(sprite, a & 7);
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    if (GetBankSide(gBattleAnimBankAttacker))
    {
        sprite->pos1.x -= 20;
    }
    else
    {
        sprite->pos1.x += 20;
    }

    b = Random();
    sprite->data[0] = (b & 31) + 64;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    sub_8078D60(sprite);
    sprite->data[5] = Random() & 0xFF;
    sprite->data[6] = sprite->subpriority;
    sprite->callback = sub_80CAACC;
    sub_80CAACC(sprite);
}

void sub_80CAACC(struct Sprite* sprite)
{
    if (sub_8078CE8(sprite))
    {
        move_anim_8072740(sprite);
    }
    else
    {
        sprite->pos2.y += Cos(sprite->data[5], 12);
        if (sprite->data[5] <= 0x7E)
        {
            sprite->subpriority = sprite->data[6];
        }
        else
        {
            sprite->subpriority = sprite->data[6] + 1;
        }

        sprite->data[5] = (sprite->data[5] + 24) & 0xFF;
    }
}

void sub_80CAB18(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    if (GetBankSide(gBattleAnimBankAttacker))
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 0) + gBattleAnimArgs[2];
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 1) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    sub_80786EC(sprite);
    sprite->callback = sub_80CAB88;
}

void sub_80CAB88(struct Sprite* sprite)
{
    if (sub_8078718(sprite))
    {
        sprite->invisible = 1;
        sprite->data[0] = 10;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CABC0);
    }
}

void sub_80CABC0(struct Sprite* sprite)
{
    sprite->invisible = 0;
    StartSpriteAnim(sprite, 1);
    sprite->data[0] = 60;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CABF8(struct Sprite* sprite)
{
    sub_8078764(sprite, 1);
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);
    if (gBattleAnimArgs[4] == 1)
    {
        sprite->oam.objMode = 1;
    }

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->callback = sub_80CAC44;
    sub_80CAC44(sprite);
}

void sub_80CAC44(struct Sprite* sprite)
{
    u8 var1;

    sprite->pos2.x = Sin(sprite->data[1], 32);
    sprite->pos2.y = Cos(sprite->data[1], -3) + ((sprite->data[2] += 24) >> 8);
    if ((u16)(sprite->data[1] - 0x40) < 0x80)
    {
        sprite->oam.priority = (sub_8079ED4(gBattleAnimBankTarget) & 3);
    }
    else
    {
        var1 = sub_8079ED4(gBattleAnimBankTarget) + 1;
        if (var1 > 3)
        {
            var1 = 3;
        }

        sprite->oam.priority = var1;
    }

    sprite->data[1] = (sprite->data[1] + 2) & 0xFF;
    sprite->data[0]--;
    if (sprite->data[0] == -1)
        move_anim_8072740(sprite);
}

void sub_80CACEC(u8 taskId)
{
    if (NotInBattle() || !IsDoubleBattle())
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        if (GetBankIdentity_permutated(gBattleAnimBankTarget) == 1)
        {
            (*(struct BGCntrlBitfield *)(0x4000000 + 0xc)).priority = 3;
        }
        else
        {
            (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).priority = 1;
        }

        DestroyAnimVisualTask(taskId);
    }
}

void sub_80CAD54(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3) + gBattleAnimArgs[2];
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[5] = 0x40;
    sprite->callback = sub_80CADA8;
    sub_80CADA8(sprite);
}

void sub_80CADA8(struct Sprite* sprite)
{
    if (!sub_8078B5C(sprite))
    {
        sprite->pos2.x += Sin(sprite->data[5], 32);
        sprite->pos2.y += Cos(sprite->data[5], -5);
        if ((u16)(sprite->data[5] - 0x40) < 0x80)
        {
            sprite->subpriority = sub_8079E90(gBattleAnimBankAttacker) - 1;
        }
        else
        {
            sprite->subpriority = sub_8079E90(gBattleAnimBankAttacker) + 1;
        }

        sprite->data[5] = (sprite->data[5] + 5) & 0xFF;
    }
    else
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CAE20(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3) + gBattleAnimArgs[2];
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[5] = 0x40;
    sprite->callback = sub_80CAE74;
    sub_80CAE74(sprite);
}

void sub_80CAE74(struct Sprite* sprite)
{
    if (!sub_8078B5C(sprite))
    {
        sprite->pos2.x += Sin(sprite->data[5], 8);
        if ((u16)(sprite->data[5] - 0x3B) < 5 || (u16)(sprite->data[5] - 0xBB) < 5)
        {
            sprite->oam.matrixNum ^= 8;
        }

        sprite->data[5] = (sprite->data[5] + 5) & 0xFF;
    }
    else
    {
       move_anim_8072740(sprite);
    }
}

void sub_80CAED8(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = gBattleAnimArgs[2];
    sprite->callback = sub_80CAF20;
}

void sub_80CAF20(struct Sprite* sprite)
{
    if (!sprite->data[2])
    {
        if (sprite->data[1] & 1)
        {
            sprite->data[0] = 0x80;
            sprite->data[1] = 0;
            sprite->data[2] = 0;
        }
        else
        {
            sprite->data[0] = sprite->data[1] & 1;
            sprite->data[1] = sprite->data[1] & 1;
            sprite->data[2] = sprite->data[1] & 1;
        }
        sprite->callback = sub_80CAF6C;
    }
    else
    {
        sprite->data[2]--;
        sprite->pos1.x += sprite->data[0];
        sprite->pos1.y += sprite->data[1];
    }
}

void sub_80CAF6C(struct Sprite* sprite)
{
    if (GetBankSide(gBattleAnimBankAttacker))
    {
        sprite->pos2.x = -Sin(sprite->data[0], 0x19);
    }
    else
    {
        sprite->pos2.x = Sin(sprite->data[0], 0x19);
    }

    sprite->data[0] = (sprite->data[0] + 2) & 0xFF;
    sprite->data[1]++;
    if (!(sprite->data[1] & 1))
    {
        sprite->pos2.y++;
    }

    if (sprite->data[1] > 0x50)
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CAFD0(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    if (GetBankSide(gBattleAnimBankAttacker))
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[4];
    if (!(gBattleAnimArgs[6]))
    {
        sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[2];
        sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[3];
    }
    else
    {
        sub_807A3FC(gBattleAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
        sprite->data[2] += gBattleAnimArgs[2];
        sprite->data[4] += gBattleAnimArgs[3];
    }

    sprite->data[5] = gBattleAnimArgs[5];
    sub_80786EC(sprite);
    if (GetBankSide(gBattleAnimBankAttacker) == GetBankSide(gBattleAnimBankTarget))
    {
        sprite->data[0] = 1;
    }
    else
    {
        sprite->data[0] = 0;
    }

    sprite->callback = sub_80CB09C;
}

void sub_80CB09C(struct Sprite* sprite)
{
    bool8 c = 0;
    s16 a = sprite->data[0];
    s16 b = sprite->data[7];
    s16 r0;

    sprite->data[0] = 1;
    sub_8078718(sprite);
    r0 = sprite->data[7];
    sprite->data[0] = a;
    if (b > 0xC8 && r0 <= 0x37 && sprite->oam.affineParam == 0)
        sprite->oam.affineParam++;

    if (sprite->oam.affineParam != 0 && sprite->data[0] != 0)
    {
        sprite->invisible ^= 1;
        sprite->oam.affineParam++;
        if (sprite->oam.affineParam == 0x1E)
            c = 1;
    }

    if (sprite->pos1.x + sprite->pos2.x > 0x100
     || sprite->pos1.x + sprite->pos2.x < -16
     || sprite->pos1.y + sprite->pos2.y > 0xA0
     || sprite->pos1.y + sprite->pos2.y < -16)
        c = 1;

    if (c)
        move_anim_8072740(sprite);
}

void sub_80CB144(struct Sprite* sprite)
{
    if (!NotInBattle() && IsDoubleBattle() == 1)
    {
        sub_807A3FC(gBattleAnimBankTarget, 1, &sprite->pos1.x, &sprite->pos1.y);
    }

    sprite->pos1.y += 32;
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = gBattleAnimArgs[2];
    sprite->data[3] = gBattleAnimArgs[3];
    sprite->data[4] = gBattleAnimArgs[4];
    sprite->callback = sub_80CB1A4;
}

void sub_80CB1A4(struct Sprite* sprite)
{
    if (sprite->data[1] == 0xFF)
    {
        sprite->pos1.y -= 2;
    }
    else if (sprite->data[1] > 0)
    {
        sprite->pos1.y -= 2;
        sprite->data[1] -= 2;
    }

    sprite->data[5] += sprite->data[2];
    if (sprite->data[0] < sprite->data[4])
        sprite->data[5] += sprite->data[2];

    sprite->data[5] &= 0xFF;
    sprite->pos2.x = Cos(sprite->data[5], sprite->data[3]);
    sprite->pos2.y = Sin(sprite->data[5], 5);
    if (sprite->data[5] <= 0x7F)
    {
        sprite->oam.priority = sub_8079ED4(gBattleAnimBankTarget) - 1;
    }
    else
    {
        sprite->oam.priority = sub_8079ED4(gBattleAnimBankTarget) + 1;
    }

    sprite->data[0]--;
    if (!sprite->data[0])
        move_anim_8072740(sprite);
}

void sub_80CB25C(struct Sprite* sprite)
{
    sub_8078764(sprite, 0);
    sprite->affineAnimPaused = 1;
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[2]);
    sprite->data[6] = gBattleAnimArgs[2];
    sprite->data[7] = gBattleAnimArgs[3];
    sprite->callback = sub_80CB298;
}

void sub_80CB298(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->affineAnimPaused = 0;
        GetAnimBankSpriteId(1);
        sprite->data[0] = 0x100;
        sprite->callback = sub_80CB2D4;
    }
}

void sub_80CB2D4(struct Sprite* sprite)
{
    GetAnimBankSpriteId(1);
    if (!sprite->data[2])
    {
        sprite->data[0] += 11;
    }
    else
    {
        sprite->data[0] -= 11;
    }
    sprite->data[1]++;
    if (sprite->data[1] == 6)
    {
        sprite->data[1] = 0;
        sprite->data[2] ^= 1;
    }

    if (sprite->affineAnimEnded)
    {
        sprite->data[7]--;
        if (sprite->data[7] > 0)
        {
            StartSpriteAffineAnim(sprite, sprite->data[6]);
        }
        else
        {
            move_anim_8072740(sprite);
        }
    }
}

void sub_80CB340(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(1);
    if (gSprites[spriteId].invisible)
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        sub_8078E70(spriteId, 1);
        gTasks[taskId].data[0] = gBattleAnimArgs[0];
        gTasks[taskId].data[1] = gBattleAnimArgs[1];
        gTasks[taskId].data[11] = 256;
        gTasks[taskId].func = sub_80CB3A8;
    }
}

void sub_80CB3A8(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(1);
    gTasks[taskId].data[10] += gTasks[taskId].data[0];
    gSprites[spriteId].pos2.x = gTasks[taskId].data[10] >> 8;
    if (GetBankSide(gBattleAnimBankTarget))
    {
        gSprites[spriteId].pos2.x = -gSprites[spriteId].pos2.x;
    }

    gTasks[taskId].data[11] += 16;
    obj_id_set_rotscale(spriteId, gTasks[taskId].data[11], gTasks[taskId].data[11], 0);
    sub_8079A64(spriteId);
    gTasks[taskId].data[1]--;
    if (!gTasks[taskId].data[1])
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80CB438;
    }
}

void sub_80CB438(u8 taskId)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        if (gTasks[taskId].data[0] == 0)
        {
            u8 spriteId = GetAnimBankSpriteId(1);
            sub_8078F40(spriteId);
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            gTasks[taskId].data[0]++;
            return;
        }
    }
    else
    {
        if (gTasks[taskId].data[0] == 0)
            return;
    }

    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] == 3)
        DestroyAnimVisualTask(taskId);
}

void sub_80CB4CC(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
    {
        if (GetBankSide(gBattleAnimBankTarget) == 0)
        {
            s16 a = gBattleAnimArgs[0];
            gBattleAnimArgs[0] = -a;
        }

        sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 0) + gBattleAnimArgs[0];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 1) + gBattleAnimArgs[1];
        sprite->invisible = 1;
        sprite->data[0]++;
        break;
    }
    case 1:
    {
        sprite->invisible = 0;
        if (sprite->affineAnimEnded)
        {
            ChangeSpriteAffineAnim(sprite, 1);
            sprite->data[0] = 25;
            sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 2);
            sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3);
            sprite->callback = sub_8078CC0;
            StoreSpriteCallbackInData(sprite, move_anim_8072740);
            break;
        }
    }
    }
}

void sub_80CB59C(struct Sprite* sprite)
{
    if (!sprite->data[0])
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 1);
        sprite->pos2.x = gBattleAnimArgs[0];
        sprite->pos2.y = gBattleAnimArgs[1];
        sprite->subpriority = gBattleAnimArgs[2] + 30;
        StartSpriteAnim(sprite, gBattleAnimArgs[3]);
        sprite->data[2] = gBattleAnimArgs[4];
        sprite->data[0]++;
        if ((sprite->pos1.y + sprite->pos2.y) > 120)
        {
            sprite->pos1.y += -120 + (sprite->pos2.y + sprite->pos1.y);
        }
    }
    sprite->callback = sub_80CB710;
}

void sub_80CB620(struct Sprite *sprite)
{
    s16 p1 = sub_8077ABC(gBattleAnimBankAttacker, 2);
    s16 p2 = sub_8077ABC(gBattleAnimBankAttacker, 3);
    s16 e1 = sub_8077ABC(gBattleAnimBankTarget, 2);
    s16 e2 = sub_8077ABC(gBattleAnimBankTarget, 3);

    e1 -= p1;
    e2 -= p2;
    sprite->pos1.x = p1 + e1 * gBattleAnimArgs[0] / 100;
    sprite->pos1.y = p2 + e2 * gBattleAnimArgs[0] / 100;
    sprite->pos2.x = gBattleAnimArgs[1];
    sprite->pos2.y = gBattleAnimArgs[2];
    sprite->subpriority = gBattleAnimArgs[3] + 30;
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);
    sprite->data[2] = gBattleAnimArgs[5];
    sprite->callback = sub_80CB710;
    gUnknown_03000728[0] = sprite->pos1.x;
    gUnknown_03000728[1] = sprite->pos1.y;
    gUnknown_03000728[2] = e1;
    gUnknown_03000728[3] = e2;
}

void sub_80CB710(struct Sprite* sprite)
{
    if (++sprite->data[0] > (sprite->data[2] - 10))
        sprite->invisible = sprite->data[0] % 2;

    if (sprite->data[0] > sprite->data[2])
        move_anim_8072740(sprite);
}

void sub_80CB768(struct Sprite* sprite)
{
    if (!sprite->data[0])
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + gBattleAnimArgs[0];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 1) + gBattleAnimArgs[1];
        sprite->data[1] = gBattleAnimArgs[2];
        sprite->data[2] = gBattleAnimArgs[3];
        sprite->data[3] = gBattleAnimArgs[4];
    }

    sprite->data[0]++;
    sprite->pos2.x = sprite->data[1] * sprite->data[0];
    sprite->pos2.y = Sin((sprite->data[0] * 20) & 0xFF, sprite->data[2]);
    if (sprite->data[0] > sprite->data[3])
        move_anim_8072740(sprite);
}

void sub_80CB7EC(struct Sprite* sprite, s16 c)
{
    s32 a = (sprite->pos1.x * 256) | sprite->pos1.y;
    s32 b = (sprite->data[6] * 256) | sprite->data[7];
    c *= 256;
    sprite->data[5] = a;
    sprite->data[6] = b;
    sprite->data[7] = c;
}

bool8 sub_80CB814(struct Sprite* sprite)
{
    u16 r10 = (u8)(sprite->data[5] >> 8);
    u16 r9 = (u8)sprite->data[5];
    s32 r2 = (u8)(sprite->data[6] >> 8);
    s32 r4 = (u8)sprite->data[6];
    s16 r6 = sprite->data[7] >> 8;
    s16 r3 = sprite->data[7] & 0xFF;
    s16 r4_2;
    s16 r0;
    s32 var1;
    s32 var2;

    if (r2 == 0)
    {
        r2 = -32;
    }
    else if (r2 == 255)
    {
        r2 = 0x110;
    }

    r4_2 = r4 - r9;
    r0 = r2 - r10;
    var1 = r0 * r3 / r6;
    var2 = r4_2 * r3 / r6;
    sprite->pos1.x = var1 + r10;
    sprite->pos1.y = var2 + r9;
    if (++r3 == r6)
        return 1;

    sprite->data[7] = (r6 << 8) | r3;
    return 0;
}

void sub_80CB8B8(struct Sprite* sprite)
{
    if (sprite->data[0] == 10)
    {
        StartSpriteAffineAnim(sprite, 1);
    }

    sprite->data[0]++;
    if (sprite->data[0] > 50)
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CB8E8(struct Sprite* sprite)
{
    sprite->data[0] += sprite->data[3] * 128 / sprite->data[4];
    if (sprite->data[0] >= 128)
    {
        sprite->data[1]++;
        sprite->data[0] = 0;
    }

    sprite->pos2.y = Sin(sprite->data[0] + 128, 30 - sprite->data[1] * 8);
    if (sub_80CB814(sprite))
    {
        sprite->pos2.y = 0;
        sprite->data[0] = 0;
        sprite->callback = sub_80CB8B8;
    }
}

void sub_80CB94C(struct Sprite* sprite)
{
    s16 e1;
    s16 e2;
    sub_80787B0(sprite, 0);
    e1 = sub_8077ABC(gBattleAnimBankTarget, 0);
    e2 = sub_8077ABC(gBattleAnimBankTarget, 1);
    if ((gBattleAnimBankAttacker ^ 2) == gBattleAnimBankTarget)
    {
        sprite->data[6] = e1;
        sprite->data[7] = e2 + 10;
        sub_80CB7EC(sprite, 0x3C);
        sprite->data[3] = 1;
    }
    else
    {
        sprite->data[6] = e1;
        sprite->data[7] = e2 + 10;
        sub_80CB7EC(sprite, 0x3C);
        sprite->data[3] = 3;
    }

    sprite->data[4] = 0x3C;
    sprite->callback = sub_80CB8E8;
}

void sub_80CB9C4(struct Sprite* sprite)
{
    int zero;
    sprite->data[0] += ((sprite->data[3] * 128) / sprite->data[4]);
    zero = 0;
    if (sprite->data[0] > 0x7F)
    {
        sprite->data[1]++;
        sprite->data[0] = zero;
    }

    sprite->pos2.y = Sin(sprite->data[0] + 0x80, 30 - sprite->data[1] * 8);
    if (sub_80CB814(sprite))
    {
        sprite->pos2.y = zero;
        sprite->data[0] = zero;
        move_anim_8072740(sprite);
    }
}

void sub_80CBA28(struct Sprite* sprite)
{
    s16 e = sub_8077ABC(gBattleAnimBankTarget, 1);
    if (GetBankSide(gBattleAnimBankTarget) == 0)
    {
        sprite->data[6] = 0;
        sprite->data[7] = e + 10;
        sub_80CB7EC(sprite, 0x28);
        sprite->data[3] = 3;
        sprite->data[4] = 0x3C;
        sprite->callback = sub_80CB8E8;
    }
    else
    {
        sprite->data[6] = 255;
        sprite->data[7] = e + 10;
        if (NotInBattle())
            sprite->data[6] = 0;

        sub_80CB7EC(sprite, 0x28);
        sprite->data[3] = 3;
        sprite->data[4] = 0x3C;
        sprite->callback = sub_80CB9C4;
    }
}

void sub_80CBAA4(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sub_8078764(sprite, 0);
        sprite->data[1] = gBattleAnimArgs[2];
    }

    sprite->data[0]++;
    sprite->pos2.y = sprite->data[1] * sprite->data[0];
    if (sprite->animEnded)
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CBAE8(struct Sprite* sprite)
{
    s16 p1;
    s16 p2;
    sub_8078764(sprite, 0);
    p1 = sub_8077ABC(gBattleAnimBankAttacker, 0);
    p2 = sub_8077ABC(gBattleAnimBankAttacker, 1);
    if ((gBattleAnimBankTarget ^ 2) == gBattleAnimBankAttacker)
    {
        sprite->data[6] = p1;
        sprite->data[7] = p2 + 10;
        sub_80CB7EC(sprite, 0x3c);
        sprite->data[3] = 1;
    }
    else
    {
        sprite->data[6] = p1;
        sprite->data[7] = p2 + 10;
        sub_80CB7EC(sprite, 0x3c);
        sprite->data[3] = 3;
    }

    sprite->data[4] = 0x3C;
    sprite->callback = sub_80CBB60;
}

void sub_80CBB60(struct Sprite* sprite)
{
    int zero;
    sprite->data[0] += ((sprite->data[3] * 128) / sprite->data[4]);
    zero = 0;
    if (sprite->data[0] > 0x7F)
    {
        sprite->data[1]++;
        sprite->data[0] = zero;
    }

    sprite->pos2.y = Sin(sprite->data[0] + 0x80, 30 - sprite->data[1] * 8);
    if (sprite->pos2.y == 0)
    {
        PlaySE12WithPanning(0x7D, sub_8076F98(0x3F));
    }

    if (sub_80CB814(sprite))
    {
        sprite->pos2.y = 0;
        sprite->data[0] = 0;
        sprite->callback = sub_80CB8B8;
        PlaySE12WithPanning(0x7D, sub_8076F98(-0x40));
    }
}

void sub_80CBBF0(struct Sprite* sprite)
{
    int a;
    int b;

    if (sprite->data[0] == 0)
    {
        if (!NotInBattle())
        {
            sprite->data[1] = gBattleAnimArgs[1];
            sprite->pos1.x = 0x78;
        }
        else
        {
            a = gBattleAnimArgs[1] - 32;
            if (a < 0)
                b = gBattleAnimArgs[1] + 0xDF;
            else
                b = a;

            sprite->data[1] = a - ((b >> 8) << 8);
            sprite->pos1.x = 0x46;
        }

        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[0];
        sprite->data[4] = 20;
        sprite->pos2.x = Cos(sprite->data[1], 0x3C);
        sprite->pos2.y = Sin(sprite->data[1], 20);
        sprite->callback = sub_80CBC8C;
        if (sprite->data[1] > 0 && sprite->data[1] < 0xC0)
            sprite->subpriority = 31;
        else
            sprite->subpriority = 29;
    }
}

void sub_80CBC8C(struct Sprite* sprite)
{
    switch (sprite->data[3])
    {
    case 0:
        if (sprite->data[2] > 0x4E)
        {
            sprite->data[3] = 1;
            StartSpriteAffineAnim(sprite, 1);
            break;
        }
        else
        {
            sprite->data[2] += sprite->data[4] / 10;
            sprite->data[4] += 3;
            sprite->pos1.y = sprite->data[2];
            break;
        }
        break;
    case 1:
        if (sprite->data[3] && sprite->affineAnimEnded)
        {
            sprite->data[0] = 0;
            sprite->data[2] = 0;
            sprite->callback = sub_80CBCF8;
        }
        break;
    }
}



void sub_80CBCF8(struct Sprite* sprite)
{
    if (sprite->data[2] == gUnknown_083D680C[sprite->data[0]][1])
 {
     if (gUnknown_083D680C[sprite->data[0]][2] == 0x7F)
  {
      sprite->data[0] = 0;
   sprite->callback = sub_80CBDB0;
  }

  sprite->data[2] = 0;
  sprite->data[0]++;
 }
 else
 {
     sprite->data[2]++;
  sprite->data[1] = (gUnknown_083D680C[sprite->data[0]][0] * gUnknown_083D680C[sprite->data[0]][2] + sprite->data[1]) & 0xFF;
  if (!NotInBattle())
  {
      if ((u16)(sprite->data[1] - 1) <= 0xBE)
            {
       sprite->subpriority = 31;
   }
   else
   {
       sprite->subpriority = 29;
      }
  }

  sprite->pos2.x = Cos(sprite->data[1], 0x3C);
  sprite->pos2.y = Sin(sprite->data[1], 20);
 }
}

void sub_80CBDB0(struct Sprite* sprite)
{
    if (sprite->data[0] > 20)
        move_anim_8072740(sprite);

 sprite->invisible = sprite->data[0] % 2;
 sprite->data[0]++;
}

void sub_80CBDF4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[4] = sub_8079E90(gBattleAnimBankTarget) - 1;
    task->data[6] = sub_8077ABC(gBattleAnimBankTarget, 2);
    task->data[7] = sub_8077ABC(gBattleAnimBankTarget, 3);
    task->data[10] = sub_807A100(gBattleAnimBankTarget, 1);
    task->data[11] = sub_807A100(gBattleAnimBankTarget, 0);
    task->data[5] = (GetBankSide(gBattleAnimBankTarget) == 1) ? 1 : -1;
    task->data[9] = 0x38 - (task->data[5] * 64);
    task->data[8] = task->data[7] - task->data[9] + task->data[6];
    task->data[2] = CreateSprite(&gSpriteTemplate_83D6884, task->data[8], task->data[9], task->data[4]);
    if (task->data[2] == 0x40)
        DestroyAnimVisualTask(taskId);

    gSprites[task->data[2]].data[0] = 10;
    gSprites[task->data[2]].data[1] = task->data[8];
    gSprites[task->data[2]].data[2] = task->data[6] - (task->data[10] / 2 + 10) * task->data[5];
    gSprites[task->data[2]].data[3] = task->data[9];
    gSprites[task->data[2]].data[4] = task->data[7] + (task->data[11] / 2 + 10) * task->data[5];
    gSprites[task->data[2]].data[5] = sub_80CC338(&gSprites[task->data[2]]);
    sub_80786EC(&gSprites[task->data[2]]);
    task->func = sub_80CBF5C;
}

void sub_80CBF5C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    struct Sprite* sprite = &gSprites[task->data[2]];
    int a = task->data[0];
    switch (a)
    {
    case 4:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
        {
            break;
        }
        else
        {
            task->data[15] = 5;
            task->data[0] = 0xFF;
        }
        break;
    case 8:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
        {
            break;
        }
        else
        {
            task->data[15] = 9;
            task->data[0] = 0xFF;
        }
        break;
    case 0:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
            break;

        task->data[15] = 1;
        task->data[0] = 0xFF;
        break;
    case 1:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] += 2;
        task->data[3] = a;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    case 2:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
            break;

        task->data[15] = 3;
        task->data[0] = 0xFF;
        break;
    case 3:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6] - ((task->data[10] / 2) + 10) * task->data[5];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7] - ((task->data[11] / 2) + 10) * task->data[5];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[3] = 2;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    case 5:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6] + ((task->data[10] / 2) + 10) * task->data[5];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7] + ((task->data[11] / 2) + 10) * task->data[5];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] -= 2;
        task->data[3] = 3;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    case 6:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
            break;

        task->data[15] = 7;
        task->data[0] = 0xFF;
        break;
    case 7:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] += 2;
        task->data[3] = 4;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    case 9:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6] - ((task->data[10] / 2) + 10) * task->data[5];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7] + ((task->data[11] / 2) + 10) * task->data[5];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[3] = 5;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    case 10:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
        {
            break;
        }
        else
        {
            task->data[15] = 11;
            task->data[0] = 0xFF;
        }
        break;
    case 11:
    {
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[8];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[9];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] -= 2;
        task->data[3] = 6;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    }
    case 12:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) != 0)
        {
            DestroySprite(sprite);
            task->data[0]++;
        }
        break;
    case 13:
        if (task->data[12] == 0)
        {
            DestroyAnimVisualTask(taskId);
        }
        break;
    case 255:
        task->data[1]++;
        if (task->data[1] > 5)
        {
            task->data[1] = 0;
            task->data[0] = task->data[15];
        }
        break;
    }
}

s16 sub_80CC338(struct Sprite* sprite)
{
    s16 var = 8;
    if (sprite->data[4] < sprite->pos1.y)
        var = -var;

    return var;
}

void sub_80CC358(struct Task* task, u8 taskId)
{
    task->data[14]++;
    if (task->data[14] > 0)
    {
        u8 spriteId;
        s16 spriteX;
        s16 spriteY;
        task->data[14] = 0;
        spriteX = gSprites[task->data[2]].pos1.x + gSprites[task->data[2]].pos2.x;
        spriteY = gSprites[task->data[2]].pos1.y + gSprites[task->data[2]].pos2.y;
        spriteId = CreateSprite(&gSpriteTemplate_83D6884, spriteX, spriteY, task->data[4]);
        if (spriteId != 0x40)
        {
            gSprites[spriteId].data[6] = taskId;
            gSprites[spriteId].data[7] = 12;
            gTasks[taskId].data[12]++;
            gSprites[spriteId].data[0] = task->data[13] & 1;
            gTasks[taskId].data[13]++;
            StartSpriteAnim(&gSprites[spriteId], task->data[3]);
            gSprites[spriteId].subpriority = task->data[4];
            gSprites[spriteId].callback = sub_80CC408;
        }
    }
}

void sub_80CC408(struct Sprite* sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] > 1)
    {
        sprite->data[0] = 0;
        sprite->invisible ^= 1;
        sprite->data[1]++;
        if (sprite->data[1] > 8)
        {
            gTasks[sprite->data[6]].data[sprite->data[7]]--;
            DestroySprite(sprite);
        }
    }
}

void sub_80CC474(struct Sprite* sprite)
{
    u8 bank;
    if (!gBattleAnimArgs[6])
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    if (GetBankSide(bank) != 0)
    {
        sprite->data[4] = 0;
        sprite->data[2] = gBattleAnimArgs[3];
        sprite->pos1.x = 0xFFF0;
    }
    else
    {
        sprite->data[4] = 1;
        sprite->data[2] = -gBattleAnimArgs[3];
        sprite->pos1.x = 0x100;
    }

    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[3] = gBattleAnimArgs[4];
    switch (gBattleAnimArgs[5])
    {
    case 0:
        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->oam.priority = sub_8079ED4(bank);
        break;
    case 1:
        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->oam.priority = sub_8079ED4(bank) + 1;
        break;
    case 2:
        sprite->pos1.y = sub_8077ABC(bank, 3) + gBattleAnimArgs[0];
        sprite->oam.priority = sub_8079ED4(bank);
        break;
    case 3:
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[0];
        GetAnimBankSpriteId(1);
        sprite->oam.priority = sub_8079ED4(bank) + 1;
        break;
    }

    sprite->callback = sub_80CC580;
}

void sub_80CC580(struct Sprite* sprite)
{
    int a = sprite->data[7];
    sprite->data[7]++;
    sprite->pos2.y = (sprite->data[1] * gSineTable[sprite->data[0]]) >> 8;
    sprite->pos2.x = sprite->data[2] * a;
    sprite->data[0] = (sprite->data[3] * a) & 0xFF;
    if (sprite->data[4] == 0)
    {
        if (sprite->pos2.x + sprite->pos1.x <= 0xF7)
            return;
    }
    else
    {
        if (sprite->pos2.x + sprite->pos1.x > -16)
            return;
    }

    move_anim_8074EE0(sprite);
}

void sub_80CC5F8(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        task->data[8] = IndexOfSpritePaletteTag(0x274f) * 16 + 256;
        task->data[12] = IndexOfSpritePaletteTag(0x27b0) * 16 + 256;
        task->data[0]++;
        break;
    case 1:
        task->data[9]++;
        if (task->data[9] >= 0)
        {
            task->data[9] = 0;
            BlendPalette(task->data[8], 0x10, task->data[10], gUnknown_083D6984[task->data[11]]);
            BlendPalette(task->data[12], 0x10, task->data[10], gUnknown_083D6984[task->data[11]]);
            task->data[10]++;
            if (task->data[10] == 17)
            {
                task->data[10] = 0;
                task->data[11]++;
                if (task->data[11] == 7)
                    task->data[11] = 0;
            }
        }
        break;
    }

    if (gBattleAnimArgs[7] == -1)
        DestroyAnimVisualTask(taskId);
}

void sub_80CC6CC(struct Sprite* sprite)
{
    u8 a;
    u8 b;
    u16 c;
    u16 x;
    u16 y;

    if (gBattleAnimArgs[4] == 0)
    {
        move_anim_8072740(sprite);
    }
    else
    {
        if (gBattleAnimArgs[0] == 0)
        {
            a = sub_8077ABC(gBattleAnimBankAttacker, 2);
            b = sub_8077ABC(gBattleAnimBankAttacker, 3);
        }
        else
        {
            a = sub_8077ABC(gBattleAnimBankTarget, 2);
            b = sub_8077ABC(gBattleAnimBankTarget, 3);
        }

        sprite->data[0] = gBattleAnimArgs[4];
        if (gBattleAnimArgs[1] == 0)
        {
            sprite->pos1.x = gBattleAnimArgs[2] + a;
            sprite->pos1.y = gBattleAnimArgs[3] + b;
            sprite->data[5] = a;
            sprite->data[6] = b;
        }
        else
        {
            sprite->pos1.x = a;
            sprite->pos1.y = b;
            sprite->data[5] = gBattleAnimArgs[2] + a;
            sprite->data[6] = gBattleAnimArgs[3] + b;
        }

        x = sprite->pos1.x;
        sprite->data[1] = x * 16;
        y = sprite->pos1.y;
        sprite->data[2] = y * 16;
        sprite->data[3] = (sprite->data[5] - sprite->pos1.x) * 16 / gBattleAnimArgs[4];
        sprite->data[4] = (sprite->data[6] - sprite->pos1.y) * 16 / gBattleAnimArgs[4];
        c = sub_80790F0(sprite->data[5] - x, sprite->data[6] - y);
        if (NotInBattle())
            c -= 0x8000;

        sub_8078FDC(sprite, 0, 0x100, 0x100, c);
        sprite->callback = sub_80CC7D4;
    }
}

void sub_80CC7D4(struct Sprite* sprite)
{
    if (sprite->data[0])
    {
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->pos1.x = sprite->data[1] >> 4 ;
        sprite->pos1.y = sprite->data[2] >> 4 ;
        sprite->data[0]--;
    }
    else
    {
        move_anim_8074EE0(sprite);
    }
}

void sub_80CC810(struct Sprite* sprite)
{
    if (sprite->animEnded)
        move_anim_8072740(sprite);
}

void sub_80CC82C(struct Sprite* sprite)
{
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CC884(struct Sprite* sprite)
{
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
        StartSpriteAnim(sprite, 1);

    sprite->callback = sub_80CC810;
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
}

void sub_80CC8C8(struct Sprite* sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[4];
    sprite->data[5] = gBattleAnimArgs[5];
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[6]);
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078504;
}

void sub_80CC914(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 0);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 1);
    if (GetBankSide(gBattleAnimBankTarget) == 0)
        sprite->pos1.y += 8;

    sprite->callback = sub_80CCB00;
    if (gBattleAnimArgs[2] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->hFlip = 1;
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[1] -= 0x400;
    sprite->data[2] += 0x400;
    sprite->data[5] = gBattleAnimArgs[2];
    if (sprite->data[5] == 1)
        sprite->data[1] = -sprite->data[1];
}

void sub_80CC9BC(struct Sprite* sprite)
{
    u8 a;
    u8 b;
    switch (gBattleAnimArgs[3])
    {
    case 1:
        a = sub_8077ABC(gBattleAnimBankTarget ^ 2, 0);
        b = sub_8077ABC(gBattleAnimBankTarget ^ 2, 1);
        break;
    case 2:
        a = sub_8077ABC(gBattleAnimBankTarget, 0);
        b = sub_8077ABC(gBattleAnimBankTarget, 1);
        if (IsAnimBankSpriteVisible(gBattleAnimBankTarget ^ 2))
        {
            a = (sub_8077ABC(gBattleAnimBankTarget ^ 2, 0) + a) / 2;
            b = (sub_8077ABC(gBattleAnimBankTarget ^ 2, 1) + b) / 2;
        }
        break;
    case 0:
    default:
        a = sub_8077ABC(gBattleAnimBankTarget, 0);
        b = sub_8077ABC(gBattleAnimBankTarget, 1);
        break;
    }

    sprite->pos1.x = a;
    sprite->pos1.y = b;
    if (GetBankSide(gBattleAnimBankTarget) == 0)
        sprite->pos1.y += 8;

    sprite->callback = sub_80CCB00;
    if (gBattleAnimArgs[2] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->hFlip = 1;
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[1] -= 0x400;
    sprite->data[2] += 0x400;
    sprite->data[5] = gBattleAnimArgs[2];
    if (sprite->data[5] == 1)
        sprite->data[1] = -sprite->data[1];
}

void sub_80CCB00(struct Sprite* sprite)
{
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];
    if (sprite->data[5] == 0)
        sprite->data[1] += 0x18;
    else
        sprite->data[1] -= 0x18;

    sprite->data[2] -= 0x18;
    sprite->pos2.x = sprite->data[3] >> 8;
    sprite->pos2.y = sprite->data[4] >> 8;
    sprite->data[0]++;
    if (sprite->data[0] == 20)
    {
        StoreSpriteCallbackInData(sprite, move_anim_8072740);
        sprite->data[0] = 3;
        sprite->callback = sub_80782D8;
    }
}

void unref_sub_80CCB6C(struct Sprite* sprite)
{
    if (sprite->data[2] > 1)
    {
        if (sprite->data[3] & 1)
        {
            sprite->invisible = 0;
            gSprites[sprite->data[0]].invisible = 0;
            gSprites[sprite->data[1]].invisible = 0;
        }
        else
        {
            sprite->invisible = 1;
            gSprites[sprite->data[0]].invisible = 1;
            gSprites[sprite->data[1]].invisible = 1;
        }

        sprite->data[2] = 0;
        sprite->data[3]++;
    }
    else
    {
        sprite->data[2]++;
    }

    if (sprite->data[3] == 10)
    {
        DestroySprite(&gSprites[sprite->data[0]]);
        DestroySprite(&gSprites[sprite->data[1]]);
        move_anim_8072740(sprite);
    }
}

void sub_80CCC50(struct Sprite* sprite)
{
    sprite->data[0] = gBattleAnimArgs[2];
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
        sprite->pos1.x -= gBattleAnimArgs[0];
    else
        sprite->pos1.x += gBattleAnimArgs[0];

    StartSpriteAnim(sprite, gBattleAnimArgs[5]);
    sprite->data[1] = -gBattleAnimArgs[3];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[3] = gBattleAnimArgs[4];
    sprite->callback = sub_80CCCB4;
    sub_80CCCB4(sprite);
}

void sub_80CCCB4(struct Sprite* sprite)
{
    sprite->pos2.x = Cos(sprite->data[0], 100);
    sprite->pos2.y = Sin(sprite->data[0], 20);
    if (sprite->data[0] <= 0x7F)
        sprite->subpriority = 0;
    else
        sprite->subpriority = 14;

    sprite->data[0] = (sprite->data[0] + sprite->data[1]) & 0xFF;
    sprite->data[5] += 0x82;
    sprite->pos2.y += sprite->data[5] >> 8;
    sprite->data[2]++;
    if (sprite->data[2] == sprite->data[3])
        move_anim_8072740(sprite);
}

void sub_80CCD24(struct Sprite* sprite)
{
    if (NotInBattle() != 0)
    {
        gBattleAnimArgs[1] += 8;
    }

    sprite->pos1.x = sub_8077EE4(gBattleAnimBankAttacker, 0) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077EE4(gBattleAnimBankAttacker, 1) + gBattleAnimArgs[1];
    if (GetBankSide(gBattleAnimBankAttacker) == 0 || NotInBattle())
        sprite->oam.priority = sub_8079ED4(gBattleAnimBankAttacker) + 1;
    else
        sprite->oam.priority = sub_8079ED4(gBattleAnimBankAttacker);

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = (IndexOfSpritePaletteTag(0x2828) << 4) + 0x100;
    sprite->data[7] = 16;
    (*(vu16 *)(0x4000000 + 0x50)) = 0x3F40;
    (*(vu16 *)(0x4000000 + 0x52)) = (sprite->data[7] << 8) | (16 - sprite->data[7]);
    sprite->callback = sub_80CCE0C;
}

void sub_80CCE0C(struct Sprite* sprite)
{
    int a;
    int i;
    sprite->data[5] += 0x60;
    sprite->pos2.x = -(sprite->data[5] >> 8);
    sprite->data[1]++;
    if (sprite->data[1] > 1)
    {
        sprite->data[1] = 0;
        a = gPlttBufferFaded[sprite->data[2] + 1];
        i = 0;
        do
        {
            gPlttBufferFaded[sprite->data[2] + ++i] = gPlttBufferFaded[sprite->data[2] + i + 1];
        } while ( i <= 5 );

        gPlttBufferFaded[sprite->data[2] + 7] = a;
    }

    if (sprite->data[7] > 6 && sprite->data[0] >0 && ++sprite->data[6] > 1)
    {
        sprite->data[6] = 0;
        sprite->data[7] -= 1;
        (*(vu16 *)(0x4000000 + 0x52)) = (sprite->data[7] << 8) | (16 - sprite->data[7]);;
    }

    if (sprite->data[0] >0)
    {
        sprite->data[0] -= 1;
    }
    else if (++sprite->data[6] > 1)
    {
        sprite->data[6] = 0;
        sprite->data[7]++;
        (*(vu16 *)(0x4000000 + 0x52)) = (sprite->data[7] << 8) | (16 - sprite->data[7]);
        if (sprite->data[7] == 16)
        {
            sprite->invisible = 1;
            sprite->callback = sub_807861C;
        }
    }
}

void sub_80CCF04(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3) + 0xFFE8;
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[6] = 0;
    sprite->data[7] = 16;
    (*(vu16 *)(0x4000000 + 0x50)) = 0x3F40;
    (*(vu16 *)(0x4000000 + 0x52)) = (sprite->data[7] << 8) | sprite->data[6];
    sprite->callback = sub_80CCF70;
}

void sub_80CCF70(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[2] > 0)
        {
            sprite->data[2] = 0;
            if (((++sprite->data[1]) & 1) != 0)
            {
                if (sprite->data[6] <= 15)
                    sprite->data[6]++;
            }
            else if (sprite->data[7] > 0)
                sprite->data[7]--;

            (*(vu16 *)(0x4000000 + 0x52)) = (sprite->data[7] << 8) | sprite->data[6];
            if (sprite->data[6] == 16 && sprite->data[7] == 0)
            {
                sprite->data[1] = 0;
                sprite->data[0]++;
            }
        }
        break;
    case 1:
        if (++sprite->data[1] > 8)
        {
            sprite->data[1] = 0;
            StartSpriteAffineAnim(sprite, 1);
            sprite->data[0]++;
        }
        break;
    case 2:
        sub_80CD0CC(sprite, 16, 4);
        if (++sprite->data[1] > 2)
        {
            sprite->data[1] = 0;
            sprite->pos1.y++;
        }

        if (++sprite->data[2] <= 29)
            break;

        if (sprite->data[2] & 1)
        {
            if (sprite->data[6] > 0)
                sprite->data[6]--;
        }
        else if (sprite->data[7] <= 15)
        {
            sprite->data[7]++;
        }

        (*(vu16 *)(0x4000000 + 0x52)) = (sprite->data[7] << 8) | sprite->data[6];
        if (sprite->data[6] == 0 && sprite->data[7] == 16)
        {
            sprite->data[1] = 0;
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 3:
        sprite->invisible = 1;
        sprite->data[0]++;
        break;
    case 4:
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x52)) = 0;
        move_anim_8072740(sprite);
        break;
    }
}

void sub_80CD0CC(struct Sprite* sprite, int unk1, int unk2)
{
    if (sprite->data[3] <= 11)
        sprite->data[4] += 2;

    if ((u16)(sprite->data[3] - 0x12) <= 0x17)
        sprite->data[4] -= 2;

    if ((sprite->data[3]) > 0x2F)
        sprite->data[4] += 2;

    sprite->pos2.x = sprite->data[4] / 9;
    sprite->pos2.y = sprite->data[4] / 14;
    if (sprite->pos2.y < 0)
        sprite->pos2.y *= -1;

    sprite->data[3]++;
    if (sprite->data[3] > 0x3B)
        sprite->data[3] = 0;
}

void sub_80CD140(struct Sprite* sprite)
{
    if (!gBattleAnimArgs[2])
        sub_8078650(sprite);

    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[5];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sprite->callback = sub_8078394;
}

void sub_80CD190(struct Sprite* sprite)
{
    u8 bank;
    if (!gBattleAnimArgs[2])
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    if (IsDoubleBattle() && IsAnimBankSpriteVisible(bank ^ 2))
    {
        sub_807A3FC(bank, gBattleAnimArgs[6], &sprite->pos1.x, &sprite->pos1.y);
        sub_807867C(sprite, gBattleAnimArgs[0]);
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    else
    {
        if (!gBattleAnimArgs[6])
        {
            sprite->pos1.x = sub_8077ABC(bank, 0);
            sprite->pos1.y = sub_8077ABC(bank, 1) + gBattleAnimArgs[1];
        }
        else
        {
            sprite->pos1.x = sub_8077ABC(bank, 2);
            sprite->pos1.y = sub_8077ABC(bank, 3) + gBattleAnimArgs[1];
        }

        sub_807867C(sprite, gBattleAnimArgs[0]);
    }

    sprite->data[0] = gBattleAnimArgs[5];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sprite->callback = sub_8078394;
}

void sub_80CD274(struct Sprite* sprite)
{
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        StartSpriteAnim(sprite, 1);
    }

    sprite->callback = sub_80CD2D4;
}

void sub_80CD2D4(struct Sprite* sprite)
{
    if (++sprite->data[0] > 30)
    {
        sprite->pos2.y = (30 - sprite->data[0]) / 3;
        sprite->pos2.x = Sin(sprite->data[1] * 4, 3);
        sprite->data[1]++;
    }

    if (sprite->animEnded)
        move_anim_8072740(sprite);
}

void sub_80CD328(struct Sprite* sprite)
{
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[3] = 1;
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[3] = 0xFFFF;
        StartSpriteAffineAnim(sprite, 1);
    }

    sprite->callback = sub_80CD394;
}

void sub_80CD394(struct Sprite* sprite)
{
    sprite->pos2.y = -(sprite->data[0] / 0x28);
    sprite->pos2.x = sprite->data[4] / 10;
    sprite->data[4] += sprite->data[3] * 2;
    sprite->data[0] += sprite->data[1];
    if (++sprite->data[1] > 0x3C)
        move_anim_8074EE0(sprite);
}

void sub_80CD3E0(struct Sprite* sprite)
{
    sprite->pos1.x -= 32;
    sprite->pos1.y -= 32;
    sprite->data[0] = 20;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, sub_80CD408);
}

void sub_80CD408(struct Sprite* sprite)
{
    switch (sprite->data[5] & 1)
    {
    case 0:
        sprite->data[0] = 1;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CD408);
        break;
    case 1:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[0] = 8;
        sprite->data[2] = sprite->pos1.x + gUnknown_083D6DDC[sprite->data[5] >> 8][0];
        sprite->data[4] = sprite->pos1.y + gUnknown_083D6DDC[sprite->data[5] >> 8][1];
        sprite->callback = sub_8078B34;
        StoreSpriteCallbackInData(sprite, sub_80CD4B8);
        sprite->data[5] += 0x100;
        PlaySE12WithPanning(0xD2, sub_8076F98(0x3F));
        break;
    }

    sprite->data[5] ^= 1;
}

void sub_80CD4B8(struct Sprite* sprite)
{
    if ((sprite->data[5] >> 8) == 4)
    {
        sprite->data[0] = 10;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CD4EC);
    }
    else
    {
        sprite->callback = sub_80CD408;
    }
}

void sub_80CD4EC(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    if (sprite->oam.affineParam == 0)
    {
        sprite->data[0] = 3;
        sprite->data[1] = 0;
        sprite->data[2] = 0;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CD5A8);
    }
    else
    {
        switch (sprite->oam.affineParam)
        {
        case 1:
            a = -8;
            b = -8;
            break;
        case 2:
            a = -8;
            b = 8;
            break;
        case 3:
            a = 8;
            b = -8;
            break;
        default:
            a = 8;
            b = 8;
            break;
        }

        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[0] = 6;
        sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + a;
        sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + b;
        sprite->callback = sub_8078B34;
        StoreSpriteCallbackInData(sprite, sub_80CD654);
    }
}

void sub_80CD5A8(struct Sprite* sprite)
{
    if (sprite->data[2] == 0)
    {
        if ((sprite->data[1] += 3) > 16)
            sprite->data[1] = 16;
    }
    else if ((sprite->data[1] -= 3) < 0)
    {
        sprite->data[1] = 0;
    }

    BlendPalettes(sub_80791A8(1, 1, 1, 1, 1, 0, 0), sprite->data[1], 0x7FFF);
    if (sprite->data[1] == 16)
    {
        int pal;
        sprite->data[2]++;
        pal = sprite->oam.paletteNum;
        LoadPalette(&gPlttBufferUnfaded[0x108 + pal * 16], pal * 16 | 0x101, 4);
        PlaySE12WithPanning(0xC0, sub_8076F98(0x3F));
    }
    else if (sprite->data[1] == 0)
    {
        sprite->callback = sub_80CD654;
    }
}

void sub_80CD654(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->data[1] = 0;
        sprite->data[0] = 0;
        sprite->callback = sub_80CD67C;
    }
}

void sub_80CD67C(struct Sprite* sprite)
{
    if (sprite->data[0] % 3 == 0)
    {
        sprite->data[1]++;
        sprite->invisible ^= 1;
    }

    sprite->data[0]++;
    if (sprite->data[1] == 8)
        move_anim_8072740(sprite);
}

void sub_80CD6CC(struct Sprite* sprite)
{
    sprite->oam.affineParam = gBattleAnimArgs[0];
    if ((s16)sprite->oam.affineParam == 1)
    {
        sprite->pos1.x -= 0x18;
        sprite->pos1.y -= 0x18;
    }
    else if ((s16)sprite->oam.affineParam == 2)
    {
        sprite->pos1.x -= 0x18;
        sprite->pos1.y += 0x18;
        sprite->oam.matrixNum = 16;
    }
    else if ((s16)sprite->oam.affineParam == 3)
    {
        sprite->pos1.x += 0x18;
        sprite->pos1.y -= 0x18;
        sprite->oam.matrixNum = 8;
    }
    else
    {
        sprite->pos1.x += 0x18;
        sprite->pos1.y += 0x18;
        sprite->oam.matrixNum = 24;
    }

    sprite->oam.tileNum = (sprite->oam.tileNum + 16);
    sprite->callback = sub_80CD3E0;
    sub_80CD3E0(sprite);
}

void sub_80CD774(struct Sprite* sprite)
{
    sprite->invisible = 1;
    sprite->data[0] = 0;
    switch (gBattleAnimArgs[0])
    {
    case 0:
        sprite->callback = sub_80CD7CC;
        break;
    case 1:
        sprite->callback = sub_80CD8A8;
        break;
    case 2:
        sprite->callback = sub_80CD8F8;
        break;
    default:
        sprite->callback = sub_80CD9B8;
        break;
    }
}

void sub_80CD7CC(struct Sprite* sprite)
{
    sprite->data[0] = 6;
    sprite->data[1] = (GetBankSide(gBattleAnimBankAttacker)) ? 2 : -2;
    sprite->data[2] = 0;
    sprite->data[3] = gObjectBankIDs[gBattleAnimBankAttacker];
    StoreSpriteCallbackInData(sprite, sub_80CD81C);
    sprite->callback = sub_8078458;
}

void sub_80CD81C(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[3] = gObjectBankIDs[gBattleAnimBankAttacker];
        sub_8078E70(sprite->data[3], 0);
        sprite->data[4] = (sprite->data[6] = GetBankSide(gBattleAnimBankAttacker)) ? 0x300 : 0xFFFFFD00;
        sprite->data[5] = 0;
    }

    sprite->data[5] += sprite->data[4];
    obj_id_set_rotscale(sprite->data[3], 0x100, 0x100, sprite->data[5]);
    sub_8078F9C(sprite->data[3]);
    if (++sprite->data[0] > 3)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80CD9B8;
    }
}

void sub_80CD8A8(struct Sprite* sprite)
{
    sprite->data[0] = 4;
    sprite->data[1] = (GetBankSide(gBattleAnimBankAttacker)) ? -3 : 3;
    sprite->data[2] = 0;
    sprite->data[3] = gObjectBankIDs[gBattleAnimBankAttacker];
    StoreSpriteCallbackInData(sprite, sub_80CD9B8);
    sprite->callback = sub_8078458;
}

void sub_80CD8F8(struct Sprite* sprite)
{
    if (++sprite->data[0] > 8)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80CD91C;
    }
}

void sub_80CD91C(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[3] = gObjectBankIDs[gBattleAnimBankAttacker];
        sprite->data[6] = GetBankSide(gBattleAnimBankAttacker);
        if (GetBankSide(gBattleAnimBankAttacker))
        {
            sprite->data[4] = 0xFC00;
            sprite->data[5] = 0xC00;
        }
        else
        {
            sprite->data[4] = 0x400;
            sprite->data[5] = 0xF400;
        }
    }

    sprite->data[5] += sprite->data[4];
    obj_id_set_rotscale(sprite->data[3], 0x100, 0x100, sprite->data[5]);
    sub_8078F9C(sprite->data[3]);
    if (++sprite->data[0] > 2)
    {
        sub_8078F40(sprite->data[3]);
        sprite->callback = sub_80CD9B8;
    }
}

void sub_80CD9B8(struct Sprite* sprite)
{
    move_anim_8072740(sprite);
}

void sub_80CD9C4(struct Sprite* sprite)
{
    sprite->data[0] = 0;
    sprite->callback = sub_80CD9D4;
}

void sub_80CD9D4(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = 0;
        sprite->data[2] = gObjectBankIDs[gBattleAnimBankAttacker];
        sprite->data[3] = GetBankSide(gBattleAnimBankAttacker);
        sprite->data[4] = (sprite->data[3] != 0) ? 0x200 : -0x200;
        sprite->data[5] = 0;
        sub_8078E70(sprite->data[2], 0);
        sprite->data[0]++;
    case 1:
        sprite->data[5] += sprite->data[4];
        obj_id_set_rotscale(sprite->data[2], 0x100, 0x100, sprite->data[5]);
        sub_8078F9C(sprite->data[2]);
        if (++sprite->data[1] > 3)
        {
            sprite->data[1] = 0;
            sprite->data[4] *= -1;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[5] += sprite->data[4];
        obj_id_set_rotscale(sprite->data[2], 0x100, 0x100, sprite->data[5]);
        sub_8078F9C(sprite->data[2]);
        if (++sprite->data[1] > 3)
        {
            sub_8078F40(sprite->data[2]);
            move_anim_8072740(sprite);
        }
        break;
    }
}

void sub_80CDAC8(u8 taskId)
{ u8 a;
    gTasks[taskId].data[0] = gObjectBankIDs[gBattleAnimBankAttacker];
    a = GetBankSide(gBattleAnimBankAttacker);
    gTasks[taskId].data[1] = a;
    gTasks[taskId].data[2] = 0;
    switch (gBattleAnimArgs[0])
    {
    default:
        DestroyAnimVisualTask(taskId);
        break;
    case 0:
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 8;
        gTasks[taskId].data[4] = 0;
        gTasks[taskId].data[5] = 3;
        if (a == 0)
            gTasks[taskId].data[5] *= -1;

        gTasks[taskId].func = sub_80CDB60;
        break;
    case 1:
        gTasks[taskId].data[3] = 8;
        gTasks[taskId].data[4] = 0x600;
        gTasks[taskId].data[5] = 0xC0;
        if (a == 0)
        {
            gTasks[taskId].data[4] = -gTasks[taskId].data[4];
            gTasks[taskId].data[5] = -gTasks[taskId].data[5];
        }

        gTasks[taskId].func = sub_80CDD20;
        break;
    }
}

void sub_80CDB60(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[2])
    {
    case 0:
        if (task->data[3])
        {
            task->data[4] += task->data[5];
            gSprites[task->data[0]].pos2.x = task->data[4];
            task->data[3]--;
        }
        else
        {
            task->data[3] = 8;
            task->data[4] = 0;
            task->data[5] = (task->data[1] == 0) ? -0xC0 : 0xC0;
            sub_8078E70(task->data[0], 0);
            task->data[2]++;
        }
        break;
    case 1:
        if (task->data[3])
        {
            task->data[4] += task->data[5];
            obj_id_set_rotscale(task->data[0], 0x100, 0x100, task->data[4]);
            sub_8078F9C(task->data[0]);
            task->data[3]--;
        }
        else
        {
            task->data[3] = 8;
            task->data[4] = gSprites[task->data[0]].pos2.x;
            task->data[5] = (task->data[1] == 0) ? 0x2 : -0x2;
            task->data[6] = 1;
            task->data[2]++;
        }
        break;
    case 2:
        if (task->data[3])
        {
            if (task->data[6])
            {
                task->data[6]--;
            }
            else
            {
                if (task->data[3] & 1)
                    gSprites[task->data[0]].pos2.x = task->data[4] + task->data[5];
                else
                    gSprites[task->data[0]].pos2.x = task->data[4] - task->data[5];

                task->data[6] = 1;
                task->data[3]--;
            }
        }
        else
        {
            gSprites[task->data[0]].pos2.x = task->data[4];
            task->data[3] = 12;
            task->data[2]++;
        }
        break;
    case 3:
        if (task->data[3])
        {
            task->data[3]--;
        }
        else
        {
            task->data[3] = 3;
            task->data[4] = gSprites[task->data[0]].pos2.x;
            task->data[5] = (task->data[1] == 0) ? 8 : -8;
            task->data[2]++;
        }
        break;
    case 4:
        if (task->data[3])
        {
            task->data[4] += task->data[5];
            gSprites[task->data[0]].pos2.x = task->data[4];
            task->data[3]--;
        }
        else
        {
            DestroyAnimVisualTask(taskId);
        }
        break;
    }
}

void sub_80CDD20(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (task->data[3])
    {
        task->data[4] -= task->data[5];
        obj_id_set_rotscale(task->data[0], 0x100, 0x100, task->data[4]);
        sub_8078F9C(task->data[0]);
        task->data[3]--;
    }
    else
    {
        sub_8078F40(task->data[0]);
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80CDD74(struct Sprite* sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3) + gBattleAnimArgs[2];
    }
    else
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[2];
    }

    sprite->data[0] = 0;
    sprite->data[1] = 0;
    StoreSpriteCallbackInData(sprite, sub_80CDEC0);
    sprite->callback = sub_8078600;
}

void sub_80CDDDC(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2) + 0xFFD0;
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3);
    StoreSpriteCallbackInData(sprite, sub_80CDE78);
    sprite->callback = sub_8078600;
}

void sub_80CDE24(struct Sprite* sprite)
{
    sprite->pos1.x = sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2) + 0xFFD0 + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3);
    StartSpriteAnim(sprite, 1);
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = sub_80CDEC0;
}

void sub_80CDE78(struct Sprite* sprite)
{
    if (++sprite->data[0] > 8)
    {
        sprite->data[0] = 12;
        sprite->data[1] = 8;
        sprite->data[2] = 0;
        StoreSpriteCallbackInData(sprite, sub_80CDEB0);
        sprite->callback = sub_8078364;
    }
}

void sub_80CDEB0(struct Sprite* sprite)
{
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = sub_80CDEC0;
}

void sub_80CDEC0(struct Sprite* sprite)
{
    if (++sprite->data[0] > 1)
    {
        sprite->data[0] = 0;
        sprite->invisible = !sprite->invisible;
        if (++sprite->data[1] > 8)
            move_anim_8072740(sprite);
    }
}

void sub_80CDF0C(struct Sprite* sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 1) + gBattleAnimArgs[2];
    }
    else
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 1) + gBattleAnimArgs[2];
    }

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80CDF70;
}

void sub_80CDF70(struct Sprite* sprite)
{
    if (++sprite->data[0] > sprite->data[1])
    {
        sprite->data[0] = 0;
        sprite->pos1.y--;
    }

    sprite->pos1.y -= sprite->data[0];
    if (sprite->animEnded)
        move_anim_8072740(sprite);
}

void sub_80CDFB0(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3) - 12;
    sprite->data[0] = 0;
    sprite->data[1] = 2;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = sub_8076F98(-0x40);
    sprite->callback = sub_80CE000;
}

void sub_80CE000(struct Sprite* sprite)
{
    if (++sprite->data[0] >= sprite->data[1])
    {
        sprite->invisible = !sprite->invisible;
        if (!sprite->invisible)
        {
            sprite->data[4]++;
            if (!(sprite->data[4] & 1))
                PlaySE12WithPanning(SE_W207B, sprite->data[5]);
        }

        sprite->data[0] = 0;
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->data[1]++;
        }
    }

    if (sprite->animEnded && sprite->data[1] > 16 && sprite->invisible)
        move_anim_8072740(sprite);
}

void sub_80CE09C(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 0) + gBattleAnimArgs[0];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 1) + gBattleAnimArgs[1];
        if (NotInBattle())
            sprite->pos1.y += 10;
        sprite->data[0]++;
    }

    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
        move_anim_8072740(sprite);
}

void sub_80CE108(u8 taskId)
{
    if (gTasks[taskId].data[2] == 1)
    {
        gBattleAnimArgs[7] = 0xFFFF;
        gTasks[taskId].data[2]++;
    }
    else if (gTasks[taskId].data[2] == 2)
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        if (++gTasks[taskId].data[0] == 4)
        {
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].data[1]++;
            (*(vu16 *)(0x4000000 + 0x52)) = (gTasks[taskId].data[1] << 8) | (16 - gTasks[taskId].data[1]);
            if (gTasks[taskId].data[1] == 16)
                gTasks[taskId].data[2]++;
        }
    }
}

void sub_80CE17C(struct Sprite* sprite)
{
    sub_8078764(sprite, 0);
    sprite->animPaused = 1;
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = sub_80CE1AC;
}

void sub_80CE1AC(struct Sprite* sprite)
{
    if (sprite->data[0])
    {
        sprite->data[0]--;
    }
    else
    {
        sprite->animPaused = 0;
        sprite->data[0] = 30;
        sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 2);
        sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3);
        sprite->callback = sub_8078B34;
        StoreSpriteCallbackInData(sprite, move_anim_8072740);
    }
}

void sub_80CE210(u8 taskId)
{
    if (++gTasks[taskId].data[0] == 4)
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1]++;
        (*(vu16 *)(0x4000000 + 0x52)) = gTasks[taskId].data[1] | ((16 - gTasks[taskId].data[1]) << 8);
        if (gTasks[taskId].data[1] == 16)
            DestroyAnimVisualTask(taskId);
    }
}

void unref_sub_80CE260(u8 taskId)
{
    u8 i;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (gBattleAnimArgs[0] == 1 && GetBankSide(i) == 0)
            sub_8043DB0(gHealthboxIDs[i]);

        if (gBattleAnimArgs[1] == 1 && GetBankSide(i) == 1)
            sub_8043DB0(gHealthboxIDs[i]);
    }

    DestroyAnimVisualTask(taskId);
}

void unref_sub_80CE2D4(u8 taskId)
{
    u8 i;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        sub_8043DFC(gHealthboxIDs[i]);
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80CE30C(struct Sprite* sprite)
{
    if (NotInBattle())
    {
        sprite->pos1.x = 0x30;
        sprite->pos1.y = 0x28;
    }
    else
    {
        sprite->pos1.x = gBattleAnimArgs[0];
        sprite->pos1.y = gBattleAnimArgs[1];
    }

    sprite->oam.shape = 0;
    sprite->oam.size = 3;
    sprite->data[0] = 0;
    sprite->callback = sub_80CE354;
}

void sub_80CE354(struct Sprite* sprite)
{
    if (sprite->data[0])
        move_anim_8072740(sprite);
}

void sub_80CE36C(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = gBattleAnimArgs[1];
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 1;
    sprite->callback = sub_80CE3B0;
}

void sub_80CE3B0(struct Sprite* sprite)
{
    if (++sprite->data[1] > 1)
    {
        sprite->data[1] = 0;
        if (sprite->data[2] <= 0x77)
        {
            sprite->pos1.y++;
            sprite->data[2]++;
        }
    }

    if (sprite->data[0])
        move_anim_8072740(sprite);
}

void sub_80CE3EC(u8 taskId)
{
    int a = sub_80791A8(1, 0, 0, 0, 0, 0, 0) & 0xFFFF;
    int b;
    int c;
    int d;

    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = a;
    gTasks[taskId].data[4] = 0;
    gTasks[taskId].data[5] = 0;
    gTasks[taskId].data[6] = 0;
    gTasks[taskId].data[7] = 13;
    gTasks[taskId].data[8] = 14;
    gTasks[taskId].data[9] = 15;
    b = sub_80792C0(1, 1, 1, 1);
    c = a | b;
    sub_8079BF4(&gTasks[taskId].data[14], &gTasks[taskId].data[15], (void*)c);
    b = b | (0x10000 << IndexOfSpritePaletteTag(0x27D2));
    d = IndexOfSpritePaletteTag(0x27D3);
    BeginNormalPaletteFade((0x10000 << d) | b, 0, 0, 0x10, 32699);
    gTasks[taskId].func = sub_80CE4D4;
    sub_80CE4D4(taskId);
}

void sub_80CE4D4(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 0)
        {
            u16 color;
            u16 bitmask;
            u16 r3;
            u16 i;
            u16 j;
            task->data[1] = 0;
            if (++task->data[2] <= 15)
            {
                u16 red;
                u16 green;
                u16 blue;
                task->data[4] += task->data[7];
                task->data[5] += task->data[8];
                task->data[6] += task->data[9];
                red = task->data[4] >> 3;
                green = task->data[5] >> 3;
                blue = task->data[6] >> 3;
                color = ((red) | ((green) << 5) | ((blue) << 10));
            }
            else
            {
                color = ((27) | ((29) << 5) | ((31) << 10));
                task->data[0]++;
            }

            bitmask = 1;
            r3 = 0;
            for (i = 0; i <= 15; i++)
            {
                if (task->data[3] & bitmask)
                {
                    for (j = 1; j <= 15; j++)
                    {
                        gPlttBufferFaded[r3 + j] = color;
                    }
                }

                bitmask <<= 1;
                r3 += 16;
            }
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            u8 spriteId;
            for (spriteId = 0; spriteId < 64; spriteId++)
            {
                if (gSprites[spriteId].template == &gBattleAnimSpriteTemplate_83D6FC8 || gSprites[spriteId].template == &gBattleAnimSpriteTemplate_83D6FF8)
                    gSprites[spriteId].data[0] = 1;
            }

            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        if (++task->data[1] > 30)
        {
            BeginNormalPaletteFade((u32)sub_8079BFC(task->data[14], task->data[15]), 0, 16, 0, ((27) | ((29) << 5) | ((31) << 10)));
            task->data[0]++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80CE670(struct Sprite* sprite)
{
    if (gBattleAnimArgs[2] <= 1)
        gBattleAnimArgs[2] = 2;

    if (gBattleAnimArgs[2] > 0x7F)
        gBattleAnimArgs[2] = 0x7F;

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[1];
    sprite->data[6] = sprite->pos1.x;
    sprite->data[7] = sprite->pos1.y;
    if (NotInBattle() != 0)
    {
        sprite->oam.matrixNum = 8;
        sprite->pos1.x += 40;
        sprite->pos1.y += 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = -0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = -0xA00 / sprite->data[1];
    }
    else if (GetBankSide(gBattleAnimBankAttacker) == 0)
    {
        sprite->pos1.x -= 40;
        sprite->pos1.y += 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = 0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = -0xA00 / sprite->data[1];
    }
    else
    {
        sprite->pos1.x += 40;
        sprite->pos1.y -= 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = -0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = 0xA00 / sprite->data[1];
        sprite->oam.matrixNum = 24;
    }

    sprite->callback = sub_80CE798;
}

void sub_80CE798(struct Sprite* sprite)
{
    sprite->data[2] += sprite->data[3];
    sprite->data[4] += sprite->data[5];
    sprite->pos1.x = sprite->data[2] >> 7;
    sprite->pos1.y = sprite->data[4] >> 7;
    if (--sprite->data[1] == 1)
    {
        sprite->pos1.x = sprite->data[6];
        sprite->pos1.y = sprite->data[7];
    }

    if (sprite->data[1] == 0)
        move_anim_8072740(sprite);
}


void sub_80CE7E0(u8 taskId)
{
    u16 i;
    int obj;
    u16 r3;
    u16 r4;
    struct Task* task = &gTasks[taskId];
    task->data[0] = GetAnimBankSpriteId(0);
    task->data[1] = AllocSpritePalette(0x2771);
    r3 = (task->data[1] * 16) + 0x100;
    r4 = (gSprites[task->data[0]].oam.paletteNum + 16) << 4;
    for (i = 1; i < 16; i++)
    {
        gPlttBufferUnfaded[r3 + i] = gPlttBufferUnfaded[r4 + i];
    }

    BlendPalette(r3, 16, 11, 0);
    task->data[3] = 0;
    i = 0;
    while (i <= 1 && (obj = duplicate_obj_of_side_rel2move_in_transparent_mode(0)) >= 0)
    {
        gSprites[obj].oam.paletteNum = task->data[1];
        gSprites[obj].data[0] = 0;
        gSprites[obj].data[1] = i << 7;
        gSprites[obj].data[2] = taskId;
        gSprites[obj].callback = sub_80CE974;
        task->data[3]++;
        i++;
    }

    task->func = sub_80CE910;
    if (GetBankIdentity_permutated(gBattleAnimBankAttacker) == 1)
    {
        (*(vu16 *)(0x4000000 + 0x0)) &= 0xFDFF;
    }
    else
    {
        (*(vu16 *)(0x4000000 + 0x0)) &= 0xFBFF;
    }
}

void sub_80CE910(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (!task->data[3])
    {
        if (GetBankIdentity_permutated(gBattleAnimBankAttacker) == 1)
            (*(vu16 *)(0x4000000 + 0x0)) |= 0x200;
        else
            (*(vu16 *)(0x4000000 + 0x0)) |= 0x400;

        FreeSpritePaletteByTag(0x2771);
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80CE974(struct Sprite* sprite)
{
    if (++sprite->data[3] > 1)
    {
        sprite->data[3] = 0;
        sprite->data[0]++;
    }

    if (sprite->data[0] > 0x40)
    {
        gTasks[sprite->data[2]].data[3]--;
        obj_delete_but_dont_free_vram(sprite);
    }
    else
    {
        sprite->data[4] = gSineTable[sprite->data[0]] / 6;
        sprite->data[5] = gSineTable[sprite->data[0]] / 13;
        sprite->data[1] = (sprite->data[1] + sprite->data[5]) & 0xFF;
        sprite->pos2.x = Sin(sprite->data[1], sprite->data[4]);
    }
}

void sub_80CEA04(struct Sprite* sprite)
{
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sprite->callback = sub_8078600;
}


void sub_80CEA20(u8 taskId)
{
    u16 i;
    u16 j;
    u16 index;

    index = IndexOfSpritePaletteTag(gUnknown_083D712C[0][0]);
    if (index != 0xFF)
    {
        index = (index << 4) + 0x100;
        for (i = 1; i < 6; i++)
        {
            gPlttBufferFaded[index + i] = gUnknown_083D712C[0][i];
        }
    }

    for (j = 1; j < 4; j++)
    {
        index = AllocSpritePalette(gUnknown_083D712C[j][0]);
        if (index != 0xFF)
        {
            index = (index << 4) + 0x100;
            for (i = 1; i < 6; i++)
            {
                gPlttBufferFaded[index + i] = gUnknown_083D712C[j][i];
            }
        }
    }
    DestroyAnimVisualTask(taskId);
}

void sub_80CEAD8(u8 taskId)
{
    u16 i;
    for (i = 1; i < 4; i++)
    {
        FreeSpritePaletteByTag(gUnknown_083D712C[i][0]);
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80CEB0C(struct Sprite* sprite)
{
    u8 index;
    u8 a;
    u8 b;
    sub_8078650(sprite);
    StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    if ((index = IndexOfSpritePaletteTag(gUnknown_083D712C[gBattleAnimArgs[1]][0])) != 0xFF)
        sprite->oam.paletteNum = index;

    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = 0;
    sprite->data[3] = gBattleAnimArgs[2];
    if (NotInBattle())
    {
        a = 0x30;
        b = 0x28;
    }
    else
    {
        a = sub_8077ABC(gBattleAnimBankTarget, 2);
        b = sub_8077ABC(gBattleAnimBankTarget, 3);
    }

    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;
    sub_80CEBC4(a - sprite->pos1.x, b - sprite->pos1.y, &sprite->data[6], &sprite->data[7], 0x28);
    sprite->callback = sub_80CEC1C;
}

void sub_80CEBC4(s16 a, s16 b, s16* c, s16* d, s8 e)
{
    int f;
    int g;
    if (a < 0)
        e = -e;

    f = a << 8;
    g = f / e;
    if (g == 0)
        g = 1;

    *c = f / g;
    *d = (b << 8) / g;
}


void sub_80CEC1C(struct Sprite* sprite)
{
    int b;
    s16 a;
    int c;
    u8 index;
    sprite->data[0]++;
    b = sprite->data[0] * 5 - ((sprite->data[0] * 5 / 256) << 8);
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->pos1.x = sprite->data[4] >> 4;
    sprite->pos1.y = sprite->data[5] >> 4;
    sprite->pos2.y = Sin(b, 15);
    a = (u16)sprite->pos1.y;
    c = (u16)sprite->pos1.x;

    if ((u32)((c + 16) << 16) > (0x110) << 16 || a < -16 || a > 0x80)
    {
        move_anim_8074EE0(sprite);
    }
    else
    {
        if (sprite->data[3] && ++sprite->data[2] > sprite->data[3])
        {
            sprite->data[2] = 0;
            if (++sprite->data[1] > 3)
                sprite->data[1] = 0;

            index = IndexOfSpritePaletteTag(gUnknown_083D712C[sprite->data[1]][0]);
            if (index != 0xFF)
                sprite->oam.paletteNum = index;
        }
    }
}

void sub_80CECE8(struct Sprite* sprite)
{
    int a;
    if (GetBankSide(gBattleAnimBankAttacker) == 1)
    {
        a = gBattleAnimArgs[1];
        (u16)gBattleAnimArgs[1] = -a;
    }

    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3) + gBattleAnimArgs[2];
    StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;
    sprite->data[6] = (gBattleAnimArgs[1] << 4) / 5;
    sprite->data[7] = (gBattleAnimArgs[2] << 7) / 5;
    sprite->callback = sub_80CED78;
}

void sub_80CED78(struct Sprite* sprite)
{
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->pos1.x = sprite->data[4] >> 4;
    sprite->pos1.y = sprite->data[5] >> 4;
    if (sprite->data[0] > 5 && sprite->data[3] == 0)
    {
        sprite->data[2] = (sprite->data[2] + 16) & 0xFF;
        sprite->pos2.x = Cos(sprite->data[2], 18);
        sprite->pos2.y = Sin(sprite->data[2], 18);
        if (sprite->data[2] == 0)
            sprite->data[3] = 1;
    }

    if (++sprite->data[0] == 0x30)
        move_anim_8074EE0(sprite);
}

void sub_80CEDF0(struct Sprite* sprite)
{
    s16 a;
    if (gBattleAnimArgs[0] == 1)
    {
        sprite->oam.matrixNum = 8;
        a = 16;
    }
    else
    {
        a = -16;
    }

    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + a;
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3) + 8;
    sprite->data[0] = 8;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CEE60(struct Sprite* sprite)
{
    s16 a;
    u8 index;
    sub_8078650(sprite);
    sprite->pos1.y += 8;
    StartSpriteAnim(sprite, gBattleAnimArgs[1]);
    index = IndexOfSpritePaletteTag(gUnknown_083D712C[gBattleAnimArgs[2]][0]);
    if (index != 0xFF)
        sprite->oam.paletteNum = index;

    a = (gBattleAnimArgs[0] == 0) ? 0xFFE0 : 0x20;
    sprite->data[0] = 40;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = a + sprite->data[1];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sprite->data[3] - 40;
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80CEEE8;
}

void sub_80CEEE8(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) == 0)
    {
        s16 a;
        a = Sin(sprite->data[5], 8);
        if (sprite->pos2.x < 0)
            a = -a;

        sprite->pos2.x += a;
        sprite->pos2.y += Sin(sprite->data[5], 4);
        sprite->data[5] = (sprite->data[5] + 8) & 0xFF;
    }
    else
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CEF44(u8 bank, struct Sprite* sprite)
{
    if (GetBankSide(bank) == 0)
        sprite->pos1.x = sub_807A100(bank, 5) + 8;
    else
        sprite->pos1.x = sub_807A100(bank, 4) - 8;

    sprite->pos1.y = sub_8077ABC(bank, 3) - (s16)sub_807A100(bank, 0) / 4;
}

void sub_80CEF9C(struct Sprite* sprite)
{
    u8 a;
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sub_80CEF44(bank, sprite);
    a = (GetBankSide(bank) == 0) ? 0 : 1;
    sprite->data[0] = gBattleAnimArgs[1];
    sprite->data[1] = a + 2;
    StartSpriteAnim(sprite, a);
    StoreSpriteCallbackInData(sprite, sub_80CF008);
    sprite->callback = sub_8078600;
}

void sub_80CF008(struct Sprite* sprite)
{
    if (--sprite->data[0] == 0)
    {
        StoreSpriteCallbackInData(sprite, move_anim_8072740);
        StartSpriteAnim(sprite, sprite->data[1]);
        sprite->callback = sub_8078600;
    }
}

void sub_80CF040(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sub_80CEF44(bank, sprite);
    sprite->data[0] = 0;
    StoreSpriteCallbackInData(sprite, sub_80CF088);
    sprite->callback = sub_80785E4;
}

void sub_80CF088(struct Sprite* sprite)
{
    if (++sprite->data[0] > 16)
    {
        StartSpriteAffineAnim(sprite, 1);
        StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
        sprite->callback = sub_80785E4;
    }
}

void sub_80CF0BC(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sprite->pos1.x = sub_8077ABC(bank, 0);
    sprite->pos1.y = sub_807A100(bank, 2);
    if (sprite->pos1.y <= 9)
        sprite->pos1.y = 10;

    sprite->data[0] = 1;
    sprite->data[1] = 0;
    sprite->data[2] = sprite->subpriority;
    sprite->data[3] = sprite->subpriority + 4;
    sprite->data[4] = 0;
    StoreSpriteCallbackInData(sprite, sub_80CF138);
    sprite->callback = sub_80785E4;
}

void sub_80CF138(struct Sprite* sprite)
{
    if (++sprite->data[4] > 12)
        sprite->callback = sub_80CF158;
}

void sub_80CF158(struct Sprite* sprite)
{
    s16 temp;
    s16 temp2;
    sprite->data[1] += 4;
    if (sprite->data[1] > 0xFE)
    {
        if (--sprite->data[0] == 0)
        {
            sprite->pos2.x = 0;
            sprite->callback = sub_80CF088;
            return;
        }
        else
        {
            sprite->data[1] &= 0xFF;
        }
    }

    if (sprite->data[1] > 0x4F)
        sprite->subpriority = sprite->data[3];

    if (sprite->data[1] > 0x9F)
        sprite->subpriority = sprite->data[2];

    temp = gSineTable[sprite->data[1]];
    sprite->pos2.x = (temp2 = temp >> 3) + (temp2 >> 1);
}

void sub_80CF1C8(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sub_80CEF44(bank, sprite);
    if (GetBankSide(bank) == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->data[0] = 2;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->data[0] = 3;
    }

    sprite->callback = sub_80CF228;
}

void sub_80CF228(struct Sprite* sprite)
{
    if (++sprite->data[1] > 10)
    {
        sprite->data[1] = 0;
        StartSpriteAnim(sprite, sprite->data[0]);
        StoreSpriteCallbackInData(sprite, sub_80CF264);
        sprite->callback = sub_8078600;
    }
}

void sub_80CF264(struct Sprite* sprite)
{
    if (++sprite->data[1] > 5)
        move_anim_8072740(sprite);
}

void sub_80CF280(struct Sprite* sprite)
{
    sub_8078650(sprite);
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->data[4] = gBattleAnimArgs[3];
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078278;
    sub_8078278(sprite);
}

void sub_80CF2D0(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sub_80CEF44(bank, sprite);
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = sub_80CF310;
}

void sub_80CF310(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos2.y -= 3;
        if (++sprite->data[1] == 6)
            sprite->data[0]++;
        break;
    case 1:
        sprite->pos2.y += 3;
        if (--sprite->data[1] == 0)
            sprite->data[0]++;
        break;
    case 2:
        if (++sprite->data[1] == 0x40)
            move_anim_8072740(sprite);
        break;
    }
}

void sub_80CF374(struct Sprite* sprite)
{
    s16 temp;
    gSprites[sprite->data[2]].pos2.x += sprite->data[1];
    temp = sprite->data[1];
    sprite->data[1] = -temp;
    if (sprite->data[0] == 0)
    {
        gSprites[sprite->data[2]].pos2.x = 0;
        move_anim_8074EE0(sprite);
    }

    sprite->data[0]--;
}

void sub_80CF3C4(struct Sprite* sprite)
{
    u8 a;
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    a = gObjectBankIDs[gBattleAnimBankTarget];
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = a;
    sprite->callback = sub_80CF374;
    sprite->invisible = 1;
}

void sub_80CF458(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[4];
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, sub_80CF490);
}

void sub_80CF490(struct Sprite* sprite)
{
    sprite->data[0] = sprite->data[1];
    sprite->data[2] = sprite->pos1.x;
    sprite->data[4] = sprite->pos1.y + 15;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, sub_80CF4B8);
}

void sub_80CF4B8(struct Sprite* sprite)
{
    if (sprite->data[5] == 0)
        move_anim_8072740(sprite);
    else
        sprite->data[5]--;
}

void sub_80CF4D8(u8 taskId)
{
    sub_8078E70(gObjectBankIDs[gBattleAnimBankAttacker], 0);
    gTasks[taskId].func = sub_80CF514;
}

void sub_80CF514(u8 taskId)
{
    u8 a = gObjectBankIDs[gBattleAnimBankAttacker];
    s16 b;
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
    {
        b = -gTasks[taskId].data[0];
    }
    else
    {
        b = gTasks[taskId].data[0];
    }

    obj_id_set_rotscale(a, 0x100, 0x100, b);
    if (gTasks[taskId].data[1] == 0)
    {
        gTasks[taskId].data[0] += 0xB0;
        gSprites[a].pos2.y++;
    }
    else if (gTasks[taskId].data[1] == 1)
    {
        if (++gTasks[taskId].data[3] == 0x1E)
            gTasks[taskId].data[1] = 2;

        return;
    }
    else
    {
        gTasks[taskId].data[0] -= 0xB0;
        gSprites[a].pos2.y--;
    }

    sub_8078F9C(a);
    if (gTasks[taskId].data[0] == 0xF20 || gTasks[taskId].data[0] == 0)
    {
        if (gTasks[taskId].data[1] == 2)
        {
            sub_8078F40(a);
            DestroyAnimVisualTask(taskId);
        }
        else
        {
            gTasks[taskId].data[1]++;
        }
    }
}

void sub_80CF610(struct Sprite* sprite)
{
    sub_8078650(sprite);
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
    {
        sprite->hFlip = 1;
        if (gBattleAnimArgs[2] != 0)
            sprite->vFlip = 1;
    }
    else
    {
        if (gBattleAnimArgs[2] != 0)
            sprite->vFlip = 1;
    }

    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CF690(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    sprite->callback = sub_80785E4;
    StoreSpriteCallbackInData(sprite, sub_80CF6B4);
}

void sub_80CF6B4(struct Sprite* sprite)
{
    sprite->data[0] = 6;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[4] = sprite->pos1.y - 32;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}


void sub_80CF6DC(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    u16 c;

    if (NotInBattle())
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    else if (GetBankSide(gBattleAnimBankAttacker) != 0)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    sub_80787B0(sprite, 1);
    a = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[2];
    b = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[3];
    c = sub_80790F0(a - sprite->pos1.x, b - sprite->pos1.y);
    c += 0xF000;
    if (NotInBattle())
        c -= 0x6000;

    sub_8078FDC(sprite, 0, 0x100, 0x100, c);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = a;
    sprite->data[4] = b;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CF7E0(struct Sprite* sprite)
{
    if (sprite->data[0]-- <= 0)
    {
        gTasks[sprite->data[7]].data[1]--;
        DestroySprite(sprite);
    }
}

void sub_80CF814(struct Sprite* sprite)
{
    struct Task* task = &gTasks[sprite->data[7]];
    if (sprite->data[0] > task->data[5])
    {
        sprite->data[5] += sprite->data[3];
        sprite->data[6] += sprite->data[4];
    }
    else
    {
        sprite->data[5] -= sprite->data[3];
        sprite->data[6] -= sprite->data[4];
    }

    sprite->data[1] += sprite->data[5];
    sprite->data[2] += sprite->data[6];
    if (1 & task->data[7])
        sprite->pos2.x = ((u16)sprite->data[1] >> 8) * -1;
    else
        sprite->pos2.x = (u16)sprite->data[1] >> 8;

    if (1 & task->data[8])
        sprite->pos2.y = ((u16)sprite->data[2] / 256u) * -1;
    else
        sprite->pos2.y = (u16)sprite->data[2] / 256u;

    if (sprite->data[0]-- <= 0)
    {
        sprite->data[0] = 30;
        sprite->callback = sub_80CF7E0;
    }
}


void sub_80CF8B8(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    s16 c;

    struct Task* task = &gTasks[sprite->data[7]];
    sprite->data[1] += (-2 & task->data[7]);
    sprite->data[2] += (-2 & task->data[8]);
    if (1 & task->data[7])
        sprite->pos2.x = ((u16)sprite->data[1] >> 8) * -1;
    else
        sprite->pos2.x = (u16)sprite->data[1] >> 8;

    if (1 & task->data[8])
        sprite->pos2.y = ((u16)sprite->data[2] / 256u) * -1;
    else
        sprite->pos2.y = (u16)sprite->data[2] / 256u;

    if (sprite->data[0]-- <= 0)
    {
        sprite->data[0] = 8;
        task->data[5] = 4;
        a = sub_81174E0(0x1000);
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        if (task->data[11] >= sprite->pos1.x)
            b = (task->data[11] - sprite->pos1.x) << 8;
        else
            b = (sprite->pos1.x - task->data[11]) << 8;

        if (task->data[12] >= sprite->pos1.y)
            c = (task->data[12] - sprite->pos1.y) << 8;
        else
            c = (sprite->pos1.y - task->data[12]) << 8;

        sprite->data[2] = 0;
        sprite->data[1] = 0;
        sprite->data[6] = 0;
        sprite->data[5] = 0;
        sprite->data[3] = sub_81174C4(sub_81174C4(b, a), sub_81174E0(0x1C0));
        sprite->data[4] = sub_81174C4(sub_81174C4(c, a), sub_81174E0(0x1C0));
        sprite->callback = sub_80CF814;
    }
}

void sub_80CF9F8(u8 taskId)
{
    if (gTasks[taskId].data[1] == 0)
        DestroyAnimVisualTask(taskId);
}

void sub_80CFA20(u8 taskId)
{
    if (gTasks[taskId].data[0]-- <= 0)
    {
        u8 spriteId;
        struct Sprite* sprite;
        spriteId = CreateSprite(&gSpriteTemplate_83D74BC, gTasks[taskId].data[9], gTasks[taskId].data[10], gTasks[taskId].data[2] - gTasks[taskId].data[1]);
        sprite = &gSprites[spriteId];
        switch (gTasks[taskId].data[4])
        {
        case 1:
            sprite->oam.matrixNum |= 24;
            break;
        case 2:
            sprite->oam.matrixNum = 8;
            break;
        }

        sprite->data[0] = gTasks[taskId].data[5] - gTasks[taskId].data[6];
        sprite->data[7] = taskId;
        gTasks[taskId].data[gTasks[taskId].data[1] + 13] = spriteId;
        gTasks[taskId].data[0] = gTasks[taskId].data[3];
        gTasks[taskId].data[1]++;
        PlaySE12WithPanning(0x9A, sub_8076F98(-0x3F));
        if (gTasks[taskId].data[1] > 2)
            gTasks[taskId].func = sub_80CF9F8;
    }
}

void sub_80CFB04(u8 taskId)
{
    s16 r9 = 0;
    s16 r6 = 0;
    s16 sp1 = 0;
    s16 sp2 = 0;
    s16 r4;

    if (NotInBattle())
    {
        gTasks[taskId].data[4] = 2;
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        if (gBattleAnimArgs[2] & 1)
            gBattleAnimArgs[2] &= ~1;
        else
            gBattleAnimArgs[2] |= 1;
    }
    else
    {
        if ((gBanksBySide[gBattleAnimBankTarget] & 1) == 0)
        {
            gTasks[taskId].data[4] = 1;
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
            if (gBattleAnimArgs[2] & 1)
                gBattleAnimArgs[2] &= ~1;
            else
                gBattleAnimArgs[2] |= 1;
        }
    }
    r6 = gTasks[taskId].data[9] = sub_8077ABC(gBattleAnimBankAttacker, 0);
    r9 = gTasks[taskId].data[10] = sub_8077ABC(gBattleAnimBankAttacker, 1);
    if ((gBattleTypeFlags & 0x0001)
        && IsAnimBankSpriteVisible(gBattleAnimBankTarget ^ 2))
    {
        sub_807A3FC(gBattleAnimBankTarget, 0, &sp1, &sp2);
    }
    else
    {
        sp1 = sub_8077ABC(gBattleAnimBankTarget, 0);
        sp2 = sub_8077ABC(gBattleAnimBankTarget, 1);
    }

    sp1 = gTasks[taskId].data[11] = sp1 + gBattleAnimArgs[0];
    sp2 = gTasks[taskId].data[12] = sp2 + gBattleAnimArgs[1];
    if (sp1 >= r6)
        r4 = sp1 - r6;
    else
        r4 = r6 - sp1;

    gTasks[taskId].data[5] = sub_81174C4(r4, sub_81174E0(gBattleAnimArgs[2] & ~1));
    gTasks[taskId].data[6] = sub_81174C4(gTasks[taskId].data[5], 0x80);
    gTasks[taskId].data[7] = gBattleAnimArgs[2];
    if (sp2 >= r9)
    {
        r4 = sp2 - r9;
        gTasks[taskId].data[8] = sub_81174C4(r4, sub_81174E0(gTasks[taskId].data[5])) & ~1;
    }
    else
    {
        r4 = r9 - sp2;
        gTasks[taskId].data[8] = sub_81174C4(r4, sub_81174E0(gTasks[taskId].data[5])) | 1;
    }

    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    if (gBattleAnimArgs[4] & 0x80)
    {
        gBattleAnimArgs[4] ^= 0x80;
        if (gBattleAnimArgs[4] >= 64)
        {
            u16 var = sub_8079E90(gBattleAnimBankTarget) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = sub_8079E90(gBattleAnimBankTarget) - gBattleAnimArgs[4];
            gTasks[taskId].data[2] = var;
        }
    }
    else
    {
        if (gBattleAnimArgs[4] >= 64)
        {
            u16 var = sub_8079E90(gBattleAnimBankTarget) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = sub_8079E90(gBattleAnimBankTarget) - gBattleAnimArgs[4];
            gTasks[taskId].data[2] = var;
        }
    }

    if (gTasks[taskId].data[2] < 3)
        gTasks[taskId].data[2] = 3;

    gTasks[taskId].func = sub_80CFA20;
}

void sub_80CFDFC(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    sprite->data[0] = 0x100 + (IndexOfSpritePaletteTag(gSpriteTemplate_83D75AC.paletteTag) << 4);
    sprite->callback = sub_80CFE2C;
}
# 4099 "src/battle_anim_80CA710.c"
__attribute__((naked))
void sub_80CFE2C(struct Sprite* sprite)
{
    asm(".syntax unified\n    	push {r4-r7,lr}\n	adds r4, r0, 0\n	ldrh r0, [r4, 0x30]\n	adds r0, 0x1\n	strh r0, [r4, 0x30]\n	lsls r0, 16\n	asrs r0, 16\n	cmp r0, 0x2\n	bne _080CFE90\n	movs r0, 0\n	strh r0, [r4, 0x30]\n	ldrh r5, [r4, 0x2E]\n	ldr r1, _080CFE98 @ =gPlttBufferFaded\n	adds r0, r5, 0\n	adds r0, 0x8\n	lsls r0, 1\n	adds r0, r1\n	ldrh r7, [r0]\n	adds r6, r1, 0 @puts gPlttBufferFaded in r6\n	adds r1, r5, 0\n	adds r1, 0x9\n	lsls r0, r5, 1\n	adds r0, r6 \n	adds r2, r0, 0\n	adds r2, 0x10\n	movs r3, 0x7\n	lsls r1, 1\n	adds r1, r6 \n_080CFE64:\n	ldrh r0, [r1]\n	strh r0, [r2]\n	adds r1, 0x2\n	adds r2, 0x2\n	subs r3, 0x1\n	cmp r3, 0\n	bge _080CFE64\n	adds r0, r5, 0\n	adds r0, 0xF\n	lsls r0, 1\n	adds r0, r6\n	strh r7, [r0]\n	ldrh r0, [r4, 0x32]\n	adds r0, 0x1\n	strh r0, [r4, 0x32]\n	lsls r0, 16\n	asrs r0, 16\n	cmp r0, 0x18\n	bne _080CFE90\n	adds r0, r4, 0\n	bl move_anim_8072740\n_080CFE90:\n	pop {r4-r7}\n	pop {r0}\n	bx r0\n	.align 2, 0\n_080CFE98: .4byte gPlttBufferFaded\n.syntax divided\n");
# 4160 "src/battle_anim_80CA710.c"
}


void sub_80CFE9C(struct Sprite* sprite)
{
    s16 r6;
    s16 r7;
    u16 var;

    sub_80787B0(sprite, 1);
    r6 = sub_8077ABC(gBattleAnimBankTarget, 2);
    r7 = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[3];
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    r6 += gBattleAnimArgs[2];
    var = sub_80790F0(r6 - sprite->pos1.x, r7 - sprite->pos1.y);
    var += 0xC000;
    sub_8078FDC(sprite, 0, 0x100, 0x100, var);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = r6;
    sprite->data[4] = r7;
    sprite->callback = sub_8078C00;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CFF50(struct Sprite* sprite)
{
    sprite->data[2] = -16;
    sprite->pos1.y += 8;
    sprite->callback = sub_80CFF68;
}

void sub_80CFF68(struct Sprite* sprite)
{
    sprite->data[0] += 0x80;
    sprite->pos2.x = sprite->data[0] >> 8;
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
        sprite->pos2.x = -sprite->pos2.x;

    sprite->pos2.y = Sin(sprite->data[1], sprite->data[2]);
    sprite->data[1] += 5;
    if (sprite->data[1] > 0x7E)
    {
        sprite->data[1] = 0;
        sprite->data[2] /= 2;
        if (++sprite->data[3] == 2)
            move_anim_8072740(sprite);
    }
}

void sub_80CFFD8(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = 20;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    sprite->callback = sub_8078B34;
    sprite->affineAnimPaused = 1;
    StoreSpriteCallbackInData(sprite, sub_80D0030);
}

void sub_80D0030(struct Sprite* sprite)
{
    int i;
    u16 rand;
    s16* ptr;
    PlaySE12WithPanning(0xA6, sub_8076F98(0x3F));
    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.y = 0;
    sprite->pos2.x = 0;
    ptr = &sprite->data[7];
    for (i = 0; i < 8; i++)
    {
        ptr[i - 7] = 0;
    }

    rand = Random();
    sprite->data[6] = 0xFFF4 - (rand & 7);
    rand = Random();
    sprite->data[7] = (rand % 0xA0) + 0xA0;
    sprite->callback = sub_80D00B4;
    sprite->affineAnimPaused = 0;
}

void sub_80D00B4(struct Sprite* sprite)
{
    sprite->data[0] += sprite->data[7];
    sprite->pos2.x = sprite->data[0] >> 8;
    if (sprite->data[7] & 1)
        sprite->pos2.x = -sprite->pos2.x;

    sprite->pos2.y = Sin(sprite->data[1], sprite->data[6]);
    sprite->data[1] += 8;
    if (sprite->data[1] > 0x7E)
    {
        sprite->data[1] = 0;
        sprite->data[2] /= 2;
        if (++sprite->data[3] == 1)
            move_anim_8072740(sprite);
    }
}

void sub_80D0118(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
        sprite->pos1.y += 16;

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[5];
    sprite->data[3] = gBattleAnimArgs[6];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->callback = sub_8078114;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sprite->callback(sprite);
}

void sub_80D0178(struct Sprite* sprite)
{
    s16 r7 = 32;
    s16 r4 = -32;
    s16 r8 = 16;
    s16 r6 = -16;
    if (gBattleAnimArgs[0] != 0)
    {
        r7 = r4;
        r4 = 32;
        r8 = r6;
        r6 = 16;
        StartSpriteAnim(sprite, 1);
    }

    sprite->pos1.x += r7;
    sprite->pos1.y += r4;
    sprite->data[0] = 6;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + r8;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + r6;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, sub_80D020C);
}

void sub_80D020C(struct Sprite* sprite)
{
    if (sprite->animEnded == 1)
        move_anim_8072740(sprite);
}

void sub_80D0228(struct Sprite* sprite)
{
    s16 r8 = 32;
    s16 r4 = -32;
    s16 r9 = 16;
    s16 r6 = -16;
    if (gBattleAnimArgs[0] != 0)
    {
        r8 = r4;
        r4 = 32;
        r9 = r6;
        r6 = 16;
        StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    }

    sprite->pos1.x += r8;
    sprite->pos1.y += r4;
    sprite->data[0] = 6;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + r9;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + r6;
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[5] = gBattleAnimArgs[0];
    sprite->data[6] = sprite->data[0];
    sprite->callback = sub_80D02D0;
}

void sub_80D02D0(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) && sprite->animEnded == 1)
    {
        SeekSpriteAnim(sprite, 0);
        sprite->animPaused = 1;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 2;
        sprite->pos2.y = -2;
        sprite->data[0] = sprite->data[6];
        sprite->data[1] ^= 1;
        sprite->data[2] ^= 1;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->callback = sub_80D0344;
    }
}

void sub_80D0344(struct Sprite* sprite)
{
    if (sprite->data[3])
    {
        sprite->pos2.x = -sprite->pos2.x;
        sprite->pos2.y = -sprite->pos2.y;
    }

    sprite->data[3] ^= 1;
    if (++sprite->data[4] == 0x33)
    {
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->animPaused = 0;
        StartSpriteAnim(sprite, sprite->data[5] ^ 1);
        sprite->callback = sub_80D03A8;
    }
}

void sub_80D03A8(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) != 0)
        move_anim_8072740(sprite);
}

void sub_80D03C4(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(1);
    sub_8078E70(spriteId, 1);
    obj_id_set_rotscale(spriteId, 0xD0, 0xD0, 0);
    sub_8079108(gSprites[spriteId].oam.paletteNum + 16, 0);
    gTasks[taskId].data[0] = 0x50;
    gTasks[taskId].func = sub_80D0428;
}

void sub_80D0428(u8 taskId)
{
    if (--gTasks[taskId].data[0] == -1)
    {
        u8 spriteId = GetAnimBankSpriteId(1);
        sub_8078F40(spriteId);
        sub_8079108(gSprites[spriteId].oam.paletteNum + 16, 1);
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80D0488(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBankSpriteId(0);
    task->data[0] = spriteId;
    sub_8078E70(spriteId, 0);
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0x100;
    task->data[5] = 0;
    task->data[6] = 0;
    task->data[7] = sub_8079E90(gBattleAnimBankAttacker);
    task->func = sub_80D04E0;
}

void sub_80D04E0(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[1])
    {
    case 0:
        if (task->data[2] == 0 || task->data[2] == 3 || task->data[2] == 6)
            sub_80D0614(task, taskId);
        task->data[2]++;
        task->data[4] += 0x28;
        obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
        sub_8079A64(task->data[0]);
        if (task->data[2] == 32)
        {
            task->data[5]++;
            task->data[1]++;
        }
        break;
    case 1:
        if (task->data[6] == 0)
        {
            if (task->data[5] == 3)
            {
                task->data[2] = 0;
                task->data[1] = 3;
            }
            else
            {
                task->data[2] = 0;
                task->data[3] = 0;
                task->data[4] = 0x100;
                obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
                sub_8079A64(task->data[0]);
                task->data[1] = 2;
            }
        }
        break;
    case 2:
        task->data[1] = 0;
        break;
    case 3:
        if (++task->data[2] > 32)
        {
            task->data[2] = 0;
            task->data[1]++;
        }
        break;
    case 4:
        task->data[2] += 2;
        task->data[4] -= 0x50;
        obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
        sub_8079A64(task->data[0]);
        if (task->data[2] == 32)
        {
            task->data[2] = 0;
            task->data[1]++;
        }
        break;
    case 5:
        sub_8078F40(task->data[0]);
        gSprites[task->data[15]].pos2.y = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}
# 4518 "src/battle_anim_80CA710.c"
__attribute__((naked))
void sub_80D0614(struct Task* task, u8 taskId)
{
    asm(".syntax unified\n    	push {r4-r7,lr}\n	mov r7, r9\n	mov r6, r8\n	push {r6,r7}\n	adds r7, r0, 0 @r7 is task\n	lsls r1, 24\n	lsrs r1, 24\n	mov r9, r1 @r9 is taskId\n	movs r0, 0\n	bl duplicate_obj_of_side_rel2move_in_transparent_mode\n	lsls r0, 16\n	lsrs r0, 16\n	mov r8, r0\n	lsls r0, 16\n	asrs r4, r0, 16\n	cmp r4, 0\n	blt _080D06EE @jump to bottom\n	bl AllocOamMatrix\n	lsls r0, 24\n	lsrs r6, r0, 24\n	cmp r6, 0xFF\n	bne _080D0658\n	lsls r0, r4, 4\n	adds r0, r4\n	lsls r0, 2\n	ldr r1, _080D0654 @ =gSprites\n	adds r0, r1\n	bl obj_delete_but_dont_free_vram\n	b _080D06EE @ jump to bottom\n	.align 2, 0\n_080D0654: .4byte gSprites\n_080D0658:\n	ldr r5, _080D06FC @ =gSprites\n	lsls r3, r4, 4\n	adds r3, r4\n	lsls r3, 2\n	adds r4, r3, r5\n	ldrb r1, [r4, 0x1]\n	movs r0, 0xD\n	negs r0, r0\n	ands r0, r1\n	movs r1, 0x4\n	orrs r0, r1\n	movs r1, 0x3\n	orrs r0, r1\n	strb r0, [r4, 0x1]\n	adds r2, r4, 0\n	adds r2, 0x2C\n	ldrb r0, [r2]\n	movs r1, 0x80\n	orrs r0, r1\n	strb r0, [r2]\n	movs r0, 0x1F\n	ands r6, r0\n	lsls r2, r6, 1\n	ldrb r1, [r4, 0x3]\n	movs r0, 0x3F\n	negs r0, r0\n	ands r0, r1\n	orrs r0, r2\n	strb r0, [r4, 0x3]\n	ldrb r0, [r7, 0x16]\n	ldrb r1, [r7, 0xE]\n	subs r0, r1\n	adds r1, r4, 0\n	adds r1, 0x43\n	strb r0, [r1]\n	ldrh r0, [r7, 0xE]\n	adds r0, 0x1\n	strh r0, [r7, 0xE]\n	ldrh r0, [r7, 0x14]\n	adds r0, 0x1\n	strh r0, [r7, 0x14]\n	movs r0, 0x10\n	strh r0, [r4, 0x2E]\n	mov r0, r9\n	strh r0, [r4, 0x30]\n	movs r0, 0x6\n	strh r0, [r4, 0x32]\n	adds r5, 0x1C\n	adds r3, r5\n	ldr r0, _080D0700 @ =sub_80D0704\n	str r0, [r3]\n	mov r1, r8 @duplicate_obj_of_side_rel2move_in_transparent_mode(0)\n	lsls r0, r1, 24\n	lsrs r0, 24\n	movs r1, 0x10\n	ldrsh r2, [r7, r1]\n	adds r1, r2, 0\n	movs r3, 0\n	bl obj_id_set_rotscale\n	ldrb r0, [r4, 0x1]\n	movs r3, 0x4\n	negs r3, r3\n	ands r3, r0\n	movs r0, 0x1\n	orrs r3, r0\n	strb r3, [r4, 0x1]\n	lsrs r1, r3, 6\n	ldrb r2, [r4, 0x3]\n	lsrs r2, 6\n	lsls r3, 30\n	lsrs r3, 30\n	adds r0, r4, 0\n	bl CalcCenterToCornerVec\n_080D06EE:\n	pop {r3,r4}\n	mov r8, r3\n	mov r9, r4\n	pop {r4-r7}\n	pop {r0}\n	bx r0\n	.align 2, 0\n_080D06FC: .4byte gSprites\n_080D0700: .4byte sub_80D0704\n.syntax divided\n");
# 4638 "src/battle_anim_80CA710.c"
}


void sub_80D0704(struct Sprite* sprite)
{
    if (--sprite->data[0] == 0)
    {
        gTasks[sprite->data[1]].data[sprite->data[2]]--;
        FreeOamMatrix(sprite->oam.matrixNum);
        obj_delete_but_dont_free_vram(sprite);
    }
}

void sub_80D074C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (gBattleAnimArgs[1] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        u8 spriteId = GetAnimBankSpriteId(gBattleAnimArgs[0]);
        task->data[0] = spriteId;
        task->data[1] = 0;
        task->data[2] = gBattleAnimArgs[1];
        task->data[3] = 0;
        task->data[4] = 0;
        sub_80798F4(task, spriteId, &gUnknown_083D76F4);
        task->func = sub_80D07AC;
    }
}

void sub_80D07AC(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[1])
    {
    case 0:
        sub_807992C(task);
        task->data[4] += 3;
        gSprites[task->data[0]].pos2.y += task->data[4];
        if (++task->data[3] > 7)
        {
            task->data[3] = 0;
            task->data[1]++;
        }
        break;
    case 1:
        sub_807992C(task);
        gSprites[task->data[0]].pos2.y += task->data[4];
        if (++task->data[3] > 7)
        {
            task->data[3] = 0;
            task->data[1]++;
        }
        break;
    case 2:
        if (task->data[4] != 0)
        {
            gSprites[task->data[0]].pos2.y -= 2;
            task->data[4] -= 2;
        }
        else
            task->data[1]++;
        break;
    case 3:
        if (!sub_807992C(task))
        {
            if (--task->data[2] == 0)
            {
                gSprites[task->data[0]].pos2.y = 0;
                DestroyAnimVisualTask(taskId);
            }
            else
            {
                sub_80798F4(task, task->data[0], &gUnknown_083D76F4);
                task->data[1] = 0;
            }
        }
        break;
    }
}

void sub_80D08C8(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBankSpriteId(0);
    sub_80798F4(task, spriteId, &gUnknown_083D7714);
    task->func = sub_80D0904;
}

void sub_80D0904(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (!sub_807992C(task))
        DestroyAnimVisualTask(taskId);
}

void sub_80D0930(struct Sprite* sprite)
{
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + 32;
        sprite->data[1] = 0x40;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) - 32;
        sprite->data[1] = -0x40;
    }

    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->data[0] = 0x34;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sprite->callback = sub_8078394;
}

void sub_80D09C0(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    if (GetBankSide(bank) == 1)
    {
        gBattleAnimArgs[1] *= -1;
    }

    sprite->pos1.x = sub_8077ABC(bank, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = sub_8077ABC(bank, 3) + gBattleAnimArgs[2];
    if (sprite->pos1.y <= 7)
        sprite->pos1.y = 8;

    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_80785E4;
}

void sub_80D0A4C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBankSpriteId(0);
    task->data[0] = spriteId;
    task->data[1] = 0;
    sub_80798F4(task, spriteId, &gUnknown_083D77B0);
    task->func = sub_80D0A8C;
}

void sub_80D0A8C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (!sub_807992C(task))
        DestroyAnimVisualTask(taskId);
}

void sub_80D0AB8(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    task->data[0] = GetAnimBankSpriteId(0);
    task->data[1] = 0;
    task->data[2] = 4;
    task->data[3] = 7;
    task->data[4] = 3;
    task->data[5] = gSprites[task->data[0]].pos1.x;
    task->data[6] = gSprites[task->data[0]].pos1.y;
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[9] = 2;
    if (GetBankSide(gBattleAnimBankAttacker) == 1)
        task->data[2] *= -1;

    task->func = sub_80D0B3C;
}

void sub_80D0B3C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (++task->data[7] > 2)
    {
        task->data[7] = 0;
        task->data[8]++;
        if ((task->data[8] & 1) != 0)
        {
            gSprites[task->data[0]].pos1.y += task->data[9];
        }
        else
        {
            gSprites[task->data[0]].pos1.y -= task->data[9];
        }
    }
    switch (task->data[1])
    {
    case 0:
        gSprites[task->data[0]].pos1.x += task->data[2];
        if (--task->data[3] == 0)
        {
            task->data[3] = 14;
            task->data[1] = 1;
        }
        break;
    case 1:
        gSprites[task->data[0]].pos1.x -= task->data[2];
        if (--task->data[3] == 0)
        {
            task->data[3] = 7;
            task->data[1] = 2;
        }
        break;
    case 2:
        gSprites[task->data[0]].pos1.x += task->data[2];
        if (--task->data[3] == 0)
        {
            if (--task->data[4] != 0)
            {
                task->data[3] = 7;
                task->data[1] = 0;
            }
            else
            {
                if ((task->data[8] & 1) != 0)
                {
                    gSprites[task->data[0]].pos1.y -= task->data[9];
                }
                DestroyAnimVisualTask(taskId);
            }
        }
        break;
    }
}

void sub_80D0C88(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    struct UnknownTaskStruct sp;
    s16 i;
    task->data[0] = sub_8077FC0(gBattleAnimBankTarget) + 32;
    task->data[1] = 4;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0;
    task->data[5] = 0;
    task->data[15] = sub_807A100(gBattleAnimBankTarget, 0);
    if (GetBankIdentity_permutated(gBattleAnimBankTarget) == 1)
    {
        task->data[6] = gUnknown_030042C0;
        sp.dest = (u16 *)(0x4000000 + 0x14);
    }
    else
    {
        task->data[6] = gUnknown_03004288;
        sp.dest = (u16 *)(0x4000000 + 0x18);
    }

    for (i = task->data[0] - 0x40; i <= task->data[0];i++)
    {
        if (i >= 0)
        {
            gUnknown_03004DE0[0][i] = task->data[6] + 0xF0;
            gUnknown_03004DE0[1][i] = task->data[6] + 0xF0;
        }
    }

    sp.control = 0xa2600001;
    sp.unk8 = 1;
    sp.unk9 = 0;
    sub_80895F8(sp);
    task->func = sub_80D0D68;
}
# 4962 "src/battle_anim_80CA710.c"
__attribute__((naked))
void sub_80D0D68(u8 taskId)
{
    asm(".syntax unified\n        push {r4,lr}\n	lsls r0, 24\n	lsrs r4, r0, 24\n	lsls r0, r4, 2\n	adds r0, r4\n	lsls r0, 3\n	ldr r1, _080D0D88 @ =gTasks\n	adds r3, r0, r1\n	movs r1, 0x10\n	ldrsh r0, [r3, r1]\n	cmp r0, 0\n	beq _080D0D8C\n	cmp r0, 0x1\n	beq _080D0DA2\n	b _080D0E22\n	.align 2, 0\n_080D0D88: .4byte gTasks\n_080D0D8C:\n	ldrh r0, [r3, 0x12]\n	adds r0, 0x1\n	strh r0, [r3, 0x12]\n	lsls r0, 16\n	asrs r0, 16\n	cmp r0, 0x14\n	ble _080D0E22\n	ldrh r0, [r3, 0x10]\n	adds r0, 0x1\n	strh r0, [r3, 0x10]\n	b _080D0E22\n_080D0DA2:\n	ldrh r0, [r3, 0xA]\n	adds r0, 0x1\n	strh r0, [r3, 0xA]\n	lsls r0, 16\n	asrs r0, 16\n	cmp r0, 0x3\n	ble _080D0E22\n	movs r0, 0\n	strh r0, [r3, 0xA]\n	ldrh r1, [r3, 0xE]\n	movs r0, 0x3\n	ands r0, r1\n	strh r0, [r3, 0xC]\n	ldrh r0, [r3, 0x8]\n	subs r0, r1\n	strh r0, [r3, 0x12]\n	movs r2, 0xC\n	ldrsh r1, [r3, r2]\n	cmp r1, 0x1\n	beq _080D0DD8\n	cmp r1, 0x1\n	ble _080D0DE0\n	cmp r1, 0x2\n	beq _080D0DDC\n	cmp r1, 0x3\n	beq _080D0DDC\n	b _080D0DE0\n_080D0DD8:\n	subs r0, 0x2\n	b _080D0DDE\n_080D0DDC:\n	adds r0, 0x1\n_080D0DDE:\n	strh r0, [r3, 0x12]\n_080D0DE0:\n	movs r1, 0x12\n	ldrsh r0, [r3, r1]\n	cmp r0, 0\n	blt _080D0E04\n	ldr r2, _080D0E28 @ =gUnknown_03004DE0\n	lsls r0, 1\n	adds r0, r2\n	ldrh r1, [r3, 0x14]\n	strh r1, [r0]\n	movs r1, 0x12\n	ldrsh r0, [r3, r1]\n	lsls r0, 1\n	movs r1, 0xF0\n	lsls r1, 3\n	adds r2, r1\n	adds r0, r2\n	ldrh r1, [r3, 0x14]\n	strh r1, [r0]\n_080D0E04:\n	ldrh r0, [r3, 0xE]\n	adds r0, 0x1\n	strh r0, [r3, 0xE]\n	lsls r0, 16\n	asrs r0, 16\n	movs r2, 0x26\n	ldrsh r1, [r3, r2]\n	cmp r0, r1\n	blt _080D0E22\n	ldr r1, _080D0E2C @ =gUnknown_03004DC0\n	movs r0, 0x3\n	strb r0, [r1, 0x15]\n	adds r0, r4, 0\n	bl DestroyAnimVisualTask\n_080D0E22:\n	pop {r4}\n	pop {r0}\n	bx r0\n	.align 2, 0\n_080D0E28: .4byte gUnknown_03004DE0\n_080D0E2C: .4byte gUnknown_03004DC0\n.syntax divided\n");
# 5072 "src/battle_anim_80CA710.c"
}


void sub_80D0E30(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 0) - 16;
    sprite->pos1.y = sub_8077FC0(gBattleAnimBankTarget) + 16;
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 16;
    sprite->data[4] = 0;
    sprite->data[5] = sub_807A100(gBattleAnimBankTarget, 0) + 2;
    sprite->data[6] = sub_8076F98(0x3F);
    sprite->callback = sub_80D0E8C;
}

void sub_80D0E8C(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->invisible = !sprite->invisible;
        }
        if (++sprite->data[1] > 16)
        {
            sprite->invisible = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] > 3 && sprite->data[2] < sprite->data[5])
        {
            sprite->data[1] = 0;
            sprite->pos1.y -= 1;
            sprite->data[2]++;
            if (sprite->data[2] % 10 == 0)
                PlaySE12WithPanning(0xCD, sprite->data[6]);
        }
        sprite->data[4] += sprite->data[3];
        if (sprite->data[4] > 31)
        {
            sprite->data[4] = 0x40 - sprite->data[4];
            sprite->data[3] *= -1;
        }
        else if (sprite->data[4] <= -32)
        {
            sprite->data[4] = -0x40 - sprite->data[4];
            sprite->data[3] *= -1;
        }
        sprite->pos2.x = sprite->data[4];
        if (sprite->data[5] == sprite->data[2])
        {
            sprite->data[1] = 0;
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->invisible = !sprite->invisible;
        }
        if (++sprite->data[1] > 16)
        {
            sprite->invisible = 0;
            move_anim_8072740(sprite);
        }
        break;
    }
}

void sub_80D0FD8(struct Sprite* sprite)
{
    u8 bank = 0;
    u16 sp0 = 0;
    u16 sp1 = 0;
    u8 r4;

    if (gBattleAnimArgs[2] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    r4 = gBattleAnimArgs[3] ^ 1;
    if (IsDoubleBattle() && IsAnimBankSpriteVisible(bank ^ 2))
    {
        sub_807A3FC(bank, r4, &sp0, &sp1);
        if (r4 == 0)
            r4 = sub_8077ABC(bank, 0);
        else
            r4 = sub_8077ABC(bank, 2);

        if (GetBankSide(bank) != 0)
            gBattleAnimArgs[0] -= (sp0 - r4) - gBattleAnimArgs[0];
        else
            gBattleAnimArgs[0] = sp0 - r4;
    }

    sprite->callback = sub_80793C4;
    sub_80793C4(sprite);
}

void sub_80D1098(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite))
    {
        FreeSpriteOamMatrix(sprite);
        move_anim_8072740(sprite);
    }
}

void sub_80D10B8(struct Sprite* sprite)
{
    u16 r9 = 0;
    u16 r6 = 0;
    s16 sp0 = 0;
    s16 sp1 = 0;
    u8 sp4;
    u8 bankr7;
    u8 bankr8;
    u8 r10;

    if (gBattleAnimArgs[5] == 0)
    {
        bankr7 = gBattleAnimBankAttacker;
        bankr8 = gBattleAnimBankTarget;
    }
    else
    {
        bankr7 = gBattleAnimBankTarget;
        bankr8 = gBattleAnimBankAttacker;
    }

    if (gBattleAnimArgs[6] == 0)
    {
        r10 = 0;
        sp4 = 1;
    }
    else
    {
        r10 = 2;
        sp4 = 3;
    }

    if (GetBankSide(bankr7) != 0)
    {
        r9 = sub_8077ABC(bankr7, r10) + gBattleAnimArgs[0];
        if (IsAnimBankSpriteVisible(bankr8 ^ 2))
            sprite->subpriority = gSprites[gObjectBankIDs[bankr8 ^ 2]].subpriority - 1;
        else
            sprite->subpriority = gSprites[gObjectBankIDs[bankr8]].subpriority - 1;
    }
    else
    {
        r9 = sub_8077ABC(bankr7, r10) - gBattleAnimArgs[0];
        if (gMain.inBattle && IsAnimBankSpriteVisible(bankr7 ^ 2))
        {
            if (gSprites[gObjectBankIDs[bankr7]].pos1.x < gSprites[gObjectBankIDs[bankr7 ^ 2]].pos1.x)
                sprite->subpriority = gSprites[gObjectBankIDs[bankr7 ^ 2]].subpriority + 1;
            else
                sprite->subpriority = gSprites[gObjectBankIDs[bankr7]].subpriority - 1;
        }
        else
        {
            sprite->subpriority = gSprites[gObjectBankIDs[bankr7]].subpriority - 1;
        }

    }

    r6 = sub_8077ABC(bankr7, sp4) + gBattleAnimArgs[1];
    if (gMain.inBattle && IsAnimBankSpriteVisible(bankr8 ^ 2))
    {
        sub_807A3FC(bankr8, gBattleAnimArgs[6], &sp0, &sp1);
    }
    else
    {
        sp0 = sub_8077ABC(bankr8, r10);
        sp1 = sub_8077ABC(bankr8, sp4);
    }

    if (GetBankSide(bankr8))
        sp0 += gBattleAnimArgs[3];
    else
        sp0 -= gBattleAnimArgs[3];

    sp1 += gBattleAnimArgs[4];
    sprite->pos1.x = sprite->data[1] = r9;
    sprite->pos1.y = sprite->data[3] = r6;
    sprite->data[2] = sp0;
    sprite->data[4] = sp1;
    sprite->data[0] = gBattleAnimArgs[0];
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->callback = sub_80D1098;
    sub_80D1098(sprite);
}

void sub_80D1318(struct Sprite* sprite)
{
    u8 index = IndexOfSpritePaletteTag(0x27DB);
    if (index != 0xFF)
    {
        BlendPalette(((index << 20) + 0x1010000) >> 16, 15, gBattleAnimArgs[5], gBattleAnimArgs[4]);
    }

    StartSpriteAffineAnim(sprite, 1);
    sprite->callback = sub_80793C4;
    sub_80793C4(sprite);
}

void sub_80D1368(struct Sprite* sprite)
{
    s16 r1;
    sub_80787B0(sprite, 0);
    r1 = (GetBankSide(gBattleAnimBankAttacker)) ? -0xA0 : 0xA0;
    sprite->data[0] = 0x380;
    sprite->data[1] = r1;
    sprite->data[7] = gBattleAnimArgs[2];
    sprite->callback = sub_80D13AC;
}

void sub_80D13AC(struct Sprite* sprite)
{
    s16 add;
    sprite->pos2.y -= (sprite->data[0] >> 8);
    sprite->pos2.x = sprite->data[1] >> 8;
    sprite->data[0] -= 32;
    add = (GetBankSide(gBattleAnimBankAttacker)) ? -0xA0 : 0xA0;
    sprite->data[1] += add;
    if (sprite->pos2.y > 0)
    {
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[0] = 0;
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = sub_80D1424;
    }
}

void sub_80D1424(struct Sprite* sprite)
{
    if (sprite->data[0]++ > 19)
    {
        StartSpriteAffineAnim(sprite, 2);
        sprite->callback = sub_80D144C;
    }
}

void sub_80D144C(struct Sprite* sprite)
{
    if (sprite->affineAnimEnded)
    {
        StartSpriteAffineAnim(sprite, 1);
        sprite->data[0] = 0;
        if (sprite->data[7] == 0)
        {
            sprite->oam.tileNum += 16;
            sprite->callback = sub_80D14C4;
        }
        else
        {
            sprite->oam.tileNum += 32;
            sprite->callback = sub_80D154C;
        }
    }
}

void sub_80D14C4(struct Sprite* sprite)
{
    sprite->pos2.y -= 2;
    if (++sprite->data[0] == 9)
    {
        sprite->data[0] = 16;
        sprite->data[1] = 0;
        (*(vu16 *)(0x4000000 + 0x50)) = 0x3F40;
        (*(vu16 *)(0x4000000 + 0x52)) = sprite->data[0];
        sprite->callback = sub_80D1504;
    }
}

void sub_80D1504(struct Sprite* sprite)
{
    if (sprite->data[1]++ % 3 == 0)
    {
        sprite->data[0]--;
        (*(vu16 *)(0x4000000 + 0x52)) = sprite->data[0] | ((16 - sprite->data[0]) << 8);
        if (sprite->data[0] == 0)
            sprite->callback = sub_80D154C;
    }
}

void sub_80D154C(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->invisible = 1;
        if (sprite->data[7] == 0)
            sprite->callback = sub_80D158C;
        else
            sprite->callback = move_anim_8072740;
    }
}

void sub_80D158C(struct Sprite* sprite)
{
    (*(vu16 *)(0x4000000 + 0x50)) = 0;
    (*(vu16 *)(0x4000000 + 0x52)) = 0;
    move_anim_8072740(sprite);
}

void sub_80D15A4(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBankSpriteId(0);
    task->data[0] = spriteId;
    sub_80798F4(task, spriteId, &gUnknown_083D79BC);
    task->func = sub_80D15E0;
}

void sub_80D15E0(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (sub_807992C(task) == 0)
    {
        gSprites[task->data[0]].pos2.y = 0;
        gSprites[task->data[0]].invisible = 1;
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80D1638(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[12] = 3;
    if (GetBankSide(gBattleAnimBankTarget) == 0)
    {
        task->data[13] = 0xFFFF;
        task->data[14] = 8;
    }
    else
    {
        task->data[13] = 1;
        task->data[14] = -8;
    }

    task->data[15] = GetAnimBankSpriteId(1);
    task->func = sub_80D16A0;
}

void sub_80D16A0(u8 taskId)
{
    struct Task* task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        gSprites[task->data[15]].pos2.x += task->data[14];
        task->data[1] = 0;
        task->data[2] = 0;
        task->data[3] = 0;
        task->data[0]++;
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            task->data[2]++;
            if (task->data[2] & 1)
                gSprites[task->data[15]].pos2.x += 6;
            else
                gSprites[task->data[15]].pos2.x -= 6;

            if (++task->data[3] > 4)
            {
                if (task->data[2] & 1)
                    gSprites[task->data[15]].pos2.x -= 6;

                task->data[0]++;
            }
        }
        break;
    case 2:
        if (--task->data[12] != 0)
            task->data[0] = 0;
        else
            task->data[0]++;
        break;
    case 3:
        gSprites[task->data[15]].pos2.x += task->data[13];
        if (gSprites[task->data[15]].pos2.x == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80D17C4(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 1;
    task->data[13] = 14;
    task->data[14] = 2;
    task->data[15] = GetAnimBankSpriteId(0);
    task->func = sub_80D1808;
}

void sub_80D1808(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (task->data[0] == 0 && ++task->data[1] > task->data[4])
    {
        task->data[1] = 0;
        if (++task->data[2] & 1)
            gSprites[task->data[15]].invisible = 0;
        else
            gSprites[task->data[15]].invisible = 1;

        if (++task->data[3] >= task->data[13])
        {
            if (++task->data[4] < task->data[14])
            {
                task->data[1] = 0;
                task->data[2] = 0;
                task->data[3] = 0;
            }
            else
            {
                gSprites[task->data[15]].invisible = 0;
                DestroyAnimVisualTask(taskId);
            }
        }
    }
}

void sub_80D18D4(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[1] = 4;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0;
    task->data[5] = 0;
    task->data[6] = 0;
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[13] = 0;
    task->data[14] = sub_8077ABC(gBattleAnimBankAttacker, 0);
    task->data[15] = sub_8077ABC(gBattleAnimBankAttacker, 1);
    task->func = sub_80D1930;
}

void sub_80D1930(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[8])
    {
    case 0:
        if (++task->data[4] > 1)
        {
            task->data[4] = 0;
            task->data[5] = (task->data[5] + 1) & 1;
            if (++task->data[6] > 20)
            {
                if (task->data[7] == 0)
                {
                    task->data[6] = 0;
                    task->data[8] = 1;
                }
                else
                    task->data[8] = 2;
            }
        }
        break;
    case 1:
        task->data[5] = 0;
        if (++task->data[4] > 20)
        {
            task->data[7] = 1;
            task->data[8] = 0;
        }
        break;
    case 2:
        task->data[5] = 1;
        break;
    }

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 4)
        {
            u8 spriteId;
            task->data[1] = 0;
            spriteId = CreateSprite(&gSpriteTemplate_83D79E8, task->data[14], task->data[15], 0);
            if (spriteId != 64)
            {
                gSprites[spriteId].data[0] = taskId;
                gSprites[spriteId].data[1] = 13;
                gSprites[spriteId].pos2.x = gUnknown_083D7A00[task->data[2]][0];
                gSprites[spriteId].pos2.y = gUnknown_083D7A00[task->data[2]][1];
                task->data[13]++;
                if (++task->data[2] > 3)
                {
                    task->data[2] = 0;
                    if (++task->data[3] > 5)
                        task->data[0]++;
                }
            }
        }
        break;
    case 1:
        if (task->data[13] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80D1A70(struct Sprite* sprite)
{
    sprite->invisible = gTasks[sprite->data[0]].data[5];
    if (sprite->animEnded)
    {
        gTasks[sprite->data[0]].data[sprite->data[1]]--;
        DestroySprite(sprite);
    }
}

void sub_80D1ADC(u8 taskId)
{
    int i;
    u8 sp[8];
    void* src;
    void* dest;
    void* what;
    sp[0] = IndexOfSpritePaletteTag(0x27DE);
    for (i = 1; i <= 4; i++)
    {
        sp[i] = AllocSpritePalette(0x2710 - i);
    }

    src = &gBattleAnimSpritePalette_206;
    dest = (NotInBattle()) ? gSharedMem + 0x18000 - 0x3800: gSharedMem + 0x18000;
    LZDecompressWram(src, dest);
    for (i = 0; i <= 4; i++)
    {
        what = ((NotInBattle()) ? gSharedMem + 0x14800 : gSharedMem + 0x18000) + (i << 5);
        LoadPalette(what, (u16)((sp[i] << 4) + 0x100), 32);
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80D1B80(u8 taskId)
{
    int i;
    for (i = 0; i < 5; i++)
    {
        FreeSpritePaletteByTag(gUnknown_083D7A5C[i]);
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80D1BA8(struct Sprite* sprite, u8 a, u8 b)
{
    u8 tile;
    tile = (b & 1);
    tile = ((-tile | tile) >> 31) & 32;
    sprite->oam.tileNum += tile + (a << 2);
    sprite->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_083D7A5C[b >> 1]);
}

void sub_80D1C08(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 0) + gBattleAnimArgs[2];
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 1) + gBattleAnimArgs[3];
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sub_80D1BA8(sprite, gBattleAnimArgs[5], gBattleAnimArgs[6]);
}

void sub_80D1C80(struct Sprite* sprite)
{
    if (++sprite->data[0] == 1)
        sub_80787B0(sprite, 0);

    sprite->pos2.x = Sin(sprite->data[1], 8);
    sprite->pos2.y = sprite->data[2] >> 8;
    sprite->data[1] = (sprite->data[1] + 7) & 0xFF;
    sprite->data[2] -= 0x80;
    if (sprite->data[0] == 0x3C)
        move_anim_8072740(sprite);
}

void sub_80D1CD0(u8 taskId)
{
    int zero;
    bool8 result = NotInBattle();
    u16 var = 0xF0;
    if (result)
    {
        var = 0x98;
        zero = 0;
    }
    else
    {
        zero = 0;
    }

    gUnknown_030042C4 = var;
    gUnknown_03004240 = 0xA0;
    (*(vu16 *)(0x4000000 + 0x40)) = var;
    (*(vu16 *)(0x4000000 + 0x44)) = 0xA0;
    (*(vu16 *)(0x4000000 + 0x48)) = 0x3F1F;
    (*(vu16 *)(0x4000000 + 0x4a)) = 0x3F3F;
    (*(vu16 *)(0x4000000 + 0x50)) = 0xC8;
    (*(vu16 *)(0x4000000 + 0x54)) = 0x10;
    gTasks[taskId].data[0] = zero;
    gTasks[taskId].data[1] = var;
    gTasks[taskId].func = sub_80D1D48;
}

void sub_80D1D48(u8 taskId)
{
    gTasks[taskId].data[0] += 13;
    gTasks[taskId].data[1] -= 13;
    if (gTasks[taskId].data[0] >= gTasks[taskId].data[1])
    {
        gUnknown_030042C4 = 0;
        gTasks[taskId].func = sub_80D1D9C;
    }
    else
    {
        gUnknown_030042C4 = gTasks[taskId].data[1] | (gTasks[taskId].data[0] << 8);
    }
}

void sub_80D1D9C(u8 taskId)
{
    if (++gTasks[taskId].data[10] == 5)
    {
        gTasks[taskId].data[11] = 0x88;
        RequestSpriteCopy((u8 *)(&gTasks[taskId].data[11]), (u8 *)(&(*(vu16 *)(0x4000000 + 0x50))), 2);
        BlendPalettes(sub_80791A8(1, 0, 0, 0, 0, 0, 0), 16, ((31) | ((31) << 5) | ((31) << 10)));
    }
    else if (gTasks[taskId].data[10] > 4)
    {
        gUnknown_030042C4 = 0;
        gUnknown_03004240 = 0;
        (*(vu16 *)(0x4000000 + 0x48)) = 0x3F3F;
        (*(vu16 *)(0x4000000 + 0x4a)) = 0x3F3F;
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x54)) = 0;
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80D1E38(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(1);
    if (++gTasks[taskId].data[0] == 1)
    {
        sub_80798F4(&gTasks[taskId], GetAnimBankSpriteId(1), &gUnknown_083D7A98);
        gSprites[spriteId].pos2.x = 4;
    }
    else
    {
        gSprites[spriteId].pos2.x = -gSprites[spriteId].pos2.x;
        if (sub_807992C(&gTasks[taskId]) == 0)
        {
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_80D1EC8(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(0);
    if (++gTasks[taskId].data[0] == 1)
    {
        sub_80798F4(&gTasks[taskId], GetAnimBankSpriteId(0), &gUnknown_083D7A98);
        gSprites[spriteId].pos2.x = 4;
    }
    else
    {
        gSprites[spriteId].pos2.x = -gSprites[spriteId].pos2.x;
        if (sub_807992C(&gTasks[taskId]) == 0)
        {
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_80D1F58(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = 0x5F;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->callback = sub_80D1FA4;
}

void sub_80D1FA4(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) == 0)
    {
        sprite->pos2.y += Sin(sprite->data[5], 14);
        sprite->data[5] = (sprite->data[5] + 4) & 0xFF;
    }
    else
    {
        move_anim_8072740(sprite);
    }
}

void sub_80D1FDC(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[1];
        sprite->data[0]++;
    }
    else
    {
        sprite->data[4] += sprite->data[1];
        sprite->pos2.x = sprite->data[4] >> 8;
        sprite->pos2.y = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
        if (sprite->data[3] > 0x64)
        {
            sprite->invisible = sprite->data[3] % 2;
        }

        if (sprite->data[3] > 0x78)
        {
            move_anim_8072740(sprite);
        }
    }
}

void sub_80D2064(struct Sprite* sprite)
{
    sprite->pos1.x = gBattleAnimArgs[0];
    sprite->pos1.y = 0xA0;
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, sub_80D2094);
}

void sub_80D2094(struct Sprite* sprite)
{
    s16 y;
    sprite->data[2] += sprite->data[1];
    sprite->pos2.y = -((u16)sprite->data[2] >> 8);
    sprite->pos2.x = Sin(sprite->data[3], 4);
    sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
    y = sprite->pos1.y + sprite->pos2.y;
    if (y <= 0x48)
    {
        sprite->invisible = sprite->data[3] % 2;
        if (y <= 0x40)
            move_anim_8072740(sprite);
    }
}

void sub_80D2100(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    u8* tempvar;
    (*(vu16 *)(0x4000000 + 0x50)) = 0x3F42;
    (*(vu16 *)(0x4000000 + 0x52)) = 0x1000;
    (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).priority = 3;
    (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).screenSize = 0;
    if (!NotInBattle())
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).charBaseBlock = 1;

    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    (*(vu16 *)(0x4000000 + 0x14)) = 0;
    (*(vu16 *)(0x4000000 + 0x16)) = 0;
    sub_8078914(&subStruct);
    tempvar = subStruct.field_4;
    { vu32 tmp = (vu32)(0x0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(tempvar); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x1000)/(32/8))); dmaRegs[2]; }; };
    LZDecompressVram(&gAttractTilemap, tempvar);
    LZDecompressVram(&gAttractGfx, subStruct.field_0);
    LoadCompressedPalette(&gAttractPal, subStruct.field_8 << 4, 32);
    if (NotInBattle())
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);

    gTasks[taskId].func = sub_80D21F0;
}

void sub_80D21F0(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        if (++gTasks[taskId].data[10] == 4)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]++;
            (*(vu16 *)(0x4000000 + 0x52)) = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 16)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 0x8D)
        {
            gTasks[taskId].data[11] = 16;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 4)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]--;
            (*(vu16 *)(0x4000000 + 0x52)) = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        sub_8078914(&subStruct);
        {
            u8 *addr = subStruct.field_0;
            u32 size = 0x2000;
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
        }
        { vu32 *_dest = (vu32 *)(subStruct.field_4); u32 _size = 0x800; { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((_size)/(32/8))); dmaRegs[2]; }; }; };
        if (!NotInBattle())
            (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).charBaseBlock = 0;

        gTasks[taskId].data[12]++;

    case 4:
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x52)) = 0;
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).priority = 1;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80D23B4(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    u8* tempvar;
    (*(vu16 *)(0x4000000 + 0x50)) = 0x3F42;
    (*(vu16 *)(0x4000000 + 0x52)) = 0x1000;
    (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).priority = 1;
    (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).screenSize = 0;
    if (!NotInBattle())
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).charBaseBlock = 1;

    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    (*(vu16 *)(0x4000000 + 0x14)) = 0;
    (*(vu16 *)(0x4000000 + 0x16)) = 0;
    sub_8078914(&subStruct);
    tempvar = subStruct.field_4;
    { vu32 tmp = (vu32)(0x0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(tempvar); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((0x1000)/(32/8))); dmaRegs[2]; }; };
    if (NotInBattle())
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFaceContest, subStruct.field_4);
    else if (GetBankSide(gBattleAnimBankTarget) == 1)
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFacePlayer, subStruct.field_4);
    else
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFaceOpponent, subStruct.field_4);

    LZDecompressVram(&gBattleAnimBackgroundImage_ScaryFace, subStruct.field_0);
    LoadCompressedPalette(&gBattleAnimBackgroundPalette_ScaryFace, subStruct.field_8 << 4, 32);
    if (NotInBattle())
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);

    gTasks[taskId].func = sub_80D24E0;
}

void sub_80D24E0(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]++;
            (*(vu16 *)(0x4000000 + 0x52)) = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 14)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 0x15)
        {
            gTasks[taskId].data[11] = 14;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]--;
            (*(vu16 *)(0x4000000 + 0x52)) = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        sub_8078914(&subStruct);
        {
            u8 *addr = subStruct.field_0;
            u32 size = 0x2000;
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
        }
        { vu32 *_dest = (vu32 *)(subStruct.field_4); u32 _size = 0x800; { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((_size)/(32/8))); dmaRegs[2]; }; }; };
        if (!NotInBattle())
            (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).charBaseBlock = 0;

        gTasks[taskId].data[12]++;

    case 4:
        (*(vu16 *)(0x4000000 + 0x50)) = 0;
        (*(vu16 *)(0x4000000 + 0x52)) = 0;
        (*(struct BGCntrlBitfield *)(0x4000000 + 0xa)).priority = 1;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80D26A4(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->affineAnimPaused = 1;
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[7] = sub_8079E90(gBattleAnimBankAttacker);
    sprite->callback = sub_80D2704;
    sub_80D2704(sprite);
}

void sub_80D2704(struct Sprite* sprite)
{
    if ((u16)(sprite->data[1] - 0x40) <= 0x7F)
        sprite->subpriority = sprite->data[7] + 1;
    else
        sprite->subpriority = sprite->data[7] - 1;

    sprite->pos2.x = Sin(sprite->data[1], sprite->data[2] >> 8);
    sprite->pos2.y = Cos(sprite->data[1], sprite->data[3] >> 8);
    sprite->data[1] = (sprite->data[1] + 9) & 0xFF;
    switch (sprite->data[5])
    {
    case 1:
        sprite->data[2] -= 0x400;
        sprite->data[3] -= 0x100;
        if (++sprite->data[4] == sprite->data[0])
        {
            sprite->data[5] = 2;
            return;
        }
        break;
    case 0:
        sprite->data[2] += 0x400;
        sprite->data[3] += 0x100;
        if (++sprite->data[4] == sprite->data[0])
        {
            sprite->data[4] = 0;
            sprite->data[5] = 1;
        }
        break;
    }

    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
        move_anim_8072740(sprite);
}

void sub_80D27E0(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->data[0] = Sin(gBattleAnimArgs[0], 10);
    sprite->data[1] = Cos(gBattleAnimArgs[0], 7);
    sprite->callback = sub_80D2834;
}

void sub_80D2834(struct Sprite* sprite)
{
    sprite->pos2.x += sprite->data[0];
    sprite->pos2.y += sprite->data[1];
    if (sprite->pos1.x + sprite->pos2.x + 16 > 0x110u || sprite->pos1.y + sprite->pos2.y > 0xA0 || sprite->pos1.y + sprite->pos2.y < -16)
        move_anim_8072740(sprite);
}

void sub_80D287C(struct Sprite* sprite)
{
    sprite->pos2.x += sprite->data[0];
    sprite->pos2.y += sprite->data[1];
    if (sprite->data[3]++ >= sprite->data[2])
        move_anim_8072740(sprite);
}

void sub_80D28AC(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->data[0] = Sin(gBattleAnimArgs[0], 10);
    sprite->data[1] = Cos(gBattleAnimArgs[0], 7);
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->callback = sub_80D287C;
}

void sub_80D2904(struct Sprite* sprite)
{
    if (sprite->animEnded)
        move_anim_8072740(sprite);
}

void sub_80D2920(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->callback = sub_80D2904;
}

void sub_80D2938(struct Sprite* sprite)
{
    s16 r5;
    if (sprite->data[0] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    sprite->data[0]++;
    r5 = (sprite->data[0] * 10) & 0xFF;
    sprite->pos2.x = Sin(r5, 0x50) >> 8;
    if (sprite->data[0] <= 0x4F)
        sprite->pos2.y = (sprite->data[0] / 2) + (Cos(r5, 0x50) >> 8);

    if (sprite->data[0] > 0x5A)
    {
        sprite->data[2]++;
        sprite->pos2.x -= sprite->data[2] / 2;
    }

    if (sprite->data[0] > 0x64)
        move_anim_8072740(sprite);
}

void sub_80D29CC(struct Sprite* sprite)
{
    sprite->data[5]++;
    sprite->pos2.x = Sin(sprite->data[3], 5);
    sprite->pos2.y = sprite->data[5] / 2;
    sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
    if (sprite->data[5] > 20)
        sprite->invisible = sprite->data[5] % 2;

    if (sprite->data[5] > 30)
        move_anim_8072740(sprite);
}

void sub_80D2A38(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[1];
        sprite->data[0]++;
    }
    else
    {
        sprite->data[4] += sprite->data[1];
        sprite->pos2.x = sprite->data[4] >> 8;
        sprite->pos2.y = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
        if (sprite->data[3] > 0x46)
        {
            sprite->callback = sub_80D29CC;
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[3] = Random() % 0xB4;
        }
    }
}
