# 1 "src/field/field_control_avatar.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/field_control_avatar.c"
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
# 2 "src/field/field_control_avatar.c" 2
# 1 "include/field_control_avatar.h" 1



struct FieldInput
{
    u8 pressedAButton:1;
    u8 input_field_0_1:1;
    u8 pressedStartButton:1;
    u8 pressedSelectButton:1;
    u8 input_field_0_4:1;
    u8 input_field_0_5:1;
    u8 input_field_0_6:1;
    u8 pressedBButton:1;
    u8 input_field_1_0:1;
    u8 input_field_1_1:1;
    u8 input_field_1_2:1;
    u8 input_field_1_3:1;
    u8 input_field_1_4:1;
    u8 input_field_1_5:1;
    u8 input_field_1_6:1;
    u8 input_field_1_7:1;
    u8 dpadDirection;
    u8 input_field_3;
};

void FieldClearPlayerInput(struct FieldInput *pStruct);
void FieldGetPlayerInput(struct FieldInput *pStruct, u16 keys, u16 heldKeys);
int sub_8068024(struct FieldInput *pStruct);
u8 *sub_80682A8(struct MapPosition *, u8, u8);
void overworld_poison_timer_set(void);
void prev_quest_postbuffer_cursor_backup_reset(void);
u8 *sub_8068E24(struct MapPosition *);
u8 *GetFieldObjectScriptPointerPlayerFacing(void);
bool8 mapheader_trigger_activate_at__run_now(struct MapPosition *);
bool8 sub_8068870(u16 a);
bool8 sub_8068894(void);
bool8 sub_8068A64(struct MapPosition *, u16);
u8 sub_8068F18(void);
# 3 "src/field/field_control_avatar.c" 2
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
# 4 "src/field/field_control_avatar.c" 2
# 1 "include/bike.h" 1





struct BikeHistoryInputInfo
{
    u32 dirHistoryMatch;
    u32 abStartSelectHistoryMatch;
    u32 dirHistoryMask;
    u32 abStartSelectHistoryMask;
    const u8 *dirTimerHistoryList;
    const u8 *abStartSelectHistoryList;
    u32 direction;
};


enum
{
    SPEED_STANDING,
    SPEED_NORMAL,
    SPEED_FAST,
    SPEED_FASTER,
    SPEED_FASTEST,
};


enum
{
    MACH_TRANS_FACE_DIRECTION,
    MACH_TRANS_TURN_DIRECTION,
    MACH_TRANS_KEEP_MOVING,
    MACH_TRANS_START_MOVING
};


enum
{
    ACRO_STATE_NORMAL,
    ACRO_STATE_TURNING,
    ACRO_STATE_WHEELIE_STANDING,
    ACRO_STATE_BUNNY_HOP,
    ACRO_STATE_WHEELIE_MOVING,
    ACRO_STATE_SIDE_JUMP,
    ACRO_STATE_TURN_JUMP,
};


enum
{
    ACRO_TRANS_FACE_DIRECTION,
    ACRO_TRANS_TURN_DIRECTION,
    ACRO_TRANS_MOVING,
    ACRO_TRANS_NORMAL_TO_WHEELIE,
    ACRO_TRANS_WHEELIE_TO_NORMAL,
    ACRO_TRANS_WHEELIE_IDLE,
    ACRO_TRANS_WHEELIE_HOPPING_STANDING,
    ACRO_TRANS_WHEELIE_HOPPING_MOVING,
    ACRO_TRANS_SIDE_JUMP,
    ACRO_TRANS_TURN_JUMP,
    ACRO_TRANS_WHEELIE_MOVING,
    ACRO_TRANS_WHEELIE_RISING_MOVING,
    ACRO_TRANS_WHEELIE_LOWERING_MOVING,
};

void MovePlayerOnBike(u8 direction, u16 newKeys, u16 heldKeys);
void Bike_TryAcroBikeHistoryUpdate(u16 a, u16 b);
bool8 IsRunningDisallowed(u8 tile);
bool8 IsBikingDisallowedByPlayer(void);
bool8 player_should_look_direction_be_enforced_upon_movement(void);
void GetOnOffBike(u8 var);
void BikeClearState(int var1, int var2);
void Bike_UpdateBikeCounterSpeed(u8 var);
s16 GetPlayerSpeed(void);
void Bike_HandleBumpySlopeJump(void);
# 5 "src/field/field_control_avatar.c" 2
# 1 "include/coord_event_weather.h" 1



void DoCoordEventWeather(u8);
# 6 "src/field/field_control_avatar.c" 2
# 1 "include/daycare.h" 1



u8 *GetMonNick(struct Pokemon *, u8 *);
u8 *GetBoxMonNick(struct BoxPokemon *, u8 *);
u8 CountPokemonInDaycare(struct DayCare *);
void InitDaycareMailRecordMixing(struct BoxPokemon *, struct RecordMixingDayCareMail *);
void Debug_AddDaycareSteps(u16 i);
u16 GetEggSpecies(u16);
void TriggerPendingDaycareEgg(void);
void TriggerPendingDaycareMaleEgg(void);
void CreateEgg(struct Pokemon *mon, u16, u8);
u8 ShouldEggHatch(void);
u8 GetDaycareCompatibilityScoreFromSave(void);
bool8 NameHasGenderSymbol(const u8 *, u8);
# 7 "src/field/field_control_avatar.c" 2
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
# 8 "src/field/field_control_avatar.c" 2
# 1 "include/field_fadetransition.h" 1



void palette_bg_fill_white(void);
void palette_bg_fill_black(void);
void pal_fill_black(void);
void pal_fill_black();
void pal_fill_black(void);
void task0A_asap_script_env_2_enable_and_set_ctx_running(u8);
void sub_8080990(void);
void sub_80809B0(void);
void sub_8080A3C(void);
void sub_8080AC4(void);
void mapldr_default();
void sub_8080B60(void);
void atk17_seteffectuser(void);
void sub_8080E28(void);
void sub_8080E44(void);
bool32 sub_8080E70(void);
void sub_8080E88(void);
void sub_8080E88();
void sp13E_warp_to_last_warp(void);
void sub_8080EF0(void);
void sp13F_fall_to_last_warp(void);
void sub_8080F2C(u8);
void sub_8080F48(void);
void sub_8080F58(void);
void sub_8080F68(void);
void sub_8080F9C(void);
# 9 "src/field/field_control_avatar.c" 2
# 1 "include/field_player_avatar.h" 1



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
# 5 "include/field_player_avatar.h" 2


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
# 10 "src/field/field_control_avatar.c" 2
# 1 "include/field_poison.h" 1



s32 DoPoisonFieldEffect(void);
# 11 "src/field/field_control_avatar.c" 2
# 1 "include/field_specials.h" 1



struct ElevatorMenu {
    u8 var0;
    s8 var1;
    s8 var2;
    u8 var3;
};

extern u8 gUnknown_02039250;
extern u8 gUnknown_02039251;
extern u32 gUnknown_02039254;
extern u8 gUnknown_02039258;
extern u8 gUnknown_02039259;
extern u8 gUnknown_0203925A;
extern u8 gUnknown_0203925B;
extern u8 gUnknown_0203925C;

void ResetCyclingRoadChallengeData(void);
bool32 CountSSTidalStep(u16);
u8 GetSSTidalLocation(s8 *, s8 *, s16 *, s16 *);
void ScriptAddElevatorMenuItem(u8, u8, u8, u8);
void ScriptShowElevatorMenu(void);
void SetShoalItemFlag(u16);
u8 GetLeadMonIndex(void);
void ResetFanClub(void);
u8 sub_810FB10(u8 a0);
# 12 "src/field/field_control_avatar.c" 2
# 1 "include/fieldmap.h" 1


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
# 4 "include/fieldmap.h" 2

extern struct BackupMapData gUnknown_03004870;
struct MapHeader *mapconnection_get_mapheader(struct MapConnection *connection);
int GetMapBorderIdAt(int x, int y);
extern bool8 IsMetatileDirectionallyImpassable(struct MapObject *mapObject, s16 x, s16 y, u8 direction);
int CanCameraMoveInDirection(int direction);
u32 GetBehaviorByMetatileId(u16 metatile);
void MapGridSetMetatileEntryAt(int, int, u16);

void not_trainer_hill_battle_pyramid(void);
void sub_8055FC0(void);
void mapheader_copy_mapdata_with_padding(struct MapHeader *mapHeader);
void map_copy_with_padding(u16 *map, u16 width, u16 height);
void sub_80560AC(struct MapHeader *);
void fillSouthConnection(struct MapHeader *, struct MapHeader *, s32);
void fillNorthConnection(struct MapHeader *, struct MapHeader *, s32);
void fillWestConnection(struct MapHeader *, struct MapHeader *, s32);
void fillEastConnection(struct MapHeader *, struct MapHeader *, s32);
u8 MapGridGetZCoordAt(int s, int y);
u8 MapGridIsImpassableAt(int, int);
u32 MapGridGetMetatileIdAt(int, int);
u32 MapGridGetMetatileBehaviorAt(int x, int y);
u8 MapGridGetMetatileLayerTypeAt(int, int);
void MapGridSetMetatileIdAt(int, int, u16);
u32 GetBehaviorByMetatileId(u16 metatile);
void save_serialize_map(void);
void sub_8056670();
bool8 CameraMove(int, int);
struct MapConnection *sub_8056A64(u8 direction, int x, int y);
bool8 sub_8056ABC(u8 direction, int x, int y, struct MapConnection *connection);
bool8 sub_8056B20(int x, int src_width, int dest_width, int offset);
struct MapConnection *sub_8056BA0(s16 x, s16 y);
void sub_8056C50(u16, u16);
void sav1_camera_get_focus_coords(u16 *x, u16 *y);
void GetCameraCoords(u16*, u16*);
void sub_8056D28(struct MapData *pData);
void sub_8056D38(struct MapData *pData);
void apply_map_tileset2_palette(struct MapData *pData);
void copy_map_tileset1_tileset2_to_vram( );
void apply_map_tileset1_tileset2_palette( );
# 13 "src/field/field_control_avatar.c" 2
# 1 "include/flags.h" 1
# 94 "include/flags.h"
bool8 FlagGet(u16 flag);
# 14 "src/field/field_control_avatar.c" 2
# 1 "include/item_menu.h" 1



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
# 5 "include/item_menu.h" 2

struct PocketScrollState
{
    u8 cursorPos;
    u8 scrollTop;
    u8 numSlots;
    u8 cursorMax;
};

extern struct PocketScrollState gBagPocketScrollStates[];
extern struct ItemSlot *gCurrentBagPocketItemSlots;

void ResetBagScrollPositions(void);
void ClearBag(void);
void sub_80A3E0C(void);
void sub_80A3FA0(u16 *a, u8 b, u8 c, u8 d, u8 e, u16 f);
void sub_80A4164(u8 *, u16, enum StringConvertMode, u8);
void sub_80A418C(u16 a, enum StringConvertMode b, u8 c, u8 d, u8 e);
void sub_80A53F8(void);
void HandleItemMenuPaletteFade(u8);
void sub_80A5B40(void);
void CleanUpItemMenuMessage(u8);
void CleanUpOverworldMessage(u8);
void ExecuteItemUseFromBlackPalette(void);
void sub_80A5D04(void);
void sub_80A6300(void);
void sub_80A68CC();
void sub_80A6A30(void);
bool32 sub_80A6D1C(void);
void sub_80A6DCC(void);
void sub_80A7094(u8);
u8 CreateBerrySprite(u8, s16, s16);
void sub_80A7DD4(void);
u8 sub_80A7E5C(s16);
# 15 "src/field/field_control_avatar.c" 2
# 1 "include/metatile_behavior.h" 1



bool8 MetatileBehavior_IsATile(u8);
bool8 MetatileBehavior_IsEncounterTile(u8);
bool8 MetatileBehavior_IsJumpEast(u8);
bool8 MetatileBehavior_IsJumpWest(u8);
bool8 MetatileBehavior_IsJumpNorth(u8);
bool8 MetatileBehavior_IsJumpSouth(u8);
bool8 MetatileBehavior_IsPokeGrass(u8);
bool8 MetatileBehavior_IsSandOrDeepSand(u8);
bool8 MetatileBehavior_IsDeepSand(u8);
bool8 MetatileBehavior_IsReflective(u8);
bool8 MetatileBehavior_IsIce(u8);
bool8 MetatileBehavior_IsWarpDoor(u8);
bool8 MetatileBehavior_IsDoor(u8);
bool8 MetatileBehavior_IsEscalator(u8);
bool8 unref_sub_8056EE0(u8);
bool8 MetatileBehavior_IsLadder(u8);
bool8 MetatileBehavior_IsNonAnimDoor(u8);
bool8 MetatileBehavior_IsDeepSouthWarp(u8);
bool8 MetatileBehavior_IsSurfableWaterOrUnderwater(u8);
bool8 MetatileBehavior_IsEastArrowWarp(u8);
bool8 MetatileBehavior_IsWestArrowWarp(u8);
bool8 MetatileBehavior_IsNorthArrowWarp(u8);
bool8 MetatileBehavior_IsSouthArrowWarp(u8);
bool8 MetatileBehavior_IsArrowWarp(u8);
bool8 MetatileBehavior_IsMoveTile(u8);
bool8 MetatileBehavior_IsIce_2(u8);
bool8 MetatileBehavior_IsTrickHouseSlipperyFloor(u8);
bool8 MetatileBehavior_0x05(u8);
bool8 MetatileBehavior_IsWalkNorth(u8);
bool8 MetatileBehavior_IsWalkSouth(u8);
bool8 MetatileBehavior_IsWalkWest(u8);
bool8 MetatileBehavior_IsWalkEast(u8);
bool8 MetatileBehavior_IsNorthwardCurrent(u8);
bool8 MetatileBehavior_IsSouthwardCurrent(u8);
bool8 MetatileBehavior_IsWestwardCurrent(u8);
bool8 MetatileBehavior_IsEastwardCurrent(u8);
bool8 MetatileBehavior_IsSlideNorth(u8);
bool8 MetatileBehavior_IsSlideSouth(u8);
bool8 MetatileBehavior_IsSlideWest(u8);
bool8 MetatileBehavior_IsSlideEast(u8);
bool8 MetatileBehavior_IsCounter(u8);
bool8 MetatileBehavior_IsPlayerFacingTVScreen(u8, u8);
bool8 MetatileBehavior_IsPC(u8);
bool8 is_tile_x84(u8);
bool8 sub_80571C0(u8);
bool8 MetatileBehavior_IsSecretBaseCave(u8);
bool8 MetatileBehavior_IsSecretBaseTree(u8);
bool8 MetatileBehavior_IsSecretBaseShrub(u8);
bool8 MetatileBehavior_IsSecretBasePC(u8);
bool8 sub_805724C(u8);
bool8 unref_sub_8057260(u8);
bool8 sub_8057274(u8);
bool8 sub_8057288(u8);
bool8 sub_805729C(u8);
bool8 sub_80572B0(u8);
bool8 unref_sub_80572C4(u8);
bool8 sub_80572D8(u8);
bool8 sub_80572EC(u8);
bool8 sub_8057300(u8);
bool8 sub_8057314(u8);
bool8 sub_8057328(u8);
bool8 sub_805733C(u8);
bool8 sub_8057350(u8);
bool8 sub_8057364(u8);
bool8 sub_8057378(u8);
bool8 sub_805738C(u8);
bool8 MetatileBehavior_HasRipples(u8);
bool8 MetatileBehavior_IsPuddle(u8);
bool8 MetatileBehavior_IsTallGrass(u8);
bool8 MetatileBehavior_IsLongGrass(u8);
bool8 MetatileBehavior_IsBerryTreeSoil(u8);
bool8 MetatileBehavior_IsAshGrass(u8);
bool8 MetatileBehavior_IsUnusedFootprintMetatile(u8);
bool8 MetatileBehavior_IsBridge(u8);
u8 sub_8057450(u8);
bool8 MetatileBehavior_IsLandWildEncounter(u8);
bool8 MetatileBehavior_IsWaterWildEncounter(u8);
bool8 sub_80574C4(u8);
bool8 sub_80574D8(u8);
bool8 sub_80574EC(u8);
bool8 sub_805750C(u8);
bool8 MetatileBehavior_IsShallowFlowingWater(u8);
bool8 MetatileBehavior_IsThinIce(u8);
bool8 MetatileBehavior_IsCrackedIce(u8);
bool8 sub_8057568(u8);
bool8 unref_sub_8057584(u8);
bool8 sub_805759C(u8);
bool8 MetatileBehavior_IsEastBlocked(u8);
bool8 MetatileBehavior_IsWestBlocked(u8);
bool8 MetatileBehavior_IsNorthBlocked(u8);
bool8 MetatileBehavior_IsSouthBlocked(u8);
bool8 MetatileBehavior_IsShortGrass(u8);
bool8 MetatileBehavior_IsHotSprings(u8);
bool8 MetatileBehavior_IsWaterfall(u8);
bool8 MetatileBehavior_IsFortreeBridge(u8);
bool8 sub_80576A0(u8);
bool8 sub_80576B4(u8);
bool8 sub_80576C8(u8);
bool8 sub_80576DC(u8);
bool8 MetatileBehavior_IsPacifidlogLog(u8);
bool8 MetatileBehavior_IsTrickHousePuzzleDoor(u8);
bool8 MetatileBehavior_IsRegionMap(u8);
bool8 MetatileBehavior_IsClosedSootopolisGymDoor(u8);
bool8 MetatileBehavior_IsRoulette(u8);
bool8 MetatileBehavior_IsPokeblockFeeder(u8);
bool8 MetatileBehavior_0xBB(u8);
bool8 MetatileBehavior_0xBC(u8);
bool8 MetatileBehavior_IsLavaridgeB1FWarp(u8);
bool8 MetatileBehavior_IsLavaridge1FWarp(u8);
bool8 MetatileBehavior_IsAquaHideoutWarp(u8);
bool8 MetatileBehavior_IsSurfableFishableWater(u8);
bool8 MetatileBehavior_IsMtPyreHole(u8);
bool8 MetatileBehavior_IsCrackedFloorHole(u8);
bool8 MetatileBehavior_IsCrackedFloor(u8);
bool8 MetatileBehavior_IsMuddySlope(u8);
bool8 MetatileBehavior_IsBumpySlope(u8);
bool8 MetatileBehavior_IsIsolatedVerticalRail(u8);
bool8 MetatileBehavior_IsIsolatedHorizontalRail(u8);
bool8 MetatileBehavior_IsVerticalRail(u8);
bool8 MetatileBehavior_IsHorizontalRail(u8);
bool8 MetatileBehavior_IsSeaweed(u8);
bool8 MetatileBehavior_IsRunningDisallowed(u8);
bool8 MetatileBehavior_IsCuttableGrass(u8);
bool8 sub_805791C(u8);
bool8 MetatileBehavior_IsPictureBookShelf(u8);
bool8 MetatileBehavior_IsBookShelf(u8);
bool8 MetatileBehavior_IsPokeCenterBookShelf(u8);
bool8 MetatileBehavior_IsVase(u8);
bool8 MetatileBehavior_IsTrashCan(u8);
bool8 MetatileBehavior_IsShopShelf(u8);
bool8 MetatileBehavior_IsBlueprint(u8);
# 16 "src/field/field_control_avatar.c" 2
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
# 17 "src/field/field_control_avatar.c" 2
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
# 18 "src/field/field_control_avatar.c" 2
# 1 "include/script.h" 1



struct ScriptContext;

typedef bool8 (*ScrCmdFunc)(struct ScriptContext *);
typedef u8 Script[];

struct ScriptContext
{
    u8 stackDepth;
    u8 mode;
    u8 comparisonResult;
    bool8 (*nativePtr)(void);
    const u8 *scriptPtr;
    const u8 *stack[20];
    ScrCmdFunc *cmdTable;
    ScrCmdFunc *cmdTableEnd;
    u32 data[4];
};



void InitScriptContext(struct ScriptContext *ctx, void *cmdTable, void *cmdTableEnd);
u8 SetupBytecodeScript(struct ScriptContext *ctx, const u8 *ptr);
void SetupNativeScript(struct ScriptContext *ctx, bool8 (*ptr)(void));
void StopScript(struct ScriptContext *ctx);
u8 RunScriptCommand(struct ScriptContext *ctx);
u8 ScriptPush(struct ScriptContext *ctx, const u8 *ptr);
const u8 *ScriptPop(struct ScriptContext *ctx);
void ScriptJump(struct ScriptContext *ctx, u8 *ptr);
void ScriptCall(struct ScriptContext *ctx, u8 *ptr);
void ScriptReturn(struct ScriptContext *ctx);
u16 ScriptReadHalfword(struct ScriptContext *ctx);
u32 ScriptReadWord(struct ScriptContext *ctx);
void ScriptContext2_Enable(void);
void ScriptContext2_Disable(void);
bool8 ScriptContext2_IsEnabled(void);
void ScriptContext1_Init(void);
bool8 ScriptContext2_RunScript(void);
void ScriptContext1_SetupScript(const u8 *ptr);
void ScriptContext1_Stop(void);
void EnableBothScriptContexts(void);
void ScriptContext2_RunNewScript(const u8 *ptr);
void mapheader_run_script_with_tag_x1(void);
void mapheader_run_script_with_tag_x3(void);
void mapheader_run_script_with_tag_x5(void);
void mapheader_run_script_with_tag_x6(void);
bool8 mapheader_run_first_tag2_script_list_match(void);
void mapheader_run_first_tag4_script_list_match(void);
void ClearRamScript(void);
bool8 InitRamScript(u8 *script, u16 scriptSize, u8 mapGroup, u8 mapNum, u8 objectId);
u8 *GetRamScript(u8 objectId, u8 *script);
# 19 "src/field/field_control_avatar.c" 2
# 1 "include/secret_base.h" 1






void ResetSecretBases(void);
void sub_80BB5E4(void);
void sub_80BB63C(void);
void sub_80BB800(void);
void sub_80BB970(struct MapEvents *events);
u8 sub_80BBB24(void);
void sub_80BBCCC(u8 flagIn);
void sub_80BBFD8(struct MapPosition *, struct MapEvents *);
void sub_80BC038(struct MapPosition *, struct MapEvents *);
u8 sub_80BC050();
u8 *GetSecretBaseMapName(u8 *dest);
void sub_80BC300();
u8 sub_80BCCA4(u8 secretBaseIndex);
const u8 *sub_80BCCE8(void);
void sub_80BCF1C(u8 taskId);
void sub_80BD674(void *playerRecords, u32 size, u8 c);
# 20 "src/field/field_control_avatar.c" 2
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
# 21 "src/field/field_control_avatar.c" 2
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
# 22 "src/field/field_control_avatar.c" 2
# 1 "include/start_menu.h" 1




void CreateStartMenuTask(void (*func)(u8));
void sub_80712B4(u8 taskId);
void sub_8071310(void);
void ScrSpecial_DoSaveDialog(void);
void sub_8071B28(void);
# 23 "src/field/field_control_avatar.c" 2
# 1 "include/trainer_see.h" 1






bool8 CheckTrainers(void);
bool8 CheckTrainer(u8);
u8 TrainerCanApproachPlayer(struct MapObject *);

bool8 CheckPathBetweenTrainerAndPlayer(struct MapObject2 *, u8, u8);
void sub_80842C8(struct MapObject *, u8);
void sub_80842FC(void (*func)(u8));
void RunTrainerSeeFuncList(u8);
void sub_8084794(struct MapObject *var);
void ScrSpecial_EndTrainerApproach(void);
void sub_80847D8(u8);
void sub_8084894(struct Sprite *sprite, u16 a2, u8 a3);
void objc_exclamation_mark_probably(struct Sprite *sprite);
# 24 "src/field/field_control_avatar.c" 2
# 1 "include/vars.h" 1
# 25 "src/field/field_control_avatar.c" 2
# 1 "include/wild_encounter.h" 1



struct WildPokemon
{
    u8 minLevel;
    u8 maxLevel;
    u16 species;
};

struct WildPokemonInfo
{
    u8 encounterRate;
    const struct WildPokemon *wildPokemon;
};

struct WildPokemonHeader
{
    u8 mapGroup;
    u8 mapNum;
    struct WildPokemonInfo *landMonsInfo;
    struct WildPokemonInfo *waterMonsInfo;
    struct WildPokemonInfo *rockSmashMonsInfo;
    struct WildPokemonInfo *fishingMonsInfo;
};

extern struct WildPokemonHeader gWildMonHeaders[];

void DisableWildEncounters(bool8 disabled);
bool8 StandardWildEncounter(u16 a, u16 b);
void ScrSpecial_RockSmashWildEncounter(void);
bool8 SweetScentWildEncounter(void);
bool8 DoesCurrentMapHaveFishingMons(void);
void FishingWildEncounter(u8 rod);
u16 GetLocalWildMon(bool8 *isWaterMon);
u16 GetLocalWaterMon(void);
bool8 UpdateRepelCounter(void);
# 26 "src/field/field_control_avatar.c" 2

struct Coords32
{
    s32 x;
    s32 y;
};

extern u16 gScriptLastTalked;
extern u16 gScriptFacing;
extern struct LinkPlayerMapObject gLinkPlayerMapObjects[];
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;

static __attribute__((section("ewram_data"))) u8 gUnknown_0202E8C0 = 0;
static __attribute__((section("ewram_data"))) u16 gUnknown_0202E8C2 = 0;

u8 gSelectedMapObject;


extern u8 gUnknown_081A2C51[];
extern u8 gUnknown_0815281E[];
extern u8 gUnknown_08152C39[];
extern u8 gUnknown_0815F36C[];
extern u8 gUnknown_0815F43A[];
extern u8 gUnknown_081A0009[];
extern u8 gUnknown_081C6C02[];
extern u8 HiddenItemScript[];
extern u8 Event_TV[];
extern u8 gUnknown_081A0009[];
extern u8 ClosedSootopolisGymDoorScript[];
extern u8 gUnknown_081A4363[];
extern u8 gUnknown_081C346A[];
extern u8 gUnknown_081616E1[];
extern u8 Event_WorldMap[];
extern u8 S_RunningShoesManual[];
extern u8 PictureBookShelfScript[];
extern u8 BookshelfScript[];
extern u8 PokemonCenterBookshelfScript[];
extern u8 VaseScript[];
extern u8 TrashCanScript[];
extern u8 ShopShelfScript[];
extern u8 BlueprintScript[];
extern u8 gUnknown_0815F36C[];
extern u8 gUnknown_0815F43A[];
extern u8 gUnknown_0815F523[];
extern u8 gUnknown_0815F528[];
extern u8 UseSurfScript[];
extern u8 S_UseWaterfall[];
extern u8 S_CannotUseWaterfall[];
extern u8 UseDiveScript[];
extern u8 S_UseDiveUnderwater[];
extern u8 S_FallDownHole[];
extern u8 gUnknown_081A14B8[];
extern u8 S_EggHatch[];
extern u8 gUnknown_0815FD0D[];
extern u8 gUnknown_081C6BDE[];

static void player_get_pos_to_and_height(struct MapPosition *);
static void player_get_next_pos_and_height(struct MapPosition *);
static u16 cur_mapdata_block_role_at_player_pos(int);
static bool8 sub_80681F0(struct MapPosition *position, u16 b, u8 c);
static u8 *TryGetScriptOnPressingA(struct MapPosition *position, u8 b, u8 c);
static u8 *sub_8068364(struct MapPosition *, u8, u8);
static u8 *TryGetInvisibleMapObjectScript(struct MapPosition *, u8, u8 c);
static u8 *sub_8068500(struct MapPosition *, u8, u8);
static u8 *TryGetFieldMoveScript(struct MapPosition *, u8, u8);
static bool32 sub_8068770(void);
static bool32 sub_80687A4(void);
static bool8 sub_80687E4(struct MapPosition *, u16, u16);
static void happiness_algorithm_step(void);
static bool8 overworld_poison_step(void);
static bool8 is_it_battle_time_3(u16);
static bool8 mapheader_run_first_tag2_script_list_match_conditionally(struct MapPosition *, u16, u8);
static bool8 sub_8068B30(u16);
static bool8 is_non_stair_warp_tile(u16, u8);
static s8 map_warp_check_packed(struct MapHeader *, struct MapPosition *);
static void sub_8068C30(struct MapHeader *, s8, struct MapPosition *);
static bool8 map_warp_consider_2_to_inside(struct MapPosition *, u16, u8);
static s8 map_warp_check(struct MapHeader *, u16, u16, u8);
static u8 *mapheader_trigger_activate_at(struct MapHeader *, u16, u16, u8);
static struct BgEvent *FindInvisibleMapObjectByPosition(struct MapHeader *, u16, u16, u8);

void FieldClearPlayerInput(struct FieldInput *input)
{
    input->pressedAButton = 0;
    input->input_field_0_1 = 0;
    input->pressedStartButton = 0;
    input->pressedSelectButton = 0;
    input->input_field_0_4 = 0;
    input->input_field_0_5 = 0;
    input->input_field_0_6 = 0;
    input->pressedBButton = 0;
    input->input_field_1_0 = 0;
    input->input_field_1_1 = 0;
    input->input_field_1_2 = 0;
    input->input_field_1_3 = 0;
    input->dpadDirection = 0;
}

void FieldGetPlayerInput(struct FieldInput *input, u16 newKeys, u16 heldKeys)
{
    u8 r6 = gPlayerAvatar.tileTransitionState;
    u8 r9 = gPlayerAvatar.runningState;
    bool8 forcedMove = MetatileBehavior_IsMoveTile(cur_mapdata_block_role_at_player_pos(r9));

    if ((r6 == 2 && forcedMove == 0) || r6 == 0)
    {
        if (GetPlayerSpeed() != 4)
        {
            if (newKeys & 0x0008)
                input->pressedStartButton = 1;
            if (newKeys & 0x0004)
                input->pressedSelectButton = 1;
            if (newKeys & 0x0001)
                input->pressedAButton = 1;
            if (newKeys & 0x0002)
                input->pressedBButton = 1;
        }
        if (heldKeys & (0x0040 | 0x0080 | 0x0020 | 0x0010))
        {
            input->input_field_0_4 = 1;
            input->input_field_0_5 = 1;
        }
    }
    if (forcedMove == 0)
    {
        if (r6 == 2 && r9 == 2)
            input->input_field_0_6 = 1;
        if (forcedMove == 0 && r6 == 2)
            input->input_field_0_1 = 1;
    }
    if (heldKeys & 0x0040)
        input->dpadDirection = DIR_NORTH;
    else if (heldKeys & 0x0080)
        input->dpadDirection = DIR_SOUTH;
    else if (heldKeys & 0x0020)
        input->dpadDirection = DIR_WEST;
    else if (heldKeys & 0x0010)
        input->dpadDirection = DIR_EAST;
}

int sub_8068024(struct FieldInput *input)
{
    struct MapPosition position;
    u8 r6;
    u16 r4;

    r6 = player_get_direction_lower_nybble();
    player_get_pos_to_and_height(&position);
    r4 = MapGridGetMetatileBehaviorAt(position.x, position.y);
    if (CheckTrainers() == 1)
        return 1;
    if (mapheader_run_first_tag2_script_list_match() == 1)
        return 1;
    if (input->pressedBButton && sub_80687A4() == 1)
        return 1;
    if (input->input_field_0_6)
    {
        IncrementGameStat(5);
        if (sub_80687E4(&position, r4, r6) == 1)
            return 1;
    }
    if (input->input_field_0_1 && is_it_battle_time_3(r4) == 1)
        return 1;
    if (input->input_field_0_4 && input->dpadDirection == r6)
    {
        if (mapheader_run_first_tag2_script_list_match_conditionally(&position, r4, r6) == 1)
            return 1;
    }
    player_get_next_pos_and_height(&position);
    r4 = MapGridGetMetatileBehaviorAt(position.x, position.y);
    if (input->pressedAButton && sub_80681F0(&position, r4, r6) == 1)
        return 1;
    if (input->input_field_0_5 && input->dpadDirection == r6)
    {
        if (map_warp_consider_2_to_inside(&position, r4, r6) == 1)
            return 1;
    }
    if (input->pressedAButton && sub_8068770() == 1)
        return 1;
    if (input->pressedStartButton)
    {
        PlaySE(SE_WIN_OPEN);
        sub_8071310();
        return 1;
    }
    if (input->pressedSelectButton && sub_80A6D1C() == 1)
        return 1;
    return 0;
}

static void player_get_pos_to_and_height(struct MapPosition *position)
{
    PlayerGetDestCoords(&position->x, &position->y);
    position->height = PlayerGetZCoord();
}

static void player_get_next_pos_and_height(struct MapPosition *position)
{
    s16 x, y;

    GetXYCoordsOneStepInFrontOfPlayer(&position->x, &position->y);
    PlayerGetDestCoords(&x, &y);
    if (MapGridGetZCoordAt(x, y) != 0)
        position->height = PlayerGetZCoord();
    else
        position->height = 0;
}

static u16 cur_mapdata_block_role_at_player_pos(int unused)
{
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    return MapGridGetMetatileBehaviorAt(x, y);
}

static bool8 sub_80681F0(struct MapPosition *position, u16 b, u8 c)
{
    u8 *script = TryGetScriptOnPressingA(position, b, c);

    if (script == ((void *)0))
        return 0;

    if (script != gUnknown_0815281E
     && script != gUnknown_08152C39
     && script != gUnknown_0815F36C
     && script != gUnknown_0815F43A
     && script != gUnknown_081A0009)
        PlaySE(5);

    ScriptContext1_SetupScript(script);
    return 1;
}

static u8 *TryGetScriptOnPressingA(struct MapPosition *position, u8 b, u8 c)
{
    u8 *script;

    script = sub_8068364(position, b, c);
    if (script != ((void *)0))
        return script;
    script = TryGetInvisibleMapObjectScript(position, b, c);
    if (script != ((void *)0))
        return script;
    script = sub_8068500(position, b, c);
    if (script != ((void *)0))
        return script;
    script = TryGetFieldMoveScript(position, b, c);
    if (script != ((void *)0))
        return script;

    return ((void *)0);
}

u8 *sub_80682A8(struct MapPosition *position, u8 unused, u8 c)
{
    u8 r3;
    s32 i;

    if (!MetatileBehavior_IsCounter(MapGridGetMetatileBehaviorAt(position->x, position->y)))
        r3 = GetFieldObjectIdByXYZ(position->x, position->y, position->height);
    else
        r3 = GetFieldObjectIdByXYZ(position->x + gUnknown_0821664C[c].x, position->y + gUnknown_0821664C[c].y, position->height);
    if (r3 == 16 || gMapObjects[r3].localId == 0xFF)
        return ((void *)0);
    for (i = 0; i < 4; i++)
    {
        if (gLinkPlayerMapObjects[i].active == 1 && gLinkPlayerMapObjects[i].mapObjId == r3)
            return ((void *)0);
    }
    gSelectedMapObject = r3;
    gScriptLastTalked = gMapObjects[r3].localId;
    gScriptFacing = c;
    return GetFieldObjectScriptPointerByFieldObjectId(r3);
}

static u8 *sub_8068364(struct MapPosition *position, u8 b, u8 c)
{
    u8 r3;
    u8 *script;

    r3 = GetFieldObjectIdByXYZ(position->x, position->y, position->height);
    if (r3 == 16 || gMapObjects[r3].localId == 0xFF)
    {
        if (MetatileBehavior_IsCounter(b) != 1)
            return ((void *)0);
        r3 = GetFieldObjectIdByXYZ(position->x + gUnknown_0821664C[c].x, position->y + gUnknown_0821664C[c].y, position->height);
        if (r3 == 16 || gMapObjects[r3].localId == 0xFF)
            return ((void *)0);
    }

    gSelectedMapObject = r3;
    gScriptLastTalked = gMapObjects[r3].localId;
    gScriptFacing = c;
    script = GetFieldObjectScriptPointerByFieldObjectId(r3);
    script = GetRamScript(gScriptLastTalked, script);
    return script;
}

static u8 *TryGetInvisibleMapObjectScript(struct MapPosition *position, u8 unused, u8 c)
{
    struct BgEvent *bgEvent = FindInvisibleMapObjectByPosition(&gMapHeader, position->x - 7, position->y - 7, position->height);

    if (bgEvent == ((void *)0))
        return ((void *)0);
    if (bgEvent->bgUnion.script == ((void *)0))
        return gUnknown_081C6C02;
    switch (bgEvent->kind)
    {
    case 0:
    default:
        return bgEvent->bgUnion.script;
    case 1:
        if (c != 2)
            return ((void *)0);
        break;
    case 2:
        if (c != 1)
            return ((void *)0);
        break;
    case 3:
        if (c != 4)
            return ((void *)0);
        break;
    case 4:
        if (c != 3)
            return ((void *)0);
        break;
    case 5:
    case 6:
    case 7:
        gSpecialVar_0x8004 = ((u32)bgEvent->bgUnion.script >> 16) + 0x258;
        gSpecialVar_0x8005 = (u32)bgEvent->bgUnion.script;
        if (FlagGet(gSpecialVar_0x8004) == 1)
            return ((void *)0);
        return HiddenItemScript;
    case 8:
        if (c == 2)
        {
            gSpecialVar_0x8004 = (u32)bgEvent->bgUnion.script;
            if (sub_80BC050())
                return gUnknown_081A2C51;
        }
        return ((void *)0);
    }
    return bgEvent->bgUnion.script;
}

static u8 *sub_8068500(struct MapPosition *position, u8 b, u8 c)
{
    s8 height;

    if (MetatileBehavior_IsPlayerFacingTVScreen(b, c) == 1)
        return Event_TV;
    if (MetatileBehavior_IsPC(b) == 1)
        return gUnknown_081A0009;
    if (MetatileBehavior_IsClosedSootopolisGymDoor(b) == 1)
        return ClosedSootopolisGymDoorScript;
    if (is_tile_x84(b) == 1)
        return gUnknown_081A4363;
    if (MetatileBehavior_IsPokeblockFeeder(b) == 1)
        return gUnknown_081C346A;
    if (MetatileBehavior_IsTrickHousePuzzleDoor(b) == 1)
        return gUnknown_081616E1;
    if (MetatileBehavior_IsRegionMap(b) == 1)
        return Event_WorldMap;
    if (sub_805791C(b) == 1)
        return S_RunningShoesManual;
    if (MetatileBehavior_IsPictureBookShelf(b) == 1)
        return PictureBookShelfScript;
    if (MetatileBehavior_IsBookShelf(b) == 1)
        return BookshelfScript;
    if (MetatileBehavior_IsPokeCenterBookShelf(b) == 1)
        return PokemonCenterBookshelfScript;
    if (MetatileBehavior_IsVase(b) == 1)
        return VaseScript;
    if (MetatileBehavior_IsTrashCan(b) == 1)
        return TrashCanScript;
    if (MetatileBehavior_IsShopShelf(b) == 1)
        return ShopShelfScript;
    if (MetatileBehavior_IsBlueprint(b) == 1)
        return BlueprintScript;
    height = position->height;
    if (height == MapGridGetZCoordAt(position->x, position->y))
    {
        if (MetatileBehavior_IsSecretBasePC(b) == 1)
            return gUnknown_0815F36C;
        if (sub_805724C(b) == 1)
            return gUnknown_0815F43A;
        if (sub_8057364(b) == 1)
            return gUnknown_0815F523;
        if (sub_8057378(b) == 1)
            return gUnknown_0815F528;
    }
    return ((void *)0);
}

static u8 *TryGetFieldMoveScript(struct MapPosition *unused1, u8 b, u8 unused2)
{
    if (FlagGet(0x80B) == 1 && PartyHasMonWithSurf() == 1 && IsPlayerFacingSurfableFishableWater() == 1)
        return UseSurfScript;
    if (MetatileBehavior_IsWaterfall(b) == 1)
    {
        if (FlagGet(0x80E) == 1 && IsPlayerSurfingNorth() == 1)
            return S_UseWaterfall;
        else
            return S_CannotUseWaterfall;
    }
    return ((void *)0);
}

static bool32 sub_8068770(void)
{
    if (FlagGet(0x80D) && sub_8068F18() == 2)
    {
        ScriptContext1_SetupScript(UseDiveScript);
        return 1;
    }
    return 0;
}

static bool32 sub_80687A4(void)
{
    if (FlagGet(0x80D) && gMapHeader.mapType == MAP_TYPE_UNDERWATER && sub_8068F18() == 1)
    {
        ScriptContext1_SetupScript(S_UseDiveUnderwater);
        return 1;
    }
    return 0;
}

static bool8 sub_80687E4(struct MapPosition *position, u16 b, u16 unused)
{
    if (mapheader_trigger_activate_at__run_now(position) == 1)
        return 1;
    if (sub_8068A64(position, b) == 1)
        return 1;
    if (sub_8068870(b) == 1)
        return 1;
    if (sub_8068894() == 1)
        return 1;
    if (UpdateRepelCounter() == 1)
        return 1;
    return 0;
}

bool8 mapheader_trigger_activate_at__run_now(struct MapPosition *position)
{
    u8 *script = mapheader_trigger_activate_at(&gMapHeader, position->x - 7, position->y - 7, position->height);

    if (script == ((void *)0))
        return 0;
    ScriptContext1_SetupScript(script);
    return 1;
}


bool8 sub_8068870(u16 a)
{
    if (MetatileBehavior_IsCrackedFloorHole(a))
    {
        ScriptContext1_SetupScript(S_FallDownHole);
        return 1;
    }
    return 0;
}

bool8 sub_8068894(void)
{
    sub_8082B78();
    happiness_algorithm_step();
    if (overworld_poison_step() == 1)
    {
        ScriptContext1_SetupScript(gUnknown_081A14B8);
        return 1;
    }
    if (ShouldEggHatch())
    {
        IncrementGameStat(13);
        ScriptContext1_SetupScript(S_EggHatch);
        return 1;
    }
    if (SafariZoneTakeStep() == 1)
        return 1;
    if (CountSSTidalStep(1) == 1)
    {
        ScriptContext1_SetupScript(gUnknown_0815FD0D);
        return 1;
    }
    return 0;
}

void unref_sub_80688F8(void)
{
    VarSet(0x402A, 0);
}

static void happiness_algorithm_step(void)
{
    u16 *ptr = GetVarPointer(0x402A);
    int i;

    (*ptr)++;
    (*ptr) %= 128;
    if (*ptr == 0)
    {
        struct Pokemon *pkmn = gPlayerParty;

        for (i = 5; i >= 0; i--)
        {
            AdjustFriendship(pkmn, 5);
            pkmn++;
        }
    }
}

void overworld_poison_timer_set(void)
{
    VarSet(0x402B, 0);
}

static bool8 overworld_poison_step(void)
{
    u16 *ptr;

    if (gMapHeader.mapType != MAP_TYPE_SECRET_BASE)
    {
        ptr = GetVarPointer(0x402B);
        (*ptr)++;
        (*ptr) %= 4;
        if (*ptr == 0)
        {
            switch (DoPoisonFieldEffect())
            {
            case 0:
                return 0;
            case 1:
                return 0;
            case 2:
                return 1;
            }
        }
    }
    return 0;
}

void prev_quest_postbuffer_cursor_backup_reset(void)
{
    gUnknown_0202E8C0 = 0;
}

static bool8 is_it_battle_time_3(u16 a)
{
    if (gUnknown_0202E8C0 < 4)
    {
        gUnknown_0202E8C0++;
        gUnknown_0202E8C2 = a;
        return 0;
    }
    if (StandardWildEncounter(a, gUnknown_0202E8C2) == 1)
    {
        gUnknown_0202E8C0 = 0;
        gUnknown_0202E8C2 = a;
        return 1;
    }
    else
    {
        gUnknown_0202E8C2 = a;
        return 0;
    }
}

static bool8 mapheader_run_first_tag2_script_list_match_conditionally(struct MapPosition *position, u16 b, u8 c)
{
    s8 r6 = map_warp_check_packed(&gMapHeader, position);

    if (is_non_stair_warp_tile(b, c) == 1 && r6 != -1)
    {
        walkrun_find_lowest_active_bit_in_bitfield();
        sub_8068C30(&gMapHeader, r6, position);
        sub_8080E88();
        return 1;
    }
    return 0;
}

bool8 sub_8068A64(struct MapPosition *position, u16 b)
{
    s8 r4 = map_warp_check_packed(&gMapHeader, position);

    if (r4 != -1 && sub_8068B30(b) == 1)
    {
        walkrun_find_lowest_active_bit_in_bitfield();
        sub_8068C30(&gMapHeader, r4, position);
        if (MetatileBehavior_IsEscalator(b) == 1)
        {
            sub_8080F2C(b);
            return 1;
        }
        if (MetatileBehavior_IsLavaridgeB1FWarp(b) == 1)
        {
            sub_8080F48();
            return 1;
        }
        if (MetatileBehavior_IsLavaridge1FWarp(b) == 1)
        {
            sub_8080F58();
            return 1;
        }
        if (MetatileBehavior_IsAquaHideoutWarp(b) == 1)
        {
            sub_8080F68();
            return 1;
        }
        if (MetatileBehavior_IsMtPyreHole(b) == 1)
        {
            ScriptContext1_SetupScript(gUnknown_081C6BDE);
            return 1;
        }
        sub_8080E88();
        return 1;
    }
    return 0;
}

static bool8 sub_8068B30(u16 a)
{
    if (MetatileBehavior_IsWarpDoor(a) != 1
     && MetatileBehavior_IsLadder(a) != 1
     && MetatileBehavior_IsEscalator(a) != 1
     && MetatileBehavior_IsNonAnimDoor(a) != 1
     && MetatileBehavior_IsLavaridgeB1FWarp(a) != 1
     && MetatileBehavior_IsLavaridge1FWarp(a) != 1
     && MetatileBehavior_IsAquaHideoutWarp(a) != 1
     && MetatileBehavior_IsMtPyreHole(a) != 1)
        return 0;
    return 1;
}

static bool8 is_non_stair_warp_tile(u16 a, u8 b)
{
    switch (b)
    {
    case 2:
        return MetatileBehavior_IsNorthArrowWarp(a);
    case 1:
        return MetatileBehavior_IsSouthArrowWarp(a);
    case 3:
        return MetatileBehavior_IsWestArrowWarp(a);
    case 4:
        return MetatileBehavior_IsEastArrowWarp(a);
    }
    return 0;
}

static s8 map_warp_check_packed(struct MapHeader *mapHeader, struct MapPosition *position)
{
    return map_warp_check(mapHeader, position->x - 7, position->y - 7, position->height);
}

static void sub_8068C30(struct MapHeader *unused, s8 b, struct MapPosition *position)
{
    struct WarpEvent *warpEvent = &gMapHeader.events->warps[b];

    if (warpEvent->mapNum == 0x7F)
    {
        copy_saved_warp2_bank_and_enter_x_to_warp1(warpEvent->mapGroup);
    }
    else
    {
        struct MapHeader *mapHeader;

        warp1_set_2(warpEvent->unk7, warpEvent->mapNum, warpEvent->mapGroup);
        sub_80535C4(position->x, position->y);
        mapHeader = Overworld_GetMapHeaderByGroupAndId(warpEvent->unk7, warpEvent->mapNum);
        if (mapHeader->events->warps[warpEvent->mapGroup].mapNum == 0x7F)
            saved_warp2_set(mapHeader->events->warps[b].mapGroup, gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum, b);
    }
}

static bool8 map_warp_consider_2_to_inside(struct MapPosition *position, u16 b, u8 c)
{
    s8 r4;

    if (c == 2)
    {
        if (sub_80571C0(b) == 1)
        {
            sub_80BC038(position, gMapHeader.events);
            return 1;
        }
        if (MetatileBehavior_IsWarpDoor(b) == 1)
        {
            r4 = map_warp_check_packed(&gMapHeader, position);
            if (r4 != -1 && sub_8068B30(b) == 1)
            {
                walkrun_find_lowest_active_bit_in_bitfield();
                sub_8068C30(&gMapHeader, r4, position);
                sub_8080EF0();
                return 1;
            }
        }
    }
    return 0;
}

static s8 map_warp_check(struct MapHeader *mapHeader, u16 x, u16 y, u8 warpId)
{
    s32 i;
    struct WarpEvent *warpEvent = mapHeader->events->warps;
    u8 warpCount = mapHeader->events->warpCount;

    for (i = 0; i < warpCount; i++, warpEvent++)
    {
        if ((u16)warpEvent->x == x && (u16)warpEvent->y == y)
        {
            if ((u8)warpEvent->warpId == warpId || (u8)warpEvent->warpId == 0)
                return i;
        }
    }
    return -1;
}

static u8 *trigger_activate(struct CoordEvent *coordEvent)
{
    if (coordEvent != ((void *)0))
    {
        if (coordEvent->script == ((void *)0))
        {
            DoCoordEventWeather(coordEvent->trigger);
            return ((void *)0);
        }
        if (coordEvent->trigger == 0)
        {
            ScriptContext2_RunNewScript(coordEvent->script);
            return ((void *)0);
        }
        if (VarGet(coordEvent->trigger) == (u8)coordEvent->index)
            return coordEvent->script;
    }
    return ((void *)0);
}

static u8 *mapheader_trigger_activate_at(struct MapHeader *mapHeader, u16 x, u16 y, u8 d)
{
    s32 i;
    struct CoordEvent *coordEvents = mapHeader->events->coordEvents;
    u8 coordEventCount = mapHeader->events->coordEventCount;
    u8 *script;

    for (i = 0; i < coordEventCount; i++)
    {
        if ((u16)coordEvents[i].x == x && (u16)coordEvents[i].y == y)
        {
            if (coordEvents[i].unk4 == d || coordEvents[i].unk4 == 0)
            {
                script = trigger_activate(&coordEvents[i]);
                if (script != ((void *)0))
                    return script;
            }
        }
    }
    return ((void *)0);
}

u8 *sub_8068E24(struct MapPosition *position)
{
    return mapheader_trigger_activate_at(&gMapHeader, position->x - 7, position->y - 7, position->height);
}

static struct BgEvent *FindInvisibleMapObjectByPosition(struct MapHeader *mapHeader, u16 b, u16 c, u8 d)
{
    u8 i;
    struct BgEvent *bgEvents = mapHeader->events->bgEvents;
    u8 bgEventCount = mapHeader->events->bgEventCount;

    for (i = 0; i < bgEventCount; i++)
    {
        if ((u16)bgEvents[i].x == b && (u16)bgEvents[i].y == c)
        {
            if (bgEvents[i].unk4 == d || bgEvents[i].unk4 == 0)
                return &bgEvents[i];
        }
    }
    return ((void *)0);
}

int dive_warp(struct MapPosition *position, u16 b)
{
    if (gMapHeader.mapType == MAP_TYPE_UNDERWATER && sub_805750C(b) == 0)
    {
        if (sub_80538B0(position->x - 7, position->y - 7))
        {
            walkrun_find_lowest_active_bit_in_bitfield();
            sp13E_warp_to_last_warp();
            PlaySE(SE_W291);
            return 1;
        }
    }
    else if (sub_80574EC(b) == 1)
    {
        if (sub_80538D0(position->x - 7, position->y - 7))
        {
            walkrun_find_lowest_active_bit_in_bitfield();
            sp13E_warp_to_last_warp();
            PlaySE(SE_W291);
            return 1;
        }
    }
    return 0;
}

u8 sub_8068F18(void)
{
    s16 x, y;
    u8 r5;

    PlayerGetDestCoords(&x, &y);
    r5 = MapGridGetMetatileBehaviorAt(x, y);
    if (gMapHeader.mapType == MAP_TYPE_UNDERWATER && sub_805750C(r5) == 0)
    {
        if (sub_80538B0(x - 7, y - 7) == 1)
            return 1;
    }
    else if (sub_80574EC(r5) == 1)
    {
        if (sub_80538D0(x - 7, y - 7) == 1)
            return 2;
    }
    return 0;
}

u8 *GetFieldObjectScriptPointerPlayerFacing(void)
{
    u8 r4;
    struct MapPosition position;

    r4 = player_get_direction_upper_nybble();
    player_get_next_pos_and_height(&position);
    return sub_8068364(&position, MapGridGetMetatileBehaviorAt(position.x, position.y), r4);
}

int SetCableClubWarp(void)
{
    struct MapPosition position;

    player_get_direction_upper_nybble();
    player_get_pos_to_and_height(&position);
    MapGridGetMetatileBehaviorAt(position.x, position.y);
    sub_8068C30(&gMapHeader, map_warp_check_packed(&gMapHeader, &position), &position);
    return 0;
}
