# 1 "src/field/field_map_obj.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/field_map_obj.c"
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
# 2 "src/field/field_map_obj.c" 2
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
# 3 "src/field/field_map_obj.c" 2
# 1 "include/berry.h" 1



enum
{
    BERRY_FIRMNESS_UNKNOWN,
    BERRY_FIRMNESS_VERY_SOFT,
    BERRY_FIRMNESS_SOFT,
    BERRY_FIRMNESS_HARD,
    BERRY_FIRMNESS_VERY_HARD,
    BERRY_FIRMNESS_SUPER_HARD,
};


enum
{
    BERRY_STAGE_NO_BERRY,
    BERRY_STAGE_PLANTED,
    BERRY_STAGE_SPROUTED,
    BERRY_STAGE_TALLER,
    BERRY_STAGE_FLOWERING,
    BERRY_STAGE_BERRIES,
    BERRY_STAGE_SPARKLING = 0xFF,
};

void SetEnigmaBerry(u8 *src);
bool32 IsEnigmaBerryValid(void);
const struct Berry *GetBerryInfo(u8 berry);
bool32 FieldObjectInteractionWaterBerryTree(void);
bool8 IsPlayerFacingUnplantedSoil(void);
bool8 TryToWaterBerryTree(void);
void ClearBerryTrees(void);
void BerryTreeTimeUpdate(s32 minutes);
void PlantBerryTree(u8 id, u8 berry, u8 stage, bool8 sparkle);
void RemoveBerryTree(u8 id);
u8 GetBerryTypeByBerryTreeId(u8 id);
u8 GetStageByBerryTreeId(u8);
u8 ItemIdToBerryType(u16 item);
void GetBerryNameByBerryType(u8 berry, u8 *string);
void ResetBerryTreeSparkleFlag(u8 id);
void FieldObjectInteractionGetBerryTreeData(void);
void Berry_FadeAndGoToBerryBagMenu(void);
void FieldObjectInteractionPlantBerryTree(void);
void FieldObjectInteractionPickBerryTree(void);
void FieldObjectInteractionRemoveBerryTree(void);
bool8 PlayerHasBerries(void);
void ResetBerryTreeSparkleFlags(void);
# 4 "src/field/field_map_obj.c" 2
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
# 5 "src/field/field_map_obj.c" 2
# 1 "include/field_camera.h" 1



struct CameraSomething
{
    void (*callback)(struct CameraSomething *);
    u32 unk4;
    s32 unk8;
    s32 unkC;
    s32 unk10;
    s32 unk14;
};

extern struct Camera gCamera;

void move_tilemap_camera_to_upper_left_corner(void);
void sub_8057A58(void);
void sub_8057B14(u16 *a, u16 *b);
void DrawWholeMapView(void);
void CurrentMapDrawMetatileAt(int a, int b);
void DrawDoorMetatileAt(int x, int y, u16 *arr);
void ResetCameraUpdateInfo(void);
u32 InitCameraUpdateCallback(u8 a);
void CameraUpdate(void);
void SetCameraPanningCallback(void (*a)(void));
void SetCameraPanning(s16 a, s16 b);
void InstallCameraPanAheadCallback(void);
void UpdateCameraPanning(void);
# 6 "src/field/field_map_obj.c" 2
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
# 7 "src/field/field_map_obj.c" 2
# 1 "include/field_effect_helpers.h" 1



extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[];

void sub_812869C(struct MapObject *);
bool8 sub_81286C4(struct MapObject *);
void oamc_shadow(struct Sprite *);
void sub_8087638(struct Sprite *);
void sub_808788C(struct Sprite *);
void sub_8127334(struct Sprite *);
void sub_8127584(struct Sprite *);
void sub_81276B4(struct Sprite *);
void sub_8127A7C(struct Sprite *);
void sub_8127D84(struct Sprite *);
void sub_8127F7C(struct Sprite *);
void sub_81282E0(struct Sprite *);
void sub_8128410(struct Sprite *);
void sub_81285AC(struct Sprite *);
void sub_8128774(struct Sprite *);
void sub_81287C4(struct Sprite *);
void sub_8128800(struct Sprite *);
void unc_grass_normal(struct Sprite *);
void unc_grass_tall(struct Sprite *);
u8 sub_8126B54(void);
void objid_set_invisible(u8);
void sub_8126BC4(u8 unk_1B, u8 r6, s16 x, s16 y);
void sub_8127ED0(u8, u8);
void sub_8127F28(u8, u8, s16);
u8 sub_8128124(u8 id);
void ash(s16, s16, u16, s16);
void SetUpReflection(struct MapObject *mapObj, struct Sprite *sprite, u8 a);
u32 oe_exec_and_other_stuff(u8 fieldEffectId, struct MapObject *mapObject);
u8 sub_8126FF0(u8, u8, u8, s16, s16);
# 8 "src/field/field_map_obj.c" 2
# 1 "include/field_ground_effect.h" 1



bool8 IsZCoordMismatchAt(u8 z, s16 x, s16 y);
bool8 AreZCoordsCompatible(u8 z1, u8 z2);
void FieldObjectUpdateMetatileBehaviors(struct MapObject *);
void GetGroundEffectFlags_Reflection(struct MapObject *, u32 *);
void GetGroundEffectFlags_TallGrassOnSpawn(struct MapObject *, u32 *);
void GetGroundEffectFlags_TallGrassOnBeginStep(struct MapObject *, u32 *);
void GetGroundEffectFlags_LongGrassOnSpawn(struct MapObject *, u32 *);
void GetGroundEffectFlags_LongGrassOnBeginStep(struct MapObject *, u32 *);
void GetGroundEffectFlags_Tracks(struct MapObject *, u32 *);
void GetGroundEffectFlags_SandPile(struct MapObject *, u32 *);
void GetGroundEffectFlags_ShallowFlowingWater(struct MapObject *, u32 *);
void GetGroundEffectFlags_Puddle(struct MapObject *, u32 *);
void GetGroundEffectFlags_Ripple(struct MapObject *, u32 *);
void GetGroundEffectFlags_ShortGrass(struct MapObject *, u32 *);
void GetGroundEffectFlags_HotSprings(struct MapObject *, u32 *);
void GetGroundEffectFlags_Seaweed(struct MapObject *, u32 *);
void GetGroundEffectFlags_JumpLanding(struct MapObject *, u32 *);
u8 FieldObjectCheckForReflectiveSurface(struct MapObject *);
u8 GetLedgeJumpDirection(s16, s16, u8);
u8 ZCoordToPriority(u8);
void FieldObjectUpdateZCoord(struct MapObject *pObject);
void SetObjectSubpriorityByZCoord(u8, struct Sprite *, u8);
# 9 "src/field/field_map_obj.c" 2
# 1 "include/field_map_obj_helpers.h" 1





bool8 FreezeMapObject(struct MapObject *);
void FreezeMapObjects(void);
void FreezeMapObjectsExceptOne(u8);
void UnfreezeMapObjects(void);
void sub_806487C(struct Sprite *sprite, bool8 invisible);
void sub_8064990(u8, u8);
void UnfreezeMapObject(struct MapObject *mapObject);
void oamt_npc_ministep_reset(struct Sprite *sprite, u8 a2, u8 a3);
void sub_806467C(struct Sprite *sprite, u8 direction);
bool8 sub_806468C(struct Sprite *sprite);
void sub_80646E4(struct Sprite *sprite, u8 a2, u8 a3, u8 a4);
void DoShadowFieldEffect(struct MapObject *mapObject);
u8 sub_8064704(struct Sprite *);
u8 sub_806478C(struct Sprite *);
void obj_anim_image_set_and_seek(struct Sprite *sprite, u8 a2, u8 a3);
void DoRippleFieldEffect(struct MapObject *mapObj, struct Sprite *sprite);
# 10 "src/field/field_map_obj.c" 2
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
# 11 "src/field/field_map_obj.c" 2
# 1 "include/fieldmap.h" 1


# 1 "include/field_map_obj.h" 1
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
# 12 "src/field/field_map_obj.c" 2
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
# 13 "src/field/field_map_obj.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 14 "src/field/field_map_obj.c" 2
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
# 15 "src/field/field_map_obj.c" 2
# 1 "include/sprite.h" 1
# 16 "src/field/field_map_obj.c" 2
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
# 17 "src/field/field_map_obj.c" 2
# 1 "include/map_constants.h" 1







enum
{
    MAP_ID_PETALBURG_CITY,
    MAP_ID_SLATEPORT_CITY,
    MAP_ID_MAUVILLE_CITY,
    MAP_ID_RUSTBORO_CITY,
    MAP_ID_FORTREE_CITY,
    MAP_ID_LILYCOVE_CITY,
    MAP_ID_MOSSDEEP_CITY,
    MAP_ID_SOOTOPOLIS_CITY,
    MAP_ID_EVER_GRANDE_CITY,
    MAP_ID_LITTLEROOT_TOWN,
    MAP_ID_OLDALE_TOWN,
    MAP_ID_DEWFORD_TOWN,
    MAP_ID_LAVARIDGE_TOWN,
    MAP_ID_FALLARBOR_TOWN,
    MAP_ID_VERDANTURF_TOWN,
    MAP_ID_PACIFIDLOG_TOWN,
    MAP_ID_ROUTE101,
    MAP_ID_ROUTE102,
    MAP_ID_ROUTE103,
    MAP_ID_ROUTE104,
    MAP_ID_ROUTE105,
    MAP_ID_ROUTE106,
    MAP_ID_ROUTE107,
    MAP_ID_ROUTE108,
    MAP_ID_ROUTE109,
    MAP_ID_ROUTE110,
    MAP_ID_ROUTE111,
    MAP_ID_ROUTE112,
    MAP_ID_ROUTE113,
    MAP_ID_ROUTE114,
    MAP_ID_ROUTE115,
    MAP_ID_ROUTE116,
    MAP_ID_ROUTE117,
    MAP_ID_ROUTE118,
    MAP_ID_ROUTE119,
    MAP_ID_ROUTE120,
    MAP_ID_ROUTE121,
    MAP_ID_ROUTE122,
    MAP_ID_ROUTE123,
    MAP_ID_ROUTE124,
    MAP_ID_ROUTE125,
    MAP_ID_ROUTE126,
    MAP_ID_ROUTE127,
    MAP_ID_ROUTE128,
    MAP_ID_ROUTE129,
    MAP_ID_ROUTE130,
    MAP_ID_ROUTE131,
    MAP_ID_ROUTE132,
    MAP_ID_ROUTE133,
    MAP_ID_ROUTE134,
    MAP_ID_UNDERWATER1,
    MAP_ID_UNDERWATER2,
    MAP_ID_UNDERWATER3,
    MAP_ID_UNDERWATER4,
};
# 125 "include/map_constants.h"
enum
{
    MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_1F,
    MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F,
    MAP_ID_LITTLEROOT_TOWN_MAYS_HOUSE_1F,
    MAP_ID_LITTLEROOT_TOWN_MAYS_HOUSE_2F,
    MAP_ID_LITTLEROOT_TOWN_PROFESSOR_BIRCHS_LAB,
};
# 144 "include/map_constants.h"
enum
{
    MAP_ID_OLDALE_TOWN_HOUSE1,
    MAP_ID_OLDALE_TOWN_HOUSE2,
    MAP_ID_OLDALE_TOWN_POKEMON_CENTER_1F,
    MAP_ID_OLDALE_TOWN_POKEMON_CENTER_2F,
    MAP_ID_OLDALE_TOWN_MART,
};
# 163 "include/map_constants.h"
enum
{
    MAP_ID_DEWFORD_TOWN_HOUSE1,
    MAP_ID_DEWFORD_TOWN_POKEMON_CENTER_1F,
    MAP_ID_DEWFORD_TOWN_POKEMON_CENTER_2F,
    MAP_ID_DEWFORD_TOWN_GYM,
    MAP_ID_DEWFORD_TOWN_HALL,
    MAP_ID_DEWFORD_TOWN_HOUSE2,
};
# 184 "include/map_constants.h"
enum
{
    MAP_ID_LAVARIDGE_TOWN_HERB_SHOP,
    MAP_ID_LAVARIDGE_TOWN_GYM_1F,
    MAP_ID_LAVARIDGE_TOWN_GYM_B1F,
    MAP_ID_LAVARIDGE_TOWN_HOUSE,
    MAP_ID_LAVARIDGE_TOWN_MART,
    MAP_ID_LAVARIDGE_TOWN_POKEMON_CENTER_1F,
    MAP_ID_LAVARIDGE_TOWN_POKEMON_CENTER_2F,
};
# 207 "include/map_constants.h"
enum
{
    MAP_ID_FALLARBOR_TOWN_MART,
    MAP_ID_FALLARBOR_TOWN_CONTEST_LOBBY,
    MAP_ID_FALLARBOR_TOWN_CONTEST_HALL,
    MAP_ID_FALLARBOR_TOWN_POKEMON_CENTER_1F,
    MAP_ID_FALLARBOR_TOWN_POKEMON_CENTER_2F,
    MAP_ID_FALLARBOR_TOWN_HOUSE1,
    MAP_ID_FALLARBOR_TOWN_HOUSE2,
};
# 230 "include/map_constants.h"
enum
{
    MAP_ID_VERDANTURF_TOWN_CONTEST_LOBBY,
    MAP_ID_VERDANTURF_TOWN_CONTEST_HALL,
    MAP_ID_VERDANTURF_TOWN_MART,
    MAP_ID_VERDANTURF_TOWN_POKEMON_CENTER_1F,
    MAP_ID_VERDANTURF_TOWN_POKEMON_CENTER_2F,
    MAP_ID_VERDANTURF_TOWN_WANDAS_HOUSE,
    MAP_ID_VERDANTURF_TOWN_FRIENDSHIP_RATERS_HOUSE,
    MAP_ID_VERDANTURF_TOWN_HOUSE,
};
# 255 "include/map_constants.h"
enum
{
    MAP_ID_PACIFIDLOG_TOWN_POKEMON_CENTER_1F,
    MAP_ID_PACIFIDLOG_TOWN_POKEMON_CENTER_2F,
    MAP_ID_PACIFIDLOG_TOWN_HOUSE1,
    MAP_ID_PACIFIDLOG_TOWN_HOUSE2,
    MAP_ID_PACIFIDLOG_TOWN_HOUSE3,
    MAP_ID_PACIFIDLOG_TOWN_HOUSE4,
    MAP_ID_PACIFIDLOG_TOWN_HOUSE5,
};
# 278 "include/map_constants.h"
enum
{
    MAP_ID_PETALBURG_CITY_WALLYS_HOUSE,
    MAP_ID_PETALBURG_CITY_GYM,
    MAP_ID_PETALBURG_CITY_HOUSE1,
    MAP_ID_PETALBURG_CITY_HOUSE2,
    MAP_ID_PETALBURG_CITY_POKEMON_CENTER_1F,
    MAP_ID_PETALBURG_CITY_POKEMON_CENTER_2F,
    MAP_ID_PETALBURG_CITY_MART,
};
# 301 "include/map_constants.h"
enum
{
    MAP_ID_SLATEPORT_CITY_STERNS_SHIPYARD_1F,
    MAP_ID_SLATEPORT_CITY_STERNS_SHIPYARD_2F,
    MAP_ID_SLATEPORT_CITY_CONTEST_LOBBY,
    MAP_ID_SLATEPORT_CITY_CONTEST_HALL,
    MAP_ID_SLATEPORT_CITY_HOUSE1,
    MAP_ID_SLATEPORT_CITY_POKEMON_FAN_CLUB,
    MAP_ID_SLATEPORT_CITY_OCEANIC_MUSEUM_1F,
    MAP_ID_SLATEPORT_CITY_OCEANIC_MUSEUM_2F,
    MAP_ID_SLATEPORT_CITY_HARBOR,
    MAP_ID_SLATEPORT_CITY_HOUSE2,
    MAP_ID_SLATEPORT_CITY_POKEMON_CENTER_1F,
    MAP_ID_SLATEPORT_CITY_POKEMON_CENTER_2F,
    MAP_ID_SLATEPORT_CITY_MART,
};
# 336 "include/map_constants.h"
enum
{
    MAP_ID_MAUVILLE_CITY_GYM,
    MAP_ID_MAUVILLE_CITY_BIKE_SHOP,
    MAP_ID_MAUVILLE_CITY_HOUSE1,
    MAP_ID_MAUVILLE_CITY_GAME_CORNER,
    MAP_ID_MAUVILLE_CITY_HOUSE2,
    MAP_ID_MAUVILLE_CITY_POKEMON_CENTER_1F,
    MAP_ID_MAUVILLE_CITY_POKEMON_CENTER_2F,
    MAP_ID_MAUVILLE_CITY_MART,
};
# 361 "include/map_constants.h"
enum
{
    MAP_ID_RUSTBORO_CITY_DEVON_CORP_1F,
    MAP_ID_RUSTBORO_CITY_DEVON_CORP_2F,
    MAP_ID_RUSTBORO_CITY_DEVON_CORP_3F,
    MAP_ID_RUSTBORO_CITY_GYM,
    MAP_ID_RUSTBORO_CITY_POKEMON_SCHOOL,
    MAP_ID_RUSTBORO_CITY_POKEMON_CENTER_1F,
    MAP_ID_RUSTBORO_CITY_POKEMON_CENTER_2F,
    MAP_ID_RUSTBORO_CITY_MART,
    MAP_ID_RUSTBORO_CITY_FLAT1_1F,
    MAP_ID_RUSTBORO_CITY_FLAT1_2F,
    MAP_ID_RUSTBORO_CITY_HOUSE1,
    MAP_ID_RUSTBORO_CITY_CUTTERS_HOUSE,
    MAP_ID_RUSTBORO_CITY_HOUSE2,
    MAP_ID_RUSTBORO_CITY_FLAT2_1F,
    MAP_ID_RUSTBORO_CITY_FLAT2_2F,
    MAP_ID_RUSTBORO_CITY_FLAT2_3F,
    MAP_ID_RUSTBORO_CITY_HOUSE3,
};
# 404 "include/map_constants.h"
enum
{
    MAP_ID_FORTREE_CITY_HOUSE1,
    MAP_ID_FORTREE_CITY_GYM,
    MAP_ID_FORTREE_CITY_POKEMON_CENTER_1F,
    MAP_ID_FORTREE_CITY_POKEMON_CENTER_2F,
    MAP_ID_FORTREE_CITY_MART,
    MAP_ID_FORTREE_CITY_HOUSE2,
    MAP_ID_FORTREE_CITY_HOUSE3,
    MAP_ID_FORTREE_CITY_HOUSE4,
    MAP_ID_FORTREE_CITY_HOUSE5,
    MAP_ID_FORTREE_CITY_DECORATION_SHOP,
};
# 433 "include/map_constants.h"
enum
{
    MAP_ID_LILYCOVE_CITY_COVE_LILY_MOTEL_1F,
    MAP_ID_LILYCOVE_CITY_COVE_LILY_MOTEL_2F,
    MAP_ID_LILYCOVE_CITY_LILYCOVE_MUSEUM_1F,
    MAP_ID_LILYCOVE_CITY_LILYCOVE_MUSEUM_2F,
    MAP_ID_LILYCOVE_CITY_CONTEST_LOBBY,
    MAP_ID_LILYCOVE_CITY_CONTEST_HALL,
    MAP_ID_LILYCOVE_CITY_POKEMON_CENTER_1F,
    MAP_ID_LILYCOVE_CITY_POKEMON_CENTER_2F,
    MAP_ID_LILYCOVE_CITY_UNUSED_MART,
    MAP_ID_LILYCOVE_CITY_POKEMON_TRAINER_FAN_CLUB,
    MAP_ID_LILYCOVE_CITY_HARBOR,
    MAP_ID_LILYCOVE_CITY_EMPTY_MAP,
    MAP_ID_LILYCOVE_CITY_MOVE_DELETERS_HOUSE,
    MAP_ID_LILYCOVE_CITY_HOUSE1,
    MAP_ID_LILYCOVE_CITY_HOUSE2,
    MAP_ID_LILYCOVE_CITY_HOUSE3,
    MAP_ID_LILYCOVE_CITY_HOUSE4,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_1F,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_2F,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_3F,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_4F,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_5F,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP,
    MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_ELEVATOR,
};
# 490 "include/map_constants.h"
enum
{
    MAP_ID_MOSSDEEP_CITY_GYM,
    MAP_ID_MOSSDEEP_CITY_HOUSE1,
    MAP_ID_MOSSDEEP_CITY_HOUSE2,
    MAP_ID_MOSSDEEP_CITY_POKEMON_CENTER_1F,
    MAP_ID_MOSSDEEP_CITY_POKEMON_CENTER_2F,
    MAP_ID_MOSSDEEP_CITY_MART,
    MAP_ID_MOSSDEEP_CITY_HOUSE3,
    MAP_ID_MOSSDEEP_CITY_STEVENS_HOUSE,
    MAP_ID_MOSSDEEP_CITY_HOUSE4,
    MAP_ID_MOSSDEEP_CITY_SPACE_CENTER_1F,
    MAP_ID_MOSSDEEP_CITY_SPACE_CENTER_2F,
    MAP_ID_MOSSDEEP_CITY_GAME_CORNER_1F,
    MAP_ID_MOSSDEEP_CITY_GAME_CORNER_B1F,
};
# 525 "include/map_constants.h"
enum
{
    MAP_ID_SOOTOPOLIS_CITY_GYM_1F,
    MAP_ID_SOOTOPOLIS_CITY_GYM_B1F,
    MAP_ID_SOOTOPOLIS_CITY_POKEMON_CENTER_1F,
    MAP_ID_SOOTOPOLIS_CITY_POKEMON_CENTER_2F,
    MAP_ID_SOOTOPOLIS_CITY_MART,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE1,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE2,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE3,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE4,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE5,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE6,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE7,
    MAP_ID_SOOTOPOLIS_CITY_HOUSE8,
};
# 560 "include/map_constants.h"
enum
{
    MAP_ID_EVER_GRANDE_CITY_SIDNEYS_ROOM,
    MAP_ID_EVER_GRANDE_CITY_PHOEBES_ROOM,
    MAP_ID_EVER_GRANDE_CITY_GLACIAS_ROOM,
    MAP_ID_EVER_GRANDE_CITY_DRAKES_ROOM,
    MAP_ID_EVER_GRANDE_CITY_CHAMPIONS_ROOM,
    MAP_ID_EVER_GRANDE_CITY_CORRIDOR1,
    MAP_ID_EVER_GRANDE_CITY_CORRIDOR2,
    MAP_ID_EVER_GRANDE_CITY_CORRIDOR3,
    MAP_ID_EVER_GRANDE_CITY_CORRIDOR4,
    MAP_ID_EVER_GRANDE_CITY_CORRIDOR5,
    MAP_ID_EVER_GRANDE_CITY_POKEMON_LEAGUE,
    MAP_ID_EVER_GRANDE_CITY_HALL_OF_FAME,
    MAP_ID_EVER_GRANDE_CITY_POKEMON_CENTER_1F,
    MAP_ID_EVER_GRANDE_CITY_POKEMON_CENTER_2F,
};
# 597 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE104_MR_BRINEYS_HOUSE,
    MAP_ID_ROUTE104_PRETTY_PETAL_FLOWER_SHOP,
};
# 610 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE111_WINSTRATE_FAMILYS_HOUSE,
    MAP_ID_ROUTE111_OLD_LADYS_REST_STOP,
};
# 623 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE112_CABLE_CAR_STATION,
    MAP_ID_MT_CHIMNEY_CABLE_CAR_STATION,
};
# 636 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE114_FOSSIL_MANIACS_HOUSE,
    MAP_ID_ROUTE114_FOSSIL_MANIACS_TUNNEL,
    MAP_ID_ROUTE114_LANETTES_HOUSE,
};
# 651 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE116_TUNNELERS_REST_HOUSE,
};







enum
{
    MAP_ID_ROUTE117_POKEMON_DAY_CARE,
};







enum
{
    MAP_ID_ROUTE121_SAFARI_ZONE_ENTRANCE,
};







enum
{
    MAP_ID_METEOR_FALLS_1F_1R,
    MAP_ID_METEOR_FALLS_1F_2R,
    MAP_ID_METEOR_FALLS_B1F_1R,
    MAP_ID_METEOR_FALLS_B1F_2R,
    MAP_ID_RUSTURF_TUNNEL,
    MAP_ID_UNDERWATER_SOOTOPOLIS_CITY,
    MAP_ID_DESERT_RUINS,
    MAP_ID_GRANITE_CAVE_1F,
    MAP_ID_GRANITE_CAVE_B1F,
    MAP_ID_GRANITE_CAVE_B2F,
    MAP_ID_GRANITE_CAVE_STEVENS_ROOM,
    MAP_ID_PETALBURG_WOODS,
    MAP_ID_MT_CHIMNEY,
    MAP_ID_JAGGED_PASS,
    MAP_ID_FIERY_PATH,
    MAP_ID_MT_PYRE_1F,
    MAP_ID_MT_PYRE_2F,
    MAP_ID_MT_PYRE_3F,
    MAP_ID_MT_PYRE_4F,
    MAP_ID_MT_PYRE_5F,
    MAP_ID_MT_PYRE_6F,
    MAP_ID_MT_PYRE_EXTERIOR,
    MAP_ID_MT_PYRE_SUMMIT,
    MAP_ID_AQUA_HIDEOUT_1F,
    MAP_ID_AQUA_HIDEOUT_B1F,
    MAP_ID_AQUA_HIDEOUT_B2F,
    MAP_ID_UNDERWATER_SEAFLOOR_CAVERN,
    MAP_ID_SEAFLOOR_CAVERN_ENTRANCE,
    MAP_ID_SEAFLOOR_CAVERN_ROOM1,
    MAP_ID_SEAFLOOR_CAVERN_ROOM2,
    MAP_ID_SEAFLOOR_CAVERN_ROOM3,
    MAP_ID_SEAFLOOR_CAVERN_ROOM4,
    MAP_ID_SEAFLOOR_CAVERN_ROOM5,
    MAP_ID_SEAFLOOR_CAVERN_ROOM6,
    MAP_ID_SEAFLOOR_CAVERN_ROOM7,
    MAP_ID_SEAFLOOR_CAVERN_ROOM8,
    MAP_ID_SEAFLOOR_CAVERN_ROOM9,
    MAP_ID_CAVE_OF_ORIGIN_ENTRANCE,
    MAP_ID_CAVE_OF_ORIGIN_1F,
    MAP_ID_CAVE_OF_ORIGIN_B1F,
    MAP_ID_CAVE_OF_ORIGIN_B2F,
    MAP_ID_CAVE_OF_ORIGIN_B3F,
    MAP_ID_CAVE_OF_ORIGIN_B4F,
    MAP_ID_VICTORY_ROAD_1F,
    MAP_ID_VICTORY_ROAD_B1F,
    MAP_ID_VICTORY_ROAD_B2F,
    MAP_ID_SHOAL_CAVE_LOW_TIDE_ENTRANCE_ROOM,
    MAP_ID_SHOAL_CAVE_LOW_TIDE_INNER_ROOM,
    MAP_ID_SHOAL_CAVE_LOW_TIDE_STAIRS_ROOM,
    MAP_ID_SHOAL_CAVE_LOW_TIDE_LOWER_ROOM,
    MAP_ID_SHOAL_CAVE_HIGH_TIDE_ENTRANCE_ROOM,
    MAP_ID_SHOAL_CAVE_HIGH_TIDE_INNER_ROOM,
    MAP_ID_NEW_MAUVILLE_ENTRANCE,
    MAP_ID_NEW_MAUVILLE_INSIDE,
    MAP_ID_ABANDONED_SHIP_DECK,
    MAP_ID_ABANDONED_SHIP_CORRIDORS_1F,
    MAP_ID_ABANDONED_SHIP_ROOMS_1F,
    MAP_ID_ABANDONED_SHIP_CORRIDORS_B1F,
    MAP_ID_ABANDONED_SHIP_ROOMS_B1F,
    MAP_ID_ABANDONED_SHIP_ROOMS2_B1F,
    MAP_ID_ABANDONED_SHIP_UNDERWATER1,
    MAP_ID_ABANDONED_SHIP_ROOM_B1F,
    MAP_ID_ABANDONED_SHIP_ROOMS2_1F,
    MAP_ID_ABANDONED_SHIP_CAPTAINS_OFFICE,
    MAP_ID_ABANDONED_SHIP_UNDERWATER2,
    MAP_ID_ABANDONED_SHIP_HIDDEN_FLOOR_CORRIDORS,
    MAP_ID_ABANDONED_SHIP_HIDDEN_FLOOR_ROOMS,
    MAP_ID_ISLAND_CAVE,
    MAP_ID_ANCIENT_TOMB,
    MAP_ID_UNDERWATER_ROUTE134,
    MAP_ID_UNDERWATER_SEALED_CHAMBER,
    MAP_ID_SEALED_CHAMBER_OUTER_ROOM,
    MAP_ID_SEALED_CHAMBER_INNER_ROOM,
    MAP_ID_SCORCHED_SLAB,
    MAP_ID_MAGMA_HIDEOUT_1F,
    MAP_ID_MAGMA_HIDEOUT_B1F,
    MAP_ID_MAGMA_HIDEOUT_B2F,
    MAP_ID_SKY_PILLAR_ENTRANCE,
    MAP_ID_SKY_PILLAR_OUTSIDE,
    MAP_ID_SKY_PILLAR_1F,
    MAP_ID_SKY_PILLAR_2F,
    MAP_ID_SKY_PILLAR_3F,
    MAP_ID_SKY_PILLAR_4F,
    MAP_ID_SHOAL_CAVE_LOW_TIDE_ICE_ROOM,
    MAP_ID_SKY_PILLAR_5F,
    MAP_ID_SKY_PILLAR_TOP,
};
# 865 "include/map_constants.h"
enum
{
    MAP_ID_SECRET_BASE_RED_CAVE1,
    MAP_ID_SECRET_BASE_BROWN_CAVE1,
    MAP_ID_SECRET_BASE_BLUE_CAVE1,
    MAP_ID_SECRET_BASE_YELLOW_CAVE1,
    MAP_ID_SECRET_BASE_TREE1,
    MAP_ID_SECRET_BASE_SHRUB1,
    MAP_ID_SECRET_BASE_RED_CAVE2,
    MAP_ID_SECRET_BASE_BROWN_CAVE2,
    MAP_ID_SECRET_BASE_BLUE_CAVE2,
    MAP_ID_SECRET_BASE_YELLOW_CAVE2,
    MAP_ID_SECRET_BASE_TREE2,
    MAP_ID_SECRET_BASE_SHRUB2,
    MAP_ID_SECRET_BASE_RED_CAVE3,
    MAP_ID_SECRET_BASE_BROWN_CAVE3,
    MAP_ID_SECRET_BASE_BLUE_CAVE3,
    MAP_ID_SECRET_BASE_YELLOW_CAVE3,
    MAP_ID_SECRET_BASE_TREE3,
    MAP_ID_SECRET_BASE_SHRUB3,
    MAP_ID_SECRET_BASE_RED_CAVE4,
    MAP_ID_SECRET_BASE_BROWN_CAVE4,
    MAP_ID_SECRET_BASE_BLUE_CAVE4,
    MAP_ID_SECRET_BASE_YELLOW_CAVE4,
    MAP_ID_SECRET_BASE_TREE4,
    MAP_ID_SECRET_BASE_SHRUB4,
    MAP_ID_SINGLE_BATTLE_COLOSSEUM,
    MAP_ID_TRADE_CENTER,
    MAP_ID_RECORD_CORNER,
    MAP_ID_DOUBLE_BATTLE_COLOSSEUM,
    MAP_ID_LINK_CONTEST_ROOM1,
    MAP_ID_UNKNOWN_MAP_25_29,
    MAP_ID_UNKNOWN_MAP_25_30,
    MAP_ID_UNKNOWN_MAP_25_31,
    MAP_ID_UNKNOWN_MAP_25_32,
    MAP_ID_UNKNOWN_MAP_25_33,
    MAP_ID_UNKNOWN_MAP_25_34,
    MAP_ID_LINK_CONTEST_ROOM2,
    MAP_ID_LINK_CONTEST_ROOM3,
    MAP_ID_LINK_CONTEST_ROOM4,
    MAP_ID_LINK_CONTEST_ROOM5,
    MAP_ID_LINK_CONTEST_ROOM6,
    MAP_ID_INSIDE_OF_TRUCK,
    MAP_ID_SS_TIDAL_CORRIDOR,
    MAP_ID_SS_TIDAL_LOWER_DECK,
    MAP_ID_SS_TIDAL_ROOMS,
};
# 962 "include/map_constants.h"
enum
{
    MAP_ID_SAFARI_ZONE_NORTHWEST,
    MAP_ID_SAFARI_ZONE_NORTHEAST,
    MAP_ID_SAFARI_ZONE_SOUTHWEST,
    MAP_ID_SAFARI_ZONE_SOUTHEAST,
    MAP_ID_BATTLE_TOWER_OUTSIDE,
    MAP_ID_BATTLE_TOWER_LOBBY,
    MAP_ID_BATTLE_TOWER_ELEVATOR,
    MAP_ID_BATTLE_TOWER_CORRIDOR,
    MAP_ID_BATTLE_TOWER_BATTLE_ROOM,
    MAP_ID_SOUTHERN_ISLAND_EXTERIOR,
    MAP_ID_SOUTHERN_ISLAND_INTERIOR,
    MAP_ID_SAFARI_ZONE_REST_HOUSE,
};
# 995 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE104_PROTOTYPE,
    MAP_ID_ROUTE104_PROTOTYPE_PRETTY_PETAL_FLOWER_SHOP,
};
# 1008 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE109_SEASHORE_HOUSE,
};







enum
{
    MAP_ID_ROUTE110_TRICK_HOUSE_ENTRANCE,
    MAP_ID_ROUTE110_TRICK_HOUSE_END,
    MAP_ID_ROUTE110_TRICK_HOUSE_CORRIDOR,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE1,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE2,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE3,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE4,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE5,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE6,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE7,
    MAP_ID_ROUTE110_TRICK_HOUSE_PUZZLE8,
    MAP_ID_ROUTE110_SEASIDE_CYCLING_ROAD_SOUTH_ENTRANCE,
    MAP_ID_ROUTE110_SEASIDE_CYCLING_ROAD_NORTH_ENTRANCE,
};
# 1054 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE113_GLASS_WORKSHOP,
};







enum
{
    MAP_ID_ROUTE123_BERRY_MASTERS_HOUSE,
};







enum
{
    MAP_ID_ROUTE119_WEATHER_INSTITUTE_1F,
    MAP_ID_ROUTE119_WEATHER_INSTITUTE_2F,
    MAP_ID_ROUTE119_HOUSE,
};
# 1091 "include/map_constants.h"
enum
{
    MAP_ID_ROUTE124_DIVING_TREASURE_HUNTERS_HOUSE,
};
# 18 "src/field/field_map_obj.c" 2
# 1 "include/map_object_constants.h" 1



enum
{
    MAP_OBJ_GFX_BRENDAN_NORMAL,
    MAP_OBJ_GFX_BRENDAN_MACH_BIKE,
    MAP_OBJ_GFX_BRENDAN_SURFING,
    MAP_OBJ_GFX_BRENDAN_FIELD_MOVE,
    MAP_OBJ_GFX_QUINTY_PLUMP,
    MAP_OBJ_GFX_LITTLE_BOY_1,
    MAP_OBJ_GFX_LITTLE_GIRL_1,
    MAP_OBJ_GFX_BOY_1,
    MAP_OBJ_GFX_GIRL_1,
    MAP_OBJ_GFX_BOY_2,
    MAP_OBJ_GFX_GIRL_2,
    MAP_OBJ_GFX_LITTLE_BOY_2,
    MAP_OBJ_GFX_LITTLE_GIRL_2,
    MAP_OBJ_GFX_BOY_3,
    MAP_OBJ_GFX_GIRL_3,
    MAP_OBJ_GFX_BOY_4,
    MAP_OBJ_GFX_WOMAN_1,
    MAP_OBJ_GFX_FAT_MAN,
    MAP_OBJ_GFX_WOMAN_2,
    MAP_OBJ_GFX_MAN_1,
    MAP_OBJ_GFX_WOMAN_3,
    MAP_OBJ_GFX_OLD_MAN_1,
    MAP_OBJ_GFX_OLD_WOMAN_1,
    MAP_OBJ_GFX_MAN_2,
    MAP_OBJ_GFX_WOMAN_4,
    MAP_OBJ_GFX_MAN_3,
    MAP_OBJ_GFX_WOMAN_5,
    MAP_OBJ_GFX_COOK,
    MAP_OBJ_GFX_WOMAN_6,
    MAP_OBJ_GFX_OLD_MAN_2,
    MAP_OBJ_GFX_OLD_WOMAN_2,
    MAP_OBJ_GFX_CAMPER,
    MAP_OBJ_GFX_PICNICKER,
    MAP_OBJ_GFX_MAN_4,
    MAP_OBJ_GFX_WOMAN_7,
    MAP_OBJ_GFX_YOUNGSTER,
    MAP_OBJ_GFX_BUG_CATCHER,
    MAP_OBJ_GFX_PSYCHIC_M,
    MAP_OBJ_GFX_SCHOOL_KID_M,
    MAP_OBJ_GFX_MANIAC,
    MAP_OBJ_GFX_HEX_MANIAC,
    MAP_OBJ_GFX_WOMAN_8,
    MAP_OBJ_GFX_SWIMMER_M,
    MAP_OBJ_GFX_SWIMMER_F,
    MAP_OBJ_GFX_BLACK_BELT,
    MAP_OBJ_GFX_BEAUTY,
    MAP_OBJ_GFX_SCIENTIST_1,
    MAP_OBJ_GFX_LASS,
    MAP_OBJ_GFX_GENTLEMAN,
    MAP_OBJ_GFX_SAILOR,
    MAP_OBJ_GFX_FISHERMAN,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_M,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_F,
    MAP_OBJ_GFX_TUBER_F,
    MAP_OBJ_GFX_TUBER_M,
    MAP_OBJ_GFX_HIKER,
    MAP_OBJ_GFX_CYCLING_TRIATHLETE_M,
    MAP_OBJ_GFX_CYCLING_TRIATHLETE_F,
    MAP_OBJ_GFX_NURSE,
    MAP_OBJ_GFX_ITEM_BALL,
    MAP_OBJ_GFX_BERRY_TREE,
    MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES,
    MAP_OBJ_GFX_BERRY_TREE_LATE_STAGES,
    MAP_OBJ_GFX_BRENDAN_ACRO_BIKE,
    MAP_OBJ_GFX_PROF_BIRCH,
    MAP_OBJ_GFX_MAN_5,
    MAP_OBJ_GFX_MAN_6,
    MAP_OBJ_GFX_REPORTER_M,
    MAP_OBJ_GFX_REPORTER_F,
    MAP_OBJ_GFX_BARD,
    MAP_OBJ_GFX_HIPSTER,
    MAP_OBJ_GFX_TRADER,
    MAP_OBJ_GFX_STORYTELLER,
    MAP_OBJ_GFX_GIDDY,
    MAP_OBJ_GFX_UNUSED_MAUVILLE_OLD_MAN_1,
    MAP_OBJ_GFX_UNUSED_MAUVILLE_OLD_MAN_2,
    MAP_OBJ_GFX_UNUSED_NATU_DOLL,
    MAP_OBJ_GFX_UNUSED_MAGNEMITE_DOLL,
    MAP_OBJ_GFX_UNUSED_SQUIRTLE_DOLL,
    MAP_OBJ_GFX_UNUSED_WOOPER_DOLL,
    MAP_OBJ_GFX_UNUSED_PIKACHU_DOLL,
    MAP_OBJ_GFX_UNUSED_PORYGON2_DOLL,
    MAP_OBJ_GFX_CUTTABLE_TREE,
    MAP_OBJ_GFX_MART_EMPLOYEE,
    MAP_OBJ_GFX_ROOFTOP_SALE_WOMAN,
    MAP_OBJ_GFX_TEALA,
    MAP_OBJ_GFX_BREAKABLE_ROCK,
    MAP_OBJ_GFX_PUSHABLE_BOULDER,
    MAP_OBJ_GFX_MR_BRINEYS_BOAT,
    MAP_OBJ_GFX_MAY_NORMAL,
    MAP_OBJ_GFX_MAY_MACH_BIKE,
    MAP_OBJ_GFX_MAY_ACRO_BIKE,
    MAP_OBJ_GFX_MAY_SURFING,
    MAP_OBJ_GFX_MAY_FIELD_MOVE,
    MAP_OBJ_GFX_TRUCK,
    MAP_OBJ_GFX_MACHOKE_CARRYING_BOX,
    MAP_OBJ_GFX_MACHOKE_FACING_AWAY,
    MAP_OBJ_GFX_BIRCHS_BAG,
    MAP_OBJ_GFX_POOCHYENA,
    MAP_OBJ_GFX_ARTIST,
    MAP_OBJ_GFX_RIVAL_BRENDAN_NORMAL,
    MAP_OBJ_GFX_RIVAL_BRENDAN_MACH_BIKE,
    MAP_OBJ_GFX_RIVAL_BRENDAN_ACRO_BIKE,
    MAP_OBJ_GFX_RIVAL_BRENDAN_SURFING,
    MAP_OBJ_GFX_RIVAL_BRENDAN_FIELD_MOVE,
    MAP_OBJ_GFX_RIVAL_MAY_NORMAL,
    MAP_OBJ_GFX_RIVAL_MAY_MACH_BIKE,
    MAP_OBJ_GFX_RIVAL_MAY_ACRO_BIKE,
    MAP_OBJ_GFX_RIVAL_MAY_SURFING,
    MAP_OBJ_GFX_RIVAL_MAY_FIELD_MOVE,
    MAP_OBJ_GFX_CAMERAMAN,
    MAP_OBJ_GFX_BRENDAN_UNDERWATER,
    MAP_OBJ_GFX_MAY_UNDERWATER,
    MAP_OBJ_GFX_MOVING_BOX,
    MAP_OBJ_GFX_CABLE_CAR,
    MAP_OBJ_GFX_SCIENTIST_2,
    MAP_OBJ_GFX_MAN_7,
    MAP_OBJ_GFX_AQUA_MEMBER_M,
    MAP_OBJ_GFX_AQUA_MEMBER_F,
    MAP_OBJ_GFX_MAGMA_MEMBER_M,
    MAP_OBJ_GFX_MAGMA_MEMBER_F,
    MAP_OBJ_GFX_SIDNEY,
    MAP_OBJ_GFX_PHOEBE,
    MAP_OBJ_GFX_GLACIA,
    MAP_OBJ_GFX_DRAKE,
    MAP_OBJ_GFX_ROXANNE,
    MAP_OBJ_GFX_BRAWLY,
    MAP_OBJ_GFX_WATTSON,
    MAP_OBJ_GFX_FLANNERY,
    MAP_OBJ_GFX_NORMAN,
    MAP_OBJ_GFX_WINONA,
    MAP_OBJ_GFX_LIZA,
    MAP_OBJ_GFX_TATE,
    MAP_OBJ_GFX_WALLACE,
    MAP_OBJ_GFX_STEVEN,
    MAP_OBJ_GFX_WALLY,
    MAP_OBJ_GFX_LITTLE_BOY_3,
    MAP_OBJ_GFX_BRENDAN_FISHING,
    MAP_OBJ_GFX_MAY_FISHING,
    MAP_OBJ_GFX_HOT_SPRINGS_OLD_WOMAN,
    MAP_OBJ_GFX_SS_TIDAL,
    MAP_OBJ_GFX_SUBMARINE_SHADOW,
    MAP_OBJ_GFX_PICHU_DOLL,
    MAP_OBJ_GFX_PIKACHU_DOLL,
    MAP_OBJ_GFX_MARILL_DOLL,
    MAP_OBJ_GFX_TOGEPI_DOLL,
    MAP_OBJ_GFX_CYNDAQUIL_DOLL,
    MAP_OBJ_GFX_CHIKORITA_DOLL,
    MAP_OBJ_GFX_TOTODILE_DOLL,
    MAP_OBJ_GFX_JIGGLYPUFF_DOLL,
    MAP_OBJ_GFX_MEOWTH_DOLL,
    MAP_OBJ_GFX_CLEFAIRY_DOLL,
    MAP_OBJ_GFX_DITTO_DOLL,
    MAP_OBJ_GFX_SMOOCHUM_DOLL,
    MAP_OBJ_GFX_TREECKO_DOLL,
    MAP_OBJ_GFX_TORCHIC_DOLL,
    MAP_OBJ_GFX_MUDKIP_DOLL,
    MAP_OBJ_GFX_DUSKULL_DOLL,
    MAP_OBJ_GFX_WYNAUT_DOLL,
    MAP_OBJ_GFX_BALTOY_DOLL,
    MAP_OBJ_GFX_KECLEON_DOLL,
    MAP_OBJ_GFX_AZURILL_DOLL,
    MAP_OBJ_GFX_SKITTY_DOLL,
    MAP_OBJ_GFX_SWABLU_DOLL,
    MAP_OBJ_GFX_GULPIN_DOLL,
    MAP_OBJ_GFX_LOTAD_DOLL,
    MAP_OBJ_GFX_SEEDOT_DOLL,
    MAP_OBJ_GFX_PIKA_CUSHION,
    MAP_OBJ_GFX_ROUND_CUSHION,
    MAP_OBJ_GFX_KISS_CUSHION,
    MAP_OBJ_GFX_ZIGZAG_CUSHION,
    MAP_OBJ_GFX_SPIN_CUSHION,
    MAP_OBJ_GFX_DIAMOND_CUSHION,
    MAP_OBJ_GFX_BALL_CUSHION,
    MAP_OBJ_GFX_GRASS_CUSHION,
    MAP_OBJ_GFX_FIRE_CUSHION,
    MAP_OBJ_GFX_WATER_CUSHION,
    MAP_OBJ_GFX_BIG_SNORLAX_DOLL,
    MAP_OBJ_GFX_BIG_RHYDON_DOLL,
    MAP_OBJ_GFX_BIG_LAPRAS_DOLL,
    MAP_OBJ_GFX_BIG_VENUSAUR_DOLL,
    MAP_OBJ_GFX_BIG_CHARIZARD_DOLL,
    MAP_OBJ_GFX_BIG_BLASTOISE_DOLL,
    MAP_OBJ_GFX_BIG_WAILMER_DOLL,
    MAP_OBJ_GFX_BIG_REGIROCK_DOLL,
    MAP_OBJ_GFX_BIG_REGICE_DOLL,
    MAP_OBJ_GFX_BIG_REGISTEEL_DOLL,
    MAP_OBJ_GFX_LATIAS,
    MAP_OBJ_GFX_LATIOS,
    MAP_OBJ_GFX_BOY_5,
    MAP_OBJ_GFX_CONTEST_JUDGE,
    MAP_OBJ_GFX_BRENDAN_WATERING,
    MAP_OBJ_GFX_MAY_WATERING,
    MAP_OBJ_GFX_BRENDAN_DECORATING,
    MAP_OBJ_GFX_MAY_DECORATING,
    MAP_OBJ_GFX_ARCHIE,
    MAP_OBJ_GFX_MAXIE,
    MAP_OBJ_GFX_KYOGRE_1,
    MAP_OBJ_GFX_GROUDON_1,
    MAP_OBJ_GFX_FOSSIL,
    MAP_OBJ_GFX_REGIROCK,
    MAP_OBJ_GFX_REGICE,
    MAP_OBJ_GFX_REGISTEEL,
    MAP_OBJ_GFX_SKITTY,
    MAP_OBJ_GFX_KECLEON_1,
    MAP_OBJ_GFX_KYOGRE_2,
    MAP_OBJ_GFX_GROUDON_2,
    MAP_OBJ_GFX_RAYQUAZA,
    MAP_OBJ_GFX_ZIGZAGOON,
    MAP_OBJ_GFX_PIKACHU,
    MAP_OBJ_GFX_AZUMARILL,
    MAP_OBJ_GFX_WINGULL,
    MAP_OBJ_GFX_KECLEON_2,
    MAP_OBJ_GFX_TUBER_M_SWIMMING,
    MAP_OBJ_GFX_AZURILL,
    MAP_OBJ_GFX_MOM,
    MAP_OBJ_GFX_LINK_BRENDAN,
    MAP_OBJ_GFX_LINK_MAY,
};

enum {
    SHADOW_SIZE_S,
    SHADOW_SIZE_M,
    SHADOW_SIZE_L,
    SHADOW_SIZE_XL
};

enum {
    TRACKS_NONE,
    TRACKS_FOOT,
    TRACKS_BIKE_TIRE
};
# 19 "src/field/field_map_obj.c" 2
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
# 20 "src/field/field_map_obj.c" 2



const u8 gUnknown_0830FD14[] = {1, 1, 6, 7, 8, 9, 6, 7, 8, 9, 11, 11, 0, 0, 0, 0};

void ObjectCB_CameraObject(struct Sprite *sprite);
const struct SpriteTemplate gSpriteTemplate_830FD24 = {0, 0xFFFF, &gDummyOamData, gDummySpriteAnimTable, ((void *)0), gDummySpriteAffineAnimTable, ObjectCB_CameraObject};

void CameraObject_0(struct Sprite *);
void CameraObject_1(struct Sprite *);
void CameraObject_2(struct Sprite *);
void (*const gCameraObjectFuncs[])(struct Sprite *) = {
    CameraObject_0,
    CameraObject_1,
    CameraObject_2,
};

const u32 gMapObjectPic_BrendanNormal_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/00.4bpp");
const u32 gMapObjectPic_BrendanNormal_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/01.4bpp");
const u32 gMapObjectPic_BrendanNormal_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/02.4bpp");
const u32 gMapObjectPic_BrendanNormal_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/03.4bpp");
const u32 gMapObjectPic_BrendanNormal_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/04.4bpp");
const u32 gMapObjectPic_BrendanNormal_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/05.4bpp");
const u32 gMapObjectPic_BrendanNormal_6[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/06.4bpp");
const u32 gMapObjectPic_BrendanNormal_7[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/07.4bpp");
const u32 gMapObjectPic_BrendanNormal_8[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/08.4bpp");
const u32 gMapObjectPic_BrendanNormal_9[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/09.4bpp");
const u32 gMapObjectPic_BrendanNormal_10[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/10.4bpp");
const u32 gMapObjectPic_BrendanNormal_11[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/11.4bpp");
const u32 gMapObjectPic_BrendanNormal_12[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/12.4bpp");
const u32 gMapObjectPic_BrendanNormal_13[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/13.4bpp");
const u32 gMapObjectPic_BrendanNormal_14[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/14.4bpp");
const u32 gMapObjectPic_BrendanNormal_15[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/15.4bpp");
const u32 gMapObjectPic_BrendanNormal_16[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/16.4bpp");
const u32 gMapObjectPic_BrendanNormal_17[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/17.4bpp");
const u16 gMapObjectPalette8[] = INCBIN_U16("graphics/map_objects/palettes/08.gbapal");
const u16 NullPalette_8310F68[16] = {};
const u16 NullPalette_8310F88[16] = {};
const u16 NullPalette_8310FA8[16] = {};
const u16 NullPalette_8310FC8[16] = {};
const u16 NullPalette_8310FE8[16] = {};
const u16 NullPalette_8311008[16] = {};
const u16 NullPalette_8311028[16] = {};
const u16 NullPalette_8311048[16] = {};
const u16 NullPalette_8311068[16] = {};
const u16 NullPalette_8311088[16] = {};
const u16 NullPalette_83110A8[16] = {};
const u16 NullPalette_83110C8[16] = {};
const u16 NullPalette_83110E8[16] = {};
const u16 NullPalette_8311108[16] = {};
const u16 NullPalette_8311128[16] = {};
const u16 gMapObjectPalette9[] = INCBIN_U16("graphics/map_objects/palettes/09.gbapal");
const u16 gMapObjectPalette10[] = INCBIN_U16("graphics/map_objects/palettes/10.gbapal");
const u32 gMapObjectPic_BrendanFieldMove_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/field_move/0.4bpp");
const u32 gMapObjectPic_BrendanFieldMove_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/field_move/1.4bpp");
const u32 gMapObjectPic_BrendanFieldMove_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/field_move/2.4bpp");
const u32 gMapObjectPic_BrendanFieldMove_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/field_move/3.4bpp");
const u32 gMapObjectPic_BrendanFieldMove_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/field_move/4.4bpp");
const u32 gMapObjectPic_BrendanSurfing_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/0.4bpp");
const u32 gMapObjectPic_BrendanSurfing_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/3.4bpp");
const u32 gMapObjectPic_BrendanSurfing_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/1.4bpp");
const u32 gMapObjectPic_BrendanSurfing_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/4.4bpp");
const u32 gMapObjectPic_BrendanSurfing_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/2.4bpp");
const u32 gMapObjectPic_BrendanSurfing_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/5.4bpp");
const u32 gMapObjectPic_BrendanMachBike_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/0.4bpp");
const u32 gMapObjectPic_BrendanMachBike_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/1.4bpp");
const u32 gMapObjectPic_BrendanMachBike_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/2.4bpp");
const u32 gMapObjectPic_BrendanMachBike_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/3.4bpp");
const u32 gMapObjectPic_BrendanMachBike_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/4.4bpp");
const u32 gMapObjectPic_BrendanMachBike_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/5.4bpp");
const u32 gMapObjectPic_BrendanMachBike_6[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/6.4bpp");
const u32 gMapObjectPic_BrendanMachBike_7[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/7.4bpp");
const u32 gMapObjectPic_BrendanMachBike_8[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/8.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/00.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/01.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/02.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/03.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/04.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/05.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_6[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/06.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_7[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/07.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_8[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/08.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_9[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/09.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_10[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/10.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_11[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/11.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_12[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/12.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_13[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/13.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_14[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/14.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_15[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/15.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_16[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/16.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_17[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/17.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_18[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/18.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_19[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/19.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_20[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/20.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_21[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/21.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_22[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/22.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_23[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/23.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_24[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/24.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_25[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/25.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_26[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/26.4bpp");
const u32 gMapObjectPic_BrendanFishing_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/00.4bpp");
const u32 gMapObjectPic_BrendanFishing_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/01.4bpp");
const u32 gMapObjectPic_BrendanFishing_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/02.4bpp");
const u32 gMapObjectPic_BrendanFishing_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/03.4bpp");
const u32 gMapObjectPic_BrendanFishing_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/04.4bpp");
const u32 gMapObjectPic_BrendanFishing_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/05.4bpp");
const u32 gMapObjectPic_BrendanFishing_6[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/06.4bpp");
const u32 gMapObjectPic_BrendanFishing_7[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/07.4bpp");
const u32 gMapObjectPic_BrendanFishing_8[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/08.4bpp");
const u32 gMapObjectPic_BrendanFishing_9[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/09.4bpp");
const u32 gMapObjectPic_BrendanFishing_10[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/10.4bpp");
const u32 gMapObjectPic_BrendanFishing_11[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/11.4bpp");
const u32 gMapObjectPic_BrendanWatering_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/0.4bpp");
const u32 gMapObjectPic_BrendanWatering_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/3.4bpp");
const u32 gMapObjectPic_BrendanWatering_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/1.4bpp");
const u32 gMapObjectPic_BrendanWatering_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/4.4bpp");
const u32 gMapObjectPic_BrendanWatering_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/2.4bpp");
const u32 gMapObjectPic_BrendanWatering_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/5.4bpp");
const u32 gMapObjectPic_BrendanDecorating[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/decorating.4bpp");
const u32 gMapObjectPic_MayDecorating[] = INCBIN_U32("graphics/map_objects/pics/people/may/decorating.4bpp");
const u32 gMapObjectPic_BrendanUnderwater_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/underwater/0.4bpp");
const u32 gMapObjectPic_BrendanUnderwater_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/underwater/1.4bpp");
const u32 gMapObjectPic_BrendanUnderwater_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/underwater/2.4bpp");
const u32 gMapObjectPic_BrendanUnderwater_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/underwater/3.4bpp");
const u32 gMapObjectPic_MayUnderwater_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/underwater/0.4bpp");
const u32 gMapObjectPic_MayUnderwater_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/underwater/1.4bpp");
const u32 gMapObjectPic_MayUnderwater_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/underwater/2.4bpp");
const u32 gMapObjectPic_MayUnderwater_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/underwater/3.4bpp");
const u16 gMapObjectPalette11[] = INCBIN_U16("graphics/map_objects/palettes/11.gbapal");
const u32 gMapObjectPic_MayNormal_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/00.4bpp");
const u32 gMapObjectPic_MayNormal_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/01.4bpp");
const u32 gMapObjectPic_MayNormal_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/02.4bpp");
const u32 gMapObjectPic_MayNormal_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/03.4bpp");
const u32 gMapObjectPic_MayNormal_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/04.4bpp");
const u32 gMapObjectPic_MayNormal_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/05.4bpp");
const u32 gMapObjectPic_MayNormal_6[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/06.4bpp");
const u32 gMapObjectPic_MayNormal_7[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/07.4bpp");
const u32 gMapObjectPic_MayNormal_8[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/08.4bpp");
const u32 gMapObjectPic_MayNormal_9[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/09.4bpp");
const u32 gMapObjectPic_MayNormal_10[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/10.4bpp");
const u32 gMapObjectPic_MayNormal_11[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/11.4bpp");
const u32 gMapObjectPic_MayNormal_12[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/12.4bpp");
const u32 gMapObjectPic_MayNormal_13[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/13.4bpp");
const u32 gMapObjectPic_MayNormal_14[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/14.4bpp");
const u32 gMapObjectPic_MayNormal_15[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/15.4bpp");
const u32 gMapObjectPic_MayNormal_16[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/16.4bpp");
const u32 gMapObjectPic_MayNormal_17[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/17.4bpp");
const u16 gMapObjectPalette17[] = INCBIN_U16("graphics/map_objects/palettes/17.gbapal");
const u16 gMapObjectPalette18[] = INCBIN_U16("graphics/map_objects/palettes/18.gbapal");
const u16 NullPalette_831B7E8[16] = {};
const u16 NullPalette_831B808[16] = {};
const u16 NullPalette_831B828[16] = {};
const u16 NullPalette_831B848[16] = {};
const u16 NullPalette_831B868[16] = {};
const u16 NullPalette_831B888[16] = {};
const u16 NullPalette_831B8A8[16] = {};
const u16 NullPalette_831B8C8[16] = {};
const u16 NullPalette_831B8E8[16] = {};
const u16 NullPalette_831B908[16] = {};
const u16 NullPalette_831B928[16] = {};
const u16 NullPalette_831B948[16] = {};
const u16 NullPalette_831B968[16] = {};
const u16 NullPalette_831B988[16] = {};
const u32 gMapObjectPic_MayMachBike_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/0.4bpp");
const u32 gMapObjectPic_MayMachBike_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/1.4bpp");
const u32 gMapObjectPic_MayMachBike_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/2.4bpp");
const u32 gMapObjectPic_MayMachBike_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/3.4bpp");
const u32 gMapObjectPic_MayMachBike_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/4.4bpp");
const u32 gMapObjectPic_MayMachBike_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/5.4bpp");
const u32 gMapObjectPic_MayMachBike_6[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/6.4bpp");
const u32 gMapObjectPic_MayMachBike_7[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/7.4bpp");
const u32 gMapObjectPic_MayMachBike_8[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/8.4bpp");
const u32 gMapObjectPic_MayAcroBike_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/00.4bpp");
const u32 gMapObjectPic_MayAcroBike_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/01.4bpp");
const u32 gMapObjectPic_MayAcroBike_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/02.4bpp");
const u32 gMapObjectPic_MayAcroBike_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/03.4bpp");
const u32 gMapObjectPic_MayAcroBike_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/04.4bpp");
const u32 gMapObjectPic_MayAcroBike_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/05.4bpp");
const u32 gMapObjectPic_MayAcroBike_6[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/06.4bpp");
const u32 gMapObjectPic_MayAcroBike_7[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/07.4bpp");
const u32 gMapObjectPic_MayAcroBike_8[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/08.4bpp");
const u32 gMapObjectPic_MayAcroBike_9[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/09.4bpp");
const u32 gMapObjectPic_MayAcroBike_10[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/10.4bpp");
const u32 gMapObjectPic_MayAcroBike_11[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/11.4bpp");
const u32 gMapObjectPic_MayAcroBike_12[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/12.4bpp");
const u32 gMapObjectPic_MayAcroBike_13[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/13.4bpp");
const u32 gMapObjectPic_MayAcroBike_14[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/14.4bpp");
const u32 gMapObjectPic_MayAcroBike_15[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/15.4bpp");
const u32 gMapObjectPic_MayAcroBike_16[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/16.4bpp");
const u32 gMapObjectPic_MayAcroBike_17[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/17.4bpp");
const u32 gMapObjectPic_MayAcroBike_18[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/18.4bpp");
const u32 gMapObjectPic_MayAcroBike_19[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/19.4bpp");
const u32 gMapObjectPic_MayAcroBike_20[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/20.4bpp");
const u32 gMapObjectPic_MayAcroBike_21[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/21.4bpp");
const u32 gMapObjectPic_MayAcroBike_22[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/22.4bpp");
const u32 gMapObjectPic_MayAcroBike_23[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/23.4bpp");
const u32 gMapObjectPic_MayAcroBike_24[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/24.4bpp");
const u32 gMapObjectPic_MayAcroBike_25[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/25.4bpp");
const u32 gMapObjectPic_MayAcroBike_26[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/26.4bpp");
const u32 gMapObjectPic_MaySurfing_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/0.4bpp");
const u32 gMapObjectPic_MaySurfing_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/3.4bpp");
const u32 gMapObjectPic_MaySurfing_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/1.4bpp");
const u32 gMapObjectPic_MaySurfing_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/4.4bpp");
const u32 gMapObjectPic_MaySurfing_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/2.4bpp");
const u32 gMapObjectPic_MaySurfing_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/5.4bpp");
const u32 gMapObjectPic_MayFieldMove_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/field_move/0.4bpp");
const u32 gMapObjectPic_MayFieldMove_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/field_move/1.4bpp");
const u32 gMapObjectPic_MayFieldMove_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/field_move/2.4bpp");
const u32 gMapObjectPic_MayFieldMove_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/field_move/3.4bpp");
const u32 gMapObjectPic_MayFieldMove_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/field_move/4.4bpp");
const u32 gMapObjectPic_MayFishing_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/00.4bpp");
const u32 gMapObjectPic_MayFishing_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/01.4bpp");
const u32 gMapObjectPic_MayFishing_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/02.4bpp");
const u32 gMapObjectPic_MayFishing_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/03.4bpp");
const u32 gMapObjectPic_MayFishing_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/04.4bpp");
const u32 gMapObjectPic_MayFishing_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/05.4bpp");
const u32 gMapObjectPic_MayFishing_6[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/06.4bpp");
const u32 gMapObjectPic_MayFishing_7[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/07.4bpp");
const u32 gMapObjectPic_MayFishing_8[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/08.4bpp");
const u32 gMapObjectPic_MayFishing_9[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/09.4bpp");
const u32 gMapObjectPic_MayFishing_10[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/10.4bpp");
const u32 gMapObjectPic_MayFishing_11[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/11.4bpp");
const u32 gMapObjectPic_MayWatering_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/0.4bpp");
const u32 gMapObjectPic_MayWatering_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/3.4bpp");
const u32 gMapObjectPic_MayWatering_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/1.4bpp");
const u32 gMapObjectPic_MayWatering_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/4.4bpp");
const u32 gMapObjectPic_MayWatering_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/2.4bpp");
const u32 gMapObjectPic_MayWatering_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/5.4bpp");
const u16 gMapObjectPalette0[] = INCBIN_U16("graphics/map_objects/palettes/00.gbapal");
const u16 gMapObjectPalette1[] = INCBIN_U16("graphics/map_objects/palettes/01.gbapal");
const u16 gMapObjectPalette2[] = INCBIN_U16("graphics/map_objects/palettes/02.gbapal");
const u16 gMapObjectPalette3[] = INCBIN_U16("graphics/map_objects/palettes/03.gbapal");
const u16 gMapObjectPalette4[] = INCBIN_U16("graphics/map_objects/palettes/04.gbapal");
const u16 gMapObjectPalette5[] = INCBIN_U16("graphics/map_objects/palettes/05.gbapal");
const u16 gMapObjectPalette6[] = INCBIN_U16("graphics/map_objects/palettes/06.gbapal");
const u16 gMapObjectPalette7[] = INCBIN_U16("graphics/map_objects/palettes/07.gbapal");
const u32 gMapObjectPic_LittleBoy1_0[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/0.4bpp");
const u32 gMapObjectPic_LittleBoy1_1[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/1.4bpp");
const u32 gMapObjectPic_LittleBoy1_2[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/2.4bpp");
const u32 gMapObjectPic_LittleBoy1_3[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/3.4bpp");
const u32 gMapObjectPic_LittleBoy1_4[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/4.4bpp");
const u32 gMapObjectPic_LittleBoy1_5[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/5.4bpp");
const u32 gMapObjectPic_LittleBoy1_6[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/6.4bpp");
const u32 gMapObjectPic_LittleBoy1_7[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/7.4bpp");
const u32 gMapObjectPic_LittleBoy1_8[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/8.4bpp");
const u32 gMapObjectPic_LittleGirl1_0[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/0.4bpp");
const u32 gMapObjectPic_LittleGirl1_1[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/1.4bpp");
const u32 gMapObjectPic_LittleGirl1_2[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/2.4bpp");
const u32 gMapObjectPic_LittleGirl1_3[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/3.4bpp");
const u32 gMapObjectPic_LittleGirl1_4[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/4.4bpp");
const u32 gMapObjectPic_LittleGirl1_5[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/5.4bpp");
const u32 gMapObjectPic_LittleGirl1_6[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/6.4bpp");
const u32 gMapObjectPic_LittleGirl1_7[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/7.4bpp");
const u32 gMapObjectPic_LittleGirl1_8[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/8.4bpp");
const u32 gMapObjectPic_Boy1_0[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/0.4bpp");
const u32 gMapObjectPic_Boy1_1[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/1.4bpp");
const u32 gMapObjectPic_Boy1_2[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/2.4bpp");
const u32 gMapObjectPic_Boy1_3[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/3.4bpp");
const u32 gMapObjectPic_Boy1_4[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/4.4bpp");
const u32 gMapObjectPic_Boy1_5[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/5.4bpp");
const u32 gMapObjectPic_Boy1_6[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/6.4bpp");
const u32 gMapObjectPic_Boy1_7[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/7.4bpp");
const u32 gMapObjectPic_Boy1_8[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/8.4bpp");
const u32 gMapObjectPic_Girl1_0[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/0.4bpp");
const u32 gMapObjectPic_Girl1_1[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/1.4bpp");
const u32 gMapObjectPic_Girl1_2[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/2.4bpp");
const u32 gMapObjectPic_Girl1_3[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/3.4bpp");
const u32 gMapObjectPic_Girl1_4[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/4.4bpp");
const u32 gMapObjectPic_Girl1_5[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/5.4bpp");
const u32 gMapObjectPic_Girl1_6[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/6.4bpp");
const u32 gMapObjectPic_Girl1_7[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/7.4bpp");
const u32 gMapObjectPic_Girl1_8[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/8.4bpp");
const u32 gMapObjectPic_Boy2_0[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/0.4bpp");
const u32 gMapObjectPic_Boy2_1[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/1.4bpp");
const u32 gMapObjectPic_Boy2_2[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/2.4bpp");
const u32 gMapObjectPic_Boy2_3[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/3.4bpp");
const u32 gMapObjectPic_Boy2_4[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/4.4bpp");
const u32 gMapObjectPic_Boy2_5[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/5.4bpp");
const u32 gMapObjectPic_Boy2_6[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/6.4bpp");
const u32 gMapObjectPic_Boy2_7[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/7.4bpp");
const u32 gMapObjectPic_Boy2_8[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/8.4bpp");
const u32 gMapObjectPic_Girl2_0[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/0.4bpp");
const u32 gMapObjectPic_Girl2_1[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/1.4bpp");
const u32 gMapObjectPic_Girl2_2[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/2.4bpp");
const u32 gMapObjectPic_Girl2_3[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/3.4bpp");
const u32 gMapObjectPic_Girl2_4[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/4.4bpp");
const u32 gMapObjectPic_Girl2_5[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/5.4bpp");
const u32 gMapObjectPic_Girl2_6[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/6.4bpp");
const u32 gMapObjectPic_Girl2_7[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/7.4bpp");
const u32 gMapObjectPic_Girl2_8[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/8.4bpp");
const u32 gMapObjectPic_LittleBoy2_0[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/0.4bpp");
const u32 gMapObjectPic_LittleBoy2_1[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/1.4bpp");
const u32 gMapObjectPic_LittleBoy2_2[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/2.4bpp");
const u32 gMapObjectPic_LittleBoy2_3[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/3.4bpp");
const u32 gMapObjectPic_LittleBoy2_4[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/4.4bpp");
const u32 gMapObjectPic_LittleBoy2_5[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/5.4bpp");
const u32 gMapObjectPic_LittleBoy2_6[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/6.4bpp");
const u32 gMapObjectPic_LittleBoy2_7[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/7.4bpp");
const u32 gMapObjectPic_LittleBoy2_8[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/8.4bpp");
const u32 gMapObjectPic_LittleGirl2_0[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/0.4bpp");
const u32 gMapObjectPic_LittleGirl2_1[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/1.4bpp");
const u32 gMapObjectPic_LittleGirl2_2[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/2.4bpp");
const u32 gMapObjectPic_LittleGirl2_3[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/3.4bpp");
const u32 gMapObjectPic_LittleGirl2_4[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/4.4bpp");
const u32 gMapObjectPic_LittleGirl2_5[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/5.4bpp");
const u32 gMapObjectPic_LittleGirl2_6[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/6.4bpp");
const u32 gMapObjectPic_LittleGirl2_7[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/7.4bpp");
const u32 gMapObjectPic_LittleGirl2_8[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/8.4bpp");
const u32 gMapObjectPic_Boy3_0[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/0.4bpp");
const u32 gMapObjectPic_Boy3_1[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/1.4bpp");
const u32 gMapObjectPic_Boy3_2[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/2.4bpp");
const u32 gMapObjectPic_Boy3_3[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/3.4bpp");
const u32 gMapObjectPic_Boy3_4[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/4.4bpp");
const u32 gMapObjectPic_Boy3_5[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/5.4bpp");
const u32 gMapObjectPic_Boy3_6[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/6.4bpp");
const u32 gMapObjectPic_Boy3_7[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/7.4bpp");
const u32 gMapObjectPic_Boy3_8[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/8.4bpp");
const u32 gMapObjectPic_Girl3_0[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/0.4bpp");
const u32 gMapObjectPic_Girl3_1[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/1.4bpp");
const u32 gMapObjectPic_Girl3_2[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/2.4bpp");
const u32 gMapObjectPic_Girl3_3[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/3.4bpp");
const u32 gMapObjectPic_Girl3_4[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/4.4bpp");
const u32 gMapObjectPic_Girl3_5[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/5.4bpp");
const u32 gMapObjectPic_Girl3_6[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/6.4bpp");
const u32 gMapObjectPic_Girl3_7[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/7.4bpp");
const u32 gMapObjectPic_Girl3_8[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/8.4bpp");
const u32 gMapObjectPic_Boy4_0[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/0.4bpp");
const u32 gMapObjectPic_Boy4_1[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/1.4bpp");
const u32 gMapObjectPic_Boy4_2[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/2.4bpp");
const u32 gMapObjectPic_Boy4_3[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/3.4bpp");
const u32 gMapObjectPic_Boy4_4[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/4.4bpp");
const u32 gMapObjectPic_Boy4_5[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/5.4bpp");
const u32 gMapObjectPic_Boy4_6[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/6.4bpp");
const u32 gMapObjectPic_Boy4_7[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/7.4bpp");
const u32 gMapObjectPic_Boy4_8[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/8.4bpp");
const u32 gMapObjectPic_Woman1_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/0.4bpp");
const u32 gMapObjectPic_Woman1_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/1.4bpp");
const u32 gMapObjectPic_Woman1_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/2.4bpp");
const u32 gMapObjectPic_Woman1_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/3.4bpp");
const u32 gMapObjectPic_Woman1_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/4.4bpp");
const u32 gMapObjectPic_Woman1_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/5.4bpp");
const u32 gMapObjectPic_Woman1_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/6.4bpp");
const u32 gMapObjectPic_Woman1_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/7.4bpp");
const u32 gMapObjectPic_Woman1_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/8.4bpp");
const u32 gMapObjectPic_FatMan_0[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/0.4bpp");
const u32 gMapObjectPic_FatMan_1[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/1.4bpp");
const u32 gMapObjectPic_FatMan_2[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/2.4bpp");
const u32 gMapObjectPic_FatMan_3[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/3.4bpp");
const u32 gMapObjectPic_FatMan_4[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/4.4bpp");
const u32 gMapObjectPic_FatMan_5[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/5.4bpp");
const u32 gMapObjectPic_FatMan_6[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/6.4bpp");
const u32 gMapObjectPic_FatMan_7[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/7.4bpp");
const u32 gMapObjectPic_FatMan_8[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/8.4bpp");
const u32 gMapObjectPic_Woman2_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/0.4bpp");
const u32 gMapObjectPic_Woman2_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/1.4bpp");
const u32 gMapObjectPic_Woman2_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/2.4bpp");
const u32 gMapObjectPic_Woman2_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/3.4bpp");
const u32 gMapObjectPic_Woman2_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/4.4bpp");
const u32 gMapObjectPic_Woman2_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/5.4bpp");
const u32 gMapObjectPic_Woman2_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/6.4bpp");
const u32 gMapObjectPic_Woman2_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/7.4bpp");
const u32 gMapObjectPic_Woman2_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/8.4bpp");
const u32 gMapObjectPic_Man1_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/0.4bpp");
const u32 gMapObjectPic_Man1_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/1.4bpp");
const u32 gMapObjectPic_Man1_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/2.4bpp");
const u32 gMapObjectPic_Man1_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/3.4bpp");
const u32 gMapObjectPic_Man1_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/4.4bpp");
const u32 gMapObjectPic_Man1_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/5.4bpp");
const u32 gMapObjectPic_Man1_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/6.4bpp");
const u32 gMapObjectPic_Man1_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/7.4bpp");
const u32 gMapObjectPic_Man1_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/8.4bpp");
const u32 gMapObjectPic_Woman3_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/0.4bpp");
const u32 gMapObjectPic_Woman3_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/1.4bpp");
const u32 gMapObjectPic_Woman3_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/2.4bpp");
const u32 gMapObjectPic_Woman3_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/3.4bpp");
const u32 gMapObjectPic_Woman3_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/4.4bpp");
const u32 gMapObjectPic_Woman3_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/5.4bpp");
const u32 gMapObjectPic_Woman3_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/6.4bpp");
const u32 gMapObjectPic_Woman3_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/7.4bpp");
const u32 gMapObjectPic_Woman3_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/8.4bpp");
const u32 gMapObjectPic_OldMan1_0[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/0.4bpp");
const u32 gMapObjectPic_OldMan1_1[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/1.4bpp");
const u32 gMapObjectPic_OldMan1_2[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/2.4bpp");
const u32 gMapObjectPic_OldMan1_3[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/3.4bpp");
const u32 gMapObjectPic_OldMan1_4[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/4.4bpp");
const u32 gMapObjectPic_OldMan1_5[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/5.4bpp");
const u32 gMapObjectPic_OldMan1_6[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/6.4bpp");
const u32 gMapObjectPic_OldMan1_7[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/7.4bpp");
const u32 gMapObjectPic_OldMan1_8[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/8.4bpp");
const u32 gMapObjectPic_OldWoman1_0[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/0.4bpp");
const u32 gMapObjectPic_OldWoman1_1[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/1.4bpp");
const u32 gMapObjectPic_OldWoman1_2[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/2.4bpp");
const u32 gMapObjectPic_OldWoman1_3[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/3.4bpp");
const u32 gMapObjectPic_OldWoman1_4[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/4.4bpp");
const u32 gMapObjectPic_OldWoman1_5[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/5.4bpp");
const u32 gMapObjectPic_OldWoman1_6[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/6.4bpp");
const u32 gMapObjectPic_OldWoman1_7[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/7.4bpp");
const u32 gMapObjectPic_OldWoman1_8[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/8.4bpp");
const u32 gMapObjectPic_Man2_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/0.4bpp");
const u32 gMapObjectPic_Man2_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/1.4bpp");
const u32 gMapObjectPic_Man2_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/2.4bpp");
const u32 gMapObjectPic_Man2_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/3.4bpp");
const u32 gMapObjectPic_Man2_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/4.4bpp");
const u32 gMapObjectPic_Man2_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/5.4bpp");
const u32 gMapObjectPic_Man2_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/6.4bpp");
const u32 gMapObjectPic_Man2_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/7.4bpp");
const u32 gMapObjectPic_Man2_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/8.4bpp");
const u32 gMapObjectPic_Woman4_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/0.4bpp");
const u32 gMapObjectPic_Woman4_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/1.4bpp");
const u32 gMapObjectPic_Woman4_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/2.4bpp");
const u32 gMapObjectPic_Woman4_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/3.4bpp");
const u32 gMapObjectPic_Woman4_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/4.4bpp");
const u32 gMapObjectPic_Woman4_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/5.4bpp");
const u32 gMapObjectPic_Woman4_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/6.4bpp");
const u32 gMapObjectPic_Woman4_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/7.4bpp");
const u32 gMapObjectPic_Woman4_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/8.4bpp");
const u32 gMapObjectPic_Man3_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/0.4bpp");
const u32 gMapObjectPic_Man3_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/1.4bpp");
const u32 gMapObjectPic_Man3_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/2.4bpp");
const u32 gMapObjectPic_Man3_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/3.4bpp");
const u32 gMapObjectPic_Man3_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/4.4bpp");
const u32 gMapObjectPic_Man3_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/5.4bpp");
const u32 gMapObjectPic_Man3_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/6.4bpp");
const u32 gMapObjectPic_Man3_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/7.4bpp");
const u32 gMapObjectPic_Man3_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/8.4bpp");
const u32 gMapObjectPic_Woman5_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/0.4bpp");
const u32 gMapObjectPic_Woman5_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/1.4bpp");
const u32 gMapObjectPic_Woman5_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/2.4bpp");
const u32 gMapObjectPic_Woman5_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/3.4bpp");
const u32 gMapObjectPic_Woman5_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/4.4bpp");
const u32 gMapObjectPic_Woman5_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/5.4bpp");
const u32 gMapObjectPic_Woman5_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/6.4bpp");
const u32 gMapObjectPic_Woman5_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/7.4bpp");
const u32 gMapObjectPic_Woman5_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/8.4bpp");
const u32 gMapObjectPic_Cook_0[] = INCBIN_U32("graphics/map_objects/pics/people/cook/0.4bpp");
const u32 gMapObjectPic_Cook_1[] = INCBIN_U32("graphics/map_objects/pics/people/cook/1.4bpp");
const u32 gMapObjectPic_Cook_2[] = INCBIN_U32("graphics/map_objects/pics/people/cook/2.4bpp");
const u32 gMapObjectPic_Woman6_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/0.4bpp");
const u32 gMapObjectPic_Woman6_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/1.4bpp");
const u32 gMapObjectPic_Woman6_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/2.4bpp");
const u32 gMapObjectPic_Woman6_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/3.4bpp");
const u32 gMapObjectPic_Woman6_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/4.4bpp");
const u32 gMapObjectPic_Woman6_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/5.4bpp");
const u32 gMapObjectPic_Woman6_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/6.4bpp");
const u32 gMapObjectPic_Woman6_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/7.4bpp");
const u32 gMapObjectPic_Woman6_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/8.4bpp");
const u32 gMapObjectPic_OldMan2_0[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_2/0.4bpp");
const u32 gMapObjectPic_OldMan2_1[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_2/1.4bpp");
const u32 gMapObjectPic_OldMan2_2[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_2/2.4bpp");
const u32 gMapObjectPic_OldWoman2_0[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_2/0.4bpp");
const u32 gMapObjectPic_OldWoman2_1[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_2/1.4bpp");
const u32 gMapObjectPic_OldWoman2_2[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_2/2.4bpp");
const u32 gMapObjectPic_Camper_0[] = INCBIN_U32("graphics/map_objects/pics/people/camper/0.4bpp");
const u32 gMapObjectPic_Camper_1[] = INCBIN_U32("graphics/map_objects/pics/people/camper/1.4bpp");
const u32 gMapObjectPic_Camper_2[] = INCBIN_U32("graphics/map_objects/pics/people/camper/2.4bpp");
const u32 gMapObjectPic_Camper_3[] = INCBIN_U32("graphics/map_objects/pics/people/camper/3.4bpp");
const u32 gMapObjectPic_Camper_4[] = INCBIN_U32("graphics/map_objects/pics/people/camper/4.4bpp");
const u32 gMapObjectPic_Camper_5[] = INCBIN_U32("graphics/map_objects/pics/people/camper/5.4bpp");
const u32 gMapObjectPic_Camper_6[] = INCBIN_U32("graphics/map_objects/pics/people/camper/6.4bpp");
const u32 gMapObjectPic_Camper_7[] = INCBIN_U32("graphics/map_objects/pics/people/camper/7.4bpp");
const u32 gMapObjectPic_Camper_8[] = INCBIN_U32("graphics/map_objects/pics/people/camper/8.4bpp");
const u32 gMapObjectPic_Picnicker_0[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/0.4bpp");
const u32 gMapObjectPic_Picnicker_1[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/1.4bpp");
const u32 gMapObjectPic_Picnicker_2[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/2.4bpp");
const u32 gMapObjectPic_Picnicker_3[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/3.4bpp");
const u32 gMapObjectPic_Picnicker_4[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/4.4bpp");
const u32 gMapObjectPic_Picnicker_5[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/5.4bpp");
const u32 gMapObjectPic_Picnicker_6[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/6.4bpp");
const u32 gMapObjectPic_Picnicker_7[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/7.4bpp");
const u32 gMapObjectPic_Picnicker_8[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/8.4bpp");
const u32 gMapObjectPic_Man4_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/0.4bpp");
const u32 gMapObjectPic_Man4_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/1.4bpp");
const u32 gMapObjectPic_Man4_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/2.4bpp");
const u32 gMapObjectPic_Man4_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/3.4bpp");
const u32 gMapObjectPic_Man4_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/4.4bpp");
const u32 gMapObjectPic_Man4_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/5.4bpp");
const u32 gMapObjectPic_Man4_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/6.4bpp");
const u32 gMapObjectPic_Man4_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/7.4bpp");
const u32 gMapObjectPic_Man4_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/8.4bpp");
const u32 gMapObjectPic_Woman7_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/0.4bpp");
const u32 gMapObjectPic_Woman7_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/1.4bpp");
const u32 gMapObjectPic_Woman7_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/2.4bpp");
const u32 gMapObjectPic_Woman7_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/3.4bpp");
const u32 gMapObjectPic_Woman7_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/4.4bpp");
const u32 gMapObjectPic_Woman7_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/5.4bpp");
const u32 gMapObjectPic_Woman7_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/6.4bpp");
const u32 gMapObjectPic_Woman7_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/7.4bpp");
const u32 gMapObjectPic_Woman7_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/8.4bpp");
const u32 gMapObjectPic_Youngster_0[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/0.4bpp");
const u32 gMapObjectPic_Youngster_1[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/1.4bpp");
const u32 gMapObjectPic_Youngster_2[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/2.4bpp");
const u32 gMapObjectPic_Youngster_3[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/3.4bpp");
const u32 gMapObjectPic_Youngster_4[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/4.4bpp");
const u32 gMapObjectPic_Youngster_5[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/5.4bpp");
const u32 gMapObjectPic_Youngster_6[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/6.4bpp");
const u32 gMapObjectPic_Youngster_7[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/7.4bpp");
const u32 gMapObjectPic_Youngster_8[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/8.4bpp");
const u32 gMapObjectPic_BugCatcher_0[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/0.4bpp");
const u32 gMapObjectPic_BugCatcher_1[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/1.4bpp");
const u32 gMapObjectPic_BugCatcher_2[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/2.4bpp");
const u32 gMapObjectPic_BugCatcher_3[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/3.4bpp");
const u32 gMapObjectPic_BugCatcher_4[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/4.4bpp");
const u32 gMapObjectPic_BugCatcher_5[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/5.4bpp");
const u32 gMapObjectPic_BugCatcher_6[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/6.4bpp");
const u32 gMapObjectPic_BugCatcher_7[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/7.4bpp");
const u32 gMapObjectPic_BugCatcher_8[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/8.4bpp");
const u32 gMapObjectPic_PsychicM_0[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/0.4bpp");
const u32 gMapObjectPic_PsychicM_1[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/1.4bpp");
const u32 gMapObjectPic_PsychicM_2[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/2.4bpp");
const u32 gMapObjectPic_PsychicM_3[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/3.4bpp");
const u32 gMapObjectPic_PsychicM_4[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/4.4bpp");
const u32 gMapObjectPic_PsychicM_5[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/5.4bpp");
const u32 gMapObjectPic_PsychicM_6[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/6.4bpp");
const u32 gMapObjectPic_PsychicM_7[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/7.4bpp");
const u32 gMapObjectPic_PsychicM_8[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/8.4bpp");
const u32 gMapObjectPic_SchoolKidM_0[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/0.4bpp");
const u32 gMapObjectPic_SchoolKidM_1[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/1.4bpp");
const u32 gMapObjectPic_SchoolKidM_2[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/2.4bpp");
const u32 gMapObjectPic_SchoolKidM_3[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/3.4bpp");
const u32 gMapObjectPic_SchoolKidM_4[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/4.4bpp");
const u32 gMapObjectPic_SchoolKidM_5[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/5.4bpp");
const u32 gMapObjectPic_SchoolKidM_6[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/6.4bpp");
const u32 gMapObjectPic_SchoolKidM_7[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/7.4bpp");
const u32 gMapObjectPic_SchoolKidM_8[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/8.4bpp");
const u32 gMapObjectPic_Maniac_0[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/0.4bpp");
const u32 gMapObjectPic_Maniac_1[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/1.4bpp");
const u32 gMapObjectPic_Maniac_2[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/2.4bpp");
const u32 gMapObjectPic_Maniac_3[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/3.4bpp");
const u32 gMapObjectPic_Maniac_4[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/4.4bpp");
const u32 gMapObjectPic_Maniac_5[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/5.4bpp");
const u32 gMapObjectPic_Maniac_6[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/6.4bpp");
const u32 gMapObjectPic_Maniac_7[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/7.4bpp");
const u32 gMapObjectPic_Maniac_8[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/8.4bpp");
const u32 gMapObjectPic_HexManiac_0[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/0.4bpp");
const u32 gMapObjectPic_HexManiac_1[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/1.4bpp");
const u32 gMapObjectPic_HexManiac_2[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/2.4bpp");
const u32 gMapObjectPic_HexManiac_3[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/3.4bpp");
const u32 gMapObjectPic_HexManiac_4[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/4.4bpp");
const u32 gMapObjectPic_HexManiac_5[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/5.4bpp");
const u32 gMapObjectPic_HexManiac_6[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/6.4bpp");
const u32 gMapObjectPic_HexManiac_7[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/7.4bpp");
const u32 gMapObjectPic_HexManiac_8[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/8.4bpp");
const u32 gMapObjectPic_Woman8_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/0.4bpp");
const u32 gMapObjectPic_Woman8_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/1.4bpp");
const u32 gMapObjectPic_Woman8_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/2.4bpp");
const u32 gMapObjectPic_Woman8_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/3.4bpp");
const u32 gMapObjectPic_Woman8_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/4.4bpp");
const u32 gMapObjectPic_Woman8_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/5.4bpp");
const u32 gMapObjectPic_Woman8_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/6.4bpp");
const u32 gMapObjectPic_Woman8_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/7.4bpp");
const u32 gMapObjectPic_Woman8_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/8.4bpp");
const u32 gMapObjectPic_SwimmerM_0[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/0.4bpp");
const u32 gMapObjectPic_SwimmerM_1[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/1.4bpp");
const u32 gMapObjectPic_SwimmerM_2[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/2.4bpp");
const u32 gMapObjectPic_SwimmerM_3[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/3.4bpp");
const u32 gMapObjectPic_SwimmerM_4[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/4.4bpp");
const u32 gMapObjectPic_SwimmerM_5[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/5.4bpp");
const u32 gMapObjectPic_SwimmerM_6[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/6.4bpp");
const u32 gMapObjectPic_SwimmerM_7[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/7.4bpp");
const u32 gMapObjectPic_SwimmerM_8[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/8.4bpp");
const u32 gMapObjectPic_SwimmerF_0[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/0.4bpp");
const u32 gMapObjectPic_SwimmerF_1[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/1.4bpp");
const u32 gMapObjectPic_SwimmerF_2[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/2.4bpp");
const u32 gMapObjectPic_SwimmerF_3[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/3.4bpp");
const u32 gMapObjectPic_SwimmerF_4[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/4.4bpp");
const u32 gMapObjectPic_SwimmerF_5[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/5.4bpp");
const u32 gMapObjectPic_SwimmerF_6[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/6.4bpp");
const u32 gMapObjectPic_SwimmerF_7[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/7.4bpp");
const u32 gMapObjectPic_SwimmerF_8[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/8.4bpp");
const u32 gMapObjectPic_BlackBelt_0[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/0.4bpp");
const u32 gMapObjectPic_BlackBelt_1[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/1.4bpp");
const u32 gMapObjectPic_BlackBelt_2[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/2.4bpp");
const u32 gMapObjectPic_BlackBelt_3[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/3.4bpp");
const u32 gMapObjectPic_BlackBelt_4[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/4.4bpp");
const u32 gMapObjectPic_BlackBelt_5[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/5.4bpp");
const u32 gMapObjectPic_BlackBelt_6[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/6.4bpp");
const u32 gMapObjectPic_BlackBelt_7[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/7.4bpp");
const u32 gMapObjectPic_BlackBelt_8[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/8.4bpp");
const u32 gMapObjectPic_Beauty_0[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/0.4bpp");
const u32 gMapObjectPic_Beauty_1[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/1.4bpp");
const u32 gMapObjectPic_Beauty_2[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/2.4bpp");
const u32 gMapObjectPic_Beauty_3[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/3.4bpp");
const u32 gMapObjectPic_Beauty_4[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/4.4bpp");
const u32 gMapObjectPic_Beauty_5[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/5.4bpp");
const u32 gMapObjectPic_Beauty_6[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/6.4bpp");
const u32 gMapObjectPic_Beauty_7[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/7.4bpp");
const u32 gMapObjectPic_Beauty_8[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/8.4bpp");
const u32 gMapObjectPic_Scientist1_0[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/0.4bpp");
const u32 gMapObjectPic_Scientist1_1[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/1.4bpp");
const u32 gMapObjectPic_Scientist1_2[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/2.4bpp");
const u32 gMapObjectPic_Scientist1_3[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/3.4bpp");
const u32 gMapObjectPic_Scientist1_4[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/4.4bpp");
const u32 gMapObjectPic_Scientist1_5[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/5.4bpp");
const u32 gMapObjectPic_Scientist1_6[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/6.4bpp");
const u32 gMapObjectPic_Scientist1_7[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/7.4bpp");
const u32 gMapObjectPic_Scientist1_8[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/8.4bpp");
const u32 gMapObjectPic_Lass_0[] = INCBIN_U32("graphics/map_objects/pics/people/lass/0.4bpp");
const u32 gMapObjectPic_Lass_1[] = INCBIN_U32("graphics/map_objects/pics/people/lass/1.4bpp");
const u32 gMapObjectPic_Lass_2[] = INCBIN_U32("graphics/map_objects/pics/people/lass/2.4bpp");
const u32 gMapObjectPic_Lass_3[] = INCBIN_U32("graphics/map_objects/pics/people/lass/3.4bpp");
const u32 gMapObjectPic_Lass_4[] = INCBIN_U32("graphics/map_objects/pics/people/lass/4.4bpp");
const u32 gMapObjectPic_Lass_5[] = INCBIN_U32("graphics/map_objects/pics/people/lass/5.4bpp");
const u32 gMapObjectPic_Lass_6[] = INCBIN_U32("graphics/map_objects/pics/people/lass/6.4bpp");
const u32 gMapObjectPic_Lass_7[] = INCBIN_U32("graphics/map_objects/pics/people/lass/7.4bpp");
const u32 gMapObjectPic_Lass_8[] = INCBIN_U32("graphics/map_objects/pics/people/lass/8.4bpp");
const u32 gMapObjectPic_Gentleman_0[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/0.4bpp");
const u32 gMapObjectPic_Gentleman_1[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/1.4bpp");
const u32 gMapObjectPic_Gentleman_2[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/2.4bpp");
const u32 gMapObjectPic_Gentleman_3[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/3.4bpp");
const u32 gMapObjectPic_Gentleman_4[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/4.4bpp");
const u32 gMapObjectPic_Gentleman_5[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/5.4bpp");
const u32 gMapObjectPic_Gentleman_6[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/6.4bpp");
const u32 gMapObjectPic_Gentleman_7[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/7.4bpp");
const u32 gMapObjectPic_Gentleman_8[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/8.4bpp");
const u32 gMapObjectPic_Sailor_0[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/0.4bpp");
const u32 gMapObjectPic_Sailor_1[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/1.4bpp");
const u32 gMapObjectPic_Sailor_2[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/2.4bpp");
const u32 gMapObjectPic_Sailor_3[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/3.4bpp");
const u32 gMapObjectPic_Sailor_4[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/4.4bpp");
const u32 gMapObjectPic_Sailor_5[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/5.4bpp");
const u32 gMapObjectPic_Sailor_6[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/6.4bpp");
const u32 gMapObjectPic_Sailor_7[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/7.4bpp");
const u32 gMapObjectPic_Sailor_8[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/8.4bpp");
const u32 gMapObjectPic_Fisherman_0[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/0.4bpp");
const u32 gMapObjectPic_Fisherman_1[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/1.4bpp");
const u32 gMapObjectPic_Fisherman_2[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/2.4bpp");
const u32 gMapObjectPic_Fisherman_3[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/3.4bpp");
const u32 gMapObjectPic_Fisherman_4[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/4.4bpp");
const u32 gMapObjectPic_Fisherman_5[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/5.4bpp");
const u32 gMapObjectPic_Fisherman_6[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/6.4bpp");
const u32 gMapObjectPic_Fisherman_7[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/7.4bpp");
const u32 gMapObjectPic_Fisherman_8[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/8.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_0[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/0.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_1[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/1.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_2[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/2.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_3[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/3.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_4[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/4.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_5[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/5.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_6[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/6.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_7[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/7.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_8[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/8.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_0[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/0.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_1[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/1.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_2[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/2.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_3[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/3.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_4[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/4.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_5[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/5.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_6[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/6.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_7[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/7.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_8[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/8.4bpp");
const u32 gMapObjectPic_TuberF_0[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/0.4bpp");
const u32 gMapObjectPic_TuberF_1[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/1.4bpp");
const u32 gMapObjectPic_TuberF_2[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/2.4bpp");
const u32 gMapObjectPic_TuberF_3[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/3.4bpp");
const u32 gMapObjectPic_TuberF_4[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/4.4bpp");
const u32 gMapObjectPic_TuberF_5[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/5.4bpp");
const u32 gMapObjectPic_TuberF_6[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/6.4bpp");
const u32 gMapObjectPic_TuberF_7[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/7.4bpp");
const u32 gMapObjectPic_TuberF_8[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/8.4bpp");
const u32 gMapObjectPic_TuberM_0[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/0.4bpp");
const u32 gMapObjectPic_TuberM_1[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/1.4bpp");
const u32 gMapObjectPic_TuberM_2[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/2.4bpp");
const u32 gMapObjectPic_TuberM_3[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/3.4bpp");
const u32 gMapObjectPic_TuberM_4[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/4.4bpp");
const u32 gMapObjectPic_TuberM_5[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/5.4bpp");
const u32 gMapObjectPic_TuberM_6[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/6.4bpp");
const u32 gMapObjectPic_TuberM_7[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/7.4bpp");
const u32 gMapObjectPic_TuberM_8[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/8.4bpp");
const u32 gMapObjectPic_Hiker_0[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/0.4bpp");
const u32 gMapObjectPic_Hiker_1[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/1.4bpp");
const u32 gMapObjectPic_Hiker_2[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/2.4bpp");
const u32 gMapObjectPic_Hiker_3[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/3.4bpp");
const u32 gMapObjectPic_Hiker_4[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/4.4bpp");
const u32 gMapObjectPic_Hiker_5[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/5.4bpp");
const u32 gMapObjectPic_Hiker_6[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/6.4bpp");
const u32 gMapObjectPic_Hiker_7[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/7.4bpp");
const u32 gMapObjectPic_Hiker_8[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/8.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_0[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/0.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_1[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/1.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_2[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/2.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_3[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/3.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_4[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/4.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_5[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/5.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_6[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/6.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_7[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/7.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_8[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/8.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_0[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/0.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_1[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/1.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_2[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/2.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_3[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/3.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_4[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/4.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_5[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/5.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_6[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/6.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_7[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/7.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_8[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/8.4bpp");
const u32 gMapObjectPic_Man5_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/0.4bpp");
const u32 gMapObjectPic_Man5_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/1.4bpp");
const u32 gMapObjectPic_Man5_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/2.4bpp");
const u32 gMapObjectPic_Man5_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/3.4bpp");
const u32 gMapObjectPic_Man5_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/4.4bpp");
const u32 gMapObjectPic_Man5_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/5.4bpp");
const u32 gMapObjectPic_Man5_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/6.4bpp");
const u32 gMapObjectPic_Man5_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/7.4bpp");
const u32 gMapObjectPic_Man5_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/8.4bpp");
const u32 gMapObjectPic_Man6_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/0.4bpp");
const u32 gMapObjectPic_Man6_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/1.4bpp");
const u32 gMapObjectPic_Man6_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/2.4bpp");
const u32 gMapObjectPic_Man6_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/3.4bpp");
const u32 gMapObjectPic_Man6_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/4.4bpp");
const u32 gMapObjectPic_Man6_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/5.4bpp");
const u32 gMapObjectPic_Man6_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/6.4bpp");
const u32 gMapObjectPic_Man6_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/7.4bpp");
const u32 gMapObjectPic_Man6_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/8.4bpp");
const u32 gMapObjectPic_Nurse_0[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/0.4bpp");
const u32 gMapObjectPic_Nurse_1[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/1.4bpp");
const u32 gMapObjectPic_Nurse_2[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/2.4bpp");
const u32 gMapObjectPic_Nurse_3[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/3.4bpp");
const u32 gMapObjectPic_Nurse_4[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/4.4bpp");
const u32 gMapObjectPic_Nurse_5[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/5.4bpp");
const u32 gMapObjectPic_Nurse_6[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/6.4bpp");
const u32 gMapObjectPic_Nurse_7[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/7.4bpp");
const u32 gMapObjectPic_Nurse_8[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/8.4bpp");
const u32 gMapObjectPic_Nurse_9[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/9.4bpp");
const u32 gMapObjectPic_ItemBall[] = INCBIN_U32("graphics/map_objects/pics/misc/item_ball.4bpp");
const u32 gMapObjectPic_ProfBirch_0[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/0.4bpp");
const u32 gMapObjectPic_ProfBirch_1[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/1.4bpp");
const u32 gMapObjectPic_ProfBirch_2[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/2.4bpp");
const u32 gMapObjectPic_ProfBirch_3[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/3.4bpp");
const u32 gMapObjectPic_ProfBirch_4[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/4.4bpp");
const u32 gMapObjectPic_ProfBirch_5[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/5.4bpp");
const u32 gMapObjectPic_ProfBirch_6[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/6.4bpp");
const u32 gMapObjectPic_ProfBirch_7[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/7.4bpp");
const u32 gMapObjectPic_ProfBirch_8[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/8.4bpp");
const u32 gMapObjectPic_ReporterM_0[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/0.4bpp");
const u32 gMapObjectPic_ReporterM_1[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/1.4bpp");
const u32 gMapObjectPic_ReporterM_2[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/2.4bpp");
const u32 gMapObjectPic_ReporterM_3[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/3.4bpp");
const u32 gMapObjectPic_ReporterM_4[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/4.4bpp");
const u32 gMapObjectPic_ReporterM_5[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/5.4bpp");
const u32 gMapObjectPic_ReporterM_6[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/6.4bpp");
const u32 gMapObjectPic_ReporterM_7[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/7.4bpp");
const u32 gMapObjectPic_ReporterM_8[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/8.4bpp");
const u32 gMapObjectPic_ReporterF_0[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/0.4bpp");
const u32 gMapObjectPic_ReporterF_1[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/1.4bpp");
const u32 gMapObjectPic_ReporterF_2[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/2.4bpp");
const u32 gMapObjectPic_ReporterF_3[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/3.4bpp");
const u32 gMapObjectPic_ReporterF_4[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/4.4bpp");
const u32 gMapObjectPic_ReporterF_5[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/5.4bpp");
const u32 gMapObjectPic_ReporterF_6[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/6.4bpp");
const u32 gMapObjectPic_ReporterF_7[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/7.4bpp");
const u32 gMapObjectPic_ReporterF_8[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/8.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_0[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/0.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_1[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/1.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_2[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/2.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_3[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/3.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_4[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/4.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_5[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/5.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_6[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/6.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_7[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/7.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_8[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/8.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_0[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/0.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_1[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/1.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_2[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/2.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_3[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/3.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_4[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/4.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_5[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/5.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_6[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/6.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_7[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/7.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_8[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/8.4bpp");
const u32 gMapObjectPic_MartEmployee_0[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/0.4bpp");
const u32 gMapObjectPic_MartEmployee_1[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/1.4bpp");
const u32 gMapObjectPic_MartEmployee_2[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/2.4bpp");
const u32 gMapObjectPic_MartEmployee_3[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/3.4bpp");
const u32 gMapObjectPic_MartEmployee_4[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/4.4bpp");
const u32 gMapObjectPic_MartEmployee_5[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/5.4bpp");
const u32 gMapObjectPic_MartEmployee_6[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/6.4bpp");
const u32 gMapObjectPic_MartEmployee_7[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/7.4bpp");
const u32 gMapObjectPic_MartEmployee_8[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/8.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_0[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/0.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_1[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/1.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_2[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/2.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_3[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/3.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_4[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/4.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_5[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/5.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_6[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/6.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_7[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/7.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_8[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/8.4bpp");
const u32 gMapObjectPic_Teala_0[] = INCBIN_U32("graphics/map_objects/pics/people/teala/0.4bpp");
const u32 gMapObjectPic_Teala_1[] = INCBIN_U32("graphics/map_objects/pics/people/teala/1.4bpp");
const u32 gMapObjectPic_Teala_2[] = INCBIN_U32("graphics/map_objects/pics/people/teala/2.4bpp");
const u32 gMapObjectPic_Teala_3[] = INCBIN_U32("graphics/map_objects/pics/people/teala/3.4bpp");
const u32 gMapObjectPic_Teala_4[] = INCBIN_U32("graphics/map_objects/pics/people/teala/4.4bpp");
const u32 gMapObjectPic_Teala_5[] = INCBIN_U32("graphics/map_objects/pics/people/teala/5.4bpp");
const u32 gMapObjectPic_Teala_6[] = INCBIN_U32("graphics/map_objects/pics/people/teala/6.4bpp");
const u32 gMapObjectPic_Teala_7[] = INCBIN_U32("graphics/map_objects/pics/people/teala/7.4bpp");
const u32 gMapObjectPic_Teala_8[] = INCBIN_U32("graphics/map_objects/pics/people/teala/8.4bpp");
const u32 gMapObjectPic_Artist_0[] = INCBIN_U32("graphics/map_objects/pics/people/artist/0.4bpp");
const u32 gMapObjectPic_Artist_1[] = INCBIN_U32("graphics/map_objects/pics/people/artist/1.4bpp");
const u32 gMapObjectPic_Artist_2[] = INCBIN_U32("graphics/map_objects/pics/people/artist/2.4bpp");
const u32 gMapObjectPic_Artist_3[] = INCBIN_U32("graphics/map_objects/pics/people/artist/3.4bpp");
const u32 gMapObjectPic_Artist_4[] = INCBIN_U32("graphics/map_objects/pics/people/artist/4.4bpp");
const u32 gMapObjectPic_Artist_5[] = INCBIN_U32("graphics/map_objects/pics/people/artist/5.4bpp");
const u32 gMapObjectPic_Artist_6[] = INCBIN_U32("graphics/map_objects/pics/people/artist/6.4bpp");
const u32 gMapObjectPic_Artist_7[] = INCBIN_U32("graphics/map_objects/pics/people/artist/7.4bpp");
const u32 gMapObjectPic_Artist_8[] = INCBIN_U32("graphics/map_objects/pics/people/artist/8.4bpp");
const u32 gMapObjectPic_Cameraman_0[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/0.4bpp");
const u32 gMapObjectPic_Cameraman_1[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/1.4bpp");
const u32 gMapObjectPic_Cameraman_2[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/2.4bpp");
const u32 gMapObjectPic_Cameraman_3[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/3.4bpp");
const u32 gMapObjectPic_Cameraman_4[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/4.4bpp");
const u32 gMapObjectPic_Cameraman_5[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/5.4bpp");
const u32 gMapObjectPic_Cameraman_6[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/6.4bpp");
const u32 gMapObjectPic_Cameraman_7[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/7.4bpp");
const u32 gMapObjectPic_Cameraman_8[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/8.4bpp");
const u32 gMapObjectPic_Scientist2_0[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/0.4bpp");
const u32 gMapObjectPic_Scientist2_1[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/1.4bpp");
const u32 gMapObjectPic_Scientist2_2[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/2.4bpp");
const u32 gMapObjectPic_Scientist2_3[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/3.4bpp");
const u32 gMapObjectPic_Scientist2_4[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/4.4bpp");
const u32 gMapObjectPic_Scientist2_5[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/5.4bpp");
const u32 gMapObjectPic_Scientist2_6[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/6.4bpp");
const u32 gMapObjectPic_Scientist2_7[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/7.4bpp");
const u32 gMapObjectPic_Scientist2_8[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/8.4bpp");
const u32 gMapObjectPic_Man7_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/0.4bpp");
const u32 gMapObjectPic_Man7_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/1.4bpp");
const u32 gMapObjectPic_Man7_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/2.4bpp");
const u32 gMapObjectPic_Man7_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/3.4bpp");
const u32 gMapObjectPic_Man7_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/4.4bpp");
const u32 gMapObjectPic_Man7_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/5.4bpp");
const u32 gMapObjectPic_Man7_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/6.4bpp");
const u32 gMapObjectPic_Man7_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/7.4bpp");
const u32 gMapObjectPic_Man7_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/8.4bpp");
const u32 gMapObjectPic_AquaMemberM_0[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/0.4bpp");
const u32 gMapObjectPic_AquaMemberM_1[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/1.4bpp");
const u32 gMapObjectPic_AquaMemberM_2[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/2.4bpp");
const u32 gMapObjectPic_AquaMemberM_3[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/3.4bpp");
const u32 gMapObjectPic_AquaMemberM_4[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/4.4bpp");
const u32 gMapObjectPic_AquaMemberM_5[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/5.4bpp");
const u32 gMapObjectPic_AquaMemberM_6[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/6.4bpp");
const u32 gMapObjectPic_AquaMemberM_7[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/7.4bpp");
const u32 gMapObjectPic_AquaMemberM_8[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/8.4bpp");
const u32 gMapObjectPic_AquaMemberF_0[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/0.4bpp");
const u32 gMapObjectPic_AquaMemberF_1[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/1.4bpp");
const u32 gMapObjectPic_AquaMemberF_2[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/2.4bpp");
const u32 gMapObjectPic_AquaMemberF_3[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/3.4bpp");
const u32 gMapObjectPic_AquaMemberF_4[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/4.4bpp");
const u32 gMapObjectPic_AquaMemberF_5[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/5.4bpp");
const u32 gMapObjectPic_AquaMemberF_6[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/6.4bpp");
const u32 gMapObjectPic_AquaMemberF_7[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/7.4bpp");
const u32 gMapObjectPic_AquaMemberF_8[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/8.4bpp");
const u32 gMapObjectPic_MagmaMemberM_0[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/0.4bpp");
const u32 gMapObjectPic_MagmaMemberM_1[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/1.4bpp");
const u32 gMapObjectPic_MagmaMemberM_2[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/2.4bpp");
const u32 gMapObjectPic_MagmaMemberM_3[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/3.4bpp");
const u32 gMapObjectPic_MagmaMemberM_4[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/4.4bpp");
const u32 gMapObjectPic_MagmaMemberM_5[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/5.4bpp");
const u32 gMapObjectPic_MagmaMemberM_6[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/6.4bpp");
const u32 gMapObjectPic_MagmaMemberM_7[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/7.4bpp");
const u32 gMapObjectPic_MagmaMemberM_8[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/8.4bpp");
const u32 gMapObjectPic_MagmaMemberF_0[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/0.4bpp");
const u32 gMapObjectPic_MagmaMemberF_1[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/1.4bpp");
const u32 gMapObjectPic_MagmaMemberF_2[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/2.4bpp");
const u32 gMapObjectPic_MagmaMemberF_3[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/3.4bpp");
const u32 gMapObjectPic_MagmaMemberF_4[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/4.4bpp");
const u32 gMapObjectPic_MagmaMemberF_5[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/5.4bpp");
const u32 gMapObjectPic_MagmaMemberF_6[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/6.4bpp");
const u32 gMapObjectPic_MagmaMemberF_7[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/7.4bpp");
const u32 gMapObjectPic_MagmaMemberF_8[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/8.4bpp");
const u32 gMapObjectPic_Sidney_0[] = INCBIN_U32("graphics/map_objects/pics/people/sidney/0.4bpp");
const u32 gMapObjectPic_Sidney_1[] = INCBIN_U32("graphics/map_objects/pics/people/sidney/1.4bpp");
const u32 gMapObjectPic_Sidney_2[] = INCBIN_U32("graphics/map_objects/pics/people/sidney/2.4bpp");
const u32 gMapObjectPic_Phoebe_0[] = INCBIN_U32("graphics/map_objects/pics/people/phoebe/0.4bpp");
const u32 gMapObjectPic_Phoebe_1[] = INCBIN_U32("graphics/map_objects/pics/people/phoebe/1.4bpp");
const u32 gMapObjectPic_Phoebe_2[] = INCBIN_U32("graphics/map_objects/pics/people/phoebe/2.4bpp");
const u32 gMapObjectPic_Glacia_0[] = INCBIN_U32("graphics/map_objects/pics/people/glacia/0.4bpp");
const u32 gMapObjectPic_Glacia_1[] = INCBIN_U32("graphics/map_objects/pics/people/glacia/1.4bpp");
const u32 gMapObjectPic_Glacia_2[] = INCBIN_U32("graphics/map_objects/pics/people/glacia/2.4bpp");
const u32 gMapObjectPic_Drake_0[] = INCBIN_U32("graphics/map_objects/pics/people/drake/0.4bpp");
const u32 gMapObjectPic_Drake_1[] = INCBIN_U32("graphics/map_objects/pics/people/drake/1.4bpp");
const u32 gMapObjectPic_Drake_2[] = INCBIN_U32("graphics/map_objects/pics/people/drake/2.4bpp");
const u32 gMapObjectPic_Roxanne_0[] = INCBIN_U32("graphics/map_objects/pics/people/roxanne/0.4bpp");
const u32 gMapObjectPic_Roxanne_1[] = INCBIN_U32("graphics/map_objects/pics/people/roxanne/1.4bpp");
const u32 gMapObjectPic_Roxanne_2[] = INCBIN_U32("graphics/map_objects/pics/people/roxanne/2.4bpp");
const u32 gMapObjectPic_Brawly_0[] = INCBIN_U32("graphics/map_objects/pics/people/brawly/0.4bpp");
const u32 gMapObjectPic_Brawly_1[] = INCBIN_U32("graphics/map_objects/pics/people/brawly/1.4bpp");
const u32 gMapObjectPic_Brawly_2[] = INCBIN_U32("graphics/map_objects/pics/people/brawly/2.4bpp");
const u32 gMapObjectPic_Wattson_0[] = INCBIN_U32("graphics/map_objects/pics/people/wattson/0.4bpp");
const u32 gMapObjectPic_Wattson_1[] = INCBIN_U32("graphics/map_objects/pics/people/wattson/1.4bpp");
const u32 gMapObjectPic_Wattson_2[] = INCBIN_U32("graphics/map_objects/pics/people/wattson/2.4bpp");
const u32 gMapObjectPic_Flannery_0[] = INCBIN_U32("graphics/map_objects/pics/people/flannery/0.4bpp");
const u32 gMapObjectPic_Flannery_1[] = INCBIN_U32("graphics/map_objects/pics/people/flannery/1.4bpp");
const u32 gMapObjectPic_Flannery_2[] = INCBIN_U32("graphics/map_objects/pics/people/flannery/2.4bpp");
const u32 gMapObjectPic_Norman_0[] = INCBIN_U32("graphics/map_objects/pics/people/norman/0.4bpp");
const u32 gMapObjectPic_Norman_1[] = INCBIN_U32("graphics/map_objects/pics/people/norman/1.4bpp");
const u32 gMapObjectPic_Norman_2[] = INCBIN_U32("graphics/map_objects/pics/people/norman/2.4bpp");
const u32 gMapObjectPic_Norman_3[] = INCBIN_U32("graphics/map_objects/pics/people/norman/3.4bpp");
const u32 gMapObjectPic_Norman_4[] = INCBIN_U32("graphics/map_objects/pics/people/norman/4.4bpp");
const u32 gMapObjectPic_Norman_5[] = INCBIN_U32("graphics/map_objects/pics/people/norman/5.4bpp");
const u32 gMapObjectPic_Norman_6[] = INCBIN_U32("graphics/map_objects/pics/people/norman/6.4bpp");
const u32 gMapObjectPic_Norman_7[] = INCBIN_U32("graphics/map_objects/pics/people/norman/7.4bpp");
const u32 gMapObjectPic_Norman_8[] = INCBIN_U32("graphics/map_objects/pics/people/norman/8.4bpp");
const u32 gMapObjectPic_Winona_0[] = INCBIN_U32("graphics/map_objects/pics/people/winona/0.4bpp");
const u32 gMapObjectPic_Winona_1[] = INCBIN_U32("graphics/map_objects/pics/people/winona/1.4bpp");
const u32 gMapObjectPic_Winona_2[] = INCBIN_U32("graphics/map_objects/pics/people/winona/2.4bpp");
const u32 gMapObjectPic_Liza_0[] = INCBIN_U32("graphics/map_objects/pics/people/liza/0.4bpp");
const u32 gMapObjectPic_Liza_1[] = INCBIN_U32("graphics/map_objects/pics/people/liza/1.4bpp");
const u32 gMapObjectPic_Liza_2[] = INCBIN_U32("graphics/map_objects/pics/people/liza/2.4bpp");
const u32 gMapObjectPic_Tate_0[] = INCBIN_U32("graphics/map_objects/pics/people/tate/0.4bpp");
const u32 gMapObjectPic_Tate_1[] = INCBIN_U32("graphics/map_objects/pics/people/tate/1.4bpp");
const u32 gMapObjectPic_Tate_2[] = INCBIN_U32("graphics/map_objects/pics/people/tate/2.4bpp");
const u32 gMapObjectPic_Wallace_0[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/0.4bpp");
const u32 gMapObjectPic_Wallace_1[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/1.4bpp");
const u32 gMapObjectPic_Wallace_2[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/2.4bpp");
const u32 gMapObjectPic_Wallace_3[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/3.4bpp");
const u32 gMapObjectPic_Wallace_4[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/4.4bpp");
const u32 gMapObjectPic_Wallace_5[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/5.4bpp");
const u32 gMapObjectPic_Wallace_6[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/6.4bpp");
const u32 gMapObjectPic_Wallace_7[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/7.4bpp");
const u32 gMapObjectPic_Wallace_8[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/8.4bpp");
const u32 gMapObjectPic_Steven_0[] = INCBIN_U32("graphics/map_objects/pics/people/steven/0.4bpp");
const u32 gMapObjectPic_Steven_1[] = INCBIN_U32("graphics/map_objects/pics/people/steven/1.4bpp");
const u32 gMapObjectPic_Steven_2[] = INCBIN_U32("graphics/map_objects/pics/people/steven/2.4bpp");
const u32 gMapObjectPic_Steven_3[] = INCBIN_U32("graphics/map_objects/pics/people/steven/3.4bpp");
const u32 gMapObjectPic_Steven_4[] = INCBIN_U32("graphics/map_objects/pics/people/steven/4.4bpp");
const u32 gMapObjectPic_Steven_5[] = INCBIN_U32("graphics/map_objects/pics/people/steven/5.4bpp");
const u32 gMapObjectPic_Steven_6[] = INCBIN_U32("graphics/map_objects/pics/people/steven/6.4bpp");
const u32 gMapObjectPic_Steven_7[] = INCBIN_U32("graphics/map_objects/pics/people/steven/7.4bpp");
const u32 gMapObjectPic_Steven_8[] = INCBIN_U32("graphics/map_objects/pics/people/steven/8.4bpp");
const u32 gMapObjectPic_Wally_0[] = INCBIN_U32("graphics/map_objects/pics/people/wally/0.4bpp");
const u32 gMapObjectPic_Wally_1[] = INCBIN_U32("graphics/map_objects/pics/people/wally/1.4bpp");
const u32 gMapObjectPic_Wally_2[] = INCBIN_U32("graphics/map_objects/pics/people/wally/2.4bpp");
const u32 gMapObjectPic_Wally_3[] = INCBIN_U32("graphics/map_objects/pics/people/wally/3.4bpp");
const u32 gMapObjectPic_Wally_4[] = INCBIN_U32("graphics/map_objects/pics/people/wally/4.4bpp");
const u32 gMapObjectPic_Wally_5[] = INCBIN_U32("graphics/map_objects/pics/people/wally/5.4bpp");
const u32 gMapObjectPic_Wally_6[] = INCBIN_U32("graphics/map_objects/pics/people/wally/6.4bpp");
const u32 gMapObjectPic_Wally_7[] = INCBIN_U32("graphics/map_objects/pics/people/wally/7.4bpp");
const u32 gMapObjectPic_Wally_8[] = INCBIN_U32("graphics/map_objects/pics/people/wally/8.4bpp");
const u32 gMapObjectPic_LittleBoy3_0[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/0.4bpp");
const u32 gMapObjectPic_LittleBoy3_1[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/1.4bpp");
const u32 gMapObjectPic_LittleBoy3_2[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/2.4bpp");
const u32 gMapObjectPic_LittleBoy3_3[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/3.4bpp");
const u32 gMapObjectPic_LittleBoy3_4[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/4.4bpp");
const u32 gMapObjectPic_LittleBoy3_5[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/5.4bpp");
const u32 gMapObjectPic_LittleBoy3_6[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/6.4bpp");
const u32 gMapObjectPic_LittleBoy3_7[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/7.4bpp");
const u32 gMapObjectPic_LittleBoy3_8[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/8.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_0[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/0.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_1[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/1.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_2[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/2.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_3[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/3.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_4[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/4.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_5[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/5.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_6[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/6.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_7[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/7.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_8[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/8.4bpp");
const u32 gMapObjectPic_LatiasLatios_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/latias_latios/0.4bpp");
const u32 gMapObjectPic_LatiasLatios_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/latias_latios/1.4bpp");
const u32 gMapObjectPic_LatiasLatios_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/latias_latios/2.4bpp");
const u32 gMapObjectPic_Boy5_0[] = INCBIN_U32("graphics/map_objects/pics/people/boy_5/0.4bpp");
const u32 gMapObjectPic_Boy5_1[] = INCBIN_U32("graphics/map_objects/pics/people/boy_5/1.4bpp");
const u32 gMapObjectPic_Boy5_2[] = INCBIN_U32("graphics/map_objects/pics/people/boy_5/2.4bpp");
const u32 gMapObjectPic_ContestJudge_0[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/0.4bpp");
const u32 gMapObjectPic_ContestJudge_1[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/1.4bpp");
const u32 gMapObjectPic_ContestJudge_2[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/2.4bpp");
const u32 gMapObjectPic_ContestJudge_3[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/3.4bpp");
const u32 gMapObjectPic_ContestJudge_4[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/4.4bpp");
const u32 gMapObjectPic_ContestJudge_5[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/5.4bpp");
const u32 gMapObjectPic_ContestJudge_6[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/6.4bpp");
const u32 gMapObjectPic_ContestJudge_7[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/7.4bpp");
const u32 gMapObjectPic_ContestJudge_8[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/8.4bpp");
const u32 gMapObjectPic_Archie_0[] = INCBIN_U32("graphics/map_objects/pics/people/archie/0.4bpp");
const u32 gMapObjectPic_Archie_1[] = INCBIN_U32("graphics/map_objects/pics/people/archie/1.4bpp");
const u32 gMapObjectPic_Archie_2[] = INCBIN_U32("graphics/map_objects/pics/people/archie/2.4bpp");
const u32 gMapObjectPic_Archie_3[] = INCBIN_U32("graphics/map_objects/pics/people/archie/3.4bpp");
const u32 gMapObjectPic_Archie_4[] = INCBIN_U32("graphics/map_objects/pics/people/archie/4.4bpp");
const u32 gMapObjectPic_Archie_5[] = INCBIN_U32("graphics/map_objects/pics/people/archie/5.4bpp");
const u32 gMapObjectPic_Archie_6[] = INCBIN_U32("graphics/map_objects/pics/people/archie/6.4bpp");
const u32 gMapObjectPic_Archie_7[] = INCBIN_U32("graphics/map_objects/pics/people/archie/7.4bpp");
const u32 gMapObjectPic_Archie_8[] = INCBIN_U32("graphics/map_objects/pics/people/archie/8.4bpp");
const u32 gMapObjectPic_Maxie_0[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/0.4bpp");
const u32 gMapObjectPic_Maxie_1[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/1.4bpp");
const u32 gMapObjectPic_Maxie_2[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/2.4bpp");
const u32 gMapObjectPic_Maxie_3[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/3.4bpp");
const u32 gMapObjectPic_Maxie_4[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/4.4bpp");
const u32 gMapObjectPic_Maxie_5[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/5.4bpp");
const u32 gMapObjectPic_Maxie_6[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/6.4bpp");
const u32 gMapObjectPic_Maxie_7[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/7.4bpp");
const u32 gMapObjectPic_Maxie_8[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/8.4bpp");
const u32 gMapObjectPic_Kyogre_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/kyogre/0.4bpp");
const u32 gMapObjectPic_Kyogre_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/kyogre/1.4bpp");
const u32 gMapObjectPic_Groudon_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/groudon/0.4bpp");
const u32 gMapObjectPic_Groudon_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/groudon/1.4bpp");
const u32 gMapObjectPic_Regi[] = INCBIN_U32("graphics/map_objects/pics/pokemon/regi.4bpp");
const u32 gMapObjectPic_Skitty_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/skitty/0.4bpp");
const u32 gMapObjectPic_Skitty_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/skitty/1.4bpp");
const u32 gMapObjectPic_Skitty_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/skitty/2.4bpp");
const u32 gMapObjectPic_Kecleon_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/kecleon/0.4bpp");
const u32 gMapObjectPic_Kecleon_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/kecleon/1.4bpp");
const u32 gMapObjectPic_Kecleon_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/kecleon/2.4bpp");
const u32 gMapObjectPic_Rayquaza_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/rayquaza/0.4bpp");
const u32 gMapObjectPic_Rayquaza_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/rayquaza/1.4bpp");
const u32 gMapObjectPic_Zigzagoon_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/zigzagoon/0.4bpp");
const u32 gMapObjectPic_Zigzagoon_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/zigzagoon/1.4bpp");
const u32 gMapObjectPic_Zigzagoon_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/zigzagoon/2.4bpp");
const u32 gMapObjectPic_Pikachu_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/pikachu/0.4bpp");
const u32 gMapObjectPic_Pikachu_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/pikachu/1.4bpp");
const u32 gMapObjectPic_Pikachu_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/pikachu/2.4bpp");
const u32 gMapObjectPic_Azumarill_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azumarill/0.4bpp");
const u32 gMapObjectPic_Azumarill_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azumarill/1.4bpp");
const u32 gMapObjectPic_Azumarill_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azumarill/2.4bpp");
const u32 gMapObjectPic_Wingull_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/0.4bpp");
const u32 gMapObjectPic_Wingull_3[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/3.4bpp");
const u32 gMapObjectPic_Wingull_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/1.4bpp");
const u32 gMapObjectPic_Wingull_4[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/4.4bpp");
const u32 gMapObjectPic_Wingull_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/2.4bpp");
const u32 gMapObjectPic_Wingull_5[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/5.4bpp");
const u32 gMapObjectPic_TuberMSwimming_0[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/0.4bpp");
const u32 gMapObjectPic_TuberMSwimming_1[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/1.4bpp");
const u32 gMapObjectPic_TuberMSwimming_2[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/2.4bpp");
const u32 gMapObjectPic_TuberMSwimming_3[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/3.4bpp");
const u32 gMapObjectPic_TuberMSwimming_4[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/4.4bpp");
const u32 gMapObjectPic_TuberMSwimming_5[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/5.4bpp");
const u32 gMapObjectPic_TuberMSwimming_6[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/6.4bpp");
const u32 gMapObjectPic_TuberMSwimming_7[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/7.4bpp");
const u32 gMapObjectPic_TuberMSwimming_8[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/8.4bpp");
const u32 gMapObjectPic_Azurill_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azurill/0.4bpp");
const u32 gMapObjectPic_Azurill_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azurill/1.4bpp");
const u32 gMapObjectPic_Azurill_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azurill/2.4bpp");
const u32 gMapObjectPic_Mom_0[] = INCBIN_U32("graphics/map_objects/pics/people/mom/0.4bpp");
const u32 gMapObjectPic_Mom_1[] = INCBIN_U32("graphics/map_objects/pics/people/mom/1.4bpp");
const u32 gMapObjectPic_Mom_2[] = INCBIN_U32("graphics/map_objects/pics/people/mom/2.4bpp");
const u32 gMapObjectPic_Mom_3[] = INCBIN_U32("graphics/map_objects/pics/people/mom/3.4bpp");
const u32 gMapObjectPic_Mom_4[] = INCBIN_U32("graphics/map_objects/pics/people/mom/4.4bpp");
const u32 gMapObjectPic_Mom_5[] = INCBIN_U32("graphics/map_objects/pics/people/mom/5.4bpp");
const u32 gMapObjectPic_Mom_6[] = INCBIN_U32("graphics/map_objects/pics/people/mom/6.4bpp");
const u32 gMapObjectPic_Mom_7[] = INCBIN_U32("graphics/map_objects/pics/people/mom/7.4bpp");
const u32 gMapObjectPic_Mom_8[] = INCBIN_U32("graphics/map_objects/pics/people/mom/8.4bpp");
const u16 gMapObjectPalette22[] = INCBIN_U16("graphics/map_objects/palettes/22.gbapal");
const u16 gMapObjectPalette23[] = INCBIN_U16("graphics/map_objects/palettes/23.gbapal");
const u16 gMapObjectPalette24[] = INCBIN_U16("graphics/map_objects/palettes/24.gbapal");
const u16 gMapObjectPalette25[] = INCBIN_U16("graphics/map_objects/palettes/25.gbapal");
const u32 gMapObjectPic_UnusedNatuDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_natu_doll.4bpp");
const u32 gMapObjectPic_UnusedMagnemiteDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_magnemite_doll.4bpp");
const u32 gMapObjectPic_UnusedSquirtleDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_squirtle_doll.4bpp");
const u32 gMapObjectPic_UnusedWooperDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_wooper_doll.4bpp");
const u32 gMapObjectPic_UnusedPikachuDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_pikachu_doll.4bpp");
const u32 gMapObjectPic_UnusedPorygon2Doll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_porygon2_doll.4bpp");
const u32 gMapObjectPic_PichuDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/pichu_doll.4bpp");
const u32 gMapObjectPic_PikachuDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/pikachu_doll.4bpp");
const u32 gMapObjectPic_MarillDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/marill_doll.4bpp");
const u32 gMapObjectPic_TogepiDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/togepi_doll.4bpp");
const u32 gMapObjectPic_CyndaquilDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/cyndaquil_doll.4bpp");
const u32 gMapObjectPic_ChikoritaDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/chikorita_doll.4bpp");
const u32 gMapObjectPic_TotodileDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/totodile_doll.4bpp");
const u32 gMapObjectPic_JigglypuffDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/jigglypuff_doll.4bpp");
const u32 gMapObjectPic_MeowthDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/meowth_doll.4bpp");
const u32 gMapObjectPic_ClefairyDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/clefairy_doll.4bpp");
const u32 gMapObjectPic_DittoDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/ditto_doll.4bpp");
const u32 gMapObjectPic_SmoochumDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/smoochum_doll.4bpp");
const u32 gMapObjectPic_TreeckoDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/treecko_doll.4bpp");
const u32 gMapObjectPic_TorchicDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/torchic_doll.4bpp");
const u32 gMapObjectPic_MudkipDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/mudkip_doll.4bpp");
const u32 gMapObjectPic_DuskullDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/duskull_doll.4bpp");
const u32 gMapObjectPic_WynautDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/wynaut_doll.4bpp");
const u32 gMapObjectPic_BaltoyDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/baltoy_doll.4bpp");
const u32 gMapObjectPic_KecleonDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/kecleon_doll.4bpp");
const u32 gMapObjectPic_AzurillDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/azurill_doll.4bpp");
const u32 gMapObjectPic_SkittyDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/skitty_doll.4bpp");
const u32 gMapObjectPic_SwabluDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/swablu_doll.4bpp");
const u32 gMapObjectPic_GulpinDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/gulpin_doll.4bpp");
const u32 gMapObjectPic_LotadDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/lotad_doll.4bpp");
const u32 gMapObjectPic_SeedotDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/seedot_doll.4bpp");
const u32 gMapObjectPic_PikaCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/pika_cushion.4bpp");
const u32 gMapObjectPic_RoundCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/round_cushion.4bpp");
const u32 gMapObjectPic_KissCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/kiss_cushion.4bpp");
const u32 gMapObjectPic_ZigzagCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/zigzag_cushion.4bpp");
const u32 gMapObjectPic_SpinCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/spin_cushion.4bpp");
const u32 gMapObjectPic_DiamondCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/diamond_cushion.4bpp");
const u32 gMapObjectPic_BallCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/ball_cushion.4bpp");
const u32 gMapObjectPic_GrassCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/grass_cushion.4bpp");
const u32 gMapObjectPic_FireCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/fire_cushion.4bpp");
const u32 gMapObjectPic_WaterCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/water_cushion.4bpp");
const u32 gMapObjectPic_BigSnorlaxDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_snorlax_doll.4bpp");
const u32 gMapObjectPic_BigRhydonDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_rhydon_doll.4bpp");
const u32 gMapObjectPic_BigLaprasDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_lapras_doll.4bpp");
const u32 gMapObjectPic_BigVenusaurDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_venusaur_doll.4bpp");
const u32 gMapObjectPic_BigCharizardDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_charizard_doll.4bpp");
const u32 gMapObjectPic_BigBlastoiseDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_blastoise_doll.4bpp");
const u32 gMapObjectPic_BigWailmerDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_wailmer_doll.4bpp");
const u32 gMapObjectPic_BigRegirockDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_regirock_doll.4bpp");
const u32 gMapObjectPic_BigRegiceDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_regice_doll.4bpp");
const u32 gMapObjectPic_BigRegisteelDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_registeel_doll.4bpp");
const u32 gMapObjectPic_CuttableTree_0[] = INCBIN_U32("graphics/map_objects/pics/misc/cuttable_tree/0.4bpp");
const u32 gMapObjectPic_CuttableTree_1[] = INCBIN_U32("graphics/map_objects/pics/misc/cuttable_tree/1.4bpp");
const u32 gMapObjectPic_CuttableTree_2[] = INCBIN_U32("graphics/map_objects/pics/misc/cuttable_tree/2.4bpp");
const u32 gMapObjectPic_CuttableTree_3[] = INCBIN_U32("graphics/map_objects/pics/misc/cuttable_tree/3.4bpp");
const u32 gMapObjectPic_BreakableRock_0[] = INCBIN_U32("graphics/map_objects/pics/misc/breakable_rock/0.4bpp");
const u32 gMapObjectPic_BreakableRock_1[] = INCBIN_U32("graphics/map_objects/pics/misc/breakable_rock/1.4bpp");
const u32 gMapObjectPic_BreakableRock_2[] = INCBIN_U32("graphics/map_objects/pics/misc/breakable_rock/2.4bpp");
const u32 gMapObjectPic_BreakableRock_3[] = INCBIN_U32("graphics/map_objects/pics/misc/breakable_rock/3.4bpp");
const u32 gMapObjectPic_PushableBoulder[] = INCBIN_U32("graphics/map_objects/pics/misc/pushable_boulder.4bpp");
const u32 gMapObjectPic_MrBrineysBoat_0[] = INCBIN_U32("graphics/map_objects/pics/misc/mr_brineys_boat/0.4bpp");
const u32 gMapObjectPic_MrBrineysBoat_1[] = INCBIN_U32("graphics/map_objects/pics/misc/mr_brineys_boat/1.4bpp");
const u32 gMapObjectPic_MrBrineysBoat_2[] = INCBIN_U32("graphics/map_objects/pics/misc/mr_brineys_boat/2.4bpp");
const u32 gMapObjectPic_Fossil[] = INCBIN_U32("graphics/map_objects/pics/misc/fossil.4bpp");
const u32 gMapObjectPic_SubmarineShadow[] = INCBIN_U32("graphics/map_objects/pics/misc/submarine_shadow.4bpp");
const u16 gMapObjectPalette26[] = INCBIN_U16("graphics/map_objects/palettes/26.gbapal");
const u32 gMapObjectPic_Truck[] = INCBIN_U32("graphics/map_objects/pics/misc/truck.4bpp");
const u16 gMapObjectPalette14[] = INCBIN_U16("graphics/map_objects/palettes/14.gbapal");
const u32 gMapObjectPic_MachokeCarryingBox_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/machoke_carrying_box/0.4bpp");
const u32 gMapObjectPic_MachokeCarryingBox_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/machoke_carrying_box/1.4bpp");
const u32 gMapObjectPic_MachokeCarryingBox_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/machoke_carrying_box/2.4bpp");
const u32 gMapObjectPic_MachokeFacingAway_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/machoke_facing_away/0.4bpp");
const u32 gMapObjectPic_MachokeFacingAway_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/machoke_facing_away/1.4bpp");
const u16 gMapObjectPalette15[] = INCBIN_U16("graphics/map_objects/palettes/15.gbapal");
const u32 gMapObjectPic_BirchsBag[] = INCBIN_U32("graphics/map_objects/pics/misc/birchs_bag.4bpp");
const u32 gMapObjectPic_Poochyena_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/0.4bpp");
const u32 gMapObjectPic_Poochyena_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/1.4bpp");
const u32 gMapObjectPic_Poochyena_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/2.4bpp");
const u32 gMapObjectPic_Poochyena_3[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/3.4bpp");
const u32 gMapObjectPic_Poochyena_4[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/4.4bpp");
const u32 gMapObjectPic_Poochyena_5[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/5.4bpp");
const u32 gMapObjectPic_Poochyena_6[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/6.4bpp");
const u32 gMapObjectPic_Poochyena_7[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/7.4bpp");
const u32 gMapObjectPic_Poochyena_8[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/8.4bpp");
const u16 gMapObjectPalette16[] = INCBIN_U16("graphics/map_objects/palettes/16.gbapal");
const u32 gMapObjectPic_CableCar[] = INCBIN_U32("graphics/map_objects/pics/misc/cable_car.4bpp");
const u16 gMapObjectPalette20[] = INCBIN_U16("graphics/map_objects/palettes/20.gbapal");
const u32 gMapObjectPic_SSTidal[] = INCBIN_U32("graphics/map_objects/pics/misc/ss_tidal.4bpp");
const u16 gMapObjectPalette21[] = INCBIN_U16("graphics/map_objects/palettes/21.gbapal");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_0[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/0.4bpp");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_1[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/1.4bpp");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_2[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/2.4bpp");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_3[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/3.4bpp");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_4[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/4.4bpp");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_5[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/5.4bpp");
const u32 gMapObjectPic_BerryTreeDirtPile[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/dirt_pile.4bpp");
const u32 gMapObjectPic_BerryTreeSprout_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sprout/0.4bpp");
const u32 gMapObjectPic_BerryTreeSprout_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sprout/1.4bpp");
const u32 gMapObjectPic_PechaBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/0.4bpp");
const u32 gMapObjectPic_PechaBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/1.4bpp");
const u32 gMapObjectPic_PechaBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/2.4bpp");
const u32 gMapObjectPic_PechaBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/3.4bpp");
const u32 gMapObjectPic_PechaBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/4.4bpp");
const u32 gMapObjectPic_PechaBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/5.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/0.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/1.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/2.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/3.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/4.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/5.4bpp");
const u32 gMapObjectPic_WepearBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/0.4bpp");
const u32 gMapObjectPic_WepearBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/1.4bpp");
const u32 gMapObjectPic_WepearBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/2.4bpp");
const u32 gMapObjectPic_WepearBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/3.4bpp");
const u32 gMapObjectPic_WepearBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/4.4bpp");
const u32 gMapObjectPic_WepearBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/5.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/0.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/1.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/2.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/3.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/4.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/5.4bpp");
const u32 gMapObjectPic_CheriBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/0.4bpp");
const u32 gMapObjectPic_CheriBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/1.4bpp");
const u32 gMapObjectPic_CheriBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/2.4bpp");
const u32 gMapObjectPic_CheriBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/3.4bpp");
const u32 gMapObjectPic_CheriBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/4.4bpp");
const u32 gMapObjectPic_CheriBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/5.4bpp");
const u32 gMapObjectPic_FigyBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/0.4bpp");
const u32 gMapObjectPic_FigyBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/1.4bpp");
const u32 gMapObjectPic_FigyBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/2.4bpp");
const u32 gMapObjectPic_FigyBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/3.4bpp");
const u32 gMapObjectPic_FigyBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/4.4bpp");
const u32 gMapObjectPic_FigyBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/5.4bpp");
const u32 gMapObjectPic_MagoBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/0.4bpp");
const u32 gMapObjectPic_MagoBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/1.4bpp");
const u32 gMapObjectPic_MagoBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/2.4bpp");
const u32 gMapObjectPic_MagoBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/3.4bpp");
const u32 gMapObjectPic_MagoBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/4.4bpp");
const u32 gMapObjectPic_MagoBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/5.4bpp");
const u32 gMapObjectPic_LumBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/0.4bpp");
const u32 gMapObjectPic_LumBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/1.4bpp");
const u32 gMapObjectPic_LumBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/2.4bpp");
const u32 gMapObjectPic_LumBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/3.4bpp");
const u32 gMapObjectPic_LumBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/4.4bpp");
const u32 gMapObjectPic_LumBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/5.4bpp");
const u32 gMapObjectPic_RazzBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/0.4bpp");
const u32 gMapObjectPic_RazzBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/1.4bpp");
const u32 gMapObjectPic_RazzBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/2.4bpp");
const u32 gMapObjectPic_RazzBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/3.4bpp");
const u32 gMapObjectPic_RazzBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/4.4bpp");
const u32 gMapObjectPic_RazzBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/5.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/0.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/1.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/2.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/3.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/4.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/5.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/0.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/1.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/2.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/3.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/4.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/5.4bpp");
const u32 gMapObjectPic_NomelBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/0.4bpp");
const u32 gMapObjectPic_NomelBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/1.4bpp");
const u32 gMapObjectPic_NomelBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/2.4bpp");
const u32 gMapObjectPic_NomelBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/3.4bpp");
const u32 gMapObjectPic_NomelBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/4.4bpp");
const u32 gMapObjectPic_NomelBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/5.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/0.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/1.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/2.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/3.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/4.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/5.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/0.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/1.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/2.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/3.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/4.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/5.4bpp");
const u32 gMapObjectPic_HondewBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/0.4bpp");
const u32 gMapObjectPic_HondewBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/1.4bpp");
const u32 gMapObjectPic_HondewBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/2.4bpp");
const u32 gMapObjectPic_HondewBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/3.4bpp");
const u32 gMapObjectPic_HondewBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/4.4bpp");
const u32 gMapObjectPic_HondewBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/5.4bpp");
const u32 gMapObjectPic_AguavBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/0.4bpp");
const u32 gMapObjectPic_AguavBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/1.4bpp");
const u32 gMapObjectPic_AguavBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/2.4bpp");
const u32 gMapObjectPic_AguavBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/3.4bpp");
const u32 gMapObjectPic_AguavBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/4.4bpp");
const u32 gMapObjectPic_AguavBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/5.4bpp");
const u32 gMapObjectPic_WikiBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/0.4bpp");
const u32 gMapObjectPic_WikiBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/1.4bpp");
const u32 gMapObjectPic_WikiBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/2.4bpp");
const u32 gMapObjectPic_WikiBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/3.4bpp");
const u32 gMapObjectPic_WikiBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/4.4bpp");
const u32 gMapObjectPic_WikiBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/5.4bpp");
const u32 gMapObjectPic_PomegBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/0.4bpp");
const u32 gMapObjectPic_PomegBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/1.4bpp");
const u32 gMapObjectPic_PomegBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/2.4bpp");
const u32 gMapObjectPic_PomegBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/3.4bpp");
const u32 gMapObjectPic_PomegBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/4.4bpp");
const u32 gMapObjectPic_PomegBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/5.4bpp");
const u32 gMapObjectPic_RawstBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/0.4bpp");
const u32 gMapObjectPic_RawstBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/1.4bpp");
const u32 gMapObjectPic_RawstBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/2.4bpp");
const u32 gMapObjectPic_RawstBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/3.4bpp");
const u32 gMapObjectPic_RawstBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/4.4bpp");
const u32 gMapObjectPic_RawstBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/5.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/0.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/1.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/2.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/3.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/4.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/5.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/0.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/1.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/2.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/3.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/4.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/5.4bpp");
const u32 gMapObjectPic_OranBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/0.4bpp");
const u32 gMapObjectPic_OranBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/1.4bpp");
const u32 gMapObjectPic_OranBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/2.4bpp");
const u32 gMapObjectPic_OranBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/3.4bpp");
const u32 gMapObjectPic_OranBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/4.4bpp");
const u32 gMapObjectPic_OranBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/5.4bpp");
const u32 gMapObjectPic_PersimBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/0.4bpp");
const u32 gMapObjectPic_PersimBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/1.4bpp");
const u32 gMapObjectPic_PersimBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/2.4bpp");
const u32 gMapObjectPic_PersimBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/3.4bpp");
const u32 gMapObjectPic_PersimBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/4.4bpp");
const u32 gMapObjectPic_PersimBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/5.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/0.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/1.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/2.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/3.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/4.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/5.4bpp");
const u32 gMapObjectPic_AspearBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/0.4bpp");
const u32 gMapObjectPic_AspearBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/1.4bpp");
const u32 gMapObjectPic_AspearBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/2.4bpp");
const u32 gMapObjectPic_AspearBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/3.4bpp");
const u32 gMapObjectPic_AspearBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/4.4bpp");
const u32 gMapObjectPic_AspearBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/5.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/0.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/1.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/2.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/3.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/4.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/5.4bpp");
const u32 gMapObjectPic_CornnBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/0.4bpp");
const u32 gMapObjectPic_CornnBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/1.4bpp");
const u32 gMapObjectPic_CornnBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/2.4bpp");
const u32 gMapObjectPic_CornnBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/3.4bpp");
const u32 gMapObjectPic_CornnBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/4.4bpp");
const u32 gMapObjectPic_CornnBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/5.4bpp");
const u32 gMapObjectPic_LansatBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/0.4bpp");
const u32 gMapObjectPic_LansatBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/1.4bpp");
const u32 gMapObjectPic_LansatBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/2.4bpp");
const u32 gMapObjectPic_LansatBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/3.4bpp");
const u32 gMapObjectPic_LansatBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/4.4bpp");
const u32 gMapObjectPic_LansatBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/5.4bpp");
const u32 gMapObjectPic_DurinBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/0.4bpp");
const u32 gMapObjectPic_DurinBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/1.4bpp");
const u32 gMapObjectPic_DurinBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/2.4bpp");
const u32 gMapObjectPic_DurinBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/3.4bpp");
const u32 gMapObjectPic_DurinBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/4.4bpp");
const u32 gMapObjectPic_DurinBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/5.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/0.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/1.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/2.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/3.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/4.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/5.4bpp");
const u32 gFieldEffectPic_SurfBlob_0[] = INCBIN_U32("graphics/field_effect_objects/pics/surf_blob/0.4bpp");
const u32 gFieldEffectPic_SurfBlob_1[] = INCBIN_U32("graphics/field_effect_objects/pics/surf_blob/1.4bpp");
const u32 gFieldEffectPic_SurfBlob_2[] = INCBIN_U32("graphics/field_effect_objects/pics/surf_blob/2.4bpp");
const u32 gMapObjectPic_QuintyPlump_0[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/0.4bpp");
const u32 gMapObjectPic_QuintyPlump_1[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/1.4bpp");
const u32 gMapObjectPic_QuintyPlump_2[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/2.4bpp");
const u32 gMapObjectPic_QuintyPlump_3[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/3.4bpp");
const u32 gMapObjectPic_QuintyPlump_4[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/4.4bpp");
const u32 gMapObjectPic_QuintyPlump_5[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/5.4bpp");
const u32 gMapObjectPic_QuintyPlump_6[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/6.4bpp");
const u16 gMapObjectPalette12[] = INCBIN_U16("graphics/map_objects/palettes/12.gbapal");
const u16 gMapObjectPalette13[] = INCBIN_U16("graphics/map_objects/palettes/13.gbapal");

const u32 gFieldEffectPic_ShadowSmall[] = INCBIN_U32("graphics/field_effect_objects/pics/shadow_small.4bpp");
const u32 gFieldEffectPic_ShadowMedium[] = INCBIN_U32("graphics/field_effect_objects/pics/shadow_medium.4bpp");
const u32 gFieldEffectPic_ShadowLarge[] = INCBIN_U32("graphics/field_effect_objects/pics/shadow_large.4bpp");
const u32 gFieldEffectPic_ShadowExtraLarge[] = INCBIN_U32("graphics/field_effect_objects/pics/shadow_extra_large.4bpp");
const u32 filler_8368A08[0x48] = {};
const u32 gFieldEffectPic_CutGrass[] = INCBIN_U32("graphics/field_effect_objects/pics/cut_grass.4bpp");
const u32 FieldEffectPic_CutGrass_Copy[] = INCBIN_U32("graphics/field_effect_objects/pics/cut_grass.4bpp");
const u16 gFieldEffectObjectPalette6[] = INCBIN_U16("graphics/field_effect_objects/palettes/06.gbapal");
const u32 gFieldEffectPic_Ripple_0[] = INCBIN_U32("graphics/field_effect_objects/pics/ripple/0.4bpp");
const u32 gFieldEffectPic_Ripple_1[] = INCBIN_U32("graphics/field_effect_objects/pics/ripple/1.4bpp");
const u32 gFieldEffectPic_Ripple_2[] = INCBIN_U32("graphics/field_effect_objects/pics/ripple/2.4bpp");
const u32 gFieldEffectPic_Ripple_3[] = INCBIN_U32("graphics/field_effect_objects/pics/ripple/3.4bpp");
const u32 gFieldEffectPic_Ripple_4[] = INCBIN_U32("graphics/field_effect_objects/pics/ripple/4.4bpp");
const u32 gFieldEffectPic_Ash_0[] = INCBIN_U32("graphics/field_effect_objects/pics/ash/0.4bpp");
const u32 gFieldEffectPic_Ash_1[] = INCBIN_U32("graphics/field_effect_objects/pics/ash/1.4bpp");
const u32 gFieldEffectPic_Ash_2[] = INCBIN_U32("graphics/field_effect_objects/pics/ash/2.4bpp");
const u32 gFieldEffectPic_Ash_3[] = INCBIN_U32("graphics/field_effect_objects/pics/ash/3.4bpp");
const u32 gFieldEffectPic_Ash_4[] = INCBIN_U32("graphics/field_effect_objects/pics/ash/4.4bpp");
const u32 gFieldEffectPic_Arrow_0[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/0.4bpp");
const u32 gFieldEffectPic_Arrow_1[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/1.4bpp");
const u32 gFieldEffectPic_Arrow_2[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/2.4bpp");
const u32 gFieldEffectPic_Arrow_3[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/3.4bpp");
const u32 gFieldEffectPic_Arrow_4[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/4.4bpp");
const u32 gFieldEffectPic_Arrow_5[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/5.4bpp");
const u32 gFieldEffectPic_Arrow_6[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/6.4bpp");
const u32 gFieldEffectPic_Arrow_7[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/7.4bpp");
const u16 gFieldEffectObjectPalette0[] = INCBIN_U16("graphics/field_effect_objects/palettes/00.gbapal");
const u16 gFieldEffectObjectPalette1[] = INCBIN_U16("graphics/field_effect_objects/palettes/01.gbapal");
const u32 gFieldEffectPic_Dust_0[] = INCBIN_U32("graphics/field_effect_objects/pics/dust/0.4bpp");
const u32 gFieldEffectPic_Dust_1[] = INCBIN_U32("graphics/field_effect_objects/pics/dust/1.4bpp");
const u32 gFieldEffectPic_Dust_2[] = INCBIN_U32("graphics/field_effect_objects/pics/dust/2.4bpp");
const u32 unknown_8369588[] = INCBIN_U32("graphics/field_effect_objects/unknown.bin");
const u32 gFieldEffectPic_JumpTallGrass_0[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_tall_grass/0.4bpp");
const u32 gFieldEffectPic_JumpTallGrass_1[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_tall_grass/1.4bpp");
const u32 gFieldEffectPic_JumpTallGrass_2[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_tall_grass/2.4bpp");
const u32 gFieldEffectPic_JumpTallGrass_3[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_tall_grass/3.4bpp");
const u32 UnusedGrass0[] = INCBIN_U32("graphics/field_effect_objects/pics/unused_grass/0.4bpp");
const u32 UnusedGrass1[] = INCBIN_U32("graphics/field_effect_objects/pics/unused_grass/1.4bpp");
const u32 UnusedGrass2[] = INCBIN_U32("graphics/field_effect_objects/pics/unused_grass/2.4bpp");
const u32 UnusedGrass3[] = INCBIN_U32("graphics/field_effect_objects/pics/unused_grass/3.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_0[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/0.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_1[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/1.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_2[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/2.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_3[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/3.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_4[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/4.4bpp");
const u32 UnusedGrassLong[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/unused.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_5[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/5.4bpp");
const u32 gFieldEffectPic_Unknown17_0[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/0.4bpp");
const u32 gFieldEffectPic_Unknown17_1[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/1.4bpp");
const u32 gFieldEffectPic_Unknown17_2[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/2.4bpp");
const u32 gFieldEffectPic_Unknown17_3[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/3.4bpp");
const u32 gFieldEffectPic_Unknown17_4[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/4.4bpp");
const u32 gFieldEffectPic_Unknown17_5[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/5.4bpp");
const u32 gFieldEffectPic_Unknown17_6[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/6.4bpp");
const u32 gFieldEffectPic_Unknown17_7[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/7.4bpp");
const u32 gFieldEffectPic_Unknown18_0[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_18/0.4bpp");
const u32 gFieldEffectPic_Unknown18_1[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_18/1.4bpp");
const u32 gFieldEffectPic_Unknown18_2[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_18/2.4bpp");
const u32 gFieldEffectPic_Unknown18_3[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_18/3.4bpp");
const u32 gFieldEffectPic_LongGrass_0[] = INCBIN_U32("graphics/field_effect_objects/pics/long_grass/0.4bpp");
const u32 gFieldEffectPic_LongGrass_1[] = INCBIN_U32("graphics/field_effect_objects/pics/long_grass/1.4bpp");
const u32 gFieldEffectPic_LongGrass_2[] = INCBIN_U32("graphics/field_effect_objects/pics/long_grass/2.4bpp");
const u32 gFieldEffectPic_LongGrass_3[] = INCBIN_U32("graphics/field_effect_objects/pics/long_grass/3.4bpp");
const u32 gFieldEffectPic_TallGrass_0[] = INCBIN_U32("graphics/field_effect_objects/pics/tall_grass/0.4bpp");
const u32 gFieldEffectPic_TallGrass_1[] = INCBIN_U32("graphics/field_effect_objects/pics/tall_grass/1.4bpp");
const u32 gFieldEffectPic_TallGrass_2[] = INCBIN_U32("graphics/field_effect_objects/pics/tall_grass/2.4bpp");
const u32 gFieldEffectPic_TallGrass_3[] = INCBIN_U32("graphics/field_effect_objects/pics/tall_grass/3.4bpp");
const u32 gFieldEffectPic_TallGrass_4[] = INCBIN_U32("graphics/field_effect_objects/pics/tall_grass/4.4bpp");
const u32 gFieldEffectPic_ShortGrass_0[] = INCBIN_U32("graphics/field_effect_objects/pics/short_grass/0.4bpp");
const u32 gFieldEffectPic_ShortGrass_1[] = INCBIN_U32("graphics/field_effect_objects/pics/short_grass/1.4bpp");
const u32 gFieldEffectPic_SandFootprints_0[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_footprints/0.4bpp");
const u32 gFieldEffectPic_SandFootprints_1[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_footprints/1.4bpp");
const u32 gFieldEffectPic_DeepSandFootprints_0[] = INCBIN_U32("graphics/field_effect_objects/pics/deep_sand_footprints/0.4bpp");
const u32 gFieldEffectPic_DeepSandFootprints_1[] = INCBIN_U32("graphics/field_effect_objects/pics/deep_sand_footprints/1.4bpp");
const u32 gFieldEffectPic_BikeTireTracks_0[] = INCBIN_U32("graphics/field_effect_objects/pics/bike_tire_tracks/0.4bpp");
const u32 gFieldEffectPic_BikeTireTracks_1[] = INCBIN_U32("graphics/field_effect_objects/pics/bike_tire_tracks/1.4bpp");
const u32 gFieldEffectPic_BikeTireTracks_2[] = INCBIN_U32("graphics/field_effect_objects/pics/bike_tire_tracks/2.4bpp");
const u32 gFieldEffectPic_BikeTireTracks_3[] = INCBIN_U32("graphics/field_effect_objects/pics/bike_tire_tracks/3.4bpp");
const u32 gFieldEffectPic_Unknown19_0[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_19/0.4bpp");
const u32 gFieldEffectPic_Unknown19_1[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_19/1.4bpp");
const u32 gFieldEffectPic_Unknown19_2[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_19/2.4bpp");
const u32 gFieldEffectPic_Unknown19_3[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_19/3.4bpp");
const u32 gFieldEffectPic_SandPile_0[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_pile/0.4bpp");
const u32 gFieldEffectPic_SandPile_1[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_pile/1.4bpp");
const u32 gFieldEffectPic_SandPile_2[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_pile/2.4bpp");
const u32 gFieldEffectPic_JumpBigSplash_0[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_big_splash/0.4bpp");
const u32 gFieldEffectPic_JumpBigSplash_1[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_big_splash/1.4bpp");
const u32 gFieldEffectPic_JumpBigSplash_2[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_big_splash/2.4bpp");
const u32 gFieldEffectPic_JumpBigSplash_3[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_big_splash/3.4bpp");
const u32 gFieldEffectPic_Splash_0[] = INCBIN_U32("graphics/field_effect_objects/pics/splash/0.4bpp");
const u32 gFieldEffectPic_Splash_1[] = INCBIN_U32("graphics/field_effect_objects/pics/splash/1.4bpp");
const u32 gFieldEffectPic_JumpSmallSplash_0[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_small_splash/0.4bpp");
const u32 gFieldEffectPic_JumpSmallSplash_1[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_small_splash/1.4bpp");
const u32 gFieldEffectPic_JumpSmallSplash_2[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_small_splash/2.4bpp");
const u32 gFieldEffectPic_Unknown20_0[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_20/0.4bpp");
const u32 gFieldEffectPic_Unknown20_1[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_20/1.4bpp");
const u32 gFieldEffectPic_Unknown20_2[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_20/2.4bpp");
const u32 gFieldEffectPic_Unknown20_3[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_20/3.4bpp");
const u32 gFieldEffectPic_Unknown20_4[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_20/4.4bpp");
const u32 gFieldEffectPic_TreeDisguise_0[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/0.4bpp");
const u32 gFieldEffectPic_TreeDisguise_1[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/1.4bpp");
const u32 gFieldEffectPic_TreeDisguise_2[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/2.4bpp");
const u32 gFieldEffectPic_TreeDisguise_3[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/3.4bpp");
const u32 gFieldEffectPic_TreeDisguise_4[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/4.4bpp");
const u32 gFieldEffectPic_TreeDisguise_5[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/5.4bpp");
const u32 gFieldEffectPic_TreeDisguise_6[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/6.4bpp");
const u32 gFieldEffectPic_MountainDisguise_0[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/0.4bpp");
const u32 gFieldEffectPic_MountainDisguise_1[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/1.4bpp");
const u32 gFieldEffectPic_MountainDisguise_2[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/2.4bpp");
const u32 gFieldEffectPic_MountainDisguise_3[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/3.4bpp");
const u32 gFieldEffectPic_MountainDisguise_4[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/4.4bpp");
const u32 gFieldEffectPic_MountainDisguise_5[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/5.4bpp");
const u32 gFieldEffectPic_MountainDisguise_6[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/6.4bpp");
const u32 gFieldEffectPic_SandDisguise_0[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/0.4bpp");
const u32 gFieldEffectPic_SandDisguise_1[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/1.4bpp");
const u32 gFieldEffectPic_SandDisguise_2[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/2.4bpp");
const u32 gFieldEffectPic_SandDisguise_3[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/3.4bpp");
const u32 gFieldEffectPic_SandDisguise_4[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/4.4bpp");
const u32 gFieldEffectPic_SandDisguise_5[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/5.4bpp");
const u32 gFieldEffectPic_SandDisguise_6[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/6.4bpp");
const u32 gFieldEffectPic_HotSpringsWater[] = INCBIN_U32("graphics/field_effect_objects/pics/hot_springs_water.4bpp");
const u16 gFieldEffectObjectPalette2[] = INCBIN_U16("graphics/field_effect_objects/palettes/02.gbapal");
const u32 gFieldEffectPic_PopOutOfAsh_0[] = INCBIN_U32("graphics/field_effect_objects/pics/pop_out_of_ash/0.4bpp");
const u32 gFieldEffectPic_PopOutOfAsh_1[] = INCBIN_U32("graphics/field_effect_objects/pics/pop_out_of_ash/1.4bpp");
const u32 gFieldEffectPic_PopOutOfAsh_2[] = INCBIN_U32("graphics/field_effect_objects/pics/pop_out_of_ash/2.4bpp");
const u32 gFieldEffectPic_PopOutOfAsh_3[] = INCBIN_U32("graphics/field_effect_objects/pics/pop_out_of_ash/3.4bpp");
const u32 gFieldEffectPic_PopOutOfAsh_4[] = INCBIN_U32("graphics/field_effect_objects/pics/pop_out_of_ash/4.4bpp");
const u32 gFieldEffectPic_LavaridgeGymWarp_0[] = INCBIN_U32("graphics/field_effect_objects/pics/lavaridge_gym_warp/0.4bpp");
const u32 gFieldEffectPic_LavaridgeGymWarp_1[] = INCBIN_U32("graphics/field_effect_objects/pics/lavaridge_gym_warp/1.4bpp");
const u32 gFieldEffectPic_LavaridgeGymWarp_2[] = INCBIN_U32("graphics/field_effect_objects/pics/lavaridge_gym_warp/2.4bpp");
const u32 gFieldEffectPic_LavaridgeGymWarp_3[] = INCBIN_U32("graphics/field_effect_objects/pics/lavaridge_gym_warp/3.4bpp");
const u32 gFieldEffectPic_LavaridgeGymWarp_4[] = INCBIN_U32("graphics/field_effect_objects/pics/lavaridge_gym_warp/4.4bpp");
const u32 gFieldEffectPic_Bubbles_0[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/0.4bpp");
const u32 gFieldEffectPic_Bubbles_1[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/1.4bpp");
const u32 gFieldEffectPic_Bubbles_2[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/2.4bpp");
const u32 gFieldEffectPic_Bubbles_3[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/3.4bpp");
const u32 gFieldEffectPic_Bubbles_4[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/4.4bpp");
const u32 gFieldEffectPic_Bubbles_5[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/5.4bpp");
const u32 gFieldEffectPic_Bubbles_6[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/6.4bpp");
const u32 gFieldEffectPic_Bubbles_7[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/7.4bpp");
const u32 gFieldEffectPic_Sparkle_0[] = INCBIN_U32("graphics/field_effect_objects/pics/sparkle/0.4bpp");
const u32 gFieldEffectPic_Sparkle_1[] = INCBIN_U32("graphics/field_effect_objects/pics/sparkle/1.4bpp");
const u16 gFieldEffectObjectPalette3[] = INCBIN_U16("graphics/field_effect_objects/palettes/03.gbapal");
const u32 gFieldEffectPic_Bird[] = INCBIN_U32("graphics/field_effect_objects/pics/bird.4bpp");

void (*const gUnknown_0836DA88[])(struct Sprite *) =
{
    sub_805C884,
    sub_805CDE8,
    sub_805C8AC,
    sub_805CF28,
    sub_805CF28,
    sub_805D0AC,
    sub_805D0AC,
    sub_805D230,
    sub_805D230,
    sub_805D230,
    sub_805D230,
    sub_80587B4,
    FieldObjectCB_BerryTree,
    sub_805D4F4,
    sub_805D634,
    sub_805D774,
    sub_805D8B4,
    sub_805D9F4,
    sub_805DB34,
    sub_805DC74,
    sub_805DDB4,
    sub_805DEF4,
    sub_805E034,
    sub_805E174,
    sub_805E278,
    sub_805E37C,
    sub_805E37C,
    sub_805E37C,
    sub_805E37C,
    sub_805E5DC,
    sub_805E668,
    sub_805E6F4,
    sub_805E780,
    sub_805E80C,
    sub_805E898,
    sub_805E924,
    sub_805E9B0,
    sub_805EA3C,
    sub_805EAC8,
    sub_805EB54,
    sub_805EBE0,
    sub_805EC6C,
    sub_805ECF8,
    sub_805ED84,
    sub_805EE10,
    sub_805EE9C,
    sub_805EF28,
    sub_805EFB4,
    sub_805F040,
    sub_805F0CC,
    sub_805F158,
    sub_805F1E4,
    sub_805F270,
    sub_805F2FC,
    sub_805F2FC,
    sub_805F2FC,
    sub_805F2FC,
    FieldObjectCB_TreeDisguise,
    FieldObjectCB_MountainDisguise,
    sub_805F8E0,
    sub_805F8E0,
    sub_805F8E0,
    sub_805F8E0,
    FieldObjectCB_Hidden1,
    sub_805FB20,
    sub_805FB20,
    sub_805FB20,
    sub_805FB20,
    sub_805FB90,
    sub_805FB90,
    sub_805FB90,
    sub_805FB90,
    sub_805FC00,
    sub_805FC00,
    sub_805FC00,
    sub_805FC00,
    sub_805FC70
};

const u8 gUnknown_0836DBBC[] = {0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
const u8 gUnknown_0836DC09[] = {DIR_SOUTH, DIR_SOUTH, DIR_SOUTH, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_SOUTH, DIR_SOUTH, DIR_WEST, DIR_NORTH, DIR_NORTH, DIR_SOUTH, DIR_SOUTH, DIR_SOUTH, DIR_SOUTH, DIR_NORTH, DIR_SOUTH, DIR_SOUTH, DIR_SOUTH, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_EAST, DIR_SOUTH, DIR_WEST, DIR_NORTH, DIR_WEST, DIR_SOUTH, DIR_EAST, DIR_WEST, DIR_NORTH, DIR_EAST, DIR_SOUTH, DIR_EAST, DIR_NORTH, DIR_WEST, DIR_SOUTH, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_SOUTH, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_SOUTH, DIR_NORTH, DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_NORTH, DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_NORTH, DIR_WEST, DIR_EAST, DIR_SOUTH};

# 1 "src/field/../data/field_map_obj/map_object_graphics_info_pointers.h" 1







const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanNormal;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanMachBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanSurfing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanFieldMove;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_QuintyPlump;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleGirl1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleGirl2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy3;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl3;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy4;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_FatMan;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman3;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldMan1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldWoman1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman4;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man3;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman5;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Cook;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman6;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldMan2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldWoman2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Camper;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Picnicker;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man4;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman7;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Youngster;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BugCatcher;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PsychicM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SchoolKidM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Maniac;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_HexManiac;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman8;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwimmerM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwimmerF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BlackBelt;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Beauty;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Scientist1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Lass;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Gentleman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Sailor;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Fisherman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RunningTriathleteM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RunningTriathleteF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Hiker;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyclingTriathleteM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyclingTriathleteF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Nurse;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ItemBall;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTree;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTreeEarlyStages;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTreeLateStages;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanAcroBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ProfBirch;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man5;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man6;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ReporterM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ReporterF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Bard;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Hipster;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Trader;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Storyteller;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Giddy;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMauvilleOldMan1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMauvilleOldMan2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedNatuDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMagnemiteDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedSquirtleDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedWooperDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedPikachuDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedPorygon2Doll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CuttableTree;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MartEmployee;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RooftopSaleWoman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Teala;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BreakableRock;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PushableBoulder;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MrBrineysBoat;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayNormal;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayMachBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayAcroBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MaySurfing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayFieldMove;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Truck;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MachokeCarryingBox;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MachokeFacingAway;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BirchsBag;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Poochyena;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Artist;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanNormal;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanMachBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanAcroBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanSurfing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanFieldMove;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayNormal;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayMachBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayAcroBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMaySurfing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayFieldMove;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Cameraman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanUnderwater;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayUnderwater;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MovingBox;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CableCar;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Scientist2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man7;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AquaMemberM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AquaMemberF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MagmaMemberM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MagmaMemberF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Sidney;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Phoebe;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Glacia;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Drake;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Roxanne;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Brawly;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wattson;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Flannery;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Norman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Winona;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Liza;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Tate;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wallace;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Steven;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wally;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy3;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanFishing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayFishing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_HotSpringsOldWoman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SSTidal;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SubmarineShadow;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PichuDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PikachuDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MarillDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TogepiDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyndaquilDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ChikoritaDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TotodileDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_JigglypuffDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MeowthDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ClefairyDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DittoDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SmoochumDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TreeckoDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TorchicDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MudkipDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DuskullDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_WynautDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BaltoyDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_KecleonDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AzurillDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SkittyDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwabluDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_GulpinDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LotadDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SeedotDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PikaCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RoundCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_KissCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ZigzagCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SpinCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DiamondCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BallCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_GrassCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_FireCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_WaterCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigSnorlaxDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRhydonDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigLaprasDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigVenusaurDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigCharizardDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigBlastoiseDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigWailmerDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegirockDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegiceDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegisteelDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Latias;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Latios;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy5;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ContestJudge;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanWatering;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayWatering;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanDecorating;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayDecorating;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Archie;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Maxie;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kyogre1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Groudon1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Fossil;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Regirock;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Regice;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Registeel;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Skitty;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kecleon1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kyogre2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Groudon2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Rayquaza;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Zigzagoon;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Pikachu;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Azumarill;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wingull;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kecleon2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberMSwimming;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Azurill;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Mom;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LinkBrendan;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LinkMay;

const struct MapObjectGraphicsInfo *const gMapObjectGraphicsInfoPointers[] = {
    &gMapObjectGraphicsInfo_BrendanNormal,
    &gMapObjectGraphicsInfo_BrendanMachBike,
    &gMapObjectGraphicsInfo_BrendanSurfing,
    &gMapObjectGraphicsInfo_BrendanFieldMove,
    &gMapObjectGraphicsInfo_QuintyPlump,
    &gMapObjectGraphicsInfo_LittleBoy1,
    &gMapObjectGraphicsInfo_LittleGirl1,
    &gMapObjectGraphicsInfo_Boy1,
    &gMapObjectGraphicsInfo_Girl1,
    &gMapObjectGraphicsInfo_Boy2,
    &gMapObjectGraphicsInfo_Girl2,
    &gMapObjectGraphicsInfo_LittleBoy2,
    &gMapObjectGraphicsInfo_LittleGirl2,
    &gMapObjectGraphicsInfo_Boy3,
    &gMapObjectGraphicsInfo_Girl3,
    &gMapObjectGraphicsInfo_Boy4,
    &gMapObjectGraphicsInfo_Woman1,
    &gMapObjectGraphicsInfo_FatMan,
    &gMapObjectGraphicsInfo_Woman2,
    &gMapObjectGraphicsInfo_Man1,
    &gMapObjectGraphicsInfo_Woman3,
    &gMapObjectGraphicsInfo_OldMan1,
    &gMapObjectGraphicsInfo_OldWoman1,
    &gMapObjectGraphicsInfo_Man2,
    &gMapObjectGraphicsInfo_Woman4,
    &gMapObjectGraphicsInfo_Man3,
    &gMapObjectGraphicsInfo_Woman5,
    &gMapObjectGraphicsInfo_Cook,
    &gMapObjectGraphicsInfo_Woman6,
    &gMapObjectGraphicsInfo_OldMan2,
    &gMapObjectGraphicsInfo_OldWoman2,
    &gMapObjectGraphicsInfo_Camper,
    &gMapObjectGraphicsInfo_Picnicker,
    &gMapObjectGraphicsInfo_Man4,
    &gMapObjectGraphicsInfo_Woman7,
    &gMapObjectGraphicsInfo_Youngster,
    &gMapObjectGraphicsInfo_BugCatcher,
    &gMapObjectGraphicsInfo_PsychicM,
    &gMapObjectGraphicsInfo_SchoolKidM,
    &gMapObjectGraphicsInfo_Maniac,
    &gMapObjectGraphicsInfo_HexManiac,
    &gMapObjectGraphicsInfo_Woman8,
    &gMapObjectGraphicsInfo_SwimmerM,
    &gMapObjectGraphicsInfo_SwimmerF,
    &gMapObjectGraphicsInfo_BlackBelt,
    &gMapObjectGraphicsInfo_Beauty,
    &gMapObjectGraphicsInfo_Scientist1,
    &gMapObjectGraphicsInfo_Lass,
    &gMapObjectGraphicsInfo_Gentleman,
    &gMapObjectGraphicsInfo_Sailor,
    &gMapObjectGraphicsInfo_Fisherman,
    &gMapObjectGraphicsInfo_RunningTriathleteM,
    &gMapObjectGraphicsInfo_RunningTriathleteF,
    &gMapObjectGraphicsInfo_TuberF,
    &gMapObjectGraphicsInfo_TuberM,
    &gMapObjectGraphicsInfo_Hiker,
    &gMapObjectGraphicsInfo_CyclingTriathleteM,
    &gMapObjectGraphicsInfo_CyclingTriathleteF,
    &gMapObjectGraphicsInfo_Nurse,
    &gMapObjectGraphicsInfo_ItemBall,
    &gMapObjectGraphicsInfo_BerryTree,
    &gMapObjectGraphicsInfo_BerryTreeEarlyStages,
    &gMapObjectGraphicsInfo_BerryTreeLateStages,
    &gMapObjectGraphicsInfo_BrendanAcroBike,
    &gMapObjectGraphicsInfo_ProfBirch,
    &gMapObjectGraphicsInfo_Man5,
    &gMapObjectGraphicsInfo_Man6,
    &gMapObjectGraphicsInfo_ReporterM,
    &gMapObjectGraphicsInfo_ReporterF,
    &gMapObjectGraphicsInfo_Bard,
    &gMapObjectGraphicsInfo_Hipster,
    &gMapObjectGraphicsInfo_Trader,
    &gMapObjectGraphicsInfo_Storyteller,
    &gMapObjectGraphicsInfo_Giddy,
    &gMapObjectGraphicsInfo_UnusedMauvilleOldMan1,
    &gMapObjectGraphicsInfo_UnusedMauvilleOldMan2,
    &gMapObjectGraphicsInfo_UnusedNatuDoll,
    &gMapObjectGraphicsInfo_UnusedMagnemiteDoll,
    &gMapObjectGraphicsInfo_UnusedSquirtleDoll,
    &gMapObjectGraphicsInfo_UnusedWooperDoll,
    &gMapObjectGraphicsInfo_UnusedPikachuDoll,
    &gMapObjectGraphicsInfo_UnusedPorygon2Doll,
    &gMapObjectGraphicsInfo_CuttableTree,
    &gMapObjectGraphicsInfo_MartEmployee,
    &gMapObjectGraphicsInfo_RooftopSaleWoman,
    &gMapObjectGraphicsInfo_Teala,
    &gMapObjectGraphicsInfo_BreakableRock,
    &gMapObjectGraphicsInfo_PushableBoulder,
    &gMapObjectGraphicsInfo_MrBrineysBoat,
    &gMapObjectGraphicsInfo_MayNormal,
    &gMapObjectGraphicsInfo_MayMachBike,
    &gMapObjectGraphicsInfo_MayAcroBike,
    &gMapObjectGraphicsInfo_MaySurfing,
    &gMapObjectGraphicsInfo_MayFieldMove,
    &gMapObjectGraphicsInfo_Truck,
    &gMapObjectGraphicsInfo_MachokeCarryingBox,
    &gMapObjectGraphicsInfo_MachokeFacingAway,
    &gMapObjectGraphicsInfo_BirchsBag,
    &gMapObjectGraphicsInfo_Poochyena,
    &gMapObjectGraphicsInfo_Artist,
    &gMapObjectGraphicsInfo_RivalBrendanNormal,
    &gMapObjectGraphicsInfo_RivalBrendanMachBike,
    &gMapObjectGraphicsInfo_RivalBrendanAcroBike,
    &gMapObjectGraphicsInfo_RivalBrendanSurfing,
    &gMapObjectGraphicsInfo_RivalBrendanFieldMove,
    &gMapObjectGraphicsInfo_RivalMayNormal,
    &gMapObjectGraphicsInfo_RivalMayMachBike,
    &gMapObjectGraphicsInfo_RivalMayAcroBike,
    &gMapObjectGraphicsInfo_RivalMaySurfing,
    &gMapObjectGraphicsInfo_RivalMayFieldMove,
    &gMapObjectGraphicsInfo_Cameraman,
    &gMapObjectGraphicsInfo_BrendanUnderwater,
    &gMapObjectGraphicsInfo_MayUnderwater,
    &gMapObjectGraphicsInfo_MovingBox,
    &gMapObjectGraphicsInfo_CableCar,
    &gMapObjectGraphicsInfo_Scientist2,
    &gMapObjectGraphicsInfo_Man7,
    &gMapObjectGraphicsInfo_AquaMemberM,
    &gMapObjectGraphicsInfo_AquaMemberF,
    &gMapObjectGraphicsInfo_MagmaMemberM,
    &gMapObjectGraphicsInfo_MagmaMemberF,
    &gMapObjectGraphicsInfo_Sidney,
    &gMapObjectGraphicsInfo_Phoebe,
    &gMapObjectGraphicsInfo_Glacia,
    &gMapObjectGraphicsInfo_Drake,
    &gMapObjectGraphicsInfo_Roxanne,
    &gMapObjectGraphicsInfo_Brawly,
    &gMapObjectGraphicsInfo_Wattson,
    &gMapObjectGraphicsInfo_Flannery,
    &gMapObjectGraphicsInfo_Norman,
    &gMapObjectGraphicsInfo_Winona,
    &gMapObjectGraphicsInfo_Liza,
    &gMapObjectGraphicsInfo_Tate,
    &gMapObjectGraphicsInfo_Wallace,
    &gMapObjectGraphicsInfo_Steven,
    &gMapObjectGraphicsInfo_Wally,
    &gMapObjectGraphicsInfo_LittleBoy3,
    &gMapObjectGraphicsInfo_BrendanFishing,
    &gMapObjectGraphicsInfo_MayFishing,
    &gMapObjectGraphicsInfo_HotSpringsOldWoman,
    &gMapObjectGraphicsInfo_SSTidal,
    &gMapObjectGraphicsInfo_SubmarineShadow,
    &gMapObjectGraphicsInfo_PichuDoll,
    &gMapObjectGraphicsInfo_PikachuDoll,
    &gMapObjectGraphicsInfo_MarillDoll,
    &gMapObjectGraphicsInfo_TogepiDoll,
    &gMapObjectGraphicsInfo_CyndaquilDoll,
    &gMapObjectGraphicsInfo_ChikoritaDoll,
    &gMapObjectGraphicsInfo_TotodileDoll,
    &gMapObjectGraphicsInfo_JigglypuffDoll,
    &gMapObjectGraphicsInfo_MeowthDoll,
    &gMapObjectGraphicsInfo_ClefairyDoll,
    &gMapObjectGraphicsInfo_DittoDoll,
    &gMapObjectGraphicsInfo_SmoochumDoll,
    &gMapObjectGraphicsInfo_TreeckoDoll,
    &gMapObjectGraphicsInfo_TorchicDoll,
    &gMapObjectGraphicsInfo_MudkipDoll,
    &gMapObjectGraphicsInfo_DuskullDoll,
    &gMapObjectGraphicsInfo_WynautDoll,
    &gMapObjectGraphicsInfo_BaltoyDoll,
    &gMapObjectGraphicsInfo_KecleonDoll,
    &gMapObjectGraphicsInfo_AzurillDoll,
    &gMapObjectGraphicsInfo_SkittyDoll,
    &gMapObjectGraphicsInfo_SwabluDoll,
    &gMapObjectGraphicsInfo_GulpinDoll,
    &gMapObjectGraphicsInfo_LotadDoll,
    &gMapObjectGraphicsInfo_SeedotDoll,
    &gMapObjectGraphicsInfo_PikaCushion,
    &gMapObjectGraphicsInfo_RoundCushion,
    &gMapObjectGraphicsInfo_KissCushion,
    &gMapObjectGraphicsInfo_ZigzagCushion,
    &gMapObjectGraphicsInfo_SpinCushion,
    &gMapObjectGraphicsInfo_DiamondCushion,
    &gMapObjectGraphicsInfo_BallCushion,
    &gMapObjectGraphicsInfo_GrassCushion,
    &gMapObjectGraphicsInfo_FireCushion,
    &gMapObjectGraphicsInfo_WaterCushion,
    &gMapObjectGraphicsInfo_BigSnorlaxDoll,
    &gMapObjectGraphicsInfo_BigRhydonDoll,
    &gMapObjectGraphicsInfo_BigLaprasDoll,
    &gMapObjectGraphicsInfo_BigVenusaurDoll,
    &gMapObjectGraphicsInfo_BigCharizardDoll,
    &gMapObjectGraphicsInfo_BigBlastoiseDoll,
    &gMapObjectGraphicsInfo_BigWailmerDoll,
    &gMapObjectGraphicsInfo_BigRegirockDoll,
    &gMapObjectGraphicsInfo_BigRegiceDoll,
    &gMapObjectGraphicsInfo_BigRegisteelDoll,
    &gMapObjectGraphicsInfo_Latias,
    &gMapObjectGraphicsInfo_Latios,
    &gMapObjectGraphicsInfo_Boy5,
    &gMapObjectGraphicsInfo_ContestJudge,
    &gMapObjectGraphicsInfo_BrendanWatering,
    &gMapObjectGraphicsInfo_MayWatering,
    &gMapObjectGraphicsInfo_BrendanDecorating,
    &gMapObjectGraphicsInfo_MayDecorating,
    &gMapObjectGraphicsInfo_Archie,
    &gMapObjectGraphicsInfo_Maxie,
    &gMapObjectGraphicsInfo_Kyogre1,
    &gMapObjectGraphicsInfo_Groudon1,
    &gMapObjectGraphicsInfo_Fossil,
    &gMapObjectGraphicsInfo_Regirock,
    &gMapObjectGraphicsInfo_Regice,
    &gMapObjectGraphicsInfo_Registeel,
    &gMapObjectGraphicsInfo_Skitty,
    &gMapObjectGraphicsInfo_Kecleon1,
    &gMapObjectGraphicsInfo_Kyogre2,
    &gMapObjectGraphicsInfo_Groudon2,
    &gMapObjectGraphicsInfo_Rayquaza,
    &gMapObjectGraphicsInfo_Zigzagoon,
    &gMapObjectGraphicsInfo_Pikachu,
    &gMapObjectGraphicsInfo_Azumarill,
    &gMapObjectGraphicsInfo_Wingull,
    &gMapObjectGraphicsInfo_Kecleon2,
    &gMapObjectGraphicsInfo_TuberMSwimming,
    &gMapObjectGraphicsInfo_Azurill,
    &gMapObjectGraphicsInfo_Mom,
    &gMapObjectGraphicsInfo_LinkBrendan,
    &gMapObjectGraphicsInfo_LinkMay
};
# 1582 "src/field/field_map_obj.c" 2
# 1 "src/field/../data/field_map_obj/field_effect_object_template_pointers.h" 1







const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowSmall;
const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowMedium;
const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowLarge;
const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowExtraLarge;
const struct SpriteTemplate gFieldEffectSpriteTemplate_TallGrass;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Ripple;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Ash;
const struct SpriteTemplate gFieldEffectSpriteTemplate_SurfBlob;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Arrow;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Dust;
const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpTallGrass;
const struct SpriteTemplate gFieldEffectSpriteTemplate_SandFootprints;
const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpBigSplash;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Splash;
const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpSmallSplash;
const struct SpriteTemplate gFieldEffectSpriteTemplate_LongGrass;
const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpLongGrass;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown17;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown18;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown19;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown20;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown21;
const struct SpriteTemplate gFieldEffectSpriteTemplate_BerryTreeGrowthSparkle;
const struct SpriteTemplate gFieldEffectSpriteTemplate_DeepSandFootprints;
const struct SpriteTemplate gFieldEffectSpriteTemplate_TreeDisguise;
const struct SpriteTemplate gFieldEffectSpriteTemplate_MountainDisguise;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Bird;
const struct SpriteTemplate gFieldEffectSpriteTemplate_BikeTireTracks;
const struct SpriteTemplate gFieldEffectSpriteTemplate_SandDisguise;
const struct SpriteTemplate gFieldEffectSpriteTemplate_SandPile;
const struct SpriteTemplate gFieldEffectSpriteTemplate_ShortGrass;
const struct SpriteTemplate gFieldEffectSpriteTemplate_HotSpringsWater;
const struct SpriteTemplate gFieldEffectSpriteTemplate_PopOutOfAsh;
const struct SpriteTemplate gFieldEffectSpriteTemplate_LavaridgeGymWarp;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Bubbles;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Sparkle;

const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[] = {
    &gFieldEffectSpriteTemplate_ShadowSmall,
    &gFieldEffectSpriteTemplate_ShadowMedium,
    &gFieldEffectSpriteTemplate_ShadowLarge,
    &gFieldEffectSpriteTemplate_ShadowExtraLarge,
    &gFieldEffectSpriteTemplate_TallGrass,
    &gFieldEffectSpriteTemplate_Ripple,
    &gFieldEffectSpriteTemplate_Ash,
    &gFieldEffectSpriteTemplate_SurfBlob,
    &gFieldEffectSpriteTemplate_Arrow,
    &gFieldEffectSpriteTemplate_Dust,
    &gFieldEffectSpriteTemplate_JumpTallGrass,
    &gFieldEffectSpriteTemplate_SandFootprints,
    &gFieldEffectSpriteTemplate_JumpBigSplash,
    &gFieldEffectSpriteTemplate_Splash,
    &gFieldEffectSpriteTemplate_JumpSmallSplash,
    &gFieldEffectSpriteTemplate_LongGrass,
    &gFieldEffectSpriteTemplate_JumpLongGrass,
    &gFieldEffectSpriteTemplate_Unknown17,
    &gFieldEffectSpriteTemplate_Unknown18,
    &gFieldEffectSpriteTemplate_Unknown19,
    &gFieldEffectSpriteTemplate_Unknown20,
    &gFieldEffectSpriteTemplate_Unknown21,
    &gFieldEffectSpriteTemplate_BerryTreeGrowthSparkle,
    &gFieldEffectSpriteTemplate_DeepSandFootprints,
    &gFieldEffectSpriteTemplate_TreeDisguise,
    &gFieldEffectSpriteTemplate_MountainDisguise,
    &gFieldEffectSpriteTemplate_Bird,
    &gFieldEffectSpriteTemplate_BikeTireTracks,
    &gFieldEffectSpriteTemplate_SandDisguise,
    &gFieldEffectSpriteTemplate_SandPile,
    &gFieldEffectSpriteTemplate_ShortGrass,
    &gFieldEffectSpriteTemplate_HotSpringsWater,
    &gFieldEffectSpriteTemplate_PopOutOfAsh,
    &gFieldEffectSpriteTemplate_LavaridgeGymWarp,
    &gFieldEffectSpriteTemplate_Bubbles,
    &gFieldEffectSpriteTemplate_Sparkle
};
# 1583 "src/field/field_map_obj.c" 2
# 1 "src/field/../data/field_map_obj/map_object_pic_tables.h" 1







const struct SpriteFrameImage gMapObjectPicTable_BrendanNormal[] = {
    {.data = (u8 *)gMapObjectPic_BrendanNormal_0, .size = sizeof gMapObjectPic_BrendanNormal_0},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_1, .size = sizeof gMapObjectPic_BrendanNormal_1},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_2, .size = sizeof gMapObjectPic_BrendanNormal_2},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_3, .size = sizeof gMapObjectPic_BrendanNormal_3},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_4, .size = sizeof gMapObjectPic_BrendanNormal_4},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_5, .size = sizeof gMapObjectPic_BrendanNormal_5},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_6, .size = sizeof gMapObjectPic_BrendanNormal_6},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_7, .size = sizeof gMapObjectPic_BrendanNormal_7},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_8, .size = sizeof gMapObjectPic_BrendanNormal_8},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_9, .size = sizeof gMapObjectPic_BrendanNormal_9},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_10, .size = sizeof gMapObjectPic_BrendanNormal_10},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_11, .size = sizeof gMapObjectPic_BrendanNormal_11},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_12, .size = sizeof gMapObjectPic_BrendanNormal_12},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_13, .size = sizeof gMapObjectPic_BrendanNormal_13},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_14, .size = sizeof gMapObjectPic_BrendanNormal_14},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_15, .size = sizeof gMapObjectPic_BrendanNormal_15},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_16, .size = sizeof gMapObjectPic_BrendanNormal_16},
    {.data = (u8 *)gMapObjectPic_BrendanNormal_17, .size = sizeof gMapObjectPic_BrendanNormal_17}
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanMachBike[] = {
    {.data = (u8 *)gMapObjectPic_BrendanMachBike_0, .size = sizeof gMapObjectPic_BrendanMachBike_0},
    {.data = (u8 *)gMapObjectPic_BrendanMachBike_1, .size = sizeof gMapObjectPic_BrendanMachBike_1},
    {.data = (u8 *)gMapObjectPic_BrendanMachBike_2, .size = sizeof gMapObjectPic_BrendanMachBike_2},
    {.data = (u8 *)gMapObjectPic_BrendanMachBike_3, .size = sizeof gMapObjectPic_BrendanMachBike_3},
    {.data = (u8 *)gMapObjectPic_BrendanMachBike_4, .size = sizeof gMapObjectPic_BrendanMachBike_4},
    {.data = (u8 *)gMapObjectPic_BrendanMachBike_5, .size = sizeof gMapObjectPic_BrendanMachBike_5},
    {.data = (u8 *)gMapObjectPic_BrendanMachBike_6, .size = sizeof gMapObjectPic_BrendanMachBike_6},
    {.data = (u8 *)gMapObjectPic_BrendanMachBike_7, .size = sizeof gMapObjectPic_BrendanMachBike_7},
    {.data = (u8 *)gMapObjectPic_BrendanMachBike_8, .size = sizeof gMapObjectPic_BrendanMachBike_8}
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanAcroBike[] = {
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_0, .size = sizeof gMapObjectPic_BrendanAcroBike_0},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_1, .size = sizeof gMapObjectPic_BrendanAcroBike_1},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_2, .size = sizeof gMapObjectPic_BrendanAcroBike_2},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_3, .size = sizeof gMapObjectPic_BrendanAcroBike_3},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_4, .size = sizeof gMapObjectPic_BrendanAcroBike_4},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_5, .size = sizeof gMapObjectPic_BrendanAcroBike_5},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_6, .size = sizeof gMapObjectPic_BrendanAcroBike_6},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_7, .size = sizeof gMapObjectPic_BrendanAcroBike_7},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_8, .size = sizeof gMapObjectPic_BrendanAcroBike_8},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_9, .size = sizeof gMapObjectPic_BrendanAcroBike_9},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_10, .size = sizeof gMapObjectPic_BrendanAcroBike_10},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_11, .size = sizeof gMapObjectPic_BrendanAcroBike_11},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_12, .size = sizeof gMapObjectPic_BrendanAcroBike_12},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_13, .size = sizeof gMapObjectPic_BrendanAcroBike_13},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_14, .size = sizeof gMapObjectPic_BrendanAcroBike_14},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_15, .size = sizeof gMapObjectPic_BrendanAcroBike_15},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_16, .size = sizeof gMapObjectPic_BrendanAcroBike_16},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_17, .size = sizeof gMapObjectPic_BrendanAcroBike_17},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_18, .size = sizeof gMapObjectPic_BrendanAcroBike_18},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_19, .size = sizeof gMapObjectPic_BrendanAcroBike_19},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_20, .size = sizeof gMapObjectPic_BrendanAcroBike_20},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_21, .size = sizeof gMapObjectPic_BrendanAcroBike_21},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_22, .size = sizeof gMapObjectPic_BrendanAcroBike_22},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_23, .size = sizeof gMapObjectPic_BrendanAcroBike_23},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_24, .size = sizeof gMapObjectPic_BrendanAcroBike_24},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_25, .size = sizeof gMapObjectPic_BrendanAcroBike_25},
    {.data = (u8 *)gMapObjectPic_BrendanAcroBike_26, .size = sizeof gMapObjectPic_BrendanAcroBike_26}
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanSurfing[] = {
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_0, .size = sizeof gMapObjectPic_BrendanSurfing_0},
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_1, .size = sizeof gMapObjectPic_BrendanSurfing_1},
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_2, .size = sizeof gMapObjectPic_BrendanSurfing_2},
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_0, .size = sizeof gMapObjectPic_BrendanSurfing_0},
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_0, .size = sizeof gMapObjectPic_BrendanSurfing_0},
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_1, .size = sizeof gMapObjectPic_BrendanSurfing_1},
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_1, .size = sizeof gMapObjectPic_BrendanSurfing_1},
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_2, .size = sizeof gMapObjectPic_BrendanSurfing_2},
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_2, .size = sizeof gMapObjectPic_BrendanSurfing_2},
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_3, .size = sizeof gMapObjectPic_BrendanSurfing_3},
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_4, .size = sizeof gMapObjectPic_BrendanSurfing_4},
    {.data = (u8 *)gMapObjectPic_BrendanSurfing_5, .size = sizeof gMapObjectPic_BrendanSurfing_5}
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanUnderwater[] = {
    {.data = (u8 *)gMapObjectPic_BrendanUnderwater_0, .size = sizeof gMapObjectPic_BrendanUnderwater_0},
    {.data = (u8 *)gMapObjectPic_BrendanUnderwater_1, .size = sizeof gMapObjectPic_BrendanUnderwater_1},
    {.data = (u8 *)gMapObjectPic_BrendanUnderwater_2, .size = sizeof gMapObjectPic_BrendanUnderwater_2},
    {.data = (u8 *)gMapObjectPic_BrendanUnderwater_0, .size = sizeof gMapObjectPic_BrendanUnderwater_0},
    {.data = (u8 *)gMapObjectPic_BrendanUnderwater_0, .size = sizeof gMapObjectPic_BrendanUnderwater_0},
    {.data = (u8 *)gMapObjectPic_BrendanUnderwater_1, .size = sizeof gMapObjectPic_BrendanUnderwater_1},
    {.data = (u8 *)gMapObjectPic_BrendanUnderwater_1, .size = sizeof gMapObjectPic_BrendanUnderwater_1},
    {.data = (u8 *)gMapObjectPic_BrendanUnderwater_2, .size = sizeof gMapObjectPic_BrendanUnderwater_2},
    {.data = (u8 *)gMapObjectPic_BrendanUnderwater_2, .size = sizeof gMapObjectPic_BrendanUnderwater_2}
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanFieldMove[] = {
    {.data = (u8 *)gMapObjectPic_BrendanFieldMove_0, .size = sizeof gMapObjectPic_BrendanFieldMove_0},
    {.data = (u8 *)gMapObjectPic_BrendanFieldMove_1, .size = sizeof gMapObjectPic_BrendanFieldMove_1},
    {.data = (u8 *)gMapObjectPic_BrendanFieldMove_2, .size = sizeof gMapObjectPic_BrendanFieldMove_2},
    {.data = (u8 *)gMapObjectPic_BrendanFieldMove_3, .size = sizeof gMapObjectPic_BrendanFieldMove_3},
    {.data = (u8 *)gMapObjectPic_BrendanFieldMove_4, .size = sizeof gMapObjectPic_BrendanFieldMove_4}
};

const struct SpriteFrameImage gMapObjectPicTable_QuintyPlump[] = {
    {.data = (u8 *)gMapObjectPic_QuintyPlump_0, .size = sizeof gMapObjectPic_QuintyPlump_0},
    {.data = (u8 *)gMapObjectPic_QuintyPlump_1, .size = sizeof gMapObjectPic_QuintyPlump_1},
    {.data = (u8 *)gMapObjectPic_QuintyPlump_2, .size = sizeof gMapObjectPic_QuintyPlump_2},
    {.data = (u8 *)gMapObjectPic_QuintyPlump_3, .size = sizeof gMapObjectPic_QuintyPlump_3},
    {.data = (u8 *)gMapObjectPic_QuintyPlump_4, .size = sizeof gMapObjectPic_QuintyPlump_4},
    {.data = (u8 *)gMapObjectPic_QuintyPlump_5, .size = sizeof gMapObjectPic_QuintyPlump_5},
    {.data = (u8 *)gMapObjectPic_QuintyPlump_6, .size = sizeof gMapObjectPic_QuintyPlump_6}
};

const struct SpriteFrameImage gMapObjectPicTable_LittleBoy1[] = {
    {.data = (u8 *)gMapObjectPic_LittleBoy1_0, .size = sizeof gMapObjectPic_LittleBoy1_0},
    {.data = (u8 *)gMapObjectPic_LittleBoy1_1, .size = sizeof gMapObjectPic_LittleBoy1_1},
    {.data = (u8 *)gMapObjectPic_LittleBoy1_2, .size = sizeof gMapObjectPic_LittleBoy1_2},
    {.data = (u8 *)gMapObjectPic_LittleBoy1_3, .size = sizeof gMapObjectPic_LittleBoy1_3},
    {.data = (u8 *)gMapObjectPic_LittleBoy1_4, .size = sizeof gMapObjectPic_LittleBoy1_4},
    {.data = (u8 *)gMapObjectPic_LittleBoy1_5, .size = sizeof gMapObjectPic_LittleBoy1_5},
    {.data = (u8 *)gMapObjectPic_LittleBoy1_6, .size = sizeof gMapObjectPic_LittleBoy1_6},
    {.data = (u8 *)gMapObjectPic_LittleBoy1_7, .size = sizeof gMapObjectPic_LittleBoy1_7},
    {.data = (u8 *)gMapObjectPic_LittleBoy1_8, .size = sizeof gMapObjectPic_LittleBoy1_8}
};

const struct SpriteFrameImage gMapObjectPicTable_LittleGirl1[] = {
    {.data = (u8 *)gMapObjectPic_LittleGirl1_0, .size = sizeof gMapObjectPic_LittleGirl1_0},
    {.data = (u8 *)gMapObjectPic_LittleGirl1_1, .size = sizeof gMapObjectPic_LittleGirl1_1},
    {.data = (u8 *)gMapObjectPic_LittleGirl1_2, .size = sizeof gMapObjectPic_LittleGirl1_2},
    {.data = (u8 *)gMapObjectPic_LittleGirl1_3, .size = sizeof gMapObjectPic_LittleGirl1_3},
    {.data = (u8 *)gMapObjectPic_LittleGirl1_4, .size = sizeof gMapObjectPic_LittleGirl1_4},
    {.data = (u8 *)gMapObjectPic_LittleGirl1_5, .size = sizeof gMapObjectPic_LittleGirl1_5},
    {.data = (u8 *)gMapObjectPic_LittleGirl1_6, .size = sizeof gMapObjectPic_LittleGirl1_6},
    {.data = (u8 *)gMapObjectPic_LittleGirl1_7, .size = sizeof gMapObjectPic_LittleGirl1_7},
    {.data = (u8 *)gMapObjectPic_LittleGirl1_8, .size = sizeof gMapObjectPic_LittleGirl1_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Boy1[] = {
    {.data = (u8 *)gMapObjectPic_Boy1_0, .size = sizeof gMapObjectPic_Boy1_0},
    {.data = (u8 *)gMapObjectPic_Boy1_1, .size = sizeof gMapObjectPic_Boy1_1},
    {.data = (u8 *)gMapObjectPic_Boy1_2, .size = sizeof gMapObjectPic_Boy1_2},
    {.data = (u8 *)gMapObjectPic_Boy1_3, .size = sizeof gMapObjectPic_Boy1_3},
    {.data = (u8 *)gMapObjectPic_Boy1_4, .size = sizeof gMapObjectPic_Boy1_4},
    {.data = (u8 *)gMapObjectPic_Boy1_5, .size = sizeof gMapObjectPic_Boy1_5},
    {.data = (u8 *)gMapObjectPic_Boy1_6, .size = sizeof gMapObjectPic_Boy1_6},
    {.data = (u8 *)gMapObjectPic_Boy1_7, .size = sizeof gMapObjectPic_Boy1_7},
    {.data = (u8 *)gMapObjectPic_Boy1_8, .size = sizeof gMapObjectPic_Boy1_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Girl1[] = {
    {.data = (u8 *)gMapObjectPic_Girl1_0, .size = sizeof gMapObjectPic_Girl1_0},
    {.data = (u8 *)gMapObjectPic_Girl1_1, .size = sizeof gMapObjectPic_Girl1_1},
    {.data = (u8 *)gMapObjectPic_Girl1_2, .size = sizeof gMapObjectPic_Girl1_2},
    {.data = (u8 *)gMapObjectPic_Girl1_3, .size = sizeof gMapObjectPic_Girl1_3},
    {.data = (u8 *)gMapObjectPic_Girl1_4, .size = sizeof gMapObjectPic_Girl1_4},
    {.data = (u8 *)gMapObjectPic_Girl1_5, .size = sizeof gMapObjectPic_Girl1_5},
    {.data = (u8 *)gMapObjectPic_Girl1_6, .size = sizeof gMapObjectPic_Girl1_6},
    {.data = (u8 *)gMapObjectPic_Girl1_7, .size = sizeof gMapObjectPic_Girl1_7},
    {.data = (u8 *)gMapObjectPic_Girl1_8, .size = sizeof gMapObjectPic_Girl1_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Boy2[] = {
    {.data = (u8 *)gMapObjectPic_Boy2_0, .size = sizeof gMapObjectPic_Boy2_0},
    {.data = (u8 *)gMapObjectPic_Boy2_1, .size = sizeof gMapObjectPic_Boy2_1},
    {.data = (u8 *)gMapObjectPic_Boy2_2, .size = sizeof gMapObjectPic_Boy2_2},
    {.data = (u8 *)gMapObjectPic_Boy2_3, .size = sizeof gMapObjectPic_Boy2_3},
    {.data = (u8 *)gMapObjectPic_Boy2_4, .size = sizeof gMapObjectPic_Boy2_4},
    {.data = (u8 *)gMapObjectPic_Boy2_5, .size = sizeof gMapObjectPic_Boy2_5},
    {.data = (u8 *)gMapObjectPic_Boy2_6, .size = sizeof gMapObjectPic_Boy2_6},
    {.data = (u8 *)gMapObjectPic_Boy2_7, .size = sizeof gMapObjectPic_Boy2_7},
    {.data = (u8 *)gMapObjectPic_Boy2_8, .size = sizeof gMapObjectPic_Boy2_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Girl2[] = {
    {.data = (u8 *)gMapObjectPic_Girl2_0, .size = sizeof gMapObjectPic_Girl2_0},
    {.data = (u8 *)gMapObjectPic_Girl2_1, .size = sizeof gMapObjectPic_Girl2_1},
    {.data = (u8 *)gMapObjectPic_Girl2_2, .size = sizeof gMapObjectPic_Girl2_2},
    {.data = (u8 *)gMapObjectPic_Girl2_3, .size = sizeof gMapObjectPic_Girl2_3},
    {.data = (u8 *)gMapObjectPic_Girl2_4, .size = sizeof gMapObjectPic_Girl2_4},
    {.data = (u8 *)gMapObjectPic_Girl2_5, .size = sizeof gMapObjectPic_Girl2_5},
    {.data = (u8 *)gMapObjectPic_Girl2_6, .size = sizeof gMapObjectPic_Girl2_6},
    {.data = (u8 *)gMapObjectPic_Girl2_7, .size = sizeof gMapObjectPic_Girl2_7},
    {.data = (u8 *)gMapObjectPic_Girl2_8, .size = sizeof gMapObjectPic_Girl2_8}
};

const struct SpriteFrameImage gMapObjectPicTable_LittleBoy2[] = {
    {.data = (u8 *)gMapObjectPic_LittleBoy2_0, .size = sizeof gMapObjectPic_LittleBoy2_0},
    {.data = (u8 *)gMapObjectPic_LittleBoy2_1, .size = sizeof gMapObjectPic_LittleBoy2_1},
    {.data = (u8 *)gMapObjectPic_LittleBoy2_2, .size = sizeof gMapObjectPic_LittleBoy2_2},
    {.data = (u8 *)gMapObjectPic_LittleBoy2_3, .size = sizeof gMapObjectPic_LittleBoy2_3},
    {.data = (u8 *)gMapObjectPic_LittleBoy2_4, .size = sizeof gMapObjectPic_LittleBoy2_4},
    {.data = (u8 *)gMapObjectPic_LittleBoy2_5, .size = sizeof gMapObjectPic_LittleBoy2_5},
    {.data = (u8 *)gMapObjectPic_LittleBoy2_6, .size = sizeof gMapObjectPic_LittleBoy2_6},
    {.data = (u8 *)gMapObjectPic_LittleBoy2_7, .size = sizeof gMapObjectPic_LittleBoy2_7},
    {.data = (u8 *)gMapObjectPic_LittleBoy2_8, .size = sizeof gMapObjectPic_LittleBoy2_8}
};

const struct SpriteFrameImage gMapObjectPicTable_LittleGirl2[] = {
    {.data = (u8 *)gMapObjectPic_LittleGirl2_0, .size = sizeof gMapObjectPic_LittleGirl2_0},
    {.data = (u8 *)gMapObjectPic_LittleGirl2_1, .size = sizeof gMapObjectPic_LittleGirl2_1},
    {.data = (u8 *)gMapObjectPic_LittleGirl2_2, .size = sizeof gMapObjectPic_LittleGirl2_2},
    {.data = (u8 *)gMapObjectPic_LittleGirl2_3, .size = sizeof gMapObjectPic_LittleGirl2_3},
    {.data = (u8 *)gMapObjectPic_LittleGirl2_4, .size = sizeof gMapObjectPic_LittleGirl2_4},
    {.data = (u8 *)gMapObjectPic_LittleGirl2_5, .size = sizeof gMapObjectPic_LittleGirl2_5},
    {.data = (u8 *)gMapObjectPic_LittleGirl2_6, .size = sizeof gMapObjectPic_LittleGirl2_6},
    {.data = (u8 *)gMapObjectPic_LittleGirl2_7, .size = sizeof gMapObjectPic_LittleGirl2_7},
    {.data = (u8 *)gMapObjectPic_LittleGirl2_8, .size = sizeof gMapObjectPic_LittleGirl2_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Boy3[] = {
    {.data = (u8 *)gMapObjectPic_Boy3_0, .size = sizeof gMapObjectPic_Boy3_0},
    {.data = (u8 *)gMapObjectPic_Boy3_1, .size = sizeof gMapObjectPic_Boy3_1},
    {.data = (u8 *)gMapObjectPic_Boy3_2, .size = sizeof gMapObjectPic_Boy3_2},
    {.data = (u8 *)gMapObjectPic_Boy3_3, .size = sizeof gMapObjectPic_Boy3_3},
    {.data = (u8 *)gMapObjectPic_Boy3_4, .size = sizeof gMapObjectPic_Boy3_4},
    {.data = (u8 *)gMapObjectPic_Boy3_5, .size = sizeof gMapObjectPic_Boy3_5},
    {.data = (u8 *)gMapObjectPic_Boy3_6, .size = sizeof gMapObjectPic_Boy3_6},
    {.data = (u8 *)gMapObjectPic_Boy3_7, .size = sizeof gMapObjectPic_Boy3_7},
    {.data = (u8 *)gMapObjectPic_Boy3_8, .size = sizeof gMapObjectPic_Boy3_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Girl3[] = {
    {.data = (u8 *)gMapObjectPic_Girl3_0, .size = sizeof gMapObjectPic_Girl3_0},
    {.data = (u8 *)gMapObjectPic_Girl3_1, .size = sizeof gMapObjectPic_Girl3_1},
    {.data = (u8 *)gMapObjectPic_Girl3_2, .size = sizeof gMapObjectPic_Girl3_2},
    {.data = (u8 *)gMapObjectPic_Girl3_3, .size = sizeof gMapObjectPic_Girl3_3},
    {.data = (u8 *)gMapObjectPic_Girl3_4, .size = sizeof gMapObjectPic_Girl3_4},
    {.data = (u8 *)gMapObjectPic_Girl3_5, .size = sizeof gMapObjectPic_Girl3_5},
    {.data = (u8 *)gMapObjectPic_Girl3_6, .size = sizeof gMapObjectPic_Girl3_6},
    {.data = (u8 *)gMapObjectPic_Girl3_7, .size = sizeof gMapObjectPic_Girl3_7},
    {.data = (u8 *)gMapObjectPic_Girl3_8, .size = sizeof gMapObjectPic_Girl3_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Boy4[] = {
    {.data = (u8 *)gMapObjectPic_Boy4_0, .size = sizeof gMapObjectPic_Boy4_0},
    {.data = (u8 *)gMapObjectPic_Boy4_1, .size = sizeof gMapObjectPic_Boy4_1},
    {.data = (u8 *)gMapObjectPic_Boy4_2, .size = sizeof gMapObjectPic_Boy4_2},
    {.data = (u8 *)gMapObjectPic_Boy4_3, .size = sizeof gMapObjectPic_Boy4_3},
    {.data = (u8 *)gMapObjectPic_Boy4_4, .size = sizeof gMapObjectPic_Boy4_4},
    {.data = (u8 *)gMapObjectPic_Boy4_5, .size = sizeof gMapObjectPic_Boy4_5},
    {.data = (u8 *)gMapObjectPic_Boy4_6, .size = sizeof gMapObjectPic_Boy4_6},
    {.data = (u8 *)gMapObjectPic_Boy4_7, .size = sizeof gMapObjectPic_Boy4_7},
    {.data = (u8 *)gMapObjectPic_Boy4_8, .size = sizeof gMapObjectPic_Boy4_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Woman1[] = {
    {.data = (u8 *)gMapObjectPic_Woman1_0, .size = sizeof gMapObjectPic_Woman1_0},
    {.data = (u8 *)gMapObjectPic_Woman1_1, .size = sizeof gMapObjectPic_Woman1_1},
    {.data = (u8 *)gMapObjectPic_Woman1_2, .size = sizeof gMapObjectPic_Woman1_2},
    {.data = (u8 *)gMapObjectPic_Woman1_3, .size = sizeof gMapObjectPic_Woman1_3},
    {.data = (u8 *)gMapObjectPic_Woman1_4, .size = sizeof gMapObjectPic_Woman1_4},
    {.data = (u8 *)gMapObjectPic_Woman1_5, .size = sizeof gMapObjectPic_Woman1_5},
    {.data = (u8 *)gMapObjectPic_Woman1_6, .size = sizeof gMapObjectPic_Woman1_6},
    {.data = (u8 *)gMapObjectPic_Woman1_7, .size = sizeof gMapObjectPic_Woman1_7},
    {.data = (u8 *)gMapObjectPic_Woman1_8, .size = sizeof gMapObjectPic_Woman1_8}
};

const struct SpriteFrameImage gMapObjectPicTable_FatMan[] = {
    {.data = (u8 *)gMapObjectPic_FatMan_0, .size = sizeof gMapObjectPic_FatMan_0},
    {.data = (u8 *)gMapObjectPic_FatMan_1, .size = sizeof gMapObjectPic_FatMan_1},
    {.data = (u8 *)gMapObjectPic_FatMan_2, .size = sizeof gMapObjectPic_FatMan_2},
    {.data = (u8 *)gMapObjectPic_FatMan_3, .size = sizeof gMapObjectPic_FatMan_3},
    {.data = (u8 *)gMapObjectPic_FatMan_4, .size = sizeof gMapObjectPic_FatMan_4},
    {.data = (u8 *)gMapObjectPic_FatMan_5, .size = sizeof gMapObjectPic_FatMan_5},
    {.data = (u8 *)gMapObjectPic_FatMan_6, .size = sizeof gMapObjectPic_FatMan_6},
    {.data = (u8 *)gMapObjectPic_FatMan_7, .size = sizeof gMapObjectPic_FatMan_7},
    {.data = (u8 *)gMapObjectPic_FatMan_8, .size = sizeof gMapObjectPic_FatMan_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Woman2[] = {
    {.data = (u8 *)gMapObjectPic_Woman2_0, .size = sizeof gMapObjectPic_Woman2_0},
    {.data = (u8 *)gMapObjectPic_Woman2_1, .size = sizeof gMapObjectPic_Woman2_1},
    {.data = (u8 *)gMapObjectPic_Woman2_2, .size = sizeof gMapObjectPic_Woman2_2},
    {.data = (u8 *)gMapObjectPic_Woman2_3, .size = sizeof gMapObjectPic_Woman2_3},
    {.data = (u8 *)gMapObjectPic_Woman2_4, .size = sizeof gMapObjectPic_Woman2_4},
    {.data = (u8 *)gMapObjectPic_Woman2_5, .size = sizeof gMapObjectPic_Woman2_5},
    {.data = (u8 *)gMapObjectPic_Woman2_6, .size = sizeof gMapObjectPic_Woman2_6},
    {.data = (u8 *)gMapObjectPic_Woman2_7, .size = sizeof gMapObjectPic_Woman2_7},
    {.data = (u8 *)gMapObjectPic_Woman2_8, .size = sizeof gMapObjectPic_Woman2_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Man1[] = {
    {.data = (u8 *)gMapObjectPic_Man1_0, .size = sizeof gMapObjectPic_Man1_0},
    {.data = (u8 *)gMapObjectPic_Man1_1, .size = sizeof gMapObjectPic_Man1_1},
    {.data = (u8 *)gMapObjectPic_Man1_2, .size = sizeof gMapObjectPic_Man1_2},
    {.data = (u8 *)gMapObjectPic_Man1_3, .size = sizeof gMapObjectPic_Man1_3},
    {.data = (u8 *)gMapObjectPic_Man1_4, .size = sizeof gMapObjectPic_Man1_4},
    {.data = (u8 *)gMapObjectPic_Man1_5, .size = sizeof gMapObjectPic_Man1_5},
    {.data = (u8 *)gMapObjectPic_Man1_6, .size = sizeof gMapObjectPic_Man1_6},
    {.data = (u8 *)gMapObjectPic_Man1_7, .size = sizeof gMapObjectPic_Man1_7},
    {.data = (u8 *)gMapObjectPic_Man1_8, .size = sizeof gMapObjectPic_Man1_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Woman3[] = {
    {.data = (u8 *)gMapObjectPic_Woman3_0, .size = sizeof gMapObjectPic_Woman3_0},
    {.data = (u8 *)gMapObjectPic_Woman3_1, .size = sizeof gMapObjectPic_Woman3_1},
    {.data = (u8 *)gMapObjectPic_Woman3_2, .size = sizeof gMapObjectPic_Woman3_2},
    {.data = (u8 *)gMapObjectPic_Woman3_3, .size = sizeof gMapObjectPic_Woman3_3},
    {.data = (u8 *)gMapObjectPic_Woman3_4, .size = sizeof gMapObjectPic_Woman3_4},
    {.data = (u8 *)gMapObjectPic_Woman3_5, .size = sizeof gMapObjectPic_Woman3_5},
    {.data = (u8 *)gMapObjectPic_Woman3_6, .size = sizeof gMapObjectPic_Woman3_6},
    {.data = (u8 *)gMapObjectPic_Woman3_7, .size = sizeof gMapObjectPic_Woman3_7},
    {.data = (u8 *)gMapObjectPic_Woman3_8, .size = sizeof gMapObjectPic_Woman3_8}
};

const struct SpriteFrameImage gMapObjectPicTable_OldMan1[] = {
    {.data = (u8 *)gMapObjectPic_OldMan1_0, .size = sizeof gMapObjectPic_OldMan1_0},
    {.data = (u8 *)gMapObjectPic_OldMan1_1, .size = sizeof gMapObjectPic_OldMan1_1},
    {.data = (u8 *)gMapObjectPic_OldMan1_2, .size = sizeof gMapObjectPic_OldMan1_2},
    {.data = (u8 *)gMapObjectPic_OldMan1_3, .size = sizeof gMapObjectPic_OldMan1_3},
    {.data = (u8 *)gMapObjectPic_OldMan1_4, .size = sizeof gMapObjectPic_OldMan1_4},
    {.data = (u8 *)gMapObjectPic_OldMan1_5, .size = sizeof gMapObjectPic_OldMan1_5},
    {.data = (u8 *)gMapObjectPic_OldMan1_6, .size = sizeof gMapObjectPic_OldMan1_6},
    {.data = (u8 *)gMapObjectPic_OldMan1_7, .size = sizeof gMapObjectPic_OldMan1_7},
    {.data = (u8 *)gMapObjectPic_OldMan1_8, .size = sizeof gMapObjectPic_OldMan1_8}
};

const struct SpriteFrameImage gMapObjectPicTable_OldWoman1[] = {
    {.data = (u8 *)gMapObjectPic_OldWoman1_0, .size = sizeof gMapObjectPic_OldWoman1_0},
    {.data = (u8 *)gMapObjectPic_OldWoman1_1, .size = sizeof gMapObjectPic_OldWoman1_1},
    {.data = (u8 *)gMapObjectPic_OldWoman1_2, .size = sizeof gMapObjectPic_OldWoman1_2},
    {.data = (u8 *)gMapObjectPic_OldWoman1_3, .size = sizeof gMapObjectPic_OldWoman1_3},
    {.data = (u8 *)gMapObjectPic_OldWoman1_4, .size = sizeof gMapObjectPic_OldWoman1_4},
    {.data = (u8 *)gMapObjectPic_OldWoman1_5, .size = sizeof gMapObjectPic_OldWoman1_5},
    {.data = (u8 *)gMapObjectPic_OldWoman1_6, .size = sizeof gMapObjectPic_OldWoman1_6},
    {.data = (u8 *)gMapObjectPic_OldWoman1_7, .size = sizeof gMapObjectPic_OldWoman1_7},
    {.data = (u8 *)gMapObjectPic_OldWoman1_8, .size = sizeof gMapObjectPic_OldWoman1_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Man2[] = {
    {.data = (u8 *)gMapObjectPic_Man2_0, .size = sizeof gMapObjectPic_Man2_0},
    {.data = (u8 *)gMapObjectPic_Man2_1, .size = sizeof gMapObjectPic_Man2_1},
    {.data = (u8 *)gMapObjectPic_Man2_2, .size = sizeof gMapObjectPic_Man2_2},
    {.data = (u8 *)gMapObjectPic_Man2_3, .size = sizeof gMapObjectPic_Man2_3},
    {.data = (u8 *)gMapObjectPic_Man2_4, .size = sizeof gMapObjectPic_Man2_4},
    {.data = (u8 *)gMapObjectPic_Man2_5, .size = sizeof gMapObjectPic_Man2_5},
    {.data = (u8 *)gMapObjectPic_Man2_6, .size = sizeof gMapObjectPic_Man2_6},
    {.data = (u8 *)gMapObjectPic_Man2_7, .size = sizeof gMapObjectPic_Man2_7},
    {.data = (u8 *)gMapObjectPic_Man2_8, .size = sizeof gMapObjectPic_Man2_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Woman4[] = {
    {.data = (u8 *)gMapObjectPic_Woman4_0, .size = sizeof gMapObjectPic_Woman4_0},
    {.data = (u8 *)gMapObjectPic_Woman4_1, .size = sizeof gMapObjectPic_Woman4_1},
    {.data = (u8 *)gMapObjectPic_Woman4_2, .size = sizeof gMapObjectPic_Woman4_2},
    {.data = (u8 *)gMapObjectPic_Woman4_3, .size = sizeof gMapObjectPic_Woman4_3},
    {.data = (u8 *)gMapObjectPic_Woman4_4, .size = sizeof gMapObjectPic_Woman4_4},
    {.data = (u8 *)gMapObjectPic_Woman4_5, .size = sizeof gMapObjectPic_Woman4_5},
    {.data = (u8 *)gMapObjectPic_Woman4_6, .size = sizeof gMapObjectPic_Woman4_6},
    {.data = (u8 *)gMapObjectPic_Woman4_7, .size = sizeof gMapObjectPic_Woman4_7},
    {.data = (u8 *)gMapObjectPic_Woman4_8, .size = sizeof gMapObjectPic_Woman4_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Man3[] = {
    {.data = (u8 *)gMapObjectPic_Man3_0, .size = sizeof gMapObjectPic_Man3_0},
    {.data = (u8 *)gMapObjectPic_Man3_1, .size = sizeof gMapObjectPic_Man3_1},
    {.data = (u8 *)gMapObjectPic_Man3_2, .size = sizeof gMapObjectPic_Man3_2},
    {.data = (u8 *)gMapObjectPic_Man3_3, .size = sizeof gMapObjectPic_Man3_3},
    {.data = (u8 *)gMapObjectPic_Man3_4, .size = sizeof gMapObjectPic_Man3_4},
    {.data = (u8 *)gMapObjectPic_Man3_5, .size = sizeof gMapObjectPic_Man3_5},
    {.data = (u8 *)gMapObjectPic_Man3_6, .size = sizeof gMapObjectPic_Man3_6},
    {.data = (u8 *)gMapObjectPic_Man3_7, .size = sizeof gMapObjectPic_Man3_7},
    {.data = (u8 *)gMapObjectPic_Man3_8, .size = sizeof gMapObjectPic_Man3_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Woman5[] = {
    {.data = (u8 *)gMapObjectPic_Woman5_0, .size = sizeof gMapObjectPic_Woman5_0},
    {.data = (u8 *)gMapObjectPic_Woman5_1, .size = sizeof gMapObjectPic_Woman5_1},
    {.data = (u8 *)gMapObjectPic_Woman5_2, .size = sizeof gMapObjectPic_Woman5_2},
    {.data = (u8 *)gMapObjectPic_Woman5_3, .size = sizeof gMapObjectPic_Woman5_3},
    {.data = (u8 *)gMapObjectPic_Woman5_4, .size = sizeof gMapObjectPic_Woman5_4},
    {.data = (u8 *)gMapObjectPic_Woman5_5, .size = sizeof gMapObjectPic_Woman5_5},
    {.data = (u8 *)gMapObjectPic_Woman5_6, .size = sizeof gMapObjectPic_Woman5_6},
    {.data = (u8 *)gMapObjectPic_Woman5_7, .size = sizeof gMapObjectPic_Woman5_7},
    {.data = (u8 *)gMapObjectPic_Woman5_8, .size = sizeof gMapObjectPic_Woman5_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Cook[] = {
    {.data = (u8 *)gMapObjectPic_Cook_0, .size = sizeof gMapObjectPic_Cook_0},
    {.data = (u8 *)gMapObjectPic_Cook_1, .size = sizeof gMapObjectPic_Cook_1},
    {.data = (u8 *)gMapObjectPic_Cook_2, .size = sizeof gMapObjectPic_Cook_2},
    {.data = (u8 *)gMapObjectPic_Cook_0, .size = sizeof gMapObjectPic_Cook_0},
    {.data = (u8 *)gMapObjectPic_Cook_0, .size = sizeof gMapObjectPic_Cook_0},
    {.data = (u8 *)gMapObjectPic_Cook_1, .size = sizeof gMapObjectPic_Cook_1},
    {.data = (u8 *)gMapObjectPic_Cook_1, .size = sizeof gMapObjectPic_Cook_1},
    {.data = (u8 *)gMapObjectPic_Cook_2, .size = sizeof gMapObjectPic_Cook_2},
    {.data = (u8 *)gMapObjectPic_Cook_2, .size = sizeof gMapObjectPic_Cook_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Woman6[] = {
    {.data = (u8 *)gMapObjectPic_Woman6_0, .size = sizeof gMapObjectPic_Woman6_0},
    {.data = (u8 *)gMapObjectPic_Woman6_1, .size = sizeof gMapObjectPic_Woman6_1},
    {.data = (u8 *)gMapObjectPic_Woman6_2, .size = sizeof gMapObjectPic_Woman6_2},
    {.data = (u8 *)gMapObjectPic_Woman6_3, .size = sizeof gMapObjectPic_Woman6_3},
    {.data = (u8 *)gMapObjectPic_Woman6_4, .size = sizeof gMapObjectPic_Woman6_4},
    {.data = (u8 *)gMapObjectPic_Woman6_5, .size = sizeof gMapObjectPic_Woman6_5},
    {.data = (u8 *)gMapObjectPic_Woman6_6, .size = sizeof gMapObjectPic_Woman6_6},
    {.data = (u8 *)gMapObjectPic_Woman6_7, .size = sizeof gMapObjectPic_Woman6_7},
    {.data = (u8 *)gMapObjectPic_Woman6_8, .size = sizeof gMapObjectPic_Woman6_8}
};

const struct SpriteFrameImage gMapObjectPicTable_OldMan2[] = {
    {.data = (u8 *)gMapObjectPic_OldMan2_0, .size = sizeof gMapObjectPic_OldMan2_0},
    {.data = (u8 *)gMapObjectPic_OldMan2_1, .size = sizeof gMapObjectPic_OldMan2_1},
    {.data = (u8 *)gMapObjectPic_OldMan2_2, .size = sizeof gMapObjectPic_OldMan2_2},
    {.data = (u8 *)gMapObjectPic_OldMan2_0, .size = sizeof gMapObjectPic_OldMan2_0},
    {.data = (u8 *)gMapObjectPic_OldMan2_0, .size = sizeof gMapObjectPic_OldMan2_0},
    {.data = (u8 *)gMapObjectPic_OldMan2_1, .size = sizeof gMapObjectPic_OldMan2_1},
    {.data = (u8 *)gMapObjectPic_OldMan2_1, .size = sizeof gMapObjectPic_OldMan2_1},
    {.data = (u8 *)gMapObjectPic_OldMan2_2, .size = sizeof gMapObjectPic_OldMan2_2},
    {.data = (u8 *)gMapObjectPic_OldMan2_2, .size = sizeof gMapObjectPic_OldMan2_2}
};

const struct SpriteFrameImage gMapObjectPicTable_OldWoman2[] = {
    {.data = (u8 *)gMapObjectPic_OldWoman2_0, .size = sizeof gMapObjectPic_OldWoman2_0},
    {.data = (u8 *)gMapObjectPic_OldWoman2_1, .size = sizeof gMapObjectPic_OldWoman2_1},
    {.data = (u8 *)gMapObjectPic_OldWoman2_2, .size = sizeof gMapObjectPic_OldWoman2_2},
    {.data = (u8 *)gMapObjectPic_OldWoman2_0, .size = sizeof gMapObjectPic_OldWoman2_0},
    {.data = (u8 *)gMapObjectPic_OldWoman2_0, .size = sizeof gMapObjectPic_OldWoman2_0},
    {.data = (u8 *)gMapObjectPic_OldWoman2_1, .size = sizeof gMapObjectPic_OldWoman2_1},
    {.data = (u8 *)gMapObjectPic_OldWoman2_1, .size = sizeof gMapObjectPic_OldWoman2_1},
    {.data = (u8 *)gMapObjectPic_OldWoman2_2, .size = sizeof gMapObjectPic_OldWoman2_2},
    {.data = (u8 *)gMapObjectPic_OldWoman2_2, .size = sizeof gMapObjectPic_OldWoman2_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Camper[] = {
    {.data = (u8 *)gMapObjectPic_Camper_0, .size = sizeof gMapObjectPic_Camper_0},
    {.data = (u8 *)gMapObjectPic_Camper_1, .size = sizeof gMapObjectPic_Camper_1},
    {.data = (u8 *)gMapObjectPic_Camper_2, .size = sizeof gMapObjectPic_Camper_2},
    {.data = (u8 *)gMapObjectPic_Camper_3, .size = sizeof gMapObjectPic_Camper_3},
    {.data = (u8 *)gMapObjectPic_Camper_4, .size = sizeof gMapObjectPic_Camper_4},
    {.data = (u8 *)gMapObjectPic_Camper_5, .size = sizeof gMapObjectPic_Camper_5},
    {.data = (u8 *)gMapObjectPic_Camper_6, .size = sizeof gMapObjectPic_Camper_6},
    {.data = (u8 *)gMapObjectPic_Camper_7, .size = sizeof gMapObjectPic_Camper_7},
    {.data = (u8 *)gMapObjectPic_Camper_8, .size = sizeof gMapObjectPic_Camper_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Picnicker[] = {
    {.data = (u8 *)gMapObjectPic_Picnicker_0, .size = sizeof gMapObjectPic_Picnicker_0},
    {.data = (u8 *)gMapObjectPic_Picnicker_1, .size = sizeof gMapObjectPic_Picnicker_1},
    {.data = (u8 *)gMapObjectPic_Picnicker_2, .size = sizeof gMapObjectPic_Picnicker_2},
    {.data = (u8 *)gMapObjectPic_Picnicker_3, .size = sizeof gMapObjectPic_Picnicker_3},
    {.data = (u8 *)gMapObjectPic_Picnicker_4, .size = sizeof gMapObjectPic_Picnicker_4},
    {.data = (u8 *)gMapObjectPic_Picnicker_5, .size = sizeof gMapObjectPic_Picnicker_5},
    {.data = (u8 *)gMapObjectPic_Picnicker_6, .size = sizeof gMapObjectPic_Picnicker_6},
    {.data = (u8 *)gMapObjectPic_Picnicker_7, .size = sizeof gMapObjectPic_Picnicker_7},
    {.data = (u8 *)gMapObjectPic_Picnicker_8, .size = sizeof gMapObjectPic_Picnicker_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Man4[] = {
    {.data = (u8 *)gMapObjectPic_Man4_0, .size = sizeof gMapObjectPic_Man4_0},
    {.data = (u8 *)gMapObjectPic_Man4_1, .size = sizeof gMapObjectPic_Man4_1},
    {.data = (u8 *)gMapObjectPic_Man4_2, .size = sizeof gMapObjectPic_Man4_2},
    {.data = (u8 *)gMapObjectPic_Man4_3, .size = sizeof gMapObjectPic_Man4_3},
    {.data = (u8 *)gMapObjectPic_Man4_4, .size = sizeof gMapObjectPic_Man4_4},
    {.data = (u8 *)gMapObjectPic_Man4_5, .size = sizeof gMapObjectPic_Man4_5},
    {.data = (u8 *)gMapObjectPic_Man4_6, .size = sizeof gMapObjectPic_Man4_6},
    {.data = (u8 *)gMapObjectPic_Man4_7, .size = sizeof gMapObjectPic_Man4_7},
    {.data = (u8 *)gMapObjectPic_Man4_8, .size = sizeof gMapObjectPic_Man4_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Woman7[] = {
    {.data = (u8 *)gMapObjectPic_Woman7_0, .size = sizeof gMapObjectPic_Woman7_0},
    {.data = (u8 *)gMapObjectPic_Woman7_1, .size = sizeof gMapObjectPic_Woman7_1},
    {.data = (u8 *)gMapObjectPic_Woman7_2, .size = sizeof gMapObjectPic_Woman7_2},
    {.data = (u8 *)gMapObjectPic_Woman7_3, .size = sizeof gMapObjectPic_Woman7_3},
    {.data = (u8 *)gMapObjectPic_Woman7_4, .size = sizeof gMapObjectPic_Woman7_4},
    {.data = (u8 *)gMapObjectPic_Woman7_5, .size = sizeof gMapObjectPic_Woman7_5},
    {.data = (u8 *)gMapObjectPic_Woman7_6, .size = sizeof gMapObjectPic_Woman7_6},
    {.data = (u8 *)gMapObjectPic_Woman7_7, .size = sizeof gMapObjectPic_Woman7_7},
    {.data = (u8 *)gMapObjectPic_Woman7_8, .size = sizeof gMapObjectPic_Woman7_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Youngster[] = {
    {.data = (u8 *)gMapObjectPic_Youngster_0, .size = sizeof gMapObjectPic_Youngster_0},
    {.data = (u8 *)gMapObjectPic_Youngster_1, .size = sizeof gMapObjectPic_Youngster_1},
    {.data = (u8 *)gMapObjectPic_Youngster_2, .size = sizeof gMapObjectPic_Youngster_2},
    {.data = (u8 *)gMapObjectPic_Youngster_3, .size = sizeof gMapObjectPic_Youngster_3},
    {.data = (u8 *)gMapObjectPic_Youngster_4, .size = sizeof gMapObjectPic_Youngster_4},
    {.data = (u8 *)gMapObjectPic_Youngster_5, .size = sizeof gMapObjectPic_Youngster_5},
    {.data = (u8 *)gMapObjectPic_Youngster_6, .size = sizeof gMapObjectPic_Youngster_6},
    {.data = (u8 *)gMapObjectPic_Youngster_7, .size = sizeof gMapObjectPic_Youngster_7},
    {.data = (u8 *)gMapObjectPic_Youngster_8, .size = sizeof gMapObjectPic_Youngster_8}
};

const struct SpriteFrameImage gMapObjectPicTable_BugCatcher[] = {
    {.data = (u8 *)gMapObjectPic_BugCatcher_0, .size = sizeof gMapObjectPic_BugCatcher_0},
    {.data = (u8 *)gMapObjectPic_BugCatcher_1, .size = sizeof gMapObjectPic_BugCatcher_1},
    {.data = (u8 *)gMapObjectPic_BugCatcher_2, .size = sizeof gMapObjectPic_BugCatcher_2},
    {.data = (u8 *)gMapObjectPic_BugCatcher_3, .size = sizeof gMapObjectPic_BugCatcher_3},
    {.data = (u8 *)gMapObjectPic_BugCatcher_4, .size = sizeof gMapObjectPic_BugCatcher_4},
    {.data = (u8 *)gMapObjectPic_BugCatcher_5, .size = sizeof gMapObjectPic_BugCatcher_5},
    {.data = (u8 *)gMapObjectPic_BugCatcher_6, .size = sizeof gMapObjectPic_BugCatcher_6},
    {.data = (u8 *)gMapObjectPic_BugCatcher_7, .size = sizeof gMapObjectPic_BugCatcher_7},
    {.data = (u8 *)gMapObjectPic_BugCatcher_8, .size = sizeof gMapObjectPic_BugCatcher_8}
};

const struct SpriteFrameImage gMapObjectPicTable_PsychicM[] = {
    {.data = (u8 *)gMapObjectPic_PsychicM_0, .size = sizeof gMapObjectPic_PsychicM_0},
    {.data = (u8 *)gMapObjectPic_PsychicM_1, .size = sizeof gMapObjectPic_PsychicM_1},
    {.data = (u8 *)gMapObjectPic_PsychicM_2, .size = sizeof gMapObjectPic_PsychicM_2},
    {.data = (u8 *)gMapObjectPic_PsychicM_3, .size = sizeof gMapObjectPic_PsychicM_3},
    {.data = (u8 *)gMapObjectPic_PsychicM_4, .size = sizeof gMapObjectPic_PsychicM_4},
    {.data = (u8 *)gMapObjectPic_PsychicM_5, .size = sizeof gMapObjectPic_PsychicM_5},
    {.data = (u8 *)gMapObjectPic_PsychicM_6, .size = sizeof gMapObjectPic_PsychicM_6},
    {.data = (u8 *)gMapObjectPic_PsychicM_7, .size = sizeof gMapObjectPic_PsychicM_7},
    {.data = (u8 *)gMapObjectPic_PsychicM_8, .size = sizeof gMapObjectPic_PsychicM_8}
};

const struct SpriteFrameImage gMapObjectPicTable_SchoolKidM[] = {
    {.data = (u8 *)gMapObjectPic_SchoolKidM_0, .size = sizeof gMapObjectPic_SchoolKidM_0},
    {.data = (u8 *)gMapObjectPic_SchoolKidM_1, .size = sizeof gMapObjectPic_SchoolKidM_1},
    {.data = (u8 *)gMapObjectPic_SchoolKidM_2, .size = sizeof gMapObjectPic_SchoolKidM_2},
    {.data = (u8 *)gMapObjectPic_SchoolKidM_3, .size = sizeof gMapObjectPic_SchoolKidM_3},
    {.data = (u8 *)gMapObjectPic_SchoolKidM_4, .size = sizeof gMapObjectPic_SchoolKidM_4},
    {.data = (u8 *)gMapObjectPic_SchoolKidM_5, .size = sizeof gMapObjectPic_SchoolKidM_5},
    {.data = (u8 *)gMapObjectPic_SchoolKidM_6, .size = sizeof gMapObjectPic_SchoolKidM_6},
    {.data = (u8 *)gMapObjectPic_SchoolKidM_7, .size = sizeof gMapObjectPic_SchoolKidM_7},
    {.data = (u8 *)gMapObjectPic_SchoolKidM_8, .size = sizeof gMapObjectPic_SchoolKidM_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Maniac[] = {
    {.data = (u8 *)gMapObjectPic_Maniac_0, .size = sizeof gMapObjectPic_Maniac_0},
    {.data = (u8 *)gMapObjectPic_Maniac_1, .size = sizeof gMapObjectPic_Maniac_1},
    {.data = (u8 *)gMapObjectPic_Maniac_2, .size = sizeof gMapObjectPic_Maniac_2},
    {.data = (u8 *)gMapObjectPic_Maniac_3, .size = sizeof gMapObjectPic_Maniac_3},
    {.data = (u8 *)gMapObjectPic_Maniac_4, .size = sizeof gMapObjectPic_Maniac_4},
    {.data = (u8 *)gMapObjectPic_Maniac_5, .size = sizeof gMapObjectPic_Maniac_5},
    {.data = (u8 *)gMapObjectPic_Maniac_6, .size = sizeof gMapObjectPic_Maniac_6},
    {.data = (u8 *)gMapObjectPic_Maniac_7, .size = sizeof gMapObjectPic_Maniac_7},
    {.data = (u8 *)gMapObjectPic_Maniac_8, .size = sizeof gMapObjectPic_Maniac_8}
};

const struct SpriteFrameImage gMapObjectPicTable_HexManiac[] = {
    {.data = (u8 *)gMapObjectPic_HexManiac_0, .size = sizeof gMapObjectPic_HexManiac_0},
    {.data = (u8 *)gMapObjectPic_HexManiac_1, .size = sizeof gMapObjectPic_HexManiac_1},
    {.data = (u8 *)gMapObjectPic_HexManiac_2, .size = sizeof gMapObjectPic_HexManiac_2},
    {.data = (u8 *)gMapObjectPic_HexManiac_3, .size = sizeof gMapObjectPic_HexManiac_3},
    {.data = (u8 *)gMapObjectPic_HexManiac_4, .size = sizeof gMapObjectPic_HexManiac_4},
    {.data = (u8 *)gMapObjectPic_HexManiac_5, .size = sizeof gMapObjectPic_HexManiac_5},
    {.data = (u8 *)gMapObjectPic_HexManiac_6, .size = sizeof gMapObjectPic_HexManiac_6},
    {.data = (u8 *)gMapObjectPic_HexManiac_7, .size = sizeof gMapObjectPic_HexManiac_7},
    {.data = (u8 *)gMapObjectPic_HexManiac_8, .size = sizeof gMapObjectPic_HexManiac_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Woman8[] = {
    {.data = (u8 *)gMapObjectPic_Woman8_0, .size = sizeof gMapObjectPic_Woman8_0},
    {.data = (u8 *)gMapObjectPic_Woman8_1, .size = sizeof gMapObjectPic_Woman8_1},
    {.data = (u8 *)gMapObjectPic_Woman8_2, .size = sizeof gMapObjectPic_Woman8_2},
    {.data = (u8 *)gMapObjectPic_Woman8_3, .size = sizeof gMapObjectPic_Woman8_3},
    {.data = (u8 *)gMapObjectPic_Woman8_4, .size = sizeof gMapObjectPic_Woman8_4},
    {.data = (u8 *)gMapObjectPic_Woman8_5, .size = sizeof gMapObjectPic_Woman8_5},
    {.data = (u8 *)gMapObjectPic_Woman8_6, .size = sizeof gMapObjectPic_Woman8_6},
    {.data = (u8 *)gMapObjectPic_Woman8_7, .size = sizeof gMapObjectPic_Woman8_7},
    {.data = (u8 *)gMapObjectPic_Woman8_8, .size = sizeof gMapObjectPic_Woman8_8}
};

const struct SpriteFrameImage gMapObjectPicTable_SwimmerM[] = {
    {.data = (u8 *)gMapObjectPic_SwimmerM_0, .size = sizeof gMapObjectPic_SwimmerM_0},
    {.data = (u8 *)gMapObjectPic_SwimmerM_1, .size = sizeof gMapObjectPic_SwimmerM_1},
    {.data = (u8 *)gMapObjectPic_SwimmerM_2, .size = sizeof gMapObjectPic_SwimmerM_2},
    {.data = (u8 *)gMapObjectPic_SwimmerM_3, .size = sizeof gMapObjectPic_SwimmerM_3},
    {.data = (u8 *)gMapObjectPic_SwimmerM_4, .size = sizeof gMapObjectPic_SwimmerM_4},
    {.data = (u8 *)gMapObjectPic_SwimmerM_5, .size = sizeof gMapObjectPic_SwimmerM_5},
    {.data = (u8 *)gMapObjectPic_SwimmerM_6, .size = sizeof gMapObjectPic_SwimmerM_6},
    {.data = (u8 *)gMapObjectPic_SwimmerM_7, .size = sizeof gMapObjectPic_SwimmerM_7},
    {.data = (u8 *)gMapObjectPic_SwimmerM_8, .size = sizeof gMapObjectPic_SwimmerM_8}
};

const struct SpriteFrameImage gMapObjectPicTable_SwimmerF[] = {
    {.data = (u8 *)gMapObjectPic_SwimmerF_0, .size = sizeof gMapObjectPic_SwimmerF_0},
    {.data = (u8 *)gMapObjectPic_SwimmerF_1, .size = sizeof gMapObjectPic_SwimmerF_1},
    {.data = (u8 *)gMapObjectPic_SwimmerF_2, .size = sizeof gMapObjectPic_SwimmerF_2},
    {.data = (u8 *)gMapObjectPic_SwimmerF_3, .size = sizeof gMapObjectPic_SwimmerF_3},
    {.data = (u8 *)gMapObjectPic_SwimmerF_4, .size = sizeof gMapObjectPic_SwimmerF_4},
    {.data = (u8 *)gMapObjectPic_SwimmerF_5, .size = sizeof gMapObjectPic_SwimmerF_5},
    {.data = (u8 *)gMapObjectPic_SwimmerF_6, .size = sizeof gMapObjectPic_SwimmerF_6},
    {.data = (u8 *)gMapObjectPic_SwimmerF_7, .size = sizeof gMapObjectPic_SwimmerF_7},
    {.data = (u8 *)gMapObjectPic_SwimmerF_8, .size = sizeof gMapObjectPic_SwimmerF_8}
};

const struct SpriteFrameImage gMapObjectPicTable_BlackBelt[] = {
    {.data = (u8 *)gMapObjectPic_BlackBelt_0, .size = sizeof gMapObjectPic_BlackBelt_0},
    {.data = (u8 *)gMapObjectPic_BlackBelt_1, .size = sizeof gMapObjectPic_BlackBelt_1},
    {.data = (u8 *)gMapObjectPic_BlackBelt_2, .size = sizeof gMapObjectPic_BlackBelt_2},
    {.data = (u8 *)gMapObjectPic_BlackBelt_3, .size = sizeof gMapObjectPic_BlackBelt_3},
    {.data = (u8 *)gMapObjectPic_BlackBelt_4, .size = sizeof gMapObjectPic_BlackBelt_4},
    {.data = (u8 *)gMapObjectPic_BlackBelt_5, .size = sizeof gMapObjectPic_BlackBelt_5},
    {.data = (u8 *)gMapObjectPic_BlackBelt_6, .size = sizeof gMapObjectPic_BlackBelt_6},
    {.data = (u8 *)gMapObjectPic_BlackBelt_7, .size = sizeof gMapObjectPic_BlackBelt_7},
    {.data = (u8 *)gMapObjectPic_BlackBelt_8, .size = sizeof gMapObjectPic_BlackBelt_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Beauty[] = {
    {.data = (u8 *)gMapObjectPic_Beauty_0, .size = sizeof gMapObjectPic_Beauty_0},
    {.data = (u8 *)gMapObjectPic_Beauty_1, .size = sizeof gMapObjectPic_Beauty_1},
    {.data = (u8 *)gMapObjectPic_Beauty_2, .size = sizeof gMapObjectPic_Beauty_2},
    {.data = (u8 *)gMapObjectPic_Beauty_3, .size = sizeof gMapObjectPic_Beauty_3},
    {.data = (u8 *)gMapObjectPic_Beauty_4, .size = sizeof gMapObjectPic_Beauty_4},
    {.data = (u8 *)gMapObjectPic_Beauty_5, .size = sizeof gMapObjectPic_Beauty_5},
    {.data = (u8 *)gMapObjectPic_Beauty_6, .size = sizeof gMapObjectPic_Beauty_6},
    {.data = (u8 *)gMapObjectPic_Beauty_7, .size = sizeof gMapObjectPic_Beauty_7},
    {.data = (u8 *)gMapObjectPic_Beauty_8, .size = sizeof gMapObjectPic_Beauty_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Scientist1[] = {
    {.data = (u8 *)gMapObjectPic_Scientist1_0, .size = sizeof gMapObjectPic_Scientist1_0},
    {.data = (u8 *)gMapObjectPic_Scientist1_1, .size = sizeof gMapObjectPic_Scientist1_1},
    {.data = (u8 *)gMapObjectPic_Scientist1_2, .size = sizeof gMapObjectPic_Scientist1_2},
    {.data = (u8 *)gMapObjectPic_Scientist1_3, .size = sizeof gMapObjectPic_Scientist1_3},
    {.data = (u8 *)gMapObjectPic_Scientist1_4, .size = sizeof gMapObjectPic_Scientist1_4},
    {.data = (u8 *)gMapObjectPic_Scientist1_5, .size = sizeof gMapObjectPic_Scientist1_5},
    {.data = (u8 *)gMapObjectPic_Scientist1_6, .size = sizeof gMapObjectPic_Scientist1_6},
    {.data = (u8 *)gMapObjectPic_Scientist1_7, .size = sizeof gMapObjectPic_Scientist1_7},
    {.data = (u8 *)gMapObjectPic_Scientist1_8, .size = sizeof gMapObjectPic_Scientist1_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Lass[] = {
    {.data = (u8 *)gMapObjectPic_Lass_0, .size = sizeof gMapObjectPic_Lass_0},
    {.data = (u8 *)gMapObjectPic_Lass_1, .size = sizeof gMapObjectPic_Lass_1},
    {.data = (u8 *)gMapObjectPic_Lass_2, .size = sizeof gMapObjectPic_Lass_2},
    {.data = (u8 *)gMapObjectPic_Lass_3, .size = sizeof gMapObjectPic_Lass_3},
    {.data = (u8 *)gMapObjectPic_Lass_4, .size = sizeof gMapObjectPic_Lass_4},
    {.data = (u8 *)gMapObjectPic_Lass_5, .size = sizeof gMapObjectPic_Lass_5},
    {.data = (u8 *)gMapObjectPic_Lass_6, .size = sizeof gMapObjectPic_Lass_6},
    {.data = (u8 *)gMapObjectPic_Lass_7, .size = sizeof gMapObjectPic_Lass_7},
    {.data = (u8 *)gMapObjectPic_Lass_8, .size = sizeof gMapObjectPic_Lass_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Gentleman[] = {
    {.data = (u8 *)gMapObjectPic_Gentleman_0, .size = sizeof gMapObjectPic_Gentleman_0},
    {.data = (u8 *)gMapObjectPic_Gentleman_1, .size = sizeof gMapObjectPic_Gentleman_1},
    {.data = (u8 *)gMapObjectPic_Gentleman_2, .size = sizeof gMapObjectPic_Gentleman_2},
    {.data = (u8 *)gMapObjectPic_Gentleman_3, .size = sizeof gMapObjectPic_Gentleman_3},
    {.data = (u8 *)gMapObjectPic_Gentleman_4, .size = sizeof gMapObjectPic_Gentleman_4},
    {.data = (u8 *)gMapObjectPic_Gentleman_5, .size = sizeof gMapObjectPic_Gentleman_5},
    {.data = (u8 *)gMapObjectPic_Gentleman_6, .size = sizeof gMapObjectPic_Gentleman_6},
    {.data = (u8 *)gMapObjectPic_Gentleman_7, .size = sizeof gMapObjectPic_Gentleman_7},
    {.data = (u8 *)gMapObjectPic_Gentleman_8, .size = sizeof gMapObjectPic_Gentleman_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Sailor[] = {
    {.data = (u8 *)gMapObjectPic_Sailor_0, .size = sizeof gMapObjectPic_Sailor_0},
    {.data = (u8 *)gMapObjectPic_Sailor_1, .size = sizeof gMapObjectPic_Sailor_1},
    {.data = (u8 *)gMapObjectPic_Sailor_2, .size = sizeof gMapObjectPic_Sailor_2},
    {.data = (u8 *)gMapObjectPic_Sailor_3, .size = sizeof gMapObjectPic_Sailor_3},
    {.data = (u8 *)gMapObjectPic_Sailor_4, .size = sizeof gMapObjectPic_Sailor_4},
    {.data = (u8 *)gMapObjectPic_Sailor_5, .size = sizeof gMapObjectPic_Sailor_5},
    {.data = (u8 *)gMapObjectPic_Sailor_6, .size = sizeof gMapObjectPic_Sailor_6},
    {.data = (u8 *)gMapObjectPic_Sailor_7, .size = sizeof gMapObjectPic_Sailor_7},
    {.data = (u8 *)gMapObjectPic_Sailor_8, .size = sizeof gMapObjectPic_Sailor_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Fisherman[] = {
    {.data = (u8 *)gMapObjectPic_Fisherman_0, .size = sizeof gMapObjectPic_Fisherman_0},
    {.data = (u8 *)gMapObjectPic_Fisherman_1, .size = sizeof gMapObjectPic_Fisherman_1},
    {.data = (u8 *)gMapObjectPic_Fisherman_2, .size = sizeof gMapObjectPic_Fisherman_2},
    {.data = (u8 *)gMapObjectPic_Fisherman_3, .size = sizeof gMapObjectPic_Fisherman_3},
    {.data = (u8 *)gMapObjectPic_Fisherman_4, .size = sizeof gMapObjectPic_Fisherman_4},
    {.data = (u8 *)gMapObjectPic_Fisherman_5, .size = sizeof gMapObjectPic_Fisherman_5},
    {.data = (u8 *)gMapObjectPic_Fisherman_6, .size = sizeof gMapObjectPic_Fisherman_6},
    {.data = (u8 *)gMapObjectPic_Fisherman_7, .size = sizeof gMapObjectPic_Fisherman_7},
    {.data = (u8 *)gMapObjectPic_Fisherman_8, .size = sizeof gMapObjectPic_Fisherman_8}
};

const struct SpriteFrameImage gMapObjectPicTable_RunningTriathleteM[] = {
    {.data = (u8 *)gMapObjectPic_RunningTriathleteM_0, .size = sizeof gMapObjectPic_RunningTriathleteM_0},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteM_1, .size = sizeof gMapObjectPic_RunningTriathleteM_1},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteM_2, .size = sizeof gMapObjectPic_RunningTriathleteM_2},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteM_3, .size = sizeof gMapObjectPic_RunningTriathleteM_3},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteM_4, .size = sizeof gMapObjectPic_RunningTriathleteM_4},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteM_5, .size = sizeof gMapObjectPic_RunningTriathleteM_5},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteM_6, .size = sizeof gMapObjectPic_RunningTriathleteM_6},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteM_7, .size = sizeof gMapObjectPic_RunningTriathleteM_7},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteM_8, .size = sizeof gMapObjectPic_RunningTriathleteM_8}
};

const struct SpriteFrameImage gMapObjectPicTable_RunningTriathleteF[] = {
    {.data = (u8 *)gMapObjectPic_RunningTriathleteF_0, .size = sizeof gMapObjectPic_RunningTriathleteF_0},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteF_1, .size = sizeof gMapObjectPic_RunningTriathleteF_1},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteF_2, .size = sizeof gMapObjectPic_RunningTriathleteF_2},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteF_3, .size = sizeof gMapObjectPic_RunningTriathleteF_3},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteF_4, .size = sizeof gMapObjectPic_RunningTriathleteF_4},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteF_5, .size = sizeof gMapObjectPic_RunningTriathleteF_5},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteF_6, .size = sizeof gMapObjectPic_RunningTriathleteF_6},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteF_7, .size = sizeof gMapObjectPic_RunningTriathleteF_7},
    {.data = (u8 *)gMapObjectPic_RunningTriathleteF_8, .size = sizeof gMapObjectPic_RunningTriathleteF_8}
};

const struct SpriteFrameImage gMapObjectPicTable_TuberF[] = {
    {.data = (u8 *)gMapObjectPic_TuberF_0, .size = sizeof gMapObjectPic_TuberF_0},
    {.data = (u8 *)gMapObjectPic_TuberF_1, .size = sizeof gMapObjectPic_TuberF_1},
    {.data = (u8 *)gMapObjectPic_TuberF_2, .size = sizeof gMapObjectPic_TuberF_2},
    {.data = (u8 *)gMapObjectPic_TuberF_3, .size = sizeof gMapObjectPic_TuberF_3},
    {.data = (u8 *)gMapObjectPic_TuberF_4, .size = sizeof gMapObjectPic_TuberF_4},
    {.data = (u8 *)gMapObjectPic_TuberF_5, .size = sizeof gMapObjectPic_TuberF_5},
    {.data = (u8 *)gMapObjectPic_TuberF_6, .size = sizeof gMapObjectPic_TuberF_6},
    {.data = (u8 *)gMapObjectPic_TuberF_7, .size = sizeof gMapObjectPic_TuberF_7},
    {.data = (u8 *)gMapObjectPic_TuberF_8, .size = sizeof gMapObjectPic_TuberF_8}
};

const struct SpriteFrameImage gMapObjectPicTable_TuberM[] = {
    {.data = (u8 *)gMapObjectPic_TuberM_0, .size = sizeof gMapObjectPic_TuberM_0},
    {.data = (u8 *)gMapObjectPic_TuberM_1, .size = sizeof gMapObjectPic_TuberM_1},
    {.data = (u8 *)gMapObjectPic_TuberM_2, .size = sizeof gMapObjectPic_TuberM_2},
    {.data = (u8 *)gMapObjectPic_TuberM_3, .size = sizeof gMapObjectPic_TuberM_3},
    {.data = (u8 *)gMapObjectPic_TuberM_4, .size = sizeof gMapObjectPic_TuberM_4},
    {.data = (u8 *)gMapObjectPic_TuberM_5, .size = sizeof gMapObjectPic_TuberM_5},
    {.data = (u8 *)gMapObjectPic_TuberM_6, .size = sizeof gMapObjectPic_TuberM_6},
    {.data = (u8 *)gMapObjectPic_TuberM_7, .size = sizeof gMapObjectPic_TuberM_7},
    {.data = (u8 *)gMapObjectPic_TuberM_8, .size = sizeof gMapObjectPic_TuberM_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Hiker[] = {
    {.data = (u8 *)gMapObjectPic_Hiker_0, .size = sizeof gMapObjectPic_Hiker_0},
    {.data = (u8 *)gMapObjectPic_Hiker_1, .size = sizeof gMapObjectPic_Hiker_1},
    {.data = (u8 *)gMapObjectPic_Hiker_2, .size = sizeof gMapObjectPic_Hiker_2},
    {.data = (u8 *)gMapObjectPic_Hiker_3, .size = sizeof gMapObjectPic_Hiker_3},
    {.data = (u8 *)gMapObjectPic_Hiker_4, .size = sizeof gMapObjectPic_Hiker_4},
    {.data = (u8 *)gMapObjectPic_Hiker_5, .size = sizeof gMapObjectPic_Hiker_5},
    {.data = (u8 *)gMapObjectPic_Hiker_6, .size = sizeof gMapObjectPic_Hiker_6},
    {.data = (u8 *)gMapObjectPic_Hiker_7, .size = sizeof gMapObjectPic_Hiker_7},
    {.data = (u8 *)gMapObjectPic_Hiker_8, .size = sizeof gMapObjectPic_Hiker_8}
};

const struct SpriteFrameImage gMapObjectPicTable_CyclingTriathleteM[] = {
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteM_0, .size = sizeof gMapObjectPic_CyclingTriathleteM_0},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteM_1, .size = sizeof gMapObjectPic_CyclingTriathleteM_1},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteM_2, .size = sizeof gMapObjectPic_CyclingTriathleteM_2},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteM_3, .size = sizeof gMapObjectPic_CyclingTriathleteM_3},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteM_4, .size = sizeof gMapObjectPic_CyclingTriathleteM_4},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteM_5, .size = sizeof gMapObjectPic_CyclingTriathleteM_5},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteM_6, .size = sizeof gMapObjectPic_CyclingTriathleteM_6},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteM_7, .size = sizeof gMapObjectPic_CyclingTriathleteM_7},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteM_8, .size = sizeof gMapObjectPic_CyclingTriathleteM_8}
};

const struct SpriteFrameImage gMapObjectPicTable_CyclingTriathleteF[] = {
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteF_0, .size = sizeof gMapObjectPic_CyclingTriathleteF_0},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteF_1, .size = sizeof gMapObjectPic_CyclingTriathleteF_1},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteF_2, .size = sizeof gMapObjectPic_CyclingTriathleteF_2},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteF_3, .size = sizeof gMapObjectPic_CyclingTriathleteF_3},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteF_4, .size = sizeof gMapObjectPic_CyclingTriathleteF_4},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteF_5, .size = sizeof gMapObjectPic_CyclingTriathleteF_5},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteF_6, .size = sizeof gMapObjectPic_CyclingTriathleteF_6},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteF_7, .size = sizeof gMapObjectPic_CyclingTriathleteF_7},
    {.data = (u8 *)gMapObjectPic_CyclingTriathleteF_8, .size = sizeof gMapObjectPic_CyclingTriathleteF_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Nurse[] = {
    {.data = (u8 *)gMapObjectPic_Nurse_0, .size = sizeof gMapObjectPic_Nurse_0},
    {.data = (u8 *)gMapObjectPic_Nurse_1, .size = sizeof gMapObjectPic_Nurse_1},
    {.data = (u8 *)gMapObjectPic_Nurse_2, .size = sizeof gMapObjectPic_Nurse_2},
    {.data = (u8 *)gMapObjectPic_Nurse_3, .size = sizeof gMapObjectPic_Nurse_3},
    {.data = (u8 *)gMapObjectPic_Nurse_4, .size = sizeof gMapObjectPic_Nurse_4},
    {.data = (u8 *)gMapObjectPic_Nurse_5, .size = sizeof gMapObjectPic_Nurse_5},
    {.data = (u8 *)gMapObjectPic_Nurse_6, .size = sizeof gMapObjectPic_Nurse_6},
    {.data = (u8 *)gMapObjectPic_Nurse_7, .size = sizeof gMapObjectPic_Nurse_7},
    {.data = (u8 *)gMapObjectPic_Nurse_8, .size = sizeof gMapObjectPic_Nurse_8},
    {.data = (u8 *)gMapObjectPic_Nurse_9, .size = sizeof gMapObjectPic_Nurse_9}
};

const struct SpriteFrameImage gMapObjectPicTable_ItemBall[] = {
    {.data = (u8 *)gMapObjectPic_ItemBall, .size = sizeof gMapObjectPic_ItemBall}
};

const struct SpriteFrameImage gMapObjectPicTable_ProfBirch[] = {
    {.data = (u8 *)gMapObjectPic_ProfBirch_0, .size = sizeof gMapObjectPic_ProfBirch_0},
    {.data = (u8 *)gMapObjectPic_ProfBirch_1, .size = sizeof gMapObjectPic_ProfBirch_1},
    {.data = (u8 *)gMapObjectPic_ProfBirch_2, .size = sizeof gMapObjectPic_ProfBirch_2},
    {.data = (u8 *)gMapObjectPic_ProfBirch_3, .size = sizeof gMapObjectPic_ProfBirch_3},
    {.data = (u8 *)gMapObjectPic_ProfBirch_4, .size = sizeof gMapObjectPic_ProfBirch_4},
    {.data = (u8 *)gMapObjectPic_ProfBirch_5, .size = sizeof gMapObjectPic_ProfBirch_5},
    {.data = (u8 *)gMapObjectPic_ProfBirch_6, .size = sizeof gMapObjectPic_ProfBirch_6},
    {.data = (u8 *)gMapObjectPic_ProfBirch_7, .size = sizeof gMapObjectPic_ProfBirch_7},
    {.data = (u8 *)gMapObjectPic_ProfBirch_8, .size = sizeof gMapObjectPic_ProfBirch_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Man5[] = {
    {.data = (u8 *)gMapObjectPic_Man5_0, .size = sizeof gMapObjectPic_Man5_0},
    {.data = (u8 *)gMapObjectPic_Man5_1, .size = sizeof gMapObjectPic_Man5_1},
    {.data = (u8 *)gMapObjectPic_Man5_2, .size = sizeof gMapObjectPic_Man5_2},
    {.data = (u8 *)gMapObjectPic_Man5_3, .size = sizeof gMapObjectPic_Man5_3},
    {.data = (u8 *)gMapObjectPic_Man5_4, .size = sizeof gMapObjectPic_Man5_4},
    {.data = (u8 *)gMapObjectPic_Man5_5, .size = sizeof gMapObjectPic_Man5_5},
    {.data = (u8 *)gMapObjectPic_Man5_6, .size = sizeof gMapObjectPic_Man5_6},
    {.data = (u8 *)gMapObjectPic_Man5_7, .size = sizeof gMapObjectPic_Man5_7},
    {.data = (u8 *)gMapObjectPic_Man5_8, .size = sizeof gMapObjectPic_Man5_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Man6[] = {
    {.data = (u8 *)gMapObjectPic_Man6_0, .size = sizeof gMapObjectPic_Man6_0},
    {.data = (u8 *)gMapObjectPic_Man6_1, .size = sizeof gMapObjectPic_Man6_1},
    {.data = (u8 *)gMapObjectPic_Man6_2, .size = sizeof gMapObjectPic_Man6_2},
    {.data = (u8 *)gMapObjectPic_Man6_3, .size = sizeof gMapObjectPic_Man6_3},
    {.data = (u8 *)gMapObjectPic_Man6_4, .size = sizeof gMapObjectPic_Man6_4},
    {.data = (u8 *)gMapObjectPic_Man6_5, .size = sizeof gMapObjectPic_Man6_5},
    {.data = (u8 *)gMapObjectPic_Man6_6, .size = sizeof gMapObjectPic_Man6_6},
    {.data = (u8 *)gMapObjectPic_Man6_7, .size = sizeof gMapObjectPic_Man6_7},
    {.data = (u8 *)gMapObjectPic_Man6_8, .size = sizeof gMapObjectPic_Man6_8}
};

const struct SpriteFrameImage gMapObjectPicTable_ReporterM[] = {
    {.data = (u8 *)gMapObjectPic_ReporterM_0, .size = sizeof gMapObjectPic_ReporterM_0},
    {.data = (u8 *)gMapObjectPic_ReporterM_1, .size = sizeof gMapObjectPic_ReporterM_1},
    {.data = (u8 *)gMapObjectPic_ReporterM_2, .size = sizeof gMapObjectPic_ReporterM_2},
    {.data = (u8 *)gMapObjectPic_ReporterM_3, .size = sizeof gMapObjectPic_ReporterM_3},
    {.data = (u8 *)gMapObjectPic_ReporterM_4, .size = sizeof gMapObjectPic_ReporterM_4},
    {.data = (u8 *)gMapObjectPic_ReporterM_5, .size = sizeof gMapObjectPic_ReporterM_5},
    {.data = (u8 *)gMapObjectPic_ReporterM_6, .size = sizeof gMapObjectPic_ReporterM_6},
    {.data = (u8 *)gMapObjectPic_ReporterM_7, .size = sizeof gMapObjectPic_ReporterM_7},
    {.data = (u8 *)gMapObjectPic_ReporterM_8, .size = sizeof gMapObjectPic_ReporterM_8}
};

const struct SpriteFrameImage gMapObjectPicTable_ReporterF[] = {
    {.data = (u8 *)gMapObjectPic_ReporterF_0, .size = sizeof gMapObjectPic_ReporterF_0},
    {.data = (u8 *)gMapObjectPic_ReporterF_1, .size = sizeof gMapObjectPic_ReporterF_1},
    {.data = (u8 *)gMapObjectPic_ReporterF_2, .size = sizeof gMapObjectPic_ReporterF_2},
    {.data = (u8 *)gMapObjectPic_ReporterF_3, .size = sizeof gMapObjectPic_ReporterF_3},
    {.data = (u8 *)gMapObjectPic_ReporterF_4, .size = sizeof gMapObjectPic_ReporterF_4},
    {.data = (u8 *)gMapObjectPic_ReporterF_5, .size = sizeof gMapObjectPic_ReporterF_5},
    {.data = (u8 *)gMapObjectPic_ReporterF_6, .size = sizeof gMapObjectPic_ReporterF_6},
    {.data = (u8 *)gMapObjectPic_ReporterF_7, .size = sizeof gMapObjectPic_ReporterF_7},
    {.data = (u8 *)gMapObjectPic_ReporterF_8, .size = sizeof gMapObjectPic_ReporterF_8}
};

const struct SpriteFrameImage gMapObjectPicTable_MauvilleOldMan1[] = {
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan1_0, .size = sizeof gMapObjectPic_MauvilleOldMan1_0},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan1_1, .size = sizeof gMapObjectPic_MauvilleOldMan1_1},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan1_2, .size = sizeof gMapObjectPic_MauvilleOldMan1_2},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan1_3, .size = sizeof gMapObjectPic_MauvilleOldMan1_3},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan1_4, .size = sizeof gMapObjectPic_MauvilleOldMan1_4},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan1_5, .size = sizeof gMapObjectPic_MauvilleOldMan1_5},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan1_6, .size = sizeof gMapObjectPic_MauvilleOldMan1_6},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan1_7, .size = sizeof gMapObjectPic_MauvilleOldMan1_7},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan1_8, .size = sizeof gMapObjectPic_MauvilleOldMan1_8}
};

const struct SpriteFrameImage gMapObjectPicTable_MauvilleOldMan2[] = {
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan2_0, .size = sizeof gMapObjectPic_MauvilleOldMan2_0},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan2_1, .size = sizeof gMapObjectPic_MauvilleOldMan2_1},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan2_2, .size = sizeof gMapObjectPic_MauvilleOldMan2_2},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan2_3, .size = sizeof gMapObjectPic_MauvilleOldMan2_3},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan2_4, .size = sizeof gMapObjectPic_MauvilleOldMan2_4},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan2_5, .size = sizeof gMapObjectPic_MauvilleOldMan2_5},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan2_6, .size = sizeof gMapObjectPic_MauvilleOldMan2_6},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan2_7, .size = sizeof gMapObjectPic_MauvilleOldMan2_7},
    {.data = (u8 *)gMapObjectPic_MauvilleOldMan2_8, .size = sizeof gMapObjectPic_MauvilleOldMan2_8}
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedNatuDoll[] = {
    {.data = (u8 *)gMapObjectPic_UnusedNatuDoll, .size = sizeof gMapObjectPic_UnusedNatuDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedMagnemiteDoll[] = {
    {.data = (u8 *)gMapObjectPic_UnusedMagnemiteDoll, .size = sizeof gMapObjectPic_UnusedMagnemiteDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedSquirtleDoll[] = {
    {.data = (u8 *)gMapObjectPic_UnusedSquirtleDoll, .size = sizeof gMapObjectPic_UnusedSquirtleDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedWooperDoll[] = {
    {.data = (u8 *)gMapObjectPic_UnusedWooperDoll, .size = sizeof gMapObjectPic_UnusedWooperDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedPikachuDoll[] = {
    {.data = (u8 *)gMapObjectPic_UnusedPikachuDoll, .size = sizeof gMapObjectPic_UnusedPikachuDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedPorygon2Doll[] = {
    {.data = (u8 *)gMapObjectPic_UnusedPorygon2Doll, .size = sizeof gMapObjectPic_UnusedPorygon2Doll}
};

const struct SpriteFrameImage gMapObjectPicTable_CuttableTree[] = {
    {.data = (u8 *)gMapObjectPic_CuttableTree_0, .size = sizeof gMapObjectPic_CuttableTree_0},
    {.data = (u8 *)gMapObjectPic_CuttableTree_1, .size = sizeof gMapObjectPic_CuttableTree_1},
    {.data = (u8 *)gMapObjectPic_CuttableTree_2, .size = sizeof gMapObjectPic_CuttableTree_2},
    {.data = (u8 *)gMapObjectPic_CuttableTree_3, .size = sizeof gMapObjectPic_CuttableTree_3}
};

const struct SpriteFrameImage gMapObjectPicTable_MartEmployee[] = {
    {.data = (u8 *)gMapObjectPic_MartEmployee_0, .size = sizeof gMapObjectPic_MartEmployee_0},
    {.data = (u8 *)gMapObjectPic_MartEmployee_1, .size = sizeof gMapObjectPic_MartEmployee_1},
    {.data = (u8 *)gMapObjectPic_MartEmployee_2, .size = sizeof gMapObjectPic_MartEmployee_2},
    {.data = (u8 *)gMapObjectPic_MartEmployee_3, .size = sizeof gMapObjectPic_MartEmployee_3},
    {.data = (u8 *)gMapObjectPic_MartEmployee_4, .size = sizeof gMapObjectPic_MartEmployee_4},
    {.data = (u8 *)gMapObjectPic_MartEmployee_5, .size = sizeof gMapObjectPic_MartEmployee_5},
    {.data = (u8 *)gMapObjectPic_MartEmployee_6, .size = sizeof gMapObjectPic_MartEmployee_6},
    {.data = (u8 *)gMapObjectPic_MartEmployee_7, .size = sizeof gMapObjectPic_MartEmployee_7},
    {.data = (u8 *)gMapObjectPic_MartEmployee_8, .size = sizeof gMapObjectPic_MartEmployee_8}
};

const struct SpriteFrameImage gMapObjectPicTable_RooftopSaleWoman[] = {
    {.data = (u8 *)gMapObjectPic_RooftopSaleWoman_0, .size = sizeof gMapObjectPic_RooftopSaleWoman_0},
    {.data = (u8 *)gMapObjectPic_RooftopSaleWoman_1, .size = sizeof gMapObjectPic_RooftopSaleWoman_1},
    {.data = (u8 *)gMapObjectPic_RooftopSaleWoman_2, .size = sizeof gMapObjectPic_RooftopSaleWoman_2},
    {.data = (u8 *)gMapObjectPic_RooftopSaleWoman_3, .size = sizeof gMapObjectPic_RooftopSaleWoman_3},
    {.data = (u8 *)gMapObjectPic_RooftopSaleWoman_4, .size = sizeof gMapObjectPic_RooftopSaleWoman_4},
    {.data = (u8 *)gMapObjectPic_RooftopSaleWoman_5, .size = sizeof gMapObjectPic_RooftopSaleWoman_5},
    {.data = (u8 *)gMapObjectPic_RooftopSaleWoman_6, .size = sizeof gMapObjectPic_RooftopSaleWoman_6},
    {.data = (u8 *)gMapObjectPic_RooftopSaleWoman_7, .size = sizeof gMapObjectPic_RooftopSaleWoman_7},
    {.data = (u8 *)gMapObjectPic_RooftopSaleWoman_8, .size = sizeof gMapObjectPic_RooftopSaleWoman_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Teala[] = {
    {.data = (u8 *)gMapObjectPic_Teala_0, .size = sizeof gMapObjectPic_Teala_0},
    {.data = (u8 *)gMapObjectPic_Teala_1, .size = sizeof gMapObjectPic_Teala_1},
    {.data = (u8 *)gMapObjectPic_Teala_2, .size = sizeof gMapObjectPic_Teala_2},
    {.data = (u8 *)gMapObjectPic_Teala_3, .size = sizeof gMapObjectPic_Teala_3},
    {.data = (u8 *)gMapObjectPic_Teala_4, .size = sizeof gMapObjectPic_Teala_4},
    {.data = (u8 *)gMapObjectPic_Teala_5, .size = sizeof gMapObjectPic_Teala_5},
    {.data = (u8 *)gMapObjectPic_Teala_6, .size = sizeof gMapObjectPic_Teala_6},
    {.data = (u8 *)gMapObjectPic_Teala_7, .size = sizeof gMapObjectPic_Teala_7},
    {.data = (u8 *)gMapObjectPic_Teala_8, .size = sizeof gMapObjectPic_Teala_8}
};

const struct SpriteFrameImage gMapObjectPicTable_BreakableRock[] = {
    {.data = (u8 *)gMapObjectPic_BreakableRock_0, .size = sizeof gMapObjectPic_BreakableRock_0},
    {.data = (u8 *)gMapObjectPic_BreakableRock_1, .size = sizeof gMapObjectPic_BreakableRock_1},
    {.data = (u8 *)gMapObjectPic_BreakableRock_2, .size = sizeof gMapObjectPic_BreakableRock_2},
    {.data = (u8 *)gMapObjectPic_BreakableRock_3, .size = sizeof gMapObjectPic_BreakableRock_3}
};

const struct SpriteFrameImage gMapObjectPicTable_PushableBoulder[] = {
    {.data = (u8 *)gMapObjectPic_PushableBoulder, .size = sizeof gMapObjectPic_PushableBoulder}
};

const struct SpriteFrameImage gMapObjectPicTable_MrBrineysBoat[] = {
    {.data = (u8 *)gMapObjectPic_MrBrineysBoat_0, .size = sizeof gMapObjectPic_MrBrineysBoat_0},
    {.data = (u8 *)gMapObjectPic_MrBrineysBoat_1, .size = sizeof gMapObjectPic_MrBrineysBoat_1},
    {.data = (u8 *)gMapObjectPic_MrBrineysBoat_2, .size = sizeof gMapObjectPic_MrBrineysBoat_2},
    {.data = (u8 *)gMapObjectPic_MrBrineysBoat_0, .size = sizeof gMapObjectPic_MrBrineysBoat_0},
    {.data = (u8 *)gMapObjectPic_MrBrineysBoat_0, .size = sizeof gMapObjectPic_MrBrineysBoat_0},
    {.data = (u8 *)gMapObjectPic_MrBrineysBoat_1, .size = sizeof gMapObjectPic_MrBrineysBoat_1},
    {.data = (u8 *)gMapObjectPic_MrBrineysBoat_1, .size = sizeof gMapObjectPic_MrBrineysBoat_1},
    {.data = (u8 *)gMapObjectPic_MrBrineysBoat_2, .size = sizeof gMapObjectPic_MrBrineysBoat_2},
    {.data = (u8 *)gMapObjectPic_MrBrineysBoat_2, .size = sizeof gMapObjectPic_MrBrineysBoat_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Truck[] = {
    {.data = (u8 *)gMapObjectPic_Truck, .size = sizeof gMapObjectPic_Truck}
};

const struct SpriteFrameImage gMapObjectPicTable_MachokeCarryingBox[] = {
    {.data = (u8 *)gMapObjectPic_MachokeCarryingBox_0, .size = sizeof gMapObjectPic_MachokeCarryingBox_0},
    {.data = (u8 *)gMapObjectPic_MachokeCarryingBox_0, .size = sizeof gMapObjectPic_MachokeCarryingBox_0},
    {.data = (u8 *)gMapObjectPic_MachokeCarryingBox_0, .size = sizeof gMapObjectPic_MachokeCarryingBox_0},
    {.data = (u8 *)gMapObjectPic_MachokeCarryingBox_1, .size = sizeof gMapObjectPic_MachokeCarryingBox_1},
    {.data = (u8 *)gMapObjectPic_MachokeCarryingBox_2, .size = sizeof gMapObjectPic_MachokeCarryingBox_2},
    {.data = (u8 *)gMapObjectPic_MachokeCarryingBox_1, .size = sizeof gMapObjectPic_MachokeCarryingBox_1},
    {.data = (u8 *)gMapObjectPic_MachokeCarryingBox_2, .size = sizeof gMapObjectPic_MachokeCarryingBox_2},
    {.data = (u8 *)gMapObjectPic_MachokeCarryingBox_1, .size = sizeof gMapObjectPic_MachokeCarryingBox_1},
    {.data = (u8 *)gMapObjectPic_MachokeCarryingBox_2, .size = sizeof gMapObjectPic_MachokeCarryingBox_2}
};

const struct SpriteFrameImage gMapObjectPicTable_MachokeFacingAway[] = {
    {.data = (u8 *)gMapObjectPic_MachokeFacingAway_0, .size = sizeof gMapObjectPic_MachokeFacingAway_0},
    {.data = (u8 *)gMapObjectPic_MachokeFacingAway_0, .size = sizeof gMapObjectPic_MachokeFacingAway_0},
    {.data = (u8 *)gMapObjectPic_MachokeFacingAway_0, .size = sizeof gMapObjectPic_MachokeFacingAway_0},
    {.data = (u8 *)gMapObjectPic_MachokeFacingAway_1, .size = sizeof gMapObjectPic_MachokeFacingAway_1},
    {.data = (u8 *)gMapObjectPic_MachokeFacingAway_1, .size = sizeof gMapObjectPic_MachokeFacingAway_1},
    {.data = (u8 *)gMapObjectPic_MachokeFacingAway_1, .size = sizeof gMapObjectPic_MachokeFacingAway_1},
    {.data = (u8 *)gMapObjectPic_MachokeFacingAway_1, .size = sizeof gMapObjectPic_MachokeFacingAway_1},
    {.data = (u8 *)gMapObjectPic_MachokeFacingAway_1, .size = sizeof gMapObjectPic_MachokeFacingAway_1},
    {.data = (u8 *)gMapObjectPic_MachokeFacingAway_1, .size = sizeof gMapObjectPic_MachokeFacingAway_1}
};

const struct SpriteFrameImage gMapObjectPicTable_BirchsBag[] = {
    {.data = (u8 *)gMapObjectPic_BirchsBag, .size = sizeof gMapObjectPic_BirchsBag}
};

const struct SpriteFrameImage gMapObjectPicTable_Poochyena[] = {
    {.data = (u8 *)gMapObjectPic_Poochyena_0, .size = sizeof gMapObjectPic_Poochyena_0},
    {.data = (u8 *)gMapObjectPic_Poochyena_1, .size = sizeof gMapObjectPic_Poochyena_1},
    {.data = (u8 *)gMapObjectPic_Poochyena_2, .size = sizeof gMapObjectPic_Poochyena_2},
    {.data = (u8 *)gMapObjectPic_Poochyena_3, .size = sizeof gMapObjectPic_Poochyena_3},
    {.data = (u8 *)gMapObjectPic_Poochyena_4, .size = sizeof gMapObjectPic_Poochyena_4},
    {.data = (u8 *)gMapObjectPic_Poochyena_5, .size = sizeof gMapObjectPic_Poochyena_5},
    {.data = (u8 *)gMapObjectPic_Poochyena_6, .size = sizeof gMapObjectPic_Poochyena_6},
    {.data = (u8 *)gMapObjectPic_Poochyena_7, .size = sizeof gMapObjectPic_Poochyena_7},
    {.data = (u8 *)gMapObjectPic_Poochyena_8, .size = sizeof gMapObjectPic_Poochyena_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Artist[] = {
    {.data = (u8 *)gMapObjectPic_Artist_0, .size = sizeof gMapObjectPic_Artist_0},
    {.data = (u8 *)gMapObjectPic_Artist_1, .size = sizeof gMapObjectPic_Artist_1},
    {.data = (u8 *)gMapObjectPic_Artist_2, .size = sizeof gMapObjectPic_Artist_2},
    {.data = (u8 *)gMapObjectPic_Artist_3, .size = sizeof gMapObjectPic_Artist_3},
    {.data = (u8 *)gMapObjectPic_Artist_4, .size = sizeof gMapObjectPic_Artist_4},
    {.data = (u8 *)gMapObjectPic_Artist_5, .size = sizeof gMapObjectPic_Artist_5},
    {.data = (u8 *)gMapObjectPic_Artist_6, .size = sizeof gMapObjectPic_Artist_6},
    {.data = (u8 *)gMapObjectPic_Artist_7, .size = sizeof gMapObjectPic_Artist_7},
    {.data = (u8 *)gMapObjectPic_Artist_8, .size = sizeof gMapObjectPic_Artist_8}
};

const struct SpriteFrameImage gMapObjectPicTable_MayNormal[] = {
    {.data = (u8 *)gMapObjectPic_MayNormal_0, .size = sizeof gMapObjectPic_MayNormal_0},
    {.data = (u8 *)gMapObjectPic_MayNormal_1, .size = sizeof gMapObjectPic_MayNormal_1},
    {.data = (u8 *)gMapObjectPic_MayNormal_2, .size = sizeof gMapObjectPic_MayNormal_2},
    {.data = (u8 *)gMapObjectPic_MayNormal_3, .size = sizeof gMapObjectPic_MayNormal_3},
    {.data = (u8 *)gMapObjectPic_MayNormal_4, .size = sizeof gMapObjectPic_MayNormal_4},
    {.data = (u8 *)gMapObjectPic_MayNormal_5, .size = sizeof gMapObjectPic_MayNormal_5},
    {.data = (u8 *)gMapObjectPic_MayNormal_6, .size = sizeof gMapObjectPic_MayNormal_6},
    {.data = (u8 *)gMapObjectPic_MayNormal_7, .size = sizeof gMapObjectPic_MayNormal_7},
    {.data = (u8 *)gMapObjectPic_MayNormal_8, .size = sizeof gMapObjectPic_MayNormal_8},
    {.data = (u8 *)gMapObjectPic_MayNormal_9, .size = sizeof gMapObjectPic_MayNormal_9},
    {.data = (u8 *)gMapObjectPic_MayNormal_10, .size = sizeof gMapObjectPic_MayNormal_10},
    {.data = (u8 *)gMapObjectPic_MayNormal_11, .size = sizeof gMapObjectPic_MayNormal_11},
    {.data = (u8 *)gMapObjectPic_MayNormal_12, .size = sizeof gMapObjectPic_MayNormal_12},
    {.data = (u8 *)gMapObjectPic_MayNormal_13, .size = sizeof gMapObjectPic_MayNormal_13},
    {.data = (u8 *)gMapObjectPic_MayNormal_14, .size = sizeof gMapObjectPic_MayNormal_14},
    {.data = (u8 *)gMapObjectPic_MayNormal_15, .size = sizeof gMapObjectPic_MayNormal_15},
    {.data = (u8 *)gMapObjectPic_MayNormal_16, .size = sizeof gMapObjectPic_MayNormal_16},
    {.data = (u8 *)gMapObjectPic_MayNormal_17, .size = sizeof gMapObjectPic_MayNormal_17}
};

const struct SpriteFrameImage gMapObjectPicTable_MayMachBike[] = {
    {.data = (u8 *)gMapObjectPic_MayMachBike_0, .size = sizeof gMapObjectPic_MayMachBike_0},
    {.data = (u8 *)gMapObjectPic_MayMachBike_1, .size = sizeof gMapObjectPic_MayMachBike_1},
    {.data = (u8 *)gMapObjectPic_MayMachBike_2, .size = sizeof gMapObjectPic_MayMachBike_2},
    {.data = (u8 *)gMapObjectPic_MayMachBike_3, .size = sizeof gMapObjectPic_MayMachBike_3},
    {.data = (u8 *)gMapObjectPic_MayMachBike_4, .size = sizeof gMapObjectPic_MayMachBike_4},
    {.data = (u8 *)gMapObjectPic_MayMachBike_5, .size = sizeof gMapObjectPic_MayMachBike_5},
    {.data = (u8 *)gMapObjectPic_MayMachBike_6, .size = sizeof gMapObjectPic_MayMachBike_6},
    {.data = (u8 *)gMapObjectPic_MayMachBike_7, .size = sizeof gMapObjectPic_MayMachBike_7},
    {.data = (u8 *)gMapObjectPic_MayMachBike_8, .size = sizeof gMapObjectPic_MayMachBike_8}
};

const struct SpriteFrameImage gMapObjectPicTable_MayAcroBike[] = {
    {.data = (u8 *)gMapObjectPic_MayAcroBike_0, .size = sizeof gMapObjectPic_MayAcroBike_0},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_1, .size = sizeof gMapObjectPic_MayAcroBike_1},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_2, .size = sizeof gMapObjectPic_MayAcroBike_2},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_3, .size = sizeof gMapObjectPic_MayAcroBike_3},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_4, .size = sizeof gMapObjectPic_MayAcroBike_4},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_5, .size = sizeof gMapObjectPic_MayAcroBike_5},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_6, .size = sizeof gMapObjectPic_MayAcroBike_6},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_7, .size = sizeof gMapObjectPic_MayAcroBike_7},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_8, .size = sizeof gMapObjectPic_MayAcroBike_8},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_9, .size = sizeof gMapObjectPic_MayAcroBike_9},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_10, .size = sizeof gMapObjectPic_MayAcroBike_10},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_11, .size = sizeof gMapObjectPic_MayAcroBike_11},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_12, .size = sizeof gMapObjectPic_MayAcroBike_12},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_13, .size = sizeof gMapObjectPic_MayAcroBike_13},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_14, .size = sizeof gMapObjectPic_MayAcroBike_14},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_15, .size = sizeof gMapObjectPic_MayAcroBike_15},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_16, .size = sizeof gMapObjectPic_MayAcroBike_16},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_17, .size = sizeof gMapObjectPic_MayAcroBike_17},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_18, .size = sizeof gMapObjectPic_MayAcroBike_18},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_19, .size = sizeof gMapObjectPic_MayAcroBike_19},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_20, .size = sizeof gMapObjectPic_MayAcroBike_20},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_21, .size = sizeof gMapObjectPic_MayAcroBike_21},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_22, .size = sizeof gMapObjectPic_MayAcroBike_22},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_23, .size = sizeof gMapObjectPic_MayAcroBike_23},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_24, .size = sizeof gMapObjectPic_MayAcroBike_24},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_25, .size = sizeof gMapObjectPic_MayAcroBike_25},
    {.data = (u8 *)gMapObjectPic_MayAcroBike_26, .size = sizeof gMapObjectPic_MayAcroBike_26}
};

const struct SpriteFrameImage gMapObjectPicTable_MaySurfing[] = {
    {.data = (u8 *)gMapObjectPic_MaySurfing_0, .size = sizeof gMapObjectPic_MaySurfing_0},
    {.data = (u8 *)gMapObjectPic_MaySurfing_1, .size = sizeof gMapObjectPic_MaySurfing_1},
    {.data = (u8 *)gMapObjectPic_MaySurfing_2, .size = sizeof gMapObjectPic_MaySurfing_2},
    {.data = (u8 *)gMapObjectPic_MaySurfing_0, .size = sizeof gMapObjectPic_MaySurfing_0},
    {.data = (u8 *)gMapObjectPic_MaySurfing_0, .size = sizeof gMapObjectPic_MaySurfing_0},
    {.data = (u8 *)gMapObjectPic_MaySurfing_1, .size = sizeof gMapObjectPic_MaySurfing_1},
    {.data = (u8 *)gMapObjectPic_MaySurfing_1, .size = sizeof gMapObjectPic_MaySurfing_1},
    {.data = (u8 *)gMapObjectPic_MaySurfing_2, .size = sizeof gMapObjectPic_MaySurfing_2},
    {.data = (u8 *)gMapObjectPic_MaySurfing_2, .size = sizeof gMapObjectPic_MaySurfing_2},
    {.data = (u8 *)gMapObjectPic_MaySurfing_3, .size = sizeof gMapObjectPic_MaySurfing_3},
    {.data = (u8 *)gMapObjectPic_MaySurfing_4, .size = sizeof gMapObjectPic_MaySurfing_4},
    {.data = (u8 *)gMapObjectPic_MaySurfing_5, .size = sizeof gMapObjectPic_MaySurfing_5}
};

const struct SpriteFrameImage gMapObjectPicTable_MayUnderwater[] = {
    {.data = (u8 *)gMapObjectPic_MayUnderwater_0, .size = sizeof gMapObjectPic_MayUnderwater_0},
    {.data = (u8 *)gMapObjectPic_MayUnderwater_1, .size = sizeof gMapObjectPic_MayUnderwater_1},
    {.data = (u8 *)gMapObjectPic_MayUnderwater_2, .size = sizeof gMapObjectPic_MayUnderwater_2},
    {.data = (u8 *)gMapObjectPic_MayUnderwater_0, .size = sizeof gMapObjectPic_MayUnderwater_0},
    {.data = (u8 *)gMapObjectPic_MayUnderwater_0, .size = sizeof gMapObjectPic_MayUnderwater_0},
    {.data = (u8 *)gMapObjectPic_MayUnderwater_1, .size = sizeof gMapObjectPic_MayUnderwater_1},
    {.data = (u8 *)gMapObjectPic_MayUnderwater_1, .size = sizeof gMapObjectPic_MayUnderwater_1},
    {.data = (u8 *)gMapObjectPic_MayUnderwater_2, .size = sizeof gMapObjectPic_MayUnderwater_2},
    {.data = (u8 *)gMapObjectPic_MayUnderwater_2, .size = sizeof gMapObjectPic_MayUnderwater_2}
};

const struct SpriteFrameImage gMapObjectPicTable_MayFieldMove[] = {
    {.data = (u8 *)gMapObjectPic_MayFieldMove_0, .size = sizeof gMapObjectPic_MayFieldMove_0},
    {.data = (u8 *)gMapObjectPic_MayFieldMove_1, .size = sizeof gMapObjectPic_MayFieldMove_1},
    {.data = (u8 *)gMapObjectPic_MayFieldMove_2, .size = sizeof gMapObjectPic_MayFieldMove_2},
    {.data = (u8 *)gMapObjectPic_MayFieldMove_3, .size = sizeof gMapObjectPic_MayFieldMove_3},
    {.data = (u8 *)gMapObjectPic_MayFieldMove_4, .size = sizeof gMapObjectPic_MayFieldMove_4}
};

const struct SpriteFrameImage gMapObjectPicTable_Cameraman[] = {
    {.data = (u8 *)gMapObjectPic_Cameraman_0, .size = sizeof gMapObjectPic_Cameraman_0},
    {.data = (u8 *)gMapObjectPic_Cameraman_1, .size = sizeof gMapObjectPic_Cameraman_1},
    {.data = (u8 *)gMapObjectPic_Cameraman_2, .size = sizeof gMapObjectPic_Cameraman_2},
    {.data = (u8 *)gMapObjectPic_Cameraman_3, .size = sizeof gMapObjectPic_Cameraman_3},
    {.data = (u8 *)gMapObjectPic_Cameraman_4, .size = sizeof gMapObjectPic_Cameraman_4},
    {.data = (u8 *)gMapObjectPic_Cameraman_5, .size = sizeof gMapObjectPic_Cameraman_5},
    {.data = (u8 *)gMapObjectPic_Cameraman_6, .size = sizeof gMapObjectPic_Cameraman_6},
    {.data = (u8 *)gMapObjectPic_Cameraman_7, .size = sizeof gMapObjectPic_Cameraman_7},
    {.data = (u8 *)gMapObjectPic_Cameraman_8, .size = sizeof gMapObjectPic_Cameraman_8}
};

const struct SpriteFrameImage gMapObjectPicTable_MovingBox[] = {
    {.data = (u8 *)gMapObjectPic_MovingBox, .size = sizeof gMapObjectPic_MovingBox}
};

const struct SpriteFrameImage gMapObjectPicTable_CableCar[] = {
    {.data = (u8 *)gMapObjectPic_CableCar, .size = sizeof gMapObjectPic_CableCar}
};

const struct SpriteFrameImage gMapObjectPicTable_Scientist2[] = {
    {.data = (u8 *)gMapObjectPic_Scientist2_0, .size = sizeof gMapObjectPic_Scientist2_0},
    {.data = (u8 *)gMapObjectPic_Scientist2_1, .size = sizeof gMapObjectPic_Scientist2_1},
    {.data = (u8 *)gMapObjectPic_Scientist2_2, .size = sizeof gMapObjectPic_Scientist2_2},
    {.data = (u8 *)gMapObjectPic_Scientist2_3, .size = sizeof gMapObjectPic_Scientist2_3},
    {.data = (u8 *)gMapObjectPic_Scientist2_4, .size = sizeof gMapObjectPic_Scientist2_4},
    {.data = (u8 *)gMapObjectPic_Scientist2_5, .size = sizeof gMapObjectPic_Scientist2_5},
    {.data = (u8 *)gMapObjectPic_Scientist2_6, .size = sizeof gMapObjectPic_Scientist2_6},
    {.data = (u8 *)gMapObjectPic_Scientist2_7, .size = sizeof gMapObjectPic_Scientist2_7},
    {.data = (u8 *)gMapObjectPic_Scientist2_8, .size = sizeof gMapObjectPic_Scientist2_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Man7[] = {
    {.data = (u8 *)gMapObjectPic_Man7_0, .size = sizeof gMapObjectPic_Man7_0},
    {.data = (u8 *)gMapObjectPic_Man7_1, .size = sizeof gMapObjectPic_Man7_1},
    {.data = (u8 *)gMapObjectPic_Man7_2, .size = sizeof gMapObjectPic_Man7_2},
    {.data = (u8 *)gMapObjectPic_Man7_3, .size = sizeof gMapObjectPic_Man7_3},
    {.data = (u8 *)gMapObjectPic_Man7_4, .size = sizeof gMapObjectPic_Man7_4},
    {.data = (u8 *)gMapObjectPic_Man7_5, .size = sizeof gMapObjectPic_Man7_5},
    {.data = (u8 *)gMapObjectPic_Man7_6, .size = sizeof gMapObjectPic_Man7_6},
    {.data = (u8 *)gMapObjectPic_Man7_7, .size = sizeof gMapObjectPic_Man7_7},
    {.data = (u8 *)gMapObjectPic_Man7_8, .size = sizeof gMapObjectPic_Man7_8}
};

const struct SpriteFrameImage gMapObjectPicTable_AquaMemberM[] = {
    {.data = (u8 *)gMapObjectPic_AquaMemberM_0, .size = sizeof gMapObjectPic_AquaMemberM_0},
    {.data = (u8 *)gMapObjectPic_AquaMemberM_1, .size = sizeof gMapObjectPic_AquaMemberM_1},
    {.data = (u8 *)gMapObjectPic_AquaMemberM_2, .size = sizeof gMapObjectPic_AquaMemberM_2},
    {.data = (u8 *)gMapObjectPic_AquaMemberM_3, .size = sizeof gMapObjectPic_AquaMemberM_3},
    {.data = (u8 *)gMapObjectPic_AquaMemberM_4, .size = sizeof gMapObjectPic_AquaMemberM_4},
    {.data = (u8 *)gMapObjectPic_AquaMemberM_5, .size = sizeof gMapObjectPic_AquaMemberM_5},
    {.data = (u8 *)gMapObjectPic_AquaMemberM_6, .size = sizeof gMapObjectPic_AquaMemberM_6},
    {.data = (u8 *)gMapObjectPic_AquaMemberM_7, .size = sizeof gMapObjectPic_AquaMemberM_7},
    {.data = (u8 *)gMapObjectPic_AquaMemberM_8, .size = sizeof gMapObjectPic_AquaMemberM_8}
};

const struct SpriteFrameImage gMapObjectPicTable_AquaMemberF[] = {
    {.data = (u8 *)gMapObjectPic_AquaMemberF_0, .size = sizeof gMapObjectPic_AquaMemberF_0},
    {.data = (u8 *)gMapObjectPic_AquaMemberF_1, .size = sizeof gMapObjectPic_AquaMemberF_1},
    {.data = (u8 *)gMapObjectPic_AquaMemberF_2, .size = sizeof gMapObjectPic_AquaMemberF_2},
    {.data = (u8 *)gMapObjectPic_AquaMemberF_3, .size = sizeof gMapObjectPic_AquaMemberF_3},
    {.data = (u8 *)gMapObjectPic_AquaMemberF_4, .size = sizeof gMapObjectPic_AquaMemberF_4},
    {.data = (u8 *)gMapObjectPic_AquaMemberF_5, .size = sizeof gMapObjectPic_AquaMemberF_5},
    {.data = (u8 *)gMapObjectPic_AquaMemberF_6, .size = sizeof gMapObjectPic_AquaMemberF_6},
    {.data = (u8 *)gMapObjectPic_AquaMemberF_7, .size = sizeof gMapObjectPic_AquaMemberF_7},
    {.data = (u8 *)gMapObjectPic_AquaMemberF_8, .size = sizeof gMapObjectPic_AquaMemberF_8}
};

const struct SpriteFrameImage gMapObjectPicTable_MagmaMemberM[] = {
    {.data = (u8 *)gMapObjectPic_MagmaMemberM_0, .size = sizeof gMapObjectPic_MagmaMemberM_0},
    {.data = (u8 *)gMapObjectPic_MagmaMemberM_1, .size = sizeof gMapObjectPic_MagmaMemberM_1},
    {.data = (u8 *)gMapObjectPic_MagmaMemberM_2, .size = sizeof gMapObjectPic_MagmaMemberM_2},
    {.data = (u8 *)gMapObjectPic_MagmaMemberM_3, .size = sizeof gMapObjectPic_MagmaMemberM_3},
    {.data = (u8 *)gMapObjectPic_MagmaMemberM_4, .size = sizeof gMapObjectPic_MagmaMemberM_4},
    {.data = (u8 *)gMapObjectPic_MagmaMemberM_5, .size = sizeof gMapObjectPic_MagmaMemberM_5},
    {.data = (u8 *)gMapObjectPic_MagmaMemberM_6, .size = sizeof gMapObjectPic_MagmaMemberM_6},
    {.data = (u8 *)gMapObjectPic_MagmaMemberM_7, .size = sizeof gMapObjectPic_MagmaMemberM_7},
    {.data = (u8 *)gMapObjectPic_MagmaMemberM_8, .size = sizeof gMapObjectPic_MagmaMemberM_8}
};

const struct SpriteFrameImage gMapObjectPicTable_MagmaMemberF[] = {
    {.data = (u8 *)gMapObjectPic_MagmaMemberF_0, .size = sizeof gMapObjectPic_MagmaMemberF_0},
    {.data = (u8 *)gMapObjectPic_MagmaMemberF_1, .size = sizeof gMapObjectPic_MagmaMemberF_1},
    {.data = (u8 *)gMapObjectPic_MagmaMemberF_2, .size = sizeof gMapObjectPic_MagmaMemberF_2},
    {.data = (u8 *)gMapObjectPic_MagmaMemberF_3, .size = sizeof gMapObjectPic_MagmaMemberF_3},
    {.data = (u8 *)gMapObjectPic_MagmaMemberF_4, .size = sizeof gMapObjectPic_MagmaMemberF_4},
    {.data = (u8 *)gMapObjectPic_MagmaMemberF_5, .size = sizeof gMapObjectPic_MagmaMemberF_5},
    {.data = (u8 *)gMapObjectPic_MagmaMemberF_6, .size = sizeof gMapObjectPic_MagmaMemberF_6},
    {.data = (u8 *)gMapObjectPic_MagmaMemberF_7, .size = sizeof gMapObjectPic_MagmaMemberF_7},
    {.data = (u8 *)gMapObjectPic_MagmaMemberF_8, .size = sizeof gMapObjectPic_MagmaMemberF_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Sidney[] = {
    {.data = (u8 *)gMapObjectPic_Sidney_0, .size = sizeof gMapObjectPic_Sidney_0},
    {.data = (u8 *)gMapObjectPic_Sidney_1, .size = sizeof gMapObjectPic_Sidney_1},
    {.data = (u8 *)gMapObjectPic_Sidney_2, .size = sizeof gMapObjectPic_Sidney_2},
    {.data = (u8 *)gMapObjectPic_Sidney_0, .size = sizeof gMapObjectPic_Sidney_0},
    {.data = (u8 *)gMapObjectPic_Sidney_0, .size = sizeof gMapObjectPic_Sidney_0},
    {.data = (u8 *)gMapObjectPic_Sidney_1, .size = sizeof gMapObjectPic_Sidney_1},
    {.data = (u8 *)gMapObjectPic_Sidney_1, .size = sizeof gMapObjectPic_Sidney_1},
    {.data = (u8 *)gMapObjectPic_Sidney_2, .size = sizeof gMapObjectPic_Sidney_2},
    {.data = (u8 *)gMapObjectPic_Sidney_2, .size = sizeof gMapObjectPic_Sidney_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Phoebe[] = {
    {.data = (u8 *)gMapObjectPic_Phoebe_0, .size = sizeof gMapObjectPic_Phoebe_0},
    {.data = (u8 *)gMapObjectPic_Phoebe_1, .size = sizeof gMapObjectPic_Phoebe_1},
    {.data = (u8 *)gMapObjectPic_Phoebe_2, .size = sizeof gMapObjectPic_Phoebe_2},
    {.data = (u8 *)gMapObjectPic_Phoebe_0, .size = sizeof gMapObjectPic_Phoebe_0},
    {.data = (u8 *)gMapObjectPic_Phoebe_0, .size = sizeof gMapObjectPic_Phoebe_0},
    {.data = (u8 *)gMapObjectPic_Phoebe_1, .size = sizeof gMapObjectPic_Phoebe_1},
    {.data = (u8 *)gMapObjectPic_Phoebe_1, .size = sizeof gMapObjectPic_Phoebe_1},
    {.data = (u8 *)gMapObjectPic_Phoebe_2, .size = sizeof gMapObjectPic_Phoebe_2},
    {.data = (u8 *)gMapObjectPic_Phoebe_2, .size = sizeof gMapObjectPic_Phoebe_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Glacia[] = {
    {.data = (u8 *)gMapObjectPic_Glacia_0, .size = sizeof gMapObjectPic_Glacia_0},
    {.data = (u8 *)gMapObjectPic_Glacia_1, .size = sizeof gMapObjectPic_Glacia_1},
    {.data = (u8 *)gMapObjectPic_Glacia_2, .size = sizeof gMapObjectPic_Glacia_2},
    {.data = (u8 *)gMapObjectPic_Glacia_0, .size = sizeof gMapObjectPic_Glacia_0},
    {.data = (u8 *)gMapObjectPic_Glacia_0, .size = sizeof gMapObjectPic_Glacia_0},
    {.data = (u8 *)gMapObjectPic_Glacia_1, .size = sizeof gMapObjectPic_Glacia_1},
    {.data = (u8 *)gMapObjectPic_Glacia_1, .size = sizeof gMapObjectPic_Glacia_1},
    {.data = (u8 *)gMapObjectPic_Glacia_2, .size = sizeof gMapObjectPic_Glacia_2},
    {.data = (u8 *)gMapObjectPic_Glacia_2, .size = sizeof gMapObjectPic_Glacia_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Drake[] = {
    {.data = (u8 *)gMapObjectPic_Drake_0, .size = sizeof gMapObjectPic_Drake_0},
    {.data = (u8 *)gMapObjectPic_Drake_1, .size = sizeof gMapObjectPic_Drake_1},
    {.data = (u8 *)gMapObjectPic_Drake_2, .size = sizeof gMapObjectPic_Drake_2},
    {.data = (u8 *)gMapObjectPic_Drake_0, .size = sizeof gMapObjectPic_Drake_0},
    {.data = (u8 *)gMapObjectPic_Drake_0, .size = sizeof gMapObjectPic_Drake_0},
    {.data = (u8 *)gMapObjectPic_Drake_1, .size = sizeof gMapObjectPic_Drake_1},
    {.data = (u8 *)gMapObjectPic_Drake_1, .size = sizeof gMapObjectPic_Drake_1},
    {.data = (u8 *)gMapObjectPic_Drake_2, .size = sizeof gMapObjectPic_Drake_2},
    {.data = (u8 *)gMapObjectPic_Drake_2, .size = sizeof gMapObjectPic_Drake_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Roxanne[] = {
    {.data = (u8 *)gMapObjectPic_Roxanne_0, .size = sizeof gMapObjectPic_Roxanne_0},
    {.data = (u8 *)gMapObjectPic_Roxanne_1, .size = sizeof gMapObjectPic_Roxanne_1},
    {.data = (u8 *)gMapObjectPic_Roxanne_2, .size = sizeof gMapObjectPic_Roxanne_2},
    {.data = (u8 *)gMapObjectPic_Roxanne_0, .size = sizeof gMapObjectPic_Roxanne_0},
    {.data = (u8 *)gMapObjectPic_Roxanne_0, .size = sizeof gMapObjectPic_Roxanne_0},
    {.data = (u8 *)gMapObjectPic_Roxanne_1, .size = sizeof gMapObjectPic_Roxanne_1},
    {.data = (u8 *)gMapObjectPic_Roxanne_1, .size = sizeof gMapObjectPic_Roxanne_1},
    {.data = (u8 *)gMapObjectPic_Roxanne_2, .size = sizeof gMapObjectPic_Roxanne_2},
    {.data = (u8 *)gMapObjectPic_Roxanne_2, .size = sizeof gMapObjectPic_Roxanne_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Brawly[] = {
    {.data = (u8 *)gMapObjectPic_Brawly_0, .size = sizeof gMapObjectPic_Brawly_0},
    {.data = (u8 *)gMapObjectPic_Brawly_1, .size = sizeof gMapObjectPic_Brawly_1},
    {.data = (u8 *)gMapObjectPic_Brawly_2, .size = sizeof gMapObjectPic_Brawly_2},
    {.data = (u8 *)gMapObjectPic_Brawly_0, .size = sizeof gMapObjectPic_Brawly_0},
    {.data = (u8 *)gMapObjectPic_Brawly_0, .size = sizeof gMapObjectPic_Brawly_0},
    {.data = (u8 *)gMapObjectPic_Brawly_1, .size = sizeof gMapObjectPic_Brawly_1},
    {.data = (u8 *)gMapObjectPic_Brawly_1, .size = sizeof gMapObjectPic_Brawly_1},
    {.data = (u8 *)gMapObjectPic_Brawly_2, .size = sizeof gMapObjectPic_Brawly_2},
    {.data = (u8 *)gMapObjectPic_Brawly_2, .size = sizeof gMapObjectPic_Brawly_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Wattson[] = {
    {.data = (u8 *)gMapObjectPic_Wattson_0, .size = sizeof gMapObjectPic_Wattson_0},
    {.data = (u8 *)gMapObjectPic_Wattson_1, .size = sizeof gMapObjectPic_Wattson_1},
    {.data = (u8 *)gMapObjectPic_Wattson_2, .size = sizeof gMapObjectPic_Wattson_2},
    {.data = (u8 *)gMapObjectPic_Wattson_0, .size = sizeof gMapObjectPic_Wattson_0},
    {.data = (u8 *)gMapObjectPic_Wattson_0, .size = sizeof gMapObjectPic_Wattson_0},
    {.data = (u8 *)gMapObjectPic_Wattson_1, .size = sizeof gMapObjectPic_Wattson_1},
    {.data = (u8 *)gMapObjectPic_Wattson_1, .size = sizeof gMapObjectPic_Wattson_1},
    {.data = (u8 *)gMapObjectPic_Wattson_2, .size = sizeof gMapObjectPic_Wattson_2},
    {.data = (u8 *)gMapObjectPic_Wattson_2, .size = sizeof gMapObjectPic_Wattson_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Flannery[] = {
    {.data = (u8 *)gMapObjectPic_Flannery_0, .size = sizeof gMapObjectPic_Flannery_0},
    {.data = (u8 *)gMapObjectPic_Flannery_1, .size = sizeof gMapObjectPic_Flannery_1},
    {.data = (u8 *)gMapObjectPic_Flannery_2, .size = sizeof gMapObjectPic_Flannery_2},
    {.data = (u8 *)gMapObjectPic_Flannery_0, .size = sizeof gMapObjectPic_Flannery_0},
    {.data = (u8 *)gMapObjectPic_Flannery_0, .size = sizeof gMapObjectPic_Flannery_0},
    {.data = (u8 *)gMapObjectPic_Flannery_1, .size = sizeof gMapObjectPic_Flannery_1},
    {.data = (u8 *)gMapObjectPic_Flannery_1, .size = sizeof gMapObjectPic_Flannery_1},
    {.data = (u8 *)gMapObjectPic_Flannery_2, .size = sizeof gMapObjectPic_Flannery_2},
    {.data = (u8 *)gMapObjectPic_Flannery_2, .size = sizeof gMapObjectPic_Flannery_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Norman[] = {
    {.data = (u8 *)gMapObjectPic_Norman_0, .size = sizeof gMapObjectPic_Norman_0},
    {.data = (u8 *)gMapObjectPic_Norman_1, .size = sizeof gMapObjectPic_Norman_1},
    {.data = (u8 *)gMapObjectPic_Norman_2, .size = sizeof gMapObjectPic_Norman_2},
    {.data = (u8 *)gMapObjectPic_Norman_3, .size = sizeof gMapObjectPic_Norman_3},
    {.data = (u8 *)gMapObjectPic_Norman_4, .size = sizeof gMapObjectPic_Norman_4},
    {.data = (u8 *)gMapObjectPic_Norman_5, .size = sizeof gMapObjectPic_Norman_5},
    {.data = (u8 *)gMapObjectPic_Norman_6, .size = sizeof gMapObjectPic_Norman_6},
    {.data = (u8 *)gMapObjectPic_Norman_7, .size = sizeof gMapObjectPic_Norman_7},
    {.data = (u8 *)gMapObjectPic_Norman_8, .size = sizeof gMapObjectPic_Norman_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Winona[] = {
    {.data = (u8 *)gMapObjectPic_Winona_0, .size = sizeof gMapObjectPic_Winona_0},
    {.data = (u8 *)gMapObjectPic_Winona_1, .size = sizeof gMapObjectPic_Winona_1},
    {.data = (u8 *)gMapObjectPic_Winona_2, .size = sizeof gMapObjectPic_Winona_2},
    {.data = (u8 *)gMapObjectPic_Winona_0, .size = sizeof gMapObjectPic_Winona_0},
    {.data = (u8 *)gMapObjectPic_Winona_0, .size = sizeof gMapObjectPic_Winona_0},
    {.data = (u8 *)gMapObjectPic_Winona_1, .size = sizeof gMapObjectPic_Winona_1},
    {.data = (u8 *)gMapObjectPic_Winona_1, .size = sizeof gMapObjectPic_Winona_1},
    {.data = (u8 *)gMapObjectPic_Winona_2, .size = sizeof gMapObjectPic_Winona_2},
    {.data = (u8 *)gMapObjectPic_Winona_2, .size = sizeof gMapObjectPic_Winona_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Liza[] = {
    {.data = (u8 *)gMapObjectPic_Liza_0, .size = sizeof gMapObjectPic_Liza_0},
    {.data = (u8 *)gMapObjectPic_Liza_1, .size = sizeof gMapObjectPic_Liza_1},
    {.data = (u8 *)gMapObjectPic_Liza_2, .size = sizeof gMapObjectPic_Liza_2},
    {.data = (u8 *)gMapObjectPic_Liza_0, .size = sizeof gMapObjectPic_Liza_0},
    {.data = (u8 *)gMapObjectPic_Liza_0, .size = sizeof gMapObjectPic_Liza_0},
    {.data = (u8 *)gMapObjectPic_Liza_1, .size = sizeof gMapObjectPic_Liza_1},
    {.data = (u8 *)gMapObjectPic_Liza_1, .size = sizeof gMapObjectPic_Liza_1},
    {.data = (u8 *)gMapObjectPic_Liza_2, .size = sizeof gMapObjectPic_Liza_2},
    {.data = (u8 *)gMapObjectPic_Liza_2, .size = sizeof gMapObjectPic_Liza_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Tate[] = {
    {.data = (u8 *)gMapObjectPic_Tate_0, .size = sizeof gMapObjectPic_Tate_0},
    {.data = (u8 *)gMapObjectPic_Tate_1, .size = sizeof gMapObjectPic_Tate_1},
    {.data = (u8 *)gMapObjectPic_Tate_2, .size = sizeof gMapObjectPic_Tate_2},
    {.data = (u8 *)gMapObjectPic_Tate_0, .size = sizeof gMapObjectPic_Tate_0},
    {.data = (u8 *)gMapObjectPic_Tate_0, .size = sizeof gMapObjectPic_Tate_0},
    {.data = (u8 *)gMapObjectPic_Tate_1, .size = sizeof gMapObjectPic_Tate_1},
    {.data = (u8 *)gMapObjectPic_Tate_1, .size = sizeof gMapObjectPic_Tate_1},
    {.data = (u8 *)gMapObjectPic_Tate_2, .size = sizeof gMapObjectPic_Tate_2},
    {.data = (u8 *)gMapObjectPic_Tate_2, .size = sizeof gMapObjectPic_Tate_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Wallace[] = {
    {.data = (u8 *)gMapObjectPic_Wallace_0, .size = sizeof gMapObjectPic_Wallace_0},
    {.data = (u8 *)gMapObjectPic_Wallace_1, .size = sizeof gMapObjectPic_Wallace_1},
    {.data = (u8 *)gMapObjectPic_Wallace_2, .size = sizeof gMapObjectPic_Wallace_2},
    {.data = (u8 *)gMapObjectPic_Wallace_3, .size = sizeof gMapObjectPic_Wallace_3},
    {.data = (u8 *)gMapObjectPic_Wallace_4, .size = sizeof gMapObjectPic_Wallace_4},
    {.data = (u8 *)gMapObjectPic_Wallace_5, .size = sizeof gMapObjectPic_Wallace_5},
    {.data = (u8 *)gMapObjectPic_Wallace_6, .size = sizeof gMapObjectPic_Wallace_6},
    {.data = (u8 *)gMapObjectPic_Wallace_7, .size = sizeof gMapObjectPic_Wallace_7},
    {.data = (u8 *)gMapObjectPic_Wallace_8, .size = sizeof gMapObjectPic_Wallace_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Steven[] = {
    {.data = (u8 *)gMapObjectPic_Steven_0, .size = sizeof gMapObjectPic_Steven_0},
    {.data = (u8 *)gMapObjectPic_Steven_1, .size = sizeof gMapObjectPic_Steven_1},
    {.data = (u8 *)gMapObjectPic_Steven_2, .size = sizeof gMapObjectPic_Steven_2},
    {.data = (u8 *)gMapObjectPic_Steven_3, .size = sizeof gMapObjectPic_Steven_3},
    {.data = (u8 *)gMapObjectPic_Steven_4, .size = sizeof gMapObjectPic_Steven_4},
    {.data = (u8 *)gMapObjectPic_Steven_5, .size = sizeof gMapObjectPic_Steven_5},
    {.data = (u8 *)gMapObjectPic_Steven_6, .size = sizeof gMapObjectPic_Steven_6},
    {.data = (u8 *)gMapObjectPic_Steven_7, .size = sizeof gMapObjectPic_Steven_7},
    {.data = (u8 *)gMapObjectPic_Steven_8, .size = sizeof gMapObjectPic_Steven_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Wally[] = {
    {.data = (u8 *)gMapObjectPic_Wally_0, .size = sizeof gMapObjectPic_Wally_0},
    {.data = (u8 *)gMapObjectPic_Wally_1, .size = sizeof gMapObjectPic_Wally_1},
    {.data = (u8 *)gMapObjectPic_Wally_2, .size = sizeof gMapObjectPic_Wally_2},
    {.data = (u8 *)gMapObjectPic_Wally_3, .size = sizeof gMapObjectPic_Wally_3},
    {.data = (u8 *)gMapObjectPic_Wally_4, .size = sizeof gMapObjectPic_Wally_4},
    {.data = (u8 *)gMapObjectPic_Wally_5, .size = sizeof gMapObjectPic_Wally_5},
    {.data = (u8 *)gMapObjectPic_Wally_6, .size = sizeof gMapObjectPic_Wally_6},
    {.data = (u8 *)gMapObjectPic_Wally_7, .size = sizeof gMapObjectPic_Wally_7},
    {.data = (u8 *)gMapObjectPic_Wally_8, .size = sizeof gMapObjectPic_Wally_8}
};

const struct SpriteFrameImage gMapObjectPicTable_LittleBoy3[] = {
    {.data = (u8 *)gMapObjectPic_LittleBoy3_0, .size = sizeof gMapObjectPic_LittleBoy3_0},
    {.data = (u8 *)gMapObjectPic_LittleBoy3_1, .size = sizeof gMapObjectPic_LittleBoy3_1},
    {.data = (u8 *)gMapObjectPic_LittleBoy3_2, .size = sizeof gMapObjectPic_LittleBoy3_2},
    {.data = (u8 *)gMapObjectPic_LittleBoy3_3, .size = sizeof gMapObjectPic_LittleBoy3_3},
    {.data = (u8 *)gMapObjectPic_LittleBoy3_4, .size = sizeof gMapObjectPic_LittleBoy3_4},
    {.data = (u8 *)gMapObjectPic_LittleBoy3_5, .size = sizeof gMapObjectPic_LittleBoy3_5},
    {.data = (u8 *)gMapObjectPic_LittleBoy3_6, .size = sizeof gMapObjectPic_LittleBoy3_6},
    {.data = (u8 *)gMapObjectPic_LittleBoy3_7, .size = sizeof gMapObjectPic_LittleBoy3_7},
    {.data = (u8 *)gMapObjectPic_LittleBoy3_8, .size = sizeof gMapObjectPic_LittleBoy3_8}
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanFishing[] = {
    {.data = (u8 *)gMapObjectPic_BrendanFishing_0, .size = sizeof gMapObjectPic_BrendanFishing_0},
    {.data = (u8 *)gMapObjectPic_BrendanFishing_1, .size = sizeof gMapObjectPic_BrendanFishing_1},
    {.data = (u8 *)gMapObjectPic_BrendanFishing_2, .size = sizeof gMapObjectPic_BrendanFishing_2},
    {.data = (u8 *)gMapObjectPic_BrendanFishing_3, .size = sizeof gMapObjectPic_BrendanFishing_3},
    {.data = (u8 *)gMapObjectPic_BrendanFishing_4, .size = sizeof gMapObjectPic_BrendanFishing_4},
    {.data = (u8 *)gMapObjectPic_BrendanFishing_5, .size = sizeof gMapObjectPic_BrendanFishing_5},
    {.data = (u8 *)gMapObjectPic_BrendanFishing_6, .size = sizeof gMapObjectPic_BrendanFishing_6},
    {.data = (u8 *)gMapObjectPic_BrendanFishing_7, .size = sizeof gMapObjectPic_BrendanFishing_7},
    {.data = (u8 *)gMapObjectPic_BrendanFishing_8, .size = sizeof gMapObjectPic_BrendanFishing_8},
    {.data = (u8 *)gMapObjectPic_BrendanFishing_9, .size = sizeof gMapObjectPic_BrendanFishing_9},
    {.data = (u8 *)gMapObjectPic_BrendanFishing_10, .size = sizeof gMapObjectPic_BrendanFishing_10},
    {.data = (u8 *)gMapObjectPic_BrendanFishing_11, .size = sizeof gMapObjectPic_BrendanFishing_11}
};

const struct SpriteFrameImage gMapObjectPicTable_MayFishing[] = {
    {.data = (u8 *)gMapObjectPic_MayFishing_0, .size = sizeof gMapObjectPic_MayFishing_0},
    {.data = (u8 *)gMapObjectPic_MayFishing_1, .size = sizeof gMapObjectPic_MayFishing_1},
    {.data = (u8 *)gMapObjectPic_MayFishing_2, .size = sizeof gMapObjectPic_MayFishing_2},
    {.data = (u8 *)gMapObjectPic_MayFishing_3, .size = sizeof gMapObjectPic_MayFishing_3},
    {.data = (u8 *)gMapObjectPic_MayFishing_4, .size = sizeof gMapObjectPic_MayFishing_4},
    {.data = (u8 *)gMapObjectPic_MayFishing_5, .size = sizeof gMapObjectPic_MayFishing_5},
    {.data = (u8 *)gMapObjectPic_MayFishing_6, .size = sizeof gMapObjectPic_MayFishing_6},
    {.data = (u8 *)gMapObjectPic_MayFishing_7, .size = sizeof gMapObjectPic_MayFishing_7},
    {.data = (u8 *)gMapObjectPic_MayFishing_8, .size = sizeof gMapObjectPic_MayFishing_8},
    {.data = (u8 *)gMapObjectPic_MayFishing_9, .size = sizeof gMapObjectPic_MayFishing_9},
    {.data = (u8 *)gMapObjectPic_MayFishing_10, .size = sizeof gMapObjectPic_MayFishing_10},
    {.data = (u8 *)gMapObjectPic_MayFishing_11, .size = sizeof gMapObjectPic_MayFishing_11}
};

const struct SpriteFrameImage gMapObjectPicTable_HotSpringsOldWoman[] = {
    {.data = (u8 *)gMapObjectPic_HotSpringsOldWoman_0, .size = sizeof gMapObjectPic_HotSpringsOldWoman_0},
    {.data = (u8 *)gMapObjectPic_HotSpringsOldWoman_1, .size = sizeof gMapObjectPic_HotSpringsOldWoman_1},
    {.data = (u8 *)gMapObjectPic_HotSpringsOldWoman_2, .size = sizeof gMapObjectPic_HotSpringsOldWoman_2},
    {.data = (u8 *)gMapObjectPic_HotSpringsOldWoman_3, .size = sizeof gMapObjectPic_HotSpringsOldWoman_3},
    {.data = (u8 *)gMapObjectPic_HotSpringsOldWoman_4, .size = sizeof gMapObjectPic_HotSpringsOldWoman_4},
    {.data = (u8 *)gMapObjectPic_HotSpringsOldWoman_5, .size = sizeof gMapObjectPic_HotSpringsOldWoman_5},
    {.data = (u8 *)gMapObjectPic_HotSpringsOldWoman_6, .size = sizeof gMapObjectPic_HotSpringsOldWoman_6},
    {.data = (u8 *)gMapObjectPic_HotSpringsOldWoman_7, .size = sizeof gMapObjectPic_HotSpringsOldWoman_7},
    {.data = (u8 *)gMapObjectPic_HotSpringsOldWoman_8, .size = sizeof gMapObjectPic_HotSpringsOldWoman_8}
};

const struct SpriteFrameImage gMapObjectPicTable_SSTidal[] = {
    {.data = (u8 *)gMapObjectPic_SSTidal, .size = sizeof gMapObjectPic_SSTidal},
    {.data = (u8 *)gMapObjectPic_SSTidal, .size = sizeof gMapObjectPic_SSTidal},
    {.data = (u8 *)gMapObjectPic_SSTidal, .size = sizeof gMapObjectPic_SSTidal},
    {.data = (u8 *)gMapObjectPic_SSTidal, .size = sizeof gMapObjectPic_SSTidal},
    {.data = (u8 *)gMapObjectPic_SSTidal, .size = sizeof gMapObjectPic_SSTidal},
    {.data = (u8 *)gMapObjectPic_SSTidal, .size = sizeof gMapObjectPic_SSTidal},
    {.data = (u8 *)gMapObjectPic_SSTidal, .size = sizeof gMapObjectPic_SSTidal},
    {.data = (u8 *)gMapObjectPic_SSTidal, .size = sizeof gMapObjectPic_SSTidal},
    {.data = (u8 *)gMapObjectPic_SSTidal, .size = sizeof gMapObjectPic_SSTidal}
};

const struct SpriteFrameImage gMapObjectPicTable_SubmarineShadow[] = {
    {.data = (u8 *)gMapObjectPic_SubmarineShadow, .size = sizeof gMapObjectPic_SubmarineShadow},
    {.data = (u8 *)gMapObjectPic_SubmarineShadow, .size = sizeof gMapObjectPic_SubmarineShadow},
    {.data = (u8 *)gMapObjectPic_SubmarineShadow, .size = sizeof gMapObjectPic_SubmarineShadow},
    {.data = (u8 *)gMapObjectPic_SubmarineShadow, .size = sizeof gMapObjectPic_SubmarineShadow},
    {.data = (u8 *)gMapObjectPic_SubmarineShadow, .size = sizeof gMapObjectPic_SubmarineShadow},
    {.data = (u8 *)gMapObjectPic_SubmarineShadow, .size = sizeof gMapObjectPic_SubmarineShadow},
    {.data = (u8 *)gMapObjectPic_SubmarineShadow, .size = sizeof gMapObjectPic_SubmarineShadow},
    {.data = (u8 *)gMapObjectPic_SubmarineShadow, .size = sizeof gMapObjectPic_SubmarineShadow},
    {.data = (u8 *)gMapObjectPic_SubmarineShadow, .size = sizeof gMapObjectPic_SubmarineShadow}
};

const struct SpriteFrameImage gMapObjectPicTable_PichuDoll[] = {
    {.data = (u8 *)gMapObjectPic_PichuDoll, .size = sizeof gMapObjectPic_PichuDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_PikachuDoll[] = {
    {.data = (u8 *)gMapObjectPic_PikachuDoll, .size = sizeof gMapObjectPic_PikachuDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_MarillDoll[] = {
    {.data = (u8 *)gMapObjectPic_MarillDoll, .size = sizeof gMapObjectPic_MarillDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_TogepiDoll[] = {
    {.data = (u8 *)gMapObjectPic_TogepiDoll, .size = sizeof gMapObjectPic_TogepiDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_CyndaquilDoll[] = {
    {.data = (u8 *)gMapObjectPic_CyndaquilDoll, .size = sizeof gMapObjectPic_CyndaquilDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_ChikoritaDoll[] = {
    {.data = (u8 *)gMapObjectPic_ChikoritaDoll, .size = sizeof gMapObjectPic_ChikoritaDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_TotodileDoll[] = {
    {.data = (u8 *)gMapObjectPic_TotodileDoll, .size = sizeof gMapObjectPic_TotodileDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_JigglypuffDoll[] = {
    {.data = (u8 *)gMapObjectPic_JigglypuffDoll, .size = sizeof gMapObjectPic_JigglypuffDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_MeowthDoll[] = {
    {.data = (u8 *)gMapObjectPic_MeowthDoll, .size = sizeof gMapObjectPic_MeowthDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_ClefairyDoll[] = {
    {.data = (u8 *)gMapObjectPic_ClefairyDoll, .size = sizeof gMapObjectPic_ClefairyDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_DittoDoll[] = {
    {.data = (u8 *)gMapObjectPic_DittoDoll, .size = sizeof gMapObjectPic_DittoDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_SmoochumDoll[] = {
    {.data = (u8 *)gMapObjectPic_SmoochumDoll, .size = sizeof gMapObjectPic_SmoochumDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_TreeckoDoll[] = {
    {.data = (u8 *)gMapObjectPic_TreeckoDoll, .size = sizeof gMapObjectPic_TreeckoDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_TorchicDoll[] = {
    {.data = (u8 *)gMapObjectPic_TorchicDoll, .size = sizeof gMapObjectPic_TorchicDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_MudkipDoll[] = {
    {.data = (u8 *)gMapObjectPic_MudkipDoll, .size = sizeof gMapObjectPic_MudkipDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_DuskullDoll[] = {
    {.data = (u8 *)gMapObjectPic_DuskullDoll, .size = sizeof gMapObjectPic_DuskullDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_WynautDoll[] = {
    {.data = (u8 *)gMapObjectPic_WynautDoll, .size = sizeof gMapObjectPic_WynautDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_BaltoyDoll[] = {
    {.data = (u8 *)gMapObjectPic_BaltoyDoll, .size = sizeof gMapObjectPic_BaltoyDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_KecleonDoll[] = {
    {.data = (u8 *)gMapObjectPic_KecleonDoll, .size = sizeof gMapObjectPic_KecleonDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_AzurillDoll[] = {
    {.data = (u8 *)gMapObjectPic_AzurillDoll, .size = sizeof gMapObjectPic_AzurillDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_SkittyDoll[] = {
    {.data = (u8 *)gMapObjectPic_SkittyDoll, .size = sizeof gMapObjectPic_SkittyDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_SwabluDoll[] = {
    {.data = (u8 *)gMapObjectPic_SwabluDoll, .size = sizeof gMapObjectPic_SwabluDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_GulpinDoll[] = {
    {.data = (u8 *)gMapObjectPic_GulpinDoll, .size = sizeof gMapObjectPic_GulpinDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_LotadDoll[] = {
    {.data = (u8 *)gMapObjectPic_LotadDoll, .size = sizeof gMapObjectPic_LotadDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_SeedotDoll[] = {
    {.data = (u8 *)gMapObjectPic_SeedotDoll, .size = sizeof gMapObjectPic_SeedotDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_PikaCushion[] = {
    {.data = (u8 *)gMapObjectPic_PikaCushion, .size = sizeof gMapObjectPic_PikaCushion}
};

const struct SpriteFrameImage gMapObjectPicTable_RoundCushion[] = {
    {.data = (u8 *)gMapObjectPic_RoundCushion, .size = sizeof gMapObjectPic_RoundCushion}
};

const struct SpriteFrameImage gMapObjectPicTable_KissCushion[] = {
    {.data = (u8 *)gMapObjectPic_KissCushion, .size = sizeof gMapObjectPic_KissCushion}
};

const struct SpriteFrameImage gMapObjectPicTable_ZigzagCushion[] = {
    {.data = (u8 *)gMapObjectPic_ZigzagCushion, .size = sizeof gMapObjectPic_ZigzagCushion}
};

const struct SpriteFrameImage gMapObjectPicTable_SpinCushion[] = {
    {.data = (u8 *)gMapObjectPic_SpinCushion, .size = sizeof gMapObjectPic_SpinCushion}
};

const struct SpriteFrameImage gMapObjectPicTable_DiamondCushion[] = {
    {.data = (u8 *)gMapObjectPic_DiamondCushion, .size = sizeof gMapObjectPic_DiamondCushion}
};

const struct SpriteFrameImage gMapObjectPicTable_BallCushion[] = {
    {.data = (u8 *)gMapObjectPic_BallCushion, .size = sizeof gMapObjectPic_BallCushion}
};

const struct SpriteFrameImage gMapObjectPicTable_GrassCushion[] = {
    {.data = (u8 *)gMapObjectPic_GrassCushion, .size = sizeof gMapObjectPic_GrassCushion}
};

const struct SpriteFrameImage gMapObjectPicTable_FireCushion[] = {
    {.data = (u8 *)gMapObjectPic_FireCushion, .size = sizeof gMapObjectPic_FireCushion}
};

const struct SpriteFrameImage gMapObjectPicTable_WaterCushion[] = {
    {.data = (u8 *)gMapObjectPic_WaterCushion, .size = sizeof gMapObjectPic_WaterCushion}
};

const struct SpriteFrameImage gMapObjectPicTable_BigSnorlaxDoll[] = {
    {.data = (u8 *)gMapObjectPic_BigSnorlaxDoll, .size = sizeof gMapObjectPic_BigSnorlaxDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_BigRhydonDoll[] = {
    {.data = (u8 *)gMapObjectPic_BigRhydonDoll, .size = sizeof gMapObjectPic_BigRhydonDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_BigLaprasDoll[] = {
    {.data = (u8 *)gMapObjectPic_BigLaprasDoll, .size = sizeof gMapObjectPic_BigLaprasDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_BigVenusaurDoll[] = {
    {.data = (u8 *)gMapObjectPic_BigVenusaurDoll, .size = sizeof gMapObjectPic_BigVenusaurDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_BigCharizardDoll[] = {
    {.data = (u8 *)gMapObjectPic_BigCharizardDoll, .size = sizeof gMapObjectPic_BigCharizardDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_BigBlastoiseDoll[] = {
    {.data = (u8 *)gMapObjectPic_BigBlastoiseDoll, .size = sizeof gMapObjectPic_BigBlastoiseDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_BigWailmerDoll[] = {
    {.data = (u8 *)gMapObjectPic_BigWailmerDoll, .size = sizeof gMapObjectPic_BigWailmerDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_BigRegirockDoll[] = {
    {.data = (u8 *)gMapObjectPic_BigRegirockDoll, .size = sizeof gMapObjectPic_BigRegirockDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_BigRegiceDoll[] = {
    {.data = (u8 *)gMapObjectPic_BigRegiceDoll, .size = sizeof gMapObjectPic_BigRegiceDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_BigRegisteelDoll[] = {
    {.data = (u8 *)gMapObjectPic_BigRegisteelDoll, .size = sizeof gMapObjectPic_BigRegisteelDoll}
};

const struct SpriteFrameImage gMapObjectPicTable_LatiasLatios[] = {
    {.data = (u8 *)gMapObjectPic_LatiasLatios_0, .size = sizeof gMapObjectPic_LatiasLatios_0},
    {.data = (u8 *)gMapObjectPic_LatiasLatios_0, .size = sizeof gMapObjectPic_LatiasLatios_0},
    {.data = (u8 *)gMapObjectPic_LatiasLatios_0, .size = sizeof gMapObjectPic_LatiasLatios_0},
    {.data = (u8 *)gMapObjectPic_LatiasLatios_1, .size = sizeof gMapObjectPic_LatiasLatios_1},
    {.data = (u8 *)gMapObjectPic_LatiasLatios_2, .size = sizeof gMapObjectPic_LatiasLatios_2},
    {.data = (u8 *)gMapObjectPic_LatiasLatios_1, .size = sizeof gMapObjectPic_LatiasLatios_1},
    {.data = (u8 *)gMapObjectPic_LatiasLatios_2, .size = sizeof gMapObjectPic_LatiasLatios_2},
    {.data = (u8 *)gMapObjectPic_LatiasLatios_1, .size = sizeof gMapObjectPic_LatiasLatios_1},
    {.data = (u8 *)gMapObjectPic_LatiasLatios_2, .size = sizeof gMapObjectPic_LatiasLatios_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Boy5[] = {
    {.data = (u8 *)gMapObjectPic_Boy5_0, .size = sizeof gMapObjectPic_Boy5_0},
    {.data = (u8 *)gMapObjectPic_Boy5_1, .size = sizeof gMapObjectPic_Boy5_1},
    {.data = (u8 *)gMapObjectPic_Boy5_2, .size = sizeof gMapObjectPic_Boy5_2},
    {.data = (u8 *)gMapObjectPic_Boy5_0, .size = sizeof gMapObjectPic_Boy5_0},
    {.data = (u8 *)gMapObjectPic_Boy5_0, .size = sizeof gMapObjectPic_Boy5_0},
    {.data = (u8 *)gMapObjectPic_Boy5_1, .size = sizeof gMapObjectPic_Boy5_1},
    {.data = (u8 *)gMapObjectPic_Boy5_1, .size = sizeof gMapObjectPic_Boy5_1},
    {.data = (u8 *)gMapObjectPic_Boy5_2, .size = sizeof gMapObjectPic_Boy5_2},
    {.data = (u8 *)gMapObjectPic_Boy5_2, .size = sizeof gMapObjectPic_Boy5_2}
};

const struct SpriteFrameImage gMapObjectPicTable_ContestJudge[] = {
    {.data = (u8 *)gMapObjectPic_ContestJudge_0, .size = sizeof gMapObjectPic_ContestJudge_0},
    {.data = (u8 *)gMapObjectPic_ContestJudge_1, .size = sizeof gMapObjectPic_ContestJudge_1},
    {.data = (u8 *)gMapObjectPic_ContestJudge_2, .size = sizeof gMapObjectPic_ContestJudge_2},
    {.data = (u8 *)gMapObjectPic_ContestJudge_3, .size = sizeof gMapObjectPic_ContestJudge_3},
    {.data = (u8 *)gMapObjectPic_ContestJudge_4, .size = sizeof gMapObjectPic_ContestJudge_4},
    {.data = (u8 *)gMapObjectPic_ContestJudge_5, .size = sizeof gMapObjectPic_ContestJudge_5},
    {.data = (u8 *)gMapObjectPic_ContestJudge_6, .size = sizeof gMapObjectPic_ContestJudge_6},
    {.data = (u8 *)gMapObjectPic_ContestJudge_7, .size = sizeof gMapObjectPic_ContestJudge_7},
    {.data = (u8 *)gMapObjectPic_ContestJudge_8, .size = sizeof gMapObjectPic_ContestJudge_8}
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanWatering[] = {
    {.data = (u8 *)gMapObjectPic_BrendanWatering_0, .size = sizeof gMapObjectPic_BrendanWatering_0},
    {.data = (u8 *)gMapObjectPic_BrendanWatering_1, .size = sizeof gMapObjectPic_BrendanWatering_1},
    {.data = (u8 *)gMapObjectPic_BrendanWatering_2, .size = sizeof gMapObjectPic_BrendanWatering_2},
    {.data = (u8 *)gMapObjectPic_BrendanWatering_3, .size = sizeof gMapObjectPic_BrendanWatering_3},
    {.data = (u8 *)gMapObjectPic_BrendanWatering_3, .size = sizeof gMapObjectPic_BrendanWatering_3},
    {.data = (u8 *)gMapObjectPic_BrendanWatering_4, .size = sizeof gMapObjectPic_BrendanWatering_4},
    {.data = (u8 *)gMapObjectPic_BrendanWatering_4, .size = sizeof gMapObjectPic_BrendanWatering_4},
    {.data = (u8 *)gMapObjectPic_BrendanWatering_5, .size = sizeof gMapObjectPic_BrendanWatering_5},
    {.data = (u8 *)gMapObjectPic_BrendanWatering_5, .size = sizeof gMapObjectPic_BrendanWatering_5}
};

const struct SpriteFrameImage gMapObjectPicTable_MayWatering[] = {
    {.data = (u8 *)gMapObjectPic_MayWatering_0, .size = sizeof gMapObjectPic_MayWatering_0},
    {.data = (u8 *)gMapObjectPic_MayWatering_1, .size = sizeof gMapObjectPic_MayWatering_1},
    {.data = (u8 *)gMapObjectPic_MayWatering_2, .size = sizeof gMapObjectPic_MayWatering_2},
    {.data = (u8 *)gMapObjectPic_MayWatering_3, .size = sizeof gMapObjectPic_MayWatering_3},
    {.data = (u8 *)gMapObjectPic_MayWatering_3, .size = sizeof gMapObjectPic_MayWatering_3},
    {.data = (u8 *)gMapObjectPic_MayWatering_4, .size = sizeof gMapObjectPic_MayWatering_4},
    {.data = (u8 *)gMapObjectPic_MayWatering_4, .size = sizeof gMapObjectPic_MayWatering_4},
    {.data = (u8 *)gMapObjectPic_MayWatering_5, .size = sizeof gMapObjectPic_MayWatering_5},
    {.data = (u8 *)gMapObjectPic_MayWatering_5, .size = sizeof gMapObjectPic_MayWatering_5}
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanDecorating[] = {
    {.data = (u8 *)gMapObjectPic_BrendanDecorating, .size = sizeof gMapObjectPic_BrendanDecorating}
};

const struct SpriteFrameImage gMapObjectPicTable_MayDecorating[] = {
    {.data = (u8 *)gMapObjectPic_MayDecorating, .size = sizeof gMapObjectPic_MayDecorating}
};

const struct SpriteFrameImage gMapObjectPicTable_Archie[] = {
    {.data = (u8 *)gMapObjectPic_Archie_0, .size = sizeof gMapObjectPic_Archie_0},
    {.data = (u8 *)gMapObjectPic_Archie_1, .size = sizeof gMapObjectPic_Archie_1},
    {.data = (u8 *)gMapObjectPic_Archie_2, .size = sizeof gMapObjectPic_Archie_2},
    {.data = (u8 *)gMapObjectPic_Archie_3, .size = sizeof gMapObjectPic_Archie_3},
    {.data = (u8 *)gMapObjectPic_Archie_4, .size = sizeof gMapObjectPic_Archie_4},
    {.data = (u8 *)gMapObjectPic_Archie_5, .size = sizeof gMapObjectPic_Archie_5},
    {.data = (u8 *)gMapObjectPic_Archie_6, .size = sizeof gMapObjectPic_Archie_6},
    {.data = (u8 *)gMapObjectPic_Archie_7, .size = sizeof gMapObjectPic_Archie_7},
    {.data = (u8 *)gMapObjectPic_Archie_8, .size = sizeof gMapObjectPic_Archie_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Maxie[] = {
    {.data = (u8 *)gMapObjectPic_Maxie_0, .size = sizeof gMapObjectPic_Maxie_0},
    {.data = (u8 *)gMapObjectPic_Maxie_1, .size = sizeof gMapObjectPic_Maxie_1},
    {.data = (u8 *)gMapObjectPic_Maxie_2, .size = sizeof gMapObjectPic_Maxie_2},
    {.data = (u8 *)gMapObjectPic_Maxie_3, .size = sizeof gMapObjectPic_Maxie_3},
    {.data = (u8 *)gMapObjectPic_Maxie_4, .size = sizeof gMapObjectPic_Maxie_4},
    {.data = (u8 *)gMapObjectPic_Maxie_5, .size = sizeof gMapObjectPic_Maxie_5},
    {.data = (u8 *)gMapObjectPic_Maxie_6, .size = sizeof gMapObjectPic_Maxie_6},
    {.data = (u8 *)gMapObjectPic_Maxie_7, .size = sizeof gMapObjectPic_Maxie_7},
    {.data = (u8 *)gMapObjectPic_Maxie_8, .size = sizeof gMapObjectPic_Maxie_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Kyogre[] = {
    {.data = (u8 *)gMapObjectPic_Kyogre_0, .size = sizeof gMapObjectPic_Kyogre_0},
    {.data = (u8 *)gMapObjectPic_Kyogre_0, .size = sizeof gMapObjectPic_Kyogre_0},
    {.data = (u8 *)gMapObjectPic_Kyogre_0, .size = sizeof gMapObjectPic_Kyogre_0},
    {.data = (u8 *)gMapObjectPic_Kyogre_1, .size = sizeof gMapObjectPic_Kyogre_1},
    {.data = (u8 *)gMapObjectPic_Kyogre_1, .size = sizeof gMapObjectPic_Kyogre_1},
    {.data = (u8 *)gMapObjectPic_Kyogre_1, .size = sizeof gMapObjectPic_Kyogre_1},
    {.data = (u8 *)gMapObjectPic_Kyogre_1, .size = sizeof gMapObjectPic_Kyogre_1},
    {.data = (u8 *)gMapObjectPic_Kyogre_1, .size = sizeof gMapObjectPic_Kyogre_1},
    {.data = (u8 *)gMapObjectPic_Kyogre_1, .size = sizeof gMapObjectPic_Kyogre_1}
};

const struct SpriteFrameImage gMapObjectPicTable_Groudon[] = {
    {.data = (u8 *)gMapObjectPic_Groudon_0, .size = sizeof gMapObjectPic_Groudon_0},
    {.data = (u8 *)gMapObjectPic_Groudon_0, .size = sizeof gMapObjectPic_Groudon_0},
    {.data = (u8 *)gMapObjectPic_Groudon_0, .size = sizeof gMapObjectPic_Groudon_0},
    {.data = (u8 *)gMapObjectPic_Groudon_1, .size = sizeof gMapObjectPic_Groudon_1},
    {.data = (u8 *)gMapObjectPic_Groudon_1, .size = sizeof gMapObjectPic_Groudon_1},
    {.data = (u8 *)gMapObjectPic_Groudon_1, .size = sizeof gMapObjectPic_Groudon_1},
    {.data = (u8 *)gMapObjectPic_Groudon_1, .size = sizeof gMapObjectPic_Groudon_1},
    {.data = (u8 *)gMapObjectPic_Groudon_1, .size = sizeof gMapObjectPic_Groudon_1},
    {.data = (u8 *)gMapObjectPic_Groudon_1, .size = sizeof gMapObjectPic_Groudon_1}
};

const struct SpriteFrameImage gMapObjectPicTable_Fossil[] = {
    {.data = (u8 *)gMapObjectPic_Fossil, .size = sizeof gMapObjectPic_Fossil}
};

const struct SpriteFrameImage gMapObjectPicTable_Regi[] = {
    {.data = (u8 *)gMapObjectPic_Regi, .size = sizeof gMapObjectPic_Regi},
    {.data = (u8 *)gMapObjectPic_Regi, .size = sizeof gMapObjectPic_Regi},
    {.data = (u8 *)gMapObjectPic_Regi, .size = sizeof gMapObjectPic_Regi},
    {.data = (u8 *)gMapObjectPic_Regi, .size = sizeof gMapObjectPic_Regi},
    {.data = (u8 *)gMapObjectPic_Regi, .size = sizeof gMapObjectPic_Regi},
    {.data = (u8 *)gMapObjectPic_Regi, .size = sizeof gMapObjectPic_Regi},
    {.data = (u8 *)gMapObjectPic_Regi, .size = sizeof gMapObjectPic_Regi},
    {.data = (u8 *)gMapObjectPic_Regi, .size = sizeof gMapObjectPic_Regi},
    {.data = (u8 *)gMapObjectPic_Regi, .size = sizeof gMapObjectPic_Regi}
};

const struct SpriteFrameImage gMapObjectPicTable_Skitty[] = {
    {.data = (u8 *)gMapObjectPic_Skitty_0, .size = sizeof gMapObjectPic_Skitty_0},
    {.data = (u8 *)gMapObjectPic_Skitty_1, .size = sizeof gMapObjectPic_Skitty_1},
    {.data = (u8 *)gMapObjectPic_Skitty_2, .size = sizeof gMapObjectPic_Skitty_2},
    {.data = (u8 *)gMapObjectPic_Skitty_0, .size = sizeof gMapObjectPic_Skitty_0},
    {.data = (u8 *)gMapObjectPic_Skitty_0, .size = sizeof gMapObjectPic_Skitty_0},
    {.data = (u8 *)gMapObjectPic_Skitty_1, .size = sizeof gMapObjectPic_Skitty_1},
    {.data = (u8 *)gMapObjectPic_Skitty_1, .size = sizeof gMapObjectPic_Skitty_1},
    {.data = (u8 *)gMapObjectPic_Skitty_2, .size = sizeof gMapObjectPic_Skitty_2},
    {.data = (u8 *)gMapObjectPic_Skitty_2, .size = sizeof gMapObjectPic_Skitty_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Kecleon[] = {
    {.data = (u8 *)gMapObjectPic_Kecleon_0, .size = sizeof gMapObjectPic_Kecleon_0},
    {.data = (u8 *)gMapObjectPic_Kecleon_1, .size = sizeof gMapObjectPic_Kecleon_1},
    {.data = (u8 *)gMapObjectPic_Kecleon_2, .size = sizeof gMapObjectPic_Kecleon_2},
    {.data = (u8 *)gMapObjectPic_Kecleon_0, .size = sizeof gMapObjectPic_Kecleon_0},
    {.data = (u8 *)gMapObjectPic_Kecleon_0, .size = sizeof gMapObjectPic_Kecleon_0},
    {.data = (u8 *)gMapObjectPic_Kecleon_1, .size = sizeof gMapObjectPic_Kecleon_1},
    {.data = (u8 *)gMapObjectPic_Kecleon_1, .size = sizeof gMapObjectPic_Kecleon_1},
    {.data = (u8 *)gMapObjectPic_Kecleon_2, .size = sizeof gMapObjectPic_Kecleon_2},
    {.data = (u8 *)gMapObjectPic_Kecleon_2, .size = sizeof gMapObjectPic_Kecleon_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Rayquaza[] = {
    {.data = (u8 *)gMapObjectPic_Rayquaza_0, .size = sizeof gMapObjectPic_Rayquaza_0},
    {.data = (u8 *)gMapObjectPic_Rayquaza_0, .size = sizeof gMapObjectPic_Rayquaza_0},
    {.data = (u8 *)gMapObjectPic_Rayquaza_0, .size = sizeof gMapObjectPic_Rayquaza_0},
    {.data = (u8 *)gMapObjectPic_Rayquaza_1, .size = sizeof gMapObjectPic_Rayquaza_1},
    {.data = (u8 *)gMapObjectPic_Rayquaza_1, .size = sizeof gMapObjectPic_Rayquaza_1},
    {.data = (u8 *)gMapObjectPic_Rayquaza_1, .size = sizeof gMapObjectPic_Rayquaza_1},
    {.data = (u8 *)gMapObjectPic_Rayquaza_1, .size = sizeof gMapObjectPic_Rayquaza_1},
    {.data = (u8 *)gMapObjectPic_Rayquaza_1, .size = sizeof gMapObjectPic_Rayquaza_1},
    {.data = (u8 *)gMapObjectPic_Rayquaza_1, .size = sizeof gMapObjectPic_Rayquaza_1}
};

const struct SpriteFrameImage gMapObjectPicTable_Zigzagoon[] = {
    {.data = (u8 *)gMapObjectPic_Zigzagoon_0, .size = sizeof gMapObjectPic_Zigzagoon_0},
    {.data = (u8 *)gMapObjectPic_Zigzagoon_1, .size = sizeof gMapObjectPic_Zigzagoon_1},
    {.data = (u8 *)gMapObjectPic_Zigzagoon_2, .size = sizeof gMapObjectPic_Zigzagoon_2},
    {.data = (u8 *)gMapObjectPic_Zigzagoon_0, .size = sizeof gMapObjectPic_Zigzagoon_0},
    {.data = (u8 *)gMapObjectPic_Zigzagoon_0, .size = sizeof gMapObjectPic_Zigzagoon_0},
    {.data = (u8 *)gMapObjectPic_Zigzagoon_1, .size = sizeof gMapObjectPic_Zigzagoon_1},
    {.data = (u8 *)gMapObjectPic_Zigzagoon_1, .size = sizeof gMapObjectPic_Zigzagoon_1},
    {.data = (u8 *)gMapObjectPic_Zigzagoon_2, .size = sizeof gMapObjectPic_Zigzagoon_2},
    {.data = (u8 *)gMapObjectPic_Zigzagoon_2, .size = sizeof gMapObjectPic_Zigzagoon_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Pikachu[] = {
    {.data = (u8 *)gMapObjectPic_Pikachu_0, .size = sizeof gMapObjectPic_Pikachu_0},
    {.data = (u8 *)gMapObjectPic_Pikachu_1, .size = sizeof gMapObjectPic_Pikachu_1},
    {.data = (u8 *)gMapObjectPic_Pikachu_2, .size = sizeof gMapObjectPic_Pikachu_2},
    {.data = (u8 *)gMapObjectPic_Pikachu_0, .size = sizeof gMapObjectPic_Pikachu_0},
    {.data = (u8 *)gMapObjectPic_Pikachu_0, .size = sizeof gMapObjectPic_Pikachu_0},
    {.data = (u8 *)gMapObjectPic_Pikachu_1, .size = sizeof gMapObjectPic_Pikachu_1},
    {.data = (u8 *)gMapObjectPic_Pikachu_1, .size = sizeof gMapObjectPic_Pikachu_1},
    {.data = (u8 *)gMapObjectPic_Pikachu_2, .size = sizeof gMapObjectPic_Pikachu_2},
    {.data = (u8 *)gMapObjectPic_Pikachu_2, .size = sizeof gMapObjectPic_Pikachu_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Azumarill[] = {
    {.data = (u8 *)gMapObjectPic_Azumarill_0, .size = sizeof gMapObjectPic_Azumarill_0},
    {.data = (u8 *)gMapObjectPic_Azumarill_1, .size = sizeof gMapObjectPic_Azumarill_1},
    {.data = (u8 *)gMapObjectPic_Azumarill_2, .size = sizeof gMapObjectPic_Azumarill_2},
    {.data = (u8 *)gMapObjectPic_Azumarill_0, .size = sizeof gMapObjectPic_Azumarill_0},
    {.data = (u8 *)gMapObjectPic_Azumarill_0, .size = sizeof gMapObjectPic_Azumarill_0},
    {.data = (u8 *)gMapObjectPic_Azumarill_1, .size = sizeof gMapObjectPic_Azumarill_1},
    {.data = (u8 *)gMapObjectPic_Azumarill_1, .size = sizeof gMapObjectPic_Azumarill_1},
    {.data = (u8 *)gMapObjectPic_Azumarill_2, .size = sizeof gMapObjectPic_Azumarill_2},
    {.data = (u8 *)gMapObjectPic_Azumarill_2, .size = sizeof gMapObjectPic_Azumarill_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Wingull[] = {
    {.data = (u8 *)gMapObjectPic_Wingull_0, .size = sizeof gMapObjectPic_Wingull_0},
    {.data = (u8 *)gMapObjectPic_Wingull_1, .size = sizeof gMapObjectPic_Wingull_1},
    {.data = (u8 *)gMapObjectPic_Wingull_2, .size = sizeof gMapObjectPic_Wingull_2},
    {.data = (u8 *)gMapObjectPic_Wingull_3, .size = sizeof gMapObjectPic_Wingull_3},
    {.data = (u8 *)gMapObjectPic_Wingull_3, .size = sizeof gMapObjectPic_Wingull_3},
    {.data = (u8 *)gMapObjectPic_Wingull_4, .size = sizeof gMapObjectPic_Wingull_4},
    {.data = (u8 *)gMapObjectPic_Wingull_4, .size = sizeof gMapObjectPic_Wingull_4},
    {.data = (u8 *)gMapObjectPic_Wingull_5, .size = sizeof gMapObjectPic_Wingull_5},
    {.data = (u8 *)gMapObjectPic_Wingull_5, .size = sizeof gMapObjectPic_Wingull_5}
};

const struct SpriteFrameImage gMapObjectPicTable_TuberMSwimming[] = {
    {.data = (u8 *)gMapObjectPic_TuberMSwimming_0, .size = sizeof gMapObjectPic_TuberMSwimming_0},
    {.data = (u8 *)gMapObjectPic_TuberMSwimming_1, .size = sizeof gMapObjectPic_TuberMSwimming_1},
    {.data = (u8 *)gMapObjectPic_TuberMSwimming_2, .size = sizeof gMapObjectPic_TuberMSwimming_2},
    {.data = (u8 *)gMapObjectPic_TuberMSwimming_3, .size = sizeof gMapObjectPic_TuberMSwimming_3},
    {.data = (u8 *)gMapObjectPic_TuberMSwimming_4, .size = sizeof gMapObjectPic_TuberMSwimming_4},
    {.data = (u8 *)gMapObjectPic_TuberMSwimming_5, .size = sizeof gMapObjectPic_TuberMSwimming_5},
    {.data = (u8 *)gMapObjectPic_TuberMSwimming_6, .size = sizeof gMapObjectPic_TuberMSwimming_6},
    {.data = (u8 *)gMapObjectPic_TuberMSwimming_7, .size = sizeof gMapObjectPic_TuberMSwimming_7},
    {.data = (u8 *)gMapObjectPic_TuberMSwimming_8, .size = sizeof gMapObjectPic_TuberMSwimming_8}
};

const struct SpriteFrameImage gMapObjectPicTable_Azurill[] = {
    {.data = (u8 *)gMapObjectPic_Azurill_0, .size = sizeof gMapObjectPic_Azurill_0},
    {.data = (u8 *)gMapObjectPic_Azurill_1, .size = sizeof gMapObjectPic_Azurill_1},
    {.data = (u8 *)gMapObjectPic_Azurill_2, .size = sizeof gMapObjectPic_Azurill_2},
    {.data = (u8 *)gMapObjectPic_Azurill_0, .size = sizeof gMapObjectPic_Azurill_0},
    {.data = (u8 *)gMapObjectPic_Azurill_0, .size = sizeof gMapObjectPic_Azurill_0},
    {.data = (u8 *)gMapObjectPic_Azurill_1, .size = sizeof gMapObjectPic_Azurill_1},
    {.data = (u8 *)gMapObjectPic_Azurill_1, .size = sizeof gMapObjectPic_Azurill_1},
    {.data = (u8 *)gMapObjectPic_Azurill_2, .size = sizeof gMapObjectPic_Azurill_2},
    {.data = (u8 *)gMapObjectPic_Azurill_2, .size = sizeof gMapObjectPic_Azurill_2}
};

const struct SpriteFrameImage gMapObjectPicTable_Mom[] = {
    {.data = (u8 *)gMapObjectPic_Mom_0, .size = sizeof gMapObjectPic_Mom_0},
    {.data = (u8 *)gMapObjectPic_Mom_1, .size = sizeof gMapObjectPic_Mom_1},
    {.data = (u8 *)gMapObjectPic_Mom_2, .size = sizeof gMapObjectPic_Mom_2},
    {.data = (u8 *)gMapObjectPic_Mom_3, .size = sizeof gMapObjectPic_Mom_3},
    {.data = (u8 *)gMapObjectPic_Mom_4, .size = sizeof gMapObjectPic_Mom_4},
    {.data = (u8 *)gMapObjectPic_Mom_5, .size = sizeof gMapObjectPic_Mom_5},
    {.data = (u8 *)gMapObjectPic_Mom_6, .size = sizeof gMapObjectPic_Mom_6},
    {.data = (u8 *)gMapObjectPic_Mom_7, .size = sizeof gMapObjectPic_Mom_7},
    {.data = (u8 *)gMapObjectPic_Mom_8, .size = sizeof gMapObjectPic_Mom_8},
};
# 1584 "src/field/field_map_obj.c" 2
# 1 "src/field/../data/field_map_obj/map_object_anims.h" 1
# 9 "src/field/../data/field_map_obj/map_object_anims.h"
const union AnimCmd gMapObjectImageAnim_83708C8[] = {
    {.frame = {0, 8}},
    {.frame = {0, 8}},
    {.frame = {0, 8}},
    {.frame = {0, 8}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_83708DC[] = {
    {.frame = {0, 16}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_83708E4[] = {
    {.frame = {1, 16}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_83708EC[] = {
    {.frame = {2, 16}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_83708F4[] = {
    {.frame = {2, 16, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_83708FC[] = {
    {.frame = {3, 8}},
    {.frame = {0, 8}},
    {.frame = {3, 8, .hFlip = 1}},
    {.frame = {0, 8}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370910[] = {
    {.frame = {4, 8}},
    {.frame = {1, 8}},
    {.frame = {4, 8, .hFlip = 1}},
    {.frame = {1, 8}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370924[] = {
    {.frame = {5, 8}},
    {.frame = {2, 8}},
    {.frame = {6, 8}},
    {.frame = {2, 8}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370938[] = {
    {.frame = {5, 8, .hFlip = 1}},
    {.frame = {2, 8, .hFlip = 1}},
    {.frame = {6, 8, .hFlip = 1}},
    {.frame = {2, 8, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_837094C[] = {
    {.frame = {3, 4}},
    {.frame = {0, 4}},
    {.frame = {3, 4, .hFlip = 1}},
    {.frame = {0, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370960[] = {
    {.frame = {4, 4}},
    {.frame = {1, 4}},
    {.frame = {4, 4, .hFlip = 1}},
    {.frame = {1, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370974[] = {
    {.frame = {5, 4}},
    {.frame = {2, 4}},
    {.frame = {6, 4}},
    {.frame = {2, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370988[] = {
    {.frame = {5, 4, .hFlip = 1}},
    {.frame = {2, 4, .hFlip = 1}},
    {.frame = {6, 4, .hFlip = 1}},
    {.frame = {2, 4, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_837099C[] = {
    {.frame = {3, 2}},
    {.frame = {0, 2}},
    {.frame = {3, 2, .hFlip = 1}},
    {.frame = {0, 2}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_83709B0[] = {
    {.frame = {4, 2}},
    {.frame = {1, 2}},
    {.frame = {4, 2, .hFlip = 1}},
    {.frame = {1, 2}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_83709C4[] = {
    {.frame = {5, 2}},
    {.frame = {2, 2}},
    {.frame = {6, 2}},
    {.frame = {2, 2}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_83709D8[] = {
    {.frame = {5, 2, .hFlip = 1}},
    {.frame = {2, 2, .hFlip = 1}},
    {.frame = {6, 2, .hFlip = 1}},
    {.frame = {2, 2, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_83709EC[] = {
    {.frame = {3, 1}},
    {.frame = {0, 1}},
    {.frame = {3, 1, .hFlip = 1}},
    {.frame = {0, 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370A00[] = {
    {.frame = {4, 1}},
    {.frame = {1, 1}},
    {.frame = {4, 1, .hFlip = 1}},
    {.frame = {1, 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370A14[] = {
    {.frame = {5, 1}},
    {.frame = {2, 1}},
    {.frame = {6, 1}},
    {.frame = {2, 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370A28[] = {
    {.frame = {5, 1, .hFlip = 1}},
    {.frame = {2, 1, .hFlip = 1}},
    {.frame = {6, 1, .hFlip = 1}},
    {.frame = {2, 1, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370A3C[] = {
    {.frame = {0, 16}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370A44[] = {
    {.frame = {1, 16}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370A4C[] = {
    {.frame = {2, 16}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370A54[] = {
    {.frame = {2, 16, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370A5C[] = {
    {.frame = {3, 8}},
    {.frame = {0, 8}},
    {.frame = {4, 8}},
    {.frame = {0, 8}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370A70[] = {
    {.frame = {5, 8}},
    {.frame = {1, 8}},
    {.frame = {6, 8}},
    {.frame = {1, 8}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370A84[] = {
    {.frame = {7, 8}},
    {.frame = {2, 8}},
    {.frame = {8, 8}},
    {.frame = {2, 8}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370A98[] = {
    {.frame = {7, 8, .hFlip = 1}},
    {.frame = {2, 8, .hFlip = 1}},
    {.frame = {8, 8, .hFlip = 1}},
    {.frame = {2, 8, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370AAC[] = {
    {.frame = {3, 4}},
    {.frame = {0, 4}},
    {.frame = {4, 4}},
    {.frame = {0, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370AC0[] = {
    {.frame = {5, 4}},
    {.frame = {1, 4}},
    {.frame = {6, 4}},
    {.frame = {1, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370AD4[] = {
    {.frame = {7, 4}},
    {.frame = {2, 4}},
    {.frame = {8, 4}},
    {.frame = {2, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370AE8[] = {
    {.frame = {7, 4, .hFlip = 1}},
    {.frame = {2, 4, .hFlip = 1}},
    {.frame = {8, 4, .hFlip = 1}},
    {.frame = {2, 4, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370AFC[] = {
    {.frame = {3, 2}},
    {.frame = {0, 2}},
    {.frame = {4, 2}},
    {.frame = {0, 2}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370B10[] = {
    {.frame = {5, 2}},
    {.frame = {1, 2}},
    {.frame = {6, 2}},
    {.frame = {1, 2}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370B24[] = {
    {.frame = {7, 2}},
    {.frame = {2, 2}},
    {.frame = {8, 2}},
    {.frame = {2, 2}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370B38[] = {
    {.frame = {7, 2, .hFlip = 1}},
    {.frame = {2, 2, .hFlip = 1}},
    {.frame = {8, 2, .hFlip = 1}},
    {.frame = {2, 2, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370B4C[] = {
    {.frame = {3, 1}},
    {.frame = {0, 1}},
    {.frame = {4, 1}},
    {.frame = {0, 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370B60[] = {
    {.frame = {5, 1}},
    {.frame = {1, 1}},
    {.frame = {6, 1}},
    {.frame = {1, 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370B74[] = {
    {.frame = {7, 1}},
    {.frame = {2, 1}},
    {.frame = {8, 1}},
    {.frame = {2, 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370B88[] = {
    {.frame = {7, 1, .hFlip = 1}},
    {.frame = {2, 1, .hFlip = 1}},
    {.frame = {8, 1, .hFlip = 1}},
    {.frame = {2, 1, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370B9C[] = {
    {.frame = {12, 5}},
    {.frame = {9, 3}},
    {.frame = {13, 5}},
    {.frame = {9, 3}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370BB0[] = {
    {.frame = {14, 5}},
    {.frame = {10, 3}},
    {.frame = {15, 5}},
    {.frame = {10, 3}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370BC4[] = {
    {.frame = {16, 5}},
    {.frame = {11, 3}},
    {.frame = {17, 5}},
    {.frame = {11, 3}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370BD8[] = {
    {.frame = {16, 5, .hFlip = 1}},
    {.frame = {11, 3, .hFlip = 1}},
    {.frame = {17, 5, .hFlip = 1}},
    {.frame = {11, 3, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370BEC[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.frame = {3, 4}},
    {.frame = {4, 8}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370C04[] = {
    {.frame = {9, 32}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370C0C[] = {
    {.frame = {10, 32}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370C14[] = {
    {.frame = {11, 32}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370C1C[] = {
    {.frame = {11, 32, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370C24[] = {
    {.frame = {9, 4}},
    {.frame = {10, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370C30[] = {
    {.frame = {13, 4}},
    {.frame = {14, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370C3C[] = {
    {.frame = {17, 4}},
    {.frame = {18, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370C48[] = {
    {.frame = {17, 4, .hFlip = 1}},
    {.frame = {18, 4, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370C54[] = {
    {.frame = {11, 4}},
    {.frame = {12, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370C60[] = {
    {.frame = {15, 4}},
    {.frame = {16, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370C6C[] = {
    {.frame = {19, 4}},
    {.frame = {20, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370C78[] = {
    {.frame = {19, 4, .hFlip = 1}},
    {.frame = {20, 4, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370C84[] = {
    {.frame = {9, 4}},
    {.frame = {0, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370C90[] = {
    {.frame = {13, 4}},
    {.frame = {1, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370C9C[] = {
    {.frame = {17, 4}},
    {.frame = {2, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370CA8[] = {
    {.frame = {17, 4, .hFlip = 1}},
    {.frame = {2, 4, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370CB4[] = {
    {.frame = {11, 4}},
    {.frame = {0, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370CC0[] = {
    {.frame = {15, 4}},
    {.frame = {1, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370CCC[] = {
    {.frame = {19, 4}},
    {.frame = {2, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370CD8[] = {
    {.frame = {19, 4, .hFlip = 1}},
    {.frame = {2, 4, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370CE4[] = {
    {.frame = {21, 4}},
    {.frame = {10, 4}},
    {.frame = {22, 4}},
    {.frame = {10, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370CF8[] = {
    {.frame = {23, 4}},
    {.frame = {14, 4}},
    {.frame = {24, 4}},
    {.frame = {14, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370D0C[] = {
    {.frame = {25, 4}},
    {.frame = {18, 4}},
    {.frame = {26, 4}},
    {.frame = {18, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370D20[] = {
    {.frame = {25, 4, .hFlip = 1}},
    {.frame = {18, 4, .hFlip = 1}},
    {.frame = {26, 4, .hFlip = 1}},
    {.frame = {18, 4, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370D34[] = {
    {.frame = {0, 32}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370D3C[] = {
    {.frame = {1, 32}},
    {.frame = {2, 32}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370D48[] = {
    {.frame = {3, 48}},
    {.frame = {4, 48}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370D54[] = {
    {.frame = {5, 32}},
    {.frame = {5, 32}},
    {.frame = {6, 32}},
    {.frame = {6, 32}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370D68[] = {
    {.frame = {7, 48}},
    {.frame = {7, 48}},
    {.frame = {8, 48}},
    {.frame = {8, 48}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370D7C[] = {
    {.frame = {0, 8}},
    {.frame = {9, 32}},
    {.frame = {0, 8}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370D8C[] = {
    {.frame = {0, 8}},
    {.frame = {1, 8}},
    {.frame = {2, 8}},
    {.frame = {3, 8}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370DA0[] = {
    {.frame = {0, 6}},
    {.frame = {1, 6}},
    {.frame = {2, 6}},
    {.frame = {3, 6}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370DB4[] = {
    {.frame = {8, 4}},
    {.frame = {9, 4}},
    {.frame = {10, 4}},
    {.frame = {11, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370DC8[] = {
    {.frame = {4, 4}},
    {.frame = {5, 4}},
    {.frame = {6, 4}},
    {.frame = {7, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370DDC[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.frame = {3, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370DF0[] = {
    {.frame = {0, 4, .hFlip = 1}},
    {.frame = {1, 4, .hFlip = 1}},
    {.frame = {2, 4, .hFlip = 1}},
    {.frame = {3, 4, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370E04[] = {
    {.frame = {11, 4}},
    {.frame = {10, 6}},
    {.frame = {9, 6}},
    {.frame = {8, 6}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370E18[] = {
    {.frame = {7, 4}},
    {.frame = {6, 6}},
    {.frame = {5, 6}},
    {.frame = {4, 6}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370E2C[] = {
    {.frame = {3, 4}},
    {.frame = {2, 4}},
    {.frame = {1, 4}},
    {.frame = {0, 4}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370E40[] = {
    {.frame = {3, 4, .hFlip = 1}},
    {.frame = {2, 4, .hFlip = 1}},
    {.frame = {1, 4, .hFlip = 1}},
    {.frame = {0, 4, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd gMapObjectImageAnim_8370E54[] = {
    {.frame = {10, 6}},
    {.frame = {11, 6}},
    {.loop = {.type = -3, .count = 1}},
    {.frame = {11, 30}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370E68[] = {
    {.frame = {6, 6}},
    {.frame = {7, 6}},
    {.loop = {.type = -3, .count = 1}},
    {.frame = {7, 30}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370E7C[] = {
    {.frame = {2, 6}},
    {.frame = {3, 6}},
    {.loop = {.type = -3, .count = 1}},
    {.frame = {3, 30}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gMapObjectImageAnim_8370E90[] = {
    {.frame = {2, 6, .hFlip = 1}},
    {.frame = {3, 6, .hFlip = 1}},
    {.loop = {.type = -3, .count = 1}},
    {.frame = {3, 30, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AffineAnimCmd gMapObjectRotScalAnim_8370EA4[] = {
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 1, .duration = 1}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 1}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 1}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 1}},
    {.loop = {.type = 0x7FFD, .count = 7}},
    {.jump = {.type = 0x7FFE, .target = 0}}
};

const union AffineAnimCmd gMapObjectRotScalAnim_8370ED4[] = {
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = -1, .duration = 1}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 1}},
    {.loop = {.type = 0x7FFD, .count = 15}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 1, .duration = 1}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 1}},
    {.loop = {.type = 0x7FFD, .count = 15}},
    {.jump = {.type = 0x7FFE, .target = 0}}
};

const union AnimCmd *const gMapObjectImageAnimTable_Inanimate[] = {
    gMapObjectImageAnim_83708C8
};

const union AnimCmd *const gMapObjectImageAnimTable_QuintyPlump[] = {
    gMapObjectImageAnim_83708DC,
    gMapObjectImageAnim_83708E4,
    gMapObjectImageAnim_83708EC,
    gMapObjectImageAnim_83708F4,
    gMapObjectImageAnim_83708FC,
    gMapObjectImageAnim_8370910,
    gMapObjectImageAnim_8370924,
    gMapObjectImageAnim_8370938,
    gMapObjectImageAnim_837094C,
    gMapObjectImageAnim_8370960,
    gMapObjectImageAnim_8370974,
    gMapObjectImageAnim_8370988,
    gMapObjectImageAnim_837099C,
    gMapObjectImageAnim_83709B0,
    gMapObjectImageAnim_83709C4,
    gMapObjectImageAnim_83709D8,
    gMapObjectImageAnim_83709EC,
    gMapObjectImageAnim_8370A00,
    gMapObjectImageAnim_8370A14,
    gMapObjectImageAnim_8370A28
};

const union AnimCmd *const gMapObjectImageAnimTable_Standard[] = {
    gMapObjectImageAnim_8370A3C,
    gMapObjectImageAnim_8370A44,
    gMapObjectImageAnim_8370A4C,
    gMapObjectImageAnim_8370A54,
    gMapObjectImageAnim_8370A5C,
    gMapObjectImageAnim_8370A70,
    gMapObjectImageAnim_8370A84,
    gMapObjectImageAnim_8370A98,
    gMapObjectImageAnim_8370AAC,
    gMapObjectImageAnim_8370AC0,
    gMapObjectImageAnim_8370AD4,
    gMapObjectImageAnim_8370AE8,
    gMapObjectImageAnim_8370AFC,
    gMapObjectImageAnim_8370B10,
    gMapObjectImageAnim_8370B24,
    gMapObjectImageAnim_8370B38,
    gMapObjectImageAnim_8370B4C,
    gMapObjectImageAnim_8370B60,
    gMapObjectImageAnim_8370B74,
    gMapObjectImageAnim_8370B88
};

const union AnimCmd *const gMapObjectImageAnimTable_BrendanMayNormal[] = {
    gMapObjectImageAnim_8370A3C,
    gMapObjectImageAnim_8370A44,
    gMapObjectImageAnim_8370A4C,
    gMapObjectImageAnim_8370A54,
    gMapObjectImageAnim_8370A5C,
    gMapObjectImageAnim_8370A70,
    gMapObjectImageAnim_8370A84,
    gMapObjectImageAnim_8370A98,
    gMapObjectImageAnim_8370AAC,
    gMapObjectImageAnim_8370AC0,
    gMapObjectImageAnim_8370AD4,
    gMapObjectImageAnim_8370AE8,
    gMapObjectImageAnim_8370AFC,
    gMapObjectImageAnim_8370B10,
    gMapObjectImageAnim_8370B24,
    gMapObjectImageAnim_8370B38,
    gMapObjectImageAnim_8370B4C,
    gMapObjectImageAnim_8370B60,
    gMapObjectImageAnim_8370B74,
    gMapObjectImageAnim_8370B88,
    gMapObjectImageAnim_8370B9C,
    gMapObjectImageAnim_8370BB0,
    gMapObjectImageAnim_8370BC4,
    gMapObjectImageAnim_8370BD8
};

const union AnimCmd *const gMapObjectImageAnimTable_AcroBike[] = {
    gMapObjectImageAnim_8370A3C,
    gMapObjectImageAnim_8370A44,
    gMapObjectImageAnim_8370A4C,
    gMapObjectImageAnim_8370A54,
    gMapObjectImageAnim_8370A5C,
    gMapObjectImageAnim_8370A70,
    gMapObjectImageAnim_8370A84,
    gMapObjectImageAnim_8370A98,
    gMapObjectImageAnim_8370AAC,
    gMapObjectImageAnim_8370AC0,
    gMapObjectImageAnim_8370AD4,
    gMapObjectImageAnim_8370AE8,
    gMapObjectImageAnim_8370AFC,
    gMapObjectImageAnim_8370B10,
    gMapObjectImageAnim_8370B24,
    gMapObjectImageAnim_8370B38,
    gMapObjectImageAnim_8370B4C,
    gMapObjectImageAnim_8370B60,
    gMapObjectImageAnim_8370B74,
    gMapObjectImageAnim_8370B88,
    gMapObjectImageAnim_8370C24,
    gMapObjectImageAnim_8370C30,
    gMapObjectImageAnim_8370C3C,
    gMapObjectImageAnim_8370C48,
    gMapObjectImageAnim_8370C54,
    gMapObjectImageAnim_8370C60,
    gMapObjectImageAnim_8370C6C,
    gMapObjectImageAnim_8370C78,
    gMapObjectImageAnim_8370C84,
    gMapObjectImageAnim_8370C90,
    gMapObjectImageAnim_8370C9C,
    gMapObjectImageAnim_8370CA8,
    gMapObjectImageAnim_8370CB4,
    gMapObjectImageAnim_8370CC0,
    gMapObjectImageAnim_8370CCC,
    gMapObjectImageAnim_8370CD8,
    gMapObjectImageAnim_8370CE4,
    gMapObjectImageAnim_8370CF8,
    gMapObjectImageAnim_8370D0C,
    gMapObjectImageAnim_8370D20
};

const union AnimCmd *const gMapObjectImageAnimTable_Surfing[] = {
    gMapObjectImageAnim_8370A3C,
    gMapObjectImageAnim_8370A44,
    gMapObjectImageAnim_8370A4C,
    gMapObjectImageAnim_8370A54,
    gMapObjectImageAnim_8370A5C,
    gMapObjectImageAnim_8370A70,
    gMapObjectImageAnim_8370A84,
    gMapObjectImageAnim_8370A98,
    gMapObjectImageAnim_8370AAC,
    gMapObjectImageAnim_8370AC0,
    gMapObjectImageAnim_8370AD4,
    gMapObjectImageAnim_8370AE8,
    gMapObjectImageAnim_8370AFC,
    gMapObjectImageAnim_8370B10,
    gMapObjectImageAnim_8370B24,
    gMapObjectImageAnim_8370B38,
    gMapObjectImageAnim_8370B4C,
    gMapObjectImageAnim_8370B60,
    gMapObjectImageAnim_8370B74,
    gMapObjectImageAnim_8370B88,
    gMapObjectImageAnim_8370C04,
    gMapObjectImageAnim_8370C0C,
    gMapObjectImageAnim_8370C14,
    gMapObjectImageAnim_8370C1C
};

const union AnimCmd *const gMapObjectImageAnimTable_Nurse[] = {
    gMapObjectImageAnim_8370A3C,
    gMapObjectImageAnim_8370A44,
    gMapObjectImageAnim_8370A4C,
    gMapObjectImageAnim_8370A54,
    gMapObjectImageAnim_8370A5C,
    gMapObjectImageAnim_8370A70,
    gMapObjectImageAnim_8370A84,
    gMapObjectImageAnim_8370A98,
    gMapObjectImageAnim_8370AAC,
    gMapObjectImageAnim_8370AC0,
    gMapObjectImageAnim_8370AD4,
    gMapObjectImageAnim_8370AE8,
    gMapObjectImageAnim_8370AFC,
    gMapObjectImageAnim_8370B10,
    gMapObjectImageAnim_8370B24,
    gMapObjectImageAnim_8370B38,
    gMapObjectImageAnim_8370B4C,
    gMapObjectImageAnim_8370B60,
    gMapObjectImageAnim_8370B74,
    gMapObjectImageAnim_8370B88,
    gMapObjectImageAnim_8370D7C
};

const union AnimCmd *const gMapObjectImageAnimTable_FieldMove[] = {
    gMapObjectImageAnim_8370BEC
};

const union AnimCmd *const gMapObjectImageAnimTable_BerryTree[] = {
    gMapObjectImageAnim_8370D34,
    gMapObjectImageAnim_8370D3C,
    gMapObjectImageAnim_8370D48,
    gMapObjectImageAnim_8370D54,
    gMapObjectImageAnim_8370D68
};

const union AnimCmd *const gMapObjectImageAnimTable_BreakableRock[] = {
    gMapObjectImageAnim_83708C8,
    gMapObjectImageAnim_8370D8C
};

const union AnimCmd *const gMapObjectImageAnimTable_CuttableTree[] = {
    gMapObjectImageAnim_83708C8,
    gMapObjectImageAnim_8370DA0
};

const union AnimCmd *const gMapObjectImageAnimTable_Fishing[] = {
    gMapObjectImageAnim_8370DB4,
    gMapObjectImageAnim_8370DC8,
    gMapObjectImageAnim_8370DDC,
    gMapObjectImageAnim_8370DF0,
    gMapObjectImageAnim_8370E04,
    gMapObjectImageAnim_8370E18,
    gMapObjectImageAnim_8370E2C,
    gMapObjectImageAnim_8370E40,
    gMapObjectImageAnim_8370E54,
    gMapObjectImageAnim_8370E68,
    gMapObjectImageAnim_8370E7C,
    gMapObjectImageAnim_8370E90
};

const union AffineAnimCmd *const gMapObjectRotScalAnimTable_KyogreGroudon[] = {
    gMapObjectRotScalAnim_8370EA4,
    gMapObjectRotScalAnim_8370ED4
};
# 1585 "src/field/field_map_obj.c" 2
# 1 "src/field/../data/field_map_obj/base_oam.h" 1







const struct OamData gFieldOamData_8x8 = {
    .shape = 0,
    .size = 0,
    .priority = 2
};

const struct OamData gFieldOamData_16x8 = {
    .shape = 1,
    .size = 0,
    .priority = 2
};

const struct OamData gFieldOamData_16x16 = {
    .shape = 0,
    .size = 1,
    .priority = 2
};

const struct OamData gFieldOamData_32x8 = {
    .shape = 1,
    .size = 1,
    .priority = 2
};

const struct OamData gFieldOamData_64x32 = {
    .shape = 1,
    .size = 3,
    .priority = 2
};

const struct OamData gFieldOamData_16x32 = {
    .shape = 2,
    .size = 2,
    .priority = 2
};

const struct OamData gFieldOamData_32x32 = {
    .shape = 0,
    .size = 2,
    .priority = 2
};

const struct OamData gFieldOamData_64x64 = {
    .shape = 0,
    .size = 3,
    .priority = 2
};
# 1586 "src/field/field_map_obj.c" 2
# 1 "src/field/../data/field_map_obj/map_object_subsprites.h" 1







const struct Subsprite gMapObjectSubspriteTable_16x16_0[] = {
    { -8, -8, 0, 1, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_1[] = {
    { -8, -8, 0, 1, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_2[] = {
    { -8, -8, 1, 0, 0, 2},
    { -8, 0, 1, 0, 2, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_3[] = {
    { -8, -8, 0, 1, 0, 2},
    { -8, -8, 0, 1, 0, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_4[] = {
    { -8, -8, 0, 1, 0, 1},
    { -8, -8, 0, 1, 0, 3}
};

const struct SubspriteTable gMapObjectSubspriteTables_16x16[] = {
    {0, ((void *)0)},
    {1, gMapObjectSubspriteTable_16x16_0},
    {1, gMapObjectSubspriteTable_16x16_1},
    {2, gMapObjectSubspriteTable_16x16_2},
    {2, gMapObjectSubspriteTable_16x16_3},
    {2, gMapObjectSubspriteTable_16x16_4}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_0[] = {
    { -8, -16, 2, 2, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_1[] = {
    { -8, -16, 2, 2, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_2[] = {
    { -8, -16, 0, 1, 0, 2},
    { -8, 0, 1, 0, 4, 2},
    { -8, 8, 1, 0, 6, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_3[] = {
    { -8, -16, 0, 1, 0, 2},
    { -8, 0, 0, 1, 4, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_4[] = {
    { -8, -16, 0, 1, 0, 1},
    { -8, 0, 0, 1, 4, 3}
};

const struct SubspriteTable gMapObjectSubspriteTables_16x32[] = {
    {0, ((void *)0)},
    {1, gMapObjectSubspriteTable_16x32_0},
    {1, gMapObjectSubspriteTable_16x32_1},
    {3, gMapObjectSubspriteTable_16x32_2},
    {2, gMapObjectSubspriteTable_16x32_3},
    {2, gMapObjectSubspriteTable_16x32_4}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_0[] = {
    {-16, -16, 0, 2, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_1[] = {
    {-16, -16, 0, 2, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_2[] = {
    {-16, -16, 1, 2, 0, 2},
    {-16, 0, 1, 1, 8, 2},
    {-16, 8, 1, 1, 12, 3}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_3[] = {
    {-16, -16, 1, 2, 0, 2},
    {-16, 0, 1, 2, 8, 3}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_4[] = {
    {-16, -16, 1, 2, 0, 1},
    {-16, 0, 1, 2, 8, 3}
};

const struct SubspriteTable gMapObjectSubspriteTables_32x32[] = {
    {0, ((void *)0)},
    {1, gMapObjectSubspriteTable_32x32_0},
    {1, gMapObjectSubspriteTable_32x32_1},
    {3, gMapObjectSubspriteTable_32x32_2},
    {2, gMapObjectSubspriteTable_32x32_3},
    {2, gMapObjectSubspriteTable_32x32_4}
};

const struct Subsprite gMapObjectSubspriteTable_Truck_0[] = {
    {-24, -24, 1, 1, 0, 2},
    { 8, -24, 1, 0, 4, 2},
    {-24, -16, 1, 1, 6, 2},
    { 8, -16, 1, 0, 10, 2},
    {-24, -8, 1, 1, 12, 2},
    { 8, -8, 1, 0, 16, 2},
    {-24, 0, 1, 1, 18, 2},
    { 8, 0, 1, 0, 22, 2},
    {-24, 8, 1, 1, 24, 2},
    { 8, 8, 1, 0, 28, 2},
    {-24, 16, 1, 1, 30, 2},
    { 8, 16, 1, 0, 34, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_Truck[] = {
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_0[] = {
    {-32, -16, 1, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_1[] = {
    {-32, -16, 1, 3, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_2[] = {
    {-32, -16, 1, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_3[] = {
    {-32, -16, 1, 3, 0, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_Unused[] = {
    {0, ((void *)0)},
    {1, gMapObjectSubspriteTable_Unused_0},
    {1, gMapObjectSubspriteTable_Unused_1},
    {1, gMapObjectSubspriteTable_Unused_2},
    {1, gMapObjectSubspriteTable_Unused_3},
    {1, gMapObjectSubspriteTable_Unused_3}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_0[] = {
    {-32, -32, 0, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_1[] = {
    {-32, -32, 0, 3, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_2[] = {
    {-32, -32, 0, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_3[] = {
    {-32, -32, 0, 3, 0, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_CableCar[] = {
    {0, ((void *)0)},
    {1, gMapObjectSubspriteTable_CableCar_0},
    {1, gMapObjectSubspriteTable_CableCar_1},
    {1, gMapObjectSubspriteTable_CableCar_2},
    {1, gMapObjectSubspriteTable_CableCar_3},
    {1, gMapObjectSubspriteTable_CableCar_3}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_0[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 1, 8, 2},
    {-48, -12, 1, 1, 12, 2},
    {-16, -12, 1, 1, 16, 2},
    { 16, -12, 1, 1, 20, 2},
    {-48, -4, 1, 1, 24, 2},
    {-16, -4, 1, 1, 28, 2},
    { 16, -4, 1, 1, 32, 2},
    {-48, 4, 1, 1, 36, 2},
    {-16, 4, 1, 1, 40, 2},
    { 16, 4, 1, 1, 44, 2},
    {-48, 12, 1, 1, 48, 2},
    {-16, 12, 1, 1, 52, 2},
    { 16, 12, 1, 1, 56, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_1[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 1, 8, 1},
    {-48, -12, 1, 1, 12, 1},
    {-16, -12, 1, 1, 16, 1},
    { 16, -12, 1, 1, 20, 1},
    {-48, -4, 1, 1, 24, 1},
    {-16, -4, 1, 1, 28, 1},
    { 16, -4, 1, 1, 32, 1},
    {-48, 4, 1, 1, 36, 1},
    {-16, 4, 1, 1, 40, 1},
    { 16, 4, 1, 1, 44, 1},
    {-48, 12, 1, 1, 48, 1},
    {-16, 12, 1, 1, 52, 1},
    { 16, 12, 1, 1, 56, 1}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_2[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 1, 8, 2},
    {-48, -12, 1, 1, 12, 2},
    {-16, -12, 1, 1, 16, 2},
    { 16, -12, 1, 1, 20, 2},
    {-48, -4, 1, 1, 24, 2},
    {-16, -4, 1, 1, 28, 2},
    { 16, -4, 1, 1, 32, 2},
    {-48, 4, 1, 1, 36, 2},
    {-16, 4, 1, 1, 40, 2},
    { 16, 4, 1, 1, 44, 2},
    {-48, 12, 1, 1, 48, 2},
    {-16, 12, 1, 1, 52, 2},
    { 16, 12, 1, 1, 56, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_3[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 1, 8, 1},
    {-48, -12, 1, 1, 12, 1},
    {-16, -12, 1, 1, 16, 1},
    { 16, -12, 1, 1, 20, 1},
    {-48, -4, 1, 1, 24, 2},
    {-16, -4, 1, 1, 28, 2},
    { 16, -4, 1, 1, 32, 2},
    {-48, 4, 1, 1, 36, 2},
    {-16, 4, 1, 1, 40, 2},
    { 16, 4, 1, 1, 44, 2},
    {-48, 12, 1, 1, 48, 2},
    {-16, 12, 1, 1, 52, 2},
    { 16, 12, 1, 1, 56, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_SSTidal[] = {
    {15, gMapObjectSubspriteTable_SSTidal_0},
    {15, gMapObjectSubspriteTable_SSTidal_0},
    {15, gMapObjectSubspriteTable_SSTidal_1},
    {15, gMapObjectSubspriteTable_SSTidal_2},
    {15, gMapObjectSubspriteTable_SSTidal_3},
    {15, gMapObjectSubspriteTable_SSTidal_3}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_0[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 0, 8, 2},
    { 32, -20, 0, 0, 10, 2},
    {-48, -12, 1, 1, 11, 2},
    {-16, -12, 1, 1, 15, 2},
    { 16, -12, 1, 0, 19, 2},
    { 32, -12, 0, 0, 21, 2},
    {-48, -4, 1, 1, 22, 2},
    {-16, -4, 1, 1, 26, 2},
    { 16, -4, 1, 0, 30, 2},
    { 32, -4, 0, 0, 32, 2},
    {-48, 4, 1, 1, 33, 2},
    {-16, 4, 1, 1, 37, 2},
    { 16, 4, 1, 0, 41, 2},
    { 32, 4, 0, 0, 43, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_1[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 0, 8, 1},
    { 32, -20, 0, 0, 10, 1},
    {-48, -12, 1, 1, 11, 1},
    {-16, -12, 1, 1, 15, 1},
    { 16, -12, 1, 0, 19, 1},
    { 32, -12, 0, 0, 21, 1},
    {-48, -4, 1, 1, 22, 1},
    {-16, -4, 1, 1, 26, 1},
    { 16, -4, 1, 0, 30, 1},
    { 32, -4, 0, 0, 32, 1},
    {-48, 4, 1, 1, 33, 1},
    {-16, 4, 1, 1, 37, 1},
    { 16, 4, 1, 0, 41, 1},
    { 32, 4, 0, 0, 43, 1}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_2[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 0, 8, 2},
    { 32, -20, 0, 0, 10, 2},
    {-48, -12, 1, 1, 11, 2},
    {-16, -12, 1, 1, 15, 2},
    { 16, -12, 1, 0, 19, 2},
    { 32, -12, 0, 0, 21, 2},
    {-48, -4, 1, 1, 22, 2},
    {-16, -4, 1, 1, 26, 2},
    { 16, -4, 1, 0, 30, 2},
    { 32, -4, 0, 0, 32, 2},
    {-48, 4, 1, 1, 33, 2},
    {-16, 4, 1, 1, 37, 2},
    { 16, 4, 1, 0, 41, 2},
    { 32, 4, 0, 0, 43, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_3[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 0, 8, 1},
    { 32, -20, 0, 0, 10, 1},
    {-48, -12, 1, 1, 11, 1},
    {-16, -12, 1, 1, 15, 1},
    { 16, -12, 1, 0, 19, 1},
    { 32, -12, 0, 0, 21, 1},
    {-48, -4, 1, 1, 22, 2},
    {-16, -4, 1, 1, 26, 2},
    { 16, -4, 1, 0, 30, 2},
    { 32, -4, 0, 0, 32, 2},
    {-48, 4, 1, 1, 33, 2},
    {-16, 4, 1, 1, 37, 2},
    { 16, 4, 1, 0, 41, 2},
    { 32, 4, 0, 0, 43, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_SubmarineShadow[] = {
    {16, gMapObjectSubspriteTable_SubmarineShadow_0},
    {16, gMapObjectSubspriteTable_SubmarineShadow_0},
    {16, gMapObjectSubspriteTable_SubmarineShadow_1},
    {16, gMapObjectSubspriteTable_SubmarineShadow_2},
    {16, gMapObjectSubspriteTable_SubmarineShadow_3},
    {16, gMapObjectSubspriteTable_SubmarineShadow_3}
};
# 1587 "src/field/field_map_obj.c" 2
# 1 "src/field/../data/field_map_obj/map_object_graphics_info.h" 1







const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanNormal = {0xffff, 0x1100, 0x1102, 512, 16, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_BrendanNormal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanMachBike = {0xffff, 0x1100, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BrendanMachBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanAcroBike = {0xffff, 0x1100, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_BrendanAcroBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanSurfing = {0xffff, 0x1100, 0x11ff, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 1, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Surfing, gMapObjectPicTable_BrendanSurfing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanFieldMove = {0xffff, 0x1100, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_FieldMove, gMapObjectPicTable_BrendanFieldMove, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_QuintyPlump = {0xffff, 0x110b, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_L, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_QuintyPlump, gMapObjectPicTable_QuintyPlump, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy1 = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LittleBoy1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleGirl1 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LittleGirl1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy1 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Boy1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl1 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Girl1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy2 = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Boy2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl2 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Girl2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy2 = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LittleBoy2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleGirl2 = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LittleGirl2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy3 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Boy3, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl3 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Girl3, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy4 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Boy4, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman1 = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_FatMan = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_FatMan, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman2 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man1 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman3 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman3, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldMan1 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_OldMan1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldWoman1 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_OldWoman1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man2 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman4 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman4, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man3 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man3, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman5 = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman5, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Cook = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Cook, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman6 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman6, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldMan2 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_OldMan2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldWoman2 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_OldWoman2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Camper = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Camper, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Picnicker = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Picnicker, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man4 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man4, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman7 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman7, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Youngster = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Youngster, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BugCatcher = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BugCatcher, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PsychicM = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_PsychicM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SchoolKidM = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_SchoolKidM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Maniac = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Maniac, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_HexManiac = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_HexManiac, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman8 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman8, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwimmerM = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_SwimmerM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwimmerF = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_SwimmerF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BlackBelt = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BlackBelt, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Beauty = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Beauty, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Scientist1 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Scientist1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Lass = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Lass, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Gentleman = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Gentleman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Sailor = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Sailor, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Fisherman = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Fisherman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RunningTriathleteM = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_RunningTriathleteM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RunningTriathleteF = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_RunningTriathleteF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberF = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_TuberF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberM = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_TuberM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Hiker = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Hiker, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyclingTriathleteM = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_CyclingTriathleteM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyclingTriathleteF = {0xffff, 0x1103, 0x11ff, 512, 32, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_CyclingTriathleteF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Nurse = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Nurse, gMapObjectPicTable_Nurse, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ItemBall = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_ItemBall, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTree = {0xffff, 0x1103, 0x11ff, 256, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, ((void *)0), gMapObjectImageAnimTable_BerryTree, gMapObjectPicTable_PechaBerryTree, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTreeEarlyStages = {0xffff, 0x1103, 0x11ff, 256, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_BerryTree, gMapObjectPicTable_PechaBerryTree, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTreeLateStages = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BerryTree, gMapObjectPicTable_PechaBerryTree, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ProfBirch = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_ProfBirch, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man5 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man5, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man6 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man6, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ReporterM = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_ReporterM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ReporterF = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_ReporterF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Bard = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Hipster = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Trader = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Storyteller = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Giddy = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMauvilleOldMan1 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMauvilleOldMan2 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedNatuDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedNatuDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMagnemiteDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedMagnemiteDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedSquirtleDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedSquirtleDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedWooperDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedWooperDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedPikachuDoll = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedPikachuDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedPorygon2Doll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedPorygon2Doll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CuttableTree = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_CuttableTree, gMapObjectPicTable_CuttableTree, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MartEmployee = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MartEmployee, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RooftopSaleWoman = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_RooftopSaleWoman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Teala = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Teala, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BreakableRock = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_BreakableRock, gMapObjectPicTable_BreakableRock, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PushableBoulder = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_PushableBoulder, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MrBrineysBoat = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MrBrineysBoat, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayNormal = {0xffff, 0x1110, 0x1102, 512, 16, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_MayNormal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayMachBike = {0xffff, 0x1110, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MayMachBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayAcroBike = {0xffff, 0x1110, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_MayAcroBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MaySurfing = {0xffff, 0x1110, 0x11ff, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 1, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Surfing, gMapObjectPicTable_MaySurfing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayFieldMove = {0xffff, 0x1110, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_FieldMove, gMapObjectPicTable_MayFieldMove, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Truck = {0xffff, 0x110d, 0x11ff, 1152, 48, 48, 10, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_Truck, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_Truck, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MachokeCarryingBox = {0xffff, 0x110e, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MachokeCarryingBox, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MachokeFacingAway = {0xffff, 0x110e, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MachokeFacingAway, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BirchsBag = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BirchsBag, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Poochyena = {0xffff, 0x110f, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Poochyena, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Artist = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Artist, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanNormal = {0xffff, 0x1100, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_BrendanNormal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanMachBike = {0xffff, 0x1100, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BrendanMachBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanAcroBike = {0xffff, 0x1100, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_BrendanAcroBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanSurfing = {0xffff, 0x1100, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 1, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Surfing, gMapObjectPicTable_BrendanSurfing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanFieldMove = {0xffff, 0x1100, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_FieldMove, gMapObjectPicTable_BrendanFieldMove, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayNormal = {0xffff, 0x1110, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_MayNormal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayMachBike = {0xffff, 0x1110, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MayMachBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayAcroBike = {0xffff, 0x1110, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_MayAcroBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMaySurfing = {0xffff, 0x1110, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 1, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Surfing, gMapObjectPicTable_MaySurfing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayFieldMove = {0xffff, 0x1110, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_FieldMove, gMapObjectPicTable_MayFieldMove, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Cameraman = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Cameraman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanUnderwater = {0xffff, 0x1115, 0x11ff, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 1, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BrendanUnderwater, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayUnderwater = {0xffff, 0x1115, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 1, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MayUnderwater, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MovingBox = {0xffff, 0x1112, 0x11ff, 128, 16, 16, 10, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_MovingBox, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CableCar = {0xffff, 0x1113, 0x11ff, 2048, 64, 64, 10, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_64x64, gMapObjectSubspriteTables_CableCar, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_CableCar, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Scientist2 = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Scientist2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man7 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man7, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AquaMemberM = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_AquaMemberM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AquaMemberF = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_AquaMemberF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MagmaMemberM = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MagmaMemberM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MagmaMemberF = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MagmaMemberF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Sidney = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Sidney, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Phoebe = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Phoebe, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Glacia = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Glacia, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Drake = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Drake, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Roxanne = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Roxanne, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Brawly = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Brawly, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wattson = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Wattson, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Flannery = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Flannery, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Norman = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Norman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Winona = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Winona, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Liza = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Liza, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Tate = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Tate, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wallace = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Wallace, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Steven = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Steven, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wally = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Wally, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy3 = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LittleBoy3, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanFishing = {0xffff, 0x1100, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Fishing, gMapObjectPicTable_BrendanFishing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayFishing = {0xffff, 0x1110, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Fishing, gMapObjectPicTable_MayFishing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_HotSpringsOldWoman = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_HotSpringsOldWoman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SSTidal = {0xffff, 0x1114, 0x11ff, 1920, 96, 40, 10, SHADOW_SIZE_M, 0, 0, TRACKS_NONE, &gFieldOamData_8x8, gMapObjectSubspriteTables_SSTidal, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_SSTidal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SubmarineShadow = {0xffff, 0x111a, 0x11ff, 1408, 88, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_NONE, &gFieldOamData_8x8, gMapObjectSubspriteTables_SubmarineShadow, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_SubmarineShadow, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PichuDoll = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_PichuDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PikachuDoll = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_PikachuDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MarillDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_MarillDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TogepiDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_TogepiDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyndaquilDoll = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_CyndaquilDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ChikoritaDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_ChikoritaDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TotodileDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_TotodileDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_JigglypuffDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_JigglypuffDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MeowthDoll = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_MeowthDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ClefairyDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_ClefairyDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DittoDoll = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_DittoDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SmoochumDoll = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_SmoochumDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TreeckoDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_TreeckoDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TorchicDoll = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_TorchicDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MudkipDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_MudkipDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DuskullDoll = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_DuskullDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_WynautDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_WynautDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BaltoyDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BaltoyDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_KecleonDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_KecleonDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AzurillDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_AzurillDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SkittyDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_SkittyDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwabluDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_SwabluDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_GulpinDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_GulpinDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LotadDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_LotadDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SeedotDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_SeedotDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PikaCushion = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_PikaCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RoundCushion = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_RoundCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_KissCushion = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_KissCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ZigzagCushion = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_ZigzagCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SpinCushion = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_SpinCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DiamondCushion = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_DiamondCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BallCushion = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BallCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_GrassCushion = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_GrassCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_FireCushion = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_FireCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_WaterCushion = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_WaterCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigSnorlaxDoll = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigSnorlaxDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRhydonDoll = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigRhydonDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigLaprasDoll = {0xffff, 0x1103, 0x11ff, 512, 32, 32, 2, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigLaprasDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigVenusaurDoll = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigVenusaurDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigCharizardDoll = {0xffff, 0x1104, 0x11ff, 512, 32, 32, 3, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigCharizardDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigBlastoiseDoll = {0xffff, 0x1103, 0x11ff, 512, 32, 32, 2, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigBlastoiseDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigWailmerDoll = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigWailmerDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegirockDoll = {0xffff, 0x1103, 0x11ff, 512, 32, 32, 2, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigRegirockDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegiceDoll = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigRegiceDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegisteelDoll = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, 1, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigRegisteelDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Latias = {0xffff, 0x1104, 0x11ff, 512, 32, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LatiasLatios, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Latios = {0xffff, 0x1103, 0x11ff, 512, 32, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LatiasLatios, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy5 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Boy5, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ContestJudge = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_ContestJudge, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanWatering = {0xffff, 0x1100, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BrendanWatering, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayWatering = {0xffff, 0x1110, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MayWatering, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanDecorating = {0xffff, 0x1100, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, 1, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BrendanDecorating, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayDecorating = {0xffff, 0x1110, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, 1, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_MayDecorating, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Archie = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Archie, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Maxie = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Maxie, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kyogre1 = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Kyogre, gMapObjectRotScalAnimTable_KyogreGroudon};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Groudon1 = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Groudon, gMapObjectRotScalAnimTable_KyogreGroudon};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Fossil = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, 1, 0, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_Fossil, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Regirock = {0xffff, 0x1104, 0x11ff, 512, 32, 32, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Regi, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Regice = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Regi, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Registeel = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Regi, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Skitty = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Skitty, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kecleon1 = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Kecleon, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kyogre2 = {0xffff, 0x1116, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Kyogre, gMapObjectRotScalAnimTable_KyogreGroudon};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Groudon2 = {0xffff, 0x1118, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Groudon, gMapObjectRotScalAnimTable_KyogreGroudon};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Rayquaza = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Rayquaza, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Zigzagoon = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Zigzagoon, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Pikachu = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Pikachu, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Azumarill = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Azumarill, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wingull = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Wingull, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kecleon2 = {0xffff, 0x1105, 0x1102, 128, 16, 16, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Kecleon, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberMSwimming = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_TuberMSwimming, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Azurill = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Azurill, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Mom = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Mom, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LinkBrendan = {0xffff, 0x1110, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_BrendanNormal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LinkMay = {0xffff, 0x1110, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, 0, 0, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_MayNormal, gDummySpriteAffineAnimTable};
# 1588 "src/field/field_map_obj.c" 2

const struct SpritePalette gUnknown_0837377C[] = {
    {gMapObjectPalette0, 0x1103},
    {gMapObjectPalette1, 0x1104},
    {gMapObjectPalette2, 0x1105},
    {gMapObjectPalette3, 0x1106},
    {gMapObjectPalette4, 0x1107},
    {gMapObjectPalette5, 0x1108},
    {gMapObjectPalette6, 0x1109},
    {gMapObjectPalette7, 0x110A},
    {gMapObjectPalette8, 0x1100},
    {gMapObjectPalette9, 0x1101},
    {gMapObjectPalette10, 0x1102},
    {gMapObjectPalette11, 0x1115},
    {gMapObjectPalette12, 0x110B},
    {gMapObjectPalette13, 0x110C},
    {gMapObjectPalette14, 0x110D},
    {gMapObjectPalette15, 0x110E},
    {gMapObjectPalette16, 0x110F},
    {gMapObjectPalette17, 0x1110},
    {gMapObjectPalette18, 0x1111},
    {gMapObjectPalette19, 0x1112},
    {gMapObjectPalette20, 0x1113},
    {gMapObjectPalette21, 0x1114},
    {gMapObjectPalette22, 0x1116},
    {gMapObjectPalette23, 0x1117},
    {gMapObjectPalette24, 0x1118},
    {gMapObjectPalette25, 0x1119},
    {gMapObjectPalette26, 0x111A},
    {((void *)0), 0x0000}
};

const u16 Palettes_837385C[] = {
    0x1101,
    0x1101,
    0x1101,
    0x1101
};

const u16 Palettes_8373864[] = {
    0x1111,
    0x1111,
    0x1111,
    0x1111
};

const u16 Palettes_837386C[] = {
    0x1115,
    0x1115,
    0x1115,
    0x1115
};

const struct PairedPalettes gUnknown_08373874[] = {
    {0x1100, Palettes_837385C},
    {0x1110, Palettes_837385C},
    {0x1115, Palettes_837386C},
    {0x11FF, ((void *)0)}
};

const u16 Palettes_8373894[] = {
    0x110C,
    0x110C,
    0x110C,
    0x110C
};

const u16 Palettes_837389C[] = {
    0x110D,
    0x110D,
    0x110D,
    0x110D
};

const u16 Palettes_83738A4[] = {
    0x110E,
    0x110E,
    0x110E,
    0x110E
};

const u16 Palettes_83738AC[] = {
    0x1112,
    0x1112,
    0x1112,
    0x1112
};

const u16 Palettes_83738B4[] = {
    0x1113,
    0x1113,
    0x1113,
    0x1113
};

const u16 Palettes_83738BC[] = {
    0x1114,
    0x1114,
    0x1114,
    0x1114
};

const u16 Palettes_83738C4[] = {
    0x111A,
    0x111A,
    0x111A,
    0x111A
};

const u16 Palettes_83738CC[] = {
    0x1117,
    0x1117,
    0x1117,
    0x1117
};

const u16 Palettes_83738D4[] = {
    0x1119,
    0x1119,
    0x1119,
    0x1119
};

const u16 Palettes_83738DC[] = {
    0x1109,
    0x1109,
    0x1109,
    0x1109
};

const struct PairedPalettes gUnknown_083738E4[] = {
    {0x1100, Palettes_837385C},
    {0x1110, Palettes_837385C},
    {0x110B, Palettes_8373894},
    {0x110D, Palettes_837389C},
    {0x110E, Palettes_83738A4},
    {0x1112, Palettes_83738AC},
    {0x1113, Palettes_83738B4},
    {0x1114, Palettes_83738BC},
    {0x1116, Palettes_83738CC},
    {0x1118, Palettes_83738D4},
    {0x1105, Palettes_83738DC},
    {0x111A, Palettes_83738C4},
    {0x11FF, ((void *)0)}
};

const u16 Unknown_837394C[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 Unknown_8373960[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 Unknown_8373974[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 Unknown_8373988[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 *const gUnknown_0837399C[] = {
    Unknown_837394C,
    Unknown_8373960,
    Unknown_8373974,
    Unknown_8373988
};

# 1 "src/field/../data/field_map_obj/berry_tree_graphics_tables.h" 1







const struct SpriteFrameImage gMapObjectPicTable_PechaBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_PechaBerryTree_0, .size = sizeof gMapObjectPic_PechaBerryTree_0},
    {.data = (u8 *)gMapObjectPic_PechaBerryTree_1, .size = sizeof gMapObjectPic_PechaBerryTree_1},
    {.data = (u8 *)gMapObjectPic_PechaBerryTree_2, .size = sizeof gMapObjectPic_PechaBerryTree_2},
    {.data = (u8 *)gMapObjectPic_PechaBerryTree_3, .size = sizeof gMapObjectPic_PechaBerryTree_3},
    {.data = (u8 *)gMapObjectPic_PechaBerryTree_4, .size = sizeof gMapObjectPic_PechaBerryTree_4},
    {.data = (u8 *)gMapObjectPic_PechaBerryTree_5, .size = sizeof gMapObjectPic_PechaBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Pecha[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_KelpsyBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_KelpsyBerryTree_0, .size = sizeof gMapObjectPic_KelpsyBerryTree_0},
    {.data = (u8 *)gMapObjectPic_KelpsyBerryTree_1, .size = sizeof gMapObjectPic_KelpsyBerryTree_1},
    {.data = (u8 *)gMapObjectPic_KelpsyBerryTree_2, .size = sizeof gMapObjectPic_KelpsyBerryTree_2},
    {.data = (u8 *)gMapObjectPic_KelpsyBerryTree_3, .size = sizeof gMapObjectPic_KelpsyBerryTree_3},
    {.data = (u8 *)gMapObjectPic_KelpsyBerryTree_4, .size = sizeof gMapObjectPic_KelpsyBerryTree_4},
    {.data = (u8 *)gMapObjectPic_KelpsyBerryTree_5, .size = sizeof gMapObjectPic_KelpsyBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Kelpsy[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_WepearBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_WepearBerryTree_0, .size = sizeof gMapObjectPic_WepearBerryTree_0},
    {.data = (u8 *)gMapObjectPic_WepearBerryTree_1, .size = sizeof gMapObjectPic_WepearBerryTree_1},
    {.data = (u8 *)gMapObjectPic_WepearBerryTree_2, .size = sizeof gMapObjectPic_WepearBerryTree_2},
    {.data = (u8 *)gMapObjectPic_WepearBerryTree_3, .size = sizeof gMapObjectPic_WepearBerryTree_3},
    {.data = (u8 *)gMapObjectPic_WepearBerryTree_4, .size = sizeof gMapObjectPic_WepearBerryTree_4},
    {.data = (u8 *)gMapObjectPic_WepearBerryTree_5, .size = sizeof gMapObjectPic_WepearBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Wepear[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_IapapaBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_IapapaBerryTree_0, .size = sizeof gMapObjectPic_IapapaBerryTree_0},
    {.data = (u8 *)gMapObjectPic_IapapaBerryTree_1, .size = sizeof gMapObjectPic_IapapaBerryTree_1},
    {.data = (u8 *)gMapObjectPic_IapapaBerryTree_2, .size = sizeof gMapObjectPic_IapapaBerryTree_2},
    {.data = (u8 *)gMapObjectPic_IapapaBerryTree_3, .size = sizeof gMapObjectPic_IapapaBerryTree_3},
    {.data = (u8 *)gMapObjectPic_IapapaBerryTree_4, .size = sizeof gMapObjectPic_IapapaBerryTree_4},
    {.data = (u8 *)gMapObjectPic_IapapaBerryTree_5, .size = sizeof gMapObjectPic_IapapaBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Iapapa[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_CheriBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_CheriBerryTree_0, .size = sizeof gMapObjectPic_CheriBerryTree_0},
    {.data = (u8 *)gMapObjectPic_CheriBerryTree_1, .size = sizeof gMapObjectPic_CheriBerryTree_1},
    {.data = (u8 *)gMapObjectPic_CheriBerryTree_2, .size = sizeof gMapObjectPic_CheriBerryTree_2},
    {.data = (u8 *)gMapObjectPic_CheriBerryTree_3, .size = sizeof gMapObjectPic_CheriBerryTree_3},
    {.data = (u8 *)gMapObjectPic_CheriBerryTree_4, .size = sizeof gMapObjectPic_CheriBerryTree_4},
    {.data = (u8 *)gMapObjectPic_CheriBerryTree_5, .size = sizeof gMapObjectPic_CheriBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Cheri[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_FigyBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_FigyBerryTree_0, .size = sizeof gMapObjectPic_FigyBerryTree_0},
    {.data = (u8 *)gMapObjectPic_FigyBerryTree_1, .size = sizeof gMapObjectPic_FigyBerryTree_1},
    {.data = (u8 *)gMapObjectPic_FigyBerryTree_2, .size = sizeof gMapObjectPic_FigyBerryTree_2},
    {.data = (u8 *)gMapObjectPic_FigyBerryTree_3, .size = sizeof gMapObjectPic_FigyBerryTree_3},
    {.data = (u8 *)gMapObjectPic_FigyBerryTree_4, .size = sizeof gMapObjectPic_FigyBerryTree_4},
    {.data = (u8 *)gMapObjectPic_FigyBerryTree_5, .size = sizeof gMapObjectPic_FigyBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Figy[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_MagoBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_MagoBerryTree_0, .size = sizeof gMapObjectPic_MagoBerryTree_0},
    {.data = (u8 *)gMapObjectPic_MagoBerryTree_1, .size = sizeof gMapObjectPic_MagoBerryTree_1},
    {.data = (u8 *)gMapObjectPic_MagoBerryTree_2, .size = sizeof gMapObjectPic_MagoBerryTree_2},
    {.data = (u8 *)gMapObjectPic_MagoBerryTree_3, .size = sizeof gMapObjectPic_MagoBerryTree_3},
    {.data = (u8 *)gMapObjectPic_MagoBerryTree_4, .size = sizeof gMapObjectPic_MagoBerryTree_4},
    {.data = (u8 *)gMapObjectPic_MagoBerryTree_5, .size = sizeof gMapObjectPic_MagoBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Mago[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_LumBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_LumBerryTree_0, .size = sizeof gMapObjectPic_LumBerryTree_0},
    {.data = (u8 *)gMapObjectPic_LumBerryTree_1, .size = sizeof gMapObjectPic_LumBerryTree_1},
    {.data = (u8 *)gMapObjectPic_LumBerryTree_2, .size = sizeof gMapObjectPic_LumBerryTree_2},
    {.data = (u8 *)gMapObjectPic_LumBerryTree_3, .size = sizeof gMapObjectPic_LumBerryTree_3},
    {.data = (u8 *)gMapObjectPic_LumBerryTree_4, .size = sizeof gMapObjectPic_LumBerryTree_4},
    {.data = (u8 *)gMapObjectPic_LumBerryTree_5, .size = sizeof gMapObjectPic_LumBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Lum[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_RazzBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_RazzBerryTree_0, .size = sizeof gMapObjectPic_RazzBerryTree_0},
    {.data = (u8 *)gMapObjectPic_RazzBerryTree_1, .size = sizeof gMapObjectPic_RazzBerryTree_1},
    {.data = (u8 *)gMapObjectPic_RazzBerryTree_2, .size = sizeof gMapObjectPic_RazzBerryTree_2},
    {.data = (u8 *)gMapObjectPic_RazzBerryTree_3, .size = sizeof gMapObjectPic_RazzBerryTree_3},
    {.data = (u8 *)gMapObjectPic_RazzBerryTree_4, .size = sizeof gMapObjectPic_RazzBerryTree_4},
    {.data = (u8 *)gMapObjectPic_RazzBerryTree_5, .size = sizeof gMapObjectPic_RazzBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Razz[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_GrepaBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_GrepaBerryTree_0, .size = sizeof gMapObjectPic_GrepaBerryTree_0},
    {.data = (u8 *)gMapObjectPic_GrepaBerryTree_1, .size = sizeof gMapObjectPic_GrepaBerryTree_1},
    {.data = (u8 *)gMapObjectPic_GrepaBerryTree_2, .size = sizeof gMapObjectPic_GrepaBerryTree_2},
    {.data = (u8 *)gMapObjectPic_GrepaBerryTree_3, .size = sizeof gMapObjectPic_GrepaBerryTree_3},
    {.data = (u8 *)gMapObjectPic_GrepaBerryTree_4, .size = sizeof gMapObjectPic_GrepaBerryTree_4},
    {.data = (u8 *)gMapObjectPic_GrepaBerryTree_5, .size = sizeof gMapObjectPic_GrepaBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Grepa[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_RabutaBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_RabutaBerryTree_0, .size = sizeof gMapObjectPic_RabutaBerryTree_0},
    {.data = (u8 *)gMapObjectPic_RabutaBerryTree_1, .size = sizeof gMapObjectPic_RabutaBerryTree_1},
    {.data = (u8 *)gMapObjectPic_RabutaBerryTree_2, .size = sizeof gMapObjectPic_RabutaBerryTree_2},
    {.data = (u8 *)gMapObjectPic_RabutaBerryTree_3, .size = sizeof gMapObjectPic_RabutaBerryTree_3},
    {.data = (u8 *)gMapObjectPic_RabutaBerryTree_4, .size = sizeof gMapObjectPic_RabutaBerryTree_4},
    {.data = (u8 *)gMapObjectPic_RabutaBerryTree_5, .size = sizeof gMapObjectPic_RabutaBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Rabuta[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_NomelBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_NomelBerryTree_0, .size = sizeof gMapObjectPic_NomelBerryTree_0},
    {.data = (u8 *)gMapObjectPic_NomelBerryTree_1, .size = sizeof gMapObjectPic_NomelBerryTree_1},
    {.data = (u8 *)gMapObjectPic_NomelBerryTree_2, .size = sizeof gMapObjectPic_NomelBerryTree_2},
    {.data = (u8 *)gMapObjectPic_NomelBerryTree_3, .size = sizeof gMapObjectPic_NomelBerryTree_3},
    {.data = (u8 *)gMapObjectPic_NomelBerryTree_4, .size = sizeof gMapObjectPic_NomelBerryTree_4},
    {.data = (u8 *)gMapObjectPic_NomelBerryTree_5, .size = sizeof gMapObjectPic_NomelBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Nomel[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_LeppaBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_LeppaBerryTree_0, .size = sizeof gMapObjectPic_LeppaBerryTree_0},
    {.data = (u8 *)gMapObjectPic_LeppaBerryTree_1, .size = sizeof gMapObjectPic_LeppaBerryTree_1},
    {.data = (u8 *)gMapObjectPic_LeppaBerryTree_2, .size = sizeof gMapObjectPic_LeppaBerryTree_2},
    {.data = (u8 *)gMapObjectPic_LeppaBerryTree_3, .size = sizeof gMapObjectPic_LeppaBerryTree_3},
    {.data = (u8 *)gMapObjectPic_LeppaBerryTree_4, .size = sizeof gMapObjectPic_LeppaBerryTree_4},
    {.data = (u8 *)gMapObjectPic_LeppaBerryTree_5, .size = sizeof gMapObjectPic_LeppaBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Leppa[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_LiechiBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_LiechiBerryTree_0, .size = sizeof gMapObjectPic_LiechiBerryTree_0},
    {.data = (u8 *)gMapObjectPic_LiechiBerryTree_1, .size = sizeof gMapObjectPic_LiechiBerryTree_1},
    {.data = (u8 *)gMapObjectPic_LiechiBerryTree_2, .size = sizeof gMapObjectPic_LiechiBerryTree_2},
    {.data = (u8 *)gMapObjectPic_LiechiBerryTree_3, .size = sizeof gMapObjectPic_LiechiBerryTree_3},
    {.data = (u8 *)gMapObjectPic_LiechiBerryTree_4, .size = sizeof gMapObjectPic_LiechiBerryTree_4},
    {.data = (u8 *)gMapObjectPic_LiechiBerryTree_5, .size = sizeof gMapObjectPic_LiechiBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Liechi[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_HondewBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_HondewBerryTree_0, .size = sizeof gMapObjectPic_HondewBerryTree_0},
    {.data = (u8 *)gMapObjectPic_HondewBerryTree_1, .size = sizeof gMapObjectPic_HondewBerryTree_1},
    {.data = (u8 *)gMapObjectPic_HondewBerryTree_2, .size = sizeof gMapObjectPic_HondewBerryTree_2},
    {.data = (u8 *)gMapObjectPic_HondewBerryTree_3, .size = sizeof gMapObjectPic_HondewBerryTree_3},
    {.data = (u8 *)gMapObjectPic_HondewBerryTree_4, .size = sizeof gMapObjectPic_HondewBerryTree_4},
    {.data = (u8 *)gMapObjectPic_HondewBerryTree_5, .size = sizeof gMapObjectPic_HondewBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Hondew[] = {3, 4, 5, 5, 5};

const struct SpriteFrameImage gMapObjectPicTable_AguavBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_AguavBerryTree_0, .size = sizeof gMapObjectPic_AguavBerryTree_0},
    {.data = (u8 *)gMapObjectPic_AguavBerryTree_1, .size = sizeof gMapObjectPic_AguavBerryTree_1},
    {.data = (u8 *)gMapObjectPic_AguavBerryTree_2, .size = sizeof gMapObjectPic_AguavBerryTree_2},
    {.data = (u8 *)gMapObjectPic_AguavBerryTree_3, .size = sizeof gMapObjectPic_AguavBerryTree_3},
    {.data = (u8 *)gMapObjectPic_AguavBerryTree_4, .size = sizeof gMapObjectPic_AguavBerryTree_4},
    {.data = (u8 *)gMapObjectPic_AguavBerryTree_5, .size = sizeof gMapObjectPic_AguavBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Aguav[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_WikiBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_WikiBerryTree_0, .size = sizeof gMapObjectPic_WikiBerryTree_0},
    {.data = (u8 *)gMapObjectPic_WikiBerryTree_1, .size = sizeof gMapObjectPic_WikiBerryTree_1},
    {.data = (u8 *)gMapObjectPic_WikiBerryTree_2, .size = sizeof gMapObjectPic_WikiBerryTree_2},
    {.data = (u8 *)gMapObjectPic_WikiBerryTree_3, .size = sizeof gMapObjectPic_WikiBerryTree_3},
    {.data = (u8 *)gMapObjectPic_WikiBerryTree_4, .size = sizeof gMapObjectPic_WikiBerryTree_4},
    {.data = (u8 *)gMapObjectPic_WikiBerryTree_5, .size = sizeof gMapObjectPic_WikiBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Wiki[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_PomegBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_PomegBerryTree_0, .size = sizeof gMapObjectPic_PomegBerryTree_0},
    {.data = (u8 *)gMapObjectPic_PomegBerryTree_1, .size = sizeof gMapObjectPic_PomegBerryTree_1},
    {.data = (u8 *)gMapObjectPic_PomegBerryTree_2, .size = sizeof gMapObjectPic_PomegBerryTree_2},
    {.data = (u8 *)gMapObjectPic_PomegBerryTree_3, .size = sizeof gMapObjectPic_PomegBerryTree_3},
    {.data = (u8 *)gMapObjectPic_PomegBerryTree_4, .size = sizeof gMapObjectPic_PomegBerryTree_4},
    {.data = (u8 *)gMapObjectPic_PomegBerryTree_5, .size = sizeof gMapObjectPic_PomegBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Pomeg[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_RawstBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_RawstBerryTree_0, .size = sizeof gMapObjectPic_RawstBerryTree_0},
    {.data = (u8 *)gMapObjectPic_RawstBerryTree_1, .size = sizeof gMapObjectPic_RawstBerryTree_1},
    {.data = (u8 *)gMapObjectPic_RawstBerryTree_2, .size = sizeof gMapObjectPic_RawstBerryTree_2},
    {.data = (u8 *)gMapObjectPic_RawstBerryTree_3, .size = sizeof gMapObjectPic_RawstBerryTree_3},
    {.data = (u8 *)gMapObjectPic_RawstBerryTree_4, .size = sizeof gMapObjectPic_RawstBerryTree_4},
    {.data = (u8 *)gMapObjectPic_RawstBerryTree_5, .size = sizeof gMapObjectPic_RawstBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Rawst[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_SpelonBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_SpelonBerryTree_0, .size = sizeof gMapObjectPic_SpelonBerryTree_0},
    {.data = (u8 *)gMapObjectPic_SpelonBerryTree_1, .size = sizeof gMapObjectPic_SpelonBerryTree_1},
    {.data = (u8 *)gMapObjectPic_SpelonBerryTree_2, .size = sizeof gMapObjectPic_SpelonBerryTree_2},
    {.data = (u8 *)gMapObjectPic_SpelonBerryTree_3, .size = sizeof gMapObjectPic_SpelonBerryTree_3},
    {.data = (u8 *)gMapObjectPic_SpelonBerryTree_4, .size = sizeof gMapObjectPic_SpelonBerryTree_4},
    {.data = (u8 *)gMapObjectPic_SpelonBerryTree_5, .size = sizeof gMapObjectPic_SpelonBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Spelon[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_ChestoBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_ChestoBerryTree_0, .size = sizeof gMapObjectPic_ChestoBerryTree_0},
    {.data = (u8 *)gMapObjectPic_ChestoBerryTree_1, .size = sizeof gMapObjectPic_ChestoBerryTree_1},
    {.data = (u8 *)gMapObjectPic_ChestoBerryTree_2, .size = sizeof gMapObjectPic_ChestoBerryTree_2},
    {.data = (u8 *)gMapObjectPic_ChestoBerryTree_3, .size = sizeof gMapObjectPic_ChestoBerryTree_3},
    {.data = (u8 *)gMapObjectPic_ChestoBerryTree_4, .size = sizeof gMapObjectPic_ChestoBerryTree_4},
    {.data = (u8 *)gMapObjectPic_ChestoBerryTree_5, .size = sizeof gMapObjectPic_ChestoBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Chesto[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_OranBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_OranBerryTree_0, .size = sizeof gMapObjectPic_OranBerryTree_0},
    {.data = (u8 *)gMapObjectPic_OranBerryTree_1, .size = sizeof gMapObjectPic_OranBerryTree_1},
    {.data = (u8 *)gMapObjectPic_OranBerryTree_2, .size = sizeof gMapObjectPic_OranBerryTree_2},
    {.data = (u8 *)gMapObjectPic_OranBerryTree_3, .size = sizeof gMapObjectPic_OranBerryTree_3},
    {.data = (u8 *)gMapObjectPic_OranBerryTree_4, .size = sizeof gMapObjectPic_OranBerryTree_4},
    {.data = (u8 *)gMapObjectPic_OranBerryTree_5, .size = sizeof gMapObjectPic_OranBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Oran[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_PersimBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_PersimBerryTree_0, .size = sizeof gMapObjectPic_PersimBerryTree_0},
    {.data = (u8 *)gMapObjectPic_PersimBerryTree_1, .size = sizeof gMapObjectPic_PersimBerryTree_1},
    {.data = (u8 *)gMapObjectPic_PersimBerryTree_2, .size = sizeof gMapObjectPic_PersimBerryTree_2},
    {.data = (u8 *)gMapObjectPic_PersimBerryTree_3, .size = sizeof gMapObjectPic_PersimBerryTree_3},
    {.data = (u8 *)gMapObjectPic_PersimBerryTree_4, .size = sizeof gMapObjectPic_PersimBerryTree_4},
    {.data = (u8 *)gMapObjectPic_PersimBerryTree_5, .size = sizeof gMapObjectPic_PersimBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Persim[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_SitrusBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_SitrusBerryTree_0, .size = sizeof gMapObjectPic_SitrusBerryTree_0},
    {.data = (u8 *)gMapObjectPic_SitrusBerryTree_1, .size = sizeof gMapObjectPic_SitrusBerryTree_1},
    {.data = (u8 *)gMapObjectPic_SitrusBerryTree_2, .size = sizeof gMapObjectPic_SitrusBerryTree_2},
    {.data = (u8 *)gMapObjectPic_SitrusBerryTree_3, .size = sizeof gMapObjectPic_SitrusBerryTree_3},
    {.data = (u8 *)gMapObjectPic_SitrusBerryTree_4, .size = sizeof gMapObjectPic_SitrusBerryTree_4},
    {.data = (u8 *)gMapObjectPic_SitrusBerryTree_5, .size = sizeof gMapObjectPic_SitrusBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Sitrus[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_AspearBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_AspearBerryTree_0, .size = sizeof gMapObjectPic_AspearBerryTree_0},
    {.data = (u8 *)gMapObjectPic_AspearBerryTree_1, .size = sizeof gMapObjectPic_AspearBerryTree_1},
    {.data = (u8 *)gMapObjectPic_AspearBerryTree_2, .size = sizeof gMapObjectPic_AspearBerryTree_2},
    {.data = (u8 *)gMapObjectPic_AspearBerryTree_3, .size = sizeof gMapObjectPic_AspearBerryTree_3},
    {.data = (u8 *)gMapObjectPic_AspearBerryTree_4, .size = sizeof gMapObjectPic_AspearBerryTree_4},
    {.data = (u8 *)gMapObjectPic_AspearBerryTree_5, .size = sizeof gMapObjectPic_AspearBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Aspear[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_PamtreBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_PamtreBerryTree_0, .size = sizeof gMapObjectPic_PamtreBerryTree_0},
    {.data = (u8 *)gMapObjectPic_PamtreBerryTree_1, .size = sizeof gMapObjectPic_PamtreBerryTree_1},
    {.data = (u8 *)gMapObjectPic_PamtreBerryTree_2, .size = sizeof gMapObjectPic_PamtreBerryTree_2},
    {.data = (u8 *)gMapObjectPic_PamtreBerryTree_3, .size = sizeof gMapObjectPic_PamtreBerryTree_3},
    {.data = (u8 *)gMapObjectPic_PamtreBerryTree_4, .size = sizeof gMapObjectPic_PamtreBerryTree_4},
    {.data = (u8 *)gMapObjectPic_PamtreBerryTree_5, .size = sizeof gMapObjectPic_PamtreBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Pamtre[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_CornnBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_CornnBerryTree_0, .size = sizeof gMapObjectPic_CornnBerryTree_0},
    {.data = (u8 *)gMapObjectPic_CornnBerryTree_1, .size = sizeof gMapObjectPic_CornnBerryTree_1},
    {.data = (u8 *)gMapObjectPic_CornnBerryTree_2, .size = sizeof gMapObjectPic_CornnBerryTree_2},
    {.data = (u8 *)gMapObjectPic_CornnBerryTree_3, .size = sizeof gMapObjectPic_CornnBerryTree_3},
    {.data = (u8 *)gMapObjectPic_CornnBerryTree_4, .size = sizeof gMapObjectPic_CornnBerryTree_4},
    {.data = (u8 *)gMapObjectPic_CornnBerryTree_5, .size = sizeof gMapObjectPic_CornnBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Cornn[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_LansatBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_LansatBerryTree_0, .size = sizeof gMapObjectPic_LansatBerryTree_0},
    {.data = (u8 *)gMapObjectPic_LansatBerryTree_1, .size = sizeof gMapObjectPic_LansatBerryTree_1},
    {.data = (u8 *)gMapObjectPic_LansatBerryTree_2, .size = sizeof gMapObjectPic_LansatBerryTree_2},
    {.data = (u8 *)gMapObjectPic_LansatBerryTree_3, .size = sizeof gMapObjectPic_LansatBerryTree_3},
    {.data = (u8 *)gMapObjectPic_LansatBerryTree_4, .size = sizeof gMapObjectPic_LansatBerryTree_4},
    {.data = (u8 *)gMapObjectPic_LansatBerryTree_5, .size = sizeof gMapObjectPic_LansatBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Lansat[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_DurinBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_DurinBerryTree_0, .size = sizeof gMapObjectPic_DurinBerryTree_0},
    {.data = (u8 *)gMapObjectPic_DurinBerryTree_1, .size = sizeof gMapObjectPic_DurinBerryTree_1},
    {.data = (u8 *)gMapObjectPic_DurinBerryTree_2, .size = sizeof gMapObjectPic_DurinBerryTree_2},
    {.data = (u8 *)gMapObjectPic_DurinBerryTree_3, .size = sizeof gMapObjectPic_DurinBerryTree_3},
    {.data = (u8 *)gMapObjectPic_DurinBerryTree_4, .size = sizeof gMapObjectPic_DurinBerryTree_4},
    {.data = (u8 *)gMapObjectPic_DurinBerryTree_5, .size = sizeof gMapObjectPic_DurinBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Durin[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_TamatoBerryTree[] = {
    {.data = (u8 *)gMapObjectPic_BerryTreeDirtPile, .size = sizeof gMapObjectPic_BerryTreeDirtPile},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_0, .size = sizeof gMapObjectPic_BerryTreeSprout_0},
    {.data = (u8 *)gMapObjectPic_BerryTreeSprout_1, .size = sizeof gMapObjectPic_BerryTreeSprout_1},
    {.data = (u8 *)gMapObjectPic_TamatoBerryTree_0, .size = sizeof gMapObjectPic_TamatoBerryTree_0},
    {.data = (u8 *)gMapObjectPic_TamatoBerryTree_1, .size = sizeof gMapObjectPic_TamatoBerryTree_1},
    {.data = (u8 *)gMapObjectPic_TamatoBerryTree_2, .size = sizeof gMapObjectPic_TamatoBerryTree_2},
    {.data = (u8 *)gMapObjectPic_TamatoBerryTree_3, .size = sizeof gMapObjectPic_TamatoBerryTree_3},
    {.data = (u8 *)gMapObjectPic_TamatoBerryTree_4, .size = sizeof gMapObjectPic_TamatoBerryTree_4},
    {.data = (u8 *)gMapObjectPic_TamatoBerryTree_5, .size = sizeof gMapObjectPic_TamatoBerryTree_5}
};

const u8 gBerryTreePaletteSlotTable_Tamato[] = {3, 4, 2, 2, 2};

const u8 gDeadBerryTreeGraphicsIdTable[] = {MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES};

const u8 gBerryTreeGraphicsIdTable[] = {MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_LATE_STAGES, MAP_OBJ_GFX_BERRY_TREE_LATE_STAGES, MAP_OBJ_GFX_BERRY_TREE_LATE_STAGES};

const struct SpriteFrameImage *const gBerryTreePicTablePointers[] = {
    gMapObjectPicTable_CheriBerryTree,
    gMapObjectPicTable_ChestoBerryTree,
    gMapObjectPicTable_PechaBerryTree,
    gMapObjectPicTable_RawstBerryTree,
    gMapObjectPicTable_AspearBerryTree,
    gMapObjectPicTable_LeppaBerryTree,
    gMapObjectPicTable_OranBerryTree,
    gMapObjectPicTable_PersimBerryTree,
    gMapObjectPicTable_LumBerryTree,
    gMapObjectPicTable_SitrusBerryTree,
    gMapObjectPicTable_FigyBerryTree,
    gMapObjectPicTable_WikiBerryTree,
    gMapObjectPicTable_MagoBerryTree,
    gMapObjectPicTable_AguavBerryTree,
    gMapObjectPicTable_IapapaBerryTree,
    gMapObjectPicTable_RazzBerryTree,
    gMapObjectPicTable_RazzBerryTree,
    gMapObjectPicTable_MagoBerryTree,
    gMapObjectPicTable_WepearBerryTree,
    gMapObjectPicTable_IapapaBerryTree,
    gMapObjectPicTable_PomegBerryTree,
    gMapObjectPicTable_KelpsyBerryTree,
    gMapObjectPicTable_WepearBerryTree,
    gMapObjectPicTable_HondewBerryTree,
    gMapObjectPicTable_GrepaBerryTree,
    gMapObjectPicTable_TamatoBerryTree,
    gMapObjectPicTable_CornnBerryTree,
    gMapObjectPicTable_PomegBerryTree,
    gMapObjectPicTable_RabutaBerryTree,
    gMapObjectPicTable_NomelBerryTree,
    gMapObjectPicTable_SpelonBerryTree,
    gMapObjectPicTable_PamtreBerryTree,
    gMapObjectPicTable_RabutaBerryTree,
    gMapObjectPicTable_DurinBerryTree,
    gMapObjectPicTable_HondewBerryTree,
    gMapObjectPicTable_LiechiBerryTree,
    gMapObjectPicTable_HondewBerryTree,
    gMapObjectPicTable_AguavBerryTree,
    gMapObjectPicTable_PomegBerryTree,
    gMapObjectPicTable_GrepaBerryTree,
    gMapObjectPicTable_LansatBerryTree,
    gMapObjectPicTable_CornnBerryTree,
    gMapObjectPicTable_DurinBerryTree
};

const u8 *const gBerryTreePaletteSlotTablePointers[] = {
    gBerryTreePaletteSlotTable_Cheri,
    gBerryTreePaletteSlotTable_Chesto,
    gBerryTreePaletteSlotTable_Pecha,
    gBerryTreePaletteSlotTable_Rawst,
    gBerryTreePaletteSlotTable_Aspear,
    gBerryTreePaletteSlotTable_Leppa,
    gBerryTreePaletteSlotTable_Oran,
    gBerryTreePaletteSlotTable_Persim,
    gBerryTreePaletteSlotTable_Lum,
    gBerryTreePaletteSlotTable_Sitrus,
    gBerryTreePaletteSlotTable_Figy,
    gBerryTreePaletteSlotTable_Wiki,
    gBerryTreePaletteSlotTable_Mago,
    gBerryTreePaletteSlotTable_Aguav,
    gBerryTreePaletteSlotTable_Iapapa,
    gBerryTreePaletteSlotTable_Razz,
    gBerryTreePaletteSlotTable_Razz,
    gBerryTreePaletteSlotTable_Mago,
    gBerryTreePaletteSlotTable_Wepear,
    gBerryTreePaletteSlotTable_Iapapa,
    gBerryTreePaletteSlotTable_Pomeg,
    gBerryTreePaletteSlotTable_Kelpsy,
    gBerryTreePaletteSlotTable_Wepear,
    gBerryTreePaletteSlotTable_Hondew,
    gBerryTreePaletteSlotTable_Grepa,
    gBerryTreePaletteSlotTable_Tamato,
    gBerryTreePaletteSlotTable_Cornn,
    gBerryTreePaletteSlotTable_Pomeg,
    gBerryTreePaletteSlotTable_Rabuta,
    gBerryTreePaletteSlotTable_Nomel,
    gBerryTreePaletteSlotTable_Spelon,
    gBerryTreePaletteSlotTable_Pamtre,
    gBerryTreePaletteSlotTable_Rabuta,
    gBerryTreePaletteSlotTable_Durin,
    gBerryTreePaletteSlotTable_Hondew,
    gBerryTreePaletteSlotTable_Liechi,
    gBerryTreePaletteSlotTable_Hondew,
    gBerryTreePaletteSlotTable_Aguav,
    gBerryTreePaletteSlotTable_Pomeg,
    gBerryTreePaletteSlotTable_Grepa,
    gBerryTreePaletteSlotTable_Lansat,
    gBerryTreePaletteSlotTable_Cornn,
    gBerryTreePaletteSlotTable_Durin
};

const u8 *const gBerryTreeGraphicsIdTablePointers[] = {
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable
};
# 1794 "src/field/field_map_obj.c" 2
# 1 "src/field/../data/field_map_obj/field_effect_objects.h" 1







const struct SpritePalette gFieldEffectObjectPaletteInfo0 = {gFieldEffectObjectPalette0, 0x1004};

const struct SpritePalette gFieldEffectObjectPaletteInfo1 = {gFieldEffectObjectPalette1, 0x1005};

const union AnimCmd gFieldEffectAnim_8374534[] = {
    {.frame = {0, 1}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_Shadow[] = {
    gFieldEffectAnim_8374534
};

const struct SpriteFrameImage gFieldEffectPicTable_ShadowSmall[] = {
    {.data = (u8 *)gFieldEffectPic_ShadowSmall, .size = sizeof gFieldEffectPic_ShadowSmall}
};

const struct SpriteFrameImage gFieldEffectPicTable_ShadowMedium[] = {
    {.data = (u8 *)gFieldEffectPic_ShadowMedium, .size = sizeof gFieldEffectPic_ShadowMedium}
};

const struct SpriteFrameImage gFieldEffectPicTable_ShadowLarge[] = {
    {.data = (u8 *)gFieldEffectPic_ShadowLarge, .size = sizeof gFieldEffectPic_ShadowLarge}
};

const struct SpriteFrameImage gFieldEffectPicTable_ShadowExtraLarge[] = {
    {.data = (u8 *)gFieldEffectPic_ShadowExtraLarge, .size = sizeof gFieldEffectPic_ShadowExtraLarge}
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowSmall = {0xFFFF, 0xFFFF, &gFieldOamData_8x8, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowSmall, gDummySpriteAffineAnimTable, oamc_shadow};

const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowMedium = {0xFFFF, 0xFFFF, &gFieldOamData_16x8, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowMedium, gDummySpriteAffineAnimTable, oamc_shadow};

const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowLarge = {0xFFFF, 0xFFFF, &gFieldOamData_32x8, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowLarge, gDummySpriteAffineAnimTable, oamc_shadow};

const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowExtraLarge = {0xFFFF, 0xFFFF, &gFieldOamData_64x32, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowExtraLarge, gDummySpriteAffineAnimTable, oamc_shadow};

const struct SpriteFrameImage gFieldEffectPicTable_TallGrass[] = {
    {.data = (u8 *)gFieldEffectPic_TallGrass_0, .size = sizeof gFieldEffectPic_TallGrass_0},
    {.data = (u8 *)gFieldEffectPic_TallGrass_1, .size = sizeof gFieldEffectPic_TallGrass_1},
    {.data = (u8 *)gFieldEffectPic_TallGrass_2, .size = sizeof gFieldEffectPic_TallGrass_2},
    {.data = (u8 *)gFieldEffectPic_TallGrass_3, .size = sizeof gFieldEffectPic_TallGrass_3},
    {.data = (u8 *)gFieldEffectPic_TallGrass_4, .size = sizeof gFieldEffectPic_TallGrass_4}
};

const union AnimCmd gFieldEffectAnim_83745E8[] = {
    {.frame = {1, 10}},
    {.frame = {2, 10}},
    {.frame = {3, 10}},
    {.frame = {4, 10}},
    {.frame = {0, 10}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_TallGrass[] = {
    gFieldEffectAnim_83745E8
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_TallGrass = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_TallGrass, gFieldEffectPicTable_TallGrass, gDummySpriteAffineAnimTable, unc_grass_normal};

const struct SpriteFrameImage gFieldEffectPicTable_Ripple[] = {
    {.data = (u8 *)gFieldEffectPic_Ripple_0, .size = sizeof gFieldEffectPic_Ripple_0},
    {.data = (u8 *)gFieldEffectPic_Ripple_1, .size = sizeof gFieldEffectPic_Ripple_1},
    {.data = (u8 *)gFieldEffectPic_Ripple_2, .size = sizeof gFieldEffectPic_Ripple_2},
    {.data = (u8 *)gFieldEffectPic_Ripple_3, .size = sizeof gFieldEffectPic_Ripple_3},
    {.data = (u8 *)gFieldEffectPic_Ripple_4, .size = sizeof gFieldEffectPic_Ripple_4}
};

const union AnimCmd gFieldEffectAnim_8374644[] = {
    {.frame = {0, 12}},
    {.frame = {1, 9}},
    {.frame = {2, 9}},
    {.frame = {3, 9}},
    {.frame = {0, 9}},
    {.frame = {1, 9}},
    {.frame = {2, 11}},
    {.frame = {4, 11}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_Ripple[] = {
    gFieldEffectAnim_8374644
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Ripple = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_Ripple, gFieldEffectPicTable_Ripple, gDummySpriteAffineAnimTable, sub_8128800};

const struct SpriteFrameImage gFieldEffectPicTable_Ash[] = {
    {.data = (u8 *)gFieldEffectPic_Ash_0, .size = sizeof gFieldEffectPic_Ash_0},
    {.data = (u8 *)gFieldEffectPic_Ash_1, .size = sizeof gFieldEffectPic_Ash_1},
    {.data = (u8 *)gFieldEffectPic_Ash_2, .size = sizeof gFieldEffectPic_Ash_2},
    {.data = (u8 *)gFieldEffectPic_Ash_3, .size = sizeof gFieldEffectPic_Ash_3},
    {.data = (u8 *)gFieldEffectPic_Ash_4, .size = sizeof gFieldEffectPic_Ash_4}
};

const union AnimCmd gFieldEffectAnim_83746AC[] = {
    {.frame = {0, 12}},
    {.frame = {1, 12}},
    {.frame = {2, 8}},
    {.frame = {3, 12}},
    {.frame = {4, 12}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_Ash[] = {
    gFieldEffectAnim_83746AC
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Ash = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_Ash, gFieldEffectPicTable_Ash, gDummySpriteAffineAnimTable, sub_8127D84};

const struct SpriteFrameImage gFieldEffectPicTable_SurfBlob[] = {
    {.data = (u8 *)gFieldEffectPic_SurfBlob_0, .size = sizeof gFieldEffectPic_SurfBlob_0},
    {.data = (u8 *)gFieldEffectPic_SurfBlob_1, .size = sizeof gFieldEffectPic_SurfBlob_1},
    {.data = (u8 *)gFieldEffectPic_SurfBlob_2, .size = sizeof gFieldEffectPic_SurfBlob_2}
};

const union AnimCmd gFieldEffectAnim_83746F8[] = {
    {.frame = {0, 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gFieldEffectAnim_8374700[] = {
    {.frame = {1, 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gFieldEffectAnim_8374708[] = {
    {.frame = {2, 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gFieldEffectAnim_8374710[] = {
    {.frame = {2, 1, .hFlip = 1}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd *const gFieldEffectAnimTable_SurfBlob[] = {
    gFieldEffectAnim_83746F8,
    gFieldEffectAnim_8374700,
    gFieldEffectAnim_8374708,
    gFieldEffectAnim_8374710
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_SurfBlob = {0xFFFF, 0xFFFF, &gFieldOamData_32x32, gFieldEffectAnimTable_SurfBlob, gFieldEffectPicTable_SurfBlob, gDummySpriteAffineAnimTable, sub_8127F7C};

const struct SpriteFrameImage gFieldEffectPicTable_Arrow[] = {
    {.data = (u8 *)gFieldEffectPic_Arrow_0, .size = sizeof gFieldEffectPic_Arrow_0},
    {.data = (u8 *)gFieldEffectPic_Arrow_1, .size = sizeof gFieldEffectPic_Arrow_1},
    {.data = (u8 *)gFieldEffectPic_Arrow_2, .size = sizeof gFieldEffectPic_Arrow_2},
    {.data = (u8 *)gFieldEffectPic_Arrow_3, .size = sizeof gFieldEffectPic_Arrow_3},
    {.data = (u8 *)gFieldEffectPic_Arrow_4, .size = sizeof gFieldEffectPic_Arrow_4},
    {.data = (u8 *)gFieldEffectPic_Arrow_5, .size = sizeof gFieldEffectPic_Arrow_5},
    {.data = (u8 *)gFieldEffectPic_Arrow_6, .size = sizeof gFieldEffectPic_Arrow_6},
    {.data = (u8 *)gFieldEffectPic_Arrow_7, .size = sizeof gFieldEffectPic_Arrow_7}
};

const union AnimCmd gFieldEffectAnim_8374780[] = {
    {.frame = {3, 32}},
    {.frame = {7, 32}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gFieldEffectAnim_837478C[] = {
    {.frame = {0, 32}},
    {.frame = {4, 32}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gFieldEffectAnim_8374798[] = {
    {.frame = {1, 32}},
    {.frame = {5, 32}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd gFieldEffectAnim_83747A4[] = {
    {.frame = {2, 32}},
    {.frame = {6, 32}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd *const gFieldEffectAnimTable_Arrow[] = {
    gFieldEffectAnim_8374780,
    gFieldEffectAnim_837478C,
    gFieldEffectAnim_8374798,
    gFieldEffectAnim_83747A4
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Arrow = {0xFFFF, 0xFFFF, &gFieldOamData_16x16, gFieldEffectAnimTable_Arrow, gFieldEffectPicTable_Arrow, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

const struct SpriteFrameImage gFieldEffectPicTable_Dust[] = {
    {.data = (u8 *)gFieldEffectPic_Dust_0, .size = sizeof gFieldEffectPic_Dust_0},
    {.data = (u8 *)gFieldEffectPic_Dust_1, .size = sizeof gFieldEffectPic_Dust_1},
    {.data = (u8 *)gFieldEffectPic_Dust_2, .size = sizeof gFieldEffectPic_Dust_2}
};

const union AnimCmd gFieldEffectAnim_83747F0[] = {
    {.frame = {0, 8}},
    {.frame = {1, 8}},
    {.frame = {2, 8}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_Dust[] = {
    gFieldEffectAnim_83747F0
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Dust = {0xFFFF, 0x1004, &gFieldOamData_16x8, gFieldEffectAnimTable_Dust, gFieldEffectPicTable_Dust, gDummySpriteAffineAnimTable, sub_81287C4};

const struct SpriteFrameImage gFieldEffectPicTable_JumpTallGrass[] = {
    {.data = (u8 *)gFieldEffectPic_JumpTallGrass_0, .size = sizeof gFieldEffectPic_JumpTallGrass_0},
    {.data = (u8 *)gFieldEffectPic_JumpTallGrass_1, .size = sizeof gFieldEffectPic_JumpTallGrass_1},
    {.data = (u8 *)gFieldEffectPic_JumpTallGrass_2, .size = sizeof gFieldEffectPic_JumpTallGrass_2},
    {.data = (u8 *)gFieldEffectPic_JumpTallGrass_3, .size = sizeof gFieldEffectPic_JumpTallGrass_3}
};

const union AnimCmd gFieldEffectAnim_837483C[] = {
    {.frame = {0, 8}},
    {.frame = {1, 8}},
    {.frame = {2, 8}},
    {.frame = {3, 8}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_JumpTallGrass[] = {
    gFieldEffectAnim_837483C
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpTallGrass = {0xFFFF, 0x1005, &gFieldOamData_16x8, gFieldEffectAnimTable_JumpTallGrass, gFieldEffectPicTable_JumpTallGrass, gDummySpriteAffineAnimTable, sub_81287C4};

const struct SpriteFrameImage gFieldEffectPicTable_SandFootprints[] = {
    {.data = (u8 *)gFieldEffectPic_SandFootprints_0, .size = sizeof gFieldEffectPic_SandFootprints_0},
    {.data = (u8 *)gFieldEffectPic_SandFootprints_1, .size = sizeof gFieldEffectPic_SandFootprints_1}
};

const union AnimCmd gFieldEffectAnim_837487C[] = {
    {.frame = {0, 1, .vFlip = 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_8374884[] = {
    {.frame = {0, 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_837488C[] = {
    {.frame = {1, 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_8374894[] = {
    {.frame = {1, 1, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_SandFootprints[] = {
    gFieldEffectAnim_837487C,
    gFieldEffectAnim_837487C,
    gFieldEffectAnim_8374884,
    gFieldEffectAnim_837488C,
    gFieldEffectAnim_8374894
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_SandFootprints = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_SandFootprints, gFieldEffectPicTable_SandFootprints, gDummySpriteAffineAnimTable, sub_8127584};

const struct SpriteFrameImage gFieldEffectPicTable_DeepSandFootprints[] = {
    {.data = (u8 *)gFieldEffectPic_DeepSandFootprints_0, .size = sizeof gFieldEffectPic_DeepSandFootprints_0},
    {.data = (u8 *)gFieldEffectPic_DeepSandFootprints_1, .size = sizeof gFieldEffectPic_DeepSandFootprints_1}
};

const union AnimCmd gFieldEffectAnim_83748D8[] = {
    {.frame = {0, 1, .vFlip = 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_83748E0[] = {
    {.frame = {0, 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_83748E8[] = {
    {.frame = {1, 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_83748F0[] = {
    {.frame = {1, 1, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_DeepSandFootprints[] = {
    gFieldEffectAnim_83748D8,
    gFieldEffectAnim_83748D8,
    gFieldEffectAnim_83748E0,
    gFieldEffectAnim_83748E8,
    gFieldEffectAnim_83748F0
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_DeepSandFootprints = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_DeepSandFootprints, gFieldEffectPicTable_DeepSandFootprints, gDummySpriteAffineAnimTable, sub_8127584};

const struct SpriteFrameImage gFieldEffectPicTable_BikeTireTracks[] = {
    {.data = (u8 *)gFieldEffectPic_BikeTireTracks_0, .size = sizeof gFieldEffectPic_BikeTireTracks_0},
    {.data = (u8 *)gFieldEffectPic_BikeTireTracks_1, .size = sizeof gFieldEffectPic_BikeTireTracks_1},
    {.data = (u8 *)gFieldEffectPic_BikeTireTracks_2, .size = sizeof gFieldEffectPic_BikeTireTracks_2},
    {.data = (u8 *)gFieldEffectPic_BikeTireTracks_3, .size = sizeof gFieldEffectPic_BikeTireTracks_3}
};

const union AnimCmd gFieldEffectAnim_8374944[] = {
    {.frame = {2, 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_837494C[] = {
    {.frame = {2, 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_8374954[] = {
    {.frame = {1, 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_837495C[] = {
    {.frame = {1, 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_8374964[] = {
    {.frame = {0, 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_837496C[] = {
    {.frame = {0, 1, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_8374974[] = {
    {.frame = {3, 1, .hFlip = 1}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_837497C[] = {
    {.frame = {3, 1}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_BikeTireTracks[] = {
    gFieldEffectAnim_8374944,
    gFieldEffectAnim_8374944,
    gFieldEffectAnim_837494C,
    gFieldEffectAnim_8374954,
    gFieldEffectAnim_837495C,
    gFieldEffectAnim_8374964,
    gFieldEffectAnim_837496C,
    gFieldEffectAnim_8374974,
    gFieldEffectAnim_837497C
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_BikeTireTracks = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_BikeTireTracks, gFieldEffectPicTable_BikeTireTracks, gDummySpriteAffineAnimTable, sub_8127584};

const struct SpriteFrameImage gFieldEffectPicTable_JumpBigSplash[] = {
    {.data = (u8 *)gFieldEffectPic_JumpBigSplash_0, .size = sizeof gFieldEffectPic_JumpBigSplash_0},
    {.data = (u8 *)gFieldEffectPic_JumpBigSplash_1, .size = sizeof gFieldEffectPic_JumpBigSplash_1},
    {.data = (u8 *)gFieldEffectPic_JumpBigSplash_2, .size = sizeof gFieldEffectPic_JumpBigSplash_2},
    {.data = (u8 *)gFieldEffectPic_JumpBigSplash_3, .size = sizeof gFieldEffectPic_JumpBigSplash_3}
};

const union AnimCmd gFieldEffectAnim_83749E0[] = {
    {.frame = {0, 8}},
    {.frame = {1, 8}},
    {.frame = {2, 8}},
    {.frame = {3, 8}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_JumpBigSplash[] = {
    gFieldEffectAnim_83749E0
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpBigSplash = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_JumpBigSplash, gFieldEffectPicTable_JumpBigSplash, gDummySpriteAffineAnimTable, sub_81287C4};

const struct SpriteFrameImage gFieldEffectPicTable_Splash[] = {
    {.data = (u8 *)gFieldEffectPic_Splash_0, .size = sizeof gFieldEffectPic_Splash_0},
    {.data = (u8 *)gFieldEffectPic_Splash_1, .size = sizeof gFieldEffectPic_Splash_1}
};

const union AnimCmd gFieldEffectAnim_8374A20[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_8374A2C[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {0, 6}},
    {.frame = {1, 6}},
    {.frame = {0, 8}},
    {.frame = {1, 8}},
    {.frame = {0, 6}},
    {.frame = {1, 6}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd *const gFieldEffectAnimTable_Splash[] = {
    gFieldEffectAnim_8374A20,
    gFieldEffectAnim_8374A2C
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Splash = {0xFFFF, 0x1004, &gFieldOamData_16x8, gFieldEffectAnimTable_Splash, gFieldEffectPicTable_Splash, gDummySpriteAffineAnimTable, sub_81276B4};

const struct SpriteFrameImage gFieldEffectPicTable_JumpSmallSplash[] = {
    {.data = (u8 *)gFieldEffectPic_JumpSmallSplash_0, .size = sizeof gFieldEffectPic_JumpSmallSplash_0},
    {.data = (u8 *)gFieldEffectPic_JumpSmallSplash_1, .size = sizeof gFieldEffectPic_JumpSmallSplash_1},
    {.data = (u8 *)gFieldEffectPic_JumpSmallSplash_2, .size = sizeof gFieldEffectPic_JumpSmallSplash_2}
};

const union AnimCmd gFieldEffectAnim_8374A88[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_JumpSmallSplash[] = {
    gFieldEffectAnim_8374A88
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpSmallSplash = {0xFFFF, 0x1004, &gFieldOamData_16x8, gFieldEffectAnimTable_JumpSmallSplash, gFieldEffectPicTable_JumpSmallSplash, gDummySpriteAffineAnimTable, sub_81287C4};

const struct SpriteFrameImage gFieldEffectPicTable_LongGrass[] = {
    {.data = (u8 *)gFieldEffectPic_LongGrass_0, .size = sizeof gFieldEffectPic_LongGrass_0},
    {.data = (u8 *)gFieldEffectPic_LongGrass_1, .size = sizeof gFieldEffectPic_LongGrass_1},
    {.data = (u8 *)gFieldEffectPic_LongGrass_2, .size = sizeof gFieldEffectPic_LongGrass_2},
    {.data = (u8 *)gFieldEffectPic_LongGrass_3, .size = sizeof gFieldEffectPic_LongGrass_3}
};

const union AnimCmd gFieldEffectAnim_8374AD4[] = {
    {.frame = {1, 3}},
    {.frame = {2, 3}},
    {.frame = {0, 4}},
    {.frame = {3, 4}},
    {.frame = {0, 4}},
    {.frame = {3, 4}},
    {.frame = {0, 4}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_LongGrass[] = {
    gFieldEffectAnim_8374AD4
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_LongGrass = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_LongGrass, gFieldEffectPicTable_LongGrass, gDummySpriteAffineAnimTable, unc_grass_tall};

const struct SpriteFrameImage gFieldEffectPicTable_JumpLongGrass[] = {
    {.data = (u8 *)gFieldEffectPic_JumpLongGrass_0, .size = sizeof gFieldEffectPic_JumpLongGrass_0},
    {.data = (u8 *)gFieldEffectPic_JumpLongGrass_1, .size = sizeof gFieldEffectPic_JumpLongGrass_1},
    {.data = (u8 *)gFieldEffectPic_JumpLongGrass_2, .size = sizeof gFieldEffectPic_JumpLongGrass_2},
    {.data = (u8 *)gFieldEffectPic_JumpLongGrass_3, .size = sizeof gFieldEffectPic_JumpLongGrass_3},
    {.data = (u8 *)gFieldEffectPic_JumpLongGrass_4, .size = sizeof gFieldEffectPic_JumpLongGrass_4},
    {.data = (u8 *)gFieldEffectPic_JumpLongGrass_5, .size = sizeof gFieldEffectPic_JumpLongGrass_5}
};

const union AnimCmd gFieldEffectAnim_8374B40[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 8}},
    {.frame = {3, 8}},
    {.frame = {4, 8}},
    {.frame = {5, 8}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_JumpLongGrass[] = {
    gFieldEffectAnim_8374B40
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpLongGrass = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_JumpLongGrass, gFieldEffectPicTable_JumpLongGrass, gDummySpriteAffineAnimTable, sub_81287C4};

const struct SpriteFrameImage gFieldEffectPicTable_Unknown17[] = {
    {.data = (u8 *)gFieldEffectPic_JumpLongGrass_5, .size = sizeof gFieldEffectPic_JumpLongGrass_5},
    {.data = (u8 *)gFieldEffectPic_Unknown17_0, .size = sizeof gFieldEffectPic_Unknown17_0},
    {.data = (u8 *)gFieldEffectPic_Unknown17_1, .size = sizeof gFieldEffectPic_Unknown17_1},
    {.data = (u8 *)gFieldEffectPic_Unknown17_2, .size = sizeof gFieldEffectPic_Unknown17_2},
    {.data = (u8 *)gFieldEffectPic_Unknown17_3, .size = sizeof gFieldEffectPic_Unknown17_3},
    {.data = (u8 *)gFieldEffectPic_Unknown17_4, .size = sizeof gFieldEffectPic_Unknown17_4},
    {.data = (u8 *)gFieldEffectPic_Unknown17_5, .size = sizeof gFieldEffectPic_Unknown17_5},
    {.data = (u8 *)gFieldEffectPic_Unknown17_6, .size = sizeof gFieldEffectPic_Unknown17_6},
    {.data = (u8 *)gFieldEffectPic_Unknown17_7, .size = sizeof gFieldEffectPic_Unknown17_7}
};

const union AnimCmd gFieldEffectAnim_8374BC0[] = {
    {.frame = {0, 10}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.frame = {3, 4}},
    {.frame = {4, 4}},
    {.frame = {5, 4}},
    {.frame = {6, 4}},
    {.frame = {7, 4}},
    {.frame = {8, 4}},
    {.jump = {.type = -2, .target = 7}}
};

const union AnimCmd *const gFieldEffectAnimTable_Unknown17[] = {
    gFieldEffectAnim_8374BC0
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown17 = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_Unknown17, gFieldEffectPicTable_Unknown17, gDummySpriteAffineAnimTable, sub_8128800};

const struct SpriteFrameImage gFieldEffectPicTable_Unknown18[] = {
    {.data = (u8 *)gFieldEffectPic_Unknown18_0, .size = sizeof gFieldEffectPic_Unknown18_0},
    {.data = (u8 *)gFieldEffectPic_Unknown18_1, .size = sizeof gFieldEffectPic_Unknown18_1},
    {.data = (u8 *)gFieldEffectPic_Unknown18_2, .size = sizeof gFieldEffectPic_Unknown18_2},
    {.data = (u8 *)gFieldEffectPic_Unknown18_3, .size = sizeof gFieldEffectPic_Unknown18_3}
};

const union AnimCmd gFieldEffectAnim_8374C24[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.frame = {3, 4}},
    {.frame = {2, 4}},
    {.frame = {1, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd *const gFieldEffectAnimTable_Unknown18[] = {
    gFieldEffectAnim_8374C24
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown18 = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_Unknown18, gFieldEffectPicTable_Unknown18, gDummySpriteAffineAnimTable, sub_8128800};

const struct SpriteFrameImage gFieldEffectPicTable_Unknown19[] = {
    {.data = (u8 *)gFieldEffectPic_Unknown19_0, .size = sizeof gFieldEffectPic_Unknown19_0},
    {.data = (u8 *)gFieldEffectPic_Unknown19_1, .size = sizeof gFieldEffectPic_Unknown19_1},
    {.data = (u8 *)gFieldEffectPic_Unknown19_2, .size = sizeof gFieldEffectPic_Unknown19_2},
    {.data = (u8 *)gFieldEffectPic_Unknown19_3, .size = sizeof gFieldEffectPic_Unknown19_3}
};

const union AnimCmd gFieldEffectAnim_8374C7C[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.frame = {3, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd *const gFieldEffectAnimTable_Unknown19[] = {
    gFieldEffectAnim_8374C7C
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown19 = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_Unknown19, gFieldEffectPicTable_Unknown19, gDummySpriteAffineAnimTable, sub_8128800};

const struct SpriteFrameImage gFieldEffectPicTable_SandPile[] = {
    {.data = (u8 *)gFieldEffectPic_SandPile_0, .size = sizeof gFieldEffectPic_SandPile_0},
    {.data = (u8 *)gFieldEffectPic_SandPile_1, .size = sizeof gFieldEffectPic_SandPile_1},
    {.data = (u8 *)gFieldEffectPic_SandPile_2, .size = sizeof gFieldEffectPic_SandPile_2}
};

const union AnimCmd gFieldEffectAnim_8374CC4[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_SandPile[] = {
    gFieldEffectAnim_8374CC4
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_SandPile = {0xFFFF, 0x1004, &gFieldOamData_16x8, gFieldEffectAnimTable_SandPile, gFieldEffectPicTable_SandPile, gDummySpriteAffineAnimTable, sub_81282E0};

const struct SpriteFrameImage gFieldEffectPicTable_Unknown20[] = {
    {.data = (u8 *)gFieldEffectPic_Unknown20_0, .size = sizeof gFieldEffectPic_Unknown20_0},
    {.data = (u8 *)gFieldEffectPic_Unknown20_1, .size = sizeof gFieldEffectPic_Unknown20_1},
    {.data = (u8 *)gFieldEffectPic_Unknown20_2, .size = sizeof gFieldEffectPic_Unknown20_2},
    {.data = (u8 *)gFieldEffectPic_Unknown20_3, .size = sizeof gFieldEffectPic_Unknown20_3}
};

const union AnimCmd gFieldEffectAnim_8374D10[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.frame = {3, 4}},
    {.frame = {2, 4}},
    {.frame = {1, 4}},
    {.jump = {.type = -2, .target = 0}}
};

const union AnimCmd *const gFieldEffectAnimTable_Unknown20[] = {
    gFieldEffectAnim_8374D10
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown20 = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_Unknown20, gFieldEffectPicTable_Unknown20, gDummySpriteAffineAnimTable, sub_8128800};

const union AffineAnimCmd gFieldEffectAffineAnim_8374D48[] = {
    {.frame = {.xScale = 0xFF00, .yScale = 0x100, .rotation = -128, .duration = 0}},
    {.frame = {.xScale = 0x1, .yScale = 0x0, .rotation = 0, .duration = 4}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 8}},
    {.frame = {.xScale = 0xFFFF, .yScale = 0x0, .rotation = 0, .duration = 4}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 8}},
    {.frame = {.xScale = 0xFFFF, .yScale = 0x0, .rotation = 0, .duration = 4}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 8}},
    {.frame = {.xScale = 0x1, .yScale = 0x0, .rotation = 0, .duration = 4}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 8}},
    {.jump = {.type = 0x7FFE, .target = 1}}
};

const union AffineAnimCmd gFieldEffectAffineAnim_8374D98[] = {
    {.frame = {.xScale = 0x100, .yScale = 0x100, .rotation = -128, .duration = 0}},
    {.frame = {.xScale = 0xFFFF, .yScale = 0x0, .rotation = 0, .duration = 4}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 8}},
    {.frame = {.xScale = 0x1, .yScale = 0x0, .rotation = 0, .duration = 4}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 8}},
    {.frame = {.xScale = 0x1, .yScale = 0x0, .rotation = 0, .duration = 4}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 8}},
    {.frame = {.xScale = 0xFFFF, .yScale = 0x0, .rotation = 0, .duration = 4}},
    {.frame = {.xScale = 0x0, .yScale = 0x0, .rotation = 0, .duration = 8}},
    {.jump = {.type = 0x7FFE, .target = 1}}
};

const union AffineAnimCmd *const gFieldEffectAffineAnimTable_Unknown21[] = {
    gFieldEffectAffineAnim_8374D48,
    gFieldEffectAffineAnim_8374D98
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown21 = {0x0, 0xFFFF, &gDummyOamData, gDummySpriteAnimTable, ((void *)0), gFieldEffectAffineAnimTable_Unknown21, SpriteCallbackDummy};

const struct SpriteFrameImage gFieldEffectPicTable_BerryTreeGrowthSparkle[] = {
    {.data = (u8 *)gFieldEffectPic_BerryTreeGrowthSparkle_0, .size = sizeof gFieldEffectPic_BerryTreeGrowthSparkle_0},
    {.data = (u8 *)gFieldEffectPic_BerryTreeGrowthSparkle_1, .size = sizeof gFieldEffectPic_BerryTreeGrowthSparkle_1},
    {.data = (u8 *)gFieldEffectPic_BerryTreeGrowthSparkle_2, .size = sizeof gFieldEffectPic_BerryTreeGrowthSparkle_2},
    {.data = (u8 *)gFieldEffectPic_BerryTreeGrowthSparkle_3, .size = sizeof gFieldEffectPic_BerryTreeGrowthSparkle_3},
    {.data = (u8 *)gFieldEffectPic_BerryTreeGrowthSparkle_4, .size = sizeof gFieldEffectPic_BerryTreeGrowthSparkle_4},
    {.data = (u8 *)gFieldEffectPic_BerryTreeGrowthSparkle_5, .size = sizeof gFieldEffectPic_BerryTreeGrowthSparkle_5}
};

const union AnimCmd gFieldEffectAnim_8374E38[] = {
    {.frame = {0, 8}},
    {.frame = {1, 8}},
    {.frame = {2, 8}},
    {.frame = {3, 8}},
    {.frame = {4, 8}},
    {.frame = {5, 8}},
    {.loop = {.type = -3, .count = 0}},
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.frame = {3, 4}},
    {.frame = {4, 4}},
    {.frame = {5, 4}},
    {.loop = {.type = -3, .count = 3}},
    {.frame = {0, 8}},
    {.frame = {1, 8}},
    {.frame = {2, 8}},
    {.frame = {3, 8}},
    {.frame = {4, 8}},
    {.frame = {5, 8}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_BerryTreeGrowthSparkle[] = {
    gFieldEffectAnim_8374E38
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_BerryTreeGrowthSparkle = {0xFFFF, 0xFFFF, &gFieldOamData_16x16, gFieldEffectAnimTable_BerryTreeGrowthSparkle, gFieldEffectPicTable_BerryTreeGrowthSparkle, gDummySpriteAffineAnimTable, sub_8128800};

const struct SpriteFrameImage gFieldEffectPicTable_TreeDisguise[] = {
    {.data = (u8 *)gFieldEffectPic_TreeDisguise_0, .size = sizeof gFieldEffectPic_TreeDisguise_0},
    {.data = (u8 *)gFieldEffectPic_TreeDisguise_1, .size = sizeof gFieldEffectPic_TreeDisguise_1},
    {.data = (u8 *)gFieldEffectPic_TreeDisguise_2, .size = sizeof gFieldEffectPic_TreeDisguise_2},
    {.data = (u8 *)gFieldEffectPic_TreeDisguise_3, .size = sizeof gFieldEffectPic_TreeDisguise_3},
    {.data = (u8 *)gFieldEffectPic_TreeDisguise_4, .size = sizeof gFieldEffectPic_TreeDisguise_4},
    {.data = (u8 *)gFieldEffectPic_TreeDisguise_5, .size = sizeof gFieldEffectPic_TreeDisguise_5},
    {.data = (u8 *)gFieldEffectPic_TreeDisguise_6, .size = sizeof gFieldEffectPic_TreeDisguise_6}
};

const union AnimCmd gFieldEffectAnim_8374EE0[] = {
    {.frame = {0, 16}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_8374EE8[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.frame = {3, 4}},
    {.frame = {4, 4}},
    {.frame = {5, 4}},
    {.frame = {6, 4}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_TreeDisguise[] = {
    gFieldEffectAnim_8374EE0,
    gFieldEffectAnim_8374EE8
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_TreeDisguise = {0xFFFF, 0xFFFF, &gFieldOamData_16x32, gFieldEffectAnimTable_TreeDisguise, gFieldEffectPicTable_TreeDisguise, gDummySpriteAffineAnimTable, sub_81285AC};

const struct SpriteFrameImage gFieldEffectPicTable_MountainDisguise[] = {
    {.data = (u8 *)gFieldEffectPic_MountainDisguise_0, .size = sizeof gFieldEffectPic_MountainDisguise_0},
    {.data = (u8 *)gFieldEffectPic_MountainDisguise_1, .size = sizeof gFieldEffectPic_MountainDisguise_1},
    {.data = (u8 *)gFieldEffectPic_MountainDisguise_2, .size = sizeof gFieldEffectPic_MountainDisguise_2},
    {.data = (u8 *)gFieldEffectPic_MountainDisguise_3, .size = sizeof gFieldEffectPic_MountainDisguise_3},
    {.data = (u8 *)gFieldEffectPic_MountainDisguise_4, .size = sizeof gFieldEffectPic_MountainDisguise_4},
    {.data = (u8 *)gFieldEffectPic_MountainDisguise_5, .size = sizeof gFieldEffectPic_MountainDisguise_5},
    {.data = (u8 *)gFieldEffectPic_MountainDisguise_6, .size = sizeof gFieldEffectPic_MountainDisguise_6}
};

const union AnimCmd gFieldEffectAnim_8374F60[] = {
    {.frame = {0, 16}},
    {.type = -1}
};

const union AnimCmd gFieldEffectAnim_8374F68[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.frame = {3, 4}},
    {.frame = {4, 4}},
    {.frame = {5, 4}},
    {.frame = {6, 4}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_MountainDisguise[] = {
    gFieldEffectAnim_8374F60,
    gFieldEffectAnim_8374F68
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_MountainDisguise = {0xFFFF, 0xFFFF, &gFieldOamData_16x32, gFieldEffectAnimTable_MountainDisguise, gFieldEffectPicTable_MountainDisguise, gDummySpriteAffineAnimTable, sub_81285AC};

const struct SpriteFrameImage gFieldEffectPicTable_SandDisguise[] = {
    {.data = (u8 *)gFieldEffectPic_SandDisguise_0, .size = sizeof gFieldEffectPic_SandDisguise_0},
    {.data = (u8 *)gFieldEffectPic_SandDisguise_1, .size = sizeof gFieldEffectPic_SandDisguise_1},
    {.data = (u8 *)gFieldEffectPic_SandDisguise_2, .size = sizeof gFieldEffectPic_SandDisguise_2},
    {.data = (u8 *)gFieldEffectPic_SandDisguise_3, .size = sizeof gFieldEffectPic_SandDisguise_3},
    {.data = (u8 *)gFieldEffectPic_SandDisguise_4, .size = sizeof gFieldEffectPic_SandDisguise_4},
    {.data = (u8 *)gFieldEffectPic_SandDisguise_5, .size = sizeof gFieldEffectPic_SandDisguise_5},
    {.data = (u8 *)gFieldEffectPic_SandDisguise_6, .size = sizeof gFieldEffectPic_SandDisguise_6}
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_SandDisguise = {0xFFFF, 0xFFFF, &gFieldOamData_16x32, gFieldEffectAnimTable_TreeDisguise, gFieldEffectPicTable_SandDisguise, gDummySpriteAffineAnimTable, sub_81285AC};

const struct SpriteFrameImage gFieldEffectPicTable_Bird[] = {
    {.data = (u8 *)gFieldEffectPic_Bird, .size = sizeof gFieldEffectPic_Bird}
};

const union AnimCmd gFieldEffectAnim_8375000[] = {
    {.frame = {0, 1}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_Bird[] = {
    gFieldEffectAnim_8375000
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Bird = {0xFFFF, 0xFFFF, &gFieldOamData_32x32, gFieldEffectAnimTable_Bird, gFieldEffectPicTable_Bird, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

const struct SpriteFrameImage gFieldEffectPicTable_ShortGrass[] = {
    {.data = (u8 *)gFieldEffectPic_ShortGrass_0, .size = sizeof gFieldEffectPic_ShortGrass_0},
    {.data = (u8 *)gFieldEffectPic_ShortGrass_1, .size = sizeof gFieldEffectPic_ShortGrass_1}
};

const union AnimCmd gFieldEffectAnim_8375034[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_ShortGrass[] = {
    gFieldEffectAnim_8375034
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_ShortGrass = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_ShortGrass, gFieldEffectPicTable_ShortGrass, gDummySpriteAffineAnimTable, sub_8127334};

const struct SpriteFrameImage gFieldEffectPicTable_HotSpringsWater[] = {
    {.data = (u8 *)gFieldEffectPic_HotSpringsWater, .size = sizeof gFieldEffectPic_HotSpringsWater}
};

const union AnimCmd gFieldEffectAnim_8375064[] = {
    {.frame = {0, 4}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_HotSpringsWater[] = {
    gFieldEffectAnim_8375064
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_HotSpringsWater = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_HotSpringsWater, gFieldEffectPicTable_HotSpringsWater, gDummySpriteAffineAnimTable, sub_8127A7C};

const struct SpriteFrameImage gFieldEffectPicTable_PopOutOfAsh[] = {
    {.data = (u8 *)gFieldEffectPic_PopOutOfAsh_0, .size = sizeof gFieldEffectPic_PopOutOfAsh_0},
    {.data = (u8 *)gFieldEffectPic_PopOutOfAsh_1, .size = sizeof gFieldEffectPic_PopOutOfAsh_1},
    {.data = (u8 *)gFieldEffectPic_PopOutOfAsh_2, .size = sizeof gFieldEffectPic_PopOutOfAsh_2},
    {.data = (u8 *)gFieldEffectPic_PopOutOfAsh_3, .size = sizeof gFieldEffectPic_PopOutOfAsh_3},
    {.data = (u8 *)gFieldEffectPic_PopOutOfAsh_4, .size = sizeof gFieldEffectPic_PopOutOfAsh_4}
};

const union AnimCmd gFieldEffectAnim_83750B0[] = {
    {.frame = {0, 6}},
    {.frame = {1, 6}},
    {.frame = {2, 6}},
    {.frame = {3, 6}},
    {.frame = {4, 6}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_PopOutOfAsh[] = {
    gFieldEffectAnim_83750B0
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_PopOutOfAsh = {0xFFFF, 0x100D, &gFieldOamData_16x16, gFieldEffectAnimTable_PopOutOfAsh, gFieldEffectPicTable_PopOutOfAsh, gDummySpriteAffineAnimTable, sub_808788C};

const struct SpritePalette gFieldEffectObjectPaletteInfo2 = {gFieldEffectObjectPalette2, 0x100D};

const struct SpriteFrameImage gFieldEffectPicTable_LavaridgeGymWarp[] = {
    {.data = (u8 *)gFieldEffectPic_LavaridgeGymWarp_0, .size = sizeof gFieldEffectPic_LavaridgeGymWarp_0},
    {.data = (u8 *)gFieldEffectPic_LavaridgeGymWarp_1, .size = sizeof gFieldEffectPic_LavaridgeGymWarp_1},
    {.data = (u8 *)gFieldEffectPic_LavaridgeGymWarp_2, .size = sizeof gFieldEffectPic_LavaridgeGymWarp_2},
    {.data = (u8 *)gFieldEffectPic_LavaridgeGymWarp_3, .size = sizeof gFieldEffectPic_LavaridgeGymWarp_3},
    {.data = (u8 *)gFieldEffectPic_LavaridgeGymWarp_4, .size = sizeof gFieldEffectPic_LavaridgeGymWarp_4}
};

const union AnimCmd gFieldEffectAnim_8375114[] = {
    {.frame = {0, 6}},
    {.frame = {1, 6}},
    {.frame = {2, 6}},
    {.frame = {3, 6}},
    {.frame = {4, 6}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_LavaridgeGymWarp[] = {
    gFieldEffectAnim_8375114
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_LavaridgeGymWarp = {0xFFFF, 0x100D, &gFieldOamData_16x16, gFieldEffectAnimTable_LavaridgeGymWarp, gFieldEffectPicTable_LavaridgeGymWarp, gDummySpriteAffineAnimTable, sub_8087638};

const struct SpriteFrameImage gFieldEffectPicTable_Bubbles[] = {
    {.data = (u8 *)gFieldEffectPic_Bubbles_0, .size = sizeof gFieldEffectPic_Bubbles_0},
    {.data = (u8 *)gFieldEffectPic_Bubbles_1, .size = sizeof gFieldEffectPic_Bubbles_1},
    {.data = (u8 *)gFieldEffectPic_Bubbles_2, .size = sizeof gFieldEffectPic_Bubbles_2},
    {.data = (u8 *)gFieldEffectPic_Bubbles_3, .size = sizeof gFieldEffectPic_Bubbles_3},
    {.data = (u8 *)gFieldEffectPic_Bubbles_4, .size = sizeof gFieldEffectPic_Bubbles_4},
    {.data = (u8 *)gFieldEffectPic_Bubbles_5, .size = sizeof gFieldEffectPic_Bubbles_5},
    {.data = (u8 *)gFieldEffectPic_Bubbles_6, .size = sizeof gFieldEffectPic_Bubbles_6},
    {.data = (u8 *)gFieldEffectPic_Bubbles_7, .size = sizeof gFieldEffectPic_Bubbles_7}
};

const union AnimCmd gFieldEffectAnim_8375188[] = {
    {.frame = {0, 4}},
    {.frame = {1, 4}},
    {.frame = {2, 4}},
    {.frame = {3, 6}},
    {.frame = {4, 6}},
    {.frame = {5, 4}},
    {.frame = {6, 4}},
    {.frame = {7, 4}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_Bubbles[] = {
    gFieldEffectAnim_8375188
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Bubbles = {0xFFFF, 0x1004, &gFieldOamData_16x32, gFieldEffectAnimTable_Bubbles, gFieldEffectPicTable_Bubbles, gDummySpriteAffineAnimTable, sub_8128410};

const struct SpriteFrameImage gFieldEffectPicTable_Sparkle[] = {
    {.data = (u8 *)gFieldEffectPic_Sparkle_0, .size = sizeof gFieldEffectPic_Sparkle_0},
    {.data = (u8 *)gFieldEffectPic_Sparkle_1, .size = sizeof gFieldEffectPic_Sparkle_1}
};

const union AnimCmd gFieldEffectAnim_83751D8[] = {
    {.frame = {0, 3}},
    {.frame = {1, 5}},
    {.frame = {0, 5}},
    {.type = -1}
};

const union AnimCmd *const gFieldEffectAnimTable_Sparkle[] = {
    gFieldEffectAnim_83751D8
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Sparkle = {0xFFFF, 0x100F, &gFieldOamData_16x16, gFieldEffectAnimTable_Sparkle, gFieldEffectPicTable_Sparkle, gDummySpriteAffineAnimTable, sub_8128774};

const struct SpritePalette gFieldEffectObjectPaletteInfo3 = {gFieldEffectObjectPalette3, 0x100F};
# 1795 "src/field/field_map_obj.c" 2

const s16 gUnknown_0837520C[] = {0x20, 0x40, 0x60, 0x80};
const s16 gUnknown_08375204[] = {0x20, 0x40, 0x80, 0xc0};
const s16 gUnknown_0837521C[] = {0x20, 0x30, 0x40, 0x50};

# 1 "src/field/../data/field_map_obj/callback_subroutine_pointers.h" 1
# 9 "src/field/../data/field_map_obj/callback_subroutine_pointers.h"
u8 (*const gUnknown_08375224[])(struct MapObject *, struct Sprite *) = {
    sub_805C8F0,
    sub_805C904,
    sub_805C930,
    sub_805C96C,
    sub_805C98C,
    sub_805C9D8,
    sub_805CA08
};

const u8 gUnknown_08375240[] = {DIR_SOUTH, DIR_NORTH, DIR_WEST, DIR_EAST};

u8 (*const gUnknown_08375244[])(s16, s16, s16, s16) = {
    sub_805CAAC,
    sub_805CADC,
    sub_805CAEC,
    sub_805CB00,
    sub_805CB5C,
    sub_805CBB8,
    sub_805CC14,
    sub_805CC70,
    sub_805CCAC,
    sub_805CCE8,
    sub_805CD24
};

u8 (*const gUnknown_08375270[])(struct MapObject *, struct Sprite *) = {
    sub_805CE2C,
    sub_805CE40,
    sub_805CE6C,
    sub_805CEB0,
    sub_805CEE0
};

u8 (*const gUnknown_08375284[])(struct MapObject *, struct Sprite *) = {
    sub_805CF6C,
    sub_805CF80,
    sub_805CFAC,
    sub_805CFE8,
    sub_805D008,
    sub_805D054,
    sub_805D084
};

const u8 gUnknown_083752A0[] = {DIR_SOUTH, DIR_NORTH};

u8 (*const gUnknown_083752A4[])(struct MapObject *, struct Sprite *) = {
    sub_805D0F0,
    sub_805D104,
    sub_805D130,
    sub_805D16C,
    sub_805D18C,
    sub_805D1D8,
    sub_805D208
};

const u8 gUnknown_083752C0[] = {DIR_WEST, DIR_EAST};

u8 (*const gUnknown_083752C4[])(struct MapObject *, struct Sprite *) = {
    sub_805D274,
    sub_805D2A0,
    sub_805D2C0
};

u8 (*const gUnknown_083752D0[])(struct MapObject *, struct Sprite *) = {
    do_berry_tree_growth_sparkle_1,
    sub_805D3EC,
    do_berry_tree_growth_sparkle_2,
    sub_805D458,
    sub_805D4A8
};

u8 (*const gUnknown_083752E4[])(struct MapObject *, struct Sprite *) = {
    sub_805D538,
    sub_805D54C,
    sub_805D578,
    sub_805D5BC,
    sub_805D5EC
};

u8 (*const gUnknown_083752F8[])(struct MapObject *, struct Sprite *) = {
    sub_805D678,
    sub_805D68C,
    sub_805D6B8,
    sub_805D6FC,
    sub_805D72C
};

u8 (*const gUnknown_0837530C[])(struct MapObject *, struct Sprite *) = {
    sub_805D7B8,
    sub_805D7CC,
    sub_805D7F8,
    sub_805D83C,
    sub_805D86C
};

const u8 gUnknown_08375320[] = {DIR_NORTH, DIR_WEST};

u8 (*const gUnknown_08375324[])(struct MapObject *, struct Sprite *) = {
    sub_805D8F8,
    sub_805D90C,
    sub_805D938,
    sub_805D97C,
    sub_805D9AC
};

const u8 gUnknown_08375338[] = {DIR_NORTH, DIR_EAST};

u8 (*const gUnknown_0837533C[])(struct MapObject *, struct Sprite *) = {
    sub_805DA38,
    sub_805DA4C,
    sub_805DA78,
    sub_805DABC,
    sub_805DAEC
};

const u8 gUnknown_08375350[] = {DIR_SOUTH, DIR_WEST};

u8 (*const gUnknown_08375354[])(struct MapObject *, struct Sprite *) = {
    sub_805DB78,
    sub_805DB8C,
    sub_805DBB8,
    sub_805DBFC,
    sub_805DC2C
};

const u8 gUnknown_08375368[] = {DIR_SOUTH, DIR_EAST};

u8 (*const gUnknown_0837536C[])(struct MapObject *, struct Sprite *) = {
    sub_805DCB8,
    sub_805DCCC,
    sub_805DCF8,
    sub_805DD3C,
    sub_805DD6C
};

const u8 gUnknown_08375380[] = {DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_SOUTH};

u8 (*const gUnknown_08375384[])(struct MapObject *, struct Sprite *) = {
    sub_805DDF8,
    sub_805DE0C,
    sub_805DE38,
    sub_805DE7C,
    sub_805DEAC
};

const u8 gUnknown_08375398[] = {DIR_SOUTH, DIR_NORTH, DIR_EAST, DIR_SOUTH};

u8 (*const gUnknown_0837539C[])(struct MapObject *, struct Sprite *) = {
    sub_805DF38,
    sub_805DF4C,
    sub_805DF78,
    sub_805DFBC,
    sub_805DFEC
};

const u8 gUnknown_083753B0[] = {DIR_NORTH, DIR_WEST, DIR_EAST, DIR_NORTH};

u8 (*const gUnknown_083753B4[])(struct MapObject *, struct Sprite *) = {
    sub_805E078,
    sub_805E08C,
    sub_805E0B8,
    sub_805E0FC,
    sub_805E12C
};

const u8 gUnknown_083753C8[] = {DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_SOUTH};

u8 (*const gUnknown_083753CC[])(struct MapObject *, struct Sprite *) = {
    sub_805E1B8,
    sub_805E1E4,
    sub_805E208,
    sub_805E234
};

const u8 gUnknown_083753DC[] = {DIR_SOUTH, DIR_EAST, DIR_WEST, DIR_SOUTH, DIR_NORTH};

u8 (*const gUnknown_083753E4[])(struct MapObject *, struct Sprite *) = {
    sub_805E2BC,
    sub_805E2E8,
    sub_805E30C,
    sub_805E338
};

const u8 gUnknown_083753F4[] = {DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};

u8 (*const gUnknown_083753FC[])(struct MapObject *, struct Sprite *) = {
    sub_805E3C0,
    sub_805E3D4,
    sub_805E40C,
    sub_805E4C4
};

u8 (*const gUnknown_0837540C[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805E620,
    sub_805E5B4
};

const u8 gUnknown_08375418[] = {DIR_NORTH, DIR_EAST, DIR_WEST, DIR_SOUTH};

u8 (*const gUnknown_0837541C[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805E6AC,
    sub_805E5B4
};

const u8 gUnknown_08375428[] = {DIR_EAST, DIR_WEST, DIR_SOUTH, DIR_NORTH};
u8 (*const gUnknown_0837542C[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805E738,
    sub_805E5B4
};

const u8 gUnknown_08375438[] = {DIR_SOUTH, DIR_NORTH, DIR_EAST, DIR_WEST};

u8 (*const gUnknown_0837543C[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805E7C4,
    sub_805E5B4
};

const u8 gUnknown_08375448[] = {DIR_WEST, DIR_SOUTH, DIR_NORTH, DIR_EAST};

u8 (*const gUnknown_0837544C[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805E850,
    sub_805E5B4
};

const u8 gUnknown_08375458[] = {DIR_NORTH, DIR_WEST, DIR_EAST, DIR_SOUTH};

u8 (*const gUnknown_0837545C[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805E8DC,
    sub_805E5B4
};

const u8 gUnknown_08375468[] = {DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_NORTH};

u8 (*const gUnknown_0837546C[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805E968,
    sub_805E5B4
};

u8 (*const gUnknown_08375478[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805E9F4,
    sub_805E5B4
};

const u8 gUnknown_08375484[] = {DIR_EAST, DIR_SOUTH, DIR_NORTH, DIR_WEST};

u8 (*const gUnknown_08375488[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805EA80,
    sub_805E5B4
};

const u8 gUnknown_08375494[] = {DIR_WEST, DIR_NORTH, DIR_SOUTH, DIR_EAST};

u8 (*const gUnknown_08375498[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805EB0C,
    sub_805E5B4
};

const u8 gUnknown_083754A4[] = {DIR_NORTH, DIR_SOUTH, DIR_EAST, DIR_WEST};

u8 (*const gUnknown_083754A8[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805EB98,
    sub_805E5B4
};

const u8 gUnknown_083754B4[] = {DIR_EAST, DIR_WEST, DIR_NORTH, DIR_SOUTH};

u8 (*const gUnknown_083754B8[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805EC24,
    sub_805E5B4
};

const u8 gUnknown_083754C4[] = {DIR_SOUTH, DIR_EAST, DIR_WEST, DIR_NORTH};

u8 (*const gUnknown_083754C8[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805ECB0,
    sub_805E5B4
};

const u8 gUnknown_083754D4[] = {DIR_EAST, DIR_NORTH, DIR_SOUTH, DIR_WEST};

u8 (*const gUnknown_083754D8[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805ED3C,
    sub_805E5B4
};

const u8 gUnknown_083754E4[] = {DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST};

u8 (*const gUnknown_083754E8[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805EDC8,
    sub_805E5B4
};

const u8 gUnknown_083754F4[] = {DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};

u8 (*const gUnknown_083754F8[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805EE54,
    sub_805E5B4
};

const u8 gUnknown_08375504[] = {DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH};

u8 (*const gUnknown_08375508[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805EEE0,
    sub_805E5B4
};

const u8 gUnknown_08375514[] = {DIR_NORTH, DIR_WEST, DIR_SOUTH, DIR_EAST};

u8 (*const gUnknown_08375518[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805EF6C,
    sub_805E5B4
};

const u8 gUnknown_08375524[] = {DIR_SOUTH, DIR_EAST, DIR_NORTH, DIR_WEST};

u8 (*const gUnknown_08375528[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805EFF8,
    sub_805E5B4
};

const u8 gUnknown_08375534[] = {DIR_WEST, DIR_SOUTH, DIR_EAST, DIR_NORTH};

u8 (*const gUnknown_08375538[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805F084,
    sub_805E5B4
};

const u8 gUnknown_08375544[] = {DIR_EAST, DIR_NORTH, DIR_WEST, DIR_SOUTH};

u8 (*const gUnknown_08375548[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805F110,
    sub_805E5B4
};

const u8 gUnknown_08375554[] = {DIR_NORTH, DIR_EAST, DIR_SOUTH, DIR_WEST};

u8 (*const gUnknown_08375558[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805F19C,
    sub_805E5B4
};

const u8 gUnknown_08375564[] = {DIR_SOUTH, DIR_WEST, DIR_NORTH, DIR_EAST};

u8 (*const gUnknown_08375568[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805F228,
    sub_805E5B4
};

const u8 gUnknown_08375574[] = {DIR_WEST, DIR_NORTH, DIR_EAST, DIR_SOUTH};

u8 (*const gUnknown_08375578[])(struct MapObject *, struct Sprite *) = {
    sub_805E4EC,
    sub_805F2B4,
    sub_805E5B4
};

const u8 gUnknown_08375584[] = {DIR_EAST, DIR_SOUTH, DIR_WEST, DIR_NORTH};

u8 (*const gUnknown_08375588[])(struct MapObject *, struct Sprite *) = {
    mss_npc_reset_oampriv3_1_unk2_unk3,
    sub_805F364,
    sub_805F3C4
};

u8 (*const gUnknown_08375594[])(struct MapObject *, struct Sprite *, u8, bool8(u8)) = {
    sub_805F3EC,
    sub_805F3F0,
    sub_805F438,
    sub_805F4F0,
    sub_805F5A8,
    sub_805F660,
    cph_IM_DIFFERENT,
    sub_805F760,
    oac_hopping,
    sub_805F3EC,
    sub_805F3EC
};

u8 (*const gUnknown_083755C0[])(struct MapObject *, struct Sprite *) = {
    mss_npc_reset_oampriv3_1_unk2_unk3,
    mss_08062EA4,
    sub_805F3C4
};

u8 (*const gUnknown_083755CC[])(struct MapObject *, struct Sprite *) = {
    sub_805FAF8
};

u8 (*const gUnknown_083755D0[])(struct MapObject *, struct Sprite *) = {
    sub_805FB64,
    sub_805FB04
};

u8 (*const gUnknown_083755D8[])(struct MapObject *, struct Sprite *) = {
    sub_805FBD4,
    sub_805FB04
};

u8 (*const gUnknown_083755E0[])(struct MapObject *, struct Sprite *) = {
    sub_805FC44,
    sub_805FB04
};

u8 (*const gUnknown_083755E8[])(struct MapObject *, struct Sprite *) = {
    sub_805FCB4,
    sub_805FCE8,
    sub_805FD08
};
# 1801 "src/field/field_map_obj.c" 2

const u8 gUnknown_083755F4[] = {0x00, 0x00, 0x01, 0x02, 0x03, 0x00, 0x00, 0x01, 0x01};
const u8 gUnknown_083755FD[] = {0x04, 0x04, 0x05, 0x06, 0x07, 0x04, 0x04, 0x05, 0x05};
const u8 gUnknown_08375606[] = {0x08, 0x08, 0x09, 0x0A, 0x0B, 0x08, 0x08, 0x09, 0x09};
const u8 gUnknown_0837560F[] = {0x0C, 0x0C, 0x0D, 0x0E, 0x0F, 0x0C, 0x0C, 0x0D, 0x0D};
const u8 gUnknown_08375618[] = {0x10, 0x10, 0x11, 0x12, 0x13, 0x10, 0x10, 0x11, 0x11};
const u8 gUnknown_08375621[] = {0x14, 0x14, 0x15, 0x16, 0x17, 0x14, 0x14, 0x15, 0x15};
const u8 gUnknown_0837562A[] = {0x14, 0x14, 0x15, 0x16, 0x17, 0x14, 0x14, 0x15, 0x15};
const u8 gUnknown_08375633[] = {0x18, 0x18, 0x19, 0x1A, 0x1B, 0x18, 0x18, 0x19, 0x19};
const u8 gUnknown_0837563C[] = {0x1C, 0x1C, 0x1D, 0x1E, 0x1F, 0x1C, 0x1C, 0x1D, 0x1D};
const u8 gUnknown_08375645[] = {0x20, 0x20, 0x21, 0x22, 0x23, 0x20, 0x20, 0x21, 0x21};
const u8 gUnknown_0837564E[] = {0x24, 0x24, 0x25, 0x26, 0x27, 0x24, 0x24, 0x25, 0x25};
const u8 gUnknown_08375657[] = {0x00, 0x00, 0x01, 0x02, 0x03, 0x00, 0x00, 0x01, 0x01};
const u8 gUnknown_08375660[] = {0x04, 0x04, 0x05, 0x06, 0x07, 0x04, 0x04, 0x05, 0x05};
const u8 gUnknown_08375669[] = {0x08, 0x08, 0x09, 0x0A, 0x0B, 0x08, 0x08, 0x09, 0x09};
const u8 gUnknown_08375672[] = {0x14, 0x14, 0x15, 0x16, 0x17, 0x14, 0x14, 0x15, 0x15};
const u8 gUnknown_0837567B[] = {0x08, 0x08, 0x07, 0x09, 0x0A, 0x08, 0x08, 0x07, 0x07};

bool8 (*const gUnknown_08375684[])(u8) = {
    MetatileBehavior_IsSouthBlocked,
    MetatileBehavior_IsNorthBlocked,
    MetatileBehavior_IsWestBlocked,
    MetatileBehavior_IsEastBlocked
};

bool8 (*const gUnknown_08375694[])(u8) = {
    MetatileBehavior_IsNorthBlocked,
    MetatileBehavior_IsSouthBlocked,
    MetatileBehavior_IsEastBlocked,
    MetatileBehavior_IsWestBlocked
};

const struct Coords16 gDirectionToVector[] = {
    { 0, 0},
    { 0, 1},
    { 0, -1},
    {-1, 0},
    { 1, 0},
    {-1, 1},
    { 1, 1},
    {-1, -1},
    { 1, -1}
};

const u8 gUnknown_083756C8[] = {0x00, 0x00, 0x01, 0x02, 0x03};
const u8 gUnknown_083756CD[] = {0x04, 0x04, 0x05, 0x06, 0x07};
const u8 gUnknown_083756D2[] = {0x08, 0x08, 0x09, 0x0A, 0x0B};
const u8 gUnknown_083756D7[] = {0x15, 0x15, 0x16, 0x17, 0x18};
const u8 gUnknown_083756DC[] = {0x29, 0x29, 0x2A, 0x2B, 0x2C};
const u8 gUnknown_083756E1[] = {0x2D, 0x2D, 0x2E, 0x2F, 0x30};
const u8 gUnknown_083756E6[] = {0x31, 0x31, 0x32, 0x33, 0x34};
const u8 gUnknown_083756EB[] = {0x35, 0x35, 0x36, 0x37, 0x38};
const u8 gUnknown_083756F0[] = {0x0C, 0x0C, 0x0D, 0x0E, 0x0F};
const u8 gUnknown_083756F5[] = {0x46, 0x46, 0x47, 0x48, 0x49};
const u8 gUnknown_083756FA[] = {0x4B, 0x4B, 0x4A, 0x4D, 0x4C};
const u8 gUnknown_083756FF[] = {0x42, 0x42, 0x43, 0x44, 0x45};
const u8 gUnknown_08375704[] = {0x3A, 0x3A, 0x3B, 0x3C, 0x3D};
const u8 gUnknown_08375709[] = {0x19, 0x19, 0x1A, 0x1B, 0x1C};
const u8 gUnknown_0837570E[] = {0x1D, 0x1D, 0x1E, 0x1F, 0x20};
const u8 gUnknown_08375713[] = {0x21, 0x21, 0x22, 0x23, 0x24};
const u8 gUnknown_08375718[] = {0x25, 0x25, 0x26, 0x27, 0x28};
const u8 gUnknown_0837571D[] = {0x62, 0x62, 0x63, 0x64, 0x65};
const u8 gUnknown_08375722[] = {0x66, 0x66, 0x67, 0x68, 0x69};
const u8 gUnknown_08375727[] = {0x6A, 0x6A, 0x6B, 0x6C, 0x6D};
const u8 gUnknown_0837572C[] = {0x6E, 0x6E, 0x6F, 0x70, 0x71};
const u8 gUnknown_08375731[] = {0x72, 0x72, 0x73, 0x74, 0x75};
const u8 gUnknown_08375736[] = {0x76, 0x76, 0x77, 0x78, 0x79};
const u8 gUnknown_0837573B[] = {0x7A, 0x7A, 0x7B, 0x7C, 0x7D};
const u8 gUnknown_08375740[] = {0x7E, 0x7E, 0x7F, 0x80, 0x81};
const u8 gUnknown_08375745[] = {0x82, 0x82, 0x83, 0x84, 0x85};
const u8 gUnknown_0837574A[] = {0x86, 0x86, 0x87, 0x88, 0x89};

const u8 gUnknown_0837574F[] = {2, 1, 4, 3, 8, 7, 6, 5};

const u8 gUnknown_08375757[][4] = {
    {2, 1, 4, 3},
    {1, 2, 3, 4},
    {3, 4, 2, 1},
    {4, 3, 1, 2}
};

const u8 gUnknown_08375767[][4] = {
    {2, 1, 4, 3},
    {1, 2, 3, 4},
    {4, 3, 1, 2},
    {3, 4, 2, 1}
};

# 1 "src/field/../data/field_map_obj/anim_func_ptrs.h" 1







u8 sub_8060CE0(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8060CF0(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8060D00(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8060D10(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8060F3C(struct MapObject *, struct Sprite *);
u8 sub_8060F5C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8060F7C(struct MapObject *, struct Sprite *);
u8 sub_8060F9C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8060FBC(struct MapObject *, struct Sprite *);
u8 sub_8060FDC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8060FFC(struct MapObject *, struct Sprite *);
u8 sub_806101C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_806103C(struct MapObject *, struct Sprite *);
u8 sub_806105C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_806107C(struct MapObject *, struct Sprite *);
u8 sub_806109C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80610BC(struct MapObject *, struct Sprite *);
u8 sub_80610DC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80610FC(struct MapObject *, struct Sprite *);
u8 sub_806111C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80613A8(struct MapObject *, struct Sprite *);
u8 sub_80613D4(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061400(struct MapObject *, struct Sprite *);
u8 sub_806142C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061458(struct MapObject *, struct Sprite *);
u8 sub_8061484(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80614B0(struct MapObject *, struct Sprite *);
u8 sub_80614DC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_806152C(struct MapObject *, struct Sprite *);
u8 sub_8061510(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_806154C(struct MapObject *, struct Sprite *);
u8 sub_8061510(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_806156C(struct MapObject *, struct Sprite *);
u8 sub_8061510(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_806158C(struct MapObject *, struct Sprite *);
u8 sub_8061510(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_80615AC(struct MapObject *, struct Sprite *);
u8 sub_8061510(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_80615CC(struct MapObject *, struct Sprite *);
u8 sub_80615EC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_806160C(struct MapObject *, struct Sprite *);
u8 sub_806162C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_806164C(struct MapObject *, struct Sprite *);
u8 sub_806166C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_806168C(struct MapObject *, struct Sprite *);
u8 sub_80616AC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061778(struct MapObject *, struct Sprite *);
u8 sub_806173C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80617B0(struct MapObject *, struct Sprite *);
u8 sub_806173C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80617E8(struct MapObject *, struct Sprite *);
u8 sub_806173C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061820(struct MapObject *, struct Sprite *);
u8 sub_806173C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061858(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061890(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80618C8(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061900(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061938(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061970(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80619A8(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80619E0(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061A18(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061A50(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061A88(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061AC0(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061AF8(struct MapObject *, struct Sprite *);
u8 sub_8061B18(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061B38(struct MapObject *, struct Sprite *);
u8 sub_8061B58(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061B78(struct MapObject *, struct Sprite *);
u8 sub_8061B98(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061BB8(struct MapObject *, struct Sprite *);
u8 sub_8061BD8(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061BF8(struct MapObject *, struct Sprite *);
u8 sub_8061C18(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061C38(struct MapObject *, struct Sprite *);
u8 sub_8061C58(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061C78(struct MapObject *, struct Sprite *);
u8 sub_8061C98(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061CB8(struct MapObject *, struct Sprite *);
u8 sub_8061CD8(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061CF8(struct MapObject *, struct Sprite *);
u8 sub_8061D18(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061D38(struct MapObject *, struct Sprite *);
u8 sub_8061D58(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061D78(struct MapObject *, struct Sprite *);
u8 sub_8061D98(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061DB8(struct MapObject *, struct Sprite *);
u8 sub_8061DD8(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 do_run_south_anim(struct MapObject *, struct Sprite *);
u8 sub_8061E18(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 do_run_north_anim(struct MapObject *, struct Sprite *);
u8 sub_8061E58(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 do_run_west_anim(struct MapObject *, struct Sprite *);
u8 sub_8061E98(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 do_run_east_anim(struct MapObject *, struct Sprite *);
u8 sub_8061ED8(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061F24(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061F90(struct MapObject *, struct Sprite *);
u8 sub_8061FB0(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8061FD8(struct MapObject *, struct Sprite *);
u8 sub_8061FF8(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062020(struct MapObject *, struct Sprite *);
u8 sub_8062040(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062068(struct MapObject *, struct Sprite *);
u8 sub_8062088(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80620B0(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_806210C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062170(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062180(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062190(struct MapObject *, struct Sprite *);
u8 sub_80621BC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80621E8(struct MapObject *, struct Sprite *);
u8 sub_8062214(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062240(struct MapObject *, struct Sprite *);
u8 sub_806226C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062298(struct MapObject *, struct Sprite *);
u8 sub_80622C4(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80622F0(struct MapObject *, struct Sprite *);
u8 sub_806231C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062348(struct MapObject *, struct Sprite *);
u8 sub_8062374(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80623A0(struct MapObject *, struct Sprite *);
u8 sub_80623CC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80623F8(struct MapObject *, struct Sprite *);
u8 sub_8062424(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062450(struct MapObject *, struct Sprite *);
u8 sub_806247C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80624A8(struct MapObject *, struct Sprite *);
u8 sub_80624D4(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062500(struct MapObject *, struct Sprite *);
u8 sub_806252C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062558(struct MapObject *, struct Sprite *);
u8 sub_8062584(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80625B0(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80625C8(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80625D8(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_80625E8(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_80625F8(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_8062608(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_8062634(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_8062644(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 do_exclamation_mark_bubble_1(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 do_exclamation_mark_bubble_2(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 do_heart_bubble(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_80626C0(struct MapObject *, struct Sprite *);
u8 sub_8062704(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_8062724(struct MapObject *, struct Sprite *);
u8 sub_8062740(struct MapObject *, struct Sprite *);
u8 sub_8062764(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_80627A0(struct MapObject *, struct Sprite *);
u8 sub_80627BC(struct MapObject *, struct Sprite *);
u8 sub_80627E0(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_806281C(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_806282C(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_806283C(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_806286C(struct MapObject *, struct Sprite *);
u8 sub_8063470(struct MapObject *, struct Sprite *);
u8 sub_806289C(struct MapObject *, struct Sprite *);
u8 sub_80628D0(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80628FC(struct MapObject *, struct Sprite *);
u8 sub_8062930(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_806299C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80629AC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80629BC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80629CC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80629DC(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062A00(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062A24(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062A48(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062A6C(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062A90(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062AB4(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062AD8(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062AFC(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062B20(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062B44(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062B68(struct MapObject *, struct Sprite *);
u8 sub_8061F3C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062BD0(struct MapObject *, struct Sprite *);
u8 sub_8062BFC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062C28(struct MapObject *, struct Sprite *);
u8 sub_8062C54(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062C80(struct MapObject *, struct Sprite *);
u8 sub_8062CAC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062CD8(struct MapObject *, struct Sprite *);
u8 sub_8062D04(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062D30(struct MapObject *, struct Sprite *);
u8 sub_8062D5C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062D88(struct MapObject *, struct Sprite *);
u8 sub_8062DB4(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062DE0(struct MapObject *, struct Sprite *);
u8 sub_8062E0C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062E38(struct MapObject *, struct Sprite *);
u8 sub_8062E64(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062E90(struct MapObject *, struct Sprite *);
u8 sub_8062EBC(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062EE8(struct MapObject *, struct Sprite *);
u8 sub_8062F14(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062F40(struct MapObject *, struct Sprite *);
u8 sub_8062F6C(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062F98(struct MapObject *, struct Sprite *);
u8 sub_8062FC4(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8062FF0(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8063028(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8063060(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8063098(struct MapObject *, struct Sprite *);
u8 sub_8061714(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8063108(struct MapObject *, struct Sprite *);
u8 sub_8063128(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8063148(struct MapObject *, struct Sprite *);
u8 sub_8063168(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8063188(struct MapObject *, struct Sprite *);
u8 sub_80631A8(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80631C8(struct MapObject *, struct Sprite *);
u8 sub_80631E8(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8063238(struct MapObject *, struct Sprite *);
u8 sub_8063258(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8063278(struct MapObject *, struct Sprite *);
u8 sub_8063298(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80632B8(struct MapObject *, struct Sprite *);
u8 sub_80632D8(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80632F8(struct MapObject *, struct Sprite *);
u8 sub_8063318(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8063370(struct MapObject *, struct Sprite *);
u8 sub_8063390(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80633B0(struct MapObject *, struct Sprite *);
u8 sub_80633D0(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_80633F0(struct MapObject *, struct Sprite *);
u8 sub_8063410(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);
u8 sub_8063430(struct MapObject *, struct Sprite *);
u8 sub_8063450(struct MapObject *, struct Sprite *);
u8 sub_8063474(struct MapObject *, struct Sprite *);

u8 (*const Unknown_83759A0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_83759A8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_83759B0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_83759B8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_83759D4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_83759E0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_83759EC[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_83759F8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A04[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A10[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A1C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A28[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A40[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A4C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A58[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A64[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A70[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A7C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A88[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375A94[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375AA0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375AAC[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375AB8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375AC4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375AD0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375ADC[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375AE8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375AF4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B00[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B0C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B18[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B24[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B30[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B3C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B48[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B54[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B60[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B6C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B78[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B84[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B90[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375B9C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375BA8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375BB4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375BC0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375BCC[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375BD8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375BE4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375BF0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375BFC[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C08[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C14[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C20[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C2C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C38[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C44[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C50[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C5C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C68[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C74[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C80[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C8C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375C98[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375CA0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375CA8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375CB0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375CB8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375CC4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375CD0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375CDC[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375CE8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375CF4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D00[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D0C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D18[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D24[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D30[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D3C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D48[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D50[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D5C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D64[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D6C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D74[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D7C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D84[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D8C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D94[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375D9C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375DA4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375DB0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375DC0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375DD0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375DD8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375DE0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375DE8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375DF0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375DFC[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E08[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E10[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E18[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E20[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E28[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E34[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E40[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E4C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E58[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E64[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E70[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375E7C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375EB8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375EC4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375ED0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375EDC[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375EE8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375EF4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F00[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F0C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F18[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F24[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F30[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F3C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F48[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F54[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F60[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F6C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F78[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F84[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F90[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375F9C[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375FA8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375FB4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375FC0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375FCC[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375FD8[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375FE4[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375FF0[])(struct MapObject *, struct Sprite *);
u8 (*const Unknown_8375FFC[])(struct MapObject *, struct Sprite *);

u8 (*const *const gUnknown_08375778[])(struct MapObject *, struct Sprite *) = {
    Unknown_83759A0,
    Unknown_83759A8,
    Unknown_83759B0,
    Unknown_83759B8,
    Unknown_83759D4,
    Unknown_83759E0,
    Unknown_83759EC,
    Unknown_83759F8,
    Unknown_8375A04,
    Unknown_8375A10,
    Unknown_8375A1C,
    Unknown_8375A28,
    Unknown_8375A40,
    Unknown_8375A4C,
    Unknown_8375A58,
    Unknown_8375A64,
    Unknown_8375A70,
    Unknown_8375A7C,
    Unknown_8375A88,
    Unknown_8375A94,
    Unknown_8375AA0,
    Unknown_8375AAC,
    Unknown_8375AB8,
    Unknown_8375AC4,
    Unknown_8375AD0,
    Unknown_8375ADC,
    Unknown_8375AE8,
    Unknown_8375AF4,
    Unknown_8375B00,
    Unknown_8375B0C,
    Unknown_8375B18,
    Unknown_8375B24,
    Unknown_8375B30,
    Unknown_8375B3C,
    Unknown_8375B48,
    Unknown_8375B54,
    Unknown_8375B60,
    Unknown_8375B6C,
    Unknown_8375B78,
    Unknown_8375B84,
    Unknown_8375B90,
    Unknown_8375B9C,
    Unknown_8375BA8,
    Unknown_8375BB4,
    Unknown_8375BC0,
    Unknown_8375BCC,
    Unknown_8375BD8,
    Unknown_8375BE4,
    Unknown_8375BF0,
    Unknown_8375BFC,
    Unknown_8375C08,
    Unknown_8375C14,
    Unknown_8375C20,
    Unknown_8375C2C,
    Unknown_8375C38,
    Unknown_8375C44,
    Unknown_8375C50,
    Unknown_8375C5C,
    Unknown_8375C68,
    Unknown_8375C74,
    Unknown_8375C80,
    Unknown_8375C8C,
    Unknown_8375C98,
    Unknown_8375CA0,
    Unknown_8375CA8,
    Unknown_8375CB0,
    Unknown_8375CB8,
    Unknown_8375CC4,
    Unknown_8375CD0,
    Unknown_8375CDC,
    Unknown_8375CE8,
    Unknown_8375CF4,
    Unknown_8375D00,
    Unknown_8375D0C,
    Unknown_8375D18,
    Unknown_8375D24,
    Unknown_8375D30,
    Unknown_8375D3C,
    Unknown_8375D48,
    Unknown_8375D50,
    Unknown_8375D5C,
    Unknown_8375D64,
    Unknown_8375D6C,
    Unknown_8375D74,
    Unknown_8375D7C,
    Unknown_8375D84,
    Unknown_8375D8C,
    Unknown_8375D94,
    Unknown_8375D9C,
    Unknown_8375DA4,
    Unknown_8375DB0,
    Unknown_8375DC0,
    Unknown_8375DD0,
    Unknown_8375DD8,
    Unknown_8375DE0,
    Unknown_8375DE8,
    Unknown_8375DF0,
    Unknown_8375DFC,
    Unknown_8375E08,
    Unknown_8375E10,
    Unknown_8375E18,
    Unknown_8375E20,
    Unknown_8375E28,
    Unknown_8375E34,
    Unknown_8375E40,
    Unknown_8375E4C,
    Unknown_8375E58,
    Unknown_8375E64,
    Unknown_8375E70,
    Unknown_8375E7C,
    Unknown_8375EB8,
    Unknown_8375EC4,
    Unknown_8375ED0,
    Unknown_8375EDC,
    Unknown_8375EE8,
    Unknown_8375EF4,
    Unknown_8375F00,
    Unknown_8375F0C,
    Unknown_8375F18,
    Unknown_8375F24,
    Unknown_8375F30,
    Unknown_8375F3C,
    Unknown_8375F48,
    Unknown_8375F54,
    Unknown_8375F60,
    Unknown_8375F6C,
    Unknown_8375F78,
    Unknown_8375F84,
    Unknown_8375F90,
    Unknown_8375F9C,
    Unknown_8375FA8,
    Unknown_8375FB4,
    Unknown_8375FC0,
    Unknown_8375FCC,
    Unknown_8375FD8,
    Unknown_8375FE4,
    Unknown_8375FF0,
    Unknown_8375FFC
};


u8 (*const Unknown_83759A0[])(struct MapObject *, struct Sprite *) = {
    sub_8060CE0,
    sub_8063474
};

u8 (*const Unknown_83759A8[])(struct MapObject *, struct Sprite *) = {
    sub_8060CF0,
    sub_8063474
};

u8 (*const Unknown_83759B0[])(struct MapObject *, struct Sprite *) = {
    sub_8060D00,
    sub_8063474
};

u8 (*const Unknown_83759B8[])(struct MapObject *, struct Sprite *) = {
    sub_8060D10,
    sub_8063474
};

u8 (*const gUnknown_083759C0[])(u8) = {
    get_go_image_anim_num,
    get_go_fast_image_anim_num,
    get_go_fast_image_anim_num,
    get_go_faster_image_anim_num,
    sub_805FD78
};

u8 (*const Unknown_83759D4[])(struct MapObject *, struct Sprite *) = {
    sub_8060F3C,
    sub_8060F5C,
    sub_8063474
};

u8 (*const Unknown_83759E0[])(struct MapObject *, struct Sprite *) = {
    sub_8060F7C,
    sub_8060F9C,
    sub_8063474
};

u8 (*const Unknown_83759EC[])(struct MapObject *, struct Sprite *) = {
    sub_8060FBC,
    sub_8060FDC,
    sub_8063474
};

u8 (*const Unknown_83759F8[])(struct MapObject *, struct Sprite *) = {
    sub_8060FFC,
    sub_806101C,
    sub_8063474
};

u8 (*const Unknown_8375A04[])(struct MapObject *, struct Sprite *) = {
    sub_806103C,
    sub_806105C,
    sub_8063474
};

u8 (*const Unknown_8375A10[])(struct MapObject *, struct Sprite *) = {
    sub_806107C,
    sub_806109C,
    sub_8063474
};

u8 (*const Unknown_8375A1C[])(struct MapObject *, struct Sprite *) = {
    sub_80610BC,
    sub_80610DC,
    sub_8063474
};

u8 (*const Unknown_8375A28[])(struct MapObject *, struct Sprite *) = {
    sub_80610FC,
    sub_806111C,
    sub_8063474
};

const s16 gUnknown_08375A34[] = {0, 1, 1};
const s16 gUnknown_08375A3A[] = {0, 0, 1};

u8 (*const Unknown_8375A40[])(struct MapObject *, struct Sprite *) = {
    sub_80613A8,
    sub_80613D4,
    sub_8063474
};

u8 (*const Unknown_8375A4C[])(struct MapObject *, struct Sprite *) = {
    sub_8061400,
    sub_806142C,
    sub_8063474
};

u8 (*const Unknown_8375A58[])(struct MapObject *, struct Sprite *) = {
    sub_8061458,
    sub_8061484,
    sub_8063474
};

u8 (*const Unknown_8375A64[])(struct MapObject *, struct Sprite *) = {
    sub_80614B0,
    sub_80614DC,
    sub_8063474
};

u8 (*const Unknown_8375A70[])(struct MapObject *, struct Sprite *) = {
    sub_806152C,
    sub_8061510,
    sub_8063470
};

u8 (*const Unknown_8375A7C[])(struct MapObject *, struct Sprite *) = {
    sub_806154C,
    sub_8061510,
    sub_8063470
};

u8 (*const Unknown_8375A88[])(struct MapObject *, struct Sprite *) = {
    sub_806156C,
    sub_8061510,
    sub_8063470
};

u8 (*const Unknown_8375A94[])(struct MapObject *, struct Sprite *) = {
    sub_806158C,
    sub_8061510,
    sub_8063470
};

u8 (*const Unknown_8375AA0[])(struct MapObject *, struct Sprite *) = {
    sub_80615AC,
    sub_8061510,
    sub_8063470
};

u8 (*const Unknown_8375AAC[])(struct MapObject *, struct Sprite *) = {
    sub_80615CC,
    sub_80615EC,
    sub_8063474
};

u8 (*const Unknown_8375AB8[])(struct MapObject *, struct Sprite *) = {
    sub_806160C,
    sub_806162C,
    sub_8063474
};

u8 (*const Unknown_8375AC4[])(struct MapObject *, struct Sprite *) = {
    sub_806164C,
    sub_806166C,
    sub_8063474
};

u8 (*const Unknown_8375AD0[])(struct MapObject *, struct Sprite *) = {
    sub_806168C,
    sub_80616AC,
    sub_8063474
};

u8 (*const Unknown_8375ADC[])(struct MapObject *, struct Sprite *) = {
    sub_8061778,
    sub_806173C,
    sub_8063474
};

u8 (*const Unknown_8375AE8[])(struct MapObject *, struct Sprite *) = {
    sub_80617B0,
    sub_806173C,
    sub_8063474
};

u8 (*const Unknown_8375AF4[])(struct MapObject *, struct Sprite *) = {
    sub_80617E8,
    sub_806173C,
    sub_8063474
};

u8 (*const Unknown_8375B00[])(struct MapObject *, struct Sprite *) = {
    sub_8061820,
    sub_806173C,
    sub_8063474
};

u8 (*const Unknown_8375B0C[])(struct MapObject *, struct Sprite *) = {
    sub_8061858,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B18[])(struct MapObject *, struct Sprite *) = {
    sub_8061890,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B24[])(struct MapObject *, struct Sprite *) = {
    sub_80618C8,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B30[])(struct MapObject *, struct Sprite *) = {
    sub_8061900,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B3C[])(struct MapObject *, struct Sprite *) = {
    sub_8061938,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B48[])(struct MapObject *, struct Sprite *) = {
    sub_8061970,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B54[])(struct MapObject *, struct Sprite *) = {
    sub_80619A8,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B60[])(struct MapObject *, struct Sprite *) = {
    sub_80619E0,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B6C[])(struct MapObject *, struct Sprite *) = {
    sub_8061A18,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B78[])(struct MapObject *, struct Sprite *) = {
    sub_8061A50,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B84[])(struct MapObject *, struct Sprite *) = {
    sub_8061A88,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B90[])(struct MapObject *, struct Sprite *) = {
    sub_8061AC0,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375B9C[])(struct MapObject *, struct Sprite *) = {
    sub_8061AF8,
    sub_8061B18,
    sub_8063474
};

u8 (*const Unknown_8375BA8[])(struct MapObject *, struct Sprite *) = {
    sub_8061B38,
    sub_8061B58,
    sub_8063474
};

u8 (*const Unknown_8375BB4[])(struct MapObject *, struct Sprite *) = {
    sub_8061B78,
    sub_8061B98,
    sub_8063474
};

u8 (*const Unknown_8375BC0[])(struct MapObject *, struct Sprite *) = {
    sub_8061BB8,
    sub_8061BD8,
    sub_8063474
};

u8 (*const Unknown_8375BCC[])(struct MapObject *, struct Sprite *) = {
    sub_8061BF8,
    sub_8061C18,
    sub_8063474
};

u8 (*const Unknown_8375BD8[])(struct MapObject *, struct Sprite *) = {
    sub_8061C38,
    sub_8061C58,
    sub_8063474
};

u8 (*const Unknown_8375BE4[])(struct MapObject *, struct Sprite *) = {
    sub_8061C78,
    sub_8061C98,
    sub_8063474
};

u8 (*const Unknown_8375BF0[])(struct MapObject *, struct Sprite *) = {
    sub_8061CB8,
    sub_8061CD8,
    sub_8063474
};

u8 (*const Unknown_8375BFC[])(struct MapObject *, struct Sprite *) = {
    sub_8061CF8,
    sub_8061D18,
    sub_8063474
};

u8 (*const Unknown_8375C08[])(struct MapObject *, struct Sprite *) = {
    sub_8061D38,
    sub_8061D58,
    sub_8063474
};

u8 (*const Unknown_8375C14[])(struct MapObject *, struct Sprite *) = {
    sub_8061D78,
    sub_8061D98,
    sub_8063474
};

u8 (*const Unknown_8375C20[])(struct MapObject *, struct Sprite *) = {
    sub_8061DB8,
    sub_8061DD8,
    sub_8063474
};

u8 (*const Unknown_8375C2C[])(struct MapObject *, struct Sprite *) = {
    do_run_south_anim,
    sub_8061E18,
    sub_8063474
};

u8 (*const Unknown_8375C38[])(struct MapObject *, struct Sprite *) = {
    do_run_north_anim,
    sub_8061E58,
    sub_8063474
};

u8 (*const Unknown_8375C44[])(struct MapObject *, struct Sprite *) = {
    do_run_west_anim,
    sub_8061E98,
    sub_8063474
};

u8 (*const Unknown_8375C50[])(struct MapObject *, struct Sprite *) = {
    do_run_east_anim,
    sub_8061ED8,
    sub_8063474
};

u8 (*const Unknown_8375C5C[])(struct MapObject *, struct Sprite *) = {
    sub_8061F24,
    sub_8061F3C,
    sub_8063474
};

u8 (*const Unknown_8375C68[])(struct MapObject *, struct Sprite *) = {
    sub_8061F90,
    sub_8061FB0,
    sub_8063474
};

u8 (*const Unknown_8375C74[])(struct MapObject *, struct Sprite *) = {
    sub_8061FD8,
    sub_8061FF8,
    sub_8063474
};

u8 (*const Unknown_8375C80[])(struct MapObject *, struct Sprite *) = {
    sub_8062020,
    sub_8062040,
    sub_8063474
};

u8 (*const Unknown_8375C8C[])(struct MapObject *, struct Sprite *) = {
    sub_8062068,
    sub_8062088,
    sub_8063474
};

u8 (*const Unknown_8375C98[])(struct MapObject *, struct Sprite *) = {
    sub_80620B0,
    sub_8063474
};

u8 (*const Unknown_8375CA0[])(struct MapObject *, struct Sprite *) = {
    sub_806210C,
    sub_8063474
};

u8 (*const Unknown_8375CA8[])(struct MapObject *, struct Sprite *) = {
    sub_8062170,
    sub_8063474
};

u8 (*const Unknown_8375CB0[])(struct MapObject *, struct Sprite *) = {
    sub_8062180,
    sub_8063474
};

u8 (*const Unknown_8375CB8[])(struct MapObject *, struct Sprite *) = {
    sub_8062190,
    sub_80621BC,
    sub_8063474
};

u8 (*const Unknown_8375CC4[])(struct MapObject *, struct Sprite *) = {
    sub_80621E8,
    sub_8062214,
    sub_8063474
};

u8 (*const Unknown_8375CD0[])(struct MapObject *, struct Sprite *) = {
    sub_8062240,
    sub_806226C,
    sub_8063474
};

u8 (*const Unknown_8375CDC[])(struct MapObject *, struct Sprite *) = {
    sub_8062298,
    sub_80622C4,
    sub_8063474
};

u8 (*const Unknown_8375CE8[])(struct MapObject *, struct Sprite *) = {
    sub_80622F0,
    sub_806231C,
    sub_8063474
};

u8 (*const Unknown_8375CF4[])(struct MapObject *, struct Sprite *) = {
    sub_8062348,
    sub_8062374,
    sub_8063474
};

u8 (*const Unknown_8375D00[])(struct MapObject *, struct Sprite *) = {
    sub_80623A0,
    sub_80623CC,
    sub_8063474
};

u8 (*const Unknown_8375D0C[])(struct MapObject *, struct Sprite *) = {
    sub_80623F8,
    sub_8062424,
    sub_8063474
};

u8 (*const Unknown_8375D18[])(struct MapObject *, struct Sprite *) = {
    sub_8062450,
    sub_806247C,
    sub_8063474
};

u8 (*const Unknown_8375D24[])(struct MapObject *, struct Sprite *) = {
    sub_80624A8,
    sub_80624D4,
    sub_8063474
};

u8 (*const Unknown_8375D30[])(struct MapObject *, struct Sprite *) = {
    sub_8062500,
    sub_806252C,
    sub_8063474
};

u8 (*const Unknown_8375D3C[])(struct MapObject *, struct Sprite *) = {
    sub_8062558,
    sub_8062584,
    sub_8063474
};

u8 (*const Unknown_8375D48[])(struct MapObject *, struct Sprite *) = {
    sub_80625B0,
    sub_8063474
};

u8 (*const Unknown_8375D50[])(struct MapObject *, struct Sprite *) = {
    sub_80625C8,
    sub_8061F3C,
    sub_8063474
};

u8 (*const Unknown_8375D5C[])(struct MapObject *, struct Sprite *) = {
    sub_80625D8,
    sub_8063470
};

u8 (*const Unknown_8375D64[])(struct MapObject *, struct Sprite *) = {
    sub_80625E8,
    sub_8063470
};

u8 (*const Unknown_8375D6C[])(struct MapObject *, struct Sprite *) = {
    sub_80625F8,
    sub_8063470
};

u8 (*const Unknown_8375D74[])(struct MapObject *, struct Sprite *) = {
    sub_8062608,
    sub_8063470
};

u8 (*const Unknown_8375D7C[])(struct MapObject *, struct Sprite *) = {
    sub_8062634,
    sub_8063470
};

u8 (*const Unknown_8375D84[])(struct MapObject *, struct Sprite *) = {
    sub_8062644,
    sub_8063470
};

u8 (*const Unknown_8375D8C[])(struct MapObject *, struct Sprite *) = {
    do_exclamation_mark_bubble_1,
    sub_8063470
};

u8 (*const Unknown_8375D94[])(struct MapObject *, struct Sprite *) = {
    do_exclamation_mark_bubble_2,
    sub_8063470
};

u8 (*const Unknown_8375D9C[])(struct MapObject *, struct Sprite *) = {
    do_heart_bubble,
    sub_8063470
};

u8 (*const Unknown_8375DA4[])(struct MapObject *, struct Sprite *) = {
    sub_80626C0,
    sub_8062704,
    sub_8063470
};

u8 (*const Unknown_8375DB0[])(struct MapObject *, struct Sprite *) = {
    sub_8062724,
    sub_8062740,
    sub_8062764,
    sub_8063470
};

u8 (*const Unknown_8375DC0[])(struct MapObject *, struct Sprite *) = {
    sub_80627A0,
    sub_80627BC,
    sub_80627E0,
    sub_8063470
};

u8 (*const Unknown_8375DD0[])(struct MapObject *, struct Sprite *) = {
    sub_806281C,
    sub_8063470
};

u8 (*const Unknown_8375DD8[])(struct MapObject *, struct Sprite *) = {
    sub_806282C,
    sub_8063470
};

u8 (*const Unknown_8375DE0[])(struct MapObject *, struct Sprite *) = {
    sub_806283C,
    sub_8063470
};

u8 (*const Unknown_8375DE8[])(struct MapObject *, struct Sprite *) = {
    sub_806286C,
    sub_8063470
};

u8 (*const Unknown_8375DF0[])(struct MapObject *, struct Sprite *) = {
    sub_806289C,
    sub_80628D0,
    sub_8063474
};

u8 (*const Unknown_8375DFC[])(struct MapObject *, struct Sprite *) = {
    sub_80628FC,
    sub_8062930,
    sub_8063474
};

u8 (*const Unknown_8375E08[])(struct MapObject *, struct Sprite *) = {
    sub_806299C,
    sub_8063474
};

u8 (*const Unknown_8375E10[])(struct MapObject *, struct Sprite *) = {
    sub_80629AC,
    sub_8063474
};

u8 (*const Unknown_8375E18[])(struct MapObject *, struct Sprite *) = {
    sub_80629BC,
    sub_8063474
};

u8 (*const Unknown_8375E20[])(struct MapObject *, struct Sprite *) = {
    sub_80629CC,
    sub_8063474
};

u8 (*const Unknown_8375E28[])(struct MapObject *, struct Sprite *) = {
    sub_80629DC,
    sub_8061F3C,
    sub_8063474
};

u8 (*const Unknown_8375E34[])(struct MapObject *, struct Sprite *) = {
    sub_8062A00,
    sub_8061F3C,
    sub_8063474
};

u8 (*const Unknown_8375E40[])(struct MapObject *, struct Sprite *) = {
    sub_8062A24,
    sub_8061F3C,
    sub_8063474
};

u8 (*const Unknown_8375E4C[])(struct MapObject *, struct Sprite *) = {
    sub_8062A48,
    sub_8061F3C,
    sub_8063474
};

u8 (*const Unknown_8375E58[])(struct MapObject *, struct Sprite *) = {
    sub_8062A6C,
    sub_8061F3C,
    sub_8063474
};

u8 (*const Unknown_8375E64[])(struct MapObject *, struct Sprite *) = {
    sub_8062A90,
    sub_8061F3C,
    sub_8063474
};

u8 (*const Unknown_8375E70[])(struct MapObject *, struct Sprite *) = {
    sub_8062AB4,
    sub_8061F3C,
    sub_8063474
};

u8 (*const Unknown_8375E7C[])(struct MapObject *, struct Sprite *) = {
    sub_8062AD8,
    sub_8061F3C,
    sub_8063474,
    sub_8062AFC,
    sub_8061F3C,
    sub_8063474,
    sub_8062B20,
    sub_8061F3C,
    sub_8063474,
    sub_8062B44,
    sub_8061F3C,
    sub_8063474,
    sub_8062B68,
    sub_8061F3C,
    sub_8063474
};

u8 (*const Unknown_8375EB8[])(struct MapObject *, struct Sprite *) = {
    sub_8062BD0,
    sub_8062BFC,
    sub_8063474
};

u8 (*const Unknown_8375EC4[])(struct MapObject *, struct Sprite *) = {
    sub_8062C28,
    sub_8062C54,
    sub_8063474
};

u8 (*const Unknown_8375ED0[])(struct MapObject *, struct Sprite *) = {
    sub_8062C80,
    sub_8062CAC,
    sub_8063474
};

u8 (*const Unknown_8375EDC[])(struct MapObject *, struct Sprite *) = {
    sub_8062CD8,
    sub_8062D04,
    sub_8063474
};

u8 (*const Unknown_8375EE8[])(struct MapObject *, struct Sprite *) = {
    sub_8062D30,
    sub_8062D5C,
    sub_8063474
};

u8 (*const Unknown_8375EF4[])(struct MapObject *, struct Sprite *) = {
    sub_8062D88,
    sub_8062DB4,
    sub_8063474
};

u8 (*const Unknown_8375F00[])(struct MapObject *, struct Sprite *) = {
    sub_8062DE0,
    sub_8062E0C,
    sub_8063474
};

u8 (*const Unknown_8375F0C[])(struct MapObject *, struct Sprite *) = {
    sub_8062E38,
    sub_8062E64,
    sub_8063474
};

u8 (*const Unknown_8375F18[])(struct MapObject *, struct Sprite *) = {
    sub_8062E90,
    sub_8062EBC,
    sub_8063474
};

u8 (*const Unknown_8375F24[])(struct MapObject *, struct Sprite *) = {
    sub_8062EE8,
    sub_8062F14,
    sub_8063474
};

u8 (*const Unknown_8375F30[])(struct MapObject *, struct Sprite *) = {
    sub_8062F40,
    sub_8062F6C,
    sub_8063474
};

u8 (*const Unknown_8375F3C[])(struct MapObject *, struct Sprite *) = {
    sub_8062F98,
    sub_8062FC4,
    sub_8063474
};

u8 (*const Unknown_8375F48[])(struct MapObject *, struct Sprite *) = {
    sub_8062FF0,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375F54[])(struct MapObject *, struct Sprite *) = {
    sub_8063028,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375F60[])(struct MapObject *, struct Sprite *) = {
    sub_8063060,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375F6C[])(struct MapObject *, struct Sprite *) = {
    sub_8063098,
    sub_8061714,
    sub_8063474
};

u8 (*const Unknown_8375F78[])(struct MapObject *, struct Sprite *) = {
    sub_8063108,
    sub_8063128,
    sub_8063474
};

u8 (*const Unknown_8375F84[])(struct MapObject *, struct Sprite *) = {
    sub_8063148,
    sub_8063168,
    sub_8063474
};

u8 (*const Unknown_8375F90[])(struct MapObject *, struct Sprite *) = {
    sub_8063188,
    sub_80631A8,
    sub_8063474
};

u8 (*const Unknown_8375F9C[])(struct MapObject *, struct Sprite *) = {
    sub_80631C8,
    sub_80631E8,
    sub_8063474
};

u8 (*const Unknown_8375FA8[])(struct MapObject *, struct Sprite *) = {
    sub_8063238,
    sub_8063258,
    sub_8063474
};

u8 (*const Unknown_8375FB4[])(struct MapObject *, struct Sprite *) = {
    sub_8063278,
    sub_8063298,
    sub_8063474
};

u8 (*const Unknown_8375FC0[])(struct MapObject *, struct Sprite *) = {
    sub_80632B8,
    sub_80632D8,
    sub_8063474
};

u8 (*const Unknown_8375FCC[])(struct MapObject *, struct Sprite *) = {
    sub_80632F8,
    sub_8063318,
    sub_8063474
};

u8 (*const Unknown_8375FD8[])(struct MapObject *, struct Sprite *) = {
    sub_8063370,
    sub_8063390,
    sub_8063474
};

u8 (*const Unknown_8375FE4[])(struct MapObject *, struct Sprite *) = {
    sub_80633B0,
    sub_80633D0,
    sub_8063474
};

u8 (*const Unknown_8375FF0[])(struct MapObject *, struct Sprite *) = {
    sub_80633F0,
    sub_8063410,
    sub_8063474
};

u8 (*const Unknown_8375FFC[])(struct MapObject *, struct Sprite *) = {
    sub_8063430,
    sub_8063450,
    sub_8063474
};
# 1890 "src/field/field_map_obj.c" 2



extern void strange_npc_table_clear(void);
extern void ClearPlayerAvatarInfo(void);
extern void npc_load_two_palettes__no_record(u16, u8);
extern void npc_load_two_palettes__and_record(u16, u8);
extern void sub_8060388(s16, s16, s16 *, s16 *);
void sub_80634D0(struct MapObject *, struct Sprite *);
extern void pal_patch_for_npc(u16, u16);
extern void CameraObjectReset1(void);

extern struct LinkPlayerMapObject gLinkPlayerMapObjects[];
extern u8 gReservedSpritePaletteCount;
extern struct Camera gCamera;

static u8 gUnknown_030005A4;
static u16 gUnknown_030005A6;

struct MapObject gMapObjects[16];

void npc_clear_ids_and_state(struct MapObject *mapObj)
{
    memset(mapObj, 0, sizeof(struct MapObject));
    mapObj->localId = 0xFF;
    mapObj->mapNum = 0xFF;
    mapObj->mapGroup = 0xFF;
    mapObj->mapobj_unk_1C = 0xFF;
}

void npcs_clear_ids_and_state(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
        npc_clear_ids_and_state(&gMapObjects[i]);
}

void sub_805AA98(void)
{
    strange_npc_table_clear();
    npcs_clear_ids_and_state();
    ClearPlayerAvatarInfo();
    sub_805AAB0();
}

void sub_805AAB0(void)
{
    u8 spriteId;

    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[21], 0, 0, 0x1F);

    gSprites[spriteId].oam.affineMode = 1;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    StartSpriteAffineAnim(&gSprites[spriteId], 0);
    gSprites[spriteId].invisible = 1;

    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[21], 0, 0, 0x1F);

    gSprites[spriteId].oam.affineMode = 1;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    StartSpriteAffineAnim(&gSprites[spriteId], 1);
    gSprites[spriteId].invisible = 1;
}

u8 sub_805AB54(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (!gMapObjects[i].active)
            break;
    }
    return i;
}

u8 GetFieldObjectIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    if (localId <= 0xFE)
        return GetFieldObjectIdByLocalIdAndMapInternal(localId, mapNum, mapGroup);
    else
        return GetFieldObjectIdByLocalId(localId);
}

bool8 TryGetFieldObjectIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup, u8 *mapObjectId)
{
    *mapObjectId = GetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup);
    if (*mapObjectId == 16)
        return 1;
    else
        return 0;
}

u8 GetFieldObjectIdByXY(s16 x, s16 y)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].coords2.x == x && gMapObjects[i].coords2.y == y)
            break;
    }
    return i;
}

u8 GetFieldObjectIdByLocalIdAndMapInternal(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].localId == localId && gMapObjects[i].mapNum == mapNum && gMapObjects[i].mapGroup == mapGroup)
            return i;
    }
    return 16;
}

u8 GetFieldObjectIdByLocalId(u8 localId)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].localId == localId)
            return i;
    }
    return 16;
}
# 2069 "src/field/field_map_obj.c"
__attribute__((naked))
u8 InitFieldObjectStateFromTemplate(struct MapObjectTemplate *template, u8 b, u8 c)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    mov r7, r9\n    mov r6, r8\n    push {r6,r7}\n    sub sp, 0x4\n    adds r5, r0, 0\n    lsls r1, 24\n    lsrs r6, r1, 24\n    lsls r2, 24\n    lsrs r7, r2, 24\n    ldrb r0, [r5]\n    adds r1, r6, 0\n    adds r2, r7, 0\n    mov r3, sp\n    bl GetAvailableFieldObjectSlot\n    lsls r0, 24\n    cmp r0, 0\n    beq _0805ACCE\n    movs r0, 0x10\n    b _0805ADC2\n_0805ACCE:\n    mov r0, sp\n    ldrb r1, [r0]\n    lsls r0, r1, 3\n    adds r0, r1\n    lsls r0, 2\n    ldr r1, _0805ADD0 @ =gMapObjects\n    adds r4, r0, r1\n    adds r0, r4, 0\n    bl npc_clear_ids_and_state\n    ldrh r3, [r5, 0x4]\n    adds r3, 0x7\n    lsls r3, 16\n    lsrs r3, 16\n    ldrh r2, [r5, 0x6]\n    adds r2, 0x7\n    lsls r2, 16\n    lsrs r2, 16\n    ldrb r0, [r4]\n    movs r1, 0x1\n    orrs r0, r1\n    movs r1, 0x4\n    orrs r0, r1\n    strb r0, [r4]\n    ldrb r0, [r5, 0x1]\n    strb r0, [r4, 0x5]\n    ldrb r0, [r5, 0x9]\n    strb r0, [r4, 0x6]\n    ldrb r0, [r5]\n    strb r0, [r4, 0x8]\n    strb r6, [r4, 0x9]\n    strb r7, [r4, 0xA]\n    strh r3, [r4, 0xC]\n    strh r2, [r4, 0xE]\n    strh r3, [r4, 0x10]\n    strh r2, [r4, 0x12]\n    strh r3, [r4, 0x14]\n    strh r2, [r4, 0x16]\n    ldrb r0, [r5, 0x8]\n    movs r7, 0xF\n    adds r1, r7, 0\n    ands r1, r0\n    ldrb r2, [r4, 0xB]\n    movs r0, 0x10\n    negs r0, r0\n    mov r8, r0\n    ands r0, r2\n    orrs r0, r1\n    strb r0, [r4, 0xB]\n    ldrb r1, [r5, 0x8]\n    lsls r1, 4\n    ands r0, r7\n    orrs r0, r1\n    strb r0, [r4, 0xB]\n    ldrb r1, [r5, 0xA]\n    lsls r1, 28\n    movs r0, 0xF\n    mov r9, r0\n    lsrs r1, 28\n    ldrb r2, [r4, 0x19]\n    mov r0, r8\n    ands r0, r2\n    orrs r0, r1\n    strb r0, [r4, 0x19]\n    ldrb r1, [r5, 0xA]\n    lsrs r1, 4\n    lsls r1, 4\n    ands r0, r7\n    orrs r0, r1\n    strb r0, [r4, 0x19]\n    ldrh r0, [r5, 0xC]\n    strb r0, [r4, 0x7]\n    ldrh r0, [r5, 0xE]\n    strb r0, [r4, 0x1D]\n    ldr r1, _0805ADD4 @ =gUnknown_0836DC09\n    ldrb r0, [r5, 0x9]\n    adds r0, r1\n    ldrb r1, [r0]\n    adds r0, r4, 0\n    adds r0, 0x20\n    strb r1, [r0]\n    ldrb r1, [r0]\n    adds r0, r4, 0\n    bl FieldObjectSetDirection\n    adds r0, r4, 0\n    bl FieldObjectHandleDynamicGraphicsId\n    ldr r1, _0805ADD8 @ =gUnknown_0836DBBC\n    ldrb r0, [r4, 0x6]\n    adds r0, r1\n    ldrb r0, [r0]\n    cmp r0, 0\n    beq _0805ADBE\n    ldrb r2, [r4, 0x19]\n    adds r0, r7, 0\n    ands r0, r2\n    cmp r0, 0\n    bne _0805ADA6\n    lsls r0, r2, 28\n    lsrs r0, 28\n    adds r0, 0x1\n    mov r1, r9\n    ands r0, r1\n    mov r1, r8\n    ands r1, r2\n    orrs r1, r0\n    strb r1, [r4, 0x19]\n_0805ADA6:\n    ldrb r2, [r4, 0x19]\n    movs r0, 0xF0\n    ands r0, r2\n    cmp r0, 0\n    bne _0805ADBE\n    lsrs r1, r2, 4\n    adds r1, 0x1\n    lsls r1, 4\n    adds r0, r7, 0\n    ands r0, r2\n    orrs r0, r1\n    strb r0, [r4, 0x19]\n_0805ADBE:\n    mov r0, sp\n    ldrb r0, [r0]\n_0805ADC2:\n    add sp, 0x4\n    pop {r3,r4}\n    mov r8, r3\n    mov r9, r4\n    pop {r4-r7}\n    pop {r1}\n    bx r1\n    .align 2, 0\n_0805ADD0: .4byte gMapObjects\n_0805ADD4: .4byte gUnknown_0836DC09\n_0805ADD8: .4byte gUnknown_0836DBBC\n    .syntax divided\n");
# 2228 "src/field/field_map_obj.c"
}


u8 sub_805ADDC(u8 localId)
{
    u8 objectCount;
    u8 i;

    if (gMapHeader.events == ((void *)0))
        return 16;
    objectCount = gMapHeader.events->mapObjectCount;
    for (i = 0; i < objectCount; i++)
    {
        struct MapObjectTemplate *template = &gSaveBlock1.mapObjectTemplates[i];

        if (template->localId == localId && !FlagGet(template->flagId))
            return InitFieldObjectStateFromTemplate(template, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
    }
    return 16;
}

u8 GetAvailableFieldObjectSlot(u16 a, u8 b, u8 c, u8 *d)
{
    u8 i = 0;

    for (i = 0; i < 16 && gMapObjects[i].active; i++)
    {
        if (gMapObjects[i].localId == a && gMapObjects[i].mapNum == b && gMapObjects[i].mapGroup == c)
            return 1;
    }
    if (i >= 16)
        return 1;
    *d = i;
    for (; i < 16; i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].localId == a && gMapObjects[i].mapNum == b && gMapObjects[i].mapGroup == c)
            return 1;
    }
    return 0;
}

void RemoveFieldObject(struct MapObject *mapObject)
{
    mapObject->active = 0;
    RemoveFieldObjectInternal(mapObject);
}

void RemoveFieldObjectByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;

    if (TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        return;
    FlagSet(GetFieldObjectFlagIdByFieldObjectId(mapObjectId));
    RemoveFieldObject(&gMapObjects[mapObjectId]);
}

void RemoveFieldObjectInternal(struct MapObject *mapObject)
{
    struct SpriteFrameImage image;
    const struct MapObjectGraphicsInfo *gfxInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);

    image.size = gfxInfo->size;
    gSprites[mapObject->spriteId].images = &image;
    DestroySprite(&gSprites[mapObject->spriteId]);
}

void npc_hide_all_but_player(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (i != gPlayerAvatar.mapObjectId)
            RemoveFieldObject(&gMapObjects[i]);
    }
}

u8 sub_805AFCC(struct MapObjectTemplate *mapObjTemplate, struct SpriteTemplate *sprTemplate, u8 c, u8 d, s16 e, s16 f)
{
    u8 mapObjectId;
    u8 spriteId;
    const struct MapObjectGraphicsInfo *gfxInfo;
    struct MapObject *mapObject;
    struct Sprite *sprite;

    mapObjectId = InitFieldObjectStateFromTemplate(mapObjTemplate, c, d);
    if (mapObjectId == 16)
        return 16;

    mapObject = &gMapObjects[mapObjectId];
    gfxInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);
    if (gfxInfo->paletteSlot == 0)
        npc_load_two_palettes__no_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    else if (gfxInfo->paletteSlot == 10)
        npc_load_two_palettes__and_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    if (mapObject->animPattern == 0x4C)
        mapObject->mapobj_bit_13 = 1;




    *(u16 *)&sprTemplate->paletteTag = 0xFFFF;

    spriteId = CreateSprite(sprTemplate, 0, 0, 0);
    if (spriteId == 64)
    {
        gMapObjects[mapObjectId].active = 0;
        return 16;
    }
    sprite = &gSprites[spriteId];
    sub_8060388(e + mapObject->coords2.x, f + mapObject->coords2.y, &sprite->pos1.x, &sprite->pos1.y);
    sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
    sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
    sprite->pos1.x += 8;
    sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    sprite->oam.paletteNum = gfxInfo->paletteSlot;
    sprite->coordOffsetEnabled = 1;
    sprite->data[0] = mapObjectId;
    mapObject->spriteId = spriteId;
    mapObject->mapobj_bit_12 = gfxInfo->inanimate;
    if (!mapObject->mapobj_bit_12)
        StartSpriteAnim(sprite, FieldObjectDirectionToImageAnimId(mapObject->mapobj_unk_18));
    SetObjectSubpriorityByZCoord(mapObject->elevation, sprite, 1);
    sub_80634D0(mapObject, sprite);
    return mapObjectId;
}

u8 SpawnFieldObject(struct MapObjectTemplate *mapObjTemplate, u8 b, u8 c, s16 d, s16 e)
{
    struct SpriteTemplate spriteTemplate;
    const struct SubspriteTable *subspriteTables = ((void *)0);
    struct SpriteFrameImage spriteFrameImage;
    const struct MapObjectGraphicsInfo *gfxInfo;
    u8 mapObjectId;

    gfxInfo = GetFieldObjectGraphicsInfo(mapObjTemplate->graphicsId);
    MakeObjectTemplateFromFieldObjectTemplate(mapObjTemplate, &spriteTemplate, &subspriteTables);
    spriteFrameImage.size = gfxInfo->size;
    spriteTemplate.images = &spriteFrameImage;
    mapObjectId = sub_805AFCC(mapObjTemplate, &spriteTemplate, b, c, d, e);
    if (mapObjectId == 16)
        return 16;
    gSprites[gMapObjects[mapObjectId].spriteId].images = gfxInfo->images;
    if (subspriteTables != ((void *)0))
        SetSubspriteTables(&gSprites[gMapObjects[mapObjectId].spriteId], subspriteTables);
    return mapObjectId;
}

u8 SpawnSpecialFieldObject(struct MapObjectTemplate *mapObjTemplate)
{
    s16 x;
    s16 y;

    GetFieldObjectMovingCameraOffset(&x, &y);
    return SpawnFieldObject(mapObjTemplate, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, x, y);
}

u8 SpawnSpecialFieldObjectParametrized(u8 a, u8 b, u8 c, s16 d, s16 e, u8 f)
{
    struct MapObjectTemplate mapObjTemplate;

    d -= 7;
    e -= 7;
    mapObjTemplate.localId = c;
    mapObjTemplate.graphicsId = a;
    mapObjTemplate.unk2 = 0;
    mapObjTemplate.x = d;
    mapObjTemplate.y = e;
    mapObjTemplate.elevation = f;
    mapObjTemplate.movementType = b;
    mapObjTemplate.unkA_0 = 0;
    mapObjTemplate.unkA_4 = 0;
    mapObjTemplate.unkC = 0;
    mapObjTemplate.unkE = 0;
    return SpawnSpecialFieldObject(&mapObjTemplate);
}

u8 show_sprite(u8 a, u8 b, u8 c)
{
    struct MapObjectTemplate *r5;
    s16 x;
    s16 y;

    r5 = GetFieldObjectTemplateByLocalIdAndMap(a, b, c);
    if (r5 == ((void *)0))
        return 16;
    GetFieldObjectMovingCameraOffset(&x, &y);
    return SpawnFieldObject(r5, b, c, x, y);
}

void MakeObjectTemplateFromFieldObjectGraphicsInfo(u16 graphicsId, void (*callback)(struct Sprite *), struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables)
{
    const struct MapObjectGraphicsInfo *gfxInfo = GetFieldObjectGraphicsInfo(graphicsId);

    sprTemplate->tileTag = gfxInfo->tileTag;
    sprTemplate->paletteTag = gfxInfo->paletteTag1;
    sprTemplate->oam = gfxInfo->oam;
    sprTemplate->anims = gfxInfo->anims;
    sprTemplate->images = gfxInfo->images;
    sprTemplate->affineAnims = gfxInfo->affineAnims;
    sprTemplate->callback = callback;
    *subspriteTables = gfxInfo->subspriteTables;
}

void MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex(u16 graphicsId, u16 callbackIndex, struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables)
{
    MakeObjectTemplateFromFieldObjectGraphicsInfo(graphicsId, gUnknown_0836DA88[callbackIndex], sprTemplate, subspriteTables);
}

void MakeObjectTemplateFromFieldObjectTemplate(struct MapObjectTemplate *mapObjTemplate, struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables)
{
    MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex(mapObjTemplate->graphicsId, mapObjTemplate->movementType, sprTemplate, subspriteTables);
}

u8 AddPseudoFieldObject(u16 graphicsId, void (*callback)(struct Sprite *), s16 c, s16 d, u8 subpriority)
{
    struct SpriteTemplate spriteTemplate;
    const struct SubspriteTable *subspriteTables;
    u8 spriteId;

    MakeObjectTemplateFromFieldObjectGraphicsInfo(graphicsId, callback, &spriteTemplate, &subspriteTables);
    if (spriteTemplate.paletteTag != 0xFFFF)
        sub_805BDF8(spriteTemplate.paletteTag);
    spriteId = CreateSprite(&spriteTemplate, c, d, subpriority);
    if (spriteId != 64 && subspriteTables != ((void *)0))
    {
        SetSubspriteTables(&gSprites[spriteId], subspriteTables);
        gSprites[spriteId].subspriteMode = 2;
    }
    return spriteId;
}

extern void sub_8064970(struct Sprite *);
extern void sub_8060470(s16 *, s16 *, s16, s16);
extern void InitObjectPriorityByZCoord();

u8 sub_805B410(u8 graphicsId, u8 b, s16 x, s16 y, u8 elevation, u8 direction)
{
    const struct MapObjectGraphicsInfo *gfxInfo;
    struct SpriteTemplate spriteTemplate;
    const struct SubspriteTable *subspriteTables;
    u8 spriteId;

    gfxInfo = GetFieldObjectGraphicsInfo(graphicsId);
    MakeObjectTemplateFromFieldObjectGraphicsInfo(graphicsId, sub_8064970, &spriteTemplate, &subspriteTables);



    *(u16 *)&spriteTemplate.paletteTag = 0xFFFF;

    x += 7;
    y += 7;
    sub_8060470(&x, &y, 8, 16);
    spriteId = CreateSpriteAtEnd(&spriteTemplate, x, y, 0);
    if (spriteId != 64)
    {
        struct Sprite *sprite = &gSprites[spriteId];

        sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
        sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
        sprite->pos1.y += sprite->centerToCornerVecY;
        sprite->oam.paletteNum = gfxInfo->paletteSlot;
        sprite->coordOffsetEnabled = 1;
        sprite->data[0] = b;
        sprite->data[1] = elevation;
        if (gfxInfo->paletteSlot == 10)
            npc_load_two_palettes__and_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
        if (subspriteTables != ((void *)0))
        {
            SetSubspriteTables(sprite, subspriteTables);
            sprite->subspriteMode = 2;
        }
        InitObjectPriorityByZCoord(sprite, elevation);
        SetObjectSubpriorityByZCoord(elevation, sprite, 1);
        StartSpriteAnim(sprite, FieldObjectDirectionToImageAnimId(direction));
    }
    return spriteId;
}

void sub_805B55C(s16 a, s16 b)
{
    u8 i;

    if (gMapHeader.events != ((void *)0))
    {
        s16 r9 = gSaveBlock1.pos.x - 2;
        s16 sp8 = gSaveBlock1.pos.x + 17;
        s16 r10 = gSaveBlock1.pos.y;
        s16 spC = gSaveBlock1.pos.y + 16;
        u8 objectCount = gMapHeader.events->mapObjectCount;

        for (i = 0; i < objectCount; i++)
        {
            struct MapObjectTemplate *template = &gSaveBlock1.mapObjectTemplates[i];
            s16 foo = template->x + 7;
            s16 bar = template->y + 7;

            if (r10 <= bar && spC >= bar && r9 <= foo && sp8 >= foo
             && !FlagGet(template->flagId))
                SpawnFieldObject(template, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, a, b);
        }
    }
}

void RemoveFieldObjectIfOutsideView(struct MapObject *mapObject);

void RemoveFieldObjectsOutsideView(void)
{
    u8 i;
    u8 j;

    for (i = 0; i < 16; i++)
    {
        bool8 isActiveLinkPlayer;

        for (j = 0, isActiveLinkPlayer = 0; j < 4; j++)
        {
            if (gLinkPlayerMapObjects[j].active && i == gLinkPlayerMapObjects[j].mapObjId)
                isActiveLinkPlayer = 1;
        }
        if (!isActiveLinkPlayer)
        {
            struct MapObject *mapObject = &gMapObjects[i];

            if (mapObject->active && !mapObject->mapobj_bit_16)
            RemoveFieldObjectIfOutsideView(mapObject);
        }
    }
}

void RemoveFieldObjectIfOutsideView(struct MapObject *mapObject)
{
    s16 r7 = gSaveBlock1.pos.x - 2;
    s16 r5 = gSaveBlock1.pos.x + 17;
    s16 r4 = gSaveBlock1.pos.y;
    s16 r6 = gSaveBlock1.pos.y + 16;

    if (mapObject->coords2.x >= r7 && mapObject->coords2.x <= r5
     && mapObject->coords2.y >= r4 && mapObject->coords2.y <= r6)
        return;
    if (mapObject->coords1.x >= r7 && mapObject->coords1.x <= r5
     && mapObject->coords1.y >= r4 && mapObject->coords1.y <= r6)
        return;
    RemoveFieldObject(mapObject);
}

void sub_805B75C(u8, s16, s16);

void sub_805B710(u16 a, u16 b)
{
    u8 i;

    ClearPlayerAvatarInfo();
    for (i = 0; i < 16; i++)
    {
        if (gMapObjects[i].active)
            sub_805B75C(i, a, b);
    }
    sub_805AAB0();
}

extern void SetPlayerAvatarFieldObjectIdAndObjectId(u8, u8);
extern void sub_805B914(struct MapObject *);

void sub_805B75C(u8 a, s16 b, s16 c)
{
    struct SpriteTemplate sp0;
    struct SpriteFrameImage sp18;
    const struct SubspriteTable *subspriteTables;
    const struct MapObjectGraphicsInfo *gfxInfo;
    struct MapObject *mapObject;
    u8 spriteId;


    for (spriteId = 0; spriteId < 4; spriteId++)
    {
        if (gLinkPlayerMapObjects[spriteId].active && a == gLinkPlayerMapObjects[spriteId].mapObjId)
            return;
    }


    mapObject = &gMapObjects[a];
    asm("":::"r5");
    subspriteTables = ((void *)0);
    gfxInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);
    sp18.size = gfxInfo->size;
    MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex(mapObject->graphicsId, mapObject->animPattern, &sp0, &subspriteTables);
    sp0.images = &sp18;
    *(u16 *)&sp0.paletteTag = 0xFFFF;
    if (gfxInfo->paletteSlot == 0)
        npc_load_two_palettes__no_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    if (gfxInfo->paletteSlot > 9)
        npc_load_two_palettes__and_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    *(u16 *)&sp0.paletteTag = 0xFFFF;
    spriteId = CreateSprite(&sp0, 0, 0, 0);
    if (spriteId != 64)
    {
        struct Sprite *sprite = &gSprites[spriteId];

        sub_8060388(b + mapObject->coords2.x, c + mapObject->coords2.y, &sprite->pos1.x, &sprite->pos1.y);
        sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
        sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
        sprite->pos1.x += 8;
        sprite->pos1.y += 16 + sprite->centerToCornerVecY;
        sprite->images = gfxInfo->images;
        if (mapObject->animPattern == 11)
        {
            SetPlayerAvatarFieldObjectIdAndObjectId(a, spriteId);
            mapObject->mapobj_unk_1B = sub_8126B54();
        }
        if (subspriteTables != ((void *)0))
            SetSubspriteTables(sprite, subspriteTables);
        sprite->oam.paletteNum = gfxInfo->paletteSlot;
        sprite->coordOffsetEnabled = 1;
        sprite->data[0] = a;
        mapObject->spriteId = spriteId;
        if (!mapObject->mapobj_bit_12 && mapObject->animPattern != 11)
            StartSpriteAnim(sprite, FieldObjectDirectionToImageAnimId(mapObject->mapobj_unk_18));
        sub_805B914(mapObject);
        SetObjectSubpriorityByZCoord(mapObject->elevation, sprite, 1);
    }
}

void sub_805B914(struct MapObject *mapObject)
{
    mapObject->mapobj_bit_1 = 0;
    mapObject->mapobj_bit_2 = 1;
    mapObject->mapobj_bit_22 = 0;
    mapObject->mapobj_bit_17 = 0;
    mapObject->mapobj_bit_18 = 0;
    mapObject->mapobj_bit_19 = 0;
    mapObject->mapobj_bit_20 = 0;
    mapObject->mapobj_bit_21 = 0;
    FieldObjectClearAnim(mapObject);
}

void SetPlayerAvatarFieldObjectIdAndObjectId(u8 mapObjectId, u8 spriteId)
{
    gPlayerAvatar.mapObjectId = mapObjectId;
    gPlayerAvatar.spriteId = spriteId;
    gPlayerAvatar.gender = GetPlayerAvatarGenderByGraphicsId(gMapObjects[mapObjectId].graphicsId);
    SetPlayerAvatarExtraStateTransition(gMapObjects[mapObjectId].graphicsId, 0x20);
}

void sub_805B980(struct MapObject *mapObject, u8 graphicsId)
{
    const struct MapObjectGraphicsInfo *gfxInfo;
    struct Sprite *sprite;

    gfxInfo = GetFieldObjectGraphicsInfo(graphicsId);
    sprite = &gSprites[mapObject->spriteId];
    if (gfxInfo->paletteSlot == 0)
        pal_patch_for_npc(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    if (gfxInfo->paletteSlot == 10)
        npc_load_two_palettes__and_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    sprite->oam.shape = gfxInfo->oam->shape;
    sprite->oam.size = gfxInfo->oam->size;
    sprite->images = gfxInfo->images;
    sprite->anims = gfxInfo->anims;
    sprite->subspriteTables = gfxInfo->subspriteTables;
    sprite->oam.paletteNum = gfxInfo->paletteSlot;
    mapObject->mapobj_bit_12 = gfxInfo->inanimate;
    mapObject->graphicsId = graphicsId;
    sub_80603CC(mapObject->coords2.x, mapObject->coords2.y, &sprite->pos1.x, &sprite->pos1.y);
    sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
    sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
    sprite->pos1.x += 8;
    sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    if (mapObject->mapobj_bit_15)
        CameraObjectReset1();
}

void unref_sub_805BA80(u8 localId, u8 mapNum, u8 mapGroup, u8 graphicsId)
{
    u8 mapObjectId;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        sub_805B980(&gMapObjects[mapObjectId], graphicsId);
}

void FieldObjectTurn(struct MapObject *mapObject, u8 direction)
{
    FieldObjectSetDirection(mapObject, direction);
    if (!mapObject->mapobj_bit_12)
    {
        StartSpriteAnim(&gSprites[mapObject->spriteId], FieldObjectDirectionToImageAnimId(mapObject->mapobj_unk_18));
        SeekSpriteAnim(&gSprites[mapObject->spriteId], 0);
    }
}

void FieldObjectTurnByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup, u8 direction)
{
    u8 mapObjectId;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        FieldObjectTurn(&gMapObjects[mapObjectId], direction);
}

void unref_TurnPlayer(struct PlayerAvatar *player, u8 direction)
{
    FieldObjectTurn(&gMapObjects[player->mapObjectId], direction);
}

void get_berry_tree_graphics(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 treeStage;
    u8 treeId;

    mapObject->mapobj_bit_13 = 1;
    sprite->invisible = 1;
    treeStage = GetStageByBerryTreeId(mapObject->trainerRange_berryTreeId);
    if (treeStage != 0)
    {
        mapObject->mapobj_bit_13 = 0;
        sprite->invisible = 0;
        treeId = GetBerryTypeByBerryTreeId(mapObject->trainerRange_berryTreeId) - 1;
        treeStage--;
        if (treeId > 0x2B)
            treeId = 0;
        sub_805B980(mapObject, gBerryTreeGraphicsIdTablePointers[treeId][treeStage]);
        sprite->images = gBerryTreePicTablePointers[treeId];
        sprite->oam.paletteNum = gBerryTreePaletteSlotTablePointers[treeId][treeStage];
        StartSpriteAnim(sprite, treeStage);
    }
}

const struct MapObjectGraphicsInfo *GetFieldObjectGraphicsInfo(u8 graphicsId)
{
    if (graphicsId > 0xEF)
        graphicsId = VarGetFieldObjectGraphicsId(graphicsId + 16);
    if (graphicsId > 0xD9)
        graphicsId = 5;
    return gMapObjectGraphicsInfoPointers[graphicsId];
}

void FieldObjectHandleDynamicGraphicsId(struct MapObject *mapObject)
{
    if (mapObject->graphicsId > 0xEF)
        mapObject->graphicsId = VarGetFieldObjectGraphicsId(mapObject->graphicsId + 16);
}

void npc_by_local_id_and_map_set_field_1_bit_x20(u8 localId, u8 mapNum, u8 mapGroup, u8 d)
{
    u8 mapObjectId;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        gMapObjects[mapObjectId].mapobj_bit_13 = d;
}

void FieldObjectGetLocalIdAndMap(struct MapObject *mapObject, void *localId, void *mapNum, void *mapGroup)
{
    *(u8 *)localId = mapObject->localId;
    *(u8 *)mapNum = mapObject->mapNum;
    *(u8 *)mapGroup = mapObject->mapGroup;
}

void sub_805BCC0(s16 x, s16 y)
{
    u8 mapObjectId;
    struct MapObject *mapObject;

    mapObjectId = GetFieldObjectIdByXY(x, y);
    if (mapObjectId != 16)
    {
        mapObject = &gMapObjects[mapObjectId];
        mapObject->mapobj_bit_2 = 1;
    }
}

void sub_805BCF0(u8 localId, u8 mapNum, u8 mapGroup, u8 subpriority)
{
    u8 mapObjectId;
    struct MapObject *mapObject;
    struct Sprite *sprite;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
    {
        mapObject = &gMapObjects[mapObjectId];
        sprite = &gSprites[mapObject->spriteId];
        mapObject->mapobj_bit_26 = 1;
        sprite->subpriority = subpriority;
    }
}

void sub_805BD48(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;
    struct MapObject *mapObject;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
    {
        mapObject = &gMapObjects[mapObjectId];
        mapObject->mapobj_bit_26 = 0;
        mapObject->mapobj_bit_2 = 1;
    }
}

void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y)
{
    u8 mapObjectId;
    struct Sprite *sprite;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
    {
        sprite = &gSprites[gMapObjects[mapObjectId].spriteId];
        sprite->pos2.x = x;
        sprite->pos2.y = y;
    }
}

void gpu_pal_allocator_reset__manage_upper_four(void)
{
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 12;
}

void sub_805BDF8(u16 tag)
{
    u16 paletteIndex = FindFieldObjectPaletteIndexByTag(tag);

    if (paletteIndex != 0x11FF)
        sub_805BE58(&gUnknown_0837377C[paletteIndex]);
}

void unref_sub_805BE24(u16 *arr)
{
    u8 i;

    for (i = 0; arr[i] != 0x11FF; i++)
        sub_805BDF8(arr[i]);
}

u8 sub_805BE58(const struct SpritePalette *palette)
{
    if (IndexOfSpritePaletteTag(palette->tag) != 0xFF)
        return 0xFF;
    else
        return LoadSpritePalette(palette);
}

void pal_patch_for_npc(u16 a, u16 b)
{
    u8 var = b;
    u8 paletteIndex = FindFieldObjectPaletteIndexByTag(a);

    LoadPalette(gUnknown_0837377C[paletteIndex].data, var * 16 + 0x100, 0x20);
}

void pal_patch_for_npc_range(const u16 *arr, u8 b, u8 c)
{
    for (; b < c; arr++, b++)
        pal_patch_for_npc(*arr, b);
}

u8 FindFieldObjectPaletteIndexByTag(u16 tag)
{
    u8 i;

    for (i = 0; gUnknown_0837377C[i].tag != 0x11FF; i++)
    {
        if (gUnknown_0837377C[i].tag == tag)
            return i;
    }
    return 0xFF;
}

void npc_load_two_palettes__no_record(u16 a, u8 b)
{
    u8 i;

    pal_patch_for_npc(a, b);
    for (i = 0; gUnknown_08373874[i].tag != 0x11FF; i++)
    {
        if (gUnknown_08373874[i].tag == a)
        {
            pal_patch_for_npc(gUnknown_08373874[i].data[gUnknown_030005A4], gUnknown_0830FD14[b]);
            break;
        }
    }
}

void npc_load_two_palettes__and_record(u16 a, u8 b)
{
    u8 i;

    gUnknown_030005A6 = a;
    pal_patch_for_npc(a, b);
    for (i = 0; gUnknown_083738E4[i].tag != 0x11FF; i++)
    {
        if (gUnknown_083738E4[i].tag == a)
        {
            pal_patch_for_npc(gUnknown_083738E4[i].data[gUnknown_030005A4], gUnknown_0830FD14[b]);
            break;
        }
    }
}

void unref_sub_805C014(struct MapObject *mapObject, s16 x, s16 y)
{
    mapObject->coords3.x = mapObject->coords2.x;
    mapObject->coords3.y = mapObject->coords2.y;
    mapObject->coords2.x += x;
    mapObject->coords2.y += y;
}

void npc_coords_shift(struct MapObject *mapObject, s16 x, s16 y)
{
    mapObject->coords3.x = mapObject->coords2.x;
    mapObject->coords3.y = mapObject->coords2.y;
    mapObject->coords2.x = x;
    mapObject->coords2.y = y;
}

void npc_coords_set(struct MapObject *mapObject, s16 x, s16 y)
{
    mapObject->coords3.x = x;
    mapObject->coords3.y = y;
    mapObject->coords2.x = x;
    mapObject->coords2.y = y;
}

void sub_805C058(struct MapObject *mapObject, s16 x, s16 y)
{
    struct Sprite *sprite = &gSprites[mapObject->spriteId];
    const struct MapObjectGraphicsInfo *gfxInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);

    npc_coords_set(mapObject, x, y);
    sub_80603CC(mapObject->coords2.x, mapObject->coords2.y, &sprite->pos1.x, &sprite->pos1.y);
    sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
    sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
    sprite->pos1.x += 8;
    sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    sub_805B914(mapObject);
    if (mapObject->mapobj_bit_15)
        CameraObjectReset1();
}

void sub_805C0F8(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y)
{
    u8 mapObjectId;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
    {
        x += 7;
        y += 7;
        sub_805C058(&gMapObjects[mapObjectId], x, y);
    }
}

void npc_coords_shift_still(struct MapObject *mapObject)
{
    npc_coords_shift(mapObject, mapObject->coords2.x, mapObject->coords2.y);
}

void UpdateFieldObjectCoordsForCameraUpdate(void)
{
    u8 i;
    s16 deltaX;
    s16 deltaY;

    if (gCamera.field_0)
    {
        deltaX = gCamera.x;
        deltaY = gCamera.y;
        for (i = 0; i < 16; i++)
        {

            if (gMapObjects[i].active)
            {
                gMapObjects[i].coords1.x -= deltaX;
                gMapObjects[i].coords1.y -= deltaY;
                gMapObjects[i].coords2.x -= deltaX;
                gMapObjects[i].coords2.y -= deltaY;
                gMapObjects[i].coords3.x -= deltaX;
                gMapObjects[i].coords3.y -= deltaY;
            }
        }
    }
}

bool8 FieldObjectDoesZCoordMatch(struct MapObject *, u8);

u8 GetFieldObjectIdByXYZ(u16 x, u16 y, u8 z)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].coords2.x == x && gMapObjects[i].coords2.y == y
         && FieldObjectDoesZCoordMatch(&gMapObjects[i], z))
            return i;
    }
    return 16;
}

bool8 FieldObjectDoesZCoordMatch(struct MapObject *mapObject, u8 z)
{
    if (mapObject->mapobj_unk_0B_0 != 0 && z != 0
     && mapObject->mapobj_unk_0B_0 != z)
        return 0;
    else
        return 1;
}

void UpdateFieldObjectsForCameraUpdate(s16 x, s16 y)
{
    UpdateFieldObjectCoordsForCameraUpdate();
    sub_805B55C(x, y);
    RemoveFieldObjectsOutsideView();
}

u8 AddCameraObject(u8 a)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_830FD24, 0, 0, 4);

    gSprites[spriteId].invisible = 1;
    gSprites[spriteId].data[0] = a;
    return spriteId;
}

void ObjectCB_CameraObject(struct Sprite *sprite)
{
    void (*cameraObjectFuncs[3])(struct Sprite *);
    memcpy(cameraObjectFuncs, gCameraObjectFuncs, sizeof gCameraObjectFuncs);
    cameraObjectFuncs[sprite->data[1]](sprite);
}

void CameraObject_0(struct Sprite *sprite)
{
    sprite->pos1.x = gSprites[sprite->data[0]].pos1.x;
    sprite->pos1.y = gSprites[sprite->data[0]].pos1.y;
    sprite->invisible = 1;
    sprite->data[1] = 1;
    CameraObject_1(sprite);
}

void CameraObject_1(struct Sprite *sprite)
{
    s16 x = gSprites[sprite->data[0]].pos1.x;
    s16 y = gSprites[sprite->data[0]].pos1.y;

    sprite->data[2] = x - sprite->pos1.x;
    sprite->data[3] = y - sprite->pos1.y;
    sprite->pos1.x = x;
    sprite->pos1.y = y;
}

void CameraObject_2(struct Sprite *sprite)
{
    sprite->pos1.x = gSprites[sprite->data[0]].pos1.x;
    sprite->pos1.y = gSprites[sprite->data[0]].pos1.y;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
}

struct Sprite *FindCameraObject(void)
{
    u8 i;

    for (i = 0; i < 64; i++)
    {
        if (gSprites[i].inUse && gSprites[i].callback == ObjectCB_CameraObject)
            return &gSprites[i];
    }
    return ((void *)0);
}

void CameraObjectReset1(void)
{
    struct Sprite *cameraSprite = FindCameraObject();

    if (cameraSprite != ((void *)0))
    {
        cameraSprite->data[1] = 0;
        cameraSprite->callback(cameraSprite);
    }
}

void CameraObjectSetFollowedObjectId(u8 spriteId)
{
    struct Sprite *cameraSprite = FindCameraObject();

    if (cameraSprite != ((void *)0))
    {
        cameraSprite->data[0] = spriteId;
        CameraObjectReset1();
    }
}

u8 CameraObjectGetFollowedObjectId(void)
{
    struct Sprite *cameraSprite = FindCameraObject();

    if (cameraSprite == ((void *)0))
        return 64;
    else
        return cameraSprite->data[0];
}

void CameraObjectReset2(void)
{
    struct Sprite *cameraSprite = FindCameraObject();

    cameraSprite->data[1] = 2;
}

u8 unref_sub_805C43C(struct Sprite *src, s16 x, s16 y, u8 subpriority)
{
    u8 i;

    for (i = 0; i < 64; i++)
    {
        if (!gSprites[i].inUse)
        {
            gSprites[i] = *src;
            gSprites[i].pos1.x = x;
            gSprites[i].pos1.y = y;
            gSprites[i].subpriority = subpriority;
            break;
        }
    }
    return i;
}

u8 obj_unfreeze(struct Sprite *src, s16 x, s16 y, u8 subpriority)
{
    s16 i;

    for (i = 63; i > -1; i--)
    {
        if (!gSprites[i].inUse)
        {
            gSprites[i] = *src;
            gSprites[i].pos1.x = x;
            gSprites[i].pos1.y = y;
            gSprites[i].subpriority = subpriority;
            return i;
        }
    }
    return 64;
}

void FieldObjectSetDirection(struct MapObject *mapObject, u8 direction)
{
    mapObject->mapobj_unk_20 = mapObject->mapobj_unk_18;
    if (!mapObject->mapobj_bit_9)
    {
        s8 _direction = direction;
        mapObject->mapobj_unk_18 = _direction;
    }
    mapObject->placeholder18 = direction;
}

u8 *GetFieldObjectScriptPointerByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    struct MapObjectTemplate *template = GetFieldObjectTemplateByLocalIdAndMap(localId, mapNum, mapGroup);

    return template->script;
}

u8 *GetFieldObjectScriptPointerByFieldObjectId(u8 mapObjectId)
{
    return GetFieldObjectScriptPointerByLocalIdAndMap(gMapObjects[mapObjectId].localId, gMapObjects[mapObjectId].mapNum, gMapObjects[mapObjectId].mapGroup);
}

u16 GetFieldObjectFlagIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    struct MapObjectTemplate *template = GetFieldObjectTemplateByLocalIdAndMap(localId, mapNum, mapGroup);

    return template->flagId;
}

u16 GetFieldObjectFlagIdByFieldObjectId(u8 mapObjectId)
{
    return GetFieldObjectFlagIdByLocalIdAndMap(gMapObjects[mapObjectId].localId, gMapObjects[mapObjectId].mapNum, gMapObjects[mapObjectId].mapGroup);
}

u8 unref_sub_805C5D0(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;

    if (TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        return 0xFF;
    else
        return gMapObjects[mapObjectId].trainerType;
}

u8 unref_sub_805C60C(u8 mapObjectId)
{
    return gMapObjects[mapObjectId].trainerType;
}

u8 unref_sub_805C624(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;

    if (TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        return 0xFF;
    else
        return gMapObjects[mapObjectId].trainerRange_berryTreeId;
}

u8 FieldObjectGetBerryTreeId(u8 mapObjectId)
{
    return gMapObjects[mapObjectId].trainerRange_berryTreeId;
}

struct MapObjectTemplate *FindFieldObjectTemplateInArrayByLocalId(u8, struct MapObjectTemplate *, u8);

struct MapObjectTemplate *GetFieldObjectTemplateByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    if (gSaveBlock1.location.mapNum == mapNum && gSaveBlock1.location.mapGroup == mapGroup)
        return FindFieldObjectTemplateInArrayByLocalId(localId, gSaveBlock1.mapObjectTemplates, gMapHeader.events->mapObjectCount);
    else
    {
        struct MapHeader *mapHeader = Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum);

        return FindFieldObjectTemplateInArrayByLocalId(localId, mapHeader->events->mapObjects, mapHeader->events->mapObjectCount);
    }
}

struct MapObjectTemplate *FindFieldObjectTemplateInArrayByLocalId(u8 localId, struct MapObjectTemplate *templates, u8 count)
{
    u8 i;

    for (i = 0; i < count; i++)
    {
        if (templates[i].localId == localId)
            return &templates[i];
    }
    return ((void *)0);
}

struct MapObjectTemplate *sub_805C700(struct MapObject *mapObject)
{
    s32 i;

    if (mapObject->mapNum != gSaveBlock1.location.mapNum
     || mapObject->mapGroup != gSaveBlock1.location.mapGroup)
        return ((void *)0);

    for (i = 0; i < 64; i++)
    {
        if (mapObject->localId == gSaveBlock1.mapObjectTemplates[i].localId)
            return &gSaveBlock1.mapObjectTemplates[i];
    }
    return ((void *)0);
}

void sub_805C754(struct MapObject *mapObject)
{
    struct MapObjectTemplate *template = sub_805C700(mapObject);

    if (template != ((void *)0))
    {
        template->x = mapObject->coords2.x - 7;
        template->y = mapObject->coords2.y - 7;
    }
}

void sub_805C774(struct MapObject *mapObject, u8 movementType)
{
    struct MapObjectTemplate *template = sub_805C700(mapObject);

    if (template != ((void *)0))
        template->movementType = movementType;
}

void sub_805C78C(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        sub_805C754(&gMapObjects[mapObjectId]);
}

void sub_805C7C4(u8 a)
{
    gpu_pal_allocator_reset__manage_upper_four();
    gUnknown_030005A6 = 0x11FF;
    gUnknown_030005A4 = a;
    pal_patch_for_npc_range(gUnknown_0837399C[gUnknown_030005A4], 0, 10);
}

u16 npc_paltag_by_palslot(u8 a)
{
    u8 i;

    if (a < 10)
        return gUnknown_0837399C[gUnknown_030005A4][a];

    for (i = 0; gUnknown_083738E4[i].tag != 0x11FF; i++)
    {
        if (gUnknown_083738E4[i].tag == gUnknown_030005A6)
        {
            return gUnknown_083738E4[i].data[gUnknown_030005A4];
        }
    }
    return 0x11FF;
}

static u8 sub_805C8A8(struct MapObject *, struct Sprite *);void sub_805C884(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805C8A8);}static u8 sub_805C8A8(struct MapObject *mapObject, struct Sprite *sprite){ return 0;};
static u8 sub_805C8D0(struct MapObject *, struct Sprite *);void sub_805C8AC(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805C8D0);}static u8 sub_805C8D0(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375224[sprite->data[1]](mapObject, sprite);};

u8 sub_805C8F0(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

extern void FieldObjectSetRegularAnim(struct MapObject *, struct Sprite *, u8);

u8 sub_805C904(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

extern u8 FieldObjectExecRegularAnim(struct MapObject *, struct Sprite *);
extern void sub_8064820(struct Sprite *, s16);

u8 sub_805C930(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) == 0)
    {
        return 0;
    }
    sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
    sprite->data[1] = 3;
    return 1;
}

extern u8 sub_8064824(struct Sprite *);

u8 sub_805C96C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) != 0)
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

extern u8 sub_805FF20(struct MapObject *, u8);

u8 sub_805C98C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_08375240, 4);
    direction = directions[Random() & 3];
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 5;
    if (sub_805FF20(mapObject, direction) != 0)
    {
        sprite->data[1] = 1;
    }
    return 1;
}

u8 sub_805C9D8(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetGoSpeed0AnimId(mapObject->placeholder18));
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 6;
    return 1;
}

u8 sub_805CA08(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) != 0)
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

u8 FieldObjectIsTrainerAndCloseToPlayer(struct MapObject *mapObject)
{
    s16 x;
    s16 y;
    s16 objx;
    s16 objy;
    s16 minx;
    s16 maxx;
    s16 miny;
    s16 maxy;
    if (TestPlayerAvatarFlags((1 << 7)) == 0)
    {
        return 0;
    }
    if (mapObject->trainerType != 1 && mapObject->trainerType != 3)
    {
        return 0;
    }
    PlayerGetDestCoords(&x, &y);
    objx = mapObject->coords2.x;
    objy = mapObject->coords2.y;
    minx = objx - mapObject->trainerRange_berryTreeId;
    miny = objy - mapObject->trainerRange_berryTreeId;
    maxx = objx + mapObject->trainerRange_berryTreeId;
    maxy = objy + mapObject->trainerRange_berryTreeId;
    if (minx > x || maxx < x || miny > y || maxy < y)
    {
        return 0;
    }
    return 1;
}

u8 sub_805CAAC(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    if (a2 > a3)
    {
        dirn = DIR_EAST;
        if (a0 < 0)
        {
            dirn = DIR_WEST;
        }
    }
    else
    {
        dirn = DIR_SOUTH;
        if (a1 < 0)
        {
            dirn = DIR_NORTH;
        }
    }
    return dirn;
}

u8 sub_805CADC(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = DIR_SOUTH;
    if (a1 < 0)
    {
        dirn = DIR_NORTH;
    }
    return dirn;
}

u8 sub_805CAEC(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = DIR_EAST;
    if (a0 < 0)
    {
        dirn = DIR_WEST;
    }
    return dirn;
}

u8 sub_805CB00(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_SOUTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
        if (dirn == DIR_EAST)
        {
            dirn = DIR_NORTH;
        }
    }
    else if (dirn == DIR_EAST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
        if (dirn == DIR_SOUTH)
        {
            dirn = DIR_NORTH;
        }
    }
    return dirn;
}

u8 sub_805CB5C(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_SOUTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
        if (dirn == DIR_WEST)
        {
            dirn = DIR_NORTH;
        }
    }
    else if (dirn == DIR_WEST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
        if (dirn == DIR_SOUTH)
        {
            dirn = DIR_NORTH;
        }
    }
    return dirn;
}

u8 sub_805CBB8(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_NORTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
        if (dirn == DIR_EAST)
        {
            dirn = DIR_SOUTH;
        }
    }
    else if (dirn == DIR_EAST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
        if (dirn == DIR_NORTH)
        {
            dirn = DIR_SOUTH;
        }
    }
    return dirn;
}

u8 sub_805CC14(s16 a0, s16 a1, s16 a2, s16 a3) {
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_NORTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
        if (dirn == DIR_WEST)
        {
            dirn = DIR_SOUTH;
        }
    }
    else if (dirn == DIR_WEST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
        if (dirn == DIR_NORTH)
        {
            dirn = DIR_SOUTH;
        }
    }
    return dirn;
}

u8 sub_805CC70(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_EAST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
    }
    return dirn;
}

u8 sub_805CCAC(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_WEST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
    }
    return dirn;
}

u8 sub_805CCE8(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_SOUTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
    }
    return dirn;
}

u8 sub_805CD24(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_NORTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
    }
    return dirn;
}

u8 sub_805CD60(struct MapObject *mapObject, u8 a1)
{
    s16 x;
    s16 y;
    s16 x2;
    s16 y2;
    if (!FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        return 0;
    }
    PlayerGetDestCoords(&x, &y);
    x -= mapObject->coords2.x;
    y -= mapObject->coords2.y;
    x2 = x;
    y2 = y;
    if (x2 < 0)
    {
        x2 = -x2;
    }
    if (y2 < 0)
    {
        y2 = -y2;
    }
    return gUnknown_08375244[a1](x, y, x2, y2);
}

static u8 sub_805CE0c(struct MapObject *, struct Sprite *);void sub_805CDE8(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805CE0c);}static u8 sub_805CE0c(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375270[sprite->data[1]](mapObject, sprite);};

u8 sub_805CE2C(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805CE40(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805CE6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) != 0)
    {
        sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805CEB0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805CEE0(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_08375240, 4);
    direction = sub_805CD60(mapObject, 0);
    if (direction == 0)
    {
        direction = directions[Random() & 3];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805CF4C(struct MapObject *, struct Sprite *);void sub_805CF28(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805CF4C);}static u8 sub_805CF4C(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375284[sprite->data[1]](mapObject, sprite);};

u8 sub_805CF6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805CF80(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805CFAC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) == 0)
    {
        return 0;
    }
    sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
    sprite->data[1] = 3;
    return 1;
}

u8 sub_805CFE8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) != 0)
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D008(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_083752A0, 2);
    direction = directions[Random() & 1];
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 5;
    if (sub_805FF20(mapObject, direction) != 0)
    {
        sprite->data[1] = 1;
    }
    return 1;
}

u8 sub_805D054(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetGoSpeed0AnimId(mapObject->placeholder18));
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 6;
    return 1;
}

u8 sub_805D084(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) != 0)
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

static u8 sub_805D0D0(struct MapObject *, struct Sprite *);void sub_805D0AC(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805D0D0);}static u8 sub_805D0D0(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083752A4[sprite->data[1]](mapObject, sprite);};

u8 sub_805D0F0(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805D104(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805D130(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) == 0)
    {
        return 0;
    }
    sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
    sprite->data[1] = 3;
    return 1;
}

u8 sub_805D16C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) != 0)
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D18C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_083752C0, 2);
    direction = directions[Random() & 1];
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 5;
    if (sub_805FF20(mapObject, direction) != 0)
    {
        sprite->data[1] = 1;
    }
    return 1;
}

u8 sub_805D1D8(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetGoSpeed0AnimId(mapObject->placeholder18));
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 6;
    return 1;
}

u8 sub_805D208(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) != 0)
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

static u8 sub_805D254(struct MapObject *, struct Sprite *);void sub_805D230(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805D254);}static u8 sub_805D254(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083752C4[sprite->data[1]](mapObject, sprite);};

u8 sub_805D274(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805D2A0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) != 0)
    {
        sprite->data[1] = 2;
        return 1;
    }
    return 0;
}

u8 sub_805D2C0(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_1 = 0;
    return 0;
}

u8 sub_805D314(struct MapObject *mapObject, struct Sprite *sprite);

void FieldObjectCB_BerryTree(struct Sprite *sprite)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[sprite->data[0]];
    if (!(sprite->data[7] & 1))
    {
        get_berry_tree_graphics(mapObject, sprite);
        sprite->data[7] |= 1;
    }
    meta_step(mapObject, sprite, sub_805D314);
}

u8 sub_805D314(struct MapObject *mapObject, struct Sprite *sprite)
{
    return gUnknown_083752D0[sprite->data[1]](mapObject, sprite);
}

u8 do_berry_tree_growth_sparkle_1(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 berryTreeStage;
    npc_reset(mapObject, sprite);
    mapObject->mapobj_bit_13 = 1;
    sprite->invisible = 1;
    berryTreeStage = GetStageByBerryTreeId(mapObject->trainerRange_berryTreeId);
    if (!berryTreeStage)
    {
        if (!(sprite->data[7] & 4) && sprite->animNum == 4)
        {
            gFieldEffectArguments[0] = mapObject->coords2.x;
            gFieldEffectArguments[1] = mapObject->coords2.y;
            gFieldEffectArguments[2] = sprite->subpriority - 1;
            gFieldEffectArguments[3] = sprite->oam.priority;
            FieldEffectStart(FLDEFF_BERRY_TREE_GROWTH_SPARKLE);
            sprite->animNum = 0;
        }
        return 0;
    }
    mapObject->mapobj_bit_13 = 0;
    sprite->invisible = 0;
    berryTreeStage--;
    if (sprite->animNum != berryTreeStage)
    {
        sprite->data[1] = 2;
        return 1;
    }
    get_berry_tree_graphics(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, 0x39);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805D3EC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sprite->data[1] = 0;
        return 1;
    }
    return 0;
}

u8 do_berry_tree_growth_sparkle_2(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 3;
    sprite->data[2] = 0;
    sprite->data[7] |= 2;
    gFieldEffectArguments[0] = mapObject->coords2.x;
    gFieldEffectArguments[1] = mapObject->coords2.y;
    gFieldEffectArguments[2] = sprite->subpriority - 1;
    gFieldEffectArguments[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_BERRY_TREE_GROWTH_SPARKLE);
    return 1;
}

u8 sub_805D458(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->data[2]++;
    mapObject->mapobj_bit_13 = ((sprite->data[2] & 0x2) >> 1);
    sprite->animPaused = 1;
    if (sprite->data[2] > 64)
    {
        get_berry_tree_graphics(mapObject, sprite);
        sprite->data[1] = 4;
        sprite->data[2] = 0;
        return 1;
    }
    return 0;
}

u8 sub_805D4A8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->data[2]++;
    mapObject->mapobj_bit_13 = ((sprite->data[2] & 0x2) >> 1);
    sprite->animPaused = 1;
    if (sprite->data[2] > 64)
    {
        sprite->data[1] = 0;
        sprite->data[7] &= (-3);
        return 1;
    }
    return 0;
}

static u8 sub_805D518(struct MapObject *, struct Sprite *);void sub_805D4F4(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805D518);}static u8 sub_805D518(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083752E4[sprite->data[1]](mapObject, sprite);};

u8 sub_805D538(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805D54C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805D578(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805D5BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D5EC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_083752A0, 2);
    direction = sub_805CD60(mapObject, 1);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805D658(struct MapObject *, struct Sprite *);void sub_805D634(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805D658);}static u8 sub_805D658(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083752F8[sprite->data[1]](mapObject, sprite);};

u8 sub_805D678(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805D68C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805D6B8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805D6FC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D72C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_083752C0, 2);
    direction = sub_805CD60(mapObject, 2);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805D798(struct MapObject *, struct Sprite *);void sub_805D774(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805D798);}static u8 sub_805D798(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_0837530C[sprite->data[1]](mapObject, sprite);};

u8 sub_805D7B8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805D7CC(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805D7F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805D83C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D86C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_08375320, 2);
    direction = sub_805CD60(mapObject, 3);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805D8D8(struct MapObject *, struct Sprite *);void sub_805D8B4(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805D8D8);}static u8 sub_805D8D8(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375324[sprite->data[1]](mapObject, sprite);};

u8 sub_805D8F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805D90C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805D938(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805D97C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D9AC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_08375338, 2);
    direction = sub_805CD60(mapObject, 4);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805DA18(struct MapObject *, struct Sprite *);void sub_805D9F4(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805DA18);}static u8 sub_805DA18(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_0837533C[sprite->data[1]](mapObject, sprite);};

u8 sub_805DA38(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805DA4C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805DA78(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805DABC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805DAEC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_08375350, 2);
    direction = sub_805CD60(mapObject, 5);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805DB58(struct MapObject *, struct Sprite *);void sub_805DB34(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805DB58);}static u8 sub_805DB58(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375354[sprite->data[1]](mapObject, sprite);};

u8 sub_805DB78(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805DB8C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805DBB8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805DBFC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805DC2C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_08375368, 2);
    direction = sub_805CD60(mapObject, 6);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805DC98(struct MapObject *, struct Sprite *);void sub_805DC74(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805DC98);}static u8 sub_805DC98(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_0837536C[sprite->data[1]](mapObject, sprite);};

u8 sub_805DCB8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805DCCC(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805DCF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805DD3C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805DD6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_08375380, 4);
    direction = sub_805CD60(mapObject, 7);
    if (direction == 0)
    {
        direction = directions[Random() & 3];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805DDD8(struct MapObject *, struct Sprite *);void sub_805DDB4(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805DDD8);}static u8 sub_805DDD8(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375384[sprite->data[1]](mapObject, sprite);};

u8 sub_805DDF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805DE0C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805DE38(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805DE7C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805DEAC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_08375398, 4);
    direction = sub_805CD60(mapObject, 8);
    if (direction == 0)
    {
        direction = directions[Random() & 3];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805DF18(struct MapObject *, struct Sprite *);void sub_805DEF4(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805DF18);}static u8 sub_805DF18(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_0837539C[sprite->data[1]](mapObject, sprite);};

u8 sub_805DF38(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805DF4C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805DF78(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805DFBC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805DFEC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_083753B0, 4);
    direction = sub_805CD60(mapObject, 9);
    if (direction == 0)
    {
        direction = directions[Random() & 3];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805E058(struct MapObject *, struct Sprite *);void sub_805E034(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805E058);}static u8 sub_805E058(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083753B4[sprite->data[1]](mapObject, sprite);};

u8 sub_805E078(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805E08C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805E0B8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805E0FC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 4;
        return 1;
    }
    return 0;
}

u8 sub_805E12C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_083753C8, 4);
    direction = sub_805CD60(mapObject, 10);
    if (direction == 0)
    {
        direction = directions[Random() & 3];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805E198(struct MapObject *, struct Sprite *);void sub_805E174(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805E198);}static u8 sub_805E198(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083753CC[sprite->data[1]](mapObject, sprite);};

u8 sub_805E1B8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805E1E4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, 0x30);
        sprite->data[1] = 2;
    }
    return 0;
}

u8 sub_805E208(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805E234(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[5];
    memcpy(directions, gUnknown_083753DC, 5);
    direction = sub_805CD60(mapObject, 0);
    if (direction == 0)
    {
        direction = directions[mapObject->mapobj_unk_18];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 0;
    return 1;
}

static u8 sub_803E29C(struct MapObject *, struct Sprite *);void sub_805E278(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_803E29C);}static u8 sub_803E29C(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083753E4[sprite->data[1]](mapObject, sprite);};

u8 sub_805E2BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805E2E8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, 0x30);
        sprite->data[1] = 2;
    }
    return 0;
}

u8 sub_805E30C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data[1] = 3;
    }
    return 0;
}

u8 sub_805E338(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[5];
    memcpy(directions, gUnknown_083753F4, 5);
    direction = sub_805CD60(mapObject, 0);
    if (direction == 0)
    {
        direction = directions[mapObject->mapobj_unk_18];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 0;
    return 1;
}

static u8 sub_805E3A0(struct MapObject *, struct Sprite *);void sub_805E37C(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805E3A0);}static u8 sub_805E3A0(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083753FC[sprite->data[1]](mapObject, sprite);};

u8 sub_805E3C0(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805E3D4(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    direction = gUnknown_0836DC09[mapObject->animPattern];
    if (mapObject->mapobj_unk_21 != 0)
    {
        direction = GetOppositeDirection(direction);
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805E40C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 v0;
    u8 goSpeed0AnimId;
    if (mapObject->mapobj_unk_21 && mapObject->coords1.x == mapObject->coords2.x && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 0;
        FieldObjectSetDirection(mapObject, GetOppositeDirection(mapObject->placeholder18));
    }
    v0 = sub_805FF20(mapObject, mapObject->placeholder18);
    goSpeed0AnimId = GetGoSpeed0AnimId(mapObject->placeholder18);
    if (v0 == 1)
    {
        mapObject->mapobj_unk_21 ++;
        FieldObjectSetDirection(mapObject, GetOppositeDirection(mapObject->placeholder18));
        goSpeed0AnimId = GetGoSpeed0AnimId(mapObject->placeholder18);
        v0 = sub_805FF20(mapObject, mapObject->placeholder18);
    }
    if (v0 != 0)
    {
        goSpeed0AnimId = GetStepInPlaceDelay16AnimId(mapObject->mapobj_unk_18);
    }
    FieldObjectSetRegularAnim(mapObject, sprite, goSpeed0AnimId);
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 3;
    return 1;
}

u8 sub_805E4C4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

u8 sub_805E4EC(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data[1] = 1;
    return 1;
}

u8 MoveFieldObjectInNextDirectionInSequence(struct MapObject *mapObject, struct Sprite *sprite, u8 *directionSequence)
{
    u8 v0;
    u8 goSpeed0AnimId;
    if (mapObject->mapobj_unk_21 == 3 && mapObject->coords1.x == mapObject->coords2.x && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 0;
    }
    FieldObjectSetDirection(mapObject, directionSequence[mapObject->mapobj_unk_21]);
    goSpeed0AnimId = GetGoSpeed0AnimId(mapObject->placeholder18);
    v0 = sub_805FF20(mapObject, mapObject->placeholder18);
    if (v0 == 1)
    {
        mapObject->mapobj_unk_21 ++;
        FieldObjectSetDirection(mapObject, directionSequence[mapObject->mapobj_unk_21]);
        goSpeed0AnimId = GetGoSpeed0AnimId(mapObject->placeholder18);
        v0 = sub_805FF20(mapObject, mapObject->placeholder18);
    }
    if (v0 != 0)
    {
        goSpeed0AnimId = GetStepInPlaceDelay16AnimId(mapObject->mapobj_unk_18);
    }
    FieldObjectSetRegularAnim(mapObject, sprite, goSpeed0AnimId);
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 2;
    return 1;
}

u8 sub_805E5B4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

static u8 sub_805E600(struct MapObject *, struct Sprite *);void sub_805E5DC(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805E600);}static u8 sub_805E600(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_0837540C[sprite->data[1]](mapObject, sprite);};

u8 sub_805E620(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375418, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805E68C(struct MapObject *, struct Sprite *);void sub_805E668(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805E68C);}static u8 sub_805E68C(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_0837541C[sprite->data[1]](mapObject, sprite);};

u8 sub_805E6AC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375428, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805E718(struct MapObject *, struct Sprite *);void sub_805E6F4(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805E718);}static u8 sub_805E718(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_0837542C[sprite->data[1]](mapObject, sprite);};

u8 sub_805E738(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375438, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805E7A4(struct MapObject *, struct Sprite *);void sub_805E780(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805E7A4);}static u8 sub_805E7A4(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_0837543C[sprite->data[1]](mapObject, sprite);};

u8 sub_805E7C4(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375448, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}



static u8 sub_805E830(struct MapObject *, struct Sprite *);void sub_805E80C(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805E830);}static u8 sub_805E830(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_0837544C[sprite->data[1]](mapObject, sprite);};

u8 sub_805E850(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375458, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805E8BC(struct MapObject *, struct Sprite *);void sub_805E898(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805E8BC);}static u8 sub_805E8BC(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_0837545C[sprite->data[1]](mapObject, sprite);};

u8 sub_805E8DC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375468, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805E948(struct MapObject *, struct Sprite *);void sub_805E924(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805E948);}static u8 sub_805E948(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_0837546C[sprite->data[1]](mapObject, sprite);};

u8 sub_805E968(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375240, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805E9D4(struct MapObject *, struct Sprite *);void sub_805E9B0(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805E9D4);}static u8 sub_805E9D4(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375478[sprite->data[1]](mapObject, sprite);};

u8 sub_805E9F4(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375484, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805EA60(struct MapObject *, struct Sprite *);void sub_805EA3C(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805EA60);}static u8 sub_805EA60(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375488[sprite->data[1]](mapObject, sprite);};

u8 sub_805EA80(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375494, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805EAEC(struct MapObject *, struct Sprite *);void sub_805EAC8(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805EAEC);}static u8 sub_805EAEC(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375498[sprite->data[1]](mapObject, sprite);};

u8 sub_805EB0C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754A4, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805EB78(struct MapObject *, struct Sprite *);void sub_805EB54(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805EB78);}static u8 sub_805EB78(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083754A8[sprite->data[1]](mapObject, sprite);};

u8 sub_805EB98(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754B4, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805EC04(struct MapObject *, struct Sprite *);void sub_805EBE0(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805EC04);}static u8 sub_805EC04(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083754B8[sprite->data[1]](mapObject, sprite);};

u8 sub_805EC24(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754C4, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805EC90(struct MapObject *, struct Sprite *);void sub_805EC6C(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805EC90);}static u8 sub_805EC90(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083754C8[sprite->data[1]](mapObject, sprite);};

u8 sub_805ECB0(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754D4, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805ED1C(struct MapObject *, struct Sprite *);void sub_805ECF8(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805ED1C);}static u8 sub_805ED1C(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083754D8[sprite->data[1]](mapObject, sprite);};

u8 sub_805ED3C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754E4, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805EDA8(struct MapObject *, struct Sprite *);void sub_805ED84(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805EDA8);}static u8 sub_805EDA8(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083754E8[sprite->data[1]](mapObject, sprite);};

u8 sub_805EDC8(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754F4, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805EE34(struct MapObject *, struct Sprite *);void sub_805EE10(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805EE34);}static u8 sub_805EE34(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083754F8[sprite->data[1]](mapObject, sprite);};

u8 sub_805EE54(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375504, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805EEC0(struct MapObject *, struct Sprite *);void sub_805EE9C(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805EEC0);}static u8 sub_805EEC0(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375508[sprite->data[1]](mapObject, sprite);};

u8 sub_805EEE0(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375514, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805EF4C(struct MapObject *, struct Sprite *);void sub_805EF28(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805EF4C);}static u8 sub_805EF4C(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375518[sprite->data[1]](mapObject, sprite);};

u8 sub_805EF6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375524, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805EFD8(struct MapObject *, struct Sprite *);void sub_805EFB4(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805EFD8);}static u8 sub_805EFD8(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375528[sprite->data[1]](mapObject, sprite);};

u8 sub_805EFF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375534, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805F064(struct MapObject *, struct Sprite *);void sub_805F040(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805F064);}static u8 sub_805F064(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375538[sprite->data[1]](mapObject, sprite);};

u8 sub_805F084(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375544, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805F0F0(struct MapObject *, struct Sprite *);void sub_805F0CC(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805F0F0);}static u8 sub_805F0F0(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375548[sprite->data[1]](mapObject, sprite);};

u8 sub_805F110(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375554, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805F17C(struct MapObject *, struct Sprite *);void sub_805F158(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805F17C);}static u8 sub_805F17C(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375558[sprite->data[1]](mapObject, sprite);};

u8 sub_805F19C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375564, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805F208(struct MapObject *, struct Sprite *);void sub_805F1E4(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805F208);}static u8 sub_805F208(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375568[sprite->data[1]](mapObject, sprite);};

u8 sub_805F228(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375574, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

static u8 sub_805F294(struct MapObject *, struct Sprite *);void sub_805F270(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805F294);}static u8 sub_805F294(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375578[sprite->data[1]](mapObject, sprite);};

u8 sub_805F2B4(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375584, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
};

static u8 sub_805F320(struct MapObject *, struct Sprite *);void sub_805F2FC(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805F320);}static u8 sub_805F320(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_08375588[sprite->data[1]](mapObject, sprite);};

u8 mss_npc_reset_oampriv3_1_unk2_unk3(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    if (mapObject->mapobj_unk_21 == 0)
    {
        mapObject->mapobj_unk_21 = player_get_direction_lower_nybble();
    }
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805F364(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1C == 0xFF || gPlayerAvatar.tileTransitionState == T_TILE_CENTER)
    {
        return 0;
    }
    return gUnknown_08375594[player_get_x22()](mapObject, sprite, player_get_direction_upper_nybble(), ((void *)0));
}

u8 sub_805F3C4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data[1] = 1;
    }
    return 0;
}

bool8 sub_805F3EC(struct MapObject *mapObject, struct Sprite *sprite, u8 a2, bool8 a3(u8))
{
    return 0;
}

bool8 sub_805F3F0(struct MapObject *mapObject, struct Sprite *sprite, u8 a2, bool8 a3(u8))
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(state_to_direction(gUnknown_0836DC09[mapObject->animPattern], mapObject->mapobj_unk_21, a2)));
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 2;
    return 1;
}

bool8 sub_805F438(struct MapObject *mapObject, struct Sprite *sprite, u8 a2, bool8 a3(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = a2;
    direction = state_to_direction(gUnknown_0836DC09[mapObject->animPattern], mapObject->mapobj_unk_21, direction);
    FieldObjectMoveDestCoords(mapObject, direction, &x, &y);
    FieldObjectSetRegularAnim(mapObject, sprite, GetGoSpeed0AnimId(direction));
    if (npc_block_way(mapObject, x, y, direction) || (a3 != ((void *)0) && !a3(MapGridGetMetatileBehaviorAt(x, y))))
    {
        FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(direction));
    }
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 2;
    return 1;
}

bool8 sub_805F4F0(struct MapObject *mapObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCB(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = state_to_direction(gUnknown_0836DC09[mapObject->animPattern], mapObject->mapobj_unk_21, direction);
    FieldObjectMoveDestCoords(mapObject, direction, &x, &y);
    FieldObjectSetRegularAnim(mapObject, sprite, sub_8060744(direction));
    if (npc_block_way(mapObject, x, y, direction) || (tileCB != ((void *)0) && !tileCB(MapGridGetMetatileBehaviorAt(x, y))))
    {
        FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(direction));
    }
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 2;
    return 1;
}

bool8 sub_805F5A8(struct MapObject *mapObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCB(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = state_to_direction(gUnknown_0836DC09[mapObject->animPattern], mapObject->mapobj_unk_21, direction);
    FieldObjectMoveDestCoords(mapObject, direction, &x, &y);
    FieldObjectSetRegularAnim(mapObject, sprite, sub_806079C(direction));
    if (npc_block_way(mapObject, x, y, direction) || (tileCB != ((void *)0) && !tileCB(MapGridGetMetatileBehaviorAt(x, y))))
    {
        FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(direction));
    }
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 2;
    return 1;
}

bool8 sub_805F660(struct MapObject *mapObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCB(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = state_to_direction(gUnknown_0836DC09[mapObject->animPattern], mapObject->mapobj_unk_21, direction);
    FieldObjectMoveDestCoords(mapObject, direction, &x, &y);
    FieldObjectSetRegularAnim(mapObject, sprite, sub_80607C8(direction));
    if (npc_block_way(mapObject, x, y, direction) || (tileCB != ((void *)0) && !tileCB(MapGridGetMetatileBehaviorAt(x, y))))
    {
        FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(direction));
    }
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 2;
    return 1;
}

bool8 cph_IM_DIFFERENT(struct MapObject *mapObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCB(u8))
{
    u32 direction;

    direction = playerDirection;
    direction = state_to_direction(gUnknown_0836DC09[mapObject->animPattern], mapObject->mapobj_unk_21, direction);
    FieldObjectSetRegularAnim(mapObject, sprite, sub_806084C(direction));
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 2;
    return 1;
}

bool8 sub_805F760(struct MapObject *mapObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCB(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = state_to_direction(gUnknown_0836DC09[mapObject->animPattern], mapObject->mapobj_unk_21, direction);
    FieldObjectMoveDestCoords(mapObject, direction, &x, &y);
    FieldObjectSetRegularAnim(mapObject, sprite, sub_80608A4(direction));
    if (npc_block_way(mapObject, x, y, direction) || (tileCB != ((void *)0) && !tileCB(MapGridGetMetatileBehaviorAt(x, y))))
    {
        FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(direction));
    }
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 2;
    return 1;
}

bool8 oac_hopping(struct MapObject *mapObject, struct Sprite *sprite, u8 playerDirection, bool8 tileCB(u8))
{
    u32 direction;
    s16 x;
    s16 y;

    direction = playerDirection;
    direction = state_to_direction(gUnknown_0836DC09[mapObject->animPattern], mapObject->mapobj_unk_21, direction);
    x = mapObject->coords2.x;
    y = mapObject->coords2.y;
    sub_8060320(direction, &x, &y, 2, 2);
    FieldObjectSetRegularAnim(mapObject, sprite, GetJumpLedgeAnimId(direction));
    if (npc_block_way(mapObject, x, y, direction) || (tileCB != ((void *)0) && !tileCB(MapGridGetMetatileBehaviorAt(x, y))))
    {
        FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(direction));
    }
    mapObject->mapobj_bit_1 = 1;
    sprite->data[1] = 2;
    return 1;
}

static u8 sub_805F904(struct MapObject *, struct Sprite *);void sub_805F8E0(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805F904);}static u8 sub_805F904(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083755C0[sprite->data[1]](mapObject, sprite);};

u8 mss_08062EA4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1C == 0xFF || gPlayerAvatar.tileTransitionState == T_TILE_CENTER)
    {
        return 0;
    }
    return gUnknown_08375594[player_get_x22()](mapObject, sprite, player_get_direction_upper_nybble(), MetatileBehavior_IsPokeGrass);
}

u8 sub_805F9F8(struct MapObject *, struct Sprite *);

void FieldObjectCB_TreeDisguise(struct Sprite *sprite)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[sprite->data[0]];
    if (mapObject->mapobj_unk_21 == 0 || (mapObject->mapobj_unk_21 == 1 && sprite->data[7] == 0))
    {
        FieldObjectGetLocalIdAndMap(mapObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
        mapObject->mapobj_unk_1A = FieldEffectStart(FLDEFF_TREE_DISGUISE);
        mapObject->mapobj_unk_21 = 1;
        sprite->data[7] ++;
    }
    meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805F9F8);
}

u8 sub_805F9F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    return 0;
}

void FieldObjectCB_MountainDisguise(struct Sprite *sprite)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[sprite->data[0]];
    if (mapObject->mapobj_unk_21 == 0 || (mapObject->mapobj_unk_21 == 1 && sprite->data[7] == 0))
    {
        FieldObjectGetLocalIdAndMap(mapObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
        mapObject->mapobj_unk_1A = FieldEffectStart(FLDEFF_MOUNTAIN_DISGUISE);
        mapObject->mapobj_unk_21 = 1;
        sprite->data[7] ++;
    }
    meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805F9F8);
}

u8 sub_805FAD8(struct MapObject *mapObject, struct Sprite *sprite);

void FieldObjectCB_Hidden1(struct Sprite *sprite)
{
    if (sprite->data[7] == 0)
    {
        gMapObjects[sprite->data[0]].mapobj_bit_26 = 1;
        sprite->subspriteMode = 2;
        sprite->oam.priority = 3;
        sprite->data[7] ++;
    }
    meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805FAD8);
}

u8 sub_805FAD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    return gUnknown_083755CC[sprite->data[1]](mapObject, sprite);
}

u8 sub_805FAF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    return 0;
}

u8 sub_805FB04(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sprite->data[1] = 0;
    }
    return 0;
}

static u8 sub_805FB44(struct MapObject *, struct Sprite *);void sub_805FB20(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805FB44);}static u8 sub_805FB44(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083755D0[sprite->data[1]](mapObject, sprite);};

u8 sub_805FB64(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetStepInPlaceDelay16AnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805FBB4(struct MapObject *, struct Sprite *);void sub_805FB90(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805FBB4);}static u8 sub_805FBB4(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083755D8[sprite->data[1]](mapObject, sprite);};

u8 sub_805FBD4(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetStepInPlaceDelay8AnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805FC24(struct MapObject *, struct Sprite *);void sub_805FC00(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805FC24);}static u8 sub_805FC24(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083755E0[sprite->data[1]](mapObject, sprite);};

u8 sub_805FC44(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetStepInPlaceDelay4AnimId(mapObject->mapobj_unk_18));
    sprite->data[1] = 1;
    return 1;
}

static u8 sub_805FC94(struct MapObject *, struct Sprite *);void sub_805FC70(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_805FC94);}static u8 sub_805FC94(struct MapObject *mapObject, struct Sprite *sprite){ return gUnknown_083755E8[sprite->data[1]](mapObject, sprite);};

u8 sub_805FCB4(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    mapObject->mapobj_bit_13 = 1;
    sprite->data[1] = 1;
    return 1;
}

u8 sub_805FCE8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sprite->data[1] = 2;
        return 1;
    }
    return 0;
}

u8 sub_805FD08(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_1 = 0;
    return 0;
}

void sub_805FC70(struct Sprite *sprite);

void npc_reset(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_1 = 0;
    mapObject->mapobj_bit_6 = 0;
    mapObject->mapobj_bit_7 = 0;
    mapObject->mapobj_unk_1C = 0xff;
    sprite->data[1] = 0;
}

u8 FieldObjectDirectionToImageAnimId(u8 direction)
{
    return gUnknown_083755F4[direction];
}

u8 get_go_image_anim_num(u8 direction)
{
    return gUnknown_083755FD[direction];
}

u8 get_go_fast_image_anim_num(u8 direction)
{
    return gUnknown_08375606[direction];
}

u8 get_go_faster_image_anim_num(u8 direction)
{
    return gUnknown_0837560F[direction];
}

u8 sub_805FD78(u8 direction)
{
    return gUnknown_08375618[direction];
}

u8 sub_805FD88(u8 direction)
{
    return gUnknown_08375621[direction];
}

u8 sub_805FD98(u8 direction)
{
    return gUnknown_0837562A[direction];
}

u8 unref_sub_805FDA8(u8 direction)
{
    return gUnknown_08375633[direction];
}

u8 sub_805FDB8(u8 direction)
{
    return gUnknown_0837563C[direction];
}

u8 sub_805FDC8(u8 direction)
{
    return gUnknown_08375645[direction];
}

u8 sub_805FDD8(u8 direction)
{
    return gUnknown_0837564E[direction];
}

u8 sub_805FDE8(u8 direction)
{
    return gUnknown_08375657[direction];
}

u8 sub_805FDF8(u8 direction)
{
    return gUnknown_08375660[direction];
}

u8 sub_805FE08(u8 direction)
{
    return gUnknown_08375669[direction];
}

u8 get_run_image_anim_num(u8 direction)
{
    return gUnknown_08375672[direction];
}

void sub_805FE28(struct MapObject *mapObject, struct Sprite *sprite, u8 animNum)
{
    if (!mapObject->mapobj_bit_12)
    {
        sprite->animNum = animNum;
        if (sprite->animCmdIndex == 1)
        {
            sprite->animCmdIndex = 2;
        } else if (sprite->animCmdIndex == 3)
        {
            sprite->animCmdIndex = 0;
        }
        SeekSpriteAnim(sprite, sprite->animCmdIndex);
    }
}

void sub_805FE64(struct MapObject *mapObject, struct Sprite *sprite, u8 animNum)
{
    u8 animCmdIndex;
    if (!mapObject->mapobj_bit_12)
    {
        sprite->animNum = animNum;
        animCmdIndex = 3;
        if (sprite->animCmdIndex < 2)
        {
            animCmdIndex = 1;
        }
        SeekSpriteAnim(sprite, animCmdIndex);
    }
}

u8 sub_805FE90(s16 a0, s16 a1, s16 a2, s16 a3)
{
    if (a0 > a2)
    {
        return DIR_WEST;
    } else if (a0 < a2)
    {
        return DIR_EAST;
    } else if (a1 > a3)
    {
        return DIR_NORTH;
    } else
    {
        return DIR_SOUTH;
    }
}

void npc_set_running_behaviour_etc(struct MapObject *mapObject, u8 animPattern)
{
    mapObject->animPattern = animPattern;
    mapObject->mapobj_unk_21 = 0;
    mapObject->animId = 0;
    gSprites[mapObject->spriteId].callback = gUnknown_0836DA88[animPattern];
    gSprites[mapObject->spriteId].data[1] = 0;
}

u8 npc_running_behaviour_by_direction(u8 direction)
{
    return gUnknown_0837567B[direction];
}

u8 sub_805FF20(struct MapObject *mapObject, u8 direction)
{
    s16 x;
    s16 y;
    x = mapObject->coords2.x;
    y = mapObject->coords2.y;
    MoveCoords(direction, &x, &y);
    return npc_block_way(mapObject, x, y, direction);
}

bool8 IsCoordOutsideFieldObjectMovementRect(struct MapObject2 *mapObject, s16 x, s16 y);
static bool8 DoesObjectCollideWithObjectAt(struct MapObject *mapObject, s16 x, s16 y);
bool8 IsMetatileDirectionallyImpassable(struct MapObject *mapObject, s16 x, s16 y, u8 direction);

u8 npc_block_way(struct MapObject *mapObject, s16 x, s16 y, u32 dirn)
{
    u8 direction;
    direction = dirn;
    if (IsCoordOutsideFieldObjectMovementRect((struct MapObject2 *)mapObject, x, y))
        return 1;
    else if (MapGridIsImpassableAt(x, y) || GetMapBorderIdAt(x, y) == -1 || IsMetatileDirectionallyImpassable(mapObject, x, y, direction))
        return 2;
    else if (mapObject->mapobj_bit_15 && !CanCameraMoveInDirection(direction))
        return 2;
    else if (IsZCoordMismatchAt(mapObject->mapobj_unk_0B_0, x, y))
        return 3;
    else if (DoesObjectCollideWithObjectAt(mapObject, x, y))
        return 4;
    return 0;
}

u8 sub_8060024(struct MapObject *mapObject, s16 x, s16 y, u8 direction)
{
    u8 flags = 0;

    if (IsCoordOutsideFieldObjectMovementRect((struct MapObject2 *)mapObject, x, y))
        flags |= 1;
    if (MapGridIsImpassableAt(x, y) || GetMapBorderIdAt(x, y) == -1 || IsMetatileDirectionallyImpassable(mapObject, x, y, direction) || (mapObject->mapobj_bit_15 && !CanCameraMoveInDirection(direction)))
        flags |= 2;
    if (IsZCoordMismatchAt(mapObject->mapobj_unk_0B_0, x, y))
        flags |= 4;
    if (DoesObjectCollideWithObjectAt(mapObject, x, y))
        flags |= 8;
    return flags;
}

bool8 IsCoordOutsideFieldObjectMovementRect(struct MapObject2 *mapObject, s16 x, s16 y)
{
    s16 minv;
    s16 maxv;

    if (mapObject->mapobj_unk_19 != 0)
    {
        minv = mapObject->coords1.x - (mapObject->mapobj_unk_19);
        maxv = mapObject->coords1.x + (mapObject->mapobj_unk_19);
        if (minv > x || maxv < x)
            return 1;
    }
    if (mapObject->mapobj_unk_19b != 0)
    {
        minv = mapObject->coords1.y - (mapObject->mapobj_unk_19b);
        maxv = mapObject->coords1.y + (mapObject->mapobj_unk_19b);
        if (minv > y || maxv < y)
            return 1;
    }
    return 0;
}

bool8 IsMetatileDirectionallyImpassable(struct MapObject *mapObject, s16 x, s16 y, u8 direction)
{
    if (gUnknown_08375684[direction - 1](mapObject->mapobj_unk_1E) || gUnknown_08375694[direction - 1](MapGridGetMetatileBehaviorAt(x, y)))
    {
        return 1;
    }
    return 0;
}

static bool8 DoesObjectCollideWithObjectAt(struct MapObject *mapObject, s16 x, s16 y)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        struct MapObject *mapObject2 = &gMapObjects[i];

        if (mapObject2->active && mapObject2 != mapObject)
        {
            if (((mapObject2->coords2.x == x && mapObject2->coords2.y == y) || (mapObject2->coords3.x == x && mapObject2->coords3.y == y))
             && AreZCoordsCompatible(mapObject->mapobj_unk_0B_0, mapObject2->mapobj_unk_0B_0))
                return 1;
        }
    }
    return 0;
}


bool8 IsBerryTreeSparkling(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        if (gSprites[gMapObjects[mapObjectId].spriteId].data[7] & 2)
            return 1;

    return 0;
}

void sub_8060288(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;
    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
    {
        gSprites[gMapObjects[mapObjectId].spriteId].data[7] |= 4;
    }
}

void MoveCoords(u8 direction, s16 *x, s16 *y)
{
    *x += gDirectionToVector[direction].x;
    *y += gDirectionToVector[direction].y;
}

void unref_sub_80602F8(u8 direction, s16 *x, s16 *y)
{
    *x += gDirectionToVector[direction].x << 4;
    *y += gDirectionToVector[direction].y << 4;
}

void sub_8060320(u32 dirn, s16 *x, s16 *y, s16 deltaX, s16 deltaY)
{
    u8 direction = dirn;
    s16 dx2 = deltaX;
    s16 dy2 = deltaY;
    if (gDirectionToVector[direction].x > 0)
    {
        *x += dx2;
    }
    if (gDirectionToVector[direction].x < 0)
    {
        *x -= dx2;
    }
    if (gDirectionToVector[direction].y > 0)
    {
        *y += dy2;
    }
    if (gDirectionToVector[direction].y < 0)
    {
        *y -= dy2;
    }
}

void sub_8060388(s16 x1, s16 y1, s16 *x2, s16 *y2)
{
    *x2 = (x1 - gSaveBlock1.pos.x) << 4;
    *y2 = (y1 - gSaveBlock1.pos.y) << 4;
    *x2 -= gUnknown_0300489C;
    *y2 -= gUnknown_03004898;
}

void sub_80603CC(s16 x1, s16 y1, s16 *x2, s16 *y2)
{
    s16 x3;
    s16 y3;
    x3 = -gUnknown_0300489C - gUnknown_03004880.unk10;
    y3 = -gUnknown_03004898 - gUnknown_03004880.unk14;
    if (gUnknown_03004880.unk10 > 0)
    {
        x3 += 0x10;
    }
    if (gUnknown_03004880.unk10 < 0)
    {
        x3 -= 0x10;
    }
    if (gUnknown_03004880.unk14 > 0)
    {
        y3 += 0x10;
    }
    if (gUnknown_03004880.unk14 < 0)
    {
        y3 -= 0x10;
    }
    *x2 = ((x1 - gSaveBlock1.pos.x) << 4) + x3;
    *y2 = ((y1 - gSaveBlock1.pos.y) << 4) + y3;
}

void sub_8060470(s16 *x, s16 *y, s16 dx, s16 dy)
{
    sub_80603CC(*x, *y, x, y);
    *x += dx;
    *y += dy;
}

void GetFieldObjectMovingCameraOffset(s16 *x, s16 *y)
{
    *x = 0;
    *y = 0;
    if (gUnknown_03004880.unk10 > 0)
    {
        (*x)++;
    }
    if (gUnknown_03004880.unk10 < 0)
    {
        (*x)--;
    }
    if (gUnknown_03004880.unk14 > 0)
    {
        (*y)++;
    }
    if (gUnknown_03004880.unk14 < 0)
    {
        (*y)--;
    }
}

void FieldObjectMoveDestCoords(struct MapObject *mapObject, u32 direction, s16 *x, s16 *y)
{
    u8 newDirn = direction;
    *x = mapObject->coords2.x;
    *y = mapObject->coords2.y;
    MoveCoords(newDirn, x, y);
}

bool8 FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(struct MapObject *mapObject)
{
    if (mapObject->mapobj_bit_1 || mapObject->mapobj_bit_6)
    {
        return 1;
    }
    return 0;
}

bool8 FieldObjectIsSpecialAnimActive(struct MapObject *mapObject)
{
    if (mapObject->mapobj_bit_6 && mapObject->mapobj_unk_1C != 0xff)
    {
        return 1;
    }
    return 0;
}

bool8 FieldObjectSetSpecialAnim(struct MapObject *mapObject, u8 specialAnimId)
{
    if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject))
    {
        return 1;
    }
    UnfreezeMapObject(mapObject);
    mapObject->mapobj_unk_1C = specialAnimId;
    mapObject->mapobj_bit_6 = 1;
    mapObject->mapobj_bit_7 = 0;
    gSprites[mapObject->spriteId].data[2] = 0;
    return 0;
}

void FieldObjectForceSetSpecialAnim(struct MapObject *mapObject, u8 specialAnimId)
{
    FieldObjectClearAnimIfSpecialAnimActive(mapObject);
    FieldObjectSetSpecialAnim(mapObject, specialAnimId);
}

void FieldObjectClearAnimIfSpecialAnimActive(struct MapObject *mapObject)
{
    if (mapObject->mapobj_bit_6)
    {
        FieldObjectClearAnim(mapObject);
    }
}

void FieldObjectClearAnim(struct MapObject *mapObject)
{
    mapObject->mapobj_unk_1C = 0xFF;
    mapObject->mapobj_bit_6 = 0;
    mapObject->mapobj_bit_7 = 0;
    gSprites[mapObject->spriteId].data[1] = 0;
    gSprites[mapObject->spriteId].data[2] = 0;
}

bool8 FieldObjectCheckIfSpecialAnimFinishedOrInactive(struct MapObject *mapObject)
{
    if (mapObject->mapobj_bit_6)
        return mapObject->mapobj_bit_7;
    return 0x10;
}

bool8 FieldObjectClearAnimIfSpecialAnimFinished(struct MapObject *mapObject)
{
    u8 specialAnimStatus;
    specialAnimStatus = FieldObjectCheckIfSpecialAnimFinishedOrInactive(mapObject);
    if (specialAnimStatus != 0 && specialAnimStatus != 0x10)
    {
        FieldObjectClearAnimIfSpecialAnimActive(mapObject);
    }
    return specialAnimStatus;
}

u8 FieldObjectGetSpecialAnim(struct MapObject *mapObject)
{
    if (mapObject->mapobj_bit_6)
    {
        return mapObject->mapobj_unk_1C;
    }
    return 0xFF;
}

extern void DoGroundEffects_OnSpawn(struct MapObject *mapObject, struct Sprite *sprite);
extern void DoGroundEffects_OnBeginStep(struct MapObject *mapObject, struct Sprite *sprite);
extern void DoGroundEffects_OnFinishStep(struct MapObject *mapObject, struct Sprite *sprite);
void npc_obj_transfer_image_anim_pause_flag(struct MapObject *mapObject, struct Sprite *sprite);
void sub_80634A0(struct MapObject *mapObject, struct Sprite *sprite);
void FieldObjectExecSpecialAnim(struct MapObject *mapObject, struct Sprite *sprite);
void FieldObjectUpdateSubpriority(struct MapObject *mapObject, struct Sprite *sprite);

void meta_step(struct MapObject *mapObject, struct Sprite *sprite, u8 (*callback)(struct MapObject *, struct Sprite *))
{
    DoGroundEffects_OnSpawn(mapObject, sprite);
    sub_80634A0(mapObject, sprite);
    if (FieldObjectIsSpecialAnimActive(mapObject))
    {
        FieldObjectExecSpecialAnim(mapObject, sprite);
    } else
    {
        if (!mapObject->mapobj_bit_8)
        {
            while (callback(mapObject, sprite));
        }
    }
    DoGroundEffects_OnBeginStep(mapObject, sprite);
    DoGroundEffects_OnFinishStep(mapObject, sprite);
    npc_obj_transfer_image_anim_pause_flag(mapObject, sprite);
    sub_80634D0(mapObject, sprite);
    FieldObjectUpdateSubpriority(mapObject, sprite);
}
# 5801 "src/field/field_map_obj.c"
u8 GetFaceDirectionAnimId(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756C8)]; direction = idx; memcpy(animIds, (gUnknown_083756C8), sizeof(gUnknown_083756C8)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 GetSimpleGoAnimId(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756CD)]; direction = idx; memcpy(animIds, (gUnknown_083756CD), sizeof(gUnknown_083756CD)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 GetGoSpeed0AnimId(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756D2)]; direction = idx; memcpy(animIds, (gUnknown_083756D2), sizeof(gUnknown_083756D2)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 sub_8060744(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756D7)]; direction = idx; memcpy(animIds, (gUnknown_083756D7), sizeof(gUnknown_083756D7)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 d2s_08064034(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756DC)]; direction = idx; memcpy(animIds, (gUnknown_083756DC), sizeof(gUnknown_083756DC)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 sub_806079C(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756E1)]; direction = idx; memcpy(animIds, (gUnknown_083756E1), sizeof(gUnknown_083756E1)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 sub_80607C8(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756E6)]; direction = idx; memcpy(animIds, (gUnknown_083756E6), sizeof(gUnknown_083756E6)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 sub_80607F4(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756EB)]; direction = idx; memcpy(animIds, (gUnknown_083756EB), sizeof(gUnknown_083756EB)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 GetJumpLedgeAnimId(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756F0)]; direction = idx; memcpy(animIds, (gUnknown_083756F0), sizeof(gUnknown_083756F0)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 sub_806084C(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756F5)]; direction = idx; memcpy(animIds, (gUnknown_083756F5), sizeof(gUnknown_083756F5)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 sub_8060878(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756FA)]; direction = idx; memcpy(animIds, (gUnknown_083756FA), sizeof(gUnknown_083756FA)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 sub_80608A4(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_083756FF)]; direction = idx; memcpy(animIds, (gUnknown_083756FF), sizeof(gUnknown_083756FF)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 sub_80608D0(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_08375704)]; direction = idx; memcpy(animIds, (gUnknown_08375704), sizeof(gUnknown_08375704)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 GetStepInPlaceDelay32AnimId(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_08375709)]; direction = idx; memcpy(animIds, (gUnknown_08375709), sizeof(gUnknown_08375709)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 GetStepInPlaceDelay16AnimId(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_0837570E)]; direction = idx; memcpy(animIds, (gUnknown_0837570E), sizeof(gUnknown_0837570E)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 GetStepInPlaceDelay8AnimId(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_08375713)]; direction = idx; memcpy(animIds, (gUnknown_08375713), sizeof(gUnknown_08375713)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}
u8 GetStepInPlaceDelay4AnimId(u32 idx){ u8 direction; u8 animIds[sizeof(gUnknown_08375718)]; direction = idx; memcpy(animIds, (gUnknown_08375718), sizeof(gUnknown_08375718)); if (direction > DIR_EAST) direction = 0; return animIds[direction];}

u8 FieldObjectFaceOppositeDirection(struct MapObject *mapObject, u8 direction)
{
    return FieldObjectSetSpecialAnim(mapObject, GetFaceDirectionAnimId(GetOppositeDirection(direction)));
}

u8 sub_80609D8(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_0837571D, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 sub_8060A04(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375722, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 sub_8060A30(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375727, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 sub_8060A5C(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_0837572C, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 sub_8060A88(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375731, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 sub_8060AB4(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375736, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 sub_8060AE0(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_0837573B, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 sub_8060B0C(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375740, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 sub_8060B38(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375745, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 sub_8060B64(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_0837574A, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 GetOppositeDirection(u8 direction)
{
    u8 directions[8];
    memcpy(directions, gUnknown_0837574F, 8);
    if (direction == 0 || direction > 8)
    {
        return direction;
    }
    return directions[direction - 1];
}

u32 zffu_offset_calc(u8 a0, u8 a1)
{
    return gUnknown_08375757[a0 - 1][a1 - 1];
}

u32 state_to_direction(u8 a0, u32 a1, u32 a2)
{
    u32 zffuOffset;
    u8 a1_2 = a1;
    u8 a2_2 = a2;
    if (a1_2 == 0 || a2_2 == 0 || a1_2 > DIR_EAST || a2_2 > DIR_EAST)
    {
        return 0;
    }
    zffuOffset = zffu_offset_calc(a1_2, a2);
    return gUnknown_08375767[a0 - 1][zffuOffset - 1];
}

void FieldObjectExecSpecialAnim(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (gUnknown_08375778[mapObject->mapobj_unk_1C][sprite->data[2]](mapObject, sprite))
    {
        mapObject->mapobj_bit_7 = 1;
    }
}

bool8 FieldObjectExecRegularAnim(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (gUnknown_08375778[mapObject->mapobj_unk_1C][sprite->data[2]](mapObject, sprite))
    {
        mapObject->mapobj_unk_1C = 0xFF;
        sprite->data[2] = 0;
        return 1;
    }
    return 0;
}

void FieldObjectSetRegularAnim(struct MapObject *mapObject, struct Sprite *sprite, u8 animId)
{
    mapObject->mapobj_unk_1C = animId;
    sprite->data[2] = 0;
}

void an_look_any(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    FieldObjectSetDirection(mapObject, direction);
    npc_coords_shift_still(mapObject);
    sub_805FE64(mapObject, sprite, get_go_image_anim_num(mapObject->mapobj_unk_18));
    sprite->animPaused = 1;
    sprite->data[2] = 1;
}

u8 sub_8060CE0(struct MapObject *mapObject, struct Sprite *sprite)
{
    an_look_any(mapObject, sprite, DIR_SOUTH);
    return 1;
}

u8 sub_8060CF0(struct MapObject *mapObject, struct Sprite *sprite)
{
    an_look_any(mapObject, sprite, DIR_NORTH);
    return 1;
}

u8 sub_8060D00(struct MapObject *mapObject, struct Sprite *sprite)
{
    an_look_any(mapObject, sprite, DIR_WEST);
    return 1;
}

u8 sub_8060D10(struct MapObject *mapObject, struct Sprite *sprite)
{
    an_look_any(mapObject, sprite, DIR_EAST);
    return 1;
}

void sub_8060D20(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    s16 x;
    s16 y;
    x = mapObject->coords2.x;
    y = mapObject->coords2.y;
    FieldObjectSetDirection(mapObject, direction);
    MoveCoords(direction, &x, &y);
    npc_coords_shift(mapObject, x, y);
    oamt_npc_ministep_reset(sprite, direction, a3);
    sprite->animPaused = 0;
    mapObject->mapobj_bit_2 = 1;
    sprite->data[2] = 1;
}

extern u8 (*const gUnknown_083759C0[5])(u8);

void do_go_anim(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    u8 (*const functions[5])(u8);
    memcpy((void *)functions, gUnknown_083759C0, sizeof(gUnknown_083759C0));
    sub_8060D20(mapObject, sprite, direction, a3);
    sub_805FE28(mapObject, sprite, functions[a3](mapObject->mapobj_unk_18));
}

void do_run_anim(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    sub_8060D20(mapObject, sprite, direction, 1);
    sub_805FE28(mapObject, sprite, get_run_image_anim_num(mapObject->mapobj_unk_18));
}

bool8 obj_npc_ministep(struct Sprite *);

bool8 npc_obj_ministep_stop_on_arrival(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (obj_npc_ministep(sprite))
    {
        npc_coords_shift_still(mapObject);
        mapObject->mapobj_bit_3 = 1;
        sprite->animPaused = 1;
        return 1;
    }
    return 0;
}

void sub_8060E68(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    s16 x;
    s16 y;
    x = mapObject->coords2.x;
    y = mapObject->coords2.y;
    FieldObjectSetDirection(mapObject, direction);
    MoveCoords(direction, &x, &y);
    npc_coords_shift(mapObject, x, y);
    sub_806467C(sprite, direction);
    sprite->animPaused = 0;
    mapObject->mapobj_bit_2 = 1;
    sprite->data[2] = 1;
}

void sub_8060ED8(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    sub_8060E68(mapObject, sprite, direction);
    sub_805FE28(mapObject, sprite, get_go_image_anim_num(mapObject->mapobj_unk_18));
}

bool8 an_walk_any_2(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_806468C(sprite))
    {
        npc_coords_shift_still(mapObject);
        mapObject->mapobj_bit_3 = 1;
        sprite->animPaused = 1;
        return 1;
    }
    return 0;
}

bool8 sub_8060F5C(struct MapObject *, struct Sprite *);

bool8 sub_8060F3C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_SOUTH);
    return sub_8060F5C(mapObject, sprite);
}

bool8 sub_8060F5C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8060F9C(struct MapObject *, struct Sprite *);

bool8 sub_8060F7C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_NORTH);
    return sub_8060F9C(mapObject, sprite);
}

bool8 sub_8060F9C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8060FDC(struct MapObject *, struct Sprite *);

bool8 sub_8060FBC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_WEST);
    return sub_8060FDC(mapObject, sprite);
}

bool8 sub_8060FDC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_806101C(struct MapObject *, struct Sprite *);

bool8 sub_8060FFC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_EAST);
    return sub_806101C(mapObject, sprite);
}

bool8 sub_806101C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_806105C(struct MapObject *, struct Sprite *);

bool8 sub_806103C(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_SOUTH, 0);
    return sub_806105C(mapObject, sprite);
}

bool8 sub_806105C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_806109C(struct MapObject *, struct Sprite *);

bool8 sub_806107C(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_NORTH, 0);
    return sub_806109C(mapObject, sprite);
}

bool8 sub_806109C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_80610DC(struct MapObject *, struct Sprite *);

bool8 sub_80610BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_WEST, 0);
    return sub_80610DC(mapObject, sprite);
}

bool8 sub_80610DC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_806111C(struct MapObject *, struct Sprite *);

bool8 sub_80610FC(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_EAST, 0);
    return sub_806111C(mapObject, sprite);
}

bool8 sub_806111C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

void sub_806113C(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a4, u8 a5)
{
    s16 vSPp4[3];
    s16 x;
    s16 y;
    memcpy(vSPp4, gUnknown_08375A34, sizeof gUnknown_08375A34);
    x = 0;
    y = 0;
    FieldObjectSetDirection(mapObject, direction);
    sub_8060320(direction, &x, &y, vSPp4[a4], vSPp4[a4]);
    npc_coords_shift(mapObject, mapObject->coords2.x + x, mapObject->coords2.y + y);
    sub_80646E4(sprite, direction, a4, a5);
    sprite->data[2] = 1;
    sprite->animPaused = 0;
    mapObject->mapobj_bit_2 = 1;
    mapObject->mapobj_bit_4 = 1;
}

void maybe_shadow_1(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a4, u8 a5)
{
    sub_806113C(mapObject, sprite, direction, a4, a5);
    sub_805FE28(mapObject, sprite, get_go_image_anim_num(mapObject->mapobj_unk_18));
    DoShadowFieldEffect(mapObject);
}

u8 sub_806123C(struct MapObject *mapObject, struct Sprite *sprite, u8 (*const callback)(struct Sprite *))
{
    s16 vSPp4[3];
    s16 x;
    s16 y;
    u8 retval;
    memcpy(vSPp4, gUnknown_08375A3A, sizeof gUnknown_08375A3A);
    retval = callback(sprite);
    if (retval == 1 && vSPp4[sprite->data[4]] != 0)
    {
        x = 0;
        y = 0;
        sub_8060320(mapObject->placeholder18, &x, &y, vSPp4[sprite->data[4]], vSPp4[sprite->data[4]]);
        npc_coords_shift(mapObject, mapObject->coords2.x + x, mapObject->coords2.y + y);
        mapObject->mapobj_bit_2 = 1;
        mapObject->mapobj_bit_4 = 1;
    } else if (retval == 0xff)
    {
        npc_coords_shift_still(mapObject);
        mapObject->mapobj_bit_3 = 1;
        mapObject->mapobj_bit_5 = 1;
        sprite->animPaused = 1;
    }
    return retval;
}

u8 sub_8061300(struct MapObject *mapObject, struct Sprite *sprite)
{
    return sub_806123C(mapObject, sprite, sub_8064704);
}

u8 sub_8061314(struct MapObject *mapObject, struct Sprite *sprite)
{
    return sub_806123C(mapObject, sprite, sub_806478C);
}

bool8 sub_8061328(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061300(mapObject, sprite) == 0xFF)
    {
        return 1;
    }
    return 0;
}

bool8 sub_8061340(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061314(mapObject, sprite) == 0xFF)
    {
        return 1;
    }
    return 0;
}

bool8 sub_8061358(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 retval;

    retval = sub_8061300(mapObject, sprite);
    if (retval != 1)
    {
        if (retval == 0xFF)
        {
            return 1;
        }
        return 0;
    }
    FieldObjectSetDirection(mapObject, GetOppositeDirection(mapObject->placeholder18));
    sub_805FE64(mapObject, sprite, get_go_image_anim_num(mapObject->mapobj_unk_18));
    return 0;
}

bool8 sub_80613D4(struct MapObject *, struct Sprite *);
bool8 sub_806142C(struct MapObject *, struct Sprite *);
bool8 sub_8061484(struct MapObject *, struct Sprite *);
bool8 sub_80614DC(struct MapObject *, struct Sprite *);

bool8 sub_80613A8(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_SOUTH, 2, 0);
    return sub_80613D4(mapObject, sprite);
}

bool8 sub_80613D4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8061400(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_NORTH, 2, 0);
    return sub_806142C(mapObject, sprite);
}

bool8 sub_806142C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8061458(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_WEST, 2, 0);
    return sub_8061484(mapObject, sprite);
}

bool8 sub_8061484(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_80614B0(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_EAST, 2, 0);
    return sub_80614DC(mapObject, sprite);
}

bool8 sub_80614DC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

void sub_8061508(struct Sprite *sprite, u16 duration)
{
    sprite->data[2] = 1;
    sprite->data[3] = duration;
}

bool8 sub_8061510(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->data[3]--;
    if (!sprite->data[3])
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_806152C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 1);
    return sub_8061510(mapObject, sprite);
}

bool8 sub_806154C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 2);
    return sub_8061510(mapObject, sprite);
}

bool8 sub_806156C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 4);
    return sub_8061510(mapObject, sprite);
}

bool8 sub_806158C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 8);
    return sub_8061510(mapObject, sprite);
}

bool8 sub_80615AC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 16);
    return sub_8061510(mapObject, sprite);
}

bool8 sub_80615EC(struct MapObject *mapObject, struct Sprite *sprite);
bool8 sub_806162C(struct MapObject *mapObject, struct Sprite *sprite);
bool8 sub_806166C(struct MapObject *mapObject, struct Sprite *sprite);
bool8 sub_80616AC(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80615CC(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_SOUTH, 1);
    return sub_80615EC(mapObject, sprite);
}

bool8 sub_80615EC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}
bool8 sub_806160C(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_NORTH, 1);
    return sub_806162C(mapObject, sprite);
}

bool8 sub_806162C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}
bool8 sub_806164C(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_WEST, 1);
    return sub_806166C(mapObject, sprite);
}

bool8 sub_806166C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}
bool8 sub_806168C(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_EAST, 1);
    return sub_80616AC(mapObject, sprite);
}

bool8 sub_80616AC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

void sub_80616CC(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 animId, u16 duration)
{
    FieldObjectSetDirection(mapObject, direction);
    sub_805FE28(mapObject, sprite, animId);
    sprite->animPaused = 0;
    sprite->data[2] = 1;
    sprite->data[3] = duration;
}

bool8 sub_8061714(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->data[3]--;
    if (sprite->data[3] == 0)
    {
        sprite->data[2] = 2;
        sprite->animPaused = 1;
        return 1;
    }
    return 0;
}

bool8 sub_806173C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sprite->data[3] & 1)
    {
        sprite->animDelayCounter++;
    }
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061778(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_SOUTH, get_go_image_anim_num(DIR_SOUTH), 32);
    return sub_806173C(mapObject, sprite);
}

bool8 sub_80617B0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_NORTH, get_go_image_anim_num(DIR_NORTH), 32);
    return sub_806173C(mapObject, sprite);
}

bool8 sub_80617E8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_WEST, get_go_image_anim_num(DIR_WEST), 32);
    return sub_806173C(mapObject, sprite);
}

bool8 sub_8061820(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_EAST, get_go_image_anim_num(DIR_EAST), 32);
    return sub_806173C(mapObject, sprite);
}

bool8 sub_8061858(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_SOUTH, get_go_image_anim_num(DIR_SOUTH), 16);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061890(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_NORTH, get_go_image_anim_num(DIR_NORTH), 16);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_80618C8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_WEST, get_go_image_anim_num(DIR_WEST), 16);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061900(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_EAST, get_go_image_anim_num(DIR_EAST), 16);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061938(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_SOUTH, get_go_fast_image_anim_num(DIR_SOUTH), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061970(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_NORTH, get_go_fast_image_anim_num(DIR_NORTH), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_80619A8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_WEST, get_go_fast_image_anim_num(DIR_WEST), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_80619E0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_EAST, get_go_fast_image_anim_num(DIR_EAST), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061A18(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_SOUTH, get_go_faster_image_anim_num(DIR_SOUTH), 4);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061A50(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_NORTH, get_go_faster_image_anim_num(DIR_NORTH), 4);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061A88(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_WEST, get_go_faster_image_anim_num(DIR_WEST), 4);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061AC0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_EAST, get_go_faster_image_anim_num(DIR_EAST), 4);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061B18(struct MapObject *, struct Sprite *);

bool8 sub_8061AF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_SOUTH, 2);
    return sub_8061B18(mapObject, sprite);
}

bool8 sub_8061B18(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}


bool8 sub_8061B58(struct MapObject *, struct Sprite *);

bool8 sub_8061B38(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_NORTH, 2);
    return sub_8061B58(mapObject, sprite);
}

bool8 sub_8061B58(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}


bool8 sub_8061B98(struct MapObject *, struct Sprite *);

bool8 sub_8061B78(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_WEST, 2);
    return sub_8061B98(mapObject, sprite);
}

bool8 sub_8061B98(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}


bool8 sub_8061BD8(struct MapObject *, struct Sprite *);

bool8 sub_8061BB8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_EAST, 2);
    return sub_8061BD8(mapObject, sprite);
}

bool8 sub_8061BD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8061C18(struct MapObject *, struct Sprite *);

bool8 sub_8061BF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_SOUTH, 3);
    return sub_8061C18(mapObject, sprite);
}

bool8 sub_8061C18(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8061C58(struct MapObject *, struct Sprite *);

bool8 sub_8061C38(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_NORTH, 3);
    return sub_8061C58(mapObject, sprite);
}

bool8 sub_8061C58(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}


bool8 sub_8061C98(struct MapObject *, struct Sprite *);

bool8 sub_8061C78(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_WEST, 3);
    return sub_8061C98(mapObject, sprite);
}

bool8 sub_8061C98(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}


bool8 sub_8061CD8(struct MapObject *, struct Sprite *);

bool8 sub_8061CB8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_EAST, 3);
    return sub_8061CD8(mapObject, sprite);
}

bool8 sub_8061CD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8061D18(struct MapObject *, struct Sprite *);

bool8 sub_8061CF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_SOUTH, 4);
    return sub_8061D18(mapObject, sprite);
}

bool8 sub_8061D18(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8061D58(struct MapObject *, struct Sprite *);

bool8 sub_8061D38(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_NORTH, 4);
    return sub_8061D58(mapObject, sprite);
}

bool8 sub_8061D58(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}


bool8 sub_8061D98(struct MapObject *, struct Sprite *);

bool8 sub_8061D78(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_WEST, 4);
    return sub_8061D98(mapObject, sprite);
}

bool8 sub_8061D98(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}


bool8 sub_8061DD8(struct MapObject *, struct Sprite *);

bool8 sub_8061DB8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_EAST, 4);
    return sub_8061DD8(mapObject, sprite);
}

bool8 sub_8061DD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8061E18(struct MapObject *, struct Sprite *);

bool8 do_run_south_anim(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_run_anim(mapObject, sprite, DIR_SOUTH);
    return sub_8061E18(mapObject, sprite);
}

bool8 sub_8061E18(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8061E58(struct MapObject *, struct Sprite *);

bool8 do_run_north_anim(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_run_anim(mapObject, sprite, DIR_NORTH);
    return sub_8061E58(mapObject, sprite);
}

bool8 sub_8061E58(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8061E98(struct MapObject *, struct Sprite *);

bool8 do_run_west_anim(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_run_anim(mapObject, sprite, DIR_WEST);
    return sub_8061E98(mapObject, sprite);
}

bool8 sub_8061E98(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8061ED8(struct MapObject *, struct Sprite *);

bool8 do_run_east_anim(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_run_anim(mapObject, sprite, DIR_EAST);
    return sub_8061ED8(mapObject, sprite);
}

bool8 sub_8061ED8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

void npc_set_direction_and_anim__an_proceed(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 animNum)
{
    obj_anim_image_set_and_seek(sprite, animNum, 0);
    FieldObjectSetDirection(mapObject, direction);
    sprite->data[2] = 1;
}

bool8 sub_8061F24(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, mapObject->placeholder18, sprite->animNum);
    return 0;
}

bool8 sub_8064864(struct Sprite *);

bool8 sub_8061F3C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064864(sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

void sub_8061F5C(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    sub_806113C(mapObject, sprite, direction, 1, 0);
    StartSpriteAnim(sprite, sub_805FD88(direction));
}

bool8 sub_8061FB0(struct MapObject *, struct Sprite *);

bool8 sub_8061F90(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061F5C(mapObject, sprite, DIR_SOUTH);
    return sub_8061FB0(mapObject, sprite);
}

bool8 sub_8061FB0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061340(mapObject, sprite))
    {
        sprite->data[2] = 2;
        mapObject->mapobj_bit_5 = 0;
        return 1;
    }
    return 0;
}

bool8 sub_8061FF8(struct MapObject *, struct Sprite *);

bool8 sub_8061FD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061F5C(mapObject, sprite, DIR_NORTH);
    return sub_8061FF8(mapObject, sprite);
}

bool8 sub_8061FF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061340(mapObject, sprite))
    {
        sprite->data[2] = 2;
        mapObject->mapobj_bit_5 = 0;
        return 1;
    }
    return 0;
}

bool8 sub_8062040(struct MapObject *, struct Sprite *);

bool8 sub_8062020(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061F5C(mapObject, sprite, DIR_WEST);
    return sub_8062040(mapObject, sprite);
}

bool8 sub_8062040(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061340(mapObject, sprite))
    {
        sprite->data[2] = 2;
        mapObject->mapobj_bit_5 = 0;
        return 1;
    }
    return 0;
}

bool8 sub_8062088(struct MapObject *, struct Sprite *);

bool8 sub_8062068(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061F5C(mapObject, sprite, DIR_EAST);
    return sub_8062088(mapObject, sprite);
}

bool8 sub_8062088(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061340(mapObject, sprite))
    {
        sprite->data[2] = 2;
        mapObject->mapobj_bit_5 = 0;
        return 1;
    }
    return 0;
}

bool8 sub_80620B0(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 objectId;
    if (!TryGetFieldObjectIdByLocalIdAndMap(0xFF, 0, MAP_ID_PETALBURG_CITY, &objectId))
    {
        an_look_any(mapObject, sprite, sub_805FE90(mapObject->coords2.x, mapObject->coords2.y, gMapObjects[objectId].coords2.x, gMapObjects[objectId].coords2.y));
    }
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_806210C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 objectId;
    if (!TryGetFieldObjectIdByLocalIdAndMap(0xFF, 0, MAP_ID_PETALBURG_CITY, &objectId))
    {
        an_look_any(mapObject, sprite, GetOppositeDirection(sub_805FE90(mapObject->coords2.x, mapObject->coords2.y, gMapObjects[objectId].coords2.x, gMapObjects[objectId].coords2.y)));
    }
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_8062170(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_9 = 1;
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_8062180(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_9 = 0;
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_80621BC(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062190(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_SOUTH, 1, 2);
    return sub_80621BC(mapObject, sprite);
}

bool8 sub_80621BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062214(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80621E8(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_NORTH, 1, 2);
    return sub_8062214(mapObject, sprite);
}

bool8 sub_8062214(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_806226C(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062240(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_WEST, 1, 2);
    return sub_806226C(mapObject, sprite);
}

bool8 sub_806226C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_80622C4(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062298(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_EAST, 1, 2);
    return sub_80622C4(mapObject, sprite);
}

bool8 sub_80622C4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_806231C(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80622F0(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_SOUTH, 0, 0);
    return sub_806231C(mapObject, sprite);
}

bool8 sub_806231C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062374(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062348(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_NORTH, 0, 0);
    return sub_8062374(mapObject, sprite);
}

bool8 sub_8062374(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_80623CC(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80623A0(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_WEST, 0, 0);
    return sub_80623CC(mapObject, sprite);
}

bool8 sub_80623CC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062424(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80623F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_EAST, 0, 0);
    return sub_8062424(mapObject, sprite);
}

bool8 sub_8062424(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_806247C(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062450(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_SOUTH, 0, 2);
    return sub_806247C(mapObject, sprite);
}

bool8 sub_806247C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061358(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_80624D4(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80624A8(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_NORTH, 0, 2);
    return sub_80624D4(mapObject, sprite);
}

bool8 sub_80624D4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061358(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_806252C(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062500(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_WEST, 0, 2);
    return sub_806252C(mapObject, sprite);
}

bool8 sub_806252C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061358(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062584(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062558(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_EAST, 0, 2);
    return sub_8062584(mapObject, sprite);
}

bool8 sub_8062584(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061358(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_80625B0(struct MapObject *mapObject, struct Sprite *sprite)
{
    an_look_any(mapObject, sprite, gUnknown_0836DC09[mapObject->animPattern]);
    return 1;
}

bool8 sub_80625C8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_SOUTH, 0x14);
    return 0;
}

bool8 sub_80625D8(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_25 = 0;
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_80625E8(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_25 = 1;
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_80625F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_12 = 1;
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_8062608(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_12 = GetFieldObjectGraphicsInfo(mapObject->graphicsId)->inanimate;
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_8062634(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_13 = 1;
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_8062644(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_13 = 0;
    sprite->data[2] = 1;
    return 1;
}

bool8 do_exclamation_mark_bubble_1(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectGetLocalIdAndMap(mapObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_EXCLAMATION_MARK_ICON_1);
    sprite->data[2] = 1;
    return 1;
}

bool8 do_exclamation_mark_bubble_2(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectGetLocalIdAndMap(mapObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_EXCLAMATION_MARK_ICON_2);
    sprite->data[2] = 1;
    return 1;
}

bool8 do_heart_bubble(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectGetLocalIdAndMap(mapObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    FieldEffectStart(FLDEFF_HEART_ICON);
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_8062704(struct MapObject *, struct Sprite *);

bool8 sub_80626C0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (mapObject->animPattern == 0x3F)
    {
        sub_8084794(mapObject);
        return 0;
    }
    else if (mapObject->animPattern != 0x39 && mapObject->animPattern != 0x3A)
    {
        sprite->data[2] = 2;
        return 1;
    }
    else
    {
        sub_812869C(mapObject);
        sprite->data[2] = 1;
        return sub_8062704(mapObject, sprite);
    }
}

bool8 sub_8062704(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_81286C4(mapObject))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062724(struct MapObject *mapObject, struct Sprite *sprite)
{
    obj_anim_image_set_and_seek(sprite, 1, 0);
    sprite->data[2] = 1;
    return 0;
}

bool8 sub_8062740(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064864(sprite))
    {
        sub_8064820(sprite, 0x20);
        sprite->data[2] = 2;
    }
    return 0;
}

bool8 sub_8062764(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_13 ^= 1;
    if (sub_8064824(sprite))
    {
        mapObject->mapobj_bit_13 = 1;
        sprite->data[2] = 3;
    }
    return 0;
}

bool8 sub_80627A0(struct MapObject *mapObject, struct Sprite *sprite)
{
    obj_anim_image_set_and_seek(sprite, 1, 0);
    sprite->data[2] = 1;
    return 0;
}

bool8 sub_80627BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064864(sprite))
    {
        sub_8064820(sprite, 0x20);
        sprite->data[2] = 2;
    }
    return 0;
}

bool8 sub_80627E0(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_13 ^= 1;
    if (sub_8064824(sprite))
    {
        mapObject->mapobj_bit_13 = 1;
        sprite->data[2] = 3;
    }
    return 0;
}

bool8 sub_806281C(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_26 = 1;
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_806282C(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_26 = 0;
    sprite->data[2] = 1;
    return 1;
}

bool8 sub_806283C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->oam.affineMode = 3;
    InitSpriteAffineAnim(sprite);
    sprite->affineAnimPaused = 1;
    sprite->subspriteMode = 0;
    return 1;
}

bool8 sub_806286C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FreeOamMatrix(sprite->oam.matrixNum);
    sprite->oam.affineMode = 0;
    CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
    return 1;
}

bool8 sub_80628D0(struct MapObject *, struct Sprite *);

bool8 sub_806289C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_SOUTH);
    sprite->affineAnimPaused = 0;
    StartSpriteAffineAnimIfDifferent(sprite, 0);
    return sub_80628D0(mapObject, sprite);
}

bool8 sub_80628D0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->affineAnimPaused = 1;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062930(struct MapObject *, struct Sprite *);

bool8 sub_80628FC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_SOUTH);
    sprite->affineAnimPaused = 0;
    ChangeSpriteAffineAnimIfDifferent(sprite, 1);
    return sub_8062930(mapObject, sprite);
}

bool8 sub_8062930(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->affineAnimPaused = 1;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

void sub_806295C(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    FieldObjectSetDirection(mapObject, direction);
    npc_coords_shift_still(mapObject);
    sub_805FE64(mapObject, sprite, sub_805FDD8(direction));
    sprite->animPaused = 1;
    sprite->data[2] = 1;
}

bool8 sub_806299C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_806295C(mapObject, sprite, DIR_SOUTH);
    return 1;
}

bool8 sub_80629AC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_806295C(mapObject, sprite, DIR_NORTH);
    return 1;
}

bool8 sub_80629BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_806295C(mapObject, sprite, DIR_WEST);
    return 1;
}

bool8 sub_80629CC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_806295C(mapObject, sprite, DIR_EAST);
    return 1;
}

bool8 sub_80629DC(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_SOUTH, sub_805FD98(DIR_SOUTH));
    return 0;
}

bool8 sub_8062A00(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_NORTH, sub_805FD98(DIR_NORTH));
    return 0;
}

bool8 sub_8062A24(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_WEST, sub_805FD98(DIR_WEST));
    return 0;
}

bool8 sub_8062A48(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_EAST, sub_805FD98(DIR_EAST));
    return 0;
}

bool8 sub_8062A6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_SOUTH, sub_805FDB8(DIR_SOUTH));
    return 0;
}

bool8 sub_8062A90(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_NORTH, sub_805FDB8(DIR_NORTH));
    return 0;
}

bool8 sub_8062AB4(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_WEST, sub_805FDB8(DIR_WEST));
    return 0;
}

bool8 sub_8062AD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_EAST, sub_805FDB8(DIR_EAST));
    return 0;
}

bool8 sub_8062AFC(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_SOUTH, sub_805FDC8(DIR_SOUTH));
    return 0;
}

bool8 sub_8062B20(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_NORTH, sub_805FDC8(DIR_NORTH));
    return 0;
}

bool8 sub_8062B44(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_WEST, sub_805FDC8(DIR_WEST));
    return 0;
}

bool8 sub_8062B68(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_EAST, sub_805FDC8(DIR_EAST));
    return 0;
}

void sub_8062B8C(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3, u8 a4)
{
    sub_806113C(mapObject, sprite, direction, a3, a4);
    StartSpriteAnimIfDifferent(sprite, sub_805FD98(direction));
    DoShadowFieldEffect(mapObject);
}

bool8 sub_8062BFC(struct MapObject *, struct Sprite *);

bool8 sub_8062BD0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_SOUTH, 0, 1);
    return sub_8062BFC(mapObject, sprite);
}

bool8 sub_8062BFC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062C54(struct MapObject *, struct Sprite *);

bool8 sub_8062C28(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_NORTH, 0, 1);
    return sub_8062C54(mapObject, sprite);
}

bool8 sub_8062C54(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062CAC(struct MapObject *, struct Sprite *);

bool8 sub_8062C80(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_WEST, 0, 1);
    return sub_8062CAC(mapObject, sprite);
}

bool8 sub_8062CAC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062D04(struct MapObject *, struct Sprite *);

bool8 sub_8062CD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_EAST, 0, 1);
    return sub_8062D04(mapObject, sprite);
}

bool8 sub_8062D04(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062D5C(struct MapObject *, struct Sprite *);

bool8 sub_8062D30(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_SOUTH, 1, 1);
    return sub_8062D5C(mapObject, sprite);
}

bool8 sub_8062D5C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062DB4(struct MapObject *, struct Sprite *);

bool8 sub_8062D88(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_NORTH, 1, 1);
    return sub_8062DB4(mapObject, sprite);
}

bool8 sub_8062DB4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062E0C(struct MapObject *, struct Sprite *);

bool8 sub_8062DE0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_WEST, 1, 1);
    return sub_8062E0C(mapObject, sprite);
}

bool8 sub_8062E0C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062E64(struct MapObject *, struct Sprite *);

bool8 sub_8062E38(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_EAST, 1, 1);
    return sub_8062E64(mapObject, sprite);
}

bool8 sub_8062E64(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062EBC(struct MapObject *, struct Sprite *);

bool8 sub_8062E90(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_SOUTH, 2, 0);
    return sub_8062EBC(mapObject, sprite);
}

bool8 sub_8062EBC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062F14(struct MapObject *, struct Sprite *);

bool8 sub_8062EE8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_NORTH, 2, 0);
    return sub_8062F14(mapObject, sprite);
}

bool8 sub_8062F14(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062F6C(struct MapObject *, struct Sprite *);

bool8 sub_8062F40(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_WEST, 2, 0);
    return sub_8062F6C(mapObject, sprite);
}

bool8 sub_8062F6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062FC4(struct MapObject *, struct Sprite *);

bool8 sub_8062F98(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_EAST, 2, 0);
    return sub_8062FC4(mapObject, sprite);
}

bool8 sub_8062FC4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8062FF0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_SOUTH, sub_805FDD8(DIR_SOUTH), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8063028(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_NORTH, sub_805FDD8(DIR_NORTH), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8063060(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_WEST, sub_805FDD8(DIR_WEST), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8063098(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_EAST, sub_805FDD8(DIR_EAST), 8);
    return sub_8061714(mapObject, sprite);
}

void sub_80630D0(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    sub_8060D20(mapObject, sprite, direction, a3);
    StartSpriteAnim(sprite, sub_805FD98(mapObject->mapobj_unk_18));
    SeekSpriteAnim(sprite, 0);
}

bool8 sub_8063128(struct MapObject *, struct Sprite *);

bool8 sub_8063108(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80630D0(mapObject, sprite, DIR_SOUTH, 1);
    return sub_8063128(mapObject, sprite);
}

bool8 sub_8063128(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8063168(struct MapObject *, struct Sprite *);

bool8 sub_8063148(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80630D0(mapObject, sprite, DIR_NORTH, 1);
    return sub_8063168(mapObject, sprite);
}

bool8 sub_8063168(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_80631A8(struct MapObject *, struct Sprite *);

bool8 sub_8063188(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80630D0(mapObject, sprite, DIR_WEST, 1);
    return sub_80631A8(mapObject, sprite);
}

bool8 sub_80631A8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_80631E8(struct MapObject *, struct Sprite *);

bool8 sub_80631C8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80630D0(mapObject, sprite, DIR_EAST, 1);
    return sub_80631E8(mapObject, sprite);
}

bool8 sub_80631E8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

void sub_8063208(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    sub_8060D20(mapObject, sprite, direction, a3);
    sub_805FE28(mapObject, sprite, sub_805FDD8(mapObject->mapobj_unk_18));
}

bool8 sub_8063258(struct MapObject *, struct Sprite *);

bool8 sub_8063238(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063208(mapObject, sprite, DIR_SOUTH, 1);
    return sub_8063258(mapObject, sprite);
}

bool8 sub_8063258(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8063298(struct MapObject *, struct Sprite *);

bool8 sub_8063278(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063208(mapObject, sprite, DIR_NORTH, 1);
    return sub_8063298(mapObject, sprite);
}

bool8 sub_8063298(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_80632D8(struct MapObject *, struct Sprite *);

bool8 sub_80632B8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063208(mapObject, sprite, DIR_WEST, 1);
    return sub_80632D8(mapObject, sprite);
}

bool8 sub_80632D8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8063318(struct MapObject *, struct Sprite *);

bool8 sub_80632F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063208(mapObject, sprite, DIR_EAST, 1);
    return sub_8063318(mapObject, sprite);
}

bool8 sub_8063318(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

void sub_8063338(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    sub_8060D20(mapObject, sprite, direction, a3);
    StartSpriteAnim(sprite, sub_805FDB8(mapObject->mapobj_unk_18));
    SeekSpriteAnim(sprite, 0);
}

bool8 sub_8063390(struct MapObject *, struct Sprite *);

bool8 sub_8063370(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063338(mapObject, sprite, DIR_SOUTH, 1);
    return sub_8063390(mapObject, sprite);
}

bool8 sub_8063390(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_80633D0(struct MapObject *, struct Sprite *);

bool8 sub_80633B0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063338(mapObject, sprite, DIR_NORTH, 1);
    return sub_80633D0(mapObject, sprite);
}

bool8 sub_80633D0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8063410(struct MapObject *, struct Sprite *);

bool8 sub_80633F0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063338(mapObject, sprite, DIR_WEST, 1);
    return sub_8063410(mapObject, sprite);
}

bool8 sub_8063410(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8063450(struct MapObject *, struct Sprite *);

bool8 sub_8063430(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063338(mapObject, sprite, DIR_EAST, 1);
    return sub_8063450(mapObject, sprite);
}

bool8 sub_8063450(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data[2] = 2;
        return 1;
    }
    return 0;
}

bool8 sub_8063470(struct MapObject *mapObject, struct Sprite *sprite)
{
    return 1;
}

bool8 sub_8063474(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->animPaused = 1;
    return 1;
}

void npc_obj_transfer_image_anim_pause_flag(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (mapObject->mapobj_bit_10)
    {
        sprite->animPaused = 1;
    }
}

void sub_80634A0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (mapObject->mapobj_bit_11)
    {
        sprite->animPaused = 0;
        mapObject->mapobj_bit_10 = 0;
        mapObject->mapobj_bit_11 = 0;
    }
}

void sub_80634E8(struct MapObject *, struct Sprite *);
static void UpdateMapObjSpriteVisibility(struct MapObject *, struct Sprite *);

void sub_80634D0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80634E8(mapObject, sprite);
    UpdateMapObjSpriteVisibility(mapObject, sprite);
}
# 8226 "src/field/field_map_obj.c"
__attribute__((naked))
void sub_80634E8(struct MapObject *mapObject, struct Sprite *sprite) {
    asm(".syntax unified\n    push {r4-r6,lr}\n    adds r5, r0, 0\n    adds r4, r1, 0\n    ldrb r1, [r5, 0x1]\n    movs r0, 0x41\n    negs r0, r0\n    ands r0, r1\n    strb r0, [r5, 0x1]\n    ldrb r0, [r5, 0x5]\n    bl GetFieldObjectGraphicsInfo\n    adds r6, r0, 0\n    adds r0, r4, 0\n    adds r0, 0x3E\n    ldrb r1, [r0]\n    movs r0, 0x2\n    ands r0, r1\n    cmp r0, 0\n    beq _0806354C\n    ldrh r1, [r4, 0x24]\n    ldrh r0, [r4, 0x20]\n    adds r1, r0\n    adds r0, r4, 0\n    adds r0, 0x28\n    ldrb r0, [r0]\n    lsls r0, 24\n    asrs r0, 24\n    ldr r2, _08063544 @ =gSpriteCoordOffsetX\n    adds r0, r1\n    ldrh r2, [r2]\n    adds r0, r2\n    lsls r0, 16\n    lsrs r3, r0, 16\n    ldrh r1, [r4, 0x26]\n    ldrh r0, [r4, 0x22]\n    adds r1, r0\n    adds r0, r4, 0\n    adds r0, 0x29\n    ldrb r0, [r0]\n    lsls r0, 24\n    asrs r0, 24\n    ldr r2, _08063548 @ =gSpriteCoordOffsetY\n    adds r0, r1\n    ldrh r2, [r2]\n    adds r0, r2\n    b _08063574\n    .align 2, 0\n_08063544: .4byte gSpriteCoordOffsetX\n_08063548: .4byte gSpriteCoordOffsetY\n_0806354C:\n    ldrh r1, [r4, 0x24]\n    ldrh r0, [r4, 0x20]\n    adds r1, r0\n    adds r0, r4, 0\n    adds r0, 0x28\n    ldrb r0, [r0]\n    lsls r0, 24\n    asrs r0, 24\n    adds r0, r1\n    lsls r0, 16\n    lsrs r3, r0, 16\n    ldrh r1, [r4, 0x26]\n    ldrh r0, [r4, 0x22]\n    adds r1, r0\n    adds r0, r4, 0\n    adds r0, 0x29\n    ldrb r0, [r0]\n    lsls r0, 24\n    asrs r0, 24\n    adds r0, r1\n_08063574:\n    lsls r0, 16\n    lsrs r2, r0, 16\n    ldrh r0, [r6, 0x8]\n    adds r0, r3\n    lsls r0, 16\n    lsrs r1, r0, 16\n    ldrh r0, [r6, 0xA]\n    adds r0, r2\n    lsls r0, 16\n    lsrs r4, r0, 16\n    lsls r0, r3, 16\n    asrs r0, 16\n    cmp r0, 0xFF\n    bgt _0806359C\n    lsls r0, r1, 16\n    asrs r0, 16\n    movs r1, 0x10\n    negs r1, r1\n    cmp r0, r1\n    bge _080635A4\n_0806359C:\n    ldrb r0, [r5, 0x1]\n    movs r1, 0x40\n    orrs r0, r1\n    strb r0, [r5, 0x1]\n_080635A4:\n    lsls r0, r2, 16\n    asrs r0, 16\n    cmp r0, 0xAF\n    bgt _080635B8\n    lsls r0, r4, 16\n    asrs r0, 16\n    movs r1, 0x10\n    negs r1, r1\n    cmp r0, r1\n    bge _080635C0\n_080635B8:\n    ldrb r0, [r5, 0x1]\n    movs r1, 0x40\n    orrs r0, r1\n    strb r0, [r5, 0x1]\n_080635C0:\n    pop {r4-r6}\n    pop {r0}\n    bx r0\n.syntax divided\n");
# 8345 "src/field/field_map_obj.c"
}


void UpdateMapObjSpriteVisibility(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->invisible = 0;
    if (mapObject->mapobj_bit_13 || mapObject->mapobj_bit_14)
    {
        sprite->invisible = 1;
    }
}
