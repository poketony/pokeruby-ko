# 1 "src/field/decoration.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/decoration.c"
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
# 2 "src/field/decoration.c" 2
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
# 3 "src/field/decoration.c" 2
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
# 4 "src/field/decoration.c" 2
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
# 5 "src/field/decoration.c" 2
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
# 6 "src/field/decoration.c" 2
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
# 7 "src/field/decoration.c" 2
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
# 8 "src/field/decoration.c" 2
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
# 9 "src/field/decoration.c" 2
# 1 "include/menu_helpers.h" 1





struct YesNoFuncTable
{
    void (*yesFunc)(u8);
    void (*noFunc)(u8);
};

void sub_80F9020(void);
void DisplayItemMessageOnField(u8, const u8 *, TaskFunc, u16);
void DoYesNoFuncWithChoice(u8, const struct YesNoFuncTable *);
void sub_80F914C(u8, const struct YesNoFuncTable *);
u8 sub_80F9284(void);
u8 sub_80F92BC(void);
bool8 sub_80F92F4(u16);
bool8 sub_80F931C(u16);
bool8 sub_80F9344(void);
void sub_80F9368(void);
void sub_80F9438(void);
void sub_80F944C(void);
void sub_80F9480(u8 *, u8);
void sub_80F94A4(u8, u8 *, s16, s16);
void sub_80F94F8(u8 *);
void sub_80F9520(u8 *, u8);
void CreateVerticalScrollIndicators(u8, u16, u16);
void sub_80F979C(u8, bool8);
void DestroyVerticalScrollIndicator(u8);
void LoadScrollIndicatorPalette(void);
void BuyMenuFreeMemory(void);
void sub_80F98A4(u8);
void StartVerticalScrollIndicators(u8);
void sub_80F98DC(u8);
void PauseVerticalScrollIndicator(u8);
void sub_80F9988(u8, u8);
# 10 "src/field/decoration.c" 2
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
# 11 "src/field/decoration.c" 2
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
# 12 "src/field/decoration.c" 2
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
# 13 "src/field/decoration.c" 2
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
# 14 "src/field/decoration.c" 2
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
# 15 "src/field/decoration.c" 2
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
# 16 "src/field/decoration.c" 2
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
# 17 "src/field/decoration.c" 2
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
# 18 "src/field/decoration.c" 2
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
# 19 "src/field/decoration.c" 2
# 1 "include/field_weather.h" 1



void sub_807C828(void);
void DoWeatherEffect(u8 effect);
void sub_807C988(u8 effect);
void sub_807C9B4(u8 effect);
void sub_807C9E4(u8);
void sub_807CA34(u8);
void sub_807CAE8(void);
void nullsub_38(void);
u32 sub_807CB0C(void);
void sub_807CB10(void);
void sub_807CC24(void);
void sub_807CCAC(void);
u8 sub_807CDC4(void);
u8 sub_807CE24(void);
u8 sub_807CE7C(void);
void nullsub_39(void);


void sub_807CEBC(u8, u8, s8);

void sub_807D1BC(u8 a, u8 a2, s8 c, u8 d, u16 e);
void sub_807D304(s8 a, u8 arg2, u16 c);
void sub_807D424(u8, u16);

void fade_screen(u8, u8);

void sub_807D78C(u8 tag);
void sub_807D874(u8);

void sub_807DB64(u8, u8);

void sub_807DE68(void);

void PlayRainSoundEffect(void);

void SetSav1Weather(u32);
u8 GetSav1Weather(void);
void sub_80806E4(void);

void DoCurrentWeather(void);
void sub_8080750();

bool8 sub_807D770(void);
bool8 sub_807DDFC(void);
void SetWeather(u32);
void UpdateWeatherPerDay(u16);
# 20 "src/field/decoration.c" 2
# 1 "include/decoration.h" 1





enum DecoId {
            DECOR_NONE,
            DECOR_SMALL_DESK,
            DECOR_POKEMON_DESK,
            DECOR_HEAVY_DESK,
            DECOR_RAGGED_DESK,
            DECOR_COMFORT_DESK,
            DECOR_PRETTY_DESK,
            DECOR_BRICK_DESK,
            DECOR_CAMP_DESK,
            DECOR_HARD_DESK,
            DECOR_SMALL_CHAIR,
            DECOR_POKEMON_CHAIR,
            DECOR_HEAVY_CHAIR,
            DECOR_PRETTY_CHAIR,
            DECOR_COMFORT_CHAIR,
            DECOR_RAGGED_CHAIR,
            DECOR_BRICK_CHAIR,
            DECOR_CAMP_CHAIR,
            DECOR_HARD_CHAIR,
            DECOR_RED_PLANT,
            DECOR_TROPICAL_PLANT,
            DECOR_PRETTY_FLOWERS,
            DECOR_COLORFUL_PLANT,
            DECOR_BIG_PLANT,
            DECOR_GORGEOUS_PLANT,
            DECOR_RED_BRICK,
            DECOR_YELLOW_BRICK,
            DECOR_BLUE_BRICK,
            DECOR_RED_BALLOON,
            DECOR_BLUE_BALLOON,
            DECOR_YELLOW_BALLOON,
            DECOR_RED_TENT,
            DECOR_BLUE_TENT,
            DECOR_SOLID_BOARD,
            DECOR_SLIDE,
            DECOR_FENCE_LENGTH,
            DECOR_FENCE_WIDTH,
            DECOR_TIRE,
            DECOR_STAND,
            DECOR_MUD_BALL,
            DECOR_BREAKABLE_DOOR,
            DECOR_SAND_ORNAMENT,
            DECOR_SILVER_SHIELD,
            DECOR_GOLD_SHIELD,
            DECOR_GLASS_ORNAMENT,
            DECOR_TV,
            DECOR_ROUND_TV,
            DECOR_CUTE_TV,
            DECOR_GLITTER_MAT,
            DECOR_JUMP_MAT,
            DECOR_SPIN_MAT,
            DECOR_C_LOW_NOTE_MAT,
            DECOR_D_NOTE_MAT,
            DECOR_E_NOTE_MAT,
            DECOR_F_NOTE_MAT,
            DECOR_G_NOTE_MAT,
            DECOR_A_NOTE_MAT,
            DECOR_B_NOTE_MAT,
            DECOR_C_HIGH_NOTE_MAT,
            DECOR_SURF_MAT,
            DECOR_THUNDER_MAT,
            DECOR_FIRE_BLAST_MAT,
            DECOR_POWDER_SNOW_MAT,
            DECOR_ATTRACT_MAT,
            DECOR_FISSURE_MAT,
            DECOR_SPIKES_MAT,
            DECOR_BALL_POSTER,
            DECOR_GREEN_POSTER,
            DECOR_RED_POSTER,
            DECOR_BLUE_POSTER,
            DECOR_CUTE_POSTER,
            DECOR_PIKA_POSTER,
            DECOR_LONG_POSTER,
            DECOR_SEA_POSTER,
            DECOR_SKY_POSTER,
            DECOR_KISS_POSTER,
            DECOR_PICHU_DOLL,
            DECOR_PIKACHU_DOLL,
            DECOR_MARILL_DOLL,
            DECOR_TOGEPI_DOLL,
            DECOR_CYNDAQUIL_DOLL,
            DECOR_CHIKORITA_DOLL,
            DECOR_TOTODILE_DOLL,
            DECOR_JIGGLYPUFF_DOLL,
            DECOR_MEOWTH_DOLL,
            DECOR_CLEFAIRY_DOLL,
            DECOR_DITTO_DOLL,
            DECOR_SMOOCHUM_DOLL,
            DECOR_TREECKO_DOLL,
            DECOR_TORCHIC_DOLL,
            DECOR_MUDKIP_DOLL,
            DECOR_DUSKULL_DOLL,
            DECOR_WYNAUT_DOLL,
            DECOR_BALTOY_DOLL,
            DECOR_KECLEON_DOLL,
            DECOR_AZURILL_DOLL,
            DECOR_SKITTY_DOLL,
            DECOR_SWABLU_DOLL,
            DECOR_GULPIN_DOLL,
            DECOR_LOTAD_DOLL,
            DECOR_SEEDOT_DOLL,
            DECOR_PIKA_CUSHION,
            DECOR_ROUND_CUSHION,
            DECOR_KISS_CUSHION,
            DECOR_ZIGZAG_CUSHION,
            DECOR_SPIN_CUSHION,
            DECOR_DIAMOND_CUSHION,
            DECOR_BALL_CUSHION,
            DECOR_GRASS_CUSHION,
            DECOR_FIRE_CUSHION,
            DECOR_WATER_CUSHION,
            DECOR_SNORLAX_DOLL,
            DECOR_RHYDON_DOLL,
            DECOR_LAPRAS_DOLL,
            DECOR_VENUSAUR_DOLL,
            DECOR_CHARIZARD_DOLL,
            DECOR_BLASTOISE_DOLL,
            DECOR_WAILMER_DOLL,
            DECOR_REGIROCK_DOLL,
            DECOR_REGICE_DOLL,
            DECOR_REGISTEEL_DOLL
};

enum DecorPerm {



    DECORPERM_SOLID_FLOOR,
    DECORPERM_PASS_FLOOR,
    DECORPERM_BEHIND_FLOOR,
    DECORPERM_NA_WALL,
    DECORPERM_SOLID_MAT
};

enum DecorShape {



    DECORSHAPE_1x1,
    DECORSHAPE_2x1,
    DECORSHAPE_3x1,
    DECORSHAPE_4x2,
    DECORSHAPE_2x2,
    DECORSHAPE_1x2,
    DECORSHAPE_1x3,
    DECORSHAPE_2x4,
    DECORSHAPE_3x3,
    DECORSHAPE_3x2
};

enum DecoCat {



          DECORCAT_DESK,
          DECORCAT_CHAIR,
          DECORCAT_PLANT,
          DECORCAT_ORNAMENT,
          DECORCAT_MAT,
          DECORCAT_POSTER,
          DECORCAT_DOLL,
          DECORCAT_CUSHION
};

struct Decoration
{
             u8 id;
             u8 name[16];
             u8 permission;
             u8 shape;
             u8 category;
             u16 price;
             const u8 *description;
             const u16 *tiles;
};

struct DecoPCPointers
{
               u8 *items;
               u8 *pos;
               u8 size;
               u8 isPlayerRoom;
};

struct DecorationInventory
{
    u8 *items;
    u8 size;
};

struct UnkStruct_803EC860
{
    const u8 *tiles;
    const u8 *y;
    const u8 *x;
    u8 size;
};

extern const struct UnkStruct_803EC860 gUnknown_083EC860[];

struct UnkStruct_02038900
{
                          const struct Decoration *decoration;
                          u16 tiles[0x40];
                          u8 image[0x800];
                          u16 palette[16];
};

struct UnkStruct_083EC900
{
    u8 shape;
    u8 size;
    u8 x;
    u8 y;
};

struct UnkStruct_020391B4
{
    u8 decorId;
    u8 width;
    u8 height;
    u16 flagId;
};

extern const struct UnkStruct_083EC900 gUnknown_083EC900[];
extern const struct SpritePalette gUnknown_083EC954;
extern const struct SpritePalette gUnknown_083ECA5C;
extern const struct SpritePalette gUnknown_083ECA64;
extern const struct SpriteTemplate gSpriteTemplate_83EC93C;
extern const struct SpriteTemplate gSpriteTemplate_83ECA88;

extern const struct Decoration gDecorations[];
extern struct UnkStruct_02038900 gUnknown_02038900;
extern u8 *gUnknown_020388D0;
extern u8 gUnknown_081A2F7B[];
extern u8 gUnknown_081A2F8A[];
extern struct OamData gUnknown_020391AC;

extern u8 gUnknown_020388D4;
extern u8 gUnknown_020388D5;
extern u8 gUnknown_020388F2;
extern u8 gUnknown_020388F3;
extern u8 gUnknown_020388F4;
extern u8 gUnknown_020388F5;
extern u8 gUnknown_020388F6;
extern u8 gUnknown_020388D6[16];
extern u8 gUnknown_020388E6[12];
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;
extern u16 gSpecialVar_0x8007;
extern u16 gUnknown_020391A4;
extern u16 gUnknown_020391A6;
extern u8 gUnknown_020391A8;
extern u8 gUnknown_020391A9;
extern u8 gUnknown_020391AA;
extern u8 gUnknown_02039234;
extern void (*gFieldCallback)(void);
extern const struct YesNoFuncTable gUnknown_083EC96C[];
extern struct UnkStruct_020391B4 gUnknown_020391B4[16];

extern const u16 gUnknown_083EC654[3];
extern const struct DecorationInventory gDecorationInventories[];
extern const u8 *const gUnknown_083EC5E4[];
extern const u8 *const gUnknown_083EC624[];
extern u8 gUnknown_020388F7[];
extern const struct MenuAction2 gUnknown_083EC604[];
extern const struct YesNoFuncTable gUnknown_083EC634[];
extern const u8 gUnknown_083EC65A[];
extern const u8 gUnknown_083EC97C[];
extern const u8 gUnknown_083EC984[];
extern void sub_80B3068(u8);
extern const struct YesNoFuncTable gUnknown_083EC95C;
extern const struct YesNoFuncTable gUnknown_083EC964;
extern const struct YesNoFuncTable gUnknown_083EC9CC;
extern const struct YesNoFuncTable gUnknown_083EC9D4;
extern const struct YesNoFuncTable gUnknown_083ECAA0;

extern u8 sub_8134194(u8);
extern bool8 sub_81341D4(void);
extern void sub_8134104(u8);
extern bool8 sub_807D770(void);
extern void sub_8109DAC(u8);
extern void ReshowPlayerPC(u8);
void Task_SecretBasePC_Decoration(u8);

void Task_SecretBasePC_Decoration(u8 taskId);
void sub_80FE2B4(void);
void Task_DecorationPCProcessMenuInput(u8);
void sub_80FE394(void);
void gpu_pal_decompress_alloc_tag_and_upload(u8);
void sub_80FE5AC(u8);
void sub_80FE604(u8);
void sub_80FE728(u8);
void sub_80FE758(u8);
void sub_80FE7A8(u8);
void sub_80FE7D4(u8 *, u8);
void sub_80FE868(u8);
void sub_80FE948(u8);
void sub_80FEABC(u8, u8);
void sub_80FEC94(u8);
void sub_80FECB8(u8);
void sub_80FECE0(u8);
void sub_80FEF50(u8);
bool8 sub_80FEFA4(void);
void sub_80FF394(u16, u16, u16);
void sub_80FF6AC(u8);
void sub_80FF960(u8);
void AddDecorationIconObjectFromFieldObject(struct UnkStruct_02038900 *, u8);
void SetUpPlacingDecorationPlayerAvatar(u8, struct UnkStruct_02038900 *);
void sub_8100038(u8);
void sub_81000A0(u8);
void sub_8100174(u8);
void sub_8100248(u8);
void sub_810028C(u8);
void c1_overworld_prev_quest(u8);
void sub_8100364(void);
void sub_810045C(void);
void sub_810065C(u8);
void sub_81006A8(u8);
void sub_81006D0(struct UnkStruct_02038900 *);
void sub_810070C(u16 *, u16);
void sub_8100874(struct UnkStruct_02038900 *);
void sub_81008BC(struct UnkStruct_02038900 *);
void sub_8100930(u8);
void sub_81009A8(struct Sprite *);
void sub_81009C0(struct Sprite *);
bool8 sub_8100D38(u8);
void sub_8100E70(u8);
void sub_8100EEC(u8);
void sub_8101024(u8);
void sub_81010F0(u8);
void sub_8101460(u8);
void sub_8101518(u8);
void sub_81015B0(u8);
void sub_81015E0(u8);
void sub_810156C(u8);
void sub_8101678(void);
void sub_8101698(struct Sprite *);
void sub_81016C8(void);
void sub_81016F4(void);
void sub_8101824(u8);
void sub_8109A30(u8);

void sub_80FF160(u8);
void sub_80FF5BC(u8);
void sub_80FF058(u8);
void sub_8100A0C(u8);
void sub_8101700(u8);
void sub_81017A0(u8);
void sub_8109D04(u8);

void sub_80FED3C(u8);
void sub_80FFAB0(u8);
void sub_80FFB08(u8);
void sub_81000C4(u8);
void sub_810026C(u8);
void sub_8100F88(u8);
void sub_8100FB4(u8);
void sub_810153C(u8);
void sub_8101590(u8);
void sub_8101848(u8);
void DoPlayerPCDecoration(u8);
# 21 "src/field/decoration.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 22 "src/field/decoration.c" 2

__attribute__((section("ewram_data"))) u8 *gUnknown_020388D0 = ((void *)0);
__attribute__((section("ewram_data"))) u8 gUnknown_020388D4 = 0;
__attribute__((section("ewram_data"))) u8 gUnknown_020388D5 = 0;
__attribute__((section("ewram_data"))) u8 gUnknown_020388D6[16] = {0};
__attribute__((section("ewram_data"))) u8 gUnknown_020388E6[12] = {0};
__attribute__((section("ewram_data"))) u8 gUnknown_020388F2 = 0;
__attribute__((section("ewram_data"))) u8 gUnknown_020388F3 = 0;
__attribute__((section("ewram_data"))) u8 gUnknown_020388F4 = 0;
__attribute__((section("ewram_data"))) u8 gUnknown_020388F5 = 0;
__attribute__((section("ewram_data"))) u8 gUnknown_020388F6 = 0;
__attribute__((section("ewram_data"))) u8 gUnknown_020388F7[8] = {0};
__attribute__((section("ewram_data"))) struct UnkStruct_02038900 gUnknown_02038900 = {0};
__attribute__((section("ewram_data"))) u16 gUnknown_020391A4 = 0;
__attribute__((section("ewram_data"))) u16 gUnknown_020391A6 = 0;
__attribute__((section("ewram_data"))) u8 gUnknown_020391A8 = 0;
__attribute__((section("ewram_data"))) u8 gUnknown_020391A9 = 0;
__attribute__((section("ewram_data"))) u8 gUnknown_020391AA = 0;
__attribute__((section("ewram_data"))) struct OamData gUnknown_020391AC = {0};
__attribute__((section("ewram_data"))) struct UnkStruct_020391B4 gUnknown_020391B4[16] = {0};
__attribute__((section("ewram_data"))) u8 gUnknown_02039234 = 0;

# 1 "src/field/../data/decoration_descriptions.h" 1
const u8 DecorDesc_SMALL_DESK[] = _(
    "1인용 사이즈의\n"
    "작은 책상");

const u8 DecorDesc_POKEMON_DESK[] = _(
    "몬스터볼 형태의\n"
    "작은 책상");

const u8 DecorDesc_HEAVY_DESK[] = _(
    "철로 만들어진\n"
 "큰 책상\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_RAGGED_DESK[] = _(
    "나무로 만들어진\n"
 "큰 책상\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_COMFORT_DESK[] = _(
    "나뭇잎으로 만들어진\n"
    "큰 책상\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_PRETTY_DESK[] = _(
    "유리로 만들어진\n"
    "거대한 책상\n"
    "많은 물건을 놓을 수 있다");

const u8 DecorDesc_BRICK_DESK[] = _(
    "벽돌로 만들어진\n"
    "거대한 책상\n"
    "많은 물건을 놓을 수 있다");

const u8 DecorDesc_CAMP_DESK[] = _(
    "통나무로 만들어진\n"
    "거대한 책상\n"
    "많은 물건을 놓을 수 있다");

const u8 DecorDesc_HARD_DESK[] = _(
    "돌로 만들어진\n"
    "거대한 책상\n"
    "많은 물건을 놓을 수 있다");

const u8 DecorDesc_SMALL_CHAIR[] = _(
    "혼자 앉는\n"
    "작은 의자");

const u8 DecorDesc_POKEMON_CHAIR[] = _(
    "몬스터볼\n"
    "형태의\n"
    "작은 의자");

const u8 DecorDesc_HEAVY_CHAIR[] = _(
    "철로 만들어진\n"
    "작은 의자");

const u8 DecorDesc_PRETTY_CHAIR[] = _(
    "유리로 만들어진\n"
    "작은 의자");

const u8 DecorDesc_COMFORT_CHAIR[] = _(
    "나뭇잎으로 만들어진\n"
    "작은 의자");

const u8 DecorDesc_RAGGED_CHAIR[] = _(
    "나무로 만들어진\n"
    "작은 의자");

const u8 DecorDesc_BRICK_CHAIR[] = _(
    "벽돌로 만들어진\n"
    "작은 의자");

const u8 DecorDesc_CAMP_CHAIR[] = _(
    "통나무로 만들어진\n"
    "작은 의자");

const u8 DecorDesc_HARD_CHAIR[] = _(
    "돌로 만들어진\n"
    "작은 의자");

const u8 DecorDesc_RED_PLANT[] = _(
    "새빨간 꽃이\n"
    "피어 있는 화분");

const u8 DecorDesc_TROPICAL_PLANT[] = _(
    "남국의 꽃이\n"
    "피어 있는 화분");

const u8 DecorDesc_PRETTY_FLOWERS[] = _(
    "귀여운 꽃이\n"
    "피어 있는 화분");

const u8 DecorDesc_COLORFUL_PLANT[] = _(
    "여러 가지 꽃이\n"
    "피어 있는\n"
    "큰 화분");

const u8 DecorDesc_BIG_PLANT[] = _(
    "우산 같은\n"
    "형태를 한\n"
    "큰 화분");

const u8 DecorDesc_GORGEOUS_PLANT[] = _(
    "훌륭한 나무가\n"
    "심어져 있는 화분");

const u8 DecorDesc_RED_BRICK[] = _(
    "빨간색 벽돌\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_YELLOW_BRICK[] = _(
    "노란색 벽돌\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_BLUE_BRICK[] = _(
    "파란색 벽돌\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_RED_BALLOON[] = _(
    "물이 들어 있는\n"
    "빨간 풍선\n"
    "밟으면 터진다");

const u8 DecorDesc_BLUE_BALLOON[] = _(
    "물이 들어 있는\n"
    "파란 풍선\n"
    "밟으면 터진다");

const u8 DecorDesc_YELLOW_BALLOON[] = _(
    "물이 들어 있는\n"
    "노란 풍선\n"
    "밟으면 터진다");

const u8 DecorDesc_RED_TENT[] = _(
    "크고 빨간 텐트\n"
    "안에 들어갈 수 있다");

const u8 DecorDesc_BLUE_TENT[] = _(
    "크고 파란 텐트\n"
    "안에 들어갈 수 있다");

const u8 DecorDesc_SOLID_BOARD[] = _(
    "구멍 위에 놓으면\n"
    "다리처럼 건널 수 있다");

const u8 DecorDesc_SLIDE[] = _(
    "미끄럼대 위에서\n"
 "미끄러지며\n"
    "내려올 수 있다");

const u8 DecorDesc_FENCE_LENGTH[] = _(
    "작은 울타리\n"
    "지나갈 수 없다");

const u8 DecorDesc_FENCE_WIDTH[] = _(
    "작은 울타리\n"
    "지나갈 수 없다");

const u8 DecorDesc_TIRE[] = _(
    "낡고 큰 타이어\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_STAND[] = _(
    "계단 위를 걸어\n"
    "미끄럼대에 올라간다");

const u8 DecorDesc_MUD_BALL[] = _(
    "둥근 진흙경단\n"
    "밟으면 부서진다");

const u8 DecorDesc_BREAKABLE_DOOR[] = _(
    "빠져나갈 수 있는\n"
    "이상한 도어");

const u8 DecorDesc_SAND_ORNAMENT[] = _(
    "만지면 무너지는\n"
    "모래 장식품");

const u8 DecorDesc_SILVER_SHIELD[] = _(
    "배틀타워에서\n"
    "50명 연승한\n"
    "기념의 상패");

const u8 DecorDesc_GOLD_SHIELD[] = _(
    "배틀타워에서\n"
    "100명 연승한\n"
    "기념의 상패");

const u8 DecorDesc_GLASS_ORNAMENT[] = _(
    "미술관에 있는\n"
    "유명한 조각을\n"
    "유리로 본떠 만든 것");

const u8 DecorDesc_TV[] = _(
    "회색빛의 작은\n"
    "장난감 TV");

const u8 DecorDesc_ROUND_TV[] = _(
    "도토링을 모델로 하여\n"
    "만들어진\n"
    "장난감 TV");

const u8 DecorDesc_CUTE_TV[] = _(
    "에나비를 모델로 하여\n"
    "만들어진\n"
    "장난감 TV");

const u8 DecorDesc_GLITTER_MAT[] = _(
    "밟으면 반짝이는\n"
    "이상한 매트");

const u8 DecorDesc_JUMP_MAT[] = _(
    "밟으면 점프하는\n"
    "짓궂은 매트");

const u8 DecorDesc_SPIN_MAT[] = _(
    "밟으면 빙글빙글 도는\n"
    "짖궂은 매트");

const u8 DecorDesc_C_LOW_NOTE_MAT[] = _(
    "밟으면 도에 해당하는\n"
    "소리가 나는 매트");

const u8 DecorDesc_D_NOTE_MAT[] = _(
    "밟으면 레에 해당하는\n"
    "소리가 나는 매트");

const u8 DecorDesc_E_NOTE_MAT[] = _(
    "밟으면 미에 해당하는\n"
    "소리가 나는 매트");

const u8 DecorDesc_F_NOTE_MAT[] = _(
    "밟으면 파에 해당하는\n"
    "소리가 나는 매트");

const u8 DecorDesc_G_NOTE_MAT[] = _(
    "밟으면 솔에 해당하는\n"
    "소리가 나는 매트");

const u8 DecorDesc_A_NOTE_MAT[] = _(
    "밟으면 라에 해당하는\n"
    "소리가 나는 매트");

const u8 DecorDesc_B_NOTE_MAT[] = _(
    "밟으면 시에 해당하는\n"
    "소리가 나는 매트");

const u8 DecorDesc_C_HIGH_NOTE_MAT[] = _(
    "밟으면 높은 도에 해당하는\n"
    "소리가 나는 매트");

const u8 DecorDesc_SURF_MAT[] = _(
    "파도타기의 표현으로\n"
    "만들어진 매트\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_THUNDER_MAT[] = _(
    "번개의 표현으로\n"
    "만들어진 매트\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_FIRE_BLAST_MAT[] = _(
    "불대문자의 표현으로\n"
    "만들어진 매트\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_POWDER_SNOW_MAT[] = _(
    "눈싸라기의 표현으로\n"
    "만들어진 매트\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_ATTRACT_MAT[] = _(
    "헤롱헤롱의 표현으로\n"
    "만들어진 매트\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_FISSURE_MAT[] = _(
    "땅가르기의 표현으로\n"
    "만들어진 매트\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_SPIKES_MAT[] = _(
    "압정뿌리기의 표현으로\n"
    "만들어진 매트\n"
    "위에 물건을 놓을 수 있다");

const u8 DecorDesc_BALL_POSTER[] = _(
    "몬스터볼이\n"
    "프린트되어 있는\n"
    "작은 포스터");

const u8 DecorDesc_GREEN_POSTER[] = _(
    "나무지기가\n"
    "프린트되어 있는\n"
    "작은 포스터");

const u8 DecorDesc_RED_POSTER[] = _(
    "아차모가\n"
    "프린트되어 있는\n"
    "작은 포스터");

const u8 DecorDesc_BLUE_POSTER[] = _(
    "물짱이가\n"
    "프린트되어 있는\n"
    "작은 포스터");

const u8 DecorDesc_CUTE_POSTER[] = _(
    "루리리가\n"
    "프린트되어 있는\n"
    "작은 포스터");

const u8 DecorDesc_PIKA_POSTER[] = _(
    "피카츄와 피츄가\n"
    "프린트되어 있는\n"
    "큰 포스터");

const u8 DecorDesc_LONG_POSTER[] = _(
    "세비퍼가\n"
    "프린트되어 있는\n"
    "큰 포스터");

const u8 DecorDesc_SEA_POSTER[] = _(
    "시라칸이\n"
    "프린트되어 있는\n"
    "큰 포스터");

const u8 DecorDesc_SKY_POSTER[] = _(
    "갈모매가\n"
    "프린트되어 있는\n"
    "큰 포스터");

const u8 DecorDesc_KISS_POSTER[] = _(
    "뽀뽀라가\n"
    "프린트되어 있는\n"
    "큰 포스터");

const u8 DecorDesc_PICHU_DOLL[] = _(
    "피츄의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_PIKACHU_DOLL[] = _(
    "피카츄의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_MARILL_DOLL[] = _(
    "마릴의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_TOGEPI_DOLL[] = _(
    "토게피의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_CYNDAQUIL_DOLL[] = _(
    "브케인의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_CHIKORITA_DOLL[] = _(
    "치코리타의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_TOTODILE_DOLL[] = _(
    "리아코의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_JIGGLYPUFF_DOLL[] = _(
    "푸린의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_MEOWTH_DOLL[] = _(
    "나옹의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_CLEFAIRY_DOLL[] = _(
    "삐삐의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_DITTO_DOLL[] = _(
    "메타몽의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_SMOOCHUM_DOLL[] = _(
    "뽀뽀라의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_TREECKO_DOLL[] = _(
    "나무지기의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_TORCHIC_DOLL[] = _(
    "아차모의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_MUDKIP_DOLL[] = _(
    "물짱이의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_DUSKULL_DOLL[] = _(
    "해골몽의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_WYNAUT_DOLL[] = _(
    "마자의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_BALTOY_DOLL[] = _(
    "오뚝군의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_KECLEON_DOLL[] = _(
    "켈리몬의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_AZURILL_DOLL[] = _(
    "루리리의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_SKITTY_DOLL[] = _(
    "에나비의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_SWABLU_DOLL[] = _(
    "파비코의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_GULPIN_DOLL[] = _(
    "꼴깍몬의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_LOTAD_DOLL[] = _(
    "연꽃몬의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_SEEDOT_DOLL[] = _(
    "도토링의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_PIKA_CUSHION[] = _(
    "피카츄 쿠션\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_ROUND_CUSHION[] = _(
    "마릴리 쿠션\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_KISS_CUSHION[] = _(
    "뽀뽀라 쿠션\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_ZIGZAG_CUSHION[] = _(
    "지그제구리 쿠션\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_SPIN_CUSHION[] = _(
    "얼루기 쿠션\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_DIAMOND_CUSHION[] = _(
    "깜까미 쿠션\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_BALL_CUSHION[] = _(
    "볼 쿠션\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_GRASS_CUSHION[] = _(
    "풀마크 쿠션\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_FIRE_CUSHION[] = _(
    "불꽃마크 쿠션\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_WATER_CUSHION[] = _(
    "물마크 쿠션\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_SNORLAX_DOLL[] = _(
    "잠만보의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_RHYDON_DOLL[] = _(
    "코뿌리의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_LAPRAS_DOLL[] = _(
    "라프라스의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_VENUSAUR_DOLL[] = _(
    "이상해꽃의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_CHARIZARD_DOLL[] = _(
    "리자몽의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_BLASTOISE_DOLL[] = _(
    "거북왕의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_WAILMER_DOLL[] = _(
    "고래왕자의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_REGIROCK_DOLL[] = _(
    "레지락의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_REGICE_DOLL[] = _(
    "레지아이스의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");

const u8 DecorDesc_REGISTEEL_DOLL[] = _(
    "레지스틸의 봉제인형\n"
    "매트나 책상\n"
    "위에 놓는다");
# 45 "src/field/decoration.c" 2

const u16 DecorGfx_SMALL_DESK[] = {
    0x87
};

const u16 DecorGfx_POKEMON_DESK[] = {
    0x8F
};

const u16 DecorGfx_HEAVY_DESK[] = {
    0x90,
    0x91,
    0x92,
    0x98,
    0x99,
    0x9A
};

const u16 DecorGfx_RAGGED_DESK[] = {
    0x93,
    0x94,
    0x95,
    0x9B,
    0x9C,
    0x9D
};

const u16 DecorGfx_COMFORT_DESK[] = {
    0x96,
    0x97,
    0xA3,
    0x9E,
    0x9F,
    0xAB
};

const u16 DecorGfx_PRETTY_DESK[] = {
    0xBD,
    0xBE,
    0xBF,
    0xC5,
    0xC6,
    0xC7,
    0xCD,
    0xCE,
    0xCF
};

const u16 DecorGfx_BRICK_DESK[] = {
    0xA0,
    0xA1,
    0xA2,
    0xA8,
    0xA9,
    0xAA,
    0xB0,
    0xB1,
    0xB2
};

const u16 DecorGfx_CAMP_DESK[] = {
    0xA4,
    0xA5,
    0xA6,
    0xAC,
    0xAD,
    0xAE,
    0xB4,
    0xB5,
    0xB6
};

const u16 DecorGfx_HARD_DESK[] = {
    0xA7,
    0xBB,
    0xBC,
    0xAF,
    0xC3,
    0xC4,
    0xB7,
    0xCB,
    0xCC
};

const u16 DecorGfx_SMALL_CHAIR[] = {
    0xB8
};

const u16 DecorGfx_POKEMON_CHAIR[] = {
    0xB9
};

const u16 DecorGfx_HEAVY_CHAIR[] = {
    0xBA
};

const u16 DecorGfx_PRETTY_CHAIR[] = {
    0xC0
};

const u16 DecorGfx_COMFORT_CHAIR[] = {
    0xC1
};

const u16 DecorGfx_RAGGED_CHAIR[] = {
    0xC2
};

const u16 DecorGfx_BRICK_CHAIR[] = {
    0xC8
};

const u16 DecorGfx_CAMP_CHAIR[] = {
    0xC9
};

const u16 DecorGfx_HARD_CHAIR[] = {
    0xCA
};

const u16 DecorGfx_RED_PLANT[] = {
    0xD0,
    0xD8
};

const u16 DecorGfx_TROPICAL_PLANT[] = {
    0xD2,
    0xDA
};

const u16 DecorGfx_PRETTY_FLOWERS[] = {
    0xD4,
    0xDC
};

const u16 DecorGfx_COLORFUL_PLANT[] = {
    0xE0,
    0xE2,
    0xE8,
    0xE9
};

const u16 DecorGfx_BIG_PLANT[] = {
    0xE4,
    0xE6,
    0xEC,
    0xED
};

const u16 DecorGfx_GORGEOUS_PLANT[] = {
    0xF0,
    0xF2,
    0xF8,
    0xF9
};

const u16 DecorGfx_RED_BRICK[] = {
    0x25,
    0x2D
};

const u16 DecorGfx_YELLOW_BRICK[] = {
    0x26,
    0x2E
};

const u16 DecorGfx_BLUE_BRICK[] = {
    0x27,
    0x2F
};

const u16 DecorGfx_RED_BALLOON[] = {
    0x138
};

const u16 DecorGfx_BLUE_BALLOON[] = {
    0x13C
};

const u16 DecorGfx_YELLOW_BALLOON[] = {
    0x140
};

const u16 DecorGfx_RED_TENT[] = {
    0x30,
    0x31,
    0x32,
    0x38,
    0x39,
    0x3A,
    0x40,
    0x41,
    0x3B
};

const u16 DecorGfx_BLUE_TENT[] = {
    0x48,
    0x49,
    0x68,
    0x50,
    0x51,
    0x70,
    0x58,
    0x59,
    0x69
};

const u16 DecorGfx_SOLID_BOARD[] = {
    0x34,
    0x3C
};

const u16 DecorGfx_SLIDE[] = {
    0x35,
    0x36,
    0x3D,
    0x3E,
    0x63,
    0x64,
    0x6F,
    0x77
};

const u16 DecorGfx_FENCE_LENGTH[] = {
    0x33
};

const u16 DecorGfx_FENCE_WIDTH[] = {
    0x2C
};

const u16 DecorGfx_TIRE[] = {
    0x80,
    0x81,
    0x88,
    0x89
};

const u16 DecorGfx_STAND[] = {
    0x6A,
    0x6B,
    0x6C,
    0x6D,
    0x72,
    0x73,
    0x74,
    0x75
};

const u16 DecorGfx_MUD_BALL[] = {
    0x28
};

const u16 DecorGfx_BREAKABLE_DOOR[] = {
    0x37,
    0x3F
};

const u16 DecorGfx_SAND_ORNAMENT[] = {
    0x85,
    0x8D
};

const u16 DecorGfx_SILVER_SHIELD[] = {
    0xD6,
    0xDE
};

const u16 DecorGfx_GOLD_SHIELD[] = {
    0x12E,
    0x136
};

const u16 DecorGfx_GLASS_ORNAMENT[] = {
    0x82,
    0x8A
};

const u16 DecorGfx_TV[] = {
    0xF4
};

const u16 DecorGfx_ROUND_TV[] = {
    0xF5
};

const u16 DecorGfx_CUTE_TV[] = {
    0xF6
};

const u16 DecorGfx_GLITTER_MAT[] = {
    0x60
};

const u16 DecorGfx_JUMP_MAT[] = {
    0x61
};

const u16 DecorGfx_SPIN_MAT[] = {
    0x62
};

const u16 DecorGfx_C_LOW_NOTE_MAT[] = {
    0x78
};

const u16 DecorGfx_D_NOTE_MAT[] = {
    0x79
};

const u16 DecorGfx_E_NOTE_MAT[] = {
    0x7A
};

const u16 DecorGfx_F_NOTE_MAT[] = {
    0x7B
};

const u16 DecorGfx_G_NOTE_MAT[] = {
    0x7C
};

const u16 DecorGfx_A_NOTE_MAT[] = {
    0x7D
};

const u16 DecorGfx_B_NOTE_MAT[] = {
    0x7E
};

const u16 DecorGfx_C_HIGH_NOTE_MAT[] = {
    0xB3
};

const u16 DecorGfx_SURF_MAT[] = {
    0x42,
    0x43,
    0x44,
    0x4A,
    0x4B,
    0x4C,
    0x52,
    0x53,
    0x54
};

const u16 DecorGfx_THUNDER_MAT[] = {
    0x45,
    0x46,
    0x47,
    0x4D,
    0x4E,
    0x4F,
    0x55,
    0x56,
    0x57
};

const u16 DecorGfx_FIRE_BLAST_MAT[] = {
    0x5A,
    0x5B,
    0x5C,
    0x5D,
    0x5E,
    0x5F,
    0x65,
    0x66,
    0x67
};

const u16 DecorGfx_POWDER_SNOW_MAT[] = {
    0x100,
    0x101,
    0x102,
    0x108,
    0x109,
    0x10A,
    0x110,
    0x111,
    0x112
};

const u16 DecorGfx_ATTRACT_MAT[] = {
    0x103,
    0x104,
    0x105,
    0x10B,
    0x10C,
    0x10D,
    0x113,
    0x114,
    0x115
};

const u16 DecorGfx_FISSURE_MAT[] = {
    0x106,
    0x107,
    0x118,
    0x10E,
    0x10F,
    0x120,
    0x116,
    0x117,
    0x128
};

const u16 DecorGfx_SPIKES_MAT[] = {
    0x119,
    0x11A,
    0x11B,
    0x121,
    0x122,
    0x123,
    0x129,
    0x12A,
    0x12B
};

const u16 DecorGfx_BALL_POSTER[] = {
    0x130
};

const u16 DecorGfx_GREEN_POSTER[] = {
    0x131
};

const u16 DecorGfx_RED_POSTER[] = {
    0x132
};

const u16 DecorGfx_BLUE_POSTER[] = {
    0x133
};

const u16 DecorGfx_CUTE_POSTER[] = {
    0x134
};

const u16 DecorGfx_PIKA_POSTER[] = {
    0x11C,
    0x11D
};

const u16 DecorGfx_LONG_POSTER[] = {
    0x11E,
    0x11F
};

const u16 DecorGfx_SEA_POSTER[] = {
    0x124,
    0x125
};

const u16 DecorGfx_SKY_POSTER[] = {
    0x126,
    0x127
};

const u16 DecorGfx_KISS_POSTER[] = {
    0x12C,
    0x12D
};

const u16 DecorGfx_PICHU_DOLL[] = {
    MAP_OBJ_GFX_PICHU_DOLL
};

const u16 DecorGfx_PIKACHU_DOLL[] = {
    MAP_OBJ_GFX_PIKACHU_DOLL
};

const u16 DecorGfx_MARILL_DOLL[] = {
    MAP_OBJ_GFX_MARILL_DOLL
};

const u16 DecorGfx_TOGEPI_DOLL[] = {
    MAP_OBJ_GFX_TOGEPI_DOLL
};

const u16 DecorGfx_CYNDAQUIL_DOLL[] = {
    MAP_OBJ_GFX_CYNDAQUIL_DOLL
};

const u16 DecorGfx_CHIKORITA_DOLL[] = {
    MAP_OBJ_GFX_CHIKORITA_DOLL
};

const u16 DecorGfx_TOTODILE_DOLL[] = {
    MAP_OBJ_GFX_TOTODILE_DOLL
};

const u16 DecorGfx_JIGGLYPUFF_DOLL[] = {
    MAP_OBJ_GFX_JIGGLYPUFF_DOLL
};

const u16 DecorGfx_MEOWTH_DOLL[] = {
    MAP_OBJ_GFX_MEOWTH_DOLL
};

const u16 DecorGfx_CLEFAIRY_DOLL[] = {
    MAP_OBJ_GFX_CLEFAIRY_DOLL
};

const u16 DecorGfx_DITTO_DOLL[] = {
    MAP_OBJ_GFX_DITTO_DOLL
};

const u16 DecorGfx_SMOOCHUM_DOLL[] = {
    MAP_OBJ_GFX_SMOOCHUM_DOLL
};

const u16 DecorGfx_TREECKO_DOLL[] = {
    MAP_OBJ_GFX_TREECKO_DOLL
};

const u16 DecorGfx_TORCHIC_DOLL[] = {
    MAP_OBJ_GFX_TORCHIC_DOLL
};

const u16 DecorGfx_MUDKIP_DOLL[] = {
    MAP_OBJ_GFX_MUDKIP_DOLL
};

const u16 DecorGfx_DUSKULL_DOLL[] = {
    MAP_OBJ_GFX_DUSKULL_DOLL
};

const u16 DecorGfx_WYNAUT_DOLL[] = {
    MAP_OBJ_GFX_WYNAUT_DOLL
};

const u16 DecorGfx_BALTOY_DOLL[] = {
    MAP_OBJ_GFX_BALTOY_DOLL
};

const u16 DecorGfx_KECLEON_DOLL[] = {
    MAP_OBJ_GFX_KECLEON_DOLL
};

const u16 DecorGfx_AZURILL_DOLL[] = {
    MAP_OBJ_GFX_AZURILL_DOLL
};

const u16 DecorGfx_SKITTY_DOLL[] = {
    MAP_OBJ_GFX_SKITTY_DOLL
};

const u16 DecorGfx_SWABLU_DOLL[] = {
    MAP_OBJ_GFX_SWABLU_DOLL
};

const u16 DecorGfx_GULPIN_DOLL[] = {
    MAP_OBJ_GFX_GULPIN_DOLL
};

const u16 DecorGfx_LOTAD_DOLL[] = {
    MAP_OBJ_GFX_LOTAD_DOLL
};

const u16 DecorGfx_SEEDOT_DOLL[] = {
    MAP_OBJ_GFX_SEEDOT_DOLL
};

const u16 DecorGfx_PIKA_CUSHION[] = {
    MAP_OBJ_GFX_PIKA_CUSHION
};

const u16 DecorGfx_ROUND_CUSHION[] = {
    MAP_OBJ_GFX_ROUND_CUSHION
};

const u16 DecorGfx_KISS_CUSHION[] = {
    MAP_OBJ_GFX_KISS_CUSHION
};

const u16 DecorGfx_ZIGZAG_CUSHION[] = {
    MAP_OBJ_GFX_ZIGZAG_CUSHION
};

const u16 DecorGfx_SPIN_CUSHION[] = {
    MAP_OBJ_GFX_SPIN_CUSHION
};

const u16 DecorGfx_DIAMOND_CUSHION[] = {
    MAP_OBJ_GFX_DIAMOND_CUSHION
};

const u16 DecorGfx_BALL_CUSHION[] = {
    MAP_OBJ_GFX_BALL_CUSHION
};

const u16 DecorGfx_GRASS_CUSHION[] = {
    MAP_OBJ_GFX_GRASS_CUSHION
};

const u16 DecorGfx_FIRE_CUSHION[] = {
    MAP_OBJ_GFX_FIRE_CUSHION
};

const u16 DecorGfx_WATER_CUSHION[] = {
    MAP_OBJ_GFX_WATER_CUSHION
};

const u16 DecorGfx_SNORLAX_DOLL[] = {
    MAP_OBJ_GFX_BIG_SNORLAX_DOLL
};

const u16 DecorGfx_RHYDON_DOLL[] = {
    MAP_OBJ_GFX_BIG_RHYDON_DOLL
};

const u16 DecorGfx_LAPRAS_DOLL[] = {
    MAP_OBJ_GFX_BIG_LAPRAS_DOLL
};

const u16 DecorGfx_VENUSAUR_DOLL[] = {
    MAP_OBJ_GFX_BIG_VENUSAUR_DOLL
};

const u16 DecorGfx_CHARIZARD_DOLL[] = {
    MAP_OBJ_GFX_BIG_CHARIZARD_DOLL
};

const u16 DecorGfx_BLASTOISE_DOLL[] = {
    MAP_OBJ_GFX_BIG_BLASTOISE_DOLL
};

const u16 DecorGfx_WAILMER_DOLL[] = {
    MAP_OBJ_GFX_BIG_WAILMER_DOLL
};

const u16 DecorGfx_REGIROCK_DOLL[] = {
    MAP_OBJ_GFX_BIG_REGIROCK_DOLL
};

const u16 DecorGfx_REGICE_DOLL[] = {
    MAP_OBJ_GFX_BIG_REGICE_DOLL
};

const u16 DecorGfx_REGISTEEL_DOLL[] = {
    MAP_OBJ_GFX_BIG_REGISTEEL_DOLL
};

# 1 "src/field/../data/decoration_names.h" 1
const struct Decoration gDecorations[] = {
    {DECOR_NONE, _("작은 책상"), DECORPERM_SOLID_FLOOR, DECORSHAPE_1x1, DECORCAT_DESK, 0, DecorDesc_SMALL_DESK, DecorGfx_SMALL_DESK},
    {DECOR_SMALL_DESK, _("작은 책상"), DECORPERM_SOLID_FLOOR, DECORSHAPE_1x1, DECORCAT_DESK, 3000, DecorDesc_SMALL_DESK, DecorGfx_SMALL_DESK},
    {DECOR_POKEMON_DESK, _("포켓몬책상"), DECORPERM_SOLID_FLOOR, DECORSHAPE_1x1, DECORCAT_DESK, 3000, DecorDesc_POKEMON_DESK, DecorGfx_POKEMON_DESK},
    {DECOR_HEAVY_DESK, _("묵직한 책상"), DECORPERM_SOLID_FLOOR, DECORSHAPE_3x2, DECORCAT_DESK, 6000, DecorDesc_HEAVY_DESK, DecorGfx_HEAVY_DESK},
    {DECOR_RAGGED_DESK, _("울퉁불퉁책상"), DECORPERM_SOLID_FLOOR, DECORSHAPE_3x2, DECORCAT_DESK, 6000, DecorDesc_RAGGED_DESK, DecorGfx_RAGGED_DESK},
    {DECOR_COMFORT_DESK, _("푹신푹신책상"), DECORPERM_SOLID_FLOOR, DECORSHAPE_3x2, DECORCAT_DESK, 6000, DecorDesc_COMFORT_DESK, DecorGfx_COMFORT_DESK},
    {DECOR_PRETTY_DESK, _("고운 책상"), DECORPERM_SOLID_FLOOR, DECORSHAPE_3x3, DECORCAT_DESK, 9000, DecorDesc_PRETTY_DESK, DecorGfx_PRETTY_DESK},
    {DECOR_BRICK_DESK, _("벽돌책상"), DECORPERM_SOLID_FLOOR, DECORSHAPE_3x3, DECORCAT_DESK, 9000, DecorDesc_BRICK_DESK, DecorGfx_BRICK_DESK},
    {DECOR_CAMP_DESK, _("캠프책상"), DECORPERM_SOLID_FLOOR, DECORSHAPE_3x3, DECORCAT_DESK, 9000, DecorDesc_CAMP_DESK, DecorGfx_CAMP_DESK},
    {DECOR_HARD_DESK, _("딱딱한 책상"), DECORPERM_SOLID_FLOOR, DECORSHAPE_3x3, DECORCAT_DESK, 9000, DecorDesc_HARD_DESK, DecorGfx_HARD_DESK},
    {DECOR_SMALL_CHAIR, _("작은 의자"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_CHAIR, 2000, DecorDesc_SMALL_CHAIR, DecorGfx_SMALL_CHAIR},
    {DECOR_POKEMON_CHAIR, _("포켓몬의자"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_CHAIR, 2000, DecorDesc_POKEMON_CHAIR, DecorGfx_POKEMON_CHAIR},
    {DECOR_HEAVY_CHAIR, _("묵직한 의자"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_CHAIR, 2000, DecorDesc_HEAVY_CHAIR, DecorGfx_HEAVY_CHAIR},
    {DECOR_PRETTY_CHAIR, _("고운 의자"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_CHAIR, 2000, DecorDesc_PRETTY_CHAIR, DecorGfx_PRETTY_CHAIR},
    {DECOR_COMFORT_CHAIR, _("푹신푹신의자"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_CHAIR, 2000, DecorDesc_COMFORT_CHAIR, DecorGfx_COMFORT_CHAIR},
    {DECOR_RAGGED_CHAIR, _("울퉁불퉁의자"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_CHAIR, 2000, DecorDesc_RAGGED_CHAIR, DecorGfx_RAGGED_CHAIR},
    {DECOR_BRICK_CHAIR, _("벽돌의자"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_CHAIR, 2000, DecorDesc_BRICK_CHAIR, DecorGfx_BRICK_CHAIR},
    {DECOR_CAMP_CHAIR, _("캠프의자"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_CHAIR, 2000, DecorDesc_CAMP_CHAIR, DecorGfx_CAMP_CHAIR},
    {DECOR_HARD_CHAIR, _("딱딱한 의자"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_CHAIR, 2000, DecorDesc_HARD_CHAIR, DecorGfx_HARD_CHAIR},
    {DECOR_RED_PLANT, _("새빨간 화분"), DECORPERM_BEHIND_FLOOR, DECORSHAPE_1x2, DECORCAT_PLANT, 3000, DecorDesc_RED_PLANT, DecorGfx_RED_PLANT},
    {DECOR_TROPICAL_PLANT, _("남국의 화분"), DECORPERM_BEHIND_FLOOR, DECORSHAPE_1x2, DECORCAT_PLANT, 3000, DecorDesc_TROPICAL_PLANT, DecorGfx_TROPICAL_PLANT},
    {DECOR_PRETTY_FLOWERS, _("귀여운 꽃"), DECORPERM_BEHIND_FLOOR, DECORSHAPE_1x2, DECORCAT_PLANT, 3000, DecorDesc_PRETTY_FLOWERS, DecorGfx_PRETTY_FLOWERS},
    {DECOR_COLORFUL_PLANT, _("컬러풀 화분"), DECORPERM_BEHIND_FLOOR, DECORSHAPE_2x2, DECORCAT_PLANT, 5000, DecorDesc_COLORFUL_PLANT, DecorGfx_COLORFUL_PLANT},
    {DECOR_BIG_PLANT, _("큰 화분"), DECORPERM_BEHIND_FLOOR, DECORSHAPE_2x2, DECORCAT_PLANT, 5000, DecorDesc_BIG_PLANT, DecorGfx_BIG_PLANT},
    {DECOR_GORGEOUS_PLANT, _("훌륭한 화분"), DECORPERM_BEHIND_FLOOR, DECORSHAPE_2x2, DECORCAT_PLANT, 5000, DecorDesc_GORGEOUS_PLANT, DecorGfx_GORGEOUS_PLANT},
    {DECOR_RED_BRICK, _("빨강벽돌"), DECORPERM_SOLID_FLOOR, DECORSHAPE_1x2, DECORCAT_ORNAMENT, 500, DecorDesc_RED_BRICK, DecorGfx_RED_BRICK},
    {DECOR_YELLOW_BRICK, _("노랑벽돌"), DECORPERM_SOLID_FLOOR, DECORSHAPE_1x2, DECORCAT_ORNAMENT, 500, DecorDesc_YELLOW_BRICK, DecorGfx_YELLOW_BRICK},
    {DECOR_BLUE_BRICK, _("파랑벽돌"), DECORPERM_SOLID_FLOOR, DECORSHAPE_1x2, DECORCAT_ORNAMENT, 500, DecorDesc_BLUE_BRICK, DecorGfx_BLUE_BRICK},
    {DECOR_RED_BALLOON, _("빨강풍선"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_ORNAMENT, 500, DecorDesc_RED_BALLOON, DecorGfx_RED_BALLOON},
    {DECOR_BLUE_BALLOON, _("파랑풍선"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_ORNAMENT, 500, DecorDesc_BLUE_BALLOON, DecorGfx_BLUE_BALLOON},
    {DECOR_YELLOW_BALLOON, _("노랑풍선"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_ORNAMENT, 500, DecorDesc_YELLOW_BALLOON, DecorGfx_YELLOW_BALLOON},
    {DECOR_RED_TENT, _("빨강텐트"), DECORPERM_PASS_FLOOR, DECORSHAPE_3x3, DECORCAT_ORNAMENT, 10000, DecorDesc_RED_TENT, DecorGfx_RED_TENT},
    {DECOR_BLUE_TENT, _("파랑텐트"), DECORPERM_PASS_FLOOR, DECORSHAPE_3x3, DECORCAT_ORNAMENT, 10000, DecorDesc_BLUE_TENT, DecorGfx_BLUE_TENT},
    {DECOR_SOLID_BOARD, _("단단한 판자"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x2, DECORCAT_ORNAMENT, 3000, DecorDesc_SOLID_BOARD, DecorGfx_SOLID_BOARD},
    {DECOR_SLIDE, _("미끄럼대"), DECORPERM_PASS_FLOOR, DECORSHAPE_2x4, DECORCAT_ORNAMENT, 8000, DecorDesc_SLIDE, DecorGfx_SLIDE},
    {DECOR_FENCE_LENGTH, _("세로울타리"), DECORPERM_SOLID_FLOOR, DECORSHAPE_1x1, DECORCAT_ORNAMENT, 500, DecorDesc_FENCE_LENGTH, DecorGfx_FENCE_LENGTH},
    {DECOR_FENCE_WIDTH, _("가로울타리"), DECORPERM_SOLID_FLOOR, DECORSHAPE_1x1, DECORCAT_ORNAMENT, 500, DecorDesc_FENCE_WIDTH, DecorGfx_FENCE_WIDTH},
    {DECOR_TIRE, _("타이어"), DECORPERM_SOLID_FLOOR, DECORSHAPE_2x2, DECORCAT_ORNAMENT, 800, DecorDesc_TIRE, DecorGfx_TIRE},
    {DECOR_STAND, _("큰 받침대"), DECORPERM_PASS_FLOOR, DECORSHAPE_4x2, DECORCAT_ORNAMENT, 7000, DecorDesc_STAND, DecorGfx_STAND},
    {DECOR_MUD_BALL, _("진흙경단"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_ORNAMENT, 200, DecorDesc_MUD_BALL, DecorGfx_MUD_BALL},
    {DECOR_BREAKABLE_DOOR, _("부서지는 도어"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x2, DECORCAT_ORNAMENT, 3000, DecorDesc_BREAKABLE_DOOR, DecorGfx_BREAKABLE_DOOR},
    {DECOR_SAND_ORNAMENT, _("모래장식품"), DECORPERM_BEHIND_FLOOR, DECORSHAPE_1x2, DECORCAT_ORNAMENT, 3000, DecorDesc_SAND_ORNAMENT, DecorGfx_SAND_ORNAMENT},
    {DECOR_SILVER_SHIELD, _("은상패"), DECORPERM_BEHIND_FLOOR, DECORSHAPE_1x2, DECORCAT_ORNAMENT, 0, DecorDesc_SILVER_SHIELD, DecorGfx_SILVER_SHIELD},
    {DECOR_GOLD_SHIELD, _("금상패"), DECORPERM_BEHIND_FLOOR, DECORSHAPE_1x2, DECORCAT_ORNAMENT, 0, DecorDesc_GOLD_SHIELD, DecorGfx_GOLD_SHIELD},
    {DECOR_GLASS_ORNAMENT, _("글라스오브제"), DECORPERM_BEHIND_FLOOR, DECORSHAPE_1x2, DECORCAT_ORNAMENT, 0, DecorDesc_GLASS_ORNAMENT, DecorGfx_GLASS_ORNAMENT},
    {DECOR_TV, _("TV"), DECORPERM_SOLID_FLOOR, DECORSHAPE_1x1, DECORCAT_ORNAMENT, 3000, DecorDesc_TV, DecorGfx_TV},
    {DECOR_ROUND_TV, _("둥근 TV"), DECORPERM_SOLID_FLOOR, DECORSHAPE_1x1, DECORCAT_ORNAMENT, 4000, DecorDesc_ROUND_TV, DecorGfx_ROUND_TV},
    {DECOR_CUTE_TV, _("귀여운 TV"), DECORPERM_SOLID_FLOOR, DECORSHAPE_1x1, DECORCAT_ORNAMENT, 4000, DecorDesc_CUTE_TV, DecorGfx_CUTE_TV},
    {DECOR_GLITTER_MAT, _("반짝반짝매트"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_MAT, 2000, DecorDesc_GLITTER_MAT, DecorGfx_GLITTER_MAT},
    {DECOR_JUMP_MAT, _("점프매트"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_MAT, 2000, DecorDesc_JUMP_MAT, DecorGfx_JUMP_MAT},
    {DECOR_SPIN_MAT, _("뱅그르매트"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_MAT, 2000, DecorDesc_SPIN_MAT, DecorGfx_SPIN_MAT},
    {DECOR_C_LOW_NOTE_MAT, _("음표매트CL"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_MAT, 500, DecorDesc_C_LOW_NOTE_MAT, DecorGfx_C_LOW_NOTE_MAT},
    {DECOR_D_NOTE_MAT, _("음표매트D"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_MAT, 500, DecorDesc_D_NOTE_MAT, DecorGfx_D_NOTE_MAT},
    {DECOR_E_NOTE_MAT, _("음표매트E"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_MAT, 500, DecorDesc_E_NOTE_MAT, DecorGfx_E_NOTE_MAT},
    {DECOR_F_NOTE_MAT, _("음표매트F"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_MAT, 500, DecorDesc_F_NOTE_MAT, DecorGfx_F_NOTE_MAT},
    {DECOR_G_NOTE_MAT, _("음표매트G"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_MAT, 500, DecorDesc_G_NOTE_MAT, DecorGfx_G_NOTE_MAT},
    {DECOR_A_NOTE_MAT, _("음표매트A"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_MAT, 500, DecorDesc_A_NOTE_MAT, DecorGfx_A_NOTE_MAT},
    {DECOR_B_NOTE_MAT, _("음표매트B"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_MAT, 500, DecorDesc_B_NOTE_MAT, DecorGfx_B_NOTE_MAT},
    {DECOR_C_HIGH_NOTE_MAT, _("음표매트CH"), DECORPERM_PASS_FLOOR, DECORSHAPE_1x1, DECORCAT_MAT, 500, DecorDesc_C_HIGH_NOTE_MAT, DecorGfx_C_HIGH_NOTE_MAT},
    {DECOR_SURF_MAT, _("파도타기매트"), DECORPERM_PASS_FLOOR, DECORSHAPE_3x3, DECORCAT_MAT, 4000, DecorDesc_SURF_MAT, DecorGfx_SURF_MAT},
    {DECOR_THUNDER_MAT, _("번개매트"), DECORPERM_PASS_FLOOR, DECORSHAPE_3x3, DECORCAT_MAT, 4000, DecorDesc_THUNDER_MAT, DecorGfx_THUNDER_MAT},
    {DECOR_FIRE_BLAST_MAT, _("불대문자매트"), DECORPERM_PASS_FLOOR, DECORSHAPE_3x3, DECORCAT_MAT, 4000, DecorDesc_FIRE_BLAST_MAT, DecorGfx_FIRE_BLAST_MAT},
    {DECOR_POWDER_SNOW_MAT, _("눈싸라기매트"), DECORPERM_PASS_FLOOR, DECORSHAPE_3x3, DECORCAT_MAT, 4000, DecorDesc_POWDER_SNOW_MAT, DecorGfx_POWDER_SNOW_MAT},
    {DECOR_ATTRACT_MAT, _("헤롱헤롱매트"), DECORPERM_PASS_FLOOR, DECORSHAPE_3x3, DECORCAT_MAT, 4000, DecorDesc_ATTRACT_MAT, DecorGfx_ATTRACT_MAT},
    {DECOR_FISSURE_MAT, _("땅가르기매트"), DECORPERM_PASS_FLOOR, DECORSHAPE_3x3, DECORCAT_MAT, 4000, DecorDesc_FISSURE_MAT, DecorGfx_FISSURE_MAT},
    {DECOR_SPIKES_MAT, _("압정뿌리기매트"), DECORPERM_PASS_FLOOR, DECORSHAPE_3x3, DECORCAT_MAT, 4000, DecorDesc_SPIKES_MAT, DecorGfx_SPIKES_MAT},
    {DECOR_BALL_POSTER, _("볼포스터"), DECORPERM_NA_WALL, DECORSHAPE_1x1, DECORCAT_POSTER, 1000, DecorDesc_BALL_POSTER, DecorGfx_BALL_POSTER},
    {DECOR_GREEN_POSTER, _("초록포스터"), DECORPERM_NA_WALL, DECORSHAPE_1x1, DECORCAT_POSTER, 1000, DecorDesc_GREEN_POSTER, DecorGfx_GREEN_POSTER},
    {DECOR_RED_POSTER, _("빨강포스터"), DECORPERM_NA_WALL, DECORSHAPE_1x1, DECORCAT_POSTER, 1000, DecorDesc_RED_POSTER, DecorGfx_RED_POSTER},
    {DECOR_BLUE_POSTER, _("옥색포스터"), DECORPERM_NA_WALL, DECORSHAPE_1x1, DECORCAT_POSTER, 1000, DecorDesc_BLUE_POSTER, DecorGfx_BLUE_POSTER},
    {DECOR_CUTE_POSTER, _("귀여운 포스터"), DECORPERM_NA_WALL, DECORSHAPE_1x1, DECORCAT_POSTER, 1000, DecorDesc_CUTE_POSTER, DecorGfx_CUTE_POSTER},
    {DECOR_PIKA_POSTER, _("번쩍번쩍포스터"), DECORPERM_NA_WALL, DECORSHAPE_2x1, DECORCAT_POSTER, 1500, DecorDesc_PIKA_POSTER, DecorGfx_PIKA_POSTER},
    {DECOR_LONG_POSTER, _("긴 포스터"), DECORPERM_NA_WALL, DECORSHAPE_2x1, DECORCAT_POSTER, 1500, DecorDesc_LONG_POSTER, DecorGfx_LONG_POSTER},
    {DECOR_SEA_POSTER, _("바다포스터"), DECORPERM_NA_WALL, DECORSHAPE_2x1, DECORCAT_POSTER, 1500, DecorDesc_SEA_POSTER, DecorGfx_SEA_POSTER},
    {DECOR_SKY_POSTER, _("하늘포스터"), DECORPERM_NA_WALL, DECORSHAPE_2x1, DECORCAT_POSTER, 1500, DecorDesc_SKY_POSTER, DecorGfx_SKY_POSTER},
    {DECOR_KISS_POSTER, _("키스포스터"), DECORPERM_NA_WALL, DECORSHAPE_2x1, DECORCAT_POSTER, 1500, DecorDesc_KISS_POSTER, DecorGfx_KISS_POSTER},
    {DECOR_PICHU_DOLL, _("피츄인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_PICHU_DOLL, DecorGfx_PICHU_DOLL},
    {DECOR_PIKACHU_DOLL, _("피카츄인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_PIKACHU_DOLL, DecorGfx_PIKACHU_DOLL},
    {DECOR_MARILL_DOLL, _("마릴인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_MARILL_DOLL, DecorGfx_MARILL_DOLL},
    {DECOR_TOGEPI_DOLL, _("토게피인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_TOGEPI_DOLL, DecorGfx_TOGEPI_DOLL},
    {DECOR_CYNDAQUIL_DOLL, _("브케인인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_CYNDAQUIL_DOLL, DecorGfx_CYNDAQUIL_DOLL},
    {DECOR_CHIKORITA_DOLL, _("치코리타인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_CHIKORITA_DOLL, DecorGfx_CHIKORITA_DOLL},
    {DECOR_TOTODILE_DOLL, _("리아코인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_TOTODILE_DOLL, DecorGfx_TOTODILE_DOLL},
    {DECOR_JIGGLYPUFF_DOLL, _("푸린인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_JIGGLYPUFF_DOLL, DecorGfx_JIGGLYPUFF_DOLL},
    {DECOR_MEOWTH_DOLL, _("나옹인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_MEOWTH_DOLL, DecorGfx_MEOWTH_DOLL},
    {DECOR_CLEFAIRY_DOLL, _("삐삐인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_CLEFAIRY_DOLL, DecorGfx_CLEFAIRY_DOLL},
    {DECOR_DITTO_DOLL, _("메타몽인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_DITTO_DOLL, DecorGfx_DITTO_DOLL},
    {DECOR_SMOOCHUM_DOLL, _("뽀뽀라인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_SMOOCHUM_DOLL, DecorGfx_SMOOCHUM_DOLL},
    {DECOR_TREECKO_DOLL, _("나무지기인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_TREECKO_DOLL, DecorGfx_TREECKO_DOLL},
    {DECOR_TORCHIC_DOLL, _("아차모인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_TORCHIC_DOLL, DecorGfx_TORCHIC_DOLL},
    {DECOR_MUDKIP_DOLL, _("물짱이인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_MUDKIP_DOLL, DecorGfx_MUDKIP_DOLL},
    {DECOR_DUSKULL_DOLL, _("해골몽인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_DUSKULL_DOLL, DecorGfx_DUSKULL_DOLL},
    {DECOR_WYNAUT_DOLL, _("마자인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_WYNAUT_DOLL, DecorGfx_WYNAUT_DOLL},
    {DECOR_BALTOY_DOLL, _("오뚝군인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_BALTOY_DOLL, DecorGfx_BALTOY_DOLL},
    {DECOR_KECLEON_DOLL, _("켈리몬인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_KECLEON_DOLL, DecorGfx_KECLEON_DOLL},
    {DECOR_AZURILL_DOLL, _("루리리인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_AZURILL_DOLL, DecorGfx_AZURILL_DOLL},
    {DECOR_SKITTY_DOLL, _("에나비인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_SKITTY_DOLL, DecorGfx_SKITTY_DOLL},
    {DECOR_SWABLU_DOLL, _("파비코인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_SWABLU_DOLL, DecorGfx_SWABLU_DOLL},
    {DECOR_GULPIN_DOLL, _("꼴깍몬인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_GULPIN_DOLL, DecorGfx_GULPIN_DOLL},
    {DECOR_LOTAD_DOLL, _("연꽃몬인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_LOTAD_DOLL, DecorGfx_LOTAD_DOLL},
    {DECOR_SEEDOT_DOLL, _("도토링인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_DOLL, 3000, DecorDesc_SEEDOT_DOLL, DecorGfx_SEEDOT_DOLL},
    {DECOR_PIKA_CUSHION, _("번쩍쿠션"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_CUSHION, 2000, DecorDesc_PIKA_CUSHION, DecorGfx_PIKA_CUSHION},
    {DECOR_ROUND_CUSHION, _("둥근 쿠션"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_CUSHION, 2000, DecorDesc_ROUND_CUSHION, DecorGfx_ROUND_CUSHION},
    {DECOR_KISS_CUSHION, _("키스쿠션"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_CUSHION, 2000, DecorDesc_KISS_CUSHION, DecorGfx_KISS_CUSHION},
    {DECOR_ZIGZAG_CUSHION, _("지그재그쿠션"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_CUSHION, 2000, DecorDesc_ZIGZAG_CUSHION, DecorGfx_ZIGZAG_CUSHION},
    {DECOR_SPIN_CUSHION, _("빙그르쿠션"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_CUSHION, 2000, DecorDesc_SPIN_CUSHION, DecorGfx_SPIN_CUSHION},
    {DECOR_DIAMOND_CUSHION, _("다이아쿠션"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_CUSHION, 2000, DecorDesc_DIAMOND_CUSHION, DecorGfx_DIAMOND_CUSHION},
    {DECOR_BALL_CUSHION, _("볼쿠션"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_CUSHION, 2000, DecorDesc_BALL_CUSHION, DecorGfx_BALL_CUSHION},
    {DECOR_GRASS_CUSHION, _("풀쿠션"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_CUSHION, 2000, DecorDesc_GRASS_CUSHION, DecorGfx_GRASS_CUSHION},
    {DECOR_FIRE_CUSHION, _("불꽃쿠션"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_CUSHION, 2000, DecorDesc_FIRE_CUSHION, DecorGfx_FIRE_CUSHION},
    {DECOR_WATER_CUSHION, _("물쿠션"), DECORPERM_SOLID_MAT, DECORSHAPE_1x1, DECORCAT_CUSHION, 2000, DecorDesc_WATER_CUSHION, DecorGfx_WATER_CUSHION},
    {DECOR_SNORLAX_DOLL, _("잠만보인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x2, DECORCAT_DOLL, 10000, DecorDesc_SNORLAX_DOLL, DecorGfx_SNORLAX_DOLL},
    {DECOR_RHYDON_DOLL, _("코뿌리인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x2, DECORCAT_DOLL, 10000, DecorDesc_RHYDON_DOLL, DecorGfx_RHYDON_DOLL},
    {DECOR_LAPRAS_DOLL, _("라프라스인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x2, DECORCAT_DOLL, 10000, DecorDesc_LAPRAS_DOLL, DecorGfx_LAPRAS_DOLL},
    {DECOR_VENUSAUR_DOLL, _("이상해꽃인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x2, DECORCAT_DOLL, 10000, DecorDesc_VENUSAUR_DOLL, DecorGfx_VENUSAUR_DOLL},
    {DECOR_CHARIZARD_DOLL, _("리자몽인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x2, DECORCAT_DOLL, 10000, DecorDesc_CHARIZARD_DOLL, DecorGfx_CHARIZARD_DOLL},
    {DECOR_BLASTOISE_DOLL, _("거북왕인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x2, DECORCAT_DOLL, 10000, DecorDesc_BLASTOISE_DOLL, DecorGfx_BLASTOISE_DOLL},
    {DECOR_WAILMER_DOLL, _("고래왕자인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x2, DECORCAT_DOLL, 10000, DecorDesc_WAILMER_DOLL, DecorGfx_WAILMER_DOLL},
    {DECOR_REGIROCK_DOLL, _("레지락인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x2, DECORCAT_DOLL, 10000, DecorDesc_REGIROCK_DOLL, DecorGfx_REGIROCK_DOLL},
    {DECOR_REGICE_DOLL, _("레지아이스인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x2, DECORCAT_DOLL, 10000, DecorDesc_REGICE_DOLL, DecorGfx_REGICE_DOLL},
    {DECOR_REGISTEEL_DOLL, _("레지스틸인형"), DECORPERM_SOLID_MAT, DECORSHAPE_1x2, DECORCAT_DOLL, 10000, DecorDesc_REGISTEEL_DOLL, DecorGfx_REGISTEEL_DOLL}
};
# 689 "src/field/decoration.c" 2

const u8 *const gUnknown_083EC5E4[] = {
    SecretBaseText_Desk,
    SecretBaseText_Chair,
    SecretBaseText_Plant,
    SecretBaseText_Ornament,
    SecretBaseText_Mat,
    SecretBaseText_Poster,
    SecretBaseText_Doll,
    SecretBaseText_Cushion
};

const struct MenuAction2 gUnknown_083EC604[] = {
    {SecretBaseText_Decorate, sub_80FF160},
    {SecretBaseText_PutAway, sub_8100A0C},
    {SecretBaseText_Toss, sub_8101700},
    {gUnknownText_Exit, gpu_pal_decompress_alloc_tag_and_upload}
};

const u8 *const gUnknown_083EC624[] = {
    SecretBaseText_PutOutDecor,
    SecretBaseText_StoreChosenDecor,
    SecretBaseText_ThrowAwayDecor,
    gMenuText_GoBackToPrev
};

const struct YesNoFuncTable gUnknown_083EC634[] = {
    {sub_80FF5BC, sub_80FF058},
    {sub_81017A0, sub_80FF058},
    {sub_81017A0, sub_80FF058},
    {sub_8109D04, sub_80FF058}
};

const u16 gUnknown_083EC654[] = {0x6318, 0x739C, 0x7FFF};
const u8 gUnknown_083EC65A[] = _("{PALETTE 13}{STR_VAR_1}");

const u8 Unknown_3EC660[] = {0, 1, 2, 3};
const u8 Unknown_3EC664[] = {0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13};
const u8 Unknown_3EC670[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
const u8 Unknown_3EC680[] = {0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21};
const u8 Unknown_3EC68C[] = {0, 1, 2, 3, 4, 5, 6, 7};
const u8 Unknown_3EC694[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31};
const u8 Unknown_3EC6B4[] = {0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 20, 21, 24, 25, 26, 27, 28, 29, 32, 33, 34, 35, 36, 37, 40, 41, 42, 43, 44, 45};
const u8 Unknown_3EC6D8[] = {0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 20, 21, 24, 25, 26, 27, 28, 29};

const u8 Unknown_3EC6F0[] = {0, 0, 0, 0};
const u8 Unknown_3EC6F4[] = {0, 0, 1, 1, 0, 0, 1, 1};
const u8 Unknown_3EC6FC[] = {0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2};
const u8 Unknown_3EC708[] = {0, 0, 1, 1, 2, 2, 3, 3, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 4, 4, 5, 5, 6, 6, 7, 7};
const u8 Unknown_3EC728[] = {0, 0, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 2, 2, 3, 3};
const u8 Unknown_3EC738[] = {0, 0, 0, 0, 1, 1, 1, 1};
const u8 Unknown_3EC740[] = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2};
const u8 Unknown_3EC74C[] = {0, 0, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 2, 2, 3, 3, 4, 4, 5, 5, 4, 4, 5, 5, 6, 6, 7, 7, 6, 6, 7, 7};
const u8 Unknown_3EC76C[] = {0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 6, 6, 7, 7, 8, 8};
const u8 Unknown_3EC790[] = {0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 3, 3, 4, 4, 5, 5};

const u8 Unknown_3EC7A8[] = {4, 5, 6, 7};
const u8 Unknown_3EC7AC[] = {4, 5, 4, 5, 6, 7, 6, 7};
const u8 Unknown_3EC7B4[] = {4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7};
const u8 Unknown_3EC7C0[] = {4, 5, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 6, 7};
const u8 Unknown_3EC7E0[] = {4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7};
const u8 Unknown_3EC7F0[] = {4, 5, 6, 7, 4, 5, 6, 7};
const u8 Unknown_3EC7F8[] = {4, 5, 6, 7, 4, 5, 6, 7, 4, 5, 6, 7};
const u8 Unknown_3EC804[] = {4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7, 4, 5, 4, 5, 6, 7, 6, 7};
const u8 Unknown_3EC824[] = {4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7};
const u8 Unknown_3EC848[] = {4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7, 4, 5, 4, 5, 4, 5, 6, 7, 6, 7, 6, 7};

const struct UnkStruct_803EC860 gUnknown_083EC860[] = {
    {Unknown_3EC660, Unknown_3EC6F0, Unknown_3EC7A8, 0x4},
    {Unknown_3EC68C, Unknown_3EC6F4, Unknown_3EC7AC, 0x8},
    {Unknown_3EC664, Unknown_3EC6FC, Unknown_3EC7B4, 0xc},
    {Unknown_3EC694, Unknown_3EC708, Unknown_3EC7C0, 0x20},
    {Unknown_3EC670, Unknown_3EC728, Unknown_3EC7E0, 0x10},
    {Unknown_3EC68C, Unknown_3EC738, Unknown_3EC7F0, 0x8},
    {Unknown_3EC680, Unknown_3EC740, Unknown_3EC7F8, 0xc},
    {Unknown_3EC694, Unknown_3EC74C, Unknown_3EC804, 0x20},
    {Unknown_3EC6B4, Unknown_3EC76C, Unknown_3EC824, 0x24},
    {Unknown_3EC6D8, Unknown_3EC790, Unknown_3EC848, 0x18}
};

const struct UnkStruct_083EC900 gUnknown_083EC900[] = {
    {0, 1, 0x78, 0x4e},
    {1, 2, 0x80, 0x4e},
    {1, 3, 0x90, 0x56},
    {1, 3, 0x90, 0x46},
    {0, 2, 0x80, 0x46},
    {2, 2, 0x78, 0x46},
    {2, 3, 0x80, 0x56},
    {2, 3, 0x80, 0x36},
    {0, 3, 0x90, 0x46},
    {1, 3, 0x90, 0x46}
};

const union AnimCmd gSpriteAnim_83EC928[] = {
    {.frame = {.imageValue = 0, .duration = 0}},
    {.type = -1}
};

const union AnimCmd *const gSpriteAnimTable_83EC930[] = {
    gSpriteAnim_83EC928
};

const struct SpriteFrameImage gSpriteImageTable_83EC934[] = {
    {.data = gUnknown_02038900.image, .size = sizeof(gUnknown_02038900.image)}
};

const struct SpriteTemplate gSpriteTemplate_83EC93C = {
    .tileTag = 0xffff,
    .paletteTag = 3000,
    .oam = &gUnknown_020391AC,
    .anims = gSpriteAnimTable_83EC930,
    .images = gSpriteImageTable_83EC934,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_81009A8
};

const struct SpritePalette gUnknown_083EC954 = {.data = (u16 *)&gUnknown_02038900.palette, .tag = 3000};

const struct YesNoFuncTable gUnknown_083EC95C = {.yesFunc = sub_81000C4, .noFunc = sub_810065C};
const struct YesNoFuncTable gUnknown_083EC964 = {.yesFunc = sub_810026C, .noFunc = sub_810065C};
const struct YesNoFuncTable gUnknown_083EC96C[] = {
    {.yesFunc = sub_80FFAB0, .noFunc = sub_80FFB08},
    {.yesFunc = sub_8100F88, .noFunc = sub_8100FB4}
};

const u8 gUnknown_083EC97C[] = {4, 4, 4, 4, 0, 3, 3, 0};
const u8 gUnknown_083EC984[] = {4, 4, 4, 4, 0, 4, 3, 0};

const u16 gUnknown_083EC98C[] = INCBIN_U16("graphics/unknown/83EC98C.gbapal");
const u16 Unknown_3EC9AC[] = INCBIN_U16("graphics/unknown/83EC9AC.gbapal");
const struct YesNoFuncTable gUnknown_083EC9CC = {.yesFunc = sub_810153C, .noFunc = sub_8100EEC};
const struct YesNoFuncTable gUnknown_083EC9D4 = {.yesFunc = sub_8101590, .noFunc = sub_8100EEC};
const u32 gSpriteImage_83EC9DC[] = INCBIN_U32("graphics/unknown_sprites/83EC9DC.4bpp");
const struct SpritePalette gUnknown_083ECA5C = {.data = gUnknown_083EC98C, .tag = 8};
const struct SpritePalette gUnknown_083ECA64 = {.data = Unknown_3EC9AC, .tag = 8};
const struct OamData gOamData_83ECA6C = {
    .size = 1, .priority = 1
};

const union AnimCmd gSpriteAnim_83ECA74[] = {
    {.frame = {.imageValue = 0, .duration = 0}},
    {.type = -1}
};

const union AnimCmd *const gSpriteAnimTable_83ECA7C[] = {
    gSpriteAnim_83ECA74
};

const struct SpriteFrameImage gSpriteImageTable_83ECA80[] = {
    {.data = (u8 *)gSpriteImage_83EC9DC, .size = sizeof gSpriteImage_83EC9DC}
};

const struct SpriteTemplate gSpriteTemplate_83ECA88 = {
    .tileTag = 0xffff,
    .paletteTag = 8,
    .oam = &gOamData_83ECA6C,
    .anims = gSpriteAnimTable_83ECA7C,
    .images = gSpriteImageTable_83ECA80,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8101698
};

const struct YesNoFuncTable gUnknown_083ECAA0 = {.yesFunc = sub_8101848, .noFunc = sub_80FED3C};

u8 *const unref_label_083ECAA8[] = {gSharedMem};



extern u8 gUnknown_0815F399[];

void sub_80FE1DC(void)
{
    sub_80FE2B4();
    MenuDrawTextWindow(0, 0, 12, 9);
    PrintMenuItems(1, 1, 4, (const struct MenuAction *)gUnknown_083EC604);
    InitMenu(0, 1, 1, 4, gUnknown_020388D4, 9);
}

void sub_80FE220(void)
{
    gUnknown_020388D4 = 0;
    ScriptContext2_Enable();
    sub_80FE1DC();
    sub_80FE394();
}

void DecorationPC(u8 taskId)
{
    sub_80FE220();
    gTasks[taskId].func = Task_DecorationPCProcessMenuInput;
}

void Task_SecretBasePC_Decoration(u8 taskId)
{
    DecorationPC(taskId);
    (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items = gSaveBlock1.secretBases[0].decorations;
    (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos = gSaveBlock1.secretBases[0].decorationPos;
    (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).size = sizeof gSaveBlock1.secretBases[0].decorations;
    (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).isPlayerRoom = 0;
}

void DoPlayerPCDecoration(u8 taskId)
{
    DecorationPC(taskId);
    (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items = gSaveBlock1.playerRoomDecor;
    (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos = gSaveBlock1.playerRoomDecorPos;
    (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).size = sizeof gSaveBlock1.playerRoomDecor;
    (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).isPlayerRoom = 1;
}

void sub_80FE2B4(void)
{
    u16 palettes[3];
    memcpy(palettes, gUnknown_083EC654, sizeof gUnknown_083EC654);
    LoadPalette(&palettes[2], 0xdf, 2);
    LoadPalette(&palettes[1], 0xd1, 2);
    LoadPalette(&palettes[0], 0xd8, 2);
}

void Task_DecorationPCProcessMenuInput(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gMain.newKeys & 0x0040)
        {
            PlaySE(SE_SELECT);
            gUnknown_020388D4 = MoveMenuCursor(-1);
            sub_80FE394();
        }
        if (gMain.newKeys & 0x0080)
        {
            PlaySE(SE_SELECT);
            gUnknown_020388D4 = MoveMenuCursor(1);
            sub_80FE394();
        }
        if (gMain.newKeys & 0x0001)
        {
            PlaySE(SE_SELECT);
            gUnknown_083EC604[gUnknown_020388D4].func(taskId);
        } else if (gMain.newKeys & 0x0002)
        {
            PlaySE(SE_SELECT);
            gpu_pal_decompress_alloc_tag_and_upload(taskId);
        }
    }
}

void sub_80FE394(void)
{
    MenuFillWindowRectWithBlankTile(4, 15, 25, 18);
    MenuPrint(gUnknown_083EC624[gUnknown_020388D4], 4, 15);
}

void gpu_pal_decompress_alloc_tag_and_upload(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 12, 9);
    MenuFillWindowRectWithBlankTile(4, 15, 25, 18);
    FreeSpritePaletteByTag(6);
    if ((*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).isPlayerRoom == 0)
    {
        ScriptContext1_SetupScript(gUnknown_0815F399);
        DestroyTask(taskId);
    } else
    {
        ReshowPlayerPC(taskId);
    }
}

void sub_80FE418(u8 taskId)
{
    sub_80FE5AC(taskId);
}

void sub_80FE428(u8 taskId)
{
    InitMenu(0, 1, 1, 4, gUnknown_020388D4, 9);
    sub_80FE394();
    gTasks[taskId].func = Task_DecorationPCProcessMenuInput;
}

void sub_80FE470(u8 decoCat, u8 left, u8 top, u8 palIdx)
{
    u8 *strptr;
    u8 v0;
    v0 = sub_8072CBC();

    strptr = gStringVar4;
    strptr[0] = 0xFC;
    strptr[1] = 5;
    strptr[2] = palIdx;
    strptr += 3;
    strptr = StringCopy(strptr, gUnknown_083EC5E4[decoCat]);
    strptr = sub_8072C14(strptr, sub_8134194(decoCat), 0x4E, 1);
    *strptr++ = 0xba;
    strptr = sub_8072C14(strptr, gDecorationInventories[decoCat].size, 0x60, 1);
    strptr[0] = 0xFC;
    strptr[1] = 5;
    strptr[2] = v0;
    strptr[3] = 0xFF;
    MenuPrint(gStringVar4, left, top);
}

void sub_80FE528(u8 taskId)
{
    u8 decoCat;
    MenuDrawTextWindow(0, 0, 14, 19);
    for (decoCat=0; decoCat<8; decoCat++)
    {
        if ((*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).isPlayerRoom == 1 && gTasks[taskId].data[11] == 0 && decoCat != DECORCAT_DOLL && decoCat != DECORCAT_CUSHION)
        {
            sub_80FE470(decoCat, 2, 2 * decoCat + 1, 13);
        } else
        {
            sub_80FE470(decoCat, 2, 2 * decoCat + 1, 255);
        }
    }
    MenuPrint(gUnknownText_Exit, 2, 17);
}

void sub_80FE5AC(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 29, 19);
    sub_80FE528(taskId);
    InitMenu(0, 1, 1, 9, gUnknown_020388F6, 13);
    gTasks[taskId].func = sub_80FE604;
}

void sub_80FE604(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gMain.newAndRepeatedKeys & 0x0040)
        {
            PlaySE(SE_SELECT);
            MoveMenuCursor(-1);
        } else if (gMain.newAndRepeatedKeys & 0x0080)
        {
            PlaySE(SE_SELECT);
            MoveMenuCursor(1);
        } else if (gMain.newKeys & 0x0001)
        {
            PlaySE(SE_SELECT);
            gUnknown_020388F6 = GetMenuCursorPos();
            if (gUnknown_020388F6 != 8)
            {
                gUnknown_020388D5 = sub_8134194(gUnknown_020388F6);
                if (gUnknown_020388D5)
                {
                    sub_8134104(gUnknown_020388F6);
                    gUnknown_020388D0 = gDecorationInventories[gUnknown_020388F6].items;
                    sub_80FEF50(taskId);
                    sub_80F944C();
                    sub_80F9480(gUnknown_020388F7, 8);
                    LoadScrollIndicatorPalette();
                    gTasks[taskId].func = sub_80FE868;
                } else
                {
                    HandleDestroyMenuCursors();
                    MenuZeroFillWindowRect(0, 0, 14, 19);
                    DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecors, sub_80FE418, 0);
                }
            } else
            {
                sub_80FE728(taskId);
            }
        } else if (gMain.newKeys & 0x0002)
        {
            PlaySE(SE_SELECT);
            sub_80FE728(taskId);
        }
    }
}

void sub_80FE728(u8 taskId)
{
    if (gTasks[taskId].data[11] != 3)
    {
        sub_80FE758(taskId);
    } else
    {
        sub_8109DAC(taskId);
    }
}

void sub_80FE758(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 14, 19);
    if (gTasks[taskId].data[11] != 2)
    {
        sub_80FE1DC();
        MenuDisplayMessageBox();
        sub_80FE394();
        gTasks[taskId].func = Task_DecorationPCProcessMenuInput;
    } else
    {
        sub_80B3068(taskId);
    }
}

void sub_80FE7A8(u8 taskId)
{
    gTasks[taskId].data[11] = 3;
    gUnknown_020388F6 = 0;
    sub_80FE5AC(taskId);
}

void sub_80FE7D4(u8 *dest, u8 decClass)
{
    StringCopy(dest, gUnknown_083EC5E4[decClass]);
}

void sub_80FE7EC(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 29, 19);

    sub_80FEC94(taskId);
    sub_80FECB8(gUnknown_020388F6);

    MenuDrawTextWindow(15, 12, 29, 19);

    sub_80FECE0(gUnknown_020388F2 + gUnknown_020388F4);
    InitMenu(0, 1, 2, gUnknown_020388F3 + 1, gUnknown_020388F2, 13);
}

void sub_80FE868(u8 taskId)
{
    sub_80FE7EC(taskId);
    gTasks[taskId].func = sub_80FE948;
}

void sub_80FE894(u8 taskId , s8 cursorVector , s8 bgVector )
{
    int v0 ;
    u8 v1;
    v0 = gUnknown_020388F2 + gUnknown_020388F4 == gUnknown_020388D5;
    PlaySE(SE_SELECT);
    if (cursorVector != 0)
    {
        gUnknown_020388F2 = MoveMenuCursor(cursorVector);
    }
    if (bgVector != 0)
    {
        v1 = gUnknown_020388F4;
        gUnknown_020388F4 = v1 + bgVector;
        sub_80FEABC(taskId, 1);
    }
    if (gUnknown_020388F2 + gUnknown_020388F4 != gUnknown_020388D5)
    {
        if (v0)
        {
            MenuDrawTextWindow(15, 12, 29, 19);
        }
        sub_80FECE0(gUnknown_020388F2 + gUnknown_020388F4);
    } else
    {
        MenuZeroFillWindowRect(15, 12, 29, 19);
    }
}

void sub_80FE948(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if ((gMain.newAndRepeatedKeys & 0x00F0) == 0x0040)
        {
            if (gUnknown_020388F2 != 0)
            {
                sub_80FE894(taskId, -1, 0);
            } else if (gUnknown_020388F4 != 0)
            {
                sub_80FE894(taskId, 0, -1);
            }
        }
        if ((gMain.newAndRepeatedKeys & 0x00F0) == 0x0080)
        {
            if (gUnknown_020388F2 != gUnknown_020388F3)
            {
                sub_80FE894(taskId, 1, 0);
            } else if (gUnknown_020388F4 + gUnknown_020388F2 != gUnknown_020388D5)
            {
                sub_80FE894(taskId, 0, 1);
            }
        }
        if (gMain.newKeys & 0x0001)
        {
            HandleDestroyMenuCursors();
            PlaySE(SE_SELECT);
            gUnknown_020388F5 = gUnknown_020388F2 + gUnknown_020388F4;
            if (gUnknown_020388F5 == gUnknown_020388D5)
            {
                gUnknown_083EC634[gTasks[taskId].data[11]].noFunc(taskId);
            } else
            {
                gUnknown_083EC634[gTasks[taskId].data[11]].yesFunc(taskId);
            }
        } else if (gMain.newKeys & 0x0002)
        {
            HandleDestroyMenuCursors();
            PlaySE(SE_SELECT);
            gUnknown_083EC634[gTasks[taskId].data[11]].noFunc(taskId);
        }
    }
}

void sub_80FEABC(u8 taskId, u8 dummy1)
{
    u16 i;
    u16 j;
    u8 ni;
    if (gUnknown_020388F4 != 0 || (DestroyVerticalScrollIndicator(0), gUnknown_020388F4 != 0))
    {
        CreateVerticalScrollIndicators(0, 0x3c, 0x08);
    }
    if (gUnknown_020388F4 + 7 == gUnknown_020388D5)
    {
        DestroyVerticalScrollIndicator(1);
    }
    if (gUnknown_020388F4 + 7 < gUnknown_020388D5)
    {
        CreateVerticalScrollIndicators(1, 0x3c, 0x98);
    }
    for (i=gUnknown_020388F4; i<gUnknown_020388F4+8; i++)
    {
        ni = 2 * (i - gUnknown_020388F4) + 2;
        if (gUnknown_020388F7[i - gUnknown_020388F4])
        {
            sub_80F94F8(&gUnknown_020388F7[i - gUnknown_020388F4]);
        }
        if (i == gUnknown_020388D5)
        {
            sub_8072A18(gUnknownText_Exit, 0x10, 8 * ni, 0x68, 1);
            break;
        }
        if (gUnknown_020388D0[i])
        {
            if ((*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).isPlayerRoom == 1 && gUnknown_020388F6 != DECORCAT_DOLL && gUnknown_020388F6 != DECORCAT_CUSHION && gTasks[taskId].data[11] == 0)
            {
                StringCopy(gStringVar1, gDecorations[gUnknown_020388D0[i]].name);
                sub_8072A18(gUnknown_083EC65A, 0x10, 8 * ni, 0x68, 1);
            } else
            {
                sub_8072A18(gDecorations[gUnknown_020388D0[i]].name, 0x10, 8 * ni, 0x68, 1);
            }
   SetCustomFont(1);
            for (j=0; j<16; j++)
            {
                if (gUnknown_020388D6[j] - 1 == i)
                {
                    sub_80F94A4(4, &gUnknown_020388F7[i - gUnknown_020388F4], 0x6c, (i - gUnknown_020388F4) * 16 + 24);
                    break;
                }
            }
            for (j=0; j<12; j++)
            {
                if (gUnknown_020388E6[j] - 1 == i)
                {
                    sub_80F94A4(5, &gUnknown_020388F7[i - gUnknown_020388F4], 0x6c, (i - gUnknown_020388F4) * 16 + 24);
                    break;
                }
            }
   SetCustomFont(0);
        }
    }
}

void sub_80FEC94(u8 taskId)
{
    MenuDrawTextWindow(0, 0, 14, 19);
    sub_80FEABC(taskId, 0);
}

void sub_80FECB8(u8 decoCat)
{
    MenuDrawTextWindow(16, 0, 29, 3);
    sub_80FE470(decoCat, 17, 1, 0xff);
}

void sub_80FECE0(u8 decoCat)
{
    sub_8072AB0(gDecorations[gUnknown_020388D0[decoCat]].description, 0x80, 0x68, 0x68, 0x30, 0x1);
}

void sub_80FED1C(void)
{
    MenuZeroFillWindowRect(15, 0, 29, 3);
    MenuZeroFillWindowRect(15, 12, 29, 19);
}

void sub_80FED3C(u8 taskId)
{
    LoadScrollIndicatorPalette();
    gTasks[taskId].func = sub_80FE868;
}

bool8 sub_80FED64(u8 a0)
{
    u8 i;
    for (i=0; i<16; i++)
    {
        if (gUnknown_020388D6[i] == a0)
        {
            return 1;
        }
    }
    return 0;
}

void sub_80FED90(u8 taskId)
{
    u16 i;
    u16 j;
    u16 k;
    u16 cnt;
    cnt = 0;
    for (i=0; i<16; i++)
    {
        gUnknown_020388D6[i] = 0;
        if (i < 12)
        {
            gUnknown_020388E6[i] = 0;
        }
    }
    for (i=0; i<16; i++)
    {
        if (gSaveBlock1.secretBases[0].decorations[i] != 0)
        {
            for (j=0; j<gDecorationInventories[gUnknown_020388F6].size; j++)
            {
                if (gUnknown_020388D0[j] == gSaveBlock1.secretBases[0].decorations[i])
                {
                    for (k=0; k<cnt && gUnknown_020388D6[k]!=j+1; k++);
                    if (k == cnt)
                    {
                        gUnknown_020388D6[cnt] = j+1;
                        cnt++;
                        break;
                    }
                }
            }
        }
    }
    cnt = 0;
    for (i=0; i<12; i++)
    {
        if (gSaveBlock1.playerRoomDecor[i] != 0)
        {
            for (j=0; j<gDecorationInventories[gUnknown_020388F6].size; j++)
            {
                if (gUnknown_020388D0[j] == gSaveBlock1.playerRoomDecor[i] && !sub_80FED64(j + 1))
                {
                    for (k=0; k<cnt && gUnknown_020388E6[k]!=j+1; k++);
                    if (k == cnt)
                    {
                        gUnknown_020388E6[cnt] = j+1;
                        cnt++;
                        break;
                    }
                }
            }
        }
    }
}

void sub_80FEF28(void)
{
    if (gUnknown_020388D5 <= 7)
    {
        gUnknown_020388F3 = gUnknown_020388D5;
    } else
    {
        gUnknown_020388F3 = 7;
    }
}

void sub_80FEF50(u8 taskId)
{
    sub_80FED90(taskId);
    sub_80FEF28();
    gUnknown_020388F2 = 0;
    gUnknown_020388F4 = 0;
}

void sub_80FEF74(void)
{
    sub_80F9520(gUnknown_020388F7, 8);
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 14, 19);
}

bool8 sub_80FEFA4(void)
{
    u16 i;
    int v0;
    for (i=0; i<16; i++)
    {
        v0 = gUnknown_020388F4 + gUnknown_020388F2 + 1;
        if (gUnknown_020388D6[i] == v0 || (i < 12 && gUnknown_020388E6[i] == v0))
        {
            return 0;
        }
    }
    return 1;
}

void sub_80FEFF4(u8 taskId)
{
    if (gMain.newKeys & 0x0001 || gMain.newKeys & 0x0002)
    {
        LoadScrollIndicatorPalette();
        gTasks[taskId].func = sub_80FE868;
    }
}

void sub_80FF034(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 14, 19);
    sub_80FE5AC(taskId);
}

void sub_80FF058(u8 taskId)
{
    sub_80F9520(gUnknown_020388F7, 8);
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
    BuyMenuFreeMemory();
    gTasks[taskId].func = sub_80FF034;
}

void sub_80FF098(u8 taskId)
{
    gUnknown_020388D5--;
    if (gUnknown_020388F4 + 7 > gUnknown_020388D5 && gUnknown_020388F4 != 0)
    {
        gUnknown_020388F4--;
    }
    sub_8134104(gUnknown_020388F6);
    sub_80FED90(taskId);
    sub_80FEF28();
}

void sub_80FF0E0(u8 taskId)
{
    gTasks[taskId].data[3] = gSaveBlock1.pos.x;
    gTasks[taskId].data[4] = gSaveBlock1.pos.y;
    PlayerGetDestCoords(&gTasks[taskId].data[0], &gTasks[taskId].data[1]);
}

void sub_80FF114(u8 taskId)
{
    DrawWholeMapView();
    Overworld_SetWarpDestination(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum, -1, gTasks[taskId].data[3], gTasks[taskId].data[4]);
    warp_in();
}
void sub_80FF160(u8 taskId)
{
    if (!sub_81341D4())
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecors, sub_80FE428, 0);
    } else
    {
        gTasks[taskId].data[11] = 0;
        gUnknown_020388F6 = 0;
        sub_80FE5AC(taskId);
    }
}

u16 sub_80FF1B0(u8 decoId, u8 a1)
{
    u16 retval;
    retval = 0xffff;

    switch (decoId)
    {
        case DECOR_STAND:
            retval = gUnknown_083EC97C[a1] << 12;
            return retval;
        case DECOR_SLIDE:
            retval = gUnknown_083EC984[a1] << 12;
            return retval;
        default:
            return retval;
    }
}

void sub_80FF1EC(u16 mapX, u16 mapY, u8 decWidth, u8 decHeight, u16 decIdx)
{
    u16 i;
    u16 j;
    u16 behavior;
    u16 flags;
    u16 v0;
    u16 v1;
    s16 x;
    s16 decBottom;

    for (i=0; i<decHeight; i++)
    {
        decBottom = mapY - decHeight + 1 + i;
        for (j=0; j<decWidth; j++)
        {
            x = mapX + j;
            behavior = GetBehaviorByMetatileId(0x200 + gDecorations[decIdx].tiles[i * decWidth + j]);
            if (sub_8057288(behavior) == 1 || (gDecorations[decIdx].permission != DECORPERM_PASS_FLOOR && (behavior >> 12)))
            {
                flags = 0xc00;
            } else
            {
                flags = 0x000;
            }
            if (gDecorations[decIdx].permission != DECORPERM_NA_WALL && sub_80572B0(MapGridGetMetatileBehaviorAt(x, decBottom)) == 1)
            {
                v0 = 1;
            } else
            {
                v0 = 0;
            }
            v1 = sub_80FF1B0(gDecorations[decIdx].id, i * decWidth + j);
            if (v1 != 0xffff)
            {
                MapGridSetMetatileEntryAt(x, decBottom, (gDecorations[decIdx].tiles[i * decWidth + j] + (0x200 | v0)) | flags | v1);
            } else
            {
                MapGridSetMetatileIdAt(x, decBottom, (gDecorations[decIdx].tiles[i * decWidth + j] + (0x200 | v0)) | flags);
            }
        }
    }
}

void sub_80FF394(u16 mapX, u16 mapY, u16 decIdx)
{
    switch (gDecorations[decIdx].shape)
    {
        case DECORSHAPE_1x1:
            sub_80FF1EC(mapX, mapY, 1, 1, decIdx);
            break;
        case DECORSHAPE_2x1:
            sub_80FF1EC(mapX, mapY, 2, 1, decIdx);
            break;
        case DECORSHAPE_3x1:
            sub_80FF1EC(mapX, mapY, 3, 1, decIdx);
            break;
        case DECORSHAPE_4x2:
            sub_80FF1EC(mapX, mapY, 4, 2, decIdx);
            break;
        case DECORSHAPE_2x2:
            sub_80FF1EC(mapX, mapY, 2, 2, decIdx);
            break;
        case DECORSHAPE_1x2:
            sub_80FF1EC(mapX, mapY, 1, 2, decIdx);
            break;
        case DECORSHAPE_1x3:
            sub_80FF1EC(mapX, mapY, 1, 3, decIdx);
            break;
        case DECORSHAPE_2x4:
            sub_80FF1EC(mapX, mapY, 2, 4, decIdx);
            break;
        case DECORSHAPE_3x3:
            sub_80FF1EC(mapX, mapY, 3, 3, decIdx);
            break;
        case DECORSHAPE_3x2:
            sub_80FF1EC(mapX, mapY, 3, 2, decIdx);
            break;
    }
}

void sub_80FF474(void)
{
    u8 i;
    u8 j;
    for (i=0; i<14; i++)
    {
        if (FlagGet(i + 0xae) == 1)
        {
            FlagClear(i + 0xae);
            for (j=0; j<gMapHeader.events->mapObjectCount; j++)
            {
                if (gMapHeader.events->mapObjects[j].flagId == i + 0xae)
                {
                    break;
                }
            }
            VarSet(0x3f20 + gMapHeader.events->mapObjects[j].graphicsId, gUnknown_02038900.decoration->tiles[0]);
            gSpecialVar_0x8005 = gMapHeader.events->mapObjects[j].localId;
            gSpecialVar_0x8006 = gUnknown_020391A4;
            gSpecialVar_0x8007 = gUnknown_020391A6;
            show_sprite(gSpecialVar_0x8005, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
            sub_805C0F8(gSpecialVar_0x8005, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, gSpecialVar_0x8006, gSpecialVar_0x8007);
            sub_805C78C(gSpecialVar_0x8005, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
            break;
        }
    }
}

bool8 sub_80FF58C (void)
{
    u16 i;
    for (i=0; i<(*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).size; i++)
    {
        if ((*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[i] == 0)
        {
            return 1;
        }
    }
    return 0;
}

void sub_80FF5BC(u8 taskId)
{
    if ((*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).isPlayerRoom == 1 && gUnknown_020388F6 != DECORCAT_DOLL && gUnknown_020388F6 != DECORCAT_CUSHION)
    {
        sub_80FEF74();
        sub_80FED1C();
        DisplayItemMessageOnField(taskId, gSecretBaseText_DecorCantPlace, sub_80FEFF4, 0);
    } else if (sub_80FEFA4() == 1)
    {
        if (sub_80FF58C() == 1)
        {
            fade_screen(1, 0);
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].func = sub_80FF6AC;
        } else
        {
            sub_80FEF74();
            sub_80FED1C();
            ConvertIntToDecimalStringN(gStringVar1, (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).size, STR_CONV_MODE_RIGHT_ALIGN, 2);
            if (!(*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).isPlayerRoom)
            {
                StringExpandPlaceholders(gStringVar4, gSecretBaseText_NoMoreDecor);
            } else
            {
                StringExpandPlaceholders(gStringVar4, gSecretBaseText_NoMoreDecor2);
            }
            DisplayItemMessageOnField(taskId, gStringVar4, sub_80FEFF4, 0);
        }
    } else
    {
        sub_80FEF74();
        sub_80FED1C();
        DisplayItemMessageOnField(taskId, gSecretBaseText_InUseAlready, sub_80FEFF4, 0);
    }
}

void sub_80FF6AC(u8 taskId)
{
    switch (gTasks[taskId].data[2])
    {
        case 0:
            if (!gPaletteFade.active)
            {
                sub_80FF0E0(taskId);
                DestroyVerticalScrollIndicator(0);
                DestroyVerticalScrollIndicator(1);
                sub_80F9520(gUnknown_020388F7, 8);
                BuyMenuFreeMemory();
                gTasks[taskId].data[2] = 1;
            }
            break;
        case 1:
            gPaletteFade.bufferTransferDisabled = 1;
            AddDecorationIconObjectFromFieldObject(&gUnknown_02038900, gUnknown_020388D0[gUnknown_020388F5]);
            sub_80FF960(taskId);
            SetUpPlacingDecorationPlayerAvatar(taskId, &gUnknown_02038900);
            pal_fill_black();
            gPaletteFade.bufferTransferDisabled = 0;
            gTasks[taskId].data[2] = 2;
            break;
        case 2:
            if (sub_807D770() == 1)
            {
                gTasks[taskId].data[12] = 0;
                sub_810065C(taskId);
            }
            break;
    }
}

void AddDecorationIconObjectFromFieldObject(struct UnkStruct_02038900 * unk_02038900, u8 decoIdx)
{
    sub_80FEF74();
    sub_80FED1C();
    sub_81006D0(unk_02038900);
    unk_02038900->decoration = &gDecorations[decoIdx];
    if (gDecorations[decoIdx].permission != DECORPERM_SOLID_MAT)
    {
        sub_81008BC(unk_02038900);
        sub_8100930(unk_02038900->decoration->shape);
        sub_8100874(unk_02038900);
        sub_810070C(unk_02038900->palette, ((u16 *)gMapHeader.mapData->secondaryTileset->metatiles + 8 * unk_02038900->decoration->tiles[0])[7] >> 12);
        LoadSpritePalette(&gUnknown_083EC954);
        gUnknown_020391A8 = gSprites[gUnknown_03004880.unk4].data[0];
        gUnknown_03004880.unk4 = CreateSprite(&gSpriteTemplate_83EC93C, gUnknown_083EC900[unk_02038900->decoration->shape].x, gUnknown_083EC900[unk_02038900->decoration->shape].y, 0);
    } else
    {
        gUnknown_020391A8 = gSprites[gUnknown_03004880.unk4].data[0];
        gUnknown_03004880.unk4 = AddPseudoFieldObject(unk_02038900->decoration->tiles[0], sub_81009A8, gUnknown_083EC900[unk_02038900->decoration->shape].x, gUnknown_083EC900[unk_02038900->decoration->shape].y, 1);
        gSprites[gUnknown_03004880.unk4].oam.priority = 1;
    }
}

void SetUpPlacingDecorationPlayerAvatar(u8 taskId, struct UnkStruct_02038900 *unk_02038900)
{
    u8 v0;
    v0 = 16 * (u8)gTasks[taskId].data[5] + gUnknown_083EC900[unk_02038900->decoration->shape].x - 8 * ((u8)gTasks[taskId].data[5] - 1);
    if (unk_02038900->decoration->shape == DECORSHAPE_3x1 || unk_02038900->decoration->shape == DECORSHAPE_3x3 || unk_02038900->decoration->shape == DECORSHAPE_3x2)
    {
        v0 -= 8;
    }
    if (gSaveBlock2.playerGender == MALE)
    {
        gUnknown_020391A9 = AddPseudoFieldObject(0xc1, SpriteCallbackDummy, v0, 0x48, 0);
    } else
    {
        gUnknown_020391A9 = AddPseudoFieldObject(0xc2, SpriteCallbackDummy, v0, 0x48, 0);
    }
    gSprites[gUnknown_020391A9].oam.priority = 1;
    DestroySprite(&gSprites[gUnknown_020391A8]);
    gUnknown_020391A8 = gUnknown_03004880.unk4;
}

void sub_80FF960(u8 taskId)
{
    switch (gDecorations[gUnknown_020388D0[gUnknown_020388F5]].shape)
    {
        case DECORSHAPE_1x1:
            gTasks[taskId].data[5] = 1;
            gTasks[taskId].data[6] = 1;
            break;
        case DECORSHAPE_2x1:
            gTasks[taskId].data[5] = 2;
            gTasks[taskId].data[6] = 1;
            break;
        case DECORSHAPE_3x1:
            gTasks[taskId].data[5] = 3;
            gTasks[taskId].data[6] = 1;
            break;
        case DECORSHAPE_4x2:
            gTasks[taskId].data[5] = 4;
            gTasks[taskId].data[6] = 2;
            break;
        case DECORSHAPE_2x2:
            gTasks[taskId].data[5] = 2;
            gTasks[taskId].data[6] = 2;
            break;
        case DECORSHAPE_1x2:
            gTasks[taskId].data[5] = 1;
            gTasks[taskId].data[6] = 2;
            break;
        case DECORSHAPE_1x3:
            gTasks[taskId].data[5] = 1;
            gTasks[taskId].data[6] = 3;
            gTasks[taskId].data[1]++;
            break;
        case DECORSHAPE_2x4:
            gTasks[taskId].data[5] = 2;
            gTasks[taskId].data[6] = 4;
            break;
        case DECORSHAPE_3x3:
            gTasks[taskId].data[5] = 3;
            gTasks[taskId].data[6] = 3;
            break;
        case DECORSHAPE_3x2:
            gTasks[taskId].data[5] = 3;
            gTasks[taskId].data[6] = 2;
            break;
    }
}

void sub_80FFAB0(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    gSprites[gUnknown_020391A8].data[7] = 1;
    gSprites[gUnknown_020391A9].data[7] = 1;
    sub_810045C();
    sub_8100038(taskId);
}

void sub_80FFB08(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    gSprites[gUnknown_020391A8].data[7] = 1;
    gSprites[gUnknown_020391A9].data[7] = 1;
    sub_810045C();
    DisplayItemMessageOnField(taskId, gSecretBaseText_CancelDecorating, sub_8100248, 0);
}

bool8 sub_80FFB6C(u8 a0, u16 a1)
{
    if (sub_8057274(a0) != 1 || a1 != 0)
    {
        return 0;
    }
    return 1;
}

bool8 sub_80FFB94(u8 taskId, s16 x, s16 y, u16 decoId)
{
    if (x == gTasks[taskId].data[3] + 7 && y == gTasks[taskId].data[4] + 7 && decoId != 0)
    {
        return 0;
    }
    return 1;
}

bool8 sub_80FFBDC(u16 a0, const struct Decoration *decoration)
{
    if (sub_8057274(a0) != 1)
    {
        if (decoration->id == DECOR_SOLID_BOARD && sub_8057300(a0) == 1)
        {
            return 1;
        }
        if (sub_805729C(a0))
        {
            return 1;
        }
    }
    return 0;
}
# 1949 "src/field/decoration.c"
__attribute__((naked))
bool8 sub_80FFC24(u8 taskId, const struct Decoration *decoration)
{
    asm(".syntax unified\n"
    "\tpush {r4-r7,lr}\n"
    "\tmov r7, r10\n"
    "\tmov r6, r9\n"
    "\tmov r5, r8\n"
    "\tpush {r5-r7}\n"
    "\tsub sp, 0x24\n"
    "\tstr r1, [sp]\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tmov r10, r0\n"
    "\tldr r1, _080FFC60 @ =gTasks\n"
    "\tlsls r0, 2\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r1\n"
    "\tldrb r2, [r0, 0x14]\n"
    "\tstr r2, [sp, 0x4]\n"
    "\tldrb r0, [r0, 0x12]\n"
    "\tstr r0, [sp, 0x8]\n"
    "\tldr r3, [sp]\n"
    "\tldrb r0, [r3, 0x11]\n"
    "\tadds r2, r1, 0\n"
    "\tcmp r0, 0x4\n"
    "\tbls _080FFC56\n"
    "\tb _08100024\n"
    "_080FFC56:\n"
    "\tlsls r0, 2\n"
    "\tldr r1, _080FFC64 @ =_080FFC68\n"
    "\tadds r0, r1\n"
    "\tldr r0, [r0]\n"
    "\tmov pc, r0\n"
    "\t.align 2, 0\n"
    "_080FFC60: .4byte gTasks\n"
    "_080FFC64: .4byte _080FFC68\n"
    "\t.align 2, 0\n"
    "_080FFC68:\n"
    "\t.4byte _080FFC7C\n"
    "\t.4byte _080FFC7C\n"
    "\t.4byte _080FFD68\n"
    "\t.4byte _080FFF1C\n"
    "\t.4byte _080FFFA0\n"
    "_080FFC7C:\n"
    "\tmovs r6, 0\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tcmp r6, r0\n"
    "\tbcc _080FFC86\n"
    "\tb _08100024\n"
    "_080FFC86:\n"
    "\tmov r1, r10\n"
    "\tlsls r1, 2\n"
    "\tstr r1, [sp, 0x1C]\n"
    "_080FFC8C:\n"
    "\tmov r2, r10\n"
    "\tlsls r0, r2, 2\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tldr r3, _080FFD64 @ =gTasks\n"
    "\tadds r0, r3\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tsubs r0, r6\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tadds r6, 0x1\n"
    "\tstr r6, [sp, 0x14]\n"
    "\tldr r0, [sp, 0x8]\n"
    "\tcmp r7, r0\n"
    "\tbcs _080FFD56\n"
    "\tmov r1, r9\n"
    "\tlsls r1, 16\n"
    "\tstr r1, [sp, 0xC]\n"
    "\tasrs r1, 16\n"
    "\tmov r9, r1\n"
    "_080FFCB8:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tldr r2, _080FFD64 @ =gTasks\n"
    "\tadds r0, r2\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tmov r8, r0\n"
    "\tasrs r6, r0, 16\n"
    "\tadds r0, r6, 0\n"
    "\tmov r1, r9\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp, 0x4]\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tsubs r0, r3, r1\n"
    "\tldr r2, [sp, 0x8]\n"
    "\tadds r1, r0, 0\n"
    "\tmuls r1, r2\n"
    "\tadds r1, r7\n"
    "\tldr r3, [sp]\n"
    "\tldr r0, [r3, 0x1C]\n"
    "\tlsls r1, 1\n"
    "\tadds r1, r0\n"
    "\tmovs r2, 0x80\n"
    "\tlsls r2, 2\n"
    "\tadds r0, r2, 0\n"
    "\tldrh r1, [r1]\n"
    "\tadds r0, r1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tbl GetBehaviorByMetatileId\n"
    "\tmovs r3, 0xF0\n"
    "\tlsls r3, 8\n"
    "\tadds r1, r3, 0\n"
    "\tadds r5, r1, 0\n"
    "\tands r5, r0\n"
    "\tadds r0, r4, 0\n"
    "\tldr r1, [sp]\n"
    "\tbl sub_80FFBDC\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFD1A\n"
    "\tb _080FFFF4\n"
    "_080FFD1A:\n"
    "\tmov r0, r10\n"
    "\tadds r1, r6, 0\n"
    "\tmov r2, r9\n"
    "\tadds r3, r5, 0\n"
    "\tbl sub_80FFB94\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFD2E\n"
    "\tb _080FFFF4\n"
    "_080FFD2E:\n"
    "\tmov r1, r8\n"
    "\tlsrs r0, r1, 16\n"
    "\tldr r2, [sp, 0xC]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tcmp r4, 0\n"
    "\tbeq _080FFD4A\n"
    "\tcmp r4, 0x10\n"
    "\tbeq _080FFD4A\n"
    "\tb _080FFFF4\n"
    "_080FFD4A:\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFCB8\n"
    "_080FFD56:\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tlsls r0, r1, 24\n"
    "\tlsrs r6, r0, 24\n"
    "\tldr r2, [sp, 0x4]\n"
    "\tcmp r6, r2\n"
    "\tbcc _080FFC8C\n"
    "\tb _08100024\n"
    "\t.align 2, 0\n"
    "_080FFD64: .4byte gTasks\n"
    "_080FFD68:\n"
    "\tmovs r6, 0\n"
    "\tmov r3, r10\n"
    "\tlsls r3, 2\n"
    "\tstr r3, [sp, 0x1C]\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tsubs r0, 0x1\n"
    "\tstr r0, [sp, 0x18]\n"
    "\tcmp r6, r0\n"
    "\tbge _080FFE54\n"
    "\tadds r0, r3, 0\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tstr r0, [sp, 0x10]\n"
    "_080FFD82:\n"
    "\tldr r1, [sp, 0x10]\n"
    "\tadds r0, r1, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tsubs r0, r6\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tadds r6, 0x1\n"
    "\tstr r6, [sp, 0x14]\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcs _080FFE48\n"
    "\tlsls r0, 16\n"
    "\tstr r0, [sp, 0x20]\n"
    "_080FFDA0:\n"
    "\tldr r1, [sp, 0x10]\n"
    "\tadds r0, r1, r2\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tmov r8, r0\n"
    "\tasrs r6, r0, 16\n"
    "\tmov r2, r9\n"
    "\tlsls r1, r2, 16\n"
    "\tadds r0, r6, 0\n"
    "\tasrs r1, 16\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp, 0x4]\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tsubs r0, r3, r1\n"
    "\tldr r2, [sp, 0x8]\n"
    "\tadds r1, r0, 0\n"
    "\tmuls r1, r2\n"
    "\tadds r1, r7\n"
    "\tldr r3, [sp]\n"
    "\tldr r0, [r3, 0x1C]\n"
    "\tlsls r1, 1\n"
    "\tadds r1, r0\n"
    "\tmovs r2, 0x80\n"
    "\tlsls r2, 2\n"
    "\tadds r0, r2, 0\n"
    "\tldrh r1, [r1]\n"
    "\tadds r0, r1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tbl GetBehaviorByMetatileId\n"
    "\tmovs r3, 0xF0\n"
    "\tlsls r3, 8\n"
    "\tadds r1, r3, 0\n"
    "\tadds r5, r1, 0\n"
    "\tands r5, r0\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_805729C\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFE0C\n"
    "\tadds r0, r4, 0\n"
    "\tadds r1, r5, 0\n"
    "\tbl sub_80FFB6C\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFE0C\n"
    "\tb _080FFFF4\n"
    "_080FFE0C:\n"
    "\tmov r0, r10\n"
    "\tadds r1, r6, 0\n"
    "\tldr r3, [sp, 0x20]\n"
    "\tasrs r2, r3, 16\n"
    "\tadds r3, r5, 0\n"
    "\tbl sub_80FFB94\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFE22\n"
    "\tb _080FFFF4\n"
    "_080FFE22:\n"
    "\tmov r1, r8\n"
    "\tlsrs r0, r1, 16\n"
    "\tldr r2, [sp, 0x20]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tcmp r0, 0x10\n"
    "\tbeq _080FFE3A\n"
    "\tb _080FFFF4\n"
    "_080FFE3A:\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r2, _080FFF18 @ =gTasks\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFDA0\n"
    "_080FFE48:\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tlsls r0, r1, 24\n"
    "\tlsrs r6, r0, 24\n"
    "\tldr r3, [sp, 0x18]\n"
    "\tcmp r6, r3\n"
    "\tblt _080FFD82\n"
    "_080FFE54:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tldr r1, [sp, 0x4]\n"
    "\tsubs r0, r1\n"
    "\tadds r0, 0x1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFE74\n"
    "\tb _08100024\n"
    "_080FFE74:\n"
    "\tlsls r0, 16\n"
    "\tstr r0, [sp, 0x20]\n"
    "_080FFE78:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tldr r1, _080FFF18 @ =gTasks\n"
    "\tadds r0, r1\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tmov r8, r0\n"
    "\tasrs r6, r0, 16\n"
    "\tmov r2, r9\n"
    "\tlsls r1, r2, 16\n"
    "\tadds r0, r6, 0\n"
    "\tasrs r1, 16\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp]\n"
    "\tldr r0, [r3, 0x1C]\n"
    "\tlsls r1, r7, 1\n"
    "\tadds r1, r0\n"
    "\tmovs r2, 0x80\n"
    "\tlsls r2, 2\n"
    "\tadds r0, r2, 0\n"
    "\tldrh r1, [r1]\n"
    "\tadds r0, r1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tbl GetBehaviorByMetatileId\n"
    "\tmovs r3, 0xF0\n"
    "\tlsls r3, 8\n"
    "\tadds r1, r3, 0\n"
    "\tadds r5, r1, 0\n"
    "\tands r5, r0\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_805729C\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFEDA\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_80572B0\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFEDA\n"
    "\tb _080FFFF4\n"
    "_080FFEDA:\n"
    "\tmov r0, r10\n"
    "\tadds r1, r6, 0\n"
    "\tldr r3, [sp, 0x20]\n"
    "\tasrs r2, r3, 16\n"
    "\tadds r3, r5, 0\n"
    "\tbl sub_80FFB94\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFEF0\n"
    "\tb _080FFFF4\n"
    "_080FFEF0:\n"
    "\tmov r1, r8\n"
    "\tlsrs r0, r1, 16\n"
    "\tldr r2, [sp, 0x20]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tcmp r4, 0\n"
    "\tbeq _080FFF0A\n"
    "\tcmp r4, 0x10\n"
    "\tbne _080FFFF4\n"
    "_080FFF0A:\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFE78\n"
    "\tb _08100024\n"
    "\t.align 2, 0\n"
    "_080FFF18: .4byte gTasks\n"
    "_080FFF1C:\n"
    "\tmovs r6, 0\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tcmp r6, r0\n"
    "\tbcc _080FFF26\n"
    "\tb _08100024\n"
    "_080FFF26:\n"
    "\tmov r1, r10\n"
    "\tlsls r0, r1, 2\n"
    "\tadd r0, r10\n"
    "\tlsls r1, r0, 3\n"
    "\tldr r2, _080FFF9C @ =gTasks\n"
    "\tadds r0, r1, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tsubs r0, r6\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcs _080FFF8C\n"
    "\tadds r0, r2, 0\n"
    "\tadds r1, r0\n"
    "\tmov r8, r1\n"
    "\tmov r1, r9\n"
    "\tlsls r0, r1, 16\n"
    "\tasrs r5, r0, 16\n"
    "_080FFF50:\n"
    "\tmov r2, r8\n"
    "\tldrh r0, [r2, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tasrs r4, r0, 16\n"
    "\tadds r0, r4, 0\n"
    "\tadds r1, r5, 0\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tbl sub_80572B0\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbeq _080FFFF4\n"
    "\tadds r0, r4, 0\n"
    "\tadds r1, r5, 0x1\n"
    "\tbl MapGridGetMetatileIdAt\n"
    "\tmovs r1, 0xA3\n"
    "\tlsls r1, 2\n"
    "\tcmp r0, r1\n"
    "\tbeq _080FFFF4\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFF50\n"
    "_080FFF8C:\n"
    "\tadds r0, r6, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r6, r0, 24\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tcmp r6, r0\n"
    "\tbcc _080FFF26\n"
    "\tb _08100024\n"
    "\t.align 2, 0\n"
    "_080FFF9C: .4byte gTasks\n"
    "_080FFFA0:\n"
    "\tmov r3, r10\n"
    "\tlsls r1, r3, 2\n"
    "\tadds r0, r1, r3\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tstr r1, [sp, 0x1C]\n"
    "\tldr r0, [sp, 0x8]\n"
    "\tcmp r7, r0\n"
    "\tbcs _08100024\n"
    "\tadds r6, r2, 0\n"
    "\tmov r1, r9\n"
    "\tlsls r1, 16\n"
    "\tstr r1, [sp, 0x20]\n"
    "_080FFFC0:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r6\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tlsrs r5, r0, 16\n"
    "\tasrs r0, 16\n"
    "\tmov r2, r9\n"
    "\tlsls r1, r2, 16\n"
    "\tasrs r1, 16\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp]\n"
    "\tldrb r0, [r3, 0x12]\n"
    "\tcmp r0, 0x5\n"
    "\tbne _080FFFF8\n"
    "_080FFFE8:\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_80572EC\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _08100004\n"
    "_080FFFF4:\n"
    "\tmovs r0, 0\n"
    "\tb _08100026\n"
    "_080FFFF8:\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_80572D8\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbeq _080FFFE8\n"
    "_08100004:\n"
    "\tadds r0, r5, 0\n"
    "\tldr r2, [sp, 0x20]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tcmp r0, 0x10\n"
    "\tbne _080FFFF4\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFFC0\n"
    "_08100024:\n"
    "\tmovs r0, 0x1\n"
    "_08100026:\n"
    "\tadd sp, 0x24\n"
    "\tpop {r3-r5}\n"
    "\tmov r8, r3\n"
    "\tmov r9, r4\n"
    "\tmov r10, r5\n"
    "\tpop {r4-r7}\n"
    "\tpop {r1}\n"
    "\tbx r1\n"
    ".syntax divided\n");
}


void sub_8100038(u8 taskId)
{
    if (sub_80FFC24(taskId, &gDecorations[gUnknown_020388D0[gUnknown_020388F5]]) == 1)
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_PlaceItHere, sub_81000A0, 0);
    } else
    {
        PlaySE(SE_HAZURE);
        DisplayItemMessageOnField(taskId, gSecretBaseText_CantBePlacedHere, sub_81006A8, 0);
    }
}

void sub_81000A0(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    DoYesNoFuncWithChoice(taskId, &gUnknown_083EC95C);
}

void sub_81000C4(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    sub_8100174(taskId);
    if (gDecorations[gUnknown_020388D0[gUnknown_020388F5]].permission != DECORPERM_SOLID_MAT)
    {
        sub_80FF394(gTasks[taskId].data[0], gTasks[taskId].data[1], gUnknown_020388D0[gUnknown_020388F5]);
    } else
    {
        gUnknown_020391A4 = gTasks[taskId].data[0] - 7;
        gUnknown_020391A6 = gTasks[taskId].data[1] - 7;
        ScriptContext1_SetupScript(gUnknown_081A2F7B);
    }
    gSprites[gUnknown_020391A8].pos1.y += 2;
    sub_810028C(taskId);
}

void sub_8100174(u8 taskId)
{
    u16 i;
    for (i=0; i<(*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).size; i++)
    {
        if ((*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[i] == 0)
        {
            (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[i] = gUnknown_020388D0[gUnknown_020388F5];
            (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos[i] = ((gTasks[taskId].data[0] - 7) << 4) + (gTasks[taskId].data[1] - 7);
            break;
        }
    }
    if (!(*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).isPlayerRoom)
    {
        for (i=0; i<16; i++)
        {
            if (gUnknown_020388D6[i] == 0)
            {
                gUnknown_020388D6[i] = gUnknown_020388F5 + 1;
                break;
            }
        }
    } else
    {
        for (i=0; i<12; i++)
        {
            if (gUnknown_020388E6[i] == 0)
            {
                gUnknown_020388E6[i] = gUnknown_020388F5 + 1;
                break;
            }
        }
    }
}

void sub_8100248(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    DoYesNoFuncWithChoice(taskId, &gUnknown_083EC964);
}

void sub_810026C(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    sub_810028C(taskId);
}

void sub_810028C(u8 taskId)
{
    fade_screen(1, 0);
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].func = c1_overworld_prev_quest;
}

void c1_overworld_prev_quest(u8 taskId)
{
    switch (gTasks[taskId].data[2])
    {
        case 0:
            ScriptContext2_Enable();
            if (!gPaletteFade.active)
            {
                sub_80FF114(taskId);
                gTasks[taskId].data[2] = 1;
            }
            break;
        case 1:
            sub_81016F4();
            FreeSpritePaletteByTag(0xbb8);
            gFieldCallback = &sub_8100364;
            SetMainCallback2(c2_exit_to_overworld_2_switch);
            DestroyTask(taskId);
            break;
    }
}

void sub_8100334(u8 taskId)
{
    if (sub_807D770() == 1)
    {
        gTasks[taskId].func = sub_80FE948;
    }
}

void sub_8100364(void)
{
    ScriptContext2_Enable();
    LoadScrollIndicatorPalette();
    pal_fill_black();
    sub_80FE7EC(CreateTask(sub_8100334, 8));
}

bool8 sub_810038C(u8 taskId)
{
    s16 *data;
    data = gTasks[taskId].data;
    if (gUnknown_020391AA == DIR_SOUTH && data[1] - data[6] - 6 < 0)
    {
        data[1]++;
        return 0;
    } else if (gUnknown_020391AA == DIR_NORTH && data[1] - 7 >= gMapHeader.mapData->height)
    {
        data[1]--;
        return 0;
    } else if (gUnknown_020391AA == DIR_WEST && data[0] - 7 < 0)
    {
        data[0]++;
        return 0;
    } else if (gUnknown_020391AA == DIR_EAST && data[0] + data[5] - 8 >= gMapHeader.mapData->width)
    {
        data[0]--;
        return 0;
    }
    return 1;
}

bool8 sub_8100430(void)
{
    if ((gMain.heldKeys & 0x00F0) != 0x0040 && (gMain.heldKeys & 0x00F0) != 0x0080 && (gMain.heldKeys & 0x00F0) != 0x0020 && (gMain.heldKeys & 0x00F0) != 0x0010)
    {
        return 0;
    }
    return 1;
}

void sub_810045C(void)
{
    gUnknown_020391AA = 0;
    gSprites[gUnknown_020391A8].data[2] = 0;
    gSprites[gUnknown_020391A8].data[3] = 0;
}

void sub_8100494(u8 taskId)
{
    if (!gSprites[gUnknown_020391A8].data[4])
    {
        if (gTasks[taskId].data[10] == 1)
        {
            gUnknown_083EC96C[gTasks[taskId].data[12]].yesFunc(taskId);
            return;
        } else if (gTasks[taskId].data[10] == 2)
        {
            gUnknown_083EC96C[gTasks[taskId].data[12]].noFunc(taskId);
            return;
        }
        if ((gMain.heldKeys & 0x00F0) == 0x0040)
        {
            gUnknown_020391AA = DIR_SOUTH;
            gSprites[gUnknown_020391A8].data[2] = 0;
            gSprites[gUnknown_020391A8].data[3] = -2;
            gTasks[taskId].data[1]--;
        }
        if ((gMain.heldKeys & 0x00F0) == 0x0080)
        {
            gUnknown_020391AA = DIR_NORTH;
            gSprites[gUnknown_020391A8].data[2] = 0;
            gSprites[gUnknown_020391A8].data[3] = 2;
            gTasks[taskId].data[1]++;
        }
        if ((gMain.heldKeys & 0x00F0) == 0x0020)
        {
            gUnknown_020391AA = DIR_WEST;
            gSprites[gUnknown_020391A8].data[2] = -2;
            gSprites[gUnknown_020391A8].data[3] = 0;
            gTasks[taskId].data[0]--;
        }
        if ((gMain.heldKeys & 0x00F0) == 0x0010)
        {
            gUnknown_020391AA = DIR_EAST;
            gSprites[gUnknown_020391A8].data[2] = 2;
            gSprites[gUnknown_020391A8].data[3] = 0;
            gTasks[taskId].data[0]++;
        }
        if (!sub_8100430() || !sub_810038C(taskId))
        {
            sub_810045C();
        }
    }
    if (gUnknown_020391AA)
    {
        gSprites[gUnknown_020391A8].data[4]++;
        gSprites[gUnknown_020391A8].data[4] &= 7;
    }
    if (!gTasks[taskId].data[10])
    {
        if (gMain.newKeys & 0x0001)
        {
            gTasks[taskId].data[10] = 0x0001;
        }
        if (gMain.newKeys & 0x0002)
        {
            gTasks[taskId].data[10] = 0x0002;
        }
    }
}

void sub_810065C(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    gSprites[gUnknown_020391A8].data[7] = 0;
    gTasks[taskId].data[10] = 0;
    gTasks[taskId].func = sub_8100494;
}

void sub_81006A8(u8 taskId)
{
    if ((gMain.newKeys & 0x0001) || (gMain.newKeys & 0x0002))
    {
        sub_810065C(taskId);
    }
}

void sub_81006D0(struct UnkStruct_02038900 *unk_02038900)
{
    u16 i;
    for (i=0; i<0x800; i++)
    {
        unk_02038900->image[i] = 0;
    }
    for (i=0; i<0x40; i++)
    {
        unk_02038900->tiles[i] = 0;
    }
}

void sub_810070C(u16 *a0, u16 a1)
{
    u16 i;
    for (i=0; i<16; i++)
    {
        a0[i] = ((u16 *)gMapHeader.mapData->primaryTileset->palettes)[16 * a1 + i];
    }
}

void sub_8100740(u8 *dest, u16 flags)
{
    u8 buffer[32];
    u16 mode;
    u16 i;
    mode = flags >> 10;
    if (flags != 0)
    {
        flags &= 0x3ff;
    }
    for (i=0; i<32; i++)
    {
        buffer[i] = ((u8 *)gMapHeader.mapData->primaryTileset->tiles)[flags * 32 + i];
    }
    switch (mode)
    {
        case 0:
            for (i=0; i<32; i++)
            {
                dest[i] = buffer[i];
            }
            break;
        case 1:
            for (i=0; i<8; i++)
            {
                dest[4*i] = (buffer[4*(i+1) - 1] >> 4) + ((buffer[4*(i+1) - 1] & 0xf) << 4);
                dest[4*i + 1] = (buffer[4*(i+1) - 2] >> 4) + ((buffer[4*(i+1) - 2] & 0xf) << 4);
                dest[4*i + 2] = (buffer[4*(i+1) - 3] >> 4) + ((buffer[4*(i+1) - 3] & 0xf) << 4);
                dest[4*i + 3] = (buffer[4*(i+1) - 4] >> 4) + ((buffer[4*(i+1) - 4] & 0xf) << 4);
            }
            break;
        case 2:
            for (i=0; i<8; i++)
            {
                dest[4*i] = buffer[4*(7-i)];
                dest[4*i + 1] = buffer[4*(7-i) + 1];
                dest[4*i + 2] = buffer[4*(7-i) + 2];
                dest[4*i + 3] = buffer[4*(7-i) + 3];
            }
            break;
        case 3:
            for (i=0; i<32; i++)
            {
                dest[i] = (buffer[31-i] >> 4) + ((buffer[31-i] & 0xf) << 4);
            }
            break;
    }
}

void sub_8100874(struct UnkStruct_02038900 *unk_02038900)
{
    u16 i;
    for (i=0; i<0x40; i++)
        sub_8100740(&unk_02038900->image[i * 32], unk_02038900->tiles[i]);
}

u16 sub_810089C(u16 a0)
{
    return ((u16 *)gMapHeader.mapData->secondaryTileset->metatiles)[a0] & 0xfff;
}

void sub_81008BC(struct UnkStruct_02038900 *unk_02038900)
{
    u8 i;
    u8 shape;
    shape = unk_02038900->decoration->shape;
    for (i=0; i<gUnknown_083EC860[shape].size; i++)
    {
        unk_02038900->tiles[gUnknown_083EC860[shape].tiles[i]] = sub_810089C(unk_02038900->decoration->tiles[gUnknown_083EC860[shape].y[i]] * 8 + gUnknown_083EC860[shape].x[i]);
    }
}

void sub_8100930(u8 decoShape)
{
    gUnknown_020391AC.y = 0;
    gUnknown_020391AC.affineMode = 0;
    gUnknown_020391AC.objMode = 0;
    gUnknown_020391AC.mosaic = 0;
    gUnknown_020391AC.bpp = 0;
    gUnknown_020391AC.shape = gUnknown_083EC900[decoShape].shape;
    gUnknown_020391AC.x = 0;
    gUnknown_020391AC.matrixNum = 0;
    gUnknown_020391AC.size = gUnknown_083EC900[decoShape].size;
    gUnknown_020391AC.tileNum = 0;
    gUnknown_020391AC.priority = 1;
    gUnknown_020391AC.paletteNum = 0;
}

void sub_81009A8(struct Sprite *sprite)
{
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
    sprite->data[6] = 0;
    sprite->data[7] = 0;
    sprite->callback = sub_81009C0;
}

void sub_81009C0(struct Sprite *sprite)
{
    if (sprite->data[7] == 0)
    {
        if (sprite->data[6] < 15)
        {
            sprite->invisible = 0;
        } else
        {
            sprite->invisible = 1;
        }
        sprite->data[6] = (sprite->data[6] + 1) & 0x1f;
    } else
    {
        sprite->invisible = 0;
    }
}

void sub_8100A0C(u8 taskId)
{
    if (sub_8100D38(taskId) == 1)
    {
        fade_screen(1, 0);
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].func = sub_8100E70;
    } else
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecorInUse, sub_80FE428, 0);
    }
}

void sub_8100A60(u8 a0)
{
    (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[a0] = 0;
    (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos[a0] = 0;
}

void sub_8100A7C(void)
{
    u16 i;
    gSpecialVar_0x8005 = 0;
    gScriptResult = 0;
    if (gSpecialVar_0x8004 == gUnknown_02039234)
    {
        gScriptResult = 1;
    } else if (gDecorations[(*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[gUnknown_020391B4[gSpecialVar_0x8004].decorId]].permission == DECORPERM_SOLID_MAT)
    {
        gSpecialVar_0x8005 = gUnknown_020391B4[gSpecialVar_0x8004].flagId;
        sub_8100A60(gUnknown_020391B4[gSpecialVar_0x8004].decorId);
        for (i=0; i<gMapHeader.events->mapObjectCount; i++)
        {
            if (gMapHeader.events->mapObjects[i].flagId == gSpecialVar_0x8005)
            {
                gSpecialVar_0x8006 = gMapHeader.events->mapObjects[i].localId;
                break;
            }
        }
    }
}

void sub_8100B20(void)
{
    u8 i;
    for (i=0; i<gMapHeader.events->mapObjectCount; i++)
    {
        if (gMapHeader.events->mapObjects[i].flagId == gSpecialVar_0x8004)
        {
            gSpecialVar_0x8005 = gMapHeader.events->mapObjects[i].localId;
            break;
        }
    }
}

void sub_8100B6C(void)
{
    u8 i;
    u8 j;
    u8 k;
    u8 x;
    u8 y;
    u8 permission;
    for (i=0; i<gUnknown_02039234; i++)
    {
        permission = gDecorations[(*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[gUnknown_020391B4[i].decorId]].permission;
        x = (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos[gUnknown_020391B4[i].decorId] >> 4;
        y = (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos[gUnknown_020391B4[i].decorId] & 0xf;
        if (permission != DECORPERM_SOLID_MAT)
        {
            if ((*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[gUnknown_020391B4[i].decorId] == DECOR_SAND_ORNAMENT && MapGridGetMetatileIdAt(x + 7, y + 7) == 0x28c)
            {
                gUnknown_020391B4[i].height++;
            }
            for (j=0; j<gUnknown_020391B4[i].height; j++)
            {
                for (k=0; k<gUnknown_020391B4[i].width; k++)
                {
                    MapGridSetMetatileEntryAt(x + 7 + k, y + 7 - j, ((u16 *)gMapHeader.mapData->map)[(x + k) + gMapHeader.mapData->width * (y - j)] | 0x3000);
                }
            }
            sub_8100A60(gUnknown_020391B4[i].decorId);
        }
    }
}

void sub_8100C88(u8 taskId)
{
    switch (gTasks[taskId].data[2])
    {
        case 0:
            sub_8100B6C();
            gTasks[taskId].data[2] = 1;
            break;
        case 1:
            if (!gPaletteFade.active)
            {
                DrawWholeMapView();
                ScriptContext1_SetupScript(gUnknown_081A2F8A);
                MenuZeroFillWindowRect(0, 0, 29, 19);
                gTasks[taskId].data[2] = 2;
            }
            break;
        case 2:
            ScriptContext2_Enable();
            sub_80FED90(taskId);
            pal_fill_black();
            gTasks[taskId].data[2] = 3;
            break;
        case 3:
            if (sub_807D770() == 1)
            {
                gTasks[taskId].data[13] = -1;
                DisplayItemMessageOnField(taskId, gSecretBaseText_DecorReturned, sub_81010F0, 0);
            }
            break;
    }
}

bool8 sub_8100D38(u8 taskId)
{
    u16 i;
    for (i=0; i<(*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).size; i++)
    {
        if ((*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[i] != 0)
        {
            gTasks[taskId].data[13] = i;
            return 1;
        }
    }
    return 0;
}

void SetUpPuttingAwayDecorationPlayerAvatar(void)
{
    player_get_direction_lower_nybble();
    MenuZeroFillWindowRect(0, 0, 29, 19);
    gUnknown_020391A8 = gSprites[gUnknown_03004880.unk4].data[0];
    sub_81016C8();
    gUnknown_03004880.unk4 = CreateSprite(&gSpriteTemplate_83ECA88, 0x78, 0x50, 0);
    if (gSaveBlock2.playerGender == MALE)
    {
        gUnknown_020391A9 = AddPseudoFieldObject(0xc1, SpriteCallbackDummy, 0x88, 0x48, 0);
    } else
    {
        gUnknown_020391A9 = AddPseudoFieldObject(0xc2, SpriteCallbackDummy, 0x88, 0x48, 0);
    }
    gSprites[gUnknown_020391A9].oam.priority = 1;
    DestroySprite(&gSprites[gUnknown_020391A8]);
    gUnknown_020391A8 = gUnknown_03004880.unk4;
    gSprites[gUnknown_020391A8].oam.priority = 1;
}

void sub_8100E70(u8 taskId)
{
    s16 *data;
    data = gTasks[taskId].data;
    switch (data[2])
    {
        case 0:
            if (!gPaletteFade.active)
            {
                sub_80FF0E0(taskId);
                data[2] = 1;
                data[6] = 1;
                data[5] = 1;
                HandleDestroyMenuCursors();
            }
            break;
        case 1:
            SetUpPuttingAwayDecorationPlayerAvatar();
            pal_fill_black();
            data[2] = 2;
            break;
        case 2:
            if (sub_807D770() == 1)
            {
                data[12] = 1;
                sub_8100EEC(taskId);
            }
            break;
    }
}

void sub_8100EEC(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    gSprites[gUnknown_020391A8].data[7] = 0;
    gSprites[gUnknown_020391A8].invisible = 0;
    gSprites[gUnknown_020391A8].callback = sub_8101698;
    gSprites[gUnknown_020391A9].pos1.x = 0x88;
    gSprites[gUnknown_020391A9].pos1.y = 0x48;
    gTasks[taskId].data[10] = 0;
    gTasks[taskId].func = sub_8100494;
}

void sub_8100F88(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    sub_810045C();
    sub_8101024(taskId);
}

void sub_8100FB4(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    sub_810045C();
    gSprites[gUnknown_020391A8].invisible = 0;
    gSprites[gUnknown_020391A8].callback = SpriteCallbackDummy;
    DisplayItemMessageOnField(taskId, gSecretBaseText_StopPuttingAwayDecor, sub_810156C, 0);
}

void sub_8101024(u8 taskId)
{
    u8 mtBehavior;
    s16 *data;
    sub_8101460(taskId);
    if (gUnknown_02039234 != 0)
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_ReturnDecor, sub_8101518, 0);
    } else
    {
        data = gTasks[taskId].data;
        mtBehavior = MapGridGetMetatileBehaviorAt(data[0], data[1]);
        if (MetatileBehavior_IsSecretBasePC(mtBehavior) == 1 || sub_805738C(mtBehavior) == 1)
        {
            gSprites[gUnknown_020391A8].invisible = 0;
            gSprites[gUnknown_020391A8].callback = SpriteCallbackDummy;
            DisplayItemMessageOnField(taskId, gSecretBaseText_StopPuttingAwayDecor, sub_810156C, 0);
        } else
        {
            DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecor, sub_81010F0, 0);
        }
    }
}

void sub_81010F0(u8 taskId)
{
    if ((gMain.newKeys & 0x0001) || (gMain.newKeys & 0x0002))
    {
        sub_8100EEC(taskId);
    }
}

void sub_8101118(u8 decorIdx, struct UnkStruct_020391B4 *unk_020391B4)
{
    if (gDecorations[decorIdx].shape == DECORSHAPE_1x1)
    {
        unk_020391B4->width = 1;
        unk_020391B4->height = 1;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_2x1)
    {
        unk_020391B4->width = 2;
        unk_020391B4->height = 1;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_3x1)
    {
        unk_020391B4->width = 3;
        unk_020391B4->height = 1;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_4x2)
    {
        unk_020391B4->width = 4;
        unk_020391B4->height = 2;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_2x2)
    {
        unk_020391B4->width = 2;
        unk_020391B4->height = 2;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_1x2)
    {
        unk_020391B4->width = 1;
        unk_020391B4->height = 2;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_1x3)
    {
        unk_020391B4->width = 1;
        unk_020391B4->height = 3;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_2x4)
    {
        unk_020391B4->width = 2;
        unk_020391B4->height = 4;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_3x3)
    {
        unk_020391B4->width = 3;
        unk_020391B4->height = 3;
    } else if (gDecorations[decorIdx].shape == DECORSHAPE_3x2)
    {
        unk_020391B4->width = 3;
        unk_020391B4->height = 2;
    }
}

void sub_8101198(u8 x, u8 y)
{
    gSprites[gUnknown_020391A8].invisible = 1;
    gSprites[gUnknown_020391A8].callback = SpriteCallbackDummy;
    gSprites[gUnknown_020391A9].pos1.x = 0x88 + x * 16;
    gSprites[gUnknown_020391A9].pos1.y = 0x48 + y * 16;
}

bool8 sub_8101200(u8 taskId, u8 decorIdx, struct UnkStruct_020391B4 *unk_020391B4)
{
    u8 x;
    u8 y;
    u8 xOff;
    u8 yOff;
    x = gTasks[taskId].data[0] - 7;
    y = gTasks[taskId].data[1] - 7;
    xOff = (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos[decorIdx] >> 4;
    yOff = (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos[decorIdx] & 0xf;
    if ((*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[decorIdx] == DECOR_SAND_ORNAMENT && MapGridGetMetatileIdAt(xOff + 7, yOff + 7) == 0x28c)
    {
        unk_020391B4->height--;
    }
    if (x >= xOff && x < xOff + unk_020391B4->width && y > yOff - unk_020391B4->height && y <= yOff)
    {
        sub_8101198(unk_020391B4->width - (x - xOff + 1), yOff - y);
        return 1;
    }
    return 0;
}

void sub_81012A0(void)
{
    u8 xOff;
    u8 yOff;
    u16 i;
    xOff = (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos[gUnknown_020391B4[gUnknown_02039234].decorId] >> 4;
    yOff = (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos[gUnknown_020391B4[gUnknown_02039234].decorId] & 0xf;
    for (i=0; i<0x40; i++)
    {
        if (gSaveBlock1.mapObjectTemplates[i].x == xOff && gSaveBlock1.mapObjectTemplates[i].y == yOff && !FlagGet(gSaveBlock1.mapObjectTemplates[i].flagId))
        {
            gUnknown_020391B4[gUnknown_02039234].flagId = gSaveBlock1.mapObjectTemplates[i].flagId;
            break;
        }
    }
}

bool8 sub_8101340(u8 taskId)
{
    u16 i;
    for (i=0; i<(*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).size; i++)
    {
        if ((*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[i] != 0)
        {
            if (gDecorations[(*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[i]].permission == DECORPERM_SOLID_MAT)
            {
                sub_8101118((*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[i], gUnknown_020391B4);
                if (sub_8101200(taskId, i, gUnknown_020391B4) == 1)
                {
                    gUnknown_020391B4->decorId = i;
                    sub_81012A0();
                    gUnknown_02039234 = 1;
                    return 1;
                }
            }
        }
    }
    return 0;
}

void sub_81013B8(u8 a0, u8 a1, u8 a2, u8 a3)
{
    u8 i;
    u8 xOff;
    u8 yOff;
    u8 decorIdx;
    for (i=0; i<(*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).size; i++)
    {
        decorIdx = (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).items[i];
        xOff = (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos[i] >> 4;
        yOff = (*(struct DecoPCPointers *)(gSharedMem + 0x1f000)).pos[i] & 0xf;
        if (decorIdx != 0 && gDecorations[decorIdx].permission == DECORPERM_SOLID_MAT && a0 <= xOff && a1 <= yOff && a2 >= xOff && a3 >= yOff)
        {
            gUnknown_020391B4[gUnknown_02039234].decorId = i;
            sub_81012A0();
            gUnknown_02039234++;
        }
    }
}
# 3280 "src/field/decoration.c"
__attribute__((naked))
void sub_8101460(u8 taskId)
{
    asm(".syntax unified\n"
    "\tpush {r4-r7,lr}\n"
    "\tlsls r0, 24\n"
    "\tlsrs r6, r0, 24\n"
    "\tldr r4, _081014B8 @ =gUnknown_02039234\n"
    "\tmovs r0, 0\n"
    "\tstrb r0, [r4]\n"
    "\tadds r0, r6, 0\n"
    "\tbl sub_8101340\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tcmp r0, 0x1\n"
    "\tbeq _08101504\n"
    "\tmovs r5, 0\n"
    "\tldr r0, _081014BC @ =ewram_1f000\n"
    "\tldrb r1, [r0, 0x8]\n"
    "\tcmp r5, r1\n"
    "\tbcs _081014D2\n"
    "\tadds r7, r4, 0\n"
    "_08101486:\n"
    "\tldr r0, [r0]\n"
    "\tadds r0, r5\n"
    "\tldrb r1, [r0] @ compiler incorrectly uses r0 for this and the next instruction\n"
    "\tcmp r1, 0\n"
    "\tbeq _081014C4\n"
    "\tldr r4, _081014C0 @ =gUnknown_020391B4\n"
    "\tadds r0, r1, 0\n"
    "\tadds r1, r4, 0\n"
    "\tbl sub_8101118\n"
    "\tadds r0, r6, 0\n"
    "\tadds r1, r5, 0\n"
    "\tadds r2, r4, 0\n"
    "\tbl sub_8101200\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tcmp r0, 0x1\n"
    "\tbne _081014C4\n"
    "\tstrb r5, [r4]\n"
    "\tldrb r0, [r7]\n"
    "\tadds r0, 0x1\n"
    "\tstrb r0, [r7]\n"
    "\tb _081014D2\n"
    "\t.align 2, 0\n"
    "_081014B8: .4byte gUnknown_02039234\n"
    "_081014BC: .4byte 0x201f000\n"
    "_081014C0: .4byte gUnknown_020391B4\n"
    "_081014C4:\n"
    "\tadds r0, r5, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r5, r0, 24\n"
    "\tldr r0, _0810150C @ =ewram_1f000\n"
    "\tldrb r1, [r0, 0x8]\n"
    "\tcmp r5, r1\n"
    "\tbcc _08101486\n"
    "_081014D2:\n"
    "\tldr r0, _08101510 @ =gUnknown_02039234\n"
    "\tldrb r0, [r0]\n"
    "\tcmp r0, 0\n"
    "\tbeq _08101504\n"
    "\tldr r0, _0810150C @ =ewram_1f000\n"
    "\tldr r2, _08101514 @ =gUnknown_020391B4\n"
    "\tldrb r1, [r2]\n"
    "\tldr r0, [r0, 0x4]\n"
    "\tadds r0, r1\n"
    "\tldrb r1, [r0]\n"
    "\tlsrs r0, r1, 4\n"
    "\tmovs r3, 0xF\n"
    "\tands r3, r1\n"
    "\tldrb r1, [r2, 0x2]\n"
    "\tsubs r1, r3, r1\n"
    "\tadds r1, 0x1\n"
    "\tlsls r1, 24\n"
    "\tlsrs r1, 24\n"
    "\tldrb r2, [r2, 0x1]\n"
    "\tadds r2, r0\n"
    "\tsubs r2, 0x1\n"
    "\tlsls r2, 24\n"
    "\tlsrs r2, 24\n"
    "\tbl sub_81013B8\n"
    "_08101504:\n"
    "\tpop {r4-r7}\n"
    "\tpop {r0}\n"
    "\tbx r0\n"
    "\t.align 2, 0\n"
    "_0810150C: .4byte 0x201f000\n"
    "_08101510: .4byte gUnknown_02039234\n"
    "_08101514: .4byte gUnknown_020391B4\n"
    ".syntax divided\n");
}


void sub_8101518(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    DoYesNoFuncWithChoice(taskId, &gUnknown_083EC9CC);
}

void sub_810153C(u8 taskId)
{
    fade_screen(1, 0);
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].func = sub_8100C88;
}

void sub_810156C(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    DoYesNoFuncWithChoice(taskId, &gUnknown_083EC9D4);
}

void sub_8101590(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    sub_81015B0(taskId);
}

void sub_81015B0(u8 taskId)
{
    fade_screen(1, 0);
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].func = sub_81015E0;
}

void sub_81015E0(u8 taskId)
{
    switch (gTasks[taskId].data[2])
    {
        case 0:
            if (!gPaletteFade.active)
            {
                sub_80FF114(taskId);
                gTasks[taskId].data[2] = 1;
            }
            break;
        case 1:
            sub_81016F4();
            gFieldCallback = sub_8101678;
            SetMainCallback2(c2_exit_to_overworld_2_switch);
            DestroyTask(taskId);
            break;
    }
}

void sub_8101648(u8 taskId)
{
    if (sub_807D770() == 1)
    {
        gTasks[taskId].func = Task_DecorationPCProcessMenuInput;
    }
}

void sub_8101678(void)
{
    pal_fill_black();
    MenuDisplayMessageBox();
    sub_80FE220();
    CreateTask(sub_8101648, 8);
}

void sub_8101698(struct Sprite *sprite)
{
    sprite->data[0] = (sprite->data[0] + 1) & 0x1f;
    if (sprite->data[0] >= 16)
    {
        sprite->invisible = 1;
    } else
    {
        sprite->invisible = 0;
    }
}

void sub_81016C8(void)
{
    if (gSaveBlock2.playerGender == MALE)
    {
        LoadSpritePalette(&gUnknown_083ECA5C);
    } else
    {
        LoadSpritePalette(&gUnknown_083ECA64);
    }
}

void sub_81016F4(void)
{
    FreeSpritePaletteByTag(8);
}

void sub_8101700(u8 taskId)
{
    if (!sub_81341D4())
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecors, sub_80FE428, 0);
    } else
    {
        gTasks[taskId].data[11] = 1;
        gUnknown_020388F6 = 0;
        sub_80FE5AC(taskId);
    }
}

void sub_8101750(u8 taskId)
{
    if (!sub_81341D4())
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecors, sub_80FE428, 0);
    } else
    {
        gTasks[taskId].data[11] = 2;
        gUnknown_020388F6 = 0;
        sub_80FE5AC(taskId);
    }
}

void sub_81017A0(u8 taskId)
{
    sub_80FEF74();
    sub_80FED1C();
    if (sub_80FEFA4() == 1)
    {
        StringCopy(gStringVar1, gDecorations[gUnknown_020388D0[gUnknown_020388F5]].name);
        StringExpandPlaceholders(gStringVar4, gSecretBaseText_WillBeDiscarded);
        DisplayItemMessageOnField(taskId, gStringVar4, sub_8101824, 0);
    } else
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_DecorInUse, sub_80FEFF4, 0);
    }
}

void sub_8101824(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    DoYesNoFuncWithChoice(taskId, &gUnknown_083ECAA0);
}

void sub_8101848(u8 taskId)
{
    MenuZeroFillWindowRect(20, 8, 27, 14);
    sub_8109A30(gUnknown_020388D0[gUnknown_020388F5]);
    gUnknown_020388D0[gUnknown_020388F5] = DECOR_NONE;
    sub_80FF098(taskId);
    DisplayItemMessageOnField(taskId, gSecretBaseText_DecorThrownAway, sub_80FEFF4, 0);
}
