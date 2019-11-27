# 1 "src/battle/battle_message.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/battle/battle_message.c"
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
# 2 "src/battle/battle_message.c" 2
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
# 3 "src/battle/battle_message.c" 2
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
# 4 "src/battle/battle_message.c" 2
# 1 "include/battle_tower.h" 1






enum
{
    F_EV_SPREAD_HP = 1 << 0,
    F_EV_SPREAD_ATTACK = 1 << 1,
    F_EV_SPREAD_DEFENSE = 1 << 2,
    F_EV_SPREAD_SPEED = 1 << 3,
    F_EV_SPREAD_SP_ATTACK = 1 << 4,
    F_EV_SPREAD_SP_DEFENSE = 1 << 5,
};

enum
{
    BATTLE_TOWER_ITEM_NONE,
    BATTLE_TOWER_ITEM_KINGS_ROCK,
    BATTLE_TOWER_ITEM_SITRUS_BERRY,
    BATTLE_TOWER_ITEM_ORAN_BERRY,
    BATTLE_TOWER_ITEM_CHESTO_BERRY,
    BATTLE_TOWER_ITEM_HARD_STONE,
    BATTLE_TOWER_ITEM_FOCUS_BAND,
    BATTLE_TOWER_ITEM_PERSIM_BERRY,
    BATTLE_TOWER_ITEM_MIRACLE_SEED,
    BATTLE_TOWER_ITEM_BERRY_JUICE,
    BATTLE_TOWER_ITEM_MACHO_BRACE,
    BATTLE_TOWER_ITEM_SILVER_POWDER,
    BATTLE_TOWER_ITEM_CHERI_BERRY,
    BATTLE_TOWER_ITEM_BLACK_GLASSES,
    BATTLE_TOWER_ITEM_BLACK_BELT,
    BATTLE_TOWER_ITEM_SOUL_DEW,
    BATTLE_TOWER_ITEM_CHOICE_BAND,
    BATTLE_TOWER_ITEM_MAGNET,
    BATTLE_TOWER_ITEM_SILK_SCARF,
    BATTLE_TOWER_ITEM_WHITE_HERB,
    BATTLE_TOWER_ITEM_DEEP_SEA_SCALE,
    BATTLE_TOWER_ITEM_DEEP_SEA_TOOTH,
    BATTLE_TOWER_ITEM_MYSTIC_WATER,
    BATTLE_TOWER_ITEM_SHARP_BEAK,
    BATTLE_TOWER_ITEM_QUICK_CLAW,
    BATTLE_TOWER_ITEM_LEFTOVERS,
    BATTLE_TOWER_ITEM_RAWST_BERRY,
    BATTLE_TOWER_ITEM_LIGHT_BALL,
    BATTLE_TOWER_ITEM_POISON_BARB,
    BATTLE_TOWER_ITEM_NEVER_MELT_ICE,
    BATTLE_TOWER_ITEM_ASPEAR_BERRY,
    BATTLE_TOWER_ITEM_SPELL_TAG,
    BATTLE_TOWER_ITEM_BRIGHT_POWDER,
    BATTLE_TOWER_ITEM_LEPPA_BERRY,
    BATTLE_TOWER_ITEM_SCOPE_LENS,
    BATTLE_TOWER_ITEM_TWISTED_SPOON,
    BATTLE_TOWER_ITEM_METAL_COAT,
    BATTLE_TOWER_ITEM_MENTAL_HERB,
    BATTLE_TOWER_ITEM_CHARCOAL,
    BATTLE_TOWER_ITEM_PECHA_BERRY,
    BATTLE_TOWER_ITEM_SOFT_SAND,
    BATTLE_TOWER_ITEM_LUM_BERRY,
    BATTLE_TOWER_ITEM_DRAGON_SCALE,
    BATTLE_TOWER_ITEM_DRAGON_FANG,
    BATTLE_TOWER_ITEM_IAPAPA_BERRY,
    BATTLE_TOWER_ITEM_WIKI_BERRY,
    BATTLE_TOWER_ITEM_SEA_INCENSE,
    BATTLE_TOWER_ITEM_SHELL_BELL,
    BATTLE_TOWER_ITEM_SALAC_BERRY,
    BATTLE_TOWER_ITEM_LANSAT_BERRY,
    BATTLE_TOWER_ITEM_APICOT_BERRY,
    BATTLE_TOWER_ITEM_STARF_BERRY,
    BATTLE_TOWER_ITEM_LIECHI_BERRY,
    BATTLE_TOWER_ITEM_STICK,
    BATTLE_TOWER_ITEM_LAX_INCENSE,
    BATTLE_TOWER_ITEM_AGUAV_BERRY,
    BATTLE_TOWER_ITEM_FIGY_BERRY,
    BATTLE_TOWER_ITEM_THICK_CLUB,
    BATTLE_TOWER_ITEM_MAGO_BERRY,
    BATTLE_TOWER_ITEM_METAL_POWDER,
    BATTLE_TOWER_ITEM_PETAYA_BERRY,
    BATTLE_TOWER_ITEM_LUCKY_PUNCH,
    BATTLE_TOWER_ITEM_GANLON_BERRY,
};

struct BattleTowerPokemon
{
            u16 species;
            u8 heldItem;
            u8 teamFlags;
            u16 moves[4];
            u8 evSpread;
            u8 nature;
};

u16 GetCurrentBattleTowerWinStreak(u8);
void sub_8134AC0(struct BattleTowerRecord *);
u16 sub_8135D3C(u8);
void SetEReaderTrainerName(u8*);
u8 GetEReaderTrainerPicIndex(void);
u8 GetEReaderTrainerClassNameIndex(void);
void ValidateEReaderTrainer(void);
# 5 "src/battle/battle_message.c" 2
# 1 "include/item.h" 1




typedef void (*ItemUseFunc)(u8);

struct Item
{
    u8 name[18];
    u16 itemId;
    u16 price;
    u8 holdEffect;
    u8 holdEffectParam;
    const u8 *description;
    u8 importance;
    u8 unk19;
    u8 pocket;
    u8 type;
    ItemUseFunc fieldUseFunc;
    u8 battleUsage;
    ItemUseFunc battleUseFunc;
    u8 secondaryId;
};

struct BagPocket
{
    struct ItemSlot *itemSlots;
    u8 capacity;
};



extern const struct BagPocket gBagPockets[5];

void CopyItemName(u16 itemId, u8 *string);
bool8 IsBagPocketNonEmpty(u8 pocket);
bool8 CheckBagHasItem(u16 itemId, u16 count);
bool8 CheckBagHasSpace(u16 itemId, u16 count);
bool8 AddBagItem(u16 itemId, u16 count);
bool8 RemoveBagItem(u16 itemId, u16 count);
u8 GetPocketByItemId(u16 itemId);
void ClearItemSlots(struct ItemSlot *itemSlots, u8 b);
u8 CountUsedPCItemSlots(void);
bool8 CheckPCHasItem(u16 itemId, u16 count);
bool8 AddPCItem(u16 itemId, u16 count);
void RemovePCItem(u8 index, u16 count);
void SwapRegisteredBike(void);
const struct Item *ItemId_GetItem(u16 itemId);
u16 ItemId_GetId(u16 itemId);
u16 ItemId_GetPrice(u16 itemId);
u8 ItemId_GetHoldEffect(u16 itemId);
u8 ItemId_GetHoldEffectParam(u16 itemId);
const u8 *ItemId_GetDescription(u16 itemId);
bool32 ItemId_CopyDescription(u8 *a, u32 itemId, u32 c);
u8 ItemId_GetImportance(u16 itemId);
u8 ItemId_GetUnknownValue(u16 itemId);
u8 ItemId_GetPocket(u16 itemId);
u8 ItemId_GetType(u16 itemId);
ItemUseFunc ItemId_GetFieldFunc(u16 itemId);
u8 ItemId_GetBattleUsage(u16 itemId);
ItemUseFunc ItemId_GetBattleFunc(u16 itemId);
u8 ItemId_GetSecondaryId(u16 itemId);
# 6 "src/battle/battle_message.c" 2
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
# 7 "src/battle/battle_message.c" 2
# 1 "include/pokemon.h" 1
# 8 "src/battle/battle_message.c" 2
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
# 9 "src/battle/battle_message.c" 2
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
# 10 "src/battle/battle_message.c" 2
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
# 11 "src/battle/battle_message.c" 2
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
# 12 "src/battle/battle_message.c" 2
# 1 "include/battle_setup.h" 1







struct TrainerPartyMember0
{
    u16 iv;
    u8 level;
    u16 species;
};


struct TrainerPartyMember1
{
    u16 iv;
    u8 level;
    u16 species;
    u16 moves[4];
};


struct TrainerPartyMember2
{
    u16 iv;
    u8 level;
    u16 species;
    u16 heldItem;
};


struct TrainerPartyMember3
{
    u16 iv;
    u8 level;
    u16 species;
    u16 heldItem;
    u16 moves[4];
};

struct TrainerEyeTrainer
{
   u16 opponentIDs[5];
   u16 mapGroup;
   u16 mapNum;
};

void BattleSetup_StartWildBattle(void);
void BattleSetup_StartRoamerBattle(void);
void BattleSetup_StartScriptedWildBattle(void);
s8 BattleSetup_GetTerrain(void);
u8 BattleSetup_GetBattleTowerBattleTransition(void);
u8 *BattleSetup_ConfigureTrainerBattle(const u8 *data);
void TrainerWantsBattle(u8, u8 *);

bool32 GetTrainerFlagFromScriptPointer(u8 *data);





u8 HasTrainerAlreadyBeenFought(u16);
void trainer_flag_set(u16);
void trainer_flag_clear(u16);
void BattleSetup_StartTrainerBattle(void);
void sub_808260C(void);
void do_choose_name_or_words_screen(void);


u8 *BattleSetup_GetScriptAddrAfterBattle(void);
u8 *BattleSetup_GetTrainerPostBattleScript(void);



u8 *sub_808281C(void);
u8 *sub_8082830(void);

u8 *sub_8082880(void);
# 92 "include/battle_setup.h"
void sub_8082B78(void);

void sub_8082BD0(u16, u16);
s32 sub_8082C0C(u16 mapGroup, u16 mapNum);
s32 unref_sub_8082C2C(u16 mapGroup, u16 mapNum);
u16 sub_8082C4C(u16 a1);


void sub_8082CB8(void);
# 13 "src/battle/battle_message.c" 2

# 1 "include/flags.h" 1
# 94 "include/flags.h"
bool8 FlagGet(u16 flag);
# 15 "src/battle/battle_message.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 16 "src/battle/battle_message.c" 2





# 1 "src/battle/../data/battle_strings.h" 1
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
# 2 "src/battle/../data/battle_strings.h" 2

enum
{
    BATTLE_TEXT_UnknownString = 12,
    BATTLE_TEXT_GainExpPoints,
    BATTLE_TEXT_GrewLevel,
    BATTLE_TEXT_LearnedMove,
    BATTLE_TEXT_TryingToLearnMove,
    BATTLE_TEXT_CantLearnMore,
    BATTLE_TEXT_DeleteMove,
    BATTLE_TEXT_DeletedMove,
    BATTLE_TEXT_StopLearning,
    BATTLE_TEXT_DidNotLearn,
    BATTLE_TEXT_LearnedMove2,
    BATTLE_TEXT_AttackMissed,
    BATTLE_TEXT_ProtectedItself,
    BATTLE_TEXT_StatNoHigher,
    BATTLE_TEXT_AvoidedDamage,
    BATTLE_TEXT_DoesntAffect,
    BATTLE_TEXT_AttackingFainted,
    BATTLE_TEXT_DefendingFainted,
    BATTLE_TEXT_WinningPrize,
    BATTLE_TEXT_OutOfUsablePoke,
    BATTLE_TEXT_WhitedOut,
    BATTLE_TEXT_PreventEscape,
    BATTLE_TEXT_HitMulti,
    BATTLE_TEXT_FellAsleep,
    BATTLE_TEXT_MadeAsleep,
    BATTLE_TEXT_DefendingAsleep,
    BATTLE_TEXT_AttackingAsleep,
    BATTLE_TEXT_WasntAffected,
    BATTLE_TEXT_Poisoned,
    BATTLE_TEXT_Poisoned2,
    BATTLE_TEXT_PoisonHurt,
    BATTLE_TEXT_AlreadyPoisoned,
    BATTLE_TEXT_BadlyPoisoned,
    BATTLE_TEXT_EnergyDrained,
    BATTLE_TEXT_Burned,
    BATTLE_TEXT_Burned2,
    BATTLE_TEXT_BurnHurt,
    BATTLE_TEXT_Frozen,
    BATTLE_TEXT_Frozen2,
    BATTLE_TEXT_FrozenSolid,
    BATTLE_TEXT_DefendingDefrosted,
    BATTLE_TEXT_AttackingDefrosted,
    BATTLE_TEXT_Defrosted,
    BATTLE_TEXT_Paralyzed,
    BATTLE_TEXT_Paralyzed2,
    BATTLE_TEXT_Paralyzed3,
    BATTLE_TEXT_AlreadyParalyzed,
    BATTLE_TEXT_ParalysisHealed,
    BATTLE_TEXT_DreamEaten,
    BATTLE_TEXT_AttackingStatNoHigher,
    BATTLE_TEXT_DefendingStatNoHigher,
    BATTLE_TEXT_StoppedWorking,
    BATTLE_TEXT_StoppedWorking2,
    BATTLE_TEXT_Confused,
    BATTLE_TEXT_ConfusionSnapOut,
    BATTLE_TEXT_BecameConfused,
    BATTLE_TEXT_AlreadyConfused,
    BATTLE_TEXT_FellLove,
    BATTLE_TEXT_InLoveWith,
    BATTLE_TEXT_ImmobilizedBy,
    BATTLE_TEXT_BlownAway,
    BATTLE_TEXT_TypeTransform,
    BATTLE_TEXT_Flinched,
    BATTLE_TEXT_RegainedHealth,
    BATTLE_TEXT_HPFull,
    BATTLE_TEXT_RaisedSpDef,
    BATTLE_TEXT_RaisedDefense,
    BATTLE_TEXT_CoveredVeil,
    BATTLE_TEXT_SafeguardActive,
    BATTLE_TEXT_SafeguardFaded,
    BATTLE_TEXT_WentToSleep,
    BATTLE_TEXT_SpeltHealthy,
    BATTLE_TEXT_WhipWhirlwind,
    BATTLE_TEXT_TookSunlight,
    BATTLE_TEXT_LoweredHead,
    BATTLE_TEXT_IsGlowing,
    BATTLE_TEXT_FlewHigh,
    BATTLE_TEXT_DugHole,
    BATTLE_TEXT_SqueezedBind,
    BATTLE_TEXT_TrappedVortex,
    BATTLE_TEXT_Wrapped,
    BATTLE_TEXT_Clamped,
    BATTLE_TEXT_HurtBy,
    BATTLE_TEXT_FreedFrom,
    BATTLE_TEXT_KeptGoingCrash,
    BATTLE_TEXT_MistShroud,
    BATTLE_TEXT_MistProtect,
    BATTLE_TEXT_GetPumped,
    BATTLE_TEXT_HitRecoil,
    BATTLE_TEXT_ProtectedItself2,
    BATTLE_TEXT_SandBuffeted,
    BATTLE_TEXT_HailStricken,
    BATTLE_TEXT_WasSeeded,
    BATTLE_TEXT_EvadedAttack,
    BATTLE_TEXT_HealthSapped,
    BATTLE_TEXT_FastAsleep,
    BATTLE_TEXT_WokeUp,
    BATTLE_TEXT_UproarAwake,
    BATTLE_TEXT_UproarWoke,
    BATTLE_TEXT_UproarCaused,
    BATTLE_TEXT_UproarMaking,
    BATTLE_TEXT_CalmedDown,
    BATTLE_TEXT_UproarCantSleep,
    BATTLE_TEXT_Stockpiled,
    BATTLE_TEXT_StockpiledCant,
    BATTLE_TEXT_UproarCantSleep2,
    BATTLE_TEXT_UproarKeptAwake,
    BATTLE_TEXT_StayedAwake,
    BATTLE_TEXT_StoringEnergy,
    BATTLE_TEXT_UnleashedEnergy,
    BATTLE_TEXT_FatigueConfuse,
    BATTLE_TEXT_PickedUpYen,
    BATTLE_TEXT_Unaffected,
    BATTLE_TEXT_Transformed,
    BATTLE_TEXT_SubMade,
    BATTLE_TEXT_SubAlready,
    BATTLE_TEXT_SubTookDamage,
    BATTLE_TEXT_SubFaded,
    BATTLE_TEXT_MustRecharge,
    BATTLE_TEXT_RageBuilding,
    BATTLE_TEXT_MoveWasDisabled,
    BATTLE_TEXT_MoveIsDisabled,
    BATTLE_TEXT_DisabledNoMore,
    BATTLE_TEXT_EncoreGot,
    BATTLE_TEXT_EncoreEnded,
    BATTLE_TEXT_TookAim,
    BATTLE_TEXT_SketchedMove,
    BATTLE_TEXT_DestinyBondTake,
    BATTLE_TEXT_DestinyBondTaken,
    BATTLE_TEXT_ReducedBy,
    BATTLE_TEXT_StoleSomething,
    BATTLE_TEXT_CantEscapeNow,
    BATTLE_TEXT_NightmareStart,
    BATTLE_TEXT_NightmareLock,
    BATTLE_TEXT_CurseLay,
    BATTLE_TEXT_CurseAfflict,
    BATTLE_TEXT_SpikesScattered,
    BATTLE_TEXT_SpikesHurt,
    BATTLE_TEXT_IdentifiedPoke,
    BATTLE_TEXT_PerishSongFell,
    BATTLE_TEXT_BracedItself,
    BATTLE_TEXT_EnduredHit,
    BATTLE_TEXT_MagnitudeCount,
    BATTLE_TEXT_CutHPMaxATK,
    BATTLE_TEXT_CopyStatChanges,
    BATTLE_TEXT_GotFreeFrom,
    BATTLE_TEXT_LeechShed,
    BATTLE_TEXT_SpikesBlownAway,
    BATTLE_TEXT_FledBattle,
    BATTLE_TEXT_ForesawAttack,
    BATTLE_TEXT_TookAttack,
    BATTLE_TEXT_PokeAttack,
    BATTLE_TEXT_CenterAttention,
    BATTLE_TEXT_ChargingPower,
    BATTLE_TEXT_NaturePower,
    BATTLE_TEXT_StatusNormal,
    BATTLE_TEXT_NoMovesLeft,
    BATTLE_TEXT_TormentSubject,
    BATTLE_TEXT_TormentNoUse,
    BATTLE_TEXT_TightenFocus,
    BATTLE_TEXT_TauntFell,
    BATTLE_TEXT_TauntNoUse,
    BATTLE_TEXT_ReadyToHelp,
    BATTLE_TEXT_SwitchedItems,
    BATTLE_TEXT_CopiedObject,
    BATTLE_TEXT_WishMade,
    BATTLE_TEXT_WishTrue,
    BATTLE_TEXT_PlantedRoots,
    BATTLE_TEXT_AbsorbNutrients,
    BATTLE_TEXT_AnchoredItself,
    BATTLE_TEXT_DrowsyMade,
    BATTLE_TEXT_KnockedOffItem,
    BATTLE_TEXT_AbilitySwap,
    BATTLE_TEXT_SealedMove,
    BATTLE_TEXT_SealedNoUse,
    BATTLE_TEXT_GrudgeBear,
    BATTLE_TEXT_GrudgeLosePP,
    BATTLE_TEXT_ShroudedItself,
    BATTLE_TEXT_MagicCoatBounce,
    BATTLE_TEXT_AwaitMove,
    BATTLE_TEXT_SnatchedMove,
    BATTLE_TEXT_RainMade,
    BATTLE_TEXT_SpeedRisen,
    BATTLE_TEXT_ProtectedBy,
    BATTLE_TEXT_PreventedBy,
    BATTLE_TEXT_HPRestoredUsing,
    BATTLE_TEXT_MadeType,
    BATTLE_TEXT_PreventedPara,
    BATTLE_TEXT_PreventedRomance,
    BATTLE_TEXT_PreventedPoison,
    BATTLE_TEXT_PreventedConfusion,
    BATTLE_TEXT_RaisedFirePower,
    BATTLE_TEXT_AnchorsItself,
    BATTLE_TEXT_CutsAttack,
    BATTLE_TEXT_PreventedStatLoss,
    BATTLE_TEXT_HurtOther,
    BATTLE_TEXT_Traced,
    BATTLE_TEXT_Sharply,
    BATTLE_TEXT_Rose,
    BATTLE_TEXT_Harshly,
    BATTLE_TEXT_Fell,
    BATTLE_TEXT_UnknownString7,
    BATTLE_TEXT_UnknownString3,
    BATTLE_TEXT_UnknownString5,
    BATTLE_TEXT_UnknownString6,
    BATTLE_TEXT_Critical,
    BATTLE_TEXT_GrandSlam,
    BATTLE_TEXT_MoveForget123,
    BATTLE_TEXT_MoveForgetAnd,
    BATTLE_TEXT_NotEffective,
    BATTLE_TEXT_SuperEffective,
    BATTLE_TEXT_GotAwaySafely,
    BATTLE_TEXT_FledWild,
    BATTLE_TEXT_NoRunning,
    BATTLE_TEXT_CantEscape2,
    BATTLE_TEXT_BirchDontLeaveMe,
    BATTLE_TEXT_Nothing,
    BATTLE_TEXT_Failed,
    BATTLE_TEXT_HurtItself,
    BATTLE_TEXT_MirrorFail,
    BATTLE_TEXT_RainStart,
    BATTLE_TEXT_PourStart,
    BATTLE_TEXT_RainCont1,
    BATTLE_TEXT_PourCont,
    BATTLE_TEXT_RainStop,
    BATTLE_TEXT_SandBrewed,
    BATTLE_TEXT_SandRages,
    BATTLE_TEXT_SandSubsided,
    BATTLE_TEXT_SunBright,
    BATTLE_TEXT_SunStrong,
    BATTLE_TEXT_SunFaded,
    BATTLE_TEXT_HailStart,
    BATTLE_TEXT_HailCont,
    BATTLE_TEXT_HailStop,
    BATTLE_TEXT_SpitUpFail,
    BATTLE_TEXT_SwallowFail,
    BATTLE_TEXT_WindHeatWave,
    BATTLE_TEXT_StatElim,
    BATTLE_TEXT_CoinScatter,
    BATTLE_TEXT_SubWeak,
    BATTLE_TEXT_PainSplit,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_PerishSong,
    BATTLE_TEXT_NoPP1,
    BATTLE_TEXT_NoPP2,
    BATTLE_TEXT_Used1,
    BATTLE_TEXT_TutorialUsed,
    BATTLE_TEXT_BlockBall,
    BATTLE_TEXT_DontBeAThief,
    BATTLE_TEXT_DodgeBall,
    BATTLE_TEXT_MissPoke,
    BATTLE_TEXT_BallBrokeOhNo,
    BATTLE_TEXT_BallBrokeAppeared,
    BATTLE_TEXT_BallBrokeAlmost,
    BATTLE_TEXT_BallBrokeSoClose,
    BATTLE_TEXT_BallCaught1,
    BATTLE_TEXT_BallCaught2,
    BATTLE_TEXT_GiveNickname,
    BATTLE_TEXT_SentToPC,
    BATTLE_TEXT_AddedToDex,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Sandstorm,
    BATTLE_TEXT_CantEscape,
    BATTLE_TEXT_IgnoredOrdersSLP,
    BATTLE_TEXT_IgnoredOrders,
    BATTLE_TEXT_BeganNap,
    BATTLE_TEXT_LoafingAround,
    BATTLE_TEXT_WontObey,
    BATTLE_TEXT_TurnedAway,
    BATTLE_TEXT_NotNotice,
    BATTLE_TEXT_WillSwitch,
    BATTLE_TEXT_CreptCloser,
    BATTLE_TEXT_CantGetCloser,
    BATTLE_TEXT_WatchingCarefully,
    BATTLE_TEXT_CuriousAbout,
    BATTLE_TEXT_EnthralledBy,
    BATTLE_TEXT_IgnoredThing,
    BATTLE_TEXT_ThrewBlock,
    BATTLE_TEXT_SafariOver,
    BATTLE_TEXT_CuredParalysis,
    BATTLE_TEXT_CuredPoison,
    BATTLE_TEXT_CuredBurn,
    BATTLE_TEXT_CuredFreeze,
    BATTLE_TEXT_CuredSleep,
    BATTLE_TEXT_CuredConfusion,
    BATTLE_TEXT_CuredStatus,
    BATTLE_TEXT_RestoredHealth,
    BATTLE_TEXT_RestoredPP,
    BATTLE_TEXT_RestoredStatus,
    BATTLE_TEXT_RestoredHPLittle,
    BATTLE_TEXT_ChoiceBand,
    BATTLE_TEXT_FocusSash,
    BATTLE_TEXT_Terminator2,
    BATTLE_TEXT_PreventedBurn,
    BATTLE_TEXT_BlocksOther,
    BATTLE_TEXT_RestoredHPByItem,
    BATTLE_TEXT_WhipSandstorm,
    BATTLE_TEXT_PreventedLoss,
    BATTLE_TEXT_InfatuatedPoke,
    BATTLE_TEXT_MadeIneffective,
    BATTLE_TEXT_CuredProblem,
    BATTLE_TEXT_OozeSuckup,
    BATTLE_TEXT_Transformed2,
    BATTLE_TEXT_ElecWeakened,
    BATTLE_TEXT_FireWeakened,
    BATTLE_TEXT_HidUnderwater,
    BATTLE_TEXT_SprangUp,
    BATTLE_TEXT_CantForgetHM,
    BATTLE_TEXT_FoundOne,
    BATTLE_TEXT_PlayerDefeatedTrainer2,
    BATTLE_TEXT_SoothingAroma,
    BATTLE_TEXT_CantUseItems,
    BATTLE_TEXT_UnknownString2,
    BATTLE_TEXT_UnknownString4,
    BATTLE_TEXT_HustleUse,
    BATTLE_TEXT_MadeUseless,
    BATTLE_TEXT_SandTombTrapped,
    BATTLE_TEXT_Terminator,
    BATTLE_TEXT_BoostedExp,
    BATTLE_TEXT_SunIntensified,
    BATTLE_TEXT_GroundMoveNegate,
    BATTLE_TEXT_WallyBall,
    BATTLE_TEXT_TookAttack2,
    BATTLE_TEXT_ChoseDestiny,
    BATTLE_TEXT_LostFocus,
    BATTLE_TEXT_UseNext,
    BATTLE_TEXT_FledUsingItem,
    BATTLE_TEXT_FledUsingOther,
    BATTLE_TEXT_DraggedOut,
    BATTLE_TEXT_PreventedOther,
    BATTLE_TEXT_NormalizedStatus,
    BATTLE_TEXT_Used2,
    BATTLE_TEXT_BoxFull,
    BATTLE_TEXT_AvoidedAttack,
    BATTLE_TEXT_MadeIneffective2,
    BATTLE_TEXT_PreventedFlinching,
    BATTLE_TEXT_AlreadyBurned,
    BATTLE_TEXT_StatNoLower,
    BATTLE_TEXT_BlocksOther2,
    BATTLE_TEXT_WoreOff,
    BATTLE_TEXT_RaisedDefenseLittle,
    BATTLE_TEXT_RaisedSpDefLittle,
    BATTLE_TEXT_BrokeWall,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_CuredOfProblem,
    BATTLE_TEXT_AttackingCantEscape,
    BATTLE_TEXT_Obtained1,
    BATTLE_TEXT_Obtained2,
    BATTLE_TEXT_Obtained3,
    BATTLE_TEXT_NoEffect,
    BATTLE_TEXT_NoEffectOn,
};

const u8 BattleText_UnknownString[] = _("{STRING 33}");
const u8 BattleText_GainExpPoints[] = _("{STRING 0}{STRING 1}{STRING 42} 경험치를 얻었다!\p");
const u8 BattleText_Terminator[] = _("{K_EUNNEUN}\n");
const u8 BattleText_BoostedExp[] = _("{K_EUNNEUN} 많은 양의\n");
const u8 BattleText_GrewLevel[] = _("{STRING 0}{K_EUNNEUN}\n레벨{STRING 1}{K_EU}로 올랐다!{UNKNOWN_A}\p");
const u8 BattleText_LearnedMove[] = _("{STRING 0}{K_EUNNEUN}\n{STRING 1}{K_EULREUL} 배웠다!{UNKNOWN_A}\p");
const u8 BattleText_TryingToLearnMove[] = _("{STRING 0}{K_EUNNEUN} 새로\n{STRING 1}{K_EULREUL} 배우고 싶다...\p");
const u8 BattleText_CantLearnMore[] = _("그러나 {STRING 0}{K_EUNNEUN} 기술을 4개\n알고 있으므로 더 이상 배울 수 없다!\p");
const u8 BattleText_DeleteMove[] = _("{STRING 1} 대신\n다른 기술을 잊게 하겠습니까?");
const u8 BattleText_DeletedMove[] = _("{STRING 0}{K_EUNNEUN} {STRING 1}{K_EULREUL}\n깨끗이 잊었다!\p");
const u8 BattleText_StopLearning[] = _("{PAUSE 32}그럼... {STRING 1}{K_EULREUL}\n배우는 것을 포기하겠습니까?");
const u8 BattleText_DidNotLearn[] = _("{STRING 0}{K_EUNNEUN} {STRING 1}{K_EULREUL}\n결국 배우지 않았다!\p");
const u8 BattleText_UseNext[] = _("다음 포켓몬을 쓰겠습니까?");
const u8 BattleText_AttackMissed[] = _("그러나 {ATTACKING_MON}의\n공격은 빗나갔다!");
const u8 BattleText_ProtectedItself[] = _("{DEFENDING_MON}{K_EUNNEUN}\n공격으로부터 몸을 지켰다!");
const u8 BattleText_AvoidedDamage[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n데미지를 입지 않는다!");
const u8 BattleText_GroundMoveNegate[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n땅타입 기술에 당하지 않는다!");
const u8 BattleText_AvoidedAttack[] = _("{DEFENDING_MON}에게는\n맞지 않았다!");
const u8 BattleText_DoesntAffect[] = _("{DEFENDING_MON}에게는\n효과가 없는 것 같다...");
const u8 BattleText_AttackingFainted[] = _("{ATTACKING_MON}{K_EUNNEUN} 쓰러졌다!\p");
const u8 BattleText_DefendingFainted[] = _("{DEFENDING_MON}{K_EUNNEUN} 쓰러졌다!\p");
const u8 BattleText_WinningPrize[] = _("{STRING 32}{K_EUNNEUN} 상금으로\n{STRING 0}원을 손에 넣었다!\p");
const u8 BattleText_OutOfUsablePoke[] = _("{STRING 32}에게는\n싸울 수 있는 포켓몬이 없다!\p");
const u8 BattleText_WhitedOut[] = _("{STRING 32}{K_EUNNEUN}\n눈앞이 캄캄해졌다!{PAUSE_UNTIL_PRESS}");
const u8 BattleText_PreventEscape[] = _("{STRING 16}의\n{STRING 23} 때문에 도망칠 수 없다!\p");
const u8 BattleText_CantEscape[] = _("도망칠 수 없다!\p");
const u8 BattleText_AttackingCantEscape[] = _("{ATTACKING_MON}{K_EUNNEUN}\n도망칠 수 없다!");
const u8 BattleText_HitMulti[] = _("{STRING 0}번 맞았다!");
const u8 BattleText_FellAsleep[] = _("{STRING 14}{K_EUNNEUN}\n잠들어 버렸다!");
const u8 BattleText_MadeAsleep[] = _("{STRING 16}의 {STRING 23} 때문에\n{STRING 14}{K_EUNNEUN} 잠들어 버렸다!");
const u8 BattleText_DefendingAsleep[] = _("{DEFENDING_MON}{K_EUNNEUN}\n이미 잠들어 있다");
const u8 BattleText_AttackingAsleep[] = _("{ATTACKING_MON}{K_EUNNEUN}\n이미 잠들어 있다");
const u8 BattleText_WasntAffected[] = _("{DEFENDING_MON}에게는\n전혀 효과가 없다!");
const u8 BattleText_Poisoned[] = _("{STRING 14}의\n몸에 독이 퍼졌다!");
const u8 BattleText_Poisoned2[] = _("{STRING 16}의 {STRING 23} 때문에\n{STRING 14}의 몸에 독이 퍼졌다!");
const u8 BattleText_PoisonHurt[] = _("{ATTACKING_MON}{K_EUNNEUN}\n독에 의한 데미지를 입고 있다!");
const u8 BattleText_AlreadyPoisoned[] = _("{DEFENDING_MON}{K_EUNNEUN} 이미\n몸에 독이 퍼진 상태다");
const u8 BattleText_BadlyPoisoned[] = _("{STRING 14}의\n몸에 맹독이 퍼졌다!");
const u8 BattleText_EnergyDrained[] = _("{DEFENDING_MON}{K_EU}로부터\n체력을 흡수했다!");
const u8 BattleText_Burned[] = _("{STRING 14}{K_EUNNEUN}\n화상을 입었다!");
const u8 BattleText_Burned2[] = _("{STRING 16}의 {STRING 23} 때문에\n{STRING 14}{K_EUNNEUN} 화상을 입었다!");
const u8 BattleText_BurnHurt[] = _("{ATTACKING_MON}{K_EUNNEUN}\n화상 데미지를 입고 있다!");
const u8 BattleText_AlreadyBurned[] = _("{DEFENDING_MON}{K_EUNNEUN} 이미\n화상을 입은 상태다");
const u8 BattleText_Frozen[] = _("{STRING 14}{K_EUNNEUN}\n얼어붙었다!");
const u8 BattleText_Frozen2[] = _("{STRING 16}의 {STRING 23} 때문에\n{STRING 14}{K_EUNNEUN} 얼어붙었다!");
const u8 BattleText_FrozenSolid[] = _("{ATTACKING_MON}{K_EUNNEUN}\n얼어버려서 움직이지 않는다!");
const u8 BattleText_DefendingDefrosted[] = _("{DEFENDING_MON}의\n얼음이 녹았다!");
const u8 BattleText_AttackingDefrosted[] = _("{ATTACKING_MON}의\n얼음이 녹았다!");
const u8 BattleText_Defrosted[] = _("{ATTACKING_MON}의\n{STRING 17} 때문에 얼음이 녹았다!");
const u8 BattleText_Paralyzed[] = _("{STRING 14}{K_EUNNEUN} 마비되어\n기술이 나오기 어려워졌다!");
const u8 BattleText_Paralyzed2[] = _("{STRING 16}의 {STRING 23} 때문에\n{STRING 14}{K_EUNNEUN} 마비되어\l기술이 나오기 어려워졌다!");
const u8 BattleText_Paralyzed3[] = _("{ATTACKING_MON}{K_EUNNEUN}\n몸이 저려서 움직일 수 없다");
const u8 BattleText_AlreadyParalyzed[] = _("{DEFENDING_MON}{K_EUNNEUN}\n이미 마비되어 있다");
const u8 BattleText_ParalysisHealed[] = _("{DEFENDING_MON}의\n마비가 풀렸다!");
const u8 BattleText_DreamEaten[] = _("{DEFENDING_MON}의\n꿈을 먹었다!");
const u8 BattleText_AttackingStatNoHigher[] = _("{ATTACKING_MON}의\n{STRING 0}{K_EUNNEUN} 더 올라가지 않는다!");
const u8 BattleText_DefendingStatNoHigher[] = _("{DEFENDING_MON}의\n{STRING 0}{K_EUNNEUN} 더 떨어지지 않는다!");
const u8 BattleText_StoppedWorking[] = _("우리 편 {STRING 0}의\n효과가 떨어졌다!");
const u8 BattleText_StoppedWorking2[] = _("상대 {STRING 0}의\n효과가 떨어졌다!");
const u8 BattleText_Confused[] = _("{ATTACKING_MON}{K_EUNNEUN}\n혼란에 빠져 있다!");
const u8 BattleText_ConfusionSnapOut[] = _("{ATTACKING_MON}의\n혼란이 풀렸다!");
const u8 BattleText_BecameConfused[] = _("{STRING 14}{K_EUNNEUN}\n혼란에 빠졌다!");
const u8 BattleText_AlreadyConfused[] = _("{DEFENDING_MON}{K_EUNNEUN} 이미\n혼란에 빠져 있다");
const u8 BattleText_FellLove[] = _("{DEFENDING_MON}{K_EUNNEUN}\n헤롱헤롱해졌다!");
const u8 BattleText_InLoveWith[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 16}에게 헤롱헤롱해 있다!");
const u8 BattleText_ImmobilizedBy[] = _("{ATTACKING_MON}{K_EUNNEUN} 헤롱헤롱해서\n 기술을 쓸 수 없었다!");
const u8 BattleText_BlownAway[] = _("{DEFENDING_MON}{K_EUNNEUN}\n날려가 버렸다!");
const u8 BattleText_TypeTransform[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}타입이 됐다!");
const u8 BattleText_Flinched[] = _("{ATTACKING_MON}{K_EUNNEUN}\n풀이 죽어 움직일 수 없었다!");
const u8 BattleText_RegainedHealth[] = _("{DEFENDING_MON}{K_EUNNEUN}체력을\n회복했다!");
const u8 BattleText_HPFull[] = _("그러나 {DEFENDING_MON}의\n체력은 가득찬 상태다!");
const u8 BattleText_RaisedSpDef[] = _("{STRING 38}의 {STRING 17} 때문에\n특수방어가 올랐다!");
const u8 BattleText_RaisedSpDefLittle[] = _("{STRING 38}의 {STRING 17} 때문에\n특수방어가 조금 올랐다!");
const u8 BattleText_RaisedDefense[] = _("{STRING 38}의 {STRING 17} 때문에\n방어가 올랐다!");
const u8 BattleText_RaisedDefenseLittle[] = _("{STRING 38}의 {STRING 17} 때문에\n방어가 조금 올랐다!");
const u8 BattleText_CoveredVeil[] = _("{STRING 38}{K_EUNNEUN}\n신비의 베일에 둘러싸였다!");
const u8 BattleText_SafeguardActive[] = _("{DEFENDING_MON}{K_EUNNEUN}\n신비의 베일이 지켜주고 있다!");
const u8 BattleText_SafeguardFaded[] = _("{STRING 40}{K_EULREUL} 감싸던\n신비의 베일이 없어졌다!");
const u8 BattleText_WentToSleep[] = _("{ATTACKING_MON}{K_EUNNEUN}\n잠을 자기 시작했다!");
const u8 BattleText_SpeltHealthy[] = _("{ATTACKING_MON}{K_EUNNEUN}\n건강한 상태로 잠을 자기 시작했다!");
const u8 BattleText_WhipWhirlwind[] = _("{ATTACKING_MON}의 주위에서\n공기가 소용돌이친다!");
const u8 BattleText_TookSunlight[] = _("{ATTACKING_MON}{K_EUNNEUN}\n빛을 흡수했다!");
const u8 BattleText_LoweredHead[] = _("{ATTACKING_MON}{K_EUNNEUN}\n목을 움츠렸다!");
const u8 BattleText_IsGlowing[] = _("{ATTACKING_MON}{K_EULREUL}\n세찬 빛이 감쌌다!");
const u8 BattleText_FlewHigh[] = _("{ATTACKING_MON}{K_EUNNEUN}\n하늘 높이 날아올랐다!");
const u8 BattleText_DugHole[] = _("{ATTACKING_MON}{K_EUNNEUN}\n구멍을 파서 땅속에 파고들었다!");
const u8 BattleText_HidUnderwater[] = _("{ATTACKING_MON}{K_EUNNEUN}\n물속에 몸을 숨겼다!");
const u8 BattleText_SprangUp[] = _("{ATTACKING_MON}{K_EUNNEUN}\n뛰어올랐다!");
const u8 BattleText_SqueezedBind[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{ATTACKING_MON}에게 조이기를 당했다!");
const u8 BattleText_TrappedVortex[] = _("{DEFENDING_MON}{K_EUNNEUN}\n소용돌이 속에 갇혔다!");
const u8 BattleText_SandTombTrapped[] = _("{DEFENDING_MON}{K_EUNNEUN}\n모래지옥에 붙잡혔다!");
const u8 BattleText_Wrapped[] = _("{DEFENDING_MON}{K_EUNNEUN} {ATTACKING_MON}에게\n휘감겼다!");
const u8 BattleText_Clamped[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n껍질에 꼈다!");
const u8 BattleText_HurtBy[] = _("{ATTACKING_MON}{K_EUNNEUN} {STRING 0}의\n데미지를 입고 있다");
const u8 BattleText_FreedFrom[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EU}로부터 풀려났다!");
const u8 BattleText_KeptGoingCrash[] = _("의욕이 넘쳐서\n{ATTACKING_MON}{K_EUNNEUN} 땅에 부딪혔다!");
const u8 BattleText_MistShroud[] = _("{STRING 38}{K_EUNNEUN}\n흰안개에 둘러싸였다!");
const u8 BattleText_MistProtect[] = _("{STRING 16}{K_EULREUL}\n흰안개가 지켜주고 있다");
const u8 BattleText_GetPumped[] = _("{ATTACKING_MON}{K_EUNNEUN}\n의욕이 넘치고 있다!");
const u8 BattleText_HitRecoil[] = _("{ATTACKING_MON}{K_EUNNEUN}\n공격의 반동을 입었다!");
const u8 BattleText_ProtectedItself2[] = _("{ATTACKING_MON}{K_EUNNEUN}\n방어 태세에 들어갔다!");
const u8 BattleText_SandBuffeted[] = _("모래바람이\n{ATTACKING_MON}{K_EULREUL} 덮쳤다!");
const u8 BattleText_HailStricken[] = _("싸라기눈이\n{ATTACKING_MON}{K_EULREUL} 덮쳤다!");
const u8 BattleText_WoreOff[] = _("{STRING 36} {STRING 0}의\n효과가 떨어졌다!");
const u8 BattleText_WasSeeded[] = _("{DEFENDING_MON}에게\n씨앗을 심었다!");
const u8 BattleText_EvadedAttack[] = _("{DEFENDING_MON}{K_EUNNEUN}\n공격을 피했다!");
const u8 BattleText_HealthSapped[] = _("씨뿌리기가 {ATTACKING_MON}의\n체력을 빼앗는다!");
const u8 BattleText_FastAsleep[] = _("{ATTACKING_MON}{K_EUNNEUN}\n쿨쿨 잠들어 있다");
const u8 BattleText_WokeUp[] = _("{ATTACKING_MON}{K_EUNNEUN}\n눈을 떴다!");
const u8 BattleText_UproarAwake[] = _("그러나 {STRING 16}{K_EUNNEUN}\n소란스러워서 잠들 수 없다!");
const u8 BattleText_UproarWoke[] = _("{ATTACKING_MON}{K_EUNNEUN}\n소란스러워서 눈을 떴다!");
const u8 BattleText_UproarCaused[] = _("{ATTACKING_MON}{K_EUNNEUN}\n소란피기 시작했다!");
const u8 BattleText_UproarMaking[] = _("{ATTACKING_MON}{K_EUNNEUN}\n소란피우고 있다!");
const u8 BattleText_CalmedDown[] = _("{ATTACKING_MON}{K_EUNNEUN}\n얌전해졌다");
const u8 BattleText_UproarCantSleep[] = _("그러나 {DEFENDING_MON}{K_EUNNEUN}\n소란스러워서 잠들 수 없다!");
const u8 BattleText_Stockpiled[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}개 비축했다!");
const u8 BattleText_StockpiledCant[] = _("{ATTACKING_MON}{K_EUNNEUN}\n더 이상 비축할 수 었다!");
const u8 BattleText_UproarCantSleep2[] = _("그러나 {DEFENDING_MON}{K_EUNNEUN}\n소란피고 있어서 잠들지 않는다!");
const u8 BattleText_UproarKeptAwake[] = _("그러나 {DEFENDING_MON}{K_EUNNEUN}\n소란스러워서 잠들 수 없다!");
const u8 BattleText_StayedAwake[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{STRING 22} 때문에 잠들지 않는다");
const u8 BattleText_StoringEnergy[] = _("{ATTACKING_MON}{K_EUNNEUN} 참고 있다");
const u8 BattleText_UnleashedEnergy[] = _("{ATTACKING_MON}의\n참기가 풀렸다!");
const u8 BattleText_FatigueConfuse[] = _("{ATTACKING_MON}{K_EUNNEUN}\n몹시 지쳐서 혼란에 빠졌다!");
const u8 BattleText_PickedUpYen[] = _("{STRING 32}{K_EUNNEUN}\n{STRING 0}원을 주웠다!\p");
const u8 BattleText_Unaffected[] = _("{DEFENDING_MON}에게는\n전혀 효과가 없다!");
const u8 BattleText_Transformed[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EU}로 변신했다!");
const u8 BattleText_SubMade[] = _("{ATTACKING_MON}의\n분신이 나타났다");
const u8 BattleText_SubAlready[] = _("{ATTACKING_MON}의\n대타는 이미 나와있다!");
const u8 BattleText_SubTookDamage[] = _("{DEFENDING_MON}{K_EULREUL} 대신하여\n분신이 공격을 받았다!\p");
const u8 BattleText_SubFaded[] = _("{DEFENDING_MON}의 분신은\n 사라져 버렸다...\p");
const u8 BattleText_MustRecharge[] = _("공격의 반동으로\n{ATTACKING_MON}{K_EUNNEUN} 움직일 수 없다!");
const u8 BattleText_RageBuilding[] = _("{DEFENDING_MON}의 분노\n볼티지가 올라가고 있다!");
const u8 BattleText_MoveWasDisabled[] = _("{DEFENDING_MON}의\n{STRING 0}{K_EULREUL} 봉인했다!");
const u8 BattleText_DisabledNoMore[] = _("{ATTACKING_MON}의\n사슬묶기가 풀렸다!");
const u8 BattleText_EncoreGot[] = _("{DEFENDING_MON}{K_EUNNEUN}\n앵콜을 받았다!");
const u8 BattleText_EncoreEnded[] = _("{ATTACKING_MON}의\n앵콜 상태가 풀렸다!");
const u8 BattleText_TookAim[] = _("{ATTACKING_MON}{K_EUNNEUN} 목표를\n{DEFENDING_MON}{K_EU}로 결정했다!");
const u8 BattleText_SketchedMove[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 스케치했다!");
const u8 BattleText_DestinyBondTake[] = _("{ATTACKING_MON}{K_EUNNEUN} 상대를\n길동무로 삼으려 하고 있다");
const u8 BattleText_DestinyBondTaken[] = _("{DEFENDING_MON}{K_EUNNEUN} {ATTACKING_MON}{K_EULREUL}\n길동무로 삼았다!");
const u8 BattleText_ReducedBy[] = _("{DEFENDING_MON}의\n{STRING 0}{K_EULREUL} {STRING 1} 깎았다!");
const u8 BattleText_StoleSomething[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}로부터\n{STRING 19}{K_EULREUL} 빼앗았다!");
const u8 BattleText_CantEscapeNow[] = _("{DEFENDING_MON}{K_EUNNEUN}\n이제 도망칠 수 없다!");
const u8 BattleText_NightmareStart[] = _("{DEFENDING_MON}{K_EUNNEUN}\n악몽을 꾸기 시작했다!");
const u8 BattleText_NightmareLock[] = _("{ATTACKING_MON}{K_EUNNEUN}\n악몽에 시달리고 있다!");
const u8 BattleText_CurseLay[] = _("{ATTACKING_MON}{K_EUNNEUN}\n자신의 체력을 깎아서\l{DEFENDING_MON}에게 저주를 걸었다!");
const u8 BattleText_CurseAfflict[] = _("{ATTACKING_MON}{K_EUNNEUN}\n저주받고 있다!");
const u8 BattleText_SpikesScattered[] = _("{STRING 37}발밑에\n압정이 뿌려졌다!");
const u8 BattleText_SpikesHurt[] = _("{STRING 16}{K_EUNNEUN} 압정뿌리기의\n데미지를 입었다!");
const u8 BattleText_IdentifiedPoke[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}{K_EULREUL}의\n정체를 꿰뚫어 보았다!");
const u8 BattleText_PerishSongFell[] = _("{ATTACKING_MON}의 멸망의\n카운트가 {STRING 0}{K_IGA} 되었다!");
const u8 BattleText_BracedItself[] = _("{ATTACKING_MON}{K_EUNNEUN}\n버티기 태세에 들어갔다!");
const u8 BattleText_EnduredHit[] = _("{DEFENDING_MON}{K_EUNNEUN}\n공격을 버텼다!");
const u8 BattleText_MagnitudeCount[] = _("매그니튜드 {STRING 0}!!");
const u8 BattleText_CutHPMaxATK[] = _("{ATTACKING_MON}{K_EUNNEUN} 체력을 깎아서\n풀파워로 만들었다!");
const u8 BattleText_CopyStatChanges[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n능력 변화를 복사했다!");
const u8 BattleText_GotFreeFrom[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n{STRING 0}{K_EU}로부터 풀려났다!");
const u8 BattleText_LeechShed[] = _("{ATTACKING_MON}에게\n씨앗을 심었다!");
const u8 BattleText_SpikesBlownAway[] = _("{ATTACKING_MON}의\n압정이 사라졌다!");
const u8 BattleText_FledBattle[] = _("{ATTACKING_MON}{K_EUNNEUN}\n배틀에서 이탈했다!");
const u8 BattleText_ForesawAttack[] = _("{ATTACKING_MON}{K_EUNNEUN} 미래의\n공격을 예지했다!");
const u8 BattleText_TookAttack[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{STRING 0} 공격을 받았다!");
const u8 BattleText_ChoseDestiny[] = _("{ATTACKING_MON}{K_EUNNEUN} {STRING 17}{K_EULREUL}\n미래에 맡겼다!");
const u8 BattleText_PokeAttack[] = _("{STRING 0}의 공격!");
const u8 BattleText_CenterAttention[] = _("{ATTACKING_MON}{K_EUNNEUN}\n주목의 대상이 되었다!");
const u8 BattleText_ChargingPower[] = _("{ATTACKING_MON}{K_EUNNEUN}\n충전을 시작했다!");
const u8 BattleText_NaturePower[] = _("자연의힘은\n{STRING 17}{K_IGA} 되었다!");
const u8 BattleText_StatusNormal[] = _("{ATTACKING_MON}의 상태이상이\n 나았다!");
const u8 BattleText_TormentSubject[] = _("{DEFENDING_MON}{K_EUNNEUN}\n트집을 잡혔다!");
const u8 BattleText_TightenFocus[] = _("{ATTACKING_MON}{K_EUNNEUN}\n집중력을 높이고 있다!");
const u8 BattleText_TauntFell[] = _("{DEFENDING_MON}{K_EUNNEUN}\n도발에 넘어가 버렸다!");
const u8 BattleText_ReadyToHelp[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}에게\n도우미가 되어주려 한다!");
const u8 BattleText_SwitchedItems[] = _("{ATTACKING_MON}{K_EUNNEUN} 서로의\n도구를 교체했다!");
const u8 BattleText_Obtained1[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 손에 넣었다!");
const u8 BattleText_Obtained2[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{STRING 1}{K_EULREUL} 손에 넣었다!");
const u8 BattleText_Obtained3[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 손에 넣었다!\p{DEFENDING_MON}{K_EUNNEUN}\n{STRING 1}{K_EULREUL} 손에 넣었다!");
const u8 BattleText_CopiedObject[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n{STRING 22}{K_EULREUL} 복사했다!");
const u8 BattleText_WishMade[] = _("{ATTACKING_MON}{K_EUNNEUN}\n희망사항을 썼다!");
const u8 BattleText_WishTrue[] = _("{STRING 0}의\n희망사항이 이루어졌다!");
const u8 BattleText_PlantedRoots[] = _("{ATTACKING_MON}{K_EUNNEUN} 뿌리를 뻗었다!");
const u8 BattleText_AbsorbNutrients[] = _("{ATTACKING_MON}{K_EUNNEUN} 뿌리로부터\n양분을 흡수했다!");
const u8 BattleText_AnchoredItself[] = _("{DEFENDING_MON}{K_EUNNEUN} 뿌리를 뻗어서\n움직이지 않는다!");
const u8 BattleText_DrowsyMade[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n졸음을 유도했다!");
const u8 BattleText_KnockedOffItem[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n{STRING 19}{K_EULREUL} 탁쳐서 떨구었다!");
const u8 BattleText_AbilitySwap[] = _("{ATTACKING_MON}{K_EUNNEUN} 서로의\n특성을 교체했다!");
const u8 BattleText_SealedMove[] = _("{ATTACKING_MON}{K_EUNNEUN} 상대의\n기술을 봉인했다!");
const u8 BattleText_GrudgeBear[] = _("{ATTACKING_MON}{K_EUNNEUN} 상대에게\n원념을 걸려 하고 있다!");
const u8 BattleText_GrudgeLosePP[] = _("{ATTACKING_MON}의 {STRING 0}{K_EUNNEUN}\n원념으로 PP가 0이 되었다!");
const u8 BattleText_ShroudedItself[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 17}에 둘러싸였다!");
const u8 BattleText_MagicCoatBounce[] = _("{ATTACKING_MON}의 {STRING 17}{K_EUNNEUN}\n매직코트에 튕겨졌다!");
const u8 BattleText_AwaitMove[] = _("{ATTACKING_MON}{K_EUNNEUN}\n상대의 움직임을 살피고 있다!");
const u8 BattleText_SnatchedMove[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 16}의\n기술을 가로챘다!");
const u8 BattleText_ElecWeakened[] = _("전기의 위력이 약해졌다!");
const u8 BattleText_FireWeakened[] = _("불꽃의 위력이 약해졌다!");
const u8 BattleText_FoundOne[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 19}{K_EULREUL} 주워 왔다!");
const u8 BattleText_SoothingAroma[] = _("기분 좋은 향기가 퍼졌다!");
const u8 BattleText_CantUseItems[] = _("여기서는 도구를 쓸 수 없습니다...{PAUSE 64}");
const u8 BattleText_UnknownString2[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}에게는\n{STRING 0}");
const u8 BattleText_HustleUse[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EULREUL} 써서\n의욕이 넘치기 시작했다!");
const u8 BattleText_LostFocus[] = _("{ATTACKING_MON}{K_EUNNEUN} 집중력이\n떨어져서 기술을 쓸 수 없었다!");
const u8 BattleText_DraggedOut[] = _("{DEFENDING_MON}{K_EUNNEUN} 배틀에\n끌려 나왔다!\p");
const u8 BattleText_BrokeWall[] = _("벽이 깨졌다!");
const u8 BattleText_NoEffect[] = _("그러나 효과가 없었다!");
const u8 BattleText_NoMovesLeft[] = _("{STRING 15}{K_EUNNEUN} 쓸 수 있는\n기술이 없다!\p");
const u8 BattleText_MoveIsDisabled[] = _("{STRING 15}{K_EUNNEUN} 사슬묶기 때문에\n{STRING 17}{K_EULREUL} 쓸 수 없다!\p");
const u8 BattleText_TormentNoUse[] = _("{STRING 15}{K_EUNNEUN}\n트집을 잡혔기 때문에{K_IGA}\l계속해서 같은 기술을 쓸 수 없다!\p");
const u8 BattleText_TauntNoUse[] = _("{STRING 15}{K_EUNNEUN} 도발당한 상태라서\n{STRING 17}{K_EULREUL} 쓸 수 없다!\p");
const u8 BattleText_SealedNoUse[] = _("{STRING 15}{K_EUNNEUN} 봉인 때문에\n{STRING 17}{K_EULREUL} 쓸 수 없다!\p");
const u8 BattleText_RainMade[] = _("{STRING 16}의 {STRING 23}\n때문에 비가 내리기 시작했다!");
const u8 BattleText_SpeedRisen[] = _("{STRING 16}의 {STRING 23}\n때문에 스피드가 올라갔다!");
const u8 BattleText_ProtectedBy[] = _("{DEFENDING_MON}의 {STRING 22} 때문에\n효과가 없었다!");
const u8 BattleText_PreventedBy[] = _("{DEFENDING_MON}의 {STRING 22}\n때문에 {ATTACKING_MON}{K_EUNNEUN}\l{STRING 17}{K_EULREUL} 할 수 없다!");
const u8 BattleText_HPRestoredUsing[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{STRING 22}{K_EU}로 인해 회복했다!");
const u8 BattleText_MadeUseless[] = _("{DEFENDING_MON}의 {STRING 22}\n때문에 {STRING 17}{K_EUNNEUN} 효과가 없었다!");
const u8 BattleText_MadeType[] = _("{DEFENDING_MON}의 {STRING 22} 때문에\n{STRING 0}타입이 되었다!");
const u8 BattleText_PreventedPara[] = _("{STRING 14}{K_EUNNEUN} {STRING 22}\n때문에 마비되지 않는다!");
const u8 BattleText_PreventedRomance[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n헤롱헤롱해지지 않는다!");
const u8 BattleText_PreventedPoison[] = _("{STRING 14}{K_EUNNEUN}\n{STRING 22} 때문에\l독에 걸리지 않는다!");
const u8 BattleText_PreventedConfusion[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22}\n때문에 혼란되지 않는다!");
const u8 BattleText_RaisedFirePower[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n불꽃의 위력이 올라갔다!");
const u8 BattleText_AnchorsItself[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n들러붙어 있다!");
const u8 BattleText_CutsAttack[] = _("{STRING 16}의 {STRING 23}\n때문에 {DEFENDING_MON}의 공격이 떨어졌다!");
const u8 BattleText_PreventedStatLoss[] = _("{STRING 16}{K_EUNNEUN} {STRING 23} 때문에\n능력이 떨어지지 않는다!");
const u8 BattleText_HurtOther[] = _("{DEFENDING_MON}의\n{STRING 22} 때문에 {ATTACKING_MON}{K_EUNNEUN} 상처를 입었다!");
const u8 BattleText_Traced[] = _("{STRING 16}{K_EUNNEUN} {STRING 0}의\n{STRING 1}{K_EULREUL} 트레이스했다!");
const u8 BattleText_PreventedBurn[] = _("{STRING 14}{K_EUNNEUN} {STRING 24} 때문에\n화상을 입지 않는다!");
const u8 BattleText_BlocksOther[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n{STRING 17}{K_EULREUL} 받지 않는다!");
const u8 BattleText_BlocksOther2[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 23} 때문에\l{STRING 17}{K_EULREUL} 받지 않는다!");
const u8 BattleText_RestoredHPByItem[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 21}{K_EU}로 인해 조금 회복했다");
const u8 BattleText_WhipSandstorm[] = _("{STRING 16}의 {STRING 23}\n때문에 모래바람이 불었다!");
const u8 BattleText_SunIntensified[] = _("{STRING 16}의 {STRING 23} 때문에\n햇살이 강해졌다!");
const u8 BattleText_PreventedLoss[] = _("{STRING 16}{K_EUNNEUN} {STRING 23} 때문에\n{STRING 0}{K_IGA} 떨어지지 않는다!");
const u8 BattleText_InfatuatedPoke[] = _("{DEFENDING_MON}의 {STRING 22}\n때문에 {ATTACKING_MON}{K_EUNNEUN} 헤롱헤롱해졌다!");
const u8 BattleText_MadeIneffective[] = _("{DEFENDING_MON}의\n{STRING 22} 때문에\l{STRING 17}{K_EUNNEUN} 효과가 없다!");
const u8 BattleText_CuredProblem[] = _("{STRING 16}{K_EUNNEUN} {STRING 23} 때문에\n{STRING 0}상태가 나았다!");
const u8 BattleText_OozeSuckup[] = _("해감액을 흡수했다!");
const u8 BattleText_Transformed2[] = _("{STRING 16}의 모습이\n변화했다!");
const u8 BattleText_TookAttack2[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n공격을 받았다!");
const u8 BattleText_PreventedSwitch[] = _("{STRING 0}의 {STRING 20} 때문에\n교체할 수 없다!\p");
const u8 BattleText_PreventedOther[] = _("{DEFENDING_MON}의\n{STRING 22} 때문에\l{STRING 16}의\l{STRING 0}{K_EUNNEUN} 효과가 없었다!");
const u8 BattleText_MadeIneffective2[] = _("{STRING 16}의\n{STRING 23} 때문에 실패했다!");
const u8 BattleText_PreventedFlinching[] = _("{STRING 14}{K_EUNNEUN} {STRING 24} 때문에\n풀이 죽지 않는다!");
const u8 BattleText_PreventedOther2[] = _("{ATTACKING_MON}의 {STRING 21}{K_EUNNEUN}\n{DEFENDING_MON}의\l{STRING 22} 때문에 효과가 없었다!");
const u8 BattleText_CuredOfProblem[] = _("{STRING 16}{K_EUNNEUN} {STRING 23} 때문에\n{STRING 0}상태가 나았다!");
const u8 BattleText_NoEffectOn[] = _("{STRING 16}의 {STRING 23}{K_EUNNEUN}\n{STRING 14}에게는 효과가 없었다!");
const u8 BattleText_Sharply[] = _("크게");
const u8 BattleText_Rose[] = _("올라갔다!");
const u8 BattleText_Harshly[] = _("매우 크게 ");
const u8 BattleText_Fell[] = _("떨어졌다!");
const u8 BattleText_UnknownString7[] = _("{ATTACKING_MON}의\n{STRING 0}{K_IGA} {STRING 1}");
const u8 BattleText_UnknownString3[] = _("{DEFENDING_MON}의\n{STRING 0}{K_IGA} {STRING 1}");
const u8 BattleText_UnknownString4[] = _("{STRING 19}{K_EU}로 {STRING 16}의\n{STRING 0}{K_IGA} {STRING 1}");
const u8 BattleText_UnknownString5[] = _("{ATTACKING_MON}의\n{STRING 0}{K_IGA} {STRING 1}");
const u8 BattleText_UnknownString6[] = _("{DEFENDING_MON}의\n{STRING 0}{K_IGA} {STRING 1}");
const u8 BattleText_StatNoHigher[] = _("{ATTACKING_MON}의 {STRING 0}{K_EUNNEUN}\n더 올라가지 않는다!");
const u8 BattleText_StatNoLower[] = _("{DEFENDING_MON}의 {STRING 0}{K_EUNNEUN}\n더 떨어지지 않는다!");
const u8 BattleText_Critical[] = _("급소에 맞았다!");
const u8 BattleText_GrandSlam[] = _("일격필살!");
const u8 BattleText_MoveForget123[] = _("{PAUSE 32}1, {PAUSE 15}2 ...{PAUSE 15} ...{PAUSE 15} ...{PAUSE 15}\n{PAUSE 15}{PLAY_SE SE_KON}짠!\p");
const u8 BattleText_MoveForgetAnd[] = _("그리고...!\p");
const u8 BattleText_CantForgetHM[] = _("중요한 기술입니다!\n잊게 할 수 없습니다!\p");
const u8 BattleText_NotEffective[] = _("효과가 별로인 듯하다");
const u8 BattleText_SuperEffective[] = _("효과가 굉장했다!");
const u8 BattleText_GotAwaySafely[] = _("{PLAY_SE SE_NIGERU}무사히 도망쳤다!\p");
const u8 BattleText_FledUsingItem[] = _("{PLAY_SE SE_NIGERU}{ATTACKING_MON}{K_EUNNEUN} 가지고 있던\n{STRING 19}{K_EULREUL} 써서 도망쳤다\p");
const u8 BattleText_FledUsingOther[] = _("{PLAY_SE SE_NIGERU}{ATTACKING_MON}{K_EUNNEUN} 가지고 있던\n{STRING 21}{K_EULREUL} 써서 도망쳤다\p");
const u8 BattleText_FledWild[] = _("{PLAY_SE SE_NIGERU}야생 {STRING 0}{K_EUNNEUN} 도망쳤다!");
const u8 BattleText_PlayerDefeatedTrainer[] = _("{STRING 29}{K_WAGWA}의\n승부에서 이겼다!");
const u8 BattleText_PlayerDefeatedTrainers[] = _("{STRING 30}{K_WAGWA}\n{STRING 29}{K_WAGWA}의\l승부에서 이겼다!");
const u8 BattleText_PlayerLostTrainer[] = _("{STRING 29}{K_WAGWA}의\n승부에서 졌다!");
const u8 BattleText_PlayerLostTrainers[] = _("{STRING 30}{K_WAGWA}\n{STRING 29}{K_WAGWA}의\l승부에서 졌다!");
const u8 BattleText_PlayerTiedTrainer[] = _("{STRING 29}{K_WAGWA}의\n승부에서 비겼다!");
const u8 BattleText_PlayerTiedTrainers[] = _("{STRING 30}{K_WAGWA}\n{STRING 29}{K_WAGWA}의\l승부에서 비겼다!");
const u8 BattleText_FledSingle[] = _("{PLAY_SE SE_NIGERU}{STRING 29}{K_EUNNEUN} 도망쳤다!");
const u8 BattleText_FledDouble[] = _("{PLAY_SE SE_NIGERU}{STRING 29}{K_WAGWA} {STRING 30}{K_EUNNEUN}\n도망쳤다!");
const u8 BattleText_NoRunning[] = _("안돼! 승부 도중에\n상대에게 등을 보일 순 없어!\p");
const u8 BattleText_CantEscape2[] = _("도망칠 수 없다!\p");
const u8 BattleText_BirchDontLeaveMe[] = _("털보박사: 외, 외면하지 말아줘-!\p");
const u8 BattleText_Nothing[] = _("그러나 아무 일도 일어나지 않았다");
const u8 BattleText_Failed[] = _("그러나 실패하고 말았다!");
const u8 BattleText_HurtItself[] = _("영문도 모른 채\n자신을 공격했다!");
const u8 BattleText_MirrorFail[] = _("그러나 따라하기는\n실패로 끝났다!");
const u8 BattleText_RainStart[] = _("비가 내리기 시작했다!");
const u8 BattleText_PourStart[] = _("폭우로 변했다!");
const u8 BattleText_RainCont1[] = _("비가 계속 내리고 있다");
const u8 BattleText_PourCont[] = _("폭우가 계속 내리고 있다");
const u8 BattleText_RainStop[] = _("비가 그쳤다!");
const u8 BattleText_SandBrewed[] = _("모래바람이 불기 시작했다!");
const u8 BattleText_SandRages[] = _("모래바람이 세차게 분다");
const u8 BattleText_SandSubsided[] = _("모래바람이 가라앉았다!");
const u8 BattleText_SunBright[] = _("햇살이 강해졌다!");
const u8 BattleText_SunStrong[] = _("햇살이 강하다");
const u8 BattleText_SunFaded[] = _("햇살이 약해졌다!");
const u8 BattleText_HailStart[] = _("싸라기눈이 내리기 시작했다!");
const u8 BattleText_HailCont[] = _("싸라기눈이 계속 내리고 있다");
const u8 BattleText_HailStop[] = _("싸라기눈이 그쳤다!");
const u8 BattleText_SpitUpFail[] = _("그러나 뱉어내기를 실패했다!");
const u8 BattleText_SwallowFail[] = _("그러나 꿀꺽을 실패했다!");
const u8 BattleText_WindHeatWave[] = _("바람은 열풍이 되었다!");
const u8 BattleText_StatElim[] = _("모든 상태가\n원래대로 되돌아왔다!");
const u8 BattleText_CoinScatter[] = _("돈이 주위에 흩어졌다!");
const u8 BattleText_SubWeak[] = _("그러나 분신을 쓰기에는\n체력이 부족했다!");
const u8 BattleText_PainSplit[] = _("서로의 체력을 나누어 가졌다!");
const u8 BattleText_BellChime[] = _("방울소리가 울려 퍼졌다!");
const u8 BattleText_PerishSong[] = _("멸망의노래를 들은 포켓몬은\n3턴 후에 쓰러져 버린다!");
const u8 BattleText_NoPP1[] = _("남은 기술 포인트가 없다!\p");
const u8 BattleText_NoPP2[] = _("그러나\n남은 기술 포인트가 없었다!");
const u8 BattleText_IgnoredOrdersSLP[] = _("{ATTACKING_MON}{K_EUNNEUN} 잠든 채로\n명령을 무시했다!");
const u8 BattleText_IgnoredOrders[] = _("{ATTACKING_MON}{K_EUNNEUN} 명령을 무시했다!");
const u8 BattleText_BeganNap[] = _("{ATTACKING_MON}{K_EUNNEUN} 낮잠을 자기 시작했다!");
const u8 BattleText_LoafingAround[] = _("{ATTACKING_MON}{K_EUNNEUN} 게으름을 피우고 있다!");
const u8 BattleText_WontObey[] = _("{ATTACKING_MON}{K_EUNNEUN} 말을 듣지 않는다!");
const u8 BattleText_TurnedAway[] = _("{ATTACKING_MON}{K_EUNNEUN} 외면했다!");
const u8 BattleText_NotNotice[] = _("{ATTACKING_MON}{K_EUNNEUN} 모른 체했다!");
const u8 BattleText_WillSwitch[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 1}{K_EULREUL} 내보내려 하고 있다\p{STRING 32}도 포켓몬을\n교체하겠습니까?");
const u8 BattleText_LearnedMove2[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 배웠다!");
const u8 BattleText_PlayerDefeatedTrainer2[] = _("{STRING 25} {STRING 26}{K_WAGWA}의\n승부에서 이겼다!\p");
const u8 BattleText_CreptCloser[] = _("{STRING 32}{K_EUNNEUN}\n{STRING 3}에게 다가갔다!");
const u8 BattleText_CantGetCloser[] = _("{STRING 32}{K_EUNNEUN}\n더 이상 다가갈 수 없다!");
const u8 BattleText_WatchingCarefully[] = _("{STRING 3}{K_EUNNEUN}\n이쪽의 상황을 살피고 있다!");
const u8 BattleText_CuriousAbout[] = _("{STRING 3}{K_EUNNEUN}\n{STRING 0}에 대해 관심을 가졌다!");
const u8 BattleText_EnthralledBy[] = _("{STRING 3}{K_EUNNEUN}\n{STRING 0}{K_IGA} 마음에 들었다!");
const u8 BattleText_IgnoredThing[] = _("{STRING 3}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 무시했다!");
const u8 BattleText_ThrewBlock[] = _("{STRING 32}{K_EUNNEUN}\n{STRING 3}에게 먹이를 던졌다!");
const u8 BattleText_SafariOver[] = _("{PLAY_SE SE_PINPON}아나운서: 딩동-!\n사파리볼이 전부 떨어졌으므로\l종료입니다-!\p");
const u8 BattleText_WildAppeared1[] = _("앗! 야생 {STRING 3}{K_IGA} 튀어나왔다!\p");
const u8 BattleText_WildAppeared2[] = _("앗! 야생 {STRING 3}{K_IGA} 튀어나왔다!\p");
const u8 BattleText_WildAppeared3[] = _("앗! 야생 {STRING 3}{K_IGA} 튀어나왔다!{PAUSE 127}");
const u8 BattleText_WildDoubleAppeared[] = _("앗! 야생\n{STRING 5}{K_WAGWA} {STRING 3}{K_IGA} 튀어나왔다!\p");
const u8 BattleText_SingleWantToBattle1[] = _("{STRING 25} {STRING 26}{K_IGA}\n승부를 걸어왔다!\p");
const u8 BattleText_SingleWantToBattle2[] = _("{STRING 29}{K_IGA}\n승부를 걸어왔다!");
const u8 BattleText_DoubleWantToBattle[] = _("{STRING 29}{K_WAGWA} {STRING 30}{K_IGA}\n승부를 걸어왔다!");
const u8 BattleText_SentOutSingle1[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 3}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutDouble1[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 3}{K_WAGWA} {STRING 5}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutSingle2[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutSingle3[] = _("{STRING 29}{K_EUNNEUN}\n{STRING 3}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutDouble2[] = _("{STRING 29}{K_EUNNEUN}\n{STRING 3}{K_WAGWA} {STRING 5}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutDouble3[] = _("{STRING 29}{K_EUNNEUN}\n{STRING 7}{K_EULREUL} 내보냈다!\p{STRING 30}{K_EUNNEUN}\n{STRING 9}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutSingle4[] = _("{STRING 29}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutSingle5[] = _("{STRING 31}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutSingle6[] = _("가랏! {STRING 2}!");
const u8 BattleText_SentOutDouble4[] = _("가랏! {STRING 2}! {STRING 4}!");
const u8 BattleText_SentOutSingle7[] = _("가랏! {STRING 0}!");
const u8 BattleText_SentOutSingle8[] = _("널 믿어! {STRING 0}!");
const u8 BattleText_SentOutSingle9[] = _("힘내! {STRING 0}!");
const u8 BattleText_SentOutSingle10[] = _("상대가 약해져 있어!\n기회다! {STRING 0}!");
const u8 BattleText_SentOutSingle11[] = _("{STRING 28}{K_EUNNEUN} {STRING 8}{K_EULREUL} 꺼냈다!\n가랏! {STRING 6}!");
const u8 BattleText_ComeBackSingle1[] = _("{STRING 0} 좋아!\n돌아와!");
const u8 BattleText_ComeBackSingle2[] = _("{STRING 0}\n돌아와!");
const u8 BattleText_ComeBackSingle3[] = _("{STRING 0} 좋았어!\n돌아와!");
const u8 BattleText_ComeBackSingle4[] = _("{STRING 0} 잘했어!\n돌아와!");
const u8 BattleText_WithdrewPoke1[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 넣어버렸다!");
const u8 BattleText_WithdrewPoke2[] = _("{STRING 29}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 넣어버렸다!");
const u8 BattleText_WithdrewPoke3[] = _("{STRING 31}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 넣어버렸다!");
const u8 BattleText_Wild[] = _("야생 ");
const u8 BattleText_Foe[] = _("상대 ");
const u8 BattleText_Foe2[] = _("상대 ");
const u8 BattleText_Ally[] = _("우리 편 ");
const u8 BattleText_Foe3[] = _("상대는");
const u8 BattleText_Ally2[] = _("우리 편은");
const u8 BattleText_Foe4[] = _("상대를");
const u8 BattleText_Ally3[] = _("우리 편을");
const u8 BattleText_OpponentUsedMove[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 1}");
const u8 BattleText_Exclamation2[] = _("{K_EULREUL} 썼다!");
const u8 BattleText_Exclamation3[] = _("{K_EULREUL} 썼다!");
const u8 BattleText_Exclamation4[] = _("{K_EULREUL} 썼다!");
const u8 BattleText_Exclamation5[] = _(" 공격!");
const u8 BattleText_Exclamation[] = _("!");
const u8 BattleStatText_HP[] = _("체력");
const u8 BattleStatText_Attack[] = _("공격");
const u8 BattleStatText_Defense[] = _("방어");
const u8 BattleStatText_Speed[] = _("스피드");
const u8 BattleStatText_SpAtk[] = _("특수공격");
const u8 BattleStatText_SpDef[] = _("특수방어");
const u8 BattleStatText_Accuracy[] = _("명중률");
const u8 BattleStatText_Evasion[] = _("회피율");
const u8 ContestStatText_TooSpicy[] = _("너무 맵다!");
const u8 ContestStatText_TooDry[] = _("너무 떫다!");
const u8 ContestStatText_TooSweet[] = _("너무 달다!");
const u8 ContestStatText_TooBitter[] = _("너무 쓰다!");
const u8 ContestStatText_TooSour[] = _("너무 시다!");
const u8 BattleText_Used1[] = _("{STRING 32}{K_EUNNEUN}\n{STRING 19}{K_EULREUL} 썼다!");
const u8 BattleText_TutorialUsed[] = _("민진은\n{STRING 19}{K_EULREUL} 썼다!");
const u8 BattleText_Used2[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 19}{K_EULREUL} 썼다!");
const u8 BattleText_BlockBall[] = _("트레이너가 볼을 튕겨내 버렸다!");
const u8 BattleText_DontBeAThief[] = _("남의 것에 손대면 도둑!");
const u8 BattleText_DodgeBall[] = _("피했다!\n이 녀석은 잡힐 것 같지 않군!");
const u8 BattleText_MissPoke[] = _("포켓몬에게\n제대로 맞지 않았다!");
const u8 BattleText_BallBrokeOhNo[] = _("안돼! 포켓몬이\n볼에서 나와버렸다!");
const u8 BattleText_BallBrokeAppeared[] = _("아아!\n잡았다고 생각했는데!");
const u8 BattleText_BallBrokeAlmost[] = _("아쉽다!\n조금만 더하면 잡을 수 있었는데!");
const u8 BattleText_BallBrokeSoClose[] = _("아깝다!\n조금만 더하면 됐는데!");
const u8 BattleText_BallCaught1[] = _("신난다-!\n{STRING 3}{K_EULREUL} 붙잡았다!{UNKNOWN_A}{PLAY_BGM BGM_KACHI22}\p");
const u8 BattleText_BallCaught2[] = _("신난다-!\n{STRING 3}{K_EULREUL} 붙잡았다!{UNKNOWN_A}{PLAY_BGM BGM_KACHI22}{PAUSE 127}");
const u8 BattleText_GiveNickname[] = _("잡은 {STRING 3}에게\n닉네임을 붙이겠습니까?");
const u8 BattleText_SentToPC[] = _("{STRING 3}{K_EUNNEUN}\n{STRING 35} PC로 전송되었다!");
const u8 BattleText_Someone[] = _("누군가의");
const u8 BattleText_Lanette[] = _("보은의");
const u8 BattleText_AddedToDex[] = _("{STRING 3}의 데이터가 새로\n포켓몬 도감에 등록됩니다!\p");
const u8 BattleText_Raining[] = _("비가 내리고 있다");
const u8 BattleText_Sandstorm[] = _("모래바람이 세차게 불고 있다");
const u8 BattleText_BoxFull[] = _("박스가 가득 찼습니다!\n더 이상 잡을 수 없습니다!\p");
const u8 BattleText_EnigmaBerry[] = _("의문열매");
const u8 BattleText_Berry[] = _("열매");
const u8 BattleText_CuredParalysis[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로\n마비가 풀렸다!");
const u8 BattleText_CuredPoison[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로\n독이 해독됐다!");
const u8 BattleText_CuredBurn[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로\n화상이 나았다!");
const u8 BattleText_CuredFreeze[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로\n얼음 상태가 나았다!");
const u8 BattleText_CuredSleep[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로\n눈을 떴다!");
const u8 BattleText_CuredConfusion[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로\n혼란이 풀렸다!");
const u8 BattleText_CuredStatus[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로\n{STRING 0}상태가 나았다!");
const u8 BattleText_NormalizedStatus[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로\n상태이상이 회복되었다!");
const u8 BattleText_RestoredHealth[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로\n체력을 회복했다!");
const u8 BattleText_RestoredPP[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로\n{STRING 0}의 PP를 회복했다!");
const u8 BattleText_RestoredStatus[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로\n상태이상을 회복했다!");
const u8 BattleText_RestoredHPLittle[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 인해 조금 회복했다!");
const u8 BattleText_ChoiceBand[] = _("{STRING 19}의 효과로\n{STRING 17}밖에 쓸 수 없다!\p");
const u8 BattleText_FocusSash[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{STRING 19}{K_EU}로 버텼다!");
const u8 BattleText_Terminator2[] = _("");
const u8 BattleText_WallyBall[] = _("지금 볼을 던지면 되는 건가요?\n더... 던질게요!");
const u8 BattleText_StartEvo[] = _("...오잉!?\n{STRING 2}의 모습이...!");
const u8 BattleText_FinishEvo[] = _("축하합니다! {STRING 2}{K_EUNNEUN}\n{STRING 3}{K_EU}로 진화했습니다!{UNKNOWN_A}\p");
const u8 BattleText_StopEvo[] = _("얼라리...?\n{STRING 2}의 변화가 멈췄다!\p");
const u8 BattleText_OtherMenu[] = _("{STRING 15}{K_EUNNEUN}\n무엇을 할까?");
const u8 BattleText_PlayerMenu[] = _("{STRING 32}{K_EUNNEUN}\n무엇을 할까?");
const u8 BattleText_WallyMenu[] = _("민진은\n무엇을 할까?");
const u8 BattleText_LinkStandby[] = _("{PAUSE 16}통신 대기 중...");
const u8 BattleText_MenuOptions[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}싸운다{CLEAR_TO 0x30}가방\n포켓몬{CLEAR_TO 0x30}도망간다");
const u8 BattleText_MenuOptionsSafari[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}볼{CLEAR_TO 0x30}먹이\n다가간다{CLEAR_TO 0x30}도망간다");
const u8 BattleText_PP[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}PP\n타입/");
const u8 BattleText_Format[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}");
const u8 BattleText_ForgetMove[] = _("{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}{PALETTE 5}바꿀 기술을\n선택해주세요");
const u8 BattleText_YesNo[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}예\n아니오");
const u8 BattleText_SwitchWhich[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}바꿀 기술을\n선택해주세요");
const u8 BattleText_Format2[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}");
const u8 BattleText_RightArrow[] = _("{RIGHT_ARROW}");
const u8 BattleText_Plus[] = _("+");
const u8 BattleText_Dash[] = _("-");
const u8 BattleText_HP[] = _("HP  ");
const u8 BattleText_Attack[] = _("공격");
const u8 BattleText_Defense[] = _("방어");
const u8 BattleText_SpAtk[] = _("특수공격");
const u8 BattleText_SpDef[] = _("특수방어");
const u8 BattleText_SafariBalls[] = _("{HIGHLIGHT RED}사파리볼");
const u8 BattleText_SafariBallsLeft[] = _("{HIGHLIGHT RED}개 남음");
const u8 BattleText_HighlightRed[] = _("{HIGHLIGHT RED}");
const u8 BattleText_Sleep[] = _("잠듦");
const u8 BattleText_PoisonStatus[] = _("독");
const u8 BattleText_Burn[] = _("화상");
const u8 BattleText_Paralysis[] = _("마비");
const u8 BattleText_IceStatus[] = _("얼음");
const u8 BattleText_Confusion[] = _("혼란");
const u8 BattleText_Love[] = _("헤롱헤롱");
const u8 BattleText_Format3[] = _("{K_WAGWA} ");
const u8 BattleText_Format4[] = _(", ");
const u8 BattleText_Format5[] = _(" ");
const u8 BattleText_Format6[] = _("\l");
const u8 BattleText_Format7[] = _("\n");
const u8 BattleText_Format8[] = _("{K_EUNNEUN}");
const u8 BattleText_Format9[] = _("{K_EUNNEUN}");
const u8 gBadEggNickname[] = _("불량알");
const u8 BattleText_Wally[] = _("민진");
const u8 BattleText_Win[] = _("{HIGHLIGHT TRANSPARENT}승");
const u8 BattleText_Loss[] = _("{HIGHLIGHT TRANSPARENT}패");
const u8 BattleText_Tie[] = _("{HIGHLIGHT TRANSPARENT}무승부");
const u8 BattleText_Format10[] = _("{K_EUNNEUN}");
const u8 BattleText_Format11[] = _("의");
const u8 BattleText_Normal[] = _("노말 기술");
const u8 BattleText_Fighting[] = _("격투 기술");
const u8 BattleText_Flying[] = _("비행 기술");
const u8 BattleText_Poison[] = _("독 기술");
const u8 BattleText_Ground[] = _("땅 기술");
const u8 BattleText_Rock[] = _("바위 기술");
const u8 BattleText_Bug[] = _("벌레 기술");
const u8 BattleText_Ghost[] = _("고스트 기술");
const u8 BattleText_Steel[] = _("강철 기술");
const u8 BattleText_Typeless[] = _("??? 기술");
const u8 BattleText_Fire[] = _("불꽃 기술");
const u8 BattleText_Water[] = _("물 기술");
const u8 BattleText_Grass[] = _("풀 기술");
const u8 BattleText_Electric[] = _("전기 기술");
const u8 BattleText_Psychic[] = _("에스퍼 기술");
const u8 BattleText_Ice[] = _("얼음 기술");
const u8 BattleText_Dragon[] = _("드래곤 기술");
const u8 BattleText_Dark[] = _("악 기술");

const u8 *const gUnknown_08400F58[] =
{
    BattleStatText_HP,
    BattleStatText_Attack,
    BattleStatText_Defense,
    BattleStatText_Speed,
    BattleStatText_SpAtk,
    BattleStatText_SpDef,
    BattleStatText_Accuracy,
    BattleStatText_Evasion,
};

const u8 *const gUnknown_08400F78[] =
{
    ContestStatText_TooSpicy,
    ContestStatText_TooDry,
    ContestStatText_TooSweet,
    ContestStatText_TooBitter,
    ContestStatText_TooSour,
};

const u8 *const gBattleStringsTable[] =
{
    BattleText_UnknownString,
    BattleText_GainExpPoints,
    BattleText_GrewLevel,
    BattleText_LearnedMove,
    BattleText_TryingToLearnMove,
    BattleText_CantLearnMore,
    BattleText_DeleteMove,
    BattleText_DeletedMove,
    BattleText_StopLearning,
    BattleText_DidNotLearn,
    BattleText_LearnedMove2,
    BattleText_AttackMissed,
    BattleText_ProtectedItself,
    BattleText_StatNoHigher,
    BattleText_AvoidedDamage,
    BattleText_DoesntAffect,
    BattleText_AttackingFainted,
    BattleText_DefendingFainted,
    BattleText_WinningPrize,
    BattleText_OutOfUsablePoke,
    BattleText_WhitedOut,
    BattleText_PreventEscape,
    BattleText_HitMulti,
    BattleText_FellAsleep,
    BattleText_MadeAsleep,
    BattleText_DefendingAsleep,
    BattleText_AttackingAsleep,
    BattleText_WasntAffected,
    BattleText_Poisoned,
    BattleText_Poisoned2,
    BattleText_PoisonHurt,
    BattleText_AlreadyPoisoned,
    BattleText_BadlyPoisoned,
    BattleText_EnergyDrained,
    BattleText_Burned,
    BattleText_Burned2,
    BattleText_BurnHurt,
    BattleText_Frozen,
    BattleText_Frozen2,
    BattleText_FrozenSolid,
    BattleText_DefendingDefrosted,
    BattleText_AttackingDefrosted,
    BattleText_Defrosted,
    BattleText_Paralyzed,
    BattleText_Paralyzed2,
    BattleText_Paralyzed3,
    BattleText_AlreadyParalyzed,
    BattleText_ParalysisHealed,
    BattleText_DreamEaten,
    BattleText_AttackingStatNoHigher,
    BattleText_DefendingStatNoHigher,
    BattleText_StoppedWorking,
    BattleText_StoppedWorking2,
    BattleText_Confused,
    BattleText_ConfusionSnapOut,
    BattleText_BecameConfused,
    BattleText_AlreadyConfused,
    BattleText_FellLove,
    BattleText_InLoveWith,
    BattleText_ImmobilizedBy,
    BattleText_BlownAway,
    BattleText_TypeTransform,
    BattleText_Flinched,
    BattleText_RegainedHealth,
    BattleText_HPFull,
    BattleText_RaisedSpDef,
    BattleText_RaisedDefense,
    BattleText_CoveredVeil,
    BattleText_SafeguardActive,
    BattleText_SafeguardFaded,
    BattleText_WentToSleep,
    BattleText_SpeltHealthy,
    BattleText_WhipWhirlwind,
    BattleText_TookSunlight,
    BattleText_LoweredHead,
    BattleText_IsGlowing,
    BattleText_FlewHigh,
    BattleText_DugHole,
    BattleText_SqueezedBind,
    BattleText_TrappedVortex,
    BattleText_Wrapped,
    BattleText_Clamped,
    BattleText_HurtBy,
    BattleText_FreedFrom,
    BattleText_KeptGoingCrash,
    BattleText_MistShroud,
    BattleText_MistProtect,
    BattleText_GetPumped,
    BattleText_HitRecoil,
    BattleText_ProtectedItself2,
    BattleText_SandBuffeted,
    BattleText_HailStricken,
    BattleText_WasSeeded,
    BattleText_EvadedAttack,
    BattleText_HealthSapped,
    BattleText_FastAsleep,
    BattleText_WokeUp,
    BattleText_UproarAwake,
    BattleText_UproarWoke,
    BattleText_UproarCaused,
    BattleText_UproarMaking,
    BattleText_CalmedDown,
    BattleText_UproarCantSleep,
    BattleText_Stockpiled,
    BattleText_StockpiledCant,
    BattleText_UproarCantSleep2,
    BattleText_UproarKeptAwake,
    BattleText_StayedAwake,
    BattleText_StoringEnergy,
    BattleText_UnleashedEnergy,
    BattleText_FatigueConfuse,
    BattleText_PickedUpYen,
    BattleText_Unaffected,
    BattleText_Transformed,
    BattleText_SubMade,
    BattleText_SubAlready,
    BattleText_SubTookDamage,
    BattleText_SubFaded,
    BattleText_MustRecharge,
    BattleText_RageBuilding,
    BattleText_MoveWasDisabled,
    BattleText_MoveIsDisabled,
    BattleText_DisabledNoMore,
    BattleText_EncoreGot,
    BattleText_EncoreEnded,
    BattleText_TookAim,
    BattleText_SketchedMove,
    BattleText_DestinyBondTake,
    BattleText_DestinyBondTaken,
    BattleText_ReducedBy,
    BattleText_StoleSomething,
    BattleText_CantEscapeNow,
    BattleText_NightmareStart,
    BattleText_NightmareLock,
    BattleText_CurseLay,
    BattleText_CurseAfflict,
    BattleText_SpikesScattered,
    BattleText_SpikesHurt,
    BattleText_IdentifiedPoke,
    BattleText_PerishSongFell,
    BattleText_BracedItself,
    BattleText_EnduredHit,
    BattleText_MagnitudeCount,
    BattleText_CutHPMaxATK,
    BattleText_CopyStatChanges,
    BattleText_GotFreeFrom,
    BattleText_LeechShed,
    BattleText_SpikesBlownAway,
    BattleText_FledBattle,
    BattleText_ForesawAttack,
    BattleText_TookAttack,
    BattleText_PokeAttack,
    BattleText_CenterAttention,
    BattleText_ChargingPower,
    BattleText_NaturePower,
    BattleText_StatusNormal,
    BattleText_NoMovesLeft,
    BattleText_TormentSubject,
    BattleText_TormentNoUse,
    BattleText_TightenFocus,
    BattleText_TauntFell,
    BattleText_TauntNoUse,
    BattleText_ReadyToHelp,
    BattleText_SwitchedItems,
    BattleText_CopiedObject,
    BattleText_WishMade,
    BattleText_WishTrue,
    BattleText_PlantedRoots,
    BattleText_AbsorbNutrients,
    BattleText_AnchoredItself,
    BattleText_DrowsyMade,
    BattleText_KnockedOffItem,
    BattleText_AbilitySwap,
    BattleText_SealedMove,
    BattleText_SealedNoUse,
    BattleText_GrudgeBear,
    BattleText_GrudgeLosePP,
    BattleText_ShroudedItself,
    BattleText_MagicCoatBounce,
    BattleText_AwaitMove,
    BattleText_SnatchedMove,
    BattleText_RainMade,
    BattleText_SpeedRisen,
    BattleText_ProtectedBy,
    BattleText_PreventedBy,
    BattleText_HPRestoredUsing,
    BattleText_MadeType,
    BattleText_PreventedPara,
    BattleText_PreventedRomance,
    BattleText_PreventedPoison,
    BattleText_PreventedConfusion,
    BattleText_RaisedFirePower,
    BattleText_AnchorsItself,
    BattleText_CutsAttack,
    BattleText_PreventedStatLoss,
    BattleText_HurtOther,
    BattleText_Traced,
    BattleText_Sharply,
    BattleText_Rose,
    BattleText_Harshly,
    BattleText_Fell,
    BattleText_UnknownString7,
    BattleText_UnknownString3,
    BattleText_UnknownString5,
    BattleText_UnknownString6,
    BattleText_Critical,
    BattleText_GrandSlam,
    BattleText_MoveForget123,
    BattleText_MoveForgetAnd,
    BattleText_NotEffective,
    BattleText_SuperEffective,
    BattleText_GotAwaySafely,
    BattleText_FledWild,
    BattleText_NoRunning,
    BattleText_CantEscape2,
    BattleText_BirchDontLeaveMe,
    BattleText_Nothing,
    BattleText_Failed,
    BattleText_HurtItself,
    BattleText_MirrorFail,
    BattleText_RainStart,
    BattleText_PourStart,
    BattleText_RainCont1,
    BattleText_PourCont,
    BattleText_RainStop,
    BattleText_SandBrewed,
    BattleText_SandRages,
    BattleText_SandSubsided,
    BattleText_SunBright,
    BattleText_SunStrong,
    BattleText_SunFaded,
    BattleText_HailStart,
    BattleText_HailCont,
    BattleText_HailStop,
    BattleText_SpitUpFail,
    BattleText_SwallowFail,
    BattleText_WindHeatWave,
    BattleText_StatElim,
    BattleText_CoinScatter,
    BattleText_SubWeak,
    BattleText_PainSplit,
    BattleText_BellChime,
    BattleText_PerishSong,
    BattleText_NoPP1,
    BattleText_NoPP2,
    BattleText_Used1,
    BattleText_TutorialUsed,
    BattleText_BlockBall,
    BattleText_DontBeAThief,
    BattleText_DodgeBall,
    BattleText_MissPoke,
    BattleText_BallBrokeOhNo,
    BattleText_BallBrokeAppeared,
    BattleText_BallBrokeAlmost,
    BattleText_BallBrokeSoClose,
    BattleText_BallCaught1,
    BattleText_BallCaught2,
    BattleText_GiveNickname,
    BattleText_SentToPC,
    BattleText_AddedToDex,
    BattleText_Raining,
    BattleText_Sandstorm,
    BattleText_CantEscape,
    BattleText_IgnoredOrdersSLP,
    BattleText_IgnoredOrders,
    BattleText_BeganNap,
    BattleText_LoafingAround,
    BattleText_WontObey,
    BattleText_TurnedAway,
    BattleText_NotNotice,
    BattleText_WillSwitch,
    BattleText_CreptCloser,
    BattleText_CantGetCloser,
    BattleText_WatchingCarefully,
    BattleText_CuriousAbout,
    BattleText_EnthralledBy,
    BattleText_IgnoredThing,
    BattleText_ThrewBlock,
    BattleText_SafariOver,
    BattleText_CuredParalysis,
    BattleText_CuredPoison,
    BattleText_CuredBurn,
    BattleText_CuredFreeze,
    BattleText_CuredSleep,
    BattleText_CuredConfusion,
    BattleText_CuredStatus,
    BattleText_RestoredHealth,
    BattleText_RestoredPP,
    BattleText_RestoredStatus,
    BattleText_RestoredHPLittle,
    BattleText_ChoiceBand,
    BattleText_FocusSash,
    BattleText_Terminator2,
    BattleText_PreventedBurn,
    BattleText_BlocksOther,
    BattleText_RestoredHPByItem,
    BattleText_WhipSandstorm,
    BattleText_PreventedLoss,
    BattleText_InfatuatedPoke,
    BattleText_MadeIneffective,
    BattleText_CuredProblem,
    BattleText_OozeSuckup,
    BattleText_Transformed2,
    BattleText_ElecWeakened,
    BattleText_FireWeakened,
    BattleText_HidUnderwater,
    BattleText_SprangUp,
    BattleText_CantForgetHM,
    BattleText_FoundOne,
    BattleText_PlayerDefeatedTrainer2,
    BattleText_SoothingAroma,
    BattleText_CantUseItems,
    BattleText_UnknownString2,
    BattleText_UnknownString4,
    BattleText_HustleUse,
    BattleText_MadeUseless,
    BattleText_SandTombTrapped,
    BattleText_Terminator,
    BattleText_BoostedExp,
    BattleText_SunIntensified,
    BattleText_GroundMoveNegate,
    BattleText_WallyBall,
    BattleText_TookAttack2,
    BattleText_ChoseDestiny,
    BattleText_LostFocus,
    BattleText_UseNext,
    BattleText_FledUsingItem,
    BattleText_FledUsingOther,
    BattleText_DraggedOut,
    BattleText_PreventedOther,
    BattleText_NormalizedStatus,
    BattleText_Used2,
    BattleText_BoxFull,
    BattleText_AvoidedAttack,
    BattleText_MadeIneffective2,
    BattleText_PreventedFlinching,
    BattleText_AlreadyBurned,
    BattleText_StatNoLower,
    BattleText_BlocksOther2,
    BattleText_WoreOff,
    BattleText_RaisedDefenseLittle,
    BattleText_RaisedSpDefLittle,
    BattleText_BrokeWall,
    BattleText_PreventedOther2,
    BattleText_CuredOfProblem,
    BattleText_AttackingCantEscape,
    BattleText_Obtained1,
    BattleText_Obtained2,
    BattleText_Obtained3,
    BattleText_NoEffect,
    BattleText_NoEffectOn,
};


const u16 gMissStrings[] =
{
    BATTLE_TEXT_AttackMissed,
    BATTLE_TEXT_ProtectedItself,
    BATTLE_TEXT_AvoidedAttack,
    BATTLE_TEXT_AvoidedDamage,
    BATTLE_TEXT_GroundMoveNegate,
};

const u16 BattleTextList_401512[] =
{
    BATTLE_TEXT_CantEscape2,
    BATTLE_TEXT_BirchDontLeaveMe,
    BATTLE_TEXT_PreventEscape,
    BATTLE_TEXT_CantEscape,
    BATTLE_TEXT_AttackingCantEscape,
};

const u16 BattleTextList_40151C[] =
{
    BATTLE_TEXT_RainStart,
    BATTLE_TEXT_PourStart,
    BATTLE_TEXT_Failed,
    BATTLE_TEXT_SandBrewed,
    BATTLE_TEXT_SunBright,
    BATTLE_TEXT_HailStart,
};

const u16 BattleTextList_401528[] =
{
    BATTLE_TEXT_SandRages,
    BATTLE_TEXT_HailCont,
};

const u16 BattleTextList_40152C[] =
{
    BATTLE_TEXT_SandBuffeted,
    BATTLE_TEXT_HailStricken,
};

const u16 BattleTextList_401530[] =
{
    BATTLE_TEXT_SandSubsided,
    BATTLE_TEXT_HailStop,
};

const u16 BattleTextList_401534[] =
{
    BATTLE_TEXT_RainCont1,
    BATTLE_TEXT_PourCont,
    BATTLE_TEXT_RainStop,
};

const u16 BattleTextList_40153A[] =
{
    BATTLE_TEXT_ProtectedItself2,
    BATTLE_TEXT_BracedItself,
    BATTLE_TEXT_Failed,
};

const u16 BattleTextList_401540[] =
{
    BATTLE_TEXT_Failed,
    BATTLE_TEXT_RaisedDefense,
    BATTLE_TEXT_RaisedDefenseLittle,
    BATTLE_TEXT_RaisedSpDef,
    BATTLE_TEXT_RaisedSpDefLittle,
    BATTLE_TEXT_CoveredVeil,
};

const u16 BattleTextList_40154C[] =
{
    BATTLE_TEXT_WasSeeded,
    BATTLE_TEXT_EvadedAttack,
    BATTLE_TEXT_DoesntAffect,
    BATTLE_TEXT_HealthSapped,
    BATTLE_TEXT_OozeSuckup,
};

const u16 BattleTextList_401556[] =
{
    BATTLE_TEXT_WentToSleep,
    BATTLE_TEXT_SpeltHealthy,
};

const u16 BattleTextList_40155A[] =
{
    BATTLE_TEXT_UproarMaking,
    BATTLE_TEXT_CalmedDown,
};

const u16 BattleTextList_40155E[] =
{
    BATTLE_TEXT_Stockpiled,
    BATTLE_TEXT_StockpiledCant,
};

const u16 BattleTextList_401562[] =
{
    BATTLE_TEXT_WokeUp,
    BATTLE_TEXT_UproarWoke,
};

const u16 BattleTextList_401566[] =
{
    BATTLE_TEXT_SwallowFail,
    BATTLE_TEXT_HPFull,
};

const u16 BattleTextList_40156A[] =
{
    BATTLE_TEXT_UproarCantSleep2,
    BATTLE_TEXT_UproarKeptAwake,
    BATTLE_TEXT_StayedAwake,
};

const u16 BattleTextList_401570[] =
{
    BATTLE_TEXT_UnknownString7,
    BATTLE_TEXT_UnknownString3,
    BATTLE_TEXT_AttackingStatNoHigher,
    BATTLE_TEXT_Terminator2,
    BATTLE_TEXT_UnknownString4,
    BATTLE_TEXT_HustleUse,
};

const u16 BattleTextList_40157C[] =
{
    BATTLE_TEXT_UnknownString5,
    BATTLE_TEXT_UnknownString6,
    BATTLE_TEXT_DefendingStatNoHigher,
    BATTLE_TEXT_Terminator2,
};

const u16 BattleTextList_401584[] =
{
    BATTLE_TEXT_WhipWhirlwind,
    BATTLE_TEXT_TookSunlight,
    BATTLE_TEXT_LoweredHead,
    BATTLE_TEXT_IsGlowing,
    BATTLE_TEXT_FlewHigh,
    BATTLE_TEXT_DugHole,
    BATTLE_TEXT_HidUnderwater,
    BATTLE_TEXT_SprangUp,
};

const u16 BattleTextList_401594[] =
{
    BATTLE_TEXT_SqueezedBind,
    BATTLE_TEXT_Wrapped,
    BATTLE_TEXT_TrappedVortex,
    BATTLE_TEXT_Clamped,
    BATTLE_TEXT_TrappedVortex,
    BATTLE_TEXT_SandTombTrapped,
};

const u16 BattleTextList_4015A0[] =
{
    BATTLE_TEXT_MistShroud,
    BATTLE_TEXT_Failed,
};

const u16 BattleTextList_4015A4[] =
{
    BATTLE_TEXT_GetPumped,
    BATTLE_TEXT_Failed,
};

const u16 BattleTextList_4015A8[] =
{
    BATTLE_TEXT_Transformed,
    BATTLE_TEXT_Failed,
};

const u16 BattleTextList_4015AC[] =
{
    BATTLE_TEXT_SubMade,
    BATTLE_TEXT_SubWeak,
};

const u16 BattleTextList_4015B0[] =
{
    BATTLE_TEXT_Poisoned,
    BATTLE_TEXT_Poisoned2,
};

const u16 BattleTextList_4015B4[] =
{
    BATTLE_TEXT_Paralyzed,
    BATTLE_TEXT_Paralyzed2,
};

const u16 BattleTextList_4015B8[] =
{
    BATTLE_TEXT_FellAsleep,
    BATTLE_TEXT_MadeAsleep,
};

const u16 BattleTextList_4015BC[] =
{
    BATTLE_TEXT_Burned,
    BATTLE_TEXT_Burned2,
};

const u16 BattleTextList_4015C0[] =
{
    BATTLE_TEXT_Frozen,
    BATTLE_TEXT_Frozen2,
};

const u16 BattleTextList_4015C4[] =
{
    BATTLE_TEXT_AttackingDefrosted,
    BATTLE_TEXT_Defrosted,
};

const u16 BattleTextList_4015C8[] =
{
    BATTLE_TEXT_AttackMissed,
    BATTLE_TEXT_Unaffected,
    BATTLE_TEXT_FellLove,
    BATTLE_TEXT_InfatuatedPoke,
};

const u16 BattleTextList_4015D0[] =
{
    BATTLE_TEXT_EnergyDrained,
    BATTLE_TEXT_OozeSuckup,
};

const u16 BattleTextList_4015D4[] =
{
    BATTLE_TEXT_ElecWeakened,
    BATTLE_TEXT_FireWeakened,
};

const u16 BattleTextList_4015D8[] =
{
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_SoothingAroma,
};

const u16 BattleTextList_4015E2[] =
{
    BATTLE_TEXT_ForesawAttack,
    BATTLE_TEXT_ChoseDestiny,
};

const u16 BattleTextList_4015E6[] =
{
    BATTLE_TEXT_BallBrokeOhNo,
    BATTLE_TEXT_BallBrokeAppeared,
    BATTLE_TEXT_BallBrokeAlmost,
    BATTLE_TEXT_BallBrokeSoClose,
};

const u16 BattleTextList_4015EE[] =
{
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Sandstorm,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_SunStrong,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
};

const u16 BattleTextList_40160E[] =
{
    BATTLE_TEXT_LoafingAround,
    BATTLE_TEXT_WontObey,
    BATTLE_TEXT_TurnedAway,
    BATTLE_TEXT_NotNotice,
};

const u16 BattleTextList_401616[] =
{
    BATTLE_TEXT_CreptCloser,
    BATTLE_TEXT_CantGetCloser,
};

const u16 BattleTextList_40161A[] =
{
    BATTLE_TEXT_CuriousAbout,
    BATTLE_TEXT_EnthralledBy,
    BATTLE_TEXT_IgnoredThing,
};

const u16 BattleTextList_401620[] =
{
    BATTLE_TEXT_CuredConfusion,
    BATTLE_TEXT_CuredParalysis,
    BATTLE_TEXT_CuredFreeze,
    BATTLE_TEXT_CuredBurn,
    BATTLE_TEXT_CuredPoison,
    BATTLE_TEXT_CuredSleep,
};

const u16 BattleTextList_40162C[] =
{
    BATTLE_TEXT_CuredStatus,
    BATTLE_TEXT_NormalizedStatus,
};

const u16 BattleTextList_401630[] =
{
    BATTLE_TEXT_PreventedBurn,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_NoEffectOn,
};

const u16 BattleTextList_401636[] =
{
    BATTLE_TEXT_PreventedPara,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_NoEffectOn,
};

const u16 BattleTextList_40163C[] =
{
    BATTLE_TEXT_PreventedPoison,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_NoEffectOn,
};

const u16 BattleTextList_401642[] =
{
    BATTLE_TEXT_Obtained1,
    BATTLE_TEXT_Obtained2,
    BATTLE_TEXT_Obtained3,
};

const u16 BattleTextList_401648[] =
{
    BATTLE_TEXT_RaisedFirePower,
    BATTLE_TEXT_MadeIneffective,
};

const u16 gTrappingMoves[] =
{
    MOVE_BIND,
    MOVE_WRAP,
    MOVE_FIRE_SPIN,
    MOVE_CLAMP,
    MOVE_WHIRLPOOL,
    MOVE_SAND_TOMB,
    0xFFFF,
};

const u8 *const gUnknown_0840165C[] =
{
    BattleText_HP,
    BattleText_SpAtk,
    BattleText_Attack,
    BattleText_SpDef,
    BattleText_Defense,
    BattleStatText_Speed,
};

const u8 *const gUnknown_08401674[] =
{
    BattleText_Normal,
    BattleText_Fighting,
    BattleText_Flying,
    BattleText_Poison,
    BattleText_Ground,
    BattleText_Rock,
    BattleText_Bug,
    BattleText_Ghost,
    BattleText_Steel,
    BattleText_Typeless,
    BattleText_Fire,
    BattleText_Water,
    BattleText_Grass,
    BattleText_Electric,
    BattleText_Psychic,
    BattleText_Ice,
    BattleText_Dragon,
    BattleText_Dark,
};
# 22 "src/battle/battle_message.c" 2

const u16 gUnknown_084016BC[] =
{
    MOVE_SWORDS_DANCE,
    MOVE_STRENGTH,
    MOVE_GROWTH,
    MOVE_HARDEN,
    MOVE_MINIMIZE,
    MOVE_SMOKESCREEN,
    MOVE_WITHDRAW,
    MOVE_DEFENSE_CURL,
    MOVE_EGG_BOMB,
    MOVE_SMOG,
    MOVE_BONE_CLUB,
    MOVE_FLASH,
    MOVE_SPLASH,
    MOVE_ACID_ARMOR,
    MOVE_BONEMERANG,
    MOVE_REST,
    MOVE_SHARPEN,
    MOVE_SUBSTITUTE,
    MOVE_MIND_READER,
    MOVE_SNORE,
    MOVE_PROTECT,
    MOVE_SPIKES,
    MOVE_ENDURE,
    MOVE_ROLLOUT,
    MOVE_SWAGGER,
    MOVE_SLEEP_TALK,
    MOVE_HIDDEN_POWER,
    MOVE_PSYCH_UP,
    MOVE_EXTREME_SPEED,
    MOVE_FOLLOW_ME,
    MOVE_TRICK,
    MOVE_ASSIST,
    MOVE_INGRAIN,
    MOVE_KNOCK_OFF,
    MOVE_CAMOUFLAGE,
    MOVE_ASTONISH,
    MOVE_ODOR_SLEUTH,
    MOVE_GRASS_WHISTLE,
    MOVE_SHEER_COLD,
    MOVE_MUDDY_WATER,
    MOVE_IRON_DEFENSE,
    MOVE_BOUNCE,
    MOVE_NONE,
    MOVE_TELEPORT,
    MOVE_RECOVER,
    MOVE_BIDE,
    MOVE_AMNESIA,
    MOVE_FLAIL,
    MOVE_TAUNT,
    MOVE_BULK_UP,
    MOVE_NONE,
    MOVE_MEDITATE,
    MOVE_AGILITY,
    MOVE_MIMIC,
    MOVE_DOUBLE_TEAM,
    MOVE_BARRAGE,
    MOVE_TRANSFORM,
    MOVE_STRUGGLE,
    MOVE_SCARY_FACE,
    MOVE_CHARGE,
    MOVE_WISH,
    MOVE_BRICK_BREAK,
    MOVE_YAWN,
    MOVE_FEATHER_DANCE,
    MOVE_TEETER_DANCE,
    MOVE_MUD_SPORT,
    MOVE_FAKE_TEARS,
    MOVE_WATER_SPORT,
    MOVE_CALM_MIND,
    MOVE_NONE,
    MOVE_POUND,
    MOVE_SCRATCH,
    MOVE_VICE_GRIP,
    MOVE_WING_ATTACK,
    MOVE_FLY,
    MOVE_BIND,
    MOVE_SLAM,
    MOVE_HORN_ATTACK,
    MOVE_WRAP,
    MOVE_THRASH,
    MOVE_TAIL_WHIP,
    MOVE_LEER,
    MOVE_BITE,
    MOVE_GROWL,
    MOVE_ROAR,
    MOVE_SING,
    MOVE_PECK,
    MOVE_ABSORB,
    MOVE_STRING_SHOT,
    MOVE_EARTHQUAKE,
    MOVE_FISSURE,
    MOVE_DIG,
    MOVE_TOXIC,
    MOVE_SCREECH,
    MOVE_METRONOME,
    MOVE_LICK,
    MOVE_CLAMP,
    MOVE_CONSTRICT,
    MOVE_POISON_GAS,
    MOVE_BUBBLE,
    MOVE_SLASH,
    MOVE_SPIDER_WEB,
    MOVE_NIGHTMARE,
    MOVE_CURSE,
    MOVE_FORESIGHT,
    MOVE_CHARM,
    MOVE_ATTRACT,
    MOVE_ROCK_SMASH,
    MOVE_UPROAR,
    MOVE_SPIT_UP,
    MOVE_SWALLOW,
    MOVE_TORMENT,
    MOVE_FLATTER,
    MOVE_ROLE_PLAY,
    MOVE_ENDEAVOR,
    MOVE_TICKLE,
    MOVE_COVET,
    MOVE_NONE,
};

const u8 gUnknown_084017A8[] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};

extern const u8* const gBattleStringsTable[351];

extern u16 gLastUsedItem;
extern u8 gLastUsedAbility;
extern u8 gActiveBank;
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u8 gStringBank;
extern u8 gEffectBank;
extern u8 gAbilitiesPerBank[4];
extern u8 gBattleTextBuff1[];
extern u8 gBattleTextBuff2[];
extern u8 gBattleTextBuff3[];
extern u8 gStringVar1[];
extern u8 gStringVar2[];
extern u8 gStringVar3[];
extern u16 gBattleTypeFlags;
extern u16 gTrainerBattleOpponent;
extern u8 gDisplayedStringBattle[];
extern u8 gStringVar1[];
extern u8 gStringVar2[];
extern u8 gStringVar3[];
extern u16 gBattlePartyID[4];
extern struct BattleEnigmaBerry gEnigmaBerries[4];
extern u8 gBattleBufferA[4][0x200];

extern const u8* const gUnknown_08401674[];
extern const u8* const gUnknown_08400F58[];
extern const u8* const gUnknown_08400F78[];

struct StatusFlagString
{
    u8* flag;
    u8* ptr;
};

extern const struct StatusFlagString gUnknown_081FA6D4[7];

extern struct StringInfoBattle* gSelectedOrderFromParty;


void sub_8121D1C(u8* textBuff);
void sub_8121D74(u8* textBuff);
void StrCpyDecodeBattleTextBuff(u8* src, u8* dst);

u8 GetBankSide(u8 bank);
s32 sub_803FC34(u16);
void get_trainer_name(u8* dst);
u8 get_trainer_class_name_index(void);
u8 GetMultiplayerId(void);
u8 GetBankByPlayerAI(u8 ID);
u8 GetBankSide(u8 bank);
u8 GetBankIdentity(u8 bank);

void BufferStringBattle(u16 stringID)
{
    int i;
    const u8* stringPtr = ((void *)0);

    gSelectedOrderFromParty = (struct StringInfoBattle*)(&gBattleBufferA[gActiveBank][4]);
    gLastUsedItem = gSelectedOrderFromParty->lastItem;
    gLastUsedAbility = gSelectedOrderFromParty->lastAbility;
    ((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive = gSelectedOrderFromParty->scrActive;
    ((struct BattleStruct *) (gSharedMem + 0x0))->unk1605E = gSelectedOrderFromParty->unk1605E;
    ((struct BattleStruct *) (gSharedMem + 0x0))->hpScale = gSelectedOrderFromParty->hpScale;
    gStringBank = gSelectedOrderFromParty->StringBank;
    ((struct BattleStruct *) (gSharedMem + 0x0))->stringMoveType = gSelectedOrderFromParty->moveType;
    for (i = 0; i < 4; i++)
    {
        gAbilitiesPerBank[i] = gSelectedOrderFromParty->abilities[i];
    }
    for (i = 0; i < 0x10; i++)
    {
        gBattleTextBuff1[i] = gSelectedOrderFromParty->textBuffs[0][i];
        gBattleTextBuff2[i] = gSelectedOrderFromParty->textBuffs[1][i];
        gBattleTextBuff3[i] = gSelectedOrderFromParty->textBuffs[2][i];
    }
    switch (stringID)
    {
    case 0:
        if (gBattleTypeFlags & 0x0008)
        {
            if (gBattleTypeFlags & 0x0002)
            {
                if (gBattleTypeFlags & 0x0040)
                    stringPtr = BattleText_DoubleWantToBattle;
                else
                    stringPtr = BattleText_SingleWantToBattle2;
            }
            else
            {
                stringPtr = BattleText_SingleWantToBattle1;
            }
        }
        else
        {
            if (gBattleTypeFlags & 0x2000)
                stringPtr = BattleText_WildAppeared2;
            else if (gBattleTypeFlags & 0x0001)
                stringPtr = BattleText_WildDoubleAppeared;
            else if (gBattleTypeFlags & 0x0200)
                stringPtr = BattleText_WildAppeared3;
            else
                stringPtr = BattleText_WildAppeared1;
        }
        break;
    case 1:
        if (GetBankSide(gActiveBank) == 0)
        {
            if (gBattleTypeFlags & 0x0001)
            {
                if (gBattleTypeFlags & 0x0040)
                    stringPtr = BattleText_SentOutSingle11;
                else
                    stringPtr = BattleText_SentOutDouble4;
            }
            else
                stringPtr = BattleText_SentOutSingle6;
        }
        else
        {
            if (gBattleTypeFlags & 0x0001)
            {
                if (gBattleTypeFlags & 0x0040)
                    stringPtr = BattleText_SentOutDouble3;
                else if (gBattleTypeFlags & 0x0002)
                    stringPtr = BattleText_SentOutDouble2;
                else
                {
                    stringPtr = BattleText_SentOutDouble1;
                }
            }
            else if (gBattleTypeFlags & 0x0002)
                stringPtr = BattleText_SentOutSingle3;
            else
            {
                stringPtr = BattleText_SentOutSingle1;
            }
        }
        break;
    case 2:
        if (GetBankSide(gActiveBank) == 0)
        {
            if (((struct BattleStruct *) (gSharedMem + 0x0))->hpScale == 0)
                stringPtr = BattleText_ComeBackSingle1;
            else if (((struct BattleStruct *) (gSharedMem + 0x0))->hpScale == 1 || gBattleTypeFlags & 0x0001)
                stringPtr = BattleText_ComeBackSingle2;
            else if (((struct BattleStruct *) (gSharedMem + 0x0))->hpScale == 2)
                stringPtr = BattleText_ComeBackSingle3;
            else
                stringPtr = BattleText_ComeBackSingle4;
        }
        else
        {
            if (gTrainerBattleOpponent == 0x800)
            {
                if (gBattleTypeFlags & 0x0040)
                    stringPtr = BattleText_WithdrewPoke3;
                else
                    stringPtr = BattleText_WithdrewPoke2;
            }
            else
            {
                stringPtr = BattleText_WithdrewPoke1;
            }
        }
        break;
    case 3:
        if (GetBankSide(((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive) == 0)
        {
            if (((struct BattleStruct *) (gSharedMem + 0x0))->hpScale == 0 || gBattleTypeFlags & 0x0001)
                stringPtr = BattleText_SentOutSingle7;
            else if (((struct BattleStruct *) (gSharedMem + 0x0))->hpScale == 1)
                stringPtr = BattleText_SentOutSingle8;
            else if (((struct BattleStruct *) (gSharedMem + 0x0))->hpScale == 2)
                stringPtr = BattleText_SentOutSingle9;
            else
                stringPtr = BattleText_SentOutSingle10;
        }
        else
        {
            if (gBattleTypeFlags & 0x0002)
            {
                if (gBattleTypeFlags & 0x0040)
                    stringPtr = BattleText_SentOutSingle5;
                else
                    stringPtr = BattleText_SentOutSingle4;
            }
            else
            {
                stringPtr = BattleText_SentOutSingle2;
            }
        }
        break;
    case 4:
        sub_8121D1C(gBattleTextBuff1);
        if (gSelectedOrderFromParty->currentMove > 0x162)
            StringCopy(gBattleTextBuff2, gUnknown_08401674[((struct BattleStruct *) (gSharedMem + 0x0))->stringMoveType]);
        else
            StringCopy(gBattleTextBuff2, gMoveNames[gSelectedOrderFromParty->currentMove]);
        sub_8121D74(gBattleTextBuff2);
        stringPtr = BattleText_OpponentUsedMove;
        break;
    case 5:
        if (gBattleTextBuff1[0] & 0x80)
        {
            gBattleTextBuff1[0] &= ~(0x80);
            if (GetBankSide(gActiveBank) == 1 && gBattleTextBuff1[0] != 3)
                gBattleTextBuff1[0] ^= 3;
            if (gBattleTextBuff1[0] == 0x2 || gBattleTextBuff1[0] == 0x3)
                stringPtr = BattleText_GotAwaySafely;
            else
            {
                if (gBattleTypeFlags & 0x0040)
                    stringPtr = BattleText_FledDouble;
                else
                    stringPtr = BattleText_FledSingle;
            }
        }
        else
        {
            if (GetBankSide(gActiveBank) == 1 && gBattleTextBuff1[0] != 3)
                gBattleTextBuff1[0] ^= 3;
            if (gBattleTypeFlags & 0x0040)
            {
                switch (gBattleTextBuff1[0])
                {
                case 0x1:
                    stringPtr = BattleText_PlayerDefeatedTrainers;
                    break;
                case 0x2:
                    stringPtr = BattleText_PlayerLostTrainers;
                    break;
                case 0x3:
                    stringPtr = BattleText_PlayerTiedTrainers;
                    break;
                }
            }
            else
            {
                switch (gBattleTextBuff1[0])
                {
                case 0x1:
                    stringPtr = BattleText_PlayerDefeatedTrainer;
                    break;
                case 0x2:
                    stringPtr = BattleText_PlayerLostTrainer;
                    break;
                case 0x3:
                    stringPtr = BattleText_PlayerTiedTrainer;
                    break;
                }
            }
        }
        break;
    default:
        if (stringID >= 351 + 12)
        {
            gDisplayedStringBattle[0] = 0xFF;
            return;
        }
        else
        {
            stringPtr = gBattleStringsTable[stringID - 12];
        }
        break;
    }
    StrCpyDecodeToDisplayedStringBattle(stringPtr);
}

u32 StrCpyDecodeToDisplayedStringBattle(const u8* src)
{
    StrCpyDecodeBattle(src, gDisplayedStringBattle);
}

const u8* AppendStatusString(u8* src)
{
    u32 i;
    u8 status[8];
    u32 flag1, flag2;
    u8* statusPtr;

    memcpy(status, gUnknown_084017A8, 8);

    statusPtr = status;
    for (i = 0; i < sizeof(struct StatusFlagString); i++)
    {
        if (*src == 0xFF)
            break;
        *statusPtr = *src;
        src++;
        statusPtr++;
    }
    flag1 = *(u32*)(&status[0]);
    flag2 = *(u32*)(&status[4]);
    for (i = 0; i < 7; i++)
    {
        if (flag1 == *(u32*)(&gUnknown_081FA6D4[i].flag[0]) && flag2 == *(u32*)(&gUnknown_081FA6D4[i].flag[4]))
            return gUnknown_081FA6D4[i].ptr;
    }
    return ((void *)0);
}
# 473 "src/battle/battle_message.c"
u32 StrCpyDecodeBattle(const u8* src, u8* dst)
{
    u32 dstID = 0;
    const u8* toCpy = ((void *)0);
    u8 text[12];
    u8 multiplayerID = GetMultiplayerId();

    while (*src != 0xFF)
    {
        if (*src == 0xFD)
        {
            src++;
            switch (*src)
            {
            case 0:
                if (gBattleTextBuff1[0] == 0xFD)
                {
                    StrCpyDecodeBattleTextBuff(gBattleTextBuff1, gStringVar1);
                    toCpy = gStringVar1;
                }
                else
                {
                    toCpy = AppendStatusString(gBattleTextBuff1);
                    if (toCpy == 0)
                        toCpy = gBattleTextBuff1;
                }
                break;
            case 1:
                if (gBattleTextBuff2[0] == 0xFD)
                {
                    StrCpyDecodeBattleTextBuff(gBattleTextBuff2, gStringVar2);
                    toCpy = gStringVar2;
                }
                else
                    toCpy = gBattleTextBuff2;
                break;
            case 42:
                if (gBattleTextBuff3[0] == 0xFD)
                {
                    StrCpyDecodeBattleTextBuff(gBattleTextBuff3, gStringVar3);
                    toCpy = gStringVar3;
                }
                else
                    toCpy = gBattleTextBuff3;
                break;
            case 2:
                GetMonData(&gPlayerParty[gBattlePartyID[GetBankByPlayerAI(0)]], 2, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 3:
                GetMonData(&gEnemyParty[gBattlePartyID[GetBankByPlayerAI(1)]], 2, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 4:
                GetMonData(&gPlayerParty[gBattlePartyID[GetBankByPlayerAI(2)]], 2, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 5:
                GetMonData(&gEnemyParty[gBattlePartyID[GetBankByPlayerAI(3)]], 2, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 6:
                GetMonData(&gPlayerParty[gBattlePartyID[gLinkPlayers[multiplayerID].lp_field_18]], 2, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 7:
                GetMonData(&gEnemyParty[gBattlePartyID[gLinkPlayers[multiplayerID].lp_field_18 ^ 1]], 2, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 8:
                GetMonData(&gPlayerParty[gBattlePartyID[gLinkPlayers[multiplayerID].lp_field_18 ^ 2]], 2, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 9:
                GetMonData(&gEnemyParty[gBattlePartyID[gLinkPlayers[multiplayerID].lp_field_18 ^ 3]], 2, text);
                StringGetEnd10(text);
                toCpy = text;
                break;
            case 10:
                if (GetBankSide(gBankAttacker) != 0) { if (gBattleTypeFlags & 0x0008) toCpy = BattleText_Foe; else toCpy = BattleText_Wild; while (*toCpy != 0xFF) { dst[dstID] = *toCpy; dstID++; toCpy++; } GetMonData(&gEnemyParty[gBattlePartyID[GetBankByPlayerAI(GetBankIdentity(gBankAttacker) & 1)]], 2, text); } else { GetMonData(&gPlayerParty[gBattlePartyID[GetBankByPlayerAI(GetBankIdentity(gBankAttacker) & 1)]], 2, text); } StringGetEnd10(text); toCpy = text;
                break;
            case 11:
                if (GetBankSide(gBankAttacker) == 0)
                    GetMonData(&gPlayerParty[gBattlePartyID[GetBankByPlayerAI(GetBankIdentity(gBankAttacker) & 1) + 2]], 2, text);
                else
                    GetMonData(&gEnemyParty[gBattlePartyID[GetBankByPlayerAI(GetBankIdentity(gBankAttacker) & 1) + 2]], 2, text);

                StringGetEnd10(text);
                toCpy = text;
                break;
            case 12:
                if (GetBankSide(gBankAttacker) != 0) { if (gBattleTypeFlags & 0x0008) toCpy = BattleText_Foe; else toCpy = BattleText_Wild; while (*toCpy != 0xFF) { dst[dstID] = *toCpy; dstID++; toCpy++; } GetMonData(&gEnemyParty[gBattlePartyID[gBankAttacker]], 2, text); } else { GetMonData(&gPlayerParty[gBattlePartyID[gBankAttacker]], 2, text); } StringGetEnd10(text); toCpy = text;
                break;
            case 13:
                if (GetBankSide(gBankTarget) != 0) { if (gBattleTypeFlags & 0x0008) toCpy = BattleText_Foe; else toCpy = BattleText_Wild; while (*toCpy != 0xFF) { dst[dstID] = *toCpy; dstID++; toCpy++; } GetMonData(&gEnemyParty[gBattlePartyID[gBankTarget]], 2, text); } else { GetMonData(&gPlayerParty[gBattlePartyID[gBankTarget]], 2, text); } StringGetEnd10(text); toCpy = text;
                break;
            case 14:
                if (GetBankSide(gEffectBank) != 0) { if (gBattleTypeFlags & 0x0008) toCpy = BattleText_Foe; else toCpy = BattleText_Wild; while (*toCpy != 0xFF) { dst[dstID] = *toCpy; dstID++; toCpy++; } GetMonData(&gEnemyParty[gBattlePartyID[gEffectBank]], 2, text); } else { GetMonData(&gPlayerParty[gBattlePartyID[gEffectBank]], 2, text); } StringGetEnd10(text); toCpy = text;
                break;
            case 15:
                if (GetBankSide(gActiveBank) != 0) { if (gBattleTypeFlags & 0x0008) toCpy = BattleText_Foe; else toCpy = BattleText_Wild; while (*toCpy != 0xFF) { dst[dstID] = *toCpy; dstID++; toCpy++; } GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], 2, text); } else { GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], 2, text); } StringGetEnd10(text); toCpy = text;
                break;
            case 16:
                if (GetBankSide(((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive) != 0) { if (gBattleTypeFlags & 0x0008) toCpy = BattleText_Foe; else toCpy = BattleText_Wild; while (*toCpy != 0xFF) { dst[dstID] = *toCpy; dstID++; toCpy++; } GetMonData(&gEnemyParty[gBattlePartyID[((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive]], 2, text); } else { GetMonData(&gPlayerParty[gBattlePartyID[((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive]], 2, text); } StringGetEnd10(text); toCpy = text;
                break;
            case 17:
                if (gSelectedOrderFromParty->currentMove > 0x162)
                    toCpy = (void*) &gUnknown_08401674[((struct BattleStruct *) (gSharedMem + 0x0))->stringMoveType];
                else
                    toCpy = gMoveNames[gSelectedOrderFromParty->currentMove];
                break;
            case 18:
                if (gSelectedOrderFromParty->lastMove > 0x162)
                    toCpy = (void*) &gUnknown_08401674[((struct BattleStruct *) (gSharedMem + 0x0))->stringMoveType];
                else
                    toCpy = gMoveNames[gSelectedOrderFromParty->lastMove];
                break;
            case 19:
                if (gBattleTypeFlags & 0x0002)
                {
                    if (gLastUsedItem == ITEM_ENIGMA_BERRY)
                    {
                        if (gLinkPlayers[((struct BattleStruct *) (gSharedMem + 0x0))->linkPlayerIndex].lp_field_18 == gStringBank)
                        {
                            StringCopy(text, gEnigmaBerries[gStringBank].name);
                            StringAppend(text, BattleText_Berry);
                            toCpy = text;
                        }
                        else
                            toCpy = BattleText_EnigmaBerry;
                    }
                    else
                    {
                        CopyItemName(gLastUsedItem, text);
                        toCpy = text;
                    }
                }
                else
                {
                    CopyItemName(gLastUsedItem, text);
                    toCpy = text;
                }
                break;
            case 20:
                toCpy = gAbilityNames[gLastUsedAbility];
                break;
            case 21:
                toCpy = gAbilityNames[gAbilitiesPerBank[gBankAttacker]];
                break;
            case 22:
                toCpy = gAbilityNames[gAbilitiesPerBank[gBankTarget]];
                break;
            case 23:
                toCpy = gAbilityNames[gAbilitiesPerBank[((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive]];
                break;
            case 24:
                toCpy = gAbilityNames[gAbilitiesPerBank[gEffectBank]];
                break;
            case 25:
                if (gTrainerBattleOpponent == 0x400)
                    toCpy = gTrainerClassNames[GetSecretBaseTrainerNameIndex()];
                else if (gBattleTypeFlags & 0x0100)
                    toCpy = gTrainerClassNames[get_trainer_class_name_index()];
                else if (gBattleTypeFlags & 0x0800)
                    toCpy = gTrainerClassNames[GetEReaderTrainerClassNameIndex()];
                else
                    toCpy = gTrainerClassNames[gTrainers[gTrainerBattleOpponent].trainerClass];
                break;
            case 26:
                if (gTrainerBattleOpponent == 0x400)
                {
                    memset(text, 0xFF, 8);
                    memcpy(text, (&gSharedMem[0x17002]), 7);
                    toCpy = text;
                }
                else if (gBattleTypeFlags & 0x0100)
                {
                    get_trainer_name(text);
                    toCpy = text;
                }
                else if (gBattleTypeFlags & 0x0800)
                {
                    SetEReaderTrainerName(text);
                    toCpy = text;
                }
                else
                    toCpy = gTrainers[gTrainerBattleOpponent].trainerName;
                break;
            case 27:
                toCpy = gLinkPlayers[multiplayerID].name;
                break;
            case 28:
                toCpy = gLinkPlayers[sub_803FC34(2 ^ gLinkPlayers[multiplayerID].lp_field_18)].name;
                break;
            case 29:
                toCpy = gLinkPlayers[sub_803FC34(1 ^ gLinkPlayers[multiplayerID].lp_field_18)].name;
                break;
            case 30:
                toCpy = gLinkPlayers[sub_803FC34(3 ^ gLinkPlayers[multiplayerID].lp_field_18)].name;
                break;
            case 31:
                toCpy = gLinkPlayers[sub_803FC34(((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive)].name;
                break;
            case 32:
                toCpy = gSaveBlock2.playerName;
                break;
            case 33:
                toCpy = sub_8082830();
                break;
            case 34:
                if (GetBankSide(((struct BattleStruct *) (gSharedMem + 0x0))->scriptingActive) != 0) { if (gBattleTypeFlags & 0x0008) toCpy = BattleText_Foe; else toCpy = BattleText_Wild; while (*toCpy != 0xFF) { dst[dstID] = *toCpy; dstID++; toCpy++; } GetMonData(&gEnemyParty[((struct BattleStruct *) (gSharedMem + 0x0))->unk1605E], 2, text); } else { GetMonData(&gPlayerParty[((struct BattleStruct *) (gSharedMem + 0x0))->unk1605E], 2, text); } StringGetEnd10(text); toCpy = text;
                break;
            case 35:
                if (FlagGet(0x84B))
                    toCpy = BattleText_Lanette;
                else
                    toCpy = BattleText_Someone;
                break;
            case 38:
                if (GetBankSide(gBankAttacker) == 0)
                    toCpy = BattleText_Ally2;
                else
                    toCpy = BattleText_Foe3;
                break;
            case 39:
                if (GetBankSide(gBankTarget) == 0)
                    toCpy = BattleText_Ally2;
                else
                    toCpy = BattleText_Foe3;
                break;
            case 36:
                if (GetBankSide(gBankAttacker) == 0)
                    toCpy = BattleText_Ally;
                else
                    toCpy = BattleText_Foe2;
                break;
            case 37:
                if (GetBankSide(gBankTarget) == 0)
                    toCpy = BattleText_Ally;
                else
                    toCpy = BattleText_Foe2;
                break;
            case 40:
                if (GetBankSide(gBankAttacker) == 0)
                    toCpy = BattleText_Ally3;
                else
                    toCpy = BattleText_Foe4;
                break;
            case 41:
                if (GetBankSide(gBankTarget) == 0)
                    toCpy = BattleText_Ally3;
                else
                    toCpy = BattleText_Foe4;
                break;
            }

            while (*toCpy != 0xFF)
            {
                dst[dstID] = *toCpy;
                dstID++;
                toCpy++;
            }
            if (*src == 33)
            {
                dst[dstID] = 0xFC;
                dstID++;
                dst[dstID] = 9;
                dstID++;
            }
        }
        else
        {
            dst[dstID] = *src;
            dstID++;
        }
        src++;
    }
    dst[dstID] = *src;
    dstID++;
    return dstID;
}




void StrCpyDecodeBattleTextBuff(u8* src, u8* dst)
{
    u32 srcID = 1;
    u32 value = 0;
    u8 text[12];
    u16 hword;

    *dst = 0xFF;
    while (src[srcID] != 0xFF)
    {
        switch (src[srcID])
        {
        case 0:
            hword = ((&src[srcID + 1])[0] | ((&src[srcID + 1])[1] << 8));
            StringAppend(dst, gBattleStringsTable[hword - 12]);
            srcID += 3;
            break;
        case 1:
            switch (src[srcID + 1])
            {
            case 1:
                value = src[srcID + 3];
                break;
            case 2:
                value = ((&src[srcID + 3])[0] | ((&src[srcID + 3])[1] << 8));
                break;
            case 4:
                value = ((&src[srcID + 3])[0] | (&src[srcID + 3])[1] << 8 | (&src[srcID + 3])[2] << 16 | (&src[srcID + 3])[3] << 24);
                break;
            }
            ConvertIntToDecimalStringN(dst, value, 0, src[srcID + 2]);
            srcID += src[srcID + 1] + 3;
            break;
        case 2:
            StringAppend(dst, gMoveNames[((&src[srcID + 1])[0] | ((&src[srcID + 1])[1] << 8))]);
            srcID += 3;
            break;
        case 3:
            StringAppend(dst, gTypeNames[src[srcID + 1]]);
            srcID += 2;
            break;
        case 4:
            if (GetBankSide(src[srcID + 1]) == 0)
            {
                GetMonData(&gPlayerParty[src[srcID + 2]], 2, text);
            }
            else
            {
                if (gBattleTypeFlags & 0x0008)
                    StringAppend(dst, BattleText_Foe);
                else
                    StringAppend(dst, BattleText_Wild);
                GetMonData(&gEnemyParty[src[srcID + 2]], 2, text);
            }
            StringGetEnd10(text);
            StringAppend(dst, text);
            srcID += 3;
            break;
        case 5:
            StringAppend(dst, gUnknown_08400F58[src[srcID + 1]]);
            srcID += 2;
            break;
        case 6:
            GetSpeciesName(dst, ((&src[srcID + 1])[0] | ((&src[srcID + 1])[1] << 8)));
            srcID += 3;
            break;
        case 7:
            if (GetBankSide(src[srcID + 1]) == 0)
                GetMonData(&gPlayerParty[src[srcID + 2]], 2, dst);
            else
                GetMonData(&gEnemyParty[src[srcID + 2]], 2, dst);
            StringGetEnd10(dst);
            srcID += 3;
            break;
        case 8:
            StringAppend(dst, gUnknown_08400F78[src[srcID + 1]]);
            srcID += 2;
            break;
        case 9:
            StringAppend(dst, gAbilityNames[src[srcID + 1]]);
            srcID += 2;
            break;
        case 10:
            {
                hword = ((&src[srcID + 1])[0] | ((&src[srcID + 1])[1] << 8));
                if (gBattleTypeFlags & 0x0002)
                {
                    if (hword == ITEM_ENIGMA_BERRY)
                    {
                        if (gLinkPlayers[((struct BattleStruct *) (gSharedMem + 0x0))->linkPlayerIndex].lp_field_18 == gStringBank)
                        {
                            StringCopy(dst, gEnigmaBerries[gStringBank].name);
                            StringAppend(dst, BattleText_Berry);
                        }
                        else
                            StringAppend(dst, BattleText_EnigmaBerry);
                    }
                    else
                        CopyItemName(hword, dst);
                }
                else
                    CopyItemName(hword, dst);
                srcID += 3;
            }
            break;
        }
    }
}

void sub_8121D1C(u8* textBuff)
{
    s32 counter = 0;
    u32 i = 0;

    while (counter != 4)
    {
        if (gUnknown_084016BC[i] == 0)
            counter++;
        if (gUnknown_084016BC[i++] == gSelectedOrderFromParty->currentMove)
            break;
    }

    if (counter >= 0)
    {
        if (counter <= 2)
            StringCopy(textBuff, BattleText_Format10);
        else if (counter <= 4)
            StringCopy(textBuff, BattleText_Format11);
    }
}

void sub_8121D74(u8* dst)
{
    s32 counter = 0;
    s32 i = 0;

    while (*dst != 0xFF)
        dst++;

    while (counter != 4)
    {
        if (gUnknown_084016BC[i] == 0)
            counter++;
        if (gUnknown_084016BC[i++] == gSelectedOrderFromParty->currentMove)
            break;
    }

    switch (counter)
    {
    case 0:
        StringCopy(dst, BattleText_Exclamation2);
        break;
    case 1:
        StringCopy(dst, BattleText_Exclamation3);
        break;
    case 2:
        StringCopy(dst, BattleText_Exclamation4);
        break;
    case 3:
        StringCopy(dst, BattleText_Exclamation5);
        break;
    case 4:
        StringCopy(dst, BattleText_Exclamation);
        break;
    }
}
